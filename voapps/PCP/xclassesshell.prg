CLASS pcpshell INHERIT StandardShellWindow

METHOD geracortexml() 
LOCAL cDIR, cEXE, cCODNEW AS STRING
LOCAL nFout AS PTR

//   IF ! entramenu("PCP",nPOS)
//	   RETURN SELF
 //   ENDIF	

    cCODNEW := PEGINIVAL(ZCURINI,"geracortexml","CAMINHO")
  IF ! File(cCODNEW)
       alert("Nao Encontrado" + cCODNEW)
      RETURN SELF
   END IF
cDIR:=GetFileNameFromPath(cCODNEW)
cEXE:=GetPathFromFileName(cCODNEW)
ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz(cEXE),String2Psz(""),String2Psz(cDIR),SW_SHOWNORMAL)
ShellExecuteErro(nFout) 
	
	
CONSTRUCTOR( oOwnerApp ) 
	//LOCAL oSB AS StatusBar
	LOCAL oSBIUSER AS StatusBarItem
    LOCAL oSBIDATE AS StatusBarItem	
    LOCAL oSBIMSG AS StatusBarItem	
    LOCAL cDATE AS STRING
	
	SUPER: INIT( oOwnerApp )
	
	aChildWindows := {}

        oSBIDate := StatusBarItem{}
	oSBIDate:Style := SBITEMSUNKEN
	cDate := Ddia(Today()) //+ //FullDate(Today())
	oSBIDate:Width := 8* Len(cDate)
	oSBIDate:NameSym := #SBDateItem
	
	oSBIUser := StatusBarItem{}
	oSBIUser:Style := SBITEMRAISED
	oSBIUser:Width := 8*(15) //8 N + "-" + Cognome(15) Len("ADMIN")
	oSBIUser:NameSym := #SBUser
	
	oSBIMSG := StatusBarItem{}
	oSBIMSG:Style := SBITEMRAISED
	oSBIMSG:Width := 300 //8 N + "-" + Cognome(15) Len("ADMIN")
	oSBIMSG:NameSym := #SBMSG


//	oSB := SELF:EnableStatusBar()
	SELF:StatusBar:DisplayKeyboard() //
	SELF:StatusBar:DisplayTime()         //
    SELF:StatusBar:Additem (oSBIDATE)
    SELF:StatusBar:Additem (oSBIUser)
    SELF:StatusBar:Additem (oSBIMSG)
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
  SELF:Caption:="Módulo PCP - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		

METHOD XGERAMGREMB() 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL cSQL,cMIG,cCLIENTE,cCODIGO,cCODCLI,cTMPCLI,cTIPVENDA,cDOCA,cCNPJEMP AS STRING
//LOCAL aCAM AS ARRAY
//LOCAL oMANA5 AS USEMANA5
//LOCAL aDAD AS ARRAY
LOCAL oPROGWIN AS PROGWIN
LOCAL nPERC AS INT
LOCAL nLASTREC,nPOS,nCONTA AS DWORD    //x
LOCAL nCODITA
LOCAL cCODITA
LOCAL nHANDLE
LOCAL nHANDL2
//LOCAL oBUSCA AS XBUSCA
LOCAL oStmt AS SQLStatement
LOCAL lGRAVA AS LOGIC
//LOCAL oOSCRT AS USEREDE
LOCAL cVIR,cDATA,cHORA AS STRING

cVIR:=""
IF MDG("CSV")
   cVIR:=","	
ENDIF	



cMIG:=PEGEMPMIG(ZEMPRESA)

cCNPJEMP:="61381323000248"
IF cMIG="01"    
   NOP
ELSE
   cCNPJEMP:="61381323000167"
ENDIF


oProgWin := ProgWin{}
oProgWin:Caption:="Codigos MGR-EMB"
oProgWin:SHOW()


//aDAD:={zCURINI,"OSCRT.DBF",zCURDIR}
//oOSCRT:=USEREDE{aDAD}
//IF oOSCRT:nERRO#0
//   RETU SELF
//ENDIF
//OoSCRT:SETORDER(6) //CODCLI C 15 e CODIGOINT C24

    cDATA:=DToS(DATE())
    cHORA:=Left(StrTran(Time(),":",""),6)

oConn := SQLConnection{}
IF ! oConn:connect("ol_logix","","")
   alert("Erro na Conecção")
   RETURN .f.
ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()


   nHANDLE:=FCreate("C:\TEMP\EMBALAGEM.TXT")
   nHANDL2:=FCreate("C:\TEMP\I09_"+cMIG+".TXT")

    FWrite(nHANDL2,"SII00"+PadR(cCNPJEMP,30)+PadR(cCNPJEMP,30)+"00000")
    FWrite(nHANDL2,Chr(13)+Chr(10))


    nCONTA:=1 //comeca com um para somar o footer
    /*
    FWrite(nHANDL2,"IPLAN")
    FWrite(nHANDL2,"I09")
    FWrite(nHANDL2,"03")
    FWrite(nHANDL2,DToS(DATE()))
    FWrite(nHANDL2,Left(StrTran(Time(),":",""),6))
    FWrite(nHANDL2,CHR(13)+CHR(10))
    nCONTA++
    */

    FWrite(nHANDLE,"IPLAN")
    FWrite(nHANDLE,"I09")
    FWrite(nHANDLE,"03")
    FWrite(nHANDLE,"00000")
    FWrite(nHANDLE,cDATA)
    FWrite(nHANDLE,cHORA)
    FWrite(nHANDLE,cCNPJEMP)
	FWrite(nHANDLE,cCNPJEMP)
    FWrite(nHANDLE,Space(5))
    FWrite(nHANDLE,Space(5))
    FWrite(nHANDLE,Space(8))
    FWrite(nHANDLE,Space(8))
    FWrite(nHANDLE,Chr(13)+Chr(10))
    nCONTA++


