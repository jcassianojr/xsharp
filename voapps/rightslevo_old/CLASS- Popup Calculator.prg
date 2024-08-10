STATIC DEFINE _POPUPCALC_DISPLAYZ := 100
STATIC DEFINE _POPUPCALC_SAVEEXITBUTTON := 101
STATIC DEFINE _POPUPCALC_QUITBUTTON := 102
STATIC DEFINE _POPUPCALC_B7 := 103
STATIC DEFINE _POPUPCALC_B8 := 104
STATIC DEFINE _POPUPCALC_B9 := 105
STATIC DEFINE _POPUPCALC_B4 := 106
STATIC DEFINE _POPUPCALC_B5 := 107
STATIC DEFINE _POPUPCALC_B6 := 108
STATIC DEFINE _POPUPCALC_B1 := 109
STATIC DEFINE _POPUPCALC_B2 := 110
STATIC DEFINE _POPUPCALC_B3 := 111
STATIC DEFINE _POPUPCALC_B0 := 112
STATIC DEFINE _POPUPCALC_BDOT := 113
STATIC DEFINE _POPUPCALC_BPOWER := 114
STATIC DEFINE _POPUPCALC_BPERCENT := 115
STATIC DEFINE _POPUPCALC_BPLUSMINUS := 116
STATIC DEFINE _POPUPCALC_BSQUAREROOT := 117
STATIC DEFINE _POPUPCALC_BINVERT := 118
STATIC DEFINE _POPUPCALC_BTIMES := 119
STATIC DEFINE _POPUPCALC_BDIVIDE := 120
STATIC DEFINE _POPUPCALC_BMINUS := 121
STATIC DEFINE _POPUPCALC_BPLUS := 122
STATIC DEFINE _POPUPCALC_BMEMRECALL := 123
STATIC DEFINE _POPUPCALC_BMEMPLUS := 124
STATIC DEFINE _POPUPCALC_BMEMMINUS := 125
STATIC DEFINE _POPUPCALC_BMEMTIMES := 126
STATIC DEFINE _POPUPCALC_BMEMCLEAR := 127
STATIC DEFINE _POPUPCALC_BCLEARENTRY := 128
STATIC DEFINE _POPUPCALC_BCLEAR := 129
STATIC DEFINE _POPUPCALC_BEQUALS := 130
STATIC DEFINE _POPUPCALC_MEMTEXT := 131
PARTIAL CLASS _PopUpCalc INHERIT DIALOGWINDOW
	PROTECT oDCDisplayZ AS CALCSINGLELINEEDIT
	PROTECT oCCSaveExitButton AS PUSHBUTTON
	PROTECT oCCQuitButton AS PUSHBUTTON
	PROTECT oCCB7 AS PUSHBUTTON
	PROTECT oCCB8 AS PUSHBUTTON
	PROTECT oCCB9 AS PUSHBUTTON
	PROTECT oCCB4 AS PUSHBUTTON
	PROTECT oCCB5 AS PUSHBUTTON
	PROTECT oCCB6 AS PUSHBUTTON
	PROTECT oCCB1 AS PUSHBUTTON
	PROTECT oCCB2 AS PUSHBUTTON
	PROTECT oCCB3 AS PUSHBUTTON
	PROTECT oCCB0 AS PUSHBUTTON
	PROTECT oCCBDot AS PUSHBUTTON
	PROTECT oCCBPower AS PUSHBUTTON
	PROTECT oCCBPercent AS PUSHBUTTON
	PROTECT oCCBPlusMinus AS PUSHBUTTON
	PROTECT oCCBSquareRoot AS PUSHBUTTON
	PROTECT oCCBInvert AS PUSHBUTTON
	PROTECT oCCBtimes AS PUSHBUTTON
	PROTECT oCCBdivide AS PUSHBUTTON
	PROTECT oCCBMinus AS PUSHBUTTON
	PROTECT oCCBPlus AS PUSHBUTTON
	PROTECT oCCBMemRecall AS PUSHBUTTON
	PROTECT oCCBMemPlus AS PUSHBUTTON
	PROTECT oCCBMemMinus AS PUSHBUTTON
	PROTECT oCCBMemTimes AS PUSHBUTTON
	PROTECT oCCBMemClear AS PUSHBUTTON
	PROTECT oCCBClearEntry AS PUSHBUTTON
	PROTECT oCCBClear AS PUSHBUTTON
	PROTECT oCCBEquals AS PUSHBUTTON
	PROTECT oDCMemText AS FIXEDTEXT

	// {{%UC%}} User code starts here (DO NOT remove this line)  

