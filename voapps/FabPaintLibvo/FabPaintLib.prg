CLASS FabPaintLib
//p Image Manipulation
//d This class encapsulate all services of the FabPaint Library
//d For more info take a look at the DIBxxx() function or at the available demo applications.
//d When creating a FabPaintLib object, you can indicate a Owner of the object.
//d If so, any change to the image ( Creation, Resize, .... ) will trigger
//d a notification to the owner.
//d To catch this notification, the owner must provide a method called OnFabPaintLib with the following
//d prototype :
//d METHOD OnFabPaintLib( oFabPaintLibObject, synEvent ) CLASS TheOwnerOfTheObject
//d <oFabPaintLibObject> is the FabPaintLib object that produce the notification itself
//d <symEvent> is a SYMBOL value that indicate what change produce the notification.
	// PTR to Dib C++ Object
//	PROTECT pDibObject	AS	PTR
	EXPORT pDibObject					as	ptr
	// Owner to notify any changes
	// Object, so same version for VO-GUI or ClassMate.
	PROTECT oOwner						as	OBJECT
	// Please, don't notify my owner...
	PROTECT lSuspendNotification	as	LOGIC
	// a MultiPage Object that owns the Image
	protect oContainer 				as FabMultiPage
	//
	protect nExifModel				as	long
	protect cAsStringFileFormat 	as string
	
	
	

	
	
	
	