//10 gm 11 electrolux 30 benteler 40 volks

cSQL:=" SELECT embal_itaesbra.cod_item,embal_itaesbra.cod_tip_venda,embal_itaesbra.qtd_padr_embal,embalagem.Pes_unit, "
cSQL+="          cliente_item.cod_item_cliente,embal_itaesbra.cod_embal,embalagem.den_embal,embal_itaesbra.doc,         "
cSQL+="          embal_itaesbra.cod_cliente,item.den_item_reduz,tipo_venda.den_tip_venda,cliente_sisco_970.planta,cliente_sisco_970.sintel   "
cSQL+="    FROM  embal_itaesbra "
cSQL+="  LEFT JOIN  embalagem   ON embal_itaesbra.cod_embal=embalagem.cod_embal "
cSQL+="  LEFT JOIN cliente_item ON embal_itaesbra.cod_item=cliente_item.cod_item  "
cSQL+="                           AND embal_itaesbra.cod_empresa=cliente_item.cod_empresa    "
cSQL+="                           AND embal_itaesbra.cod_cliente=cliente_item.cod_cliente_matriz "
cSQL+="  LEFT JOIN item ON   embal_itaesbra.cod_empresa = item.cod_empresa                         "
cSQL+="                     and   embal_itaesbra.cod_item = item.cod_item                            "
cSQL+="  LEFT JOIN tipo_venda ON  embal_itaesbra.cod_tip_venda=tipo_venda.cod_tip_venda                "
cSQL+="  LEFT JOIN cliente_sisco_970 ON embal_itaesbra.cod_cliente=cliente_sisco_970.cliente             "
cSQL+="                            AND EMBAL_ITAESBRA.cod_tip_venda=cliente_sisco_970.tipo_venda    "
cSQL+=" where embal_itaesbra.cod_empresa='01' "
cSQL+="    and embal_itaesbra.cod_cliente[1,2]<>'10'  and embal_itaesbra.cod_cliente[1,2]<>'11'  "
cSQL+="    and embal_itaesbra.cod_cliente[1,2]<>'30'  and embal_itaesbra.cod_cliente[1,2]<>'40'   "
cSQL+=" AND LENGTH(embal_itaesbra.cod_item)=12 "

     MemoWrit("C:\TEMP\I09.SQL",cSQL)


   oreg:= SQLSelect{cSQL,oconn}
   nPOS:=0
   nLASTREC:=100


   WHILE ! OREG:EoF	
   	   nPerc := INT(100* nPOS/ nLASTREC)
  	   nPOS++
  	   IF nPOS=101
  	      nPOS:=0
  	   ENDIF
  	   cCODIGO:=AllTrim(FIXSTR(oREG:FIELDGET("cod_item")))
       oPROGWIN:oDcProgBar:Position := nPerc	
       oProgWin:oDCMessage:textValue:=cCODIGO
       cCLIENTE:=AllTrim(FIXSTR(oREG:FIELDGET("cod_cliente")))
       cDOCA:=""
       IF Len(cCODIGO)=12



