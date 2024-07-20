// EditMask.prg
INTERNAL _DLL FUNCtion GetKeyboardState( lpKeyState AS BYTE[]) AS LOGIC PASCAL:USER32.GetKeyboardState
INTERNAL _DLL FUNCTION SendMessage(hwnd AS IntPtr, Msg AS DWORD, wParam AS DWORD, lParam AS LONG);
	AS LONG PASCAL:USER32.SendMessageA
INTERNAL _DLL FUNCTION MessageBeep(uType AS DWORD) AS LOGIC PASCAL:USER32.MessageBeep
GlOBAL CONST VK_INSERT := 0x2d AS dword
#DEFINE WM_NEXTDLGCTL 0x0028

//#USING System.Windows.Forms
#USING System.Globalization
#USING System.Text
#USING System.Windows.Input
#USING System.Windows
#USING rightSLE.Internal


BEGIN NAMESPACE wmGUI.wpf

/****************************************************************************/
CLASS PictureFuncFlags
	export funcArray    as logic[]
	constructor()
		funcArray := logic[]{11}
		return
end class
	
/****************************************************************************/
CLASS EditMask
#REGION "   IVars"
	PROTECT oEditOwner          AS SLE
	protect sPicture            AS string
	protect sTemplate           AS string
	protect sValue              AS string   
	protect cDecSep             AS string
	protect cThousSep           AS string
	protect cCurSymbol          AS string
	PROTECT cTemplateChar       AS String
	PROTECT sTemplateChar       AS STRING
	protect nType               AS SLEType
	protect wOverWrite          AS overwriteBehavior
	protect wScrMode            AS scrlModeBehavior
	protect iTemplLen           AS long
	protect iCurrencyPos        AS long
	protect iDelStart           AS long
	protect iDelEnd             AS long
	protect oPictureFuncflags   AS PictureFuncFlags
	PROTECT lTurnNegative       AS Logic
#ENDREGION    
#REGION "   Contructors"      
/****************************************************************************/
   CONSTRUCTOR(owner as object,PicString as string, Type as SLEType, Overwrite as overwriteBehavior, DefaultTemplate as string, ScrlMode as scrlModeBehavior)
		local numberFormat as NumberFormatInfo
		IF Type == SLEType.Auto
			SELF:nType := SLEType.Character
		ELSE
			SELF:nType := Type
		ENDIF
		SELF:oEditOwner         := (SLE)owner
		SELF:oPictureFuncFlags  := PictureFuncFlags{}
		numberFormat            := NumberFormatInfo.CurrentInfo
		SELF:cDecSep            := numberFormat:NumberDecimalSeparator
		SELF:cThousSep          := numberFormat:NumberGroupSeparator
		self:cCurSymbol         := numberFormat:CurrencySymbol
		SELF:icurrencyPos       := numberFormat:CurrencyPositivePattern
		SELF:wOverWrite         := OverWrite
		self:wScrMode           := ScrlMode
		SELF:cTemplateChar      := self:cThousSep + SELF:cCurSymbol + "()$ "  
		SELF:sTemplateChar      := "ANX9!YL#"      

		// set the picture for this SLE
		SELF:Picture            := PicString

		IF !Empty(DefaultTemplate) .and. Empty(sTemplate)
			SELF:sTemplate  := DefaultTemplate
			SELF:sPicture   := sPicture + " " + DefaultTemplate
			SELF:iTemplLen  := sTemplate:Length
		ENDIF

		// set the initial value to emptyvalue
		SELF:sValue := SELF:EmptyValue

		SELF:UpdateEditOwner(1)
			  
	  RETURN
#ENDREGION
#REGION "   Methods"
/****************************************************************************/
METHOD SetText(cValue as String) as VOID
	LOCAL cTemp AS String
	IF cValue == NULL
		SELF:sValue := SELF:EmptyValue
	ELSE
		IF SELF:nType == SLEType.Character .AND. SELF:iTemplLen > cValue:Length
			cTemp := cValue + Space(DWORD(iTemplLen) - cValue:Length)	    	
			SELF:sValue := Transform(cTemp, SELF:sPicture)
		ELSEIF SELF:nType == SLEType.Numeric
			cTemp := SELF:SetField(cValue,1)
			SELF:sValue := cTemp
		ELSE
			SELF:sValue := Transform(cValue, SELF:sPicture)
		ENDIF
	ENDIF
	SELF:oEditOwner:Text := SELF:sValue
	IF SELF:nType == SLEType.Numeric
		SELF:oEditOwner:__CurPos := SELF:DecimalPos
	ENDIF
	RETURN
			   
/****************************************************************************/
METHOD AsString() AS STRING
	RETURN sValue    

/****************************************************************************/
METHOD TestFirstChar() as void
	LOCAL iCurPos    AS LONG

	iCurPos := 0
	IF !SELF:IsEditPos(iCurPos)
		iCurPos := SELF:NextEditPos(iCurPos)
		if iCurPos > 0
			SELF:oEditOwner:SelectionStart := iCurPos -1 // selection is zero based
		ELSE
			SELF:oEditOwner:SelectionStart := iCurPos   // This shouldnt happen but we dont want to error
		ENDIF
		SELF:oEditOwner:SelectionLength := 0
	ENDIF
	
	RETURN
	
