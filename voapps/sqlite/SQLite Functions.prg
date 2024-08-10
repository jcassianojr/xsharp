FUNCTION DBF2CSV(cCSVFile AS STRING, cDBFFile AS STRING) AS VOID STRICT
	// cCSVFile is the name of the output file; cDBFFile is the name of the DBF
	LOCAL phandle  AS PTR 
  LOCAL oOutput  AS DBServer  
  LOCAL aResAry  AS ARRAY 
  LOCAL nLen     AS DWORD 
  LOCAL nTemCnt  AS DWORD
  LOCAL cString  AS STRING  
  LOCAL cVar     AS STRING  
  LOCAL cSeparator AS STRING
  LOCAL CRLF     AS STRING
  
  CRLF := Chr( 13 ) + Chr(10) // line terminator
  
  cSeparator := "|"  // SQLite uses pipe characters as CSV separators
  
 	oOutput := DbServer{ cDBFFile } 

 	// make an array of the dbf structure
	aResAry := oOutput:DbStruct

  // initialize the output CSV file
	phandle := FCreate( cCSVFile, 0)

	nLen := ALen( aResAry )

	oOutput:GoTop()
	WHILE !oOutput:EOF

	  cString := Space(0)
		FOR nTemCnt :=1 UPTO nLen 

		 	// loop the file structure array; one element for each field 
		 	
		  DO CASE
		  CASE aResAry[nTemCnt, DBS_TYPE] = "C"  // if it's a character field
/* 
       // THIS IS IMPORTANT.  Most tables will require a method for going to a specific record.
          Difficult to do that in SQL without a unique identifier (something like a guid) for
          each record.  Here is where we check.  If the field is FQ (our chosen name for the 
          unique identifier field), then we check to ensure it contains a unique identifier.
					  	
  	    IF oOutput:FieldName( nTemCnt ) = "FQ"  .AND. Empty( oOutput:FIELDGET( nTemCnt ) )
					oOutput:XReplQ()
  	    ENDIF
*/
        // here we strip characters that will get in the way of the import
		    cVar := Trim( StrTran( oOutput:FIELDGET( nTemCnt ), e"\"") ) // no quotes
		    cVar := StrTran( cVar, CRLF, "<CR>" ) // no returns
		    cVar := StrTran( cVar, Chr( 13 ) )  // found this in a notepad file
		    cVar := StrTran( cVar, Chr( 10 ) )  // found this in a notepad file
		    cVar := StrTran( cVar, Chr( 2 ) )  // found this in a notepad file

	 	 	CASE aResAry[nTemCnt, DBS_TYPE ] = "N"   // if it's a numeric field
	 	   	IF oOutput:FIELDGET(nTemCnt) = 0
	 	    	cVar := Space(0)
	 	   	ELSE
 	 	    	cVar := LTrim(Str( oOutput:FIELDGET( nTemCnt ), aResAry[nTemCnt, 3], aResAry[nTemCnt, 4] ))
	 	   	ENDIF
	 	   	
 	 		CASE aResAry[nTemCnt, DBS_TYPE ] = "D"  // if it's a date, make it DToS()
 	 	  	cVar := DToS( oOutput:FIELDGET( nTemCnt ) )

 	 		CASE aResAry[nTemCnt, DBS_TYPE ] = "L"  // if it's a logic field, make it Y or N
 	 	  	cVar := IIF( oOutput:FIELDGET( nTemCnt ) = TRUE, "Y", "N" )
 
 	 		OTHERWISE
 	 	  	cVar := Space(0)
	 		ENDCASE  
	 		// remove any pipe characters that might be contained in the field
			cVar := StrTran( cVar, cSeparator )

 	 		IF nTemCnt = 1
 	 			// if it's the first field in the record, create a new string
 	  		cString := cVar
 	 		ELSE
 	 	  	cString += cSeparator + cVar
 	 		ENDIF

 		NEXT

  	FWrite( phandle, cString + CRLF )    // write the string and terminate with carriage return / line feed
  	oOutput:Skip( 1 )
	ENDDO
  oOutput:Close()
	FClose(phandle)

  RETURN

