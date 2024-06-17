#region DEFINES
STATIC DEFINE JACD_ACD := 122 
STATIC DEFINE JACD_ACP := 102 
STATIC DEFINE JACD_ALTERAR := 127 
STATIC DEFINE JACD_ALTERAR1 := 168 
STATIC DEFINE JACD_ANTERIOR := 129 
STATIC DEFINE JACD_BTNPEGMA01 := 162 
STATIC DEFINE JACD_BTNPEGMS01 := 163 
STATIC DEFINE JACD_BTNPEGMS06 := 158 
STATIC DEFINE JACD_BUSCANUM := 166 
STATIC DEFINE JACD_CALCULAR := 167 
STATIC DEFINE JACD_CALCULAR1 := 169 
STATIC DEFINE JACD_CARAC := 106 
STATIC DEFINE JACD_CLIENTE := 101 
STATIC DEFINE JACD_CLINOME := 124 
STATIC DEFINE JACD_CONTADOR := 150 
STATIC DEFINE JACD_CONV := 152 
STATIC DEFINE JACD_DATA := 100 
STATIC DEFINE JACD_DATAR := 105 
STATIC DEFINE JACD_DELETEITENS := 164 
STATIC DEFINE JACD_DESCII := 125 
STATIC DEFINE JACD_DESCRI := 103 
STATIC DEFINE JACD_DESENHO := 102 
STATIC DEFINE JACD_DUPLICAR := 123 
STATIC DEFINE JACD_ESCCOD := 157 
STATIC DEFINE JACD_ESCFOR := 156 
STATIC DEFINE JACD_EXCLUIR := 128 
STATIC DEFINE JACD_FOTO := 160 
STATIC DEFINE JACD_INSTRU := 112 
STATIC DEFINE JACD_JACDI := 132 
STATIC DEFINE JACD_LANC30 := 161 
STATIC DEFINE JACD_LANC33 := 151 
STATIC DEFINE JACD_MAX := 108 
STATIC DEFINE JACD_MDATA := 113 
STATIC DEFINE JACD_MENOS_HORA := 136 
STATIC DEFINE JACD_MHORA := 114 
STATIC DEFINE JACD_MIN := 107 
STATIC DEFINE JACD_MVAL01 := 115 
STATIC DEFINE JACD_MVAL02 := 116 
STATIC DEFINE JACD_MVAL03 := 117 
STATIC DEFINE JACD_MVAL04 := 118 
STATIC DEFINE JACD_MVAL05 := 119 
STATIC DEFINE JACD_MVALR := 121 
STATIC DEFINE JACD_MVALX := 120 
STATIC DEFINE JACD_NOVO := 126 
STATIC DEFINE JACD_OPERACAO := 111 
STATIC DEFINE JACD_POROV := 165 
STATIC DEFINE JACD_PROXIMO := 130 
STATIC DEFINE JACD_REVD := 104 
STATIC DEFINE JACD_SC_ACP := 138 
STATIC DEFINE JACD_SC_CARAC := 142 
STATIC DEFINE JACD_SC_CARAC1 := 155 
STATIC DEFINE JACD_SC_CLIENTE := 140 
STATIC DEFINE JACD_SC_DATA := 139 
STATIC DEFINE JACD_SC_DESENHO := 141 
STATIC DEFINE JACD_SC_DESTINO2 := 159 
STATIC DEFINE JACD_SC_INSTRU := 145 
STATIC DEFINE JACD_SC_MAX := 144 
STATIC DEFINE JACD_SC_MIN := 143 
STATIC DEFINE JACD_SC_MIN1 := 153 
STATIC DEFINE JACD_SC_MIN2 := 154 
STATIC DEFINE JACD_SEQ := 109 
STATIC DEFINE JACD_SSQ := 110 
STATIC DEFINE JACD_TABULAR := 131 
STATIC DEFINE JACD_TEXT06 := 148 
STATIC DEFINE JACD_TEXT10 := 136 
STATIC DEFINE JACD_TEXT11 := 137 
STATIC DEFINE JACD_TEXT7 := 134 
STATIC DEFINE JACD_TEXT8 := 133 
STATIC DEFINE JACD_TEXT9 := 135 
STATIC DEFINE JACD_THEFIXEDTEXT11 := 149 
STATIC DEFINE JACD_THEFIXEDTEXT8 := 146 
STATIC DEFINE JACD_THEFIXEDTEXT9 := 147 
#endregion

