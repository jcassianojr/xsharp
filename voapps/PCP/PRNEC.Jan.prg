#region DEFINES
STATIC DEFINE JPRNEC_BUSCACOD := 191 
STATIC DEFINE JPRNEC_CODIGO := 107 
STATIC DEFINE JPRNEC_DATA01 := 112 
STATIC DEFINE JPRNEC_DATA02 := 118 
STATIC DEFINE JPRNEC_DATA03 := 122 
STATIC DEFINE JPRNEC_DATA04 := 126 
STATIC DEFINE JPRNEC_DATA05 := 130 
STATIC DEFINE JPRNEC_DATA06 := 134 
STATIC DEFINE JPRNEC_DATA07 := 138 
STATIC DEFINE JPRNEC_DATA08 := 142 
STATIC DEFINE JPRNEC_DATA09 := 146 
STATIC DEFINE JPRNEC_DATA10 := 150 
STATIC DEFINE JPRNEC_DATA11 := 154 
STATIC DEFINE JPRNEC_DATA12 := 158 
STATIC DEFINE JPRNEC_DATA13 := 162 
STATIC DEFINE JPRNEC_DATA14 := 166 
STATIC DEFINE JPRNEC_DATA15 := 170 
STATIC DEFINE JPRNEC_DATA16 := 174 
STATIC DEFINE JPRNEC_DATA17 := 178 
STATIC DEFINE JPRNEC_DATA18 := 182 
STATIC DEFINE JPRNEC_DATA19 := 186 
STATIC DEFINE JPRNEC_DATA20 := 190 
STATIC DEFINE JPRNEC_EDITAR := 194 
STATIC DEFINE JPRNEC_FOTO := 199 
STATIC DEFINE JPRNEC_JPRNECI := 192 
STATIC DEFINE JPRNEC_NOME := 108 
STATIC DEFINE JPRNEC_OP := 114 
STATIC DEFINE JPRNEC_PROGRAMA := 195 
STATIC DEFINE JPRNEC_QTDE01 := 109 
STATIC DEFINE JPRNEC_QTDE02 := 117 
STATIC DEFINE JPRNEC_QTDE03 := 121 
STATIC DEFINE JPRNEC_QTDE04 := 125 
STATIC DEFINE JPRNEC_QTDE05 := 129 
STATIC DEFINE JPRNEC_QTDE06 := 133 
STATIC DEFINE JPRNEC_QTDE07 := 137 
STATIC DEFINE JPRNEC_QTDE08 := 141 
STATIC DEFINE JPRNEC_QTDE09 := 145 
STATIC DEFINE JPRNEC_QTDE10 := 149 
STATIC DEFINE JPRNEC_QTDE11 := 153 
STATIC DEFINE JPRNEC_QTDE12 := 157 
STATIC DEFINE JPRNEC_QTDE13 := 161 
STATIC DEFINE JPRNEC_QTDE14 := 165 
STATIC DEFINE JPRNEC_QTDE15 := 169 
STATIC DEFINE JPRNEC_QTDE16 := 173 
STATIC DEFINE JPRNEC_QTDE17 := 177 
STATIC DEFINE JPRNEC_QTDE18 := 181 
STATIC DEFINE JPRNEC_QTDE19 := 185 
STATIC DEFINE JPRNEC_QTDE20 := 189 
STATIC DEFINE JPRNEC_QTDI01 := 111 
STATIC DEFINE JPRNEC_QTDI02 := 116 
STATIC DEFINE JPRNEC_QTDI03 := 120 
STATIC DEFINE JPRNEC_QTDI04 := 124 
STATIC DEFINE JPRNEC_QTDI05 := 128 
STATIC DEFINE JPRNEC_QTDI06 := 132 
STATIC DEFINE JPRNEC_QTDI07 := 136 
STATIC DEFINE JPRNEC_QTDI08 := 140 
STATIC DEFINE JPRNEC_QTDI09 := 144 
STATIC DEFINE JPRNEC_QTDI10 := 148 
STATIC DEFINE JPRNEC_QTDI11 := 152 
STATIC DEFINE JPRNEC_QTDI12 := 156 
STATIC DEFINE JPRNEC_QTDI13 := 160 
STATIC DEFINE JPRNEC_QTDI14 := 164 
STATIC DEFINE JPRNEC_QTDI15 := 168 
STATIC DEFINE JPRNEC_QTDI16 := 172 
STATIC DEFINE JPRNEC_QTDI17 := 176 
STATIC DEFINE JPRNEC_QTDI18 := 180 
STATIC DEFINE JPRNEC_QTDI19 := 184 
STATIC DEFINE JPRNEC_QTDI20 := 188 
STATIC DEFINE JPRNEC_QTDR01 := 110 
STATIC DEFINE JPRNEC_QTDR02 := 115 
STATIC DEFINE JPRNEC_QTDR03 := 119 
STATIC DEFINE JPRNEC_QTDR04 := 123 
STATIC DEFINE JPRNEC_QTDR05 := 127 
STATIC DEFINE JPRNEC_QTDR06 := 131 
STATIC DEFINE JPRNEC_QTDR07 := 135 
STATIC DEFINE JPRNEC_QTDR08 := 139 
STATIC DEFINE JPRNEC_QTDR09 := 143 
STATIC DEFINE JPRNEC_QTDR10 := 147 
STATIC DEFINE JPRNEC_QTDR11 := 151 
STATIC DEFINE JPRNEC_QTDR12 := 155 
STATIC DEFINE JPRNEC_QTDR13 := 159 
STATIC DEFINE JPRNEC_QTDR14 := 163 
STATIC DEFINE JPRNEC_QTDR15 := 167 
STATIC DEFINE JPRNEC_QTDR16 := 171 
STATIC DEFINE JPRNEC_QTDR17 := 175 
STATIC DEFINE JPRNEC_QTDR18 := 179 
STATIC DEFINE JPRNEC_QTDR19 := 183 
STATIC DEFINE JPRNEC_QTDR20 := 187 
STATIC DEFINE JPRNEC_QTDSAL := 198 
STATIC DEFINE JPRNEC_SC_CODIGO := 100 
STATIC DEFINE JPRNEC_SC_DATA01 := 106 
STATIC DEFINE JPRNEC_SC_DESTINO2 := 200 
STATIC DEFINE JPRNEC_SC_NOME := 101 
STATIC DEFINE JPRNEC_SC_OP := 113 
STATIC DEFINE JPRNEC_SC_OP1 := 197 
STATIC DEFINE JPRNEC_SC_QTDE01 := 103 
STATIC DEFINE JPRNEC_SC_QTDI01 := 105 
STATIC DEFINE JPRNEC_SC_QTDR01 := 104 
STATIC DEFINE JPRNEC_SC_QTDSAL := 102 
STATIC DEFINE JPRNEC_TABULAR := 193 
STATIC DEFINE JPRNEC_TIPOPRG := 196 
#endregion

