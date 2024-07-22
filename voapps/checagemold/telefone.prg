FUNCTION formataTel(cNUMERO)
cNUMERO:=AllTrim(cNUMERO)
cNUMERO:=StrTran(cNUMERO," ","")
IF SubStr(cNUMERO, 1, 4) = "0300"  .Or. SubStr(cNUMERO, 1, 4) = "0800"  .OR. SubStr(cNUMERO,1,2)="55" .OR. SubStr(cNUMERO,1,1)="+"
   //Internacional e atendimentos
   RETU cNUMERO
ENDIF
IF SubStr(cNUMERO, 1, 1) = "("  .And. SubStr(cNUMERO, 4, 1) = ")"  //(99)12345678
   cNUMERO := SubStr(cNUMERO, 1, 4) + FORTEL2(SubStr(cNUMERO, 5))
END IF
IF SubStr(cNUMERO, 3, 1) = "-"  //99-12345678
   cNUMERO := "(" + SubStr(cNUMERO, 1, 2) + ")" + FORTEL2(SubStr(cNUMERO, 4))
END IF
IF SubStr(cNUMERO, 3, 1) = ","  //99,12345678
   cNUMERO := "(" + SubStr(cNUMERO, 1, 2) + ")" + FORTEL2(SubStr(cNUMERO, 4))
END IF
IF SubStr(cNUMERO, 3, 1) = " "  //99 12345678
   cNUMERO := "(" + SubStr(cNUMERO, 1, 2) + ")" + FORTEL2(SubStr(cNUMERO, 4))
END IF
IF SubStr(cNUMERO, 4, 1) = "-"  .And. SubStr(cNUMERO, 1, 1) = "0"  //099-12345678
   cNUMERO := "(" + SubStr(cNUMERO, 2, 2) + ")" + FORTEL2(SubStr(cNUMERO, 5))
END IF
IF SubStr(cNUMERO, 4, 1) = " "  .And. SubStr(cNUMERO, 1, 1) = "0"  //099 12345678
   cNUMERO := "(" + SubStr(cNUMERO, 2, 2) + ")" + FORTEL2(SubStr(cNUMERO, 5))
END IF
IF SubStr(cNUMERO, 4, 1) = "-"  .And. SubStr(cNUMERO, 1, 1) = "0"  //99-12345678
   cNUMERO := "(" + SubStr(cNUMERO, 2, 2) + ")" + FORTEL2(SubStr(cNUMERO, 5))
END IF
IF SubStr(cNUMERO, 1, 1) = "("  .And. SubStr(cNUMERO, 2, 1) = "0"  .And. SubStr(cNUMERO, 5, 1) = ")" //(099)12345678
   cNUMERO := "(" + SubStr(cNUMERO, 3, 2) + ")" + FORTEL2(SubStr(cNUMERO, 6))
END IF
IF At("(",cNUMERO)=0  .AND. At("-",cNUMERO)=0       //somente numeros
   DO CASE
      CASE Len(cNUMERO)=10
		  cNUMERO:="("+Left(cNUMERO,2)+")"+SubStr(cNUMERO,3,4)+"-"+SubStr(cNUMERO,7)
	  CASE Len(cNUMERO)=11
			cNUMERO:="("+Left(cNUMERO,2)+")"+SubStr(cNUMERO,3,5)+"-"+SubStr(cNUMERO,8)
      CASE Len(cNUMERO)=9  .OR.  Len(cNUMERO)=8  .OR. Len(cNUMERO)=7
          cNUMERO:=FORTEL2(cNUMERO)
   ENDCASE	
ENDIF
RETU cNUMERO




FUNCTION FORTEL2(cFONE)
cFONE:=AllTrim(TIRAOUT(cFONE))
DO CASE
   CASE Len(cFONE)=9 //celular com 9 a frente
        cFONE:=SubStr(cFONE,1,5)+"-"+SubStr(cFONE,6)
   CASE Len(cFONE)=8
        cFONE:=SubStr(cFONE,1,4)+"-"+SubStr(cFONE,5)
   CASE Len(cFONE)=7
       cFONE:=" "+SubStr(cFONE,1,3)+"-"+SubStr(cFONE,4)
ENDCASE
RETU cFONE

FUNCTION PEGDDD(cTEL)
LOCAL cPEGDDD
cTEL := formataTel(cTEL)
cPEGDDD := ""
IF At("(",cTEl ) > 0
   cPEGDDD := SubStr(cTEL, 2, 2)
ENDIF
RETU cPEGDDD

FUNCTION PEGPREF(cTEL,lCEL)
LOCAL cPEGREF
//cTEL = tem que ser so o numero telefone sem o ddd antes de chamar usar pegtel se necessario
cPEGREF := ""
IF ValType(lCEL)<>"L"
   lCEL:=.T.
ENDIF
IF At("-",cTEL) > 0
   cPEGREF := SubStr(cTEL, 1, At("-",cTEL) - 1)
   IF lCEL
	   IF Len(cPEGREF)=5  .AND. Left(cPEGREF,1)="9" //Celular com 9
	   	  cPEGREF:=SubStr(cPEGREF,2)
	   ENDIF
   ENDIF	
END IF
RETU cPEGREF


FUNCTION PEGTEL(cTEL)
LOCAL cPEGTEL
cTEL := formataTel(cTEL)
cPEGTEL := cTEL
IF At("(",cTEl ) > 0
   cPEGTEL := SubStr(cTEL, 5)
ENDIF
RETU cPEGTEL


