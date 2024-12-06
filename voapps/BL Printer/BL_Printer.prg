/*
TEXTBLOCK _ASSIGN Font( hNewFont ) CLASS BL_Printer

	// Entfernt, da hier eventuell Schrift-Pointer zerstört werden, die nicht in dieser Klasse erzeugt wurden
	
	IF SELF:hFont != NULL_PTR
		DeleteObject(SELF:hFont)
		hFont := NULL_PTR
	ENDIF
	SELF:hFont := hNewFont

	RETURN SELF:hFont


*/
/*
TEXTBLOCK _METHOD EndDoc() CLASS Printer

	// Entfernt, um in dieser Library keine Erweiterungen von Standardklassen zu haben.
	// Wird auch nicht benötigt.

  LOCAL i AS INT
  VTrace VMethod

  IF (hDC != NULL_PTR)
    IF	lprValid
      IF (lDocStarted)
        i := EndPage(hDC)
        i := EndDoc(hDC)
      ENDIF
    ENDIF
  ENDIF

  RETURN NIL


*/
CLASS BL_Printer

	PROTECT oOwner 				AS OBJECT
	PROTECT hDC					AS PTR				// Pointer für Gerätecontext (Enhanced Metafile)
	
	PROTECT oPrinter 			AS Printer  		// VO-Printer
	PROTECT cJobName			AS STRING			// Name des Druckjobs
	PROTECT oPrintingDevice		AS BL_PrintingDevice
	PROTECT	lGerman				AS LOGIC			// Flag für deutsches PreviewMenu (Vorgabe: false)
	PROTECT lPreviewActive		AS LOGIC			// Flag, ob Preview aktiv

	PROTECT oPhysicalPaperSize	AS Dimension		// Papiergröße in Pixel
	PROTECT oPrintSize			AS Dimension		// Druckbereich in Pixeln
	PROTECT oPhysicalOffset		AS Point			// Linker oberer Papierrand
	PROTECT oDPI				AS Point			// Pixel pro Inch

	PROTECT	aPages 				AS ARRAY			// Array für Pointer auf Enhanced Metafiles
	PROTECT nPage				AS INT				// Aktuelle Seite
	PROTECT lPageOpen			AS LOGIC			// Seite zum Schreiben geöffnet
	PROTECT hemfPage			AS PTR				// Pointer auf Enhanced Metafile
	PROTECT rcMargins			IS _winRECT     	// Ränder (hmm)
	PROTECT rcPage				IS _winRECT     	// Druckbereich ohne Ränder in 100tel mm (hmm)
	PROTECT lClipPage			AS LOGIC			// Druckbereich bei Ausgabe beschneiden
	PROTECT symCreatePageMethod AS SYMBOL			// Methode des Owners zum Erstellen einer Druckseite
	
	PROTECT oPaperSize			AS Dimension		// Größe des Papiers (hmm)
	PROTECT oPrintAreaSize		AS Dimension		// Größe des Druckbereichs ohne Ränder (hmm)
	PROTECT oPrintAreaOffset	AS Point			// Position des Druckbereichs auf der Seite (hmm)
	PROTECT oExtraPrintOffset	AS Point			// Offset für Korrektur der Druckposition (hmm)
	
	PROTECT oPosition			AS Point			// Druckposition
	PROTECT nLineHeight			AS INT				// Zeilenhöhe (Standard: 6 Zeilen / Inch)
	PROTECT hFont				AS PTR				// Schrift (Standard: Courier New, 12, fett)
	PROTECT cFontname			AS STRING			// Schriftname
	PROTECT nFontSize			AS INT				// Schriftgrösse
	PROTECT lBold				AS LOGIC			// Flag für Fett
	PROTECT lItalic				AS LOGIC			// Flag für Kursiv
	PROTECT lUnderline			AS LOGIC			// Flag für Unterstrichen
	PROTECT lStrikeThru			AS LOGIC			// Flag für Durchgestrichen
	PROTECT oPen				AS Pen				// Zeichenstift

	PROTECT cPrintInfoCaption	AS STRING			// Caption für PrintInfo-Dialog
	PROTECT cPrintInfoText		AS STRING			// Text für PrintInfo-Dialog
	PROTECT cPrintInfoButton    AS STRING			// Button-Beschriftung für PrintInfo-Dialog
	

METHOD AppendPage(uPage) 
	
	// ========================================================================
	//	Es wird eine neue Seite hinzugefügt.
	// ------------------------------------------------------------------------
	// 	uPage kann auch ein Window-Handle sein.
	//	Vor dem Ausgeben der Seite wird das Window mit CreatePage(nPage)
	//	aufgefordert, die Seite zu erstellen.
	// ========================================================================

	AAdd(aPages, uPage)
	
	RETURN NIL


DESTRUCTOR() 
	SELF:Destroy()
	

METHOD CheckPage(nPage) 

	// Window zum Erstellen der Seite auffordern, wenn diese noch nicht existiert
	
	IF aPages[nPage] == NULL_PTR
		IF IsMethod(oOwner, SELF:symCreatePageMethod)
			SELF:StartPage(nPage)
			Send(oOwner, SELF:symCreatePageMethod, nPage, hDC)
			IF SELF:lPageOpen
				SELF:EndPage()
			ENDIF
		ENDIF
	ENDIF
	
	RETURN NIL


ACCESS ClipPage 
	RETURN SELF:lClipPage

ASSIGN ClipPage(lValue) 
	IF IsLogic(lValue)
		SELF:lClipPage := lValue
	ENDIF
	RETURN SELF:lClipPage

METHOD DeleteAllPages(lClearOnly) 
	
	LOCAL i, nLen AS INT
	
	Default(@lClearOnly, FALSE)
	
	nLen := ALen(SELF:aPages)
	FOR i := 1 TO nLen
		IF SELF:aPages[i] != NULL_PTR
			DeleteEnhMetaFile(SELF:aPages[i])
			SELF:aPages[i] := NULL_PTR
		ENDIF
	NEXT i

	IF !lClearOnly
		ASize(SELF:aPages, 0)
	ENDIF
	

METHOD Destroy() 
	
	SELF:DeleteAllPages()
	
	IF SELF:hemfPage != NULL_PTR
		DeleteEnhMetaFile(SELF:hemfPage)
	ENDIF
	SELF:hemfPage := NULL_PTR

	IF hFont <> NULL_PTR							// Font-Objekte freigeben
   		DeleteObject(hFont)
   	  	hFont := NULL_PTR
   	ENDIF	
	
	// SUPER:Destroy()
	
	RETURN SELF


