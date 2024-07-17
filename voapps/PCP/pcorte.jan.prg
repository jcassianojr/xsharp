#region DEFINES
STATIC DEFINE JPCORTE_AC := 120 
STATIC DEFINE JPCORTE_ALTERAR := 158 
STATIC DEFINE JPCORTE_ANTERIOR := 156 
STATIC DEFINE JPCORTE_APLICACAOTMP := 128 
STATIC DEFINE JPCORTE_ATUFORLX := 186 
STATIC DEFINE JPCORTE_ATULOGIXMU := 187 
STATIC DEFINE JPCORTE_BUSCAOV := 166 
STATIC DEFINE JPCORTE_CMDANUAL := 177 
STATIC DEFINE JPCORTE_CODIGO := 107 
STATIC DEFINE JPCORTE_CODIGOTMP := 126 
STATIC DEFINE JPCORTE_CRM := 103 
STATIC DEFINE JPCORTE_CRMITEM := 104 
STATIC DEFINE JPCORTE_CRMITEMU := 116 
STATIC DEFINE JPCORTE_DATA := 100 
STATIC DEFINE JPCORTE_DESCRICAO := 108 
STATIC DEFINE JPCORTE_DESCRICAOTMP := 127 
STATIC DEFINE JPCORTE_ESCCOD := 152 
STATIC DEFINE JPCORTE_ESCFOR := 148 
STATIC DEFINE JPCORTE_ESCFORU := 150 
STATIC DEFINE JPCORTE_ESCMP := 162 
STATIC DEFINE JPCORTE_ESP := 110 
STATIC DEFINE JPCORTE_EXCLUIR := 159 
STATIC DEFINE JPCORTE_FIXEDTEXT21 := 179 
STATIC DEFINE JPCORTE_FT10 := 172 
STATIC DEFINE JPCORTE_FT6 := 163 
STATIC DEFINE JPCORTE_JPCORTEI := 146 
STATIC DEFINE JPCORTE_LANCADO := 178 
STATIC DEFINE JPCORTE_LANCADO1 := 180 
STATIC DEFINE JPCORTE_LAR := 111 
STATIC DEFINE JPCORTE_LOCALUSO := 109 
STATIC DEFINE JPCORTE_LXFORNC := 189 
STATIC DEFINE JPCORTE_LXFORNU := 190 
STATIC DEFINE JPCORTE_MFORN := 119 
STATIC DEFINE JPCORTE_MFORNU := 114 
STATIC DEFINE JPCORTE_NFNOSSA := 101 
STATIC DEFINE JPCORTE_NFORN := 118 
STATIC DEFINE JPCORTE_NFORNU := 113 
STATIC DEFINE JPCORTE_NFUSINA := 115 
STATIC DEFINE JPCORTE_NOVO := 160 
STATIC DEFINE JPCORTE_NUMERO := 142 
STATIC DEFINE JPCORTE_OBS01 := 121 
STATIC DEFINE JPCORTE_OBS02 := 122 
STATIC DEFINE JPCORTE_PEGAR := 173 
STATIC DEFINE JPCORTE_PEGARA := 175 
STATIC DEFINE JPCORTE_PEGARF := 176 
STATIC DEFINE JPCORTE_PEGARR := 174 
STATIC DEFINE JPCORTE_PEGCOD := 151 
STATIC DEFINE JPCORTE_PEGCOD1 := 171 
STATIC DEFINE JPCORTE_PEGCRMN := 154 
STATIC DEFINE JPCORTE_PEGCRMN1 := 168 
STATIC DEFINE JPCORTE_PEGCRMN2 := 170 
STATIC DEFINE JPCORTE_PEGCRMR := 153 
STATIC DEFINE JPCORTE_PEGCRMR1 := 167 
STATIC DEFINE JPCORTE_PEGCRMR2 := 169 
STATIC DEFINE JPCORTE_PEGFOR := 147 
STATIC DEFINE JPCORTE_PEGFORU := 149 
STATIC DEFINE JPCORTE_PEGLXDIZ := 185 
STATIC DEFINE JPCORTE_PEGLXDIZ1 := 188 
STATIC DEFINE JPCORTE_PEGLXFORC := 192 
STATIC DEFINE JPCORTE_PEGLXFORU := 191 
STATIC DEFINE JPCORTE_PEGMP := 161 
STATIC DEFINE JPCORTE_PEGPED := 164 
STATIC DEFINE JPCORTE_PEITE := 106 
STATIC DEFINE JPCORTE_PEPED := 105 
STATIC DEFINE JPCORTE_PESO := 112 
STATIC DEFINE JPCORTE_POROV := 165 
STATIC DEFINE JPCORTE_PROXIMO := 155 
STATIC DEFINE JPCORTE_RASTRO := 102 
STATIC DEFINE JPCORTE_RASTROU := 117 
STATIC DEFINE JPCORTE_REFDATA := 123 
STATIC DEFINE JPCORTE_REFNF := 124 
STATIC DEFINE JPCORTE_REFQTDE := 125 
STATIC DEFINE JPCORTE_SC_AC := 138 
STATIC DEFINE JPCORTE_SC_CRM := 139 
STATIC DEFINE JPCORTE_SC_ESP := 134 
STATIC DEFINE JPCORTE_SC_LAR := 135 
STATIC DEFINE JPCORTE_SC_LOCALUSO := 137 
STATIC DEFINE JPCORTE_SC_NFNOSSA := 130 
STATIC DEFINE JPCORTE_SC_NFNOSSA1 := 144 
STATIC DEFINE JPCORTE_SC_NFNOSSA3 := 183 
STATIC DEFINE JPCORTE_SC_NFORN := 141 
STATIC DEFINE JPCORTE_SC_NFORN1 := 143 
STATIC DEFINE JPCORTE_SC_NFORN2 := 145 
STATIC DEFINE JPCORTE_SC_NFUSINA := 131 
STATIC DEFINE JPCORTE_SC_NFUSINA2 := 184 
STATIC DEFINE JPCORTE_SC_NUMERO := 129 
STATIC DEFINE JPCORTE_SC_OBS01 := 140 
STATIC DEFINE JPCORTE_SC_PESO := 136 
STATIC DEFINE JPCORTE_SC_PESO1 := 181 
STATIC DEFINE JPCORTE_SC_PESO3 := 182 
STATIC DEFINE JPCORTE_SC_RASTRO := 133 
STATIC DEFINE JPCORTE_SC_RASTROU := 132 
STATIC DEFINE JPCORTE_TABULAR := 157 
#endregion

