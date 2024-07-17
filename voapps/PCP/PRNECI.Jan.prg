#region DEFINES
STATIC DEFINE JPRNECI_CODCOMP := 104 
STATIC DEFINE JPRNECI_ESTQPRO := 146 
STATIC DEFINE JPRNECI_FIXEDTEXT10 := 133 
STATIC DEFINE JPRNECI_FIXEDTEXT11 := 134 
STATIC DEFINE JPRNECI_FIXEDTEXT12 := 135 
STATIC DEFINE JPRNECI_FIXEDTEXT13 := 136 
STATIC DEFINE JPRNECI_FIXEDTEXT14 := 137 
STATIC DEFINE JPRNECI_FIXEDTEXT15 := 138 
STATIC DEFINE JPRNECI_FIXEDTEXT16 := 139 
STATIC DEFINE JPRNECI_FIXEDTEXT17 := 140 
STATIC DEFINE JPRNECI_FIXEDTEXT18 := 141 
STATIC DEFINE JPRNECI_FIXEDTEXT19 := 142 
STATIC DEFINE JPRNECI_FIXEDTEXT20 := 143 
STATIC DEFINE JPRNECI_FIXEDTEXT21 := 144 
STATIC DEFINE JPRNECI_FIXEDTEXT22 := 145 
STATIC DEFINE JPRNECI_FIXEDTEXT3 := 126 
STATIC DEFINE JPRNECI_FIXEDTEXT4 := 127 
STATIC DEFINE JPRNECI_FIXEDTEXT5 := 128 
STATIC DEFINE JPRNECI_FIXEDTEXT6 := 129 
STATIC DEFINE JPRNECI_FIXEDTEXT7 := 130 
STATIC DEFINE JPRNECI_FIXEDTEXT8 := 131 
STATIC DEFINE JPRNECI_FIXEDTEXT9 := 132 
STATIC DEFINE JPRNECI_QTDECOMP := 105 
STATIC DEFINE JPRNECI_QTDI01 := 106 
STATIC DEFINE JPRNECI_QTDI02 := 107 
STATIC DEFINE JPRNECI_QTDI03 := 108 
STATIC DEFINE JPRNECI_QTDI04 := 109 
STATIC DEFINE JPRNECI_QTDI05 := 110 
STATIC DEFINE JPRNECI_QTDI06 := 111 
STATIC DEFINE JPRNECI_QTDI07 := 112 
STATIC DEFINE JPRNECI_QTDI08 := 113 
STATIC DEFINE JPRNECI_QTDI09 := 114 
STATIC DEFINE JPRNECI_QTDI10 := 115 
STATIC DEFINE JPRNECI_QTDI11 := 116 
STATIC DEFINE JPRNECI_QTDI12 := 117 
STATIC DEFINE JPRNECI_QTDI13 := 118 
STATIC DEFINE JPRNECI_QTDI14 := 119 
STATIC DEFINE JPRNECI_QTDI15 := 120 
STATIC DEFINE JPRNECI_QTDI16 := 121 
STATIC DEFINE JPRNECI_QTDI17 := 122 
STATIC DEFINE JPRNECI_QTDI18 := 123 
STATIC DEFINE JPRNECI_QTDI19 := 124 
STATIC DEFINE JPRNECI_QTDI20 := 125 
STATIC DEFINE JPRNECI_SC_CODCOMP := 101 
STATIC DEFINE JPRNECI_SC_QTDECOMP := 102 
STATIC DEFINE JPRNECI_SC_QTDECOMP1 := 147 
STATIC DEFINE JPRNECI_SC_TIPOENT := 100 
STATIC DEFINE JPRNECI_TIPOENT := 103 
#endregion

