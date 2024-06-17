PARTIAL CLASS JTLP
METHOD Buscanum( ) 
	SELF:KeyFind()

METHOD PORNUM( ) 
	SELF:KeyFind()

END CLASS
PARTIAL CLASS XJCRSEQ
METHOD ACUANO 
LOCAL oCRFOR,oCRFA,oMB01,oCRFT AS USEREDE
LOCAL cVAR AS STRING
LOCAL nREG,nSEQ,W,Z,X AS DWORD
LOCAL nPPMS,nFORN,nPOS,nANO AS DWORD
LOCAL nMES
LOCAL nMESTMP AS DWORD
LOCAL aMES,aSEM,adMES,adSEM,aQTDA,aDAD AS ARRAY
LOCAL aQTDS,aITEM,aFORT,aTOTAL,aCLA AS ARRAY
LOCAL nIAFS AS FLOAT
LOCAL lTIPO AS LOGIC


lTIPO:=MDG("Semestral Somente do Ano")
SELF:POINTER:=POINTER{POINTERHOURGLASS}
nSEQ:=SELF:SERVER:SEQ
nANO:=SELF:SERVER:FIELDGET("ANO")
nMES:=SELF:SERVER:FIELDGET("MES")
nREG:=SELF:SERVER:RECNO
SELF:SERVER:GOTOP()
WHILE ! SELF:SERVER:Eof
	IF nANO=SELF:SERVER:FIELDGET("ANO")
       SELF:SERVER:FIELDPUT("ANUAL","S")		
         IF lTIPO
         	nMESTMP:=SELF:SERVER:FIELDGET("MES")
            IF (nMESTMP<=nMES) .AND. (nMESTMP>=(nMES-5))
 	 	       SELF:SERVER:FIELDPUT("SEMES","S")
            ELSE	
		       SELF:SERVER:FIELDPUT("SEMES","N")
            ENDIF		
        ENDIF
    ELSE
   	   SELF:SERVER:FIELDPUT("ANUAL","N")
   	   IF lTIPO
         SELF:SERVER:FIELDPUT("SEMES","N")
       ENDIF
    ENDIF	
    IF ! lTIPO	
       SELF:SERVER:FIELDPUT("SEMES","N")
    ENDIF
    SELF:SERVER:SKIP()
ENDDO	
IF ! lTIPO
   SELF:SERVER:GOTO(nREG)
   X:=6
   WHILE ! SELF:SERVER:BOF
      SELF:SERVER:FIELDPUT("SEMES","S")	
      X--
  	  IF X=0
	     EXIT	
      ENDIF
	  SELF:SERVER:Skip(-1)
   ENDDO	
ENDIF
SELF:SERVER:GOTO(nREG)

LIMPARSEQ("CRFT.DBF",Str(nSEQ,3),nSEQ)
LIMPARSEQ("CRFA.DBF",Str(nSEQ,3),nSEQ)


SELF:POINTER:=POINTER{POINTERHOURGLASS}

aCLA:={}
aDAD:={zCURINI,"MB01.DBF",zCURDIR}
oMB01:=USEREDE{aDAD}
IF oMB01:nERRO=0
   oMB01:GOTOP()
   WHILE ! oMB01:EOF
         IF ! Empty(oMB01:FIELDGET("CONCEITO"))
             AAdd(aCLA,oMB01:FIELDGET("NUMERO"))
         ENDIF
        oMB01:SKIP()
    ENDDO
ENDIF



aDAD:={zCURINI,"CRFT.DBF",zCURDIR}
oCRFT:=USEREDE{aDAD}
IF oCRFT:nERRO#0
   alert("Erro Abrindo CRFT")
   oMB01:CLOSE()
ENDIF	


aDAD:={zCURINI,"CRFOR.DBF",zCURDIR}
oCRFOR:=USEREDE{aDAD}
IF oCRFOR:nERRO=0
   oCRFOR:SETORDER(3)
   FOR Z:=1 UPTO ALen(aCLA) //Verificando se Falta Algum Classificado
       oCRFOR:GOTOP()
       IF ! oCRFOR:SEEK(Str(nSEQ,3)+Str(aCLA[Z],8))
       	  IF aCLA[Z]>0
             oCRFOR:APPEND()
             oCRFOR:FIELDPUT("SEQ",nSEQ)
             oCRFOR:FIELDPUT("NFOR",aCLA[Z])
             oCRFOR:FIELDPUT("IAF",100)
          ENDIF
        ENDIF
    NEXT Z
    oCRFOR:SETORDER(1)
    oCRFOR:GOTOP()
//    oCRFOR:SEEK(SELF:SEQ)
    WHILE  ! oCRFOR:EOF //Atualizando Calculos
       oCRFOR:FIELDPUT("PPM",CALCPPM(oCRFOR:FIELDGET("QTDNC"),oCRFOR:FIELDGET("QTDREC")))
       oCRFOR:FIELDPUT("SEMES","N")
       oCRFOR:FIELDPUT("ANUAL","N")
       oCRFOR:SKIP()
    ENDDO
    nREG:=SELF:SERVER:RECNO     //Salva Rec
    aMES:={}
    adMES:={}
    aSEM:={}
    adSEM:={}
    SELF:SERVER:GOTOP()
    WHILE ! SELF:SERVER:EOF        //Escolhendo Meses Anual e Semetral
       IF SELF:SERVER:SEMES<>"N"
           AAdd(aSEM,SELF:SERVER:SEQ)
	       AAdd(adSEM,StrZero(SELF:SERVER:ANO,4)+"/"+StrZero(SELF:SERVER:MES,2))
