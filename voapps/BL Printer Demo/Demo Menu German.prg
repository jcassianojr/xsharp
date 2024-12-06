#region DEFINES
Define IDA_MenuVorschau := "MenuVorschau"
Define IDM_MenuVorschau := "MenuVorschau"
Define IDM_MenuVorschau_Ansicht_Erste_Seite_ID := 1359
Define IDM_MenuVorschau_Ansicht_ID := 1358
Define IDM_MenuVorschau_Ansicht_Letzte_Seite_ID := 1362
Define IDM_MenuVorschau_Ansicht_Lupe_ID := 1364
Define IDM_MenuVorschau_Ansicht_Nächste_Seite_ID := 1361
Define IDM_MenuVorschau_Ansicht_Vorherige_Seite_ID := 1360
Define IDM_MenuVorschau_Datei_Beenden_ID := 1357
Define IDM_MenuVorschau_Datei_ID := 1352
Define IDM_MenuVorschau_Datei_Schließen_ID := 1353
Define IDM_MenuVorschau_Datei_Seite_drucken_ID := 1355
Define IDM_MenuVorschau_f3_ID := 1386
Define IDM_MenuVorschau_f3_Info_ID := 1387
Define IDM_MenuVorschau_Fenster_ID := 1382
Define IDM_MenuVorschau_Fenster_Nebeneinander_ID := 1384
Define IDM_MenuVorschau_Fenster_Überlappend_ID := 1383
Define IDM_MenuVorschau_Fenster_Untereinander_ID := 1385
Define IDM_MenuVorschau_Zoom___25_52_ID := 1377
Define IDM_MenuVorschau_Zoom___50_52_ID := 1376
Define IDM_MenuVorschau_Zoom___75_52_ID := 1375
Define IDM_MenuVorschau_Zoom__100_52_ID := 1374
Define IDM_MenuVorschau_Zoom__150_52_ID := 1373
Define IDM_MenuVorschau_Zoom__1600_52_ID := 1366
Define IDM_MenuVorschau_Zoom__200_52_ID := 1372
Define IDM_MenuVorschau_Zoom__250_52_ID := 1371
Define IDM_MenuVorschau_Zoom__300_52_ID := 1370
Define IDM_MenuVorschau_Zoom__400_52_ID := 1369
Define IDM_MenuVorschau_Zoom__800_52_ID := 1367
Define IDM_MenuVorschau_Zoom_Ganze_Seite_ID := 1379
Define IDM_MenuVorschau_Zoom_ID := 1365
Define IDM_MenuVorschau_Zoom_Seitenbreite_ID := 1380
Define IDM_MenuVorschau_Zoom_Seitenhöhe_ID := 1381
#endregion

CLASS MenuVorschau INHERIT BL_PRINTERMENU

