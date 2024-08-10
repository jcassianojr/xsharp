FUNCTION DateDec( dDate AS USUAL, wValue AS WORD ) AS DATE
// what a pain to have to go through just to get rid of the warning
RETURN dDate - wValue


FUNCTION FirstDayofMonth( dDate AS DATE ) AS DATE
RETURN (dDate - Day(dDate)+1)




FUNCTION FirstDayOfWeek( dDate AS DATE) AS DWORD
RETURN DoW ( ConDate( Year( dDate ), Month( dDate ),1) )


FUNCTION IsLeapYear( dwYear ) AS LOGIC
RETURN iif( ( dwYear % 4 == 0)  .and. !(dwYear % 100 == 0)  .or. ( dwYear % 400 == 0 ), TRUE, FALSE )


FUNCTION LastDayofMonth( dDate AS DATE ) AS DATE

	LOCAL dwYear AS DWORD
	LOCAL dwMonth AS DWORD


	dwMonth := Month( dDate )
	dwYear := Year( dDate )

	// Pump up the month and test
	dwMonth += 1
	
	IF dwMonth == 13
		dwYear += 1
		dwMonth := 1
	ENDIF

	// Take off 1 day - to get the last day of the previous month
RETURN DateDec(ConDate(dwYear,dwMonth,1),1)




