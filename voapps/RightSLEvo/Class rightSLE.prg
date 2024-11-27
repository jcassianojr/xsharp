#region DEFINES
DEFINE FSEL_END     := 3
//DEFINE FSEL_HOME    := 2
DEFINE FSEL_RALL     := 0
//DEFINE FSEL_TRIM    := 1
DEFINE FSEL_TRIMEND := 4
DEFINE LOCALE_SYSTEM_DEFAULT := 2048
DEFINE LOCALE_USER_DEFAULT	:= 1024
#endregion

CLASS rightSLE INHERIT SingleLineEdit
// Author		: Willie Moore
// Email		: williem@bigfoot.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 7 May 1998
// --------------
//l Multi-function numeric, date or file single-line edit
//p Multi-function numeric, date or file single-line edit
//d Multi-function numeric, date or file single-line edit \line
//d Place a SLE on your window and have it inherit from RightSLE.
//d You must give this SLE a fieldspec. If has a numeric
//d fieldspec, it will call the numeric right entry. If it has a date
//d fieldspec, it will call Graham McKenie's PEDateSLE dispatch for a pop up
//d calendar. If you want a context menu and graphical pushbutton
//d to indicate a calendar, inherit from dateSLE instead of rightSLE. \line \line
//d {\b NOTE} - IF you DO not use a fieldspec or it IS fieldspec
//d that is not in the custom, it will simply pass it on up to VO's own handler. \par
//d There is a exported iVar (symMethod) that can be used to override the default dialogs
//d that appear for the calendar and calculator. To override you must
//d create a method of class rightSLE to hold your own dialog and then
//d set the symMethod in your datawindows's postinit. \par
//d If you need to change the init of rightSLE, add a method postinit() class rightSLE to your
//d app and make your changes there. This is useful if you want to change the
//d focus selection to default to FSEL_RALL.
//e Initialize this SLE in the owning window's PostInit() as follows:
//e PostInit(oWindow,iCtlID,oServer,uExtra) CLASS MyDialog
//e 	SELF:oDCsledMyDate:symMethod := str2symbol("myCustomDateDialog")
//j CL:fileSLE,CL:PECalendar,CL:dateSLE
//g Edit Controls
//t Creation 	: %CreateDate% %CreateTime%\line
//t LastBuild 	: %BuildDate% %BuildTime%\line
//t Author 		: Willie Moore
	PROTECT oPB 						AS OBJECT
	PROTECT lTurnNegative				AS LOGIC
	PROTECT lAllSelected				AS LOGIC
	PROTECT lObeyFocusRuleAlways		AS LOGIC
	PROTECT lTurnOffEnter				AS LOGIC
	PROTECT lturnOffArrows				AS LOGIC
	PROTECT lAllowcutandPaste			AS LOGIC
	PROTECT lAllowNumericFocus			AS LOGIC
	PROTECT cTemplateChar				AS STRING
	PROTECT lTruePicture				AS LOGIC     	// If TRUE then $ sign overwrite.. use available fieldspec length else do not overwrite	
	PROTECT lDoubleAsToday				AS LOGIC		// if a date button is present, put today instead of showing the calendar
	PROTECT nLastPosition				AS LONGINT			// last cursor position in SLE - set in processnum
	PROTECT lUseResourcesforIcons		AS LOGIC		// if true, use resource statements for the icons, else use the bmp from the disk
	PROTECT symImageType   				AS SYMBOL  		// Either #ICON or #BITMAP
	PROTECT lUseOldButtons				AS LOGIC		// Which button logic to use
	PROTECT cCurSymbol					AS STRING		// currency symbol for the $ template value in a picture
	PROTECT nCurrencyPos				AS LONGINT			// Position of of the currency symbol 0,2 = left --- 1,3 = right
	PROTECT oDateRange					AS wmDateRange	// this object will hold a daterange that rightSLe or dateSLE can use to limit user input
	PROTECT nOwneralignment				AS LONGINT			// save the owner alingment for PB settigns
	PROTECT lTurnNumericPictureNumeric	AS LOGIC		// Controls if rightSLE takes a picture cause without a field spec and makes
														// it numeric if it has all "9" for the picture
	PROTECT aCalendarHoliday			AS ARRAY		// array of calendar holiday's
	EXPORT lAlignCalendarLeft 			AS LOGIC		// Used to make calendar align either left or right on the sle
	EXPORT FirstDayoftheWeek			AS DWORD		// for the dataSLE
	EXPORT nDirection					AS LONGINT			// to control the direction of the enterkey
	EXPORT symMethod					AS SYMBOL		// symbol to hold the calendar method to invoke on a double click
	EXPORT symCalcMethod				AS SYMBOL		// symbol to hold the default calculator method
	EXPORT lSendFromButton				AS LOGIC		// is the buttondoubleclick comming from a button
	EXPORT lRememberPosition			AS LOGIC		// remember the last position of the cursor in a SLE
	EXPORT symCalcClass					AS SYMBOL		// symbol for the class to instanciate for the popup calculator
	EXPORT symCalandarClass				AS SYMBOL		// symbol for the class to instanciate for the calandar dialog




	// access and assigns
	

METHOD AssignImage(xImage AS STRING) AS VOID PASCAL 
	//l AssignImage processing method for a SLE Buytton.
	//p AssignImage processing method for a SLE Buytton.
	//d This method handles the task of assigning the imgage to a SLe Pushbutton. \line
	//r VOID
	//a xImage \tab String \tab Name of the bitmap or icon to load

 	LOCAL oPoint 			AS Point
	LOCAL oDim 				AS Dimension
	LOCAL cBaseName		AS STRING            
	LOCAL nOldAlignment	AS LONG

	//Copy the position and size of the current SLE
    oPoint := Point{ SELF:Origin:X , SELF:Origin:Y }
    oDim   := Dimension{ SELF:size:width , SELF:size:height}
    	
//	oPoint	:= PClone(SELF:origin)
//	oDim		:= PClone(SELF:size)
	
	// *****************************************************************************
	// * if we are using owner alignments, we must save the currenyt alignment and *
	// * then get id of it before we create the button or you will not be able     *
	// * to move the button once it is created                                     *
	// *****************************************************************************
   nOldAlignment			:= SELF:nOwneralignment           
	IF nOldAlignment <> OA_NO
    	SELF:Owneralignment	:= OA_NO
	ENDIF

	IF SELF:lUseOldButtons
		// this is the VO 2.6 way. No XP support and limited support for redrawing under the VO
		// 2.7 autoresize methods. added for backwards compatibility
		cBaseName	:= Left(xImage,Len(xImage) - 2)
		oPoint:y 	-= 1  							// Put the button one pixel up from SLE position
		oPoint:x 	:= oPoint:x + oDim:width - 28 	// put the button at the end of the SLE
		oDim:width 	:= 28 							// have a default size of 33
		oDim:height += 1
		
		SELF:oPB := SLEButtonOld{SELF:Owner,-1,oPoint,oDim,SELF}
		SELF:oPB:hBitmapUp		:= LoadBitmap(_GetInst(),String2Psz(cBaseName + "UP"))
		SELF:oPB:hBitmapDown	:= LoadBitmap(_GetInst(),String2Psz(cBaseName + "DN"))	
		//Reduce the length of the SLE to accommodate the button
		SetWindowPos(SELF:handle(),0L,0,0,SELF:size:width-28,SELF:size:height,SWP_NOMOVE+0x14)
	ELSE
		// VO 2.7 way with an inherited VO button class

		oPoint:y 	-= 1  						// Put the button one pixel up from SLE position
		oPoint:x 	:= oPoint:x + oDim:width 	// put the button at the end of the SLE
		oDim:width 	:= 33 						// have a default size of 33
		oDim:height += 1
		
		SELF:oPB := SLEButton{SELF:Owner,-1,oPoint,oDim,SELF}

		IF SELF:lUseResourcesforIcons
			SELF:oPB:UseResource := TRUE
		ENDIF

		IF SELF:symImageType = #BITMAP
			SELF:oPB:AssignBitmap(xImage)
		ELSE
			SELF:oPB:AssignIcon(xImage)
		ENDIF

		//Reset the width for the button based on image width
		oDim:width := SELF:oPB:Image:Size:Width + 8

		//Adjust the placement of the button
		oPoint:x := oPoint:x - oDim:width
		SELF:oPB:Origin := oPoint

		//Reset button width based on image width
		SELF:oPB:Size := oDim

		//Reduce the length of the SLE to accommodate the button
		SetWindowPos(SELF:handle(),0L,0,0,SELF:size:width-oDim:Width,SELF:size:height,SWP_NOMOVE+0x14)
	ENDIF

    // *******************************************************************
    // * wcm 2008-03-27                                                  *
	//  * now that the button has beenc reated, we must apply the         *
	//  * owner alignment. This call works on the control plus the button *
	//  *******************************************************************
    IF nOldAlignment <> OA_NO
    	SELF:Owneralignment  := nOldAlignment	
    ENDIF

	SELF:showpb()
	RETURN

METHOD CalKeyDown( oEvent ) AS VOID PASCAL 
	//l keydown processing method for a calendar.
	//p keydown processing method for a calendar.
	//d This method handles the + and - keys and will adjust the SLE \line
	//d accordingly.
	//r VOID
	//a Event Message

	LOCAL dExistingDate	 AS DATE
	LOCAL uOldValue 	AS USUAL

	IF oEvent:wParam == VK_ADD
		IF  !( CToD( SELF:TextValue ) == NULL_DATE )
			dExistingDate 				:= CToD( SELF:TextValue )
			uOldValue   				:= SELF:uValue  // Save uValue unchanged. Let VO deal with it.
			SELF:TextValue 			:= DToC( dExistingDate + 1)
		 	SELF:Modified 				:= TRUE       	// This must be uncommented.
		 	SELF:uValue 				:= uOldValue    // Restore uValue in its original form.
			SELF:EventReturnValue 	:= 1
		ENDIF			
    ENDIF

	IF oEvent:wParam == VK_SUBTRACT
		IF !( CToD( SELF:TextValue) == NULL_DATE )
			dExistingDate := CToD( SELF:TextValue )
			uOldValue   				:= SELF:uValue  // Save uValue unchanged. Let VO deal with it.
			SELF:TextValue := DToC( dExistingDate - 1)
		 	SELF:Modified 				:= TRUE       	// This must be uncommented.
		 	SELF:uValue 				:= uOldValue    // Restore uValue in its original form.
			SELF:EventReturnValue := 1
		ENDIF			
	ENDIF        
	
   // JL*** John Lewis Modification
   IF oEvent:wParam == 84  .OR. oEvent:wParam == 116 // T or t
		uOldValue   				:= SELF:uValue  // Save uValue unchanged. Let VO deal with it.
   	SELF:TextValue 			:=  DToC(Today())
	 	SELF:Modified 				:= TRUE       	// This must be uncommented.
	 	SELF:uValue 				:= uOldValue    // Restore uValue in its original form.
      SELF:EventReturnValue 	:= 1
	ENDIF


	RETURN

