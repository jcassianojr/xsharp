#region DEFINES
Define BUFLEN 		:= 80				
Define ID_MONTH1 	:= 3001			// January
Define ID_MONTH10 	:= 3010			// October
Define ID_MONTH11 	:= 3011			// November
Define ID_MONTH12 	:= 3012			// December
Define ID_MONTH2 	:= 3002			// February
Define ID_MONTH3 	:= 3003			// March
Define ID_MONTH4 	:= 3004			// April
Define ID_MONTH5 	:= 3005			// May
Define ID_MONTH6 	:= 3006			// June
Define ID_MONTH7 	:= 3007			// July
Define ID_MONTH8 	:= 3008			// August
Define ID_MONTH9 	:= 3009			// September
Define MAXLEN 		:= 12					// Should make these static defines
#endregion

CLASS PECalendar INHERIT CustomControl
// Author		: Graham McKenie Modified by Willie Moore
// Email		: williem@bigfoot.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 7 May 1998
// --------------
//l Calendar Class
//p Calendar Class
//d This is the heart of the popup calendar. It is resonsible for drawing and
//d maintaining all information about the calendar.
//j CL:rightSLE,CL:dateSLE
//g Edit Controls
//t Creation 	: %CreateDate% %CreateTime%\line
//t LastBuild 	: %BuildDate% %BuildTime%\line
//t Author 		: Graham McKenie Modified by Willie Moore


	
	PROTECT liLeft       	AS LONGINT
	PROTECT liTop				AS LONGINT
	PROTECT liRight			AS LONGINT
	PROTECT liBottom       	AS LONGINT
	PROTECT liWidth			AS LONGINT
	PROTECT liHeight			AS LONGINT

	PROTECT y1					AS LONGINT
	PROTECT y2					AS LONGINT
	PROTECT x1					AS LONGINT
	PROTECT x2					AS LONGINT
	PROTECT dCurrent			AS DATE
	PROTECT dFirst				AS DATE
	PROTECT dLast				AS DATE

	PROTECT liStartDay		AS LONGINT
	PROTECT liNumberDays		AS LONGINT

	PROTECT liHead				AS LONGINT

	PROTECT hDC					AS PTR

	PROTECT MonthRect			IS _winRect
	PROTECT YearRect			IS _winRect
	

	EXPORT Brush 				AS Brush
	EXPORT hWhitePen			AS PTR
	EXPORT hGreyPen			AS PTR

	// Added these
  	EXPORT oYearSle			AS PECalendarSLE
  	EXPORT oYearVS				AS Spinner
	PROTECT dwYear				AS DWORD
	PROTECT dwMonth			AS DWORD	
	PROTECT oDateRange		AS wmDateRange
	
	// The First Day of the Week
	PROTECT dwFirstDayoftheWeek 	AS DWORD	// I set this variable in PECalendar:Init()
	PROTECT aMonthsbyName			AS ARRAY		// array to hold the months in international format

	// for Holidays	
	PROTECT dMouseDate			AS DATE			// GCS 18/11/2005
	PROTECT aHolidays				AS ARRAY				// GCS 18/11/2005 
	
	// for callbacks
	PROTECT lDayCallback			AS LOGIC     
	PROTECT lHolidayRightclick AS LOGIC
	PROTECT lMonthCallback 		AS LOGIC	
	
	


	
   

DESTRUCTOR 
	IF !InCollect()
		SELF:Destroy()
	ENDIF
	RETURN NIL     

METHOD CastDate2Column( dDate AS DATE ) AS LONGINT PASCAL 
	//l Method to change a date into the column location
	//p Method to change a date into the column location
	//r LONG
	//a dDate \tab - Date \tab - Date to transform into a column
	LOCAL nReturnVal AS LONG
	nReturnVal := LONG((DoW(dDate) - ( SELF:dwFirstDayoftheWeek -1 )))
	IF nReturnVal < 1
		nReturnVal += 7
	ENDIF
	RETURN nReturnVal	

METHOD CastRowCol2Date( nRow AS LONGINT, nCol AS LONGINT ) AS DATE PASCAL  
	//l Method to change row,column into a date location
	//p Method to change row,column into a date location
	//r DATE
	//a nRow \tab - LONG \tab - row in the grid \line
	//a ncol \tab - LONG \tab - col in the grid \line
	LOCAL nColumnAdjustment AS LONG
	LOCAL dDate					AS DATE
	LOCAL dBeginningOfMonth	AS DATE
	LOCAL dResult				AS DATE
	dDate 				:= SELF:dCurrent
	dBeginningOfMonth := ConDate(Year(ddate),Month(ddate),1)
	nColumnAdjustment := SELF:CastDate2Column( dBeginningOfMonth )      
	dResult           := dBeginningOfMonth + 7 * (nRow-1) + (nCol-nColumnAdjustment)
	
	RETURN dResult // INT(_CAST,dBeginningOfMonth) + 7*(nRow-1) + (nCol-nColumnAdjustment)
	

METHOD CreateBrushFromHoliday(dwPos AS DWORD) AS PTR PASCAL 
	//l Method to create a brush for painting a holiday cell
	//p Method to create a brush for painting a holiday cell
	//r PRT
	//a ddPos \tab - DWORD \tab - position of element in the aHoliday Array
	LOCAL hbrush 	AS PTR
	LOCAL aColors	AS ARRAY
	IF ALen(SELF:aHolidays[dwPos]) > 2
		IF Empty(SELF:aHolidays[dwPos][3])
			// The highlight color element is created, there just isnt a color defined for this element
			hbrush 	:= CreateSolidBrush( DWORD(RGB(160,160,160)) )
		ELSE
			acolors	:= SELF:CreateColorArray(SELF:aHolidays[dwPos][3])
			IF ALen(aColors) <> 3
				// invalid number of parameters
				hbrush 	:= CreateSolidBrush( DWORD(RGB(160,160,160)) )
			ELSE
				hBrush 	:= CreateSolidBrush( DWORD(RGB(Val(aColors[1]),Val(aColors[2]),Val(aColors[3]))) )
			ENDIF
		ENDIF
	ELSE
		// no custom highlight color defined. use our default
		hbrush 	:= CreateSolidBrush( DWORD(RGB(160,160,160)) )
	ENDIF
	RETURN hBrush

METHOD CreateColorArray(cList AS STRING) AS ARRAY PASCAL 
	//l Method to take a RGB colol list as a string and turn it into a single demension array
	//p Method to take a RGB colol list as a string and turn it into a single demension array
	//r ARRAY
	//a cList \tab - STRING \tab - String containing 3 colors (ie "160,160,160")
	LOCAL nPos	AS DWORD
	LOCAL cTemp	AS STRING
	LOCAL c		AS STRING
	LOCAL aRet	AS ARRAY

	aRet  := {}
	cTemp := cList

	IF SLen(cTemp) == 0
		RETURN aRet
	ENDIF

   	nPos  := At2(",", cTemp)
	DO WHILE nPos > 0
		c     := SubStr3(cTemp, 1, nPos-1)
		cTemp := SubStr2(cTemp, nPos+1)
		AAdd(aRet, AllTrim(c))
		nPos := At2(",", cTemp)
	ENDDO

    IF SLen(cTemp) > 0
    	AAdd(aRet, AllTrim(cTemp) )
    ENDIF

    RETURN aRet		

ACCESS CurrentColumnNumber AS LONGINT PASCAL 
	//l Access to return the current column number
	//p Access to return the current column number
	//r LONG
	//a None
	RETURN SELF:CastDate2Column( SELF:dCurrent )

ACCESS CurrentDate() AS DATE PASCAL 
	//l Retrieve the current Date from the control
	//p Retrieve the current Date from the control
	//r DATE
	RETURN SELF:dCurrent


