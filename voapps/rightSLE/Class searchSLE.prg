// searchSLE.prg
#USING System.Windows.Forms

CLASS SearchSLE INHERIT rightSLE
//#REGION "   IVars   "
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
//e 	SELF:oDCSingleLineEdit1:symMethod := "sleSearchMe"
//g Edit Controls
PROTECT cMethodToCall   AS String
//#ENDREGION
//#REGION "   Constructors   "
/****************************************************************************/
CONSTRUCTOR()
	SUPER()
	SELF:cMethodToCall	  := "sleSearch"
	SELF:MouseDoubleClick += System.Windows.Forms.MouseEventHandler{ SELF , @handleMouseDoubleClick() }
	RETURN 
//#ENDREGION
//#REGION "   Event Handlers   "
/****************************************************************************/
VIRTUAL Method HandleButton() AS VOID    
	SELF:showSearchDialog()
	RETURN

/****************************************************************************/
#pragma warnings( 3009, off )
Method HandleMouseDoubleClick(o AS OBJECT , e AS System.Windows.Forms.MouseEventArgs) AS VOID    
	IF 	e:Button = MouseButtons.Left
		SELF:HandleButton()
	ENDIF
	RETURN
#pragma warnings( 3009, on )

//#ENDREGION

//#REGION "   Methods   "
METHOD showSearchDialog() as VOID
	LOCAL aParameters   AS Object[]
	Try
		IF CheckMethod(SELF:owner,SELF:cMethodToCall)
			aParameters     := Object[]{2}
			aParameters[0]  := (object)self
			aParameters[1]  := SELF:Text
			RunDynamicMethod(SELF:oOwner,SELF:cMethodToCall,aParameters)
		ENDIF	
	Catch ex as Exception
		messagebox.show(ex:Message)
	End Try	 
	RETURN
//#ENDREGION
//#REGION "   Access / Assigns  "
Assign SearchMethod(cVar as String) as void
	IF cVar == NULL
		SELF:cMethodToCall  := "sleSearch"
	ELSE
		SELF:cMethodToCall  := cVar
	ENDIF
	RETURN
//#ENDREGION
END CLASS
CLASS pbSearchSLE INHERIT searchSLE
//#REGION "   IVARS   "
// Author		: Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 27 September 1998
// --------------
//l SLE that brings up Search Window when double-clicked
//p SLE that brings up Search Window when double-clicked
//d	SearchSLE is an adaptation of the searchSLE from atoolkit. Recompiled to work in VO2.
//d The searchSLE has a working example in the testrightSLE.aef
//e Initialize this SLE in the owning window's PostInit() as follows:
//e PostInit(oWindow,iCtlID,oServer,uExtra) CLASS MyDialog
//e 	SELF:oDCSingleLineEdit1:symMethod := str2symbol("sleSearchMe")
//g Edit Controls
//#ENDREGION
//#REGION "   Constructors   "
CONSTRUCTOR()
	SUPER()
	SELF:AssignImage("rsle_MAGNIFUP")
	RETURN  
//#ENDREGION	
END CLASS