#region DEFINES
STATIC DEFINE JOCC_ALTERAR := 104 
STATIC DEFINE JOCC_ANTERIOR := 112 
STATIC DEFINE JOCC_ASSINAR := 106 
STATIC DEFINE JOCC_ASSINARTO := 119 
STATIC DEFINE JOCC_BUSCAOC := 123 
STATIC DEFINE JOCC_CERTIFI := 133 
STATIC DEFINE JOCC_CODFOR := 131 
STATIC DEFINE JOCC_CODIGO := 128 
STATIC DEFINE JOCC_COGFOR := 129 
STATIC DEFINE JOCC_DATA := 100 
STATIC DEFINE JOCC_DATAP := 108 
STATIC DEFINE JOCC_DUPLICAR := 121 
STATIC DEFINE JOCC_EDITIP := 114 
STATIC DEFINE JOCC_ESCFOR := 110 
STATIC DEFINE JOCC_ESCTIP := 115 
STATIC DEFINE JOCC_EXCLUIR := 102 
STATIC DEFINE JOCC_IMPORTAR := 118 
STATIC DEFINE JOCC_INCLUIR := 103 
STATIC DEFINE JOCC_JOCCI := 101 
STATIC DEFINE JOCC_LAUDO := 120 
STATIC DEFINE JOCC_NFCC := 117 
STATIC DEFINE JOCC_OCC := 127 
STATIC DEFINE JOCC_PEGFOR := 113 
STATIC DEFINE JOCC_POROC := 122 
STATIC DEFINE JOCC_PROXIMA := 109 
STATIC DEFINE JOCC_PROXIMO := 111 
STATIC DEFINE JOCC_SC_CERTIFI := 132 
STATIC DEFINE JOCC_SC_CERTIFI1 := 116 
STATIC DEFINE JOCC_SC_CODFOR := 130 
STATIC DEFINE JOCC_SC_CODIGO := 125 
STATIC DEFINE JOCC_SC_DATA := 126 
STATIC DEFINE JOCC_SC_DATAP := 107 
STATIC DEFINE JOCC_SC_OCC := 124 
STATIC DEFINE JOCC_TABULAR := 105 
#endregion

PARTIAL class JOCC inherit MYDataWindow 

	PROTECT oDBOCC as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDATAP as DataColumn
	PROTECT oDBCERTIFI as DataColumn
	PROTECT oDBCODFOR as DataColumn
	PROTECT oDBCOGFOR as DataColumn
	protect oDCDATA as DATETIMEPICKER
	protect oCCExcluir as PUSHBUTTON
	protect oCCIncluir as PUSHBUTTON
	protect oCCALTERAR as PUSHBUTTON
	protect oCCTABULAR as PUSHBUTTON
	protect oCCassinar as PUSHBUTTON
	protect oDCSC_DATAP as FIXEDTEXT
	protect oDCDATAP as SINGLELINEEDIT
	protect oCCProxima as PUSHBUTTON
	protect oCCESCFOR as PUSHBUTTON
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCpegFOR as PUSHBUTTON
	protect oCCediTIP as PUSHBUTTON
	protect oCCESCTIP as PUSHBUTTON
	protect oDCSC_CERTIFI1 as FIXEDTEXT
	protect oDCNFCC as SINGLELINEEDIT
	protect oCCimportar as PUSHBUTTON
	protect oCCAssinarTo as PUSHBUTTON
	protect oCCLaudo as PUSHBUTTON
	protect oCCduplicar as PUSHBUTTON
	protect oCCporoc as PUSHBUTTON
	protect oCCbuscaoc as PUSHBUTTON
	protect oDCSC_OCC as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCOCC as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCCOGFOR as SINGLELINEEDIT
	protect oDCSC_CODFOR as FIXEDTEXT
	protect oDCCODFOR as RIGHTSLE
	protect oDCSC_CERTIFI as FIXEDTEXT
	protect oDCCERTIFI as SINGLELINEEDIT
// 	instance DATAP 
// 	instance NFCC 
// 	instance OCC 
// 	instance CODIGO 
// 	instance COGFOR 
// 	instance CODFOR 
// 	instance CERTIFI 
	protect oSFJOCCI as JOCCI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CERTIFI() 