//         01-  4 N  4 0 Código da Empresa LOGIX
//         05-  8 C  4 0 Código do cliente logix
//         09- 32 C 24 0 Código Peca Itaesbra
//         33- 56 C 24 0 Código da Peça ( DO cliente ) que utiliza esta embalagem
//         57- 64 C  8 0 Código da Embalagem da Itaesbra)
//         65- 94 C 30 0 Descricao da embalagem
//         95-102 N  8 0 Capacidade ( qtde de peças por embalagem )
//        103-108 N  6 2 Peso da Embalagem  6 Casas + 2 casas decimais
//        109-132 C 24 0 Código de Embalagem ( DO cliente )



         nCODITA:=Val(oREG:FIELDGET("cod_embal"))
         cCODITA:=StrZero(nCODITA,8,0)

         cCODCLI:=PadR(FIXSTR(oREG:FIELDGET("cod_item_cliente")),24)
         IF At("MO",cCODCLI)>0
  	   	    cCodCLI:=SubStr(CcodCLI,1,At("MO",cCODCLI)-1)
    	 ENDIF	

          cDOCA:=FIXSTR(oREG:FIELDGET("doc"))



      	  cCODITA:=StrZero(nCODITA,3,0)+"*"+Space(20)
      	  DO CASE
      	  	 CASE nCODITA=1
      	  	 	  cCODITA:=PadR("04168",24)
      	  	 CASE nCODITA=2
      	  	 	  cCODITA:=PadR("1/2H20",24)
     	  	 CASE nCODITA=3
      	  	 	  cCODITA:=PadR("BIN 1002",24)
      	  	 CASE nCODITA=4
      	  	 	  cCODITA:=PadR("BIN 1012",24)
      	  	 CASE nCODITA=5
      	  	 	  cCODITA:=PadR("BIN 1013",24)
      	  	 CASE nCODITA=6
      	  	 	  cCODITA:=PadR("1019",24)
      	  	 CASE nCODITA=8
      	  	 	  cCODITA:=PadR("KLT2002",24)
      	  	 CASE nCODITA=9
      	  	 	  cCODITA:=PadR("KLT2004",24)
      	  	 CASE nCODITA=11
      	  	 	  cCODITA:=PadR("1/2H10ES",24)
      	  	 CASE nCODITA=12
      	  	 	  cCODITA:=PadR("KLT3214",24)
      	  	 CASE nCODITA=13
      	  	 	  cCODITA:=PadR("KLT4314",24)
      	  	 CASE nCODITA=14
      	  	 	  cCODITA:=PadR("KLT6428",24)
      	  	 CASE nCODITA=16
      	  	 	  cCODITA:=PadR("711",24)
      	  	 CASE nCODITA=17
      	  	 	  cCODITA:=PadR("721",24)
      	  	 CASE nCODITA=27
      	  	 	  cCODITA:=PadR("CX PAP",24)
      	  	 CASE nCODITA=28
      	  	 	  cCODITA:=PadR("H10",24)
      	  	 CASE nCODITA=29
      	  	 	  cCODITA:=PadR("H20",24)
      	  	 CASE nCODITA=32
      	  	 	  cCODITA:=PadR("1/2H10",24)
      	  	 CASE nCODITA=36
      	  	 	  cCODITA:=PadR("CX PAP PEQ",24)
      	  	 CASE nCODITA=49
      	  	 	  cCODITA:=PadR("04169",24)
      	  	 CASE nCODITA=50
      	  	 	  cCODITA:=PadR("1/2H10F",24)
      	  	 CASE nCODITA=52
      	  	 	  cCODITA:=PadR("1/2H20F",24)
      	  	 CASE nCODITA=53
      	  	 	  cCODITA:=PadR("302320",24)
      	  	 CASE nCODITA=54
      	  	 	  cCODITA:=PadR("402424",24)
      	  	 CASE nCODITA=55
      	  	 	  cCODITA:=PadR("C4253F",24)
      	  	 CASE nCODITA=56
      	  	 	  cCODITA:=PadR("C4253T",24)
      	  	 CASE nCODITA=57
      	  	 	  cCODITA:=PadR("H10F",24)
      	  	 CASE nCODITA=58
      	  	 	  cCODITA:=PadR("H10T",24)
      	  	 CASE nCODITA=59
      	  	 	  cCODITA:=PadR("H20F",24)
      	  	 CASE nCODITA=60
      	  	 	  cCODITA:=PadR("H20T",24)
      	  	 CASE nCODITA=61
      	  	 	  cCODITA:=PadR("KLT2001",24)
      	  	 CASE nCODITA=999
      	  	 	  cCODITA:=PadR("PADRAO",24)
      	  ENDCASE


          lGRAVA:=.T.
          cTMPCLI:=FIXSTR(oREG:FIELDGET("sintel"))
          IF Empty(cTMPCLI)
	          cTMPCLI:=ccliente
	          lGRAVA:=.F.
         ENDIF
         cTIPVENDA:=FIXSTR(oREG:FIELDGET("planta"))
         IF Empty(cTIPVENDA)
	         cTIPVENDA:=FIXSTR(oREG:FIELDGET("den_tip_venda")) //fabriCa 4J C1
	         cTIPVENDA:=StrTran(cTIPVENDA,"GM ","")
	         cTIPVENDA:=StrTran(cTIPVENDA,"BOSCH ","")
	         IF cTIPVENDA="GERAL"
	         	cTIPVENDA:=""
	         ENDIF
	       	 IF cCLIENTE="3000" .OR. cCLIENTE="3001"
	           	cTIPVENDA:="BCA"
	           	cDOCA:="0010"
	         ENDIF
         ENDIF
         IF Empty(cTIPVENDA)
         	lGRAVA:=.F.
         ENDIF

         IF lGRAVA
            FWrite(nHANDLE,"0001")
       	    FWrite(nHANDLE,PadR(ccliente,4))
       	    FWrite(nHANDLE,PadR(cCODIGO,24))
       	    FWrite(nHANDLE,PadR(cCODCLI,24))
            FWrite(nHANDLE,cCODITA)
       	    FWrite(nHANDLE,PadR(FIXSTR(oREG:FIELDGET("den_embal")),30))
       	    FWrite(nHANDLE,StrZero(FIXNUM(oREG:FIELDGET("qtd_padr_embal")),8,0))
      	    FWrite(nHANDLE,StrTran(StrZero(FIXNUM(oREG:FIELDGET("Pes_unit")),7,2),".",""))
    	    FWrite(nHANDLE,cCODITA)
        	FWrite(nHANDLE,Chr(13)+Chr(10))


          FWrite(nHANDL2,"ETQTA"+cVIR)             //1
          FWrite(nHANDL2,PadR(cTMPCLI,5)+cVIR)   //3
          FWrite(nHANDL2,"ITAES"+cVIR) //Space(5))            //3
          FWrite(nHANDL2,DToS(DATE())+cVIR)        //4
          FWrite(nHANDL2,Repl("0",10)+cVIR)         //5
          FWrite(nHANDL2,Space(4)+cVIR)            //6
          FWrite(nHANDL2,Space(35)+cVIR)           //7
          FWrite(nHANDL2,Space(8)+cVIR)           //8
          FWrite(nHANDL2,PadR(cTIPVENDA,20)+cVIR)          //9     ETQ_Fabrica
          FWrite(nHANDL2,Space(30)+cVIR)          //10
          FWrite(nHANDL2,PadR(cDOCA,20)+cVIR)          //11    ETQ_LocalDestino
          FWrite(nHANDL2,Space(30)+cVIR)          //12
          FWrite(nHANDL2,"P"+cVIR)           //13    ETQ_TipoFornec P(roducao) R(eposicao)
          FWrite(nHANDL2,PadR(Ccodcli,30)+cVIR)          //14     cliente codigo
          FWrite(nHANDL2,PadR(FIXSTR(oREG:FIELDGET("den_item_reduz")),30)+cVIR)          //15     descricao cliente
          FWrite(nHANDL2,PadR(Ccodigo,30)+cVIR)          //16     codigo do item
          FWrite(nHANDL2,Repl("0",13)+cVIR)        //17
          FWrite(nHANDL2,Space(3)+cVIR)           //18
          FWrite(nHANDL2,Space(8)+cVIR)           //19
          FWrite(nHANDL2,Space(6)+cVIR)           //20
          FWrite(nHANDL2,Space(8)+cVIR)           //21
          FWrite(nHANDL2,Space(15)+cVIR)          //22
          FWrite(nHANDL2,Space(12)+cVIR)          //23
          FWrite(nHANDL2,Space(10)+cVIR)          //24
          FWrite(nHANDL2,Space(200)+cVIR)         //25
          FWrite(nHANDL2,Space(20)+cVIR)          //26
          FWrite(nHANDL2,Space(15)+cVIR)          //27
          FWrite(nHANDL2,Space(5)+cVIR)           //28
          FWrite(nHANDL2,Space(8)+cVIR)           //29
          FWrite(nHANDL2,Space(9)+cVIR)           //30
          FWrite(nHANDL2,Repl("0",7)+cVIR)   //31
          FWrite(nHANDL2,Space(3)+cVIR)   //32
          FWrite(nHANDL2,StrTran(StrZero(FIXNUM(oREG:FIELDGET("Pes_unit")),7,0),".","")+cVIR)   //33 peso embalagem
          FWrite(nHANDL2,Space(3)+cVIR)   //34
          FWrite(nHANDL2,Repl("0",7)+cVIR)   //35
          FWrite(nHANDL2,Space(3)+cVIR)   //36
          FWrite(nHANDL2,Space(8)+cVIR)   //37
          FWrite(nHANDL2,Space(14)+cVIR)   //38
          FWrite(nHANDL2,Repl("0",3)+cVIR)   //39
          FWrite(nHANDL2,Space(1)+cVIR)   //40
          FWrite(nHANDL2,Space(3)+cVIR)   //41
          FWrite(nHANDL2,PadR(StrTran(FIXSTR(oREG:FIELDGET("den_embal"))," ",""),10)+cVIR)        //StrZero(nCODITA,10,0)+cVIR)   //42 codigo embalagem
          FWrite(nHANDL2,StrZero(FIXNUM(oREG:FIELDGET("qtd_padr_embal")),7,0)+cVIR)   //43 qtde padrao embalagem
          FWrite(nHANDL2,Space(10)+cVIR)   //44
          FWrite(nHANDL2,Repl("0",7)+cVIR)   //45
          FWrite(nHANDL2,PadR(FIXSTR(oREG:FIELDGET("den_embal")),130)+cVIR)   //46 -130
          FWrite(nHANDL2,Space(15)+cVIR)   //47
          FWrite(nHANDL2,Space(15)+cVIR)   //48
          FWrite(nHANDL2,Space(15)+cVIR)   //49
          FWrite(nHANDL2,Space(15)+cVIR)   //50
          FWrite(nHANDL2,Space(5)+cVIR)   //51
          FWrite(nHANDL2,Space(7)+cVIR)   //52
          FWrite(nHANDL2,Space(15)+cVIR)   //53
          FWrite(nHANDL2,Space(4)+cVIR)   //54
          FWrite(nHANDL2,Space(2)+cVIR)   //55 no manual esta com duas sequencias
          FWrite(nHANDL2,Space(3)+cVIR)   //55
          FWrite(nHANDL2,Space(3)+cVIR)   //56
          FWrite(nHANDL2,Space(20)+cVIR)   //57
          FWrite(nHANDL2,Space(30)+cVIR)   //58
          FWrite(nHANDL2,Space(15)+cVIR)   //59
          FWrite(nHANDL2,Space(3)+cVIR)   //60
          FWrite(nHANDL2,Space(10)+cVIR)   //61
          FWrite(nHANDL2,Space(12)+cVIR)   //62
          FWrite(nHANDL2,Chr(13)+Chr(10))
          nCONTA++
         ENDIF




       ENDIF	
       Oreg:Skip()
   ENDDO
  oREG:Close()

