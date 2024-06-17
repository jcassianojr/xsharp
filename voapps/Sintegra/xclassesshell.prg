CLASS sinshell INHERIT StandardShellWindow

METHOD GRVESTINT(cARQ) 
LOCAL oJAN AS JMESANO
LOCAL oARQ AS USEREDE
LOCAL nMES,nANO   AS DWORD
LOCAL oPROGWIN AS PROGWIN
LOCAL cSQL,cCODIGO AS STRING
LOCAL aDAD AS ARRAY                         
LOCAL OConn AS SQLConnection
LOCAL OREG AS SQLSelect
LOCAL nSALDO AS FLOAT
LOCAL oSTMT AS SQLStatement

oJAN:=JMESANO{SELF}
oJAN:SHOW()
nMES:=OJAN:nmes
nANO:=oJAN:nano
//nEMP:=oJAN:nempresa

aDAD:={zCURINI,cARQ+".DBF",zCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:nERRO#0
   RETU SELF
ENDIF

oProgWin := ProgWin{}
oProgWin:Caption:="Estoque"
oProgWin:SHOW()
	
oPROGWIN:nTOTAL:=oARQ:RecCount
oPROGWIN:reset()
oARQ:GOTOP()
WHILE ! oARQ:EoF
   oPROGWIN:TITULO(oARQ:FIELDGET("CODIGO"),.T.)
   IF CARQ="OP01"
      oARQ:FIELDPUT("QSAI",0)	
   ELSE	
      oARQ:FIELDPUT("ESTQINI",0)	
      oARQ:FIELDPUT("ESTQENT",0)	
      oARQ:FIELDPUT("ESTQSAI",0)	
      oARQ:FIELDPUT("ESTQSAL",0)	
      oARQ:FIELDPUT("DATABALAN",Today())	
   ENDIF
   oARQ:Skip()
   oPROGWIN:SKIP(1)
ENDDO

oConn := SQLConnection{}
IF ! oConn:connect("ol_logix","","")
   alert("Erro na Conecção")
   RETURN .F.
ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

oPROGWIN:NTOTAL:=1000
oPROGWIN:RESET()


cSQL:=" SELECT * FROM estoque_hist"
cSQL+=" WHERE MES_REF=" + AllTrim(Str(NMES)) + " AND ANO_REF=" + AllTrim(Str(nANO))

oreg:= SQLSelect{cSQL,oconn}
WHILE ! oREG:EOF
    cCODIGO:=AllTrim(oREG:FIELDGET("cod_item"))
    oPROGWIN:TITULO(cCODIGO,.T.)
    IF  oPROGWIN:nPOSICAO=100
        oPROGWIN:RESET()
    ENDIF	
    oARQ:GOTOP()
    IF oARQ:SEEK(cCODIGO)
   	  nSALDO:=oREG:FIELDGET("qtd_mes_ant")+oREG:FIELDGET("qtd_entrada")-oREG:FIELDGET("qtd_saida")
   	  IF nSALDO>0
   	  	IF CARQ="OP01"
            oARQ:FIELDPUT("QSAI",nSALDO)	
        ELSE
           oARQ:FIELDPUT("ESTQINI",nSALDO)	
           oARQ:FIELDPUT("ESTQSAL",nSALDO)	
        ENDIF
   	  ENDIF
   ENDIF	
   oPROGWIN:SKIP(1)
   oREG:SKIP()
ENDDO	
OREG:CLOSE()
oCONN:Disconnect()
oARQ:CLOSE()

oPROGWIN:EndDialog()
	
	
	
	

METHOD IMPDBFUF(cARQ,nINDEX,lOK) 
LOCAL aDAD AS ARRAY
LOCAL oORI AS DBSERVER
LOCAL oDES AS USEREDE	
LOCAL cUF,cCNPJ,cIE AS STRING
LOCAL lOPEN,lAPAGA AS LOGIC
LOCAL oPROGWIN AS PROGWIN
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT  
LAPAGA:=.F.

IF ! File(Carq)
  alert("Arquivo nao encontrado"+CArq)
   RETU SELF
ENDIF	

IF GetFileNameFromPath(cARQ)="SINTPEND.DBF"
   lAPAGA:=MDG("Apagar Validadas")
ENDIF	

oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()
nPOS:=1

oORI:=DBSERVER{caRQ}
IF ! oORI:USED
   RETU SELF
ENDIF	


SELF:POINTER:=POINTER{POINTERHOURGLASS}
nLASTREC:=OORI:RecCount
IF nINDEX>0
   oORI:SETORDER(4)
ENDIF
oORI:GOTOP()
WHILE ! oORI:EOF
   cUF:=oORI:FIELDGET("UF")
   lOPEN:=.T.
   aDAD:={zCURINI,"CNPJIE"+cUF+".DBF",ZCURDIR} //sigla do estado
   oDES:=USEREDE{aDAD}
   IF oDES:nERRO#0
      lOPEN:=.F.
   ENDIF	
   WHILE cUF=oORI:FIELDGET("UF")  .AND. ! oORI:EOF
  	  cCNPJ:=TIRAOUT(oORI:FIELDGET("CNPJ"))
      nPerc := INT(100* nPOS/ nLASTREC)
      nPOS++
      oProgWin:oDcProgBar:Position := nPerc
      oProgWin:oDCMessage:textValue:=CUF+" "+Ccnpj
      IF lOK
   	     IF oORI:FIELDGET("CNPJOK")="S" .AND. oORI:FIELDGET("IEOK")="S"
            cIE:=TIRAOUT(oORI:FIELDGET("IE"))
            IF lOPEN
               oDES:GOTOP()
               IF ! ODES:SEEK(cCNPJ)
             	  oDES:Append()
            	  oDES:FIELDPUT("CNPJ",cCNPJ)
          	      oDES:FIELDPUT("IE",cIE)
          	      IF cUF="SC"
            	      oDES:FIELDPUT("SITUACAO","0")
            	      oDES:FIELDPUT("UF","SC")
          	      ENDIF	
          	      IF cUF="RS"
            	      oDES:FIELDPUT("UF","RS")
          	      ENDIF	
               ENDIF	
            ENDIF
            IF lAPAGA
               oORI:Delete()
            ENDIF
   	     ENDIF
	  ENDIF
      oORI:SKIP()
   ENDDO
   IF lOPEN
     oDES:CLOSE()
   ENDIF
ENDDO
oORI:CLOSE()
Oprogwin:EndDialog()
SELF:POINTER:=POINTER{POINTERARROW}
alert("concluido")

CONSTRUCTOR( oOwnerApp ) 
//	LOCAL oSB AS StatusBar
	LOCAL oSBIUSER AS StatusBarItem
        LOCAL oSBIDATE AS StatusBarItem	
        LOCAL cDATE AS STRING
	
	SUPER: INIT( oOwnerApp )
	
//	aChildWindows := {}

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



METHOD LIMPASINT() 
LOCAL aDAD AS ARRAY
LOCAL oORI AS USEREDE
LOCAL oPROGWIN AS PROGWIN

ZERADBFREDE("SINTPEND")

aDAD:={zCURINI,"SINTCERT.DBF",ZCURDIR} //sigla do estado
oORI:=USEREDE{aDAD}
IF oORI:NERRO#0
   RETURN .F.	
ENDIF
oProgWin := ProgWin{}
oProgWin:Caption:="Limpando dados"
oProgWin:SHOW()
SELF:POINTER:=POINTER{POINTERHOURGLASS}	
oPROGWIN:reset()
oPROGWIN:nTOTAL:=OORI:RecCount
WHILE ! oORI:EOF
    oPROGWIN:TITULO(oORI:FIELDGET("CNPJ"),.T.)
	IF oORI:FIELDGET("CNPJOK")=" " .and. oori:FIELDGET("IEOK")=" "
       oORI:Delete()
    ENDIF
    oORI:SKIP()
    oPROGWIN:SKIP(1)
ENDDO
oORI:CLOSE()

Oprogwin:EndDialog()
SELF:POINTER:=POINTER{POINTERARROW}
alert("concluido")

METHOD MY03PFS 
LOCAL oCONN AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL oMY03 AS USEMANA5
LOCAL cCODIGOINT,cCODIGO,cSQL AS STRING
LOCAL aDAD AS ARRAY
LOCAL nSEQ,nSSQ  AS WORD
LOCAL nPERC AS INT  
LOCAL nLASTREC,nPOS AS DWORD
LOCAL lATUAL AS LOGIC
LOCAL oPROGWIN AS PROGWIN
LOCAL oJAN AS JMESANO        

nSEQ:=0
nSSQ:=0
	
oConn := SQLConnection{}
IF ! oConn:connect("pf","","")
  	  alert("Erro na Conecção")
   RETURN .F.
ENDIF	

lATUAl:=MDG("MES ATUAL")
IF lATUAL
   aDAD:={zCURINI,"MY03",zCURDIR,aDIR}
   oMY03:=USEMANA5{aDAD}
   IF oMY03:nERRO#0
      RETU SELF
   ENDIF
ELSE	
   oJAN:=JMESANO{SELF}
   oJAN:SHOW()
   aDAD:={zCURINI,"Y3"+OJAN:cCOMP,zCURDIR,aDIR}
   oMY03:=USEMANA5{aDAD}
   IF oMY03:nERRO#0
      RETU SELF
   ENDIF	
ENDIF	



oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando PFS->MY03"
oProgWin:SHOW()



   nLASTREC:=oMY03:RecCount
   nPOS:=0

   oMY03:SETORDER(5) //Codigo interno
   oMy03:GOTOP()
   WHILE ! oMY03:EoF
   	  WHILE ! Empty(oMY03:FIELDGET("CODIGO")) .AND. !oMY03:EOF
   	  	 NPerc := INT(100* nPOS/ nLASTREC)
         oProgWin:oDcProgBar:Position := nPerc
   	     nPOS++
          oProgWin:oDCMessage:textValue:=Str(nPOS,8)+"/"+Str(nLASTREC,8)
         oMY03:SKIP()
      ENDDO
      IF ! oMY03:EOF
     	 cCODIGOINT:=AllTrim(oMY03:FIELDGET("CODIGOINT"))
         CSQL:="SELECT PF.CODIGO,PF.CODFISCAL,PF.CODFINAL,PFS.SEQ,PFS.SSQ,PFS.CODINT FROM PFS,PF "
         CSQL+=" WHERE PFS.PF=PF.PF AND"
         CSQL+=" PFS.CODINT='"+cCODIGOINT+"'"
         oreg:= SQLSelect{cSQL,oconn}
         IF ! oREG:EoF
         	cCODIGO:=FIXSTR(oREG:FIELDGET("CODFINAL"))
         	IF Empty(cCODIGO)
               cCODIGO:=FIXSTR(oREG:FIELDGET("CODFISCAL"))
         	ENDIF	
  	        IF Empty(cCODIGO)
               cCODIGO:=FIXSTR(oREG:FIELDGET("CODIGO"))
         	ENDIF	
            nSEQ:=FIXNUM(oREG:FIELDGET("SEQ"))
            nSSQ:=FIXNUM(oREG:FIELDGET("SSQ"))
         ENDIF	
         OREG:CLOSE()
  	     WHILE oMY03:FIELDGET("CODIGOINT")=cCODIGOINT .AND. !oMY03:EOF
  	     	IF ! Empty(cCODIGO)
  	     	   oMY03:FIELDPUT("CODIGO",cCODIGO)
  	     	   oMY03:FIELDPUT("SEQ",nSEQ)
  	     	   oMY03:FIELDPUT("SEQ",nSSQ)
  	     	ENDIF	
  	        NPerc := INT(100* nPOS/ nLASTREC)
            oProgWin:oDcProgBar:Position := nPerc
     	    nPOS++
    	    oProgWin:oDCMessage:textValue:=Str(nPOS,8)+"/"+Str(nLASTREC,8)+" "+cCODIGOINT
            oMY03:SKIP()
         ENDDO
      ENDIF
   ENDDO
  oMY03:CLOSE()
  oCONN:Disconnect()
  oPROGWIN:EndDialog()

METHOD sayCOM() 
  LOCAL oJCOM AS JCOM
  oJCOM:=jCOM{SELF}
  OjCOM:show()		
  SELF:Caption:="Módulo Sintegra - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		

METHOD SINCCERT  
LOCAL cARQ
cARQ:=PEGINIVAL(ZCURINI,"SINTCERT.DBF","CAMINHO")+"SINTCERT.DBF"
SELF:IMPDBFUF(cARQ,4,TRUE)	


METHOD SinCDBF() 
LOCAL oJAN AS BUSCAARQ
oJAN:=BUSCAARQ{SELF}
oJAN:SETarFiltro("*.DBF","Arquivos DBF")
oJAN:SHOW()
IF oJAN:LOK
   SELF:IMPDBFUF(oJAN:cBUSCA,0,FALSE)	
ENDIF	


METHOD SINCPEND  
LOCAL cARQ
cARQ:=PEGINIVAL(ZCURINI,"SINTPEND.DBF","CAMINHO")+"SINTPEND.DBF"
SELF:IMPDBFUF(cARQ,4,TRUE)	

METHOD XBAIXAGO 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"BAIXAGO"}
oJAN:SHOW()	

