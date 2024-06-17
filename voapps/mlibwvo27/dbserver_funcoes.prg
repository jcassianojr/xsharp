 FUNCTION CheckgetData(oServer AS USUAL,cField AS STRING)
LOCAL cFieldType,cContent AS STRING
  IF IsNil(oServer:Getdata2(cField))
      cFieldType:=oServer:FIELDINFO( DBS_TYPE, cField)
      DO CASE
	      CASE cFieldType == "C"
	         RETURN   ""
	      CASE cFieldType == "L"
	         RETURN FALSE
	      CASE cFieldType == "N"
	              RETURN 0
	      CASE cFieldType == "D"
	              RETURN SToD("")
	  ENDCASE
   ELSE
      cFieldType:=oServer:FIELDINFO( DBS_TYPE, cField)
      IF cFieldType="C" // Is it a string?
              cContent:=oServer:Getdata2(cField) // First read into variable
              cContent:=StrTran(cContent,"'","`") // Replace all ' with ` to    prevent SQL error 19-10-2011
              cContent:=StrTran(cContent,'"',"`") // Replace also all " with    ` TO prevent SQL error 19-10-2011
              RETURN cContent // And return vanue
      ELSE
        RETURN oServer:Getdata2(cField)
      ENDIF
   ENDIF
RETURN ""


FUNCTION CopyFieldContent(oDBFrom AS OBJECT,nFromRec AS FLOAT,oDBTo AS OBJECT,nToRec AS DWORD) AS LOGIC PASCAL
//#s General function to copy a record content from record nFromrec of  oDBFrom TO nTorec OF oDBTo db 16-04-2007
//#s
//#x
//#l Strong typed 7-11-2009
//#l This function does NOT copy memofields
//#l
//#l
//#p
//#p
//#r
//#e
//#e
LOCAL ni,nFieldPos AS DWORD
LOCAL cVeldNaam AS STRING
LOCAL lWritten AS LOGIC
LOCAL nFields AS DWORD
        lWritten:=FALSE // Init: nothing written
        oDBFrom:GoTo(nFromRec) // Go to requested record
        nFields:=oDBFrom:FCOUNT
        FOR ni:=1 UPTO nFields // go through field of origing
                cVeldNaam:=oDBFrom:FieldName(ni) // get fieldname of  position now checked
                nFieldPos:=oDBTo:FieldPos(cVeldNaam) // where is it in copy database
                IF nFieldPos>0 // If found
                    oDBTo:FIELDPUT(nFieldPos,oDBFrom:FIELDGET(ni))
					// write info in found position
					IF ValType(oDBFrom:FIELDGET(ni))="N"  
						NOP
					        // if the target field is C you can use STR, same checks and adaptions FOR memo->STRING etc.
					ENDIF
                    lWritten:=TRUE // Something was written
                ENDIF
        NEXT
//         oDBTo:commit() // For loops, it's better not to commit here
//         oDBTounlock()
RETURN lWritten


FUNC dbecriadbf(cARQDBE,cCAM)
LOCAL cARQ,cARQDBF,cLIN AS STRING
LOCAL nLIN,nPOS AS DWORD 
LOCAL Y AS WORD

LOCAL aSTRU,aITEM AS ARRAY
IF ! File(cARQDBE)
   alert("Falta Arquivo" + Carqdbe)
   RETURN .F.
ENDIF	
aSTRU:={}
cARQ:=MemoRead(cARQDBE)
nLIN:=MLCount(cARQ)
cLIN:=AllTrim(SubStr(cARQ,1,50))
cLIN:=AllTrim(StrTran(cARQ,Chr(13)+Chr(10),"  "))
IF Left(cLIN,6)="DBFDEF"
   cARQDBF:=SubStr(cLIN,8)
   nPOS:=At(" ",cARQDBF)
   IF nPOS>0
   	  cARQDBF:=SubStr(cARQDBF,1,nPOS-1)
   ENDIF	
   nPOS:=At(Chr(13),cARQDBF)
   IF nPOS>0
   	  cARQDBF:=SubStr(cARQDBF,1,nPOS-1)
   ENDIF
   IF File(Carqdbf+".dbf")
   	  alert("Arquivo Ja Existe" + Carqdbf  +".dbf")
      RETURN .F.
   ENDIF	
