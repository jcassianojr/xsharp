#region DEFINES
STATIC DEFINE JBF01_BUSCANUM := 111 
STATIC DEFINE JBF01_CODIGO := 107 
STATIC DEFINE JBF01_DATA := 108 
STATIC DEFINE JBF01_ESCCOD := 113 
STATIC DEFINE JBF01_ESCFOR := 112 
STATIC DEFINE JBF01_NUMERO := 106 
STATIC DEFINE JBF01_PORNUM := 110 
STATIC DEFINE JBF01_SC_CODIGO := 102 
STATIC DEFINE JBF01_SC_DATA := 103 
STATIC DEFINE JBF01_SC_NUMERO := 101 
STATIC DEFINE JBF01_SC_VALOR := 104 
STATIC DEFINE JBF01_SC_VENDA := 100 
STATIC DEFINE JBF01_VALOR := 109 
STATIC DEFINE JBF01_VENDA := 105 
#endregion

class jbf01 inherit MYDataWindow 

	PROTECT oDBVENDA as DataColumn
	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBVALOR as DataColumn
	protect oDCSC_VENDA as FIXEDTEXT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_VALOR as FIXEDTEXT
	protect oDCVENDA as SINGLELINEEDIT
	protect oDCNUMERO as RIGHTSLE
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCDATA as DATESLE
	protect oDCVALOR as RIGHTSLE
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oCCESCFOR as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
// 	instance VENDA 
// 	instance NUMERO 
// 	instance CODIGO 
// 	instance DATA 
// 	instance VALOR 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jbf01",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_VENDA := FixedText{self,ResourceID{JBF01_SC_VENDA,_GetInst()}}
oDCSC_VENDA:HyperLabel := HyperLabel{#SC_VENDA,"Venda:",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JBF01_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JBF01_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JBF01_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_VALOR := FixedText{self,ResourceID{JBF01_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor:",NULL_STRING,NULL_STRING}

oDCVENDA := SingleLineEdit{self,ResourceID{JBF01_VENDA,_GetInst()}}
oDCVENDA:FieldSpec := padrao_num_08{}
oDCVENDA:HyperLabel := HyperLabel{#VENDA,"Venda:",NULL_STRING,"BF01_VENDA"}
oDCVENDA:BackGround := aBrushes[1]
oDCVENDA:Font(aFonts[1], FALSE)

oDCNUMERO := rightSle{self,ResourceID{JBF01_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"BF01_NUMERO"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JBF01_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_20{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"BF01_CODIGO"}

oDCDATA := DateSle{self,ResourceID{JBF01_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"BF01_DATA"}

oDCVALOR := rightSle{self,ResourceID{JBF01_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := padrao_num_10_2{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Valor:",NULL_STRING,"BF01_VALOR"}

oCCpornum := PushButton{self,ResourceID{JBF01_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscanum := PushButton{self,ResourceID{JBF01_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}

oCCESCFOR := PushButton{self,ResourceID{JBF01_ESCFOR,_GetInst()}}
oCCESCFOR:HyperLabel := HyperLabel{#ESCFOR,"...",NULL_STRING,NULL_STRING}
oCCESCFOR:TooltipText := "Escolher Cliente/Fornecedor"

oCCesccod := PushButton{self,ResourceID{JBF01_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}
oCCesccod:TooltipText := "Escolher Cliente/Fornecedor"

self:Caption := "Itens Comprados"
self:HyperLabel := HyperLabel{#jbf01,"Itens Comprados",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBVENDA := DataColumn{padrao_num_08{}}
oDBVENDA:Width := 9
oDBVENDA:HyperLabel := oDCVENDA:HyperLabel 
oDBVENDA:Caption := "Venda:"
oDBVENDA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBVENDA)

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 9
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBCODIGO := DataColumn{padrao_char_20{}}
oDBCODIGO:Width := 22
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBDATA := DataColumn{date_field{}}
oDBDATA:Width := 12
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)

oDBVALOR := DataColumn{padrao_num_10_2{}}
oDBVALOR:Width := 16
oDBVALOR:HyperLabel := oDCVALOR:HyperLabel 
oDBVALOR:Caption := "Valor:"
self:Browser:AddColumn(oDBVALOR)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access VALOR() 
return self:FieldGet(#VALOR)


assign VALOR(uValue) 
self:FieldPut(#VALOR, uValue)
return VALOR := uValue


access VENDA() 
return self:FieldGet(#VENDA)


assign VENDA(uValue) 
self:FieldPut(#VENDA, uValue)
return VENDA := uValue


END CLASS
