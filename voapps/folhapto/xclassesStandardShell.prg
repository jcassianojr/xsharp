
CLASS ptoshell INHERIT StandardShellWindow
METHOD AJUCCUSTO  
LOCAL oSERVER,oDEPTO AS USEFOLHA	
LOCAL oPROGWIN AS PROGWIN
LOCAL nPOS,nLASTREC AS DWORD
LOCAL nPERC AS INT
oSERVER:=USEFOLHA{"FO_PES",.F.}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
oDEPTO:=USEFOLHA{"DEPTO",.F.}
IF oDEPTO:nERRO#0
   oSERVER:CLOSE()
   RETU SELF
ENDIF
oDEPTO:SETORDER(3)     //Centro Custo

  SELF:POINTER:=POINTER{POINTERHOURGLASS}
  oProgWin := ProgWin{}
  oProgWin:Caption:="Sincronizando Funcionarios"
  oProgWin:SHOW()


   Npos:=0
   nLASTREC:=100
   oSERVER:GOTOP()
   WHILE ! OSERVER:EoF	
         nPerc := INT(100* nPOS/ nLASTREC)
         nPOS++
         oProgWin:oDcProgBar:Position := nPerc
         oProgWin:oDCMessage:textValue:=Str(oSERVER:FIELDGET("numero"),8)

          IF Empty(oSERVER:FIELDGET("UNIFUN"))
       	     oDEPTO:GOTOP()
       	     IF oDEPTO:SEEK(oSERVER:FIELDGET("CCUSTO"))
       	  	    oSERVER:FIELDPUT("UNIFUN",oDEPTO:FIELDGET("UNIFUN"))
       	     ENDIF	
          ENDIF	


          IF Empty(oSERVER:FIELDGET("MODIRETA"))
       	     oDEPTO:GOTOP()
       	     IF oDEPTO:SEEK(oSERVER:FIELDGET("CCUSTO"))
       	  	    oSERVER:FIELDPUT("MODIRETA",oDEPTO:FIELDGET("MODIRETA"))
       	     ENDIF	
          ENDIF	

          IF Empty(oSERVER:FIELDGET("DEPTO")) .and. ! Empty(oSERVER:FIELDGET("CCUSTO"))
             oSERVER:FIELDPUT("DEPTO",oSERVER:FIELDGET("CCUSTO"))
             oSERVER:FIELDPUT("DEPSETSEC",oSERVER:FIELDGET("DEPTO") * 1000000 + oSERVER:FIELDGET("SETOR") * 1000 + oSERVER:FIELDGET("SECAO"))
          ENDIF

          oSERVER:FIELDPUT("CNUMERO",StrZero(oSERVER:FIELDGET("NUMERO"),8))

       oSERVER:Skip()
   ENDDO
   SELF:POINTER:=POINTER{POINTERARROW}

oPROGWIN:EndDialog()
oSERVER:CLOSE()
oDEPTO:CLOSE()
alert("Concluido")


	

METHOD COPIARQ 
LOCAL cARQ,cCAM,cORI,cDES AS STRING
LOCAL oJAN AS JESCREL
//LOCAL lOK AS LOGIC
LOCAL oARQ AS XBUSCAARQ
cORI:=cCAM+cARQ
oJAN:=JESCREL{SELF}
oJAN:SHOW()
cARQ:=pegarqcon(ZREL,"TXT")
cCAM:=pegarqcon(zrel,"CAM")
cORI:=cCAM+"\"+cARQ
cDES:=ZCURDIR+"\"+cARQ
Oarq:=XBUSCAARQ{SELF,"Copia Arquivo","Confirme Caminho",cORI}
oARQ:CBUSCA:=cORI
//SUPER(oOWNER,"Copia Arquivo","Confirme Caminho",cORI)
OARQ:SETarFiltro({cORI,"*.TXT","*.*"},{"Pre Configurado","Arquivos txt","Todos os Arquivos"},1)
oARQ:SHOW()
IF OARQ:lOK
   cORI:=OARQ:CBUSCA
   IF File(cORI)	
//   	  alert(cORI)
//   	  alert(cDES)
      SHCopy(cORI,cDES)	//  lOK:=
   ELSE
   	  alert("Falta Arquivo" + cORI)
   ENDIF
ENDIF	

	
	

METHOD DOSPTOREL() 
LOCAL cDIR, cEXE, cCODNEW AS STRING
LOCAL nFout AS PTR
//   IF ! entramenu("PTO",nPOS)
//	   RETURN SELF
 //   ENDIF	

    cCODNEW := PEGINIVAL(ZCURINI,"FOPTOREL","CAMINHO")
  IF ! File(cCODNEW)
       alert("Nao Encontrado" + cCODNEW)
      RETURN SELF
   END IF
cDIR:=GetFileNameFromPath(cCODNEW)
cEXE:=GetPathFromFileName(cCODNEW)
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz(cEXE),String2Psz(""),String2Psz(cDIR),SW_SHOWNORMAL)
ShellExecuteErro(nFout) 
	

METHOD EXCLUIRDEM 
IF MDG( 'Apagar Movimento Demitidos' )
	EXCLUIDEM()
ENDIF


METHOD FOPESMP04 	
LOCAL oSERVER AS USEFOLHA
LOCAL oMP02,oMP04 AS USEREDE
LOCAL aRET,aCOM AS ARRAY	
LOCAL oPROGWIN AS PROGWIN
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT


oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()

oSERVER:=USEFOLHA{"FO_PES"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF

          aRET:={zCURINI,"MP04.DBF",zCURDIR}
          aCOM:={zMES,zANO,ZEMPRESA}

          oMP04:=USEREDE{aRET,,,,aCOM}
          IF oMP04:nERRO#0
	         alert("Outro Usuario Arquivo Aberto - Tente Depois","Erro Abrindo o Arquivo")
             oSERVER:Close()
             RETU SELF
          ENDIF	
          aRET:={zCURINI,"MP02.DBF",zCURDIR}
          aCOM:={zMES,zANO,ZEMPRESA}

          oMP02:=USEREDE{aRET,,,,aCOM}
          IF oMP02:nERRO#0
             alert("Outro Usuario Arquivo Aberto - Tente Depois","Erro Abrindo o Arquivo")
             oSERVER:Close()
             oMP04:CLOSE()
             RETU SELF
          ENDIF
          oMP02:SetOrder(3) //Cod Folha


          nLASTREC:=Oserver:RecCount
          nPOS:=1
          oSERVER:GOTOP()
          WHILE ! oSERVER:EOF
          	nPerc := INT(100* nPOS/ nLASTREC)
            nPOS++
            oProgWin:oDcProgBar:Position := nPerc
            oProgWin:oDCMessage:textValue:=StrZero(npos,8)+"/"+StrZero(nLASTREC,8)
        	oMP04:GOTOP()
   	        IF ! oMP04:SEEK(oSERVER:FIELDGET("NUMERO"))
   		       oMP04:Append()
   		       oMP04:FIELDPUT("TECNICO",oSERVER:FIELDGET("NUMERO"))
   	        ENDIF	
		    oMP04:FIELDPUT("CNUMERO",StrZero(oSERVER:FIELDGET("NUMERO"),8))	
            oMP04:FIELDPUT("NOMTEC",oSERVER:FIELDGET("NOME"))
            oMP04:FIELDPUT("ADMITIDO",oSERVER:FIELDGET("ADMITIDO"))
            oMP04:FIELDPUT("DEMITIDO",oSERVER:FIELDGET("DEMITIDO"))
            IF ! Empty(oSERVER:FIELDGET("FUNCAO"))
               oMP02:GOTOP()
               IF oMP02:SEEK(oSERVER:FIELDGET("FUNCAO"))
                  oMP04:FIELDPUT("TABTEC",oMP02:FIELDGET("CODIGO"))
               ENDIF
            ENDIF
            oMP04:FIELDPUTE("ESCRAIS",oSERVER:FIELDGET("ESCRAIS"))
            oMP04:FIELDPUTZ("NUMREGANT",oSERVER:FIELDGET("NUMREGANT"))
            oMP04:FIELDPUTZ("NUMEMPANT",oSERVER:FIELDGET("NUMEMPANT"))
            oMP04:FIELDPUTZ("dattransf",oSERVER:FIELDGET("dattransf"))
            IF Valcpf(oSERVER:FIELDGET("CPF"),.f.)
               oMP04:FIELDPUTE("CPF",oSERVER:FIELDGET("CPF"))
            ENDIF
            IF .not. Valcpf(oMP04:FIELDGET("CPF"),.f.)
               oMP04:FIELDPUT("CPF","")
            ENDIF
            oMP04:FIELDPUTZ("EMAILEXT",oSERVER:FIELDGET("EMAIL"))
   	        oSERVER:SKIP()
          ENDDO
          oMP04:CLOSE()
          oMP02:CLOSE()
    oSERVER:CLOSE()
    oPROGWIN:EndDialog()




METHOD IMGDTM() 
LOCAL cARQ AS STRING
LOCAL nFout AS PTR
//[CONN]Provider=SQLOLEDB;Server=DATAMACE\SQLEXPRESS;User ID=sa;Password=itaesbra;Database=itaesbra"
cARQ:=PEGINIVAL(ZCURINI,"PATH","IMGJPG")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("IMGJPG"),String2Psz("{IMGDTM}"),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 



METHOD IMGMP04() 
LOCAL nFout AS PTR
LOCAL cARQ AS STRING
IF MDG("Ajustar Fotos")
   SELF:XAJUFOT()	
ENDIF	
cARQ:=PEGINIVAL(ZCURINI,"PATH","IMGJPG")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("IMGJPG"),String2Psz("{IMGME04CPF}"),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 

METHOD IMGMP04LX() 
LOCAL cARQ AS STRING
LOCAL nFout AS PTR
cARQ:=PEGINIVAL(ZCURINI,"PATH","IMGJPG")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("IMGJPG"),String2Psz("{IMGLX}"),String2Psz(carq),SW_SHOWNORMAL) 
ShellExecuteErro(nFout)  

METHOD IMPLOGIXDIRF 
LOCAL oConn AS SQLConnection
LOCAL oREG,oDEM AS SQLSelect
LOCAL oStmt AS SQLStatement
LOCAL cSQL,cMIG,cDATAINI,cDATAFIM,cEMPANT AS STRING
LOCAL aVAL4,aVAL5,aVAL61,ASaunum,ASauval,ASAUABN,aABNPIS,aTMP AS ARRAY         //adad    aret
LOCAL Arend,aIRRF AS ARRAY
LOCAL aINSS,aDEPE,aPENS,aPENCPF,aPENVAL AS ARRAY
LOCAL nPOS,nLASTREC,nANO,nreg02,X,nRENT,nNUMERO,nNUMANT,nCONTA,nPOSSCAN,nPOSPEN AS DWORD      //nposbus      mes
LOCAL OFIRMA AS USEFOLHA
LOCAL oPROGWIN AS PROGWIN
LOCAL nPERC AS INT
LOCAL cCPFORI,cCPF,cTIPO,cEMPRESA,cINFO,cOUT,ARQINF AS STRING       
LOCAL oJAN AS JMESANO
LOCAL nSAUde,nABONO,nVALEVE,nABNPIS AS FLOAT    //nval nvalpen
LOCAL INF               //uso     pri
 
nNUMANT:=0


oProgWin := ProgWin{SELF}
oProgWin:Caption:="Exportador DIRF"
oProgWin:SHOW()


   cMIG:=StrZero(zempRESA,2)
//   cCGC:=""
   OFirma:=USEFOLHA{"FIRMA"}
   IF OFirma:nERRO#0
   	   oPROGWIN:EndDialog()
       RETU SELF
   ENDIF
   OFirma:GOTOP()
   IF OFirma:SEEK(ZEMPRESA)
   	  IF ! Empty(OFirma:FIELDGET("CODEMPMIG"))
         cMIG:=oFIRMA:FIELDGET("CODEMPMIG")
   //      cCGC:=oFIRMA:FIELDGET("CGC")
      ENDIF
    ENDIF
    OFIRMA:CLOSE()

oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
  	   oPROGWIN:EndDialog()
   	  RETURN .f.
   ENDIF



cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

oJAN:=JMESANO{SELF}
oJAN:SHOW()
nANO:=oJAN:nano

//ARQPRI:="INFODIRF_"+cMIG+"_"+StrZero(nANO,4)+".TXT"
//ARQDET:="INFOCOMP_"+cMIG+"_"+StrZero(nANO,4)+".TXT"
ARQINF:="INFOINFO_"+cMIG+"_"+StrZero(nANO,4)+".TXT"
INF:=FCreate(ARQINF)



SELF:POINTER:=POINTER{POINTERHOURGLASS}

aSAUNUM:={}
aSAUVAL:={}
aSAUABN:={}
aABNPIS:={}
nSAUDE:=0
nABONO:=0


cDATAINI:="01/01/"+StrZero(nANO,4)
cDATAFIM:="31/12/"+StrZero(nANO,4)

/*
--tipo processamento
1-mensal 2-adiantamento 3-adiantamento 13  4-13 5-rescisao 6-rescisao complentar 7-ferias
8-provisao de ferias 9-provisao 14  10=plr 11-autonomos 14-provisao plr 99 extra
--tipo de base
S-salario F-ferias P-PLR D-Decimo terciro M-anual A-acerto

*/


CSQL:="SELECT hist_movto.cod_evento,hist_movto.val_evento,fun_infor.num_cpf  FROM hist_movto,fun_infor"
IF ZEMPRESA>=50
   cSQL+=" WHERE hist_movto.COD_EMPRESA='"+cMIG+ "'"
ELSE
   cSQL+="    WHERE (hist_movto.cod_empresa='01' OR hist_movto.cod_empresa='05' )"
ENDIF
cSQL+=" and hist_movto.dat_pagto>='"+cDATAINI+"'"
cSQL+=" and hist_movto.dat_pagto<='"+cDATAFIM+"'"
cSQL+=" and (hist_movto.cod_evento=483 or hist_movto.cod_evento=489  or hist_movto.cod_evento=44  or hist_movto.cod_evento=52 or hist_movto.cod_evento=53  or hist_movto.cod_evento=175 )"
cSQL+=" and hist_movto.cod_empresa=fun_infor.cod_empresa"
cSQL+=" and hist_movto.num_matricula=fun_infor.num_matricula"
cSQL+="  order by fun_infor.num_cpf"
  odem:= SQLSelect{cSQL,oconn}
  oPROGWIN:RESET()
  oPROGWIN:nTOTAL:=oDEM:RECCOUNT
  WHILE ! Odem:eof
  	    nSAUDE:=0
  	    nABONO:=0
  	    nABNPIS:=0
  	    cCPF:=oDEM:FIELDGET("num_cpf")
        WHILE cCPF=oDEM:FIELDGET("NUM_CPF") .AND. ! ODEM:EoF
             NCONTA:=oDEM:FIELDGET("cod_evento")
             IF nCONTA=483 //convenio medico
                 nSAUDE+=FIXNUM(oDEM:FIELDGET("val_evento"))
             ENDIF
             IF nCONTA=489 //convenio diferenciado
                 nSAUDE+=FIXNUM(oDEM:FIELDGET("val_evento"))
             ENDIF
             IF nCONTA=44 .OR. nCONTA=52 .OR. nCONTA=53      //Abono Ferias
             	nABONO+=FIXNUM(oDEM:FIELDGET("val_evento"))
             ENDIF
             IF nCONTA=175 //abono pis
                 nABNPIS+=FIXNUM(oDEM:FIELDGET("val_evento"))
             ENDIF
       	     oDEM:Skip()
      	     oPROGWIN:TITULO(cCPF,.T.)
      	     oPROGWIN:SKIP(1)
       ENDDO
       IF nSAUDE>0 .OR. nABONO>0 .OR. nABNPIS>0   //amarra pelo pis transferencias
      	 nPOSSCAN:=AScan(aSAUNUM,cCPF)
         IF nPOSSCAN>0
            aSAUNUM[nPOSSCAN]+=nSAUDE
            aSAUABN[nPOSSCAN]+=nABONO
            aABNPIS[nPOSSCAN]+=nABNPIS
         ELSE	
	       	AAdd(aSAUNUM,cCPF)
	       	AAdd(aSAUVAL,nSAUDE)
	        AAdd(aSAUABN,nABONO)
	        AAdd(aABNPIS,nABNPIS)
         ENDIF
       ENDIF
   ENDDO

 odem:close()





CSQL:="SELECT FUN_INFOR.num_cpf AS num_cgc_cpf_benef,"
cSQL+="        funcionario.cod_empresa,"
cSQL+="        funcionario.num_matricula,"
cSQL+="        funcionario.nom_funcionario AS nom_beneficiario ,"
cSQL+="        funcionario.dat_admis,"
cSQL+="        funcionario.dat_transfer,funcionario.cod_empresa_ant,funcionario.num_matricula_ant"
cSQL+="   FROM FUNCIONARIO"
cSQL+="   INNER JOIN fun_infor ON funcionario.cod_empresa= fun_infor.cod_empresa"
cSQL+="                      AND FUNCIONARIO.num_matricula = FUN_INFOR.num_matricula"
IF ZEMPRESA>=50
   cSQL+=" WHERE funcionario.COD_EMPRESA='"+cMIG+ "'"
ELSE
  cSQL+="    WHERE (FUNCIONARIO.cod_empresa='01' OR FUNCIONARIO.cod_empresa='05' )"
ENDIF
cSQL+="         AND FUNCIONARIO.cod_vinculo<>99"
cSQL+="         AND FUNCIONARIO.num_matricula<5000"
cSQL+="         AND (FUNCIONARIO.dAT_demis IS NULL OR (funcionario.dat_demis>='"+cDATAINI+"' AND funcionario.dat_demis<='"+cDATAFIM+"'))"
cSQL+=" ORDER BY fun_infor.num_cpf,funcionario.dat_transfer"


oreg:= SQLSelect{cSQL,oconn}

nREG02:=0
//SEQ:=1
Npos:=0
nLASTREC:=100

WHILE ! OREG:EoF
         cCPFORI:=oREG:FIELDGET("num_cgc_cpf_benef")
         cCPF:=oREG:FIELDGET("num_cgc_cpf_benef")
         nRENT:=0561
         cTIPO:="1"
     //    cNOME:=FIXSTR(oREG:FIELDGET("nom_beneficiario"))
         aVAL4:={0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0}
         aVAL5:={0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0}
         //aVAL6:={0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0}
         aVAL61:={0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0}

         aREND:=ARRAY(13)
         aIRRF:=ARRAY(13)
         aINSS:=ARRAY(13)
         aDEPE:=ARRAY(13)
         aPENS:=ARRAY(13)
         AFill(aREND,0)
         AFill(aIRRF,0)
         AFill(AINSS,0)
         AFill(ADEPE,0)
         AFill(APENS,0)

         nNUMERO:=FIXNUM(oREG:FIELDGET("num_matricula"))
         cEMPRESA:=oREG:FIELDGET("cod_empresa")

        //pegar a ultima empresa e matricula em caso de transferencias
         WHILE cCPFORI = oREG:FIELDGET("num_cgc_cpf_benef") .AND. ! OREG:EoF
            nPerc := INT(100* nPOS/ nLASTREC)
            nPOS++
            oProgWin:oDcProgBar:Position := nPerc
            oProgWin:oDCMessage:textValue:=StrZero(nRENT,4)+"-"+cTIPO+"-"+cCPF
            IF Npos>100
               Npos:=1
            ENDIF
       	     nNUMERO:=FIXNUM(oREG:FIELDGET("num_matricula"))
             cEMPRESA:=oREG:FIELDGET("cod_empresa")
             cEMPANT:=FIXSTR(oREG:FIELDGET("cod_empresa_ant"))
             nNUMANT:=FIXNUM(oREG:FIELDGET("num_matricula_ant"))
         	 oREG:SKIP()
         ENDDO




        cINFO:=""
        cOUT:=""

        nPOSSCAN:=AScan(aSAUNUM,cCPFORI)
         IF nPOSSCAN>0
            IF ASAUABN[nPOSSCAN]>0
               aVAL61[1]+=ASAUABN[nPOSSCAN]
               cOUT+="Abono de Ferias R$ "+AllTrim(Str(ASAUABN[nPOSSCAN],15,2)) + " _ "
            ENDIF
         	IF aABNPIS[nPOSSCAN]>0
               cINFO+="Abono PIS 00.360.305/0001-04 R$ "+AllTrim(Str(aABNPIS[nPOSSCAN],15,2)) +" _ "
            ENDIF
         ENDIF


        IF cTIPO="1"
	       aTMP:={0,0,0,0,0,0,0,0,0,0}
           CSQL:="SELECT * FROM movto_demitidos"
           IF ZEMPRESA>=50
              cSQL+=" WHERE COD_EMPRESA='"+cEMPRESA+ "'"
           ELSE
           	  cSQL+="    WHERE (cod_empresa='01' OR cod_empresa='05' )"
           ENDIF
           cSQL+=" and dat_referencia>='"+cDATAINI+"'"
           cSQL+=" and dat_referencia<='"+cDATAFIM+"'"
           cSQL+=" and num_matricula="+AllTrim(Str(Nnumero))
           odem:= SQLSelect{cSQL,oconn}
           WHILE ! Odem:eof   //.AND.oDEM:RECCOUNT>0
                NCONTA:=oDEM:FIELDGET("cod_evento")
                nVALEVE:=FIXNUM(oDEM:FIELDGET("val_evento"))
              IF nCONTA=61 //Aviso Indenizao
                    aVAL5[7]+=nVALEVE
                    aTMP[1] +=nVALEVE
                ENDIF
                IF nCONTA=62 //Integracao aviso previo
                    aVAL5[7]+=nVALEVE
                    aTMP[2] +=nVALEVE
                ENDIF
                IF nCONTA=68 .or. nCONTA=69 //13o. salario indenizado
                    aVAL5[7]+=nVALEVE
                    aTMP[3] +=nVALEVE
                ENDIF
                IF nCONTA=977 //40%fgts
                    aVAL5[7]+=nVALEVE
                    aTMP[4] +=nVALEVE
                ENDIF
                IF nCONTA=197 //Ind fer 30 dias
                    aVAL5[7]+=nVALEVE
                    aTMP[5] +=nVALEVE
                ENDIF
                IF nCONTA=158 //ind lei 7238/84
                    aVAL5[7]+=nVALEVE
                    aTMP[6] +=nVALEVE
                ENDIF
                IF nCONTA=186 //abono aposentadoria
                    aVAL5[7]+=nVALEVE
                    aTMP[7] +=nVALEVE
                ENDIF
                 IF nCONTA=247  .or. nCONTA=248  .or. nCONTA=249   .or. nCONTA=63   .or. nCONTA=64   .or. nCONTA=65  .or. nCONTA=66   .or. nCONTA=164    //Ferias indenizadas
                    aTMP[8] +=nVALEVE
                ENDIF
                IF nCONTA=173 //Auxilio Funeral
                    aTMP[9] +=nVALEVE
                ENDIF
                IF nCONTA=446  .or. nconta=443 //pensao rescisao
                    aTMP[10] +=nVALEVE
                ENDIF


        	    oDEM:Skip()
           ENDDO
           odem:close()
           IF aTMP[1]>0
           	  IF aTMP[2]>0 //Abaixo 
           	  	 NOP
              ELSE
                 cINFO+="AvisoIndenizado R$ "+AllTrim(Str(aTMP[1],15,2))+" _ "
              ENDIF
           ENDIF
           IF aTMP[2]>0
              IF aTMP[1]=0
   	             cINFO+="AvisoInd.Integr.R$ "+AllTrim(Str(aTMP[2],15,2))+" _ "
              ELSE
                 cINFO+="AvisoInd+Integr.R$ "+AllTrim(Str(Atmp[1]+aTMP[2],15,2))+" _ "
              ENDIF
           ENDIF
           IF aTMP[3]>0
              cINFO+="13o.Indenizado R$ "+AllTrim(Str(aTMP[3],15,2))+" _ "
           ENDIF
           IF aTMP[4]>0
              cINFO+="MultaFGTS 40% R$ "+AllTrim(Str(aTMP[4]))+" _ "
           ENDIF
           IF aTMP[5]>0
              cINFO+="Ind.Fer.30Dias R$ "+AllTrim(Str(aTMP[5]))+" _ "
           ENDIF
           IF aTMP[6]>0
              cINFO+="LEI 7238/84 R$ "+AllTrim(Str(aTMP[6]))+" _ "
           ENDIF
           IF aTMP[7]>0
              cINFO+="AbonoAposentadoria R$ "+AllTrim(Str(aTMP[7]))+" _ "
           ENDIF
           IF aTMP[8]>0
              cINFO+="Ferias Indenizadas R$ "+AllTrim(Str(aTMP[8]))+" _ "
           ENDIF
            IF aTMP[9]>0
              cINFO+="Auxilio funeral R$ "+AllTrim(Str(aTMP[9]))+" _ "
           ENDIF









           	    aPENCPF:={}
           	    aPENVAL:={}

           	    //Salarios  processos diferentes de 3 e 4 (13o. Salario) (5,10 plr)
              	csql:="SELECT   b.num_cpf,   b.nom_depend,"      //   a.cod_empresa,  a.num_matricula,
                csql+="       Sum(a.val_pensao) as valor FROM hist_pensao_alim a,  fun_pensao_alim b "
                csql+="       WHERE  ((a.cod_empresa='"+cEMPRESA+"' and a.num_matricula="+AllTrim(Str(Nnumero))
                IF ! Empty(Cempant)
                    csql+=")        or (a.cod_empresa='"+cEMPANT+"' and a.num_matricula="+AllTrim(Str(NnumANT))+"))"	
                ELSE
                    cSQL+="              )) "
                ENDIF	
                csql+="              AND a.dat_pagto >= '"+cDATAINI+"'  AND a.dat_pagto <= '"+cDATAFIM+"'  AND a.cod_tip_proc not IN (3,4,5,10) "
                csql+="              AND a.cod_empresa = b.cod_empresa  AND a.num_matricula = b.num_matricula"
                csql+="              AND a.nom_depend = b.nom_depend"
                csql+="              GROUP BY   b.num_cpf,  b.nom_depend"    //   a.cod_empresa,  a.num_matricula,
