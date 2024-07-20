// PictureSpec.prg

#USING rightSLE.Internal

Class PictureSpec
#REGION "  Ivars   "
	Protect nSLEType                     AS SLEType
	Protect nLength                      AS Long
	Protect nDecimals                    AS Long
	Protect cPicture                     AS String
	PROTECT cName := "PictureSpec"       AS String
#ENDREGION
#REGION "   Constructors   "

/****************************************************************************/
Constructor()
	Super()
	RETURN

/* Contructors that use a String for the data type */

/****************************************************************************/
Constructor(cDataType as String)
	Super()
	SELF:SetDataType(cDataType)
	If SELF:nSLETYpe == SLEType.Numeric .or.;
	   SELF:nSLEType == SLETYpe.Character
	   // Error the character or numeric types requires a length
		THROW ApplicationException{"Error - Length Required"}
	ENDIF
	RETURN    

/****************************************************************************/
Constructor(cDataType as String, nDataLength as long)
	Super()
	SELF:SetDataType(cDataType)
	SELF:nLength    := nDataLength
	If (SELF:nSLETYpe == SLEType.Numeric .or.;
	   SELF:nSLEType == SLETYpe.Character) .and. ;
	   SELF:nLength == 0
	   // Error the character or numeric types requires a length
		THROW ApplicationException{"Error - Length > 0 Required"}
	ENDIF
	SELF:nDecimals  := 0
	RETURN    

/****************************************************************************/
Constructor(cDataType as String, nDataLength as long, nDecimalLength as Long)
	Super()
	SELF:SetDataType(cDataType)
	SELF:nLength    := nDataLength
	If (SELF:nSLETYpe == SLEType.Numeric .or.;
	   SELF:nSLEType == SLETYpe.Character) .and. ;
	   SELF:nLength == 0
	   // Error the character or numeric types requires a length
		THROW ApplicationException{"Error - Length > 0 Required"}
	ENDIF
	SELF:nDecimals  := nDecimalLength
	RETURN    

/* Contructors that use a SLEType for the data type */

/****************************************************************************/
Constructor(nDataType as SLEType)
	Super()
	SELF:nSLEType := nDataType
	If SELF:nSLETYpe == SLEType.Numeric .or.;
	   SELF:nSLEType == SLETYpe.Character
	   // Error the character or numeric types requires a length
		THROW ApplicationException{"Error - Length Required"}
	ENDIF
	RETURN    

/****************************************************************************/
Constructor(nDataType as SLEType, nDataLength as long)
	Super()
	SELF:nSLEType := nDataType
	SELF:nLength    := nDataLength
	If (SELF:nSLETYpe == SLEType.Numeric .or.;
	   SELF:nSLEType == SLETYpe.Character) .and. ;
	   SELF:nLength == 0
	   // Error the character or numeric types requires a length
		THROW ApplicationException{"Error - Length > 0 Required"}
	ENDIF
	SELF:nDecimals  := 0
	RETURN    

/****************************************************************************/
Constructor(nDataType as SLEType, nDataLength as long, nDecimalLength as Long)
	Super()
	SELF:nSLEType := nDataType
	SELF:nLength    := nDataLength
	If (SELF:nSLETYpe == SLEType.Numeric .or.;
	   SELF:nSLEType == SLETYpe.Character) .and. ;
	   SELF:nLength == 0
	   // Error the character or numeric types requires a length
		THROW ApplicationException{"Error - Length > 0 Required"}
	ENDIF
	SELF:nDecimals  := nDecimalLength
	RETURN    
#ENDREGION
#REGION "   Methods   "

/****************************************************************************/
METHOD SetDataType(cDataType as String) as VOID
	local cType as String
	// several constructors will use a string for datatype so seperate it out as a method
	cType := Upper(cDataType)
	IF cType == "C" .OR. cType == "M"
		SELF:nSLEType := SLEType.Character
	ELSEIF ctype == "N" .OR. cType == "F"
		SELF:nSLEType := SLEType.Numeric
	ELSEIF cType == "L"
		SELF:nSLEType := SLEType.LOGIC
	ELSEIF cType == "D"
		SELF:nSLEType := SLEType.DATE
	ELSE
		// error invalid data type passed
		THROW ApplicationException{"Error - Invalid datatype passed"}
	ENDIF
	RETURN

/****************************************************************************/
METHOD Transform( cValue as String ) as String
	// Format the value into a string according to the picture clause
	// should default to windows formats
	LOCAL cResult   AS STRING
	LOCAL cTemp     AS STRING   
	LOCAL lScience  AS LOGIC    
	LOCAL lZero :=FALSE   AS LOGIC    

	IF SELF:cPicture == NULL
		IF SELF:nSLEType == SLEType.Numeric
			IF SELF:nDecimals == 0
				cResult := Transform(cValue,Replicate("9",(dword)SELF:nLength))
			ELSE
				cResult := Transform(cValue,Replicate("9",(dword)SELF:nLength - (dword)SELF:nDecimals-1)+"."+Replicate("9",(dword)SELF:nDecimals))
			ENDIF

			IF SubStr3(cResult,1,1) == "*"
				lScience    := SetScience(TRUE)
				cTemp       := cValue:ToString()
				SetScience(lScience)
				IF cTemp:Length > SELF:nLength 
					cTemp   := cTemp:Trim() // AllTrim(StrTran(cTemp,CHR(0)))
					IF cTemp:Length > SELF:nLength
						IF lZero //Still too long
							cResult := StrTran(cResult,"0","*")
						ENDIF
					ELSE
						IF cTemp:Length <= SELF:nLength
							cResult := Left(cTemp, (dword)SELF:nLength)
						ELSE
							cResult := Space((dword)SELF:nLength - cTemp:Length)+cTemp
						ENDIF
					ENDIF
				ELSE
					cResult := cTemp
				ENDIF
			ENDIF
		ELSEIF cValue == NULL .AND. SELF:nSLEType == SLEType.Character
			cResult := ""
		ELSE
			cResult := cValue:ToString()
		ENDIF
	ELSE
		cResult := Transform(cValue,cPicture)
	ENDIF

	RETURN cResult
	
