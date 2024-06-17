#region DEFINES
STATIC DEFINE JCRMAR_AR := 126 
STATIC DEFINE JCRMAR_BUSCACURSO := 135 
STATIC DEFINE JCRMAR_CODFORN := 130 
STATIC DEFINE JCRMAR_CODIGO := 116 
STATIC DEFINE JCRMAR_CODIGOINT := 132 
STATIC DEFINE JCRMAR_COGNOME := 124 
STATIC DEFINE JCRMAR_CRM := 125 
STATIC DEFINE JCRMAR_DATA := 120 
STATIC DEFINE JCRMAR_EMPRESA := 131 
STATIC DEFINE JCRMAR_FORNECEDO := 123 
STATIC DEFINE JCRMAR_ITEM := 127 
STATIC DEFINE JCRMAR_NOME := 118 
STATIC DEFINE JCRMAR_NRNOTA := 119 
STATIC DEFINE JCRMAR_PORCURSO := 134 
STATIC DEFINE JCRMAR_PUSHBUTTON2 := 136 
STATIC DEFINE JCRMAR_QTDE := 121 
STATIC DEFINE JCRMAR_RIRM := 128 
STATIC DEFINE JCRMAR_RIST := 129 
STATIC DEFINE JCRMAR_SC_AR := 110 
STATIC DEFINE JCRMAR_SC_CODIGO := 101 
STATIC DEFINE JCRMAR_SC_CODIGOINT := 114 
STATIC DEFINE JCRMAR_SC_CRM := 109 
STATIC DEFINE JCRMAR_SC_DATA := 105 
STATIC DEFINE JCRMAR_SC_EMPRESA := 113 
STATIC DEFINE JCRMAR_SC_FORNECEDO := 108 
STATIC DEFINE JCRMAR_SC_FORNECEDO1 := 133 
STATIC DEFINE JCRMAR_SC_NOME := 103 
STATIC DEFINE JCRMAR_SC_NRNOTA := 104 
STATIC DEFINE JCRMAR_SC_QTDE := 106 
STATIC DEFINE JCRMAR_SC_RIRM := 111 
STATIC DEFINE JCRMAR_SC_RIST := 112 
STATIC DEFINE JCRMAR_SC_TIPOCLI := 107 
STATIC DEFINE JCRMAR_SC_TIPOENT := 100 
STATIC DEFINE JCRMAR_SC_UNIDADE := 102 
STATIC DEFINE JCRMAR_TIPOCLI := 122 
STATIC DEFINE JCRMAR_TIPOENT := 115 
STATIC DEFINE JCRMAR_UNIDADE := 117 
#endregion

class jcrmar inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNRNOTA as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBQTDE as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBCRM as DataColumn
	PROTECT oDBRIRM as DataColumn
	PROTECT oDBRIST as DataColumn
	PROTECT oDBAR as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBCODIGOINT as DataColumn
	protect oDCSC_TIPOENT as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_UNIDADE as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_NRNOTA as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCSC_TIPOCLI as FIXEDTEXT
	protect oDCSC_FORNECEDO as FIXEDTEXT
	protect oDCSC_CRM as FIXEDTEXT
	protect oDCSC_AR as FIXEDTEXT
	protect oDCSC_RIRM as FIXEDTEXT
	protect oDCSC_RIST as FIXEDTEXT
	protect oDCSC_EMPRESA as FIXEDTEXT
	protect oDCSC_CODIGOINT as FIXEDTEXT
	protect oDCTIPOENT as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCUNIDADE as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCNRNOTA as SINGLELINEEDIT
	protect oDCDATA as SINGLELINEEDIT
	protect oDCQTDE as SINGLELINEEDIT
	protect oDCTIPOCLI as SINGLELINEEDIT
	protect oDCFORNECEDO as SINGLELINEEDIT
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCCRM as SINGLELINEEDIT
	protect oDCAR as SINGLELINEEDIT
	protect oDCITEM as SINGLELINEEDIT
	protect oDCRIRM as SINGLELINEEDIT
	protect oDCRIST as SINGLELINEEDIT
	protect oDCCODFORN as SINGLELINEEDIT
	protect oDCEMPRESA as SINGLELINEEDIT
	protect oDCCODIGOINT as SINGLELINEEDIT
	protect oDCSC_FORNECEDO1 as FIXEDTEXT
	protect oCCporcurso as PUSHBUTTON
	protect oCCbuscacurso as PUSHBUTTON
	protect oCCPushButton2 as PUSHBUTTON
