CLASS FileSLE INHERIT rightSLE
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
	PROTECT nDialogType := 1 	AS LONGINT
	EXPORT  xFilter,xFilterDesc AS USUAL
	EXPORT	sInitdir			AS STRING
	EXPORT	sTitle				AS STRING
	
	// methods
	
	// accesses
	
	// assigns

ACCESS DialogType() AS LONGINT PASCAL 
	//l Access to return the dialogtype.
	//p Access to return the dialogtype.
	//d DialogType will return the file dialogtype \line
	//r long
	//a None
	RETURN SELF:nDialogType

ASSIGN DialogType(nVar AS LONGINT) AS LONGINT PASCAL 
	//l Assign to set the dialogtype.
	//p Assign to set the dialogtype.
	//d DialogType will set the type of file dialog that is displayed. \line
	//r long
	//a None
	SELF:nDialogType := nVar
	RETURN SELF:nDialogType

METHOD Dispatch(oEvent) 
	DO CASE
		CASE oEvent:Message == WM_LBUTTONDBLCLK
			SELF:showFileDialog()
			RETURN 1L
	ENDCASE
RETURN SUPER:Dispatch(oEvent)

ASSIGN Filter(uVar AS USUAL) AS USUAL PASCAL 
	//l Assign to set the dialog's file filter.
	//p Assign to set the dialog's file filter.
	//d Filter will set the filter that the standard file dialog uses. \line
	//r String
	//a None
	SELF:xFilter := uVar
	RETURN SELF:xFilter

ASSIGN FilterDescription(uVar AS USUAL) AS USUAL PASCAL 
	//l Assign to set the dialog's filter description.
	//p Assign to set the dialog's filter description.
	//d filerDescription will set the filter description combo box on the standard file dialog. \line
	//r String
	//a None
	SELF:xFilterDesc := uVar
	RETURN SELF:xFilterDesc

	

CONSTRUCTOR(oOwner, nId, oPoint, oDim, kStyle, lDataAware ) 
    //Vulcan.NET-Transporter: This method was automatically created
    SUPER(oOwner, nId, oPoint, oDim, kStyle, lDataAware )

//Vulcan.NET-Transporter: To Do: the following line has been inserted. Please check the return value is correct
RETURN SELF

ASSIGN InitialDirectory(sVar AS STRING) AS STRING PASCAL 
	//l Assign to set the dialog's initial directory.
	//p Assign to set the dialog's initial directory.
	//d InitialDirectory will set the file dilog's initial directory. \line
	//r String
	//a None
	SELF:sInitdir := sVar
	RETURN SELF:sInitdir

METHOD showFileDialog() AS VOID PASCAL 
		LOCAL oFileDLG AS StandardFileDialog
		IF nDialogType == 1			// Open File Dialog
			oFileDLG := OpenDialog{SELF:owner,SELF:currenttext}
			IF SELF:xFilter <> NIL
				oFileDLG:SetFilter(SELF:xFilter,SELF:xFilterDesc)
			ELSE	
				oFileDLG:SetFilter("*.*","All Files")
			ENDIF	
		
			// check o see if they have set an initial directory
			// use it if they havent typed anything into the field
			// self:CurrentText overrides the initial dir
			IF !Empty(SELF:sInitDir)  .and. Empty(SELF:CurrentText)					// gcs 21/11/02
				oFileDLG:InitialDirectory := SELF:sInitDir
			ENDIF
			IF !Empty(SELF:sTitle)						// gcs 21/11/02
				oFileDLG:Caption := SELF:sTitle
			ENDIF
		
			oFileDLG:show()
			IF !Empty(oFileDLG:FileName)
				SELF:value 		:= oFileDLG:FileName
				SELF:textvalue := oFileDLG:FileName
			ENDIF
			SetFocus(SELF:handle())
		ELSE
			oFileDLG := SaveAsDialog{SELF:owner,SELF:currenttext}
			IF SELF:xFilter <> NIL
				oFileDLG:SetFilter(SELF:xFilter,SELF:xFilterDesc)
			ELSE	
				oFileDLG:SetFilter("*.*","All Files")
			ENDIF	

			// check o see if they have set an initial directory
			// use it if they havent typed anything into the field
			// self:CurrentText overrides the initial dir
			IF !Empty(SELF:sInitDir)  .and. Empty(SELF:CurrentText)					// gcs 21/11/02
				oFileDLG:InitialDirectory := SELF:sInitDir
			ENDIF
			IF !Empty(SELF:sTitle)						// gcs 21/11/02
				oFileDLG:Caption := SELF:sTitle
			ENDIF

			oFileDLG:show()
			IF !Empty(oFileDLG:FileName)
				SELF:Value		:= oFileDLG:FileName
				SELF:textvalue 	:= oFileDLG:FileName
			ENDIF
			SetFocus(SELF:handle())
		ENDIF
	RETURN

ASSIGN Title(sVar AS STRING) AS STRING PASCAL 
	//l Assign to set the dialog title.
	//p Assign to set the dialog title.
	//d Title will set the file dilog's caption. \line
	//r String
	//a None
	SELF:sTitle := sVar
	RETURN SELF:sTitle

END CLASS
CLASS pbFileSLE INHERIT FileSLE
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


CONSTRUCTOR(oForm,oResID,oPoint,oDim,kStyle,lDataAware) 
	SUPER(oForm,oResID,oPoint,oDim,kStyle,lDataAware)
	SELF:AssignImage("rsle_FOLDUP")
	RETURN SELF


END CLASS
