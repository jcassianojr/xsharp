FUNCTION checkespcod(cCODIGO)
LOCAL oSERVER AS USEREDE	
LOCAL aDAD AS ARRAY
LOCAL lRETU AS LOGIC
lRETU:=.F.
cCODIGO:=AllTrim(cCODIGO)
aDAD:={zCURINI,"CRMCESP.DBF",zCURDIR}	
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO=0
   OSERVER:SETORDER(3)
   oSERVER:GOTOP()
   IF oSERVER:SEEK(cCODIGO)
   	  IF cCODIGO==AllTrim(OSERVER:FIELDGET("CODIGO"))
   	  	 lRETU:=.T.
      ENDIF
   ENDIF
   oSERVER:CLOSE()
ENDIF					
RETU lRETU

FUNC CHECKRASTRO(cRASTRO)
LOCAL lTROCA AS LOGIC
LOCAL cANO,cSUB AS STRING
lTROCA := FALSE	
//Ano Atual
AltD()
cANO:=StrZero(Year(Today()),4)
cSUB:=Right(cANO,2)
IF At("-"+cSUB,cRASTRO)>0
   cRASTRO:=StrTran(cRASTRO,"-"+cSUB,"/"+cANO)
   lTROCA:=.T.
ENDIF	
IF At("/"+cSUB,cRASTRO)>0	
   cRASTRO:=StrTran(cRASTRO,"/"+cSUB,"/"+cANO)
   lTROCA:=.T.
ENDIF	
//Ano Anterior
cANO:=StrZero(Year(Today())-1,4)
cSUB:=Right(cANO,2)
IF At("-"+cSUB,cRASTRO)>0
   cRASTRO:=StrTran(cRASTRO,"-"+cSUB,"/"+cANO)
   lTROCA:=.T.
ENDIF	
IF At("/"+cSUB,cRASTRO)>0	
   cRASTRO:=StrTran(cRASTRO,"/"+cSUB,"/"+cANO)
   lTROCA:=.T.
ENDIF	
RETU {lTROCA,cRASTRO}

FUNC CHECKSIT(nCLIFOR)
LOCAL aRETU:={.F.,"",.T.,""}
LOCAL nERRO:=0
LOCAL oARQ AS USEREDE
LOCAL aDAD AS ARRAY
IF Empty(nCLIFOR)
    RETU aRETU
