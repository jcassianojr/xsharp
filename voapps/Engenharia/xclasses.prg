﻿CLASS XINDEXAR INHERIT Indexar

CONSTRUCTOR(oOWNER) 
IF ! entramenu("ENG",5)
	RETU SELF
ENDIF	
SUPER(oOWNER,cHELP)
SELF:SHOW()	

METHOD PushButton1() 
SELF:POINTER:=POINTER{POINTERHOURGLASS}
CRIANTX({ZCURINI,"LC.DBF",ZCURDIR})
CRIANTX({ZCURINI,"LCT.DBF",ZCURDIR})
SELF:POINTER:=POINTER{}
SELF:ENDWINDOW()


END CLASS