//           AAdd(adSEM,MESSTR(SELF:SERVER:MES,SELF:SERVER:ANO,2,1))
       ENDIF
       IF SELF:SERVER:ANUAL<>"N"
           AAdd(aMES,SELF:SERVER:SEQ)
	       AAdd(adMES,StrZero(SELF:SERVER:ANO,4)+"/"+StrZero(SELF:SERVER:MES,2))
       ENDIF
       SELF:SERVER:SKIP()
    ENDDO
    SELF:SERVER:GOTO(nREG)     //Volta Rec
	aDAD:={zCURINI,"CRFA.DBF",zCURDIR}
	oCRFA:=USEREDE{aDAD}
	IF oCRFA:nERRO=0
       oCRFOR:SETORDER(2) //Codigo Fornecedor
       oCRFOR:GOTOP()
       WHILE ! oCRFOR:EOF
          aQTDA:={0,0,0,0}  //QT QTN IAF MESES
          aQTDS:={0,0,0,0}
          aFORT:={}
          aTOTAL:={0,0,0,0,0,0}
          nFORN:=oCRFOR:FIELDGET("NFOR")
          nPPMS:=0
          nIAFS:=0
          WHILE oCRFOR:FIELDGET("NFOR")=nFORN .AND. ! oCRFOR:EOF
             nPOS:=AScan(aSEM,oCRFOR:FIELDGET("SEQ"))
             IF nPOS>0                                            //soma Semestral
                aQTDS[1]+=oCRFOR:FIELDGET("QTDREC")
                aQTDS[2]+=oCRFOR:FIELDGET("QTDNC")
                aQTDS[3]+=FloatFormat(oCRFOR:FIELDGET("IAF"),7,2)
                aQTDS[4]++
                oCRFOR:FIELDPUT("SEMES","S")
                oCRFOR:FIELDPUT("DESCRI",adSEM[nPOS])
             ENDIF
             nPOS:=AScan(aMES,oCRFOR:FIELDGET("SEQ"))            //soma Anual
             IF nPOS>0
                aQTDA[1]+=oCRFOR:FIELDGET("QTDREC")
                aQTDA[2]+=oCRFOR:FIELDGET("QTDNC")
                aQTDA[3]+=FloatFormat(oCRFOR:FIELDGET("IAF"),7,2)
                aQTDA[4]++
                oCRFOR:FIELDPUT("ANUAL","S")
                oCRFOR:FIELDPUT("DESCRI",adMES[nPOS])
                aITEM:={}
                AAdd(aITEM,oCRFOR:FIELDGET("QTDREC"))
                AAdd(aITEM,oCRFOR:FIELDGET("QTDNC"))
                AAdd(aITEM,oCRFOR:FIELDGET("PPM"))
                AAdd(aITEM,FloatFormat(oCRFOR:FIELDGET("IAF"),7,2))
                AAdd(aITEM,nPOS)           //Sequencia de controle
                AAdd(aITEM,adMES[nPOS])
                AAdd(aFORT,aITEM)
             ENDIF
             oCRFOR:SKIP()
           ENDDO
           oCRFA:SETORDER(1)
           oCRFA:GOTOP()
           IF ! oCRFA:SEEK(Str(nSEQ,3)+Str(nFORN,8))
              oCRFA:APPEND()
              oCRFA:FIELDPUT("SEQ",nSEQ)
              oCRFA:FIELDPUT("nFOR",nFORN)
              oMB01:GOTOP()
              IF oMB01:SEEK(nFORN)
              	 oCRFA:FIELDPUT("NOME",oMB01:FIELDGET("NOME"))
              	 oCRFA:FIELDPUT("CONCEITO",oMB01:FIELDGET("CONCEITO"))
              ENDIF	
           ENDIF
           oCRFA:FIELDPUT("QTRA",aQTDA[1])
           oCRFA:FIELDPUT("QTNA",aQTDA[2])
           oCRFA:FIELDPUT("MESA",aQTDA[4])
           oCRFA:FIELDPUT("PPMA",CALCPPM(oCRFA:FIELDGET("QTNA"),oCRFA:FIELDGET("QTRA")))
           IF aQTDA[3]>0  .AND. aQTDA[4] >0
              oCRFA:FIELDPUT("IAFA",FloatFormat(aQTDA[3]/aQTDA[4],7,2))
           ELSE
             oCRFA:FIELDPUT("IAFA",0)
           ENDIF
           aTOTAL[1]:=oCRFA:FIELDGET("QTRA")
           aTOTAL[2]:=oCRFA:FIELDGET("QTNA")
           aTOTAL[3]:=oCRFA:FIELDGET("PPMA")
           aTOTAL[4]:=oCRFA:FIELDGET("IAFA")
     //    Grava Resultado Semestral Gravando mesmo Zerado
           oCRFA:GOTOP()
           IF ! oCRFA:SEEK(Str(nSEQ,3)+Str(nFORN,8))
              oCRFA:APPEND()
              oCRFA:FIELDPUT("SEQ",nSEQ)
              oCRFA:FIELDPUT("nFOR",nFORN)
              oMB01:GOTOP()
              IF oMB01:SEEK(nFORN)
              	 oCRFA:FIELDPUT("NOME",oMB01:FIELDGET("NOME"))
              	 oCRFA:FIELDPUT("CONCEITO",oMB01:FIELDGET("CONCEITO"))
              ENDIF	
           ENDIF

           oCRFA:FIELDPUT("QTRS",aQTDS[1])
           oCRFA:FIELDPUT("QTNS",aQTDS[2])
           oCRFA:FIELDPUT("MESS",aQTDS[4])
           oCRFA:FIELDPUT("PPMS",CALCPPM(oCRFA:FIELDGET("QTNS"),oCRFA:FIELDGET("QTRS")))
	        IF aQTDS[3]>0  .AND. aQTDS[4] >0
              oCRFA:FIELDPUT("IAFS",FloatFormat(aQTDS[3]/aQTDS[4],7,2))
           ELSE
              oCRFA:FIELDPUT("IAFS",0)
           ENDIF
           nPPMS:=oCRFA:FIELDGET("PPMS")
           nIAFS:=oCRFA:FIELDGET("IAFS")

           IF nFORN>0
              FOR W:=1 UPTO 4
                  oCRFT:APPEND()
                  oCRFT:FIELDPUT("NFOR",nFORN)
                  oCRFT:FIELDPUT("SEQ",nSEQ)
                  oCRFT:FIELDPUT("ITEM",W)
                  oCRFT:FIELDPUT("PPMS",nPPMS)
                  oCRFT:FIELDPUT("IAFS",nIAFS)
                  oCRFT:FIELDPUT("TOTAL",aTOTAL[W])
                  DO CASE
                     CASE W=1
				          oCRFT:FIELDPUT("DESCRICAO","QTD RECEB")
           	         CASE W=2
                          oCRFT:FIELDPUT("DESCRICAO","QTD N CONF")
                     CASE W=3
                          oCRFT:FIELDPUT("DESCRICAO","PPM")
                     CASE W=4
                          oCRFT:FIELDPUT("DESCRICAO","IAF %")
                  ENDCASE
                  FOR Z:=1 UPTO ALen(aMES)
                      FOR X:=1 UPTO ALen(aFORT)
                          IF aFORT[X][5]=Z   //nPOS usado em aitem
                             IF Z<=12 //Somente 12 meses
                                cVAR:="VAL"+StrZero(Z,2)
                                oCRFT:FIELDPUT(cVAR,aFORT[X][W])
                             ENDIF
                          ENDIF
                      NEXT X
                  NEXT Z
              NEXT W
            ENDIF
         ENDDO
         oCRFA:SetOrder(1)
         oCRFOR:SetOrder(3)
         oCRFA:GOTOP()
         oCRFA:SEEK(Str(nSEQ,3),.T.)
         WHILE oCRFA:FIELDGET("SEQ")=nSEQ .AND. ! oCRFA:EoF
         	oCRFOR:GOTOP()
         	IF oCRFOR:SEEK(Str(nSEQ,3)+Str(oCRFA:FIELDGET("NFOR"),8))
         	   oCRFOR:FIELDPUT("PPMS",oCRFA:FIELDGET("PPMS"))
         	   oCRFOR:FIELDPUT("PPMA",oCRFA:FIELDGET("PPMA"))
         	   oCRFOR:FIELDPUT("IAFS",oCRFA:FIELDGET("IAFS"))
         	   oCRFOR:FIELDPUT("IAFA",oCRFA:FIELDGET("IAFA"))
         	   oCRFA:FIELDPUT("PPM",oCRFOR:FIELDGET("PPM"))
               oCRFA:FIELDPUT("IAF",oCRFOR:FIELDGET("IAF"))
         	ENDIF	
         	oCRFA:Skip()
         ENDDO
         oCRFA:CLOSE()
     ENDIF
     oCRFOR:CLOSE()
