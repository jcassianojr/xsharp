CLASS VIASHELL INHERIT StandardShellWindow

METHOD acumulabs5() 
LOCAL oORI,oDES AS USEREDE
LOCAL oPROGWIN AS PROGWIN
LOCAL nLASTREC,NPOs,nQTDE AS DWORD
LOCAL nMES,nANO  AS WORD
LOCAL nPERC AS INT
LOCAL cCODIGO AS STRING
LOCAL aDAD AS ARRAY

IF ! entramenu("VIA",12)
	RETU SELF
ENDIF	

IF ! MDG("Importar media Producao")
   RETU SELF	
ENDIF	

oProgWin := ProgWin{}
oProgWin:Caption:="Importar media de producao"
oProgWin:SHOW()
nPOS:=1


aDAD:={zCURINI,"BS5.DBF",zCURDIR}
oORI:=USEREDE{aDAD}
IF oORI:nERRO#0
   RETU SELF
ENDIF


aDAD:={zCURINI,"CDAPUPRD.DBF",zCURDIR}
oDES:=USEREDE{aDAD}
IF oDES:nERRO#0
   RETU SELF
ENDIF


oDES:SETORDER(2) //STR(ANO,4)+CODIGO
SELF:POINTER:=POINTER{POINTERHOURGLASS}
nLASTREC:=OORI:RecCount
oORI:SETORDER(2) //CODIGO+STR(ANO,4)+STR(MES,2)
oORI:GOTOP()
WHILE ! oORI:EOF
   oProgWin:oDCMessage:textValue:=StrZero(oORI:FIELDGET("MES"),2)+"/"+StrZero(oORI:FIELDGET("ANO"),8)+"-"+oORI:FIELDGET("CODIGO")
   cCODIGO:=OORI:FIELDGET("CODIGO")
   nANO:=OORI:FIELDGET("ANO")
   nMES:=OORI:FIELDGET("MES")
   nQTDE:=0
   WHILE cCODIGO=OORI:FIELDGET("CODIGO") .AND. nANO=OORI:FIELDGET("ANO") .AND. NMES=OORI:FIELDGET("MES") .and. ! Oori:eof

      nPerc := INT(100* nPOS/ nLASTREC)
      nPOS++
      oProgWin:oDcProgBar:Position := nPerc

   	  nQTDE:=nQTDE+oORI:FIELDGET("QTDDE")
      oORI:SKIP()
   ENDDO
   oDES:GOTOP()
   IF ! oDES:SEEK(Str(NANO,4)+cCODIGO)
   	  ODES:Append()
   	  oDES:FIELDPUT("CODIGO",cCODIGO)
   	  oDES:FIELDPUT("ANO",nANO)
   	  oDES:FIELDPUT("MESESF",12)
  	  oDES:FIELDPUT("MESESP",12)
   ENDIF	
   oDES:FIELDPUT("MES"+StrZero(nMES,2),nQTDE)
ENDDO
oORI:CLOSE()
oDES:CLOSE()
Oprogwin:EndDialog()
SELF:POINTER:=POINTER{POINTERARROW}
alert("concluido")	

CONSTRUCTOR( oOwnerApp ) 
//	LOCAL oSB AS StatusBar
	LOCAL oSBIUSER AS StatusBarItem
        LOCAL oSBIDATE AS StatusBarItem	
        LOCAL cDATE AS STRING
	
	SUPER: INIT( oOwnerApp )
	
	aChildWindows := {}

	SetDeleted( .T. )
	
	//AltD()

        oSBIDate := StatusBarItem{}
	oSBIDate:Style := SBITEMSUNKEN
	cDate := Ddia(Today()) //+ //FullDate(Today())
	oSBIDate:Width := 8* Len(cDate)
	oSBIDate:NameSym := #SBDateItem
	
	oSBIUser := StatusBarItem{}
	oSBIUser:Style := SBITEMRAISED
	oSBIUser:Width := 8*(25) //8 N + "-" + Cognome(15) Len("ADMIN")
	oSBIUser:NameSym := #SBUser
	

	//oSB := SELF:EnableStatusBar()
	SELF:StatusBar:DisplayKeyboard() //
	SELF:StatusBar:DisplayTime()         //
        SELF:StatusBar:Additem (oSBIDATE)
        SELF:StatusBar:Additem (oSBIUser)
	SELF:statusBar:SetText (cDate, #SBDateItem)
	
//	SELF:statusBar:SetText (Str(ZFOLHA,8)+"-"+ZUSER, #SBUser)
// mudado startup para refresh var




	SELF:Menu := EmptyShellMenu{ SELF }

	SELF:Icon := Icon{ResourceID{IDI_STANDARDICON}}
	
	RETURN SELF



METHOD sayCOM() 
  LOCAL oJCOM AS JCOM
  oJCOM:=jCOM{SELF}
  OjCOM:show()		
  SELF:Caption:="Módulo Viabilidade - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		

METHOD XOSCD 	
LOCAL oOSCRT,oCD,oMA01,oMS01 AS USEREDE
LOCAL nCD,nCLIENTE,nREGTOT,nREGATU AS DWORD
LOCAL aDAD AS ARRAY
LOCAL aERRO AS ARRAY
LOCAL lERRO AS LOGIC
LOCAL cNOME,cCLINOME,cCOGNOME,cCODIGO,cCODIGOINT AS STRING
LOCAL oPROGWIN AS PROGWIN


IF ! entramenu("VIA",9)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"OSCRT.DBF",zCURDIR}
oOSCRT:=USEREDE{aDAD}
IF oOSCRT:nERRO#0
    RETU SELF
