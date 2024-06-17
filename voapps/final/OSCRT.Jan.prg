#region DEFINES
STATIC DEFINE JOSC_BUSCAOV := 112 
STATIC DEFINE JOSC_CHKCLIPRO := 129 
STATIC DEFINE JOSC_CHKPF := 128 
STATIC DEFINE JOSC_CLIENTE := 115 
STATIC DEFINE JOSC_CLINOME := 113 
STATIC DEFINE JOSC_CODIGO := 122 
STATIC DEFINE JOSC_CODIGOINT := 126 
STATIC DEFINE JOSC_EMUSO := 108 
STATIC DEFINE JOSC_FIXEDTEXT5 := 127 
STATIC DEFINE JOSC_FOTO := 119 
STATIC DEFINE JOSC_NOME := 116 
STATIC DEFINE JOSC_OBSFIN01 := 101 
STATIC DEFINE JOSC_OBSFIN02 := 102 
STATIC DEFINE JOSC_OBSFIN03 := 103 
STATIC DEFINE JOSC_OBSFIN04 := 104 
STATIC DEFINE JOSC_OBSFIN05 := 105 
STATIC DEFINE JOSC_OBSFIN06 := 106 
STATIC DEFINE JOSC_OS := 123 
STATIC DEFINE JOSC_PF := 100 
STATIC DEFINE JOSC_POROV := 111 
STATIC DEFINE JOSC_PUSHBUTTON3 := 124 
STATIC DEFINE JOSC_RADIOBUTTON1 := 109 
STATIC DEFINE JOSC_RADIOBUTTON2 := 110 
STATIC DEFINE JOSC_RADIOBUTTON3 := 125 
STATIC DEFINE JOSC_SAIOBS := 117 
STATIC DEFINE JOSC_SC_CLIENTE := 114 
STATIC DEFINE JOSC_SC_CLIENTE1 := 107 
STATIC DEFINE JOSC_SC_CODIGO := 121 
STATIC DEFINE JOSC_SC_DESTINO2 := 118 
STATIC DEFINE JOSC_SC_OS := 120 
#endregion

class JOSC inherit MYDataWindow 

	PROTECT oDBOS as DataColumn
	PROTECT oDBPF as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBEMUSO as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCODIGOINT as DataColumn
	protect oDCPF as RIGHTSLE
	protect oDCOBSFIN01 as SINGLELINEEDIT
	protect oDCOBSFIN02 as SINGLELINEEDIT
	protect oDCOBSFIN03 as SINGLELINEEDIT
	protect oDCOBSFIN04 as SINGLELINEEDIT
	protect oDCOBSFIN05 as SINGLELINEEDIT
	protect oDCOBSFIN06 as SINGLELINEEDIT
	protect oDCSC_CLIENTE1 as FIXEDTEXT
	protect oDCEMUSO as RADIOBUTTONGROUP
	protect oCCRadioButton1 as RADIOBUTTON
	protect oCCRadioButton2 as RADIOBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oDCCLINOME as SINGLELINEEDIT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSAIOBS as CHECKBOX
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oDCSC_OS as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCOS as SINGLELINEEDIT
	protect oCCPushButton3 as PUSHBUTTON
	protect oCCRadioButton3 as RADIOBUTTON
	protect oDCCODIGOINT as SINGLELINEEDIT
	protect oDCFixedText5 as FIXEDTEXT
	protect oCCCHKPF as PUSHBUTTON
	protect oCCchkclipro as PUSHBUTTON
// 	instance PF 
// 	instance OBSFIN01 
// 	instance OBSFIN02 
// 	instance OBSFIN03 
// 	instance OBSFIN04 
// 	instance OBSFIN05 
// 	instance OBSFIN06 
// 	instance EMUSO 
// 	instance CLINOME 
// 	instance CLIENTE 
// 	instance NOME 
// 	instance SAIOBS 
// 	instance CODIGO 
// 	instance OS 
// 	instance CODIGOINT 

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