/****************************************************************************/
METHOD IsEditTemplChar(CharToTest AS STRING) AS LOGIC 
	LOCAL lRet as LOGIC
	IF CharToTest == null
		lRet := false
	ELSEIF CharToTest:Length == 0
		lRet := FALSE
	ELSE
		// lRet := (logic)(SELF:sTemplateChar:IndexOf(CharToTest) + 1)
		lRet := (SELF:sTemplateChar:IndexOf(CharToTest) + 1) > 0
	ENDIF
   RETURN lRet

/****************************************************************************/
METHOD IsEditPos(iPos AS long) AS LOGIC 
	LOCAL lRet as LOGIC
	lRet    := TRUE // default is to perform the search
	IF iPos == 0
		lRet := FALSE
	ELSE
		IF (iPos-1) >= SELF:sTemplate:Length
		  IF SELF:nType == SLEType.Numeric
			iPos := SELF:sTemplate:Length
		  ELSE
			lRet := FALSE   // dont perform the search
		  ENDIF
		ENDIF
		IF lRet
			lRet := self:IsEditTemplChar(SELF:sTemplate:Substring(iPos-1,1))
		ENDIF
	ENDIF
	RETURN lRet

/****************************************************************************/
METHOD DeleteChar(iPos AS LONG, lInvert AS LOGIC, lUpdateOwner AS LOGIC) AS VOID 
	LOCAL iCurPos   AS LONG
	LOCAL iNextPos  AS LONG
	LOCAL iCurSave  AS LONG
	LOCAL sNextChar AS STRING

	IF IsNil(iPos)
		iCurPos := oEditOwner:__CurPos
	ELSE
		iCurPos := iPos
	ENDIF
	// ****************************************************************************
	// * with the new formating option we have to save the cursor position and    *
	// * send it to updateEditOwner                                               *
	// ****************************************************************************
	iCurSave    := iCurPos  
	IF SELF:nType == SLEType.Numeric .and. lInvert
		iCurSave += 1
		IF !SELF:IsEditPos(iCurPos)
			sNextChar := SELF:TemplatePos(sValue,iCurSave)            
			IF sNextChar <> SELF:cDecSep
				iCurSave += 1
				iCurPos  += 1
			ENDIF
		ENDIF
	ENDIF
	

	IF !SELF:IsEditPos(iCurPos)
		IF SELF:TemplatePos(sValue,iCurPos) != "."
			SELF:InvalidAction()
		ENDIF
		RETURN
	ENDIF

	IF !lInvert
		iNextPos := SELF:NextEditPos(iCurPos + 1)
	ELSE
		iNextPos := SELF:PrevEditPos(iCurPos - 1)
	ENDIF

	IF (SELF:wScrMode != scrlModeBehavior.No)
		WHILE (iCurPos > 0) .AND. (iNextPos > 0)
			IF (wScrMode != scrlModeBehavior.Full) .AND. (System.Math.Abs(iNextPos - iCurPos) != 1)
				EXIT
			ENDIF
			sNextChar := SELF:TemplatePos(sValue,iNextPos)

			IF ((iNextPos >= iDelStart) .AND. (iNextPos <= iDelEnd)) .OR. (SELF:IsValidChar(sNextChar, iCurPos, TRUE))
				IF SELF:IsEditPos(iNextPos)
					SELF:PutChar(sNextChar, iCurPos)
					SELF:PutChar(" ", iNextPos)
				ELSE
					SELF:PutChar(" ", iCurPos)
				ENDIF
			ELSE
				EXIT
			ENDIF
			iCurPos := iNextPos
			IF !lInvert
				iNextPos := SELF:NextEditPos(iCurPos + 1)
			ELSE
				iNextPos := SELF:PrevEditPos(iCurPos - 1)
			ENDIF
		END
	ENDIF

	IF (SELF:IsEditPos(iCurPos))
		SELF:PutChar(" ", iCurPos)
	ENDIF

	IF lUpdateOwner
		SELF:UpdateEditOwner(iCurSave)
	ENDIF
	RETURN

/****************************************************************************/
METHOD DeleteSelection(iStart AS LONG, iEnd AS LONG) AS VOID 
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

	SELF:iDelStart   := iStart
	SELF:iDelEnd     := iEnd

	lNumeric := (SELF:nType == SLEType.Numeric)

	IF lNumeric .AND. ((iDecPos := sValue:Indexof(SELF:cDecSep) + 1) > istart) .AND. (iDecPos < iEnd)
		SELF:DeleteSelection(iStart, iDecPos)
		SELF:DeleteSelection(iDecPos+1, iEnd+1)
		// put the cursor back at the decimal seperator
		oEditOwner:__CurPos := SELF:DecimalPos //iDecPos // SELF:DecimalPos
	ELSE
		lInvert := ((lNumeric) .AND. ((sValue:IndexOf(self:cDecSep,iEnd) +1) > 0) .OR. SELF:DecimalPos == 0)
		IF !lInvert
			iDelPos := iStart
			FOR i:= iStart TO iEnd
				IF SELF:IsEditPos(iDelPos)
					SELF:DeleteChar(iDelPos, lInvert, FALSE)
					iDelEnd := iDelEnd-1
				ELSEIF (SELF:wScrMode == scrlModeBehavior.Part)
					iDelPos := i+1
				ELSE
					iDelPos := i+1
				ENDIF
			NEXT
		ELSE
			IF (lNumeric)
				iSignPos := sValue:IndexOf("-") + 1
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
		SELF:UpdateEditOwner(iEnd)

		IF (lInvert .OR. (SELF:wScrMode == scrlModeBehavior.No))
			oEditOwner:__CurPos := SELF:PrevEditPos(iEnd+1)
		ENDIF
	ENDIF

	iDelStart := iDelEnd := 0
	RETURN
