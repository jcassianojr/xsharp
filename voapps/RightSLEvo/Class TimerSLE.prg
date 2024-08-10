CLASS TimerSLE INHERIT rightSLE
// Author		: Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 4 April 1999
// --------------
//l SLE that adds a timer
//p SLE that adds a timer
//d	timerSLE is an port of the timerSLE from atoolkit. Recompiled to work in VO2.
//g Edit Controls

	PROTECT nTimerHandle 	:= 0	AS DWORD	// Handle of the timer
	PROTECT nPrevCount 		:= 0	AS LONGINT		// Previous time
	PROTECT nStartSeconds	:= 0	AS FLOAT	// Start Seconds
	PROTECT nSeconds		:= 0	AS FLOAT	// Current Seconds
	PROTECT nStyle 			:= 1	AS LONGINT		// Display Style - Default is seconds
	PROTECT nTimeOut 		:= 500	AS LONGINT		// Time between messages - Default is 1/2 second
	

METHOD destroy(oCE) 	
	// If a timer is still active
	IF SELF:nTimerHandle > 0
		// Kill it
		KillTimer(SELF:handle(),1)
	ENDIF	
	RETURN SUPER:destroy(oCE)

METHOD Dispatch(oE) 

	IF oE:Message == WM_TIMER
		// If we get a timer message, call our timer event
		SELF:sleTimer()	
	ENDIF	
	// Now continue with deafult processing
	RETURN SUPER:dispatch(oE)

CONSTRUCTOR(oOwner, nId, oPoint, oDim, kStyle, lDataAware ) 
    //Vulcan.NET-Transporter: This method was automatically created
    SUPER(oOwner, nId, oPoint, oDim, kStyle, lDataAware )

//Vulcan.NET-Transporter: To Do: the following line has been inserted. Please check the return value is correct
RETURN SELF

ASSIGN Interval(n AS LONGINT) AS LONGINT PASCAL 
	//p Sets up the timer interval.
	//r LONG
	//a n \tab LONG \tab Interval in seconds \line

	// Set the interval
	SELF:nTimeOut := n
	RETURN n
	
	

METHOD Reset() AS VOID PASCAL 
	//p Resets the current timer.
	//r VOID
	//a None

	// Stop the timer
	SELF:stop()

	// Reset the time
	SELF:nStartSeconds := 0
	SELF:nPrevCount := 0
	SELF:value := 0
	RETURN		

METHOD sleTimer() AS VOID PASCAL 	
   	//p sets current value based upon style.
	//r VOID
	//a None

	DO CASE
		CASE nStyle = 0				
			// Display Current Time
			SELF:value := Time()
		CASE nStyle = 1				
			// Count in seconds
			SELF:value := nPrevCount + LONGINT(Seconds()-SELF:nStartSeconds)
		CASE nStyle = 2				
			// Count in minutes
			SELF:value := (nPrevCount + LONGINT(Seconds()-SELF:nStartSeconds))/60
		CASE nStyle = 3				
			// Count in minutes.dec
			SELF:value := Round((nPrevCount+Seconds()-SELF:nStartSeconds)/60,2)
	ENDCASE
	RETURN

METHOD Start() AS VOID PASCAL 
	//p Starts up the timer.
	//r VOID
	//a None
	
	// If there is no timer active
	IF nTimerHandle == 0
		// Create a new times
		nTimerHandle := SetTimer(SELF:handle(),1,DWORD(nTimeOut),NULL_PTR)
		// Initialize our start time
		nStartSeconds := Seconds()
		// Call the timer Method
		SELF:timer()
	ENDIF
	RETURN

METHOD Stop() AS VOID PASCAL 
	//p Stops the current time.
	//r VOID
	//a None


	// If a timer is active
	IF nTimerHandle > 0
		// Kill the timer
		KillTimer(SELF:handle(),1)
		// Reset the timer handle
		nTimerHandle := 0
		// Save the time as the previous time
		nPrevCount += LONGINT(Seconds()-SELF:nStartSeconds)
	ENDIF	
	RETURN


ASSIGN Style(n AS USUAL) AS LONGINT PASCAL 
	//p Sets up the timer style.
	//r LONG
	//a n \tab LONG \tab Style to set \line
	//a \tab \tab \tab \tab 0 = Display Current Time \line
	//a \tab \tab \tab \tab 1 = Count in seconds \line
	//a \tab \tab \tab \tab 2 = Count in minutes \line
	//a \tab \tab \tab \tab 3 = Count in minutes.dec \line


	// Set the timer style
	SELF:nStyle := n
	RETURN n


END CLASS
