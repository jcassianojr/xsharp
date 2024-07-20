// Class_Calendar.prg
#INCLUDE "rightSLE.vh"

INTERNAL _DLL FUNC GetLocaleInfo(Locale	AS DWORD, LCType AS DWORD, lpLCData AS PSZ,;
	cchData AS INT) AS INT PASCAL:KERNEL32.GetLocaleInfoA

#USING System.Windows.Forms
#USING System.Drawing
#USING System.Runtime.InteropServices
#USING System.Collections	
#USING System.Collections.Generic
#USING rightSLE.Internal


CLASS Calendar INHERIT UserControl
#REGION "   IVARS   "
	protect oGraphics       AS Graphics  
	Protect Owner           as Object
	
	// define our pens
	protect oWhitePen       AS Pen
	protect oGrayPen        AS Pen
	
	// control size
	PROTECT liLeft       	AS LONGINT
	PROTECT liTop			AS LONGINT
	PROTECT liRight			AS LONGINT
	PROTECT liBottom       	AS LONGINT
	PROTECT liWidth			AS LONGINT
	PROTECT liHeight		AS LONGINT
	PROTECT liHead			AS LONGINT


	PROTECT y1			    AS LONGINT
	PROTECT y2			    AS LONGINT
	PROTECT x1			    AS LONGINT
	PROTECT x2			    AS LONGINT
	
	PROTECT dCurrent		AS DateTime
	PROTECT dNewDate        AS DateTime
	PROTECT dFirst			AS DateTime
	PROTECT dLast			AS DateTime
	
	PROTECT MonthRect		AS winRect
	PROTECT YearRect		AS winRect

	
	// Added these
	EXPORT oYearSle			AS PECalendarSLE
	PROTECT iYear			AS LONG
	PROTECT iMonth			AS LONG
	PROTECT oDateRange		AS wmDateRange
	
	// The First Day of the Week
	PROTECT dwFirstDayoftheWeek 	AS DWORD	// I set this variable in PECalendar:Init()
	PROTECT aMonthsbyName			AS STRING[] // array to hold the months in international format
	PROTECT cSelectedMenuMonth      AS String

	// for Holidays	
	PROTECT dMouseDate			    AS DateTime			
	PROTECT ListHolidays		    AS ArrayList
	PROTECT oToolTip                AS ToolTip
	
	// for callbacks
	PROTECT lDayCallback		    AS LOGIC     
	PROTECT lHolidayRightclick      AS LOGIC
	PROTECT lMonthCallback 		    AS LOGIC	
	

#ENDREGION
#REGION "   Constructors   "    
/****************************************************************************/
CONSTRUCTOR()
	  SUPER()
	  SELF:oWhitePen            := Pen{Color.White,1}
	  SELF:oGrayPen             := Pen{Color.Gray,1}
	  SELF:dwFirstDayoftheWeek  := 1
	  SELF:ListHolidays         := ArrayList{}
	  SELF:oToolTip             := ToolTip{}
	  SELF:oDateRange	        := NULL_OBJECT
	  RETURN
#ENDREGION      
#REGION "   GUI Callback Methods"
/****************************************************************************/
Protected METHOD OnKeyUp(e As System.Windows.Forms.KeyEventArgs) as void
	local nKeyCode  AS long
	local cChar as char
	e:Handled := TRUE
	nKeyCode  := e:KeyCode  
	cChar     := convert.ToChar(nKeyCode) //e:KeyChar
	DO CASE
		CASE cChar == Keys.Right
			// Move one day ahead
			SELF:MoveDays(1)
		CASE cChar == Keys.Left
			// Move one day back
			SELF:MoveDays(-1)	
		CASE cChar == keys.Up
			// Move back one week
			SELF:MoveDays(-7)
		CASE cChar == keys.Down
			// Move ahead one week
			SELF:MoveDays(7)	
		CASE cChar == keys.Prior
			// Move back one month
			SELF:MoveMonths(-1)
		CASE cChar == keys.Next
			// Move ahead one month
			SELF:MoveMonths(1)	
		CASE cChar == keys.Home
			// Move to MinDate
			SELF:MoveFirstofMonth()
		CASE cChar == keys.End
			// Move to MaxDate
			SELF:MoveLastofMonth()
		OTHERWISE
			e:Handled := FALSE
	ENDCASE
	
	IF e:Handled <> TRUE
	   // always call the super if we dont handle the keypress
	   SUPER:onKeyUp(e)
	ENDIF
	RETURN    
#pragma warnings( 3009, on )

/****************************************************************************/
#pragma warnings( 3009, off )
Protected METHOD OnParentChanged(e as EventArgs) as void 
	LOCAL oForm              AS object
	LOCAL i                  AS long
   
	oForm               := (Object)Self:FindForm()
	SELF:Owner          := oForm
	
	// build our array of month names
	SELF:aMonthsbyName	:= string[]{12}
	FOR i := 1 UPTO 12
		aMonthsbyName[i-1] := System.DateTime{1, i, 1}:ToString("MMMM")
	NEXT
	
	// First rectangle
	SELF:x1 := 0
	SELF:y1 := 0

	// Second
	SELF:x2 := SELF:Width
	SELF:y2 := SELF:Height

	SELF:liHead  := 25

	// Set up our variables
	SELF:liTop  	:= SELF:liHead
	SELF:liLeft 	:= 0
	SELF:liBottom 	:= SELF:y2
	SELF:liRight	:= SELF:x2

	SELF:liWidth    := LONGINT( (SELF:liRight - SELF:liLeft) / 7 ) * 7
	SELF:liRight    := SELF:liLeft + SELF:liWidth
	SELF:liHeight   := LONGINT( (SELF:liBottom - SELF:liTop) / 6 ) * 6
	SELF:liBottom   := SELF:liTop + SELF:liHeight

	// Give our date a default
	SELF:dCurrent   := datetime.Today
	SELF:dNewDate   := datetime.Today
	SELF:iYear      := datetime.Today:Year
	SELF:iMonth     := datetime.Today:Month
	
	
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
	IF CheckMethod(SELF:Owner,"onMonthYearMove")
		SELF:lMonthCallback		:= TRUE
	ENDIF
	IF CheckMethod(SELF:Owner,"onHolidayDateRightClick")
		SELF:lHolidayRightclick	:= TRUE
	ENDIF
	IF CheckMethod(SELF:Owner,"onDayMove")
		SELF:lDayCallback			:= TRUE
	ENDIF
	
	SELF:Focus()    //set the focus to our control    
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/
   Protected Method OnPaint(e as PaintEventArgs) as void
		
		// get our graphics object
		SELF:oGraphics := e:Graphics

		SELF:Draw3DBox(SELF:y1,SELF:x1,SELF:liRight,SELF:liTop-1)

		// Draw the outline
		SELF:DrawOutline()

		// Draw our days
		SELF:DrawDays()		

		// Draw the right and left arrows
		SELF:DrawArrows()
			  
		// Highlight the current day
		SELF:HighlightDay()
	  RETURN