ENDIF
oCRFT:CLOSE()
oMB01:CLOSE()

SELF:POINTER:=POINTER{POINTERARROW}
alert("Concluido")
RETU SELF

METHOD APPEND() 
LOCAL nSEQ AS DWORD
SELF:server:setorder(1)
SELF:server:gobottom()
nSEQ:=SELF:Server:SEQ
nSEQ++
SELF:SERVER:SUSPENDNOTIFICATION()
SUPER:append()
SELF:SERVER:FIELDPUT("SEQ",nSEQ)
SELF:SERVER:commit()
SELF:SERVER:resetnotification()
SELF:SERVER:notify(notifyappend)
RETURN .t.

METHOD APURAAR( ) 
    LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cSQL,cNOME,cCODIGO,cCOGNOME,cCGC,mCHAVE AS STRING       //CMIG
    LOCAL aDAD AS ARRAY
    LOCAL oMB01 AS USEMANA5
    LOCAL dataini,datafim,dusoini AS DATE
    LOCAL nFORN,nNUMERO,nLASTREC,nPOS,nITEM AS DWORD
    LOCAL nPERC AS INT
    LOCAL X AS WORD
    LOCAL oSERVER,oRIRM,oPRO AS USEREDE
    LOCAL oSTMT AS SQLStatement


   IMPFOR()

 //  cMIG:=PEGEMPMIG(zempRESA,2)

    aDAD:={zCURINI,"MB01",zCURDIR,aDIR}
    oMB01:=USEMANA5{aDAD}
    IF oMB01:nERRO#0
      // oMANA5:CLOSE()
       RETU SELF
    ENDIF
    oMB01:SETORDER(3)



   aDAD:={zCURINI,"PE01TMP.DBF",zCURDIR}
   oSERVER:=USEREDE{aDAD,.F.}
   IF oSERVER:nERRO#0   
   	  oMB01:CLOSE()
      RETU SELF
   ENDIF
   oSERVER:ZAP()
   oSERVER:PACK()



   SELF:POINTER:=POINTER{POINTERHOURGLASS}
   dataini:=SELF:SERVER:FIELDGET("DIAINI")
   datafim:=SELF:SERVER:FIELDGET("DIAFIM")

   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
   	  RETURN .f.
   ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()



  CSQL:="select a.num_aviso_rec,a.cod_fornecedor,b.cod_item,b.num_pedido,b.num_oc,d.qtd_solic,d.qtd_recebida,"
  cSQL+=" d.dat_entrega_prev,a.dat_entrada_nf,e.num_versao,a.num_nf,b.den_item,b.cod_unid_med_nf,B.num_seq "
  CSQL+=" from  nf_sup a, aviso_rec b, ar_ped c,prog_ordem_sup d, ordem_sup e"
  cSQL+=" where a.cod_empresa=b.cod_empresa and a.num_aviso_rec=b.num_aviso_rec and b.cod_empresa=d.cod_empresa"
  CSQL+=" and b.num_oc=d.num_oc and d.cod_empresa=e.cod_empresa  and  d.num_oc=e.num_oc and d.num_versao=e.num_versao"
  CSQL+=" and e.ies_versao_atual='S' and c.cod_empresa=d.cod_empresa and c.num_oc=d.num_oc and c.num_prog_entrega=d.num_prog_entrega"
  cSQL+=" and  A.dat_entrada_nf>='" + DToC(DATAINI) + "' and  a.dat_entrada_nf<='" + DToC(DATAFIM)  + "'"
  cSQL+=" and  B.ies_item_estoq='S' AND B.ies_controle_lote='S'  "

  AltD()
  oreg:= SQLSelect{cSQL,oconn}


   nLASTREC:=100
   nPOS:=0


   oSERVER:SETORDER(5)    //STR(AR,8)+STR(ARITEM,3)

   WHILE ! OREG:EoF	

     	nPerc := INT(100* nPOS/ nLASTREC)
        SELF:oDcProgBar:Position := nPerc	
  	    nPOS++
  	    IF nPOS=101
  	       nPOS:=0
  	    ENDIF

       dUSOINI:=oREG:FIELDGET("dat_entrada_nf") //dat_entrada_nf
       IF dUSOINI>=DATAINI .AND. dUSOINI<=DATAFIM


       	  cCGC:=oREG:FIELDGET("Cod_fornecedor")
          IF SubStr(cCGC,10,4)="0000"
             cCGC:= SubStr(cCGC,1,3)+"."+SubStr(cCGC,4,3)+"."+SubStr(cCGC,7,3)+"-"+SubStr(cCGC,14,2)
          ELSE
    	     cCGC:=SubStr(CCGC,2)
             cCGC:=Left(cCGC,2)+"."+SubStr(cCGC,3,3)+"."+SubStr(cCGC,6,3)+"/"+SubStr(cCGC,9,4)+"-"+SubStr(cCGC,13,2)
          ENDIF

       	  nFORN:=0
       	  cCOGNOME:=""

    	  oMB01:SETORDER(3)
       	  oMB01:GOTOP()
       	  IF oMB01:SEEK(cCGC)
             nFORN:=oMB01:FIELDGET("NUMERO")
             cCOGNOME:=oMB01:FIELDGET("COGNOME")
       	  ENDIF	
          nNUMERO:=oREG:FIELDGET("num_aviso_rec")
          nITEM:=oREG:FIELDGET("num_seq")
          cCODIGO:=oREG:FIELDGET("cod_item")
       	  oSERVER:GOTOP()
     	  SELF:oDCAPURANDO:Caption:=Str(nNUMERO)
       	  IF ! oSERVER:SEEK(Str(nNUMERO,8)+Str(nITEM,3))
       	  	  cNOME:=oREG:FIELDGET("den_item")
       	      oSERVER:APPEND()
        	  oSERVER:FIELDPUT("AR",nNUMERO)
              oSERVER:FIELDPUT("ARITEM",nITEM)
              oSERVER:FIELDPUT("CODIGO",cCODIGO)
         	  oSERVER:FIELDPUT("UNIDADE",oREG:FIELDGET("cod_unid_med_nf"))
              oSERVER:FIELDPUT("NOME",SubStr(Cnome,1,50))
    	      oSERVER:FIELDPUT("NOM2",SubStr(cnome,51))
              oSERVER:FIELDPUT("NRNOTAINI",oREG:FIELDGET("num_oc"))
              oSERVER:FIELDPUT("DATAFAT",oREG:FIELDGET("dat_entrega_prev"))
              oSERVER:FIELDPUT("TOTKGINI",oREG:FIELDGET("qtd_solic"))
        	  oSERVER:FIELDPUT("NRNOTASAI",oREG:FIELDGET("num_nf"))
              oSERVER:FIELDPUT("TOTKGANT",oREG:FIELDGET("qtd_solic"))
       	      oSERVER:FIELDPUT("TOTKGSAI",oREG:FIELDGET("qtd_recebida"))
       	      oSERVER:FIELDPUT("TIPOCLI","F")
              oSERVER:FIELDPUT("CLIENTE",nFORN)
       	      oSERVER:FIELDPUT("COGNOME",cCOGNOME)
              oSERVER:FIELDPUT("DATASAI",oREG:FIELDGET("dat_entrada_nf"))
              oSERVER:FIELDPUT("PEDIDO",oREG:FIELDGET("num_pedido"))
       	      oSERVER:FIELDPUT("ITEM",oREG:FIELDGET("num_versao"))
          ENDIF
       ENDIF
   	   Oreg:skip()
   ENDDO	
   Oreg:close()
   Oconn:Disconnect()


   aDAD:={zCURINI,"RIRM.DBF",zCURDIR}
   oRIRM:=USEREDE{aDAD}
   IF oRIRM:nERRO#0
      RETU SELF
   ENDIF

   nLASTREC:=ORIRM:RecCount
   nPOS:=0

   oSERVER:SETORDER(7)   // Str(CLIENTE,8)+Str(NRNOTASAI,8)+CODIGO
   oRIRM:SETORDER(5)
   oRIRM:GOTOP()
   oRIRM:SEEK(dATAINI)
   WHILE ! oRIRM:EOF .AND. oRIRM:FIELDGET("DATA")<DATAFIM
   	  NPerc := INT(100* nPOS/ nLASTREC)
      SELF:oDcProgBar:Position := nPerc	
	  nPOS++	
      mCHAVE:=Str(oRIRM:FIELDGET("NFORN"),8)+Str(oRIRM:FIELDGET("NRNOTA"),8)+AllTrim(oRIRM:FIELDGET("DESENHO"))
      SELF:oDCAPURANDO:Caption:= mCHAVE+"/"+Str(nLASTREC)
      oSERVER:GOTOP()
      IF oSERVER:SEEK(mCHAVE)
      	 oSERVER:FIELDPUT("RIRM",oRIRM:FIELDGET("RIRM"))
   	     oSERVER:FIELDPUT("CRM",oRIRM:FIELDGET("CRM"))
      ENDIF	
      oRIRM:SKIP()
   ENDDO