ENDIF
aDAD:={ZCURINI,"MB01.DBF",ZCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:nERRO=0
   oARQ:GOTOP()
   IF oARQ:SEEK(nCLIFOR)
      IF oARQ:FIELDGET("CONCEITO")=="Z "
         nERRO:=1
         aRETU[3]:=.F.
      ELSE
         aRETU[1]:=.T.
         aRETU[2]:=oARQ:FIELDGET("NOME")
         aRETU[4]:=Left(oARQ:FIELDGET("CONCEITO"),1)
      ENDIF
   ELSE
      nERRO:=2
   ENDIF
   oARQ:CLOSE()
ENDIF
IF nERRO>0
   DO CASE
      CASE nERRO=1
   		  alert("Fornecedor  Bloqueado!!! Entre contato Setor de Qualidade")
      CASE nERRO=2
	   	  alert("Fornecedor  Não Cadastrado")
   ENDCASE
ENDIF
RETU aRETU



FUNCTION CMD3L(cCODIGO,cTIPO)
LOCAL oARQ AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL aRETU AS ARRAY
aRETU:={.F.," ",0,"","","","",""}
//seek,Ctipo,racf,desc01-05)
aDAD:={zCURINI,"CRM3L.DBF",zCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:nERRO#0
   RETU aRETU
ENDIF
oARQ:GOTOP()
IF oARQ:SEEK(cCODIGO)
   aRETU[1]:=.T.
   IF cTIPO="D"
  	  aRETU[2]:="D"
   	  oARQ:FIELDPUT("NVEZES",oARQ:FIELDGET("NVEZES")-1)
   	  IF oARQ:FIELDGET("NVEZES")<1
     	 oARQ:Delete()
      ENDIF
   ENDIF
   IF cTIPO="V"
   	  aRETU[3]:=oARQ:FIELDGET("RACF")
   	  aRETU[4]:=oARQ:FIELDGET("DESC01")
   	  aRETU[5]:=oARQ:FIELDGET("DESC02")
   	  aRETU[6]:=oARQ:FIELDGET("DESC03")
   	  aRETU[7]:=oARQ:FIELDGET("DESC04")
   	  aRETU[8]:=oARQ:FIELDGET("DESC05")
   ENDIF	
ELSE  
	 NOP
// Inclusao Somente Pela Racf	
//   aRETU[1]:=.F.
//   IF cTIPO="I"
//   	  oARQ:Append()
//   	  oARQ:FIELDPUT("CODIGO",cCODIGO)
//	  cRETU:="I"
//   ENDIF
ENDIF
oARQ:CLOSE()
RETU aRETU

FUNCTION CMDGP12(cCODIGO,cTIPO)
LOCAL oARQ AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL cRETU AS STRING
cRETU:=" "
aDAD:={zCURINI,"CRMGP12.DBF",zCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:nERRO#0
   RETU cRETU
ENDIF
oARQ:GOTOP()
IF oARQ:SEEK(cCODIGO)
   cRETU:="V"
   IF cTIPO="D"
   	  oARQ:Delete()
   	  cRETU:="D"
   ENDIF	
ELSE
   IF cTIPO="I"
   	  oARQ:Append()
   	  oARQ:FIELDPUT("CODIGO",cCODIGO)
	  cRETU:="I"
   ENDIF
ENDIF
oARQ:CLOSE()
RETU cRETU

FUNCTION CRIARASTRO(cTIPCOD,nRASTROnum,nRASTROANO,nRASTROITEM)
LOCAL cRASTRO:=""
IF ValType(cTIPCOD)<>"C"
   cTIPCOD:=""
ENDIF
IF (NRASTRONUM)<1
   alert("Nº Rastro nao Pode Ser zero")
   RETU Crastro
ENDIF
IF ctIPCOD=="A"
   IF ! CHECKALT(cTIPCOD,nRASTRONUM,nRASTROANO)
   	  RETU  crastro
    ENDIF	
ENDIF
IF ctIPCOD=="AR" .OR. ctIPCOD=="IE"
	IF ValType(Nrastroitem)<>"N"
       NRASTROITEM:=0		
	ENDIF	
	IF (NRASTROITEM)<1
        alert("Nº Item do Rastro nao Pode Ser zero")		
        RETU  crastro		
	ENDIF	
    cRASTRO:=cTIPCOD+"-"+StrZero(NRASTRONUM,6)+"-"+StrZero(NRASTROITEM,2)
ELSE
    cRASTRO:=cTIPCOD+StrZero(NRASTRONUM,4)+"/"+StrZero(NRASTROANO,4)
ENDIF
RETU crastro
	

FUNC ESTQARQ( cTIP, nTIP )

LOCAL cRETU := "XXXX"
DO CASE
CASE nTIP = 0
   DO CASE
   CASE cTIP = "M"
      cRETU := "MU99"
   CASE cTIP = "P"
      cRETU := "MS99"
   CASE cTIP = "B"
      cRETU := "MR99"
   CASE cTIP = "S"
      cRETU := "MQ99"
   CASE cTIP = "C"
      cRETU := "MT99"
   CASE cTIP = "1"  .or. cTIP = "E"
      cRETU := "MP91"
   CASE cTIP = "2"  .or. cTIP = "H"
      cRETU := "MP92"
   CASE cTIP = "3"  .or. cTIP = "T"
      cRETU := "MP93"
   CASE cTIP = "O"
      cRETU := "MW95"
   CASE cTIP = "R"
      cRETU := "MW97"
   OTHERWISE
      cRETU:= "XXXX"
   ENDCASE
CASE nTIP = 1
   DO CASE
   CASE cTIP = "M"
      cRETU := "MU01"
   CASE cTIP = "P"
      cRETU := "MS01"
   CASE cTIP = "B"
      cRETU := "MR01"
   CASE cTIP = "S"
      cRETU := "MQ01"
   CASE cTIP = "C"
      cRETU := "MT01"
   CASE cTIP = "1"  .or. cTIP = "E"
      cRETU := "MP01"
   CASE cTIP = "2"  .or. cTIP = "H"
      cRETU := "MP02"
   CASE cTIP = "3"  .or. cTIP = "T"
      cRETU := "MP03"
   CASE cTIP = "O"
      cRETU := "MW05"
   CASE cTIP = "I"
      cRETU := "ME04"
   CASE cTIP = "R"
      cRETU := "MW07"
   OTHERWISE
      cRETU:= "XXXX"
   ENDCASE
CASE nTIP = 2
   DO CASE
   CASE cTIP = "M"
      cRETU := "U9"
   CASE cTIP = "B"
      cRETU := "R9"
   CASE cTIP = "P"
      cRETU := "S9"
   CASE cTIP = "S"
      cRETU := "Q9"
   CASE cTIP = "C"
      cRETU := "T9"
   CASE cTIP = "1"  .or. cTIP = "E"
      cRETU := "P1"
   CASE cTIP = "2"  .or. cTIP = "H"
      cRETU := "P2"
   CASE cTIP = "3"  .or. cTIP = "T"
      cRETU := "P3"
   CASE cTIP = "O"
      cRETU := "W5"
   CASE cTIP = "R"
      cRETU := "W7"
   OTHERWISE
      cRETU:= "XX"
   ENDCASE
ENDCASE
RETU cRETU


FUNC GRAVAESTQ(aVAL)
LOCAL oARQ,oMOV AS USEMANA5	
LOCAL cARQ,cMOV AS STRING
LOCAL nESTQXXX,nESTQYYY,VAR1,VAR2,VAR3,XDIAS AS FLOAT
LOCAL aDAD AS ARRAY
XDIAS:=0
//aVAL[1] Codigo
//aVAL[2] QTDE
//aVAL[3] DATA
//aVAL[4] NUMERO
//aVAL[5] FORNECEDO
//aVAL[6] ARQUIVO
//aVAL[7] TIPO
//aVAL[8] OPERACAO NO ESTOQUE
//"E+" Soma Entrada
//"E-" Tira Entrada
//"S+" Soma Saida
//"S-" Tira Saida
//aVAL[9] RASTRO
//aVAL[10] Valor qtde Operacao Anterior
//aVAL[11] cTIPO Operacao


IF Empty(aVAL[3])
   aVAL[3]:=Today()
ENDIF


cARQ:=ESTQARQ(aVAL[7],1)
cMOV:=ESTQARQ(Aval[7],0)
IF cARQ=="XXXX" .OR. cMOV="XX"
   RETU	
ENDIF	

//Abrindo os Arquivos
aDAD:={zCURINI,cARQ,zCURDIR,aDIR}
oARQ:=USEMANA5{aDAD}
IF oARQ:nERRO#0
   alert("Erro Abrindo: "+cARQ)
   RETU NIL
ENDIF
aDAD:={zCURINI,cMOV,zCURDIR,aDIR}
oMOV:=USEMANA5{aDAD}
IF oMOV:nERRO#0
   oARQ:CLOSE()
   alert("Erro Abrindo: "+cMOV)
   RETU NIL
ENDIF


//Gravando o Estoque
nESTQXXX := 0
nESTQYYY := 0
oARQ:GOTOP()
IF oARQ:SEEK(aVAL[1])
   //Gravando o Saldo de Estoque Anterior
   nESTQXXX       := oARQ:FIELDGET("ESTQSAL")	
   IF aVAL[8]=="E+"
      oARQ:FIELDPUT("ESTQENT",oARQ:FIELDGET("ESTQENT")+aVAL[2])
   ENDIF
   IF aVAL[8]=="E-"
      oARQ:FIELDPUT("ESTQENT",oARQ:FIELDGET("ESTQENT")-aVAL[2])
   ENDIF
   IF aVAL[8]=="S+"
      oARQ:FIELDPUT("ESTQSAI",oARQ:FIELDGET("ESTQSAI")+aVAL[2])
   ENDIF
   IF aVAL[8]=="S-"
      oARQ:FIELDPUT("ESTQSAI",oARQ:FIELDGET("ESTQSAI")+aVAL[2])
   ENDIF
   oARQ:FIELDPUT("ESTQSAL",oARQ:FIELDGET("ESTQINI") + oARQ:FIELDGET("ESTQENT") - oARQ:FIELDGET("ESTQSAI"))
   //Gravando o Saldo de Estoque Atual
   nESTQYYY       := oARQ:FIELDGET("ESTQSAL")
   oARQ:FIELDPUT("SAIMIN",oARQ:FIELDGET("SAIMIN")+ aVAL[2])
   //Calculando o Estoque Minimo
   VAR1:=0
   IF ! Empty(oARQ:FIELDGET("DATMIN"))
      xDIAS:= aVAL[3] - oARQ:FIELDGET("DATMIN")
   ENDIF
   IF xDIAS>0
      VAR1:= oARQ:FIELDGET("SAIMIN") / xDIAS
   ENDIF
   VAR2 := oARQ:FIELDGET("DIASENT") * VAR1
   VAR3 := oARQ:FIELDGET("DIASEST") * VAR1
   oARQ:FIELDPUT("ESTQMIN",VAR2 + VAR3)
   IF xDIAS > 30 // zMEDIA Balancei o Saldo quando maior que a media
 	  oARQ:FIELDPUT("DATMIN",aVAL[3] - 30) // *ZMEDIA
      oARQ:FIELDPUT("SAIMIN",VAR1 * 30)  // *ZMEDIA
   ENDIF
   oMOV:APPEND()
   oMOV:FIELDPUT("ARQUIVO",aVAL[6])
   oMOV:FIELDPUT("DOCUMENTO",Str(aVAL[4],8)+Str(aVAL[5],5)+aVAL[1])
   oMOV:FIELDPUT("DATA",aVAL[3])
   oMOV:FIELDPUT("USUARIO",ZUSER)
   oMOV:FIELDPUT("QTDE",aVAL[2])
   oMOV:FIELDPUT("OLDQTDE",aVAL[10])
   oMOV:FIELDPUT("NUMERO",aVAL[4])
   oMOV:FIELDPUT("CODIGO",aVAL[1])
   oMOV:FIELDPUT("RASTRO",aVAL[9])
   oMOV:FIELDPUT("ESTQXXX",nESTQXXX)
   oMOV:FIELDPUT("ESTQYYY",nESTQYYY)
   oMOV:FIELDPUT("OPERACAO",aVAL[11])
ENDIF
oARQ:CLOSE()
oMOV:CLOSE()

FUNC PEGRIRM(nRIRM)
LOCAL aRETU:={.F.,"","",CToD(Space(8))}
LOCAL oARQ AS USEREDE
LOCAL aDAD AS ARRAY
aDAD:={zCURINI,"RIRM.DBF",zCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:nERRO#0
    RETU aRETU
ENDIF
oARQ:GOTOP()
IF oARQ:SEEK(nRIRM)
   aRETU[1]:=.T.
   aRETU[2]:=oARQ:FIELDGET("LAUDOF")
   aRETU[3]:=oARQ:FIELDGET("RASTRO")
   aRETU[4]:=oARQ:FIELDGET("DATAL")
ENDIF
oARQ:CLOSE()
RETU aRETU



FUNC PEGRIst(nRIST)
LOCAL aRETU:={.F.,"","",CToD(Space(8))}
LOCAL oARQ AS USEREDE
LOCAL aDAD AS ARRAY
aDAD:={zCURINI,"RIST.DBF",zCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:nERRO#0
    RETU aRETU
ENDIF
oARQ:GOTOP()
IF oARQ:SEEK(nRIST)
   aRETU[1]:=.T.
   aRETU[2]:=oARQ:FIELDGET("LAUDOF")
   aRETU[3]:=oARQ:FIELDGET("RASTRO")
   aRETU[4]:=oARQ:FIELDGET("DATAL")
ENDIF
oARQ:CLOSE()
RETU aRETU

FUNCTION TIPAR(cESPE)
LOCAL cTIPA AS STRING
 cTIPA:=""
 cESPE:=Upper(cESPE)
   IF At("TRACAO",cESPE)>0
    	   	   cTIPA:="RT"
    	   ENDIF
           IF At("CAMADA",cESPE)>0
    	   	   cTIPA:="CAM"
    	   ENDIF
           IF At("SPRAY",cESPE)>0
    	   	   cTIPA:="SS"
    	   ENDIF
           IF At("TRAÇÃO",cESPE)>0
    	   	   cTIPA:="RT"
    	   ENDIF
    	   IF At("DIAMETRO",cESPE)>0
    	   	   cTIPA:="DIA"
    	   ENDIF
    	   IF At("DIMENSIONAL",cESPE)>0
    	   	   cTIPA:="DIM"
    	   ENDIF
           IF At("PARALEL",cESPE)>0
    	   	   cTIPA:="PA"
    	   ENDIF
    	   IF At("ROSCA ROSCA",cESPE)>0
    	   	   cTIPA:="ROS"
    	   ENDIF
    	   IF At("RUGOSIDADE",cESPE)>0
    	   	   cTIPA:="RA"
    	   ENDIF
    	   IF At("PLANICIDADE",cESPE)>0
    	   	   cTIPA:="PL"
    	   ENDIF
    	   IF At("ALONGAMENTO",cESPE)>0
    	   	   cTIPA:="AL"
    	   ENDIF
    	   IF At("VISUAL",cESPE)>0 .OR. At("MEL -001",cESPE)>0 .OR. At("MEL-001",cESPE)>0
    	   	   cTIPA:="V"
    	   ENDIF
    	   IF At("ESCOAMENTO",cESPE)>0
    	   	   cTIPA:="EL"
    	   ENDIF
    	   IF At("ERICHESEN",cESPE)>0
    	   	   cTIPA:="EE"
    	   ENDIF
 	       IF At("ERICHSEN",cESPE)>0
 	   	       cTIPA:="EE"
    	   ENDIF
    	   IF At("DUREZA",cESPE)>0
    	   	   cTIPA:="ED"
    	   ENDIF
    	   IF At("QUIMICA",cESPE)>0
    	   	   cTIPA:="AQ"
    	   ENDIF
RETU cTIPA



