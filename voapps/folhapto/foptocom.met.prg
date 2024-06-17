PARTIAL CLASS JPTOcom
METHOD APPEND 	
	alert("Operaçao Bloqueada")


METHOD buscaNUM( ) 
	  SELF:KeyFind()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()


METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTFGRP("PTO","")	


METHOD cmdordenar( ) 
	SELF:KeyFind()

METHOD delete 
alert("Operaçao Bloqueada")	

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
