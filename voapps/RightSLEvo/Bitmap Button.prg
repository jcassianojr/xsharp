CLASS wmBitmapButton INHERIT PushButton
// Author		: Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 7 May 1998
// --------------
//l Bitmaps on a button for various rightSLE subclasses.
//p Bitmaps on a button for various rightSLE subclasses.
//d wmBitmapbutton is a subclass of Pushbutton that adds
//d the ability of having a bitmap on your button.
//d This class is derived form code found on Compuserve.
//d It was renamed to wmBitMapbutton to avoid naming problem
//d with other bitmapbutton classes that maybe in use.
//g BitMap Button

	EXPORT lDown := FALSE 		AS LOGIC
	EXPORT hBitmapUp 			AS PTR
	EXPORT hBitmapDown 			AS PTR
	EXPORT lTwoState := FALSE	AS LOGIC	
	EXPORT lInState := FALSE	AS LOGIC

METHOD destroy() 
	DeleteObject(SELF:hBitmapUp)
	DeleteObject(SELF:hBitmapDown)
	SELF:hBitmapUp		:= NULL_PTR
	SELF:hbitmapDown	:= NULL_PTR
	RETURN SUPER:destroy()

METHOD Dispatch(oE) 
	DO CASE
		CASE oE:Message == WM_SETFOCUS
			SELF:SetFocus()			
		CASE oE:Message == BM_SETSTATE
			IF lTwoState
				IF oE:wParam == 1  .and. !lDown
					SELF:lInState := TRUE
					SELF:lDown := TRUE
				ELSEIF oE:wParam <> 1  .and. lInState
					SELF:lInState := FALSE
				ELSEIF oE:wParam <> 1
					SELF:lDown := FALSE
				ENDIF	
			ELSE				
				SELF:lDown := (oE:wParam==1)
			ENDIF	
			InvalidateRect(SELF:handle(), NULL_PTR, .t.)	
		CASE oE:Message == WM_GETDLGCODE
			RETURN DLGC_WANTARROWS
	ENDCASE
	
RETURN SUPER:dispatch(oE)

METHOD expose(oExposeEvent) 
	LOCAL hDC 				AS PTR					// Device Context
	LOCAL lpRect 			IS _WINRECT				// Rect to hold button coords
	LOCAL hMemDC 			AS PTR					// Memory compatible DC
	
	// Start the painting
	hDC := GetDC( SELF:handle() )
	// Erase the surface
	GetClientRect(SELF:handle(), @lpRect)
	// Create a compatible Device context to paint to
	hMemDC := CreateCompatibleDC( hDC )	
	IF SELF:lDown
		// Use the down bitmap
		SelectObject( hMemDC, hBitmapDown)
	ELSE	
		// Use the up bitmap
		SelectObject( hMemDC, hBitmapUp)
	ENDIF
	// Bit Blast this puppy!
	BitBlt(hDC, lpRect.left, lpRect.top, lprect.right, lpRect.bottom, hMemDC, 0, 0, SRCCOPY)
	// Delete the compatible DC
	DeleteDC(hMemDC)	
	// End the paint cycle	
	ReleaseDC(SELF:handle(),hDC)
	// Validate the area
	ValidateRect(SELF:handle(), NULL_PTR)
	
	RETURN NIL
	

CONSTRUCTOR(oOwner, nID, oPoint, oDimension, cText, kStyle) 
	
	SUPER( oOwner, nID, oPoint, oDimension, cText, kStyle )
	SELF:setstyle(BS_OWNERDRAW)
	RETURN SELF

END CLASS
CLASS wmBitmapFromDisk INHERIT Bitmap

CONSTRUCTOR(cFile ) 
	SUPER( ResourceID{"", _GetInst()} )
	//  replace internal HBITMAP protect variable,
//	hBitMap	:= LoadBitmap(_GetInst(),String2Psz(cFile))
	hBitmap	 := LoadImage( 0, String2Psz( cFile ), IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE )
	RETURN SELF

END CLASS
CLASS wmNewBitmapButton INHERIT PUSHBUTTON
	PROTECT lUseResource	AS LOGIC
	
	// methods
	
	// assigns

METHOD AssignBitmap(xImage AS USUAL) AS USUAL PASCAL 
	LOCAL oImage		AS OBJECT
	LOCAL cBitmapName	AS STRING
	IF !Empty(xImage)
		IF IsInstanceOfUsual(xImage, #Bitmap)
			oImage	:= xImage
		ELSE
			IF SELF:lUseResource
				oImage	:= bitmap{ResourceID{xImage,_GetInst()},LR_LOADMAP3DCOLORS}
			ELSE
				cBitMapName	:= Trim(xImage) + ".bmp"
				oImage	:= wmBitmapFromDisk{cBitMapName}
			ENDIF
		ENDIF
		SELF:Caption	:= ""
		SELF:Image		:= oImage
	ENDIF
	RETURN oImage		

METHOD AssignIcon(sResourceName AS STRING) AS USUAL PASCAL 
	LOCAL oImage	AS OBJECT

	oImage := Icon{ResourceID{sResourceName, _GetInst()}}

	IF oImage:Handle() <> NULL_PTR
		SELF:Caption	:= ""
		SELF:Image		:= oImage
	ENDIF

	RETURN oImage

METHOD Dispatch(oE) 
	DO CASE
		CASE oE:Message == WM_GETDLGCODE
			RETURN DLGC_WANTARROWS
	ENDCASE
	
RETURN SUPER:dispatch(oE)

CONSTRUCTOR(oOwner, nID, oPoint, oDimension, cText, kStyle) 
	SELF:lUseResource	:= FALSE
	SUPER( oOwner, nID, oPoint, oDimension, cText, kStyle )
	RETURN SELF

ASSIGN UseResource(lVar AS LOGIC) AS LOGIC PASCAL 
	SELF:lUseResource	:= lvar
	RETURN SELF:lUseResource


END CLASS