class JPRNECI inherit DATAWINDOW 

	PROTECT oDBTIPOENT as DataColumn
	PROTECT oDBCODCOMP as DataColumn
	PROTECT oDBQTDECOMP as DataColumn
	protect oDCSC_TIPOENT as FIXEDTEXT
	protect oDCSC_CODCOMP as FIXEDTEXT
	protect oDCSC_QTDECOMP as FIXEDTEXT
	protect oDCTIPOENT as SINGLELINEEDIT
	protect oDCCODCOMP as SINGLELINEEDIT
	protect oDCQTDECOMP as SINGLELINEEDIT
	protect oDCQTDI01 as SINGLELINEEDIT
	protect oDCQTDI02 as SINGLELINEEDIT
	protect oDCQTDI03 as SINGLELINEEDIT
	protect oDCQTDI04 as SINGLELINEEDIT
	protect oDCQTDI05 as SINGLELINEEDIT
	protect oDCQTDI06 as SINGLELINEEDIT
	protect oDCQTDI07 as SINGLELINEEDIT
	protect oDCQTDI08 as SINGLELINEEDIT
	protect oDCQTDI09 as SINGLELINEEDIT
	protect oDCQTDI10 as SINGLELINEEDIT
	protect oDCQTDI11 as SINGLELINEEDIT
	protect oDCQTDI12 as SINGLELINEEDIT
	protect oDCQTDI13 as SINGLELINEEDIT
	protect oDCQTDI14 as SINGLELINEEDIT
	protect oDCQTDI15 as SINGLELINEEDIT
	protect oDCQTDI16 as SINGLELINEEDIT
	protect oDCQTDI17 as SINGLELINEEDIT
	protect oDCQTDI18 as SINGLELINEEDIT
	protect oDCQTDI19 as SINGLELINEEDIT
	protect oDCQTDI20 as SINGLELINEEDIT
	protect oDCFixedText3 as FIXEDTEXT
	protect oDCFixedText4 as FIXEDTEXT
	protect oDCFixedText5 as FIXEDTEXT
	protect oDCFixedText6 as FIXEDTEXT
	protect oDCFixedText7 as FIXEDTEXT
	protect oDCFixedText8 as FIXEDTEXT
	protect oDCFixedText9 as FIXEDTEXT
	protect oDCFixedText10 as FIXEDTEXT
	protect oDCFixedText11 as FIXEDTEXT
	protect oDCFixedText12 as FIXEDTEXT
	protect oDCFixedText13 as FIXEDTEXT
	protect oDCFixedText14 as FIXEDTEXT
	protect oDCFixedText15 as FIXEDTEXT
	protect oDCFixedText16 as FIXEDTEXT
	protect oDCFixedText17 as FIXEDTEXT
	protect oDCFixedText18 as FIXEDTEXT
	protect oDCFixedText19 as FIXEDTEXT
	protect oDCFixedText20 as FIXEDTEXT
	protect oDCFixedText21 as FIXEDTEXT
	protect oDCFixedText22 as FIXEDTEXT
	protect oDCESTQPRO as SINGLELINEEDIT
	protect oDCSC_QTDECOMP1 as FIXEDTEXT