FWrite(nHANDL2,"FPLAN")
FWrite(nHANDL2,StrZero(Nconta,5,0))
FWrite(nHANDL2,Chr(13)+Chr(10))
FWrite(nHANDL2,"SFI     00001")
FWrite(nHANDL2,Chr(13)+Chr(10))


FClose(nHANDLE)
FClose(NHANDL2)

//oOSCRT:CLOSE()
oConn:Disconnect()
oPROGWIN:EndDialog()
alert("Termino Importaçäo","Encerrado")




METHOD XGERAMGRPC() 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL cSQL,cMIG,cCODIGO,cNOME,cCODCLI,cCNPJ,cDATA,cHORA,cCNPJEMP,cSALDO,cCODOLD AS STRING
LOCAL oPROGWIN AS PROGWIN
LOCAL nPERC AS INT
LOCAL nLASTREC,nPOS,nCONTA,nSALDO AS DWORD
LOCAL nHANDLE
LOCAL oSTMT AS SQLStatement
LOCAL lGRV AS LOGIC


oProgWin := ProgWin{}
oProgWin:Caption:="Codigos MGR"
oProgWin:SHOW()
cMIG:=PEGEMPMIG(ZEMPRESA)

cCNPJEMP:="61381323000248"
IF cMIG="01"  
	NOP