FOR X:=1 TO 2
  oSERVER:SetOrder(6)
  IF X=1
     aDAD:={zCURINI,"MU01.DBF",ZCURDIR}
  ELSE
     aDAD:={zCURINI,"MT01.DBF",ZCURDIR}
  ENDIF
  oPRO:=USEREDE{aDAD}
  IF oPRO:nERRO#0
     oSERVER:CLOSE()
     RETURN .f.
  ENDIF
  nLASTREC:=OPRO:RecCount
  nPOS:=0
  oPRO:GOTOP()
  WHILE ! oPRO:EOF	
	 nPerc := INT(100* nPOS/ nLASTREC)
     SELF:oDcProgBar:Position := nPerc	
	 nPOS++	
	 cCODIGO:=AllTrim(oPRO:FIELDGET("CODIGO"))
	 SELF:oDCAPURANDO:Caption:= CCODIGO+" "+Str(oPRO:RecNo)+"/"+Str(nLASTREC)
     oSERVER:GOTOP()
     oSERVER:SEEK(cCODIGO)	
     WHILE AllTrim(oSERVER:FIELDGET("CODIGO"))=CCODIGO .AND. ! oSERVER:EOF
     	  IF X=1
             oSERVER:FIELDPUT("TIPPED","M")	
          ELSE
             oSERVER:FIELDPUT("TIPPED","C")	
          ENDIF
          oSERVER:Skip()
     ENDDO
	 oPRO:Skip()
  ENDDO
  oPRO:CLOSE()
