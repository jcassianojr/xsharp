CLASS ZBUSCA
	EXPORT cBUSCA AS STRING
  EXPORT lMES:=.F. AS LOGIC
  EXPORT lOK:=.F. AS LOGIC


CONSTRUCTOR(oOWNER,cCABECARIO,cTITULO,cVALOR,lMES) 
LOCAL aRETU AS ARRAY
SELF:lOK:=.F.
SELF:cBUSCA:=""
SELF:lmes:=.t.
aRETU:={.F.,"",""}
IF ValType(cCABECARIO)<>"C"
   cCABECARIO:=""	
ENDIF
IF ValType(cTITULO)<>"C"
  cTITULO := ""
ENDIF
IF ValType(cVALOR)<>"C"
   cVALOR:= ""
ENDIF
IF ValType(lMES)="L"
   SELF:LMES := LMES
ENDIF

aRETU:=FabInputBox(cCABECARIO,cTITULO,cVALOR)


IF aRETU[1]
   SELF:cBUSCA:=ARETU[2]
   SELF:lOK:=.T.
   IF SELF:lMES
   	  alert("Valor nao Preenchido")
   ENDIF	
ELSE
   IF SELF:lMES
   	  alert("Prenchimento cancelado")
   ENDIF	
ENDIF	



	
	



END CLASS
