FUNCTION IMPCLI()
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL cSQL,cPESSOA AS STRING
LOCAL aDAD,Aret AS ARRAY
LOCAL OMA01 AS USEREDE
LOCAL nPOS,nPOSMA01,nLASTREC AS DWORD
LOCAL nPERC AS INT
LOCAL cCGC AS STRING
LOCAL cCOGNOME AS STRING
LOCAL oPROGWIN AS PROGWIN
LOCAL oSTMT AS SQLStatement
LOCAL oMD10,oCIDCONV AS USEREDE
LOCAL cESTADO,cCIDADE,cDDD AS STRING

//SELF:POINTER:=POINTER{POINTERHOURGLASS}
oConn := SQLConnection{}
IF ! oConn:connect("ol_logix","","")
   alert("Erro na Conecção")
   RETURN .F.
ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

aDAD:={zCURINI,"MA01.DBF",zCURDIR,aDIR}
OMA01:=USEREDE{aDAD}
IF OMA01:nERRO#0
   Oconn:Disconnect()
   RETU .F.
ENDIF
OMA01:SETORDER(3)


aRET:={zCURINI,"CIDCONV.DBF",zCURDIR}
oCIDCONV:=USEREDE{aRET}
IF oCIDCONV:nERRO#0
   alert("Outro Usuario Arquivo CIDCONV Aberto - Tente Depois","Erro Abrindo o Arquivo")
   Oconn:Disconnect()
   Oma01:close()
   RETU .F.
ENDIF	


aRET:={zCURINI,"MD10.DBF",zCURDIR}
oMD10:=USEREDE{aRET}
IF oMD10:nERRO#0
   alert("Outro Usuario Arquivo MD10 Aberto - Tente Depois","Erro Abrindo o Arquivo")
   Oconn:Disconnect()
   Oma01:close()
   oCIDCONV:CLOSE()
   RETU .F.
ENDIF	



nPOSMA01:=1

oProgWin := ProgWin{}
oProgWin:Caption:="Clientes"
oProgWin:SHOW()


csql:=" SELECT clientes.*,cnpjcpf(clientes.num_cgc_cpf) AS cgc,pessoa(clientes.num_cgc_cpf) as PESSOA,cidades.den_cidade,vdp_cliente_compl.email,vdp_cli_parametro.texto_parametro  "
csql+="        , cliente_grupo_970.cognome_grupo"
csql+=" FROM clientes LEFT JOIN cidades ON clientes.cod_cidade = cidades.cod_cidade"
csql+="               LEFT JOIN vdp_cliente_compl ON clientes.cod_cliente = vdp_cliente_compl.cliente"
csql+="               LEFT JOIN vdp_cli_parametro ON clientes.cod_cliente = vdp_cli_parametro.cliente  and vdp_cli_parametro.parametro = 'ins_municipal'"
csql+="                LEFT JOIN CLIENTE_GRUPO_970 ON CLIENTES.cod_cliente = cliente_grupo_970.cod_cliente "
//   cSQL = " SELECT clientes.*,cidades.den_cidade,vdp_cliente_compl.email "
//     cSQL = cSQL & " FROM clientes LEFT JOIN cidades ON clientes.cod_cidade = cidades.cod_cidade"
//     cSQL = cSQL & "               LEFT JOIN vdp_cliente_compl ON clientes.cod_cliente = vdp_cliente_compl.cliente"


