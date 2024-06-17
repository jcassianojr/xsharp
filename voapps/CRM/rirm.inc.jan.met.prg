PARTIAL CLASS jRirmInc
METHOD bloqCOD( ) 
SELF:oDCDESENHO:disable()
SELF:oDCDESCR:disable()
SELF:oDCTIPOENT:disable()
SELF:oCCTIPOC:disable()
SELF:oCCTIPOM:disable()
SELF:oCCTIPOT:disable()
SELF:oCCpegCOD:disable()
SELF:oCCesccod:Disable()
SELF:oCCpegcod1:Disable()
SELF:oCCesccod3:Disable()
SELF:oDCcodavu:Disable()

	

METHOD bloquear( ) 
SELF:oDCDESENHO:disable()
SELF:oDCDESCR:disable()
SELF:oDCRASTRO:disable()
SELF:oDCNFORN:disable()
SELF:oDCFORNE:disable()
SELF:oDCPEDIDO:disable()
SELF:oDCCLASSI:disable()
SELF:oDCTIPOENT:disable()
SELF:oCCTIPOC:disable()
SELF:oCCTIPOM:disable()
SELF:oCCTIPOT:disable()
SELF:oDCRASTROANO:disable()
SELF:oDCTIPCOD:disable()
SELF:oCCESCFOR:disable()
SELF:oCCRB2:disable()
SELF:oCCRB1:disable()
SELF:oDCTIPCAD:disable()
SELF:oCCpegfor:disable()
SELF:oCCpegCOD:disable()
SELF:oCCCHKPRC:disable()
SELF:oCCCHKPRC1:disable()
SELF:oCCCHKREQ:disable()
SELF:oDCPERCLI:disable()
SELF:oDCPEREQ:disable()
SELF:oCCCHKPED:disable()
SELF:oCCCHKPRG:disable()
SELF:oDCPEITE:disable()
SELF:oDCPRITE:disable()
SELF:oCCescped:disable()
SELF:oCCescped1:disable()
SELF:oCCescped2:disable()
SELF:oCCescprg:disable()
SELF:oDCPEPED:disable()
SELF:oDCPRPED:disable()
SELF:oCCcmdgera1:disable()
SELF:oCCesccod:Disable()
SELF:oCCescpemo:Disable()
SELF:oCCescpemo1:Disable()
SELF:oCCpegcod1:Disable()
SELF:oCCesccod3:Disable()
SELF:oDCcodavu:Disable()
SELF:oDCPETR:disable()


METHOD Cancelar( ) 
	SELF:LRETU:=FALSE
	SELF:EndWindow()

METHOD CHKPED( ) 
LOCAL oSERVER AS USEREDE	
LOCAL aDAD AS ARRAY
aDAD:={zCURINI,"MW02.DBF",zCURDIR}	
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO=0
   oSERVER:GOTOP()
   IF oSERVER:SEEK(Str(SELF:PEPED,8)+Str(PEITE,3))
      SELF:TIPOENT:=oSERVER:FIELDGET("ITETIP")
      SELF:DESENHO:=oSERVER:FIELDGET("ITECOD")
      SELF:QTDE:=oSERVER:FIELDGET("ITESAL")
      SELF:pegcod()
      SELF:TIPCAD:="F"
      SELF:pegforped()
      SELF:pegfor()
      SELF:CMDGERA1()
      SELF:bloquear()
   ENDIF
   oSERVER:CLOSE()
ENDIF		

METHOD CHKPRC( ) 
   SELF:XCHKPRC("PEMO")	

METHOD CHKPRC1( ) 
	   SELF:XCHKPRC("PETR")	
	   SELF:PEGCOD()

