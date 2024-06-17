#region DEFINES
STATIC DEFINE JACDI_ACD := 110 
STATIC DEFINE JACDI_ACP := 120 
STATIC DEFINE JACDI_AEP := 123 
STATIC DEFINE JACDI_DATA := 111 
STATIC DEFINE JACDI_HORA := 112 
STATIC DEFINE JACDI_LIC := 121 
STATIC DEFINE JACDI_LSC := 122 
STATIC DEFINE JACDI_MEDIA := 120 
STATIC DEFINE JACDI_MEDX := 105 
STATIC DEFINE JACDI_ORDEM := 124 
STATIC DEFINE JACDI_SC_ACD := 107 
STATIC DEFINE JACDI_SC_DATA := 108 
STATIC DEFINE JACDI_SC_HORA := 109 
STATIC DEFINE JACDI_SC_VAL01 := 113 
STATIC DEFINE JACDI_SC_VAL02 := 114 
STATIC DEFINE JACDI_SC_VAL03 := 115 
STATIC DEFINE JACDI_SC_VAL04 := 116 
STATIC DEFINE JACDI_SC_VAL05 := 117 
STATIC DEFINE JACDI_SC_VALR := 104 
STATIC DEFINE JACDI_TEXT06 := 119 
STATIC DEFINE JACDI_THEFIXEDTEXT11 := 118 
STATIC DEFINE JACDI_VAL01 := 100 
STATIC DEFINE JACDI_VAL02 := 101 
STATIC DEFINE JACDI_VAL03 := 102 
STATIC DEFINE JACDI_VAL04 := 103 
STATIC DEFINE JACDI_VAL05 := 104 
STATIC DEFINE JACDI_VALR := 106 
#endregion

