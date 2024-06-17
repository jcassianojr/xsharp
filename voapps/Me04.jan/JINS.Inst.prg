#region DEFINES
STATIC DEFINE JINS_APLIC := 106 
STATIC DEFINE JINS_APLICACAO := 102 
STATIC DEFINE JINS_ATIVO := 118 
STATIC DEFINE JINS_BUSCA := 151 
STATIC DEFINE JINS_CADTIP := 100 
STATIC DEFINE JINS_CALIBRAR := 121 
STATIC DEFINE JINS_CALPRO := 147 
STATIC DEFINE JINS_CALULT := 156 
STATIC DEFINE JINS_CAPACI := 110 
STATIC DEFINE JINS_CODFOR := 114 
STATIC DEFINE JINS_CODIGO := 130 
STATIC DEFINE JINS_CODTIPO := 105 
STATIC DEFINE JINS_COGFOR := 115 
STATIC DEFINE JINS_COMPRA := 116 
STATIC DEFINE JINS_DATAEXT := 158 
STATIC DEFINE JINS_DATAFIM := 168 
STATIC DEFINE JINS_DATAUSO := 169 
STATIC DEFINE JINS_DESENHO := 103 
STATIC DEFINE JINS_DIVI := 111 
STATIC DEFINE JINS_ERROADM := 112 
STATIC DEFINE JINS_ESCAPL := 167 
STATIC DEFINE JINS_ESCFOR := 153 
STATIC DEFINE JINS_ESCPF := 172 
STATIC DEFINE JINS_FOTO := 163 
STATIC DEFINE JINS_FT23 := 155 
STATIC DEFINE JINS_FT24 := 149 
STATIC DEFINE JINS_FT25 := 150 
STATIC DEFINE JINS_MARCA := 109 
STATIC DEFINE JINS_MODELO := 113 
STATIC DEFINE JINS_NOMTIPO := 101 
STATIC DEFINE JINS_NORMA := 108 
STATIC DEFINE JINS_OBS01 := 123 
STATIC DEFINE JINS_OBS02 := 124 
STATIC DEFINE JINS_OBS03 := 125 
STATIC DEFINE JINS_PEGCAL := 157 
STATIC DEFINE JINS_PEGFOR := 152 
STATIC DEFINE JINS_PF := 160 
STATIC DEFINE JINS_PORNUM := 164 
STATIC DEFINE JINS_PRECO := 122 
STATIC DEFINE JINS_PUSHBUTTON6 := 165 
STATIC DEFINE JINS_PUSHBUTTON7 := 166 
STATIC DEFINE JINS_RRMDATA := 171 
STATIC DEFINE JINS_SC_APLIC := 129 
STATIC DEFINE JINS_SC_ATIVO := 140 
STATIC DEFINE JINS_SC_CADTIP := 127 
STATIC DEFINE JINS_SC_CALIBRAR := 144 
STATIC DEFINE JINS_SC_CALIBRAR1 := 154 
STATIC DEFINE JINS_SC_CALPRO := 146 
STATIC DEFINE JINS_SC_CALPRO1 := 159 
STATIC DEFINE JINS_SC_CALULT := 145 
STATIC DEFINE JINS_SC_CALULT1 := 170 
STATIC DEFINE JINS_SC_CAPACI := 133 
STATIC DEFINE JINS_SC_CODFOR := 137 
STATIC DEFINE JINS_SC_CODFOR1 := 161 
STATIC DEFINE JINS_SC_CODIGO := 126 
STATIC DEFINE JINS_SC_CODTIPO := 104 
STATIC DEFINE JINS_SC_COMPRA := 138 
STATIC DEFINE JINS_SC_DATAFIM := 143 
STATIC DEFINE JINS_SC_DATAUSO := 142 
STATIC DEFINE JINS_SC_DESTINO2 := 162 
STATIC DEFINE JINS_SC_DIME := 142 
STATIC DEFINE JINS_SC_DIVI := 134 
STATIC DEFINE JINS_SC_ERROADM := 135 
STATIC DEFINE JINS_SC_MARCA := 132 
STATIC DEFINE JINS_SC_MODELO := 136 
STATIC DEFINE JINS_SC_NORMA := 131 
STATIC DEFINE JINS_SC_SITUACAO := 141 
STATIC DEFINE JINS_SC_TIPO := 128 
STATIC DEFINE JINS_SC_VALOR := 139 
STATIC DEFINE JINS_SITUACAO := 119 
STATIC DEFINE JINS_THEFIXEDTEXT19 := 148 
STATIC DEFINE JINS_TIPCAL := 120 
STATIC DEFINE JINS_TIPO := 107 
STATIC DEFINE JINS_VALOR := 117 
#endregion