/****************************************************************************/
#pragma warnings( 3009, off )
Protected Method OnMouseDoubleClick(e as MouseEventArgs) as void
	//l Method to handle MouseButtondoubleclick
	//p Method to handle MouseButtondoubleclick
	//r VOID
	//a oME \tab - Mouse Event \tab - VO Generated Event representing the MouseEvent
	LOCAL dDate         AS DateTime
	LOCAL dNew 	        AS DateTime
	LOCAL nRow	        AS LONGINT
	LOCAL nCol	        AS LONGINT
	Local oOwner        AS Form
	LOCAL aParameters   AS Object[]
    
    nRow := 0
    nCol := 0
	try
		oOwner  := (form)SELF:Owner     //cast it back to form soI can use the close method to get out of here
		
		// Store the current date
		dDate   := SELF:dCurrent	

		// Need an extra check in here to make sure we are in the date area.
		IF SELF:isMouseInCalendar(e, ref nRow, ref ncol)
				dNew := SELF:CastRowCol2Date(nRow,nCol)
				IF !Empty(SELF:oDateRange) .and. ;
					(dNew < SELF:oDateRange:Min .or. dNew > SELF:oDateRange:Max)
					// dont need to do anything here
					BREAK S_OK
				ENDIF
				// If dNew is a valid date in the current month
				IF dNew <= LastDayofMonth(dDate) .and. dNew >=  FirstDayofMonth( dDate )	
					IF CheckMethod(SELF:Owner,"dateSelected")        		        
						aParameters     := Object[]{1}
						aParameters[0]  := SELF:dCurrent
						RunDynamicMethod(SELF:Owner,"dateSelected",aParameters)
						
					ENDIF
					oOwner:Close()  // PostMessage( SELF:owner:Handle, WM_CLOSE,0, 0L )
				ENDIF
		ENDIF
    catch
        ///todo add catch
	End Try
	RETURN          
#pragma warnings( 3009, on )

/****************************************************************************/
Protected Method OnMouseDown(e as MouseEventArgs) as void
	//l Method to handle MouseButtondown
	//p Method to handle MouseButtondown
	//r VOID
	//a oMouseEvent \tab - Mouse Event \tab - VO Generated Event representing the MouseEvent
	LOCAL dNew	        AS DateTime
	LOCAL nRow	        AS LONG
	LOCAL nCol	        AS LONG
	LOCAL nPos	        AS LONG
    LOCAL aParameters   AS Object[]
    
    nRow := 0
    nCol := 0
	Try
		IF SELF:isMouseInCalendar(e, ref nrow, ref nCol)
			dNew := SELF:CastRowCol2Date(nRow,nCol)

			IF e:Button	== MouseButtons.Right
				nPos := SELF:isInHoliday(dNew)
				IF nPos >= 0
					IF SELF:lHolidayRightclick
						aParameters := object[]{1}
						aParameters[0] := SELF:dMouseDate:ToString()
						RunDynamicMethod(SELF:Owner,"onHolidayDateRightClick",aParameters)
					ENDIF
				ENDIF
			ENDIF
		ENDIF
	Catch ex as Exception
		MessageBox.Show(ex:ToString())
	End Try
	RETURN 

/****************************************************************************/
Protected Method OnMouseMove(e as MouseEventArgs) as void
	//l Method to handle MouseMove
	//p Method to handle MouseMove
	//r VOID
	//a oMouseEvent \tab - Mouse Event \tab - VO Generated Event representing the MouseEvent
	LOCAL nPos      AS LONG
	LOCAL dNew	    AS DateTime
	LOCAL nRow	    AS LONGINT
	LOCAL ncol	    AS LONGINT
	LOCAL oDays     AS Days
    
    nRow := 0
    nCol := 0
	IF SELF:ListHolidays:Count = 0
		RETURN 		// nothing to do
	ENDIF

	IF SELF:isMouseInCalendar(e, ref nrow, ref ncol)
		dNew := SELF:CastRowCol2Date(nRow,nCol)
		// save the date if its different and trigger the tooltip
		// but only do this if a holiday esits on this date
		IF SELF:dMouseDate <> dNew
			nPos := SELF:isInHoliday(dNew)
			IF nPos >= 0
				oDays               := (Days)SELF:ListHolidays[nPos]
				SELF:oToolTip:SetToolTip(SELF,oDays:ToolTipText)
			ELSE
				SELF:oToolTip:SetToolTip(SELF,"")		// clear it!
			ENDIF
			SELF:dMouseDate := dNew		            // set the date memory
		ENDIF
	ENDIF

	RETURN 

/****************************************************************************/
Protected Method OnMouseUp(e as MouseEventArgs) as void
	//l Method to handle MouseButtonUp
	//p Method to handle MouseButtonUP
	//r VOID
	//a oME \tab - Mouse Event \tab - VO Generated Event representing the MouseEvent
	LOCAL nRow 	AS LONGINT
	LOCAL nCol 	AS LONGINT
	LOCAL dNew 	AS DateTime
	LOCAL dDate AS DateTime
	LOCAL x 	AS LONGINT
	LOCAL y 	AS LONGINT
	LOCAL hwnd  AS IntPtr

	LOCAL strucMonthRect 	AS winRect
	LOCAL strucYearRect		AS winRect

	Try
	//	SetFocus(SELF:Handle())
		
		x := e:x
		y := e:y  //SELF:Size:Height - e:y
	
		// Save the current date
		ddate := SELF:dCurrent
	
		// Save the row and column
		nRow 	:= LONGINT(( y - SELF:liHead ) / ( SELF:liHeight / 7 ) )
		nCol 	:= LONGINT( x / ( SELF:liWidth / 7 ) ) +1
	
		
		strucMonthRect := SELF:MonthRect
		strucYearRect  := SELF:YearRect
	
		// If we are in the header
		IF y <= SELF:liHead			
			if SELF:oYearSLE <> NULL
				SELF:HandleYearSLE()
			ENDIF
	
			IF x < 20
				// We are in the left arrow area, decrement the month by one
				SELF:MoveMonths(-1)
			ELSEIF x > ( SELF:liRight - 20 )
				// We are in the right arrow area, increment the month by one
				SELF:MoveMonths(1)
	
				// Two additions methods here, to handle the month and year
			ELSEIF PointInSide( ref StrucMonthRect, x, y )
				SELF:EditMonth()
	
			ELSEIF PointInSide( ref StrucYearRect, x, y )
	
				SELF:EditYear()					
	
				ENDIF				
	
		// Otherwise make sure we have positive values
		ELSEIF nRow > 0 .and. nCol > 0
		
			if SELF:oYearSLE <> NULL
				SELF:HandleYearSLE()
			ENDIF

			// get the day of week of the first date
			dNew	:= SELF:CastRowCol2Date(nRow,nCol)
			IF !Empty(SELF:oDateRange) .and. ;
				(dNew < SELF:oDateRange:Min .or. dNew > SELF:oDateRange:Max)
				// dont need to do anything here
				BREAK S_OK
			ENDIF
			// If dNew is a valid date in the current month
			IF dNew <= LastDayofMonth(dDate) .and. dNew >=  FirstDayofMonth( dDate )
				hWnd    := self:handle
				SELF:oGraphics  := Graphics.FromHwnd(hWnd)
				SELF:UnHighlightDay()
				SELF:dCurrent   := dNew
				SELF:HighlightDay()	        
				SELF:oGraphics:Dispose()			    
			ENDIF		
		ENDIF
	  Catch
	  END Try
	  RETURN          
#ENDREGION
#REGION "   Methods   "      
/****************************************************************************/
METHOD CastDate2Column( dDate AS DateTime ) AS LONGINT 
	//l Method to change a date into the column location
	//p Method to change a date into the column location
	//r LONG
	//a dDate \tab - Date \tab - Date to transform into a column
	LOCAL nReturnVal AS LONGINT
	nReturnVal := (long)((DoW((date)dDate) - ( SELF:dwFirstDayoftheWeek -1 )))
	IF nReturnVal < 1
		nReturnVal += 7
	ENDIF
	RETURN nReturnVal	