METHOD __NotifyOwner( symEvent AS SYMBOL ) AS VOID PASCAL 
	//
	IF ( SELF:oOwner != NULL_OBJECT )
		IF IsMethod( SELF:oOwner, #OnFabPaintLib )  .AND. !SELF:lSuspendNotification
			Send( SELF:oOwner, #OnFabPaintLib, SELF, symEvent )
		ENDIF
	ENDIF
	//
return

ACCESS AsString as String PASCAL 
//r The Bitmap as a list of bytes, to be stored for eg. in a blob
	Local cFileContent as String
	Local nFif 			as DWORD
	local pBuffer		as	ptr
	local nSIze			as	dword 	           	
	//
	IF self:IsValid
		//
		Do case    
		case ( self:cAsStringFileFormat == "BMP" )
			nFif := 0 
		case ( self:cAsStringFileFormat == "ICO" )
			nFif := 1
		case ( self:cAsStringFileFormat == "JPG" )
			nFif := 2 
		case ( self:cAsStringFileFormat == "JPEG" )
			nFif := 2 
		case ( self:cAsStringFileFormat == "PCX" )
			nFif := 10 
		case ( self:cAsStringFileFormat == "PNG" )
			nFif := 13
		case ( self:cAsStringFileFormat == "TIF" )
			nFif := 18 
		case ( self:cAsStringFileFormat == "TIFF" )
			nFif := 18
		case ( self:cAsStringFileFormat == "GIF" )
			nFif := 25
		case ( self:cAsStringFileFormat == "J2K" )
			nFif := 30
		case ( self:cAsStringFileFormat == "JP2" )
			nFif := 30		
		endcase
		// Now Create the Memory Stream
		DIBCreateMemStream()
		// Save the Image to the Memory Stream
		DIBSaveToMemStream( self:pDibObject, nFif, 0 )
		// Now Retrieve the buffer where the memory is stored
		DIBAcquireMemStream( @pBuffer, @nSIze )
		// Now, convert to a string
		cFileContent := Mem2String( pBuffer, nSIze ) 
		// And don't forget to free the Memory Stream
		DIBDeleteMemStream()
	ENDIF
RETURN cFileContent
	
/*
	FIF_BMP		= 0,
	FIF_ICO		= 1,
	FIF_JPEG	= 2,
	FIF_JNG		= 3,
	FIF_KOALA	= 4,
	FIF_LBM		= 5,
	FIF_IFF = FIF_LBM,
	FIF_MNG		= 6,
	FIF_PBM		= 7,
	FIF_PBMRAW	= 8,
	FIF_PCD		= 9,
	FIF_PCX		= 10,
	FIF_PGM		= 11,
	FIF_PGMRAW	= 12,
	FIF_PNG		= 13,
	FIF_PPM		= 14,
	FIF_PPMRAW	= 15,
	FIF_RAS		= 16,
	FIF_TARGA	= 17,
	FIF_TIFF	= 18,
	FIF_WBMP	= 19,
	FIF_PSD		= 20,
	FIF_CUT		= 21,
	FIF_XBM		= 22,
	FIF_XPM		= 23,
	FIF_DDS		= 24,
	FIF_GIF     = 25,
	FIF_HDR		= 26,
	FIF_FAXG3	= 27,
	FIF_SGI		= 28,
	FIF_EXR		= 29,
	FIF_J2K		= 30,
	FIF_JP2		= 31
*/

Assign AsString( cFileContent as string ) as String PASCAL 
//r The Bitmap as a list of bytes, to be stored for eg. in a blob
	Local ptrData as ptr
	local nSize	as	dword
	//
	nSize := SLen( cFileContent )
	ptrData := StringAlloc( cFileContent )
	//
	self:CreateFromPtr( ptrData, nSize ) 
RETURN cFileContent
	

ACCESS AsStringFileFormat as String PASCAL 
//r The FileFormat to be used when using the Access AsString
RETURN self:cAsStringFileFormat
	

ASSIGN AsStringFileFormat( cFif as string ) as String PASCAL 
//r The FileFormat to be used when using the Access AsString
RETURN ( self:cAsStringFileFormat := Upper(cFif) )


DESTRUCTOR() 
	//
	SELF:Destroy()
	//
	IF !InCollect()
		UnRegisterAxit( SELF )
	ENDIF
	//
return self


ACCESS BitmapBits as ptr PASCAL 
	local pBits as ptr
	//
	if self:IsValid
		pBits := DIBGetBits( self:pDibObject )
	endif              
	//
RETURN pBits



ACCESS BitPerPixel AS WORD PASCAL 
//r The number of bit per pixel in the current image
	LOCAL pBmiH	AS	_winBitmapInfo
	LOCAL nBpp	AS	WORD
	//
	IF SELF:IsValid
		pBmiH   := DIBGetInfo( SELF:pDibObject )
		nBpp := pBmiH.bmiHeader.biBitCount
	ENDIF
RETURN nBpp
	

METHOD ChangeContrast( rContrast AS REAL8, bOffset AS BYTE ) AS VOID PASCAL 
//p Change the contrast of the image
//a <rContrast> is the slope of the function.
//a <bOffset> is the intensity at which the color stays the same.
//a Above this value, intensities are increased.
//a Below it, they are reduced.
//a With offset 128 and contrast 1, the image stays unchanged.
//d This function enhances or reduces the image contrast using a linear mapping
//d between input and output. The zero point (i. e., the intensity
//d that is neither enhanced nor reduced) has to be provided.
//d (A Contrast filter is defined in the following way: It lowers all
//d intensity values below a given threshold, and it raises them
//d beyond. Most applications position the threshold at 50 %. This
//d does not always yield the best results, especially if you have an
//d unbalanced dark/light ratio of pixels. The best you can do here
//d is play around with the threshold.)
//d As this operation only support 32 bpp, the image is converted to 32 bpp if necessary before proceeding.
	LOCAL pCopy	AS	PTR
	//
	IF SELF:IsValid
		IF ( SELF:BitPerPixel != 32 )
			pCopy := DIBCreateCopy( SELF:pDibObject, 32 )
			SELF:lSuspendNotification := TRUE
			SELF:Destroy()
			SELF:lSuspendNotification := FALSE
			SELF:pDibObject := pCopy
		ENDIF
		DIBContrast( SELF:pDibObject, rContrast, bOffset )
		//
		SELF:__NotifyOwner( #Contrast )
		//
	ENDIF
	//
return 

METHOD ChangeIntensity( rIntensity AS REAL8, bOffset AS BYTE, rExponent AS REAL8 ) AS VOID PASCAL 
//p Changes the intensity of the image.
//a <pWinBmp> 		Pointer to the existing DIB Object
//d Applies the factor intensityFactor = 1.0 + csupp * pow((v-m_offset), m_exponent)
//d with csupp = intensity/pow(255.0, m_exponent)
//d on the v-Value of the image after a HSV transform.
//d The bitmap stays unchanged for intensity = 20, offset = 128, exponent = 1.
//d As this operation only support 32 bpp, the image is converted to 32 bpp if necessary before proceeding.
	LOCAL pCopy	AS	PTR
	//
	IF SELF:IsValid
		IF ( SELF:BitPerPixel != 32 )
			pCopy := DIBCreateCopy( SELF:pDibObject, 32 )
			SELF:lSuspendNotification := TRUE
			SELF:Destroy()
			SELF:lSuspendNotification := FALSE
			SELF:pDibObject := pCopy
		ENDIF
		DIBIntensity( SELF:pDibObject, rIntensity, bOffset, rExponent )
		//
		SELF:__NotifyOwner( #Intensity )
		//
	ENDIF
	//
return


METHOD ChangeLightness( iLightness AS LONG ) AS VOID PASCAL 
//p Change the lightness of the image
//a <pWinBmp> 		Pointer to the existing DIB Object
//a <iLightness>	values must be in the range -100..100.
//a A value of 0 leaves the image unchanged.
//d As this operation only support 32 bpp, the image is converted to 32 bpp if necessary before proceeding.
	LOCAL pCopy	AS	PTR
	//
	IF SELF:IsValid
		IF ( SELF:BitPerPixel != 32 )
			pCopy := DIBCreateCopy( SELF:pDibObject, 32 )
			SELF:lSuspendNotification := TRUE
			SELF:Destroy()
			SELF:lSuspendNotification := FALSE
			SELF:pDibObject := pCopy
		ENDIF
		DIBLightness( SELF:pDibObject, iLightness )
		//
		SELF:__NotifyOwner( #Lightness )
		//
	ENDIF
	//   
return


METHOD Composite( lUSeFile as Logic, pRGB as _winRGBQUAD, oBackgroundImage as FabPaintLib ) as void PASCAL 
//a <lUseFile> use file as background ?
//a <pRGB> is a _WinRGBQUAD struct with background color
//a <oBackgroundImage> is a FabPaintLib object to use as background
//j FUNCTION:DIBStretchDrawDC
	local pDIB as ptr
	//
	IF self:IsValid
		if ( oBackgroundImage != null_object )
			pDIB := oBackgroundImage:pDibObject
		endif
		DIBComposite( self:pDibObject, lUSeFile, pRGB, pDIB )
	ENDIF
	//
return


METHOD Copy( bpp := 0 AS LONG ) AS FabPaintLib PASCAL 
//p Create a Copy of the object
//a <bpp> Number of Bit Per Pixel to use in the copy
//a Values can be 1,8,32.
//a 0,per default, means no change.
//r The new FabPaintLib object
	LOCAL pCopy	AS	PTR
	LOCAL oNew	AS	FabPaintLib
	//
	IF SELF:IsValid
		pCopy := DIBCreateCopy( SELF:pDibObject, bpp )
		oNew := FabPaintLib{ pCopy }
	ENDIF
	//
RETURN oNew


METHOD Create( nWidth:=16 AS LONG, nHeight := 16 AS LONG, nBpp := 8 AS WORD, lAlpha := FALSE  AS LOGIC ) AS LOGIC PASCAL 
//p Initialize an empty DIB Object
//r A logical value indicating the success of the operation
	//
	SELF:Destroy()
	SELF:pDibObject := DIBCreate( nWidth, nHeight, nBpp, lAlpha )
	//
	SELF:__NotifyOwner( #Create )
	//
RETURN SELF:IsValid


METHOD CreateFromFile( cFile AS STRING ) AS LOGIC PASCAL 
//p Initialize from a File
//a <cFile> Name of the file to read.
//d This method will read the indicated file, and initialize the object.
//d The image can be any of : .JPG, .TIF, .BMP, .TGA, .PNG, .PCX, or .PCT.
//r A logical value indicating the success of the operation
	//
	self:Destroy()
	cFile := Lower(Trim(cFile))
	if ( Right( cFile, 4 ) == ".ico" )
//		self:pDibObject := DIBCreateFromFileEx( String2Psz( cFile ), ICO_MAKEALPHA ) 
		self:pDibObject := DIBCreateFromFileEx( String2Psz( cFile ), 1 ) 
	else
		self:pDibObject := DIBCreateFromFile( String2Psz( cFile ) )
	endif
	//
	SELF:__NotifyOwner( #CreateFromFile )
	//
RETURN SELF:IsValid


METHOD CreateFromHBitmap( hBitmap AS PTR ) AS LOGIC PASCAL 
//p Initialize from bitmap Handle
//a <hBitmap>	Handle of the Bitmap to use to Initialize the object
//d This function copy the pixels in hBitmap to a DIB object
//r A logical value indicating the success of the operation
	//
	SELF:Destroy()
	SELF:pDibObject := DIBCreateFromHBitmap( hBitmap )
	//
	SELF:__NotifyOwner( #CreateFromHBitmap )
	//
RETURN SELF:IsValid


METHOD CreateFromHDib( hDib AS PTR ) AS LOGIC PASCAL 
//p Initialize from Device Independent Bitmap memory
//a <hDIB>	Handle of the DIB to use to Initialize the object
//d This function copy the pixels in hDIB to a DIB object
//r A logical value indicating the success of the operation
	//
	SELF:Destroy()
	SELF:pDibObject := DIBCreateFromHDib( hDib )
	//
	SELF:__NotifyOwner( #CreateFromHDib )
	//
RETURN SELF:IsValid
	

METHOD CreateFromPtr( pbImage as byte ptr, nSize as DWORD ) as LOGIC PASCAL 
//p Initialize from memory block
//a <pbImage>	Pointer to the memory block
//a <nSIze>		Size of the memory block
//d This function will read the indicated memory as if it was a file, and then
//d init the object. So you can copy a file to memory, with a ProgressBar, and then use this method.
//r A logical value indicating the success of the operation
	//
	SELF:Destroy()
	SELF:pDibObject := DIBCreateFromPTR( pbImage, nSize )
	//
	SELF:__NotifyOwner( #CreateFromPtr )
	//
RETURN SELF:IsValid


METHOD CreateFromResourceID(  hInst AS PTR, nID AS DWORD ) AS LOGIC PASCAL 
//p Initialize from bitmap resource ID
//a <hInst> Handle to the resource module handle
//a  This can be _GetInst() for the current Exe, or and result of LoadLibrary()
//a <nID> ID Number of the resource to use.
//d This function copy the pixels in the resource to a DIB object
//r A logical value indicating the success of the operation
	//
	SELF:Destroy()
	//
	SELF:pDibObject := DIBCreateFromResource( hInst, PTR(_CAST,nID) )
	//
	SELF:__NotifyOwner( #CreateFromResourceID )
	//
RETURN SELF:IsValid
		

METHOD CreateFromResourceName( hInst AS PTR, cResName AS STRING ) AS LOGIC PASCAL 
//p Initialize from bitmap resource name
//a <hInst> Handle to the resource module handle
//a  This can be _GetInst() for the current Exe, or and result of LoadLibrary()
//a <pszRes> Name of the resource to use.
//d This function copy the pixels in the resource to a DIB object
//r A logical value indicating the success of the operation
	//
	SELF:Destroy()
	SELF:pDibObject := DIBCreateFromResource( hInst, String2Psz( cResName ) )
	//
	SELF:__NotifyOwner( #CreateFromResourceName )
	//
RETURN SELF:IsValid


METHOD CreateFromScreen ( nLeft AS LONG, nTop AS LONG, nRight AS LONG, nBottom AS LONG ) AS LOGIC PASCAL 
//p Initialize a DIB from a specified screen area
//a Screen coordinates
//a nLeft AS LONG, nTop AS LONG, nRight AS LONG, nBottom AS LONG
//d This function creates a DIB object from a specified screen area
//r A logical value indicating the success of the operation
	LOCAL hBitmap AS PTR	
	//
	SELF:Destroy()
	
	hBitmap := DIBCopyScreenToBitmap ( nLeft, nTop, nRight, nBottom  )

	SELF:pDibObject := DIBCreateFromHBitmap( hBitmap )
	//
	SELF:__NotifyOwner( #CreateFromScreen )
	//
	
	DeleteObject ( hBitmap )
	
RETURN SELF:IsValid	


METHOD Crop( XMin AS LONG, XMax AS LONG, YMin AS LONG, YMax AS LONG ) AS VOID PASCAL 
//p Extract a part of the image
//a XMin,XMax,YMin,YMax The coordonates of the part to extract
//d This function will extract a part of the Image, indicated by the X,Y coordonates, and make it the new image
	//
	IF SELF:IsValid
		DIBCrop( SELF:pDibObject, XMin, XMax, YMin, YMax )
		//
		SELF:__NotifyOwner( #Crop )
		//
	ENDIF
	//
return


METHOD Destroy() as void PASCAL 
//p Delete the underlying DIB Object
	//
	IF self:IsValid 
		//
		if ( self:oContainer != null_object )
			self:oContainer:UnlockPage( self, false )
			self:oContainer := null_object
		endif			 
		//
		DIBDelete( SELF:pDibObject )
		SELF:pDibObject := NULL_PTR
		//
		SELF:__NotifyOwner( #Destroy )
		//
	ENDIF
	//
return

METHOD EXIFGetTag( cTagName AS STRING ) AS STRING PASCAL 
	LOCAL pBuffer	AS PTR
	LOCAL liSize	AS LONG
	LOCAL cTagValue	AS STRING
	//
	IF SELF:IsValid
		IF ( self:EXIFTagCount > 0 )
			if ( self:EXIFModel == EXIF_MODEL_NONE )			
				// Dummy call to retrieve needed size
				liSize := DIBEXIFGetTagCommon( self:pDibObject, String2Psz( cTagName ), pBuffer, 0 )
				// Sorry, not found...
				IF ( liSize > 0 )
					// Don't forget zero terminator
					liSize ++
					//
					pBuffer := MemAlloc( dword(liSize) )
					// Real call ( and retrieve used size )
					liSize := DIBEXIFGetTagCommon( self:pDibObject, String2Psz( cTagName ), pBuffer, liSize )
					//
					cTagValue := Mem2String( pBuffer, dword(liSize) )
					//
					MemFree( pBuffer )
				endif
			else
				// Dummy call to retrieve needed size
				liSize := DIBEXIFGetTagCommonEx( self:pDibObject, String2Psz( cTagName ), pBuffer, 0, self:EXIFModel )
				// Sorry, not found...
				IF ( liSize > 0 )
					// Don't forget zero terminator
					liSize ++
					//
					pBuffer := MemAlloc( dword(liSize) )
					// Real call ( and retrieve used size )
					liSize := DIBEXIFGetTagCommonEx( self:pDibObject, String2Psz( cTagName ), pBuffer, liSize, self:EXIFModel )
					//
					cTagValue := Mem2String( pBuffer, dword(liSize) )
					//
					MemFree( pBuffer )
				endif				
			ENDIF
		ENDIF
	ENDIF
RETURN cTagValue


METHOD EXIFGetTagDescription( dwPos AS DWORD ) AS STRING PASCAL 
	LOCAL pBuffer	AS PTR
	LOCAL liSize	AS LONG
	LOCAL cTag		AS STRING
	//
	IF SELF:IsValid
		IF ( self:EXIFTagCount > 0 )
			if ( self:EXIFModel == EXIF_MODEL_NONE )
				// Dummy call to retrieve needed size
				liSize := DIBEXIFGetTagDescription( self:pDibObject, dwPos, pBuffer, 0 )
				// Sorry, not found...
				IF ( liSize > 0 )
					// Don't forget zero terminator
					liSize ++
					//
					pBuffer := MemAlloc( dword(liSize) )
					// Real call ( and retrieve used size )
					liSize := DIBEXIFGetTagDescription( self:pDibObject, dwPos, pBuffer, liSize )
					//
					cTag := Mem2String( pBuffer, dword(liSize) )
					//
					MemFree( pBuffer )
				ENDIF				
			ELSE
				// Dummy call to retrieve needed size
				liSize := DIBEXIFGetTagDescriptionEx( self:pDibObject, dwPos, pBuffer, 0, self:EXIFModel)
				// Sorry, not found...
				IF ( liSize > 0 )
					// Don't forget zero terminator
					liSize ++
					//
					pBuffer := MemAlloc( dword(liSize) )
					// Real call ( and retrieve used size )
					liSize := DIBEXIFGetTagDescriptionEx( self:pDibObject, dwPos, pBuffer, liSize,self:EXIFModel )
					//
					cTag := Mem2String( pBuffer, dword(liSize) )
					//
					MemFree( pBuffer )
				ENDIF
			endif
		ENDIF
	ENDIF
RETURN cTag


METHOD EXIFGetTagShortName( dwPos AS DWORD ) AS STRING PASCAL 
	LOCAL pBuffer	AS PTR
	LOCAL liSize	AS LONG
	LOCAL cTag		AS STRING
	//
	IF SELF:IsValid
		IF ( self:EXIFTagCount > 0 )
			if ( self:EXIFModel == EXIF_MODEL_NONE )
				// Dummy call to retrieve needed size
				liSize := DIBEXIFGetTagShortName( self:pDibObject, dwPos, pBuffer, 0 )
				// Sorry, not found...
				IF ( liSize > 0 )
					// Don't forget zero terminator
					liSize ++
					//
					pBuffer := MemAlloc( dword(liSize) )
					// Real call ( and retrieve used size )
					liSize := DIBEXIFGetTagShortName( self:pDibObject, dwPos, pBuffer, liSize )
					//
					cTag := Mem2String( pBuffer, dword(liSize) )
					//
					MemFree( pBuffer )
				ENDIF
			ELSE
				// Dummy call to retrieve needed size
				liSize := DIBEXIFGetTagShortNameEx( self:pDibObject, dwPos, pBuffer, 0, self:EXIFModel )
				// Sorry, not found...
				IF ( liSize > 0 )
					// Don't forget zero terminator
					liSize ++
					//
					pBuffer := MemAlloc( dword(liSize) )
					// Real call ( and retrieve used size )
					liSize := DIBEXIFGetTagShortNameEx( self:pDibObject, dwPos, pBuffer, liSize, self:EXIFModel )
					//
					cTag := Mem2String( pBuffer, dword(liSize) )
					//
					MemFree( pBuffer )
				ENDIF
			endif
		ENDIF
	ENDIF
RETURN cTag


METHOD EXIFGetTagValue( dwPos AS DWORD ) AS STRING PASCAL 
	LOCAL pBuffer	AS PTR
	LOCAL liSize	AS LONG
	LOCAL cTag		AS STRING
	//
	IF SELF:IsValid
		IF ( self:EXIFTagCount > 0 )
			if ( self:EXIFModel == EXIF_MODEL_NONE )
				// Dummy call to retrieve needed size
				liSize := DIBEXIFGetTagValue( self:pDibObject, dwPos, pBuffer, 0 )
				// Sorry, not found...
				IF ( liSize > 0 )
					// Don't forget zero terminator
					liSize ++
					//
					pBuffer := MemAlloc( dword(liSize) )
					// Real call ( and retrieve used size )
					liSize := DIBEXIFGetTagValue( self:pDibObject, dwPos, pBuffer, liSize )
					//
					cTag := Mem2String( pBuffer, dword(liSize) )
					//
					MemFree( pBuffer )
				ENDIF
			else 
				// Dummy call to retrieve needed size
				liSize := DIBEXIFGetTagValueEx( self:pDibObject, dwPos, pBuffer, 0, self:EXIFModel )
				// Sorry, not found...
				IF ( liSize > 0 )
					// Don't forget zero terminator
					liSize ++
					//
					pBuffer := MemAlloc( dword(liSize) )
					// Real call ( and retrieve used size )
					liSize := DIBEXIFGetTagValueEx( self:pDibObject, dwPos, pBuffer, liSize, self:EXIFModel )
					//
					cTag := Mem2String( pBuffer, dword(liSize) )
					//
					MemFree( pBuffer )
				ENDIF
				
			endif
		ENDIF
	ENDIF
RETURN cTag


ACCESS EXIFModel as Long PASCAL 
RETURN self:nExifModel


ASSIGN EXIFModel( lModel as long ) as long PASCAL 
	self:nExifModel := lModel
RETURN self:nExifModel



ACCESS EXIFTagCount AS LONG PASCAL 
	LOCAL liTagCount	AS	LONG
	//
	IF self:IsValid
		if ( self:EXIFModel == EXIF_MODEL_NONE ) 
			liTagCount := DIBEXIFGetSize( self:pDibObject )
		else
			liTagCount := DIBEXIFGetSizeEx( self:pDibObject, self:EXIFModel )
		endif
	ENDIF
RETURN liTagCount


METHOD FromClipboard( dwFormat := 2 AS DWORD ) AS VOID PASCAL 
//p Paste the DIB object from the clipboard
//d The underground object MUST exist before using this method.
//d At least, use the Create() method.
//j METHOD:FabPaintLib:Create
//j METHOD:FabPaintLib:ToClipboard
	//
	IF SELF:IsValid
		DIBFromClipboard( SELF:pDibObject, dwFormat )
		//
		SELF:__NotifyOwner( #FromClipboard )
		//
	ENDIF
	//	
return

Method GetBackgroundColor( pRGB as _WINRGBQUAD ) as logic PASCAL 
	Local lOk as logic
	//
	if self:IsValid
		lOk := DIBGetBackgroundColor( self:pDibObject, pRGB )
	endif
return lOk	


METHOD GrayScale( ) AS VOID PASCAL 
//p Convert the Image to GrayScale
//d As this operation only support 32 bpp, the image is converted to 32 bpp if necessary before proceeding.
	LOCAL pCopy	AS	PTR
	//
	IF SELF:IsValid
		IF ( SELF:BitPerPixel != 32 )
			pCopy := DIBCreateCopy( SELF:pDibObject, 32 )
			SELF:lSuspendNotification := TRUE
			SELF:Destroy()
			SELF:lSuspendNotification := FALSE
			SELF:pDibObject := pCopy
		ENDIF
		DIBMakeGrayscale( SELF:pDibObject )
		//
		SELF:__NotifyOwner( #MakeGrayScale )
		//
	ENDIF
	//
return

METHOD Handle() AS PTR PASCAL 
//r hBitmap for the current image
	LOCAL hBitmap	AS	PTR
	//
	IF SELF:IsValid
		hBitmap := DIBGetHandle( SELF:pDibObject )
	ENDIF
RETURN hBitmap


ACCESS HasBackgroundColor as LOGIC PASCAL 
//r A logical value indicating if the image has a background color.
	local lBack as Logic
	//
	if self:IsValid
		lBack := DIBHasBackgroundColor( self:pDibObject )
	endif              
	//
RETURN lBack


ACCESS Height AS LONG PASCAL 
//r The Height on pixel of the Image
	LOCAL pBmiH	AS	_winBitmapInfo
	LOCAL nHeight	AS	LONG
	//
	IF SELF:IsValid
		pBmiH   := DIBGetInfo( SELF:pDibObject )
		nHeight  := pBmiH.bmiHeader.biHeight
	ENDIF
RETURN nHeight


ACCESS InfoHeader as _winBitmapInfoHeader PASCAL 
	local pInfo as _winBitmapInfoHeader
	//
	if self:IsValid
		pInfo := DIBGetInfo( self:pDibObject )
	endif              
	//
RETURN pInfo



CONSTRUCTOR( cFile, oOwner, oMultiContainer ) 
//p Initialize a FabPaintLib object
//a <cFile> Name of the file to use to initialize the object
//a If Empty, the FabPaintLib object is uninitialized
//a <oOwner> An object, that want to receive notifications from the
//a FabPaintLib object when it change.     
//a <oMultiContainer> a MultiPage Object that owns the Image
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
		SELF:pDibObject := cFile
		SELF:__NotifyOwner( #InitPTR )
	ENDIF
	//
	IF IsObject( oMultiContainer )
		self:oContainer := oMultiContainer
	ENDIF
	// None
	self:nExifModel := EXIF_MODEL_NONE
	// Per default
	self:cAsStringFileFormat := "BMP"
	//
	RegisterAxit( SELF )
	//
return self	


METHOD Invert( ) AS VOID PASCAL 
//p Invert the Image
//d As this operation only support 32 bpp, the image is converted to 32 bpp if necessary before proceeding.
	LOCAL pCopy	AS	PTR
	//
	IF SELF:IsValid
		IF ( SELF:BitPerPixel != 32 )
			pCopy := DIBCreateCopy( SELF:pDibObject, 32 )
			SELF:lSuspendNotification := TRUE
			SELF:Destroy()
			SELF:lSuspendNotification := FALSE
			SELF:pDibObject := pCopy
		ENDIF
		DIBInvert( SELF:pDibObject )
		//
		SELF:__NotifyOwner( #Invert )
		//
	ENDIF
	//
return

ACCESS IsTransparent as LOGIC PASCAL 
//r A logical value indicating if the image is transparent.
	local lTransparent as Logic
	//
	if self:IsValid
		lTransparent := DIBIsTransparent( self:pDibObject )
	endif              
	//
RETURN lTransparent



Assign IsTransparent( lSet as logic ) as logic PASCAL 
//r A logical value indicating if the image is transparent.
	//
	if self:IsValid
		DIBSetTransparent( self:pDibObject, lSet )
	endif              
	//
RETURN lSet



ACCESS IsValid AS LOGIC PASCAL 
//r A logical value indicating if the object is linked to an image.
RETURN ( SELF:pDibObject != NULL_PTR )
	

Method PasteSubImage( oSubImage as FabPaintLib, Left as long, Top as long ) as logic PASCAL 
	local pSub as ptr
	local lOk as logic
	//
	IF self:IsValid
		if ( oSubImage != null_object )
			pSub := oSubImage:pDibObject
		endif                          
		lOk := DIBPasteSub( self:pDibObject, pSub, Left, Top, 256 )
	ENDIF
	//
return lOk
 

METHOD ResizeBilinear( NewXSize AS LONG, NewYSize AS LONG ) AS VOID PASCAL 
//p Resize the Image using bilinear interpolation
//a <NewXSize> New X Size of the Image
//a <NewYSize> New Y Size of the Image
//d As this operation only support 32 bpp, the image is converted to 32 bpp if necessary before proceeding.
	LOCAL pCopy	AS	PTR
	//
	IF SELF:IsValid
		IF ( SELF:BitPerPixel != 32 )
			pCopy := DIBCreateCopy( SELF:pDibObject, 32 )
			SELF:lSuspendNotification := TRUE
			SELF:Destroy()
			SELF:lSuspendNotification := FALSE
			SELF:pDibObject := pCopy
		ENDIF
		DIBResizeBilinear( SELF:pDibObject, NewXSize, NewYSize )
		//
		SELF:__NotifyOwner( #ResizeBilinear )
		//
	ENDIF
	//
return

METHOD ResizeBox( NewXSize AS LONG, NewYSize AS LONG, NewRadius AS REAL8 ) AS VOID PASCAL 
//p Resizes a bitmap and applies a box filter to it
//a <NewXSize> New X Size of the Image
//a <NewYSize> New Y Size of the Image
//a <NewRadius>
//d As this operation only support 32 bpp, the image is converted to 32 bpp if necessary before proceeding.
	LOCAL pCopy	AS	PTR
	//
	IF SELF:IsValid
		IF ( SELF:BitPerPixel != 32 )
			pCopy := DIBCreateCopy( SELF:pDibObject, 32 )
			SELF:lSuspendNotification := TRUE
			SELF:Destroy()
			SELF:lSuspendNotification := FALSE
			SELF:pDibObject := pCopy
		ENDIF
		DIBResizeBox( SELF:pDibObject, NewXSize, NewYSize, NewRadius )
		//
		SELF:__NotifyOwner( #ResizeBox )
		//
	ENDIF
	//
return

METHOD ResizeGaussian( NewXSize AS LONG, NewYSize AS LONG, NewRadius AS REAL8 ) AS VOID PASCAL 
//p Resizes a bitmap and applies a gaussian blur to it.
//a <NewXSize> New X Size of the Image
//a <NewYSize> New Y Size of the Image
//a <NewRadius>
//d As this operation only support 32 bpp, the image is converted to 32 bpp if necessary before proceeding.
	LOCAL pCopy	AS	PTR
	//
	IF SELF:IsValid
		IF ( SELF:BitPerPixel != 32 )
			pCopy := DIBCreateCopy( SELF:pDibObject, 32 )
			SELF:lSuspendNotification := TRUE
			SELF:Destroy()
			SELF:lSuspendNotification := FALSE
			SELF:pDibObject := pCopy
		ENDIF
		DIBResizeGaussian( SELF:pDibObject, NewXSize, NewYSize, NewRadius )
		//
		SELF:__NotifyOwner( #ResizeGaussian )
		//
	ENDIF
	//
return

METHOD ResizeHamming( NewXSize AS LONG, NewYSize AS LONG, NewRadius AS REAL8 ) AS VOID PASCAL 
//p Resizes a bitmap and applies a hamming filter to it.
//a <NewXSize> New X Size of the Image
//a <NewYSize> New Y Size of the Image
//a <NewRadius>
//d As this operation only support 32 bpp, the image is converted to 32 bpp if necessary before proceeding.
	LOCAL pCopy	AS	PTR
	//
	IF SELF:IsValid
		IF ( SELF:BitPerPixel != 32 )
			pCopy := DIBCreateCopy( SELF:pDibObject, 32 )
			SELF:lSuspendNotification := TRUE
			SELF:Destroy()
			SELF:lSuspendNotification := FALSE
			SELF:pDibObject := pCopy
		ENDIF
		DIBResizeHamming( SELF:pDibObject, NewXSize, NewYSize, NewRadius )
		//
		SELF:__NotifyOwner( #ResizeHamming )
		//
	ENDIF
	//
return

METHOD Rotate( angle AS REAL8, color AS DWORD ) AS VOID PASCAL 
//p Rotates a bitmap by angle radians.
//a <angle> Rotation angle in Radian
//a <color> The RGB Color used to fill new part of the image
//d As this operation only support 32 bpp, the image is converted to 32 bpp if necessary before proceeding.
	LOCAL pCopy	AS	PTR
	//
	IF SELF:IsValid
		IF ( SELF:BitPerPixel != 32 )
			pCopy := DIBCreateCopy( SELF:pDibObject, 32 )
			SELF:lSuspendNotification := TRUE
			SELF:Destroy()
			SELF:lSuspendNotification := FALSE
			SELF:pDibObject := pCopy
		ENDIF
		DIBRotate( SELF:pDibObject, angle, color )
		//
		SELF:__NotifyOwner( #Rotate )
		//
	ENDIF
	//
return

METHOD RotateDeg( angle AS REAL8, color AS DWORD ) AS VOID PASCAL 
//p Rotates a bitmap by angle radians.
//a <angle> Rotation angle in degree
//a <color> The RGB Color used to fill new part of the image
//d As this operation only support 32 bpp, the image is converted to 32 bpp if necessary before proceeding.
	LOCAL pCopy	AS	PTR
	//
	IF SELF:IsValid
		IF ( SELF:BitPerPixel != 32 )
			pCopy := DIBCreateCopy( SELF:pDibObject, 32 )
			SELF:lSuspendNotification := TRUE
			SELF:Destroy()
			SELF:lSuspendNotification := FALSE
			SELF:pDibObject := pCopy
		ENDIF
		DIBRotateDeg( SELF:pDibObject, angle, color )
		//
		SELF:__NotifyOwner( #Rotate )
		//
	ENDIF
	//
return

METHOD SaveAs( cFileName AS STRING ) AS VOID PASCAL 
//p Save to a DIB file
//a <cFileName> Name of the File to create
//d This method will save the desired DIB Object as a DIB file.
	//
	IF SELF:IsValid
		DIBSaveAs( SELF:pDibObject, String2Psz(cFileName) )
	ENDIF
	//
return

METHOD SaveAsJPEG( cFileName AS STRING ) AS VOID PASCAL 
//p Save to a JPEG file
//a <cFileName> Name of the File to create
//d This function will save the desired DIB Object as a JPEG file.
	//
	IF SELF:IsValid
		DIBSaveAsJPEG( SELF:pDibObject, String2Psz(cFileName) )
	ENDIF
	//
return

METHOD SaveAsPNG( cFileName AS STRING ) AS VOID PASCAL 
//p Save to a PNG file
//a <cFileName> Name of the File to create
//d This function will save the desired DIB Object as a PNG file.
	//
	IF SELF:IsValid
		DIBSaveAsPNG( SELF:pDibObject, String2Psz(cFileName) )
	ENDIF
	//
return

METHOD SaveAsTIFF( cFileName AS STRING ) AS VOID PASCAL 
//p Save to a TIFF file
//a <cFileName> Name of the File to create
//d This function will save the desired DIB Object as a TIFF file.
	//
	IF SELF:IsValid
		DIBSaveAsTIFF( SELF:pDibObject, String2Psz(cFileName) )
	ENDIF
	//
return


Method SetBackgroundColor( pRGB as _WINRGBQUAD ) as logic PASCAL 
	Local lOk as logic
	//
	if self:IsValid
		lOk := DIBSetBackgroundColor( self:pDibObject, pRGB )
	endif
return lOk	

	

METHOD Show( hWnd AS PTR) AS VOID PASCAL 
//p Show the image in a Window
//a <hWnd> Handle of the Window
//d This function will show the image in the desired window
//j FUNCTION:DIBShow
	//
	IF SELF:IsValid
		DIBShow( SELF:pDibObject, hWnd )
	ENDIF
	//
return

METHOD ShowDC( hDC AS PTR) AS VOID PASCAL 
//p Show the image in a Window
//a <hDC> Handle of the Device Context
//d This function will show the image in the desired window
//j FUNCTION:DIBShow
	//
	IF SELF:IsValid
		DIBShowDC( SELF:pDibObject, hDC )
	ENDIF
	//
return

METHOD ShowEx( hWnd AS PTR, XPos AS LONG, YPos AS LONG ) AS VOID PASCAL 
//p Show the image in a Window
//a <hWnd> Handle of the Window
//a <XPos> <YPos> Upper/Left Coords of the Top/Left point
//d This function will show the image in the desired window
//j FUNCTION:DIBShowEx
	//
	IF SELF:IsValid
		DIBShowEx( SELF:pDibObject, hWnd, XPos, YPos )
	ENDIF
	//
return

METHOD ShowExDC( hDC AS PTR, XPos AS LONG, YPos AS LONG ) AS VOID PASCAL 
//p Show the image in a Window
//a <hDC> Handle of the Device Context
//a <XPos>, <YPos> Upper/Left Coords of the Top/Left point
//d This function will show the image in the desired window
//j FUNCTION:DIBShowExDC
	//
	IF SELF:IsValid
		DIBShowExDC( SELF:pDibObject, hDC, XPos, YPos )
	ENDIF
	//
return

METHOD ShowFitToWindow( hWnd AS PTR )  AS VOID PASCAL 
//p Show the image in a Window
//a <hWnd> is the Handle of the Container Window
//d This function will show the desired DIB object in the desired Window.
//d If the Width of the DIB is bigger than the Width of the window,
//d or the Height of the DIB if bigger than the Height of the window,
//d the DIB is resized to fit into the Window.
	//
	IF SELF:IsValid
		DIBShowFitToWindow( SELF:pDibObject, hWnd )
	ENDIF
	//
return

METHOD ShowFitToWindowInDC( hWnd AS PTR, hDC AS PTR )  AS VOID PASCAL 
//p Show the image in a Window
//a <hWnd> is the Handle of the Container Window
//d This function will show the desired DIB object in the desired Window.
//d If the Width of the DIB is bigger than the Width of the window,
//d or the Height of the DIB if bigger than the Height of the window,
//d the DIB is resized to fit into the Window.
	//
	IF SELF:IsValid
		DIBShowFitToWindowInDC( SELF:pDibObject, hWnd, hDC )
	ENDIF
	//
return

METHOD Stretch( hWnd AS PTR, nWidth AS DWORD, nHeight AS DWORD, r8Factor AS REAL8) AS VOID PASCAL 
//p Stretch the image in a Window with Zoom
//a <hWnd> Handle of the Window
//a <nWidth> Width of the area for displaying the DIB.
//a <nHeight> Height of the area for displaying the DIB.
//a <r8Factor> The zoom factor of the bitmap.  A value of 1.0 would be its normal size.
//d This function will stretch the image using the specified factor
//j FUNCTION:DIBStretch
	//
	IF SELF:IsValid
		DIBStretch( SELF:pDibObject, hWnd, nWidth, nHeight, r8Factor )
	ENDIF
	//
return

METHOD StretchDC( hDC AS PTR, nCx AS DWORD, nCy AS DWORD, r8Factor AS REAL8) AS VOID PASCAL 
//p Stretch the image in a Window with Zoom
//a <hDC> Handle of the Device Context
//a <nCx> Width of the area for displaying the DIB.
//a <nCy> Height of the area for displaying the DIB.
//a <r8Factor> The zoom factor of the bitmap.  A value of 1.0 would be its normal size.
//d This function will stretch the image using the specified factor
//j FUNCTION:DIBStretch
	//
	IF SELF:IsValid
		DIBStretchDC( SELF:pDibObject, hDC, nCx, nCy, r8Factor )
	ENDIF
	//
return

METHOD StretchDraw( hWnd AS PTR, x AS LONG, y AS LONG, w AS LONG, h AS LONG ) AS VOID PASCAL 
//p Stretch the image in a Window
//a <hWnd> Window handle.
//a <x> X Pos of the image in the window.
//a <y> Y Pos of the image in the window.
//a <w> Width of the area for displaying the DIB.
//a <h> Height of the area for displaying the DIB.
//j FUNCTION:DIBStretchDraw
	//
	IF SELF:IsValid
		DIBStretchDraw( SELF:pDibObject, hWnd,x,y,w,h )
	ENDIF
	//
return

METHOD StretchDrawDC( hDC AS PTR, x AS LONG, y AS LONG, w AS LONG, h AS LONG ) AS VOID PASCAL 
//p Stretch the image in a Window
//a <hDC> Handle of the Device Context
//a <x> X Pos of the image in the window.
//a <y> Y Pos of the image in the window.
//a <w> Width of the area for displaying the DIB.
//a <h> Height of the area for displaying the DIB.
//j FUNCTION:DIBStretchDrawDC
	//
	IF SELF:IsValid
		DIBStretchDrawDC( SELF:pDibObject, hDC,x,y,w,h )
	ENDIF
	//
return


METHOD StretchEx( hWnd AS PTR, pRectDest AS _WINRect, pRectSrc AS _WINRect ) AS VOID PASCAL 
//p Stretch the image in a Window
//a <hWnd> Window handle.
//a <pRectDest> Destination Rectangle in the specified Window.
//a  If NULL_PTR, the pRectSrc rectangle is used.
//a <pRectSrc> Rectangle part of the image to draw into the destination rectangle.
//a  If NULL_PTR, the actual Width and Height of the image are used.
//d DIBStretchEx() copies a DIB into a destination rectangle, stretching or compressing the bitmap
//d to fit the dimensions of the specified window, <hWnd>.
//j FUNCTION:DIBStretchEx
	//
	IF SELF:IsValid
		DIBStretchEx( SELF:pDibObject, hWnd, pRectDest, pRectSrc )
	ENDIF
	//
return

METHOD StretchExDC( hDC AS PTR, pRectDest AS _WINRect, pRectSrc AS _WINRect ) AS VOID PASCAL 
//p Stretch the image in a Window
//a <hDC> Handle of Device Context
//a <pRectDest> Destination Rectangle in the specified Window.
//a  If NULL_PTR, the pRectSrc rectangle is used.
//a <pRectSrc> Rectangle part of the image to draw into the destination rectangle.
//a  If NULL_PTR, the actual Width and Height of the image are used.
//d DIBStretchEx() copies a DIB into a destination rectangle, stretching or compressing the bitmap
//d to fit the dimensions of the specified window, <hWnd>.
//j FUNCTION:DIBStretchExDC
	//
	IF SELF:IsValid
		DIBStretchExDC( SELF:pDibObject, hDC, pRectDest, pRectSrc )
	ENDIF
	//
return

METHOD StretchExDrawDCBackground( hDC as ptr, pRectDest as _WINRect, pRectSrc as _WINRect, ;
   										lUSeFile as Logic, pRGB as _winRGBQUAD, oBackgroundImage as FabPaintLib ;
										 ) as void PASCAL 
//p Stretch the image in a Window using transparency
//a <hDC> Handle of the Device Context
//a <x> X Pos of the image in the window.
//a <y> Y Pos of the image in the window.
//a <w> Width of the area for displaying the DIB.
//a <h> Height of the area for displaying the DIB.
//a <lUseFile> use file as background ?
//a <pRGB> is a _WinRGBQUAD struct with background color
//a <oBackgroundImage> is a FabPaintLib object to use as background
//j FUNCTION:DIBStretchDrawDC
	local pDIB as ptr
	//
	IF self:IsValid
		if ( oBackgroundImage != null_object )
			pDIB := oBackgroundImage:pDibObject
		endif
		DIBStretchExDrawDCBackground( self:pDibObject, hDC, pRectDest, pRectSrc, lUSeFile, pRGB, pDIB )
	ENDIF
	//
return



METHOD ToClipboard( ) AS VOID PASCAL 
//p Copy the DIB object to the clipboard
//j METHOD:FabPaintLib:FromClipboard
	//
	IF SELF:IsValid
		DIBToClipboard( SELF:pDibObject )
	ENDIF
	//	
return

ACCESS UseGDI AS LOGIC PASCAL 
//r A logical value indicating if FabPaint uses VFW functions or GDI functions to draw
	LOCAL lSet	AS	LOGIC
	//
	IF SELF:IsValid
		lSet := DIBGetUseGDI( SELF:pDibObject )
	ENDIF
RETURN lSet


ASSIGN UseGDI( lUseGDI AS LOGIC ) AS LOGIC PASCAL 
//r A logical value indicating if FabPaint uses VFW functions or GDI functions to draw
	LOCAL lSet	AS	LOGIC
	//
	IF SELF:IsValid
		lSet := DIBSetUseGDI( SELF:pDibObject, lUseGDI )
		// Not a change in the Image but on the way to draw, may need to redraw
		SELF:__NotifyOwner( #UseGDI )
		//
	ENDIF
RETURN lSet



ACCESS Width AS LONG PASCAL 
//r The width in pixel of the image
	LOCAL pBmiH	AS	_winBitmapInfo
	LOCAL nWidth	AS	LONG
	//
	IF SELF:IsValid
		pBmiH   := DIBGetInfo( SELF:pDibObject )
		nWidth  := pBmiH.bmiHeader.biWidth
	ENDIF
RETURN nWidth



END CLASS
