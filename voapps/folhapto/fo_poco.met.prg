PARTIAL CLASS JFO_poco
METHOD APPEND 
LOCAL dUSO AS DATE
dUSO:=Today()	
dUSO--
SUPER:APPEND()
SELF:sERVER:FIELDPUT("OCOINI",dUSO)	
SELF:sERVER:FIELDPUT("OCOFIM",dUSO)	

METHOD buscaNUM( ) 
SELF:KeyFind()	


METHOD cmdALM( ) 
SELF:server:FIELDPUT("OCOALM",SIMNAO(SELF:SERVER:FIELDGET("OCOALM"),{"A","B","C","D","E"," "}))	

METHOD cmdBCO( ) 
SELF:server:FIELDPUT("OCOBCO",SIMNAO(SELF:SERVER:FIELDGET("OCOBCO")))	

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()


METHOD cmdEXT( ) 
SELF:server:FIELDPUT("OCOEXT",SIMNAO(SELF:SERVER:FIELDGET("OCOEXT")))	

METHOD cmdext1( ) 
		SELF:server:FIELDPUT("CESTA",SIMNAO(SELF:SERVER:FIELDGET("CESTA"),{"P","A","M","F","T","V","C","J"}))	

METHOD cmdext2( ) 
	SELF:server:FIELDPUT("ABONA",SIMNAO(SELF:SERVER:FIELDGET("ABONA"),{"S","N","P"}))	

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD cmdFOL( ) 
SELF:server:FIELDPUT("OCOFOL",SIMNAO(SELF:SERVER:FIELDGET("OCOFOL")))	

METHOD CMDimprimir( ) 
SELF:XWRPTFGRP("PTO","OCO")	


METHOD cmdordenar( ) 
	SELF:KeyFind()

METHOD cmdRED( ) 
SELF:server:FIELDPUT("OCORED",SIMNAO(SELF:SERVER:FIELDGET("OCORED")))	

METHOD delete 
IF ! MDG("Apagar Registro") .AND. SELF:SERVER:LockCurrentRecord()
	RETU SELF
ENDIF	
SELF:server:delete()
SELF:server:skip(-1)
IF SELF:sERVER:BOF
   SELF:SERVER:GOTOP()	
ENDIF		

METHOD ESCCOD( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"TABFALTA.DBF",SELF:SERVER:FIELDGET("OCOCOD")}
oESC:SHOW()	
IF Oesc:lok
   SELF:SERVER:FIELDPUT("OCOCOD",oESC:CODIGO)
ENDIF				

METHOD escFUN( ) 
LOCAL oESC AS XESCNUM	
//LOCAL aFORN AS ARRAY
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FO_PES"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
oESC:=XESCNUM{SELF,,1,oSERVER}
oESC:SHOW()	
IF Oesc:lok
    SELF:SERVER:FIELDPUT("NUMERO",oESC:NUMERO)
ENDIF

METHOD ESCSUB( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"TABFALTA.DBF",SELF:SERVER:FIELDGET("OCOSUB")}
oESC:SHOW()	
IF Oesc:lok
   SELF:SERVER:FIELDPUT("OCOSUB",oESC:CODIGO)
ENDIF				

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
 FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
