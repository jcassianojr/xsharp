

// begin namespace wmGUI
#INCLUDE "rightSLE.vh"

INTERNAL _DLL FUNCTION GetWindowRect(hwnd AS IntPTR, lpRect REF rightSLE.INTERNAL.winRECT) AS LOGIC PASCAL:USER32.GetWindowRect
INTERNAL _DLL FUNCTION MoveWindow(hwnd AS IntPTR,  x AS INT, y AS INT,  nWidth AS INT,  nHeight AS INT,  bRepaint AS LOGIC) AS LOGIC PASCAL:USER32.MoveWindow
INTERNAL _DLL FUNCTION SystemParametersInfo(uiAction AS DWORD, uiParam AS DWORD, pvParam REF rightSLE.INTERNAL.winRECT,	fWinIni AS DWORD) AS LOGIC PASCAL:USER32.SystemParametersInfoA

#DEFINE EM_SETSEL 0x00B1


#USING System.Windows.Forms
#USING System.Globalization
#USING System.ComponentModel
#USING System.Drawing
#USING System.IO
#USING System.Resources
#USING System.Reflection
#USING rightSLE.INTERNAL

CLASS rightSLE INHERIT SLE
#REGION "   IVARS   "
	PROTECT oPB                   AS SLEButton
	PROTECT oOwner                AS OBJECT 
	PROTECT cTemplateChar		  AS STRING
	PROTECT nLastPosition         AS LONG       // Last Position when lost focus
	PROTECT cDecSep               AS STRING
	PROTECT cThousSep             AS STRING
	PROTECT cCurSymbol            AS STRING
	

#ENDREGION
#REGION "   CONSTRUCTORS   "
/****************************************************************************/
CONSTRUCTOR()
	LOCAL oMenu             AS ContextMenu
	LOCAL oMenuItem         AS MenuItem
	LOCAL numberFormat      AS NumberFormatInfo
	TRY    
		SUPER()
		numberFormat            := NumberFormatInfo.CurrentInfo
		SELF:cDecSep            := numberFormat:NumberDecimalSeparator
		SELF:cThousSep          := numberFormat:NumberGroupSeparator
		SELF:cCurSymbol         := numberFormat:CurrencySymbol
		SELF:cTemplateChar      := SELF:cThousSep + SELF:cCurSymbol + "()$ "  
		
		//create the menu
		oMenu   := ContextMenu{}
		
		// build our context menu
		oMenuItem       := MenuItem{}
		oMenuItem:Text  := rightSLEStrings.Cut
		oMenuItem:Click += System.EventHandler{ SELF , @CutCopyMenuClick() }
		oMenu:MenuItems:Add(oMenuItem)

		oMenuItem       := MenuItem{}
		oMenuItem:Text  := rightSLEStrings.Copy
		oMenuItem:Click += System.EventHandler{ SELF , @CutCopyMenuClick() }
		oMenu:MenuItems:Add(oMenuItem)

		oMenuItem       := MenuItem{}
		oMenuItem:Text  := rightSLEStrings.Paste
		oMenuItem:Click += System.EventHandler{ SELF , @CutCopyMenuClick() }
		oMenu:MenuItems:Add(oMenuItem)

		oMenuItem       := MenuItem{}
		oMenuItem:Text  := rightSLEStrings.Undo
		oMenuItem:Click += System.EventHandler{ SELF , @CutCopyMenuClick() }
		oMenu:MenuItems:Add(oMenuItem)
		
		// add the menu to the SLE
		SELF:ContextMenu := oMenu
	CATCH ex AS Exception
		MessageBox.Show(ex:Message)
	END TRY
	
	RETURN    
