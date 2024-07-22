FUNC valpis(wk_pis,lMES)
LOCAL VER_DV AS LOGIC
LOCAL ACUM1,ACUM2,X,NUM,RES,DV
LOCAL NUMERA AS STRING
IF ValType(lMES)#"L"
   lMES:=.T.
ENDIF	
ZNERRO:=0
IF Empty( wk_pis )
   ZERRO:= "Numero Não Informado"
   ZNERRO:=1
   IF lMES
      alert(ZERRO)
   ENDIF
   RETU .F.
ENDIF
ver_dv := .F.
IF SubStr (wk_pis, 1, 1) <> '1'  .and. SubStr (wk_pis, 1, 1) <> '2'
   ZERRO:='Codigo DO pis nao comeca com 1 ou 2'
   ZNERRO:=2
   IF lMES
      alert(ZERRO)
      RETU .F.
   ENDIF
ENDIF
IF SubStr (wk_pis, 1, 3) >= '109'  .and. SubStr (wk_pis, 1, 3) <= '119'
   ZERRO:='Codigo pertence a contribunte individual da previdencia'
   ZNERRO:=3
   IF lMES
      alert(ZERRO)
      RETU .F.
   ENDIF
ENDIF
IF Len(AllTrim(wk_pis))<>11
   ZERRO:='PIS nao tem 11 digitos '+Str(Len(AllTrim(wk_pis)),0)
   ZNERRO:=8
   IF lMES
      alert(ZERRO)
      RETU .F.
   ENDIF
ENDIF	

acum1:=acum2:=0
numera := SubStr (wk_pis, 1, 10)
FOR x := Len (numera) TO 1 STEP -1
    num := SubStr (numera, x, 1)
    acum1 := iif (x < 3, Val (num) * (4 - x), Val (num) * (12 - x))
    acum2 := acum1 + acum2
NEXT
res := Mod (acum2, 11)
IF res = 1
   ZERRO:='Codigo do pis invalido '
   ZNERRO:=4
   IF lMES
       alert(ZERRO)
   ENDIF
ELSE
   IF res = 0
      dv := 0
      IF Val (SubStr (wk_pis, 11, 1)) != dv
         ZERRO:='Codigo do pis invalido'
         ZNERRO:=5
         IF lMES
            alert(ZERRO)
         ENDIF
      ELSE
         ver_dv := .T.
      ENDIF
   ELSE
      dv := 11 - res
      IF Val (SubStr (wk_pis, 11, 1)) != dv
         ZERRO:='Codigo do pis invalido'
         ZNERRO:=6
         IF lMES
            alert(ZERRO)
         ENDIF
      ELSE
         ver_dv := .T.
      ENDIF
   ENDIF
ENDIF
RETURN ver_dv