oreg:= SQLSelect{cSQL,oconn}


   nLASTREC:=100
   nPOS:=0


   WHILE ! OREG:EoF	


   	    cPESSOA:=oREG:FIELDGET("pessoa")
        cCGC   :=oREG:FIELDGET("cgc")

     	NPerc := INT(100* nPOS/ nLASTREC)
  	    nPOS++
  	    IF nPOS=101
  	       nPOS:=0
  	    ENDIF
        oProgWin:oDcProgBar:Position := nPerc
        oProgWin:oDCMessage:textValue:=cCGC

        IF VALCGC(cCGC,,.F.)  .or. Valcpf(CCGC,.F.)
           NOP
        ELSE	
           IF SubStr(cCGC,11,4)<>'9999'	    //cnpj 9999 genericos logix exportacao
              cCGC:=""
           ENDIF
        ENDIF


        IF Len(cCGC)>0
           cCOGNOME:=AllTrim(FIXSTR(oREG:FIELDGET("nom_reduzido")))
           IF Len(AllTrim(cCOGNOME))=0
              cCOGNOME:=FIXSTR(oREG:FIELDGET("nom_cliente"))
           ENDIF	
           oMA01:SETORDER(4) //CNPJ
           oMA01:GOTOP()
 	       IF ! oMA01:SEEK(CCGC)
	          oMA01:SETORDER(1)
	          oMA01:GOTOP()
      	      WHILE oMA01:SEEK(nPOSMA01)
      	 	    nPOSMA01:=nPOSMA01+1
      	 	    oMA01:GOTOP()
      	      ENDDO	
      	      oMA01:APPEND()
      	      oMA01:FIELDPUT("NUMERO",nPOSMA01)
      	      oMA01:FIELDPUT("CGC",cCGC)
              nPOSMA01:=nPOSMA01+1
           ENDIF
           cDDD:=PEGDDD(FIXSTR(oREG:FIELDGET("num_telefone")))
           cESTADO:=FIXSTR(SubStr(oREG:FIELDGET("cod_cidade"),1,2))
           cCIDADE:=FIXSTR(oREG:FIELDGET("den_cidade"))
           oCIDCONV:GOTOP()
           IF oCIDCONV:SEEK(cESTADO+cCIDADE)
              cCIDADE:=AllTrim(oCIDCONV:FIELDGET("CIDDES"))
           ENDIF
           IF Empty(cDDD)
              oMD10:GOTOP()
              IF oMD10:SEEK(cESTADO+cCIDADE)
              	 cDDD:=oMD10:FIELDGET("DDD")
              ENDIF	
           ENDIF




           oMA01:FIELDPUTE("NOME",FIXSTR(oREG:FIELDGET("nom_cliente")))
     	   oMA01:FIELDPUTE("ENDERECO",FIXSTR(oREG:FIELDGET("end_cliente")))
     	   oMA01:FIELDPUTE("BAIRRO",FIXSTR(oREG:FIELDGET("den_bairro")))
     	   oMA01:FIELDPUTE("CIDADE",cCIDADE)
     	   oMA01:FIELDPUTE("ESTADO",cESTADO)
     	   oMA01:FIELDPUTE("CEP",FIXSTR(oREG:FIELDGET("cod_cep")))
     	   oMA01:FIELDPUTE("INSCR",FIXSTR(oREG:FIELDGET("ins_estadual")))
     	   oMA01:FIELDPUTE("CONTATO",FIXSTR(oREG:FIELDGET("nom_contato")))
           oMA01:FIELDPUTE("PESSOA",cPESSOA)
           oMA01:FIELDPUTE("COGNOME",cCOGNOME)
           oMA01:FIELDPUTE("CODIGOINT",FIXSTR(oREG:FIELDGET("cod_cliente")))
           OMA01:FIELDPUTE("DDD",cDDD)
           OMA01:FIELDPUTE("TELEFONE",PEGTEL(FIXSTR(oREG:FIELDGET("num_telefone"))))
           OMA01:FIELDPUTE("EMAIL",FIXSTR(oREG:FIELDGET("email")))
           oma01:FIELDPUTe("IMUNICIPI",FIXSTR(oREG:FIELDGET("texto_parametro")))
           oMA01:FIELDPUTE("GRUPOEMP",FIXSTR(oREG:FIELDGET("cognome_grupo")))


        ENDIF
   	   Oreg:skip()
   ENDDO	
   Oreg:close()

   nLASTREC:=oMA01:RecCount
   oMA01:GOTOP()
   WHILE ! OMA01:EOF
  	  nPerc := INT(100* nPOS/ nLASTREC)
  	  nPOS++
      oProgWin:oDcProgBar:Position := nPerc
      oProgWin:oDCMessage:textValue:=oMA01:FIELDGET("CGC")
      IF Empty(oMA01:FIELDGET("CNUMERO"))
         oMA01:FIELDPUT("CNUMERO",StrZero(oMA01:FIELDGET("NUMERO"),8))
      ENDIF
      Oma01:Skip()	
   ENDDO
   OMA01:CLOSE()


oPROGWIN:EndDialog()
//SELF:POINTER:=POINTER{POINTERARROW}

FUNCTION IMPCOD(nINI,nFIM,lPERG)
LOCAL cARQ,cSQL,cGRUPO,cCODCLI,cCODIGO,cCOD3,cCLICODINT,cMIG AS STRING
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL aDAD,aGMFI AS ARRAY
LOCAL oSERVER,oSERVE2,oSERVE3,oMA01 AS USEMANA5
LOCAL oCD AS USEREDE
LOCAL nLASTREC,nPOS,nCONTA,X,nCLIENTE AS DWORD
LOCAL nPERC AS INT
LOCAL lGRAVA,lSUBCOD,lMS01 AS LOGIC
LOCAL oPROGWIN AS PROGWIN
LOCAL oSTMT AS SQLStatement
LOCAL nHANDLE

IF ValType(nINI)#"N"
   nINI:=1
