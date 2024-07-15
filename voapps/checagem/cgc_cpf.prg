FUNCTION Valcpf(xcpf,lMES)
LOCAL X AS DWORD
LOCAL P1 AS STRING
LOCAL cDIGEST
p1:=AllTrim(TIRAOUT(xCPF))
IF ValType(lMES)#"L"
   lMES:=.T.	
ENDIF	

ZNERRO:=0
IF Val(p1)=0
   ZERRO:="CPF Invalido - Em Branco"
   ZNERRO:=1
ENDIF
IF Len(p1)<>11
   ZERRO:="CPF Invalido - nao tem 11 Digitos"
   ZNERRO:=2
ENDIF

FOR X:=0 TO 9
   IF p1=Repl(Str(X,1),11)
      ZERRO:="CPF Invalido - Sequencia Repetitiva de "+Str(X,1)
      ZNERRO:=3
   ENDIF
NEXT X
IF ZNERRO=0
	IF Mod11 (P1, 10, 10)
	   IF Mod11 (P1, 11, 11)
	      RETURN .T.
	   ELSE
	      ZERRO:="CPF - Invalido  - Cheque 11º Digito - 2 Verificador"
	      ZNERRO:=4
	   ENDIF
	ELSE
	   ZERRO:="CPF - Invalido  - Cheque 10º Digito - 1 Verificador"
	   ZNERRO:=5
	ENDIF
ENDIF
//Estado Emissor
cDIGEST:=SubStr(P1,9,1)
DO CASE
   CASE cDIGEST='1'
   	    cDIGEST:='GO/MT/MS/DF/TO'
   CASE cDIGEST='2'
      	cDIGEST:='AM/AC/PA/RR/RO/AP'
   CASE cDIGEST='3'
      	cDIGEST:='MA/CE/PI'
   CASE cDIGEST='4'
      	cDIGEST:='RN/PB/PE/AL'
   CASE cDIGEST='5'
      	cDIGEST:='SE/BA'
   CASE cDIGEST='6'
       	cDIGEST:='MG'
   CASE cDIGEST='7'
       	cDIGEST:='RJ/ES'
   CASE cDIGEST='8'
       	cDIGEST:='SP'
   CASE cDIGEST='9'
   	    cDIGEST:='PR/SC'
   CASE cDIGEST='0'
   	    cDIGEST:='RS'
ENDCASE
IF ZNERRO>0
   IF lMES
      alert(zERRO)
   ENDIF
   RETURN .f.
ENDIF
RETURN .T.

FUNCTION Mod11(campo,posdv,pesomax)
LOCAL DV,PESO,iMOD
LOCAL REST
LOCAL lRETU:=.F.
dv := 0
peso := 1
FOR imod := posdv TO 1 STEP -1
   dv := dv + peso * Val (SubStr (campo, imod, 1))
   peso := peso + 1
   IF peso > pesomax
      peso := 2
   ENDIF
NEXT
Rest := Mod (dv, 11)
IF Rest = 0
   lRETU:=.T.
ELSE
   IF Rest = 1  .AND. Val (SubStr (campo, posdv, 1)) = 0
      lRETU:=.T.
   ENDIF
ENDIF
RETURN lRETU

FUNCTION formatcpf(xCPF)
xCPF:=StrZero(Val(AllTrim(TIRAOUT(xCPF))),11)
RETU Transform(xCPF,"@R 999.999.999-99")


FUNCTION formatacnpj(xCNPJ)
//@ 01,10 GET CGC1 PICTURE "99.999.999/9999-99" so numeros
///@ 02,10 GET CGC2  PICTURE "NN.NNN.NNN/NNNN-99" numeros e letras
//@ 03,10 GET CGC3  PICTURE "@! NN.NNN.NNN/NNNN-99" numero e letras comente maisculas

IF ValType(xCNPJ)='N'
   xCNPJ:=AllTrim(Str(xCNPJ))
ENDIF
xCNPJ:=AllTrim(TIRAOUT(xCNPJ))
IF Val(xCNPJ)=0 .OR. Len(xCNPJ)<>14
   RETURN xCNPJ
ENDIF
xCNPJ:=StrZero(Val(xCNPJ),14)
RETURN Transform(xCNPJ,"@R! NN.NNN.NNN/NNNN-99")   // ! Para converter maisculas ou usar upper("@R NN.NNN.NNN/NNNN-99")

FUNCTION CNPJ_Novo(pCNPJ) //, plMsg )

    Local lResult := .t.
    local soma := 0
    local dv := ""
    local digito := 0
    local num := 0
    Local wCGC := iif(ValType(pCNPJ)="U", "", pCNPJ)
    LOCAL i := 0
    LOCAL j := 0
    LOCAL Validos := "0123456789" //Incia so numeros mas se for a versao nova muda para alfa+numeros

 //   DEFAULT plMsg := .t.

    wCGC := StrTran(wCGC, ".", "")
    wCGC := StrTran(wCGC, "-", "")
    wCGC := StrTran(wCGC, "/", "")
    IF Empty(wCGC)
        lResult := .f. //.t.
    ELSE
        IF Len(wCGC) < 14
            lResult := .f.
        ELSE
          FOR i = 1 TO 12
             IF SubStr(wCGC, i, 1) $ "ABCDEFGHIJKLMNOPQRSTUWYXZ"
                Validos := "0123456789ABCDEFGHIJKLMNOPQRSTUWYXZ"
                EXIT
             ENDIF
          NEXT
            dv := ""
            num := 5
            FOR j = 1 TO 2
                soma := 0
                FOR i = 1 TO 12
                    soma += (Asc(SubStr(wCGC, i, 1)) - 48) * num
                    num--
                    IF num == 1
                        num := 9
                    ENDIF
                NEXT
                IF j == 2
                    soma+=( 2 * Val(dv))
                ENDIF
                digito := soma - (INT(soma / 11) * 11)
                IF digito == 0 .or. digito == 1
                    dv := dv + "0"
                ELSE
                    dv := dv + Str(11 - digito, 1)
                ENDIF
                num := 6
            NEXT
            IF dv <> SubStr(wCGC, 13, 2)
                lResult := .f.
            ENDIF
        ENDIF
		/*
        if !lResult
           if plMsg
               Msg_OK("CNPJ Incorreto ou Digito Invalido..." + " [" + dv + "]" )
           endif
       endif
	   */
    ENDIF

    RETURN lResult

