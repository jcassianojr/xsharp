// Class_Calculator.prg
// this class has no GUI. It simply handles the calculator. The classes that call this class
// are resonsible for reading the value back and displaying it after they make the call.
#define nCONST_MAX_INTEGER_ACCURACY 15 
#define nCONST_MAX_NUMERIC_ACCURACY 18 
#define nCONST_MAX_NUMERIC_NUMBER 999999999999999

#USING System.Globalization

Class Calculator
	PROTECT sValue          AS STRING   // value that will get displayed back in the SLE
	PROTECT fXX			    AS real8	// first operand
	PROTECT fYY			    AS real8	// second operand
	PROTECT fZZ			    AS real8	// result
	PROTECT nDecimals	    AS LONGINT  // number of decimal places to show
	PROTECT sOP1		    AS STRING	// First operation
	PROTECT nEditLevel	    AS LONGINT	// Allow overwrite on next entry
	PROTECT nOpLevel	    AS LONGINT	// Building 1st or 2nd operand
	PROTECT OldFixed	    AS LOGIC	// system status of SetFixed(), kept for restoration
	PROTECT fMemory		    AS real8	// Memory button
	PROTECT oOwner		    AS OBJECT	// calling entity
	PROTECT lError		    AS LOGIC	// Error condition Flag
	PROTECT lEnter		    AS LOGIC	// 2nd enter key in a row calls super
	PROTECT lSessionChange	AS LOGIC	// we use this to track a change based
										// solely on this times's value (ie it gets
										// reset eachtime the control regains focus)
	PROTECT cDecSep         AS STRING   // decimal seperator
	
/****************************************************************************/
Constructor()
	local numberFormat      AS NumberFormatInfo    
	super()
	SELF:fMemory := 0   // this is cleared seperately so memory isnt cleared when
						// you hit the c button
	SELF:InitCalc()
	numberFormat            := NumberFormatInfo.CurrentInfo
	SELF:cDecSep            := numberFormat:NumberDecimalSeparator
	return

/****************************************************************************/
METHOD AutoClear() AS LOGIC

	//p Method to clear the calculator
	//r VOID
	//a None
	LOCAL lClearParent  as LOGIC

	// Clear Calculator display if Level=0
	IF SELF:nEditLevel == 0
		SELF:svalue     := ""   // clear value
		SELF:nEditLevel := 1   // now allow first operand operations to take place
		SELF:lError     := FALSE
		lClearParent    := TRUE
	ELSE
		lClearParent    := FALSE
	ENDIF
	RETURN lClearParent

/****************************************************************************/
METHOD FinalCheck() AS LOGIC

	//p Method that you can call to clear up any pending operations
	//r VOID
	//a None
	LOCAL lResult  as LOGIC
	IF "^%*+/-":IndexOF(SELF:sOP1) > -1 .AND. (SELF:nOpLevel==2)  // Force to perform the last operation
		SELF:DoOperation("=")                               //
		lResult := true
	else
		lResult := FALSE
	ENDIF                                                   // JR 2002/08/08
	RETURN lResult

/****************************************************************************/
METHOD BClear( ) AS VOID 

	//p Method to clear the calculator
	//r VOID
	//a None

	SELF:initcalc()   // reset display
	SELF:sValue	    := "0."
	SELF:nEditLevel	:= 0
	RETURN

/****************************************************************************/
METHOD BMemClear( ) AS VOID 
	//p Method to clear memory
	//r VOID
	//a None

	SELF:fMemory := 0
	SELF:DoOperation("")   // null value to obtain other deault activity
	RETURN

/****************************************************************************/
METHOD BMemPlus(cDisplay as String) AS VOID
	LOCAL fxx AS Real8
	
	fxx := SELF:StringToReal8(cDisplay)
	SELF:fMemory += fxx
	IF SELF:fMemory = 0
		SELF:BMemClear()
	ELSE
		SELF:DoOperation("")   // Achieve default behaviour
	ENDIF
	RETURN

/****************************************************************************/
METHOD BMemMinus(cDisplay as String) AS VOID
	LOCAL fxx AS Real8
	
	fxx := SELF:StringToReal8(cDisplay)
	SELF:fMemory -= fxx
	IF SELF:fMemory = 0
		SELF:BMemClear()
	ELSE
		SELF:DoOperation("")   // Achieve default behaviour
	ENDIF
	RETURN

/****************************************************************************/
METHOD BMemTimes(cDisplay as String) AS VOID
	LOCAL fxx AS Real8
	
	fxx := SELF:StringToReal8(cDisplay)
	SELF:fMemory *= fxx
	IF SELF:fMemory = 0
		SELF:BMemClear()
	ELSE
		SELF:DoOperation("")   // Achieve default behaviour
	ENDIF
	RETURN

