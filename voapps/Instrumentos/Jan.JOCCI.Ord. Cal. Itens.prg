#region DEFINES
STATIC DEFINE JOCCI_ASSDAT := 118 
STATIC DEFINE JOCCI_ASSNOM := 119 
STATIC DEFINE JOCCI_DESVIO := 104 
STATIC DEFINE JOCCI_ENCTR := 103 
STATIC DEFINE JOCCI_ESPECI := 102 
STATIC DEFINE JOCCI_INCTOT := 105 
STATIC DEFINE JOCCI_ITEM := 100 
STATIC DEFINE JOCCI_LAUDO := 117 
STATIC DEFINE JOCCI_NRELAT := 101 
STATIC DEFINE JOCCI_OCC := 116 
STATIC DEFINE JOCCI_SC_DESVIO := 111 
STATIC DEFINE JOCCI_SC_ENCTR := 110 
STATIC DEFINE JOCCI_SC_ESPECI := 109 
STATIC DEFINE JOCCI_SC_INCTOT := 112 
STATIC DEFINE JOCCI_SC_ITEM := 107 
STATIC DEFINE JOCCI_SC_LAUDO := 113 
STATIC DEFINE JOCCI_SC_OCC := 106 
STATIC DEFINE JOCCI_THEFIXEDTEXT10 := 114 
STATIC DEFINE JOCCI_THEFIXEDTEXT7 := 108 
STATIC DEFINE JOCCI_THEFIXEDTEXT8 := 115 
#endregion

class JOCCI inherit DATAWINDOW 

	PROTECT oDBOCC as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBESPECI as DataColumn
	PROTECT oDBENCTR as DataColumn
	PROTECT oDBDESVIO as DataColumn
	PROTECT oDBINCTOT as DataColumn
	PROTECT oDBLAUDO as DataColumn
	protect oDCITEM as SINGLELINEEDIT
	protect oDCNRELAT as SINGLELINEEDIT
	protect oDCESPECI as SINGLELINEEDIT
	protect oDCENCTR as SINGLELINEEDIT
	protect oDCDESVIO as SINGLELINEEDIT
	protect oDCINCTOT as SINGLELINEEDIT
	protect oDCSC_OCC as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCtheFixedText7 as FIXEDTEXT
	protect oDCSC_ESPECI as FIXEDTEXT
	protect oDCSC_ENCTR as FIXEDTEXT
	protect oDCSC_DESVIO as FIXEDTEXT
	protect oDCSC_INCTOT as FIXEDTEXT
	protect oDCSC_LAUDO as FIXEDTEXT
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oDCtheFixedText8 as FIXEDTEXT
	protect oDCOCC as SINGLELINEEDIT
	protect oDCLAUDO as SINGLELINEEDIT
	protect oDCASSDAT as SINGLELINEEDIT
	protect oDCASSNOM as SINGLELINEEDIT
