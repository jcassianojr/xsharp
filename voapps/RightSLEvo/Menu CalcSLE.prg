#region DEFINES
Define IDA_CalcSLEContextMenu := "CalcSLEContextMenu"
Define IDM_CalcSLEContextMenu := "CalcSLEContextMenu"
Define IDM_CalcSLEContextMenu_File_Calculator_ID := 22568
Define IDM_CalcSLEContextMenu_File_ID := 22567
#endregion

CLASS CalcSLEContextMenu INHERIT Menu
 
CONSTRUCTOR(oOwner) 

	SUPER(ResourceID{IDM_CalcSLEContextMenu, _GetInst( )})

	self:RegisterItem(IDM_CalcSLEContextMenu_File_ID,	;
		HyperLabel{#_File,	;
			"&File",	;
			,	;
			,},self:Handle( ),0)
	self:RegisterItem(IDM_CalcSLEContextMenu_File_Calculator_ID,	;
		HyperLabel{#File_Calculator,	;
			"&Calculator",	;
			"Popup Calculator",	;
			,})

	return self
END CLASS