return self:FieldGet(#CERTIFI)


assign CERTIFI(uValue) 
self:FieldPut(#CERTIFI, uValue)
return CERTIFI := uValue


access CODFOR() 
return self:FieldGet(#CODFOR)


assign CODFOR(uValue) 
self:FieldPut(#CODFOR, uValue)
return CODFOR := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access COGFOR() 
return self:FieldGet(#COGFOR)


assign COGFOR(uValue) 
self:FieldPut(#COGFOR, uValue)
return COGFOR := uValue


access DATAP() 
return self:FieldGet(#DATAP)


assign DATAP(uValue) 
self:FieldPut(#DATAP, uValue)
return DATAP := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JOCC",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,12,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDATA := DateTimePicker{self,ResourceID{JOCC_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDATA:TooltipText := "Data"

oCCExcluir := PushButton{self,ResourceID{JOCC_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}
oCCExcluir:TooltipText := "Excluir o Item em Destaque"

oCCIncluir := PushButton{self,ResourceID{JOCC_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}
oCCIncluir:TooltipText := "Incluir um novo Item"

oCCALTERAR := PushButton{self,ResourceID{JOCC_ALTERAR,_GetInst()}}
oCCALTERAR:HyperLabel := HyperLabel{#ALTERAR,"Alterar Iten",NULL_STRING,NULL_STRING}
oCCALTERAR:TooltipText := "Altera o Item em Destaque"

oCCTABULAR := PushButton{self,ResourceID{JOCC_TABULAR,_GetInst()}}
oCCTABULAR:HyperLabel := HyperLabel{#TABULAR,"Ver Itens",NULL_STRING,NULL_STRING}
oCCTABULAR:TooltipText := "Visualiza todos os Itens"

oCCassinar := PushButton{self,ResourceID{JOCC_ASSINAR,_GetInst()}}
oCCassinar:HyperLabel := HyperLabel{#assinar,"Assinar",NULL_STRING,NULL_STRING}
oCCassinar:TooltipText := "Assinar o Item em destaque"

oDCSC_DATAP := FixedText{self,ResourceID{JOCC_SC_DATAP,_GetInst()}}
oDCSC_DATAP:HyperLabel := HyperLabel{#SC_DATAP,"Datap:",NULL_STRING,NULL_STRING}

oDCDATAP := SingleLineEdit{self,ResourceID{JOCC_DATAP,_GetInst()}}
oDCDATAP:FieldSpec := date_field{}
oDCDATAP:HyperLabel := HyperLabel{#DATAP,"Data",NULL_STRING,"ME04C_DATAP"}
oDCDATAP:BackGround := aBrushes[1]
oDCDATAP:Font(aFonts[1], FALSE)

oCCProxima := PushButton{self,ResourceID{JOCC_PROXIMA,_GetInst()}}
oCCProxima:HyperLabel := HyperLabel{#Proxima,"Proxima",NULL_STRING,NULL_STRING}
oCCProxima:TooltipText := "Atualiza Proxima Calibraçao Cad. Instrumento"

oCCESCFOR := PushButton{self,ResourceID{JOCC_ESCFOR,_GetInst()}}
oCCESCFOR:HyperLabel := HyperLabel{#ESCFOR,NULL_STRING,NULL_STRING,NULL_STRING}
oCCESCFOR:TooltipText := "Escolher Fornecedor"
oCCESCFOR:Image := ICO_FIND{}

oCCProximo := PushButton{self,ResourceID{JOCC_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ICO_NEXT{}
oCCProximo:TooltipText := "Avança um Icone"

oCCAnterior := PushButton{self,ResourceID{JOCC_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ICO_PREVIOUS{}
oCCAnterior:TooltipText := "Retorna um Icone"

oCCpegFOR := PushButton{self,ResourceID{JOCC_PEGFOR,_GetInst()}}
oCCpegFOR:HyperLabel := HyperLabel{#pegFOR,"-->",NULL_STRING,NULL_STRING}
oCCpegFOR:TooltipText := "Preenche Campo Cognome conforme nº Fornecedor"

oCCediTIP := PushButton{self,ResourceID{JOCC_EDITIP,_GetInst()}}
oCCediTIP:HyperLabel := HyperLabel{#ediTIP,"E",NULL_STRING,NULL_STRING}
oCCediTIP:TooltipText := "Editar Instrumento"

oCCESCTIP := PushButton{self,ResourceID{JOCC_ESCTIP,_GetInst()}}
oCCESCTIP:HyperLabel := HyperLabel{#ESCTIP,NULL_STRING,NULL_STRING,NULL_STRING}
oCCESCTIP:TooltipText := "Escolher Instrumento"
oCCESCTIP:Image := ICO_FIND{}

oDCSC_CERTIFI1 := FixedText{self,ResourceID{JOCC_SC_CERTIFI1,_GetInst()}}
oDCSC_CERTIFI1:HyperLabel := HyperLabel{#SC_CERTIFI1,"Certif.Interno","Numero do Certificado",NULL_STRING}

oDCNFCC := SingleLineEdit{self,ResourceID{JOCC_NFCC,_GetInst()}}
oDCNFCC:FieldSpec := padrao_num_08{}
oDCNFCC:HyperLabel := HyperLabel{#NFCC,"Fornecedor",NULL_STRING,"ME04C_CODFOR"}
oDCNFCC:TooltipText := "Nº do Certificado Interno"

oCCimportar := PushButton{self,ResourceID{JOCC_IMPORTAR,_GetInst()}}
oCCimportar:HyperLabel := HyperLabel{#importar,"Importar",NULL_STRING,NULL_STRING}
oCCimportar:TooltipText := "Retorna Dados do Certificado Interno"

oCCAssinarTo := PushButton{self,ResourceID{JOCC_ASSINARTO,_GetInst()}}
oCCAssinarTo:HyperLabel := HyperLabel{#AssinarTo,"Assinar Todas",NULL_STRING,NULL_STRING}
oCCAssinarTo:TooltipText := "Assinar Todos os Itens"

oCCLaudo := PushButton{self,ResourceID{JOCC_LAUDO,_GetInst()}}
oCCLaudo:HyperLabel := HyperLabel{#Laudo,"Laudo",NULL_STRING,NULL_STRING}
oCCLaudo:TooltipText := "Preenche o Laudo (A)pr.(R)ep (C)ond"

oCCduplicar := PushButton{self,ResourceID{JOCC_DUPLICAR,_GetInst()}}
oCCduplicar:HyperLabel := HyperLabel{#duplicar,"Duplicar",NULL_STRING,NULL_STRING}
oCCduplicar:TooltipText := "Cria uma Novo OCC com base nesta"

oCCporoc := PushButton{self,ResourceID{JOCC_POROC,_GetInst()}}
oCCporoc:Image := ICO_AZ{}
oCCporoc:HyperLabel := HyperLabel{#poroc,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporoc:TooltipText := "Ordenar Por Numero"

oCCbuscaoc := PushButton{self,ResourceID{JOCC_BUSCAOC,_GetInst()}}
oCCbuscaoc:Image := ICO_FIND{}
oCCbuscaoc:HyperLabel := HyperLabel{#buscaoc,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaoc:TooltipText := "Localizar Um Nº OCC"

oDCSC_OCC := FixedText{self,ResourceID{JOCC_SC_OCC,_GetInst()}}
oDCSC_OCC:HyperLabel := HyperLabel{#SC_OCC,"Ordem:","Numero da Ordem de Calibração",NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JOCC_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Código:","Código do Instrumento",NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JOCC_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:","Data da Calibração",NULL_STRING}

oDCOCC := SingleLineEdit{self,ResourceID{JOCC_OCC,_GetInst()}}
oDCOCC:FieldSpec := padrao_num_08{}
oDCOCC:HyperLabel := HyperLabel{#OCC,"Occ:",NULL_STRING,"ME04C_OCC"}
oDCOCC:TooltipText := "Numero da Ordem Calibraçao"
oDCOCC:BackGround := aBrushes[1]
oDCOCC:Font(aFonts[2], FALSE)

oDCCODIGO := SingleLineEdit{self,ResourceID{JOCC_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_10{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"ME04C_CODIGO"}
oDCCODIGO:TooltipText := "Codigo do Instrumento"

oDCCOGFOR := SingleLineEdit{self,ResourceID{JOCC_COGFOR,_GetInst()}}
oDCCOGFOR:FieldSpec := padrao_char_20{}
oDCCOGFOR:HyperLabel := HyperLabel{#COGFOR,"Cognome",NULL_STRING,"ME04C_COGFOR"}
oDCCOGFOR:TooltipText := "Cognome do Fornecedor"

oDCSC_CODFOR := FixedText{self,ResourceID{JOCC_SC_CODFOR,_GetInst()}}
oDCSC_CODFOR:HyperLabel := HyperLabel{#SC_CODFOR,"Fornecedor","Codigo do Fornecedor",NULL_STRING}

oDCCODFOR := rightSle{self,ResourceID{JOCC_CODFOR,_GetInst()}}
oDCCODFOR:FieldSpec := padrao_num_08{}
oDCCODFOR:HyperLabel := HyperLabel{#CODFOR,"Fornecedor",NULL_STRING,"ME04C_CODFOR"}
oDCCODFOR:TooltipText := "Nº do Fornecedor"

oDCSC_CERTIFI := FixedText{self,ResourceID{JOCC_SC_CERTIFI,_GetInst()}}
oDCSC_CERTIFI:HyperLabel := HyperLabel{#SC_CERTIFI,"Certificado:","Numero do Certificado",NULL_STRING}

oDCCERTIFI := SingleLineEdit{self,ResourceID{JOCC_CERTIFI,_GetInst()}}
oDCCERTIFI:FieldSpec := padrao_char_10{}
oDCCERTIFI:HyperLabel := HyperLabel{#CERTIFI,"Certificado",NULL_STRING,"ME04C_CERTIFI"}
oDCCERTIFI:TooltipText := "Nº do Certificado"

self:Caption := "Ordem Calibracao"
self:HyperLabel := HyperLabel{#JOCC,"Ordem Calibracao",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBOCC := DataColumn{padrao_num_08{}}
oDBOCC:Width := 7
oDBOCC:HyperLabel := oDCOCC:HyperLabel 
oDBOCC:Caption := "Occ:"
oDBOCC:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOCC)

oDBCODIGO := DataColumn{padrao_char_10{}}
oDBCODIGO:Width := 13
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBDATAP := DataColumn{date_field{}}
oDBDATAP:Width := 10
oDBDATAP:HyperLabel := oDCDATAP:HyperLabel 
oDBDATAP:Caption := "Data"
oDBDATAP:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDATAP)

oDBCERTIFI := DataColumn{padrao_char_10{}}
oDBCERTIFI:Width := 14
oDBCERTIFI:HyperLabel := oDCCERTIFI:HyperLabel 
oDBCERTIFI:Caption := "Certificado"
self:Browser:AddColumn(oDBCERTIFI)

oDBCODFOR := DataColumn{padrao_num_08{}}
oDBCODFOR:Width := 14
oDBCODFOR:HyperLabel := oDCCODFOR:HyperLabel 
oDBCODFOR:Caption := "Fornecedor"
self:Browser:AddColumn(oDBCODFOR)

oDBCOGFOR := DataColumn{padrao_char_20{}}
oDBCOGFOR:Width := 15
oDBCOGFOR:HyperLabel := oDCCOGFOR:HyperLabel 
oDBCOGFOR:Caption := "Cognome"
self:Browser:AddColumn(oDBCOGFOR)


self:ViewAs(#FormView)

oSFJOCCI := JOCCI{self,JOCC_JOCCI}
oSFJOCCI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NFCC() 
return self:FieldGet(#NFCC)


assign NFCC(uValue) 
self:FieldPut(#NFCC, uValue)
return NFCC := uValue


access OCC() 
return self:FieldGet(#OCC)


assign OCC(uValue) 
self:FieldPut(#OCC, uValue)
return OCC := uValue


END CLASS