ELSE
   alert("1a. Linha nao e DBFDEF" + Carqdbe)	
   RETURN .F.
ENDIF
FOR Y := 2 TO nLIN
    cLIN:=AllTrim(MLine(cARQ,Y))
    IF Left(cLIN,6)="ENDDEF"  .OR. Left(cLIN,7)="ENDFILE"
       EXIT
    ELSE
       IF Len(cLIN)>4  .and. Left(cLIN,6)<>"DBFDEF"
          WHILE At("  ",cLIN)>0
	         cLIN:=StrTran(cLIN,"  "," ")
	      ENDDO
   	      aITEM:=ListAsArray(cLIN," ")
  	      aITEM[3]:=Val(aITEM[3])
  	      aITEM[4]:=Val(aITEM[4])
	      AAdd(aSTRU,aITEM)
	   ENDIF
   ENDIF
NEXT Y
IF Len(aSTRU)>0
   DbCreate(cCAM+cARQDBF,aSTRU)
ENDIF	
RETURN .T.

FUNCTION MakeBlankMemo(cFilename AS STRING ) AS LOGIC

	LOCAL cBuffer AS STRING
	LOCAL ptrFile AS PTR

	cBuffer := Replicate(Chr(0), 1024)
	
	IF (ptrFile := FCreate(cFilename, FC_NORMAL)) = F_ERROR
		RETURN alert(DosErrString(FError()))
	ELSE
		FWrite(ptrFile, cBuffer)
		FSeek(ptrFile, 3, 0)			;	FWrite(ptrFile, Chr(32))		// First avail block offset
		FSeek(ptrFile, 3, FS_RELATIVE)	;	FWrite(ptrFile, Chr(32))		// block size
		FSeek(ptrFile, 512, 0)			;	FWrite(ptrFile, "FlexFile3")	// Signature
		FSeek(ptrFile, 0, FS_RELATIVE)	;	FWrite(ptrFile, Chr(03))
		FClose(ptrFile)
	ENDIF

	RETURN TRUE

FUNCTION TYPESay(uValue) AS STRING

	LOCAL nType AS DWORD
	LOCAL cRet AS STRING
	
	nType := UsualType(uValue)

	// using this function stops the ShowGCDump reporting the array it uses
    DO CASE
    	CASE nType = FLOAT
			cRet := "Float, Real4/8"
    	CASE nType = ARRAY
			cRet := "Array"
    	CASE nType = OBJECT
			cRet := "Object,RT CB"
    	CASE nType = STRING
			cRet := "String, PSZ"
    	CASE nType = CODEBLOCK
			cRet := "Code Block"
    	CASE nType = PTR
			cRet := "Pointer"
    	CASE nType = LOGIC
			cRet := "Logic"
    	CASE nType = DATE
			cRet := "Date"
    	CASE nType = SYMBOL
			cRet := "Symbol"
    	CASE nType = VOID
			cRet := "Nil"
    	CASE nType = LONGINT
			cRet := "Byte/Word/DWord/all INT"
    	OTHERWISE
			cRet := "*****"
    ENDCASE

	RETURN cRet


FUNCTION ValidateHeader(uFile)
LOCAL cRecord 				AS STRING
LOCAL cTerminator			AS STRING
LOCAL nFileLen		AS INT
LOCAL nCalcLen		AS LONG
LOCAL nYear,nMonth,nDay 	AS DWORD
LOCAL dUpdate				AS DATE
LOCAL nRecCount 			AS LONG
LOCAL nHeaderSize			AS LONG
LOCAL nRecSize				AS LONG
LOCAL nFieldCount			AS LONG
LOCAL cFieldName,cFieldType	AS STRING
LOCAL nFieldLen				AS LONG
LOCAL nDec					AS LONG
LOCAL cTemp					AS STRING
LOCAL n,n1					AS LONG
LOCAL cChar					AS STRING
LOCAL cErrorString 			AS STRING
LOCAL pHandle				AS PTR
LOCAL aErrors				AS ARRAY
LOCAL oFS					AS FileSpec    