ENDIF
IF ValType(nFIM)#"N"
   nFIM:=8
ENDIF

cMIG:=PEGEMPMIG(zempRESA)

//SELF:POINTER:=POINTER{POINTERHOURGLASS}
oConn := SQLConnection{}
IF ! oConn:connect("ol_logix","","")
   alert("Erro na Conecção")
   RETURN .F.
ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()


oProgWin := ProgWin{}
oProgWin:Caption:="Codigos"
oProgWin:SHOW()

lMS01:=.F.

nHANDLE:=FCreate("d:\TEMP\IPI.TXT")

FOR X:=nINI TO nFIM
	DO CASE
	   CASE X=1
  	       cARQ:="MS01X"
  	       cGRUPO:="<70 OR gru_ctr_estoq=72 OR gru_ctr_estoq=73)"
	   CASE X=2
  	       cARQ:="MT01"
  	       cGRUPO:="=71)"
	   CASE X=3
  	       cARQ:="MU01"
      	   cGRUPO:="=70)"
	   CASE X=4
  	       cARQ:="MP03X"
      	   cGRUPO:="=73 OR gru_ctr_estoq=72)"
	   CASE X=5
  	       cARQ:="MR01"
	       cGRUPO:="=75)"
	   CASE X=6
            cARQ:="MW05"
            cGRUPO:=">=80) "
	   CASE X=7
            cARQ:="MW07"
            cGRUPO:=">=80  and gru_ctr_estoq<>88 and gru_ctr_estoq<>99)"
	   CASE X=8
  	       cARQ:="MQ01X"
  	       cGRUPO:="<70 OR gru_ctr_estoq=72)"

	ENDCASE	

   IF lPERG
      IF ! MDG("Sincronizar "+Carq)
     	  LOOP
      ENDIF	
  ENDIF

   aDAD:={zCURINI,cARQ,zCURDIR,aDIR}
   oSERVER:=USEMANA5{aDAD}
   IF oSERVER:nERRO#0
       RETU .F.
   ENDIF
   IF cARQ=="MS01X" .OR. cARQ=="MP03X" .OR. cARQ=="MQ01X"
      oSERVER:SETORDER(3)
   ENDIF	
   IF cARQ=="MS01X"
   	  lMS01:=.T.
   ENDIF	





   cSQL:="select * from item "
   CSQL+=" where (gru_ctr_estoq"+cGRUPO
   cSQL+=" AND COD_EMPRESA='" +CMIG+ "'"

   oreg:= SQLSelect{cSQL,oconn}


   nLASTREC:=100
   nPOS:=0
   nCONTA:=0


   WHILE ! OREG:EoF	
     	NPerc := INT(100* nPOS/ nLASTREC)
       oProgWin:oDcProgBar:Position := nPerc

  	    nPOS++
  	    nCONTA++
  	    IF nPOS=101
  	       nPOS:=0
  	    ENDIF
  	    cCODIGO:=AllTrim(FIXSTR(oREG:FIELDGET("COD_ITEM")))
  	    cCOD3:=SubStr(cCODIGO,1,3)
        oProgWin:oDCMessage:textValue:=CCODIGO+"/"+Str(nCONTA)
        lGRAVA:=.T.
        IF cARQ="MS01X" .AND. Len(cCODIGO)<>12
           lGRAVA:=.F.
        ENDIF
        IF cARQ="MQ01X" .AND. Len(cCODIGO)<=12
           lGRAVA:=.F.
        ENDIF
        IF cARQ="MP03X" .AND. Len(cCODIGO)<>14
           lGRAVA:=.F.
        ENDIF


        lSUBCOD:=.F.
        IF cARQ="MW07" .OR. cARQ="MW05"
          // MW05
          // "ABR" : "Abrasivos"
          // "ARR" : "Arruelas"
          // "EMB" : "Embalagens"
          // "PAR" : "Parafusos"
          // "COL" : "Colas"
          // "ELE" : "Eletricos"
          // "BYG" : "Manutencao Carrinho Hidraulico"
          // "FER" : "Ferramentaria"
          // "FIL" : "Filtros"
          // "IEB" : "Formularios Internos"
          // "INF" : "Informatica"
          // "IMP" : "Impressos"
          // "LIM" : "Limpeza"
          // "LUB" : "Lubrificantes"
          // "MAG" : "Mangueira"
          // "MED" : "Remedios"
          // "PAP" : "Papelaria"
          // "PIN" : "Pintura"
          // "PNO" : "Pinos"
          // "POR" : "Porcas"
          // "QUI" : "Quimicos"
          // "RES" : "Cozinha"
          // "SEG" : "Seguranca"
          // "SOL" : "Solda"
          // "VAL" : "Valvulas"
          // "PAS" : "Patilhas"

          //MW07
	      // "ABC" : "Abracadeiras"
          // "ANE" : "Aneis"
          // "BIC" : "Bicos"
          // "BOB" : "Bobinas"
          // "BOR" :  Borrachas
          // "BOT" : "Botoes"
          // "CIL" : "Cilindros"
          // "COC" : "Conectores"
          // "CON" : "Contadores"
          // "COR" : "Correias"
          // "CUP" : "Cupilhas"
          // "DOB" : "Dobradicas"
          // "ENG" : "Engranagens/Engates"
          // "ESA" : espacadores
          // "ESC" : "Escovas"
          // "ESP" : "Espigao"
          // "EST" : "Esticador"
          // "LBR" : "Lubrificantes"
          // "MAN" : "Manometros"
          // "MAQ" : "Manutencao Maquinas Equipamentos"
          // "MCR" : "Micro"
          // "MDR" : "Mandril"
          // "NAV" : "Navalha"
          // "PAL" : "Palheta"
          // "PIE" : "Pino Elastico"
          // "PRE" : "Luvas Buchas"
          // "PUP" : "Puncao"
          // "REB" : "Rebites"
          // "REG" : "Reguladores"
          // "ROD" : "Manutencao Carrinho Hidraulico"
          // "ROL" : "Rolamentos"
          // "SEL" : "Selos"
          // "SEN" : "Sensor"
          // SIL Silenciador
          // "TER" : "Terminal"
          // "TIR" : "Tiristor"
          // "HID" : "Hidraulicos"
          // "INT" : "Interruptores"
          // "REL" : "Reles"
          // "REP" : "Reparos"



           IF At(cCOD3,"ABCANEBICBOBBORBOTCILCOCCONCORCUPDOBENGESCESAESPESTLBRMANMAQMCRMDRNAVPALPIEPREPUPREBREGRODROLSELSENSILTERTIRHIDINTRELREP")>0	
           	  lSUBCOD:=.T.
           ENDIF
        ENDIF
        IF cARQ=="MU01"
           lGRAVA:=.F.
           IF At(cCOD3,"BB-CH-MO-RL-TR-TF-TB-BL-")>0	
           	  lGRAVA:=.T.
           ENDIF
           IF ! lGRAVA
              cCOD3:=SubStr(cCODIGO,1,4)
              IF At(cCOD3,"MOCHMORLMOTRTRR-")>0	
           	     lGRAVA:=.T.
              ENDIF
           ENDIF
        ENDIF

        IF cARQ="MT01"
           lGRAVA:=.F.
           IF At(cCOD3,"BB-CH-MO-RL-TR-TF-TB-BL-")=0	 //Nao e materia prima
           	  lGRAVA:=.T.
           ENDIF
           IF ! lGRAVA
              cCOD3:=SubStr(cCODIGO,1,4)
              IF At(cCOD3,"MOCHMORLMOTRTRR-")=0	 //Nao e materia prima
           	     lGRAVA:=.T.
              ENDIF
           ENDIF
        ENDIF



        IF cARQ="MW07"
           lGRAVA:=.F.
           IF lSUBCOD
           	  lGRAVA:=.T.
           ENDIF	
        ENDIF
        IF cARQ="MW05"
           IF lSUBCOD
           	  lGRAVA:=.F.
           ENDIF	
        ENDIF
