PARTIAL CLASS jCRMNEW
METHOD bloqCOD( ) 
SELF:oDCCBUSCA:disable()
SELF:oDCTIPOE:disable()
SELF:oCCTIPOC:disable()
SELF:oCCTIPOM:disable()
SELF:oCCTIPOT:disable()
SELF:oCCTIPOO:disable()
SELF:oCCTIPOP:disable()
SELF:oCCpegcod1:Disable()
SELF:oCCesccod2:Disable()
SELF:oCCescPRO1:Disable()
SELF:oDCcodavu:Disable()
SELF:oCCCMDTRAPRO:Disable()
SELF:oCCpegcod:Disable()
SELF:oCCesccod:Disable()


METHOD calcpeca 
LOCAL nPESO,nCALC AS FLOAT	
IF  SELF:ODCTIPOE:Value<>"T"
   alert("Não é Tratamento Servicos Tratamento/Serviços")	
   SELF:oDCcRASTRO:SetFocus()
   RETU
ENDIF		
nPESO:=Val(SELF:oDCPESO:TEXTVALUE)	
IF nPESO>0
   nCALC:=Val(SELF:ODCPESONFA:TextValue)	
   nCALC:=FloatFormat(nCALC/nPESO,8,2)
   SELF:ODCQTDEA:TextValue:=Str(nCALC)

   nCALC:=Val(SELF:ODCPESONFB:TextValue)	
   nCALC:=FloatFormat(nCALC/nPESO,8,2)
   SELF:ODCQTDEB:TextValue:=Str(nCALC)

ENDIF	

METHOD calcpeso 
LOCAL nPESO,nCALC AS FLOAT	
IF  SELF:ODCTIPOE:Value<>"T"
   alert("Não é Tratamento Servicos Tratamento/Serviços")	
   SELF:oDCcRASTRO:SetFocus()
   RETU
ENDIF		
nPESO:=Val(SELF:oDCPESO:TEXTVALUE)	
IF nPESO=0
   SELF:CHKPESO()
ENDIF	
IF nPESO>0
   nCALC:=Val(SELF:ODCQTDEA:TextValue)	
   nCALC:=FloatFormat(nCALC*nPESO,8,2)
   SELF:ODCPESONFA:TextValue:=Str(nCALC)
   nCALC:=Val(SELF:ODCQTDEB:TextValue)	
   nCALC:=FloatFormat(nCALC*nPESO,8,2)
   SELF:ODCPESONFB:TextValue:=Str(nCALC)
ENDIF	


METHOD CANCELAR 
lOK:= .F.	
SELF:EndWindow()
	
	


METHOD CHECKAR( ) 
LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cSQL AS STRING
    LOCAL aDAD AS ARRAY
    LOCAL oMANA5 AS USEMANA5
    LOCAL oMB01 AS USEMANA5
    LOCAL oMA01 AS USEMANA5
//        LOCAL cMIG AS STRING
    LOCAL cCGC AS STRING
    LOCAL nFORN AS DWORD
    LOCAL cCOGNOME AS STRING
    LOCAL cTIPOFOR AS STRING
    LOCAL cCODIGO AS STRING
    LOCAL cUNID AS STRING
    LOCAL nQTDE AS FLOAT
    LOCAL X AS DWORD
    LOCAL cTIPO AS STRING
    LOCAL oPE AS USEREDE
    LOCAL oSTMT AS SQLStatement


//   cMIG:=PEGEMPMIG(zempRESA)

    aDAD:={zCURINI,"MB01",zCURDIR,aDIR}
    oMB01:=USEMANA5{aDAD}
    IF oMB01:nERRO#0
       RETU SELF
    ENDIF
    oMB01:SETORDER(3) //CGC


    aDAD:={zCURINI,"MA01",zCURDIR,aDIR}
    oMA01:=USEMANA5{aDAD}
    IF oMA01:nERRO#0
       oMB01:CLOSE()
       RETU SELF
    ENDIF
    oMA01:SETORDER(4) //CGC




   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix")
  	  alert("Erro na Conecção")
   	  RETU
   ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

  CSQL:=" SELECT aviso_rec.*, "
  CSQL+=" nf_sup.num_nf, nf_sup.cod_fornecedor "
  CSQL+=" FROM "
  CSQL+=" aviso_rec INNER JOIN nf_sup ON aviso_rec.num_aviso_rec = nf_sup.num_aviso_rec"
  csql+=" where aviso_rec.num_aviso_rec=" +Trim(Str(SELF:AR))  +" AND  aviso_rec.num_seq="+  Str(SELF:ARITEM)


//' por enquanto todas AS empresa
//'   cSQL+=" AND COD_EMPRESA='" +CMIG+ "'"


   oreg:= SQLSelect{cSQL,oconn}
   IF ! OREG:EoF	
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

     cUNID:=OREG:FIELDGET("cod_unid_med_nf")
     SELF:ENTREGA:=OREG:FIELDGET("dat_inclusao_seq")
     cCODIGO:=OREG:FIELDGET("cod_item")

     NQTDE:=oreg:FIELDGET("qtd_declarad_nf")
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
     SELF:QTDEA:=nQTDE
     SELF:QTDEPED:=NQTDE
     SELF:NRNOTA:=oREG:FIELDGET("num_nf")
     SELF:PRECo:=oreg:FIELDGET("pre_unit_nf")
     SELF:PRECOPR:=oreg:FIELDGET("pre_unit_nf")
     SELF:CmdAR()
     SELF:RASTRONUM:=SELF:AR
     SELF:RASTROITEM:=SELF:ARITEM
     SELF:cmdgera()
     SELF:CLIFOR:=nforn
     SELF:COGNOME:=cCOGNOME
     IF cTIPOFOR="C"
     	SELF:oDCTIPCAD:Value:="C"
     ELSE
     	SELF:oDCTIPCAD:Value:="F"
     ENDIF	
     SELF:ITEUNI:=CUNID
     SELF:oDCTIPCAD:disable()
     SELF:OCCCHKPED:disable()
     SELF:OCCCHKPRG:Disable()
     SELF:OCCCHKREQ:disable()
     SELF:OCCCHECKAR:Disable()
     SELF:CBUSCA:=CCODIGO
     SELF:PEPED:=oREG:FIELDGET("num_pedido")
     SELF:PEITE:=1




           SELF:ODCNRNOTA:Disable()
           SELF:oDCPRPED:Disable()
           SELF:oDCPRITE:Disable()
           SELF:oDCPEPED:Disable()
           SELF:oDCPEITE:Disable()
           SELF:ODCPEREQ:Disable()
           SELF:oDCAUT:Disable()
           SELF:oCCCHKPRC:Disable()
           SELF:oCCCHKPED:Disable()
           SELF:oCCCHKREQ:Disable()
           SELF:oCCCHKPRG:Disable()
           SELF:oCCESCFOR:Disable()
          SELF:ODCPERCLI:Disable()
          SELF:oDCPRECO:Disable()
          SELF:ODCAR:disable()
          SELF:oDCARITEM:disable()
          SELF:OCCESCPED:DISABLE()
          SELF:OCCESCPRG:Disable()
          SELF:OCCESCPEMO:DISABLE()
          IF nFORN>0
             SELF:oDCCLIFOR:Disable()
          ENDIF


   ENDIF
   Oreg:close()

   Oconn:Disconnect()



cTIPO:=" "
FOR X:=1 TO 3
   IF Empty(CTIPO)
   	  DO CASE
   	  	 CASE X=1
            aDAD:={zCURINI,"MU01",zCURDIR,aDIR}
   	  	 CASE X=2
            aDAD:={zCURINI,"MT01",zCURDIR,aDIR}
  	  	 CASE X=3
            aDAD:={zCURINI,"MP03",zCURDIR,aDIR}
   	  ENDCASE
      oMANA5:=USEMANA5{aDAD}
      IF oMANA5:nERRO#0
         RETU SELF
      ENDIF
      oMANA5:GOTOP()
      IF oMANA5:SEEK(Trim(cCODIGO))
   	     DO CASE
   	  	    CASE X=1
   	  	 	    cTIPO:="M"
   	  	    CASE X=2
   	  	 	    cTIPO:="C"
  	  	    CASE X=3
   	  	 	    cTIPO:="T"
   	     ENDCASE
      ENDIF
      oMANA5:CLOSE()
   ENDIF
NEXT X

SELF:TIPOE:=CTIPO
SELF:pegcod()


IF SELF:PEPED=0
  aDAD:={zCURINI,"PEMO.DBF",zCURDIR}
  oPE:=USEREDE{aDAD}
  IF oPE:nERRO=0
  	 oPE:SETORDER(2)
     oPE:GOTOP()
     oPE:SEEK("M"+AllTrim(SELF:CBUSCA))
     IF AllTrim(oPE:FIELDGET("CODIGO"))=AllTrim(SELF:CBUSCA)
        SELF:peRcli:=Ope:FIELDGET("PEDIDO")
     ENDIF
     oPE:CLOSE()	
     IF SELF:PERCLI>0
        SELF:CHKPRC()
     ENDIF
  ENDIF
	
