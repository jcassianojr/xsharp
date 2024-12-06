CLASS DemoChildWindow INHERIT BasicChildWindow
	
	PROTECT oPrinter   		AS BL_Printer
	PROTECT oMenuVorschau 	AS BL_PrinterMenu
	
	PROTECT oPrinterRTF		AS BL_Printer
	PROTECT cFileRTF		AS STRING
	

METHOD CreatePageLarge(nPage, hDC) 

	LOCAL oP		AS BL_Printer
    LOCAL x, y 		AS INT
    LOCAL c			AS STRING
    LOCAL nOption	AS INT

	
	Default(@hDC, SELF:oPrinter:GetDC())
	
	// Variablen initialisieren
	oP := SELF:oPrinter

    // Seitennummer ausgeben
	SetTextColor(hDC, RGB(255,0,0))										// Red Text
	oP:SetFont("Times New Roman", 48, TRUE)
	c := "Seite  - " + NTrim(nPage) + " -"
	nOption := DT_CENTER + DT_SINGLELINE + DT_VCENTER
	oP:DrawText(0, 0, oP:PrintAreaSize:Width, 5000, c, nOption)
    SetTextColor(hDC, RGB(0,0,0))										// Black Text
	oP:SetFont("Courier New", 12, TRUE)

	// Bitmap ausgeben
	x := oP:PrintAreaSize:Width / 2
	y := oP:PrintAreaSize:Height / 2
	oP:DrawBitMap(x/2, y, x)	
	
	// Optional
	oP:EndPage()

	RETURN NIL


METHOD CreatePageRTF(nPage, hDC) 

	LOCAL oP		AS BL_Printer
	LOCAL rc		IS _winRECT
    LOCAL c			AS STRING
    LOCAL nOption	AS INT


	Default(@hDC, SELF:oPrinter:GetDC())
	
	// Variablen initialisieren
	// oP := SELF:oPrinterRTF
	oP := SELF:oPrinter
	SetRect(@rc, 0, 0, oP:PrintAreaSize:Width - 1, oP:PrintAreaSize:Height - 1)
	
		// -------------
		//  Seite nPage
		// -------------
		
	// RichEdit-Seite ausgeben
	oP:PrintRTF(cFileRTF)
	
	// Rahmen um Druckbereich zeichnen
	oP:DrawBox(rc.Left, rc.Top, rc.Right, rc.Bottom)
	
    // Seitennummer ausgeben
	SetTextColor(hDC, RGB(255,0,0))										// Red Text
	oP:SetFont("Times New Roman", 48, TRUE)
	c := "Seite  - " + NTrim(nPage) + " -"
	nOption := DT_CENTER + DT_SINGLELINE + DT_VCENTER
	oP:DrawText(0, 0, oP:PrintAreaSize:Width, 5000, c, nOption)
    SetTextColor(hDC, RGB(0,0,0))										// Black Text
	oP:SetFont("Courier New", 12, TRUE)

	// Optional
	oP:EndPage()
	
	RETURN NIL

