FUNCTION ValidaRenavam( cRenavam,lmes )

   LOCAL nSoma, nCont, nDigito, lOk

   IF ValType(lMES)#"L"
     lMES:=.T.
   ENDIF
  ZNERRO:=0
  ZERRO:=""

IF Empty(cRenavam)
   ZNERRO:=1
   zerro:="Codigo em branco"
   IF Lmes
   	  alert(zerro)
   ENDIF
   RETURN .F.
ENDIF

   cRenavam := sonumeros( cRenavam )
   cRenavam := StrZero( Val( cRenavam ), 11 )
   nSoma := 0
   FOR nCont := 1 TO 10
      nSoma += ( Val( SubStr( cRenavam, nCont, 1 ) ) * Val( SubStr( "8923456789", nCont, 1 ) ) )
   NEXT
   nDigito := Mod( nSoma, 11 )
   nDigito := iif( nDigito == 10, 0, nDigito )
   lOk     := ( nDigito == Val( Right( cRenavam, 1 ) ) )

   IF ! lOK
   	  ZNERRO:=3
      zerro:="Digito renavam invalido"
       IF Lmes
	   	  alert(zerro)
	   ENDIF
   ENDIF

   RETURN lOk