NEXT X


nLASTREC:=OSERVER:RecCount
nPOS:=0
oSERVER:GOTOP()
WHILE ! oSERVER:EOF
   NPerc := INT(100* nPOS/ nLASTREC)
   SELF:oDcProgBar:Position := nPerc	
   nPOS++	
   SELF:oDCAPURANDO:Caption:= Str(nPOS)+"/"+Str(nLASTREC)
   IF Empty(oSERVER:FIELDGET("TIPPED")) .AND. oSERVER:FIELDGET("RIRM")=0
   	 oSERVER:DELETE()
   ENDIF
   oSERVER:Skip()
ENDDO	
//oSERVER:PACK()
oSERVER:CLOSE()
SELF:POINTER:=POINTER{POINTERARROW}

	

METHOD APURAR 
SELF:XAPURAR(0,0)	

METHOD APURAR1 
SELF:XAPURAR(1,0)	

METHOD APURAR2 
SELF:APURAAR()	
SELF:XAPURAR(0,1)	

METHOD APURAR3 
SELF:APURAAR()
SELF:XAPURAR(1,1)	



METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("IQF","")		

METHOD DELETE() 
IF  MDG("Apagar Registro") .AND. SELF:SERVER:LOCKcurrentrecord()
	SELF:limpar()
	SELF:server:delete()
	SELF:server:unlock()
	SELF:server:skipex(-1)
