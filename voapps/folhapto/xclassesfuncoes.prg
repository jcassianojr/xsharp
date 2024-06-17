FUNCTION EXCLUIDEM()
LOCAL oPROGWIN AS PROGWIN
LOCAL nPERC AS INT
LOCAL dDEM AS DATE
//LOCAL aRETU AS ARRAY
LOCAL cPN AS STRING
LOCAL oPES,oPN AS USEFOLHA
LOCAL nPOS,nLASTREC,NUM AS DWORD



//Serao Usados Arede
cPN := "PN" + zCOMP

oPES:=USEFOLHA{"FO_PES"}
IF oPES:nERRO#0
    RETU .F.
ENDIF


oPN:=USEFOLHA{cPN}
IF oPN:nERRO#0
   oPES:CLOSE()
   RETU .F.
ENDIF


oProgWin := ProgWin{}
oProgWin:Caption:="Excluindo Demitidos"
oProgWin:SHOW()
nPOS:=1


nLASTREC:=OPES:RecCount
oPES:GOTOP()
WHILE .not. oPES:EOF
	
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   oProgWin:oDcProgBar:Position := nPerc
   oProgWin:oDCMessage:textValue:=oPES:FIELDGET("NOME")



  dDEM:=oPES:FIELDGET("DEMITIDO")
  NUM     := oPES:FIELDGET("NUMERO")


   IF ! Empty(dDEM)
      dDEM++
      oPN:GOTOP()
      oPN:SEEK(Str(NUM,8)+DToS(dDEM))
      WHILE NUM=oPN:FIELDGET("NUMERO") .AND. ! oPN:EOF
      	 oPN:Delete()
         oPN:Skip()
      ENDDO
   ENDIF


  oPES:Skip()
ENDDO
oPES:CLOSE()
oPN:CLOSE()
oPROGWIN:EndDialog()

alert("Exclusao Demitidos Concluida")
RETURN .t.


FUNCTION INICIAMES(eFILTRO)
LOCAL oSERVER,oPES,oPN,oHOR,oPE,oHRE AS USEFOLHA
LOCAL dINI,dFIM,nINI,nFIM,dDEM,dADM,dTRA AS DATE
LOCAL aEVED,aEVEC,aEVEB,aFOLGA,aRETU  AS ARRAY
LOCAL mGRUPO,mTURNO,mALMOCO,mMARMES,cPN,cPE,MHORREF AS STRING
LOCAL lDOMINGO,lSABADO,lFOLGA,lGRAVA AS LOGIC
LOCAL NUM,nEVE,nPOS,nLASTREC AS DWORD
LOCAL X
LOCAL oPROGWIN AS PROGWIN
LOCAL nPERC AS INT


//aHPAD := {}

aRETU:=pegcomp()
DINI:=ARETU[1]
DFIM:=ARETU[2]


//Serao Usados Arede
cPN := "PN" + zCOMP
cPE := "PE" + zCOMP


checkcri("PN"+ zCOMP,"FO_PON", "STR(NUMERO,8)+DTOS(DATA)" )
checkcri("PT"+ zCOMP,"FO_POT", "NUMERO")
checkcri("PD"+ zCOMP,"FO_DIO", "STR(NUMERO,8)+DTOS(DATA)+STR(HORA,5,2)" )
checkcri("PA"+ zCOMP,"FO_DIO", "STR(NUMERO,8)+DTOS(DATA)+STR(HORA,5,2)" )
checkcri("PP"+ zCOMP,"FO_DIO", "STR(NUMERO,8)+DTOS(DATA)+STR(HORA,5,2)" )
checkcri("PE"+ zCOMP,"FOPTOREV", "GRUPO+DTOS(DATA)" )
checkcri("PO"+ zCOMP,"FO_POCO", "STR(NUMERO,8)+DTOS(OCOINI)" )
checkcri("PM"+ zCOMP,"FO_PMAN", "STR(NUMERO,8)+DTOS(DATOCO)+TIPOCO" )
checkcri("PH"+ zCOMP,"FO_PHOR", "STR(NUMERO,8)+DTOS(OCOINI)" )
checkcri("PX"+ zCOMP,"FO_PDES", "STR(NUMERO,8)+DTOS(DATA)+STR(CONTA)" )
checkcri("PS"+ zCOMP,"FO_POS", "STR(NUMERO,8)+DTOS(SEMFIM)" )
checkcri("BK"+ zCOMP,"BCOREQ", "REQUISI" )
checkcri("BH"+ zCOMP,"BCOREQ", "REQUISI" )