PARTIAL class JPRNEC inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBOP as DataColumn
	PROTECT oDBQTDSAL as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_QTDSAL as FIXEDTEXT
	protect oDCSC_QTDE01 as FIXEDTEXT
	protect oDCSC_QTDR01 as FIXEDTEXT
	protect oDCSC_QTDI01 as FIXEDTEXT
	protect oDCSC_DATA01 as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCQTDE01 as SINGLELINEEDIT
	protect oDCQTDR01 as SINGLELINEEDIT
	protect oDCQTDI01 as SINGLELINEEDIT
	protect oDCDATA01 as SINGLELINEEDIT
	protect oDCSC_OP as FIXEDTEXT
	protect oDCOP as SINGLELINEEDIT
	protect oDCQTDR02 as SINGLELINEEDIT
	protect oDCQTDI02 as SINGLELINEEDIT
	protect oDCQTDE02 as SINGLELINEEDIT
	protect oDCDATA02 as SINGLELINEEDIT
	protect oDCQTDR03 as SINGLELINEEDIT
	protect oDCQTDI03 as SINGLELINEEDIT
	protect oDCQTDE03 as SINGLELINEEDIT
	protect oDCDATA03 as SINGLELINEEDIT
	protect oDCQTDR04 as SINGLELINEEDIT
	protect oDCQTDI04 as SINGLELINEEDIT
	protect oDCQTDE04 as SINGLELINEEDIT
	protect oDCDATA04 as SINGLELINEEDIT
	protect oDCQTDR05 as SINGLELINEEDIT
	protect oDCQTDI05 as SINGLELINEEDIT
	protect oDCQTDE05 as SINGLELINEEDIT
	protect oDCDATA05 as SINGLELINEEDIT
	protect oDCQTDR06 as SINGLELINEEDIT
	protect oDCQTDI06 as SINGLELINEEDIT
	protect oDCQTDE06 as SINGLELINEEDIT
	protect oDCDATA06 as SINGLELINEEDIT
	protect oDCQTDR07 as SINGLELINEEDIT
	protect oDCQTDI07 as SINGLELINEEDIT
	protect oDCQTDE07 as SINGLELINEEDIT
	protect oDCDATA07 as SINGLELINEEDIT
	protect oDCQTDR08 as SINGLELINEEDIT
	protect oDCQTDI08 as SINGLELINEEDIT
	protect oDCQTDE08 as SINGLELINEEDIT
	protect oDCDATA08 as SINGLELINEEDIT
	protect oDCQTDR09 as SINGLELINEEDIT
	protect oDCQTDI09 as SINGLELINEEDIT
	protect oDCQTDE09 as SINGLELINEEDIT
	protect oDCDATA09 as SINGLELINEEDIT
	protect oDCQTDR10 as SINGLELINEEDIT
	protect oDCQTDI10 as SINGLELINEEDIT
	protect oDCQTDE10 as SINGLELINEEDIT
	protect oDCDATA10 as SINGLELINEEDIT
	protect oDCQTDR11 as SINGLELINEEDIT
	protect oDCQTDI11 as SINGLELINEEDIT
	protect oDCQTDE11 as SINGLELINEEDIT
	protect oDCDATA11 as SINGLELINEEDIT
	protect oDCQTDR12 as SINGLELINEEDIT
	protect oDCQTDI12 as SINGLELINEEDIT
	protect oDCQTDE12 as SINGLELINEEDIT
	protect oDCDATA12 as SINGLELINEEDIT
	protect oDCQTDR13 as SINGLELINEEDIT
	protect oDCQTDI13 as SINGLELINEEDIT
	protect oDCQTDE13 as SINGLELINEEDIT
	protect oDCDATA13 as SINGLELINEEDIT
	protect oDCQTDR14 as SINGLELINEEDIT
	protect oDCQTDI14 as SINGLELINEEDIT
	protect oDCQTDE14 as SINGLELINEEDIT
	protect oDCDATA14 as SINGLELINEEDIT
	protect oDCQTDR15 as SINGLELINEEDIT
	protect oDCQTDI15 as SINGLELINEEDIT
	protect oDCQTDE15 as SINGLELINEEDIT
	protect oDCDATA15 as SINGLELINEEDIT
	protect oDCQTDR16 as SINGLELINEEDIT
	protect oDCQTDI16 as SINGLELINEEDIT
	protect oDCQTDE16 as SINGLELINEEDIT
	protect oDCDATA16 as SINGLELINEEDIT
	protect oDCQTDR17 as SINGLELINEEDIT
	protect oDCQTDI17 as SINGLELINEEDIT
	protect oDCQTDE17 as SINGLELINEEDIT
	protect oDCDATA17 as SINGLELINEEDIT
	protect oDCQTDR18 as SINGLELINEEDIT
	protect oDCQTDI18 as SINGLELINEEDIT
	protect oDCQTDE18 as SINGLELINEEDIT
	protect oDCDATA18 as SINGLELINEEDIT
	protect oDCQTDR19 as SINGLELINEEDIT
	protect oDCQTDI19 as SINGLELINEEDIT
	protect oDCQTDE19 as SINGLELINEEDIT
	protect oDCDATA19 as SINGLELINEEDIT
	protect oDCQTDR20 as SINGLELINEEDIT
	protect oDCQTDI20 as SINGLELINEEDIT
	protect oDCQTDE20 as SINGLELINEEDIT
	protect oDCDATA20 as SINGLELINEEDIT
	protect oCCbuscacod as PUSHBUTTON
	protect oCCTabular as PUSHBUTTON
	protect oCCEditar as PUSHBUTTON
	protect oCCPrograma as PUSHBUTTON
	protect oDCTIPOPRG as SINGLELINEEDIT
	protect oDCSC_OP1 as FIXEDTEXT
	protect oDCQTDSAL as SINGLELINEEDIT
	protect oCCfoto as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
