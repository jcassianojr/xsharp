DEFINE nCONST_MAX_INTEGER_ACCURACY := 15 
DEFINE nCONST_MAX_NUMERIC_ACCURACY := 18 
DEFINE nCONST_MAX_NUMERIC_NUMBER := 999999999999999

CLASS inlineCalcSLE INHERIT rightsle
// Author		: Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 13 Jan, 2000
// --------------
//l SLE that brings up a Calculator when double-clicked
//p SLE that brings up a Calculator when double-clicked
//d	inlinecalcSLE is a subclass if rightSLE that adds a popup calculator.
//d Unlike calcSLE, inlineCalcSLE also allows you to do simple
//d calculations without having to pop up the calculator.
//d Put a SLE on your window and have it INHERIT from calcSLE.
//g Edit Controls
	EXPORT	sExport		AS STRING	// Exported value
  	PROTECT fXX			AS FLOAT	// first operand
  	PROTECT fYY			AS FLOAT	// second operand
  	PROTECT fZZ			AS FLOAT	// result
  	PROTECT nDecimals	AS LONGINT		// number of decimal places to show
  	PROTECT sOP1		AS STRING	// First operation
  	PROTECT nEditLevel	AS LONGINT		// Allow overwrite on next entry
  	PROTECT nOpLevel	AS LONGINT		// Building 1st or 2nd operand
  	PROTECT OldFixed	AS LOGIC	// system status of SetFixed(), kept for restoration
  	PROTECT fMemory		AS FLOAT	// Memory button
  	PROTECT oOwner		AS OBJECT	// calling entity
  	PROTECT lError		AS LOGIC	// Error condition Flag
  	PROTECT lEnter		AS LOGIC	// 2nd enter key in a row calls super
  	PROTECT lSessionChange	AS LOGIC	// we use this to track a change based
  										// solely on this times's value (ie it gets
  										// reset eachtime the control regains focus)

/****************************************************************************/
METHOD AutoClear() AS VOID 

	//p Method to clear the calculator
	//r VOID
	//a None

	// Clear Calculator display if Level=0
	IF SELF:nEditLevel == 0
		SELF:Textvalue := ""   // clear value
		SELF:nEditLevel := 1   // now allow first operand operations to take place
		SELF:lError := FALSE
	ENDIF
	RETURN

/****************************************************************************/
METHOD BClear( ) AS VOID 

	//p Method to clear the calculator
	//r VOID
	//a None

	SELF:initcalc()   // reset display
	SELF:Value	:= 0.
	SELF:nEditLevel	:= 0
	RETURN

/****************************************************************************/
METHOD Dispatch ( oEvent ) 


	/*
		Only the messages, that inlineCalcSLE wants to know about.
	 	All the rest go through to rightSLES's dispatch and every other class's dispatch that is involved from there - There are lots of them!!!!

    */
    	IF !(SELF:FieldSpec == NULL_OBJECT ) .and. SELF:FieldSpec:Valtype == "N"
    		DO CASE
    			CASE SELF:ReadOnly
    				// dont do anything if it is readonly
    			CASE oEvent:Message == WM_LBUTTONUP
					SELF:lAllSelected	:= FALSE
				CASE oEvent:Message == WM_LBUTTONDBLCLK
					IF IsMethod(SELF,SELF:symCalcMethod)
						Send(SELF,SELF:symCalcMethod)
						RETURN 1L
					ENDIF	
				CASE oEvent:Message == WM_COMMAND
					IF oEvent:wParam == IDM_CalcSLEContextMenu_File_Calculator_ID
						// Pop up the calculator
						IF IsMethod(self,self:symCalcMethod)
							Send(self,self:symCalcMethod)
							RETURN 1L
						ENDIF	
					ENDIF	
				CASE oEvent:Message == WM_KEYDOWN
					/* uncomment if you want the delete key to clear the display
					IF oEvent:wParam  == VK_DELETE
						SELF:DoOperation("C")
						RETURN 1L
					ENDIF
					*/
				CASE oEvent:Message=WM_CHAR
					IF SELF:Selection:Start <> SELF:Selection:Finish
						// reset sumations if they select everything
						SELF:nEditLevel := 0	
					ENDIF
					SELF:autoClear()
					DO CASE
						CASE Instr(CHR(oEvent:wParam), _chr(8)+"0123456789.," )
							// printable result
							SELF:DoOperation (CHR(oEvent:wParam))
						CASE Instr(CHR(oEvent:wParam), "cC+*-/=^" )          		// gcs - 16/07/00
							// operation to be performed
							SELF:DoOperation(CHR(oEvent:wParam))
							RETURN 1L
						OTHERWISE
							RETURN 1L
					ENDCASE		
			END CASE
		ENDIF
		
	// Let all the other messages, go back to VO's Sle Wndproc
		
