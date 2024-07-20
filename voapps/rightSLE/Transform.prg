#USING System.Text
#USING System.Globalization

begin namespace rightSLE.Internal

[Flags] ;
INTERNAL ENUM TransformFunc
   None        := 0
   Left        := 1
   Credit      := 2
   @@Date      := 4
   British     := 8
   NonTemplate := 16
   Debit       := 32
   ZeroBlank   := 64
   ParenLeft   := 128
   ParenRight  := 256
   Upper       := 512
END ENUM   

STATIC FUNCTION _TransformTemplate( cPicture AS STRING, nPicFunc REF TransformFunc ) AS STRING
   LOCAL cChar     AS Char
   LOCAL nLen      AS INT
   LOCAL x         AS INT
   LOCAL cTemplate AS STRING
   
   cTemplate := ""
   nLen      := cPicture:Length
   nPicFunc  := TransformFunc.None
   
   IF nLen > 1 && cPicture[0] == '@'
	  FOR x := 1 UPTO nLen - 1
		 cChar := cPicture[x]
		 IF Char.IsWhiteSpace( cChar )
			IF x + 1 < nLen
			   cTemplate := cPicture:Substring( x + 1 )
			ENDIF   
			EXIT
		 ELSEIF cChar == 'B'
			nPicFunc |= TransformFunc.Left
		 ELSEIF cChar == 'C'
			nPicFunc |= TransformFunc.Credit
		 ELSEIF cChar == 'D'
			nPicFunc |= TransformFunc.Date
		 ELSEIF cChar == 'E'
			nPicFunc |= TransformFunc.British
		 ELSEIF cChar == 'R'
			nPicFunc |= TransformFunc.NonTemplate
		 ELSEIF cChar == 'X'
			nPicFunc |= TransformFunc.Debit
		 ELSEIF cChar == 'Z'
			nPicFunc |= TransformFunc.ZeroBlank
		 ELSEIF cChar == '('
			nPicFunc |= TransformFunc.ParenLeft
		 ELSEIF cChar == ')'
			nPicFunc |= TransformFunc.ParenRight
		 ELSEIF cChar == '!'
			nPicFunc |= TransformFunc.Upper
		 ENDIF
	  NEXT
   ELSE
	  cTemplate := cPicture
   ENDIF
   
   RETURN cTemplate

FUNCTION Transform( dValue AS DateTime, cPicture AS STRING ) AS STRING
   LOCAL nPicFunc AS TransformFunc
   LOCAL cReturn AS STRING
   LOCAL dt AS DateTime
   LOCAL cFormat AS STRING

   _TransformTemplate( cPicture, nPicFunc )
   dt := dValue

   DO CASE
   CASE nPicFunc == TransformFunc.Date
	  cReturn := dt:ToString("d") //DToC(dValue)

   CASE nPicFunc == TransformFunc.British
	  IF SetCentury()
		 cFormat := "dd/MM/yyyy"
	  ELSE
		 cFormat := "dd/MM/yy"
	  ENDIF
   
	  cReturn := dt:ToString(cFormat)
	  
   OTHERWISE // VO returns empty string with @R, but lets ignore it and return the same thing for every template type
	  cReturn := dt:ToString("d") //DToC(dValue)
	  
   ENDCASE
   
   RETURN cReturn

FUNCTION Transform( lValue AS LOGIC, cPicture AS STRING ) AS STRING
   LOCAL nPicFunc AS TransformFunc
   LOCAL cTemplate AS STRING
   LOCAL cReturn AS StringBuilder
   LOCAL cChar AS Char
   LOCAL i AS INT
   LOCAL nLen AS INT
   LOCAL lDone AS LOGIC

   cTemplate := _TransformTemplate( cPicture, nPicFunc )
   // Note: For LOGIC values we ignore the picture function and handle as @R for consistency with VO

   IF cTemplate == ""  // for VO compatiblity, an empty picture string returns T or F
	  cTemplate := "L"
   ENDIF
   
   nLen := cTemplate:Length
   cReturn := StringBuilder{ nLen }
   
   nLen--
   FOR i := 0 UPTO nLen
	  cChar := cTemplate[i]
	  DO CASE
	  CASE cChar == 'L'
		 cReturn:Append( IIF( lDone, ' ', IIF( lValue, 'T', 'F') ) )
		 lDone := TRUE
	  CASE cChar == 'Y' && ! lDone
		 cReturn:Append( IIF( lDone, ' ', IIF( lValue, 'Y', 'N' ) ) )
		 lDone := TRUE
	  OTHERWISE
		 cReturn:Append( cChar )
	  ENDCASE
   NEXT
   
   RETURN cReturn:ToString()

