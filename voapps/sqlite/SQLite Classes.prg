CLASS XSQLSelect INHERIT SQLSelect

// constructor inserted by xPorter, remove superfluous arguments
CONSTRUCTOR(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9) CLIPPER
SUPER(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
METHOD CountRecs()  
	LOCAL nReturn AS INT
	LOCAL nTemRec AS INT
  // counts the rows in a Selection
  nReturn := 0
  nTemRec := SELF:Recno  // this will work sometimes
  SELF:GoTop()           // this seems to work
  WHILE !SELF:EoF
    nReturn := nReturn + 1
  	SELF:Skip(1)
  ENDDO	
  IF nTemRec > 0  
  	SELF:Goto( nTemRec )
  ELSE
  	SELF:GoTop()
  ENDIF
  RETURN nReturn
 
METHOD GetDateField( sField )  
	// returns a YYYYMMDD to a date variable
	RETURN SToD( SELF:FIELDGET(sField) )

METHOD NoNilGet( sField )  
	LOCAL cReturn AS STRING  
  // works on Char fields; fixes the problem of NULL values in the merge file 
	IF IsNil( SELF:FIELDGET(sField) ) 
		cReturn := Space(1)
	ELSE
		cReturn := SELF:FIELDGET( sField )
	ENDIF
	RETURN cReturn      
METHOD XSkip( nSkip ) 
  // IF YOU'RE GETTING AN ERROR THAT POINTS TO SKIP(), it's probably because of a FIELDGET(# error
  // (at least it was today 6-20-2015).  Check the fields in both the code and in the selection
	Default( @nSkip, 1)
	IF SELF:EoF
		RETURN FALSE
	ELSE
		SELF:Skip( nSkip )
	ENDIF
  RETURN TRUE	

END CLASS
CLASS XSQLTable INHERIT SQLTable
	PROTECT cUpdate     AS STRING
	PROTECT cUnique     AS STRING 
	PROTECT cFileNameAbbrv AS STRING

// constructor inserted by xPorter, remove superfluous arguments
CONSTRUCTOR(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9) CLIPPER
SUPER(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
METHOD AppendNew() 
	LOCAL aStruct AS ARRAY
	LOCAL nTemCnt, nTemLen AS DWORD
	
	* makes sure that all default values are filled in so the NOT NULL constraint is met
  * creates an array of fields, and then loops through to ensure everything has a value
  * This is intended to mitigate the problem of Empty() fields being rendered as NULL

	aStruct := SELF:DbStruct
	nTemLen := ALen( aStruct )
	 
	IF ! SELF:Append() 
*		MsgBox( "Table "  + SELF:Name + " append failed" ) 
		RETURN FALSE
	ENDIF
	FOR nTemCnt := 1 UPTO nTemLen  
		DO CASE
		CASE aStruct[ nTemCnt, DBS_NAME ] = "FQ" 
			SELF:cUnique := XReplQ( SELF:cFileNameAbbrv )
			SELF:FIELDPUT(#FQ, SELF:cUnique )
		CASE aStruct[ nTemCnt, DBS_NAME ] = "FDT" 
			SELF:FIELDPUT(#FDT, SELF:XReplDT() )
		OTHERWISE
			SELF:FIELDPUT( aStruct[ nTemCnt, DBS_NAME ], XDefaultVal( aStruct[ nTemCnt, DBS_TYPE ] ) )
		ENDCASE
	NEXT  
  RETURN TRUE

METHOD CopyStructure( cNewTable ) 
	LOCAL oSelect AS XSQLSelect 
	LOCAL cStatement AS STRING
	LOCAL lReturn  AS LOGIC
  // creates a new table with the structure from the current table
	cStatement := Space(0)
  // get the structure
	oSelect := XSQLSelect{ "SELECT sql FROM sqlite_master WHERE type = 'table' AND tbl_name = '" + SELF:Name + "'", GLOoCONNECTION }  
	oSelect:GoTop()   
	cStatement := oSelect:FIELDGET(#sql)
  // create the new table
  cStatement := "CREATE TABLE " + AllTrim( cNewTable) + SubStr2( cStatement, At( "(", cStatement ) )
  oSelect:SQLString := cStatement 
  lReturn := oSelect:Statement:Execute()
	oSelect:Close() 
	RETURN lreturn

METHOD dbOutStruct() 
	LOCAL oSelect AS XSQLSelect 
	LOCAL cReturn AS STRING
  // returns the structure of the current statement, using the SQLite syntax
	cReturn := Space(0)
	oSelect := XSQLSelect{ "SELECT sql FROM sqlite_master WHERE type = 'table' AND tbl_name = '" + SELF:Name + "'", GLOoCONNECTION }  
	oSelect:GoTop()   
	cReturn := oSelect:FIELDGET(#sql)
	oSelect:Close() 
	RETURN cReturn

METHOD DeleteRow( cField, nClient, cQ )  
	LOCAL cWhere     AS STRING 
	Default( @cField, Space(1) ) // field containing the client number
	Default( @nClient, 0 )       // sometimes you're looking just for the unique_id
	Default( @cQ, Space(1) )     // Unique_ID
  
  IF nClient > 0
  	// construct the WHERE clause
  	cWhere :=  cField + "=" + LTrim( Str2( nClient, 7) ) 
  ELSE
  	IF Empty( cQ )
*  		MsgBox( "Delete statement incorrect", "Cannot Delete")
  		RETURN FALSE
  	ENDIF
  	cWhere := Space(0)
  ENDIF
  IF !Empty( cQ ) 
		IF !Empty( cWhere )
			cWhere += " AND FQ='" + cQ + "'" 
		ELSE
			cWhere := "FQ='" + cQ + "'" 
		ENDIF
  ENDIF
  
  GLOoSTATEMENT:SQLString := "DELETE FROM " + SELF:Name + " WHERE " + cWhere 
  RETURN GLOoSTATEMENT:Execute()

METHOD FieldCount() 
	// returns the number of fields
	RETURN ALen( SELF:DbStruct )

METHOD FixNulls() 
	LOCAL aStruct AS ARRAY
	LOCAL nTemCnt, nTemLen AS DWORD
	
	* goes through the fields and makes sure that any null fields are filled in
	aStruct := SELF:DbStruct
	nTemLen := ALen( aStruct )
	 
	FOR nTemCnt := 1 UPTO nTemLen
		IF IsNil( SELF:FIELDGET( aStruct[ nTemCnt, DBS_NAME] ) )
			SELF:FIELDPUT( aStruct[ nTemCnt, DBS_NAME ], XDefaultVal( aStruct[ nTemCnt, DBS_TYPE ] ) )
		ENDIF
	NEXT     
	RETURN NIL

METHOD GetAsString( sField, cType, nLength, nDecimal ) 
	LOCAL cReturn AS STRING
  // returns any field as string, regardless of data type   
  // used in constructing SQL statements
	DO CASE
	CASE cType = "C"
		cReturn := SELF:FIELDGET( sField ) 
	CASE cType = "L"
		cReturn := LTOC( SELF:FIELDGET( sField ) )
	CASE cType = "D"
		cReturn := IIF( nLength < 10, DToS(SELF:FIELDGET( sField )) , DToC( SELF:FIELDGET( sField ) ) )
	CASE cType = "N"
		cReturn := Str3( SELF:FIELDGET( sField ), nLength, nDecimal )
	OTHERWISE 
		cReturn := Space(1)
	ENDCASE
	RETURN cReturn

METHOD GoToFQ( cRecord )  
	// Movement by record number isn't supported in SQLite, so we maintain a field 
	// that contains a unique id: FQ.        
	IF SELF:FieldPos("FQ") = 0   
		RETURN FALSE
	ENDIF
	RETURN SELF:Seek( #FQ, cRecord, FALSE )

METHOD Locate( sField, cValue ) 
	LOCAL lreturn := FALSE AS LOGIC
  // Locate() doesn't work so we use this work-around
	SELF:GoTop()
	WHILE !SELF:EoF
		IF sField = RTrim( cValue )
			lreturn := TRUE
			EXIT
		ENDIF
		SELF:Skip(1)
	ENDDO
	RETURN lreturn

ACCESS TimeStamp  
  // returns, and updates if necessary, the date and time string.
	IF Empty( SELF:cUpdate )
		SELF:XReplDT()
	ENDIF
	RETURN SELF:cUpdate

ACCESS Unique_ID 
	IF Empty( SELF:cUnique )
		IF SELF:FieldPos("FQ") > 0
		 	SELF:cUnique := SELF:FIELDGET(#FQ)
		 	IF Empty( SELF:cUnique )
		 		SELF:cUnique := XReplQ( SELF:Name )
		 		SELF:FIELDPUT(#FQ, SELF:cUnique )
		 	ENDIF
		ENDIF
	ENDIF
	RETURN SELF:cUnique

METHOD UpdateRow( a, cField, nClient, cQ )  
  // updates an existing row in the table.  This method is used in any AppendNew
  // or update operation because we always append first and add the row.  
  // Appending and updating fields before adding the row doesn't always seem to work.
  // so we add the client number and/or the Unique_ID and then update using the
  // WHERE clause
	LOCAL cStatement AS STRING
	LOCAL cWhere     AS STRING 
	Default( @cField, Space(1) )  // field containing the client number 
	Default( @nClient, 0 )        // sometimes you're looking just for the unique_id
	Default( @cQ, Space(1) )      // field containing the Unique_ID.  
	// you're looking either for a client number or unique id
  
  // always make sure there's a unique id.  If it was missed, add it.
  IF SELF:FieldPos("FDT") >0   .AND. AScan( a, { |x| x[1] == "FDT" } ) = 0   
  	AAdd( a, {"FDT", SELF:XReplDT() } )  
  ENDIF   
 
  IF nClient > 0
  	cWhere :=  cField + "=" + LTrim( Str2( nClient, 7) ) 
  ELSE
  	cWhere := Space(0)
  ENDIF
  IF !Empty( cQ ) 
		IF !Empty( cWhere )
			cWhere += " AND FQ='" + cQ + "'" 
		ELSE
			cWhere := "FQ='" + cQ + "'" 
		ENDIF
  ENDIF
  
 	cStatement := XUpdateStmt( SELF:Name, a, cWhere  )  
  GLOoSTATEMENT:SQLString := cStatement
  RETURN GLOoSTATEMENT:Execute()

METHOD XReplDT() 
	// makes a date and time string which is used to fill a last update field
	SELF:cUpdate := DToS( Today() ) + SubStr3( Time24(), 1, 5 ) 
	RETURN SELF:cUpdate


END CLASS
FUNCTION XRecCount( oTable AS XSQLTable, cWhere AS STRING ) AS INT STRICT 
	LOCAL nReturn AS INT
	LOCAL oSelect AS XSQLSelect
	LOCAL cStatement AS STRING    
  // a work-around for RecCount().  Creates a select cursor and a field
  // named XCount, which contains the count.  WHERE clause is optional
	cStatement := "SELECT count(*) AS XCOUNT FROM " + oTable:Name
	IF !Empty( cWhere ) 
		cStatement += " WHERE " + cWhere
	ENDIF
	oSelect := XSQLSelect{ cStatement, GLOoCONNECTION }  
	nReturn := oSelect:FIELDGET(#XCOUNT) 
	oSelect:Close()
  RETURN nReturn

FUNCTION XReplQ( cFile AS STRING ) AS STRING STRICT
	LOCAL nSeconds AS DWORD
  LOCAL cNumber, cTemStr  AS STRING
  STATIC nRand  := 0 AS INT
  // creates a new ID
  nRand ++
  cTemStr := Str3(Rand(nRand), 12, 9)
	cNumber := Right( cTemStr, 7) 
  // 4th character runs chr(63) "?" through chr(122) "z" 
  // NOTE: IT NEVER CAN BE 39 (' single quote, which plays hell with SQLite)
  nSeconds := Val(SubStr(Time(),7,2)) + 63
  RETURN PadR( cFile, 3, "_") + Chr( nSeconds ) + cNumber

