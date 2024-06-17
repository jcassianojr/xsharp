#region DEFINES
STATIC DEFINE JRD_ANO := 107 
STATIC DEFINE JRD_ANUAL := 151 
STATIC DEFINE JRD_APURAR := 120 
STATIC DEFINE JRD_BUSCAOV := 155 
STATIC DEFINE JRD_CMDTIPO := 157 
STATIC DEFINE JRD_CMDTIPO1 := 158 
STATIC DEFINE JRD_DESCR2 := 153 
STATIC DEFINE JRD_DESCRI := 108 
STATIC DEFINE JRD_DIAFIM := 137 
STATIC DEFINE JRD_DIAINI := 136 
STATIC DEFINE JRD_EQH24 := 147 
STATIC DEFINE JRD_EQHD := 122 
STATIC DEFINE JRD_EQHT := 120 
STATIC DEFINE JRD_EQITENS := 135 
STATIC DEFINE JRD_EQPE := 118 
STATIC DEFINE JRD_EQPE24 := 145 
STATIC DEFINE JRD_EQPERE := 142 
STATIC DEFINE JRD_EQPP := 119 
STATIC DEFINE JRD_EQPP24 := 144 
STATIC DEFINE JRD_EQPPRE := 141 
STATIC DEFINE JRD_EQPU := 117 
STATIC DEFINE JRD_EQPU24 := 146 
STATIC DEFINE JRD_EQPURE := 143 
STATIC DEFINE JRD_EQQP := 121 
STATIC DEFINE JRD_EQTOTAL := 144 
STATIC DEFINE JRD_FUHD := 131 
STATIC DEFINE JRD_FUHT := 129 
STATIC DEFINE JRD_FUITENS := 134 
STATIC DEFINE JRD_FUPE := 124 
STATIC DEFINE JRD_FUPP := 125 
STATIC DEFINE JRD_FUPU := 123 
STATIC DEFINE JRD_FUQP := 130 
STATIC DEFINE JRD_FUTOTAL := 146 
STATIC DEFINE JRD_GB1 := 109 
STATIC DEFINE JRD_LIMPAR := 124 
STATIC DEFINE JRD_MES := 106 
STATIC DEFINE JRD_PAHP := 162 
STATIC DEFINE JRD_PAITENS := 160 
STATIC DEFINE JRD_PEGCOM := 154 
STATIC DEFINE JRD_POITENS := 161 
STATIC DEFINE JRD_POROV := 156 
STATIC DEFINE JRD_PRPE := 150 
STATIC DEFINE JRD_PUSHBUTTON2 := 144 
STATIC DEFINE JRD_RB3 := 114 
STATIC DEFINE JRD_RD_EQPE := 128 
STATIC DEFINE JRD_SC_ANO := 105 
STATIC DEFINE JRD_SC_DIAFIM := 102 
STATIC DEFINE JRD_SC_DIAINI := 101 
STATIC DEFINE JRD_SC_MES := 104 
STATIC DEFINE JRD_SC_SEQ := 100 
STATIC DEFINE JRD_SEMES := 152 
STATIC DEFINE JRD_SEMESTRAL := 122 
STATIC DEFINE JRD_SEQ := 103 
STATIC DEFINE JRD_THEFIXEDTEXT10 := 149 
STATIC DEFINE JRD_THEFIXEDTEXT11 := 127 
STATIC DEFINE JRD_THEFIXEDTEXT12 := 126 
STATIC DEFINE JRD_THEFIXEDTEXT13 := 114 
STATIC DEFINE JRD_THEFIXEDTEXT14 := 115 
STATIC DEFINE JRD_THEFIXEDTEXT15 := 116 
STATIC DEFINE JRD_THEFIXEDTEXT16 := 128 
STATIC DEFINE JRD_THEFIXEDTEXT17 := 132 
STATIC DEFINE JRD_THEFIXEDTEXT18 := 133 
STATIC DEFINE JRD_THEFIXEDTEXT19 := 139 
STATIC DEFINE JRD_THEFIXEDTEXT20 := 140 
STATIC DEFINE JRD_THEFIXEDTEXT6 := 111 
STATIC DEFINE JRD_THEFIXEDTEXT7 := 112 
STATIC DEFINE JRD_THEFIXEDTEXT8 := 113 
STATIC DEFINE JRD_THEFIXEDTEXT9 := 138 
STATIC DEFINE JRD_THEGROUPBOX1 := 110 
STATIC DEFINE JRD_THEGROUPBOX2 := 159 
STATIC DEFINE JRD_THEGROUPBOX3 := 148 
STATIC DEFINE JTLP_ANO := 110 
STATIC DEFINE JTLP_ANUAL := 112 
STATIC DEFINE JTLP_APURAR := 120 
STATIC DEFINE JTLP_DIAINI := 104 
STATIC DEFINE JTLP_LIMPAR := 124 
STATIC DEFINE JTLP_RB3 := 114 
STATIC DEFINE JTLP_RB5 := 118 
STATIC DEFINE JTLP_SC_DESCRI := 108 
STATIC DEFINE JTLP_SC_DIAFIM := 102 
STATIC DEFINE JTLP_SC_MES := 106 
STATIC DEFINE JTLP_SC_SEQ := 100 
STATIC DEFINE JTLP_SEMES := 116 
STATIC DEFINE JTLP_SEMESTRAL := 122 
#endregion

