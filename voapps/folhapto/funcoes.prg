CLASS USEfolha INHERIT myDBSERVER
EXPORT nERRO AS BYTE

CONSTRUCTOR(cARQ, lShareMode, lReadOnlyMode, cDriver, aHidden,lINDEX) 
LOCAL cCAM,cVAR AS STRING
nERRO:=0

//Checa Parametros
IF IsNil(lShareMode)
    lShareMode := .T.
ENDIF
IF IsNil(lReadOnlyMode)
     lReadOnlyMode:= .F.
ENDIF
IF IsNil(lINDEX)
   lINDEX:=.T.
ENDIF	


IF IsNil(cDriver) .OR. Empty(cDRIVER)	
   cDRIVER:=PEGINIVAL(ZCURINI,"PATH","DRIVER")
ENDIF
IF IsNil(cDriver) .OR. Empty(cDRIVER)	
   cDriver := "DBFCDX"
ENDIF

cVAR:=zDIR+cARQ+".dbf"
cCAM:=zDIR
IF ! File(cVAR)
   cVAR:=ZDIRE+cARQ+".dbf"
   cCAM:=ZDIRE
   IF ! File(cVAR)
      cVAR:=ZDIRN+cARQ+".dbf"
      cCAM:=ZDIRN
      IF ! File(cVAR)
         cVAR:=cARQ+".dbf"
      ENDIF
   ENDIF	
ENDIF



//Abra o Banco de Dados
IF ! File(cVAR)
   alert("Falta Arquivo de Dados: "+Cvar,"Erro")
   nERRO:=1
   RETU SELF
ENDIF
SUPER(cVAR,lShareMode, lReadOnlyMode, cDriver, aHidden)

cVAR:=cCAM+cARQ+IF(cDRIVER="DBFNTX",".NTX",".cdx")
//Abre os Indices
IF ! File(cVAR)
   IF lINDEX
      alert("Falta Arquivo de Indice: "+Cvar,"Erro")
      nERRO:=2
      RETU SELF
   ENDIF
ELSE
   SELF:SetIndex(cVAR)
ENDIF

//Encerra
RETU SELF




END CLASS
FUNC checkcri(Carq,Cori,echave)
LOCAL oSERVER AS DBSERVER	
LOCAL cDRIVER AS STRING
LOCAL cCAM    AS STRING
LOCAL lTEM    AS LOGIC      
    lTEM:=.F.
IF ! File( ZDIRE + cARQ + ".DBF" ) .and. ! File( ZDIRn + cARQ + ".DBF" )
   cCAM:=""	
   IF File(cORI+".DBF")
   	  cCAM:=""
   	  lTEM:=.T.
   ENDIF
   IF File(ZDIRE+cORI+".DBF")	
   	  cCAM:=ZDIRE
   	  lTEM:=.T.
   ENDIF	
   IF lTEM
	   SHCopy(cCAM+cORI+".DBF", zDIRE + cARQ + ".DBF" )
	   cDRIVER:=PEGINIVAL(ZCURINI,"PATH","DRIVER")
	   IF IsNil(cDriver) .OR. Empty(cDRIVER)	
    	   cDriver := "DBFCDX"
	   ENDIF
	   oSERVER:=DBSERVER{ZDIRE+cARQ,.F.,,cDRIVER}	
	   IF ! oSERVER:Used
   		  RETU .F.
	   ENDIF		
	   IF cDriver = "DBFCDX"
    	   OSERVER:CreateOrder(cARQ,ZDIRE+cARQ,eCHAVE,,.F.)
	   ELSE
    	   oSERVER:CreateIndex(ZDIRE+cARQ,eCHAVE,,.F.)
	   ENDIF
	   oSERVER:CLOSE()
	ENDIF
    IF ! lTEM
    	alert("Falta Arquivo " +cORI+".DBF")
    ENDIF	
ENDIF
RETU .T.

FUNC CTOHORA(cHORA AS STRING)
cHORA:=Left(cHORA,5) //Evita hora com milesimos de segundo mm:ss:dd
cHORA:=StrTran(cHORA,":",".")
cHORA:=StrTran(cHORA,":",".")
RETU Val(Chora)

