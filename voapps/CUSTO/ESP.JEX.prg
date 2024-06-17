#region DEFINES
STATIC DEFINE JEX_BUSCAOV := 107 
STATIC DEFINE JEX_CLIENTE := 121 
STATIC DEFINE JEX_CODIGO := 113 
STATIC DEFINE JEX_COGCLI := 128 
STATIC DEFINE JEX_DUNS := 104 
STATIC DEFINE JEX_ELADAT := 109 
STATIC DEFINE JEX_ELAHOR := 108 
STATIC DEFINE JEX_ELANOM := 110 
STATIC DEFINE JEX_ELANUM := 111 
STATIC DEFINE JEX_FIXEDTEXT12 := 112 
STATIC DEFINE JEX_FOTO := 117 
STATIC DEFINE JEX_JSEQ := 135 
STATIC DEFINE JEX_JVCE := 134 
STATIC DEFINE JEX_JVIAREV := 119 
STATIC DEFINE JEX_LANU := 129 
STATIC DEFINE JEX_LMES := 130 
STATIC DEFINE JEX_LMIN := 131 
STATIC DEFINE JEX_NOME := 133 
STATIC DEFINE JEX_OV := 127 
STATIC DEFINE JEX_OVREV := 118 
STATIC DEFINE JEX_POROV := 106 
STATIC DEFINE JEX_PROJETO := 102 
STATIC DEFINE JEX_REV := 101 
STATIC DEFINE JEX_SC_CLIENTE := 120 
STATIC DEFINE JEX_SC_CODIGO := 132 
STATIC DEFINE JEX_SC_DESTINO2 := 116 
STATIC DEFINE JEX_SC_EAC1 := 105 
STATIC DEFINE JEX_SC_EAC2 := 103 
STATIC DEFINE JEX_SC_OV := 123 
STATIC DEFINE JEX_SC_REV := 100 
STATIC DEFINE JEX_THEFIXEDTEXT19 := 124 
STATIC DEFINE JEX_THEFIXEDTEXT20 := 125 
STATIC DEFINE JEX_THEFIXEDTEXT21 := 126 
STATIC DEFINE JEX_THEFIXEDTEXT23 := 115 
STATIC DEFINE JEX_THEGROUPBOX1 := 122 
STATIC DEFINE JEX_VIABILI := 114 
STATIC DEFINE JPO_COM := 116 
STATIC DEFINE JPO_PUSHBUTTON2 := 132 
#endregion

class JEX inherit MYDataWindow 

	PROTECT oDBOV as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBREV as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCOGCLI as DataColumn
	protect oDCSC_REV as FIXEDTEXT
	protect oDCREV as SINGLELINEEDIT
	protect oDCPROJETO as SINGLELINEEDIT
	protect oDCSC_EAC2 as FIXEDTEXT
	protect oDCDUNS as SINGLELINEEDIT
	protect oDCSC_EAC1 as FIXEDTEXT
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oDCELAHOR as SINGLELINEEDIT
	protect oDCELADAT as SINGLELINEEDIT
	protect oDCELANOM as SINGLELINEEDIT
	protect oDCELANUM as SINGLELINEEDIT
	protect oDCFixedText12 as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCVIABILI as SINGLELINEEDIT
	protect oDCtheFixedText23 as FIXEDTEXT
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oDCOVREV as SINGLELINEEDIT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCtheGroupBox1 as GROUPBOX
	protect oDCSC_OV as FIXEDTEXT
	protect oDCtheFixedText19 as FIXEDTEXT
	protect oDCtheFixedText20 as FIXEDTEXT
	protect oDCtheFixedText21 as FIXEDTEXT
	protect oDCOV as SINGLELINEEDIT
	protect oDCCOGCLI as SINGLELINEEDIT
	protect oDCLANU as SINGLELINEEDIT
	protect oDCLMES as SINGLELINEEDIT
	protect oDCLMIN as SINGLELINEEDIT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCNOME as SINGLELINEEDIT