// 	instance CODIGO 
// 	instance NOME 
// 	instance QTDE01 
// 	instance QTDR01 
// 	instance QTDI01 
// 	instance DATA01 
// 	instance OP 
// 	instance QTDR02 
// 	instance QTDI02 
// 	instance QTDE02 
// 	instance DATA02 
// 	instance QTDR03 
// 	instance QTDI03 
// 	instance QTDE03 
// 	instance DATA03 
// 	instance QTDR04 
// 	instance QTDI04 
// 	instance QTDE04 
// 	instance DATA04 
// 	instance QTDR05 
// 	instance QTDI05 
// 	instance QTDE05 
// 	instance DATA05 
// 	instance QTDR06 
// 	instance QTDI06 
// 	instance QTDE06 
// 	instance DATA06 
// 	instance QTDR07 
// 	instance QTDI07 
// 	instance QTDE07 
// 	instance DATA07 
// 	instance QTDR08 
// 	instance QTDI08 
// 	instance QTDE08 
// 	instance DATA08 
// 	instance QTDR09 
// 	instance QTDI09 
// 	instance QTDE09 
// 	instance DATA09 
// 	instance QTDR10 
// 	instance QTDI10 
// 	instance QTDE10 
// 	instance DATA10 
// 	instance QTDR11 
// 	instance QTDI11 
// 	instance QTDE11 
// 	instance DATA11 
// 	instance QTDR12 
// 	instance QTDI12 
// 	instance QTDE12 
// 	instance DATA12 
// 	instance QTDR13 
// 	instance QTDI13 
// 	instance QTDE13 
// 	instance DATA13 
// 	instance QTDR14 
// 	instance QTDI14 
// 	instance QTDE14 
// 	instance DATA14 
// 	instance QTDR15 
// 	instance QTDI15 
// 	instance QTDE15 
// 	instance DATA15 
// 	instance QTDR16 
// 	instance QTDI16 
// 	instance QTDE16 
// 	instance DATA16 
// 	instance QTDR17 
// 	instance QTDI17 
// 	instance QTDE17 
// 	instance DATA17 
// 	instance QTDR18 
// 	instance QTDI18 
// 	instance QTDE18 
// 	instance DATA18 
// 	instance QTDR19 
// 	instance QTDI19 
// 	instance QTDE19 
// 	instance DATA19 
// 	instance QTDR20 
// 	instance QTDI20 
// 	instance QTDE20 
// 	instance DATA20 
// 	instance TIPOPRG 
// 	instance QTDSAL 
	protect oSFJPRNECI as JPRNECI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DATA01() 