ENDIF	


   alert("Concluido")
		

METHOD CHKCTR(nCOMPED,nCOMITE) 
LOCAL aDAD AS ARRAY	
LOCAL oMW01,oMW02 AS  USEREDE
LOCAL nERRO AS WORD
nERRO:=0
aDAD:={zCURINI,"MW01.DBF",zCURDIR}
oMW01:=USEREDE{aDAD}
IF oMW01:nERRO=0
   oMW01:GOTOP()
   IF oMW01:SEEK(nCOMPED)
   	  IF oMW01:FIELDGET("CONTRATO")#"S"
   	  	 nERRO:=3
   	  ENDIF	
   	  IF oMW01:FIELDGET("RECEBER")#"S"
   	  	 nERRO:=4
   	  ENDIF	
   ELSE
   	  nERRO:=2
   ENDIF	
ELSE
   nERRO:=1	
ENDIF
oMW01:CLOSE()

aDAD:={zCURINI,"MW02.DBF",zCURDIR}
oMW02:=USEREDE{aDAD}
IF oMW02:nERRO=0
   oMW02:GOTOP()
   oMW02:SEEK(Str(nCOMPED,8)+Str(nCOMITE,3))
   IF oMW02:FOUND
      IF oMW02:FIELDGET("BLQITEM")="S"
      	 nERRO:=7
      ENDIF	
   ELSE
     nERRO:=6
   ENDIF
ELSE
   nERRO:=5
ENDIF
oMW02:CLOSE()

IF NERRO=1
   alert("Erro checando Pedidos")
ENDIF	
IF NERRO=2
   alert("Pedido Nao Encontrado "+Str(nCOMPED))	
ENDIF	
IF nERRO=3
   alert("Pedido Nao E Contrato "+Str(nCOMPED))		
ENDIF	
IF NERRO=4
   alert("Pedido Marcado Nao Receber "+Str(nCOMPED))
ENDIF	
IF NERRO=5
   alert("Erro checando Itens Pedidos")
ENDIF	
IF NERRO=6
   alert("Item do Pedido Nao Encontrado "+Str(nCOMPED)+"."+Str(nCOMITE))	
ENDIF	
IF NERRO=7
   alert("Item do Pedido bloqueado "+Str(nCOMPED)+"."+Str(nCOMITE))	
ENDIF	
IF nERRO>0
   SELF:ZERAVAL()
ENDIF

METHOD CHKPED() 
LOCAL oMW02,oMW01,oMY04 AS USEREDE
LOCAL nPEPED,nPEITE,nCOMPED AS DWORD
LOCAL lACHEI AS LOGIC
LOCAL aDAD,APRO AS ARRAY
LOCAL nSALDO AS FLOAT
//AltD()
IF Empty(SELF:ODCPEPED)
    RETU
ENDIF
IF Empty(SELF:ODCPEITE)
   RETU
ENDIF
lACHEI:=.F.
nPEPED:=Val(SELF:oDCPEPED:TEXTVALUE)
nPEITE:=Val(SELF:ODCPEITE:TEXTVALUE)
nCOMPED:=0
aDAD:={zCURINI,"MW02.DBF",zCURDIR}
oMW02:=USEREDE{aDAD}
IF oMW02:nERRO=0
     oMW02:GOTOP()
     oMW02:SEEK(Str(nPEPED,8)+Str(nPEITE,3))
     IF oMW02:FOUND
     	IF oMW02:FIELDGET("BLQITEM")<>"S"
    	 	lACHEI:=.T.
	        SELF:oDCTIPCAD:Value:="F"
	        SELF:ODCTIPOE:VALUE:=oMW02:FIELDGET("ITETIP")
    	    IF SELF:ODCTIPOE:VALUE="T"	
        	   SELF:oDCCPRODUTO:TextValue:=oMW02:FIELDGET("ITECOD")
	           SELF:oDCCPRODUTO:Disable()
    	       SELF:oDCPESONFA:Enable()
        	   SELF:oDCPESONFB:Enable()
	        ELSE	
    	       SELF:ODCCBUSCA:TextValue:=oMW02:FIELDGET("ITECOD")
			   SELF:ODCCBUSCA:Disable()			
	        ENDIF
    	    nSALDO:=oMW02:FIELDGET("ITEQTD")-oMW02:FIELDGET("ITEENT")
	        IF nSALDO<0
    	       nSALDO:=0
	        ENDIF	
    	    SELF:ODCQTDEA:TextValue:=Str(nSALDO)
	        SELF:ODCQTDEPED:TextValue:=Str(nSALDO)
	        SELF:ODCPRECOPR:TextValue:=Str(oMW02:FIELDGET("ITEPRC"))
	        SELF:IPI:=oMW02:FIELDGET("ITEIPI")
	        SELF:oDCITEUNI:TextValue:=oMW02:FIELDGET("ITEUNI")
    	    SELF:oDCDESCRI:TextValue:=AllTrim(oMW02:FIELDGET("ITENOM"))+AllTrim(oMW02:FIELDGET("ITENO2"))
        	SELF:oDCTIPCAD:Disable()
	        SELF:ODCTIPOE:Disable()
	        SELF:oCCTIPOC:disable()
    	    SELF:oCCTIPOM:disable()
        	SELF:oCCTIPOT:disable()
	        SELF:oCCTIPOP:disable()
    	    SELF:oCCTIPOO:disable()
        	SELF:oDCPRPED:Disable()
	        SELF:oDCPRITE:Disable()
    	    SELF:oDCPEPED:Disable()
        	SELF:oDCPEITE:Disable()
	        SELF:ODCPEREQ:Disable()
    	    SELF:oDCAUT:Disable()
        	SELF:oCCCHKPED:Disable()
	        SELF:oCCCHKREQ:Disable()
    	    SELF:oCCCHKPRG:Disable()
	        SELF:oCCCHKPRC:Disable()
    	    SELF:odcpercli:TextValue:="0"
        	SELF:oDCReceber:Value:= .F.
	        SELF:oDCPEDCLI:TextValue:=oMW02:FIELDGET("PEDCLI")
    	    IF oMW02:FIELDGET("PEDCLI")="S"
        	   SELF:oDCReceber:Value:= .T.
	        ENDIF
    	    SELF:ODCPERCLI:Disable()
        	SELF:oCCESCFOR:DISABLE()
	        nCOMPED:=oMW02:FIELDGET("COMPED")
    	 ELSE
    	   oMW02:CLOSE()
           alert("Item do Pedido Bloqueado")
           SELF:ZERAVAL()
           RETU
        ENDIF
     ELSE
  	    oMW02:CLOSE()
        alert("Pedido Nao Encontrado")
        SELF:ZERAVAL()
       	RETU
     ENDIF
     oMW02:CLOSE()
ENDIF
IF nCOMPED>0
	aDAD:={zCURINI,"MW01.DBF",zCURDIR}
	oMW01:=USEREDE{aDAD}
	IF oMW01:nERRO=0
		oMW01:GOTOP()
		IF oMW01:SEEK(nCOMPED)
	       SELF:ODCCLIFOR:TextValue:=Str(oMW01:FIELDGET("COMFOR"))		
	       SELF:COGNOME:=oMW01:FIELDGET("COMCOG")
           SELF:PGTO:=oMW01:FIELDGET("COMCPAG")+"-"+AllTrim(oMW01:FIELDGET("COMCPAGD"))	
		   SELF:ODCCLIFOR:Disable()
		ENDIF	
	ENDIF
ENDIF
IF lACHEI
	aDAD:={zCURINI,"MY04.DBF",zCURDIR}
	oMY04:=USEREDE{aDAD}
	IF oMY04:nERRO=0
		oMY04:SetOrder(4)
	   oMY04:GOTOP()
	   IF oMY04:SEEK(Str(nPEPED,8)+Str(nPEITE,3))
    	  SELF:oDCTIPCAD:Value:="F"
	      SELF:ODCCLIFOR:TextValue:=Str(oMY04:FIELDGET("NUMMB01"))
     	  SELF:ODCTIPOE:VALUE:=oMY04:FIELDGET("TIPO2")
	      SELF:ODCCBUSCA:TextValue:=oMY04:FIELDGET("CODIGO")
	      SELF:ODCQTDEA:TextValue:=Str(oMY04:FIELDGET("QTDE"))
	      SELF:ODCQTDEPED:TextValue:=Str(oMY04:FIELDGET("QTDE"))	
   	      SELF:ODCNRNOTA:TextValue:=Str(oMY04:FIELDGET("NRNOTA"))
	      SELF:oDCTIPCAD:Disable()
	      SELF:ODCCLIFOR:Disable()
	      SELF:ODCTIPOE:Disable()
          SELF:ODCCBUSCA:Disable()
	      SELF:ODCQTDEA:Disable()
	      SELF:ODCNRNOTA:Disable()
	      SELF:oDCPRPED:Disable()
	      SELF:oDCPRITE:Disable()
          SELF:oDCPEPED:Disable()
    	  SELF:oDCPEITE:Disable()
	      SELF:ODCPEREQ:Disable()
	      SELF:oDCAUT:Disable()
	      SELF:oCCCHKPED:Disable()
	      SELF:oCCCHKREQ:Disable()
	      SELF:oCCCHKPRG:Disable()
      ENDIF
      oMY04:CLOSE()
   ENDIF	
