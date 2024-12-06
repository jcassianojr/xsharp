CLASS CcPreview INHERIT CustomControl
	
    PROTECT	hDC 			AS PTR					// Handle des Devicecontext
    PROTECT oPrinter 		AS BL_Printer			// BL-Printer Object
    PROTECT lStyleWord		AS LOGIC				// Mausverhalten wie in Word (oder Acrobat)

	PROTECT oSbHorz 		AS HorizontalScrollBar	// Horizontale Scrollbar
	PROTECT oSbVert 		AS VerticalScrollBar    // Vertikale Scrollbar
	PROTECT oSbText 		AS FixedText			// Ecke zwischen Scrollbars
	PROTECT nSbWidth 		AS INT					// Breite der Scrollbars
	PROTECT lSbHorz			AS LOGIC				// Flag, ob horizontale Scrollbar aktiv
	PROTECT lSbVert			AS LOGIC				// Flag, ob vertikale Scrollbar aktiv
	
	PROTECT nGap 			AS INT					// Abstand zum Rand bei ganzer Seite
    PROTECT oOffset 		AS Point                // Offset für Preview
    PROTECT lZoomed 		AS LOGIC				// Flag, ob Preview gezoomed
    // PROTECT nPage			AS INT					// Aktuelle Seite

    PROTECT fZoomFactor 	AS FLOAT                // Zoomfaktor
    PROTECT fZoomPercent	AS FLOAT				// Zoomstufe in Prozent
    PROTECT symZoomName		AS SYMBOL				// Name der Zoomstufe als Symbol
    PROTECT symZoomNameZ	AS SYMBOL				// Name der Zoomstufe als Symbol (gezoomt)
    PROTECT oPaperSize 		AS Dimension            // Papier-Größe
    PROTECT rcPaper 		IS _winRECT             // Papier-Bereich
    PROTECT oMetafileSize 	AS Dimension			// Metafile-Größe
    PROTECT rcMetafile		IS _winRECT				// Metafile-Bereich

	PROTECT	hBrushBackground AS PTR					// Hintergrundfarbe

	PROTECT oCurZoomIn		AS Pointer				// Cursor ZoomIn
	PROTECT oCurZoomOut		AS Pointer              // Cursor ZoomOut
	PROTECT oCurHand		AS Pointer              // Cursor Hand
	PROTECT oCurFaust		AS Pointer              // Cursor Faust
	PROTECT oCurPos			AS Point				// letzte Cursor Position
	

