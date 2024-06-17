CLASS XIMPDES INHERIT jimpdiv

CONSTRUCTOR(oOWNER) 
SUPER(oOWNER)	
SELF:Caption:="Importar NFS Logix"
SELF:SHOW()		


METHOD OK( ) 
LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
//    LOCAL oREG2 AS SQLSelect
    LOCAL cSQL AS STRING
    LOCAL aDAD AS ARRAY
    LOCAL oSERVER AS USEMANA5
    LOCAL dataini AS DATE
    LOCAL datafim AS DATE
    //LOCAL dUSOINI AS DATE
  //  LOCAL cMIG AS STRING
    LOCAL oMB01 AS USEMANA5
    LOCAL cCGC AS STRING
    LOCAL nFORN AS DWORD
    LOCAL cCOGNOME AS STRING
    LOCAL cSERIE AS STRING
    LOCAL CESPECIE AS STRING
    LOCAL cCODREC AS STRING
    LOCAL mCHAVE AS STRING
    LOCAL nNUMERO AS DWORD
    LOCAL nLASTREC AS DWORD
    LOCAL nPOS AS DWORD
    LOCAL nPERC AS INT
    LOCAL oSTMT AS SQLStatement


IF MDG("Importar Fornecedor")
   IMPFOR()
ENDIF


  // cMIG:=PEGEMPMIG(zempRESA)


    aDAD:={zCURINI,"MK09",zCURDIR,aDIR}
    oSERVER:=USEMANA5{aDAD}
    IF oSERVER:nERRO#0
       RETU SELF
    ENDIF


    aDAD:={zCURINI,"MB01",zCURDIR,aDIR}
    oMB01:=USEMANA5{aDAD}
    IF oMB01:nERRO#0
       oSERVER:CLOSE()
       RETU SELF
    ENDIF
    oMB01:SETORDER(3)


SELF:POINTER:=POINTER{POINTERHOURGLASS}
   dataini:=SELF:DINI
   datafim:=SELF:DFIM

   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
   	  RETURN .F.
   ENDIF	


cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()


   cSQL:="select cod_fornecedor,ies_especie_nf,ser_nf,num_nf,dat_emis_nf,dat_entrada_nf,val_tot_nf_c "
   CSQL+="  from nf_sup where cod_empresa='02' and ies_especie_nf='NFS'"
   cSQL+="  and  dat_emis_nf>='" + DToC(DATAINI) + "' and  dat_emis_nf<='" + DToC(DATAFIM)  + "'"

   oreg:= SQLSelect{cSQL,oconn}


   nLASTREC:=100
   nPOS:=0


   WHILE ! OREG:EoF	
      nPerc := INT(100* nPOS/ nLASTREC)
      SELF:oDcProgBar:Position := nPerc	
  	  nPOS++
  	  IF nPOS=101
  	     nPOS:=0
  	  ENDIF
    // dUSOINI:=oREG:FIELDGET("dat_emis_nf")
      cCGC:=oREG:FIELDGET("Cod_fornecedor")
      IF SubStr(cCGC,10,4)="0000"
         cCGC:= SubStr(cCGC,1,3)+"."+SubStr(cCGC,4,3)+"."+SubStr(cCGC,7,3)+"-"+SubStr(cCGC,14,2)
      ELSE
    	 cCGC:=SubStr(CCGC,2)
         cCGC:=Left(cCGC,2)+"."+SubStr(cCGC,3,3)+"."+SubStr(cCGC,6,3)+"/"+SubStr(cCGC,9,4)+"-"+SubStr(cCGC,13,2)
      ENDIF
      nFORN:=0
      cCOGNOME:=""
      cCODREC:=""
      cESPECIE:=oREG:FIELDGET("ies_especie_nf")
      cSERIE:=oREG:FIELDGET("ser_nf")
      oMB01:SETORDER(3)
      oMB01:GOTOP()
      IF oMB01:SEEK(cCGC)
         nFORN:=oMB01:FIELDGET("NUMERO")
         cCOGNOME:=oMB01:FIELDGET("COGNOME")
         cESPECIE:= oMB01:FIELDGET("NFSESP")
         cSERIE  := oMB01:FIELDGET("NFSSER")
         cCODREC := oMB01:FIELDGET("NFSCOD")
         IF AllTrim(oMB01:FIELDGET("CIDADE"))<>"SAO PAULO"
         	IF Empty(oMB01:FIELDGET("NFSESP"))
         	   oMB01:FIELDPUT("NFSESP","FORA")	
         	ENDIF	
         	IF Empty(oMB01:FIELDGET("NFSCOD"))
         	   oMB01:FIELDPUT("NFSCOD","000000")	
         	ENDIF	
         	IF Empty(oMB01:FIELDGET("NFSSER"))
         	   oMB01:FIELDPUT("NFSSER","-")	
         	ENDIF	
         ENDIF	
      ENDIF	
      nNUMERO:=oREG:FIELDGET("num_nf")
      mCHAVE:=Str(NNUMERO,8)+Str(nFORN,8)
      oSERVER:GOTOP()
      SELF:oDCchave:Caption:=mchave
      IF .NOT. oSERVER:SEEK(mCHAVE)
       	 oSERVER:APPEND()
       	 oSERVER:FIELDPUT("FORNECEDO",NFORN)
         oSERVER:FIELDPUT("COGNOME",cCOGNOME)
       	 oSERVER:FIELDPUT("TIPOFOR","F")
         oSERVER:FIELDPUT("ESPECIE",cESPECIE)
         oSERVER:FIELDPUT("SERIE",cSERIE)
         oSERVER:FIELDPUT("CODREC",cCODREC)
         oSERVER:FIELDPUT("NUMERO",NNUMERO)
         oSERVER:FIELDPUT("DATAREF",oREG:FIELDGET("dat_emis_nf"))
         oSERVER:FIELDPUT("DATA",oREG:FIELDGET("dat_emis_nf"))
         oSERVER:FIELDPUT("DVALORNF",oREG:FIELDGET("val_tot_nf_c"))
         IF nFORN=0
            oSERVER:FIELDPUT("OBS",CCGC)
         ENDIF
      ENDIF
   	  Oreg:skip()
   ENDDO	
   Oreg:close()
   Oconn:Disconnect()
   Oserver:CLOSE()
   SELF:POINTER:=POINTER{POINTERARROW}
   alert("Concluido")


