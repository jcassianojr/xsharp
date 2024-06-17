#region DEFINES
STATIC DEFINE JEQP_ANO := 133 
STATIC DEFINE JEQP_BUSCAOV := 101 
STATIC DEFINE JEQP_CH1 := 168 
STATIC DEFINE JEQP_CH2 := 162 
STATIC DEFINE JEQP_CH3 := 163 
STATIC DEFINE JEQP_CH4 := 164 
STATIC DEFINE JEQP_CH5 := 165 
STATIC DEFINE JEQP_CH6 := 166 
STATIC DEFINE JEQP_CH7 := 167 
STATIC DEFINE JEQP_CHM := 150 
STATIC DEFINE JEQP_CHS := 152 
STATIC DEFINE JEQP_CHT := 148 
STATIC DEFINE JEQP_COGNOME := 131 
STATIC DEFINE JEQP_CONTABIL := 107 
STATIC DEFINE JEQP_DATA := 139 
STATIC DEFINE JEQP_ESPECIFI := 127 
STATIC DEFINE JEQP_ESPECIFI1 := 128 
STATIC DEFINE JEQP_FABRICANTE := 112 
STATIC DEFINE JEQP_GRUPO := 113 
STATIC DEFINE JEQP_KWH := 125 
STATIC DEFINE JEQP_MESES := 137 
STATIC DEFINE JEQP_MODELO := 121 
STATIC DEFINE JEQP_MOTORCV := 123 
STATIC DEFINE JEQP_NOME := 106 
STATIC DEFINE JEQP_NRFORNE := 130 
STATIC DEFINE JEQP_NUMERO := 105 
STATIC DEFINE JEQP_NUMFAB := 111 
STATIC DEFINE JEQP_OBSERVA := 147 
STATIC DEFINE JEQP_POROV := 100 
STATIC DEFINE JEQP_QTDE := 135 
STATIC DEFINE JEQP_SC_ANO := 132 
STATIC DEFINE JEQP_SC_CH1 := 161 
STATIC DEFINE JEQP_SC_CH2 := 155 
STATIC DEFINE JEQP_SC_CH3 := 156 
STATIC DEFINE JEQP_SC_CH4 := 157 
STATIC DEFINE JEQP_SC_CH5 := 158 
STATIC DEFINE JEQP_SC_CH6 := 159 
STATIC DEFINE JEQP_SC_CH7 := 160 
STATIC DEFINE JEQP_SC_CHM := 149 
STATIC DEFINE JEQP_SC_CHS := 151 
STATIC DEFINE JEQP_SC_CONTABIL := 102 
STATIC DEFINE JEQP_SC_DATA := 138 
STATIC DEFINE JEQP_SC_FABRICANTE := 108 
STATIC DEFINE JEQP_SC_GRUPO := 109 
STATIC DEFINE JEQP_SC_KWH := 124 
STATIC DEFINE JEQP_SC_MESES := 136 
STATIC DEFINE JEQP_SC_MODELO := 120 
STATIC DEFINE JEQP_SC_MOTORCV := 122 
STATIC DEFINE JEQP_SC_NOME := 104 
STATIC DEFINE JEQP_SC_NRFORNE := 129 
STATIC DEFINE JEQP_SC_NUMERO := 103 
STATIC DEFINE JEQP_SC_OBSERVA := 146 
STATIC DEFINE JEQP_SC_QTDE := 134 
STATIC DEFINE JEQP_SC_SETOR := 110 
STATIC DEFINE JEQP_SC_TABELA := 142 
STATIC DEFINE JEQP_SC_VALOR := 140 
STATIC DEFINE JEQP_SC_VALOR_CONV := 144 
STATIC DEFINE JEQP_SETOR := 114 
STATIC DEFINE JEQP_TABELA := 143 
STATIC DEFINE JEQP_THEGROUPBOX1 := 126 
STATIC DEFINE JEQP_THERADIOBUTTON1 := 116 
STATIC DEFINE JEQP_THERADIOBUTTON2 := 117 
STATIC DEFINE JEQP_THERADIOBUTTON3 := 119 
STATIC DEFINE JEQP_THERADIOBUTTON4 := 118 
STATIC DEFINE JEQP_THERADIOBUTTON5 := 153 
STATIC DEFINE JEQP_THERADIOBUTTON6 := 154 
STATIC DEFINE JEQP_TIPO := 115 
STATIC DEFINE JEQP_VALOR := 141 
STATIC DEFINE JEQP_VALOR_CONV := 145 
#endregion

