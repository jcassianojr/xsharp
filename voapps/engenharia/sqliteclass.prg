/*
TEXTBLOCK  exemplos

oSQLSELECT:= SQLITESELECT{"LCT"}
         oSQLSELECT:GOTOP()
	      WHILE ! oSQLSELECT:EoF
	     	   cVALOR:= oSQLSELECT:FIELDGET(1)
	      	   alert(cVALOR)
	      	   oSQLSELECT:Skip()
	      ENDDO	


oSQLTABLE:= sqlitetable{"LCT",{"TIPO"}}
         oSQLTABLE:GOTOP()
	      WHILE ! oSQLTABLE:EoF
	     	   cVALOR:= oSQLTABLE:FIELDGET(1)
	      	   alert(cVALOR)
	      	   oSQLTABLE:Skip()
	      ENDDO	
	
SqliteExec("LCT","DELETE FROM lct  WHERE tipo = 'XX';")
SqliteExec("LCT","INSERT INTO lct (tipo)  VALUES ( 'AX' );")	
	

*/
CLASS SqLiteSelect INHERIT SQLSelect

CONSTRUCTOR(cARQ) 
LOCAL cARQCHAVE  AS STRING
LOCAL cARQSQLITE AS STRING
LOCAL oCONN AS SQLConnection
LOCAL cSQL AS STRING
LOCAL oSTATEMENT AS SQLStatement
cARQCHAVE:=cARQ+".DBF" //buscando com ponto .dbf para buscar na mesma chabe
cARQSQLITE:=PEGINIVAL(zCURINI,cARQCHAVE,"SQLITEARQ")
	oCONN := SQLConnection{"SQLite3", "", "" }	
	oCONN:connect()
    IF oCONN:Connected
    	cSQL := "ATTACH DATABASE '"+ cARQSQLITE +"' AS "+cARQ
	    oSTATEMENT := SQLStatement{cSQL ,oCONN }
	    IF oSTATEMENT:Execute()
	      oSTATEMENT:FreeStmt( SQL_DROP  )	
	      cSQL :=   "SELECT * FROM "+cARQ
	      SUPER(cSQL,oCONN)
	    ENDIF
	ENDIF
	
RETURN SELF

END CLASS
CLASS sqlitetable INHERIT SQLTable

CONSTRUCTOR(cARQ,aCAMPOS) 
LOCAL cARQCHAVE  AS STRING
LOCAL cARQSQLITE AS STRING
LOCAL oCONN AS SQLConnection
LOCAL cSQL AS STRING
LOCAL oSTATEMENT AS SQLStatement
cARQCHAVE:=cARQ+".DBF" //buscando com ponto .dbf para buscar na mesma chabe
cARQSQLITE:=PEGINIVAL(zCURINI,cARQCHAVE,"SQLITEARQ")
	oCONN := SQLConnection{"SQLite3", "", "" }	
	oCONN:connect()
    IF oCONN:Connected
    	cSQL := "ATTACH DATABASE '"+ cARQSQLITE +"' AS "+cARQ
	    oSTATEMENT := SQLStatement{cSQL ,oCONN }
	    IF oSTATEMENT:Execute()
	      oSTATEMENT:FreeStmt( SQL_DROP  )	
	      SUPER(cARQ,aCAMPOS,oCONN)
	    ENDIF
	ENDIF
	
RETURN SELF	
	
	


END CLASS
FUNCTION SqliteExec(cARQ,cSQLEXEC)
LOCAL lRETU AS LOGIC
LOCAL oCONN AS SQLConnection
LOCAL oSTATEMENT AS SQLStatement
LOCAL cSQL AS STRING
LOCAL cARQCHAVE AS STRING
LOCAL cARQSQLITE AS STRING

cARQCHAVE:=cARQ+".DBF" //buscando com ponto .dbf para buscar na mesma chabe
cARQSQLITE:=PEGINIVAL(zCURINI,cARQCHAVE,"SQLITEARQ")

lRETU:=.T.

	oCONN := SQLConnection{"SQLite3", "", "" }	
	oCONN:connect()
    IF oCONN:Connected
	   cSQL := "ATTACH DATABASE '"+ cARQSQLITE +"' AS "+ cARQ
	   oSTATEMENT := SQLStatement{cSQL ,oCONN }
	    IF oSTATEMENT:Execute()
	      oSTATEMENT:FreeStmt( SQL_DROP  )	
            oSTATEMENT := SQLStatement{cSQLEXEC ,oCONN }
	        IF oSTATEMENT:Execute()
	           lRETU:=.T.
	        ENDIF
		ENDIF
    ENDIF
RETURN lRETU

