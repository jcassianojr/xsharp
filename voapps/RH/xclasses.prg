CLASS XINDEXAR INHERIT INDEXAR	

CONSTRUCTOR(oOWNER) 
IF ! entramenu("RH",10)
	RETU SELF
ENDIF	
SUPER(oOWNER,CHELP)
SELF:SHOW()	

METHOD PushButton1() 
LOCAL aCOM AS ARRAY	
SELF:POINTER:=POINTER{POINTERHOURGLASS}
aCOM:={ZMES,ZANO,ZEMPRESA}
CRIANTX({ZCURINI,"CUREMI.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"CUREMP.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"CURSO.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"CURGRP.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"MP02.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"MP02C.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"MP02p.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"MP02TAL.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"MP04.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"MP04A.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"MP04C.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"MP05.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"MP06.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"MP06C.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"PROCEDIM.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"PT.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"PTI.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"TREII.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"TREIN.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"RHAB.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"RHABSEQ.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"RHABTB.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"RHESC.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"RHSEL.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"FUNCAO.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"FO_CHIS.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"TRJOB.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"TRJOBI.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"rhabcod.DBF",ZCURDIR},aCOM)
CRIANTX({ZCURINI,"rhselhist.DBF",ZCURDIR},aCOM)
SELF:POINTER:=POINTER{}
SELF:ENDWINDOW()	