class JEQP inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBFABRICANTE as DataColumn
	PROTECT oDBGRUPO as DataColumn
	PROTECT oDBSETOR as DataColumn
	PROTECT oDBMODELO as DataColumn
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oDCSC_CONTABIL as FIXEDTEXT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCCONTABIL as SINGLELINEEDIT
	protect oDCSC_FABRICANTE as FIXEDTEXT
	protect oDCSC_GRUPO as FIXEDTEXT
	protect oDCSC_SETOR as FIXEDTEXT
	protect oDCNUMFAB as SINGLELINEEDIT
	protect oDCFABRICANTE as SINGLELINEEDIT
	protect oDCGRUPO as SINGLELINEEDIT
	protect oDCSETOR as SINGLELINEEDIT
	protect oDCTIPO as RADIOBUTTONGROUP
	protect oCCtheRadioButton1 as RADIOBUTTON
	protect oCCtheRadioButton2 as RADIOBUTTON
	protect oCCtheRadioButton4 as RADIOBUTTON
	protect oCCtheRadioButton3 as RADIOBUTTON
	protect oDCSC_MODELO as FIXEDTEXT
	protect oDCMODELO as SINGLELINEEDIT
	protect oDCSC_MOTORCV as FIXEDTEXT
	protect oDCMOTORCV as SINGLELINEEDIT
	protect oDCSC_KWH as FIXEDTEXT
	protect oDCKWH as SINGLELINEEDIT
	protect oDCtheGroupBox1 as GROUPBOX
	protect oDCESPECIFI as SINGLELINEEDIT
	protect oDCESPECIFI1 as SINGLELINEEDIT
	protect oDCSC_NRFORNE as FIXEDTEXT
	protect oDCNRFORNE as SINGLELINEEDIT
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCSC_ANO as FIXEDTEXT
	protect oDCANO as SINGLELINEEDIT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCQTDE as SINGLELINEEDIT
	protect oDCSC_MESES as FIXEDTEXT
	protect oDCMESES as SINGLELINEEDIT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCDATA as SINGLELINEEDIT
	protect oDCSC_VALOR as FIXEDTEXT
	protect oDCVALOR as SINGLELINEEDIT
	protect oDCSC_TABELA as FIXEDTEXT
	protect oDCTABELA as SINGLELINEEDIT
	protect oDCSC_VALOR_CONV as FIXEDTEXT
	protect oDCVALOR_CONV as SINGLELINEEDIT
	protect oDCSC_OBSERVA as FIXEDTEXT
	protect oDCOBSERVA as SINGLELINEEDIT
	protect oDCCHT as RADIOBUTTONGROUP
	protect oDCSC_CHM as FIXEDTEXT
	protect oDCCHM as SINGLELINEEDIT
	protect oDCSC_CHS as FIXEDTEXT
	protect oDCCHS as SINGLELINEEDIT
	protect oCCtheRadioButton5 as RADIOBUTTON
	protect oCCtheRadioButton6 as RADIOBUTTON
	protect oDCSC_CH2 as FIXEDTEXT
	protect oDCSC_CH3 as FIXEDTEXT
	protect oDCSC_CH4 as FIXEDTEXT
	protect oDCSC_CH5 as FIXEDTEXT
	protect oDCSC_CH6 as FIXEDTEXT
	protect oDCSC_CH7 as FIXEDTEXT
	protect oDCSC_CH1 as FIXEDTEXT
	protect oDCCH2 as SINGLELINEEDIT
	protect oDCCH3 as SINGLELINEEDIT
	protect oDCCH4 as SINGLELINEEDIT
	protect oDCCH5 as SINGLELINEEDIT
	protect oDCCH6 as SINGLELINEEDIT
	protect oDCCH7 as SINGLELINEEDIT
	protect oDCCH1 as SINGLELINEEDIT