ASSIGN CurrentDate( dDate AS DATE ) AS VOID PASCAL 
	//l Set the current Date
	//p Set the current Date
	//r VOID
	//a dDate \tab DATE \tab Current Date

	IF ! ( dDate == SELF:dCurrent )
		// These four conditions warrant an InvalidateRect - a complete redraw.
		IF dDate > LastDayofMonth( dDate )  .or. dDate < FirstDayofMonth( dDate )  .or.  ! ( Year( dDate ) == SELF:dwYear )  .or. ! ( Month( dDate ) == SELF:dwMonth )
			// If we are changing months, set the new date
			SELF:dCurrent := dDate
			SELF:dwYear := Year( dDate )
			SELF:dwMonth := Month( dDate )
			// Invalidate it to force a refresh
			InvalidateRect( SELF:Handle(), NULL_PTR, TRUE )
		ELSE
			// Get the DC
			SELF:hDC := GetDC( SELF:Handle())
			// Remove the highlight from the old date
			SELF:UnHighlightDay()
			// Set our new date
			SELF:dCurrent := dDate
			// Highlight the new day
			SELF:HighlightDay()
			// Release our DC
			ReleaseDC( SELF:handle(), SELF:hDC)
			// Set it to zero (just in case)
			SELF:hDC := 0
		ENDIF
	ENDIF

	RETURN

ACCESS CurrentRowNumber AS LONGINT PASCAL 
	//l Retrieve the current row from the control
	//p Retrieve the current row from the control
	//r LONG
	LOCAL dFirst 		AS DATE
	dFirst 	:= FirstDayofMonth( SELF:dCurrent )
	RETURN Integer( ( LONG(Day(SELF:dCurrent)) + SELF:CastDate2Column( dFirst ) - 2 ) / 7 ) + 1


ACCESS DateRange() AS wmDateRange PASCAL 
	//l Gets the DateRange for a calendar.
	//p Gets the DateRange for a calendar.
	//r OBJECT of type wmDateRange
	//a NONE \line
	RETURN SELF:oDateRange

ASSIGN DateRange(oRange AS wmDateRange) AS VOID PASCAL 
	//l Sets the DateRange for a calendar.
	//p Sets the DateRange for a calendar.
	//r OBJECT of type wmDateRange
	//a oRange \tab - wmDateRange object. \line
	SELF:oDateRange	:= oRange
	IF (SELF:CurrentDate < SELF:oDateRange:Min  .or. SELF:CurrentDate > SELF:oDateRange:Max)
		SELF:CurrentDate := SELF:oDateRange:Max
	ENDIF
	RETURN

METHOD Destroy() 
	SUPER:Destroy()            
	IF SELF:hGreyPen <> NULL_PTR
		DeleteObject(SELF:hGreyPen)
	ENDIF
	IF SELF:hWhitePen <> NULL_PTR
		DeleteObject(SELF:hWhitePen)
	ENDIF
	IF !InCollect()
		UnRegisterAxit(SELF)
	ENDIF
	RETURN NIL 	

METHOD Dispatch( oEvent ) 
	
	// I've added three extra messages to Trevor's original dispatch, to handle the new UpDown/Control for the years and the new popup menu for the months

	// 1. WM_NOTIFY to update the year Sle of the sle/Spinner
	// 2. WM_SETFOCUS to hide and destroy the two controls when the calendar control gets focus again, if the oYearSle and oYearVS are active
	// 3. WM_COMMAND which is send by TrackPopUpMenuEx when a menu selection is made from the months popup menu
	// 4. WM_KEYDOWN for trapping the escape key

	LOCAL strucUpDown	AS _winNM_UPDOWN
	LOCAL iOld 			AS LONGINT
	LOCAL iDelta		AS LONGINT
	LOCAL MenuItemID	AS DWORD
	LOCAL MonthsToMove	AS LONGINT
	
	DO CASE
		CASE oEvent:Message == WM_GETDLGCODE
			IF oEvent:wparam == VK_RETURN
				SELF:Owner:dSelected := SELF:CurrentDate
				SELF:EventReturnValue	:= 1L
				PostMessage( SELF:Owner:Handle(), WM_CLOSE, 0, 0L )
				RETURN 1L
			ELSE
				// tell the dialog manager that we want to process all keys
				SELF:EventReturnValue := DLGC_WANTALLKEYS	
				// return 1L (TRUE) to prevent calling of the default window procedure
				RETURN 1L
			ENDIF
		CASE oEvent:Message == WM_NOTIFY
			strucUpDown := PTR( _CAST, oEvent:lParam )
			iOld 		:= strucUpDown.iPos
			iDelta 	:= strucUpDown.iDelta	
			// Update the Sle every time they change it
			SELF:oYearSle:Value := AllTrim( Str( iOld  + iDelta ))	
			RETURN 1L

		// If the calendar control is getting focus, hide the year Sle and the Spinner
		CASE oEvent:Message == WM_SETFOCUS
			SELF:handleYearSLE()
       		RETURN 1L		

		CASE oEvent:Message == WM_COMMAND
			// The TrackPopUpMenuEx() creates a WM_COMMAND message, the wParam will contain the MenuItemID of the prompt that was selected
			IF oEvent:wParam >= ID_MONTH1  .AND. oEvent:wParam <= ID_MONTH12
				// GDM 22/09/98 Fixed bug where we could end up with a Null_Date coming back from ConDate() eg 31/01/2000 then select
				// Feb from the pull down
	
				// Get the number of months to move
	          	MenuItemID := oEvent:wParam
				MonthsToMove := GetMonth( MenuItemID ) -  LONG(Month( SELF:CurrentDate ))
	            SELF:MoveMonths( MonthsToMove )
			ENDIF
			RETURN 1L			
		// GDM Jan 27th '98 Added Escape key for a close of the window. Alt F4 still works
		CASE oEvent:Message == WM_KEYUP  .AND. oEvent:wParam == KEYESCAPE
			SELF:EventReturnValue	:= 1L
			PostMessage( SELF:Owner:Handle(), WM_CLOSE, 0, 0L )
			RETURN 1L
		OTHERWISE
	 		// Any other messages, let VO's CustomControl winproc handle them
	END CASE
	RETURN SUPER:Dispatch( oEvent )



METHOD Draw3DBox(x1 AS LONGINT,y1 AS LONGINT,x2 AS LONGINT,y2 AS LONGINT) AS VOID PASCAL 
	//l Method to draw the 3d box
	//p Method to draw the 3d box
	//r VOID
	//a x1 as long  \line
	//a y1 as long  \line
	//a x2 as long  \line
	//a y2 as long  \line

	// Draw a raised 3d box
	SelectObject(hDC,SELF:hWhitePen)
	MoveTo(hDC,x1,y2)
	LineTo(hDC,x1,y1)
	LineTo(hDC,x2,y1)
	SelectObject(hDC,SELF:hGreyPen)
	LineTo(hDC,x2,y2)
	LineTo(hDC,x1,y2)
	RETURN



METHOD DrawArrows() AS VOID PASCAL 	
	//l Method to draw the arrows in the hearder area
	//p Method to draw the arrows in the hearder area
	//r VOID
	//a None

	LOCAL DIM aPt[3] IS _WINPOINT

	aPt[1].x := 10
	aPt[1].y := 13
	aPt[2].x := 14
	aPt[2].y := 9
   	aPt[3].x := 14
	aPt[3].y := 17	
	// Select black pen and brush
	SelectObject(hDC,GetStockObject(BLACK_PEN))
	SelectObject(hDC,GetStockObject(BLACK_BRUSH))
	// Set the fill mode to fill between points
	SetPolyFillMode(hDC,WINDING)
	// Draw the polygon
	Polygon(SELF:hDC,@aPt,3)
	// Create a polygon to draw a triangle on the right hand side
	aPt[1].x := LONG(SELF:liRight - 10)
	aPt[1].y := 13L
	aPt[2].x := LONG(SELF:liRight - 14)
	aPt[2].y := 9L	
	aPt[3].x := LONG(SELF:liRight - 14)
	aPt[3].y := 17L
	SetPolyFillMode(hDC,WINDING)
	// Draw rhw polygon
	Polygon(SELF:hDC,@aPt,3)
	
	RETURN


