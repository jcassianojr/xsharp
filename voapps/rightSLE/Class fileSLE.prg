// fileSLE.prg
#USING System.Windows.Forms
#USING System.Windows.Forms.Design

CLASS FileSLE INHERIT rightSLE
//#REGION "   IVARS   "
// Author		: Willie Moore
// Email		: williem@wmconsulting.com
// Address		:
// City, State	:
// Zip/Postal	:
// Country		:
// Telephone	:
// Date			: 7 May 1998
// --------------
//l SLE that brings up FileOpen when double-clicked
//p SLE that brings up FileOpen when double-clicked
//d	FileSLE is an adaptation of the fileSLE from atoolkit. Recompiled to work in VO2.
//d The bitmap button is gone and it looks like PEdateSLE that is published by Graham McKechnie.
//d Put a SLE on your window and have it INHERIT from FileSLE{}. In your PostInit() set the
//d filter and stuff the SLE with a proposed pathname.  When the user double-clicks the SLE,
//d it brings up the FileOpen dialog at your proposed directory. The SLE is stuffed with the
//d full path of the user's selection.  NOTE - Inherits from RightSLE, do your customization
//d there.
//e Initialize this SLE in the owning window's PostInit() as follows:
//e PostInit(oWindow,iCtlID,oServer,uExtra) CLASS MyDialog
//e 	SELF:oDCSingleLineEdit1:TEXTvalue := "C:\DOWNLOAD\*.AEF"
//e 	SELF:oDCSingleLineEdit1:xFilter := { "*.AEF", "*.*" }
//e 	SELF:oDCSingleLineEdit1:xFilterDesc := { "Application Export Files", "All Files" }
//g Edit Controls
	PROTECT nDialogType := FileType.OpenDialog 	AS FileType
	PROTECT cFilter                             AS STRING
	EXPORT	sInitdir		                	AS STRING
	EXPORT	sTitle				                AS STRING
//#ENDREGION
//#REGION "   Constructors   "
/****************************************************************************/
CONSTRUCTOR()
	SUPER()
	SELF:MouseDoubleClick += System.Windows.Forms.MouseEventHandler{ SELF , @handleMouseDoubleClick() }
	RETURN 
//#ENDREGION    
//#REGION "   Event Handlers   "
/****************************************************************************/
VIRTUAL Method HandleButton() AS VOID    
	SELF:showFileDialog()
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
/****************************************************************************/
Virtual METHOD showFileDialog() AS VOID 
		LOCAL oFileDLG          AS OpenFileDialog
		Local oSaveAsDialog     AS SaveFileDialog
		
		IF SELF:nDialogType == FileType.OpenDialog .or. SELF:nDialogType == FileType.Auto	// Open File Dialog		
			oFileDLG := OpenFileDialog{}
			IF SELF:cFilter <> NULL
				oFileDlg:Filter        := SELF:cFilter
				oFileDlg:FilterIndex   := 1
			ELSE	
				oFileDlg:Filter        := "Text files (*.txt)|*.txt|All files (*.*)|*.*"
				oFileDlg:FilterIndex   := 2
			ENDIF	
		
			// check o see if they have set an initial directory
			// use it if they havent typed anything into the field
			// self:CurrentText overrides the initial dir
			IF !Empty(SELF:sInitDir) .and. Empty(SELF:Text)
				oFileDlg:InitialDirectory  := SELF:sInitDir
			ENDIF
			IF !Empty(SELF:sTitle)						
				oFileDlg:Title  := SELF:sTitle
			ENDIF
		
			IF oFileDlg:showDialog()== DialogResult.Ok
				SELF:Text 	:= oFileDlg:FileName
			ENDIF
			SELF:Focus()
		ELSE
			oSaveAsDialog := SaveFileDialog{} // SaveAsDialog{SELF:owner,SELF:Text}
			IF SELF:cFilter <> NULL
				oSaveAsDialog:Filter        := SELF:cFilter
				oSaveAsDialog:FilterIndex   := 1
			ELSE
				oSaveAsDialog:Filter        := "Text files (*.txt)|*.txt|All files (*.*)|*.*"
				oSaveAsDialog:FilterIndex   := 2
			ENDIF	

			// check o see if they have set an initial directory
			// use it if they havent typed anything into the field
			// self:CurrentText overrides the initial dir
			IF !Empty(SELF:sInitDir) .and. Empty(SELF:Text)		
				oSaveAsDialog:InitialDirectory  := SELF:sInitDir
			ENDIF
			
			IF !Empty(SELF:sTitle)						
				oSaveAsDialog:Title  := SELF:sTitle
			ENDIF

			if oSaveAsDialog:showDialog()== DialogResult.Ok
				SELF:Text 	:= oSaveAsDialog:FileName
			ENDIF
			SELF:Focus()
		ENDIF
	RETURN