pHandle:=String2Psz("")
// simple parameter validation
// when filename passed open file
// when filehandle passed use it
IF Empty(uFile)
	RETURN {"No DBF Passed"}
ELSEIF IsPtr(uFile)
	pHandle := uFile
ELSEIF IsString(uFile)
	IF File(uFile)
		pHandle := FOpen( uFile)
	ELSE
		RETURN {"DBF Not Found"}
    ENDIF	
ENDIF

aErrors := {}	

// Signature
// offset 0
// 83 87 8B   should have DBT
// F5h        should have FPT
cRecord := Buffer(1)			
FRead(pHandle,@cRecord,1)	
cChar := RTrim(AsHexString(cRecord))
oFS := FileSpec{FPathName()}
IF cChar == "83"  .or. cChar == "87" ;
 .or. cChar == "8B"  .or. cChar == "F5"
	// has a memo
	IF cChar == "F5"
		// look for FPT
		oFS:Extension := "FPT"
	ELSE
		// look for DBT
		oFS:Extension := "DBT"
	ENDIF
	IF !File(oFS:Fullpath)
		AAdd(aErrors,"Missing Memo file:"+oFS:Fullpath)			
	ENDIF					
ENDIF		

// Last Update		
// offset 1-3
cRecord := Buffer(1)			
FSeek(pHandle,1,FS_SET)
FRead(pHandle,@cRecord,1)	
nYear	:= Bin2W(cRecord + _chr(0)) + 1900
	
FRead(pHandle,@cRecord,1)	
nMonth 	:= Bin2W(cRecord + _chr(0))

FRead(pHandle,@cRecord,1)	
nDay 	:= Bin2W(cRecord + _chr(0))

dUpDate := ConDate(nYear,nMonth,nDay)

IF dUpdate	== NULL_DATE
	FSeek(pHandle,1,FS_SET)
	cRecord := Buffer(3)			
	FRead(pHandle,@cRecord,3)	
	AAdd(aErrors,"Invalid last update Value:"+ NTrim(nYear) + " " +  NTrim(nMonth) + " " + NTrim(nDay) )
ENDIF		

// Record count		
// offset 4-7
cRecord := Buffer(4)			
FRead(pHandle,@cRecord,4)	
nRecCount	:= Bin2L(cRecord)

// header size	(start of data)
// offset 	8-9
cRecord := Buffer(2)				
FRead(pHandle,@cRecord,2)	
nHeaderSize	:= Bin2W(cRecord)

// Record size	
// offset 	10-11
cRecord	:= Buffer(2)
FRead(pHandle,@cRecord,2)	
nRecSize 	:= Bin2W(cRecord)

nFieldCount := (nHeaderSize - 32) / 32

// 	Validate File size - Compare actual File size with calculated size	
// 	file size reported by the operating system must match the logical file size.
// 	Logical file size = ( Length OF header + ( number OF records * length OF each record ) )
FSeek(pHandle,0,FS_END)
nFileLen := FTell(pHandle)
nCalcLen := (nRecSize * nRecCount)  + nHeaderSize + 1
IF nCalcLen <> nFilelen
	AAdd(aErrors,"File length error - header size:"+ NTrim(nFileLen)+" actual size:"+ NTrim(nCalcLen) )
ENDIF		

// 	Validate header terminator
//	header data must be terminated with 0x0D
cRecord := Buffer(1)		
cTerminator := AsHexString(cRecord)
FSeek(pHandle, (nFieldCount * 32) + 32, FS_SET)
FRead(pHandle,@cRecord,1)
cTerminator := Trim(AsHexString(cRecord))
IF cTerminator <> "0D"
	AAdd(aErrors,"Header terminator not 0Dh Value:"+cTerminator)
ENDIF		

//  test for valid fieldcount	
IF nFieldCount < 1  .OR. nFieldCount > 1024
	AAdd(aErrors,"Invalid FIELD count (must be between 1 and 1024) Value:"+NTrim(nFieldCount))
