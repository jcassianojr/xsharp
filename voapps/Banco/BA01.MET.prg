﻿CLASS XJBA01 INHERIT JBA01

METHOD ACHA() 
SELF:oSFJBBC01:SERVER:SETORDER(1)
SELF:oSFJBBC01:SERVER:GOTOP()
SELF:oSFJBBC01:SERVER:SEEK(SELF:SERVER:CODIGO,.T.)
SELF:SERVER:HISTORICO:=SELF:oSFJBBC01:SERVER:DESCRICAO
SELF:SERVER:ITEM:=SELF:oSFJBBC01:SERVER:ITEM
SELF:SERVER:TIPO:=SELF:oSFJBBC01:SERVER:TIPO

METHOD achadata() 
LOCAL dDATA AS DATE
dDATA:=CToD(oDCmDATA:TextValue)
SELF:SERVER:SETORDER(4)
SELF:SERVER:GoTop()
SELF:SERVER:SEEK(dDATA)
IF SELF:sERVER:EOF
	SELF:sERVER:GoTop()
ENDIF	
	

METHOD APPEND() 
SUPER:append()
SELF:SERVER:FIELDPUT("DATA",Today())
SELF:SERVER:FIELDPUT("DATADEP",Today())
SELF:SERVER:FIELDPUT("NRCONTA",1)
SELF:SERVER:FIELDPUT("TIPO","D")
SELF:oDCNUMERO:SetFocus()
GRAVALOG(Str(SELF:SERVER:NRCONTA,2)+Str(SELF:sERVER:NUMERO,8),"INC","BA01")	
RETURN .T.

METHOD BUSCA() 
SELF:oSFJBBC01:SERVER:SETORDER(2)
SELF:oSFJBBC01:SERVER:GOTOP()
SELF:oSFJBBC01:SERVER:SEEK(SELF:mBUSCA)

METHOD buscaov( ) 
	SELF:KeyFind()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()


METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("ZB","")	


METHOD cmdtipo( ) 
SELF:server:FIELDPUT("TIPO",SIMNAO(SELF:SERVER:FIELDGET("TIPO"),{"D","C"}))	


METHOD DELETE() 
GRAVALOG(Str(SELF:SERVER:NRCONTA,2)+Str(SELF:sERVER:NUMERO,8),"DEL","BA01")	
SUPER:DELETE()
RETURN .T.

METHOD ESCOLHA() 
SELF:SERVER:CODIGO:=SELF:oSFJBBC01:SERVER:CODIGO
SELF:SERVER:HISTORICO:=SELF:oSFJBBC01:SERVER:DESCRICAO
SELF:SERVER:ITEM:=SELF:oSFJBBC01:SERVER:ITEM
SELF:SERVER:TIPO:=SELF:oSFJBBC01:SERVER:TIPO

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER,oSERVE2 AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("BCO",1)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"BA01.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
aDAD:={zCURINI,"BC01.DBF",zCURDIR}
oSERVE2:=USEREDE{aDAD}
IF oSERVE2:nERRO#0
	oSERVER:Close() //Fecha Master
   RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
//SELF:USE(oSERVER)
SELF:OSFJBBC01:USE(oSERVE2)
SELF:OSFJBBC01:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()


METHOD LOCALIZA() 
SELF:SERVER:SETORDER(2)
SELF:SERVER:GOTOP()
SELF:SERVER:SEEK(Str(SELF:mNUMERO,8)+SELF:mSUB,.T.)
SELF:SERVER:SETORDER(1)

METHOD ORDCN() 
SELF:SERVER:SETORDER(1)

METHOD ORDdata() 
SELF:SERVER:SETORDER(4)

METHOD ORDNUM() 
SELF:SERVER:SETORDER(2)

METHOD PORCODIGO() 
SELF:oSFJBBC01:SERVER:SETORDER(1)
SELF:oSFJBBC01:SERVER:GOTOP()

METHOD PORDESCR() 
SELF:oSFJBBC01:SERVER:SETORDER(2)
SELF:oSFJBBC01:SERVER:GOTOP()

METHOD porov( ) 
	SELF:KeyFind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()
   SELF:OSFJBBC01:SERVER:COMMIT()




END CLASS