//                IF ! Empty(cEMPANT)
//                   MemoWrit("C"+Str(NNUMERO,8)+".SQL",cSQL)
//                ENDIF
                odem:= SQLSelect{cSQL,oconn}
                IF ! Odem:eof .AND. oDEM:RECCOUNT>0
                	WHILE ! ODEM:EOF
                		 AAdd(aPENCPF,FIXSTR(oDEM:FIELDGET("num_cpf"))) //soma as pensoes mensais com o evento 446 pensao rescisao
                		 AAdd(aPENVAL,{AllTrim(FIXSTR(oDEM:FIELDGET("nom_depend"))),AllTrim(Str(FIXNUM(oDEM:FIELDGET("valor")+Atmp[10]),15,2)),"0.00","0.00"})
                		 aVAL4[4]+=FIXNUM(oDEM:FIELDGET("valor"))
                       oDEM:SKIP()
                    ENDDO
                ENDIF
                odem:close()



                //13o.Salario          processos 3 e 4
                csql:="SELECT   b.num_cpf,   b.nom_depend,"  //a.cod_empresa,  a.num_matricula,
                csql+="       Sum(a.val_pensao) as valor FROM hist_pensao_alim a,  fun_pensao_alim b "
                csql+="       WHERE  ((a.cod_empresa='"+cEMPRESA+"' and a.num_matricula="+AllTrim(Str(Nnumero))
                IF ! Empty(Cempant)
                    csql+=")        or (a.cod_empresa='"+cEMPANT+"' and a.num_matricula="+AllTrim(Str(NnumANT))+"))"	
                ELSE
                    cSQL+="              )) "
                ENDIF	
                csql+="              AND a.dat_pagto >= '"+cDATAINI+"'  AND a.dat_pagto <= '"+cDATAFIM+"'  AND a.cod_tip_proc in (3,4) "
                csql+="              AND a.cod_empresa = b.cod_empresa  AND a.num_matricula = b.num_matricula"
                csql+="              AND a.nom_depend = b.nom_depend"
                csql+="              GROUP BY  b.num_cpf,  b.nom_depend"    // a.cod_empresa,  a.num_matricula,
                odem:= SQLSelect{cSQL,oconn}
                IF ! Odem:eof .AND. oDEM:RECCOUNT>0
                	WHILE ! ODEM:EOF
                		nPOSPEN:=AScan(aPENCPF,FIXSTR(oDEM:FIELDGET("num_cpf")))
                		IF nPOSPEN>0
                		   aPENVAL[nPOSPEN,3]:=AllTrim(Str(FIXNUM(oDEM:FIELDGET("valor")),15,2))
                	    ENDIF
  	                    aVAL4[4]+=FIXNUM(oDEM:FIELDGET("valor"))
                       oDEM:SKIP()
                    ENDDO
                ENDIF
                odem:close()

                //plr          processos 5,10
                csql:="SELECT  b.num_cpf,   b.nom_depend,"   //a.cod_empresa,  a.num_matricula,
                csql+="       Sum(a.val_pensao) as valor FROM hist_pensao_alim a,  fun_pensao_alim b "
                csql+="       WHERE  ((a.cod_empresa='"+cEMPRESA+"' and a.num_matricula="+AllTrim(Str(Nnumero))
                IF ! Empty(Cempant)
                    csql+=")        or (a.cod_empresa='"+cEMPANT+"' and a.num_matricula="+AllTrim(Str(NnumANT))+"))"	
                ELSE
                    cSQL+="              )) "
                ENDIF	
                csql+="              AND a.dat_pagto >= '"+cDATAINI+"'  AND a.dat_pagto <= '"+cDATAFIM+"'  AND a.cod_tip_proc in (5,10) "
                csql+="              AND a.cod_empresa = b.cod_empresa  AND a.num_matricula = b.num_matricula"
                csql+="              AND a.nom_depend = b.nom_depend"
                csql+="              GROUP BY   b.num_cpf,  b.nom_depend"     //a.cod_empresa,  a.num_matricula,
                odem:= SQLSelect{cSQL,oconn}
                IF ! Odem:eof .AND. oDEM:RECCOUNT>0
                	WHILE ! ODEM:EOF
                		nPOSPEN:=AScan(aPENCPF,FIXSTR(oDEM:FIELDGET("num_cpf")))
                		IF nPOSPEN>0
                		   aPENVAL[nPOSPEN,4]:=AllTrim(Str(FIXNUM(oDEM:FIELDGET("valor")),15,2))
                	    ENDIF
  	                    aVAL4[4]+=FIXNUM(oDEM:FIELDGET("valor"))
                       oDEM:SKIP()
                    ENDDO
                ENDIF
                odem:close()


                FOR X:=1 TO Len(aPENCPF)
                    cINFO+="Benef.Pensao:"+aPENVAL[X,1]+" CPF:"+aPENCPF[X]+" R$ "+aPENVAL[X,2]
                    cINFO+=IF(Val(aPENVAL[X,3])>0," + 13o. R$"+aPENVAL[X,3],"")
                    cINFO+=IF(Val(aPENVAL[X,4])>0," + PLR. R$"+aPENVAL[X,4],"")+" _ "
                NEXT X
           ENDIF





         cCPF:=SubStr(cCPF,1,3)+SubStr(cCPF,5,3)+SubStr(cCPF,9,3)+SubStr(cCPF,13,2)


        IF Len(AllTrim(cinfo))=0
           cINFO:="."
        ENDIF

        IF Len(AllTrim(cinfo))>0
           IF Len(cINFO)>=200
	          cINFO:=StrTran(cINFO," _ ","_")
	          cINFO:=StrTran(cINFO," R$ ","R$")
	          cINFO:=StrTran(cINFO," + 13o. R$","+13o.R$")
	          cINFO:=StrTran(cINFO,"MultaFGTS 40%","M.FGTS40%")
	          cINFO:=StrTran(cINFO,"AvisoInd+Integr.","Av.Ind.+Intg.")
	          cINFO:=StrTran(cINFO,"Ferias Indenizadas","Fer.Ind.")
	          cINFO:=StrTran(cINFO,"13o.Indenizado","13o.Ind")
	          cINFO:=StrTran(cINFO,"Benef.Pensao","B.Pensao")
           ENDIF
           FWrite(INF,"INF|"+cCPF+"|"+AllTrim(PadR(cINFO,200))+"|")
           FWrite(INF,Chr(13)+Chr(10))
        ENDIF





        nREG02++
 ENDDO

oREG:CLOSE()
oCONN:Disconnect()
FClose(inf)
oPROGWIN:EndDialog()
SELF:POINTER:=POINTER{POINTERARROW}


METHOD IMPLOGIXFUN 
LOCAL oConn AS SQLConnection
LOCAL oREG  AS SQLSelect
LOCAL oStmt AS SQLStatement
LOCAL oSERVER,oDEPTO,OFOSFAM,oFUNCAO,oCBO AS USEFOLHA
LOCAL oMD10,oCIDCONV,oANATEL AS USEREDE
LOCAL cSQL,cMIG,cCBO,cDIRFOTO,cCPF,cPIS,cRG,cIBGE,cBUSCA,cCNH,cTITULO,cTITULOUF,cEMAIL AS STRING
LOCAL nPOSBUS,nPOS,nLASTREC,nGRAU,nLEN,nFIM,nRACA AS DWORD
LOCAL nNUMERO,nREQUISI,nHANDLE,nNACION,nOCO,nCARGO,nSOCIAL
LOCAL aUNI,aCEN,aRET,aCAMPOS,aCNV,aDAD,acom  AS ARRAY     //   aregant
LOCAL nPERC AS INT
LOCAL I AS WORD
LOCAL oPROgWIN AS PROGWIN
LOCAL cESCOLA,cCEP,cESTADO,cCIDADE,cBAIRRO,cARQERR,cENDERECO,cENDCOMPL,cENDNUM,cENDTIP AS STRING
LOCAL cINICEP,cFIMCEP,cINICEP2,cFIMCEP2,cTELEFONE,cPREF,cDDD,cBACEN,cREGISTRO,cRACA,cEMPTAB AS STRING
LOCAL oVIEW AS JRTF
LOCAL dADMITIDO,dDEMITIDO,dENTREGA AS DATE
LOCAL lSALFAM,lRICI32 AS LOGIC 

aCOM:={zMES,zANO,ZEMPRESA}


cDIRFOTO:=PEGINIVAL(ZCURINI,"FOTOS","FUNBMP")	
CDIRFOTO:=CAMINEX(cDIRFOTO,ZMES,ZANO,ZEMPRESA)

aCNV:={}
AAdd(aCNV,{"R ","R"})
AAdd(aCNV,{"RU ","R"})
AAdd(aCNV,{"R.","R"})
AAdd(aCNV,{"R:","R"})
AAdd(aCNV,{"RUA ","R"})
AAdd(aCNV,{"RUA:","R"})
AAdd(aCNV,{"AVENIDA ","AV"})
AAdd(aCNV,{"TRAVESSA ","TV"})
AAdd(aCNV,{"TRAVES ","TV"})
AAdd(aCNV,{"TRAV ","TV"})
AAdd(aCNV,{"TR ","TV"})
AAdd(aCNV,{"TR.","TV"})
AAdd(aCNV,{"ESTRADA ","EST"})
AAdd(aCNV,{"EST.","EST"})
AAdd(aCNV,{"E."  ,"EST"})
AAdd(aCNV,{"EST ","EST"})
AAdd(aCNV,{"VIELA ","VLA"})
AAdd(aCNV,{"AV ","AV"})
AAdd(aCNV,{"AV.","AV"})
AAdd(aCNV,{"ALAMEDA ","AL"})
AAdd(aCNV,{"AL.","AL"})
AAdd(aCNV,{"AL ","AL"})
AAdd(aCNV,{"PCA ","PC"})
AAdd(aCNV,{"ACESSO ","AC"})
AAdd(aCNV,{"BECO ","BC"})
AAdd(aCNV,{"CALCADA ","CALC"})
AAdd(aCNV,{"VIADUTO","VD"})
AAdd(aCNV,{"LADEIRA","LD"})




  oProgWin := ProgWin{}
  oProgWin:Caption:="Sincronizando Funcionarios"
  oProgWin:SHOW()
  nPOS:=1


   cMIG:=StrZero(zempRESA,2)
   oSERVER:=USEFOLHA{"FIRMA"}
   IF oSERVER:nERRO#0
       RETU SELF
   ENDIF
   oSERVER:GOTOP()
   IF oSERVER:SEEK(ZEMPRESA)
   	  IF ! Empty(oSERVER:FIELDGET("CODEMPMIG"))
         cMIG:=oSERVER:FIELDGET("CODEMPMIG")
       //  cCGC:=oSERVER:FIELDGET("CGC")
      ENDIF
    ENDIF
    oSERVER:CLOSE()


cARQERR:="C:\TEMP\"+cMIG+"_IMLXERRO.TXT"
nHANDLE:=FCreate(cARQERR)

    oSERVER:=USEFOLHA{"FO_PES",.F.}
    IF oSERVER:nERRO#0
       RETU SELF
    ENDIF

    OFOSFAM:=USEFOLHA{"FOSFAM",.F.}
    IF OFOSFAM:nERRO#0
       RETU SELF
    ENDIF
    oFOSFAM:SetOrder(1)


   aRET:={zCURINI,"MD10.DBF",zCURDIR}
   oMD10:=USEREDE{aRET}
   IF oMD10:nERRO#0
       alert("Outro Usuario Arquivo MD10 Aberto - Tente Depois","Erro Abrindo o Arquivo")
       oSERVER:Close()
       RETU SELF
   ENDIF	


   aRET:={zCURINI,"CIDCONV.DBF",zCURDIR}
   oCIDCONV:=USEREDE{aRET}
   IF oCIDCONV:nERRO#0
       alert("Outro Usuario Arquivo CIDCONV Aberto - Tente Depois","Erro Abrindo o Arquivo")
       OMD10:CLOSE()
       oSERVER:Close()
       RETU SELF
   ENDIF	


   OFUNCAO:=USEFOLHA{"FUNCAO",.F.}
   IF oFUNCAO:nERRO#0
	  oMD10:CLOSE()
       oSERVER:Close()
      oCIDCONV:close()
      RETU SELF
   ENDIF


   OCBO:=USEFOLHA{"fo_cbon",.F.}
   IF oCBO:nERRO#0
	  oMD10:CLOSE()
      oSERVER:Close()
      oCIDCONV:close()
      oFUNCAO:CLOSE()
      RETU SELF
   ENDIF


   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
   	  RETURN .f.
   ENDIF	

BEGIN SEQUENCE	
	cSQL:= "set isolation to dirty read"
	oStmt := SQLStatement{cSQL,oConn}
	oSTMT:Execute()
RECOVER
    Oconn:Disconnect()
	alert("Erro Conecçao")
	RETURN .f.
END

cEMPTAB:=CMIG
cSQL:=" SELECT cod_empr_tabela FROM empresa_rhu "
cSQL+=" WHERE "
CSQL+=" cod_empresa='" +CMIG+ "'"
oreg:= SQLSelect{cSQL,oconn}
IF ! oREG:EoF	
   cEMPTAB := oREG:FIELDGET("cod_empr_tabela")
ENDIF
Oreg:close()


CSQL:=" SELECT  funcionario.num_matricula,funcionario.cod_uni_funcio,funcionario.cod_cargo,funcionario.dat_admis "
CSQL+="        ,funcionario.dat_opcao_fgts,funcionario.dat_transfer,funcionario.dat_demis,funcionario.nom_completo "
CSQL+="    	   ,funcionario.num_conta_fgts,funcionario.cod_empresa_ant,funcionario.num_matricula_ant "
CSQL+="    	   ,funcionario.cod_vinculo,funcionario.cod_categoria "
CSQL+="    	   ,funcionario.cod_banco_cor,funcionario.num_agencia_cor,funcionario.num_conta_cor,funcionario.dig_conta_cor "
CSQL+="        ,fun_infor.num_pis,fun_infor.num_cpf,cast(fun_infor.num_tit_eleitor AS CHAR(13)) AS num_tit_eleitor,fun_infor.num_sec_eleitor "
CSQL+="        ,fun_infor.num_zona_eleitor,fun_infor.dat_nascimento,fun_infor.cod_nacion,fun_infor.num_telef_res "
CSQL+="        ,fun_infor.ies_sexo,fun_infor.ies_est_civil,fun_infor.cod_grau_instr "
CSQL+="        ,fun_infor.num_cart_ident,fun_infor.uf_ident,fun_infor.ies_org_ident,fun_diversos.dat_emissao_ci "
CSQL+="        ,rhu_funcionarios_compl.num_cartao_saude,rhu_funcionarios_compl.nacionalidade_esocial "
CSQL+="        ,rhu_funcionarios_compl.tip_regime_jornada,cast(fun_infor.num_cart_reserV AS CHAR(12)) AS num_cart_reserV "
CSQL+="        ,cidades.cod_uni_feder AS UFNasc,cidades.den_cidade AS CidNasc,cast(fun_infor.num_categ_reserv AS CHAR(1)) AS num_categ_reserv   "
CSQL+="    	   ,fun_salario.salario,fun_infor.uf_eleitor "
CSQL+="     FROM funcionario LEFT JOIN fun_infor ON fun_infor.cod_empresa = funcionario.cod_empresa  "
CSQL+="     		AND fun_infor.num_matricula = funcionario.num_matricula  "
CSQL+="          LEFT JOIN fun_diversos ON fun_diversos.cod_empresa = funcionario.cod_empresa "
CSQL+="         	AND fun_diversos.num_matricula = funcionario.num_matricula "
CSQL+="      LEFT JOIN rhu_funcionarios_compl ON fUNCIONARIO.cod_empresa=rhu_funcionarios_compl.cod_empresa "
CSQL+="       		AND fUNCIONARIO.num_matricula=rhu_funcionarios_compl.num_matricula  "
CSQL+="         LEFT OUTER JOIN cidades    ON  cidades.cod_cidade = fun_infor.cod_cidade_nasc  "
CSQL+=" LEFT JOIN fun_salario ON fun_salario.cod_empresa = funcionario.cod_empresa "
CSQL+=" 	AND fun_salario.num_matricula = funcionario.num_matricula "
CSQL+=" WHERE funcionario.COD_EMPRESA='" +CMIG+ "'"
CSQL+=" and funcionario.cod_vinculo<>99"
cSQL+=" ORDER BY funcionario.num_matricula"



//MemoWrit("fun01.sql",Csql)

BEGIN SEQUENCE	
   oreg:= SQLSelect{cSQL,oconn}
RECOVER	
	Oconn:Disconnect()
	Oprogwin:EndDialog()
	alert("Erro Conecçao ")
	RETURN .f.
END



  SELF:POINTER:=POINTER{POINTERHOURGLASS}

   oPROgWIN:nSUBTOT:=10
   oPROGWIN:SUBTITULO("Funcionarios",.T.)
   Npos:=0
   nLASTREC:=100
   WHILE ! OREG:EoF	
         nNUMERO := oREG:FIELDGET("num_matricula")

         IF Nnumero=1039
         	AltD()
         ENDIF	


         nPerc := INT(100* nPOS/ nLASTREC)
         nPOS++
         oProgWin:oDcProgBar:Position := nPerc
         oProgWin:oDCMessage:textValue:=Str(nnumero,8)
         IF Npos>100
         	Npos:=1
         ENDIF
         oSERVER:GOTOP()
         IF .not. oSERVER:SEEK(nNUMERO)
            oSERVER:APPEND()
            oSERVER:FIELDPUT("NUMERO",nNUMERO)
            oSERVER:FIELDPUT("CNUMERO",StrZero(nNUMERO,8))
         ENDIF
         oSERVER:FIELDPUTE("cns",oREG:FIELDGET("num_cartao_saude"))
         oSERVER:FIELDPUTE("admitido",oREG:FIELDGET("dat_admis"))
       	 oSERVER:FIELDPUTZ("FGTS",oREG:FIELDGET("dat_opcao_fgts"))
         oSERVER:FIELDPUTZ("FGTS",oREG:FIELDGET("dat_admis")) //caso opcao branco pega admissao
       	 oSERVER:FIELDPUTE("nome",FIXSTR(oREG:FIELDGET("nom_completo")))
         oSERVER:FIELDPUTE("CONTAFGTS",AllTrim((Str(FIXNUM(oREG:FIELDGET("num_conta_fgts"))))))	
         IF Empty(oSERVER:FIELDGET("DEMITIDO"))  .AND. ! IsNil(OREG:FIELDGET("dat_demis"))
         	oSERVER:FIELDPUT("DEMITIDO",oREG:FIELDGET("dat_demis"))
         ENDIF	
         oSERVER:FIELDPUTE("FONE",formataTel(FIXSTR(oREG:FIELDGET("num_telef_res"))))
         IF Len(AllTrim(oSERVER:FIELDGET("FONE")))=4 .AND. AllTrim(oSERVER:FIELDGET("FONE"))="(11)"
            oSERVER:FIELDPUT("FONE","")
         ENDIF	
         oSERVER:FIELDPUTZ("NASC",oREG:FIELDGET("dat_nascimento"))        
           
         nNACION:= oREG:FIELDGET("cod_nacion")

         IF nNACION=0
         	nNACION:=10
         ENDIF	
         cBACEN:=""
         DO CASE
         	CASE nNACION=10
         		 cBACEN:="1058"
         	CASE nNACION=35
                 cBACEN:="2453"
         	CASE nNACION=39
                 cBACEN:="3867"
         ENDCASE
         nOCO:=FIXNUM(oREG:FIELDGET("cod_vinculo"))
         DO CASE
         	CASE nOCO=10  //funcionario
         		oSERVER:FIELDPUTE("EVINC","101")
  		        oSERVER:FIELDPUTE("CATEGORIA","01")
         	CASE nOCO=50  //temporario
         		oSERVER:FIELDPUTE("EVINC","105")
//  		        oSERVER:FIELDPUTE("CATEGORIA","")
         	CASE nOCO=55  //aprendiz
         		oSERVER:FIELDPUTE("EVINC","103")
  		        oSERVER:FIELDPUTE("CATEGORIA","07")
         	CASE nOCO=80 //Diretor
         		oSERVER:FIELDPUTE("EVINC","722")
  		        oSERVER:FIELDPUTE("CATEGORIA","11")
  		        cPREF:="1"