/****************************************************************************/
METHOD BMemRecall( ) AS String
	//p Button to recall memory
	//r STRING
	//a None
	LOCAL cResult as String
	cResult := substr2(SELF:MemoryText,3)
	SELF:DoOperation("")   // Achieve default behaviour
	
	RETURN cResult
	
/****************************************************************************/
METHOD DoOperation(sKey AS STRING) AS VOID 

	//p Method to perform the operation
	//r VOID
	//a sKey as string - Operation to perform
	LOCAL cText	AS STRING
	LOCAL nPos	AS LONG
	
	// Here is where we perform the calculation iterations.
	DO CASE
		CASE SELF:lError
			// Do nothing!
			RETURN	// we don't want to set the lsessionchange on nothing
		CASE "Cc":IndexOF(sKey) > -1 // gcs 16/07/00
			SELF:BClear()
		CASE "S":IndexOF(sKey) > -1 .and. (nOpLevel==1)
			SELF:fXX        := SELF:StringToReal8(SELF:sValue)
			fZZ             := SQRT(SELF:fXX)
			SELF:sValue     := SELF:Real8ToString(SELF:fZZ)
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel   := 1		// go back to first operand
		CASE "S":IndexOF(sKey) > -1 .and. (nOpLevel==2)
			SELF:fYY        := SELF:StringToReal8(SELF:sValue)
			fZZ             := SQRT(fYY)
			SELF:sValue     := SELF:Real8ToString(SELF:fZZ)
			SELF:nEditLevel := 0	            // edit the next entry
			SELF:nOpLevel   := 2		        // go back to first operand
		CASE "I":IndexOF(sKey) > -1 .and. (nOpLevel==1)
			SELF:fXX        := SELF:StringToReal8(SELF:sValue)
			fZZ             := SELF:MyDiv(1.0, fXX)
			SELF:sValue     := SELF:Real8ToString(fZZ)
			SELF:nEditLevel := 0	            // edit the next entry
			SELF:nOpLevel   := 1		        // go back to first operand
		CASE "I":IndexOF(sKey) > -1 .and. (nOpLevel==2)
			SELF:fYY        := SELF:StringToReal8(SELF:sValue)
			fZZ             := SELF:MyDiv(1.0, SELF:fYY)
			SELF:sValue     := SELF:Real8ToString(SELF:fZZ)
			SELF:nEditLevel := 0	            // edit the next entry
			SELF:nOpLevel   := 2		        // go back to first operand
		CASE "^%*+/-":IndexOF(sKey) > -1 .and. (nOpLevel==1)
			SELF:nOpLevel   := 2				// advance to second operand
			SELF:nEditLevel := 0
			SELF:sOp1       := sKey				// save the operation type
			SELF:fXX        := SELF:StringToReal8(SELF:sValue)
		CASE "=":IndexOF(sKey) > -1 .and. (nOpLevel==1)       // accumulation		// gcs 16/07/00			
			SELF:fYY := SELF:StringToReal8(SELF:sValue)                     // gcs 16/07/00
			DO CASE														    // gcs 16/07/00
				CASE sOP1=="%"  ;   SELF:fZZ := SELF:fYY * (SELF:fXX/100.0)			// gcs 16/07/00
				CASE sOP1=="^"  ;   SELF:fZZ := SELF:fXX ^ SELF:fYY					// gcs 16/07/00 // wcm 2007-0709 removed to get rightSLE to compile. put back in when the compiler supports this
				CASE sOP1=="+"  ;   SELF:fZZ := SELF:fXX + SELF:fYY					// gcs 16/07/00
				CASE sOP1=="/"  ;	SELF:fZZ := SELF:MyDiv(SELF:fXX, SELF:fYY)			// gcs 16/07/00
				CASE sOP1=="-"  ;   SELF:fZZ := SELF:fXX - SELF:fYY					// gcs 16/07/00
				CASE sOP1=="*"  ;   SELF:fZZ := SELF:fXX * SELF:fYY					// gcs 16/07/00
			ENDCASE			
			cText 				:= SELF:Real8ToString(SELF:fZZ)		                // gcs 16/07/00
			SELF:sValue			:= 	cText
			SELF:fXX 			:= SELF:StringToReal8(SELF:sValue)                   // gcs 16/07/00
			SELF:nEditLevel 	:= 1	// edit the next entry				        // wcm 01/29/2001
			SELF:nOpLevel 		:= 1		// go back to first operand			    // gcs 16/07/00
		CASE "=":IndexOF(sKey) > -1 .and. (nOpLevel==2)   // perform the last operation			
			SELF:fYY := SELF:StringToReal8(SELF:sValue)
			DO CASE
				CASE sOP1=="%"  ;   SELF:fZZ := SELF:fYY * (SELF:fXX/100.0)
				CASE sOP1=="^"  ;   SELF:fZZ := SELF:fXX ^ SELF:fYY // wcm 2007-0709 removed to get rightSLE to compile. put back in when the compiler supports this
				CASE sOP1=="+"  ;   SELF:fZZ := SELF:fXX + SELF:fYY
				CASE sOP1=="/"  ;	SELF:fZZ := SELF:MyDiv(SELF:fXX, SELF:fYY)
				CASE sOP1=="-"  ;   SELF:fZZ := SELF:fXX - SELF:fYY
				CASE sOP1=="*"  ;   SELF:fZZ := SELF:fXX * SELF:fYY
			ENDCASE
			cText 				:= SELF:Real8ToString(SELF:fZZ)		// gcs 16/07/00
			SELF:sValue			:= cText
			SELF:nEditLevel     := 1	    // edit the next entry wcm01/29/2001
			SELF:nOpLevel       := 1		// go back to first operand
		CASE "+/-*":IndexOF(sKey) > -1 .and. (nOpLevel==2)   // perform the last operation and return new one
			SELF:fYY := SELF:StringToReal8(SELF:sValue)
			DO CASE
				CASE sOP1=="%"  ;   SELF:fZZ := SELF:fYY * (SELF:fXX/100.0)
				CASE sOP1=="^"  ;   SELF:fZZ := SELF:fXX ^ SELF:fYY // wcm 2007-0709 removed to get rightSLE to compile. put back in when the compiler supports this
				CASE sOP1=="+"  ;   SELF:fZZ := SELF:fXX + SELF:fYY
				CASE sOP1=="/"  ;	SELF:fZZ := SELF:MyDiv(SELF:fXX, SELF:fYY)
				CASE sOP1=="-"  ;   SELF:fZZ := SELF:fXX - SELF:fYY
				CASE sOP1=="*"  ;   SELF:fZZ := SELF:fXX * SELF:fYY
			ENDCASE
			SELF:sValue     := SELF:Real8ToString(SELF:fZZ)
			SELF:fXX        := SELF:StringToReal8(SELF:sValue)	        // gcs 16/07/00
			SELF:nEditLevel := 0	                                    // edit the next entry
			SELF:nOpLevel   := 2		                                // stay at second operand
			SELF:sOp1       := sKey
		CASE "%":IndexOF(sKey) > -1 .and. (nOpLevel==2)                       // perform the last operation with "Y" % of the first value
			SELF:fYY := SELF:fXX/100.0 *SELF:StringToReal8(SELF:sValue) // gets y% of X first
			DO CASE
				CASE sOP1=="%"  ;   SELF:fZZ := SELF:fYY * (SELF:fXX/100.0)
				CASE sOP1=="^"  ;   SELF:fZZ := SELF:fXX ^ SELF:fYY     // wcm 2007-0709 removed to get rightSLE to compile. put back in when the compiler supports this
				CASE sOP1=="+"  ;   SELF:fZZ := SELF:fXX + SELF:fYY
				CASE sOP1=="/"  ;	SELF:fZZ := SELF:MyDiv(SELF:fXX, SELF:fYY)
				CASE sOP1=="-"  ;   SELF:fZZ := SELF:fXX - SELF:fYY
				CASE sOP1=="*"  ;   SELF:fZZ := SELF:fXX * SELF:fYY
			ENDCASE
			SELF:sValue     := SELF:Real8ToString(SELF:fZZ)
			SELF:nEditLevel := 0	                                    // edit the next entry
			SELF:nOpLevel   := 1		                                // go back to first operand
	ENDCASE
	IF !("=":IndexOF(sKey) > -1)
		// reset the enter logic if they enter any operation other than enter
		SELF:lEnter := FALSE
	ENDIF

	IF "+/-*=C":IndexOF(sKey) > -1
		// reposition the cursor to the left of the decimal
		nPos 	:= (long)At2(SELF:cDecSep,SELF:sValue)
		IF nPos > 0
			// set the cursor before the decimal Sep
			nPos--
		ELSE
			// set it at the end of the sle
			nPos := SELF:sValue:Length
		ENDIF
