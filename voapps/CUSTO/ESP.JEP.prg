#region DEFINES
STATIC DEFINE JEP_ALTERA2 := 177 
STATIC DEFINE JEP_ALTERAR := 171 
STATIC DEFINE JEP_ANTERIO2 := 104 
STATIC DEFINE JEP_ANTERIOR := 138 
STATIC DEFINE JEP_BUSCAOV := 123 
STATIC DEFINE JEP_CAPPRO := 140 
STATIC DEFINE JEP_CHECAR := 142 
STATIC DEFINE JEP_CLIENTE := 156 
STATIC DEFINE JEP_CMDESCMP01 := 116 
STATIC DEFINE JEP_CMDESCMP02 := 117 
STATIC DEFINE JEP_CMDESCMP02B := 115 
STATIC DEFINE JEP_CMDESCMP2 := 154 
STATIC DEFINE JEP_CMDTCO := 112 
STATIC DEFINE JEP_CMDTETI := 109 
STATIC DEFINE JEP_CMDTMP := 111 
STATIC DEFINE JEP_CMDTTR := 110 
STATIC DEFINE JEP_CODIGO := 168 
STATIC DEFINE JEP_COGCLI := 163 
STATIC DEFINE JEP_DUNS := 120 
STATIC DEFINE JEP_EDITARVIA := 148 
STATIC DEFINE JEP_ELADAT := 127 
STATIC DEFINE JEP_ELAHOR := 128 
STATIC DEFINE JEP_ELANOM := 125 
STATIC DEFINE JEP_ELANUM := 126 
STATIC DEFINE JEP_EMAILVIA := 146 
STATIC DEFINE JEP_ESCC := 133 
STATIC DEFINE JEP_ESCI := 131 
STATIC DEFINE JEP_ESCM := 132 
STATIC DEFINE JEP_ESCT := 130 
STATIC DEFINE JEP_EXCLUI2 := 179 
STATIC DEFINE JEP_EXCLUIR := 174 
STATIC DEFINE JEP_EXCLUIRVIA := 151 
STATIC DEFINE JEP_FIXEDTEXT12 := 124 
STATIC DEFINE JEP_FIXEDTEXT34 := 139 
STATIC DEFINE JEP_FOTO := 144 
STATIC DEFINE JEP_IMP := 135 
STATIC DEFINE JEP_IMPEST := 141 
STATIC DEFINE JEP_IMPMANA5 := 100 
STATIC DEFINE JEP_INCLUI2 := 178 
STATIC DEFINE JEP_INCLUIR := 173 
STATIC DEFINE JEP_JEPTAB := 129 
STATIC DEFINE JEP_JSEQ := 175 
STATIC DEFINE JEP_JVCE := 172 
STATIC DEFINE JEP_JVIAREV := 153 
STATIC DEFINE JEP_JVIII := 147 
STATIC DEFINE JEP_LANU := 164 
STATIC DEFINE JEP_LMES := 165 
STATIC DEFINE JEP_LMIN := 166 
STATIC DEFINE JEP_NAC := 136 
STATIC DEFINE JEP_NOME := 169 
STATIC DEFINE JEP_NOVOVIA := 152 
STATIC DEFINE JEP_OV := 162 
STATIC DEFINE JEP_OVREV := 145 
STATIC DEFINE JEP_POROV := 122 
STATIC DEFINE JEP_PRAZO := 105 
STATIC DEFINE JEP_PROJETO := 118 
STATIC DEFINE JEP_PROXIM2 := 103 
STATIC DEFINE JEP_PROXIMO := 137 
STATIC DEFINE JEP_REV := 102 
STATIC DEFINE JEP_SC_CLIENTE := 155 
STATIC DEFINE JEP_SC_CODIGO := 167 
STATIC DEFINE JEP_SC_DESTINO2 := 143 
STATIC DEFINE JEP_SC_EAC1 := 121 
STATIC DEFINE JEP_SC_EAC2 := 119 
STATIC DEFINE JEP_SC_OV := 158 
STATIC DEFINE JEP_SC_REV := 101 
STATIC DEFINE JEP_SITUACAOVIA := 150 
STATIC DEFINE JEP_SUB := 114 
STATIC DEFINE JEP_SUBMAQ := 113 
STATIC DEFINE JEP_TABULA2 := 176 
STATIC DEFINE JEP_TABULAR := 170 
STATIC DEFINE JEP_TABULARVIA := 149 
STATIC DEFINE JEP_THEFIXEDTEXT19 := 161 
STATIC DEFINE JEP_THEFIXEDTEXT20 := 159 
STATIC DEFINE JEP_THEFIXEDTEXT21 := 160 
STATIC DEFINE JEP_THEFIXEDTEXT22 := 106 
STATIC DEFINE JEP_THEFIXEDTEXT23 := 107 
STATIC DEFINE JEP_THEGROUPBOX1 := 157 
STATIC DEFINE JEP_VERPCP := 134 
STATIC DEFINE JEP_VIABILI := 108 
STATIC DEFINE JEPTAB_PAGE4_OBSP01 := 100 
STATIC DEFINE JEPTAB_PAGE4_OBSP02 := 101 
STATIC DEFINE JETTAB_01_OBS01 := 100 
STATIC DEFINE JETTAB_01_OBS02 := 101 
STATIC DEFINE JETTAB_01_OBS03 := 102 
STATIC DEFINE JETTAB_01_OBS04 := 103 
STATIC DEFINE JETTAB_01_OBS05 := 104 
STATIC DEFINE JETTAB_01_OBS06 := 105 
STATIC DEFINE JETTAB_01_OBS07 := 106 
STATIC DEFINE JETTAB_01_OBS08 := 107 
STATIC DEFINE JETTAB_02_OBC01 := 100 
STATIC DEFINE JETTAB_02_OBC02 := 101 
STATIC DEFINE JETTAB_02_OBC03 := 102 
STATIC DEFINE JETTAB_02_OBC04 := 103 
STATIC DEFINE JETTAB_02_OBC05 := 104 
STATIC DEFINE JETTAB_03_OBE01 := 100 
STATIC DEFINE JETTAB_03_OBE02 := 101 
STATIC DEFINE JETTAB_03_OBE03 := 102 
STATIC DEFINE JPO_COM := 116 
STATIC DEFINE JPO_PUSHBUTTON2 := 132 
#endregion