ENDIF
SELF:CHKCTR(nCOMPED,nPEITE)
IF SELF:ODCTIPOE:VALUE="X"		
   SELF:ODCCBUSCA:ENABLE()
   SELF:ODCTIPOE:Enable()
ENDIF	
IF SELF:oDCTIPOE:Value="T"
   aPRO:=PEGMP03(AllTrim(SELF:oDCCPRODUTO:Value),zCURINI,zCURDIR)
   IF aPRO[1]
      SELF:oDCCBUSCA:TextValue:=aPRO[4]
      SELF:oDCCBUSCA:Disable()
   ENDIF
ENDIF
SELF:oDCmDATA:TextValue:=DToC(Today())
SELF:CHKPESO(.F.)
RETU

METHOD CHKPESO(lBUSCA) 
LOCAL cCODIGO AS STRING
LOCAL aPRO AS ARRAY
IF ValType(lBUSCA)#"L"
   lBUSCA:=.T.	
ENDIF	
cCODIGO:=SELF:oDCCPRODUTO:TextValue
IF ! SELF:XCHKPESO(cCODIGO,lBUSCA)
   aPRO:=PEGMP03(cCODIGO,ZCURINI,ZCURDIR) //Tenta SubApl
   IF aPRO[1]=.T. //Encontrou Tratamento
   	  IF ! Empty(Apro[6]) //O Sub Produto Nao esta vazio
      	  IF ! SELF:XCHKPESO(aPRO[6],lBUSCA)
      	  	 aPRO:=PEGMQ01(aPRO[7],ZCURINI,ZCURDIR) //Tenta Subproduto
      	  	 IF aPRO[1]=.T.
                SELF:PESO:=APRO[6]
      	  	 ENDIF	
      	  ENDIF	
      ELSE //sUB pRODUTO eSTA vAZIO
    	 aPRO:=PEGMQ01(aPRO[7],ZCURINI,ZCURDIR) //Tenta Subproduto
      	 IF aPRO[1]=.T.
            SELF:PESO:=APRO[6]
      	 ENDIF	
      ENDIF
   ENDIF	
ENDIF

METHOD CHKPRC() 
LOCAL oPE AS USEREDE
LOCAL nPERCLI AS LONG
LOCAL aDAD AS ARRAY
IF Empty(SELF:oDCPERCLI)
    RETU
ENDIF
nPERCLI:=Val(SELF:oDCPERCLI:TEXTVALUE)
aDAD:={zCURINI,"PEMO.DBF",zCURDIR}
oPE:=USEREDE{aDAD}
IF oPE:nERRO=0
   oPE:GOTOP()
   IF oPE:SEEK(nPERCLI)
   	  DO CASE
   	  	 CASE Empty(oPE:FIELDGET("CODIGO"))
   	  	 	  alert("Sem Codigo do Produto")
         OTHERWISE
             SELF:oDCPEPED:TextValue:="1"
             SELF:oDCPEITE:TextValue:="1"
             SELF:oDCTIPCAD:Value:="C"
             SELF:ODCCLIFOR:TextValue:=Str(oPE:FIELDGET("FORNECEDO"))
             SELF:ODCTIPOE:VALUE:=oPE:FIELDGET("TIPPED")
             SELF:ODCCBUSCA:TextValue:=oPE:FIELDGET("CODIGO")
             SELF:oDCDESCRI:TextValue:=AllTrim(oPE:FIELDGET("NOME"))+AllTrim(oPE:FIELDGET("NOM2"))
             SELF:oDCAPLICACAO:TextValue:=oPE:FIELDGET("APLICACAO")
  	         SELF:COGNOME:=oPE:FIELDGET("COGNOME")
             IF oPE:FIELDGET("TIPPED")="T"
             	SELF:oDCPESONFA:Enable()
             	SELF:oDCPESONFB:Enable()
             ENDIF
             SELF:oDCPEPED:Disable()
             SELF:oDCPEITE:Disable()
             SELF:oDCTIPCAD:Disable()
             SELF:ODCCLIFOR:Disable()
             SELF:ODCTIPOE:Disable()
             SELF:ODCCBUSCA:Disable()
             SELF:oDCPRPED:Disable()
             SELF:oDCPRITE:Disable()
             SELF:ODCPEREQ:Disable()
             SELF:oDCAUT:Disable()
             SELF:oCCCHKPED:Disable()
             SELF:oCCCHKREQ:Disable()
             SELF:oCCCHKPRG:Disable()
             SELF:oCCCHKPRC:Disable()
             SELF:oCClote:Disable()
             SELF:ODCPERCLI:Disable()
             SELF:oCCESCFOR:DISABLE()
      ENDCASE
   ELSE
   	  Ope:close()
      alert("Programação não Encontrada")
      SELF:ZERAVAL()
      RETU
   ENDIF
ENDIF
oPE:Close()
SELF:oDCmDATA:TextValue:=DToC(Today())





METHOD CHKPRG() 
LOCAL oPE01,oPE,oMW02 AS USEREDE
LOCAL nPRPED,nPRITE,nPEPED,nPEITE AS LONG
LOCAL aDAD AS ARRAY
LOCAL lACHEI AS LOGIC
IF Empty(SELF:ODCPRPED)
    RETU
ENDIF
IF Empty(SELF:ODCPRITE)
   RETU
ENDIF
nPRPED:=Val(SELF:oDCPRPED:TEXTVALUE)
nPRITE:=Val(SELF:ODCPRITE:TEXTVALUE)
aDAD:={zCURINI,"PE01.DBF",zCURDIR}
oPE01:=USEREDE{aDAD}
IF oPE01:nERRO=0
   oPE01:GOTOP()
   oPE01:SEEK(Str(nPRPED,5)+Str(nPRITE,2))
   IF oPE01:FOUND
   	IF oPE01:FIELDGET("RECEBER")<>"S"
       SELF:oDCTIPCAD:Value:="F"
       SELF:ODCCLIFOR:TextValue:=Str(oPE01:FIELDGET("CLIENTE"))
       SELF:ODCTIPOE:VALUE:=oPE01:FIELDGET("TIPPED")
       SELF:ODCCBUSCA:TextValue:=oPE01:FIELDGET("CODIGO")
       SELF:ODCQTDEA:TextValue:=Str(oPE01:FIELDGET("TOTKGANT"))
       SELF:ODCQTDEPED:TextValue:=Str(oPE01:FIELDGET("TOTKGANT"))
       SELF:ODCQTDETOT:TextValue:=Str(oPE01:FIELDGET("TOTKGINI"))
       SELF:ODCQTDEANT:TextValue:=Str(oPE01:FIELDGET("TOTKGEST"))
       IF oPE01:FIELDGET("TIPPED")="T"
          SELF:oDCPESONFA:Enable()
          SELF:oDCPESONFB:Enable()
       ENDIF	
       SELF:oDCTIPCAD:Disable()
       SELF:ODCCLIFOR:Disable()
       SELF:ODCTIPOE:Disable()
       SELF:oCCTIPOC:disable()
       SELF:oCCTIPOM:disable()
       SELF:oCCTIPOT:disable()
       SELF:oCCTIPOP:disable()
       SELF:oCCTIPOO:disable()
       SELF:ODCCBUSCA:Disable()
       SELF:oDCPRPED:Disable()
       SELF:oDCPRITE:Disable()
       SELF:ODCPEREQ:Disable()
       SELF:oDCAUT:Disable()
       SELF:oCCCHKPED:Disable()
       SELF:oCCCHKREQ:Disable()
       SELF:oCCCHKPRG:Disable()
       SELF:oCCCHKPRC:Disable()
       SELF:ODCPERCLI:Disable()
       SELF:odcpercli:TextValue:="0"
       SELF:oDCReceber:Value:= .F.
       SELF:oCClote:Disable()
       SELF:oCCESCFOR:DISABLE()
     ELSE
      	oPE01:CLOSE()
        alert("Programação Já Utilizada")
        SELF:ZERAVAL()
       	RETU
     ENDIF
   ELSE
   	  oPE01:CLOSE()
      alert("Programação não Encontrada")
      SELF:ZERAVAL()
      RETU
   ENDIF
   oPE01:CLOSE()
ENDIF
aDAD:={zCURINI,"PE.DBF",zCURDIR}
oPE:=USEREDE{aDAD}
IF oPE:nERRO=0
   oPE:GOTOP()
   IF oPE:SEEK(nPRPED)
   	  DO CASE
   	  	 CASE Empty(oPE:FIELDGET("CODIGO"))
   	  	 	  alert("Sem Codigo do Produto")
   	  	 CASE oPE:FIELDGET("compras")=0
   	  	 	  alert("Sem Numero Pedido de Compras")
         OTHERWISE
             SELF:oDCPEPED:TextValue:=Str(oPE:FIELDGET("COMPRAS"))
             SELF:oDCPEITE:TextValue:=Str(oPE:FIELDGET("COMITEM"))
             SELF:oDCDESCRI:TextValue:=AllTrim(oPE:FIELDGET("NOME"))+AllTrim(oPE:FIELDGET("NOM2"))
             SELF:oDCAPLICACAO:TextValue:=oPE:FIELDGET("APLICACAO")
  	         SELF:COGNOME:=oPE:FIELDGET("COGNOME")
             SELF:oDCPEPED:Disable()
             SELF:oDCPEITE:Disable()
      ENDCASE
   ELSE
      alert("Programação não Encontrada")
      SELF:ZERAVAL()
   ENDIF
