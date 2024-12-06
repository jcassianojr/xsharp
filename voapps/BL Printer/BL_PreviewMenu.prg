#region DEFINES
Define IDA_MenuPreview := "MenuPreview"
Define IDA_MenuPreviewContext := "MenuPreviewContext"
Define IDM_MenuPreview := "MenuPreview"
Define IDM_MenuPreview_f3_ID := 25655
Define IDM_MenuPreview_f3_Info_ID := 25656
Define IDM_MenuPreview_File_Close_ID := 25626
Define IDM_MenuPreview_File_Exit_ID := 25631
Define IDM_MenuPreview_File_ID := 25625
Define IDM_MenuPreview_File_Print_All_ID := 25629
Define IDM_MenuPreview_File_Print_Page_ID := 25628
Define IDM_MenuPreview_View_First_ID := 25633
Define IDM_MenuPreview_View_ID := 25632
Define IDM_MenuPreview_View_Last_ID := 25636
Define IDM_MenuPreview_View_Next_ID := 25635
Define IDM_MenuPreview_View_Previous_ID := 25634
Define IDM_MenuPreview_View_Zoom_inf2out_ID := 25638
Define IDM_MenuPreview_Window_Cascade_ID := 25653
Define IDM_MenuPreview_Window_ID := 25652
Define IDM_MenuPreview_Window_Tile_ID := 25654
Define IDM_MenuPreview_Zoom___25_52_ID := 25647
Define IDM_MenuPreview_Zoom___50_52_ID := 25646
Define IDM_MenuPreview_Zoom___75_52_ID := 25645
Define IDM_MenuPreview_Zoom__100_52_ID := 25644
Define IDM_MenuPreview_Zoom__150_52_ID := 25643
Define IDM_MenuPreview_Zoom__200_52_ID := 25642
Define IDM_MenuPreview_Zoom__300_52_ID := 25641
Define IDM_MenuPreview_Zoom__400_52_ID := 25640
Define IDM_MenuPreview_Zoom_ID := 25639
Define IDM_MenuPreview_Zoom_Page_Height_ID := 25651
Define IDM_MenuPreview_Zoom_Page_ID := 25649
Define IDM_MenuPreview_Zoom_Page_Width_ID := 25650
Define IDM_MenuPreviewContext := "MenuPreviewContext"
Define IDM_MenuPreviewContext_Zoom_Dummy_ID := 25648
Define IDM_MenuPreviewContext_Zoom_ID := 25647
#endregion

CLASS MenuPreview INHERIT BL_PRINTERMENU

