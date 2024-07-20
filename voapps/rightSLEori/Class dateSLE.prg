// dateSLE.prg
#INCLUDE "rightSLE.vh"

#USING System.Windows.Forms
#Using System.ComponentModel
#USING System.Collections

CLASS dateSLE inherit rightSLE
	// **********************************************************
	// * Global Settings iVars. These are static so             *
	// * they can affect multible SLEs                          *
	// **********************************************************
	STATIC HIDDEN DefaultCalendarDoublClickHandling      := CalendarDoubleClickBehavior.Calendar AS CalendarDoubleClickBehavior
	// **********************************************************
	// * end global settings section                            *
	// **********************************************************

	HIDDEN CalendarModeHandling     := CalendarDoubleClickBehavior.Calendar AS CalendarDoubleClickBehavior

	Protect lAlignCalendarLeft 	AS LOGIC
	Protect aCalendarHoliday    AS ArrayList
	Protect oDateRange          AS wmDateRange
	Protect nFirstDayOfTheWeek  AS DWORD
#REGION "   Constructors   "    
/****************************************************************************/
CONSTRUCTOR()
	LOCAL oMenu             AS ContextMenu
	LOCAL oMenuItem         AS MenuItem
	try
		SUPER()
		SELF:lAlignCalendarLeft := TRUE                 // Default to left align
		SELF:aCalendarHoliday   := ArrayList{}          // no holiday's by default
		SELF:nFirstDayoftheWeek := 99                   // Let the calendar choose the best day based on Windows settings
		SELF:MouseDoubleClick += System.Windows.Forms.MouseEventHandler{ SELF , @handleMouseDoubleClick() }
		
		//create the menu
		oMenu   := ContextMenu{}
		
		// build our context menu
		oMenuItem       := MenuItem{}
		oMenuItem:Text  := rightSLEStrings.Today
		oMenuItem:Click += System.EventHandler{ SELF , @DateSLEMenuClick() }
		oMenu:MenuItems:Add(oMenuItem)

		oMenuItem       := MenuItem{}
		oMenuItem:Text  := rightSLEStrings.Calendar
		oMenuItem:Click += System.EventHandler{ SELF , @DateSLEMenuClick() }
		oMenu:MenuItems:Add(oMenuItem)
		
		// add the menu to the SLE
		SELF:ContextMenu := oMenu
	catch ex as Exception
		MessageBox.Show(ex:Message)
	end try
	RETURN
#ENDREGION    
#REGION "   Event Handlers   "

/****************************************************************************/
#pragma warnings( 3009, off )
Protected METHOD OnParentChanged(e as EventArgs) as void 
	SUPER:onParentChanged(e)        
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/
#pragma warnings( 3009, off )
METHOD dateSLEMenuClick(o as Object, e as System.EventArgs) AS VOID 
	Local oMenuItem AS MenuItem
	Local cMenuText AS String
	Try
		oMenuItem   := (MenuItem)o
		cMenuText   := oMenuItem:Text:ToUpper()
		DO CASE
			CASE cMenuText == rightSLEStrings.Today:ToUpper()
				IF SELF:oEditString <> null
					SELF:oEditString:Text   := datetime.Today:ToString("d")
				ELSE
					SELF:Text   := datetime.Today:ToString("d")
				ENDIF
			CASE cMenuText == rightSLEStrings.Calendar:ToUpper()
				SELF:HandleButton() // if the SLE is subclassed, this will cause the users handler to fire and not mine
		ENDCASE
    catch
        ///todo add catch
	End Try	    
	
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/
VIRTUAL Method HandleButton() AS VOID    
	SELF:ShowCalendar()
	RETURN

/****************************************************************************/
#pragma warnings( 3009, off )
Method HandleMouseDoubleClick(o AS OBJECT , e AS System.Windows.Forms.MouseEventArgs) AS VOID    
	IF 	e:Button = MouseButtons.Left
		SELF:HandleButton()
	ENDIF
	RETURN
#pragma warnings( 3009, on )

#ENDREGION
#REGION "   Methods  "
/****************************************************************************/
VIRTUAL METHOD ShowCalendar() AS VOID 

	//l processing method to show a popup calendar.
	//p processing method to show a popup calendar.
	//r VOID
	//a None
	//j CL:dlgPECalendar
	
	LOCAL oDlgPECalendar		AS dlgPECalendar
	LOCAL dOldTextValue			AS STRING
	LOCAL dResult               AS datetime

	TRY
		IF oPB <> NULL_OBJECT .and. SELF:EffectiveCalendarMode == CalendarDoubleClickBehavior.Today
			SELF:Text			:= datetime.Today:ToString("d")
			SELF:Modified 		:= TRUE
			BREAK S_OK		
		ENDIF
		// If it is pass the DateSle to to dlgCalendar and pop up a calendar.
		// We adjust the Calendar's origin in dlgCalendar's PostInit to align the calendar just below the SLE				
		// save date formats before we go into the calendar
	
		// calendar class
		// *************************************************************************
		// * wcm 2005-07-09 changed the class instanciation to include a check for *
		// *                owner. If the owner in not a window (ie bbrowser),     *
		// *                use the owner:owner to get to a window                 *
		// * wcm 2005-10-09 Added checks for a valid date before we call the       *
		// *                calendar routine. If an invlaid date is found,         *
		// *                self:TextValue is set to today()                       *
		// *************************************************************************
		// save off out old first. that way we have a restore point if they choose nothing form the calendar
		dOldTextValue			:= SELF:Text
		
		// test for the NULL_DATE and adjust
		IF !datetime.TryParse(SELF:Text,dResult)
			SELF:Text    		:= datetime.Today:ToString("d")
			SELF:Modified    	:= TRUE		// we change textvalue, let VO know
		ENDIF
	
		// build and display the calendar
		oDlgPECalendar := dlgPECalendar{SELF:Owner,SELF}
		SELF:SetOrigin(oDlgPECalendar)
		oDlgPECalendar:ShowDialog()
		
		// If they doubled click on a date, we stuff that value back into the Sle they double clicked on previously
		IF ! Empty( oDlgPECalendar:dSelected ) .and. oDlgPECalendar:dSelected <> dateTime.MinValue
			SELF:text   	:= oDlgPECalendar:dSelected:ToString("d")
			IF  SELF:Text:Substring(0,1) > " " //SubStr3(SELF:Text,1,1) > " "
				SELF:Modified 	:= TRUE 
			ELSE
				SELF:Modified	:= FALSE  
			ENDIF

			// added for bbrowser support wcm 2005-09-23
