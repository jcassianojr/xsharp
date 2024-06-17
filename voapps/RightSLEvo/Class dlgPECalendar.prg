#define DLGPECALENDAR_CALENDAR 100
#define _DLGPECALENDAR_CALENDAR 100 
class _dlgPECalendar inherit DIALOGWINDOW 

	protect oDCCalendar as PECALENDAR

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)
constructor(oParent,uExtra) 


    self:PreInit(oParent,uExtra)

    super(oParent,ResourceID{"_dlgPECalendar",_GetInst()},TRUE)

    oDCCalendar := PECALENDAR{self,ResourceID{_DLGPECALENDAR_CALENDAR,_GetInst()}}
    oDCCalendar:HyperLabel := HyperLabel{#Calendar,NULL_STRING,NULL_STRING,NULL_STRING}

    self:Caption := "Calendar"
    self:HyperLabel := HyperLabel{#_dlgPECalendar,"Calendar",NULL_STRING,NULL_STRING}

    self:PostInit(oParent,uExtra)

    return 

END CLASS

CLASS dlgPECalendar INHERIT _dlgPECalendar
	//l default Dialog to display the calendar.
	//p default Dialog to display the calendar.
	//d	dialog to bring up when a dateSLE is double clicked.  
	PROTECT lDayCallback			AS LOGIC     
	PROTECT lHolidayRightclick AS LOGIC
	PROTECT lMonthCallback 		AS LOGIC
	
   EXPORT dSelected				AS DATE
   EXPORT oDateSLE				AS OBJECT
   
/****************************************************************************/
ACCESS Calendar() AS PECalendar 

	//l Retrieve the Calendar control
	//p Retrieve the Calendar control
	//r PECalendar
   	RETURN SELF:oDCCalendar

/****************************************************************************/
constructor(oParent,uExtra)

    SUPER(oParent,uExtra)

    RETURN 

/****************************************************************************/
METHOD onDayMove(dNewDate AS DATE) AS VOID 

	//l Callback Method on a day move
	//p Callback Method on a day move
	//d This callback method will be invoked each time a new day is highlighted. \line
	//d It will check the owner to see if there is a method by the same name. If there is, the method will be called. \line
	//d This can be used to fill the aHoliday array. 
	//r VOID
	//a dNewDate \tab - Date \tab - New Date that the calendar is in the process of drawing
	LOCAL uxResult AS USUAL
	IF SELF:lDayCallback
		uxResult := SELF:Owner:onDayMove(dNewDate)
		IF UsualType(uxResult) == ARRAY
			SELF:oDCCalendar:Holiday	:= uxResult
		ENDIF
    ENDIF
    RETURN
    
/****************************************************************************/    
METHOD onHolidayDateRightClick(dMouseDate AS DATE) AS VOID

	//l Callback Method for right clicking on a Holiday
	//p Callback Method for right clicking on a Holiday
	//d This callback method will check to see if there is a corresponding \line
	//d method in the owner's window. If there is, the method will be called.
	//r VOID
	//a dMouseDate \tab - Date \tab - Date the mouse is hovering over
	IF SELF:lHolidayRightclick
		SELF:Owner:onHolidayDateRightClick(SELF,dMouseDate)
	ENDIF
    RETURN
    
/****************************************************************************/    
METHOD onMonthYearMove(dNewDate AS DATE) AS VOID 

	//l Callback Method on a month or year move
	//p Callback Method on a month or year move
	//d This callback method will be invoked each time a month or year is changed. \line
	//d It will check the owner to see if there is a method by the same name. If there is, the method will be called. \line
	//d This is used to fill the aHoliday array. The callback method in the owner's window must return an array.
	//r VOID
	//a dNewDate \tab - Date \tab - New Date that the calendar is in the process of drawing
	LOCAL uxResult AS USUAL
	IF SELF:lMonthCallback
		uxResult := SELF:Owner:onMonthYearMove(dNewDate)
		IF UsualType(uxResult) == ARRAY
			SELF:oDCCalendar:Holiday	:= uxResult
		ENDIF
    ENDIF
    RETURN
    
/****************************************************************************/    
METHOD PostInit(oParent,uExtra)  

	
	LOCAL oOrigin 		AS Point
	LOCAL oSize 		AS Dimension
    LOCAL lAlignLeft 	AS LOGIC
	LOCAL dOldDate		AS DATE
		
	SELF:oDateSle 	:= uExtra
	dOldDate 		:= CToD(oDateSle:textvalue)
	
	// check for a NULL_DATe and adjust so we dont get a runtime error
	IF dOldDate	== NULL_DATE
		dOldDate 	:= Today()
	ENDIF

	// Get the the stuff about the sle that we need
	oOrigin		:= oDateSle:Origin // PClone( oDateSle:Origin )
	oSize 		:= oDateSle:Size // PClone( oDateSle:Size )
	lAlignLeft 	:= oDateSle:lAlignCalendarLeft

	// Origin:x is always the Sle's origin:x unless the alignment is right-
	oOrigin:x 	:= iif( ! lAlignLeft, oOrigin:x + oSize:Width, oOrigin:x )

	//  Origin:y has to be fiddled with to make the calendar align just below the Sle. Jeez I hate Cartesian coorordinates
	// - one line of code and how long does it take to figure it out. Bloody CommonView, why didn't they take it all out
	SELF:Origin 								:= Point{ oOrigin:x, SELF:Owner:Size:Height - SELF:Size:Height - ( SELF:Owner:Size:Height - oOrigin:y ) }	
	SELF:oDCCalendar:CurrentDate 			:= dOldDate
	SELF:oDCCalendar:FirstDayoftheWeek	:= oDateSLE:FirstDayoftheWeek	
	IF IsAccess(oDateSLE,#DateRange) .and. !Empty(oDateSLE:DateRange)
		SELF:oDCCalendar:DateRange 		:= oDateSLE:DateRange
	ENDIF
	IF IsAccess(oDateSLE,#Holiday) .and. !Empty(oDateSLE:Holiday)
		SELF:oDCCalendar:Holiday 			:= oDateSLE:Holiday
	ENDIF                 
	
	// check for our callbacks now so I dont have to do it each time a date changes
	IF IsMethod(SELF:Owner,#onMonthYearMove)
		SELF:lMonthCallback		:= TRUE
	ENDIF
	IF IsMethod(SELF:Owner,#onHolidayDateRightClick)
		SELF:lHolidayRightclick	:= TRUE
	ENDIF
	IF IsMethod(SELF:Owner,#onDayMove)
		SELF:lDayCallback			:= TRUE
	ENDIF

	RETURN NIL
END CLASS