/****************************************************************************/
METHOD CastRowCol2Date( nRow AS LONGINT, nCol AS LONGINT ) AS datetime

	//l Method to change row,column into a date location
	//p Method to change row,column into a date location
	//r Date
	//a nRow \tab - LONG \tab - row in the grid \line
	//a ncol \tab - LONG \tab - col in the grid \line
	LOCAL nColumnAdjustment 	AS LONGINT
	LOCAL dDate                 AS DateTime
	LOCAL dBeginningOfMonth 	AS DateTime
	LOCAL dResult               AS DateTime
	
	ddate               := SELF:dCurrent
	dBeginningOfMonth   := DateTime{ddate:Year,ddate:Month,1}
	nColumnAdjustment   := SELF:CastDate2Column( dBeginningOfMonth )
	dResult             := (date)dBeginningOfMonth + 7 * (nRow-1) + (nCol-nColumnAdjustment)
	RETURN  dResult
	
/****************************************************************************/
METHOD CreateBrushFromHoliday(nPos AS Long) AS Brush

	//l Method to create a brush for painting a holiday cell
	//p Method to create a brush for painting a holiday cell
	//r PRT
	//a ddPos \tab - DWORD \tab - position of element in the aHoliday Array
	
	LOCAL oColor    AS Color
	LOCAL oBrush 	AS Brush
	Local oDays     as Days
	oDays   := (days)SELF:ListHolidays[nPos]
	oColor  := oDays:Color
	oBrush  := SolidBrush{oColor}
	RETURN oBrush
	
	
/****************************************************************************/
METHOD DrawArrows() AS VOID 

	//l Method to draw the arrows in the hearder area
	//p Method to draw the arrows in the hearder area
	//r VOID
	//a None
	Local Point1        as Point
	Local Point2        as Point
	Local Point3        as Point
	Local oPen          as pen
	Local oBrush        as brush
	Local CurvePoints   as Point[]

	oPen        := Pen{Color.Black,2}
	oBrush  := SolidBrush{Color.Black}

	// Create a polygon to draw a triangle on the left hand side
	Point1          := Point{10,13}
	Point2          := Point{14,9}
	Point3          := Point{14,17}
	CurvePoints     := Point[]{3}
	CurvePoints[0]  := Point1
	CurvePoints[1]  := Point2
	CurvePoints[2]  := Point3
	SELF:oGraphics:FillPolygon(oBrush,CurvePoints)
	SELF:oGraphics:DrawPolygon(oPen,CurvePoints)
	
	// Create a polygon to draw a triangle on the right hand side
	Point1          := Point{SELF:liRight - 10,13}
	Point2          := Point{SELF:liRight - 14,9}
	Point3          := Point{SELF:liRight - 14,17}
	CurvePoints[0]  := Point1
	CurvePoints[1]  := Point2
	CurvePoints[2]  := Point3
	SELF:oGraphics:FillPolygon(oBrush,CurvePoints)
	SELF:oGraphics:DrawPolygon(oPen,CurvePoints)
	
	RETURN      
				
/****************************************************************************/
METHOD Draw3DBox(x1 AS LONGINT,y1 AS LONGINT,x2 AS LONGINT,y2 AS LONGINT) AS VOID 

	//l Method to draw the 3d box
	//p Method to draw the 3d box
	//r VOID
	//a x1 as long  \line
	//a y1 as long  \line
	//a x2 as long  \line
	//a y2 as long  \line

	// Draw a raised 3d box
	SELF:oGraphics:DrawLine(SELF:oWhitePen,x1,y1,x2,y1)
	SELF:oGraphics:DrawLine(SELF:oGrayPen,x2,y2,x1,y2)	
	RETURN