//         	CASE nOCO=99
//         		oSERVER:FIELDPUTE("EVINC",)
//  		    oSERVER:FIELDPUTE("CATEGORIA",)
         ENDCASE

         nOCO:=FIXSTR(oREG:FIELDGET("cod_categoria"))
         DO CASE
         	CASE nOCO="D"
         		oSERVER:FIELDPUTE("TIPO","M")
         	CASE nOCO="G"
         		oSERVER:FIELDPUTE("TIPO","M")
         	CASE nOCO="H"
         		oSERVER:FIELDPUTE("TIPO","H")
         	CASE nOCO="M"
         		oSERVER:FIELDPUTE("TIPO","M")
         	CASE nOCO="T"
         		oSERVER:FIELDPUTE("TIPO","M")
         ENDCASE




         oSERVER:FIELDPUTE("NASCPAIS",cBACEN)

         cRG:=FormataRG(FIXSTR(oREG:FIELDGET("num_cart_ident")))

         IF At('RNE',cRG)>0
            cRG:=StrTran(cRG,'RNE','')
         	oSERVER:FIELDPUTE("RGTIP",'RNE')
         ENDIF	


         oSERVER:FIELDPUTE("RG",cRG)
         oSERVER:FIELDPUTE("RGUF",FIXSTR(oREG:FIELDGET("uf_ident")))
         oSERVER:FIELDPUTE("RGEMIS",FIXSTR(oREG:FIELDGET("ies_org_ident")))
         oSERVER:FIELDPUTE("RGDATA",FIXSTR(oREG:FIELDGET("dat_emissao_ci")))
         oSERVER:FIELDPUTE("BANCO",AllTrim(Str(FIXNUM(oREG:FIELDGET("cod_banco_cor")),3,0)))
         oSERVER:FIELDPUTE("AGENCIA",AllTrim(FIXSTR(oREG:FIELDGET("num_agencia_cor"))))
         oSERVER:FIELDPUTE("CONTA",AllTrim(Str(FIXNUM(oREG:FIELDGET("num_conta_cor")),5)+"-"+FIXSTR(oREG:FIELDGET("dig_conta_cor"))))
         IF Val(oSERVER:FIELDGET("BANCO"))=0
         	 oSERVER:FIELDPUT("BANCO","")
         ENDIF	
         IF Val(oSERVER:FIELDGET("AGENCIA"))=0
         	 oSERVER:FIELDPUT("AGENCIA","")
         ENDIF	
         IF Val(oSERVER:FIELDGET("CONTA"))=0
         	 oSERVER:FIELDPUT("CONTA","")
         ENDIF	
         IF Val(TIRAOUT(oSERVER:FIELDGET("CPF")))=0 .or. !  Valcpf(oserver:FIELDGET("CPF"),FALSE) //em branco ou invalido
         	cCPF:=FIXSTR(oREG:FIELDGET("NUM_CPF"))
         	cCPF:=formatcpf(cCPF)
            oSERVER:FIELDPUTE("CPF",cCPF)
         ENDIF	
         IF Val(TIRAOUT(oSERVER:FIELDGET("PIS")))=0 .or. Len(AllTrim(TIRAOUT(oSERVER:FIELDGET("PIS"))))<>11 .or. ! valpis(oserver:FIELDGET("PIS"),FALSE) //em branco ou invalido
         	cPIS:=oREG:FIELDGETformatted("num_pis")
            cPIS:=AllTrim(cPIS)
            oSERVER:FIELDPUTE("PIS",cPIS)
         ENDIF	
         oSERVER:FIELDPUTZ("SEXO",oREG:FIELDGET("ies_sexo"))
		 
	 IF Empty(oSERVER:FIELDGET("SEXO"))
					aDAD:=PEGNOMESEXO(oSERVER:FIELDGET("NOME"),ZCURINI,ZCURDIR,acom)
					IF aDAD[1]=.T.
					   oSERVER:FIELDPUTE("SEXO",aDAD[2])
					ENDIF
				 ENDIF	 
		 
		 
         OSERVER:FIELDPUTE("TITULO",FIXSTR(oREG:FIELDGET("nUm_tit_eleitor")))
         OSERVER:FIELDPUTe("TITUZONA",      StrZero(FIXNUM(oREG:FIELDGET("num_zona_eleitor")),3,0))
         oSERVER:FIELDPUTe("TITUSECA",      StrZero(FIXNUM(oREG:FIELDGET("num_sec_eleitor" )),3,0))
         OSERVER:FIELDPUTE("RESERV",FIXSTR(oREG:FIELDGET("num_cart_reserv")))
         OSERVER:FIELDPUTE("RESECAT",FIXSTR(oREG:FIELDGET("num_categ_reserv")))
         cTITULO:=OSERVER:FIELDGET("TITULO")
         IF ! Empty(cTITULO)  .AND. CheckTitulo(cTITULO,FALSE)  .AND.  Empty(OSERVER:FIELDGET("DEMITIDO"))
         	cTITULOUF:=AllTrim(FIXSTR(oREG:FIELDGET("uf_eleitor")))
		    IF TituloUF(cTITULO)<>cTITULOUF
		       FWrite(nHANDLE,Str(nNUMERO,8,0)+"-"+"UF do titulo "+cTITULOUF +" <> da obtida pelo numero  "+TituloUF(cTITULO)+Chr(13)+Chr(10))		
		       IF ! Empty(cTITULOUF)
	               cSQL:="UPDATE fun_infor SET uf_eleitor='' WHERE COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + " ;"
	     	        BEGIN SEQUENCE	
	 					oStmt := SQLStatement{cSQL,oConn}
						oSTMT:Execute()
				    RECOVER
				         FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
				 	END	
              ENDIF	
		    ENDIF	
        ENDIF
        oSERVER:FIELDPUTZ("NUMREGANT",FIXNUM(oREG:FIELDGET("num_matricula_ant")))
        oSERVER:FIELDPUTZ("NUMEMPANT",Val(FIXSTR(oREG:FIELDGET("cod_empresa_ant"))))
        oSERVER:FIELDPUTZ("dattransf",oREG:FIELDGET("dat_transfer"))
        IF AllTrim(oSERVER:FIELDGET("UNIFUN"))<>AllTrim(oREG:FIELDGET("cod_uni_funcio")) //cargo salario muda status
           oserver:FIELDPUT("OCOFGTS","")
           oserver:FIELDPUT("INSALUBRI","")
           oserver:FIELDPUT("PERICULO","")
           OSERVER:FIELDPUT("MODIRETA","")
           OSERVER:FIELDPUT("CCUSTO",0)
        ENDIF
       	oSERVER:FIELDPUTE("UNIFUN",oREG:FIELDGET("cod_uni_funcio"))
       	nCARGO:=oREG:FIELDGET("cod_cargo")
        IF oSERVER:FIELDGET("FUNCAO")<>nCARGO //cargo salario muda status
           oserver:FIELDPUT("OCOFGTS","")
           oserver:FIELDPUT("INSALUBRI","")
           oserver:FIELDPUT("PERICULO","")
        ENDIF	
      	oSERVER:FIELDPUTE("FUNCAO",nCARGO)
        oSERVER:FIELDPUTE("ESTCIVIL",FIXSTR(oREG:FIELDGET("ies_est_civil")))
       	nGRAU:=FIXNUM(oREG:FIELDGET("cod_grau_instr"))
       	cESCola:=	escolalogix(nGRAU)
       	IF Val(cESCOLA)>0  .AND. Val(cESCOLA)<13
            oserver:FIELDPUTE("EScRAIS",cESCOLA)
        ENDIF
        oFUNCAO:GOTOP()
    	IF oFUNCAO:seek(nCARGO)
    	   cCBO:=OFUNCAO:FIELDGET("CBONEW")
    	   oCBO:GOTOP()
    	   IF oCBO:SEEK(cCBO)
   	     	  IF nGRAU<OCBO:FIELDGET("CAGEDESCO")
   	     	   	 FWrite(nHANDLE, Str(nNUMERO,8,0)+" CBO: "+cCBO+" Escolaridade "+Str(OCBO:FIELDGET("CAGEDESCO"))+" funcionario "+Str(nGRAU)+Chr(13)+Chr(10))
    	   	  ENDIF
    	  ENDIF
   	    ENDIF

       //local de nascimento
       cIBGE:=""
  	   cESTADO:= FIXSTR(oREG:FIELDGET("ufnasc"))
       cCIDADE:= AllTrim(FIXSTR(oREG:FIELDGET("cidnasc")))
       IF ! Empty(cCIDADE)  .AND. ! Empty(cCIDADE)
	       oCIDCONV:GOTOP()
	       IF oCIDCONV:SEEK(cESTADO+cCIDADE)
	          cCIDADE:=AllTrim(oCIDCONV:FIELDGET("CIDDES"))
	       ENDIF
	       oMD10:GOTOP()
	       IF oMD10:SEEK(cESTADO+cCIDADE)
	          cIBGE:=oMD10:FIELDGET("CODIBGE")
	       ENDIF
	   ELSE
	   	  FWrite(nHANDLE, Str(nNUMERO,8,0)+" Local Nascimento Cidade/UF nao preenchido "+Chr(13)+Chr(10))
       ENDIF
       IF cESTADO='AC'  .AND. cCIDADE='CAMPINAS'
       	  cIBGE:=""
          oserver:FIELDPUTE("NASCIBGE","")
       ENDIF	
       IF ! Empty(cIBGE)
   	      oserver:FIELDPUTE("NASCIBGE",cIBGE)
       ELSE
          FWrite(nHANDLE, Str(nNUMERO,8,0)+" Local Nascimento Sem Codigo/IBGE ou nao e municipio:" +Cestado+"-"+ cCIDADE +Chr(13)+Chr(10))
       ENDIF
       IF Empty(FIXSTR(oREG:FIELDGET("nacionalidade_esocial")))
   	   	  IF nNACION=10
   	   	  	 IF nNUMERO<9999 //nao gerar diretores
        	    cSQL:="UPDATE RHu_funcionarios_compl SET nacionalidade_esocial='001' WHERE COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + " ;"
     	        BEGIN SEQUENCE	
 					oStmt := SQLStatement{cSQL,oConn}
					oSTMT:Execute()
			    RECOVER
			         FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
			 	END
        	 ENDIF
          ELSE
    	     FWrite(nHANDLE, Str(nNUMERO,8,0)+" Nascionalidade esocial nao preenchida "+Chr(13)+Chr(10))
   	   	  ENDIF
   	   ENDIF	
   	   oserver:FIELDPUTZ("ETJOR",FIXSTR(oREG:FIELDGET("tip_regime_jornada"))) // 1=Jornada clt
	   oSERVER:FIELDPUTE("SALADM",FIXNUM(oREG:FIELDGET("SALARIO")))
   	   Oreg:skip()
   ENDDO	
   Oreg:close()


   oPROgWIN:SUBTITULO("Centro de Custo",.T.)
   Oprogwin:SKIPsub(1)
   aUNI:={}
   aCEN:={}
   cSQL:="SELECT cod_uni_funcio,cod_centro_custo,ies_uni_prod FROM unidade_funcional"
   CSQL+=" WHERE COD_EMPRESA='" +CMIG+ "' AND dat_validade_fim>=today"

BEGIN SEQUENCE
   oreg:= SQLSelect{cSQL,oconn}
RECOVER	
    Oconn:Disconnect()
  	Oprogwin:EndDialog()
	alert("Erro Conecçao ")
	RETURN .f.
END


   Npos:=0
   nLASTREC:=100
   WHILE ! oREG:EoF


       nPerc := INT(100* nPOS/ nLASTREC)
       nPOS++
       oProgWin:oDcProgBar:Position := nPerc
       oProgWin:oDCMessage:textValue:=oREG:FIELDGET("cod_uni_funcio")

       IF nPos=100
       	  Npos:=1
       ENDIF


   	  AAdd(aUNI,AllTrim(oREG:FIELDGET("cod_uni_funcio")))
      AAdd(aCEN,{oREG:FIELDGET("cod_centro_custo"),oREG:FIELDGET("ies_uni_prod")})
   	  oREG:Skip()
   ENDDO	
   oREG:CLOSE()


   oPROgWIN:SUBTITULO("Unidade Funcional",.T.)
   Oprogwin:SKIPsub(1)
   npos:=0
   nLASTREC:=Oserver:RecCount
   Oserver:gotop()
   WHILE ! Oserver:EoF
   	   nPerc := INT(100* nPOS/ nLASTREC)
       nPOS++
       oProgWin:oDcProgBar:Position := nPerc
       oProgWin:oDCMessage:textValue:=oSERVER:FIELDGET("UNIFUN")
   	   nPOSBUS:=AScan(aUNI,AllTrim(oSERVER:FIELDGET("UNIFUN")))
   	   IF nPOSBUS>0
   	   	  OSERVER:FIELDPUTE("CCUSTO",aCEN[nPOSBUS][1])
   	   	  oSERVER:FIELDPUTE("DEPTO",aCEN[nPOSBUS][1])
   	   ENDIF
  	   Oserver:Skip()
   ENDDO	


   oPROgWIN:SUBTITULO("Pai/Mae dependentes fosfam",.T.)
   Oprogwin:SKIPsub(1)
   npos:=0
   nLASTREC:=Oserver:RecCount
   Oserver:gotop()
   WHILE ! Oserver:EoF
   	   nPerc := INT(100* nPOS/ nLASTREC)
       nPOS++
       nNUMERO:=oSERVER:FIELDGET("NUMERO")
       oProgWin:oDcProgBar:Position := nPerc
       oProgWin:oDCMessage:textValue:=Str(nNUMERO)
	    IF  ! Empty(OSERVER:FIELDGET("PAI"))	
	  	      nREQUISI:=1
			  cBUSCA  :=Str(nNUMERO,8)+Str(Nrequisi,8)
			  oFOSFAM:GOTOP()
			  IF ! oFOSFAM:SEEK(cBUSCA)
				 oFOSFAM:APPEND()		
				 oFOSFAM:FIELDPUT("NUMERO",nNUMERO)
				 oFOSFAM:FIELDPUT("REQUISI",nREQUISI)
				 oFOSFAM:FIELDPUT("CPFTIT",OSERVER:FIELDGET("CPF")) //grava aqui pois faz parte da chave e abaixo quando falta
				 oFOSFAM:FIELDPUT("NOME"  ,OSERVER:FIELDGET("PAI"))
			  ENDIF				
			 oFOSFAM:FIELDPUTZ("SEXO"  ,"M")
			 oFOSFAM:FIELDPUTZ("GRPA"  ,"01")
			 oFOSFAM:FIELDPUTZ("ESOCIAL","09")	
             OFOSFAM:FIELDPUTZ("ENTREGA",OSERVER:FIELDGET("ADMITIDO"))	
             //gravar o cpftit as vezes temporarios inicialmente nao estao preenchidos grava acima antes pois faz parte da chave
             oFOSFAM:FIELDPUTZ("CPFTIT",OSERVER:FIELDGET("CPF"))
	     ENDIF		
	      IF  ! Empty(OSERVER:FIELDGET("MAE"))	
	  	      nREQUISI:=2
			  cBUSCA  :=Str(nNUMERO,8)+Str(Nrequisi,8)
			  oFOSFAM:GOTOP()
			  IF ! oFOSFAM:SEEK(cBUSCA)
				 oFOSFAM:APPEND()		
				 oFOSFAM:FIELDPUT("NUMERO",nNUMERO)
				 oFOSFAM:FIELDPUT("REQUISI",nREQUISI)
				 oFOSFAM:FIELDPUT("CPFTIT",OSERVER:FIELDGET("CPF"))   //grava aqui pois faz parte da chave e abaixo quando falta
				 oFOSFAM:FIELDPUT("NOME"  ,OSERVER:FIELDGET("MAE"))
			  ENDIF	
			  oFOSFAM:FIELDPUTZ("SEXO"  ,"F")
			  oFOSFAM:FIELDPUTZ("GRPA"  ,"02")			
			  oFOSFAM:FIELDPUTZ("ESOCIAL","09")						
              OFOSFAM:FIELDPUTZ("ENTREGA",OSERVER:FIELDGET("ADMITIDO"))	
             //gravar o cpftit as vezes temporarios inicialmente nao estao preenchidos	 grava acima antes pois faz parte da chave		
              oFOSFAM:FIELDPUTZ("CPFTIT",OSERVER:FIELDGET("CPF"))
	     ENDIF	



   		 cBUSCA  :=Str(nNUMERO,8)
		 oFOSFAM:GOTOP()
		 oFOSFAM:SEEK(cBUSCA)
		 WHILE oFOSFAM:FIELDGET("NUMERO")=nNUMERO  .AND. .NOT. oFOSFAM:EOF
		 	IF Empty(oFOSFAM:FIELDGET("CPFTIT"))
//		 	   AltD()
               oFOSFAM:FIELDPUTZ("CPFTIT",OSERVER:FIELDGET("CPF"))		
		    ENDIF
 		    OFOSFAM:Skip()
		 ENDDO
    	 Oserver:Skip()
   ENDDO	




   oPROgWIN:SUBTITULO("Cargo",.T.)
   Oprogwin:SKIPsub(1)

   aUNI:={}
   aCEN:={}
   cSQL:="SELECT cargo.cod_cargo,cargo.den_cargo,cargo.den_cargo_abrev,cargo.num_cbo,cbo.den_cbo from cargo"
   CSQL+=" LEFT JOIN cbo ON cargo.num_cbo=CBO.cod_cbo "
   CSQL+=" WHERE cargo.COD_EMPRESA='" +CEMPTAB+ "'"
   cSQL+=" and cargo.DAT_VALIDADE_FIM>TODAY "

BEGIN SEQUENCE
   oreg:= SQLSelect{cSQL,oconn}
RECOVER	
    Oconn:Disconnect()
  	Oprogwin:EndDialog()
	alert("Erro Conecçao ")
	RETURN .f.
END

   nPos:=0
   nLASTREC:=100
   WHILE ! oREG:EoF

       cCBO:=oREG:FIELDGET("num_cbo")
	   nPerc := INT(100* nPOS/ nLASTREC)
       nPOS++
       oProgWin:oDcProgBar:Position := nPerc
       oProgWin:oDCMessage:textValue:= Str(oREG:FIELDGET("cod_cargo"))

       IF NPos=100
       	  Npos:=1
       ENDIF	


   	   AAdd(aUNI,oREG:FIELDGET("cod_cargo"))
   	   AAdd(aCEN,{FIXSTR(oREG:FIELDGET("den_cargo")),FIXSTR(oREG:FIELDGET("den_cargo_abrev")),cCBO})

   	   IF  Empty(FIXSTR(oREG:FIELDGET("den_cbo")))
      	   FWrite(nHANDLE,"cbo invalido ou nao cadastrado sistema:"+cCBO+" cargo:"+Str(oREG:FIELDGET("cod_cargo"))+Chr(13)+Chr(10))
   	   ENDIF
   	   oREG:Skip()
   ENDDO	
   oREG:CLOSE()





   oDEPTO:=USEFOLHA{"DEPTO",.F.}
   IF oDEPTO:nERRO#0
   	  oSERVER:CLOSE()
   	  RETU SELF
   ENDIF
   oDEPTO:SETORDER(3)     //Centro Custo


   oPROgWIN:SUBTITULO("UNIDADE/CBO",.T.)
   Oprogwin:SKIPsub(1)

   Npos:=0
   nLASTREC:=Oserver:RecCount
   Oserver:gotop()
   WHILE ! Oserver:EoF
   	   nPerc := INT(100* nPOS/ nLASTREC)
       nPOS++
       oProgWin:oDcProgBar:Position := nPerc
       oProgWin:oDCMessage:textValue:= Str(oSERVER:FIELDGET("FUNCAO"))
   	   nPOSBUS:=AScan(aUNI,oSERVER:FIELDGET("FUNCAO"))

       IF Empty(oSERVER:FIELDGET("UNIFUN"))
       	  oDEPTO:GOTOP()
       	  IF oDEPTO:SEEK(oSERVER:FIELDGET("CCUSTO"))
       	  	 oSERVER:FIELDPUT("UNIFUN",oDEPTO:FIELDGET("UNIFUN"))
       	  ENDIF	
       ENDIF	


       IF Empty(oSERVER:FIELDGET("MODIRETA"))
       	  oDEPTO:GOTOP()
       	  IF oDEPTO:SEEK(oSERVER:FIELDGET("CCUSTO"))
       	  	 oSERVER:FIELDPUT("MODIRETA",oDEPTO:FIELDGET("MODIRETA"))
       	  ENDIF	
       ENDIF	


       oSERVER:FIELDPUT("CNUMERO",StrZero(oSERVER:FIELDGET("NUMERO"),8))
       oSERVER:FIELDPUT("DEPSETSEC",oSERVER:FIELDGET("DEPTO") * 1000000 + oSERVER:FIELDGET("SETOR") * 1000 + oSERVER:FIELDGET("SECAO"))
       oSERVER:FIELDPUT("CPF",formatcpf(oSERVER:FIELDGET("CPF")))


   	   Oserver:Skip()
   ENDDO	
   oSERVER:CLOSE()

   oPROgWIN:SUBTITULO("Funcoes/CBO",.T.)
   Oprogwin:SKIPsub(1)


//   OFUNCAO:=USEFOLHA{"FUNCAO",.F.}
//   IF oFUNCAO:nERRO#0
//      RETU SELF
//   ENDIF

//abertura cadastro funcao acima
   Npos:=0
   nLASTREC:=Len(aUNI)
   FOR nPOSBUS:=1 TO nLASTREC
   	   nNUMERO:=aUNI[NPOSBUS]
	   nPerc := INT(100* nPOS/ nLASTREC)
       nPOS++
       oProgWin:oDcProgBar:Position := nPerc
       oProgWin:oDCMessage:textValue:= Str(nnumero)
   	   oFUNCAO:GOTOP()
   	   IF ! oFUNCAO:seek(Nnumero)
   	   	  oFUNCAO:Append()
   	   	  oFUNCAO:FIELDPUT("codigo",nNUMERO)
   	   ENDIF	
       oFUNCAO:FIELDPUT("NOME",aCEN[nPOSBUS][1])
       oFUNCAO:FIELDPUT("FNOME",aCEN[nPOSBUS][2])
       oFUNCAO:FIELDPUT("CBONEW",aCEN[nPOSBUS][3])
       oFUNCAO:FIELDPUT("TEMLX",'S') //marca que ja tem o cadastro para nao integrar no sinergy novamente
   NEXT nPOSBUS


   oSERVER:=USEFOLHA{"FO_PES",.F.}
   IF oSERVER:nERRO#0
      RETU SELF
   ENDIF



    CSQL:="SELECT   DISTINCT  f.cod_empresa,f.num_matricula,f.nom_funcionario,"
    cSQL+="        fi.end_funcio,fi.end_compl,"
	CSQL+="        b.den_bairro,c.den_cidade,c.cod_uni_feder,fi.cod_cep,f.dat_admis,f.dat_demis,"
    CSQL+="        fu.num_endereco,fu.num_cart_prof,fu.num_serie_prof,fu.uf_prof,"
    CSQL+="        fu.cat_cnh,fu.num_cnh,fu.dat_venc_cnh,fu.num_inscricao_inss,fu.classe,fu.ies_raca_cor,fu.usa_alvara, "
    CSQL+="        rhu_funcionarios_compl.tip_logradouro,fi.ies_abono_per,fi.ies_abono_per, "
    cSQL+="        fun_meio_contato.den_contato AS email,FU.dat_aposentadoria,fu.dat_emissao_ctps,fu.dat_emissao_ci    "
    cSQL+="        ,celular.den_contato AS numcelular"	
	CSQL+=" FROM   funcionario f LEFT OUTER JOIN fun_infor fi ON  fi.cod_empresa   = f.cod_empresa  AND fi.num_matricula = f.num_matricula"
	CSQL+="                      LEFT OUTER JOIN fun_diversos fu ON  fu.cod_empresa   = f.cod_empresa  AND fu.num_matricula = f.num_matricula"
	CSQL+="                      LEFT OUTER JOIN bairros b    ON  b.cod_cidade = fi.cod_cidade  AND b.cod_bairro = fi.cod_bairro"
	CSQL+="                      LEFT OUTER JOIN cidades c    ON  c.cod_cidade = fi.cod_cidade"
	CSQL+=" 					 LEFT JOIN rhu_funcionarios_compl ON f.cod_empresa=rhu_funcionarios_compl.cod_empresa AND f.num_matricula=rhu_funcionarios_compl.num_matricula "
    CSQL+=" 					 LEFT JOIN fun_meio_contato ON f.cod_empresa=fun_meio_contato.cod_empresa AND f.num_matricula=fun_meio_contato.num_matricula AND ies_contato='E' AND fun_meio_contato.den_contato IS NOT NULL "	
    cSQL+=" 					 LEFT JOIN fun_meio_contato AS CELULAR ON f.cod_empresa=celular.cod_empresa AND f.num_matricula=celular.num_matricula AND celular.ies_contato='C' AND celular.den_contato IS NOT NULL "	
	CSQL+=" where f.cod_empresa='" +CMIG+ "'"


   oPROgWIN:SUBTITULO("Enderecos",.T.)
   Oprogwin:SKIPsub(1)

BEGIN SEQUENCE
   oreg:= SQLSelect{cSQL,oconn}
RECOVER	
    Oconn:Disconnect()
  	Oprogwin:EndDialog()
	alert("Erro Conecçao ")
	RETURN .f.
END

   Npos:=0
   nLASTREC:=100
   WHILE ! OREG:EoF	
         nNUMERO := oREG:FIELDGET("num_matricula")
         nPerc := INT(100* nPOS/ nLASTREC)
         nPOS++
         oProgWin:oDcProgBar:Position := nPerc
         oProgWin:oDCMessage:textValue:=Str(nnumero,8)
         IF Npos>100
         	Npos:=1
         ENDIF
         oSERVER:GOTOP()
         IF oSERVER:SEEK(nNUMERO)
         	cCEP:=StrZero(FIXNUM(oREG:FIELDGET("cod_cep")),8)
         	cCEP:=SubStr(cCEP,1,5)+"-"+SubStr(cCEP,6)
         	cENDTIP:=AllTrim(FIXSTR(oREG:FIELDGET("tip_logradouro")))
         	cENDERECO:=AllTrim(FIXSTR(oREG:FIELDGET("end_funcio")))
         	cENDCOMPL:=AllTrim(FIXSTR(oREG:FIELDGET("end_compl")))
         	cENDNUM:=AllTrim(Str(FIXNUM(oREG:FIELDGET("num_endereco"))))
         	cENDERECO:=StrTran(cENDERECO,cENDNUM,"")
         	cENDERECO:=StrTran(cENDERECO,cENDCOMPL,"")
         	cENDERECO:=StrTran(cENDERECO,",","")



    	    oSERVER:FIELDPUTE("ENDTIP",cENDTIP)
        	oSERVER:FIELDPUTE("ENDER",cENDERECO)
            oSERVER:FIELDPUTE("ENDCOMPL",cENDCOMPL)
            oSERVER:FIELDPUTE("ENDNUM",cENDNUM)

            IF Val(oSERVER:FIELDGET("ENDNUM"))=0
         	   oSERVER:FIELDPUT("ENDNUM","")
            ENDIF	

         	IF Val(oSERVER:FIELDGET("PROFIS"))=0
         	   oSERVER:FIELDPUT("PROFIS",StrZero(FIXNUM(oREG:FIELDGET("num_cart_prof")),7))
            ENDIF	
            IF Val(oSERVER:FIELDGET("SERIE"))=0
               oSERVER:FIELDPUT("SERIE",StrZero(FIXNUM(oREG:FIELDGET("num_serie_prof")),5))
            ENDIF	
            oSERVER:FIELDPUTE("CTPSUF",oREG:FIELDGET("UF_PROF"))
            oSERVER:FIELDPUTE("CTPSDATA",FIXDATA(oREG:FIELDGET("dat_emissao_ctps")))

            //Converte padrao sefip/rais/logix para padrao e social racs
            nRACA:=FIXNUM(oREG:FIELDGET("ies_raca_cor"))
            cRACA:=""
            DO CASE
               CASE nRACA=1
                    cRACA:="5"
               CASE nRACA=2
                    cRACA:="1"
               CASE nRACA=4
                    cRACA:="2"
               CASE nRACA=6
                    cRACA:="3"
               CASE nRACA=8
                    cRACA:="4"
               CASE nRACA=9
                    cRACA:="9"
            ENDCASE

            IF Empty(Craca)
               FWrite(nHANDLE, Str(nNUMERO,8,0)+" Etinia nao Preenchida "+Chr(13)+Chr(10))
            ENDIF

            oSERVER:FIELDPUTE("RACS",cRACA)   //grava padrao esocial racs



            cBAIRRO:=FIXSTR(oREG:FIELDGET("DEN_BAIRRO"))
            IF ! Empty(cBAIRRO)
               IF Empty(oSERVER:FIELDGET("BAIRRO")) .OR. cBAIRRO<>oSERVER:FIELDGET("BAIRRO")
           	      oSERVER:FIELDPUT("BAIRRO",cBAIRRO)
           	   ENDIF
        	ENDIF
            cESTADO:=FIXSTR(oREG:FIELDGET("cod_uni_feder"))
            cCIDADE:=AllTrim(FIXSTR(oREG:FIELDGET("DEN_CIDADE")))
            IF ! Empty(cESTADO)  .AND. ! Empty(cCIDADE)
	            oCIDCONV:GOTOP()
	            IF oCIDCONV:SEEK(cESTADO+cCIDADE)
	               cCIDADE:=AllTrim(oCIDCONV:FIELDGET("CIDDES"))
	            ENDIF
	        ENDIF
      	  oSERVER:FIELDPUTE("ESTADO",cESTADO)
       	  oSERVER:FIELDPUTE("CIDADE",cCIDADE)
  	      oSERVER:FIELDPUTE("CEP",cCEP) //evita apagar

          oSERVER:FIELDPUTE("CI",Val(AllTrim(FIXSTR(oREG:FIELDGET("num_inscricao_inss")))))
          oSERVER:FIELDPUTE("CLASSE",AllTrim(FIXSTR(oREG:FIELDGET("classe"))))

         cCNH:=AllTrim(Str(FIXNUM(oREG:FIELDGET("num_cnh")),11,0))
         IF Val(cCNH)>0
         	oSERVER:FIELDPUTE("CNH",cCNH)
            oSERVER:FIELDPUTE("VALCNH",FIXDATA(oREG:FIELDGET("dat_venc_cnh")))
            oSERVER:FIELDPUTZ("CATCNH",AllTrim(FIXSTR(oREG:FIELDGET("cat_cnh"))))
         ENDIF	

         IF oSERVER:FIELDGET("CATCNH")='0'
         	 oSERVER:FIELDPUT("CATCNH","")
         ENDIF	

         cEMAIL:=AllTrim(FIXSTR(oREG:FIELDGET("email")))
         IF Len(cEMAIL)<8
         	cEMAIL:=''
         ENDIF
         IF Len(cEMAIL)>0
            IF CheckEmail(cEMAIL)
               oSERVER:FIELDPUTE("EMAIL",cEMAIL)
            ENDIF
         ENDIF


         oSERVER:FIELDPUTE("APOSENT",AllTrim(FIXSTR(oREG:FIELDGET("ies_abono_per"))))
         oSERVER:FIELDPUTE("APOSEND",FIXDATA(oREG:FIELDGET("DAT_APOSENTADORIA")))
         oSERVER:FIELDPUTE("CELULAR",formataTel(FIXSTR(oREG:FIELDGET("numcelular"))))

         ENDIF	
        oREG:Skip()
   ENDDO
  Oreg:close()