class JEP inherit MYDataWindow 

	PROTECT oDBOV as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBREV as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCOGCLI as DataColumn
	protect oCCImpMANA5 as PUSHBUTTON
	protect oDCSC_REV as FIXEDTEXT
	protect oDCREV as SINGLELINEEDIT
	protect oCCProxim2 as PUSHBUTTON
	protect oCCAnterio2 as PUSHBUTTON
	protect oDCPRAZO as SINGLELINEEDIT
	protect oDCtheFixedText22 as FIXEDTEXT
	protect oDCtheFixedText23 as FIXEDTEXT
	protect oDCVIABILI as SINGLELINEEDIT
	protect oCCcmdtETI as PUSHBUTTON
	protect oCCcmdtTR as PUSHBUTTON
	protect oCCcmdtmp as PUSHBUTTON
	protect oCCcmdtco as PUSHBUTTON
	protect oCCSubMaq as PUSHBUTTON
	protect oDCSUB as SINGLELINEEDIT
	protect oCCcmdescmp02b as PUSHBUTTON
	protect oCCcmdescmp01 as PUSHBUTTON
	protect oCCcmdescmp02 as PUSHBUTTON
	protect oDCPROJETO as SINGLELINEEDIT
	protect oDCSC_EAC2 as FIXEDTEXT
	protect oDCDUNS as SINGLELINEEDIT
	protect oDCSC_EAC1 as FIXEDTEXT
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oDCFixedText12 as FIXEDTEXT
	protect oDCELANOM as SINGLELINEEDIT
	protect oDCELANUM as SINGLELINEEDIT
	protect oDCELADAT as SINGLELINEEDIT
	protect oDCELAHOR as SINGLELINEEDIT
	protect oDCJEPTAB as TABCONTROL
	protect oTPJETTAB_01 as JETTAB_01
	protect oTPJETTAB_02 as JETTAB_02
	protect oTPJETTAB_03 as JETTAB_03
	protect oTPJEPTAB_PAGE4 as JEPTAB_PAGE4
	protect oCCescT as PUSHBUTTON
	protect oCCescI as PUSHBUTTON
	protect oCCescM as PUSHBUTTON
	protect oCCescC as PUSHBUTTON
	protect oCCVerPcp as PUSHBUTTON
	protect oCCImp as PUSHBUTTON
	protect oCCNac as PUSHBUTTON
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oDCFixedText34 as FIXEDTEXT
	protect oDCCAPPRO as SINGLELINEEDIT
	protect oCCImpEst as PUSHBUTTON
	protect oCCCHECAR as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oDCOVREV as SINGLELINEEDIT
	protect oCCEmailVIA as PUSHBUTTON
	protect oCCEditarVIA as PUSHBUTTON
	protect oCCTabularVIA as PUSHBUTTON
	protect oCCSituacaoVIA as PUSHBUTTON
	protect oCCExcluirVIA as PUSHBUTTON
	protect oCCNovoVIA as PUSHBUTTON
	protect oCCcmdescmp2 as PUSHBUTTON
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCtheGroupBox1 as GROUPBOX
	protect oDCSC_OV as FIXEDTEXT
	protect oDCtheFixedText20 as FIXEDTEXT
	protect oDCtheFixedText21 as FIXEDTEXT
	protect oDCtheFixedText19 as FIXEDTEXT
	protect oDCOV as SINGLELINEEDIT
	protect oDCCOGCLI as SINGLELINEEDIT
	protect oDCLANU as SINGLELINEEDIT
	protect oDCLMES as SINGLELINEEDIT
	protect oDCLMIN as SINGLELINEEDIT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oCCTABULAR as PUSHBUTTON
	protect oCCALTERAR as PUSHBUTTON
	protect oCCIncluir as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCTABULA2 as PUSHBUTTON
	protect oCCALTERA2 as PUSHBUTTON
	protect oCCINCLUI2 as PUSHBUTTON
	protect oCCEXCLUI2 as PUSHBUTTON
