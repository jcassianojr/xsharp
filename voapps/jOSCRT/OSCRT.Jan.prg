#region DEFINES
STATIC DEFINE JOSC_ATIVO := 127 
STATIC DEFINE JOSC_BUSCAOS := 133 
STATIC DEFINE JOSC_CHKCLIPRO := 134 
STATIC DEFINE JOSC_CLIENTE := 112 
STATIC DEFINE JOSC_CLINOME := 101 
STATIC DEFINE JOSC_CODCLI := 102 
STATIC DEFINE JOSC_CODIGO := 113 
STATIC DEFINE JOSC_CODIGOINT := 104 
STATIC DEFINE JOSC_DATA := 100 
STATIC DEFINE JOSC_DATAIMP := 142 
STATIC DEFINE JOSC_DELIVERY := 107 
STATIC DEFINE JOSC_EMUSO := 117 
STATIC DEFINE JOSC_ESCCOD := 115 
STATIC DEFINE JOSC_ESCFOR := 114 
STATIC DEFINE JOSC_FOTO := 136 
STATIC DEFINE JOSC_FT10 := 140 
STATIC DEFINE JOSC_FT11 := 138 
STATIC DEFINE JOSC_FT12 := 141 
STATIC DEFINE JOSC_FT7 := 124 
STATIC DEFINE JOSC_NOME := 103 
STATIC DEFINE JOSC_OBS := 109 
STATIC DEFINE JOSC_OS := 111 
STATIC DEFINE JOSC_PEDCLIITE := 106 
STATIC DEFINE JOSC_PEDCLIOBS := 110 
STATIC DEFINE JOSC_PEDIDOCLI := 105 
STATIC DEFINE JOSC_PEGCLI := 130 
STATIC DEFINE JOSC_PEGPRO := 131 
STATIC DEFINE JOSC_PF := 116 
STATIC DEFINE JOSC_POROS := 132 
STATIC DEFINE JOSC_RADIOBUTTON1 := 118 
STATIC DEFINE JOSC_RADIOBUTTON2 := 119 
STATIC DEFINE JOSC_RADIOBUTTON3 := 128 
STATIC DEFINE JOSC_RADIOBUTTON4 := 129 
STATIC DEFINE JOSC_RADIOBUTTON5 := 144 
STATIC DEFINE JOSC_SC_CLIENTE := 122 
STATIC DEFINE JOSC_SC_CODIGO := 125 
STATIC DEFINE JOSC_SC_DATA := 121 
STATIC DEFINE JOSC_SC_DATA1 := 137 
STATIC DEFINE JOSC_SC_DATA2 := 143 
STATIC DEFINE JOSC_SC_DESTINO2 := 135 
STATIC DEFINE JOSC_SC_OBS := 126 
STATIC DEFINE JOSC_SC_OS := 120 
STATIC DEFINE JOSC_SC_PEDIDOCLI := 123 
STATIC DEFINE JOSC_SINCLX := 139 
STATIC DEFINE JOSC_STOCK := 108 
#endregion

PARTIAL class JOSC inherit MYDataWindow 

	PROTECT oDBOS as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCLINOME as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBPEDIDOCLI as DataColumn
	protect oDCDATA as DATETIMEPICKER
	protect oDCCLINOME as SINGLELINEEDIT
	protect oDCCODCLI as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCCODIGOINT as SINGLELINEEDIT
	protect oDCPEDIDOCLI as SINGLELINEEDIT
	protect oDCPEDCLIITE as SINGLELINEEDIT
	protect oDCDELIVERY as SINGLELINEEDIT
	protect oDCSTOCK as SINGLELINEEDIT
	protect oDCOBS as SINGLELINEEDIT
	protect oDCPEDCLIOBS as SINGLELINEEDIT
	protect oDCOS as SINGLELINEEDIT
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oCCescfor as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oDCPF as SINGLELINEEDIT
	protect oDCEMUSO as RADIOBUTTONGROUP
	protect oCCRadioButton1 as RADIOBUTTON
	protect oCCRadioButton2 as RADIOBUTTON
	protect oDCSC_OS as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCSC_PEDIDOCLI as FIXEDTEXT
	protect oDCFT7 as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_OBS as FIXEDTEXT
	protect oDCATIVO as RADIOBUTTONGROUP
	protect oCCRadioButton3 as RADIOBUTTON
	protect oCCRadioButton4 as RADIOBUTTON
	protect oCCpegcli as PUSHBUTTON
	protect oCCpegpro as PUSHBUTTON
	protect oCCporos as PUSHBUTTON
	protect oCCbuscaos as PUSHBUTTON
	protect oCCchkclipro as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oDCSC_DATA1 as FIXEDTEXT
	protect oDCFT11 as FIXEDTEXT
	protect oCCsinclx as PUSHBUTTON
	protect oDCFT10 as FIXEDTEXT
	protect oDCFT12 as FIXEDTEXT
	protect oDCDATAIMP as SINGLELINEEDIT
	protect oDCSC_DATA2 as FIXEDTEXT
	protect oCCRadioButton5 as RADIOBUTTON