RETURN SUPER:Dispatch( oEvent )

/****************************************************************************/
METHOD DoOperation(sKey AS STRING) AS VOID 

	//p Method to perform the operation
	//r VOID
	//a sKey as string - Operation to perform
	LOCAL cText	AS STRING
	LOCAL nPos	AS DWORD
	
	// Here is where we perform the calculation iterations.
	_DebOut32(String2Psz("IN DOOperation. The passed operation IS " + sKey))
	DO CASE
		CASE SELF:lError
			// Do nothing!
			RETURN	// we don't want to set the lsessionchange on nothing
		CASE Instr(sKey, "Cc")										// gcs 16/07/00
			SELF:BClear()
		CASE Instr(sKey, "S") .and. (nOpLevel==1)
			SELF:fXX := SELF:StringToFloat(SELF:CurrentText)
			fZZ := SQRT(SELF:fXX)
			SELF:TextValue := SELF:FloatToString(SELF:fZZ)
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 1		// go back to first operand
		CASE Instr(sKey, "S") .and. (nOpLevel==2)
			SELF:fYY := SELF:StringToFloat(SELF:CurrentText)
			fZZ := SQRT(fYY)
			SELF:TextValue := SELF:FloatToString(SELF:fZZ)
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 2		// go back to first operand
		CASE Instr(sKey, "I") .and. (nOpLevel==1)
			SELF:fXX := SELF:StringToFloat(SELF:CurrentText)
			fZZ := SELF:MyDiv(1.0, fXX)
			SELF:TextValue := SELF:FloatToString(fZZ)
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 1		// go back to first operand
		CASE Instr(sKey, "I") .and. (nOpLevel==2)
			SELF:fYY := SELF:StringToFloat(SELF:CurrentText)
			fZZ := SELF:MyDiv(1.0, SELF:fYY)
			SELF:TextValue := SELF:FloatToString(SELF:fZZ)
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 2		// go back to first operand
		CASE Instr(sKey, "^%*+/-") .and. (nOpLevel==1)
			SELF:nOpLevel := 2				// advance to second operand
			SELF:nEditLevel := 0
			SELF:sOp1   := sKey				// save the operation type
			SELF:fXX := SELF:StringToFloat(SELF:CurrentText)
		CASE Instr(sKey, "=") .and. (nOpLevel==1) // accumulation		// gcs 16/07/00			
			SELF:fYY := SELF:StringToFloat(SELF:CurrentText)// gcs 16/07/00
			DO CASE														// gcs 16/07/00
				CASE sOP1=="%"  ;   SELF:fZZ := SELF:fYY * (SELF:fXX/100.0)			// gcs 16/07/00
				CASE sOP1=="^"  ;   SELF:fZZ := SELF:fXX ^ SELF:fYY					// gcs 16/07/00 // wcm 2007-0709 removed to get rightSLE to compile. put back in when the compiler supports this
				CASE sOP1=="+"  ;   SELF:fZZ := SELF:fXX + SELF:fYY					// gcs 16/07/00
				CASE sOP1=="/"  ;	SELF:fZZ := SELF:MyDiv(SELF:fXX, SELF:fYY)			// gcs 16/07/00
				CASE sOP1=="-"  ;   SELF:fZZ := SELF:fXX - SELF:fYY					// gcs 16/07/00
				CASE sOP1=="*"  ;   SELF:fZZ := SELF:fXX * SELF:fYY					// gcs 16/07/00
			ENDCASE			
			cText 				:= SELF:FloatToString(SELF:fZZ)		// gcs 16/07/00
			SELF:TextValue		:= SELF:SetField(cText,1)
