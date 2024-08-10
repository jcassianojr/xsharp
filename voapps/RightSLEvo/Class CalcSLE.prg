CLASS CalcSLE INHERIT rightsle
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
//d	calcSLE is a subclass if rightSLE that adds a popup calculator.
//d Put a SLE on your window and have it INHERIT from calcSLE.
//g Edit Controls

METHOD Dispatch ( oEvent ) 

	/*
		Only the messages, that calcSle wants to know about.
	 	All the rest go through to rightSLES's dispatch and every other class's dispatch that is involved from there - There are lots of them!!!!

    */
    	IF !(SELF:FieldSpec == NULL_OBJECT )  .and. SELF:FieldSpec:Valtype == 'N'
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
			END CASE
		ENDIF
		
	// Let all the other messages, go back to VO's Sle Wndproc
		
RETURN SUPER:Dispatch( oEvent )



CONSTRUCTOR(oOwner, nId, oPoint, oDim, kStyle,lDataAware ) 
	SUPER( oOwner, nID, oPoint, oDim, kStyle, lDataAware )
    SELF:ContextMenu := CalcSLEContextMenu{ SELF }
    RETURN SELF

END CLASS
CLASS pbCalcSlE INHERIT CalcSLE
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
//d	pbcalcSLE is a subclass if calcSLE that adds a bitmap button.
//d Put a SLE on your window and have it INHERIT from pbcalcSLE.
//g Edit Controls


CONSTRUCTOR(oOwner, nId, oPoint, oDim, kStyle,lDataAware ) 
	SUPER( oOwner, nID, oPoint, oDim, kStyle, lDataAware )
	SELF:AssignImage("rsle_calcup")
	RETURN SELF


END CLASS
