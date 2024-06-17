CLASS FabMultiPage
//p MultiPage Image Manipulation
//d This class encapsulate MultiPages services of the FabPaint Library
	//
	EXPORT pMultiObject	AS	PTR
	// Owner to notify any changes
	// Object, so same version for VO-GUI or ClassMate.
	PROTECT oOwner		AS	OBJECT
	// Please, don't notify my owner...
	PROTECT lSuspendNotification	AS	LOGIC
	//
	protect aLockPages as array
	//
	
	
	



METHOD __NotifyOwner( symEvent AS SYMBOL ) AS VOID PASCAL 
	//
	IF ( SELF:oOwner != NULL_OBJECT )
		IF IsMethod( SELF:oOwner, #OnFabPaintLibMulti )  .AND. !SELF:lSuspendNotification
			Send( SELF:oOwner, #OnFabPaintLibMulti, SELF, symEvent )
		ENDIF
	ENDIF
	//
return

METHOD AddPage( oImage AS FabPaintLib ) AS VOID PASCAL 
//p Add a new Page
//p WARNING : Page number is zero-based
	//
	IF SELF:IsValid
		//
		MultiAddPage( SELF:pMultiObject, oImage:pDibObject )
	ENDIF
RETURN

DESTRUCTOR() 
	//
	SELF:Destroy()
	//
	IF !InCollect()
		UnRegisterAxit( SELF )
	ENDIF
	//
RETURN self

METHOD CloneImage( nPage as LONGINT ) as FabPaintLib PASCAL 
//r The new FabPaintLib object
//p Get a page as an Image.
//p The Image is a copy of the page. 
//p WARNING : Page number is zero-based

	LOCAL pCopy	AS	PTR
	LOCAL oNew	AS	FabPaintLib
	//
	IF SELF:IsValid
		pCopy := MultiClonePage( self:pMultiObject, nPage)
		oNew := FabPaintLib{ pCopy }
	ENDIF
RETURN oNew


METHOD Create( cFile as STRING ) as LOGIC PASCAL 
//p Initialize an new Multi Page File
//a <cFile> Name of the file to read.
//d This method will read the indicated file, and initialize the object.
//d The image can be any of : .TIF, .GIF
//r A logical value indicating the success of the operation
	//
	self:Destroy()
	self:pMultiObject := MultiCreateFromFile( String2Psz( cFile ), true, false )
	//
	self:__NotifyOwner( #CreateFromFile )
	//
RETURN self:IsValid


METHOD CreateFromFile( cFile AS STRING ) AS LOGIC PASCAL 
//p Initialize from a Multi Page File
//a <cFile> Name of the file to read.
//d This method will read the indicated file, and initialize the object.
//d The image can be any of : .TIF, .GIF
//r A logical value indicating the success of the operation
	//
	SELF:Destroy()
	self:pMultiObject := MultiCreateFromFile( String2Psz( cFile ), false, false )
	//
	SELF:__NotifyOwner( #CreateFromFile )
	//
RETURN SELF:IsValid


METHOD DeletePage( nPos AS INT ) AS VOID PASCAL 
//p Delete a Page
//p WARNING : Page number is zero-based
	//
	IF SELF:IsValid
		//
		MultiDelPage( SELF:pMultiObject, nPos )
	ENDIF
return

METHOD Destroy() AS VOID PASCAL 
//p Delete the underlying DIB Object
//d this Method will close the MultiPage Object, and apply any modifications done
//d like delete, add, insert pages
	local oImage as FabPaintLib
	//
	IF self:IsValid
		// Are there still locked pages ?
		if ( ALen( self:aLockPages ) >0 )
			// Sorry, will have to unlock them first
			// You haven't done it....All changes are lost.....
			while ( ALen( self:aLockPages) > 0 )
				// The array shrinks when we unlock a page, so works like a stack
				oImage := self:aLockPages[ 1 ]
				self:UnlockPage( oImage, false )
			enddo 
		endif 
		//
		MultiClose( SELF:pMultiObject )
		MultiDelete( SELF:pMultiObject )
		SELF:pMultiObject := NULL_PTR
		//
		SELF:__NotifyOwner( #Destroy )
		//
	ENDIF
	//
return


CONSTRUCTOR( cFile, oOwner ) 
//p Initialize a FabMultiPage object
//a <cFile> Name of the file to use to initialize the object
//a If Empty, the FabMultiPage object is uninitialized
//a <oOwner> An object, that want to receive notifications from the
//a FabMultiPage object when it change.
	//
	IF IsObject( oOwner )
		SELF:oOwner := oOwner
	ENDIF
	//
	IF IsString( cFile )
		//
		SELF:CreateFromFile( cFile )
		//
	ELSEIF IsPtr( cFile )
		// This might be an already created C++ Object ( See Copy )
		SELF:pMultiObject := cFile
		SELF:__NotifyOwner( #InitPTR )
	ENDIF
	//
	self:aLockPages := {}
	//
	RegisterAxit( SELF )
	//
return self

METHOD InsertPage( oImage AS FabPaintLib, nPos AS INT ) AS VOID PASCAL 
//p Insert a new Page
//p WARNING : Page number is zero-based
	//
	IF SELF:IsValid
		//
		MultiInsPage( SELF:pMultiObject, oImage:pDibObject, nPos )
	ENDIF
return

ACCESS IsValid AS LOGIC PASCAL 
//r A logical value indicating if the object is linked to an image.
RETURN ( SELF:pMultiObject != NULL_PTR )
		

METHOD LockPage( nPage as LONGINT ) as FabPaintLib PASCAL 
//r The new FabPaintLib object
//p Get a page as an Image.
//p The Image is the original image of the page.
//p YOU MUST UNLOCK THE IMAGE 
//p WARNING : Page number is zero-based
	LOCAL pCopy	as	ptr
	LOCAL oNew	as	FabPaintLib
	//
	IF self:IsValid
		pCopy := MultiClonePage( self:pMultiObject, nPage)
		oNew := FabPaintLib{ pCopy, null_object, self }
		// Track objects
		AAdd( self:aLockPages, oNew )
	ENDIF
RETURN oNew 



ACCESS PageCount AS LONGINT PASCAL 
	LOCAL nPages AS LONGINT
	//
	IF SELF:IsValid
		nPages := MultiPageCount( SELF:pMultiObject )
	ENDIF
RETURN nPages


METHOD UnlockPage( oImage as FabPaintLib, lApplyChanges as logic ) as void PASCAL 
//r The new FabPaintLib object
//p Get a page as an Image.
//p The Image is the original image of the page.
//p YOU MUST UNLOCK THE IMAGE 
//p WARNING : Page number is zero-based
	local nFoundAt as dword
	//
	IF self:IsValid  .and. oImage:IsValid
		// Known Page ?
		nFoundAt := AScanExact( self:aLockPages, oImage ) 
		//
		if ( nFoundAt != 0 )
			//
			MultiUnlockPage( self:pMultiObject, oImage:pDibObject, lApplyChanges )
			//
			ADel( self:aLockPages, nFoundAt )
			ASize( self:aLockPages, ALen( self:aLockPages)-1)
		endif 
		//			 
	ENDIF
RETURN 






END CLASS
