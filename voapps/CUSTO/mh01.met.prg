﻿CLASS XJZVE INHERIT JZVE

METHOD APPEND(oOWNER) 
alert("Operação Bloqueada")

	


METHOD buscaov( ) 
	SELF:KeyFind()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("MH","")	


METHOD DELETE(oOWNER) 
alert("Operação Bloqueada")


CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEMANA5
LOCAL aDAD AS ARRAY
IF ! ENTRAMENU("CUS",16)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"MH01",ZCURDIR,aDIR}
oSERVER:=USEMANA5{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			

METHOD porov( ) 
	SELF:KeyFind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