END CLASS
CLASS XIMPITEM INHERIT jimpdiv	

CONSTRUCTOR(oOWNER) 
SUPER(oOWNER)	
SELF:Caption:="Importar Itens Logix"
SELF:SHOW()			

END CLASS
CLASS XIMPMY03 INHERIT jimpdiv	

CONSTRUCTOR(oOWNER) 
SUPER(oOWNER)	
SELF:Caption:="Importar Lançamentos Processos LX"
SELF:SHOW()		


METHOD OK( ) 
    LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cSQL,cHORINI,cHORFIM,cCODIGO,cCODIGOINT AS STRING
    LOCAL aDAD AS ARRAY
    LOCAL oMY03,oMY03A AS USEMANA5
    LOCAL oMS06,oMS01 AS userede
    LOCAL dataini,datafim AS DATE
    LOCAL nNUMERO,nLASTREC,nPOS,nREF AS DWORD
   LOCAL nPERC
   LOCAL nSEQ,nSSQ AS WORD
   LOCAL nTEMPO,nPINI,nPFIM
   LOCAL lATUAL AS LOGIC
   LOCAL oStmt AS SQLStatement
   LOCAL oJAN AS JMESANO


 //  cMIG:=PEGEMPMIG(zempRESA)

lATUAl:=MDG("MES ATUAL")
IF lATUAL
   aDAD:={zCURINI,"MY03",zCURDIR,aDIR}
   oMY03:=USEMANA5{aDAD}
   IF oMY03:nERRO#0
      RETU SELF
   ENDIF
   aDAD:={zCURINI,"MY03A",zCURDIR,aDIR}
   oMY03A:=USEMANA5{aDAD}
   IF oMY03A:nERRO#0
      oMY03:CLOSE()
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
   aDAD:={zCURINI,"YA"+OJAN:cCOMP,zCURDIR,aDIR}
   oMY03A:=USEMANA5{aDAD}
   IF oMY03A:nERRO#0
      oMY03:CLOSE()
      RETU SELF
   ENDIF	
ENDIF	





   SELF:POINTER:=POINTER{POINTERHOURGLASS}
   dataini:=SELF:DINI
   datafim:=SELF:DFIM


   oConn := SQLConnection{}
////   IF ! oConn:connect("ol_logix","","")
   IF ! oConn:connect("logix","","")
  	  alert("Erro na Conecção")
   	  RETURN .F.
   ENDIF	


cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

