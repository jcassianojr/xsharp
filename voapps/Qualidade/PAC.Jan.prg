#region DEFINES
STATIC DEFINE JPAC_ACA01 := 202 
STATIC DEFINE JPAC_ACA02 := 203 
STATIC DEFINE JPAC_ACA03 := 204 
STATIC DEFINE JPAC_ACA04 := 205 
STATIC DEFINE JPAC_ACP := 100 
STATIC DEFINE JPAC_AEP := 102 
STATIC DEFINE JPAC_BTNPEGMA01 := 209 
STATIC DEFINE JPAC_BTNPEGMS01 := 210 
STATIC DEFINE JPAC_BTNPEGMS06 := 206 
STATIC DEFINE JPAC_BUSCANUM := 212 
STATIC DEFINE JPAC_CARAC := 107 
STATIC DEFINE JPAC_CAV01 := 197 
STATIC DEFINE JPAC_CAV02 := 198 
STATIC DEFINE JPAC_CAV03 := 199 
STATIC DEFINE JPAC_CAV04 := 200 
STATIC DEFINE JPAC_CLIENTE := 104 
STATIC DEFINE JPAC_CLINOME := 162 
STATIC DEFINE JPAC_CODIGO := 105 
STATIC DEFINE JPAC_DATA := 103 
STATIC DEFINE JPAC_DESCII := 169 
STATIC DEFINE JPAC_DESSEQ := 112 
STATIC DEFINE JPAC_EQU := 113 
STATIC DEFINE JPAC_ESCCOD := 157 
STATIC DEFINE JPAC_ESCFOR := 156 
STATIC DEFINE JPAC_ESPECI := 106 
STATIC DEFINE JPAC_FOTO := 208 
STATIC DEFINE JPAC_FT24 := 181 
STATIC DEFINE JPAC_FT25 := 150 
STATIC DEFINE JPAC_GROUPBOX3 := 122 
STATIC DEFINE JPAC_GROUPBOX4 := 154 
STATIC DEFINE JPAC_IDE01 := 192 
STATIC DEFINE JPAC_IDE02 := 193 
STATIC DEFINE JPAC_IDE03 := 194 
STATIC DEFINE JPAC_IDE04 := 195 
STATIC DEFINE JPAC_IMPACP := 124 
STATIC DEFINE JPAC_IMPACP2 := 130 
STATIC DEFINE JPAC_IMPAEP := 123 
STATIC DEFINE JPAC_IMPAEP2 := 127 
STATIC DEFINE JPAC_INSTRU := 109 
STATIC DEFINE JPAC_MEDR := 186 
STATIC DEFINE JPAC_MEDX := 184 
STATIC DEFINE JPAC_NACP := 131 
STATIC DEFINE JPAC_NAEP := 128 
STATIC DEFINE JPAC_NEQU := 114 
STATIC DEFINE JPAC_NOME := 164 
STATIC DEFINE JPAC_NPP := 141 
STATIC DEFINE JPAC_NPPK := 133 
STATIC DEFINE JPAC_NRMAX := 139 
STATIC DEFINE JPAC_NRMED := 134 
STATIC DEFINE JPAC_NRMIN := 137 
STATIC DEFINE JPAC_NVALP := 149 
STATIC DEFINE JPAC_NVMAX := 153 
STATIC DEFINE JPAC_NVMIN := 151 
STATIC DEFINE JPAC_NXMAX := 147 
STATIC DEFINE JPAC_NXMED := 143 
STATIC DEFINE JPAC_NXMIN := 145 
STATIC DEFINE JPAC_PAC := 160 
STATIC DEFINE JPAC_POROV := 211 
STATIC DEFINE JPAC_PP := 188 
STATIC DEFINE JPAC_PPK := 190 
STATIC DEFINE JPAC_RMAX := 118 
STATIC DEFINE JPAC_RMIN := 121 
STATIC DEFINE JPAC_SC_ACP1 := 126 
STATIC DEFINE JPAC_SC_ACP3 := 132 
STATIC DEFINE JPAC_SC_CARAC := 165 
STATIC DEFINE JPAC_SC_CLIENTE := 161 
STATIC DEFINE JPAC_SC_CODIGO := 163 
STATIC DEFINE JPAC_SC_DATA := 159 
STATIC DEFINE JPAC_SC_DESTINO2 := 207 
STATIC DEFINE JPAC_SC_EQU := 172 
STATIC DEFINE JPAC_SC_ESPECI := 166 
STATIC DEFINE JPAC_SC_INSTRU := 168 
STATIC DEFINE JPAC_SC_MEDR := 185 
STATIC DEFINE JPAC_SC_MEDR1 := 136 
STATIC DEFINE JPAC_SC_MEDX := 183 
STATIC DEFINE JPAC_SC_MEDX1 := 144 
STATIC DEFINE JPAC_SC_PAC := 158 
STATIC DEFINE JPAC_SC_PP := 187 
STATIC DEFINE JPAC_SC_PP1 := 142 
STATIC DEFINE JPAC_SC_PPK := 189 
STATIC DEFINE JPAC_SC_PPK1 := 135 
STATIC DEFINE JPAC_SC_RMAX := 177 
STATIC DEFINE JPAC_SC_RMAX1 := 140 
STATIC DEFINE JPAC_SC_RMIN := 180 
STATIC DEFINE JPAC_SC_RMIN1 := 138 
STATIC DEFINE JPAC_SC_SEQ := 170 
STATIC DEFINE JPAC_SC_SETCOD := 132 
STATIC DEFINE JPAC_SC_SETOR := 173 
STATIC DEFINE JPAC_SC_SSQ := 111 
STATIC DEFINE JPAC_SC_UNID := 167 
STATIC DEFINE JPAC_SC_VMAX := 175 
STATIC DEFINE JPAC_SC_VMAX1 := 155 
STATIC DEFINE JPAC_SC_VMIN := 178 
STATIC DEFINE JPAC_SC_VMIN1 := 152 
STATIC DEFINE JPAC_SC_XMAX := 176 
STATIC DEFINE JPAC_SC_XMAX1 := 148 
STATIC DEFINE JPAC_SC_XMIN := 179 
STATIC DEFINE JPAC_SC_XMIN1 := 146 
STATIC DEFINE JPAC_SEQ := 110 
STATIC DEFINE JPAC_SETCOD := 115 
STATIC DEFINE JPAC_SETOR := 174 
STATIC DEFINE JPAC_SINGLELINEEDIT40 := 101 
STATIC DEFINE JPAC_SSQ := 171 
STATIC DEFINE JPAC_THEFIXEDTEXT25 := 125 
STATIC DEFINE JPAC_THEFIXEDTEXT27 := 129 
STATIC DEFINE JPAC_THEGROUPBOX1 := 191 
STATIC DEFINE JPAC_THEGROUPBOX2 := 196 
STATIC DEFINE JPAC_THEGROUPBOX3 := 201 
STATIC DEFINE JPAC_UNID := 108 
STATIC DEFINE JPAC_VALP := 182 
STATIC DEFINE JPAC_VMAX := 116 
STATIC DEFINE JPAC_VMIN := 119 
STATIC DEFINE JPAC_XMAX := 117 
STATIC DEFINE JPAC_XMIN := 120 
#endregion

