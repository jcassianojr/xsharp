CLASS XINDEXAR INHERIT INDEXAR

CONSTRUCTOR(oOWNER) 
IF ! ENTRAMENU("INS",90)
	RETU SELF
ENDIF	
SUPER(oOWNER,cHELP)
SELF:SHOW()		

METHOD PushButton1() 
SELF:POINTER:=POINTER{POINTERHOURGLASS}
CRIANTX({ZCURINI,"ME04.DBF",ZCURDIR})
CRIANTX({ZCURINI,"ME04C.DBF",ZCURDIR})
CRIANTX({ZCURINI,"ME04R.DBF",ZCURDIR})
CRIANTX({ZCURINI,"ME04CI.DBF",ZCURDIR})
CRIANTX({ZCURINI,"ME04D.DBF",ZCURDIR})
CRIANTX({ZCURINI,"ME06.DBF",ZCURDIR})
CRIANTX({ZCURINI,"ME06R.DBF",ZCURDIR})
CRIANTX({ZCURINI,"ME06X.DBF",ZCURDIR})
CRIANTX({ZCURINI,"ME4CC.DBF",ZCURDIR})
CRIANTX({ZCURINI,"ME4CCI.DBF",ZCURDIR})
CRIANTX({ZCURINI,"RRM.DBF",ZCURDIR})
SELF:POINTER:=POINTER{}
SELF:ENDWINDOW()

END CLASS
CLASS XJACO INHERIT JACO

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! ENTRAMENU("INS",2)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"ME04D.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			

END CLASS
CLASS XjFOR INHERIT JFOR		

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! ENTRAMENU("INS",8)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"MB01.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			

END CLASS
CLASS XJME4CC INHERIT JME4CC	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER,oSERVE2 AS USEREDE
LOCAL aDAD AS ARRAY
IF ! entramenu("INS",14)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"ME4CC.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
aDAD:={zCURINI,"ME4CCI.DBF",zCURDIR}
oSERVE2:=USEREDE{aDAD}
IF oSERVE2:nERRO#0
	oSERVER:Close() //Fecha Master
   RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:oSFJME4CCI:USE(oSERVE2)
SELF:SetSelectiveRelation(oSFJME4CCI,"NUMERO")
SELF:SHOW()		

END CLASS
CLASS XJMP05 INHERIT JMP05

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! ENTRAMENU("INS",5)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"MP05.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,Oserver)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			

END CLASS
CLASS XJMPO INHERIT JMOP

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! ENTRAMENU("INS",6)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"MP02.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			

END CLASS
CLASS XJOCC INHERIT JOCC

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER,oSERVE2 AS USEREDE
LOCAL aDAD AS ARRAY
IF ! ENTRAMENU("INS",4)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"ME04C.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
aDAD:={zCURINI,"ME04CI.DBF",zCURDIR}
oSERVE2:=USEREDE{aDAD}
IF oSERVE2:nERRO#0
	oSERVER:Close() //Fecha Master
   RETU SELF
ENDIF
oSERVE2:SetOrder(2)
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:OSFJOCCI:USE(oSERVE2)
SELF:SetSelectiveRelation(oSFJOCCI,"OCC")
SELF:SHOW()		


END CLASS
PARTIAL CLASS XJREQ INHERIT JREQ

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! ENTRAMENU("INS",3)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"ME04R.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			


END CLASS
PARTIAL CLASS XJREU INHERIT JREQ	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! ENTRAMENU("INS",10)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"ME06R.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			

END CLASS