PARTIAL class JRD inherit MYDataWindow 

	PROTECT oDBSEQ as DataColumn
	PROTECT oDBMES as DataColumn
	PROTECT oDBANO as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBANUAL as DataColumn
	PROTECT oDBSEMES as DataColumn
	PROTECT oDBDIAINI as DataColumn
	PROTECT oDBDIAFIM as DataColumn
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSC_DIAINI as FIXEDTEXT
	protect oDCSC_DIAFIM as FIXEDTEXT
	protect oDCSEQ as SINGLELINEEDIT
	protect oDCSC_MES as FIXEDTEXT
	protect oDCSC_ANO as FIXEDTEXT
	protect oDCMES as RIGHTSLE
	protect oDCANO as RIGHTSLE
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCGB1 as GROUPBOX
	protect oDCtheGroupBox1 as GROUPBOX
	protect oDCtheFixedText6 as FIXEDTEXT
	protect oDCtheFixedText7 as FIXEDTEXT
	protect oDCtheFixedText8 as FIXEDTEXT
	protect oDCtheFixedText13 as FIXEDTEXT
	protect oDCtheFixedText14 as FIXEDTEXT
	protect oDCtheFixedText15 as FIXEDTEXT
	protect oDCEQPU as RIGHTSLE
	protect oDCEQPE as RIGHTSLE
	protect oDCEQPP as RIGHTSLE
	protect oDCEQHT as RIGHTSLE
	protect oDCEQQP as RIGHTSLE
	protect oDCEQHD as RIGHTSLE
	protect oDCFUPU as RIGHTSLE
	protect oDCFUPE as RIGHTSLE
	protect oDCFUPP as RIGHTSLE
	protect oDCtheFixedText12 as FIXEDTEXT
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oDCtheFixedText16 as FIXEDTEXT
	protect oDCFUHT as RIGHTSLE
	protect oDCFUQP as RIGHTSLE
	protect oDCFUHD as RIGHTSLE
	protect oDCtheFixedText17 as FIXEDTEXT
	protect oDCtheFixedText18 as FIXEDTEXT
	protect oCCFUITENS as PUSHBUTTON
	protect oCCEQITENS as PUSHBUTTON
	protect oDCDIAINI as DATETIMEPICKER
	protect oDCDIAFIM as DATETIMEPICKER
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oDCtheFixedText19 as FIXEDTEXT
	protect oDCtheFixedText20 as FIXEDTEXT
	protect oDCEQPPRE as RIGHTSLE
	protect oDCEQPERE as RIGHTSLE
	protect oDCEQPURE as RIGHTSLE
	protect oDCEQPP24 as RIGHTSLE
	protect oDCEQPE24 as RIGHTSLE
	protect oDCEQPU24 as RIGHTSLE
	protect oDCEQH24 as RIGHTSLE
	protect oDCtheGroupBox3 as GROUPBOX
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oDCPRPE as RIGHTSLE
	protect oDCANUAL as SINGLELINEEDIT
	protect oDCSEMES as SINGLELINEEDIT
	protect oDCDESCR2 as SINGLELINEEDIT
	protect oCCpegcom as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCcmdtipo as PUSHBUTTON
	protect oCCcmdtipo1 as PUSHBUTTON
	protect oDCtheGroupBox2 as GROUPBOX
	protect oCCPAITENS as PUSHBUTTON
	protect oCCPOITENS as PUSHBUTTON
	protect oDCPAHP as RIGHTSLE