return self:FieldGet(#DATA01)


assign DATA01(uValue) 
self:FieldPut(#DATA01, uValue)
return DATA01 := uValue


access DATA02() 
return self:FieldGet(#DATA02)


assign DATA02(uValue) 
self:FieldPut(#DATA02, uValue)
return DATA02 := uValue


access DATA03() 
return self:FieldGet(#DATA03)


assign DATA03(uValue) 
self:FieldPut(#DATA03, uValue)
return DATA03 := uValue


access DATA04() 
return self:FieldGet(#DATA04)


assign DATA04(uValue) 
self:FieldPut(#DATA04, uValue)
return DATA04 := uValue


access DATA05() 
return self:FieldGet(#DATA05)


assign DATA05(uValue) 
self:FieldPut(#DATA05, uValue)
return DATA05 := uValue


access DATA06() 
return self:FieldGet(#DATA06)


assign DATA06(uValue) 
self:FieldPut(#DATA06, uValue)
return DATA06 := uValue


access DATA07() 
return self:FieldGet(#DATA07)


assign DATA07(uValue) 
self:FieldPut(#DATA07, uValue)
return DATA07 := uValue


access DATA08() 
return self:FieldGet(#DATA08)


assign DATA08(uValue) 
self:FieldPut(#DATA08, uValue)
return DATA08 := uValue


access DATA09() 
return self:FieldGet(#DATA09)


assign DATA09(uValue) 
self:FieldPut(#DATA09, uValue)
return DATA09 := uValue


access DATA10() 
return self:FieldGet(#DATA10)


assign DATA10(uValue) 
self:FieldPut(#DATA10, uValue)
return DATA10 := uValue


access DATA11() 
return self:FieldGet(#DATA11)


assign DATA11(uValue) 
self:FieldPut(#DATA11, uValue)
return DATA11 := uValue


access DATA12() 
return self:FieldGet(#DATA12)


assign DATA12(uValue) 
self:FieldPut(#DATA12, uValue)
return DATA12 := uValue


access DATA13() 
return self:FieldGet(#DATA13)


assign DATA13(uValue) 
self:FieldPut(#DATA13, uValue)
return DATA13 := uValue


access DATA14() 
return self:FieldGet(#DATA14)


assign DATA14(uValue) 
self:FieldPut(#DATA14, uValue)
return DATA14 := uValue


access DATA15() 
return self:FieldGet(#DATA15)


assign DATA15(uValue) 
self:FieldPut(#DATA15, uValue)
return DATA15 := uValue


access DATA16() 
return self:FieldGet(#DATA16)


assign DATA16(uValue) 
self:FieldPut(#DATA16, uValue)
return DATA16 := uValue


access DATA17() 
return self:FieldGet(#DATA17)


assign DATA17(uValue) 
self:FieldPut(#DATA17, uValue)
return DATA17 := uValue


access DATA18() 
return self:FieldGet(#DATA18)


assign DATA18(uValue) 
self:FieldPut(#DATA18, uValue)
return DATA18 := uValue


access DATA19() 
return self:FieldGet(#DATA19)


assign DATA19(uValue) 
self:FieldPut(#DATA19, uValue)
return DATA19 := uValue


access DATA20() 
return self:FieldGet(#DATA20)


assign DATA20(uValue) 
self:FieldPut(#DATA20, uValue)
return DATA20 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPRNEC",_GetInst()},iCtlID)

oDCSC_CODIGO := FixedText{self,ResourceID{JPRNEC_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JPRNEC_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_QTDSAL := FixedText{self,ResourceID{JPRNEC_SC_QTDSAL,_GetInst()}}
oDCSC_QTDSAL:HyperLabel := HyperLabel{#SC_QTDSAL,"Estoque",NULL_STRING,NULL_STRING}

oDCSC_QTDE01 := FixedText{self,ResourceID{JPRNEC_SC_QTDE01,_GetInst()}}
oDCSC_QTDE01:HyperLabel := HyperLabel{#SC_QTDE01,"Qtde Inicial",NULL_STRING,NULL_STRING}

oDCSC_QTDR01 := FixedText{self,ResourceID{JPRNEC_SC_QTDR01,_GetInst()}}
oDCSC_QTDR01:HyperLabel := HyperLabel{#SC_QTDR01,"Qtde-Estq",NULL_STRING,NULL_STRING}

oDCSC_QTDI01 := FixedText{self,ResourceID{JPRNEC_SC_QTDI01,_GetInst()}}
oDCSC_QTDI01:HyperLabel := HyperLabel{#SC_QTDI01,"Qtde Produzir",NULL_STRING,NULL_STRING}

oDCSC_DATA01 := FixedText{self,ResourceID{JPRNEC_SC_DATA01,_GetInst()}}
oDCSC_DATA01:HyperLabel := HyperLabel{#SC_DATA01,"Data",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JPRNEC_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"PRNEC_CODIGO"}

oDCNOME := SingleLineEdit{self,ResourceID{JPRNEC_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"PRNEC_NOME"}

oDCQTDE01 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE01,_GetInst()}}
oDCQTDE01:FieldSpec := PADRAO_NUM_06{}
oDCQTDE01:HyperLabel := HyperLabel{#QTDE01,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDR01 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR01,_GetInst()}}
oDCQTDR01:FieldSpec := PADRAO_NUM_06{}
oDCQTDR01:HyperLabel := HyperLabel{#QTDR01,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI01 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI01,_GetInst()}}
oDCQTDI01:FieldSpec := PADRAO_NUM_06{}
oDCQTDI01:HyperLabel := HyperLabel{#QTDI01,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCDATA01 := SingleLineEdit{self,ResourceID{JPRNEC_DATA01,_GetInst()}}
oDCDATA01:FieldSpec := DATE_FIELD{}
oDCDATA01:HyperLabel := HyperLabel{#DATA01,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCSC_OP := FixedText{self,ResourceID{JPRNEC_SC_OP,_GetInst()}}
oDCSC_OP:HyperLabel := HyperLabel{#SC_OP,"Op:",NULL_STRING,NULL_STRING}

oDCOP := SingleLineEdit{self,ResourceID{JPRNEC_OP,_GetInst()}}
oDCOP:FieldSpec := PADRAO_NUM_08{}
oDCOP:HyperLabel := HyperLabel{#OP,"Op:",NULL_STRING,"PRNEC_OP"}

oDCQTDR02 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR02,_GetInst()}}
oDCQTDR02:FieldSpec := PADRAO_NUM_06{}
oDCQTDR02:HyperLabel := HyperLabel{#QTDR02,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI02 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI02,_GetInst()}}
oDCQTDI02:FieldSpec := PADRAO_NUM_06{}
oDCQTDI02:HyperLabel := HyperLabel{#QTDI02,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE02 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE02,_GetInst()}}
oDCQTDE02:FieldSpec := PADRAO_NUM_06{}
oDCQTDE02:HyperLabel := HyperLabel{#QTDE02,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA02 := SingleLineEdit{self,ResourceID{JPRNEC_DATA02,_GetInst()}}
oDCDATA02:FieldSpec := DATE_FIELD{}
oDCDATA02:HyperLabel := HyperLabel{#DATA02,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR03 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR03,_GetInst()}}
oDCQTDR03:FieldSpec := PADRAO_NUM_06{}
oDCQTDR03:HyperLabel := HyperLabel{#QTDR03,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI03 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI03,_GetInst()}}
oDCQTDI03:FieldSpec := PADRAO_NUM_06{}
oDCQTDI03:HyperLabel := HyperLabel{#QTDI03,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE03 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE03,_GetInst()}}
oDCQTDE03:FieldSpec := PADRAO_NUM_06{}
oDCQTDE03:HyperLabel := HyperLabel{#QTDE03,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA03 := SingleLineEdit{self,ResourceID{JPRNEC_DATA03,_GetInst()}}
oDCDATA03:FieldSpec := DATE_FIELD{}
oDCDATA03:HyperLabel := HyperLabel{#DATA03,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR04 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR04,_GetInst()}}
oDCQTDR04:FieldSpec := PADRAO_NUM_06{}
oDCQTDR04:HyperLabel := HyperLabel{#QTDR04,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI04 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI04,_GetInst()}}
oDCQTDI04:FieldSpec := PADRAO_NUM_06{}
oDCQTDI04:HyperLabel := HyperLabel{#QTDI04,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE04 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE04,_GetInst()}}
oDCQTDE04:FieldSpec := PADRAO_NUM_06{}
oDCQTDE04:HyperLabel := HyperLabel{#QTDE04,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA04 := SingleLineEdit{self,ResourceID{JPRNEC_DATA04,_GetInst()}}
oDCDATA04:FieldSpec := DATE_FIELD{}
oDCDATA04:HyperLabel := HyperLabel{#DATA04,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR05 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR05,_GetInst()}}
oDCQTDR05:HyperLabel := HyperLabel{#QTDR05,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}
oDCQTDR05:FieldSpec := PADRAO_NUM_06{}

oDCQTDI05 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI05,_GetInst()}}
oDCQTDI05:FieldSpec := PADRAO_NUM_06{}
oDCQTDI05:HyperLabel := HyperLabel{#QTDI05,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE05 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE05,_GetInst()}}
oDCQTDE05:FieldSpec := PADRAO_NUM_06{}
oDCQTDE05:HyperLabel := HyperLabel{#QTDE05,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA05 := SingleLineEdit{self,ResourceID{JPRNEC_DATA05,_GetInst()}}
oDCDATA05:FieldSpec := DATE_FIELD{}
oDCDATA05:HyperLabel := HyperLabel{#DATA05,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR06 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR06,_GetInst()}}
oDCQTDR06:FieldSpec := PADRAO_NUM_06{}
oDCQTDR06:HyperLabel := HyperLabel{#QTDR06,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI06 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI06,_GetInst()}}
oDCQTDI06:FieldSpec := PADRAO_NUM_06{}
oDCQTDI06:HyperLabel := HyperLabel{#QTDI06,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE06 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE06,_GetInst()}}
oDCQTDE06:FieldSpec := PADRAO_NUM_06{}
oDCQTDE06:HyperLabel := HyperLabel{#QTDE06,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA06 := SingleLineEdit{self,ResourceID{JPRNEC_DATA06,_GetInst()}}
oDCDATA06:FieldSpec := DATE_FIELD{}
oDCDATA06:HyperLabel := HyperLabel{#DATA06,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR07 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR07,_GetInst()}}
oDCQTDR07:FieldSpec := PADRAO_NUM_06{}
oDCQTDR07:HyperLabel := HyperLabel{#QTDR07,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI07 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI07,_GetInst()}}
oDCQTDI07:FieldSpec := PADRAO_NUM_06{}
oDCQTDI07:HyperLabel := HyperLabel{#QTDI07,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE07 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE07,_GetInst()}}
oDCQTDE07:FieldSpec := PADRAO_NUM_06{}
oDCQTDE07:HyperLabel := HyperLabel{#QTDE07,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA07 := SingleLineEdit{self,ResourceID{JPRNEC_DATA07,_GetInst()}}
oDCDATA07:FieldSpec := DATE_FIELD{}
oDCDATA07:HyperLabel := HyperLabel{#DATA07,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR08 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR08,_GetInst()}}
oDCQTDR08:FieldSpec := PADRAO_NUM_06{}
oDCQTDR08:HyperLabel := HyperLabel{#QTDR08,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI08 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI08,_GetInst()}}
oDCQTDI08:FieldSpec := PADRAO_NUM_06{}
oDCQTDI08:HyperLabel := HyperLabel{#QTDI08,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE08 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE08,_GetInst()}}
oDCQTDE08:FieldSpec := PADRAO_NUM_06{}
oDCQTDE08:HyperLabel := HyperLabel{#QTDE08,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA08 := SingleLineEdit{self,ResourceID{JPRNEC_DATA08,_GetInst()}}
oDCDATA08:FieldSpec := DATE_FIELD{}
oDCDATA08:HyperLabel := HyperLabel{#DATA08,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR09 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR09,_GetInst()}}
oDCQTDR09:FieldSpec := PADRAO_NUM_06{}
oDCQTDR09:HyperLabel := HyperLabel{#QTDR09,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI09 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI09,_GetInst()}}
oDCQTDI09:FieldSpec := PADRAO_NUM_06{}
oDCQTDI09:HyperLabel := HyperLabel{#QTDI09,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE09 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE09,_GetInst()}}
oDCQTDE09:FieldSpec := PADRAO_NUM_06{}
oDCQTDE09:HyperLabel := HyperLabel{#QTDE09,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA09 := SingleLineEdit{self,ResourceID{JPRNEC_DATA09,_GetInst()}}
oDCDATA09:FieldSpec := DATE_FIELD{}
oDCDATA09:HyperLabel := HyperLabel{#DATA09,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR10 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR10,_GetInst()}}
oDCQTDR10:FieldSpec := PADRAO_NUM_06{}
oDCQTDR10:HyperLabel := HyperLabel{#QTDR10,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI10 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI10,_GetInst()}}
oDCQTDI10:FieldSpec := PADRAO_NUM_06{}
oDCQTDI10:HyperLabel := HyperLabel{#QTDI10,"Data01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE10 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE10,_GetInst()}}
oDCQTDE10:FieldSpec := PADRAO_NUM_06{}
oDCQTDE10:HyperLabel := HyperLabel{#QTDE10,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA10 := SingleLineEdit{self,ResourceID{JPRNEC_DATA10,_GetInst()}}
oDCDATA10:FieldSpec := DATE_FIELD{}
oDCDATA10:HyperLabel := HyperLabel{#DATA10,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR11 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR11,_GetInst()}}
oDCQTDR11:FieldSpec := PADRAO_NUM_06{}
oDCQTDR11:HyperLabel := HyperLabel{#QTDR11,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI11 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI11,_GetInst()}}
oDCQTDI11:FieldSpec := PADRAO_NUM_06{}
oDCQTDI11:HyperLabel := HyperLabel{#QTDI11,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE11 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE11,_GetInst()}}
oDCQTDE11:FieldSpec := PADRAO_NUM_06{}
oDCQTDE11:HyperLabel := HyperLabel{#QTDE11,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA11 := SingleLineEdit{self,ResourceID{JPRNEC_DATA11,_GetInst()}}
oDCDATA11:FieldSpec := DATE_FIELD{}
oDCDATA11:HyperLabel := HyperLabel{#DATA11,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR12 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR12,_GetInst()}}
oDCQTDR12:FieldSpec := PADRAO_NUM_06{}
oDCQTDR12:HyperLabel := HyperLabel{#QTDR12,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI12 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI12,_GetInst()}}
oDCQTDI12:FieldSpec := PADRAO_NUM_06{}
oDCQTDI12:HyperLabel := HyperLabel{#QTDI12,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE12 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE12,_GetInst()}}
oDCQTDE12:FieldSpec := PADRAO_NUM_06{}
oDCQTDE12:HyperLabel := HyperLabel{#QTDE12,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA12 := SingleLineEdit{self,ResourceID{JPRNEC_DATA12,_GetInst()}}
oDCDATA12:FieldSpec := DATE_FIELD{}
oDCDATA12:HyperLabel := HyperLabel{#DATA12,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR13 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR13,_GetInst()}}
oDCQTDR13:FieldSpec := PADRAO_NUM_06{}
oDCQTDR13:HyperLabel := HyperLabel{#QTDR13,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI13 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI13,_GetInst()}}
oDCQTDI13:FieldSpec := PADRAO_NUM_06{}
oDCQTDI13:HyperLabel := HyperLabel{#QTDI13,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE13 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE13,_GetInst()}}
oDCQTDE13:FieldSpec := PADRAO_NUM_06{}
oDCQTDE13:HyperLabel := HyperLabel{#QTDE13,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA13 := SingleLineEdit{self,ResourceID{JPRNEC_DATA13,_GetInst()}}
oDCDATA13:FieldSpec := DATE_FIELD{}
oDCDATA13:HyperLabel := HyperLabel{#DATA13,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR14 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR14,_GetInst()}}
oDCQTDR14:FieldSpec := PADRAO_NUM_06{}
oDCQTDR14:HyperLabel := HyperLabel{#QTDR14,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI14 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI14,_GetInst()}}
oDCQTDI14:FieldSpec := PADRAO_NUM_06{}
oDCQTDI14:HyperLabel := HyperLabel{#QTDI14,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE14 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE14,_GetInst()}}
oDCQTDE14:FieldSpec := PADRAO_NUM_06{}
oDCQTDE14:HyperLabel := HyperLabel{#QTDE14,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA14 := SingleLineEdit{self,ResourceID{JPRNEC_DATA14,_GetInst()}}
oDCDATA14:FieldSpec := DATE_FIELD{}
oDCDATA14:HyperLabel := HyperLabel{#DATA14,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR15 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR15,_GetInst()}}
oDCQTDR15:FieldSpec := PADRAO_NUM_06{}
oDCQTDR15:HyperLabel := HyperLabel{#QTDR15,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI15 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI15,_GetInst()}}
oDCQTDI15:FieldSpec := PADRAO_NUM_06{}
oDCQTDI15:HyperLabel := HyperLabel{#QTDI15,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE15 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE15,_GetInst()}}
oDCQTDE15:FieldSpec := PADRAO_NUM_06{}
oDCQTDE15:HyperLabel := HyperLabel{#QTDE15,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA15 := SingleLineEdit{self,ResourceID{JPRNEC_DATA15,_GetInst()}}
oDCDATA15:FieldSpec := DATE_FIELD{}
oDCDATA15:HyperLabel := HyperLabel{#DATA15,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR16 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR16,_GetInst()}}
oDCQTDR16:FieldSpec := PADRAO_NUM_06{}
oDCQTDR16:HyperLabel := HyperLabel{#QTDR16,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI16 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI16,_GetInst()}}
oDCQTDI16:FieldSpec := PADRAO_NUM_06{}
oDCQTDI16:HyperLabel := HyperLabel{#QTDI16,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE16 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE16,_GetInst()}}
oDCQTDE16:FieldSpec := PADRAO_NUM_06{}
oDCQTDE16:HyperLabel := HyperLabel{#QTDE16,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA16 := SingleLineEdit{self,ResourceID{JPRNEC_DATA16,_GetInst()}}
oDCDATA16:FieldSpec := DATE_FIELD{}
oDCDATA16:HyperLabel := HyperLabel{#DATA16,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR17 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR17,_GetInst()}}
oDCQTDR17:FieldSpec := PADRAO_NUM_06{}
oDCQTDR17:HyperLabel := HyperLabel{#QTDR17,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI17 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI17,_GetInst()}}
oDCQTDI17:FieldSpec := PADRAO_NUM_06{}
oDCQTDI17:HyperLabel := HyperLabel{#QTDI17,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE17 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE17,_GetInst()}}
oDCQTDE17:FieldSpec := PADRAO_NUM_06{}
oDCQTDE17:HyperLabel := HyperLabel{#QTDE17,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA17 := SingleLineEdit{self,ResourceID{JPRNEC_DATA17,_GetInst()}}
oDCDATA17:FieldSpec := DATE_FIELD{}
oDCDATA17:HyperLabel := HyperLabel{#DATA17,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR18 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR18,_GetInst()}}
oDCQTDR18:FieldSpec := PADRAO_NUM_06{}
oDCQTDR18:HyperLabel := HyperLabel{#QTDR18,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI18 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI18,_GetInst()}}
oDCQTDI18:FieldSpec := PADRAO_NUM_06{}
oDCQTDI18:HyperLabel := HyperLabel{#QTDI18,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE18 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE18,_GetInst()}}
oDCQTDE18:FieldSpec := PADRAO_NUM_06{}
oDCQTDE18:HyperLabel := HyperLabel{#QTDE18,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA18 := SingleLineEdit{self,ResourceID{JPRNEC_DATA18,_GetInst()}}
oDCDATA18:FieldSpec := DATE_FIELD{}
oDCDATA18:HyperLabel := HyperLabel{#DATA18,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR19 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR19,_GetInst()}}
oDCQTDR19:FieldSpec := PADRAO_NUM_06{}
oDCQTDR19:HyperLabel := HyperLabel{#QTDR19,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI19 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI19,_GetInst()}}
oDCQTDI19:FieldSpec := PADRAO_NUM_06{}
oDCQTDI19:HyperLabel := HyperLabel{#QTDI19,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE19 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE19,_GetInst()}}
oDCQTDE19:FieldSpec := PADRAO_NUM_06{}
oDCQTDE19:HyperLabel := HyperLabel{#QTDE19,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA19 := SingleLineEdit{self,ResourceID{JPRNEC_DATA19,_GetInst()}}
oDCDATA19:FieldSpec := DATE_FIELD{}
oDCDATA19:HyperLabel := HyperLabel{#DATA19,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oDCQTDR20 := SingleLineEdit{self,ResourceID{JPRNEC_QTDR20,_GetInst()}}
oDCQTDR20:FieldSpec := PADRAO_NUM_06{}
oDCQTDR20:HyperLabel := HyperLabel{#QTDR20,"Qtdr01:",NULL_STRING,"PRNEC_QTDR01"}

oDCQTDI20 := SingleLineEdit{self,ResourceID{JPRNEC_QTDI20,_GetInst()}}
oDCQTDI20:FieldSpec := PADRAO_NUM_06{}
oDCQTDI20:HyperLabel := HyperLabel{#QTDI20,"Qtdi01:",NULL_STRING,"PRNEC_QTDI01"}

oDCQTDE20 := SingleLineEdit{self,ResourceID{JPRNEC_QTDE20,_GetInst()}}
oDCQTDE20:FieldSpec := PADRAO_NUM_06{}
oDCQTDE20:HyperLabel := HyperLabel{#QTDE20,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCDATA20 := SingleLineEdit{self,ResourceID{JPRNEC_DATA20,_GetInst()}}
oDCDATA20:FieldSpec := DATE_FIELD{}
oDCDATA20:HyperLabel := HyperLabel{#DATA20,"Data01:",NULL_STRING,"PRNEC_DATA01"}

oCCbuscacod := PushButton{self,ResourceID{JPRNEC_BUSCACOD,_GetInst()}}
oCCbuscacod:Image := ico_find{}
oCCbuscacod:HyperLabel := HyperLabel{#buscacod,NULL_STRING,NULL_STRING,NULL_STRING}

oCCTabular := PushButton{self,ResourceID{JPRNEC_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Ver Itens",NULL_STRING,NULL_STRING}

oCCEditar := PushButton{self,ResourceID{JPRNEC_EDITAR,_GetInst()}}
oCCEditar:HyperLabel := HyperLabel{#Editar,"Consulta",NULL_STRING,NULL_STRING}

oCCPrograma := PushButton{self,ResourceID{JPRNEC_PROGRAMA,_GetInst()}}
oCCPrograma:HyperLabel := HyperLabel{#Programa,"Programa",NULL_STRING,NULL_STRING}

oDCTIPOPRG := SingleLineEdit{self,ResourceID{JPRNEC_TIPOPRG,_GetInst()}}
oDCTIPOPRG:FieldSpec := PADRAO_CHAR_01{}
oDCTIPOPRG:HyperLabel := HyperLabel{#TIPOPRG,"Op:",NULL_STRING,"PRNEC_OP"}

oDCSC_OP1 := FixedText{self,ResourceID{JPRNEC_SC_OP1,_GetInst()}}
oDCSC_OP1:HyperLabel := HyperLabel{#SC_OP1,"Tipo",NULL_STRING,NULL_STRING}

oDCQTDSAL := SingleLineEdit{self,ResourceID{JPRNEC_QTDSAL,_GetInst()}}
oDCQTDSAL:FieldSpec := PADRAO_NUM_06{}
oDCQTDSAL:HyperLabel := HyperLabel{#QTDSAL,"Estoque",NULL_STRING,"PRNEC_QTDSAL"}

oCCfoto := PushButton{self,ResourceID{JPRNEC_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JPRNEC_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

self:Caption := "Necessidade MP/Comp "
self:HyperLabel := HyperLabel{#JPRNEC,"Necessidade MP/Comp ",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 22
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_40{}}
oDBNOME:Width := 21
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBOP := DataColumn{PADRAO_NUM_08{}}
oDBOP:Width := 9
oDBOP:HyperLabel := oDCOP:HyperLabel 
oDBOP:Caption := "Op:"
self:Browser:AddColumn(oDBOP)

oDBQTDSAL := DataColumn{PADRAO_NUM_06{}}
oDBQTDSAL:Width := 15
oDBQTDSAL:HyperLabel := oDCQTDSAL:HyperLabel 
oDBQTDSAL:Caption := "Estoque"
self:Browser:AddColumn(oDBQTDSAL)


self:ViewAs(#FormView)

oSFJPRNECI := JPRNECI{self,JPRNEC_JPRNECI}
oSFJPRNECI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access OP() 
return self:FieldGet(#OP)


assign OP(uValue) 
self:FieldPut(#OP, uValue)
return OP := uValue


access QTDE01() 
return self:FieldGet(#QTDE01)


assign QTDE01(uValue) 
self:FieldPut(#QTDE01, uValue)
return QTDE01 := uValue


access QTDE02() 
return self:FieldGet(#QTDE02)


assign QTDE02(uValue) 
self:FieldPut(#QTDE02, uValue)
return QTDE02 := uValue


access QTDE03() 
return self:FieldGet(#QTDE03)


assign QTDE03(uValue) 
self:FieldPut(#QTDE03, uValue)
return QTDE03 := uValue


access QTDE04() 
return self:FieldGet(#QTDE04)


assign QTDE04(uValue) 
self:FieldPut(#QTDE04, uValue)
return QTDE04 := uValue


access QTDE05() 
return self:FieldGet(#QTDE05)


assign QTDE05(uValue) 
self:FieldPut(#QTDE05, uValue)
return QTDE05 := uValue


access QTDE06() 
return self:FieldGet(#QTDE06)


assign QTDE06(uValue) 
self:FieldPut(#QTDE06, uValue)
return QTDE06 := uValue


access QTDE07() 
return self:FieldGet(#QTDE07)


assign QTDE07(uValue) 
self:FieldPut(#QTDE07, uValue)
return QTDE07 := uValue


access QTDE08() 
return self:FieldGet(#QTDE08)


assign QTDE08(uValue) 
self:FieldPut(#QTDE08, uValue)
return QTDE08 := uValue


access QTDE09() 
return self:FieldGet(#QTDE09)


assign QTDE09(uValue) 
self:FieldPut(#QTDE09, uValue)
return QTDE09 := uValue


access QTDE10() 
return self:FieldGet(#QTDE10)


assign QTDE10(uValue) 
self:FieldPut(#QTDE10, uValue)
return QTDE10 := uValue


access QTDE11() 
return self:FieldGet(#QTDE11)


assign QTDE11(uValue) 
self:FieldPut(#QTDE11, uValue)
return QTDE11 := uValue


access QTDE12() 
return self:FieldGet(#QTDE12)


assign QTDE12(uValue) 
self:FieldPut(#QTDE12, uValue)
return QTDE12 := uValue


access QTDE13() 
return self:FieldGet(#QTDE13)


assign QTDE13(uValue) 
self:FieldPut(#QTDE13, uValue)
return QTDE13 := uValue


access QTDE14() 
return self:FieldGet(#QTDE14)


assign QTDE14(uValue) 
self:FieldPut(#QTDE14, uValue)
return QTDE14 := uValue


access QTDE15() 
return self:FieldGet(#QTDE15)


assign QTDE15(uValue) 
self:FieldPut(#QTDE15, uValue)
return QTDE15 := uValue


access QTDE16() 
return self:FieldGet(#QTDE16)


assign QTDE16(uValue) 
self:FieldPut(#QTDE16, uValue)
return QTDE16 := uValue


access QTDE17() 
return self:FieldGet(#QTDE17)


assign QTDE17(uValue) 
self:FieldPut(#QTDE17, uValue)
return QTDE17 := uValue


access QTDE18() 
return self:FieldGet(#QTDE18)


assign QTDE18(uValue) 
self:FieldPut(#QTDE18, uValue)
return QTDE18 := uValue


access QTDE19() 
return self:FieldGet(#QTDE19)


assign QTDE19(uValue) 
self:FieldPut(#QTDE19, uValue)
return QTDE19 := uValue


access QTDE20() 
return self:FieldGet(#QTDE20)


assign QTDE20(uValue) 
self:FieldPut(#QTDE20, uValue)
return QTDE20 := uValue


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


access QTDR01() 
return self:FieldGet(#QTDR01)


assign QTDR01(uValue) 
self:FieldPut(#QTDR01, uValue)
return QTDR01 := uValue


access QTDR02() 
return self:FieldGet(#QTDR02)


assign QTDR02(uValue) 
self:FieldPut(#QTDR02, uValue)
return QTDR02 := uValue


access QTDR03() 
return self:FieldGet(#QTDR03)


assign QTDR03(uValue) 
self:FieldPut(#QTDR03, uValue)
return QTDR03 := uValue


access QTDR04() 
return self:FieldGet(#QTDR04)


assign QTDR04(uValue) 
self:FieldPut(#QTDR04, uValue)
return QTDR04 := uValue


access QTDR05() 
return self:FieldGet(#QTDR05)


assign QTDR05(uValue) 
self:FieldPut(#QTDR05, uValue)
return QTDR05 := uValue


access QTDR06() 
return self:FieldGet(#QTDR06)


assign QTDR06(uValue) 
self:FieldPut(#QTDR06, uValue)
return QTDR06 := uValue


access QTDR07() 
return self:FieldGet(#QTDR07)


assign QTDR07(uValue) 
self:FieldPut(#QTDR07, uValue)
return QTDR07 := uValue


access QTDR08() 
return self:FieldGet(#QTDR08)


assign QTDR08(uValue) 
self:FieldPut(#QTDR08, uValue)
return QTDR08 := uValue


access QTDR09() 
return self:FieldGet(#QTDR09)


assign QTDR09(uValue) 
self:FieldPut(#QTDR09, uValue)
return QTDR09 := uValue


access QTDR10() 
return self:FieldGet(#QTDR10)


assign QTDR10(uValue) 
self:FieldPut(#QTDR10, uValue)
return QTDR10 := uValue


access QTDR11() 
return self:FieldGet(#QTDR11)


assign QTDR11(uValue) 
self:FieldPut(#QTDR11, uValue)
return QTDR11 := uValue


access QTDR12() 
return self:FieldGet(#QTDR12)


assign QTDR12(uValue) 
self:FieldPut(#QTDR12, uValue)
return QTDR12 := uValue


access QTDR13() 
return self:FieldGet(#QTDR13)


assign QTDR13(uValue) 
self:FieldPut(#QTDR13, uValue)
return QTDR13 := uValue


access QTDR14() 
return self:FieldGet(#QTDR14)


assign QTDR14(uValue) 
self:FieldPut(#QTDR14, uValue)
return QTDR14 := uValue


access QTDR15() 
return self:FieldGet(#QTDR15)


assign QTDR15(uValue) 
self:FieldPut(#QTDR15, uValue)
return QTDR15 := uValue


access QTDR16() 
return self:FieldGet(#QTDR16)


assign QTDR16(uValue) 
self:FieldPut(#QTDR16, uValue)
return QTDR16 := uValue


access QTDR17() 
return self:FieldGet(#QTDR17)


assign QTDR17(uValue) 
self:FieldPut(#QTDR17, uValue)
return QTDR17 := uValue


access QTDR18() 
return self:FieldGet(#QTDR18)


assign QTDR18(uValue) 
self:FieldPut(#QTDR18, uValue)
return QTDR18 := uValue


access QTDR19() 
return self:FieldGet(#QTDR19)


assign QTDR19(uValue) 
self:FieldPut(#QTDR19, uValue)
return QTDR19 := uValue


access QTDR20() 
return self:FieldGet(#QTDR20)


assign QTDR20(uValue) 
self:FieldPut(#QTDR20, uValue)
return QTDR20 := uValue


access QTDSAL() 
return self:FieldGet(#QTDSAL)


assign QTDSAL(uValue) 
self:FieldPut(#QTDSAL, uValue)
return QTDSAL := uValue


access TIPOPRG() 
return self:FieldGet(#TIPOPRG)


assign TIPOPRG(uValue) 
self:FieldPut(#TIPOPRG, uValue)
return TIPOPRG := uValue


END CLASS