METHOD XBAIXAMA 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"BAIXAMA"}
oJAN:SHOW()	

METHOD XBAIXAPR 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"BAIXAPR"}
oJAN:SHOW()	

METHOD XBAIXARS 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"BAIXARS"}
oJAN:SHOW()	

METHOD XCNPJIEAC 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"AC"}
oJAN:SHOW()	

METHOD XCNPJIEAL 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"AL"}
oJAN:SHOW()

METHOD XCNPJIEAM 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"AM"}
oJAN:SHOW()

METHOD XCNPJIEAP 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"AP"}
oJAN:SHOW()

METHOD XCNPJIEBA 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"BA"}
oJAN:SHOW()

METHOD XCNPJIECE 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"CE"}
oJAN:SHOW()

METHOD XCNPJIEDF 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"DF"}
oJAN:SHOW()

METHOD XCNPJIEES 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"ES"}
oJAN:SHOW()

METHOD XCNPJIEGO 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"GO"}
oJAN:SHOW()

METHOD XCNPJIEMA 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"MA"}
oJAN:SHOW()

METHOD XCNPJIEMG 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"MG"}
oJAN:SHOW()

METHOD XCNPJIEMS 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"MS"}
oJAN:SHOW()

METHOD XCNPJIEMT 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"MT"}
oJAN:SHOW()

METHOD XCNPJIEPA 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"PA"}
oJAN:SHOW()

