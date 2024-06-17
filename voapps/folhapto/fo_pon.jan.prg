#region DEFINES
STATIC DEFINE JFO_PON_ALE := 113 
STATIC DEFINE JFO_PON_ALIREV := 120 
STATIC DEFINE JFO_PON_ALMOCO := 117 
STATIC DEFINE JFO_PON_ALS := 112 
STATIC DEFINE JFO_PON_ALSREV := 121 
STATIC DEFINE JFO_PON_BCOHRS := 140 
STATIC DEFINE JFO_PON_BCOSN := 139 
STATIC DEFINE JFO_PON_BUSCANUM := 174 
STATIC DEFINE JFO_PON_CMDALM := 177 
STATIC DEFINE JFO_PON_CMDBCO := 154 
STATIC DEFINE JFO_PON_CMDEXT := 153 
STATIC DEFINE JFO_PON_CMDFOL := 149 
STATIC DEFINE JFO_PON_CMDORDENAR := 180 
STATIC DEFINE JFO_PON_CMDPAS := 179 
STATIC DEFINE JFO_PON_CMDRED := 150 
STATIC DEFINE JFO_PON_CMDVIR := 157 
STATIC DEFINE JFO_PON_COD := 115 
STATIC DEFINE JFO_PON_CODREV := 118 
STATIC DEFINE JFO_PON_CTA01 := 123 
STATIC DEFINE JFO_PON_CTA02 := 124 
STATIC DEFINE JFO_PON_CTA03 := 125 
STATIC DEFINE JFO_PON_CTA04 := 126 
STATIC DEFINE JFO_PON_CTA05 := 127 
STATIC DEFINE JFO_PON_CTA06 := 128 
STATIC DEFINE JFO_PON_CTA07 := 129 
STATIC DEFINE JFO_PON_CTA08 := 130 
STATIC DEFINE JFO_PON_CTA09 := 131 
STATIC DEFINE JFO_PON_CTA10 := 132 
STATIC DEFINE JFO_PON_CTA11 := 133 
STATIC DEFINE JFO_PON_CTA12 := 134 
STATIC DEFINE JFO_PON_CTA13 := 135 
STATIC DEFINE JFO_PON_CTA14 := 136 
STATIC DEFINE JFO_PON_CTA15 := 137 
STATIC DEFINE JFO_PON_CTA16 := 138 
STATIC DEFINE JFO_PON_DATA := 110 
STATIC DEFINE JFO_PON_ENT := 111 
STATIC DEFINE JFO_PON_ENTREV := 119 
STATIC DEFINE JFO_PON_ESCCOD := 175 
STATIC DEFINE JFO_PON_ESCHOR := 178 
STATIC DEFINE JFO_PON_ESCSUB := 176 
STATIC DEFINE JFO_PON_EXTSN := 143 
STATIC DEFINE JFO_PON_FOLSN := 142 
STATIC DEFINE JFO_PON_NUMERO := 109 
STATIC DEFINE JFO_PON_PUSHBUTTON12 := 181 
STATIC DEFINE JFO_PON_REDSN := 141 
STATIC DEFINE JFO_PON_SAI := 114 
STATIC DEFINE JFO_PON_SAIREV := 122 
STATIC DEFINE JFO_PON_SC_ALMOCO := 106 
STATIC DEFINE JFO_PON_SC_BCOOCO := 156 
STATIC DEFINE JFO_PON_SC_COD := 104 
STATIC DEFINE JFO_PON_SC_CODREV := 107 
STATIC DEFINE JFO_PON_SC_CTA17 := 158 
STATIC DEFINE JFO_PON_SC_CTA18 := 160 
STATIC DEFINE JFO_PON_SC_CTA19 := 162 
STATIC DEFINE JFO_PON_SC_CTA2 := 173 
STATIC DEFINE JFO_PON_SC_CTA20 := 164 
STATIC DEFINE JFO_PON_SC_CTA21 := 166 
STATIC DEFINE JFO_PON_SC_CTA22 := 168 
STATIC DEFINE JFO_PON_SC_CTA23 := 170 
STATIC DEFINE JFO_PON_SC_CTA24 := 172 
STATIC DEFINE JFO_PON_SC_CTA3 := 171 
STATIC DEFINE JFO_PON_SC_CTA4 := 169 
STATIC DEFINE JFO_PON_SC_CTA5 := 167 
STATIC DEFINE JFO_PON_SC_CTA6 := 165 
STATIC DEFINE JFO_PON_SC_CTA7 := 163 
STATIC DEFINE JFO_PON_SC_CTA8 := 161 
STATIC DEFINE JFO_PON_SC_CTA9 := 159 
STATIC DEFINE JFO_PON_SC_DATA := 101 
STATIC DEFINE JFO_PON_SC_ENT := 102 
STATIC DEFINE JFO_PON_SC_ENT1 := 145 
STATIC DEFINE JFO_PON_SC_ENT2 := 147 
STATIC DEFINE JFO_PON_SC_ENT3 := 148 
STATIC DEFINE JFO_PON_SC_EXTOCO := 155 
STATIC DEFINE JFO_PON_SC_FOLOCO := 151 
STATIC DEFINE JFO_PON_SC_NUMERO := 100 
STATIC DEFINE JFO_PON_SC_REDOCO := 152 
STATIC DEFINE JFO_PON_SC_SAI := 103 
STATIC DEFINE JFO_PON_SC_SAI1 := 146 
STATIC DEFINE JFO_PON_SC_SOD := 105 
STATIC DEFINE JFO_PON_SC_VIRADA := 108 
STATIC DEFINE JFO_PON_SOD := 116 
STATIC DEFINE JFO_PON_VIRADA := 144 
#endregion