PARTIAL class JPAC inherit MYDataWindow 

	PROTECT oDBPAC as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBCLINOME as DataColumn
	PROTECT oDBSINGLELINEEDIT40 as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCACP as RIGHTSLE
	protect oDCAEP as RIGHTSLE
	protect oDCDATA as DATETIMEPICKER
	protect oDCCLIENTE as RIGHTSLE
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCESPECI as SINGLELINEEDIT
	protect oDCCARAC as SINGLELINEEDIT
	protect oDCUNID as SINGLELINEEDIT
	protect oDCINSTRU as COMBOBOX
	protect oDCSEQ as RIGHTSLE
	protect oDCSC_SSQ as FIXEDTEXT
	protect oDCDESSEQ as SINGLELINEEDIT
	protect oDCEQU as SINGLELINEEDIT
	protect oDCNEQU as SINGLELINEEDIT
	protect oDCSETCOD as COMBOBOX
	protect oDCVMAX as RIGHTSLE
	protect oDCXMAX as RIGHTSLE
	protect oDCRMAX as RIGHTSLE
	protect oDCVMIN as RIGHTSLE
	protect oDCXMIN as RIGHTSLE
	protect oDCRMIN as RIGHTSLE
	protect oDCGroupBox3 as GROUPBOX
	protect oCCIMPAEP as PUSHBUTTON
	protect oCCIMPACP as PUSHBUTTON
	protect oDCtheFixedText25 as FIXEDTEXT
	protect oDCSC_ACP1 as FIXEDTEXT
	protect oCCIMPAEP2 as PUSHBUTTON
	protect oDCNAEP as RIGHTSLE
	protect oDCtheFixedText27 as FIXEDTEXT
	protect oCCIMPACP2 as PUSHBUTTON
	protect oDCNACP as RIGHTSLE
	protect oDCSC_ACP3 as FIXEDTEXT
	protect oDCNPPK as SINGLELINEEDIT
	protect oDCNRMED as SINGLELINEEDIT
	protect oDCSC_PPK1 as FIXEDTEXT
	protect oDCSC_MEDR1 as FIXEDTEXT
	protect oDCNRMIN as SINGLELINEEDIT
	protect oDCSC_RMIN1 as FIXEDTEXT
	protect oDCNRMAX as SINGLELINEEDIT
	protect oDCSC_RMAX1 as FIXEDTEXT
	protect oDCNPP as SINGLELINEEDIT
	protect oDCSC_PP1 as FIXEDTEXT
	protect oDCNXMED as SINGLELINEEDIT
	protect oDCSC_MEDX1 as FIXEDTEXT
	protect oDCNXMIN as SINGLELINEEDIT
	protect oDCSC_XMIN1 as FIXEDTEXT
	protect oDCNXMAX as SINGLELINEEDIT
	protect oDCSC_XMAX1 as FIXEDTEXT
	protect oDCNVALP as SINGLELINEEDIT
	protect oDCFT25 as FIXEDTEXT
	protect oDCNVMIN as SINGLELINEEDIT
	protect oDCSC_VMIN1 as FIXEDTEXT
	protect oDCNVMAX as SINGLELINEEDIT
	protect oDCGroupBox4 as GROUPBOX
	protect oDCSC_VMAX1 as FIXEDTEXT
	protect oCCescfor as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oDCSC_PAC as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCPAC as SINGLELINEEDIT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCCLINOME as SINGLELINEEDIT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSC_CARAC as FIXEDTEXT
	protect oDCSC_ESPECI as FIXEDTEXT
	protect oDCSC_UNID as FIXEDTEXT
	protect oDCSC_INSTRU as FIXEDTEXT
	protect oDCDESCII as SINGLELINEEDIT
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSSQ as RIGHTSLE
	protect oDCSC_EQU as FIXEDTEXT
	protect oDCSC_SETOR as FIXEDTEXT
	protect oDCSETOR as SINGLELINEEDIT
	protect oDCSC_VMAX as FIXEDTEXT
	protect oDCSC_XMAX as FIXEDTEXT
	protect oDCSC_RMAX as FIXEDTEXT
	protect oDCSC_VMIN as FIXEDTEXT
	protect oDCSC_XMIN as FIXEDTEXT
	protect oDCSC_RMIN as FIXEDTEXT
	protect oDCFT24 as FIXEDTEXT
	protect oDCVALP as RIGHTSLE
	protect oDCSC_MEDX as FIXEDTEXT
	protect oDCMEDX as RIGHTSLE
	protect oDCSC_MEDR as FIXEDTEXT
	protect oDCMEDR as RIGHTSLE
	protect oDCSC_PP as FIXEDTEXT
	protect oDCPP as RIGHTSLE
	protect oDCSC_PPK as FIXEDTEXT
	protect oDCPPK as RIGHTSLE
	protect oDCtheGroupBox1 as GROUPBOX
	protect oDCIDE01 as SINGLELINEEDIT
	protect oDCIDE02 as SINGLELINEEDIT
	protect oDCIDE03 as SINGLELINEEDIT
	protect oDCIDE04 as SINGLELINEEDIT
	protect oDCtheGroupBox2 as GROUPBOX
	protect oDCCAV01 as SINGLELINEEDIT
	protect oDCCAV02 as SINGLELINEEDIT
	protect oDCCAV03 as SINGLELINEEDIT
	protect oDCCAV04 as SINGLELINEEDIT
	protect oDCtheGroupBox3 as GROUPBOX
	protect oDCACA01 as SINGLELINEEDIT
	protect oDCACA02 as SINGLELINEEDIT
	protect oDCACA03 as SINGLELINEEDIT
	protect oDCACA04 as SINGLELINEEDIT
	protect oCCbtnpegms06 as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCbtnPEGMA01 as PUSHBUTTON
	protect oCCbtnPEGMS01 as PUSHBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
// 	instance ACP 
	instance SingleLineEdit40 