AltD()
IF MDG("Importar Apontamentos")
  Csql:=" select apo_oper.*,cfp_appr.num_operador"
  csql+=" ,to_char(apo_oper.hor_inicio,'%R') AS hora_inicio "
  csql+=" ,to_char(apo_oper.hor_fim,'%R') AS hora_fim "
  csql+=" from APO_OPER,cfp_appr"
  csql+=" WHERE apo_oper.num_processo=cfp_appr.num_seq_registro"
  csql+=" and apo_oper.dat_producao>='"+DToC(dataini)+"' and apo_oper.dat_producao<='"+DToC(datafim) +"'"
//  csql+=" order by apo_oper.num_processo"
//,to_char(hor_inicio,'%R') AS hora_inicio      00:00
//       ,to_char(hor_fim,'%R') AS hora_inicio  00:00

   oreg:= SQLSelect{cSQL,oconn}

   nLASTREC:= oREG:RecCount
   nPOS:=0
   WHILE ! OREG:EoF	

       nPerc := INT(100* nPOS/ nLASTREC)
       SELF:oDcProgBar:Position := nPerc	
  	   nPOS++
//  	   IF nPOS=101
//  	      nPOS:=0
//  	   ENDIF

       nNUMERO:=oREG:FIELDGET("num_processo")
       SELF:oDCchave:Caption:="Apontamento: "+StrZero(nNUMERO)
       oMY03:GOTOP()

       IF ! oMY03:SEEK(nNUMERO)
          oMY03:APPEND()
          oMY03:FIELDPUT("NUMERO",nNUMERO)
          oMY03:FIELDPUT("DATA",Oreg:FIELDGET("dat_producao"))
          oMY03:FIELDPUT("DATOPR",Oreg:FIELDGET("dat_producao"))
          oMY03:FIELDPUT("CODIGOINT",Oreg:FIELDGET("cod_item"))
      	  oMY03:FIELDPUT("QTDDE",oreg:FIELDGET("qtd_boas"))
          oMY03:FIELDPUT("codmaq",oreg:FIELDGET("cod_cent_trab"))
          oMY03:FIELDPUT("HOROPR",Oreg:FIELDGET("qtd_horas"))
          oMY03:FIELDPUT("OP",Oreg:FIELDGET("num_ordeM"))
          oMY03:FIELDPUT("CODOPE",Val(FIXSTR(Oreg:FIELDGET("num_operador"))))

//          cHORINI:=Oreg:FIELDGET("hor_inicio")
//          cHORINI:=SubStr(cHORINI,At(" ",cHORINI)+1)
//          cHORINI:=Left(cHORINI,5)
          cHORINI:=Oreg:FIELDGET("hora_inicio")
          cHORINI:=StrTran(cHORINI,":",".")
          oMY03:FIELDPUT("INIOPR",Val(cHORINI))

//          cHORFIM:=Oreg:FIELDGET("hor_FIM")
//          cHORFIM:=SubStr(cHORFIM,At(" ",cHORFIM)+1)
//          cHORFIM:=Left(cHORFIM,5)

          cHORFIM:=Oreg:FIELDGET("hora_FIM")
          cHORFIM:=StrTran(cHORFIM,":",".")
          oMY03:FIELDPUT("FIMOPR",Val(CHORFIM))

          IF  oMY03:FIELDGET("FIMOPR")<oMY03:FIELDGET("INIOPR")
             oMY03:FIELDPUT("VIRADA","S")
          ENDIF	

          cCODIGO:=Oreg:FIELDGET("cod_empresa")
          DO CASE
          	 CASE cCODIGO="01"
         	 	  oMY03:FIELDPUT("FIRMA",1)
          	 CASE cCODIGO="02"
         	 	  oMY03:FIELDPUT("FIRMA",2)
          	 CASE cCODIGO="03"
         	 	  oMY03:FIELDPUT("FIRMA",3)
          	 CASE cCODIGO="99"
         	 	  oMY03:FIELDPUT("FIRMA",99)
          ENDCASE	

          oMY03:FIELDPUT("TIOOPE","T")
          oMY03:FIELDPUT("BXMY03","S")
          oMY03:FIELDPUT("TPMY03","S")
          oMY03:FIELDPUT("EXCMAQ","N")
          oMY03:Commit()

       ENDIF
   	   Oreg:skip()
   ENDDO	
   Oreg:close()
ENDIF

