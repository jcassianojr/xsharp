CLASS USEMANA5 INHERIT MYDBSERVER
EXPORT nERRO AS BYTE

CONSTRUCTOR(aDAD, lShareMode, lReadOnlyMode, cDriver, aHidden) 
LOCAL cCAM,cVAR,cDBE AS STRING
LOCAL nIND,X AS DWORD
LOCAL oTB AS TEXTBOX
LOCAL aIND,aRETU AS ARRAY
nERRO:=0
//Checa Parametros
IF IsNil(lShareMode)
    lShareMode := .T.
ENDIF
IF IsNil(lReadOnlyMode)
   lReadOnlyMode:= .F.
ENDIF
IF IsNil(cDriver)
   cDriver := "DBFNTX"
ENDIF
//Acha o Caminho
aRETU:=PEGCAMDRIVER(aDAD)
cCAM:=aRETU[1]
IF ! Empty(aRETU[2])
   cDRIVER:=AllTrim(aRETU[2])
ENDIF	
IF cCAM="_"
   Otb:=TEXTBOX{,"Erro","Caminho Invalido Para "+aDAD[2]}
   Otb:show()
	nERRO:=3
	RETU SELF
ENDIF	
//Abra o Banco de Dados
cVAR:=cCAM+aDAD[2]+".DBF"     

//Cria o dbf com o dbe
IF ! File(cVAR)
   cDBE:=cCAM+aDAD[2]+".DBE"
   dbecriadbf(cDBE,cCAM)
ENDIF

IF ! File(cVAR)
     Otb:=TEXTBOX{,"Erro","Falta Arquivo: "+Cvar}
     Otb:show()
     nERRO:=1
     RETU SELF
ENDIF
SUPER(cVAR,lShareMode, lReadOnlyMode, cDriver, aHidden)
IF cDRIVER<>"DBFCDX"
   //Abre os Indices
   aIND:=PEGNTX(aDAD)
   nIND:=Len(aIND)
   FOR X := 1 TO nIND
	   cVAR:=cCAM+aIND[X][1]+".NTX"
       IF ! File(cVAR)
          Otb:=TEXTBOX{,"Erro","Falta Arquivo: "+Cvar}
          Otb:show()
          nERRO:=2
          RETU SELF
      ENDIF
      SELF:SetIndex(cVAR)
    NEXT X
ELSE
   cVAR:=cCAM+aDAD[2]+".CDX"	
   SELF:SetIndex(cVAR)
ENDIF
RETU SELF


END CLASS