METHOD CalculateSize(oPos, lCurPos) 
	
	// ==================================================================================
	//	Achtung: In dieser Methode gab es Probleme bei Berechnungen mit Float-Variablen
	// ==================================================================================
	
	LOCAL rc 			 	IS _winRECT
	LOCAL fZoom				AS FLOAT
	LOCAL fZoomX, fZoomY 	AS FLOAT
	LOCAL fX, fY 		 	AS FLOAT
	LOCAL f1, f2			AS FLOAT
	LOCAL nWidth, nHeight	AS INT
	
	
	Default(@lCurPos, FALSE)					// Beim Zoomen Cursorposition in Bildmitte
	
	// Prozentuale Cursorposition auf der Seite zum Zentrieren im Zoom-Modus ermitteln
	IF IsNil(oPos) // .or. !lZoomed
		fX := fY := 0
	ELSE
		// fX := 100 * (oPos:x - rcPaper.left) / (rcPaper.right - rcPaper.left)
		// fY := 100 * (oPos:y - rcPaper.top) / (rcPaper.bottom - rcPaper.top)
		
		fX := 100 * (oPos:x - rcPaper.left + oOffset:X) / (rcPaper.right - rcPaper.left)
		fY := 100 * (oPos:y - rcPaper.top + oOffset:Y) / (rcPaper.bottom - rcPaper.top)
	ENDIF
	
	// Clientbereich des Controls	
	GetClientRect(SELF:Handle(), @rc)
	nWidth  := rc.right + 1
	nHeight := rc.bottom + 1
	
	// Zoomfaktor bestimmen
	DO CASE
	CASE SELF:symZoomName == #ZoomPage
		// Zoomfaktor bei ganzer Seite
		fZoomX := (nWidth - 2 * SELF:nGap) / SELF:oPrinter:PaperSize:Width
		fZoomY := (nHeight - 2 * SELF:nGap) / SELF:oPrinter:PaperSize:Height
		fZoom := Min(fZoomX, fZoomY)
		
	CASE SELF:symZoomName == #ZoomWidth
		// Zoomfaktor bei Seitenbreite
		fZoomX := nWidth / SELF:oPrinter:PaperSize:Width
		fZoomY := nHeight / SELF:oPrinter:PaperSize:Height
		IF fZoomX > fZoomY									// Vertikale Scrollbar
			nWidth -= nSbWidth
		ENDIF
		fZoom := nWidth / SELF:oPrinter:PaperSize:Width
		// SELF:oOffset:X := 0
		
	CASE SELF:symZoomName == #ZoomHeight
		// Zoomfaktor bei SeitenHöhe
		fZoomX := nWidth / SELF:oPrinter:PaperSize:Width
		fZoomY := nHeight / SELF:oPrinter:PaperSize:Height
		IF fZoomX < fZoomY									// Horizontale Scrollbar
			nHeight -= nSbWidth
		ENDIF
		fZoom := nHeight / SELF:oPrinter:PaperSize:Height
		// SELF:oOffset:Y := 0
		
	OTHERWISE
		// Zoomfaktor bei 'Originalgrösse' und festen Prozenten
		fZoom := 96/2540 * SELF:fZoomPercent / 100
		IF SELF:oPrinter:PaperSize:Width * fZoom > nWidth
			nHeight -= nSbWidth
		ENDIF
		IF SELF:oPrinter:PaperSize:Height * fZoom > nHeight
			nWidth -= nSbWidth
		ENDIF
	ENDCASE
	
	SELF:fZoomFactor := fZoom

	// gezoomte Papiergröße
	f1 := SELF:oPrinter:PaperSize:Width * fZoom
	f2 := SELF:oPrinter:PaperSize:Height * fZoom
	SELF:oPaperSize := Dimension{INT(f1), INT(f2)}
								
	// Ausgabebereich für Papier
	SELF:rcPaper.Left   := Max(0, (nWidth - SELF:oPaperSize:Width) / 2)
	SELF:rcPaper.Top    := Max(0, (nHeight - SELF:oPaperSize:Height) / 2)
	SELF:rcPaper.Right  := SELF:rcPaper.Left + SELF:oPaperSize:Width - 1
	SELF:rcPaper.Bottom := SELF:rcPaper.Top + SELF:oPaperSize:Height - 1

	// gezoomte Metafile-Größe
	f1 := SELF:oPrinter:PrintAreaSize:Width * fZoom
	f2 := SELF:oPrinter:PrintAreaSize:Height * fZoom
	SELF:oMetafileSize := Dimension{INT(f1), INT(f2)}

	// gewählte Scrollposition beim Hereinzoomen berechnen
	IF lZoomed  .and. !IsNil(oPos)
		IF lCurPos
			// Beim Zoomen Cursorposition beibehalten
			f1 := fX * rcPaper.right / 100 - oPos:x
			f2 := fY * rcPaper.bottom / 100 - oPos:y
		ELSE
			// Beim Zoomen oPos in Bildmitte
			f1 := fX * rcPaper.right / 100 - nWidth / 2
			f2 := fY * rcPaper.bottom / 100 - nHeight / 2
		ENDIF
		oOffset:X := Max(0, INT(f1))
		oOffset:Y := Max(0, INT(f2))
	ENDIF

	// Ausgabebereich für Metafile
	f1 := SELF:oPrinter:PrintAreaOffset:X * fZoom
	f2 := SELF:oPrinter:PrintAreaOffset:Y * fZoom
	SELF:rcMetafile.Left   := SELF:rcPaper.Left + INT(f1)
	SELF:rcMetafile.Top    := SELF:rcPaper.Top + INT(f2)
	SELF:rcMetafile.Right  := SELF:rcMetafile.Left + SELF:oMetafileSize:Width - 1
	SELF:rcMetafile.Bottom := SELF:rcMetafile.Top + SELF:oMetafileSize:Height - 1

	// Scrollbars berechnen	
	SELF:InitScrollbars()
	
	RETURN NIL