// 	instance CLINOME 
// 	instance CODCLI 
// 	instance NOME 
// 	instance CODIGOINT 
// 	instance PEDIDOCLI 
// 	instance PEDCLIITE 
// 	instance DELIVERY 
// 	instance STOCK 
// 	instance OBS 
// 	instance PEDCLIOBS 
// 	instance OS 
// 	instance CLIENTE 
// 	instance CODIGO 
// 	instance PF 
// 	instance EMUSO 
// 	instance ATIVO 
// 	instance DATAIMP 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ATIVO() 
return self:FieldGet(#ATIVO)


assign ATIVO(uValue) 
self:FieldPut(#ATIVO, uValue)
return ATIVO := uValue


access CLIENTE() 
return self:FieldGet(#CLIENTE)


assign CLIENTE(uValue) 
self:FieldPut(#CLIENTE, uValue)
return CLIENTE := uValue


access CLINOME() 
return self:FieldGet(#CLINOME)


assign CLINOME(uValue) 
self:FieldPut(#CLINOME, uValue)
return CLINOME := uValue


access CODCLI() 
return self:FieldGet(#CODCLI)


assign CODCLI(uValue) 
self:FieldPut(#CODCLI, uValue)
return CODCLI := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODIGOINT() 
return self:FieldGet(#CODIGOINT)


assign CODIGOINT(uValue) 
self:FieldPut(#CODIGOINT, uValue)
return CODIGOINT := uValue


access DATAIMP() 
return self:FieldGet(#DATAIMP)


assign DATAIMP(uValue) 
self:FieldPut(#DATAIMP, uValue)
return DATAIMP := uValue


access DELIVERY() 
return self:FieldGet(#DELIVERY)


assign DELIVERY(uValue) 
self:FieldPut(#DELIVERY, uValue)
return DELIVERY := uValue


access EMUSO() 
return self:FieldGet(#EMUSO)


assign EMUSO(uValue) 
self:FieldPut(#EMUSO, uValue)
return EMUSO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JOSC",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDATA := DateTimePicker{self,ResourceID{JOSC_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDATA:TooltipText := "Data Abertura Ordem Serviço"

oDCCLINOME := SingleLineEdit{self,ResourceID{JOSC_CLINOME,_GetInst()}}
oDCCLINOME:FieldSpec := padrao_CHAR_50{}
oDCCLINOME:HyperLabel := HyperLabel{#CLINOME,"Nome",NULL_STRING,"OSCRT_CLIENTE"}
oDCCLINOME:TooltipText := "Razao Social do Cliente"

oDCCODCLI := SingleLineEdit{self,ResourceID{JOSC_CODCLI,_GetInst()}}
oDCCODCLI:FieldSpec := padrao_CHAR_24{}
oDCCODCLI:HyperLabel := HyperLabel{#CODCLI,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCODCLI:TooltipText := "Observações sobre entrega"

oDCNOME := SingleLineEdit{self,ResourceID{JOSC_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Descrição",NULL_STRING,"OSCRT_CLIENTE"}
oDCNOME:TooltipText := "Descriçao do Produto"

oDCCODIGOINT := SingleLineEdit{self,ResourceID{JOSC_CODIGOINT,_GetInst()}}
oDCCODIGOINT:FieldSpec := padrao_CHAR_24{}
oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCODIGOINT:TooltipText := "Observações sobre entrega"

oDCPEDIDOCLI := SingleLineEdit{self,ResourceID{JOSC_PEDIDOCLI,_GetInst()}}
oDCPEDIDOCLI:FieldSpec := padrao_CHAR_20{}
oDCPEDIDOCLI:HyperLabel := HyperLabel{#PEDIDOCLI,"Pedido",NULL_STRING,"OSCRT_PEDIDOCLI"}
oDCPEDIDOCLI:TooltipText := "Numero do Pedido do Cliente"

oDCPEDCLIITE := SingleLineEdit{self,ResourceID{JOSC_PEDCLIITE,_GetInst()}}
oDCPEDCLIITE:FieldSpec := padrao_NUM_03{}
oDCPEDCLIITE:HyperLabel := HyperLabel{#PEDCLIITE,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPEDCLIITE:TooltipText := "Observações sobre entrega"

oDCDELIVERY := SingleLineEdit{self,ResourceID{JOSC_DELIVERY,_GetInst()}}
oDCDELIVERY:FieldSpec := padrao_CHAR_20{}
oDCDELIVERY:HyperLabel := HyperLabel{#DELIVERY,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDELIVERY:TooltipText := "Observações sobre entrega"

oDCSTOCK := SingleLineEdit{self,ResourceID{JOSC_STOCK,_GetInst()}}
oDCSTOCK:FieldSpec := padrao_CHAR_20{}
oDCSTOCK:HyperLabel := HyperLabel{#STOCK,NULL_STRING,NULL_STRING,NULL_STRING}
oDCSTOCK:TooltipText := "Observações sobre entrega"

oDCOBS := SingleLineEdit{self,ResourceID{JOSC_OBS,_GetInst()}}
oDCOBS:FieldSpec := padrao_CHAR_30{}
oDCOBS:HyperLabel := HyperLabel{#OBS,"Obs:",NULL_STRING,"OSCRT_OBS"}
oDCOBS:TooltipText := "Observações"

oDCPEDCLIOBS := SingleLineEdit{self,ResourceID{JOSC_PEDCLIOBS,_GetInst()}}
oDCPEDCLIOBS:FieldSpec := padrao_CHAR_10{}
oDCPEDCLIOBS:HyperLabel := HyperLabel{#PEDCLIOBS,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPEDCLIOBS:TooltipText := "Observações sobre entrega"

oDCOS := SingleLineEdit{self,ResourceID{JOSC_OS,_GetInst()}}
oDCOS:FieldSpec := padrao_NUM_08{}
oDCOS:HyperLabel := HyperLabel{#OS,"Controle Ordem Servicos",NULL_STRING,"OSCRT_OS"}
oDCOS:TooltipText := "Numero da Ordem de Servico"
oDCOS:BackGround := aBrushes[1]
oDCOS:Font(aFonts[1], FALSE)

oDCCLIENTE := SingleLineEdit{self,ResourceID{JOSC_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := padrao_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"OSCRT_CLIENTE"}
oDCCLIENTE:TooltipText := "Numero do Cadastro do Cliente"
oDCCLIENTE:BackGround := aBrushes[1]
oDCCLIENTE:Font(aFonts[2], FALSE)

oDCCODIGO := SingleLineEdit{self,ResourceID{JOSC_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"OSCRT_CODIGO"}
oDCCODIGO:TooltipText := "Codigo do Produto"
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[2], FALSE)

oCCescfor := PushButton{self,ResourceID{JOSC_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}
oCCescfor:TooltipText := "Exibir Lista de Cliente "

oCCesccod := PushButton{self,ResourceID{JOSC_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}
oCCesccod:TooltipText := "Exibe Lista de Produtos(PCP)"

oDCPF := SingleLineEdit{self,ResourceID{JOSC_PF,_GetInst()}}
oDCPF:FieldSpec := padrao_NUM_08{}
oDCPF:HyperLabel := HyperLabel{#PF,"Não",NULL_STRING,"OSCRT_CLIENTE"}
oDCPF:TooltipText := "Numero do Processo de Fabricação"
oDCPF:BackGround := aBrushes[1]
oDCPF:Font(aFonts[2], FALSE)

oCCRadioButton1 := RadioButton{self,ResourceID{JOSC_RADIOBUTTON1,_GetInst()}}
oCCRadioButton1:HyperLabel := HyperLabel{#RadioButton1,"Sim",NULL_STRING,NULL_STRING}
oCCRadioButton1:TooltipText := "Processo em Uso"

oCCRadioButton2 := RadioButton{self,ResourceID{JOSC_RADIOBUTTON2,_GetInst()}}
oCCRadioButton2:HyperLabel := HyperLabel{#RadioButton2,"Não",NULL_STRING,NULL_STRING}
oCCRadioButton2:TooltipText := "Processo nao está em uso"

oDCSC_OS := FixedText{self,ResourceID{JOSC_SC_OS,_GetInst()}}
oDCSC_OS:HyperLabel := HyperLabel{#SC_OS,"Os:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JOSC_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{JOSC_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCSC_PEDIDOCLI := FixedText{self,ResourceID{JOSC_SC_PEDIDOCLI,_GetInst()}}
oDCSC_PEDIDOCLI:HyperLabel := HyperLabel{#SC_PEDIDOCLI,"Pedido Cliente:",NULL_STRING,NULL_STRING}

oDCFT7 := FixedText{self,ResourceID{JOSC_FT7,_GetInst()}}
oDCFT7:HyperLabel := HyperLabel{#FT7,"Obs",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JOSC_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Produto:",NULL_STRING,NULL_STRING}

oDCSC_OBS := FixedText{self,ResourceID{JOSC_SC_OBS,_GetInst()}}
oDCSC_OBS:HyperLabel := HyperLabel{#SC_OBS,"Obs:",NULL_STRING,NULL_STRING}

oCCRadioButton3 := RadioButton{self,ResourceID{JOSC_RADIOBUTTON3,_GetInst()}}
oCCRadioButton3:HyperLabel := HyperLabel{#RadioButton3,"Sim",NULL_STRING,NULL_STRING}

oCCRadioButton4 := RadioButton{self,ResourceID{JOSC_RADIOBUTTON4,_GetInst()}}
oCCRadioButton4:HyperLabel := HyperLabel{#RadioButton4,"Não",NULL_STRING,NULL_STRING}

oCCpegcli := PushButton{self,ResourceID{JOSC_PEGCLI,_GetInst()}}
oCCpegcli:HyperLabel := HyperLabel{#pegcli,"-->",NULL_STRING,NULL_STRING}
oCCpegcli:TooltipText := "Retorna a Razao Social do Cliente"

oCCpegpro := PushButton{self,ResourceID{JOSC_PEGPRO,_GetInst()}}
oCCpegpro:HyperLabel := HyperLabel{#pegpro,"-->",NULL_STRING,NULL_STRING}
oCCpegpro:TooltipText := "Retorna a Descrição do Produto"

oCCporos := PushButton{self,ResourceID{JOSC_POROS,_GetInst()}}
oCCporos:Image := ICO_AZ{}
oCCporos:HyperLabel := HyperLabel{#poros,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporos:TooltipText := "Clique para ordenar por Numero"

oCCbuscaos := PushButton{self,ResourceID{JOSC_BUSCAOS,_GetInst()}}
oCCbuscaos:Image := ICO_FIND{}
oCCbuscaos:HyperLabel := HyperLabel{#buscaos,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaos:TooltipText := "Clique Para Localizar Por Numero"

oCCchkclipro := PushButton{self,ResourceID{JOSC_CHKCLIPRO,_GetInst()}}
oCCchkclipro:HyperLabel := HyperLabel{#chkclipro,"Checar Cliente Produto",NULL_STRING,NULL_STRING}
oCCchkclipro:TooltipText := "Verificar os Nomes Clientes Produtos"

oDCSC_DESTINO2 := FixedText{self,ResourceID{JOSC_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JOSC_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oDCSC_DATA1 := FixedText{self,ResourceID{JOSC_SC_DATA1,_GetInst()}}
oDCSC_DATA1:HyperLabel := HyperLabel{#SC_DATA1,"Item",NULL_STRING,NULL_STRING}

oDCFT11 := FixedText{self,ResourceID{JOSC_FT11,_GetInst()}}
oDCFT11:HyperLabel := HyperLabel{#FT11,"Codigo Integrado",NULL_STRING,NULL_STRING}

oCCsinclx := PushButton{self,ResourceID{JOSC_SINCLX,_GetInst()}}
oCCsinclx:HyperLabel := HyperLabel{#sinclx,"Importar  LX",NULL_STRING,NULL_STRING}

oDCFT10 := FixedText{self,ResourceID{JOSC_FT10,_GetInst()}}
oDCFT10:HyperLabel := HyperLabel{#FT10,"Delivery",NULL_STRING,NULL_STRING}

oDCFT12 := FixedText{self,ResourceID{JOSC_FT12,_GetInst()}}
oDCFT12:HyperLabel := HyperLabel{#FT12,"Stock",NULL_STRING,NULL_STRING}

oDCDATAIMP := SingleLineEdit{self,ResourceID{JOSC_DATAIMP,_GetInst()}}
oDCDATAIMP:HyperLabel := HyperLabel{#DATAIMP,"Não",NULL_STRING,NULL_STRING}
oDCDATAIMP:TooltipText := "Numero do Processo de Fabricação"
oDCDATAIMP:BackGround := aBrushes[1]
oDCDATAIMP:Font(aFonts[2], FALSE)

oDCSC_DATA2 := FixedText{self,ResourceID{JOSC_SC_DATA2,_GetInst()}}
oDCSC_DATA2:HyperLabel := HyperLabel{#SC_DATA2,"Ultima Importacao",NULL_STRING,NULL_STRING}

oCCRadioButton5 := RadioButton{self,ResourceID{JOSC_RADIOBUTTON5,_GetInst()}}
oCCRadioButton5:HyperLabel := HyperLabel{#RadioButton5,"Preliminar>1200",NULL_STRING,NULL_STRING}

oDCEMUSO := RadioButtonGroup{self,ResourceID{JOSC_EMUSO,_GetInst()}}
oDCEMUSO:FillUsing({ ;
						{oCCRadioButton1,"S"}, ;
						{oCCRadioButton2,"N"} ;
						})
oDCEMUSO:HyperLabel := HyperLabel{#EMUSO,"Em Uso PF",NULL_STRING,NULL_STRING}
oDCEMUSO:FieldSpec := padrao_CHAR_01{}
oDCEMUSO:TooltipText := "Processo de Fabricaçao em Uso Sim/Nao"

oDCATIVO := RadioButtonGroup{self,ResourceID{JOSC_ATIVO,_GetInst()}}
oDCATIVO:FillUsing({ ;
						{oCCRadioButton3,"S"}, ;
						{oCCRadioButton4,"N"}, ;
						{oCCRadioButton5,"P"} ;
						})
oDCATIVO:HyperLabel := HyperLabel{#ATIVO,"Em uso",NULL_STRING,NULL_STRING}
oDCATIVO:FieldSpec := padrao_CHAR_01{}
oDCATIVO:TooltipText := "Ordem Esta Ativa Sim/Não"

self:Caption := "Controle Ordem Servicos"
self:HyperLabel := HyperLabel{#JOSC,"Controle Ordem Servicos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBOS := DataColumn{padrao_NUM_08{}}
oDBOS:Width := 7
oDBOS:HyperLabel := oDCOS:HyperLabel 
oDBOS:Caption := "Controle Ordem Servicos"
oDBOS:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOS)

oDBCLIENTE := DataColumn{padrao_NUM_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
oDBCLIENTE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCLIENTE)

oDBCLINOME := DataColumn{padrao_CHAR_50{}}
oDBCLINOME:Width := 10
oDBCLINOME:HyperLabel := oDCCLINOME:HyperLabel 
oDBCLINOME:Caption := "Nome"
self:Browser:AddColumn(oDBCLINOME)

oDBCODIGO := DataColumn{padrao_CHAR_24{}}
oDBCODIGO:Width := 15
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{padrao_CHAR_40{}}
oDBNOME:Width := 15
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Descrição"
self:Browser:AddColumn(oDBNOME)

oDBPEDIDOCLI := DataColumn{padrao_CHAR_20{}}
oDBPEDIDOCLI:Width := 11
oDBPEDIDOCLI:HyperLabel := oDCPEDIDOCLI:HyperLabel 
oDBPEDIDOCLI:Caption := "Pedido"
self:Browser:AddColumn(oDBPEDIDOCLI)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access OBS() 
return self:FieldGet(#OBS)


assign OBS(uValue) 
self:FieldPut(#OBS, uValue)
return OBS := uValue


access OS() 
return self:FieldGet(#OS)


assign OS(uValue) 
self:FieldPut(#OS, uValue)
return OS := uValue


access PEDCLIITE() 
return self:FieldGet(#PEDCLIITE)


assign PEDCLIITE(uValue) 
self:FieldPut(#PEDCLIITE, uValue)
return PEDCLIITE := uValue


access PEDCLIOBS() 
return self:FieldGet(#PEDCLIOBS)


assign PEDCLIOBS(uValue) 
self:FieldPut(#PEDCLIOBS, uValue)
return PEDCLIOBS := uValue


access PEDIDOCLI() 
return self:FieldGet(#PEDIDOCLI)


assign PEDIDOCLI(uValue) 
self:FieldPut(#PEDIDOCLI, uValue)
return PEDIDOCLI := uValue


access PF() 
return self:FieldGet(#PF)


assign PF(uValue) 
self:FieldPut(#PF, uValue)
return PF := uValue


access STOCK() 
return self:FieldGet(#STOCK)


assign STOCK(uValue) 
self:FieldPut(#STOCK, uValue)
return STOCK := uValue


END CLASS
