PARTIAL CLASS jfalta
METHOD append 	
LOCAL oBUSCA AS XBUSCA
oBUSCA:=XBUSCA{SELF,"Localizar Codigo","Digite o Codigo"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   SELF:SERVER:SETORDER(1)
   SELF:SERVER:GOTOP()
   IF SELF:SERVER:SEEK(oBUSCA:cBUSCA)
   	  alert("Conta Ja cadastrada")
   ELSE
   	  SUPER:append()
   	  SELF:server:FIELDPUT("CODIGO",oBUSCA:cBUSCA)
   ENDIF	
ENDIF		

METHOD buscaNUM( ) 
SELF:KeyFind()

METHOD cmdAPU( ) 
SELF:server:FIELDPUT("APURA",SIMNAO(SELF:SERVER:FIELDGET("APURA")))	

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()


METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTFGRP("PTO","AJU")	


METHOD cmdordenar( ) 
	SELF:KeyFind()

METHOD cmdPAD( ) 
SELF:server:FIELDPUT("MACPAD",SIMNAO(SELF:SERVER:FIELDGET("MACPAD")))	


METHOD delete 
alert("Operacao Bloqueada")	


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