/****************************************************************************/
METHOD UpdateEditOwner(iCurPos as Long) AS VOID
	LOCAL iSaveCurPos AS long
	LOCAL cText       AS String
	if SELF:nType == SLEType.Numeric
		if SELF:lTurnNegative 
			cText := SELF:SetField(SELF:sValue,-1)
		else
			cText := SELF:SetField(SELF:sValue,1)            
		endif
		iSaveCurPos                     := iCurPos
//	    iSaveCurPos                     := SELF:oEditOwner:SelectionStart	
	else
		cText := SELF:sValue
		iSaveCurPos                     := SELF:oEditOwner:SelectionStart	
	endif	
	
	// process the update
	SELF:oEditOwner:Text            := cText //SELF:sValue
	SELF:oEditOwner:Modified        := TRUE
	oEditOwner:SelectionStart       := iSaveCurPos
	if SELF:nType == SLEType.Numeric
		oEditOwner:__CurPos         := iSaveCurPos
	endif
	SELF:oEditOwner:SelectionLength := 0
	SELF:sValue                     := cText

	RETURN

/****************************************************************************/
METHOD ProcessKeyEvent(nKeyCode as long) AS LOGIC
	LOCAL lRet      AS LOGIC
	LOCAL lInvert   AS LOGIC
	LOCAL iStart    AS LONG
	LOCAL iEnd      AS LONG
	local cChar     AS String

	cChar := ChrW((dword)nKeyCode)    
	lRet    := TRUE
	
	DO CASE
		CASE nKeyCode == Key.Left
			oEditOwner:__CurPos := SELF:PrevEditPos(-1)
		CASE nKeyCode == Key.Right
			oEditOwner:__CurPos := SELF:NextEditPos(-1)            
		CASE nKeyCode == Key.Home
			oEditOwner:__CurPos := SELF:NextEditPos(1)
		CASE nKeyCode == Key.End
			oEditOwner:__CurPos := SELF:PrevEditPos(SELF:sValue:TrimEnd():Length) + 1
		CASE nKeyCode == Key.Delete .or. nKeyCode == Key.Back
			iStart  := SELF:oEditOwner:__SavedCurPos 
			iEnd    := iStart + SELF:oEditOwner:__SavedCurLen
			if iStart <> iEnd .and. (nKeycode == Key.Delete .or. nKeyCode == Key.Back)
				SELF:DeleteSelection(iStart, iEnd)
			else
				IF nKeyCode == Key.Back
					oEditOwner:__CurPos := SELF:PrevEditPos(-1)
				ENDIF
				iStart              := SELF:oEditOwner:__CurPos
				lInvert := ((SELF:nType == SLEType.Numeric);
							 .AND. (iStart < SELF:sValue:Length ;
							 .AND. ((SELF:sValue:IndexOf(SELF:cDecSep,iStart) + 1) > 0) ;
									.OR. SELF:DecimalPos == 0);
							)                
				if iStart <= SELF:sValue:Length .and. SELF:sValue:Substring(iStart-1,1) <> "." //cChar <> "."		
					SELF:DeleteChar(iStart, lInvert, TRUE)			
				endif
			endif
		CASE cChar == "," .or. nKeyCode == Key.OemPeriod .or. nKeyCode == Key.Decimal
			iStart  := SELF:oEditOwner:__SavedCurPos 
			iEnd    := iStart + SELF:oEditOwner:__SavedCurLen
			IF iStart <> iEnd 
				SELF:DeleteSelection(iStart, iEnd)
			ENDIF			
			oEditOwner:__CurPos := SELF:DecimalPos + 1		
		OTHERWISE
			// *******************************************************************
			// * After you have processed the keydown event, the SelectionStart  *
			// * and SelectionLength variables are lost. I am saving them before *
			// * I do anything so I can catch the message here                   *
			// *******************************************************************            
			iStart  := SELF:oEditOwner:__SavedCurPos 
			iEnd    := iStart + SELF:oEditOwner:__SavedCurLen
			if iEnd < iStart
			   iEnd := iStart
			endif
			IF iStart <> iEnd .AND. SELF:sValue <> SELF:EmptyValue
				SELF:DeleteSelection(iStart, iEnd)
			ENDIF
			
			lRet := SELF:ProcessChar(cChar)
	ENDCASE

	RETURN lRet


