#region DEFINES
STATIC DEFINE JIMPULT_CHAVE := 104 
STATIC DEFINE JIMPULT_CMDCANCELAR := 103 
STATIC DEFINE JIMPULT_DFIM := 106 
STATIC DEFINE JIMPULT_DINI := 107 
STATIC DEFINE JIMPULT_ESCOLHER := 101 
STATIC DEFINE JIMPULT_PER := 108 
STATIC DEFINE JIMPULT_PROGBAR := 105 
STATIC DEFINE JIMPULT_THEFIXEDTEXT11 := 100 
STATIC DEFINE JIMPULT_THEFIXEDTEXT9 := 102 
#endregion

CLASS XIMPULT INHERIT jimpdiv			

METHOD IMPORTAR(CARQ,cTIPO) 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL aDAD AS ARRAY
LOCAL oSERVER AS USEREDE
LOCAL oMW08,oMB01 AS USEMANA5
LOCAL cCODIGO,cUNID,cSQL,cCODMW,mCHAVE,cCGC AS STRING
LOCAL nLASTREC,npos,NFORN AS DWORD
LOCAL nPERC AS INT
LOCAL dDATA,DATAINI,DATAFIM AS DATE
LOCAL lMW08,lTEM AS LOGIC
LOCAL nPRECO AS FLOAT
LOCAL oSTMT AS SQLStatement


 //  cMIG:=PEGEMPMIG(zempRESA,2)

    aDAD:={zCURINI,"MB01",zCURDIR,aDIR}
    oMB01:=USEMANA5{aDAD}
    IF oMB01:nERRO#0
       RETU SELF
    ENDIF
    oMB01:SETORDER(3)


    aDAD:={zCURINI,"MW08",zCURDIR,aDIR}
    oMW08:=USEMANA5{aDAD}
    IF oMW08:nERRO#0
       RETU SELF
    ENDIF


    aDAD:={zCURINI,CARQ+".DBF",zCURDIR}
    oSERVER:=USEREDE{aDAD}
    IF oSERVER:nERRO#0
       RETU SELF
    ENDIF


   nPOS:=0
   nLASTREC:=oSERVER:LastRec


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



   WHILE .NOT. oSERVER:EoF
   	  	nPerc := INT(100* nPOS/ nLASTREC)
        SELF:oDcProgBar:Position := nPerc	
  	    nPOS++

   	    cCODIGO:=oSERVER:FIELDGET("CODIGO")
   	    cCODMW:=""
   	    IF cARQ="MU01"
     	   cCODMW:=oSERVER:FIELDGET("CODMW")
   	    ENDIF	


	    SELF:oDCchave:Caption:=CCODIGO
	    CSQL:=" SELECT aviso_rec.*,nf_sup.num_nf, nf_sup.cod_fornecedor "
        CSQL+=" from aviso_rec INNER JOIN nf_sup ON aviso_rec.num_aviso_rec = nf_sup.num_aviso_rec and aviso_rec.cod_empresa = nf_sup.cod_empresa"
   	    csql+=" where (aviso_rec.cod_empresa='01' or aviso_rec.cod_empresa='04') "
        csql+=" and aviso_rec.cod_item='" + AllTrim(cCODIGO)+"'"
  	    csql+=" and aviso_rec.dat_inclusao_seq>='" +DToC(dataini) + "' and aviso_rec.dat_inclusao_seq<='" +DToC(datafim) + "'"
   	    csql+=" order by aviso_rec.dat_inclusao_seq DESC"
        oreg:= SQLSelect{cSQL,oconn}
        lTEM:=FALSE
        IF (oREG:EOF=.F.) .AND. OREG:RecCount>0
           lTEM:=TRUE
           IF ValType(OREG:FIELDGET("dat_inclusao_seq"))<>"U"
              IF ValType(OREG:FIELDGET("dat_inclusao_seq"))="D"
                 dDATA:=OREG:FIELDGET("dat_inclusao_seq")
                 IF dDATA>OSERVER:FIELDGET("ULTDATA")
                    Oserver:FIELDPUT("ULTPRC",OREG:FIELDGET("pre_unit_nf"))
                    Oserver:FIELDPUT("ULTUND",OREG:FIELDGET("cod_unid_med_nf"))
                    Oserver:FIELDPUT("ULTDATA",ddata)
                 ENDIF
              ENDIF
           ENDIF
        ENDIF



        cUNID:=Oserver:FIELDGET("ULTUND")
        IF cUNID="CT"
           Oserver:FIELDPUT("ULTPRC",Oserver:FIELDGET("ULTPRC")/100)
           Oserver:FIELDPUT("ULTUND","PC")
        ENDIF
        IF cUNID="ML"
           Oserver:FIELDPUT("ULTPRC",Oserver:FIELDGET("ULTPRC")/1000)
           Oserver:FIELDPUT("ULTUND","PC")
        ENDIF
        IF cUNID="T"
           Oserver:FIELDPUT("ULTPRC",Oserver:FIELDGET("ULTPRC")/1000)
           Oserver:FIELDPUT("ULTUND","KG")
        ENDIF


        IF lTEM
           WHILE ! Oreg:eof	
           	  cCGC:=oREG:FIELDGET("Cod_fornecedor")
              IF SubStr(cCGC,10,4)="0000"
                 cCGC:= SubStr(cCGC,1,3)+"."+SubStr(cCGC,4,3)+"."+SubStr(cCGC,7,3)+"-"+SubStr(cCGC,14,2)
              ELSE
    	         cCGC:=SubStr(CCGC,2)
                 cCGC:=Left(cCGC,2)+"."+SubStr(cCGC,3,3)+"."+SubStr(cCGC,6,3)+"/"+SubStr(cCGC,9,4)+"-"+SubStr(cCGC,13,2)
             ENDIF
       	     nFORN:=0
             oMB01:SETORDER(3)
         	 oMB01:GOTOP()
       	     IF oMB01:SEEK(cCGC)
                nFORN:=oMB01:FIELDGET("NUMERO")
             ENDIF
              nPRECO:=OREG:FIELDGET("pre_unit_nf")
              //
              mCHAVE:=cTIPO+PadR(cCODIGO,24)+Str(nFORN,8)
              lMW08:=TRUE
              oMW08:GOTOP()
              oMW08:SEEK(mCHAVE)
              WHILE oMW08:FIELDGET("ITETIP") = cTIPO  .and. AllTrim(oMW08:FIELDGET("ITECOD")) = AllTrim( cCODIGO )  .and. oMW08:FIELDGET("COMFOR") = nFORN  .and. ! Omw08:EOF
                 IF oMW08:FIELDGET("ITEPRC") = nPRECO
                    lMW08 := FALSE
                 ENDIF
                 oMW08:SKIP()
              ENDDO
              IF lMW08      //Grava se Nao tiver o Mesmo Preco
                 oMW08:APPEND()
                 oMW08:FIELDPUT("ITETIP",cTIPO)
                 oMW08:FIELDPUT("ITECOD",cCODIGO)
                 oMW08:FIELDPUT("COMFOR",nFORN)
                 oMW08:FIELDPUT("ITEPRC",OREG:FIELDGET("pre_unit_nf"))
                 oMW08:FIELDPUT("ITEUNI",OREG:FIELDGET("cod_unid_med_nf"))
                 oMW08:FIELDPUT("DATA",OREG:FIELDGET("dat_inclusao_seq"))
                 oMW08:FIELDPUT("COMPED",OREG:FIELDGET("num_pedido"))
   //              oMW08:FIELDPUT("ITEM",)
   //            oMW08:FIELDPUT("PEDATIVO",)
                 oMW08:FIELDPUT("CODMW",CCODMW)
                 oMW08:FIELDPUT("DATAINI",OREG:FIELDGET("dat_inclusao_seq"))
  //             ITEM       N   3  0
  //             PEDATIVO   C   1  0
              ENDIF
              oREG:Skip()
           ENDDO
        ENDIF
        Oreg:close()


        IF Empty(oSERVER:FIELDGET("ULTPRC"))
           SELF:oDCchave:Caption:=CCODIGO+" Preco"
           csql:= "select pre_unit from desc_preco_item where cod_item='" + AllTrim(cCODIGO)+"'"
           oreg:= SQLSelect{cSQL,oconn}
           IF oREG:EOF  
           	  NOP
           ELSE	
              Oserver:FIELDPUT("ULTPRC",OREG:FIELDGET("pre_unit"))
           ENDIF
           Oreg:close()
        ENDIF



   	    oSERVER:SKIP()
   ENDDO	
   Oconn:Disconnect()
   Oserver:CLOSE()
   oMW08:CLOSE()
   oMB01:CLOSE()
   alert("Concluido")
	








	

CONSTRUCTOR(oOWNER) 
SUPER(oOWNER)	
SELF:Caption:="Importar Precos Logix"
SELF:SHOW()		

METHOD OK( ) 
	IF MDG("Importar Fornecedores")
       IMPFOR(.F.)
    ENDIF
	IF MDG("Materia Prima")
	   IMPCOD(3,3,.F.)
   	   SELF:IMPORTAR("MU01","M")
   	ENDIF
    IF MDG("Componentes")
	   IMPCOD(2,2,.F.)
       SELF:IMPORTAR("MT01","C")	
    ENDIF
    IF MDG("Consumiveis")
	   IMPCOD(6,6,.F.)
       SELF:IMPORTAR("MW05","O")	
    ENDIF	
    IF MDG("Itens Manutencao/Reposicao")
       IMPCOD(7,7,.F.)
       SELF:IMPORTAR("MW07","R")	
    ENDIF	


END CLASS
