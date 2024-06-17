#region DEFINES
STATIC DEFINE JRAT_ALTERACOD := 126 
STATIC DEFINE JRAT_ALTERAR := 110 
STATIC DEFINE JRAT_ANTERIOR := 119 
STATIC DEFINE JRAT_BUSCANUMERO := 123 
STATIC DEFINE JRAT_CLIENTE := 106 
STATIC DEFINE JRAT_CLINOME := 107 
STATIC DEFINE JRAT_CMDTIPO := 129 
STATIC DEFINE JRAT_CNQ := 124 
STATIC DEFINE JRAT_CODIGO := 121 
STATIC DEFINE JRAT_DATA := 105 
STATIC DEFINE JRAT_ESCCOD := 120 
STATIC DEFINE JRAT_ESCFOR := 116 
STATIC DEFINE JRAT_EXCLUIR := 111 
STATIC DEFINE JRAT_FOTO := 131 
STATIC DEFINE JRAT_INCLUIR := 112 
STATIC DEFINE JRAT_JRATI := 108 
STATIC DEFINE JRAT_PEGCLI := 115 
STATIC DEFINE JRAT_PORNUM := 132 
STATIC DEFINE JRAT_PROXIMO := 118 
STATIC DEFINE JRAT_RACF := 114 
STATIC DEFINE JRAT_RAT := 104 
STATIC DEFINE JRAT_RECCLI := 127 
STATIC DEFINE JRAT_RELCLI := 128 
STATIC DEFINE JRAT_SAC := 113 
STATIC DEFINE JRAT_SC_CLIENTE := 101 
STATIC DEFINE JRAT_SC_CLINOME := 102 
STATIC DEFINE JRAT_SC_CODIGO := 122 
STATIC DEFINE JRAT_SC_DATA := 103 
STATIC DEFINE JRAT_SC_DESTINO2 := 130 
STATIC DEFINE JRAT_SC_RAT := 100 
STATIC DEFINE JRAT_TABULAR := 109 
STATIC DEFINE JRAT_VERSAC := 125 
STATIC DEFINE JRAT_VISITA := 117 
#endregion

PARTIAL class jrat inherit MYDataWindow 

	PROTECT oDBRAT as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCLINOME as DataColumn
	PROTECT oDBDATA as DataColumn
	protect oDCSC_RAT as FIXEDTEXT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCSC_CLINOME as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCRAT as SINGLELINEEDIT
	protect oDCDATA as DATETIMEPICKER
	protect oDCCLIENTE as RIGHTSLE
	protect oDCCLINOME as SINGLELINEEDIT
	protect oCCTabular as PUSHBUTTON
	protect oCCAlterar as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCIncluir as PUSHBUTTON
	protect oCCSAC as PUSHBUTTON
	protect oCCRACF as PUSHBUTTON
	protect oCCpegcli as PUSHBUTTON
	protect oCCescfor as PUSHBUTTON
	protect oDCVISITA as CHECKBOX
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oCCbuscanumero as PUSHBUTTON
	protect oCCCNQ as PUSHBUTTON
	protect oCCVerSac as PUSHBUTTON
	protect oCCAlteracod as PUSHBUTTON
	protect oDCRECCLI as CHECKBOX
	protect oDCRELCLI as CHECKBOX
	protect oCCcmdTIPO as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCPORNUM as PUSHBUTTON