oPROgWIN:SUBTITULO("Dependentes",.T.)
Oprogwin:SKIPsub(1)

CSQL:=" SELECT '01' AS grupoemp,dependentes.cod_empresa,dependentes.num_matricula,dependentes.num_depend,dependentes.nom_depend, "
CSQL+="        dependentes.ies_sexo,dependentes.dat_nasc,dependentes.cod_grau_par,grau_parentesco.den_grau_par,dependentes.ies_dep_vivo, "
CSQL+="        dependentes.nom_cartorio,dependentes.num_reg_livro,dependentes.num_folha, "
CSQL+="        dependentes.num_reg_nasc,dependentes.matr_reg_nasc,dependentes.ies_dep_irrf, "
CSQL+="        rhu_depend_docum.cpf,dependentes.dat_ent_doc,dependentes.dat_bloq_sf,dependentes.ies_dep_vivo,"
CSQL+="        cidades.den_cidade,cidades.cod_uni_feder,dependentes.ies_deficiente,dependentes.ies_vacinado,  "
CSQL+="        RHU_DEPENDENTES_COMPL.num_cartao_saude,dependentes.ies_est_civil,dependentes.ies_nivel_super    "
CSQL+="        ,RHU_DEPENDENTES_COMPL.tip_dependente_sped_social as esocial,grau_parentesco_esocial_970.nome AS esocial_nome    "
CSQL+="        ,obf_cidade_ibge.cidade_ibge"
cSQL+="        ,FUN_INFOR.num_cpf,rhu_benef_depend.nom_mae "
CSQL+="        ,rhu_depend_DOCUM.ci,rhu_depend_DOCUM.estado_emissor_ci,rhu_depend_DOCUM.orgao_emissor_ci,rhu_depend_docum.dat_emissao_ci "	
CSQL+="    ,dependentes.matr_reg_nasc[1,6] AS codigo_cartorio,cartorio_970.nome AS nome_cartorio,cartorio_970.ibge AS ibge_cartorio   "
CSQL+="        ,cidades_cartorio.cod_uni_feder AS uf_cartorio,cidades_cartorio.den_cidade AS cidade_cartorio  "
CSQL+="       ,func_depend_compl_970.data_casamento,func_depend_compl_970.salario_familia "
CSQL+="  FROM dependentes  "
CSQL+=" LEFT JOIN cidades on dependentes.cod_cidade_nasc=cidades.cod_cidade  "
CSQL+=" LEFT JOIN rhu_depend_docum ON DEPENDEntes.cod_empresa=rhu_depend_docum.empresa  "
CSQL+="    AND  dependentes.num_matricula=rhu_depend_docum.matricula  "
CSQL+="    AND dependentes.num_depend=rhu_depend_docum.dependente  "
CSQL+=" left JOIN RHU_DEPENDENTES_COMPL ON  dependentes.cod_empresa=RHU_DEPENDENTES_COMPL.cod_empresa  "
CSQL+="                  AND dependentes.num_matricula=RHU_DEPENDENTES_COMPL.num_matricula  "
CSQL+="               AND dependentes.num_depend=RHU_DEPENDENTES_COMPL.num_depend  "
CSQL+="  LEFT JOIN obf_cidade_ibge ON cidades.cod_cidade=obf_cidade_ibge.cidade_logix "
cSQL+="  LEFT JOIN fun_infor ON dependentes.cod_empresa=FUN_INFOR.cod_empresa"
cSQL+="                      AND DEPENDENTES.num_matricula=FUN_INFOR.num_matricula"
cSQL+="  LEFT JOIN rhu_benef_depend ON dependentes.cod_empresa=rhu_benef_depend.empresa "
cSQL+="                       AND DEPENDENTES.num_matricula=rhu_benef_depend.matricula "
cSQL+="                       AND dependentes.num_depend=rhu_benef_depend.dependente  "
cSQL+=" LEFT JOIN  cartorio_970  ON dependentes.matr_reg_nasc[1,6]=cartorio_970.codigo  "
cSQL+=" LEFT JOIN obf_cidade_ibge AS ibge_cartorio ON  ibge_cartorio.cidade_ibge=cartorio_970.ibge  "
cSQL+=" LEFT JOIN cidades AS cidades_cartorio ON cidades_cartorio.cod_cidade=ibge_cartorio.cidade_logix "
cSQL+=" LEFT JOIN func_depend_compl_970 ON  dependentes.cod_empresa   = func_depend_compl_970.empresa "
cSQL+="                                 AND DEPENDENTES.num_matricula = func_depend_compl_970.matricula "
cSQL+="                                 AND dependentes.num_depend    = func_depend_compl_970.dependente  "
cSQL+=" LEFT JOIN grau_parentesco ON dependentes.cod_grau_par =grau_parentesco.cod_grau_par "
cSQL+="  LEFT JOIN grau_parentesco_esocial_970 ON RHU_DEPENDENTES_COMPL.tip_dependente_sped_social=grau_parentesco_esocial_970.codigo "
CSQL+=" where dependentes.cod_empresa='" +CMIG+ "'"


BEGIN SEQUENCE	
   oreg:= SQLSelect{cSQL,oconn}
RECOVER	
	Oconn:Disconnect()
    Oprogwin:EndDialog()
	alert("Erro Conecçao ")
	RETURN .f.
END
Npos:=0
nLASTREC:=100
WHILE ! OREG:EoF	
     nNUMERO := oREG:FIELDGET("num_matricula")
     nREQUISI:= OREG:FIELDGET("num_depend")
     nGRAU   :=oREG:FIELDGET("cod_grau_par")
     cBUSCA  :=Str(nNUMERO,8)+Str(Nrequisi,8)
     nPerc   := INT(100* nPOS/ nLASTREC)
     nPOS++
     oProgWin:oDcProgBar:Position := nPerc
     oProgWin:oDCMessage:textValue:=Str(nnumero,8)
     IF Npos>100
      	Npos:=1
     ENDIF
     dDEMITIDO:=CToD(Space(8))
     dADMITIDO:=CToD(Space(8))

     oSERVER:GOTOP()
     IF oSERVER:SEEK(nNUMERO)
        IF nGRAU=1
            oSERVER:FIELDPUTZ("PAI",oREG:FIELDGET("nom_depend"))
        ENDIF	
        IF nGRAU=2
           oSERVER:FIELDPUTZ("MAE",oREG:FIELDGET("nom_depend"))
        ENDIF	
        dDEMITIDO:=oSERVER:FIELDGET("DEMITIDO")
        dADMITIDO:=oSERVER:FIELDGET("ADMITIDO")
     ENDIF	

      oFOSFAM:GOTOP()
      IF ! oFOSFAM:SEEK(cBUSCA)
         oFOSFAM:APPEND()
         oFOSFAM:FIELDPUT("NUMERO",nNUMERO)
         oFOSFAM:FIELDPUT("REQUISI",nREQUISI)
         oFOSFAM:FIELDPUT("CPF",FIXSTR(OREG:FIELDGET("CPF")))
         oFOSFAM:FIELDPUT("CPFTIT",FIXSTR(OREG:FIELDGET("num_cpf")))
         oFOSFAM:FIELDPUT("NOME",OREG:FIELDGET("nom_depend"))
      ENDIF
       dENTREGA:=FIXDATA(OREG:FIELDGET("dat_ent_doc"))
       IF dENTREGA<FIXDATA(OREG:FIELDGET("dat_nasc"))
          dENTREGA:=FIXDATA(OREG:FIELDGET("dat_nasc"))
       ENDIF
       IF dENTREGA<dADMITIDO
          dENTREGA:=dADMITIDO
       ENDIF

       cRG:=FormataRG(FIXSTR(oREG:FIELDGET("ci")))
       oFOSFAM:FIELDPUTE("RG",cRG)
       oFOSFAM:FIELDPUTE("RGUF",FIXSTR(OREG:FIELDGET("estado_emissor_ci")))
       oFOSFAM:FIELDPUTE("RGEMIS",FIXSTR(OREG:FIELDGET("orgao_emissor_ci")))
       oFOSFAM:FIELDPUTE("RGDATA",OREG:FIELDGET("dat_emissao_ci"))
       oFOSFAM:FIELDPUTE("VIVO",FIXSTR(OREG:FIELDGET("ies_dep_vivo")))
       oFOSFAM:FIELDPUTE("INVALIDEZ",FIXSTR(OREG:FIELDGET("ies_deficiente")))
       oFOSFAM:FIELDPUTE("ESTCIVIL",FIXSTR(OREG:FIELDGET("ies_est_civil")))
       oFOSFAM:FIELDPUTE("ESTUDO",FIXSTR(OREG:FIELDGET("ies_nivel_super")))
       oFOSFAM:FIELDPUTE("NASCTO",OREG:FIELDGET("dat_nasc"))
       oFOSFAM:FIELDPUTE("CARTORIO",FIXSTR(OREG:FIELDGET("nom_cartorio")))
       oFOSFAM:FIELDPUTE("ENTREGA",dENTREGA)
       oFOSFAM:FIELDPUTE("BAIXA",OREG:FIELDGET("dat_bloq_sf"))
       oFOSFAM:FIELDPUTE("CNS",FIXSTR(OREG:FIELDGET("num_cartao_saude")))
       oFOSFAM:FIELDPUTE("IRRF",OREG:FIELDGET("ies_dep_irrf"))
       oFOSFAM:FIELDPUTE("NOMEMAE",OREG:FIELDGET("nom_mae"))


       oFOSFAM:FIELDPUTE("CASAMENTO",OREG:FIELDGET("data_casamento"))
       oFOSFAM:FIELDPUTE("SALFAM",OREG:FIELDGET("salario_familia"))


       IF ! Empty(OFOSFAM:FIELDGET("BAIXA")) //baixado salario familia = N
          oFOSFAM:FIELDPUTZ("SALFAM","N")
       ENDIF
       IF nGRAU>0
          oFOSFAM:FIELDPUTE("GRPA",StrZero(nGRAU,2))
       ENDIF
       nSOCIAL:=FIXNUM(OREG:FIELDGET("esocial"))
	   IF nSOCIAL=0  .AND. nGRAU>0
	      DO CASE
	         CASE (nGRAU=5 ) //01, "Cônjuge"
	             nSOCIAL:=1
	         CASE (nGRAU=6 ) //02, "Companheiro(a) c
	             nSOCIAL:=2
	         CASE (nGRAU=7  .or. nGRAU=8  .OR. nGRAU=9)  .AND. (Today()-OFOSFAM:FIELDGET("NASCTO"))<=7670 //03, "Filho(a) ou enteado(a)"
	             nSOCIAL:=3
	         CASE  (nGRAU=7  .or. nGRAU=8  .OR. nGRAU=9)  .AND. OFOSFAM:FIELDGET("ESTUDO")='S'   .AND. (Today()-OFOSFAM:FIELDGET("NASCTO"))<=8766 //04, "Filho(a) ou enteado(a) universitário(a) ou cursando escola técnica de 2º grau, até 24 (vinte e quatro) anos"
	             nSOCIAL:=4
	         CASE (nGRAU=7  .or. nGRAU=8  .OR. nGRAU=9)  .AND. OFOSFAM:FIELDGET("INVALIDEZ")='S'  //11 A pessoa absolutamente incapaz, da qual seja tutor ou curador
	             nSOCIAL:=11
	         CASE (nGRAU=10  .or. nGRAU=15)  .AND. (Today()-OFOSFAM:FIELDGET("NASCTO"))<=7670 //06, "Irmão(ã), neto(a) ou bisneto(a) sem arrimo dos pais, do(a) qual detenha a guarda judicial"
	             nSOCIAL:=6
	         CASE (nGRAU=10  .or. nGRAU=15)  .AND. OFOSFAM:FIELDGET("ESTUDO")='S'   .AND. (Today()-OFOSFAM:FIELDGET("NASCTO"))<=8766 //06, "Irmão(ã), neto(a) ou bisneto(a) sem arrimo dos pais, do(a) qual detenha a guarda judicial"
	             nSOCIAL:=6
	         CASE (nGRAU=10  .or. nGRAU=15)  .AND. OFOSFAM:FIELDGET("INVALIDEZ")='S' //11, "A pessoa absolutamente incapaz, da qual seja tutor ou curador")
	             nSOCIAL:=11
	          CASE nGRAU=1  .OR. nGRAU=2  .OR. nGRAU=11  //09, Pai mae avo bisavo
	             nSOCIAL:=9
//	         CASE nGRAU=16 .AND. (Today()-OFOSFAM:FIELDGET("NASCTO"))<=7670  //menor pobre ate 21
//	             nSOCIAL:=
	         CASE nGRAU=18  .AND. OFOSFAM:FIELDGET("INVALIDEZ")='S' ///11, "A pessoa absolutamente incapaz, da qual seja tutor ou curador")
	             nSOCIAL:=11
	      ENDCASE
	   ENDIF
	
	
	

	
	

       IF nSOCIAL>0
          oFOSFAM:FIELDPUTE("ESOCIAL",StrZero(nSOCIAL,2))
       ENDIF
       oFOSFAM:FIELDPUTE("SEXO",OREG:FIELDGET("ies_sexo"))
	   
	   IF Empty(oFOSFAM:FIELDGET("SEXO"))
					aDAD:=PEGNOMESEXO(oFOSFAM:FIELDGET("NOME"),ZCURINI,ZCURDIR,acom)
					IF aDAD[1]=.T.
					   oFOSFAM:FIELDPUTE("SEXO",aDAD[2])
					ENDIF
				 ENDIF


       lSALFAM:=(Today()-OFOSFAM:FIELDGET("NASCTO"))<=5114

       IF OFOSFAM:FIELDGET("NASCTO")<dADMITIDO //filhos ja nascido admissao
       	  IF dADMITIDO-OFOSFAM:FIELDGET("NASCTO")>5114 //filhos ja com 14 anos na admissao
       	  	 lSALFAM:=.F.
       	  ENDIF	
       ENDIF

       IF  FIXNUM(oREG:FIELDGET("cidade_ibge"))>0
           cIBGE:=  StrZero(oREG:FIELDGET("cidade_ibge"),7)
       ENDIF
  	   cESTADO:= FIXSTR(oREG:FIELDGET("cod_uni_feder"))
       cCIDADE:= AllTrim(FIXSTR(oREG:FIELDGET("den_cidade")))
       IF Empty(cIBGE)
	       IF ! Empty(cCIDADE)  .AND. ! Empty(cCIDADE)
		       oCIDCONV:GOTOP()
		       IF oCIDCONV:SEEK(cESTADO+cCIDADE)
		          cCIDADE:=AllTrim(oCIDCONV:FIELDGET("CIDDES"))
		       ENDIF
		       oMD10:GOTOP()
		       IF oMD10:SEEK(cESTADO+cCIDADE)
		          cIBGE:=oMD10:FIELDGET("CODIBGE")	
		       ENDIF
		   ELSE
		   	  IF Empty(DDEMITIDO)
	  		   	  FWrite(nHANDLE, Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+" LOCAL Nascimento Dependente Cidade/UF nao preenchido "+Chr(13)+Chr(10))
	  		  ENDIF
	       ENDIF
	   ENDIF
       IF cESTADO='AC'  .AND. cCIDADE='CAMPINAS'     //alguns dependentes o cadastro erradamentre ACCAMPINAS
       	  cIBGE:=""
          oserver:FIELDPUTE("LOCALIBGE","")
       ENDIF	

       IF ! Empty(cIBGE)
   	      oFOSFAM:FIELDPUTE("LOCALIBGE",cIBGE)
       ELSE
       	   IF Empty(DDEMITIDO)
              FWrite(nHANDLE, Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+" Local Nascimento Dependente Sem Codigo/IBGE ou nao e municipio:" +Cestado+"-"+ cCIDADE +Chr(13)+Chr(10))
           ENDIF
       ENDIF
       oFOSFAM:FIELDPUTE("LOCAL",cCIDADE)
       oFOSFAM:FIELDPUTE("LOCALUF",cESTADO)
       oFOSFAM:FIELDPUTE("LOCALIBGE",cIBGE)


     // cANONASC:=""
      lRICI32:=.T.
      cREGISTRO:=AllTrim(FIXSTR(OREG:FIELDGET("matR_reg_nasc")))
      IF Val(cREGISTRO)=0
         cREGISTRO:=Str(FIXNUM(OREG:FIELDGET("num_reg_nasc")))
         oFOSFAM:FIELDPUTE("FOLHA",FIXSTR(OREG:FIELDGET("num_folha")))
         oFOSFAM:FIELDPUTE("LIVRO",FIXSTR(OREG:FIELDGET("num_reg_livro")))
      ELSE
         IF Len(cREGISTRO)=32
         	IF CHECKRICI(cREGISTRO,.F.)
	 	        oFOSFAM:FIELDPUTE("FOLHA",SubStr(cREGISTRO,21,3))
	            oFOSFAM:FIELDPUTE("NCARTORIO",SubStr(cREGISTRO,1,6))
	            oFOSFAM:FIELDPUTE("TERMO",SubStr(cREGISTRO,24,7))
	            oFOSFAM:FIELDPUTE("LIVRO",SubStr(cREGISTRO,16,5))
	            IF (nGRAU=7   .or. ngrau=8  .or. ngrau=9  .or. ngrau=18) .AND. StrZero(Year(OREG:FIELDGET("dat_nasc")),4)<>  SubStr(cREGISTRO,11,4) .AND. Empty(DDEMITIDO) .AND. lSALFAM
	          	   FWrite(nHANDLE, Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+" verifique ano nascimento <> ano RICI " +Chr(13)+Chr(10))
	            ENDIF
	        ELSE
               IF Empty(DDEMITIDO)  .AND. lSALFAM
          	      FWrite(nHANDLE, Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+" "+zerro +Chr(13)+Chr(10))
           	      lRICI32:=.F.
               ENDIF
               oFOSFAM:FIELDPUTE("NREGIS","")
	        ENDIF
         ELSE
         	 IF Empty(DDEMITIDO)  .AND. lSALFAM
           	    FWrite(nHANDLE, Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+" rici nao tem 32 digitos " +Chr(13)+Chr(10))
           	    lRICI32:=.F.
           	 ENDIF
	         oFOSFAM:FIELDPUTE("FOLHA",FIXSTR(OREG:FIELDGET("num_folha")))
	         oFOSFAM:FIELDPUTE("LIVRO",FIXSTR(OREG:FIELDGET("num_reg_livro")))
  	     ENDIF
      ENDIF

      IF Val(cREGISTRO)=0
      	 cREGISTRO:=""
         IF (nGRAU=7   .or. ngrau=8  .or. ngrau=9  .or. ngrau=18) .AND. Empty(DDEMITIDO) .AND. lSALFAM
             FWrite(nHANDLE, Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+" Registro Nascimento OU rici Incompleto " +Chr(13)+Chr(10))
         ENDIF
      ENDIF
      oFOSFAM:FIELDPUTE("NREGIS",AllTrim(cREGISTRO))
      aCAMPOS:={"cartorio","folha","livro","entrega","NOME","SEXO","NASCTO","GRPA","irrf"}
      FOR I:=1 TO Len(aCAMPOS)
      	  IF Empty(OFOSFAM:FIELDGET(aCAMPOS[I]))
         	 IF Empty(DDEMITIDO)  .AND. ( i>4  .or. ((nGRAU=7   .or. ngrau=8  .or. ngrau=9  .or. ngrau=18) .and. lSALFAM  .AND. (Val(cREGISTRO)>0  .AND. lRICI32) ) )
                FWrite(nhandle,Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+" "+aCAMPOS[I]+" em branco"+Chr(13)+Chr(10))
             ENDIF	
      	  ENDIF	
      NEXT I
      IF Empty(dDEMITIDO)  .AND. (Today()-OFOSFAM:FIELDGET("NASCTO"))>2192 //5117
     	 IF oFOSFAM:FIELDGET("IRRF")="S"
            IF ! Valcpf(oFOSFAM:FIELDGET("CPF"),FALSE)
        	 	FWrite(nhandle,Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+" maior de 6 anos sem cpf"+Chr(13)+Chr(10)) //14 anos
        	ELSE
 	    	    IF ! Empty(OFOSFAM:FIELDGET("CPF"))  .AND. !  Valcpf(OFOSFAM:FIELDGET("CPF"),FALSE)
             	    FWrite(nHANDLE,Str(nNUMERO,8,0)+"-CPF "+PadR(OFOSFAM:FIELDGET("CPF"),20)+" "+ZERRO+Chr(13)+Chr(10))
                    OFOSFAM:FIELDPUT("CPF",'')
		            cSQL:="UPDATE rhu_depend_DOCUM SET CPF='' WHERE EMPRESA='" +CMIG+ "' and matricula=" + Str(nnumero)+ " and dependente=" + Str(nrequisi) +  " ;"
//		                  FWrite(nHANDLE,cSQL+CHR(13)+CHR(10))
		            	 BEGIN SEQUENCE	
		 					oStmt := SQLStatement{cSQL,oConn}
							oSTMT:Execute()
					     RECOVER
					        FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
					 	 END
                ENDIF	
            ENDIF		
     	 ENDIF
     	 IF oFOSFAM:FIELDGET("IRRF")="S"  .AND. Val(OFOSFAM:FIELDGET("ESOCIAL"))=0 // NGRAU<>5 //Esposa
      	 	FWrite(nhandle,Str(nNUMERO,8,0)+" Verificar  "+Str(nREQUISI,8)+" Dependente para imposto de renda maior de 18/21 anos "+Chr(13)+Chr(10))
     	 ENDIF	
  	  ENDIF
   	  IF Empty(dDEMITIDO)  .AND. oFOSFAM:FIELDGET("IRRF")="S"   .and. (Today()-OFOSFAM:FIELDGET("NASCTO"))>2102  .and. (Today()-OFOSFAM:FIELDGET("NASCTO"))<2192        //>5000 <5117 14 anos
         IF ! Valcpf(oFOSFAM:FIELDGET("CPF"),FALSE)
      	 	FWrite(nhandle,Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+" ira fazer 6 anos sem cpf "+DToC(OFOSFAM:FIELDGET("NASCTO"))+Chr(13)+Chr(10))
      	 ENDIF
  	  ENDIF
  	  IF Empty(dDEMITIDO)
  	      IF ! Empty(oFOSFAM:FIELDGET("CNS"))  .AND. ! valcns(oFOSFAM:FIELDGET("CNS"),FALSE)
         	  FWrite(nHANDLE,Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+"-CNS "+PadR(OFOSFAM:FIELDGET("CNS"),20)+" "+ZERRO+Chr(13)+Chr(10))
              OFOSFAM:FIELDPUT("CNS",'')
	            cSQL:="UPDATE rHU_DEPENDENTES_COMPL SET num_cartao_saude='' WHERE COD_EMPRESA='" +CMIG+ "' and NUM_matricula=" + Str(nnumero)+ " and NUM_depend=" + Str(nrequisi) +  " ;"
//	            FWrite(nHANDLE,cSQL+CHR(13)+CHR(10))
	       	BEGIN SEQUENCE	
	 				oStmt := SQLStatement{cSQL,oConn}
						oSTMT:Execute()
				   RECOVER
				       FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
				   END

          ENDIF	
          //filho adotivo enteado tutelado
          IF (nGRAU=7   .or. ngrau=8  .or. ngrau=9  .or. ngrau=18)  .and. Empty(OFOSFAM:FIELDGET("BAIXA")) .AND. (Today()-OFOSFAM:FIELDGET("NASCTO"))>5145 //5114 aqui mais 31 dias
          	 IF nNUMERO<9999 //nao gerar diretores                                                                                               //baixa apos fechamento mes atual
            	 cSQL:="UPDATE dependentes SET dat_bloq_sf='"+DToC(LastDayofMonth(OFOSFAM:FIELDGET("NASCTO")+5114))+"' WHERE COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + " and num_depend="+Str(nREQUISI,8)+" ;"
            	 BEGIN SEQUENCE	
 					oStmt := SQLStatement{cSQL,oConn}
					oSTMT:Execute()
			     RECOVER
			        FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
			 	 END
             ENDIF	
          	 IF OFOSFAM:FIELDGET("NASCTO")<dADMITIDO
                IF dADMITIDO-OFOSFAM:FIELDGET("NASCTO")>5114    //Ja tinha 14 anos na admissao 
                	NOP
                ELSE	
                   FWrite(nhandle,Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+" maior de 14 anos sem data baixa salario familia"+Chr(13)+Chr(10))	
                ENDIF
           	 ELSE
         	 	FWrite(nhandle,Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+" maior de 14 anos sem data baixa salario familia"+Chr(13)+Chr(10))	
         	 ENDIF	
          ENDIF	
       	 IF oREG:FIELDGET("ies_dep_vivo")<>'N'  .and. Today()-OFOSFAM:FIELDGET("NASCTO")>36500
      	 	FWrite(nhandle,Str(nNUMERO,8,0)+" Verificar  "+Str(nREQUISI,8)+" Dependente com mais de 100 anos "+Chr(13)+Chr(10))
     	 ENDIF	
  	  ENDIF
  	  IF Empty(DDEMITIDO)  .and. OFOSFAM:FIELDGET("IRRF")='S'  .and. Val(OFOSFAM:FIELDGET("ESOCIAL"))=0
          FWrite(nHANDLE, Str(nNUMERO,8,0)+" Dependente "+Str(nREQUISI,8)+" Tipo Dependente esocial nao preenchido " +Chr(13)+Chr(10))
      ENDIF




         IF CheckRG(cRG,.F.,"RG",oFOSFAM:FIELDGET("NASCTO"),oFOSFAM:FIELDGET("RGUF"))
       	    IF  At('-',FIXSTR(oREG:FIELDGET("ci")))=0  .AND. Len(cRG)=12
      	  	    IF nNUMERO<9999 //nao gerar diretores
                   cSQL:="UPDATE rhu_depend_DOCUM SET ci='" + cRG+ "' WHERE EMPRESA='" +CMIG+ "' and matricula=" + Str(nnumero)+ " and dependente=" + Str(nrequisi) +  " ;"
                  BEGIN SEQUENCE	
	                   oStmt := SQLStatement{cSQL,oConn}
	                   oSTMT:Execute()
	               RECOVER
	                  FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
	               END
	           ENDIF
           ENDIF
       ELSE
   		  IF (znerro=5  .OR.  znerro=4)   .AND. At('-',cRG)=0  .AND. Len(cRG)=10
      	  	  IF nNUMERO<9999 //nao gerar diretores
    	  	  	 cSQL:="UPDATE rhu_depend_DOCUM SET ci='" + cRG+"-"+zdac+ "' WHERE EMPRESA='" +CMIG+ "' and matricula=" + Str(nnumero)+ " and dependente=" + Str(nrequisi) +  " ;"
        	     BEGIN SEQUENCE	
 					oStmt := SQLStatement{cSQL,oConn}
					oSTMT:Execute()
			     RECOVER
			        FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
			 	 END
        	  ENDIF
       	  ENDIF
       ENDIF

        //nova checagem pois pode ser que so faltava o digito
        IF ! CheckRG(cRG,.F.,"RG",oFOSFAM:FIELDGET("NASCTO"),oFOSFAM:FIELDGET("RGUF"))
           OFOSFAM:FIELDPUT("RG",'')	
           OFOSFAM:FIELDPUT("RGUF",'')	
           OFOSFAM:FIELDPUT("RGEMIS",'')	
           OFOSFAM:FIELDPUT("RGTIP",'')	
           OFOSFAM:FIELDPUT("RGDATA",CToD(Space(10)))	
        ENDIF
     oREG:Skip()