METHOD CreateFormattedString(cPicture, cType, cDefTempl) 
	//l CreateFormattedString method.
	//p CreateFormattedString method.
	//d The CreateFormattedString method subsitutes my rightSLEFormattedString class
	//d for the one included with VO. This is a workaround for the
	//d issue with @R (999) 999-999 type template strings
	//r SELF
	//a cPicture	- picture 	\line
	//a cType		- Field type N-numeric, C-String, D-Date \line
	//a cDefTempl	- Default Template, NIL will set it to the picture
	SELF:oEditString := rightSLEFormattedString{SELF, cPicture, cType, wOverWrite, cDefTempl, wScrMode}
	RETURN SELF

ACCESS CurrencyPosition() AS LONGINT PASCAL 
	//l Access method to Get the CurrencyPosition.
	//p Access method to Get the CurrencyPosition.
	//d CurrencyPositon represents the position of the currency symbol in the picture template. \line
	//d Values: \line
	//d 0 \tab - Left with no space between the marker and the rest of the picture. \line
	//d 1 \tab - Right with no space between the marker and the rest of the picture. \line
	//d 2 \tab - Left with one space between the marker and the rest of the picture. \line
	//d 3 \tab - right with one space between the marker and the rest of the picture. \line
	//r long
	//a None

	RETURN SELF:nCurrencyPos


METHOD CurrencySymbol() AS STRING PASCAL 
	//l Method to get the current currencysymbol.
	//p Method to get the current currencysymbol.
	//d currencySymbol will return the local user's currency symbol \line
	//r string
	//a None
	LOCAL pBuffer 		AS PSZ
	LOCAL nBuffSize 	AS DWORD
	LOCAL nResult 		AS DWORD

	nBuffSize := 128
	pBuffer := StringAlloc(Replicate(" ", nBuffSize))

	// get the currency symbol
	nResult := DWORD(GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SCURRENCY, pBuffer, LONGINT(nBuffSize)))
	IF nResult > 0
		SELF:cCurSymbol := Left(Psz2String(pBuffer), nResult)
		SELF:cTemplateChar += SELF:cCurSymbol
	ENDIF
	
	// now get the position
	nResult := DWORD(GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_ICURRENCY , pBuffer, LONGINT(nBuffSize)))
	IF nResult >= 0
		SELF:nCurrencyPos := Val(Left(Psz2String(pBuffer), nResult) )
	ENDIF

	MemFree(pBuffer)

	RETURN SELF:cCurSymbol

ACCESS DateRange() AS wmDateRange PASCAL 
	//l Gets the DateRange for a calendar.
	//p Gets the DateRange for a calendar.
	//r OBJECT of type wmDateRange
	//a NONE \line
	RETURN SELF:oDateRange

ASSIGN DateRange(oRange AS wmDateRange) AS VOID PASCAL 
	//l Sets the DateRange for a calendar.
	//p Sets the DateRange for a calendar.
	//r VOID
	//a oRange \tab - wmDateRange object. \line
	SELF:oDateRange	:= oRange
	RETURN

METHOD Destroy() 
	//l VO callback method.
	//p VO callback method.
	//d This method gets called before VO's destroy. We want \line
	//d distroy the button if they exist. This will help to clean up\line
	//d memory and free resources.
	//r super:disable()
	//a None

	IF SELF:oPB != NULL_OBJECT
		SELF:oPB:Destroy()
	ENDIF
	RETURN SUPER:Destroy()
	

METHOD disable() 
	//l stub method to process a button if it exists.
	//p stub method to process a button if it exists.
	//d disable is designed to handle the button classes \line
	//d if they exist. This method will automatically disable \line
	//d both the button and the SLE.
	//r super:disable()
	//a None

	SELF:READONLY	:= TRUE
	IF oPB <> NULL_OBJECT
		oPB:disable()
	ENDIF
	RETURN SUPER:disable()

METHOD Dispatch ( oEvent ) 
	//l dispatch logic for rightSLE.
	//p dispatch logic for rightSLE.
	//r LONG
	//a Event Message


	LOCAL nRet		AS LONGINT
	LOCAL lShiftOn	AS LOGIC
	LOCAL lCtrlOn  	AS LOGIC
	LOCAL lAltOn	AS LOGIC
	LOCAL lExtSel  	AS LOGIC
	LOCAL lAllDone	AS LOGIC
	LOCAL lDAToday AS LOGIC // mz
	LOCAL cChar		AS STRING	
	LOCAL cText		AS STRING
	LOCAL nStop 	AS DWORD
	LOCAL uMsg   := oEvent:umsg   AS DWORD
	LOCAL wParam := oEvent:wParam AS DWORD



	/*
		Only the messages, that rightSle wants to know about.
	 	All the rest go through to SingleLineEdit's dispatch and every other class's dispatch that is involved from there - There are lots of them!!!!

    */
    lallDone	:= FALSE
	IF uMsg == WM_KEYDOWN  .or. uMsg == WM_KEYUP  .or. uMsg == WM_CHAR
	   lShiftOn := LOGIC(_CAST, _And(GetKeyState(VK_SHIFT), SHORTINT(_CAST, 0x8000)))
	   lCtrlOn  := LOGIC(_CAST, _And(GetKeyState(VK_CONTROL), SHORTINT(_CAST, 0x8000)))
       lAltOn 	:= LOGIC(_CAST, _And(GetKeyState(VK_MENU), SHORTINT(_CAST, 0x8000)))
	   lExtSel  := lShiftOn  .and. (uMsg == WM_KEYDOWN  .or. uMsg == WM_KEYUP)  .and. ;
			      (wParam == VK_LEFT  .or. wParam == VK_RIGHT  .or. wParam == VK_END  .or. wParam == VK_HOME)
	ENDIF
  	cChar := Upper(Chr(wParam))

	// cut and paste stuff goes here
    IF SELF:lAllowcutandPaste	
    	/*
    	IF ( (uMsg <> WM_KEYDOWN)  .and. (uMsg <> WM_KEYUP)  .and. (uMsg <> WM_CHAR) ) ;
    		 .or. ;
    	(InList(cChar,"X","C","V","Z")  .AND. ;
			 lCtrlOn  .and. !lAlton  .and. !SELF:ReadOnly  .and. ;
			 uMsg == WM_KEYDOWN)
	    	DO CASE
	    	 	CASE uMsg == WM_CUT  .or. cChar == "X"
					IF !Empty(SELF:Picture)  .and. SELF:oEditString:Type == "N"		
					    SELF:oEditString:Cut()
					    nStop						:= SELF:Selection:Finish
				    	cText						:= SELF:TextValue
			    	 	SELF:TextValue				:= SELF:SetField(cText,1)
	   	 			 	SELF:Modified 				:= TRUE       	// This must be uncommented.
						SELF:EventReturnValue		:= 1
						SELF:selection				:= selection{nStop,nStop}
					ELSE
		                SELF:cut()
		            ENDIF
			        RETURN 1L
	    	 	CASE uMsg == WM_COPY  .or. cChar == "C"
	    	 		// we let the menu message flow up to the parent class
	    	 		IF cChar == "C"
				    	SELF:Copy()
				    	RETURN 1L
				    ENDIF
	    	 	CASE uMsg == WM_PASTE  .or. cChar == "V"
			    	IF  !Empty(SELF:Picture)  .and. ;
						(SELF:oEditString:Type == 'C'  .or. ;
						SELF:oEditString:Type == 'D')
						SELF:paste()
					ELSEIF !Empty(SELF:Picture)  .and. ;
						SELF:oEditString:Type == 'N'
				    	SELF:rslePaste()
					ELSE
						SELF:paste()
					ENDIF
					RETURN 1L
				CASE uMsg == WM_UNDO  .or. cChar == "Z"
			 	    SELF:Undo()
			 	    RETURN 1L
	    	ENDCASE
	    ENDIF
		*/

		IF InList(cChar,"X","C","V","Z")  .AND. ;
			 lCtrlOn  .and. !lAlton  .and. !SELF:ReadOnly  .and. ;
			 uMsg == WM_KEYDOWN
		    IF cChar = "X"
				IF !Empty(SELF:Picture)  .and. SELF:oEditString:Type == "N"		
				    SELF:oEditString:Cut()
				    nStop						:= SELF:Selection:Finish
			    	cText						:= SELF:TextValue
		    	 	SELF:TextValue				:= SELF:SetField(cText,1)
   	 			 	SELF:Modified 				:= TRUE       	// This must be uncommented.
					SELF:EventReturnValue		:= 1
					SELF:selection				:= selection{nStop,nStop}
				ELSE
	                SELF:cut()
	            ENDIF
		    ELSEIF cChar = "C"
		    	SELF:Copy()
		    ELSEIF cChar = "V"
		    	IF  !Empty(SELF:Picture)  .and. ;
					(SELF:oEditString:Type == 'C'  .or. ;
					SELF:oEditString:Type == 'D')
					SELF:paste()
				ELSEIF !Empty(SELF:Picture)  .and. ;
					SELF:oEditString:Type == 'N'
			    	SELF:rslePaste()
				ELSE
					SELF:paste()
				ENDIF
		    ELSEIF cChar = "Z"
		 	    SELF:Undo()
		    ENDIF
		   RETURN 1L
		 ENDIF
		
    ENDIF

    DO CASE
    	CASE SELF:ReadOnly
    		// we do not want to do anything here
			// Process keys as required

		CASE uMsg == WM_GETDLGCODE // WM_KEYUP
				IF wParam == VK_RETURN
					IF lCtrlOn  .and. IsMethod(SELF,SELF:symMethod)
						PostMessage(SELF:handle(),WM_LBUTTONDBLCLK,0,0L)						
						RETURN 1L
					ELSEIF !SELF:lTurnOffEnter
						// give the people the chance to subclass
						// rightSLe and change the behavior of the enter key
						nRet := SELF:ProcessEnter()
						RETURN nRet
					ENDIF
				ENDIF
			
		CASE uMsg == WM_KEYDOWN  .and. ;
			(wParam = VK_UP  .or. wParam = VK_DOWN)
			IF !SELF:lturnOffArrows
				nRet := SELF:ProcessArrow(wParam)
				RETURN nRet
			ENDIF
		
    	CASE !Empty(SELF:Picture)  .and. SELF:oEditString:Type == 'D'
    		DO CASE

				CASE uMsg == WM_LBUTTONDBLCLK
					IF IsMethod(SELF,SELF:symMethod)
						Send(SELF,SELF:symMethod)
						RETURN 1L
					ENDIF	

	    		// Support for VK_ADD and VK_SUBTRACT like in Quicken
				CASE uMsg == WM_KEYDOWN  .And. ( wParam == VK_ADD  .Or. wParam == VK_SUBTRACT )
	
		  			// Grab the event, the KeyDown and send it over to PEDateSle's KeyDown
					SELF:CalKeyDown( oEvent)	
	         	RETURN 1L         

            // JL*** John Lewis Modification
            CASE  uMsg == WM_CHAR  .and. (wParam == 84  .or. wParam == 116) // T or t
	            // Grab the event, the KeyDown and send it over to PEDateSle's KeyDown
					SELF:CalKeyDown( oEvent)      
               RETURN 1L
		         	
	
				// Stop the beeping
				CASE uMsg == WM_CHAR  .And. ( Chr( wParam )  == "+"  .Or. CHR( wParam ) == "-" )
	
					// Beep if you have too, but don't process either of these keys
					IF CToD( SELF:TextValue ) == NULL_DATE
						MessageBeep( 0xFFFFFFFF )	
					ENDIF	
			
					/*
						By returning 1L we prevent oEditString:ProcessKeyEvent() being called in the dispatch of SingleLineEdit..
						ProcessKeyEvent() of  __FormattedString calls ProcessChar() which in turn calls MatchesTemplChar() which will fail because of the + or - .
						When it fails it calls InvalidAction() of __FormattedString which is the MesssageBeep which was driving me up the wall.
						Comment out the above lines to see ( hear ) what I was complaining about.
			         */
	
					RETURN 1L	
				CASE uMsg == WM_COMMAND
					IF wParam == IDM_PEDateSleContextMenu_File_Calendar_ID
						// Pop up the calendar
						IF IsMethod(SELF,SELF:symMethod)
					    	// MZ
    						lDAToday 			:= SELF:lDoubleAsToday // Save, MZ Show Calendar from contextmenu
					    	SELF:lDoubleAsToday := FALSE
					    	Send(SELF,SELF:symMethod)
					    	SELF:lDoubleAsToday := lDAToday // restore
							RETURN 1L
						ENDIF
					ELSEIF wParam == IDM_PEDateSleContextMenu_File_Today_ID
						// Just stuff today's date back into PEDateSle
						SELF:Value := Today()
						RETURN 1L	
					ENDIF		
			END CASE	
		CASE !Empty(SELF:Picture)  .and. ;
		    (SELF:oEditString:Type == 'N'  .or. ;
		    (SELF:oEditString:Type == 'C'  .and. ;
		    Instr("99:99", SELF:Picture)))
		
			DO CASE	
