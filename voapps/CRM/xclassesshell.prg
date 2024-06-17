CLASS crmshell INHERIT StandardShellWindow

METHOD AJURASTRO 	
IF ! entramenu("CRM",20)
	RETU SELF
ENDIF	
SELF:FIXRASTRO("CRM.DBF")
SELF:FIXRASTRO("RIRM.DBF")
SELF:FIXRASTRO("RIST.DBF")

METHOD CHECKAR 
LOCAL aDAD AS ARRAY
LOCAL oDES,oORI,oMA01,oMB01 AS USEREDE
LOCAL oPROGWIN AS PROGWIN
LOCAL nLASTREC,nPOS,nFORN AS DWORD
LOCAL nPERC AS INT
LOCAL X,Y AS WORD
LOCAL cSQL,eCHAVE,cTIPOFOR,cCGC,cCOGNOME,cCODIGO,cUNID AS STRING
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL lGRAVA AS LOGIC
LOCAL nQTDE
LOCAL dINI AS DATE
LOCAL oSTMT AS SQLStatement


aDAD:={zCURINI,"CRMAR.DBF",zCURDIR}
oDES:=USEREDE{aDAD}
IF oDES:nERRO#0
    RETU SELF
ENDIF


 aDAD:={zCURINI,"MB01.DBF",zCURDIR,aDIR}
    oMB01:=USEREDE{aDAD}
    IF oMB01:nERRO#0
       oDES:CLOSE()
       RETU SELF
    ENDIF
    oMB01:SETORDER(3) //CGC


    aDAD:={zCURINI,"MA01.DBF",zCURDIR,aDIR}
    oMA01:=USEREDE{aDAD}
    IF oMA01:nERRO#0
       oDES:CLOSE()
       oMB01:CLOSE()
       RETU SELF
    ENDIF
    oMA01:SETORDER(4) //CGC



CSQL:=" SELECT aviso_rec.*, "
CSQL+=" nf_sup.num_nf, nf_sup.cod_fornecedor, nf_sup.dat_emis_nf "
CSQL+=" FROM "
CSQL+=" aviso_rec INNER JOIN nf_sup ON aviso_rec.num_aviso_rec = nf_sup.num_aviso_rec"
cSQL+=" where ies_controle_lote='S'"



oConn := SQLConnection{}
IF ! oConn:connect("ol_logix","","")
   alert("Erro na Conecção")
   RETU
ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()
nPOS:=1
nLASTREC:=100