METHOD XCNPJIEPB 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"PB"}
oJAN:SHOW()

METHOD XCNPJIEPE 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"PE"}
oJAN:SHOW()

METHOD XCNPJIEPI 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"PI"}
oJAN:SHOW()

METHOD XCNPJIEPR 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"PR"}
oJAN:SHOW()

METHOD XCNPJIERJ 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"RJ"}
oJAN:SHOW()

METHOD XCNPJIERN 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"RN"}
oJAN:SHOW()

METHOD XCNPJIERO 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"RO"}
oJAN:SHOW()

METHOD XCNPJIERR 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"RR"}
oJAN:SHOW()

METHOD XCNPJIERS 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"RS"}
oJAN:SHOW()

METHOD XCNPJIESC 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"SC"}
oJAN:SHOW()

METHOD XCNPJIESE 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"SE"}
oJAN:SHOW()			

METHOD XCNPJIESP 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"SP"}
oJAN:SHOW()	

METHOD XCNPJIETO 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"TO"}
oJAN:SHOW()		



METHOD XCNPJIEYY 
LOCAL oJAN AS XJCNPJIE
oJAN:=XJCNPJIE{SELF,"YY"}
oJAN:SHOW()

METHOD XIMPCLI 
	IMPCLI()	

METHOD XIMPCOD 
	IMPCOD(1,8,.T.)

METHOD XIMPFOR 
	IMPFOR(.T.)  
METHOD IMPTXTALL()
LOCAL nHANDLE	
LOCAL cLINHA,cSITUACAO AS STRING
LOCAL aUF AS ARRAY
LOCAL X AS  BYTE
aUF    := { "PR","BAIXAPR", "RS", "BAIXARS", "SC", "CPFSC", "MA", "BAIXAMA", "SE", "RO", ;
            "MS", "ES", "CE", "PA", "MG", "TODASPB","PB", "PI", "PE","BA","CPFBA","RJ","GO","BAIXAGO","AL"}
//Loop abaixo apos os renames
            

IF File("contodos.txt")  //todaspb tem diferenca da contodos uma usa ; outra usa |
   FRename("contodos.txt","pb.txt")
   SELF:XIMPTXT("PB",.F.)
ENDIF

IF File("connormal.txt") .and. ! File('pb.txt') //todaspb tem diferenca da contodos uma usa ; outra usa |
   FRename("connormal.txt","pb.txt")
   SELF:XIMPTXT("PB",.F.)
ENDIF

IF File("conoutros.txt") .and. ! File('pb.txt') //todaspb tem diferenca da contodos uma usa ; outra usa |
   FRename("conoutros.txt","pb.txt")
   SELF:XIMPTXT("PB",.F.)
ENDIF

IF File("contrib_todas_sit.txt")  //todaspb tem diferenca da contodos uma usa ; outra usa |
   FRename("contrib_todas_sit.txt","TODASPB.txt")
   SELF:XIMPTXT("TODASPB",.F.)
ENDIF

IF File("CCI_RESUMIDO.TXT")
   FRename("CCI_RESUMIDO.TXT","MS.txt")
   SELF:XIMPTXT("MS",.F.)
ENDIF

IF File('contrbcnpj.txt') .and. ! File('ba.txt')
   FRename("contrbcnpj.txt","ba.txt")
   SELF:XIMPTXT("BA",.F.)
ENDIF

IF File('cpa.txt')
   FRename("cpa.txt","pa.txt")
   SELF:XIMPTXT("PA",.F.)
ENDIF

IF File("cad_resumido_ativos.txt") .and.  ! File('ro.txt')
   FRename("cad_resumido_ativos.txt","ro.txt")
   SELF:XIMPTXT("RO",.F.)
ENDIF

IF File("cad_resumido_total_cnpj.txt")
   FRename("cad_resumido_total_cnpj.txt","ro.txt")
   SELF:XIMPTXT("RO",.F.)
ENDIF

IF File("ICS_ATIVO.TXT")
   FRename("ICS_ATIVO.TXT","rs.txt")
   SELF:XIMPTXT("RS",.F.)
ENDIF

IF File("ICS_BAIXADO.txt")
   FRename("ICS_BAIXADO.txt","baixars.txt")
   SELF:XIMPTXT("BAIXARS",.F.)
ENDIF

IF File("CadAtivo.txt")
   FRename("CadAtivo.txt","sc.txt")
   SELF:XIMPTXT("SC",.F.)
ENDIF

IF File("Arq_pessoa_fisica.txt")
   FRename("Arq_pessoa_fisica.txt","cpfsc.txt")
   SELF:XIMPTXT("CPFSC",.F.)
ENDIF


IF File("cad_resumido_total.txt") .and. ! File("ro.txt")
   FRename("cad_resumido_total.txt","ro.txt")
   SELF:XIMPTXT("RO",.F.)
ENDIF

IF File("cad_resumido_total_cnpj.txt") .and. ! File("ro.txt")
   FRename("cad_resumido_total_cnpj.txt","ro.txt")
   SELF:XIMPTXT("RO",.F.)
ENDIF

IF File("RJCONTRIB.txt")
   FRename("RJCONTRIB.txt","rj.txt")
   SELF:XIMPTXT("RJ",.F.)
ENDIF

IF File("CADASTRO_DE_CONTRIBUINTE_SIMPLIFICADO.txt")
   FRename("CADASTRO_DE_CONTRIBUINTE_SIMPLIFICADO.TXT","pe.txt")
   SELF:XIMPTXT("PE",.F.)
ENDIF

IF File("lista_cadastro1.txt")
   FRename("lista_cadastro1.txt","ma.txt")
   SELF:XIMPTXT("MA",.F.)
ENDIF

IF File("ativos_icms.txt")
   FRename("ativos_icms.txt","ma.txt")
   SELF:XIMPTXT("MA",.F.)
ENDIF


IF File("lista_cadastro_restricao1.txt")
   FRename("lista_cadastro_restricao1.txt","baixama.txt")
   SELF:XIMPTXT("BAIXAMA",.F.)
ENDIF


IF File("contribuinte.txt")
   FRename("contribuinte.txt","ce.txt")
   SELF:XIMPTXT("CE",.F.)
ENDIF


IF File("cadastro.txt")
    nHANDLE:=FOpen("cadastro.txt")
    cLINHA := AllTrim(FReadLine( nHANDLE ))
	FClose(Nhandle)	
    IF At(";",cLINHA)>0
       FRename("cadastro.txt","al.txt")
       SELF:XIMPTXT("AL",.F.)
	ELSE
       cSITUACAO:=SubStr(cLINHA,92,1)		
	   IF cSITUACAO="N" .OR. cSITUACAO='H'	
	      FRename("cadastro.txt","mg.txt")	
	      SELF:XIMPTXT("MG",.F.)
	   ELSE
	      IF At("ESTADO DE SC",cLINHA)>0		
		     FRename("cadastro.txt","sc.txt")
		     SELF:XIMPTXT("SC",.F.)	
		  ENDIF
	   ENDIF
    ENDIF
ENDIF


IF File("cadastro_cnpj.txt") .and. ! File("al.txt")
   FRename("cadastro_cnpj.txt","al.txt")
   SELF:XIMPTXT("AL",.F.)
ENDIF

IF File("sintegra.txt")
   FRename("sintegra.txt","se.txt")
   SELF:XIMPTXT("SE",.F.)
ENDIF