// 	instance NUMERO 
// 	instance NOME 
// 	instance CONTABIL 
// 	instance NUMFAB 
// 	instance FABRICANTE 
// 	instance GRUPO 
// 	instance SETOR 
// 	instance TIPO 
// 	instance MODELO 
// 	instance MOTORCV 
// 	instance KWH 
// 	instance ESPECIFI 
// 	instance ESPECIFI1 
// 	instance NRFORNE 
// 	instance COGNOME 
// 	instance ANO 
// 	instance QTDE 
// 	instance MESES 
// 	instance DATA 
// 	instance VALOR 
// 	instance TABELA 
// 	instance VALOR_CONV 
// 	instance OBSERVA 
// 	instance CHT 
// 	instance CHM 
// 	instance CHS 
// 	instance CH2 
// 	instance CH3 
// 	instance CH4 
// 	instance CH5 
// 	instance CH6 
// 	instance CH7 
// 	instance CH1 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANO() 
return self:FieldGet(#ANO)


assign ANO(uValue) 
self:FieldPut(#ANO, uValue)
return ANO := uValue


access CH1() 
return self:FieldGet(#CH1)


assign CH1(uValue) 
self:FieldPut(#CH1, uValue)
return CH1 := uValue


access CH2() 
return self:FieldGet(#CH2)


assign CH2(uValue) 
self:FieldPut(#CH2, uValue)
return CH2 := uValue


access CH3() 
return self:FieldGet(#CH3)


assign CH3(uValue) 
self:FieldPut(#CH3, uValue)
return CH3 := uValue


access CH4() 
return self:FieldGet(#CH4)


assign CH4(uValue) 
self:FieldPut(#CH4, uValue)
return CH4 := uValue


access CH5() 
return self:FieldGet(#CH5)


assign CH5(uValue) 
self:FieldPut(#CH5, uValue)
return CH5 := uValue


access CH6() 
return self:FieldGet(#CH6)


assign CH6(uValue) 
self:FieldPut(#CH6, uValue)
return CH6 := uValue


access CH7() 
return self:FieldGet(#CH7)


assign CH7(uValue) 
self:FieldPut(#CH7, uValue)
return CH7 := uValue


access CHM() 
return self:FieldGet(#CHM)


assign CHM(uValue) 
self:FieldPut(#CHM, uValue)
return CHM := uValue


access CHS() 
return self:FieldGet(#CHS)


assign CHS(uValue) 
self:FieldPut(#CHS, uValue)
return CHS := uValue


access CHT() 
return self:FieldGet(#CHT)


assign CHT(uValue) 
self:FieldPut(#CHT, uValue)
return CHT := uValue


access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


access CONTABIL() 
return self:FieldGet(#CONTABIL)


assign CONTABIL(uValue) 
self:FieldPut(#CONTABIL, uValue)
return CONTABIL := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access ESPECIFI() 
return self:FieldGet(#ESPECIFI)


assign ESPECIFI(uValue) 
self:FieldPut(#ESPECIFI, uValue)
return ESPECIFI := uValue


access ESPECIFI1() 
return self:FieldGet(#ESPECIFI1)


assign ESPECIFI1(uValue) 
self:FieldPut(#ESPECIFI1, uValue)
return ESPECIFI1 := uValue


access FABRICANTE() 
return self:FieldGet(#FABRICANTE)


assign FABRICANTE(uValue) 
self:FieldPut(#FABRICANTE, uValue)
return FABRICANTE := uValue


access GRUPO() 
return self:FieldGet(#GRUPO)


assign GRUPO(uValue) 
self:FieldPut(#GRUPO, uValue)
return GRUPO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JEQP",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oCCporov := PushButton{self,ResourceID{JEQP_POROV,_GetInst()}}
oCCporov:Image := ico_az{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaov := PushButton{self,ResourceID{JEQP_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ico_find{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_CONTABIL := FixedText{self,ResourceID{JEQP_SC_CONTABIL,_GetInst()}}
oDCSC_CONTABIL:HyperLabel := HyperLabel{#SC_CONTABIL,"Contabil:",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JEQP_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JEQP_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JEQP_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_char_04{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero",NULL_STRING,"ME01_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]

oDCNOME := SingleLineEdit{self,ResourceID{JEQP_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"ME01_NOME"}
oDCNOME:BackGround := aBrushes[1]

oDCCONTABIL := SingleLineEdit{self,ResourceID{JEQP_CONTABIL,_GetInst()}}
oDCCONTABIL:FieldSpec := padrao_char_08{}
oDCCONTABIL:HyperLabel := HyperLabel{#CONTABIL,"Contabil:",NULL_STRING,"ME01_CONTABIL"}
oDCCONTABIL:BackGround := aBrushes[1]

oDCSC_FABRICANTE := FixedText{self,ResourceID{JEQP_SC_FABRICANTE,_GetInst()}}
oDCSC_FABRICANTE:HyperLabel := HyperLabel{#SC_FABRICANTE,"Fabricante:",NULL_STRING,NULL_STRING}

oDCSC_GRUPO := FixedText{self,ResourceID{JEQP_SC_GRUPO,_GetInst()}}
oDCSC_GRUPO:HyperLabel := HyperLabel{#SC_GRUPO,"Grupo:",NULL_STRING,NULL_STRING}

oDCSC_SETOR := FixedText{self,ResourceID{JEQP_SC_SETOR,_GetInst()}}
oDCSC_SETOR:HyperLabel := HyperLabel{#SC_SETOR,"Setor:",NULL_STRING,NULL_STRING}

oDCNUMFAB := SingleLineEdit{self,ResourceID{JEQP_NUMFAB,_GetInst()}}
oDCNUMFAB:FieldSpec := padrao_char_08{}
oDCNUMFAB:HyperLabel := HyperLabel{#NUMFAB,"Numfab:",NULL_STRING,"ME01_NUMFAB"}
oDCNUMFAB:BackGround := aBrushes[1]

oDCFABRICANTE := SingleLineEdit{self,ResourceID{JEQP_FABRICANTE,_GetInst()}}
oDCFABRICANTE:FieldSpec := padrao_char_20{}
oDCFABRICANTE:HyperLabel := HyperLabel{#FABRICANTE,"Fabricante:",NULL_STRING,"ME01_FABRICANTE"}
oDCFABRICANTE:BackGround := aBrushes[1]

oDCGRUPO := SingleLineEdit{self,ResourceID{JEQP_GRUPO,_GetInst()}}
oDCGRUPO:FieldSpec := padrao_char_03{}
oDCGRUPO:HyperLabel := HyperLabel{#GRUPO,"Grupo:",NULL_STRING,"ME01_GRUPO"}
oDCGRUPO:BackGround := aBrushes[1]

oDCSETOR := SingleLineEdit{self,ResourceID{JEQP_SETOR,_GetInst()}}
oDCSETOR:FieldSpec := padrao_char_10{}
oDCSETOR:HyperLabel := HyperLabel{#SETOR,"Setor:",NULL_STRING,"ME01_SETOR"}
oDCSETOR:BackGround := aBrushes[1]

oCCtheRadioButton1 := RadioButton{self,ResourceID{JEQP_THERADIOBUTTON1,_GetInst()}}
oCCtheRadioButton1:HyperLabel := HyperLabel{#theRadioButton1,"Maquina",NULL_STRING,NULL_STRING}

oCCtheRadioButton2 := RadioButton{self,ResourceID{JEQP_THERADIOBUTTON2,_GetInst()}}
oCCtheRadioButton2:HyperLabel := HyperLabel{#theRadioButton2,"Ferramentaria",NULL_STRING,NULL_STRING}

oCCtheRadioButton4 := RadioButton{self,ResourceID{JEQP_THERADIOBUTTON4,_GetInst()}}
oCCtheRadioButton4:HyperLabel := HyperLabel{#theRadioButton4,"Equipamento",NULL_STRING,NULL_STRING}

oCCtheRadioButton3 := RadioButton{self,ResourceID{JEQP_THERADIOBUTTON3,_GetInst()}}
oCCtheRadioButton3:HyperLabel := HyperLabel{#theRadioButton3,"Mesas/Armarios",NULL_STRING,NULL_STRING}

oDCSC_MODELO := FixedText{self,ResourceID{JEQP_SC_MODELO,_GetInst()}}
oDCSC_MODELO:HyperLabel := HyperLabel{#SC_MODELO,"Modelo:",NULL_STRING,NULL_STRING}

oDCMODELO := SingleLineEdit{self,ResourceID{JEQP_MODELO,_GetInst()}}
oDCMODELO:FieldSpec := padrao_char_20{}
oDCMODELO:HyperLabel := HyperLabel{#MODELO,"Modelo:",NULL_STRING,"ME01_MODELO"}
oDCMODELO:BackGround := aBrushes[1]

oDCSC_MOTORCV := FixedText{self,ResourceID{JEQP_SC_MOTORCV,_GetInst()}}
oDCSC_MOTORCV:HyperLabel := HyperLabel{#SC_MOTORCV,"Motorcv:",NULL_STRING,NULL_STRING}

oDCMOTORCV := SingleLineEdit{self,ResourceID{JEQP_MOTORCV,_GetInst()}}
oDCMOTORCV:FieldSpec := padrao_num_07_3{}
oDCMOTORCV:HyperLabel := HyperLabel{#MOTORCV,"Motorcv:",NULL_STRING,"ME01_MOTORCV"}
oDCMOTORCV:BackGround := aBrushes[1]

oDCSC_KWH := FixedText{self,ResourceID{JEQP_SC_KWH,_GetInst()}}
oDCSC_KWH:HyperLabel := HyperLabel{#SC_KWH,"Kwh:",NULL_STRING,NULL_STRING}

oDCKWH := SingleLineEdit{self,ResourceID{JEQP_KWH,_GetInst()}}
oDCKWH:FieldSpec := padrao_num_07_3{}
oDCKWH:HyperLabel := HyperLabel{#KWH,"Kwh:",NULL_STRING,"ME01_KWH"}
oDCKWH:BackGround := aBrushes[1]

oDCtheGroupBox1 := GroupBox{self,ResourceID{JEQP_THEGROUPBOX1,_GetInst()}}
oDCtheGroupBox1:HyperLabel := HyperLabel{#theGroupBox1,"Especificações",NULL_STRING,NULL_STRING}

oDCESPECIFI := SingleLineEdit{self,ResourceID{JEQP_ESPECIFI,_GetInst()}}
oDCESPECIFI:FieldSpec := padrao_char_100{}
oDCESPECIFI:HyperLabel := HyperLabel{#ESPECIFI,"Especifi:",NULL_STRING,"ME01_ESPECIFI"}
oDCESPECIFI:BackGround := aBrushes[1]

oDCESPECIFI1 := SingleLineEdit{self,ResourceID{JEQP_ESPECIFI1,_GetInst()}}
oDCESPECIFI1:FieldSpec := padrao_char_100{}
oDCESPECIFI1:HyperLabel := HyperLabel{#ESPECIFI1,"Especifi1:",NULL_STRING,"ME01_ESPECIFI1"}
oDCESPECIFI1:BackGround := aBrushes[1]

oDCSC_NRFORNE := FixedText{self,ResourceID{JEQP_SC_NRFORNE,_GetInst()}}
oDCSC_NRFORNE:HyperLabel := HyperLabel{#SC_NRFORNE,"Fornecedor",NULL_STRING,NULL_STRING}

oDCNRFORNE := SingleLineEdit{self,ResourceID{JEQP_NRFORNE,_GetInst()}}
oDCNRFORNE:FieldSpec := padrao_num_08{}
oDCNRFORNE:HyperLabel := HyperLabel{#NRFORNE,"Nrforne:",NULL_STRING,"ME01_NRFORNE"}
oDCNRFORNE:BackGround := aBrushes[1]

oDCCOGNOME := SingleLineEdit{self,ResourceID{JEQP_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := padrao_char_12{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"ME01_COGNOME"}
oDCCOGNOME:BackGround := aBrushes[1]

oDCSC_ANO := FixedText{self,ResourceID{JEQP_SC_ANO,_GetInst()}}
oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO,"Ano Fab.:",NULL_STRING,NULL_STRING}

oDCANO := SingleLineEdit{self,ResourceID{JEQP_ANO,_GetInst()}}
oDCANO:FieldSpec := padrao_num_04{}
oDCANO:HyperLabel := HyperLabel{#ANO,"Ano:",NULL_STRING,"ME01_ANO"}
oDCANO:BackGround := aBrushes[1]

oDCSC_QTDE := FixedText{self,ResourceID{JEQP_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCQTDE := SingleLineEdit{self,ResourceID{JEQP_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := padrao_num_04{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"ME01_QTDE"}
oDCQTDE:BackGround := aBrushes[1]

oDCSC_MESES := FixedText{self,ResourceID{JEQP_SC_MESES,_GetInst()}}
oDCSC_MESES:HyperLabel := HyperLabel{#SC_MESES,"Meses:",NULL_STRING,NULL_STRING}

oDCMESES := SingleLineEdit{self,ResourceID{JEQP_MESES,_GetInst()}}
oDCMESES:FieldSpec := padrao_num_02{}
oDCMESES:HyperLabel := HyperLabel{#MESES,"Meses:",NULL_STRING,"ME01_MESES"}
oDCMESES:BackGround := aBrushes[1]

oDCSC_DATA := FixedText{self,ResourceID{JEQP_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCDATA := SingleLineEdit{self,ResourceID{JEQP_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"ME01_DATA"}
oDCDATA:BackGround := aBrushes[1]

oDCSC_VALOR := FixedText{self,ResourceID{JEQP_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor:",NULL_STRING,NULL_STRING}

oDCVALOR := SingleLineEdit{self,ResourceID{JEQP_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := padrao_num_10_2{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Valor:",NULL_STRING,"ME01_VALOR"}
oDCVALOR:BackGround := aBrushes[1]

oDCSC_TABELA := FixedText{self,ResourceID{JEQP_SC_TABELA,_GetInst()}}
oDCSC_TABELA:HyperLabel := HyperLabel{#SC_TABELA,"Tabela:",NULL_STRING,NULL_STRING}

oDCTABELA := SingleLineEdit{self,ResourceID{JEQP_TABELA,_GetInst()}}
oDCTABELA:FieldSpec := padrao_char_12{}
oDCTABELA:HyperLabel := HyperLabel{#TABELA,"Tabela:",NULL_STRING,"ME01_TABELA"}
oDCTABELA:BackGround := aBrushes[1]

oDCSC_VALOR_CONV := FixedText{self,ResourceID{JEQP_SC_VALOR_CONV,_GetInst()}}
oDCSC_VALOR_CONV:HyperLabel := HyperLabel{#SC_VALOR_CONV,"Valor Conv:",NULL_STRING,NULL_STRING}

oDCVALOR_CONV := SingleLineEdit{self,ResourceID{JEQP_VALOR_CONV,_GetInst()}}
oDCVALOR_CONV:FieldSpec := padrao_num_10_4{}
oDCVALOR_CONV:HyperLabel := HyperLabel{#VALOR_CONV,"Valor Conv:",NULL_STRING,"ME01_VALOR_CONV"}
oDCVALOR_CONV:BackGround := aBrushes[1]

oDCSC_OBSERVA := FixedText{self,ResourceID{JEQP_SC_OBSERVA,_GetInst()}}
oDCSC_OBSERVA:HyperLabel := HyperLabel{#SC_OBSERVA,"Observaçao:",NULL_STRING,NULL_STRING}

oDCOBSERVA := SingleLineEdit{self,ResourceID{JEQP_OBSERVA,_GetInst()}}
oDCOBSERVA:FieldSpec := padrao_char_40{}
oDCOBSERVA:HyperLabel := HyperLabel{#OBSERVA,"Observa:",NULL_STRING,"ME01_OBSERVA"}
oDCOBSERVA:BackGround := aBrushes[1]

oDCSC_CHM := FixedText{self,ResourceID{JEQP_SC_CHM,_GetInst()}}
oDCSC_CHM:HyperLabel := HyperLabel{#SC_CHM,"Mensal",NULL_STRING,NULL_STRING}

oDCCHM := SingleLineEdit{self,ResourceID{JEQP_CHM,_GetInst()}}
oDCCHM:FieldSpec := padrao_num_06_2{}
oDCCHM:HyperLabel := HyperLabel{#CHM,"Chm:",NULL_STRING,"ME01_CHM"}
oDCCHM:BackGround := aBrushes[1]

oDCSC_CHS := FixedText{self,ResourceID{JEQP_SC_CHS,_GetInst()}}
oDCSC_CHS:HyperLabel := HyperLabel{#SC_CHS,"Semanal",NULL_STRING,NULL_STRING}

oDCCHS := SingleLineEdit{self,ResourceID{JEQP_CHS,_GetInst()}}
oDCCHS:FieldSpec := PADRAO_NUM_06_2{}
oDCCHS:HyperLabel := HyperLabel{#CHS,"Chs:",NULL_STRING,"ME01_CHS"}
oDCCHS:BackGround := aBrushes[1]

oCCtheRadioButton5 := RadioButton{self,ResourceID{JEQP_THERADIOBUTTON5,_GetInst()}}
oCCtheRadioButton5:HyperLabel := HyperLabel{#theRadioButton5,"Sim",NULL_STRING,NULL_STRING}

oCCtheRadioButton6 := RadioButton{self,ResourceID{JEQP_THERADIOBUTTON6,_GetInst()}}
oCCtheRadioButton6:HyperLabel := HyperLabel{#theRadioButton6,"Não",NULL_STRING,NULL_STRING}

oDCSC_CH2 := FixedText{self,ResourceID{JEQP_SC_CH2,_GetInst()}}
oDCSC_CH2:HyperLabel := HyperLabel{#SC_CH2,"Segunda",NULL_STRING,NULL_STRING}

oDCSC_CH3 := FixedText{self,ResourceID{JEQP_SC_CH3,_GetInst()}}
oDCSC_CH3:HyperLabel := HyperLabel{#SC_CH3,"Terça",NULL_STRING,NULL_STRING}

oDCSC_CH4 := FixedText{self,ResourceID{JEQP_SC_CH4,_GetInst()}}
oDCSC_CH4:HyperLabel := HyperLabel{#SC_CH4,"Quarta",NULL_STRING,NULL_STRING}

oDCSC_CH5 := FixedText{self,ResourceID{JEQP_SC_CH5,_GetInst()}}
oDCSC_CH5:HyperLabel := HyperLabel{#SC_CH5,"Quinta",NULL_STRING,NULL_STRING}

oDCSC_CH6 := FixedText{self,ResourceID{JEQP_SC_CH6,_GetInst()}}
oDCSC_CH6:HyperLabel := HyperLabel{#SC_CH6,"Sexta",NULL_STRING,NULL_STRING}
oDCSC_CH6:TextColor := Color{COLORBLACK}

oDCSC_CH7 := FixedText{self,ResourceID{JEQP_SC_CH7,_GetInst()}}
oDCSC_CH7:HyperLabel := HyperLabel{#SC_CH7,"Sabado",NULL_STRING,NULL_STRING}

oDCSC_CH1 := FixedText{self,ResourceID{JEQP_SC_CH1,_GetInst()}}
oDCSC_CH1:HyperLabel := HyperLabel{#SC_CH1,"Domingo",NULL_STRING,NULL_STRING}

oDCCH2 := SingleLineEdit{self,ResourceID{JEQP_CH2,_GetInst()}}
oDCCH2:FieldSpec := PADRAO_NUM_05_2{}
oDCCH2:HyperLabel := HyperLabel{#CH2,"Ch2:",NULL_STRING,"ME01_CH2"}
oDCCH2:BackGround := aBrushes[1]

oDCCH3 := SingleLineEdit{self,ResourceID{JEQP_CH3,_GetInst()}}
oDCCH3:FieldSpec := PADRAO_NUM_05_2{}
oDCCH3:HyperLabel := HyperLabel{#CH3,"Ch3:",NULL_STRING,"ME01_CH3"}
oDCCH3:BackGround := aBrushes[1]

oDCCH4 := SingleLineEdit{self,ResourceID{JEQP_CH4,_GetInst()}}
oDCCH4:FieldSpec := PADRAO_NUM_05_2{}
oDCCH4:HyperLabel := HyperLabel{#CH4,"Ch4:",NULL_STRING,"ME01_CH4"}
oDCCH4:BackGround := aBrushes[1]

oDCCH5 := SingleLineEdit{self,ResourceID{JEQP_CH5,_GetInst()}}
oDCCH5:FieldSpec := PADRAO_NUM_05_2{}
oDCCH5:HyperLabel := HyperLabel{#CH5,"Ch5:",NULL_STRING,"ME01_CH5"}
oDCCH5:BackGround := aBrushes[1]

oDCCH6 := SingleLineEdit{self,ResourceID{JEQP_CH6,_GetInst()}}
oDCCH6:FieldSpec := PADRAO_NUM_05_2{}
oDCCH6:HyperLabel := HyperLabel{#CH6,"Ch6:",NULL_STRING,"ME01_CH6"}
oDCCH6:BackGround := aBrushes[1]

oDCCH7 := SingleLineEdit{self,ResourceID{JEQP_CH7,_GetInst()}}
oDCCH7:FieldSpec := PADRAO_NUM_05_2{}
oDCCH7:HyperLabel := HyperLabel{#CH7,"Ch7:",NULL_STRING,"ME01_CH7"}
oDCCH7:BackGround := aBrushes[1]

oDCCH1 := SingleLineEdit{self,ResourceID{JEQP_CH1,_GetInst()}}
oDCCH1:FieldSpec := PADRAO_NUM_05_2{}
oDCCH1:HyperLabel := HyperLabel{#CH1,"Ch1:",NULL_STRING,"ME01_CH1"}
oDCCH1:BackGround := aBrushes[1]

oDCTIPO := RadioButtonGroup{self,ResourceID{JEQP_TIPO,_GetInst()}}
oDCTIPO:FillUsing({ ;
					{oCCtheRadioButton1,"M"}, ;
					{oCCtheRadioButton2,"F"}, ;
					{oCCtheRadioButton4,"E"}, ;
					{oCCtheRadioButton3,"I"} ;
					})
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo do Imobilizado",NULL_STRING,NULL_STRING}
oDCTIPO:FieldSpec := padrao_char_01{}

oDCCHT := RadioButtonGroup{self,ResourceID{JEQP_CHT,_GetInst()}}
oDCCHT:FillUsing({ ;
					{oCCtheRadioButton5,"S"}, ;
					{oCCtheRadioButton6,"N"} ;
					})
oDCCHT:HyperLabel := HyperLabel{#CHT,"Cargas Horarias",NULL_STRING,NULL_STRING}
oDCCHT:FieldSpec := padrao_char_01{}

self:Caption := "Cadastro de Equipamentos"
self:HyperLabel := HyperLabel{#JEQP,"Cadastro de Equipamentos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_char_04{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBNOME := DataColumn{padrao_char_40{}}
oDBNOME:Width := 20
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)

oDBFABRICANTE := DataColumn{padrao_char_20{}}
oDBFABRICANTE:Width := 12
oDBFABRICANTE:HyperLabel := oDCFABRICANTE:HyperLabel 
oDBFABRICANTE:Caption := "Fabricante:"
oDBFABRICANTE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBFABRICANTE)

oDBGRUPO := DataColumn{padrao_char_03{}}
oDBGRUPO:Width := 7
oDBGRUPO:HyperLabel := oDCGRUPO:HyperLabel 
oDBGRUPO:Caption := "Grupo:"
oDBGRUPO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBGRUPO)

oDBSETOR := DataColumn{padrao_char_10{}}
oDBSETOR:Width := 7
oDBSETOR:HyperLabel := oDCSETOR:HyperLabel 
oDBSETOR:Caption := "Setor:"
oDBSETOR:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSETOR)

oDBMODELO := DataColumn{padrao_char_20{}}
oDBMODELO:Width := 8
oDBMODELO:HyperLabel := oDCMODELO:HyperLabel 
oDBMODELO:Caption := "Modelo:"
oDBMODELO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMODELO)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access KWH() 
return self:FieldGet(#KWH)


assign KWH(uValue) 
self:FieldPut(#KWH, uValue)
return KWH := uValue


access MESES() 
return self:FieldGet(#MESES)


assign MESES(uValue) 
self:FieldPut(#MESES, uValue)
return MESES := uValue


access MODELO() 
return self:FieldGet(#MODELO)


assign MODELO(uValue) 
self:FieldPut(#MODELO, uValue)
return MODELO := uValue


access MOTORCV() 
return self:FieldGet(#MOTORCV)


assign MOTORCV(uValue) 
self:FieldPut(#MOTORCV, uValue)
return MOTORCV := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access NRFORNE() 
return self:FieldGet(#NRFORNE)


assign NRFORNE(uValue) 
self:FieldPut(#NRFORNE, uValue)
return NRFORNE := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access NUMFAB() 
return self:FieldGet(#NUMFAB)


assign NUMFAB(uValue) 
self:FieldPut(#NUMFAB, uValue)
return NUMFAB := uValue


access OBSERVA() 
return self:FieldGet(#OBSERVA)


assign OBSERVA(uValue) 
self:FieldPut(#OBSERVA, uValue)
return OBSERVA := uValue


access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


access SETOR() 
return self:FieldGet(#SETOR)


assign SETOR(uValue) 
self:FieldPut(#SETOR, uValue)
return SETOR := uValue


access TABELA() 
return self:FieldGet(#TABELA)


assign TABELA(uValue) 
self:FieldPut(#TABELA, uValue)
return TABELA := uValue


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


access VALOR_CONV() 
return self:FieldGet(#VALOR_CONV)


assign VALOR_CONV(uValue) 
self:FieldPut(#VALOR_CONV, uValue)
return VALOR_CONV := uValue


END CLASS