ENDIF
oPE:Close()
nPEPED:=Val(SELF:oDCPEPED:TEXTVALUE)
nPEITE:=Val(SELF:ODCPEITE:TEXTVALUE)
lACHEI:=.F.
aDAD:={zCURINI,"MW02.DBF",zCURDIR}
oMW02:=USEREDE{aDAD}
IF oMW02:nERRO=0
   oMW02:GOTOP()
   oMW02:SEEK(Str(nPEPED,8)+Str(nPEITE,3))
   IF oMW02:FOUND
      lACHEI:=.T.
        SELF:ODCPRECOPR:TextValue:=Str(oMW02:FIELDGET("ITEPRC"))
        SELF:IPI:=oMW02:FIELDGET("ITEIPI")
        SELF:oDCITEUNI:TextValue:=oMW02:FIELDGET("ITEUNI")
        SELF:oDCPEDCLI:TextValue:=oMW02:FIELDGET("PEDCLI")
        IF oMW02:FIELDGET("PEDCLI")="S"
           SELF:oDCReceber:Value:= .T.
        ENDIF
   ENDIF
   oMW02:CLOSE()
ENDIF
IF ! lACHEI //Tenta Baixados
   aDAD:={zCURINI,"MW02BX.DBF",zCURDIR}
   oMW02:=USEREDE{aDAD}
   IF oMW02:nERRO=0
      oMW02:GOTOP()
      oMW02:SEEK(Str(nPEPED,8)+Str(nPEITE,3))
      IF oMW02:FOUND
         SELF:ODCPRECOPR:TextValue:=Str(oMW02:FIELDGET("ITEPRC"))
         SELF:IPI:=oMW02:FIELDGET("ITEIPI")
         SELF:oDCITEUNI:TextValue:=oMW02:FIELDGET("ITEUNI")
         SELF:oDCPEDCLI:TextValue:=oMW02:FIELDGET("PEDCLI")
         IF oMW02:FIELDGET("PEDCLI")="S"
            SELF:oDCReceber:Value:= .T.
         ENDIF	
      ENDIF	
      oMW02:CLOSE()
   ENDIF
ENDIF	
SELF:PEGCPAG()
SELF:oDCmDATA:TextValue:=DToC(Today())
SELF:CHKCTR(nPEPED,nPEITE)

METHOD ChkRasFEC() 	
LOCAL ARETU AS ARRAY	
LOCAL oJAN AS JMESANO
oJAN:=JMESANO{SELF}
oJAN:SHOW()
aRETU:=XChkRastro(SELF,"M2"+oJAN:cCOMP,SELF:TIPOE,SELF:CBUSCA)
IF aRETU[1]
   SELF:SERVER:cRASTRO:=aRETU[2]
ENDIF	


METHOD ChkRastro  
LOCAL aRETU AS ARRAY	
aRETU:=XChkRastro(SELF,"MM02",SELF:TIPOE,SELF:CBUSCA)	
IF aRETU[1]
	SELF:SERVER:cRASTRO:=aRETU[2]
ENDIF	

METHOD CHKREQ() 
LOCAL oMY04,oMW02 AS USEREDE
LOCAL nPEREQ,nPEPED,nPEITE AS DWORD
LOCAL aDAD AS ARRAY
LOCAL lACHEI AS LOGIC


IF Empty(SELF:ODCPEREQ)
   RETU
ENDIF
nPEREQ:=Val(SELF:oDCPEREQ:TEXTVALUE)
aDAD:={zCURINI,"MY04.DBF",zCURDIR}
oMY04:=USEREDE{aDAD}
IF oMY04:nERRO=0
   oMY04:GOTOP()
   oMY04:SEEK(nPEREQ)
   IF oMY04:FOUND
      SELF:oDClLOTE:Enable()
      SELF:oDCTIPCAD:Value:="F"
      SELF:ODCCLIFOR:TextValue:=Str(oMY04:FIELDGET("NUMMB01"))
      SELF:ODCTIPOE:VALUE:=oMY04:FIELDGET("TIPO2")
      SELF:ODCCBUSCA:TextValue:=oMY04:FIELDGET("CODIGO")
      SELF:ODCQTDEA:TextValue:=Str(oMY04:FIELDGET("QTDE"))
      SELF:ODCQTDEPED:TextValue:=Str(oMY04:FIELDGET("QTDE"))
      SELF:ODCNRNOTA:TextValue:=Str(oMY04:FIELDGET("NRNOTA"))
      SELF:oDCPEPED:TextValue:=Str(oMY04:FIELDGET("OS"))
      SELF:oDCPEITE:TextValue:=Str(oMY04:FIELDGET("ITEM"))
      SELF:oDCPRECOPR:TextValue:=Str(oMY04:FIELDGET("PRCMW02"))
      SELF:oDCPRECO:TextValue:=Str(oMY04:FIELDGET("PRCMy04"))
      SELF:oDCmDATA:Value:=oMY04:FIELDGET("data")
      SELF:oDCAUT:TEXTVALUE:=Str(oMY04:FIELDGET("AUT"))
      SELF:oDCTIPCAD:Disable()
      SELF:ODCCLIFOR:Disable()
      IF SELF:ODCTIPOE:VALUE="X"
         SELF:oCCpegcod1:Enable()
         SELF:oCCesccod2:Enable()
         SELF:oCCpegcod:Enable()
         SELF:oCCesccod:Enable()
         SELF:oDCcodavu:enable()
      ENDIF	
      IF SELF:ODCTIPOE:VALUE<>"X"
	     SELF:ODCTIPOE:Disable()
    	 SELF:ODCCBUSCA:Disable()
      ENDIF
      IF SELF:ODCTIPOE:VALUE="T"
         SELF:oDCPESONFA:Enable()
         SELF:oDCPESONFB:Enable()
      ENDIF
      SELF:ODCNRNOTA:Disable()
      SELF:oDCPRPED:Disable()
      SELF:oDCPRITE:Disable()
      SELF:oDCPEPED:Disable()
      SELF:oDCPEITE:Disable()
      SELF:ODCPEREQ:Disable()
      SELF:oDCAUT:Disable()
      SELF:oCCCHKPRC:Disable()
      SELF:oCCCHKPED:Disable()
      SELF:oCCCHKREQ:Disable()
      SELF:oCCCHKPRG:Disable()
      SELF:oCCESCFOR:Disable()
      SELF:ODCPERCLI:Disable()
      SELF:oDCPRECO:Disable()
      SELF:odcpercli:TextValue:="0"
      SELF:oDCReceber:Value:= .T.
      IF Omy04:FIELDGET("AUT")>0
         SELF:oDCReceber:Value:= .T.
         SELF:oDCREQAUT:Value:= .T.
      ENDIF	
      SELF:oDCReceber:Value:=.T.
  ELSE
 	  oMy04:CLOSE()
      alert("Requisiçao não Encontrada")
 	  SELF:ZERAVAL()
 	  RETU
   ENDIF
   oMY04:CLOSE()
ENDIF


nPEPED:=Val(SELF:oDCPEPED:TEXTVALUE)
nPEITE:=Val(SELF:ODCPEITE:TEXTVALUE)
lACHEI:=.F.
aDAD:={zCURINI,"MW02.DBF",zCURDIR}
oMW02:=USEREDE{aDAD}
IF oMW02:nERRO=0
   oMW02:GOTOP()
   oMW02:SEEK(Str(nPEPED,8)+Str(nPEITE,3))
   IF oMW02:FOUND
      lACHEI:=.T.
        SELF:oDCDESCRI:TextValue:=AllTrim(oMW02:FIELDGET("ITENOM"))+AllTrim(oMW02:FIELDGET("ITENO2"))
        SELF:oDCITEUNI:TextValue:=oMW02:FIELDGET("ITEUNI")
        SELF:IPI:=oMW02:FIELDGET("ITEIPI")
   ENDIF
   oMW02:CLOSE()
ENDIF
IF ! lACHEI //Tenta Baixados
   aDAD:={zCURINI,"MW02BX.DBF",zCURDIR}
   oMW02:=USEREDE{aDAD}
   IF oMW02:nERRO=0
      oMW02:GOTOP()
      oMW02:SEEK(Str(nPEPED,8)+Str(nPEITE,3))
      IF oMW02:FOUND
         SELF:oDCDESCRI:TextValue:=AllTrim(oMW02:FIELDGET("ITENOM"))+AllTrim(oMW02:FIELDGET("ITENO2"))
         SELF:oDCITEUNI:TextValue:=oMW02:FIELDGET("ITEUNI")
         SELF:IPI:=oMW02:FIELDGET("ITEIPI")
      ENDIF	
      oMW02:CLOSE()
   ENDIF
