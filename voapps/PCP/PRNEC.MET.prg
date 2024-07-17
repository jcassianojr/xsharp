PARTIAL CLASS jpcorte
METHOD Peglxdiz1( ) 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL cSQL AS STRING
LOCAL oStmt AS SQLStatement

oConn := SQLConnection{}
IF ! oConn:connect("ol_logix","","")
   alert("Erro na Conecção")
   RETU
ENDIF	

IF Empty(SELF:CODIGOTMP)
   alert("Codigo Nao preenchido"	)
   RETU
ENDIF	
	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

CSQL:=" SELECT den_item "
CSQL+=" FROM item "
csql+=" where cod_empresa='01' and cod_item='" +Trim(SELF:CODIGOTMP)  +"'"


Oreg:= SQLSelect{cSQL,oconn}
IF ! oREG:EOF
   SELF:DESCRICAOTMP:=FIXSTR(oREG:FIELDGET("den_item"))
ENDIF	
oREG:CLOSE()
oCONN:Disconnect()




END CLASS
PARTIAL CLASS JPRNEC
METHOD buscacod( ) 
SELF:KeyFIND()


METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("PE","PE")	

METHOD Editar( ) 
	SELF:oSFJPRNECI:ViewForm()

METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:SERVER:FIELDGET("CODIGO"))," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETU
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG"}
OFOTOVIEW:SHOW()
	

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
	    FabCenterWindow( SELF )
 RETURN SELF

METHOD programa() 
LOCAL oJAN AS JPRNECT	
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL cTIPOENT,cCODCOMP AS STRING
cTIPOENT:=SELF:oSFJPRNECI:SERVER:FIELDGET("TIPOENT")
cCODCOMP:=SELF:oSFJPRNECI:SERVER:FIELDGET("CODCOMP")
IF ! entramenu("PCP",8)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"PRNECT.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
oJAN:=JPRNECT{SELF,,oSERVER}
oJAN:SERVER:GOTOP()
oJAN:SERVER:SEEK(cTIPOENT+cCODCOMP)
oJAN:SHOW()		
	

METHOD Tabular( ) 
	SELF:oSFJPRNECI:ViewTable()

METHOD Timer() 
   SELF:SERVER:COMMIT()
   SELF:oSFJPRNECI:SERVER:Commit()



END CLASS