// 	instance REV 
// 	instance PROJETO 
// 	instance DUNS 
// 	instance ELAHOR 
// 	instance ELADAT 
// 	instance ELANOM 
// 	instance ELANUM 
// 	instance CODIGO 
// 	instance VIABILI 
// 	instance OVREV 
// 	instance CLIENTE 
// 	instance OV 
// 	instance COGCLI 
// 	instance LANU 
// 	instance LMES 
// 	instance LMIN 
// 	instance NOME 
	protect oSFJVIAREV as JVIAREV
	protect oSFJVCE as JVCE
	protect oSFJSEQ as JSEQ

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CLIENTE() 
return self:FieldGet(#CLIENTE)


assign CLIENTE(uValue) 
self:FieldPut(#CLIENTE, uValue)
return CLIENTE := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access COGCLI() 
return self:FieldGet(#COGCLI)


assign COGCLI(uValue) 
self:FieldPut(#COGCLI, uValue)
return COGCLI := uValue


access DUNS() 
return self:FieldGet(#DUNS)


assign DUNS(uValue) 
self:FieldPut(#DUNS, uValue)
return DUNS := uValue


access ELADAT() 
return self:FieldGet(#ELADAT)


assign ELADAT(uValue) 
self:FieldPut(#ELADAT, uValue)
return ELADAT := uValue


access ELAHOR() 
return self:FieldGet(#ELAHOR)


assign ELAHOR(uValue) 
self:FieldPut(#ELAHOR, uValue)
return ELAHOR := uValue


access ELANOM() 
return self:FieldGet(#ELANOM)


assign ELANOM(uValue) 
self:FieldPut(#ELANOM, uValue)
return ELANOM := uValue


access ELANUM() 
return self:FieldGet(#ELANUM)


assign ELANUM(uValue) 
self:FieldPut(#ELANUM, uValue)
return ELANUM := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JEX",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_REV := FixedText{self,ResourceID{JEX_SC_REV,_GetInst()}}
oDCSC_REV:HyperLabel := HyperLabel{#SC_REV,"Rev:",NULL_STRING,NULL_STRING}

oDCREV := SingleLineEdit{self,ResourceID{JEX_REV,_GetInst()}}
oDCREV:FieldSpec := padrao_char_01{}
oDCREV:HyperLabel := HyperLabel{#REV,"Rev:",NULL_STRING,"VPORC_REV"}
oDCREV:Font(aFonts[1], FALSE)
oDCREV:BackGround := aBrushes[1]

oDCPROJETO := SingleLineEdit{self,ResourceID{JEX_PROJETO,_GetInst()}}
oDCPROJETO:FieldSpec := padrao_char_20{}
oDCPROJETO:HyperLabel := HyperLabel{#PROJETO,"Normat:",NULL_STRING,"VIABILI_NORMAT"}
oDCPROJETO:BackGround := aBrushes[1]

oDCSC_EAC2 := FixedText{self,ResourceID{JEX_SC_EAC2,_GetInst()}}
oDCSC_EAC2:HyperLabel := HyperLabel{#SC_EAC2,"Projeto",NULL_STRING,NULL_STRING}

oDCDUNS := SingleLineEdit{self,ResourceID{JEX_DUNS,_GetInst()}}
oDCDUNS:FieldSpec := padrao_char_30{}
oDCDUNS:HyperLabel := HyperLabel{#DUNS,"Eac:",NULL_STRING,"VIABILI_EAC"}
oDCDUNS:BackGround := aBrushes[1]

oDCSC_EAC1 := FixedText{self,ResourceID{JEX_SC_EAC1,_GetInst()}}
oDCSC_EAC1:HyperLabel := HyperLabel{#SC_EAC1,"Duns",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JEX_POROV,_GetInst()}}
oCCporov:Image := ico_az{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaov := PushButton{self,ResourceID{JEX_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ico_find{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}

oDCELAHOR := SingleLineEdit{self,ResourceID{JEX_ELAHOR,_GetInst()}}
oDCELAHOR:FieldSpec := padrao_char_08{}
oDCELAHOR:HyperLabel := HyperLabel{#ELAHOR,"Codigo:",NULL_STRING,"VPORC_CODIGO"}
oDCELAHOR:FocusSelect := FSEL_HOME
oDCELAHOR:BackGround := aBrushes[1]

oDCELADAT := SingleLineEdit{self,ResourceID{JEX_ELADAT,_GetInst()}}
oDCELADAT:FieldSpec := date_field{}
oDCELADAT:HyperLabel := HyperLabel{#ELADAT,"Codigo:",NULL_STRING,"VPORC_CODIGO"}
oDCELADAT:FocusSelect := FSEL_HOME
oDCELADAT:BackGround := aBrushes[1]

oDCELANOM := SingleLineEdit{self,ResourceID{JEX_ELANOM,_GetInst()}}
oDCELANOM:FieldSpec := padrao_char_40{}
oDCELANOM:HyperLabel := HyperLabel{#ELANOM,"Nome:",NULL_STRING,"VPORC_NOME"}
oDCELANOM:FocusSelect := FSEL_HOME
oDCELANOM:BackGround := aBrushes[1]

oDCELANUM := SingleLineEdit{self,ResourceID{JEX_ELANUM,_GetInst()}}
oDCELANUM:FieldSpec := padrao_num_08{}
oDCELANUM:HyperLabel := HyperLabel{#ELANUM,"Codigo:",NULL_STRING,"VPORC_CODIGO"}
oDCELANUM:FocusSelect := FSEL_HOME
oDCELANUM:BackGround := aBrushes[1]

oDCFixedText12 := FixedText{self,ResourceID{JEX_FIXEDTEXT12,_GetInst()}}
oDCFixedText12:HyperLabel := HyperLabel{#FixedText12,"Liberaçao",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JEX_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"VPORC_CODIGO"}
oDCCODIGO:FocusSelect := FSEL_HOME
oDCCODIGO:Font(aFonts[1], FALSE)
oDCCODIGO:BackGround := aBrushes[1]

oDCVIABILI := SingleLineEdit{self,ResourceID{JEX_VIABILI,_GetInst()}}
oDCVIABILI:FieldSpec := padrao_num_08{}
oDCVIABILI:HyperLabel := HyperLabel{#VIABILI,"Lmes:",NULL_STRING,"VPORC_PRAZO"}
oDCVIABILI:Font(aFonts[1], FALSE)
oDCVIABILI:BackGround := aBrushes[1]

oDCtheFixedText23 := FixedText{self,ResourceID{JEX_THEFIXEDTEXT23,_GetInst()}}
oDCtheFixedText23:HyperLabel := HyperLabel{#theFixedText23,"Viabilidade",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JEX_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JEX_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oDCOVREV := SingleLineEdit{self,ResourceID{JEX_OVREV,_GetInst()}}
oDCOVREV:FieldSpec := padrao_char_01{}
oDCOVREV:HyperLabel := HyperLabel{#OVREV,"Ov:",NULL_STRING,"VIABILI_OV"}
oDCOVREV:BackGround := aBrushes[1]
oDCOVREV:Font(aFonts[1], FALSE)

oDCSC_CLIENTE := FixedText{self,ResourceID{JEX_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCCLIENTE := SingleLineEdit{self,ResourceID{JEX_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := padrao_num_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"VPORC_CLIENTE"}
oDCCLIENTE:BackGround := aBrushes[1]

oDCtheGroupBox1 := GroupBox{self,ResourceID{JEX_THEGROUPBOX1,_GetInst()}}
oDCtheGroupBox1:HyperLabel := HyperLabel{#theGroupBox1,"Lotes",NULL_STRING,NULL_STRING}

oDCSC_OV := FixedText{self,ResourceID{JEX_SC_OV,_GetInst()}}
oDCSC_OV:HyperLabel := HyperLabel{#SC_OV,"Ov:",NULL_STRING,NULL_STRING}

oDCtheFixedText19 := FixedText{self,ResourceID{JEX_THEFIXEDTEXT19,_GetInst()}}
oDCtheFixedText19:HyperLabel := HyperLabel{#theFixedText19,"Anual",NULL_STRING,NULL_STRING}

oDCtheFixedText20 := FixedText{self,ResourceID{JEX_THEFIXEDTEXT20,_GetInst()}}
oDCtheFixedText20:HyperLabel := HyperLabel{#theFixedText20,"Mensal",NULL_STRING,NULL_STRING}

oDCtheFixedText21 := FixedText{self,ResourceID{JEX_THEFIXEDTEXT21,_GetInst()}}
oDCtheFixedText21:HyperLabel := HyperLabel{#theFixedText21,"Minimo",NULL_STRING,NULL_STRING}

oDCOV := SingleLineEdit{self,ResourceID{JEX_OV,_GetInst()}}
oDCOV:FieldSpec := padrao_num_08{}
oDCOV:HyperLabel := HyperLabel{#OV,"Ov:",NULL_STRING,"VPORC_OV"}
oDCOV:BackGround := aBrushes[1]

oDCCOGCLI := SingleLineEdit{self,ResourceID{JEX_COGCLI,_GetInst()}}
oDCCOGCLI:FieldSpec := padrao_char_12{}
oDCCOGCLI:HyperLabel := HyperLabel{#COGCLI,"Cognome",NULL_STRING,"VPORC_COGCLI"}
oDCCOGCLI:BackGround := aBrushes[1]

oDCLANU := SingleLineEdit{self,ResourceID{JEX_LANU,_GetInst()}}
oDCLANU:FieldSpec := padrao_num_07{}
oDCLANU:HyperLabel := HyperLabel{#LANU,"Lanu:",NULL_STRING,"VPORC_LANU"}
oDCLANU:BackGround := aBrushes[1]

oDCLMES := SingleLineEdit{self,ResourceID{JEX_LMES,_GetInst()}}
oDCLMES:FieldSpec := padrao_num_07{}
oDCLMES:HyperLabel := HyperLabel{#LMES,"Lmes:",NULL_STRING,"VPORC_LMES"}
oDCLMES:BackGround := aBrushes[1]

oDCLMIN := SingleLineEdit{self,ResourceID{JEX_LMIN,_GetInst()}}
oDCLMIN:FieldSpec := padrao_num_07{}
oDCLMIN:HyperLabel := HyperLabel{#LMIN,"Lmin:",NULL_STRING,"VPORC_LMIN"}
oDCLMIN:BackGround := aBrushes[1]

oDCSC_CODIGO := FixedText{self,ResourceID{JEX_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JEX_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_75{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"VPORC_NOME"}
oDCNOME:BackGround := aBrushes[1]

self:Caption := "Estimativa de Processo"
self:HyperLabel := HyperLabel{#JEX,"Estimativa de Processo",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBOV := DataColumn{padrao_num_08{}}
oDBOV:Width := 7
oDBOV:HyperLabel := oDCOV:HyperLabel 
oDBOV:Caption := "Ov:"
oDBOV:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOV)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 18
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBREV := DataColumn{padrao_char_01{}}
oDBREV:Width := 5
oDBREV:HyperLabel := oDCREV:HyperLabel 
oDBREV:Caption := "Rev:"
oDBREV:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBREV)

oDBNOME := DataColumn{padrao_char_75{}}
oDBNOME:Width := 30
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)

oDBCLIENTE := DataColumn{padrao_num_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
oDBCLIENTE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCLIENTE)

oDBCOGCLI := DataColumn{padrao_char_12{}}
oDBCOGCLI:Width := 17
oDBCOGCLI:HyperLabel := oDCCOGCLI:HyperLabel 
oDBCOGCLI:Caption := "Cognome"
oDBCOGCLI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCOGCLI)


self:ViewAs(#FormView)

oSFJVIAREV := JVIAREV{self,JEX_JVIAREV}
oSFJVIAREV:show()

oSFJVCE := JVCE{self,JEX_JVCE}
oSFJVCE:show()

oSFJSEQ := JSEQ{self,JEX_JSEQ}
oSFJSEQ:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LANU() 
return self:FieldGet(#LANU)


assign LANU(uValue) 
self:FieldPut(#LANU, uValue)
return LANU := uValue


access LMES() 
return self:FieldGet(#LMES)


assign LMES(uValue) 
self:FieldPut(#LMES, uValue)
return LMES := uValue


access LMIN() 
return self:FieldGet(#LMIN)


assign LMIN(uValue) 
self:FieldPut(#LMIN, uValue)
return LMIN := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access OV() 
return self:FieldGet(#OV)


assign OV(uValue) 
self:FieldPut(#OV, uValue)
return OV := uValue


access OVREV() 
return self:FieldGet(#OVREV)


assign OVREV(uValue) 
self:FieldPut(#OVREV, uValue)
return OVREV := uValue


access PROJETO() 
return self:FieldGet(#PROJETO)


assign PROJETO(uValue) 
self:FieldPut(#PROJETO, uValue)
return PROJETO := uValue


access REV() 
return self:FieldGet(#REV)


assign REV(uValue) 
self:FieldPut(#REV, uValue)
return REV := uValue


access VIABILI() 
return self:FieldGet(#VIABILI)


assign VIABILI(uValue) 
self:FieldPut(#VIABILI, uValue)
return VIABILI := uValue


END CLASS
