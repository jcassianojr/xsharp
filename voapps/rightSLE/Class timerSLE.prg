// timerSLE.prg
#USING System.Windows.Forms
CLASS timerSLE inherit rightSLE
	PROTECT nTimerHandle 	:= 0	AS DWORD	    // Handle of the timer
	PROTECT nPrevCount 		:= 0	AS LONGINT		// Previous time
	PROTECT nStartSeconds	:= 0	AS FLOAT	    // Start Seconds
	PROTECT nSeconds		:= 0	AS FLOAT	    // Current Seconds
	PROTECT nStyle 			:= 1	AS LONGINT		// Display Style - Default is seconds
	PROTECT nTimeOut 		:= 500	AS LONGINT		// Time between messages - Default is 1/2 second
	PROTECT myTimer                 AS Timer        // windows Forms time

/****************************************************************************/
CONSTRUCTOR()
	super()
	SELF:mytimer    := Timer{}
	myTimer:Tick    += EventHandler{SELF, @TimerEventProcessor()}
	RETURN

/****************************************************************************/
METHOD Start() AS VOID
	
	// If there is no timer active
	IF SELF:mytimer <> NULL_OBJECT
		SELF:myTimer:Interval   := SELF:nTimeOut
		// Initialize our start time
		nStartSeconds := Seconds()
		// Call the timer Method
		SELF:myTimer:Enabled	:= TRUE
		SELF:myTimer:Start()
	ENDIF
	RETURN

/****************************************************************************/
METHOD Stop() AS VOID

	// If a timer is active
	IF SELF:myTimer <> NULL_OBJECT
		// Kill the timer
		SELF:myTimer:Stop()
		SELF:myTimer:Enabled	:= FALSE
		// Save the time as the previous time
		nPrevCount += LONGINT(Seconds()-SELF:nStartSeconds)
	ENDIF	
	RETURN
	
/****************************************************************************/
METHOD sleTimer() AS VOID 
	//p sets current value based upon style.
	//r VOID
	//a None

	DO CASE
		CASE nStyle = 0				
			// Display Current Time
			SELF:text := Time()
		CASE nStyle = 1				
			// Count in seconds
			SELF:text := (nPrevCount + LONG(Seconds()-SELF:nStartSeconds)):ToString()
		CASE nStyle = 2				
			// Count in minutes
			SELF:text := ((nPrevCount + LONG(Seconds()-SELF:nStartSeconds))/60):ToString()
		CASE nStyle = 3				
			// Count in minutes.dec
			SELF:text := (Math.Round((nPrevCount+Seconds()-SELF:nStartSeconds)/60,2)):ToString()
	ENDCASE
	RETURN

/****************************************************************************/
#pragma warnings( 3009, off )
Method TimerEventProcessor(oMyObject as Object, e as EventArgs) as void
	SELF:sleTimer()	
	RETURN	
#pragma warnings( 3009, on )

/****************************************************************************/
ASSIGN Style(n AS LONGINT) AS VOID

	// Set the timer style
	SELF:nStyle := n
	RETURN

/****************************************************************************/
ASSIGN Interval(n AS LONGINT) AS VOID
	//p Sets up the timer interval.
	//r LONG
	//a n \tab LONG \tab Interval in seconds \line

	// Set the interval
	SELF:nTimeOut := n
	RETURN 
	  
END CLASS