PARTIAL class JINS inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBTIPO as DataColumn
	PROTECT oDBNOMTIPO as DataColumn
	PROTECT oDBCODTIPO as DataColumn
	PROTECT oDBAPLICACAO as DataColumn
	protect oDCCADTIP as COMBOBOX
	protect oDCNOMTIPO as SINGLELINEEDIT
	protect oDCAPLICACAO as SINGLELINEEDIT
	protect oDCDESENHO as SINGLELINEEDIT
	protect oDCSC_CODTIPO as FIXEDTEXT
	protect oDCCODTIPO as COMBOBOX
	protect oDCAPLIC as SINGLELINEEDIT
	protect oDCTIPO as SINGLELINEEDIT
	protect oDCNORMA as SINGLELINEEDIT
	protect oDCMARCA as COMBOBOX
	protect oDCCAPACI as SINGLELINEEDIT
	protect oDCDIVI as SINGLELINEEDIT
	protect oDCERROADM as SINGLELINEEDIT
	protect oDCMODELO as SINGLELINEEDIT
	protect oDCCODFOR as RIGHTSLE
	protect oDCCOGFOR as SINGLELINEEDIT
	protect oDCCOMPRA as DATETIMEPICKER
	protect oDCVALOR as RIGHTSLE
	protect oDCATIVO as SINGLELINEEDIT
	protect oDCSITUACAO as COMBOBOX
	protect oDCTIPCAL as COMBOBOX
	protect oDCCALIBRAR as SINGLELINEEDIT
	protect oDCPRECO as RIGHTSLE
	protect oDCOBS01 as SINGLELINEEDIT
	protect oDCOBS02 as SINGLELINEEDIT
	protect oDCOBS03 as SINGLELINEEDIT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_CADTIP as FIXEDTEXT
	protect oDCSC_TIPO as FIXEDTEXT
	protect oDCSC_APLIC as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_NORMA as FIXEDTEXT
	protect oDCSC_MARCA as FIXEDTEXT
	protect oDCSC_CAPACI as FIXEDTEXT
	protect oDCSC_DIVI as FIXEDTEXT
	protect oDCSC_ERROADM as FIXEDTEXT
	protect oDCSC_MODELO as FIXEDTEXT
	protect oDCSC_CODFOR as FIXEDTEXT
	protect oDCSC_COMPRA as FIXEDTEXT
	protect oDCSC_VALOR as FIXEDTEXT
	protect oDCSC_ATIVO as FIXEDTEXT
	protect oDCSC_SITUACAO as FIXEDTEXT
	protect oDCSC_DATAUSO as FIXEDTEXT
	protect oDCSC_DATAFIM as FIXEDTEXT
	protect oDCSC_CALIBRAR as FIXEDTEXT
	protect oDCSC_CALULT as FIXEDTEXT
	protect oDCSC_CALPRO as FIXEDTEXT
	protect oDCCALPRO as SINGLELINEEDIT
	protect oDCtheFixedText19 as FIXEDTEXT
	protect oDCFT24 as FIXEDTEXT
	protect oDCFT25 as FIXEDTEXT
	protect oCCbusca as PUSHBUTTON
	protect oCCpegFOR as PUSHBUTTON
	protect oCCescfor as PUSHBUTTON
	protect oDCSC_CALIBRAR1 as FIXEDTEXT
	protect oDCFT23 as FIXEDTEXT
	protect oDCCALULT as SINGLELINEEDIT
	protect oCCpegcal as PUSHBUTTON
	protect oDCDATAEXT as SINGLELINEEDIT
	protect oDCSC_CALPRO1 as FIXEDTEXT
	protect oDCPF as RIGHTSLE
	protect oDCSC_CODFOR1 as FIXEDTEXT
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCpornum as PUSHBUTTON
	protect oCCPushButton6 as PUSHBUTTON
	protect oCCPushButton7 as PUSHBUTTON
	protect oDCESCAPL as COMBOBOX
	protect oDCDATAFIM as DATESLE
	protect oDCDATAUSO as DATESLE
	protect oDCSC_CALULT1 as FIXEDTEXT
	protect oDCRRMDATA as SINGLELINEEDIT
	protect oCCescPF as PUSHBUTTON
