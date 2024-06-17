#region DEFINES
STATIC DEFINE JFAPU_ALTERAR := 103 
STATIC DEFINE JFAPU_ANTERIOR := 108 
STATIC DEFINE JFAPU_APURADO := 117 
STATIC DEFINE JFAPU_BUSCA := 114 
STATIC DEFINE JFAPU_CMDAPURAR := 119 
STATIC DEFINE JFAPU_DFIM := 101 
STATIC DEFINE JFAPU_DINI := 100 
STATIC DEFINE JFAPU_EXCLUIR := 104 
STATIC DEFINE JFAPU_INCLUIR := 105 
STATIC DEFINE JFAPU_JFAPUI := 106 
STATIC DEFINE JFAPU_LIBERAR := 112 
STATIC DEFINE JFAPU_ORDEM := 113 
STATIC DEFINE JFAPU_PCPDAT := 111 
STATIC DEFINE JFAPU_PCPLIB := 109 
STATIC DEFINE JFAPU_PCPNUM := 110 
STATIC DEFINE JFAPU_PROXIMO := 107 
STATIC DEFINE JFAPU_SC_DINI := 115 
STATIC DEFINE JFAPU_SC_SEQ := 116 
STATIC DEFINE JFAPU_SEQ := 118 
STATIC DEFINE JFAPU_TABULAR := 102 
#endregion

PARTIAL class JFAPU inherit MYDataWindow 

	PROTECT oDBSEQ as DataColumn
	PROTECT oDBPCPNUM as DataColumn
	PROTECT oDBPCPDAT as DataColumn
	PROTECT oDBPCPLIB as DataColumn
	PROTECT oDBAPURADO as DataColumn
	protect oDCDINI as DATETIMEPICKER
	protect oDCDFIM as DATETIMEPICKER
	protect oCCTabular as PUSHBUTTON
	protect oCCAlterar as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCIncluir as PUSHBUTTON
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oDCPCPLIB as CHECKBOX
	protect oDCPCPNUM as SINGLELINEEDIT
	protect oDCPCPDAT as SINGLELINEEDIT
	protect oCCLiberar as PUSHBUTTON
	protect oCCordem as PUSHBUTTON
	protect oCCbusca as PUSHBUTTON
	protect oDCSC_DINI as FIXEDTEXT
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCAPURADO as CHECKBOX
	protect oDCSEQ as SINGLELINEEDIT
	protect oCCcmdApurar as PUSHBUTTON
// 	instance PCPLIB 
// 	instance PCPNUM 
// 	instance PCPDAT 
// 	instance APURADO 
// 	instance SEQ 
	protect oSFJFAPUI as JFAPUI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access APURADO() 
