﻿CLASS XJBF01 INHERIT jbF01	

METHOD APPEND() 
LOCAL nVENDA AS DWORD
SELF:server:setorder(1)
SELF:server:gobottom()
nVENDA:=SELF:Server:VENDA
nVENDA++
SUPER:append()
SELF:SERVER:FIELDPUT("VENDA",nVENDA)
RETURN  .T.

METHOD buscanum( ) 
	SELF:keyfind()

METHOD cmddelfiltro() 
SELF:xcmddelfiltro()	
SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
SELF:xCMDFILTRAR()
SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("BF","")	


METHOD DELETE() 
IF ! MDG("Apagar Registro") .AND. SELF:SERVER:LockCurrentRecord()
	RETU SELF
ENDIF	
SELF:server:delete()
SELF:server:unlock()
SELF:server:skip(-1)
IF SELF:SERVER:BOF
   SELF:SErVER:GOTOP()
ENDIF

METHOD ESCCOD() 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"BE01.DBF"}		
oESC:SHOW()	
IF Oesc:lok
   SELF:SERVER:FIELDPUT("CODIGO",oESC:CODIGO)
ENDIF

METHOD ESCFOR( ) 
LOCAL oESC AS XESCNUM	

oESC:=XESCNUM{SELF,"BD01.DBF"}
oESC:SHOW()	
IF Oesc:lok
   SELF:SERVER:FIELDPUT("NUMERO",oESC:NUMERO)
ENDIF	


CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("BCO",9)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"BF01.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
//SELF:USE(oSERVER)
SELF:SHOW()

METHOD pornum( ) 
	SELF:keyfind()

METHOD PostInit() 
SELF:RegisterTimer(300,FALSE)
 FabCenterWindow( SELF )
RETURN SELF

METHOD Timer() 
SELF:SERVER:COMMIT()


END CLASS