PARTIAL class JACD inherit MYDataWindow 

	PROTECT oDBACD as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCLINOME as DataColumn
	PROTECT oDBDESENHO as DataColumn
	PROTECT oDBDESCRI as DataColumn
	protect oDCDATA as DATETIMEPICKER
	protect oDCCLIENTE as RIGHTSLE
	protect oDCDESENHO as SINGLELINEEDIT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCREVD as SINGLELINEEDIT
	protect oDCDATAR as DATESLE
	protect oDCCARAC as SINGLELINEEDIT
	protect oDCMIN as RIGHTSLE
	protect oDCMAX as RIGHTSLE
	protect oDCSEQ as RIGHTSLE
	protect oDCSSQ as RIGHTSLE
	protect oDCOPERACAO as SINGLELINEEDIT
	protect oDCINSTRU as COMBOBOX
	protect oDCmDATA as DATETIMEPICKER
	protect oDCmHORA as DATETIMEPICKER
	protect oDCmVAL01 as RIGHTSLE
	protect oDCmVAL02 as RIGHTSLE
	protect oDCmVAL03 as RIGHTSLE
	protect oDCmVAL04 as RIGHTSLE
	protect oDCmVAL05 as RIGHTSLE
	protect oDCmVALX as RIGHTSLE
	protect oDCmVALR as RIGHTSLE
	protect oDCACD as SINGLELINEEDIT
	protect oCCDUPLICAR as PUSHBUTTON
	protect oDCCLINOME as SINGLELINEEDIT
	protect oDCDESCII as SINGLELINEEDIT
	protect oCCNovo as PUSHBUTTON
	protect oCCAlterar as PUSHBUTTON
	protect oCCEXCLUIR as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCProximo as PUSHBUTTON
	protect oCCtabular as PUSHBUTTON
	protect oDCtext8 as FIXEDTEXT
	protect oDCtext7 as FIXEDTEXT
	protect oDCtext9 as FIXEDTEXT
	protect oDCtext10 as FIXEDTEXT
	protect oDCtext11 as FIXEDTEXT
	protect oDCSC_ACP as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCSC_DESENHO as FIXEDTEXT
	protect oDCSC_CARAC as FIXEDTEXT
	protect oDCSC_MIN as FIXEDTEXT
	protect oDCSC_MAX as FIXEDTEXT
	protect oDCSC_INSTRU as FIXEDTEXT
	protect oDCtheFixedText8 as FIXEDTEXT
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oDCtext06 as FIXEDTEXT
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oDCcontador as SINGLELINEEDIT
	protect oCClanc33 as PUSHBUTTON
	protect oDCCONV as CHECKBOX
	protect oDCSC_MIN1 as FIXEDTEXT
	protect oDCSC_MIN2 as FIXEDTEXT
	protect oDCSC_CARAC1 as FIXEDTEXT
	protect oCCescfor as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oCCbtnpegms06 as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCClanc30 as PUSHBUTTON
	protect oCCbtnpegma01 as PUSHBUTTON
	protect oCCbtnpegmS01 as PUSHBUTTON
	protect oCCdeleteitens as PUSHBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oCCcalcular as PUSHBUTTON
	protect oCCAlterar1 as PUSHBUTTON
	protect oCCCalcular1 as PUSHBUTTON
// 	instance CLIENTE 
// 	instance DESENHO 
// 	instance DESCRI 
// 	instance REVD 
// 	instance DATAR 
// 	instance CARAC 
// 	instance MIN 
// 	instance MAX 
// 	instance SEQ 
// 	instance SSQ 
// 	instance OPERACAO 
// 	instance INSTRU 
// 	instance mVAL01 
// 	instance mVAL02 
// 	instance mVAL03 
// 	instance mVAL04 
// 	instance mVAL05 
// 	instance mVALX 
// 	instance mVALR 
// 	instance ACD 
// 	instance CLINOME 
// 	instance DESCII 
// 	instance contador 
// 	instance CONV 
	protect oSFJACDI as JACDI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ACD() 