return self:FieldGet(#APURADO)


assign APURADO(uValue) 
self:FieldPut(#APURADO, uValue)
return APURADO := uValue


METHOD busca( ) 
	SELF:KeyFind()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFAPU",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,12,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDINI := DateTimePicker{self,ResourceID{JFAPU_DINI,_GetInst()}}
oDCDINI:FieldSpec := date_field{}
oDCDINI:HyperLabel := HyperLabel{#DINI,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDFIM := DateTimePicker{self,ResourceID{JFAPU_DFIM,_GetInst()}}
oDCDFIM:FieldSpec := date_field{}
oDCDFIM:HyperLabel := HyperLabel{#DFIM,NULL_STRING,NULL_STRING,NULL_STRING}

oCCTabular := PushButton{self,ResourceID{JFAPU_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Tabular",NULL_STRING,NULL_STRING}

oCCAlterar := PushButton{self,ResourceID{JFAPU_ALTERAR,_GetInst()}}
oCCAlterar:HyperLabel := HyperLabel{#Alterar,"Alterar",NULL_STRING,NULL_STRING}

oCCExcluir := PushButton{self,ResourceID{JFAPU_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}

oCCIncluir := PushButton{self,ResourceID{JFAPU_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}

oCCProximo := PushButton{self,ResourceID{JFAPU_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_next{}

oCCAnterior := PushButton{self,ResourceID{JFAPU_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_previous{}

oDCPCPLIB := CheckBox{self,ResourceID{JFAPU_PCPLIB,_GetInst()}}
oDCPCPLIB:HyperLabel := HyperLabel{#PCPLIB,"Liberado PCP",NULL_STRING,"FAPU_PCPLIB"}
oDCPCPLIB:FieldSpec := logic_field{}

oDCPCPNUM := SingleLineEdit{self,ResourceID{JFAPU_PCPNUM,_GetInst()}}
oDCPCPNUM:FieldSpec := padrao_num_08{}
oDCPCPNUM:HyperLabel := HyperLabel{#PCPNUM,"Pcpnum:",NULL_STRING,"FAPU_PCPNUM"}
oDCPCPNUM:BackGround := aBrushes[1]
oDCPCPNUM:Font(aFonts[1], FALSE)

oDCPCPDAT := SingleLineEdit{self,ResourceID{JFAPU_PCPDAT,_GetInst()}}
oDCPCPDAT:FieldSpec := date_field{}
oDCPCPDAT:HyperLabel := HyperLabel{#PCPDAT,"Pcpdat:",NULL_STRING,"FAPU_PCPDAT"}
oDCPCPDAT:BackGround := aBrushes[1]
oDCPCPDAT:Font(aFonts[1], FALSE)

oCCLiberar := PushButton{self,ResourceID{JFAPU_LIBERAR,_GetInst()}}
oCCLiberar:HyperLabel := HyperLabel{#Liberar,"Liberar",NULL_STRING,NULL_STRING}

oCCordem := PushButton{self,ResourceID{JFAPU_ORDEM,_GetInst()}}
oCCordem:Image := ico_az{}
oCCordem:HyperLabel := HyperLabel{#ordem,NULL_STRING,NULL_STRING,NULL_STRING}
oCCordem:TooltipText := "Ordenar Por Numero"

oCCbusca := PushButton{self,ResourceID{JFAPU_BUSCA,_GetInst()}}
oCCbusca:Image := ico_find{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_DINI := FixedText{self,ResourceID{JFAPU_SC_DINI,_GetInst()}}
oDCSC_DINI:HyperLabel := HyperLabel{#SC_DINI,"Periodo",NULL_STRING,NULL_STRING}

oDCSC_SEQ := FixedText{self,ResourceID{JFAPU_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCAPURADO := CheckBox{self,ResourceID{JFAPU_APURADO,_GetInst()}}
oDCAPURADO:HyperLabel := HyperLabel{#APURADO,"Apurado",NULL_STRING,"FAPU_APURADO"}
oDCAPURADO:FieldSpec := LOGIC_FIELD{}

oDCSEQ := SingleLineEdit{self,ResourceID{JFAPU_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := padrao_num_08{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"FAPU_SEQ"}
oDCSEQ:BackGround := aBrushes[1]
oDCSEQ:Font(aFonts[2], FALSE)

oCCcmdApurar := PushButton{self,ResourceID{JFAPU_CMDAPURAR,_GetInst()}}
oCCcmdApurar:HyperLabel := HyperLabel{#cmdApurar,"Apurar",NULL_STRING,NULL_STRING}

self:Caption := "Apurar Uso de Ferramentas"
self:HyperLabel := HyperLabel{#JFAPU,"Apurar Uso de Ferramentas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBSEQ := DataColumn{padrao_num_08{}}
oDBSEQ:Width := 12
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
oDBSEQ:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSEQ)

oDBPCPNUM := DataColumn{padrao_num_08{}}
oDBPCPNUM:Width := 10
oDBPCPNUM:HyperLabel := oDCPCPNUM:HyperLabel 
oDBPCPNUM:Caption := "Pcpnum:"
oDBPCPNUM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBPCPNUM)

oDBPCPDAT := DataColumn{date_field{}}
oDBPCPDAT:Width := 14
oDBPCPDAT:HyperLabel := oDCPCPDAT:HyperLabel 
oDBPCPDAT:Caption := "Pcpdat:"
oDBPCPDAT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBPCPDAT)

oDBPCPLIB := DataColumn{logic_field{}}
oDBPCPLIB:Width := 14
oDBPCPLIB:HyperLabel := oDCPCPLIB:HyperLabel 
oDBPCPLIB:Caption := "Liberado PCP"
self:Browser:AddColumn(oDBPCPLIB)

oDBAPURADO := DataColumn{LOGIC_FIELD{}}
oDBAPURADO:Width := 9
oDBAPURADO:HyperLabel := oDCAPURADO:HyperLabel 
oDBAPURADO:Caption := "Apurado"
self:Browser:AddColumn(oDBAPURADO)


self:ViewAs(#FormView)

oSFJFAPUI := JFAPUI{self,JFAPU_JFAPUI}
oSFJFAPUI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD ordem( ) 
	SELF:KeyFind()

access PCPDAT() 
return self:FieldGet(#PCPDAT)


assign PCPDAT(uValue) 
self:FieldPut(#PCPDAT, uValue)
return PCPDAT := uValue


access PCPLIB() 
return self:FieldGet(#PCPLIB)


assign PCPLIB(uValue) 
self:FieldPut(#PCPLIB, uValue)
return PCPLIB := uValue


access PCPNUM() 
return self:FieldGet(#PCPNUM)


assign PCPNUM(uValue) 
self:FieldPut(#PCPNUM, uValue)
return PCPNUM := uValue


access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


END CLASS
