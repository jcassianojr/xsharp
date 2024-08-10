CLASS MYDBSERVER INHERIT DBSERVER
	PROTECT _aFieldDesc 	AS ARRAY
    PROTECT	_aDataFields    AS ARRAY
    PROTECT _nNamePos		AS DWORD


// constructor inserted by xPorter, remove superfluous arguments
CONSTRUCTOR(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9) CLIPPER
SUPER(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
ACCESS aFields 
	// allows us late-bound access to this PROTECT
	RETURN SELF:aStruct

METHOD BuscaPalavra(cFind,lUpper) 
LOCAL pHandle 	AS PTR
LOCAL cRecord	AS STRING
LOCAL nRecno	AS LONG
LOCAL nCurRecno AS LONG
LOCAL aRETU AS ARRAY
LOCAL oPROGWIN AS PROGWIN
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT

nCURRECNO:=SELF:RecNo


aRETU:={}

	// when nothing to find return false
	IF Empty(cFind)
		SELF:Goto(nCURRECNO)
		RETURN {{"",0}}
	ENDIF

oProgWin := ProgWin{}
oProgWin:Caption:="Localizando: " + cfind
oProgWin:SHOW()
nLASTREC:=SELF:RecCount
nPOS:=1

	// default is to search for arg as passed
	IF IsNil(lUpper)
		lUpper := TRUE
	ENDIF		

	// get the filehandle of the DBF
	pHandle := SELF:Info(DBI_FILEHANDLE)
	
	
	SELF:GOTOP()
	
    WHILE ! SELF:EOF

       nPerc := INT(100* nPOS/ nLASTREC)
   	   nPOS++

       oProgWin:oDcProgBar:Position := nPerc
        oProgWin:oDCMessage:textValue:=StrZero(npos,8)+"/"+StrZero(nLASTREC,8)


        //-1 Pois o seek e posional
	    nRecNo :=  SELF:RecNo-1
	

	
    	// postion file to offset where find will start	
        FSeek(pHandle,SELF:Header + (nRecno * SELF:RecSize),FS_SET)	
		// read data into buffer	
		cRecord := FReadStr(pHandle,SELF:RecSize)	

		// for case insensitive find convert find arg and record to upper case
	    IF lUpper
	    	cRecord := Upper(cRecord)
			cFind 	:= Upper(cFind)
		ENDIF

	    //retorna o recno para nao pegar o -1 seek posional
   	    nRecNo :=  SELF:RecNo
   	    IF Instr(cFind,cRecord)
	    	AAdd(aRETU,{StrZero(nRECNO,8)+"-"+cRecord,nRecno})
	    ENDIF	


		SELF:Skip()
		
	ENDDO
			
	//Retorna Registro		
	SELF:goto(nCUrRECNO)

oPROGWIN:EndDialog()
RETURN Aretu

METHOD CommitMsg() 
LOCAL lRetVal AS LOGIC
	lRetVal:=SELF:Commit()
	IF !lRetVal
		alert("Comit Error")
	END
RETURN lRetVal



METHOD EnableNotification( ) 
    siSuspendNotification := 0

METHOD FieldPutC(cCAMPO,cValor) 
LOCAL cATUAL AS STRING //grava se houver diferenca campos texto analisando o tamanho do campo
cATUAL:=SELF:FIELDGET(cCAMPO)	
IF cATUAL<>PadR(cCAMPO,Len(cATUAL))
   SELF:FIELDPUT(cCAMPO,cVALOR)	
ENDIF	

METHOD FieldPute(cCAMPO,eValor) 
IF ! Empty(eVALOR)  //grava se houver diferenca e o valor passado nao for em branco (nao zerara o campo)
   IF SELF:FIELDGET(cCAMPO)<>eVALOR
     SELF:FIELDPUT(cCAMPO,eVALOR)	
   ENDIF	
ENDIF	


METHOD FieldPutz(cCAMPO,eValor) 
IF ! Empty(eVALOR)  //grava se o banco estiver vazio e o valor nao
   IF Empty(SELF:FIELDGET(cCAMPO))
     SELF:FIELDPUT(cCAMPO,eVALOR)	
   ENDIF	
ENDIF	


ACCESS FilePtr 
RETURN SELF:Info(DBI_FILEHANDLE)

ACCESS HasOLEField 
LOCAL aStruct AS ARRAY

	aStruct := SELF:DBStruct
	IF  AScan(aStruct,{|a| a[2] = "O"}) == 0
		RETURN FALSE
	ELSE
		RETURN TRUE
	ENDIF


ACCESS IsAnsi 
RETURN SELF:Info(DBI_ISANSI)

METHOD IsFieldInIndex(uFieldID) 
LOCAL cIdxKey		AS STRING
LOCAL cFieldname	AS STRING	

	IF SELF:INDEXORD() == 0
		RETURN FALSE
	ENDIF

	cIdxKey := SELF:OrderInfo(DBOI_EXPRESSION)
			
	IF Empty(cIdxKey)
		RETURN FALSE
	ENDIF

	IF IsString(uFieldID)
		cFieldName := uFieldID
	ELSE
		cFieldName := SELF:FieldName( SELF:FieldPos(uFieldID) )
	ENDIF		

	IF cFieldName $ cIdxKey
		RETURN TRUE
	ELSE
		RETURN FALSE
	ENDIF


ACCESS IsFilterSet 
RETURN !Empty(SELF:Filter)

METHOD OrderList() 
LOCAL aOrders	:= {}	AS ARRAY
LOCAL nOrders 	AS DWORD
LOCAL nI 		AS DWORD

	 nOrders := SELF:Orderinfo(DBOI_ORDERCOUNT)

	 FOR nI := 1 TO nOrders
	 	AAdd( aOrders, SELF:Orderinfo(DBOI_NAME, , nI ))
	 NEXT	

RETURN aOrders

ACCESS Path 
RETURN SELF:FileSpec:Path


METHOD RecordArrayGet(aSkip) 
        LOCAL n AS WORD
        LOCAL aData:={} AS ARRAY
        LOCAL cFieldName AS STRING

        FOR n:=1 TO SELF:fCount
                IF ! Empty(aSkip)
                        cFieldName:=AllTrim(SELF:FieldName(n))
                        IF AScan(aSkip, {|cStr| cStr == cFieldName}) > 0
                                LOOP
                        ENDIF
                ENDIF
                AAdd(aData, SELF:FIELDGET(n))
        NEXT

RETURN aData

METHOD RecordArrayPut(aData, aSkip) 
        // SELF (server) MUST be locked, aData MUST match SELF's structure  less aSkip list
        LOCAL n AS WORD
        LOCAL cFieldName AS STRING

        FOR n:=1 TO SELF:fCount
                IF ! Empty(aSkip)
                        cFieldName:=AllTrim(SELF:FieldName(n))
                        IF AScan(aSkip, {|cStr| cStr == cFieldName}) > 0
                                LOOP
                        ENDIF
                ENDIF
                SELF:FIELDPUT(n, aData[n])
        NEXT
        SELF:Commit()

RETURN NIL

METHOD SkipEx(nRecordCount) 
	SELF:Skip(nRecordCount)	
	IF SELF:BoF
		SELF:GoTOP()
	ELSEIF SELF:EoF
		SELF:gobottom()
	ENDIF

METHOD ValidateDataRecords() 
LOCAL aInvalid,aBadFields,aRecord AS ARRAY
LOCAL pHandle AS PTR
LOCAL n,nLen,nRecNo	AS LONG
LOCAL cTemp,cType,cFieldValue AS STRING
LOCAL lBadField	AS LOGIC
LOCAL oProgWin AS ProgWin

// get the filehandle of the DBF
pHandle := SELF:Info(DBI_FILEHANDLE)

// postion to first record
FSeek(pHandle,SELF:Header,FS_SET)
	
aInvalid := {}	
	
nRecNo := 0
oProgWin:=ProgWin{}
oProgWin:SHOW()
oProgWin:nTOTAL:=SELF:RecCount
	
// process all records	
FOR nRecNo := 1 UPTO SELF:RecCount
	
	aBadFields 	:= {}
	
   	cTemp := SubStr( FReadStr(pHandle,SELF:RecSize),2 )		
   	IF Empty(cTemp)  .or. FEof(phandle)
   		EXIT
	ENDIF
   	aRecord	:= ArrayNew(SELF:FCount)
	
	// process each field
	FOR n := 1 UPTO SELF:FCount

		lBadField := FALSE
			
		cType := SELF:DBStruct[n,2]
		nLen := SELF:DBStruct[n,3]
		cFieldValue := Left(cTemp,nLen)
	    IF !Empty(cFieldValue)
			IF cType == "D"
				IF Type(cFieldValue) <> "N"
					lBadField := TRUE	
				ELSEIF SToD(String2Psz(cFieldValue)) == NULL_DATE					
					lBadField  := TRUE	
				ENDIF
			ELSEIF cType == "L"						
				IF !( cFieldValue == "T"  .or. cFieldValue == "F")
					lBadField  := TRUE	
				ENDIF
			ELSEIF cType == "F"  .or. cType == "M"  .or. cType == "N"  .or. cType == "O"	
				// these field types should hold a numeric value
				IF ! ( Type( AllTrim(cFieldValue) ) == "N" )
					lBadField  := TRUE	
				ENDIF	
			ENDIF
		ENDIF

		IF lBadField
			AAdd(aBadFields,n)
			aRecord[n] := cFieldValue
		ENDIF			

		// next field		
		cTemp := SubStr(cTemp,nLen+1)		
			
	   oProgWin:SKIP(1)		
	NEXT
	
	IF ALen(aBadFields) > 0
		AAdd(aInvalid,{nRecNo,aBadFields,aRecord})
	ENDIF					

NEXT	


IF Len(aInvalid)=0
   AAdd(aInvalid,"Nenhum Erro Encontrado")	
ENDIF	
	
oProgWin:EndDialog()
RETURN aInvalid

METHOD ValidateIndex() 

	LOCAL oProgWin AS ProgWin
	LOCAL aInvalid AS ARRAY
	LOCAL nN, nOrders,  nRecno AS DWORD
//		LOCAL nCount    AS DWORD
	LOCAL cExpression, cSeek AS STRING
		
//	alert("Not available yet")
//	RETURN {}
	
	// we essentially go through each record, construct its order expression and "seek" it
	// if the index is OK we will be on the same record
	nOrders := SELF:OrderInfo(DBOI_ORDERCOUNT)
//	nCount := 0
	aInvalid := {}
	oProgWin := ProgWin{}
	oProgWin:Caption := "Verificando Indices..."
	oProgWin:NTotal := nOrders
	oPROGWIN:nSUBTOT:= SELF:RecCount
	oProgWin:Show()

	FOR nN := 1 UPTO nOrders
		SELF:SetOrder(nN)
		cExpression := SELF:OrderInfo(DBOI_EXPRESSION)
		oProgWin:SubTiTULO(cExpression)
		SELF:GoTop()
		WHILE !SELF:EoF
			nRecno := SELF:RecNo	// detects the fault index
			cSeek := Evaluate(cExpression)   // need to evaluate the index expression in terms of this record
			// trouble is, we need to parse the expression for valid field names and pre-pend them with _field->
			alert(cSeek+","+cExpression)
			SELF:Seek(cSeek)
			IF SELF:Recno != nRecno
				alert("Erro no indice"+StrZero(nrecno,8,0))
				EXIT
			ENDIF
			SELF:Skip()
 		    oProgwin:subTitULO(NTrim(nRecno))
			oProgWin:skipSUB(1)
			IF !oProgWin:LOK
				EXIT
			ENDIF
		ENDDO
	    oPROGWIN:resetsub()
   	    oProgWin:skip(1)
	NEXT

	IF !oProgWin:LOK
		alert("Process interrupted by user")
	ENDIF

	oProgWin:EndDialog()

	RETURN aInvalid


METHOD ValidateMemo(lNonPrinting) 

	LOCAL aFields, aMemoFields AS ARRAY
	LOCAL nN, nFields AS DWORD
	LOCAL oProgWin AS ProgWin
	LOCAL aInvalid AS ARRAY
	LOCAL ptrMemo AS PTR
	LOCAL  nSize, nCount AS SHORT
	LOCAL nType AS DWORD
	LOCAL nActual AS DWORD
	LOCAL nOffset, nLastByte AS LONG
	LOCAL cBuffer AS STRING
	LOCAL bVal AS BYTE

    Default(@lNonPrinting, FALSE)
	
	nType := nSize := nActual := nCount := 0
	nOffset := nLastByte := 0
	cBuffer := ""
	bVal := 0

	oProgWin := ProgWin{}
	oProgWin:Caption := "Verificando Integridade Arquivo Memo..."
	oProgWin:NTotal := SELF:RecCount
	oProgWin:Show()

	// first find out which fields have a memo - might be more than one
	ptrMemo := SELF:Info(DBI_MEMOHANDLE) // ptrMemo := FOpen("DBFNAME.FPT", FO_READWRITE)
	aMemoFields := {}
	aInvalid := {}
	aFields := SELF:aStruct
	FOR nN := 1 UPTO ALen(aFields)
		IF aFields[nN, 2] = "M"
			AAdd(aMemoFields, nN)	// add the field number to the array
		ENDIF
	NEXT

	nFields := ALen(aMemoFields)

	alert("I found "+NTrim(nFields)+" memo fields")

	IF nFields > 0
		// now cycle for each record of the DBF
		SELF:GoTop()
		DO WHILE !SELF:EoF
			// repeat for each memo field
			FOR nN := 1 UPTO nFields
				nOffset := SELF:fieldInfo(DBS_BLOB_POINTER,aMemoFields[nN])	// get pointer to this field
				oprogwin:titulo("Recno "+StrZero(SELF:recno,8,0)+" FIELD "+NTrim(aMemoFields[nN])+" "+StrZero(nOffset,8,0))
				IF nOffset > 1023	// valid BLOB range
					FSeek(ptrMemo, nOffset-6, FS_SET)
					FRead3(ptrMemo, @nType, 2)			// read a WORD into nType
					FSeek(ptrMemo, nOffset-2, FS_SET)
					FRead3(ptrMemo, @nSize, 2)			// read a WORD into nSize
					nSize := SwapShort(nSize)
					// First test: nType = 1 for a valid memo (Big-endian = 256 MSB First order)
					IF !(nType = 256)
						AAdd(aInvalid, "Invalid memo type at Record: " + NTrim(SELF:RecNo) + " for field " + NTrim(aMemoFields[nN]))
					ELSE     
						NOP
//						alert("type " + NTrim(nType))
					ENDIF
					// second test: last byte in the last padded block should be 0xAF
					// remember this offset is already 8 bytes into the memo
					nLastByte := nOffset + nSize + 32-Mod(nSize+9, 32) 	// allow one byte for 0xAF marker + 8 for initial offset
					FSeek(ptrMemo, nLastByte, FS_SET)	
					IF FRead3(ptrMemo, @bVal, 1) = 1
						IF !(bVal = 175)
							AAdd(aInvalid, "Invalid memo length at Record: " + NTrim(SELF:RecNo) + " for field " + NTrim(aMemoFields[nN]))
						ELSE      
							NOP
//							alert("length " + NTrim(nSize))
						ENDIF
					ELSE
						AAdd(aInvalid, "Failed to read last byte of memo length at Record: " + NTrim(SELF:RecNo) + " for field " + NTrim(aMemoFields[nN]))
					ENDIF
					// third test: we must be able to read nSize without EOF error
					cBuffer := Buffer(DWORD(nSize))
					FSeek(ptrMemo, nOffset, FS_SET)
					nActual := FRead(ptrMemo, @cBuffer, DWORD(nSize))
					IF !(nActual = DWORD(nSize))
						AAdd(aInvalid, "Failed to read full memo length at Record: " + NTrim(SELF:RecNo) + " for field " + NTrim(aMemoFields[nN]))
					ELSE       
						NOP
//						alert("read the memo OK " )
					ENDIF			// fourth test for TEXT MEMOS ONLY: all chars must be printable chars
					IF lNonPrinting
						oprogwin:SUBTITULO("now testing "+NTrim(nSize)+" bytes from "+NTrim(nOffset))
						FSeek(ptrMemo, nOffset, FS_SET)
						FOR nCount := 1 UPTO nSize
							IF FRead3(ptrMemo, @bVal, 1)=1
								IF bVal<32  .or. bVal>126
									AAdd(aInvalid, "Memo contains at least one non-printable char at Record: " + NTrim(SELF:RecNo) + " for field " + NTrim(aMemoFields[nN]))
									EXIT	// only want one bad char, thank
								ENDIF
							ELSE
//								alert("Failed to read byte ")
								AAdd(aInvalid, "EOF or some other corruption at Record: " + NTrim(SELF:RecNo) + " for field " + NTrim(aMemoFields[nN]))
								EXIT
							ENDIF
						NEXT
					ELSE        
						NOP
//						alert("Not testing for printable characters")
					ENDIF
				ENDIF
			NEXT
			SELF:Skip()
			oProgwin:SKIP(1)
			IF !oProgWin:LOK
				EXIT
			ENDIF
		ENDDO
	ELSE
		alert("No memo fields to check")
	ENDIF

	IF !oProgWin:LOK
		alert("Process interrupted by user")
	ENDIF

	oProgWin:EndDialog()

	RETURN aInvalid




END CLASS