FUNCTION Transform( nValue AS System.Double, cPicture AS STRING ) AS STRING
	//
	// Note: A,N,X,L and Y template chars are treated as normal letters in VO for numeric pictures
	//
	LOCAL cOriginalTemplate AS STRING
	LOCAL nPicFunc          AS TransformFunc
	LOCAL sb                AS StringBuilder
	LOCAL cTemplate         AS STRING
	LOCAL cReturn           AS STRING
	LOCAL lWhole            AS LOGIC
	LOCAL nWhole, nDecimal	AS INT
	LOCAL cThous, cDec      AS Char
	LOCAL lForceBrit 		AS LOGIC
	LOCAL cChar             AS Char
	LOCAL cTemp             AS STRING
	LOCAL nLen              AS INT
	LOCAL nMap		        AS INT
	LOCAL x                 AS INT
	LOCAL numberFormat      AS NumberFormatInfo

	numberFormat    := NumberFormatInfo.CurrentInfo
	cDec            := convert.ToChar(numberFormat:NumberDecimalSeparator)
	cThous          := convert.ToChar(numberFormat:NumberGroupSeparator)
	/*
	IF cDec == convert.ToChar(".")
		cThous      := convert.ToChar(numberFormat:NumberGroupSeparator)
	ELSE
		cThous := convert.ToChar(".")
	ENDIF
	*/
	
	//cDec := (Char)Vulcan.Runtime.State.DecimalSep
	//cThous := (Char)Vulcan.Runtime.State.ThousandSep
	
	cTemplate := _TransformTemplate( cPicture, nPicFunc )

	lForceBrit := ( nPicFunc & TransformFunc.British ) == TransformFunc.British

	IF ( nPicFunc & TransformFunc.Date ) == TransformFunc.Date
		cTemplate := GetDateFormat():ToUpper():Replace('D' , '#'):Replace('M' , '#'):Replace('Y' , '#')
	ENDIF

	// when no template is provided, created one the way VO does
	IF cTemplate:Length == 0
		cTemplate := System.String{'#' , iif(nValue < 10000000000 , 10 , 20) }
		//IF nValue:Decimals != 0
			//cTemplate += "." + System.String{'9' , nValue:Decimals}
		//END IF
		cOriginalTemplate := cTemplate
	ENDIF

	cOriginalTemplate := cTemplate
	
	// Convert the arithmetic chars of the VO style template into the .NET format string
	lWhole := TRUE
	nLen   := cTemplate:Length - 1
	
	FOR x := 0 UPTO nLen
		cChar := cTemplate[x]
		DO CASE
			
		CASE cChar == '9' .or. cChar == '#'
			IF lWhole
				nWhole ++
			ELSE
				nDecimal ++
			ENDIF
			
		CASE cChar == '.'
			IF lWhole
				lWhole := FALSE
			ELSE
				nDecimal ++ // multiple dots don't make sense (although VO somehow allows them)
			END IF
			
		ENDCASE
	NEXT
	
	sb := StringBuilder{nWhole + nDecimal + 1}
	IF nWhole != 0
		sb:Append('#' , nWhole - 1)
		sb:Append('0')
	END IF
	IF .not. lWhole
		sb:Append('.')
	END IF
	IF nDecimal != 0
		sb:Append('0' , nDecimal)
	END IF
	cTemplate := sb:ToString()

	// check for overflow
	cTemp := Str(nValue , nWhole + nDecimal + iif(nDecimal == 0 , 0 , 1) , nDecimal)
	IF cTemp:Contains("*")
		cTemplate := cTemplate:Replace('#' , '*'):Replace('0' , '*')
	ENDIF
	
	//cReturn := nValue:Value:ToString( cTemplate )
	cReturn := nValue:ToString( cTemplate, CultureInfo.CurrentCulture)
	
	IF ( nPicFunc & TransformFunc.ZeroBlank ) == TransformFunc.ZeroBlank
		IF nValue == 0
			cReturn := System.String{' ' , cReturn:Length}
		ELSEIF Math.Abs(nValue) < 1.0
			x := cReturn:IndexOf(cDec)
			IF x == -1
				cReturn := System.String{' ' , cReturn:Length}
			ELSE
				cReturn := System.String{' ' , x} + cReturn:Substring(x)
			END IF
		END IF
	ENDIF
	
	// Map result string back to the original template
	
	nLen := cOriginalTemplate:Length - 1
	sb := StringBuilder{nLen + 1}
	nMap := cReturn:Length - 1

	FOR x := nLen DOWNTO 0
		cChar := cOriginalTemplate[x]
		DO CASE
			
		CASE cChar == '9' .or. cChar == '#' .or. cChar == '.'
			IF nMap >= 0
				IF lForceBrit .and. cChar == '.'
					sb:Insert(0 , ',')
				ELSE
					sb:Insert(0 , cReturn[nMap])
				END IF
			ELSE
				sb:Insert(0 , ' ')
			END IF
			nMap --
			
		CASE cChar == ','
			IF nMap >= 0
				IF nMap == 0 .and. cReturn[nMap] == '-'
					sb:Insert(0 , cReturn[nMap])
					nMap --
				ELSE
					IF lForceBrit
						sb:Insert(0 , '.')
					ELSE
						sb:Insert(0 , cThous)
					END IF
				END IF
			ELSE
				sb:Insert(0 , ' ')
			END IF
			
		OTHERWISE
			
			sb:Insert(0 , cChar)
			
		END CASE
	NEXT
	
	cReturn := sb:ToString()
	
	IF nValue < 0
		IF ( nPicFunc & TransformFunc.ParenLeft ) == TransformFunc.ParenLeft
			cReturn := "(" + SubStr(cReturn , 2) + ")" // ugly, but so is VO here, too :)
		ELSEIF ( nPicFunc & TransformFunc.ParenRight ) == TransformFunc.ParenRight
			cTemp := cReturn:Trim()
			nLen := cReturn:Length - cTemp:Length
			IF nLen == 0
				cTemp := SubStr(cTemp , 2)
			ELSE
				nLen --
			END IF
			cReturn := System.String{' ' , nLen} + "(" + cTemp + ")"
		END IF
	END IF

	IF nValue > 0   
		IF ( nPicFunc & TransformFunc.Credit ) == TransformFunc.Credit
			// TODO: should these be localized?
			cReturn := cReturn + " CR"
		ENDIF
	ELSEIF nValue < 0
		IF ( nPicFunc & TransformFunc.Debit ) == TransformFunc.Debit
			// TODO: should these be localized?
			cReturn := cReturn + " DB"
		ENDIF   
	ENDIF
	
	IF ( nPicFunc & TransformFunc.Left ) == TransformFunc.Left
		cReturn := cReturn:TrimStart():PadRight( cReturn:Length )
	ENDIF
	