#ENDREGION
#REGION "   EVENT HANDLERS   "
/****************************************************************************/
#PRAGMA warnings( 3009, off )
METHOD CutCopyMenuClick(o AS OBJECT, e AS System.EventArgs) AS VOID 
	LOCAL oMenuItem AS MenuItem
	LOCAL cMenuText AS STRING
	LOCAL cTemp     AS STRING
	TRY
		oMenuItem   := (MenuItem)o
		cMenuText   := oMenuItem:Text:ToUpper()
		DO CASE
			CASE cMenuText == rightSLEStrings.Cut:ToUpper()
				SELF:Cut()
				IF SELF:oEditString <> NULL                    
					cTemp                   := SELF:Text
					SELF:oEditString:Text   := cTemp
				ENDIF
			CASE cMenuText == rightSLEStrings.Copy:ToUpper()
				SELF:Copy()
			CASE cMenuText == rightSLEStrings.Paste:ToUpper()
				SELF:Paste()
				IF SELF:oEditString <> NULL                    
					cTemp                   := SELF:Text
					SELF:oEditString:Text   := SELF:Text
				ENDIF
			CASE cMenuText == rightSLEStrings.Undo:ToUpper()
				SELF:Undo()
				IF SELF:oEditString <> NULL                    
					cTemp                   := SELF:Text
					SELF:oEditString:Text   := cTemp
				ENDIF
		ENDCASE
    catch
        ///todo add catch
	END TRY	    
	
	RETURN
#PRAGMA warnings( 3009, on )

/****************************************************************************/
#PRAGMA warnings( 3009, off )
PROTECTED METHOD OnParentChanged(e AS EventArgs) AS VOID     
	IF !SELF:DesignMode
		IF SELF:oPB <> NULL_OBJECT
			// button height and width
			SELF:Parent:Controls:Add(SELF:oPB)
		ENDIF
//    ELSE
//        super:onParentChanged(e)
	ENDIF
	SUPER:onParentChanged(e)
	RETURN
#PRAGMA warnings( 3009, on )

#PRAGMA warnings( 3009, off )
// ****************************************************************************

PROTECTED METHOD OnEnabledChanged(e AS EventArgs) AS VOID 
	IF !SELF:DesignMode
		IF SELF:oPB <> NULL_OBJECT
			SELF:oPB:Enabled := SELF:Enabled
		ENDIF
	ENDIF
	SUPER:OnEnabledChanged(e)
	RETURN        
#PRAGMA warnings( 3009, on )

#PRAGMA warnings( 3009, off )
/****************************************************************************/
PROTECTED METHOD OnVisibleChanged(e AS EventArgs) AS VOID 
	IF !SELF:DesignMode
		IF SELF:oPB <> NULL_OBJECT
			SELF:oPB:Visible := SELF:Visible
		ENDIF
	ENDIF
	SUPER:onVisibleChanged(e)
	RETURN        
#PRAGMA warnings( 3009, on )

/****************************************************************************/
PROTECTED METHOD OnGotFocus(e AS EventArgs) AS VOID 
	LOCAL nFocusMethod  AS focusBehavior
	LOCAL nTextLength   AS LONG
	LOCAL iPos          AS LONG

	SUPER:onGotFocus(e)         // this used to be at the end of the method
	
	nFocusMethod    := SELF:EffectiveSelectionOnFocus
	nTextLength     := SELF:text:length    
	DO CASE
		CASE nFocusMethod == focusbehavior.ALL
			SELF:SelectAll()
			PostMessage(SELF:Handle,EM_SETSEL,0,nTextLength)
		CASE nFocusMethod == focusBehavior.Home
			SELF:SelectionStart := 0
			IF (SELF:oEditString != NULL_OBJECT)
				iPos := 1
				IF !SELF:oEditString:IsEditPos(iPos)
					iPos := SELF:oEditString:NextEditPos(iPos)
				ENDIF
				iPos--
			ENDIF
			PostMessage(SELF:Handle, EM_SETSEL, (DWORD)iPos, iPos)
		CASE nFocusMethod == focusBehavior.END
			SELF:SelectionStart := nTextLength
			PostMessage(SELF:Handle, EM_SETSEL, (DWORD)nTextLength, nTextLength)
		CASE nFocusMethod == focusbehavior.Trimmed
			// **********************************************************
			// * with the trimmed version we need                       *
			// * to take the length of the trimmed value to deturmine   *
			// * where to put the cursor                                *
			// **********************************************************
			nTextLength := (INT)SELF:text:TrimEnd():Length
			SELF:SelectionStart := 0
			SELF:SelectionLength := nTextLength
			PostMessage(SELF:Handle, EM_SETSEL, (DWORD)0, nTextLength)
		CASE nFocusMethod == focusBehavior.Numeric
			IF SELF:oEditString != NULL_OBJECT
				IF SELF:oEditString:@@Type == SLEType.Numeric
					iPos := SELF:oEditString:DecimalPos - 1 // back it up one before the decimal
					IF iPos < 0
						iPos := (INT)SELF:text:TrimEnd():Length
					ENDIF
					SELF:SelectionStart := iPos
				ELSE
					iPos := 1
					IF !SELF:oEditString:IsEditPos(iPos)
						iPos := SELF:oEditString:NextEditPos(iPos)
					ENDIF
					iPos--
				ENDIF
			ELSE
				iPos := 1
			ENDIF
			PostMessage(SELF:Handle, EM_SETSEL, (DWORD)iPos, iPos)
		CASE nFocusMethod == focusBehavior.RememberLast
			IF (SELF:oEditString != NULL_OBJECT)
				iPos := SELF:nLastPosition + 1
				IF !SELF:oEditString:IsEditPos(iPos)
					iPos := SELF:oEditString:NextEditPos(iPos)
				ENDIF
				iPos--
			ENDIF
			PostMessage(SELF:Handle, EM_SETSEL, (DWORD)iPos, iPos)
	ENDCASE
	RETURN
	