IF File("ativos.txt")
   FRename("ativos.txt","pr.txt")
   SELF:XIMPTXT("PR",.F.)
ENDIF

IF File("cancelados.txt")
   FRename("cancelados.txt","baixapr.txt")
   SELF:XIMPTXT("BAIXAPR",.F.)
ENDIF

IF File("cadastro"+DToS(Today())+".txt")
   FRename("cadastro"+DToS(Today())+".txt","mg.txt")
   SELF:XIMPTXT("MG",.F.)
ENDIF

FOR X:=1 TO Len(aUF)
	SELF:XIMPTXT(AUF[X],.F.)
NEXT X	

METHOD XIMPTXT(CUF,lPERG) 
LOCAL oText	    AS TextDBServer
LOCAL aStruct,aDAD AS ARRAY
LOCAL oORI,oORIBX,oMD10    AS userede
LOCAL oPROGWIN  AS PROGWIN
LOCAL nLASTREC,nPOS AS DWORD
LOCAL nPERC     AS INT
LOCAL cCNPJ,cIE,cARQTXT,cNOME,cSITUACAO,cESTADO,cDATA,cCIDADE,cCNAE,cCATEGORIA,cREGIME AS STRING   
LOCAL cENDERECO,cNUMEND,cCOMPLEM,cBAIRRO,CCEP,CENDTIP,CIBGE,cIRRF AS STRING
LOCAL oJAN AS BUSCAARQ
LOCAL lGRAVA AS LOGIC  
//LOCAL dDATA AS DATE

 Astruct:={}
cARQTXT:=cUF+".TXT"  
                  
IF ! File(cARQTXT)      
   IF ! lPERG
   	  RETURN .F.
   ELSE		
	oJAN:=BUSCAARQ{SELF}
	oJAN:SETarFiltro("*.TXT","Arquivos Texto")
	oJAN:SHOW()
	IF ! oJAN:LOK
	   RETURN .F.
	ENDIF	
	cARQTXT:=oJAN:cBUSCA 
   ENDIF
ENDIF	
IF ! File(cARQTXT) 
   IF lPERG
      alert("Arquivo Nao Encontrado") 
   ENDIF   
   RETURN .F.
ENDIF	



DO CASE
  CASE cUF="AL"	
       aStruct:= {{"IE","C",9,0},;
                  {"SEP01","C",1,0},;
                  {"CNPJ","C",14,0},;
                  {"SEP02","C",1,0},;
                  {"SITUACAO","C",1,0}}
  CASE cUF="ES"	
//       aStruct:= {{"CNPJ","C",14,0},;
//                  {"IE","C",9,0},;
//                  {"SITUACAO","C",1,0},;
//                  {"DATA","C",8,0},;
//                  {"UF","C",2,0}}
      aStruct:= {{"LINHA","C",255,0}}
  CASE cUF="MS"	
//       aStruct:= {{"CNPJ","C",14,0},;
//                  {"IE","C",9,0},;
//                  {"SEP02","C",5,0},;
//                  {"SITUACAO","C",1,0},;
//                  {"DATA","C",8,0},;
//                  {"UF","C",2,0}}
      aStruct:= {{"LINHA","C",255,0}}
  CASE cUF="CE"	
//       aStruct:= {{"CNPJ","C",14,0},;
//                  {"SEP01","C",2,0},;
//                  {"IE","C",9,0},;
//                  {"SEP02","C",2,0},;
//                  {"UF","C",2,0}}
      aStruct:= {{"LINHA","C",255,0}}
   CASE cUF="MA" .OR. cUF="BXMA"	
//       aStruct:= {{"IE","C",9,0},;
//                  {"SEP01","C",2,0},;
//                  {"CNPJ","C",14,0},;
//                  {"SEP02","C",55,0}}

      aStruct:= {{"LINHA","C",255,0}}
   CASE cUF="PR" .OR. cUF="BXPR"	
//       aStruct:= {{"IE","C",10,0},;
//                  {"SEP01","C",1,0},;
//                 {"CNPJ","C",14,0},;
//                 {"SEP02","C",1,0},;
//                  {"DATA","C",6,0},;
//                  {"SEP03","C",1,0},;
//                  {"SITUACAO","C",8,0},;
//                  {"SEP04","C",1,0},;
//                  {"CIDADE","C",5,0},;
//                  {"SEP05","C",1,0},;
//                  {"CNAE","C",7,0}}
        aStruct:= {{"LINHA","C",255,0}}
   CASE cUF="RS"	
       aStruct:= {{"IE","C",10,0},;
                  {"SEP01","C",1,0},;
                  {"CNPJ","C",14,0},;
                  {"SEP02","C",1,0},;
                  {"CATEGORIA","C",5,0},;
                  {"SEP03","C",1,0},;
                  {"DATA","C",10,0},;
                  {"SEP04","C",1,0},;
                  {"CNAE","C",7,0},;
                  {"SEP05","C",1,0},;
                  {"UF","C",2,0}}
        aStruct:= {{"LINHA","C",255,0}}
   CASE cUF="PE"	
//       aStruct:= {{"CNPJ","C",14,0},;
//                  {"IE","C",14,0},;
//                  {"SITUACAO","C",1,0},;
//                  {"DATA","C",8,0},;
//                  {"UF","C",2,0}}
       aStruct:= {{"LINHA","C",255,0}}
   CASE cUF="RO"	
//       aStruct:= {{"CNPJ","C",14,0},;
//                  {"IE","C",14,0},;
//                  {"NOME","C",60,0},;
//                  {"UF","C",2,0}}
       aStruct:= {{"LINHA","C",255,0}}
   CASE cUF="RJ"	
       aStruct:= {{"CNPJ","C",14,0},;
                  {"IE","C",14,0}}
   CASE cUF="GO"	
   	       aStruct:= {{"IE","C",9,0},;
 	                  {"NOME","C",50,0},;
       	              {"CNPJ","C",14,0},;
                      {"DATA","C",8,0},;
                      {"CNAE","C",7,0},;
                      {"CIDADE","C",45,0}}
   CASE cUF="BXGO"	
  	     aStruct:= {{"IE","C",9,0},;
 	                {"NOME","C",50,0},;
       	            {"CNPJ","C",14,0},;
                    {"DATA","C",8,0}}
   CASE cUF="BXRS"	
//       aStruct:= {{"IE","C",10,0},;
//                  {"SEP01","C",1,0},;
//                  {"CNPJ","C",14,0},;
//                  {"SEP02","C",1,0},;
//                  {"DATA","C",10,0}}
       aStruct:= {{"LINHA","C",255,0}}
   CASE cUF="BA"	
       aStruct:= {{"SEQ","C",6,0},;
                  {"TIPOREG","C",2,0},;
                  {"IE","C",8,0},;
                  {"CATEGORIA","C",2,0},;
                  {"CNPJ","C",14,0}}

   CASE cUF="CPFBA"	
       aStruct:= {{"SEQ","C",6,0},;
                  {"TIPOREG","C",2,0},;
                  {"IE","C",8,0},;
                  {"CATEGORIA","C",2,0},;
                  {"SEP01","C",3,0},;
                  {"CNPJ","C",11,0}}
   CASE cUF="PB"	
       aStruct:= {{"LINHA","C",255,0}}
   CASE cUF="SC" .OR. cUF="CPFSC"
       aStruct:= {{"LINHA","C",255,0}}
   CASE cUF="SE"	
       aStruct:= {{"LINHA","C",255,0}}
   CASE cUF="MG"	
       aStruct:= {{"LINHA","C",255,0}}
   CASE cUF="PA"	
       aStruct:= {{"LINHA","C",255,0}}
   CASE cUF="PI"	
       aStruct:= {{"LINHA","C",255,0}}

