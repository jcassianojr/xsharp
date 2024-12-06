#region DEFINES
Define IDA_DemoChildMenu := "DemoChildMenu"
Define IDM_DemoChildMenu := "DemoChildMenu"
Define IDM_DemoChildMenu_f3_ID := 24629
Define IDM_DemoChildMenu_f3_Info_ID := 24630
Define IDM_DemoChildMenu_File_Exit_ID := 24625
Define IDM_DemoChildMenu_File_ID := 24611
Define IDM_DemoChildMenu_File_Preview_Bitmap_ID := 24616
Define IDM_DemoChildMenu_File_Preview_Database_ID := 24615
Define IDM_DemoChildMenu_File_Preview_German_ID := 24613
Define IDM_DemoChildMenu_File_Preview_ID := 24612
Define IDM_DemoChildMenu_File_Preview_Large_Callback_ID := 24619
Define IDM_DemoChildMenu_File_Preview_Large_ID := 24618
Define IDM_DemoChildMenu_File_Preview_like_Acrobat_ID := 24614
Define IDM_DemoChildMenu_File_Preview_RTF_Background_ID := 24620
Define IDM_DemoChildMenu_File_Preview_Textfile_ID := 24617
Define IDM_DemoChildMenu_File_Print_ID := 24622
Define IDM_DemoChildMenu_File_Print_Setup_ID := 24623
Define IDM_DemoChildMenu_Window_Cascade_ID := 24627
Define IDM_DemoChildMenu_Window_ID := 24626
Define IDM_DemoChildMenu_Window_Tile_ID := 24628
#endregion

CLASS DemoChildMenu INHERIT Menu 

CONSTRUCTOR(oOwner) 
	local oTB as Toolbar 

	SELF:PreInit()
	SUPER(ResourceID{IDM_DemoChildMenu, _GetInst( )})

	self:RegisterItem(IDM_DemoChildMenu_File_ID,	;
		HyperLabel{#_File,	;
			"&File",	;
			,	;
			,},self:Handle( ),0)
	self:RegisterItem(IDM_DemoChildMenu_File_Preview_ID,	;
		HyperLabel{#Preview,	;
			"Pre&view",	;
			,	;
			,})
	self:RegisterItem(IDM_DemoChildMenu_File_Preview_German_ID,	;
		HyperLabel{#PreviewGerman,	;
			"Preview German",	;
			,	;
			,})
	self:RegisterItem(IDM_DemoChildMenu_File_Preview_like_Acrobat_ID,	;
		HyperLabel{#PreviewAcrobat,	;
			"Preview like Acrobat",	;
			,	;
			,})
	self:RegisterItem(IDM_DemoChildMenu_File_Preview_Database_ID,	;
		HyperLabel{#PreviewDatabase,	;
			"Preview Database",	;
			,	;
			,})
	self:RegisterItem(IDM_DemoChildMenu_File_Preview_Bitmap_ID,	;
		HyperLabel{#PreviewBitmap,	;
			"Preview Bitmap",	;
			,	;
			,})
	self:RegisterItem(IDM_DemoChildMenu_File_Preview_Textfile_ID,	;
		HyperLabel{#PreviewTextfile,	;
			"Preview Textfile",	;
			,	;
			,})
	self:RegisterItem(IDM_DemoChildMenu_File_Preview_Large_ID,	;
		HyperLabel{#PreviewLarge,	;
			"Preview Large",	;
			,	;
			,})
	self:RegisterItem(IDM_DemoChildMenu_File_Preview_Large_Callback_ID,	;
		HyperLabel{#PreviewLargeCallback,	;
			"Preview Large Callback",	;
			,	;
			,})
	self:RegisterItem(IDM_DemoChildMenu_File_Preview_RTF_Background_ID,	;
		HyperLabel{#PreviewRTF,	;
			"Preview RTF Background",	;
			,	;
			,})
	self:RegisterItem(IDM_DemoChildMenu_File_Print_ID,	;
		HyperLabel{#PrintAll,	;
			"&Print...",	;
			,	;
			,})
	self:RegisterItem(IDM_DemoChildMenu_File_Print_Setup_ID,	;
		HyperLabel{#FilePrinterSetup,	;
			"P&rint Setup...",	;
			"Setup printer options",	;
			"File_Printer_Setup"})
	self:RegisterItem(IDM_DemoChildMenu_File_Exit_ID,	;
		HyperLabel{#FileExit,	;
			"&Exit",	;
			,	;
			,})
	self:RegisterItem(IDM_DemoChildMenu_Window_ID,	;
		HyperLabel{#Window,	;
			"&Window",	;
			"Arrange child windows",	;
			,},self:Handle( ),1)
	self:RegisterItem(IDM_DemoChildMenu_Window_Cascade_ID,	;
		HyperLabel{#WindowCascade,	;
			"&Cascade",	;
			"Arrange child windows in a cascade",	;
			"WindowCascade"})
	self:RegisterItem(IDM_DemoChildMenu_Window_Tile_ID,	;
		HyperLabel{#WindowTile,	;
			"&Tile",	;
			"Arrange child windows tiled",	;
			"WindowTile"})
	self:RegisterItem(IDM_DemoChildMenu_f3_ID,	;
		HyperLabel{#_f3,	;
			"&?",	;
			,	;
			,},self:Handle( ),2)
	self:RegisterItem(IDM_DemoChildMenu_f3_Info_ID,	;
		HyperLabel{#DlgInfo,	;
			"&Info",	;
			,	;
			,})
	self:SetAutoUpdate( 1 ) 

	oTB := Toolbar{ }
	oTB:ButtonStyle := TB_ICONONLY
	oTB:Flat := TRUE
	oTB:EnableBands(FALSE)

	oTB:AppendItem(IDT_CLOSE,IDM_DemoChildMenu_File_Exit_ID)
	oTB:AddTipText(IDT_CLOSE,IDM_DemoChildMenu_File_Exit_ID,"Exit Program")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_PRINT,IDM_DemoChildMenu_File_Print_ID)
	oTB:AddTipText(IDT_PRINT,IDM_DemoChildMenu_File_Print_ID,"Print")

	oTB:AppendItem(IDT_PREVIEW,IDM_DemoChildMenu_File_Preview_ID)
	oTB:AddTipText(IDT_PREVIEW,IDM_DemoChildMenu_File_Preview_ID,"Preview")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_HELP,IDM_DemoChildMenu_f3_Info_ID)
	oTB:AddTipText(IDT_HELP,IDM_DemoChildMenu_f3_Info_ID,"Help")

	self:ToolBar := oTB

	SELF:PostInit()
	return self
END CLASS
