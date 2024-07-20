// InlineCalcSLE.prg
// calcSLE.prg
#USING System.Windows.Forms

CLASS InlineCalcSLE INHERIT rightSLE
//#REGION "   IVars   "
// Author		: Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 7 May 1998
// --------------
//l SLE that brings up a Calculator when double-clicked
//p SLE that brings up a Calculator when double-clicked
//d	pbinlinecalcSLE is a subclass if inlinecalcSLE that adds push button to the calculator class.
//d Unlike calcSLE, inlineCalcSLE also allows you to do simple
//d calculations without having to pop up the calculator.
//d Put a SLE on your window and have it INHERIT from calcSLE.
//g Edit Controls
Protect oCalculator as Calculator
//#ENDREGION
//#REGION "   Constructors   "
/****************************************************************************/
CONSTRUCTOR()
	LOCAL oMenu             AS ContextMenu
	LOCAL oMenuItem         AS MenuItem
	try
		SUPER()
		SELF:oCalculator        := Calculator{}
		SELF:MouseDoubleClick   += System.Windows.Forms.MouseEventHandler{ SELF , @handleMouseDoubleClick() }
			
		//create the menu
		oMenu   := ContextMenu{}
		
		// build our context menu
		oMenuItem       := MenuItem{}
		oMenuItem:Text  := rightSLEStrings.Calculator
		oMenuItem:Click += System.EventHandler{ SELF , @calcSLEMenuClick() }
		oMenu:MenuItems:Add(oMenuItem)
		
		// add the menu to the SLE
		SELF:ContextMenu := oMenu
	catch ex as Exception
		MessageBox.Show(ex:Message)
	end try
RETURN 
//#ENDREGION
//#REGION "   Event Handlers   "

/****************************************************************************/
#pragma warnings( 3009, off )
METHOD calcSLEMenuClick(o as Object, e as System.EventArgs) AS VOID 
	Local oMenuItem AS MenuItem
	Local cMenuText AS String
	Try
		oMenuItem   := (MenuItem)o
		cMenuText   := oMenuItem:Text:ToUpper()
		DO CASE
			CASE cMenuText == rightSLEStrings.Calculator:ToUpper()
				SELF:HandleButton() // if the SLE is subclassed, this will cause the users handler to fire and not mine
		ENDCASE
    catch
        ///todo add catch
	End Try	    
	
	RETURN
#pragma warnings( 3009, on )


/****************************************************************************/
VIRTUAL Method HandleButton() AS VOID    
	SELF:showCalcDialog()
	RETURN

/****************************************************************************/
#pragma warnings( 3009, off )
Method HandleMouseDoubleClick(o AS OBJECT , e AS System.Windows.Forms.MouseEventArgs) AS VOID    
	IF 	e:Button = MouseButtons.Left
		SELF:HandleButton()
	ENDIF
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/
Protected METHOD OnKeyDown(e As System.Windows.Forms.KeyEventArgs) as void
	local nKeyCode  AS long

	SUPER:onKeyDown(e)  // this used to be at the end of the method

	nKeyCode                := e:KeyCode  
	SELF:nSelectionStart    := SELF:SelectionStart
	SELF:nSelectionLength   := SELF:SelectionLength	
	// we have a valid picture, apply the mask
	IF nKeycode == Keys.Delete .or. nKeyCode == Keys.OemPeriod .or. nKeyCode == Keys.Decimal
	   IF SELF:oEditString:ProcessKeyEvent(nKeyCode,true)
			SELF:oCalculator:Text := SELF:RemoveFormatting(SELF:Text)
			SELF:lKeyHandled := TRUE
			e:Handled := TRUE
		ELSE
			SELF:lKeyHandled := FALSE
		ENDIF
	ENDIF
	  
	RETURN

/****************************************************************************/
Protected METHOD OnKeyPress(e As System.Windows.Forms.KeyPressEventArgs) as void
	Local chr       AS char
	local cKey      AS STRING
	local cTmp      AS STRING
	local nKeyCode  AS LONG
	local nCurPos   AS LONG
	LOCAL lResult   AS LOGIC

	// *******************************************************************************
	// * because the inline calc needs to suppress keystrokes, we do not pass on the *
	// * onKeyPress if we process it                                                 *
	// *******************************************************************************
	chr         := e:KeyChar
	cKey        := chr:ToString()
	nKeyCode    := (long)AscW(chr:ToString())
	nCurPos     := SELF:__CurPos
	
	IF (SELF:nSelectionLength > 0 ) // .or. (SELF:SelectionStart == 0 .and. SELF:SelectionLength == 0)
		// reset sumations if they select everything
		SELF:oCalculator:EditLevel := 0	
	ENDIF
	lResult := SELF:oCalculator:autoClear()
	// ******************************************************
	// * We have to check if the return from AutoClear      *
	// * a true means we have to reset the SLE for the next *
	// * operand                                            *
	// ******************************************************
	if lResult
		// clear the SLE
		if SELF:oEditString <> NULL
		   SELF:oEditString:Text   := SELF:oCalculator:Text //val(SELF:oCalculator:Text)   // no need to unformat as the calculator doesnt apply any formating
		ELSE
		   SELF:Text := ""
		ENDIF
	ENDIF

	DO CASE
		CASE "0123456789.":IndexOF(cKey) > -1 
			// printable result
			IF SELF:oEditString <> null
				IF SELF:oEditString:ProcessKeyEvent(nKeyCode, false)
					SELF:lKeyHandled := TRUE
					e:Handled := TRUE
				ELSE
					SELF:lKeyHandled := FALSE
				ENDIF
			ELSE
				SELF:Text += cKey
			ENDIF
		CASE "cC+*-/=^":IndexOF(cKey) > -1          		// gcs - 16/07/00
			// operation to be performed
			cTmp := SELF:RemoveFormatting(SELF:Text)
			if val(SELF:Text) < 0
				cTmp := "-" + cTmp
			endif
			SELF:oCalculator:Text   := cTmp
			SELF:oCalculator:DoOperation(cKey)
			if cKey == "="
				e:Handled := FALSE
			ELSE
				e:Handled := TRUE
			ENDIF
		CASE chr == Keys.Back
