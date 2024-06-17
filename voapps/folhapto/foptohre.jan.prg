#region DEFINES
STATIC DEFINE JPTOHRE_BUSCANUM := 158 
STATIC DEFINE JPTOHRE_CMDORDENAR := 159 
STATIC DEFINE JPTOHRE_CODIGO := 145 
STATIC DEFINE JPTOHRE_FIXEDTEXT10 := 152 
STATIC DEFINE JPTOHRE_FIXEDTEXT11 := 153 
STATIC DEFINE JPTOHRE_FIXEDTEXT12 := 154 
STATIC DEFINE JPTOHRE_FIXEDTEXT13 := 155 
STATIC DEFINE JPTOHRE_FIXEDTEXT5 := 147 
STATIC DEFINE JPTOHRE_FIXEDTEXT6 := 148 
STATIC DEFINE JPTOHRE_FIXEDTEXT7 := 149 
STATIC DEFINE JPTOHRE_FIXEDTEXT8 := 150 
STATIC DEFINE JPTOHRE_FIXEDTEXT9 := 151 
STATIC DEFINE JPTOHRE_HALE := 103 
STATIC DEFINE JPTOHRE_HALE01 := 138 
STATIC DEFINE JPTOHRE_HALE02 := 108 
STATIC DEFINE JPTOHRE_HALE03 := 113 
STATIC DEFINE JPTOHRE_HALE04 := 118 
STATIC DEFINE JPTOHRE_HALE05 := 123 
STATIC DEFINE JPTOHRE_HALE06 := 128 
STATIC DEFINE JPTOHRE_HALE07 := 133 
STATIC DEFINE JPTOHRE_HALS := 102 
STATIC DEFINE JPTOHRE_HALS01 := 137 
STATIC DEFINE JPTOHRE_HALS02 := 107 
STATIC DEFINE JPTOHRE_HALS03 := 112 
STATIC DEFINE JPTOHRE_HALS04 := 117 
STATIC DEFINE JPTOHRE_HALS05 := 122 
STATIC DEFINE JPTOHRE_HALS06 := 127 
STATIC DEFINE JPTOHRE_HALS07 := 132 
STATIC DEFINE JPTOHRE_HENT := 101 
STATIC DEFINE JPTOHRE_HENT01 := 136 
STATIC DEFINE JPTOHRE_HENT02 := 106 
STATIC DEFINE JPTOHRE_HENT03 := 111 
STATIC DEFINE JPTOHRE_HENT04 := 116 
STATIC DEFINE JPTOHRE_HENT05 := 121 
STATIC DEFINE JPTOHRE_HENT06 := 126 
STATIC DEFINE JPTOHRE_HENT07 := 131 
STATIC DEFINE JPTOHRE_HFOL := 105 
STATIC DEFINE JPTOHRE_HFOL01 := 140 
STATIC DEFINE JPTOHRE_HFOL02 := 110 
STATIC DEFINE JPTOHRE_HFOL03 := 115 
STATIC DEFINE JPTOHRE_HFOL04 := 120 
STATIC DEFINE JPTOHRE_HFOL05 := 125 
STATIC DEFINE JPTOHRE_HFOL06 := 130 
STATIC DEFINE JPTOHRE_HFOL07 := 135 
STATIC DEFINE JPTOHRE_HSAI := 104 
STATIC DEFINE JPTOHRE_HSAI01 := 139 
STATIC DEFINE JPTOHRE_HSAI02 := 109 
STATIC DEFINE JPTOHRE_HSAI03 := 114 
STATIC DEFINE JPTOHRE_HSAI04 := 119 
STATIC DEFINE JPTOHRE_HSAI05 := 124 
STATIC DEFINE JPTOHRE_HSAI06 := 129 
STATIC DEFINE JPTOHRE_HSAI07 := 134 
STATIC DEFINE JPTOHRE_NOME := 100 
STATIC DEFINE JPTOHRE_PEGDES := 156 
STATIC DEFINE JPTOHRE_SC_ALMI1 := 157 
STATIC DEFINE JPTOHRE_SC_CODIGO := 141 
STATIC DEFINE JPTOHRE_SC_HALS := 144 
STATIC DEFINE JPTOHRE_SC_HENT := 142 
STATIC DEFINE JPTOHRE_SC_HSAI := 143 
STATIC DEFINE JPTOHRE_SC_HSAI1 := 146 
#endregion