return self:FieldGet(#ACD)


assign ACD(uValue) 
self:FieldPut(#ACD, uValue)
return ACD := uValue


ACCESS ACP() 
RETURN self:FieldGet(#ACP)


access CARAC() 
return self:FieldGet(#CARAC)


assign CARAC(uValue) 
self:FieldPut(#CARAC, uValue)
return CARAC := uValue


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


access contador() 
return self:FieldGet(#contador)


assign contador(uValue) 
self:FieldPut(#contador, uValue)
return contador := uValue


access CONV() 
return self:FieldGet(#CONV)


assign CONV(uValue) 
self:FieldPut(#CONV, uValue)
return CONV := uValue


access DATAR() 
return self:FieldGet(#DATAR)


assign DATAR(uValue) 
self:FieldPut(#DATAR, uValue)
return DATAR := uValue


access DESCII() 
return self:FieldGet(#DESCII)


assign DESCII(uValue) 
self:FieldPut(#DESCII, uValue)
return DESCII := uValue


access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


access DESENHO() 
return self:FieldGet(#DESENHO)


assign DESENHO(uValue) 
self:FieldPut(#DESENHO, uValue)
return DESENHO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JACD",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDATA := DateTimePicker{self,ResourceID{JACD_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCLIENTE := rightSle{self,ResourceID{JACD_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"ACP_CLIENTE"}

oDCDESENHO := SingleLineEdit{self,ResourceID{JACD_DESENHO,_GetInst()}}
oDCDESENHO:FieldSpec := PADRAO_CHAR_24{}
oDCDESENHO:HyperLabel := HyperLabel{#DESENHO,"Desenho:",NULL_STRING,"ACP_DESENHO"}

oDCDESCRI := SingleLineEdit{self,ResourceID{JACD_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_40{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descri:",NULL_STRING,"ACP_DESCRI"}

oDCREVD := SingleLineEdit{self,ResourceID{JACD_REVD,_GetInst()}}
oDCREVD:FieldSpec := PADRAO_CHAR_05{}
oDCREVD:HyperLabel := HyperLabel{#REVD,"Min:",NULL_STRING,"ACP_MIN"}

oDCDATAR := DateSle{self,ResourceID{JACD_DATAR,_GetInst()}}
oDCDATAR:FieldSpec := DATE_FIELD{}
oDCDATAR:HyperLabel := HyperLabel{#DATAR,"Cliente:",NULL_STRING,"ACP_CLIENTE"}

oDCCARAC := SingleLineEdit{self,ResourceID{JACD_CARAC,_GetInst()}}
oDCCARAC:FieldSpec := PADRAO_CHAR_40{}
oDCCARAC:HyperLabel := HyperLabel{#CARAC,"Carac:",NULL_STRING,"ACP_CARAC"}

oDCMIN := rightSle{self,ResourceID{JACD_MIN,_GetInst()}}
oDCMIN:FieldSpec := PADRAO_NUM_09_4{}
oDCMIN:HyperLabel := HyperLabel{#MIN,"Min:",NULL_STRING,"ACP_MIN"}

oDCMAX := rightSle{self,ResourceID{JACD_MAX,_GetInst()}}
oDCMAX:FieldSpec := PADRAO_NUM_09_4{}
oDCMAX:HyperLabel := HyperLabel{#MAX,"Max:",NULL_STRING,"ACP_MAX"}

oDCSEQ := rightSle{self,ResourceID{JACD_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := PADRAO_NUM_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Min:",NULL_STRING,"ACP_MIN"}

oDCSSQ := rightSle{self,ResourceID{JACD_SSQ,_GetInst()}}
oDCSSQ:FieldSpec := PADRAO_NUM_03{}
oDCSSQ:HyperLabel := HyperLabel{#SSQ,"Min:",NULL_STRING,"ACP_MIN"}

oDCOPERACAO := SingleLineEdit{self,ResourceID{JACD_OPERACAO,_GetInst()}}
oDCOPERACAO:FieldSpec := PADRAO_CHAR_70{}
oDCOPERACAO:HyperLabel := HyperLabel{#OPERACAO,"Carac:",NULL_STRING,"ACP_CARAC"}

oDCINSTRU := combobox{self,ResourceID{JACD_INSTRU,_GetInst()}}
oDCINSTRU:HyperLabel := HyperLabel{#INSTRU,NULL_STRING,NULL_STRING,NULL_STRING}
oDCINSTRU:FillUsing(Self:TABINS( ))
oDCINSTRU:FieldSpec := PADRAO_CHAR_05{}

oDCmDATA := DateTimePicker{self,ResourceID{JACD_MDATA,_GetInst()}}
oDCmDATA:HyperLabel := HyperLabel{#mDATA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCmHORA := DateTimePicker{self,ResourceID{JACD_MHORA,_GetInst()}}
oDCmHORA:HyperLabel := HyperLabel{#mHORA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCmVAL01 := rightSle{self,ResourceID{JACD_MVAL01,_GetInst()}}
oDCmVAL01:FieldSpec := PADRAO_NUM_09_4{}
oDCmVAL01:HyperLabel := HyperLabel{#mVAL01,NULL_STRING,NULL_STRING,NULL_STRING}

oDCmVAL02 := rightSle{self,ResourceID{JACD_MVAL02,_GetInst()}}
oDCmVAL02:FieldSpec := PADRAO_NUM_09_4{}
oDCmVAL02:HyperLabel := HyperLabel{#mVAL02,NULL_STRING,NULL_STRING,NULL_STRING}

oDCmVAL03 := rightSle{self,ResourceID{JACD_MVAL03,_GetInst()}}
oDCmVAL03:FieldSpec := PADRAO_NUM_09_4{}
oDCmVAL03:HyperLabel := HyperLabel{#mVAL03,NULL_STRING,NULL_STRING,NULL_STRING}

oDCmVAL04 := rightSle{self,ResourceID{JACD_MVAL04,_GetInst()}}
oDCmVAL04:FieldSpec := PADRAO_NUM_09_4{}
oDCmVAL04:HyperLabel := HyperLabel{#mVAL04,NULL_STRING,NULL_STRING,NULL_STRING}

oDCmVAL05 := rightSle{self,ResourceID{JACD_MVAL05,_GetInst()}}
oDCmVAL05:FieldSpec := PADRAO_NUM_09_4{}
oDCmVAL05:HyperLabel := HyperLabel{#mVAL05,NULL_STRING,NULL_STRING,NULL_STRING}

oDCmVALX := rightSle{self,ResourceID{JACD_MVALX,_GetInst()}}
oDCmVALX:HyperLabel := HyperLabel{#mVALX,NULL_STRING,NULL_STRING,NULL_STRING}
oDCmVALX:FieldSpec := PADRAO_NUM_09_4{}

oDCmVALR := rightSle{self,ResourceID{JACD_MVALR,_GetInst()}}
oDCmVALR:HyperLabel := HyperLabel{#mVALR,NULL_STRING,NULL_STRING,NULL_STRING}
oDCmVALR:FieldSpec := PADRAO_NUM_09_4{}

oDCACD := SingleLineEdit{self,ResourceID{JACD_ACD,_GetInst()}}
oDCACD:FieldSpec := PADRAO_NUM_08{}
oDCACD:HyperLabel := HyperLabel{#ACD,"Acp:",NULL_STRING,"ACP_ACP"}
oDCACD:BackGround := aBrushes[1]
oDCACD:Font(aFonts[1], FALSE)

oCCDUPLICAR := PushButton{self,ResourceID{JACD_DUPLICAR,_GetInst()}}
oCCDUPLICAR:HyperLabel := HyperLabel{#DUPLICAR,"Duplicar","Duplicar",NULL_STRING}

oDCCLINOME := SingleLineEdit{self,ResourceID{JACD_CLINOME,_GetInst()}}
oDCCLINOME:FieldSpec := PADRAO_CHAR_50{}
oDCCLINOME:HyperLabel := HyperLabel{#CLINOME,"Clinome:",NULL_STRING,"ACP_CLINOME"}
oDCCLINOME:BackGround := aBrushes[1]
oDCCLINOME:Font(aFonts[2], FALSE)

oDCDESCII := SingleLineEdit{self,ResourceID{JACD_DESCII,_GetInst()}}
oDCDESCII:FieldSpec := PADRAO_CHAR_25{}
oDCDESCII:HyperLabel := HyperLabel{#DESCII,"Descii:",NULL_STRING,"ACP_DESCII"}
oDCDESCII:BackGround := aBrushes[1]
oDCDESCII:Font(aFonts[2], FALSE)

oCCNovo := PushButton{self,ResourceID{JACD_NOVO,_GetInst()}}
oCCNovo:HyperLabel := HyperLabel{#Novo,_chr(38)+"Novo",NULL_STRING,NULL_STRING}

oCCAlterar := PushButton{self,ResourceID{JACD_ALTERAR,_GetInst()}}
oCCAlterar:HyperLabel := HyperLabel{#Alterar,"Alterar",NULL_STRING,NULL_STRING}

oCCEXCLUIR := PushButton{self,ResourceID{JACD_EXCLUIR,_GetInst()}}
oCCEXCLUIR:HyperLabel := HyperLabel{#EXCLUIR,"Excluir",NULL_STRING,NULL_STRING}

oCCAnterior := PushButton{self,ResourceID{JACD_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ICO_PREVIOUS{}

oCCProximo := PushButton{self,ResourceID{JACD_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ICO_NEXT{}

oCCtabular := PushButton{self,ResourceID{JACD_TABULAR,_GetInst()}}
oCCtabular:HyperLabel := HyperLabel{#tabular,"Ver Itens",NULL_STRING,NULL_STRING}

oDCtext8 := FixedText{self,ResourceID{JACD_TEXT8,_GetInst()}}
oDCtext8:HyperLabel := HyperLabel{#text8,"Valor 02",NULL_STRING,NULL_STRING}

oDCtext7 := FixedText{self,ResourceID{JACD_TEXT7,_GetInst()}}
oDCtext7:HyperLabel := HyperLabel{#text7,"Valor 01",NULL_STRING,NULL_STRING}

oDCtext9 := FixedText{self,ResourceID{JACD_TEXT9,_GetInst()}}
oDCtext9:HyperLabel := HyperLabel{#text9,"Valor 03",NULL_STRING,NULL_STRING}

oDCtext10 := FixedText{self,ResourceID{JACD_TEXT10,_GetInst()}}
oDCtext10:HyperLabel := HyperLabel{#text10,"Valor 04",NULL_STRING,NULL_STRING}

oDCtext11 := FixedText{self,ResourceID{JACD_TEXT11,_GetInst()}}
oDCtext11:HyperLabel := HyperLabel{#text11,"Valor 05",NULL_STRING,NULL_STRING}

oDCSC_ACP := FixedText{self,ResourceID{JACD_SC_ACP,_GetInst()}}
oDCSC_ACP:HyperLabel := HyperLabel{#SC_ACP,"ACD:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JACD_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{JACD_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCSC_DESENHO := FixedText{self,ResourceID{JACD_SC_DESENHO,_GetInst()}}
oDCSC_DESENHO:HyperLabel := HyperLabel{#SC_DESENHO,"Desenho:",NULL_STRING,NULL_STRING}

oDCSC_CARAC := FixedText{self,ResourceID{JACD_SC_CARAC,_GetInst()}}
oDCSC_CARAC:HyperLabel := HyperLabel{#SC_CARAC,"Caracteristicas:",NULL_STRING,NULL_STRING}

oDCSC_MIN := FixedText{self,ResourceID{JACD_SC_MIN,_GetInst()}}
oDCSC_MIN:HyperLabel := HyperLabel{#SC_MIN,"Min:",NULL_STRING,NULL_STRING}

oDCSC_MAX := FixedText{self,ResourceID{JACD_SC_MAX,_GetInst()}}
oDCSC_MAX:HyperLabel := HyperLabel{#SC_MAX,"Max:",NULL_STRING,NULL_STRING}

oDCSC_INSTRU := FixedText{self,ResourceID{JACD_SC_INSTRU,_GetInst()}}
oDCSC_INSTRU:HyperLabel := HyperLabel{#SC_INSTRU,"Instrumento:",NULL_STRING,NULL_STRING}

oDCtheFixedText8 := FixedText{self,ResourceID{JACD_THEFIXEDTEXT8,_GetInst()}}
oDCtheFixedText8:HyperLabel := HyperLabel{#theFixedText8,"Data",NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{JACD_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Hora",NULL_STRING,NULL_STRING}

oDCtext06 := FixedText{self,ResourceID{JACD_TEXT06,_GetInst()}}
oDCtext06:HyperLabel := HyperLabel{#text06,"Media X",NULL_STRING,NULL_STRING}

oDCtheFixedText11 := FixedText{self,ResourceID{JACD_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Media R",NULL_STRING,NULL_STRING}

oDCcontador := SingleLineEdit{self,ResourceID{JACD_CONTADOR,_GetInst()}}
oDCcontador:HyperLabel := HyperLabel{#contador,NULL_STRING,NULL_STRING,NULL_STRING}
oDCcontador:BackGround := aBrushes[1]
oDCcontador:Font(aFonts[2], FALSE)
oDCcontador:FieldSpec := PADRAO_NUM_08{}

oCClanc33 := PushButton{self,ResourceID{JACD_LANC33,_GetInst()}}
oCClanc33:HyperLabel := HyperLabel{#lanc33,"33 Lanc.",NULL_STRING,NULL_STRING}

oDCCONV := CheckBox{self,ResourceID{JACD_CONV,_GetInst()}}
oDCCONV:HyperLabel := HyperLabel{#CONV,"Converter Lançamento Base 60/100 ",NULL_STRING,"ACD_CONV"}
oDCCONV:FieldSpec := LOGIC_FIELD{}

oDCSC_MIN1 := FixedText{self,ResourceID{JACD_SC_MIN1,_GetInst()}}
oDCSC_MIN1:HyperLabel := HyperLabel{#SC_MIN1,"Rev",NULL_STRING,NULL_STRING}

oDCSC_MIN2 := FixedText{self,ResourceID{JACD_SC_MIN2,_GetInst()}}
oDCSC_MIN2:HyperLabel := HyperLabel{#SC_MIN2,"Em:",NULL_STRING,NULL_STRING}

oDCSC_CARAC1 := FixedText{self,ResourceID{JACD_SC_CARAC1,_GetInst()}}
oDCSC_CARAC1:HyperLabel := HyperLabel{#SC_CARAC1,"Operação",NULL_STRING,NULL_STRING}

oCCescfor := PushButton{self,ResourceID{JACD_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JACD_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oCCbtnpegms06 := PushButton{self,ResourceID{JACD_BTNPEGMS06,_GetInst()}}
oCCbtnpegms06:HyperLabel := HyperLabel{#btnpegms06,"-->",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JACD_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JACD_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oCClanc30 := PushButton{self,ResourceID{JACD_LANC30,_GetInst()}}
oCClanc30:HyperLabel := HyperLabel{#lanc30,"30 Lanc.",NULL_STRING,NULL_STRING}

oCCbtnpegma01 := PushButton{self,ResourceID{JACD_BTNPEGMA01,_GetInst()}}
oCCbtnpegma01:HyperLabel := HyperLabel{#btnpegma01,"-->",NULL_STRING,NULL_STRING}

oCCbtnpegmS01 := PushButton{self,ResourceID{JACD_BTNPEGMS01,_GetInst()}}
oCCbtnpegmS01:HyperLabel := HyperLabel{#btnpegmS01,"-->",NULL_STRING,NULL_STRING}

oCCdeleteitens := PushButton{self,ResourceID{JACD_DELETEITENS,_GetInst()}}
oCCdeleteitens:HyperLabel := HyperLabel{#deleteitens,"Excluir Todos Itens",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JACD_POROV,_GetInst()}}
oCCporov:Image := ICO_AZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Organizar por Numero GC"

oCCbuscanum := PushButton{self,ResourceID{JACD_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Localizar um GC"

oCCcalcular := PushButton{self,ResourceID{JACD_CALCULAR,_GetInst()}}
oCCcalcular:HyperLabel := HyperLabel{#calcular,"Calcular Medias",NULL_STRING,NULL_STRING}

oCCAlterar1 := PushButton{self,ResourceID{JACD_ALTERAR1,_GetInst()}}
oCCAlterar1:HyperLabel := HyperLabel{#Alterar1,"Alterar",NULL_STRING,NULL_STRING}

oCCCalcular1 := PushButton{self,ResourceID{JACD_CALCULAR1,_GetInst()}}
oCCCalcular1:HyperLabel := HyperLabel{#Calcular1,"Cnv 60/100",NULL_STRING,NULL_STRING}

self:Caption := "Dados"
self:HyperLabel := HyperLabel{#JACD,"Dados",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBACD := DataColumn{PADRAO_NUM_08{}}
oDBACD:Width := 9
oDBACD:HyperLabel := oDCACD:HyperLabel 
oDBACD:Caption := "Acp:"
oDBACD:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBACD)

oDBCLIENTE := DataColumn{PADRAO_NUM_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
self:Browser:AddColumn(oDBCLIENTE)

oDBCLINOME := DataColumn{PADRAO_CHAR_50{}}
oDBCLINOME:Width := 9
oDBCLINOME:HyperLabel := oDCCLINOME:HyperLabel 
oDBCLINOME:Caption := "Clinome:"
oDBCLINOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCLINOME)

oDBDESENHO := DataColumn{PADRAO_CHAR_24{}}
oDBDESENHO:Width := 9
oDBDESENHO:HyperLabel := oDCDESENHO:HyperLabel 
oDBDESENHO:Caption := "Desenho:"
self:Browser:AddColumn(oDBDESENHO)

oDBDESCRI := DataColumn{PADRAO_CHAR_40{}}
oDBDESCRI:Width := 26
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descri:"
self:Browser:AddColumn(oDBDESCRI)


self:ViewAs(#FormView)

oSFJACDI := JACDI{self,JACD_JACDI}
oSFJACDI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access INSTRU() 
return self:FieldGet(#INSTRU)


assign INSTRU(uValue) 
self:FieldPut(#INSTRU, uValue)
return INSTRU := uValue


access MAX() 
return self:FieldGet(#MAX)


assign MAX(uValue) 
self:FieldPut(#MAX, uValue)
return MAX := uValue


access MIN() 
return self:FieldGet(#MIN)


assign MIN(uValue) 
self:FieldPut(#MIN, uValue)
return MIN := uValue


access mVAL01() 
return self:FieldGet(#mVAL01)


assign mVAL01(uValue) 
self:FieldPut(#mVAL01, uValue)
return mVAL01 := uValue


access mVAL02() 
return self:FieldGet(#mVAL02)


assign mVAL02(uValue) 
self:FieldPut(#mVAL02, uValue)
return mVAL02 := uValue


access mVAL03() 
return self:FieldGet(#mVAL03)


assign mVAL03(uValue) 
self:FieldPut(#mVAL03, uValue)
return mVAL03 := uValue


access mVAL04() 
return self:FieldGet(#mVAL04)


assign mVAL04(uValue) 
self:FieldPut(#mVAL04, uValue)
return mVAL04 := uValue


access mVAL05() 
return self:FieldGet(#mVAL05)


assign mVAL05(uValue) 
self:FieldPut(#mVAL05, uValue)
return mVAL05 := uValue


access mVALR() 
return self:FieldGet(#mVALR)


assign mVALR(uValue) 
self:FieldPut(#mVALR, uValue)
return mVALR := uValue


access mVALX() 
return self:FieldGet(#mVALX)


assign mVALX(uValue) 
self:FieldPut(#mVALX, uValue)
return mVALX := uValue


access OPERACAO() 
return self:FieldGet(#OPERACAO)


assign OPERACAO(uValue) 
self:FieldPut(#OPERACAO, uValue)
return OPERACAO := uValue


access REVD() 
return self:FieldGet(#REVD)


assign REVD(uValue) 
self:FieldPut(#REVD, uValue)
return REVD := uValue


access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


access SSQ() 
return self:FieldGet(#SSQ)


assign SSQ(uValue) 
self:FieldPut(#SSQ, uValue)
return SSQ := uValue


END CLASS
