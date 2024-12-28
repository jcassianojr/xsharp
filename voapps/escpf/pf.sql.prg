#region DEFINES
Define IDM_PFSQL_NAME := "pfsql"
Define IDM_pfsql_SOURCE := "PF"
#endregion

CLASS pfsql INHERIT SQLTable
ACCESS CODFINAL 
 RETURN self:FieldGet(4)
ASSIGN CODFINAL(uValue) 
 RETURN self:FieldPut(4, uValue)
ACCESS CODIGO 
 RETURN self:FieldGet(2)
ASSIGN CODIGO(uValue) 
 RETURN self:FieldPut(2, uValue)
ACCESS CODIGOINT 
 RETURN self:FieldGet(5)
ASSIGN CODIGOINT(uValue) 
 RETURN self:FieldPut(5, uValue)
ACCESS DESCR 
 RETURN self:FieldGet(3)
ASSIGN DESCR(uValue) 
 RETURN self:FieldPut(3, uValue)
CONSTRUCTOR( cTable, oConn ) 
LOCAL oFS,oHL AS OBJECT

IF IsNil(cTable)
   cTable := e"`PF`"
ENDIF

IF IsNil(oConn)
   oConn := SQLGetMyConnection( IDM_pfsql_SOURCE, "", "" )
ENDIF

SUPER( cTable, ;
  { ;
   e"`PF`" , ;
   e"`CODIGO`" , ;
   e"`DESCR`" , ;
   e"`CODFINAL`" , ;
   e"`CODIGOINT`"   }, oConn )

oHyperLabel := HyperLabel{IDM_PFSQL_NAME,  ;
   "pfsql",  ;
   ,  ;
   "pfsql" }
IF oHLStatus = NIL
    self:Seek()
    self:SetPrimaryKey(1)
    self:ScrollUpdateType := SQL_SC_UPD_KEY
    oFS:=pfsql_PF{}
    self:SetDataField(1,DataField{e"PF" ,oFS})
    oFS:=pfsql_CODIGO{}
    self:SetDataField(2,DataField{e"CODIGO" ,oFS})
    oFS:=pfsql_DESCR{}
    self:SetDataField(3,DataField{e"DESCR" ,oFS})
    oFS:=pfsql_CODFINAL{}
    self:SetDataField(4,DataField{e"CODFINAL" ,oFS})
    oFS:=pfsql_CODIGOINT{}
    self:SetDataField(5,DataField{e"CODIGOINT" ,oFS})
    oHL := NULL_OBJECT
ENDIF
 
ACCESS PF 
 RETURN self:FieldGet(1)
ASSIGN PF(uValue) 
 RETURN self:FieldPut(1, uValue)
END CLASS
CLASS pfsql_CODFINAL INHERIT FIELDSPEC
CONSTRUCTOR() 
SUPER(HyperLabel{"CODFINAL","Codfinal","","PF_CODFINAL"},"C",50,0)

END CLASS
CLASS pfsql_CODIGO INHERIT FIELDSPEC
CONSTRUCTOR() 
SUPER(HyperLabel{"CODIGO","Codigo","","PF_CODIGO"},"C",24,0)

END CLASS
CLASS pfsql_CODIGOINT INHERIT FIELDSPEC
CONSTRUCTOR() 
SUPER(HyperLabel{"CODIGOINT","Codigoint","","PF_CODIGOINT"},"C",24,0)

END CLASS
CLASS pfsql_DESCR INHERIT FIELDSPEC
CONSTRUCTOR() 
SUPER(HyperLabel{"DESCR","Descr","","PF_DESCR"},"C",40,0)

END CLASS
CLASS pfsql_PF INHERIT FIELDSPEC
CONSTRUCTOR() 
SUPER(HyperLabel{"PF","Pf","","PF_PF"},"N",22,0)


END CLASS