CONSTRUCTOR(oParent,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oParent,uExtra)

	SUPER(oParent , ResourceID{"_PopUpCalc" , _GetInst()} , TRUE)

	SELF:oDCDisplayZ := CALCSINGLELINEEDIT{SELF , ResourceID{ _POPUPCALC_DISPLAYZ  , _GetInst() } }
	SELF:oDCDisplayZ:TextColor := Color{ COLORBLUE }
	oFont := Font{  , 10 , "Microsoft Sans Serif" }
	SELF:oDCDisplayZ:Font( oFont )
	SELF:oDCDisplayZ:HyperLabel := HyperLabel{#DisplayZ , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCSaveExitButton := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_SAVEEXITBUTTON  , _GetInst() } }
	SELF:oCCSaveExitButton:HyperLabel := HyperLabel{#SaveExitButton , "SAVE/EXIT" , NULL_STRING , NULL_STRING}

	SELF:oCCQuitButton := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_QUITBUTTON  , _GetInst() } }
	SELF:oCCQuitButton:HyperLabel := HyperLabel{#QuitButton , "QUIT" , NULL_STRING , NULL_STRING}

	SELF:oCCB7 := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_B7  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCB7:Font( oFont )
	SELF:oCCB7:HyperLabel := HyperLabel{#B7 , "7" , NULL_STRING , NULL_STRING}

	SELF:oCCB8 := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_B8  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCB8:Font( oFont )
	SELF:oCCB8:HyperLabel := HyperLabel{#B8 , "8" , NULL_STRING , NULL_STRING}

	SELF:oCCB9 := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_B9  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCB9:Font( oFont )
	SELF:oCCB9:HyperLabel := HyperLabel{#B9 , "9" , NULL_STRING , NULL_STRING}

	SELF:oCCB4 := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_B4  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCB4:Font( oFont )
	SELF:oCCB4:HyperLabel := HyperLabel{#B4 , "4" , NULL_STRING , NULL_STRING}

	SELF:oCCB5 := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_B5  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCB5:Font( oFont )
	SELF:oCCB5:HyperLabel := HyperLabel{#B5 , "5" , NULL_STRING , NULL_STRING}

	SELF:oCCB6 := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_B6  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCB6:Font( oFont )
	SELF:oCCB6:HyperLabel := HyperLabel{#B6 , "6" , NULL_STRING , NULL_STRING}

	SELF:oCCB1 := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_B1  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCB1:Font( oFont )
	SELF:oCCB1:HyperLabel := HyperLabel{#B1 , "1" , NULL_STRING , NULL_STRING}

	SELF:oCCB2 := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_B2  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCB2:Font( oFont )
	SELF:oCCB2:HyperLabel := HyperLabel{#B2 , "2" , NULL_STRING , NULL_STRING}

	SELF:oCCB3 := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_B3  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCB3:Font( oFont )
	SELF:oCCB3:HyperLabel := HyperLabel{#B3 , "3" , NULL_STRING , NULL_STRING}

	SELF:oCCB0 := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_B0  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCB0:Font( oFont )
	SELF:oCCB0:HyperLabel := HyperLabel{#B0 , "0" , NULL_STRING , NULL_STRING}

	SELF:oCCBDot := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BDOT  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBDot:Font( oFont )
	SELF:oCCBDot:HyperLabel := HyperLabel{#BDot , "." , NULL_STRING , NULL_STRING}

	SELF:oCCBPower := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BPOWER  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBPower:Font( oFont )
	SELF:oCCBPower:HyperLabel := HyperLabel{#BPower , "^" , NULL_STRING , NULL_STRING}

	SELF:oCCBPercent := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BPERCENT  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBPercent:Font( oFont )
	SELF:oCCBPercent:HyperLabel := HyperLabel{#BPercent , "%" , NULL_STRING , NULL_STRING}

	SELF:oCCBPlusMinus := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BPLUSMINUS  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBPlusMinus:Font( oFont )
	SELF:oCCBPlusMinus:HyperLabel := HyperLabel{#BPlusMinus , "+/-" , NULL_STRING , NULL_STRING}

	SELF:oCCBSquareRoot := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BSQUAREROOT  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBSquareRoot:Font( oFont )
	SELF:oCCBSquareRoot:HyperLabel := HyperLabel{#BSquareRoot , "Sq" , NULL_STRING , NULL_STRING}

	SELF:oCCBInvert := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BINVERT  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBInvert:Font( oFont )
	SELF:oCCBInvert:HyperLabel := HyperLabel{#BInvert , "1/x" , NULL_STRING , NULL_STRING}

	SELF:oCCBtimes := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BTIMES  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBtimes:Font( oFont )
	SELF:oCCBtimes:HyperLabel := HyperLabel{#Btimes , "x" , NULL_STRING , NULL_STRING}

	SELF:oCCBdivide := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BDIVIDE  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBdivide:Font( oFont )
	SELF:oCCBdivide:HyperLabel := HyperLabel{#Bdivide , "/" , NULL_STRING , NULL_STRING}

	SELF:oCCBMinus := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BMINUS  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBMinus:Font( oFont )
	SELF:oCCBMinus:HyperLabel := HyperLabel{#BMinus , "-" , NULL_STRING , NULL_STRING}

	SELF:oCCBPlus := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BPLUS  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBPlus:Font( oFont )
	SELF:oCCBPlus:HyperLabel := HyperLabel{#BPlus , "+" , NULL_STRING , NULL_STRING}

	SELF:oCCBMemRecall := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BMEMRECALL  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBMemRecall:Font( oFont )
	SELF:oCCBMemRecall:HyperLabel := HyperLabel{#BMemRecall , "MR" , NULL_STRING , NULL_STRING}

	SELF:oCCBMemPlus := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BMEMPLUS  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBMemPlus:Font( oFont )
	SELF:oCCBMemPlus:HyperLabel := HyperLabel{#BMemPlus , "M+" , NULL_STRING , NULL_STRING}

	SELF:oCCBMemMinus := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BMEMMINUS  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBMemMinus:Font( oFont )
	SELF:oCCBMemMinus:HyperLabel := HyperLabel{#BMemMinus , "M-" , NULL_STRING , NULL_STRING}

	SELF:oCCBMemTimes := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BMEMTIMES  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBMemTimes:Font( oFont )
	SELF:oCCBMemTimes:HyperLabel := HyperLabel{#BMemTimes , "Mx" , NULL_STRING , NULL_STRING}

	SELF:oCCBMemClear := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BMEMCLEAR  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBMemClear:Font( oFont )
	SELF:oCCBMemClear:HyperLabel := HyperLabel{#BMemClear , "MC" , NULL_STRING , NULL_STRING}

	SELF:oCCBClearEntry := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BCLEARENTRY  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBClearEntry:Font( oFont )
	SELF:oCCBClearEntry:HyperLabel := HyperLabel{#BClearEntry , "CE" , NULL_STRING , NULL_STRING}

	SELF:oCCBClear := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BCLEAR  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBClear:Font( oFont )
	SELF:oCCBClear:HyperLabel := HyperLabel{#BClear , "C" , NULL_STRING , NULL_STRING}

	SELF:oCCBEquals := PUSHBUTTON{SELF , ResourceID{ _POPUPCALC_BEQUALS  , _GetInst() } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oCCBEquals:Font( oFont )
	SELF:oCCBEquals:HyperLabel := HyperLabel{#BEquals , "=" , NULL_STRING , NULL_STRING}

	SELF:oDCMemText := FIXEDTEXT{SELF , ResourceID{ _POPUPCALC_MEMTEXT  , _GetInst() } }
	SELF:oDCMemText:HyperLabel := HyperLabel{#MemText , "Memory Contents" , NULL_STRING , NULL_STRING}

	SELF:Caption := "Calculator"
	SELF:Background := Brush{ Color{ 181 , 181 , 106 } }
	SELF:HyperLabel := HyperLabel{#_PopUpCalc , "Calculator" , NULL_STRING , NULL_STRING}

	SELF:PostInit(oParent,uExtra)

RETURN


END CLASS

PARTIAL CLASS CalcSingleLineEdit INHERIT SingleLineEdit
	//l subclass of SingleLineEdit just for the popup calculator.
	//p subclass of SingleLineEdit just for the popup calculator.
	//d The calculator class needs a SLE that is in raw format. \line
	//d That is why it inherits from singleLineEdit instead of rightSLE. \par
	//d The output from this class will eventually feed backinto a rightSLE.

METHOD Dispatch(oEvent) 


	IF oEvent:Message = WM_GETDLGCODE .AND. oEvent:wParam = KEYENTER	// gcs - 16/07/00
		SendMessage(SELF:owner:Handle(), WM_CHAR, oEvent:wParam, 1L)
		RETURN 1L
	ENDIF
	IF oEvent:Message=WM_COMMAND .and. oEvent:WParam==KEYESCAPE
		SendMessage(SELF:owner:Handle(), WM_COMMAND, IDCANCEL, 0L)
		RETURN 1L
	ENDIF
	IF oEvent:Message=WM_CHAR
		DO CASE
			CASE Instr(CHR(oEvent:wParam), _chr(8)+"0123456789.," )
				// printable result
				SendMessage(SELF:owner:Handle(), WM_CHAR, oEvent:wParam, 0L)
			CASE Instr(CHR(oEvent:wParam), "cC+*-/=" )          		// gcs - 16/07/00
				// operation to be performed
				SendMessage(SELF:owner:Handle(), WM_CHAR, oEvent:wParam, 1L)
				RETURN 1L
			OTHERWISE
				RETURN 1L
		ENDCASE
	ENDIF

	RETURN SUPER:dispatch(oEvent)

CONSTRUCTOR(oOwner, xID, oPoint, oDimension, kStyle) 

    SUPER(oOwner, xID, oPoint, oDimension, kStyle)

    RETURN  
END CLASS

PARTIAL CLASS PopUpCalc INHERIT _PopUpCalc
// Author		: Geoff Schaller Modified by Willie Moore
// Email		: williem@bigfoot.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 22 March 2001
// --------------
//l Calculator Class
//p Calculator Class
//d This is the heart of the popup calculator. It is resonsible for drawing and
//d maintaining all information about the calculator.
//j CL:rightSLE,CL:CalcSLE,CL:pbCalcSLE,cl:InlineCalcSLE,pbInlineCalcSLE
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

  	//DECLARE METHOD autoclear,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9
  	//DECLARE METHOD bclear,bclearentry,bdivide,bdot,bequals
  	//DECLARE METHOD binvert,bmemclear,bmemminus,bmemplus
  	//DECLARE METHOD bmemrecall,bmemtimes,bminus,bpercent
  	//DECLARE METHOD bplus,bplusminus,bpower,bsquareroot,btimes
  	//DECLARE METHOD DoOperation,FloatToString,mydiv,stringtofloat
  	//DECLARE METHOD quitButton,saveexitbutton,initCalc
METHOD AutoClear() AS VOID 

	//p Method to clear the buffer
	//r VOID
	//a None

	// Clear Calculator display if Level=0
	IF SELF:nEditLevel == 0
		SELF:oDCDisplayZ:Textvalue := ""   // clear value
		SELF:nEditLevel := 1   // now allow first operand operations to take place
		SELF:lError := FALSE
	ENDIF
	RETURN
METHOD B0( ) AS VOID 

	//p Button 0
	//r VOID
	//a None

	SELF:AutoClear()
	SELF:oDCDisplayZ:TextValue += "0"
	SELF:DoOperation("")
	RETURN
METHOD B1( ) AS VOID 

	//p Button 1
	//r VOID
	//a None

	SELF:AutoClear()
	SELF:oDCDisplayZ:TextValue += "1"
	SELF:DoOperation("")
	RETURN
METHOD B2( ) AS VOID 

	//p Button 2
	//r VOID
	//a None
	
	SELF:AutoClear()
	SELF:oDCDisplayZ:TextValue += "2"
	SELF:DoOperation("")
	RETURN
METHOD B3( ) AS VOID 

	//p Button 3
	//r VOID
	//a None
	
	SELF:AutoClear()
	SELF:oDCDisplayZ:TextValue += "3"
	SELF:DoOperation("")
	RETURN
METHOD B4( ) AS VOID 

	//p Button 4
	//r VOID
	//a None
	
	SELF:AutoClear()
	SELF:oDCDisplayZ:TextValue += "4"
	SELF:DoOperation("")
	RETURN
METHOD B5( ) AS VOID 

	//p Button 5
	//r VOID
	//a None
	
	SELF:AutoClear()
	SELF:oDCDisplayZ:TextValue += "5"
	SELF:DoOperation("")
	RETURN
METHOD B6( ) AS VOID 

	//p Button 6
	//r VOID
	//a None
	
	SELF:AutoClear()
	SELF:oDCDisplayZ:TextValue += "6"
	SELF:DoOperation("")
	RETURN
METHOD B7( ) AS VOID 

	//p Button 7
	//r VOID
	//a None
	
	SELF:AutoClear()
	SELF:oDCDisplayZ:TextValue += "7"
	SELF:DoOperation("")
	RETURN
METHOD B8( ) AS VOID 

	//p Button 8
	//r VOID
	//a None

	SELF:AutoClear()
	SELF:oDCDisplayZ:TextValue += "8"
	SELF:DoOperation("")
	RETURN
METHOD B9( ) AS VOID 

	//p Button 9
	//r VOID
	//a None
	
	SELF:AutoClear()
	SELF:oDCDisplayZ:TextValue += "9"
	SELF:DoOperation("")
	RETURN
METHOD BClear( ) AS VOID 

	//p method to clear display
	//r VOID
	//a None
	
	SELF:initcalc()   // reset display
	SELF:nEditLevel := 0
	SELF:oDCDisplayZ:SetFocus()

	RETURN
METHOD BClearEntry( ) AS VOID 

	//p Button to Clear the current entry
	//r VOID
	//a None
	
	SELF:oDCDisplayZ:TextValue := "0.0"   // reset display
	SELF:nEditLevel := 0
	SELF:oDCDisplayZ:SetFocus()
	RETURN
METHOD Bdivide( ) AS VOID 

	//p Button for division
	//r VOID
	//a None
	
	SELF:DoOperation ("/")
	RETURN
METHOD BDot( ) AS VOID 

	//p Button to enter a decimal
	//r VOID
	//a None
	
	SELF:AutoClear()
	IF !Instr( ".", SELF:oDCDisplayZ:TEXTValue )
		SELF:oDCDisplayZ:TextValue := SELF:oDCDisplayZ:TEXTValue + "."
	ENDIF
	SELF:DoOperation(".")
	RETURN
 METHOD BEquals( ) AS VOID 

	//p Button for the enter key
	//r VOID
	//a None

	SELF:DoOperation ("=")
	RETURN

METHOD BInvert( ) AS VOID 

	//p Button to invert
	//r VOID
	//a None
	
	SELF:DoOperation("I")
	RETURN
METHOD BMemClear( ) AS VOID 

	//p Button to clear memory
	//r VOID
	//a None

	SELF:fMemory := 0
	SELF:oDCMemText:TextValue := ""
	SELF:DoOperation("")   // null value to obtain other deault activity
	RETURN
METHOD BMemMinus( ) AS VOID 

	//p Button to subtract from memory
	//r VOID
	//a None
	//j CL:PopupCalc

	
	LOCAL fxx AS FLOAT
	
	fxx := SELF:StringToFloat(SELF:oDCDisplayZ:TextValue)
	SELF:fMemory -= fxx
	IF SELF:fMemory = 0
		SELF:BMemClear()
	ELSE
		SELF:oDCMemText:TextValue := "M="+Right(Space(10)+SELF:FloatToString(SELF:fMemory),18)
		SELF:DoOperation("")   // Achieve default behaviour
	ENDIF
	
	RETURN
METHOD BMemPlus( ) AS VOID 

	//p Button to add to memory
	//r VOID
	//a None

	
	LOCAL fxx AS FLOAT
	
	fxx := SELF:StringToFloat(SELF:oDCDisplayZ:TextValue)
	SELF:fMemory += fxx
	IF SELF:fMemory = 0
		SELF:BMemClear()
	ELSE
		SELF:oDCMemText:TextValue := "M="+Right(Space(10)+SELF:FloatToString(SELF:fMemory),18)
		SELF:DoOperation("")   // Achieve default behaviour
	ENDIF
	
	RETURN

METHOD BMemRecall( ) AS VOID 

	//p Button to recall memory
	//r VOID
	//a None
	

	IF !Empty(SELF:fMemory)	
		SELF:oDCDisplayZ:TextValue := SubStr2(SELF:oDCMemText:TextValue,3)
	ENDIF
	SELF:DoOperation("")   // Achieve default behaviour
	
	RETURN
METHOD BMemTimes( ) AS VOID 

	//p Button to multiply memory
	//r VOID
	//a None
	
		
	LOCAL fxx AS FLOAT
	
	fxx := SELF:StringToFloat(SELF:oDCDisplayZ:TextValue)
	SELF:fMemory *= fxx
	IF SELF:fMemory = 0
		SELF:BMemClear()
	ELSE
		SELF:oDCMemText:TextValue := "M="+Right(Space(10)+SELF:FloatToString(SELF:fMemory),18)
		SELF:DoOperation("")   // Achieve default behaviour
	ENDIF
	
	RETURN

METHOD BMinus( ) AS VOID 

	//p Button to subtract
	//r VOID
	//a None
	
	SELF:DoOperation ("-")
	RETURN
METHOD BPercent( ) AS VOID 

	//p Button for percentage
	//r VOID
	//a None
	
	SELF:DoOperation("%")
	RETURN
METHOD BPlus( ) AS VOID 

	//p Button for addition
	//r VOID
	//a None
	
	SELF:DoOperation ("+")
	RETURN
METHOD BPlusMinus( ) AS VOID 

	//p Button to toggle plus minus
	//r VOID
	//a None

	
	// toggle plus/minus state
	IF !Empty(SELF:oDCDisplayZ:TextValue)
		IF Left(SELF:oDCDisplayZ:TextValue, 1) == "-"
			SELF:oDCDisplayZ:TextValue := SubStr(SELF:oDCDisplayZ:TextValue, 2)
		ELSE
			SELF:oDCDisplayZ:TextValue := "-"+SELF:oDCDisplayZ:TextValue
		ENDIF
		SELF:DoOperation("")   // get default behaviour
	ENDIF

	RETURN
METHOD BPower( ) AS VOID 

	//p Button to raise to a power
	//r VOID
	//a None
	
	SELF:DoOperation("^")
	RETURN
METHOD BSquareRoot( ) AS VOID

	//p Button for square root
	//r VOID
	//a None
	
	SELF:DoOperation("S")
	RETURN
METHOD BTimes( ) AS VOID 

	//p Button for multiplication
	//r VOID
	//a None
	
	SELF:DoOperation ("*")
	RETURN
METHOD Close(oEvent) 

	
	SetFixed(SELF:OldFixed)  // restore settings
	RETURN SUPER:Close(oEvent)

METHOD Dispatch (oEvent) 


	LOCAL sOperation AS STRING
	
	IF (oEvent:Message == WM_COMMAND) .and. (LoWord(oEvent:wParam) == IDCANCEL)
		// abort window on ESCAPE key
		SELF:EndDialog(0)
		RETURN 1l
	ENDIF
	IF (oEvent:Message == WM_CHAR)
		IF oEvent:lParam == 0L
			// Check if this is the zero'th level
			SELF:AutoClear()
		ELSE
			sOperation := CHR(LoWord(oEvent:wParam))
			IF sOperation == CHR(13)
				sOperation := "="    // send string and not the CR code
			ENDIF
			SELF:DoOperation(sOperation)
			// Don't print this, so merely return
			RETURN 1l
		ENDIF
	ENDIF
	
	RETURN SUPER:Dispatch (oEvent)
METHOD DoOperation(sKey AS STRING) AS VOID 

	//p Method to perform the operation
	//r VOID
	//a sKey as string - Operation to perform

	// Here is where we perform the calculation iterations.
	DO CASE
		CASE SELF:lError
			// Do nothing!
		CASE Instr(sKey, "Cc")										// gcs 16/07/00
			SELF:BClear()
		CASE Instr(sKey, "S") .and. (nOpLevel==1)
			SELF:fXX := SELF:StringToFloat(SELF:oDCDisplayZ:CurrentText)
			fZZ := SQRT(fXX)
			SELF:oDCDisplayZ:TextValue := SELF:FloatToString(fZZ)
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 1		// go back to first operand
		CASE Instr(sKey, "S") .and. (nOpLevel==2)
			SELF:fYY := SELF:StringToFloat(SELF:oDCDisplayZ:CurrentText)
			fZZ := SQRT(fYY)
			SELF:oDCDisplayZ:TextValue := SELF:FloatToString(fZZ)
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 2		// go back to first operand
		CASE Instr(sKey, "I") .and. (nOpLevel==1)
			SELF:fXX := SELF:StringToFloat(SELF:oDCDisplayZ:CurrentText)
			fZZ := SELF:MyDiv(1.0, fXX)
			SELF:oDCDisplayZ:TextValue := SELF:FloatToString(fZZ)
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 1		// go back to first operand
		CASE Instr(sKey, "I") .and. (nOpLevel==2)
			SELF:fYY := SELF:StringToFloat(SELF:oDCDisplayZ:CurrentText)
			fZZ := SELF:MyDiv(1.0, fYY)
			SELF:oDCDisplayZ:TextValue := SELF:FloatToString(fZZ)
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 2		// go back to first operand
		CASE Instr(sKey, "^%*+/-") .and. (nOpLevel==1)
			SELF:nOpLevel := 2				// advance to second operand
			SELF:nEditLevel := 0
			SELF:sOp1   := sKey				// save the operation type
			SELF:fXX := SELF:StringToFloat(SELF:oDCDisplayZ:CurrentText)
		CASE Instr(sKey, "=") .and. (nOpLevel==1) // accumulation		// gcs 16/07/00
			SELF:fYY := SELF:StringToFloat(SELF:oDCDisplayZ:CurrentText)// gcs 16/07/00
			DO CASE														// gcs 16/07/00
				CASE sOP1=="%"  ;   fZZ := fYY * (fXX/100.0)			// gcs 16/07/00
				CASE sOP1=="^"  ;   fZZ := fXX ^ fYY					// gcs 16/07/00 // wcm 2007-0709 removed to get rightSLE to compile. put back in when the compiler supports this
				CASE sOP1=="+"  ;   fZZ := fXX + fYY					// gcs 16/07/00
				CASE sOP1=="/"  ;	fZZ := SELF:MyDiv(fXX, fYY)			// gcs 16/07/00
				CASE sOP1=="-"  ;   fZZ := fXX - fYY					// gcs 16/07/00
				CASE sOP1=="*"  ;   fZZ := fXX * fYY					// gcs 16/07/00
			ENDCASE														// gcs 16/07/00
			SELF:oDCDisplayZ:TextValue := SELF:FloatToString(fZZ)		// gcs 16/07/00
			SELF:nEditLevel := 0	// edit the next entry				// gcs 16/07/00
			SELF:nOpLevel := 1		// go back to first operand			// gcs 16/07/00
		CASE Instr(sKey, "=") .and. (nOpLevel==2)   // perform the last operation
			SELF:fYY := SELF:StringToFloat(SELF:oDCDisplayZ:CurrentText)
			DO CASE
				CASE sOP1=="%"  ;   fZZ := fYY * (fXX/100.0)
				CASE sOP1=="^"  ;   fZZ := fXX ^ fYY // wcm 2007-0709 removed to get rightSLE to compile. put back in when the compiler supports this
				CASE sOP1=="+"  ;   fZZ := fXX + fYY
				CASE sOP1=="/"  ;	fZZ := SELF:MyDiv(fXX, fYY)
				CASE sOP1=="-"  ;   fZZ := fXX - fYY
				CASE sOP1=="*"  ;   fZZ := fXX * fYY
			ENDCASE
			SELF:oDCDisplayZ:TextValue := SELF:FloatToString(fZZ)
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 1		// go back to first operand
		CASE Instr(sKey, "+/-*") .and. (nOpLevel==2)   // perform the last operation and return new one
			SELF:fYY := SELF:StringtoFloat(SELF:oDCDisplayZ:CurrentText)
			DO CASE
				CASE sOP1=="%"  ;   fZZ := fYY * (fXX/100.0)
				CASE sOP1=="^"  ;   fZZ := fXX ^ fYY // wcm 2007-0709 removed to get rightSLE to compile. put back in when the compiler supports this
				CASE sOP1=="+"  ;   fZZ := fXX + fYY
				CASE sOP1=="/"  ;	fZZ := SELF:MyDiv(fXX, fYY)
				CASE sOP1=="-"  ;   fZZ := fXX - fYY
				CASE sOP1=="*"  ;   fZZ := fXX * fYY
			ENDCASE
			SELF:oDCDisplayZ:TextValue := SELF:FloatToString(fZZ)
			SELF:fXX := SELF:StringToFloat(SELF:oDCDisplayZ:CurrentText)	// gcs 16/07/00
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 2		// stay at second operand
			SELF:sOp1 := sKey
		CASE Instr(sKey, "%") .and. (nOpLevel==2)   // perform the last operation with "Y" % of the first value
			SELF:fYY := fXX/100.0 *SELF:StringtoFloat(SELF:oDCDisplayZ:CurrentText)  // gets y% of X first
			DO CASE
				CASE sOP1=="%"  ;   fZZ := fYY * (fXX/100.0)
				CASE sOP1=="^"  ;   fZZ := fXX ^ fYY // wcm 2007-0709 removed to get rightSLE to compile. put back in when the compiler supports this
				CASE sOP1=="+"  ;   fZZ := fXX + fYY
				CASE sOP1=="/"  ;	fZZ := SELF:MyDiv(fXX, fYY)
				CASE sOP1=="-"  ;   fZZ := fXX - fYY
				CASE sOP1=="*"  ;   fZZ := fXX * fYY
			ENDCASE
			SELF:oDCDisplayZ:TextValue := SELF:FloatToString(fZZ)
			SELF:nEditLevel := 0	// edit the next entry
			SELF:nOpLevel := 1		// go back to first operand
	ENDCASE

	// Now put focus back into edit and position cursor to end of edit
	SELF:oDCDisplayZ:SetFocus()
	SELF:oDCDisplayZ:Selection := Selection{ Len(SELF:oDCDisplayZ:CurrentText), Len(SELF:oDCDisplayZ:CurrentText) }

	RETURN

METHOD EditChange(oControlEvent) 


	// commented lines left in place for "scientific" version later
	LOCAL oControl AS Control
	LOCAL nDotPosn AS DWORD

	oControl := IIF(oControlEvent == NULL_OBJECT, NULL_OBJECT, oControlEvent:Control)
	SUPER:EditChange(oControlEvent)
	//Put your changes here
	IF oControl:NameSym == #DisplayZ
		// Check first for multiple instances of control chars
		DO CASE
			CASE Occurs(".", SELF:oDCDisplayZ:TextValue)>1 // strip out first occurrence
				nDotPosn := At(".", SELF:oDCDisplayZ:TextValue)
				IF Left(SELF:oDCDisplayZ:TextValue, 1)=="."
					SELF:oDCDisplayZ:Textvalue := SubStr(SELF:oDCDisplayZ:TextValue, 2)
				ELSE
					SELF:oDCDisplayZ:TextValue := SubStr(SELF:oDCDisplayZ:TextValue, 1, nDotPosn-1) + ;
												  SubStr(SELF:oDCDisplayZ:TextValue, nDotPosn+1)
					SELF:oDCDisplayZ:Selection := Selection{ nDotPosn, nDotPosn }
				ENDIF

		ENDCASE
		// Now fix up first position
		DO CASE
			CASE Left(SELF:oDCDisplayZ:TextValue,1) == "."   // Prepend with a zero
				SELF:oDCDisplayZ:TextValue := "0"+SELF:oDCDisplayZ:TextValue
				SELF:DoOperation("")
			CASE Left(SELF:oDCDisplayZ:TextValue,2) == "00"  // Fix up leading multiple zeros
				SELF:oDCDisplayZ:TextValue := SubStr(SELF:oDCDisplayZ:TextValue, 2)
		ENDCASE
	ENDIF

	RETURN NIL
METHOD FloatToString (fFloatVal AS FLOAT) AS STRING 

	//p Convert float to a string
	//r String
	//a fFloatVal as float - Number to convert

	LOCAL sFloatResult  AS STRING
	LOCAL dwDecPlaces   AS DWORD
	LOCAL dwIntegerSize AS DWORD
	LOCAL fThisNumber   AS FLOAT
	
	sFloatResult  := ""
	
	dwIntegerSize := SLen( LTrim( Str3( Integer( fFloatVal ),nCONST_MAX_INTEGER_ACCURACY,0)))+1	// have to add 1 to account for the decimal place
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

CONSTRUCTOR(oParent,uExtra) 

	SUPER(oParent,uExtra)
	SELF:PostInit(oParent,uExtra)
	RETURN  

METHOD initcalc() AS VOID 

	//p Method to setup the calculator back to default values
	//r Void
	
	SELF:fXX := 0
	SELF:fYY := 0
	SELF:fZZ := 0
	SELF:nDecimals := 2
	SELF:sOp1 := "+"
	SELF:nEditLevel := 0		// 0 clears the display
	SELF:nOpLevel := 1
	SELF:sExport := ""
	SELF:lError := FALSE
	SELF:oDCDisplayZ:TextValue := "0.0"   // reset display
		
	RETURN
METHOD MyDiv (fInXVal AS FLOAT, fInYVal AS FLOAT) AS FLOAT 

	//p custom Div Method to avoid runtime error
	//r Float
	//a fInxVal as float - Left hand side of the operation \line
	//a fInYVal as float - Right hand side of the operation \line


	LOCAL Result AS FLOAT

	IF fInYVal=0
		SELF:lError := TRUE
		Result := 0
	ELSE
	   Result := fInXVal / fInYVal
	ENDIF

 	RETURN Result
METHOD PostInit(oParent,uExtra)

	
	SELF:fMemory := 0		// we reset memory here as initcalc can be called from other buttons
	SELF:initcalc()
	
	IF !Empty(uExtra)
		IF IsString(uExtra)
			// convert value to float and back to filter out illegal values
			SELF:oDCDisplayZ:TextValue := SELF:FloatToString(SELF:StringToFloat(uExtra))
		ELSE
			SELF:lError := TRUE
			SELF:oDCDisplayZ:TextValue := "Error"
		ENDIF
	ENDIF
	
	SELF:BackGround := Brush{Color{190,220,190}}
	SELF:OldFixed := SetFixed(FALSE)   // allow any decimal places appropriate
	SetScience(FALSE)
	
	RETURN NIL
METHOD QuitButton( ) AS VOID 

	//p Button to quit without saving
	//r VOID
	//a None

	SELF:EndDialog(0)
	RETURN
METHOD SaveExitButton( ) AS VOID 

	//p Button to save and return value to owner
	//r VOID
	//a None

	IF Instr(SELF:sOp1, "^%*+/-") .and. (SELF:nOpLevel==2)     // Force to perform the last operation
		SELF:DoOperation("=")                                  //
	ENDIF                                                      // JR 2002/08/08

	SELF:sExport := SELF:oDCDisplayZ:TextValue
	SELF:EndDialog(1)
	RETURN
METHOD StringToFloat(sDisplay AS STRING ) AS FLOAT 

	//p Convert String back to a float
	//r Float
	//a sDisplay as string - Value to convert

	
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
		Result := Val(sDisplay)
	ENDIF
	
	RETURN Result
END CLASS

