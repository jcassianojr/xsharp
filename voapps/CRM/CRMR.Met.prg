﻿CLASS XJCRMR INHERIT JCRMR	

METHOD APPEND() 
LOCAL nRASTRO AS DWORD
LOCAL cRASTRO AS STRING
SELF:SERVER:GOBOTTOM()
nRASTRO:=SELF:SERVER:FIELDGET("RASTRON")
nRASTRO++
SUPER:Append()
SELF:SERVER:FIELDPUT("RASTRON",nRASTRO)
SELF:SERVER:FIELDPUT("RASTROA",Year(Today()))
cRASTRO:=AllTrim(Str(nRASTRO,8))+"/"+Str(SELF:Server:FIELDGET("RASTROA"),4)
SELF:SERVER:FIELDPUT("RASTRO",cRASTRO)
//ERRORBOX("Operaçao Cancelada")	

METHOD buscacrm( ) 
	SELF:KeyFind()
//LOCAL oBUSCA AS XBUSCA	
//oBUSCA:=XBUSCA{SELF,"Localizar","Digite Nº Rastro"}
//oBUSCA:lMES:=.T.
//oBUSCA:SHOW()
//IF oBUSCA:lOK
//   SELF:SERVER:SETORDER(1)
//   SELF:SERVER:GOTOP()
//   SELF:SERVER:SEEK(Val(oBUSCA:cBUSCA))
//ENDIF

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()


METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD cmdHoje( ) 
	SELF:server:FIELDPUT("DATAF",Today())

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("CRM","RAST")	

METHOD DELETE() 
alert("Operaçao Cancelada")	


METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:SERVER:FIELDGET("PRODUTO"))," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETU
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG"}
OFOTOVIEW:SHOW()
	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("CRM",11)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"CRMR.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