CONSTRUCTOR(oOwner) 
	local oTB as Toolbar

	SELF:PreInit()
	SUPER(ResourceID{IDM_MenuPreview, _GetInst( )})

	self:RegisterItem(IDM_MenuPreview_File_ID,	;
		HyperLabel{#_File,	;
			"File",	;
			,	;
			,},self:Handle( ),0)
	self:RegisterItem(IDM_MenuPreview_File_Close_ID,	;
		HyperLabel{#EndWindow,	;
			"&Close",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_File_Print_Page_ID,	;
		HyperLabel{#PrintPage,	;
			"&Print Page	STRG+P",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_File_Print_All_ID,	;
		HyperLabel{#PrintAll,	;
			"Print &All",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_File_Exit_ID,	;
		HyperLabel{#FileExit,	;
			"E&xit	ALT+F4",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_View_ID,	;
		HyperLabel{#_View,	;
			"&View",	;
			,	;
			,},self:Handle( ),1)
	self:RegisterItem(IDM_MenuPreview_View_First_ID,	;
		HyperLabel{#FirstPage,	;
			"&First	POS1",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_View_Previous_ID,	;
		HyperLabel{#PreviousPage,	;
			"&Previous	BILD-NACH-OBEN",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_View_Next_ID,	;
		HyperLabel{#NextPage,	;
			"&Next	BILD-NACH-UNTEN",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_View_Last_ID,	;
		HyperLabel{#LastPage,	;
			"&Last	ENDE",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_View_Zoom_inf2out_ID,	;
		HyperLabel{#InOutZoom,	;
			"Zoom in/out",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_Zoom_ID,	;
		HyperLabel{#_Zoom,	;
			"&Zoom",	;
			,	;
			,},self:Handle( ),2)
	self:RegisterItem(IDM_MenuPreview_Zoom__400_52_ID,	;
		HyperLabel{#Zoom400,	;
			"400 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_Zoom__300_52_ID,	;
		HyperLabel{#Zoom300,	;
			"300 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_Zoom__200_52_ID,	;
		HyperLabel{#Zoom200,	;
			"200 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_Zoom__150_52_ID,	;
		HyperLabel{#Zoom150,	;
			"150 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_Zoom__100_52_ID,	;
		HyperLabel{#Zoom100,	;
			"100 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_Zoom___75_52_ID,	;
		HyperLabel{#Zoom075,	;
			"  75 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_Zoom___50_52_ID,	;
		HyperLabel{#Zoom050,	;
			"  50 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_Zoom___25_52_ID,	;
		HyperLabel{#Zoom025,	;
			"  25 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_Zoom_Page_ID,	;
		HyperLabel{#ZoomPage,	;
			"Page",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_Zoom_Page_Width_ID,	;
		HyperLabel{#ZoomWidth,	;
			"Page Width",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_Zoom_Page_Height_ID,	;
		HyperLabel{#ZoomHeight,	;
			"Page Height",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreview_Window_ID,	;
		HyperLabel{#Window,	;
			"&Window",	;
			"Arrange child windows",	;
			,},self:Handle( ),3)
	self:RegisterItem(IDM_MenuPreview_Window_Cascade_ID,	;
		HyperLabel{#WindowCascade,	;
			"&Cascade",	;
			"Arrange child windows in a cascade",	;
			"WindowCascade"})
	self:RegisterItem(IDM_MenuPreview_Window_Tile_ID,	;
		HyperLabel{#WindowTile,	;
			"&Tile",	;
			"Arrange child windows tiled",	;
			"WindowTile"})
	self:RegisterItem(IDM_MenuPreview_f3_ID,	;
		HyperLabel{#_f3,	;
			"&?",	;
			,	;
			,},self:Handle( ),4)
	self:RegisterItem(IDM_MenuPreview_f3_Info_ID,	;
		HyperLabel{#DlgInfo,	;
			"&Info",	;
			,	;
			,})

	self:SetAutoUpDate( 3 )

	oTB := Toolbar{ }
	oTB:ButtonStyle := TB_ICONONLY
	oTB:EnableBands(FALSE)

	oTB:AppendItem(IDT_NEWSHEET,IDM_MenuPreview_File_Close_ID)
	oTB:AddTipText(IDT_NEWSHEET,IDM_MenuPreview_File_Close_ID,"Close Preview")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_OPEN,IDM_MenuPreview_File_Print_Page_ID)
	oTB:AddTipText(IDT_OPEN,IDM_MenuPreview_File_Print_Page_ID,"Print Page")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_PRINT,IDM_MenuPreview_View_First_ID)
	oTB:AddTipText(IDT_PRINT,IDM_MenuPreview_View_First_ID,"First Page")

	oTB:AppendItem(IDT_SUM,IDM_MenuPreview_View_Previous_ID)
	oTB:AddTipText(IDT_SUM,IDM_MenuPreview_View_Previous_ID,"Previous Page")

	oTB:AppendItem(IDT_BOLD,IDM_MenuPreview_View_Next_ID)
	oTB:AddTipText(IDT_BOLD,IDM_MenuPreview_View_Next_ID,"Next Page")

	oTB:AppendItem(IDT_PREVIEW,IDM_MenuPreview_View_Last_ID)
	oTB:AddTipText(IDT_PREVIEW,IDM_MenuPreview_View_Last_ID,"Last Page")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_ITALIC,IDM_MenuPreview_View_Zoom_inf2out_ID)
	oTB:AddTipText(IDT_ITALIC,IDM_MenuPreview_View_Zoom_inf2out_ID,"Zoom in/out")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_SAVE,IDM_MenuPreview_f3_Info_ID)
	oTB:AddTipText(IDT_SAVE,IDM_MenuPreview_f3_Info_ID,"Program Info")

	oTB:Bitmap := TB_BL_Printer{}
	oTB:ButtonSize := Dimension{16, 16}

	oTB:Flat := true

	self:ToolBar := oTB

	self:Accelerator := MenuPreview_Accelerator{ }

	SELF:PostInit()
	return self
END CLASS
CLASS MenuPreview_Accelerator INHERIT Accelerator
 
CONSTRUCTOR( ) 
	SUPER(ResourceID{IDA_MenuPreview, _GetInst( )})

	return self
END CLASS
CLASS MenuPreviewContext INHERIT BL_PRINTERMENU

CONSTRUCTOR(oOwner) 

	SELF:PreInit()
	SUPER(ResourceID{IDM_MenuPreviewContext, _GetInst( )})

	self:RegisterItem(IDM_MenuPreviewContext_Zoom_ID,	;
		HyperLabel{#_Zoom,	;
			"&Zoom",	;
			,	;
			,},self:Handle( ),0)
	self:RegisterItem(IDM_MenuPreviewContext_Zoom_Dummy_ID,	;
		HyperLabel{#Zoom_Dummy,	;
			"Dummy",	;
			,	;
			,})

	SELF:PostInit()
	return self

END CLASS