METHOD DrawDays() AS VOID PASCAL 
	//l Method to draw the days on the calendar
	//p Method to draw the days on the calendar
	//r VOID
	//a None

	LOCAL cDatePart					AS STRING		// GCS 18/11/2005	
	LOCAL rect 							IS _winRECT
	LOCAL strucWinSize				IS _WinSize
	LOCAL i								AS LONGINT
	LOCAL dFirstCalendarDay			AS DATE
	LOCAL dFirst						AS DATE
	LOCAL dLast							AS DATE
	LOCAL dThis							AS DATE			// GCS 18/11/2005
	LOCAL dTarget						AS DATE
	LOCAL sShortName 					AS STRING
	LOCAL hOldFont 					AS PTR
	LOCAL hBrushGrey					AS PTR
	LOCAL hFont							AS PTR
	LOCAL iBackMode					AS PTR
	LOCAL iDays							AS LONGINT
	LOCAL nCol							AS LONGINT
	LOCAL nRow							AS LONGINT
	LOCAL pszText						AS PSZ
	LOCAL siHeight						AS SHORTINT
	LOCAL liMonthTextWidth			AS LONGINT
	LOCAL liMonthTextHeight			AS LONGINT
	LOCAL liMonthYearTextWidth		AS LONGINT
	LOCAL liMonthYearTextHeight	AS LONGINT
	LOCAL liYearTextWidth			AS LONGINT
	LOCAL liYearTextHeight			AS LONGINT
	LOCAL x								AS LONGINT
	LOCAL y								AS LONGINT
	LOCAL dwOldBkColor				AS DWORD
	LOCAL dwOldTextColor				AS DWORD
	LOCAL dwHolidayPos				AS DWORD
	LOCAL nLocalWidht 				AS LONGINT         // Danilo//
	LOCAL nLocalHeight 				AS LONGINT        // Danilo//

	dFirst 	:= FirstDayofMonth ( SELF:dCurrent )
	dLast 	:= LastDayofMonth(  SELF:dCurrent )
	
	// call out event handler for a monthyear move
	IF SELF:lMonthCallback
		SELF:Owner:onMonthYearMove(SELF:dCurrent)
	ENDIF

	// Set the rect for the header
	rect.left   	:= x1
	rect.right  	:= x2
	rect.top    	:= 0
	rect.bottom 	:= SELF:liHead-2

	// The string for the title (Month + Year) eg "October 1997"
	pszText := String2Psz( CMonth(dFirst)+" " +Transform(Year(dFirst),"####") )
	GetTextExtentPoint32( hDC, pszText,  LONG(PszLen(pszText)), @strucWinSize )
	// Store the width, so we can centre it
	liMonthYearTextWidth 	:=  strucWinSize.cx
	liMonthYearTextHeight 	:=  strucWinSize.cy

	// Get the centre for x and y
	x := ( ( rect.right - rect.left ) /2  ) -    (  liMonthYearTextWidth /2  )
   y := (( rect.bottom - rect.top) /2 ) - ( liMonthYearTextHeight /2 )

	// Set the text to be transparent
	iBackMode 		:= SetBkMode( SELF:hDC, TRANSPARENT )	
	dwOldBkColor 	:= SetBkColor( SELF:hDC,  GetSysColor( COLOR_BTNFACE ) )
	dwOldTextColor	:= SetTextColor( SELF:hDC,  GetSysColor( COLOR_WINDOWTEXT  ))
	// Print the month and year as a centred title. Obviously a different position for each month
	ExtTextOut( hDc, x, y, ETO_CLIPPED + ETO_OPAQUE, @rect, pszText,  PszLen( pszText ) , NULL_PTR )	


	// Now just the month
	pszText 				:= String2Psz( CMonth(dFirst)+" " )
	GetTextExtentPoint32( hDC, pszText,  LONG(PszLen(pszText)), @strucWinSize )
	liMonthTextWidth 	:=  strucWinSize.cx
	liMonthTextHeight :=  strucWinSize.cy

	// Two rects, so we can know later where to place the months popup menu and the Year Sle.
	//  Values stored are different for each month year combination - depends on x and y and the width of the string	
	SELF:MonthRect.Left     := rect.Left + x
	SELF:MonthRect.Top		:= rect.top + y
	SELF:MonthRect.right		:= MonthRect.left + liMonthTextWidth
	SELF:MonthRect.Bottom	:= rect.Bottom
	
	// The year
	pszText 				:= String2Psz( Transform(Year(dFirst),"####") )
	GetTextExtentPoint32( hDC, pszText,  LONG(PszLen(pszText)), @strucWinSize )
	liYearTextWidth 	:=  strucWinSize.cx
	liYearTextHeight 	:=  strucWinSize.cy

	// The year rect
	SELF:YearRect.Left 		:= SELF:MonthRect.Right
	SELF:YearRect.Top 		:= SELF:MonthRect.Top
	SELF:YearRect.Right 		:= SELF:YearRect.Left + liYearTextWidth
 	SELF:YearRect.Bottom 	:= SELF:MonthRect.Bottom

	// Now the days of the week - Sun and Sat are in red
	hOldFont 	:= SelectObject( SELF:hDC, GetStockObject( ANSI_VAR_FONT ) )
	
	// create the brush/font for holidays
	siHeight 	:= - SHORTINT( ( GetDeviceCaps( hDC, LOGPIXELSY ) * 10) / 72 )
	hFont 		:= CreateFont( siHeight,0,0,0,FW_BOLD,0,0,0,0,0,0,0,0,Cast2Psz("Times New Roman") )

	
	// Get a known Sunday
	dFirstCalendarDay := CToDAnsi("1996/10/20") + ( SELF:dwFirstDayoftheWeek -1 )
	FOR i := 0 UPTO 6
		
		sShortName 	:= Left( CDoW( dFirstCalendarDay + i ), 3 )
		rect.Left 	:= SELF:liLeft + ( i * SELF:liWidth / 7 )
		rect.Top 	:= SELF:liTop + ( 0 * ( SELF:liHeight / 7 )) + 1
		rect.Right 	:= rect.Left + ( SELF:liWidth / 7 )
		rect.Bottom	:= rect.Top + SELF:liHeight / 7
		
		IF SELF:dwFirstDayoftheWeek = 1
			SetTextColor( SELF:hDc, DWORD(RGB( IIF( i = 0  .OR. i = 6, 255, 0 ), 0, 0 )))
		ELSE
			SetTextColor( SELF:hDc, DWORD(RGB( IIF( i = 5  .OR. i = 6, 255, 0 ), 0, 0 )))
		ENDIF
		
		DrawText( SELF:hDc, String2Psz(sShortName), LONG(SLen(sShortName)), @rect, DT_CENTER + DT_WORDBREAK )
		
	NEXT		

	SetTextColor( SELF:hDc, DWORD(RGB( 0,0,0)) )	

	iDays 			:= dLast - dFirst + 1
	dTarget			:= dFirst	
   nRow 				:= 1
   nCol 				:= SELF:CastDate2Column( dFirst )	
	cDatePart		:= NTrim(Year(SELF:dCurrent)) + "/" + StrZero(Month(SELF:dCurrent),2) + "/"	
	nLocalWidht 	:= Integer(SELF:liWidth / 7)
	nLocalHeight 	:= Integer(SELF:liHeight /7)


	// Now the numbers
	FOR i := 1 UPTO iDays

		rect.left 	:= SELF:liLeft + ( nCol - 1) * ( nLocalWidht)
		rect.top 	:= SELF:liTop + ( nRow * ( nLocalHeight ) ) + 2
		rect.right	:= rect.left + nLocalWidht
		rect.Bottom	:= rect.Top +  nLocalHeight
		dThis 		:= CToDAnsi(cDatepart + StrZero(i,2))
		
		IF !Empty(SELF:oDateRange)
			IF dTarget < SELF:oDateRange:Min  .OR. dTarget > SELF:oDateRange:Max
				// Date is not in the range so adjust the color
				SetTextColor( SELF:hDc, DWORD(RGB( 192,192,192) ))	
				dwHolidayPos := SELF:isInHoliday(dThis)
				IF dwHolidayPos > 0
					hBrushGrey	:= SELF:CreateBrushFromHoliday(dwHolidayPos)
					rect.Bottom -= 2
					rect.Left += 3
					SetTextColor(SELF:hDc, DWORD(RGB(255,0,0)))
					FillRect( SELF:hDC, @rect, hBrushGrey)	// paint the area for the holiday only
					SelectObject(SELF:hDC, hFont )
					rect.Bottom += 2
					rect.Left -= 3			
					DeleteObject(hBrushGrey)
				ENDIF
			ELSE
				dwHolidayPos := SELF:isInHoliday(dThis)
				IF dwHolidayPos > 0
					hBrushGrey	:= SELF:CreateBrushFromHoliday(dwHolidayPos)
					rect.Bottom -= 2
					rect.Left += 3
					SetTextColor(SELF:hDc, DWORD(RGB(255,0,0)))
					FillRect( SELF:hDC, @rect, hBrushGrey)	// paint the area for the holiday only
					SelectObject(SELF:hDC, hFont )
					rect.Bottom += 2
					rect.Left -= 3			
					DeleteObject(hBrushGrey)
				ELSE
					SetTextColor( SELF:hDc, DWORD(RGB(0,0,0)) )					
					SelectObject(SELF:hDC, GetStockObject(ANSI_VAR_FONT))
				ENDIF
			ENDIF
		ELSE
			dwHolidayPos := SELF:isInHoliday(dThis)
			IF dwHolidayPos > 0
				hBrushGrey	:= SELF:CreateBrushFromHoliday(dwHolidayPos)
				rect.Bottom -= 2
				rect.Left += 3
				SetTextColor(SELF:hDc, DWORD(RGB(255,0,0)))
				FillRect( SELF:hDC, @rect, hBrushGrey)	// paint the area for the holiday only
				SelectObject(SELF:hDC, hFont )
				rect.Bottom += 2
				rect.Left -= 3			
				DeleteObject(hBrushGrey)
			ELSE
				SetTextColor( SELF:hDc, DWORD(RGB(0,0,0)) )					
				SelectObject(SELF:hDC, GetStockObject(ANSI_VAR_FONT))
			ENDIF
		ENDIF		
		
		DrawText( SELF:hDC, String2Psz( Str( i, 2, 0) ) , 2, @rect, DT_CENTER + DT_WORDBREAK )

		IF nCol = 7
			// Increment the row
			nCol := 1
			nRow += 1

		ELSE
			nCol += 1
		ENDIF
		// incremnt the target date
        dTarget += 1
	NEXT

	// Delete our brush and font
	DeleteObject(hFont)

	// Put 'em all back to the way they were.
	SetBkMode( SELF:hDC, iBackMode )
	SetBkColor( SELF:hDC, dwOldBkColor )
	SetTextColor( SELF:hDC, dwOldTextColor )
	SelectObject( SELF:hDC, hOldFont )

	RETURN

