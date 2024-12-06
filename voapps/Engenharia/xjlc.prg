CLASS XJLC INHERIT JLC

METHOD BUSC03() 
LOCAL cBUSCA AS STRING
cBUSCA:=SELF:ODCCTIPO:VALUE+Str(cNUMERO,20)
SELF:server:setorder(3)
SELF:server:gotop()
SELF:server:seek(cBUSCA)
IF SELF:server:eof
    SELF:server:gotop()
ENDIF


METHOD busca( ) 
	SELF:KeyFind()

METHOD Busca01() 
SELF:server:setorder(1)
SELF:server:gotop()
SELF:server:seek(cDOCUMENTO)
IF SELF:server:eof
    SELF:server:gotop()
ENDIF

METHOD Busca02() 
SELF:server:setorder(2)
SELF:server:gotop()
SELF:server:seek(cNOVODOC)
IF SELF:server:eof
    SELF:server:gotop()
ENDIF


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
IF ! entramenu("ENG",1)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"LC.DBF",zCURDIR}
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

 METHOD PEGTIPO 
 RETU PEGLTIPO("LCT.DBF")

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
    oDCTIPO:FillUsing({{"_","_"}})
     oDccTIPO:FillUsing({{"_","_"}})

 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