RETURN cReturn

FUNCTION Transform(c AS STRING, cPicture AS STRING) AS STRING
   LOCAL nPicFunc AS TransformFunc
   LOCAL cTemplate AS STRING
   LOCAL cReturn AS STRING
   LOCAL cChar AS STRING
   LOCAL i AS INT
   LOCAL j AS INT
   LOCAL nLen AS INT
   // LOCAL lDone AS LOGIC

   cTemplate := _TransformTemplate( cPicture, nPicFunc )

   IF ( nPicFunc & TransformFunc.Upper ) == TransformFunc.Upper
	  c := c:ToUpper()
   ENDIF

   nLen := cTemplate:Length
   IF nLen == 0
	  cReturn := c
   ELSE
	  c := Pad(c,nLen)
	  cReturn := ""
	  j := 1
	  FOR i := 1 UPTO nLen
		 cChar := SubStr(cTemplate,i,1U)
		 DO CASE
		 CASE cChar == "!"
			cReturn := cReturn + SubStr(c,j,1U):ToUpper()
			j++
		 CASE cChar $ "ANX9#"
			cReturn := cReturn + SubStr(c,j,1U)
			j++
		 OTHERWISE
			cReturn := cReturn + cChar
			IF ! nPicFunc == TransformFunc.NonTemplate
			   j++
			ENDIF
		 ENDCASE
	  NEXT
	  
   ENDIF
   
   RETURN cReturn
end namespace