//Pegando Eventos
aEVED := {}
aEVEC := {}
aEVEB := {}

oSERVER:=USEFOLHA{"FOPTOEVE"}
IF oSERVER:nERRO#0
    RETU .F.
ENDIF
oSERVER:GOTOP()
WHILE .NOT. oSERVER:EOF
   AAdd( aEVED, Str( oSERVER:FIELDGET("DIA"), 2 ) + Str(oSERVER:FIELDGET("MES"), 2 ) )
   AAdd( aEVEC, oSERVER:FIELDGET("CODIGO") )
   AAdd( aEVEB, { oSERVER:FIELDGET("BCOSN"), oSERVER:FIELDGET("REDSN"), oSERVER:FIELDGET("FOLSN") } )
   oSERVER:Skip()
ENDDO
oSERVER:CLOSE()


oPES:=USEFOLHA{"FO_PES"}
IF oPES:nERRO#0
    RETU .F.
ENDIF


oPN:=USEFOLHA{cPN}
IF oPN:nERRO#0
   oPES:CLOSE()
   RETU .F.
ENDIF

oHOR:=USEFOLHA{"FO_RELHR"}
IF oHOR:nERRO#0
   oPN:CLOSE()
   oPES:CLOSE()
   RETU .F.
ENDIF

oHRE:=USEFOLHA{"FOPTOHRE"}
IF oHRE:nERRO#0
   oPN:CLOSE()
   oPES:CLOSE()
   oHOR:CLOSE()
   RETU .F.
ENDIF


oPE:=USEFOLHA{cPE}
IF oPE:nERRO#0
   oHRE:CLOSE()
   oHOR:CLOSE()
   oPN:CLOSE()
   oPES:CLOSE()
   RETU .F.
ENDIF


oProgWin := ProgWin{}
oProgWin:Caption:="Iniciando o Mes"
oProgWin:SHOW()
nPOS:=1