IF MDG("Importar Paradas")
  Csql:=" SELECT * FROM cfp_aptm"
  csql+=" WHERE cod_parada<>''"
  csql+=" and dat_producao>='"+DToC(dataini)+"' and dat_producao<='"+DToC(datafim) +"'"
//  csql+=" order by dat_producao"



   oreg:= SQLSelect{cSQL,oconn}

//   nLASTREC:=100
   nLASTREC:= oREG:RecCount
   nPOS:=0
   WHILE ! OREG:EoF	

       nPerc := INT(100* nPOS/ nLASTREC)
       SELF:oDcProgBar:Position := nPerc	
//  	   nPOS++
//  	   IF nPOS=101
//  	      nPOS:=0
//  	   ENDIF

       nNUMERO:=oREG:FIELDGET("num_seq_registro")
       cHORINI:=Oreg:FIELDGET("hor_ini_periodo")
       cHORINI:=SubStr(cHORINI,At(" ",cHORINI)+1)
       cHORINI:=Left(cHORINI,5)
       cHORINI:=StrTran(cHORINI,":",".")

       cHORFIM:=Oreg:FIELDGET("hor_fim_periodo")
       cHORFIM:=SubStr(cHORFIM,At(" ",cHORFIM)+1)
       cHORFIM:=Left(cHORFIM,5)
       cHORFIM:=StrTran(cHORFIM,":",".")

       SELF:oDCchave:Caption:="Parada"+Str(nNUMERO)
       oMY03A:GOTOP()
       IF ! oMY03A:SEEK(Str(nNUMERO,8)+Str(1,3))
          cCODIGO:=Oreg:FIELDGET("cod_parada")
          IF cCODIGO="999"
             cCODIGO:="99"
          ENDIF	
          nPINI:=Val(cHORINI)
          nPFIM:=Val(cHORFIM)

          IF nPFIM<nPINI
          	 nTEMPO:=(24-CHOR(nPINI))+CHOR(nPFIM)
          ELSE
        	 nTEMPO:=CHOR(nPFIM)-CHOR(nPINI)
          ENDIF	
          IF nTEMPO>0
          	 NOP
          ELSE	
         	 nTEMPO:=CHOR(nPFIM)-CHOR(nPINI)
          ENDIF	
          IF cCODIGO="210" .OR. cCODIGO="211"  //almoco
          	 oMY03:GOTOP()
          	 IF oMY03:SEEK(nNUMERO)
          	 	oMY03:FIELDPUT("ALMINI",nPINI)
                oMY03:FIELDPUT("ALMFIM",nPFIM)
          	 ENDIF	
          ELSE	
             oMY03A:APPEND()
             oMY03A:FIELDPUT("NUMERO",nNUMERO)
             oMY03A:FIELDPUT("ITEM",1)
             oMY03A:FIELDPUT("CODPAR",cCODIGO)
             oMY03A:FIELDPUT("CODPARD"," ")
             oMY03A:FIELDPUT("OBS"," ")
             oMY03A:FIELDPUT("PALI",0)
             oMY03A:FIELDPUT("PALF",0)
             oMY03A:FIELDPUT("PINI",nPINI)
             oMY03A:FIELDPUT("PFIM",nPFIM)
             oMY03A:FIELDPUT("TEMPO",nTEMPO)
             oMY03A:Commit()
             IF nTEMPO=0
             	oMY03A:DELETE()
             ENDIF	
          ENDIF
       ENDIF
   	   Oreg:skip()
   ENDDO	
   Oreg:close()



   nLASTREC:=OMY03A:reccount
   nPOS:=0
   oMY03A:GOTOP()
   WHILE ! oMY03A:EoF
   	   nNUMERO:=oMY03A:FIELDGET("NUMERO")
   	   nTEMPO:=0
       SELF:oDCchave:Caption:="Tempo Parada:"+Str(nNUMERO)
   	   WHILE oMY03A:FIELDGET("NUMERO")=nNUMERO .AND. ! oMY03A:EoF
   	   	   nPerc := INT(100* nPOS/ nLASTREC)
           SELF:oDcProgBar:Position := nPerc	
           nPOS++
   	   	   nTEMPO+=oMY03A:FIELDGET("TEMPO")
  	       OMY03A:Skip()
   	   ENDDO	
   	   oMY03:GOTOP()
   	   IF oMY03:SEEK(nNUMERO)
   	   	  oMY03:FIELDPUT("PARADA",nTEMPO)
   	   ENDIF	
   ENDDO	
   oMY03A:CLOSE()
ENDIF
Oconn:Disconnect()