METHOD CreatePages() 

	LOCAL hDC         AS PTR
	LOCAL rc, rcWin   IS _winRECT
    LOCAL hDIB        AS PTR
    LOCAL x 		  AS INT
    LOCAL hFont 	  AS PTR


	SELF:oPrinter:SetMargins(3000, 2000, 3000, 2000)
	SELF:oPrinter:DeleteAllPages()
	SetRect(@rc, 0, 0, oPrinter:PrintAreaSize:Width - 1, oPrinter:PrintAreaSize:Height - 1)
	// oPrinter:ClipPage := FALSE
	
		// ---------
		//  Seite 1
		// ---------
		
	hDC := oPrinter:StartPage()
	
	// oPrinter:DrawBox(rc.Left, rc.Top, rc.Right, rc.Bottom)
	oPrinter:DrawBox(rc.Left, rc.Top, rc.Right - rc.Left, rc.Bottom - rc.Top)
	
	oPrinter:Write("This is the first Line of this page. ")
    SetTextColor(hDC, RGB(255,0,0))										// Red Text
	oPrinter:Write("This is the second Part of the first Line. ")
    SetTextColor(hDC, RGB(0,0,0))										// Black Text
	oPrinter:NewLine()
	oPrinter:NewLine()
	oPrinter:Write("This Line is too long for the PrintArea, therefore the text will be cutted on Preview and Printing at the end of the PrintArea. ")
	oPrinter:NewLine()
	oPrinter:NewLine()
	oPrinter:Write("Other features of this class:")
	oPrinter:NewLine()
	oPrinter:Write("-----------------------------")
	oPrinter:NewLine()
	oPrinter:SetPosition(1000, oPrinter:PosY)
	oPrinter:Write("- You can change the font:")
	oPrinter:NewLine()
	oPrinter:SetPosition(1000, oPrinter:PosY)
	hFont := BL_CreateFontHmm("Arial", 16)
	oPrinter:Write("- You can position the begin of writing", hFont)
	DeleteObject(hFont)
	oPrinter:SetPosition(oPrinter:PosX + 1500, oPrinter:PosY)
	x := oPrinter:PosX
	oPrinter:Write("This Text begins 15mm after the last text.")
	oPrinter:NewLine()
	oPrinter:SetPosition(x, oPrinter:PosY)
	oPrinter:Write("So you can print text at fixed positions")
	oPrinter:NewLine()
	oPrinter:SetPosition(x, oPrinter:PosY + 200)
	oPrinter:Write("and the printing of tables is very easy.")
	
	x := oPrinter:PrintAreaSize:Width / 2
	oPrinter:DrawBitMap(x/2, oPrinter:PosY + 2000, x)	
	
	oPrinter:EndPage()
	
		// ---------
		//  Seite 2
		// ---------
		
	hDC := oPrinter:StartPage()
	
	oPrinter:DrawBox(rc.Left, rc.Top, rc.Right - rc.Left, rc.Bottom - rc.Top)

	// hDIB := SELF:__CreateSelfBitmap()
	hDIB := SELF:Owner:__CreateSelfBitmap()
	// GetWindowRect(hWnd, @rcWin)
	GetWindowRect(SELF:Owner:Handle(), @rcWin)
	OffsetRect(@rcWin, -rcWin.Left, -rcWin.Top)
	// skalieren
	x := Min(rc.right / rcWin.right, rc.bottom / rcWin.bottom)
	rcWin.left   := rcWin.left * x
	rcWin.top    := rcWin.top * x
	rcWin.right  := rcWin.right * x
	rcWin.bottom := rcWin.bottom * x
	// zentrieren
	x := (rc.right - rcWin.right) / 2
	rcWin.left   := rcWin.left  + x
	rcWin.right  := rcWin.right + x
	x := (rc.bottom - rcWin.bottom) / 2
	rcWin.top    := rcWin.top    + x
	rcWin.bottom := rcWin.bottom + x
    // ausgeben
    __WCStretchDibBlt(hDC, rcWin.left, rcWin.top, rcWin.right - rcWin.left, rcWin.bottom - rcWin.top, hDib)
	// DIB-Objekt freigeben
    GlobalFree(hDIB)

	oPrinter:EndPage()
	
		// ---------
		//  Seite 3
		// ---------

	hDC := oPrinter:StartPage()

	oPrinter:DrawBox(rc.Left, rc.Top, rc.Right - rc.Left, rc.Bottom - rc.Top)

	MoveToEx(hDC,rc.Left,rc.Top,NULL_PTR)
	LineTo(hDC,rc.Right,rc.Bottom)

	MoveToEx(hDC,rc.Right,rc.Top,NULL_PTR)
	LineTo(hDC,rc.Left,rc.Bottom)
	
	MoveToEx(hDC, rc.Left + 1000, rc.Top + 1000, NULL_PTR)
	LineTo(hDC, rc.Left + 1000, rc.Right / 2)
	
	oPrinter:DrawBox(1000,2000,2000,2000)
	
	oPrinter:EndPage()
	
	RETURN NIL