ENDIF	
aDAD:=PEGMB01(Val(SELF:oDCCLIFOR:TextValUE),ZCURINI,ZCURDIR)
IF aDAD[1]
   SELF:COGNOME:=aDAD[3]	
ENDIF	
SELF:PEGCPAG()
SELF:oDCmDATA:TextValue:=DToC(Today())




METHOD cmdALT( ) 
		SELF:cmdzera()	
		SELF:TIPCOD:="A"		


METHOD cmdAR( ) 
		SELF:cmdzera()	
		SELF:TIPCOD:="AR"


METHOD cmdb( ) 
		SELF:cmdzera()	
		SELF:TIPCOD:="B"		


METHOD cmdcrm( ) 
		SELF:cmdzera()	
		SELF:TIPCOD:=""


METHOD cmddev( ) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD,aCLI,Apro AS ARRAY
LOCAL nCRM AS DWORD
LOCAL cPEDIDO,cNOME,cCOGNOME AS STRING
aDAD:={zCURINI,"CRMDEV.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF

DO CASE
   CASE SELF:ODCTIPOE:Value=="C"
        aPRO:=PEGMT01(Trim(SELF:ODCCBUSCA:TextValue),zcurini,zcurdir)
        IF aPRO[1]=.F.
           alert("Componente Não Cadastrado")
       	  RETU NIL
        ENDIF
   CASE SELF:ODCTIPOE:Value=="M"
        aPRO:=PEGMU01(Trim(SELF:ODCCBUSCA:TextValue),zcurini,zcurdir)
        IF aPRO[1]=.F.
           alert("Materia Prima Não Cadastrada")
           RETU NIL
        ENDIF
   CASE SELF:ODCTIPOE:Value=="T"
        aPRO:=PEGMP03(Trim(SELF:ODCCPRODUTO:TextValue),zCURINI,zCURDIR)
        IF aPRO[1]=.F.
           alert("Tratamento Não Cadastrado")
           RETU NIL
        ENDIF
   CASE SELF:ODCTIPOE:Value=="P"
        aPRO:=PEGMS01(Trim(SELF:ODCCBUSCA:TextValue))
        IF aPRO[1]=.F.
           alert("Produto não Cadastrado")
           RETU NIL
        ENDIF
   CASE SELF:ODCTIPOE:Value=="X"
        aPRO:={.T.,"","","KG",""}
   OTHERWISE
        alert("Tipo Não Preenchido")
        RETU NIL
ENDCASE


DO CASE
 CASE SELF:ODCTIPCAD:Value=="C"
        aCLI:=PEGMA01(Val(SELF:ODCCLIFOR:TextValue),zCURINI,zCURDIR)
        IF aCLI[1]=.T.
	        cNOME:=aCLI[2]
	        cCOGNOME:=aCLI[3]
        ELSE
           alert("Cliente  Não Cadastrado")
           RETU NIL
        ENDIF
   CASE SELF:ODCTIPCAD:Value=="F"
        aCLI:=PEGMB01(Val(SELF:ODCCLIFOR:TextValue),zCURINI,zCURDIR)
        IF aCLI[1]=.T.
           cNOME:=aCLI[2]
           cCOGNOME:=aCLI[3]
        ELSE
           alert("Fornecedor  Não Cadastrado")
           RETU NIL
        ENDIF
ENDCASE

cPEDIDO:=StrTRIM(Val(SELF:ODCPEPED:TextValue),8,0)+"/"+StrTRIM(Val(SELF:ODCPEITE:TextValue),3,0)
	
oSERVER:setorder(1)
oSERVER:gobottom()
nCRM:=oSERVER:FIELDGET("CRM")
nCRM++
oSERVER:APPEND()
oSERVER:FIELDPUT("CRM",nCRM)
oSERVER:FIELDPUT("DATA",Today())
oSERVER:FIELDPUT("DESCRI",aPRO[2])
oSERVER:FIELDPUT("APLICACAO",aPRO[3])
oSERVER:FIELDPUT("CBUSCA",Trim(SELF:ODCCBUSCA:TextValue))
oSERVER:FIELDPUT("NOMEF",cNOME)
oSERVER:FIELDPUT("COGNOME",cCOGNOME)
oSERVER:FIELDPUT("CLIFOR",Val(SELF:ODCCLIFOR:TextValue))
oSERVER:FIELDPUT("TIPOE",SELF:ODCTIPOE:Value)
oSERVER:FIELDPUT("TIPCAD",SELF:ODCTIPCAD:Value)
oSERVER:FIELDPUT("QTDE",Val(SELF:ODCQTDEA:TextValue)+Val(SELF:ODCQTDEB:TextValue))
oSERVER:FIELDPUT("QTDEA",Val(SELF:ODCQTDEA:TextValue))
oSERVER:FIELDPUT("QTDEB",Val(SELF:ODCQTDEB:TextValue))
oSERVER:FIELDPUT("QTDEPED",Val(SELF:ODCQTDEPED:TextValue))
oSERVER:FIELDPUT("PRPED",Val(SELF:ODCPRPED:TextValue))
oSERVER:FIELDPUT("PRITE",Val(SELF:ODCPRITE:TextValue))
oSERVER:FIELDPUT("CERT",SELF:ODCCCERT:TextValue)
oSERVER:FIELDPUT("NRNOTA",Val(SELF:oDCNRNOTA:TextValue))
oSERVER:FIELDPUT("NRNOTB",Val(SELF:oDCNRNOTB:TextValue))
oSERVER:FIELDPUT("PEPED",Val(SELF:ODCPEPED:TextValue))
oSERVER:FIELDPUT("PEITE",Val(SELF:ODCPEITE:TextValue))
oSERVER:FIELDPUT("PEDIDO",cPEDIDO)
oSERVER:FIELDPUT("PEREQ",Val(SELF:ODCPEREQ:TextValue))
oSERVER:FIELDPUT("OBS",SELF:oDCOBS:TextValue)
oSERVER:FIELDPUT("TECNICO",ZFOLHA)
oSERVER:FIELDPUT("AUT",Val(SELF:ODCAUT:TextValue))
oSERVER:FIELDPUT("RASTRO",SELF:oDCcRASTRO:TextValue)
oSERVER:FIELDPUT("PRECO",Val(SELF:ODCPRECO:TextValue))
oSERVER:FIELDPUT("PRECOPR",Val(SELF:ODCPRECOPR:TextValue))
oSERVER:FIELDPUT("CLOTECRT","D")		//lOTE D DEVOLUCAO
oSERVER:FIELDPUT("PRCLI",Val(SELF:oDCPERCLI:TextValue))
IF SELF:TIPOE=="T"
    oSERVER:FIELDPUT("PRODUTO",Trim(SELF:ODCCPRODUTO:TextValue))
ENDIF
oSERVER:FIELDPUT("USERNM",ZUSER)
oSERVER:FIELDPUT("USERDT",Today())
oSERVER:FIELDPUT("USERHT",Time())
oSERVER:FIELDPUT("NRDATA",CToD(SELF:oDCmDATA:TextValue))
oSERVER:FIELDPUT("UNID","KG")
oSERVER:FIELDPUT("PESONFA",Val(SELF:ODCPESONFA:TextValue))
oSERVER:FIELDPUT("PESONFB",Val(SELF:ODCPESONFB:TextValue))
oSERVER:FIELDPUT("PEDCLI",SELF:oDCPEDCLI:TextValue)
oSERVER:FIELDPUT("ENTREGA",CToD(SELF:oDCentrega:TextValue))
oSERVER:FIELDPUT("ENTREG2",CToD(SELF:oDCentreg2:TextValue))
IF SELF:oDCtriangular:Value
   oSERVER:FIELDPUT("TRIANGULAR","S")	
ENDIF	
oSERVER:Commit()
GRAVALOG(NCRM,"INC","CRMDEV")	
alert("Devolucao Lancada")


METHOD cmdgera( ) 
SELF:cRASTRO:=CRIARASTRO(SELF:TIPCOD,SELF:RASTRONUM,SELF:RASTROANO,SELF:RASTROITEM)

METHOD cmdGERAAUT( ) 
LOCAL cMOTIVO,cMOTIV2 AS STRING
LOCAL oAUT AS USEREDE
LOCAL aDAD AS  ARRAY
LOCAL nAUT AS DWORD
cMOTIVO:="NF: "+AllTrim(Str(SELF:NRNOTA,8))+" de "+SELF:odcentrega:TextValue
IF ! IsNil(SELF:NRNOTB)
   IF SELF:NRNOTB>0
      cMOTIVO:=cMOTIVO+" NF: "+AllTrim(Str(SELF:NRNOTB,8))+" de "+SELF:odcentreg2:TextValue
   ENDIF
ENDIF	
cMOTIVO:=cMOTIVO+" "+AllTrim(Str(SELF:CLIFOR,8))+"-"+AllTrim(SELF:COGNOME)
IF Val(SELF:oDCPRECO:TextValue)>Val(SELF:oDCPRECOPR:TextValue)	
   cMOTIVO:=cMOTIVO+" Preco a Maior"	
ELSE
   cMOTIVO:=cMOTIVO+" Preco a Menor"		
ENDIF	
cMOTIV2:="Pedido: "+AllTrim(Str(SELF:PEPED,8))+"/"+AllTrim(Str(SELF:PEite,3))
cMOTIV2+=" R$ "+AllTrim(Str(SELF:precoPR,15,6))+" Faturado R$ "+AllTrim(Str(SELF:Preco,15,6))
//alert(Cmotiv2)
aDAD:={zCURINI,"AUT.DBF",zCURDIR}
oAUT:=USEREDE{aDAD}
IF oAUT:nERRO#0
   RETU
ENDIF
oAUT:GoBottom()
nAUT:=oAUT:FIELDGET("AUT")
nAUT:=nAUT+1
oAUT:Append()
oAUT:FIELDPUT("AUT",nAUT)
oAUT:FIELDPUT("MOTIVO",cMOTIVO)
oAUT:FIELDPUT("MOTIV2",cMOTIV2)
oAUT:FIELDPUT("DATA",Today())
oAUT:FIELDPUT("LIBFISCAL","N")
oAUT:CLOSE()
SELF:AUT:=nAUT
	




	

METHOD cmdmais2( ) 
SELF:oDCRASTROANO:TextValue:=Str(INCDEC(SELF:oDCRASTROANO:TextValue,1,1900,2100),4)						

METHOD cmdmenos2( ) 
SELF:oDCRASTROANO:TextValue:=Str(INCDEC(SELF:oDCRASTROANO:TextValue,-1,1900,2100),4)						

METHOD cmdmO( ) 
	SELF:cmdzera()
    SELF:TIPCOD:="MO"

METHOD cmdso( ) 
	SELF:cmdzera()
		SELF:TIPCOD:="SO"


METHOD cmdtrapro( ) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF SELF:ODCTIPOE:Value<>"T"
   alert("Não é Tratamento/Serviços")	
   RETU
ENDIF		
aDAD:={zCURINI,"MP03.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
oSERVER:GOTOP()
IF oSERVER:SEEK(AllTrim(SELF:oDCCPRODUTO:TextValue))
   SELF:oDCCBUSCA:TEXTVALUE:=oSERVER:FIELDGET("NORMA")
   SELF:oCCcmdtrapro:Disable()
   SELF:oDCCPRODUTO:Disable()
   SELF:oDCCBUSCA:DISABLE()
   SELF:bloqCOD()
ENDIF
oSERVER:CLOSE()	

	

METHOD cmdzera( ) 
		SELF:TIPCOD:=""
		SELF:RASTRONUM:=0
		SELF:cRASTRO:=""

METHOD desbloqCOD( ) 
SELF:oDCCBUSCA:Enable()
SELF:oDCTIPOE:Enable()
SELF:oCCTIPOC:Enable()
SELF:oCCTIPOM:Enable()
SELF:oCCTIPOT:Enable()
SELF:oCCTIPOO:Enable()
SELF:oCCTIPOP:Enable()
SELF:oCCpegcod1:Enable()
SELF:oCCesccod2:Enable()
SELF:oCCescPRO1:Enable()
SELF:oDCcodavu:Enable()
SELF:oCCCMDTRAPRO:Enable()
SELF:oCCpegcod:Enable()
SELF:oCCesccod:Enable()


METHOD digapl( ) 
LOCAL oBUSCA AS xBUSCA
IF ! Empty(SELF:APLICACAO)
   RETU
ENDIF
oBUSCA:=xBUSCA{SELF,"Digitar","Digite o Codigo"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   SELF:APLICACAO:=oBUSCA:cBUSCA
ENDIF

METHOD digcod1( ) 
LOCAL oESC AS XESCCOD	
IF ! Empty(SELF:APLICACAO)
   RETU
ENDIF
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF Oesc:lok
   SELF:APLICACAO:=oESC:CODIGO
ENDIF	
	

METHOD digdes( ) 
LOCAL oBUSCA AS xBUSCA
IF ! Empty(SELF:DESCRI)
   RETU
ENDIF
oBUSCA:=xBUSCA{SELF,"Digitar","Digite a descricao"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   SELF:DESCRI:=oBUSCA:cBUSCA
ENDIF	

METHOD esccod( ) 
LOCAL oESC AS XESCCOD	
LOCAL Ctipo AS STRING
cTIPO:=SELF:TIPOE
IF Empty(cTIPO)
   alert("Tipo Nao Preenchido")
   RETU
ENDIF	
DO CASE
	CASE CtipO="M"
       oESC:=XESCCOD{SELF,"MU01.DBF"}		
	CASE Ctipo="C"
       oESC:=XESCCOD{SELF,"MT01.DBF"}		
	CASE Ctipo="T"
       oESC:=XESCCOD{SELF,"MP03.DBF"}		
	CASE Ctipo="P"
       oESC:=XESCCOD{SELF,"MS01.DBF"}
ENDCASE
oESC:SHOW()	
IF Oesc:lok
	SELF:CBUSCA:=oESC:CODIGO
    SELF:pegcod()
ENDIF				

METHOD esccod2( ) 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"CRMCESP.DBF"}
oESC:SHOW()	
IF Oesc:lok
    SELF:CODAVU:=OESC:NUMERO
ENDIF
SELF:pegcod1()
		

METHOD escfor( ) 
LOCAL oESC AS XESCNUM	
IF SELF:oDCTIPCAD:Value="F" .OR. SELF:oDCTIPCAD:Value="C"
	IF SELF:oDCTIPCAD:Value="F"
	   oESC:=XESCNUM{SELF,"MB01.DBF"}
	ELSE
	   oESC:=XESCNUM{SELF,"MA01.DBF"}
	ENDIF
	oESC:SHOW()	
	IF Oesc:lok
	    SELF:ODCCLIFOR:TextValue:=Str(oESC:NUMERO)
	ENDIF
ENDIF

METHOD escped() 
LOCAL oJAN AS Xescmw02
oJAN:=Xescmw02{SELF,ZCURINI,ZCURDIR,"ITETIP='T'"}
oJAN:SHOW()
IF oJAN:lOK
   SELF:oDCPePED:TextValue:=Str(oJAN:NUMERO,8)	
   SELF:oDCPEITE:TextValue:=Str(Ojan:ITEM,3)
   SELF:CHKPED()
ENDIF	

METHOD escpemo( ) 
LOCAL oJAN AS Xescpemo
oJAN:=XescPEMO{SELF,ZCURINI,ZCURDIR,"PEMO"}
oJAN:SHOW()
IF oJAN:lOK
   SELF:oDCPeRCLI:TextValue:=Str(oJAN:NPEDIDO,8)	
   SELF:CHKPRC()
ENDIF		

METHOD escprg() 
LOCAL oJAN AS XPEDIA
LOCAL oPE01 AS USEREDE
LOCAL aDAD AS ARRAY
oJAN:=XPEDIA{SELF,ZCURINI,ZCURDIR}
oJAN:SHOW()
IF oJAN:lOK
   SELF:oDCPRPED:TextValue:=Str(oJAN:NUMERO,8)	
   aDAD:={zCURINI,"PE01.DBF",zCURDIR}
   oPE01:=USEREDE{aDAD}
   IF oPE01:nERRO=0
      oPE01:GOTOP()
      oPE01:SEEK(Str(oJAN:NUMERO,5))
      IF oPE01:FIELDGET("PEDIDO")=oJAN:NUMERO .AND. ! oPE01:EoF
      	 SELF:oDCPRITE:TEXTVALUE:=Str(oPE01:FIELDGET("ITEM"),3)
      ENDIF
      oPE01:CLOSE()	
      SELF:CHKPRG()
   ENDIF
ENDIF	

METHOD ESCPRO( ) 
LOCAL oESC AS XESCCOD	
IF ! Empty(SELF:ODCCPRODUTO:TextValue)
   alert("Codigo Já Preencido")	
   RETU
ENDIF	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF Oesc:lok
	SELF:oDCCPRODUTO:TextValue:=Oesc:codigo
ENDIF					

METHOD ESCPRO1( ) 
LOCAL oESC AS XESCCOD	
IF SELF:ODCTIPOE:Value<>"T"
   alert("Não é Tratamento/Serviços")	
   RETU
ENDIF		
IF ! Empty(SELF:oDCCBUSCA:TextValue)
   alert("Codigo Já Preencido")	
   RETU
ENDIF	
oESC:=XESCCOD{SELF,"ETI.DBF"}
oESC:SHOW()	
IF Oesc:lok
	SELF:oDCCBUSCA:TextValue:=OESC:CODIGO
ENDIF					

METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:oDCCPRODUTO:TextValue)," ",""))
IF Empty(cCODIGO)	
   cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:oDCCBUSCA:TextValue)," ",""))	