METHOD Destroy() 
	
		// ----------------------------
		//	Erzeugte Objekte zerstören
		// ----------------------------

	IF hBrushBackground != NULL_PTR             // Brush-Objekte freigeben
		DeleteObject(hBrushBackground)
		hBrushBackground := NULL_PTR
	ENDIF
	
	SUPER:Destroy()
	
	RETURN NIL
	

METHOD Dispatch(oEvent) 

	LOCAL oE AS @@Event
	LOCAL nSBPosX, nSBPosY AS INT
	LOCAL nRotation AS INT
	
	oE := oEvent
	
	DO CASE
		
		// ------------------------------------------------------------------------
		//	Das Abfangen der Events WM_PAINT oder WM_ERASEBKGND bewirkt, dass beim
		//  Ziehen fremder Fenster über das Control keine Streifen zurückbleiben.
		// ------------------------------------------------------------------------
		
	CASE oE:uMsg == WM_PAINT
		SELF:Expose()
		RETURN (SELF:EventReturnValue := 1L)
	
	CASE oE:uMsg == WM_ERASEBKGND
		// RETURN (SELF:EventReturnValue := 1L)

	CASE oE:uMsg == WM_CHAR
		DO CASE
		CASE oE:wParam == VK_ESCAPE
            PostMessage(SELF:Owner:Handle(), WM_CLOSE, 0L, 0L)
			RETURN (SELF:EventReturnValue := 1L)
		ENDCASE

	CASE oE:uMsg == WM_KEYDOWN
		DO CASE
		CASE SELF:lSbVert  .and. (oE:wParam == VK_UP  .or. oE:wParam == VK_DOWN)
			IF oE:wParam == VK_UP
				nRotation := 40
			ELSE
				nRotation := -40
			ENDIF
			nSBPosY := Max(0, SELF:oOffset:Y - nRotation / 2)
			Send(SELF, #VerticalScroll, ScrollEvent{SELF:handle(), WM_VSCROLL, ;
				 MakeLong(SB_THUMBTRACK, nSBPosY), ;
				 LONG(_CAST,SELF:oSbVert:Handle()), SELF:Owner})
			RETURN (SELF:EventReturnValue := 1L)
		
		CASE SELF:lSbHorz  .and. (oE:wParam == VK_LEFT  .or. oE:wParam == VK_RIGHT)
			IF oE:wParam == VK_LEFT
				nRotation := 40
			ELSE
				nRotation := -40
			ENDIF
			nSBPosX := Max(0, SELF:oOffset:X - nRotation / 2)
			Send(SELF, #HorizontalScroll, ScrollEvent{SELF:handle(), WM_HSCROLL, ;
				 MakeLong(SB_THUMBTRACK, nSBPosX), ;
				 LONG(_CAST,SELF:oSbHorz:Handle()), SELF:Owner})
			RETURN (SELF:EventReturnValue := 1L)
		
		ENDCASE
		
	CASE InList(oE:uMsg, WM_LBUTTONDOWN, WM_LBUTTONDBLCLK)
		IF SELF:PointInPage(oE:lParam)
			IF SELF:lStyleWord
				SELF:ToggleZoom(Point{LoWord(oE:lParam), HiWord(oE:lParam)}, TRUE)
				IF SELF:lZoomed
					SELF:Owner:Pointer := SELF:oCurZoomOut
				ELSE
					SELF:Owner:Pointer := SELF:oCurZoomIn
				ENDIF
			ELSEIF SELF:lSbHorz  .or. SELF:lSbVert
				SELF:Owner:Pointer := SELF:oCurFaust
				oCurPos:X := LoWord(oE:lParam)
				oCurPos:Y := HiWord(oE:lParam)
			ENDIF
		ENDIF
	
	CASE InList(oE:uMsg, WM_LBUTTONUP)
		IF SELF:PointInPage(oE:lParam)
			IF SELF:lStyleWord
				IF SELF:lZoomed
					SELF:Owner:Pointer := SELF:oCurZoomOut
				ELSE
					SELF:Owner:Pointer := SELF:oCurZoomIn
				ENDIF
			ELSEIF SELF:lSbHorz  .or. SELF:lSbVert
				SELF:Owner:Pointer := SELF:oCurHand
			ENDIF
		ENDIF
	
	CASE InList(oE:uMsg, WM_RBUTTONDOWN, WM_RBUTTONDBLCLK)
		IF SELF:PointInPage(oE:lParam)
			IF SELF:lStyleWord
				IF SELF:lZoomed
					IF lSbHorz  .or. lSbVert
						SELF:Owner:Pointer := SELF:oCurHand
						oCurPos:X := LoWord(oE:lParam)
						oCurPos:Y := HiWord(oE:lParam)
					ELSE
						SELF:Owner:Pointer := SELF:oCurZoomOut
					ENDIF
				ELSE
					SELF:Owner:Pointer := SELF:oCurZoomIn
				ENDIF
			ELSEIF SELF:lSbHorz  .or. SELF:lSbVert
				SELF:Owner:Pointer := SELF:oCurHand
			ENDIF
		ENDIF
	
	CASE InList(oE:uMsg, WM_RBUTTONUP)
		IF SELF:PointInPage(oE:lParam)
			IF SELF:lStyleWord
				IF SELF:lZoomed
					SELF:Owner:Pointer := SELF:oCurZoomOut
					RETURN (SELF:EventReturnValue := 1L)			// kein Context-Menü
				ELSE
					SELF:Owner:Pointer := SELF:oCurZoomIn
				ENDIF
			ELSEIF SELF:lSbHorz  .or. SELF:lSbVert
				SELF:Owner:Pointer := SELF:oCurHand
			ENDIF
		ENDIF
	
	CASE oE:uMsg == WM_MOUSEMOVE
		IF SELF:PointInPage(oE:lParam)
			// Cursor in Seite
			
			IF SELF:lSbHorz  .or. SELF:lSbVert
				// Scrollbars vorhanden
				
				IF (SELF:lStyleWord  .and. _And(oE:wParam, MK_RBUTTON) > 0)  .or. ;
				   (!SELF:lStyleWord  .and. _And(oE:wParam, MK_LBUTTON) > 0)
				
					// Maustaste gedrückt
					IF SELF:lStyleWord
						SELF:Owner:Pointer := SELF:oCurHand
					ELSE
						SELF:Owner:Pointer := SELF:oCurFaust
					ENDIF
					nSBPosX := Max(0, SELF:oOffset:X + oCurPos:X - LoWord(oE:lParam))
					nSBPosY := Max(0, SELF:oOffset:Y + oCurPos:Y - HiWord(oE:lParam))
					IF lSbHorz
						Send(SELF, #HorizontalScroll, ScrollEvent{SELF:handle(), WM_HSCROLL, ;
							 MakeLong(SB_THUMBTRACK, nSBPosX), ;
							 LONG(_CAST,SELF:oSbHorz:Handle()), SELF:Owner})
					ENDIF
					IF lSbVert
						Send(SELF, #VerticalScroll, ScrollEvent{SELF:handle(), WM_VSCROLL, ;
							 MakeLong(SB_THUMBTRACK, nSBPosY), ;
							 LONG(_CAST,SELF:oSbVert:Handle()), SELF:Owner})
					ENDIF
					oCurPos:X := LoWord(oE:lParam)
					oCurPos:Y := HiWord(oE:lParam)
					
				ELSEIF SELF:lStyleWord
					// keine Taste gedrückt und Word-Stil
					SELF:Owner:Pointer := SELF:oCurZoomOut
				ELSE
					// keine Taste gedrückt und Acrobat-Stil
					SELF:Owner:Pointer := SELF:oCurHand
				ENDIF
			
			ELSE		
				// keine Scrollbars
				IF SELF:lStyleWord
					IF SELF:lZoomed
						SELF:Owner:Pointer := SELF:oCurZoomOut
					ELSE
						SELF:Owner:Pointer := SELF:oCurZoomIn
					ENDIF
				ENDIF
			ENDIF
		ENDIF
	
	CASE oE:uMsg == 0x020A		// WM_MOUSEWHEEL
		IF SELF:PointInPage(oE:lParam, TRUE)  .and. lSbVert
			// Cursor in Seite + Vertikale Scrollbar vorhanden
			nRotation := SHORTINT(_CAST, HiWord(oE:wParam))
			nSBPosY := Max(0, SELF:oOffset:Y - nRotation / 2)
			Send(SELF, #VerticalScroll, ScrollEvent{SELF:handle(), WM_VSCROLL, ;
				 MakeLong(SB_THUMBTRACK, nSBPosY), ;
				 LONG(_CAST,SELF:oSbVert:Handle()), SELF:Owner})
		ENDIF
	
	CASE oE:uMsg == WM_GETDLGCODE
		SELF:EventReturnValue := DLGC_WANTALLKEYS
		RETURN 1L	
			
	ENDCASE
	
	RETURN SUPER:Dispatch(oEvent)


