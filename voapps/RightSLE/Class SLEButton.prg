CLASS SLEButton INHERIT wmNewBitmapButton
	// Author		: Willie Moore
	// Email		: williem@wmconsulting.com
	// Address		:
	// City, State	:
	// Zip/Postal	:
	// Country		:
	// Telephone	:
	// Date			: 7 May 1998
	// --------------
	//l A BitmapButton that can be joined to a SLE
	//p A BitmapButton that can be joined to a SLE
	//d	Use this subclass of wmBitmapButton to join a rightSLE to a button. \par
	//d The default message that is passed to the SLE is {\b WM_LBUTTONDBLCLK} . \par
	//d There is a commented out line in the init for TabStop. If you want
	//d your button to be included in the tablist, uncomment this line and comment
	//d out the line above it.
	//g Bitmap Button
	PROTECT oJoinedSLE 	AS OBJECT
	PROTECT lInEvent 	AS LOGIC
	EXPORT nMessage		AS DWORD

/****************************************************************************/
METHOD Dispatch(oE)

	DO CASE
		CASE oE:Message == WM_LBUTTONUP .and. SELF:lInEvent
			SELF:lInEvent 					:= FALSE
			SELF:EventReturnValue			:= 1L
			SELF:oJoinedSLE:lSendFromButton	:= TRUE
			PostMessage(SELF:oJoinedSLE:handle(),SELF:nMessage,0,0L)
			RETURN 1L
		CASE oE:Message == WM_LBUTTONDOWN		
//			PostMessage(SELF:oJoinedSLE:handle(),WM_SETFOCUS,0,0L)	// wcm 7/16/2002 for Zetus			
			SELF:lInEvent := TRUE
	ENDCASE
RETURN SUPER:Dispatch(oE)

/****************************************************************************/
Constructor(oForm,oResID,oPoint,oDim,oSLE)

	SELF:oJoinedSLE := oSLE
	super(oForm,oResID,oPoint,oDim )
//	super(oForm,oResID,oPoint,oDim,,WS_TABSTOP)
	nMessage := WM_LBUTTONDBLCLK 	// default message to send
	SELF:lInEvent := FALSE
	RETURN  
END CLASS