// 	instance TIPOENT 
// 	instance CODIGO 
// 	instance UNIDADE 
// 	instance NOME 
// 	instance NRNOTA 
// 	instance DATA 
// 	instance QTDE 
// 	instance TIPOCLI 
// 	instance FORNECEDO 
// 	instance COGNOME 
// 	instance CRM 
// 	instance AR 
// 	instance ITEM 
// 	instance RIRM 
// 	instance RIST 
// 	instance CODFORN 
// 	instance EMPRESA 
// 	instance CODIGOINT 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AR() 
return self:FieldGet(#AR)


assign AR(uValue) 
self:FieldPut(#AR, uValue)
return AR := uValue


access CODFORN() 
return self:FieldGet(#CODFORN)


assign CODFORN(uValue) 
self:FieldPut(#CODFORN, uValue)
return CODFORN := uValue


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


access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


access CRM() 
return self:FieldGet(#CRM)


assign CRM(uValue) 
self:FieldPut(#CRM, uValue)
return CRM := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access EMPRESA() 
return self:FieldGet(#EMPRESA)


assign EMPRESA(uValue) 
self:FieldPut(#EMPRESA, uValue)
return EMPRESA := uValue


access FORNECEDO() 
return self:FieldGet(#FORNECEDO)


assign FORNECEDO(uValue) 
self:FieldPut(#FORNECEDO, uValue)
return FORNECEDO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcrmar",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_TIPOENT := FixedText{self,ResourceID{JCRMAR_SC_TIPOENT,_GetInst()}}
oDCSC_TIPOENT:HyperLabel := HyperLabel{#SC_TIPOENT,"Tipoent:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JCRMAR_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_UNIDADE := FixedText{self,ResourceID{JCRMAR_SC_UNIDADE,_GetInst()}}
oDCSC_UNIDADE:HyperLabel := HyperLabel{#SC_UNIDADE,"Unidade:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JCRMAR_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_NRNOTA := FixedText{self,ResourceID{JCRMAR_SC_NRNOTA,_GetInst()}}
oDCSC_NRNOTA:HyperLabel := HyperLabel{#SC_NRNOTA,"Nrnota:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JCRMAR_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{self,ResourceID{JCRMAR_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCSC_TIPOCLI := FixedText{self,ResourceID{JCRMAR_SC_TIPOCLI,_GetInst()}}
oDCSC_TIPOCLI:HyperLabel := HyperLabel{#SC_TIPOCLI,"Tipocli:",NULL_STRING,NULL_STRING}

oDCSC_FORNECEDO := FixedText{self,ResourceID{JCRMAR_SC_FORNECEDO,_GetInst()}}
oDCSC_FORNECEDO:HyperLabel := HyperLabel{#SC_FORNECEDO,"Fornecedo:",NULL_STRING,NULL_STRING}

oDCSC_CRM := FixedText{self,ResourceID{JCRMAR_SC_CRM,_GetInst()}}
oDCSC_CRM:HyperLabel := HyperLabel{#SC_CRM,"Crm:",NULL_STRING,NULL_STRING}

oDCSC_AR := FixedText{self,ResourceID{JCRMAR_SC_AR,_GetInst()}}
oDCSC_AR:HyperLabel := HyperLabel{#SC_AR,"Ar:",NULL_STRING,NULL_STRING}

oDCSC_RIRM := FixedText{self,ResourceID{JCRMAR_SC_RIRM,_GetInst()}}
oDCSC_RIRM:HyperLabel := HyperLabel{#SC_RIRM,"Rirm:",NULL_STRING,NULL_STRING}

oDCSC_RIST := FixedText{self,ResourceID{JCRMAR_SC_RIST,_GetInst()}}
oDCSC_RIST:HyperLabel := HyperLabel{#SC_RIST,"Rist:",NULL_STRING,NULL_STRING}

oDCSC_EMPRESA := FixedText{self,ResourceID{JCRMAR_SC_EMPRESA,_GetInst()}}
oDCSC_EMPRESA:HyperLabel := HyperLabel{#SC_EMPRESA,"Empresa:",NULL_STRING,NULL_STRING}

oDCSC_CODIGOINT := FixedText{self,ResourceID{JCRMAR_SC_CODIGOINT,_GetInst()}}
oDCSC_CODIGOINT:HyperLabel := HyperLabel{#SC_CODIGOINT,"Codigoint:",NULL_STRING,NULL_STRING}

oDCTIPOENT := SingleLineEdit{self,ResourceID{JCRMAR_TIPOENT,_GetInst()}}
oDCTIPOENT:FieldSpec := padrao_char_01{}
oDCTIPOENT:HyperLabel := HyperLabel{#TIPOENT,"Tipoent:",NULL_STRING,"CRMAR_TIPOENT"}
oDCTIPOENT:Font(aFonts[1], FALSE)
oDCTIPOENT:BackGround := aBrushes[1]

oDCCODIGO := SingleLineEdit{self,ResourceID{JCRMAR_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"CRMAR_CODIGO"}
oDCCODIGO:Font(aFonts[1], FALSE)
oDCCODIGO:BackGround := aBrushes[1]

oDCUNIDADE := SingleLineEdit{self,ResourceID{JCRMAR_UNIDADE,_GetInst()}}
oDCUNIDADE:FieldSpec := padrao_char_02{}
oDCUNIDADE:HyperLabel := HyperLabel{#UNIDADE,"Unidade:",NULL_STRING,"CRMAR_UNIDADE"}
oDCUNIDADE:Font(aFonts[1], FALSE)
oDCUNIDADE:BackGround := aBrushes[1]

oDCNOME := SingleLineEdit{self,ResourceID{JCRMAR_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_100{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"CRMAR_NOME"}
oDCNOME:Font(aFonts[1], FALSE)
oDCNOME:BackGround := aBrushes[1]

oDCNRNOTA := SingleLineEdit{self,ResourceID{JCRMAR_NRNOTA,_GetInst()}}
oDCNRNOTA:FieldSpec := padrao_num_08{}
oDCNRNOTA:HyperLabel := HyperLabel{#NRNOTA,"Nrnota:",NULL_STRING,"CRMAR_NRNOTA"}
oDCNRNOTA:Font(aFonts[1], FALSE)
oDCNRNOTA:BackGround := aBrushes[1]

oDCDATA := SingleLineEdit{self,ResourceID{JCRMAR_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"CRMAR_DATA"}
oDCDATA:Font(aFonts[1], FALSE)
oDCDATA:BackGround := aBrushes[1]

oDCQTDE := SingleLineEdit{self,ResourceID{JCRMAR_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := padrao_num_08{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"CRMAR_QTDE"}
oDCQTDE:Font(aFonts[1], FALSE)
oDCQTDE:BackGround := aBrushes[1]

oDCTIPOCLI := SingleLineEdit{self,ResourceID{JCRMAR_TIPOCLI,_GetInst()}}
oDCTIPOCLI:FieldSpec := padrao_char_01{}
oDCTIPOCLI:HyperLabel := HyperLabel{#TIPOCLI,"Tipocli:",NULL_STRING,"CRMAR_TIPOCLI"}
oDCTIPOCLI:Font(aFonts[1], FALSE)
oDCTIPOCLI:BackGround := aBrushes[1]

oDCFORNECEDO := SingleLineEdit{self,ResourceID{JCRMAR_FORNECEDO,_GetInst()}}
oDCFORNECEDO:FieldSpec := padrao_num_08{}
oDCFORNECEDO:HyperLabel := HyperLabel{#FORNECEDO,"Fornecedo:",NULL_STRING,"CRMAR_FORNECEDO"}
oDCFORNECEDO:Font(aFonts[1], FALSE)
oDCFORNECEDO:BackGround := aBrushes[1]

oDCCOGNOME := SingleLineEdit{self,ResourceID{JCRMAR_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := padrao_char_20{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"CRMAR_COGNOME"}
oDCCOGNOME:Font(aFonts[1], FALSE)
oDCCOGNOME:BackGround := aBrushes[1]

oDCCRM := SingleLineEdit{self,ResourceID{JCRMAR_CRM,_GetInst()}}
oDCCRM:FieldSpec := padrao_num_08{}
oDCCRM:HyperLabel := HyperLabel{#CRM,"Crm:",NULL_STRING,"CRMAR_CRM"}
oDCCRM:Font(aFonts[1], FALSE)
oDCCRM:BackGround := aBrushes[1]

oDCAR := SingleLineEdit{self,ResourceID{JCRMAR_AR,_GetInst()}}
oDCAR:FieldSpec := padrao_num_08{}
oDCAR:HyperLabel := HyperLabel{#AR,"Ar:",NULL_STRING,"CRMAR_AR"}
oDCAR:Font(aFonts[1], FALSE)
oDCAR:BackGround := aBrushes[1]

oDCITEM := SingleLineEdit{self,ResourceID{JCRMAR_ITEM,_GetInst()}}
oDCITEM:FieldSpec := padrao_num_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"CRMAR_ITEM"}
oDCITEM:Font(aFonts[1], FALSE)
oDCITEM:BackGround := aBrushes[1]

oDCRIRM := SingleLineEdit{self,ResourceID{JCRMAR_RIRM,_GetInst()}}
oDCRIRM:FieldSpec := padrao_num_08{}
oDCRIRM:HyperLabel := HyperLabel{#RIRM,"Rirm:",NULL_STRING,"CRMAR_RIRM"}
oDCRIRM:Font(aFonts[1], FALSE)
oDCRIRM:BackGround := aBrushes[1]

oDCRIST := SingleLineEdit{self,ResourceID{JCRMAR_RIST,_GetInst()}}
oDCRIST:FieldSpec := padrao_num_08{}
oDCRIST:HyperLabel := HyperLabel{#RIST,"Rist:",NULL_STRING,"CRMAR_RIST"}
oDCRIST:Font(aFonts[1], FALSE)
oDCRIST:BackGround := aBrushes[1]

oDCCODFORN := SingleLineEdit{self,ResourceID{JCRMAR_CODFORN,_GetInst()}}
oDCCODFORN:FieldSpec := padrao_char_20{}
oDCCODFORN:HyperLabel := HyperLabel{#CODFORN,"Codforn:",NULL_STRING,"CRMAR_CODFORN"}
oDCCODFORN:Font(aFonts[1], FALSE)
oDCCODFORN:BackGround := aBrushes[1]

oDCEMPRESA := SingleLineEdit{self,ResourceID{JCRMAR_EMPRESA,_GetInst()}}
oDCEMPRESA:FieldSpec := padrao_char_02{}
oDCEMPRESA:HyperLabel := HyperLabel{#EMPRESA,"Empresa:",NULL_STRING,"CRMAR_EMPRESA"}
oDCEMPRESA:Font(aFonts[1], FALSE)
oDCEMPRESA:BackGround := aBrushes[1]

oDCCODIGOINT := SingleLineEdit{self,ResourceID{JCRMAR_CODIGOINT,_GetInst()}}
oDCCODIGOINT:FieldSpec := padrao_char_24{}
oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT,"Codigoint:",NULL_STRING,"CRMAR_CODIGOINT"}
oDCCODIGOINT:Font(aFonts[1], FALSE)
oDCCODIGOINT:BackGround := aBrushes[1]

oDCSC_FORNECEDO1 := FixedText{self,ResourceID{JCRMAR_SC_FORNECEDO1,_GetInst()}}
oDCSC_FORNECEDO1:HyperLabel := HyperLabel{#SC_FORNECEDO1,"Fornecedo:",NULL_STRING,NULL_STRING}

oCCporcurso := PushButton{self,ResourceID{JCRMAR_PORCURSO,_GetInst()}}
oCCporcurso:Image := ico_az{}
oCCporcurso:HyperLabel := HyperLabel{#porcurso,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporcurso:TooltipText := "Ordenar Por Codigo"

oCCbuscacurso := PushButton{self,ResourceID{JCRMAR_BUSCACURSO,_GetInst()}}
oCCbuscacurso:Image := ICO_FIND{}
oCCbuscacurso:HyperLabel := HyperLabel{#buscacurso,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscacurso:TooltipText := "Localizar um Codigo"

oCCPushButton2 := PushButton{self,ResourceID{JCRMAR_PUSHBUTTON2,_GetInst()}}
oCCPushButton2:HyperLabel := HyperLabel{#PushButton2,"INT->ETI",NULL_STRING,NULL_STRING}

self:Caption := "Checagem CRM/RIRM/RIST-->AR"
self:HyperLabel := HyperLabel{#jcrmar,"Checagem CRM/RIRM/RIST-->AR",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 14
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNRNOTA := DataColumn{padrao_num_08{}}
oDBNRNOTA:Width := 10
oDBNRNOTA:HyperLabel := oDCNRNOTA:HyperLabel 
oDBNRNOTA:Caption := "Nrnota:"
oDBNRNOTA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNRNOTA)

oDBDATA := DataColumn{date_field{}}
oDBDATA:Width := 11
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
oDBDATA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDATA)

oDBQTDE := DataColumn{padrao_num_08{}}
oDBQTDE:Width := 10
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
oDBQTDE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBQTDE)

oDBCOGNOME := DataColumn{padrao_char_20{}}
oDBCOGNOME:Width := 9
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
oDBCOGNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCOGNOME)

oDBCRM := DataColumn{padrao_num_08{}}
oDBCRM:Width := 8
oDBCRM:HyperLabel := oDCCRM:HyperLabel 
oDBCRM:Caption := "Crm:"
oDBCRM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCRM)

oDBRIRM := DataColumn{padrao_num_08{}}
oDBRIRM:Width := 8
oDBRIRM:HyperLabel := oDCRIRM:HyperLabel 
oDBRIRM:Caption := "Rirm:"
oDBRIRM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRIRM)

oDBRIST := DataColumn{padrao_num_08{}}
oDBRIST:Width := 8
oDBRIST:HyperLabel := oDCRIST:HyperLabel 
oDBRIST:Caption := "Rist:"
oDBRIST:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRIST)

oDBAR := DataColumn{padrao_num_08{}}
oDBAR:Width := 9
oDBAR:HyperLabel := oDCAR:HyperLabel 
oDBAR:Caption := "Ar:"
oDBAR:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBAR)

oDBITEM := DataColumn{padrao_num_03{}}
oDBITEM:Width := 4
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
oDBITEM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBITEM)

oDBCODIGOINT := DataColumn{padrao_char_24{}}
oDBCODIGOINT:Width := 11
oDBCODIGOINT:HyperLabel := oDCCODIGOINT:HyperLabel 
oDBCODIGOINT:Caption := "Codigoint:"
oDBCODIGOINT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGOINT)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access NRNOTA() 
return self:FieldGet(#NRNOTA)


assign NRNOTA(uValue) 
self:FieldPut(#NRNOTA, uValue)
return NRNOTA := uValue


access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


access RIRM() 
return self:FieldGet(#RIRM)


assign RIRM(uValue) 
self:FieldPut(#RIRM, uValue)
return RIRM := uValue


access RIST() 
return self:FieldGet(#RIST)


assign RIST(uValue) 
self:FieldPut(#RIST, uValue)
return RIST := uValue


access TIPOCLI() 
return self:FieldGet(#TIPOCLI)


assign TIPOCLI(uValue) 
self:FieldPut(#TIPOCLI, uValue)
return TIPOCLI := uValue


access TIPOENT() 
return self:FieldGet(#TIPOENT)


assign TIPOENT(uValue) 
self:FieldPut(#TIPOENT, uValue)
return TIPOENT := uValue


access UNIDADE() 
return self:FieldGet(#UNIDADE)


assign UNIDADE(uValue) 
self:FieldPut(#UNIDADE, uValue)
return UNIDADE := uValue


END CLASS