METHOD Expose(oExposeEvent) 
	
	LOCAL ps 	IS _winPAINTSTRUCT
	
	hDC := BeginPaint(SELF:Handle(), @ps)

	// Control und rcPaint an Scrollbar anpassen
	IF lZoomed
		// OffsetRect(@ps.rcPaint, oOffset:X, oOffset:Y)
	 	SetWindowOrgEx(hDC, oOffset:X, oOffset:Y, NULL)
	ENDIF

	// Seite ausgeben
	SELF:PaintPage(ps.fErase)
	
	EndPaint(SELF:Handle(), @ps)
	hDC := NULL_PTR
	
	RETURN NIL	


METHOD HorizontalScroll (oScrollEvent) 

	LOCAL oE		AS ScrollEvent
	LOCAL nScroll 	AS INT	
	LOCAL si 		IS _winSCROLLINFO		// Struktur für GetScrollInfo()
	LOCAL rc		IS _winRECT
	
	oE := oScrollEvent

   	SUPER:HorizontalScroll(oE)

	si.cbSize	:= _SizeOf(_winSCROLLINFO)
	si.fMask	:= SIF_PAGE
	GetScrollInfo(SELF:oSbHorz:Handle(), SB_CTL, @si)

   	DO CASE
   	CASE oE:TYPE == BLOCKDECREMENT
   		oE:ScrollBar:Value -= si.nPage

   	CASE oE:TYPE == BLOCKINCREMENT
   		oE:ScrollBar:Value += si.nPage

	CASE oE:Type == SCROLLTHUMBDRAG
       	oE:ScrollBar:Value := oE:Position

    OTHERWISE
    	oE:ScrollBar:Value := oE:Position

   	ENDCASE

		// ------------------------------------------------------------------------------
		//	Achtung: Im folgenden muß unbedingt der Wert der ScrollBar genommen werden
		//			 und nicht die Position des ScrollEvents, da unzulässige Werte
		//			 dadurch vermieden und unschöne Bewegungen verhindert werden
		// ------------------------------------------------------------------------------
	
	IF SELF:oOffset:X != oE:ScrollBar:Value
		nScroll := SELF:oOffset:X - oE:ScrollBar:Value
		GetClientRect(SELF:Handle(), @rc)
		IF SELF:lSbVert
			rc.right  -= nSbWidth
		ENDIF
		rc.bottom -= nSbWidth
		ScrollWindowEx(SELF:Handle(), nScroll, 0, ;
					   NULL_PTR, @rc, NULL_PTR, NULL_PTR, SW_INVALIDATE)
		SELF:oOffset:X := oE:ScrollBar:Value
	ENDIF
	
	RETURN NIL