ELSE
   cCNPJEMP:="61381323000167"
ENDIF


lGRV:=MDG("Gravar CNPJ")

oConn := SQLConnection{}
IF ! oConn:connect("ol_logix","","")
   alert("Erro na Conecção")
   RETURN .f.
ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()
    nHANDLE:=FCreate("C:\TEMP\I01_"+cMIG+".TXT")
    nCONTA:=1 //comeca com um para somar o footer
    cDATA:=DToS(DATE())
    cHORA:=Left(StrTran(Time(),":",""),6)

//1	ID	Identificação DO Registro (SII)	M	A	3	1	3
//2	VersInter	Versão DO Intercâmbio 	M	A	2	4	5
//3	Transmissor	Identificação DO Transmissor (CNPJ)	M	A	30	6	35
//4	Receptor	Identificação DO Receptor (CNPJ)	M	A	30	36	65
//5	CtrlMovto	Controle de Movimento	M	N	5	66	70


    FWrite(nHANDLE,"SII00"+PadR(cCNPJEMP,30)+PadR(cCNPJEMP,30)+"00000")
    FWrite(nHANDLE,Chr(13)+Chr(10))

    FWrite(nHANDLE,"IPLAN")
    FWrite(nHANDLE,"I01")
    FWrite(nHANDLE,"04")
    FWrite(nHANDLE,"00000")
    FWrite(nHANDLE,cDATA)
    FWrite(nHANDLE,cHORA)
    FWrite(nHANDLE,cCNPJEMP)
    FWrite(nHANDLE,cCNPJEMP)
    FWrite(nHANDLE,Space(5))
    FWrite(nHANDLE,Space(5))
    FWrite(nHANDLE,Space(8))
    FWrite(nHANDLE,Space(8))
    FWrite(nHANDLE,Chr(13)+Chr(10))
    nCONTA++
//	1	IdentReg	Identificação DO Registro (IPLAN)	M	A	5	1	5
//	2	Docto	Identificação DO Docto (I01)	M	A 	3	6	8
//	3	VersDocto	Versão DO Docto (04)	M	A 	2	9	10
//	4	NumCtrlMovto	Número de controle movto.	M	N	5	11	15
//	5	DataMovto	Data de Geração dos Dados (Formato: AAAAMMDD)	M	D	8	16	23
//	6	HoraMovto	Hora de Geração dos Dados (Formato: HHMMSS)	M	N	6	24	29
//	7	CodCliente	Informar pelo menos um CNPJ das unidades de negócio DO grupo.	M	N	14	30	43
//	8	CodFornec	Informar pelo menos um CNPJ das unidades de negócio DO grupo.	M	N	14	44	57
//	9	CodCliente	Não informar	O	A	5	58	62
//	10	CodFornec	Não informar	O	A	5	63	67
//	11	CodTrans	Não informar	O	A	8	68	75
//	12	CodRecep	Não informar	O	A	8	76	83

cSQL:=" SELECT ITEM.cod_item "
cSQL+=" 	,ITEM.den_item_reduz "
cSQL+=" 	,nvl_integer(estoque.qtd_liberada) AS estoque "
cSQL+=" FROM item "
cSQL+=" LEFT JOIN estoque ON ITEM.cod_empresa = estoque.cod_empresa "
cSQL+=" 	AND item.cod_item = estoque.cod_item "
cSQL+=" WHERE ITEM.cod_empresa ='" +CMIG+ "'"
cSQL+=" 	AND length(ITEM.cod_item) = 12 "
cSQL+=" ORDER BY ITEM.cod_item "


//    cSQL:=" SELECT  cod_item,den_item_reduz From item "
//    cSQL+=" where  cod_empresa='" +CMIG+ "'"
//    cSQL+=" and item.cod_item[1,2]<>'10' "
//    cSQL+=" and item.cod_item[1,2]<>'11' "
//    cSQL+=" and item.cod_item[1,2]<>'30' "
//    cSQL+=" and item.cod_item[1,2]<>'40' "
//    cSQL+=" AND length(cod_item)=12"
//    cSQL+=" order by cod_item"
//estoque passando todas as pecas
//10 gm 11 electrolux 30 benteler 40 volks

     MemoWrit("C:\TEMP\I01.SQL",cSQL)

    oreg:= SQLSelect{cSQL,oconn}


    nPOS:=0
    nLASTREC:=100

   WHILE ! OREG:EoF	
   	   nPerc := INT(100* nPOS/ nLASTREC)
  	   nPOS++
  	   IF nPOS=101
  	      nPOS:=0
  	   ENDIF
  	   cCODIGO:=AllTrim(FIXSTR(oREG:FIELDGET("cod_item")))
  	   cNOME:=AllTrim(FIXSTR(oREG:FIELDGET("den_item_reduz")))
  	   nSALDO:=oREG:FIELDGET("estoque")
//  	   alert(Str(nSALDO))
  	   cSALDO:=StrZero(nSALDO,17)
  	   cSALDO+="0000" //21,4 casas decimais
