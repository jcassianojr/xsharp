#region DEFINES
STATIC DEFINE JBXCOM_ANO := 103 
STATIC DEFINE JBXCOM_CMDIMP := 107 
STATIC DEFINE JBXCOM_CMDMAIS := 111 
STATIC DEFINE JBXCOM_CMDMAIS2 := 109 
STATIC DEFINE JBXCOM_CMDMENOS := 110 
STATIC DEFINE JBXCOM_CMDMENOS2 := 108 
STATIC DEFINE JBXCOM_CMDSAIDA := 104 
STATIC DEFINE JBXCOM_FIXEDTEXT1 := 100 
STATIC DEFINE JBXCOM_FIXEDTEXT2 := 101 
STATIC DEFINE JBXCOM_FIXEDTEXT3 := 105 
STATIC DEFINE JBXCOM_FIXEDTEXT4 := 106 
STATIC DEFINE JBXCOM_MES := 102 
#endregion

PARTIAL CLASS XJBXCOM
METHOD OK( ) 

IF MDG("Baixar"+StrZero(SELF:ANO,4)+"/"+StrZero(SELF:mes,4))
   SELF:POINTER:=POINTER{POINTERHOURGLASS}	
   BAIXAR("RDT.DBF","RDTBX.DBF",SELF:MES,SELF:ANO)	
   SELF:POINTER:=POINTER{POINTERARROW}
ENDIF
SELF:EndWindow()



END CLASS
PARTIAL CLASS XJRTCOM
METHOD OK() 
SELF:POINTER:=POINTER{POINTERHOURGLASS}
BAIXAR("RDTBX.DBF","RDT.DBF",SELF:MES,SELF:ANO)
SELF:POINTER:=POINTER{POINTERARROW}	
SELF:EndWindow()


END CLASS
