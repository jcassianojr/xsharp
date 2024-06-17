FUNCTION formatcnpj(xCNPJ)
xCNPJ:=StrZero(Val(AllTrim(TIRAOUT(xCNPJ))),14)
RETU Transform(xCNPJ,"@R 99.999.999/9999-99")



FUNCTION formatcpf(xCPF)
xCPF:=StrZero(Val(AllTrim(TIRAOUT(xCPF))),11)
RETU Transform(xCPF,"@R 999.999.999-99")


FUNC Mod11(campo,posdv,pesomax)
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


FUNCTION VALCGC( xgcg, xTIPO ,lMES,cUF)
LOCAL x,p1,aUF
ZNERRO:=0
ZERRO:=""
IF ValType(LMES)<>"L"
   lMES:=.T.
ENDIF
IF ValType( xTIPO ) <> "C"
   xTIPO := "X"
ENDIF
P1 := AllTrim( TIRAOUT( xGCG ) )
IF Val( p1 ) = 0
   ZNERRO:=1
   ZERRO:="CNPJ Invalido - Em Branco"
ENDIF
IF Len( p1 ) <> 14
   ZNERRO:=2
   ZERRO:="CNPJ Invalido - nao tem 14 Digitos"
ENDIF
FOR X := 0 TO 9
   IF p1 = Repl( Str( X, 1 ), 14 )
      ZNERRO:=3
      ZERRO:="CNPJ Invalido - Sequencia Repetitiva de " + Str( X, 1 )
   ENDIF
NEXT X
IF xtipo = 'M'
   IF SubStr( P1, 9, 4 ) != '0001'
      ZNERRO:=4
      ZERRO:="CNPJ Invalido - Nao e Matriz"
   ENDIF
ENDIF
IF Left(p1, 8) = "99999997"
   ZNERRO:=5
   ZERRO:="CNPJ Generico 99999997"
ENDIF
IF SubStr(p1,9,4)="9999"
   ZNERRO:=6
   ZERRO:="CNPJ Generico /9999-"
ENDIF
IF ValType(cUF)="C"
   aUF    := { "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", ;
            "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", ;
            "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO" ,"EX","XX"}
   IF AScan(aUF,cUF)=0
      ZNERRO:=7
      ZERRO:="Estado invalido: "+ cUF
   ENDIF
ENDIF
IF ZNERRO=0
	IF Mod11( P1, 13, 9 )
	   IF Mod11( P1, 14, 9 )
	      RETURN .T.
	   ELSE
	      ZNERRO:=8
	      ZERRO:="Cheque 14o. Digito - 2 Verificador"
	   ENDIF
	ELSE
	   ZNERRO:=9
	   ZERRO:="Cheque 13o. Digito - 1 Verificador"
	ENDIF
ENDIF
IF ZNERRO>0
   IF lMES
      alert(zERRO)
   ENDIF
   RETURN .f.
ENDIF
RETURN .T.


FUNC Valcpf(xcpf,lMES)
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