/****************************************************************************/
METHOD ProcessChar(cChar AS STRING) AS LOGIC 
	LOCAL iCurPos       AS LONG
	LOCAL iCurTmp       AS LONG
	LOCAL cTemplChar    AS STRING
	LOCAL cEmptyValue   AS STRING
	LOCAL cTempValue    AS STRING
	LOCAL lInvert       AS LOGIC
	LOCAL lWasNeg       AS LOGIC
	LOCAL iDecPos       AS LONG
	LOCAL nResult       AS lONG
	LOCAL lDecCurPos    AS Logic

	iCurPos     := oEditOwner:__CurPos
	lWasNeg     := FALSE
	cEmptyValue := SELF:EmptyValue

	IF SELF:DecimalPos == 0 .and. SELF:nType == SLEType.Numeric .and. ; 
			(iCurPos > SELF:sValue:Length .or. (iCurPos > SELF:iTemplLen .and. SELF:iTemplLen <> SELF:sValue:Length))
		iCurPos -= 1    // get back to the last char in the field
		lDecCurPos  := TRUE
	ENDIF
			
	IF SELF:nType == SLEType.Numeric
		cTempValue  := SELF:SetField(cEmptyValue,1)
		IF SELF:sValue == cTempValue .or. SELF:sValue == cEmptyValue
			IF SELF:DecimalPos == 0
				if SELF:iTemplLen == SELF:sValue:Length
					iCurPos := SELF:sValue:Length
				ELSE
					// we have a numeric SLE with words in part of it. Place the cursor at the end of the editable area
					iCurPos := SELF:iTemplLen
				ENDIF
			ELSE
				if iCurPos < SELF:DecimalPos .or. iCurPos > SELF:sTemplate:Length
					iCurPos := SELF:DecimalPos
				ENDIF
			ENDIF
		ELSE
			// we dont have a totally empty field but we still need to check the left side to see if it is 0
			IF SELF:DecimalPos == 0    	       
				// normal processing here. Decimalpos = 0 means they have typed
				// something into the field and it is non-zero
				iCurTmp := SELF:NextEditPos(1)
				IF iCurTmp == iCurPos .and. SELF:sTemplate:Substring(0,1) == "$"
					iCurPos := SELF:DecimalPos
				ENDIF
			ELSE
				if iCurPos > SELF:DecimalPos
					// normal processing here. Decimalpos = 0 means they have typed
					// something into the field and it is non-zero
					iCurTmp := SELF:NextEditPos(1)
					IF iCurTmp == iCurPos .and. SELF:sTemplate:Substring(0,1) == "$"
						iCurPos     := SELF:DecimalPos
						lDecCurPos  := TRUE
					ENDIF
				ELSE
					// we have a decimal and are on the left side. test the left side to see
					// if it is zero. if so move curpos to the decimalpos
					cTempValue := SELF:RemoveFormatting(SELF:sValue:Substring(0,SELF:DecimalPos-1)) // have to remove any currency symbols that might keep int from seeing the value
					IF !Int32.TryParse(cTempValue,out nResult)
						// error parsing the value, move the cursor to SELF:decimalpos
						iCurPos := SELF:DecimalPos
					ENDIF
					If nResult == 0
						iCurPos := SELF:DecimalPos
					ELSE
						iCurTmp := SELF:NextEditPos(1)
						IF iCurTmp == iCurPos .and. SELF:sTemplate:Substring(0,1) == "$"
							iCurPos := SELF:DecimalPos
						ENDIF
					ENDIF
				ENDIF
			ENDIF
		ENDIF
	ENDIF
	
	cTemplChar := SELF:TemplatePos(SELF:sTemplate,iCurPos)

	IF SELF:MatchesTemplChar(cChar, cTemplChar, FALSE)
		IF cTemplChar == "!"
			cChar:ToUpper()
		ENDIF
		IF ((SELF:wOverWrite == overwriteBehavior.Always) .or. (SELF:wOverWrite == overwriteBehavior.Onkey .and. self:IsOverWriteModeEnabled())) .or.;
			((SELF:nType == SLEType.Numeric) .and. self:sValue:Chars[(iCurPos - 1)]:ToString() == " ")
			IF cChar == "-" .and. SELF:nType == SLEType.Numeric			
				if SELF:lTurnNegative == FALSE
					SELF:lTurnNegative := TRUE
				ELSE
					SELF:lTurnNegative := FALSE
					lWasNeg            := TRUE
				ENDIF
			ELSE
				IF cTemplChar == "." // SELF:cDecSep
					// the template is always a "." regardless of the international settings
					lInvert := TRUE
					// if we are at the decimal sep, insert the char instead of overrighting the decimal
					SELF:InsertChar(cChar, iCurPos, lInvert)
					if iCurPos < SELF:oEditOwner:__CurPos // we have moved across the decimal boundry, update iCurPos
						iCurPos := SELF:oEditOwner:__CurPos
					ENDIF
				ELSE
					SELF:PutChar(cChar, iCurPos)
				ENDIF
			ENDIF
		ELSE
			IF SELF:nType == SLEType.Numeric
				lInvert := (SELF:nType == SLEType.Numeric);
					.and. ((iDecPos := SELF:sValue:IndexOf(SELF:cDecSep,iCurPos-1)) > -1);
					.and. ((SELF:sValue:Substring(iCurPos+1,(long)System.Math.Max((real8)(iDecPos-iCurPos),(real8)0)):IndexOf(" ") == -1) .or. (iCurPos == iDecPos));
					.and. (self:sValue:Chars[((int)(Max(0, (self:NextEditPos(0) - 1))))]:ToString() == " ")
				IF cChar == "-"
					if SELF:lTurnNegative == FALSE
						SELF:lTurnNegative := TRUE
					ELSE
						SELF:lTurnNegative := FALSE
						lWasNeg            := TRUE
					ENDIF
				ELSE
					IF SELF:DecimalPos == 0 .and. (iCurPos == SELF:sValue:Length .or. (iCurPos == SELF:iTemplLen .and. SELF:iTemplLen <> SELF:sValue:Length))
						// we decremented the cursor before we entered the test so we could
						// test the actual templete character now increment it so it
						// will inset into the correct position
						lInvert := true
						if lDecCurPos
							iCurPos += 1    
						ENDIF
						IF SELF:iTemplLen == SELF:sValue:Length
							IF (SELF:sValue:TrimStart():Length <> SELF:sTemplate:Length) .or. SELF:iTemplLen == 1
								SELF:InsertChar(cChar, iCurPos, lInvert)
								IF iCurPos < SELF:oEditOwner:__CurPos // we have moved across the decimal boundry, update iCurPos
									iCurPos := SELF:oEditOwner:__CurPos
								ENDIF
							ELSE
								// we have reached the end of the string, dont add any more chars
								SELF:InvalidAction()
							ENDIF
						ELSE
							// handle a numeric SLE that has writting at the end ie "999 mpg"
							IF SELF:sValue:Substring(0,SELF:iTemplLen):TrimStart():Length <> SELF:iTemplLen
								SELF:InsertChar(cChar, iCurPos, lInvert)
							ELSE
								// we have reached the end of the string, dont add any more chars
								SELF:InvalidAction()
							ENDIF
						ENDIF
					ELSE
						SELF:InsertChar(cChar, iCurPos, lInvert)
						if iCurPos < SELF:oEditOwner:__CurPos // we have moved across the decimal boundry, update iCurPos
							iCurPos := SELF:oEditOwner:__CurPos
						ENDIF
					ENDIF
				ENDIF
			ELSE
				SELF:InsertChar(cChar, iCurPos, lInvert)
				if iCurPos < SELF:oEditOwner:__CurPos // we have moved across the decimal boundry, update iCurPos
					iCurPos := SELF:oEditOwner:__CurPos
				ENDIF
			ENDIF
		ENDIF
		SELF:UpdateEditOwner(iCurPos)
		if !lWasNeg
			IF !lInvert
				iCurPos := SELF:NextEditPos(-1)
			ENDIF
		endif
