FUNC CTAFUN(cCODFUN,cCODEMP,lMES) //Conta do Funcionario,CGC sem os Sinais
//IF LastKey()=K_UP.OR.LastKey()=K_DOWN
//   RETU .T.
//ENDIF
LOCAL XSA,XFU AS STRING
LOCAL wxdv
ZNERRO:=0
IF ValType(lMES)#"L"
   lMES:=.T.
ENDIF	
IF Empty( cCODFUN ) .OR. Empty(CCODEMP)
   ZERRO:= "Numero OU CGC Não Informado"
   ZNERRO:=1
   IF lMES
      alert(ZERRO)
   ENDIF
   RETU .F.
ENDIF
Ccodemp:=TIRAOUT(Ccodemp)
IF Empty(cCODFUN)
   ZERRO:="Voce nAo preencheu o codigo"
   ZNERRO:=2
   IF lMES
      alert(ZERRO)
   ENDIF
   RETU .T.
ENDIF
IF Empty(cCODEMP)
   ZERRO:="Voce nAo preencheu o CGC"
   ZNERRO:=3
   IF lMES
      alert(ZERRO)
   ENDIF
   RETU .T.
ENDIF
IF (! Empty(cCODFUN))  .AND. ( ! Empty(cCODEMP))
   xsa:= SubStr(cCODEMP,7,3)
   xfu:= SubStr(cCODFUN,1,4)
   IF (Val(xsa) != 0)
      IF (Val(xfu) != 0)
         wxdv:= 1
      ELSE
         wxdv:= 2
      ENDIF
   ELSEIF (Val(xfu) != 0)
      wxdv:= 3
   ELSE
      wxdv:= 4
   ENDIF
   IF ! DVFU(wxdv,cCODFUN,cCODEMP)
      ZERRO:="C¢digo do empregado invalido"
      ZNERRO:=4
   	  IF lMES
         alert(ZERRO)
      ENDIF
      RETURN .F.
   ENDIF
ENDIF
RETU .T.


FUNCTION DVFU(wx,cCODFUN,cCODEMP)
LOCAL FGTSTEMP,wdvfu1,wdvfu2,WFUNC AS STRING
LOCAL WMODFU1,WMODFU2,SDVFU1,SDVFU2,J,K,L,I,wrestfu1,wrestfu2,wdigfu1,wdigfu2
fgtstemp:= Space(1)+ccodemp+Space(25)+ccodfun+Space(201)
wmodfu1:= wmodfu2:= 2
sdvfu1:= sdvfu2:= 0
IF Empty(cCODFUN)
   RETURN .F.
ENDIF	
   wdvfu1:= SubStr(fgtstemp, 50, 1)
   wdvfu2:= SubStr(fgtstemp, 51, 1)
   DO CASE
      CASE wx == 1
           j:= 23
           wfunc:= SubStr(fgtstemp, 2, 14) + SubStr(fgtstemp, 41, 11)
      CASE wx == 2
           j:= 19
           wfunc:= SubStr(fgtstemp, 2, 14) + SubStr(fgtstemp, 45, 7)
      CASE wx == 3
           j:= 20
           wfunc:= SubStr(fgtstemp, 2, 6) + SubStr(fgtstemp, 11, 5) +            SubStr(fgtstemp, 41, 11)
      CASE wx == 4
           j:= 16
           wfunc:= SubStr(fgtstemp, 2, 6) + SubStr(fgtstemp, 11, 5) +            SubStr(fgtstemp, 45, 7)
      OTHERWISE
           RETURN .F.
   ENDCASE
   k:= j + 1
   l:= j + 2
   FOR i:= 1 TO j
       sdvfu1:= sdvfu1 + wmodfu1 * Val(SubStr(wfunc, k - i, 1))
       wmodfu1:= iif(wmodfu1 < 7, wmodfu1 + 1, 2)
   NEXT
   wrestfu1:= Mod(sdvfu1, 11)
   wdigfu1:= iif(wrestfu1 == 0   .OR. wrestfu1 == 1, 0, 11 -    wrestfu1)
   FOR i:= 1 TO k
       sdvfu2:= sdvfu2 + wmodfu2 * Val(SubStr(wfunc, l - i, 1))
       wmodfu2:= iif(wmodfu2 < 7, wmodfu2 + 1, 2)
   NEXT
   wrestfu2:= Mod(sdvfu2, 11)
   wdigfu2:= iif(wrestfu2 == 0   .OR. wrestfu2 == 1, 0, 11 -    wrestfu2)
   RETURN iif(Str(wdigfu1, 1) == wdvfu1   .AND. Str(wdigfu2, 1) ==    wdvfu2, .T., .F.)