CONSTRUCTOR(oOwner, nResourceID) 
	
	SELF:oPrinter := oOwner:Printer
	
	SUPER(oOwner, nResourceID)
	
		// --------------------------
		//	Variablen initialisieren	
		// --------------------------

	lStyleWord	 := TRUE
	nSbWidth     := 16
	lSbHorz 	 := FALSE
	lSbVert 	 := FALSE
	nGap         := 5	
    oOffset      := Point{0,0}
	lZoomed      := FALSE
	fZoomPercent := 100
	symZoomName	 := #ZoomPage
	symZoomNameZ := #Zoom100
	oCurZoomIn	 := Pointer{ResourceID{"CurZoomIn" , _GetInst()}}
	oCurZoomOut	 := Pointer{ResourceID{"CurZoomOut", _GetInst()}}
	oCurHand	 := Pointer{ResourceID{"CurHand"   , _GetInst()}}
	oCurFaust	 := Pointer{ResourceID{"CurFaust"  , _GetInst()}}
	oCurPos		 := Point{0,0}
	
		// ------------------
		//	Objekte erzeugen
		// ------------------
		
   	hBrushBackground := CreateSolidBrush(GetSysColor(COLOR_BTNFACE))

		// ----------------------
		//	Scrollbars erstellen
		// ----------------------
	
	(SELF:oSbHorz := HorizontalScrollBar{SELF, -1, Point{0,0}, Dimension{0,0}}):Show()
	(SELF:oSbVert := VerticalScrollBar{SELF, -1, Point{0,0}, Dimension{0,0}}):Show()
	(SELF:oSbText := FixedText{SELF, -1, Point{0,0}, Dimension{0,0}}):Show()
	
	SELF:CalculateSize()

	RETURN SELF