//		IF ((iCurPos > iTemplLen) .or. (!SELF:IsEditPos(iCurPos)) .and. SELF:nType != SLEType.Numeric) .and. oEditOwner:AutoFocusChange
//			SendMessage(oEditOwner:Parent:Handle, WM_NEXTDLGCTL, 0, 0L)
//		ELSE
			oEditOwner:__CurPos := iCurPos
//		ENDIF
	ELSE	
		IF iCurPos == 0
		   iCurPos := 1
		ENDIF
		IF SELF:nType == SLEType.Numeric .AND. iCurPos < SELF:sValue:Length .AND. SELF:sValue[iCurPos - 1]:ToString() == SELF:cDecSep
				iCurPos++   // we really dont need to do anything here. we are just keeping a warning from showing up
		ELSE
			SELF:InvalidAction()
		ENDIF
	ENDIF

	RETURN TRUE

/****************************************************************************/
METHOD PrevEditPos(iPos AS LONG) AS LONG
	LOCAL i     AS LONG
	LOCAL cTmp  AS STRING

	IF (iPos == -1)
		iPos := oEditOwner:__CurPos - 1
	ENDIF
	
	FOR i := iPos DOWNTO 1
		cTmp := SELF:TemplatePos(SELF:sTemplate,i)
		IF IsEditTemplChar(cTmp)
			RETURN i
		ELSEIF (SELF:nType == SLEType.Numeric) .AND. (cTmp == ".") .AND. (SELF:wOverWrite != overwriteBehavior.Always) .AND.;
			(SELF:wOverWrite != overwriteBehavior.Onkey .OR. !IsOverWriteModeEnabled())
			RETURN i
		ENDIF
	NEXT

	RETURN (long)0

/****************************************************************************/
METHOD NextEditPos(iPos AS long) AS long
	LOCAL i     AS long
	LOCAL cTmp  AS String

	IF (iPos == -1)
		iPos := oEditOwner:__CurPos + 1
	ENDIF

	FOR i := iPos UPTO iTemplLen
		cTmp := SELF:TemplatePos(SELF:sTemplate,i)
		IF SELF:IsEditTemplChar(cTmp)
			RETURN i
		ELSEIF (SELF:nType == SLEType.Numeric) .and. (cTmp == ".") .and. (SELF:wOverWrite != overwriteBehavior.Always) .and.;
			(SELF:wOverWrite != overwriteBehavior.Onkey .or. !IsOverWriteModeEnabled())
			RETURN i
		ENDIF
	NEXT

	RETURN iPos

/****************************************************************************/
METHOD InsertChar(cInsChar AS STRING, iPos AS INT, lInvert AS LOGIC) AS VOID
	LOCAL iCurPos AS INT
	LOCAL iNextPos AS INT
	LOCAL cSaveChar AS STRING
	LOCAL cTempChar AS STRING

	IF IsNil(iPos)
		iCurPos := oEditOwner:__CurPos 
	ELSE
		iCurPos := iPos
	ENDIF

	IF !SELF:IsEditPos(iCurPos) .and. !lInvert
		IF SELF:nType == SLEType.Numeric .AND. SELF:sValue[iCurPos -1]:ToString() == SELF:cDecSep
			iCurPos++
			oEditOwner:__CurPos := iCurPos			
		ELSE
			SELF:InvalidAction()
			RETURN
		ENDIF
	ENDIF

	IF !lInvert
		iNextPos := SELF:NextEditPos(iCurPos + 1)
	ELSE
		iCurPos--
		iNextPos := SELF:PrevEditPos(iCurPos - 1)
	ENDIF

	cSaveChar :=  SELF:TemplatePos(sValue,iCurPos)
	SELF:PutChar(cInsChar, iCurPos)

	WHILE (iCurPos > 0) .and. (iNextPos > 0)
		IF (SELF:wScrMode != scrlModeBehavior.Full) .and. (System.Math.Abs(iNextPos - iCurPos) != 1)
			//if (iNextPos != iCurPos+1) .and. (wScrMode != SCRMODE_FULL)
			EXIT
		ENDIF
		IF (SELF:nType == SLEType.Numeric) .and. !lInvert .AND. iCurPos < SELF:sValue:Length .AND. SELF:sValue[iCurPos -1]:ToString() == SELF:cDecSep
			EXIT
		ENDIF
		IF (SELF:IsValidChar(cSaveChar, iNextPos, FALSE))
			cTempChar := SELF:TemplatePos(sValue,iNextPos)
			IF cTempChar == SELF:cDecSep
				EXIT
			ENDIF
			SELF:PutChar(cSaveChar, iNextPos)
			cSaveChar := cTempChar
		ELSE
			EXIT
		ENDIF
		iCurPos := iNextPos
		IF !lInvert
			iNextPos := SELF:NextEditPos(iCurPos + 1)
		ELSE
			iNextPos := SELF:PrevEditPos(iCurPos - 1)
		ENDIF
	END
	RETURN