ENDIF	

METHOD LIMPAR 
LOCAL nSEQ AS DWORD
nSEQ:=SELF:SERVER:SEQ
LIMPARSEQ("CRFA.DBF",Str(nSEQ,3),nSEQ)
LIMPARSEQ("CRFT.DBF",Str(nSEQ,3),nSEQ)
LIMPARSEQ("CRFOR.DBF",nSEQ,nSEQ)
LIMPARSEQ("CRDIAS.DBF",nSEQ,nSEQ)
LIMPARSEQ("RACFSAL.DBF",Str(nSEQ,3),nSEQ)
//SELF:oSFJCRDIAS:SERVER:notify(notifyfilechange)
//SELF:oSFJCRFOR:SERVER:notify(notifyfilechange)

METHOD pegcomp( ) 
	SELF:server:ano:=Year(SELF:server:DIAINI)
	SELF:server:mes:=Month(SELF:server:diafim)
	SELF:server:DESCRI:=MESSTR(SELF:server:mes,SELF:server:ano,1,2)

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()


METHOD XAPURAR(ntipo,nIAF) 
LOCAL oRACFSAL,oCRFOR,oCRDIAS,oCRM,oRACF,oMB01 AS USEREDE
LOCAL cNOME AS STRING           //  cCRM,
LOCAL aDAD,aFOR,aQTD AS ARRAY //,aQTDA,aQTDS AS ARRAY
LOCAL aDIAS,aDEV AS ARRAY   //ames   asem
LOCAL nSEQ,nPOS,nPOSBUS,nVEZES,XZ,nLASTREC AS DWORD   //  nDIAS, nREG   nFORN
LOCAL cCAMPO01 AS STRING     //  ,cCAMPO02
LOCAL nPERC AS INT

SELF:limpar()

//cCRM:=PEGINIVAL(ZCURINI,"SISTEMAS","CRM")

SELF:POINTER:=POINTER{POINTERHOURGLASS}
nSEQ:=SELF:SERVER:SEQ

//Apurando Dias
//cVAR:="PE"+Right(StrZero(Year(SELF:SERVER:DIAINI),4),2)+StrZero(Month(SELF:SERVER:DIAINI),2)
SOMADIAS(nSEQ,SELF:SERVER:DIAINI,SELF:SERVER:DIAFIM,nIAF)


//Apurando CRM-Entradas
aFOR:={}
aQTD:={}
aDEV:={}
aDIAS:={}

nVEZES:=1
IF nTIPO=1
  nVEZES:=2
ENDIF	



FOR XZ:=1 TO nVEZES
  IF nTIPO=0
     aDAD:={zCURINI,"CRM.DBF",zCURDIR}
     cCAMPO01:="CLIFOR"
  ELSE
	 cCAMPO01:="NFORN"
  	 IF XZ=1
        aDAD:={zCURINI,"RIRM.DBF",zCURDIR}
	 ELSE
        aDAD:={zCURINI,"RIST.DBF",zCURDIR}
	 ENDIF
  ENDIF
  oCRM:=USEREDE{aDAD}
  IF oCRM:nERRO=0
  	 IF NTIPO=0
        oCRM:SETORDER(2)
     ELSE
        oCRM:SETORDER(5)
     ENDIF

     nLASTREC:=OCRM:RecCount
     nPOS:=0

     oCRM:GOTOP()
     oCRM:SEEK(SELF:SERVER:DIAINI,TRUE)
     WHILE oCRM:FIELDGET("DATA")<=SELF:SERVER:DIAFIM .AND. ! oCRM:EOF
     	 NPerc := INT(100* nPOS/ nLASTREC)
         SELF:oDcProgBar:Position := nPerc	
	     nPOS++	
         SELF:oDCAPURANDO:Caption:= Str(nPOS)+"/"+Str(nLASTREC)
         nPOSBUS:=AScan(aFOR,oCRM:FIELDGET(CCAMPO01))
         IF nPOSBUS=0
            AAdd(aFOR,oCRM:FIELDGET(CCAMPO01))
            AAdd(aQTD,oCRM:FIELDGET("QTDE"))
            AAdd(aDEV,0) 						 //Gravar as devoluções
            AAdd(aDIAS,FloatFormat(100,7,2)) //Gravas Dias de Atraso
         ELSE
 			aQTD[NPOSBUS]+=oCRM:FIELDGET("QTDE")
         ENDIF
         oCRM:SKIP()
    ENDDO
    oCRM:CLOSE()
  ENDIF
