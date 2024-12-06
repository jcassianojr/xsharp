PARTIAL CLASS engshell
METHOD CreatePageRTF(nPage, hDC) 

	LOCAL oP		AS BL_Printer
	LOCAL rc		IS _winRECT
  //  LOCAL c			AS STRING
  //  LOCAL nOption	AS INT


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
	//c := "Seite  - " + NTrim(nPage) + " -"
	//nOption := DT_CENTER + DT_SINGLELINE + DT_VCENTER
	//oP:DrawText(0, 0, oP:PrintAreaSize:Width, 5000, c, nOption)
    //SetTextColor(hDC, RGB(0,0,0))										// Black Text
	//oP:SetFont("Courier New", 12, TRUE)

	// Optional
	oP:EndPage()
	
	RETURN NIL

METHOD CreatePagesBitmap() 

	LOCAL 	lRetVal			AS LOGIC
	//LOCAL 	oD     			AS OpenDialog
	LOCAL 	cDatei 			AS STRING
	LOCAL	oBitmap			AS Bitmap
	LOCAL	oP 				AS BL_Printer


	lRetVal := FALSE

	// Dateiöffnen-Dialog
	cDatei := cFileRTF
	

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

//	LOCAL 	oD     			AS OpenDialog
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
	cDatei := cFileRTF

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
	//LOCAL 	oD     			AS OpenDialog
	LOCAL 	cDatei 			AS STRING
	LOCAL	oP 				AS BL_Printer
	LOCAL	cText			AS STRING
   	LOCAL   i, nMax         AS INT
   	LOCAL   oSize 			AS Dimension
   	LOCAL   nHeight			AS INT
   	LOCAL   cLine			AS STRING


	lRetVal := FALSE

	// Dateiöffnen-Dialog
	cDatei := cFileRTF

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


METHOD PreviewBMP(nPage) 
	
	LOCAL oD     	AS OpenDialog
	LOCAL cDatei	AS STRING
	LOCAL oP 		AS BL_Printer
	//LOCAL i	 		AS INT
	
	Default(@nPage, 1)
	
	// oP := SELF:oPrinterRTF
	oP := SELF:oPrinter
	
	// Dateiöffnen-Dialog
	cDatei := ""
	oD := OpenDialog{SELF, cDatei}
	oD:Caption := "BMP-Dokument auswählen"
	oD:SetFilter({"*.BMP", "*.*"},;
				 {"BMP-Dokument (*.BMP)", "Alle Dateien (*.*)"},;
				  1 )
	oD:Show()

	IF !Empty(oD:FileName)
		cFileRTF := oD:FileName
	ELSE
		cFileRTF := ""
	ENDIF


    IF oPrinter:Printer:IsValid()  .and. SELF:CreatePagesBitmap()
		oPrinter:Preview(SELF:Owner, nPage)
	ENDIF
	

METHOD PreviewDBF(nPage) 
	
	LOCAL oD     	AS OpenDialog
	LOCAL cDatei	AS STRING
	LOCAL oP 		AS BL_Printer
	//LOCAL i	 		AS INT
	
	Default(@nPage, 1)
	
	// oP := SELF:oPrinterRTF
	oP := SELF:oPrinter
	
	// Dateiöffnen-Dialog
	cDatei := ""
	oD := OpenDialog{SELF, cDatei}
	oD:Caption := "DBF-Dokument auswählen"
	oD:SetFilter({"*.DBF", "*.*"},;
				 {"DBF-Dokument (*.DBF)", "Alle Dateien (*.*)"},;
				  1 )
	oD:Show()

	IF !Empty(oD:FileName)
		cFileRTF := oD:FileName
	ELSE
		cFileRTF := ""
	ENDIF


   IF oPrinter:Printer:IsValid()  .and. SELF:CreatePagesDatabase()
		oPrinter:Preview(SELF:Owner, nPage)
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

   AltD()
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
		//oP:Preview(SELF:Owner, nPage)
		oP:Preview(SELF:Owner, nPage, , , FALSE, #ZoomWidth)
	ENDIF
	

METHOD PreviewTXT(nPage) 
	
	LOCAL oD     	AS OpenDialog
	LOCAL cDatei	AS STRING
	LOCAL oP 		AS BL_Printer
	//LOCAL i	 		AS INT
	
	Default(@nPage, 1)
	
	// oP := SELF:oPrinterRTF
	oP := SELF:oPrinter
	
	// Dateiöffnen-Dialog
	cDatei := ""
	oD := OpenDialog{SELF, cDatei}
	oD:Caption := "TXT-Dokument auswählen"
	oD:SetFilter({"*.TXT", "*.*"},;
				 {"TXT-Dokument (*.TXT)", "Alle Dateien (*.*)"},;
				  1 )
	oD:Show()

	IF !Empty(oD:FileName)
		cFileRTF := oD:FileName
	ELSE
		cFileRTF := ""
	ENDIF


   IF oPrinter:Printer:IsValid()  .and. SELF:CreatePagesTextfile()
		oPrinter:Preview(SELF:Owner, nPage)
	ENDIF
	
	


END CLASS
