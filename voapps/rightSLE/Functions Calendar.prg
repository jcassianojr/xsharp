// Caledar_Functions.prg

/****************************************************************************/
FUNCTION DateDec( dDate AS DateTime, wValue AS WORD ) AS DateTime
// what a pain to have to go through just to get rid of the warning
	RETURN dDate:AddDays( (Double)(0 - wValue) )

/****************************************************************************/
FUNCTION FirstDayofMonth( dDate AS DateTime ) AS DateTime
	//RETURN dDate:AddDays((0-dDate:Day)+1)
	RETURN datetime{dDate:Year,dDate:Month,1}

/****************************************************************************/
FUNCTION LastDayofMonth( dDate AS DateTime ) AS DateTime
	/*
	LOCAL nYear AS long
	LOCAL nMonth AS long


	nMonth := dDate:Month
	nYear  := dDate:Year

	// Pump up the month and test
	nMonth += 1
	
	IF nMonth == 13
		nYear  += 1
		nMonth := 1
	ENDIF

	// Take off 1 day - to get the last day of the previous month
	RETURN DateTime{nYear,nMonth,1}:AddDays(-1)
	*/
 RETURN FirstDayofMonth(dDate):AddMonths(1):AddDays(-1)


/****************************************************************************/
FUNCTION IsLeapYear( nYear as Long ) AS LOGIC
	local lResult as logic
	if ( ( nYear % 4 == 0) .and. !(nYear % 100 == 0) .or. ( nYear % 400 == 0 ) )
		lResult := TRUE
	ELSE
		lResult := FALSE
	END IF
	RETURN lResult

/****************************************************************************/
FUNCTION FirstDayOfWeek( dDate AS DateTime) AS LONG
	RETURN (long)(DateTime{dDate:Year,dDate:Month,1}:DayOfWeek + 1)

/****************************************************************************/
FUNCTION PointInSide( rc REF rightSLE.internal.winRect, x AS LONGINT, y AS LONGINT ) AS LOGIC

	LOCAL lRetVal	AS LOGIC

	lRetVal := FALSE

	IF x < rc:Left
		lRetVal := FALSE
	ELSEIF y < rc:Top
		lRetVal := FALSE
	ELSEIF x > rc:right
		lRetVal := FALSE		
	ELSEIF y > rc:bottom			
		lRetVal := FALSE
	ELSE
		lRetVal := TRUE		
	ENDIF		

	RETURN lRetVal