IF MDG("Checar Codigos Internos")
  aDAD:={zCURINI,"MS06.DBF",ZCURDIR}
  oMS06:=USEREDE{aDAD}
  IF oMS06:nERRO#0
  	 oMY03:CLOSE()
     RETURN .F.
  ENDIF
   nLASTREC:=Oms06:reccount
   nPOS:=0
   oMY03:SETORDER(5) //Codigo interno
   oMS06:GOTOP()
   WHILE ! oMS06:EoF
   	   cCODIGOINT:=AllTrim(oMS06:FIELDGET("CODINT"))
	   cCODIGO:=oMS06:FIELDGET("CODIGO")
  	   nPerc := INT(100* nPOS/ nLASTREC)
       SELF:oDcProgBar:Position := nPerc	
       SELF:oDCchave:Caption:="CodigoInt->Codigo:"+cCODIGO+"/"+cCODIGOINT
       nPOS++
   	   IF ! Empty(cCODIGOINT)
   	   	  nSEQ:=oMS06:FIELDGET("SEQ")
          nSSQ:=oMS06:FIELDGET("SSQ")
          nREF:=oMS06:FIELDGET("PCHORA")
          oMY03:GOTOP()
          oMY03:SEEK(cCODIGOINT)
          WHILE AllTrim(oMY03:FIELDGET("CODIGOINT"))=cCODIGOINT .AND. ! oMY03:EOF
          	   oMY03:FIELDPUT("CODIGO",cCODIGO)
          	   oMY03:FIELDPUT("SEQ",nSEQ)
               oMY03:FIELDPUT("SSQ",nSSQ)
               oMY03:FIELDPUT("TEMPOREF",nREF)
               oMY03:SKIP()
          ENDDO	
   	   ENDIF	
   	   Oms06:skIP()
   ENDDO	
   oMS06:CLOSE()


   aDAD:={zCURINI,"MS01.DBF",ZCURDIR}
   oMS01:=USEREDE{aDAD}
   IF oMS01:nERRO#0
      oMY03:CLOSE()
      RETURN .F.
   ENDIF
   OMS01:SETORDER(3) //Codigo Int
  OMY03:SETORDER(5) //Codigo interno
  nLASTREC:=Omy03:reccount
  nPOS:=0
  WHILE ! oMy03:EoF
	 cCODIGOINT:=AllTrim(oMY03:FIELDGET("CODIGOINT"))	
 	 cCODIGO:=""
	 nPerc := INT(100* nPOS/ nLASTREC)
     nPOS++
     SELF:oDcProgBar:Position := nPerc	
     SELF:oDCchave:Caption:="CodigoInt:"+cCODIGOINT
     IF Empty(oMY03:FIELDGET("CODIGO"))
  	    oMS01:GOTOP()
  	    IF oMS01:SEEK(cCODIGOINT)
  	   	   cCODIGO:=oMS01:FIELDGET("CODIGO")
        ENDIF	
     ENDIF	
     WHILE AllTrim(oMY03:FIELDGET("CODIGOINT"))=cCODIGOINT .AND. ! oMY03:EOF
   	    IF Empty(oMY03:FIELDGET("CODIGOINT")) .AND. ! Empty(cCODIGO)
           oMY03:FIELDPUT("CODIGO",cCODIGO)
           oMY03:FIELDPUT("SEQ",99)
           oMY03:FIELDPUT("SSQ",99)
           oMY03:FIELDPUT("TEMPOREF",0)
        ENDIF
        IF Omy03:FIELDGET("QTDDE")=0
       	   oMY03:Delete()
        ENDIF
        oMY03:SKIP()
    ENDDO	
  ENDDO	
  oMS01:CLOSE()
ENDIF