ENDCASE

//
//colocar um espaco 1a. linha bahia
//

DO CASE
   CASE cUF="BXGO"	
       aDAD:={zCURINI,"BAIXAGO.DBF",ZCURDIR} //sigla do estado
   CASE cUF="BXRS"	
       aDAD:={zCURINI,"BAIXARS.DBF",ZCURDIR} //sigla do estado
   CASE cUF="BXMA"	
       aDAD:={zCURINI,"BAIXAMA.DBF",ZCURDIR} //sigla do estado
   CASE cUF="BXPR"	
       aDAD:={zCURINI,"BAIXAPR.DBF",ZCURDIR} //sigla do estado
   CASE cUF="CPFBA"	
       aDAD:={zCURINI,"CNPJIEBA.DBF",ZCURDIR} //sigla do estado
   CASE cUF="CPFSC"	
       aDAD:={zCURINI,"CNPJIESC.DBF",ZCURDIR} //sigla do estado   
   CASE cUF="TODASPB"	
       aDAD:={zCURINI,"CNPJIEPB.DBF",ZCURDIR} //sigla do estado      
   OTHERWISE	
       aDAD:={zCURINI,"CNPJIE"+cUF+".DBF",ZCURDIR} //sigla do estado
ENDCASE


oORI:=USEREDE{aDAD,.F.}
IF oORI:nERRO#0
    RETU SELF
ENDIF
IF cUF="MG"
    aDAD:={zCURINI,"BAIXAMG.DBF",ZCURDIR}
	oORIBX:=USEREDE{aDAD,.F.}
	IF oORIBX:nERRO#0
	    OORI:CLOSE()
		RETURN .F.
	ENDIF
	
ENDIF   

aDAD:={zCURINI,"MD10.DBF",zCURDIR}
oMD10:=USEREDE{aDAD}
IF oMD10:nERRO#0   
	OORI:CLOSE() 
	IF cUF="MG" 
	   oORIBX:CLOSE()	
	ENDIF	
    RETURN  .F.
ENDIF	
	
oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando dados "+cUF
oProgWin:SHOW()
nPOS:=1

SELF:POINTER:=POINTER{POINTERHOURGLASS}	
Otext:=TextDBServer{}
DO CASE
   CASE cUF="__"		
   	   NOP
//        Otext:Setup(Astruct,cARQTXT,fo_read,0,1)
   OTHERWISE
 	    Otext:Setup(Astruct,cARQTXT,fo_read,0,2) //nSEPCHAR CHR(13),CRH(10)
ENDCASE

IF cUF="PB" .OR. cUF="SC" .OR. cUF="SE"
   oTEXT:ReadLine()
   nLastrec:=100
ELSE	
   nLastrec:=Otext:RecCount
   Otext:gotop()
ENDIF
IF 	cUF="GO" .OR. cUF="BXGO" .OR. cUF="BA" .OR. cUF="CPFBA"
    Otext:Skip(1,.t.)	 //1a. linha header
ENDIF	
IF cUF="SE"
   oTEXT:ReadLine()	 	 //1a. linha header
ENDIF	
	
WHILE ! Otext:EOF()
    nPerc := INT(100* nPOS/ nLASTREC)
    nPOS++
    oProgWin:oDcProgBar:Position := nPerc
    oProgWin:oDCMessage:textValue:=StrZero(nPOS,8)+"/"+StrZero(nLASTREC,8)
	IF cUF="PB" .OR. cUF="SC" .OR. cUF="SE"
	   IF nPOS>=100
          nPOS:=1	
       ENDIF
    ENDIF	
    
  cIE      :=  ""
   cNOME    := ""
   cCNPJ    := ""
   cDATA    := ""
  // dDATA    :=CToD(Space(8))
   cSITUACAO:= ""
   cCIDADE  := ""
   cCNAE    :=  ""
   cIBGE    :="" 
   cIRRF    :=""
   cBAIRRO  :=""
   cCEP     := ""
   cREGIME  :=""
   cESTADO  :="" //difere de cUF(Passado funcao) para evitar erros pode ser ST subistituto tributario
   cNUMEND  :=""
   cENDTIP  :=""
   cCOMPLEM :=""
   cREGIME  :=""

    DO CASE
 	  CASE cUF="AL"	
           cCNPJ:=otext:FIELDGET(3)
           CIE:=  Otext:FIELDGET(1)
           cSITUACAO:=  Otext:FIELDGET(5)
 	  CASE cUF="MS"	
//           cCNPJ:=otext:FIELDGET(1)
//           CIE:=  Otext:FIELDGET(3)
//           cSITUACAO:=  Otext:FIELDGET(5)
//           cDATA:= Otext:FIELDGET(6)
//           CESTADO:=  Otext:FIELDGET(7)
         cCNPJ:=SubStr(Otext:cLINHA,1,14)
         CIE:=  SubStr(Otext:cLINHA,15,9)
         cSITUACAO:=SubStr(Otext:cLINHA,29,1)
         cDATA:= SubStr(Otext:cLINHA,30,8) //yyyymmdd
         CESTADO:= SubStr(Otext:cLINHA,38,2)
 	  CASE cUF="ES"	
//           cCNPJ:=otext:FIELDGET(1)
//           CIE:=  Otext:FIELDGET(3)
//           cSITUACAO:=  Otext:FIELDGET(4)
//           cDATA:= Otext:FIELDGET(5)
//           CESTADO:=  Otext:FIELDGET(6)
         cCNPJ:=SubStr(Otext:cLINHA,1,14)
         CIE:=  SubStr(Otext:cLINHA,15,9)
         cSITUACAO:=SubStr(Otext:cLINHA,24,1)
         cDATA:= SubStr(Otext:cLINHA,25,8) //yyyymmdd
         CESTADO:= SubStr(Otext:cLINHA,33,2)
 	  CASE cUF="PR" .OR. cUF="BXPR"	
//           cCNPJ:=otext:FIELDGET(3)
//           CIE:=  Otext:FIELDGET(1)
//           cSITUACAO:=  Otext:FIELDGET(7)
//           cDATA:= Otext:FIELDGET(5)
//           CCIDADE:=  Otext:FIELDGET(9)
//           CCNAE:=  Otext:FIELDGET(11) 
 //0990002363;44367522000525;200708;98260109;61794;4635402            
          cIE:=  Token(Otext:cLINHA,1,";")
          cCNPJ:=Token(Otext:cLINHA,2,";")
          cDATA:= Token(Otext:cLINHA,3,";")
          cSITUACAO:=  Token(Otext:cLINHA,4,";")
          cCIDADE:=  Token(Otext:cLINHA,5,";")
          cCNAE:=  Token(Otext:cLINHA,6,";")
      CASE cUF="RS"	