/****************************************************************************/
PROTECTED METHOD OnLostFocus(e AS EventArgs) AS VOID 
	SUPER:onLostFocus(e)        // this used to be at the end of the method
	SELF:nLastPosition  := SELF:SelectionStart
	RETURN    
	
/****************************************************************************/
PROTECTED METHOD OnKeyPress(e AS System.Windows.Forms.KeyPressEventArgs) AS VOID
	LOCAL cChar AS char

	//SUPER:onKeyPress(e) // this used to be at the bottom of this method

	cChar := e:KeyChar
	IF cChar == Keys.Enter
		IF SELF:EffectiveProcessEnter == KeyHandling.Process
		   SELF:HandleEnterKey()
		   e:Handled := TRUE
		ELSEIF SELF:EffectiveProcessEnter == Keyhandling.IgnoreAndSendOn
		   e:Handled := FALSE
		ELSE
			// enter is not process so we eat the keystroke
		   e:Handled := TRUE
		ENDIF
	ENDIF

	if !e:Handled
		// if we process the super it will erase the contents of rightSLE
		SUPER:onKeyPress(e) 
	endif

	RETURN    

/****************************************************************************/
PROTECTED METHOD ProcessCmdKey(msg REF Message, keyData AS Keys) AS LOGIC 
	LOCAL lResult   AS LOGIC
	LOCAL nKeyCode  AS LONG
	LOCAL cTemp     AS STRING
	lResult := FALSE
	
	DO CASE
		CASE (keyData == Keys.Down) .OR. (keydata == Keys.Up)
			IF SELF:EffectiveProcessArrow == KeyHandling.Process
				SELF:HandleArrowKey(KeyData)
				lResult := TRUE
			ENDIF
		CASE keydata == Keys.Left .OR. Keydata == Keys.right .OR. ;
			KeyData == Keys.Home .OR. Keydata == Keys.END
			nKeyCode := keydata
			IF SELF:oEditString <> NULL
				lResult := SELF:oEditString:ProcessKeyEvent(nKeyCode,true)
			ELSE
				lResult := FALSE
			ENDIF
		CASE keydata == ( keys.Control | keys.C) 
			SELF:Copy()
			lResult := TRUE
		CASE keydata == (keys.Control | keys.V)
			SELF:Paste()
			IF SELF:oEditString <> NULL                    
				cTemp                   := SELF:Text
				SELF:oEditString:Text   := cTemp
			ENDIF
			lResult := TRUE
		CASE keydata == (keys.Control | keys.X)
			SELF:Cut()
			IF SELF:oEditString <> NULL                    
				cTemp                   := SELF:Text
				SELF:oEditString:Text   := cTemp
			ENDIF
			lResult := TRUE
		CASE keydata == (keys.Control | keys.Z)
			SELF:Undo()
			IF SELF:oEditString <> NULL                    
				cTemp                   := SELF:Text
				SELF:oEditString:Text   := cTemp
			ENDIF
			lResult := TRUE
		OTHERWISE
			lResult := SUPER:ProcessCmdKey(msg,keydata)
	ENDCASE
	
	RETURN lResult