NEXT XZ

//Apurando RACF Devoluções
aDAD:={zCURINI,"RACF.DBF",zCURDIR}
oRACF:=USEREDE{aDAD}
IF oRACF:nERRO=0
   nLASTREC:=ORACF:RecCount
   nPOS:=0
   oRACF:SETORDER(2)
   oRACF:GOTOP()
   oRACF:SEEK(SELF:SERVER:DIAINI)
   WHILE oRACF:FIELDGET("DATA")<=SELF:SERVER:DIAFIM .AND. ! oRACF:EOF
   	     NPerc := INT(100* nPOS/ nLASTREC)
         SELF:oDcProgBar:Position := nPerc	
	     nPOS++	
         SELF:oDCAPURANDO:Caption:= Str(nPOS)+"/"+Str(nLASTREC)
         nPOSBUS:=AScan(aFOR,oRACF:FIELDGET("FORNECEDO"))
         IF oRACF:FIELDGET("APRO")="A" .OR. oRACF:FIELDGET("APRO")="D" .OR. Empty(oRACF:FIELDGET("APRO"))
            IF nPOSBUS=0
	  	         AAdd(aFOR,oRACF:FIELDGET("FORNECEDO"))
	            AAdd(aQTD,0)
	            AAdd(aDEV,oRACF:FIELDGET("QTN1")+oRACF:FIELDGET("QTN2") )
	            AAdd(aDIAS,FloatFormat(100,7,2))
            ELSE
   			   aDEV[NPOSBUS]+=(oRACF:FIELDGET("QTN1")+oRACF:FIELDGET("QTN2"))
            ENDIF
         ENDIF
         oRACF:SKIP()
     ENDDO
     oRACF:CLOSE()
ENDIF


aDAD:={zCURINI,"CRDIAS.DBF",zCURDIR}
oCRDIAS:=USEREDE{aDAD}
IF oCRDIAS:nERRO=0
   nLASTREC:=OCRDIAS:RecCount
   nPOS:=0
   oCRDIAS:GOTOP()
   oCRDIAS:SEEK(nSEQ)
   WHILE oCRDIAS:FIELDGET("SEQ")=nSEQ .AND. ! oCRDIAS:EOF
   	     NPerc := INT(100* nPOS/ nLASTREC)
         SELF:oDcProgBar:Position := nPerc	
	     nPOS++	
         SELF:oDCAPURANDO:Caption:= Str(nPOS)+"/"+Str(nLASTREC)
         nPOSBUS:=AScan(aFOR,oCRDIAS:FIELDGET("NFOR"))
         IF nPOSBUS=0
            AAdd(aFOR,oCRDIAS:FIELDGET("NFOR"))
            AAdd(aQTD,0)
            AAdd(aDEV,0)
            AAdd(aDIAS,FloatFormat(oCRDIAS:FIELDGET("DIAS"),7,2))
         ELSE
			aDIAS[NPOSBUS]:=FloatFormat(oCRDIAS:FIELDGET("DIAS"),7,2)
         ENDIF
         oCRDIAS:SKIP()
   ENDDO
   oCRDIAS:CLOSE()
ENDIF

//Apagando Saldo de Não Conformidade Mes de Apuracao
aDAD:={zCURINI,"RACFSAL.DBF",zCURDIR}
oRACFSAL:=USEREDE{aDAD}
IF oRACFSAL:nERRO=0
   nLASTREC:=ORACFSAL:RecCount
   nPOS:=0	
   oRACFSAL:SEEK(Str(nSEQ-1,3))
   WHILE oRACFSAL:FIELDGET("SEQ")=nSEQ-1 .AND. ! oRACFSAL:EOF //Somando Mes anterior
   	     NPerc := INT(100* nPOS/ nLASTREC)
         SELF:oDcProgBar:Position := nPerc	
	     nPOS++	
         SELF:oDCAPURANDO:Caption:= Str(nPOS)+"/"+Str(nLASTREC)
         nPOSBUS:=AScan(aFOR,oRACFSAL:FIELDGET("CLIFOR"))
         IF nPOSBUS=0
            AAdd(aFOR,oRACFSAL:FIELDGET("CLIFOR"))
            AAdd(aQTD,0)
            AAdd(aDEV,oRACFSAL:FIELDGET("QTDE"))
            AAdd(aDIAS,100)
         ELSE
			aDEV[NPOSBUS]:=aDEV[nPOSBUS]+oRACFSAL:FIELDGET("QTDE")
         ENDIF
     	 oRACFSAL:Skip()
	ENDDO	
ENDIF	


//Gravando Movimentos
aDAD:={zCURINI,"MB01.DBF",zCURDIR}
oMB01:=USEREDE{aDAD}
IF oMB01:nERRO#0
   alert("Erro Abrindo Arquivo FORnecedores")
   oRACFSAL:CLOSE()	
ENDIF	


aDAD:={zCURINI,"CRFOR.DBF",zCURDIR}
oCRFOR:=USEREDE{aDAD}
IF oCRFOR:nERRO#0
   alert("Erro Abrindo Arquivo CRFOR.DBF")
   oMB01:CLOSE()	
   oRACFSAL:CLOSE()	
