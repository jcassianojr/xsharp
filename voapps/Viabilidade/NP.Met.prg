CLASS XJNP INHERIT JNP	

METHOD APPEND() 
LOCAL nNP AS DWORD
SELF:server:setorder(1)
SELF:server:gobottom()
nNP:=SELF:Server:NP
nNP++
SUPER:append()
SELF:SERVER:FIELDPUT(#NP,nNP)
SELF:SERVER:FIELDPUT(#PRAZO,ZDATA)
GRAVALOG(SELF:SERVER:NP,"INC","NP")	
RETURN     .T.

METHOD buscaov( ) 
	SELF:KeyFind()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("V1","PED")	


METHOD DELETE() 
SUPER:DELETE()
GRAVALOG(SELF:SERVER:NP,"DEL","NP")	
RETURN .T.

METHOD ESCCOD( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF OesC:lok
    SELF:SERVER:FIELDPUT("CODIGO",oESC:CODIGO)
    SELF:SERVER:FIELDPUT("NOME",oESC:NOME)
ENDIF				

METHOD escfor( ) 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"MA01.DBF"}
oESC:SHOW()	
IF Oesc:lok
    SELF:SERVER:FIELDPUT("CLIENTE",oESC:NUMERO)
    SELF:SERVER:FIELDPUT("CLINOME",oESC:NOME)
ENDIF

METHOD escmc02( ) 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"MC02.DBF"}
oESC:SHOW()	
IF Oesc:lok
    SELF:SERVER:FIELDPUT("COMPRADOR",oESC:NUMERO)
    SELF:SERVER:FIELDPUT("COMPNOME",oESC:NOME)
ENDIF		

METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:SERVER:FIELDGET("CODIGO"))," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETURN .F.
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG",cCODIGO}
OFOTOVIEW:SHOW()
	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! ENTRAMENU("VIA",6)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"NP.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	

METHOD btnPEGMA01( ) 
LOCAL aCLI AS ARRAY
aCLI:=PEGMA01(SELF:SERVER:CLIENTE,ZCURINI,ZCURDIR)
IF aCLI[1]=.T.
   SELF:SERVER:CLINOME:=aCLI[2]
   IF ! Empty(aCLI[3]) .AND. Empty(SELF:SERVER:COMPRADOR)
      SELF:SERVER:COMPRADOR:=aCLI[3]
      SELF:PEGMC02()
   ENDIF
ENDIF

METHOD PEGMC02( ) 
LOCAL aCLI AS ARRAY
aCLI:=PEGMC(SELF:SERVER:COMPRADOR,"MC02.DBF")
IF aCLI[1]=.T.
   SELF:SERVER:COMPNOME:=aCLI[2]
ENDIF		
	

METHOD btnPEGMS01( ) 
LOCAL aPRO AS ARRAY
aPRO:=PEGMS01(SELF:SERVER:CODIGO)
IF aPRO[1]=.T. .AND. !Empty(aPRO[2])
   SELF:SERVER:NOME:=aPRO[2]
ENDIF

METHOD porov( ) 
	SELF:KeyFind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   	   FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
