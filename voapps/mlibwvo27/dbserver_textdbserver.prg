CLASS TextDBServer
	PROTECT aHeader 		AS ARRAY		// Header structure of file
	PROTECT nStartDataByte 	AS LONGINT		        // Starting position of data in file
	EXPORT  nRecordLength 	AS DWORD			// Length of one record
	PROTECT nCurrentRecord 	AS LONGINT		        // The record number you are on
	PROTECT cFileName 		AS STRING			// Name of file
	PROTECT nHandle 		AS PTR			// File Handle
	PROTECT nFields			AS WORD		    // Amount of fields in File
	PROTECT nLastrec		AS INT		// Last record IN File      DWORD
	PROTECT nFileSize		AS INT		// The Size of the file         DWORD
	EXPORT  pReadBuffer 	AS PSZ				// Allocate Memory for Record Buffer
	EXPORT  cLINHA          AS STRING
	PROTECT dwMaxBytes	    AS DWORD		// The Maximum bytes to read per line
//	PROTECT lTextFile				AS LOGIC		// Are you reading / writing to and from a Textfile

// ~"ONLYEARLY+"	
// ~"ONLYEARLY-"
	

METHOD BOF AS LOGIC PASCAL 
// ~"ONLYEARLY+"
RETURN iif(nCurrentRecord<=0,TRUE,FALSE)
// ~"ONLYEARLY-"


METHOD Close AS VOID PASCAL 
// ~"ONLYEARLY+"
	MemFree(SELF:pReadBuffer) 													// Free Memory	
	FClose(SELF:nHandle)																// Close File
RETURN
// ~"ONLYEARLY-"
	
	

METHOD EOF AS LOGIC PASCAL 
	LOCAL lRet		:= FALSE AS LOGIC										// return value

// ~"ONLYEARLY+"	
	IF nCurrentRecord > LONGINT(nLastrec)  .or. nLastRec = 0		// if past file or last record = 0
		lRet := TRUE																		// RETURN true
	ENDIF
RETURN lRet
// ~"ONLYEARLY-"


ACCESS FCount AS DWORD STRICT 
// ~"ONLYEARLY+"
RETURN SELF:nFields
// ~"ONLYEARLY-"


METHOD FIELDGET( dwPos AS DWORD ) AS USUAL PASCAL 
	LOCAL uRet AS USUAL											// Return Value
	uret:= NIL
// ~"ONLYEARLY+"
	IF dwPos <= SELF:nFields
		uRet := SELF:aHeader[ dwPos, 6 ]			// retrieve field info
	ENDIF
RETURN uRet
// ~"ONLYEARLY-"


METHOD FieldGetFromName( symFieldName AS SYMBOL ) AS USUAL PASCAL 
	LOCAL uRet	AS USUAL										// Return Value
	LOCAL dwPos AS DWORD    
	uret := NIL
// ~"ONLYEARLY+"
	
	dwPos := AScan( SELF:aHeader, {|x| x[1] == symFieldName } )
	IF dwPos > 0  .and. dwPos <= SELF:nFields
		uRet := SELF:aHeader[ dwPos, 6 ]			// retrieve field info
	ENDIF
RETURN uRet
// ~"ONLYEARLY-"



METHOD FieldName( dwFieldPos AS DWORD ) AS STRING STRICT 
	LOCAL strFieldName	AS STRING
// ~"ONLYEARLY+"
	
	IF dwFieldPos <= SELF:FCount
		strFieldName := Symbol2String( SELF:aHeader[ dwFieldPos, 1 ] )
	ELSE
		strFieldName := ""
	ENDIF
RETURN strFieldName
// ~"ONLYEARLY-"



METHOD FieldNameAsSymbol( dwFieldPos AS DWORD  ) AS SYMBOL STRICT 
	LOCAL symFieldName	AS SYMBOL
	
// ~"ONLYEARLY+"
	IF dwFieldPos <= SELF:FCount
		symFieldName := SELF:aHeader[ dwFieldPos, 1 ]
	ELSE
		symFieldName := NULL_SYMBOL
	ENDIF
RETURN symFieldName
// ~"ONLYEARLY-"



METHOD FIELDPUT( dwPos AS DWORD, uValue AS USUAL) AS VOID PASCAL 
// ~"ONLYEARLY+"
	IF dwPos <= SELF:nFields
		SELF:aHeader[ dwPos,6 ] := uValue					// Save Value
	ENDIF
RETURN
// ~"ONLYEARLY-"



METHOD FieldPutDisk( dwFieldPos AS DWORD ,uValue AS USUAL) AS VOID PASCAL 
	LOCAL pBuffer 	:= NULL AS PSZ										// Temp record
	
