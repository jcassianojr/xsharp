﻿PARTIAL CLASS JPAEE
METHOD APPEND() 
LOCAL nPAEE AS DWORD
SELF:server:setorder(1)
SELF:server:gobottom()
nPAEE:=SELF:Server:PAEE
nPAEE++
SUPER:append()
SELF:SERVER:FIELDPUT("PAEE",nPAEE)
SELF:SERVER:FIELDPUT("DATA",Today())
RETURN

METHOD buscanum( ) 
	SELF:KeyFind()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("CP","PAE")	


METHOD DELETE() 
IF MDG("Apagar Registro") .AND. SELF:SERVER:LOCKcurrentrecord()
	SELF:server:delete()
	SELF:server:unlock()
	SELF:server:skipEX(-1)	
ENDIF	



METHOD esccod( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF oesc:lok
    SELF:SERVER:FIELDPUT("CODIGO",oESC:CODIGO)
//    SELF:SERVER:FIELDPUT("DESCRI",oESC:NOME)
ENDIF		

METHOD escfor 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"MA01.DBF"}
oESC:SHOW()	
IF Oesc:lok
    SELF:SERVER:FIELDPUT("CLIENTE",oESC:NUMERO)
ENDIF

METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:SERVER:FIELDGET("CODIGO"))," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETU
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG"}
OFOTOVIEW:SHOW()
	

METHOD porov( ) 
	SELF:KeyFind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()




END CLASS