METHOD CHKPRG( ) 
LOCAL oPE01 AS USEREDE	
LOCAL aDAD AS ARRAY
aDAD:={zCURINI,"PE.DBF",zCURDIR}	
oPE01:=USEREDE{aDAD}
IF oPE01:nERRO=0
   oPE01:GOTOP()
   IF oPE01:SEEK(SELF:PRPED)
      SELF:TIPOENT:=oPE01:FIELDGET("TIPPED")
      SELF:DESENHO:=oPE01:FIELDGET("CODIGO")
      SELF:NFORN:=OPE01:FIELDGET("FORNECEDO")
      SELF:PEPED:=oPE01:FIELDGET("COMPRAS")
      SELF:PEITE:=oPE01:FIELDGET("COMITEM")
      oPE01:CLOSE()
      aDAD:={zCURINI,"PE01.DBF",zCURDIR}
      oPE01:=USEREDE{aDAD}
      IF oPE01:nERRO=0
         oPE01:GOTOP()
         oPE01:SEEK(Str(SELF:PRPED,5))
         IF oPE01:FIELDGET("PEDIDO")=SELF:PRPED .AND. ! oPE01:EoF
      	     SELF:PRITE:=oPE01:FIELDGET("ITEM")
      	     SELF:QTDE:=oPE01:FIELDGET("TOTKGANT")
         ENDIF
         oPE01:CLOSE()	
      ENDIF
      SELF:pegcod()
      SELF:TIPCAD:="F"
      SELF:pegfor()
      SELF:CMDGERA1()
      SELF:bloquear()	
   ELSE
      oPE01:CLOSE()
   ENDIF
ENDIF	

METHOD ChkRasfec( ) 
LOCAL ARETU AS ARRAY	
LOCAL oJAN AS JMESANO
oJAN:=JMESANO{SELF}
oJAN:SHOW()
aRETU:=XChkRastro(SELF,"M2"+OJAN:cCOMP,SELF:TIPOENT,SELF:DESENHO)
IF aRETU[1]
   SELF:SERVER:cRASTRO:=aRETU[2]
ENDIF		

METHOD ChkRastro( ) 
	LOCAL aRETU AS ARRAY	
aRETU:=XChkRastro(SELF,"MM02",SELF:TIPOENT,SELF:DESENHO)	
IF aRETU[1]
	SELF:SERVER:cRASTRO:=aRETU[2]
ENDIF

METHOD CHKREQ( ) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF Empty(SELF:PEREQ)
    RETU