ENDIF


//  validate fields
FSeek(pHandle,32,FS_SET)

FOR n := 1 UPTO nFieldCount
	
	cTemp	:= Buffer(10)
	FRead(pHandle,@cTemp,10)	
	cFieldName := ""
	FOR n1 := 1 UPTO 10
		cChar := SubStr(cTemp,n1,1)
		IF cChar == _CHR(0)
			EXIT
		ELSE
			cFieldname += cChar
		ENDIF			
	NEXT
	
	cTemp		:= Buffer(1)	
	FRead(pHandle,@cTemp,1)	
	cFieldType		:= Buffer(1)	
	FRead(pHandle,@cFieldType,1)	
	cTemp 			:= Buffer(4)	
	FRead(pHandle,@cTemp,4)	
	IF cFieldType == "N"
		cTemp		:= Buffer(1)		
		FRead(pHandle,@cTemp,1)	
		nFieldLen := Bin2W( cTemp + _Chr(0) )
		cTemp := Buffer(1)
		FRead(pHandle,@cTemp,1)
		nDec := Bin2W( cTemp + _Chr(0) )
	ELSE
		cTemp		:= Buffer(2)		
		FRead(pHandle,@cTemp,2)	
		nFieldLen := Bin2W(cTemp)					
		nDec := 0
	ENDIF

	cTemp		:= Buffer(14)	
	FRead(pHandle,@cTemp,14)	


	cErrorString := 	"Field No: " + AllTrim(Str(n))	;
					+ 	" Name: " + cFieldName	;
					+ 	" Type: " + cFieldType 	;
					+ 	" Length: " +  AllTrim(Str(nFieldLen)) ;
					+ 	" Dec: " + AllTrim(Str(nDec))
	
	IF nFieldLen == 0
		AAdd(aErrors,"Field error -  invalid length Field must have length > 0 "+cErrorString)
	ELSEIF cFieldType == "L"
		// logic must be 1
		IF nFieldLen <> 1
			AAdd(aErrors,"Field error -  invalid length LOGIC must be length 1")			
			AAdd(aErrors,cErrorString + CRLF)
		ENDIF
	ELSEIF cFieldType == "D"
		// date must be 8
		IF nFieldLen <> 8
			AAdd(aErrors,"Field error - invalid length - DATE must be length 8")			
			AAdd(aErrors,cErrorString + CRLF)
		ENDIF
	ELSEIF cFieldType == "M"
		// memo must be 10
		IF nFieldLen <> 10
			AAdd(aErrors,"Field error - invalid length - MEMO must be length 10")			
			AAdd(aErrors,cErrorString + CRLF)
		ENDIF
	ELSEIF cFieldType == "O"
		// Ole must be 10
		IF nFieldLen <> 10
			AAdd(aErrors,"Field error - invalid length  - OLE must be length 10")			
			AAdd(aErrors,cErrorString + CRLF)
		ENDIF
	ELSEIF cFieldType == "N"  .or. cFieldType == "F"
		IF nFieldLen > 19
			// numerics not greater that 19
			AAdd(aErrors,"Field error - invalid length - NUMERIC must have length not greater than 19")			
			AAdd(aErrors,cErrorString + CRLF)
		ELSEIF nDec > nFieldLen
			AAdd(aErrors,"Field error - invalid decimals - DECIMALS must not be greater than FIELD length")			
			AAdd(aErrors,cErrorString + CRLF)
		ENDIF
	ELSEIF cFieldType == "C"
		// 0-
		IF nFieldLen > 64*1024	// 64k
			AAdd(aErrors,"Field error - invalid length  - CHAR must not be greater than 64k "+cErrorString)
		ENDIF
	ELSE
		AAdd(aErrors,"Field error - invalid Data Type "+cErrorString)
	ENDIF
NEXT

// we opened file so close
IF IsString(uFile)
	FClose(pHandle)
ENDIF		

IF Len(aErrors)=0
   AAdd(aERROrS,"Nenhum Erro Encontrado")	
ENDIF	

RETURN aErrors