METHOD CreatePagesBitmap() 

	LOCAL 	lRetVal			AS LOGIC
	LOCAL 	oD     			AS OpenDialog
	LOCAL 	cDatei 			AS STRING
	LOCAL	oBitmap			AS Bitmap
	LOCAL	oP 				AS BL_Printer


	lRetVal := FALSE

	// Dateiöffnen-Dialog
	cDatei := ""
	oD := OpenDialog{SELF, cDatei}
	oD:Caption := "Bitmap auswählen"
	oD:SetFilter({"*.BMP", "*.*"},;
				 {"Bitmaps (*.BMP)", "Alle Dateien (*.*)"},;
				  1 )
	oD:Show()

	IF !Empty(oD:FileName)
		cDatei := oD:FileName
	ELSE
		cDatei := ""
		RETURN FALSE
	ENDIF

	// Bitmap ausgeben
	IF File(cDatei)
		oP := SELF:oPrinter
		oP:SetMargins(1000,1000,1000,1000)
		oP:DeleteAllPages()
		oP:StartPage()
       	oBitmap := Bitmap{ResourceID{"", _GetInst()}}
		oBitmap:__SetHandle(LoadImage(0, String2Psz(cDatei), IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE))
		oP:DrawBitMap(0, 0, oP:PrintAreaSize:Width, oP:PrintAreaSize:Height, oBitmap)
		oBitmap:Destroy()
		oP:EndPage()
		lRetVal := TRUE
	ENDIF
	
	RETURN lRetVal


