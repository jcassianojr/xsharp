FUNCTION XSQLConnect() AS LOGIC STRICT
	LOCAL cStatement AS STRING
	  
	// this example shows how to attach two databases (company and temp)
  // variables in caps beginning with GLO are of course globals
  
  GLOcDATABASE := "company.db"
	SQLConnectErrorMsg( TRUE ) 
	GLOoCONNECTION := SQLConnection{"SQLite3", "", "" }	    
	GLOoCONNECTION:connect()
  IF !GLOoCONNECTION:Connected 
  	// try to manually connect
		IF ! GLOoCONNECTION:DriverConnect( , SQL_DRIVER_PROMPT  )
  		MsgBox("No connection")  
  		RETURN FALSE
		ENDIF 
  ENDIF
  // if there's a secondary database, attach it first
  cStatement := "ATTACH DATABASE 'temp.db' AS tempfiles" 
 	GLOoSTATEMENT := SQLStatement{cStatement , GLOoCONNECTION }

 IF !GLOoSTATEMENT:Execute()
		// we've used this method primarily to test for correct syntax
		MsgBox( "didn't execute " + cStatement) 
		RETURN FALSE
 ENDIF    
 GLOoSTATEMENT:FreeStmt( SQL_DROP )
  
  // it seems that tables in most recently-attached database don't need to be prefaced
  // for example you can say SELECT * FROM master  rather than  SELECT * FROM maindb.master
  cStatement := "ATTACH DATABASE '" + GLOcDATABASE + "' AS maindb" 
 	GLOoSTATEMENT := SQLStatement{cStatement , GLOoCONNECTION }

 IF !GLOoSTATEMENT:Execute() 
 	  // again test for syntax
		MsgBox( "didn't execute " + cStatement)   
		RETURN FALSE
 ENDIF    
 GLOoSTATEMENT:FreeStmt( SQL_DROP )

RETURN TRUE


