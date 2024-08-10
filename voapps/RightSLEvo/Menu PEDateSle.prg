#region DEFINES
Define IDA_PEDateSleContextMenu := "PEDateSleContextMenu"
Define IDM_PEDateSleContextMenu := "PEDateSleContextMenu"
Define IDM_PEDateSleContextMenu_File_Calendar_ID := 22581
Define IDM_PEDateSleContextMenu_File_ID := 22579
Define IDM_PEDateSleContextMenu_File_Today_ID := 22580
#endregion

CLASS PEDateSleContextMenu INHERIT Menu
 
CONSTRUCTOR(oOwner) 

	SUPER(ResourceID{IDM_PEDateSleContextMenu, _GetInst( )})

	SELF:RegisterItem(IDM_PEDateSleContextMenu_File_ID,	;
		HyperLabel{#File,	;
			"&File",	;
			,	;
			"File"},SELF:Handle( ),0)
	SELF:RegisterItem(IDM_PEDateSleContextMenu_File_Today_ID,	;
		HyperLabel{#File_Today,	;
			"&Today",	;
			"Today's Date",	;
			,})
	SELF:RegisterItem(IDM_PEDateSleContextMenu_File_Calendar_ID,	;
		HyperLabel{#File_Calendar,	;
			"&Calendar...",	;
			"Open the calendar",	;
			,})

	RETURN SELF


END CLASS
