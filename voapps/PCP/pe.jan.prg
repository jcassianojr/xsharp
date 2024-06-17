#region DEFINES
STATIC DEFINE JPE_APLICACAO := 119 
STATIC DEFINE JPE_BUSCAPED := 123 
STATIC DEFINE JPE_CALC01 := 146 
STATIC DEFINE JPE_CALC02 := 145 
STATIC DEFINE JPE_CALC03 := 144 
STATIC DEFINE JPE_CALC04 := 143 
STATIC DEFINE JPE_CALC05 := 142 
STATIC DEFINE JPE_CALC06 := 141 
STATIC DEFINE JPE_CALC07 := 140 
STATIC DEFINE JPE_CALC08 := 139 
STATIC DEFINE JPE_CALC09 := 138 
STATIC DEFINE JPE_CALC10 := 137 
STATIC DEFINE JPE_CALC11 := 136 
STATIC DEFINE JPE_CALC12 := 135 
STATIC DEFINE JPE_CALC13 := 134 
STATIC DEFINE JPE_CALC14 := 133 
STATIC DEFINE JPE_CALC15 := 132 
STATIC DEFINE JPE_CALC16 := 131 
STATIC DEFINE JPE_CALC17 := 130 
STATIC DEFINE JPE_CALC18 := 129 
STATIC DEFINE JPE_CALC19 := 128 
STATIC DEFINE JPE_CALC20 := 127 
STATIC DEFINE JPE_CMDDATA := 148 
STATIC DEFINE JPE_CMDQTDE := 147 
STATIC DEFINE JPE_CODIGO := 111 
STATIC DEFINE JPE_COGNOME := 114 
STATIC DEFINE JPE_COMITEM := 118 
STATIC DEFINE JPE_COMPRAS := 117 
STATIC DEFINE JPE_EXCLUIR := 124 
STATIC DEFINE JPE_FORNECEDO := 113 
STATIC DEFINE JPE_INCLUIR := 125 
STATIC DEFINE JPE_JNEC := 126 
STATIC DEFINE JPE_JPE01 := 122 
STATIC DEFINE JPE_LOCENT := 120 
STATIC DEFINE JPE_NOM2 := 116 
STATIC DEFINE JPE_NOME := 112 
STATIC DEFINE JPE_OBSOBS := 121 
STATIC DEFINE JPE_PEDIDO := 109 
STATIC DEFINE JPE_SC_APLICACAO := 106 
STATIC DEFINE JPE_SC_CODIGO := 101 
STATIC DEFINE JPE_SC_COMPRAS := 105 
STATIC DEFINE JPE_SC_FORNECEDO := 103 
STATIC DEFINE JPE_SC_LOCENT := 107 
STATIC DEFINE JPE_SC_NOME := 102 
STATIC DEFINE JPE_SC_OBSOBS := 108 
STATIC DEFINE JPE_SC_PEDIDO := 100 
STATIC DEFINE JPE_SC_UNID := 104 
STATIC DEFINE JPE_TIPPED := 110 
STATIC DEFINE JPE_UNID := 115 
#endregion