METHOD InitScrollBars() 

	LOCAL si 	  IS _winSCROLLINFO		// Struktur für SetScrollInfo()
	LOCAL rc 	  IS _winRECT
	LOCAL nWidth  AS INT
	LOCAL oObj 	  AS OBJECT

	GetClientRect(SELF:Handle(), @rc)

		// ---------------------------------------------
		// 	Berechnen, welche Scrollbars notwendig sind
		// ---------------------------------------------

	lSbHorz	:= FALSE
	lSbVert	:= FALSE

	IF rc.right < rcPaper.right							// Horizontale ScrollBar notwendig
		lSbHorz	:= TRUE
	ENDIF
				
	nWidth := if(lSbHorz, nSbWidth, 0)
	IF rc.bottom - nWidth < rcPaper.bottom				// Vertikale ScrollBar notwendig
		lSbVert := TRUE
		IF rc.right - nSbWidth < rcPaper.right			// Horizontale ScrollBar notwendig
			lSbHorz	:= TRUE
		ENDIF
	ENDIF
			
		// -----------------------------------------------
		// 	Position und Größe der Horizontalen Scrollbar
		// -----------------------------------------------

	IF lSbHorz
		oSbHorz:Show()
		
		nWidth := if(lSbVert, nSbWidth, 0)
		oObj := SELF:oSbHorz
		IF oObj != NULL_OBJECT
			oObj:Size   := Dimension{rc.right - nWidth, nSbWidth}
			oObj:Origin := Point{0, 0}
		ENDIF
		
		// EnableScrollBar(oSbHorz:Handle(), SB_CTL, ESB_ENABLE_BOTH)
		si.cbSize	:= _SizeOf(_winSCROLLINFO)
		si.fMask	:= _Or(SIF_RANGE, SIF_PAGE, SIF_POS)
		si.nMin		:= 0
		si.nMax		:= rcPaper.right
		si.nPage	:= Max(0, rc.right + 1 - nWidth)
		si.nPos		:= oOffset:X
		SetScrollInfo(oSbHorz:Handle(), SB_CTL, @si, TRUE)
		oOffset:X 	:= Min(oOffset:X, si.nMax - si.nPage + 1)
	ELSE
		oSbHorz:Hide()
		oOffset:X := 0
	ENDIF
	
		// ---------------------------------------------
		// 	Position und Größe der vertikalen ScrollBar
		// ---------------------------------------------

	IF lSbVert
		oSbVert:Show()
		
		nWidth := if(lSbHorz, nSbWidth, 0)
		oObj := SELF:oSbVert
		IF oObj != NULL_OBJECT
			oObj:Size	:= Dimension{nSbWidth, rc.bottom - nWidth}
			oObj:Origin := Point{rc.right - nSbWidth, nWidth}
		ENDIF

		// EnableScrollBar(SELF:oSbVert:Handle(), SB_CTL, ESB_ENABLE_BOTH)
		lSbVert		:= TRUE
		si.cbSize	:= _SizeOf(_winSCROLLINFO)
		si.fMask	:= _Or(SIF_RANGE, SIF_PAGE, SIF_POS)
		si.nMin		:= 0
		si.nMax		:= rcPaper.bottom
		si.nPage	:= Max(0, rc.bottom + 1 - nWidth)
		si.nPos		:= oOffset:Y
		SetScrollInfo(oSbVert:Handle(), SB_CTL, @si, TRUE)
		oOffset:Y   := Min(oOffset:Y, si.nMax - si.nPage + 1)
	ELSE
		oSbVert:Hide()
		oOffset:Y := 0
    ENDIF

		// ---------------------------------
		// 	Hilfsfeld ein- oder ausschalten
		// ---------------------------------

	IF lSbHorz  .and. lSbVert
		oSbText:Show()
	ELSE
		oSbText:Hide()
	ENDIF

	RETURN NIL
	