/****************************************************************************/
METHOD DrawDays() AS VOID

	//l Method to draw the days on the calendar
	//p Method to draw the days on the calendar
	//r VOID
	//a None

	LOCAL cDatePart					AS STRING		// GCS 18/11/2005	
	LOCAL rect 						AS winRect
	LOCAL drawRect                  AS Rectangle
	LOCAL strucWinSize				AS SizeF
	LOCAL oStringFormat             AS StringFormat
	LOCAL drawFont                  AS Font
	LOCAL drawBrush                 AS Brush
	LOCAL fontHeader                AS Font
	LOCAL fontRegular               AS Font
	LOCAL brushRed                  AS Brush
	LOCAL brushBlack                AS Brush
	LOCAL i							AS LONGINT
	LOCAL dFirstCalendarDay			AS DATE
	LOCAL dFirst					AS DATETime
	LOCAL dLast						AS DATETime
	LOCAL dThis						AS DATETime		// GCS 18/11/2005
	LOCAL dTarget					AS DATETime
	LOCAL sShortName 				AS STRING
	LOCAL iDays						AS LONGINT
	LOCAL nCol						AS LONGINT
	LOCAL nRow						AS LONGINT
	LOCAL cText					    AS STRING
	LOCAL fontHeight				AS Real4
	LOCAL liMonthTextWidth			AS LONGINT
	LOCAL liMonthYearTextWidth		AS LONGINT
	LOCAL liMonthYearTextHeight	    AS LONGINT
	LOCAL liYearTextWidth			AS LONGINT
	LOCAL x							AS LONG
	LOCAL y							AS LONG
	LOCAL nHolidayPos				AS LONG
	LOCAL nLocalWidht 				AS LONGINT        
	LOCAL nLocalHeight 				AS LONGINT        
	LOCAL aParameters               AS Object[]
	
	try
		// set up the font and brush to draw with
	//	siHeight 	    := - SHORTINT( ( GetDeviceCaps( hDC, LOGPIXELSY ) * 10) / 72 )
	//  siHeight        := (short)((SELF:oGraphics:DpiY * 10) / 72) 
		fontHeight      := 10
		fontHeader      := Font{SystemFonts.DefaultFont:Name,fontHeight,FontStyle.Bold} // Font{"Arial",fontHeight,FontStyle.Bold}
		fontRegular     := SystemFonts.DefaultFont //Font{"Arial",fontHeight-2}
		drawFont        := fontHeader
		brushRed        := SolidBrush{Color.Red}
		brushBlack      := SolidBrush{Color.Black}
		
		// build out string format for drawing Text
		oStringFormat           := StringFormat{}
		oStringFormat:Alignment := StringAlignment.Center
		
		// get the start and stop dates for the month so the calendar looks correct
		dFirst 	    := FirstDayofMonth ( SELF:dCurrent )
		dLast 	    := LastDayofMonth(  SELF:dCurrent )
		
		// call out event handler for a monthyear move
		IF SELF:lMonthCallback
			aParameters     := Object[]{1}
			aParameters[0]  := dCurrent
			RunDynamicMethod(SELF:Owner,"onMonthYearMove",aParameters)
		ENDIF
		

		// Set the rect for the header
		Rect            := winRect{}
		rect:Left   	:= x1
		rect:Right  	:= x2
		rect:Top    	:= 0
		rect:Bottom 	:= SELF:liHead-2
		StrucWinSize    := Sizef{}

		// The string for the title (Month + Year) eg "October 1997"
		cText := dFirst:ToString("MMMM") + " " + dFirst:Year:ToString() 
		StrucWinSize    := SELF:oGraphics:MeasureString(cText,drawFont)

		// Store the width, so we can centre it
		liMonthYearTextWidth 	:=  (long)strucWinSize:Width
		liMonthYearTextHeight 	:=  (long)strucWinSize:Height

		// Get the centre for x and y
		x := ( ( rect:right - rect:left ) /2  ) -    (  liMonthYearTextWidth /2  )
		y := (( rect:bottom - rect:top) /2 ) - ( liMonthYearTextHeight /2 )

		// Set the text to be transparent
		drawBrush   := brushBlack
		drawRect    := Rectangle{x,y,liMonthyearTextWidth+x,liMonthYearTextHeight+y}
		SELF:oGraphics:Drawstring(cText,drawFont,drawBrush,drawRect)


		// Now just the month
		cText               := dFirst:ToString("MMMM") +" "
		StrucWinSize        := SELF:oGraphics:MeasureString(cText,drawFont)
		liMonthTextWidth 	:=  (long)strucWinSize:Width

		// Two rects, so we can know later where to place the months popup menu and the Year Sle.
		//  Values stored are different for each month year combination - depends on x and y and the width of the string	
		SELF:MonthRect:Left     := rect:Left + x
		SELF:MonthRect:Top		:= rect:top + y
		SELF:MonthRect:Right	:= MonthRect:Left + liMonthTextWidth
		SELF:MonthRect:Bottom	:= rect:Bottom
		
		// The year
		cText               := dFirst:Year:ToString()
		StrucWinSize        := SELF:oGraphics:MeasureString(cText,drawFont)
		liYearTextWidth 	:=  (long)strucWinSize:Width

		// The year rect
		SELF:YearRect:Left 		:= SELF:MonthRect:Right
		SELF:YearRect:Top 		:= SELF:MonthRect:Top
		SELF:YearRect:Right 	:= SELF:YearRect:Left + liYearTextWidth
		SELF:YearRect:Bottom 	:= SELF:MonthRect:Bottom


		// Now the days of the week - Sun and Sat are in red
		// Get a known Sunday
		drawFont        := fontRegular
		dFirstCalendarDay := CToDAnsi("1996/10/20") + ( SELF:dwFirstDayoftheWeek -1 )
		FOR i := 0 UPTO 6
			
			sShortName 	:= Left( CDoW( dFirstCalendarDay + i ), 3 )
			rect:Left 	:= SELF:liLeft + ( i * SELF:liWidth / 7 )
			rect:Top 	:= SELF:liTop + ( 0 * ( SELF:liHeight / 7 )) + 1
			rect:Right 	:= rect:Left + ( SELF:liWidth / 7 )
			rect:Bottom	:= rect:Top + SELF:liHeight / 7
			
			IF SELF:dwFirstDayoftheWeek = 1
				if i == 0 .or. i == 6
					drawBrush   := brushRed		
				else
					drawBrush   := brushBlack
				endif
			ELSE
				if i == 5 .or. i== 6
					drawBrush   := brushRed		
				else		        
					drawBrush   := brushBlack
				endif
			ENDIF
			
			drawRect    := Rectangle{Rect:Left,Rect:Top,Rect:Right - Rect:Left,Rect:Bottom - Rect:Top}
			SELF:oGraphics:Drawstring(sShortName,drawFont,drawBrush,drawRect,oStringFormat)
			
		NEXT		
		
		drawBrush       := brushBlack

		iDays 			:= (date)dLast - (date)dFirst + 1
		dTarget			:= dFirst	
		nRow 			:= 1
		nCol 			:= SELF:CastDate2Column( dFirst )	
		cDatePart		:= NTrim(Year((date)SELF:dCurrent)) + "/" + StrZero(Month((date)SELF:dCurrent),2) + "/"	
		nLocalWidht 	:= Integer(SELF:liWidth / 7)
		nLocalHeight 	:= Integer(SELF:liHeight /7)

		// Now the numbers
		FOR i := 1 UPTO iDays

			rect:left 	:= SELF:liLeft + ( nCol - 1) * ( nLocalWidht)
			rect:top 	:= SELF:liTop + ( nRow * ( nLocalHeight ) ) + 2
			rect:right	:= rect:left + nLocalWidht
			rect:Bottom	:= rect:Top +  nLocalHeight
			dThis 		:= CToDAnsi(cDatepart + StrZero(i,2))
			
			IF !Empty(SELF:oDateRange)
				IF dTarget < SELF:oDateRange:Min .OR. dTarget > SELF:oDateRange:Max
					// Date is not in the range so adjust the color
					nHolidayPos := SELF:isInHoliday(dThis)
					IF nHolidayPos >= 0
						drawBrush	:= SELF:CreateBrushFromHoliday(nHolidayPos)
						rect:Bottom -= 2
						rect:Left   += 3					
						// Fill the area
						drawRect   := Rectangle{rect:Left,Rect:Top,rect:Right- Rect:Left,Rect:Bottom - rect:top}
						SELF:oGraphics:FillRectangle(drawbrush,drawrect)
						rect:Bottom += 2
						rect:Left   -= 3	
						drawBrush   := brushRed
					ELSE		
						drawBrush   := brushBlack
					ENDIF
				ELSE
					nHolidayPos := SELF:isInHoliday(dThis)
					IF nHolidayPos >= 0
						drawBrush	:= SELF:CreateBrushFromHoliday(nHolidayPos)
						rect:Bottom -= 2
						rect:Left   += 3
						// Fill the area
						drawRect   := Rectangle{rect:Left,Rect:Top,rect:Right- Rect:Left,Rect:Bottom - rect:top}
						SELF:oGraphics:FillRectangle(drawbrush,drawrect)
						rect:Bottom += 2
						rect:Left   -= 3			
						drawBrush   := brushRed
					ELSE
						drawBrush   := brushBlack
					ENDIF
				ENDIF
			ELSE
				nHolidayPos := SELF:isInHoliday(dThis)
				IF nHolidayPos >= 0
					drawBrush	:= SELF:CreateBrushFromHoliday(nHolidayPos)
					rect:Bottom -= 2
					rect:Left += 3
					// Fill the area
					drawRect   := Rectangle{rect:Left,Rect:Top,rect:Right- Rect:Left,Rect:Bottom - rect:top}
					SELF:oGraphics:FillRectangle(drawbrush,drawrect)
					rect:Bottom += 2
					rect:Left -= 3			
					drawBrush := brushRed
				ELSE
					drawBrush := brushBlack
				ENDIF
			ENDIF		
			
			// draw the textto the graphics page
			cText       := Str( i, 2, 0)
			drawRect    := Rectangle{Rect:Left,Rect:Top,Rect:Right - Rect:Left,Rect:Bottom - Rect:Top}
			SELF:oGraphics:Drawstring(cText,drawFont,drawBrush,drawRect,oStringFormat)
			
			IF nCol = 7
				// Increment the row
				nCol := 1
				nRow += 1
			ELSE
				nCol += 1
			ENDIF
			// incremnt the target date
			dTarget:AddDays(1) // += 1
		NEXT
	catch ex as Exception
		MessageBox.Show(ex:Message)
	End Try

	RETURN

/****************************************************************************/
METHOD DrawOutLine() AS VOID 

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
		SELF:oGraphics:DrawLine(SELF:oWhitePen,SELF:liLeft,liTop,SELF:liRight,liTop)

		liTop += 1
		// And another in grey
		SELF:oGraphics:DrawLine(SELF:oGrayPen,SELF:liLeft,liTop,SELF:liRight,liTop)

	NEXT

	// for each column
	FOR i := 1 UPTO 6

		liLeft := SELF:liLeft + (i) * (liWidth / 7 )

		// and then in white
		SELF:oGraphics:DrawLine(SELF:oWhitePen,liLeft,SELF:liTop,liLeft,SELF:liBottom)

		liLeft += 1
		// Draw a line in grey
		SELF:oGraphics:DrawLine(SELF:oGrayPen,liLeft,SELF:liTop,liLeft,SELF:liBottom)

	NEXT							

	RETURN		
	