#ENDREGION
#REGION "   METHODS   "
/****************************************************************************/
VIRTUAL METHOD HandleButton() AS VOID    
	RETURN

/****************************************************************************/
#PRAGMA warnings( 3009, off )
PROTECTED METHOD AssignImage(cImage AS STRING) AS VOID
	LOCAL oImage        AS image
	LOCAL cImageFile    AS STRING    
	LOCAL rm AS ResourceManager
	
	TRY
		IF SELF:EffectiveBitmapHandling == ImageHandling.CustomBitmap
			cImageFile  := cImage:TrimEnd() + ".bmp"
			oImage      := image.FromFile(cImageFile)
		ELSE
			// load the image
			// Need to use the ResourceManager to access the embedded resources
			// Use the base name of the resource file that was linked into the app
			rm := ResourceManager{ "wmGUI.Properties.Resources", Assembly.GetExecutingAssembly() }
			cImageFile := cImage:TrimEnd()
			oImage :=(Image)rm:GetObject(cImageFile)
		ENDIF
	
		// build the new button
		SELF:oPB                    := SLEButton{SELF}
		SELF:oPB:BackGroundImage    := oImage
		SELF:oPB:TabStop            := FALSE
		SELF:oPB:Width              := oImage:Size:Width
		SELF:oPB:Height             := oImage:size:Height
	CATCH e AS FileNotFoundException
		MessageBox.Show("Error - " + cImageFile + " was not found in the application's directory")
	END TRY
		
	RETURN
#PRAGMA warnings( 3009, on )

/****************************************************************************/
METHOD SetField(cText AS STRING,nMult AS LONGINT) AS STRING 

	//l formats the string based on the picture.
	//p formats the string based on the picture.
	//r STRING
	//a cText \tab - Text value to format. \line
	//a nMulti \tab - Multiplier to make the result positive or negative.

	LOCAL cRetString	AS STRING
	LOCAL cTmpString	AS STRING
	LOCAL nResult       AS REAL8
	
	cTmpString  := SELF:RemoveFormatting(cText)
	IF !Double.TryParse(cTmpString,nResult)
		nResult   := 0
	ENDIF    
	IF SELF:oEditString <> NULL
		cRetString := Transform(nResult * nMult,SELF:oEditString:Picture)
	ELSE		        
		cRetString := (nResult * nMult):ToString()
	ENDIF
	// wcm 2001-01-29
	// added check to see if a small negative number
	// is being entered. -0.01 should now
	// stay negative
	/*
	IF SELF:lTurnNegative .and. !Instr(":",cText)		
		IF (Val(cTmpstring)* nMult) <> 0
			SELF:lTurnNegative := FALSE
		ENDIF
	 ENDIF
	 */
	RETURN cRetString
/****************************************************************************/
METHOD RemoveFormatting(cText AS STRING) AS STRING 
	LOCAL cRetString	AS STRING
	LOCAL cTmpString	AS STRING
	LOCAL i				AS LONG
	LOCAL nStrLen		AS LONG
	LOCAL cCharToTest   AS STRING

	DO CASE
		CASE cText:IndexOf(SELF:cThousSep) > -1
			cTmpString := ""
			nStrLen  := cText:Length
			FOR i := 0 UPTO nStrLen -1
				cCharToTest := cText:Substring(i,1)
				IF (SELF:cTemplateChar:IndexOf(cCharToTest) < 0)
					IF char.IsDigit(cCharToTest ,0 )  .OR. cCharToTest == SELF:cDecSep
						cTmpString += cCharToTest
					ENDIF
				ENDIF
			NEXT
		CASE cText:IndexOf(":") > -1 // Added for ":" in picture = wem (06/15/00)
			cTmpString := ""
			nStrLen  := cText:Length
			FOR i := 0 UPTO nStrLen -1
				cCharToTest := cText:Substring(i,1)
				IF cText:Substring(i,1) <> ":"
					cTmpString += cCharToTest
				ENDIF
			NEXT
		OTHERWISE
			cTmpString := ""
			nStrLen  := cText:Length
			FOR i := 0 UPTO nStrLen -1
				cCharToTest := cText:Substring(i,1)
				IF (SELF:cTemplateChar:IndexOf(cCharToTest) < 0)
					IF char.IsDigit(cCharToTest ,0 ) .OR. cCharToTest == SELF:cDecSep
						cTmpString += cCharToTest
					ENDIF
				ENDIF
			NEXT
	ENDCASE
	cRetString := cTmpString
	RETURN cRetString