METHOD CreatePagesDatabase() 

	LOCAL 	oD     			AS OpenDialog
	LOCAL 	cDatei 			AS STRING
	LOCAL	lRetVal			AS LOGIC

	LOCAL	oDS 			AS DBServer
	LOCAL	nRecords		AS INT
	LOCAL	oP 				AS BL_Printer
	LOCAL	aColumns 		AS ARRAY            // Array mit Spalten
	LOCAL	nTableWidth		AS INT				// Breite aller Spalten
	LOCAL	nMaxRows 		AS INT				// max. Anzahl der Datenzeilen pro Seite
	LOCAL	nOffsetTable	AS INT				// Beginn der Tabelle
	LOCAL	nTitleHeight	AS INT				// Höhe der Zeile mit den Spaltenbezeichnungen
	LOCAL	nCurRow			AS INT				// aktuelle Datenzeile
	LOCAL	nPages			AS INT				// Anzahl der Seiten
	LOCAL	nCurPage		AS INT				// Aktuelle Seite
	LOCAL	cGap			AS STRING			// Lücke zum Spaltenrand
	LOCAL	i, n, nLen		AS INT
	LOCAL	nX, nY 			AS INT
	LOCAL	cText 			AS STRING
	LOCAL	nFormat 		AS INT
	
	
	lRetVal := FALSE

	// Dateiöffnen-Dialog
	cDatei := ""
	oD := OpenDialog{SELF, cDatei}
	oD:Caption := "Datenbank auswählen"
	oD:SetFilter({"*.DBF", "*.*"},;
				 {"DBF-Dateien (*.DBF)", "Alle Dateien (*.*)"},;
				  1 )
	oD:Show()

	IF !Empty(oD:FileName)
		cDatei := oD:FileName
	ELSE
		cDatei := ""
	ENDIF

	IF File(cDatei)
		oDS := DBServer{cDatei,,,"DBFCDX"}
	ELSE
		RETURN FALSE
	ENDIF

	IF oDS:Used == TRUE
		lRetVal := TRUE
		SELF:Pointer := Pointer{POINTERHOURGLASS}
		nRecords := oDS:RecCount

			// ---------------------
			//  Seiteneinstellungen
			// ---------------------
			
		oP := SELF:oPrinter
		oP:SetMargins(2000,500,2000,1000)
		oP:DeleteAllPages()
		oP:StartPage()
		nOffsetTable := 2000
		nTitleHeight := 700
		oP:SetFont("Arial", 10)
		oP:LineHeight  := oP:SizeText("ABC"):Height + 50
		n := oP:PrintAreaSize:Height - nOffsetTable - nTitleHeight - 2 * oP:LineHeight
		nMaxRows       := Integer(1.0 * n / oP:LineHeight)
		nPages  	   := Ceil(1.0 * nRecords / nMaxRows)
		cGap 		   := Space(1)
		
		// Spalten festlegen
		nTableWidth := 0
		aColumns := {}
		FOR i := 1 TO oDS:FCount
			AAdd(aColumns, ArrayCreate(3))
			aColumns[i,1] := oDS:FieldName(i)								// Bezeichnung
			aColumns[i,2] := oDS:FieldInfo(DBS_TYPE, i)                     // Type
			nLen 		  := oDS:FieldInfo(DBS_LEN, i)                      // Feldlänge
			aColumns[i,3] := Max(oP:SizeText(aColumns[i,1] + cGap):Width, ;
								 oP:SizeText(Replicate("M",nLen)):Width)	// Breite
			nTableWidth += aColumns[i,3]
		NEXT i
		nTableWidth := Min(nTableWidth, oP:PrintAreaSize:Width)
		
	        // ------------------
			//  Seiten erstellen	
	        // ------------------
	
		nCurPage := 0
		oDS:GoTop()
		
		WHILE TRUE
			nCurPage++
			nCurRow := 1
			IF nCurPage > 1
				oP:NewPage()
			ENDIF
			
			// Seitenzahl ausgeben
			oP:SetFont("Arial", 10)
			cText := "Page " + NTrim(nCurPage) + " of " + NTrim(nPages)
			oP:DrawText(0, 0, oP:PrintAreaSize:Width, oP:LineHeight, cText, DT_RIGHT)
			
			// Datenbanknamen ausgeben
			oP:SetFont("Arial", 12, TRUE)
			oP:DrawText(0, 900, oP:PrintAreaSize:Width, oP:LineHeight, cDatei, DT_CENTER)
		
			// Kopfzeile ausgeben
			oP:SetFont("Arial", 10)
			nX := 10
			nY := nOffsetTable
			nFormat := DT_CENTER + DT_SINGLELINE + DT_VCENTER
			FOR i := 1 TO ALen(aColumns)
				oP:SetPosition(nX)
				oP:DrawBox(nX, nY, aColumns[i,3], nTitleHeight)
				oP:DrawText(nX, nY, aColumns[i,3], nTitleHeight, aColumns[i,1], nFormat)
				nX += aColumns[i,3]
				IF nX > nTableWidth
					EXIT
				ENDIF
			NEXT i
		
			// Datenzeilen ausgeben
			oP:SetFont("Arial", 10)
			oP:SetPosition(0, nOffsetTable + nTitleHeight)
			WHILE !oDS:EoF  .and. nCurRow <= nMaxRows
				nX := 10
				nY := oP:PosY
				FOR i := 1 TO ALen(aColumns)
					oP:SetPosition(nX)
					cText := ""
					DO CASE
					CASE aColumns[i,2] == "C"
						cText   := cGap + oDS:FIELDGET(i)
						nFormat := DT_LEFT + DT_SINGLELINE + DT_VCENTER
					CASE aColumns[i,2] == "D"
						cText   := DToC(oDS:FIELDGET(i))
						nFormat := DT_CENTER + DT_SINGLELINE + DT_VCENTER
					CASE aColumns[i,2] == "N"
						cText   := Str(oDS:FIELDGET(i)) + cGap
						nFormat := DT_RIGHT + DT_SINGLELINE + DT_VCENTER
					CASE aColumns[i,2] == "L"
						cText   := if(oDS:FIELDGET(i), ".T.", ".F.")
						nFormat := DT_CENTER + DT_SINGLELINE + DT_VCENTER
					ENDCASE
					oP:DrawText(nX, nY, aColumns[i,3], oP:LineHeight, cText, nFormat)
					nX += aColumns[i,3]
					IF nX > nTableWidth
						EXIT
					ENDIF
				NEXT i
				oP:NewLine()
				nCurRow++
				oDS:Skip()
			END DO
	
			nX := 0
			nY := oP:PosY
			oP:DrawLine(nX, nY, nX + nTableWidth, nY)
			
			// Druckdatum in Fußzeile
			oP:SetFont("Arial", 8)
			nY := oP:PrintAreaSize:Height - oP:LineHeight
			nFormat := DT_SINGLELINE + DT_BOTTOM
			oP:DrawText(0, nY, oP:PrintAreaSize:Width, oP:LineHeight, ;
					    "printed on: " + DToC(Today()), nFormat)
			
			IF oDS:EoF										// Keine Datenzeilen mehr
				// Summen ausgeben
				oP:SetFont("Arial", 10)
				nY := oP:PosY
				cText := "Records: " + NTrim(nRecords)
				nFormat := DT_LEFT + DT_SINGLELINE + DT_VCENTER
				oP:DrawText(0, nY, oP:PrintAreaSize:Width, oP:LineHeight, cText, nFormat)
				EXIT
			ENDIF
		END DO
		
		// Letzte Seite schließen
		oP:EndPage()
		oDS:Close()
		SELF:Pointer := Pointer{POINTERARROW}
	ENDIF
	
	RETURN lRetVal


