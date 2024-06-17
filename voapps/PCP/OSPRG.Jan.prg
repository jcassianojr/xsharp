#region DEFINES
STATIC DEFINE JOSP_BUSCAOV := 109 
STATIC DEFINE JOSP_DATAIMP := 105 
STATIC DEFINE JOSP_ESCCOD := 106 
STATIC DEFINE JOSP_FOTO := 112 
STATIC DEFINE JOSP_HORAPRG := 103 
STATIC DEFINE JOSP_NUMERO := 115 
STATIC DEFINE JOSP_PLANTA := 101 
STATIC DEFINE JOSP_POROV := 108 
STATIC DEFINE JOSP_PRODUTO := 100 
STATIC DEFINE JOSP_PROGRAMA := 102 
STATIC DEFINE JOSP_QTDE := 104 
STATIC DEFINE JOSP_SC_DESTINO2 := 111 
STATIC DEFINE JOSP_SC_NUMERO := 113 
STATIC DEFINE JOSP_SC_PLANTA := 118 
STATIC DEFINE JOSP_SC_PRODUTO := 114 
STATIC DEFINE JOSP_SC_PROGRAMA := 116 
STATIC DEFINE JOSP_SC_PROGRAMA1 := 107 
STATIC DEFINE JOSP_SC_PROGRAMA2 := 110 
STATIC DEFINE JOSP_SC_QTDE := 117 
#endregion