//  	   alert(cSALDO)
//  	   RETURN
//  	   cSALDO:=StrZero(oREG:FIELDGET("estoque"),17)+"0000" //21,4 casas decimais
       oPROGWIN:oDcProgBar:Position := nPerc	
       oProgWin:oDCMessage:textValue:=cCODIGO
       IF Len(cCODIGO)=12
       	  FWrite(nHANDLE,"EST01")
      	  FWrite(nHANDLE,PadR(Ccodigo,30))
       	  FWrite(nHANDLE,PadR(cNOME,30))
       	  FWrite(nHANDLE,cSALDO) //Repl("0",21)) //Estoque
       	  FWrite(nHANDLE,"PC ")
          FWrite(nHANDLE,Space(14)) //CNPJ unidade opcional
       	  FWrite(nHANDLE,Space(5))      //familia
       	  FWrite(nHANDLE,Space(5))   //celula
       	  FWrite(nHANDLE,Space(5)) //sub unidade
       	  FWrite(nHANDLE,Space(5))   //sub classificacao
       	  FWrite(nHANDLE,Chr(13)+Chr(10))

/*
       	  	1	IdentReg	Identificação DO Registro (EST01)	M	A	5	1	5
	2	CodItem	Código DO Item	M	A	30	6	35
	3	DescItem	Descrição DO Item	O 	A	30	36	65
	4	QtdeEstoq	Quantidade de Itens em Estoque (prevendo sinal negativo, caso seja positivo colocar um espaço em branco)	O	N	21,4	66	86
	5	UnidMed	Unidade de Medida DO Item	O	A	3	87	89
	6	CNPJEmp	CNPJ da Unidade de Negócio (número puro). Caso seja preenchido, o CNPJ será validado contra o Cadastro de Empresas. Caso não seja utilizado, preencher com espaços	O	N	14	90	103
	7	CodClass	Código de Classificação DO Item (família). Caso seja preenchido o código será validado contra o Cadastro de Classificações.	O	A	5	104	108
	8	CodCelula	Código da Célula de Produção DO Item. Caso seja preenchido o código será validado contra o Cadastro de Células. 	O	A	5	109	113
	9	SubUnidade	Código da Sub-Unidade	O	A	5	114	118
	10	Sub-Classificação	Código da Sub-Classificação	O	A	5	119	123
*/

  	      nCONTA++
       ENDIF	
       Oreg:Skip()
   ENDDO
   oREG:Close()



   FWrite(nHANDLE,"FPLAN")
   FWrite(nHANDLE,StrZero(Nconta,5,0))
   FWrite(nHANDLE,Chr(13)+Chr(10))
   FWrite(nHANDLE,"SFI     00001")
   FWrite(nHANDLE,Chr(13)+Chr(10))
   FClose(nHANDLE)



    nHANDLE:=FCreate("C:\TEMP\I03_"+cMIG+".TXT")
    nCONTA:=1 //comeca com um para somar o footer

    FWrite(nHANDLE,"SII00"+PadR(cCNPJEMP,30)+PadR(cCNPJEMP,30)+"00000")
    FWrite(nHANDLE,Chr(13)+Chr(10))


    FWrite(nHANDLE,"IPLAN")
    FWrite(nHANDLE,"I03")
    FWrite(nHANDLE,"08")
    FWrite(nHANDLE,"00000")
    FWrite(nHANDLE,cDATA)
    FWrite(nHANDLE,cHORA)
    FWrite(nHANDLE,cCNPJEMP)
	FWrite(nHANDLE,cCNPJEMP)
    FWrite(nHANDLE,Space(5))
    FWrite(nHANDLE,Space(5))
    FWrite(nHANDLE,Space(8))
    FWrite(nHANDLE,Space(8))
    FWrite(nHANDLE,Chr(13)+Chr(10))
    nCONTA++

/*
1	IdentReg	Identificação DO Registro (IPLAN)	M	A	5	1	5
2	Docto	Identificação DO Docto (I03)	M	A 	3	6	8
3	VersDocto	Versão DO Docto (08)	M	A 	2	9	10
4	NumCtrlMovto	Número de controle movto.	M	N	5	11	15
5	DataMovto	Data de Geração dos Dados (Formato: AAAAMMDD)	M	D	8	16	23
6	HoraMovto	Hora de Geração dos Dados (Formato: HHMMSS)	M	N	6	24	29
7	CodCliente	Informar pelo menos um CNPJ das unidades de negócio DO grupo.	M	N	14	30	43
8	CodFornec	Informar pelo menos um CNPJ das unidades de negócio DO grupo.	M	N	14	44	57
9	CodCliente	Não informar	O	A	5	58	62
10	CodFornec	Não informar	O	A	5	63	67
11	CodTrans	Não informar	O	A	8	68	75
12	CodRecep	Não informar	O	A	8	76	83
*/


    cSQL:=" SELECT  cliente_item.cod_cliente_matriz, cliente_item.cod_item,cliente_item.cod_item_cliente,item.den_item,item.pes_unit,clientes.num_cgc_cpf"
    cSQL+=" FROM    cliente_item,Item,clientes"
    cSQL+=" WHERE   cliente_item.cod_empresa = item.cod_empresa"
    cSQL+=" and     cliente_item.cod_item = item.cod_item"
    cSQL+=" and     cliente_item.cod_cliente_matriz=clientes.cod_cliente"
    cSQL+=" and     cliente_item.cod_empresa='" +CMIG+ "'"
    cSQL+=" aND    length(cliente_item.cod_item) = 12 "
    cSQL+=" and cliente_item.cod_item[1,2]<>'10' "
    cSQL+=" and cliente_item.cod_item[1,2]<>'11' "
    cSQL+=" and cliente_item.cod_item[1,2]<>'30' "
    cSQL+=" and cliente_item.cod_item[1,2]<>'40' "

    cSQL+=" order by item.cod_item"