//			SELF:value			:= SELF:FieldSpec:Val(cText)
			SELF:value			:= 	Val(cText)
		    SELF:ValueChanged 	:= TRUE
			SELF:fXX 			:= SELF:StringToFloat(SELF:CurrentText)// gcs 16/07/00
			SELF:nEditLevel 	:= 1	// edit the next entry				// wcm 01/29/2001
			SELF:nOpLevel 		:= 1		// go back to first operand			// gcs 16/07/00
		CASE Instr(sKey, "=") .and. (nOpLevel==2)   // perform the last operation			
			SELF:fYY := SELF:StringToFloat(SELF:CurrentText)
			DO CASE
				CASE sOP1=="%"  ;   SELF:fZZ := SELF:fYY * (SELF:fXX/100.0)
				CASE sOP1=="^"  ;   SELF:fZZ := SELF:fXX ^ SELF:fYY // wcm 2007-0709 removed to get rightSLE to compile. put back in when the compiler supports this
				CASE sOP1=="+"  ;   SELF:fZZ := SELF:fXX + SELF:fYY
				CASE sOP1=="/"  ;	SELF:fZZ := SELF:MyDiv(SELF:fXX, SELF:fYY)
				CASE sOP1=="-"  ;   SELF:fZZ := SELF:fXX - SELF:fYY
				CASE sOP1=="*"  ;   SELF:fZZ := SELF:fXX * SELF:fYY
			ENDCASE
			cText 				:= SELF:FloatToString(SELF:fZZ)		// gcs 16/07/00
			SELF:TextValue		:= SELF:SetField(cText,1)
//			SELF:value			:= SELF:FieldSpec:Val(cText)
			SELF:value			:= Val(cText)
		    SELF:ValueChanged 	:= TRUE
			SELF:nEditLevel := 1	// edit the next entry wcm01/29/2001
			SELF:nOpLevel := 1		// go back to first operand
		CASE Instr(sKey, "+/-*") .and. (nOpLevel==2)   // perform the last operation and return new one
			SELF:fYY := SELF:StringtoFloat(SELF:CurrentText)
			DO CASE
				CASE sOP1=="%"  ;   SELF:fZZ := SELF:fYY * (SELF:fXX/100.0)
				CASE sOP1=="^"  ;   SELF:fZZ := SELF:fXX ^ SELF:fYY // wcm 2007-0709 removed to get rightSLE to compile. put back in when the compiler supports this
				CASE sOP1=="+"  ;   SELF:fZZ := SELF:fXX + SELF:fYY
				CASE sOP1=="/"  ;	SELF:fZZ := SELF:MyDiv(SELF:fXX, SELF:fYY)
				CASE sOP1=="-"  ;   SELF:fZZ := SELF:fXX - SELF:fYY
				CASE sOP1=="*"  ;   SELF:fZZ := SELF:fXX * SELF:fYY
			ENDCASE
			SELF:TextValue := SELF:FloatToString(SELF:fZZ)
			SELF:fXX := SELF:StringToFloat(SELF:CurrentText)	// gcs 16/07/00
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 2		// stay at second operand
			SELF:sOp1 := sKey
		CASE Instr(sKey, "%") .and. (nOpLevel==2)   // perform the last operation with "Y" % of the first value
			SELF:fYY := SELF:fXX/100.0 *SELF:StringtoFloat(SELF:CurrentText)  // gets y% of X first
			DO CASE
				CASE sOP1=="%"  ;   SELF:fZZ := SELF:fYY * (SELF:fXX/100.0)
				CASE sOP1=="^"  ;   SELF:fZZ := SELF:fXX ^ SELF:fYY // wcm 2007-0709 removed to get rightSLE to compile. put back in when the compiler supports this
				CASE sOP1=="+"  ;   SELF:fZZ := SELF:fXX + SELF:fYY
				CASE sOP1=="/"  ;	SELF:fZZ := SELF:MyDiv(SELF:fXX, SELF:fYY)
				CASE sOP1=="-"  ;   SELF:fZZ := SELF:fXX - SELF:fYY
				CASE sOP1=="*"  ;   SELF:fZZ := SELF:fXX * SELF:fYY
			ENDCASE
			SELF:TextValue := SELF:FloatToString(SELF:fZZ)
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 1		// go back to first operand
	ENDCASE
	IF !Instr(sKey, "=")
		// reset the enter logic if they enter any operation other than enter
		SELF:lEnter := FALSE
	ENDIF

	IF Instr(sKey, "+/-*=C")
		// reposition the cursor to the left of the decimal
		nPos 	:= At2(CHR(SetDecimalSep()),SELF:CurrentText)
		IF nPos > 0
			// set the cursor before the decimal Sep
			nPos--
		ELSE
			// set it at the end of the sle
			nPos := SLen(SELF:CurrentText)
		ENDIF
		PostMessage(SELF:Handle(), EM_SETSEL, nPos,LONGINT(_CAST,nPos))					
	ENDIF

	SELF:lSessionChange := TRUE

	// Now put focus back into edit and position cursor to end of edit
