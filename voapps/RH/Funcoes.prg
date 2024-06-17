CLASS USEfolha INHERIT DBSERVER
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

AltD()
//Acha o Caminho
//IF Empty(zDIR)
//   zDIR:=PEGINIVAL(ZCURINI,"PATH","FOLHA")
//ENDIF
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
FUNC PEGESC(nESCOLA)
LOCAL aRETU:={.F.,""}
LOCAL oARQ AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF IsNil(nESCOLA)
   RETU aRETU
ENDIF
aDAD:={zCURINI,"CUREMP.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oARQ:=USEREDE{aDAD,,,,aCOM}
IF oARQ:nERRO=0
   oARQ:GOTOP()
   IF oARQ:SEEK(nESCOLA)
      aRETU[1]:=.T.
      aRETU[2]:=oARQ:FIELDGET("NOME")
   ENDIF
   oARQ:CLOSE()
ENDIF
RETU aRETU


FUNC PEGPRO(cCODIGO)
LOCAL aRETU:={.F.,"",""}
LOCAL aDAD,aCOM AS ARRAY
LOCAL oARQ AS USEREDE
IF IsNil(cCODIGO)
   RETU aRETU
ENDIF
aDAD:={zCURINI,"PROCEDIM.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oARQ:=USEREDE{aDAD,,,,aCOM}
IF oARQ:nERRO=0
   oARQ:GOTOP()
    IF oARQ:SEEK(cCODIGO)
       aRETU[1]:=.T.
       aRETU[2]:=oARQ:FIELDGET("DESCUR")
       aRETU[3]:=oARQ:FIELDGET("TIPO")
    ENDIF
    oARQ:CLOSE()
ENDIF
RETU aRETU

