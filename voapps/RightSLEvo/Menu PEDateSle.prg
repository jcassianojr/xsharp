DEFINE IDM_PEDateSleContextMenu_File_ID := 22579
DEFINE IDM_PEDateSleContextMenu_File_Today_ID := 22580
DEFINE IDM_PEDateSleContextMenu_File_Calendar_ID := 22581
PARTIAL CLASS PEDateSleContextMenu INHERIT Menu

CONSTRUCTOR( oOwner )

	SELF:PreInit()

	SUPER( ResourceID { "PEDateSleContextMenu" , _GetInst( ) } )

	SELF:RegisterItem(IDM_PEDateSleContextMenu_File_ID, ;
		HyperLabel{ #File , "&File" ,  , "File" } , SELF:Handle() , 0)

	SELF:RegisterItem(IDM_PEDateSleContextMenu_File_Today_ID, ;
		HyperLabel{ #PEDateSleContextMenu_File_Today , "&Today" , "Today's Date" ,  })

	SELF:RegisterItem(IDM_PEDateSleContextMenu_File_Calendar_ID, ;
		HyperLabel{ #PEDateSleContextMenu_File_Calendar , "&Calendar..." , "Open the calendar" ,  })

	SELF:PostInit()

	RETURN

END CLASS