IF MDG("Excluir Zerados/Efetuar Correcoes")
  nLASTREC:=Omy03:reccount
  oMY03:GOTOP()
  nPOS:=0
  WHILE ! oMy03:EoF
	 cCODIGOINT:=AllTrim(oMY03:FIELDGET("CODIGOINT"))	
 	 cCODIGO:=""
	 nPerc := INT(100* nPOS/ nLASTREC)
     nPOS++
     SELF:oDcProgBar:Position := nPerc	
     SELF:oDCchave:Caption:="CodigoInt:"+cCODIGOINT
     IF oMY03:FIELDGET("INIOPR")=0 .AND. oMY03:FIELDGET("FIMOPR")=0 .AND. oMY03:FIELDGET("PARADA")=0
     	oMY03:Delete()
     ENDIF	
     IF oMY03:FIELDGET("QTDDE")=0 .AND. oMY03:FIELDGET("PARADA")=0
     	oMY03:Delete()
     ENDIF	
     IF oMY03:FIELDGET("INIOPR")>0 .AND. oMY03:FIELDGET("FIMOPR")=0 .AND. oMY03:FIELDGET("PARADA")>0 .AND. oMY03:FIELDGET("QTDDE")=0
     	oMY03:FIELDPUT("FIMOPR",oMY03:FIELDGET("INIOPR")+BHOR(oMY03:FIELDGET("PARADA")))
     ENDIF	
     IF oMY03:FIELDGET("INIOPR")=oMY03:FIELDGET("FIMOPR") .and. oMY03:FIELDGET("ALMINI")<>oMY03:FIELDGET("ALMFIM") .AND. oMY03:FIELDGET("PARADA")=0
        //entrada = saida erro de apontamento
        Omy03:Delete()
     ENDIF
     IF oMY03:FIELDGET("INIOPR")=0 .AND. oMY03:FIELDGET("FIMOPR")=0 .AND. oMY03:FIELDGET("ALMINI")=0 .AND. oMY03:FIELDGET("ALMFIM")=0 .AND. oMY03:FIELDGET("PARADA")>0
        //sem entrada sem saida sem horario de parada porem com parada>0
        Omy03:Delete()
     ENDIF
     oMY03:SKIP()
  ENDDO	
ENDIF	


oMY03:CLOSE()
SELF:POINTER:=POINTER{POINTERARROW}
alert("Concluido")


END CLASS
CLASS XIMPMY04 INHERIT jimpdiv	

CONSTRUCTOR(oOWNER) 
SUPER(oOWNER)	
SELF:Caption:="Importar Requisicoes LX"
SELF:SHOW()		

METHOD OK( ) 
    LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cSQL AS STRING
    LOCAL aDAD AS ARRAY
    LOCAL oSERVER AS USEMANA5
    LOCAL oMW05,oMW07 AS userede
    LOCAL dataini AS DATE
    LOCAL datafim AS DATE
//    LOCAL cMIG AS STRING
    LOCAL nNUMERO AS DWORD
    LOCAL nLASTREC AS DWORD
    LOCAL nPOS AS DWORD
    LOCAL nPERC AS INT
    LOCAL cCODIGO AS STRING
    LOCAL oSTMT AS SQLStatement


 //  cMIG:=PEGEMPMIG(zempRESA,2)


    aDAD:={zCURINI,"MY04",zCURDIR,aDIR}
    oSERVER:=USEMANA5{aDAD}
    IF oSERVER:nERRO#0
       RETU SELF
    ENDIF

   SELF:POINTER:=POINTER{POINTERHOURGLASS}
   dataini:=SELF:DINI
   datafim:=SELF:DFIM

   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
   	  RETURN .F.
   ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()


