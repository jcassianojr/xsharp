﻿CLASS XJCRMFN INHERIT JCRMFN

METHOD APPEND() 
LOCAL nNUMERO AS DWORD
SELF:server:setorder(1)
SELF:server:gobottom()
nNUMERO:=SELF:Server:NUMERO
nNUMERO++
SUPER:append()
SELF:SERVER:FIELDPUT("NUMERO",nNUMERO)
SELF:SERVER:FIELDPUT("DATA",Today())
RETURN SELF

METHOD btnPEGMS01 
LOCAL aPRO AS ARRAY
aPRO:=PEGMS01(SELF:SERVER:FIELDGET("CODIGO"))
IF aPRO[1]=.T.
	SELF:SERVER:FIELDPUT("CLIENTE",aPRO[4])
	SELF:SERVER:FIELDPUT("PESOUNI",aPRO[6])	
	SELF:PEGMRMS()
ENDIF



METHOD buscar( ) 
	SELF:keyfind()

METHOD CALCEMB(lMES) 
LOCAL nCALC,nPCEMB,nQTDE
IF ValType(lMES)#"L"
	lMES:=.T.
ENDIF	
nPCEMB:=SELF:SERVER:FIELDGET("PCEMB")
nQTDE:=SELF:SERVER:FIELDGET("QTDEPC")
IF nPCEMB>0
   IF nQTDE>0
   	  nCALC:=INT(nQTDE/nPCEMB)
   	  IF nCALC=0
   	  	 nCALC:=1
   	  ENDIF	
   	  SELF:SERVER:FIELDPUT("PCEMBQ",nCALC)
   ELSE
      IF lMES
     	alert("Qtde Pecas Nao Preenchido")
      ENDIF
   ENDIF	
ELSE
   IF lMES
   	  alert("Qtde Pecas/Embalagem Nao Preenchido")
   ENDIF
ENDIF	

METHOD Calcpeca( ) 
LOCAL nCALC,nPESOUNI,nPESO
nPESOUNI:=SELF:server:FIELDGET("PESOUNI")
IF Empty(nPESOUNI)
   alert("Preco Unitario Nao Preenchido")
   RETU
ENDIF	
nPESO:=SELF:server:FIELDGET("QTDEKG")
IF Empty(nPESO)
   alert("Peso nao Preenchido")
   RETU
ENDIF	
nCALC:=INT(nPESO/nPESOUNI)
SELF:SERVER:FIELDPUT("QTDEPC",nCALC)

METHOD Calcpeso( ) 	
LOCAL nCALC,nPESOUNI,nQTDE
nPESOUNI:=SELF:server:FIELDGET("PESOUNI")
IF Empty(nPESOUNI)
   alert("Preco Unitario Nao Preenchido")
   RETU
ENDIF	
nQTDE:=SELF:server:FIELDGET("QTDEPC")
IF Empty(nQTDE)
   alert("Quantidade nao Preenchido")
   RETU
ENDIF	
nCALC:=FloatFormat(nQTDE*nPESOUNI,9,3)
SELF:SERVER:FIELDPUT("QTDEKG",nCALC)	


METHOD cmdcrm( ) 
		SELF:TIPCOD:=""

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()


METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD cmdgera( ) 
	IF (SELF:RASTRONUM)<1
	   alert("Nº Rastro nao Pode Ser em Branco")
	   RETU
	ENDIF
	SELF:SERVER:FIELDPUT("RASTRO",SELF:TIPCOD+StrZero(SELF:RASTRONUM,4)+"/"+StrZero(SELF:RASTROANO,4))

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("CRM","RAST")	

METHOD cmdmais2( ) 
SELF:oDCRASTROANO:TextValue:=Str(INCDEC(SELF:oDCRASTROANO:TextValue,1,1900,2100),4)						

METHOD cmdmenos2( ) 
SELF:oDCRASTROANO:TextValue:=Str(INCDEC(SELF:oDCRASTROANO:TextValue,-1,1900,2100),4)						

METHOD cmdmO( ) 
	SELF:TIPCOD:="MO"

METHOD cmdso( ) 
		SELF:TIPCOD:="SO"

METHOD cmdzera( ) 
		SELF:TIPCOD:=""
		SELF:RASTRONUM:=0
		SELF:SERVER:FIELDPUT("RASTRO","")

METHOD DELETE() 
IF  MDG("Apagar Registro") .AND. SELF:SERVER:LOCKcurrentrecord()
	SELF:server:delete()
	SELF:server:unlock()
	SELF:server:skip(-1)
ENDIF	

METHOD ESCCLI 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"MA01.DBF"}
oESC:SHOW()	
IF Oesc:LOK
    SELF:SERVER:FIELDPUT("CLIENTE",oESC:NUMERO)
ENDIF

METHOD ESCCOD( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF Oesc:lok
    SELF:SERVER:FIELDPUT("CODIGO",oESC:CODIGO)
    SELF:btnPEGMS01()
ENDIF



METHOD ESCFOR 
LOCAL oESC AS XESCNUM	
LOCAL aFORN AS ARRAY
oESC:=XESCNUM{SELF,"MB01.DBF"}
oESC:SHOW()	
IF Oesc:LOK
    SELF:SERVER:FIELDPUT("FORNECEDO",oESC:NUMERO)
    aFORN:=PEGMB01(SELF:SERVER:FORNECEDO,ZCURINI,ZCURDIR)
    IF aFORN[1]=.T.
       SELF:SERVER:FIELDPUT("COGNOME",aFORN[3])
    ENDIF
ENDIF

METHOD ESCMR( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MR01.DBF"}
oESC:SHOW()	
IF Oesc:lok
    SELF:SERVER:FIELDPUT("CODMR01",oESC:CODIGO)
    SELF:SERVER:FIELDPUT("NOMMR01",oESC:NOME)
//nome mr01
ENDIF

METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:server:FIELDGET("CODIGO"))," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto/Aplicacao Nao Preenchido")	
   RETU
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG"}
OFOTOVIEW:SHOW()

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("CRM",18)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"CRMFN.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	

METHOD pegfor( ) 
LOCAL aFORN AS ARRAY	
aFORN:=PEGMB01(SELF:SERVER:FORNECEDO,ZCURINI,ZCURDIR)
IF aFORN[1]=.T.
   SELF:SERVER:COGNOME:=aFORN[3]
ENDIF
	

METHOD PEGMR01() 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL cCODIGO AS STRING
cCODIGO:=AllTrim(SELF:SERVER:FIELDGET("CODMR01"))
aDAD:={zCURINI,"MR01.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
oSERVER:GOTOP()
IF oSERVER:SEEK(cCODIGO)
   SELF:SERVER:FIELDPUT("NOMMR01",oSERVER:FIELDGET("NOME"))
ENDIF	
oSERVER:CLOSE()

METHOD PEGMRMS() 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL cCODIGO AS STRING
cCODIGO:=AllTrim(SELF:SERVER:FIELDGET("CODIGO"))
aDAD:={zCURINI,"MRMS.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
oSERVER:GOTOP()
IF oSERVER:SEEK(cCODIGO)
   SELF:SERVER:FIELDPUT("CODMR01",oSERVER:FIELDGET("CODMR01"))
   SELF:SERVER:FIELDPUT("PCEMB",oSERVER:FIELDGET("PCEMB"))
   SELF:CALCEMB(.F.)
ENDIF	
oSERVER:CLOSE()
SELF:PEGMR01()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
    SELF:RASTROANO:=Year(Today())
    SELF:RegisterTimer(300,FALSE)
 FabCenterWindow( SELF )
	RETURN NIL


METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
