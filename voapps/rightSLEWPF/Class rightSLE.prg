// Class_rightSLE.prg
#include "rightSLE.vh"

INTERNAL _DLL FUNCTION GetWindowRect(hwnd AS IntPTR, lpRect REF rightSLE.internal.winRECT) AS LOGIC PASCAL:USER32.GetWindowRect
INTERNAL _DLL FUNCTION MoveWindow(hwnd AS IntPTR,  x AS INT, y AS INT,  nWidth AS INT,  nHeight AS INT,  bRepaint AS LOGIC) AS LOGIC PASCAL:USER32.MoveWindow
INTERNAL _DLL FUNCTION SystemParametersInfo(uiAction AS DWORD, uiParam AS DWORD, pvParam ref rightSLE.internal.winRECT,	fWinIni AS DWORD) AS LOGIC PASCAL:USER32.SystemParametersInfoA

#define EM_SETSEL 0x00B1


#Using System.Windows.Controls
#USING System.Windows.Input
#USING System.Windows
#USING System.Globalization
#Using System.ComponentModel
#USING System.Drawing
#USING System.IO
#USING System.Resources
#USING System.Reflection
#USING rightSLE.Internal

Begin NameSpace wmGUI.wpf
CLASS rightSLE INHERIT SLE
#REGION "   IVars   "
    Protect oPB                   AS SLEButton
    PROTECT oOwner                AS OBJECT 
	PROTECT cTemplateChar		  AS STRING
	PROTECT nLastPosition         AS LONG       // Last Position when lost focus
    PROTECT cDecSep               AS string
	PROTECT cThousSep             AS string
	PROTECT cCurSymbol            AS String
	

#ENDREGION
#REGION "   Constructors   "
/****************************************************************************/
CONSTRUCTOR()
    LOCAL oMenu             AS ContextMenu
   	LOCAL oMenuItem         AS MenuItem
    local numberFormat      AS NumberFormatInfo
    Try    
        super()
        numberFormat            := NumberFormatInfo.CurrentInfo
        SELF:cDecSep            := numberFormat:NumberDecimalSeparator
        self:cThousSep          := numberFormat:NumberGroupSeparator
        self:cCurSymbol         := numberFormat:CurrencySymbol
        SELF:cTemplateChar      := self:cThousSep + SELF:cCurSymbol + "()$ "  
   	    
   	    //create the menu
   	    oMenu   := ContextMenu{}
   	    
       	// build our context menu
        oMenuItem           := MenuItem{}
        oMenuItem:Header    := rightSLEStrings.Cut
	    oMenuItem:Click     += RoutedEventHandler{ SELF , @CutCopyMenuClick() }
	    oMenu:Items:Add(oMenuItem)

        oMenuItem           := MenuItem{}
        oMenuItem:Header    := rightSLEStrings.Copy
	    oMenuItem:Click     += RoutedEventHandler{ SELF , @CutCopyMenuClick() }
	    oMenu:Items:Add(oMenuItem)

        oMenuItem           := MenuItem{}
        oMenuItem:Header    := rightSLEStrings.Paste
	    oMenuItem:Click     += RoutedEventHandler{ SELF , @CutCopyMenuClick() }
	    oMenu:Items:Add(oMenuItem)

        oMenuItem           := MenuItem{}
        oMenuItem:Header    := rightSLEStrings.Undo
	    oMenuItem:Click     += RoutedEventHandler{ SELF , @CutCopyMenuClick() }
	    oMenu:Items:Add(oMenuItem)
        
        // add the menu to the SLE
       	SELF:ContextMenu := oMenu
    catch ex as Exception
        MessageBox.Show(ex:Message)
    end try
    
    RETURN    