METHOD DrawOutLine() AS VOID PASCAL 
	//l Method to draw the calendar outline
	//p Method to draw the calendar outline
	//r VOID
	//a None
	LOCAL i 		AS LONGINT
	LOCAL liTop 	AS LONGINT
	LOCAL liLeft 	AS LONGINT	

	// for each row
	FOR i := 1 UPTO 6

		liTop := SELF:liTop + (i) * (SELF:liHeight / 7)

		// Draw a line in white
		SelectObject(hDC,GetStockObject(WHITE_PEN))
		MoveTo(hDC,SELF:liLeft, liTop )
		LineTo(hDC,SELF:liRight, liTop )

		liTop += 1
		// And another in grey
		SelectObject(hDC,SELF:hGreyPen)
		MoveTo(hDC,SELF:liLeft, liTop )
		LineTo(hDC,SELF:liRight, liTop )

	NEXT

	// for each column
	FOR i := 1 UPTO 6

		liLeft := SELF:liLeft + (i) * (liWidth / 7 )

		// and then in white
		SelectObject(hDC,GetStockObject(WHITE_PEN))
		MoveTo(hDC, liLeft,SELF:liTop)
		LineTo(hDC, liLeft,SELF:liBottom)

		liLeft += 1
		// Draw a line in grey
		SelectObject(hDC, hGreyPen)
		MoveTo(hDC, liLeft, SELF:liTop)
		LineTo(hDC, liLeft, SELF:liBottom)

	NEXT							

	RETURN		

METHOD EditMonth() AS VOID PASCAL 
	//l Method to select a new month from a drop down list
	//p Method to select a new month from a drop down list
	//r VOID
	//a None


	LOCAL hMenu 			AS PTR
	LOCAL strucWinPoint		IS _winPoint
	LOCAL i					AS LONGINT

	hMenu := CreatePopupMenu()
	
	FOR i := 1 UPTO MAXLEN
		AppendMenu( hMenu, MF_STRING, DWORD(ID_MONTH1 + (i-1)), String2Psz(SELF:aMonthsbyName[i]))
	NEXT

	// Use MonthRect to position the PopUpMenu
	strucWinPoint.x := SELF:MonthRect.Left
	strucWinPoint.y := SELF:MonthRect.Bottom
	
	// TrackPopUpMenuEx takes screen coordinates, so we have to convert
	ClientToScreen( SELF:Handle(), @strucWinPoint )

	TrackPopupMenuEx( hMenu, TPM_LEFTALIGN, strucWinPoint.x, strucWinPoint.y, SELF:Handle(), NULL )
	
	// Finished with
	DestroyMenu( hMenu )

	RETURN


METHOD EditYear() AS VOID PASCAL 
	//l Method to edit year
	//p Method to edit year
	//r VOID
	//a None
	LOCAL nSleWidth		AS LONGINT
	LOCAL nSleHeight		AS LONGINT	
	LOCAL dwStyle			AS DWORD
	LOCAL y 					AS LONGINT
	LOCAL x					AS LONGINT

	nSleWidth 		:= YearRect.Right - YearRect.Left  + 1
	nSleHeight 		:= YearRect.Bottom - YearRect.Top
	x		 			:= YearRect.Left
	y			 		:= SELF:Size:Height - YearRect.Top - nSleHeight		// Correct y for VO

	// Create the sle
	dwStyle 								:= _OR( WS_CHILD , WS_TABSTOP , WS_BORDER )		
	SELF:oYearSle						:= PECalendarSLE{ SELF, -1, Point{ x, y }, Dimension{ nSleWidth, nSleHeight }, dwStyle }
	SELF:oYearSLE:FocusSelect		:= FSEL_RALL
	SELF:oYearSLE:ObeyFocus 		:= TRUE
	SELF:oYearSle:processEnterKey	:= TRUE


	// Adjust x to place the spinner just to the right of the Sle
	x := SELF:oYearSle:Origin:x + SELF:oYearSle:Size:Width

	// Create the spinner
	dwStyle 		:=  _OR(UDS_ARROWKEYS, UDS_SETBUDDYINT)
//	dwStyle 		:=  UDS_ARROWKEYS
	SELF:oYearVs 	:= VerticalSpinner{ SELF, -1, Point{ x, y}, Dimension{ 20,20 }, dwStyle }

	// Set the range before the position, otherwise it defaults to range either high or low
	IF !Empty(SELF:oDateRange)
		SELF:oYearVS:Range	:= Range{Year(SELF:oDateRange:Min),Year(SELF:DateRange:Max)}
	ELSE
		SELF:oYearVs:Range := Range{ 1752, 2999 } 	// Billy's idea of when the world started and when its going to end, I guess Bill will still be around in 2999
	ENDIF

	// Where are we
	SELF:oYearVs:Position 	:=  SELF:dwYear

	// Tell the spinner who it works for
	SELF:oYearVs:Client 	:= SELF:oYearSle	// You need this for the arrow keys to work as updown keys otherwise it uses the arrow keys to cursor in the sle

	// Don't assign to CurrentText, before we build the spinner, I got wierd stuff when I did
	SELF:oYearSle:CurrentText 	:= NTrim(SELF:dwYear) //Str(  Year(SELF:dCurrent) ,4,0 )
	// Show 'em both and set focus to the sle
	SELF:oYearSle:Show()
	SELF:oYearVs:Show()
	SELF:oYearSle:SetFocus()
	
	RETURN


