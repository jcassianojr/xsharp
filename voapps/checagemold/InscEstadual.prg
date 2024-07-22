FUNCTION FormataIE(Valor,cUF,cPESSOA)
LOCAL cMASK AS STRING
LOCAL Cretu AS STRING
IF ValType(cPESSOA)<>"C"
   cPESSOA:="J"
ENDIF
cRETU:=valor
Valor:= TIRAOUT(Valor)
cMASK:= ""
IF Valor = "ISENTO"   .OR. Valor = "00000000000000"
   RETU cRETU
END IF
IF cPESSOA = "F"
   RETU cRETU
END IF
IF Len(Valor) = 0
   RETU cRETU
END IF
IF cUF = "EX"  .Or. cUF = "XX"
   RETU cRETU
END IF
//| no lugar do ponto depois sofre strtarn
DO CASE
    CASE cUF="AC"
         cMASK := "00|000|000/000-00"      //"@R 99.999.999/999-99
    CASE cUF="AM"
         cMASK := "00|000|000-0"            // "@R 99.999.999-9"
    CASE cUF="AP"
         cMASK := "000000000"         // "@R 999999999"
    CASE cUF="DF"
         cMASK := "0000000000000"    // "@R 99.999999.999-99"
    //Case cUF="FN"
        //cMASK = ""
    CASE cUF="MA"
         cMASK := "00000000-0"      //"@R 999999999"
    CASE cUF="MG"
         cMASK := "0000000000000"   //"@R 999.999.999/9999"
    CASE cUF="MT"
         cMASK := "00000000000"    // "@R 9999999999-9"
    CASE cUF="PA"
         cMASK := "00|000|000-0"    // "@R 99-999999-9"
    CASE cUF="PB"
         cMASK := "00|000|000-0"   // "@R 99999999-9"
    CASE cUF="PE"
         cMASK := "00|0|000|0000000-0"   //"@R 9999999-99"
    CASE cUF="PI"
         cMASK := "000000000"      //"@R 99.999.999-9"
    CASE cUF="RN"
         cMASK := "000000000"      //"@R 99.999.999-9"
    CASE cUF="RO"
         cMASK := "00000000000000"   // "@R 999.99999-9"
    CASE cUF="RR"
         cMASK := "00|000000-0"     //"@R 99.999.999-9"
    CASE cUF="SC"
         cMASK := "000|000|000"      // "@R 999.999.999"
    CASE cUF="SP"
         cMASK := "000|000|000|000"  //"@R 999.999.999.999"
    CASE cUF="TO"
         cMASK := "00|000|000-0"       // "@R 99.99.999999-9"
    CASE cUF="AL"
         cMASK := "000000000"      // "@R 999999999"
    CASE cUF="BA"
         cMASK := "00|000|000"     //"@R 999.999-99"
    CASE cUF="CE"
         cMASK := "00|000000-0"   //"@R 99.999999-9"
    CASE cUF="ES"
         cMASK := "000|000|00-0"   // "@R 999.999.99-9"
    CASE cUF="GO"
         cMASK := "00|000000-0"    // "@R 99.999.999-9"
    CASE cUF="MS"
         cMASK := "00|000|000-0"   //"@R 99.999.999-9"
    CASE cUF="PR"
         cMASK := "00000000-00"     // "@R 999.99999-99"
    CASE cUF="RJ"
         cMASK := "00|000|000"      //"@R 99.999.99-9"
    CASE cUF="RS"
         cMASK := "000/0000000"   //"@R 999/9999999"
    CASE cUF="SE"
         cMASK := "00|000|000-0"   // "@R 99.999.999-9"
ENDCASE
IF Len(cMASK) > 0
   cRETU := Transform(valor, cMASK)
   cRETU := StrTran(CRETU, "|", ".")
END IF
RETU cRETU


FUNCTION ValidaIE_BA9(cIE)
/*
9 algarismos sendo 7 d?gitos inteiros e 2 d?gitos verificadores.
http://www.sefaz.ba.gov.br/contribuinte/informacoes_fiscais/doc_fiscal/calculodv.htm
*/
	LOCAL cStr := Left(cIE,7)
	LOCAL nMod := if(Left(cIE,1) $ "679", 11, 10)
   LOCAL nTot := 0
	LOCAL i,k
	*
   IF Len(cIE)=8
      cIE:='0'+cIE
   ENDIF
	FOR i := 1 TO 2
	    FOR k := Len(cStr) TO 1 STEP -1
	        nTot += Val(SubStr(cStr,k,1)) * ((8+i)-k)
	    NEXT
	    cStr += if(nTot%nMod < nMod-9, "0", Str(nMod-(nTot%nMod),1))
	    nTot := 0
	NEXT
	RETURN SubStr(cStr,9,1)+SubStr(cStr,8,1) == SubStr(cIE,8,2)


FUNCTION ValIE( cinsc, cUF, cPESSOA,lMES ,lOLD)  //mantida lold telas com get via macro ainda usam este parametro

//LOCAL lRETU
//LOCAL nRet
LOCAL x
LOCAL nPOS
LOCAL aUF,aTAM
LOCAL lTAM

ZNERRO:=0
ZERRO:=""



IF ValType(lMES)<>"L"
   lMES:=.T.
ENDIF
IF ValType(lOLD)<>"L"
   lOLD:=.T.
ENDIF


IF ( Empty( cinsc ) )
   ZNERRO:=1
   ZERRO :="Inscricao em Branco"
ENDIF

IF ( Empty( cUF) )
   ZNERRO:=2
   ZERRO:="Estado em Branco"
ENDIF

