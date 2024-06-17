#region DEFINES
STATIC DEFINE JBBC01_CODIGO := 101 
STATIC DEFINE JBBC01_DESCRICAO := 103 
STATIC DEFINE JBBC01_ITEM := 106 
STATIC DEFINE JBBC01_SC_CODIGO := 100 
STATIC DEFINE JBBC01_SC_DESCRICAO := 102 
STATIC DEFINE JBBC01_SC_ITEM := 107 
STATIC DEFINE JBBC01_SC_TIPO := 105 
STATIC DEFINE JBBC01_TIPO := 104 
#endregion

class JBBC01 inherit DATAWINDOW 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDESCRICAO as DataColumn
	PROTECT oDBTIPO as DataColumn
	PROTECT oDBITEM as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_DESCRICAO as FIXEDTEXT
	protect oDCDESCRICAO as SINGLELINEEDIT
	protect oDCTIPO as SINGLELINEEDIT
	protect oDCSC_TIPO as FIXEDTEXT
	protect oDCITEM as SINGLELINEEDIT
	protect oDCSC_ITEM as FIXEDTEXT
// 	instance CODIGO 
// 	instance DESCRICAO 
// 	instance TIPO 
// 	instance ITEM 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DESCRICAO() 
return self:FieldGet(#DESCRICAO)


assign DESCRICAO(uValue) 
self:FieldPut(#DESCRICAO, uValue)
return DESCRICAO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JBBC01",_GetInst()},iCtlID)

oDCSC_CODIGO := FixedText{self,ResourceID{JBBC01_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JBBC01_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_04{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Código:",NULL_STRING,"BC01_CODIGO"}

oDCSC_DESCRICAO := FixedText{self,ResourceID{JBBC01_SC_DESCRICAO,_GetInst()}}
oDCSC_DESCRICAO:HyperLabel := HyperLabel{#SC_DESCRICAO,"Descricao:",NULL_STRING,NULL_STRING}

oDCDESCRICAO := SingleLineEdit{self,ResourceID{JBBC01_DESCRICAO,_GetInst()}}
oDCDESCRICAO:FieldSpec := PADRAO_CHAR_35{}
oDCDESCRICAO:HyperLabel := HyperLabel{#DESCRICAO,"Descrição:",NULL_STRING,"BC01_DESCRICAO"}

oDCTIPO := SingleLineEdit{self,ResourceID{JBBC01_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := PADRAO_CHAR_01{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo:",NULL_STRING,"BC01_TIPO"}

oDCSC_TIPO := FixedText{self,ResourceID{JBBC01_SC_TIPO,_GetInst()}}
oDCSC_TIPO:HyperLabel := HyperLabel{#SC_TIPO,"Tipo:",NULL_STRING,NULL_STRING}

oDCITEM := SingleLineEdit{self,ResourceID{JBBC01_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_CHar_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"BC01_ITEM"}

oDCSC_ITEM := FixedText{self,ResourceID{JBBC01_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JBBC01,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_04{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Código:"
self:Browser:AddColumn(oDBCODIGO)

oDBDESCRICAO := DataColumn{PADRAO_CHAR_35{}}
oDBDESCRICAO:Width := 41
oDBDESCRICAO:HyperLabel := oDCDESCRICAO:HyperLabel 
oDBDESCRICAO:Caption := "Descrição:"
self:Browser:AddColumn(oDBDESCRICAO)

oDBTIPO := DataColumn{PADRAO_CHAR_01{}}
oDBTIPO:Width := 6
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "Tipo:"
self:Browser:AddColumn(oDBTIPO)

oDBITEM := DataColumn{PADRAO_CHar_03{}}
oDBITEM:Width := 6
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
self:Browser:AddColumn(oDBITEM)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


END CLASS