SELF:POINTER:=POINTER{POINTERHOURGLASS}
oreg:= SQLSelect{cSQL,oconn}
WHILE ! oREG:EOF
      nPerc := INT(100* nPOS/100)
      nPOS++
      IF nPOS=101
      	 nPOS:=1
      ENDIF

      eCHAVE:=oREG:FIELDGET("cod_empresa")+Str(oREG:FIELDGET("num_aviso_rec"),8)+Str(oREG:FIELDGET("num_seq"),2)
      oDES:GOTOP()
      IF ! oDES:SEEK(eCHAVE)
      	 cTIPOFOR:=""
   	     cCGC:=oREG:FIELDGET("Cod_fornecedor")
         cCGC:=SubStr(CCGC,2)
         IF Left(cCGC,3)="000" //CPF
            cCGC:= SubStr(cCGC,4,3)+"."+SubStr(cCGC,7,3)+"."+SubStr(cCGC,10,3)+"-"+SubStr(cCGC,13,2)
         ELSE
            cCGC:=Left(cCGC,2)+"."+SubStr(cCGC,3,3)+"."+SubStr(cCGC,6,3)+"/"+SubStr(cCGC,9,4)+"-"+SubStr(cCGC,13,2)
         ENDIF
         nFORN:=0
         cCOGNOME:=cCGC
         oMB01:GOTOP()
         IF oMB01:SEEK(cCGC)
            nFORN:=oMB01:FIELDGET("NUMERO")
            cCOGNOME:=oMB01:FIELDGET("COGNOME")
            cTIPOFOR:="F"
        ELSE
           oMA01:GOTOP()
           IF oMA01:SEEK(cCGC)
              nFORN:=oMB01:FIELDGET("NUMERO")
              cCOGNOME:=oMB01:FIELDGET("COGNOME")
              cTIPOFOR:="C"
           ENDIF
        ENDIF	
        lGRAVA:=.T.
        cCODIGO:=oREG:FIELDGET("COD_ITEM")
        IF SubStr(cCODIGO,1,3)="99."
           lGRAVA:=.F.
        ENDIF	
        IF SubStr(cCODIGO,1,3)="EMB"
           lGRAVA:=.F.
        ENDIF	
        cUNID:=OREG:FIELDGET("cod_unid_med_nf")
        nQTDE:=oreg:FIELDGET("qtd_declarad_nf")
        IF Cunid="T"
           cUNID:="KG"
          nQTDE:=nQTDE*1000
        ENDIF	
        IF Cunid="ML"
           cUNID:="PC"
           nQTDE:=nQTDE*1000
        ENDIF	
        IF Cunid="CT"
           cUNID:="PC"
           nQTDE:=nQTDE*100
        ENDIF	



        IF lGRAVA
	      	 oDES:APPEND()
	         oDES:FIELDPUT("CODIGO",cCODIGO)
             oDES:FIELDPUT("CODIGOINT",cCODIGO)	
	         oDES:FIELDPUT("UNIDADE",cUNID)
	         oDES:FIELDPUT("DATA",oREG:FIELDGET("dat_emis_nf"))
	         oDES:FIELDPUT("NRNOTA",oREG:FIELDGET("num_nf"))
	         oDES:FIELDPUT("QTDE",nQTDE)
	         oDES:FIELDPUT("TIPOCLI",cTIPOFOR)
	         oDES:FIELDPUT("FORNECEDO",nFORN)
	         oDES:FIELDPUT("COGNOME",cCOGNOME)
	         oDES:FIELDPUT("AR",oREG:FIELDGET("NUM_AVISO_REC"))
	         oDES:FIELDPUT("ITEM",oREG:FIELDGET("NUM_SEQ"))
	         oDES:FIELDPUT("CODFORN",cCGC)
	         oDES:FIELDPUT("EMPRESA",oREG:FIELDGET("cod_empresa"))
         ENDIF
      ENDIF	

      oProgWin:oDcProgBar:Position := nPerc
      oProgWin:oDCMessage:textValue:=eCHAVE
      oREG:SKIP()
ENDDO
oREG:CLOSE()
oCONN:Disconnect()


oDES:SETORDER(3) //CODIGO Interno
FOR X:=1 TO 2
    aDAD:={zCURINI,IF(X=1,"MU01","MT01")+".DBF",zCURDIR,aDIR}
    oORI:=USEREDE{aDAD}
    IF oORI:nERRO=0
       nPOS:=1
       nLASTREC:=oDES:LastRec
       oDES:GOTOP()
       WHILE ! oDES:EOF
       	  cCODIGO:=oDES:FIELDGET("CODIGOINT")
       	  cCOGNOME:=""
       	  oORI:GOTOP()
       	  lGRAVA:=oORI:SEEK(cCODIGO)
       	  IF lGRAVA
             cCOGNOME:=oORI:FIELDGET("NOME")+" "+oORI:FIELDGET("NOM2")
          ENDIF
       	  WHILE cCODIGO=oDES:FIELDGET("CODIGOINT") .AND. ! oDES:EOF
      	  	  nPerc := INT(100* nPOS/nLASTREC)
              nPOS++
              oProgWin:oDcProgBar:Position := nPerc
              oProgWin:oDCMessage:textValue:=cCODIGO
       	  	  IF lGRAVA
       	  	  	 oDES:FIELDPUT("TIPOENT",IF(X=1,"M","C"))
                 oDES:FIELDPUT("NOME",cCOGNOME)
       	  	  ENDIF
              oDES:SKIP()
          ENDDO
       ENDDO
       oORI:CLOSE()	
    ENDIF
NEXT X	