PARTIAL class JFO_PON inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBENT as DataColumn
	PROTECT oDBALS as DataColumn
	PROTECT oDBALE as DataColumn
	PROTECT oDBSAI as DataColumn
	PROTECT oDBCOD as DataColumn
	PROTECT oDBSOD as DataColumn
	PROTECT oDBBCOSN as DataColumn
	PROTECT oDBREDSN as DataColumn
	PROTECT oDBFOLSN as DataColumn
	PROTECT oDBEXTSN as DataColumn
	PROTECT oDBVIRADA as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_ENT as FIXEDTEXT
	protect oDCSC_SAI as FIXEDTEXT
	protect oDCSC_COD as FIXEDTEXT
	protect oDCSC_SOD as FIXEDTEXT
	protect oDCSC_ALMOCO as FIXEDTEXT
	protect oDCSC_CODREV as FIXEDTEXT
	protect oDCSC_VIRADA as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCDATA as SINGLELINEEDIT
	protect oDCENT as RIGHTSLE
	protect oDCALS as RIGHTSLE
	protect oDCALE as RIGHTSLE
	protect oDCSAI as RIGHTSLE
	protect oDCCOD as SINGLELINEEDIT
	protect oDCSOD as SINGLELINEEDIT
	protect oDCALMOCO as SINGLELINEEDIT
	protect oDCCODREV as SINGLELINEEDIT
	protect oDCENTREV as RIGHTSLE
	protect oDCALIREV as RIGHTSLE
	protect oDCALSREV as RIGHTSLE
	protect oDCSAIREV as RIGHTSLE
	protect oDCCTA01 as RIGHTSLE
	protect oDCCTA02 as RIGHTSLE
	protect oDCCTA03 as RIGHTSLE
	protect oDCCTA04 as RIGHTSLE
	protect oDCCTA05 as RIGHTSLE
	protect oDCCTA06 as RIGHTSLE
	protect oDCCTA07 as RIGHTSLE
	protect oDCCTA08 as RIGHTSLE
	protect oDCCTA09 as RIGHTSLE
	protect oDCCTA10 as RIGHTSLE
	protect oDCCTA11 as RIGHTSLE
	protect oDCCTA12 as RIGHTSLE
	protect oDCCTA13 as RIGHTSLE
	protect oDCCTA14 as RIGHTSLE
	protect oDCCTA15 as RIGHTSLE
	protect oDCCTA16 as RIGHTSLE
	protect oDCBCOSN as SINGLELINEEDIT
	protect oDCBCOHRS as RIGHTSLE
	protect oDCREDSN as SINGLELINEEDIT
	protect oDCFOLSN as SINGLELINEEDIT
	protect oDCEXTSN as SINGLELINEEDIT
	protect oDCVIRADA as SINGLELINEEDIT
	protect oDCSC_ENT1 as FIXEDTEXT
	protect oDCSC_SAI1 as FIXEDTEXT
	protect oDCSC_ENT2 as FIXEDTEXT
	protect oDCSC_ENT3 as FIXEDTEXT
	protect oCCcmdfol as PUSHBUTTON
	protect oCCcmdred as PUSHBUTTON
	protect oDCSC_FOLOCO as FIXEDTEXT
	protect oDCSC_REDOCO as FIXEDTEXT
	protect oCCcmdext as PUSHBUTTON
	protect oCCcmdbco as PUSHBUTTON
	protect oDCSC_EXTOCO as FIXEDTEXT
	protect oDCSC_BCOOCO as FIXEDTEXT
	protect oCCcmdvir as PUSHBUTTON
	protect oDCSC_CTA17 as FIXEDTEXT
	protect oDCSC_CTA9 as FIXEDTEXT
	protect oDCSC_CTA18 as FIXEDTEXT
	protect oDCSC_CTA8 as FIXEDTEXT
	protect oDCSC_CTA19 as FIXEDTEXT
	protect oDCSC_CTA7 as FIXEDTEXT
	protect oDCSC_CTA20 as FIXEDTEXT
	protect oDCSC_CTA6 as FIXEDTEXT
	protect oDCSC_CTA21 as FIXEDTEXT
	protect oDCSC_CTA5 as FIXEDTEXT
	protect oDCSC_CTA22 as FIXEDTEXT
	protect oDCSC_CTA4 as FIXEDTEXT
	protect oDCSC_CTA23 as FIXEDTEXT
	protect oDCSC_CTA3 as FIXEDTEXT
	protect oDCSC_CTA24 as FIXEDTEXT
	protect oDCSC_CTA2 as FIXEDTEXT
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oCCescSUB as PUSHBUTTON
	protect oCCcmdALM as PUSHBUTTON
	protect oCCescHOR as PUSHBUTTON
	protect oCCcmdpas as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCPushButton12 as PUSHBUTTON