/****************************************************************************/
METHOD SetOrigin(oDW AS form) AS VOID

	//l Sets the origin of a data/dialog window
	//p Sets the origin of a data/dialog window
	//d Sets the origin of a data or dialog window to stay within the bounds
	//d of the current screen metrics.
	//r VOID
	//a oDW - DataWindow to adjust the origin. \line

	LOCAL RectOwner 		AS WinRect
	LOCAL Rect 				AS WinRect
	LOCAL siYTopCoord 		AS LONGINT
	LOCAL siYBottomCoord 	AS LONGINT
	LOCAL siXRightCoord 	AS LONGINT
	LOCAL siXCoord 			AS LONGINT
	LOCAL siYCoord 			AS LONGINT
	LOCAL siHeight, siWidth AS LONGINT

	rect            := winrect{}
	RectOwner       := WinRect{}
	GetWindowRect( SELF:Handle, Rect )
	siYBottomCoord  := Rect:Bottom + 2
	siYTopCoord     := Rect:Top - 2
	siXRightCoord   := Rect:Right - 2
	SystemParametersInfo(SPI_GETWORKAREA, 0, RectOwner, 0) // wcm 2007-03-24 change per suggestion by Camille for increasing performance
	siHeight        := oDW:Size:Height
	siWidth         := oDW:Size:Width
	
	// If we are off the bottom of the screen
	IF (( siYTopCoord + siHeight) > RectOwner:Bottom )
		// Move Up
		siYCoord    := Rect:Top - 2 - siHeight
	ELSE
		siYCoord    := Rect:Top + 2 + SELF:Size:Height
	ENDIF

	// In limited cases (640x480 screen), the dialog can be off the screen a small
	// amount if set above or below the button SLE. 	In this case, set it even with
	// the RectOwner.Bottom parameter.
	IF ( ( siYTopCoord - siHeight) < RectOwner:Top ) .AND. ( ( siYBottomCoord + siHeight) > RectOwner:Bottom )
		siYCoord    := RectOwner:Bottom - 2 - SELF:Size:Height - siHeight
	ENDIF

	// If we are off the right side of the screen
	IF ( ( siXRightCoord + siWidth ) > RectOwner:Right )
		// Move Left
		siXCoord    := Rect:Right - 2 - siWidth
	ELSE
		siXCoord    := Rect:Left + 2
	ENDIF

	oDW:Location      := point{SELF:Location:x,SELF:Location:y-oDW:size:height}
	MoveWindow( oDW:Handle, siXCoord, siYCoord, siWidth, siHeight, TRUE )
	RETURN    

/****************************************************************************/
VIRTUAL METHOD HandleEnterKey() AS VOID
	SendKeys.Send("{TAB}")
	RETURN

/****************************************************************************/
VIRTUAL METHOD HandleArrowKey(KeyData AS Keys) AS VOID
	DO CASE
		CASE KeyData = Keys.UP
			SendKeys.Send("+{TAB}")
		CASE KeyData == Keys.Down
			SendKeys.Send("{TAB}")
	ENDCASE
	RETURN  
#ENDREGION
#REGION "   ACCESS / ASSIGNS   "
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY Empty AS LOGIC
	GET
		LOCAL lResult := FALSE AS LOGIC
		IF SELF:oEditString == NULL_OBJECT
			lResult := (SELF:Text:Trim():Length == 0)
		ELSE
			lResult := SELF:oEditString:IsEmpty     // wcm 2011-10-26 Added a check for oEditString and empty will use it if it is available. otherwise the date will never properly check.
		ENDIF
		RETURN lResult
	END GET
END PROPERTY
/****************************************************************************/
PROPERTY CustomBitmapHandling AS ImageHandling
	GET
		RETURN SELF:bitmapHandling
	END GET
	SET
		SELF:bitmapHandling := VALUE
	END SET
END PROPERTY
/****************************************************************************/
PROPERTY Overwrite AS overwriteBehavior
	GET
		RETURN SELF:overwriteHandling
	END GET
	SET
		SELF:overwriteHandling := VALUE
	END SET
