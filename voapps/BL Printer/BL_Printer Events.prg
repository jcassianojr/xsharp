CLASS BL_PrinterPageEvent INHERIT @@Event
	
	PROTECT nPage AS INT
	

CONSTRUCTOR(hWnd, uMsg, wParam, lParam, oWindow, nPage) 

	SUPER(hWnd, uMsg, wParam, lParam, oWindow)	

	SELF:nPage := nPage
	
	RETURN SELF


ACCESS Page 
	RETURN SELF:nPage


END CLASS
