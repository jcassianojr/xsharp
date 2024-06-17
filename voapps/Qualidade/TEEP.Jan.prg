#region DEFINES
STATIC DEFINE JTEEP_ACP := 105 
STATIC DEFINE JTEEP_ACPATR := 109 
STATIC DEFINE JTEEP_AEP := 112 
STATIC DEFINE JTEEP_AEPATR := 116 
STATIC DEFINE JTEEP_BTNPEGMA01 := 142 
STATIC DEFINE JTEEP_BUSCANUM := 144 
STATIC DEFINE JTEEP_CARAC := 104 
STATIC DEFINE JTEEP_CLIENTE := 102 
STATIC DEFINE JTEEP_CLINOME := 103 
STATIC DEFINE JTEEP_CP := 113 
STATIC DEFINE JTEEP_CPK := 114 
STATIC DEFINE JTEEP_DATA := 100 
STATIC DEFINE JTEEP_DESENHO := 101 
STATIC DEFINE JTEEP_ESCCOD := 123 
STATIC DEFINE JTEEP_ESCFOR := 122 
STATIC DEFINE JTEEP_ESTAVEL := 119 
STATIC DEFINE JTEEP_FOTO := 141 
STATIC DEFINE JTEEP_IMPACP := 131 
STATIC DEFINE JTEEP_IMPAEP := 135 
STATIC DEFINE JTEEP_PLAN01 := 134 
STATIC DEFINE JTEEP_PLAN02 := 130 
STATIC DEFINE JTEEP_PLAN03 := 115 
STATIC DEFINE JTEEP_POROV := 143 
STATIC DEFINE JTEEP_PP := 106 
STATIC DEFINE JTEEP_PPK := 107 
STATIC DEFINE JTEEP_RB2 := 108 
STATIC DEFINE JTEEP_RB3 := 120 
STATIC DEFINE JTEEP_RB4 := 121 
STATIC DEFINE JTEEP_RBG1 := 108 
STATIC DEFINE JTEEP_SC_ACP := 130 
STATIC DEFINE JTEEP_SC_AEP := 136 
STATIC DEFINE JTEEP_SC_CARAC := 129 
STATIC DEFINE JTEEP_SC_CP := 137 
STATIC DEFINE JTEEP_SC_CPK := 138 
STATIC DEFINE JTEEP_SC_DATA := 125 
STATIC DEFINE JTEEP_SC_DESENHO := 126 
STATIC DEFINE JTEEP_SC_DESTINO2 := 140 
STATIC DEFINE JTEEP_SC_PLAN01 := 108 
STATIC DEFINE JTEEP_SC_PLAN02 := 126 
STATIC DEFINE JTEEP_SC_PLAN03 := 139 
STATIC DEFINE JTEEP_SC_PP := 132 
STATIC DEFINE JTEEP_SC_PPK := 133 
STATIC DEFINE JTEEP_SC_TEEP := 124 
STATIC DEFINE JTEEP_TEEP := 127 
STATIC DEFINE JTEEP_THEFIXEDTEXT12 := 128 
STATIC DEFINE JTEEP_THERADIOBUTTON4 := 110 
STATIC DEFINE JTEEP_THERADIOBUTTON5 := 111 
STATIC DEFINE JTEEP_THERADIOBUTTON6 := 117 
STATIC DEFINE JTEEP_THERADIOBUTTON7 := 118 
STATIC DEFINE JTEEP_THESINGLELINEEDIT13 := 108 
#endregion