PARTIAL class jpcorte inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBRASTRO as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDESCRICAO as DataColumn
	protect oDCDATA as DATESLE
	protect oDCNFNOSSA as RIGHTSLE
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCCRM as RIGHTSLE
	protect oDCCRMITEM as RIGHTSLE
	protect oDCPEPED as RIGHTSLE
	protect oDCPEITE as RIGHTSLE
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCDESCRICAO as SINGLELINEEDIT
	protect oDCLOCALUSO as SINGLELINEEDIT
	protect oDCESP as RIGHTSLE
	protect oDCLAR as RIGHTSLE
	protect oDCPESO as RIGHTSLE
	protect oDCNFORNU as RIGHTSLE
	protect oDCMFORNU as SINGLELINEEDIT
	protect oDCNFUSINA as RIGHTSLE
	protect oDCCRMITEMU as RIGHTSLE
	protect oDCRASTROU as SINGLELINEEDIT
	protect oDCNFORN as RIGHTSLE
	protect oDCMFORN as SINGLELINEEDIT
	protect oDCAC as SINGLELINEEDIT
	protect oDCOBS01 as SINGLELINEEDIT
	protect oDCOBS02 as SINGLELINEEDIT
	protect oDCREFDATA as DATESLE
	protect oDCREFNF as RIGHTSLE
	protect oDCREFQTDE as RIGHTSLE
	protect oDCCODIGOTMP as SINGLELINEEDIT
	protect oDCDESCRICAOTMP as SINGLELINEEDIT
	protect oDCAPLICACAOTMP as SINGLELINEEDIT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_NFNOSSA as FIXEDTEXT
	protect oDCSC_NFUSINA as FIXEDTEXT
	protect oDCSC_RASTROU as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCSC_ESP as FIXEDTEXT
	protect oDCSC_LAR as FIXEDTEXT
	protect oDCSC_PESO as FIXEDTEXT
	protect oDCSC_LOCALUSO as FIXEDTEXT
	protect oDCSC_AC as FIXEDTEXT
	protect oDCSC_CRM as FIXEDTEXT
	protect oDCSC_OBS01 as FIXEDTEXT
	protect oDCSC_NFORN as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCSC_NFORN1 as FIXEDTEXT
	protect oDCSC_NFNOSSA1 as FIXEDTEXT
	protect oDCSC_NFORN2 as FIXEDTEXT
	protect oCCpegfor as PUSHBUTTON
	protect oCCescfor as PUSHBUTTON
	protect oCCpegforU as PUSHBUTTON
	protect oCCescforU as PUSHBUTTON
	protect oCCpegcod as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oCCpegcrmr as PUSHBUTTON
	protect oCCpegcrmn as PUSHBUTTON
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCTabular as PUSHBUTTON
	protect oCCALTERAR as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCNOVO as PUSHBUTTON
	protect oCCpegMP as PUSHBUTTON
	protect oCCescMP as PUSHBUTTON
	protect oDCFT6 as FIXEDTEXT
	protect oCCpegped as PUSHBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oCCpegcrmr1 as PUSHBUTTON
	protect oCCpegcrmn1 as PUSHBUTTON
	protect oCCpegcrmr2 as PUSHBUTTON
	protect oCCpegcrmn2 as PUSHBUTTON
	protect oCCpegcod1 as PUSHBUTTON
	protect oDCFT10 as FIXEDTEXT
	protect oCCPEGAR as PUSHBUTTON
	protect oCCPEGARR as PUSHBUTTON
	protect oCCPEGARA as PUSHBUTTON
	protect oCCPEGARF as PUSHBUTTON
	protect oCCcmdAnual as PUSHBUTTON
	protect oDCLANCADO as SINGLELINEEDIT
	protect oDCFixedText21 as FIXEDTEXT
	protect oDCLANCADO1 as SINGLELINEEDIT
	protect oDCSC_PESO1 as FIXEDTEXT
	protect oDCSC_PESO3 as FIXEDTEXT
	protect oDCSC_NFNOSSA3 as FIXEDTEXT
	protect oDCSC_NFUSINA2 as FIXEDTEXT
	protect oCCPeglxdiz as PUSHBUTTON
	protect oCCatuforlx as PUSHBUTTON
	protect oCCAtuLogixMu as PUSHBUTTON
	protect oCCPeglxdiz1 as PUSHBUTTON
	protect oDCLXFORNC as SINGLELINEEDIT
	protect oDCLXFORNU as SINGLELINEEDIT
	protect oCCPeglxforu as PUSHBUTTON
	protect oCCPeglxforc as PUSHBUTTON