dINI:=CToD("01/05/2006")  //inicio logix
oDES:SETORDER(2) //nota fornecedor codigo
FOR Y:=1 TO 3
	DO CASE
	   CASE Y=1
	   	    cSQL:="CRM"
	   CASE Y=2
	   	    cSQL:="RIRM"	
	   CASE Y=3	
	   	    cSQL:="RIST"	
    ENDCASE
   aDAD:={zCURINI,cSQL+".DBF",zCURDIR,aDIR}
   oORI:=USEREDE{aDAD}
   IF oORI:nERRO=0
      nPOS:=1
      nLASTREC:=oORI:LastRec
      DO CASE
         CASE Y=1
         	  oORI:SETORDER(2) //data
         CASE Y=2
       	      oORI:SETORDER(5) //data
    	 CASE Y=3	
              oORI:SETORDER(5) //data
      ENDCASE
      oORI:GOTOP()
      oORI:SEEK(dINI)
      WHILE ! oORI:EOF
   	     nPerc := INT(100* nPOS/nLASTREC)
         nPOS++
         oProgWin:oDcProgBar:Position := nPerc
         FOR X:=1 TO 2
         	lGRAVA:=.T.
         	DO CASE
         	   CASE Y=1
      	            IF X=1
                       eCHAVE:=Str(oORI:FIELDGET("NRNOTA"),8)+Str(oORI:FIELDGET("CLIFOR"),8)+oORI:FIELDGET("CBUSCA")
                    ELSE
                       eCHAVE:=Str(oORI:FIELDGET("NRNOTB"),8)+Str(oORI:FIELDGET("CLIFOR"),8)+oORI:FIELDGET("CBUSCA")
                       IF oORI:FIELDGET("NRNOTB")=0
                       	  lGRAVA:=.F.
                       ENDIF
                    ENDIF
         	   CASE Y=2
      	            IF X=1
                       eCHAVE:=Str(oORI:FIELDGET("NRNOTA"),8)+Str(oORI:FIELDGET("NFORN"),8)+oORI:FIELDGET("DESENHO")
                    ELSE
                       eCHAVE:=Str(oORI:FIELDGET("NRNOTB"),8)+Str(oORI:FIELDGET("NFORN"),8)+oORI:FIELDGET("DESENHO")
                       IF oORI:FIELDGET("NRNOTB")=0
                      	  lGRAVA:=.F.
                       ENDIF
                    ENDIF
         	   CASE Y=3	
      	            IF X=1
                       eCHAVE:=Str(oORI:FIELDGET("NF"),8)+Str(oORI:FIELDGET("NFORN"),8)+oORI:FIELDGET("CODIGO")
                    ELSE
                       eCHAVE:=Str(oORI:FIELDGET("NFB"),8)+Str(oORI:FIELDGET("NFORN"),8)+oORI:FIELDGET("CODIGO")
                       IF oORI:FIELDGET("NFB")=0
                       	  lGRAVA:=.F.
                       ENDIF
                    ENDIF
            ENDCASE

            oProgWin:oDCMessage:textValue:=eCHAVE
            IF lGRAVA
               oDES:GOTOP()
               IF oDES:SEEK(eCHAVE)
                  oDES:FIELDPUT("CRM",oORI:FIELDGET("CRM"))
                  IF Y=1 .OR. Y=2
        	         oDES:FIELDPUT("RIRM",oORI:FIELDGET("RIRM"))
        	      ENDIF
                  IF Y=1 .OR. Y=3
        	         oDES:FIELDPUT("RIST",oORI:FIELDGET("RIST"))
        	     ENDIF
               ENDIF
            ENDIF
         NEXT X
         oORI:Skip()
     ENDDO
     oORI:CLOSE()	
   ENDIF
NEXT Y




oDES:CLOSE()
Oprogwin:EndDialog()
SELF:POINTER:=POINTER{POINTERARROW}
alert("concluido")

METHOD FIXRASTRO(cARQ)	
LOCAL aDAD,aRETU AS ARRAY
LOCAL oSERVER AS USEREDE
IF ! entramenu(cARQ,1)
	RETU .F.