//           CIE:=  Otext:FIELDGET(1)
//           cCNPJ:=otext:FIELDGET(3)
//           cCATEGORIA:=  Otext:FIELDGET(5)
//           cDATA:= Otext:FIELDGET(7)
//           CCNAE:= Otext:FIELDGET(9)
//           CESTADO:=  Otext:FIELDGET(11)
       cIE:=  Token(Otext:cLINHA,1,";")
       cCNPJ:=Token(Otext:cLINHA,2,";")
       cCATEGORIA:= Token(Otext:cLINHA,3,";")
       cDATA:=Token(Otext:cLINHA,4,";")
       cCNAE:=  Token(Otext:cLINHA,5,";")
       cESTADO:=  Token(Otext:cLINHA,6,";")
//       cCNAP:=  Token(Otext:cLINHA,7,";") //Acampos[7]
      CASE cUF="PE"	
//           cCNPJ:=otext:FIELDGET(1)
//           CIE:=  Otext:FIELDGET(3)
//           CSITUACAO:=  Otext:FIELDGET(4)
//           cDATA:= Otext:FIELDGET(5)
//           CESTADO:=  Otext:FIELDGET(6)
         //cCNPJ:=SubStr(Otext:cLINHA,1,14)
         //cIE:=SubStr(Otext:cLINHA,15,14)
         //cSITUACAO:=SubStr(Otext:cLINHA,29,1)  //0 = Habilitado1 = Não Habilitado
         //cDATA:=SubStr(Otext:cLINHA,30,8) //
         //cESTADO:=SubStr(Otext:cLINHA,38,2)
         //cREGIME:=SubStr(Otext:cLINHA,40)
  

         //10826063000155000000272BAIXADO   2011-01-141
         //12345678901234567890123456789012345678901235
         //         1         2         3         4
         //              5        4         4         4
         cCNPJ:=SubStr(Otext:cLINHA,1,14)
         cIE:=SubStr(Otext:cLINHA,15,9)
         cSITUACAO:=SubStr(Otext:cLINHA,24,1)  //0 = Habilitado1 = NÆo Habilitado
         cDATA:=SubStr(Otext:cLINHA,34,10) //
         cDATA:=StrTran(cDATA,"-","")
         cESTADO:="PE"
         cREGIME:=SubStr(Otext:cLINHA,44,1)
         IF cSITUACAO="0"
            cSITUACAO:="A"
         ENDIF
         IF cSITUACAO="1"
            cSITUACAO:="B"
         ENDIF
         
      CASE cUF="RJ"	
           cCNPJ:=otext:FIELDGET(1)
           CIE:=  Otext:FIELDGET(2)
      CASE cUF="RO"	
//           cCNPJ:=otext:FIELDGET(1)
//           CIE:=  Otext:FIELDGET(2)
//           CNOME:=  Otext:FIELDGET(3)
//           CESTADO:=  Otext:FIELDGET(4)
          cCNPJ:=SubStr(Otext:cLINHA,1,14)
     	  CIE:=SubStr(Otext:cLINHA,15,14)
     	  cNOME:=SubStr(Otext:cLINHA,29,65)
     	  CESTADO:=SubStr(Otext:cLINHA,94,2)
      CASE cUF="CE"
      	   cCNPJ:=Token(Otext:cLINHA,1,",") //Acampos[1]
           cIE:=  Token(Otext:cLINHA,2,",") //AllTrim(Acampos[2])
           cESTADO:= Token(Otext:cLINHA,3,",") //AllTrim(Acampos[3])
      CASE cUF="MA" .OR. cUF="BXMA"		
       	   cIE:=    SubStr(Otext:cLINHA,1,9)
           cCNPJ:=     AllTrim(SubStr(Otext:cLINHA,12,14))
           //cCNPJ:=otext:FIELDGET(3)
           //CIE:=  Otext:FIELDGET(1)
      CASE cUF="MG"
//0011949720055 00000000000000  JOSE ANTONIO DE FARIA e outro(s)                             H	
//1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
//         1         2         3         4         5         6         7         8         9
      	   cIE:=SubStr(Otext:cLINHA,1,13)
           cCNPJ:=SubStr(Otext:cLINHA,15,14)
           cNOME:=SubStr(Otext:cLINHA,31,60)
           cSITUACAO:=SubStr(Otext:cLINHA,92,1)  //H = Habilitado  N= Não Habilitado
		  //cIE:=SUBSTR(LINHA,1,13)
         //cCNPJ:=SUBSTR(LINHA,15,14)
         //cNOME:=SUBSTR(LINHA,31,60)
         //cSITUACAO:=SUBSTR(LINHA,92,1)  //H = Habilitado  N= NÆo Habilitado
		   
		   
      CASE cUF="GO"
	       CIE:=  Otext:FIELDGET(1)
           CNOME:=  Otext:FIELDGET(2)
           cCNPJ:=otext:FIELDGET(3)
           cDATA:= Otext:FIELDGET(4)
           CCNAE:= Otext:FIELDGET(5)
           CCIDADE:=  Otext:FIELDGET(6)
//          CIE:=  SubStr(LINHA,1,9)
//         cNOME=SubStr(LINHA,10,50)
//         cCNPJ:=SubStr(LINHA,60,14)
//         cDATA:= SubStr(LINHA,74,8)
//         cCNAE:= SubStr(LINHA,82,7)
//         cCIDADE:= SubStr(LINHA,89,45)
      CASE cUF="BXGO"
	       CIE:=  Otext:FIELDGET(1)
           CNOME:=  Otext:FIELDGET(2)
           cCNPJ:=otext:FIELDGET(3)
           cDATA:= Otext:FIELDGET(4)
      CASE cUF="BXRS"
//	       CIE:=  Otext:FIELDGET(1)
//           cCNPJ:=otext:FIELDGET(3)
//           cDATA:= Otext:FIELDGET(5)
           cIE:=  Token(Otext:cLINHA,1,";") //Acampos[1]
           cCNPJ:=Token(Otext:cLINHA,2,";") //Acampos[2]
           cDATA:=Token(Otext:cLINHA,3,";") //aCampos[3]
//           cCNAP:=Token(Otext:cLINHA,4,",") //Acampos[4]
     CASE cUF="BA"	
           CIE:=  Otext:FIELDGET(3)
           cCATEGORIA:=  Otext:FIELDGET(4)
           cCNPJ:=otext:FIELDGET(5)
//         CIE       :=SubStr(LINHA,9,8)
//         cCATEGORIA:=SubStr(LINHA,17,2)
//         cCNPJ     :=SubStr(LINHA,19,14)
     CASE cUF="CPFBA"	
           CIE:=  Otext:FIELDGET(3)
           cCATEGORIA:=  Otext:FIELDGET(4)
           cCNPJ:=otext:FIELDGET(6)
//          CIE       :=SubStr(LINHA,9,8)
//         cCATEGORIA:=SubStr(LINHA,17,2)
//         cCNPJ     :=SubStr(LINHA,22,11)

     CASE cUF="PB"	
          CIE:=        Token(Otext:cLINHA,1,";")
          cCNPJ:=      Token(Otext:cLINHA,2,";")
          CNOME:=      Token(Otext:cLINHA,3,";")
          cCATEGORIA:= Token(Otext:cLINHA,4,";")
          CCIDADE:=    Token(Otext:cLINHA,5,";") 
       CASE cUF="TODASPB"      