//        IF cARQ="MW07".OR.cARQ="MW05"
        AltD()
        IF SubStr(cCODIGO,1,4)="99.9"
           lGRAVA:=.F.
        ENDIF
         IF SubStr(cCODIGO,1,4)="88.8"
            lGRAVA:=.F.
         ENDIF
//        ENDIF	


        IF lGRAVA
  	       oSERVER:GOTOP()
  	       IF ! oSERVER:SEEk(cCODIGO)
  	          oSERVER:APPEND()
  	          oSERVER:FIELDPUTE("CODIGO",cCODIGO)
  	          IF cARQ="MS01X" .OR. cARQ="MP03X" .OR. cARQ="MQ01X"
                 oSERVER:FIELDPUTE("CODIGOINT",cCODIGO)
              ENDIF
           ELSE
	          IF Val(TIRAOUT(oREG:FIELDGET("cod_cla_fisc")))=0 .AND. Val(oSERVER:FIELDGET("CLASSIPI"))>0
	          	 FWrite(nHANDLE,cCODIGO+","+oSERVER:FIELDGET("CLASSIPI")+Chr(13)+Chr(10))	
	          ENDIF	
           ENDIF

           IF cARQ="MS01X"
          	  oSERVER:FIELDPUTE("UNID",FIXSTR(oREG:FIELDGET("cod_unid_med")))
        	  oSERVER:FIELDPUTE("PESOUNI",FIXNUM(oREG:FIELDGET("pes_unit")))
           ELSE
         	  oSERVER:FIELDPUTE("UNIDADE",FIXSTR(oREG:FIELDGET("cod_unid_med")))
           	  IF cARQ<>"MP03X"
          	     oSERVER:FIELDPUTE("PESLIQ",FIXNUM(oREG:FIELDGET("pes_unit")))
           	  ENDIF
           ENDIF	

           IF Empty(oSERVER:FIELDGET("NOME")) .or. (oSERVER:FIELDGET("NOME")=oSERVER:FIELDGET("CODIGO"))  //nome cadastrado com o codigo codigo
              DO CASE
                 CASE cARQ="MP03X"
           	          oSERVER:FIELDPUTE("NOM2",FIXSTR(oREG:FIELDGET("den_item")))
  	           	      oSERVER:FIELDPUTE("NOME",FIXSTR(oREG:FIELDGET("den_item_reduz")))
	             CASE cARQ="MS01" .OR. CARQ="MS01X" .OR. cARQ="MW07" .OR. cARQ="MW05"	
  	                  oSERVER:FIELDPUTE("NOME",FIXSTR(oREG:FIELDGET("den_item")))
  	             OTHERWISE	
  	                  oSERVER:FIELDPUTE("NOME",FIXSTR(SubStr(oREG:FIELDGET("den_item"),1,50)))
  	                  oSERVER:FIELDPUTE("NOM2",FIXSTR(SubStr(oREG:FIELDGET("den_item"),51)))
              ENDCASE
           ENDIF

           IF Val(oSERVER:FIELDGET("CLASSIPI"))=0 .OR. oSERVER:FIELDGET("CLASSIPI")<>TIRAOUT(FIXSTR(oREG:FIELDGET("cod_cla_fisc")))
       	      oSERVER:FIELDPUT("CLASSIPI",FIXSTR(TIRAOUT(oREG:FIELDGET("cod_cla_fisc"))))
           ENDIF	
           oSERVER:FIELDPUTE("IPI",FIXNUM(oREG:FIELDGET("pct_ipi")))

       ENDIF
   	   Oreg:skip()
   ENDDO	
   Oreg:close()
   Oserver:CLOSE()
