FUNCTION DIBCopyScreenToBitmap ( nLeft AS LONG, nTop AS LONG, nRight AS LONG, nBottom AS LONG ) AS PTR PASCAL
//p Copy a portion of Screen to a Bitmap DIB handler
	LOCAL hScrDC, hMemDC	AS PTR          // screen DC and memory DC
	LOCAL hBitmap, hOldBitmap AS PTR	    // handles to deice-dependent bitmaps
	LOCAL nWidth, nHeight AS INT	        // DIB width and height
	LOCAL xScrn, yScrn AS INT	            // screen resolution
	//
    // check for an empty rectangle

    // create a DC for the screen and create
    // a memory DC compatible to screen DC
    hScrDC := CreateDC(Cast2Psz("DISPLAY"), NULL_PSZ, NULL_PSZ , NULL_PTR )
    hMemDC := CreateCompatibleDC(hScrDC)
    // get screen resolution
    xScrn := GetDeviceCaps(hScrDC, HORZRES)
    yScrn := GetDeviceCaps(hScrDC, VERTRES)
    //make sure bitmap rectangle is visible
    IF nLeft < 0
        nLeft := 0
	ENDIF
    IF nTop < 0
        nTop := 0
	ENDIF
    IF nRight > xScrn
        nRight := xScrn
	ENDIF
    IF nBottom > yScrn
        nBottom := yScrn
	ENDIF
    nWidth := nRight - nLeft
    nHeight := nBottom - nTop
    // create a bitmap compatible with the screen DC
    hBitmap := CreateCompatibleBitmap(hScrDC, nWidth, nHeight)
    // select new bitmap into memory DC
    hOldBitmap := SelectObject(hMemDC, hBitmap)
    // bitblt screen DC to memory DC
    BitBlt(hMemDC, 0, 0, nWidth, nHeight, hScrDC, nLeft, nTop, SRCCOPY)
    // select old bitmap back into memory DC and get handle to
    // bitmap of the screen
    hBitmap := SelectObject(hMemDC, hOldBitmap)
    // clean up
    DeleteDC(hScrDC)
    DeleteDC(hMemDC)
    // return handle to the bitmap
RETURN hBitmap


FUNCTION DIBCreateFromResource( hInst AS PTR, pszRes AS PSZ) AS PTR PASCAL
//p Create a DIB object from a resource name
//a <hInst> Handle to the resource module handle
//a  This can be _GetInst() for the current Exe, or and result of LoadLibrary()
//a <pszRes> Name of the resource to use.
//d This function will read the indicated file, and create a DIB object.
//r A pointer to the DIB object
//j FUNCTION:DIBDelete
//g Add On
	LOCAL hBitmap	AS	PTR
	LOCAL ptrDIB	AS	PTR
	// Load ressource
	hBitmap := LoadBitmap( hInst, pszRes )
	// Create from Bitmap Handle
	ptrDIB := DIBCreateFromHBitmap( hBitmap )
	// No need to keep the bitmap, it has been copied
	DeleteObject( hBitmap )
	// return the created C++ object.
RETURN ptrDIB


FUNCTION DIBShowFitToWindow( pBmp AS PTR, hWnd AS PTR ) AS VOID PASCAL
//p Show a DIB object in a Window
//a <pBmp> is the DIB object pointer to show
//a <hWnd> is the Handle of the Container Window
//d This function will show the desired DIB object in the desired Window.
//d If the Width of the DIB is bigger than the Width of the window,
//d or the Height of the DIB if bigger than the Height of the window,
//d the DIB is resized to fit into the Window.
//g Add On
	LOCAL pRect		IS _winRECT
	LOCAL Factor	AS	REAL8
	LOCAL rx, ry	AS	REAL8
	LOCAL pBMI		AS	_winBITMAPINFO
	LOCAL Width, Height	AS	LONG
	//
	GetClientRect( hWnd, @pRect )
	Width := pRect.Right - pRect.Left + 1
	Height := pRect.Bottom - pRect.Top + 1
	//
	pBMI := DIBGetInfo( pBmp )
	//
	Factor := 1
	//
	IF ( pBMI.bmiHeader.biWidth > Width )  .OR. ( pBMI.bmiHeader.biHeight > Height )
		// doesn't fit, need to scale
		rx := REAL8( pBMI.bmiHeader.biWidth ) / REAL8( Width )
		ry := REAL8(  pBMI.bmiHeader.biHeight ) / REAL8( Height )
		Factor := 1.0 / Max( rx, ry )
	ENDIF
	//
	Width := LONG( Factor * pBMI.bmiHeader.biWidth )
	Height := LONG( Factor * pBMI.bmiHeader.biHeight )
	//
	DIBStretchDraw( pBmp, hWnd, 0, 0, Width, Height )
	//
RETURN

FUNCTION DIBShowFitToWindowInDC( pBmp AS PTR, hWnd AS PTR, hDC AS PTR ) AS VOID PASCAL
//p Show a DIB object in a Window
//a <pBmp> is the DIB object pointer to show
//a <hWnd> is the Handle of the Container Window
//d This function will show the desired DIB object in the desired Window.
//d If the Width of the DIB is bigger than the Width of the window,
//d or the Height of the DIB if bigger than the Height of the window,
//d the DIB is resized to fit into the Window.
//g Add On
	LOCAL pRect		IS _winRECT
	LOCAL Factor	AS	REAL8
	LOCAL rx, ry	AS	REAL8
	LOCAL pBMI		AS	_winBITMAPINFO
	LOCAL Width, Height	AS	LONG
	//
	GetClientRect( hWnd, @pRect )
	Width := pRect.Right - pRect.Left + 1
	Height := pRect.Bottom - pRect.Top + 1
	//
	pBMI := DIBGetInfo( pBmp )
	//
	Factor := 1
	//
	IF ( pBMI.bmiHeader.biWidth > Width )  .OR. ( pBMI.bmiHeader.biHeight > Height )
		// doesn't fit, need to scale
		rx := REAL8( pBMI.bmiHeader.biWidth ) / REAL8( Width )
		ry := REAL8(  pBMI.bmiHeader.biHeight ) / REAL8( Height )
		Factor := 1.0 / Max( rx, ry )
	ENDIF
	//
	Width := LONG( Factor * pBMI.bmiHeader.biWidth )
	Height := LONG( Factor * pBMI.bmiHeader.biHeight )
	//
	DIBStretchDrawDC( pBmp, hDC, 0, 0, Width, Height )
	//
RETURN