// 	instance SEQ 
// 	instance MES 
// 	instance ANO 
// 	instance DESCRI 
// 	instance EQPU 
// 	instance EQPE 
// 	instance EQPP 
// 	instance EQHT 
// 	instance EQQP 
// 	instance EQHD 
// 	instance FUPU 
// 	instance FUPE 
// 	instance FUPP 
// 	instance FUHT 
// 	instance FUQP 
// 	instance FUHD 
// 	instance EQPPRE 
// 	instance EQPERE 
// 	instance EQPURE 
// 	instance EQPP24 
// 	instance EQPE24 
// 	instance EQPU24 
// 	instance EQH24 
// 	instance PRPE 
// 	instance ANUAL 
// 	instance SEMES 
// 	instance DESCR2 
// 	instance PAHP 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANO() 
return self:FieldGet(#ANO)


assign ANO(uValue) 
self:FieldPut(#ANO, uValue)
return ANO := uValue


access ANUAL() 
return self:FieldGet(#ANUAL)


assign ANUAL(uValue) 
self:FieldPut(#ANUAL, uValue)
return ANUAL := uValue


METHOD buscaov( ) 
	SELF:KeyFind()

METHOD cmdtipo( ) 
		SELF:server:FIELDPUT("SEMES",SIMNAO(SELF:SERVER:FIELDGET("SEMES")))		

METHOD cmdtipo1( ) 
		SELF:server:FIELDPUT("ANUAL",SIMNAO(SELF:SERVER:FIELDGET("ANUAL")))		

access DESCR2() 
return self:FieldGet(#DESCR2)


assign DESCR2(uValue) 
self:FieldPut(#DESCR2, uValue)
return DESCR2 := uValue


access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


access EQH24() 
return self:FieldGet(#EQH24)


assign EQH24(uValue) 
self:FieldPut(#EQH24, uValue)
return EQH24 := uValue


access EQHD() 
return self:FieldGet(#EQHD)


assign EQHD(uValue) 
self:FieldPut(#EQHD, uValue)
return EQHD := uValue


access EQHT() 
return self:FieldGet(#EQHT)


assign EQHT(uValue) 
self:FieldPut(#EQHT, uValue)
return EQHT := uValue


access EQPE() 
return self:FieldGet(#EQPE)


assign EQPE(uValue) 
self:FieldPut(#EQPE, uValue)
return EQPE := uValue


access EQPE24() 
return self:FieldGet(#EQPE24)


assign EQPE24(uValue) 
self:FieldPut(#EQPE24, uValue)
return EQPE24 := uValue


access EQPERE() 
return self:FieldGet(#EQPERE)


assign EQPERE(uValue) 
self:FieldPut(#EQPERE, uValue)
return EQPERE := uValue


access EQPP() 
return self:FieldGet(#EQPP)


assign EQPP(uValue) 
self:FieldPut(#EQPP, uValue)
return EQPP := uValue


access EQPP24() 
return self:FieldGet(#EQPP24)


assign EQPP24(uValue) 
self:FieldPut(#EQPP24, uValue)
return EQPP24 := uValue


access EQPPRE() 
return self:FieldGet(#EQPPRE)


assign EQPPRE(uValue) 
self:FieldPut(#EQPPRE, uValue)
return EQPPRE := uValue


access EQPU() 
return self:FieldGet(#EQPU)


assign EQPU(uValue) 
self:FieldPut(#EQPU, uValue)
return EQPU := uValue


access EQPU24() 
return self:FieldGet(#EQPU24)


assign EQPU24(uValue) 
self:FieldPut(#EQPU24, uValue)
return EQPU24 := uValue


access EQPURE() 
return self:FieldGet(#EQPURE)


assign EQPURE(uValue) 
self:FieldPut(#EQPURE, uValue)
return EQPURE := uValue


access EQQP() 
return self:FieldGet(#EQQP)


assign EQQP(uValue) 
self:FieldPut(#EQQP, uValue)
return EQQP := uValue


access FUHD() 
return self:FieldGet(#FUHD)


assign FUHD(uValue) 
self:FieldPut(#FUHD, uValue)
return FUHD := uValue


access FUHT() 
return self:FieldGet(#FUHT)


assign FUHT(uValue) 
self:FieldPut(#FUHT, uValue)
return FUHT := uValue


access FUPE() 
return self:FieldGet(#FUPE)


assign FUPE(uValue) 
self:FieldPut(#FUPE, uValue)
return FUPE := uValue


access FUPP() 
return self:FieldGet(#FUPP)


assign FUPP(uValue) 
self:FieldPut(#FUPP, uValue)
return FUPP := uValue


access FUPU() 
return self:FieldGet(#FUPU)


assign FUPU(uValue) 
self:FieldPut(#FUPU, uValue)
return FUPU := uValue


access FUQP() 
return self:FieldGet(#FUQP)


assign FUQP(uValue) 
self:FieldPut(#FUQP, uValue)
return FUQP := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRD",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_SEQ := FixedText{self,ResourceID{JRD_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSC_DIAINI := FixedText{self,ResourceID{JRD_SC_DIAINI,_GetInst()}}
oDCSC_DIAINI:HyperLabel := HyperLabel{#SC_DIAINI,"Início",NULL_STRING,NULL_STRING}

oDCSC_DIAFIM := FixedText{self,ResourceID{JRD_SC_DIAFIM,_GetInst()}}
oDCSC_DIAFIM:HyperLabel := HyperLabel{#SC_DIAFIM,"Fim",NULL_STRING,NULL_STRING}

oDCSEQ := SingleLineEdit{self,ResourceID{JRD_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := padrao_num_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"CRTLP_SEQ"}
oDCSEQ:BackGround := aBrushes[1]

oDCSC_MES := FixedText{self,ResourceID{JRD_SC_MES,_GetInst()}}
oDCSC_MES:HyperLabel := HyperLabel{#SC_MES,"Mês:",NULL_STRING,NULL_STRING}

oDCSC_ANO := FixedText{self,ResourceID{JRD_SC_ANO,_GetInst()}}
oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO,"Ano:",NULL_STRING,NULL_STRING}

oDCMES := rightSle{self,ResourceID{JRD_MES,_GetInst()}}
oDCMES:FieldSpec := padrao_num_02{}
oDCMES:HyperLabel := HyperLabel{#MES,"Mes:",NULL_STRING,"CRTLP_MES"}
oDCMES:BackGround := aBrushes[1]

oDCANO := rightSle{self,ResourceID{JRD_ANO,_GetInst()}}
oDCANO:FieldSpec := padrao_num_04{}
oDCANO:HyperLabel := HyperLabel{#ANO,"Ano:",NULL_STRING,"CRTLP_ANO"}
oDCANO:BackGround := aBrushes[1]

oDCDESCRI := SingleLineEdit{self,ResourceID{JRD_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := padrao_char_30{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Competencia",NULL_STRING,"CRTLP_DESCRI"}
oDCDESCRI:BackGround := aBrushes[1]

oDCGB1 := GroupBox{self,ResourceID{JRD_GB1,_GetInst()}}
oDCGB1:HyperLabel := HyperLabel{#GB1,"Resumo Equipamentos",NULL_STRING,NULL_STRING}

oDCtheGroupBox1 := GroupBox{self,ResourceID{JRD_THEGROUPBOX1,_GetInst()}}
oDCtheGroupBox1:HyperLabel := HyperLabel{#theGroupBox1,"Resumo Funcionários",NULL_STRING,NULL_STRING}

oDCtheFixedText6 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT6,_GetInst()}}
oDCtheFixedText6:HyperLabel := HyperLabel{#theFixedText6,"Utilização",NULL_STRING,NULL_STRING}

oDCtheFixedText7 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT7,_GetInst()}}
oDCtheFixedText7:HyperLabel := HyperLabel{#theFixedText7,"Eficiencia",NULL_STRING,NULL_STRING}

oDCtheFixedText8 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT8,_GetInst()}}
oDCtheFixedText8:HyperLabel := HyperLabel{#theFixedText8,"Produtividade",NULL_STRING,NULL_STRING}

oDCtheFixedText13 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Utilização",NULL_STRING,NULL_STRING}

oDCtheFixedText14 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT14,_GetInst()}}
oDCtheFixedText14:HyperLabel := HyperLabel{#theFixedText14,"Eficiencia",NULL_STRING,NULL_STRING}

oDCtheFixedText15 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT15,_GetInst()}}
oDCtheFixedText15:HyperLabel := HyperLabel{#theFixedText15,"Produtividade",NULL_STRING,NULL_STRING}

oDCEQPU := rightSle{self,ResourceID{JRD_EQPU,_GetInst()}}
oDCEQPU:HyperLabel := HyperLabel{#EQPU,NULL_STRING,NULL_STRING,NULL_STRING}
oDCEQPU:FieldSpec := padrao_num_10_2{}

oDCEQPE := rightSle{self,ResourceID{JRD_EQPE,_GetInst()}}
oDCEQPE:FieldSpec := padrao_num_10_2{}
oDCEQPE:HyperLabel := HyperLabel{#EQPE,NULL_STRING,NULL_STRING,NULL_STRING}

oDCEQPP := rightSle{self,ResourceID{JRD_EQPP,_GetInst()}}
oDCEQPP:FieldSpec := padrao_num_10_2{}
oDCEQPP:HyperLabel := HyperLabel{#EQPP,NULL_STRING,NULL_STRING,NULL_STRING}

oDCEQHT := rightSle{self,ResourceID{JRD_EQHT,_GetInst()}}
oDCEQHT:FieldSpec := padrao_num_10_2{}
oDCEQHT:HyperLabel := HyperLabel{#EQHT,NULL_STRING,NULL_STRING,NULL_STRING}

oDCEQQP := rightSle{self,ResourceID{JRD_EQQP,_GetInst()}}
oDCEQQP:FieldSpec := padrao_num_10{}
oDCEQQP:HyperLabel := HyperLabel{#EQQP,NULL_STRING,NULL_STRING,NULL_STRING}

oDCEQHD := rightSle{self,ResourceID{JRD_EQHD,_GetInst()}}
oDCEQHD:FieldSpec := padrao_num_10_2{}
oDCEQHD:HyperLabel := HyperLabel{#EQHD,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFUPU := rightSle{self,ResourceID{JRD_FUPU,_GetInst()}}
oDCFUPU:FieldSpec := padrao_num_10_2{}
oDCFUPU:HyperLabel := HyperLabel{#FUPU,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFUPE := rightSle{self,ResourceID{JRD_FUPE,_GetInst()}}
oDCFUPE:FieldSpec := padrao_num_10_2{}
oDCFUPE:HyperLabel := HyperLabel{#FUPE,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFUPP := rightSle{self,ResourceID{JRD_FUPP,_GetInst()}}
oDCFUPP:FieldSpec := padrao_num_10_2{}
oDCFUPP:HyperLabel := HyperLabel{#FUPP,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText12 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT12,_GetInst()}}
oDCtheFixedText12:HyperLabel := HyperLabel{#theFixedText12,"Qtd.Prod.",NULL_STRING,NULL_STRING}

oDCtheFixedText11 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Horas",NULL_STRING,NULL_STRING}

oDCtheFixedText16 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT16,_GetInst()}}
oDCtheFixedText16:HyperLabel := HyperLabel{#theFixedText16,"Hrs.Trab",NULL_STRING,NULL_STRING}

oDCFUHT := rightSle{self,ResourceID{JRD_FUHT,_GetInst()}}
oDCFUHT:FieldSpec := padrao_num_10_2{}
oDCFUHT:HyperLabel := HyperLabel{#FUHT,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFUQP := rightSle{self,ResourceID{JRD_FUQP,_GetInst()}}
oDCFUQP:FieldSpec := padrao_num_10{}
oDCFUQP:HyperLabel := HyperLabel{#FUQP,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFUHD := rightSle{self,ResourceID{JRD_FUHD,_GetInst()}}
oDCFUHD:FieldSpec := padrao_num_10_2{}
oDCFUHD:HyperLabel := HyperLabel{#FUHD,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText17 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT17,_GetInst()}}
oDCtheFixedText17:HyperLabel := HyperLabel{#theFixedText17,"Qtd.Prod.",NULL_STRING,NULL_STRING}

oDCtheFixedText18 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT18,_GetInst()}}
oDCtheFixedText18:HyperLabel := HyperLabel{#theFixedText18,"Hrs.Dispon.",NULL_STRING,NULL_STRING}

oCCFUITENS := PushButton{self,ResourceID{JRD_FUITENS,_GetInst()}}
oCCFUITENS:HyperLabel := HyperLabel{#FUITENS,"Itens",NULL_STRING,NULL_STRING}

oCCEQITENS := PushButton{self,ResourceID{JRD_EQITENS,_GetInst()}}
oCCEQITENS:HyperLabel := HyperLabel{#EQITENS,"Itens",NULL_STRING,NULL_STRING}

oDCDIAINI := DateTimePicker{self,ResourceID{JRD_DIAINI,_GetInst()}}
oDCDIAINI:FieldSpec := date_field{}
oDCDIAINI:HyperLabel := HyperLabel{#DIAINI,"Inicial",NULL_STRING,NULL_STRING}

oDCDIAFIM := DateTimePicker{self,ResourceID{JRD_DIAFIM,_GetInst()}}
oDCDIAFIM:FieldSpec := date_field{}
oDCDIAFIM:HyperLabel := HyperLabel{#DIAFIM,"Final",NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Escala",NULL_STRING,NULL_STRING}

oDCtheFixedText19 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT19,_GetInst()}}
oDCtheFixedText19:HyperLabel := HyperLabel{#theFixedText19,"Apurada",NULL_STRING,NULL_STRING}

oDCtheFixedText20 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT20,_GetInst()}}
oDCtheFixedText20:HyperLabel := HyperLabel{#theFixedText20,"Escala 24h",NULL_STRING,NULL_STRING}

oDCEQPPRE := rightSle{self,ResourceID{JRD_EQPPRE,_GetInst()}}
oDCEQPPRE:FieldSpec := padrao_num_10_2{}
oDCEQPPRE:HyperLabel := HyperLabel{#EQPPRE,NULL_STRING,NULL_STRING,NULL_STRING}

oDCEQPERE := rightSle{self,ResourceID{JRD_EQPERE,_GetInst()}}
oDCEQPERE:FieldSpec := padrao_num_10_2{}
oDCEQPERE:HyperLabel := HyperLabel{#EQPERE,NULL_STRING,NULL_STRING,NULL_STRING}

oDCEQPURE := rightSle{self,ResourceID{JRD_EQPURE,_GetInst()}}
oDCEQPURE:FieldSpec := padrao_num_10_2{}
oDCEQPURE:HyperLabel := HyperLabel{#EQPURE,NULL_STRING,NULL_STRING,NULL_STRING}

oDCEQPP24 := rightSle{self,ResourceID{JRD_EQPP24,_GetInst()}}
oDCEQPP24:FieldSpec := padrao_num_10_2{}
oDCEQPP24:HyperLabel := HyperLabel{#EQPP24,NULL_STRING,NULL_STRING,NULL_STRING}

oDCEQPE24 := rightSle{self,ResourceID{JRD_EQPE24,_GetInst()}}
oDCEQPE24:FieldSpec := padrao_num_10_2{}
oDCEQPE24:HyperLabel := HyperLabel{#EQPE24,NULL_STRING,NULL_STRING,NULL_STRING}

oDCEQPU24 := rightSle{self,ResourceID{JRD_EQPU24,_GetInst()}}
oDCEQPU24:FieldSpec := padrao_num_10_2{}
oDCEQPU24:HyperLabel := HyperLabel{#EQPU24,NULL_STRING,NULL_STRING,NULL_STRING}

oDCEQH24 := rightSle{self,ResourceID{JRD_EQH24,_GetInst()}}
oDCEQH24:FieldSpec := padrao_num_10_2{}
oDCEQH24:HyperLabel := HyperLabel{#EQH24,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheGroupBox3 := GroupBox{self,ResourceID{JRD_THEGROUPBOX3,_GetInst()}}
oDCtheGroupBox3:HyperLabel := HyperLabel{#theGroupBox3,"Produto",NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{self,ResourceID{JRD_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"Eficiencia",NULL_STRING,NULL_STRING}

oDCPRPE := rightSle{self,ResourceID{JRD_PRPE,_GetInst()}}
oDCPRPE:FieldSpec := padrao_num_10_2{}
oDCPRPE:HyperLabel := HyperLabel{#PRPE,NULL_STRING,NULL_STRING,NULL_STRING}

oDCANUAL := SingleLineEdit{self,ResourceID{JRD_ANUAL,_GetInst()}}
oDCANUAL:FieldSpec := padrao_char_01{}
oDCANUAL:HyperLabel := HyperLabel{#ANUAL,"Anual:",NULL_STRING,"RD_ANUAL"}
oDCANUAL:BackGround := aBrushes[1]
oDCANUAL:Font(aFonts[1], FALSE)

oDCSEMES := SingleLineEdit{self,ResourceID{JRD_SEMES,_GetInst()}}
oDCSEMES:FieldSpec := padrao_char_01{}
oDCSEMES:HyperLabel := HyperLabel{#SEMES,"Semes:",NULL_STRING,"RD_SEMES"}
oDCSEMES:BackGround := aBrushes[1]
oDCSEMES:Font(aFonts[1], FALSE)

oDCDESCR2 := SingleLineEdit{self,ResourceID{JRD_DESCR2,_GetInst()}}
oDCDESCR2:FieldSpec := padrao_char_10{}
oDCDESCR2:HyperLabel := HyperLabel{#DESCR2,"Competencia",NULL_STRING,"CRTLP_DESCRI"}
oDCDESCR2:BackGround := aBrushes[1]

oCCpegcom := PushButton{self,ResourceID{JRD_PEGCOM,_GetInst()}}
oCCpegcom:HyperLabel := HyperLabel{#pegcom,"-->",NULL_STRING,NULL_STRING}

oCCbuscaov := PushButton{self,ResourceID{JRD_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ICO_FIND{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaov:TooltipText := "Clique Para Localizar Por Numero"

oCCporov := PushButton{self,ResourceID{JRD_POROV,_GetInst()}}
oCCporov:Image := ico_az{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Ordenar"

oCCcmdtipo := PushButton{self,ResourceID{JRD_CMDTIPO,_GetInst()}}
oCCcmdtipo:HyperLabel := HyperLabel{#cmdtipo,"Semestral Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdtipo1 := PushButton{self,ResourceID{JRD_CMDTIPO1,_GetInst()}}
oCCcmdtipo1:HyperLabel := HyperLabel{#cmdtipo1,"Anual Sim/Nao",NULL_STRING,NULL_STRING}

oDCtheGroupBox2 := GroupBox{self,ResourceID{JRD_THEGROUPBOX2,_GetInst()}}
oDCtheGroupBox2:HyperLabel := HyperLabel{#theGroupBox2,"Paradas",NULL_STRING,NULL_STRING}

oCCPAITENS := PushButton{self,ResourceID{JRD_PAITENS,_GetInst()}}
oCCPAITENS:HyperLabel := HyperLabel{#PAITENS,"Itens",NULL_STRING,NULL_STRING}

oCCPOITENS := PushButton{self,ResourceID{JRD_POITENS,_GetInst()}}
oCCPOITENS:HyperLabel := HyperLabel{#POITENS,"Outras",NULL_STRING,NULL_STRING}

oDCPAHP := rightSle{self,ResourceID{JRD_PAHP,_GetInst()}}
oDCPAHP:FieldSpec := padrao_num_10_2{}
oDCPAHP:HyperLabel := HyperLabel{#PAHP,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Sequencia de Apurações"
self:HyperLabel := HyperLabel{#JRD,"Sequencia de Apurações",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBSEQ := DataColumn{padrao_num_03{}}
oDBSEQ:Width := 6
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
oDBSEQ:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSEQ)

oDBMES := DataColumn{padrao_num_02{}}
oDBMES:Width := 6
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "Mes:"
oDBMES:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMES)

oDBANO := DataColumn{padrao_num_04{}}
oDBANO:Width := 10
oDBANO:HyperLabel := oDCANO:HyperLabel 
oDBANO:Caption := "Ano:"
oDBANO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBANO)

oDBDESCRI := DataColumn{padrao_char_30{}}
oDBDESCRI:Width := 13
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Competencia"
oDBDESCRI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDESCRI)

oDBANUAL := DataColumn{padrao_char_01{}}
oDBANUAL:Width := 7
oDBANUAL:HyperLabel := oDCANUAL:HyperLabel 
oDBANUAL:Caption := "Anual:"
oDBANUAL:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBANUAL)

oDBSEMES := DataColumn{padrao_char_01{}}
oDBSEMES:Width := 7
oDBSEMES:HyperLabel := oDCSEMES:HyperLabel 
oDBSEMES:Caption := "Semes:"
oDBSEMES:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSEMES)

oDBDIAINI := DataColumn{date_field{}}
oDBDIAINI:Width := 12
oDBDIAINI:HyperLabel := oDCDIAINI:HyperLabel 
oDBDIAINI:Caption := "Inicial"
self:Browser:AddColumn(oDBDIAINI)

oDBDIAFIM := DataColumn{date_field{}}
oDBDIAFIM:Width := 12
oDBDIAFIM:HyperLabel := oDCDIAFIM:HyperLabel 
oDBDIAFIM:Caption := "Final"
self:Browser:AddColumn(oDBDIAFIM)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MES() 
return self:FieldGet(#MES)


assign MES(uValue) 
self:FieldPut(#MES, uValue)
return MES := uValue


access PAHP() 
return self:FieldGet(#PAHP)


assign PAHP(uValue) 
self:FieldPut(#PAHP, uValue)
return PAHP := uValue


METHOD porov( ) 
	SELF:KeyFind()

access PRPE() 
return self:FieldGet(#PRPE)


assign PRPE(uValue) 
self:FieldPut(#PRPE, uValue)
return PRPE := uValue


ACCESS RD_EQPE() 
RETURN self:FieldGet(#RD_EQPE)


access SEMES() 
return self:FieldGet(#SEMES)


assign SEMES(uValue) 
self:FieldPut(#SEMES, uValue)
return SEMES := uValue


access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


END CLASS