METHOD CreatePagesTextfile() 

	LOCAL 	lRetVal			AS LOGIC
	LOCAL 	oD     			AS OpenDialog
	LOCAL 	cDatei 			AS STRING
	LOCAL	oP 				AS BL_Printer
	LOCAL	cText			AS STRING
   	LOCAL   i, nMax         AS INT
   	LOCAL   oSize 			AS Dimension
   	LOCAL   nHeight			AS INT
   	LOCAL   cLine			AS STRING


	lRetVal := FALSE

	// Dateiöffnen-Dialog
	cDatei := ""
	oD := OpenDialog{SELF, cDatei}
	oD:Caption := "Textfile auswählen"
	oD:SetFilter({"*.TXT", "*.*"},;
				 {"Textfile (*.TXT)", "Alle Dateien (*.*)"},;
				  1 )
	oD:Show()

	IF !Empty(oD:FileName)
		cDatei := oD:FileName
	ELSE
		cDatei := ""
		RETURN FALSE
	ENDIF

	// Textfile ausgeben
	IF File(cDatei)
		SELF:Pointer := Pointer{POINTERHOURGLASS}
		oP := SELF:oPrinter
		oP:SetMargins(2500,1500,2500,1500)
		oP:DeleteAllPages()
		oP:SetFont("Times New Roman", 14)
		oP:StartPage()
		
		// Textdatei einlesen		
		cText := MemoRead(cDatei)
	    // nMax := MemLines(cText)
	    nMax := MLCount(cText, 254)
	    FOR i := 1 UPTO nMax
	    	// cLine := MLine(cText,i)
	    	cLine := RTrim(MemoLine(cText,254,i))
	    	IF SLen(cLine) == 0			// keine Größenberechnung bei NULL_STR
	    		cLine := " "
	    	ENDIF
	    	oSize := oP:SizeTextblock(0, 0, oP:PrintAreaSize:Width, 0, cLine, DT_WORDBREAK)
	    	IF oP:PosY > 0  .and. oSize:Height > oP:PrintAreaSize:Height - oP:PosY
		        oP:NewPage()
		    ENDIF
			nHeight := oP:DrawText(0, 0, oP:PrintAreaSize:Width, 0, cLine, DT_WORDBREAK)
			oP:SetPosition(, oP:PosY + nHeight)
    	NEXT i
		
		oP:EndPage()
		lRetVal := TRUE
		SELF:Pointer := Pointer{POINTERARROW}
	ENDIF
	
	RETURN lRetVal


METHOD FilePrinterSetup() 

	oPrinter:Setup()


CONSTRUCTOR(oOwner, lManaged) 
	
  	SUPER(oOwner, lManaged)

  	SELF:Menu := DemoChildMenu{SELF}
  	SELF:Background := Brush{Color{COLORWHITE}}  // für 2.7 hinzugefügt

  	oPrinter := BL_Printer{SELF, "Druck mit BL_Printer", , FALSE}
  	// oPrinter:PrintingDevice:Orientation := DMORIENT_PORTRAIT   // 1
  	oPrinter:PrintingDevice:Orientation := DMORIENT_LANDSCAPE 	// 2
  	// oPrinter:ClipPage := FALSE
  	oPrinter:Update()
  	// oPrinter:PrinterInfo()

  	oPrinterRTF := BL_Printer{SELF, "Druck mit BL_Printer", , FALSE}
  	oPrinterRTF:PrintingDevice:Orientation := DMORIENT_PORTRAIT   // 1
  	// oPrinterRTF:ClipPage := FALSE
  	cFileRTF := ""

  	RETURN SELF


