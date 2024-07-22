FUNCTION CheckCNHCat(cCNHCAT)
LOCAL aCAT:={'A','B','C','D','E','AB','AC','AD','AE'}
znerro:=0
zerro :=''
cCNHCAT:=AllTrim(cCNHCAT)
IF ! Empty(cCNHCAT)
   IF  AScan(aCAT,cCNHCAT)=0
	   znerro :=1
	   zerro  :='Categoria Habilitacao invalida: ' +cCNHCAT
       RETURN .f.
   ENDIF
ENDIF
RETURN .T.


function validacnh(eVALOR)
IF VALTYPE(eVALOR)<>"C"
   eVALOR:=AllTrim(STR(eVALOR))
endif
IF ! ValidCnhAntiga( strzero(val(eVALOR),9) )  .and. !  ValidCnhAtual( strzero(val(eVALOR),11) )  .and. !  ValidCnhImpresso(eVALOR)
   RETURN .F.
endif
RETURN .T.



FUNCTION ValidCnhAntiga( cPgu )

   LOCAL Result, PGU_Forn, Dig_Forn, Soma, Mult, J, Digito, Dig_Enc

   Result := .F.
   IF Len( AllTrim( cPgu ) ) != 9
      RETURN Result
   ENDIF
   PGU_Forn := Substr( cPgu, 1, 8 )
   Dig_Forn := Substr( cPgu, 9, 1 )
   Soma := 0
   Mult := 2
   FOR j := 1 to 8
       Soma := Soma + ( Val( Substr( PGU_Forn, j, 1 ) ) * Mult )
       Mult := Mult + 1
   NEXT
   Digito := Int( Mod( Soma, 11 ) )
   IF Digito > 9
      Digito := 0
   ENDIF
   Dig_Enc := AllTrim( Str( Digito ) )
   IF Dig_Forn = Dig_enc
      Result := .T.
   ENDIF
   IF Dig_Forn <> Dig_enc
      Result := .F.
   ENDIF

   RETURN Result


FUNCTION ValidCnhAtual( cCnh )

   LOCAL Result, Cnh_Forn, Dig_Forn, Incr_Dig2, Soma, Mult, J, Digito1, Digito2, Dig_Enc

   Result := .F.
   IF ! ( len( allTrim( cCnh ) ) ) = 11
      RETURN Result
   ENDIF
   CNH_Forn := SubStr( cCnh, 1, 9 )
   Dig_Forn := SubStr( cCnh, 10, 2 )
   Incr_Dig2 := 0
   Soma := 0
   Mult := 9
   FOR j := 1 TO 9
       Soma := Soma + ( Val( SubStr( CNH_Forn, j, 1 ) ) * Mult )
       Mult := Mult - 1
   NEXT
   Digito1 := INT( Mod( Soma, 11 ) )
   IF Digito1 = 10
      Incr_Dig2 := -2
   ENDIF
   IF Digito1 > 9
      Digito1 := 0
   ENDIF
   Soma := 0
   Mult := 1
   FOR j := 1 TO 9
       Soma := Soma + ( Val( SubStr( CNH_Forn, j, 1 ) ) * Mult)
       Mult := Mult + 1
   NEXT
   IF INT( Mod( Soma, 11 ) ) + Incr_Dig2 < 0
      Digito2 := 11 + INT( Mod( Soma, 11 ) ) + Incr_Dig2
   ELSE
      Digito2 := INT( Mod( Soma, 11 ) ) + Incr_Dig2
   ENDIF
   IF Digito2 > 9
      Digito2 := 0
   ENDIF
   Dig_Enc := AllTrim( Str( Digito1 ) ) + AllTrim( Str( Digito2 ) )
   IF Dig_Forn = Dig_enc
      Result := .T.
   ENDIF
   IF ! ( Dig_Forn = Dig_enc )
      Result := .F.
   ENDIF

   RETURN Result


FUNCTION ValidCnhImpresso( cNumero )

   LOCAL lOk := .F., nDigito

   cNumero := sonumeros( cNumero )
   IF Len( cNumero ) <> 0
      nDigito := 11 - Mod( Val( SubStr( cNumero, 1, Len( cNumero ) - 1 ) ), 11 )
      nDigito := iif( nDigito > 9, 0, nDigito )
      lOk := ( nDigito == Val( SubStr( cNumero, Len( cNumero ), 1 ) ) )
   ENDIF

   RETURN lOk







