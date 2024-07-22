FUNCTION CheckRG(Valor, lMES,cTIPO,dDATANASC,cUF )
LOCAL d
LOCAL soma
LOCAL nPOS
LOCAL cDAC
LOCAL x
LOCAL aPESOS
LOCAL P1

IF ValType(lMES)#"L"
   lmes:=.T.
ENDIF
ZDAC:=" "
ZNERRO:=0
ZERRO:=""
Valor:= StrTran(Valor,".","")  //tiraout tambem tira - nao pode ser usada
IF Valor = "ISENTO"
   RETURN .T.
ENDIF
IF Len(Valor) = 0
   znerro:=7
   zerro:="RG/RNE/RIC em branco"
ENDIF
IF (ValType(cTIPO)="C"  .AND. cTIPO="RNE" ) .OR. At("RNE",valor) >0
   RETURN .t.
ENDIF
IF At("RIC",valor) >0
   cTIPO:="RIC"
   valor:=StrTran(valor,'RIC','')
ENDIF
IF Len(valor)=11
   cTIPO:="RIC"
ENDIF
IF ValType(cTIPO)<>'C'
   cTIPO:="RG"
ENDIF
FOR X := 0 TO 9
   P1:=TIRAOUT(valor)
   IF p1 = Repl( Str( X, 1 ), 11 )
      znerro:=6
      zerro:="RG Invalido - Sequencia Repetitiva de " + Str( X, 1 )
   ENDIF
NEXT X
nPOS := At("-",Valor)
IF nPOS = 0
   cDAC:=" "
ELSE
   cDAC := SubStr(Valor, nPOS + 1, 1)
   Valor := SubStr(Valor, 1, nPOS - 1)
END IF
Valor := Str(Val(Valor))
IF Len(AllTrim(Valor)) <= 7  .AND. cTIPO='RG'  .AND. (Empty(CUF)  .OR. cUF="SP")
   IF ValType(dDATANASC)<>"D"  .OR. dDATANASC>CToD('31/12/1990')
	   zerro:="RG com Menos de 7 Digitos"
	   znerro:=3
	 ENDIF
END IF
IF Len(AllTrim(Valor)) >9   .AND. cTIPO='RG'  .AND. (Empty(CUF)  .OR. cUF="SP")
   zerro:="RG com Mais de 9 Digitos"
   znerro:=8
END IF
IF cTIPO='RIC'
   IF Len(AllTrim(Valor)) <>11
      zerro:="RIC nao tem 11 Digitos"
      znerro:=9
   ELSE
     aPESOS:={8,9,2,3,4,5,6,7,8,9}
     soma:=0
     FOR X:=1 TO 10
        soma+=Val(SubStr(valor,X,1))*aPESOS[X]
     NEXT X
     d := Mod(soma,11)
     IF d=10
        d:=0
     ENDIF
     IF d <> Val(SubStr(valor,11,1))
        zDAC:=StrZero(D,1,0)
        zerro:="Digito de Controle RIC "+cDAC+" Nao Confere sugerido: " +zDAC
        znerro:=10
     ENDIF
   ENDIF
END IF
IF ZNERRO=0   .AND. cTIPO='RG'  .AND. Len(VALOR)=8
   Valor := StrZero(Val(Valor), 8)
   SOMA := Val(SubStr(Valor, 1, 1)) * 9
   SOMA += Val(SubStr(Valor, 2, 1)) * 8
   SOMA += Val(SubStr(Valor, 3, 1)) * 7
   SOMA += Val(SubStr(Valor, 4, 1)) * 6
   SOMA += Val(SubStr(Valor, 5, 1)) * 5
   SOMA += Val(SubStr(Valor, 6, 1)) * 4
   SOMA += Val(SubStr(Valor, 7, 1)) * 3
   SOMA += Val(SubStr(Valor, 8, 1)) * 2
   d := soma - (Floor( soma / 11 ) * 11)
   IF cDAC = "X"  .Or. cDAC = "x"  .OR. cDAC=" "
      IF D=10
     	  RETURN .T.
      ELSE
         zDAC:=StrZero(D,1,0)
    	   znerro:=5
         zerro:="Digito de Controle RG "+cDAC+" Nao Confere sugerido: " +zDAC
      ENDIF
  ELSE
    IF d = Val(cDAC)  .Or. d = 0
    ELSE
       IF d=10
       	  zDAC:="X"
          zerro:="Digito de Controle RG Nao Confere sugerido: X"
       ELSE
     	    zDAC:=StrZero(D,1,0)
          zerro:="Digito de Controle RG Nao Confere sugerido: " +zDAC
       ENDIF
       znerro:=4
    END IF
  ENDIF
ENDIF
IF ZNERRO>0
   IF lMES
      alert(zerro)
   ENDIF
   RETURN .f.
ENDIF
RETURN .t.


FUNCTION FormataRG(Valor,cTIPO)
LOCAL cRETU
LOCAL nPOS
LOCAL cDAC
cDAC := ""
IF ValType(cTIPO)="C"
   IF cTIPO="RNE"  .OR.  cTIPO="RIC"
      RETURN VALOR
   ENDIF
ENDIF
IF Valor = "ISENTO"  .OR. At("RNE",valor) >0  .OR. At("RIC",valor) >0 //registro nacional estrangeiro
   RETURN VALOR
END IF
valor := AllTrim(valor)
valor := Upper(valor)
nPOS := At( "-",Valor)
IF nPOS = 0
   valor := TIRAOUT(Valor)
   valor := AllTrim(valor)
   IF Len(VALOR)=9  //.and. Len(valor)<>11 //rici
	  cDAC:=SubStr(VALOR,9,1)
   	  valor:=SubStr(valor,1,8)
   ENDIF
ELSE
   cDAC := SubStr(Valor, nPOS + 1, 1)
   Valor := SubStr(Valor, 1, nPOS - 1)
   IF cDAC = "x"
      cDAC := "X"
   ENDIF
   IF cDAC <> "X" //'evita erros como -- -. -/ caracter inves de numero no dac
      cDAC := Str(Val(cDAC),1)
   END IF
END IF
valor := TIRAOUT(Valor)
valor := StrTran(valor,"x","")  //x-X
valor := StrTran(valor,"X","")  //X-X
valor := AllTrim(valor)
DO CASE
   CASE Len(VALOR)=8 //ric=11
        Valor := AllTrim(Str(Val(SubStr(Valor,1,8)),8))
        cretu := Trim(SubStr(Valor, 1, 2) + "." + SubStr(Valor, 3, 3) + "." + SubStr(Valor, 6))
   CASE Len(VALOR)=7
        Valor := AllTrim(Str(Val(SubStr(Valor,1,8)),7))
        cretu := Trim(SubStr(Valor, 1, 1) + "." + SubStr(Valor, 2, 3) + "." + SubStr(Valor, 5))
   OTHERWISE
        cRETU := VALOR
ENDCASE
IF ! Empty(cDAC)
   cretu := cretu + "-" + cDAC
END IF
IF Left(cretu, 1) = "0"
   cretu := SubStr(cretu, 2)
END IF
IF Left(cretu, 1) = "."
   cretu := SubStr(cretu, 2)
END IF
RETU cretu