#ENDREGION
#REGION "   Event Handlers   "
/****************************************************************************/
#pragma warnings( 3009, off )
METHOD CutCopyMenuClick(o as Object, e as RoutedEventArgs) AS VOID 
    Local oMenuItem AS MenuItem
    Local cMenuText AS String
    LOCAL cTemp     AS String
    Try
        oMenuItem   := (MenuItem)o
        cMenuText   := oMenuItem:Header:ToString():ToUpper()
        DO CASE
            CASE cMenuText == rightSLEStrings.Cut:ToUpper()
                SELF:Cut()
                IF SELF:oEditString <> null                    
                    cTemp                   := SELF:Text
                    SELF:oEditString:Text   := cTemp
                ENDIF
            CASE cMenuText == rightSLEStrings.Copy:ToUpper()
                SELF:Copy()
            CASE cMenuText == rightSLEStrings.Paste:ToUpper()
                SELF:Paste()
                IF SELF:oEditString <> null                    
                    cTemp                   := SELF:Text
                    SELF:oEditString:Text   := SELF:Text
                ENDIF
            CASE cMenuText == rightSLEStrings.Undo:ToUpper()
                SELF:Undo()
                IF SELF:oEditString <> null                    
                    cTemp                   := SELF:Text
                    SELF:oEditString:Text   := cTemp
                ENDIF
        ENDCASE
    End Try	    
    
    RETURN
#pragma warnings( 3009, on )

/****************************************************************************/
#pragma warnings( 3009, off )
Protected METHOD OnParentChanged(e as EventArgs) as void     
//    IF !System.ComponentModel.DesignerProperties.GetIsInDesignMode(SELF)
//        IF SELF:oPB <> NULL_OBJECT
            // button height and width
//            SELF:Parent:Controls:Add(SELF:oPB)
//        ENDIF
//    ELSE
//        super:onParentChanged(e)
//    ENDIF
    RETURN
#pragma warnings( 3009, on )


/****************************************************************************/
Protected METHOD OnGotFocus(e as RoutedEventArgs) as void 
    local nFocusMethod  AS focusBehavior
    local nTextLength   AS LONG
    local iPos          AS lONG
    
    nFocusMethod    := self:EffectiveSelectionOnFocus
    nTextLength     := SELF:text:length
    do case
        case nFocusMethod == focusbehavior.ALL
            SELF:SelectAll()
			e:Handled := TRUE
            //PostMessage(SELF:Handle,EM_SETSEL,0,nTextLength)
        case nFocusMethod == focusBehavior.Home
            self:SelectionStart := 0
			IF (self:oEditString != NULL_OBJECT)
				iPos := 1
				IF !self:oEditString:IsEditPos(iPos)
					iPos := self:oEditString:NextEditPos(iPos)
				ENDIF
				iPos--
			ENDIF
			e:Handled := TRUE
			SELF:select(iPos,0)
			//PostMessage(SELF:Handle, EM_SETSEL, (DWORD)iPos, iPos)
        case nFocusMethod == focusBehavior.End
            self:SelectionStart := nTextLength
			e:Handled := TRUE
            SELF:Select(nTextLength,0)
			//PostMessage(SELF:Handle, EM_SETSEL, (DWORD)nTextLength, nTextLength)
        case nFocusMethod == focusbehavior.Trimmed
            // **********************************************************
            // * with the trimmed version we need                       *
            // * to take the length of the trimmed value to deturmine   *
            // * where to put the cursor                                *
            // **********************************************************
            nTextLength := (int)self:text:TrimEnd():Length
            SELF:SelectionStart := 0
            SELF:SelectionLength := nTextLength
			e:Handled := TRUE
            SELF:Select(0,nTextLength)
			//PostMessage(SELF:Handle, EM_SETSEL, (DWORD)0, nTextLength)
        case nFocusMethod == focusBehavior.Numeric
            IF SELF:oEditString != NULL_OBJECT
                IF SELF:oEditString:@@Type == SLEType.Numeric
                    iPos := SELF:oEditString:DecimalPos - 1 // back it up one before the decimal
                    IF iPos < 0
                        iPos := (int)self:text:TrimEnd():Length
                    ENDIF
                    self:SelectionStart := iPos
                ELSE
   				    iPos := 1
    			    IF !self:oEditString:IsEditPos(iPos)
	    			    iPos := self:oEditString:NextEditPos(iPos)
		    	    ENDIF
			        iPos--
                ENDIF
            ELSE
                iPos := 1
            ENDIF
			e:Handled := TRUE
            SELF:Select(iPos,0)
			//PostMessage(SELF:Handle, EM_SETSEL, (DWORD)iPos, iPos)
        case nFocusMethod == focusBehavior.RememberLast
			IF (self:oEditString != NULL_OBJECT)
				iPos := SELF:nLastPosition + 1
				IF !self:oEditString:IsEditPos(iPos)
					iPos := self:oEditString:NextEditPos(iPos)
				ENDIF
				iPos--
			ENDIF
			e:Handled := TRUE
			SELF:Select(iPos,0)
			//PostMessage(SELF:Handle, EM_SETSEL, (DWORD)iPos, iPos)
    endcase
    SUPER:onGotFocus(e)
    RETURN   