// 	instance RAT 
// 	instance CLIENTE 
// 	instance CLINOME 
// 	instance VISITA 
// 	instance CODIGO 
// 	instance RECCLI 
// 	instance RELCLI 
	protect oSFJRATI as JRATI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

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


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jrat",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_RAT := FixedText{self,ResourceID{JRAT_SC_RAT,_GetInst()}}
oDCSC_RAT:HyperLabel := HyperLabel{#SC_RAT,"Rat:",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{JRAT_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCSC_CLINOME := FixedText{self,ResourceID{JRAT_SC_CLINOME,_GetInst()}}
oDCSC_CLINOME:HyperLabel := HyperLabel{#SC_CLINOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JRAT_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCRAT := SingleLineEdit{self,ResourceID{JRAT_RAT,_GetInst()}}
oDCRAT:FieldSpec := PADRAO_NUM_08{}
oDCRAT:HyperLabel := HyperLabel{#RAT,"Rat:",NULL_STRING,"RAT__RAT"}
oDCRAT:BackGround := aBrushes[1]
oDCRAT:Font(aFonts[1], FALSE)

oDCDATA := DateTimePicker{self,ResourceID{JRAT_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data",NULL_STRING,NULL_STRING}

oDCCLIENTE := rightSle{self,ResourceID{JRAT_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"RAT__CLIENTE"}

oDCCLINOME := SingleLineEdit{self,ResourceID{JRAT_CLINOME,_GetInst()}}
oDCCLINOME:FieldSpec := PADRAO_CHAR_50{}
oDCCLINOME:HyperLabel := HyperLabel{#CLINOME,"Clinome:",NULL_STRING,"RAT__CLINOME"}

oCCTabular := PushButton{self,ResourceID{JRAT_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Ver Itens",NULL_STRING,NULL_STRING}

oCCAlterar := PushButton{self,ResourceID{JRAT_ALTERAR,_GetInst()}}
oCCAlterar:HyperLabel := HyperLabel{#Alterar,"Alterar Item",NULL_STRING,NULL_STRING}

oCCExcluir := PushButton{self,ResourceID{JRAT_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}

oCCIncluir := PushButton{self,ResourceID{JRAT_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}

oCCSAC := PushButton{self,ResourceID{JRAT_SAC,_GetInst()}}
oCCSAC:HyperLabel := HyperLabel{#SAC,"SAC",NULL_STRING,NULL_STRING}

oCCRACF := PushButton{self,ResourceID{JRAT_RACF,_GetInst()}}
oCCRACF:HyperLabel := HyperLabel{#RACF,"RACF",NULL_STRING,NULL_STRING}

oCCpegcli := PushButton{self,ResourceID{JRAT_PEGCLI,_GetInst()}}
oCCpegcli:HyperLabel := HyperLabel{#pegcli,"-->",NULL_STRING,NULL_STRING}

oCCescfor := PushButton{self,ResourceID{JRAT_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}

oDCVISITA := CheckBox{self,ResourceID{JRAT_VISITA,_GetInst()}}
oDCVISITA:HyperLabel := HyperLabel{#VISITA,"Visita",NULL_STRING,"RAT__VISITA"}
oDCVISITA:FieldSpec := LOGIC_FIELD{}

oCCProximo := PushButton{self,ResourceID{JRAT_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_next{}

oCCAnterior := PushButton{self,ResourceID{JRAT_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_previous{}

oCCesccod := PushButton{self,ResourceID{JRAT_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JRAT_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"RATI_CODIGO"}

oDCSC_CODIGO := FixedText{self,ResourceID{JRAT_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oCCbuscanumero := PushButton{self,ResourceID{JRAT_BUSCANUMERO,_GetInst()}}
oCCbuscanumero:Image := ico_find{}
oCCbuscanumero:HyperLabel := HyperLabel{#buscanumero,NULL_STRING,NULL_STRING,NULL_STRING}

oCCCNQ := PushButton{self,ResourceID{JRAT_CNQ,_GetInst()}}
oCCCNQ:HyperLabel := HyperLabel{#CNQ,"Custo Nao Qual",NULL_STRING,NULL_STRING}

oCCVerSac := PushButton{self,ResourceID{JRAT_VERSAC,_GetInst()}}
oCCVerSac:HyperLabel := HyperLabel{#VerSac,"Ver Sac",NULL_STRING,NULL_STRING}

oCCAlteracod := PushButton{self,ResourceID{JRAT_ALTERACOD,_GetInst()}}
oCCAlteracod:HyperLabel := HyperLabel{#Alteracod,"Alterar Cod",NULL_STRING,NULL_STRING}

oDCRECCLI := CheckBox{self,ResourceID{JRAT_RECCLI,_GetInst()}}
oDCRECCLI:HyperLabel := HyperLabel{#RECCLI,"Reclamaçao Cliente",NULL_STRING,"RAT__VISITA"}
oDCRECCLI:FieldSpec := LOGIC_FIELD{}

oDCRELCLI := CheckBox{self,ResourceID{JRAT_RELCLI,_GetInst()}}
oDCRELCLI:HyperLabel := HyperLabel{#RELCLI,"Relatorio  Cliente",NULL_STRING,"RAT__VISITA"}
oDCRELCLI:FieldSpec := LOGIC_FIELD{}

oCCcmdTIPO := PushButton{self,ResourceID{JRAT_CMDTIPO,_GetInst()}}
oCCcmdTIPO:HyperLabel := HyperLabel{#cmdTIPO,"Tipo",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JRAT_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JRAT_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oCCPORNUM := PushButton{self,ResourceID{JRAT_PORNUM,_GetInst()}}
oCCPORNUM:Image := ico_az{}
oCCPORNUM:HyperLabel := HyperLabel{#PORNUM,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Relatorio de Assistencia Tecnica"
self:HyperLabel := HyperLabel{#jrat,"Relatorio de Assistencia Tecnica",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRAT := DataColumn{PADRAO_NUM_08{}}
oDBRAT:Width := 9
oDBRAT:HyperLabel := oDCRAT:HyperLabel 
oDBRAT:Caption := "Rat:"
oDBRAT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRAT)

oDBCLIENTE := DataColumn{PADRAO_NUM_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
self:Browser:AddColumn(oDBCLIENTE)

oDBCLINOME := DataColumn{PADRAO_CHAR_50{}}
oDBCLINOME:Width := 23
oDBCLINOME:HyperLabel := oDCCLINOME:HyperLabel 
oDBCLINOME:Caption := "Clinome:"
self:Browser:AddColumn(oDBCLINOME)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 17
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data"
self:Browser:AddColumn(oDBDATA)


self:ViewAs(#FormView)

oSFJRATI := JRATI{self,JRAT_JRATI}
oSFJRATI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PORNUM( ) 
	SELF:KeyFind()

access RAT() 
return self:FieldGet(#RAT)


assign RAT(uValue) 
self:FieldPut(#RAT, uValue)
return RAT := uValue


access RECCLI() 
return self:FieldGet(#RECCLI)


assign RECCLI(uValue) 
self:FieldPut(#RECCLI, uValue)
return RECCLI := uValue


access RELCLI() 
return self:FieldGet(#RELCLI)


assign RELCLI(uValue) 
self:FieldPut(#RELCLI, uValue)
return RELCLI := uValue


access VISITA() 
return self:FieldGet(#VISITA)


assign VISITA(uValue) 
self:FieldPut(#VISITA, uValue)
return VISITA := uValue


END CLASS
