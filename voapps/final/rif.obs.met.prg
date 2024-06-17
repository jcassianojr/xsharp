CLASS XJRIFOBS INHERIT JRIFOBS

CONSTRUCTOR(oOWNER,aOBS) 
SUPER(OOWNER)	
SELF:oDClinha01:caption:=aOBS[1]
SELF:oDClinha02:caption:=aOBS[2]
SELF:oDClinha03:caption:=aOBS[3]
SELF:oDClinha04:caption:=aOBS[4]
SELF:oDClinha05:caption:=aOBS[5]
SELF:oDClinha06:caption:=aOBS[6]


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	    FabCenterWindow( SELF )
	RETURN NIL



END CLASS