/****************************************************************************/

Protected METHOD OnLostFocus(e as RoutedEventArgs) as void 
    SELF:nLastPosition  := SELF:SelectionStart
    SUPER:onLostFocus(e)
    RETURN    
    
/****************************************************************************/

Protected METHOD OnPreviewKeyUp(e As System.Windows.Input.KeyEventArgs) as void
    LOCAL cChar   As char
    LOCAL lResult As Logic
 	cChar := convert.ToChar(e:Key)
// 	lResult := SELF:ProcessCmdKey(e:Key)
 	IF !lResult
        if cChar == Key.Enter
            if SELF:EffectiveProcessEnter == KeyHandling.Process
               SELF:HandleEnterKey()
               e:Handled := TRUE
            else
                // enter is not process so we eat the keystroke
               e:Handled := TRUE
            endif
        endif
    ELSE
        e:Handled := TRUE
    ENDIF
    // always call the super if we dont handle the keypress
    SUPER:onPreviewKeyUp(e)
    RETURN    

/****************************************************************************/

Protected METHOD OnPreviewKeyDown(e As System.Windows.Input.KeyEventArgs) as void
    LOCAL lResult As Logic
// 	lResult := SELF:ProcessCmdKey(e:Key)
 	IF lResult
        e:Handled := TRUE
    ENDIF
    // always call the super if we dont handle the keypress
    SUPER:onPreviewKeyDown(e)
    RETURN    

/****************************************************************************/
Protected METHOD ProcessCmdKey(keyData As Key) as logic 
    LOCAL lResult   AS Logic
    LOCAL nKeyCode  AS Long
    LOCAL cTemp     AS String
    lResult := false
    
    do case
        CASE (keyData == Key.Down) .or. (keydata == Key.Up)
            if Self:EffectiveProcessArrow == KeyHandling.Process
                self:HandleArrowKey(KeyData)
                lResult := true
            endif
        CASE keydata == Key.Left .or. Keydata == Key.right .or. ;
            KeyData == Key.Home .or. Keydata == Key.End
            nKeyCode := keydata
            IF SELF:oEditString <> NULL
                lResult := SELF:oEditString:ProcessKeyEvent(nKeyCode)
            ELSE
                lResult := FALSE
            ENDIF
        CASE keydata == ( key.LeftCtrl | key.C)
            SELF:Copy()
            lResult := true
        CASE keydata == (key.RightCtrl | key.C)
            SELF:Copy()
            lResult := true
        CASE keydata == (key.LeftCtrl | key.V)
            SELF:Paste()
            IF SELF:oEditString <> null                    
                cTemp                   := SELF:Text
                SELF:oEditString:Text   := cTemp
            ENDIF
            lResult := true
        CASE keydata == (key.RightCtrl | key.V)
            SELF:Paste()
            IF SELF:oEditString <> null                    
                cTemp                   := SELF:Text
                SELF:oEditString:Text   := cTemp
            ENDIF
            lResult := true
        CASE keydata == (key.LeftCtrl | key.X) 
            SELF:Cut()
            IF SELF:oEditString <> null                    
                cTemp                   := SELF:Text
                SELF:oEditString:Text   := cTemp
            ENDIF
            lResult := true
        CASE keydata == (key.RightCtrl | key.X)
            SELF:Cut()
            IF SELF:oEditString <> null                    
                cTemp                   := SELF:Text
                SELF:oEditString:Text   := cTemp
            ENDIF
            lResult := true
        CASE keydata == (key.LeftCtrl | key.Z) 
            SELF:Undo()
            IF SELF:oEditString <> null                    
                cTemp                   := SELF:Text
                SELF:oEditString:Text   := cTemp
            ENDIF
            lResult := true
        CASE keydata == (key.RightCtrl | key.Z)
            SELF:Undo()
            IF SELF:oEditString <> null                    
                cTemp                   := SELF:Text
                SELF:oEditString:Text   := cTemp
            ENDIF
            lResult := true
    endcase
    
    return lResult

