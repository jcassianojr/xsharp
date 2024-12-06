#region DEFINES
Define IDA_MenuPreviewGe := "MenuPreviewGe"
Define IDM_MenuPreviewGe := "MenuPreviewGe"
Define IDM_MenuPreviewGe_Ansicht_Erste_Seite_ID := 25733
Define IDM_MenuPreviewGe_Ansicht_ID := 25732
Define IDM_MenuPreviewGe_Ansicht_Letzte_Seite_ID := 25736
Define IDM_MenuPreviewGe_Ansicht_Lupe_ID := 25738
Define IDM_MenuPreviewGe_Ansicht_Nächste_Seite_ID := 25735
Define IDM_MenuPreviewGe_Ansicht_Vorherige_Seite_ID := 25734
Define IDM_MenuPreviewGe_Datei_Alles_drucken_ID := 25729
Define IDM_MenuPreviewGe_Datei_Beenden_ID := 25731
Define IDM_MenuPreviewGe_Datei_ID := 25725
Define IDM_MenuPreviewGe_Datei_Schließen_ID := 25726
Define IDM_MenuPreviewGe_Datei_Seite_drucken_ID := 25728
Define IDM_MenuPreviewGe_f3_ID := 25757
Define IDM_MenuPreviewGe_f3_Info_ID := 25758
Define IDM_MenuPreviewGe_Fenster_ID := 25753
Define IDM_MenuPreviewGe_Fenster_Nebeneinander_ID := 25755
Define IDM_MenuPreviewGe_Fenster_Überlappend_ID := 25754
Define IDM_MenuPreviewGe_Fenster_Untereinander_ID := 25756
Define IDM_MenuPreviewGe_Zoom___25_52_ID := 25748
Define IDM_MenuPreviewGe_Zoom___50_52_ID := 25747
Define IDM_MenuPreviewGe_Zoom___75_52_ID := 25746
Define IDM_MenuPreviewGe_Zoom__100_52_ID := 25745
Define IDM_MenuPreviewGe_Zoom__150_52_ID := 25744
Define IDM_MenuPreviewGe_Zoom__200_52_ID := 25743
Define IDM_MenuPreviewGe_Zoom__250_52_ID := 25742
Define IDM_MenuPreviewGe_Zoom__300_52_ID := 25741
Define IDM_MenuPreviewGe_Zoom__400_52_ID := 25740
Define IDM_MenuPreviewGe_Zoom_Ganze_Seite_ID := 25750
Define IDM_MenuPreviewGe_Zoom_ID := 25739
Define IDM_MenuPreviewGe_Zoom_Seitenbreite_ID := 25751
Define IDM_MenuPreviewGe_Zoom_Seitenhöhe_ID := 25752
#endregion

CLASS MenuPreviewGe INHERIT BL_PRINTERMENU