NEXT X
FClose(nHANDLE)

IF .not. lMS01
   Oconn:Disconnect()	
ELSE	
   aDAD:={zCURINI,"MS01X",zCURDIR,aDIR}
   oSERVER:=USEMANA5{aDAD}
   IF oSERVER:nERRO#0
       RETU .F.
   ENDIF
   oSERVER:SETORDER(3) //codigo interno
   aDAD:={zCURINI,"MP03X",zCURDIR,aDIR}
   oSERVE2:=USEMANA5{aDAD}
   IF oSERVE2:nERRO#0
   	   oSERVER:CLOSE()
       RETU .F.
   ENDIF
   oSERVE2:SETORDER(3)  //codigo interno

   aDAD:={zCURINI,"MQ01X",zCURDIR,aDIR}
   oSERVE3:=USEMANA5{aDAD}
   IF oSERVE3:nERRO#0
   	  oSERVER:CLOSE()
   	  oSERVE2:CLOSE()
       RETU .F.
   ENDIF
   oSERVE3:SETORDER(3)  //codigo interno


   aDAD:={zCURINI,"MA01",zCURDIR,aDIR}
   oMA01:=USEMANA5{aDAD}
   IF oMA01:nERRO#0
   	  oSERVER:CLOSE()
   	  oSERVE2:CLOSE()
      oSERVE3:CLOSE()
      RETU .F.
   ENDIF
   oMA01:SETORDER(8)  //codigo interno


   cSQL:="select * from cliente_item "
   oreg:= SQLSelect{cSQL,oconn}
   nLASTREC:=100
   nPOS:=0
   WHILE ! OREG:EoF	
     	NPerc := INT(100* nPOS/ nLASTREC)
        oProgWin:oDcProgBar:Position := nPerc
  	    nPOS++
  	    IF nPOS=101
  	       nPOS:=0
  	    ENDIF
  	    cCODIGO:=AllTrim(FIXSTR(oREG:FIELDGET("COD_ITEM")))
  	    cCODCLI:=AllTrim(FIXSTR(oREG:FIELDGET("cod_item_cliente")))
  	    cCLICODINT:=AllTrim(FIXSTR(oREG:FIELDGET("cod_cliente_matriz")))
  	    IF At(" ",cCODCLI)>0
  	       cCODCLI:=SubStr(cCODCLI,1,At(" ",cCODCLI))
           cCODCLI:=AllTrim(cCODCLI)	
  	    ENDIF	
  	    nCLIENTE:=0
  	    oMA01:GOTOP()
  	    IF oMA01:SEEK(cCLICODINT)
  	       nCLIENTE:=oMA01:FIELDGET("NUMERO")
  	    ENDIF
 	    oProgWin:oDCMessage:textValue:=CCODIGO+"/"+cCODCLI
        oSERVER:GOTOP()
        IF oSERVER:SEEK(cCODIGO)
           oSERVER:FIELDPUTE("CODIGO",cCODCLI)	
           IF Len(cCLICODINT)<12
              oSERVER:FIELDPUTE("CLICODINT",cCLICODINT)	
           ENDIF
           oSERVER:FIELDPUTE("FORNECEDO",nCLIENTE)
           IF At("-MO",cCODCLI)>0
              oSERVER:FIELDPUTE("COMPRA","MO")
           ENDIF
        ENDIF	
        oSERVE2:GOTOP()
        IF oSERVE2:SEEK(cCODIGO)
           oSERVE2:FIELDPUTE("CODIGO",cCODCLI)	
           IF Len(cCLICODINT)<12
              oSERVE2:FIELDPUTE("CLICODINT",cCLICODINT)	
           ENDIF
        ENDIF	
        oSERVE3:GOTOP()
        IF oSERVE3:SEEK(cCODIGO)
           oSERVE3:FIELDPUTE("CODIGO",cCODCLI)	
           IF Len(cCLICODINT)<12
              oSERVE3:FIELDPUTE("CLICODINT",cCLICODINT)	
           ENDIF
        ENDIF	
   	   Oreg:skip()
   ENDDO	
   Oreg:close()	
   oSERVER:CLOSE()
   oSERVE2:CLOSE()
   oSERVE3:CLOSE()
   Oconn:Disconnect()

   aDAD:={zCURINI,"MS01",zCURDIR,aDIR}
   oSERVER:=USEMANA5{aDAD}
   IF oSERVER:nERRO#0
      RETU .F.
   ENDIF
   aDAD:={zCURINI,"MS01X",zCURDIR,aDIR}
   oSERVE2:=USEMANA5{aDAD}
   IF oSERVE2:nERRO#0
      RETU .F.
   ENDIF
   nLASTREC:=oSERVER:RecCount
   nPOS:=0
   oSERVER:GOTOP()
   WHILE ! oserver:EOF
      cCODIGO:=AllTrim(oSERVER:FIELDGET("CODIGOINT"))
      cCODCLI:=AllTrim(oSERVER:FIELDGET("CODIGO"))
      oProgWin:oDCMessage:textValue:=CCODIGO+"/"+cCODCLI
      NPerc := INT(100* nPOS/ nLASTREC)
      oProgWin:oDcProgBar:Position := nPerc
      nPOS++
      IF Empty(cCODIGO)
     	 cCODCLI:=StrTran(cCODCLI,".","")
         cCODCLI:=StrTran(cCODCLI,"-","")
         cCODCLI:=StrTran(cCODCLI," ","")
         cCODCLI:=AllTrim(cCODCLI)
         oSERVE2:SETORDER(1) //Codigo
         oSERVE2:GOTOP()
         IF oSERVE2:SEEK(cCODCLI)
        	oSERVER:FIELDPUTE("CODIGOINT",oSERVE2:FIELDGET("CODIGOINT"))
           cCODIGO:=AllTrim(oSERVER:FIELDGET("CODIGOINT"))
     	 ENDIF
      ENDIF
      IF ! Empty(CCODIGO)
         oSERVE2:SETORDER(3) //Codigointerno
   	     oSERVE2:GOTOP()
   	     IF oSERVE2:SEEK(cCODIGO)
   	        oSERVE2:FIELDPUTE("CODIGO",cCODCLI)
            IF Val(oSERVER:FIELDGET("CLASSIPI"))=0
        	    oSERVER:FIELDPUTE("CLASSIPI",TIRAOUT(oSERVE2:FIELDGET("CLASSIPI")))
            ENDIF	
       	    oSERVER:FIELDPUTE("IPI",oSERVE2:FIELDGET("IPI"))
       	    oSERVER:FIELDPUTE("UNID",oSERVE2:FIELDGET("UNID"))
        	oSERVER:FIELDPUTE("PESOUNI",oSERVE2:FIELDGET("PESOUNI"))
        	oSERVER:FIELDPUTE("NOME",oSERVE2:FIELDGET("NOME"))
        	oSERVER:FIELDPUTE("FORNECEDO",oSERVE2:FIELDGET("FORNECEDO"))
            IF Empty(oSERVER:FIELDGET("CLICODINT")) .AND. Len(cCLICODINT)<12
        	   oSERVER:FIELDPUTE("CLICODINT",oSERVE2:FIELDGET("CLICODINT"))
            ENDIF	
         ENDIF
      ENDIF
      IF Empty(oSERVER:FIELDGET("NOME"))
      	 aGMFI:=PEGGMFI(cCODIGO)
         IF aGMFI[1]
            oSERVER:FIELDPUTE("NOME",aGMFI[2])	
         ENDIF	
      ENDIF
      IF At("-MO",oSERVER:FIELDGET("CLICODINT"))>0
         oSERVER:FIELDPUTE("COMPRA","MO")	
      ENDIF
      oSERVER:SKIP()	
   ENDDO	
   oSERVE2:CLOSE()

   aDAD:={zCURINI,"CD.DBF",zCURDIR}
   oCD:=USEREDE{aDAD}
   IF oCD:nERRO#0
      oPROGWIN:EndDialog()
      RETU .F.
   ENDIF
   nPOS:=0
   oSERVER:GOTOP()
   WHILE ! oserver:EOF
      cCODIGO:=AllTrim(oSERVER:FIELDGET("CODIGO"))
      oProgWin:oDCMessage:textValue:=CCODIGO
      NPerc := INT(100* nPOS/ nLASTREC)
      oProgWin:oDcProgBar:Position := nPerc
      nPOS++
      oCD:GOTOP()
      IF oCD:SEEK(cCODIGO)
    	 oSERVER:FIELDPUTE("NOME",oCD:FIELDGET("NOME"))
     	 oSERVER:FIELDPUTE("FORNECEDO",oCD:FIELDGET("CLIENTE"))
      ENDIF
      oSERVER:FIELDPUTE("CLIPCP",oSERVER:FIELDGET("FORNECEDO"))
      oSERVER:FIELDPUTE("PLTINV",oSERVER:FIELDGET("FORNECEDO"))
      oSERVER:SKIP()	
   ENDDO	
   oSERVER:CLOSE()
