FUNCTION CHECKRICI(VALOR,lMES)
LOCAL aPESOS AS ARRAY
LOCAL SOMA,X,D AS INT
/*
certidao nascimento
11520401552010112345123123456712 (32 digitos)
115204 01 55 2010 1 12345 123 1234567 12
XXXXXX.XX.XX.XXXX.X.XXXXX.XXX.XXXXXXX-XX
  A     B C    D  E  F     G        H  I
A  C�digo Nacional da Serventia (6 primeiros n�meros da matr�cula - Ex.: 115204), o qual deve ser obtido no site do CNJ pelos cart�rios,
B  C�digo do acervo (7� e 8� n�meros da matr�cula) sendo:
   �01� para acervo pr�prio e
   �02� para os acervos incorporados at� 31/12/2009, �ltimo dia antes da implementa��o do C�digo Nacional por todos os registradores civis das pessoas naturais (nesse caso os seis primeiros n�meros ser�o aqueles da serventia incorporadora). As certid�es extra�das de acervos incorporados a partir de 1� de
   janeiro de 2010 (acervo de serventias que j� possu�am c�digo nacional pr�prio por ocasi�o da incorpora��o) utilizar�o o c�digo da serventia incorporada e o c�digo de acervo 01;
C  C�digo 55 (9� e 10� n�meros da matr�cula), que � o n�mero relativo ao servi�o de registro civil das pessoas naturais;
D   Ano do registro do qual se extrai a certid�o, com 04 d�gitos (11�, 12�, 13� e 14� n�meros da matr�cula - Ex.: 2010);
E  Tipo do livro de registro, com um digito num�rico (15� n�mero da matr�cula - Ex.: 1= Nascimento) sendo:
   1: Livro A (Nascimento)
   2: Livro B (Casamento)
   3: Livro B Auxiliar (Casamento Religioso com efeito civil)
   4: Livro C (�bito)
   5: Livro C Auxiliar (Natimorto)
   6: Livro D (Registro de Proclamas)
   7: Livro E (Demais atos relativos ao registro civil ou livro E �nico);
   8: Livro E (Desdobrado para registro especifico das Emancipa��es);
   9: Livro E (Desdobrado para registro especifico das Interdi��es);
   Obs.: No GIL deve-se registrar 91- Nascimento, 92-Casamento, ...
F   N�mero do livro, com cinco d�gitos (Ex.: 12345), os quais corresponder�o ao 16�, 17�, 18�, 19� e 20� n�meros da matr�cula;
G    N�mero da folha do registro, com tr�s d�gitos (21�, 22� e 23� n�meros da matr�cula - Ex.: 123);
H     N�mero do termo na respectiva folha em que foi iniciado, com sete d�gitos (Ex.: 1234567), os quais corresponder�o aos 24�, 25�, 26�, 27�, 28�, 29�, 30� n�meros da matr�cula;
I   N�mero do d�gito verificador (31� e 32� n�meros da matr�cula - Ex.: 12),formado automaticamente por meio do programa que pode ser baixado gratuitamente por meio do seguinte endere�o eletr�nico: www.cnj.jus.br/corregedoria/.
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
    // digitos ** esses d�gitos, do 3� e do 5� grupo, s�o desprezados na forma��o do DV  digitos 9/10/15
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
  // digitos ** esses d�gitos, do 3� e do 5� grupo, s�o desprezados na forma��o do DV digitos 9/10/15
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




