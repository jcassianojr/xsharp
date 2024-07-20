// dlgPopupCalc.prg
#USING System.Windows.Forms
#USING System.Drawing

CLASS dlgPopupCalc INHERIT _dlgPopupCalc
	//l default Dialog to display the calculator
	//p default Dialog to display the calculator
	//d	dialog to bring up when a calcSLE is double clicked.  
	PROTECT oOwner              AS Object
	PROTECT oCalcSLE            AS rightSLE
	PROTECt oCalculator         AS Calculator
	PROTECT sExport             AS String

/****************************************************************************/
CONSTRUCTOR()
	  SUPER()
	  SELF:oCalcSLE := rightSLE{}
	  RETURN

/****************************************************************************/
CONSTRUCTOR(oOwningForm as Object, oCalc as rightSLE)
	  SUPER()
	  SELF:oCalcSLE := oCalc
	  SELF:oOwner   := oOwningForm
	  SELF:SetupDlg()
	  RETURN

/****************************************************************************/
CONSTRUCTOR(oCalc as rightSLE)
	  SUPER()
	  SELF:oCalcSLE := oCalc
	  RETURN
   
/****************************************************************************/    
METHOD SetupDlg()  AS VOID		
	LOCAL cText AS String
	Try	
		cText                   := SELF:oCalcSLE:RemoveFormatting(SELF:oCalcSLE:Text)
		SELF:oCalculator        := Calculator{}
		SELF:WireEvents()
		SELF:oCalculator:Text   := cText
		SELF:txtcalcSLE:text    := SELF:oCalculator:Text
		SELF:ftMemory:Text      := ""	
	Catch ex as Exception
		 MessageBox.Show(ex:Message)
	END Try
	RETURN 

/****************************************************************************/    
Method WireEvents() as VOID
	SELF:txtCalcSLE:KeyPress += System.Windows.Forms.KeyPressEventHandler{ SELF, @txtCalcSLE_KeyPress() }
	SELF:BMemRecall:Click += System.EventHandler{ SELF, @BMemRecall_Click() }
	SELF:BMemPlus:Click += System.EventHandler{ SELF, @BMemPlus_Click() }
	SELF:BMemMinus:Click += System.EventHandler{ SELF, @BMemMinus_Click() }
	SELF:BMemTimes:Click += System.EventHandler{ SELF, @BMemTimes_Click() }
	SELF:BMemClear:Click += System.EventHandler{ SELF, @BMemClear_Click() }
	SELF:BPower:Click += System.EventHandler{ SELF, @BPower_Click() }
	SELF:BInvert:Click += System.EventHandler{ SELF, @BInvert_Click() }
	SELF:BDot:Click += System.EventHandler{ SELF, @BDot_Click() }
	SELF:BClear:Click += System.EventHandler{ SELF, @BClear_Click() }
	SELF:BClearEntry:Click += System.EventHandler{ SELF, @BClearEntry_Click() }
	SELF:BPlus:Click += System.EventHandler{ SELF, @BPlus_Click() }
	SELF:BPlusMinus:Click += System.EventHandler{ SELF, @BPlusMinus_Click() }
	SELF:BMinus:Click += System.EventHandler{ SELF, @BMinus_Click() }
	SELF:BTimes:Click += System.EventHandler{ SELF, @BTimes_Click() }
	SELF:BDivide:Click += System.EventHandler{ SELF, @BDivide_Click() }
	SELF:BPercent:Click += System.EventHandler{ SELF, @BPercent_Click() }
	SELF:BSquareRoot:Click += System.EventHandler{ SELF, @BSquareRoot_Click() }
	SELF:BEquals:Click += System.EventHandler{ SELF, @BEquals_Click() }
	SELF:B0:Click += System.EventHandler{ SELF, @B0_Click() }
	SELF:B1:Click += System.EventHandler{ SELF, @B1_Click() }
	SELF:B2:Click += System.EventHandler{ SELF, @B2_Click() }
	SELF:B3:Click += System.EventHandler{ SELF, @B3_Click() }
	SELF:B4:Click += System.EventHandler{ SELF, @B4_Click() }
	SELF:B5:Click += System.EventHandler{ SELF, @B5_Click() }
	SELF:B6:Click += System.EventHandler{ SELF, @B6_Click() }
	SELF:B7:Click += System.EventHandler{ SELF, @B7_Click() }
	SELF:B8:Click += System.EventHandler{ SELF, @B8_Click() }
	SELF:B9:Click += System.EventHandler{ SELF, @B9_Click() }
	
	// out quit and save buttons
	SELF:QuitButton:Click += System.EventHandler{ SELF, @QuitButton_Click() }
	SELF:SaveExitButton:Click += System.EventHandler{ SELF, @SaveExitButton_Click() }
	RETURN

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD txtCalcSLE_KeyPress( sender AS OBJECT, e AS System.Windows.Forms.KeyPressEventArgs ) AS VOID
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
ACCESS Value as String
	RETURN Self:sExport
	
/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BMemClear_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:BMemClear()
	SELF:ftMemory:Text := ""
	SELF:oCalculator:DoOperation("")
	RETURN