// 	instance AEP 
// 	instance CLIENTE 
// 	instance CODIGO 
// 	instance ESPECI 
// 	instance CARAC 
// 	instance UNID 
// 	instance INSTRU 
// 	instance SEQ 
// 	instance DESSEQ 
// 	instance EQU 
// 	instance NEQU 
// 	instance SETCOD 
// 	instance VMAX 
// 	instance XMAX 
// 	instance RMAX 
// 	instance VMIN 
// 	instance XMIN 
// 	instance RMIN 
// 	instance NAEP 
// 	instance NACP 
// 	instance NPPK 
// 	instance NRMED 
// 	instance NRMIN 
// 	instance NRMAX 
// 	instance NPP 
// 	instance NXMED 
// 	instance NXMIN 
// 	instance NXMAX 
// 	instance NVALP 
// 	instance NVMIN 
// 	instance NVMAX 
// 	instance PAC 
// 	instance CLINOME 
// 	instance NOME 
// 	instance DESCII 
// 	instance SSQ 
// 	instance SETOR 
// 	instance VALP 
// 	instance MEDX 
// 	instance MEDR 
// 	instance PP 
// 	instance PPK 
// 	instance IDE01 
// 	instance IDE02 
// 	instance IDE03 
// 	instance IDE04 
// 	instance CAV01 
// 	instance CAV02 
// 	instance CAV03 
// 	instance CAV04 
// 	instance ACA01 
// 	instance ACA02 
// 	instance ACA03 
// 	instance ACA04 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ACA01() 
return self:FieldGet(#ACA01)


assign ACA01(uValue) 
self:FieldPut(#ACA01, uValue)
return ACA01 := uValue


access ACA02() 
return self:FieldGet(#ACA02)


assign ACA02(uValue) 
self:FieldPut(#ACA02, uValue)
return ACA02 := uValue


access ACA03() 
return self:FieldGet(#ACA03)


assign ACA03(uValue) 
self:FieldPut(#ACA03, uValue)
return ACA03 := uValue


access ACA04() 
return self:FieldGet(#ACA04)


assign ACA04(uValue) 
self:FieldPut(#ACA04, uValue)
return ACA04 := uValue


access ACP() 
return self:FieldGet(#ACP)


assign ACP(uValue) 
self:FieldPut(#ACP, uValue)
return ACP := uValue


access AEP() 
return self:FieldGet(#AEP)


assign AEP(uValue) 
self:FieldPut(#AEP, uValue)
return AEP := uValue


access CARAC() 
return self:FieldGet(#CARAC)


assign CARAC(uValue) 
self:FieldPut(#CARAC, uValue)
return CARAC := uValue


access CAV01() 
return self:FieldGet(#CAV01)


assign CAV01(uValue) 
self:FieldPut(#CAV01, uValue)
return CAV01 := uValue


access CAV02() 
return self:FieldGet(#CAV02)


assign CAV02(uValue) 
self:FieldPut(#CAV02, uValue)
return CAV02 := uValue


access CAV03() 
return self:FieldGet(#CAV03)


assign CAV03(uValue) 
self:FieldPut(#CAV03, uValue)
return CAV03 := uValue


access CAV04() 
return self:FieldGet(#CAV04)


assign CAV04(uValue) 
self:FieldPut(#CAV04, uValue)
return CAV04 := uValue


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


access DESCII() 
return self:FieldGet(#DESCII)


assign DESCII(uValue) 
self:FieldPut(#DESCII, uValue)
return DESCII := uValue


access DESSEQ() 
return self:FieldGet(#DESSEQ)


assign DESSEQ(uValue) 
self:FieldPut(#DESSEQ, uValue)
return DESSEQ := uValue


access EQU() 
return self:FieldGet(#EQU)


assign EQU(uValue) 
self:FieldPut(#EQU, uValue)
return EQU := uValue


access ESPECI() 
return self:FieldGet(#ESPECI)


assign ESPECI(uValue) 
self:FieldPut(#ESPECI, uValue)
return ESPECI := uValue


access IDE01() 
return self:FieldGet(#IDE01)


assign IDE01(uValue) 
self:FieldPut(#IDE01, uValue)
return IDE01 := uValue


access IDE02() 
return self:FieldGet(#IDE02)


assign IDE02(uValue) 
self:FieldPut(#IDE02, uValue)
return IDE02 := uValue


access IDE03() 
return self:FieldGet(#IDE03)


assign IDE03(uValue) 
self:FieldPut(#IDE03, uValue)
return IDE03 := uValue


access IDE04() 
return self:FieldGet(#IDE04)


assign IDE04(uValue) 
self:FieldPut(#IDE04, uValue)
return IDE04 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPAC",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,12,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCACP := rightSle{self,ResourceID{JPAC_ACP,_GetInst()}}
oDCACP:FieldSpec := padrao_num_08{}
oDCACP:HyperLabel := HyperLabel{#ACP,"Acp:",NULL_STRING,"PAC_ACP"}

oDCAEP := rightSle{self,ResourceID{JPAC_AEP,_GetInst()}}
oDCAEP:FieldSpec := padrao_num_08{}
oDCAEP:HyperLabel := HyperLabel{#AEP,"Acp:",NULL_STRING,"PAC_ACP"}

oDCDATA := DateTimePicker{self,ResourceID{JPAC_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCLIENTE := rightSle{self,ResourceID{JPAC_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := padrao_num_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"PAC_CLIENTE"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JPAC_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"PAC_CODIGO"}

oDCESPECI := SingleLineEdit{self,ResourceID{JPAC_ESPECI,_GetInst()}}
oDCESPECI:FieldSpec := padrao_char_40{}
oDCESPECI:HyperLabel := HyperLabel{#ESPECI,"Especi:",NULL_STRING,"PAC_ESPECI"}

oDCCARAC := SingleLineEdit{self,ResourceID{JPAC_CARAC,_GetInst()}}
oDCCARAC:FieldSpec := padrao_char_40{}
oDCCARAC:HyperLabel := HyperLabel{#CARAC,"Carac:",NULL_STRING,"PAC_CARAC"}

oDCUNID := SingleLineEdit{self,ResourceID{JPAC_UNID,_GetInst()}}
oDCUNID:FieldSpec := padrao_char_02{}
oDCUNID:HyperLabel := HyperLabel{#UNID,"Unid:",NULL_STRING,"PAC_UNID"}

oDCINSTRU := combobox{self,ResourceID{JPAC_INSTRU,_GetInst()}}
oDCINSTRU:HyperLabel := HyperLabel{#INSTRU,NULL_STRING,NULL_STRING,NULL_STRING}
oDCINSTRU:FillUsing(Self:TABINS( ))
oDCINSTRU:FieldSpec := padrao_char_08{}

oDCSEQ := rightSle{self,ResourceID{JPAC_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := padrao_num_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"PAC_SEQ"}

oDCSC_SSQ := FixedText{self,ResourceID{JPAC_SC_SSQ,_GetInst()}}
oDCSC_SSQ:HyperLabel := HyperLabel{#SC_SSQ,"Ssq:",NULL_STRING,NULL_STRING}

oDCDESSEQ := SingleLineEdit{self,ResourceID{JPAC_DESSEQ,_GetInst()}}
oDCDESSEQ:FieldSpec := padrao_char_70{}
oDCDESSEQ:HyperLabel := HyperLabel{#DESSEQ,NULL_STRING,NULL_STRING,NULL_STRING}

oDCEQU := SingleLineEdit{self,ResourceID{JPAC_EQU,_GetInst()}}
oDCEQU:FieldSpec := padrao_char_04{}
oDCEQU:HyperLabel := HyperLabel{#EQU,"Equ:",NULL_STRING,"PAC_EQU"}

oDCNEQU := SingleLineEdit{self,ResourceID{JPAC_NEQU,_GetInst()}}
oDCNEQU:FieldSpec := padrao_char_40{}
oDCNEQU:HyperLabel := HyperLabel{#NEQU,"Nequ:",NULL_STRING,"PAC_NEQU"}
oDCNEQU:BackGround := aBrushes[1]
oDCNEQU:Font(aFonts[1], FALSE)

oDCSETCOD := combobox{self,ResourceID{JPAC_SETCOD,_GetInst()}}
oDCSETCOD:HyperLabel := HyperLabel{#SETCOD,NULL_STRING,NULL_STRING,NULL_STRING}
oDCSETCOD:FieldSpec := padrao_char_01{}
oDCSETCOD:FillUsing(Self:TABSET( ))

oDCVMAX := rightSle{self,ResourceID{JPAC_VMAX,_GetInst()}}
oDCVMAX:FieldSpec := padrao_num_09_3{}
oDCVMAX:HyperLabel := HyperLabel{#VMAX,"Vmax:",NULL_STRING,"PAC_VMAX"}

oDCXMAX := rightSle{self,ResourceID{JPAC_XMAX,_GetInst()}}
oDCXMAX:FieldSpec := padrao_num_09_3{}
oDCXMAX:HyperLabel := HyperLabel{#XMAX,"Xmax:",NULL_STRING,"PAC_XMAX"}

oDCRMAX := rightSle{self,ResourceID{JPAC_RMAX,_GetInst()}}
oDCRMAX:FieldSpec := padrao_num_09_3{}
oDCRMAX:HyperLabel := HyperLabel{#RMAX,"Rmax:",NULL_STRING,"PAC_RMAX"}

oDCVMIN := rightSle{self,ResourceID{JPAC_VMIN,_GetInst()}}
oDCVMIN:FieldSpec := padrao_num_09_3{}
oDCVMIN:HyperLabel := HyperLabel{#VMIN,"Vmin:",NULL_STRING,"PAC_VMIN"}

oDCXMIN := rightSle{self,ResourceID{JPAC_XMIN,_GetInst()}}
oDCXMIN:FieldSpec := padrao_num_09_3{}
oDCXMIN:HyperLabel := HyperLabel{#XMIN,"Xmin:",NULL_STRING,"PAC_XMIN"}

oDCRMIN := rightSle{self,ResourceID{JPAC_RMIN,_GetInst()}}
oDCRMIN:FieldSpec := padrao_num_09_3{}
oDCRMIN:HyperLabel := HyperLabel{#RMIN,"Rmin:",NULL_STRING,"PAC_RMIN"}

oDCGroupBox3 := GroupBox{self,ResourceID{JPAC_GROUPBOX3,_GetInst()}}
oDCGroupBox3:HyperLabel := HyperLabel{#GroupBox3,"Indices Obtidos",NULL_STRING,NULL_STRING}

oCCIMPAEP := PushButton{self,ResourceID{JPAC_IMPAEP,_GetInst()}}
oCCIMPAEP:HyperLabel := HyperLabel{#IMPAEP,"Imp. AEP",NULL_STRING,NULL_STRING}

oCCIMPACP := PushButton{self,ResourceID{JPAC_IMPACP,_GetInst()}}
oCCIMPACP:HyperLabel := HyperLabel{#IMPACP,"Imp .Acp",NULL_STRING,NULL_STRING}

oDCtheFixedText25 := FixedText{self,ResourceID{JPAC_THEFIXEDTEXT25,_GetInst()}}
oDCtheFixedText25:HyperLabel := HyperLabel{#theFixedText25,"Aep:",NULL_STRING,NULL_STRING}

oDCSC_ACP1 := FixedText{self,ResourceID{JPAC_SC_ACP1,_GetInst()}}
oDCSC_ACP1:HyperLabel := HyperLabel{#SC_ACP1,"Acp:",NULL_STRING,NULL_STRING}

oCCIMPAEP2 := PushButton{self,ResourceID{JPAC_IMPAEP2,_GetInst()}}
oCCIMPAEP2:HyperLabel := HyperLabel{#IMPAEP2,"Imp. AEP",NULL_STRING,NULL_STRING}

oDCNAEP := rightSle{self,ResourceID{JPAC_NAEP,_GetInst()}}
oDCNAEP:FieldSpec := padrao_num_08{}
oDCNAEP:HyperLabel := HyperLabel{#NAEP,"Acp:",NULL_STRING,"PAC_ACP"}

oDCtheFixedText27 := FixedText{self,ResourceID{JPAC_THEFIXEDTEXT27,_GetInst()}}
oDCtheFixedText27:HyperLabel := HyperLabel{#theFixedText27,"Aep:",NULL_STRING,NULL_STRING}

oCCIMPACP2 := PushButton{self,ResourceID{JPAC_IMPACP2,_GetInst()}}
oCCIMPACP2:HyperLabel := HyperLabel{#IMPACP2,"Imp .Acp",NULL_STRING,NULL_STRING}

oDCNACP := rightSle{self,ResourceID{JPAC_NACP,_GetInst()}}
oDCNACP:FieldSpec := padrao_num_08{}
oDCNACP:HyperLabel := HyperLabel{#NACP,"Acp:",NULL_STRING,"PAC_ACP"}

oDCSC_ACP3 := FixedText{self,ResourceID{JPAC_SC_ACP3,_GetInst()}}
oDCSC_ACP3:HyperLabel := HyperLabel{#SC_ACP3,"Acp:",NULL_STRING,NULL_STRING}

oDCNPPK := SingleLineEdit{self,ResourceID{JPAC_NPPK,_GetInst()}}
oDCNPPK:FieldSpec := padrao_num_12_4{}
oDCNPPK:HyperLabel := HyperLabel{#NPPK,"Ppk:",NULL_STRING,"PAC_PPK"}

oDCNRMED := SingleLineEdit{self,ResourceID{JPAC_NRMED,_GetInst()}}
oDCNRMED:FieldSpec := padrao_num_09_3{}
oDCNRMED:HyperLabel := HyperLabel{#NRMED,"Medr:",NULL_STRING,"PAC_MEDR"}

oDCSC_PPK1 := FixedText{self,ResourceID{JPAC_SC_PPK1,_GetInst()}}
oDCSC_PPK1:HyperLabel := HyperLabel{#SC_PPK1,"Ppk:",NULL_STRING,NULL_STRING}

oDCSC_MEDR1 := FixedText{self,ResourceID{JPAC_SC_MEDR1,_GetInst()}}
oDCSC_MEDR1:HyperLabel := HyperLabel{#SC_MEDR1,"Medr:",NULL_STRING,NULL_STRING}

oDCNRMIN := SingleLineEdit{self,ResourceID{JPAC_NRMIN,_GetInst()}}
oDCNRMIN:FieldSpec := padrao_num_09_3{}
oDCNRMIN:HyperLabel := HyperLabel{#NRMIN,"Rmin:",NULL_STRING,"PAC_RMIN"}

oDCSC_RMIN1 := FixedText{self,ResourceID{JPAC_SC_RMIN1,_GetInst()}}
oDCSC_RMIN1:HyperLabel := HyperLabel{#SC_RMIN1,"Rmin:",NULL_STRING,NULL_STRING}

oDCNRMAX := SingleLineEdit{self,ResourceID{JPAC_NRMAX,_GetInst()}}
oDCNRMAX:FieldSpec := padrao_num_09_3{}
oDCNRMAX:HyperLabel := HyperLabel{#NRMAX,"Rmax:",NULL_STRING,"PAC_RMAX"}

oDCSC_RMAX1 := FixedText{self,ResourceID{JPAC_SC_RMAX1,_GetInst()}}
oDCSC_RMAX1:HyperLabel := HyperLabel{#SC_RMAX1,"Rmax:",NULL_STRING,NULL_STRING}

oDCNPP := SingleLineEdit{self,ResourceID{JPAC_NPP,_GetInst()}}
oDCNPP:FieldSpec := padrao_num_12_4{}
oDCNPP:HyperLabel := HyperLabel{#NPP,"Pp:",NULL_STRING,"PAC_PP"}

oDCSC_PP1 := FixedText{self,ResourceID{JPAC_SC_PP1,_GetInst()}}
oDCSC_PP1:HyperLabel := HyperLabel{#SC_PP1,"Pp:",NULL_STRING,NULL_STRING}

oDCNXMED := SingleLineEdit{self,ResourceID{JPAC_NXMED,_GetInst()}}
oDCNXMED:FieldSpec := padrao_num_09_3{}
oDCNXMED:HyperLabel := HyperLabel{#NXMED,"Medx:",NULL_STRING,"PAC_MEDX"}

oDCSC_MEDX1 := FixedText{self,ResourceID{JPAC_SC_MEDX1,_GetInst()}}
oDCSC_MEDX1:HyperLabel := HyperLabel{#SC_MEDX1,"Medx:",NULL_STRING,NULL_STRING}

oDCNXMIN := SingleLineEdit{self,ResourceID{JPAC_NXMIN,_GetInst()}}
oDCNXMIN:FieldSpec := padrao_num_09_3{}
oDCNXMIN:HyperLabel := HyperLabel{#NXMIN,"Xmin:",NULL_STRING,"PAC_XMIN"}

oDCSC_XMIN1 := FixedText{self,ResourceID{JPAC_SC_XMIN1,_GetInst()}}
oDCSC_XMIN1:HyperLabel := HyperLabel{#SC_XMIN1,"Xmin:",NULL_STRING,NULL_STRING}

oDCNXMAX := SingleLineEdit{self,ResourceID{JPAC_NXMAX,_GetInst()}}
oDCNXMAX:FieldSpec := padrao_num_09_3{}
oDCNXMAX:HyperLabel := HyperLabel{#NXMAX,"Xmax:",NULL_STRING,"PAC_XMAX"}

oDCSC_XMAX1 := FixedText{self,ResourceID{JPAC_SC_XMAX1,_GetInst()}}
oDCSC_XMAX1:HyperLabel := HyperLabel{#SC_XMAX1,"Xmax:",NULL_STRING,NULL_STRING}

oDCNVALP := SingleLineEdit{self,ResourceID{JPAC_NVALP,_GetInst()}}
oDCNVALP:FieldSpec := padrao_num_12_2{}
oDCNVALP:HyperLabel := HyperLabel{#NVALP,"Vmin:",NULL_STRING,"PAC_VMIN"}

oDCFT25 := FixedText{self,ResourceID{JPAC_FT25,_GetInst()}}
oDCFT25:HyperLabel := HyperLabel{#FT25,"Valp",NULL_STRING,NULL_STRING}

oDCNVMIN := SingleLineEdit{self,ResourceID{JPAC_NVMIN,_GetInst()}}
oDCNVMIN:FieldSpec := padrao_num_12_3{}
oDCNVMIN:HyperLabel := HyperLabel{#NVMIN,"Vmin:",NULL_STRING,"PAC_VMIN"}

oDCSC_VMIN1 := FixedText{self,ResourceID{JPAC_SC_VMIN1,_GetInst()}}
oDCSC_VMIN1:HyperLabel := HyperLabel{#SC_VMIN1,"Vmin:",NULL_STRING,NULL_STRING}

oDCNVMAX := SingleLineEdit{self,ResourceID{JPAC_NVMAX,_GetInst()}}
oDCNVMAX:FieldSpec := padrao_num_12_3{}
oDCNVMAX:HyperLabel := HyperLabel{#NVMAX,"Vmax:",NULL_STRING,"PAC_VMAX"}

oDCGroupBox4 := GroupBox{self,ResourceID{JPAC_GROUPBOX4,_GetInst()}}
oDCGroupBox4:HyperLabel := HyperLabel{#GroupBox4,"Novos Indices Obtidos",NULL_STRING,NULL_STRING}

oDCSC_VMAX1 := FixedText{self,ResourceID{JPAC_SC_VMAX1,_GetInst()}}
oDCSC_VMAX1:HyperLabel := HyperLabel{#SC_VMAX1,"Vmax:",NULL_STRING,NULL_STRING}

oCCescfor := PushButton{self,ResourceID{JPAC_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JPAC_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oDCSC_PAC := FixedText{self,ResourceID{JPAC_SC_PAC,_GetInst()}}
oDCSC_PAC:HyperLabel := HyperLabel{#SC_PAC,"Pac:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JPAC_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCPAC := SingleLineEdit{self,ResourceID{JPAC_PAC,_GetInst()}}
oDCPAC:FieldSpec := padrao_num_08{}
oDCPAC:HyperLabel := HyperLabel{#PAC,"Pac:",NULL_STRING,"PAC_PAC"}
oDCPAC:BackGround := aBrushes[1]
oDCPAC:Font(aFonts[2], FALSE)

oDCSC_CLIENTE := FixedText{self,ResourceID{JPAC_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCCLINOME := SingleLineEdit{self,ResourceID{JPAC_CLINOME,_GetInst()}}
oDCCLINOME:FieldSpec := padrao_char_60{}
oDCCLINOME:HyperLabel := HyperLabel{#CLINOME,"Clinome:",NULL_STRING,"PAC_CLINOME"}
oDCCLINOME:BackGround := aBrushes[1]
oDCCLINOME:Font(aFonts[1], FALSE)

oDCSC_CODIGO := FixedText{self,ResourceID{JPAC_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JPAC_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"PAC_NOME"}
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[1], FALSE)

oDCSC_CARAC := FixedText{self,ResourceID{JPAC_SC_CARAC,_GetInst()}}
oDCSC_CARAC:HyperLabel := HyperLabel{#SC_CARAC,"Caracteristica",NULL_STRING,NULL_STRING}

oDCSC_ESPECI := FixedText{self,ResourceID{JPAC_SC_ESPECI,_GetInst()}}
oDCSC_ESPECI:HyperLabel := HyperLabel{#SC_ESPECI,"Especificação:",NULL_STRING,NULL_STRING}

oDCSC_UNID := FixedText{self,ResourceID{JPAC_SC_UNID,_GetInst()}}
oDCSC_UNID:HyperLabel := HyperLabel{#SC_UNID,"Unid:",NULL_STRING,NULL_STRING}

oDCSC_INSTRU := FixedText{self,ResourceID{JPAC_SC_INSTRU,_GetInst()}}
oDCSC_INSTRU:HyperLabel := HyperLabel{#SC_INSTRU,"Instrumento:",NULL_STRING,NULL_STRING}

oDCDESCII := SingleLineEdit{self,ResourceID{JPAC_DESCII,_GetInst()}}
oDCDESCII:FieldSpec := padrao_char_40{}
oDCDESCII:HyperLabel := HyperLabel{#DESCII,"Descii:",NULL_STRING,"PAC_DESCII"}
oDCDESCII:BackGround := aBrushes[1]
oDCDESCII:Font(aFonts[1], FALSE)

oDCSC_SEQ := FixedText{self,ResourceID{JPAC_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSSQ := rightSle{self,ResourceID{JPAC_SSQ,_GetInst()}}
oDCSSQ:FieldSpec := padrao_num_03{}
oDCSSQ:HyperLabel := HyperLabel{#SSQ,"Ssq:",NULL_STRING,"PAC_SSQ"}

oDCSC_EQU := FixedText{self,ResourceID{JPAC_SC_EQU,_GetInst()}}
oDCSC_EQU:HyperLabel := HyperLabel{#SC_EQU,"Equipamento:",NULL_STRING,NULL_STRING}

oDCSC_SETOR := FixedText{self,ResourceID{JPAC_SC_SETOR,_GetInst()}}
oDCSC_SETOR:HyperLabel := HyperLabel{#SC_SETOR,"Setor:",NULL_STRING,NULL_STRING}

oDCSETOR := SingleLineEdit{self,ResourceID{JPAC_SETOR,_GetInst()}}
oDCSETOR:FieldSpec := padrao_char_20{}
oDCSETOR:HyperLabel := HyperLabel{#SETOR,"Setor:",NULL_STRING,"PAC_SETOR"}
oDCSETOR:BackGround := aBrushes[1]
oDCSETOR:Font(aFonts[1], FALSE)

oDCSC_VMAX := FixedText{self,ResourceID{JPAC_SC_VMAX,_GetInst()}}
oDCSC_VMAX:HyperLabel := HyperLabel{#SC_VMAX,"Vmax:",NULL_STRING,NULL_STRING}

oDCSC_XMAX := FixedText{self,ResourceID{JPAC_SC_XMAX,_GetInst()}}
oDCSC_XMAX:HyperLabel := HyperLabel{#SC_XMAX,"Xmax:",NULL_STRING,NULL_STRING}

oDCSC_RMAX := FixedText{self,ResourceID{JPAC_SC_RMAX,_GetInst()}}
oDCSC_RMAX:HyperLabel := HyperLabel{#SC_RMAX,"Rmax:",NULL_STRING,NULL_STRING}

oDCSC_VMIN := FixedText{self,ResourceID{JPAC_SC_VMIN,_GetInst()}}
oDCSC_VMIN:HyperLabel := HyperLabel{#SC_VMIN,"Vmin:",NULL_STRING,NULL_STRING}

oDCSC_XMIN := FixedText{self,ResourceID{JPAC_SC_XMIN,_GetInst()}}
oDCSC_XMIN:HyperLabel := HyperLabel{#SC_XMIN,"Xmin:",NULL_STRING,NULL_STRING}

oDCSC_RMIN := FixedText{self,ResourceID{JPAC_SC_RMIN,_GetInst()}}
oDCSC_RMIN:HyperLabel := HyperLabel{#SC_RMIN,"Rmin:",NULL_STRING,NULL_STRING}

oDCFT24 := FixedText{self,ResourceID{JPAC_FT24,_GetInst()}}
oDCFT24:HyperLabel := HyperLabel{#FT24,"Valp",NULL_STRING,NULL_STRING}

oDCVALP := rightSle{self,ResourceID{JPAC_VALP,_GetInst()}}
oDCVALP:FieldSpec := padrao_num_09_3{}
oDCVALP:HyperLabel := HyperLabel{#VALP,"Vmin:",NULL_STRING,"PAC_VMIN"}

oDCSC_MEDX := FixedText{self,ResourceID{JPAC_SC_MEDX,_GetInst()}}
oDCSC_MEDX:HyperLabel := HyperLabel{#SC_MEDX,"Medx:",NULL_STRING,NULL_STRING}

oDCMEDX := rightSle{self,ResourceID{JPAC_MEDX,_GetInst()}}
oDCMEDX:FieldSpec := padrao_num_09_3{}
oDCMEDX:HyperLabel := HyperLabel{#MEDX,"Medx:",NULL_STRING,"PAC_MEDX"}

oDCSC_MEDR := FixedText{self,ResourceID{JPAC_SC_MEDR,_GetInst()}}
oDCSC_MEDR:HyperLabel := HyperLabel{#SC_MEDR,"Medr:",NULL_STRING,NULL_STRING}

oDCMEDR := rightSle{self,ResourceID{JPAC_MEDR,_GetInst()}}
oDCMEDR:FieldSpec := padrao_num_09_3{}
oDCMEDR:HyperLabel := HyperLabel{#MEDR,"Medr:",NULL_STRING,"PAC_MEDR"}

oDCSC_PP := FixedText{self,ResourceID{JPAC_SC_PP,_GetInst()}}
oDCSC_PP:HyperLabel := HyperLabel{#SC_PP,"Pp:",NULL_STRING,NULL_STRING}

oDCPP := rightSle{self,ResourceID{JPAC_PP,_GetInst()}}
oDCPP:FieldSpec := padrao_num_12_4{}
oDCPP:HyperLabel := HyperLabel{#PP,"Pp:",NULL_STRING,"PAC_PP"}

oDCSC_PPK := FixedText{self,ResourceID{JPAC_SC_PPK,_GetInst()}}
oDCSC_PPK:HyperLabel := HyperLabel{#SC_PPK,"Ppk:",NULL_STRING,NULL_STRING}

oDCPPK := rightSle{self,ResourceID{JPAC_PPK,_GetInst()}}
oDCPPK:FieldSpec := padrao_num_12_4{}
oDCPPK:HyperLabel := HyperLabel{#PPK,"Ppk:",NULL_STRING,"PAC_PPK"}

oDCtheGroupBox1 := GroupBox{self,ResourceID{JPAC_THEGROUPBOX1,_GetInst()}}
oDCtheGroupBox1:HyperLabel := HyperLabel{#theGroupBox1,"Identificação do Problema",NULL_STRING,NULL_STRING}

oDCIDE01 := SingleLineEdit{self,ResourceID{JPAC_IDE01,_GetInst()}}
oDCIDE01:FieldSpec := padrao_char_70{}
oDCIDE01:HyperLabel := HyperLabel{#IDE01,"Ide01:",NULL_STRING,"PAC_IDE01"}

oDCIDE02 := SingleLineEdit{self,ResourceID{JPAC_IDE02,_GetInst()}}
oDCIDE02:FieldSpec := padrao_char_70{}
oDCIDE02:HyperLabel := HyperLabel{#IDE02,"Ide02:",NULL_STRING,"PAC_IDE02"}

oDCIDE03 := SingleLineEdit{self,ResourceID{JPAC_IDE03,_GetInst()}}
oDCIDE03:FieldSpec := padrao_char_70{}
oDCIDE03:HyperLabel := HyperLabel{#IDE03,"Ide03:",NULL_STRING,"PAC_IDE03"}

oDCIDE04 := SingleLineEdit{self,ResourceID{JPAC_IDE04,_GetInst()}}
oDCIDE04:FieldSpec := padrao_char_70{}
oDCIDE04:HyperLabel := HyperLabel{#IDE04,"Ide04:",NULL_STRING,"PAC_IDE04"}

oDCtheGroupBox2 := GroupBox{self,ResourceID{JPAC_THEGROUPBOX2,_GetInst()}}
oDCtheGroupBox2:HyperLabel := HyperLabel{#theGroupBox2,"Causa",NULL_STRING,NULL_STRING}

oDCCAV01 := SingleLineEdit{self,ResourceID{JPAC_CAV01,_GetInst()}}
oDCCAV01:FieldSpec := padrao_char_70{}
oDCCAV01:HyperLabel := HyperLabel{#CAV01,"Cav01:",NULL_STRING,"PAC_CAV01"}

oDCCAV02 := SingleLineEdit{self,ResourceID{JPAC_CAV02,_GetInst()}}
oDCCAV02:FieldSpec := padrao_char_70{}
oDCCAV02:HyperLabel := HyperLabel{#CAV02,"Cav02:",NULL_STRING,"PAC_CAV02"}

oDCCAV03 := SingleLineEdit{self,ResourceID{JPAC_CAV03,_GetInst()}}
oDCCAV03:FieldSpec := padrao_char_70{}
oDCCAV03:HyperLabel := HyperLabel{#CAV03,"Cav03:",NULL_STRING,"PAC_CAV03"}

oDCCAV04 := SingleLineEdit{self,ResourceID{JPAC_CAV04,_GetInst()}}
oDCCAV04:FieldSpec := padrao_char_70{}
oDCCAV04:HyperLabel := HyperLabel{#CAV04,"Cav04:",NULL_STRING,"PAC_CAV04"}

oDCtheGroupBox3 := GroupBox{self,ResourceID{JPAC_THEGROUPBOX3,_GetInst()}}
oDCtheGroupBox3:HyperLabel := HyperLabel{#theGroupBox3,"Ação Tomada",NULL_STRING,NULL_STRING}

oDCACA01 := SingleLineEdit{self,ResourceID{JPAC_ACA01,_GetInst()}}
oDCACA01:FieldSpec := padrao_char_70{}
oDCACA01:HyperLabel := HyperLabel{#ACA01,"Aca01:",NULL_STRING,"PAC_ACA01"}

oDCACA02 := SingleLineEdit{self,ResourceID{JPAC_ACA02,_GetInst()}}
oDCACA02:FieldSpec := padrao_char_70{}
oDCACA02:HyperLabel := HyperLabel{#ACA02,"Aca02:",NULL_STRING,"PAC_ACA02"}

oDCACA03 := SingleLineEdit{self,ResourceID{JPAC_ACA03,_GetInst()}}
oDCACA03:FieldSpec := padrao_char_70{}
oDCACA03:HyperLabel := HyperLabel{#ACA03,"Aca03:",NULL_STRING,"PAC_ACA03"}

oDCACA04 := SingleLineEdit{self,ResourceID{JPAC_ACA04,_GetInst()}}
oDCACA04:FieldSpec := padrao_char_70{}
oDCACA04:HyperLabel := HyperLabel{#ACA04,"Aca04:",NULL_STRING,"PAC_ACA04"}

oCCbtnpegms06 := PushButton{self,ResourceID{JPAC_BTNPEGMS06,_GetInst()}}
oCCbtnpegms06:HyperLabel := HyperLabel{#btnpegms06,"-->",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JPAC_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JPAC_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oCCbtnPEGMA01 := PushButton{self,ResourceID{JPAC_BTNPEGMA01,_GetInst()}}
oCCbtnPEGMA01:HyperLabel := HyperLabel{#btnPEGMA01,"->",NULL_STRING,NULL_STRING}

oCCbtnPEGMS01 := PushButton{self,ResourceID{JPAC_BTNPEGMS01,_GetInst()}}
oCCbtnPEGMS01:HyperLabel := HyperLabel{#btnPEGMS01,"->",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JPAC_POROV,_GetInst()}}
oCCporov:Image := ICO_AZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Organizar por Numero GC"

oCCbuscanum := PushButton{self,ResourceID{JPAC_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Localizar um GC"

self:Caption := "Plano de ação Para o CEP"
self:HyperLabel := HyperLabel{#JPAC,"Plano de ação Para o CEP",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBPAC := DataColumn{padrao_num_08{}}
oDBPAC:Width := 5
oDBPAC:HyperLabel := oDCPAC:HyperLabel 
oDBPAC:Caption := "Pac:"
oDBPAC:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBPAC)

oDBCLIENTE := DataColumn{padrao_num_08{}}
oDBCLIENTE:Width := 4
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
self:Browser:AddColumn(oDBCLIENTE)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBCLINOME := DataColumn{padrao_char_60{}}
oDBCLINOME:Width := 12
oDBCLINOME:HyperLabel := oDCCLINOME:HyperLabel 
oDBCLINOME:Caption := "Clinome:"
oDBCLINOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCLINOME)

oDBSINGLELINEEDIT40 := DataColumn{date_field{}}
oDBSINGLELINEEDIT40:Width := 9
oDBSINGLELINEEDIT40:HyperLabel := HyperLabel{#SingleLineEdit40,"Data",NULL_STRING,NULL_STRING} 
oDBSINGLELINEEDIT40:Caption := "Data"
self:Browser:AddColumn(oDBSINGLELINEEDIT40)

oDBNOME := DataColumn{padrao_char_40{}}
oDBNOME:Width := 16
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access INSTRU() 
return self:FieldGet(#INSTRU)


assign INSTRU(uValue) 
self:FieldPut(#INSTRU, uValue)
return INSTRU := uValue


access MEDR() 
return self:FieldGet(#MEDR)


assign MEDR(uValue) 
self:FieldPut(#MEDR, uValue)
return MEDR := uValue


access MEDX() 
return self:FieldGet(#MEDX)


assign MEDX(uValue) 
self:FieldPut(#MEDX, uValue)
return MEDX := uValue


access NACP() 
return self:FieldGet(#NACP)


assign NACP(uValue) 
self:FieldPut(#NACP, uValue)
return NACP := uValue


access NAEP() 
return self:FieldGet(#NAEP)


assign NAEP(uValue) 
self:FieldPut(#NAEP, uValue)
return NAEP := uValue


access NEQU() 
return self:FieldGet(#NEQU)


assign NEQU(uValue) 
self:FieldPut(#NEQU, uValue)
return NEQU := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access NPP() 
return self:FieldGet(#NPP)


assign NPP(uValue) 
self:FieldPut(#NPP, uValue)
return NPP := uValue


access NPPK() 
return self:FieldGet(#NPPK)


assign NPPK(uValue) 
self:FieldPut(#NPPK, uValue)
return NPPK := uValue


access NRMAX() 
return self:FieldGet(#NRMAX)


assign NRMAX(uValue) 
self:FieldPut(#NRMAX, uValue)
return NRMAX := uValue


access NRMED() 
return self:FieldGet(#NRMED)


assign NRMED(uValue) 
self:FieldPut(#NRMED, uValue)
return NRMED := uValue


access NRMIN() 
return self:FieldGet(#NRMIN)


assign NRMIN(uValue) 
self:FieldPut(#NRMIN, uValue)
return NRMIN := uValue


access NVALP() 
return self:FieldGet(#NVALP)


assign NVALP(uValue) 
self:FieldPut(#NVALP, uValue)
return NVALP := uValue


access NVMAX() 
return self:FieldGet(#NVMAX)


assign NVMAX(uValue) 
self:FieldPut(#NVMAX, uValue)
return NVMAX := uValue


access NVMIN() 
return self:FieldGet(#NVMIN)


assign NVMIN(uValue) 
self:FieldPut(#NVMIN, uValue)
return NVMIN := uValue


access NXMAX() 
return self:FieldGet(#NXMAX)


assign NXMAX(uValue) 
self:FieldPut(#NXMAX, uValue)
return NXMAX := uValue


access NXMED() 
return self:FieldGet(#NXMED)


assign NXMED(uValue) 
self:FieldPut(#NXMED, uValue)
return NXMED := uValue


access NXMIN() 
return self:FieldGet(#NXMIN)


assign NXMIN(uValue) 
self:FieldPut(#NXMIN, uValue)
return NXMIN := uValue


access PAC() 
return self:FieldGet(#PAC)


assign PAC(uValue) 
self:FieldPut(#PAC, uValue)
return PAC := uValue


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


access RMAX() 
return self:FieldGet(#RMAX)


assign RMAX(uValue) 
self:FieldPut(#RMAX, uValue)
return RMAX := uValue


access RMIN() 
return self:FieldGet(#RMIN)


assign RMIN(uValue) 
self:FieldPut(#RMIN, uValue)
return RMIN := uValue


access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


access SETCOD() 
return self:FieldGet(#SETCOD)


assign SETCOD(uValue) 
self:FieldPut(#SETCOD, uValue)
return SETCOD := uValue


access SETOR() 
return self:FieldGet(#SETOR)


assign SETOR(uValue) 
self:FieldPut(#SETOR, uValue)
return SETOR := uValue


access SSQ() 
return self:FieldGet(#SSQ)


assign SSQ(uValue) 
self:FieldPut(#SSQ, uValue)
return SSQ := uValue


access UNID() 
return self:FieldGet(#UNID)


assign UNID(uValue) 
self:FieldPut(#UNID, uValue)
return UNID := uValue


access VALP() 
return self:FieldGet(#VALP)


assign VALP(uValue) 
self:FieldPut(#VALP, uValue)
return VALP := uValue


access VMAX() 
return self:FieldGet(#VMAX)


assign VMAX(uValue) 
self:FieldPut(#VMAX, uValue)
return VMAX := uValue


access VMIN() 
return self:FieldGet(#VMIN)


assign VMIN(uValue) 
self:FieldPut(#VMIN, uValue)
return VMIN := uValue


access XMAX() 
return self:FieldGet(#XMAX)


assign XMAX(uValue) 
self:FieldPut(#XMAX, uValue)
return XMAX := uValue


access XMIN() 
return self:FieldGet(#XMIN)


assign XMIN(uValue) 
self:FieldPut(#XMIN, uValue)
return XMIN := uValue


END CLASS