CONSTRUCTOR(oOwner) 
	local oTB as Toolbar

	SELF:PreInit()
	SUPER(ResourceID{IDM_MenuPreviewGe, _GetInst( )})

	self:RegisterItem(IDM_MenuPreviewGe_Datei_ID,	;
		HyperLabel{#_Datei,	;
			"&Datei",	;
			,	;
			,},self:Handle( ),0)
	self:RegisterItem(IDM_MenuPreviewGe_Datei_Schließen_ID,	;
		HyperLabel{#EndWindow,	;
			"&Schließen",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Datei_Seite_drucken_ID,	;
		HyperLabel{#PrintPage,	;
			"Seite &drucken	STRG+P",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Datei_Alles_drucken_ID,	;
		HyperLabel{#PrintAll,	;
			"&Alles drucken",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Datei_Beenden_ID,	;
		HyperLabel{#FileExit,	;
			"&Beenden",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Ansicht_ID,	;
		HyperLabel{#_Ansicht,	;
			"&Ansicht",	;
			,	;
			,},self:Handle( ),1)
	self:RegisterItem(IDM_MenuPreviewGe_Ansicht_Erste_Seite_ID,	;
		HyperLabel{#FirstPage,	;
			"&Erste Seite	POS1",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Ansicht_Vorherige_Seite_ID,	;
		HyperLabel{#PreviousPage,	;
			"&Vorherige Seite	BILD-NACH-OBEN",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Ansicht_Nächste_Seite_ID,	;
		HyperLabel{#NextPage,	;
			"&Nächste Seite	BILD-NACH-UNTEN",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Ansicht_Letzte_Seite_ID,	;
		HyperLabel{#LastPage,	;
			"&Letzte Seite	ENDE",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Ansicht_Lupe_ID,	;
		HyperLabel{#InOutZoom,	;
			"Lupe",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Zoom_ID,	;
		HyperLabel{#_Zoom,	;
			"&Zoom",	;
			,	;
			,},self:Handle( ),2)
	self:RegisterItem(IDM_MenuPreviewGe_Zoom__400_52_ID,	;
		HyperLabel{#Zoom400,	;
			"400 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Zoom__300_52_ID,	;
		HyperLabel{#Zoom300,	;
			"300 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Zoom__250_52_ID,	;
		HyperLabel{#Zoom250,	;
			"250 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Zoom__200_52_ID,	;
		HyperLabel{#Zoom200,	;
			"200 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Zoom__150_52_ID,	;
		HyperLabel{#Zoom150,	;
			"150 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Zoom__100_52_ID,	;
		HyperLabel{#Zoom100,	;
			"100 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Zoom___75_52_ID,	;
		HyperLabel{#Zoom075,	;
			"  75 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Zoom___50_52_ID,	;
		HyperLabel{#Zoom050,	;
			"  50 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Zoom___25_52_ID,	;
		HyperLabel{#Zoom025,	;
			"  25 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Zoom_Ganze_Seite_ID,	;
		HyperLabel{#ZoomPage,	;
			"Ganze Seite",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Zoom_Seitenbreite_ID,	;
		HyperLabel{#ZoomWidth,	;
			"Seitenbreite",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Zoom_Seitenhöhe_ID,	;
		HyperLabel{#ZoomHeight,	;
			"Seitenhöhe",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Fenster_ID,	;
		HyperLabel{#_Fenster,	;
			"&Fenster",	;
			,	;
			,},self:Handle( ),3)
	self:RegisterItem(IDM_MenuPreviewGe_Fenster_Überlappend_ID,	;
		HyperLabel{#WindowCascade,	;
			"&Überlappend",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Fenster_Nebeneinander_ID,	;
		HyperLabel{#WindowTile,	;
			"&Nebeneinander",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_Fenster_Untereinander_ID,	;
		HyperLabel{#WindowTileHorz,	;
			"&Untereinander",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuPreviewGe_f3_ID,	;
		HyperLabel{#_f3,	;
			"&?",	;
			,	;
			,},self:Handle( ),4)
	self:RegisterItem(IDM_MenuPreviewGe_f3_Info_ID,	;
		HyperLabel{#DlgInfo,	;
			"&Info",	;
			,	;
			,})

	self:SetAutoUpDate( 3 )

	oTB := Toolbar{ }
	oTB:ButtonStyle := TB_ICONONLY
	oTB:EnableBands(FALSE)

	oTB:AppendItem(IDT_NEWSHEET,IDM_MenuPreviewGe_Datei_Schließen_ID)
	oTB:AddTipText(IDT_NEWSHEET,IDM_MenuPreviewGe_Datei_Schließen_ID,"Vorschau schließen")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_OPEN,IDM_MenuPreviewGe_Datei_Seite_drucken_ID)
	oTB:AddTipText(IDT_OPEN,IDM_MenuPreviewGe_Datei_Seite_drucken_ID,"Seite drucken")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_PRINT,IDM_MenuPreviewGe_Ansicht_Erste_Seite_ID)
	oTB:AddTipText(IDT_PRINT,IDM_MenuPreviewGe_Ansicht_Erste_Seite_ID,"Erste Seite")

	oTB:AppendItem(IDT_SUM,IDM_MenuPreviewGe_Ansicht_Vorherige_Seite_ID)
	oTB:AddTipText(IDT_SUM,IDM_MenuPreviewGe_Ansicht_Vorherige_Seite_ID,"Vorherige Seite")

	oTB:AppendItem(IDT_BOLD,IDM_MenuPreviewGe_Ansicht_Nächste_Seite_ID)
	oTB:AddTipText(IDT_BOLD,IDM_MenuPreviewGe_Ansicht_Nächste_Seite_ID,"Nächste Seite")

	oTB:AppendItem(IDT_PREVIEW,IDM_MenuPreviewGe_Ansicht_Letzte_Seite_ID)
	oTB:AddTipText(IDT_PREVIEW,IDM_MenuPreviewGe_Ansicht_Letzte_Seite_ID,"Letzte Seite")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_ITALIC,IDM_MenuPreviewGe_Ansicht_Lupe_ID)
	oTB:AddTipText(IDT_ITALIC,IDM_MenuPreviewGe_Ansicht_Lupe_ID,"Lupe")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_SAVE,IDM_MenuPreviewGe_f3_Info_ID)
	oTB:AddTipText(IDT_SAVE,IDM_MenuPreviewGe_f3_Info_ID,"Programm Info")

	oTB:Bitmap := TB_BL_Printer{}
	oTB:ButtonSize := Dimension{16, 16}

	oTB:Flat := true

	self:ToolBar := oTB

	self:Accelerator := MenuPreviewGe_Accelerator{ }

	SELF:PostInit()
	return self
END CLASS
CLASS MenuPreviewGe_Accelerator INHERIT Accelerator
 
CONSTRUCTOR( ) 
	SUPER(ResourceID{IDA_MenuPreviewGe, _GetInst( )})

	return self

END CLASS