IF cUF = "XX"  .OR. cUF = "EX"
   IF Left( Upper( cINSC ), 5 ) = "ISENT"    .OR.  cINSC = "00000000000000"
      RETURN .T.         //Exterior
   ELSE
      ZNERRO:=3
      ZERRO:="Exterior <> Isento ou 00000000000000"
   ENDIF
ENDIF

IF Left( Upper( cINSC ), 5 ) = "ISENT" // isento isenta
   RETURN .T.
ENDIF


IF ValType( cPESSOA ) = "C"
   IF cPESSOA # "J"
      RETURN .T.      //Nao E Pessoa Juridica
   ENDIF
ENDIF


//lRETU := .F.
cINSC := AllTrim( cINSC )
cINSC := StrTran( cINSC, ".", "" )
cINSC := StrTran( cINSC, "", "" )
cINSC := StrTran( cINSC, "/", "" )
cINSC := StrTran(cINSC,'ME','')           //Micro Empresa
cINSC := StrTran(cINSC,' ','')
cINSC := StrTran(cINSC,',','')
IF ! lOLD
   cINSC := StrTran(cINSC,'P','')           //Produtor rural sp tratado pela formula
ENDIF


IF Len(cINSC)<8
   ZNERRO:=4
   ZERRO:="IE Invalido  menos de 8 digitos "
ENDIF


FOR X := 0 TO 9
   IF cINSC = Repl( Str( X, 1 ), Len(cINSC) )
      ZNERRO:=5
      ZERRO:="IE Invalido  Sequencia Repetitiva de " + Str( X, 1 )
   ENDIF
NEXT X

aUf:= { "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS",;
    "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC",;
    "SE", "SP","TO" }

aTAM:= { 13,  09,    09,   09,  09, 09, 13, 09, 09, 09, 13, 09,;
       11, 09, 09, 14, 09, 10, 08, 09, 14, 09, 10, 09,;
       09, 12, 11 }
//ba mudou 8 para 9 em 2012

nPOS:=AScan(aUF,cUF)
lTAM:=.T.
IF nPOS>0
   nPOS:=aTAM[nPOS]
   DO CASE

       CASE cUF="AC"  .AND. Len(cINSC)<> 13  .AND. Len(cINSC) <> 9 // 13 9
             lTAM:=.F.
       CASE cUF="PE"  .AND. Len(cINSC)<>9  .AND. Len(cINSC) <> 14 //9 Nova ou 14 Antiga
             lTAM:=.F.
       //Case cUF="RN" .AND. LEN(cINSC)<>9 .AND. LEN(cINSC) <> 10  //9 digitos  ou 10 digitos
       //     lTAM:=.F. verificado somente nove digitos
       CASE cUF="RO"  .AND. Len(cINSC)<>9  .AND. Len(cINSC) <> 14  //9 atual ou 14 Antiga
            lTAM:=.F.
       CASE cUF="TO"  .AND. Len(cINSC)<>9  .AND. Len(cINSC) <> 11  //9 atual ou 11 Antiga
	        lTAM:=.F.
       CASE cUF="BA"  .AND. Len(cINSC)<>8  .AND. Len(cINSC) <> 9  //8 Antiga
	        lTAM:=.F.
       CASE cUF="SP"  .AND. Len(cINSC)<>12  .AND. Len(cINSC) <> 13  //12 13='P'+IE inscricao produtor rural
	        lTAM:=.F.
			
       OTHERWISE
           IF nPOS<>Len(cINSC)
               lTAM:=.F.
           ENDIF
   ENDCASE
ENDIF
IF lMES .AND. ! lTAM
   ZNERRO:=8
   ZERRO:="Tamanho da Inscricao Invalido:"+Str(nPOS)+"/"+Str(Len(cINSC))
ENDIF

aTAM:= { "01", "24", "", "03", "", "06", "07", "", "10", "12", "", "28",;
        "", "15", "16", "18", "19", "", "", "20", "", "24", "", "25",;
         "27", "","29" }
nPOS:=AScan(aUF,cUF)
lTAM:=.T.
IF nPOS>0
   nPOS:=aTAM[nPOS]
   IF Len(nPOS)=2
       DO CASE
           CASE cUF="GO" .AND. SubStr(cINSC,1,2)<>"10" .AND. SubStr(cINSC,1,2)<>"11" .AND. SubStr(cINSC,1,2)<>"15"
                 lTAM:=.F.
           OTHERWISE
               IF nPOS<>SubStr(cINSC,1,2)
                  lTAM:=.F.
               ENDIF
       ENDCASE
   ENDIF
ENDIF
IF ! lTAM
   ZNERRO:=7
   ZERRO:="Inicio  da Inscricao Invalido:"+nPOS+"/"+SubStr(cINSC,1,2)
ENDIF

AAdd(aUF,"XX")
AAdd(aUF,"EX")

IF AScan(aUF,cUF)=0
   ZNERRO:=8
   ZERRO:="Estado invalido: "+ cUF
ENDIF

IF ZNERRO=0
  // IF lOLD .OR. cUF='BA'
//      ValIEold( cinsc, cUF, lMES  )
       IF ! ValidIE( cINSC, cUF ) //funcao classe sefaz
	       ZNERRO:=6
           ZERRO:="Inscricao Invalida"
	   ENDIF
//   ELSE
//     nRet := VALIDA_INSCRICAOESTADUAL(cINSC,cUF) //10 anos sem update dll usando via prg
//     IF nRet<>0
//        ZNERRO:=6
//        ZERRO:="Inscricao Invalida"
//     endif
//  ENDIF
ENDIF
IF ZNERRO>0
   IF lMES
      alert(zerro)
   ENDIF
   RETURN .f.
ENDIF
RETURN .t.