/*
				//	Uncomment this if you want
				//  the mouse click to automatically
				//	highlight the SLE everytime
				//  you enter it
				CASE oEvent:Message == WM_LBUTTONDOWN
					SELF:SetFocus()
					SELF:selection		:= selection{0,-1}
					SELF:lAllSelected	:= TRUE
					RETURN 1L
*/

				CASE uMsg == WM_LBUTTONDBLCLK
					SELF:SetFocus()
					SELF:selection		:= selection{0,-1}
					SELF:lAllSelected	:= TRUE
					RETURN 1L	
				CASE uMsg == WM_KEYDOWN
					DO CASE
						CASE wparam == VK_BACK  .or. wparam == VK_END  .or. ;
							wparam == VK_HOME  .or. wparam == VK_LEFT  .or. ;
							wparam == VK_RIGHT  .or. wParam == VK_DELETE
							IF SELF:lAllowcutandPaste
								IF !(InList(cChar,"X","C","V","Z")  .AND. lCtrlOn)
									IF !(lShiftOn  .and. (wParam == VK_RIGHT   .or. wParam == VK_LEFT))
										SELF:processNum( oEvent)
										IF wparam == VK_BACK  .or. wParam == VK_DELETE 	// movement keys OTHER than backspace need TO finish processing
											lAlldone := TRUE
										ENDIF
									ENDIF
								ENDIF
							ELSE
								SELF:processNum( oEvent)
								IF wparam == VK_BACK  .or. wParam == VK_DELETE 	// movement keys OTHER than backspace need TO finish processing
									lAllDone := TRUE
								ENDIF
							ENDIF
							IF lAllDone
								RETURN 1L
							ENDIF
					ENDCASE
				CASE uMsg == WM_CHAR
					IF SELF:lAllowcutandPaste
						IF (InList(oEvent:wparam,3,22,24,26)  .and. lCtrlOn)  .or. ;
						   (InList(cChar,"X","C","V","Z")  .AND. lCtrlOn)
						   // kill the wmchar message for the cut/copy/paste messages
						   RETURN 1L
						ELSE
				  			// Grab the event, the KeyDown and send it over to rightSle's KeyDown
							SELF:processNum( oEvent)
							lAllDone	:= TRUE
				  		ENDIF
				  	ELSE
			  			// Grab the event, the KeyDown and send it over to rightSle's KeyDown
						SELF:processNum( oEvent)
						lAllDone := TRUE
				  	ENDIF
					IF lAllDone
						RETURN 1L
					ENDIF
				OTHERWISE
					// other code could go in here if you want to
					// trap additional messages
				ENDCASE
		CASE uMsg == WM_RBUTTONDOWN
			// added to set focus befor context menu show up
			SetFocus(SELF:Handle())			
		OTHERWISE
			// we have a character or template, lets check it
			DO CASE				
				CASE uMsg == WM_CHAR
					IF SELF:lAllowcutandPaste
						IF (InList(oEvent:wparam,3,22,24,26)  .and. lCtrlOn)  .or. ;
						   (InList(cChar,"X","C","V","Z")  .AND. lCtrlOn)
						   // kill the wmchar message for the cut/copy/paste messages
						   RETURN 1L
						ENDIF
					ENDIF
					/*   uncomment for VO 2.6
					IF SELF:Selection:Start = 0  .and. SELF:oEditString <> NULL_OBJECT
						SELF:oEditString:TestFirstChar(CHR( oEvent:wParam))
					ENDIF
					*/
			OTHERWISE
				// other code could go in here if you want to
				// trap additional messages
			ENDCASE
	END CASE
		
		// Let all the other messages, go back to VO's Sle Wndproc
			
	RETURN SUPER:Dispatch( oEvent )

ASSIGN DoubleAsToday(lVal AS LOGIC) AS VOID PASCAL 
	//l Assign method for the lDoubleAsToday.
	//p Assign method for the lDoubleAsToday.
	//d DoubleAsToday will let you override the calendar on an  \line
	//d for a single SLE.
	//r VOID
	//a lVal - New setting for lDoubleAsToday.
	IF !Empty(lVal)
		SELF:lDoubleAsToday := lVal
	ENDIF
	RETURN

METHOD enable() 
	//l stub method to process a button if it exists.
	//p stub method to process a button if it exists.
	//d enable is designed to handle the button classes \line
	//d if they exist. This method will automatically re-enable \line
	//d both the button and the SLE.
	//r super:enable()
	//a None

	SELF:READONLY	:= FALSE
	IF oPB <> NULL_OBJECT
		oPB:enable()
	ENDIF
	RETURN SUPER:enable()

ASSIGN FieldSpec(oNewFS) 
	IF !Empty(oFieldSpec)  .OR. !Empty(SELF:oEditString)    // wcm 2006-07-24 added a check so i wont reset the textvalue if it is the first set of a fieldspec
		SELF:TextValue	:= ""		// corrects a GUI class bug
	ENDIF
	SELF:Picture	:= ""		// also clears oEditString
	SUPER:FieldSpec	:= oNewFS
	RETURN oNewFS

METHOD FocusChange(oFocusChangeEvent) 
	//l focusChange method.
	//p focusChange method.
	//d The focusChange method gets fired whenever a control gains focus. \par
	//d What I handle differently than VO is that I use the SDK code
	//d but added the ability to remember the last position a user was typing.
	//d I also added the numericfocus rule where upon entering a numeric SLE, the cursor is automatically
	//d positioned to the left of the decimal.
	//r uRet	- Result of super class processing
	//a focusChange event


	LOCAL iPos		AS LONGINT     // modified focuschange from the SDK
	LOCAL uRet		AS USUAL

	uRet	:= SUPER:FocusChange(oFocusChangeEvent)	

	IF oFocusChangeEvent:GotFocus
		IF wFocusSel = FSEL_RALL   // wcm 4/10/2001
			// we have to reset allselected to true to make sure rightSLE behaves properly
			SELF:lAllSelected := TRUE
		ENDIF
	
		IF Empty(SELF:value)  .OR. SELF:lObeyFocusRuleAlways  .OR. SELF:lRememberPosition		// wcm 2/25/2003
			IF SELF:lRememberPosition  .AND. SELF:nLastPosition >= 0  .AND. !SELF:lObeyFocusRuleAlways
				PostMessage(SELF:Handle(),EM_SETSEL,DWORD(SELF:nLastPosition),SELF:nLastPosition)	 // Set position back to last selection
			ELSEIF wFocusSel == FSEL_HOME
				iPos := 0
				IF oEditString != NULL_OBJECT
					IF oEditString:Type == "N"  .AND. SELF:lAllowNumericFocus	// wcm 7/19/2002
						iPos 	:= LONG(At2(Chr(SetDecimalSep()),SELF:CurrentText))
						IF iPos > 0
							// set the cursor before the decimal Sep
							iPos--
						ELSE
							// set it at the end of the sle
							iPos := LONG(SLen(SELF:CurrentText))
						ENDIF
					ENDIF
				ENDIF
				PostMessage(SELF:Handle(), EM_SETSEL, DWORD(iPos), iPos)
			ELSEIF wFocusSel = FSEL_END
				iPos := oEditString:PrevEditPos(LONG(SLen(SELF:CurrentText)))
				PostMessage(SELF:Handle(), EM_SETSEL, DWORD(iPos), iPos)
			ELSEIF wFocusSel = FSEL_TRIM
				iPos := LONG(SLen(RTrim(SELF:CurrentText)))
				PostMessage(SELF:Handle(), EM_SETSEL, 0, iPos)
			ELSEIF wFocusSel = FSEL_RALL     		         // Change by SG 26/09/00
				PostMessage(SELF:handle(),EM_SETSEL,0,-1)	 // This selects all the current test
				SELF:lAllSelected := TRUE
			ENDIF
		ENDIF
	ELSE
		SELF:nLastPosition	:= SELF:Selection:Start
	ENDIF
						
	RETURN uRet