// 	instance TIPOENT 
// 	instance CODCOMP 
// 	instance QTDECOMP 
// 	instance QTDI01 
// 	instance QTDI02 
// 	instance QTDI03 
// 	instance QTDI04 
// 	instance QTDI05 
// 	instance QTDI06 
// 	instance QTDI07 
// 	instance QTDI08 
// 	instance QTDI09 
// 	instance QTDI10 
// 	instance QTDI11 
// 	instance QTDI12 
// 	instance QTDI13 
// 	instance QTDI14 
// 	instance QTDI15 
// 	instance QTDI16 
// 	instance QTDI17 
// 	instance QTDI18 
// 	instance QTDI19 
// 	instance QTDI20 
// 	instance ESTQPRO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODCOMP() 
return self:FieldGet(#CODCOMP)


assign CODCOMP(uValue) 
self:FieldPut(#CODCOMP, uValue)
return CODCOMP := uValue


access ESTQPRO() 
return self:FieldGet(#ESTQPRO)


assign ESTQPRO(uValue) 
self:FieldPut(#ESTQPRO, uValue)
return ESTQPRO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPRNECI",_GetInst()},iCtlID)

oDCSC_TIPOENT := FixedText{self,ResourceID{JPRNECI_SC_TIPOENT,_GetInst()}}
oDCSC_TIPOENT:HyperLabel := HyperLabel{#SC_TIPOENT,"Tipo",NULL_STRING,NULL_STRING}

oDCSC_CODCOMP := FixedText{self,ResourceID{JPRNECI_SC_CODCOMP,_GetInst()}}
oDCSC_CODCOMP:HyperLabel := HyperLabel{#SC_CODCOMP,"Componente",NULL_STRING,NULL_STRING}

oDCSC_QTDECOMP := FixedText{self,ResourceID{JPRNECI_SC_QTDECOMP,_GetInst()}}
oDCSC_QTDECOMP:HyperLabel := HyperLabel{#SC_QTDECOMP,"Peso Qtde",NULL_STRING,NULL_STRING}

oDCTIPOENT := SingleLineEdit{self,ResourceID{JPRNECI_TIPOENT,_GetInst()}}
oDCTIPOENT:FieldSpec := PADRAO_CHAR_01{}
oDCTIPOENT:HyperLabel := HyperLabel{#TIPOENT,"Tipo",NULL_STRING,"PRNECI_TIPOENT"}

oDCCODCOMP := SingleLineEdit{self,ResourceID{JPRNECI_CODCOMP,_GetInst()}}
oDCCODCOMP:FieldSpec := PADRAO_CHAR_24{}
oDCCODCOMP:HyperLabel := HyperLabel{#CODCOMP,"Codigo",NULL_STRING,"PRNECI_CODCOMP"}

oDCQTDECOMP := SingleLineEdit{self,ResourceID{JPRNECI_QTDECOMP,_GetInst()}}
oDCQTDECOMP:FieldSpec := PADRAO_NUM_10_5{}
oDCQTDECOMP:HyperLabel := HyperLabel{#QTDECOMP,"Qtde",NULL_STRING,"PRNECI_QTDECOMP"}

oDCQTDI01 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI01,_GetInst()}}
oDCQTDI01:FieldSpec := PADRAO_NUM_12{}
oDCQTDI01:HyperLabel := HyperLabel{#QTDI01,"Qtdi01:",NULL_STRING,"PRNECI_QTDI01"}

oDCQTDI02 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI02,_GetInst()}}
oDCQTDI02:FieldSpec := PADRAO_NUM_12{}
oDCQTDI02:HyperLabel := HyperLabel{#QTDI02,"Qtdi02:",NULL_STRING,"PRNECI_QTDI02"}

oDCQTDI03 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI03,_GetInst()}}
oDCQTDI03:FieldSpec := PADRAO_NUM_12{}
oDCQTDI03:HyperLabel := HyperLabel{#QTDI03,"Qtdi03:",NULL_STRING,"PRNECI_QTDI03"}

oDCQTDI04 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI04,_GetInst()}}
oDCQTDI04:FieldSpec := PADRAO_NUM_12{}
oDCQTDI04:HyperLabel := HyperLabel{#QTDI04,"Qtdi04:",NULL_STRING,"PRNECI_QTDI04"}

oDCQTDI05 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI05,_GetInst()}}
oDCQTDI05:FieldSpec := PADRAO_NUM_12{}
oDCQTDI05:HyperLabel := HyperLabel{#QTDI05,"Qtdi05:",NULL_STRING,"PRNECI_QTDI05"}

oDCQTDI06 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI06,_GetInst()}}
oDCQTDI06:FieldSpec := PADRAO_NUM_12{}
oDCQTDI06:HyperLabel := HyperLabel{#QTDI06,"Qtdi06:",NULL_STRING,"PRNECI_QTDI06"}

oDCQTDI07 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI07,_GetInst()}}
oDCQTDI07:FieldSpec := PADRAO_NUM_12{}
oDCQTDI07:HyperLabel := HyperLabel{#QTDI07,"Qtdi07:",NULL_STRING,"PRNECI_QTDI07"}

oDCQTDI08 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI08,_GetInst()}}
oDCQTDI08:FieldSpec := PADRAO_NUM_12{}
oDCQTDI08:HyperLabel := HyperLabel{#QTDI08,"Qtdi08:",NULL_STRING,"PRNECI_QTDI08"}

oDCQTDI09 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI09,_GetInst()}}
oDCQTDI09:FieldSpec := PADRAO_NUM_12{}
oDCQTDI09:HyperLabel := HyperLabel{#QTDI09,"Qtdi09:",NULL_STRING,"PRNECI_QTDI09"}

oDCQTDI10 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI10,_GetInst()}}
oDCQTDI10:FieldSpec := PADRAO_NUM_12{}
oDCQTDI10:HyperLabel := HyperLabel{#QTDI10,"Qtdi10:",NULL_STRING,"PRNECI_QTDI10"}

oDCQTDI11 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI11,_GetInst()}}
oDCQTDI11:FieldSpec := PADRAO_NUM_12{}
oDCQTDI11:HyperLabel := HyperLabel{#QTDI11,"Qtdi11:",NULL_STRING,"PRNECI_QTDI11"}

oDCQTDI12 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI12,_GetInst()}}
oDCQTDI12:FieldSpec := PADRAO_NUM_12{}
oDCQTDI12:HyperLabel := HyperLabel{#QTDI12,"Qtdi12:",NULL_STRING,"PRNECI_QTDI12"}

oDCQTDI13 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI13,_GetInst()}}
oDCQTDI13:FieldSpec := PADRAO_NUM_12{}
oDCQTDI13:HyperLabel := HyperLabel{#QTDI13,"Qtdi13:",NULL_STRING,"PRNECI_QTDI13"}

oDCQTDI14 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI14,_GetInst()}}
oDCQTDI14:FieldSpec := PADRAO_NUM_12{}
oDCQTDI14:HyperLabel := HyperLabel{#QTDI14,"Qtdi14:",NULL_STRING,"PRNECI_QTDI14"}

oDCQTDI15 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI15,_GetInst()}}
oDCQTDI15:FieldSpec := PADRAO_NUM_12{}
oDCQTDI15:HyperLabel := HyperLabel{#QTDI15,"Qtdi15:",NULL_STRING,"PRNECI_QTDI15"}

oDCQTDI16 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI16,_GetInst()}}
oDCQTDI16:FieldSpec := PADRAO_NUM_12{}
oDCQTDI16:HyperLabel := HyperLabel{#QTDI16,"Qtdi16:",NULL_STRING,"PRNECI_QTDI16"}

oDCQTDI17 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI17,_GetInst()}}
oDCQTDI17:FieldSpec := PADRAO_NUM_12{}
oDCQTDI17:HyperLabel := HyperLabel{#QTDI17,"Qtdi17:",NULL_STRING,"PRNECI_QTDI17"}

oDCQTDI18 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI18,_GetInst()}}
oDCQTDI18:FieldSpec := PADRAO_NUM_12{}
oDCQTDI18:HyperLabel := HyperLabel{#QTDI18,"Qtdi18:",NULL_STRING,"PRNECI_QTDI18"}

oDCQTDI19 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI19,_GetInst()}}
oDCQTDI19:FieldSpec := PADRAO_NUM_12{}
oDCQTDI19:HyperLabel := HyperLabel{#QTDI19,"Qtdi19:",NULL_STRING,"PRNECI_QTDI19"}

oDCQTDI20 := SingleLineEdit{self,ResourceID{JPRNECI_QTDI20,_GetInst()}}
oDCQTDI20:FieldSpec := PADRAO_NUM_12{}
oDCQTDI20:HyperLabel := HyperLabel{#QTDI20,"Qtdi20:",NULL_STRING,"PRNECI_QTDI20"}

oDCFixedText3 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"01",NULL_STRING,NULL_STRING}

oDCFixedText4 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT4,_GetInst()}}
oDCFixedText4:HyperLabel := HyperLabel{#FixedText4,"02",NULL_STRING,NULL_STRING}

oDCFixedText5 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT5,_GetInst()}}
oDCFixedText5:HyperLabel := HyperLabel{#FixedText5,"03",NULL_STRING,NULL_STRING}

oDCFixedText6 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT6,_GetInst()}}
oDCFixedText6:HyperLabel := HyperLabel{#FixedText6,"04",NULL_STRING,NULL_STRING}

oDCFixedText7 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT7,_GetInst()}}
oDCFixedText7:HyperLabel := HyperLabel{#FixedText7,"05",NULL_STRING,NULL_STRING}

oDCFixedText8 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT8,_GetInst()}}
oDCFixedText8:HyperLabel := HyperLabel{#FixedText8,"06",NULL_STRING,NULL_STRING}

oDCFixedText9 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT9,_GetInst()}}
oDCFixedText9:HyperLabel := HyperLabel{#FixedText9,"07",NULL_STRING,NULL_STRING}

oDCFixedText10 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT10,_GetInst()}}
oDCFixedText10:HyperLabel := HyperLabel{#FixedText10,"08",NULL_STRING,NULL_STRING}

oDCFixedText11 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT11,_GetInst()}}
oDCFixedText11:HyperLabel := HyperLabel{#FixedText11,"09",NULL_STRING,NULL_STRING}

oDCFixedText12 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT12,_GetInst()}}
oDCFixedText12:HyperLabel := HyperLabel{#FixedText12,"10",NULL_STRING,NULL_STRING}

oDCFixedText13 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT13,_GetInst()}}
oDCFixedText13:HyperLabel := HyperLabel{#FixedText13,"20",NULL_STRING,NULL_STRING}

oDCFixedText14 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT14,_GetInst()}}
oDCFixedText14:HyperLabel := HyperLabel{#FixedText14,"19",NULL_STRING,NULL_STRING}

oDCFixedText15 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT15,_GetInst()}}
oDCFixedText15:HyperLabel := HyperLabel{#FixedText15,"18",NULL_STRING,NULL_STRING}

oDCFixedText16 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT16,_GetInst()}}
oDCFixedText16:HyperLabel := HyperLabel{#FixedText16,"17",NULL_STRING,NULL_STRING}

oDCFixedText17 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT17,_GetInst()}}
oDCFixedText17:HyperLabel := HyperLabel{#FixedText17,"16",NULL_STRING,NULL_STRING}

oDCFixedText18 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT18,_GetInst()}}
oDCFixedText18:HyperLabel := HyperLabel{#FixedText18,"15",NULL_STRING,NULL_STRING}

oDCFixedText19 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT19,_GetInst()}}
oDCFixedText19:HyperLabel := HyperLabel{#FixedText19,"14",NULL_STRING,NULL_STRING}

oDCFixedText20 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT20,_GetInst()}}
oDCFixedText20:HyperLabel := HyperLabel{#FixedText20,"13",NULL_STRING,NULL_STRING}

oDCFixedText21 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT21,_GetInst()}}
oDCFixedText21:HyperLabel := HyperLabel{#FixedText21,"12",NULL_STRING,NULL_STRING}

oDCFixedText22 := FixedText{self,ResourceID{JPRNECI_FIXEDTEXT22,_GetInst()}}
oDCFixedText22:HyperLabel := HyperLabel{#FixedText22,"11",NULL_STRING,NULL_STRING}

oDCESTQPRO := SingleLineEdit{self,ResourceID{JPRNECI_ESTQPRO,_GetInst()}}
oDCESTQPRO:FieldSpec := PADRAO_NUM_12{}
oDCESTQPRO:HyperLabel := HyperLabel{#ESTQPRO,"Qtde","e","PRNECI_QTDECOMP"}

oDCSC_QTDECOMP1 := FixedText{self,ResourceID{JPRNECI_SC_QTDECOMP1,_GetInst()}}
oDCSC_QTDECOMP1:HyperLabel := HyperLabel{#SC_QTDECOMP1,"Estq Proc",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JPRNECI,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTIPOENT := DataColumn{PADRAO_CHAR_01{}}
oDBTIPOENT:Width := 7
oDBTIPOENT:HyperLabel := oDCTIPOENT:HyperLabel 
oDBTIPOENT:Caption := "Tipo"
self:Browser:AddColumn(oDBTIPOENT)

oDBCODCOMP := DataColumn{PADRAO_CHAR_24{}}
oDBCODCOMP:Width := 31
oDBCODCOMP:HyperLabel := oDCCODCOMP:HyperLabel 
oDBCODCOMP:Caption := "Codigo"
self:Browser:AddColumn(oDBCODCOMP)

oDBQTDECOMP := DataColumn{PADRAO_NUM_10_5{}}
oDBQTDECOMP:Width := 18
oDBQTDECOMP:HyperLabel := oDCQTDECOMP:HyperLabel 
oDBQTDECOMP:Caption := "Qtde"
self:Browser:AddColumn(oDBQTDECOMP)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
//		    FabCenterWindow( SELF )
	RETURN NIL


access QTDECOMP() 
return self:FieldGet(#QTDECOMP)


assign QTDECOMP(uValue) 
self:FieldPut(#QTDECOMP, uValue)
return QTDECOMP := uValue


access QTDI01() 
return self:FieldGet(#QTDI01)


assign QTDI01(uValue) 
self:FieldPut(#QTDI01, uValue)
return QTDI01 := uValue


access QTDI02() 
return self:FieldGet(#QTDI02)


assign QTDI02(uValue) 
self:FieldPut(#QTDI02, uValue)
return QTDI02 := uValue


access QTDI03() 
return self:FieldGet(#QTDI03)


assign QTDI03(uValue) 
self:FieldPut(#QTDI03, uValue)
return QTDI03 := uValue


access QTDI04() 
return self:FieldGet(#QTDI04)


assign QTDI04(uValue) 
self:FieldPut(#QTDI04, uValue)
return QTDI04 := uValue


access QTDI05() 
return self:FieldGet(#QTDI05)


assign QTDI05(uValue) 
self:FieldPut(#QTDI05, uValue)
return QTDI05 := uValue


access QTDI06() 
return self:FieldGet(#QTDI06)


assign QTDI06(uValue) 
self:FieldPut(#QTDI06, uValue)
return QTDI06 := uValue


access QTDI07() 
return self:FieldGet(#QTDI07)


assign QTDI07(uValue) 
self:FieldPut(#QTDI07, uValue)
return QTDI07 := uValue


access QTDI08() 
return self:FieldGet(#QTDI08)


assign QTDI08(uValue) 
self:FieldPut(#QTDI08, uValue)
return QTDI08 := uValue


access QTDI09() 
return self:FieldGet(#QTDI09)


assign QTDI09(uValue) 
self:FieldPut(#QTDI09, uValue)
return QTDI09 := uValue


access QTDI10() 
return self:FieldGet(#QTDI10)


assign QTDI10(uValue) 
self:FieldPut(#QTDI10, uValue)
return QTDI10 := uValue


access QTDI11() 
return self:FieldGet(#QTDI11)


assign QTDI11(uValue) 
self:FieldPut(#QTDI11, uValue)
return QTDI11 := uValue


access QTDI12() 
return self:FieldGet(#QTDI12)


assign QTDI12(uValue) 
self:FieldPut(#QTDI12, uValue)
return QTDI12 := uValue


access QTDI13() 
return self:FieldGet(#QTDI13)


assign QTDI13(uValue) 
self:FieldPut(#QTDI13, uValue)
return QTDI13 := uValue


access QTDI14() 
return self:FieldGet(#QTDI14)


assign QTDI14(uValue) 
self:FieldPut(#QTDI14, uValue)
return QTDI14 := uValue


access QTDI15() 
return self:FieldGet(#QTDI15)


assign QTDI15(uValue) 
self:FieldPut(#QTDI15, uValue)
return QTDI15 := uValue


access QTDI16() 
return self:FieldGet(#QTDI16)


assign QTDI16(uValue) 
self:FieldPut(#QTDI16, uValue)
return QTDI16 := uValue


access QTDI17() 
return self:FieldGet(#QTDI17)


assign QTDI17(uValue) 
self:FieldPut(#QTDI17, uValue)
return QTDI17 := uValue


access QTDI18() 
return self:FieldGet(#QTDI18)


assign QTDI18(uValue) 
self:FieldPut(#QTDI18, uValue)
return QTDI18 := uValue


access QTDI19() 
return self:FieldGet(#QTDI19)


assign QTDI19(uValue) 
self:FieldPut(#QTDI19, uValue)
return QTDI19 := uValue


access QTDI20() 
return self:FieldGet(#QTDI20)


assign QTDI20(uValue) 
self:FieldPut(#QTDI20, uValue)
return QTDI20 := uValue


access TIPOENT() 
return self:FieldGet(#TIPOENT)


assign TIPOENT(uValue) 
self:FieldPut(#TIPOENT, uValue)
return TIPOENT := uValue


END CLASS
