#region DEFINES
STATIC DEFINE JBC01_BUSCAOV := 104 
STATIC DEFINE JBC01_CMDTIPO := 101 
STATIC DEFINE JBC01_CODIGO := 107 
STATIC DEFINE JBC01_DESCRICAO := 108 
STATIC DEFINE JBC01_ITEM := 112 
STATIC DEFINE JBC01_POROV := 103 
STATIC DEFINE JBC01_SC_CODIGO := 105 
STATIC DEFINE JBC01_SC_DESCRICAO := 106 
STATIC DEFINE JBC01_SC_ITEM := 110 
STATIC DEFINE JBC01_SC_ITEM1 := 100 
STATIC DEFINE JBC01_SC_VALOR := 109 
STATIC DEFINE JBC01_TIPO := 102 
STATIC DEFINE JBC01_VALOR := 111 
#endregion

class JBC01 inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDESCRICAO as DataColumn
	PROTECT oDBVALOR as DataColumn
	protect oDCSC_ITEM1 as FIXEDTEXT
	protect oCCcmdtipo as PUSHBUTTON
	protect oDCTIPO as SINGLELINEEDIT
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_DESCRICAO as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCDESCRICAO as SINGLELINEEDIT
	protect oDCSC_VALOR as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCVALOR as RIGHTSLE
	protect oDCITEM as COMBOBOX
// 	instance TIPO 
// 	instance CODIGO 
// 	instance DESCRICAO 
// 	instance VALOR 
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

SUPER(oWindow,ResourceID{"JBC01",_GetInst()},iCtlID)

oDCSC_ITEM1 := FixedText{self,ResourceID{JBC01_SC_ITEM1,_GetInst()}}
oDCSC_ITEM1:HyperLabel := HyperLabel{#SC_ITEM1,"Tipo",NULL_STRING,NULL_STRING}

oCCcmdtipo := PushButton{self,ResourceID{JBC01_CMDTIPO,_GetInst()}}
oCCcmdtipo:HyperLabel := HyperLabel{#cmdtipo,"(C)redito (D)ebito",NULL_STRING,NULL_STRING}

oDCTIPO := SingleLineEdit{self,ResourceID{JBC01_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := PADRAO_char_01{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo",NULL_STRING,"BA01_NUMERO"}
oDCTIPO:TooltipText := "Tipo (C)redito (D)ebito"

oCCporov := PushButton{self,ResourceID{JBC01_POROV,_GetInst()}}
oCCporov:Image := ICO_AZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Clique para ordenar por Numero"

oCCbuscaov := PushButton{self,ResourceID{JBC01_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ICO_FIND{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaov:TooltipText := "Clique Para Localizar Por Numero"

oDCSC_CODIGO := FixedText{self,ResourceID{JBC01_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Código:",NULL_STRING,NULL_STRING}

oDCSC_DESCRICAO := FixedText{self,ResourceID{JBC01_SC_DESCRICAO,_GetInst()}}
oDCSC_DESCRICAO:HyperLabel := HyperLabel{#SC_DESCRICAO,"Descrição:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JBC01_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_04{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"BC01_CODIGO"}

oDCDESCRICAO := SingleLineEdit{self,ResourceID{JBC01_DESCRICAO,_GetInst()}}
oDCDESCRICAO:FieldSpec := padrao_char_35{}
oDCDESCRICAO:HyperLabel := HyperLabel{#DESCRICAO,"Descricao:",NULL_STRING,"BC01_DESCRICAO"}

oDCSC_VALOR := FixedText{self,ResourceID{JBC01_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor:",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JBC01_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCVALOR := rightSle{self,ResourceID{JBC01_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := padrao_num_12_2{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Valor:",NULL_STRING,"BC01_VALOR"}

oDCITEM := combobox{self,ResourceID{JBC01_ITEM,_GetInst()}}
oDCITEM:FieldSpec := padrao_char_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Histórico Padrão"
self:HyperLabel := HyperLabel{#JBC01,"Histórico Padrão",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{padrao_char_04{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBDESCRICAO := DataColumn{padrao_char_35{}}
oDBDESCRICAO:Width := 26
oDBDESCRICAO:HyperLabel := oDCDESCRICAO:HyperLabel 
oDBDESCRICAO:Caption := "Descricao:"
self:Browser:AddColumn(oDBDESCRICAO)

oDBVALOR := DataColumn{padrao_num_12_2{}}
oDBVALOR:Width := 7
oDBVALOR:HyperLabel := oDCVALOR:HyperLabel 
oDBVALOR:Caption := "Valor:"
self:Browser:AddColumn(oDBVALOR)


self:ViewAs(#FormView)

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


access VALOR() 
return self:FieldGet(#VALOR)


assign VALOR(uValue) 
self:FieldPut(#VALOR, uValue)
return VALOR := uValue


END CLASS