// ~"ONLYEARLY+"
	IF dwFieldPos <= SELF:nFields
		FSeek3(nHandle,LONG(SELF:aHeader[ dwFieldPos,5 ]+SELF:nStartDataByte+ (nCurrentRecord-1)*LONGINT(nRecordLength)) ,DWORD(FS_SET))
		IF SELF:aHeader[ dwFieldPos,2 ] = "C"
			pBuffer := String2Psz(uValue)
		ELSEIF 	SELF:aHeader[ dwFieldPos,2 ] = "N"
			pBuffer := String2Psz(Str3(uValue,SELF:aHeader[ dwFieldPos,3],SELF:aHeader[ dwFieldPos,4]))
		ELSEIF 	SELF:aHeader[ dwFieldPos,2 ] = "L"
			IF uValue == TRUE
				pBuffer := String2Psz("T")
			ELSE
				pBuffer := String2Psz("F")
			ENDIF
		ELSEIF 	SELF:aHeader[ dwFieldPos,2 ] = "D"
			pBuffer := String2Psz(DToS(uValue))
		ENDIF
		FWrite3(nHandle,pBuffer,PszLen(pBuffer))			// Overwrite Existing field
	ENDIF
RETURN
// ~"ONLYEARLY-"


ACCESS FileOpen AS LOGIC STRICT 
	LOCAL lFileOpen	AS LOGIC
	
// ~"ONLYEARLY+"
	IF nHandle !=  NULL_PTR
		IF nHandle != F_ERROR
			lFileOpen := TRUE
		ELSE
			lFileOpen := FALSE
		ENDIF
	ELSE
		lFileOpen := FALSE
	ENDIF	
RETURN lFileOpen
// ~"ONLYEARLY-"





METHOD GoBottom AS VOID PASCAL 
// ~"ONLYEARLY+"
	nFileSize := FSeek3(nHandle,0,FS_END)							// eof of File
	nLastrec  := Integer(nFileSize / nRecordLength)		// Recalc Last record
	SELF:Goto(nLastrec+1)
RETURN
// ~"ONLYEARLY-"



METHOD Goto(nRecords AS DWORD) AS VOID PASCAL 
// ~"ONLYEARLY+"
	FSeek3(nHandle,SELF:nStartDataByte+ (LONGINT(nRecords)-1)*LONGINT(nRecordLength) ,DWORD(FS_SET))	// goto record
	nCurrentRecord := LONGINT(nRecords)												// Set the record number
RETURN
// ~"ONLYEARLY-"


METHOD GoTop AS VOID PASCAL 
// ~"ONLYEARLY+"
	FSeek3(nHandle,SELF:nStartDataByte,FS_SET)							// goto Top
	nCurrentRecord := 1																// Set the record number
	SELF:ReadRecord()
RETURN
// ~"ONLYEARLY-"


METHOD ReadLine() AS STRING STRICT 
SELF:nCurrentRecord:=SELF:nCurrentRecord+1	
SELF:CLINHA:=FReadLine2(SELF:nhandle,SELF:dwMaxbytes)
RETURN SELF:clinha			// Read one line Of Text






METHOD ReadRecord AS VOID PASCAL 
	LOCAL I 			AS DWORD															// Counter
	LOCAL strDate	//AS STRING
	
// ~"ONLYEARLY+"
	FSeek3(nHandle,SELF:nStartDataByte+ (LONGINT(nCurrentRecord)-1)*LONGINT(nRecordLength) ,DWORD(FS_SET))	// Reset record to beginning of that record
	FRead3(nHandle,pReadBuffer,nRecordLength)						// read record into memory
	SELF:CLINHA:=SubStr(Psz2String(pREADBUFFER),1,nRecordLength)
	AltD()
	FOR I := 1 UPTO nFields															// Process each field
		IF SELF:aHeader[I,2] = "C"
			SELF:aHeader[I,6] := SubStr3(cLINHA,SELF:aHeader[I,5]+1,SELF:aHeader[I,3])
		ELSEIF 	SELF:aHeader[I,2] = "N"
			SELF:aHeader[I,6] := Val( SubStr3(cLINHA,SELF:aHeader[I,5]+1,SELF:aHeader[I,3]))
		ELSEIF 	SELF:aHeader[I,2] = "L"
			SELF:aHeader[I,6] := iif(SubStr3(cLINHA,SELF:aHeader[I,5]+1,SELF:aHeader[I,3])="T",TRUE,FALSE)
		ELSEIF 	SELF:aHeader[I,2] = "D"
			strDate := SubStr3(cLINHA,SELF:aHeader[I,5]+1,SELF:aHeader[I,3])
			SELF:aHeader[I,6] := SToD( strDate )
		ENDIF	
	NEXT	