// 	instance DATA 
// 	instance NFNOSSA 
// 	instance RASTRO 
// 	instance CRM 
// 	instance CRMITEM 
// 	instance PEPED 
// 	instance PEITE 
// 	instance CODIGO 
// 	instance DESCRICAO 
// 	instance LOCALUSO 
// 	instance ESP 
// 	instance LAR 
// 	instance PESO 
// 	instance NFORNU 
// 	instance MFORNU 
// 	instance NFUSINA 
// 	instance CRMITEMU 
// 	instance RASTROU 
// 	instance NFORN 
// 	instance MFORN 
// 	instance AC 
// 	instance OBS01 
// 	instance OBS02 
// 	instance REFDATA 
// 	instance REFNF 
// 	instance REFQTDE 
// 	instance CODIGOTMP 
// 	instance DESCRICAOTMP 
// 	instance APLICACAOTMP 
// 	instance NUMERO 
// 	instance LANCADO 
// 	instance LANCADO1 
// 	instance LXFORNC 
// 	instance LXFORNU 
	protect oSFjpcortei as jpcortei

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AC() 
return self:FieldGet(#AC)


assign AC(uValue) 
self:FieldPut(#AC, uValue)
return AC := uValue


access APLICACAOTMP() 
return self:FieldGet(#APLICACAOTMP)


assign APLICACAOTMP(uValue) 
self:FieldPut(#APLICACAOTMP, uValue)
return APLICACAOTMP := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODIGOTMP() 
return self:FieldGet(#CODIGOTMP)


assign CODIGOTMP(uValue) 
self:FieldPut(#CODIGOTMP, uValue)
return CODIGOTMP := uValue


access CRM() 
return self:FieldGet(#CRM)


assign CRM(uValue) 
self:FieldPut(#CRM, uValue)
return CRM := uValue


access CRMITEM() 
return self:FieldGet(#CRMITEM)


assign CRMITEM(uValue) 
self:FieldPut(#CRMITEM, uValue)
return CRMITEM := uValue


access CRMITEMU() 
return self:FieldGet(#CRMITEMU)


assign CRMITEMU(uValue) 
self:FieldPut(#CRMITEMU, uValue)
return CRMITEMU := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access DESCRICAO() 
return self:FieldGet(#DESCRICAO)


assign DESCRICAO(uValue) 
self:FieldPut(#DESCRICAO, uValue)
return DESCRICAO := uValue


access DESCRICAOTMP() 
return self:FieldGet(#DESCRICAOTMP)


assign DESCRICAOTMP(uValue) 
self:FieldPut(#DESCRICAOTMP, uValue)
return DESCRICAOTMP := uValue


access ESP() 
return self:FieldGet(#ESP)


assign ESP(uValue) 
self:FieldPut(#ESP, uValue)
return ESP := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jpcorte",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDATA := DateSle{self,ResourceID{JPCORTE_DATA,_GetInst()}}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Esp:",NULL_STRING,"PCORTE_ESP"}
oDCDATA:FieldSpec := DATE_FIELD{}

oDCNFNOSSA := rightSle{self,ResourceID{JPCORTE_NFNOSSA,_GetInst()}}
oDCNFNOSSA:FieldSpec := PADRAO_NUM_08{}
oDCNFNOSSA:HyperLabel := HyperLabel{#NFNOSSA,"Nfnossa:",NULL_STRING,"PCORTE_NFNOSSA"}

oDCRASTRO := SingleLineEdit{self,ResourceID{JPCORTE_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := PADRAO_CHAR_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"PCORTE_RASTRO"}

oDCCRM := rightSle{self,ResourceID{JPCORTE_CRM,_GetInst()}}
oDCCRM:FieldSpec := PADRAO_nUM_08{}
oDCCRM:HyperLabel := HyperLabel{#CRM,"Crm:",NULL_STRING,"PCORTE_CRM"}

oDCCRMITEM := rightSle{self,ResourceID{JPCORTE_CRMITEM,_GetInst()}}
oDCCRMITEM:FieldSpec := PADRAO_NUM_03{}
oDCCRMITEM:HyperLabel := HyperLabel{#CRMITEM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCRMITEM:FocusSelect := FSEL_ALL
oDCCRMITEM:TooltipText := "Item do Pedido de Compras"

oDCPEPED := rightSle{self,ResourceID{JPCORTE_PEPED,_GetInst()}}
oDCPEPED:FieldSpec := PADRAO_NUM_08{}
oDCPEPED:HyperLabel := HyperLabel{#PEPED,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPEPED:FocusSelect := FSEL_ALL
oDCPEPED:TooltipText := "Numero do Pedido de Compras"

oDCPEITE := rightSle{self,ResourceID{JPCORTE_PEITE,_GetInst()}}
oDCPEITE:FieldSpec := PADRAO_NUM_03{}
oDCPEITE:HyperLabel := HyperLabel{#PEITE,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPEITE:FocusSelect := FSEL_ALL
oDCPEITE:TooltipText := "Item do Pedido de Compras"

oDCCODIGO := SingleLineEdit{self,ResourceID{JPCORTE_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"PCORTEI_CODIGO"}

oDCDESCRICAO := SingleLineEdit{self,ResourceID{JPCORTE_DESCRICAO,_GetInst()}}
oDCDESCRICAO:FieldSpec := PADRAO_CHAR_100{}
oDCDESCRICAO:HyperLabel := HyperLabel{#DESCRICAO,"Descricao:",NULL_STRING,"PCORTEI_DESCRICAO"}

oDCLOCALUSO := SingleLineEdit{self,ResourceID{JPCORTE_LOCALUSO,_GetInst()}}
oDCLOCALUSO:FieldSpec := PADRAO_CHAR_10{}
oDCLOCALUSO:HyperLabel := HyperLabel{#LOCALUSO,"Localuso:",NULL_STRING,"PCORTE_LOCALUSO"}

oDCESP := rightSle{self,ResourceID{JPCORTE_ESP,_GetInst()}}
oDCESP:HyperLabel := HyperLabel{#ESP,"Esp:",NULL_STRING,"PCORTE_ESP"}
oDCESP:FieldSpec := PADRAO_NUM_10_4{}

oDCLAR := rightSle{self,ResourceID{JPCORTE_LAR,_GetInst()}}
oDCLAR:FieldSpec := PADRAO_NUM_10_4{}
oDCLAR:HyperLabel := HyperLabel{#LAR,"Lar:",NULL_STRING,"PCORTE_LAR"}

oDCPESO := rightSle{self,ResourceID{JPCORTE_PESO,_GetInst()}}
oDCPESO:FieldSpec := PADRAO_NUM_08{}
oDCPESO:HyperLabel := HyperLabel{#PESO,"Peso:",NULL_STRING,"PCORTE_PESO"}

oDCNFORNU := rightSle{self,ResourceID{JPCORTE_NFORNU,_GetInst()}}
oDCNFORNU:FieldSpec := PADRAO_NUM_08{}
oDCNFORNU:HyperLabel := HyperLabel{#NFORNU,"Nfornu:",NULL_STRING,"PCORTE_NFORNU"}

oDCMFORNU := SingleLineEdit{self,ResourceID{JPCORTE_MFORNU,_GetInst()}}
oDCMFORNU:FieldSpec := PADRAO_CHAR_40{}
oDCMFORNU:HyperLabel := HyperLabel{#MFORNU,"Mfornu:",NULL_STRING,"PCORTE_MFORNU"}

oDCNFUSINA := rightSle{self,ResourceID{JPCORTE_NFUSINA,_GetInst()}}
oDCNFUSINA:FieldSpec := PADRAO_NUM_08{}
oDCNFUSINA:HyperLabel := HyperLabel{#NFUSINA,"Nfusina:",NULL_STRING,"PCORTE_NFUSINA"}

oDCCRMITEMU := rightSle{self,ResourceID{JPCORTE_CRMITEMU,_GetInst()}}
oDCCRMITEMU:FieldSpec := PADRAO_NUM_03{}
oDCCRMITEMU:HyperLabel := HyperLabel{#CRMITEMU,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCRMITEMU:FocusSelect := FSEL_ALL
oDCCRMITEMU:TooltipText := "Item do Pedido de Compras"

oDCRASTROU := SingleLineEdit{self,ResourceID{JPCORTE_RASTROU,_GetInst()}}
oDCRASTROU:FieldSpec := PADRAO_CHAR_12{}
oDCRASTROU:HyperLabel := HyperLabel{#RASTROU,"Rastrou:",NULL_STRING,"PCORTE_RASTROU"}

oDCNFORN := rightSle{self,ResourceID{JPCORTE_NFORN,_GetInst()}}
oDCNFORN:FieldSpec := PADRAO_NUM_08{}
oDCNFORN:HyperLabel := HyperLabel{#NFORN,"Nforn:",NULL_STRING,"PCORTE_NFORN"}

oDCMFORN := SingleLineEdit{self,ResourceID{JPCORTE_MFORN,_GetInst()}}
oDCMFORN:FieldSpec := PADRAO_CHAR_40{}
oDCMFORN:HyperLabel := HyperLabel{#MFORN,"Mforn:",NULL_STRING,"PCORTE_MFORN"}

oDCAC := SingleLineEdit{self,ResourceID{JPCORTE_AC,_GetInst()}}
oDCAC:FieldSpec := PADRAO_CHAR_15{}
oDCAC:HyperLabel := HyperLabel{#AC,"Ac:",NULL_STRING,"PCORTE_AC"}

oDCOBS01 := SingleLineEdit{self,ResourceID{JPCORTE_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := PADRAO_CHAR_80{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Obs01:",NULL_STRING,"PCORTE_OBS01"}

oDCOBS02 := SingleLineEdit{self,ResourceID{JPCORTE_OBS02,_GetInst()}}
oDCOBS02:FieldSpec := PADRAO_CHAR_80{}
oDCOBS02:HyperLabel := HyperLabel{#OBS02,"Obs02:",NULL_STRING,"PCORTE_OBS02"}

oDCREFDATA := DateSle{self,ResourceID{JPCORTE_REFDATA,_GetInst()}}
oDCREFDATA:HyperLabel := HyperLabel{#REFDATA,"Esp:",NULL_STRING,"PCORTE_ESP"}
oDCREFDATA:FieldSpec := DATE_FIELD{}

oDCREFNF := rightSle{self,ResourceID{JPCORTE_REFNF,_GetInst()}}
oDCREFNF:FieldSpec := PADRAO_NUM_08{}
oDCREFNF:HyperLabel := HyperLabel{#REFNF,"Nfusina:",NULL_STRING,"PCORTE_NFUSINA"}

oDCREFQTDE := rightSle{self,ResourceID{JPCORTE_REFQTDE,_GetInst()}}
oDCREFQTDE:FieldSpec := PADRAO_NUM_08{}
oDCREFQTDE:HyperLabel := HyperLabel{#REFQTDE,"Peso:",NULL_STRING,"PCORTE_PESO"}

oDCCODIGOTMP := SingleLineEdit{self,ResourceID{JPCORTE_CODIGOTMP,_GetInst()}}
oDCCODIGOTMP:FieldSpec := padrao_char_24{}
oDCCODIGOTMP:HyperLabel := HyperLabel{#CODIGOTMP,"Codigo:",NULL_STRING,"PCORTEI_CODIGO"}

oDCDESCRICAOTMP := SingleLineEdit{self,ResourceID{JPCORTE_DESCRICAOTMP,_GetInst()}}
oDCDESCRICAOTMP:FieldSpec := PADRAO_CHAR_100{}
oDCDESCRICAOTMP:HyperLabel := HyperLabel{#DESCRICAOTMP,"Descricao:",NULL_STRING,"PCORTEI_DESCRICAO"}

oDCAPLICACAOTMP := SingleLineEdit{self,ResourceID{JPCORTE_APLICACAOTMP,_GetInst()}}
oDCAPLICACAOTMP:FieldSpec := PADRAO_CHAR_100{}
oDCAPLICACAOTMP:HyperLabel := HyperLabel{#APLICACAOTMP,"Descricao:",NULL_STRING,"PCORTEI_DESCRICAO"}

oDCSC_NUMERO := FixedText{self,ResourceID{JPCORTE_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_NFNOSSA := FixedText{self,ResourceID{JPCORTE_SC_NFNOSSA,_GetInst()}}
oDCSC_NFNOSSA:HyperLabel := HyperLabel{#SC_NFNOSSA,"Nossa NF",NULL_STRING,NULL_STRING}

oDCSC_NFUSINA := FixedText{self,ResourceID{JPCORTE_SC_NFUSINA,_GetInst()}}
oDCSC_NFUSINA:HyperLabel := HyperLabel{#SC_NFUSINA,"Usina NF",NULL_STRING,NULL_STRING}

oDCSC_RASTROU := FixedText{self,ResourceID{JPCORTE_SC_RASTROU,_GetInst()}}
oDCSC_RASTROU:HyperLabel := HyperLabel{#SC_RASTROU,"Usina Rastro:",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{JPCORTE_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro/Lote",NULL_STRING,NULL_STRING}

oDCSC_ESP := FixedText{self,ResourceID{JPCORTE_SC_ESP,_GetInst()}}
oDCSC_ESP:HyperLabel := HyperLabel{#SC_ESP,"Esp:",NULL_STRING,NULL_STRING}

oDCSC_LAR := FixedText{self,ResourceID{JPCORTE_SC_LAR,_GetInst()}}
oDCSC_LAR:HyperLabel := HyperLabel{#SC_LAR,"Lar:",NULL_STRING,NULL_STRING}

oDCSC_PESO := FixedText{self,ResourceID{JPCORTE_SC_PESO,_GetInst()}}
oDCSC_PESO:HyperLabel := HyperLabel{#SC_PESO,"Peso:",NULL_STRING,NULL_STRING}

oDCSC_LOCALUSO := FixedText{self,ResourceID{JPCORTE_SC_LOCALUSO,_GetInst()}}
oDCSC_LOCALUSO:HyperLabel := HyperLabel{#SC_LOCALUSO,"Localuso:",NULL_STRING,NULL_STRING}

oDCSC_AC := FixedText{self,ResourceID{JPCORTE_SC_AC,_GetInst()}}
oDCSC_AC:HyperLabel := HyperLabel{#SC_AC,"A/C:",NULL_STRING,NULL_STRING}

oDCSC_CRM := FixedText{self,ResourceID{JPCORTE_SC_CRM,_GetInst()}}
oDCSC_CRM:HyperLabel := HyperLabel{#SC_CRM,"Crm/Rirm/ArSeq",NULL_STRING,NULL_STRING}

oDCSC_OBS01 := FixedText{self,ResourceID{JPCORTE_SC_OBS01,_GetInst()}}
oDCSC_OBS01:HyperLabel := HyperLabel{#SC_OBS01,"Obs:",NULL_STRING,NULL_STRING}

oDCSC_NFORN := FixedText{self,ResourceID{JPCORTE_SC_NFORN,_GetInst()}}
oDCSC_NFORN:HyperLabel := HyperLabel{#SC_NFORN,"Usina",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JPCORTE_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"PCORTE_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]
oDCNUMERO:Font(aFonts[1], FALSE)

oDCSC_NFORN1 := FixedText{self,ResourceID{JPCORTE_SC_NFORN1,_GetInst()}}
oDCSC_NFORN1:HyperLabel := HyperLabel{#SC_NFORN1,"Fornecedor Corte",NULL_STRING,NULL_STRING}

oDCSC_NFNOSSA1 := FixedText{self,ResourceID{JPCORTE_SC_NFNOSSA1,_GetInst()}}
oDCSC_NFNOSSA1:HyperLabel := HyperLabel{#SC_NFNOSSA1,"Data",NULL_STRING,NULL_STRING}

oDCSC_NFORN2 := FixedText{self,ResourceID{JPCORTE_SC_NFORN2,_GetInst()}}
oDCSC_NFORN2:HyperLabel := HyperLabel{#SC_NFORN2,"Codigo",NULL_STRING,NULL_STRING}

oCCpegfor := PushButton{self,ResourceID{JPCORTE_PEGFOR,_GetInst()}}
oCCpegfor:HyperLabel := HyperLabel{#pegfor,"-->",NULL_STRING,NULL_STRING}
oCCpegfor:TooltipText := "Clique Para Trazer o Nome do Fornecedor"

oCCescfor := PushButton{self,ResourceID{JPCORTE_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}
oCCescfor:TooltipText := "Escolher Fornecedor "

oCCpegforU := PushButton{self,ResourceID{JPCORTE_PEGFORU,_GetInst()}}
oCCpegforU:HyperLabel := HyperLabel{#pegforU,"-->",NULL_STRING,NULL_STRING}
oCCpegforU:TooltipText := "Clique Para Trazer o Nome do Fornecedor"

oCCescforU := PushButton{self,ResourceID{JPCORTE_ESCFORU,_GetInst()}}
oCCescforU:HyperLabel := HyperLabel{#escforU,"...",NULL_STRING,NULL_STRING}
oCCescforU:TooltipText := "Escolher Fornecedor "

oCCpegcod := PushButton{self,ResourceID{JPCORTE_PEGCOD,_GetInst()}}
oCCpegcod:HyperLabel := HyperLabel{#pegcod,"-->",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JPCORTE_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oCCpegcrmr := PushButton{self,ResourceID{JPCORTE_PEGCRMR,_GetInst()}}
oCCpegcrmr:HyperLabel := HyperLabel{#pegcrmr,"CRM->",NULL_STRING,NULL_STRING}

oCCpegcrmn := PushButton{self,ResourceID{JPCORTE_PEGCRMN,_GetInst()}}
oCCpegcrmn:HyperLabel := HyperLabel{#pegcrmn,"CRM-->",NULL_STRING,NULL_STRING}

oCCProximo := PushButton{self,ResourceID{JPCORTE_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_next{}
oCCProximo:TooltipText := "Avanca Item Posterior"

oCCAnterior := PushButton{self,ResourceID{JPCORTE_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_previous{}
oCCAnterior:TooltipText := "Retorna Item anterior"

oCCTabular := PushButton{self,ResourceID{JPCORTE_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Ver Itens",NULL_STRING,NULL_STRING}
oCCTabular:TooltipText := "Exibir Lista Itens"

oCCALTERAR := PushButton{self,ResourceID{JPCORTE_ALTERAR,_GetInst()}}
oCCALTERAR:HyperLabel := HyperLabel{#ALTERAR,"Alterar",NULL_STRING,NULL_STRING}
oCCALTERAR:TooltipText := "Editar O Item do Orçamento"

oCCExcluir := PushButton{self,ResourceID{JPCORTE_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}
oCCExcluir:TooltipText := "Exclui o Item em destaque"

oCCNOVO := PushButton{self,ResourceID{JPCORTE_NOVO,_GetInst()}}
oCCNOVO:HyperLabel := HyperLabel{#NOVO,"Novo",NULL_STRING,NULL_STRING}
oCCNOVO:TooltipText := "Inclui um Item no Orçamento"

oCCpegMP := PushButton{self,ResourceID{JPCORTE_PEGMP,_GetInst()}}
oCCpegMP:HyperLabel := HyperLabel{#pegMP,"-->",NULL_STRING,NULL_STRING}

oCCescMP := PushButton{self,ResourceID{JPCORTE_ESCMP,_GetInst()}}
oCCescMP:HyperLabel := HyperLabel{#escMP,"...",NULL_STRING,NULL_STRING}

oDCFT6 := FixedText{self,ResourceID{JPCORTE_FT6,_GetInst()}}
oDCFT6:HyperLabel := HyperLabel{#FT6,"Pedido",NULL_STRING,NULL_STRING}

oCCpegped := PushButton{self,ResourceID{JPCORTE_PEGPED,_GetInst()}}
oCCpegped:HyperLabel := HyperLabel{#pegped,"-->",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JPCORTE_POROV,_GetInst()}}
oCCporov:Image := ico_aZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Clique para ordenar por Numero"

oCCbuscaov := PushButton{self,ResourceID{JPCORTE_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ico_find{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaov:TooltipText := "Clique Para Localizar Por Numero"

oCCpegcrmr1 := PushButton{self,ResourceID{JPCORTE_PEGCRMR1,_GetInst()}}
oCCpegcrmr1:HyperLabel := HyperLabel{#pegcrmr1,"RIRM->",NULL_STRING,NULL_STRING}

oCCpegcrmn1 := PushButton{self,ResourceID{JPCORTE_PEGCRMN1,_GetInst()}}
oCCpegcrmn1:HyperLabel := HyperLabel{#pegcrmn1,"RIRM-->",NULL_STRING,NULL_STRING}

oCCpegcrmr2 := PushButton{self,ResourceID{JPCORTE_PEGCRMR2,_GetInst()}}
oCCpegcrmr2:HyperLabel := HyperLabel{#pegcrmr2,"CRM->",NULL_STRING,NULL_STRING}

oCCpegcrmn2 := PushButton{self,ResourceID{JPCORTE_PEGCRMN2,_GetInst()}}
oCCpegcrmn2:HyperLabel := HyperLabel{#pegcrmn2,"RIRM-->",NULL_STRING,NULL_STRING}

oCCpegcod1 := PushButton{self,ResourceID{JPCORTE_PEGCOD1,_GetInst()}}
oCCpegcod1:HyperLabel := HyperLabel{#pegcod1,"-->",NULL_STRING,NULL_STRING}

oDCFT10 := FixedText{self,ResourceID{JPCORTE_FT10,_GetInst()}}
oDCFT10:HyperLabel := HyperLabel{#FT10,"AR:",NULL_STRING,NULL_STRING}

oCCPEGAR := PushButton{self,ResourceID{JPCORTE_PEGAR,_GetInst()}}
oCCPEGAR:HyperLabel := HyperLabel{#PEGAR,"-->",NULL_STRING,NULL_STRING}

oCCPEGARR := PushButton{self,ResourceID{JPCORTE_PEGARR,_GetInst()}}
oCCPEGARR:HyperLabel := HyperLabel{#PEGARR,"AR->",NULL_STRING,NULL_STRING}

oCCPEGARA := PushButton{self,ResourceID{JPCORTE_PEGARA,_GetInst()}}
oCCPEGARA:HyperLabel := HyperLabel{#PEGARA,"AR->",NULL_STRING,NULL_STRING}

oCCPEGARF := PushButton{self,ResourceID{JPCORTE_PEGARF,_GetInst()}}
oCCPEGARF:HyperLabel := HyperLabel{#PEGARF,"AR->",NULL_STRING,NULL_STRING}

oCCcmdAnual := PushButton{self,ResourceID{JPCORTE_CMDANUAL,_GetInst()}}
oCCcmdAnual:HyperLabel := HyperLabel{#cmdAnual,"Sim/Nao",NULL_STRING,NULL_STRING}

oDCLANCADO := SingleLineEdit{self,ResourceID{JPCORTE_LANCADO,_GetInst()}}
oDCLANCADO:FieldSpec := PADRAO_CHAR_01{}
oDCLANCADO:HyperLabel := HyperLabel{#LANCADO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCLANCADO:BackGround := aBrushes[1]
oDCLANCADO:Font(aFonts[1], FALSE)

oDCFixedText21 := FixedText{self,ResourceID{JPCORTE_FIXEDTEXT21,_GetInst()}}
oDCFixedText21:HyperLabel := HyperLabel{#FixedText21,"Lancada Entrada",NULL_STRING,NULL_STRING}

oDCLANCADO1 := SingleLineEdit{self,ResourceID{JPCORTE_LANCADO1,_GetInst()}}
oDCLANCADO1:FieldSpec := PADRAO_CHAR_01{}
oDCLANCADO1:HyperLabel := HyperLabel{#LANCADO1,NULL_STRING,NULL_STRING,NULL_STRING}
oDCLANCADO1:BackGround := aBrushes[1]
oDCLANCADO1:Font(aFonts[1], FALSE)

oDCSC_PESO1 := FixedText{self,ResourceID{JPCORTE_SC_PESO1,_GetInst()}}
oDCSC_PESO1:HyperLabel := HyperLabel{#SC_PESO1,"TipoCrm",NULL_STRING,NULL_STRING}

oDCSC_PESO3 := FixedText{self,ResourceID{JPCORTE_SC_PESO3,_GetInst()}}
oDCSC_PESO3:HyperLabel := HyperLabel{#SC_PESO3,"Peso:",NULL_STRING,NULL_STRING}

oDCSC_NFNOSSA3 := FixedText{self,ResourceID{JPCORTE_SC_NFNOSSA3,_GetInst()}}
oDCSC_NFNOSSA3:HyperLabel := HyperLabel{#SC_NFNOSSA3,"data",NULL_STRING,NULL_STRING}

oDCSC_NFUSINA2 := FixedText{self,ResourceID{JPCORTE_SC_NFUSINA2,_GetInst()}}
oDCSC_NFUSINA2:HyperLabel := HyperLabel{#SC_NFUSINA2,"NF",NULL_STRING,NULL_STRING}

oCCPeglxdiz := PushButton{self,ResourceID{JPCORTE_PEGLXDIZ,_GetInst()}}
oCCPeglxdiz:HyperLabel := HyperLabel{#Peglxdiz,"LX",NULL_STRING,NULL_STRING}

oCCatuforlx := PushButton{self,ResourceID{JPCORTE_ATUFORLX,_GetInst()}}
oCCatuforlx:HyperLabel := HyperLabel{#atuforlx,"Atualizar Fornecedor",NULL_STRING,NULL_STRING}

oCCAtuLogixMu := PushButton{self,ResourceID{JPCORTE_ATULOGIXMU,_GetInst()}}
oCCAtuLogixMu:HyperLabel := HyperLabel{#AtuLogixMu,"AtualizaMPrima",NULL_STRING,NULL_STRING}

oCCPeglxdiz1 := PushButton{self,ResourceID{JPCORTE_PEGLXDIZ1,_GetInst()}}
oCCPeglxdiz1:HyperLabel := HyperLabel{#Peglxdiz1,"LX",NULL_STRING,NULL_STRING}

oDCLXFORNC := SingleLineEdit{self,ResourceID{JPCORTE_LXFORNC,_GetInst()}}
oDCLXFORNC:HyperLabel := HyperLabel{#LXFORNC,NULL_STRING,NULL_STRING,"PCORTE_RASTROU"}
oDCLXFORNC:FieldSpec := PADRAO_CHAR_15{}

oDCLXFORNU := SingleLineEdit{self,ResourceID{JPCORTE_LXFORNU,_GetInst()}}
oDCLXFORNU:HyperLabel := HyperLabel{#LXFORNU,NULL_STRING,NULL_STRING,"PCORTE_RASTROU"}
oDCLXFORNU:FieldSpec := PADRAO_CHAR_15{}

oCCPeglxforu := PushButton{self,ResourceID{JPCORTE_PEGLXFORU,_GetInst()}}
oCCPeglxforu:HyperLabel := HyperLabel{#Peglxforu,"LX",NULL_STRING,NULL_STRING}

oCCPeglxforc := PushButton{self,ResourceID{JPCORTE_PEGLXFORC,_GetInst()}}
oCCPeglxforc:HyperLabel := HyperLabel{#Peglxforc,"LX",NULL_STRING,NULL_STRING}

self:Caption := "Plano de Corte"
self:HyperLabel := HyperLabel{#jpcorte,"Plano de Corte",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBRASTRO := DataColumn{PADRAO_CHAR_12{}}
oDBRASTRO:Width := 14
oDBRASTRO:HyperLabel := oDCRASTRO:HyperLabel 
oDBRASTRO:Caption := "Rastro:"
self:Browser:AddColumn(oDBRASTRO)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 20
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBDESCRICAO := DataColumn{PADRAO_CHAR_100{}}
oDBDESCRICAO:Width := 20
oDBDESCRICAO:HyperLabel := oDCDESCRICAO:HyperLabel 
oDBDESCRICAO:Caption := "Descricao:"
self:Browser:AddColumn(oDBDESCRICAO)


self:ViewAs(#FormView)

oSFjpcortei := jpcortei{self,JPCORTE_JPCORTEI}
oSFjpcortei:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LANCADO() 
return self:FieldGet(#LANCADO)


assign LANCADO(uValue) 
self:FieldPut(#LANCADO, uValue)
return LANCADO := uValue


access LANCADO1() 
return self:FieldGet(#LANCADO1)


assign LANCADO1(uValue) 
self:FieldPut(#LANCADO1, uValue)
return LANCADO1 := uValue


access LAR() 
return self:FieldGet(#LAR)


assign LAR(uValue) 
self:FieldPut(#LAR, uValue)
return LAR := uValue


access LOCALUSO() 
return self:FieldGet(#LOCALUSO)


assign LOCALUSO(uValue) 
self:FieldPut(#LOCALUSO, uValue)
return LOCALUSO := uValue


access LXFORNC() 
return self:FieldGet(#LXFORNC)


assign LXFORNC(uValue) 
self:FieldPut(#LXFORNC, uValue)
return LXFORNC := uValue


access LXFORNU() 
return self:FieldGet(#LXFORNU)


assign LXFORNU(uValue) 
self:FieldPut(#LXFORNU, uValue)
return LXFORNU := uValue


access MFORN() 
return self:FieldGet(#MFORN)


assign MFORN(uValue) 
self:FieldPut(#MFORN, uValue)
return MFORN := uValue


access MFORNU() 
return self:FieldGet(#MFORNU)


assign MFORNU(uValue) 
self:FieldPut(#MFORNU, uValue)
return MFORNU := uValue


access NFNOSSA() 
return self:FieldGet(#NFNOSSA)


assign NFNOSSA(uValue) 
self:FieldPut(#NFNOSSA, uValue)
return NFNOSSA := uValue


access NFORN() 
return self:FieldGet(#NFORN)


assign NFORN(uValue) 
self:FieldPut(#NFORN, uValue)
return NFORN := uValue


access NFORNU() 
return self:FieldGet(#NFORNU)


assign NFORNU(uValue) 
self:FieldPut(#NFORNU, uValue)
return NFORNU := uValue


access NFUSINA() 
return self:FieldGet(#NFUSINA)


assign NFUSINA(uValue) 
self:FieldPut(#NFUSINA, uValue)
return NFUSINA := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


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


access PEITE() 
return self:FieldGet(#PEITE)


assign PEITE(uValue) 
self:FieldPut(#PEITE, uValue)
return PEITE := uValue


access PEPED() 
return self:FieldGet(#PEPED)


assign PEPED(uValue) 
self:FieldPut(#PEPED, uValue)
return PEPED := uValue


access PESO() 
return self:FieldGet(#PESO)


assign PESO(uValue) 
self:FieldPut(#PESO, uValue)
return PESO := uValue


access RASTRO() 
return self:FieldGet(#RASTRO)


assign RASTRO(uValue) 
self:FieldPut(#RASTRO, uValue)
return RASTRO := uValue


access RASTROU() 
return self:FieldGet(#RASTROU)


assign RASTROU(uValue) 
self:FieldPut(#RASTROU, uValue)
return RASTROU := uValue


access REFDATA() 
return self:FieldGet(#REFDATA)


assign REFDATA(uValue) 
self:FieldPut(#REFDATA, uValue)
return REFDATA := uValue


access REFNF() 
return self:FieldGet(#REFNF)


assign REFNF(uValue) 
self:FieldPut(#REFNF, uValue)
return REFNF := uValue


access REFQTDE() 
return self:FieldGet(#REFQTDE)


assign REFQTDE(uValue) 
self:FieldPut(#REFQTDE, uValue)
return REFQTDE := uValue


END CLASS
