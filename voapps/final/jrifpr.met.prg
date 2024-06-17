CLASS XJRIFPR INHERIT JRIFPR

METHOD APPEND() 
	alert("Operaçao Bloqueada")
RETURN .f.

METHOD buscaov( ) 
	 SELF:keyfind()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()	

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("RIF","")


METHOD DELETE() 
	alert("Operaçao Bloqueada")
RETURN      .F.

METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:SERVER:FIELDGET("PRODUTO"))," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETURN  .F.
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG",cCODIGO}
OFOTOVIEW:SHOW()

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("FIN",8)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"RIFPR.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			


METHOD porov( ) 
	SELF:KEYFIND()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
       FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()


END CLASS