/****************************************************************************/
METHOD EditMonth() AS VOID 

	//l Method to select a new month from a drop down list
	//p Method to select a new month from a drop down list
	//r VOID
	//a None
	LOCAL oMenu 			AS ContextMenu
	LOCAL oMenuItem         AS MenuItem
	LOCAL strucWinPoint		as winPoint
	LOCAL i					AS LONGINT
	
	try
		oMenu := ContextMenu{}
		
		FOR i := 0 UPTO SELF:aMonthsByName:Length -1
			oMenuItem       := MenuItem{}
			oMenuItem:Text  := SELF:aMonthsbyName[i]
			oMenuItem:Click += System.EventHandler{ SELF , @MonthMenuClick() }
			// hook the event
			oMenu:MenuItems:Add(oMenuItem)
		NEXT

		// Use MonthRect to position the PopUpMenu
		strucWinPoint:x := SELF:MonthRect:Left
		strucWinPoint:y := SELF:MonthRect:Bottom
		
		// show the menu
		oMenu:show(SELF,Point{StrucWinPoint:x,StrucWinpoint:y})
				
	catch ex as Exception
		MessageBox.Show(ex:Message)
	End Try
	RETURN

/****************************************************************************/
#pragma warnings( 3009, off )
METHOD MonthMenuClick(o as Object, e as System.EventArgs) AS VOID 
	Local oMenuItem AS MenuItem
	Local dTarget   AS DateTime
	local nMonth    as Long
	Try
		oMenuItem   := (MenuItem)o
		nMonth      := oMenuItem:Index + 1
		// Set the month within the current year
		dTarget := DateTime{SELF:dCurrent:Year, nMonth,SELF:dCurrent:Day}
		IF dTarget == NULL_DATE
			// We have a day > last day of the month
			dTarget := DateTime{SELF:dCurrent:Year, nMonth,1}:AddDays(-1)
		ENDIF	
	
		IF !Empty(SELF:oDateRange) .and. ;
			(dTarget < SELF:oDateRange:Min .or. dTarget > SELF:oDateRange:Max)
			// dont need to do anything here
			BREAK S_OK
		ENDIF
	
		SELF:dCurrent:= dTarget
		SELF:iMonth  := dTarget:Month 		// wcm 09-23-98 Update the current month
	
		// Force a redraw of the window	
		SELF:Invalidate()
		SELF:Update()
    catch
        ///todo add catch
	End Try	    
	
	RETURN
#pragma warnings( 3009, on )
	

/****************************************************************************/
METHOD EditYear() AS VOID 
	//l Method to edit year
	//p Method to edit year
	//r VOID
	//a None
	LOCAL nSleWidth		AS LONGINT
	LOCAL nSleHeight	AS LONGINT	
	LOCAL y 			AS LONGINT
	LOCAL x				AS LONGINT

	nSleWidth 		:= SELF:YearRect:Right - SELF:YearRect:Left  + 10
	nSleHeight 		:= SELF:YearRect:Bottom - SELF:YearRect:Top
	x		 		:= SELF:YearRect:Left + 4
	y			 	:= SELF:YearRect:Top //SELF:Size:Height - SELF:YearRect:Top - nSleHeight		// Correct y for VO

	// Create the sle
	SELF:oYearSle					:= PECalendarSLE{SELF}
	SELF:oYearSLE:Location          := Point{ x, y }
	SELF:oYearSLE:Size              := Size{nSLEWidth,nSLEHeight}
	
	// set the range
	// Set the range before the position, otherwise it defaults to range either high or low
	IF !Empty(SELF:oDateRange)
		SELF:oYearSLE:Minimum	:= SELF:oDateRange:Min:Year
		SELF:oYearSLE:Maximum	:= SELF:DateRange:Max:Year
	ELSE
		SELF:oYearSLE:Minimum	:= 1752
		SELF:oYearSLE:Maximum	:= 2999
	ENDIF


	// Assign The Text
	SELF:oYearSle:Value 	:= SELF:dCurrent:Year
	SELF:Controls:Add(SELF:oYearSLE)
	SELF:oYearSle:Focus()
	RETURN

/****************************************************************************/
METHOD handleYearSLE() AS VOID 
	//l callback method to handle removing the YearSLE
	//p callback method to handle removing the YearSLE
	//d callback method to handle removing the YearSLE. This will \line
	//d move the control to the year specified by the yearSLE, \line
	//d then hid itself.
	//r VOID
	//a None	
	LOCAL YearsToMove		AS LONGINT
	
	IF ! ( SELF:oYearSle == Null_OBJECT )		
		// Force the calendar to update to the selected year
		// GDM 23/09/98 Intoduced new method MoveYears()
		YearsToMove := (long)SELF:oYearSle:Value - SELF:CurrentDate:Year
		SELF:MoveYears( YearsToMove )
		SELF:Controls:Remove(SELF:oYearSLE)
		SELF:oYearSle   := NULL_OBJECT  // clean up	
		self:Focus()                    // wcm 8/2/11 dotNet does not return focus automatically like VO did
	ENDIF	
	RETURN
	
/****************************************************************************/
METHOD HighlightDay() AS VOID 

	//l highlight a day
	//p highlight a day
	//r VOID
	//a None
	LOCAL nRow 				AS LONGINT
	LOCAL nCol 				AS LONGINT
	LOCAL brushActive	 	AS brush
	LOCAL oStringFormat     AS StringFormat
	LOCAL drawRect          AS Rectangle
	LOCAL drawFont          AS Font
	LOCAL dThis				AS DateTime
	LOCAL nHolidayPos	    AS LONG
	LOCAL rect 				AS winRECT
	LOCAL nLocalWidht 	    AS LONGINT
	LOCAL nLocalHeight 	    AS LONGINT
	LOCAL cText             AS STRING
	LOCAL aParameters       AS Object[]
 
	
	IF SELF:lDayCallback
		aParameters     := Object[]{1}
		aParameters[0]  := SELF:dCurrent
		RunDynamicMethod(SELF:Owner,"onDayMove",aParameters)
	ENDIF

	nCol			:= SELF:CurrentColumnNumber
	nRow			:= SELF:CurrentRowNumber
	dThis			:= SELF:dCurrent  
	nLocalWidht 	:= Integer(liWidth / 7)                         // Danilo //
	nLocalHeight	:= Integer(liHeight /7)                         // Danilo //
	drawFont        := SystemFonts.DefaultFont


	// set the rectangle like normal then deflate it
	rect        := winrect{}
	rect:Left   := SELF:liLeft + (( nCol - 1) * nLocalWidht) +2     // Danilo //
	rect:Top    := SELF:liTop + ( nRow * nLocalHeight ) +1          // Danilo //
	rect:Right  := rect:Left + nLocalWidht -1                       // Danilo //
	rect:Bottom := rect:Top + nLocalHeight
//	InflateRect( rect, -1, -2 )                                     // Danilo //
	
	// Create a grey brush in background color.
	brushActive        := SolidBrush{SystemColors.ActiveCaption}

	// build out string format for drawing Text
	oStringFormat           := StringFormat{}
	oStringFormat:Alignment := StringAlignment.Center

	// Fill the area
	drawRect   := Rectangle{rect:Left,Rect:Top,rect:Right- Rect:Left,Rect:Bottom - rect:top}
	SELF:oGraphics:FillRectangle(brushActive,drawrect)
	
	nHolidayPos := SELF:isInHoliday(dThis)
	IF nHolidayPos >= 0
		brushActive := SolidBrush{Color.FromArgb(255,0,0)}
	ELSE
		brushActive := SolidBrush{SystemColors.ActiveCaptionText}
	ENDIF

	// Set the rectangle
	rect:Left 	:= SELF:liLeft + (( nCol -1) * nLocalWidht )     // Danilo //
	rect:Top 	:= SELF:liTop + ( nRow * nLocalHeight ) +2      // Danilo //
	rect:Right 	:= rect:Left + nLocalWidht                      // Danilo //
	rect:Bottom := rect:Top + nLocalHeight                      // Danilo //


	// Draw the text
	drawRect   := Rectangle{rect:Left,Rect:Top,rect:Right- Rect:Left,Rect:Bottom - rect:top}
	cText       := Str( Day((date) SELF:dCurrent ),2,0)
	SELF:oGraphics:Drawstring(cText,drawFont,brushActive,drawRect,oStringFormat)

	RETURN