// 	instance NUMERO 
// 	instance DATA 
// 	instance ENT 
// 	instance ALS 
// 	instance ALE 
// 	instance SAI 
// 	instance COD 
// 	instance SOD 
// 	instance ALMOCO 
// 	instance CODREV 
// 	instance ENTREV 
// 	instance ALIREV 
// 	instance ALSREV 
// 	instance SAIREV 
// 	instance CTA01 
// 	instance CTA02 
// 	instance CTA03 
// 	instance CTA04 
// 	instance CTA05 
// 	instance CTA06 
// 	instance CTA07 
// 	instance CTA08 
// 	instance CTA09 
// 	instance CTA10 
// 	instance CTA11 
// 	instance CTA12 
// 	instance CTA13 
// 	instance CTA14 
// 	instance CTA15 
// 	instance CTA16 
// 	instance BCOSN 
// 	instance BCOHRS 
// 	instance REDSN 
// 	instance FOLSN 
// 	instance EXTSN 
// 	instance VIRADA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ALE() 
return self:FieldGet(#ALE)


assign ALE(uValue) 
self:FieldPut(#ALE, uValue)
return ALE := uValue


access ALIREV() 
return self:FieldGet(#ALIREV)


assign ALIREV(uValue) 
self:FieldPut(#ALIREV, uValue)
return ALIREV := uValue


access ALMOCO() 
return self:FieldGet(#ALMOCO)


assign ALMOCO(uValue) 
self:FieldPut(#ALMOCO, uValue)
return ALMOCO := uValue


access ALS() 
return self:FieldGet(#ALS)


assign ALS(uValue) 
self:FieldPut(#ALS, uValue)
return ALS := uValue


access ALSREV() 
return self:FieldGet(#ALSREV)


assign ALSREV(uValue) 
self:FieldPut(#ALSREV, uValue)
return ALSREV := uValue


access BCOHRS() 
return self:FieldGet(#BCOHRS)


assign BCOHRS(uValue) 
self:FieldPut(#BCOHRS, uValue)
return BCOHRS := uValue


access BCOSN() 
return self:FieldGet(#BCOSN)


assign BCOSN(uValue) 
self:FieldPut(#BCOSN, uValue)
return BCOSN := uValue


access COD() 
return self:FieldGet(#COD)


assign COD(uValue) 
self:FieldPut(#COD, uValue)
return COD := uValue


access CODREV() 
return self:FieldGet(#CODREV)


assign CODREV(uValue) 
self:FieldPut(#CODREV, uValue)
return CODREV := uValue


access CTA01() 
return self:FieldGet(#CTA01)


assign CTA01(uValue) 
self:FieldPut(#CTA01, uValue)
return CTA01 := uValue


access CTA02() 
return self:FieldGet(#CTA02)


assign CTA02(uValue) 
self:FieldPut(#CTA02, uValue)
return CTA02 := uValue


access CTA03() 
return self:FieldGet(#CTA03)


assign CTA03(uValue) 
self:FieldPut(#CTA03, uValue)
return CTA03 := uValue


access CTA04() 
return self:FieldGet(#CTA04)


assign CTA04(uValue) 
self:FieldPut(#CTA04, uValue)
return CTA04 := uValue


access CTA05() 
return self:FieldGet(#CTA05)


assign CTA05(uValue) 
self:FieldPut(#CTA05, uValue)
return CTA05 := uValue


access CTA06() 
return self:FieldGet(#CTA06)


assign CTA06(uValue) 
self:FieldPut(#CTA06, uValue)
return CTA06 := uValue


access CTA07() 
return self:FieldGet(#CTA07)


assign CTA07(uValue) 
self:FieldPut(#CTA07, uValue)
return CTA07 := uValue


access CTA08() 
return self:FieldGet(#CTA08)


assign CTA08(uValue) 
self:FieldPut(#CTA08, uValue)
return CTA08 := uValue


access CTA09() 
return self:FieldGet(#CTA09)


assign CTA09(uValue) 
self:FieldPut(#CTA09, uValue)
return CTA09 := uValue


access CTA10() 
return self:FieldGet(#CTA10)


assign CTA10(uValue) 
self:FieldPut(#CTA10, uValue)
return CTA10 := uValue


access CTA11() 
return self:FieldGet(#CTA11)


assign CTA11(uValue) 
self:FieldPut(#CTA11, uValue)
return CTA11 := uValue


access CTA12() 
return self:FieldGet(#CTA12)


assign CTA12(uValue) 
self:FieldPut(#CTA12, uValue)
return CTA12 := uValue


access CTA13() 
return self:FieldGet(#CTA13)


assign CTA13(uValue) 
self:FieldPut(#CTA13, uValue)
return CTA13 := uValue


access CTA14() 
return self:FieldGet(#CTA14)


assign CTA14(uValue) 
self:FieldPut(#CTA14, uValue)
return CTA14 := uValue


access CTA15() 
return self:FieldGet(#CTA15)


assign CTA15(uValue) 
self:FieldPut(#CTA15, uValue)
return CTA15 := uValue


access CTA16() 
return self:FieldGet(#CTA16)


assign CTA16(uValue) 
self:FieldPut(#CTA16, uValue)
return CTA16 := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access ENT() 
return self:FieldGet(#ENT)


assign ENT(uValue) 
self:FieldPut(#ENT, uValue)
return ENT := uValue


access ENTREV() 
return self:FieldGet(#ENTREV)


assign ENTREV(uValue) 
self:FieldPut(#ENTREV, uValue)
return ENTREV := uValue


access EXTSN() 
return self:FieldGet(#EXTSN)


assign EXTSN(uValue) 
self:FieldPut(#EXTSN, uValue)
return EXTSN := uValue


access FOLSN() 
return self:FieldGet(#FOLSN)


assign FOLSN(uValue) 
self:FieldPut(#FOLSN, uValue)
return FOLSN := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFO_PON",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_NUMERO := FixedText{self,ResourceID{JFO_PON_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JFO_PON_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_ENT := FixedText{self,ResourceID{JFO_PON_SC_ENT,_GetInst()}}
oDCSC_ENT:HyperLabel := HyperLabel{#SC_ENT,"Ent:",NULL_STRING,NULL_STRING}

oDCSC_SAI := FixedText{self,ResourceID{JFO_PON_SC_SAI,_GetInst()}}
oDCSC_SAI:HyperLabel := HyperLabel{#SC_SAI,"Saida",NULL_STRING,NULL_STRING}

oDCSC_COD := FixedText{self,ResourceID{JFO_PON_SC_COD,_GetInst()}}
oDCSC_COD:HyperLabel := HyperLabel{#SC_COD,"Cod:",NULL_STRING,NULL_STRING}

oDCSC_SOD := FixedText{self,ResourceID{JFO_PON_SC_SOD,_GetInst()}}
oDCSC_SOD:HyperLabel := HyperLabel{#SC_SOD,"Sod:",NULL_STRING,NULL_STRING}

oDCSC_ALMOCO := FixedText{self,ResourceID{JFO_PON_SC_ALMOCO,_GetInst()}}
oDCSC_ALMOCO:HyperLabel := HyperLabel{#SC_ALMOCO,"Almoco:",NULL_STRING,NULL_STRING}

oDCSC_CODREV := FixedText{self,ResourceID{JFO_PON_SC_CODREV,_GetInst()}}
oDCSC_CODREV:HyperLabel := HyperLabel{#SC_CODREV,"Ajuste Horario",NULL_STRING,NULL_STRING}

oDCSC_VIRADA := FixedText{self,ResourceID{JFO_PON_SC_VIRADA,_GetInst()}}
oDCSC_VIRADA:HyperLabel := HyperLabel{#SC_VIRADA,"Virada:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JFO_PON_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"FO_PON_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]

oDCDATA := SingleLineEdit{self,ResourceID{JFO_PON_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"FO_PON_DATA"}
oDCDATA:BackGround := aBrushes[1]

oDCENT := rightSle{self,ResourceID{JFO_PON_ENT,_GetInst()}}
oDCENT:FieldSpec := PADRAO_NUM_05_2{}
oDCENT:HyperLabel := HyperLabel{#ENT,"Ent:",NULL_STRING,"FO_PON_ENT"}

oDCALS := rightSle{self,ResourceID{JFO_PON_ALS,_GetInst()}}
oDCALS:FieldSpec := PADRAO_NUM_05_2{}
oDCALS:HyperLabel := HyperLabel{#ALS,"Als:",NULL_STRING,"FO_PON_ALS"}

oDCALE := rightSle{self,ResourceID{JFO_PON_ALE,_GetInst()}}
oDCALE:FieldSpec := PADRAO_NUM_05_2{}
oDCALE:HyperLabel := HyperLabel{#ALE,"Ale:",NULL_STRING,"FO_PON_ALE"}

oDCSAI := rightSle{self,ResourceID{JFO_PON_SAI,_GetInst()}}
oDCSAI:FieldSpec := PADRAO_NUM_05_2{}
oDCSAI:HyperLabel := HyperLabel{#SAI,"Sai:",NULL_STRING,"FO_PON_SAI"}

oDCCOD := SingleLineEdit{self,ResourceID{JFO_PON_COD,_GetInst()}}
oDCCOD:FieldSpec := PADRAO_CHAR_02{}
oDCCOD:HyperLabel := HyperLabel{#COD,"Cod:",NULL_STRING,"FO_PON_COD"}

oDCSOD := SingleLineEdit{self,ResourceID{JFO_PON_SOD,_GetInst()}}
oDCSOD:FieldSpec := PADRAO_CHAR_02{}
oDCSOD:HyperLabel := HyperLabel{#SOD,"Sub",NULL_STRING,"FO_PON_SOD"}

oDCALMOCO := SingleLineEdit{self,ResourceID{JFO_PON_ALMOCO,_GetInst()}}
oDCALMOCO:FieldSpec := PADRAO_CHAR_01{}
oDCALMOCO:HyperLabel := HyperLabel{#ALMOCO,"Almoco:",NULL_STRING,"FO_PON_ALMOCO"}
oDCALMOCO:BackGround := aBrushes[1]

oDCCODREV := SingleLineEdit{self,ResourceID{JFO_PON_CODREV,_GetInst()}}
oDCCODREV:FieldSpec := PADRAO_CHAR_02{}
oDCCODREV:HyperLabel := HyperLabel{#CODREV,"Codrev:",NULL_STRING,"FO_PON_CODREV"}

oDCENTREV := rightSle{self,ResourceID{JFO_PON_ENTREV,_GetInst()}}
oDCENTREV:FieldSpec := PADRAO_NUM_05_2{}
oDCENTREV:HyperLabel := HyperLabel{#ENTREV,"Entrev:",NULL_STRING,"FO_PON_ENTREV"}

oDCALIREV := rightSle{self,ResourceID{JFO_PON_ALIREV,_GetInst()}}
oDCALIREV:FieldSpec := PADRAO_NUM_05_2{}
oDCALIREV:HyperLabel := HyperLabel{#ALIREV,"Alirev:",NULL_STRING,"FO_PON_ALIREV"}

oDCALSREV := rightSle{self,ResourceID{JFO_PON_ALSREV,_GetInst()}}
oDCALSREV:FieldSpec := PADRAO_NUM_05_2{}
oDCALSREV:HyperLabel := HyperLabel{#ALSREV,"Alsrev:",NULL_STRING,"FO_PON_ALSREV"}

oDCSAIREV := rightSle{self,ResourceID{JFO_PON_SAIREV,_GetInst()}}
oDCSAIREV:FieldSpec := PADRAO_NUM_05_2{}
oDCSAIREV:HyperLabel := HyperLabel{#SAIREV,"Sairev:",NULL_STRING,"FO_PON_SAIREV"}

oDCCTA01 := rightSle{self,ResourceID{JFO_PON_CTA01,_GetInst()}}
oDCCTA01:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA01:HyperLabel := HyperLabel{#CTA01,"Cta01:",NULL_STRING,"FO_PON_CTA01"}

oDCCTA02 := rightSle{self,ResourceID{JFO_PON_CTA02,_GetInst()}}
oDCCTA02:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA02:HyperLabel := HyperLabel{#CTA02,"Cta02:",NULL_STRING,"FO_PON_CTA02"}

oDCCTA03 := rightSle{self,ResourceID{JFO_PON_CTA03,_GetInst()}}
oDCCTA03:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA03:HyperLabel := HyperLabel{#CTA03,"Cta03:",NULL_STRING,"FO_PON_CTA03"}

oDCCTA04 := rightSle{self,ResourceID{JFO_PON_CTA04,_GetInst()}}
oDCCTA04:HyperLabel := HyperLabel{#CTA04,"Cta04:",NULL_STRING,"FO_PON_CTA04"}
oDCCTA04:FieldSpec := PADRAO_NUM_06_2{}

oDCCTA05 := rightSle{self,ResourceID{JFO_PON_CTA05,_GetInst()}}
oDCCTA05:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA05:HyperLabel := HyperLabel{#CTA05,"Cta05:",NULL_STRING,"FO_PON_CTA05"}

oDCCTA06 := rightSle{self,ResourceID{JFO_PON_CTA06,_GetInst()}}
oDCCTA06:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA06:HyperLabel := HyperLabel{#CTA06,"Cta06:",NULL_STRING,"FO_PON_CTA06"}

oDCCTA07 := rightSle{self,ResourceID{JFO_PON_CTA07,_GetInst()}}
oDCCTA07:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA07:HyperLabel := HyperLabel{#CTA07,"Cta07:",NULL_STRING,"FO_PON_CTA07"}

oDCCTA08 := rightSle{self,ResourceID{JFO_PON_CTA08,_GetInst()}}
oDCCTA08:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA08:HyperLabel := HyperLabel{#CTA08,"Cta08:",NULL_STRING,"FO_PON_CTA08"}

oDCCTA09 := rightSle{self,ResourceID{JFO_PON_CTA09,_GetInst()}}
oDCCTA09:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA09:HyperLabel := HyperLabel{#CTA09,"Cta09:",NULL_STRING,"FO_PON_CTA09"}

oDCCTA10 := rightSle{self,ResourceID{JFO_PON_CTA10,_GetInst()}}
oDCCTA10:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA10:HyperLabel := HyperLabel{#CTA10,"Cta10:",NULL_STRING,"FO_PON_CTA10"}

oDCCTA11 := rightSle{self,ResourceID{JFO_PON_CTA11,_GetInst()}}
oDCCTA11:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA11:HyperLabel := HyperLabel{#CTA11,"Cta11:",NULL_STRING,"FO_PON_CTA11"}

oDCCTA12 := rightSle{self,ResourceID{JFO_PON_CTA12,_GetInst()}}
oDCCTA12:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA12:HyperLabel := HyperLabel{#CTA12,"Cta12:",NULL_STRING,"FO_PON_CTA12"}

oDCCTA13 := rightSle{self,ResourceID{JFO_PON_CTA13,_GetInst()}}
oDCCTA13:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA13:HyperLabel := HyperLabel{#CTA13,"Cta13:",NULL_STRING,"FO_PON_CTA13"}

oDCCTA14 := rightSle{self,ResourceID{JFO_PON_CTA14,_GetInst()}}
oDCCTA14:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA14:HyperLabel := HyperLabel{#CTA14,"Cta14:",NULL_STRING,"FO_PON_CTA14"}

oDCCTA15 := rightSle{self,ResourceID{JFO_PON_CTA15,_GetInst()}}
oDCCTA15:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA15:HyperLabel := HyperLabel{#CTA15,"Cta15:",NULL_STRING,"FO_PON_CTA15"}

oDCCTA16 := rightSle{self,ResourceID{JFO_PON_CTA16,_GetInst()}}
oDCCTA16:FieldSpec := PADRAO_NUM_06_2{}
oDCCTA16:HyperLabel := HyperLabel{#CTA16,"Cta16:",NULL_STRING,"FO_PON_CTA16"}

oDCBCOSN := SingleLineEdit{self,ResourceID{JFO_PON_BCOSN,_GetInst()}}
oDCBCOSN:FieldSpec := PADRAO_CHAR_01{}
oDCBCOSN:HyperLabel := HyperLabel{#BCOSN,"Bco:",NULL_STRING,"FO_PON_BCOSN"}
oDCBCOSN:BackGround := aBrushes[1]

oDCBCOHRS := rightSle{self,ResourceID{JFO_PON_BCOHRS,_GetInst()}}
oDCBCOHRS:FieldSpec := PADRAO_NUM_07_2{}
oDCBCOHRS:HyperLabel := HyperLabel{#BCOHRS,"Bcohrs:",NULL_STRING,"FO_PON_BCOHRS"}

oDCREDSN := SingleLineEdit{self,ResourceID{JFO_PON_REDSN,_GetInst()}}
oDCREDSN:FieldSpec := PADRAO_CHAR_01{}
oDCREDSN:HyperLabel := HyperLabel{#REDSN,"Red",NULL_STRING,"FO_PON_REDSN"}
oDCREDSN:BackGround := aBrushes[1]

oDCFOLSN := SingleLineEdit{self,ResourceID{JFO_PON_FOLSN,_GetInst()}}
oDCFOLSN:FieldSpec := PADRAO_CHAR_01{}
oDCFOLSN:HyperLabel := HyperLabel{#FOLSN,"Folga",NULL_STRING,"FO_PON_FOLSN"}
oDCFOLSN:BackGround := aBrushes[1]

oDCEXTSN := SingleLineEdit{self,ResourceID{JFO_PON_EXTSN,_GetInst()}}
oDCEXTSN:FieldSpec := PADRAO_CHAR_01{}
oDCEXTSN:HyperLabel := HyperLabel{#EXTSN,"Extra",NULL_STRING,"FO_PON_EXTSN"}
oDCEXTSN:BackGround := aBrushes[1]

oDCVIRADA := SingleLineEdit{self,ResourceID{JFO_PON_VIRADA,_GetInst()}}
oDCVIRADA:FieldSpec := PADRAO_CHAR_01{}
oDCVIRADA:HyperLabel := HyperLabel{#VIRADA,"Virada:",NULL_STRING,"FO_PON_VIRADA"}
oDCVIRADA:BackGround := aBrushes[1]

oDCSC_ENT1 := FixedText{self,ResourceID{JFO_PON_SC_ENT1,_GetInst()}}
oDCSC_ENT1:HyperLabel := HyperLabel{#SC_ENT1,"Refeiçao",NULL_STRING,NULL_STRING}

oDCSC_SAI1 := FixedText{self,ResourceID{JFO_PON_SC_SAI1,_GetInst()}}
oDCSC_SAI1:HyperLabel := HyperLabel{#SC_SAI1,"Saida",NULL_STRING,NULL_STRING}

oDCSC_ENT2 := FixedText{self,ResourceID{JFO_PON_SC_ENT2,_GetInst()}}
oDCSC_ENT2:HyperLabel := HyperLabel{#SC_ENT2,"Refeiçao",NULL_STRING,NULL_STRING}

oDCSC_ENT3 := FixedText{self,ResourceID{JFO_PON_SC_ENT3,_GetInst()}}
oDCSC_ENT3:HyperLabel := HyperLabel{#SC_ENT3,"Ent:",NULL_STRING,NULL_STRING}

oCCcmdfol := PushButton{self,ResourceID{JFO_PON_CMDFOL,_GetInst()}}
oCCcmdfol:HyperLabel := HyperLabel{#cmdfol,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdred := PushButton{self,ResourceID{JFO_PON_CMDRED,_GetInst()}}
oCCcmdred:HyperLabel := HyperLabel{#cmdred,"Sim/Nao",NULL_STRING,NULL_STRING}

oDCSC_FOLOCO := FixedText{self,ResourceID{JFO_PON_SC_FOLOCO,_GetInst()}}
oDCSC_FOLOCO:HyperLabel := HyperLabel{#SC_FOLOCO,"Folga",NULL_STRING,NULL_STRING}

oDCSC_REDOCO := FixedText{self,ResourceID{JFO_PON_SC_REDOCO,_GetInst()}}
oDCSC_REDOCO:HyperLabel := HyperLabel{#SC_REDOCO,"Reduçao Horario",NULL_STRING,NULL_STRING}

oCCcmdext := PushButton{self,ResourceID{JFO_PON_CMDEXT,_GetInst()}}
oCCcmdext:HyperLabel := HyperLabel{#cmdext,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdbco := PushButton{self,ResourceID{JFO_PON_CMDBCO,_GetInst()}}
oCCcmdbco:HyperLabel := HyperLabel{#cmdbco,"Sim/Nao",NULL_STRING,NULL_STRING}

oDCSC_EXTOCO := FixedText{self,ResourceID{JFO_PON_SC_EXTOCO,_GetInst()}}
oDCSC_EXTOCO:HyperLabel := HyperLabel{#SC_EXTOCO,"Extra:",NULL_STRING,NULL_STRING}

oDCSC_BCOOCO := FixedText{self,ResourceID{JFO_PON_SC_BCOOCO,_GetInst()}}
oDCSC_BCOOCO:HyperLabel := HyperLabel{#SC_BCOOCO,"Banco",NULL_STRING,NULL_STRING}

oCCcmdvir := PushButton{self,ResourceID{JFO_PON_CMDVIR,_GetInst()}}
oCCcmdvir:HyperLabel := HyperLabel{#cmdvir,"Sim/Nao",NULL_STRING,NULL_STRING}

oDCSC_CTA17 := FixedText{self,ResourceID{JFO_PON_SC_CTA17,_GetInst()}}
oDCSC_CTA17:HyperLabel := HyperLabel{#SC_CTA17,"Cta16:",NULL_STRING,NULL_STRING}

oDCSC_CTA9 := FixedText{self,ResourceID{JFO_PON_SC_CTA9,_GetInst()}}
oDCSC_CTA9:HyperLabel := HyperLabel{#SC_CTA9,"Cta08:",NULL_STRING,NULL_STRING}

oDCSC_CTA18 := FixedText{self,ResourceID{JFO_PON_SC_CTA18,_GetInst()}}
oDCSC_CTA18:HyperLabel := HyperLabel{#SC_CTA18,"Cta15:",NULL_STRING,NULL_STRING}

oDCSC_CTA8 := FixedText{self,ResourceID{JFO_PON_SC_CTA8,_GetInst()}}
oDCSC_CTA8:HyperLabel := HyperLabel{#SC_CTA8,"Cta07:",NULL_STRING,NULL_STRING}

oDCSC_CTA19 := FixedText{self,ResourceID{JFO_PON_SC_CTA19,_GetInst()}}
oDCSC_CTA19:HyperLabel := HyperLabel{#SC_CTA19,"Cta14:",NULL_STRING,NULL_STRING}

oDCSC_CTA7 := FixedText{self,ResourceID{JFO_PON_SC_CTA7,_GetInst()}}
oDCSC_CTA7:HyperLabel := HyperLabel{#SC_CTA7,"Cta06:",NULL_STRING,NULL_STRING}

oDCSC_CTA20 := FixedText{self,ResourceID{JFO_PON_SC_CTA20,_GetInst()}}
oDCSC_CTA20:HyperLabel := HyperLabel{#SC_CTA20,"Cta13:",NULL_STRING,NULL_STRING}

oDCSC_CTA6 := FixedText{self,ResourceID{JFO_PON_SC_CTA6,_GetInst()}}
oDCSC_CTA6:HyperLabel := HyperLabel{#SC_CTA6,"Cta05:",NULL_STRING,NULL_STRING}

oDCSC_CTA21 := FixedText{self,ResourceID{JFO_PON_SC_CTA21,_GetInst()}}
oDCSC_CTA21:HyperLabel := HyperLabel{#SC_CTA21,"Cta12:",NULL_STRING,NULL_STRING}

oDCSC_CTA5 := FixedText{self,ResourceID{JFO_PON_SC_CTA5,_GetInst()}}
oDCSC_CTA5:HyperLabel := HyperLabel{#SC_CTA5,"Cta04:",NULL_STRING,NULL_STRING}

oDCSC_CTA22 := FixedText{self,ResourceID{JFO_PON_SC_CTA22,_GetInst()}}
oDCSC_CTA22:HyperLabel := HyperLabel{#SC_CTA22,"Cta11:",NULL_STRING,NULL_STRING}

oDCSC_CTA4 := FixedText{self,ResourceID{JFO_PON_SC_CTA4,_GetInst()}}
oDCSC_CTA4:HyperLabel := HyperLabel{#SC_CTA4,"Cta03:",NULL_STRING,NULL_STRING}

oDCSC_CTA23 := FixedText{self,ResourceID{JFO_PON_SC_CTA23,_GetInst()}}
oDCSC_CTA23:HyperLabel := HyperLabel{#SC_CTA23,"Cta10:",NULL_STRING,NULL_STRING}

oDCSC_CTA3 := FixedText{self,ResourceID{JFO_PON_SC_CTA3,_GetInst()}}
oDCSC_CTA3:HyperLabel := HyperLabel{#SC_CTA3,"Cta02:",NULL_STRING,NULL_STRING}

oDCSC_CTA24 := FixedText{self,ResourceID{JFO_PON_SC_CTA24,_GetInst()}}
oDCSC_CTA24:HyperLabel := HyperLabel{#SC_CTA24,"Cta09:",NULL_STRING,NULL_STRING}

oDCSC_CTA2 := FixedText{self,ResourceID{JFO_PON_SC_CTA2,_GetInst()}}
oDCSC_CTA2:HyperLabel := HyperLabel{#SC_CTA2,"Cta01:",NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JFO_PON_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCesccod := PushButton{self,ResourceID{JFO_PON_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oCCescSUB := PushButton{self,ResourceID{JFO_PON_ESCSUB,_GetInst()}}
oCCescSUB:HyperLabel := HyperLabel{#escSUB,"...",NULL_STRING,NULL_STRING}

oCCcmdALM := PushButton{self,ResourceID{JFO_PON_CMDALM,_GetInst()}}
oCCcmdALM:HyperLabel := HyperLabel{#cmdALM," ABCDE",NULL_STRING,NULL_STRING}

oCCescHOR := PushButton{self,ResourceID{JFO_PON_ESCHOR,_GetInst()}}
oCCescHOR:HyperLabel := HyperLabel{#escHOR,"...",NULL_STRING,NULL_STRING}

oCCcmdpas := PushButton{self,ResourceID{JFO_PON_CMDPAS,_GetInst()}}
oCCcmdpas:HyperLabel := HyperLabel{#cmdpas,"Passagens",NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JFO_PON_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCPushButton12 := PushButton{self,ResourceID{JFO_PON_PUSHBUTTON12,_GetInst()}}
oCCPushButton12:HyperLabel := HyperLabel{#PushButton12,"WrelPassagens",NULL_STRING,NULL_STRING}

self:Caption := "Ponto"
self:HyperLabel := HyperLabel{#JFO_PON,"Ponto",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
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

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 9
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
oDBDATA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDATA)

oDBENT := DataColumn{PADRAO_NUM_05_2{}}
oDBENT:Width := 6
oDBENT:HyperLabel := oDCENT:HyperLabel 
oDBENT:Caption := "Ent:"
self:Browser:AddColumn(oDBENT)

oDBALS := DataColumn{PADRAO_NUM_05_2{}}
oDBALS:Width := 6
oDBALS:HyperLabel := oDCALS:HyperLabel 
oDBALS:Caption := "Als:"
self:Browser:AddColumn(oDBALS)

oDBALE := DataColumn{PADRAO_NUM_05_2{}}
oDBALE:Width := 6
oDBALE:HyperLabel := oDCALE:HyperLabel 
oDBALE:Caption := "Ale:"
self:Browser:AddColumn(oDBALE)

oDBSAI := DataColumn{PADRAO_NUM_05_2{}}
oDBSAI:Width := 7
oDBSAI:HyperLabel := oDCSAI:HyperLabel 
oDBSAI:Caption := "Sai:"
self:Browser:AddColumn(oDBSAI)

oDBCOD := DataColumn{PADRAO_CHAR_02{}}
oDBCOD:Width := 5
oDBCOD:HyperLabel := oDCCOD:HyperLabel 
oDBCOD:Caption := "Cod:"
self:Browser:AddColumn(oDBCOD)

oDBSOD := DataColumn{PADRAO_CHAR_02{}}
oDBSOD:Width := 5
oDBSOD:HyperLabel := oDCSOD:HyperLabel 
oDBSOD:Caption := "Sub"
self:Browser:AddColumn(oDBSOD)

oDBBCOSN := DataColumn{PADRAO_CHAR_01{}}
oDBBCOSN:Width := 7
oDBBCOSN:HyperLabel := oDCBCOSN:HyperLabel 
oDBBCOSN:Caption := "Bco:"
oDBBCOSN:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBBCOSN)

oDBREDSN := DataColumn{PADRAO_CHAR_01{}}
oDBREDSN:Width := 7
oDBREDSN:HyperLabel := oDCREDSN:HyperLabel 
oDBREDSN:Caption := "Red"
oDBREDSN:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBREDSN)

oDBFOLSN := DataColumn{PADRAO_CHAR_01{}}
oDBFOLSN:Width := 7
oDBFOLSN:HyperLabel := oDCFOLSN:HyperLabel 
oDBFOLSN:Caption := "Folga"
oDBFOLSN:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBFOLSN)

oDBEXTSN := DataColumn{PADRAO_CHAR_01{}}
oDBEXTSN:Width := 7
oDBEXTSN:HyperLabel := oDCEXTSN:HyperLabel 
oDBEXTSN:Caption := "Extra"
oDBEXTSN:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBEXTSN)

oDBVIRADA := DataColumn{PADRAO_CHAR_01{}}
oDBVIRADA:Width := 8
oDBVIRADA:HyperLabel := oDCVIRADA:HyperLabel 
oDBVIRADA:Caption := "Virada:"
oDBVIRADA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBVIRADA)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access REDSN() 
return self:FieldGet(#REDSN)


assign REDSN(uValue) 
self:FieldPut(#REDSN, uValue)
return REDSN := uValue


access SAI() 
return self:FieldGet(#SAI)


assign SAI(uValue) 
self:FieldPut(#SAI, uValue)
return SAI := uValue


access SAIREV() 
return self:FieldGet(#SAIREV)


assign SAIREV(uValue) 
self:FieldPut(#SAIREV, uValue)
return SAIREV := uValue


access SOD() 
return self:FieldGet(#SOD)


assign SOD(uValue) 
self:FieldPut(#SOD, uValue)
return SOD := uValue


access VIRADA() 
return self:FieldGet(#VIRADA)


assign VIRADA(uValue) 
self:FieldPut(#VIRADA, uValue)
return VIRADA := uValue


END CLASS
