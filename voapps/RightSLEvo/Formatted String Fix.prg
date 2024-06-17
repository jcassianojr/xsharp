CLASS rightSLEFormattedString INHERIT __FormattedString
// Author		: Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 9 June 2004
// --------------
//l formattedString Class
//p formattedString class
//d	rightSLEFormattedString inherits from the SLE __FormattedString class \line
//d and resets the way selection deletes are handled with template characters.
//g Internal Methods

/****************************************************************************/
METHOD DeleteSelection(iStart AS INT, iEnd AS INT) AS VOID 

	//p Method to delete a selection
	//l DeleteSelection method
	//r VOID
	//a iStart	- Integer	- Starting place in the textvalue to delete \line
	//a iEnd	- Integer	- ending place in the textvalue to delete
	
	LOCAL i AS INT
	LOCAL lInvert AS LOGIC
	LOCAL iDelPos AS INT
	LOCAL iDecPos AS INT
	LOCAL iSignPos AS INT
	LOCAL lNumeric AS LOGIC

	IF (iEnd <= iStart)
		iEnd := iStart
	ELSE
		iEnd--
	ENDIF

	iDelStart := iStart
	iDelEnd := iEnd

	lNumeric := (cType == "N")

	IF lNumeric .and. ((iDecPos := INT(_CAST, At2(CHR(wDecSep), sValue))) > istart) .and. (iDecPos < iEnd)
		SELF:DeleteSelection(iStart, iDecPos)
		SELF:DeleteSelection(iDecPos+1, iEnd+1)
	ELSE
		lInvert := ((lNumeric) .and. (At3(CHR(wDecSep), sValue, (dword)iEnd) > 0))
		IF !lInvert
			iDelPos := iStart
			// wcm 2004-06-09 - replaced for next with a while to weed out
			//                  template characters
			DO WHILE iDelPos <= iDelEnd
				IF SELF:IsEditPos(iDelPos)
					SELF:DeleteChar(iDelPos, lInvert, FALSE)
					iDelEnd -= 1
				ELSE
					iDelPos += 1
				ENDIF
			ENDDO
		ELSE
			IF (lNumeric)
				iSignPos := INT(_CAST, At2("-", sValue))
				IF (iSignPos > 0)
					SELF:PutChar(" ", iSignPos)
				ENDIF
			ENDIF
			FOR i:= iEnd DOWNTO iStart
				iDelPos := iEnd
				IF SELF:IsEditPos(i)
					SELF:DeleteChar(iDelPos, lInvert, FALSE)
					iDelStart := iDelStart + 1
				ELSE
					iDelPos := i-1
				ENDIF
			NEXT
		ENDIF
		SELF:UpdateEditOwner()

		IF (lInvert .or. (wScrMode == SCRMODE_NO))
			oEditOwner:__CurPos := SELF:PrevEditPos(iEnd+1)
		ENDIF
	ENDIF

	iDelStart := iDelEnd := 0

	RETURN	

/****************************************************************************/
ACCESS EmptyValue AS STRING 

	//p Access to return an empty value for a given picture
	//l Access to return an empty value for a given picture
	//d this access will return an empty string for a given picture
	//r STRING
	
	LOCAL sEmpty 		AS STRING
	LOCAL cCurTplChar 	AS STRING
	LOCAL cTempChr		AS STRING
	LOCAL cPicture		AS STRING
	LOCAL i 			AS LONGINT
	LOCAL nCurPos		AS LONGINT

	sEmpty := ""
    IF Instr("$",sPicture)
    	cPicture := Right(sPicture,SLen(sPicture) - RAt("$",sPicture)-1)	// get rid of the $ now that we know it is there
		cTempChr := OBJECT(SELF:oEditOwner):CurrencySymbol()
		IF !Empty(cTempChr)
			nCurPos	:= OBJECT(SELF:oEditOwner):CurrencyPosition
			DO CASE
				CASE nCurPos == 0
					cPicture := "@R " + cTempChr + cPicture
				CASE nCurPos == 2				
					cPicture := "@R " + cTempChr + " " + cPicture
				CASE nCurPos == 1
					cPicture := "@R " + cPicture + cTempChr
				CASE nCurPos == 3
					cPicture := "@R " + cPicture + " " + cTempChr
				OTHERWISE
					cPicture := "@R " + cTempChr + cPicture					
			ENDCASE
			SELF:Picture := cPicture
			IF !Empty(SELF:oEditOwner:fieldSpec)
				SELF:oEditOwner:fieldSpec:picture := cPicture
			ENDIF
		ENDIF
	ENDIF

	FOR i:=1 UPTO iTemplLen
		cCurTplChar := CharPos(sTemplate, (dword)i)
		IF IsEditTemplChar(cCurTplChar)
			IF (sEmpty == NULL_STRING)
				sEmpty := Space(1)
			ELSE
				sEmpty += " "
			ENDIF
		ELSE
			IF (cCurTplChar == ".") .and. (cType == "N")
				sEmpty += CHR(wDecSep)
			ELSEIF (cCurTplChar == ",") .and. (cType == "N")
				sEmpty += CHR(wThousSep)
			ELSE
				sEmpty += cCurTplChar
			ENDIF
		ENDIF
	NEXT

	RETURN sEmpty
	
/****************************************************************************/
Constructor(Owner, PicString, Type, OverWrite, DefTempl, ScrMode)

    super(Owner, PicString, Type, OverWrite, DefTempl, ScrMode)
//ToDo Remove the workaround when the new build comes out
    // **************************************************
    // * work around till the @d gets fixed             *
    // **************************************************
    if lower(trim(PicString)) == "@d"
        self:sTemplate := "99/99/9999"
    endif
    // **************************************************
    // * end of workaround                              *
    // **************************************************        
RETURN 
END CLASS

/****************************************************************************/
STATIC FUNCTION IsEditTemplChar(cTest AS STRING) AS LOGIC
	//p function to see if a character is in the edit template
	//l function to see if a character is in the edit template
	//d this function takes a character as input and tests to see if it part of the \line
	//d standard VO edit template characters.
	//r LOGIC
	//a cTest \tab - String \tab - Character to test
   RETURN At2(cTest, "ANX9!YL#") != 0