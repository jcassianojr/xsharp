


PROCEDURE FabCenterWindow( oWindow AS OBJECT  )
/*
Center a Window, in the desktop
*/
//
	LOCAL	hParent		AS	PTR
	LOCAL	hItem		AS	PTR
	LOCAL	rctWindow	IS	_WINRECT
	LOCAL	rctDesktop	IS	_WINRECT
	LOCAL	wLeft, wTop, wWidth, wHeight	AS	LONG
	//
	IF IsMethod( oWindow, #Handle )
		hItem	:= Send( oWindow, #Handle )
		hParent	:= GetDesktopWindow()
		//
		GetWindowRect( hItem, @rctWindow )
		GetWindowRect( hParent, @rctDesktop )
		//
		wWidth	:= rctWindow.right - rctWindow.left
		wHeight	:= rctWindow.bottom - rctWindow.top
		wLeft	:= ( rctDesktop.right / 2 ) - ( wWidth / 2 )
		wTop	:= ( rctDesktop.bottom / 2 ) - ( wHeight / 2 )
		MoveWindow( hItem, wLeft, wTop, wWidth, wHeight, TRUE )
	ENDIF







FUNCTION FabMessageOkCancel( uText , uTitle, nDefButton ) AS LOGIC
//g Messages,Messages Functions
//p Show a MessageBox with a question mark icon, and two buttons : Ok & Cancel
//l Show a MessageBox with a question mark icon, and two buttons : Ok & Cancel
//x <uText> is the value to show in the text of MessageBox. ( Any types are accepted )\line
//x <uTitle> is the value to show in the caption of MessageBox. ( Any types are accepted )\line
//x \tab Default value is "Confirm" \line
//x <nDefButton> indicate the Default button.\line
//x \tab 1 mean Ok Button.\line
//x \tab 2 mean Cancel Button.
//r A logical value indicating if the Ok button has been pressed.
	LOCAL oTextBox		AS TextBox
	LOCAL nDefPB		AS LONG
	//
	Default( @nDefButton, 1 )
	//
	IF IsNil( uTitle )
		uTitle := "Confirm"
	ENDIF
	IF IsNil( uText )
		uText := ""
	ENDIF
	//
	nDefPB := nDefButton
	nDefPB := ( ( nDefPB - 1 ) << 8 )
	//
	oTextBox := TextBox{ , AsString( uTitle ), AsString( uText ) }
	oTextBox:Type := BOXICONQUESTIONMARK + BUTTONOKAYCANCEL + nDefPB
	FabCenterWindow( oTextBox )
RETURN	( oTextBox:Show() == BOXREPLYOKAY )




FUNCTION FabMessageRetryCancel( uText , uTitle, nDefButton ) AS LOGIC
//g Messages,Messages Functions
//p Show a MessageBox with a stop-sign icon, and two buttons : Retry & Cancel
//l Show a MessageBox with a stop-sign icon, and two buttons : Retry & Cancel
//x <uText> is the value to show in the text of MessageBox. ( Any types are accepted )\line
//x <uTitle> is the value to show in the caption of MessageBox. ( Any types are accepted )\line
//x \tab Default value is "Confirm" \line
//x <nDefButton> indicate the Default button.\line
//x \tab 1 mean Retry Button.\line
//x \tab 2 mean Cancel Button.
//r A logical value indicating if the Retry button has been pressed.
	LOCAL oTextBox		AS TextBox
	LOCAL nDefPB		AS LONG
	//
	Default( @nDefButton, 1 )
	//
	IF IsNil( uTitle )
		uTitle := "Confirm"
	ENDIF
	IF IsNil( uText )
		uText := ""
	ENDIF
	//
	nDefPB := nDefButton
	nDefPB := ( ( nDefPB - 1 ) << 8 )
	//
	oTextBox := TextBox{ , AsString( uTitle ), AsString( uText ) }
	oTextBox:Type := BOXICONHAND + BUTTONRETRYCANCEL + nDefPB
	FabCenterWindow( oTextBox )
RETURN	( oTextBox:Show() == BOXREPLYRETRY )
FUNCTION FabMessageYesNo( uText , uTitle, nDefButton ) AS LOGIC
//g Messages,Messages Functions
//p Show a MessageBox with a question mark icon, and two buttons : Yes & No
//l Show a MessageBox with a question mark icon, and two buttons : Yes & No
//x <uText> is the value to show in the text of MessageBox. ( Any types are accepted )\line
//x <uTitle> is the value to show in the caption of MessageBox. ( Any types are accepted )\line
//x \tab Default value is "Choose" \line
//x <nDefButton> indicate the Default button.\line
//x \tab 1 mean Yes Button.\line
//x \tab 2 mean No Button.
//r A logical value indicating if the Yes button has been pressed.

	LOCAL oTextBox		AS TextBox
	LOCAL nDefPB		AS LONG
	//
	Default( @nDefButton, 1 )
	//
	IF IsNil( uTitle )
		uTitle := "Choose"
	ENDIF
	IF IsNil( uText )
		uText := ""
	ENDIF
	//
	nDefPB := nDefButton
	nDefPB := ( ( nDefPB - 1 ) << 8 )
	//
	oTextBox := TextBox{ , AsString( uTitle ), AsString( uText ) }
	oTextBox:Type := BOXICONQUESTIONMARK + BUTTONYESNO + nDefPB
	FabCenterWindow( oTextBox )
RETURN	( oTextBox:Show() == BOXREPLYYES )




FUNCTION FabMessageYesNoCancel( uText, uTitle, nDefButton ) AS INT
//g Messages,Messages Functions
//p Show a MessageBox with a stop-sign icon, and three buttons : Yes, No & Cancel
//l Show a MessageBox with a stop-sign icon, and three buttons : Yes, No & Cancel
//x <uText> is the value to show in the text of MessageBox. ( Any types are accepted )\line
//x <uTitle> is the value to show in the caption of MessageBox. ( Any types are accepted )\line
//x \tab Default value is "Choose" \line
//x <nDefButton> indicate the Default button.\line
//x \tab 1 mean Yes Button.\line
//x \tab 2 mean No Button.\line
//x \tab 3 Mean Cancel Button.
//r A lnumeric value, indicating what button has been pressed.

	LOCAL oTextBox	AS TextBox
	LOCAL nDefPB		AS LONG
	//
	Default( @nDefButton, 1 )
	//
	IF IsNil( uTitle )
		uTitle := "Choose"
	ENDIF
	IF IsNil( uText )
		uText := ""
	ENDIF
	//
	nDefPB := nDefButton
	nDefPB := ( ( nDefPB - 1 ) << 8 )
	//
	oTextBox := TextBox{ ,AsString( uTitle ), AsString( uText ) }
	oTextBox:Type := BOXICONHAND + BUTTONYESNOCANCEL + nDefPB
	FabCenterWindow( oTextBox )
RETURN	( oTextBox:Show()  )
FUNCTION MDG(cMESSAGE,cTITLE) AS LOGIC
RETURN FabMessageYesNo( cMESSAGE,cTITLE,)
*/