//10 gm 11 electrolux 30 benteler 40 volks

     MemoWrit("C:\TEMP\I03.SQL",cSQL)

    oreg:= SQLSelect{cSQL,oconn}


    nPOS:=0
    nLASTREC:=100

   WHILE ! OREG:EoF	
   	   nPerc := INT(100* nPOS/ nLASTREC)
  	   nPOS++
  	   IF nPOS=101
  	      nPOS:=0
  	   ENDIF
  	   cCODIGO:=AllTrim(FIXSTR(oREG:FIELDGET("cod_item")))
  	   cCODCLI:=AllTrim(FIXSTR(oREG:FIELDGET("cod_item_cliente")))
  	   IF At("MO",cCODCLI)>0
    	  cCODOLD:=cCodCLI
  	   	  cCodCLI:=SubStr(CcodCLI,1,At("MO",cCODCLI)-1)
  	   	   IF Empty(cCODCLI)
              cCODCLI:=cCodOLD
           ENDIF
  	   ENDIF	
       cCNPJ:=SubStr(TIRAOUT(AllTrim(FIXSTR(oREG:FIELDGET("num_cgc_cpf")))  	   ),2) //Logix comeca com zero o cnpj
       oPROGWIN:oDcProgBar:Position := nPerc	
       oProgWin:oDCMessage:textValue:=cCODIGO
       IF Len(cCODIGO)=12
       	  FWrite(nHANDLE,"REIT1")                //1
     	  FWrite(nHANDLE,PadR(cCODIGO,30))       //2
       	  FWrite(nHANDLE,PadR(cCODCLI,30))       //3
       	  IF lGRV
         	 FWrite(nHANDLE,PadR(cCNPJ,14))         //CNPJParc  //4
          ELSE
        	 FWrite(nHANDLE,Space(14))
          ENDIF	
       	  FWrite(nHANDLE,Space(14))           //CNPJEmp   //5
      	  FWrite(nHANDLE,"TODOS")                //6
       	  FWrite(nHANDLE,PadR("TODOS",20))       //7
       	  FWrite(nHANDLE,Space(10))              //8
       	  FWrite(nHANDLE,Space(3))               //9
      	  FWrite(nHANDLE,Repl("0",17))           //10
      	  FWrite(nHANDLE,Repl("0",7))            //11
      	  FWrite(nHANDLE,Repl("0",12))      	 //12
		  FWrite(nHANDLE,PadR("TODOS",20))       //13
		  /*
      	  IF Lgrv
        	  FWrite(nHANDLE,PadR(cCNPJ,20))             //13
          ELSE
        	  FWrite(nHANDLE,Space(20))              //13
          ENDIF	
          */
          FWrite(nHANDLE,"1")
       	  FWrite(nHANDLE,Chr(13)+Chr(10))
/*
 1	IdentReg	Identificação DO Registro (REIT1)	M	A	5	1	5
2	CodItemEmp	Código DO Item Empresa	M	A	30	6	35
3	CodItemParc	Código DO Item Parceiro	M	A	30	36	65
4	CNPJParc	CNPJ DO Parceiro (Somente Números)	M	N	14	66	79
5	CNPJEmp	CNPJ da Unidade de Negócio (Somente Números). Caso seja preenchido, o CNPJ será validado contra o Cadastro de Empresas. Caso não seja utilizado, preencher com espaços.	O	N	14	80	93
6	TipoFornParc	Tipo de Fornecimento (Válidos P, R, E, X, D, A, TODOS)	M	A	5	94	98
7	FabricaParc	Fábrica de Entrega (Válidos: Específico, TODOS)	M	A	20	99	118
8	AltTecParc	Alteração Técnica	O	A	10	119	128
9	UnidMedParc	Unidade de Medida	O	A	3	129	131
10	ValorUnit	Valor Unitário DO Item	O	N	17	132	148
11	QtdMultEmb	Quantidade de Peças por Embalagem	O	N	7	149	155
12	QtdLoteMinimo	Quantidade Mínima de Peças por Mês (utilizado PARA validação por Lote Mínimo Mensal)	O	N	12	156	167
13	LocalEntrega	LOCAL de Entrega (Válidos: Específico, TODOS)	M	A	20	168	187
14	TodosClientesGrupo	0 - Indica se o relacionamento é com um cliente específico.1 - Indica se o relacionamento é com todas AS empresas DO grupo DO cliente.  	M	N	1	188	188
*/

   	      nCONTA++
       ENDIF	
       Oreg:Skip()
   ENDDO
   oREG:Close()

   FWrite(nHANDLE,"FPLAN")
   FWrite(nHANDLE,StrZero(Nconta,5,0))
   FWrite(nHANDLE,Chr(13)+Chr(10))
   FWrite(nHANDLE,"SFI     00001")
   FWrite(nHANDLE,Chr(13)+Chr(10))
   FClose(nHANDLE)





oConn:Disconnect()
oPROGWIN:EndDialog()

alert("Termino Exportacao","Encerrado")




METHOD XIMPCOD 
	IMPCOD(1,8,.T.)

