#region DEFINES
STATIC DEFINE JNEC_CODCOMP := 161 
STATIC DEFINE JNEC_DATR01 := 138 
STATIC DEFINE JNEC_DATR02 := 136 
STATIC DEFINE JNEC_DATR03 := 134 
STATIC DEFINE JNEC_DATR04 := 132 
STATIC DEFINE JNEC_DATR05 := 130 
STATIC DEFINE JNEC_DATR06 := 128 
STATIC DEFINE JNEC_DATR07 := 126 
STATIC DEFINE JNEC_DATR08 := 124 
STATIC DEFINE JNEC_DATR09 := 122 
STATIC DEFINE JNEC_DATR10 := 120 
STATIC DEFINE JNEC_DATR11 := 118 
STATIC DEFINE JNEC_DATR12 := 116 
STATIC DEFINE JNEC_DATR13 := 114 
STATIC DEFINE JNEC_DATR14 := 112 
STATIC DEFINE JNEC_DATR15 := 110 
STATIC DEFINE JNEC_DATR16 := 108 
STATIC DEFINE JNEC_DATR17 := 106 
STATIC DEFINE JNEC_DATR18 := 104 
STATIC DEFINE JNEC_DATR19 := 102 
STATIC DEFINE JNEC_DATR20 := 100 
STATIC DEFINE JNEC_FIXEDTEXT10 := 152 
STATIC DEFINE JNEC_FIXEDTEXT11 := 151 
STATIC DEFINE JNEC_FIXEDTEXT12 := 150 
STATIC DEFINE JNEC_FIXEDTEXT13 := 140 
STATIC DEFINE JNEC_FIXEDTEXT14 := 141 
STATIC DEFINE JNEC_FIXEDTEXT15 := 142 
STATIC DEFINE JNEC_FIXEDTEXT16 := 143 
STATIC DEFINE JNEC_FIXEDTEXT17 := 144 
STATIC DEFINE JNEC_FIXEDTEXT18 := 145 
STATIC DEFINE JNEC_FIXEDTEXT19 := 146 
STATIC DEFINE JNEC_FIXEDTEXT20 := 147 
STATIC DEFINE JNEC_FIXEDTEXT21 := 148 
STATIC DEFINE JNEC_FIXEDTEXT22 := 149 
STATIC DEFINE JNEC_FIXEDTEXT3 := 159 
STATIC DEFINE JNEC_FIXEDTEXT4 := 158 
STATIC DEFINE JNEC_FIXEDTEXT5 := 157 
STATIC DEFINE JNEC_FIXEDTEXT6 := 156 
STATIC DEFINE JNEC_FIXEDTEXT7 := 155 
STATIC DEFINE JNEC_FIXEDTEXT8 := 154 
STATIC DEFINE JNEC_FIXEDTEXT9 := 153 
STATIC DEFINE JNEC_QTDI01 := 139 
STATIC DEFINE JNEC_QTDI02 := 137 
STATIC DEFINE JNEC_QTDI03 := 135 
STATIC DEFINE JNEC_QTDI04 := 133 
STATIC DEFINE JNEC_QTDI05 := 131 
STATIC DEFINE JNEC_QTDI06 := 129 
STATIC DEFINE JNEC_QTDI07 := 127 
STATIC DEFINE JNEC_QTDI08 := 125 
STATIC DEFINE JNEC_QTDI09 := 123 
STATIC DEFINE JNEC_QTDI10 := 121 
STATIC DEFINE JNEC_QTDI11 := 119 
STATIC DEFINE JNEC_QTDI12 := 117 
STATIC DEFINE JNEC_QTDI13 := 115 
STATIC DEFINE JNEC_QTDI14 := 113 
STATIC DEFINE JNEC_QTDI15 := 111 
STATIC DEFINE JNEC_QTDI16 := 109 
STATIC DEFINE JNEC_QTDI17 := 107 
STATIC DEFINE JNEC_QTDI18 := 105 
STATIC DEFINE JNEC_QTDI19 := 103 
STATIC DEFINE JNEC_QTDI20 := 101 
STATIC DEFINE JNEC_TIPOENT := 160 
#endregion

