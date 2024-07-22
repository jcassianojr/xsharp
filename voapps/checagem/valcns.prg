FUNCTION valcns(cCNS,lMES)
LOCAL X,soma,resto,dv
IF ValType(lMES)#"L"
   lMES:=.T.
ENDIF
ZNERRO:=0
ZERRO:=""
cCNS:=TIRAOUT(cCNS)
IF Empty( cCNS )
   ZERRO:= "Numero cns Nao Informado(em Branco)"
   ZNERRO:=1
   IF lMES
      alert(ZERRO)
   ENDIF
   RETU .F.
ENDIF
IF Len(AllTrim(cCNS))<>15
   ZERRO:='CNS nao tem 15 digitos '+Str(Len(AllTrim(cCNS)),0)
   ZNERRO:=2
   IF lMES
      alert(ZERRO)
      RETU .F.
   ENDIF
ENDIF
IF SubStr(cCNS,1,1) $ "789"
   soma:=0
   FOR x:=1 TO 15
       soma+=Val(SubStr(ccns,X,1))*(16-x)
   NEXT x
   resto := Mod(soma,11)
	IF resto <> 0
      ZERRO:='CNS invalido'
      ZNERRO:=3
      IF lMES
         alert(ZERRO)
      ENDIF
		RETURN .f.
	ELSE
	   RETURN .t.
   ENDIF
ELSE
   soma:=0
   FOR x:=1 TO 11
       soma+=Val(SubStr(ccns,X,1))*(16-x)
   NEXT x
   resto := Mod(soma,11)
   dv     := 11 - resto
   IF dv = 11
      dv:= 0
   ENDIF
   IF dv = 10
      soma+=2
      resto:=Mod(soma,11)
      dv  := 11 - resto
      IF cCNS<> SubStr(cCNS,1,11) + '001' + Str( dv ,1)
         ZERRO:='CNS invalido'
         ZNERRO:=3
         IF lMES
            alert(ZERRO)
         ENDIF
	   	RETURN .f.
      ENDIF
   ELSE
      IF ccns<> SubStr(cCNS,1,11) + '000' + Str( dv ,1)
        ZERRO:='CNS invalido'
        ZNERRO:=3
        IF lMES
           alert(ZERRO)
        ENDIF

	     RETURN .f.
      ENDIF
   ENDIF
ENDIF
RETURN .t.