METHOD Expose( oEE ) 

	LOCAL struPS IS _winPaintStruct

	// Set our DC
	hDC := BeginPaint( SELF:Handle(), @struPS )

	SELF:Draw3DBox(y1,x1,SELF:liRight,SELF:liTop-1)
	// for each row
	// Draw the outline
	SELF:DrawOutline()
	// Draw our days
	SELF:DrawDays()		
	// Draw the right and left arrows
	SELF:DrawArrows()
	// Highlight the current day
	SELF:HighlightDay()

	// Set the first day of the month
	// SELF:dFirst := ConDate(Year(dCurrent),Month(dCurrent),1)
	// Set the last day of the month
	// SELF:dLast := SELF:LastDayofMonth(dCurrent)

	EndPaint( SELF:Handle(), @struPS)

	RETURN NIL

ASSIGN FirstDayoftheweek(nDayofWeek AS DWORD) AS VOID PASCAL 
	//l Set the First Day of the Week
	//p Set the First Day of the Week
	//r DWORD
	//a nDayofWeek \tab DWORD \tab Calendar begins on:\line
	//a \tab \tab \tab \tab \tab 1 = Monday \line
	//a \tab \tab \tab \tab \tab 2 = Sunday \line

	SELF:dwfirstdayoftheweek	:= nDayofWeek
	RETURN

ACCESS FirstDayOfWeek() AS DWORD PASCAL 
	//l Retrieve the First Day of the Week
	//p Retrieve the First Day of the Week
	//r DWORD
	//r \tab Calendar begins on:\line
	//r \tab \tab \tab 1 = Monday \line
	//r \tab \tab \tab 2 = Sunday \line
	RETURN SELF:dwfirstdayoftheweek

METHOD handleYearSLE() AS VOID PASCAL 
	//l callback method to handle removing the YearSLE
	//p callback method to handle removing the YearSLE
	//d callback method to handle removing the YearSLE. This will \line
	//d move the control to the year specified by the yearSLE, \line
	//d then hid itself.
	//r VOID
	//a None	
	LOCAL YearsToMove		AS LONGINT
	
	IF ! ( SELF:oYearSle == NULL_OBJECT )		
		// Force the calendar to update to the selected year
		// GDM 23/09/98 Intoduced new method MoveYears()
		YearsToMove := Val( SELF:oYearSle:CurrentText) - LONG(Year( SELF:CurrentDate ))
     	SELF:MoveYears( YearsToMove )
		SELF:oYearSle:Hide()
		SELF:oYearVS:Hide()
		SELF:oYearSle:Destroy()
		SELF:oYearVS:Destroy()
	
	ENDIF	
	RETURN
	

METHOD HighlightDay() AS VOID PASCAL 
	//l highlight a day
	//p highlight a day
	//r VOID
	//a None
	LOCAL nRow 				AS LONGINT
	LOCAL nCol 				AS LONGINT
	LOCAL hBrush	 		AS PTR
	LOCAL dThis				AS DATE
	LOCAL dwHolidayPos	AS DWORD
	LOCAL rect 				IS _winRECT
	LOCAL nLocalWidht 	AS LONGINT
	LOCAL nLocalHeight 	AS LONGINT
 
	
	IF SELF:lDayCallback
		SELF:owner:onDayMove(SELF:dCurrent)
	ENDIF

	nCol				:= SELF:CurrentColumnNumber
	nRow				:= SELF:CurrentRowNumber
	dThis				:= SELF:dCurrent  
	nLocalWidht 	:= Integer(liWidth / 7)     // Danilo //
	nLocalHeight	:= Integer(liHeight /7)    // Danilo //


	// set the rectangle like normal then deflate it
	rect.Left := SELF:liLeft + (( nCol - 1) * nLocalWidht) +2    // Danilo //
	rect.Top := SELF:liTop + ( nRow * nLocalHeight ) +1     // Danilo //
	rect.Right := rect.Left + nLocalWidht -1    // Danilo //
	rect.Bottom := rect.Top + nLocalHeight
	InflateRect( @rect, -1, -2 )    // Danilo //
	
	// Create a grey brush in background color.
	hBrush := CreateSolidBrush( GetSysColor( COLOR_ACTIVECAPTION ) )
	// Fill the area
	FillRect( SELF:hDC, @rect, hBrush )
	// Set our font
	SelectObject( SELF:hDC, GetStockObject( ANSI_VAR_FONT ) )
	// Set background mode to transparent
	SetBkMode( SELF:hDC, TRANSPARENT )
	// Set color to caption color
	dwHolidayPos := SELF:isInHoliday(dThis)
	IF dwHolidayPos > 0
		SetTextColor(SELF:hDC, DWORD(RGB(255,0,0)))
	ELSE
		SetTextColor(SELF:hDC, GetSysColor(COLOR_CAPTIONTEXT))
	ENDIF

	// Set the rectangle
	rect.Left 	:= SELF:liLeft + (( nCol -1) * nLocalWidht )     // Danilo //
	rect.Top 	:= SELF:liTop + ( nRow * nLocalHeight ) +2    // Danilo //
	rect.Right 	:= rect.Left + nLocalWidht    // Danilo //
	rect.Bottom := rect.Top + nLocalHeight    // Danilo //


	// Draw the text
	DrawText(hDC,String2Psz( Str( Day( SELF:dCurrent ),2,0)),2,@rect, DT_CENTER+DT_WORDBREAK)


	// Delete our brush
	DeleteObject(hBrush)	

	RETURN

ASSIGN Holiday(aDates AS ARRAY) AS VOID PASCAL 
	//l Holiday array.
	//p Holiday array.
	//d This assign will set the array containing days to be highlighted. \line
	//r Void \line
	//a aHoliday[i,1] \tab Date To be Highlighted. \line
	//a aHoliday[i,2] \tab Text description for mouseover. \line
	//a aHoliday[i,3] \tab String containing highlight color in rgb format. \line
	SELF:aHolidays	:= aDates
	RETURN

METHOD HorizontalSpin(oSpinEvent) 
	//Put your changes here                 
	RETURN NIL