PARTIAL class jpe inherit MYDataWindow 

	PROTECT oDBPEDIDO as DataColumn
	PROTECT oDBCOMPRAS as DataColumn
	PROTECT oDBCOMITEM as DataColumn
	PROTECT oDBFORNECEDO as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBTIPPED as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBUNID as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCSC_PEDIDO as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_FORNECEDO as FIXEDTEXT
	protect oDCSC_UNID as FIXEDTEXT
	protect oDCSC_COMPRAS as FIXEDTEXT
	protect oDCSC_APLICACAO as FIXEDTEXT
	protect oDCSC_LOCENT as FIXEDTEXT
	protect oDCSC_OBSOBS as FIXEDTEXT
	protect oDCPEDIDO as SINGLELINEEDIT
	protect oDCTIPPED as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCFORNECEDO as SINGLELINEEDIT
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCUNID as SINGLELINEEDIT
	protect oDCNOM2 as SINGLELINEEDIT
	protect oDCCOMPRAS as SINGLELINEEDIT
	protect oDCCOMITEM as SINGLELINEEDIT
	protect oDCAPLICACAO as SINGLELINEEDIT
	protect oDCLOCENT as SINGLELINEEDIT
	protect oDCOBSOBS as SINGLELINEEDIT
	protect oCCbuscaPED as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCIncluir as PUSHBUTTON
	protect oCCCALC20 as PUSHBUTTON
	protect oCCCALC19 as PUSHBUTTON
	protect oCCCALC18 as PUSHBUTTON
	protect oCCCALC17 as PUSHBUTTON
	protect oCCCALC16 as PUSHBUTTON
	protect oCCCALC15 as PUSHBUTTON
	protect oCCCALC14 as PUSHBUTTON
	protect oCCCALC13 as PUSHBUTTON
	protect oCCCALC12 as PUSHBUTTON
	protect oCCCALC11 as PUSHBUTTON
	protect oCCCALC10 as PUSHBUTTON
	protect oCCCALC09 as PUSHBUTTON
	protect oCCCALC08 as PUSHBUTTON
	protect oCCCALC07 as PUSHBUTTON
	protect oCCCALC06 as PUSHBUTTON
	protect oCCCALC05 as PUSHBUTTON
	protect oCCCALC04 as PUSHBUTTON
	protect oCCCALC03 as PUSHBUTTON
	protect oCCCALC02 as PUSHBUTTON
	protect oCCCALC01 as PUSHBUTTON
	protect oCCcmdqtde as PUSHBUTTON
	protect oCCcmddata as PUSHBUTTON