PARTIAL class JTEEP inherit MYDataWindow 

	PROTECT oDBDESENHO as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCLINOME as DataColumn
	PROTECT oDBCARAC as DataColumn
	PROTECT oDBACP as DataColumn
	PROTECT oDBPP as DataColumn
	PROTECT oDBPPK as DataColumn
	PROTECT oDBAEP as DataColumn
	PROTECT oDBCP as DataColumn
	PROTECT oDBCPK as DataColumn
	PROTECT oDBPLAN03 as DataColumn
	PROTECT oDBTEEP as DataColumn
	PROTECT oDBPLAN01 as DataColumn
	protect oDCDATA as DATETIMEPICKER
	protect oDCDESENHO as SINGLELINEEDIT
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCCLINOME as SINGLELINEEDIT
	protect oDCCARAC as SINGLELINEEDIT
	protect oDCACP as SINGLELINEEDIT
	protect oDCPP as SINGLELINEEDIT
	protect oDCPPK as SINGLELINEEDIT
	protect oDCSC_PLAN01 as FIXEDTEXT
	protect oDCACPATR as RADIOBUTTONGROUP
	protect oCCtheRadioButton4 as RADIOBUTTON
	protect oCCtheRadioButton5 as RADIOBUTTON
	protect oDCAEP as SINGLELINEEDIT
	protect oDCCP as SINGLELINEEDIT
	protect oDCCPK as SINGLELINEEDIT
	protect oDCPLAN03 as SINGLELINEEDIT
	protect oDCAEPATR as RADIOBUTTONGROUP
	protect oCCtheRadioButton6 as RADIOBUTTON
	protect oCCtheRadioButton7 as RADIOBUTTON
	protect oDCESTAVEL as RADIOBUTTONGROUP
	protect oCCRB3 as RADIOBUTTON
	protect oCCRB4 as RADIOBUTTON
	protect oCCescfor as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oDCSC_TEEP as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_DESENHO as FIXEDTEXT
	protect oDCTEEP as SINGLELINEEDIT
	protect oDCtheFixedText12 as FIXEDTEXT
	protect oDCSC_CARAC as FIXEDTEXT
	protect oDCSC_ACP as FIXEDTEXT
	protect oCCIMPACP as PUSHBUTTON
	protect oDCSC_PP as FIXEDTEXT
	protect oDCSC_PPK as FIXEDTEXT
	protect oDCPLAN01 as SINGLELINEEDIT
	protect oCCIMPAEP as PUSHBUTTON
	protect oDCSC_AEP as FIXEDTEXT
	protect oDCSC_CP as FIXEDTEXT
	protect oDCSC_CPK as FIXEDTEXT
	protect oDCSC_PLAN03 as FIXEDTEXT
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCbtnpegma01 as PUSHBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
// 	instance DESENHO 
// 	instance CLIENTE 
// 	instance CLINOME 
// 	instance CARAC 
// 	instance ACP 
// 	instance PP 
// 	instance PPK 
// 	instance ACPATR 
// 	instance AEP 
// 	instance CP 
// 	instance CPK 
// 	instance PLAN03 
// 	instance AEPATR 
// 	instance ESTAVEL 
// 	instance TEEP 
// 	instance PLAN01 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ACP() 
return self:FieldGet(#ACP)


assign ACP(uValue) 
self:FieldPut(#ACP, uValue)
return ACP := uValue


access ACPATR() 
return self:FieldGet(#ACPATR)


assign ACPATR(uValue) 
self:FieldPut(#ACPATR, uValue)
return ACPATR := uValue


access AEP() 
return self:FieldGet(#AEP)


assign AEP(uValue) 
self:FieldPut(#AEP, uValue)
return AEP := uValue


access AEPATR() 
return self:FieldGet(#AEPATR)


assign AEPATR(uValue) 
self:FieldPut(#AEPATR, uValue)
return AEPATR := uValue


access CARAC() 
return self:FieldGet(#CARAC)


assign CARAC(uValue) 
self:FieldPut(#CARAC, uValue)
return CARAC := uValue


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


access CP() 
return self:FieldGet(#CP)


assign CP(uValue) 
self:FieldPut(#CP, uValue)
return CP := uValue


access CPK() 
return self:FieldGet(#CPK)


assign CPK(uValue) 
self:FieldPut(#CPK, uValue)
return CPK := uValue


access DESENHO() 
return self:FieldGet(#DESENHO)


assign DESENHO(uValue) 
self:FieldPut(#DESENHO, uValue)
return DESENHO := uValue


access ESTAVEL() 
return self:FieldGet(#ESTAVEL)


assign ESTAVEL(uValue) 
self:FieldPut(#ESTAVEL, uValue)
return ESTAVEL := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JTEEP",_GetInst()},iCtlID)

aFonts[1] := Font{,11,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDATA := DateTimePicker{self,ResourceID{JTEEP_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDESENHO := SingleLineEdit{self,ResourceID{JTEEP_DESENHO,_GetInst()}}
oDCDESENHO:FieldSpec := PADRAO_CHAR_24{}
oDCDESENHO:HyperLabel := HyperLabel{#DESENHO,"Desenho:",NULL_STRING,"TEEP_DESENHO"}

oDCCLIENTE := SingleLineEdit{self,ResourceID{JTEEP_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Acp:",NULL_STRING,"TEEP_ACP"}

oDCCLINOME := SingleLineEdit{self,ResourceID{JTEEP_CLINOME,_GetInst()}}
oDCCLINOME:FieldSpec := PADRAO_CHAR_50{}
oDCCLINOME:HyperLabel := HyperLabel{#CLINOME,"Carac:",NULL_STRING,"TEEP_CARAC"}

oDCCARAC := SingleLineEdit{self,ResourceID{JTEEP_CARAC,_GetInst()}}
oDCCARAC:FieldSpec := PADRAO_CHAR_40{}
oDCCARAC:HyperLabel := HyperLabel{#CARAC,"Carac:",NULL_STRING,"TEEP_CARAC"}

oDCACP := SingleLineEdit{self,ResourceID{JTEEP_ACP,_GetInst()}}
oDCACP:FieldSpec := PADRAO_NUM_08{}
oDCACP:HyperLabel := HyperLabel{#ACP,"Acp:",NULL_STRING,"TEEP_ACP"}

oDCPP := SingleLineEdit{self,ResourceID{JTEEP_PP,_GetInst()}}
oDCPP:FieldSpec := PADRAO_NUM_12_4{}
oDCPP:HyperLabel := HyperLabel{#PP,"Pp:",NULL_STRING,"TEEP_PP"}

oDCPPK := SingleLineEdit{self,ResourceID{JTEEP_PPK,_GetInst()}}
oDCPPK:FieldSpec := PADRAO_NUM_12_4{}
oDCPPK:HyperLabel := HyperLabel{#PPK,"Ppk:",NULL_STRING,"TEEP_PPK"}

oDCSC_PLAN01 := FixedText{self,ResourceID{JTEEP_SC_PLAN01,_GetInst()}}
oDCSC_PLAN01:HyperLabel := HyperLabel{#SC_PLAN01,"Plano:",NULL_STRING,NULL_STRING}

oCCtheRadioButton4 := RadioButton{self,ResourceID{JTEEP_THERADIOBUTTON4,_GetInst()}}
oCCtheRadioButton4:HyperLabel := HyperLabel{#theRadioButton4,"Sim",NULL_STRING,NULL_STRING}

oCCtheRadioButton5 := RadioButton{self,ResourceID{JTEEP_THERADIOBUTTON5,_GetInst()}}
oCCtheRadioButton5:HyperLabel := HyperLabel{#theRadioButton5,"Não",NULL_STRING,NULL_STRING}

oDCAEP := SingleLineEdit{self,ResourceID{JTEEP_AEP,_GetInst()}}
oDCAEP:FieldSpec := PADRAO_NUM_08{}
oDCAEP:HyperLabel := HyperLabel{#AEP,"Aep:",NULL_STRING,"TEEP_AEP"}

oDCCP := SingleLineEdit{self,ResourceID{JTEEP_CP,_GetInst()}}
oDCCP:FieldSpec := PADRAO_NUM_12_4{}
oDCCP:HyperLabel := HyperLabel{#CP,"Cp:",NULL_STRING,"TEEP_CP"}

oDCCPK := SingleLineEdit{self,ResourceID{JTEEP_CPK,_GetInst()}}
oDCCPK:FieldSpec := PADRAO_NUM_12_4{}
oDCCPK:HyperLabel := HyperLabel{#CPK,"Cpk:",NULL_STRING,"TEEP_CPK"}

oDCPLAN03 := SingleLineEdit{self,ResourceID{JTEEP_PLAN03,_GetInst()}}
oDCPLAN03:FieldSpec := PADRAO_NUM_08{}
oDCPLAN03:HyperLabel := HyperLabel{#PLAN03,"Plan03:",NULL_STRING,"TEEP_PLAN03"}

oCCtheRadioButton6 := RadioButton{self,ResourceID{JTEEP_THERADIOBUTTON6,_GetInst()}}
oCCtheRadioButton6:HyperLabel := HyperLabel{#theRadioButton6,"Sim",NULL_STRING,NULL_STRING}

oCCtheRadioButton7 := RadioButton{self,ResourceID{JTEEP_THERADIOBUTTON7,_GetInst()}}
oCCtheRadioButton7:HyperLabel := HyperLabel{#theRadioButton7,"Não",NULL_STRING,NULL_STRING}

oCCRB3 := RadioButton{self,ResourceID{JTEEP_RB3,_GetInst()}}
oCCRB3:HyperLabel := HyperLabel{#RB3,"Sim",NULL_STRING,NULL_STRING}

oCCRB4 := RadioButton{self,ResourceID{JTEEP_RB4,_GetInst()}}
oCCRB4:HyperLabel := HyperLabel{#RB4,"Não",NULL_STRING,NULL_STRING}

oCCescfor := PushButton{self,ResourceID{JTEEP_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JTEEP_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oDCSC_TEEP := FixedText{self,ResourceID{JTEEP_SC_TEEP,_GetInst()}}
oDCSC_TEEP:HyperLabel := HyperLabel{#SC_TEEP,"Teep:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JTEEP_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_DESENHO := FixedText{self,ResourceID{JTEEP_SC_DESENHO,_GetInst()}}
oDCSC_DESENHO:HyperLabel := HyperLabel{#SC_DESENHO,"Desenho:",NULL_STRING,NULL_STRING}

oDCTEEP := SingleLineEdit{self,ResourceID{JTEEP_TEEP,_GetInst()}}
oDCTEEP:FieldSpec := PADRAO_NUM_08{}
oDCTEEP:HyperLabel := HyperLabel{#TEEP,"Teep:",NULL_STRING,"TEEP_TEEP"}
oDCTEEP:BackGround := aBrushes[1]
oDCTEEP:Font(aFonts[1], FALSE)

oDCtheFixedText12 := FixedText{self,ResourceID{JTEEP_THEFIXEDTEXT12,_GetInst()}}
oDCtheFixedText12:HyperLabel := HyperLabel{#theFixedText12,"Cliente:",NULL_STRING,NULL_STRING}

oDCSC_CARAC := FixedText{self,ResourceID{JTEEP_SC_CARAC,_GetInst()}}
oDCSC_CARAC:HyperLabel := HyperLabel{#SC_CARAC,"Caracteristica:",NULL_STRING,NULL_STRING}

oDCSC_ACP := FixedText{self,ResourceID{JTEEP_SC_ACP,_GetInst()}}
oDCSC_ACP:HyperLabel := HyperLabel{#SC_ACP,"Acp:",NULL_STRING,NULL_STRING}

oCCIMPACP := PushButton{self,ResourceID{JTEEP_IMPACP,_GetInst()}}
oCCIMPACP:HyperLabel := HyperLabel{#IMPACP,"Importar",NULL_STRING,NULL_STRING}

oDCSC_PP := FixedText{self,ResourceID{JTEEP_SC_PP,_GetInst()}}
oDCSC_PP:HyperLabel := HyperLabel{#SC_PP,"Pp:",NULL_STRING,NULL_STRING}

oDCSC_PPK := FixedText{self,ResourceID{JTEEP_SC_PPK,_GetInst()}}
oDCSC_PPK:HyperLabel := HyperLabel{#SC_PPK,"Ppk:",NULL_STRING,NULL_STRING}

oDCPLAN01 := SingleLineEdit{self,ResourceID{JTEEP_PLAN01,_GetInst()}}
oDCPLAN01:FieldSpec := PADRAO_NUM_08{}
oDCPLAN01:HyperLabel := HyperLabel{#PLAN01,"Plan01:",NULL_STRING,"TEEP_PLAN01"}

oCCIMPAEP := PushButton{self,ResourceID{JTEEP_IMPAEP,_GetInst()}}
oCCIMPAEP:HyperLabel := HyperLabel{#IMPAEP,"Importar",NULL_STRING,NULL_STRING}

oDCSC_AEP := FixedText{self,ResourceID{JTEEP_SC_AEP,_GetInst()}}
oDCSC_AEP:HyperLabel := HyperLabel{#SC_AEP,"Aep:",NULL_STRING,NULL_STRING}

oDCSC_CP := FixedText{self,ResourceID{JTEEP_SC_CP,_GetInst()}}
oDCSC_CP:HyperLabel := HyperLabel{#SC_CP,"Cp:",NULL_STRING,NULL_STRING}

oDCSC_CPK := FixedText{self,ResourceID{JTEEP_SC_CPK,_GetInst()}}
oDCSC_CPK:HyperLabel := HyperLabel{#SC_CPK,"Cpk:",NULL_STRING,NULL_STRING}

oDCSC_PLAN03 := FixedText{self,ResourceID{JTEEP_SC_PLAN03,_GetInst()}}
oDCSC_PLAN03:HyperLabel := HyperLabel{#SC_PLAN03,"Plano:",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JTEEP_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JTEEP_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oCCbtnpegma01 := PushButton{self,ResourceID{JTEEP_BTNPEGMA01,_GetInst()}}
oCCbtnpegma01:HyperLabel := HyperLabel{#btnpegma01,"->",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JTEEP_POROV,_GetInst()}}
oCCporov:Image := ICO_AZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Organizar por Numero GC"

oCCbuscanum := PushButton{self,ResourceID{JTEEP_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Localizar um GC"

oDCACPATR := RadioButtonGroup{self,ResourceID{JTEEP_ACPATR,_GetInst()}}
oDCACPATR:FillUsing({ ;
						{oCCtheRadioButton4,"S"}, ;
						{oCCtheRadioButton5,"N"} ;
						})
oDCACPATR:HyperLabel := HyperLabel{#ACPATR,"Atributo",NULL_STRING,NULL_STRING}
oDCACPATR:FieldSpec := PADRAO_CHAR_01{}

oDCAEPATR := RadioButtonGroup{self,ResourceID{JTEEP_AEPATR,_GetInst()}}
oDCAEPATR:FillUsing({ ;
						{oCCtheRadioButton6,"S"}, ;
						{oCCtheRadioButton7,"N"} ;
						})
oDCAEPATR:HyperLabel := HyperLabel{#AEPATR,"Atributo",NULL_STRING,NULL_STRING}
oDCAEPATR:FieldSpec := PADRAO_CHAR_01{}

oDCESTAVEL := RadioButtonGroup{self,ResourceID{JTEEP_ESTAVEL,_GetInst()}}
oDCESTAVEL:FillUsing({ ;
						{oCCRB3,"S"}, ;
						{oCCRB4,"N"} ;
						})
oDCESTAVEL:HyperLabel := HyperLabel{#ESTAVEL,"Estavel",NULL_STRING,NULL_STRING}
oDCESTAVEL:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "Tabela de Estudos Estatisticos de Processo"
self:HyperLabel := HyperLabel{#JTEEP,"Tabela de Estudos Estatisticos de Processo",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDESENHO := DataColumn{PADRAO_CHAR_24{}}
oDBDESENHO:Width := 9
oDBDESENHO:HyperLabel := oDCDESENHO:HyperLabel 
oDBDESENHO:Caption := "Desenho:"
self:Browser:AddColumn(oDBDESENHO)

oDBCLIENTE := DataColumn{PADRAO_NUM_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Acp:"
self:Browser:AddColumn(oDBCLIENTE)

oDBCLINOME := DataColumn{PADRAO_CHAR_50{}}
oDBCLINOME:Width := 9
oDBCLINOME:HyperLabel := oDCCLINOME:HyperLabel 
oDBCLINOME:Caption := "Carac:"
self:Browser:AddColumn(oDBCLINOME)

oDBCARAC := DataColumn{PADRAO_CHAR_40{}}
oDBCARAC:Width := 7
oDBCARAC:HyperLabel := oDCCARAC:HyperLabel 
oDBCARAC:Caption := "Carac:"
self:Browser:AddColumn(oDBCARAC)

oDBACP := DataColumn{PADRAO_NUM_08{}}
oDBACP:Width := 5
oDBACP:HyperLabel := oDCACP:HyperLabel 
oDBACP:Caption := "Acp:"
self:Browser:AddColumn(oDBACP)

oDBPP := DataColumn{PADRAO_NUM_12_4{}}
oDBPP:Width := 4
oDBPP:HyperLabel := oDCPP:HyperLabel 
oDBPP:Caption := "Pp:"
self:Browser:AddColumn(oDBPP)

oDBPPK := DataColumn{PADRAO_NUM_12_4{}}
oDBPPK:Width := 5
oDBPPK:HyperLabel := oDCPPK:HyperLabel 
oDBPPK:Caption := "Ppk:"
self:Browser:AddColumn(oDBPPK)

oDBAEP := DataColumn{PADRAO_NUM_08{}}
oDBAEP:Width := 5
oDBAEP:HyperLabel := oDCAEP:HyperLabel 
oDBAEP:Caption := "Aep:"
self:Browser:AddColumn(oDBAEP)

oDBCP := DataColumn{PADRAO_NUM_12_4{}}
oDBCP:Width := 4
oDBCP:HyperLabel := oDCCP:HyperLabel 
oDBCP:Caption := "Cp:"
self:Browser:AddColumn(oDBCP)

oDBCPK := DataColumn{PADRAO_NUM_12_4{}}
oDBCPK:Width := 5
oDBCPK:HyperLabel := oDCCPK:HyperLabel 
oDBCPK:Caption := "Cpk:"
self:Browser:AddColumn(oDBCPK)

oDBPLAN03 := DataColumn{PADRAO_NUM_08{}}
oDBPLAN03:Width := 8
oDBPLAN03:HyperLabel := oDCPLAN03:HyperLabel 
oDBPLAN03:Caption := "Plan03:"
self:Browser:AddColumn(oDBPLAN03)

oDBTEEP := DataColumn{PADRAO_NUM_08{}}
oDBTEEP:Width := 6
oDBTEEP:HyperLabel := oDCTEEP:HyperLabel 
oDBTEEP:Caption := "Teep:"
oDBTEEP:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTEEP)

oDBPLAN01 := DataColumn{PADRAO_NUM_08{}}
oDBPLAN01:Width := 8
oDBPLAN01:HyperLabel := oDCPLAN01:HyperLabel 
oDBPLAN01:Caption := "Plan01:"
self:Browser:AddColumn(oDBPLAN01)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


ACCESS P1() 
RETURN self:FieldGet(#P1)


ACCESS P2() 
RETURN self:FieldGet(#P2)


access PLAN01() 
return self:FieldGet(#PLAN01)


assign PLAN01(uValue) 
self:FieldPut(#PLAN01, uValue)
return PLAN01 := uValue


ACCESS PLAN02() 
RETURN self:FieldGet(#PLAN02)


access PLAN03() 
return self:FieldGet(#PLAN03)


assign PLAN03(uValue) 
self:FieldPut(#PLAN03, uValue)
return PLAN03 := uValue


access PP() 
return self:FieldGet(#PP)


assign PP(uValue) 
self:FieldPut(#PP, uValue)
return PP := uValue


access PPK() 
return self:FieldGet(#PPK)


assign PPK(uValue) 
self:FieldPut(#PPK, uValue)
return PPK := uValue


ACCESS RBG1() 
RETURN self:FieldGet(#RBG1)


ACCESS RR() 
RETURN self:FieldGet(#RR)


access TEEP() 
return self:FieldGet(#TEEP)


assign TEEP(uValue) 
self:FieldPut(#TEEP, uValue)
return TEEP := uValue


END CLASS
