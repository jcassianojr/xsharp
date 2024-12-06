CLASS MYDataWindow INHERIT DataWindow

METHOD BUSCAAVANCADA 
LOCAL oBUSCA AS xBUSCA
LOCAL oBUSCAP AS BuscaPalavra
oBUSCA:=xBUSCA{SELF,"Localizar ","Digite o Dado"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   oBUSCAP:=BuscaPalavra{SELF,SELF:SERVER,oBUSCA:cBUSCA}
   oBUSCAP:SHOW()
   IF oBUSCAP:LOK
   	  SELF:GOTO(oBUSCAP:nRECNO)
   ENDIF	
ENDIF	
	

METHOD cmddelfiltro 
	alert("N„o Disponivel")

METHOD CMDFILTRAR 
	alert("N„o Disponivel")

METHOD cmdimprimir 
	alert("N„o Disponivel")	
METHOD cmdpreview( ) 

//	LOCAL 	oD     			AS OpenDialog
	LOCAL 	cDatei 			AS STRING
	LOCAL	lRetVal			AS LOGIC

//	LOCAL	SELF:SERVER 			AS DBServer
	LOCAL	nRecords		AS INT
	LOCAL	oP 				AS BL_Printer
	LOCAL	aColumns 		AS ARRAY            // Array mit Spalten
	LOCAL	nTableWidth		AS INT				// Breite aller Spalten
	LOCAL	nMaxRows 		AS INT				// max. Anzahl der Datenzeilen pro Seite
	LOCAL	nOffsetTable	AS INT				// Beginn der Tabelle
	LOCAL	nTitleHeight	AS INT				// Hˆhe der Zeile mit den Spaltenbezeichnungen
	LOCAL	nCurRow			AS INT				// aktuelle Datenzeile
	LOCAL	nPages			AS INT				// Anzahl der Seiten
	LOCAL	nCurPage		AS INT				// Aktuelle Seite
	LOCAL	cGap			AS STRING			// L¸cke zum Spaltenrand
	LOCAL	i, n, nLen		AS INT
	LOCAL	nX, nY 			AS INT
	LOCAL	cText 			AS STRING
	LOCAL	nFormat 		AS INT
	
	
	oP := BL_Printer{SELF, "Preview", , FALSE}
  	// oPrinter:PrintingDevice:Orientation := DMORIENT_PORTRAIT   // 1
  	oP:PrintingDevice:Orientation := DMORIENT_LANDSCAPE 	// 2
  	// oPrinter:ClipPage := FALSE
  	oP:Update()
  	// oPrinter:PrinterInfo()

	
	
	lRetVal := FALSE


	IF SELF:SERVER:Used == TRUE
		lRetVal := TRUE
		SELF:Pointer := Pointer{POINTERHOURGLASS}
		nRecords := SELF:SERVER:RecCount

			// ---------------------
			//  Seiteneinstellungen
			// ---------------------
			
		//oP := SELF:oPrinter
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
		FOR i := 1 TO SELF:SERVER:FCount
			AAdd(aColumns, ArrayCreate(3))
			aColumns[i,1] := SELF:SERVER:FieldName(i)								// Bezeichnung
			aColumns[i,2] := SELF:SERVER:FieldInfo(DBS_TYPE, i)                     // Type
			nLen 		  := SELF:SERVER:FieldInfo(DBS_LEN, i)                      // Feldl‰nge
			aColumns[i,3] := Max(oP:SizeText(aColumns[i,1] + cGap):Width, ;
								 oP:SizeText(Replicate("M",nLen)):Width)	// Breite
			nTableWidth += aColumns[i,3]
		NEXT i
		nTableWidth := Min(nTableWidth, oP:PrintAreaSize:Width)
		
	        // ------------------
			//  Seiten erstellen	
	        // ------------------
	
		nCurPage := 0
		SELF:SERVER:GoTop()
		
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
			WHILE !SELF:SERVER:EoF  .and. nCurRow <= nMaxRows
				nX := 10
				nY := oP:PosY
				FOR i := 1 TO ALen(aColumns)
					oP:SetPosition(nX)
					cText := ""
					DO CASE
					CASE aColumns[i,2] == "C"
						cText   := cGap + SELF:SERVER:FIELDGET(i)
						nFormat := DT_LEFT + DT_SINGLELINE + DT_VCENTER
					CASE aColumns[i,2] == "D"
						cText   := DToC(SELF:SERVER:FIELDGET(i))
						nFormat := DT_CENTER + DT_SINGLELINE + DT_VCENTER
					CASE aColumns[i,2] == "N"
						cText   := Str(SELF:SERVER:FIELDGET(i)) + cGap
						nFormat := DT_RIGHT + DT_SINGLELINE + DT_VCENTER
					CASE aColumns[i,2] == "L"
						cText   := IF(SELF:SERVER:FIELDGET(i), ".T.", ".F.")
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
				SELF:SERVER:Skip()
			END DO
	
			nX := 0
			nY := oP:PosY
			oP:DrawLine(nX, nY, nX + nTableWidth, nY)
			
			// Druckdatum in Fuﬂzeile
			oP:SetFont("Arial", 8)
			nY := oP:PrintAreaSize:Height - oP:LineHeight
			nFormat := DT_SINGLELINE + DT_BOTTOM
			oP:DrawText(0, nY, oP:PrintAreaSize:Width, oP:LineHeight, ;
					    "printed on: " + DToC(Today()), nFormat)
			
			IF SELF:SERVER:EoF									//	 Keine Datenzeilen mehr
				// Summen ausgeben
				oP:SetFont("Arial", 10)
				nY := oP:PosY
				cText := "Records: " + NTrim(nRecords)
				nFormat := DT_LEFT + DT_SINGLELINE + DT_VCENTER
				oP:DrawText(0, nY, oP:PrintAreaSize:Width, oP:LineHeight, cText, nFormat)
				EXIT
			ENDIF
		END DO
		
		// Letzte Seite schlieﬂen
		oP:EndPage()
		//SELF:SERVER:Close()
		SELF:SERVER:GoTop()
		SELF:Pointer := Pointer{POINTERARROW}
		oP:Preview(SELF:Owner, 1)
	ENDIF
	
	RETURN lRetVal

METHOD KeyFind()  
        LOCAL oWin AS SmartFind
   oWin :=  SmartFind{ SELF:owner, , , SELF  }
   oWin:show()


METHOD xcmddelfiltro(lATU) 
	IF ValType(lATU)<>"L"
       lATU:=.F.
    ENDIF		
	alert("Filtro Apagado")
	SELF:server:clearfilter()
    IF lATU
//       alert("Refresh")	
       SELF:Browser:Refresh()	
  	ENDIF
	

METHOD xCMDFILTRAR(lATU) 
//LOCAL Od AS DLGFILTER
//oD:=DLGFILTER{SELF,SELF:SERVER,1)
//	 oD:Show()
//	 IF oD:lOK
//	   SELF:SERVER:setfilteR(oD:Filtre)
//	   SELF:SERVER:GOTOP()
//	   alert("filtro Ativado")
//	 ENDIF
LOCAL oJAN AS XJFILTRO
LOCAL aESTRU AS ARRAY
IF ValType(lATU)<>"L"
   lATU:=.F.
ENDIF		

aESTRU:=SELF:SERVER:dbSTRUCT
oJAN:=XJFILTRO{SELF,aESTRU}
oJAN:SHOW()
	 IF oJAN:LOK
	   alert("filtro Ativado:"+ojan:cFILTRO)	
//	   SELF:server:setfilter( FilterBlock{ SELF:server, oJAN:CFILTRO } )
	   SELF:SERVER:setfilteR(oJAN:cFILTRO)
       IF lATU
//  	       alert("Refresh")	
       	 SELF:SERVER:GOTOP()
         SELF:Browser:Refresh()	
  	   ENDIF
	 ENDIF
	

METHOD XWRPTFGRP(cGRP,cSUB) 
LOCAL cARQ,CNOME AS STRING  
LOCAL nFout AS PTR
cNOME:=Upper(AllTrim(ZUSER))
IF cNOME="SUPERVISOR" .OR. cNOME="SOFTEC"
   cNOME:="ADMIN"	
ENDIF
cARQ:=PEGINIVAL(ZCURINI,"WRPT","CAMINHO")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPT"),String2Psz("X$"+CNOME+"%"+cGRP+"#"+cSUB),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 

METHOD XWRPTGRP(cGRP,cSUB) 
LOCAL cARQ,CNOME AS STRING 
LOCAL nFout AS PTR
cNOME:=Upper(AllTrim(ZUSER))
IF cNOME="SUPERVISOR" .OR. cNOME="SOFTEC"
   cNOME:="ADMIN"	
ENDIF
cARQ:=PEGINIVAL(ZCURINI,"WRPT","CAMINHO")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPT"),String2Psz("X$"+CNOME+"%"+cGRP+"#"+cSUB),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 

METHOD XWRPTIGRP(cGRP,cSUB) 
LOCAL cARQ,CNOME AS STRING 
LOCAL nFout AS PTR
cNOME:=Upper(AllTrim(ZUSER))
IF cNOME="SUPERVISOR" .OR. cNOME="SOFTEC"
   cNOME:="ADMIN"	
ENDIF
cARQ:=PEGINIVAL(ZCURINI,"WRPT","CAMINHO")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPT"),String2Psz("I$"+CNOME+"%"+cGRP+"#"+cSUB),String2Psz(carq),SW_SHOWNORMAL) 
ShellExecuteErro(nFout)  		
END CLASS