access CODIGOINT() 
return self:FieldGet(#CODIGOINT)


assign CODIGOINT(uValue) 
self:FieldPut(#CODIGOINT, uValue)
return CODIGOINT := uValue


access EMUSO() 
return self:FieldGet(#EMUSO)


assign EMUSO(uValue) 
self:FieldPut(#EMUSO, uValue)
return EMUSO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JOSC",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCPF := rightSle{self,ResourceID{JOSC_PF,_GetInst()}}
oDCPF:FieldSpec := padrao_num_08{}
oDCPF:HyperLabel := HyperLabel{#PF,"PF",NULL_STRING,"OSCRT_CLIENTE"}

oDCOBSFIN01 := SingleLineEdit{self,ResourceID{JOSC_OBSFIN01,_GetInst()}}
oDCOBSFIN01:FieldSpec := padrao_char_80{}
oDCOBSFIN01:HyperLabel := HyperLabel{#OBSFIN01,"Obsfin01:",NULL_STRING,"Oscrt_OBSFIN01"}

oDCOBSFIN02 := SingleLineEdit{self,ResourceID{JOSC_OBSFIN02,_GetInst()}}
oDCOBSFIN02:FieldSpec := padrao_char_80{}
oDCOBSFIN02:HyperLabel := HyperLabel{#OBSFIN02,"Obsfin02:",NULL_STRING,"Oscrt_OBSFIN02"}

oDCOBSFIN03 := SingleLineEdit{self,ResourceID{JOSC_OBSFIN03,_GetInst()}}
oDCOBSFIN03:FieldSpec := padrao_char_80{}
oDCOBSFIN03:HyperLabel := HyperLabel{#OBSFIN03,"Obsfin03:",NULL_STRING,"Oscrt_OBSFIN03"}

oDCOBSFIN04 := SingleLineEdit{self,ResourceID{JOSC_OBSFIN04,_GetInst()}}
oDCOBSFIN04:FieldSpec := padrao_char_80{}
oDCOBSFIN04:HyperLabel := HyperLabel{#OBSFIN04,"Obsfin04:",NULL_STRING,"Oscrt_OBSFIN04"}

oDCOBSFIN05 := SingleLineEdit{self,ResourceID{JOSC_OBSFIN05,_GetInst()}}
oDCOBSFIN05:FieldSpec := padrao_char_80{}
oDCOBSFIN05:HyperLabel := HyperLabel{#OBSFIN05,"Obsfin05:",NULL_STRING,"Oscrt_OBSFIN05"}

oDCOBSFIN06 := SingleLineEdit{self,ResourceID{JOSC_OBSFIN06,_GetInst()}}
oDCOBSFIN06:FieldSpec := padrao_char_80{}
oDCOBSFIN06:HyperLabel := HyperLabel{#OBSFIN06,"Obsfin06:",NULL_STRING,"Oscrt_OBSFIN06"}

oDCSC_CLIENTE1 := FixedText{self,ResourceID{JOSC_SC_CLIENTE1,_GetInst()}}
oDCSC_CLIENTE1:HyperLabel := HyperLabel{#SC_CLIENTE1,"PF",NULL_STRING,NULL_STRING}

oCCRadioButton1 := RadioButton{self,ResourceID{JOSC_RADIOBUTTON1,_GetInst()}}
oCCRadioButton1:HyperLabel := HyperLabel{#RadioButton1,"Sim",NULL_STRING,NULL_STRING}

oCCRadioButton2 := RadioButton{self,ResourceID{JOSC_RADIOBUTTON2,_GetInst()}}
oCCRadioButton2:HyperLabel := HyperLabel{#RadioButton2,"Não",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JOSC_POROV,_GetInst()}}
oCCporov:Image := ico_az{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaov := PushButton{self,ResourceID{JOSC_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ico_find{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCLINOME := SingleLineEdit{self,ResourceID{JOSC_CLINOME,_GetInst()}}
oDCCLINOME:FieldSpec := padrao_char_50{}
oDCCLINOME:HyperLabel := HyperLabel{#CLINOME,"Nome",NULL_STRING,"OSCRT_CLIENTE"}
oDCCLINOME:TooltipText := "Razao Social do Cliente"
oDCCLINOME:BackGround := aBrushes[1]
oDCCLINOME:Font(aFonts[1], FALSE)

oDCSC_CLIENTE := FixedText{self,ResourceID{JOSC_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCCLIENTE := SingleLineEdit{self,ResourceID{JOSC_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := padrao_num_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"OSCRT_CLIENTE"}
oDCCLIENTE:TooltipText := "Numero do Cadastro do Cliente"
oDCCLIENTE:BackGround := aBrushes[1]
oDCCLIENTE:Font(aFonts[1], FALSE)

oDCNOME := SingleLineEdit{self,ResourceID{JOSC_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Descrição",NULL_STRING,"OSCRT_CLIENTE"}
oDCNOME:TooltipText := "Descriçao do Produto"
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[1], FALSE)

oDCSAIOBS := CheckBox{self,ResourceID{JOSC_SAIOBS,_GetInst()}}
oDCSAIOBS:HyperLabel := HyperLabel{#SAIOBS,"Sair Observacoes nos Relatorios",NULL_STRING,NULL_STRING}
oDCSAIOBS:FieldSpec := logic_field{}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JOSC_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JOSC_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}
oCCfoto:TooltipText := "Exibe foto do produto"

oDCSC_OS := FixedText{self,ResourceID{JOSC_SC_OS,_GetInst()}}
oDCSC_OS:HyperLabel := HyperLabel{#SC_OS,"Os:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JOSC_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Produto:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JOSC_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"OSCRT_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[1], FALSE)

oDCOS := SingleLineEdit{self,ResourceID{JOSC_OS,_GetInst()}}
oDCOS:FieldSpec := padrao_num_08{}
oDCOS:HyperLabel := HyperLabel{#OS,"Os:",NULL_STRING,"OSCRT_OS"}
oDCOS:BackGround := aBrushes[1]
oDCOS:Font(aFonts[1], FALSE)

oCCPushButton3 := PushButton{self,ResourceID{JOSC_PUSHBUTTON3,_GetInst()}}
oCCPushButton3:HyperLabel := HyperLabel{#PushButton3,NULL_STRING,NULL_STRING,NULL_STRING}
oCCPushButton3:TooltipText := "Escolher o PF"
oCCPushButton3:Image := ico_FIND{}

oCCRadioButton3 := RadioButton{self,ResourceID{JOSC_RADIOBUTTON3,_GetInst()}}
oCCRadioButton3:HyperLabel := HyperLabel{#RadioButton3,"Preliminar>1200",NULL_STRING,NULL_STRING}

oDCCODIGOINT := SingleLineEdit{self,ResourceID{JOSC_CODIGOINT,_GetInst()}}
oDCCODIGOINT:FieldSpec := padrao_CHAR_24{}
oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT,"Codigo Int",NULL_STRING,NULL_STRING}
oDCCODIGOINT:TooltipText := "Observações sobre entrega"
oDCCODIGOINT:BackGround := aBrushes[1]

oDCFixedText5 := FixedText{self,ResourceID{JOSC_FIXEDTEXT5,_GetInst()}}
oDCFixedText5:HyperLabel := HyperLabel{#FixedText5,"Codigo Integrado",NULL_STRING,NULL_STRING}

oCCCHKPF := PushButton{self,ResourceID{JOSC_CHKPF,_GetInst()}}
oCCCHKPF:HyperLabel := HyperLabel{#CHKPF,"checar PF",NULL_STRING,NULL_STRING}

oCCchkclipro := PushButton{self,ResourceID{JOSC_CHKCLIPRO,_GetInst()}}
oCCchkclipro:HyperLabel := HyperLabel{#chkclipro,"Checar Cliente Produto",NULL_STRING,NULL_STRING}
oCCchkclipro:TooltipText := "Verificar os Nomes Clientes Produtos"

oDCEMUSO := RadioButtonGroup{self,ResourceID{JOSC_EMUSO,_GetInst()}}
oDCEMUSO:FillUsing({ ;
						{oCCRadioButton1,"S"}, ;
						{oCCRadioButton2,"N"}, ;
						{oCCRadioButton3,"P"} ;
						})
oDCEMUSO:HyperLabel := HyperLabel{#EMUSO,"Uso",NULL_STRING,NULL_STRING}
oDCEMUSO:FieldSpec := padrao_char_01{}

self:Caption := "Controle Ordem Servicos"
self:HyperLabel := HyperLabel{#JOSC,"Controle Ordem Servicos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBOS := DataColumn{padrao_num_08{}}
oDBOS:Width := 10
oDBOS:HyperLabel := oDCOS:HyperLabel 
oDBOS:Caption := "Os:"
oDBOS:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOS)

oDBPF := DataColumn{padrao_num_08{}}
oDBPF:Width := 8
oDBPF:HyperLabel := oDCPF:HyperLabel 
oDBPF:Caption := "PF"
self:Browser:AddColumn(oDBPF)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 20
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBEMUSO := DataColumn{padrao_char_01{}}
oDBEMUSO:Width := 7
oDBEMUSO:HyperLabel := oDCEMUSO:HyperLabel 
oDBEMUSO:Caption := "Uso"
self:Browser:AddColumn(oDBEMUSO)

oDBCLIENTE := DataColumn{padrao_num_08{}}
oDBCLIENTE:Width := 14
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
oDBCLIENTE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCLIENTE)

oDBCODIGOINT := DataColumn{padrao_CHAR_24{}}
oDBCODIGOINT:Width := 18
oDBCODIGOINT:HyperLabel := oDCCODIGOINT:HyperLabel 
oDBCODIGOINT:Caption := "Codigo Int"
oDBCODIGOINT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGOINT)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access OBSFIN01() 
return self:FieldGet(#OBSFIN01)


assign OBSFIN01(uValue) 
self:FieldPut(#OBSFIN01, uValue)
return OBSFIN01 := uValue


access OBSFIN02() 
return self:FieldGet(#OBSFIN02)


assign OBSFIN02(uValue) 
self:FieldPut(#OBSFIN02, uValue)
return OBSFIN02 := uValue


access OBSFIN03() 
return self:FieldGet(#OBSFIN03)


assign OBSFIN03(uValue) 
self:FieldPut(#OBSFIN03, uValue)
return OBSFIN03 := uValue


access OBSFIN04() 
return self:FieldGet(#OBSFIN04)


assign OBSFIN04(uValue) 
self:FieldPut(#OBSFIN04, uValue)
return OBSFIN04 := uValue


access OBSFIN05() 
return self:FieldGet(#OBSFIN05)


assign OBSFIN05(uValue) 
self:FieldPut(#OBSFIN05, uValue)
return OBSFIN05 := uValue


access OBSFIN06() 
return self:FieldGet(#OBSFIN06)


assign OBSFIN06(uValue) 
self:FieldPut(#OBSFIN06, uValue)
return OBSFIN06 := uValue


access OS() 
return self:FieldGet(#OS)


assign OS(uValue) 
self:FieldPut(#OS, uValue)
return OS := uValue


access PF() 
return self:FieldGet(#PF)


assign PF(uValue) 
self:FieldPut(#PF, uValue)
return PF := uValue


access SAIOBS() 
return self:FieldGet(#SAIOBS)


assign SAIOBS(uValue) 
self:FieldPut(#SAIOBS, uValue)
return SAIOBS := uValue


END CLASS