ENDDO
oREG:CLOSE()
OFOSFAM:CLOSE()


oPROgWIN:SUBTITULO("deficiencias",.T.)
Oprogwin:SKIPsub(1)
CSQL:=" SELECT cod_empresa,num_matricula,tip_deficiencia FROM fun_deficiencia "
CSQL+=" LEFT JOIN deficien_fisica on fun_deficiencia.cod_deficiencia=deficien_fisica.cod_deficiencia "
CSQL+=" where cod_empresa='" +CMIG+ "'  AND nvl_integer(tip_deficiencia)>20"
BEGIN SEQUENCE	
   oreg:= SQLSelect{cSQL,oconn}
RECOVER	
	Oconn:Disconnect()
    Oprogwin:EndDialog()
	alert("Erro Conecçao ")
	RETURN .f.
END
Npos:=0
nLASTREC:=100
WHILE ! OREG:EoF	
     nNUMERO := oREG:FIELDGET("num_matricula")
     nPerc := INT(100* nPOS/ nLASTREC)
     nPOS++
     oProgWin:oDcProgBar:Position := nPerc
     oProgWin:oDCMessage:textValue:=Str(nnumero,8)
     IF Npos>100
      	Npos:=1
     ENDIF
     oSERVER:GOTOP()
     IF oSERVER:SEEK(nNUMERO)
        oSERVER:FIELDPUTE("DEFICI",AllTrim(Str(Val(oREG:FIELDGET("tip_deficiencia"))-20)))  //o logix tem um tipo detalhado somando 20 fixo padrao rais 1(21) fisico, auditivo 2(22), visual 3(23), intelectual 4(24), multipla 5(25), reabilitado 6(26)
        IF Val(oSERVER:FIELDGET("DEFICI"))=0                                       //descontando 20 para gravar 1,2,3,4,5,6
           oSERVER:FIELDPUT("DEFICI","")
        ENDIF	
     ENDIF	
   oREG:Skip()
ENDDO
oREG:CLOSE()


 oPROgWIN:SUBTITULO("Fotos-Plugin",.T.)
 Oprogwin:SKIPsub(1)



   aRET:={zCURINI,"ANATEL.DBF",zCURDIR}
   oANATEL:=USEREDE{aRET}
   IF oANATEL:nERRO#0
       alert("Outro Usuario Arquivo ANATEL Aberto - Tente Depois","Erro Abrindo o Arquivo")
       oSERVER:Close()
       oMD10:CLOSE()
       RETU SELF
   ENDIF	
   oANATEL:SetOrder(2)


   oPROgWIN:SUBTITULO("Checagem Diversas",.T.)
   Oprogwin:SKIPsub(1)

   npos:=0
   nLASTREC:=Oserver:RecCount
   Oserver:gotop()
   WHILE ! Oserver:EoF
	   nNUMERO := oSERVER:FIELDGET("NUMERO")
  	//   cNOME   := oSERVER:FIELDGET("NOME")
       dDEMITIDO:=oSERVER:FIELDGET("DEMITIDO")
       dADMITIDO:=oSERVER:FIELDGET("ADMITIDO")


   	   nPerc := INT(100* nPOS/ nLASTREC)
       nPOS++
       oProgWin:oDcProgBar:Position := nPerc
       oProgWin:oDCMessage:textValue:=StrZero(nNUMERO,8)


//       alert(cDIRFOTO)

//        cSQL:="SELECT cod_empresa,num_matricula from func_foto"
//        cSQL+=" WHERE func_foto.num_matricula=" + Str(nNUMERO)
//        CSQL+=" AND func_foto.cod_empresa='" +CMIG+ "'"
//		BEGIN SEQUENCE
//        	oreg:= SQLSelect{cSQL,oconn}
//		RECOVER	
//			Oconn:Disconnect()
//			Oprogwin:EndDialog()
//			alert("Erro Conecçao ")
//			RETU
//		END
//        IF oREG:RecCount>0
//        ELSE	
//        	cFOTOCAM:=cDIRFOTO+StrZero(nNUMERO,4)+".BMP"
//             cSQL:= "insert into func_foto VALUES ('"+ cMIG +"',"+AllTrim(Str(oSERVER:FIELDGET("NUMERO")))
//             cSQL+=",'"+cFOTOCAM+"')"
//             BEGIN SEQUENCE
//               oStmt := SQLStatement{cSQL,oConn}
//               oSTMT:Execute()
//             END
//       ENDIF
//       oREG:CLOSE()

       IF Empty(oserver:FIELDGET("OCOFGTS"))
          cSQL:=" SELECT grau_risco_insalub.ocorrencia_sefip1  FROM rhu_quadro_funcional "
          cSQL+="    LEFT JOIN grau_risco_insalub ON rhu_quadro_funcional.grau_risco_insalub=grau_risco_insalub.cod_grau_risco"
          cSQL+="    WHERE  rhu_quadro_funcional.empresa='" +CMIG+ "'"
          cSQL+="           and  rhu_quadro_funcional.unid_funcional=" +  oSERVER:FIELDGET("UNIFUN")
          cSQL+="           and rhu_quadro_funcional.cargo=" +  Str(oSERVER:FIELDGET("FUNCAO"))
          BEGIN SEQUENCE
            oreg:= SQLSelect{cSQL,oconn}
          RECOVER	
        	Oconn:Disconnect()
       		Oprogwin:EndDialog()
			alert("Erro Conecçao ")
			RETURN .f.
	 	  END
          IF oREG:RecCount>0
          	 nOCO:=FIXNUM(oREG:FIELDGET("ocorrencia_sefip1"))
             oserver:FIELDPUT("OCOFGTS",Str(nOCO,1,0))
             DO CASE
             	CASE nOCO=0  .OR. nOCO=1  .OR. nOCO=5
             		oserver:FIELDPUT("EOCO","1")      //nao exposto
             	CASE nOCO=4  .OR. nOCO=8
             		oserver:FIELDPUT("EOCO","2")      //25 anos
             	CASE nOCO=3  .OR. nOCO=7
             		oserver:FIELDPUT("EOCO","3")     //20 anos
             	CASE nOCO=2  .OR. nOCO=6
             		oserver:FIELDPUT("EOCO","4")     //15 anos
             ENDCASE
          ENDIF
          oREG:CLOSE()
       ENDIF	

       IF Empty(oserver:FIELDGET("E1ADM"))
	      cSQL:="SELECT * from fun_empregos"
	      cSQL+=" WHERE fun_empregos.num_matricula=" + Str(nNUMERO)
	      CSQL+=" AND fun_empregos.cod_empresa='" +CMIG+ "'"
		  BEGIN SEQUENCE
	       	oreg:= SQLSelect{cSQL,oconn}
		  RECOVER	
		 	Oconn:Disconnect()
		 	Oprogwin:EndDialog()
			alert("Erro Conecçao ")
			RETURN .f.
	   	 END
	     IF oREG:RecCount>0
	     	oserver:FIELDPUT("E1ADM","N")
	     ELSE
			oserver:FIELDPUT("E1ADM","S")	
 	     ENDIF
	     oREG:CLOSE()
       ENDIF
       oserver:FIELDPUT("EIADM","1")  //1 Normal 2 acao fiscal 3 acao judicial
       IF Empty(oSERVER:FIELDGET("TIPFGTS")) .and. ! Empty(oSERVER:FIELDGET("CATEGORIA"))  .and. ! Empty(oSERVER:FIELDGET("E1ADM"))
	      cPREF:="9"
	      IF oSERVER:FIELDGET("CATEGORIA")="07"      //Aprendiz
	       	  cPREF:="3"
	       ENDIF
	       IF oSERVER:FIELDGET("CATEGORIA")="11" //diretor
	       	  cPREF:="1"
	       ENDIF
	       IF ! Empty(oSERVER:FIELDGET("dattransf"))      //transferencia
	       	  cPREF+="C"
	       ELSE
              IF oSERVER:FIELDGET("E1ADM")="N"
              	 cPREF+="B"
              ELSE	
              	 cPREF+="A"
              ENDIF	
	       ENDIF	
	      oserver:FIELDPUT("TIPFGTS",cPREF)
 	   ENDIF

       IF Empty(oSERVER:FIELDGET("dattransf"))
       	  oserver:FIELDPUTZ("ETADM","1") //Admissao
       ELSE
       	  oserver:FIELDPUTZ("ETADM","2") //tranferencia //3-fusao 4-cessao
       ENDIF
       oserver:FIELDPUTZ("EREGI","CLT") //CLT RJV RJP
       oserver:FIELDPUTZ("EPREV","RGPS") //RGPS RPPS RPE
       oserver:FIELDPUTZ("ELTRA","1") //1 Urbano //2rural
       oserver:FIELDPUTZ("RGTIP","RG") // RG RGE RIC
       oserver:FIELDPUTZ("ETCOR","1") // 1-inderterminado 2-determinado
       IF Empty(oserver:FIELDGET("INSALUBRI")) .OR. Empty(oserver:FIELDGET("PERICULO"))
     	  cSQL:="SELECT * from adicionais"
          cSQL+=" WHERE cod_uni_funcio=" +  oSERVER:FIELDGET("UNIFUN")
          cSQL+=" AND cod_cargo=" +  Str(oSERVER:FIELDGET("FUNCAO"))
          CSQL+=" AND cod_empresa='" +CMIG+ "'"
          BEGIN SEQUENCE
		       oreg:= SQLSelect{cSQL,oconn}
 		  RECOVER	
 		  		Oconn:Disconnect()
	  			Oprogwin:EndDialog()
		    	alert("Erro Conecçao ")
		 	  RETURN .f.
   		 END
          IF oREG:RecCount>0
             oserver:FIELDPUTE("INSALUBRI",IF(oREG:FIELDGET("PCT_ADIC_INSAL")>0,"S","N"))
             oserver:FIELDPUTE("PERICULO",IF(oREG:FIELDGET("PCT_ADIC_PERIC")>0,"S","N"))
          ENDIF
          oREG:CLOSE()
       ENDIF	
       IF oserver:FIELDGET("CPF")="000.000.000-00"
          oserver:FIELDPUT("CPF","")
       ENDIF	
       IF oserver:FIELDGET("PIS")="**********"
          oserver:FIELDPUT("PIS","")
       ENDIF	
       IF Val(TIRAOUT(oserver:FIELDGET("CEP")))=0
          oserver:FIELDPUT("CEP","")
       ENDIF	
       IF Val(oserver:FIELDGET("PROFIS"))=0
          oserver:FIELDPUT("PROFIS","")
       ENDIF	
       IF Val(oserver:FIELDGET("SERIE"))=0
          oserver:FIELDPUT("SERIE","")
       ENDIF	
       IF TIRAOUT(oserver:FIELDGET("PIS"))=TIRAOUT(oserver:FIELDGET("RG"))
          FWrite(nHANDLE,Str(nNUMERO,8,0)+"-PIS "+PadR(oserver:FIELDGET("PIS"),20)+" e o mesmo do RG"+Chr(13)+Chr(10))
       ENDIF
       IF oserver:FIELDGET("EVINC")<>"722"  .AND. oserver:FIELDGET("EVINC")<> "721"
	       IF ! Empty(oserver:FIELDGET("PIS"))  .AND. ! valpis(oserver:FIELDGET("PIS"),FALSE)
	       	  FWrite(nHANDLE,Str(nNUMERO,8,0)+"-PIS "+PadR(oserver:FIELDGET("PIS"),20)+" "+ZERRO+Chr(13)+Chr(10))
              cSQL:="UPDATE fun_infor SET PIS='' WHERE COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + " ;"
//              FWrite(nHANDLE,cSQL+CHR(13)+CHR(10))
     	        BEGIN SEQUENCE	
 					oStmt := SQLStatement{cSQL,oConn}
					oSTMT:Execute()
			    RECOVER
			         FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
			 	END
	          oserver:FIELDPUT("PIS","")
	       ENDIF	
	   ENDIF
       IF Empty(dDEMITIDO)
      	  IF ! Empty(oserver:FIELDGET("CNS"))  .AND. ! valcns(oserver:FIELDGET("CNS"),FALSE)
        	  FWrite(nHANDLE,Str(nNUMERO,8,0)+"-CNS "+PadR(oserver:FIELDGET("CNS"),20)+" "+ZERRO+Chr(13)+Chr(10))
  	          oserver:FIELDPUT("CNS","")
              cSQL:="UPDATE rhu_funcionarios_compl SET num_cartao_saude='' WHERE COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + " ;"
//              FWrite(nHANDLE,cSQL+CHR(13)+CHR(10))
     	        BEGIN SEQUENCE	
 					oStmt := SQLStatement{cSQL,oConn}
				oSTMT:Execute()
			    RECOVER
			         FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
			 	END
          ENDIF	
       ENDIF
       IF ! Empty(oserver:FIELDGET("CPF"))  .AND. ! Valcpf(oserver:FIELDGET("CPF"),FALSE)
       	  FWrite(nHANDLE,Str(nNUMERO,8,0)+"-CPF "+PadR(oserver:FIELDGET("CPF"),20)+" "+ZERRO+Chr(13)+Chr(10))
             cSQL:="UPDATE fun_infor SET num_cpf='' WHERE COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + " ;"
//              FWrite(nHANDLE,cSQL+CHR(13)+CHR(10))
     	        BEGIN SEQUENCE	
 					oStmt := SQLStatement{cSQL,oConn}
					oSTMT:Execute()
			    RECOVER
			         FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
			 	END
     	  oserver:FIELDPUT("CPF","")
       ENDIF	
       Crg:=AllTrim(oserver:FIELDGET("RG"))
       IF ! CheckRG(CRG,.F.,oserver:FIELDGET("RGTIP"),oserver:FIELDGET("NASC"),oserver:FIELDGET("RGUF")) //   (crg,FALSE)
          IF (znerro=5  .OR.  znerro=4)   .AND. At('-',cRG)=0  .AND. Len(cRG)=9 
          	NOP
             //rg curto ano tem como checar digito
          ELSE	
       	      FWrite(nHANDLE,Str(nNUMERO,8,0)+"-RG  "+PadR(cRG,20)+" "+ZERRO+Chr(13)+Chr(10))
       	  ENDIF
       	  IF (znerro=5  .OR.  znerro=4)   .AND. At('-',cRG)=0  .AND. Len(cRG)=10
      	  	  IF nNUMERO<9999 //nao gerar diretores
        	     cSQL:="UPDATE fun_infor SET num_cart_ident='" + cRG+"-"+zdac + "' WHERE funcionario.COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + " ;"
        	     BEGIN SEQUENCE	
 					oStmt := SQLStatement{cSQL,oConn}
					oSTMT:Execute()
			     RECOVER
			        FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
			 	 END

        	  ENDIF
       	  ENDIF
       ELSE
          IF Empty(oserver:FIELDGET("RGTIP")) //Rg valido pode gravar se tip estiver em branco
             oserver:FIELDPUT("RGTIP","RG")
          ENDIF	
       ENDIF

      //Nova checagem pois pode ter faltado somento o digito verificador
       IF ! CheckRG(CRG,.F.,oserver:FIELDGET("RGTIP"),oserver:FIELDGET("NASC"),oserver:FIELDGET("RGUF")) //   (crg,FALSE)
           OSERVER:FIELDPUT("RG",'')	
           OSERVER:FIELDPUT("RGUF",'')	
           OSERVER:FIELDPUT("RGEMIS",'')	
           OSERVER:FIELDPUT("RGTIP",'')
           OSERVER:FIELDPUT("RGDATA",CToD(Space(10)))	
       ENDIF	


       IF Val(oserver:FIELDGET("TITUZONA"))=0
          oserver:FIELDPUT("TITUZONA","")
       ENDIF	
       IF Val(oserver:FIELDGET("TITUSECA"))=0
          oserver:FIELDPUT("TITUSECA","")
       ENDIF	
       Ctitulo:=oSERVER:FIELDGET("TITULO")
       IF Val(cTITULO)=0
       	  oSERVER:FIELDPUT("TITULO","")
       ENDIF	
       IF  Empty(dDEMITIDO)
          IF ! Empty(cTITULO)
		     IF ! CheckTitulo(cTITULO,FALSE)
		     	 FWrite(nHANDLE,Str(nNUMERO,8,0)+"-"+ZERRO+Chr(13)+Chr(10))
           	     oSERVER:FIELDPUT("TITULO","")	
                 cSQL:="UPDATE fun_infor SET num_tit_eleitor='' WHERE COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + " ;"
     	        BEGIN SEQUENCE	
 					oStmt := SQLStatement{cSQL,oConn}
					oSTMT:Execute()
			    RECOVER
		         FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
			 	END	
	         ELSE
		        IF TituloUF(cTITULO)<>'SP'
		           FWrite(nHANDLE,Str(nNUMERO,8,0)+"-"+"Titulo de Eleitor nao e de SP <> "+TituloUF(cTITULO)+Chr(13)+Chr(10))
		        ENDIF	
		     ENDIF
		  ELSE
             FWrite(nHANDLE,Str(nNUMERO,8,0)+"-"+"Titulo de Eleitor em branco "+Chr(13)+Chr(10))		
		  ENDIF
	   ENDIF

       cCEP:=AllTrim(TIRAOUT(OSERVER:FIELDGET("CEP")))
       IF Len(cCEP)>0  .And. Oserver:FIELDGET("ESTADO")<>cep2uf(cCEP)
       	  FWrite(nHANDLE,Str(nNUMERO,8,0)+"-CEP  "+PadR(oserver:FIELDGET("CEP"),20)+" de outro estado "+Chr(13)+Chr(10))
       	  oSERVER:FIELDPUT("CEP","")

			             cSQL:="UPDATE fun_infor SET cod_cep='' WHERE COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + " ;"
			     	        BEGIN SEQUENCE	
			 					oStmt := SQLStatement{cSQL,oConn}
								oSTMT:Execute()
						    RECOVER
						         FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
						 	END




       ENDIF	

       cIBGE:=""
  	   cESTADO:=OSERVER:FIELDGET("ESTADO")
       cCIDADE:=AllTrim(oSERVER:FIELDGET("CIDADE"))


   	   	  cCEP:=Left(cCEP,5)
          oMD10:GOTOP()
          IF oMD10:SEEK(cESTADO+cCIDADE)
          	   cINICEP:= Left(oMD10:FIELDGET("INICEP"),5)
          	   cFIMCEP:= Left(oMD10:FIELDGET("FIMCEP"),5)
               cINICEP2 := Left(oMD10:FIELDGET("INICEP2"),5)
               cFIMCEP2 := Left(oMD10:FIELDGET("FIMCEP2"),5)
               cIBGE:=oMD10:FIELDGET("CODIBGE")
               IF Val(CCEP)>0
	               IF Val(cINICEP2) > 0
	                  IF (cCEP < cINICEP   .Or. cCEP > cFIMCEP)  .And.   (cCEP < cINICEP2  .Or. cCEP > cFIMCEP2)
	                     FWrite(nHANDLE, Str(nNUMERO,8,0)+" Cep " + cCEP + " fora da faixa cidade: " + cCIDADE + ": " + cINICEP + "-" + cFIMCEP + " / " + cINICEP2 + "-" + cFIMCEP2+Chr(13)+Chr(10))
			             cSQL:="UPDATE fun_infor SET cod_cep='' WHERE COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + " ;"
//			              FWrite(nHANDLE,cSQL+CHR(13)+CHR(10))
			     	        BEGIN SEQUENCE	
			 					oStmt := SQLStatement{cSQL,oConn}
								oSTMT:Execute()
						    RECOVER
						         FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
						 	END
	
                    	 oSERVER:FIELDPUT("CEP","")

			             cSQL:="UPDATE fun_infor SET cod_cep='' WHERE COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + " ;"
//			              FWrite(nHANDLE,cSQL+CHR(13)+CHR(10))
			     	        BEGIN SEQUENCE	
			 					oStmt := SQLStatement{cSQL,oConn}
								oSTMT:Execute()
						    RECOVER
						         FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
						 	END

	                  ENDIF
	               ELSE
	                  IF (cCEP < cINICEP)  .Or. (cCEP > cFIMCEP)
	                     FWrite(nHANDLE, Str(nNUMERO,8,0)+" Cep " + cCEP + " fora da faixa cidade:" + cCIDADE + "=" + cINICEP + "-" + cFIMCEP+Chr(13)+Chr(10))
			             cSQL:="UPDATE fun_infor SET cod_cep='' WHERE COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + " ;"
//			              FWrite(nHANDLE,cSQL+CHR(13)+CHR(10))
			     	        BEGIN SEQUENCE	
			 					oStmt := SQLStatement{cSQL,oConn}
								oSTMT:Execute()
						    RECOVER
						         FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
						 	END	
				         oSERVER:FIELDPUT("CEP","")	
	                  ENDIF
	              ENDIF
	          ENDIF
          ELSE
             FWrite(nHANDLE, Str(nNUMERO,8,0)+" Cidade/UF endereco inexistente:" +Cestado+"-"+ cCIDADE +Chr(13)+Chr(10))
          ENDIF

       IF cESTADO='AC'  .AND. cCIDADE='CAMPINAS'
       	  cIBGE:=""
          oserver:FIELDPUT("IBGE","")
          oSERVER:FIELDPUT("CIDADE","")
          oSERVER:FIELDPUT("ESTADO","")
       ENDIF	


       IF ! Empty(cIBGE)
   	      oSERVER:FIELDPUTE("IBGE",cIBGE)
       ELSE
          FWrite(nHANDLE, Str(nNUMERO,8,0)+" Cidade/UF endereco Sem Codigo/IBGE ou nao e municipio:" +Cestado+"-"+ cCIDADE +Chr(13)+Chr(10))
       ENDIF



       cCNH:=Trim(oSERVER:FIELDGET("CNH"))
       IF Val(cCNH)=0
       	  oSERVER:FIELDPUT("CNH","")
       	  cCNH:=""
       ENDIF	
       IF Empty(cCNH)  .AND. Empty(dDEMITIDO)
     	  IF  oSERVER:FIELDGET("FUNCAO")=70
             FWrite(nhandle,Str(nNUMERO,8,0)+" CNH em branco Motorista"+Chr(13)+Chr(10))
	      ENDIF	
	      IF  oSERVER:FIELDGET("FUNCAO")=140
	          FWrite(nhandle,Str(nNUMERO,8,0)+" CNH em branco Motorista"+Chr(13)+Chr(10))
	      ENDIF	
	      IF  oSERVER:FIELDGET("FUNCAO")=117
	          FWrite(nhandle,Str(nNUMERO,8,0)+" CNH em branco Operador de Empilhadeira"+Chr(13)+Chr(10))
	      ENDIF	
       ENDIF

       IF ! Empty(cCNH)  .AND. Empty(dDEMITIDO)
       	  IF ! validacnh(cCNH) //Len(cCNH)<9 .OR. Len(cCNH)>11           nao tem 9 10 11 digitos
			FWrite(nhandle,Str(nNUMERO,8,0)+" numero CNH Invalida"+Chr(13)+Chr(10))
       	  ENDIF	
       	  IF ! CheckCNHCat(oSERVER:FIELDGET("CATCNH"))
      	  	 FWrite(nhandle,Str(nNUMERO,8,0)+" categoria CNH invalida"+Chr(13)+Chr(10))
       	  ENDIF
       	  IF Empty(oSERVER:FIELDGET("VALCNH"))
             FWrite(nhandle,Str(nNUMERO,8,0)+" validade CNH em branco"+Chr(13)+Chr(10))
       	  ENDIF
       	  IF oSERVER:FIELDGET("VALCNH")<Today()
             FWrite(nhandle,Str(nNUMERO,8,0)+" CNH vencida ou data vencimento errada"+Chr(13)+Chr(10))
       	  ENDIF
       ENDIF


       cENDERECO:=AllTrim(oSERVER:FIELDGET("ENDER"))
       cENDCOMPL:=AllTrim(oSERVER:FIELDGET("ENDCOMPL"))
       cENDNUM  :=AllTrim(oSERVER:FIELDGET("ENDNUM"))
       cENDERECO:=StrTran(cENDERECO,cENDNUM,"")
       cENDERECO:=StrTran(cENDERECO,cENDCOMPL,"")
       cENDERECO:=StrTran(cENDERECO,",","")

       nFIM:=Len(ACNV)