nLASTREC:=OPES:RecCount
oPES:GOTOP()
WHILE .not. oPES:EOF
	
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   oProgWin:oDcProgBar:Position := nPerc
   oProgWin:oDCMessage:textValue:=oPES:FIELDGET("NOME")



  dDEM:=oPES:FIELDGET("DEMITIDO")
  NUM     := oPES:FIELDGET("NUMERO")
  lGRAVA:=Empty(dDEM) .OR. (Month(dDEM)>=ZMES .AND. Year(dDEM)>=ZANO)
  IF ValType(eFILTRO)="C"
  	 lGRAVA:=Eval(eFILTRO)
  ENDIF	
  IF ValType(eFILTRO)="A"
  	 lGRAVA:=AScan(eFILTRO,NUM)>0
  ENDIF	
  IF lGRAVA
     mGRUPO  := "  "
     mTURNO  := " "
     mALMOCO := " "
     mMARMES := " "
     nINI    := dINI
     aFOLGA := { "N", "N", "N", "N", "N", "N", "N" }
     dADM:=oPES:FIELDGET("ADMITIDO")
     dTRA:=oPES:FIELDGET("DATTRANSF")
     IF nINI < dADM                   //Inicia A partir da data admiss„o
        nINI := DADM
     ENDIF

    IF ! Empty(dTRA)                //Inicia a partir da data transferencia
       IF nINI < dTRA
          nINI := dTRA
       ENDIF
    ENDIF


     nFIM := dFIM
     IF ! Empty(dDEM )                //Encerra na data de demiss„o
        IF dDEM < nFIM
           nFIM := dDEM
        ENDIF
     ENDIF

   oHOR:GOTOP()
   IF oHOR:SEEK( NUM )
      mGRUPO  := oHOR:FIELDGET("GRUPO")
      mTURNO  := oHOR:FIELDGET("HFOL00")
      mALMOCO := oHOR:FIELDGET("ALMOCO")
      mMARMES := oHOR:FIELDGET("MARMES")
      mHORREF := oHOR:FIELDGET("HORREF")
      aFOLGA:={"","","","","","","",""}
      IF ! Empty(mHORREF)
      	  oHRE:GOTOP()
      	  IF oHRE:SEEK(mHORREF)
             aFOLGA := { oHRE:FIELDGET("HFOL01"), oHRE:FIELDGET("HFOL02"), oHRE:FIELDGET("HFOL03"), oHRE:FIELDGET("HFOL04"),oHRE:FIELDGET("HFOL05"),oHRE:FIELDGET("HFOL06"), oHRE:FIELDGET("HFOL07") }
          ENDIF
      ENDIF
   ENDIF
   IF mMARMES <> "N"
      FOR X := nINI TO nFIM
      //   cCOD := " "
         nEVE := AScan( aEVED, Str( Day( X ), 2 ) + Str( Month( X ), 2 ) ) //Checa Dia/Mes
         IF nEVE = 0
            nEVE := AScan( aEVED, Str( DoW( X ), 2 ) + Str( 0, 2 ) ) //Checa Dia da Semana
         ENDIF
         lFOLGA   := .F.
         lDOMINGO := .F.
         lSABADO  := .F.
         IF ! Empty( mGRUPO )  .and. mTURNO = "S"
            oPE:GOTOP()
            IF oPE:SEEK( mGRUPO + DToS( X ) )
               IF oPE:FIELDGET("CODREV") = "FO"
                  lFOLGA := .T.
               ENDIF
               IF oPE:FIELDGET("CODREV") = "DO"
                  lDOMINGO := .T.
               ENDIF
               IF oPE:FIELDGET("CODREV") = "SA"
                  lSABADO := .T.
               ENDIF
            ENDIF
         ENDIF
         oPN:GOTOP()
         IF ! oPN:SEEK( Str( NUM, 8 ) + DToS( X ) )
            oPN:Append()
            oPN:FIELDPUT("NUMERO",NUM)
            oPN:FIELDPUT("DATA",X)
         ENDIF
         IF Empty(oPN:FIELDGET("COD"))
            IF nEVE > 0
               IF Empty( mGRUPO )  .or. mTURNO # "S"  .or. AEVEC[ nEVE ] = "FE"
                  IF AEVEC[ nEVE ]<>"DO" .AND. AEVEC[ nEVE ]<>"SA"
                     oPN:FIELDPUT("COD",AEVEC[ nEVE ])
                  ELSE
                     IF aFOLGA[DoW(X)]="S" //so se for folga marca
                        oPN:FIELDPUT("COD", AEVEC[ nEVE ]) //Sabado e Domingo
                     ENDIF
                  ENDIF
               ENDIF
               IF AEVEB[ nEVE, 1 ] = "S"
                  oPN:FIELDPUT("BCOSN","S")
               ENDIF
               IF AEVEB[ nEVE, 2 ] = "S"
                  oPN:FIELDPUT("REDSN","S")
               ENDIF
               IF AEVEB[ nEVE, 3 ] = "S"
                  oPN:FIELDPUT("FOLSN","S")
               ENDIF
            ELSE
               oPN:FIELDPUT("ALMOCO", mALMOCO)
            ENDIF
            IF lFOLGA
               oPN:FIELDPUT("COD","FO")
               oPN:FIELDPUT("ALMOCO"," ")
               oPN:FIELDPUT("FOLSN","S")
            ENDIF
            IF lDOMINGO
               oPN:FIELDPUT("COD","DO")
               oPN:FIELDPUT("ALMOCO"," ")
            ENDIF
            IF lSABADO
               oPN:FIELDPUT("COD","SA")
               oPN:FIELDPUT("ALMOCO"," ")
            ENDIF
         ENDIF

      NEXT X
   ENDIF
  ENDIF
  oPES:Skip()
ENDDO
oPES:CLOSE()
oPN:CLOSE()
oHOR:CLOSE()
oPE:CLOSE()
oPROGWIN:EndDialog()

alert("concluido")
RETURN .t.