class JACDI inherit DATAWINDOW 

	PROTECT oDBACD as DataColumn
	PROTECT oDBORDEM as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBHORA as DataColumn
	PROTECT oDBVAL01 as DataColumn
	PROTECT oDBVAL02 as DataColumn
	PROTECT oDBVAL03 as DataColumn
	PROTECT oDBVAL04 as DataColumn
	PROTECT oDBVAL05 as DataColumn
	PROTECT oDBMEDX as DataColumn
	PROTECT oDBVALR as DataColumn
	PROTECT oDBACP as DataColumn
	PROTECT oDBAEP as DataColumn
	PROTECT oDBLIC as DataColumn
	PROTECT oDBLSC as DataColumn
	protect oDCVAL01 as SINGLELINEEDIT
	protect oDCVAL02 as SINGLELINEEDIT
	protect oDCVAL03 as SINGLELINEEDIT
	protect oDCVAL04 as SINGLELINEEDIT
	protect oDCVAL05 as SINGLELINEEDIT
	protect oDCMEDX as SINGLELINEEDIT
	protect oDCVALR as SINGLELINEEDIT
	protect oDCSC_ACD as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_HORA as FIXEDTEXT
	protect oDCACD as SINGLELINEEDIT
	protect oDCDATA as SINGLELINEEDIT
	protect oDCHORA as SINGLELINEEDIT
	protect oDCSC_VAL01 as FIXEDTEXT
	protect oDCSC_VAL02 as FIXEDTEXT
	protect oDCSC_VAL03 as FIXEDTEXT
	protect oDCSC_VAL04 as FIXEDTEXT
	protect oDCSC_VAL05 as FIXEDTEXT
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oDCtext06 as FIXEDTEXT
// 	instance VAL01 
// 	instance VAL02 
// 	instance VAL03 
// 	instance VAL04 
// 	instance VAL05 
// 	instance MEDX 
// 	instance VALR 
// 	instance ACD 
// 	instance DATA 
// 	instance HORA 
// 	instance ACP 
// 	instance LIC 
// 	instance LSC 
// 	instance AEP 
// 	instance ORDEM 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ACD() 
return self:FieldGet(#ACD)


assign ACD(uValue) 
self:FieldPut(#ACD, uValue)
return ACD := uValue


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


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access HORA() 
return self:FieldGet(#HORA)


assign HORA(uValue) 
self:FieldPut(#HORA, uValue)
return HORA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JACDI",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCVAL01 := SingleLineEdit{self,ResourceID{JACDI_VAL01,_GetInst()}}
oDCVAL01:FieldSpec := padrao_num_09_4{}
oDCVAL01:HyperLabel := HyperLabel{#VAL01,"Val01",NULL_STRING,"ACDI_VAL01"}

oDCVAL02 := SingleLineEdit{self,ResourceID{JACDI_VAL02,_GetInst()}}
oDCVAL02:FieldSpec := padrao_num_09_4{}
oDCVAL02:HyperLabel := HyperLabel{#VAL02,"Val02",NULL_STRING,"ACDI_VAL02"}

oDCVAL03 := SingleLineEdit{self,ResourceID{JACDI_VAL03,_GetInst()}}
oDCVAL03:FieldSpec := padrao_num_09_4{}
oDCVAL03:HyperLabel := HyperLabel{#VAL03,"Val03",NULL_STRING,"ACDI_VAL03"}

oDCVAL04 := SingleLineEdit{self,ResourceID{JACDI_VAL04,_GetInst()}}
oDCVAL04:FieldSpec := padrao_num_09_4{}
oDCVAL04:HyperLabel := HyperLabel{#VAL04,"Val04",NULL_STRING,"ACDI_VAL04"}

oDCVAL05 := SingleLineEdit{self,ResourceID{JACDI_VAL05,_GetInst()}}
oDCVAL05:FieldSpec := padrao_num_09_4{}
oDCVAL05:HyperLabel := HyperLabel{#VAL05,"Val05",NULL_STRING,"ACDI_VAL05"}

oDCMEDX := SingleLineEdit{self,ResourceID{JACDI_MEDX,_GetInst()}}
oDCMEDX:HyperLabel := HyperLabel{#MEDX,"MediaX",NULL_STRING,NULL_STRING}
oDCMEDX:FieldSpec := padrao_num_09_4{}

oDCVALR := SingleLineEdit{self,ResourceID{JACDI_VALR,_GetInst()}}
oDCVALR:HyperLabel := HyperLabel{#VALR,"ValR",NULL_STRING,NULL_STRING}
oDCVALR:FieldSpec := padrao_num_09_4{}

oDCSC_ACD := FixedText{self,ResourceID{JACDI_SC_ACD,_GetInst()}}
oDCSC_ACD:HyperLabel := HyperLabel{#SC_ACD,"Acd:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JACDI_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_HORA := FixedText{self,ResourceID{JACDI_SC_HORA,_GetInst()}}
oDCSC_HORA:HyperLabel := HyperLabel{#SC_HORA,"Hora:",NULL_STRING,NULL_STRING}

oDCACD := SingleLineEdit{self,ResourceID{JACDI_ACD,_GetInst()}}
oDCACD:FieldSpec := padrao_num_08{}
oDCACD:HyperLabel := HyperLabel{#ACD,"Acd:",NULL_STRING,"ACDI_ACD"}
oDCACD:BackGround := aBrushes[1]
oDCACD:Font(aFonts[1], FALSE)

oDCDATA := SingleLineEdit{self,ResourceID{JACDI_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"ACDI_DATA"}
oDCDATA:BackGround := aBrushes[1]
oDCDATA:Font(aFonts[1], FALSE)

oDCHORA := SingleLineEdit{self,ResourceID{JACDI_HORA,_GetInst()}}
oDCHORA:FieldSpec := padrao_num_05_2{}
oDCHORA:HyperLabel := HyperLabel{#HORA,"Hora:",NULL_STRING,"ACDI_HORA"}
oDCHORA:BackGround := aBrushes[1]
oDCHORA:Font(aFonts[1], FALSE)

oDCSC_VAL01 := FixedText{self,ResourceID{JACDI_SC_VAL01,_GetInst()}}
oDCSC_VAL01:HyperLabel := HyperLabel{#SC_VAL01,"Val01:",NULL_STRING,NULL_STRING}

oDCSC_VAL02 := FixedText{self,ResourceID{JACDI_SC_VAL02,_GetInst()}}
oDCSC_VAL02:HyperLabel := HyperLabel{#SC_VAL02,"Val02:",NULL_STRING,NULL_STRING}

oDCSC_VAL03 := FixedText{self,ResourceID{JACDI_SC_VAL03,_GetInst()}}
oDCSC_VAL03:HyperLabel := HyperLabel{#SC_VAL03,"Val03:",NULL_STRING,NULL_STRING}

oDCSC_VAL04 := FixedText{self,ResourceID{JACDI_SC_VAL04,_GetInst()}}
oDCSC_VAL04:HyperLabel := HyperLabel{#SC_VAL04,"Val04:",NULL_STRING,NULL_STRING}

oDCSC_VAL05 := FixedText{self,ResourceID{JACDI_SC_VAL05,_GetInst()}}
oDCSC_VAL05:HyperLabel := HyperLabel{#SC_VAL05,"Val05:",NULL_STRING,NULL_STRING}

oDCtheFixedText11 := FixedText{self,ResourceID{JACDI_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Media R",NULL_STRING,NULL_STRING}

oDCtext06 := FixedText{self,ResourceID{JACDI_TEXT06,_GetInst()}}
oDCtext06:HyperLabel := HyperLabel{#text06,"Media X",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JACDI,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBACD := DataColumn{padrao_num_08{}}
oDBACD:Width := 5
oDBACD:HyperLabel := oDCACD:HyperLabel 
oDBACD:Caption := "Acd:"
oDBACD:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBACD)

oDBORDEM := DataColumn{padrao_num_03{}}
oDBORDEM:Width := 5
oDBORDEM:HyperLabel := HyperLabel{#ORDEM,"Ord",NULL_STRING,"ACDI_ACP"} 
oDBORDEM:Caption := "Ord"
self:Browser:AddColumn(oDBORDEM)

oDBDATA := DataColumn{date_field{}}
oDBDATA:Width := 11
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
oDBDATA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDATA)

oDBHORA := DataColumn{padrao_num_05_2{}}
oDBHORA:Width := 6
oDBHORA:HyperLabel := oDCHORA:HyperLabel 
oDBHORA:Caption := "Hora:"
oDBHORA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBHORA)

oDBVAL01 := DataColumn{padrao_num_09_4{}}
oDBVAL01:Width := 8
oDBVAL01:HyperLabel := oDCVAL01:HyperLabel 
oDBVAL01:Caption := "Val01"
self:Browser:AddColumn(oDBVAL01)

oDBVAL02 := DataColumn{padrao_num_09_4{}}
oDBVAL02:Width := 8
oDBVAL02:HyperLabel := oDCVAL02:HyperLabel 
oDBVAL02:Caption := "Val02"
self:Browser:AddColumn(oDBVAL02)

oDBVAL03 := DataColumn{padrao_num_09_4{}}
oDBVAL03:Width := 8
oDBVAL03:HyperLabel := oDCVAL03:HyperLabel 
oDBVAL03:Caption := "Val03"
self:Browser:AddColumn(oDBVAL03)

oDBVAL04 := DataColumn{padrao_num_09_4{}}
oDBVAL04:Width := 8
oDBVAL04:HyperLabel := oDCVAL04:HyperLabel 
oDBVAL04:Caption := "Val04"
self:Browser:AddColumn(oDBVAL04)

oDBVAL05 := DataColumn{padrao_num_09_4{}}
oDBVAL05:Width := 8
oDBVAL05:HyperLabel := oDCVAL05:HyperLabel 
oDBVAL05:Caption := "Val05"
self:Browser:AddColumn(oDBVAL05)

oDBMEDX := DataColumn{padrao_num_09_4{}}
oDBMEDX:Width := 9
oDBMEDX:HyperLabel := oDCMEDX:HyperLabel 
oDBMEDX:Caption := "MediaX"
self:Browser:AddColumn(oDBMEDX)

oDBVALR := DataColumn{padrao_num_09_4{}}
oDBVALR:Width := 10
oDBVALR:HyperLabel := oDCVALR:HyperLabel 
oDBVALR:Caption := "ValR"
self:Browser:AddColumn(oDBVALR)

oDBACP := DataColumn{padrao_num_08{}}
oDBACP:Width := 6
oDBACP:HyperLabel := HyperLabel{#ACP,"ACP",NULL_STRING,"ACDI_ACP"} 
oDBACP:Caption := "ACP"
self:Browser:AddColumn(oDBACP)

oDBAEP := DataColumn{padrao_num_08{}}
oDBAEP:Width := 6
oDBAEP:HyperLabel := HyperLabel{#AEP,"AEP",NULL_STRING,"ACDI_ACP"} 
oDBAEP:Caption := "AEP"
self:Browser:AddColumn(oDBAEP)

oDBLIC := DataColumn{padrao_num_09_4{}}
oDBLIC:Width := 8
oDBLIC:HyperLabel := HyperLabel{#LIC,"LIC",NULL_STRING,"ACDI_VAL05"} 
oDBLIC:Caption := "LIC"
self:Browser:AddColumn(oDBLIC)

oDBLSC := DataColumn{padrao_num_09_4{}}
oDBLSC:Width := 9
oDBLSC:HyperLabel := HyperLabel{#LSC,"LSC",NULL_STRING,"ACDI_VAL05"} 
oDBLSC:Caption := "LSC"
self:Browser:AddColumn(oDBLSC)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LIC() 
return self:FieldGet(#LIC)


assign LIC(uValue) 
self:FieldPut(#LIC, uValue)
return LIC := uValue


access LSC() 
return self:FieldGet(#LSC)


assign LSC(uValue) 
self:FieldPut(#LSC, uValue)
return LSC := uValue


access MEDX() 
return self:FieldGet(#MEDX)


assign MEDX(uValue) 
self:FieldPut(#MEDX, uValue)
return MEDX := uValue


access ORDEM() 
return self:FieldGet(#ORDEM)


assign ORDEM(uValue) 
self:FieldPut(#ORDEM, uValue)
return ORDEM := uValue


access VAL01() 
return self:FieldGet(#VAL01)


assign VAL01(uValue) 
self:FieldPut(#VAL01, uValue)
return VAL01 := uValue


access VAL02() 
return self:FieldGet(#VAL02)


assign VAL02(uValue) 
self:FieldPut(#VAL02, uValue)
return VAL02 := uValue


access VAL03() 
return self:FieldGet(#VAL03)


assign VAL03(uValue) 
self:FieldPut(#VAL03, uValue)
return VAL03 := uValue


access VAL04() 
return self:FieldGet(#VAL04)


assign VAL04(uValue) 
self:FieldPut(#VAL04, uValue)
return VAL04 := uValue


access VAL05() 
return self:FieldGet(#VAL05)


assign VAL05(uValue) 
self:FieldPut(#VAL05, uValue)
return VAL05 := uValue


access VALR() 
return self:FieldGet(#VALR)


assign VALR(uValue) 
self:FieldPut(#VALR, uValue)
return VALR := uValue


END CLASS
