﻿CLASS XJLCT INHERIT JLCT

METHOD busca( ) 
	SELF:KeyFind()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("EN","")	


CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("ENG",2)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"LCT.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF

SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()

METHOD ordem( ) 
	SELF:KeyFind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