//		   IF IsInstanceOf(SELF:Owner, #BBrowser)
//		      SELF:Owner:Edit()
//		      SELF:Owner:EditControl:Value := oDlgPECalendar:dSelected
//		      SELF:Owner:EditClose()
//		   ENDIF
		ELSE
			IF SELF:Modified
				// this means that we did it and will need to set VO back to what
				// was there before. most likely a NULL Date
				SELF:Text      := dOldTextValue
				SELF:Modified  := FALSE
			ENDIF
		ENDIF	
	
		// this makes sure that we get focus back to the SLE we want
		// added for bbrowser support wcm 2005-09-23
//		IF .not. IsInstanceOf(SELF:Owner, #BBrowser)
		   SELF:focus()
//		ENDIF
	CATCH
	END TRY
	RETURN
#ENDREGION
#REGION "   Access / Assigns"    
/****************************************************************************/
PROPERTY AlignCalendarLeft AS LOGIC
	get
		RETURN SELF:lAlignCalendarLeft
	END GET
	SET
		SELF:lAlignCalendarLeft := Value
	END set
END PROPERTY
/****************************************************************************/
PROPERTY CalendarMode AS CalendarDoubleClickBehavior
	GET
		RETURN SELF:CalendarModeHandling
	END GET
	SET
		SELF:CalendarModeHandling := VALUE
	END SET
END PROPERTY	  
/****************************************************************************/
STATIC ACCESS DefaultCalendarMode() AS CalendarDoubleClickBehavior
	RETURN DefaultCalendarDoublClickHandling
/****************************************************************************/
STATIC ASSIGN DefaultCalendarMode(newValue AS CalendarDoubleClickBehavior) AS VOID
	// The default needs to be a definite action
	IF newValue == CalendarDoubleClickBehavior.Auto
		newvalue := CalendarDoubleClickBehavior.Calendar 
	ENDIF
	DefaultCalendarDoublClickHandling := newValue
	RETURN
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY EffectiveCalendarMode AS CalendarDoubleClickBehavior
	GET
		LOCAL handling AS CalendarDoubleClickBehavior
		IF SELF:CalendarModeHandling == CalendarDoubleClickBehavior.Auto
			handling := DefaultCalendarDoublClickHandling
		ELSE
			handling := CalendarModeHandling
		ENDIF

		RETURN handling
	END GET
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY Holiday AS ArrayList
	//l Holiday array.
	//p Holiday array.
	//d This access wil return the array containing days to be highlighted. \line
	//r Array \line
	//r aHoliday[i,1] \tab Date To be Highlighted. \line
	//r aHoliday[i,2] \tab Text description for mouseover. \line
	//r aHoliday[i,3] \tab String containing highlight color in rgb format. \line
	//a None
	GET
		RETURN SELF:aCalendarHoliday
	END GET
	SET
		SELF:aCalendarHoliday := Value
		RETURN
	END set
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY DateRange AS wmDateRange
	//l Gets the DateRange for a calendar.
	//p Gets the DateRange for a calendar.
	//r OBJECT of type wmDateRange
	//a NONE \line
	GET
		RETURN SELF:oDateRange
	END get
	SET
		SELF:oDateRange	:= Value
		RETURN
	END set
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY FirstDayoftheWeek AS DWORD
	//l Gets the First Day of the Week as used by the calendar.
	//p Gets the First Day of the Week as used by the calendar.
	//r DWORD
	//a NONE \line
	GET
		RETURN SELF:nFirstDayoftheWeek
	END GET
	SET
		SELF:nFirstDayoftheWeek	:= Value
		RETURN
	END SET
END PROPERTY
#ENDREGION    
END CLASS

CLASS pbDateSLE inherit dateSLE
#REGION "   Constructors  "
/****************************************************************************/
CONSTRUCTOR()
	SUPER()
	IF !self:DesignMode
		SELF:AssignImage("rsle_CALUP")
	ENDIF
	IF SELF:oEditString == NULL
		SELF:lFSAddedByClass := TRUE
		SELF:_Fieldspec      := "DateFS"
//		SELF:FieldSpec       := "DateFS"
	ENDIF
	RETURN        
#ENDREGION
END CLASS