ENDIF	
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETU
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG"}
OFOTOVIEW:SHOW()
	

METHOD imprimir1( ) 
SELF:XWRPTGRP("CRM","PEMW")		


METHOD INCLUIR 
LOCAL d01,d02 AS DATE
LOCAL nPESO AS FLOAT
LOCAL lAR AS LOGIC
lAR:=Val(SELF:ODCAr:TextValue)>0				
nPESO:=Val(SELF:oDCQTDEA:TextValue)+Val(SELF:oDCQTDEB:TextValue)
lOK:= .T.
aUSO:={}
IF Left(SELF:oDCCBUSCA:TextValue,2)="**"
   alert("Item com ** Verificar Pedido Compras/Programa")	
   RETU	
ENDIF	
IF SELF:ODCTIPOE:Value="T"
  IF Val(SELF:oDCQTDEA:TextValue)=0
     alert("Tratamento/Serviços Requer QTDE")	
     SELF:oDCQTDEA:SetFocus()
     RETU
  ENDIF	
  IF Val(SELF:oDCPESONFA:TextValue)=0
     alert("Tratamento/Serviços Requer Peso")	
     SELF:oDCPESONFA:SetFocus()
     RETU
  ENDIF	
  IF Val(SELF:oDCQTDEB:TextValue)=0 .AND. Val(SELF:oDCPESONFB:TextValue)>0
     alert("Tratamento/Serviços Requer QTDE")	
     SELF:oDCQTDEB:SetFocus()
     RETU
  ENDIF	
  IF Val(SELF:oDCQTDEB:TextValue)>0 .AND. Val(SELF:oDCPESONFB:TextValue)=0
     alert("Tratamento/Serviços Requer Peso")	
     SELF:oDCPESONFB:SetFocus()
     RETU
  ENDIF	