//       IF TRUE //Empty(oSERVER:FIELDGET("ENDTIP"))
          FOR I:=1 TO nFIM
	           nLEN:=Len(aCNV[I,1])
	           IF aCNV[I,1]=SubStr(cENDERECO,1,NlEN)
	             cENDERECO:=AllTrim(SubStr(cENDERECO,NlEN+1))
	             oSERVER:FIELDPUTE("ENDTIP",aCNV[I,2])
	          ENDIF	
          NEXT I
  //     ELSE
   //       IF Empty(oSERVER:FIELDGET("ENDER"))
      //    	 oSERVER:FIELDPUT("ENDTIP","")
   //       ENDIF
    //   ENDIF

       oSERVER:FIELDPUTE("ENDER",cENDERECO)




      cTELEFONE:=PEGTEL(oSERVER:FIELDGET("FONE"))
      cDDD:=PEGDDD(oSERVER:FIELDGET("FONE"))
      cPREF:=PEGPREF(cTELEFONE,.F.)
      IF ! Empty(cPREF) .AND. ! Empty(cDDD)
         IF Len(cPREF)=5 .AND. Left(cpREF,1)="9"   
         	NOP
         	//celular nao criticar
         ELSE	
         	IF Empty(dDEMITIDO)
		       oANATEL:GOTOP()
		       IF oANATEL:SEEK(cDDD+cPREF)
		          IF cESTADO<>oANATEL:FIELDGET("UF") .AND. ! Empty(cESTADO) .AND. ! Empty(oANATEL:FIELDGET("UF"))
		             FWrite(nhandle,Str(nNUMERO,8,0)+" "+cDDD+"-"+cTELEFONE+" "+oANATEL:FIELDGET("UF")+"<>"+cESTADO+" DDD+Prefixo DO Telefonico de outro estado"+Chr(13)+Chr(10))
		          ENDIF
		       ELSE
		         FWrite(nhandle,Str(nNUMERO,8,0)+" "+cDDD+"-"+cTELEFONE+" DDD+Prefixo DO Telefonico nao conferem"+Chr(13)+Chr(10))
		      ENDIF
		    ENDIF
         ENDIF
      ENDIF



      aCAMPOS:={"RGUF","RGEMIS","ADMITIDO","FGTS","NOME","NASCIBGE","SEXO","TITUZONA","TITUSECA","FUNCAO","NASC", ;
                "ESTCIVIL","ESCRAIS","ENDER","ENDTIP","ENDNUM","BAIRRO","PROFIS","SERIE","CTPSUF","IBGE","CEP","PAI","MAE","EMAIL","NASCPAIS","RESERV"}
      IF Empty(dDEMITIDO)  .OR. Year(dDEMITIDO)=ZANO
	      FOR I:=1 TO Len(aCAMPOS)
	      	  IF Empty(oSERVER:FIELDGET(aCAMPOS[I]))
	      	  	  DO CASE
	      	  	  	 CASE (aCAMPOS[I]="PROFIS"  .OR. aCAMPOS[I]="SERIE"  .OR. aCAMPOS[I]="CTPSUF")  .AND. oSERVER:FIELDGET("EVINC")="721"  .AND. oSERVER:FIELDGET("EVINC")="722"
	      	  	  	 	   // Nao critica profissional diretores
	      	  	  	 	   
	      	  	  	 	   NOP
	      	  	  	 CASE aCAMPOS[I]="RESERV"	 .AND.  oSERVER:FIELDGET("SEXO")  ='F'
                          // nao critica reservista feminina	
                          NOP
	      	  	  	 CASE aCAMPOS[I]="RESERV"	 .AND.  oSERVER:FIELDGET("SEXO")  ='M'  .and. (Today()-oSERVER:FIELDGET("NASC"))>6574
                           FWrite(nhandle,Str(nNUMERO,8,0)+" No. Reservista em branco"+Chr(13)+Chr(10))		
	      	  	  	 CASE (aCAMPOS[I]="TITUZONA"  .OR. aCAMPOS[I]="TITUSECA")
                          IF (Today()-oSERVER:FIELDGET("NASC"))>5844	
                              IF ! Empty(oSERVER:FIELDGET("TITULO"))
     	                          FWrite(nhandle,Str(nNUMERO,8,0)+" "+aCAMPOS[I]+" em branco"+Chr(13)+Chr(10))	
     	                      ENDIF
     	                  ELSE 
     	                  	 NOP
                          ENDIF
	      	  	  	 CASE aCAMPOS[I]="TITULO"  .and. (Today()-oSERVER:FIELDGET("NASC"))>5844
   	                      FWrite(nhandle,Str(nNUMERO,8,0)+" "+aCAMPOS[I]+" em branco"+Chr(13)+Chr(10))	
	      	  	  	 OTHERWISE
   	                      FWrite(nhandle,Str(nNUMERO,8,0)+" "+aCAMPOS[I]+" em branco"+Chr(13)+Chr(10))
	              END CASE
	      	  ENDIF	
	      NEXT I
	  ENDIF

      IF (Today()-oSERVER:FIELDGET("NASC"))>6574   
      	 NOP
      ELSE	
      	  IF oSERVER:FIELDGET("EVINC")="103" //menor aprendiz
      	  	 IF (Today()-oSERVER:FIELDGET("NASC"))>5114  
      	  	 	NOP
      	  	 ELSE
                FWrite(nhandle,Str(nNUMERO,8,0)+" funcionario aprendiz com menos de 14 anos"+Chr(13)+Chr(10))
             ENDIF
      	  ELSE	
             FWrite(nhandle,Str(nNUMERO,8,0)+" funcionario com menos de 18 anos"+Chr(13)+Chr(10))
          ENDIF
  	  ENDIF

      cEMAIL:=AllTrim(oSERVER:FIELDGET("EMAIL"))
      IF Len(cEMAIL)<8
      	 cEMAIL:=''
      ENDIF
      IF Len(cEMAIL)>0
      	 IF CheckEmail(cEMAIL)
      	 	NOP
      	 ELSE
      	 	IF Len(cEMAIL)<>0

	            FWrite(nhandle,Str(nNUMERO,8,0)+" email invalido: "+cEMAIL+Chr(13)+Chr(10))	
	            oSERVER:FIELDPUT("EMAIL","")
	             cSQL:="UPDATE fun_meio_contato SET den_contato='' WHERE COD_EMPRESA='" +CMIG+ "' and num_matricula=" + Str(nnumero) + "  AND ies_contato='E' ;"
	     	        BEGIN SEQUENCE	
	 					oStmt := SQLStatement{cSQL,oConn}
						oSTMT:Execute()
				    RECOVER
				         FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
				 	END
           ENDIF

      	 ENDIF
      ENDIF	




   	   Oserver:Skip()


 ENDDO	

   OCBO:CLOSE()
   ofuncao:close()
   oANATEL:close()
   oMD10:CLOSE()
   oCIDCONV:close()
   oSERVER:CLOSE()
   Oprogwin:EndDialog()

   SELF:POINTER:=POINTER{POINTERARROW}

   alert("Concluido")

IF MDG("Marcar Vinculo 99 como demitidos")
   FOR i:=1 TO 7
   	   DO CASE
   	   	  CASE I=1
   	   	  	   cSQL:="UPDATE funcionario SET dat_admis='01/01/2000'  WHERE funcionario.cod_empresa='" +CMIG+ "' AND cod_vinculo=99 ;"
   	   	  CASE I=2
   	   	  	   cSQL:="UPDATE funcionario SET dat_opcao_fgts='01/01/2000'  WHERE funcionario.cod_empresa='" +CMIG+ "' AND cod_vinculo=99 ;"
   	   	  CASE I=3
   	   	  	   cSQL:="UPDATE funcionario SET dat_ult_reaj_sal='01/01/2000'  WHERE funcionario.cod_empresa='" +CMIG+ "' AND cod_vinculo=99 ;"
   	   	  CASE I=4
   	   	  	   cSQL:="UPDATE funcionario SET dat_ult_nivel='01/01/2000'  WHERE funcionario.cod_empresa='" +CMIG+ "' AND cod_vinculo=99 ;"
   	   	  CASE I=5
   	   	  	   cSQL:="UPDATE funcionario SET dat_demis='01/01/2000'  WHERE funcionario.cod_empresa='" +CMIG+ "' AND cod_vinculo=99 and dat_demis is null ;"
   	   	  CASE I=6
   	   	  	   cSQL:="UPDATE funcionario SET dat_atua_convenio='01/01/2000'  WHERE funcionario.cod_empresa='" +CMIG+ "' AND cod_vinculo=99 ;"
   	   	  CASE I=7
   	   	  	   cSQL:="UPDATE funcionario SET dat_atualiz=TO_DATE('2000-01-01 00:01','%Y-%m-%d %H:%M')  WHERE funcionario.cod_empresa='" +CMIG+ "' AND cod_vinculo=99 ;"
   	   ENDCASE	
      BEGIN SEQUENCE	
		oStmt := SQLStatement{cSQL,oConn}
		oSTMT:Execute()
	  RECOVER
        FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
 	 END
   NEXT i
ENDIF



cSQL:=" INSERT INTO func_foto "
cSQL+=" SELECT funcionario.cod_empresa,funcionario.num_matricula,'"+cDIRFOTO+"'||cod_empresa||'\'||cod_empresa||Trim(StrZero(num_matricula,8))||'.bmp' "
cSQL+=" FROM funcionario"
cSQL+=" WHERE cod_empresa||num_matricula "
cSQL+=" NOT IN (SELECT  cod_empresa||num_matricula  FROM func_foto WHERE funcionario.cod_empresa=func_foto.cod_empresa "
cSQL+="       AND funcionario.num_matricula=func_foto.num_matricula) "
BEGIN SEQUENCE	
	oStmt := SQLStatement{cSQL,oConn}
	oSTMT:Execute()
RECOVER
    FWrite(nHANDLE,cSQL+Chr(13)+Chr(10))
END


 Oconn:Disconnect()



   IF MDG("Iniciar o Mes")
   	  INICIAMES()
   ENDIF	
   IF MDG("Apagar Movimento Demitidos")
   	  EXCLUIDEM()
   ENDIF

   IF MDG("Ajustar Fotos")
      SELF:XAJUFOT()	
   ENDIF	

   IF MDG("Sincronizar treinamento")
   	  SELF:FOPESMP04()
   ENDIF

   IF MDG("Sincronizar Historico")
      SELF:XAJUhis()	
   ENDIF	

   IF MDG("Sincronizar Mpoint")
   	  SELF:MPOINT()
   ENDIF	

   FClose(nHANDLE)	
   oVIEW:=JRTF{SELF,cARQERR,"A",.T.,.T.,.T.,.T.}
   oVIEW:SHOW()

METHOD IMPLOGIXHOR 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL oStmt AS SQLStatement
LOCAL cSQL,cMIG,cARQHORA AS STRING
//LOCAL aCOM AS ARRAY      //adad        aret   acom
LOCAL nNUMERO AS DWORD
LOCAL oFIRMA AS USEFOLHA
LOCAL oPROGWIN AS PROGWIN
LOCAL oSERVER //AS USEREDE
LOCAL nHANDLE
LOCAL nSALARIO

oProgWin := ProgWin{SELF}
oProgWin:Caption:="Atulizando"
oProgWin:SHOW()


cMIG:=StrZero(zempRESA,2)
OFirma:=USEFOLHA{"FIRMA"}
IF OFirma:nERRO#0
   oPROGWIN:EndDialog()
   RETU SELF
ENDIF
OFirma:GOTOP()
IF OFirma:SEEK(ZEMPRESA)
   IF ! Empty(OFirma:FIELDGET("CODEMPMIG"))
      cMIG:=oFIRMA:FIELDGET("CODEMPMIG")
   ENDIF
ENDIF
OFIRMA:CLOSE()


cARQHORA:=PEGINIVAL(zCURINI,"HORAS.DBF","CAMINHO")
Carqhora:=CAMINEX(Carqhora,zmes,zano,zempresa)
CARQHORA+="H"+StrZero(ZEMPRESA,2)+Right(StrZero(ZANO,4),2)+StrZero(ZMES,2) //+".DBF"

oSERVER:=DBSERVER{caRQHORA,,,"DBFCDX"}
oSERVER:SetIndex(cARQHORA)
//alert(cARQHORA)
//RETU

//   aRET:={zCURINI,"HORAS.DBF",zCURDIR}
//   aCOM:={zMES,zANO,ZEMPRESA}
//   oSERVER:=USEREDE{aRET,,,,aCOM}

   IF ! oSERVER:USED
 	  oPROGWIN:EndDialog()
      RETU SELF
   ENDIF


   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
 	   oPROGWIN:EndDialog()
   	  RETURN .f.
   ENDIF	


cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()


