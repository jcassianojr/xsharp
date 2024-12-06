#region DEFINES
Define IDA_BasicMenu := "BasicMenu"
Define IDM_BasicMenu := "BasicMenu"
Define IDM_BasicMenu_File_Exit_ID := 26431
Define IDM_BasicMenu_File_ID := 26426
Define IDM_BasicMenu_File_New_ID := 26427
Define IDM_BasicMenu_File_Open_ID := 26428
Define IDM_BasicMenu_File_Save_ID := 26429
Define IDM_BasicMenu_Window_Cascade_ID := 26433
Define IDM_BasicMenu_Window_Close_All_ID := 26435
Define IDM_BasicMenu_Window_ID := 26432
Define IDM_BasicMenu_Window_Tile_ID := 26434
#endregion

CLASS BasicMenu INHERIT Menu
 
CONSTRUCTOR(oOwner) 
	local oTB as Toolbar

	SUPER(ResourceID{IDM_BasicMenu, _GetInst( )})

	self:RegisterItem(IDM_BasicMenu_File_ID,	;
		HyperLabel{#File,	;
			"&File",	;
			,	;
			"File"},self:Handle( ),0)
	self:RegisterItem(IDM_BasicMenu_File_New_ID,	;
		HyperLabel{#FileNew,	;
			"&New	CTRL+N",	;
			"Creates a new MDI child window",	;
			,})
	self:RegisterItem(IDM_BasicMenu_File_Open_ID,	;
		HyperLabel{#FileLoad,	;
			"&Open",	;
			,	;
			"File_Close"})
	self:RegisterItem(IDM_BasicMenu_File_Save_ID,	;
		HyperLabel{#FileSave,	;
			"&Save",	;
			,	;
			,})
	self:RegisterItem(IDM_BasicMenu_File_Exit_ID,	;
		HyperLabel{#FileExit,	;
			"E&xit	ALT+F4",	;
			"End of application",	;
			"File_Exit"})
	self:RegisterItem(IDM_BasicMenu_Window_ID,	;
		HyperLabel{#_Window,	;
			"&Window",	;
			"Arrange child windows",	;
			,},self:Handle( ),1)
	self:RegisterItem(IDM_BasicMenu_Window_Cascade_ID,	;
		HyperLabel{#WindowCascade,	;
			"&Cascade	F4",	;
			"Arranges child windows in a cascade",	;
			,})
	self:RegisterItem(IDM_BasicMenu_Window_Tile_ID,	;
		HyperLabel{#WindowTile,	;
			"&Tile	SHIFT+F4",	;
			"Arranges child windows tiled",	;
			,})
	self:RegisterItem(IDM_BasicMenu_Window_Close_All_ID,	;
		HyperLabel{#CloseAllChildren,	;
			"Close &All",	;
			,	;
			,})

	self:SetAutoUpDate( 1 )

	oTB := Toolbar{ }

	oTB:ButtonStyle := TB_ICONONLY

	oTB:AppendItem(IDT_NEW,IDM_BasicMenu_File_New_ID)
	oTB:AddTipText(IDT_NEW,IDM_BasicMenu_File_New_ID,"New File")

	oTB:AppendItem(IDT_OPEN,IDM_BasicMenu_File_Open_ID)
	oTB:AddTipText(IDT_OPEN,IDM_BasicMenu_File_Open_ID,"Open File")

	oTB:AppendItem(IDT_SAVE,IDM_BasicMenu_File_Save_ID)
	oTB:AddTipText(IDT_SAVE,IDM_BasicMenu_File_Save_ID,"Save File")

	oTB:Flat := true

	self:ToolBar := oTB

	self:Accelerator := BasicMenu_Accelerator{ }

	return self
END CLASS
CLASS BasicMenu_Accelerator INHERIT Accelerator
 
CONSTRUCTOR( ) 
	SUPER(ResourceID{IDA_BasicMenu, _GetInst( )})

	return self
END CLASS