FUNC pegarqcon( nTIPO, cTIPO )	
LOCAL aDAD AS ARRAY
LOCAL cARQ
LOCAL oSERVER AS USEREDE
cARQ:="ERRO"
aDAD:={zCURINI,"FOPTOCON.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU cARQ
ENDIF
//1 Relogio
//2 Refeicao
//3 Portaria
//4 Rodbel
//5 Relogio2
DO CASE
CASE cTIPO = "DBFMIG"
   DO CASE
   CASE nTIPO = 1  .or. nTIPO = 4        //Rodbel Padrao=Relogio
      cARQ := AllTrim( oSERVER:FIELDGET("ARQUIV2") )
   CASE nTIPO = 2
      cARQ := AllTrim( oSERVER:FIELDGET("ARQUIV5") )
   CASE nTIPO = 3
      cARQ := AllTrim( oSERVER:FIELDGET("PORMIG") )  //Portaria
   CASE nTIPO = 5
      cARQ := AllTrim( oSERVER:FIELDGET("RE2MIG") )
   ENDCASE
CASE cTIPO = "TXT"
   DO CASE
   CASE nTIPO = 1  .or. nTIPO = 4        //Rodbel Padrao=Relogio
      cARQ := AllTrim( oSERVER:FIELDGET("ARQUIVO") )
   CASE nTIPO = 2
      cARQ := AllTrim( oSERVER:FIELDGET("ARQUIV4") )
   CASE nTIPO = 3
      cARQ := AllTrim( oSERVER:FIELDGET("PORTXT") )  //Portaria
   CASE nTIPO = 5
      cARQ := AllTrim( oSERVER:FIELDGET("RE2TXT") )
   CASE nTIPO = 901
      cARQ := AllTrim( oSERVER:FIELDGET("CAMINEX") ) //Exportacao Totais
   CASE nTIPO = 902
      cARQ := AllTrim( oSERVER:FIELDGET("CAMINER") ) //Exportado Refeicao
   ENDCASE
   IF At( ".", cARQ ) = 0
      cARQ += ".TXT"
   ENDIF
CASE cTIPO = "CAM"
   DO CASE
   CASE nTIPO = 1  .or. nTIPO = 4        //Rodbel Padrao=Relogio
      cARQ := AllTrim( oSERVER:FIELDGET("DIRETORIO") )
   CASE nTIPO = 2
      cARQ := AllTrim( oSERVER:FIELDGET("DIRETORI2") )
   CASE nTIPO = 3
      cARQ := AllTrim( oSERVER:FIELDGET("DIRETORI3") )
   CASE nTIPO = 5
      cARQ := AllTrim( oSERVER:FIELDGET("DIRETORI5") )
   ENDCASE
   IF Empty( cARQ )
      cARQ := AllTrim( oSERVER:FIELDGET("DIRETORIO") )
   ENDIF
CASE cTIPO = "ANO"
   DO CASE
   CASE nTIPO = 1  .or. nTIPO = 4        //Rodbel Padrao=Relogio
      cARQ := oSERVER:FIELDGET("PROCESS2")
   CASE nTIPO = 2
      cARQ := oSERVER:FIELDGET("ANOREL2")
   CASE nTIPO = 3
      cARQ := oSERVER:FIELDGET("ANOREL3")
   CASE nTIPO = 5
      cARQ := oSERVER:FIELDGET("ANOREL5")
   ENDCASE
CASE cTIPO = "DIV"	
   cARQ := IF (oSERVER:FIELDGET("PROCESS3") = "S", .T., .F. )
ENDCASE
oSERVER:CLOSE()
RETU cARQ


FUNCTION pegcomp()
LOCAL oSERVER AS USEFOLHA
LOCAL aRETU AS ARRAY
aRETU:={Today(),Today()}
oSERVER:=USEFOLHA{"FOPTOCOM"}
IF oSERVER:nERRO#0
    RETU aRETU
ENDIF
OsERVER:GOTOP()

IF ! OSERVER:sEEK(Str(ZANO,4)+Str(ZMES,2)+Str(ZEMPRESA,8))
   Oserver:APPEND()
   oSERVER:FIELDPUT("ANO",ZANO)
   oSERVER:FIELDPUT("MES",ZMES)	
   oSERVER:FIELDPUT("MESEXT",MESSTR(ZMES,ZANO,1,1))	
   oSERVER:FIELDPUT("EMPRESA",ZEMPRESA)	
ELSE
   aRETU[1]:=oSERVER:FIELDGET("DATAINI")
   aRETU[2]:=oSERVER:FIELDGET("DATAFIM")
   IF Empty(oSERVER:FIELDGET("MESEXT"))
      oSERVER:FIELDPUT("MESEXT",MESSTR(ZMES,ZANO,1,1))	
   ENDIF
ENDIF
oSERVER:CLOSE()
RETU aRETU

FUNC PEGPTOHOR( cCOD)
LOCAL aRETU AS ARRAY
LOCAL oSERVER AS USEFOLHA
aRETU := { 0, 0, 0, 0, " ", .F.," "}
//entrada almoco retorno saida virada
IF Empty( cCOD )
   RETU aRETU
ENDIF
oSERVER:=USEFOLHA{"FOPTOHOR"}
IF oSERVER:nERRO#0
   RETU aRETU
ENDIF
IF oSERVER:SEEK( cCOD )
   aRETU[ 1 ] := OSERVER:FIELDGET("ENT")
   aRETU[ 2 ] := OSERVER:FIELDGET("ALMI")
   aRETU[ 3 ] := OSERVER:FIELDGET("ALMF")
   aRETU[ 4 ] := OSERVER:FIELDGET("SAI")
   aRETU[ 5 ] := OSERVER:FIELDGET("VIRADA")
   aRETU[ 6 ] := .T.
   aRETU[ 7 ] := OSERVER:FIELDGET("FOLGASN")
ENDIF
oSERVER:CLOSE()
RETU aRETU

FUNC TARQREL( nTIPO, lPER,cTIPO)
LOCAL cARQ
LOCAL lBACK
CaRQ:="ERRO"
lBACK:=.F.
IF ValType(Ctipo)#"C"
   cTIPO:="DIO"	
ENDIF	
IF ValType( lPER ) # "L"
   lPER := .T.
ENDIF
IF lPER
   lBACK:=MDG("Arquivo de BAckup")
ENDIF	
IF cTIPO="DIO"
   IF ! Lback
	  DO CASE
	     CASE nTIPO = 1  .or. nTIPO = 5
              cARQ := "PD"
         CASE nTIPO = 2
              cARQ := "PA"
         CASE nTIPO = 3
              cARQ := "PP"
         CASE nTIPO = 4
              cARQ := "RBTEMP"
              //      IF MDG( "Deseja Reacumular" )
              //         RBACUMULA()
              //      ENDIF
      ENDCASE
      IF nTIPO # 4
         cARQ += ZCOMP
      ENDIF
   ELSE
      DO CASE
         CASE nTIPO = 1  .or. nTIPO = 4  .or. nTIPO = 5
              cARQ := "R"
         CASE nTIPO = 2
              cARQ := "A"
         CASE nTIPO = 3
              cARQ := "P"
      ENDCASE
      cARQ += ZCOMP
  ENDIF
ELSE
   cARQ := pegarqcon( nTIPO, "DBFMIG" )
ENDIF
RETU cARQ