CONSTRUCTOR(oOwner, xId,oPoint,oDim, kStyle, lDataAware) 
   LOCAL i 				AS DWORD
   LOCAL DIM firstDay[2]	AS BYTE

	SELF:aMonthsbyName	:= ArrayCreate(12)
	FOR i := 1 UPTO 12
		aMonthsbyName[i] := NToCMonth(i)
	NEXT
	SELF:oDateRange	:= NULL_OBJECT

	// Call the super
	SUPER( oOwner, xID,oPoint, oDim, kStyle, lDataAware)		

	// First rectangle
	SELF:x1 := 0
	SELF:y1 := 0

	// Second
	SELF:x2 := SELF:Size:Width
	SELF:y2 := SELF:Size:Height

 	SELF:liHead  := 25

	// Create handles to our pens
	SELF:hWhitePen := GetStockObject( WHITE_PEN )
	SELF:hGreyPen  := CreatePen( PS_SOLID,1,DWORD(RGB(128,128,128)) )

	// Set up our variables
	SELF:liTop  	:= SELF:liHead
	SELF:liLeft 	:= 0
	SELF:liBottom 	:= SELF:y2
	SELF:liRight	:= SELF:x2

	SELF:liWidth  := LONGINT( (SELF:liRight - SELF:liLeft) / 7 ) * 7

	SELF:liRight := SELF:liLeft + SELF:liWidth

	SELF:liHeight := LONGINT( (SELF:liBottom - SELF:liTop) / 6 ) * 6

	SELF:liBottom := SELF:liTop + SELF:liHeight


	// Give our date a default
	SELF:dCurrent := Today()
	SELF:dwYear := Year( Today() )
	SELF:dwMonth := Month( Today() )
	
	GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_IFIRSTDAYOFWEEK, @firstDay, 2)
	IF firstDay[1] = 48	// Monday 1st Day of Week
		SELF:dwFirstDayoftheWeek := 2			// 1.. Sunday   2.. Monday   etc
	ELSEIF firstDay[1] = 54	// Sunday 1st Day of Week
		SELF:dwFirstDayoftheWeek := 1			// 1.. Sunday   2.. Monday   etc
	ENDIF	

	// init the holidays array
	SELF:aHolidays	:= {}   
	
	// ************************************************************************************
	// * check for our callbacks now so I dont have to do it each time a date changes     *
	// *                                                                                  *
	// * for anyone who might be interested, I repeat this same code line for line        *
	// * in method dlgPECalendar:postinit. This is because class PECalendar is standaline *
	// * so it must check to see what ever GUI calls in has those methods or it wont do   *
	// * the callback. For anyone who writes their own GUI to call class PECalendar, add  *
	// * this code to your GUI with the callbacks in my dlgPECalendar class and the       *
	// * callbacks will work.                                                             *
	// ************************************************************************************ 	
	IF IsMethod(SELF:Owner,#onMonthYearMove)
		SELF:lMonthCallback		:= TRUE
	ENDIF
	IF IsMethod(SELF:Owner,#onHolidayDateRightClick)
		SELF:lHolidayRightclick	:= TRUE
	ENDIF
	IF IsMethod(SELF:Owner,#onDayMove)
		SELF:lDayCallback			:= TRUE
	ENDIF             
	
	// register an axit so I an cleanup after myself
	RegisterAxit(SELF)

RETURN SELF


METHOD isInHoliday(dThis AS DATE) AS DWORD PASCAL 
	//l Method to check to see if a date is in the holiday range
	//p Method to check to see if a date is in the holiday range
	//r DWORD	\tab 0 means date not in array. \line
	//r \tab any other positive number is the element that contains the date.
	//a dThis	- Date	- Date to check the holiday array for.
	LOCAL dwResult	AS DWORD
	dwResult := AScan(SELF:aHolidays, {|elm| elm[1] = dThis})

	RETURN dwResult



METHOD isMouseInCalendar(oMouseEvent AS MouseEvent,nrow REF LONGINT, ncol REF LONGINT) AS LOGIC PASCAL 
	//l Method isMouseIncalendar will check the mouse position against the grid
	//p Method isMouseIncalendar will check the mouse position against the grid
	//d Method used to see if the mosue position is in the calendar grid. If the mouse is in \line
	//d the grid, it will pass back the row and colum that represents the grid position.
	//r LOGIC
	//a oMouseEvent \tab - MouseEvent \tab - VO Generated mouse event \line
	//a nRow \tab - Ref Long \tab - set by method. row where the mouse is located \line	
	//a nCol \tab - Ref Long \tab - set by method. col where the mouse is located \line	
	LOCAL lResult	AS LOGIC
	LOCAL y 		AS LONGINT
	LOCAL x 		AS LONGINT	
	BEGIN SEQUENCE
		lResult := FALSE
		x 		:= oMouseEvent:Position:x
		y 		:= SELF:Size:Height - oMouseEvent:Position:y

		nRow 	:= LONGINT(( y - SELF:liHead ) / ( SELF:liHeight / 7 ) )
		nCol 	:= LONGINT( x / ( SELF:liWidth / 7 ) ) +1

		IF y > (SELF:liHead + SELF:liHeight/7	)  .and. ( nRow > 0  .and. nCol > 0 )	// Account for the header and the row of days
			lResult := TRUE
		ENDIF
	END SEQUENCE
	RETURN lResult

METHOD KeyDown(oE) 
	//l Method to handle keystrokes
	//p Method to handle keystrokes
	//r VOID
	//a oE \tab - Event Object \tab - VO Generated Event representing the keystroke
	LOCAL dwParam AS DWORD

	dwParam := oE:wParam

	DO CASE
		CASE dwParam == VK_RIGHT
			// Move one day ahead
			SELF:MoveDays(1)
		CASE dwParam == VK_LEFT
			// Move one day back
			SELF:MoveDays(-1)	
		CASE dwParam == VK_UP
			// Move back one week
			SELF:MoveDays(-7)
		CASE dwParam == VK_DOWN
			// Move ahead one week
			SELF:MoveDays(7)	
		CASE dwParam == VK_PRIOR
			// Move back one month
			SELF:MoveMonths(-1)
		CASE dwParam == VK_NEXT
			// Move ahead one month
			SELF:MoveMonths(1)	
		CASE dwParam == VK_HOME
	  		// Move to MinDate
	  		SELF:MoveFirstofMonth()
		CASE dwParam == VK_END
  			// Move to MaxDate
  			SELF:MoveLastofMonth()
	ENDCASE
	RETURN NIL

METHOD MouseButtonDoubleClick(oME) 
	//l Method to handle MouseButtondoubleclick
	//p Method to handle MouseButtondoubleclick
	//r VOID
	//a oME \tab - Mouse Event \tab - VO Generated Event representing the MouseEvent
	LOCAL dDate AS DATE
	LOCAL dNew 	AS DATE
	LOCAL nRow	AS LONGINT
	LOCAL nCol	AS LONGINT
	
    BEGIN SEQUENCE
		// GDM 17/2/98 Added stuff here to keep Ronny happy
	
		// Store the current date
		dDate := SELF:dCurrent	

		// Need an extra check in here to make sure we are in the date area.
	    IF SELF:isMouseInCalendar(oME,@nRow,@ncol)
				dNew := SELF:CastRowCol2Date(nRow,nCol)
				IF !Empty(SELF:oDateRange)  .and. ;
					(dNew < SELF:oDateRange:Min  .or. dNew > SELF:oDateRange:Max)
					// dont need to do anything here
					BREAK S_OK
				ENDIF
				// If dNew is a valid date in the current month
				IF dNew <= LastDayofMonth(dDate)  .and. dNew >=  FirstDayofMonth( dDate )	
					SELF:Owner:dSelected := SELF:CurrentDate
					SELF:EventReturnValue	:= 1L
	                PostMessage( SELF:owner:Handle(), WM_CLOSE,0, 0L )
				ENDIF
	         ENDIF
	END SEQUENCE	
	RETURN NIL

METHOD MouseButtonDown(oMouseEvent) 
	//l Method to handle MouseButtondown
	//p Method to handle MouseButtondown
	//r VOID
	//a oMouseEvent \tab - Mouse Event \tab - VO Generated Event representing the MouseEvent
	LOCAL dNew	AS DATE
	LOCAL nRow	AS LONGINT
	LOCAL nCol	AS LONGINT
	LOCAL dwPos	AS DWORD
	BEGIN SEQUENCE
		IF SELF:isMouseInCalendar(oMouseEvent,@nrow,@nCol)
			dNew := SELF:CastRowCol2Date(nRow,nCol)

			#IFDEF __DEBUG
				_DebOut32(PSZ("Mouse button pressed:" + NTrim(oMouseEvent:buttonid)))
			#ENDIF
			IF oMouseEvent:IsRightButton
				dwPos := SELF:isInHoliday(dNew)
				IF dwPos > 0
					IF SELF:lHolidayRightclick
						SELF:Owner:onHolidayDateRightClick(SELF:dMouseDate)
					ENDIF
				ENDIF
			ENDIF
		ENDIF
	END SEQUENCE
	RETURN NIL	

METHOD MouseButtonUp(oME) 
	//l Method to handle MouseButtonUp
	//p Method to handle MouseButtonUP
	//r VOID
	//a oME \tab - Mouse Event \tab - VO Generated Event representing the MouseEvent
	LOCAL nRow 	AS LONGINT
	LOCAL nCol 	AS LONGINT
	LOCAL dNew 	AS DATE
	LOCAL dDate AS DATE
	LOCAL x 	AS LONGINT
	LOCAL y 	AS LONGINT

	LOCAL strucMonthRect 	IS _winRect
	LOCAL strucYearRect		IS _winRect

	BEGIN SEQUENCE
		SetFocus(SELF:Handle())
		
		x := oME:Position:x
		y := SELF:Size:Height - oME:Position:y
	
		// Save the current date
		ddate := SELF:dCurrent
	
		// Save the row and column
		nRow 	:= LONGINT(( y - SELF:liHead ) / ( SELF:liHeight / 7 ) )
		nCol 	:= LONGINT( x / ( SELF:liWidth / 7 ) ) +1
	
		
		strucMonthRect := SELF:MonthRect
		strucYearRect  := SELF:YearRect
	
		// If we are in the header
		IF y <= SELF:liHead			
	
			IF x < 20
				// We are in the left arrow area, decrement the month by one
				SELF:MoveMonths(-1)
			ELSEIF x > ( SELF:liRight - 20 )
				// We are in the right arrow area, increment the month by one
				SELF:MoveMonths(1)
	
				// Two additions methods here, to handle the month and year
			ELSEIF PointInSide( @StrucMonthRect, x, y )
				SELF:EditMonth()
	
			ELSEIF PointInSide( @StrucYearRect, x, y )
	
				SELF:EditYear()					
	
				ENDIF				
	
		// Otherwise make sure we have positive values
		ELSEIF nRow > 0  .and. nCol > 0
			// get the day of week of the first date
			dNew	:= SELF:CastRowCol2Date(nRow,nCol)
			IF !Empty(SELF:oDateRange)  .and. ;
				(dNew < SELF:oDateRange:Min  .or. dNew > SELF:oDateRange:Max)
				// dont need to do anything here
				BREAK S_OK
			ENDIF
			// If dNew is a valid date in the current month
			IF dNew <= LastDayofMonth(dDate)  .and. dNew >=  FirstDayofMonth( dDate )
				// Get a DC
				SELF:hDC := GetDC( SELF:handle())
				// Unhighlight the current day
				SELF:UnHighLightDay()
				// Set the current date to be our dNew date
				SELF:dCurrent := dNew
				// Highlight the new day
				SELF:HighLightDay()
				// Release our DC
				ReleaseDC( SELF:handle(),SELF:hDC)
			ENDIF		
		ENDIF
	END SEQUENCE

	RETURN NIL


METHOD MouseMove(oMouseEvent) 
	//l Method to handle MouseMove
	//p Method to handle MouseMove
	//r VOID
	//a oMouseEvent \tab - Mouse Event \tab - VO Generated Event representing the MouseEvent
	LOCAL dwPos AS DWORD
	LOCAL dNew	AS DATE
	LOCAL nRow	AS LONGINT
	LOCAL ncol	AS LONGINT

	// GCS 18/11/2005 - Added for Kuhan
	IF ALen(SELF:aHolidays) = 0
		RETURN NIL		// nothing to do
	ENDIF

	IF SELF:isMouseInCalendar(oMouseEvent,@nrow,@ncol)
		dNew := SELF:CastRowCol2Date(nRow,nCol)
		// save the date if its different and trigger the tooltip
		// but only do this if a holiday esits on this date
		IF SELF:dMouseDate <> dNew
			dwPos := SELF:isInHoliday(dNew)
			IF dwPos > 0
				SELF:ToolTipText := SELF:aHolidays[dwPos,2]		// format must be { ....{dDate, cDescription}.... }
			ELSE
				SELF:ToolTipText := ""		// clear it!
			ENDIF
			SELF:dMouseDate := dNew		// set the date memory
		ENDIF
	ENDIF

	RETURN NIL

METHOD MoveDays( n AS LONGINT ) AS VOID PASCAL 
	//p Method to move n number of days
	//r VOID
	//a n as int - Number of days to move
	LOCAL dTarget AS DATE
	BEGIN SEQUENCE
		dTarget := dCurrent + n

		IF !Empty(SELF:oDateRange)  .and. ;
			(dTarget < SELF:oDateRange:Min  .or. dTarget > SELF:oDateRange:Max)
			// dont need to do anything here
			BREAK S_OK
		ENDIF

	
	
		// If we have moved to a different month
		IF dTarget > LastDayofMonth( SELF:dCurrent )  .or. dTarget < FirstDayofMonth( SELF:dCurrent )
			// Set the new date
			SELF:dCurrent := dTarget
			// Invalidate the area to force a redraw
			InvalidateRect( SELF:Handle(), NULL_PTR, TRUE )
		ELSE
			// Get as window DC
			SELF:hDC := GetDC( SELF:Handle() )
			// Unhighlight the current day
			SELF:UnHighlightDay()
			// Set the new date
			SELF:dCurrent := dTarget
			// Highlight the new date
			SELF:HighlightDay()
			// Release the window DC
			ReleaseDC( SELF:Handle(),SELF:hDC)
		ENDIF
	END SEQUENCE
	RETURN

METHOD MoveFirstOfMonth() AS VOID PASCAL 
	//l Method to move the First Day of the Month
	//p Method to move the First Day of the Month
	//r VOID
	LOCAL dTarget AS DATE
	BEGIN SEQUENCE
	
		dTarget := FirstDayofMonth( SELF:dCurrent )

		IF !Empty(SELF:oDateRange)  .and. ;
			(dTarget < SELF:oDateRange:Min  .or. dTarget > SELF:oDateRange:Max)
			// move to the first day in the daterance
			dTarget := SELF:oDateRange:Min
		ENDIF

	
		// Get as window DC
		SELF:hDC := GetDC( SELF:Handle() )
		// Unhighlight the current day
		SELF:UnHighlightDay()
		// Set the new date
		SELF:dCurrent := dTarget
		// Highlight the new date
		SELF:HighlightDay()
		// Release the window DC
		ReleaseDC( SELF:Handle(),SELF:hDC)
	END SEQUENCE
	RETURN

METHOD MoveLastOfMonth() AS VOID PASCAL 
	//l Method to move the Last Day of the Month
	//p Method to move the Last Day of the Month
	//r VOID
	LOCAL dTarget AS DATE
	
	BEGIN SEQUENCE
		dTarget := LastDayofMonth( SELF:dCurrent )

		IF !Empty(SELF:oDateRange)  .and. ;
			(dTarget < SELF:oDateRange:Min  .or. dTarget > SELF:oDateRange:Max)
			// move to the last day of the range
			dTarget := SELF:oDateRange:Max
		ENDIF

	
		// Get as window DC
		SELF:hDC := GetDC( SELF:Handle() )
		// Unhighlight the current day
		SELF:UnHighlightDay()
		// Set the new date
		SELF:dCurrent := dTarget
		// Highlight the new date
		SELF:HighlightDay()
		// Release the window DC
		ReleaseDC( SELF:Handle(),SELF:hDC)
	END SEQUENCE
	RETURN

METHOD MoveMonths(n AS LONGINT) AS VOID PASCAL 
	//l Method to move n number of moths
	//p Method to move n number of moths
	//r VOID
	//a n as int - number of months to move


	LOCAL dTarget 	AS DATE
	LOCAL nMonth	AS LONGINT
	
	BEGIN SEQUENCE
		nMonth := LONG(Month(SELF:dCurrent))
	
		// If we have gone back a year
		IF nMonth + n < 1
			// Set the month to december, last year
			dTarget := ConDate( Year( dCurrent )-1, 12, Day( SELF:dCurrent ) )
			IF dTarget == NULL_DATE
				// We have a day > last day of the month
				dTarget := ConDate(Year( SELF:dCurrent )-1,12,31)
			ENDIF	
		ELSEIF nMonth + n > 12
			// Set the month to January, next year
			dTarget := ConDate( Year( SELF:dCurrent ) +1,1,Day( SELF:dCurrent ))
			IF dTarget == NULL_DATE
				// We have a day > last day of the month
				dTarget := ConDate( Year( SELF:dCurrent )+1,1,31)
			ENDIF	
		ELSE
			// Set the month within the current year
			dTarget := ConDate( Year( SELF:dCurrent ), DWORD(nMonth + n), Day( SELF:dCurrent ))
			IF dTarget == NULL_DATE
				// We have a day > last day of the month
				dTarget := ConDate( Year( SELF:dCurrent ), DWORD(nMonth + n + 1),1)-1
			ENDIF	
		ENDIF	
	
		IF !Empty(SELF:oDateRange)  .AND. ;
			(dTarget < SELF:oDateRange:Min  .OR. dTarget > SELF:oDateRange:Max)
			// dont need to do anything here
			BREAK S_OK
		ENDIF
	
		SELF:dCurrent:= dTarget
		SELF:dwMonth := Month( dTarget ) 		// wcm 09-23-98 Update the current month
	
		// Force a redraw of the window	
		InvalidateRect(SELF:handle(),NULL_PTR, TRUE)
	END SEQUENCE
	RETURN

METHOD MoveYears(n AS LONGINT) AS VOID PASCAL 
	//l Method to move n number of years
	//p Method to move n number of years
	//r VOID
	//a n as int - number of years to move
	LOCAL dTarget 			AS DATE
	LOCAL lCurrent29Feb 	AS LOGIC
	LOCAL nYear				AS LONG
	LOCAL nMonth			AS LONG
	LOCAL nDay				AS LONG
	
	BEGIN SEQUENCE
		nYear 	:= LONG(Year(SELF:dCurrent))
		nMonth 	:= LONG(Month(SELF:dCurrent))
		nDay		:= LONG(Day(SELF:dCurrent))
	
		lCurrent29Feb := IIF( nMonth == 2  .AND. nDay == 29, TRUE, FALSE )
		
		// New year is a leap year
		IF IsLeapYear( nYear + n )
			
			// Doesn't matter what date we end up on
			dTarget := ConDate( DWORD(nYear + n), Month(SELF:dCurrent), Day(SELF:dCurrent) )			
	
			// New year not a leap year
		ELSE
			// Were we on a leap year, hanging out on Feb 29
			dTarget := IIF( lCurrent29Feb, 	;
							ConDate( DWORD(nYear + n), Month( SELF:dCurrent ), 28 ),  ;
							ConDate( DWORD(nYear + n), Month( SELF:dCurrent ), Day( SELF:dCurrent ) ) )
	
		ENDIF

		IF !Empty(SELF:oDateRange)  .AND. ;
			(dTarget < SELF:oDateRange:Min  .OR. dTarget > SELF:oDateRange:Max)
			// dont need to do anything here
			BREAK S_OK
		ENDIF
	
		SELF:dCurrent := dTarget
		SELF:dwYear := Year( dTarget )				// wcm 09-23-98   update the current year to make the spinner work correctly
	
		InvalidateRect(SELF:Handle(),NULL_PTR, TRUE)			
	END SEQUENCE	
	RETURN

METHOD Show() 
	
	RETURN SUPER:show()


METHOD UnHighlightDay() AS VOID PASCAL 
   	//l Unhighlight a highlighted day
   	//p Unhighlight a highlighted day
	//r VOID
	//a None
	LOCAL nRow 			AS LONGINT
	LOCAL nCol 			AS LONGINT
	LOCAL hBrush 		AS PTR
	LOCAL hFont			AS PTR
	LOCAL hOldFont		AS PTR
	LOCAL siHeight		AS SHORTINT
	LOCAL dThis			AS DATE
	LOCAL dwHolidayPos	AS DWORD
	LOCAL rect 			IS _winRECT

	nCol 		:= SELF:CurrentColumnNumber
	nRow 		:= SELF:CurrentRowNumber
	dThis		:= SELF:dCurrent

	// create the font to use
	siHeight 	:= - SHORTINT( ( GetDeviceCaps( hDC, LOGPIXELSY ) * 10) / 72 )
	hFont 		:= CreateFont( siHeight,0,0,0,FW_BOLD,0,0,0,0,0,0,0,0,Cast2Psz("Times New Roman") )

	

	// set the rectangle like normal then deflate it
	rect.Left 		:= SELF:liLeft + ( nCol - 1) * ( liWidth / 7 ) + 1
	rect.Top 		:= SELF:liTop + ( nRow * ( liHeight /7 ) ) + 1
	rect.Right	:= rect.Left + ( liWidth / 7 ) -1
	rect.Bottom	:= rect.Top +  (liHeight / 7 ) -1

	// Create a grey brush in background color.
	dwHolidayPos := SELF:isInHoliday(dThis)
	IF dwHolidayPos > 0
		hBrush := SELF:CreateBrushFromHoliday(dwHolidayPos)
		SetTextColor(SELF:hDC, DWORD(RGB(255,0,0)))
		hOldFont := SelectObject(SELF:hDC, hFont)
	ELSE
		hBrush := CreateSolidBrush( GetSysColor(COLOR_BTNFACE ) )
		SetTextColor(SELF:hDC, DWORD(RGB(0,0,0)))
		hOldFont := SelectObject(SELF:hDC, GetStockObject(ANSI_VAR_FONT))
	ENDIF

	// Fill the area
	FillRect( SELF:hDC, @rect, hBrush )

	// Set our font
	SelectObject( hDC, GetStockObject( ANSI_VAR_FONT ) )
	// Set background mode to transparent
	SetBkMode( SELF:hDC, TRANSPARENT )

	// Set the rectangle
	rect.Left 		:= SELF:liLeft + (( nCol -1) * ( SELF:liWidth / 7 ) )
	rect.Top 		:= SELF:liTop + ( nRow * ( SELF:liHeight /7 ) ) + 2
	rect.Right	:= rect.Left + ( SELF:liWidth / 7 )
	rect.Bottom	:= rect.Top +  (SELF:liHeight / 7 )

	// Draw the text
	DrawText(hDC,String2Psz( Str( Day( SELF:dCurrent ),2,0)),2,@rect, DT_CENTER+DT_WORDBREAK)

	// restore the font
	SelectObject(SELF:hDC, hOldFont)


	// Delete our brush and font
	DeleteObject(hBrush)	
	DeleteObject(hFont)


	// redraw grid lines
	SELF:DrawOutLine()


	RETURN


METHOD VerticalSpin(oSE) 
	//Put your changes here     
	LOCAL oSpinEvent	AS SpinnerEvent
	oSpinEvent	:= oSE            
	SELF:oYearVS:Position	  := oSpinEvent:Position  
	SELF:oYearSle:CurrentText := NTrim(SELF:oYearVS:VALUE)
	RETURN NIL

END CLASS
CLASS PECalendarSLE INHERIT rightSLE
//l Calendar Class SLE
//p Calendar Class SLE
//d PECalendarSLE is designed to process the enterkey \line
//d in the same mannor as the tab key.
//j CL:rightSLE,CL:dateSLE
//g Edit Controls

CONSTRUCTOR(oOwner, nId, oPoint, oDim, kStyle, lDataAware ) 
    //Vulcan.NET-Transporter: This method was automatically created
    SUPER(oOwner, nId, oPoint, oDim, kStyle, lDataAware )

//Vulcan.NET-Transporter: To Do: the following line has been inserted. Please check the return value is correct
RETURN SELF

METHOD ProcessEnter() AS LONGINT PASCAL 
	//p Method to process the enterKey
	//r long
	//a None
	SetFocus(SELF:Owner:handle())
	RETURN 1L

END CLASS
FUNCTION GetMonth( MenuItemID AS DWORD )  AS LONGINT
	//l function to get the month number based on a resourceID
	//p function to get the month number based on a resourceID
	//r LONG
	//a MenuItemID \tab - DWORD \tab - Month number

	// Returns the selected month based on the menuItemID - see the consecutive numbers I've defined for the ID_MONTHxx defines
	LOCAL aMonths AS ARRAY

	aMonths := { 01,02,03,04,05,06,07,08,09,10,11,12 }
	
RETURN aMonths[ MenuItemID - ( ID_MONTH1 - 1 ) ]

	

FUNCTION MoveTo( hDC AS PTR, x AS INT, y AS INT ) AS VOID
	//l function - Saves changing all the MoveTo's for 32bit
	//p function - Saves changing all the MoveTo's for 32bit
	//r VOID
	//a Same parameters as MovetoEx

	// GMcK Added 06/05/95 - Saves changing all the MoveTo's for 32bit
	MoveToEx( hDC, x, y, NULL_PTR )
	
	RETURN

FUNCTION PointInSide( rc AS _WinRect, x AS LONGINT, y AS LONGINT ) AS LOGIC

	LOCAL lRetVal	AS LOGIC

	lRetVal := FALSE

	IF x < rc.Left
		lRetVal := FALSE
	ELSEIF y < rc.Top
		lRetVal := FALSE
	ELSEIF x > rc.right
		lRetVal := FALSE		
	ELSEIF y > rc.bottom			
		lRetVal := FALSE
	ELSE
		lRetVal := TRUE		
	ENDIF		

	RETURN lRetVal