//IE|NOME|CNPJ|SITUACAO|REGIME|CNAE|AtivEcon|TipoLogr|NomeLogr|NUm|Compl|Bairro|CIDADE|UF|CEP|ENDERECONC    
//1  2    3    4        5      6    7        8        9        10  11    12     13     14 15  16
          
             CIE:=    Token(Otext:cLINHA,1,"|")    //Acampos[1]
             CNOME:=  Token(Otext:cLINHA,2,"|")    //Acampos[2]
             cCNPJ:=  Token(Otext:cLINHA,3,"|")    //Acampos[3]
             cSITUACAO:= Token(Otext:cLINHA,4,"|") //Acampos[4]  
             cREGIME:=  Token(Otext:cLINHA,5,"|") //Acampos[5]
             cCNAE:=  Token(Otext:cLINHA,6,"|") //Acampos[6]
             //c:=   Token(Otext:cLINHA,7,"|") //Acampos[7] descritivo atividade nao usado
             cENDTIP:= Token(Otext:cLINHA,8,"|") //Acampos[8]
             cENDERECO:= AllTrim(Token(Otext:cLINHA,9,"|")) //AllTrim(Acampos[9])
             cNUMEND  := Token(Otext:cLINHA,10,"|")//  Acampos[10]
             cCOMPLEM:= Token(Otext:cLINHA,11,"|") // Acampos[11]
             cBAIRRO:= Token(Otext:cLINHA,12,"|")  //Acampos[12]
             cCIDADE:=  Token(Otext:cLINHA,13,"|") //Acampos[13]
             cESTADO:=  Token(Otext:cLINHA,14,"|") //Acampos[14]
             cCEP:=   Token(Otext:cLINHA,15,"|")    //Acampos[15]
                   //c:=  Token(Otext:cLINHA,16,"|") //Acampos[16] endereco conc nao usado
                      
          
     CASE cUF="PA"
         cCNPJ:=SubStr(Otext:cLINHA,1,14)
         cIE:=SubStr(Otext:cLINHA,15,9)
         cESTADO:=SubStr(Otext:cLINHA,24,2)
         cREGIME:=SubStr(Otext:cLINHA,26,1)
         cCNAE:=SubStr(Otext:cLINHA,27,8)
         cSITUACAO:=SubStr(Otext:cLINHA,35,1)  //0 = Habilitado1 = Não Habilitado
         cDATA:=SubStr(Otext:cLINHA,36,8) //yyyymmdd
         cNOME:=SubStr(Otext:cLINHA,44,35)
     CASE cUF="SC"	
          cCNPJ:=      Token(Otext:cLINHA,1,",")
          CIE:=        Token(Otext:cLINHA,2,",")
          CESTADO:=    Token(Otext:cLINHA,3,",")  
          //''Cidade em sc e o codigo irrf
          CIRRF:=      Token(Otext:cLINHA,4,",")    //posicao 6 data atualizacao   cidade
          CDATA:=      Token(Otext:cLINHA,5,",")    //posicao 9 descriacao situacao
          cCNAE:=      Token(Otext:cLINHA,7,",")
          cSITUACAO:=  Token(Otext:cLINHA,8,",") //0 ATIVO 1 CANCELADO 2 BAIXA DEFERIDA
          //cSITDESC:= Token(Otext:cLINHA,9,",")      //discritivo situacao
          
          
    CASE cUF="CPFSC"
         cIE:=      Token(Otext:cLINHA,1,";")
         cCNPJ:=    Token(Otext:cLINHA,2,";")
         cSITUACAO:=Token(Otext:cLINHA,3,";")   //1;ATIVO  9;BAIXA DEFERIDA
          //cSITDESC:= Token(Otext:cLINHA,4,",")      //discritivo situacao
         IF cSITUACAO="1"
             cSITUACAO:="0"         //muda para zero para ficar igual cnpj
         ENDIF
         IF cSITUACAO="9"
            cSITUACAO:="2"         //muda para 2 para ficar igual cnpj
         ENDIF
     CASE cUF="SE"	
     	  cIE:=SubStr(OTEXT:cLINHA,1,9)
     	  CCNPJ:=SubStr(OTEXT:cLINHA,11,14)
     	  cSITUACAO:=SubStr(OTEXT:cLINHA,26,1)
     	  CDATA:=SubStr(OTEXT:cLINHA,52,8)
     	  cCATEGORIA:=SubStr(OTEXT:cLINHA,61)
     CASE cUF="PI"
  	      cIE:=      Token(Otext:cLINHA,1,";")
          CCNPJ:=    Token(Otext:cLINHA,2,";")
          CNOME:=    Token(Otext:cLINHA,3,";")
   ENDCASE

   lGRAVA:=.T.

   IF cUF="PB" .OR. cUF="SC" .OR. cUF="SE"
   	  IF Empty(oTEXT:cLINHA)
         lGRAVA:=.F.
   	  ENDIF	
   ENDIF	
   IF cUF="PB" .OR. cUF="SC" .OR. cUF="SE"
      otext:ReadLine()
   ELSE	
      Otext:Skip(1,.t.)
   ENDIF




   IF cUF="BA" .OR. cUF="CPFBA"
   	  IF oTEXT:RecCount=oTEXT:RecNo //ultimo registro TRAILER
         lGRAVA:=.F.
   	  ENDIF
   ENDIF	
   IF ! LGRAVA
      LOOP
   ENDIF
   IF cUF="MG" .AND. cSITUACAO="N"
       IF .not. OoriBX:seek(cCNPJ)
          oORIBX:Append()
          oORIBX:FIELDPUT("CNPJ",cCNPJ)
		  oORIBX:FIELDPUT("IE",cIE)
		  oORIBX:FIELDPUT("NOME",cNOME)
		  oORIBX:FIELDPUT("SITUACAO",cSITUACAO)
	  ENDIF	 
      LOOP
   ENDIF   
   
   IF Empty(cIBGE) .AND. ! Empty(cCIDADE)  
   	  OMD10:SetOrder(1) 
   	  oMD10:GOTOP()
	  IF oMD10:SEEK(cESTADO+cCIDADE)
	     cIBGE:=oMD10:FIELDGET("CODIBGE")
	  ENDIF
   ENDIF	
   
    IF Empty(cIBGE) .AND. ! Empty(cIRRF)  
   	  OMD10:SetOrder(5) 
   	  oMD10:GOTOP()
	  IF oMD10:SEEK(cIRRF)
	     cIBGE:=oMD10:FIELDGET("CODIBGE")
	  ENDIF
   ENDIF
      
   
   
   
   
   IF lGRAVA
      IF .not. Oori:seek(cCNPJ)
          oORI:Append()
          oORI:FIELDPUT("CNPJ",cCNPJ)
	  ENDIF	  
   ENDIF
   oORI:FIELDPUTE("IE",cIE)
   IF cUF="AL"  .OR. cUF="ES" .OR. cUF="MS" .OR. cUF="PR" .OR. cUF="PE" .OR. cUF="SC" ;
      	           .OR. cUF="SE" .OR. cUF="CPFSC" .OR. cUF="PA" .OR. cUF="MG" .OR. cUF="BXPR"
        oORI:FIELDPUTE("SITUACAO",cSITUACAO)
   ENDIF	
   IF cUF="ES" .OR. cUF="MS" .OR. cUF="PE" .OR. cUF="PR" .OR. cUF="RS" ;
               .OR. cUF="GO" .OR. cUF="BXGO" .OR. cUF="BXRS" .OR. cUF="SC" ;
               .OR. cUF="SE" .OR. cUF="PA" .OR. cUF="BXPR"
         oORI:FIELDPUTE("DATA",cDATA)
   ENDIF	
  // IF cUF="RO" .OR. cUF="ES" .OR. cUF="MS" .OR. cUF="PE" .OR. cUF="RS" .OR. cUF="SC" .OR. cUF="PA"
   //     oORI:FIELDPUTE("UF",cESTADO)
  // ENDIF
    /*
      IF cUF="GO" .OR. cUF="PB"  .OR. cUF="TODASPB" 
             IF  cUF="TODASPB"                           
                 cIBGE:=BUSCAIBGE(cESTADO+cCIDADE)
             ELSE
                 cIBGE:=BUSCAIBGE(cUF+cCIDADE)
             ENDIF             
             FIELD->IBGE:=cIBGE                      
          ENDIF	
    */  
   	
   IF cUF="PR" .OR. cUF="RS" .OR. cUF="GO" .OR. cUF="SC" .OR. cUF="PA" .OR. cUF="BXPR"
       oORI:FIELDPUTE("CNAE",cCNAE)  
       IF Val(oORI:FIELDGET("CNAE"))=0 
       	  oORI:FIELDPUTE("CNAE",cCNAE)
       ENDIF	
   ENDIF
   //IF cUF="PR" .OR. cUF="GO" .OR. cUF="PB" .OR. cUF="SC" .OR. cUF="BXPR"
   //     oORI:FIELDPUTE("MUNICIPIO",cCIDADE)
   //ENDIF	
   IF cUF="RO" .OR. cUF="GO" .OR. cUF="BXGO" .OR. cUF="PB" .OR. cUF="PA" .OR. cUF="MG" .OR. cUF="PI"
        oORI:FIELDPUTE("NOME",cNOME)
   ENDIF	
   IF cUF="RS" .OR. cUF="BA" .OR. cUF="CPFBA" .OR. cUF="PB" .OR. cUF="SE"
        oORI:FIELDPUTE("CATEGORIA",cCATEGORIA)
   ENDIF
   IF cUF="PA" .OR. cUF="TODASPB"   .OR. cUF="PB"                      
      oORI:FIELDPUTE("REGIME",cREGIME)
   ENDIF
  IF cUF="TODASPB"      
             oORI:FIELDPUTE("ENDTIP",cENDTIP)          
             oORI:FIELDPUTE("ENDERECO",cENDERECO)
             oORI:FIELDPUTE("NUMEND",cNUMEND)  
             oORI:FIELDPUTE("COMPLEM",cCOMPLEM)
             oORI:FIELDPUTE("BAIRRO",cBAIRRO)
             oORI:FIELDPUTE("CEP",cCEP)   
  ENDIF
  IF .NOT. EMPTY(cIBGE)     
  	//SU SUFRAMA   YY ajustes
  	 IF cUF="GO" .OR. cUF="PB" .OR. cUF="TODASPB" .OR. cUF="PB" .OR. cUF="SC" .OR. cUF="SU" .OR. cUF="DF" .OR. cUF="PR" .OR. cUF="BAIXAPR" .OR. cUF="YY"
  	 	oORI:FIELDPUTE("IBGE",cIBGE)
  	 ENDIF	
  ENDIF	
  