//   cSQL:="select cod_fornecedor,ies_especie_nf,ser_nf,num_nf,dat_emis_nf,dat_entrada_nf,val_tot_nf_c "
//   CSQL+="  from nf_sup where cod_empresa='02' and ies_especie_nf='NFS'"

  Csql:="SELECT num_transac,cod_item,dat_movto,qtd_movto,cus_unit_movto_P "
  csql+=" from estoque_trans"
  csql+=" where cod_operacao in ('S008','BAMF')"
  csql+=" and dat_movto>='"+DToC(dataini)+"' and dat_movto<='"+DToC(datafim) +"'"


   AltD()
   oreg:= SQLSelect{cSQL,oconn}


   nLASTREC:=100
   nPOS:=0


   WHILE ! OREG:EoF	

       nPerc := INT(100* nPOS/ nLASTREC)
       SELF:oDcProgBar:Position := nPerc	
  	   nPOS++
  	   IF nPOS=101
  	      nPOS:=0
  	   ENDIF

       nNUMERO:=oREG:FIELDGET("num_transac")
       oSERVER:GOTOP()
       SELF:oDCchave:Caption:=Str(nNUMERO)
       IF .NOT. oSERVER:SEEK(nNUMERO)
          oSERVER:APPEND()
          oSERVER:FIELDPUT("NUMERO",nNUMERO)
          oSERVER:FIELDPUT("DATA",Oreg:FIELDGET("dat_movto"))
          oSERVER:FIELDPUT("TIPO1","S")
          oSERVER:FIELDPUT("CODIGO",Oreg:FIELDGET("cod_item"))
       	  oSERVER:FIELDPUT("QTDE",oreg:FIELDGET("qtd_movto"))
       	  oSERVER:FIELDPUT("TIPO3","LGX")
       	  oSERVER:FIELDPUT("PRCMY04",oreg:FIELDGET("cus_unit_movto_p"))
       ENDIF
   	   Oreg:skip()
   ENDDO	
   Oreg:close()
   Oconn:Disconnect()


  aDAD:={zCURINI,"MW05.DBF",ZCURDIR}
  oMW05:=USEREDE{aDAD}
  IF oMW05:nERRO#0
  	 oSERVER:CLOSE()
     RETURN .F.
  ENDIF

  aDAD:={zCURINI,"MW07.DBF",ZCURDIR}
  oMW07:=USEREDE{aDAD}
  IF oMW07:nERRO#0
  	 oMW05:CLOSE()
  	 oSERVER:CLOSE()
     RETURN .F.
  ENDIF


   oSERVER:GOTOP()
   WHILE ! OSERVER:EoF
   	  IF Empty(oSERVER:FIELDGET("TIPO2"))
     	 cCODIGO:=AllTrim(oSERVER:FIELDGET("CODIGO"))
   	  	 oMW05:GOTOP()
   	  	 IF oMW05:SEEK(cCODIGO)
   	  	    oSERVER:FIELDPUT("TIPO2","O")
   	  	 ELSE
 	  	 	oMW07:GOTOP()
   	  	    IF oMW07:SEEK(cCODIGO)
   	  	       oSERVER:FIELDPUT("TIPO2","R")
   	  	    ENDIF
   	  	 ENDIF	
   	  ENDIF	
   	  oSERVER:Skip()
   ENDDO	
   oMW05:CLOSE()
   oMW07:CLOSE()

   Oserver:CLOSE()
   SELF:POINTER:=POINTER{POINTERARROW}
   alert("Concluido")


END CLASS
CLASS XINDEXAR INHERIT Indexar

CONSTRUCTOR(oOWNER) 
IF ! entramenu("SAR",90)
	RETU SELF
ENDIF	
SUPER(oOWNER,cHELP)
SELF:SHOW()	

METHOD PushButton1() 
SELF:POINTER:=POINTER{POINTERHOURGLASS}
CRIANTX({ZCURINI,"SINT10.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT11.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT50.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT51.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT53.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT54.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT70.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT75.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT10.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT11.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT55.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT56.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT61.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT71.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT74.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT76.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT77.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT85.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT86.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT90.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT60A.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT60D.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT60I.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT60M.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT60R.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT88C.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT88D.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT88E.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT88M.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINT88T.DBF",ZCURDIR})
CRIANTX({ZCURINI,"CST_ICMS.DBF",ZCURDIR})
CRIANTX({ZCURINI,"CST_IPI.DBF",ZCURDIR})
CRIANTX({ZCURINI,"CST_PIS.DBF",ZCURDIR})
CRIANTX({ZCURINI,"CST_COFINS.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINTDOC.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINTSITU.DBF",ZCURDIR})
CRIANTX({ZCURINI,"efdtprod.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINTCERT.DBF",ZCURDIR})
CRIANTX({ZCURINI,"SINTPEND.DBF",ZCURDIR})

//exterior
CRIANTX({ZCURINI,"CNPJIEXX.DBF",ZCURDIR})
//Excessoes
CRIANTX({ZCURINI,"CNPJIEYY.DBF",ZCURDIR})

//CRIANTX({ZCURINI,".DBF",ZCURDIR})


SELF:POINTER:=POINTER{}

SELF:ENDWINDOW()

END CLASS
CLASS XJA1MIX INHERIT A1MIX

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",16)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"SA1100.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
//SELF:oDCCODIGO:ENABLE()
SELF:oDCA1_EST:ENABLE()
SELF:ODCA1_CGC:Enable()
SELF:oDCA1_INSCR:ENABLE()
SELF:oCCcmdcheckcgc:ENABLE()
SELF:oCCcmdcheckie:ENABLE()
SELF:oCCcmdpessoa:ENABLE()
SELF:oCCCMDCHECKUF:ENABLE()
SELF:SHOW()		