/****************************************************************************/
METHOD isMouseInCalendar(oMouseEvent AS MouseEventArgs,nRow REF LONGINT, nCol REF LONGINT) AS LOGIC 

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
    
	lResult := FALSE
	Try
		x 		:= oMouseEvent:x
		y 		:= oMouseEvent:y //SELF:Size:Height - oMouseEvent:y

		nRow 	:= LONGINT(( y - SELF:liHead ) / ( SELF:liHeight / 7 ) )
		nCol 	:= LONGINT( x / ( SELF:liWidth / 7 ) ) +1

		IF y > (SELF:liHead + SELF:liHeight/7	) .and. ( nRow > 0 .and. nCol > 0 )	// Account for the header and the row of days
			lResult := TRUE
		ENDIF
	Catch	
	END Try
	RETURN lResult

/****************************************************************************/
METHOD MoveMonths(n AS LONGINT) AS VOID 

	//l Method to move n number of moths
	//p Method to move n number of moths
	//r VOID
	//a n as int - number of months to move


	LOCAL dTarget 	AS DateTime
	LOCAL nMonth	AS LONGINT
	
	Try
		nMonth := SELF:dCurrent:Month
	
		// If we have gone back a year
		IF nMonth + n < 1
			TRY
				// Set the month to december, last year
				dTarget := DateTime{dCurrent:Year -1, 12, SELF:dCurrent:Day}
			Catch ex as System.ArgumentOutOfRangeException
				// We have a day > last day of the month
				dTarget := DateTime{SELF:dCurrent:Year-1,12,31}
			END TRY
		ELSEIF nMonth + n > 12
			TRY
				// Set the month to January, next year
				dTarget := DateTime{SELF:dCurrent:Year+1,1,SELF:dCurrent:Day}
			Catch ex as System.ArgumentOutOfRangeException
				// We have a day > last day of the month
				dTarget := DateTime{SELF:dCurrent:Year+1,1,31}
			END TRY
		ELSE
			TRY
				// Set the month within the current year
				dTarget := DateTime{SELF:dCurrent:Year,nMonth + n,SELF:dCurrent:Day}
			Catch ex as System.ArgumentOutOfRangeException
				// We have a day > last day of the month
				dTarget := DateTime{SELF:dCurrent:Year,nMonth + n + 1,1}:AddDays(-1)
			END TRY
		ENDIF	
	
		IF !Empty(SELF:oDateRange) .and. ;
			(dTarget < SELF:oDateRange:Min .or. dTarget > SELF:oDateRange:Max)
			// dont need to do anything here
			BREAK S_OK
		ENDIF
	
		SELF:dCurrent:= dTarget
		SELF:iMonth  := dTarget:Month 		// wcm 09-23-98 Update the current month
	
		// Force a redraw of the window	
		SELF:Invalidate()
		SELF:Update()
    catch
        ///todo add catch
	END Try
	RETURN

/****************************************************************************/
METHOD MoveFirstOfMonth() AS VOID 

	//l Method to move the First Day of the Month
	//p Method to move the First Day of the Month
	//r VOID
	LOCAL dTarget AS DateTime
	LOCAL hWnd    AS IntPtr
	TRY
	
		dTarget := FirstDayofMonth( SELF:dCurrent )

		IF !Empty(SELF:oDateRange) .and. ;
			(dTarget < SELF:oDateRange:Min .or. dTarget > SELF:oDateRange:Max)
			// move to the first day in the daterance
			dTarget := SELF:oDateRange:Min
		ENDIF

		// redraw the days
		hWnd    := self:handle
		SELF:oGraphics  := Graphics.FromHwnd(hWnd)
		SELF:UnHighlightDay()
		SELF:dCurrent   := dTarget
		SELF:HighlightDay()	        
		SELF:oGraphics:Dispose()			    

    catch
        ///todo add catch
	END TRY
	RETURN

/****************************************************************************/
METHOD MoveLastOfMonth() AS VOID 

	//l Method to move the Last Day of the Month
	//p Method to move the Last Day of the Month
	//r VOID
	LOCAL dTarget AS DateTime
	LOCAL hWnd    AS IntPtr
	
	TRY
		dTarget := LastDayofMonth( SELF:dCurrent )

		IF !Empty(SELF:oDateRange) .and. ;
			(dTarget < SELF:oDateRange:Min .or. dTarget > SELF:oDateRange:Max)
			// move to the last day of the range
			dTarget := SELF:oDateRange:Max
		ENDIF

		// redraw the days
		hWnd    := self:handle
		SELF:oGraphics  := Graphics.FromHwnd(hWnd)
		SELF:UnHighlightDay()
		SELF:dCurrent   := dTarget
		SELF:HighlightDay()	        
		SELF:oGraphics:Dispose()			    

    catch
        ///todo add catch
	END TRY
	RETURN
	
/****************************************************************************/
METHOD MoveDays( n AS LONGINT ) AS VOID 

	//p Method to move n number of days
	//r VOID
	//a n as int - Number of days to move
	LOCAL dTarget AS DateTime
	LOCAL hWnd    AS IntPtr
	
	TRY
		dTarget := (date)SELF:dCurrent + n

		IF !Empty(SELF:oDateRange) .and. ;
			(dTarget < SELF:oDateRange:Min .or. dTarget > SELF:oDateRange:Max)
			// dont need to do anything here
			BREAK S_OK
		ENDIF

	
	
		// If we have moved to a different month
		IF dTarget > LastDayofMonth( SELF:dCurrent ) .or. dTarget < FirstDayofMonth( SELF:dCurrent )
			// Set the new date
			SELF:dCurrent := dTarget
			
			// Force a redraw of the window	
			SELF:Invalidate()
			SELF:Update()

		ELSE

		// redraw the days
		hWnd    := self:handle
		SELF:oGraphics  := Graphics.FromHwnd(hWnd)
		SELF:UnHighlightDay()
		SELF:dCurrent   := dTarget
		SELF:HighlightDay()	        
		SELF:oGraphics:Dispose()			    
		
		ENDIF
    catch
        ///todo add catch
	END TRY
	RETURN