PARTIAL class JOSP inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBPRODUTO as DataColumn
	PROTECT oDBPLANTA as DataColumn
	PROTECT oDBPROGRAMA as DataColumn
	PROTECT oDBQTDE as DataColumn
	PROTECT oDBDATAIMP as DataColumn
	protect oDCPRODUTO as SINGLELINEEDIT
	protect oDCPLANTA as SINGLELINEEDIT
	protect oDCPROGRAMA as DATETIMEPICKER
	protect oDCHORAPRG as RIGHTSLE
	protect oDCQTDE as RIGHTSLE
	protect oDCDATAIMP as DATETIMEPICKER
	protect oCCesccod as PUSHBUTTON
	protect oDCSC_PROGRAMA1 as FIXEDTEXT
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oDCSC_PROGRAMA2 as FIXEDTEXT
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_PRODUTO as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCSC_PROGRAMA as FIXEDTEXT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCSC_PLANTA as FIXEDTEXT
// 	instance PRODUTO 
// 	instance PLANTA 
// 	instance HORAPRG 
// 	instance QTDE 
// 	instance NUMERO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access HORAPRG() 
return self:FieldGet(#HORAPRG)


assign HORAPRG(uValue) 
self:FieldPut(#HORAPRG, uValue)
return HORAPRG := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JOSP",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCPRODUTO := SingleLineEdit{self,ResourceID{JOSP_PRODUTO,_GetInst()}}
oDCPRODUTO:FieldSpec := padrao_CHAR_24{}
oDCPRODUTO:HyperLabel := HyperLabel{#PRODUTO,"Produto:",NULL_STRING,"OSPRG_PRODUTO"}
oDCPRODUTO:TooltipText := "Codigo do Produto"

oDCPLANTA := SingleLineEdit{self,ResourceID{JOSP_PLANTA,_GetInst()}}
oDCPLANTA:FieldSpec := padrao_CHAR_10{}
oDCPLANTA:HyperLabel := HyperLabel{#PLANTA,"Planta:",NULL_STRING,"OSPRG_PLANTA"}
oDCPLANTA:TooltipText := "Codigo da Planta para Entrega"

oDCPROGRAMA := DateTimePicker{self,ResourceID{JOSP_PROGRAMA,_GetInst()}}
oDCPROGRAMA:FieldSpec := DATE_FIELD{}
oDCPROGRAMA:HyperLabel := HyperLabel{#PROGRAMA,"Programa",NULL_STRING,NULL_STRING}
oDCPROGRAMA:TooltipText := "Data Entrega Programa"

oDCHORAPRG := rightSle{self,ResourceID{JOSP_HORAPRG,_GetInst()}}
oDCHORAPRG:FieldSpec := PADRAO_NUM_05_2{}
oDCHORAPRG:HyperLabel := HyperLabel{#HORAPRG,"Qtde:",NULL_STRING,"OSPRG_QTDE"}
oDCHORAPRG:TooltipText := "Qtde para Entrega"

oDCQTDE := rightSle{self,ResourceID{JOSP_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := padrao_NUM_08{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"OSPRG_QTDE"}
oDCQTDE:TooltipText := "Qtde para Entrega"

oDCDATAIMP := DateTimePicker{self,ResourceID{JOSP_DATAIMP,_GetInst()}}
oDCDATAIMP:FieldSpec := DATE_FIELD{}
oDCDATAIMP:HyperLabel := HyperLabel{#DATAIMP,"Data Imp",NULL_STRING,NULL_STRING}
oDCDATAIMP:TooltipText := "Data de Importação da Programação"

oCCesccod := PushButton{self,ResourceID{JOSP_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}
oCCesccod:TooltipText := "Exibe Lista Produto PCP"

oDCSC_PROGRAMA1 := FixedText{self,ResourceID{JOSP_SC_PROGRAMA1,_GetInst()}}
oDCSC_PROGRAMA1:HyperLabel := HyperLabel{#SC_PROGRAMA1,"Data Importação",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JOSP_POROV,_GetInst()}}
oCCporov:Image := ico_aZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Clique para ordenar por Numero"

oCCbuscaov := PushButton{self,ResourceID{JOSP_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ico_find{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaov:TooltipText := "Clique Para Localizar Por Numero"

oDCSC_PROGRAMA2 := FixedText{self,ResourceID{JOSP_SC_PROGRAMA2,_GetInst()}}
oDCSC_PROGRAMA2:HyperLabel := HyperLabel{#SC_PROGRAMA2,"Hora",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JOSP_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JOSP_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oDCSC_NUMERO := FixedText{self,ResourceID{JOSP_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Número:",NULL_STRING,NULL_STRING}

oDCSC_PRODUTO := FixedText{self,ResourceID{JOSP_SC_PRODUTO,_GetInst()}}
oDCSC_PRODUTO:HyperLabel := HyperLabel{#SC_PRODUTO,"Produto:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JOSP_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Número:",NULL_STRING,"OSPRG_NUMERO"}
oDCNUMERO:TooltipText := "Numero Interno Programaçao(Apenas Ref.)"
oDCNUMERO:BackGround := aBrushes[1]
oDCNUMERO:Font(aFonts[1], FALSE)

oDCSC_PROGRAMA := FixedText{self,ResourceID{JOSP_SC_PROGRAMA,_GetInst()}}
oDCSC_PROGRAMA:HyperLabel := HyperLabel{#SC_PROGRAMA,"Programa:",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{self,ResourceID{JOSP_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCSC_PLANTA := FixedText{self,ResourceID{JOSP_SC_PLANTA,_GetInst()}}
oDCSC_PLANTA:HyperLabel := HyperLabel{#SC_PLANTA,"Planta:",NULL_STRING,NULL_STRING}

self:Caption := "Controle de Programa de Pedidos"
self:HyperLabel := HyperLabel{#JOSP,"Controle de Programa de Pedidos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_NUM_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Número:"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBPRODUTO := DataColumn{padrao_CHAR_24{}}
oDBPRODUTO:Width := 18
oDBPRODUTO:HyperLabel := oDCPRODUTO:HyperLabel 
oDBPRODUTO:Caption := "Produto:"
self:Browser:AddColumn(oDBPRODUTO)

oDBPLANTA := DataColumn{padrao_CHAR_10{}}
oDBPLANTA:Width := 11
oDBPLANTA:HyperLabel := oDCPLANTA:HyperLabel 
oDBPLANTA:Caption := "Planta:"
self:Browser:AddColumn(oDBPLANTA)

oDBPROGRAMA := DataColumn{DATE_FIELD{}}
oDBPROGRAMA:Width := 11
oDBPROGRAMA:HyperLabel := oDCPROGRAMA:HyperLabel 
oDBPROGRAMA:Caption := "Programa"
self:Browser:AddColumn(oDBPROGRAMA)

oDBQTDE := DataColumn{padrao_NUM_08{}}
oDBQTDE:Width := 14
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
self:Browser:AddColumn(oDBQTDE)

oDBDATAIMP := DataColumn{DATE_FIELD{}}
oDBDATAIMP:Width := 11
oDBDATAIMP:HyperLabel := oDCDATAIMP:HyperLabel 
oDBDATAIMP:Caption := "Data Imp"
self:Browser:AddColumn(oDBDATAIMP)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access PLANTA() 
return self:FieldGet(#PLANTA)


assign PLANTA(uValue) 
self:FieldPut(#PLANTA, uValue)
return PLANTA := uValue


access PRODUTO() 
return self:FieldGet(#PRODUTO)


assign PRODUTO(uValue) 
self:FieldPut(#PRODUTO, uValue)
return PRODUTO := uValue


access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


END CLASS
