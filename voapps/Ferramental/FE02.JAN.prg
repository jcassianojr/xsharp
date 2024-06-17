#region DEFINES
STATIC DEFINE JFE02_ANO := 107 
STATIC DEFINE JFE02_CODIGO := 100 
STATIC DEFINE JFE02_MES := 104 
STATIC DEFINE JFE02_SC_ANO := 106 
STATIC DEFINE JFE02_SC_CODIGO := 101 
STATIC DEFINE JFE02_SC_MES := 105 
STATIC DEFINE JFE02_SC_TIPO := 109 
STATIC DEFINE JFE02_SC_USO := 102 
STATIC DEFINE JFE02_TIPO := 108 
STATIC DEFINE JFE02_USO := 103 
#endregion

PARTIAL class JFE02 inherit MYDataWindow 

	PROTECT oDBTIPO as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBMES as DataColumn
	PROTECT oDBANO as DataColumn
	PROTECT oDBUSO as DataColumn
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_USO as FIXEDTEXT
	protect oDCUSO as SINGLELINEEDIT
	protect oDCMES as SINGLELINEEDIT
	protect oDCSC_MES as FIXEDTEXT
	protect oDCSC_ANO as FIXEDTEXT
	protect oDCANO as SINGLELINEEDIT
	protect oDCTIPO as SINGLELINEEDIT
	protect oDCSC_TIPO as FIXEDTEXT
// 	instance CODIGO 
// 	instance USO 
// 	instance MES 
// 	instance ANO 
// 	instance TIPO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANO() 
return self:FieldGet(#ANO)


assign ANO(uValue) 
self:FieldPut(#ANO, uValue)
return ANO := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFE02",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCCODIGO := SingleLineEdit{self,ResourceID{JFE02_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_20{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"FE02_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[1], FALSE)

oDCSC_CODIGO := FixedText{self,ResourceID{JFE02_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_USO := FixedText{self,ResourceID{JFE02_SC_USO,_GetInst()}}
oDCSC_USO:HyperLabel := HyperLabel{#SC_USO,"Uso:",NULL_STRING,NULL_STRING}

oDCUSO := SingleLineEdit{self,ResourceID{JFE02_USO,_GetInst()}}
oDCUSO:FieldSpec := padrao_num_16_6{}
oDCUSO:HyperLabel := HyperLabel{#USO,"Uso:",NULL_STRING,"FE02_USO"}
oDCUSO:BackGround := aBrushes[1]
oDCUSO:Font(aFonts[1], FALSE)

oDCMES := SingleLineEdit{self,ResourceID{JFE02_MES,_GetInst()}}
oDCMES:FieldSpec := padrao_num_02{}
oDCMES:HyperLabel := HyperLabel{#MES,"Mes:",NULL_STRING,"FE02_MES"}
oDCMES:BackGround := aBrushes[1]
oDCMES:Font(aFonts[1], FALSE)

oDCSC_MES := FixedText{self,ResourceID{JFE02_SC_MES,_GetInst()}}
oDCSC_MES:HyperLabel := HyperLabel{#SC_MES,"Mes:",NULL_STRING,NULL_STRING}

oDCSC_ANO := FixedText{self,ResourceID{JFE02_SC_ANO,_GetInst()}}
oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO,"Ano:",NULL_STRING,NULL_STRING}

oDCANO := SingleLineEdit{self,ResourceID{JFE02_ANO,_GetInst()}}
oDCANO:FieldSpec := padrao_num_04{}
oDCANO:HyperLabel := HyperLabel{#ANO,"Ano:",NULL_STRING,"FE02_ANO"}
oDCANO:BackGround := aBrushes[1]
oDCANO:Font(aFonts[1], FALSE)

oDCTIPO := SingleLineEdit{self,ResourceID{JFE02_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := padrao_char_24{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Grupo",NULL_STRING,"FE02_TIPO"}
oDCTIPO:BackGround := aBrushes[1]
oDCTIPO:Font(aFonts[1], FALSE)

oDCSC_TIPO := FixedText{self,ResourceID{JFE02_SC_TIPO,_GetInst()}}
oDCSC_TIPO:HyperLabel := HyperLabel{#SC_TIPO,"Grupo:",NULL_STRING,NULL_STRING}

self:Caption := "Consumo Mensal"
self:HyperLabel := HyperLabel{#JFE02,"Consumo Mensal",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTIPO := DataColumn{padrao_char_24{}}
oDBTIPO:Width := 16
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "Grupo"
oDBTIPO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTIPO)

oDBCODIGO := DataColumn{padrao_char_20{}}
oDBCODIGO:Width := 15
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBMES := DataColumn{padrao_num_02{}}
oDBMES:Width := 5
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "Mes:"
oDBMES:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMES)

oDBANO := DataColumn{padrao_num_04{}}
oDBANO:Width := 10
oDBANO:HyperLabel := oDCANO:HyperLabel 
oDBANO:Caption := "Ano:"
oDBANO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBANO)

oDBUSO := DataColumn{padrao_num_16_6{}}
oDBUSO:Width := 11
oDBUSO:HyperLabel := oDCUSO:HyperLabel 
oDBUSO:Caption := "Uso:"
oDBUSO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBUSO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MES() 
return self:FieldGet(#MES)


assign MES(uValue) 
self:FieldPut(#MES, uValue)
return MES := uValue


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


access USO() 
return self:FieldGet(#USO)


assign USO(uValue) 
self:FieldPut(#USO, uValue)
return USO := uValue


END CLASS