/****************************************************************************/
METHOD MoveYears(n AS LONGINT) AS VOID 

	//l Method to move n number of years
	//p Method to move n number of years
	//r VOID
	//a n as int - number of years to move
	LOCAL dTarget 		AS DateTime
	LOCAL lCurrent29Feb AS LOGIC
	LOCAL nYear			AS LONGINT
	LOCAL nMonth		AS LONGINT
	LOCAL nDay			AS LONGINT
	
	Try
		nYear 	:= SELF:dCurrent:Year //Year(SELF:dCurrent)
		nMonth 	:= SELF:dCurrent:Month //Month(SELF:dCurrent)
		nDay	:= SELF:dCurrent:Day //Day(SELF:dCurrent)
	
		if nMonth == 2 .and. nDay == 29
			lCurrent29Feb := TRUE
		ELSE
			lCurrent29Feb := FALSE 
		END IF
		
		// New year is a leap year
		IF IsLeapYear( nYear + n )
			
			// Doesn't matter what date we end up on
			dTarget := DateTime{nYear + n,SELF:dCurrent:Month, SELF:dCurrent:Day}
	
			// New year not a leap year
		ELSE
			// Were we on a leap year, hanging out on Feb 29
			dTarget := iif( lCurrent29Feb, 	;
							DateTime{nYear + n,SELF:dCurrent:Month, 28},  ;
							DateTime{nYear + n,SELF:dCurrent:Month,SELF:dCurrent:Day} )
	
		ENDIF

		IF !Empty(SELF:oDateRange) .and. ;
			(dTarget < SELF:oDateRange:Min .or. dTarget > SELF:oDateRange:Max)
			// dont need to do anything here
			BREAK S_OK
		ENDIF
	
		SELF:dCurrent := dTarget
		SELF:iYear    := dTarget:Year				// wcm 09-23-98   update the current year to make the spinner work correctly

		// force a resraw of our screen	
		SELF:Invalidate()
		SELF:Update()
    catch
        ///todo add catch
	END Try
	RETURN


/****************************************************************************/
METHOD UnHighlightDay() AS VOID 

	//l Unhighlight a highlighted day
	//p Unhighlight a highlighted day
	//r VOID
	//a None
	LOCAL nRow 			    AS LONGINT
	LOCAL nCol 			    AS LONGINT
	LOCAL brushBlack        AS brush
	LOCAL brushActive	 	AS brush
	LOCAL brushRed          AS Brush
	LOCAL oStringFormat     AS StringFormat
	LOCAL drawRect          AS Rectangle
	LOCAL drawFont          AS Font
	LOCAL dThis			    AS DateTime
	LOCAL nHolidayPos	    AS LONG
	LOCAL rect 			    AS winRECT
	LOCAL cText             AS String

	nCol 		:= SELF:CurrentColumnNumber
	nRow 		:= SELF:CurrentRowNumber
	dThis		:= SELF:dCurrent

	// create the font to use
	drawFont     := SystemFonts.DefaultFont //Font{"Arial",fontHeight-2}

	// Create a grey brush in background color.
	brushActive        := SolidBrush{SystemColors.ActiveCaption}
	brushBlack         := SolidBrush{Color.Black}
	brushRed           := SolidBrush{Color.Red}
	
	// build out string format for drawing Text
	oStringFormat           := StringFormat{}
	oStringFormat:Alignment := StringAlignment.Center



	// set the rectangle like normal then deflate it
	rect        := winRect{}
	rect:Left 	:= SELF:liLeft + ( nCol - 1) * ( liWidth / 7 ) + 1
	rect:Top 	:= SELF:liTop + ( nRow * ( liHeight /7 ) ) + 1
	rect:Right	:= rect:Left + ( liWidth / 7 ) -1
	rect:Bottom	:= rect:Top +  (liHeight / 7 ) -1

	// Create a grey brush in background color.
	nHolidayPos := SELF:isInHoliday(dThis)
	IF nHolidayPos >= 0
		brushActive := SELF:CreateBrushFromHoliday(nHolidayPos)
	ELSE
		brushActive := SolidBrush{SystemColors.ButtonFace}
	ENDIF

	// Fill the area
	drawRect   := Rectangle{rect:Left,Rect:Top,rect:Right- Rect:Left,Rect:Bottom - rect:top}
	SELF:oGraphics:FillRectangle(brushActive,drawrect)

	// Set the rectangle
	rect:Left 	:= SELF:liLeft + (( nCol -1) * ( SELF:liWidth / 7 ) )
	rect:Top 	:= SELF:liTop + ( nRow * ( SELF:liHeight /7 ) ) + 2
	rect:Right	:= rect:Left + ( SELF:liWidth / 7 )
	rect:Bottom	:= rect:Top +  (SELF:liHeight / 7 )

	// Draw the text
	IF nHolidayPos >= 0
		brushActive := brushRed
	ELSE
		brushActive := brushBlack
	ENDIF
	drawRect    := Rectangle{rect:Left,Rect:Top,rect:Right- Rect:Left,Rect:Bottom - rect:top}
	cText       := Str( Day((date)SELF:dCurrent ),2,0)
	SELF:oGraphics:Drawstring(cText,drawFont,brushActive,drawRect,oStringFormat)
	
	// redraw grid lines
	SELF:DrawOutLine()


	RETURN
	
/****************************************************************************/
METHOD isInHoliday(dThis AS DateTime) AS LONG

	//l Method to check to see if a date is in the holiday range
	//p Method to check to see if a date is in the holiday range
	//r LONG	\tab 0 means date not in array. \line
	//r \tab any other positive number is the element that contains the date.
	//a dThis	- Date	- Date to check the holiday array for.
	LOCAL nResult	AS LONG
	LOCAL i         AS LONG
	local nALen     as LONG
	local oDays     AS Days
	
	nALen   := self:ListHolidays:Count - 1
	nResult := -1
	IF nALen >= 0
		for i   := 0 upto nALen
			oDays   := (days)SELF:ListHolidays[i]
			IF dThis == oDays:DayToHighlight
				nResult := i
				exit
			ENDIF
		Next
	ENDIF

	RETURN nResult
#ENDREGION
#REGION "   Access / Assigns   "
/****************************************************************************/
ACCESS CurrentColumnNumber AS LONGINT 

	//l Access to return the current column number
	//p Access to return the current column number
	//r LONG
	//a None
	RETURN SELF:CastDate2Column( SELF:dCurrent )

/****************************************************************************/
ACCESS CurrentRowNumber AS LONGINT 

	//l Retrieve the current row from the control
	//p Retrieve the current row from the control
	//r LONG
	LOCAL dFirst 		AS DateTime
	dFirst 	:= FirstDayofMonth( SELF:dCurrent )
	RETURN Integer( (SELF:dCurrent:Day + SELF:CastDate2Column( dFirst ) - 2 ) / 7 ) + 1

/****************************************************************************/
ASSIGN InitDate( dDate AS DateTime ) AS VOID
	//l Set the Initial Date
	//p Set the Initial Date
	//r VOID
	//a dDate \tab DATE \tab Current Date
	SELF:dCurrent   := dDate
	SELF:iYear      := dDate:Year
	SELF:iMonth     := dDate:Month
	SELF:Invalidate()
	SELF:Update()
	RETURN
	
/****************************************************************************/
ACCESS CurrentDate() AS DateTime
	//l Retrieve the current Date from the control
	//p Retrieve the current Date from the control
	//r DATE
	RETURN SELF:dCurrent

/****************************************************************************/
ASSIGN CurrentDate( dDate AS DateTime ) AS VOID
	//l Set the current Date
	//p Set the current Date
	//r VOID
	//a dDate \tab DATE \tab Current Date
	
	LOCAL hwnd  AS IntPtr

	IF ! ( dDate == SELF:dCurrent )
		// These four conditions warrant an InvalidateRect - a complete redraw.
		IF dDate > LastDayofMonth( dDate ) .or. dDate < FirstDayofMonth( dDate ) .or.  ! ( dDate:Year == SELF:iYear ) .or. ! ( dDate:Month == SELF:iMonth )
			// If we are changing months, set the new date
			SELF:dCurrent   := dDate
			SELF:iYear      := dDate:Year //Year( (date)dDate )
			SELF:iMonth     := dDate:Month //Month( (date)dDate )
			SELF:Invalidate()
			SELF:Update()
		ELSE
			hWnd    := self:handle
			SELF:oGraphics  := Graphics.FromHwnd(hWnd)
			SELF:UnHighlightDay()
			SELF:dCurrent   := dDate
			SELF:HighlightDay()	        
			SELF:oGraphics:Dispose()			    		
		ENDIF
	ENDIF

	RETURN