END CLASS
CLASS XJA2MIX INHERIT A2MIX	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",17)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"SA2100.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:oDCA2_EST:ENABLE()
SELF:ODCA2_CGC:Enable()
SELF:oDCA2_INSCR:ENABLE()
SELF:oCCcmdcheckcgc:ENABLE()
SELF:oCCcmdcheckie:ENABLE()
SELF:oCCcmdpessoa:ENABLE()
SELF:oCCcmdcheckuf:ENABLE()
SELF:SHOW()		


END CLASS
CLASS XJANCLI INHERIT JANCLI

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",1)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"MA01.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
//SELF:oDCCODIGO:ENABLE()
SELF:oDCESTADO:ENABLE()
SELF:ODCCGC:Enable()
SELF:oDCINSCR:ENABLE()
SELF:oCCcmdcheckcgc:ENABLE()
SELF:oCCcmdcheckie:ENABLE()
SELF:oCCcmdpessoa:ENABLE()
SELF:oCCCMDCHECKUF:ENABLE()
SELF:SHOW()		



END CLASS
CLASS XJANFOR INHERIT JFOR

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",2)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"MB01.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
//SELF:oDCCODIGO:ENABLE()
SELF:oDCESTADO:ENABLE()
SELF:ODCCGC:Enable()
SELF:oDCIESTADUAL:ENABLE()
SELF:oCCcmdcheckcgc:ENABLE()
SELF:oCCcmdcheckie:ENABLE()
SELF:oCCcmdpessoa:ENABLE()
SELF:oCCcmdcheckuf:ENABLE()
//SELF:oDCEMAIL:ENABLE()
SELF:SHOW()			


END CLASS
CLASS XJCNPJIE INHERIT jcnpjie
	
		

CONSTRUCTOR(oOWNER,cuf) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",13)
	RETU SELF
ENDIF	
IF Len(CUF)=2
   aDAD:={zCURINI,"CNPJIE"+cUF+".DBF",ZCURDIR} //sigla do estado
ELSE
   aDAD:={zCURINI,cUF+".DBF",ZCURDIR}   //Nome do arquivo
ENDIF
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:Caption:="Cadastro CNPJ/CPF IE/RG Estado de: "+Cuf
SELF:SHOW()			

END CLASS
CLASS XJEMP INHERIT JEMP	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",14)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"MANEMP.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()		


END CLASS
CLASS XJREG50 INHERIT JREG50	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",5)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"SINT50.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
//SELF:oCCcmdchecktot:disable()
SELF:oCCcmdantecipa:DISABLE()
SELF:oDCdespesas:DISABLE()
SELF:oCCCmdfrete:DISABLE()
SELF:SHOW()			


END CLASS
CLASS XJREG51 INHERIT JREG50		

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",4)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"SINT51.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
//SELF:oCCcmcchecmod:DISABLE()
//SELF:oCCcmdescmod:DISABLE()
SELF:ODCALIQUOTA:DISABLE()
//SELF:oDCBASE:DISABLE()
//SELF:oDCMODELO:DISABLE()
SELF:oCCCmdemitnete:DISABLE()
SELF:ODCemitente:disable()
SELF:oCCcmdchekval:disable()
SELF:oCCcmdantecipa:DISABLE()
SELF:oDCdespesas:DISABLE()
SELF:oCCCmdfrete:DISABLE()
SELF:SHOW()			



END CLASS
CLASS XJREG53 INHERIT JREG50

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",6)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"SINT53.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
//SELF:oCCcmdchecktot:disable()
SELF:oCCCmdfrete:DISABLE()
SELF:SHOW()	

END CLASS
CLASS XJREG54 INHERIT JREG54

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",7)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"SINT54.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			

END CLASS
CLASS XJREG70 INHERIT JREG50		

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",8)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"SINT70.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
//SELF:oCCcmdchecktot:disable()
SELF:oCCcmdantecipa:DISABLE()
SELF:oDCdespesas:DISABLE()
SELF:oCCCmdemitnete:DISABLE()
SELF:ODCemitente:disable()
SELF:SHOW()			


END CLASS
CLASS XJREG75 INHERIT JREG75

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",9)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"SINT75.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			

END CLASS
CLASS XJSINTCODI INHERIT JESCC

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",10)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"SINTCODI.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			


END CLASS
CLASS XJSINTDOC INHERIT JESCC
	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",12)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"SINTDOC.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			


END CLASS
CLASS XJSINTSITU INHERIT JESCC

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",11)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"SINTSITU.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			



END CLASS
CLASS XJUF INHERIT JUF
	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("SIN",15)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"MD05.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			

END CLASS

