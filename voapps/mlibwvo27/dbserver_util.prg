FUNCTION CRIANTX(aDAD,aCOM)
	LOCAL cDBF,cCAM,cVAR,cIND,cDRIVER,cTAG,cPOS AS STRING
LOCAL oARQ AS DBSERVER
LOCAL nIND,X AS BYTE
LOCAL nREG AS DWORD
LOCAL oPROGWIN AS PROGWIN

//Competencia Empresa
IF ValType(aCOM)#"A"
   aCOM:={1,1,1}
ENDIF


//Acha o Caminho
cCAM:=PEGINIVAL(aDAD[1],aDAD[2],"CAMINHO")
IF IsNil(cCAM)
   cCAM:=aDAD[3]
ENDIF

//Pega o Driver
cDRIVER:=PEGINIVAL(aDAD[1],aDAD[2],"DRIVER")
IF IsNil(cDRIVER)
   cCAM:="DBFNTX"
ENDIF

cCAM:=CAMINEX(cCAM,aCOM[1],aCOM[2],aCOM[3])


//Abra o Banco de Dados
cDBF:=cCAM+aDAD[2]
IF ! File(cDBF)
   alert("Falta Arquivo de Dados: "+CDBF,"Arquivo Inexistente")
    RETU .F.
ENDIF

WHILE TRUE
  oARQ:=DBSERVER{cDBF,DBEXCLUSIVE,,cDRIVER}
  IF NetErr()
    IF MDG("Arquivo não pode ser Aberto"+aDAD[2],"Retentar")
        LOOP
    ENDIF
  ENDIF
  EXIT
ENDDO
IF ! oARQ:USED
   alert("Erro ao abrir Arquivo de Dados: "+CDBF,"Erro Abertura")
   RETU .F.
ENDIF
oARQ:PACK()

//Cria os Indices
cVAR:=PEGINIVAL(aDAD[1],aDAD[2],"NUMMAINTAINED")
IF IsNil(cVAR)
   oARQ:CLOSE()
   alert("Indices os Configuração Não Definidos: "+aDAD[2],"Falta Configuraçao")
   RETU .F.
ENDIF
nIND:=Val(cVAR)
nREG:=oARQ:RecCount
oProgWin := ProgWin{}
oProgWin:Caption:=cdbf
oProgWin:SHOW()
FOR X := 0 TO nIND-1
   IF X<10
      cPOS:=StrZero(X,1)
   ELSE
      cPOS:=StrZero(X,2)
   ENDIF
   IF cDRIVER="DBFCDX"
      cVAR:=cCAM+PEGINIVAL(aDAD[1],aDAD[2],"MAINTAIN0")
   ELSE
      cVAR:=cCAM+PEGINIVAL(aDAD[1],aDAD[2],"MAINTAIN"+cPOS)
   ENDIF
   cIND:=PEGINIVAL(aDAD[1],aDAD[2],"INDEX"+cPOS)

   oARQ:SetOrderCondition(,,,,{||Progress(oARQ,oProgWin)},nREG/100)
   IF cDRIVER="DBFCDX"

      cTAG:=PEGINIVAL(aDAD[1],aDAD[2],"TAG"+cPOS)
      oProgWin:oDCMessage:textValue:=cTAG
//      oARQ:SetOrderCondition(,,,,{||Progress(oARQ,oProgWin)},nREG/100)
      OARQ:CreateOrder(cTAG,cVAR,cIND,,.F.)
   ELSE
 	  oProgWin:oDCMessage:textValue:=cIND
      IF Left(cIND,1)="<"
         cIND:=SubStr(cIND,2)
         oARQ:createindex(cVAR,Descend(cIND))
      ELSE
         oARQ:createindex(cVAR,cIND)
      ENDIF
   ENDIF
NEXT X
oARQ:CLOSE()
oPROGWIN:EndDialog()
RETU .T.

FUNCTION PACKDBF(cARQ,cDRIVER)
LOCAL oARQ AS DBSERVER
IF ValType(cDRIVER)<>"C"
   cDRIVER:="DBFCDX"	
ENDIF	
oARQ:=DBSERVER{cARQ,.F.,,cDRIVER}	
IF oARQ:Used
   oARQ:PACK()
   oARQ:CLOSE()
ENDIF	

FUNCTION ZERADBF(cARQ,cDRIVER)
LOCAL oARQ AS DBSERVER
IF ValType(cDRIVER)<>"C"
   cDRIVER:="DBFCDX"	
ENDIF	
oARQ:=DBSERVER{cARQ,.F.,,cDRIVER}	
IF oARQ:Used
   oARQ:Zap()	
   oARQ:PACK()
   oARQ:CLOSE()
ENDIF	

FUNCTION ZERADBFREDE(cARQ)
LOCAL aDAD AS ARRAY
LOCAL oARQ AS USEREDE
aDAD:={zCURINI,cARQ+".DBF",zCURDIR}
oARQ:=USEREDE{aDAD,.F.} //Exclusivo
IF oARQ:nERRO=0
   oARQ:ZAP()
   oARQ:PACK()
   oARQ:CLOSE()
ENDIF


