FUNCTION CheckTitulo(NUMERO,lMES)
LOCAL DV1
LOCAL DV2
LOCAL resto
LOCAL resto2
LOCAL cTITULO


IF ValType(lMES)#"L"
   lMES:=.T.
ENDIF
cTITULO:=Strval(NUMERO)
cTITULO:=AllTrim(TIRAOUT(cTITULO))
IF Len(cTITULO)<>12  .OR. Len(cTITULO)<>13
   ZNERRO:=4
   ZERRO:="Titulo nao tem 12 ou 13 digitos"
ENDIF

//ajusta titulo de 12 digitos para 13 digitos=SP/MG
    IF ValType(NUMERO)="N"
        Numero := StrZero(NUMERO,13,0)
    ELSE
        NUMERO :=AllTrim(NUMERO)
    ENDIF
    IF Len(NUMERO)<13
       NUMERO:=Replicate("0", 13-Len(NUMERO))+NUMERO
    ENDIF

ZNERRO:=0
ZERRO:=""

IF Val(SubStr(Numero, 10, 2))>28
   ZNERRO:=3
   ZERRO:="Titulo Digito do Estado Invalido "+SubStr(Numero, 10, 2)
ENDIF



    DV1 := ((Val(SubStr(Numero, 1, 1)) * 2) + ;
            (Val(SubStr(Numero, 2, 1)) * 9) +  ;
            (Val(SubStr(Numero, 3, 1)) * 8) + ;
            (Val(SubStr(Numero, 4, 1)) * 7) + ;
            (Val(SubStr(Numero, 5, 1)) * 6) + ;
            (Val(SubStr(Numero, 6, 1)) * 5) + ;
            (Val(SubStr(Numero, 7, 1)) * 4) + ;
            (Val(SubStr(Numero, 8, 1)) * 3) + ;
            (Val(SubStr(Numero, 9, 1)) * 2))

    resto := Mod(DV1,11)

    IF resto = 1
        DV1 := 0
    ELSE
        IF resto = 0
            IF SubStr(Numero, 10, 2) = "01"  .Or. SubStr(numero, 10, 2) = "02"
                DV1 := 1
            ELSE
                DV1 := 0
            END IF
        ELSE
            DV1 := 11 - resto
        END IF
    END IF

    //Aplica DV da UF
    DV2 := ((Val(SubStr(Numero, 10, 1)) * 4) + (Val(SubStr(Numero, 11, 1)) * 3) + (DV1 * 2))
    Resto2 := Mod(DV2,11)

    IF Resto2 = 1
        DV2 := 0
    ELSE
        IF Resto2 = 0
            IF SubStr(Numero, 10, 2) = "01"   .or. SubStr(Numero, 10, 2) = "02"
                DV2 := 1
            ELSE
                DV2 := 0
            END IF
        ELSE
            DV2 := 11 - Resto2
        END IF
    END IF

    //checa dv digitos 12 e 13
    IF SubStr(Numero, 12, 2) = Str(DV1,1) + Str(DV2,1)   
       NOP
    ELSE	
       ZNERRO:=2
       zerro:="Digitos de Controle titulo Nao Confere sugerido: " +SubStr(numero,1,11)+"/"+ Str(DV1,1) + Str(DV2,1)
    END IF
IF znerro>0
   IF Lmes
      alert(zerro)
   ENDIF
   RETURN .f.
ENDIF
RETURN .t.


FUNCTION CheckTitulo2(NUMERO,lMES)
    LOCAL DV1  AS INT
    LOCAL DV2 AS INT
//    LOCAL I           AS WORD
    LOCAL resto AS INT
    LOCAL resto2 AS INT
    LOCAL lRETU AS LOGIC

    IF ValType(lMES)#"L"
       lMES:=.T.
    ENDIF

    IF ValType(NUMERO)="N"
        Numero := StrZero(NUMERO,13,0)
    ELSE
        NUMERO :=AllTrim(NUMERO)
    ENDIF
    IF Len(NUMERO)<13
       NUMERO:=Replicate("0", 13-Len(NUMERO))+NUMERO
    ENDIF

    Lretu:=.f.
    zerro:=""


    DV1 := ((Val(SubStr(Numero, 1, 1)) * 2) + ;
            (Val(SubStr(Numero, 2, 1)) * 9) +  ;
            (Val(SubStr(Numero, 3, 1)) * 8) + ;
            (Val(SubStr(Numero, 4, 1)) * 7) + ;
            (Val(SubStr(Numero, 5, 1)) * 6) + ;
            (Val(SubStr(Numero, 6, 1)) * 5) + ;
            (Val(SubStr(Numero, 7, 1)) * 4) + ;
            (Val(SubStr(Numero, 8, 1)) * 3) + ;
            (Val(SubStr(Numero, 9, 1)) * 2))

    resto := Mod(DV1,11)

    IF resto = 1
        DV1 := 0
    ELSE
        IF resto = 0
            IF SubStr(Numero, 10, 2) = "01"  .Or. SubStr(numero, 10, 2) = "02"
                DV1 := 1
            ELSE
                DV1 := 0
            END IF
        ELSE
            DV1 := 11 - resto
        END IF
    END IF

    DV2 := ((Val(SubStr(Numero, 10, 1)) * 4) + (Val(SubStr(Numero, 11, 1)) * 3) + (DV1 * 2))
    Resto2 := Mod(DV2,11)

    IF Resto2 = 1
        DV2 := 0
    ELSE
        IF Resto2 = 0
            IF SubStr(Numero, 10, 2) = "01"   .or. SubStr(Numero, 10, 2) = "02"
                DV2 := 1
            ELSE
                DV2 := 0
            END IF
        ELSE
            DV2 := 11 - Resto2
        END IF
    END IF

    IF SubStr(Numero, 12, 2) = Str(DV1,1) + Str(DV2,1)
  	   lretu := .t.
    ELSE	
       zerro:="Digitos de Controle titulo Nao Confere sugerido: " +SubStr(numero,1,11)+"/"+ Str(DV1,1) + Str(DV2,1)
       IF Lmes
       	  alert(zerro)
       ENDIF
    END IF


RETU lRETU

FUNCTION TituloUF(cTITULO)
LOCAL cRETU,cUF AS STRING
LOCAL aCOD,aUF AS ARRAY
LOCAL nPOS AS DWORD
IF ValType(CTITULO)="N"
   CTITULO := StrZero(CTITULO,13,0)
ELSE
   CTITULO :=AllTrim(CTITULO)
ENDIF
IF Len(CTITULO)<13
   CTITULO:=Replicate("0", 13-Len(CTITULO))+CTITULO
ENDIF
aCOD:={'01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28'}
aUF :={'SP','MG','RJ','RS','BA','PR','CE','PE','SC','GO','MA','PB','PA','ES','PI','RN','AL','MT','MS','DF','SE','AM','RO','AC','AP','RR','TO','EX'}
cRETU:=''
cUF:=SubStr(cTITULO,10,2)       // UF dig 9-10 porem padronizando para treze digitos passar para a posicao dez
nPOS:=AScan(aCOD,cUF)
IF nPOS>0	
   cRETU:=aUF[nPOS]
ENDIF	
RETU cRETU	