ENDIF	

nLASTREC:=ALen(aFOR)

FOR nPOS:=1 UPTO nLASTREC
   IF aFOR[nPOS]>0
   	  NPerc := INT(100* nPOS/ nLASTREC)
      SELF:oDcProgBar:Position := nPerc	
      SELF:oDCAPURANDO:Caption:= Str(nPOS)+"/"+Str(nLASTREC)
   	  cNOME:=""
   	  oMB01:GOTOP()
   	  IF oMB01:SEEK(aFOR[nPOS])
   	     cNOME:=oMB01:FIELDGET("NOME")
   	  ENDIF
      oCRFOR:APPEND()
      oCRFOR:FIELDPUT("SEQ",SELF:SEQ)
      oCRFOR:FIELDPUT("NFOR",aFOR[nPOS])
      oCRFOR:FIELDPUT("NOME",cNOME)
      oCRFOR:FIELDPUT("QTDREC",aQTD[nPOS])
      oCRFOR:FIELDPUT("QTDNC",aDEV[nPOS])
      oCRFOR:FIELDPUT("IAF",aDIAS[nPOS])
      IF oCRFOR:FIELDGET("QTDNC")>0 .AND. oCRFOR:FIELDGET("QTDREC")>0
         oCRFOR:FIELDPUT("PPM",INT(oCRFOR:FIELDGET("QTDNC")*1000000/oCRFOR:FIELDGET("QTDREC")))
      ELSE
         oCRFOR:FIELDPUT("PPM",0)
         IF oCRFOR:FIELDGET("QTDNC")>0 //Grava Para o Mes seguinte
      	    oRACFSAL:FIELDPUT("SEQ",nSEQ)
       	    oRACFSAL:FIELDPUT("CLIFOR",oCRFOR:FIELDGET("NFOR"))
       	    oRACFSAL:FIELDPUT("QTDE",oCRFOR:FIELDGET("QTDNC"))
         ENDIF	
      ENDIF
   ENDIF
   //depois de processar
   nPOS++	
NEXT nPOS
oCRFOR:PACK()
oCRFOR:CLOSE()
oRACFSAL:CLOSE()
oMB01:CLOSE()
SELF:POINTER:=POINTER{POINTERARROW}
alert("Concluido")
RETU SELF


END CLASS
FUNC SOMADIAS(nSEQ,dINI,dFIM,nIAF)
LOCAL oARQ AS DBSERVER
LOCAL oCRDIAS AS USEREDE
LOCAL nCLIENTE,nQITE  AS DWORD
LOCAL nQCLI AS FLOAT
LOCAL cPCP AS STRING                      
LOCAL aDAD AS ARRAY

IF nIAF=0
   cPCP:=PEGINIVAL(ZCURINI,"SISTEMAS","MANA5P")+"E"+StrZero(Year(DINI),4)+"\"
   cPCP:=CPCP+"PE"+Right(StrZero(Year(DINI),4),2)+StrZero(Month(DINI),2)
ELSE
   cPCP:=ZCURDIR+"PE01TMP"	
ENDIF

//alert(cpcp)
IF ! File(cPCP+".DBF")
   alert("Falta Arquivo: "+Cpcp)
   alert("Fechar o Mes Programa de Entrega")
   RETURN .f.
ENDIF


aDAD:={zCURINI,"CRDIAS.DBF",zCURDIR}
oCRDIAS:=USEREDE{aDAD}
IF oCRDIAS:nERRO#0
   alert("Erro Abrindo:  CRDIAS")
   RETURN .f.
ENDIF


oARQ:=DBSERVER{cPCP }
IF ! oARQ:USED
   alert("Erro Abrindo: "+CPCP)
   oCRDIAS:CLOSE()
   RETURN .f.
ENDIF
oARQ:SETORDER(4) //CLIENTE
oARQ:GOTOP()
WHILE ! oARQ:EOF
   nCLIENTE:=oARQ:FIELDGET("CLIENTE")
   nQCLI :=0
   nQITE :=0
   WHILE nCLIENTE=oARQ:FIELDGET("CLIENTE")  .AND. ! oARQ:EOF
      IF oARQ:FIELDGET("DATAFAT")>=dINI .AND. oARQ:FIELDGET("DATAFAT")<=dFIM
      	 IF oARQ:FIELDGET("DATASAI")-oARQ:FIELDGET("DATAFAT")>6    
      	 	NOP
//          nao soma é atraso
         ELSE
       	   nQCLI++
         ENDIF
         nQITE++
      ENDIF		
      oARQ:SKIP()
   ENDDO
   IF nQITE>0
      oCRDIAS:APPEND()
      oCRDIAS:FIELDPUT("SEQ",nSEQ)
      oCRDIAS:FIELDPUT("NFOR",nCLIENTE)
      oCRDIAS:FIELDPUT("DIAS",FloatFormat(nQCLI/nQITE*100,7,2))
      oCRDIAS:FIELDPUT("QTENT",nQITE)
      oCRDIAS:FIELDPUT("QTPRZ",nQCLI)
  ENDIF
ENDDO
oARQ:CLOSE()
oCRDIAS:CLOSE()
RETURN .t.






