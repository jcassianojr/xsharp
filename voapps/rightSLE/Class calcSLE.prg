// calcSLE.prg
#USING System.Windows.Forms

CLASS calcSLE INHERIT rightSLE
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
//d	pbcalcSLE is a subclass if calcSLE that adds a bitmap button.
//d Put a SLE on your window and have it INHERIT from pbcalcSLE.
//g Edit Controls
//#ENDREGION
//#REGION "   Constructors   "
/****************************************************************************/
CONSTRUCTOR()
	LOCAL oMenu             AS ContextMenu
	LOCAL oMenuItem         AS MenuItem
	try
		SUPER()
		SELF:MouseDoubleClick += System.Windows.Forms.MouseEventHandler{ SELF , @handleMouseDoubleClick() }
			
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
	oDlgCalc    := dlgPopupCalc{SELF:Owner,SELF} 
	SELF:SetOrigin(oDlgCalc)
	oDlgCalc:ShowDialog()		

	// this makes sure we get focus back to the SLE we want
	SELF:Focus()

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

	RETURN

//#ENDREGION
//#REGION "   Access / Assigns  "
//#ENDREGION
END CLASS
CLASS pbCalcSLE INHERIT calcSLE
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
//d	pbcalcSLE is a subclass if calcSLE that adds a bitmap button.
//d Put a SLE on your window and have it INHERIT from pbcalcSLE.
//g Edit Controls
//#ENDREGION
//#REGION "   Constructors   "
CONSTRUCTOR()
	SUPER()
	SELF:AssignImage("rsle_CALCUP")
	RETURN  
//#ENDREGION	
END CLASS