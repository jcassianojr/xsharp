PARTIAL CLASS jptohre
METHOD append 	
LOCAL oBUSCA AS XBUSCA
oBUSCA:=XBUSCA{SELF,"Localizar Codigo","Digite o Codigo"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   SELF:SERVER:SETORDER(1)
   SELF:SERVER:GOTOP()
   IF SELF:SERVER:SEEK(oBUSCA:cBUSCA)
   	  alert("Codigo Ja cadastrada")
   ELSE
   	  SUPER:append()
   	  SELF:server:FIELDPUT("CODIGO",oBUSCA:cBUSCA)
   ENDIF	
ENDIF		

METHOD buscaNUM( ) 
SELF:KeyFind()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()


METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTFGRP("PTO","HOR")	


METHOD delete 
alert("operacao bloqueada")	


METHOD pegdes( ) 
LOCAL cDIZ AS STRING
cDIZ:=Str(SELF:SERVER:FIELDGET("HENT"),5,2)+" "
IF ! Empty(SELF:SERVER:FIELDGET("HALS"))
   cDIZ+=Str(SELF:SERVER:FIELDGET("HALS"),5,2)+" "
   cDIZ+=Str(SELF:SERVER:FIELDGET("HALE"),5,2)+" "
ENDIF
cDIZ+=Str(SELF:SERVER:FIELDGET("HSAI"),5,2)	
SELF:serveR:FIELDPUT("NOME",cDIZ)	

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
