CLASS wmDateRange
// Author		: Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 1 July 2005
// --------------
//l Date range Class
//p Date Range Class
//d	wmDateRange is a class that rightSLE and dateSLE uses to define a date range for showig the calendar.
//g Misc Classes

	PROTECT dMin 	AS DATE
	PROTECT dMax	AS DATE
	
/****************************************************************************/
Constructor(dMinDate, dMaxDate)

	// handle the min date
	IF !Empty(dMinDate)
		IF IsDate(dMinDate)
			SELF:dMin 	:= dMindate
		ELSEIF IsString(dMinDate)
			SELF:dMin	:= CToD(dMinDate)
		ELSE
			SELF:dMin	:= NULL_DATE
		ENDIF
	ENDIF

	// now handle the max date
	IF !Empty(dMaxDate)
		IF IsDate(dMaxDate)
			SELF:dMax	:= dMaxDate
		ELSEIF IsString(dMaxDate)
			SELF:dMax	:= CToD(dMaxDate)
		ELSE
			SELF:dMax	:= NULL_DATE
		ENDIF
	ENDIF

	RETURN 

/****************************************************************************/
ACCESS Max() AS DATE 

	//l Returns the maxmum date in a date range.
	//p Returns the maximum date in a date range.
	//d Max represents the maximum date in the date range.
	//r Date
	//a None
	RETURN SELF:dMax

/****************************************************************************/
ASSIGN Max(dMaxDate AS DATE) AS void 

	//l Assign the maximum date in a date range.
	//p Assign the maximum date in a date range.
	//d Max represents the maximum date in the date range.
	//r Date
	//a dMaxDate as date - Max Date in Range.
	SELF:dMax := dMaxDate
	RETURN 

/****************************************************************************/
ACCESS Min() AS DATE 

	//l Represents the minimum date in a date range.
	//p Represents the minimum date in a date range.
	//d Min represents the minimum date in the date range.
	//r Date
	//a None
	RETURN SELF:dMin

/****************************************************************************/
ASSIGN Min(dMinDate AS DATE) AS void 

	//l Assign the minimum date in a date range.
	//p Assign the minimum date in a date range.
	//d Min represents the minimum date in the date range.
	//r Date
	//a dMinDate as date - Min Date in Range.
	SELF:dMin := dMinDate
	RETURN 
END CLASS