FUNCTION valcnpj(cCNPJ , lMES , cUF)
 RETURN VALCGC( cCNPJ , "" , lMES , cUF)

FUNCTION VALCGC( cCNPJ, xTIPO ,lMES, cUF)
LOCAL x
LOCAL nCHAR
LOCAL P1
LOCAL aUF
ZNERRO:=0
ZERRO:=""

//IF LastKey() = K_UP .or. LastKey() = K_DOWN                 // retorna caso seta para cima ou baixo uso em harbour
//   RETURN .T.
//ENDIF
IF ValType(LMES)<>"L"
   lMES:=.T.
ENDIF
IF ValType( xTIPO ) <> "C"
   xTIPO := "X"
ENDIF
IF ValType(cCNPJ)='N'
   cCNPJ:=AllTrim(Str(cCNPJ))
ENDIF

//valor cnpj sem traco e pontos
P1 := AllTrim( TIRAOUT( cCNPJ ) )

IF Val( p1 ) = 0
   ZNERRO:=1
   ZERRO:="CNPJ Invalido - Em Branco"
   RETURN .F.
ENDIF
IF Len( p1 ) <> 14
   ZNERRO:=2
   ZERRO:="CNPJ Invalido - nao tem 14 Digitos"
ENDIF
FOR X := 0 TO 9
   IF p1 = Repl ( Str( X, 1 ), 14 )
      ZNERRO:=3
      ZERRO:="CNPJ Invalido - Sequencia Repetitiva de " + Str( X, 1 )
   ENDIF
NEXT X
//if xtipo = 'M' //desabilitada pois a matriz nao mais precisa ser 0001
   //if substr( P1, 9, 4 ) != '0001'
      //ZNERRO:=4
      //ZERRO:="CNPJ Invalido - Nao e Matriz"
   //endif
//endif
// CNPJ-Numeric (current): NN.NNN.NNN/NNNN-NN
//CNPJ-Alphanumeric (new): SS.SSS.SSS/SSSS-NN
//                         12 345 678 9012 34
FOR X := 1 TO 12
   nCHAR := SubStr(P1,X,1)
   IF IsAlpha(nCHAR) .OR. IsDigit(nCHAR)
   ELSE
      ZNERRO:=11
      ZERRO:="CNPJ Invalido - digito Posicao " + Str( X, 1 )
   ENDIF
NEXT X

FOR X := 13 TO 14
  nCHAR := SubStr(P1,X,1)
   IF IsDigit(nCHAR)
   ELSE
      ZNERRO:=12
      ZERRO:="CNPJ Invalido - digito nao numerico Posicao " + Str( X, 1 )
   ENDIF
NEXT X



IF Left(p1, 7) = "9999999" //     inicio 999999
   ZNERRO:=5
   ZERRO:="CNPJ Generico 9999999"
ENDIF
IF SubStr(p1,9,4)="9999"    //depois da barra /9999
   ZNERRO:=6
   ZERRO:="CNPJ Generico /9999-"
ENDIF
IF ValType(cUF)="C" .AND. ! Empty(cUF)
   aUF    := { "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", ;
            "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", ;
            "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO" ,"EX","XX"}
   IF AScan(aUF,cUF)=0
      ZNERRO:=7
      ZERRO:="Estado invalido: "+ cUF
   ENDIF
ENDIF

IF ZNERRO=0
   IF ! CNPJ_Novo(P1)
       ZNERRO:=10
       ZERRO:="CNPJ Invalido"
   ENDIF
   //funcao nova validar nova versao com caracteres
   /*
  if Mod11( P1, 13, 9 )
     if Mod11( P1, 14, 9 )
        return .T.
     else
        ZNERRO:=8
        ZERRO:="Cheque 14o. Digito - 2 Verificador"
     endif
  else
     ZNERRO:=9
     ZERRO:="Cheque 13o. Digito - 1 Verificador"
  endif
  */
ENDIF
IF ZNERRO>0
   IF lMES
      AlertX(zERRO)
   ENDIF
   RETURN .f.
ENDIF
RETURN .T.

FUNCTION CNPJCPFVAL(cCGC,cPESSOA,cESTADO)
LOCAL lRETU
lRETU:=.T.
DO CASE
   CASE cPESSOA='J'  //CNPJF
        lRETU:=VALCGC(cCGC,,,cESTADO)
   CASE cPESSOA="F" // CPF CAEPF
        lRETU:=Valcpf(cCGC)
   CASE cPESSOA="C" // CEI CNO
        lRETU:=VALCEI(cCGC)
   OTHERWISE // um dos tres e valido pessoa em branco
        lRETU := VALCGC(cCGC,,,cESTADO) .OR. Valcpf(cCGC) .OR. VALCEI(cCGC)
ENDCASE
RETURN lRETU
