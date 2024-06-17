#region DEFINES
STATIC DEFINE JMOP_AREA := 100 
STATIC DEFINE JMOP_CODIGO := 102 
STATIC DEFINE JMOP_NOME := 104 
STATIC DEFINE JMOP_SC_AREA := 105 
STATIC DEFINE JMOP_SC_CODIGO := 101 
STATIC DEFINE JMOP_SC_NOME := 103 
#endregion

class JMOP inherit DATAWINDOW 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBAREA as DataColumn
	protect oDCAREA as SINGLELINEEDIT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSC_AREA as FIXEDTEXT
// 	instance AREA 
// 	instance CODIGO 
// 	instance NOME 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AREA() 
return self:FieldGet(#AREA)


assign AREA(uValue) 
self:FieldPut(#AREA, uValue)
return AREA := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMOP",_GetInst()},iCtlID)

oDCAREA := SingleLineEdit{self,ResourceID{JMOP_AREA,_GetInst()}}
oDCAREA:FieldSpec := padrao_char_02{}
oDCAREA:HyperLabel := HyperLabel{#AREA,"Area",NULL_STRING,"MP02_AREA"}

oDCSC_CODIGO := FixedText{self,ResourceID{JMOP_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Código:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JMOP_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_12{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MP02_CODIGO"}

oDCSC_NOME := FixedText{self,ResourceID{JMOP_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JMOP_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_30{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MP02_NOME"}

oDCSC_AREA := FixedText{self,ResourceID{JMOP_SC_AREA,_GetInst()}}
oDCSC_AREA:HyperLabel := HyperLabel{#SC_AREA,"Área:",NULL_STRING,NULL_STRING}

self:Caption := "Mão de Obra Operador"
self:HyperLabel := HyperLabel{#JMOP,"Mão de Obra Operador",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{padrao_char_12{}}
oDBCODIGO:Width := 14
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{padrao_char_30{}}
oDBNOME:Width := 27
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBAREA := DataColumn{padrao_char_02{}}
oDBAREA:Width := 14
oDBAREA:HyperLabel := oDCAREA:HyperLabel 
oDBAREA:Caption := "Area"
self:Browser:AddColumn(oDBAREA)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()


END CLASS
