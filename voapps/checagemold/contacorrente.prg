FUNC CALCDIG(n1,n2)
LOCAL eRETU
IF ValType(N2)="C"
   N2:=Val(N2)
ENDIF
eRETU:=N1*N2
eRETU:=StrZero(eRETU)
eRETU:=Right(eRETU,1)
eRETU:=Val(eRETU)
RETU eRETU





FUNC CHECKCTA(cBANCO,cAGENCIA,cCONTA)
LOCAL eTOT:=0
LOCAL nFIM,nINI,X,nRES
IF Empty( cBANCO ) .OR. Empty(cAGENCIA) .OR. Empty(CCONTa)
   alert( "Algum Campo  Não Informado" )
   RETU .F.
ENDIF
//IF LastKey()=K_UP.OR.LastKey()=K_DOWN
//   RETU .T.
//ENDIF
IF ValType(cBANCO)="N"
   cBANCO:=StrZero(cBANCO,3)
ENDIF
IF cBANCO <> "033"  .AND. cBANCO <> "237"  .AND. cBANCO<>"341"
   RETU .T.
ENDIF
//Ajustando Conta
cCONTA   := StrTran(cCONTA  ," ","")
cCONTA   := TIRAOUT(cCONTA)
//Ajustando Agencia
cAGENCIA := StrTran(cAGENCIA," ","")
cAGENCIA := TIRAOUT(cAGENCIA)
DO CASE
   CASE cBANCO="033"
        IF Len(cCONTA) <> 9
           alert("Quantidade de Digitos da Conta Diferente de 9")
           RETU .F.
        ENDIF
        cAGENCIA := Right(cAGENCIA,3)
        eTOT     +=CALCDIG(7,SubStr(cAGENCIA,1,1))
        eTOT     +=CALCDIG(3,SubStr(cAGENCIA,2,1))
        eTOT     +=CALCDIG(1,SubStr(cAGENCIA,3,1))
        eTOT     +=CALCDIG(9,SubStr(cCONTA,1,1))
        eTOT     +=CALCDIG(7,SubStr(cCONTA,2,1))
        eTOT     +=CALCDIG(1,SubStr(cCONTA,3,1))
        eTOT     +=CALCDIG(3,SubStr(cCONTA,4,1))
        eTOT     +=CALCDIG(1,SubStr(cCONTA,5,1))
        eTOT     +=CALCDIG(9,SubStr(cCONTA,6,1))
        eTOT     +=CALCDIG(7,SubStr(cCONTA,7,1))
        eTOT     +=CALCDIG(3,SubStr(cCONTA,8,1))
        eTOT     :=StrZero(eTOT)
        eTOT     :=Right(eTOT,1)
        eTOT     :=IF(Val(eTOT)>0,10-Val(eTOT),0)
        IF eTOT <> Val(SubStr(cCONTA,9,1))
           alert("Checagem da Conta nao Confere")
           RETU .F.
        ENDIF
   CASE cBANCO="341"
        IF (DAC10(cAGENCIA+Left(cCONTA,5)) != Right(cCONTA,1))
           alert("Checagem da Conta nao Confere")
           RETU .F.
        ENDIF
   CASE cBANCO="237"
        eTOT:=0
        nFIM:=Len(cCONTA)
        nINI:=nFIM
        nFIM--
        FOR X:=1 TO nFIM
            eTOT+=nINI*Val(SubStr(cCONTA,X,1))
            nINI--
        NEXT X
        nRES:=eTOT%11
        nRES:=11-nRES
        nRES:=IF(nRES=10,"P",Str(nRES,1))
        IF nRES<>Right(cCONTA,1)
           alert("Digito de Controle nao confere")
           RETU .F.
        ENDIF
ENDCASE
RETU .T.


FUNCTION DAC10(Arg1)
LOCAL cnumero, ninicio, ntotal, ccpoaux, x
ninicio:= Len(AllTrim(Arg1)) + 1
ntotal:= 0
IF (ninicio < 2)
    ninicio:= 2
ENDIF
ccpoaux:= "0" + AllTrim(Arg1)
FOR x:= ninicio TO 1 STEP -2
    cnumero:= SubStr(ccpoaux, x, 1)
    ntotal:= ntotal + At(cnumero, "516273849")
    ntotal:= ntotal + Val(SubStr(ccpoaux, x - 1, 1))
NEXT
RETURN AllTrim(Str(At(SubStr(Str(ntotal, 3), 3, 1), "987654321")))