// 	instance PEDIDO 
// 	instance TIPPED 
// 	instance CODIGO 
// 	instance NOME 
// 	instance FORNECEDO 
// 	instance COGNOME 
// 	instance UNID 
// 	instance NOM2 
// 	instance COMPRAS 
// 	instance COMITEM 
// 	instance APLICACAO 
// 	instance LOCENT 
// 	instance OBSOBS 
	protect oSFJPE01 as JPE01
	protect oSFJNEC as JNEC

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access APLICACAO() 
return self:FieldGet(#APLICACAO)


assign APLICACAO(uValue) 
self:FieldPut(#APLICACAO, uValue)
return APLICACAO := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


access COMITEM() 
return self:FieldGet(#COMITEM)


assign COMITEM(uValue) 
self:FieldPut(#COMITEM, uValue)
return COMITEM := uValue


access COMPRAS() 
return self:FieldGet(#COMPRAS)


assign COMPRAS(uValue) 
self:FieldPut(#COMPRAS, uValue)
return COMPRAS := uValue


access FORNECEDO() 
return self:FieldGet(#FORNECEDO)


assign FORNECEDO(uValue) 
self:FieldPut(#FORNECEDO, uValue)
return FORNECEDO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[3] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jpe",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Times New Roman"}
aFonts[2]:Bold := TRUE
aFonts[3] := Font{,10,"Times New Roman"}
aFonts[3]:Bold := TRUE
aFonts[3]:Italic := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_PEDIDO := FixedText{self,ResourceID{JPE_SC_PEDIDO,_GetInst()}}
oDCSC_PEDIDO:HyperLabel := HyperLabel{#SC_PEDIDO,"Pedido:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JPE_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JPE_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_FORNECEDO := FixedText{self,ResourceID{JPE_SC_FORNECEDO,_GetInst()}}
oDCSC_FORNECEDO:HyperLabel := HyperLabel{#SC_FORNECEDO,"Fornecedo:",NULL_STRING,NULL_STRING}

oDCSC_UNID := FixedText{self,ResourceID{JPE_SC_UNID,_GetInst()}}
oDCSC_UNID:HyperLabel := HyperLabel{#SC_UNID,"Unid:",NULL_STRING,NULL_STRING}

oDCSC_COMPRAS := FixedText{self,ResourceID{JPE_SC_COMPRAS,_GetInst()}}
oDCSC_COMPRAS:HyperLabel := HyperLabel{#SC_COMPRAS,"Compras:",NULL_STRING,NULL_STRING}

oDCSC_APLICACAO := FixedText{self,ResourceID{JPE_SC_APLICACAO,_GetInst()}}
oDCSC_APLICACAO:HyperLabel := HyperLabel{#SC_APLICACAO,"Aplicacao:",NULL_STRING,NULL_STRING}

oDCSC_LOCENT := FixedText{self,ResourceID{JPE_SC_LOCENT,_GetInst()}}
oDCSC_LOCENT:HyperLabel := HyperLabel{#SC_LOCENT,"Local Entrega",NULL_STRING,NULL_STRING}

oDCSC_OBSOBS := FixedText{self,ResourceID{JPE_SC_OBSOBS,_GetInst()}}
oDCSC_OBSOBS:HyperLabel := HyperLabel{#SC_OBSOBS,"Obs:",NULL_STRING,NULL_STRING}

oDCPEDIDO := SingleLineEdit{self,ResourceID{JPE_PEDIDO,_GetInst()}}
oDCPEDIDO:FieldSpec := padrao_num_08{}
oDCPEDIDO:HyperLabel := HyperLabel{#PEDIDO,"Pedido:",NULL_STRING,"PE_PEDIDO"}
oDCPEDIDO:BackGround := aBrushes[1]
oDCPEDIDO:Font(aFonts[1], FALSE)

oDCTIPPED := SingleLineEdit{self,ResourceID{JPE_TIPPED,_GetInst()}}
oDCTIPPED:FieldSpec := PADRAO_CHAR_01{}
oDCTIPPED:HyperLabel := HyperLabel{#TIPPED,"T",NULL_STRING,"PE_TIPPED"}
oDCTIPPED:BackGround := aBrushes[1]
oDCTIPPED:Font(aFonts[2], FALSE)

oDCCODIGO := SingleLineEdit{self,ResourceID{JPE_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"PE_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[2], FALSE)

oDCNOME := SingleLineEdit{self,ResourceID{JPE_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_50{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"PE_NOME"}
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[2], FALSE)

oDCFORNECEDO := SingleLineEdit{self,ResourceID{JPE_FORNECEDO,_GetInst()}}
oDCFORNECEDO:FieldSpec := padrao_num_08{}
oDCFORNECEDO:HyperLabel := HyperLabel{#FORNECEDO,"Fornecedo:",NULL_STRING,"PE_FORNECEDO"}
oDCFORNECEDO:BackGround := aBrushes[1]
oDCFORNECEDO:Font(aFonts[2], FALSE)

oDCCOGNOME := SingleLineEdit{self,ResourceID{JPE_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := padrao_char_12{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"PE_COGNOME"}
oDCCOGNOME:BackGround := aBrushes[1]
oDCCOGNOME:Font(aFonts[2], FALSE)

oDCUNID := SingleLineEdit{self,ResourceID{JPE_UNID,_GetInst()}}
oDCUNID:FieldSpec := PADRAO_CHAR_02{}
oDCUNID:HyperLabel := HyperLabel{#UNID,"Unid:",NULL_STRING,"PE_UNID"}
oDCUNID:BackGround := aBrushes[1]
oDCUNID:Font(aFonts[2], FALSE)

oDCNOM2 := SingleLineEdit{self,ResourceID{JPE_NOM2,_GetInst()}}
oDCNOM2:FieldSpec := PADRAO_CHAR_50{}
oDCNOM2:HyperLabel := HyperLabel{#NOM2,"Nom2:",NULL_STRING,"PE_NOM2"}
oDCNOM2:BackGround := aBrushes[1]
oDCNOM2:Font(aFonts[3], FALSE)

oDCCOMPRAS := SingleLineEdit{self,ResourceID{JPE_COMPRAS,_GetInst()}}
oDCCOMPRAS:FieldSpec := padrao_num_08{}
oDCCOMPRAS:HyperLabel := HyperLabel{#COMPRAS,"Compras:",NULL_STRING,"PE_COMPRAS"}
oDCCOMPRAS:BackGround := aBrushes[1]
oDCCOMPRAS:Font(aFonts[2], FALSE)

oDCCOMITEM := SingleLineEdit{self,ResourceID{JPE_COMITEM,_GetInst()}}
oDCCOMITEM:FieldSpec := padrao_num_03{}
oDCCOMITEM:HyperLabel := HyperLabel{#COMITEM,"Ite",NULL_STRING,"PE_COMITEM"}
oDCCOMITEM:BackGround := aBrushes[1]
oDCCOMITEM:Font(aFonts[2], FALSE)

oDCAPLICACAO := SingleLineEdit{self,ResourceID{JPE_APLICACAO,_GetInst()}}
oDCAPLICACAO:FieldSpec := PADRAO_CHAR_50{}
oDCAPLICACAO:HyperLabel := HyperLabel{#APLICACAO,"Aplicacao:",NULL_STRING,"PE_APLICACAO"}
oDCAPLICACAO:BackGround := aBrushes[1]
oDCAPLICACAO:Font(aFonts[2], FALSE)

oDCLOCENT := SingleLineEdit{self,ResourceID{JPE_LOCENT,_GetInst()}}
oDCLOCENT:FieldSpec := PADRAO_NUM_01{}
oDCLOCENT:HyperLabel := HyperLabel{#LOCENT,"Locent:",NULL_STRING,"PE_LOCENT"}
oDCLOCENT:BackGround := aBrushes[1]
oDCLOCENT:Font(aFonts[2], FALSE)

oDCOBSOBS := SingleLineEdit{self,ResourceID{JPE_OBSOBS,_GetInst()}}
oDCOBSOBS:FieldSpec := PADRAO_CHAR_40{}
oDCOBSOBS:HyperLabel := HyperLabel{#OBSOBS,"Obsobs:",NULL_STRING,"PE_OBSOBS"}
oDCOBSOBS:BackGround := aBrushes[1]
oDCOBSOBS:Font(aFonts[2], FALSE)

oCCbuscaPED := PushButton{self,ResourceID{JPE_BUSCAPED,_GetInst()}}
oCCbuscaPED:Image := icO_find{}
oCCbuscaPED:HyperLabel := HyperLabel{#buscaPED,NULL_STRING,NULL_STRING,NULL_STRING}

oCCExcluir := PushButton{self,ResourceID{JPE_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}

oCCIncluir := PushButton{self,ResourceID{JPE_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}

oCCCALC20 := PushButton{self,ResourceID{JPE_CALC20,_GetInst()}}
oCCCALC20:HyperLabel := HyperLabel{#CALC20,"20",NULL_STRING,NULL_STRING}
oCCCALC20:TooltipText := "Programa para  20 Entregas"

oCCCALC19 := PushButton{self,ResourceID{JPE_CALC19,_GetInst()}}
oCCCALC19:HyperLabel := HyperLabel{#CALC19,"19",NULL_STRING,NULL_STRING}
oCCCALC19:TooltipText := "Programa para  19 Entregas"

oCCCALC18 := PushButton{self,ResourceID{JPE_CALC18,_GetInst()}}
oCCCALC18:HyperLabel := HyperLabel{#CALC18,"18",NULL_STRING,NULL_STRING}
oCCCALC18:TooltipText := "Programa para  18 Entregas"

oCCCALC17 := PushButton{self,ResourceID{JPE_CALC17,_GetInst()}}
oCCCALC17:HyperLabel := HyperLabel{#CALC17,"17",NULL_STRING,NULL_STRING}
oCCCALC17:TooltipText := "Programa para  17 Entregas"

oCCCALC16 := PushButton{self,ResourceID{JPE_CALC16,_GetInst()}}
oCCCALC16:HyperLabel := HyperLabel{#CALC16,"16",NULL_STRING,NULL_STRING}
oCCCALC16:TooltipText := "Programa para  16 Entregas"

oCCCALC15 := PushButton{self,ResourceID{JPE_CALC15,_GetInst()}}
oCCCALC15:HyperLabel := HyperLabel{#CALC15,"15",NULL_STRING,NULL_STRING}
oCCCALC15:TooltipText := "Programa para  15 Entregas"

oCCCALC14 := PushButton{self,ResourceID{JPE_CALC14,_GetInst()}}
oCCCALC14:HyperLabel := HyperLabel{#CALC14,"14",NULL_STRING,NULL_STRING}
oCCCALC14:TooltipText := "Programa para  14 Entregas"

oCCCALC13 := PushButton{self,ResourceID{JPE_CALC13,_GetInst()}}
oCCCALC13:HyperLabel := HyperLabel{#CALC13,"13",NULL_STRING,NULL_STRING}
oCCCALC13:TooltipText := "Programa para  13 Entregas"

oCCCALC12 := PushButton{self,ResourceID{JPE_CALC12,_GetInst()}}
oCCCALC12:HyperLabel := HyperLabel{#CALC12,"12",NULL_STRING,NULL_STRING}
oCCCALC12:TooltipText := "Programa para  12 Entregas"

oCCCALC11 := PushButton{self,ResourceID{JPE_CALC11,_GetInst()}}
oCCCALC11:HyperLabel := HyperLabel{#CALC11,"11",NULL_STRING,NULL_STRING}
oCCCALC11:TooltipText := "Programa para  11 Entregas"

oCCCALC10 := PushButton{self,ResourceID{JPE_CALC10,_GetInst()}}
oCCCALC10:HyperLabel := HyperLabel{#CALC10,"10",NULL_STRING,NULL_STRING}
oCCCALC10:TooltipText := "Programa para  10 Entregas"

oCCCALC09 := PushButton{self,ResourceID{JPE_CALC09,_GetInst()}}
oCCCALC09:HyperLabel := HyperLabel{#CALC09,"09",NULL_STRING,NULL_STRING}
oCCCALC09:TooltipText := "Programa para  9 Entregas"

oCCCALC08 := PushButton{self,ResourceID{JPE_CALC08,_GetInst()}}
oCCCALC08:HyperLabel := HyperLabel{#CALC08,"08",NULL_STRING,NULL_STRING}
oCCCALC08:TooltipText := "Programa para  8 Entregas"

oCCCALC07 := PushButton{self,ResourceID{JPE_CALC07,_GetInst()}}
oCCCALC07:HyperLabel := HyperLabel{#CALC07,"07",NULL_STRING,NULL_STRING}
oCCCALC07:TooltipText := "Programa para  7 Entregas"

oCCCALC06 := PushButton{self,ResourceID{JPE_CALC06,_GetInst()}}
oCCCALC06:HyperLabel := HyperLabel{#CALC06,"06",NULL_STRING,NULL_STRING}
oCCCALC06:TooltipText := "Programa para  6 Entregas"

oCCCALC05 := PushButton{self,ResourceID{JPE_CALC05,_GetInst()}}
oCCCALC05:HyperLabel := HyperLabel{#CALC05,"05",NULL_STRING,NULL_STRING}
oCCCALC05:TooltipText := "Programa para  5 Entregas"

oCCCALC04 := PushButton{self,ResourceID{JPE_CALC04,_GetInst()}}
oCCCALC04:HyperLabel := HyperLabel{#CALC04,"04",NULL_STRING,NULL_STRING}
oCCCALC04:TooltipText := "Programa para 4 Entregas"

oCCCALC03 := PushButton{self,ResourceID{JPE_CALC03,_GetInst()}}
oCCCALC03:HyperLabel := HyperLabel{#CALC03,"03",NULL_STRING,NULL_STRING}
oCCCALC03:TooltipText := "Programa para  3 Entregas"

oCCCALC02 := PushButton{self,ResourceID{JPE_CALC02,_GetInst()}}
oCCCALC02:HyperLabel := HyperLabel{#CALC02,"02",NULL_STRING,NULL_STRING}
oCCCALC02:TooltipText := "Programa para  2 Entregas"

oCCCALC01 := PushButton{self,ResourceID{JPE_CALC01,_GetInst()}}
oCCCALC01:HyperLabel := HyperLabel{#CALC01,"01",NULL_STRING,NULL_STRING}
oCCCALC01:TooltipText := "Programa para 1 Entrega"

oCCcmdqtde := PushButton{self,ResourceID{JPE_CMDQTDE,_GetInst()}}
oCCcmdqtde:HyperLabel := HyperLabel{#cmdqtde,"Quantidade",NULL_STRING,NULL_STRING}

oCCcmddata := PushButton{self,ResourceID{JPE_CMDDATA,_GetInst()}}
oCCcmddata:HyperLabel := HyperLabel{#cmddata,"Data",NULL_STRING,NULL_STRING}

self:Caption := "Programa de Entrega"
self:HyperLabel := HyperLabel{#jpe,"Programa de Entrega",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBPEDIDO := DataColumn{padrao_num_08{}}
oDBPEDIDO:Width := 8
oDBPEDIDO:HyperLabel := oDCPEDIDO:HyperLabel 
oDBPEDIDO:Caption := "Pedido:"
oDBPEDIDO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBPEDIDO)

oDBCOMPRAS := DataColumn{padrao_num_08{}}
oDBCOMPRAS:Width := 9
oDBCOMPRAS:HyperLabel := oDCCOMPRAS:HyperLabel 
oDBCOMPRAS:Caption := "Compras:"
oDBCOMPRAS:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCOMPRAS)

oDBCOMITEM := DataColumn{padrao_num_03{}}
oDBCOMITEM:Width := 4
oDBCOMITEM:HyperLabel := oDCCOMITEM:HyperLabel 
oDBCOMITEM:Caption := "Ite"
oDBCOMITEM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCOMITEM)

oDBFORNECEDO := DataColumn{padrao_num_08{}}
oDBFORNECEDO:Width := 11
oDBFORNECEDO:HyperLabel := oDCFORNECEDO:HyperLabel 
oDBFORNECEDO:Caption := "Fornecedo:"
oDBFORNECEDO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBFORNECEDO)

oDBCOGNOME := DataColumn{padrao_char_12{}}
oDBCOGNOME:Width := 9
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
oDBCOGNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCOGNOME)

oDBTIPPED := DataColumn{PADRAO_CHAR_01{}}
oDBTIPPED:Width := 4
oDBTIPPED:HyperLabel := oDCTIPPED:HyperLabel 
oDBTIPPED:Caption := "T"
oDBTIPPED:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTIPPED)

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBUNID := DataColumn{PADRAO_CHAR_02{}}
oDBUNID:Width := 6
oDBUNID:HyperLabel := oDCUNID:HyperLabel 
oDBUNID:Caption := "Unid:"
oDBUNID:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBUNID)

oDBNOME := DataColumn{PADRAO_CHAR_50{}}
oDBNOME:Width := 49
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#FormView)

oSFJPE01 := JPE01{self,JPE_JPE01}
oSFJPE01:show()

oSFJNEC := JNEC{self,JPE_JNEC}
oSFJNEC:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LOCENT() 
return self:FieldGet(#LOCENT)


assign LOCENT(uValue) 
self:FieldPut(#LOCENT, uValue)
return LOCENT := uValue


access NOM2() 
return self:FieldGet(#NOM2)


assign NOM2(uValue) 
self:FieldPut(#NOM2, uValue)
return NOM2 := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access OBSOBS() 
return self:FieldGet(#OBSOBS)


assign OBSOBS(uValue) 
self:FieldPut(#OBSOBS, uValue)
return OBSOBS := uValue


access PEDIDO() 
return self:FieldGet(#PEDIDO)


assign PEDIDO(uValue) 
self:FieldPut(#PEDIDO, uValue)
return PEDIDO := uValue


access TIPPED() 
return self:FieldGet(#TIPPED)


assign TIPPED(uValue) 
self:FieldPut(#TIPPED, uValue)
return TIPPED := uValue


access UNID() 
return self:FieldGet(#UNID)


assign UNID(uValue) 
self:FieldPut(#UNID, uValue)
return UNID := uValue


END CLASS