METHOD MenuCommand(oMenuCommandEvent) 
	LOCAL oE AS MenuCommandEvent
	
	SUPER:MenuCommand(oMenuCommandEvent)
	//Put your changes here

    oE := oMenuCommandEvent
	IF oE:NameSym == #PrintAll
		SELF:Print(oE:lParam > 0)		// lParam > 0 => Toolbar, sonst Menü
	ENDIF

	RETURN NIL


METHOD Preview(nPage) 
	
	// LOCAL oWin AS Window
	
	IF oPrinter:Printer:IsValid()
	    SELF:CreatePages()
		oPrinter:Preview(SELF:Owner, nPage)
		/*
	    IF IsIconic(SELF:Handle())  .or. IsZoomed(SELF:Handle())
			oWin := oPrinter:Preview(SELF:Owner, nPage)
		ELSE
			oWin := oPrinter:Preview(SELF:Owner, nPage)
			SetWindowPos(oWin:Handle(), 0, 0, 0, 400, 210, SWP_NOZORDER + SWP_NOMOVE)
		ENDIF
		*/
	ELSE
		// MessageBox(SELF:Handle(), AsPsz("Das Printer-Object ist ungültig"), AsPsz("Preview"), 0)
		oPrinter:PrinterInfo(SELF, "Das Printer-Object ist ungültig", "Preview")
	ENDIF
	

