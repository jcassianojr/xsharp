CLASS DateSle INHERIT DateSleNoPB
// Author		: Willie Moore
// Email		: williem@wmconsulting.colm
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 7 May 1998
// --------------
//l specialized version of rightSLE. Demonstates inheritance to add functionality.
//p specialized version of rightSLE. Demonstates inheritance to add functionality.
//d Place a SLE on your window and have it inherit from DateSLE.
//d DateSLE automatically assigns a fieldspec.
//g Edit Controls
constructor(oOwner, nId, oPoint, oDim, kStyle, lDataAware ) 

	SUPER( oOwner, nId, oPoint, oDim, kStyle, lDataAware )
	SELF:AssignImage("rsle_CALUP")
	RETURN  
	
END CLASS

CLASS DateSleNoPB INHERIT rightsle
// Author			: Willie Moore
// Email				: williem@wmconsulting.colm
// Address		:
// City, State	:
// Zip/Postal	:
// Country			:
// Telephone	:
// Date					: 24 October 2006
// --------------
//l specialized version of rightSLE. Demonstates inheritance to add functionality.
//p specialized version of rightSLE. Demonstates inheritance to add functionality.
//d Place a SLE on your window and have it inherit from DateSLE.
//d DateSLE automatically assigns a fieldspec.
//g Edit Controls

METHOD Dispatch ( oEvent ) 

		
      //CAL 300502
      DO CASE
      	CASE oEvent:uMsg == WM_KEYUP
      		IF oEvent:wparam == VK_SPACE
		           SELF:Value:=Today()
		           RETURN 1L		
		    ENDIF
      		IF oEvent:wparam == KEYF4	//CAL081102
		    	SELF:ShowCalendar()
		    	RETURN 1L
	  		ENDIF
	  END CASE
			
	RETURN SUPER:Dispatch( oEvent )

constructor(oOwner, nId, oPoint, oDim, kStyle, lDataAware ) 

	LOCAL DIM firstDay[2] AS BYTE
	
	SUPER( oOwner, nID, oPoint, oDim, kStyle, lDataAware )
	SELF:FieldSpec := DateFS{}

	// Add a popup menu to the PEDateSle - two items Today and Calendar
	SELF:ContextMenu := PEDateSleContextMenu{ SELF }
	
	// Default to an empty data value, if you don't the keydown method will screw up because
	// the test of If !	(oControl:Value == NULL_DATE ) will fail because oControl:Value will be Nil not Null_Date
	SELF:Value := Null_Date
	SELF:textvalue	:= DToC(NULL_DATE)
	GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_IFIRSTDAYOFWEEK, @firstDay, 2)
	IF firstDay[1] = 48	// Monday 1st Day of Week
		SELF:FirstDayoftheWeek	:= 2		// set up Sunday as initial day of the week
	ELSEIF firstDay[1] = 54	// Sunday 1st Day of Week
		SELF:FirstDayoftheWeek	:= 1		// set up Sunday as initial day of the week
	ENDIF
	RETURN  
END CLASS