ENDIF
//SELF:POINTER:=POINTER{POINTERARROW}
oPROGWIN:EndDialog()
IF lPERG
   alert("Concluido")
ENDIF


FUNCTION IMPFOR(lPERG)
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL aDAD,aRET AS ARRAY
LOCAL Omb01 AS USEREDE
LOCAL nPOSMB01 AS DWORD
//LOCAL nPERC AS WORD
LOCAL cSQL,cCGC,cPESSOA,cCOGNOME AS STRING
LOCAL oPROGWIN AS PROGWIN
LOCAL oSTMT AS SQLStatement
LOCAL cESTADO,cCIDADE,cDDD AS STRING
LOCAL oMD10,oCIDCONV AS USEREDE

oConn := SQLConnection{}
IF ! oConn:connect("ol_logix","","")
   alert("Erro na Conecção")
   RETURN .F.
ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

aDAD:={zCURINI,"MB01.DBF",zCURDIR,aDIR}
Omb01:=USEREDE{aDAD}
IF Omb01:nERRO#0
   oConn:Disconnect()
   RETURN .F.
ENDIF
Omb01:SETORDER(3)


aRET:={zCURINI,"CIDCONV.DBF",zCURDIR}
oCIDCONV:=USEREDE{aRET}
IF oCIDCONV:nERRO#0
   alert("Outro Usuario Arquivo CIDCONV Aberto - Tente Depois","Erro Abrindo o Arquivo")
   Oconn:Disconnect()
   OmB01:close()
   RETU .F.