// 	instance ITEM 
// 	instance NRELAT 
// 	instance ESPECI 
// 	instance ENCTR 
// 	instance DESVIO 
// 	instance INCTOT 
// 	instance OCC 
// 	instance LAUDO 
// 	instance ASSDAT 
// 	instance ASSNOM 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ASSDAT() 
return self:FieldGet(#ASSDAT)


assign ASSDAT(uValue) 
self:FieldPut(#ASSDAT, uValue)
return ASSDAT := uValue


access ASSNOM() 
return self:FieldGet(#ASSNOM)


assign ASSNOM(uValue) 
self:FieldPut(#ASSNOM, uValue)
return ASSNOM := uValue


access DESVIO() 
return self:FieldGet(#DESVIO)


assign DESVIO(uValue) 
self:FieldPut(#DESVIO, uValue)
return DESVIO := uValue


access ENCTR() 
return self:FieldGet(#ENCTR)


assign ENCTR(uValue) 
self:FieldPut(#ENCTR, uValue)
return ENCTR := uValue


access ESPECI() 
return self:FieldGet(#ESPECI)


assign ESPECI(uValue) 
self:FieldPut(#ESPECI, uValue)
return ESPECI := uValue


access INCTOT() 
return self:FieldGet(#INCTOT)


assign INCTOT(uValue) 
self:FieldPut(#INCTOT, uValue)
return INCTOT := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JOCCI",_GetInst()},iCtlID)

oDCITEM := SingleLineEdit{self,ResourceID{JOCCI_ITEM,_GetInst()}}
oDCITEM:FieldSpec := padrao_num_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"ME04CI_ITEM"}
oDCITEM:FocusSelect := FSEL_ALL
oDCITEM:TooltipText := "Sequencia/Item"

oDCNRELAT := SingleLineEdit{self,ResourceID{JOCCI_NRELAT,_GetInst()}}
oDCNRELAT:FieldSpec := padrao_char_05{}
oDCNRELAT:HyperLabel := HyperLabel{#NRELAT,NULL_STRING,NULL_STRING,NULL_STRING}
oDCNRELAT:FocusSelect := FSEL_ALL
oDCNRELAT:TooltipText := "Nº Relatorio"

oDCESPECI := SingleLineEdit{self,ResourceID{JOCCI_ESPECI,_GetInst()}}
oDCESPECI:FieldSpec := padrao_char_30{}
oDCESPECI:HyperLabel := HyperLabel{#ESPECI,"Especificado",NULL_STRING,"ME04CI_ESPECI"}
oDCESPECI:FocusSelect := FSEL_ALL
oDCESPECI:TooltipText := "Especificicado"

oDCENCTR := SingleLineEdit{self,ResourceID{JOCCI_ENCTR,_GetInst()}}
oDCENCTR:FieldSpec := padrao_char_30{}
oDCENCTR:HyperLabel := HyperLabel{#ENCTR,"Encontrado",NULL_STRING,"ME04CI_ENCTR"}
oDCENCTR:FocusSelect := FSEL_ALL
oDCENCTR:TooltipText := "Encontrado"

oDCDESVIO := SingleLineEdit{self,ResourceID{JOCCI_DESVIO,_GetInst()}}
oDCDESVIO:FieldSpec := padrao_char_10{}
oDCDESVIO:HyperLabel := HyperLabel{#DESVIO,"Desvio:",NULL_STRING,"ME04CI_DESVIO"}
oDCDESVIO:FocusSelect := FSEL_ALL
oDCDESVIO:TooltipText := "Desvio"

oDCINCTOT := SingleLineEdit{self,ResourceID{JOCCI_INCTOT,_GetInst()}}
oDCINCTOT:FieldSpec := padrao_char_10{}
oDCINCTOT:HyperLabel := HyperLabel{#INCTOT,"Inc.Tot.",NULL_STRING,"ME04CI_INCTOT"}
oDCINCTOT:FocusSelect := FSEL_ALL
oDCINCTOT:TooltipText := "Incerteza Total"

oDCSC_OCC := FixedText{self,ResourceID{JOCCI_SC_OCC,_GetInst()}}
oDCSC_OCC:HyperLabel := HyperLabel{#SC_OCC,"Occ:",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JOCCI_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCtheFixedText7 := FixedText{self,ResourceID{JOCCI_THEFIXEDTEXT7,_GetInst()}}
oDCtheFixedText7:HyperLabel := HyperLabel{#theFixedText7,"No.Relat",NULL_STRING,NULL_STRING}

oDCSC_ESPECI := FixedText{self,ResourceID{JOCCI_SC_ESPECI,_GetInst()}}
oDCSC_ESPECI:HyperLabel := HyperLabel{#SC_ESPECI,"Especificado:",NULL_STRING,NULL_STRING}

oDCSC_ENCTR := FixedText{self,ResourceID{JOCCI_SC_ENCTR,_GetInst()}}
oDCSC_ENCTR:HyperLabel := HyperLabel{#SC_ENCTR,"Encontrado:",NULL_STRING,NULL_STRING}

oDCSC_DESVIO := FixedText{self,ResourceID{JOCCI_SC_DESVIO,_GetInst()}}
oDCSC_DESVIO:HyperLabel := HyperLabel{#SC_DESVIO,"Desvio:",NULL_STRING,NULL_STRING}

oDCSC_INCTOT := FixedText{self,ResourceID{JOCCI_SC_INCTOT,_GetInst()}}
oDCSC_INCTOT:HyperLabel := HyperLabel{#SC_INCTOT,"Incr. Total:",NULL_STRING,NULL_STRING}

oDCSC_LAUDO := FixedText{self,ResourceID{JOCCI_SC_LAUDO,_GetInst()}}
oDCSC_LAUDO:HyperLabel := HyperLabel{#SC_LAUDO,"Laudo:",NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{self,ResourceID{JOCCI_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"Em:",NULL_STRING,NULL_STRING}

oDCtheFixedText8 := FixedText{self,ResourceID{JOCCI_THEFIXEDTEXT8,_GetInst()}}
oDCtheFixedText8:HyperLabel := HyperLabel{#theFixedText8,"Nome",NULL_STRING,NULL_STRING}

oDCOCC := SingleLineEdit{self,ResourceID{JOCCI_OCC,_GetInst()}}
oDCOCC:FieldSpec := padrao_num_08{}
oDCOCC:HyperLabel := HyperLabel{#OCC,"Occ:",NULL_STRING,"ME04CI_OCC"}
oDCOCC:TooltipText := "Numero da Ordem Calibraçao"

oDCLAUDO := SingleLineEdit{self,ResourceID{JOCCI_LAUDO,_GetInst()}}
oDCLAUDO:FieldSpec := padrao_char_01{}
oDCLAUDO:HyperLabel := HyperLabel{#LAUDO,"Laudo:",NULL_STRING,"ME04CI_LAUDO"}
oDCLAUDO:FocusSelect := FSEL_ALL
oDCLAUDO:TooltipText := "Laudo"

oDCASSDAT := SingleLineEdit{self,ResourceID{JOCCI_ASSDAT,_GetInst()}}
oDCASSDAT:FieldSpec := date_field{}
oDCASSDAT:HyperLabel := HyperLabel{#ASSDAT,NULL_STRING,NULL_STRING,NULL_STRING}
oDCASSDAT:TooltipText := "Data Assinatura Laudo"

oDCASSNOM := SingleLineEdit{self,ResourceID{JOCCI_ASSNOM,_GetInst()}}
oDCASSNOM:FieldSpec := padrao_char_10{}
oDCASSNOM:HyperLabel := HyperLabel{#ASSNOM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCASSNOM:TooltipText := "Nome de quem Assinou"

self:Caption := "Itens da Ordem Calibração"
self:HyperLabel := HyperLabel{#JOCCI,"Itens da Ordem Calibração",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBOCC := DataColumn{padrao_num_08{}}
oDBOCC:Width := 5
oDBOCC:HyperLabel := oDCOCC:HyperLabel 
oDBOCC:Caption := "Occ:"
self:Browser:AddColumn(oDBOCC)

oDBITEM := DataColumn{padrao_num_03{}}
oDBITEM:Width := 6
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
self:Browser:AddColumn(oDBITEM)

oDBESPECI := DataColumn{padrao_char_30{}}
oDBESPECI:Width := 18
oDBESPECI:HyperLabel := oDCESPECI:HyperLabel 
oDBESPECI:Caption := "Especificado"
self:Browser:AddColumn(oDBESPECI)

oDBENCTR := DataColumn{padrao_char_30{}}
oDBENCTR:Width := 15
oDBENCTR:HyperLabel := oDCENCTR:HyperLabel 
oDBENCTR:Caption := "Encontrado"
self:Browser:AddColumn(oDBENCTR)

oDBDESVIO := DataColumn{padrao_char_10{}}
oDBDESVIO:Width := 8
oDBDESVIO:HyperLabel := oDCDESVIO:HyperLabel 
oDBDESVIO:Caption := "Desvio:"
self:Browser:AddColumn(oDBDESVIO)

oDBINCTOT := DataColumn{padrao_char_10{}}
oDBINCTOT:Width := 8
oDBINCTOT:HyperLabel := oDCINCTOT:HyperLabel 
oDBINCTOT:Caption := "Inc.Tot."
self:Browser:AddColumn(oDBINCTOT)

oDBLAUDO := DataColumn{padrao_char_01{}}
oDBLAUDO:Width := 7
oDBLAUDO:HyperLabel := oDCLAUDO:HyperLabel 
oDBLAUDO:Caption := "Laudo:"
self:Browser:AddColumn(oDBLAUDO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access LAUDO() 
return self:FieldGet(#LAUDO)


assign LAUDO(uValue) 
self:FieldPut(#LAUDO, uValue)
return LAUDO := uValue


access NRELAT() 
return self:FieldGet(#NRELAT)


assign NRELAT(uValue) 
self:FieldPut(#NRELAT, uValue)
return NRELAT := uValue


access OCC() 
return self:FieldGet(#OCC)


assign OCC(uValue) 
self:FieldPut(#OCC, uValue)
return OCC := uValue


END CLASS
