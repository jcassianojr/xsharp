DEFINE IDM_CalcSLEContextMenu_File_ID := 22567
DEFINE IDM_CalcSLEContextMenu_File_Calculator_ID := 22568
PARTIAL CLASS CalcSLEContextMenu INHERIT Menu

CONSTRUCTOR( oOwner )

	SELF:PreInit()

	SUPER( ResourceID { "CalcSLEContextMenu" , _GetInst( ) } )

	SELF:RegisterItem(IDM_CalcSLEContextMenu_File_ID, ;
		HyperLabel{ #CalcSLEContextMenu_File , "&File" ,  ,  } , SELF:Handle() , 0)

	SELF:RegisterItem(IDM_CalcSLEContextMenu_File_Calculator_ID, ;
		HyperLabel{ #CalcSLEContextMenu_File_Calculator , "&Calculator" , "Popup Calculator" ,  })

	SELF:PostInit()

	RETURN

END CLASS