ENDIF	
SELF:POINTER:=POINTER{POINTERHOURGLASS}	
aDAD:={zCURINI,cARQ,zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO=0
   RETU .F.
ENDIF
oSERVER:GOTOP()
WHILE ! oSERVER:EOF
    aRETU:=CHECKRASTRO(oSERVER:FIELDGET("RASTRO"))	
    IF aRETU[1]
       oSERVER:FIELDPUT("RASTRO",aRETU[2])
    ENDIF	
	oSERVER:SKIP()
ENDDO
oSERVER:CLOSE()
SELF:POINTER:=POINTER{}
alert("Ajuste Rastro "+Carq+" Concluido")	
RETURN .T.	

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
	
//
//	oSB := SELF:EnableStatusBar()
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
  SELF:Caption:="Módulo CRM - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		

METHOD XIMPCREX 
SELF:XWRPTGRP("CRM","CREX")	


METHOD XIMPCRM 
SELF:XWRPTGRP("CRM","CRM")	



METHOD XIMPEST 
SELF:XWRPTGRP("CRM","EST")	

METHOD XIMPPEMW 
SELF:XWRPTGRP("CRM","PEMW")	

METHOD XIMPQEK() 
LOCAL oPROGWIN AS PROGWIN	
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL cSQL,eCHAVE AS STRING
LOCAL oDES AS USEREDE
LOCAL nPOS AS DWORD //nLASTREC,
LOCAL nPERC AS INT
LOCAL aDAD AS ARRAY


	
aDAD:={zCURINI,"CRMAR.DBF",zCURDIR}
oDES:=USEREDE{aDAD}
IF oDES:nERRO#0
    RETU SELF
ENDIF

nPOS:=1
//nLASTREC:=100


oConn := SQLConnection{}
IF ! oConn:connect("protheus","","")
   alert("Erro Coneccao")	
   oDES:CLOSE()
ENDIF

SELF:POINTER:=POINTER{POINTERHOURGLASS}
oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()

CSQL:=" SELECT * FROM qek010 "
//nLASTREC:=100
nPOS:=1
oreg:= SQLSelect{cSQL,oconn}
WHILE ! OREG:EoF	
	nPerc := INT(100* nPOS/100)
    nPOS++
    IF nPOS=101
       nPOS:=1
    ENDIF

   eCHAVE:=oREG:FIELDGET("qek_filial")+Str(Val(oREG:FIELDGET("qek_zzar")),8)+Str(INT(oREG:FIELDGET("qek_zzseq")),2)

//   AltD()

   oDES:GOTOP()
   IF oDES:SEEK(eCHAVE)
      oDES:FIELDPUT("MC",oREG:FIELDGET("r_e_c_n_o_"))
   ENDIF

   oProgWin:oDcProgBar:Position := nPerc
   oProgWin:oDCMessage:textValue:=eCHAVE

   oREG:Skip()
ENDDO
Oreg:close()
Oconn:Disconnect()

oDES:CLOSE()
Oprogwin:EndDialog()
SELF:POINTER:=POINTER{POINTERARROW}
alert("concluido")	
	

METHOD XIMPRAST 
SELF:XWRPTGRP("CRM","RAST")	

METHOD XIMPRIRM 
SELF:XWRPTGRP("CRM","RIRM")	


METHOD XIMPRIST 
SELF:XWRPTGRP("CRM","RIST")	

METHOD XIMPSS 
SELF:XWRPTGRP("CRM","SS")	

METHOD XJIMPAR( ) 
LOCAL oConn AS SQLConnection
LOCAL oBUSCA AS buscadata
    LOCAL oREG AS SQLSelect
    LOCAL cSQL AS STRING
    LOCAL aDAD AS ARRAY
    LOCAL oSERVER,oMU01 AS USEREDE
    LOCAL oMB01,oMA01 AS USEMANA5
    LOCAL dataini AS DATE
    LOCAL mCHAVE
  //  LOCAL cMIG AS STRING
    LOCAL cCGC AS STRING
    LOCAL nFORN AS DWORD
    LOCAL nNUMERO AS DWORD
    LOCAL cCOGNOME AS STRING
    LOCAL nLASTREC AS DWORD
    LOCAL nPOS AS DWORD
    LOCAL nPERC AS INT
    LOCAL cTIPOFOR AS STRING
    LOCAL cRASTRO AS STRING
    LOCAL cCODIGO AS STRING
    LOCAL cCLASSIPI AS STRING
    LOCAL cUNID AS STRING
    LOCAL nQTDE AS FLOAT
    LOCAL lGRAVA AS LOGIC
    LOCAL oPROGWIN AS PROGWIN
    LOCAL oStmt AS SQLStatement

IF ! entramenu("CRM",26)
	RETU SELF
ENDIF	

oBUSCA:=buscadata{SELF}
OBUSCA:SHOW()
IF ! oBUSCA:lOK
   RETU SELF
ENDIF	
dATAINI:=CToD(oBUSCA:cBUSCA)


   //cMIG:=PEGEMPMIG(zempRESA)



    aDAD:={zCURINI,"CRMEST.DBF",zCURDIR}
    oSERVER:=USEREDE{aDAD}
    IF oSERVER:nERRO#0
       RETU SELF
    ENDIF
    oSERVER:SETORDER(5) //Nº OS


    aDAD:={zCURINI,"MB01",zCURDIR,aDIR}
    oMB01:=USEMANA5{aDAD}
    IF oMB01:nERRO#0
       oSERVER:CLOSE()
       RETU SELF
    ENDIF
    oMB01:SETORDER(3) //CGC


    aDAD:={zCURINI,"MA01",zCURDIR,aDIR}
    oMA01:=USEMANA5{aDAD}
    IF oMA01:nERRO#0
       oSERVER:CLOSE()
       oMB01:CLOSE()
       RETU SELF
    ENDIF
    oMA01:SETORDER(4) //CGC


    aDAD:={zCURINI,"MU01.DBF",zCURDIR}
    oMU01:=USEREDE{aDAD}
    IF oMU01:nERRO#0
	   oSERVER:CLOSE()
       oMB01:CLOSE()
       oMA01:CLOSE()
       RETU SELF
    ENDIF





   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
   	  RETU
   ENDIF	


cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()
nPOS:=1

  CSQL:=" SELECT aviso_rec.*, "
  CSQL+=" nf_sup.num_nf, nf_sup.cod_fornecedor "
  CSQL+=" FROM "
  CSQL+=" aviso_rec INNER JOIN nf_sup ON aviso_rec.num_aviso_rec = nf_sup.num_aviso_rec"


   csql+=" where  dat_inclusao_seq>='" +DToC(dataini) +"'"
   CSQL+=" AND gru_ctr_desp_item=100"

//' por enquanto todas AS empresa
//'   cSQL+=" AND COD_EMPRESA='" +CMIG+ "'"


   oreg:= SQLSelect{cSQL,oconn}



    nPOS:=0
    nLASTREC:=100


   WHILE ! OREG:EoF	
   	  nPerc := INT(100* nPOS/ nLASTREC)
  	  nPOS++
  	  IF nPOS=101
  	     nPOS:=0
  	  ENDIF
  	  cTIPOFOR:=""
   	  cCGC:=oREG:FIELDGET("Cod_fornecedor")
      cCGC:=SubStr(CCGC,2)

      oProgWin:oDcProgBar:Position := nPerc
      oProgWin:oDCMessage:textValue:=cCGC


      IF Left(cCGC,3)="000" //CPF
         cCGC:= SubStr(cCGC,4,3)+"."+SubStr(cCGC,7,3)+"."+SubStr(cCGC,10,3)+"-"+SubStr(cCGC,13,2)
      ELSE
         cCGC:=Left(cCGC,2)+"."+SubStr(cCGC,3,3)+"."+SubStr(cCGC,6,3)+"/"+SubStr(cCGC,9,4)+"-"+SubStr(cCGC,13,2)
      ENDIF
      nFORN:=0
      cCOGNOME:=cCGC
      oMB01:GOTOP()
      IF oMB01:SEEK(cCGC)
         nFORN:=oMB01:FIELDGET("NUMERO")
         cCOGNOME:=oMB01:FIELDGET("COGNOME")
         cTIPOFOR:="F"
      ELSE
        oMA01:GOTOP()
        IF oMA01:SEEK(cCGC)
           nFORN:=oMB01:FIELDGET("NUMERO")
           cCOGNOME:=oMB01:FIELDGET("COGNOME")
           cTIPOFOR:="C"
        ENDIF
      ENDIF	
      nNUMERO:=oREG:FIELDGET("num_nf")
      cCODIGO:=OREG:FIELDGET("cod_item")
      mCHAVE:=OREG:FIELDGET("num_aviso_rec")+(OREG:FIELDGET("num_seq")/100)
      oSERVER:GOTOP()
      IF .NOT. oSERVER:SEEK(mCHAVE)
          cRASTRO:=CRIARASTRO("AR",OREG:FIELDGET("num_aviso_rec"),Year(DATAINI),OREG:FIELDGET("num_seq"))
          cUNID:=OREG:FIELDGET("cod_unid_med_nf")
          nQTDE:=oreg:FIELDGET("qtd_recebida")
          IF Cunid="T"
          	 cUNID:="KG"
          	 nQTDE:=nQTDE*1000
          ENDIF	
          IF Cunid="ML"
          	 cUNID:="PC"
          	 nQTDE:=nQTDE*1000
          ENDIF	
          IF Cunid="CT"
          	 cUNID:="PC"
          	 nQTDE:=nQTDE*100
          ENDIF	
          AltD()
          lGRAVA:=.T.
          IF nQTDE<=0
             lGRAVA:=.F.
          ENDIF	
          IF SubStr(cCODIGO,1,3)="99."
             lGRAVA:=.F.
          ENDIF	
          IF SubStr(cCODIGO,1,3)="SOL"
             lGRAVA:=.F.
          ENDIF	
          IF SubStr(cCODIGO,1,3)="ABR"
             lGRAVA:=.F.
          ENDIF	
          IF SubStr(cCODIGO,1,3)="PF-"
             lGRAVA:=.F.
          ENDIF	

          IF lGRAVA
             oSERVER:APPEND()
      	     oSERVER:FIELDPUT("CODIGO",cCODIGO)
   	         oSERVER:FIELDPUT("UNIDADE",cUNID)
   	         oSERVER:FIELDPUT("TOTKGINI",nQTDE)
             oSERVER:FIELDPUT("TOTKGANT",nQTDE)
             oSERVER:FIELDPUT("TOTKGEST",NQTDE)
   	         oSERVER:FIELDPUT("NOME",OREG:FIELDGET("den_item"))
   	         oserver:FIELDPUT("NRNOTAINI",nNUMERO)
   	         oSERVER:FIELDPUT("DATAFAT",DATAINI)
   	         oSERVER:FIELDPUT("OSINI",MCHAVE)
             cCLASSIPI:=AllTrim(FIXSTR(oreg:FIELDGET("cod_cla_fisc")))
   	         oSERVER:FIELDPUT("TIPOCLI",CTIPOFOR)
   	         oSERVER:FIELDPUT("CLIENTE",nforn)
   	         oSERVER:FIELDPUT("COGNOME",cCOGNOME)
   	         oSERVER:FIELDPUT("TIPOENT","M")
   	         oSERVER:FIELDPUT("RASTRO",cRASTRO)
   	         oMU01:GOTOP()
   	         IF oMU01:SEEK(cCODIGO)
     	        oSERVER:FIELDPUT("OBS",oMU01:FIELDGET("APLICACAO"))
     	        IF Empty(cCLASSIPI)
     	     	   CCLASSIPI:=OMU01:FIELDGET("CLASSIPI")
     	        ENDIF	
             ENDIF
             oSERVER:FIELDPUT("CLASSIPI",cCLASSIPI)
          ENDIF
      ENDIF
   	  Oreg:skip()
   ENDDO	
   Oreg:close()
   Oconn:Disconnect()
   Oserver:CLOSE()
   oPROGWIN:EndDialog()
   alert("Concluido")
	


END CLASS