//	SELF:oDCDisplayZ:SetFocus()
//	SELF:oDCDisplayZ:Selection := Selection{ Len(SELF:oDCDisplayZ:CurrentText), Len(SELF:oDCDisplayZ:CurrentText) }

	RETURN


/****************************************************************************/
METHOD FloatToString (fFloatVal AS FLOAT) AS STRING 

	//p Method to convert a float to a string
	//r String
	//a fFloatVal as float - value to convert
	
	LOCAL sFloatResult  AS STRING
	LOCAL dwDecPlaces   AS DWORD
	LOCAL dwIntegerSize AS DWORD
	LOCAL fThisNumber   AS FLOAT
	
	sFloatResult  := ""
	
	dwIntegerSize := SLen( LTrim( Str3( Integer( fFloatVal ),nCONST_MAX_INTEGER_ACCURACY,0))) + 1 // have to account for the decimal place
	dwDecPlaces   := nCONST_MAX_NUMERIC_ACCURACY - dwIntegerSize
	fThisNumber   := Abs(  fFloatVal )
	
	IF fThisNumber > nCONST_MAX_NUMERIC_NUMBER
	  SELF:lError := TRUE
	ENDIF
	IF SELF:lError
	  sFloatResult := "Error"    // old code
	  SELF:nEditLevel := 0	 // edit the next entry
	  SELF:nOpLevel := 1	 // go back to first operand
	ELSE
	  // two lines for readability
	  IF dwDecPlaces > 0
	     sFloatResult := LTrim( Str3(fFloatVal,nCONST_MAX_NUMERIC_ACCURACY,dwDecPlaces))
	  ELSE
	     sFloatResult := LTrim( Str3(fFloatVal,nCONST_MAX_INTEGER_ACCURACY,0))
	  ENDIF
	  // Now check for unnecessary places for bit after decimal place only
	  // This depend on standardisation ( ., .0,.00 )
	  // Windows calculator standrad is first one.
	  // i.e actual decimal numbers without zeros or just a dot after integer )
	  IF Instr(".", sFloatResult)
	     // First strip out end zeros except last one after "."
	     DO WHILE Right(sFloatResult,1)=="0"  // don't worry about all other instances
	        dwDecPlaces:= SLen(sFloatResult) - At(".", sFloatResult )
	        IF dwDecPlaces > 0 .and. Right(sFloatResult,1)=="0"
	           sFloatResult := SubStr3( sFloatResult, 1, SLen(sFloatResult)-1 )
	           dwDecPlaces--
	        ENDIF
	     ENDDO
	  ENDIF
	  SetDecimal( dwDecPlaces )   // reset this value
	ENDIF
	
	RETURN sFloatResult
	
/****************************************************************************/	
METHOD FocusChange(oFocusChangeEvent) 

	//p Custom Focuschange method for inline calculator functionality
	//r VOID
	//a oFocusChangeEvent - A VO Generated FocusChangeEvent

	SUPER:FocusChange(oFocusChangeEvent)	
	SELF:lEnter := FALSE	// reset the enter key to mean = for the first time
	IF (wFocusSel == FSEL_ALL)
		// reset the sumations to start over
		SELF:nEditLevel := 0		
    ENDIF
	SELF:lSessionChange := FALSE
	RETURN NIL

