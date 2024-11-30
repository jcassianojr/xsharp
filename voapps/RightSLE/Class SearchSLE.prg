CLASS SearchSLE INHERIT rightSLE
// Author		: Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 7 May 1998
// --------------
//l SLE that brings up Search Window when double-clicked
//p SLE that brings up Search Window when double-clicked
//d	SearchSLE is an adaptation of the searchSLE from atoolkit. Recompiled to work in VO2.
//d The searchSLE has a working example in the testrightSLE.aef
//e Initialize this SLE in the owning window's PostInit() as follows:
//e PostInit(oWindow,iCtlID,oServer,uExtra) CLASS MyDialog
//e 	SELF:oDCSingleLineEdit1:symMethod := str2symbol("sleSearchMe")
//g Edit Controls
METHOD Dispatch(oEvent)

	DO CASE
		CASE SELF:ReadOnly
			// we dont want to search a readonly field
		CASE oEvent:Message == WM_LBUTTONDBLCLK
			IF IsMethod(SELF:owner,SELF:symMethod)
				Send(SELF:owner,SELF:symMethod,SELF,SELF:CurrentText)
				RETURN 1L
			ENDIF	
	ENDCASE
RETURN SUPER:Dispatch(oEvent)
Constructor(oForm,oResID,oPoint,oDim,kStyle,lDataAware) 

	super(oForm,oResID,oPoint,oDim,kStyle,lDataAware)
	SELF:symMethod	:= String2Symbol("sleSearch")
	SELF:AssignImage("rsle_MAGNIFUP")
	RETURN  
END CLASS