#ENDREGION
#REGION "   Methods   "
/****************************************************************************/
VIRTUAL Method HandleButton() AS VOID    
    RETURN

/****************************************************************************/
#pragma warnings( 3009, off )
Protected Method AssignImage(cImage as string) as Void
    LOCAL oImage        AS System.Drawing.Image
    LOCAL cImageFile    AS string    
    LOCAL rm AS ResourceManager
    
    TRY
        IF SELF:EffectiveBitmapHandling == ImageHandling.CustomBitmap
            cImageFile  := cImage:TrimEnd() + ".bmp"
            oImage      := System.Drawing.image.FromFile(cImageFile)
        ELSE
            // load the image
            // Need to use the ResourceManager to access the embedded resources
            // Use the base name of the resource file that was linked into the app
            rm := ResourceManager{ "wmGUI.Properties.Resources", Assembly.GetExecutingAssembly() }
            cImageFile := cImage:TrimEnd()
            oImage :=(System.Drawing.Image)rm:GetObject(cImageFile)
        ENDIF
    
        // build the new button
        SELF:oPB                    := SLEButton{SELF}
        SELF:oPB:Content            := oImage
        SELF:oPB:isTabStop          := FALSE
        self:oPB:Width              := oImage:Size:Width
        SELF:oPB:Height             := oImage:Size:Height
    CATCH e as FileNotFoundException
        MessageBox.Show("Error - " + cImageFile + " was not found in the application's directory")
    END TRY
        
    RETURN
#pragma warnings( 3009, on )

/****************************************************************************/
METHOD SetField(cText AS STRING,nMult AS LONGINT) AS STRING 

	//l formats the string based on the picture.
	//p formats the string based on the picture.
	//r STRING
	//a cText \tab - Text value to format. \line
	//a nMulti \tab - Multiplier to make the result positive or negative.

	LOCAL cRetString	AS STRING
	LOCAL cTmpString	AS STRING
	LOCAL nResult       AS real8
	
    cTmpString  := SELF:RemoveFormatting(cText)
    if !Double.TryParse(cTmpString,nResult)
        nResult   := 0
    ENDIF    
   	IF SELF:oEditString <> null
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
	        	    if char.IsDigit(cCharToTest ,0 )  .or. cCharToTest == SELF:cDecSep
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
	        	    if char.IsDigit(cCharToTest ,0 ) .or. cCharToTest == SELF:cDecSep
	                    cTmpString += cCharToTest
	                ENDIF
	            ENDIF
	        NEXT
	ENDCASE
	cRetString := cTmpString
	RETURN cRetString

/****************************************************************************/
/*
METHOD SetOrigin(oDW AS object) AS VOID

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
	IF ( ( siYTopCoord - siHeight) < RectOwner:Top ) .And. ( ( siYBottomCoord + siHeight) > RectOwner:Bottom )
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
*/    

/****************************************************************************/
VIRTUAL Method HandleEnterKey() as void
    MoveFocus(TraversalRequest{FocusNavigationDirection.Next})
    //SendKeys.Send("{TAB}")
    RETURN

/****************************************************************************/
VIRTUAL Method HandleArrowKey(KeyData as Key) as void
    do case
        case KeyData = Key.UP
            MoveFocus(TraversalRequest{FocusNavigationDirection.Previous})
            //SendKeys.Send("+{TAB}")
        case KeyData == Key.Down
            MoveFocus(TraversalRequest{FocusNavigationDirection.Next})
            //SendKeys.Send("{TAB}")
    endcase
    RETURN  
#ENDREGION
#REGION "   Access / Assigns   "

/****************************************************************************/
ASSIGN CustomBitmapHandling(newValue AS ImageHandling) AS VOID 
	SELF:bitmapHandling := newValue
	RETURN

/****************************************************************************/
Access CustomBitmapHandling() as ImageHandling
    return SELF:bitmapHandling

