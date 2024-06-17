#region DEFINES
STATIC DEFINE JCNQ_ACPNC := 108 
STATIC DEFINE JCNQ_BUSCANUM := 120 
STATIC DEFINE JCNQ_CLIENTE := 104 
STATIC DEFINE JCNQ_CLINOME := 101 
STATIC DEFINE JCNQ_DATA := 115 
STATIC DEFINE JCNQ_DATAFEC := 114 
STATIC DEFINE JCNQ_DESPRO := 100 
STATIC DEFINE JCNQ_ESCCOD := 129 
STATIC DEFINE JCNQ_ESCFOR := 128 
STATIC DEFINE JCNQ_EXTERNO := 112 
STATIC DEFINE JCNQ_FECHAR := 116 
STATIC DEFINE JCNQ_FOTO := 127 
STATIC DEFINE JCNQ_INTERNO := 113 
STATIC DEFINE JCNQ_PORNUM := 119 
STATIC DEFINE JCNQ_PRODUTO := 102 
STATIC DEFINE JCNQ_QTI07 := 123 
STATIC DEFINE JCNQ_RAT := 110 
STATIC DEFINE JCNQ_RNC := 107 
STATIC DEFINE JCNQ_SAC := 117 
STATIC DEFINE JCNQ_SC_ACPNC := 109 
STATIC DEFINE JCNQ_SC_CLIENTE := 105 
STATIC DEFINE JCNQ_SC_DATA := 106 
STATIC DEFINE JCNQ_SC_DESTINO2 := 126 
STATIC DEFINE JCNQ_SC_PRODUTO := 103 
STATIC DEFINE JCNQ_SC_RNC1 := 111 
STATIC DEFINE JCNQ_TABCNQ := 125 
STATIC DEFINE JCNQ_THEFIXEDTEXT20 := 124 
STATIC DEFINE JCNQ_VERRNC := 121 
STATIC DEFINE JCNQ_VERSAC := 118 
STATIC DEFINE JCNQ_VLI07 := 122 
STATIC DEFINE TABCNQEXT_PCVALEXT := 135 
STATIC DEFINE TABCNQEXT_QTE01 := 100 
STATIC DEFINE TABCNQEXT_QTE02 := 104 
STATIC DEFINE TABCNQEXT_QTE03 := 105 
STATIC DEFINE TABCNQEXT_QTE04 := 106 
STATIC DEFINE TABCNQEXT_QTE05 := 107 
STATIC DEFINE TABCNQEXT_QTE06 := 108 
STATIC DEFINE TABCNQEXT_QTE07 := 109 
STATIC DEFINE TABCNQEXT_QTE08 := 110 
STATIC DEFINE TABCNQEXT_QTE09 := 127 
STATIC DEFINE TABCNQEXT_QTE10 := 133 
STATIC DEFINE TABCNQEXT_QTE11 := 130 
STATIC DEFINE TABCNQEXT_SC_QTE01 := 101 
STATIC DEFINE TABCNQEXT_SC_QTE02 := 120 
STATIC DEFINE TABCNQEXT_SC_QTE03 := 119 
STATIC DEFINE TABCNQEXT_SC_QTE04 := 121 
STATIC DEFINE TABCNQEXT_SC_QTE05 := 122 
STATIC DEFINE TABCNQEXT_SC_QTE06 := 123 
STATIC DEFINE TABCNQEXT_SC_QTE07 := 124 
STATIC DEFINE TABCNQEXT_SC_QTE8 := 128 
STATIC DEFINE TABCNQEXT_SC_QTI03 := 134 
STATIC DEFINE TABCNQEXT_SC_QTI04 := 131 
STATIC DEFINE TABCNQEXT_SC_QTI6 := 136 
STATIC DEFINE TABCNQEXT_THEFIXEDTEXT18 := 125 
STATIC DEFINE TABCNQEXT_THEFIXEDTEXT23 := 102 
STATIC DEFINE TABCNQEXT_THEFIXEDTEXT24 := 103 
STATIC DEFINE TABCNQEXT_VLE01 := 111 
STATIC DEFINE TABCNQEXT_VLE02 := 112 
STATIC DEFINE TABCNQEXT_VLE03 := 113 
STATIC DEFINE TABCNQEXT_VLE04 := 114 
STATIC DEFINE TABCNQEXT_VLE05 := 115 
STATIC DEFINE TABCNQEXT_VLE06 := 116 
STATIC DEFINE TABCNQEXT_VLE07 := 117 
STATIC DEFINE TABCNQEXT_VLE08 := 118 
STATIC DEFINE TABCNQEXT_VLE09 := 126 
STATIC DEFINE TABCNQEXT_VLE10 := 132 
STATIC DEFINE TABCNQEXT_VLE11 := 129 
STATIC DEFINE TABCNQINT_PCVALINT := 103 
STATIC DEFINE TABCNQINT_QTI01 := 118 
STATIC DEFINE TABCNQINT_QTI02 := 115 
STATIC DEFINE TABCNQINT_QTI03 := 112 
STATIC DEFINE TABCNQINT_QTI04 := 109 
STATIC DEFINE TABCNQINT_QTI05 := 106 
STATIC DEFINE TABCNQINT_QTI06 := 101 
STATIC DEFINE TABCNQINT_SC_QTI01 := 119 
STATIC DEFINE TABCNQINT_SC_QTI02 := 116 
STATIC DEFINE TABCNQINT_SC_QTI03 := 113 
STATIC DEFINE TABCNQINT_SC_QTI04 := 110 
STATIC DEFINE TABCNQINT_SC_QTI05 := 107 
STATIC DEFINE TABCNQINT_SC_QTI6 := 104 
STATIC DEFINE TABCNQINT_THEFIXEDTEXT19 := 102 
STATIC DEFINE TABCNQINT_VLI01 := 117 
STATIC DEFINE TABCNQINT_VLI02 := 114 
STATIC DEFINE TABCNQINT_VLI03 := 111 
STATIC DEFINE TABCNQINT_VLI04 := 108 
STATIC DEFINE TABCNQINT_VLI05 := 105 
STATIC DEFINE TABCNQINT_VLI06 := 100 
#endregion