CONSTRUCTOR(oOwner) 
	local oTB as Toolbar

	SELF:PreInit()
	SUPER(ResourceID{IDM_MenuVorschau, _GetInst( )})

	self:RegisterItem(IDM_MenuVorschau_Datei_ID,	;
		HyperLabel{#_Datei,	;
			"&Datei",	;
			,	;
			,},self:Handle( ),0)
	self:RegisterItem(IDM_MenuVorschau_Datei_Schließen_ID,	;
		HyperLabel{#EndWindow,	;
			"&Schließen",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Datei_Seite_drucken_ID,	;
		HyperLabel{#PrintPage,	;
			"Seite &drucken",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Datei_Beenden_ID,	;
		HyperLabel{#FileExit,	;
			"&Beenden",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Ansicht_ID,	;
		HyperLabel{#_Ansicht,	;
			"&Ansicht",	;
			,	;
			,},self:Handle( ),1)
	self:RegisterItem(IDM_MenuVorschau_Ansicht_Erste_Seite_ID,	;
		HyperLabel{#FirstPage,	;
			"&Erste Seite	POS1",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Ansicht_Vorherige_Seite_ID,	;
		HyperLabel{#PreviousPage,	;
			"&Vorherige Seite	BILD-NACH-OBEN",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Ansicht_Nächste_Seite_ID,	;
		HyperLabel{#NextPage,	;
			"&Nächste Seite	BILD-NACH-UNTEN",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Ansicht_Letzte_Seite_ID,	;
		HyperLabel{#LastPage,	;
			"&Letzte Seite	ENDE",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Ansicht_Lupe_ID,	;
		HyperLabel{#InOutZoom,	;
			"Lupe",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom_ID,	;
		HyperLabel{#_Zoom,	;
			"&Zoom",	;
			,	;
			,},self:Handle( ),2)
	self:RegisterItem(IDM_MenuVorschau_Zoom__1600_52_ID,	;
		HyperLabel{#Zoom1600,	;
			"1600 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom__800_52_ID,	;
		HyperLabel{#Zoom800,	;
			"800 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom__400_52_ID,	;
		HyperLabel{#Zoom400,	;
			"400 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom__300_52_ID,	;
		HyperLabel{#Zoom300,	;
			"300 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom__250_52_ID,	;
		HyperLabel{#Zoom250,	;
			"250 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom__200_52_ID,	;
		HyperLabel{#Zoom200,	;
			"200 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom__150_52_ID,	;
		HyperLabel{#Zoom150,	;
			"150 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom__100_52_ID,	;
		HyperLabel{#Zoom100,	;
			"100 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom___75_52_ID,	;
		HyperLabel{#Zoom075,	;
			"  75 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom___50_52_ID,	;
		HyperLabel{#Zoom050,	;
			"  50 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom___25_52_ID,	;
		HyperLabel{#Zoom025,	;
			"  25 %",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom_Ganze_Seite_ID,	;
		HyperLabel{#ZoomPage,	;
			"Ganze Seite",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom_Seitenbreite_ID,	;
		HyperLabel{#ZoomWidth,	;
			"Seitenbreite",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Zoom_Seitenhöhe_ID,	;
		HyperLabel{#ZoomHeight,	;
			"Seitenhöhe",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Fenster_ID,	;
		HyperLabel{#_Fenster,	;
			"&Fenster",	;
			,	;
			,},self:Handle( ),3)
	self:RegisterItem(IDM_MenuVorschau_Fenster_Überlappend_ID,	;
		HyperLabel{#WindowCascade,	;
			"&Überlappend",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Fenster_Nebeneinander_ID,	;
		HyperLabel{#WindowTile,	;
			"&Nebeneinander",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_Fenster_Untereinander_ID,	;
		HyperLabel{#WindowTileHorz,	;
			"&Untereinander",	;
			,	;
			,})
	self:RegisterItem(IDM_MenuVorschau_f3_ID,	;
		HyperLabel{#_f3,	;
			"&?",	;
			,	;
			,},self:Handle( ),4)
	self:RegisterItem(IDM_MenuVorschau_f3_Info_ID,	;
		HyperLabel{#DlgInfo,	;
			"&Info",	;
			,	;
			,})

	self:SetAutoUpDate( 3 )

	oTB := Toolbar{ }
	oTB:ButtonStyle := TB_ICONONLY
	oTB:EnableBands(FALSE)

	oTB:AppendItem(IDT_NEWSHEET,IDM_MenuVorschau_Datei_Schließen_ID)
	oTB:AddTipText(IDT_NEWSHEET,IDM_MenuVorschau_Datei_Schließen_ID,"Vorschau schließen")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_OPEN,IDM_MenuVorschau_Datei_Seite_drucken_ID)
	oTB:AddTipText(IDT_OPEN,IDM_MenuVorschau_Datei_Seite_drucken_ID,"Seite drucken")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_PRINT,IDM_MenuVorschau_Ansicht_Erste_Seite_ID)
	oTB:AddTipText(IDT_PRINT,IDM_MenuVorschau_Ansicht_Erste_Seite_ID,"Erste Seite")

	oTB:AppendItem(IDT_SUM,IDM_MenuVorschau_Ansicht_Vorherige_Seite_ID)
	oTB:AddTipText(IDT_SUM,IDM_MenuVorschau_Ansicht_Vorherige_Seite_ID,"Vorherige Seite")

	oTB:AppendItem(IDT_BOLD,IDM_MenuVorschau_Ansicht_Nächste_Seite_ID)
	oTB:AddTipText(IDT_BOLD,IDM_MenuVorschau_Ansicht_Nächste_Seite_ID,"Nächste Seite")

	oTB:AppendItem(IDT_PREVIEW,IDM_MenuVorschau_Ansicht_Letzte_Seite_ID)
	oTB:AddTipText(IDT_PREVIEW,IDM_MenuVorschau_Ansicht_Letzte_Seite_ID,"Letzte Seite")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_ITALIC,IDM_MenuVorschau_Ansicht_Lupe_ID)
	oTB:AddTipText(IDT_ITALIC,IDM_MenuVorschau_Ansicht_Lupe_ID,"Lupe")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_SAVE,IDM_MenuVorschau_f3_Info_ID)
	oTB:AddTipText(IDT_SAVE,IDM_MenuVorschau_f3_Info_ID,"Programm Info")

	oTB:Bitmap := TB_BL_Printer{}
	oTB:ButtonSize := Dimension{16, 16}

	oTB:Flat := true

	self:ToolBar := oTB

	self:Accelerator := MenuVorschau_Accelerator{ }

	SELF:PostInit()
	return self
END CLASS
CLASS MenuVorschau_Accelerator INHERIT Accelerator
 
CONSTRUCTOR( ) 
	SUPER(ResourceID{IDA_MenuVorschau, _GetInst( )})

	return self

END CLASS