ENDIF
aDAD:={zCURINI,"CD.DBF",zCURDIR}
oCD:=USEREDE{aDAD}
IF oCD:nERRO#0
   oOSCRT:Close() //Fecha Master
   RETU SELF
ENDIF	

oMS01:=USEREDE{aDAD}
IF oMS01:nERRO#0
   oCD:CLOSE()
   oOSCRT:Close() //Fecha Master
   RETU SELF
ENDIF	


aDAD:={zCURINI,"MA01.DBF",zCURDIR}
oMA01:=USEREDE{aDAD}
IF oMA01:nERRO#0
   oCD:CLOSE()
   oMS01:CLOSE()
   oOSCRT:Close() //Fecha Master
   RETU SELF
ENDIF	

nREGTOT:=oOSCRT:RecCount
nREGATU:=0
oProgWin := ProgWin{}
oProgWin:Caption:="Checando Controle OS"
oProgWin:SHOW()

oOSCRT:GOTOP()
WHILE ! oOSCRT:EoF


	
   nCD:=oOSCRT:FIELDGET("OS")
   nCLIENTE:=oOSCRT:FIELDGET("CLIENTE")
   cCODIGO:=AllTrim(oOSCRT:FIELDGET("CODIGO"))
   cCODIGOINT:=oOSCRT:FIELDGET("CODIGOINT")

   nREGATU:= nREGATU + 1	
   oProgWin:oDcProgBar:Position := nREGATU*100/nREGTOT
   oPROGWIN:odcmessage:Caption:=PadR(Str(nCD,8)+" - "+cCODIGO+" "+Str(nREGATU,8)+"/"+Str(nREGTOT,8),60)


   lERRO:=.F.
   aERRO:={}
   AAdd(aERRO," Os  No:"+StrTRIM(nCD,8,0))
   IF Empty(nCLIENTE)
      AAdd(aERRO,"Nº Cliente em Branco:"+StrTRIM(nCLIENTE,8,0))
      lERRO:=.T.
   ENDIF
   IF Empty(cCODIGO)
      AAdd(aERRO,"Código Produto em Branco:"+cCODIGO)
      lERRO:=.T.
   ENDIF
   IF Empty(oOSCRT:FIELDGET("PEDIDOCLI"))
      AAdd(aERRO,"Nº Pedido Cliente em Branco"+oOSCRT:FIELDGET("PEDIDOCLI"))
      lERRO:=.T.
   ENDIF

   IF lERRO
      EMAILINT("CD000004",ZUSER,aERRO,ZCURINI,zCURDIR)	
   ENDIF


   //Zera Evitar Pegar nOME peça Anterior
   cCLINOME:=""
   cCOGNOME:=""
   cNOME:=""


   oMA01:GOTOP()
   IF oMA01:SEEK(nCLIENTE)
      cCLINOME:=oMA01:FIELDGET("NOME")
      cCOGNOME:=oMA01:FIELDGET("COGNOME")
   ENDIF
   oMS01:GOTOP()
   IF oMS01:SEEK(cCODIGO)
      cNOME:=oMS01:FIELDGET("NOME")
   ELSE
   	 IF ! Empty(cCODIGO)
        aERRO:={}
        AAdd(aERRO," Os  No:"+StrTRIM(nCD,8,0))
        AAdd(aERRO,"Codigo:"+cCODIGO)
        EMAILINT("CD000005",ZUSER,aERRO,ZCURINI,zCURDIR)	
     ENDIF
   ENDIF

   IF cREQUEROP="SIM"
	  oCD:SETORDER(1)
	  oCD:GOTOP()
	  IF ! oCD:SEEK(Str(NCD,8))
	  	 oCD:APPEND()
	     oCD:FIELDPUT("CD",nCD)
	     oCD:FIELDPUT("DATA",Today())
	     oCD:FIELDPUT("CHAVE",Str(NCD,8))
	     oCD:FIELDPUT("CLIENTE",nCLIENTE)
	     oCD:FIELDPUT("PECA",cCODIGO)
	     oCD:FIELDPUT("ATUAL",.T.)
	  ENDIF	
   ELSE	
   	  oCD:SETORDER(4)
   	  oCD:GOTOP()
 	  IF ! oCD:SEEK(Str(nCLIENTE,8)+cCODIGO)
 	  	  oCD:SETORDER(1)
 	  	  oCD:GOBOTTOM()
 	  	  nCD:=OCD:FIELDGET("CD")
 	  	  nCD++
	   	  oCD:APPEND()
		  oCD:FIELDPUT("CD",nCD)
	      oCD:FIELDPUT("DATA",Today())
	      oCD:FIELDPUT("CHAVE",Str(NCD,8))
	      oCD:FIELDPUT("CLIENTE",nCLIENTE)
	      oCD:FIELDPUT("PECA",cCODIGO)
	      oCD:FIELDPUT("ATUAL",.T.)
	  ENDIF
   ENDIF
   IF Empty(oCD:FIELDGET("CLIENTE"))
      oCD:FIELDPUT("CLIENTE",nCLIENTE)
   ENDIF
   IF ! Empty(cCLINOME) .AND. Empty(oCD:FIELDGET("CLINOME"))
      oCD:FIELDPUT("CLINOME",cCLINOME)
   ENDIF
   IF ! Empty(cCOGNOME) .AND. Empty(oCD:FIELDGET("CLICOGN"))
      oCD:FIELDPUT("CLICOGN",cCOGNOME)
   ENDIF
   IF Empty(oCD:FIELDGET("PECA"))
      oCD:FIELDPUT("PECA",cCODIGO)
   ENDIF
   IF ! Empty(cCODIGOINT) .AND. Empty(oCD:FIELDGET("CODIGOINT"))
      oCD:FIELDPUT("CODIGOINT",cCODIGOINT)
   ENDIF	
   IF ! Empty(cnoME) .AND. Empty(oCD:FIELDGET("NOME"))
      oCD:FIELDPUT("NOME",cNOME)
   ENDIF	
   //Grava OScrt
   IF ! Empty(cnoME) .AND. Empty(oOSCRT:FIELDGET("NOME"))
      oOSCRT:FIELDPUT("NOME",cNOME)
   ENDIF	
   IF ! Empty(cCLINOME) .AND. Empty(ooscrt:FIELDGET("CLINOME"))
      ooscrt:FIELDPUT("CLINOME",cCLINOME)
   ENDIF
   oOSCRT:skip()
