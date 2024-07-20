// folderSLE.prg
// fileSLE.prg
#USING System.Windows.Forms
//#USING wmFolderBrowser
#USING System.Windows.Forms.Design
#USING System.Drawing


CLASS FolderSLE INHERIT rightSLE
#REGION "   IVARS   "
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
	Protect	sInitdir		                	AS STRING
	Protect	sTitle				                AS STRING
#ENDREGION
#REGION "   Constructors   "
/****************************************************************************/
CONSTRUCTOR()
	SUPER()
	SELF:MouseDoubleClick += System.Windows.Forms.MouseEventHandler{ SELF , @handleMouseDoubleClick() }
	RETURN 
#ENDREGION    
#REGION "   Event Handlers   "
/****************************************************************************/
VIRTUAL Method HandleButton() AS VOID    
	SELF:showFolderDialog()
	RETURN

/****************************************************************************/
#pragma warnings( 3009, off )
Method HandleMouseDoubleClick(o AS OBJECT , e AS System.Windows.Forms.MouseEventArgs) AS VOID    
	IF 	e:Button = MouseButtons.Left
		SELF:HandleButton()
	ENDIF
	RETURN
#pragma warnings( 3009, on )

#ENDREGION

#REGION "   Methods   "
/****************************************************************************/
Virtual METHOD showFolderDialog() AS VOID 
	LOCAL oFB AS FolderBrowserDialog
  
	oFB := FolderBrowserDialog{}
	
	// set the path if they have already typed something in
	IF SELF:Text:Length > 0
		oFB:SelectedPath := SELF:Text
	ENDIF
	
	// set the title is specified
	IF !Empty(SELF:sTitle)						
		oFB:Description  := SELF:sTitle
	ENDIF

	IF oFB:showDialog()== DialogResult.Ok
		SELF:Text 	:= oFB:SelectedPath
	ENDIF
	SELF:Focus()

		
//  LOCAL oFileDLG          AS FolderBrowser
//	oFileDLG := FolderBrowser{}

//	IF !Empty(SELF:sTitle)						
//	    oFB:Title  := SELF:sTitle
//	ENDIF

//	IF oFileDlg:showDialog()== DialogResult.Ok
//		SELF:Text 	:= oFileDlg:DirectoryPath
//	ENDIF
//	SELF:Focus()
	RETURN
#ENDREGION
#REGION "   Access / Assigns   "

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

#ENDREGION	

END CLASS

CLASS pbFolderSLE INHERIT FolderSLE
#REGION "   IVARS   "
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
//d filter and stuff the SLE with a proposed pathname.  When the user double-clicks the SLE,
//d it brings up the FolderOpen dialog at your proposed directory. The SLE is stuffed with the
//d full path of the user's selection.
//e Initialize this SLE in the owning window's PostInit() as follows:
//e PostInit(oWindow,iCtlID,oServer,uExtra) CLASS MyDialog
//e 	SELF:oDCSingleLineEdit1:TEXTvalue := "C:\DOWNLOAD\*.AEF"
//e 	SELF:oDCSingleLineEdit1:xFilter := { "*.AEF", "*.*" }
//e 	SELF:oDCSingleLineEdit1:xFilterDesc := { "Application Export Files", "All Files" }
//g Edit Controls
#ENDREGION
#REGION "   Constructors   "
CONSTRUCTOR()
	SUPER()
	SELF:AssignImage("rsle_FOLDUP")
	RETURN  
#ENDREGION	
END CLASS
/*
class wmFolderBrowser inherit FolderNameEditor
	// Fields
	private m_obBrowser := null                 as FolderBrowser
	private m_strDescription := "Select folder" as String

	// Methods
	  constructor ()
		super()
		self:m_obBrowser := FolderBrowser{}
		return

	  method ShowDialog() as DialogResult
		self:m_obBrowser:Description := self:m_strDescription
		return self:m_obBrowser:ShowDialog()



	// Properties
	access DirectoryPath as String
		return self:m_obBrowser:DirectoryPath

	access Title as String
		return self:m_strDescription
		
	assign  Title(value as String) as void
		self:m_strDescription := value
		return
		
end class
*/