nHANDLE:=FCreate("C:\TEMP\"+"LXPRGHOR.TXT")


cSQL:="SELECT * from funcionario"
cSQL+=" WHERE dat_demis IS NULL"
CSQL+=" AND cod_empresa='" +CMIG+ "'"
CSQL+=" ORDER BY num_matricula"


   oPROGWIN:reset()
   oreg:= SQLSelect{cSQL,oconn}
   oPROGWIN:NTOTAL:=oREG:RecCount
   WHILE ! oREG:EoF	
       nNUMERO := oREG:FIELDGET("num_matricula")
       oPROGWIN:TITULO(Str(nNUMERO),.T.)
       oSERVER:GOTOP()
       IF ! oSERVER:SEEK(nNUMERO)
       	  oSERVER:APPEND()
       	  oSERVER:FIELDPUT("NUMERO",nNUMERO)
       ENDIF

         IF Empty(oSERVER:FIELDGET("dataadn"))
         	oSERVER:FIELDPUT("dataadn",oREG:FIELDGET("dat_admis"))
         ENDIF

         IF Empty(oSERVER:FIELDGET("nome"))
         	oSERVER:FIELDPUT("nome",oREG:FIELDGET("nom_completo"))
         ENDIF	

         IF Empty(oSERVER:FIELDGET("admitido"))
            oSERVER:FIELDPUT("admitido",oREG:FIELDGET("dat_admis"))
         ENDIF	

       oPROGWIN:SKIP(1)
   	   Oreg:skip()
   ENDDO	
   Oreg:close()




cSQL:="SELECT * "
CSQL+=" FROM fun_salario"
CSQL+=" where cod_empresa='" +CMIG+ "'"

   oPROGWIN:reset()
   oreg:= SQLSelect{cSQL,oconn}
   oPROGWIN:NTOTAL:=oREG:RecCount
   WHILE ! oREG:EoF	
       nNUMERO := oREG:FIELDGET("num_matricula")
       oPROGWIN:TITULO(Str(nNUMERO),.T.)
       oSERVER:GOTOP()
       IF oSERVER:SEEK(nNUMERO)
       	  nSALARIO:=FIXNUM(oREG:FIELDGET("SALARIO"))
      	  IF nSALARIO<100     
      	  	 NOP
          ELSE
             nSALARIO:=nSALARIO/220
          ENDIF
       	  oSERVER:FIELDPUT("SALARIO",nSALARIO)
       ENDIF
       oPROGWIN:SKIP(1)
   	   Oreg:skip()
   ENDDO	
   Oreg:close()


   oPROGWIN:EndDialog()
   FClose(nHANDLE)
   alert("concluido")








METHOD IMPLOGIXPRG 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL oStmt AS SQLStatement
LOCAL cSQL,cMIG,cUNID,cEMPTAB AS STRING
LOCAL aUNI,aCEN AS ARRAY   //acom          adad
LOCAL nNUMERO,nPOSBUS,nPOS,nLASTREC AS DWORD
LOCAL oFIRMA,oPES,oSERVER AS USEFOLHA
//LOCAL cNOME	AS STRING
LOCAL oPROGWIN AS PROGWIN
LOCAL nPERC AS INT
LOCAL dADM AS DATE
LOCAL nHANDLE
//LOCAL oStmt AS SQLStatement

oProgWin := ProgWin{SELF}
oProgWin:Caption:="Gerando Programacao de ferias"
oProgWin:SHOW()


   cMIG:=StrZero(zempRESA,2)
   OFirma:=USEFOLHA{"FIRMA"}
   IF OFirma:nERRO#0
   	   oPROGWIN:EndDialog()
       RETU SELF
   ENDIF
   OFirma:GOTOP()
   IF OFirma:SEEK(ZEMPRESA)
   	  IF ! Empty(OFirma:FIELDGET("CODEMPMIG"))
         cMIG:=oFIRMA:FIELDGET("CODEMPMIG")
      ENDIF
    ENDIF
    OFIRMA:CLOSE()



   //Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
   oSERVER:=USEFOLHA{"FERIAS",.F.}
   IF oSERVER:nERRO#0
 	  oPROGWIN:EndDialog()
      RETU SELF
   ENDIF
   oSERVER:Zap()
   oSERVER:Pack()


   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
 	   oPROGWIN:EndDialog()
   	  RETURN .f.
   ENDIF	


cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()


nHANDLE:=FCreate("C:\TEMP\"+"LXPRGFER.TXT")
cSQL:="SELECT funcionario.cod_uni_funcio,funcionario.num_matricula,funcionario.nom_completo,funcionario.dat_admis,"
CSQL+=" aquisitivos.dat_ini_aquis,aquisitivos.dat_fim_aquis,30-(aquisitivos.qtd_dias_gozo+aquisitivos.qtd_dias_abono) AS saldo"
CSQL+=" FROM funcionario INNER JOIN aquisitivos ON aquisitivos.cod_empresa = funcionario.cod_empresa AND aquisitivos.num_matricula = funcionario.num_matricula"
cSQL+=" WHERE aquisitivos.IES_SITUACAO<>'Q'"
cSQL+=" AND aquisitivos.IES_SITUACAO<>'C'"
cSQL+=" AND qtd_dias_gozo+qtd_dias_abono<30"
CSQL+=" AND aquisitivos.cod_empresa='" +CMIG+ "'"
cSQL+=" AND dat_demis IS NULL"
CSQL+=" ORDER BY aquisitivos.num_matricula,aquisitivos.dat_ini_aquis"

   nPOS:=0
   nLASTREC:=100
   oreg:= SQLSelect{cSQL,oconn}
   WHILE ! oREG:EoF	
       nNUMERO := oREG:FIELDGET("num_matricula")
       nPerc := INT(100* nPOS/ nLASTREC)
       nPOS++
       oProgWin:oDcProgBar:Position := nPerc
       IF npOS=100
       	  nPOS:=1
       ENDIF	
       oProgWin:oDCMessage:textValue:=Str(nNUMERO)
       oSERVER:GOTOP()
       IF .not. oSERVER:SEEK(nNUMERO)
            oSERVER:APPEND()
            oSERVER:FIELDPUT("NUMERO",nNUMERO)
            oSERVER:FIELDPUT("CNUMERO",StrZero(nNUMERO,8))
            oSERVER:FIELDPUT("NOME",oREG:FIELDGET("nom_completo"))
            IF oREG:FIELDGET("dat_fim_aquis")<Today()
               oSERVER:FIELDPUT("QTVEN",1)
            ENDIF
            oSERVER:FIELDPUT("ADMITIDO",oREG:FIELDGET("dat_admis"))
            oSERVER:FIELDPUT("INIPER",oREG:FIELDGET("dat_ini_aquis"))
            oSERVER:FIELDPUT("FIMPER",oREG:FIELDGET("dat_fim_aquis"))
          	oSERVER:FIELDPUT("UNIFUN",oREG:FIELDGET("cod_uni_funcio"))
       ELSE
       	  IF oREG:FIELDGET("dat_fim_aquis")<Today()
             Oserver:FIELDPUT("QTVEN",oSERVER:FIELDGET("QTVEN")+1)
          ENDIF
       ENDIF
   	   Oreg:skip()
   ENDDO	
   Oreg:close()

cEMPTAB:=CMIG
cSQL:=" SELECT cod_empr_tabela FROM empresa_rhu "
cSQL+=" WHERE "
CSQL+=" cod_empresa='" +CMIG+ "'"
oreg:= SQLSelect{cSQL,oconn}
IF ! oREG:EoF	
   cEMPTAB := oREG:FIELDGET("cod_empr_tabela")
ENDIF
Oreg:close()

//alert(cEMPTAB)


cSQL:=" SELECT funcionario.cod_uni_funcio,funcionario.num_matricula,funcionario.nom_completo,funcionario.dat_admis,funcionario.cod_cargo,cargo.den_cargo_abrev"
CSQL+=" FROM funcionario "
cSQL+=" LEFT JOIN cargo ON cargo.cod_empresa='" + cEMPTAB + "'  AND funcionario.cod_cargo=cargo.cod_cargo AND cargo.DAT_VALIDADE_FIM>TODAY "
cSQL+=" WHERE dat_demis IS NULL"
CSQL+=" AND funcionario.cod_empresa='" +cMIG+ "'"
CSQL+=" ORDER BY funcionario.num_matricula"

//MemoWrit("TESTE.SQL",CSQL)

   nPOS:=0
   nLASTREC:=100
   oreg:= SQLSelect{cSQL,oconn}
   WHILE ! oREG:EoF	
       nNUMERO := oREG:FIELDGET("num_matricula")
       nPerc := INT(100* nPOS/ nLASTREC)
       nPOS++
       oProgWin:oDcProgBar:Position := nPerc
       IF npOS=100
       	  nPOS:=1
       ENDIF	
       oProgWin:oDCMessage:textValue:=Str(nNUMERO)
       oSERVER:GOTOP()
       IF ! oSERVER:SEEK(nNUMERO)
       	    dADM:=oREG:FIELDGET("dat_admis")
            oSERVER:APPEND()
            oSERVER:FIELDPUT("NUMERO",nNUMERO)
            oSERVER:FIELDPUT("CNUMERO",StrZero(nNUMERO,8))
            oSERVER:FIELDPUT("NOME",oREG:FIELDGET("nom_completo"))
            oSERVER:FIELDPUT("FUNCAO",oREG:FIELDGET("cod_cargo"))
            oSERVER:FIELDPUT("FUNNOME",oREG:FIELDGET("den_cargo_abrev"))
            oSERVER:FIELDPUT("ADMITIDO",dADM)
          	oSERVER:FIELDPUT("UNIFUN",oREG:FIELDGET("cod_uni_funcio"))
          	IF Today()-oSERVER:FIELDGET("ADMITIDO")<=365
          	   oSERVER:FIELDPUT("INIPER",dADM)
        	   dADM:=ADDANO(dADM,1)-1
               oSERVER:FIELDPUT("FIMPER",dADM)
          	   Oserver:FIELDPUT("QTVEN",-2)
          	ELSE	
               Oserver:FIELDPUT("QTVEN",-1)
            ENDIF
        ELSE
            oSERVER:FIELDPUT("FUNCAO",oREG:FIELDGET("cod_cargo"))
            oSERVER:FIELDPUT("FUNNOME",oREG:FIELDGET("den_cargo_abrev"))
       ENDIF
   	   Oreg:skip()
   ENDDO	
   Oreg:close()




   nPOS:=0
   nLASTREC:=100
   aUNI:={}
   aCEN:={}
   cSQL:="SELECT cod_uni_funcio,cod_centro_custo,ies_uni_prod,den_uni_funcio FROM unidade_funcional "
   CSQL+=" where cod_empresa='" +CMIG+ "'"
   cSQL+=" order by dat_validade_ini desc"
   oreg:= SQLSelect{cSQL,oconn}
   WHILE ! oREG:EoF
   	  nPerc := INT(100* nPOS/ nLASTREC)
      nPOS++
      oProgWin:oDcProgBar:Position := nPerc
      IF nPOS=100
      	 npOS:=1
      ENDIF
      cUNID:=AllTrim(oREG:FIELDGET("cod_uni_funcio"))
      oProgWin:oDCMessage:textValue:=cUNID
      IF AScan(aUNI,cUNID)=0
     	 AAdd(aUNI,cUNID)
         AAdd(aCEN,{oREG:FIELDGET("cod_centro_custo"),oREG:FIELDGET("ies_uni_prod"),oREG:FIELDGET("den_uni_funcio")})
      ENDIF
   	  oREG:Skip()
   ENDDO	
   oREG:CLOSE()


   nPOS:=0
   nLASTREC:=oSERVER:RecCount

   Oserver:gotop()
   WHILE ! Oserver:EoF
   	   nPerc := INT(100* nPOS/ nLASTREC)
       nPOS++
       oProgWin:oDcProgBar:Position := nPerc
   	   oPROGWIN:Caption := Str(oSERVER:FIELDGET("NUMERO"))
   	   nPOSBUS:=AScan(aUNI,AllTrim(oSERVER:FIELDGET("UNIFUN")))
   	   IF nPOSBUS>0
   	   	  OSERVER:FIELDPUT("CCUSTO",aCEN[nPOSBUS][1])
   	   	  OSERVER:FIELDPUT("MODIRETA",aCEN[nPOSBUS][2])
   	   	  Oserver:FIELDPUT("DENUNIFUN",aCEN[nPOSBUS][3])
   	   ENDIF
   	   Oserver:Skip()
   ENDDO	



   cSQL:=" SELECT num_matricula,dat_ini_progr,dat_fim_progr,dat_efetivacao FROM prog_ferias"
   CSQL+=" where prog_ferias.cod_empresa='" +CMIG+ "'"

  cSQL+=" AND dat_efetivacao IS NULL"

   nPOS:=0
   nLASTREC:=100

   oreg:= SQLSelect{cSQL,oconn}
   WHILE ! oREG:EoF
   	  nPerc := INT(100* nPOS/ nLASTREC)
      nPOS++
      oProgWin:oDcProgBar:Position := nPerc
      IF nPOS=100
      	 nPOS:=1
      ENDIF	
   	  IF IsNil(Oreg:FIELDGET("dat_efetivacao"))
   	  	 nNUMERO := oREG:FIELDGET("num_matricula")
 	     oProgWin:oDCMessage:textValue:=Str(nNUMERO)
         oSERVER:GOTOP()
         oSERVER:SEEK(nNUMERO)
         WHILE nNUMERO=oSERVER:FIELDGET("NUMERO") .AND. ! oSERVER:EOF
         	  oSERVER:FIELDPUT("INIPRG",oREG:FIELDGET("dat_ini_progr"))
         	  oSERVER:FIELDPUT("FIMPRG",oREG:FIELDGET("dat_fim_progr"))
         	  oSERVER:SKIP()
         ENDDO	
   	  ENDIF
   	  oREG:Skip()
   ENDDO	
   oREG:CLOSE()

   nPOS:=0
   nLASTREC:=100
   csql:="SELECT num_matricula,dat_ini_gozo,dat_fim_gozo FROM FICHA_FERIAS "
   CSQL+=" where ficha_ferias.cod_empresa='" +CMIG+ "'"
   CSQL+=" ORDER BY NUM_MATRICULA,DAT_FIM_GOZO DESC"
   oreg:= SQLSelect{cSQL,oconn}
   WHILE ! oREG:EoF
   	  nPerc := INT(100* nPOS/ nLASTREC)
      nPOS++
      oProgWin:oDcProgBar:Position := nPerc
      IF nPOS=100
      	 nPOS:=1
      ENDIF	

   	  nNUMERO := oREG:FIELDGET("num_matricula")
 	  oProgWin:oDCMessage:textValue:=Str(nNUMERO)
      oSERVER:GOTOP()
      oSERVER:SEEK(nNUMERO)
      WHILE nNUMERO=oSERVER:FIELDGET("NUMERO") .AND. ! oSERVER:EOF
       	    oSERVER:FIELDPUT("INIGOZ",oREG:FIELDGET("dat_ini_gozo"))
         	oSERVER:FIELDPUT("FIMGOZ",oREG:FIELDGET("dat_fim_gozo"))
         	oSERVER:SKIP()
      ENDDO	
      WHILE nNUMERO=oREG:FIELDGET("num_matricula") .AND. ! oreg:EOf
         oREG:SKIP()
      ENDDO	
   ENDDO	
   oREG:CLOSE()



   oPES:=USEFOLHA{"FO_PES"}
   IF oPES:nERRO#0
 	   oPROGWIN:EndDialog()
      RETU SELF
   ENDIF
   nPOS:=0
   nLASTREC:=oPES:RecCount
   oPES:GOTOP()
   WHILE ! oPES:EoF
   	   nPerc := INT(100* nPOS/ nLASTREC)
       nPOS++
       oProgWin:oDcProgBar:Position := nPerc

  	  	 nNUMERO := oPES:FIELDGET("numero")
         oProgWin:oDCMessage:textValue:=Str(nNUMERO)
         oSERVER:GOTOP()
         oSERVER:SEEK(nNUMERO)
         WHILE nNUMERO=oSERVER:FIELDGET("NUMERO") .AND. ! oSERVER:EOF
         	  oSERVER:FIELDPUT("DEPTO",oPES:FIELDGET("DEPTO"))
         	  oSERVER:FIELDPUT("SECAO",oPES:FIELDGET("SECAO"))
          	  oSERVER:FIELDPUT("SETOR",oPES:FIELDGET("SETOR"))
              oSERVER:FIELDPUT("DEPSETSEC",oPES:FIELDGET("DEPTO") * 1000000 + oPES:FIELDGET("SETOR") * 1000 + oPES:FIELDGET("SECAO"))
              oSERVER:FIELDPUTC("HTT",oPES:FIELDGET("HTT"))
              oSERVER:FIELDPUTC("SITUACAO",oPES:FIELDGET("SITUACAO"))
              oSERVER:FIELDPUT("SALADM",oPES:FIELDGET("SALADM"))
         	  oSERVER:FIELDPUT("CPF",oPES:FIELDGET("CPF"))
         	  oSERVER:SKIP()
         ENDDO	
         oPES:Skip()
   ENDDO	
   oPES:CLOSE()


   nPOS:=0
   nLASTREC:=oSERVER:RecCount

   Oserver:gotop()
   WHILE ! Oserver:EoF
   	   nPerc := INT(100* nPOS/ nLASTREC)
       nPOS++
       oProgWin:oDcProgBar:Position := nPerc
   	   oPROGWIN:Caption := Str(oSERVER:FIELDGET("NUMERO"))
       IF Oserver:FIELDGET("QTVEN")=-1
          cSQL:="SELECT * from aquisitivos"
          cSQL+=" WHERE aquisitivos.num_matricula=" + Str(oSERVER:FIELDGET("NUMERO"))
          CSQL+=" AND aquisitivos.cod_empresa='" +CMIG+ "'"
          CSQL+=" ORDER BY aquisitivos.dat_ini_aquis DESC"
          oreg:= SQLSelect{cSQL,oconn}
          IF ! oREG:EoF
          	//                 insert into aquisitivos VALUES ('99',9999,'01/01/2007','31/12/2007',0,0,0,'A')
             cSQL:= "insert into aquisitivos VALUES ('"+ cMIG +"',"+AllTrim(Str(oSERVER:FIELDGET("NUMERO")))
             dADM:=oREG:FIELDGET("dat_ini_aquis")
             dADM:=ADDANO(dADM,1)
             cSQL+=",'"+DToC(dADM)
             oSERVER:FIELDPUT("INIPER",dADM)
             dADM:=oREG:FIELDGET("dat_fim_aquis")
             dADM:=ADDANO(dADM,1)
             cSQL+="','"+DToC(dADM)+"',0,0,0,'A')"
             oSERVER:FIELDPUT("FIMPER",dADM)
             FWrite(nHANDLE,"AQI-INC "+cSQL+Chr(13)+Chr(10))
             oStmt := SQLStatement{cSQL,oConn}
             oSTMT:Execute()
             Oserver:FIELDPUT("QTVEN",0)
          ENDIF
          oREG:CLOSE()
       ENDIF

        IF Oserver:FIELDGET("QTVEN")=-2
          cSQL:="SELECT * from aquisitivos"
          cSQL+=" WHERE aquisitivos.num_matricula=" + Str(oSERVER:FIELDGET("NUMERO"))
          CSQL+=" AND aquisitivos.cod_empresa='" +CMIG+ "'"
          CSQL+=" ORDER BY aquisitivos.dat_ini_aquis DESC"
          oreg:= SQLSelect{cSQL,oconn}
          IF oREG:RecCount>0
          	 FWrite(nHANDLE,"ADM-OK "+cSQL+Chr(13)+Chr(10))
          ELSE	
          	//                 insert into aquisitivos VALUES ('99',9999,'01/01/2007','31/12/2007',0,0,0,'A')
             cSQL:= "insert into aquisitivos VALUES ('"+ cMIG +"',"+AllTrim(Str(oSERVER:FIELDGET("NUMERO")))
             cSQL+=",'"+DToC(oSERVER:FIELDGET("INIPER"))
             cSQL+="','"+DToC(oSERVER:FIELDGET("FIMPER"))+"',0,0,0,'A')"
             FWrite(nHANDLE,"ADM-INC "+cSQL+Chr(13)+Chr(10))
             oStmt := SQLStatement{cSQL,oConn}
             oSTMT:Execute()
             Oserver:FIELDPUT("QTVEN",0)
          ENDIF
          oREG:CLOSE()
       ENDIF


   	   Oserver:Skip()
   ENDDO	
   Oserver:CLOSE()
   Oconn:Disconnect()
   oPROGWIN:EndDialog()
   FClose(nHANDLE)
   alert("concluido")

SELF:XWRPTIGRP("RH","FE")






METHOD IMPTXTREL() 
LOCAL cARQTXT AS STRING
LOCAL oJAN AS JESCREL
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
oJAN:=JESCREL{SELF}
oJAN:SHOW()	
cARQTXT:=pegarqcon( ZREL,"TXT")
IF ! File(cARQTXT)
   alert("Arquivo Relogio "+cARQTXT+" Nao Encontrado")
   RETU SELF
ENDIF	
cARQ:=TARQREL(ZREL,.F.,"REL")
oSERVER:=USEFOLHA{cARQ,.F.,.F.,,,.F.}
SELF:POINTER:=POINTER{POINTERHOURGLASS}
//(cARQ, lShareMode, lReadOnlyMode, cDriver, aHidden,lINDEX)
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
AltD()
oSERVER:ZAP()
oSERVER:AppendSDF(cARQTXT)
oSERVER:CLOSE()
SELF:POINTER:=POINTER{POINTERARROW}	
	

METHOD INDEXPTO 
LOCAL oPTONTX AS USEFOLHA
LOCAL cARQDBF,USOTAG,cARQNTX,eINDEX,cCAM,cDRIVER AS STRING
LOCAL oSERVER AS DBSERVER

cDRIVER:=PEGINIVAL(ZCURINI,"PATH","DRIVER")
IF IsNil(cDriver) .OR. Empty(cDRIVER)	
   cDriver := "DBFCDX"
ENDIF
oPTONTX:=USEFOLHA{"FOPTONTX"}
IF oPTONTX:nERRO#0
    RETU SELF
ENDIF
SELF:POINTER:=POINTER{POINTERHOURGLASS}
oPTONTX:GOTOP()
WHILE ! oPTONTX:EOF
   cARQDBF := AllTrim(oPTONTX:FIELDGET("DBF"))
   USOTAG := AllTrim(oPTONTX:FIELDGET("TAG"))
   cARQNTX := AllTrim(oPTONTX:FIELDGET("NTX"))
   eINDEX := AllTrim(oPTONTX:FIELDGET("CAMPO"))
   cCAM:=ZDIR
   IF oPTONTX:FIELDGET("PAD")="S"
   	  cCAM:=ZDIRE
   ENDIF	
//   IF oPTONTX:FIELDGET("PAD")="I"
//   	  cCAM:=PEGCAMINI(USODBF)
//   ENDIF	
   IF oPTONTX:FIELDGET("PAD")="A"
      cCAM:=ZDIRN
   ENDIF
	
      IF cARQDBF = "FO_PON"
         cARQDBF := "PN" + zCOMP
         cARQNTX :=  "PN" + zCOMP
      ENDIF
      IF cARQDBF = "FO_POT"
         cARQDBF := "PT" + zCOMP
         cARQNTX :=  "PT" + zCOMP
      ENDIF
      IF cARQDBF = "FO_POS"
         cARQDBF := "PS" + zCOMP
         cARQNTX :=  "PS" + zCOMP
      ENDIF
      IF cARQDBF = "FOPTOREV"
         cARQDBF := "PE" + zCOMP
         cARQNTX :=  "PE" + zCOMP
      ENDIF
      IF cARQDBF = "FO_POCO"
         cARQDBF := "PO" + zCOMP
         cARQNTX :=  "PO" + zCOMP
      ENDIF
      IF cARQDBF = "FO_PMAN"
         cARQDBF := "PM" + zCOMP
         cARQNTX :=  "PM" + zCOMP
      ENDIF
      IF cARQDBF = "FO_PHOR"
         cARQDBF := "PH" + zCOMP
         cARQNTX :=  "PH" + zCOMP
      ENDIF
      IF cARQDBF = "BCOREQ"
         cARQDBF := "BH" + zCOMP
         cARQNTX :=  "BH" + zCOMP
      ENDIF
      IF cARQDBF = "FO_PDES"
         cARQDBF := "PX" + zCOMP
         cARQNTX :=  "PX" + zCOMP
      ENDIF
      IF cARQDBF = "FO_DIO"
         cARQDBF := "PD" + zCOMP
         cARQNTX :=  "PD" + zCOMP
      ENDIF
      IF cARQDBF = "FO_ALM"
         cARQDBF := "PA" + zCOMP
         cARQNTX :=  "PA" + zCOMP

      ENDIF
      IF cARQDBF = "FO_POR"
         cARQDBF := "PP" + zCOMP
         cARQNTX := "PP" + zCOMP
      ENDIF

      IF File(cCAM+cARQDBF+".DBF")
      	 oSERVER:=DBSERVER{cCAM+cARQDBF,.F.,,cDRIVER}	
      	 IF oSERVER:Used
  	        IF cDriver = "DBFCDX"
     	       OSERVER:CreateOrder(USOTAG,cCAM+cARQNTX,eINDEX,,.F.)
	        ELSE
    	       oSERVER:CreateIndex(CCAM+cARQNTX,eINDEX,,.F.)
	        ENDIF
	        oSERVER:CLOSE()
	     ELSE
            alert("Erro ao Abrir "+cCAM+cARQDBF+".DBF")
	     ENDIF
	  ELSE
	  	 alert("Arquivo Nao Encontrado "+cCAM+cARQDBF+".DBF")
	  ENDIF	
      oPTONTX:Skip()
ENDDO
SELF:POINTER:=POINTER{POINTERARROW}	

METHOD INICIARMES 
IF MDG( 'Iniciar o Mes' )
	INICIAMES()
ENDIF


CONSTRUCTOR( oOwnerApp ) 
//	LOCAL oSB AS StatusBar
	LOCAL oSBIUSER AS StatusBarItem
        LOCAL oSBIDATE AS StatusBarItem	
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



METHOD MPOINT() 
LOCAL cDIR, cEXE, cCODNEW AS STRING
LOCAL nFout AS PTR

//   IF ! entramenu("PCP",nPOS)
//	   RETURN SELF
 //   ENDIF	

    cCODNEW := PEGINIVAL(ZCURINI,"MPOINT","CAMINHO")
  IF ! File(cCODNEW)
       alert("Nao Encontrado" + cCODNEW)
      RETURN SELF
   END IF
cDIR:=GetFileNameFromPath(cCODNEW)
cEXE:=GetPathFromFileName(cCODNEW)
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz(cEXE),String2Psz(""),String2Psz(cDIR),SW_SHOWNORMAL)
ShellExecuteErro(nFout) 
	
METHOD SAYCOM() 
  LOCAL oJDIA AS JDIA	
  oJDIA:=jdia{SELF}
  Ojdia:show()		
  SELF:Caption:="Controle de Ponto - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		
  zDIR:=PEGINIVAL(ZCURINI,"PATH","FOLHA")
  ZDIRE:=PEGINIVAL(ZCURINI,"PATH","FOPTOEMP")
  ZDIRE:=StrTran(zDIRE,"[AA]",Right(StrZero(zANO,4),2))
  ZDIRE:=StrTran(zDIRE,"[AAAA]",StrZero(zANO,4))
  ZDIRE:=StrTran(zDIRE,"[ZZZ]",StrZero(zEMPRESA,3))	
  ZDIRE:=StrTran(zDIRE,"[ZZ]",StrZero(zEMPRESA,2))
  ZDIRE:=StrTran(zDIRE,"[Z]",StrZero(zEMPRESA,1))
  zDIRN:=ZDIR+"E"+StrZero(zANO,4)+"\"

METHOD XAJUFOT() 
LOCAL oSERVER AS USEFOLHA
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL cSQL,cARQIMG,cCPF AS STRING
LOCAL nNUMERO
LOCAL oStmt AS SQLStatement
LOCAL nPOS,nLASTREC AS DWORD
LOCAL nPERC AS INT
LOCAL oPROGWIN AS PROGWIN
LOCAL aUSO AS ARRAY   //acpf


nPOS:=0 

oSERVER:=USEFOLHA{"FO_PES"}
IF oSERVER:nERRO#0 
    RETU SELF
ENDIF	
SELF:POINTER:=POINTER{POINTERHOURGLASS}
oSERVER:GOTOP()
WHILE ! oSERVER:EoF
    oSERVER:FIELDPUT("CNUMERO",StrZero(oSERVER:FIELDGET("NUMERO"),8))
    oSERVER:FIELDPUT("DEPSETSEC",oSERVER:FIELDGET("DEPTO") * 1000000 + oSERVER:FIELDGET("SETOR") * 1000 + oSERVER:FIELDGET("SECAO"))
    oSERVER:SKIP()
ENDDO	


oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando Fotos"
oProgWin:SHOW()

/*
cARQIMG:=AllTrim(cARQIMG)
oConn := SQLConnection{}
IF ! oConn:connect(cARQIMG,"","")
   oSERVER:CLOSE()	
   SELF:POINTER:=POINTER{}
   alert("Erro na Conecção Arquivo Foto " + cARQIMG)
   	oPROGWIN:EndDialog()
   RETU
ENDIF	
aUSO:={}
nLASTREC:=100
cSQL:="SELECT NUMERO FROM IMAGENS"
oreg:= SQLSelect{cSQL,oconn}
WHILE ! oREG:EOF	
   nNUMERO:=FIXNUM(oREG:FIELDGET("NUMERO"))
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   IF nPOS=100
   	  nPOS:=1
   ENDIF
   oProgWin:oDcProgBar:Position := nPerc
   IF nNUMERO>0
	   oPROGWIN:Caption := Str(NNUMero)
	   AAdd(AUSO,nNUMERO)
   ENDIF	
   oREG:SKIP()
ENDDO
oREG:CLOSE()

nLASTREC:=Oserver:RecCount
oSERVER:GOTOP()
WHILE ! oSERVER:EoF
   nNUMERO:=oSERVER:FIELDGET("NUMERO")
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   oProgWin:oDcProgBar:Position := nPerc
   oPROGWIN:Caption := Str(nNUMERO)
   IF AScan(aUSO,nNUMERO)=0
 	  cSQL:= "Insert into imagens (CODIGO,NUMERO) values ('"+StrZero(nNUMERO,8)+"',"+StrTran(Str(nnumero,8)," ","")+")"
   	  oStmt := SQLStatement{cSQL,oConn}
      oSTMT:Execute()
   ENDIF	
   oSERVER:SKIP()
ENDDO	
oCONN:Disconnect()
*/

cARQIMG:="FMP04cpf"
oConn := SQLConnection{}
IF ! oConn:connect(cARQIMG,"","")
   oSERVER:CLOSE()	
   SELF:POINTER:=POINTER{}
   alert("Erro na Conecção Arquivo Foto " + cARQIMG)
   	oPROGWIN:EndDialog()
   RETURN .f.
ENDIF	
aUSO:={}
nLASTREC:=100
cSQL:="SELECT NUMERO FROM IMAGENS"
oreg:= SQLSelect{cSQL,oconn}
WHILE ! oREG:EOF	
   nNUMERO:=FIXNUM(oREG:FIELDGET("NUMERO"))
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   IF nPOS=100
   	  nPOS:=1
   ENDIF
   oProgWin:oDcProgBar:Position := nPerc
   IF nNUMERO>0
	   oPROGWIN:Caption := Str(NNUMero)
	   AAdd(AUSO,nNUMERO)
   ENDIF	
   oREG:SKIP()
ENDDO
oREG:CLOSE()

nLASTREC:=Oserver:RecCount
oSERVER:GOTOP()
WHILE ! oSERVER:EoF
   cCPF:=oSERVER:FIELDGET("CPF")
   nNUMERO:=Val(TIRAOUT(cCPF))
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   oProgWin:oDcProgBar:Position := nPerc
   oPROGWIN:Caption := Str(nNUMERO)
   IF Valcpf(CCPF,.F.)
	   IF AScan(aUSO,nNUMERO)=0
	 	  cSQL:= "Insert into imagens (CODIGO,NUMERO) values ('"+cCPF+"',"+StrTran(Str(nnumero,11)," ","")+")"
	   	  oStmt := SQLStatement{cSQL,oConn}
	      oSTMT:Execute()
	   ENDIF	
   ENDIF
   oSERVER:SKIP()
ENDDO	
oCONN:Disconnect()


oSERVER:cLOSE()
oPROGWIN:EndDialog()

METHOD XAJUHIS() 
LOCAL oPROGWIN AS PROGWIN
LOCAL oSERVER AS USEFOLHA
LOCAL oFO_CHIS AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
oSERVER:=USEFOLHA{"FO_PES"}
IF oSERVER:nERRO#0
   RETU SELF
ENDIF	
aDAD:={zCURINI,"FO_CHIS.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oFO_CHIS:=USEREDE{aDAD,,,,aCOM}
IF oFO_CHIS:nERRO#0
   oSERVER:CLOSE()	
   RETU SELF
ENDIF

oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando Historico"
oProgWin:SHOW()

SELF:POINTER:=POINTER{POINTERHOURGLASS}	
oPROGWIN:nTOTAL:=oSERVER:RecCount
oSERVER:GOTOP()
WHILE ! oSERVER:EOF
     oProgWin:titulo("",.T.)
 	 oFO_CHIS:GOTOP()
   	 IF ! oFO_CHIS:SEEK(oSERVER:FIELDGET("NUMERO"))
   	     oFO_CHIS:Append()
   		 oFO_CHIS:FIELDPUT("NUMERO",oSERVER:FIELDGET("NUMERO"))
  	 ENDIF	
     oFO_CHIS:FIELDPUT("NOME",oSERVER:FIELDGET("NOME"))
     oFO_CHIS:FIELDPUT("ADMISSAO",oSERVER:FIELDGET("ADMITIDO"))
     oFO_CHIS:FIELDPUT("DEMISSAO",oSERVER:FIELDGET("DEMITIDO"))
     oSERVER:SKIP()
     oPROGWIN:SKIP(1)
ENDDO
oFO_CHIS:CLOSE()
oSERVER:CLOSE()
SELF:POINTER:=POINTER{POINTERARROW}	
oProgWin:EndDialog()

METHOD XCRIAPONTO 
IF ZUSER<>"ADMIN" .and. ZUSER<>"SOFTEC" .and. ZUSER<>"SUPERVISOR"
   alert("Usuario Nao Autorizado")
   RETURN .f.
ENDIF	
SELF:POINTER:=POINTER{POINTERHOURGLASS}
dbecriadbf(zdir+"FOPTOREL.dbe",zdir)
dbecriadbf(zdir+"FOPTOHRE.DBE",zdir)
dbecriadbf(zdir+"FOPTOCON.DBE",zdire)
dbecriadbf(zdir+"FO_DIO.DBE",zdire) //
dbecriadbf(zdir+"FO_PON.DBE",zdire) //
dbecriadbf(zdir+"FO_POT.DBE",zdire) //
dbecriadbf(zdir+"FO_POS.DBE",zdire) //
dbecriadbf(zdir+"FO_POCO.DBE",zdire) //
dbecriadbf(zdir+"FO_PTT.DBE",zdire)
dbecriadbf(zdir+"FO_PHOR.DBE",zdire) //
dbecriadbf(zdir+"FO_PDES.DBE",zdire)  //
dbecriadbf(zdir+"FO_PMAN.DBE",zdire)  //
dbecriadbf(zdir+"FO_RELHR.DBE",zdire)
dbecriadbf(zdir+"FOPTOHOR.DBE",zdire)
dbecriadbf(zdir+"FOPTOALM.DBE",zdire)
dbecriadbf(zdir+"FOPTOCOM.DBE",zdire)
dbecriadbf(zdir+"FOPTOREV.DBE",zdire) //
dbecriadbf(zdir+"FOPTOPRO.DBE",zdire)
dbecriadbf(zdir+"FOPTOPRD.DBE",zdire)
dbecriadbf(zdir+"BCOREQ.DBE",zdire) //
dbecriadbf(zdir+"BCRBAK.DBE",zdire) //
dbecriadbf(zdir+"BCOHRS.DBE",zdire)
dbecriadbf(zdir+"BCOBAK.DBE",zdire) //
dbecriadbf(zdir+"BCODEM.DBE",zdire)
dbecriadbf(zdir+"BCODEK.DBE",zdire) //
dbecriadbf(zdir+"FOPTOBCO.DBE",zdire)
dbecriadbf(zdir+"RBTEMP.DBE",zdire)
SELF:POINTER:=POINTER{POINTERARROW}	

METHOD XEGAFUN() 
LOCAL oSERVER AS USEFOLHA
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL cSQL,cNOME AS STRING
LOCAL oStmt AS SQLStatement
LOCAL nPOS,nLASTREC,nNUMERO AS DWORD
LOCAL nPERC AS INT
LOCAL oPROGWIN AS PROGWIN
LOCAL aUSO AS ARRAY

aUSO:={}  
nPOS:=0

oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando Funcionarios"
oProgWin:SHOW()

oSERVER:=USEFOLHA{"FO_PES"}
IF oSERVER:nERRO#0
	oPROGWIN:EndDialog()
    RETU SELF
ENDIF	
SELF:POINTER:=POINTER{POINTERHOURGLASS}

oConn := SQLConnection{}
IF ! oConn:connect("EGA","","")
   oSERVER:CLOSE()	
   SELF:POINTER:=POINTER{}
   alert("Erro na Conecção Arquivo EGA " )
   	oPROGWIN:EndDialog()
   RETURN .f.
ENDIF	

nLASTREC:=100
cSQL:="SELECT CODIGO FROM OPERADOR"
oreg:= SQLSelect{cSQL,oconn}
WHILE ! oREG:EOF	
   nNUMERO:=oREG:FIELDGET("CODIGO")
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   IF nPOS=100
   	  nPOS:=1
   ENDIF
   oProgWin:oDcProgBar:Position := nPerc
   oPROGWIN:Caption := Str(nNUMERO)
   AAdd(AUSO,nNUMERO)
   oREG:SKIP()
ENDDO
oREG:CLOSE()

nLASTREC:=Oserver:RecCount
oSERVER:GOTOP()
WHILE ! oSERVER:EoF
   nNUMERO:=oSERVER:FIELDGET("NUMERO")
   cNOME:=Left(Proper(oSERVER:FIELDGET("NOME")),11)+"-"+StrZero(oSERVER:FIELDGET("DEPTO",4))
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   oProgWin:oDcProgBar:Position := nPerc
   oPROGWIN:Caption := Str(oSERVER:FIELDGET("NUMERO"))
   IF oSERVER:FIELDGET("MODIRETA")="D"    //somente mao de obra direta
      IF AScan(aUSO,nNUMERO)=0 .AND. NNUMERO<99990
 	     cSQL:= "Insert into operador (CODIGO,DESCRICAO,SENHA,PESSOAS) values ("+Trim(Str(nNUMERO))+",'"+cNOME+"',"+Trim(Str(nNUMERO))+",1)"
    	 oStmt := SQLStatement{cSQL,oConn}
         oSTMT:Execute()
      ENDIF	
   ENDIF
   oSERVER:SKIP()
ENDDO	
oCONN:Disconnect()
oSERVER:cLOSE()
oPROGWIN:EndDialog()
SELF:POINTER:=POINTER{POINTERARROW}	

METHOD XGERACESTA() 
LOCAL oORI,oDES AS USEFOLHA
//LOCAL lOPEN AS LOGIC
LOCAL oPROGWIN AS PROGWIN
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT

IF ! MDG("Gerar Lista Cesta Basica")
   RETU SELF	
ENDIF	

oProgWin := ProgWin{}
oProgWin:Caption:="Gerando Arquivo Cesta Basica"
oProgWin:SHOW()
nPOS:=1

oORI:=USEFOLHA{"FO_PES"}
IF oORI:nERRO#0
    RETU SELF
ENDIF

oDES:=USEFOLHA{"CESTA",.F.}
IF oDES:nERRO#0
    RETU SELF
ENDIF
oDES:ZAP()


SELF:POINTER:=POINTER{POINTERHOURGLASS}
nLASTREC:=OORI:RecCount
oORI:SETORDER(4)
oORI:GOTOP()
WHILE ! oORI:EOF
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   oProgWin:oDcProgBar:Position := nPerc
   oProgWin:oDCMessage:textValue:=Str(oORI:FIELDGET("NUMERO"),8)+" "+oORI:FIELDGET("NOME")
   IF Empty(oORI:FIELDGET("DEMITIDO")) .AND. oORI:FIELDGET("CESTA")<>"N"
     oDES:Append()
     oDES:FIELDPUT("NOME",oORI:FIELDGET("NOME"))
     oDES:FIELDPUT("NUMERO",oORI:FIELDGET("NUMERO"))
     oDES:FIELDPUT("ADMITIDO",oORI:FIELDGET("ADMITIDO"))
     oDES:FIELDPUT("CESTA",oORI:FIELDGET("CESTA"))
   ENDIF
   oORI:SKIP()
ENDDO
oORI:CLOSE()
oDES:CLOSE()
Oprogwin:EndDialog()
SELF:POINTER:=POINTER{POINTERARROW}
alert("concluido")	

METHOD XGERCTRHOR() 
LOCAL oORI,oDES AS USEFOLHA
LOCAL oPROGWIN AS PROGWIN
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT
LOCAL eCHAVE AS STRING

IF ! MDG("Gerar Controle de Horas")
   RETU SELF	
ENDIF	

oProgWin := ProgWin{}
oProgWin:Caption:="Gerando Controle de horas"
oProgWin:SHOW()
nPOS:=1

oORI:=USEFOLHA{"DEPTO"}
IF oORI:nERRO#0
    RETU SELF
ENDIF

oDES:=USEFOLHA{"CTRHOR"}
IF oDES:nERRO#0
	oORI:CLOSE()
    RETU SELF
ENDIF


SELF:POINTER:=POINTER{POINTERHOURGLASS}
nLASTREC:=OORI:RecCount
oORI:GOTOP()
WHILE ! oORI:EOF
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   oProgWin:oDcProgBar:Position := nPerc
   oProgWin:oDCMessage:textValue:=oORI:FIELDGET("NOME")
   eCHAVE:=Str(zANO,4)+Str(zMES,2)+Str(Oori:FIELDGET("DEPTO"),4)
   IF ! Odes:SEEK(eCHAVE)
     oDES:Append()
     oDES:FIELDPUT("DEPTO",oORI:FIELDGET("DEPTO"))
     oDES:FIELDPUT("SECAO",oORI:FIELDGET("SECAO"))
     oDES:FIELDPUT("SETOR",oORI:FIELDGET("SETOR"))
     oDES:FIELDPUT("NOMEC",oORI:FIELDGET("NOMEC"))
     oDES:FIELDPUT("CCUSTO",oORI:FIELDGET("CCUSTO"))
     oDES:FIELDPUT("UNIFUN",oORI:FIELDGET("UNIFUN"))
     oDES:FIELDPUT("MODIRETO",oORI:FIELDGET("MODIRETO"))
     oDES:FIELDPUT("ANO",ZANO)
     oDES:FIELDPUT("MES",ZMES)
   ENDIF
   oORI:SKIP()
ENDDO
oORI:CLOSE()
oDES:CLOSE()
Oprogwin:EndDialog()
SELF:POINTER:=POINTER{POINTERARROW}
alert("concluido")	

METHOD XIMPRBTEMPO 
	LOCAL oConn AS SQLConnection
	LOCAL oREG AS SQLSelect
	//LOCAL oTABLE AS SQLTABLE
	LOCAL oSERVER AS USEFOLHA
	LOCAL nNUMERO,nPOS AS DWORD
	LOCAL cNOME,cTMP,cTIPO,cRG,cSQL AS STRING
	LOCAL dNAS,dADM AS DATE
	LOCAL cPRONUM,cPROSER,cPROUF AS STRING


	IF ZUSER<>"ADMIN" .AND. ZUSER<>"SOFTEC" .AND. ZUSER<>"SUPERVISOR"	
		alert("Usuario Nao Autorizado")
		RETURN .f.
	ENDIF	
	oSERVER:=USEFOLHA{"FO_PES"}
	IF oSERVER:nERRO#0
		RETU SELF
	ENDIF	
	SELF:POINTER:=POINTER{POINTERHOURGLASS}


	oConn := SQLConnection{"RBTEMPO"}
	IF ! OCONN:Connected
		oSERVER:CLOSE()	
		SELF:POINTER:=POINTER{}
		alert("Erro na Conecção Arquivo RBTEMPO ")
		alert("Configure ODBC")
		RETURN .f.
	ENDIF	

	cSQL:="SELECT * FROM FUNCIONARIOS"
	oREG:=SQLSELECT{cSQL,oCONN}
	WHILE ! oREG:EoF
		nNUMERO:=FIXNUM(oREG:FIELDGET("CODIGOFUNCIONARIO"))
		cNOME:=FIXSTR(oREG:FIELDGET("FUNCIONARIONOME"))
		dNAS:=FIXDATA(oREG:FIELDGET("FUNCIONARIODTNASC"))
		dADM:=FIXDATA(oREG:FIELDGET("FUNCIONARIODTADMISSAO"))
		cTMP:=FIXSTR(oREG:FIELDGET("FUNCIONARIOTIPOSALARIO")) //tIPO
		IF cTMP="M"
		   cTIPO:="1"	
		ELSE
		   cTIPO:="5"				
        ENDIF
		cTMP:=FIXSTR(oREG:FIELDGET("FUNCIONARIOCARTPROFISSIONAL")) //carteira
		nPOS:=At("-",cTMP)
		IF nPOS=0
           nPOS:=At("/",cTMP)			
	    ENDIF		
		IF nPOS>0
		   cPRONUM:=SubStr(cTMP,1,nPOS-1)
           cPROSER:=AllTrim(SubStr(cTMP,nPOS+1))
           nPOS:=At(" ",cPROSER)	
           IF npos>0
  	          cPROUF:=Upper(AllTrim(SubStr(cPROSER,nPOS+1)))
           	  cPROSER:=SubStr(cPROSER,1,nPOS-1)
           ENDIF	
		ELSE
           cPRONUM:=cTMP	
		ENDIF	
		
		cRG:=FIXSTR(oREG:FIELDGET("FUNCIONARIORG"))
		oSERVER:GOTOP()
		oSERVER:SEEK(nNUMERO)
		IF ! Oserver:Found
			oSERVER:Append()
			oSERVER:FIELDPUT("NUMERO",nNUMERO)
			oSERVER:FIELDPUT("CNUMERO",StrZero(nNUMERO,8))		
		ENDIF
		IF Empty(OSERVER:FIELDGET("NOME"))
			oSERVER:FIELDPUT("NOME",cNOME)
		ENDIF
		IF Empty(OSERVER:FIELDGET("NASC"))
			oSERVER:FIELDPUT("NASC",dNAS)
		ENDIF
		IF Empty(OSERVER:FIELDGET("ADMITIDO"))
			oSERVER:FIELDPUT("ADMITIDO",dADM)
		ENDIF
		IF Empty(OSERVER:FIELDGET("TIPO"))
			oSERVER:FIELDPUT("TIPO",cTIPO)
		ENDIF
		IF Empty(OSERVER:FIELDGET("PROFIS"))
			oSERVER:FIELDPUT("PROFIS",StrZero(Val(cPRONUM),7))
			oSERVER:FIELDPUT("SERIE",StrZero(Val(cPROSER),5))
			oSERVER:FIELDPUT("CTPSUF",cPROUF)
		ENDIF
		IF Empty(OSERVER:FIELDGET("RG"))
			oSERVER:FIELDPUT("RG",cRG)
		ENDIF
		oREG:Skip()
	ENDDO
    oREG:CLOSE()
    oCONN:Disconnect()
    oSERVER:CLOSE()
    SELF:POINTER:=POINTER{POINTERARROW}	
    alert("Importacao Concluida")



METHOD XWEBIMP 
LOCAL oJAN AS JESCREL
LOCAL cSQL,cREL,cARQ,cARQEXP,cLINHA,cARQERRO,cHORA AS STRING
LOCAL oSERVER AS SQLSelect
LOCAL oCONN AS SQLConnection
LOCAL aORI,aDES,aREL AS ARRAY              //aretu
LOCAL oJANX AS jWREL
LOCAL dINI,dFIM,dDATA,dDEMITIDO AS DATE
LOCAL oIMP AS USEFOLHA
LOCAL nNUMERO AS DWORD
LOCAL nHORA AS FLOAT
LOCAL oPROGWIN AS PROGWIN
LOCAL nHANDLE,nHANERR
LOCAL oPROV AS USEFOLHA
LOCAL oPES AS USEFOLHA
LOCAL mDESTINO
LOCAL cCHAVE,cTIPOM AS STRING
LOCAL lGRAVA AS LOGIC
LOCAL aRELOGIOS AS ARRAY
LOCAL I
LOCAL cRELOGIO
LOCAL oVIEW AS JRTF
aRELOGIOS:={}


oJAN:=JESCREL{SELF}
oJAN:SHOW()	

IF ZREL=4
   alert("Esta rotina nao e para este relogio")
   RETU SELF
ENDIF	

cARQEXP:="C:\TEMP\relogio"
cARQERRO:="C:\TEMP\relogio_erro.txt"
oJANX:=JWREL{SELF}
IF ZREL=1 .OR. ZREL=5
   oJANX:relogios({99,99,99,99})
ENDIF	
IF ZREL=2
  oJANX:relogios({16,18,19,0})
  cARQEXP:="C:\TEMP\refeicao"
ENDIF
IF ZREL=3
  oJANX:relogios({14,15,0,0})
  cARQEXP:="C:\TEMP\portaria"
ENDIF
OjanX:show()
IF ! oJANX:lOK
   RETU SELF
ENDIF	

cARQEXP+="_"+oJANX:CLAYOUT
/*
0 or 100  	mon dd yyyy hh:miAM (or PM)
101 	mm/dd/yy
102 	yy.mm.dd
103 	dd/mm/yy
104 	dd.mm.yy
5 	dd-mm-yy
106 	dd mon yy
107 	Mon dd, yy
108 	hh:mm:ss
9 or 109 	mon dd yyyy hh:mi:ss:mmmAM (or PM)
110 	mm-dd-yy
111 	yy/mm/dd
112 	yymmdd
13 or 113 	dd mon yyyy hh:mm:ss:mmm(24h)
114 	hh:mi:ss:mmm(24h)
20 or 120 	yyyy-mm-dd hh:mi:ss(24h)
21 or 121 	yyyy-mm-dd hh:mi:ss.mmm(24h)
126 	yyyy-mm-dd Thh:mm:ss.mmm(no spaces)
130 	dd mon yyyy hh:mi:ss:mmmAM
131 	dd/mm/yy hh:mi:ss:mmmAM
*/

IF oJANX:NREL01+oJANX:NREL02+oJANX:NREL03+oJANX:NREL04=0
   cREL:=""
ELSE
   cREL:="("
   IF oJANX:NREL01=0
   	  alert("Relogio 01 nao selecionado")
   	  RETU SELF
   ENDIF
   cREL+=" EQPI_NUMERO="+Str(oJANX:NREL01)
   cARQEXP+=AllTrim(Str(oJANX:NREL01))
   AAdd(aRELOGIOS,AllTrim(Str(oJANX:nREL01)))
   IF oJANX:NREL02>0
      cREL+=" OR EQPI_NUMERO="+Str(oJANX:NREL02)
       AAdd(aRELOGIOS,AllTrim(Str(oJANX:nREL02)))
       cARQEXP+="_"+AllTrim(Str(oJANX:NREL02))
   ENDIF	
   IF oJANX:NREL03>0
      cREL+=" OR EQPI_NUMERO="+Str(oJANX:NREL03)
      AAdd(aRELOGIOS,AllTrim(Str(oJANX:nREL03)))
      cARQEXP+="_"+AllTrim(Str(oJANX:NREL03))
   ENDIF	
   IF oJANX:NREL04>0
      cREL+=" OR EQPI_NUMERO="+Str(oJANX:NREL04)
      AAdd(aRELOGIOS,AllTrim(Str(oJANX:nREL04)))
      cARQEXP+="_"+AllTrim(Str(oJANX:NREL04))
   ENDIF	
   cREL+=")"
ENDIF

cARQEXP+=".TXT"

DINI:=oJANX:DINICIO
DFIM:=oJANX:DFINAL

IF oJANX:CTIPOCRE="N"
   Csql:="SELECT convert(VARCHAR(8),PES_NUMERO) AS NUMERO,"
ELSE
   Csql:="SELECT convert(VARCHAR(8),CRED_NUMERO) AS NUMERO,"	
ENDIF
csql+="       convert(varchar,MOV_DATAHORA,103) AS DATA,"
csql+="       convert(varchar,mov_datahora,108) AS hora,"
csql+="       convert(VARCHAR(4),EQPI_NUMERO) AS RELOGIO, "
csql+="       mov_entradasaida "
csql+=" FROM Log_Credencial"
csql+=" WHERE MOV_DataHora>=convert(datetime, '"+DToC(oJANX:DINICIO)+"', 103)"
csql+="   AND MOV_DataHora<=convert(datetime, '"+DToC(oJANX:DFINAL+1)+"', 103)"
csql+=" AND PES_NUMERO>="+Str(oJANX:nFUNINI)
csql+=" AND PES_NUMERO<="+Str(oJANX:NFUNFIM)
IF Len(CREL)>0
   Csql+=" and "+Crel
ENDIF	
//tratado somente na exportacao
//IF OJANX:lMOVENTSAI
//   cSQL+=" and mov_entradasaida<>2"
//ENDIF
//1 entrada 2 saida e 3 ambos

oConn := SQLConnection{}
 IF ! oConn:connect("wrel","","")
	  alert("Erro na Conecção")
 	  RETU SELF
ENDIF

oServer := SQLSelect{cSQL, oConn }
IF ! oServer:Execute()
	MemoWrit("C:\TEMP\cSQL.TXT",cSQL)
   alert("Erro na Consulta")
   oCONN:Disconnect()
   RETU SELF
ENDIF	


cARQ:=TARQREL(ZREL,.F.,"DIO")
//alert(cARQ)
oIMP:=USEFOLHA{cARQ}
IF oIMP:nERRO#0
   oSERVER:CLOSE()
   oCONN:Disconnect()
   RETU SELF
ENDIF

oPROV:=USEFOLHA{"FOPTOPRO"}
IF oPROV:nERRO#0
   oSERVER:CLOSE()
   oIMP:CLOSE()	
   oCONN:Disconnect()
    RETU SELF
ENDIF

oPES:=USEFOLHA{"FO_PES"}
IF oPES:nERRO#0
   oSERVER:CLOSE()
    oIMP:CLOSE()	
    oPROV:CLOSE()
    oCONN:Disconnect()	
    RETU SELF
ENDIF


oPROGWIN:=PROGWIN{SELF}
oPROGWIN:CaPTION:="Importando"
oPROGWIN:SHOW()
oPROGWIN:nTOTAL:=100
WHILE ! oSERVER:EOF
   nNUMERO:=Val(oserver:FIELDGET("NUMERO"))	
   dDATA:=CToD(oserver:FIELDGET("DATA"))
   nHORA:=CTOHORA(oserver:FIELDGET("HORA"))
   cTIPOM:=AllTrim(Str(oserver:FIELDGET("mov_entradasaida")))
    DO CASE
   	  CASE cTIPOM="1"
   	       cTIPOM:="E"
   	  CASE cTIPOM="2"
   	       cTIPOM:="S"
   	  CASE cTIPOM="3"
   	       cTIPOM:="A"
   ENDCASE
   IF ZREL=1 .OR. ZREL=5 //so grava portaria e refeicao
   	  cTIPOM:=""
   ENDIF
   oPROGWIN:TITULO(Str(nNUMERO,8)+" "+DToC(dDATA)+" "+StrZero(nHORA,5,2),.F.)
   oIMP:GOTOP()
   IF ! oIMP:SEEK(Str(nNUMERO,8)+DToS(dDATA)+Str(nHORA,5,2))
      oIMP:aPPEND()
      oIMP:FIELDPUT("NUMERO",nNUMERO)
      oIMP:FIELDPUT("DATA",dDATA)
      oIMP:FIELDPUT("HORA",nHORA)
      oIMP:FIELDPUT("RELOGIO",oSERVER:FIELDGET("RELOGIO"))
      oIMP:FIELDPUT("TIPOM",cTIPOM)
   ENDIF
   oSERVER:SKIP()
   oPROGWIN:SKIP(1)
   IF oPROGWIN:nPOSICAO=100
   	  oPROGWIN:reset()
   ENDIF	
ENDDO	
oSERVER:CLOSE()
oCONN:Disconnect()

oPROGWIN:CaPTION:="Verificando Provisorios"
//oPROGWIN:SHOW()
oPROGWIN:nTOTAL:=oprov:RecCount
Oprov:GOTOP()
WHILE ! oprov:EOF
  oPROGWIN:TITULO(Str(oProv:RECNO),.F.)
  IF Oprov:FIELDGET("DATA") >= DINI  .and. oprov:FIELDGET("DATA") <= DFIM
     nNUMERO:=oPROV:FIELDGET("ORIGEM")
     mDESTINO:=oprov:FIELDGET("DESTINO")
     dDATA:=Oprov:FIELDGET("DATA")
     cCHAVE:=Str(NNUMERO,8)+DToS(dDATA)
     aORI:={}
     aDES:={}
     aREL:={}
     oIMP:GOTOP()
     oIMP:SEEK(cCHAVE)
     WHILE oIMP:FIELDGET("numero")=nNUMERO .AND. oIMP:FIELDGET("DATA")=dDATA .and. ! oIMP:EOF //pegue os horarios
         AAdd(aORI,Str(nNUMERO,8)+DToS(dDATA)+Str(oIMP:FIELDGET("HORA"),5,2))              //a troca e feita por array
         AAdd(aDES,Str(mDESTINO,8)+DToS(dDATA)+Str(oIMP:FIELDGET("HORA"),5,2))                //para evitar perda do indice
         AAdd(aREL,{oIMP:FIELDGET("HORA"),oIMP:FIELDGET("RELOGIO"),oIMP:FIELDGET("TIPOR"),oIMP:FIELDGET("TIPOM")})
         oimp:Skip()
     ENDDO
     FOR i:= 1 TO Len(aORI)
	     oIMP:GOTOP()
         IF oIMP:SEEK(aORI[I])
            oimp:Delete()
         ENDIF
         oIMP:GOTOP()
         IF ! oIMP:SEEK(ades[I])
             oimp:Append()
             oIMP:FIELDPUT("NUMERO",mDESTINO)
             oIMP:FIELDPUT("DATA",dDATA)
             oIMP:FIELDPUT("HORA",aREL[I,1])
             oIMP:FIELDPUT("RELOGIO",aREL[I,2])
             oIMP:FIELDPUT("TIPOR",aREL[I,3])
             oIMP:FIELDPUT("TIPOM",aREL[I,4])
         ENDIF
     NEXT i
  ENDIF
  oprov:SKIP()
  oPROGWIN:SKIP(1)
ENDDO
oprov:close()


oPROGWIN:CaPTION:="Verificando Duplicidades"
//oPROGWIN:SHOW()
oPROGWIN:nTOTAL:=oimp:RecCount
oimp:GOTOP()
WHILE ! Oimp:EOf
    NNUMERO:=oIMP:FIELDGET("NUMERO")
    DDATA  := oIMP:FIELDGET("DATA")
    NHORA  := oIMP:FIELDGET("HORA")
    Oimp:skip()
    IF oIMP:FIELDGET("numero")=nNUMERO .AND. oIMP:FIELDGET("DATA")=dDATA .and. oIMP:FIELDGET("HORA")=nHORA .and. ! oimp:eof   //Apaga dupliciadades
       oIMP:Delete()
    ENDIF
    oPROGWIN:SKIP(1)
ENDDO



IF oJANX:lEXPORT
  IF oJANX:CLAYOUT="B"	
      SetCentury(FALSE)
  ENDIF
  oPROGWIN:CaPTION:="Exportando TXT"
  nHANDLE:=FCreate(cARQEXP)
  nHANERR:=FCreate(cARQERRO)
  oPROGWIN:nTOTAL:=oIMP:RecCount
  oIMP:GOTOP()
  WHILE ! oIMP:EOF
 	  oPROGWIN:TITULO(Str(oIMP:RECNO),.F.)
 	  dDATA:=oIMP:FIELDGET("DATA")
      cHORA:=StrZero(oIMP:FIELDGET("HORA"),5,2)
 	  IF dDATA>=dINI .AND. dDATA<=dFIM
 	  	 nNUMERO:=oIMP:FIELDGET("NUMERO")
 	  	 cRELOGIO:=AllTrim(oIMP:FIELDGET("RELOGIO"))
  	  	 lGRAVA:=.T.
  	  	 IF AScan(aRELOGIOS,cRELOGIO)=0
  	  	 	lGRAVA:=.F.
  	  	 ELSE
	  	   IF oJANX:lATIVOS
	  	      lGRAVA:=.F.
	  	   ENDIF	
	   	   oPES:GOTOP()
	  	   IF oPES:SEEK(nNUMERO)
	   	      IF oJANX:lATIVOS
	   	         lGRAVA:=.T.
              ENDIF
   	          dDEMITIDO:=oPES:FIELDGET("DEMITIDO")	
    	      IF ! Empty(dDEMITIDO) .AND. dDATA>dDEMITIDO
	   	         FWrite(nHANERR,"Movimento Cracha Demitido:"+Str(nnumero)+" - "+cRELOGIO+" - "+DToC(Ddata)+" - "+cHORA+Chr(13)+Chr(10))
	   	         lGRAVA:=.F.
	   	      ENDIF	
	  	   ENDIF	
  	  	 ENDIF	
   	  	 IF OJANX:lMOVENTSAI
   	  	 	IF oIMP:FIELDGET("TIPOM")="S" .OR. oIMP:FIELDGET("TIPOM")="2"
   	  	 	   lGRAVA:=.F.	
   	  	 	ENDIF
         ENDIF
 	  	 //A relogio c 02
 	  	 //  numero  c 16
 	  	 //  data    c  8 yyyymmdd
 	  	 //  hora    c  4
 	  	 //  ref     c  2 01
 	  	 //
         //B
         //  numero c 15
         //  data   c  6 ddmmyy (setcentury)
         //  hora   c  4
         //  ref    c  8 00100100
         //C relogio c 02
   	     //  numero  c 16
 	  	 //  data    c  8 yyyymmdd
 	  	 //  hora    c  4
 	  	 //  ref     c  2 01
 	  	 // tipomov  c  1 (E)ntrada(S)aida(A)mbos


          IF lGRAVA
	 	  	  IF oJANX:CLAYOUT="A" .or. oJANX:CLAYOUT="C"		
    		     cLINHA:=SubStr(cRELOGIO,1,2)
	      	     cLINHA+=StrZero(nNUMERO,16,0)
    	  	     cLINHA+=DToS(dDATA)
	    	     cLINHA+=StrTran(StrZero(oIMP:FIELDGET("HORA"),5,2),".","")
		         cLINHA+="01"              //segundos
 		  	  ELSE
   	  		   	 cLINHA:=""
	  	  	   	 cLINHA+=StrZero(nNUMERO,15,0)
	  	  	   	 cLINHA+=StrTran(DToC(dDATA),"/","")
		     	 cLINHA+=StrTran(StrZero(oIMP:FIELDGET("HORA"),5,2),".","")
	             cLINHA+="00100100"
    	      ENDIF	
    	      IF oJANX:CLAYOUT="C"		
    	         cLINHA+=oIMP:FIELDGET("TIPOM")	
    	      ENDIF	
 	    	  FWrite(nHANDLE,cLINHA+Chr(13)+Chr(10))
 	      ENDIF
 	  ENDIF
      oPROGWIN:SKIP(1)
	  oIMP:SKIP()
  ENDDO	
  FClose(nHANDLE)
  FClose(Nhanerr)
  IF oJANX:CLAYOUT="B"	
     SetCentury(TRUE)
  ENDIF
ENDIF	
oIMP:CLOSE()
oPES:CLOSE()
oPROGWIN:EndDialog()

oVIEW:=JRTF{SELF,cARQERRO,"A",.T.,.T.,.T.,.T.}
oVIEW:SHOW()





METHOD XWRPTIRH() 
SELF:XWRPTIGRP("RH","")

METHOD XWRPTRH() 
SELF:XWRPTGRP("RH","")




END CLASS