//		PostMessage(SELF:Handle(), EM_SETSEL, nPos,LONGINT(_CAST,nPos))					
	ENDIF

	SELF:lSessionChange := TRUE


	RETURN

/****************************************************************************/
METHOD Real8ToString (fFloatVal AS real8) AS STRING 

	//p Method to convert a float to a string
	//r String
	//a fFloatVal as float - value to convert
	
	LOCAL sFloatResult  AS STRING
	LOCAL dwDecPlaces   AS DWORD
	LOCAL dwIntegerSize AS DWORD
	LOCAL fThisNumber   AS real8
	
	sFloatResult  := ""
	
	dwIntegerSize := SLen( LTrim( Str3( Integer( fFloatVal ),nCONST_MAX_INTEGER_ACCURACY,0))) + 1 // have to account for the decimal place
	dwDecPlaces   := nCONST_MAX_NUMERIC_ACCURACY - dwIntegerSize
	fThisNumber   := System.Math.Abs( fFloatVal )
	
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
	  IF sFloatResult:IndexOf(".") > -1
		 // First strip out end zeros except last one after "."
		 DO WHILE Right(sFloatResult,1)=="0"  // don't worry about all other instances
			dwDecPlaces:= ( dword ) sFloatResult:Length - At(".", sFloatResult )
			IF dwDecPlaces > 0 .and. Right(sFloatResult,1)=="0"
			   sFloatResult := SubStr3( sFloatResult, 1, (dword)sFloatResult:Length -1 )
			   dwDecPlaces--
			ENDIF
		 ENDDO
	  ENDIF
	  SetDecimal( dwDecPlaces )   // reset this value
	ENDIF
	
	RETURN sFloatResult