FUNCTION MsgBox( cText, cCaption, iFlags ) AS LONG

	Default(@cCaption,"Message")
	Default(@iFlags,MB_OK)
	
  RETURN MessageBox( GetActiveWindow(), String2Psz(cText), String2Psz(cCaption),  iFlags + MB_APPLMODAL )

FUNCTION RPadStr( cField AS STRING, nLength AS DWORD) AS STRING STRICT  
	// since SQLite stores everything as RTrim(), we need a function to create the spaces where necessary
	RETURN "SubStr(" + cField + " || '" + Replicate( Space(1), nLength ) + "',1," + LTrim( Str2( nLength, 3) ) + ")"

FUNCTION Usual2Stmt( uValue AS USUAL ) AS STRING STRICT
	LOCAL cReturn  AS STRING
  LOCAL cType    AS STRING 
  LOCAL nLength  AS DWORD 
  LOCAL nDecimal AS DWORD
  LOCAL cVar     AS STRING
  // same as Usual2String() except that we use this when inserting the 
  // variable into a statement
  cType := ValType( uValue )

	DO CASE
	CASE cType = "C"  
		cVar := RTrim( uValue)
		IF SLen( cVar ) = 0
			cReturn := "' '"
		ELSE
			cReturn := "'" + cVar + "'"
		ENDIF
	CASE cType = "L"
		cReturn := IIF( uValue, "1", "0" )
	CASE cType = "D"
		cReturn := "'" + DToS( uValue ) + "'"
	CASE cType = "N" 
    nDecimal := 5
    nLength  := 20
		cVar    := Str3( uValue, nLength, nDecimal )
    // determine the number of decimals
    WHILE nDecimal > 0
      IF SubStr3( cVar, nLength, 1 ) != "0"   .OR. SubStr3( cVar, nLength, 1 ) = "."
      	EXIT
      ENDIF
      nLength  -= 1
    	nDecimal -= 1
    ENDDO
		cReturn := LTrim( Str3( uValue, nLength, nDecimal ) )
	OTHERWISE 
		cReturn := "' '"
	ENDCASE
	RETURN cReturn

FUNCTION XBetween( dDate1 AS DATE, dDate2 AS DATE ) AS STRING STRICT  
	// returns a BETWEEN statement for two date variables
	RETURN( " BETWEEN '" + DToS( dDate1 ) + "' AND '" + DToS( dDate2 ) + "'" )

FUNCTION XCreateStmt( aStruct AS ARRAY ) AS STRING STRICT
	LOCAL cStatement AS STRING
	LOCAL nTemCnt, nTemLen AS DWORD
	LOCAL cType      AS STRING 
	// takes the structure of a table and the makes a CREATE statement
	// on the basis of that structure
	nTemLen := ALen( aStruct )
  cStatement := " ("
	FOR nTemCnt := 1 UPTO nTemLen 
		cStatement += RTrim( aStruct[ nTemCnt, DBS_NAME ] ) + " "
		cType := aStruct[ nTemCnt, DBS_TYPE]
		DO CASE
		CASE cType = "C"
			cStatement += "CHAR("
		CASE cType = "N"
			cStatement += "NUMERIC("
		CASE cType = "V"
			cStatement += "VARCHAR("
		CASE cType = "D" 
			cStatement += "CHAR("
		ENDCASE 
		cStatement += LTrim( Str2( aStruct[ nTemCnt, DBS_LEN ], 4) ) 
	  IF aStruct[ nTemCnt, DBS_DEC] > 0
			cStatement += "," + LTrim( Str2( aStruct[ nTemCnt, DBS_DEC], 2) )
	  ENDIF
    cStatement += ")"
    IF !Empty( aStruct[ nTemCnt, 5] ) // COLLATE NOCASE, PRIMARY KEY
			cStatement += " " + aStruct[ nTemCnt, 5]
    ENDIF
		IF nTemCnt < nTemLen
			cStatement += ","
		ENDIF		
	NEXT
	
	RETURN cStatement+ ")"

FUNCTION XDefaultVal( cType AS STRING ) AS USUAL
	LOCAL uReturn AS USUAL  
	// returns the default value based on the variable type
	DO CASE
	CASE cType = "N"
		uReturn := 0 
	CASE cType = "D"
		uReturn := CToD( Space(10) )
	CASE cType = "L"
		uReturn := TRUE
	OTHERWISE
		uReturn := Space(1)
	ENDCASE
	RETURN uReturn

