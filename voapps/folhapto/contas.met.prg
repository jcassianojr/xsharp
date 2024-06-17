PARTIAL CLASS jcontas
METHOD append 	
LOCAL oBUSCA AS XBUSCA
oBUSCA:=XBUSCA{SELF,"Localizar Conta","Digite Nº Conta"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   SELF:SERVER:SETORDER(1)
   SELF:SERVER:GOTOP()
   IF SELF:SERVER:SEEK(Val(oBUSCA:cBUSCA))
   	  alert("Conta Ja cadastrada")
   ELSE
   	  SUPER:append()
   	  SELF:server:FIELDPUT("CODIGO",Val(oBUSCA:cBUSCA))
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
SELF:XWRPTFGRP("CTA","")	


METHOD cmdordenar( ) 
	SELF:KeyFind()

METHOD delete 
IF ! MDG("Apagar Registro") .AND. SELF:SERVER:LockCurrentRecord()
	RETU SELF
ENDIF	
SELF:server:delete()
SELF:server:skip(-1)
IF SELF:sERVER:BOF
   SELF:SERVER:GOTOP()	
ENDIF		

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