ENDIF	
IF SELF:ODCTIPOE:Value="T" .and. Empty(SELF:oDCcRASTRO:TextValue)
   alert("Tratamento/Serviços Requer Rastreabilidade")	
   SELF:oDCcRASTRO:SetFocus()
   RETU
ENDIF
IF SELF:ODCTIPOE:Value<>"T" .and. ! Empty(SELF:oDCcRASTRO:TextValue)
   IF ! MDG("Aceitar Lote Indicado-->"+SELF:oDCcRASTRO:TextValue)
   	  RETU
   ENDIF	
ENDIF	
IF Val(SELF:oDCPEPED:TextValue)=0 .AND. Val(SELF:ODCAUT:TextValue)=0 .and. ! LAR
   alert("Sem Numero de Pedido","Erro")
   alert("Requer Autorização","Erro")
   SELF:oDCAUT:ENABLE()
   RETU
ENDIF
IF Val(SELF:oDCNRNOTA:TextValue)<>0 .and. Empty(SELF:odcentrega)
   alert("Falta data Entrega NrNota","Erro")
   RETU
ENDIF	
IF Val(SELF:oDCNRNOTB:TextValue)<>0 .and. Empty(SELF:odcentreg2)
   alert("Falta data Entrega NrNota-2","Erro")
   RETU
ENDIF
IF ! Empty(SELF:odcentregA) .AND. ! Empty(SELF:oDCmDATA)
   d01:=CToD(SELF:oDCMDATA:TextValue)
   d02:=CToD(SELF:oDCENTREGA:TextValue)
   IF Abs(D01-D02)>10
   	  IF ! MDG("Datas NF1-Entrega <>10 Dias - Continuar?")
   	  	  RETU
   	  ENDIF	
   ENDIF	
ENDIF	
IF ! Empty(SELF:odcentreg2) .AND. ! Empty(SELF:oDCmDATA)
   d01:=CToD(SELF:oDCMDATA:TextValue)
   d02:=CToD(SELF:oDCENTREG2:TextValue)
   IF Abs(D01-D02)>10
   	  IF ! MDG("Datas NF2-Entrega <> 10 Dias - Continuar?")
   	  	  RETU
   	  ENDIF	
   ENDIF	
ENDIF	
IF Val(SELF:oDCNRNOTA:TextValue)=0 .AND. Val(SELF:oDCNRNOTB:TextValue)=0
   alert("Necessário Numero de Nota Fiscal","Erro")
   SELF:oDCNRNOTA:SetFocus()
   RETU
ENDIF
IF Val(SELF:oDCQTDEA:TextValue)=0 .AND. Val(SELF:oDCQTDEB:TextValue)=0
   alert("Necessário Quantidade","Erro")
   SELF:oDCQTDEA:SetFocus()
   RETU
ENDIF
IF nPESO>Val(SELF:oDCQTDEPED:TextValue)*1.1 .and. (SELF:oDCCARGA:Value)<>.T. .and. Val(SELF:ODCAUT:TextValue)=0 .and. ! LAR
   alert("Carga Excessiva Requer Autorizaçäo","Erro")
   IF SELF:ODCTIPOE:Value="T"
      SELF:oDCCarga:Enable()
      SELF:ODCQTDEA:Disable()
      SELF:ODCQTDEB:Disable()
   ENDIF
   IF nPESO+Val(SELF:oDCQTDEANT:TextValue)<Val(SELF:oDCQTDETOT:TextValue)*1.1
      SELF:oDCCarga:Enable()
      SELF:ODCQTDEA:Disable()
      SELF:ODCQTDEB:Disable()
   ENDIF	
   IF Val(SELF:oDCPRPED:TEXTVALUE)>0 //Programacao Libera carga Excessiva
      SELF:oDCCarga:Enable()
   ENDIF	
   IF Val(SELF:oDCPERCLI:TEXTVALUE)>0 //Programcao Clinte Libera Carga Excessiva
      SELF:oDCCarga:Enable()
   ENDIF	
   SELF:oDCQTDEA:SetFocus()
   SELF:oDCAUT:ENABLE()
   RETU
ENDIF
IF nPESO<Val(SELF:oDCQTDEPED:TextValue)*.9 .and. (SELF:oDCCARGA:Value)<>.T.	
   alert("Carga Inferior Requer Autorizaçäo","Erro")
   SELF:oDCCarga:Enable()
   SELF:oDCAUT:ENABLE()
   SELF:ODCQTDEA:Disable()
   SELF:ODCQTDEB:Disable()
   SELF:oDCQTDEA:SetFocus()
   RETU
ENDIF
IF Val(SELF:oDCPRECO:TextValue)=0
   alert("Necessário Preço","Erro")
   SELF:ODCPRECO:SetFocus()
   RETU
ENDIF
IF Val(SELF:oDCCLIFOR:TextValue)=0
   alert("Necessário Numero Cliente/Fornecedor","Erro")
   SELF:ODCCLIFOR:SetFocus()
   RETU
ENDIF
IF Empty(SELF:oDCtipcad:TextValue)
   alert("Necessário Tipo Cliente/Fornecedor","Erro")
   RETU
ENDIF
IF Empty(SELF:oDCtipoe:TextValue)
   alert("Necessário Tipo de Entrada","Erro")
   RETU
ENDIF
IF Val(SELF:oDCPRECOPR:TextValue)=0 .AND. Val(SELF:ODCAUT:TextValue)=0 .AND. Val(SELF:oDCPERCLI:TEXTVALUE)=0
   alert("Sem Preço Compras Verifique Pedido","Erro")
   alert("Ou Numero de Autorização","Erro")
   SELF:OCCCMDGERAAUT:Enable()
   SELF:OCCCMDGERAAUT:SetFocus()
   SELF:oDCAUT:ENABLE()
   RETU
ENDIF
IF (Val(SELF:oDCPRECO:TextValue)<>Val(SELF:oDCPRECOPR:TextValue)) ;
    .and. Val(SELF:ODCAUT:TextValue)=0 ;
    .and. (SELF:oDCReceber:Value)<>.T.;
    .and. (SELF:oDCtriangular:Value)<>.T.;
    .and. Val(SELF:oDCPERCLI:TEXTVALUE)=0
   alert("Preço Diferente do Pedido","Erro")
   alert("Verifique o Preço"+Chr(13)+Chr(10)+"Nº Autorizacao"+Chr(13)+Chr(10)+"Triangular")
   SELF:OCCCMDGERAAUT:Enable()
   SELF:OCCCMDGERAAUT:SetFocus()
   SELF:oDCAUT:ENABLE()
   RETU
ENDIF
IF SELF:oDClLOTE:Value=.T. .AND. Empty(SELF:oDCAPLICACAO:TextValue) .AND. Empty(SELF:oDCDESCRI:TextValue)
   alert("Lote Piloto Requer Aplicaçao e Descriçao DO Material")
   SELF:lote( )
   RETU
ENDIF
IF SELF:oDCEnsaios:Value=.T. .AND. Empty(SELF:oDCAPLICACAO:TextValue) .AND. Empty(SELF:oDCDESCRI:TextValue)
   alert("Ensaios Avulsos Requer Aplicaçao e Descriçao DO Material")
   SELF:lote( )
   RETU
ENDIF
IF SELF:oDCEnsaios:Value=.T. .and. SELF:oDClLOTE:Value=.T.
   alert("Escolha Ensaios ou Lote Piloto")
   RETU	
ENDIF	
IF SELF:oDClLOTE:Value=.T.
   IF SELF:oDCTIPOE:Value $ "TCM"
   	  NOP	
   ELSE	
      alert("Lote Piloto Requer Tipo Entrada M,C,T")
     RETU
   ENDIF