/****************************************************************************/
METHOD PutChar(cChar AS STRING, iPos AS INT) AS VOID
	local builder   AS StringBuilder
	local c         AS Char

	IF (iPos <= SELF:sValue:length)
		builder := StringBuilder{self:sValue}
		c := cChar:Chars[0]
		IF SELF:oPictureFuncFlags:funcArray[TemplateInfo.ConvUpper] .or. ((iPos-1) <= SELF:sPicture:Length .and. SELF:sPicture:Substring(iPos-1,1) == "!")
			c := Char.ToUpper( c )
		ENDIF
		builder:Chars[(iPos - 1)] := c
		self:sValue := builder:ToString()
	ENDIF
	RETURN

/****************************************************************************/
METHOD InvalidAction() AS VOID PASCAL
	MessageBeep(0xFFFFFFFF)
	RETURN

/****************************************************************************/
METHOD IsValidChar(cChar as String, iPos as int, lIgnoreBlank as logic) as logic
	return self:MatchesTemplChar(cChar, SELF:TemplatePos(self:sTemplate,iPos), lIgnoreBlank)

/****************************************************************************/
METHOD IsOverWriteModeEnabled() AS LOGIC STRICT
   LOCAL lResult    AS LOGIC
   LOCAL aKeyStates AS BYTE[]
   aKeyStates := byte[]{256}
   GetKeyboardState(aKeyStates)

   lResult := !LOGIC(_CAST, _And(aKeyStates[VK_INSERT], 1))
   RETURN lResult
	
/****************************************************************************/
METHOD MatchesTemplChar(cTest AS STRING, cTemplChar AS STRING, lIgnoreBlank AS LOGIC) AS LOGIC
	LOCAL lIsNumeric AS LOGIC
	LOCAL cTemplate  AS String
	
	cTemplate   := " +-"	
	lIsNumeric := (SELF:nType == SLEType.Numeric)

	IF !SELF:IsEditTemplChar(cTemplChar) .and. lIsNumeric
		if cTemplChar <> "." // template char is always a "." regardless of the keyboard
			RETURN FALSE
		endif
	ENDIF

	// speed up this case
	IF (cTemplChar == "X")
		RETURN TRUE
	ENDIF

	IF (cTest == " " .and. lIgnoreBlank)
		RETURN TRUE
	ENDIF

	DO CASE
		CASE cTemplChar == "A"
			RETURN iif(String.IsNullOrEmpty(cTest),FALSE, char.IsLetter(cTest,0) )
		CASE cTemplChar == "N"
			RETURN iif(String.IsNullOrEmpty(cTest),FALSE, char.IsLetterOrDigit(cTest,0))
		CASE (cTemplChar == "9" .or. cTemplChar == ".")
			RETURN iif(String.IsNullOrEmpty(cTest),false,char.IsDigit(cTest,0)) .or. (SELF:nType == SLEType.Numeric .and. (iif(String.IsNullOrEmpty(cTest),false,cTemplate:IndexOf(cTest) > -1)) )
		CASE cTemplChar == "#"
			RETURN iif(String.IsNullOrEmpty(cTest),FALSE, char.IsDigit(cTest,0)) .or.(iif(String.IsNullOrEmpty(cTest),false,cTemplate:IndexOf(cTest) > -1)) 
		CASE cTemplChar == "!"
			RETURN iif(String.IsNullOrEmpty(cTest),FALSE,TRUE) //TRUE
		CASE cTemplChar == "Y"
			RETURN ("YN":IndexOf(cTest:ToUpper() ) > -1) //At2(cTest:ToUpper(),"YN") > 0)
		CASE cTemplChar == "L"
			cTest := cTest:ToUpper()
			RETURN ("YN":IndexOf(cTest) > -1) .or.;
				(cTest == "T") .or.;
				(cTest == "F")
		CASE cTemplChar == "." .and. SELF:nType == SLEType.Numeric
			RETURN TRUE
	ENDCASE

	RETURN FALSE

/****************************************************************************/
METHOD SetField(cText AS STRING,nMult AS LONGINT) AS STRING 

	//l formats the string based on the picture.
	//p formats the string based on the picture.
	//r STRING
	//a cText \tab - Text value to format. \line
	//a nMulti \tab - Multiplier to make the result positive or negative.

	LOCAL cRetString	AS STRING
	LOCAL cTmpString	AS STRING
	LOCAL nResult       AS real8
	cTmpString  := SELF:RemoveFormatting(cText)
	if !Double.TryParse(cTmpString,nResult)
		nResult   := 0
	ENDIF
	cRetString := Transform(nResult * nMult,SELF:sPicture)
	RETURN cRetString
