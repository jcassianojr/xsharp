PARTIAL CLASS jcrmtr
METHOD INCLUIR( ) 
	SELF:ENDWINDOW()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL



END CLASS