// 	instance REV 
// 	instance PRAZO 
// 	instance VIABILI 
// 	instance SUB 
// 	instance PROJETO 
// 	instance DUNS 
// 	instance ELANOM 
// 	instance ELANUM 
// 	instance ELADAT 
// 	instance ELAHOR 
// 	instance CAPPRO 
// 	instance OVREV 
// 	instance CLIENTE 
// 	instance OV 
// 	instance COGCLI 
// 	instance LANU 
// 	instance LMES 
// 	instance LMIN 
// 	instance CODIGO 
// 	instance NOME 
	protect oSFJVIII as JVIII
	protect oSFJVIAREV as JVIAREV
	protect oSFJVCE as JVCE
	protect oSFJSEQ as JSEQ

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CAPPRO() 
return self:FieldGet(#CAPPRO)


assign CAPPRO(uValue) 
self:FieldPut(#CAPPRO, uValue)
return CAPPRO := uValue


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

SUPER(oWindow,ResourceID{"JEP",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oCCImpMANA5 := PushButton{self,ResourceID{JEP_IMPMANA5,_GetInst()}}
oCCImpMANA5:HyperLabel := HyperLabel{#ImpMANA5,_chr(38)+"Importar PCP",NULL_STRING,NULL_STRING}

oDCSC_REV := FixedText{self,ResourceID{JEP_SC_REV,_GetInst()}}
oDCSC_REV:HyperLabel := HyperLabel{#SC_REV,"Rev:",NULL_STRING,NULL_STRING}

oDCREV := SingleLineEdit{self,ResourceID{JEP_REV,_GetInst()}}
oDCREV:FieldSpec := padrao_char_01{}
oDCREV:HyperLabel := HyperLabel{#REV,"Rev:",NULL_STRING,"VPORC_REV"}
oDCREV:BackGround := aBrushes[1]
oDCREV:Font(aFonts[1], FALSE)

oCCProxim2 := PushButton{self,ResourceID{JEP_PROXIM2,_GetInst()}}
oCCProxim2:HyperLabel := HyperLabel{#Proxim2,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProxim2:Image := ico_next{}

oCCAnterio2 := PushButton{self,ResourceID{JEP_ANTERIO2,_GetInst()}}
oCCAnterio2:HyperLabel := HyperLabel{#Anterio2,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterio2:Image := ico_previous{}

oDCPRAZO := SingleLineEdit{self,ResourceID{JEP_PRAZO,_GetInst()}}
oDCPRAZO:FieldSpec := date_field{}
oDCPRAZO:HyperLabel := HyperLabel{#PRAZO,"Lmes:",NULL_STRING,"VPORC_PRAZO"}
oDCPRAZO:BackGround := aBrushes[1]

oDCtheFixedText22 := FixedText{self,ResourceID{JEP_THEFIXEDTEXT22,_GetInst()}}
oDCtheFixedText22:HyperLabel := HyperLabel{#theFixedText22,"Prazo",NULL_STRING,NULL_STRING}

oDCtheFixedText23 := FixedText{self,ResourceID{JEP_THEFIXEDTEXT23,_GetInst()}}
oDCtheFixedText23:HyperLabel := HyperLabel{#theFixedText23,"Viabilidade",NULL_STRING,NULL_STRING}

oDCVIABILI := SingleLineEdit{self,ResourceID{JEP_VIABILI,_GetInst()}}
oDCVIABILI:FieldSpec := padrao_num_08{}
oDCVIABILI:HyperLabel := HyperLabel{#VIABILI,"Lmes:",NULL_STRING,"VPORC_PRAZO"}
oDCVIABILI:Font(aFonts[1], FALSE)
oDCVIABILI:BackGround := aBrushes[1]

oCCcmdtETI := PushButton{self,ResourceID{JEP_CMDTETI,_GetInst()}}
oCCcmdtETI:HyperLabel := HyperLabel{#cmdtETI,"I",NULL_STRING,NULL_STRING}

oCCcmdtTR := PushButton{self,ResourceID{JEP_CMDTTR,_GetInst()}}
oCCcmdtTR:HyperLabel := HyperLabel{#cmdtTR,"T",NULL_STRING,NULL_STRING}

oCCcmdtmp := PushButton{self,ResourceID{JEP_CMDTMP,_GetInst()}}
oCCcmdtmp:HyperLabel := HyperLabel{#cmdtmp,"M",NULL_STRING,NULL_STRING}

oCCcmdtco := PushButton{self,ResourceID{JEP_CMDTCO,_GetInst()}}
oCCcmdtco:HyperLabel := HyperLabel{#cmdtco,"C",NULL_STRING,NULL_STRING}

oCCSubMaq := PushButton{self,ResourceID{JEP_SUBMAQ,_GetInst()}}
oCCSubMaq:HyperLabel := HyperLabel{#SubMaq,"SubMaq",NULL_STRING,NULL_STRING}
oCCSubMaq:TooltipText := "Incluir Uma Sub Maquina"

oDCSUB := SingleLineEdit{self,ResourceID{JEP_SUB,_GetInst()}}
oDCSUB:HyperLabel := HyperLabel{#SUB,NULL_STRING,NULL_STRING,"VPORC_CLIENTE"}

oCCcmdescmp02b := PushButton{self,ResourceID{JEP_CMDESCMP02B,_GetInst()}}
oCCcmdescmp02b:HyperLabel := HyperLabel{#cmdescmp02b,"..Op2",NULL_STRING,NULL_STRING}

oCCcmdescmp01 := PushButton{self,ResourceID{JEP_CMDESCMP01,_GetInst()}}
oCCcmdescmp01:HyperLabel := HyperLabel{#cmdescmp01,"..E",NULL_STRING,NULL_STRING}

oCCcmdescmp02 := PushButton{self,ResourceID{JEP_CMDESCMP02,_GetInst()}}
oCCcmdescmp02:HyperLabel := HyperLabel{#cmdescmp02,"..Op1",NULL_STRING,NULL_STRING}

oDCPROJETO := SingleLineEdit{self,ResourceID{JEP_PROJETO,_GetInst()}}
oDCPROJETO:FieldSpec := padrao_char_20{}
oDCPROJETO:HyperLabel := HyperLabel{#PROJETO,"Normat:",NULL_STRING,"VIABILI_NORMAT"}
oDCPROJETO:BackGround := aBrushes[1]

oDCSC_EAC2 := FixedText{self,ResourceID{JEP_SC_EAC2,_GetInst()}}
oDCSC_EAC2:HyperLabel := HyperLabel{#SC_EAC2,"Projeto",NULL_STRING,NULL_STRING}

oDCDUNS := SingleLineEdit{self,ResourceID{JEP_DUNS,_GetInst()}}
oDCDUNS:FieldSpec := padrao_char_30{}
oDCDUNS:HyperLabel := HyperLabel{#DUNS,"Eac:",NULL_STRING,"VIABILI_EAC"}
oDCDUNS:BackGround := aBrushes[1]

oDCSC_EAC1 := FixedText{self,ResourceID{JEP_SC_EAC1,_GetInst()}}
oDCSC_EAC1:HyperLabel := HyperLabel{#SC_EAC1,"Duns",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JEP_POROV,_GetInst()}}
oCCporov:Image := ico_az{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaov := PushButton{self,ResourceID{JEP_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ico_find{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText12 := FixedText{self,ResourceID{JEP_FIXEDTEXT12,_GetInst()}}
oDCFixedText12:HyperLabel := HyperLabel{#FixedText12,"Liberaçao",NULL_STRING,NULL_STRING}

oDCELANOM := SingleLineEdit{self,ResourceID{JEP_ELANOM,_GetInst()}}
oDCELANOM:FieldSpec := padrao_char_40{}
oDCELANOM:HyperLabel := HyperLabel{#ELANOM,"Nome:",NULL_STRING,"VPORC_NOME"}
oDCELANOM:FocusSelect := FSEL_HOME
oDCELANOM:BackGround := aBrushes[1]

oDCELANUM := SingleLineEdit{self,ResourceID{JEP_ELANUM,_GetInst()}}
oDCELANUM:FieldSpec := padrao_num_08{}
oDCELANUM:HyperLabel := HyperLabel{#ELANUM,"Codigo:",NULL_STRING,"VPORC_CODIGO"}
oDCELANUM:FocusSelect := FSEL_HOME
oDCELANUM:BackGround := aBrushes[1]

oDCELADAT := SingleLineEdit{self,ResourceID{JEP_ELADAT,_GetInst()}}
oDCELADAT:FieldSpec := date_field{}
oDCELADAT:HyperLabel := HyperLabel{#ELADAT,"Codigo:",NULL_STRING,"VPORC_CODIGO"}
oDCELADAT:FocusSelect := FSEL_HOME
oDCELADAT:BackGround := aBrushes[1]

oDCELAHOR := SingleLineEdit{self,ResourceID{JEP_ELAHOR,_GetInst()}}
oDCELAHOR:FieldSpec := padrao_char_08{}
oDCELAHOR:HyperLabel := HyperLabel{#ELAHOR,"Codigo:",NULL_STRING,"VPORC_CODIGO"}
oDCELAHOR:FocusSelect := FSEL_HOME
oDCELAHOR:BackGround := aBrushes[1]

oDCJEPTAB := TabControl{self,ResourceID{JEP_JEPTAB,_GetInst()}}
oDCJEPTAB:HyperLabel := HyperLabel{#JEPTAB,NULL_STRING,NULL_STRING,NULL_STRING}

oCCescT := PushButton{self,ResourceID{JEP_ESCT,_GetInst()}}
oCCescT:HyperLabel := HyperLabel{#escT,"..T",NULL_STRING,NULL_STRING}

oCCescI := PushButton{self,ResourceID{JEP_ESCI,_GetInst()}}
oCCescI:HyperLabel := HyperLabel{#escI,"..I",NULL_STRING,NULL_STRING}

oCCescM := PushButton{self,ResourceID{JEP_ESCM,_GetInst()}}
oCCescM:HyperLabel := HyperLabel{#escM,"..M",NULL_STRING,NULL_STRING}

oCCescC := PushButton{self,ResourceID{JEP_ESCC,_GetInst()}}
oCCescC:HyperLabel := HyperLabel{#escC,"..C",NULL_STRING,NULL_STRING}

oCCVerPcp := PushButton{self,ResourceID{JEP_VERPCP,_GetInst()}}
oCCVerPcp:HyperLabel := HyperLabel{#VerPcp,"Ver Pcp",NULL_STRING,NULL_STRING}

oCCImp := PushButton{self,ResourceID{JEP_IMP,_GetInst()}}
oCCImp:HyperLabel := HyperLabel{#Imp,"Imp",NULL_STRING,NULL_STRING}

oCCNac := PushButton{self,ResourceID{JEP_NAC,_GetInst()}}
oCCNac:HyperLabel := HyperLabel{#Nac,"Nac.",NULL_STRING,NULL_STRING}

oCCProximo := PushButton{self,ResourceID{JEP_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_next{}

oCCAnterior := PushButton{self,ResourceID{JEP_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_previous{}

oDCFixedText34 := FixedText{self,ResourceID{JEP_FIXEDTEXT34,_GetInst()}}
oDCFixedText34:HyperLabel := HyperLabel{#FixedText34,"Capacidade Produtiva",NULL_STRING,NULL_STRING}

oDCCAPPRO := SingleLineEdit{self,ResourceID{JEP_CAPPRO,_GetInst()}}
oDCCAPPRO:FieldSpec := padrao_char_05{}
oDCCAPPRO:HyperLabel := HyperLabel{#CAPPRO,"Cliente:",NULL_STRING,"VPORC_CLIENTE"}

oCCImpEst := PushButton{self,ResourceID{JEP_IMPEST,_GetInst()}}
oCCImpEst:HyperLabel := HyperLabel{#ImpEst,_chr(38)+"Imp Estimativa",NULL_STRING,NULL_STRING}

oCCCHECAR := PushButton{self,ResourceID{JEP_CHECAR,_GetInst()}}
oCCCHECAR:HyperLabel := HyperLabel{#CHECAR,"Checar",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JEP_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JEP_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oDCOVREV := SingleLineEdit{self,ResourceID{JEP_OVREV,_GetInst()}}
oDCOVREV:FieldSpec := padrao_char_01{}
oDCOVREV:HyperLabel := HyperLabel{#OVREV,"Ov:",NULL_STRING,"VIABILI_OV"}
oDCOVREV:BackGround := aBrushes[1]
oDCOVREV:Font(aFonts[1], FALSE)

oCCEmailVIA := PushButton{self,ResourceID{JEP_EMAILVIA,_GetInst()}}
oCCEmailVIA:HyperLabel := HyperLabel{#EmailVIA,"Email",NULL_STRING,NULL_STRING}

oCCEditarVIA := PushButton{self,ResourceID{JEP_EDITARVIA,_GetInst()}}
oCCEditarVIA:HyperLabel := HyperLabel{#EditarVIA,"Editar",NULL_STRING,NULL_STRING}

oCCTabularVIA := PushButton{self,ResourceID{JEP_TABULARVIA,_GetInst()}}
oCCTabularVIA:HyperLabel := HyperLabel{#TabularVIA,"Ver Itens",NULL_STRING,NULL_STRING}

oCCSituacaoVIA := PushButton{self,ResourceID{JEP_SITUACAOVIA,_GetInst()}}
oCCSituacaoVIA:HyperLabel := HyperLabel{#SituacaoVIA,"Situação",NULL_STRING,NULL_STRING}

oCCExcluirVIA := PushButton{self,ResourceID{JEP_EXCLUIRVIA,_GetInst()}}
oCCExcluirVIA:HyperLabel := HyperLabel{#ExcluirVIA,"Excluir",NULL_STRING,NULL_STRING}

oCCNovoVIA := PushButton{self,ResourceID{JEP_NOVOVIA,_GetInst()}}
oCCNovoVIA:HyperLabel := HyperLabel{#NovoVIA,"Novo",NULL_STRING,NULL_STRING}

oCCcmdescmp2 := PushButton{self,ResourceID{JEP_CMDESCMP2,_GetInst()}}
oCCcmdescmp2:HyperLabel := HyperLabel{#cmdescmp2,"FX",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{JEP_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCCLIENTE := SingleLineEdit{self,ResourceID{JEP_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"VPORC_CLIENTE"}
oDCCLIENTE:FocusSelect := FSEL_HOME
oDCCLIENTE:BackGround := aBrushes[1]

oDCtheGroupBox1 := GroupBox{self,ResourceID{JEP_THEGROUPBOX1,_GetInst()}}
oDCtheGroupBox1:HyperLabel := HyperLabel{#theGroupBox1,"Lotes",NULL_STRING,NULL_STRING}

oDCSC_OV := FixedText{self,ResourceID{JEP_SC_OV,_GetInst()}}
oDCSC_OV:HyperLabel := HyperLabel{#SC_OV,"Ov:",NULL_STRING,NULL_STRING}

oDCtheFixedText20 := FixedText{self,ResourceID{JEP_THEFIXEDTEXT20,_GetInst()}}
oDCtheFixedText20:HyperLabel := HyperLabel{#theFixedText20,"Mensal",NULL_STRING,NULL_STRING}

oDCtheFixedText21 := FixedText{self,ResourceID{JEP_THEFIXEDTEXT21,_GetInst()}}
oDCtheFixedText21:HyperLabel := HyperLabel{#theFixedText21,"Minimo",NULL_STRING,NULL_STRING}

oDCtheFixedText19 := FixedText{self,ResourceID{JEP_THEFIXEDTEXT19,_GetInst()}}
oDCtheFixedText19:HyperLabel := HyperLabel{#theFixedText19,"Anual",NULL_STRING,NULL_STRING}

oDCOV := SingleLineEdit{self,ResourceID{JEP_OV,_GetInst()}}
oDCOV:FieldSpec := PADRAO_NUM_08{}
oDCOV:HyperLabel := HyperLabel{#OV,"Ov:",NULL_STRING,"VPORC_OV"}
oDCOV:FocusSelect := FSEL_HOME
oDCOV:BackGround := aBrushes[1]

oDCCOGCLI := SingleLineEdit{self,ResourceID{JEP_COGCLI,_GetInst()}}
oDCCOGCLI:FieldSpec := PADRAO_Char_12{}
oDCCOGCLI:HyperLabel := HyperLabel{#COGCLI,"Cognome",NULL_STRING,"VPORC_COGCLI"}
oDCCOGCLI:FocusSelect := FSEL_HOME
oDCCOGCLI:BackGround := aBrushes[1]

oDCLANU := SingleLineEdit{self,ResourceID{JEP_LANU,_GetInst()}}
oDCLANU:FieldSpec := padrao_num_07{}
oDCLANU:HyperLabel := HyperLabel{#LANU,"Lanu:",NULL_STRING,"VPORC_LANU"}
oDCLANU:FocusSelect := FSEL_HOME
oDCLANU:BackGround := aBrushes[1]

oDCLMES := SingleLineEdit{self,ResourceID{JEP_LMES,_GetInst()}}
oDCLMES:FieldSpec := padrao_num_07{}
oDCLMES:HyperLabel := HyperLabel{#LMES,"Lmes:",NULL_STRING,"VPORC_LMES"}
oDCLMES:BackGround := aBrushes[1]

oDCLMIN := SingleLineEdit{self,ResourceID{JEP_LMIN,_GetInst()}}
oDCLMIN:FieldSpec := padrao_num_07{}
oDCLMIN:HyperLabel := HyperLabel{#LMIN,"Lmin:",NULL_STRING,"VPORC_LMIN"}
oDCLMIN:FocusSelect := FSEL_HOME
oDCLMIN:BackGround := aBrushes[1]

oDCSC_CODIGO := FixedText{self,ResourceID{JEP_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JEP_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"VPORC_CODIGO"}
oDCCODIGO:FocusSelect := FSEL_HOME
oDCCODIGO:Font(aFonts[1], FALSE)
oDCCODIGO:BackGround := aBrushes[1]

oDCNOME := SingleLineEdit{self,ResourceID{JEP_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_75{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"VPORC_NOME"}
oDCNOME:FocusSelect := FSEL_HOME
oDCNOME:BackGround := aBrushes[1]

oCCTABULAR := PushButton{self,ResourceID{JEP_TABULAR,_GetInst()}}
oCCTABULAR:HyperLabel := HyperLabel{#TABULAR,"Ver Itens",NULL_STRING,NULL_STRING}

oCCALTERAR := PushButton{self,ResourceID{JEP_ALTERAR,_GetInst()}}
oCCALTERAR:HyperLabel := HyperLabel{#ALTERAR,"Editar Item",NULL_STRING,NULL_STRING}

oCCIncluir := PushButton{self,ResourceID{JEP_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}

oCCExcluir := PushButton{self,ResourceID{JEP_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}

oCCTABULA2 := PushButton{self,ResourceID{JEP_TABULA2,_GetInst()}}
oCCTABULA2:HyperLabel := HyperLabel{#TABULA2,"Ver Itens",NULL_STRING,NULL_STRING}

oCCALTERA2 := PushButton{self,ResourceID{JEP_ALTERA2,_GetInst()}}
oCCALTERA2:HyperLabel := HyperLabel{#ALTERA2,"Editar Item",NULL_STRING,NULL_STRING}

oCCINCLUI2 := PushButton{self,ResourceID{JEP_INCLUI2,_GetInst()}}
oCCINCLUI2:HyperLabel := HyperLabel{#INCLUI2,"Incluir",NULL_STRING,NULL_STRING}

oCCEXCLUI2 := PushButton{self,ResourceID{JEP_EXCLUI2,_GetInst()}}
oCCEXCLUI2:HyperLabel := HyperLabel{#EXCLUI2,"Excluir",NULL_STRING,NULL_STRING}

self:Caption := "Estimativa Processo"
self:HyperLabel := HyperLabel{#JEP,"Estimativa Processo",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBOV := DataColumn{PADRAO_NUM_08{}}
oDBOV:Width := 5
oDBOV:HyperLabel := oDCOV:HyperLabel 
oDBOV:Caption := "Ov:"
oDBOV:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOV)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 20
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
oDBNOME:Width := 23
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)

oDBCLIENTE := DataColumn{PADRAO_NUM_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
oDBCLIENTE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCLIENTE)

oDBCOGCLI := DataColumn{PADRAO_Char_12{}}
oDBCOGCLI:Width := 18
oDBCOGCLI:HyperLabel := oDCCOGCLI:HyperLabel 
oDBCOGCLI:Caption := "Cognome"
oDBCOGCLI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCOGCLI)


self:ViewAs(#FormView)
oTPJETTAB_01 := JETTAB_01{self, 0}
oDCJEPTAB:AppendTab(#JETTAB_01,"Obs Geral",oTPJETTAB_01,0)
oTPJETTAB_02 := JETTAB_02{self, 0}
oDCJEPTAB:AppendTab(#JETTAB_02,"Obs Custo",oTPJETTAB_02,0)
oTPJETTAB_03 := JETTAB_03{self, 0}
oDCJEPTAB:AppendTab(#JETTAB_03,"Obs Engenharia",oTPJETTAB_03,0)
oTPJEPTAB_PAGE4 := JEPTAB_PAGE4{self, 0}
oDCJEPTAB:AppendTab(#JEPTAB_PAGE4,"Obs: Planilha",oTPJEPTAB_PAGE4,0)
oDCJEPTAB:SelectTab(#JETTAB_01)

oSFJVIII := JVIII{self,JEP_JVIII}
oSFJVIII:show()

oSFJVIAREV := JVIAREV{self,JEP_JVIAREV}
oSFJVIAREV:show()

oSFJVCE := JVCE{self,JEP_JVCE}
oSFJVCE:show()

oSFJSEQ := JSEQ{self,JEP_JSEQ}
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


access PRAZO() 
return self:FieldGet(#PRAZO)


assign PRAZO(uValue) 
self:FieldPut(#PRAZO, uValue)
return PRAZO := uValue


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


access SUB() 
return self:FieldGet(#SUB)


assign SUB(uValue) 
self:FieldPut(#SUB, uValue)
return SUB := uValue


access VIABILI() 
return self:FieldGet(#VIABILI)


assign VIABILI(uValue) 
self:FieldPut(#VIABILI, uValue)
return VIABILI := uValue


END CLASS
class JEPTAB_Page4 inherit DATAWINDOW 

	PROTECT oDBOBSP01 as DataColumn
	PROTECT oDBOBSP02 as DataColumn
	protect oDCOBSP01 as SINGLELINEEDIT
	protect oDCOBSP02 as SINGLELINEEDIT
// 	instance OBSP01 
// 	instance OBSP02 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JEPTAB_Page4",_GetInst()},iCtlID)

oDCOBSP01 := SingleLineEdit{self,ResourceID{JEPTAB_PAGE4_OBSP01,_GetInst()}}
oDCOBSP01:FieldSpec := padrao_char_60{}
oDCOBSP01:HyperLabel := HyperLabel{#OBSP01,"Obsp01:",NULL_STRING,"VPORC_OBSP01"}

oDCOBSP02 := SingleLineEdit{self,ResourceID{JEPTAB_PAGE4_OBSP02,_GetInst()}}
oDCOBSP02:FieldSpec := padrao_char_60{}
oDCOBSP02:HyperLabel := HyperLabel{#OBSP02,"Obsp02:",NULL_STRING,"VPORC_OBSP02"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JEPTAB_Page4,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif
self:Browser := DataBrowser{self}

oDBOBSP01 := DataColumn{padrao_char_60{}}
oDBOBSP01:Width := 8
oDBOBSP01:HyperLabel := oDCOBSP01:HyperLabel 
oDBOBSP01:Caption := "Obsp01:"
self:Browser:AddColumn(oDBOBSP01)

oDBOBSP02 := DataColumn{padrao_char_60{}}
oDBOBSP02:Width := 8
oDBOBSP02:HyperLabel := oDCOBSP02:HyperLabel 
oDBOBSP02:Caption := "Obsp02:"
self:Browser:AddColumn(oDBOBSP02)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access OBSP01() 
return self:FieldGet(#OBSP01)


assign OBSP01(uValue) 
self:FieldPut(#OBSP01, uValue)
return OBSP01 := uValue


access OBSP02() 
return self:FieldGet(#OBSP02)


assign OBSP02(uValue) 
self:FieldPut(#OBSP02, uValue)
return OBSP02 := uValue


END CLASS
class JETTAB_01 inherit DATAWINDOW 

	protect oDCOBS01 as SINGLELINEEDIT
	protect oDCOBS02 as SINGLELINEEDIT
	protect oDCOBS03 as SINGLELINEEDIT
	protect oDCOBS04 as SINGLELINEEDIT
	protect oDCOBS05 as SINGLELINEEDIT
	protect oDCOBS06 as SINGLELINEEDIT
	protect oDCOBS07 as SINGLELINEEDIT
	protect oDCOBS08 as SINGLELINEEDIT
// 	instance OBS01 
// 	instance OBS02 
// 	instance OBS03 
// 	instance OBS04 
// 	instance OBS05 
// 	instance OBS06 
// 	instance OBS07 
// 	instance OBS08 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JETTAB_01",_GetInst()},iCtlID)

oDCOBS01 := SingleLineEdit{self,ResourceID{JETTAB_01_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := padrao_char_80{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Obs01:",NULL_STRING,"VPORC_OBS01"}

oDCOBS02 := SingleLineEdit{self,ResourceID{JETTAB_01_OBS02,_GetInst()}}
oDCOBS02:FieldSpec := padrao_char_80{}
oDCOBS02:HyperLabel := HyperLabel{#OBS02,"Obs02:",NULL_STRING,"VPORC_OBS02"}

oDCOBS03 := SingleLineEdit{self,ResourceID{JETTAB_01_OBS03,_GetInst()}}
oDCOBS03:FieldSpec := padrao_char_80{}
oDCOBS03:HyperLabel := HyperLabel{#OBS03,"Obs03:",NULL_STRING,"VPORC_OBS03"}

oDCOBS04 := SingleLineEdit{self,ResourceID{JETTAB_01_OBS04,_GetInst()}}
oDCOBS04:FieldSpec := padrao_char_80{}
oDCOBS04:HyperLabel := HyperLabel{#OBS04,"Obs04:",NULL_STRING,"VPORC_OBS04"}

oDCOBS05 := SingleLineEdit{self,ResourceID{JETTAB_01_OBS05,_GetInst()}}
oDCOBS05:FieldSpec := padrao_char_80{}
oDCOBS05:HyperLabel := HyperLabel{#OBS05,"Obs05:",NULL_STRING,"VPORC_OBS05"}

oDCOBS06 := SingleLineEdit{self,ResourceID{JETTAB_01_OBS06,_GetInst()}}
oDCOBS06:FieldSpec := padrao_char_80{}
oDCOBS06:HyperLabel := HyperLabel{#OBS06,"Obs05:",NULL_STRING,"VPORC_OBS05"}

oDCOBS07 := SingleLineEdit{self,ResourceID{JETTAB_01_OBS07,_GetInst()}}
oDCOBS07:FieldSpec := padrao_char_80{}
oDCOBS07:HyperLabel := HyperLabel{#OBS07,"Obs05:",NULL_STRING,"VPORC_OBS05"}

oDCOBS08 := SingleLineEdit{self,ResourceID{JETTAB_01_OBS08,_GetInst()}}
oDCOBS08:FieldSpec := padrao_char_80{}
oDCOBS08:HyperLabel := HyperLabel{#OBS08,"Obs05:",NULL_STRING,"VPORC_OBS05"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JETTAB_01,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access OBS01() 
return self:FieldGet(#OBS01)


assign OBS01(uValue) 
self:FieldPut(#OBS01, uValue)
return OBS01 := uValue


access OBS02() 
return self:FieldGet(#OBS02)


assign OBS02(uValue) 
self:FieldPut(#OBS02, uValue)
return OBS02 := uValue


access OBS03() 
return self:FieldGet(#OBS03)


assign OBS03(uValue) 
self:FieldPut(#OBS03, uValue)
return OBS03 := uValue


access OBS04() 
return self:FieldGet(#OBS04)


assign OBS04(uValue) 
self:FieldPut(#OBS04, uValue)
return OBS04 := uValue


access OBS05() 
return self:FieldGet(#OBS05)


assign OBS05(uValue) 
self:FieldPut(#OBS05, uValue)
return OBS05 := uValue


access OBS06() 
return self:FieldGet(#OBS06)


assign OBS06(uValue) 
self:FieldPut(#OBS06, uValue)
return OBS06 := uValue


access OBS07() 
return self:FieldGet(#OBS07)


assign OBS07(uValue) 
self:FieldPut(#OBS07, uValue)
return OBS07 := uValue


access OBS08() 
return self:FieldGet(#OBS08)


assign OBS08(uValue) 
self:FieldPut(#OBS08, uValue)
return OBS08 := uValue


END CLASS
class JETTAB_02 inherit DATAWINDOW 

	protect oDCOBC01 as SINGLELINEEDIT
	protect oDCOBC02 as SINGLELINEEDIT
	protect oDCOBC03 as SINGLELINEEDIT
	protect oDCOBC04 as SINGLELINEEDIT
	protect oDCOBC05 as SINGLELINEEDIT
// 	instance OBC01 
// 	instance OBC02 
// 	instance OBC03 
// 	instance OBC04 
// 	instance OBC05 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JETTAB_02",_GetInst()},iCtlID)

oDCOBC01 := SingleLineEdit{self,ResourceID{JETTAB_02_OBC01,_GetInst()}}
oDCOBC01:FieldSpec := padrao_char_80{}
oDCOBC01:HyperLabel := HyperLabel{#OBC01,"padrao_char_80",NULL_STRING,"VPORC_OBC01"}

oDCOBC02 := SingleLineEdit{self,ResourceID{JETTAB_02_OBC02,_GetInst()}}
oDCOBC02:FieldSpec := padrao_char_80{}
oDCOBC02:HyperLabel := HyperLabel{#OBC02,"padrao_char_80",NULL_STRING,"VPORC_OBC02"}

oDCOBC03 := SingleLineEdit{self,ResourceID{JETTAB_02_OBC03,_GetInst()}}
oDCOBC03:FieldSpec := padrao_char_80{}
oDCOBC03:HyperLabel := HyperLabel{#OBC03,"padrao_char_80",NULL_STRING,"VPORC_OBC03"}

oDCOBC04 := SingleLineEdit{self,ResourceID{JETTAB_02_OBC04,_GetInst()}}
oDCOBC04:FieldSpec := padrao_char_80{}
oDCOBC04:HyperLabel := HyperLabel{#OBC04,"padrao_char_80",NULL_STRING,"VPORC_OBC04"}

oDCOBC05 := SingleLineEdit{self,ResourceID{JETTAB_02_OBC05,_GetInst()}}
oDCOBC05:FieldSpec := padrao_char_80{}
oDCOBC05:HyperLabel := HyperLabel{#OBC05,"padrao_char_80",NULL_STRING,"VPORC_OBC05"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JETTAB_02,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access OBC01() 
return self:FieldGet(#OBC01)


assign OBC01(uValue) 
self:FieldPut(#OBC01, uValue)
return OBC01 := uValue


access OBC02() 
return self:FieldGet(#OBC02)


assign OBC02(uValue) 
self:FieldPut(#OBC02, uValue)
return OBC02 := uValue


access OBC03() 
return self:FieldGet(#OBC03)


assign OBC03(uValue) 
self:FieldPut(#OBC03, uValue)
return OBC03 := uValue


access OBC04() 
return self:FieldGet(#OBC04)


assign OBC04(uValue) 
self:FieldPut(#OBC04, uValue)
return OBC04 := uValue


access OBC05() 
return self:FieldGet(#OBC05)


assign OBC05(uValue) 
self:FieldPut(#OBC05, uValue)
return OBC05 := uValue


END CLASS
class JETTAB_03 inherit DATAWINDOW 

	protect oDCOBE01 as SINGLELINEEDIT
	protect oDCOBE02 as SINGLELINEEDIT
	protect oDCOBE03 as SINGLELINEEDIT
// 	instance OBE01 
// 	instance OBE02 
// 	instance OBE03 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JETTAB_03",_GetInst()},iCtlID)

oDCOBE01 := SingleLineEdit{self,ResourceID{JETTAB_03_OBE01,_GetInst()}}
oDCOBE01:FieldSpec := padrao_char_60{}
oDCOBE01:HyperLabel := HyperLabel{#OBE01,"Obe01:",NULL_STRING,"VPORC_OBE01"}

oDCOBE02 := SingleLineEdit{self,ResourceID{JETTAB_03_OBE02,_GetInst()}}
oDCOBE02:FieldSpec := padrao_char_60{}
oDCOBE02:HyperLabel := HyperLabel{#OBE02,"Obe02:",NULL_STRING,"VPORC_OBE02"}

oDCOBE03 := SingleLineEdit{self,ResourceID{JETTAB_03_OBE03,_GetInst()}}
oDCOBE03:FieldSpec := padrao_char_60{}
oDCOBE03:HyperLabel := HyperLabel{#OBE03,"Obe03:",NULL_STRING,"VPORC_OBE03"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JETTAB_03,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access OBE01() 
return self:FieldGet(#OBE01)


assign OBE01(uValue) 
self:FieldPut(#OBE01, uValue)
return OBE01 := uValue


access OBE02() 
return self:FieldGet(#OBE02)


assign OBE02(uValue) 
self:FieldPut(#OBE02, uValue)
return OBE02 := uValue


access OBE03() 
return self:FieldGet(#OBE03)


assign OBE03(uValue) 
self:FieldPut(#OBE03, uValue)
return OBE03 := uValue


END CLASS