/****************************************************************************/
METHOD RemoveFormatting(cText AS STRING) AS STRING 

	//l Removes the seperators and gives us a basic string
	//p Removes the seperators and gives us a basic string
	//r STRING
	//a cText \tab - Text value to format. \line

	LOCAL cRetString	AS STRING
	LOCAL cTmpString	AS STRING
	LOCAL i				AS LONG
	LOCAL nStrLen		AS LONG
	LOCAL cCharToTest   AS STRING

	DO CASE
		CASE cText:IndexOf(SELF:cThousSep) > -1
			cTmpString := ""
			nStrLen  := cText:Length
			FOR i := 0 UPTO nStrLen -1
				cCharToTest := cText:Substring(i,1)
				IF (SELF:cTemplateChar:IndexOf(cCharToTest) < 0)
					if char.IsDigit(cCharToTest ,0 )  .or. cCharToTest == SELF:cDecSep
						cTmpString += cCharToTest
					ENDIF
				ENDIF
			NEXT
		CASE cText:IndexOf(":") > -1 // Added for ":" in picture = wem (06/15/00)
			cTmpString := ""
			nStrLen  := cText:Length
			FOR i := 0 UPTO nStrLen -1
				cCharToTest := cText:Substring(i,1)
				IF cText:Substring(i,1) <> ":"
					cTmpString += cCharToTest
				ENDIF
			NEXT
		OTHERWISE
			cTmpString := ""
			nStrLen  := cText:Length
			FOR i := 0 UPTO nStrLen -1
				cCharToTest := cText:Substring(i,1)
				IF (SELF:cTemplateChar:IndexOf(cCharToTest) < 0)
					if char.IsDigit(cCharToTest ,0 ) .or. cCharToTest == SELF:cDecSep
						cTmpString += cCharToTest
					ENDIF
				ENDIF
			NEXT
	ENDCASE
	cRetString := cTmpString
	RETURN cRetString
/****************************************************************************/
Method TemplatePos(c as String, iPos as Long) as String
	LOCAL cRet  as String
		cRet := ""
	IF ((iPos > 0) .and. (iPos <= c:Length ))
		cRet := c:Substring((iPos  - 1), 1)
	ENDIF
	return cRet
	

#ENDREGION
#REGION "   Access / Assigns"
/****************************************************************************/
Access Template as String
	RETURN SELF:sTemplate

/****************************************************************************/
ACCESS TemplateLength as Long
	RETURN SELF:iTemplLen    

/****************************************************************************/
ASSIGN TYPE(nNewType AS SLEType) AS void
	SELF:nType := nNewType
	SELF:UpdateEditOwner(1) // wcm 2010-04-23
	RETURN

/****************************************************************************/
ACCESS Type AS SLEType
	RETURN SELF:nType

/****************************************************************************/
ACCESS DecimalPos AS long
	RETURN SELF:sTemplate:IndexOf(".") + 1

/****************************************************************************/
ACCESS IsEmpty AS LOGIC 
	RETURN (SELF:sValue == SELF:EmptyValue)
	  
/****************************************************************************/
ACCESS Picture() as string
	RETURN SELF:sPicture
	
/****************************************************************************/
ASSIGN Picture(NewPicture as STRING) as void
	LOCAL iSpcPos       AS Long
	LOCAL iFuncPos      AS Long
	LOCAL i             AS Long
	LOCAL nStrLen       AS Long
	LOCAL sFuncChar     AS STRING
	LOCAL cTmpString    AS STRING
	LOCAL cCharToTest   AS STRING

	SELF:sPicture := NewPicture
	
	// handle functions
	IF SELF:sPicture:Substring(0,1) == "@"
		iSpcPos := SELF:sPicture:IndexOf(" ") + 1
		IF (iSpcPos == 0)
			iSpcPos := SELF:sPicture:Length + 1
		ENDIF
		FOR i := 2 TO (iSpcPos-1)
			sFuncChar := SELF:TemplatePos(SELF:sPicture,i)
			iFuncPos := "BCDERXZ(!A":IndexOf(sFuncChar) + 1
			IF (iFuncPos > 0)
				SELF:oPictureFuncFlags:funcArray[iFuncPos] := TRUE
			ENDIF
		NEXT
		if iSpcPos > SELF:sPicture:Length
			// reduce it by 1 so the dotNet substring will get the entire picture
			iSpcPos -= 1
		endif
	ENDIF

	IF SELF:nType == SLEType.Numeric
		SELF:sTemplate := SELF:sPicture:Substring(iSpcPos)
		cTmpString := ""
		nStrLen  := SELF:sTemplate:Length
		FOR i := 0 UPTO nStrLen -1
			cCharToTest := SELF:sTemplate:Substring(i,1)
			// unlike removeformatting we want to include all valid numeric formatting codes for the picture
			IF char.IsDigit(cCharToTest ,0 ) .or. cCharToTest == SELF:cDecSep .or. cCharToTest == SELF:cThousSep .or. cCharToTest == SELF:cCurSymbol
			   cTmpString += cCharToTest
			ENDIF
		NEXT
		SELF:sTemplate := cTmpString
		SELF:iTemplLen := SELF:sTemplate:Length
	ELSE
		SELF:sTemplate := SELF:sPicture:Substring(iSpcPos)
		SELF:iTemplLen := SELF:sTemplate:Length
	ENDIF

	IF ((SELF:nType == SLEType.Date) .or. (SELF:nType == SLEType.Character)) .and. SELF:oPictureFuncFlags:funcArray[TemplateInfo.SetDate]
		SELF:sTemplate := GetDateFormat():Toupper()
		SELF:iTemplLen := SELF:sTemplate:Length
		sTemplate := sTemplate:Replace( 'D', '9' ):Replace( 'M', '9' ):Replace( 'Y', '9' )
	ENDIF

	IF (SELF:iTemplLen == 0)
		IF SELF:oPictureFuncFlags:funcArray[TemplateInfo.AlphaOnly]
			SELF:sTemplate := Replicate("A", Min(Min(TemplateInfo.DEFAULT_STRING_TEMPL_SIZE, SELF:oEditOwner:MaxLength), TemplateInfo.DEFAULT_STRING_TEMPL_SIZE))    // fieldspec length will go inplace of the 2nd template length once I have fieldspecs working
		ELSEIF SELF:oPictureFuncFlags:funcArray[TemplateInfo.ConvUpper]
			SELF:sTemplate := Replicate("!", Min(Min(TemplateInfo.DEFAULT_STRING_TEMPL_SIZE, SELF:oEditOwner:MaxLength),TemplateInfo.DEFAULT_STRING_TEMPL_SIZE))     // fieldspec length will go inplace of the 2nd template length once I have fieldspecs working
		ENDIF
		SELF:iTemplLen := SELF:sTemplate:Length
	ENDIF
	
	RETURN