ENDIF
IF SELF:oDCEnsaios:Value=.T.
   IF SELF:oDCTIPOE:Value $ "TCM"
   	  NOP	
   ELSE		
     alert("Ensaios Avulsos Requer Tipo Entrada M,C,T")
     RETU
   ENDIF
ENDIF

AltD()
IF SELF:oDCTIPOE:Value $ "TCM"
   IF .NOT. checkens(SELF:ODCTIPOE:VALUE,SELF:oDCCBUSCA:TEXTVALUE)	
      RETU
   ENDIF
ENDIF

//ERRORBOX("oK","OK")
//RETU

AAdd(aUSO,SELF:ODCTIPCAD:Value)				  //01
AAdd(aUSO,Val(SELF:ODCCLIFOR:TextValue))    //02
AAdd(aUSO,Val(SELF:ODCPRPED:TextValue))     //03
AAdd(aUSO,Val(SELF:ODCPRITE:TextValue))     //04
AAdd(aUSO,Val(SELF:ODCQTDEA:TextValue))      //05
AAdd(aUSO,SELF:ODCTIPOE:Value)              //06
AAdd(aUSO,Trim(SELF:ODCCBUSCA:TextValue))   //07
AAdd(aUSO,Trim(SELF:ODCCPRODUTO:TextValue)) //08
AAdd(aUSO,SELF:ODCCCERT:TextValue)          //09
AAdd(Auso,SELF:oDClLOTE:Value)              //10
AAdd(Auso,SELF:oDCOBS:TextValue)            //11
AAdd(aUSO,Val(SELF:oDCNRNOTA:TextValue))    //12
AAdd(aUSO,Val(SELF:ODCPEPED:TextValue))     //13
AAdd(aUSO,Val(SELF:ODCPEITE:TextValue))     //14
AAdd(aUSO,Val(SELF:ODCPEREQ:TextValue))     //15
AAdd(aUSO,Val(SELF:ODCAUT:TextValue))       //16
AAdd(aUSO,CToD(SELF:oDCmDATA:TextValue))    //17
AAdd(aUSO,SELF:oDCcRASTRO:TextValue)        //18
AAdd(aUSO,Val(SELF:oDCNRNOTB:TextValue))    //19
AAdd(aUSO,Val(SELF:ODCQTDEB:TextValue))     //20
AAdd(aUSO,Val(SELF:ODCPRECO:TextValue))     //21
AAdd(aUSO,Val(SELF:ODCPRECOPR:TextValue))     //22
AAdd(aUSO,Val(SELF:oDCDESCRI:TextValue))     //23
AAdd(aUSO,Val(SELF:oDCAPLICACAO:TextValue))     //24
AAdd(aUSO,Val(SELF:oDCPERCLI:TextValue)) //25
AAdd(aUSO,Val(SELF:ODCQTDEPED:TextValue))     //26
AAdd(Auso,SELF:oDCEnsaios:Value) //27
AAdd(aUSO,SELF:oDCREQAUT:Value)//28
AAdd(aUSO,Val(SELF:ODCPESONFA:TextValue))     //29
AAdd(aUSO,Val(SELF:ODCPESONFB:TextValue))     //30
AAdd(Auso,SELF:oDCPEDCLI:TextValue)            //31
AAdd(aUSO,CToD(SELF:oDCentrega:TextValue))    //32
AAdd(aUSO,CToD(SELF:oDCentreg2:TextValue))    //33
AAdd(aUSO,SELF:oDCtriangular:Value)//34
SELF:EndWindow()

METHOD lote( ) 
	SELF:oDClLOTE:Value:=.T.
	SELF:oDCAPLICACAO:Enable()
	SELF:oDCDESCRI:ENABLE()
	SELF:oDClLOTE:Enable()
	SELF:oDCOBS:TEXTVALUE:="Outras Aplicações"

METHOD pegcod( ) 
LOCAL Aretu AS ARRAY
aretu:={.F.}	
IF Empty(SELF:tipoe)
   RETU
ENDIF	
DO CASE
	CASE SELF:tipoe="M"
       ARETU:=PEGMU01(SELF:cbusca,zcurini,zcurdir)
	CASE SELF:tipoe="C"
       ARETU:=PEGMT01(SELF:cbusca,zcurini,zcurdir)
	CASE SELF:tipoe="P"
       ARETU:=PEGMS01(SELF:cbusca)
	CASE SELF:tipoe="T"
       ARETU:=PEGMP03(SELF:cbusca,zcurini,zcurdir)
ENDCASE	
IF aRETU[1]
	IF SELF:tipoe="T"
       SELF:cbusca:=ARETU[4]
       SELF:CPRODUTO:=ARETU[3]
	ENDIF	
    SELF:DESCRI:=ARETU[2]
    SELF:APLICACAO:=ARETU[3]
    SELF:bloqCOD()
ELSE
    SELF:desbloqCOD()
ENDIF		

METHOD pegcod1( ) 
LOCAL oSERVER AS USEREDE	
LOCAL aDAD AS ARRAY
aDAD:={zCURINI,"CRMCESP.DBF",zCURDIR}	
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO=0
   oSERVER:GOTOP()
   IF oSERVER:SEEK(SELF:CODAVU)
   	 SELF:TIPOE:=oSERVER:FIELDGET("TIPOENT")
   	 SELF:CBUSCA:=oSERVER:FIELDGET("CODIGO")
     SELF:DESCRI:=oSERVER:FIELDGET("NOME")
   	 SELF:bloqCOD()
   ENDIF
   oSERVER:CLOSE()
ENDIF					

METHOD PEGCPAG 
LOCAL nCOMPED AS DWORD
nCOMPED:=Val(SELF:oDCPEPED:TEXTVALUE)	
SELF:PGTO:=PEGCondPAG(nCOMPED)	

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
    SELF:RASTROANO:=Year(Today())
     FabCenterWindow( SELF )
	RETURN NIL


METHOD TIPOC( ) 
	SELF:TIPOE:="C"

METHOD TIPOM( ) 
	SELF:TIPOE:="M"
	

METHOD TIPOO( ) 
	SELF:TIPOE:="X"

METHOD TIPOP( ) 
	SELF:TIPOE:="P"

METHOD TIPOT( ) 
SELF:TIPOE:="T"	
IF	Val(SELF:oDCPEREQ:TextValue)>0
	SELF:oDCPESONFA:Enable()
	SELF:odcpesonfb:Enable()
ENDIF

METHOD ViewTable 
	RETU

METHOD XCHKPESO(cCODIGO,lBUSCA) 
LOCAL aPRO AS ARRAY
LOCAL oJAN AS XBUSCA
IF ValType(lBUSCA)#"L"
   lBUSCA:=.T.
ENDIF	
IF ValType(cCODIGO)#"C" .OR. Empty(cCODIGO)	
   IF lBUSCA
   	  cCODIGO:=Space(24)
  	ELSE
      RETU .F.
   ENDIF
ENDIF
IF lBUSCA
   oJAN:=XBUSCA{SELF,"Codigo do Produto","Confirme o Produto",cCODIGO}
   oJAN:SHOW()
   IF ! oJAN:lOK
      RETU .F.
   ENDIF
   Ccodigo:=Ojan:cbusca
ENDIF
aPRO:=PEGMS01(cCODIGO)
IF aPRO[1]=.T.
   SELF:PESO:=APRO[6]
   RETU .T.
ENDIF	
RETU .F.

METHOD ZERAVAL 
SELF:oDCPEREQ:TEXTVALUE:="0"
SELF:oDCPEPED:TEXTVALUE:="0"
SELF:ODCPEITE:TEXTVALUE:="0"
SELF:oDCPRPED:TEXTVALUE:="0"
SELF:ODCPRITE:TEXTVALUE:="0"
SELF:oDCPERCLI:TEXTVALUE:="0"
SELF:oDCAUT:TextValue:="0"
SELF:oDCCLIFOR:TextValue:="0"
SELF:oDCPRECOPR:TEXTVALUE:="0"
SELF:oDCCarga:VALUE:=.F.
SELF:oDClLOTE:VALUE:=.F.
SELF:oDCReceber:VALUE:=.F.
SELF:oDCEnsaios:Value:=.F.
SELF:oDCREQAUT:Value:=.F.
SELF:oDCCOGNOME:Value:=""
SELF:oDCTIPOE:TEXTVALUE:=""
SELF:oDCCBUSCA:TextValue:=""
SELF:oDCPGTO:TEXTVALUE:=""
SELF:oDCDESCRI:TextValue:=""
SELF:oCCTIPOC:Enable()
SELF:oCCTIPOM:Enable()
SELF:oCCTIPOT:Enable()
SELF:oCCTIPOP:Enable()
SELF:oCCTIPOO:Enable()
SELF:oDCPEREQ:Enable()
SELF:oDCPEPED:Enable()
SELF:ODCPEITE:Enable()
SELF:oDCPRPED:Enable()
SELF:ODCPRITE:Enable()
SELF:oDCPERCLI:Enable()

	


END CLASS