class jnec inherit MYDataWindow 

	protect oDCDATR20 as DATETIMEPICKER
	protect oDCQTDI20 as SINGLELINEEDIT
	protect oDCDATR19 as DATETIMEPICKER
	protect oDCQTDI19 as SINGLELINEEDIT
	protect oDCDATR18 as DATETIMEPICKER
	protect oDCQTDI18 as SINGLELINEEDIT
	protect oDCDATR17 as DATETIMEPICKER
	protect oDCQTDI17 as SINGLELINEEDIT
	protect oDCDATR16 as DATETIMEPICKER
	protect oDCQTDI16 as SINGLELINEEDIT
	protect oDCDATR15 as DATETIMEPICKER
	protect oDCQTDI15 as SINGLELINEEDIT
	protect oDCDATR14 as DATETIMEPICKER
	protect oDCQTDI14 as SINGLELINEEDIT
	protect oDCDATR13 as DATETIMEPICKER
	protect oDCQTDI13 as SINGLELINEEDIT
	protect oDCDATR12 as DATETIMEPICKER
	protect oDCQTDI12 as SINGLELINEEDIT
	protect oDCDATR11 as DATETIMEPICKER
	protect oDCQTDI11 as SINGLELINEEDIT
	protect oDCDATR10 as DATETIMEPICKER
	protect oDCQTDI10 as SINGLELINEEDIT
	protect oDCDATR09 as DATETIMEPICKER
	protect oDCQTDI09 as SINGLELINEEDIT
	protect oDCDATR08 as DATETIMEPICKER
	protect oDCQTDI08 as SINGLELINEEDIT
	protect oDCDATR07 as DATETIMEPICKER
	protect oDCQTDI07 as SINGLELINEEDIT
	protect oDCDATR06 as DATETIMEPICKER
	protect oDCQTDI06 as SINGLELINEEDIT
	protect oDCDATR05 as DATETIMEPICKER
	protect oDCQTDI05 as SINGLELINEEDIT
	protect oDCDATR04 as DATETIMEPICKER
	protect oDCQTDI04 as SINGLELINEEDIT
	protect oDCDATR03 as DATETIMEPICKER
	protect oDCQTDI03 as SINGLELINEEDIT
	protect oDCDATR02 as DATETIMEPICKER
	protect oDCQTDI02 as SINGLELINEEDIT
	protect oDCDATR01 as DATETIMEPICKER
	protect oDCQTDI01 as SINGLELINEEDIT
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
	protect oDCFixedText12 as FIXEDTEXT
	protect oDCFixedText11 as FIXEDTEXT
	protect oDCFixedText10 as FIXEDTEXT
	protect oDCFixedText9 as FIXEDTEXT
	protect oDCFixedText8 as FIXEDTEXT
	protect oDCFixedText7 as FIXEDTEXT
	protect oDCFixedText6 as FIXEDTEXT
	protect oDCFixedText5 as FIXEDTEXT
	protect oDCFixedText4 as FIXEDTEXT
	protect oDCFixedText3 as FIXEDTEXT
	protect oDCTIPOENT as SINGLELINEEDIT
	protect oDCCODCOMP as SINGLELINEEDIT
// 	instance QTDI20 
// 	instance QTDI19 
// 	instance QTDI18 
// 	instance QTDI17 
// 	instance QTDI16 
// 	instance QTDI15 
// 	instance QTDI14 
// 	instance QTDI13 
// 	instance QTDI12 
// 	instance QTDI11 
// 	instance QTDI10 
// 	instance QTDI09 
// 	instance QTDI08 
// 	instance QTDI07 
// 	instance QTDI06 
// 	instance QTDI05 
// 	instance QTDI04 
// 	instance QTDI03 
// 	instance QTDI02 
// 	instance QTDI01 
// 	instance TIPOENT 
// 	instance CODCOMP 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("PE","PE")	