METHOD DrawBitMap( nLeft, nTop, nWidth, nHeight, uBitmap, lProportional ) 

    LOCAL _oBitmap 	AS Bitmap
    LOCAL _lDestroy AS LOGIC
    LOCAL hDIB      AS PTR
    LOCAL fX, fY	AS FLOAT		// Skalierungsfaktoren

    IF IsString( uBitMap )
        _oBitmap := Bitmap{ResourceID{uBitmap, _GetInst()}}
        // _oBitmap := Bitmap{ResourceID{uBitmap, _GetInst()}, BMP_3DTRANSPARENT}
        // _oBitmap := Bitmap{ResourceID{uBitmap, _GetInst()}, _or(BMP_2DTRANSPARENT, BMP_3DTRANSPARENT)}
        _lDestroy := TRUE
    ELSEIF IsInstanceOfUsual( uBitmap, #Bitmap )
        _oBitmap := uBitMap
        _lDestroy := FALSE
    ELSE
        _oBitmap := Bitmap{ResourceID{"POWVOBMP", _GetInst()}}
        _lDestroy := TRUE
    ENDIF

	Default(@lProportional, TRUE)
	
	IF IsNil(nWidth)  .and. IsNil(nHeight)
		nWidth := _oBitmap:Size:Width
		nWidth := _oBitmap:Size:Height
	ELSEIF IsNil(nWidth)
		fX := fY := nHeight / _oBitmap:Size:Height
		nWidth := fX * _oBitmap:Size:Width
	ELSEIF IsNil(nHeight)
		fX := fY := nWidth / _oBitmap:Size:Width
		nHeight := fY * _oBitmap:Size:Height
	ELSE
		fX := nWidth / _oBitmap:Size:Width
		fY := nHeight / _oBitmap:Size:Height
	ENDIF

	IF lProportional  .and. fX != fY
		IF fX > fY
			nWidth := fY * _oBitmap:Size:Width
		ELSE
			nHeight := fX * _oBitmap:Size:Height
		ENDIF
	ENDIF

	hDIB := __WCDIBFromBitmap(_oBitmap:Handle())
	// hDIB := __WCDIBFromBitmap(_oBmpObj:Handle())
    __WCStretchDibBlt(hDC, nLeft, nTop, nWidth, nHeight, hDIB)
    GlobalFree(hDIB)


    IF _lDestroy  .AND. !InCollect()
        _oBitmap:Destroy()
        _oBitmap := NULL_OBJECT
    ENDIF

RETURN TRUE


METHOD DrawBox(nLeft, nTop, nWidth, nHeight, nLineSize) 
	
	// Zeichnet eine einfache Box
	
	LOCAL rc IS _winRECT
   	LOCAL oOldPen AS Pen
	LOCAL hOldPen AS PTR
	
   	IF nLineSize != NIL
      	oOldPen := SELF:Pen
      	SELF:Pen := Pen{,,nLineSize}
   	ENDIF

	IF SELF:oPen != NULL_OBJECT
		hOldPen := SelectObject(hDC, SELF:oPen:Handle())
	ENDIF
	
	SetRect(@rc, nLeft, nTop, nLeft + nWidth, nTop + nHeight)

	MoveToEx(hDC, rc.Left, rc.Top, NULL_PTR)
	LineTo(hDC, rc.Right, rc.Top)
	LineTo(hDC, rc.Right, rc.Bottom)
	LineTo(hDC, rc.Left, rc.Bottom)
	LineTo(hDC, rc.Left, rc.Top)

   	IF hOldPen != NULL_PTR
      	SELF:Pen := oOldPen
	   	SelectObject(hDC, hOldPen)
   	ENDIF

	RETURN TRUE


METHOD DrawLine(nLeft, nTop, nRight, nBottom, nLineSize) 
	
   	LOCAL oOldPen AS Pen
   	LOCAL hOldPen AS PTR

   	IF nLineSize != NIL
      	oOldPen := SELF:Pen
      	SELF:Pen := Pen{,,nLineSize}
   	ENDIF

	IF SELF:oPen != NULL_OBJECT
		hOldPen := SelectObject(hDC, SELF:oPen:Handle())
	ENDIF
	
   	MoveToEx(hDC, nLeft, nTop, NULL)
   	LineTo(hDC, nRight, nBottom)

   	IF hOldPen != NULL_PTR
      	SELF:Pen := oOldPen
	   	SelectObject(hDC, hOldPen)
   	ENDIF

   	RETURN TRUE


METHOD DrawText(nLeft, nTop, nWidth, nHeight, cText, nFormat, hFont, nBkMode) 
	
	// nX,nY,nWidth,nHeight,cText,nOrientation
	LOCAL rc 		 IS _winRECT
	LOCAL iOptions   AS DWORD
	LOCAL nOldBkMode AS INT
	LOCAL hOldFont 	 AS PTR
	LOCAL nRetHeight AS INT
	
	Default(@nLeft, SELF:PosX)
	Default(@nTop, SELF:PosY)
	Default(@nWidth, 0)
	Default(@nHeight, 0)
	Default(@cText,"")
	Default(@nFormat, 0)
	Default(@hFont, SELF:hFont)
	Default(@nBkMode, TRANSPARENT)

	SetRect(@rc, nLeft, nTop, nLeft + nWidth, nTop + nHeight)

	// Hintergrundmodus setzen (Default: TRANSPARENT für Überschneidungen bei Blockgrafikzeichen)
	nOldBkMode  := SetBkMode(hDC, PTR(_CAST, nBkMode))
	// gewünschte Schriftart setzen
	hOldFont := SelectObject(hDC,hFont)
	
	iOptions := DT_TABSTOP + DT_EXPANDTABS + DT_NOPREFIX
	IF nHeight == 0
		// Aufruf 1 : Nur Höhe und Breite berechnen
		DrawTextEx(hDC,cText,SLen(cText),@rc,iOptions+nFormat+DT_CALCRECT,NULL)
		// Ausgabe-Rechteck positionieren
		OffsetRect(@rc,SELF:oPosition:X,SELF:oPosition:Y)
	ENDIF
	
	// Aufruf 2 : Ausgabe auf Drucker
	nRetHeight := DrawTextEx(hDC,cText,SLen(cText),@rc,iOptions+nFormat,NULL)
	
	// Druck-Position anpassen
	// nSELF:oPosition:X := SELF:oPosition:X + rc.right + 1 - rc.left
	
	// Schriftart und Hintergrund zurücksetzen
	SelectObject(hDC, hOldFont)
	SetBkMode(hDC, nOldBkMode)
	
	RETURN nRetHeight


METHOD EndPage() 
	
	LOCAL hEMF AS PTR
	
	
	IF !SELF:lPageOpen							// Abbruch, da keine Seite geöffnet
		RETURN FALSE
	ENDIF
	
	hEMF := CloseEnhMetaFile(hDC)				// Enhanced MetaFile schließen
	IF ALen(aPages) < nPage                     // Array mit Seiten vergrößern
		ASize(aPages, nPage)
	ENDIF
	IF aPages[nPage] != NIL            			// altes MetaFile freigeben
		DeleteEnhMetaFile(aPages[nPage])
	ENDIF
	aPages[nPage] := hEMF						// Handle des MetaFiles speichern
	
	SELF:lPageOpen := FALSE
	
	

ACCESS ExtraPrintOffset 
	RETURN SELF:oExtraPrintOffset

ASSIGN ExtraPrintOffset(oPoint) 
	IF IsInstanceOfUsual(oPoint, #Point)
		SELF:oExtraPrintOffset:X := oPoint:X
		SELF:oExtraPrintOffset:Y := oPoint:Y
	ENDIF
	RETURN SELF:oExtraPrintOffset

ACCESS German 
	RETURN SELF:lGerman

METHOD GetDC() 
	
	RETURN SELF:hDC


METHOD GetTextSize(cText, uFont) 

	// ==================================================================================
	//	Diese Funktion benutzt ein temporäres Metafile zur Berechnung der Textgröße.
	// ----------------------------------------------------------------------------------
	//	Die vergleichbare Methode SizeText() setzt ein geöffnetes Metafile voraus.
	// ==================================================================================

	LOCAL	oSize 				AS Dimension
	LOCAL 	hDC 				AS PTR
	LOCAL 	hEMF 				AS PTR
	LOCAL	hFont, hOldFont 	AS PTR
	LOCAL	nOptions			AS INT
	LOCAL	rc					IS _winRECT
	LOCAL 	pt 					IS _winPOINT
	LOCAL 	hdcPrn 				AS PTR
	
	
	Default(@cText, "Text")
	
	// DeviceContext ermitteln
	SetRect(@rc, rcPage.Left, rcPage.Top, rcPage.Right, rcPage.Bottom)
	hDC := CreateEnhMetaFile(oPrinter:Handle(), NULL, @rc, NULL)
	IF hDC == NULL_PTR
		MessageBox (0, PSZ(_CAST,"Fehler bei CreateEnhMetaFile()"), PSZ(_CAST,""), 0)
		RETURN Dimension{0,0}
	ENDIF

	// Koordinatensystem auf links oben umschalten
	SetMapMode(hDC, MM_ANISOTROPIC)
	SetWindowExtEx(hDC, rc.Right, -rc.Bottom, NULL)

	// logical units in device units umrechnen
	// und Viewport des device context entsprechend setzen
	hdcPrn := CreateCompatibleDC(oPrinter:Handle())		// Werte für Viewport ermitteln
	IF hdcPrn == NULL_PTR						
		MessageBox (0, PSZ(_CAST,"Fehler bei Werte für Viewport !"), PSZ(_CAST,""), 0)
		RETURN NULL_PTR
	ENDIF
	SetMapMode(hdcPrn, MM_HIMETRIC)
	pt.x := rcPage.Right								// Druckbereich
	pt.y := rcPage.Bottom
	LPtoDP(hdcPrn, @pt, 1)								// Daten für Viewport ermitteln
	DeleteDC(hdcPrn)
	SetViewportExtEx(hDC, pt.x, pt.y, NULL)

	// Schrift festlegen
	IF IsPtr(uFont)
		hFont := uFont
	ELSEIF IsObject(uFont)
		hFont := uFont:Handle()
	ELSE
		hFont := SELF:hFont
	ENDIF
	hOldFont := SelectObject(hDC, hFont)
	
	// Textausdehnung berechnen
	nOptions := DT_CALCRECT
	DrawText(hDC, String2Psz(cText), SLen(cText), @rc, nOptions)
	oSize := Dimension{rc.Right, rc.Bottom}
	
	// Objekte freigeben
	SelectObject(hDC, hOldFont)
	hEMF := CloseEnhMetaFile(hDC)				// Enhanced MetaFile schließen
	DeleteEnhMetaFile(hEMF)						// Enhanced MetaFile löschen

	RETURN oSize


METHOD Hmm2PxX(i) 
	// Umrechnung Hundertstel-Millimeter -> Pixel (X-Achse)
	RETURN MulDiv(i, oDPI:X, 2540)

METHOD Hmm2PxY(i) 
	// Umrechnung Hundertstel-Millimeter -> Pixel (Y-Achse)
	RETURN MulDiv(i, oDPI:Y, 2540)

CONSTRUCTOR(oOwner, cJobName, oDevice, lGerman) 
	
	Default(@cJobName, "BL_Printer")
	IF IsNil(oDevice)
		oDevice := BL_PrintingDevice{}
	ENDIF
	Default(@lGerman, TRUE)

	RegisterAxit(SELF)

		// --------------------------
		//  Variablen initialisieren
		// --------------------------
	
	SELF:oOwner 	     := oOwner
	SELF:cJobName		 := cJobName
    SELF:oPrintingDevice := oDevice
    SELF:lGerman		 := lGerman
    SELF:lPreviewActive	 := FALSE
	
	SELF:hDC       := NULL_PTR
	SELF:aPages    := {}
	SELF:nPage     := 0
	SELF:lPageOpen := FALSE
	SELF:lClipPage := TRUE
	SELF:symCreatePageMethod := #BL_PrinterCreatePage

	SELF:oExtraPrintOffset := Point{0,0}			// Offset für Korrektur der Druckposition (hmm)
	
	SELF:oPosition	 :=	Point{0,0}					// Druckposition
	SELF:SetLineHeight(INT(2540 / 6))				// Zeilenhöhe (Standard: 6 Zeilen / Inch)
	SELF:SetFont("Courier New", 12, TRUE, FALSE)	// Schrift für Zeilendruck (Courier New, 12, fett)
	SELF:oPen := Pen{,,26}							// Linienstärke (2540/96)

	IF lGerman
		SELF:cPrintInfoCaption := "Drucken mit BL_Printer"
		SELF:cPrintInfoText    := "Drucken von Seite "
		SELF:cPrintInfoButton  := "Abbrechen"
	ELSE
		SELF:cPrintInfoCaption := "Print with BL_Printer"
		SELF:cPrintInfoText	   := "Printing Page "
		SELF:cPrintInfoButton  := "Abort"
	ENDIF

	SELF:Update()

	RETURN SELF


ACCESS LineHeight 
	RETURN SELF:nLineHeight


ASSIGN LineHeight(uValue) 
	SELF:nLineHeight := uValue
	RETURN SELF:nLineHeight


METHOD NewLine() 
	
	SELF:oPosition:X := 0
	SELF:oPosition:Y := SELF:oPosition:Y + SELF:nLineHeight
	
	RETURN NIL


METHOD NewPage() 
	
	RETURN SELF:StartPage()


ASSIGN Orientation(nOrientation) 

	SELF:PrintingDevice:Orientation := nOrientation
	SELF:Update()

	RETURN nOrientation


ACCESS Owner 
	RETURN SELF:oOwner

ACCESS Pages 
	RETURN SELF:aPages


ACCESS PaperSize 
	RETURN SELF:oPaperSize


ACCESS Pen 
	RETURN SELF:oPen


ASSIGN Pen(uValue) 
	IF IsInstanceOfUsual(uValue, #Pen)
		SELF:oPen := uValue
	ENDIF
	RETURN SELF:oPen


ACCESS PosX 
	RETURN SELF:oPosition:X

ACCESS PosY 
	RETURN SELF:oPosition:Y	

METHOD Preview(oWindow, nPage, oMenu, cCaption, lStyleWord, symZoom, oShell) 
	
	LOCAL oWin AS Window
	
	Default(@nPage, 1)
	
	// Geöffnete Seite schließen
	IF SELF:lPageOpen
		SELF:EndPage()
	ENDIF

	// Menü muss von BL_PrinterMenu abgeleitet sein
	IF !IsNil(oMenu)  .and. !IsInstanceOf(oMenu, #BL_PrinterMenu)
		MessageBox(oWindow:Handle(), ;
				   AsPsz("Das Menü ist keine Instance von BL_PrinterMenu"), ;
                   AsPsz("Fehler"), 0)
        RETURN NULL_OBJECT
	ENDIF

	IF ALen(SELF:Pages) > 0
		oWin := DtaPreview{oWindow, SELF, nPage, oMenu, cCaption, lStyleWord, symZoom, oShell}
		oWin:Show()
	ELSE
		MessageBox(oWindow:Handle(), ;
				   AsPsz("Es sind keine Seiten vorhanden"), ;
                   AsPsz("Preview-Fehler"), 0)
		oWin := NULL_OBJECT
	ENDIF
	
	RETURN oWin


ACCESS PreviewActive 
	RETURN SELF:lPreviewActive

ASSIGN PreviewActive(uWert) 
	SELF:lPreviewActive := if(uWert, TRUE, FALSE)
	RETURN SELF:lPreviewActive

METHOD Print(nFromPage, nToPage, nCopies, lSort) 
	
	LOCAL rc 				 IS _winRECT
	LOCAL hdcPrinter 		 AS PTR
	LOCAL iCopy, iPage	 	 AS INT
	LOCAL nOffsetX, nOffsetY AS INT
	LOCAL hRgnPrintArea 	 AS PTR
	LOCAL oDlgPrintInfo		 AS DlgPrintInfo


	IF IsNil(nFromPage)
		nFromPage := 1
		nToPage	  := ALen(aPages)
	ENDIF
	Default(@nToPage, nFromPage)
	Default(@nCopies, 1)
	Default(@lSort, TRUE)
	
	nToPage := Min(nToPage, ALen(aPages))
	IF nToPage < nFromPage
		RETURN NIL
	ENDIF

	hdcPrinter := SELF:oPrinter:Handle()
	SaveDC(hdcPrinter)

	// Dialogfenster für PrintInfo einrichten
	oDlgPrintInfo := DlgPrintInfo{SELF:Owner, SELF:oPrinter}
	oDlgPrintInfo:Caption := SELF:cPrintInfoCaption
	oDlgPrintInfo:Button  := SELF:cPrintInfoButton
	oDlgPrintInfo:Show(SHOWCENTERED)
	ApplicationExec(EXECWHILEEVENT)

	// Koordinatensystem auf Links/Oben umschalten
	SetMapMode(hdcPrinter,MM_TEXT)
	SetViewportOrgEx(hdcPrinter,0,0,NULL)

	SELF:oPrinter:BeginDoc()
	
	// Druckbereich festlegen
	nOffsetX := SELF:Hmm2PxX(SELF:PrintAreaOffset:X + SELF:oExtraPrintOffset:X) - SELF:oPhysicalOffset:X
	nOffsetY := SELF:Hmm2PxY(SELF:PrintAreaOffset:Y + SELF:oExtraPrintOffset:Y) - SELF:oPhysicalOffset:Y
	SetRect(@rc, nOffsetX, ;
				 nOffsetY, ;
				 nOffsetX + SELF:Hmm2PxX(SELF:oPrintAreaSize:Width) - 1, ;
				 nOffsetY + SELF:Hmm2PxY(SELF:oPrintAreaSize:Height) - 1)
	
	// Seiten Drucken und auf Druckbereich begrenzen
	hRgnPrintArea  := CreateRectRgn(rc.left, rc.top, rc.right + 1, rc.bottom + 1)
	IF SELF:ClipPage
		SelectClipRgn(hDCPrinter, hRgnPrintArea)
	ENDIF

	IF lSort
		// Sortierte Ausgabe
		FOR iCopy := 1 TO nCopies
			FOR iPage := nFromPage TO nToPage
				oDlgPrintInfo:InfoText := SELF:cPrintInfoText + NTrim(iPage)
				ApplicationExec(EXECWHILEEVENT)
		
				// Seite erstellen, wenn diese noch nicht existiert
				SELF:CheckPage(iPage)
			
				// Seitenwechsel einfügen
				IF iPage > nFromPage
				    StartPage(hdcPrinter)
				ENDIF
			
				// Seite ausgeben
				PlayEnhMetaFile(hdcPrinter, aPages[iPage], @rc)
			    EndPage(hdcPrinter)
			NEXT iPage
		NEXT iCopy
	ELSE
		// Unsortierte Ausgabe
		FOR iPage := nFromPage TO nToPage
			FOR iCopy := 1 TO nCopies
				oDlgPrintInfo:InfoText := SELF:cPrintInfoText + NTrim(iPage)
				ApplicationExec(EXECWHILEEVENT)
		
				// Seite erstellen, wenn diese noch nicht existiert
				SELF:CheckPage(iPage)
			
				// Seitenwechsel einfügen
				IF iPage > nFromPage
				    StartPage(hdcPrinter)
				ENDIF
			
				// Seite ausgeben
				PlayEnhMetaFile(hdcPrinter, aPages[iPage], @rc)
			    EndPage(hdcPrinter)
			NEXT iCopy
		NEXT iPage
	ENDIF
	DeleteObject(hRgnPrintArea)
		
	// Druck beenden
    EndDoc(hdcPrinter)
	oDlgPrintInfo:Destroy()
	
	RestoreDC(hdcPrinter, -1)
		
	RETURN NIL


ACCESS PrintAreaOffset 
	RETURN SELF:oPrintAreaOffset

ACCESS PrintAreaSize 
	RETURN SELF:oPrintAreaSize

METHOD PrintDialog(nAktPage, nFlags) 

	IF !SELF:oPrintingDevice:PrintDialog(nAktPage, nFlags)
		RETURN FALSE
	ENDIF
	
	SELF:Update()
	
	RETURN TRUE


ACCESS Printer 
	RETURN oPrinter


METHOD PrinterInfo(oWindow, cText, cCaption) 
	
	LOCAL	hWin	AS PTR
	LOCAL	cMes	AS STRING
	LOCAL	c		AS STRING
	LOCAL	n		AS INT
	
	
	IF IsNil(oWindow)
		hWin := NULL_PTR
	ELSE
		hWin := oWindow:Handle()
	ENDIF
	Default(@cText, "")
	Default(@cCaption, "Printer-Info")

	cMes := cText
	IF SLen(cMes) > 0
		cMes += CRLF + CRLF
	ENDIF

	cMes += "Printingdevice:" + Space(50) + CRLF
	cMes += CRLF
	
	c := "null_object"
	IF !IsNil(oPrintingDevice)
		c := Symbol2String(ClassName(oPrintingDevice))
	ENDIF
	cMes += "Class:  " + CHR(9) + c + CRLF
	
	c := "false"
	IF !IsNil(oPrintingDevice)  .and. oPrintingDevice:IsValid()
		c := "true"
	ENDIF
	cMes += "Valid:  " + CHR(9) + c + CRLF
	
	cMes += "Device: " + CHR(9) + oPrintingDevice:Device + CRLF
	cMes += "Driver: " + CHR(9) + oPrintingDevice:Driver + CRLF
	cMes += "Device: " + CHR(9) + oPrintingDevice:Port + CRLF

	c := "unbekannt"
	IF !IsNil(oPrintingDevice)  .and. oPrintingDevice:IsValid()
		n := oPrintingDevice:Orientation
		DO CASE
		CASE n == DMORIENT_PORTRAIT		; c := "Hochformat"
		CASE n == DMORIENT_LANDSCAPE	; c := "Querformat"
		OTHERWISE						; c := NTrim(n)
		ENDCASE
	ENDIF
	cMes += "Format: " + CHR(9) + c + CRLF
	
	cMes += CRLF
	cMes += "Seiten-Informationen in Pixel:" + CRLF
	cMes += CRLF

	cMes += "PhysicalPaperSize: " + CHR(9) + NTrim(oPhysicalPaperSize:Width) + " x " + NTrim(oPhysicalPaperSize:Height) + CRLF
	cMes += "PrintSize:         " + CHR(9) + NTrim(oPrintSize:Width) + " x " + NTrim(oPrintSize:Height) + CRLF
	cMes += "PhysicalOffset:    " + CHR(9) + NTrim(oPhysicalOffset:X) + " ; " + NTrim(oPhysicalOffset:Y) + CRLF
	cMes += "DPI:               " + CHR(9) + NTrim(oDPI:X) + " ; " + NTrim(oDPI:Y) + CRLF

	cMes += CRLF
	cMes += "Seiten-Informationen in hmm:" + CRLF
	cMes += CRLF

	cMes += "Papiergröße:          " + CHR(9) + NTrim(oPaperSize:Width) + " x " + NTrim(oPaperSize:Height) + CRLF
	cMes += "Druckbereich:         " + CHR(9) + NTrim(oPrintAreaSize:Width) + " x " + NTrim(oPrintAreaSize:Height) + CRLF
	cMes += "Rand links/rechts:" + CHR(9) + NTrim(rcMargins.Left) + " / " + NTrim(rcMargins.Right) + CRLF
	cMes += "Rand oben/unten:  " + CHR(9) + NTrim(rcMargins.Top) + " / " + NTrim(rcMargins.Bottom) + CRLF
	cMes += CRLF
	
	MessageBox(hWin, AsPsz(cMes), AsPsz(cCaption), 0)
	
	RETURN NIL


ACCESS PrintInfoButton 
	RETURN SELF:cPrintInfoButton

ASSIGN PrintInfoButton(uValue) 
	IF IsString(uValue)
		SELF:cPrintInfoButton := uValue
	ENDIF
	RETURN SELF:cPrintInfoButton


ACCESS PrintInfoCaption 
	RETURN SELF:cPrintInfoCaption

ASSIGN PrintInfoCaption(uValue) 
	IF IsString(uValue)
		SELF:cPrintInfoCaption := uValue
	ENDIF
	RETURN SELF:cPrintInfoCaption

ACCESS PrintInfoText 
	RETURN SELF:cPrintInfoCaption

ASSIGN PrintInfoText(uValue) 
	IF IsString(uValue)
		SELF:cPrintInfoText := uValue
	ENDIF
	RETURN SELF:cPrintInfoText

ACCESS PrintingDevice 
	RETURN oPrintingDevice


METHOD PrintPage(nPage) 

	Default(@nPage, SELF:nPage)	
	SELF:Print(nPage)


METHOD PrintRTF(uRTF, nPageRTF) 
	
	// ========================================================================
	//	Methode zur Ausgabe eines RTF-Dokumentseite auf eine Druckerseite
	// ------------------------------------------------------------------------
	//	- Fall nichts anderes vorgegeben wird, wird immer die Seite des
	//	  Dokuments ausgegeben, für die eine Druckseite erstellt wird.
	//  - Das RTF-Dokument kann als Objekt oder Dateiname übergeben werden.
	//	- siehe auch SDK - RichEdit:Print()
	// ========================================================================

	LOCAL oRTF				AS RichEdit
	LOCAL strucFormatRange 	IS _winFormatRange
	LOCAL liTextOut 		AS LONG
	LOCAL liTextPos 		AS LONG
	LOCAL liTextAmt 		AS LONG
	LOCAL hDC 				AS PTR
	LOCAL nOldMode 			AS INT
	LOCAL strucSizeWin 		IS _winSize
	LOCAL strucSizeView 	IS _winSize
	LOCAL nAktPage			AS INT


	Default(@uRTF, "")
	Default(@nPageRTF, SELF:nPage)
	
	IF IsInstanceOfUsual(uRTF, #RichEdit)
		oRTF := uRTF
	ELSEIF File(uRTF)
		oRTF := RichEdit{SELF:Owner, 0, Point{0,0}, Dimension{0,0}}
		oRTF:LoadFromFile(uRTF)
	ENDIF

	IF oRTF == NULL_OBJECT
		RETURN FALSE
	ENDIF

	liTextAmt := SendMessage(oRTF:Handle(), WM_GETTEXTLENGTH, 0, 0)
	IF liTextAmt = 0
		RETURN FALSE
	ENDIF

	hDC := SELF:GetDC()

	strucFormatRange.hDC := strucFormatRange.hDCTarget := hDC
	
	// Seitengröße und Ränder in Twips festlegen (1440 Twips = 1 Inch = 2540 hmm)

	// area to render to and area of rendering device
	strucFormatRange.rcPage.left   := SELF:rcPage.left
	strucFormatRange.rcPage.top    := SELF:rcPage.top
	strucFormatRange.rcPage.right  := SELF:rcPage.right * 1440 / 2540
	strucFormatRange.rcPage.bottom := SELF:rcPage.bottom * 1440 / 2540

	// keine Ränder
	CopyRect(@strucFormatRange.rc, @strucFormatRange.rcPage)

	// range to print
	strucFormatRange.chrg.cpMin := 0
	strucFormatRange.chrg.cpMax := -1

	// add null terminator plus 1
	liTextAmt += 2
	liTextOut := 0

	// Alten MapMode sichern und auf MM_TEXT umstellen
	GetWindowExtEx(hDC, @strucSizeWin)
	GetViewportExtEx(hDC, @strucSizeView)
	nOldMode := SetMapMode(hDC, MM_TEXT)

	// Seite ermitteln und ausgeben
	nAktPage := 0
	WHILE (liTextOut < liTextAmt)
		liTextPos := liTextOut
		nAktPage ++
		
		IF nAktPage < nPageRTF
			liTextOut := SendMessage(oRTF:Handle(), EM_FORMATRANGE, 0, LONG(_CAST, @strucFormatRange))
			IF liTextOut <= liTextPos
				liTextOut := liTextAmt
			ENDIF
		ELSE
			liTextOut := SendMessage(oRTF:Handle(), EM_FORMATRANGE, 0, LONG(_CAST, @strucFormatRange))
			IF liTextOut > liTextPos
				SendMessage(oRTF:Handle(), EM_DISPLAYBAND, 0, LONG(_CAST, @strucFormatRange.rc ))
			ELSE
				liTextOut := liTextAmt
			ENDIF
			EXIT
		ENDIF

		IF liTextOut < liTextAmt
			strucFormatRange.chrg.cpMin := liTextOut
			strucFormatRange.chrg.cpMax := -1
		ENDIF
	ENDDO

	// Alten MapMode wiederherstellen
	SetMapMode(hDC, nOldMode)
	SetWindowExtEx(hDC, strucSizeWin.cx, strucSizeWin.cy, NULL)
	SetViewportExtEx(hDC, strucSizeView.cx, strucSizeView.cy, NULL)

	// free cached information
	SendMessage(oRTF:Handle(), EM_FORMATRANGE, 1, 0L)

	RETURN TRUE


METHOD PrintSelectedPages(nCopies, lSort) 
	
	LOCAL	oRange AS Range
	
	
	oRange := SELF:oPrintingDevice:PageRange
	
	IF oRange:Min > 0
		SELF:Print(oRange:Min, oRange:Max, nCopies, lSort)
	ELSE
		SELF:Print(NIL, NIL, nCopies, lSort)
	ENDIF

	RETURN NIL	
	

METHOD Px2hmmX(i) 
	// Umrechnung Pixel -> Hundertstel-Millimeter (X-Achse)
	RETURN MulDiv(i, 2540, oDPI:X)

METHOD Px2hmmY(i) 
	// Umrechnung Pixel -> Hundertstel-Millimeter (Y-Achse)
	RETURN MulDiv(i, 2540, oDPI:Y)


METHOD SetCreatePageMethod(symMethod) 
	
	IF IsSymbol(symMethod)
		SELF:symCreatePageMethod := symMethod
	ENDIF
	
	RETURN SELF:symCreatePageMethod


METHOD SetFont( cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeThru ) 
	
	SELF:cFontname 	 := IF( IsNil(cFontName)  , "CourierNew", cFontName)
	SELF:nFontSize 	 := IF( IsNil(nFontSize)  , 12, nFontSize)
	SELF:lBold 		 := IF( IsNil(lBold)      , FALSE, lBold)
	SELF:lItalic	 := IF( IsNil(lItalic)    , FALSE, lItalic)
	SELF:lUnderline	 := IF( IsNil(lUnderline) , FALSE, lUnderline)
	SELF:lStrikeThru := IF( IsNil(lStrikeThru), FALSE, lStrikeThru)

	IF SELF:hFont != NULL_PTR
		DeleteObject(SELF:hFont)
		hFont := NULL_PTR
	ENDIF
	SELF:hFont := BL_CreateFontHmm(SELF:cFontname, SELF:nFontSize, SELF:lBold, ;
								   SELF:lItalic, SELF:lUnderline, SELF:lStrikeThru)
	
	RETURN NIL


METHOD SetFontStyle(symStyle, lOnOff) 
	
	Default(@lOnOff, TRUE)
	
	DO CASE
	CASE symStyle == #BOLD
		SELF:lBold := lOnOff
	CASE symStyle == #NORMAL	
		SELF:lBold := !lOnOff
	CASE symStyle == #ITALIC
		SELF:lItalic := lOnOff
	CASE symStyle == #UNDERLINE
		SELF:lUnderline := lOnOff
	CASE symStyle == #STRIKETHRU
		SELF:lStrikeThru := lOnOff
	OTHERWISE
		MessageBox(0, PSZ(_CAST,"Falsche Angabe bei 'SetFontStyle'"), PSZ(_CAST,"Fehler"), 0)
	ENDCASE	
	
	IF SELF:hFont != NULL_PTR
		DeleteObject(SELF:hFont)
		hFont := NULL_PTR
	ENDIF
	SELF:hFont := BL_CreateFontHmm(SELF:cFontname, SELF:nFontSize, SELF:lBold, ;
								   SELF:lItalic, SELF:lUnderline, SELF:lStrikeThru)
	
	RETURN NIL

METHOD SetLineHeight(nHmm) 

	IF !IsNil(nHmm)
		SELF:nLineHeight := nHmm
	ENDIF
	
	RETURN SELF:nLineHeight


METHOD SetMargins(nLeft, nTop, nRight, nBottom) 
	
	rcMargins.Left   := nLeft
	rcMargins.Top    := nTop
	rcMargins.Right  := nRight
	rcMargins.Bottom := nBottom
	
	SELF:Update()
	

METHOD SetPosition(nX,nY) 
	
	IF !IsNil(nX)
		SELF:oPosition:X := nX
	ENDIF
	IF !IsNil(nY)
		SELF:oPosition:Y := nY
	ENDIF
	
	RETURN NIL


METHOD SetUp() 

	LOCAL lRetVal AS LOGIC
	
	lRetVal	:= FALSE
	IF SELF:oPrintingDevice:Setup()
		SELF:Update()
		lRetVal	:= TRUE
	ENDIF
	
	RETURN lRetVal

METHOD SizeText(cText) 
	
	LOCAL dwSize   AS DWORD
  	LOCAL winSize  IS _winSize
	LOCAL hOldFont AS PTR

	IF IsString(cText)  .and. SELF:hDC != NULL_PTR
		hOldFont := SelectObject(hDC,hFont)
	    GetTextExtentPoint32(hDC, Cast2Psz(cText), INT(_CAST, SLen(cText)),  @winSize)
		SelectObject(hDC, hOldFont)
	    dwSize := DWORD(_CAST, MAKELONG(WORD(_CAST, winSize.cx), WORD(_CAST, winSize.cy)))
	    RETURN Dimension{LoWord(dwSize),HiWord(dwSize)}
  	ENDIF

	RETURN Dimension{0,0}
	

METHOD SizeTextblock(nLeft, nTop, nWidth, nHeight, cText, nFormat, hFont) 
	
	// nX,nY,nWidth,nHeight,cText,nOrientation
	LOCAL rc 		 IS _winRECT
	LOCAL iOptions   AS DWORD
	LOCAL hOldFont 	 AS PTR

	
	Default(@nLeft, SELF:PosX)
	Default(@nTop, SELF:PosY)
	Default(@nWidth, 0)
	Default(@nHeight, 0)
	Default(@cText,"")
	Default(@nFormat, 0)
	Default(@hFont, SELF:hFont)

	SetRect(@rc, nLeft, nTop, nLeft + nWidth, nTop + nHeight)

	// gewünschte Schriftart setzen
	hOldFont := SelectObject(hDC,hFont)
	
	iOptions := DT_TABSTOP + DT_EXPANDTABS + DT_NOPREFIX
	// Höhe und Breite berechnen
	DrawTextEx(hDC, cText, SLen(cText), @rc, iOptions + nFormat + DT_CALCRECT, NULL)
	
	// Schriftart und Hintergrund zurücksetzen
	SelectObject(hDC, hOldFont)
	
	RETURN Dimension{rc.right + 1, rc.bottom + 1}


METHOD StartPage(nPage) 

	LOCAL rc 		IS _winRECT
	LOCAL pt 		IS _winPOINT
	LOCAL hdcPrn 	AS PTR
	
	
	// Printer-Object überprüfen
	IF !oPrinter:IsValid()
		// MessageBox(0, AsPsz("Das Printer-Object ist ungültig"), AsPsz("StartPage()"), 0)
		SELF:PrinterInfo(NIL, "Das Printer-Object ist ungültig", "StartPage()")
        RETURN NULL_PTR
	ENDIF

	// Geöffnete Seite schließen
	IF SELF:lPageOpen
		SELF:EndPage()
	ENDIF

	// Variablen initialisieren
	Default(@nPage, ALen(SELF:aPages) + 1)
	SELF:nPage := nPage
	SELF:oPosition := Point{0,0}
	
	// Enhanced Metafile initialisieren
	//  - reference device context : Handle der zugehörigen VO-Printer Class
	//  - bounding rectangle       : Druckbereich ohne Ränder in 100-tel Millimeter (Hmm)
	SetRect(@rc, rcPage.Left, rcPage.Top, rcPage.Right, rcPage.Bottom)
	hDC := CreateEnhMetaFile(oPrinter:Handle(), NULL, @rc, NULL)
	IF hDC == NULL_PTR
		// MessageBox (0, PSZ(_CAST,"Fehler bei CreateEnhMetaFile()"), PSZ(_CAST,"StartPage()"), 0)
		SELF:PrinterInfo(NIL, "Fehler bei CreateEnhMetaFile()", "StartPage()")
		RETURN NULL_PTR
	ENDIF

	// Koordinatensystem auf links oben umschalten
	SetMapMode(hDC, MM_ANISOTROPIC)
	SetWindowExtEx(hDC, rc.Right, -rc.Bottom, NULL)

	// logical units in device units umrechnen
	// und Viewport des device context entsprechend setzen
	hdcPrn := CreateCompatibleDC(oPrinter:Handle())		// Werte für Viewport ermitteln
	IF hdcPrn == NULL_PTR						
		MessageBox (0, PSZ(_CAST,"Fehler bei Werte für Viewport !"), PSZ(_CAST,""), 0)
		RETURN NULL_PTR
	ENDIF
	SetMapMode(hdcPrn, MM_HIMETRIC)
	pt.x := rcPage.Right								// Druckbereich
	pt.y := rcPage.Bottom
	LPtoDP(hdcPrn, @pt, 1)								// Daten für Viewport ermitteln
	DeleteDC(hdcPrn)
	SetViewportExtEx(hDC, pt.x, pt.y, NULL)
	
	SELF:lPageOpen := TRUE
	
	RETURN SELF:hDC


METHOD Update(lPrintingDeviceChanged) 

	LOCAL hdcPrinter AS PTR
	LOCAL rc 		 IS _winRECT


	Default(@lPrintingDeviceChanged, FALSE)
	
	// Schon erstellte Druckseiten löschen, wenn sich das PrintingDevice geändert hat
	IF lPrintingDeviceChanged
		SELF:DeleteAllPages(TRUE)
	ENDIF

    // VO-Printer initialisieren
	IF SELF:oPrinter != NULL_OBJECT
		SELF:oPrinter:Destroy()
	ENDIF
	SELF:oPrinter 	:= Printer{cJobName, oPrintingDevice}
	hdcPrinter      := oPrinter:Handle()

	// Device-Werte ermitteln
	oPhysicalPaperSize 	:= Dimension{GetDeviceCaps(hdcPrinter,PHYSICALWIDTH), ;
									 GetDeviceCaps(hdcPrinter,PHYSICALHEIGHT)}
	oPrintSize 			:= Dimension{GetDeviceCaps(hdcPrinter,HORZRES), ;
									 GetDeviceCaps(hdcPrinter,VERTRES)}
	oPhysicalOffset 	:= Point{GetDeviceCaps(hdcPrinter,PHYSICALOFFSETX), ;
						     	 GetDeviceCaps(hdcPrinter,PHYSICALOFFSETY)}
	oDPI 				:= Point{GetDeviceCaps(hdcPrinter,LOGPIXELSX), ;
						     	 GetDeviceCaps(hdcPrinter,LOGPIXELSY)}

	// Minimale Ränder
	rc.Left   := SELF:Px2hmmX(oPhysicalOffset:X)
	rc.Top    := SELF:Px2hmmY(oPhysicalOffset:Y)
	rc.Right  := SELF:Px2hmmX(oPhysicalPaperSize:Width - oPhysicalOffset:X - oPrintSize:Width)
	rc.Bottom := SELF:Px2hmmY(oPhysicalPaperSize:Height - oPhysicalOffset:Y - oPrintSize:Height)

	rcMargins.Left   := Max(rc.Left  , rcMargins.Left)
	rcMargins.Top    := Max(rc.Top   , rcMargins.Top)
	rcMargins.Right  := Max(rc.Right , rcMargins.Right)
	rcMargins.Bottom := Max(rc.Bottom, rcMargins.Bottom)

	// Druckbereich ohne Ränder
	rcPage.Left      := 0
	rcPage.Top       := 0
	rcPage.Right     := SELF:Px2hmmX(oPhysicalPaperSize:Width) - rcMargins.Left - rcMargins.Right - 1
	rcPage.Bottom    := SELF:Px2hmmY(oPhysicalPaperSize:Height) - rcMargins.Top - rcMargins.Bottom - 1
	
	// Größe des Papiers in hmm
	oPaperSize       := Dimension{SELF:Px2hmmX(oPhysicalPaperSize:Width), ;
								  SELF:Px2hmmX(oPhysicalPaperSize:Height)}
	
	// Größe und Position des Druckbereichs ohne Ränder in hmm
	oPrintAreaSize   := Dimension{rcPage.Right + 1, rcPage.Bottom + 1}
	oPrintAreaOffset := Point{rcMargins.Left, rcMargins.Top}
	
	RETURN NIL	
	

METHOD Write(cText, hFont, nXPos, nYPos, nBkMode) 
	
	LOCAL rc 		 IS _winRECT
	LOCAL iOptions   AS DWORD
	LOCAL nOldBkMode AS INT
	LOCAL hOldFont 	 AS PTR
	LOCAL nRetHeight AS LONG
	
	Default(@cText,"")
	Default(@hFont, SELF:hFont)
	Default(@nBkMode, TRANSPARENT)

	IF !IsNil(nXPos)
		SELF:SetPosition(nXPos)
	ENDIF
	IF !IsNil(nYPos)
		SELF:SetPosition(,nYPos)
	ENDIF

	// Hintergrund transparent für Überschneidungen bei Blockgrafikzeichen
	nOldBkMode  := SetBkMode(hDC, PTR(_CAST,nBkMode))
	// gewünschte Schriftart setzen
	hOldFont := SelectObject(hDC,hFont)
	
	iOptions := DT_NOPREFIX
	// Aufruf 1 : Nur Höhe und Breite berechnen
	DrawTextEx(hDC,cText,SLen(cText),@rc,iOptions+DT_CALCRECT,NULL)
	
	// Ausgabe-Rechteck positionieren
	OffsetRect(@rc,SELF:oPosition:X,SELF:oPosition:Y)
	
	// Aufruf 2 : Ausgabe auf Drucker
	nRetHeight := DrawTextEx(hDC,cText,SLen(cText),@rc,iOptions,NULL)
	
	// Druck-Position anpassen
	SELF:oPosition:X := SELF:oPosition:X + rc.right + 1 - rc.left
	
	// Schriftart und Hintergrund zurücksetzen
	SelectObject(hDC, hOldFont)
	SetBkMode(hDC, nOldBkMode)
	
	RETURN nRetHeight


METHOD WriteLine(cText, hFont) 
	
	SELF:SetPosition(0)
    SELF:Write(cText, hFont)
    SELF:NewLine()

    RETURN TRUE


METHOD WriteTextblock(cText, hFont) 
	
   	LOCAL i,nMax AS INT

   	Default(@cText,"")
   	IF Empty(cText)
    	cText := " "
    ENDIF

	SELF:SetPosition(0)
    nMax := MemLines(cText)
    FOR i := 1 UPTO nMax
        SELF:Write(MLine(cText,i), hFont)
        SELF:NewLine()
    NEXT

    RETURN TRUE



END CLASS
