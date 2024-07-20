// SLEButton.prg
INTERNAL _DLL FUNCTION PostMessage(hwnd AS IntPtr, Msg AS DWORD, wParam AS DWORD, lParam AS LONG);
	AS LOGIC PASCAL:USER32.PostMessageA

#USING System.Windows
#Using System.Windows.Controls
#USING System.Windows.Input

#DEFINE WM_LBUTTONDBLCLK  0x0203

Begin NameSpace wmGUI.wpf
CLASS SLEButton inherit Button
    PROTECT oJoinedSLE  as rightSLE
    Protect nMessage    as dword

/****************************************************************************/
CONSTRUCTOR()
    Super()
    RETURN

/****************************************************************************/
CONSTRUCTOR(oSLE as rightSLE)
    SUPER()
    SELF:oJoinedSLE := oSLE 
    SELF:nMessage   := WM_LBUTTONDBLCLK
    SELF:Click += RoutedEventHandler{ SELF , @SLEButtonClick() }
    RETURN

/****************************************************************************/
ACCESS Message as dword
    RETURN SELF:nMessage

/****************************************************************************/
ASSIGN Message(nVar as dword) as VOID
    SELF:nMEssage := nVar
    RETURN    

/****************************************************************************/
#pragma warnings( 3009, off )
METHOD SLEButtonClick(o AS OBJECT , e AS RoutedEventArgs) as VOID
    IF SELF:oJoinedSLE <> NULL_OBJECT
        IF !SELF:oJoinedSLE:ReadOnly
            SELF:oJoinedSLE:HandleButton()
        ENDIF
    ENDIF
    RETURN 
#pragma warnings( 3009, on )
   
END CLASS
END Namespace