METHOD PreviewAcrobat(nPage) 
	
	IF oPrinter:Printer:IsValid()
	    SELF:CreatePages()
		oPrinter:Preview(SELF:Owner, nPage, , , FALSE, #ZoomWidth)
	ENDIF
	

METHOD PreviewBitmap(nPage) 
	
	IF oPrinter:Printer:IsValid()  .and. SELF:CreatePagesBitmap()
		oPrinter:Preview(SELF:Owner, nPage)
	ENDIF
	

METHOD PreviewDatabase(nPage) 
	
	IF oPrinter:Printer:IsValid()  .and. SELF:CreatePagesDatabase()
		oPrinter:Preview(SELF:Owner, nPage)
	ENDIF
	

METHOD PreviewGerman(nPage) 

	SELF:oMenuVorschau := MenuVorschau{}
	IF oPrinter:Printer:IsValid()
	    SELF:CreatePages()
		// oPrinter:Preview(SELF:Owner, nPage, MenuVorschau{}, "Vorschau - Seite ")
		oPrinter:Preview(SELF:Owner, nPage, SELF:oMenuVorschau, "Vorschau - Seite ")
	ENDIF
	

METHOD PreviewLarge(nPage) 
	
	LOCAL i AS INT
	
	IF oPrinter:Printer:IsValid()
		SELF:Pointer := Pointer{POINTERHOURGLASS}

		SELF:oPrinter:SetMargins(3000, 2000, 3000, 2000)
		SELF:oPrinter:DeleteAllPages()
		
		// Seiten erstellen
		FOR i := 1 TO 2000
			SELF:StatusMessage("Erstelle Seite " + NTrim(i) + " von 2000", MESSAGEPERMANENT)
			SELF:CreatePageLarge(i, SELF:oPrinter:NewPage())
		NEXT i
		
		SELF:StatusMessage("", MESSAGEPERMANENT)
		SELF:Pointer := Pointer{POINTERARROW}

		// Preview anzeigen	
		oPrinter:Preview(SELF:Owner, nPage)
	ENDIF


METHOD PreviewLargeCallback(nPage) 
	
	LOCAL i AS INT
	
	Default(@nPage, 865)
	
	IF oPrinter:Printer:IsValid()
		SELF:Pointer := Pointer{POINTERHOURGLASS}

		SELF:oPrinter:SetMargins(3000, 2000, 3000, 2000)
		SELF:oPrinter:DeleteAllPages()
		SELF:oPrinter:SetCreatePageMethod(#CreatePageLarge)
		
		// Seiten erstellen
		FOR i := 1 TO 2000
			oPrinter:AppendPage(NULL_PTR)
		NEXT i
		
		SELF:Pointer := Pointer{POINTERARROW}

		// Menü anpassen und Vorschau aktivieren
   		oMenuVorschau := MenuPreviewGe{}
   		oMenuVorschau:DeleteItem(PrinterMenuGetID(oMenuVorschau, #PrintAll))
   		oMenuVorschau:UpdateItem(PrinterMenuGetID(oMenuVorschau, #PrintPage), Hyperlabel{#PrintAll, "Drucken	STRG+P"})
   		oMenuVorschau:ToolBar:ChangeTipText(PrinterMenuGetID(oMenuVorschau, #PrintAll), "2000 Seiten drucken", #MenuItemID)
   		// oPrinter:Preview(SELF, nPage, oMenuVorschau, "Vorschau - 2000 Seiten ", , #ZOOM0090)
   		oPrinter:Preview(SELF, nPage, oMenuVorschau, "Vorschau - 2000 Seiten ")
		oPrinter:PrintInfoCaption := "2000 Seiten drucken ..."
	ENDIF


METHOD PreviewRTF(nPage) 
	
	LOCAL oD     	AS OpenDialog
	LOCAL cDatei	AS STRING
	LOCAL oP 		AS BL_Printer
	LOCAL i	 		AS INT
	
	Default(@nPage, 1)
	
	// oP := SELF:oPrinterRTF
	oP := SELF:oPrinter
	
	// Dateiöffnen-Dialog
	cDatei := ""
	oD := OpenDialog{SELF, cDatei}
	oD:Caption := "RTF-Dokument auswählen"
	oD:SetFilter({"*.RTF", "*.*"},;
				 {"RTF-Dokument (*.RTF)", "Alle Dateien (*.*)"},;
				  1 )
	oD:Show()

	IF !Empty(oD:FileName)
		cFileRTF := oD:FileName
	ELSE
		cFileRTF := ""
	ENDIF

	// Druckseiten erstellen
	IF oP:Printer:IsValid()
		oP:SetMargins(3000, 2000, 3000, 2000)
		oP:DeleteAllPages()
		oP:SetCreatePageMethod(#CreatePageRTF)
		
		// Seiten erstellen
		FOR i := 1 TO 5
			oP:AppendPage(NULL_PTR)
		NEXT i
		
		// Preview anzeigen	
		oP:Preview(SELF:Owner, nPage)
	ENDIF
	

METHOD PreviewTextfile(nPage) 
	
	IF oPrinter:Printer:IsValid()  .and. SELF:CreatePagesTextfile()
		oPrinter:Preview(SELF:Owner, nPage)
	ENDIF
	

METHOD Print(lToolbar) 
	
	Default(@lToolbar, FALSE)
	
	IF lToolbar
		SELF:CreatePages()
		oPrinter:Print()
	ELSE
		IF oPrinter:PrintDialog()
			SELF:CreatePages()
			oPrinter:PrintSelectedPages()
		ENDIF
	ENDIF
		

END CLASS
CLASS DemoShellWindow INHERIT BasicShellWindow
	

METHOD FileNew() 
  LOCAL oChild AS DemoChildWindow

  oChild := DemoChildWindow{SELF, TRUE}
  oChild:show(SHOWZOOMED)
  oChild:Caption := "New Child"

  RETURN oChild



CONSTRUCTOR(oParent,uExtra) 

	SUPER(oParent,uExtra)

  	SELF:Caption := "BL Printer Demo"
  	SELF:HyperLabel := HyperLabel{#DemoShellWindow,"Demo MDI Shell Window",NULL_STRING,NULL_STRING}
  	SELF:Menu := BASICMENU{}
  	SELF:Origin := Point{19, 430}
  	SELF:Size := Dimension{500, 400}
  	SELF:ChildToolBarLocation:=TBL_SHELL

	RETURN SELF



END CLASS