ENDIF	


aRET:={zCURINI,"MD10.DBF",zCURDIR}
oMD10:=USEREDE{aRET}
IF oMD10:nERRO#0
   alert("Outro Usuario Arquivo MD10 Aberto - Tente Depois","Erro Abrindo o Arquivo")
   Oconn:Disconnect()
   OmB01:close()
   oCIDCONV:CLOSE()
   RETU .F.
ENDIF	

oProgWin := ProgWin{}
oProgWin:Caption:="Fornecedores"
oProgWin:SHOW()

//SELF:POINTER:=POINTER{POINTERHOURGLASS}

nPOSMB01:=100

cSQL := " SELECT fornecedor.*,cnpjcpf(num_cgc_cpf) as cgc,cidades.den_cidade,fornec_compl.ins_municipal,fornec_compl.e_mail  "
cSQL += " FROM fornecedor LEFT JOIN cidades ON fornecedor.cod_cidade = cidades.cod_cidade "
cSQL += " LEFT JOIN fornec_compl ON fornecedor.cod_fornecedor = fornec_compl.cod_fornecedor "

//     cSQL += " where ies_fornec_ativo<>'I'"

//cSQL:=" SELECT fornecedor.*,cidades.den_cidade  "
//cSQL+=" FROM fornecedor LEFT JOIN cidades ON fornecedor.cod_cidade = cidades.cod_cidade"

