FUNCTION CARDCHEK( Arg1 )

LOCAL Local1
LOCAL Local2
LOCAL Local3
LOCAL Local4
LOCAL Local5
LOCAL lRETU  := .F.
LOCAL aCards := { "AmEx", "Visa", "MasterCard", "Discover", ;
                  "Carte Blanche", "Diners", "JCB" }

//IF LastKey() = K_UP .or. LastKey() = K_DOWN
//   RETU .T.
//ENDIF

IF Empty( ARG1 )
   alert( "Numero Não Informado" )
   RETU .F.
ENDIF

Local3 := 0

IF ValType( aRG1 ) # "C"
   ARg1 := StrZero( aRG1, INT(Len( arg1 )) )
ENDIF

ARg1 := TIRAOUT( aRG1 )
Arg1 := AllTrim( Arg1 )


IF ( Left( Arg1, 1 ) == "0" )
   alert( "Numero Começando com Zero" )
   RETU .F.
ENDIF

IF ( Len( Arg1 ) < 16 )
   Local4 := Replicate( "0", 16 - Len( Arg1 ) ) + Arg1
ELSE
   Local4 := Arg1
ENDIF
FOR Local1 := 1 TO 15 STEP 2
   Local2 := Val( SubStr( Local4, Local1, 1 ) ) * 2
   IF ( Local2 > 9 )
      Local3 += ( 1 + Local2 % 10 )
   ELSE
      Local3 += Local2
   ENDIF
NEXT
FOR Local1 := 2 TO 16 STEP 2
   Local3 += Val( SubStr( Local4, Local1, 1 ) )
NEXT
IF ( Local3 == 0  .or. Local3 % 10 != 0 )
   Local5 := - 1
ELSE
   Local4 := Left( Arg1, 2 )
   DO CASE
   CASE Local4 == "34"  .or. Local4 == "37"
      Local5 := 1
   CASE Local4 == "36"
      Local5 := 6
   CASE Local4 == "38"
      IF ( SubStr( Arg1, 3, 1 ) == "9" )
         Local5 := 5
      ELSE
         Local5 := 6
      ENDIF
   CASE Local4 == "31"  .or. Local4 == "33"  .or. Local4 == "35"
      Local4 := Left( Arg1, 6 )
      DO CASE
      CASE Local4 >= "311200"  .and. Local4 <= "312099"
         Local5 := 7
      CASE Local4 >= "315800"  .and. Local4 <= "315999"
         Local5 := 7
      CASE Local4 >= "333700"  .and. Local4 <= "334999"
         Local5 := 7
      CASE Local4 >= "352800"  .and. Local4 <= "358999"
         Local5 := 7
      OTHERWISE
         Local5 := - 1
      ENDCASE
   CASE Local4 == "30"
      Local4 := Left( Arg1, 6 )
      IF ( Local4 >= "308800"  .and. Local4 <= "309499" )
         Local5 := 7
      ELSEIF ( Local4 >= "309600"  .and. Local4 <= "310299" )
         Local5 := 7
      ELSE
         Local5 := 6
      ENDIF
   CASE Left( Local4, 1 ) == "4"
      Local5 := 2
   CASE Local4 >= "51"  .and. Local4 <= "55"
      Local5 := 3
   CASE Local4 == "60"  .and. SubStr( Arg1, 3, 2 ) == "11"
      Local5 := 4
   CASE Left( Local4, 1 ) == "9"
      Local5 := 5
   OTHERWISE
      Local5 := 0
   ENDCASE
ENDIF
IF local5 > 0
   lRETU := .T.
   alert( aCards[ local5 ] )
ELSE
   alert( "Número Inválido" )
ENDIF
RETURN lRETU