/****************************************************************************/
ACCESS DateRange() AS wmDateRange 

	//l Gets the DateRange for a calendar.
	//p Gets the DateRange for a calendar.
	//r OBJECT of type wmDateRange
	//a NONE \line
	RETURN SELF:oDateRange

/****************************************************************************/
ASSIGN DateRange(oRange AS wmDateRange) AS VOID 

	//l Sets the DateRange for a calendar.
	//p Sets the DateRange for a calendar.
	//r OBJECT of type wmDateRange
	//a oRange \tab - wmDateRange object. \line
	SELF:oDateRange	:= oRange
	IF (SELF:CurrentDate < SELF:oDateRange:Min .or. SELF:CurrentDate > SELF:oDateRange:Max)
		SELF:CurrentDate := SELF:oDateRange:Max
	ENDIF
	RETURN

/****************************************************************************/

ASSIGN Holiday(ListDates AS arrayList) AS VOID 

	//l Holiday array.
	//p Holiday array.
	//d This assign will set the array containing days to be highlighted. \line
	//r Void \line
	//a aHoliday[i,1] \tab Date To be Highlighted. \line
	//a aHoliday[i,2] \tab Text description for mouseover. \line
	//a aHoliday[i,3] \tab String containing highlight color in rgb format. \line
	SELF:ListHolidays	:= ListDates
	RETURN

/****************************************************************************/
ASSIGN FirstDayoftheweek(nDayofWeek AS DWORD) AS VOID 
	//l Set the First Day of the Week
	//p Set the First Day of the Week
	//r DWORD
	//a nDayofWeek \tab DWORD \tab Calendar begins on:\line
	//a \tab \tab \tab \tab \tab 1 = Monday \line
	//a \tab \tab \tab \tab \tab 2 = Sunday \line
	LOCAL DIM firstDay[2]	 AS BYTE

	SELF:dwfirstdayoftheweek	:= nDayofWeek
	IF SELF:dwFirstDayoftheWeek == 99
		// only do this if it hasnt been set by the SLE
		GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_IFIRSTDAYOFWEEK, @firstDay, 2)
		IF firstDay[0] = 48	// Monday 1st Day of Week
			SELF:dwFirstDayoftheWeek := 2			// 1.. Sunday   2.. Monday   etc
		ELSEIF firstDay[0] = 54	// Sunday 1st Day of Week
			SELF:dwFirstDayoftheWeek := 1			// 1.. Sunday   2.. Monday   etc
		ENDIF	
	ENDIF
	RETURN

/****************************************************************************/
ACCESS FirstDayOfWeek() AS DWORD 

	//l Retrieve the First Day of the Week
	//p Retrieve the First Day of the Week
	//r DWORD
	//r \tab Calendar begins on:\line
	//r \tab \tab \tab 1 = Monday \line
	//r \tab \tab \tab 2 = Sunday \line
	RETURN SELF:dwfirstdayoftheweek
	
#ENDREGION	
END CLASS

/****************************************************************************/
CLASS PECalendarSLE INHERIT NumericUpDown
//l Calendar Class SLE
//p Calendar Class SLE
//d PECalendarSLE is designed to process the enterkey \line
//d in the same mannor as the tab key.
//j CL:rightSLE,CL:dateSLE
//g Edit Controls
Protect oOwner as Calendar

#REGION "   Constructors   "
/****************************************************************************/
CONSTRUCTOR()
	SUPER()
	RETURN 

/****************************************************************************/
CONSTRUCTOR(Owner as Calendar)
	SUPER()
	SELF:oOwner := Owner
	RETURN 
#ENDREGION    
#REGION "   Callback methods   "    
/****************************************************************************/
Protected METHOD OnKeyPress(e As System.Windows.Forms.KeyPressEventArgs) as void
	local cChar as char
	cChar := e:KeyChar
	if cChar == Keys.Enter
		SELF:oOwner:HandleYearSLE()
		//Self:oOwner:Focus() 
		e:Handled := TRUE
	endif
	IF e:Handled <> TRUE
	   // always call the super if we dont handle the keypress
	   SUPER:onKeyPress(e)
	ENDIF
	RETURN     
		
/****************************************************************************/
Protected METHOD ProcessTabKey(forward As logic) as logic
	SELF:oOwner:HandleYearSLE()
	RETURN forward
#ENDREGION    
END CLASS

CLASS Days
	Export DayToHighlight   AS DateTime
	Export ToolTipText      AS String
	Export Color            AS Color
#Region "   Constructors  "

/****************************************************************************/
Constructor(cDate as String, cToolTip as String)
	SELF:DayToHighlight := Convert.ToDateTime(cDate) //ctod(cDate)
	SELF:ToolTipText    := cToolTip
	SELF:Color          := Color.FromArgb(160,160,160)
	RETURN

/****************************************************************************/
Constructor(cDate as String, cToolTip as String, cColorString as String)
	local aColors as ArrayList
	SELF:DayToHighlight := Convert.ToDateTime(cDate) //ctod(cDate)
	SELF:ToolTipText    := cToolTip
	aColors             := self:CreateColorArray(cColorString)
	SELF:Color          := Color.FromArgb(Val(aColors[0]:ToString()),Val(aColors[1]:toString()),Val(aColors[2]:toString()))
	RETURN

/****************************************************************************/
Constructor(dDate as DateTime, cToolTip as String)
	SELF:DayToHighlight := dDate
	SELF:ToolTipText    := cToolTip
	SELF:Color          := Color.FromArgb(160,160,160)
	RETURN
	
/****************************************************************************/
Constructor(dDate as DateTime, cToolTip as String, cColorString as String)
	local aColors as ArrayList
	SELF:DayToHighlight := dDate
	SELF:ToolTipText    := cToolTip
	aColors             := self:CreateColorArray(cColorString)
	SELF:Color          := Color.FromArgb(Val(aColors[0]:ToString()),Val(aColors[1]:toString()),Val(aColors[2]:toString()))
	RETURN

/****************************************************************************/
Constructor(dDate as DateTime, cToolTip as String,oColor as Color)
	SELF:DayToHighlight := dDate
	SELF:ToolTipText    := cToolTip
	SELF:Color          := oColor
	RETURN
#ENDREGION
#Region "   Methods   "
/****************************************************************************/
METHOD CreateColorArray(cList AS STRING) AS ArrayList

	//l Method to take a RGB colol list as a string and turn it into a single demension array
	//p Method to take a RGB colol list as a string and turn it into a single demension array
	//r ARRAY
	//a cList \tab - STRING \tab - String containing 3 colors (ie "160,160,160")
	LOCAL nPos	AS Long
	LOCAL cTemp	AS STRING
	LOCAL c		AS STRING
	LOCAL aRet	AS ARRAYList

	aRet  := ArrayList{}
	cTemp := cList

	IF cTemp:Length == 0
		aRet:Add("160")
		aRet:Add("160")
		aRet:Add("160")
		RETURN aRet
	ENDIF

	nPos  := cTemp:IndexOf(",")
	DO WHILE nPos > -1
		c     := cTemp:Substring(0,nPos)  // SubStr3(cTemp, 1, nPos-1)
		cTemp := cTemp:Substring(nPos+1)    //SubStr2(cTemp, nPos+1)
		aRet:Add(c:Trim())
		nPos := cTemp:IndexOf(",")          //At2(",", cTemp)
	ENDDO

	IF cTemp:Length > 0
		aRet:Add(cTemp:Trim())
	ENDIF

	RETURN aRet		
#ENDREGION    
END CLASS