oreg:= SQLSelect{cSQL,oconn}

oPROGWIN:reset()
Oprogwin:nTOTAL:=Oreg:RecCount

 WHILE ! OREG:EoF	

      cCGC:=FIXSTR(oREG:FIELDGET("cgc"))
      cPESSOA:=AllTrim(oREG:FIELDGET("ies_fis_juridica"))


      oPROGWIN:TITULO(cCGC,.T.)
      cCOGNOME:=AllTrim(FIXSTR(oREG:FIELDGET("raz_social_reduz")))
      IF Len(AllTrim(cCOGNOME))=0
         cCOGNOME:=FIXSTR(oREG:FIELDGET("raz_social"))
      ENDIF	


       oMB01:SETORDER(3)
       oMB01:GOTOP()
       IF ! oMB01:SEEK(cCGC)
     	  oMB01:SETORDER(1)
      	  WHILE .T.
      	     oMB01:GOTOP()
       	     IF ! oMB01:SEEK(nPOSMB01)
       	        EXIT
       	     ENDIF	
      	     nPOSMB01:=nPOSMB01+1
    	  ENDDO	
      	  oMB01:APPEND()
      	  oMB01:FIELDPUT("NUMERO",nPOSMB01)
      	  oMB01:FIELDPUT("CGC",cCGC)
      	  nPOSMB01:=nPOSMB01+1
      ENDIF
      cCIDADE:=FIXSTR(oREG:FIELDGET("den_cidade"))
      cESTADO:=FIXSTR(oREG:FIELDGET("cod_uni_feder"))
      cDDD:=PEGDDD(FIXSTR(oREG:FIELDGET("num_telefone")))

      oCIDCONV:GOTOP()
      IF oCIDCONV:SEEK(cESTADO+cCIDADE)
          cCIDADE:=AllTrim(oCIDCONV:FIELDGET("CIDDES"))
      ENDIF
      IF Empty(cDDD)
         oMD10:GOTOP()
         IF oMD10:SEEK(cESTADO+cCIDADE)
        	cDDD:=oMD10:FIELDGET("DDD")
         ENDIF	
      ENDIF


   	  oMB01:FIELDPUTE("NOME",FIXSTR(oREG:FIELDGET("raz_social")))
   	  OMB01:FIELDPUTE("ENDERECO",FIXSTR(oREG:FIELDGET("end_fornec")))
   	  OMB01:FIELDPUTE("BAIRRO",FIXSTR(oREG:FIELDGET("den_bairro")))
   	  oMB01:FIELDPUTE("CIDADE",cCIDADE)
   	  oMB01:FIELDPUTE("ESTADO",cestado)
   	  oMB01:FIELDPUTE("CEP",FIXSTR(oREG:FIELDGET("cod_cep")))
   	  oMB01:FIELDPUTE("IESTADUAL",FIXSTR(oREG:FIELDGET("ins_estadual")))
   	  oMB01:FIELDPUTE("CONTATO",FIXSTR(oREG:FIELDGET("nom_contato")))
   	  oMB01:FIELDPUTE("PESSOA",cPESSOA)
   	  oMB01:FIELDPUTE("BANCO",FIXSTR(oREG:FIELDGET("cod_banco")))
   	  oMB01:FIELDPUTE("AGENCIA",FIXSTR(oREG:FIELDGET("num_agencia")))
   	  oMB01:FIELDPUTE("CONTA",FIXSTR(oREG:FIELDGET("num_conta_banco")))
      OMB01:FIELDPUTE("COGNOME",cCOGNOME)
      OMB01:FIELDPUTE("DDD",Cddd)
      OMB01:FIELDPUTE("TELEFONE",PEGTEL(FIXSTR(oREG:FIELDGET("num_telefone"))))
      OMB01:FIELDPUTE("EMAIL",FIXSTR(oREG:FIELDGET("e_mail")))
      OMB01:FIELDPUTE("IMUNICIPI",FIXSTR(oREG:FIELDGET("ins_municipal")))
      OMB01:FIELDPUTE("CODIGOINT",FIXSTR(oREG:FIELDGET("cod_fornecedor")))

      oPROGWIN:skip(1)
   	  Oreg:skip()
   ENDDO	
   Oreg:close()
   Omb01:CLOSE()


oPROGWIN:EndDialog()
IF lPERG
   alert("concluido")
ENDIF