ENDDO
oTEXT:Close()
oORI:CLOSE() 
oMD10:Close()
IF cUF="MG"
	oORIBX:Close() 
ENDIF	
	
oPROGWIN:EndDialog()
SELF:POINTER:=POINTER{POINTERARROW}
RETURN	.T.
	

METHOD XIMPTXTAL() 
	SELF:XIMPTXT("AL")	

METHOD XIMPTXTBA() 
	SELF:XIMPTXT("BA")		

METHOD XIMPTXTBACPF() 
   SELF:XIMPTXT("CPFBA")	

METHOD XIMPTXTBXGO() 
	SELF:XIMPTXT("BXGO")				

METHOD XIMPTXTBXMA() 
	SELF:XIMPTXT("BXMA")							

METHOD XIMPTXTBXPR() 
IF File("cancelados.txt")
   FRename("cancelados.txt","baixapr.txt")
ENDIF
	SELF:XIMPTXT("BXPR")						
	

METHOD XIMPTXTBXRS() 
	SELF:XIMPTXT("BXRS")					
	

METHOD XIMPTXTCE() 
	SELF:XIMPTXT("CE")		

METHOD XIMPTXTES() 
	SELF:XIMPTXT("ES")		

METHOD XIMPTXTGO() 
	SELF:XIMPTXT("GO")			

METHOD XIMPTXTMA() 
	SELF:XIMPTXT("MA")		

METHOD XIMPTXTMS() 
	SELF:XIMPTXT("MS")			

METHOD XIMPTXTPB() 
	SELF:XIMPTXT("PB")

METHOD XIMPTXTPE() 
IF File("CADASTRO_DE_CONTRIBUINTE_SIMPLIFICADO.txt")
   FRename("CADASTRO_DE_CONTRIBUINTE_SIMPLIFICADO.TXT","pe.txt")
ENDIF
	SELF:XIMPTXT("PE")		


METHOD XIMPTXTPR() 
IF File("ativos.txt")
   FRename("ativos.txt","pr.txt")
ENDIF


	SELF:XIMPTXT("PR")	

METHOD XIMPTXTRJ() 
	SELF:XIMPTXT("RJ")

METHOD XIMPTXTRO() 
	SELF:XIMPTXT("RO")	

METHOD XIMPTXTRS() 
	SELF:XIMPTXT("RS")	

METHOD XIMPTXTSC() 
	SELF:XIMPTXT("SC")		

METHOD XIMPTXTSE() 
	SELF:XIMPTXT("SE")	

METHOD XINTEXP() 
IF MDG("MS01 - Exportar Produtos")	
   SELF:GRVESTINT("MS01")	
ENDIF
IF MDG("MT01 - Exportar Componentes")	
   SELF:GRVESTINT("MT01")	
ENDIF
IF MDG("MU01 -Exportar Materia Prima")	
  SELF:GRVESTINT("MU01")	
ENDIF
IF MDG("MW05 - Exportar Consumiveis")	
   SELF:GRVESTINT("MW05")	
ENDIF
IF MDG("MW07 - Exportar Itens Manutencao")	
   SELF:GRVESTINT("MW07")	
ENDIF
IF MDG("MP03 - Exportar Tratamentos")	
   SELF:GRVESTINT("MP03")	
ENDIF
IF MDG("MS06 -Exportar Produtos-Seq Proc.")	
   SELF:GRVESTINT("MS06")		
ENDIF
IF MDG("OP01 - Ordem Producao")		
   SELF:GRVESTINT("OP01")			
ENDIF	


METHOD XJCERT 
LOCAL cDIR, cEXE, cCODNEW AS STRING
LOCAL nFout AS PTR

//   IF ! entramenu("SIN",nPOS)
//	   RETURN SELF
 //   ENDIF	

    cCODNEW := PEGINIVAL(ZCURINI,"CHKSINTEGRA","CAMINHO")
  IF ! File(cCODNEW)
       alert("Nao Encontrado" + cCODNEW)
      RETURN SELF
   END IF
cDIR:=GetFileNameFromPath(cCODNEW)
cEXE:=GetPathFromFileName(cCODNEW)
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz(cEXE),String2Psz(""),String2Psz(cDIR),1)
ShellExecuteErro(nFout) 

METHOD XWRPTSINT 
SELF:XWRPTGRP("SINT","")	

END CLASS
