CLASS USEREDE INHERIT MYDBSERVER
EXPORT nERRO AS BYTE


CONSTRUCTOR(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM) 
LOCAL cCAM,cVAR AS STRING
LOCAL nIND,X AS BYTE
LOCAL oTB AS TEXTBOX
nERRO:=0
//aCOM mes,ano,empresa

//Checa Parametros
IF IsNil(lShareMode)
    lShareMode := .T.
ENDIF
IF IsNil(lReadOnlyMode)
     lReadOnlyMode:= .F.
ENDIF
IF IsNil(cDriver)
   cDRIVER:=PEGINIVAL(aDAD[1],aDAD[2],"DRIVER")	
ENDIF	
IF IsNil(cDriver) .OR. Empty(cDRIVER)
    cDriver := "DBFCDX"
ENDIF
IF ValType(aCOM)#"A"
   aCOM:={1,1,1}
ENDIF	

//Acha o Caminho
cCAM:=PEGINIVAL(aDAD[1],aDAD[2],"CAMINHO")
IF IsNil(cCAM)
   cCAM:=aDAD[3]
ENDIF
cCAM:=CAMINEX(cCAM,aCOM[1],aCOM[2],aCOM[3])

//Abra o Banco de Dados
cVAR:=cCAM+aDAD[2]
IF ! File(cVAR)
     Otb:=TEXTBOX{,"Erro","Falta Arquivo de Dados: "+Cvar}
     Otb:show()
     nERRO:=1
     RETU SELF
ENDIF
SUPER(cVAR,lShareMode, lReadOnlyMode, cDriver)


//Abre os Indices
cVAR:=PEGINIVAL(aDAD[1],aDAD[2],"NUMMAINTAINED")
nIND:=Val(cVAR)
IF nIND>0
   IF cDRIVER="DBFCDX"
      nIND:=1 //Somente um Indice	
    ENDIF
	FOR X:=0 TO nIND-1
		cVAR:=cCAM+PEGINIVAL(aDAD[1],aDAD[2],"MAINTAIN"+StrZero(X,1))
		IF ! File(cVAR)
         Otb:=TEXTBOX{,"Erro","Falta Arquivo de Indice: "+Cvar}
         Otb:show()
         nERRO:=2
         RETU SELF
      ENDIF
      SELF:SetIndex(cVAR)
	NEXT X
ENDIF

//Encerra
RETU SELF









END CLASS