METHOD PaintPage(lEraseBK) 
	
	LOCAL rc 			IS _winRECT
	LOCAL nPage 		AS INT
	LOCAL hRgnPrintArea AS PTR
	LOCAL nPlus			AS INT

	
	Default(@lEraseBK, TRUE)
	
	nPage := SELF:Owner:Page	
	
	// Hintergrund löschen
   	GetClientRect(SELF:Handle(), @rc)
	IF lEraseBK
		FillRect(hDC, @rc, hBrushBackground)
	ENDIF
	
	// Papier zeichnen
	SetRect(@rc, rcPaper.Left, rcPaper.Top, rcPaper.Right, rcPaper.Bottom)
	SelectObject(hDC, GetStockObject(BLACK_PEN))					// Rahmenfarbe
	SelectObject(hDC, GetStockObject(WHITE_BRUSH))
	Rectangle(hDC, rc.left, rc.top, rc.right, rc.bottom)			// mit innerem Rahmen
	
	// Metafile ausgeben und auf Druckbereich begrenzen
	SetRect(@rc, rcMetafile.Left, rcMetafile.Top, rcMetafile.Right, rcMetafile.Bottom)
	// hRgnPrintArea  := CreateRectRgn(rc.left, rc.top, rc.right + 1, rc.bottom + 1)
	nPlus := 1 + INT(4 * SELF:fZoomFactor)                          // 1 + Rundungskorrektur
	IF SELF:oPrinter:ClipPage
		hRgnPrintArea  := CreateRectRgn(rc.left, rc.top, rc.right + nPlus, rc.bottom + nPlus)
	ELSE
		hRgnPrintArea  := CreateRectRgn(rcPaper.Left, rcPaper.Top, rcPaper.Right, rcPaper.Bottom)
	ENDIF
	IF lZoomed
		OffsetRgn(hRgnPrintArea, -oOffset:X, -oOffset:Y)
	ENDIF
	IF TRUE //SELF:oPrinter:ClipPage
		SelectClipRgn(hDC, hRgnPrintArea)
	ENDIF
	IF ( (nPage > 0) ;
          .and. (nPage <= ALen(SELF:oPrinter:Pages)) ;
          .and. (SELF:oPrinter:Pages[nPage] != NULL_PTR) ;
       )
		PlayEnhMetaFile(hdc, SELF:oPrinter:Pages[nPage], @rc)
	ENDIF
	DeleteObject(hRgnPrintArea)
	
	RETURN NIL


METHOD PointInPage(lParam, lScreen) 
	
	LOCAL lRetVal	AS LOGIC
	LOCAL pt 		IS _winPOINT
	LOCAL rc		IS _winRECT
	LOCAL rc1		IS _winRECT			// Client Area
	LOCAL rc2		IS _winRECT         // Paper Area
	
	Default(@lScreen, FALSE)
	lRetVal := FALSE
	
	GetClientRect(SELF:Handle(), @rc1)
	SetRect(@rc2, rcPaper.left, rcPaper.top, rcPaper.right, rcPaper.bottom)
	pt.x := LoWord(lParam)
	pt.y := HiWord(lParam)
	IF lScreen								// Screen coordinates to Client coordinates
		ScreenToClient(SELF:Handle(), @pt)
	ENDIF
	// SELF:Owner:StatusMessage(Str(pt.x) + Str(pt.y), MESSAGEPERMANENT)
	IntersectRect(@rc, @rc1, @rc2)
	IF PtInRect(@rc, pt)
		lRetVal := TRUE
	ENDIF

	RETURN lRetVal

	

METHOD Resize(oResizeEvent) 

	LOCAL	oE := oResizeEvent AS ResizeEvent
	LOCAL	oObj AS OBJECT

	
		// -------------------------------------------------------------------------------
		//	Controls anpassen und positionieren
		// -------------------------------------------------------------------------------
		//  Anmerkung:  Das Ganze funktioniert nur, wenn Size vor Origin festgelegt wird,
		//				da die Controls sonst nicht mehr richtig angezeigt werden.
		// -------------------------------------------------------------------------------

	// SUPER:Resize(oResizeEvent)
	
	oObj := SELF:oSbText
	IF oObj != NULL_OBJECT
		oObj:Size	:= Dimension{nSbWidth, nSbWidth}
		oObj:Origin := Point{oE:Width - nSbWidth, 0}
	ENDIF

	SELF:CalculateSize()
	InvalidateRect(SELF:Handle(), NULL_PTR, TRUE)		// Control aktualisieren
	
	RETURN NIL