RETURN
// ~"ONLYEARLY-"


ACCESS RecCount AS DWORD PASCAL 
	LOCAL liFileSize AS INT
// ~"ONLYEARLY+"
	liFileSize:= FSeek3(nHandle,0,FS_END)							// eof of File
	IF liFileSize <= 0
		nFileSize := 0
	ELSE
		nLastrec  := Integer(nFileSize / nRecordLength)		// Recalc Last record
	ENDIF	
//RETURN Integer(FSeek3(SELF:nHandle,0,FS_END) / SELF:nRecordLength)		// Recalc Last record
RETURN nLastrec
// ~"ONLYEARLY-"

ACCESS RecNo AS INT PASCAL        // AS DWORD
// ~"ONLYEARLY+"
RETURN SELF:nCurrentRecord
// ~"ONLYEARLY-"


METHOD Setup( aStruc AS ARRAY, cFile AS STRING, nOpenMode AS DWORD, nStartData AS DWORD, nSEPCHAR AS DWORD) AS VOID STRICT 
	LOCAL I															AS WORD					// Counter
	LOCAL nStartPos	:= 0 								AS WORD					// Starting position of each field (BYTE Position)
//	LOCAL pStartPos := String2Psz("  ") AS PSZ					// Starting pos in .DBF File (BUFFER)
//	LOCAL pLastrec  := Space(4) 				AS STRING				// last record buffer
	
	// 1=FieldName																			// this Info comes from aStruc(Passed in Init Method "aStruc")
	// 2=FieldType																			// Same decleration as dbstruct()
	// 3=FieldLen
	// 4=FieldDec

    SELF:dwMaxBytes := 256	
AltD()	
// ~"ONLYEARLY+"
	SELF:aHeader := {}																	// Initialise Header
	nFields := WORD(Len(AStruc))														// Amount of Fields in file
	FOR I := 1 UPTO nFields															// Load Header Structure
		AAdd(SELF:aHeader,{String2Symbol(AStruc[I,1]),;		// Fieldname
					AStruc[I,2],;																// FieldType
					AStruc[I,3],;																// FieldLen
					AStruc[I,4],;																// FieldDec
					nStartPos,;																	// Starting Pos of record
					""})																				// The actual field DATA
		nStartPos+= aStruc[I,3]														// Set new posotion of starting Pos
	NEXT	
//	SELF:lTextFile := lTextFile													// save whether this is a Textfile, if so use CR after each line
	nRecordLength := nStartPos + nSEPCHAR //iif(lTextFile,1,0)			// Save record Length
	cFileName := cFile																	// File Name
	
// 	default nOpenMode TO FO_READWRITE+FO_DENYNONE				// Default Value of file open Mode
// 	default nStartData TO 0															// default Value of Starting Position of Data in the file
// 	default lTextFile TO TRUE

	nHandle := FOpen2(cFile,nOpenMode)									// Open file
	IF nHandle == F_ERROR  
		NOP
		// report error if you feel like it
	ELSE
//		IF lTextfile
			SELF:nStartDataByte := nStartData //LOGINT(NSTARTDATA)/ Starting Position of File
//		ELSE
//			FSeek3(nHandle,8,FS_SET)													// Goto (Pointer) Starting pos in .DBF File
//			FRead3(nHandle,pStartpos,2)												// First data record pos in File
//			SELF:nStartDataByte := LONGINT((Asc(Left(pStartPos,1)) + Asc(Right(pStartPos,1))*256)+1)
//		ENDIF
		
		nFileSize := FSeek3(nHandle,0,FS_END)								// Calculate the last record in the file
		
//		IF lTextfile
			nLastrec  := Integer(nFileSize / nRecordLength)		// Recalc Last record
//		ELSE
//			FSeek3(nHandle,4,FS_SET)													// Amount of records in file
//			FRead(nHandle,@pLastrec,4)
//			nLastrec := Bin2L(pLastrec)												// Last record in file
//		ENDIF	
		FSeek3(nHandle,SELF:nStartDataByte,FS_SET)								// Goto first Data record
		nCurrentRecord := 1																	// First Record on File
		pReadBuffer := MemAlloc(nRecordLength) 							// Allocate Memory
	ENDIF
RETURN
// ~"ONLYEARLY-"

	


