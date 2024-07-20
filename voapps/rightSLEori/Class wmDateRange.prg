// wmDateRange.prg
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

	PROTECT dMin 	AS DATETime
	PROTECT dMax	AS DATETime
/****************************************************************************/
CONSTRUCTOR()
	SUPER()
	SELF:dMin	:= NULL_DATE
	SELF:dMax	:= NULL_DATE
	RETURN	

/****************************************************************************/
CONSTRUCTOR(dMinDate as DateTime, dMaxDate as DateTime)
	super()
	// handle the min date
	SELF:dMin 	:= dMindate
	SELF:dMax	:= dMaxDate

	RETURN 

/****************************************************************************/
CONSTRUCTOR(sMinDate as String, sMaxDate as String)
	super()
	// handle the min date
	SELF:dMin	:= datetime.parse(sMinDate)
	SELF:dMax	:= datetime.parse(sMaxDate)
	RETURN 

/****************************************************************************/
ACCESS Max() AS DATETime

	//l Returns the maxmum date in a date range.
	//p Returns the maximum date in a date range.
	//d Max represents the maximum date in the date range.
	//r Date
	//a None
	RETURN SELF:dMax

/****************************************************************************/
ASSIGN Max(dMaxDate AS DATETime) AS void 

	//l Assign the maximum date in a date range.
	//p Assign the maximum date in a date range.
	//d Max represents the maximum date in the date range.
	//r Date
	//a dMaxDate as date - Max Date in Range.
	SELF:dMax := dMaxDate
	RETURN 

/****************************************************************************/
ACCESS Min() AS DATETime

	//l Represents the minimum date in a date range.
	//p Represents the minimum date in a date range.
	//d Min represents the minimum date in the date range.
	//r Date
	//a None
	RETURN SELF:dMin

/****************************************************************************/
ASSIGN Min(dMinDate AS DATETime) AS void 

	//l Assign the minimum date in a date range.
	//p Assign the minimum date in a date range.
	//d Min represents the minimum date in the date range.
	//r Date
	//a dMinDate as date - Min Date in Range.
	SELF:dMin := dMinDate
	RETURN 
END CLASS