//            IF SELF:oEditString:ProcessKeyEvent(nKeyCode, true)
				SELF:oCalculator:Text   := SELF:RemoveFormatting(SELF:Text)
				SELF:oEditString:Text   := SELF:oCalculator:Text //val(SELF:oCalculator:text)   // reset the display with a properly formatted number
				SELF:__CURPOS           := nCurPos
				SELF:lKeyHandled := TRUE
				e:Handled := TRUE
//          ELSE
//                SELF:lKeyHandled := FALSE
//            ENDIF
		
		OTHERWISE
			e:Handled := TRUE		    
	ENDCASE	
	IF chr == Keys.Enter 
		e:handled := FALSE
		super:onKeyPress(e)
	ELSE	
		IF e:Handled <> TRUE
			// fix the value back to empty incase the Edit is being reset
			if SELF:oEditString <> NULL
				SELF:oEditString:Text   := SELF:oCalculator:Text // val(SELF:oCalculator:Text)   // no need to unformat as the calculator doesnt apply any formating
				if SELF:nSelectionStart < SELF:oEditString:DecimalPos
					SELF:__CurPos       := SELF:oEditString:DecimalPos
				ENDIF
				e:Handled := TRUE
			ELSE
				SELF:Text := ""
				SUPER:OnKeyPress(e)
			ENDIF
		ENDIF
	ENDIF
	RETURN

//#ENDREGION

//#REGION "   Methods   "
METHOD showCalcDialog() as VOID
	//l Processing logic to show a calculator popup.
	//p Processing logic to show a calculator popup.
	//r VOID
	//a None
	//j CL:calcSLE
	LOCAL oDlgCalc	AS dlgPopupCalc
	LOCAL cText		AS STRING
	
	IF oEditString <> null
		cText := Str(unformat(SELF:Text,SELF:oEditString:Picture,"N"))
	ELSE
		cText := SELF:Text
	ENDIF
	oDlgCalc    := dlgPopupCalc{SELF:Owner,(rightSLE)SELF} 
	SELF:SetOrigin(oDlgCalc)
	oDlgCalc:ShowDialog()		

	// put the returned number back into the SLE
	IF ! Empty( oDlgCalc:Value)
		IF SELF:oEditString <> NULL
			// we have a fieldspec or picture so we must use it to display the value instead 
			// of jsut setting self:text
			cText                   := oDlgCalc:Value
			SELF:oEditString:Text   := cText //val(cText)
			SELF:__CurPos           := SELF:oEditString:DecimalPos
		ELSE
			cText       := oDlgCalc:Value
			SELF:Text   := cText
		ENDIF
		SELF:Modified	:= TRUE
	ENDIF

	// this makes sure we get focus back to the SLE we want
	SELF:Focus()
	RETURN

/****************************************************************************/
VIRTUAL Method HandleEnterKey() as void
	SELF:oCalculator:Text   := SELF:RemoveFormatting(SELF:Text)
	IF SELF:oCalculator:ProcessEnter()
		if SELF:oEditString <> NULL
			SELF:oEditString:Text   := SELF:oCalculator:Text // val(SELF:oCalculator:Text)   // no need to unformat as the calculator doesnt apply any formating
			SELF:__CurPos           := SELF:oEditString:DecimalPos
		ELSE
			SELF:Text               := SELF:oCalculator:Text
		ENDIF    
	ELSE
		Super:HandleEnterKey()
	ENDIF
	RETURN
	
//#ENDREGION
//#REGION "   Access / Assigns  "
//#ENDREGION
END CLASS
CLASS pbInlineCalcSLE INHERIT inlineCalcSLE
//#REGION "   IVARS   "
// Author		: Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 27 September 1998
// --------------
//l SLE that brings up a Calculator when double-clicked
//p SLE that brings up a Calculator when double-clicked
//d	pbinlinecalcSLE is a subclass if inlinecalcSLE that adds push button to the calculator class.
//d Unlike calcSLE, inlineCalcSLE also allows you to do simple
//d calculations without having to pop up the calculator.
//d Put a SLE on your window and have it INHERIT from calcSLE.
//g Edit Controls
//#ENDREGION
//#REGION "   Constructors   "
CONSTRUCTOR()
	SUPER()
	SELF:AssignImage("rsle_CALCUP")
	RETURN  
//#ENDREGION	
END CLASS