METHOD Skip(nRecords := 1 AS DWORD , lReadRecord AS LOGIC ) AS VOID PASCAL 
// ~"ONLYEARLY+"
	nCurrentrecord += LONGINT(nRecords)								// Set the record number
	IF lReadRecord													// Must the data be read from the file
		SELF:ReadRecord()											// Load Field data into memory
	ELSE
		FSeek3(nHandle,LONGINT(SELF:nStartDataByte+ (nCurrentRecord-1)*LONGINT(nRecordLength)) ,DWORD(FS_SET))	// Skip record
	ENDIF	
RETURN
// ~"ONLYEARLYLY-"
	

METHOD SymFieldGet(sName AS SYMBOL) AS USUAL PASCAL 
	LOCAL I AS BYTE													// Counter
	LOCAL uRet AS USUAL											// Return Value  
	URET:= NIL
	
// ~"ONLYEARLY+"
	FOR I := 1 UPTO nFields									// Search Each Field
		IF SELF:aHeader[I,1] = sName					// Is it the Correct field name
			uRet := SELF:aHeader[I,6]						// retrieve field info
			EXIT
		ENDIF
	NEXT	
RETURN uRet
// ~"ONLYEARLY-"


METHOD SymFieldPut( sName AS SYMBOL, uValue AS USUAL) AS VOID PASCAL 
	LOCAL I AS BYTE															// Counter
	
// ~"ONLYEARLY+"
	FOR I := 1 UPTO nFields											// Search Each Field
		IF SELF:aHeader[I,1] = sName							// Is it the Correct field name
			SELF:aHeader[I,6] := uValue							// Save Value
			EXIT
		ENDIF
	NEXT	
RETURN
// ~"ONLYEARLY-"


METHOD SymFieldPutDisk( sField AS SYMBOL ,uValue AS USUAL) AS VOID PASCAL 
	LOCAL pBuffer 	:= NULL AS PSZ										// Temp record
	LOCAL I AS WORD																		// Counter
	
// ~"ONLYEARLY+"
	FOR I := 1 UPTO nFields														// Search Each Field
		IF SELF:aHeader[I,1] = sField										// Is it the Correct field name
			FSeek3(nHandle,SELF:aHeader[I,5]+SELF:nStartDataByte+ (nCurrentRecord-1)*LONGINT(nRecordLength) ,DWORD(FS_SET))
			IF SELF:aHeader[I,2] = "C"
				pBuffer := String2Psz(uValue)
			ELSEIF 	SELF:aHeader[I,2] = "N"
				pBuffer := String2Psz(Str3(uValue,SELF:aHeader[I,3],SELF:aHeader[I,4]))
			ELSEIF 	SELF:aHeader[I,2] = "L"
				IF uValue == TRUE
					pBuffer := String2Psz("T")
				ELSE
					pBuffer := String2Psz("F")
				ENDIF
			ELSEIF SELF:aHeader[I,2] = "D"
				pBuffer := String2Psz(DToS(uValue))
			ENDIF
			FWrite3(nHandle,pBuffer,PszLen(pBuffer))			// Overwrite Existing field
			EXIT
		ENDIF
	NEXT	
RETURN
// ~"ONLYEARLY-"


METHOD WriteRecord AS VOID PASCAL 
	LOCAL pBuffer 	AS PSZ										// Temp record
	LOCAL I 				AS DWORD									// Counter
	LOCAL strBuffer	AS STRING
	
// ~"ONLYEARLY+"
	strBuffer := ""
	FSeek3(nHandle,SELF:nStartDataByte+ (nCurrentRecord-1)*LONGINT(nRecordLength) ,FS_SET)
	FOR I := 1 UPTO nFields										// Write Each field into a memory variable
		IF SELF:aHeader[I,2] = "C"
			strBuffer += PadR(SELF:aHeader[I,6],SELF:aHeader[I,3])
		ELSEIF 	SELF:aHeader[I,2] = "N"
			strBuffer += Str3(SELF:aHeader[I,6],SELF:aHeader[I,3],SELF:aHeader[I,4])
			SELF:aHeader[I,6] := Val( SubStr3(strBuffer,SELF:aHeader[I,5],SELF:aHeader[I,3]))
		ELSEIF 	SELF:aHeader[I,2] = "L"
			strBuffer += iif(SELF:aHeader[I,6]=TRUE,"T","F")
		ELSEIF 	SELF:aHeader[I,2] = "D"
			strBuffer += DToS(SELF:aHeader[I,6])
		ENDIF	
	NEXT	
	pBuffer := String2Psz( strBuffer )
	FWrite3(nHandle,pBuffer,PszLen(pBuffer))	// Overwrite Existing record

//	IF SELF:lTextFile
		FWrite(nHandle,	CRLF)
//	ENDIF

	SELF:nCurrentRecord += 1
RETURN
// ~"ONLYEARLY-"
	



END CLASS