access CODCOMP() 
return self:FieldGet(#CODCOMP)


assign CODCOMP(uValue) 
self:FieldPut(#CODCOMP, uValue)
return CODCOMP := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jnec",_GetInst()},iCtlID)

oDCDATR20 := DateTimePicker{self,ResourceID{JNEC_DATR20,_GetInst()}}
oDCDATR20:HyperLabel := HyperLabel{#DATR20,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI20 := SingleLineEdit{self,ResourceID{JNEC_QTDI20,_GetInst()}}
oDCQTDI20:FieldSpec := PADRAO_NUM_12{}
oDCQTDI20:HyperLabel := HyperLabel{#QTDI20,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR19 := DateTimePicker{self,ResourceID{JNEC_DATR19,_GetInst()}}
oDCDATR19:HyperLabel := HyperLabel{#DATR19,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI19 := SingleLineEdit{self,ResourceID{JNEC_QTDI19,_GetInst()}}
oDCQTDI19:FieldSpec := PADRAO_NUM_12{}
oDCQTDI19:HyperLabel := HyperLabel{#QTDI19,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR18 := DateTimePicker{self,ResourceID{JNEC_DATR18,_GetInst()}}
oDCDATR18:HyperLabel := HyperLabel{#DATR18,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI18 := SingleLineEdit{self,ResourceID{JNEC_QTDI18,_GetInst()}}
oDCQTDI18:FieldSpec := PADRAO_NUM_12{}
oDCQTDI18:HyperLabel := HyperLabel{#QTDI18,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR17 := DateTimePicker{self,ResourceID{JNEC_DATR17,_GetInst()}}
oDCDATR17:HyperLabel := HyperLabel{#DATR17,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI17 := SingleLineEdit{self,ResourceID{JNEC_QTDI17,_GetInst()}}
oDCQTDI17:FieldSpec := PADRAO_NUM_12{}
oDCQTDI17:HyperLabel := HyperLabel{#QTDI17,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR16 := DateTimePicker{self,ResourceID{JNEC_DATR16,_GetInst()}}
oDCDATR16:HyperLabel := HyperLabel{#DATR16,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI16 := SingleLineEdit{self,ResourceID{JNEC_QTDI16,_GetInst()}}
oDCQTDI16:FieldSpec := PADRAO_NUM_12{}
oDCQTDI16:HyperLabel := HyperLabel{#QTDI16,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR15 := DateTimePicker{self,ResourceID{JNEC_DATR15,_GetInst()}}
oDCDATR15:HyperLabel := HyperLabel{#DATR15,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI15 := SingleLineEdit{self,ResourceID{JNEC_QTDI15,_GetInst()}}
oDCQTDI15:FieldSpec := PADRAO_NUM_12{}
oDCQTDI15:HyperLabel := HyperLabel{#QTDI15,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR14 := DateTimePicker{self,ResourceID{JNEC_DATR14,_GetInst()}}
oDCDATR14:HyperLabel := HyperLabel{#DATR14,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI14 := SingleLineEdit{self,ResourceID{JNEC_QTDI14,_GetInst()}}
oDCQTDI14:FieldSpec := PADRAO_NUM_12{}
oDCQTDI14:HyperLabel := HyperLabel{#QTDI14,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR13 := DateTimePicker{self,ResourceID{JNEC_DATR13,_GetInst()}}
oDCDATR13:HyperLabel := HyperLabel{#DATR13,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI13 := SingleLineEdit{self,ResourceID{JNEC_QTDI13,_GetInst()}}
oDCQTDI13:FieldSpec := PADRAO_NUM_12{}
oDCQTDI13:HyperLabel := HyperLabel{#QTDI13,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR12 := DateTimePicker{self,ResourceID{JNEC_DATR12,_GetInst()}}
oDCDATR12:HyperLabel := HyperLabel{#DATR12,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI12 := SingleLineEdit{self,ResourceID{JNEC_QTDI12,_GetInst()}}
oDCQTDI12:FieldSpec := PADRAO_NUM_12{}
oDCQTDI12:HyperLabel := HyperLabel{#QTDI12,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR11 := DateTimePicker{self,ResourceID{JNEC_DATR11,_GetInst()}}
oDCDATR11:HyperLabel := HyperLabel{#DATR11,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI11 := SingleLineEdit{self,ResourceID{JNEC_QTDI11,_GetInst()}}
oDCQTDI11:FieldSpec := PADRAO_NUM_12{}
oDCQTDI11:HyperLabel := HyperLabel{#QTDI11,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR10 := DateTimePicker{self,ResourceID{JNEC_DATR10,_GetInst()}}
oDCDATR10:HyperLabel := HyperLabel{#DATR10,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI10 := SingleLineEdit{self,ResourceID{JNEC_QTDI10,_GetInst()}}
oDCQTDI10:FieldSpec := PADRAO_NUM_12{}
oDCQTDI10:HyperLabel := HyperLabel{#QTDI10,"Data01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR09 := DateTimePicker{self,ResourceID{JNEC_DATR09,_GetInst()}}
oDCDATR09:HyperLabel := HyperLabel{#DATR09,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI09 := SingleLineEdit{self,ResourceID{JNEC_QTDI09,_GetInst()}}
oDCQTDI09:FieldSpec := PADRAO_NUM_12{}
oDCQTDI09:HyperLabel := HyperLabel{#QTDI09,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR08 := DateTimePicker{self,ResourceID{JNEC_DATR08,_GetInst()}}
oDCDATR08:HyperLabel := HyperLabel{#DATR08,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI08 := SingleLineEdit{self,ResourceID{JNEC_QTDI08,_GetInst()}}
oDCQTDI08:FieldSpec := PADRAO_NUM_12{}
oDCQTDI08:HyperLabel := HyperLabel{#QTDI08,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR07 := DateTimePicker{self,ResourceID{JNEC_DATR07,_GetInst()}}
oDCDATR07:HyperLabel := HyperLabel{#DATR07,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI07 := SingleLineEdit{self,ResourceID{JNEC_QTDI07,_GetInst()}}
oDCQTDI07:FieldSpec := PADRAO_NUM_12{}
oDCQTDI07:HyperLabel := HyperLabel{#QTDI07,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR06 := DateTimePicker{self,ResourceID{JNEC_DATR06,_GetInst()}}
oDCDATR06:HyperLabel := HyperLabel{#DATR06,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI06 := SingleLineEdit{self,ResourceID{JNEC_QTDI06,_GetInst()}}
oDCQTDI06:FieldSpec := PADRAO_NUM_12{}
oDCQTDI06:HyperLabel := HyperLabel{#QTDI06,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR05 := DateTimePicker{self,ResourceID{JNEC_DATR05,_GetInst()}}
oDCDATR05:HyperLabel := HyperLabel{#DATR05,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI05 := SingleLineEdit{self,ResourceID{JNEC_QTDI05,_GetInst()}}
oDCQTDI05:FieldSpec := PADRAO_NUM_12{}
oDCQTDI05:HyperLabel := HyperLabel{#QTDI05,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR04 := DateTimePicker{self,ResourceID{JNEC_DATR04,_GetInst()}}
oDCDATR04:HyperLabel := HyperLabel{#DATR04,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI04 := SingleLineEdit{self,ResourceID{JNEC_QTDI04,_GetInst()}}
oDCQTDI04:FieldSpec := PADRAO_NUM_12{}
oDCQTDI04:HyperLabel := HyperLabel{#QTDI04,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR03 := DateTimePicker{self,ResourceID{JNEC_DATR03,_GetInst()}}
oDCDATR03:HyperLabel := HyperLabel{#DATR03,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI03 := SingleLineEdit{self,ResourceID{JNEC_QTDI03,_GetInst()}}
oDCQTDI03:FieldSpec := PADRAO_NUM_12{}
oDCQTDI03:HyperLabel := HyperLabel{#QTDI03,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR02 := DateTimePicker{self,ResourceID{JNEC_DATR02,_GetInst()}}
oDCDATR02:HyperLabel := HyperLabel{#DATR02,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI02 := SingleLineEdit{self,ResourceID{JNEC_QTDI02,_GetInst()}}
oDCQTDI02:FieldSpec := PADRAO_NUM_12{}
oDCQTDI02:HyperLabel := HyperLabel{#QTDI02,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATR01 := DateTimePicker{self,ResourceID{JNEC_DATR01,_GetInst()}}
oDCDATR01:HyperLabel := HyperLabel{#DATR01,NULL_STRING,NULL_STRING,NULL_STRING}

oDCQTDI01 := SingleLineEdit{self,ResourceID{JNEC_QTDI01,_GetInst()}}
oDCQTDI01:FieldSpec := PADRAO_NUM_12{}
oDCQTDI01:HyperLabel := HyperLabel{#QTDI01,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCFixedText13 := FixedText{self,ResourceID{JNEC_FIXEDTEXT13,_GetInst()}}
oDCFixedText13:HyperLabel := HyperLabel{#FixedText13,"20",NULL_STRING,NULL_STRING}

oDCFixedText14 := FixedText{self,ResourceID{JNEC_FIXEDTEXT14,_GetInst()}}
oDCFixedText14:HyperLabel := HyperLabel{#FixedText14,"19",NULL_STRING,NULL_STRING}

oDCFixedText15 := FixedText{self,ResourceID{JNEC_FIXEDTEXT15,_GetInst()}}
oDCFixedText15:HyperLabel := HyperLabel{#FixedText15,"18",NULL_STRING,NULL_STRING}

oDCFixedText16 := FixedText{self,ResourceID{JNEC_FIXEDTEXT16,_GetInst()}}
oDCFixedText16:HyperLabel := HyperLabel{#FixedText16,"17",NULL_STRING,NULL_STRING}

oDCFixedText17 := FixedText{self,ResourceID{JNEC_FIXEDTEXT17,_GetInst()}}
oDCFixedText17:HyperLabel := HyperLabel{#FixedText17,"16",NULL_STRING,NULL_STRING}

oDCFixedText18 := FixedText{self,ResourceID{JNEC_FIXEDTEXT18,_GetInst()}}
oDCFixedText18:HyperLabel := HyperLabel{#FixedText18,"15",NULL_STRING,NULL_STRING}

oDCFixedText19 := FixedText{self,ResourceID{JNEC_FIXEDTEXT19,_GetInst()}}
oDCFixedText19:HyperLabel := HyperLabel{#FixedText19,"14",NULL_STRING,NULL_STRING}

oDCFixedText20 := FixedText{self,ResourceID{JNEC_FIXEDTEXT20,_GetInst()}}
oDCFixedText20:HyperLabel := HyperLabel{#FixedText20,"13",NULL_STRING,NULL_STRING}

oDCFixedText21 := FixedText{self,ResourceID{JNEC_FIXEDTEXT21,_GetInst()}}
oDCFixedText21:HyperLabel := HyperLabel{#FixedText21,"12",NULL_STRING,NULL_STRING}

oDCFixedText22 := FixedText{self,ResourceID{JNEC_FIXEDTEXT22,_GetInst()}}
oDCFixedText22:HyperLabel := HyperLabel{#FixedText22,"11",NULL_STRING,NULL_STRING}

oDCFixedText12 := FixedText{self,ResourceID{JNEC_FIXEDTEXT12,_GetInst()}}
oDCFixedText12:HyperLabel := HyperLabel{#FixedText12,"10",NULL_STRING,NULL_STRING}

oDCFixedText11 := FixedText{self,ResourceID{JNEC_FIXEDTEXT11,_GetInst()}}
oDCFixedText11:HyperLabel := HyperLabel{#FixedText11,"09",NULL_STRING,NULL_STRING}

oDCFixedText10 := FixedText{self,ResourceID{JNEC_FIXEDTEXT10,_GetInst()}}
oDCFixedText10:HyperLabel := HyperLabel{#FixedText10,"08",NULL_STRING,NULL_STRING}

oDCFixedText9 := FixedText{self,ResourceID{JNEC_FIXEDTEXT9,_GetInst()}}
oDCFixedText9:HyperLabel := HyperLabel{#FixedText9,"07",NULL_STRING,NULL_STRING}

oDCFixedText8 := FixedText{self,ResourceID{JNEC_FIXEDTEXT8,_GetInst()}}
oDCFixedText8:HyperLabel := HyperLabel{#FixedText8,"06",NULL_STRING,NULL_STRING}

oDCFixedText7 := FixedText{self,ResourceID{JNEC_FIXEDTEXT7,_GetInst()}}
oDCFixedText7:HyperLabel := HyperLabel{#FixedText7,"05",NULL_STRING,NULL_STRING}

oDCFixedText6 := FixedText{self,ResourceID{JNEC_FIXEDTEXT6,_GetInst()}}
oDCFixedText6:HyperLabel := HyperLabel{#FixedText6,"04",NULL_STRING,NULL_STRING}

oDCFixedText5 := FixedText{self,ResourceID{JNEC_FIXEDTEXT5,_GetInst()}}
oDCFixedText5:HyperLabel := HyperLabel{#FixedText5,"03",NULL_STRING,NULL_STRING}

oDCFixedText4 := FixedText{self,ResourceID{JNEC_FIXEDTEXT4,_GetInst()}}
oDCFixedText4:HyperLabel := HyperLabel{#FixedText4,"02",NULL_STRING,NULL_STRING}

oDCFixedText3 := FixedText{self,ResourceID{JNEC_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"01",NULL_STRING,NULL_STRING}

oDCTIPOENT := SingleLineEdit{self,ResourceID{JNEC_TIPOENT,_GetInst()}}
oDCTIPOENT:FieldSpec := PADRAO_CHAR_01{}
oDCTIPOENT:HyperLabel := HyperLabel{#TIPOENT,"Tipoent:",NULL_STRING,"PRNECT_TIPOENT"}

oDCCODCOMP := SingleLineEdit{self,ResourceID{JNEC_CODCOMP,_GetInst()}}
oDCCODCOMP:FieldSpec := PADRAO_CHAR_24{}
oDCCODCOMP:HyperLabel := HyperLabel{#CODCOMP,"Codcomp:",NULL_STRING,"PRNECT_CODCOMP"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jnec,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   	    FabCenterWindow( SELF )
 RETURN SELF

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


METHOD Timer() 
   SELF:SERVER:COMMIT()


access TIPOENT() 
return self:FieldGet(#TIPOENT)


assign TIPOENT(uValue) 
self:FieldPut(#TIPOENT, uValue)
return TIPOENT := uValue


END CLASS