#pragma warnings( 3009, on )
	
/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BMemMinus_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:BMemMinus(SELF:txtCalcSLE:Text)    
	SELF:ftMemory:Text := SELF:oCalculator:MemoryText
	RETURN
#pragma warnings( 3009, on )
	
/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BMemPlus_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:BMemPlus(SELF:txtCalcSLE:Text)    
	SELF:ftMemory:Text := SELF:oCalculator:MemoryText
	RETURN
#pragma warnings( 3009, on )
	
/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BMemRecall_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:txtCalcSLE:Text := SELF:oCalculator:BMemRecall()
	RETURN
#pragma warnings( 3009, on )
	
/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BMemTimes_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:BMemTimes(SELF:txtCalcSLE:Text)    
	SELF:ftMemory:Text := SELF:oCalculator:MemoryText
	RETURN
#pragma warnings( 3009, on )
	
/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BPower_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:Text   := SELF:oCalcSLE:RemoveFormatting(SELF:txtCalcSLE:Text)
	SELF:oCalculator:DoOperation("^")
	RETURN
#pragma warnings( 3009, on )
	
/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BInvert_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:Text   := SELF:oCalcSLE:RemoveFormatting(SELF:txtCalcSLE:Text)
	SELF:oCalculator:DoOperation("I")
	SELF:txtCalcSLE:Text := SELF:oCalculator:Text	
	RETURN
#pragma warnings( 3009, on )
	
/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BDot_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:HandleNumber(".")
	RETURN
#pragma warnings( 3009, on )
	
/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BClear_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:initcalc()     // reset display
	SELF:oCalculator:EditLevel := 0
	SELF:txtcalcSLE:text := SELF:oCalculator:Text	
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BClearEntry_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:EditLevel := 0
	SELF:oCalculator:AutoClear()
	SELF:txtcalcSLE:text := SELF:oCalculator:Text	
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BPlus_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:Text   := SELF:oCalcSLE:RemoveFormatting(SELF:txtCalcSLE:Text)
	SELF:oCalculator:DoOperation("+")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BPlusMinus_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	IF !empty(SELF:txtcalcSLE:Text)
		if left(SELF:txtcalcSLE:Text,1) == "-"
			SELF:txtcalcSLE:text := SubStr(SELF:txtcalcSLE:text, 2)
		ELSE
			SELF:txtcalcSLE:text := "-" + SELF:txtcalcSLE:text
		ENDIF
		SELF:oCalculator:DoOperation("")
	ENDIF
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BMinus_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:Text   := SELF:oCalcSLE:RemoveFormatting(SELF:txtCalcSLE:Text)
	SELF:oCalculator:DoOperation("-")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BSquareRoot_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:Text   := SELF:oCalcSLE:RemoveFormatting(SELF:txtCalcSLE:Text)
	SELF:oCalculator:DoOperation("S")
	SELF:txtCalcSLE:Text := SELF:oCalculator:Text
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BTimes_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:Text   := SELF:oCalcSLE:RemoveFormatting(SELF:txtCalcSLE:Text)
	SELF:oCalculator:DoOperation("*")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BDivide_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:Text   := SELF:oCalcSLE:RemoveFormatting(SELF:txtCalcSLE:Text)
	SELF:oCalculator:DoOperation("/")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BPercent_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:Text   := SELF:oCalcSLE:RemoveFormatting(SELF:txtCalcSLE:Text)
	SELF:oCalculator:DoOperation("%")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD BEquals_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:Text   := SELF:oCalcSLE:RemoveFormatting(SELF:txtCalcSLE:Text)
	SELF:oCalculator:DoOperation("=")
	SELF:txtcalcSLE:text := SELF:oCalculator:Text	
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD B0_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:HandleNumber("0")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD B1_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:HandleNumber("1")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD B2_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:HandleNumber("2")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD B3_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:HandleNumber("3")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD B4_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:HandleNumber("4")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD B5_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:HandleNumber("5")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD B6_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:HandleNumber("6")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD B7_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:HandleNumber("7")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD B8_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:HandleNumber("8")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD B9_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:HandleNumber("9")
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
METHOD HandleNumber(cKey as String) AS VOID
	local lResult as logic
	lResult := SELF:oCalculator:AutoClear()
	IF lResult
		SELF:txtCalcSLE:text    := ""
	ENDIF
	SELF:txtcalcSLE:text += cKey
	RETURN

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD QuitButton_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:close()
	RETURN
#pragma warnings( 3009, on )

/****************************************************************************/    
#pragma warnings( 3009, off )
METHOD SaveExitButton_Click( sender AS OBJECT, e AS System.EventArgs ) AS VOID
	SELF:oCalculator:Text   := SELF:oCalcSLE:RemoveFormatting(SELF:txtCalcSLE:Text)
	if SELF:oCalculator:FinalCheck()
		SELF:txtcalcSLE:text := SELF:oCalculator:Text	
	ENDIF        
	SELF:sExport    := SELF:txtCalcSLE:Text	                // save our value out so the calling program can pick it up
	SELF:close()
	RETURN
#pragma warnings( 3009, on )
	
END CLASS