/****************************************************************************/
METHOD Val( cString as String ) as Usual
	// Converts a string to the appropriate data type

	LOCAL xRet  AS USUAL
	LOCAL cType AS STRING

	IF cString <> null
		IF SELF:nSLEType == SLEType.Numeric
			cType := "N"
			xRet := Unformat( cString, cPicture, cType)

		ELSEIF SELF:nSLEType == SLEType.Date
			cType := "D"
			xRet := Unformat( cString, cPicture, cType)

		ELSEIF SELF:nSLEType == SLEType.Logic
			cType := "L"
			xRet := Unformat( cString, cPicture, cType)

		ELSEIF SELF:nSLEType == SLEType.Character
			cType := "C"
			xRet  := Unformat( cString, cPicture, cType)
		ENDIF
	ELSE
		xRet := ""
	ENDIF

	RETURN xRet
	
#ENDREGION
#REGION "   Access / Assings "

/****************************************************************************/
ACCESS Decimals AS Long
	// Returns the number of decimals
	RETURN SELF:nDecimals

/****************************************************************************/
ASSIGN Decimals(nNumDecimals AS Long) AS Void
	// Assign the number of decimals
	IF SELF:nSLEType == SLEType.Numeric
		SELF:nDecimals := nNumDecimals
	ELSE
		THROW ApplicationException{"Decimals not valid for a non numeric SLE"}	    
	ENDIF
	RETURN 

/****************************************************************************/
ACCESS Length AS Long
	// Returns the length of the field
	RETURN SELF:nLength

/****************************************************************************/
ASSIGN Length(nVar AS Long) as VOID
	// Returns the length of the field
	If (SELF:nSLETYpe == SLEType.Numeric .or.;
	   SELF:nSLEType == SLETYpe.Character) .and. ;
		nVar == 0
		THROW ApplicationException{"Error - Length > 0 Required"}	                    
	ELSE	                    
		SELF:nLength := nVar
	ENDIF
	RETURN

/****************************************************************************/
Access Name AS String
	RETURN SELF:cName

/****************************************************************************/
ASSIGN Name(cVar as String) as VOID
	cName := cVar
	RETURN    

/****************************************************************************/
ACCESS Picture AS String           
	RETURN SELF:cPicture

/****************************************************************************/
ASSIGN Picture( cNewPicture as String ) AS Void
	SELF:cPicture := cNewPicture
	RETURN

/****************************************************************************/
PROPERTY TypeasString AS STRING
	GET
		LOCAL cResult AS STRING
		TRY
			DO CASE
				CASE SELF:nSLEType == SLEType.Numeric
					cResult := "N"
				CASE SELF:nSLEType == SLEType.Character
					cResult := "C"
				CASE SELF:nSLEType == SLEType.Date
					cResult := "D"
				CASE SELF:nSLEType == SLEType.Logic
					cResult := "L"
				OTHERWISE
					cResult := "C"
			END CASE
		CATCH ex AS System.NullReferenceException
			cResult := "U"
		END TRY
		RETURN cResult
	END GET	
END PROPERTY

/****************************************************************************/
ACCESS Type AS SLEType
	RETURN nSLEType

/****************************************************************************/
ASSIGN Type(newValue AS SLEType) AS VOID 
		  SELF:nSLEtype := newValue
	RETURN

#ENDREGION
END Class

CLASS DateFS Inherit PictureSpec
ConStructor()
	super("D")
	SELF:Name   := "DateFS"
	RETURN 
END CLASS

CLASS IntegerFS Inherit PictureSpec
ConStructor()
	super("N",10,0)
	SELF:Name       := "IntegerFS"
	SELF:Picture    := "99,999,999"
	RETURN 
END CLASS

CLASS LogicFS Inherit PictureSpec
ConStructor()
	super("L",1)
	SELF:Name       := "LogicFS"
	RETURN 
END CLASS

CLASS MoneyFS Inherit PictureSpec
ConStructor(nLength as long, nDec as long)
	super("N",nLength,nDec)
	SELF:Name       := "MoneyFS"
	RETURN 
END CLASS

CLASS NumberFS Inherit PictureSpec
ConStructor()
	super("N",12,2)
	SELF:Name       := "NumberFS"
	SELF:Picture    := "9,999,999.99"
	RETURN 
END CLASS

CLASS StringFS Inherit PictureSpec
ConStructor(nLength as long)
	super("C",nLength)
	SELF:Name       := "StringFS"
	RETURN 
END CLASS