ENDDO
oMA01:CLOSE()
oMS01:CLOSE()
oOSCRT:CLOSE()
oCD:CLOSE()	
oPROGWIN:EndDialog()
alert("Checagem Concluida")












METHOD xwrpriLXOC 
SELF:XWRPTIGRP("LXOC","")	



METHOD XWRPTBREA 
SELF:XWRPTGRP("V1","BREA")	

METHOD XWRPTCOND 
SELF:XWRPTGRP("V1","COND")	

METHOD XWRPTCUS 
SELF:XWRPTGRP("CU","")	

METHOD XWRPTMA 
SELF:XWRPTGRP("MA","")	

METHOD XWRPTMC 
SELF:XWRPTGRP("MC","COMP")	


METHOD XWRPTMOCOS 
SELF:XWRPTGRP("MOC","OSCR")	

METHOD XWRPTMPAR 
SELF:XWRPTGRP("MP","AREA")	

METHOD XWRPTORCA 
SELF:XWRPTGRP("V1","ORCA")	


METHOD XWRPTOSFE 
SELF:XWRPTGRP("ME","NF")	

METHOD XWRPTPED 
SELF:XWRPTGRP("V1","PED")	

METHOD XWRPTPRO 
SELF:XWRPTGRP("V1","PRO")	


METHOD XWRPTVIA 
SELF:XWRPTGRP("V1","VIA")	



END CLASS