ENDIF
aDAD:={zCURINI,"MY04.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO=0
   oSERVER:GOTOP()
   IF oSERVER:SEEK(SELF:PEREQ)
       SELF:PEPED:=oSERVER:FIELDGET("OS")
       SELF:PEITE:=oSERVER:FIELDGET("ITEM")
       SELF:TIPCAD:="F"
       SELF:NFORN:=oSERVER:FIELDGET("NUMMB01")
       SELF:TIPOENT:=oSERVER:FIELDGET("TIPO2")
       SELF:DESENHO:=oSERVER:FIELDGET("CODIGO")
       SELF:QTDE:=oSERVER:FIELDGET("QTDE")
       SELF:NRNOTA:=oSERVER:FIELDGET("NRNOTA")
       SELF:RASTRO:=oSERVER:FIELDGET("RASTRO")
       SELF:cmdgera1()
       SELF:bloquear()
       SELF:pegfor()	
       SELF:PEGCOD()
	ENDIF
   oSERVER:CLOSE()
ENDIF


METHOD cmdalt( ) 
		SELF:cmdzera()
    SELF:TIPCOD:="A"

METHOD cmdAR( ) 
			SELF:cmdzera()
    SELF:TIPCOD:="AR"

METHOD cmdB( ) 
		SELF:cmdzera()
    SELF:TIPCOD:="B"

METHOD cmdcrm( ) 
		SELF:cmdzera()
    SELF:TIPCOD:=""

METHOD cmdgera( ) 
	SELF:RASTRO:=CRIARASTRO(SELF:TIPCOD,SELF:RASTRONUM,SELF:RASTROANO,SELF:RASTROITEM)

METHOD cmdgera1( ) 
SELF:PEDIDO:=StrTRIM(SELF:PEPED ,8,0)+"/"+StrTRIM(SELF:PEITE,3,0)
	

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

METHOD cmdzera( ) 
   	    SELF:TIPCOD:=""
		SELF:RASTRONUM:=0
		SELF:RASTRO:=""

METHOD esccod( ) 
LOCAL oESC AS XESCCOD	
DO CASE
	CASE SELF:tipoent="M"
       oESC:=XESCCOD{SELF,"MU01.DBF"}		
	CASE SELF:tipoent="C"
       oESC:=XESCCOD{SELF,"MT01.DBF"}		
	CASE SELF:tipoent="T"
       oESC:=XESCCOD{SELF,"MP03.DBF"}		
	OTHERWISE
       oESC:=XESCCOD{SELF,"MS01.DBF"}
ENDCASE
oESC:SHOW()	
IF Oesc:lok
    SELF:desenho:=oESC:CODIGO
ENDIF		

METHOD esccod1( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF Oesc:lok
    SELF:APLICACAO:=oESC:CODIGO
ENDIF	

METHOD esccod2( ) 
LOCAL oESC AS XESCCOD	
IF	SELF:tipoent="T"
   oESC:=XESCCOD{SELF,"ETI.DBF"}
ELSE	
   oESC:=XESCCOD{SELF,"MS01.DBF"}		
ENDIF
oESC:SHOW()	
IF Oesc:lok
    SELF:INSTRU:=oESC:CODIGO
ENDIF			

METHOD esccod3( ) 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"CRMCESP.DBF"}
oESC:SHOW()	
IF Oesc:lok
    SELF:CODAVU:=OESC:NUMERO
ENDIF
SELF:pegcod1()
	

METHOD ESCFOR( ) 
	LOCAL oESC AS XESCNUM	
IF SELF:oDCTIPCAD:Value="F" .OR. SELF:oDCTIPCAD:Value="C"
	IF SELF:oDCTIPCAD:Value="F"
	   oESC:=XESCNUM{SELF,"MB01.DBF"}
	ELSE
	   oESC:=XESCNUM{SELF,"MA01.DBF"}
	ENDIF
	oESC:SHOW()	
	IF Oesc:lok
	    SELF:NFORN:=oESC:NUMERO
	ENDIF
	SELF:PEGFOR()
ENDIF

METHOD escped( ) 
SELF:pegpedx("T")



METHOD escped1( ) 
	SELF:pegpedx("C")

METHOD escped2( ) 
	SELF:pegpedx("M")

METHOD escpemo( ) 
LOCAL oJAN AS Xescpemo
oJAN:=XescPEMO{SELF,ZCURINI,ZCURDIR,"PEMO"}
oJAN:SHOW()
IF oJAN:lOK
   SELF:oDCPeRCLI:TextValue:=Str(oJAN:NPEDIDO,8)	
   SELF:CHKPRC()
ENDIF	

METHOD escpemo1( ) 
	LOCAL oJAN AS Xescpemo
    oJAN:=XescPEMO{SELF,ZCURINI,ZCURDIR,"PETR"}
    oJAN:SHOW()
    IF oJAN:lOK
      SELF:oDCPeTR:TextValue:=Str(oJAN:NPEDIDO,8)	
      SELF:CHKPRC1()
   ENDIF

METHOD escprg( ) 
LOCAL oJAN AS XPEDIA
LOCAL oPE01 AS USEREDE
LOCAL aDAD AS ARRAY
oJAN:=XPEDIA{SELF,ZCURINI,ZCURDIR}
oJAN:SHOW()
IF oJAN:lOK
   SELF:PRPED:=oJAN:NUMERO
   SELF:TIPOENT:=oJAN:cTIPO
   SELF:DESENHO:=oJAN:cCODIGO
   SELF:NFORN:=OJAN:nFORNECEDO
   SELF:PEPED:=oJAN:nCOMPRAS
   SELF:PEITE:=oJAN:nCOMITEM
   aDAD:={zCURINI,"PE01.DBF",zCURDIR}
   oPE01:=USEREDE{aDAD}
   IF oPE01:nERRO=0
      oPE01:GOTOP()
      oPE01:SEEK(Str(oJAN:NUMERO,5))
      IF oPE01:FIELDGET("PEDIDO")=oJAN:NUMERO .AND. ! oPE01:EoF
      	 SELF:PRITE:=oPE01:FIELDGET("ITEM")
      	 SELF:QTDE:=oPE01:FIELDGET("TOTKGANT")
      ENDIF
      oPE01:CLOSE()	
   ENDIF
   SELF:pegcod()
   SELF:TIPCAD:="F"
   SELF:pegfor()
   SELF:CMDGERA1()
   SELF:bloquear()
ENDIF		

METHOD OK( ) 
	LOCAL aRETU AS ARRAY
	LOCAL cLOTECrt AS STRING
	LOCAL cRASTRO AS STRING
	LOCAL aFOR AS ARRAY
	
   IF Empty(SELF:CLASSI)
	   alert ("Classificacao Cliente Fornecedor Em Branco"	)
	   RETU
    ENDIF
	IF Empty(SELF:desenho)
	   alert ("codigo em branco"	)
	   RETU
    ENDIF
	IF Empty(SELF:descr)
	   alert ("descricao desenho em branco"	)
	   RETU
    ENDIF
	IF Empty(SELF:nforn)
	   alert ("codigo cliente/fornecedor em branco"	)
	   RETU
    ENDIF
	IF Empty(SELF:FORne)
	   alert ("nome cliente/fornecedor em branco"	)
	   RETU
    ENDIF
	IF Empty(SELF:pedido)
	   alert ("pedido em branco"	)
	   RETU
    ENDIF
	IF Empty(SELF:nrnota)
	   alert ("numero nota fiscal em branco"	)
	   RETU
    ENDIF
	IF Empty(SELF:datanf)
	   alert ("data nota fiscal em branco")
	   RETU
    ENDIF
	IF Empty(SELF:qtde)
	   alert ("quantidade nota fiscal em branco"	)
	   RETU
    ENDIF

    aFOR:=CHECKSIT(SELF:NFORN)
    IF aFOR[1]        //Achou Fornecedor
       IF ! aFOR[3]  //Fornecedor Bloqueado
          RETU
       ENDIF
    ENDIF


   IF SELF:TIPOENT $ "TCM"

      IF SELF:TIPOENT="T"
         IF .NOT. checkens(SELF:TIPOENT,SELF:INSTRU)	
            RETU
         ENDIF
      ELSE	
         IF .NOT. checkens(SELF:TIPOENT,SELF:DESENHO)	
            RETU
         ENDIF
      ENDIF
   ELSE
   	  alert("Tipo diferente de T C ou M"  )
   	  RETU
   ENDIF

	
	cLOTECRt:=""
	
    IF SELF:oDClLOTE:Value=.T. .AND. SELF:oDCEnsaios:Value=.T.
       alert("Lote Pilote e Ensaios selecionados ")	
       RETU
    ENDIF	
	IF SELF:oDClLOTE:Value=.T.
   	   cLOTECRt:="P"	
    ENDIF
    IF SELF:oDCEnsaios:Value=.T.
	    cLOTECRt:="E"	
    ENDIF	


    IF Empty(SELF:RASTRO)
       cRASTRO:=""
    ELSE
       cRASTRO:=SELF:RASTRO	
    ENDIF	
	
	aRETU:=ArrayNew(17)
	ARETU[1]:=SELF:CLASSI
	ARETU[2]:= CRASTRO
	ARETU[3]:=SELF:DESENHO
	ARETU[4]:=SELF:DESCR
	ARETU[5]:=SELF:INSTRU
	ARETU[6]:=SELF:NFORN
	ARETU[7]:=SELF:FORNE
	ARETU[8]:=SELF:PEDIDO
	ARETU[9]:=SELF:NRNOTA
	ARETU[10]:=SELF:NRNOTB
	ARETU[11]:=SELF:DATANF
	ARETU[12]:=SELF:QTDE
	ARETU[13]:=SELF:CERT
	ARETU[14]:=SELF:UNID
	ARETU[15]:=SELF:TIPOENT
	ARETU[16]:=SELF:APLICACAO
    ARETU[17]:=CLOTECRT
	SELF:ARETU:=ARETU
	SELF:LRETU:=TRUE
	SELF:EndWindow()

METHOD pegcod( ) 
LOCAL Aretu AS ARRAY
aretu:={}	
DO CASE
	CASE SELF:tipoent="M"
       ARETU:=PEGMU01(SELF:desenho,zcurini,zcurdir)
       SELF:UNID:="KG"
	CASE SELF:tipoent="C"
       ARETU:=PEGMT01(SELF:desenho,zcurini,zcurdir)
       SELF:UNID:="PC"
	CASE SELF:tipoent="T"
       ARETU:=PEGMP03(SELF:desenho,zcurini,zcurdir)
        SELF:UNID:="KG"
ENDCASE	
IF aRETU[1]
    SELF:DESCR:=ARETU[2]
    SELF:APLICACAO:=ARETU[3]
    IF SELF:tipoent="T"
       SELF:INSTRU:=ARETU[4]
    ELSE
       SELF:INSTRU:=ARETU[5]
    ENDIF	
    SELF:bloqCOD()
ENDIF	

METHOD pegcod1( ) 
LOCAL oSERVER AS USEREDE	
LOCAL aDAD AS ARRAY
aDAD:={zCURINI,"CRMCESP.DBF",zCURDIR}	
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO=0
   oSERVER:GOTOP()
   IF oSERVER:SEEK(SELF:CODAVU)
   	 SELF:TIPOENT:=oSERVER:FIELDGET("TIPOENT")
   	 SELF:DESENHO:=oSERVER:FIELDGET("CODIGO")
   	 SELF:DESCR:=oSERVER:FIELDGET("NOME")
   	 SELF:bloqCOD()
   ENDIF
   oSERVER:CLOSE()
ENDIF				

METHOD pegfor( ) 
LOCAL aFORN AS ARRAY
IF SELF:oDCTIPCAD:Value="F"
	aFORN:=PEGMB01(SELF:NFORN,ZCURINI,ZCURDIR)
   IF aFORN[1]=.T.
      SELF:FORNE:=aFORN[2]
      SELF:CLASSI:=aFORN[9]
   ENDIF
ELSE
	aFORN:=PEGMA01(SELF:NFORN,ZCURINI,ZCURDIR)
   IF aFORN[1]=.T.
      SELF:FORNE:=aFORN[2]
      SELF:CLASSI:="_"
   ENDIF	
ENDIF
	

METHOD pegforped() 
LOCAL aDAD AS ARRAY
LOCAL oSERVER AS USEREDE	
 aDAD:={zCURINI,"MW01.DBF",zCURDIR}
 oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO=0
   oSERVER:GOTOP()
   IF oSERVER:SEEK(SELF:PEPED)
   	  SELF:NFORN:=oSERVER:FIELDGET("COMFOR")
   ENDIF	
   oSERVER:CLOSE()
ENDIF

METHOD pegpedx(cTIPO) 
LOCAL oJAN AS Xescmw02
oJAN:=Xescmw02{SELF,ZCURINI,ZCURDIR,"ITETIP='"+cTIPO+"'"}
oJAN:SHOW()
IF oJAN:lOK	
   SELF:PePED:=oJAN:NUMERO
   SELF:PEITE:=Ojan:ITEM
   SELF:DESENHO:=oJAN:cCODIGO
   SELF:TIPOENT:=oJAN:cTIPO
   SELF:pegcod()
   SELF:PEGFORPED()
   SELF:TIPCAD:="F"
   SELF:pegfor()
   SELF:CMDGERA1()
   SELF:bloquear()
ENDIF	

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	SELF:TIPOENT:="M"
	SELF:UNID:="KG"
    SELF:LRETU:=FALSE
    SELF:DATANF:=Today()
    SELF:RASTROANO:=Year(Today())
 FabCenterWindow( SELF )
	RETURN NIL


METHOD TIPOC( ) 
	SELF:UNID:="PC"
	SELF:TIPOEnt:="C"

METHOD TIPOM( ) 
    SELF:UNID:="KG"
	SELF:TIPOEnt:="M"

METHOD TIPOT( ) 
    SELF:UNID:="KG"
	SELF:TIPOEnt:="T"

METHOD XCHKPRC(CARQ) 
LOCAL oPE AS USEREDE
LOCAL nPERCLI AS LONG
LOCAL aDAD AS ARRAY
IF Empty(SELF:oDCPERCLI)
    RETU
ENDIF
IF CARQ="PEMO"
   nPERCLI:=Val(SELF:oDCPERCLI:TEXTVALUE)
ELSE
   nPERCLI:=Val(SELF:oDCPETR:TEXTVALUE)	
ENDIF
aDAD:={zCURINI,CARQ+".DBF",zCURDIR}
oPE:=USEREDE{aDAD}
IF oPE:nERRO=0
   oPE:GOTOP()
   IF oPE:SEEK(nPERCLI)
   	  DO CASE
   	  	 CASE Empty(oPE:FIELDGET("CODIGO"))
   	  	 	  alert("Sem Codigo do Produto")
         OTHERWISE
         	 IF CARQ="PEMO"
                SELF:PEPED:=1
                SELF:PEITE:=1
                SELF:TIPCAD:="C"
             ELSE
                SELF:PEPED:=oPE:FIELDGET("COMPRAS")
                SELF:PEITE:=oPE:FIELDGET("COMITEM")
                SELF:TIPCAD:="F"
             ENDIF
             SELF:NFORN:=oPE:FIELDGET("FORNECEDO")
             SELF:TIPOENT:=oPE:FIELDGET("TIPPED")
             SELF:DESENHO:=oPE:FIELDGET("CODIGO")
             SELF:DESCR:=AllTrim(oPE:FIELDGET("NOME"))+AllTrim(oPE:FIELDGET("NOM2"))
             SELF:APLICACAO:=oPE:FIELDGET("APLICACAO")
             SELF:cmdgera1()
             SELF:bloquear()
        ENDCASE
	ENDIF
   OPE:CLOSE()
ENDIF
SELF:pegfor()


END CLASS