METHOD XIMPESTINT() 
	LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cSQL,cMIG AS STRING
    LOCAL aCAM AS ARRAY
    LOCAL oARQ AS USEREDE
  //  LOCAL oMANA5 AS USEMANA5
    LOCAL aDAD AS ARRAY
    LOCAL oPROGWIN AS PROGWIN
    LOCAL nPERC AS INT
    LOCAL nLASTREC,nPOS AS DWORD
    LOCAL oSTMT AS SQLStatement


   cMIG:=PEGEMPMIG(ZEMPRESA)

   aDAD:={zCURINI,"ESTQINT.DBF",ZCURDIR}
   oARQ:=USEREDE{aDAD,.F.}
   IF oARQ:nERRO#0
       RETURN .f.
   ENDIF
   oARQ:ZAP()


  oProgWin := ProgWin{}
  oProgWin:Caption:="Codigos"
  oProgWin:SHOW()

   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
   	  RETURN .f.
   ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()


   cSQL:="SELECT * FROM ESTOQUE "
   cSQL+=" WHERE COD_EMPRESA='" +CMIG+ "'"


   oreg:= SQLSelect{cSQL,oconn}


   acam:=ARRAY(11)



    nPOS:=0
    nLASTREC:=100


   WHILE ! OREG:EoF	
   	   nPerc := INT(100* nPOS/ nLASTREC)
  	   nPOS++
  	   IF nPOS=101
  	      nPOS:=0
  	   ENDIF
       oPROGWIN:oDcProgBar:Position := nPerc	
       oProgWin:oDCMessage:textValue:=oREG:FIELDGET("COD_ITEM")

   	   ACAM[1]:=oREG:FIELDGET("COD_EMPRESA")
       ACAM[2]:=oREG:FIELDGET("COD_ITEM")
       ACAM[3]:=oREG:FIELDGET("QTD_LIBERADA")
       ACAM[4]:=oREG:FIELDGET("QTD_IMPEDIDA")
       ACAM[5]:=oREG:FIELDGET("QTD_REJEITADA")
       ACAM[6]:=oREG:FIELDGET("QTD_LIB_EXCEP")
       ACAM[7]:=oREG:FIELDGET("QTD_DISP_VENDA")
       ACAM[8]:=oREG:FIELDGET("QTD_RESERVADA")
       ACAM[9]:=oREG:FIELDGET("DAT_ULT_INVENT")
       ACAM[10]:=oREG:FIELDGET("DAT_ULT_ENTRADA")
       ACAM[11]:=oREG:FIELDGET("DAT_ULT_SAIDA")


        OARQ:APPEND()
   	  oarq:FIELDPUT("COD_EMPRES",acam[1])
      oarq:FIELDPUT("COD_ITEM",acam[2])
      oarq:FIELDPUT("QTD_LIBERA",acam[3])
      oarq:FIELDPUT("QTD_IMPEDI",acam[4])
      oarq:FIELDPUT("QTD_REJEIT",acam[5])
      oarq:FIELDPUT("QTD_LIB_EX",acam[6])
      oarq:FIELDPUT("QTD_DISP_V",acam[7])
      oarq:FIELDPUT("QTD_RESERV",acam[8])
      oarq:FIELDPUT("DAT_ULT_IN",acam[9])
      oarq:FIELDPUT("DAT_ULT_EN",acam[10])
      oarq:FIELDPUT("DAT_ULT_SA",acam[11])
      Oreg:Skip()
   ENDDO

  OARQ:Close()
  oREG:Close()
  oConn:Disconnect()
  oPROGWIN:EndDialog()


  alert("Termino Importaçäo","Encerrado")

 SELF:XINTEXP()

METHOD XINTEXP() 
IF MDG("Exportar Produtos")	
   GRVESTINT("MS01")	
ENDIF
IF MDG("Exportar Componentes")	
   GRVESTINT("MT01")	
ENDIF
IF MDG("Exportar Materia Prima")	
  GRVESTINT("MU01")	
ENDIF
IF MDG("Exportar Consumiveis")	
   GRVESTINT("MW05")	
ENDIF
IF MDG("Exportar Itens Manutencao")	
   GRVESTINT("MW07")	
ENDIF
IF MDG("Exportar Tratamentos")	
   GRVESTINT("MP03")	
ENDIF
IF MDG("Exportar Produtos-Seq Proc.")	
   GRVESTINT("MS06")		
ENDIF
IF MDG("Ordem Producao")		
   GRVESTINT("OP01")			
ENDIF	
	

METHOD XWRPTMOC() 
SELF:XWRPTGRP("MOC","")		


METHOD XWRPTPCP() 
SELF:XWRPTGRP("PCP","")		

METHOD XWRPTPE() 
SELF:XWRPTGRP("PE","")		

METHOD XXLSELE 
LOCAL cDIR, cEXE, cCODNEW AS STRING
LOCAL nFout AS PTR

//   IF ! entramenu("PCP",nPOS)
//	   RETURN SELF
 //   ENDIF	

    cCODNEW := PEGINIVAL(ZCURINI,"ELECTROLUX","IMPXLSELE")
  IF ! File(cCODNEW)
       alert("Nao Encontrado" + cCODNEW)
      RETURN SELF
   END IF
cDIR:=GetFileNameFromPath(cCODNEW)
cEXE:=GetPathFromFileName(cCODNEW)
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz(cEXE),String2Psz(""),String2Psz(cDIR),SW_SHOWNORMAL)
ShellExecuteErro(nFout) 


END CLASS
