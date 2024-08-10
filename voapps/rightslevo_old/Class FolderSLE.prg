CLASS FolderSLE INHERIT rightSLE
// Author		: Ed Ratcliffe / Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 7 May 1998
// --------------
//l SLE that brings up StandardFolderOpen when double-clicked
//p SLE that brings up StandardFolderOpen when double-clicked
//d	FolderSLE is an adaptation of the fileSLE from atoolkit. Recompiled to work in VO2.
//d Put a SLE on your window and have it INHERIT from FolderSLE{}. In your PostInit() set the
//d title and stuff the SLE with a proposed pathname.  When the user double-clicks the SLE,
//d it brings up the FolderOpen dialog at your proposed directory. The SLE is stuffed with the
//d full path of the user's selection.  NOTE - Inherits from RightSLE, do your customization
//d there.
//e Initialize this SLE in the owning window's PostInit() as follows:
//e PostInit(oWindow,iCtlID,oServer,uExtra) CLASS MyDialog
//e 	SELF:oDCSingleLineEdit1:xStartFolder := "d:\DOWNLOAD\"
//e 	SELF:oDCSingleLineEdit1:xTitle := "My Folder dialog"
//g Edit Controls
	
	EXPORT xStartFolder AS STRING
	EXPORT xTitle 		AS STRING
	
	//methods
	//DECLARE METHOD ShowFolderDialog
	
	//assigns
	//DECLARE ASSIGN Title
	//DECLARE ASSIGN Initialdirectory
METHOD Dispatch(oEvent) 

	DO CASE
		CASE oEvent:Message == WM_LBUTTONDBLCLK
			SELF:showFolderDialog()
			RETURN 1L
	ENDCASE
	RETURN SUPER:Dispatch(oEvent)
constructor(oForm,oResID,oPoint,oDim,kStyle,lDataAware) 

	super(oForm,oResID,oPoint,oDim,kStyle,lDataAware)
	SELF:xTitle := "Enter Folder"
	RETURN  
ASSIGN InitialDirectory(sVar AS STRING) AS void 

	//l Assign to set the dialog's initial directory.
	//p Assign to set the dialog's initial directory.
	//d InitialDirectory will set the file dilog's initial directory. \line
	//r String
	//a None
	SELF:xStartFolder := sVar
	RETURN
METHOD ShowFolderDialog() AS VOID

	LOCAL oFolderDLG AS StandardFolderDialog

	IF Empty(SELF:TextValue)
		SELF:xStartFolder := DiskName()+":\"
	ELSE
		SELF:xStartFolder	:= SELF:TextValue
	ENDIF

	oFolderDLG := StandardFolderDialog{SELF:owner,SELF:xTitle,Trim(SELF:xStartFolder),BIF_RETURNONLYFSDIRS}
	oFolderDLG:show()
	IF !Empty(oFolderDLG:FolderName)
		SELF:value 			:= oFolderDLG:FolderName
		SELF:textvalue 		:= oFolderDLG:FolderName
		SELF:xStartFolder 	:= oFolderDLG:FolderName
	ENDIF
	SetFocus(SELF:handle())
	RETURN
ASSIGN Title(sVar AS STRING) AS void 

	//l Assign to set the dialog title.
	//p Assign to set the dialog title.
	//d Title will set the file dilog's caption. \line
	//r String
	//a None
	SELF:xTitle := sVar
	RETURN
END CLASS

CLASS pbFolderSLE INHERIT FolderSLE
// Author		: Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 27 September 1998
// --------------
//l SLE that brings up FolderOpen when double-clicked. Also has a button.
//p SLE that brings up FolderOpen when double-clicked. Also has a button.
//d	pbFileSLE inherits from fileSLE and adds a button for user interface.
//d Put a SLE on your window and have it INHERIT from pbFolderSLE{}. In your PostInit() set the
//d title and stuff the SLE with a proposed pathname.  When the user double-clicks the SLE,
//d it brings up the FolderOpen dialog at your proposed directory. The SLE is stuffed with the
//d full path of the user's selection.  NOTE - Inherits from FolderSLE, do your customization
//d there.
//e Initialize this SLE in the owning window's PostInit() as follows:
//e PostInit(oWindow,iCtlID,oServer,uExtra) CLASS MyDialog
//e 	SELF:oDCSingleLineEdit1:xStartFolder := "d:\DOWNLOAD\"
//e 	SELF:oDCSingleLineEdit1:xTitle := "My Folder dialog"
//g Edit Controls
constructor(oForm,oResID,oPoint,oDim,kStyle,lDataAware) 

	SUPER(oForm,oResID,oPoint,oDim,kStyle,lDataAware)
	SELF:AssignImage("rsle_FOLDUP")
	RETURN  
END CLASS

