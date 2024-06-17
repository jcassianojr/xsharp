CLASS XJMI04 INHERIT JMI04

METHOD APPEND() 	
alert("Operacao Bloqueada","Operacao Bloqueada")	
//SUPER:append()
//GRVLOG(SELF:SERVER:UNIDADE,"INC","BC07")	
RETURN   .T.

METHOD buscanum( ) 
	SELF:KEYFIND()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()


METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("MI","")	


METHOD DELETE() 
alert("Operacao Bloqueada","Operacao Bloqueada")	
//GRVLOG(SELF:SERVER:UNIDADE,"DEL","BC07")	
//SUPER:DELETE()
RETURN  .T.

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("BCO",4)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"MI04.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
//SELF:USE(oSERVER)
SELF:SHOW()

METHOD pornum( ) 
	SELF:KeyFind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
