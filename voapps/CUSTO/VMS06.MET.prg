PARTIAL CLASS JSEQ
METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
oDCAREA:FillUsing(PEGCOMBO("MP05.DBF","DESCRI","CODIGO"))
	RETURN NIL



END CLASS