PARTIAL class JPTOHRE inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCNOME as SINGLELINEEDIT
	protect oDCHENT as RIGHTSLE
	protect oDCHALS as RIGHTSLE
	protect oDCHALE as RIGHTSLE
	protect oDCHSAI as RIGHTSLE
	protect oDCHFOL as SINGLELINEEDIT
	protect oDCHENT02 as RIGHTSLE
	protect oDCHALS02 as RIGHTSLE
	protect oDCHALE02 as RIGHTSLE
	protect oDCHSAI02 as RIGHTSLE
	protect oDCHFOL02 as SINGLELINEEDIT
	protect oDCHENT03 as RIGHTSLE
	protect oDCHALS03 as RIGHTSLE
	protect oDCHALE03 as RIGHTSLE
	protect oDCHSAI03 as RIGHTSLE
	protect oDCHFOL03 as SINGLELINEEDIT
	protect oDCHENT04 as RIGHTSLE
	protect oDCHALS04 as RIGHTSLE
	protect oDCHALE04 as RIGHTSLE
	protect oDCHSAI04 as RIGHTSLE
	protect oDCHFOL04 as SINGLELINEEDIT
	protect oDCHENT05 as RIGHTSLE
	protect oDCHALS05 as RIGHTSLE
	protect oDCHALE05 as RIGHTSLE
	protect oDCHSAI05 as RIGHTSLE
	protect oDCHFOL05 as SINGLELINEEDIT
	protect oDCHENT06 as RIGHTSLE
	protect oDCHALS06 as RIGHTSLE
	protect oDCHALE06 as RIGHTSLE
	protect oDCHSAI06 as RIGHTSLE
	protect oDCHFOL06 as SINGLELINEEDIT
	protect oDCHENT07 as RIGHTSLE
	protect oDCHALS07 as RIGHTSLE
	protect oDCHALE07 as RIGHTSLE
	protect oDCHSAI07 as RIGHTSLE
	protect oDCHFOL07 as SINGLELINEEDIT
	protect oDCHENT01 as RIGHTSLE
	protect oDCHALS01 as RIGHTSLE
	protect oDCHALE01 as RIGHTSLE
	protect oDCHSAI01 as RIGHTSLE
	protect oDCHFOL01 as SINGLELINEEDIT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_HENT as FIXEDTEXT
	protect oDCSC_HSAI as FIXEDTEXT
	protect oDCSC_HALS as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_HSAI1 as FIXEDTEXT
	protect oDCFixedText5 as FIXEDTEXT
	protect oDCFixedText6 as FIXEDTEXT
	protect oDCFixedText7 as FIXEDTEXT
	protect oDCFixedText8 as FIXEDTEXT
	protect oDCFixedText9 as FIXEDTEXT
	protect oDCFixedText10 as FIXEDTEXT
	protect oDCFixedText11 as FIXEDTEXT
	protect oDCFixedText12 as FIXEDTEXT
	protect oDCFixedText13 as FIXEDTEXT
	protect oCCpegdes as PUSHBUTTON
	protect oDCSC_ALMI1 as FIXEDTEXT
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
// 	instance NOME 
// 	instance HENT 
// 	instance HALS 
// 	instance HALE 
// 	instance HSAI 
// 	instance HFOL 
// 	instance HENT02 
// 	instance HALS02 
// 	instance HALE02 
// 	instance HSAI02 
// 	instance HFOL02 
// 	instance HENT03 
// 	instance HALS03 
// 	instance HALE03 
// 	instance HSAI03 
// 	instance HFOL03 
// 	instance HENT04 
// 	instance HALS04 
// 	instance HALE04 
// 	instance HSAI04 
// 	instance HFOL04 
// 	instance HENT05 
// 	instance HALS05 
// 	instance HALE05 
// 	instance HSAI05 
// 	instance HFOL05 
// 	instance HENT06 
// 	instance HALS06 
// 	instance HALE06 
// 	instance HSAI06 
// 	instance HFOL06 
// 	instance HENT07 
// 	instance HALS07 
// 	instance HALE07 
// 	instance HSAI07 
// 	instance HFOL07 
// 	instance HENT01 
// 	instance HALS01 
// 	instance HALE01 
// 	instance HSAI01 
// 	instance HFOL01 
// 	instance CODIGO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD cmdordenar( ) 
	SELF:KeyFind()

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access HALE() 
return self:FieldGet(#HALE)


assign HALE(uValue) 
self:FieldPut(#HALE, uValue)
return HALE := uValue


access HALE01() 
return self:FieldGet(#HALE01)


assign HALE01(uValue) 
self:FieldPut(#HALE01, uValue)
return HALE01 := uValue


access HALE02() 
return self:FieldGet(#HALE02)


assign HALE02(uValue) 
self:FieldPut(#HALE02, uValue)
return HALE02 := uValue


access HALE03() 
return self:FieldGet(#HALE03)


assign HALE03(uValue) 
self:FieldPut(#HALE03, uValue)
return HALE03 := uValue


access HALE04() 
return self:FieldGet(#HALE04)


assign HALE04(uValue) 
self:FieldPut(#HALE04, uValue)
return HALE04 := uValue


access HALE05() 
return self:FieldGet(#HALE05)


assign HALE05(uValue) 
self:FieldPut(#HALE05, uValue)
return HALE05 := uValue


access HALE06() 
return self:FieldGet(#HALE06)


assign HALE06(uValue) 
self:FieldPut(#HALE06, uValue)
return HALE06 := uValue


access HALE07() 
return self:FieldGet(#HALE07)


assign HALE07(uValue) 
self:FieldPut(#HALE07, uValue)
return HALE07 := uValue


access HALS() 
return self:FieldGet(#HALS)


assign HALS(uValue) 
self:FieldPut(#HALS, uValue)
return HALS := uValue


access HALS01() 
return self:FieldGet(#HALS01)


assign HALS01(uValue) 
self:FieldPut(#HALS01, uValue)
return HALS01 := uValue


access HALS02() 
return self:FieldGet(#HALS02)


assign HALS02(uValue) 
self:FieldPut(#HALS02, uValue)
return HALS02 := uValue


access HALS03() 
return self:FieldGet(#HALS03)


assign HALS03(uValue) 
self:FieldPut(#HALS03, uValue)
return HALS03 := uValue


access HALS04() 
return self:FieldGet(#HALS04)


assign HALS04(uValue) 
self:FieldPut(#HALS04, uValue)
return HALS04 := uValue


access HALS05() 
return self:FieldGet(#HALS05)


assign HALS05(uValue) 
self:FieldPut(#HALS05, uValue)
return HALS05 := uValue


access HALS06() 
return self:FieldGet(#HALS06)


assign HALS06(uValue) 
self:FieldPut(#HALS06, uValue)
return HALS06 := uValue


access HALS07() 
return self:FieldGet(#HALS07)


assign HALS07(uValue) 
self:FieldPut(#HALS07, uValue)
return HALS07 := uValue


access HENT() 
return self:FieldGet(#HENT)


assign HENT(uValue) 
self:FieldPut(#HENT, uValue)
return HENT := uValue


access HENT01() 
return self:FieldGet(#HENT01)


assign HENT01(uValue) 
self:FieldPut(#HENT01, uValue)
return HENT01 := uValue


access HENT02() 
return self:FieldGet(#HENT02)


assign HENT02(uValue) 
self:FieldPut(#HENT02, uValue)
return HENT02 := uValue


access HENT03() 
return self:FieldGet(#HENT03)


assign HENT03(uValue) 
self:FieldPut(#HENT03, uValue)
return HENT03 := uValue


access HENT04() 
return self:FieldGet(#HENT04)


assign HENT04(uValue) 
self:FieldPut(#HENT04, uValue)
return HENT04 := uValue


access HENT05() 
return self:FieldGet(#HENT05)


assign HENT05(uValue) 
self:FieldPut(#HENT05, uValue)
return HENT05 := uValue


access HENT06() 
return self:FieldGet(#HENT06)


assign HENT06(uValue) 
self:FieldPut(#HENT06, uValue)
return HENT06 := uValue


access HENT07() 
return self:FieldGet(#HENT07)


assign HENT07(uValue) 
self:FieldPut(#HENT07, uValue)
return HENT07 := uValue


access HFOL() 
return self:FieldGet(#HFOL)


assign HFOL(uValue) 
self:FieldPut(#HFOL, uValue)
return HFOL := uValue


access HFOL01() 
return self:FieldGet(#HFOL01)


assign HFOL01(uValue) 
self:FieldPut(#HFOL01, uValue)
return HFOL01 := uValue


access HFOL02() 
return self:FieldGet(#HFOL02)


assign HFOL02(uValue) 
self:FieldPut(#HFOL02, uValue)
return HFOL02 := uValue


access HFOL03() 
return self:FieldGet(#HFOL03)


assign HFOL03(uValue) 
self:FieldPut(#HFOL03, uValue)
return HFOL03 := uValue


access HFOL04() 
return self:FieldGet(#HFOL04)


assign HFOL04(uValue) 
self:FieldPut(#HFOL04, uValue)
return HFOL04 := uValue


access HFOL05() 
return self:FieldGet(#HFOL05)


assign HFOL05(uValue) 
self:FieldPut(#HFOL05, uValue)
return HFOL05 := uValue


access HFOL06() 
return self:FieldGet(#HFOL06)


assign HFOL06(uValue) 
self:FieldPut(#HFOL06, uValue)
return HFOL06 := uValue


access HFOL07() 
return self:FieldGet(#HFOL07)


assign HFOL07(uValue) 
self:FieldPut(#HFOL07, uValue)
return HFOL07 := uValue


access HSAI() 
return self:FieldGet(#HSAI)


assign HSAI(uValue) 
self:FieldPut(#HSAI, uValue)
return HSAI := uValue


access HSAI01() 
return self:FieldGet(#HSAI01)


assign HSAI01(uValue) 
self:FieldPut(#HSAI01, uValue)
return HSAI01 := uValue


access HSAI02() 
return self:FieldGet(#HSAI02)


assign HSAI02(uValue) 
self:FieldPut(#HSAI02, uValue)
return HSAI02 := uValue


access HSAI03() 
return self:FieldGet(#HSAI03)


assign HSAI03(uValue) 
self:FieldPut(#HSAI03, uValue)
return HSAI03 := uValue


access HSAI04() 
return self:FieldGet(#HSAI04)


assign HSAI04(uValue) 
self:FieldPut(#HSAI04, uValue)
return HSAI04 := uValue


access HSAI05() 
return self:FieldGet(#HSAI05)


assign HSAI05(uValue) 
self:FieldPut(#HSAI05, uValue)
return HSAI05 := uValue


access HSAI06() 
return self:FieldGet(#HSAI06)


assign HSAI06(uValue) 
self:FieldPut(#HSAI06, uValue)
return HSAI06 := uValue


access HSAI07() 
return self:FieldGet(#HSAI07)


assign HSAI07(uValue) 
self:FieldPut(#HSAI07, uValue)
return HSAI07 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPTOHRE",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCNOME := SingleLineEdit{self,ResourceID{JPTOHRE_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"noME",NULL_STRING,"FOPTOHOR_NOME"}

oDCHENT := rightSle{self,ResourceID{JPTOHRE_HENT,_GetInst()}}
oDCHENT:FieldSpec := PADRAO_NUM_05_2{}
oDCHENT:HyperLabel := HyperLabel{#HENT,"Hent:",NULL_STRING,"FOPTOHRE_HENT"}

oDCHALS := rightSle{self,ResourceID{JPTOHRE_HALS,_GetInst()}}
oDCHALS:FieldSpec := PADRAO_NUM_05_2{}
oDCHALS:HyperLabel := HyperLabel{#HALS,"Hals:",NULL_STRING,"FOPTOHRE_HALS"}

oDCHALE := rightSle{self,ResourceID{JPTOHRE_HALE,_GetInst()}}
oDCHALE:FieldSpec := PADRAO_NUM_05_2{}
oDCHALE:HyperLabel := HyperLabel{#HALE,"Hale:",NULL_STRING,"FOPTOHRE_HALE"}

oDCHSAI := rightSle{self,ResourceID{JPTOHRE_HSAI,_GetInst()}}
oDCHSAI:FieldSpec := PADRAO_NUM_05_2{}
oDCHSAI:HyperLabel := HyperLabel{#HSAI,"Hsai:",NULL_STRING,"FOPTOHRE_HSAI"}

oDCHFOL := SingleLineEdit{self,ResourceID{JPTOHRE_HFOL,_GetInst()}}
oDCHFOL:FieldSpec := PADRAO_CHAR_01{}
oDCHFOL:HyperLabel := HyperLabel{#HFOL,"Hfol00:",NULL_STRING,"FOPTOHRE_HFOL00"}

oDCHENT02 := rightSle{self,ResourceID{JPTOHRE_HENT02,_GetInst()}}
oDCHENT02:FieldSpec := PADRAO_NUM_05_2{}
oDCHENT02:HyperLabel := HyperLabel{#HENT02,"Hent03:",NULL_STRING,"FOPTOHRE_HENT03"}

oDCHALS02 := rightSle{self,ResourceID{JPTOHRE_HALS02,_GetInst()}}
oDCHALS02:FieldSpec := PADRAO_NUM_05_2{}
oDCHALS02:HyperLabel := HyperLabel{#HALS02,"Hals02:",NULL_STRING,"FOPTOHRE_HALS02"}

oDCHALE02 := rightSle{self,ResourceID{JPTOHRE_HALE02,_GetInst()}}
oDCHALE02:FieldSpec := PADRAO_NUM_05_2{}
oDCHALE02:HyperLabel := HyperLabel{#HALE02,"Hale02:",NULL_STRING,"FOPTOHRE_HALE02"}

oDCHSAI02 := rightSle{self,ResourceID{JPTOHRE_HSAI02,_GetInst()}}
oDCHSAI02:FieldSpec := PADRAO_NUM_05_2{}
oDCHSAI02:HyperLabel := HyperLabel{#HSAI02,"Hsai02:",NULL_STRING,"FOPTOHRE_HSAI02"}

oDCHFOL02 := SingleLineEdit{self,ResourceID{JPTOHRE_HFOL02,_GetInst()}}
oDCHFOL02:FieldSpec := PADRAO_CHAR_01{}
oDCHFOL02:HyperLabel := HyperLabel{#HFOL02,"Hfol02:",NULL_STRING,"FOPTOHRE_HFOL02"}

oDCHENT03 := rightSle{self,ResourceID{JPTOHRE_HENT03,_GetInst()}}
oDCHENT03:FieldSpec := PADRAO_NUM_05_2{}
oDCHENT03:HyperLabel := HyperLabel{#HENT03,"Hent03:",NULL_STRING,"FOPTOHRE_HENT03"}

oDCHALS03 := rightSle{self,ResourceID{JPTOHRE_HALS03,_GetInst()}}
oDCHALS03:FieldSpec := PADRAO_NUM_05_2{}
oDCHALS03:HyperLabel := HyperLabel{#HALS03,"Hals03:",NULL_STRING,"FOPTOHRE_HALS03"}

oDCHALE03 := rightSle{self,ResourceID{JPTOHRE_HALE03,_GetInst()}}
oDCHALE03:FieldSpec := PADRAO_NUM_05_2{}
oDCHALE03:HyperLabel := HyperLabel{#HALE03,"Hale03:",NULL_STRING,"FOPTOHRE_HALE03"}

oDCHSAI03 := rightSle{self,ResourceID{JPTOHRE_HSAI03,_GetInst()}}
oDCHSAI03:FieldSpec := PADRAO_NUM_05_2{}
oDCHSAI03:HyperLabel := HyperLabel{#HSAI03,"Hsai03:",NULL_STRING,"FOPTOHRE_HSAI03"}

oDCHFOL03 := SingleLineEdit{self,ResourceID{JPTOHRE_HFOL03,_GetInst()}}
oDCHFOL03:FieldSpec := PADRAO_CHAR_01{}
oDCHFOL03:HyperLabel := HyperLabel{#HFOL03,"Hfol03:",NULL_STRING,"FOPTOHRE_HFOL03"}

oDCHENT04 := rightSle{self,ResourceID{JPTOHRE_HENT04,_GetInst()}}
oDCHENT04:FieldSpec := PADRAO_NUM_05_2{}
oDCHENT04:HyperLabel := HyperLabel{#HENT04,"Hent04:",NULL_STRING,"FOPTOHRE_HENT04"}

oDCHALS04 := rightSle{self,ResourceID{JPTOHRE_HALS04,_GetInst()}}
oDCHALS04:FieldSpec := PADRAO_NUM_05_2{}
oDCHALS04:HyperLabel := HyperLabel{#HALS04,"Hals04:",NULL_STRING,"FOPTOHRE_HALS04"}

oDCHALE04 := rightSle{self,ResourceID{JPTOHRE_HALE04,_GetInst()}}
oDCHALE04:FieldSpec := PADRAO_NUM_05_2{}
oDCHALE04:HyperLabel := HyperLabel{#HALE04,"Hale04:",NULL_STRING,"FOPTOHRE_HALE04"}

oDCHSAI04 := rightSle{self,ResourceID{JPTOHRE_HSAI04,_GetInst()}}
oDCHSAI04:FieldSpec := PADRAO_NUM_05_2{}
oDCHSAI04:HyperLabel := HyperLabel{#HSAI04,"Hsai04:",NULL_STRING,"FOPTOHRE_HSAI04"}

oDCHFOL04 := SingleLineEdit{self,ResourceID{JPTOHRE_HFOL04,_GetInst()}}
oDCHFOL04:FieldSpec := PADRAO_CHAR_01{}
oDCHFOL04:HyperLabel := HyperLabel{#HFOL04,"Hfol04:",NULL_STRING,"FOPTOHRE_HFOL04"}

oDCHENT05 := rightSle{self,ResourceID{JPTOHRE_HENT05,_GetInst()}}
oDCHENT05:FieldSpec := PADRAO_NUM_05_2{}
oDCHENT05:HyperLabel := HyperLabel{#HENT05,"Hent03:",NULL_STRING,"FOPTOHRE_HENT03"}

oDCHALS05 := rightSle{self,ResourceID{JPTOHRE_HALS05,_GetInst()}}
oDCHALS05:FieldSpec := PADRAO_NUM_05_2{}
oDCHALS05:HyperLabel := HyperLabel{#HALS05,"Hals05:",NULL_STRING,"FOPTOHRE_HALS05"}

oDCHALE05 := rightSle{self,ResourceID{JPTOHRE_HALE05,_GetInst()}}
oDCHALE05:FieldSpec := PADRAO_NUM_05_2{}
oDCHALE05:HyperLabel := HyperLabel{#HALE05,"Hale05:",NULL_STRING,"FOPTOHRE_HALE05"}

oDCHSAI05 := rightSle{self,ResourceID{JPTOHRE_HSAI05,_GetInst()}}
oDCHSAI05:FieldSpec := PADRAO_NUM_05_2{}
oDCHSAI05:HyperLabel := HyperLabel{#HSAI05,"Hsai05:",NULL_STRING,"FOPTOHRE_HSAI05"}

oDCHFOL05 := SingleLineEdit{self,ResourceID{JPTOHRE_HFOL05,_GetInst()}}
oDCHFOL05:FieldSpec := PADRAO_CHAR_01{}
oDCHFOL05:HyperLabel := HyperLabel{#HFOL05,"Hfol05:",NULL_STRING,"FOPTOHRE_HFOL05"}

oDCHENT06 := rightSle{self,ResourceID{JPTOHRE_HENT06,_GetInst()}}
oDCHENT06:FieldSpec := PADRAO_NUM_05_2{}
oDCHENT06:HyperLabel := HyperLabel{#HENT06,"Hent03:",NULL_STRING,"FOPTOHRE_HENT03"}

oDCHALS06 := rightSle{self,ResourceID{JPTOHRE_HALS06,_GetInst()}}
oDCHALS06:FieldSpec := PADRAO_NUM_05_2{}
oDCHALS06:HyperLabel := HyperLabel{#HALS06,"Hals06:",NULL_STRING,"FOPTOHRE_HALS06"}

oDCHALE06 := rightSle{self,ResourceID{JPTOHRE_HALE06,_GetInst()}}
oDCHALE06:FieldSpec := PADRAO_NUM_05_2{}
oDCHALE06:HyperLabel := HyperLabel{#HALE06,"Hale06:",NULL_STRING,"FOPTOHRE_HALE06"}

oDCHSAI06 := rightSle{self,ResourceID{JPTOHRE_HSAI06,_GetInst()}}
oDCHSAI06:FieldSpec := PADRAO_NUM_05_2{}
oDCHSAI06:HyperLabel := HyperLabel{#HSAI06,"Hsai06:",NULL_STRING,"FOPTOHRE_HSAI06"}

oDCHFOL06 := SingleLineEdit{self,ResourceID{JPTOHRE_HFOL06,_GetInst()}}
oDCHFOL06:FieldSpec := PADRAO_CHAR_01{}
oDCHFOL06:HyperLabel := HyperLabel{#HFOL06,"Hfol06:",NULL_STRING,"FOPTOHRE_HFOL06"}

oDCHENT07 := rightSle{self,ResourceID{JPTOHRE_HENT07,_GetInst()}}
oDCHENT07:FieldSpec := PADRAO_NUM_05_2{}
oDCHENT07:HyperLabel := HyperLabel{#HENT07,"Hent07:",NULL_STRING,"FOPTOHRE_HENT07"}

oDCHALS07 := rightSle{self,ResourceID{JPTOHRE_HALS07,_GetInst()}}
oDCHALS07:FieldSpec := PADRAO_NUM_05_2{}
oDCHALS07:HyperLabel := HyperLabel{#HALS07,"Hals07:",NULL_STRING,"FOPTOHRE_HALS07"}

oDCHALE07 := rightSle{self,ResourceID{JPTOHRE_HALE07,_GetInst()}}
oDCHALE07:FieldSpec := PADRAO_NUM_05_2{}
oDCHALE07:HyperLabel := HyperLabel{#HALE07,"Hale07:",NULL_STRING,"FOPTOHRE_HALE07"}

oDCHSAI07 := rightSle{self,ResourceID{JPTOHRE_HSAI07,_GetInst()}}
oDCHSAI07:FieldSpec := PADRAO_NUM_05_2{}
oDCHSAI07:HyperLabel := HyperLabel{#HSAI07,"Hsai07:",NULL_STRING,"FOPTOHRE_HSAI07"}

oDCHFOL07 := SingleLineEdit{self,ResourceID{JPTOHRE_HFOL07,_GetInst()}}
oDCHFOL07:FieldSpec := PADRAO_CHAR_01{}
oDCHFOL07:HyperLabel := HyperLabel{#HFOL07,"Hfol07:",NULL_STRING,"FOPTOHRE_HFOL07"}

oDCHENT01 := rightSle{self,ResourceID{JPTOHRE_HENT01,_GetInst()}}
oDCHENT01:FieldSpec := PADRAO_NUM_05_2{}
oDCHENT01:HyperLabel := HyperLabel{#HENT01,"Hent01:",NULL_STRING,"FOPTOHRE_HENT01"}

oDCHALS01 := rightSle{self,ResourceID{JPTOHRE_HALS01,_GetInst()}}
oDCHALS01:FieldSpec := PADRAO_NUM_05_2{}
oDCHALS01:HyperLabel := HyperLabel{#HALS01,"Hals01:",NULL_STRING,"FOPTOHRE_HALS01"}

oDCHALE01 := rightSle{self,ResourceID{JPTOHRE_HALE01,_GetInst()}}
oDCHALE01:FieldSpec := PADRAO_NUM_05_2{}
oDCHALE01:HyperLabel := HyperLabel{#HALE01,"Hale01:",NULL_STRING,"FOPTOHRE_HALE01"}

oDCHSAI01 := rightSle{self,ResourceID{JPTOHRE_HSAI01,_GetInst()}}
oDCHSAI01:FieldSpec := PADRAO_NUM_05_2{}
oDCHSAI01:HyperLabel := HyperLabel{#HSAI01,"Hsai01:",NULL_STRING,"FOPTOHRE_HSAI01"}

oDCHFOL01 := SingleLineEdit{self,ResourceID{JPTOHRE_HFOL01,_GetInst()}}
oDCHFOL01:FieldSpec := PADRAO_CHAR_01{}
oDCHFOL01:HyperLabel := HyperLabel{#HFOL01,"Hfol01:",NULL_STRING,"FOPTOHRE_HFOL01"}

oDCSC_CODIGO := FixedText{self,ResourceID{JPTOHRE_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_HENT := FixedText{self,ResourceID{JPTOHRE_SC_HENT,_GetInst()}}
oDCSC_HENT:HyperLabel := HyperLabel{#SC_HENT,"Entrada",NULL_STRING,NULL_STRING}

oDCSC_HSAI := FixedText{self,ResourceID{JPTOHRE_SC_HSAI,_GetInst()}}
oDCSC_HSAI:HyperLabel := HyperLabel{#SC_HSAI,"Saida",NULL_STRING,NULL_STRING}

oDCSC_HALS := FixedText{self,ResourceID{JPTOHRE_SC_HALS,_GetInst()}}
oDCSC_HALS:HyperLabel := HyperLabel{#SC_HALS,"Refeiçao",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JPTOHRE_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_02{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"FOPTOHRE_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]

oDCSC_HSAI1 := FixedText{self,ResourceID{JPTOHRE_SC_HSAI1,_GetInst()}}
oDCSC_HSAI1:HyperLabel := HyperLabel{#SC_HSAI1,"Folga",NULL_STRING,NULL_STRING}

oDCFixedText5 := FixedText{self,ResourceID{JPTOHRE_FIXEDTEXT5,_GetInst()}}
oDCFixedText5:HyperLabel := HyperLabel{#FixedText5,"Padrao",NULL_STRING,NULL_STRING}

oDCFixedText6 := FixedText{self,ResourceID{JPTOHRE_FIXEDTEXT6,_GetInst()}}
oDCFixedText6:HyperLabel := HyperLabel{#FixedText6,"Segunda",NULL_STRING,NULL_STRING}

oDCFixedText7 := FixedText{self,ResourceID{JPTOHRE_FIXEDTEXT7,_GetInst()}}
oDCFixedText7:HyperLabel := HyperLabel{#FixedText7,"Terça",NULL_STRING,NULL_STRING}

oDCFixedText8 := FixedText{self,ResourceID{JPTOHRE_FIXEDTEXT8,_GetInst()}}
oDCFixedText8:HyperLabel := HyperLabel{#FixedText8,"Quarta",NULL_STRING,NULL_STRING}

oDCFixedText9 := FixedText{self,ResourceID{JPTOHRE_FIXEDTEXT9,_GetInst()}}
oDCFixedText9:HyperLabel := HyperLabel{#FixedText9,"Quinta",NULL_STRING,NULL_STRING}

oDCFixedText10 := FixedText{self,ResourceID{JPTOHRE_FIXEDTEXT10,_GetInst()}}
oDCFixedText10:HyperLabel := HyperLabel{#FixedText10,"Sexta",NULL_STRING,NULL_STRING}

oDCFixedText11 := FixedText{self,ResourceID{JPTOHRE_FIXEDTEXT11,_GetInst()}}
oDCFixedText11:HyperLabel := HyperLabel{#FixedText11,"Sabado",NULL_STRING,NULL_STRING}

oDCFixedText12 := FixedText{self,ResourceID{JPTOHRE_FIXEDTEXT12,_GetInst()}}
oDCFixedText12:HyperLabel := HyperLabel{#FixedText12,"Domingo",NULL_STRING,NULL_STRING}

oDCFixedText13 := FixedText{self,ResourceID{JPTOHRE_FIXEDTEXT13,_GetInst()}}
oDCFixedText13:HyperLabel := HyperLabel{#FixedText13,"Horarios  Normais",NULL_STRING,NULL_STRING}

oCCpegdes := PushButton{self,ResourceID{JPTOHRE_PEGDES,_GetInst()}}
oCCpegdes:HyperLabel := HyperLabel{#pegdes,"...",NULL_STRING,NULL_STRING}
oCCpegdes:TooltipText := "Gera Descritivo com Bases Nos Horarios"

oDCSC_ALMI1 := FixedText{self,ResourceID{JPTOHRE_SC_ALMI1,_GetInst()}}
oDCSC_ALMI1:HyperLabel := HyperLabel{#SC_ALMI1,"Descritivo",NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JPTOHRE_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCcmdordenar := PushButton{self,ResourceID{JPTOHRE_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Horarios Padrao"
self:HyperLabel := HyperLabel{#JPTOHRE,"Horarios Padrao",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_02{}}
oDBCODIGO:Width := 12
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_40{}}
oDBNOME:Width := 18
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "noME"
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


END CLASS