END PROPERTY
/****************************************************************************/
PROPERTY ProcessEnter AS KeyHandling 
	GET
		RETURN SELF:EnterHandling
	END GET
	SET
	SELF:EnterHandling := VALUE
	END SET
END PROPERTY
/****************************************************************************/
PROPERTY ProcessArrow AS KeyHandling 
	GET
		RETURN SELF:ArrowHandling
	END GET
	SET
		SELF:ArrowHandling := VALUE
	END SET
END PROPERTY
/****************************************************************************/
PROPERTY selectionOnFocus AS FocusBehavior
	GET
		RETURN SELF:focusHandling
	END GET
	SET
		SELF:focusHandling := VALUE  
	END SET
END PROPERTY
/****************************************************************************/
PROPERTY scrlMode AS scrlModeBehavior
	GET
		RETURN SELF:scrlModeHandling
	END GET
	SET
		LOCAL newvalue AS scrlModeBehavior
		newvalue              := VALUE
		SELF:scrlModeHandling := newValue
	END SET
END PROPERTY
/****************************************************************************/
PROPERTY Type AS SLEType
	GET
		RETURN nSLEType
	END GET
	SET
		LOCAL newValue AS SLEType
		newValue := VALUE
		SELF:nSLEtype := newValue
		IF !SELF:DesignMode   
			IF SELF:oEditString <> NULL_OBJECT
				IF newValue <> SLEType.Auto
					SELF:oEditString:Type := newValue
				ENDIF
			ENDIF
		ENDIF
		RETURN
	END SET
END PROPERTY
/****************************************************************************/
#PRAGMA warnings( 3009, off )
[BrowsableAttribute(FALSE)];
PROPERTY zSetButton AS KeyHandling
	GET
		RETURN KeyHandling.Auto
	END GET
	SET
		LOCAL iWidth        AS LONG
		LOCAL iHeight       AS LONG
		LOCAL iSLEX         AS LONG
		LOCAL iSLEY         AS LONG
		LOCAL iSLEWidth     AS LONG
		LOCAL iSLEHeight    AS LONG
		LOCAL oSize         AS Size
		LOCAL oPoint        AS Point

		IF !SELF:DesignMode    
			IF SELF:oPB <> NULL_OBJECT
				// button height and width
				iSLEX       := SELF:Left
				iSLEY       := SELF:Top
				iSLEWidth   := SELF:Width
				iSLEHeight  := SELF:Height
				iHeight     := iSLEHeight
				iWidth      := SELF:oPB:Size:Width
				oSize       := Size{iWidth,iHeight}
				oPoint      := Point{iSLEX +(iSLEWidth - iWidth) ,iSLEY}
			
				SELF:oPB:Size       := oSize
				SELF:oPB:Location   := oPoint
			
				// adjust the size of the SLE down
				SELF:Width  := iSLEWidth - iWidth
			ENDIF
//			SELF:lFSAddedByClass := FALSE   // clean up now that we have finished everything from the init of the control
		ENDIF
		RETURN
	END SET
END PROPERTY
#PRAGMA warnings( 3009, on )
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY Owner AS OBJECT   
	GET
		IF !SELF:DesignMode    
			SELF:oOwner := (OBJECT)SELF:FindForm()   
		ELSE
			RETURN NULL  
		ENDIF
		RETURN SELF:oOwner
	END GET
	SET
		SELF:oOwner := VALUE
	END SET
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY ZeroPad AS STRING
	GET
		LOCAL cResult   AS STRING
		LOCAL cTempText AS STRING
		IF !SELF:DesignMode    
			cTempText   := SELF:RemoveFormatting(SELF:Text)
			IF SELF:oEditString <> NULL
				cResult := cTempText:Trim():PadLeft(SELF:oEditString:TemplateLength,convert.ToChar("0"))
			ELSEIF SELF:Picture <> NULL
				cResult := cTempText:Trim():PadLeft(SELF:Picture:Length,convert.ToChar("0"))
			ELSE
				cResult := SELF:Text
			ENDIF
		ENDIF
		RETURN cResult
	END GET
END PROPERTY
#ENDREGION
END CLASS 


// end namespace