METHOD Hide() 
	//l stub method to process a button if it exists.
	//p stub method to process a button if it exists.
	//r super:hide()
	//a None

	IF SELF:oPB <> NULL_OBJECT
		oPB:hide()
	ENDIF
	RETURN SUPER:hide()

ACCESS Holiday() AS ARRAY PASCAL 
	//l Holiday array.
	//p Holiday array.
	//d This access wil return the array containing days to be highlighted. \line
	//r Array \line
	//r aHoliday[i,1] \tab Date To be Highlighted. \line
	//r aHoliday[i,2] \tab Text description for mouseover. \line
	//r aHoliday[i,3] \tab String containing highlight color in rgb format. \line
	//a None
	RETURN SELF:aCalendarHoliday

ASSIGN Holiday(aDates AS ARRAY) AS VOID PASCAL 
	//l Holiday array.
	//p Holiday array.
	//d This assign will set the array containing days to be highlighted. \line
	//r Void \line
	//a aHoliday[i,1] \tab Date To be Highlighted. \line
	//a aHoliday[i,2] \tab Text description for mouseover. \line
	//a aHoliday[i,3] \tab String containing highlight color in rgb format. \line
	SELF:aCalendarHoliday := aDates
	RETURN

CONSTRUCTOR(oOwner, nId, oPoint, oDim, kStyle, lDataAware ) 
	//l init for class rightSLE
	//p init for class rightSLE
	//d This is the init for class rightSLE
	//r SELF
	//a oOwner \tab This controls owner \line
	//a nID \tab \line
	//a oPoint \tab Point object \line
	//a odim \tab\tab Demension Object \line
	//a kStyle \tab Windows style contants \line
	//a lDataAware \tab Logic for control being data aware


	SELF:lAllSelected						:= FALSE    		// start of with nothing selected
	SELF:lAlignCalendarLeft				:= TRUE				// Default to left align
	SELF:lTurnNegative					:= FALSE				// start off with positive numbers
	SELF:oPB									:= NULL_OBJECT		// default our pushbutton holder
	SELF:nDirection						:= 1					// go to the next field on an enter
																		// set to 0 to disable enter key movements!
	SELF:lUseResourcesforIcons			:= TRUE				// set to false if you are using custom bitmaps
  	SELF:symImageType   					:= #BITMAP 			// Use ICONS instead of Bitmaps
  	SELF:lUseOldButtons					:= FALSE				// use new button logic
  	SELF:cCurSymbol						:= NULL_STRING		// start off NULL, the $ picture will trigger
	
	SUPER( oOwner, nID, oPoint, oDim, kStyle, lDataAware )
	SELF:wFocusSel 						:= FSEL_HOME		// I want the home position to be the default
																		// comment this out for VO's default
	SELF:symMethod							:= #showCalendar
   SELF:symCalcMethod 					:= #showcalc

	SELF:lTruePicture						:= TRUE 				// If TRUE Num_08_02 $9999.99 would allow 12345.67 else $1234.56										
	SELF:lObeyFocusRuleAlways 			:= FALSE
	SELF:lTurnOffEnter					:= FALSE				// by default we want to allow the enter
																		// change this globablly by using rightSLE's postinit
	SELF:lturnOffArrows					:= TRUE				// arrowkey processing is turned off by default
	SELF:lallowcutandPaste				:= TRUE				// by default allow cut and paste											
	SELF:lDoubleAsToday					:= FALSE				// keep the old rightSLE default of always showing the calendar by default
	SELF:lSendFromButton					:= FALSE				// we start off from the SLE, not the button
 	SELF:cTemplateChar 					:= Chr(SetThousandSep()) + "()$ "
 	SELF:FirstDayoftheWeek				:= 99					// junk value to show that it is un-initialized
 	SELF:lAllowNumericFocus				:= FALSE				// keep rightSLE the way it used to be by default
 	SELF:lRememberPosition				:= FALSE				// start off in compatiblilty mode
 	SELF:nLastPosition					:= -1					// make sure that we init the lastpos to -1 to show that we are uninitalized
 	SELF:oDateRange						:= NULL_OBJECT		// start off the calendar without restrictions
 	SELF:nOwneralignment					:= OA_NO				// start off with no owner alingment
 	SELF:lTurnNumericPictureNumeric	:= FALSE				// backwards compatibility
 	SELF:symCalandarClass				:= #dlgPECalendar	// class for calandar dialog
 	SELF:symCalcClass						:= #PopupCalc		// class for popup calculator
 	IF IsMethod(SELF,#postinit)
		Send(SELF,#postinit)
	ENDIF
RETURN SELF

METHOD InvalidAction() AS VOID PASCAL 
	//l Sends a beep on an invalid key.
	//p Sends a beep on an invalid key.
	//d You can override invalidaction in a subclass to \line
	//d provide custom messages on an invalid key
	//r VOID
	//a None

    MessageBeep(0xFFFFFFFF)	
    RETURN

ASSIGN ObeyFocus(lVal AS LOGIC) AS VOID PASCAL 
	//l Assign method for lObeyFocusruleAlways.
	//p Assign method for lObeyFocusruleAlways.
	//d ObeyFocus will let you override the focus rules set up in postinit \line
	//d for a single SLE.
	//r LOGIC
	//a lVal - New setting for lObeyFocusRuleAlways.
	IF !Empty(lVal)
		SELF:lObeyFocusRuleAlways := lVal
	ENDIF
	RETURN

ASSIGN Origin(oNewOrigin) 
	LOCAL nXDiff	AS LONGINT
	LOCAL nYDiff 	AS LONGINT
	LOCAL nOA_Save	AS LONGINT
	LOCAL oPBOrigin AS Point

	// *****************************
	// * Reset the owner alignment *
	// *****************************
	nOA_Save	:= SELF:nOwneralignment
	IF nOA_Save <> OA_NO
		SELF:Owneralignment	:= OA_NO
	ENDIF

	IF SELF:oPB <> NULL_OBJECT
		nXDiff := SUPER:Origin:X - oNewOrigin:X
		nYDiff := SUPER:Origin:Y - oNewOrigin:Y
		oPBOrigin := SELF:oPB:Origin
		oPBOrigin:X -= nXDiff
		oPBOrigin:Y -= nYDiff
		SELF:oPB:Origin := oPBOrigin
	ENDIF
	
	SUPER:origin := oNewOrigin                                        
	
	// ***************************************************************
	// * now that we have the orign set, reapply the owner alignment *
	// ***************************************************************
	IF nOA_Save <> OA_NO
		SELF:Owneralignment	:= nOA_Save
	ENDIF

	RETURN NIL



ASSIGN OwnerAlignment(iNewVal) 
	IF !IsInstanceOf(oFormSurface, #Window)  .or. !IsInstanceOf(oParent, #Window)
		SELF:nOwneralignment	:= OA_NO
		RETURN OA_NO
	ELSEIF IsInstanceOf(oFormSurface, #Window)
		oFormSurface:__AddAlign(SELF, iNewVal)
		IF SELF:oPB <> NULL_OBJECT
			oFormSurface:__AddAlign(SELF:oPB,iNewVal)
		ENDIF
	ELSE
		oParent:__AddAlign(SELF, iNewVal)
		IF SELF:oPB <> NULL_OBJECT
			oParent:__AddAlign(SELF:oPB,iNewVal)
		ENDIF
	ENDIF

	SELF:nOwneralignment := iNewVal		// wcm 2005-07-12 - save the current owner alignment

	RETURN NIL

ACCESS pb() AS OBJECT PASCAL 
	//l Access method to return the attached pushbutton.
	//p Access method to return the attached pushbutton.
	//d PPB will return the attached pushbutton. \line
	//r OBJECT
	//a None

	RETURN SELF:oPB



ASSIGN Picture(cNewPicture) 

	// null out the editstring so the new picture will be built correctly
	IF !Empty(oFieldSpec)  .or. !Empty(SELF:oEditString)
		SUPER:Picture		:= ""
//		SELF:oEditString	:= NULL_OBJECT
	ENDIF

	// reset the fieldspec's picture if it exists
	IF IsInstanceOf(oFieldSpec, #FieldSpec)  .and. !Empty(oFieldSpec)
		oFieldspec:picture	:= cNewPicture
	ENDIF

	// set the new picture
	SUPER:Picture := cNewPicture
	


	IF Instr("9",cNewPicture)  .or. Instr(".",cNewPicture)  .and. Upper(Left(cNewPicture,2)) <> "@R"
		IF SELF:lTurnNumericPictureNumeric
			oEditString:Type := "N"
		ENDIF
	ENDIF

	RETURN NIL

METHOD ProcessArrow(nMessage AS DWORD) AS LONGINT PASCAL 
	//l ArrowKey Logic.
	//p ArrowKey Logic.
	//d This method can be overridden to provide custom \line
	//d arrowkey processing.
	//r LONG \line
	//r 1L \tab Processing is complete \line
	//r 0L \tab Continue processing
	//a None

	LOCAL hCtl	AS PTR
	LOCAL nRet	AS LONGINT
	nRet := 1
	DO CASE
	   CASE nMessage == VK_DOWN
   			// Set focus to next control on window
	      	hCTL := GetNextDlgTabItem(GetParent(SELF:handle()),SELF:handle(),FALSE)
	      	SetFocus(hCtl)
		CASE nMessage == VK_UP
			hCTL := GetNextDlgTabItem(GetParent(SELF:handle()),SELF:handle(),TRUE)
	      	SetFocus(hCtl)
		OTHERWISE
			nRet	:= 0
	END CASE
	RETURN nRet	

ASSIGN ProcessArrowKeys(lVal AS LOGIC) AS VOID PASCAL 
	//l Assign method for the lturnOffEnter.
	//p Assign method for the lturnOffEnter.
	//d ProcessEnterKey will let you oeverride the enterkey processing rule \line
	//d for a single SLE.
	//r VOID
	//a lVal - New setting for lTurnOffEnter.
	IF !Empty(lVal)
		SELF:lturnOffArrows := !lVal
	ENDIF
	RETURN

METHOD processEnter() AS LONGINT PASCAL 
	//l EnterKey Logic.
	//p EnterKey Logic.
	//d This method can be overridden to provide custom \line
	//d enterkey processing.
	//r LONG \line
	//r 1L \tab Processing is complete \line
	//r 0L \tab Continue processing
	//a None

		LOCAL hCtl	AS PTR
		LOCAL nRet	AS LONGINT
		nRet := 1
		DO CASE
		   CASE SELF:nDirection = 1
    			// Set focus to next control on window
		      	hCTL := GetNextDlgTabItem(GetParent(SELF:handle()),SELF:handle(),FALSE)
		      	SetFocus(hCtl)
			CASE SELF:nDirection = 2
				hCTL := GetNextDlgTabItem(GetParent(SELF:handle()),SELF:handle(),TRUE)
		      	SetFocus(hCtl)
			OTHERWISE
				nRet	:= 0
		END CASE
		RETURN nRet

ASSIGN ProcessEnterKey(lVal AS LOGIC) AS VOID PASCAL 
	//l Assign method for the lturnOffEnter.
	//p Assign method for the lturnOffEnter.
	//d ProcessEnterKey will let you oeverride the enterkey processing rule \line
	//d for a single SLE.
	//r LOGIC
	//a lVal - New setting for lTurnOffEnter.
	IF !Empty(lVal)
		SELF:lTurnOffEnter := !lVal
	ENDIF
	RETURN

METHOD ProcessNum( oEvent AS OBJECT ) AS VOID PASCAL 
	//l Numeric processing method.
	//p Numeric processing method.
	//d ProcessNum is the main numeric processing method.
	//d for a single SLE.
	//r VOID
	//a oEvent - windows Event from the dispatch method.
	LOCAL lApplyKey		AS LOGIC
	LOCAL lIgnore		AS LOGIC
	LOCAL lPoint		AS LOGIC
	LOCAL lStripSpace	AS LOGIC
	LOCAL nDecimals		AS DWORD
	LOCAL nStart		AS DWORD
	LOCAL nStop			AS DWORD
	LOCAL nPos			AS DWORD
	LOCAL nDecimalPos	AS DWORD
	LOCAL nOffset		AS DWORD
	LOCAL nSLELength	AS DWORD
	LOCAL nSLEOrigLen	AS DWORD
	LOCAL uMsg			AS DWORD
	LOCAL wParam		AS DWORD
	LOCAL cLeftDecimal	AS STRING
	LOCAL crightDecimal	AS STRING
	LOCAL cDecimal		AS STRING
	LOCAL cOrgValue		AS STRING
	LOCAL cThousands	AS STRING
	LOCAL cText			AS STRING
	LOCAL cTemp			AS STRING
	LOCAL cChar			AS STRING
	LOCAL cPicture		AS STRING
	LOCAL uOldValue 	AS USUAL
	
	BEGIN SEQUENCE		
		uMsg   		:= oEvent:umsg
		wParam 		:= oEvent:wParam
		cChar		:= Chr(wparam)
		nStart		:= SELF:Selection:Start
		nStop		:= SELF:Selection:Finish
		lApplyKey	:= TRUE
		cText		:= SELF:textValue
		cOrgValue	:= SELF:textValue
		nPos		:= nStart
		cDecimal	:= Chr(SetDecimalSep())
		cThousands	:= Chr(SetThousandSep())	// wcm 7/24/2001
		lPoint		:= FALSE					// we are in the left side by default
		lIgnore		:= FALSE					// by default we want to process everything
		nOffset		:= 0						// this is an offset to adjust the position if we left strip spaces
		lStripSpace	:= FALSE					// we never assume that we will strip spaces
		nSLELength	:= SELF:Length				// we want to pict up the length of the SLE so we can adjust for the $ template character.
		nSLEOrigLen	:= SELF:Length
		cPicture	:= SELF:Picture
		
		// set the number of decimals. This is easy if there is a fieldspec. We have to work a bit harder
		// if there is only a picture
		IF !Empty(SELF:FieldSpec)
			nDecimals	:= SELF:fieldSpec:decimals
		ELSE
			IF At2(".",cPicture) == 0
				nDecimals := 0
			ELSE				
				nDecimals := Len(Right(cPicture,SLen(cPicture) - RAt(".",cPicture)))
			ENDIF
		ENDIF
		// check to see if allselected is set on when it shouldn't be
		IF SELF:lAllSelected  .AND. !(nStart = 0  .AND. nStop = Len(cText))
			SELF:lAllSelected := FALSE
		ENDIF
		
		IF nDecimals > 0							// see what side of the decimal we are on and process accordingly
			IF At2('.',cPicture) = 0  .AND. ;		// wcm 7/25/00 decimal seperator is always '.' in a fieldspec's picture
				!Empty(cPicture) 					// wcm 2/16/00
				// we have a SLE with decimals with a picture that does not
				nDecimals	:= 0
			ELSE
				IF At2(cDecimal,cText) < nStart+1
					lPoint := TRUE		// we have moved to the decimal part. set it up
				ELSE
					IF At2(cDecimal,cText) = (nStart + 1)  .AND. nStop > (nStart + 1)
						lPoint	:= TRUE
						nStart += 1	// we have started on the decimal point. cant have that
					ELSE
						lPoint := FALSE
					ENDIF
				ENDIF
			ENDIF
		ENDIF
	
		// **************************************************************
		// * here we check to see if the keyboard is in overwrite mode  *
		// * if it is, we check the overwrite settings of the SLE class *
		// * and respond accordingly.                                   *
		// **************************************************************
	    IF IsOverWriteModeEnabled()  .AND. ;
			(wOverWrite = OVERWRITE_ALWAYS  .OR. wOverWrite = OVERWRITE_ONKEY) ;
	    	 .AND. (nStart = nStop)
	    	IF wparam == VK_END  .OR. wparam == VK_HOME  .OR. ;
				wparam == VK_LEFT  .OR. wparam == VK_RIGHT  .OR. ;
				wparam == VK_RETURN  .OR. wparam == VK_TAB  .OR. ;
				wParam == VK_BACK  .OR. wParam == VK_DELETE
				// we dont want to do anything here. leave the movement keys alone!!
			ELSE
				// now we check to see if the nStop is over a template char
				nOffset := 1
				IF SubStr3(cText,nStart + nOffset,1) == cThousands
					nOffset += 1
				ENDIF
		    	IF nStart + nOffset <= Len(cText)
			    	nStop += nOffset
			    ENDIF
				nOffset := 0	// this is used latter on so we reset it
			ENDIF
	    ENDIF
	
	
		IF nStart <> nStop  .AND. !SELF:lAllSelected 					// we have a group action
			IF nStart = 0  .AND. nStop = Len(cText)
				SELF:lallselected := TRUE
				lPoint := FALSE
			ELSEIF !(wparam == VK_END  .OR. wparam == VK_HOME  .OR. ;		// wcm 11/23/2002	changed so group movement keys
			wparam == VK_LEFT  .OR. wparam == VK_RIGHT  .OR. ;			//					no longer delete the selection
			wparam == VK_RETURN  .OR. wparam == VK_TAB)		
			
				nDecimalPos := At2(cDecimal,cText)
				IF nDecimalPos > 0  .AND. nDecimalPos <= nStop
					cLeftDecimal  := SubStr3(cText,1,At2(cDecimal,cText)- 1)
					cRightDecimal := SubStr2(cText,At2(cDecimal,cText) + 1)
					cText := Stuff(cLeftDecimal,nStart+1,nStop-nStart,"")
					cText += cDecimal
					IF nStop > nDecimalPos
						IF nStart >= nDecimalPos   //  whole selection is in decimal part
	                       cText += Stuff(cRightDecimal,nStart - nDecimalPos + 1,nStop - nStart,"")
						ELSE   // the selection starts in the integer part and ends in the decimal part of the number)
		                   cText += Stuff(cRightDecimal,1, nStop - nDecimalPos,"")	
				        ENDIF
					ELSE
						cText += cRightDecimal
					ENDIF
					cText := SELF:SetField(cText,1)
					IF !lPoint
						nPos	:= At2(cDecimal,cText) -1  // compensate for the decimal we just removed
						nStart	:= nPos
						nStop	:= nPos
					ELSE
						IF wParam == VK_DELETE  .OR. wParam == VK_BACK
							nPos 	:= nStart
						ELSE
							nPos	:= nStart + 1
						ENDIF
					ENDIF
				ELSEIF nDecimalPos > 0  .AND. nStop = nDecimalPos  .AND. (nStop - nStart) = 1
					nPos 	:= nStop - 1
				ELSE
					cText 	:= Stuff(cText,nStart+1,nStop-nStart,"")
					nPos	:= nStop
				ENDIF
			ENDIF
			
			IF wparam == VK_DELETE  .OR. wparam == VK_BACK
				nStart	+= 1
				lIgnore := TRUE
			ELSEIF oEvent:message == WM_CHAR
				lIgnore := TRUE
			ELSE
				lIgnore := FALSE
			ENDIF
		ENDIF
	
		IF !Empty(SELF:cCurSymbol)
		   	IF Instr(SELF:cCurSymbol,cText)				// wcm 8/2/2001 remove the $ template char if it exists
				cText := Stuff(cText,At(SELF:cCurSymbol,cText),At(SELF:cCurSymbol,cText)," ")
				IF !SELF:lTruePicture	
					nSLELength -= 1				// wcm 8/7/2001 reduce the SLe length by 1 to adjust for the $ template character.
				ENDIF
			ENDIF
		ENDIF
	
		// turn off the selection if there is a movement key
		// 7/6/98 wcm Added the VK_TAB to keep a user who is tabbing through
		//            from erasing the sle's contents
		// 10/3/200 wcm added VK_RETURN to the list to fix the return
		//              key erasing the fields value
		// 11/24.02 wcm changed the logic to properly move the selection if only a part
		//				of the field is selected and an arrow key is used
		IF (wparam == VK_END  .OR. wparam == VK_HOME  .OR. ;
			wparam == VK_LEFT  .OR. wparam == VK_RIGHT  .OR. ;
			wparam == VK_RETURN  .OR. wparam == VK_TAB)  .AND. ;
			(SELF:lAllSelected  .OR. (nStart <> nStop))		// movement keys turn off group actions
			cText				:= SELF:textValue
			SELF:lAllselected 	:= FALSE
			IF wparam == VK_LEFT
				IF uMsg == WM_KEYDOWN
					IF nStart==nStop
						SELF:Selection := Selection{ nStart, nStart }
					ELSE
						SELF:Selection := Selection{ nStart+1, nStart+1 }
						// this clears the selection and places the cursor at the beginning of the selection, the move will be done after next press of the left arrow key
					ENDIF
				ENDIF
			ENDIF
			IF wparam == VK_RIGHT
				IF uMsg == WM_KEYDOWN
					IF nStart==nStop
						SELF:Selection := Selection{ nStop, nStop }
					ELSE
						SELF:Selection := Selection{ nStop-1, nStop-1 }
						// this only clears the selection, the move will be done after next press of the right arrow key
					ENDIF
				ENDIF
			ENDIF			
			BREAK
		ENDIF
				
		// Set the left and right decimal strings
		IF nDecimals > 0
	        IF At2(cDecimal,cTEXT) == 0  .OR. Len(cText) == 0
	   			cLeftDecimal  	:= "0"
				cRightDecimal 	:= "0"
			ELSE
				cLeftDecimal  := SubStr3(cText,1,At(cDecimal,cText)- 1)
				cRightDecimal := SubStr2(cText,At(cDecimal,cText) + 1)
			ENDIF
			IF lPoint
				nDecimalPos		:= nStart - Len(cLeftDecimal)
			ENDIF
		ELSE
			cLeftDecimal	:= cText
			cRightDecimal	:= ""
		ENDIF
		IF SELF:lAllSelected
			IF (cChar == "."  .OR. cChar == "," ) .AND. (uMsg <> WM_KEYDOWN) // cDecimal wcm 3/15/01
				IF lPoint
					lApplyKey := FALSE
					SELF:EventReturnValue	:= 1
				ELSE
					lPoint := TRUE	// we can only use the decimal point once!
					cLeftDecimal	:= "0"
					cRightDecimal	:= Replicate("0",nDecimals)
					nPos += 1			// move to beyond the decimal
				ENDIF
			ELSEIF cChar == "-"	// wcm 6-6-98
				SELF:lTurnNegative := TRUE
				cLeftDecimal	:= "0"
				cRightDecimal	:= Replicate("0" ,nDecimals)
			ELSE
				cLeftDecimal	:= cChar
				cRightDecimal	:= Replicate("0",nDecimals)
			ENDIF
		
			IF lapplyKey
				cText 				:= SELF:setField(cLeftDecimal+cDecimal+cRightDecimal,1)
				SELF:lAllSelected 	:= FALSE
				IF nDecimals > 0
					IF !lPoint  // added 6-6-98 to allow an initial decimal without having to hit 0. first
						nPos	:= At2(cDecimal,cText) -1
					ELSE
						nPos	:= At2(cDecimal,cText)
					ENDIF
				ELSE
					nPos	:= Len(cText)
				ENDIF
			ENDIF
		ELSE
			DO CASE
				CASE (wparam == VK_BACK  .OR. wparam == VK_DELETE)  .AND. uMsg == WM_KEYDOWN	// the user hit the back space key
					IF !lIgnore	
						IF lPoint
							DO CASE
								CASE wParam == VK_BACK
									nDecimalPos -= 1		// lets get the the real # of decimals showing	
									DO CASE
										CASE nDecimalPos == 0
											crightDecimal	:= ""
										CASE nDecimalPos == 1
											cRightDecimal	:= Stuff(cRightDecimal,nDecimalPos,1,"")
										OTHERWISE
											cRightDecimal	:= Left(cRightDecimal,nDecimalPos - 1) + SubStr2(cRightDecimal,nDecimalPos+1) + Replicate("0",nDecimals-1)
									END CASE
									nPos -= 1
								CASE wParam == VK_DELETE
									DO CASE
										CASE (nDecimalPos-1) <= 0
											cRightDecimal	:= Stuff(cRightDecimal,nDecimalPos -1 ,1,"")
										OTHERWISE
											cRightDecimal	:= Left(cRightDecimal,nDecimalPos - 1) + SubStr2(cRightDecimal,nDecimalPos+1) + Replicate("0",nDecimals-1)
									END CASE
							ENDCASE
						ELSE
							// now we can plug the new number in
							DO CASE
								CASE wparam == VK_BACK
									IF nStart > 1
										IF SubStr3(cLeftDecimal,nStart,1) = cThousands
											cLeftDecimal := Left(cLeftDecimal,nStart -2) + SubStr2(cLeftDecimal,nStart+1)
										ELSE
											cLeftDecimal := Left(cLeftDecimal,nStart -1) + SubStr2(cLeftDecimal,nStart+1)
										ENDIF
									ELSE
										cLeftDecimal := SubStr2(cLeftDecimal,nStart+1)
									ENDIF
								CASE wparam == VK_DELETE
									cLeftDecimal := Left(cLeftDecimal,nStart) + SubStr2(cLeftDecimal,nStart+2)
									nPos += 1
							ENDCASE
						ENDIF
						DO CASE
							CASE SELF:oEditString:Type == "N"
								cText := SELF:setField(cLeftDecimal + cDecimal + Left(cRightDecimal,nDecimals),1)					
								/* Now we have to see if the changed have resulted in a 0 SLE
								   If so, reset the cursor to just left of the decimal
								*/
								IF Val(IIF(SubStr3(cText,1,1) = "$",SubStr2(cText,2),cText)) = 0 // wcm 8/2/2001
									IF nDecimals > 0
										nPos	:= At2(cDecimal,cText) -1
										nStart 	:= nPos
									ELSE
										nPos	:= Len(cText)
										nStart 	:= nPos
									ENDIF
								ENDIF
							CASE SELF:oEditString:Type == "C"
								cText := SELF:setField(cLeftDecimal,1)					
						ENDCASE
	
					ENDIF
				CASE wparam == VK_END	// the user hit the end key
					IF nDecimals > 0
						lPoint := TRUE
					ENDIF
				CASE wparam == VK_HOME	// the user hit the home key
					IF LOGIC(_CAST,_AND(GetKeyState(VK_SHIFT), SHORT(_CAST,0x8000)))
						// the user hit a shift_home and we will select the entire SLE
						// so we do nothing
					ELSE						
						lPoint	:= FALSE
					ENDIF
				CASE wparam == VK_LEFT	// the user hit the left arrow key
				CASE wparam == VK_RIGHT	// the user hit the right arrow key
				CASE Instr(cChar,"-")  .AND. !Instr("-",cText)
					IF Val(LTrim(cLeftDecimal)) = 0  .AND. Val(cRightDecimal) = 0	// wcm 9/17/2000
						SELF:lTurnNegative := TRUE
					ELSE
						IF nDecimals > 0	
							IF (Len(LTrim(cLeftDecimal) + cDecimal + Left(cRightDecimal,nDecimals)) >= nSLELength)
								SELF:invalidAction()
							ELSE
								cText := SELF:setField(cLeftDecimal + cDecimal + Left(cRightDecimal,nDecimals),-1)
							ENDIF
						ELSE
							IF Len(LTrim(cLeftDecimal)) >= nSLELength
								SELF:invalidAction()
							ELSE
								cText := SELF:setField(cLeftDecimal,-1)
							ENDIF
						ENDIF
					ENDIF
				CASE Instr(cChar,"+")  .AND. Instr("-",cText)
					// Plus sign entered
					cText := SELF:setField(cLeftDecimal + cDecimal + Left(cRightDecimal,nDecimals), -1)
				CASE Instr(cChar,",.1234567890") // cDecimal+"0123456789") wcm 7/24/00
					IF cChar == ","  .OR. cChar == "."  // cDecimal  wcm 7/24/00
						IF lPoint
							lApplyKey := FALSE
						ELSE
							IF nDecimals > 0
								lPoint := TRUE
								nPos	:= At2(cDecimal,cText) 		// wcm 7/24/00
							ENDIF
							lApplyKey := FALSE
						ENDIF
						SELF:EventReturnValue	:= 1
					ENDIF
					IF lapplyKey
						IF lPoint
							// decimal positioning goes here
							IF nDecimalPos == 1
								cRightDecimal := cChar + cRightDecimal
							ELSE
		  						cRightDecimal := Stuff(cRightDecimal,nDecimalPos,0,cChar)
		  					ENDIF		
		  					IF SELF:lTurnNegative
								cText := SELF:setField(cLeftDecimal + cDecimal + Left(cRightDecimal,nDecimals),-1)
							ELSE
								cText := SELF:setField(cLeftDecimal + cDecimal + Left(cRightDecimal,nDecimals),1)
							ENDIF
							IF !lIgnore
								nPos += 1
							ENDIF
						ELSE
							// on the left of the decimal. Normal processing
							IF SubStr3(cLeftDecimal,nStart,1) == " "
								DO WHILE (SubStr3(cLeftDecimal,nStart,1) == " "  .OR. ;
										 SubStr3(cLeftDecimal,nStart,1) == "-"  .OR. ;
										 SubStr3(cLeftDecimal,nStart,1) == ":")  .AND. nStart <= Len(cLeftDecimal)
									// we are adjusting the nstart forward untill we reach a character
									nStart += 1
									nOffset += 1
								ENDDO
								lStripSpace := TRUE	// we stripped spaces so we have to adjust the position
								nOffset -= 1	//back it off by 1
								nStart -= 1		// back it down by 1 to place the number on the left
								nPos	:= nStart
							ENDIF
							// wcm 6-6-98 added check for lengh before I add the new character
							IF nDecimals > 0	
								IF (Len(LTrim(cLeftDecimal) + cDecimal + Left(cRightDecimal,nDecimals)) < nSLELength)  .OR. (Val(LTrim(cLeftDecimal)) = 0)	// wcm 7/1/2000
									IF (Val(LTrim(cLeftDecimal)) = 0  .AND. Val(cOrgValue) = 0)  .OR. ;
										(Val(LTrim(cLeftDecimal)) = 0  .AND. nStop >= nDecimalPos)
										cLeftDecimal := cChar
										nPos := 32767
										lIgnore := FALSE	// we never ignore once we get into number processing
									ELSE
										cLeftDecimal := Left(cLeftDecimal,nStart) + cChar + SubStr2(cLeftDecimal,nStart+1)
										IF lStripSpace		// this should only happen if the selection was in the left space infront of the SLE
											nPos := nStop + nOffset
										ELSE
											nPos := nStop
										ENDIF
									ENDIF
								ELSE
									SELF:invalidAction()
								ENDIF
								cTemp := Right(cLeftDecimal + cDecimal + Left(cRightDecimal,nDecimals),nSLEOrigLen)				
							ELSE
								DO CASE
								    CASE (SELF:oEditString:Type == "C")  .AND. ;
								        (Len(LTrim(cLeftDecimal)) < nSLELength)
								        cLeftDecimal := Left(cLeftDecimal,nStart) + cChar + ;
								        SubStr2 (cLeftDecimal,nStart+1)
										IF lStripSpace		// this should only happen if the selection was in the left space infront of the SLE
											nPos := nStop + nOffset
										ELSE
											nPos := nStop
										ENDIF
								    CASE (Len(LTrim(cLeftDecimal)) < nSLELength)  .OR. ;
								        (Val(LTrim(cLeftDecimal)) = 0) //wcm 7-1-2000
								        IF Val(LTrim(cLeftDecimal)) = 0  .AND. Val(cOrgValue) = 0
								            cLeftDecimal := cChar
								            nPos := nSLEOrigLen
								        ELSE
								            cLeftDecimal := Left(cLeftDecimal,nStart) + cChar + ;
								            SubStr2(cLeftDecimal,nStart+1)
											IF lStripSpace		// this should only happen if the selection was in the left space infront of the SLE
												nPos := nStop + nOffset
											ELSE
						           				nPos := nStop
											ENDIF
								        ENDIF
								    OTHERWISE
								        SELF:invalidAction()
							    ENDCASE
								cTemp := Right(cLeftDecimal,nSLEOrigLen)
							ENDIF
							IF SELF:lTurnNegative		
								cText := SELF:setField(cTemp,-1)
							ELSE
								cText := SELF:setField(cTemp,1)
							ENDIF	
						ENDIF
					ENDIF
				OTHERWISE
					// we do nothing which drops the invalid character or message
			ENDCASE			
			
		ENDIF
	
		// adjust to the decimal place if needed
		IF !lPoint  .AND. nDecimals > 0
			nDecimalPos := At2(cDecimal,cText) -1
			IF nPos >= nDecimalPos  .AND. !lIgnore
				nPos	:= nDecimalPos
			ENDIF
		ENDIF

		IF Instr( "*", cText )
    	   	SELF:invalidAction()       // the number would be too large
    	ELSE
	      	cText := SELF:SetField( cText, 1 )   		// this places thousand separators in cText
			uOldValue   				:= SELF:uValue  // Save uValue unchanged. Let VO deal with it.
		 	SELF:TextValue := cText
		 	SELF:uValue 				:= uOldValue    // Restore uValue in its original form.
		 	SELF:Modified 				:= TRUE       	// This must be uncommented.
			SELF:EventReturnValue		:= 1
			nStart						:= nPos
			SELF:Selection				:= selection{nStart,nStart}
		ENDIF
	END SEQUENCE
	RETURN

ASSIGN ReadOnly(lNewValue) 
//l Readonly Assign.
//p ReadOnly Assign.
//d This is the readonly assign fro the SDK with added logic\line
//d to handle the possibilty of push buttons.
//r NIL
	IF SELF:ValidateControl()
		SendMessage(SELF:Handle(), EM_SETREADONLY, DWORD(_CAST,lNewValue), 0L)
	ELSE
		IF (lNewValue)
		  dwStyle := _OR(dwStyle, DWORD(ES_READONLY))
		ELSE
		  dwStyle := _AND(dwStyle, DWORD(_NOT(ES_READONLY)))
		ENDIF
	ENDIF

	IF lNewValue
		IF SELF:oPB <> NULL_OBJECT
			SELF:oPB:disable()
		ENDIF
	ELSE
		IF SELF:oPB <> NULL_OBJECT
			SELF:oPB:enable()
		ENDIF
	ENDIF
	RETURN NIL

METHOD rslePaste() AS LOGIC PASCAL 
	//l paste method.
	//p paste method.
	//d rslePaste is a specialized version of paste that processes \line
	//d numbers in the same was as rightSLE does. Therefore it mimics \line
	//d the keyboard.
	//r logic
	LOCAL hGlb     AS PTR
	LOCAL pszPaste AS PSZ
	LOCAL sPaste   AS STRING
	LOCAL i, iLen  AS LONGINT
	LOCAL iStart, iEnd AS LONGINT

	IF !IsClipboardFormatAvailable(CF_TEXT)
		RETURN FALSE
	ENDIF

	IF !OpenClipboard(NULL_PTR)
		RETURN FALSE
	ENDIF

	hGlb := GetClipboardData(CF_TEXT)

	IF hGlb != NULL_PTR
		pszPaste := GlobalLock(hGlb)
		IF (PTR(_CAST,pszPaste) != NULL_PTR)
			SendMessage(SELF:Handle(), EM_GETSEL, DWORD(@iStart), LONGINT(@iEnd))
			IF ((iEnd - iStart) > 0)
				PostMessage(SELF:Handle(), EM_SETSEL, DWORD(iStart), iEnd)
				PostMessage(SELF:Handle(), WM_KEYDOWN,VK_DELETE,0)	
			ENDIF
			sPaste := Psz2String(pszPaste)
			iLen   := LONG(SLen(sPaste))
			FOR i := 1 UPTO iLen
	        	IF !Instr(CharPos(sPaste,DWORD(i)),SELF:cTemplateChar)	// have to only send valid characters
					PostMessage(SELF:Handle(),WM_CHAR,Asc(CharPos(sPaste,DWORD(i))),0)
	            ENDIF
			NEXT
		ENDIF
		GlobalUnlock(hGlb)
	ENDIF

	CloseClipboard()

	RETURN TRUE

ASSIGN Selection(oSelection) 
	//l Sets the Selection setting for the SLE.
	//p Sets the Selection setting for the SLE.
	//r NIL
	//a oSelection \tab - Selection object. \line

	IF !IsInstanceOfUsual(oSelection,#Selection)
		WCError{#Selection,#RIGHTSLE,"Data Type Error",oSelection,1}:@@Throw()
	ENDIF

	IF SELF:ValidateControl()
		//rightSLE must have the selection processed before the super is called
		SendMessage(SELF:Handle(), EM_SETSEL, oSelection:Start, oSelection:Finish)
	ENDIF

	RETURN NIL


METHOD SetField(cText AS STRING,nMult AS LONGINT) AS STRING PASCAL 
	//l formats the string based on the picture.
	//p formats the string based on the picture.
	//r STRING
	//a cText \tab - Text value to format. \line
	//a nMulti \tab - Multiplier to make the result positive or negative.

	LOCAL cRetString	AS STRING
	LOCAL cTmpString	AS STRING
	LOCAL i				AS DWORD
	LOCAL nStrLen		AS DWORD

	DO CASE
	    CASE Instr(Chr(SetThousandSep()),cText)
	        cTmpString := ""
	        nStrLen  := Len(cText)
	        FOR i := 1 UPTO nStrLen
	        	IF !Instr(SubStr(cText,i,1),SELF:cTemplateChar)
	                cTmpString += SubStr(cText,i,1)
	            ENDIF
	        NEXT
	    	IF !Empty(SELF:FieldSpec)
		        cRetString := SELF:fieldspec:Transform(Val(cTmpstring) * nMult)
		    ELSE
		        cRetString := Transform(Val(cTmpstring) * nMult,SELF:Picture)
		    ENDIF
	    CASE Instr(":",cText) // Added for ":" in picture = wem (06/15/00)
	        cTmpString := ""
	        nStrLen  := Len(cText)
	        FOR i := 1 UPTO nStrLen
	            IF SubStr(cText,i,1) <> ":"
	                cTmpString += SubStr(cText,i,1)
	            ENDIF
	        NEXT
	    	IF !Empty(SELF:FieldSpec)
		        cRetString := SELF:fieldspec:Transform(Val(cTmpstring))
		    ELSE
		        cRetString := Transform(Val(cTmpstring),SELF:Picture)
		    ENDIF
	    OTHERWISE
	        cTmpString := ""
	        nStrLen  := Len(cText)
		    FOR i := 1 UPTO nStrLen
	           	IF !Instr(SubStr(cText,i,1),SELF:cTemplateChar)
	                cTmpString += SubStr(cText,i,1)
	            ENDIF
	        NEXT
	    	IF !Empty(SELF:FieldSpec)
		        cRetString := SELF:fieldspec:Transform(Val(cTmpstring) * nMult)
		    ELSE
		        cRetString := Transform(Val(cTmpstring) * nMult,SELF:Picture)
		    ENDIF
	ENDCASE
    // wcm 2001-01-29
    // added check to see if a small negative number
    // is being entered. -0.01 should now
    // stay negative
    IF SELF:lTurnNegative  .and. !Instr(":",cText)		
      	IF (Val(cTmpstring)* nMult) <> 0
       		SELF:lTurnNegative := FALSE
       	ENDIF
     ENDIF
	RETURN cRetString

METHOD SetOrigin(oDW AS window) AS VOID PASCAL 
	//l Sets the origin of a data/dialog window
	//p Sets the origin of a data/dialog window
	//d Sets the origin of a data or dialog window to stay within the bounds
	//d of the current screen metrics.
	//r VOID
	//a oDW - DataWindow to adjust the origin. \line

	LOCAL RectOwner 		IS _WinRect
	LOCAL Rect 				IS _WinRect
	LOCAL siYTopCoord 		AS LONGINT
	LOCAL siYBottomCoord 	AS LONGINT
	LOCAL siXRightCoord 	AS LONGINT
	LOCAL siXCoord 			AS LONGINT
	LOCAL siYCoord 			AS LONGINT
	LOCAL siHeight, siWidth AS LONGINT

	GetWindowRect( SELF:Handle(), @Rect )
	siYBottomCoord := Rect.Bottom + 2
	siYTopCoord := Rect.Top - 2
	siXRightCoord := Rect.Right - 2
//	GetWindowRect( GetDesktopWindow(), @RectOwner )
	SystemParametersInfo(SPI_GETWORKAREA, 0, @RectOwner, 0) // wcm 2007-03-24 change per suggestion by Camille for increasing performance
	siHeight := oDW:Size:Height
	siWidth := oDW:Size:Width
	
	// If we are off the bottom of the screen
	IF (( siYTopCoord + siHeight) > RectOwner.Bottom )
		// Move Up
		siYCoord := Rect.Top - 2 - siHeight
	ELSE
		siYCoord := Rect.Top + 2 + SELF:Size:Height
	ENDIF

	// In limited cases (640x480 screen), the dialog can be off the screen a small
	// amount if set above or below the button SLE. 	In this case, set it even with
	// the RectOwner.Bottom parameter.
	IF ( ( siYTopCoord - siHeight) < RectOwner.Top )  .And. ( ( siYBottomCoord + siHeight) > RectOwner.Bottom )
		siYCoord := RectOwner.Bottom - 2 - SELF:Size:Height - siHeight
	ENDIF

	// If we are off the right side of the screen
	IF ( ( siXRightCoord + siWidth ) > RectOwner.Right )
		// Move Left
		siXCoord := Rect.Right - 2 - siWidth
	ELSE
		siXCoord := Rect.Left + 2
 	ENDIF

	oDW:origin:=point{SELF:origin:x,SELF:origin:y-oDW:size:height}
	MoveWindow( oDW:Handle(), siXCoord, siYCoord, siWidth, siHeight, TRUE )
	RETURN

METHOD Show() 
	//l show method for dynamically created SLEs.
	//p show method for dynamically created SLEs. This also handles the button
	//r NIL
	//a None

	SUPER:show()
	SELF:showpb()
	RETURN NIL

METHOD ShowCalc() AS VOID PASCAL 
	//l Processing logic to show a calculator popup.
	//p Processing logic to show a calculator popup.
	//r VOID
	//a None
	//j CL:calcSLE

	LOCAL oDlgCalc	AS PopupCalc
	LOCAL cText		AS STRING
	
	cText := Str(Unformat(SELF:TextValue,SELF:FieldSpec:Picture,"N"))
	// *************************************************************************
	// * wcm 2005-07-09 changed the class instanciation to include a check for *
	// *                owner. If the owner in not a window (ie bbrowser),     *
	// *                use the owner:owner to get to a window                 *
	// *************************************************************************
	IF IsInstanceOf(SELF:owner,#window)
		oDlgCalc := CreateInstance(SELF:symCalcClass,SELF:Owner,cText)	
	ELSE
		oDlgCalc := CreateInstance(SELF:symCalcClass,SELF:Owner:Owner,cText)
	ENDIF			

	SELF:SetOrigin(oDlgCalc)
	oDlgCalc:Show()		
	// put the returned number back into the SLE
	IF ! Empty( oDlgCalc:sExport)
		cText 			:= SELF:setfield(oDlgCalc:sExport,1)
		SELF:TextValue	:= cText
		SELF:value		:= SELF:FieldSpec:Val(cText)
		SELF:Modified	:= TRUE
	ENDIF

	// this makes sure we get focus back to the SLE we want
	SetFocus(SELF:Handle())
	RETURN

METHOD ShowCalendar() AS VOID PASCAL 
	//l processing method to show a popup calendar.
	//p processing method to show a popup calendar.
	//r VOID
	//a None
	//j CL:dlgPECalendar
	
	LOCAL DIM firstDay[2] 		AS BYTE
	LOCAL oDlgPECalendar		AS dlgPECalendar
	LOCAL cDateFormat			AS STRING
	LOCAL dOldTextValue			AS STRING

	BEGIN SEQUENCE
		IF oPB <> NULL_OBJECT  .and. SELF:lDoubleAsToday  .and. !SELF:lSendFromButton
			SELF:textvalue			:= DToC(Today())
	        SELF:ValueChanged 		:= TRUE
			BREAK		
		ENDIF
        SELF:lSendFromButton	:= FALSE	// we got here from a button or a non linked double click. Turn it off regardless
		// If it is pass the PEDateSle to to dlgCalendar and pop up a calendar.
		// We adjust the Calendar's origin in dlgCalendar's PostInit to align the calendar just below the Sle
		
		// ***************************************************
		// * If the firstdayiofweek is not set, set it now   *
		// ***************************************************
		IF SELF:FirstDayoftheWeek = 99
			GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_IFIRSTDAYOFWEEK, @firstDay, 2)
			IF firstDay[1] = 48	// Monday 1st Day of Week
				SELF:FirstDayoftheWeek	:= 2		// set up Sunday as initial day of the week
			ELSEIF firstDay[1] = 54	// Sunday 1st Day of Week
				SELF:FirstDayoftheWeek	:= 1		// set up Sunday as initial day of the week
			ENDIF
		ENDIF
			
		// save date formats before we go into the calendar
		cDateFormat				:= GetDateFormat()
	
		// calendar class
		// *************************************************************************
		// * wcm 2005-07-09 changed the class instanciation to include a check for *
		// *                owner. If the owner in not a window (ie bbrowser),     *
		// *                use the owner:owner to get to a window                 *
		// * wcm 2005-10-09 Added checks for a valid date before we call the       *
		// *                calendar routine. If an invlaid date is found,         *
		// *                self:TextValue is set to today()                       *
		// *************************************************************************
		// save off out old first. that way we have a restore point if they choose nothing form the calendar
		dOldTextValue			:= SELF:TextValue
		
		// test for the NULL_DATE and adjust
		IF CToD(SELF:TextValue) == NULL_DATE
			SELF:TextValue 		:= DToC(Today())
			SELF:ValueChanged 	:= TRUE		// we change textvalue, let VO know
		ENDIF
	
		// build and display the calendar
		IF IsInstanceOf(SELF:owner,#window)
			oDlgPECalendar := CreateInstance(SELF:symCalandarClass,SELF:Owner,SELF)
		ELSE
			oDlgPECalendar := CreateInstance(SELF:symCalandarClass,SELF:Owner:owner,SELF)
		ENDIF			
		SELF:SetOrigin(oDlgPECalendar)
		oDlgPECalendar:Show()		
		
		// restore saved data formats
		SetDateFormat(cDateFormat)


		// If they doubled click on a date, we stuff that value back into the Sle they double clicked on previously
		IF ! Empty( oDlgPECalendar:dSelected )
			SELF:Value		:= oDlgPECalendar:dSelected
			SELF:textvalue	:= DToC(oDlgPECalendar:dSelected)
			IF SubStr(SELF:textvalue,1,1) > " "
		        SELF:ValueChanged 	:= TRUE // wcm 9/27/2000
			ELSE
				SELF:ValueChanged	:= FALSE  //wcm 09/27/2000
		    ENDIF

			// added for bbrowser support wcm 2005-09-23
		   IF IsInstanceOf(SELF:Owner, #BBrowser)
		      SELF:Owner:Edit()
		      SELF:Owner:EditControl:Value := oDlgPECalendar:dSelected
		      SELF:Owner:EditClose()
		   ENDIF
		ELSE
			IF SELF:ValueChanged
				// this means that we did it and will need to set VO back to what
				// was there before. most likely a NULL Date
				SELF:TextValue	:= dOldTextValue
				SELF:ValueChanged := FALSE
			ENDIF
		ENDIF	
	
		// this makes sure that we get focus back to the SLE we want
		// added for bbrowser support wcm 2005-09-23
		IF .not. IsInstanceOf(SELF:Owner, #BBrowser)
		   SetFocus(SELF:Handle())
		ENDIF
	END SEQUENCE
	RETURN

METHOD Showpb() 
	//l stub method to show a button if it exists.
	//p stub method to show a button if it exists.
	//r super:show()
	//a None
	IF SELF:oPB	<> NULL_OBJECT
		IF SELF:IsVisible()
			SELF:oPB:show()
		ENDIF
		IF SELF:ReadOnly  .or. !IsWindowEnabled(SELF:handle())
			SELF:oPB:disable()
		ENDIF
	ENDIF
	RETURN NIL

ACCESS TrimValue() AS STRING PASCAL 
	//l Access method to return a trimmed SLE.
	//p Access method to return a trimmed SLE.
	//d TrimValue will return an alltrimmed value if it is a char or an ntrimed if it is numeric. \line
	//r STRING
	//a None
	LOCAL cResult	AS STRING
	
	IF Empty(SELF:value)
		cResult := NULL_STRING
	ELSEIF ValType(SELF:value) == "C"
		cResult := AllTrim(SELF:value)
	ELSE
		cResult := NTrim(SELF:value)
	ENDIF
	RETURN cResult

ASSIGN TYPE(cVar AS STRING) AS VOID PASCAL 
	SELF:oEditString:Type := cVar
	RETURN	

METHOD updateFieldspec(OFS AS FieldSpec) AS VOID PASCAL 
	LOCAL sPicture	AS STRING
	LOCAL cTextVal	AS STRING
	
	// get the old value
	cTextval	:= SELF:TextValue
	
	// set the fieldspec with the new version
	SELF:Picture		:= ""		// correctly clears the oEditString GCS 01/02/2006
	SELF:FieldSpec		:= oFS
	
	// save the picture
	sPicture		:= OFS:Picture
	SUPER:Picture	:= sPicture
	
	// reset the value of the SLE
 	SELF:TextValue 				:= cTextVal		 	// restore the textval. Let VO deal with the rest
 	SELF:Modified 				:= TRUE     		// This must be uncommented.
	SELF:EventReturnValue		:= 1

	RETURN	

ACCESS Value 
    IF !(SELF:FieldSpec == NULL_OBJECT )  .and.  (SELF:FieldSpec:Valtype == 'N')
        RETURN SELF:FieldSpec:Val(SELF:TextValue)
    ELSE
        RETURN SUPER:Value
    ENDIF
	//	this should not be needed. added to get rid of the compiler warning
	RETURN NIL



ACCESS ZeroPad() AS STRING PASCAL 
	//l Access method to left zero fill a SLE.
	//p Access method to left zero fill a SLE.
	//d ZeroPad will left fill your SLE with zeros (0) \line
	//d regardless of type.
	//r STRING
	//a None

	RETURN iif(ValType(SELF:value) == "C", ;
			StrZero(Val(SELF:value),SELF:length), ;
			StrZero(SELF:value,SELF:length) )			


END CLASS
STATIC FUNCTION IsOverWriteModeEnabled() AS LOGIC PASCAL
	STATIC LOCAL DIM aKeyStates[256] AS BYTE
	GetKeyboardState(@aKeyStates)	
	RETURN !LOGIC(_CAST,_AND(aKeyStates[VK_INSERT + 1], 1))