// 	instance CADTIP 
// 	instance NOMTIPO 
// 	instance APLICACAO 
// 	instance DESENHO 
// 	instance CODTIPO 
// 	instance APLIC 
// 	instance TIPO 
// 	instance NORMA 
// 	instance MARCA 
// 	instance CAPACI 
// 	instance DIVI 
// 	instance ERROADM 
// 	instance MODELO 
// 	instance CODFOR 
// 	instance COGFOR 
// 	instance VALOR 
// 	instance ATIVO 
// 	instance SITUACAO 
// 	instance TIPCAL 
// 	instance CALIBRAR 
// 	instance PRECO 
// 	instance OBS01 
// 	instance OBS02 
// 	instance OBS03 
// 	instance CODIGO 
// 	instance CALPRO 
// 	instance CALULT 
// 	instance DATAEXT 
// 	instance PF 
// 	instance ESCAPL 
// 	instance DATAFIM 
// 	instance DATAUSO 
// 	instance RRMDATA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access APLIC() 
return self:FieldGet(#APLIC)


assign APLIC(uValue) 
self:FieldPut(#APLIC, uValue)
return APLIC := uValue


access APLICACAO() 
return self:FieldGet(#APLICACAO)


assign APLICACAO(uValue) 
self:FieldPut(#APLICACAO, uValue)
return APLICACAO := uValue


access ATIVO() 
return self:FieldGet(#ATIVO)


assign ATIVO(uValue) 
self:FieldPut(#ATIVO, uValue)
return ATIVO := uValue


access CADTIP() 
return self:FieldGet(#CADTIP)


assign CADTIP(uValue) 
self:FieldPut(#CADTIP, uValue)
return CADTIP := uValue


access CALIBRAR() 
return self:FieldGet(#CALIBRAR)


assign CALIBRAR(uValue) 
self:FieldPut(#CALIBRAR, uValue)
return CALIBRAR := uValue


access CALPRO() 
return self:FieldGet(#CALPRO)


assign CALPRO(uValue) 
self:FieldPut(#CALPRO, uValue)
return CALPRO := uValue


access CALULT() 
return self:FieldGet(#CALULT)


assign CALULT(uValue) 
self:FieldPut(#CALULT, uValue)
return CALULT := uValue


access CAPACI() 
return self:FieldGet(#CAPACI)


assign CAPACI(uValue) 
self:FieldPut(#CAPACI, uValue)
return CAPACI := uValue


access CODFOR() 
return self:FieldGet(#CODFOR)


assign CODFOR(uValue) 
self:FieldPut(#CODFOR, uValue)
return CODFOR := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODTIPO() 
return self:FieldGet(#CODTIPO)


assign CODTIPO(uValue) 
self:FieldPut(#CODTIPO, uValue)
return CODTIPO := uValue


access COGFOR() 
return self:FieldGet(#COGFOR)


assign COGFOR(uValue) 
self:FieldPut(#COGFOR, uValue)
return COGFOR := uValue


access DATAEXT() 
return self:FieldGet(#DATAEXT)


assign DATAEXT(uValue) 
self:FieldPut(#DATAEXT, uValue)
return DATAEXT := uValue


access DATAFIM() 
return self:FieldGet(#DATAFIM)


assign DATAFIM(uValue) 
self:FieldPut(#DATAFIM, uValue)
return DATAFIM := uValue


access DATAUSO() 
return self:FieldGet(#DATAUSO)


assign DATAUSO(uValue) 
self:FieldPut(#DATAUSO, uValue)
return DATAUSO := uValue


access DESENHO() 
return self:FieldGet(#DESENHO)


assign DESENHO(uValue) 
self:FieldPut(#DESENHO, uValue)
return DESENHO := uValue


access DIVI() 
return self:FieldGet(#DIVI)


assign DIVI(uValue) 
self:FieldPut(#DIVI, uValue)
return DIVI := uValue


access ERROADM() 
return self:FieldGet(#ERROADM)


assign ERROADM(uValue) 
self:FieldPut(#ERROADM, uValue)
return ERROADM := uValue


access ESCAPL() 
return self:FieldGet(#ESCAPL)


assign ESCAPL(uValue) 
self:FieldPut(#ESCAPL, uValue)
return ESCAPL := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JINS",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,12,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCCADTIP := combobox{self,ResourceID{JINS_CADTIP,_GetInst()}}
oDCCADTIP:FieldSpec := padrao_char_30{}
oDCCADTIP:FillUsing(Self:TABTPC( ))
oDCCADTIP:HyperLabel := HyperLabel{#CADTIP,NULL_STRING,NULL_STRING,NULL_STRING}

oDCNOMTIPO := SingleLineEdit{self,ResourceID{JINS_NOMTIPO,_GetInst()}}
oDCNOMTIPO:FieldSpec := padrao_char_30{}
oDCNOMTIPO:HyperLabel := HyperLabel{#NOMTIPO,"Descrição",NULL_STRING,"ME04_NOMTIPO"}

oDCAPLICACAO := SingleLineEdit{self,ResourceID{JINS_APLICACAO,_GetInst()}}
oDCAPLICACAO:FieldSpec := padrao_char_24{}
oDCAPLICACAO:HyperLabel := HyperLabel{#APLICACAO,"Aplicação",NULL_STRING,NULL_STRING}

oDCDESENHO := SingleLineEdit{self,ResourceID{JINS_DESENHO,_GetInst()}}
oDCDESENHO:FieldSpec := PADRAO_CHAR_25{}
oDCDESENHO:HyperLabel := HyperLabel{#DESENHO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_CODTIPO := FixedText{self,ResourceID{JINS_SC_CODTIPO,_GetInst()}}
oDCSC_CODTIPO:HyperLabel := HyperLabel{#SC_CODTIPO,"Tipo:",NULL_STRING,NULL_STRING}

oDCCODTIPO := combobox{self,ResourceID{JINS_CODTIPO,_GetInst()}}
oDCCODTIPO:HyperLabel := HyperLabel{#CODTIPO,"Tipo",NULL_STRING,NULL_STRING}
oDCCODTIPO:FieldSpec := PADRAO_CHAR_03{}
oDCCODTIPO:FillUsing(Self:TABINS( ))

oDCAPLIC := SingleLineEdit{self,ResourceID{JINS_APLIC,_GetInst()}}
oDCAPLIC:FieldSpec := PADRAO_CHAR_30{}
oDCAPLIC:HyperLabel := HyperLabel{#APLIC,"Aplicacao",NULL_STRING,"ME04_APLIC"}

oDCTIPO := SingleLineEdit{self,ResourceID{JINS_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := PADRAO_CHAR_30{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo:",NULL_STRING,"ME04_TIPO"}

oDCNORMA := SingleLineEdit{self,ResourceID{JINS_NORMA,_GetInst()}}
oDCNORMA:FieldSpec := PADRAO_CHAR_30{}
oDCNORMA:HyperLabel := HyperLabel{#NORMA,"Norma:",NULL_STRING,"ME04_NORMA"}

oDCMARCA := combobox{self,ResourceID{JINS_MARCA,_GetInst()}}
oDCMARCA:FieldSpec := PADRAO_CHAR_20{}
oDCMARCA:FillUsing(Self:TABMAR( ))
oDCMARCA:HyperLabel := HyperLabel{#MARCA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCAPACI := SingleLineEdit{self,ResourceID{JINS_CAPACI,_GetInst()}}
oDCCAPACI:FieldSpec := PADRAO_CHAR_30{}
oDCCAPACI:HyperLabel := HyperLabel{#CAPACI,"Capaci:",NULL_STRING,"ME04_CAPACI"}

oDCDIVI := SingleLineEdit{self,ResourceID{JINS_DIVI,_GetInst()}}
oDCDIVI:FieldSpec := PADRAO_CHAR_10{}
oDCDIVI:HyperLabel := HyperLabel{#DIVI,"Divi:",NULL_STRING,"ME04_DIVI"}

oDCERROADM := SingleLineEdit{self,ResourceID{JINS_ERROADM,_GetInst()}}
oDCERROADM:FieldSpec := PADRAO_CHAR_15{}
oDCERROADM:HyperLabel := HyperLabel{#ERROADM,"Erroadm:",NULL_STRING,"ME04_ERROADM"}

oDCMODELO := SingleLineEdit{self,ResourceID{JINS_MODELO,_GetInst()}}
oDCMODELO:FieldSpec := PADRAO_CHAR_20{}
oDCMODELO:HyperLabel := HyperLabel{#MODELO,"Modelo:",NULL_STRING,"ME04_MODELO"}

oDCCODFOR := rightSle{self,ResourceID{JINS_CODFOR,_GetInst()}}
oDCCODFOR:FieldSpec := PADRAO_NUM_08{}
oDCCODFOR:HyperLabel := HyperLabel{#CODFOR,"Codfor:",NULL_STRING,"ME04_CODFOR"}

oDCCOGFOR := SingleLineEdit{self,ResourceID{JINS_COGFOR,_GetInst()}}
oDCCOGFOR:FieldSpec := PADRAO_CHAR_12{}
oDCCOGFOR:HyperLabel := HyperLabel{#COGFOR,"Cogfor:",NULL_STRING,"ME04_COGFOR"}

oDCCOMPRA := DateTimePicker{self,ResourceID{JINS_COMPRA,_GetInst()}}
oDCCOMPRA:FieldSpec := DATE_FIELD{}
oDCCOMPRA:HyperLabel := HyperLabel{#COMPRA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCVALOR := rightSle{self,ResourceID{JINS_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := PADRAO_NUM_09_2{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Valor:",NULL_STRING,"ME04_VALOR"}

oDCATIVO := SingleLineEdit{self,ResourceID{JINS_ATIVO,_GetInst()}}
oDCATIVO:FieldSpec := PADRAO_CHAR_01{}
oDCATIVO:HyperLabel := HyperLabel{#ATIVO,"Ativo:",NULL_STRING,"ME04_ATIVO"}

oDCSITUACAO := combobox{self,ResourceID{JINS_SITUACAO,_GetInst()}}
oDCSITUACAO:FieldSpec := PADRAO_CHAR_01{}
oDCSITUACAO:FillUsing(Self:TABSIT( ))
oDCSITUACAO:HyperLabel := HyperLabel{#SITUACAO,"Aplicação/Produto",NULL_STRING,NULL_STRING}

oDCTIPCAL := combobox{self,ResourceID{JINS_TIPCAL,_GetInst()}}
oDCTIPCAL:FieldSpec := PADRAO_CHAR_01{}
oDCTIPCAL:FillUsing(Self:TABTCA( ))
oDCTIPCAL:HyperLabel := HyperLabel{#TIPCAL,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCALIBRAR := SingleLineEdit{self,ResourceID{JINS_CALIBRAR,_GetInst()}}
oDCCALIBRAR:FieldSpec := PADRAO_NUM_03{}
oDCCALIBRAR:HyperLabel := HyperLabel{#CALIBRAR,"Calibrar:",NULL_STRING,"ME04_CALIBRAR"}
oDCCALIBRAR:BackGround := aBrushes[1]
oDCCALIBRAR:Font(aFonts[1], FALSE)

oDCPRECO := rightSle{self,ResourceID{JINS_PRECO,_GetInst()}}
oDCPRECO:FieldSpec := PADRAO_NUM_09_2{}
oDCPRECO:HyperLabel := HyperLabel{#PRECO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCOBS01 := SingleLineEdit{self,ResourceID{JINS_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := PADRAO_CHAR_70{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Obs01:",NULL_STRING,"ME04_OBS01"}

oDCOBS02 := SingleLineEdit{self,ResourceID{JINS_OBS02,_GetInst()}}
oDCOBS02:FieldSpec := PADRAO_CHAR_70{}
oDCOBS02:HyperLabel := HyperLabel{#OBS02,"Obs02:",NULL_STRING,"ME04_OBS02"}

oDCOBS03 := SingleLineEdit{self,ResourceID{JINS_OBS03,_GetInst()}}
oDCOBS03:FieldSpec := PADRAO_CHAR_70{}
oDCOBS03:HyperLabel := HyperLabel{#OBS03,"Obs03:",NULL_STRING,"ME04_OBS03"}

oDCSC_CODIGO := FixedText{self,ResourceID{JINS_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_CADTIP := FixedText{self,ResourceID{JINS_SC_CADTIP,_GetInst()}}
oDCSC_CADTIP:HyperLabel := HyperLabel{#SC_CADTIP,"Tipo",NULL_STRING,NULL_STRING}

oDCSC_TIPO := FixedText{self,ResourceID{JINS_SC_TIPO,_GetInst()}}
oDCSC_TIPO:HyperLabel := HyperLabel{#SC_TIPO,"Descrição",NULL_STRING,NULL_STRING}

oDCSC_APLIC := FixedText{self,ResourceID{JINS_SC_APLIC,_GetInst()}}
oDCSC_APLIC:HyperLabel := HyperLabel{#SC_APLIC,"Setor Area  Aplicacao",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JINS_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_08{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"ME04_CODIGO"}
oDCCODIGO:FocusSelect := FSEL_HOME
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[2], FALSE)

oDCSC_NORMA := FixedText{self,ResourceID{JINS_SC_NORMA,_GetInst()}}
oDCSC_NORMA:HyperLabel := HyperLabel{#SC_NORMA,"Norma:",NULL_STRING,NULL_STRING}

oDCSC_MARCA := FixedText{self,ResourceID{JINS_SC_MARCA,_GetInst()}}
oDCSC_MARCA:HyperLabel := HyperLabel{#SC_MARCA,"Marca:",NULL_STRING,NULL_STRING}

oDCSC_CAPACI := FixedText{self,ResourceID{JINS_SC_CAPACI,_GetInst()}}
oDCSC_CAPACI:HyperLabel := HyperLabel{#SC_CAPACI,"Capacidade:",NULL_STRING,NULL_STRING}

oDCSC_DIVI := FixedText{self,ResourceID{JINS_SC_DIVI,_GetInst()}}
oDCSC_DIVI:HyperLabel := HyperLabel{#SC_DIVI,"Divisão:",NULL_STRING,NULL_STRING}

oDCSC_ERROADM := FixedText{self,ResourceID{JINS_SC_ERROADM,_GetInst()}}
oDCSC_ERROADM:HyperLabel := HyperLabel{#SC_ERROADM,"Erro Admissivel",NULL_STRING,NULL_STRING}

oDCSC_MODELO := FixedText{self,ResourceID{JINS_SC_MODELO,_GetInst()}}
oDCSC_MODELO:HyperLabel := HyperLabel{#SC_MODELO,"Modelo:",NULL_STRING,NULL_STRING}

oDCSC_CODFOR := FixedText{self,ResourceID{JINS_SC_CODFOR,_GetInst()}}
oDCSC_CODFOR:HyperLabel := HyperLabel{#SC_CODFOR,"Fornecedor",NULL_STRING,NULL_STRING}

oDCSC_COMPRA := FixedText{self,ResourceID{JINS_SC_COMPRA,_GetInst()}}
oDCSC_COMPRA:HyperLabel := HyperLabel{#SC_COMPRA,"Compra:",NULL_STRING,NULL_STRING}

oDCSC_VALOR := FixedText{self,ResourceID{JINS_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor:",NULL_STRING,NULL_STRING}

oDCSC_ATIVO := FixedText{self,ResourceID{JINS_SC_ATIVO,_GetInst()}}
oDCSC_ATIVO:HyperLabel := HyperLabel{#SC_ATIVO,"Ativo:",NULL_STRING,NULL_STRING}

oDCSC_SITUACAO := FixedText{self,ResourceID{JINS_SC_SITUACAO,_GetInst()}}
oDCSC_SITUACAO:HyperLabel := HyperLabel{#SC_SITUACAO,"Situação:",NULL_STRING,NULL_STRING}

oDCSC_DATAUSO := FixedText{self,ResourceID{JINS_SC_DATAUSO,_GetInst()}}
oDCSC_DATAUSO:HyperLabel := HyperLabel{#SC_DATAUSO,"Data Inicial:",NULL_STRING,NULL_STRING}

oDCSC_DATAFIM := FixedText{self,ResourceID{JINS_SC_DATAFIM,_GetInst()}}
oDCSC_DATAFIM:HyperLabel := HyperLabel{#SC_DATAFIM,"Data Final:",NULL_STRING,NULL_STRING}

oDCSC_CALIBRAR := FixedText{self,ResourceID{JINS_SC_CALIBRAR,_GetInst()}}
oDCSC_CALIBRAR:HyperLabel := HyperLabel{#SC_CALIBRAR,"Calibração:",NULL_STRING,NULL_STRING}

oDCSC_CALULT := FixedText{self,ResourceID{JINS_SC_CALULT,_GetInst()}}
oDCSC_CALULT:HyperLabel := HyperLabel{#SC_CALULT,"Ultima","Data da Ultima Calibração",NULL_STRING}

oDCSC_CALPRO := FixedText{self,ResourceID{JINS_SC_CALPRO,_GetInst()}}
oDCSC_CALPRO:HyperLabel := HyperLabel{#SC_CALPRO,"Próxima",NULL_STRING,NULL_STRING}

oDCCALPRO := SingleLineEdit{self,ResourceID{JINS_CALPRO,_GetInst()}}
oDCCALPRO:FieldSpec := DATE_FIELD{}
oDCCALPRO:HyperLabel := HyperLabel{#CALPRO,"Calpro:",NULL_STRING,"ME04_CALPRO"}
oDCCALPRO:BackGround := aBrushes[1]
oDCCALPRO:Font(aFonts[1], FALSE)

oDCtheFixedText19 := FixedText{self,ResourceID{JINS_THEFIXEDTEXT19,_GetInst()}}
oDCtheFixedText19:HyperLabel := HyperLabel{#theFixedText19,"Observações",NULL_STRING,NULL_STRING}

oDCFT24 := FixedText{self,ResourceID{JINS_FT24,_GetInst()}}
oDCFT24:HyperLabel := HyperLabel{#FT24,"Aplicação/Produto",NULL_STRING,NULL_STRING}

oDCFT25 := FixedText{self,ResourceID{JINS_FT25,_GetInst()}}
oDCFT25:HyperLabel := HyperLabel{#FT25,"Desenho",NULL_STRING,NULL_STRING}

oCCbusca := PushButton{self,ResourceID{JINS_BUSCA,_GetInst()}}
oCCbusca:Image := ico_find{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

oCCpegFOR := PushButton{self,ResourceID{JINS_PEGFOR,_GetInst()}}
oCCpegFOR:HyperLabel := HyperLabel{#pegFOR,"-->",NULL_STRING,NULL_STRING}

oCCescfor := PushButton{self,ResourceID{JINS_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,NULL_STRING,NULL_STRING,NULL_STRING}
oCCescfor:Image := ICO_FIND{}

oDCSC_CALIBRAR1 := FixedText{self,ResourceID{JINS_SC_CALIBRAR1,_GetInst()}}
oDCSC_CALIBRAR1:HyperLabel := HyperLabel{#SC_CALIBRAR1,"Meses",NULL_STRING,NULL_STRING}

oDCFT23 := FixedText{self,ResourceID{JINS_FT23,_GetInst()}}
oDCFT23:HyperLabel := HyperLabel{#FT23,"Preço Calibração",NULL_STRING,NULL_STRING}

oDCCALULT := SingleLineEdit{self,ResourceID{JINS_CALULT,_GetInst()}}
oDCCALULT:FieldSpec := DATE_FIELD{}
oDCCALULT:HyperLabel := HyperLabel{#CALULT,"Calibrar:",NULL_STRING,"ME04_CALIBRAR"}
oDCCALULT:BackGround := aBrushes[1]
oDCCALULT:Font(aFonts[1], FALSE)

oCCpegcal := PushButton{self,ResourceID{JINS_PEGCAL,_GetInst()}}
oCCpegcal:HyperLabel := HyperLabel{#pegcal,".?.",NULL_STRING,NULL_STRING}

oDCDATAEXT := SingleLineEdit{self,ResourceID{JINS_DATAEXT,_GetInst()}}
oDCDATAEXT:FieldSpec := DATE_FIELD{}
oDCDATAEXT:HyperLabel := HyperLabel{#DATAEXT,"Calpro:",NULL_STRING,"ME04_CALPRO"}
oDCDATAEXT:BackGround := aBrushes[1]
oDCDATAEXT:Font(aFonts[1], FALSE)

oDCSC_CALPRO1 := FixedText{self,ResourceID{JINS_SC_CALPRO1,_GetInst()}}
oDCSC_CALPRO1:HyperLabel := HyperLabel{#SC_CALPRO1,"Extensão",NULL_STRING,NULL_STRING}

oDCPF := rightSle{self,ResourceID{JINS_PF,_GetInst()}}
oDCPF:FieldSpec := padrao_num_08{}
oDCPF:HyperLabel := HyperLabel{#PF,"PF:",NULL_STRING,"ME04_CODFOR"}

oDCSC_CODFOR1 := FixedText{self,ResourceID{JINS_SC_CODFOR1,_GetInst()}}
oDCSC_CODFOR1:HyperLabel := HyperLabel{#SC_CODFOR1,"PF",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JINS_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JINS_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oCCpornum := PushButton{self,ResourceID{JINS_PORNUM,_GetInst()}}
oCCpornum:Image := ico_az{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,"Ordenar por Numero",NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

oCCPushButton6 := PushButton{self,ResourceID{JINS_PUSHBUTTON6,_GetInst()}}
oCCPushButton6:HyperLabel := HyperLabel{#PushButton6,"CD",NULL_STRING,NULL_STRING}
oCCPushButton6:TooltipText := "Conforme Desenho"

oCCPushButton7 := PushButton{self,ResourceID{JINS_PUSHBUTTON7,_GetInst()}}
oCCPushButton7:HyperLabel := HyperLabel{#PushButton7,"CC",NULL_STRING,NULL_STRING}
oCCPushButton7:TooltipText := "Conforme Certificado"

oDCESCAPL := combobox{self,ResourceID{JINS_ESCAPL,_GetInst()}}
oDCESCAPL:HyperLabel := HyperLabel{#ESCAPL,"Tipo",NULL_STRING,NULL_STRING}
oDCESCAPL:FieldSpec := PADRAO_CHAR_30{}
oDCESCAPL:FillUsing(Self:TABAPL( ))

oDCDATAFIM := DateSle{self,ResourceID{JINS_DATAFIM,_GetInst()}}
oDCDATAFIM:FieldSpec := DATE_FIELD{}
oDCDATAFIM:HyperLabel := HyperLabel{#DATAFIM,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDATAUSO := DateSle{self,ResourceID{JINS_DATAUSO,_GetInst()}}
oDCDATAUSO:FieldSpec := DATE_FIELD{}
oDCDATAUSO:HyperLabel := HyperLabel{#DATAUSO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_CALULT1 := FixedText{self,ResourceID{JINS_SC_CALULT1,_GetInst()}}
oDCSC_CALULT1:HyperLabel := HyperLabel{#SC_CALULT1,"RRM","Data da Ultima Calibração",NULL_STRING}

oDCRRMDATA := SingleLineEdit{self,ResourceID{JINS_RRMDATA,_GetInst()}}
oDCRRMDATA:FieldSpec := DATE_FIELD{}
oDCRRMDATA:HyperLabel := HyperLabel{#RRMDATA,"Calibrar:",NULL_STRING,"ME04_CALIBRAR"}
oDCRRMDATA:BackGround := aBrushes[1]
oDCRRMDATA:Font(aFonts[1], FALSE)

oCCescPF := PushButton{self,ResourceID{JINS_ESCPF,_GetInst()}}
oCCescPF:HyperLabel := HyperLabel{#escPF,"..",NULL_STRING,NULL_STRING}

self:Caption := "Instrumentos"
self:HyperLabel := HyperLabel{#JINS,"Instrumentos",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{padrao_char_08{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBTIPO := DataColumn{PADRAO_CHAR_30{}}
oDBTIPO:Width := 29
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "Tipo:"
self:Browser:AddColumn(oDBTIPO)

oDBNOMTIPO := DataColumn{padrao_char_30{}}
oDBNOMTIPO:Width := 32
oDBNOMTIPO:HyperLabel := oDCNOMTIPO:HyperLabel 
oDBNOMTIPO:Caption := "Descrição"
self:Browser:AddColumn(oDBNOMTIPO)

oDBCODTIPO := DataColumn{PADRAO_CHAR_03{}}
oDBCODTIPO:Width := 8
oDBCODTIPO:HyperLabel := oDCCODTIPO:HyperLabel 
oDBCODTIPO:Caption := "Tipo"
self:Browser:AddColumn(oDBCODTIPO)

oDBAPLICACAO := DataColumn{padrao_char_24{}}
oDBAPLICACAO:Width := 27
oDBAPLICACAO:HyperLabel := oDCAPLICACAO:HyperLabel 
oDBAPLICACAO:Caption := "Aplicação"
self:Browser:AddColumn(oDBAPLICACAO)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MARCA() 
return self:FieldGet(#MARCA)


assign MARCA(uValue) 
self:FieldPut(#MARCA, uValue)
return MARCA := uValue


access MODELO() 
return self:FieldGet(#MODELO)


assign MODELO(uValue) 
self:FieldPut(#MODELO, uValue)
return MODELO := uValue


access NOMTIPO() 
return self:FieldGet(#NOMTIPO)


assign NOMTIPO(uValue) 
self:FieldPut(#NOMTIPO, uValue)
return NOMTIPO := uValue


access NORMA() 
return self:FieldGet(#NORMA)


assign NORMA(uValue) 
self:FieldPut(#NORMA, uValue)
return NORMA := uValue


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


access PF() 
return self:FieldGet(#PF)


assign PF(uValue) 
self:FieldPut(#PF, uValue)
return PF := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	SELF:RegisterTimer(300,FALSE)
		    FabCenterWindow( SELF )
	RETURN NIL


access PRECO() 
return self:FieldGet(#PRECO)


assign PRECO(uValue) 
self:FieldPut(#PRECO, uValue)
return PRECO := uValue


access RRMDATA() 
return self:FieldGet(#RRMDATA)


assign RRMDATA(uValue) 
self:FieldPut(#RRMDATA, uValue)
return RRMDATA := uValue


access SITUACAO() 
return self:FieldGet(#SITUACAO)


assign SITUACAO(uValue) 
self:FieldPut(#SITUACAO, uValue)
return SITUACAO := uValue


access TIPCAL() 
return self:FieldGet(#TIPCAL)


assign TIPCAL(uValue) 
self:FieldPut(#TIPCAL, uValue)
return TIPCAL := uValue


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


access VALOR() 
return self:FieldGet(#VALOR)


assign VALOR(uValue) 
self:FieldPut(#VALOR, uValue)
return VALOR := uValue


END CLASS