END CLASS
CLASS XJCEM INHERIT JCEM	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER,oSERVE2 AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF ! entramenu("RH",6)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"CUREMP.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
AltD()
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
aDAD:={zCURINI,"CUREMI.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVE2:=USEREDE{aDAD,,,,aCOM}
IF oSERVE2:nERRO#0
	oSERVER:Close() //Fecha Master
   RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:oSFJCEI:USE(oSERVE2)
SELF:SetSelectiveRelation(oSFJCEI,"NUMERO")
SELF:SHOW()	

END CLASS
CLASS XJCODESC INHERIT JCODESC

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF ! entramenu("RH",2)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"RHESC.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	


END CLASS
CLASS XJCUR INHERIT JCUR

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER,oSERVE2 AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF ! entramenu("RH",5)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"CURSO.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
aDAD:={zCURINI,"CURGRP.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVE2:=USEREDE{aDAD,,,,aCOM}
IF oSERVE2:nERRO#0
	oSERVER:Close() //Fecha Master
   RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:oSFJCURGRP:USE(oSERVE2)
SELF:SHOW()	

END CLASS
CLASS XJFUN INHERIT JFUN


CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF ! entramenu("RH",19)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"FUNCAO.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	

END CLASS
CLASS XJIMPTR INHERIT JIMPTR

CONSTRUCTOR(oOWNER) 
IF ! entramenu("RH",24)
	RETU SELF
ENDIF		
SUPER(oOWNER)
SELF:SHOW()		

END CLASS
CLASS XJMO INHERIT JMO

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER,oSERVE2,oSERVE3 AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF ! entramenu("RH",1)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"MP02.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
aDAD:={zCURINI,"MP02C.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVE2:=USEREDE{aDAD,,,,aCOM}
IF oSERVE2:nERRO#0
	oSERVER:Close() //Fecha Master
   RETU SELF
ENDIF
aDAD:={zCURINI,"MP02P.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVE3:=USEREDE{aDAD,,,,aCOM}
IF oSERVE3:nERRO#0
	oSERVE2:CLOSE()  //Fecha Segundo
	oSERVER:Close() //Fecha Master
   RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:oSFJMP2:USE(oSERVE2)
SELF:SetSelectiveRelation(oSFJMP2,"CODIGO")
SELF:oSFJMPP:USE(oSERVE3)
SELF:SetSelectiveRelation(oSFJMPP,"CODIGO")
SELF:SHOW()	

END CLASS
CLASS XJMP05 INHERIT JMP05

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF ! entramenu("RH",2)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"MP05.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	

END CLASS
CLASS XJMP06 INHERIT JMP06	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER,oSERVE2 AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF ! entramenu("RH",11)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"MP06.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
aDAD:={zCURINI,"MP06C.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVE2:=USEREDE{aDAD,,,,aCOM}
IF oSERVE2:nERRO#0
	oSERVER:Close() //Fecha Master
   RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:oSFJMP2:USE(oSERVE2)
SELF:SetSelectiveRelation(oSFJMP2,"CODIGO")
SELF:SHOW()

END CLASS
CLASS XJPRO INHERIT JPRO

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF ! entramenu("RH",12)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"PROCEDIM.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	

END CLASS
CLASS XJPT INHERIT JPT

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER,oSERVE2,oSERVE3 AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF ! entramenu("RH",13)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"PT.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
aDAD:={zCURINI,"PTI.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVE2:=USEREDE{aDAD,,,,aCOM}
IF oSERVE2:nERRO#0
	oSERVER:Close() //Fecha Master
   RETU SELF
ENDIF
aDAD:={zCURINI,"MP04.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVE3:=USEREDE{aDAD,,,,aCOM}
IF oSERVE3:nERRO#0
	oSERVER:Close() //Fecha Master
	oSERVE2:CLOSE() //Fecha Itens
   RETU SELF
ENDIF
oSERVE3:SETORDER(2) //Nome
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:oSFJPTI:USE(oSERVE2)
SELF:oSFJTREINF:USE(oSERVE3)
SELF:SetSelectiveRelation(oSFJPTI,"TREIN")
SELF:oSFJTREINF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()		

END CLASS
CLASS XJRHAB INHERIT JRHAB	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER,oSERVE3 AS USEREDE
LOCAL aDAD,acOM AS ARRAY
IF ! entramenu("RH",22)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"RHAB.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
aDAD:={zCURINI,"MP04.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVE3:=USEREDE{aDAD,,,,aCOM}
IF oSERVE3:nERRO#0
   oSERVER:Close() //Fecha Master
   RETU SELF
ENDIF
oSERVE3:SETORDER(2) //Nome
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	



END CLASS
CLASS XJrhsel INHERIT Jrhsel

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF ! entramenu("RH",20)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"RHSEL.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	

END CLASS
CLASS XJrhselhist INHERIT Jrhsel

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF ! entramenu("RH",20)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"RHSELhist.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	


END CLASS
PARTIAL CLASS XJTR2 INHERIT JTRO

CONSTRUCTOR(oOWNER) 
IF ! entramenu("RH",21)
	RETU SELF
ENDIF	
SUPER()
SELF:ODCIMPTREI:VALUE:=.T.
SELF:ODCIMPPT:VALUE:=.T.
SELF:ODCIMPANT:VALUE:=.T.
SELF:ODCIMPPRE:VALUE:=.T.
SELF:ODCIMPCUR:Disable()
SELF:SHOW()	

END CLASS
CLASS XJTRE INHERIT JTRE

CONSTRUCTOR(oOWNER,nTREIN) 
LOCAL oSERVER,oSERVE2,oSERVE3 AS USEREDE
LOCAL aDAD,ACOM AS ARRAY
IF ! entramenu("RH",3)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"TREIN.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
AltD()
IF ValType(nTREIN)="N"
   oSERVER:GOTOP()
   oSERVER:SEEK(nTREIN)	
ENDIF
aDAD:={zCURINI,"TREII.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVE2:=USEREDE{aDAD,,,,aCOM}
IF oSERVE2:nERRO#0
	oSERVER:Close() //Fecha Master
   RETU SELF
ENDIF
aDAD:={zCURINI,"MP04.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVE3:=USEREDE{aDAD,,,,aCOM}
IF oSERVE3:nERRO#0
	oSERVER:Close() //Fecha Master
	oSERVE2:CLOSE() //Fecha Itens
   RETU SELF
ENDIF
oSERVE3:SETORDER(2) //Nome
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:oSFJTRI:USE(oSERVE2)
SELF:oSFJTREINF:USE(oSERVE3)
SELF:SetSelectiveRelation(oSFJTRI,"TREIN")
SELF:oSFJTREINF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	

END CLASS
CLASS XJTrJOB INHERIT JTrJOB	
	

CONSTRUCTOR(oOWNER,nIDACESSO) 
LOCAL oSERVER,oSERVE2,oSERVE3 AS USEREDE
LOCAL aDAD,ACOM AS ARRAY
IF ValType(nIDACESSO)#"N"
   nIDACESSO:=25	
ENDIF	
IF ! entramenu("RH",nIDACESSO)
	RETU SELF
ENDIF	
//alert(Str(nIDACESSO))
aDAD:={zCURINI,"TRJOB.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
aDAD:={zCURINI,"TRJOBI.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oSERVE2:=USEREDE{aDAD,,,,aCOM}
IF oSERVE2:nERRO#0
	oSERVER:Close() //Fecha Master
   RETU SELF
ENDIF
aDAD:={zCURINI,"MP04.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVE3:=USEREDE{aDAD,,,,aCOM}
IF oSERVE3:nERRO#0
	oSERVER:Close() //Fecha Master
	oSERVE2:CLOSE() //Fecha Itens
   RETU SELF
ENDIF
oSERVE3:SETORDER(2) //Nome
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:oSFJTRJOBI:USE(oSERVE2)
SELF:oSFJTREINF:USE(oSERVE3)
SELF:SetSelectiveRelation(oSFJTRJOBI,"NUMERO")
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:oSFJTRJOBI:VIEWTABLE()
SELF:oSFJTREINF:VIEWTABLE()
SELF:oSFJTRJOBI:Browser:SetStandardStyle(gBsreadonly)
SELF:oSFJTREINF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			
	
	
	


END CLASS
PARTIAL CLASS XJTRO INHERIT JTRO	

CONSTRUCTOR(oOWNER,cDES) 
IF ! entramenu("RH",18)
	RETU SELF
ENDIF	
SUPER()
SELF:ODCIMPTREI:VALUE:=.T.
SELF:ODCIMPPT:VALUE:=.T.
SELF:ODCIMPANT:VALUE:=.T.
SELF:ODCIMPPRE:VALUE:=.T.
SELF:ODCIMPCUR:VALUE:=.T.
IF ValType(cDES)="C"
   SELF:oDCDES:TextValue:=cDES
ENDIF	
SELF:SHOW()	


END CLASS
PARTIAL CLASS YJTrJOB INHERIT  XJTrJOB
CONSTRUCTOR(oOWNER) 
SUPER(oOWNER,26)	
END CLASS
CLASS ZJTRE INHERIT XJTRE		
CONSTRUCTOR(oOWNER) 	
SUPER(oOWNER,zTREIN)		
END CLASS
