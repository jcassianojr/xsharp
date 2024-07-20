// dlgPECalendar.prg\

#USING System.Windows.Forms
#USING System.Drawing
#USING System.Collections

CLASS dlgPECalendar INHERIT _dlgPECalendar
	//l default Dialog to display the calendar.
	//p default Dialog to display the calendar.
	//d	dialog to bring up when a dateSLE is double clicked.  
	PROTECT lDayCallback		AS LOGIC     
	PROTECT lHolidayRightclick  AS LOGIC
	PROTECT lMonthCallback 		AS LOGIC
	PROTECT oOwner              AS Object //FORM
	
	EXPORT dSelected			AS DateTime
	EXPORT oDateSLE				AS DateSLE

/****************************************************************************/
CONSTRUCTOR()
	  SUPER()
	  SELF:oDateSLE := dateSLE{}
	  RETURN

/****************************************************************************/
CONSTRUCTOR(oOwningForm as Object /*form*/, oDate as DateSLE)
	  SUPER()
	  SELF:oDateSLE := oDate
	  SELF:oOwner   := oOwningForm
	  SELF:SetupDlg()
	  RETURN

/****************************************************************************/
CONSTRUCTOR(oDate as DateSLE)
	  SUPER()
	  SELF:oDateSLE := oDate
	  RETURN
   
/****************************************************************************/    
METHOD SetupDlg()  AS VOID	
	LOCAL oOrigin 		AS Point
	LOCAL oSize 		AS Size
	LOCAL lAlignLeft 	AS LOGIC
	LOCAL dOldDate		AS DateTime
	
	Try	
		dOldDate 		:= convert.ToDateTime(oDateSle:Text)
		
		// check for a NULL_DATe and adjust so we dont get a runtime error
		IF dOldDate	== NULL_DATE
			dOldDate 	:= datetime.Today
		ENDIF

		// Get the the stuff about the sle that we need
		oOrigin		:= oDateSle:Location // PClone( oDateSle:Origin )
		oSize 		:= oDateSle:Size // PClone( oDateSle:Size )
		lAlignLeft 	:= oDateSle:AlignCalendarLeft

		// Origin:x is always the Sle's origin:x unless the alignment is right-
		oOrigin:x 	:= iif( ! lAlignLeft, oOrigin:x + oSize:Width, oOrigin:x )

		//  Origin:y has to be fiddled with to make the calendar align just below the Sle. Jeez I hate Cartesian coorordinates
		// - one line of code and how long does it take to figure it out. Bloody CommonView, why didn't they take it all out
//	    SELF:Location   						:= Point{ oOrigin:x, SELF:oOwner:Size:Height - SELF:Size:Height - ( SELF:oOwner:Size:Height - oOrigin:y ) }	
		SELF:oCalendar:InitDate 			    := dOldDate
		SELF:oCalendar:FirstDayoftheWeek	    := oDateSLE:FirstDayoftheWeek	
		IF IsAccess(oDateSLE,#DateRange) .and. !Empty(oDateSLE:DateRange)
			SELF:oCalendar:DateRange 		    := oDateSLE:DateRange
		ENDIF
		IF IsAccess(oDateSLE,#Holiday) .and. oDateSLE:Holiday:Count > 0
			SELF:oCalendar:Holiday  			:= oDateSLE:Holiday
		ENDIF                 
		
		// check for our callbacks now so I dont have to do it each time a date changes
		IF CheckMethod(SELF:oOwner,"onMonthYearMove")
			SELF:lMonthCallback		:= TRUE
		ENDIF
		IF CheckMethod(SELF:oOwner,"onHolidayDateRightClick")
			SELF:lHolidayRightclick	:= TRUE
		ENDIF
		IF CheckMethod(SELF:oOwner,"onDayMove")
			SELF:lDayCallback			:= TRUE
		ENDIF
	Catch ex as Exception
		MessageBox.Show(ex:Message)
	END Try
	RETURN 
   
/****************************************************************************/
ACCESS Calendar() AS Calendar 

	//l Retrieve the Calendar control
	//p Retrieve the Calendar control
	//r PECalendar
	RETURN SELF:oCalendar

/****************************************************************************/    
Method DateSelected(dDate as DateTime) as Void
	SELF:dSelected  := dDate
	RETURN   	

/****************************************************************************/    
METHOD onHolidayDateRightClick(dMouseDate AS DateTime) AS VOID

	//l Callback Method for right clicking on a Holiday
	//p Callback Method for right clicking on a Holiday
	//d This callback method will check to see if there is a corresponding \line
	//d method in the owner's window. If there is, the method will be called.
	//r VOID
	//a dMouseDate \tab - Date \tab - Date the mouse is hovering over
	local aParameters AS Object[]
	Try
		IF SELF:lHolidayRightclick
			aParameters     := Object[]{2}
			aParameters[0]  := (object)self
			aParameters[1]  := dMouseDate
			RunDynamicMethod(SELF:oOwner,"onHolidayDateRightClick",aParameters)
		ENDIF
	Catch ex as Exception
		messagebox.show(ex:Message)
	End Try
	RETURN

/****************************************************************************/    
METHOD onMonthYearMove(dNewDate AS DateTime) AS VOID 

	//l Callback Method on a month or year move
	//p Callback Method on a month or year move
	//d This callback method will be invoked each time a month or year is changed. \line
	//d It will check the owner to see if there is a method by the same name. If there is, the method will be called. \line
	//d This is used to fill the aHoliday array. The callback method in the owner's window must return an array.
	//r VOID
	//a dNewDate \tab - Date \tab - New Date that the calendar is in the process of drawing
	LOCAL aResult AS ARRAYList
	LOCAL aParameters   AS Object[]

	Try
		IF SELF:lMonthCallback
			aParameters     := Object[]{1}
			aParameters[0]  := dNewDate
			aResult         := (arrayList)RunDynamicMethod(SELF:oOwner,"onMonthYearMove",aParameters)
			IF aResult <> null
				IF aResult:Count> 0
					SELF:oCalendar:Holiday	:= aResult
				ENDIF
			ENDIF
		ENDIF
	Catch ex as Exception
		messagebox.show(ex:Message)
	End Try
	RETURN
	
/****************************************************************************/
METHOD onDayMove(dNewDate AS DateTime) AS VOID 

	//l Callback Method on a day move
	//p Callback Method on a day move
	//d This callback method will be invoked each time a new day is highlighted. \line
	//d It will check the owner to see if there is a method by the same name. If there is, the method will be called. \line
	//d This can be used to fill the aHoliday array. 
	//r VOID
	//a dNewDate \tab - Date \tab - New Date that the calendar is in the process of drawing
	LOCAL aResult       AS ArrayList
	LOCAL aParameters   AS Object[]

	try
		IF SELF:lDayCallback
			aParameters     := Object[]{1}
			aParameters[0]  := dNewDate
			aResult         := (arraylist)RunDynamicMethod(SELF:oOwner,"onDayMove",aParameters)
			IF aResult:count > 0
				SELF:oCalendar:Holiday	:= aResult
			ENDIF
		ENDIF
	Catch ex as Exception
		messagebox.show(ex:Message)
	End Try
	RETURN
	
	
			
END CLASS