/****************************************************************************/
ASSIGN Text(cValue as STRING) as VOID
   LOCAL cTemp AS String
	IF cValue == NULL
		SELF:sValue := SELF:EmptyValue
	ELSE
		IF SELF:nType == SLEType.Character .AND. SELF:iTemplLen > cValue:Length
			cTemp := cValue + Space(DWORD(iTemplLen) - cValue:Length)	    	
			SELF:sValue := Transform(cTemp, SELF:sPicture)
		ELSEIF SELF:nType == SLEType.Numeric
			cTemp := SELF:SetField(cValue,1)
			SELF:sValue := cTemp
		ELSE
			SELF:sValue := Transform(cValue, SELF:sPicture)
		ENDIF
	ENDIF
	SELF:oEditOwner:Text := SELF:sValue
	IF SELF:nType == SLEType.Numeric
		SELF:oEditOwner:__CurPos := SELF:DecimalPos
	ENDIF
	RETURN
/*
	IF uValue == NULL
		SELF:sValue := SELF:EmptyValue
	ELSE
		IF SELF:nType == SLEType.Character .AND. SELF:iTemplLen > (long)len(uValue)
			uValue := uValue + Space(DWORD(iTemplLen) - Len(uValue))
		ENDIF

		SELF:sValue := Transform(uValue, SELF:sPicture)
	ENDIF
	SELF:oEditOwner:Text := SELF:sValue
	IF SELF:nType == SLEType.Numeric
		SELF:oEditOwner:__CurPos := SELF:DecimalPos
	ENDIF
	RETURN
*/    
   
/****************************************************************************/
ACCESS EmptyValue AS STRING 
	LOCAL sEmpty        AS STRING
	LOCAL cCurTplChar   AS STRING
	LOCAL cPicture		AS STRING
	LOCAL i             AS long

	sEmpty := ""
	
	IF (SELF:sPicture:IndexOf("$") > -1)
		cPicture :=  SELF:sPicture:Substring((SELF:sPicture:IndexOf("$") + 1) )  // Right(SELF:sPicture,SELF:sPicture:Length - RAt("$",sPicture))	// get rid of the $ now that we know it is there
		IF !Empty(SELF:cCurSymbol)
			DO CASE
				CASE SELF:iCurrencyPos == 0
					cPicture := "@R " + self:cCurSymbol + cPicture
				CASE  SELF:iCurrencyPos == 2				
					cPicture := "@R " + self:cCurSymbol + " " + cPicture
				CASE SELF:iCurrencyPos == 1
					cPicture := "@R " + cPicture + self:cCurSymbol
				CASE SELF:iCurrencyPos == 3
					cPicture := "@R " + cPicture + " " + self:cCurSymbol
				OTHERWISE
					cPicture := "@R " + self:cCurSymbol + cPicture					
			ENDCASE
			SELF:Picture       := cPicture
			//SELF:sTemplate  := cPicture
		ENDIF
	ENDIF

	

	FOR i := 1 UPTO SELF:iTemplLen
		cCurTplChar := SELF:TemplatePos(SELF:sTemplate,i)
		IF SELF:IsEditTemplChar(cCurTplChar)
			IF (sEmpty == NULL_STRING)
				sEmpty := Space(1)
			ELSE
				sEmpty += " "
			ENDIF
		ELSE
			IF (cCurTplChar == ".") .and. SELF:nType == SLEType.Numeric
				sEmpty += SELF:cDecSep
			ELSEIF (cCurTplChar == ",") .and. SELF:nType == SLEType.Numeric
				sEmpty += SELF:cThousSep
			ELSE
				sEmpty += cCurTplChar
			ENDIF
		ENDIF
	NEXT

	RETURN sEmpty

#ENDREGION           
END CLASS
END NAMESPACE // wmGui.wpf
   