/****************************************************************************/
Constructor(oOwner, nId, oPoint, oDim, kStyle,lDataAware ) 

	SUPER( oOwner, nID, oPoint, oDim, kStyle, lDataAware )
    SELF:ContextMenu 	:= CalcSLEContextMenu{ SELF }
    SELF:lEnter			:= FALSE
    self:lSessionChange	:= FALSE
    SELF:lTurnOffEnter	:= FALSE	// for the inline to work properly, we must allow enter keys
    self:symCalcMethod	:= #showcalc
    SELF:initcalc()
    RETURN  
    
/****************************************************************************/    
METHOD initcalc() AS VOID 

	//p Method to setup the calculator back to default values
	//r Void
	
	SELF:fXX 		:= 0
	SELF:fYY 		:= 0
	SELF:fZZ 		:= 0
	SELF:nDecimals 	:= 2
	SELF:sOp1 		:= "+"
	SELF:fMemory 	:= 0
	SELF:nEditLevel := 1			// 0 clears the display
	SELF:nOpLevel 	:= 1
	SELF:sExport 	:= ""
	SELF:lError 	:= FALSE
	SELF:lSessionChange	:= FALSE
	
	SELF:OldFixed 	:= SetFixed(FALSE)   // allow any decimal places appropriate
	SetScience(FALSE)
	
	RETURN
	
/****************************************************************************/	
METHOD MyDiv (fInXVal AS FLOAT, fInYVal AS FLOAT) AS FLOAT

	//p custom divison to advoid runtime error
	//r float
	//a fInXval as float - Left side of the operation \line
	//a fInYval as float - right side of the operation \line


	LOCAL Result AS FLOAT

	IF fInYVal=0
		SELF:lError := TRUE
		Result := 0
	ELSE
	   Result := fInXVal / fInYVal
	ENDIF

 	RETURN Result
 	
/****************************************************************************/ 	
METHOD ProcessEnter() AS LONG

	//p custom enter key handler for the inline calc
	//r VOID
	//a None
	IF !SELF:lenter .and. SELF:lSessionChange .and. SELF:nOpLevel > 1  // wcm 2006-05-10 changed so it on first opp only, process the normal enter key
		SELF:DoOperation("=")
		SELF:lEnter := TRUE
	ELSE
		SELF:lEnter := FALSE
		RETURN SUPER:processEnter()
	ENDIF
	// Don't print this, so merely return
	RETURN 1L

/****************************************************************************/
METHOD StringToFloat(sDisplay AS STRING ) AS FLOAT 

	//p Method to convert a string to a float
	//r float
	//a sDisplay as string - value to convert

	
	/// Convert string value into number
	LOCAL Result 	AS FLOAT
	LOCAL nCurrDec 	AS DWORD
	
	Result := 0.0
	
	IF !SELF:lError
		IF Instr(".", sDisplay)
			nCurrDec := Len(sDisplay)-At(".",sDisplay)
			IF nCurrDec>SetDecimal()
				SetDecimal(nCurrDec)   // try and reset to be larger
			ENDIF
		ENDIF
		result := Unformat(sDisplay,"999999999999999999.999999","n")
		
//		Result := Val(sDisplay)
	ENDIF
	
	RETURN Result
END CLASS

CLASS pbinlineCalcSLE INHERIT inlineCalcSLE
// Author		: Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 13 Jan, 2000
// --------------
//l SLE that brings up a Calculator when double-clicked
//p SLE that brings up a Calculator when double-clicked
//d	pbinlinecalcSLE is a subclass if inlinecalcSLE that adds push button to the calculator class.
//d Unlike calcSLE, inlineCalcSLE also allows you to do simple
//d calculations without having to pop up the calculator.
//d Put a SLE on your window and have it INHERIT from calcSLE.
//g Edit Controls
Constructor(oOwner, nId, oPoint, oDim, kStyle,lDataAware ) 

	super( oOwner, nID, oPoint, oDim, kStyle, lDataAware )
	SELF:AssignImage("rsle_Calcup")
	RETURN  
END CLASS