/****************************************************************************/    
METHOD initcalc() AS VOID 

	//p Method to setup the calculator back to default values
	//r Void
	
	SELF:fXX 		:= 0
	SELF:fYY 		:= 0
	SELF:fZZ 		:= 0
	SELF:nDecimals 	:= 2
	SELF:sOp1 		:= "+"
	//SELF:fMemory 	:= 0
	SELF:nEditLevel := 1			// 0 clears the display
	SELF:nOpLevel 	:= 1
	SELF:sValue 	:= ""
	SELF:lError 	:= FALSE
	SELF:lSessionChange	:= FALSE
	
	SELF:OldFixed 	:= SetFixed(FALSE)   // allow any decimal places appropriate
	SetScience(FALSE)
	
	RETURN
	
/****************************************************************************/	
METHOD MyDiv (fInXVal AS real8, fInYVal AS real8) AS real8

	//p custom divison to advoid runtime error
	//r float
	//a fInXval as float - Left side of the operation \line
	//a fInYval as float - right side of the operation \line


	LOCAL Result AS real8

	IF fInYVal=0
		SELF:lError := TRUE
		Result := 0
	ELSE
	   Result := fInXVal / fInYVal
	ENDIF

	RETURN Result

/****************************************************************************/ 	
METHOD ProcessEnter() AS LOGIC
	//p custom enter key handler for the inline calc
	//r LOGIC
	//a None
	LOCAL lResult   AS LOGIC
	IF !SELF:lenter .and. SELF:lSessionChange .and. SELF:nOpLevel > 1  // wcm 2006-05-10 changed so it on first opp only, process the normal enter key
		SELF:DoOperation("=")
		SELF:lEnter := TRUE
		lResult     := TRUE
	ELSE
		SELF:lEnter := FALSE
		lResult     := FALSE
	ENDIF
	// Don't print this, so merely return
	RETURN lResult

/****************************************************************************/
METHOD StringToReal8(sDisplay AS STRING ) AS real8

	//p Method to convert a string to a float
	//r float
	//a sDisplay as string - value to convert

	
	/// Convert string value into number
	LOCAL Result 	AS FLOAT
	LOCAL nCurrDec 	AS DWORD
	
	Result := 0.0
	
	IF !SELF:lError
		IF sDisplay:IndexOf(".") > -1
			nCurrDec := Len(sDisplay)-At(".",sDisplay)
			IF nCurrDec>SetDecimal()
				SetDecimal(nCurrDec)   // try and reset to be larger
			ENDIF
		ENDIF
		result := Unformat(sDisplay,"999999999999999999.999999","n")
		
//		Result := Val(sDisplay)
	ENDIF
	
	RETURN Result
	
/****************************************************************************/
ACCESS Text as String
	RETURN SELF:sValue

/****************************************************************************/
ASSIGN Text(cText as String) as VOID
	SELF:sValue := cText
	RETURN

/****************************************************************************/
Assign EditLevel(nVar as long) as VOID
	SELF:nEditLevel := nVar
	RETURN    

/****************************************************************************/
ACCESS Memory as Real8
	RETURN SELF:fMemory

/****************************************************************************/
Assign Memory(fVal as Real8) as Void
	SELF:fMemory := fVal
	RETURN    

/****************************************************************************/
Access MemoryText as String
	local cResult as String
	cResult := "M="+Right(Space(10)+SELF:Real8ToString(SELF:fMemory),18)
	return cResult

END Class