/****************************************************************************/
ASSIGN Overwrite(newValue AS overwriteBehavior) AS VOID 
	SELF:overwriteHandling := newValue
	RETURN

/****************************************************************************/
Access Overwrite() as overwriteBehavior
    return self:overwriteHandling

	
/****************************************************************************/
ASSIGN ProcessEnter(newValue AS KeyHandling) AS VOID 
	SELF:EnterHandling := newValue
	RETURN

/****************************************************************************/
ACCESS ProcessEnter() AS KeyHandling 
	RETURN SELF:EnterHandling

/****************************************************************************/
ASSIGN ProcessArrow(newValue AS KeyHandling) AS VOID 
	SELF:ArrowHandling := newValue
	RETURN

/****************************************************************************/
ACCESS ProcessArrow() AS KeyHandling 
	RETURN SELF:ArrowHandling

/****************************************************************************/
Assign selectionOnFocus(newValue as FocusBehavior) AS VOID 
    SELF:focusHandling := newValue
    RETURN

/****************************************************************************/
ACCESS selectionOnFocus() as FocusBehavior
    return SELF:focusHandling

/****************************************************************************/
Assign scrlMode(newValue as scrlModeBehavior) AS VOID 
    SELF:scrlModeHandling := newValue
    RETURN

/****************************************************************************/
ACCESS scrlMode() as scrlModeBehavior
    return SELF:scrlModeHandling


/****************************************************************************/
ACCESS Type as SLEType
    RETURN nSLEType

/****************************************************************************/
ASSIGN Type(newValue as SLEType) as void 
    SELF:nSLEtype := newValue
    IF self:oEditString <> NULL_OBJECT
        IF newValue <> SLEType.Auto
            SELF:oEditString:Type := newValue
        ENDIF
    ENDIF
    RETURN

/****************************************************************************/
ACCESS zSetButton as KeyHandling
    RETURN KeyHandling.Auto

/****************************************************************************/
#pragma warnings( 3009, off )
ASSIGN zSetButton(newValue as KeyHandling) as void 
/*
    LOCAL iWidth        AS long
    LOCAL iHeight       AS long
    LOCAL iSLEX         AS long
    LOCAL iSLEY         AS long
    LOCAL iSLEWidth     AS long
    LOCAL iSLEHeight    AS long
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
    ENDIF
*/    
    RETURN
#pragma warnings( 3009, on )

/****************************************************************************/
ACCESS Owner AS Object   
//    SELF:oOwner := (object)SELF:FindForm()     
    RETURN SELF:oOwner

/****************************************************************************/
ASSIGN Owner(oForm as Object) as Void
    SELF:oOwner := oForm
    RETURN

/****************************************************************************/
ACCESS Enabled as Logic
    RETURN SELF:isEnabled

/****************************************************************************/
ASSIGN Enabled(lVar as Logic) as Void
    IF !System.ComponentModel.DesignerProperties.GetIsInDesignMode(SELF)
        SELF:isEnabled := lVar
        IF SELF:oPB <> NULL_OBJECT
            SELF:oPB:isEnabled := lVar
        ENDIF
    ENDIF
    RETURN        

/****************************************************************************/
Access Visible as Visibility
    RETURN SELF:Visibility

/****************************************************************************/
Assign Visible(Var as Visibility) as Void    
    IF !System.ComponentModel.DesignerProperties.GetIsInDesignMode(SELF)
        SELF:Visibility := Var
        IF SELF:oPB <> NULL_OBJECT
            SELF:oPB:Visibility := Var
        ENDIF
    ENDIF
    RETURN        

/****************************************************************************/
Access ZeroPad() as String
    LOCAL cResult   AS String
    LOCAL cTempText AS String
    cTempText   := SELF:RemoveFormatting(SELF:Text)
    IF SELF:oEditString <> NULL
        cResult := cTempText:Trim():PadLeft(SELF:oEditString:TemplateLength,convert.ToChar("0"))
    ELSEIF SELF:Picture <> NULL
        cResult := cTempText:Trim():PadLeft(SELF:Picture:Length,convert.ToChar("0"))
    ELSE
        cResult := SELF:Text
    ENDIF
    Return cResult
#ENDREGION


END CLASS    
END NameSpace