PARTIAL CLASS JPROV
METHOD APPEND
LOCAL oJAN AS XDIAPAD
LOCAL nORI,nDES AS DWORD
LOCAL dINI,dFIM AS DATE
LOCAL cOBS AS STRING
LOCAL X

oJAN:=XDIAPAD{SELF,{"N� Provisorio","N� Efetivo","","OBS"},{.T.,.T.,.F.,.T.}}
oJAN:SHOW()	
IF ! OJAN:lOK
   RETURN .f.
ENDIF	
nORI:=Val(oJAN:VAL01)
nDES:=Val(oJAN:VAL02)
cOBS:=oJAN:VAL04
dINI:=OjAN:dINI
dFIM:=oJAN:dFIM
IF Empty(nORI) .OR. Empty(nDES)
   alert("N� Destino ou Origem N�o Preenchidos")
   RETURN .f.
ENDIF	
FOR x:= Dini TO Dfim
	SELF:SERVER:GOTOP()
	IF ! SELF:SERVER:SEEK(Str(nORI,8)+DToS(X))
	   SUPER:APPEND()
       SELF:SERVER:FIELDPUT("ORIGEM",nORI)
       SELF:SERVER:FIELDPUT("DESTINO",nDES)
       SELF:SERVER:FIELDPUT("NOME",cOBS)
       SELF:SERVER:FIELDPUT("DATA",X)	
    ENDIF		
NEXT X	


METHOD buscaNUM( ) 
	  SELF:KeyFind()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()


METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTFGRP("PTO","PROV")	


METHOD cmdordenar( ) 
	SELF:KeyFind()

METHOD delete 
IF ! MDG("Apagar Registro") .AND. SELF:SERVER:LockCurrentRecord()
	RETU SELF
ENDIF	
SELF:server:delete()
SELF:server:skip(-1)
IF SELF:sERVER:BOF
   SELF:SERVER:GOTOP()	
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
    SELF:SERVER:FIELDPUT("DESTINO",oESC:NUMERO)
ENDIF

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()


END CLASS
PARTIAL CLASS XJPROV
METHOD buscaNUM( ) 
LOCAL oBUSCA AS XBUSCA
oBUSCA:=XBUSCA{SELF,"Localizar ","Digite N� Cracha Provis�rio"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   SELF:SERVER:SETORDER(1)
   SELF:SERVER:GOTOP()
   SELF:SERVER:SEEK(Str(Val(oBUSCA:cBUSCA),8))
ENDIF	


END CLASS
