FUNCTION AaParenRight( cString, nPos ) AS LONG
LOCAL nRight := 0  AS LONG
LOCAL c AS STRING , nLen AS INT , nLCount AS LONG
//LOCAL nRCount AS LONG
IF SubStr( cString, nPos, 1 ) == "("
   nLen    := Len( cString )
//   nRCount := 0
   nLCount := 1
   WHILE .T.
      IF ++nPos > nLen ; EXIT ; ENDIF
      IF ( c := SubStr( cString, nPos, 1 )) == "(" ; nLCount++ ; LOOP ; ENDIF
      IF c == ")"
         IF --nLCount == 0 ; nRight := nPos ; EXIT ; ENDIF
      ENDIF
   END
ENDIF
RETURN nRight


FUNCTION AInitialize( aArray, pModel, pDefault )

LOCAL i, nArrayLen

arrayify( aArray )

IF IsArray( pModel )

    // Model array passed. Shape aArray[] to match.
    aArray := ASize( aArray, nArrayLen := Len( pModel ))
    FOR i := 1 TO nArrayLen
        IF IsArray( pModel[ i ] )
            aArray[ i ] := AInitialize( aArray[ i ], pModel[ i ] )
        ELSEIF aArray[ i ] == NIL
            aArray[ i ] := pModel[ i ]
        ENDIF
    NEXT

ELSEIF pModel > ( nArrayLen := Len( aArray ))

    // Length and default value passed. Size and fill.
    aArray := ASize( aArray, pModel )
    AEvalOld( aArray, { | e, i | IF( e == NIL, aArray[ i ] := pDefault, NIL ) } )

ENDIF

RETURN aArray



FUNCTION arrayify( xVal AS USUAL) AS ARRAY
RETURN iif( IsArray( xVal ) , xVal , { xVal } )


FUNCTION Blank( xParam AS USUAL )  AS USUAL
LOCAL xResult AS USUAL , cType AS USUAL

cType := ValType( xParam )

DO CASE
    CASE cType == "C" ; xResult := Space(Len(xParam))
    CASE cType == "D" ; xResult := CToD("")
    CASE cType == "M" ; xResult := Space(10)
    CASE cType == "N"  .or.  cType == "F"  ; xResult := 0
    CASE cType == "A" ; xResult := {}
    CASE cType == "B"  .or.  cType == "L" ; xResult := .F.
    OTHERWISE         ; xResult := Space(20)
ENDCASE
RETURN xResult



FUNCTION CleanHeader( c AS STRING ) AS STRING
RETURN Proper( StrTran(  c , "_", " " ))


FUNCTION GEN_PIC( cField, isGet, isName, nMaxWidth )
* อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ *
LOCAL i, s, cPictStr, cType, nLen, nSelect, cFieldName, xValue, bBlock

DEFAULT isName TO IsString( cField )

cFieldName:=""
cTYPE:= NIL
xVALUE:= NIL


IF isName
    cFieldName := Upper( cField )    
 //   ALERT(cFieldName)
    DO CASE
	    CASE  At( "->", cFieldName )  > 0    
	    	i := At( "->", cFieldName )
	        nSelect    := SELECT( Left( cFieldName, i - 1 ))
	        cFieldName := SubStr( cFieldName, i + 2 )      
	        xValue := Eval( FieldWBlock( cFieldName, nSelect ))
	        cType := ValType( xValue )
	    CASE  FieldPos( cFieldName ) > 0    
    	    xValue := FieldGet( FieldPos( cFieldName ) )
            cType := ValType(xValue )
	    CASE  MemVarBlock( cFieldName ) != NIL
             bBlock := MemVarBlock( cFieldName )
             xValue := Eval( bBlock )
             cType := ValType( xValue )
    ENDCASE
ENDIF

IF xValue == NIL
   xValue     := cField                     // Nameless value. We do our best.
   cFieldName := ""
ENDIF
IF cType == NIL
   cType := ValType( xValue )
ENDIF

DO CASE

    CASE cType == "C"                       // Character field
       nLen := Len( xValue )
       //IF "PHONE" $ cFieldName              // Is it a phone field?
       //    IF nLen = 14
       //        cPictStr := "@R (###) ###-#### ####"
       //    ELSEIF nLen = 10
       //        cPictStr := "@R (###) ###-####"
       //    ELSEIF nLen = 7
       //        cPictStr := "@R ###-####"
       //    ELSE
       //        cPictStr := Repl( "#", nLen )
        //   ENDIF
      // ELSEIF "CITY" $ cFieldName           // Is it a city?
       //    cPictStr := Proper( xValue )
       //ELSEIF "_NO" $ cFieldName            // Invoice number etc.
       //    cPictStr := "@9"
      // ELSEIF nLen < 10
        //   cPictStr := "@!"
       //ELSE
           DEFAULT isGet TO .f. //( !Empty( ReadVar() ) .AND. "CHOICE" != ReadVar() )
           DEFAULT nMaxWidth TO 50
           i := Min( nLen, nMaxWidth )
           cPictStr := IF( isGet, ;        // It's a GET: scroll it!
                           "@KS" + LTrim( Str( i )), ;
                           Repl( "X", i ) ; // It's a SAY: keep in bounds
                         )
       //ENDIF

    CASE cType == "M"
        cPictStr := "XXXXXX"                // Compat with MemoGet()
        nLen     := 6

    CASE cType == "D"
        cPictStr := "@D"
        nLen     := 8

    CASE cType = "L"     .or. ctype= "B"                        // Logical  boleano field
        cPictStr := "Y"
        nLen     := 1

    CASE cType = "N"      .or.  cType = "F"                    // Numeric float field
        IF ( i := At( ".", ( s := Str( xValue )))) > 0
           cPictStr := Repl( "9", i - 1 ) + "." + ;
                       Repl( "9", Len( s ) - i )
        ELSE
           cPictStr := Repl( "9", Len( s ))
        ENDIF
        nLen := Len( cPictStr )

    OTHERWISE                           // No picture
        cPictStr := ""
        nLen := 0

ENDCASE

IF nMaxWidth != NIL  .AND. nLen > nMaxWidth
   IF cPictStr == Repl( "X", nLen )
      cPictStr := "@S" + StringInt( nMaxWidth )
   ELSEIF !( "S" $ cPictStr )
      IF Left( cPictStr, 1 ) == "@"
         cPictStr := "@S" + StringInt( nMaxWidth ) +         ;
                     Right( cPictStr, Len( cPictStr ) - 1 )
      ELSE
         cPictStr := "@S" + StringInt( nMaxWidth ) + " " + cPictStr
      ENDIF
   ENDIF
  // alert(cpictstr)
ENDIF

RETURN cPictStr
FUNCTION StringInt( n  ) AS STRING
//RETURN  Str( INT( n ) , Len( INT( n ) ) , 0 )
RETURN AllTrim(Str(INT(n)))