PARTIAL class JCNQ inherit MYDataWindow 

	PROTECT oDBACPNC as DataColumn
	PROTECT oDBRNC as DataColumn
	PROTECT oDBRAT as DataColumn
	PROTECT oDBSAC as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCLINOME as DataColumn
	PROTECT oDBPRODUTO as DataColumn
	PROTECT oDBDESPRO as DataColumn
	protect oDCDESPRO as SINGLELINEEDIT
	protect oDCCLINOME as SINGLELINEEDIT
	protect oDCPRODUTO as SINGLELINEEDIT
	protect oDCSC_PRODUTO as FIXEDTEXT
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCRNC as SINGLELINEEDIT
	protect oDCACPNC as SINGLELINEEDIT
	protect oDCSC_ACPNC as FIXEDTEXT
	protect oDCRAT as SINGLELINEEDIT
	protect oDCSC_RNC1 as FIXEDTEXT
	protect oCCExterno as PUSHBUTTON
	protect oCCInterno as PUSHBUTTON
	protect oDCDATAFEC as SINGLELINEEDIT
	protect oDCDATA as SINGLELINEEDIT
	protect oCCFechar as PUSHBUTTON
	protect oDCSAC as SINGLELINEEDIT
	protect oCCversac as PUSHBUTTON
	protect oCCPORNUM as PUSHBUTTON
	protect oCCBuscanum as PUSHBUTTON
	protect oCCVERRNC as PUSHBUTTON
	protect oDCVLI07 as SINGLELINEEDIT
	protect oDCQTI07 as SINGLELINEEDIT
	protect oDCtheFixedText20 as FIXEDTEXT
	protect oDCtabcnq as TABCONTROL
	protect oTPTABCNQINT as TABCNQINT
	protect oTPTABCNQEXT as TABCNQEXT
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCescfor as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
// 	instance DESPRO 
// 	instance CLINOME 
// 	instance PRODUTO 
// 	instance CLIENTE 
// 	instance RNC 
// 	instance ACPNC 
// 	instance RAT 
// 	instance DATAFEC 
// 	instance DATA 
// 	instance SAC 
// 	instance VLI07 
// 	instance QTI07 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ACPNC() 
return self:FieldGet(#ACPNC)


assign ACPNC(uValue) 
self:FieldPut(#ACPNC, uValue)
return ACPNC := uValue


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


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access DATAFEC() 
return self:FieldGet(#DATAFEC)


assign DATAFEC(uValue) 
self:FieldPut(#DATAFEC, uValue)
return DATAFEC := uValue


access DESPRO() 
return self:FieldGet(#DESPRO)


assign DESPRO(uValue) 
self:FieldPut(#DESPRO, uValue)
return DESPRO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[2] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCNQ",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Times"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200,10}}
aBrushes[2] := Brush{Color{255,255,200}}

oDCDESPRO := SingleLineEdit{self,ResourceID{JCNQ_DESPRO,_GetInst()}}
oDCDESPRO:FieldSpec := padrao_char_40{}
oDCDESPRO:HyperLabel := HyperLabel{#DESPRO,"Descriçao",NULL_STRING,"ACPNC_DESPRO"}
oDCDESPRO:BackGround := aBrushes[1]
oDCDESPRO:Font(aFonts[1], FALSE)

oDCCLINOME := SingleLineEdit{self,ResourceID{JCNQ_CLINOME,_GetInst()}}
oDCCLINOME:FieldSpec := padrao_char_50{}
oDCCLINOME:HyperLabel := HyperLabel{#CLINOME,"Cliente",NULL_STRING,"ACPNC_CLINOME"}
oDCCLINOME:BackGround := aBrushes[1]
oDCCLINOME:Font(aFonts[1], FALSE)

oDCPRODUTO := SingleLineEdit{self,ResourceID{JCNQ_PRODUTO,_GetInst()}}
oDCPRODUTO:FieldSpec := padrao_char_24{}
oDCPRODUTO:HyperLabel := HyperLabel{#PRODUTO,"Produto:",NULL_STRING,"ACPNC_PRODUTO"}
oDCPRODUTO:BackGround := aBrushes[1]
oDCPRODUTO:Font(aFonts[1], FALSE)

oDCSC_PRODUTO := FixedText{self,ResourceID{JCNQ_SC_PRODUTO,_GetInst()}}
oDCSC_PRODUTO:HyperLabel := HyperLabel{#SC_PRODUTO,"Produto:",NULL_STRING,NULL_STRING}

oDCCLIENTE := SingleLineEdit{self,ResourceID{JCNQ_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := padrao_num_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"ACPNC_CLIENTE"}
oDCCLIENTE:BackGround := aBrushes[2]
oDCCLIENTE:Font(aFonts[1], FALSE)

oDCSC_CLIENTE := FixedText{self,ResourceID{JCNQ_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JCNQ_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data Abertura",NULL_STRING,NULL_STRING}

oDCRNC := SingleLineEdit{self,ResourceID{JCNQ_RNC,_GetInst()}}
oDCRNC:FieldSpec := padrao_num_08{}
oDCRNC:HyperLabel := HyperLabel{#RNC,"RNC",NULL_STRING,"ACPNC_RNC"}
oDCRNC:BackGround := aBrushes[2]
oDCRNC:Font(aFonts[1], FALSE)

oDCACPNC := SingleLineEdit{self,ResourceID{JCNQ_ACPNC,_GetInst()}}
oDCACPNC:FieldSpec := padrao_num_08{}
oDCACPNC:HyperLabel := HyperLabel{#ACPNC,"Nº",NULL_STRING,"ACPNC_ACPNC"}
oDCACPNC:BackGround := aBrushes[2]
oDCACPNC:Font(aFonts[1], FALSE)

oDCSC_ACPNC := FixedText{self,ResourceID{JCNQ_SC_ACPNC,_GetInst()}}
oDCSC_ACPNC:HyperLabel := HyperLabel{#SC_ACPNC,"CNQ",NULL_STRING,NULL_STRING}

oDCRAT := SingleLineEdit{self,ResourceID{JCNQ_RAT,_GetInst()}}
oDCRAT:FieldSpec := padrao_num_08{}
oDCRAT:HyperLabel := HyperLabel{#RAT,"RAT",NULL_STRING,"ACPNC_RNC"}
oDCRAT:BackGround := aBrushes[2]
oDCRAT:Font(aFonts[2], FALSE)

oDCSC_RNC1 := FixedText{self,ResourceID{JCNQ_SC_RNC1,_GetInst()}}
oDCSC_RNC1:HyperLabel := HyperLabel{#SC_RNC1,"RAT:",NULL_STRING,NULL_STRING}

oCCExterno := PushButton{self,ResourceID{JCNQ_EXTERNO,_GetInst()}}
oCCExterno:HyperLabel := HyperLabel{#Externo,"Alterar Valores Externos",NULL_STRING,NULL_STRING}

oCCInterno := PushButton{self,ResourceID{JCNQ_INTERNO,_GetInst()}}
oCCInterno:HyperLabel := HyperLabel{#Interno,"Alterar Valores Internos",NULL_STRING,NULL_STRING}

oDCDATAFEC := SingleLineEdit{self,ResourceID{JCNQ_DATAFEC,_GetInst()}}
oDCDATAFEC:FieldSpec := date_field{}
oDCDATAFEC:HyperLabel := HyperLabel{#DATAFEC,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDATAFEC:BackGround := aBrushes[2]
oDCDATAFEC:Font(aFonts[1], FALSE)

oDCDATA := SingleLineEdit{self,ResourceID{JCNQ_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"RAT",NULL_STRING,"ACPNC_RNC"}
oDCDATA:BackGround := aBrushes[2]
oDCDATA:Font(aFonts[1], FALSE)

oCCFechar := PushButton{self,ResourceID{JCNQ_FECHAR,_GetInst()}}
oCCFechar:HyperLabel := HyperLabel{#Fechar,"Fechamento",NULL_STRING,NULL_STRING}

oDCSAC := SingleLineEdit{self,ResourceID{JCNQ_SAC,_GetInst()}}
oDCSAC:FieldSpec := padrao_num_08{}
oDCSAC:HyperLabel := HyperLabel{#SAC,"SAC",NULL_STRING,"ACPNC_RNC"}
oDCSAC:BackGround := aBrushes[2]
oDCSAC:Font(aFonts[1], FALSE)

oCCversac := PushButton{self,ResourceID{JCNQ_VERSAC,_GetInst()}}
oCCversac:HyperLabel := HyperLabel{#versac,"SAC",NULL_STRING,NULL_STRING}

oCCPORNUM := PushButton{self,ResourceID{JCNQ_PORNUM,_GetInst()}}
oCCPORNUM:Image := ico_az{}
oCCPORNUM:HyperLabel := HyperLabel{#PORNUM,NULL_STRING,NULL_STRING,NULL_STRING}

oCCBuscanum := PushButton{self,ResourceID{JCNQ_BUSCANUM,_GetInst()}}
oCCBuscanum:Image := ico_find{}
oCCBuscanum:HyperLabel := HyperLabel{#Buscanum,NULL_STRING,NULL_STRING,NULL_STRING}

oCCVERRNC := PushButton{self,ResourceID{JCNQ_VERRNC,_GetInst()}}
oCCVERRNC:HyperLabel := HyperLabel{#VERRNC,"RNC",NULL_STRING,NULL_STRING}

oDCVLI07 := SingleLineEdit{self,ResourceID{JCNQ_VLI07,_GetInst()}}
oDCVLI07:FieldSpec := padrao_num_12_2{}
oDCVLI07:HyperLabel := HyperLabel{#VLI07,"Vli06:",NULL_STRING,"ACPNC_VLI06"}
oDCVLI07:BackGround := aBrushes[2]
oDCVLI07:Font(aFonts[1], FALSE)

oDCQTI07 := SingleLineEdit{self,ResourceID{JCNQ_QTI07,_GetInst()}}
oDCQTI07:FieldSpec := padrao_num_09_2{}
oDCQTI07:HyperLabel := HyperLabel{#QTI07,"Qti06:",NULL_STRING,"ACPNC_QTI06"}
oDCQTI07:BackGround := aBrushes[2]
oDCQTI07:Font(aFonts[1], FALSE)

oDCtheFixedText20 := FixedText{self,ResourceID{JCNQ_THEFIXEDTEXT20,_GetInst()}}
oDCtheFixedText20:HyperLabel := HyperLabel{#theFixedText20,"Fixo",NULL_STRING,NULL_STRING}

oDCtabcnq := TabControl{self,ResourceID{JCNQ_TABCNQ,_GetInst()}}
oDCtabcnq:HyperLabel := HyperLabel{#tabcnq,"Custo da Não Qualidade",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JCNQ_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JCNQ_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oCCescfor := PushButton{self,ResourceID{JCNQ_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JCNQ_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}
oCCesccod:TooltipText := "Escolher Produto na Lista"

self:Caption := "Custo da Não Qualidade"
self:HyperLabel := HyperLabel{#JCNQ,"Custo da Não Qualidade",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBACPNC := DataColumn{padrao_num_08{}}
oDBACPNC:Width := 8
oDBACPNC:HyperLabel := oDCACPNC:HyperLabel 
oDBACPNC:Caption := "Nº"
oDBACPNC:BackGround := aBrushes[2]
self:Browser:AddColumn(oDBACPNC)

oDBRNC := DataColumn{padrao_num_08{}}
oDBRNC:Width := 10
oDBRNC:HyperLabel := oDCRNC:HyperLabel 
oDBRNC:Caption := "RNC"
oDBRNC:BackGround := aBrushes[2]
self:Browser:AddColumn(oDBRNC)

oDBRAT := DataColumn{padrao_num_08{}}
oDBRAT:Width := 9
oDBRAT:HyperLabel := oDCRAT:HyperLabel 
oDBRAT:Caption := "RAT"
oDBRAT:BackGround := aBrushes[2]
self:Browser:AddColumn(oDBRAT)

oDBSAC := DataColumn{padrao_num_08{}}
oDBSAC:Width := 8
oDBSAC:HyperLabel := oDCSAC:HyperLabel 
oDBSAC:Caption := "SAC"
oDBSAC:BackGround := aBrushes[2]
self:Browser:AddColumn(oDBSAC)

oDBCLIENTE := DataColumn{padrao_num_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
oDBCLIENTE:BackGround := aBrushes[2]
self:Browser:AddColumn(oDBCLIENTE)

oDBCLINOME := DataColumn{padrao_char_50{}}
oDBCLINOME:Width := 19
oDBCLINOME:HyperLabel := oDCCLINOME:HyperLabel 
oDBCLINOME:Caption := "Cliente"
oDBCLINOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCLINOME)

oDBPRODUTO := DataColumn{padrao_char_24{}}
oDBPRODUTO:Width := 15
oDBPRODUTO:HyperLabel := oDCPRODUTO:HyperLabel 
oDBPRODUTO:Caption := "Produto:"
oDBPRODUTO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBPRODUTO)

oDBDESPRO := DataColumn{padrao_char_40{}}
oDBDESPRO:Width := 16
oDBDESPRO:HyperLabel := oDCDESPRO:HyperLabel 
oDBDESPRO:Caption := "Descriçao"
oDBDESPRO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDESPRO)


self:ViewAs(#FormView)
oTPTABCNQINT := TABCNQINT{self, 0}
oDCtabcnq:AppendTab(#TABCNQINT,"Interno",oTPTABCNQINT,0)
oTPTABCNQEXT := TABCNQEXT{self, 0}
oDCtabcnq:AppendTab(#TABCNQEXT,"Externo",oTPTABCNQEXT,0)
oDCtabcnq:SelectTab(#TABCNQINT)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PRODUTO() 
return self:FieldGet(#PRODUTO)


assign PRODUTO(uValue) 
self:FieldPut(#PRODUTO, uValue)
return PRODUTO := uValue


access QTI07() 
return self:FieldGet(#QTI07)


assign QTI07(uValue) 
self:FieldPut(#QTI07, uValue)
return QTI07 := uValue


access RAT() 
return self:FieldGet(#RAT)


assign RAT(uValue) 
self:FieldPut(#RAT, uValue)
return RAT := uValue


access RNC() 
return self:FieldGet(#RNC)


assign RNC(uValue) 
self:FieldPut(#RNC, uValue)
return RNC := uValue


access SAC() 
return self:FieldGet(#SAC)


assign SAC(uValue) 
self:FieldPut(#SAC, uValue)
return SAC := uValue


access VLI07() 
return self:FieldGet(#VLI07)


assign VLI07(uValue) 
self:FieldPut(#VLI07, uValue)
return VLI07 := uValue


END CLASS
class TABCNQEXT inherit DATAWINDOW 

	protect oDCQTE01 as SINGLELINEEDIT
	protect oDCSC_QTE01 as FIXEDTEXT
	protect oDCtheFixedText23 as FIXEDTEXT
	protect oDCtheFixedText24 as FIXEDTEXT
	protect oDCQTE02 as SINGLELINEEDIT
	protect oDCQTE03 as SINGLELINEEDIT
	protect oDCQTE04 as SINGLELINEEDIT
	protect oDCQTE05 as SINGLELINEEDIT
	protect oDCQTE06 as SINGLELINEEDIT
	protect oDCQTE07 as SINGLELINEEDIT
	protect oDCQTE08 as SINGLELINEEDIT
	protect oDCVLE01 as SINGLELINEEDIT
	protect oDCVLE02 as SINGLELINEEDIT
	protect oDCVLE03 as SINGLELINEEDIT
	protect oDCVLE04 as SINGLELINEEDIT
	protect oDCVLE05 as SINGLELINEEDIT
	protect oDCVLE06 as SINGLELINEEDIT
	protect oDCVLE07 as SINGLELINEEDIT
	protect oDCVLE08 as SINGLELINEEDIT
	protect oDCSC_QTE03 as FIXEDTEXT
	protect oDCSC_QTE02 as FIXEDTEXT
	protect oDCSC_QTE04 as FIXEDTEXT
	protect oDCSC_QTE05 as FIXEDTEXT
	protect oDCSC_QTE06 as FIXEDTEXT
	protect oDCSC_QTE07 as FIXEDTEXT
	protect oDCtheFixedText18 as FIXEDTEXT
	protect oDCVLE09 as SINGLELINEEDIT
	protect oDCQTE09 as SINGLELINEEDIT
	protect oDCSC_QTE8 as FIXEDTEXT
	protect oDCVLE11 as SINGLELINEEDIT
	protect oDCQTE11 as SINGLELINEEDIT
	protect oDCSC_QTI04 as FIXEDTEXT
	protect oDCVLE10 as SINGLELINEEDIT
	protect oDCQTE10 as SINGLELINEEDIT
	protect oDCSC_QTI03 as FIXEDTEXT
	protect oDCPCVALEXT as SINGLELINEEDIT
	protect oDCSC_QTI6 as FIXEDTEXT
// 	instance QTE01 
// 	instance QTE02 
// 	instance QTE03 
// 	instance QTE04 
// 	instance QTE05 
// 	instance QTE06 
// 	instance QTE07 
// 	instance QTE08 
// 	instance VLE01 
// 	instance VLE02 
// 	instance VLE03 
// 	instance VLE04 
// 	instance VLE05 
// 	instance VLE06 
// 	instance VLE07 
// 	instance VLE08 
// 	instance VLE09 
// 	instance QTE09 
// 	instance VLE11 
// 	instance QTE11 
// 	instance VLE10 
// 	instance QTE10 
// 	instance PCVALEXT 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"TABCNQEXT",_GetInst()},iCtlID)

oDCQTE01 := SingleLineEdit{self,ResourceID{TABCNQEXT_QTE01,_GetInst()}}
oDCQTE01:FieldSpec := padrao_num_09_2{}
oDCQTE01:HyperLabel := HyperLabel{#QTE01,"Qte01:",NULL_STRING,"ACPNC_QTE01"}

oDCSC_QTE01 := FixedText{self,ResourceID{TABCNQEXT_SC_QTE01,_GetInst()}}
oDCSC_QTE01:HyperLabel := HyperLabel{#SC_QTE01,"Despesas de Percurso",NULL_STRING,NULL_STRING}

oDCtheFixedText23 := FixedText{self,ResourceID{TABCNQEXT_THEFIXEDTEXT23,_GetInst()}}
oDCtheFixedText23:HyperLabel := HyperLabel{#theFixedText23,"Valores",NULL_STRING,NULL_STRING}

oDCtheFixedText24 := FixedText{self,ResourceID{TABCNQEXT_THEFIXEDTEXT24,_GetInst()}}
oDCtheFixedText24:HyperLabel := HyperLabel{#theFixedText24,"Quantidade/Horas",NULL_STRING,NULL_STRING}

oDCQTE02 := SingleLineEdit{self,ResourceID{TABCNQEXT_QTE02,_GetInst()}}
oDCQTE02:FieldSpec := padrao_num_09_2{}
oDCQTE02:HyperLabel := HyperLabel{#QTE02,"Qte02:",NULL_STRING,"ACPNC_QTE02"}

oDCQTE03 := SingleLineEdit{self,ResourceID{TABCNQEXT_QTE03,_GetInst()}}
oDCQTE03:FieldSpec := padrao_num_09_2{}
oDCQTE03:HyperLabel := HyperLabel{#QTE03,"Qte03:",NULL_STRING,"ACPNC_QTE03"}

oDCQTE04 := SingleLineEdit{self,ResourceID{TABCNQEXT_QTE04,_GetInst()}}
oDCQTE04:FieldSpec := padrao_num_09_2{}
oDCQTE04:HyperLabel := HyperLabel{#QTE04,"Qte04:",NULL_STRING,"ACPNC_QTE04"}

oDCQTE05 := SingleLineEdit{self,ResourceID{TABCNQEXT_QTE05,_GetInst()}}
oDCQTE05:FieldSpec := padrao_num_09_2{}
oDCQTE05:HyperLabel := HyperLabel{#QTE05,"Qte05:",NULL_STRING,"ACPNC_QTE05"}

oDCQTE06 := SingleLineEdit{self,ResourceID{TABCNQEXT_QTE06,_GetInst()}}
oDCQTE06:FieldSpec := padrao_num_09_2{}
oDCQTE06:HyperLabel := HyperLabel{#QTE06,"Sucatas",NULL_STRING,"ACPNC_QTE06"}

oDCQTE07 := SingleLineEdit{self,ResourceID{TABCNQEXT_QTE07,_GetInst()}}
oDCQTE07:FieldSpec := padrao_num_09_2{}
oDCQTE07:HyperLabel := HyperLabel{#QTE07,"Qte07:",NULL_STRING,"ACPNC_QTE07"}

oDCQTE08 := SingleLineEdit{self,ResourceID{TABCNQEXT_QTE08,_GetInst()}}
oDCQTE08:FieldSpec := padrao_num_09_2{}
oDCQTE08:HyperLabel := HyperLabel{#QTE08,"Qte08:",NULL_STRING,"ACPNC_QTE08"}

oDCVLE01 := SingleLineEdit{self,ResourceID{TABCNQEXT_VLE01,_GetInst()}}
oDCVLE01:FieldSpec := padrao_num_12_2{}
oDCVLE01:HyperLabel := HyperLabel{#VLE01,"Vle01:",NULL_STRING,"ACPNC_VLE01"}

oDCVLE02 := SingleLineEdit{self,ResourceID{TABCNQEXT_VLE02,_GetInst()}}
oDCVLE02:FieldSpec := padrao_num_12_2{}
oDCVLE02:HyperLabel := HyperLabel{#VLE02,"Vle02:",NULL_STRING,"ACPNC_VLE02"}

oDCVLE03 := SingleLineEdit{self,ResourceID{TABCNQEXT_VLE03,_GetInst()}}
oDCVLE03:FieldSpec := padrao_num_12_2{}
oDCVLE03:HyperLabel := HyperLabel{#VLE03,"Vle03:",NULL_STRING,"ACPNC_VLE03"}

oDCVLE04 := SingleLineEdit{self,ResourceID{TABCNQEXT_VLE04,_GetInst()}}
oDCVLE04:FieldSpec := padrao_num_12_2{}
oDCVLE04:HyperLabel := HyperLabel{#VLE04,"Vle04:",NULL_STRING,"ACPNC_VLE04"}

oDCVLE05 := SingleLineEdit{self,ResourceID{TABCNQEXT_VLE05,_GetInst()}}
oDCVLE05:HyperLabel := HyperLabel{#VLE05,"Vle05:",NULL_STRING,"ACPNC_VLE05"}
oDCVLE05:FieldSpec := padrao_num_12_2{}

oDCVLE06 := SingleLineEdit{self,ResourceID{TABCNQEXT_VLE06,_GetInst()}}
oDCVLE06:FieldSpec := padrao_num_12_2{}
oDCVLE06:HyperLabel := HyperLabel{#VLE06,"Vle06:",NULL_STRING,"ACPNC_VLE06"}

oDCVLE07 := SingleLineEdit{self,ResourceID{TABCNQEXT_VLE07,_GetInst()}}
oDCVLE07:FieldSpec := padrao_num_12_2{}
oDCVLE07:HyperLabel := HyperLabel{#VLE07,"Vle07:",NULL_STRING,"ACPNC_VLE07"}

oDCVLE08 := SingleLineEdit{self,ResourceID{TABCNQEXT_VLE08,_GetInst()}}
oDCVLE08:FieldSpec := padrao_num_12_2{}
oDCVLE08:HyperLabel := HyperLabel{#VLE08,"Vle08:",NULL_STRING,"ACPNC_VLE08"}

oDCSC_QTE03 := FixedText{self,ResourceID{TABCNQEXT_SC_QTE03,_GetInst()}}
oDCSC_QTE03:HyperLabel := HyperLabel{#SC_QTE03,"Material Usado Retrabalho",NULL_STRING,NULL_STRING}

oDCSC_QTE02 := FixedText{self,ResourceID{TABCNQEXT_SC_QTE02,_GetInst()}}
oDCSC_QTE02:HyperLabel := HyperLabel{#SC_QTE02,"Seleçao Retrabalho Cliente ",NULL_STRING,NULL_STRING}

oDCSC_QTE04 := FixedText{self,ResourceID{TABCNQEXT_SC_QTE04,_GetInst()}}
oDCSC_QTE04:HyperLabel := HyperLabel{#SC_QTE04,"Transp.Alim.Hospe.",NULL_STRING,NULL_STRING}

oDCSC_QTE05 := FixedText{self,ResourceID{TABCNQEXT_SC_QTE05,_GetInst()}}
oDCSC_QTE05:HyperLabel := HyperLabel{#SC_QTE05,"Analise de Devoluçao",NULL_STRING,NULL_STRING}

oDCSC_QTE06 := FixedText{self,ResourceID{TABCNQEXT_SC_QTE06,_GetInst()}}
oDCSC_QTE06:HyperLabel := HyperLabel{#SC_QTE06,"Seleçao",NULL_STRING,NULL_STRING}

oDCSC_QTE07 := FixedText{self,ResourceID{TABCNQEXT_SC_QTE07,_GetInst()}}
oDCSC_QTE07:HyperLabel := HyperLabel{#SC_QTE07,"Sucatas",NULL_STRING,NULL_STRING}

oDCtheFixedText18 := FixedText{self,ResourceID{TABCNQEXT_THEFIXEDTEXT18,_GetInst()}}
oDCtheFixedText18:HyperLabel := HyperLabel{#theFixedText18,"Outros",NULL_STRING,NULL_STRING}

oDCVLE09 := SingleLineEdit{self,ResourceID{TABCNQEXT_VLE09,_GetInst()}}
oDCVLE09:FieldSpec := padrao_num_12_2{}
oDCVLE09:HyperLabel := HyperLabel{#VLE09,"Vle07:",NULL_STRING,"ACPNC_VLE07"}

oDCQTE09 := SingleLineEdit{self,ResourceID{TABCNQEXT_QTE09,_GetInst()}}
oDCQTE09:FieldSpec := padrao_num_09_2{}
oDCQTE09:HyperLabel := HyperLabel{#QTE09,"Qte07:",NULL_STRING,"ACPNC_QTE07"}

oDCSC_QTE8 := FixedText{self,ResourceID{TABCNQEXT_SC_QTE8,_GetInst()}}
oDCSC_QTE8:HyperLabel := HyperLabel{#SC_QTE8,"Retrabalho Hora Homem",NULL_STRING,NULL_STRING}

oDCVLE11 := SingleLineEdit{self,ResourceID{TABCNQEXT_VLE11,_GetInst()}}
oDCVLE11:FieldSpec := padrao_num_12_2{}
oDCVLE11:HyperLabel := HyperLabel{#VLE11,"Vli03:",NULL_STRING,"ACPNC_VLI04"}

oDCQTE11 := SingleLineEdit{self,ResourceID{TABCNQEXT_QTE11,_GetInst()}}
oDCQTE11:FieldSpec := padrao_num_09_2{}
oDCQTE11:HyperLabel := HyperLabel{#QTE11,"Qti04:",NULL_STRING,"ACPNC_QTI04"}

oDCSC_QTI04 := FixedText{self,ResourceID{TABCNQEXT_SC_QTI04,_GetInst()}}
oDCSC_QTI04:HyperLabel := HyperLabel{#SC_QTI04,"Reinspeção",NULL_STRING,NULL_STRING}

oDCVLE10 := SingleLineEdit{self,ResourceID{TABCNQEXT_VLE10,_GetInst()}}
oDCVLE10:FieldSpec := padrao_num_12_2{}
oDCVLE10:HyperLabel := HyperLabel{#VLE10,"Vli03:",NULL_STRING,"ACPNC_VLI03"}

oDCQTE10 := SingleLineEdit{self,ResourceID{TABCNQEXT_QTE10,_GetInst()}}
oDCQTE10:FieldSpec := padrao_num_09_2{}
oDCQTE10:HyperLabel := HyperLabel{#QTE10,"Qti03:",NULL_STRING,"ACPNC_QTI03"}

oDCSC_QTI03 := FixedText{self,ResourceID{TABCNQEXT_SC_QTI03,_GetInst()}}
oDCSC_QTI03:HyperLabel := HyperLabel{#SC_QTI03,"Retrabalho Máquina",NULL_STRING,NULL_STRING}

oDCPCVALEXT := SingleLineEdit{self,ResourceID{TABCNQEXT_PCVALEXT,_GetInst()}}
oDCPCVALEXT:FieldSpec := padrao_num_10_4{}
oDCPCVALEXT:HyperLabel := HyperLabel{#PCVALEXT,"Pcvalint:",NULL_STRING,"ACPNC_PCVALINT"}

oDCSC_QTI6 := FixedText{self,ResourceID{TABCNQEXT_SC_QTI6,_GetInst()}}
oDCSC_QTI6:HyperLabel := HyperLabel{#SC_QTI6,"Preco Peça",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#TABCNQEXT,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PCVALEXT() 
return self:FieldGet(#PCVALEXT)


assign PCVALEXT(uValue) 
self:FieldPut(#PCVALEXT, uValue)
return PCVALEXT := uValue


access QTE01() 
return self:FieldGet(#QTE01)


assign QTE01(uValue) 
self:FieldPut(#QTE01, uValue)
return QTE01 := uValue


access QTE02() 
return self:FieldGet(#QTE02)


assign QTE02(uValue) 
self:FieldPut(#QTE02, uValue)
return QTE02 := uValue


access QTE03() 
return self:FieldGet(#QTE03)


assign QTE03(uValue) 
self:FieldPut(#QTE03, uValue)
return QTE03 := uValue


access QTE04() 
return self:FieldGet(#QTE04)


assign QTE04(uValue) 
self:FieldPut(#QTE04, uValue)
return QTE04 := uValue


access QTE05() 
return self:FieldGet(#QTE05)


assign QTE05(uValue) 
self:FieldPut(#QTE05, uValue)
return QTE05 := uValue


access QTE06() 
return self:FieldGet(#QTE06)


assign QTE06(uValue) 
self:FieldPut(#QTE06, uValue)
return QTE06 := uValue


access QTE07() 
return self:FieldGet(#QTE07)


assign QTE07(uValue) 
self:FieldPut(#QTE07, uValue)
return QTE07 := uValue


access QTE08() 
return self:FieldGet(#QTE08)


assign QTE08(uValue) 
self:FieldPut(#QTE08, uValue)
return QTE08 := uValue


access QTE09() 
return self:FieldGet(#QTE09)


assign QTE09(uValue) 
self:FieldPut(#QTE09, uValue)
return QTE09 := uValue


access QTE10() 
return self:FieldGet(#QTE10)


assign QTE10(uValue) 
self:FieldPut(#QTE10, uValue)
return QTE10 := uValue


access QTE11() 
return self:FieldGet(#QTE11)


assign QTE11(uValue) 
self:FieldPut(#QTE11, uValue)
return QTE11 := uValue


access VLE01() 
return self:FieldGet(#VLE01)


assign VLE01(uValue) 
self:FieldPut(#VLE01, uValue)
return VLE01 := uValue


access VLE02() 
return self:FieldGet(#VLE02)


assign VLE02(uValue) 
self:FieldPut(#VLE02, uValue)
return VLE02 := uValue


access VLE03() 
return self:FieldGet(#VLE03)


assign VLE03(uValue) 
self:FieldPut(#VLE03, uValue)
return VLE03 := uValue


access VLE04() 
return self:FieldGet(#VLE04)


assign VLE04(uValue) 
self:FieldPut(#VLE04, uValue)
return VLE04 := uValue


access VLE05() 
return self:FieldGet(#VLE05)


assign VLE05(uValue) 
self:FieldPut(#VLE05, uValue)
return VLE05 := uValue


access VLE06() 
return self:FieldGet(#VLE06)


assign VLE06(uValue) 
self:FieldPut(#VLE06, uValue)
return VLE06 := uValue


access VLE07() 
return self:FieldGet(#VLE07)


assign VLE07(uValue) 
self:FieldPut(#VLE07, uValue)
return VLE07 := uValue


access VLE08() 
return self:FieldGet(#VLE08)


assign VLE08(uValue) 
self:FieldPut(#VLE08, uValue)
return VLE08 := uValue


access VLE09() 
return self:FieldGet(#VLE09)


assign VLE09(uValue) 
self:FieldPut(#VLE09, uValue)
return VLE09 := uValue


access VLE10() 
return self:FieldGet(#VLE10)


assign VLE10(uValue) 
self:FieldPut(#VLE10, uValue)
return VLE10 := uValue


access VLE11() 
return self:FieldGet(#VLE11)


assign VLE11(uValue) 
self:FieldPut(#VLE11, uValue)
return VLE11 := uValue


END CLASS
class TABCNQINT inherit DATAWINDOW 

	protect oDCVLI06 as SINGLELINEEDIT
	protect oDCQTI06 as SINGLELINEEDIT
	protect oDCtheFixedText19 as FIXEDTEXT
	protect oDCPCVALINT as SINGLELINEEDIT
	protect oDCSC_QTI6 as FIXEDTEXT
	protect oDCVLI05 as SINGLELINEEDIT
	protect oDCQTI05 as SINGLELINEEDIT
	protect oDCSC_QTI05 as FIXEDTEXT
	protect oDCVLI04 as SINGLELINEEDIT
	protect oDCQTI04 as SINGLELINEEDIT
	protect oDCSC_QTI04 as FIXEDTEXT
	protect oDCVLI03 as SINGLELINEEDIT
	protect oDCQTI03 as SINGLELINEEDIT
	protect oDCSC_QTI03 as FIXEDTEXT
	protect oDCVLI02 as SINGLELINEEDIT
	protect oDCQTI02 as SINGLELINEEDIT
	protect oDCSC_QTI02 as FIXEDTEXT
	protect oDCVLI01 as SINGLELINEEDIT
	protect oDCQTI01 as SINGLELINEEDIT
	protect oDCSC_QTI01 as FIXEDTEXT
// 	instance VLI06 
// 	instance QTI06 
// 	instance PCVALINT 
// 	instance VLI05 
// 	instance QTI05 
// 	instance VLI04 
// 	instance QTI04 
// 	instance VLI03 
// 	instance QTI03 
// 	instance VLI02 
// 	instance QTI02 
// 	instance VLI01 
// 	instance QTI01 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"TABCNQINT",_GetInst()},iCtlID)

oDCVLI06 := SingleLineEdit{self,ResourceID{TABCNQINT_VLI06,_GetInst()}}
oDCVLI06:FieldSpec := padrao_num_12_2{}
oDCVLI06:HyperLabel := HyperLabel{#VLI06,"Vli06:",NULL_STRING,"ACPNC_VLI06"}

oDCQTI06 := SingleLineEdit{self,ResourceID{TABCNQINT_QTI06,_GetInst()}}
oDCQTI06:FieldSpec := padrao_num_09_2{}
oDCQTI06:HyperLabel := HyperLabel{#QTI06,"Qti06:",NULL_STRING,"ACPNC_QTI06"}

oDCtheFixedText19 := FixedText{self,ResourceID{TABCNQINT_THEFIXEDTEXT19,_GetInst()}}
oDCtheFixedText19:HyperLabel := HyperLabel{#theFixedText19,"Outros",NULL_STRING,NULL_STRING}

oDCPCVALINT := SingleLineEdit{self,ResourceID{TABCNQINT_PCVALINT,_GetInst()}}
oDCPCVALINT:FieldSpec := padrao_num_10_4{}
oDCPCVALINT:HyperLabel := HyperLabel{#PCVALINT,"Pcvalint:",NULL_STRING,"ACPNC_PCVALINT"}

oDCSC_QTI6 := FixedText{self,ResourceID{TABCNQINT_SC_QTI6,_GetInst()}}
oDCSC_QTI6:HyperLabel := HyperLabel{#SC_QTI6,"Preco Peça",NULL_STRING,NULL_STRING}

oDCVLI05 := SingleLineEdit{self,ResourceID{TABCNQINT_VLI05,_GetInst()}}
oDCVLI05:FieldSpec := padrao_num_12_2{}
oDCVLI05:HyperLabel := HyperLabel{#VLI05,"Vli05:",NULL_STRING,"ACPNC_VLI05"}

oDCQTI05 := SingleLineEdit{self,ResourceID{TABCNQINT_QTI05,_GetInst()}}
oDCQTI05:FieldSpec := padrao_num_09_2{}
oDCQTI05:HyperLabel := HyperLabel{#QTI05,"Qti05:",NULL_STRING,"ACPNC_QTI05"}

oDCSC_QTI05 := FixedText{self,ResourceID{TABCNQINT_SC_QTI05,_GetInst()}}
oDCSC_QTI05:HyperLabel := HyperLabel{#SC_QTI05,"Sucata",NULL_STRING,NULL_STRING}

oDCVLI04 := SingleLineEdit{self,ResourceID{TABCNQINT_VLI04,_GetInst()}}
oDCVLI04:FieldSpec := padrao_num_12_2{}
oDCVLI04:HyperLabel := HyperLabel{#VLI04,"Vli04:",NULL_STRING,"ACPNC_VLI04"}

oDCQTI04 := SingleLineEdit{self,ResourceID{TABCNQINT_QTI04,_GetInst()}}
oDCQTI04:FieldSpec := padrao_num_09_2{}
oDCQTI04:HyperLabel := HyperLabel{#QTI04,"Qti04:",NULL_STRING,"ACPNC_QTI04"}

oDCSC_QTI04 := FixedText{self,ResourceID{TABCNQINT_SC_QTI04,_GetInst()}}
oDCSC_QTI04:HyperLabel := HyperLabel{#SC_QTI04,"Reinspeção",NULL_STRING,NULL_STRING}

oDCVLI03 := SingleLineEdit{self,ResourceID{TABCNQINT_VLI03,_GetInst()}}
oDCVLI03:FieldSpec := padrao_num_12_2{}
oDCVLI03:HyperLabel := HyperLabel{#VLI03,"Vli03:",NULL_STRING,"ACPNC_VLI03"}

oDCQTI03 := SingleLineEdit{self,ResourceID{TABCNQINT_QTI03,_GetInst()}}
oDCQTI03:FieldSpec := padrao_num_09_2{}
oDCQTI03:HyperLabel := HyperLabel{#QTI03,"Qti03:",NULL_STRING,"ACPNC_QTI03"}

oDCSC_QTI03 := FixedText{self,ResourceID{TABCNQINT_SC_QTI03,_GetInst()}}
oDCSC_QTI03:HyperLabel := HyperLabel{#SC_QTI03,"Retrabalho Máquina",NULL_STRING,NULL_STRING}

oDCVLI02 := SingleLineEdit{self,ResourceID{TABCNQINT_VLI02,_GetInst()}}
oDCVLI02:FieldSpec := padrao_num_12_2{}
oDCVLI02:HyperLabel := HyperLabel{#VLI02,"Vli02:",NULL_STRING,"ACPNC_VLI02"}

oDCQTI02 := SingleLineEdit{self,ResourceID{TABCNQINT_QTI02,_GetInst()}}
oDCQTI02:FieldSpec := padrao_num_09_2{}
oDCQTI02:HyperLabel := HyperLabel{#QTI02,"Qti02:",NULL_STRING,"ACPNC_QTI02"}

oDCSC_QTI02 := FixedText{self,ResourceID{TABCNQINT_SC_QTI02,_GetInst()}}
oDCSC_QTI02:HyperLabel := HyperLabel{#SC_QTI02,"Retrabalho Homem",NULL_STRING,NULL_STRING}

oDCVLI01 := SingleLineEdit{self,ResourceID{TABCNQINT_VLI01,_GetInst()}}
oDCVLI01:HyperLabel := HyperLabel{#VLI01,"DataWindow Caption",NULL_STRING,"ACPNC_VLI01"}
oDCVLI01:FieldSpec := padrao_num_12_2{}

oDCQTI01 := SingleLineEdit{self,ResourceID{TABCNQINT_QTI01,_GetInst()}}
oDCQTI01:FieldSpec := padrao_num_09_2{}
oDCQTI01:HyperLabel := HyperLabel{#QTI01,"Qti01:",NULL_STRING,"ACPNC_QTI01"}

oDCSC_QTI01 := FixedText{self,ResourceID{TABCNQINT_SC_QTI01,_GetInst()}}
oDCSC_QTI01:HyperLabel := HyperLabel{#SC_QTI01,"Seleção",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#TABCNQINT,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PCVALINT() 
return self:FieldGet(#PCVALINT)


assign PCVALINT(uValue) 
self:FieldPut(#PCVALINT, uValue)
return PCVALINT := uValue


access QTI01() 
return self:FieldGet(#QTI01)


assign QTI01(uValue) 
self:FieldPut(#QTI01, uValue)
return QTI01 := uValue


access QTI02() 
return self:FieldGet(#QTI02)


assign QTI02(uValue) 
self:FieldPut(#QTI02, uValue)
return QTI02 := uValue


access QTI03() 
return self:FieldGet(#QTI03)


assign QTI03(uValue) 
self:FieldPut(#QTI03, uValue)
return QTI03 := uValue


access QTI04() 
return self:FieldGet(#QTI04)


assign QTI04(uValue) 
self:FieldPut(#QTI04, uValue)
return QTI04 := uValue


access QTI05() 
return self:FieldGet(#QTI05)


assign QTI05(uValue) 
self:FieldPut(#QTI05, uValue)
return QTI05 := uValue


access QTI06() 
return self:FieldGet(#QTI06)


assign QTI06(uValue) 
self:FieldPut(#QTI06, uValue)
return QTI06 := uValue


access VLI01() 
return self:FieldGet(#VLI01)


assign VLI01(uValue) 
self:FieldPut(#VLI01, uValue)
return VLI01 := uValue


access VLI02() 
return self:FieldGet(#VLI02)


assign VLI02(uValue) 
self:FieldPut(#VLI02, uValue)
return VLI02 := uValue


access VLI03() 
return self:FieldGet(#VLI03)


assign VLI03(uValue) 
self:FieldPut(#VLI03, uValue)
return VLI03 := uValue


access VLI04() 
return self:FieldGet(#VLI04)


assign VLI04(uValue) 
self:FieldPut(#VLI04, uValue)
return VLI04 := uValue


access VLI05() 
return self:FieldGet(#VLI05)


assign VLI05(uValue) 
self:FieldPut(#VLI05, uValue)
return VLI05 := uValue


access VLI06() 
return self:FieldGet(#VLI06)


assign VLI06(uValue) 
self:FieldPut(#VLI06, uValue)
return VLI06 := uValue


END CLASS