FUNCTION XInsertStmt( cTable AS STRING, aSave AS ARRAY ) AS STRING STRICT
	LOCAL cReturn AS STRING                  
	LOCAL nTemCnt, nTemLen AS DWORD     
	// creates a SQL INSERT statement based on the aSave array of fields and values
	
	
	// aSave is a multi-dimensional array of variables to be saved.
  // { { cFieldName, uVar } }  
  // Example: { { "ACCOUNT", nClient }, {"ADDRESS", cAddr}, {"CITY", cCity} }

	cReturn := "INSERT INTO " + cTable + "("
	nTemLen := ALen( aSave )
  IF nTemLen = 0
  	RETURN Space(1)
  ENDIF 
  cReturn += RTrim( aSave[ 1, 1] )
	FOR nTemCnt := 2 UPTO (nTemLen) 
		cReturn += 	", " + RTrim( aSave[ nTemCnt, 1 ] ) + ","
	NEXT 
	cReturn += ") VALUES ("

  
  FOR nTemCnt := 1 UPTO nTemLen 
		cReturn := Usual2Stmt( aSave[ nTemCnt, 2] )
    IF nTemCnt < nTemLen
    	cReturn += ","
    ENDIF
  NEXT
  cReturn += ")"
  
*  FWrite( GLOpHANDLE, cReturn )

	RETURN cReturn

FUNCTION XStatement( cStatement AS STRING ) AS LOGIC STRICT
	LOCAL oStmt AS SQLStatement
  LOCAL lReturn AS LOGIC
  // self-contained SQL statement; created, executed and destroyed
	oStmt := SQLStatement{ cStatement, GLOoCONNECTION }
	oStmt:Execute()
//	oStmt:Destroy()
	RETURN lReturn

FUNCTION XTableList() AS ARRAY STRICT                                        
	LOCAL aReturn AS ARRAY
	LOCAL oTables AS XSQLSelect   
	// returns an array list of all the tables in the database
	oTables := XSQLSelect{ "SELECT name FROM sqlite_master WHERE type='table'", GLOoCONNECTION }   
	oTables:GoTop()      
	aReturn := {}
	WHILE !oTables:EoF
		AAdd( aReturn, oTables:FIELDGET(#NAME) )
		oTables:Skip(1)
	ENDDO
	oTables:Close()
  RETURN aReturn

FUNCTION XUpdateStmt( cTable AS STRING, aSave AS ARRAY, cWhere AS STRING ) AS STRING STRICT
	LOCAL cReturn AS STRING 
	LOCAL nTemCnt, nTemLen AS DWORD
  // creates an update statement 	
	
  // aSave is a multi-dimensional array of variables to be saved.
  // { { cFieldName, uVar } }  
  // Example: { { "ACCOUNT", nClient }, {"ADDRESS", cAddr}, {"CITY", cCity} }

	cReturn := "UPDATE " + cTable + " SET "
	nTemLen := ALen( aSave )
	
	IF nTemLen = 0
		RETURN Space(1)
	ENDIF
	
  FOR nTemCnt := 1 UPTO nTemLen 
    cReturn += aSave[ nTemCnt, 1] + "=" + Usual2Stmt( aSave[ nTemCnt, 2] )
    IF nTemCnt < nTemLen
    	cReturn += ","
    ENDIF
  NEXT
  cReturn += " WHERE " + cWhere   
  
	RETURN cReturn

FUNCTION XZap( oTable AS XSQLTable ) AS LOGIC STRICT                                                                      
	LOCAL lReturn := FALSE  AS LOGIC
	// removes all the records in a table.  Same as DBServer:Zap
	GLOoSTATEMENT:SQLString := "DELETE FROM " + oTable:Name 
	IF  GLOoSTATEMENT:Execute() 
		oTable:Commit()
		lReturn := TRUE
	ELSE
*		MsgBox( "Couldn't clear " + oTable:Name, "Zap Error" )
	ENDIF 
	GLOoSTATEMENT:FreeStmt( SQL_DROP )
	RETURN lReturn 