//#ENDREGION
//#REGION "   Access / Assigns   "

/****************************************************************************/
ACCESS DialogType() AS FileType

	//l Access to return the dialogtype.
	//p Access to return the dialogtype.
	//d DialogType will return the file dialogtype \line
	//r long
	//a None
	RETURN SELF:nDialogType

/****************************************************************************/
ASSIGN DialogType(nVar AS FileType) AS void  

	//l Assign to set the dialogtype.
	//p Assign to set the dialogtype.
	//d DialogType will set the type of file dialog that is displayed. \line
	//r long
	//a None
	SELF:nDialogType := nVar
	
	RETURN

/****************************************************************************/
ASSIGN Filter(cVar AS STRING) AS void  

	//l Assign to set the dialog's file filter.
	//p Assign to set the dialog's file filter.
	//d Filter will set the filter that the standard file dialog uses. \line
	//r String
	//a None
	SELF:cFilter := cVar
	RETURN

/****************************************************************************/
ASSIGN InitialDirectory(sVar AS STRING) AS void 

	//l Assign to set the dialog's initial directory.
	//p Assign to set the dialog's initial directory.
	//d InitialDirectory will set the file dilog's initial directory. \line
	//r String
	//a None
	SELF:sInitdir := sVar
	RETURN 

/****************************************************************************/
ASSIGN Title(sVar AS STRING) AS void 

	//l Assign to set the dialog title.
	//p Assign to set the dialog title.
	//d Title will set the file dilog's caption. \line
	//r String
	//a None
	SELF:sTitle := sVar
	RETURN 

//#ENDREGION	

END CLASS

CLASS pbFileSLE INHERIT FileSLE
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
//l SLE that brings up FileOpen when double-clicked. Also has a button.
//p SLE that brings up FileOpen when double-clicked. Also has a button.
//d	pbFileSLE inherits from fileSLE and adds a button for user interface.
//d Put a SLE on your window and have it INHERIT from pbFileSLE{}. In your PostInit() set the
//d filter and stuff the SLE with a proposed pathname.  When the user double-clicks the SLE,
//d it brings up the FileOpen dialog at your proposed directory. The SLE is stuffed with the
//d full path of the user's selection.
//e Initialize this SLE in the owning window's PostInit() as follows:
//e PostInit(oWindow,iCtlID,oServer,uExtra) CLASS MyDialog
//e 	SELF:oDCSingleLineEdit1:TEXTvalue := "C:\DOWNLOAD\*.AEF"
//e 	SELF:oDCSingleLineEdit1:xFilter := { "*.AEF", "*.*" }
//e 	SELF:oDCSingleLineEdit1:xFilterDesc := { "Application Export Files", "All Files" }
//g Edit Controls
//#ENDREGION
//#REGION "   Constructors   "
CONSTRUCTOR()
	SUPER()
	SELF:AssignImage("rsle_FOLDUP")
	RETURN  
//#ENDREGION	
END CLASS

