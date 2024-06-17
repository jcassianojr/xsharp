FUNCTION CHECKRICI(VALOR,lMES)
LOCAL aPESOS AS ARRAY
LOCAL SOMA,X,D AS INT
/*
certidao nascimento
11520401552010112345123123456712 (32 digitos)
115204 01 55 2010 1 12345 123 1234567 12
XXXXXX.XX.XX.XXXX.X.XXXXX.XXX.XXXXXXX-XX
  A     B C    D  E  F     G        H  I
A  Código Nacional da Serventia (6 primeiros números da matrícula - Ex.: 115204), o qual deve ser obtido no site do CNJ pelos cartórios,
B  Código do acervo (7º e 8º números da matrícula) sendo:
   “01” para acervo próprio e
   “02” para os acervos incorporados até 31/12/2009, último dia antes da implementação do Código Nacional por todos os registradores civis das pessoas naturais (nesse caso os seis primeiros números serão aqueles da serventia incorporadora). As certidões extraídas de acervos incorporados a partir de 1º de
   janeiro de 2010 (acervo de serventias que já possuíam código nacional próprio por ocasião da incorporação) utilizarão o código da serventia incorporada e o código de acervo 01;
C  Código 55 (9º e 10º números da matrícula), que é o número relativo ao serviço de registro civil das pessoas naturais;
D   Ano do registro do qual se extrai a certidão, com 04 dígitos (11º, 12º, 13º e 14º números da matrícula - Ex.: 2010);
E  Tipo do livro de registro, com um digito numérico (15º número da matrícula - Ex.: 1= Nascimento) sendo:
   1: Livro A (Nascimento)
   2: Livro B (Casamento)
   3: Livro B Auxiliar (Casamento Religioso com efeito civil)
   4: Livro C (Óbito)
   5: Livro C Auxiliar (Natimorto)
   6: Livro D (Registro de Proclamas)
   7: Livro E (Demais atos relativos ao registro civil ou livro E único);
   8: Livro E (Desdobrado para registro especifico das Emancipações);
   9: Livro E (Desdobrado para registro especifico das Interdições);
   Obs.: No GIL deve-se registrar 91- Nascimento, 92-Casamento, ...
F   Número do livro, com cinco dígitos (Ex.: 12345), os quais corresponderão ao 16º, 17º, 18º, 19º e 20º números da matrícula;
G    Número da folha do registro, com três dígitos (21º, 22º e 23º números da matrícula - Ex.: 123);
H     Número do termo na respectiva folha em que foi iniciado, com sete dígitos (Ex.: 1234567), os quais corresponderão aos 24º, 25º, 26º, 27º, 28º, 29º, 30º números da matrícula;
I   Número do dígito verificador (31º e 32º números da matrícula - Ex.: 12),formado automaticamente por meio do programa que pode ser baixado gratuitamente por meio do seguinte endereço eletrônico: www.cnj.jus.br/corregedoria/.
*/

IF ValType(lMES)#"L"
   lMES:=.T.
ENDIF
ZERRO:=""
ZNERRO:=0
VALOR:=TIRAOUT(VALOR)
IF Val( VALOR )=0
   ZERRO:= "Numero RICI Nao Informado(em Branco)"
   ZNERRO:=3
ENDIF
IF Len(AllTrim(VALOR))<>32
    ZERRO:='RICI nao tem 32 digitos '+Str(Len(AllTrim(VALOR)),0)
    ZNERRO:=4
ENDIF


IF ZNERRO=0
    //aPESOS:={2,3,4,5,6,7,8,9,10,0,1,2,3,4,5,6,7,8,9,10,0,1,2,3,4,5,6,7,8,9}
    // digitos ** esses dígitos, do 3º e do 5º grupo, são desprezados na formação do DV  digitos 9/10/15
    //       1 0 4 5 3 9 0 1 5 5 2 0 1 3 1 0 0 0 1 2  0 2 1 0 0 0 0 1 2 3
    //1  0  4  5  3  9  0  1  5  5  2  0  1  3  1  0  0  0  1  2  0  2  1  0  0  0  0  1  2  3 = 2
    //x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x
    //2  3  4  5  6  7  8  9 10  0  1  2  3  4  5  6  7  8  9 10  0  1  2  3  4  5  6  7  8  9
    //----------------------------------------------------------------------------------------
    //2+ 0+16+25+18+63+ 0+ 9+**+**+ 2+ 0+ 3+12+**+ 0+ 0+ 0+ 9+20+ 0+ 2+ 2+ 0+ 0+ 0+ 0+ 7+16+27 = 233

     aPESOS:={2,3,4,5,6,7,8,9,0,0,1,2,3,4,0,6,7,8,9,10,0,1,2,3,4,5,6,7,8,9}
     soma:=0
     FOR X:=1 TO 30
        soma+=Val(SubStr(valor,X,1))*aPESOS[X]
     NEXT X
//     alert(Str(soma))
     d := Mod(soma,11)
     IF d=10
//        d:=0
        d:=1
     ENDIF
     IF d <> Val(SubStr(valor,31,1))
        zDAC:=StrZero(D,1,0)
        zerro:="1. Digito de Controle RIC "+SubStr(valor,31,1)+" Nao Confere sugerido: " +zDAC
        znerro:=1
     ENDIF

  //aPESOS:={1,2,3,4,5,6,7,8,9,10,0,1,2,3,4,5,6,7,8,9,10,0,1,2,3,4,5,6,7,8,9}
  // digitos ** esses dígitos, do 3º e do 5º grupo, são desprezados na formação do DV digitos 9/10/15
  //       1 0 4 5 3 9 0 1 5 5 2 0 1 3 1 0 0 0 1 2  0 2 1 0 0 0 0 1 2 3 2
  //1  0  4  5  3  9  0  1  5  5  2  0  1  3  1  0  0  0  1  2  0  2  1  0  0  0  0  1  2  3  2 = 1
  //x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x
  //1  2  3  4  5  6  7  8  9 10  0  1  2  3  4  5  6  7  8  9 10  0  1  2  3  4  5  6  7  8  9
  //-------------------------------------------------------------------------------------------
  //1+ 0+12+20+15+54+ 0+ 8+**+**+ 0+ 0+ 2+ 9+**+ 0+ 0+ 0+ 8+18+ 0+ 0+ 1+ 0+ 0+ 0+ 0+ 6+14+24+18 = 210

     aPESOS:={1,2,3,4,5,6,7,8,0,0,0,1,2,3,0,5,6,7,8,9,10,0,1,2,3,4,5,6,7,8,9}
     soma:=0
     FOR X:=1 TO 31
        soma+=Val(SubStr(valor,X,1))*aPESOS[X]
//        alert(Str(Val(SubStr(valor,X,1))*aPESOS[X]))
     NEXT X
//     alert(Str(soma))
     d := Mod(soma,11)
     IF d=10
//        d:=0
        d:=1
     ENDIF
     IF d <> Val(SubStr(valor,32,1))
        zDAC:=StrZero(D,1,0)
        zerro:="2. Digito de Controle RIC "+SubStr(valor,32,1)+" Nao Confere sugerido: " +zDAC
        znerro:=1
     ENDIF
ENDIF
IF znerro>0
   IF Lmes
      alert(zerro)
   ENDIF
   RETURN .f.
ENDIF
RETURN .t.