ACCESS StyleWord 
	RETURN SELF:lStyleWord

ASSIGN StyleWord(uValue) 
	IF IsLogic(uValue)
		SELF:lStyleWord := uValue
	ENDIF
	RETURN SELF:lStyleWord

METHOD ToggleZoom(oPos, lCurPos) 
	
	SELF:lZoomed := !SELF:lZoomed
	SELF:symZoomName := IF(SELF:lZoomed, SELF:symZoomNameZ, #ZoomPage)	
	SELF:CalculateSize(oPos, lCurPos)
	InvalidateRect(SELF:Handle(), NULL_PTR, TRUE)		// Control aktualisieren
	
	RETURN NIL

METHOD VerticalScroll (oScrollEvent) 

	LOCAL oE		AS ScrollEvent
	LOCAL nScroll 	AS INT	
	LOCAL si 		IS _winSCROLLINFO		// Struktur für GetScrollInfo()
	LOCAL rc		IS _winRECT
	
	oE := oScrollEvent

   	SUPER:VerticalScroll(oE)

	si.cbSize	:= _SizeOf(_winSCROLLINFO)
	si.fMask	:= SIF_PAGE
	GetScrollInfo(SELF:oSbVert:Handle(), SB_CTL, @si)

   	DO CASE
   	CASE oE:TYPE == BLOCKDECREMENT
   		oE:ScrollBar:Value -= si.nPage

   	CASE oE:TYPE == BLOCKINCREMENT
   		oE:ScrollBar:Value += si.nPage

	CASE oE:Type == SCROLLTHUMBDRAG
       	oE:ScrollBar:Value := oE:Position

    OTHERWISE
    	oE:ScrollBar:Value := oE:Position

   	ENDCASE

		// ------------------------------------------------------------------------------
		//	Achtung: Im folgenden muß unbedingt der Wert der ScrollBar genommen werden
		//			 und nicht die Position des ScrollEvents, da unzulässige Werte
		//			 dadurch vermieden und unschöne Bewegungen verhindert werden
		// ------------------------------------------------------------------------------
	
	IF SELF:oOffset:Y != oE:ScrollBar:Value
		nScroll := SELF:oOffset:Y - oE:ScrollBar:Value
		GetClientRect(SELF:Handle(), @rc)
		rc.right  -= nSbWidth
		IF SELF:lSbHorz
			rc.bottom -= nSbWidth
		ENDIF
		ScrollWindowEx(SELF:Handle(), 0, nScroll , ;
					   NULL_PTR, @rc, NULL_PTR, NULL_PTR, SW_INVALIDATE)
		SELF:oOffset:Y := oE:ScrollBar:Value
	ENDIF
	
	RETURN NIL


METHOD Zoom(symName, oPos) 

	LOCAL rc IS _winRECT
	
	SELF:symZoomName := symName
	
	IF symName == #ZoomPage  .and. SELF:lStyleWord
		SELF:lZoomed := FALSE
	ELSEIF InList(symName, #ZoomWidth, #ZoomHeight)
		SELF:lZoomed := TRUE
		SELF:symZoomNameZ := symName
	ELSE
		SELF:lZoomed := TRUE
		SELF:symZoomNameZ := symName
		SELF:fZoomPercent := Val(SubStr(Symbol2String(symName),5))
	ENDIF

	// Mitte des Clientbereich des Controls	übergeben
	IF IsNil(oPos)
		GetClientRect(SELF:Handle(), @rc)
		oPos := Point{rc.right/2, rc.bottom/2}
	ENDIF
	SELF:CalculateSize(oPos)
	InvalidateRect(SELF:Handle(), NULL_PTR, TRUE)		// Control aktualisieren
	
	RETURN NIL
	
	

ACCESS ZoomName 
	RETURN SELF:symZoomName


END CLASS
