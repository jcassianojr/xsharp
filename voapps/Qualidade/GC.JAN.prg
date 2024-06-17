#region DEFINES
STATIC DEFINE JGC_ACP := 162 
STATIC DEFINE JGC_AEP := 159 
STATIC DEFINE JGC_BTNPEGMA01 := 153 
STATIC DEFINE JGC_BTNPEGMS01 := 154 
STATIC DEFINE JGC_BTNPEGMS06 := 155 
STATIC DEFINE JGC_BUSCANUM := 152 
STATIC DEFINE JGC_CARAC := 106 
STATIC DEFINE JGC_CLIENTE := 100 
STATIC DEFINE JGC_CLINOME := 101 
STATIC DEFINE JGC_CODIGO := 102 
STATIC DEFINE JGC_CODME01 := 113 
STATIC DEFINE JGC_CODME04 := 111 
STATIC DEFINE JGC_ESCCOD := 150 
STATIC DEFINE JGC_ESCFOR := 149 
STATIC DEFINE JGC_ESPEC := 107 
STATIC DEFINE JGC_FOTO := 167 
STATIC DEFINE JGC_FREQ := 108 
STATIC DEFINE JGC_GC := 145 
STATIC DEFINE JGC_GROUPBOX1 := 156 
STATIC DEFINE JGC_GROUPBOX2 := 157 
STATIC DEFINE JGC_GROUPBOX3 := 158 
STATIC DEFINE JGC_IMPACP := 163 
STATIC DEFINE JGC_IMPAEP := 164 
STATIC DEFINE JGC_LIC := 121 
STATIC DEFINE JGC_LIE := 119 
STATIC DEFINE JGC_LSC := 122 
STATIC DEFINE JGC_LSCR := 124 
STATIC DEFINE JGC_LSE := 120 
STATIC DEFINE JGC_NOME := 103 
STATIC DEFINE JGC_NOMME01 := 114 
STATIC DEFINE JGC_NOMME04 := 112 
STATIC DEFINE JGC_OBS := 125 
STATIC DEFINE JGC_POROV := 151 
STATIC DEFINE JGC_RMAX := 118 
STATIC DEFINE JGC_SC_CARAC := 133 
STATIC DEFINE JGC_SC_CLIENTE := 129 
STATIC DEFINE JGC_SC_CLIENTE1 := 160 
STATIC DEFINE JGC_SC_CLIENTE2 := 161 
STATIC DEFINE JGC_SC_CODIGO := 130 
STATIC DEFINE JGC_SC_DESTINO2 := 166 
STATIC DEFINE JGC_SC_EQU := 144 
STATIC DEFINE JGC_SC_ESPEC := 134 
STATIC DEFINE JGC_SC_FREQ := 126 
STATIC DEFINE JGC_SC_GC := 128 
STATIC DEFINE JGC_SC_INSTRU1 := 148 
STATIC DEFINE JGC_SC_LIC := 137 
STATIC DEFINE JGC_SC_LIE := 139 
STATIC DEFINE JGC_SC_LSC := 138 
STATIC DEFINE JGC_SC_LSCR := 143 
STATIC DEFINE JGC_SC_LSE := 140 
STATIC DEFINE JGC_SC_SEQ := 131 
STATIC DEFINE JGC_SC_SSQ := 132 
STATIC DEFINE JGC_SC_SSQ1 := 165 
STATIC DEFINE JGC_SC_TAM := 135 
STATIC DEFINE JGC_SC_UNIDME := 127 
STATIC DEFINE JGC_SC_VALR := 142 
STATIC DEFINE JGC_SC_VALR1 := 146 
STATIC DEFINE JGC_SC_VALX := 136 
STATIC DEFINE JGC_SC_VDIV1 := 147 
STATIC DEFINE JGC_SC_VINI := 141 
STATIC DEFINE JGC_SEQ := 104 
STATIC DEFINE JGC_SSQ := 105 
STATIC DEFINE JGC_TAM := 109 
STATIC DEFINE JGC_UNIDME := 110 
STATIC DEFINE JGC_VALR := 123 
STATIC DEFINE JGC_VALX := 115 
STATIC DEFINE JGC_VINI := 116 
STATIC DEFINE JGC_VMAX := 117 
#endregion

PARTIAL class JGC inherit MYDataWindow 

	PROTECT oDBGC as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCLINOME as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBSEQ as DataColumn
	PROTECT oDBSSQ as DataColumn
	PROTECT oDBCARAC as DataColumn
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCCLINOME as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSEQ as SINGLELINEEDIT
	protect oDCSSQ as SINGLELINEEDIT
	protect oDCCARAC as SINGLELINEEDIT
	protect oDCESPEC as SINGLELINEEDIT
	protect oDCFREQ as SINGLELINEEDIT
	protect oDCTAM as SINGLELINEEDIT
	protect oDCUNIDME as SINGLELINEEDIT
	protect oDCCODME04 as COMBOBOX
	protect oDCNOMME04 as SINGLELINEEDIT
	protect oDCCODME01 as COMBOBOX
	protect oDCNOMME01 as SINGLELINEEDIT
	protect oDCVALX as SINGLELINEEDIT
	protect oDCVINI as SINGLELINEEDIT
	protect oDCVMAX as SINGLELINEEDIT
	protect oDCRMAX as SINGLELINEEDIT
	protect oDCLIE as SINGLELINEEDIT
	protect oDCLSE as SINGLELINEEDIT
	protect oDCLIC as SINGLELINEEDIT
	protect oDCLSC as SINGLELINEEDIT
	protect oDCVALR as SINGLELINEEDIT
	protect oDCLSCR as SINGLELINEEDIT
	protect oDCobs as SINGLELINEEDIT
	protect oDCSC_FREQ as FIXEDTEXT
	protect oDCSC_UNIDME as FIXEDTEXT
	protect oDCSC_GC as FIXEDTEXT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSC_SSQ as FIXEDTEXT
	protect oDCSC_CARAC as FIXEDTEXT
	protect oDCSC_ESPEC as FIXEDTEXT
	protect oDCSC_TAM as FIXEDTEXT
	protect oDCSC_VALX as FIXEDTEXT
	protect oDCSC_LIC as FIXEDTEXT
	protect oDCSC_LSC as FIXEDTEXT
	protect oDCSC_LIE as FIXEDTEXT
	protect oDCSC_LSE as FIXEDTEXT
	protect oDCSC_VINI as FIXEDTEXT
	protect oDCSC_VALR as FIXEDTEXT
	protect oDCSC_LSCR as FIXEDTEXT
	protect oDCSC_EQU as FIXEDTEXT
	protect oDCGC as SINGLELINEEDIT
	protect oDCSC_VALR1 as FIXEDTEXT
	protect oDCSC_VDIV1 as FIXEDTEXT
	protect oDCSC_INSTRU1 as FIXEDTEXT
	protect oCCescfor as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oCCbtnpegma01 as PUSHBUTTON
	protect oCCbtnpegms01 as PUSHBUTTON
	protect oCCbtnpegms06 as PUSHBUTTON
	protect oDCGroupBox1 as GROUPBOX
	protect oDCGroupBox2 as GROUPBOX
	protect oDCGroupBox3 as GROUPBOX
	protect oDCAEP as SINGLELINEEDIT
	protect oDCSC_CLIENTE1 as FIXEDTEXT
	protect oDCSC_CLIENTE2 as FIXEDTEXT
	protect oDCACP as SINGLELINEEDIT
	protect oCCImpacp as PUSHBUTTON
	protect oCCImpaep as PUSHBUTTON
	protect oDCSC_SSQ1 as FIXEDTEXT
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
// 	instance CLIENTE 
// 	instance CLINOME 
// 	instance CODIGO 
// 	instance NOME 
// 	instance SEQ 
// 	instance SSQ 
// 	instance CARAC 
// 	instance ESPEC 
// 	instance FREQ 
// 	instance TAM 
// 	instance UNIDME 
// 	instance CODME04 
// 	instance NOMME04 
// 	instance CODME01 
// 	instance NOMME01 
// 	instance VALX 
// 	instance VINI 
// 	instance VMAX 
// 	instance RMAX 
// 	instance LIE 
// 	instance LSE 
// 	instance LIC 
// 	instance LSC 
// 	instance VALR 
// 	instance LSCR 
// 	instance obs 
// 	instance GC 
// 	instance AEP 
// 	instance ACP 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

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


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODME01() 
return self:FieldGet(#CODME01)


assign CODME01(uValue) 
self:FieldPut(#CODME01, uValue)
return CODME01 := uValue


access CODME04() 
return self:FieldGet(#CODME04)


assign CODME04(uValue) 
self:FieldPut(#CODME04, uValue)
return CODME04 := uValue


access ESPEC() 
return self:FieldGet(#ESPEC)


assign ESPEC(uValue) 
self:FieldPut(#ESPEC, uValue)
return ESPEC := uValue


access FREQ() 
return self:FieldGet(#FREQ)


assign FREQ(uValue) 
self:FieldPut(#FREQ, uValue)
return FREQ := uValue


access GC() 
return self:FieldGet(#GC)


assign GC(uValue) 
self:FieldPut(#GC, uValue)
return GC := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JGC",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCCLIENTE := SingleLineEdit{self,ResourceID{JGC_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := padrao_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"Gc_CLIENTE"}
oDCCLIENTE:TooltipText := "Codigo do Cliente"

oDCCLINOME := SingleLineEdit{self,ResourceID{JGC_CLINOME,_GetInst()}}
oDCCLINOME:FieldSpec := padrao_CHAR_50{}
oDCCLINOME:HyperLabel := HyperLabel{#CLINOME,"Clinome:",NULL_STRING,"Gc_CLINOME"}
oDCCLINOME:TooltipText := "Nome do Cliente"

oDCCODIGO := SingleLineEdit{self,ResourceID{JGC_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"Gc_CODIGO"}
oDCCODIGO:TooltipText := "Codigo do Produto"

oDCNOME := SingleLineEdit{self,ResourceID{JGC_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"Gc_NOME"}
oDCNOME:TooltipText := "Nome do Produto"

oDCSEQ := SingleLineEdit{self,ResourceID{JGC_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := padrao_NUM_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"Gc_SEQ"}
oDCSEQ:TooltipText := "Sequencia da Operaçao"

oDCSSQ := SingleLineEdit{self,ResourceID{JGC_SSQ,_GetInst()}}
oDCSSQ:FieldSpec := padrao_NUM_03{}
oDCSSQ:HyperLabel := HyperLabel{#SSQ,"Ssq:",NULL_STRING,"Gc_SSQ"}
oDCSSQ:TooltipText := "Sub Sequencia Operaçao"

oDCCARAC := SingleLineEdit{self,ResourceID{JGC_CARAC,_GetInst()}}
oDCCARAC:FieldSpec := padrao_CHAR_50{}
oDCCARAC:HyperLabel := HyperLabel{#CARAC,"Carac:",NULL_STRING,"Gc_CARAC"}
oDCCARAC:TooltipText := "Descritivo da Operaçao"

oDCESPEC := SingleLineEdit{self,ResourceID{JGC_ESPEC,_GetInst()}}
oDCESPEC:FieldSpec := padrao_CHAR_30{}
oDCESPEC:HyperLabel := HyperLabel{#ESPEC,"Espec:",NULL_STRING,"Gc_ESPEC"}
oDCESPEC:TooltipText := "Especificação"

oDCFREQ := SingleLineEdit{self,ResourceID{JGC_FREQ,_GetInst()}}
oDCFREQ:FieldSpec := padrao_CHAR_10{}
oDCFREQ:HyperLabel := HyperLabel{#FREQ,"Freq:",NULL_STRING,"Gc_FREQ"}
oDCFREQ:TooltipText := "Frequencia"

oDCTAM := SingleLineEdit{self,ResourceID{JGC_TAM,_GetInst()}}
oDCTAM:FieldSpec := padrao_CHAR_10{}
oDCTAM:HyperLabel := HyperLabel{#TAM,"Tam:",NULL_STRING,"Gc_TAM"}
oDCTAM:TooltipText := "Tamanho da Amostra"

oDCUNIDME := SingleLineEdit{self,ResourceID{JGC_UNIDME,_GetInst()}}
oDCUNIDME:FieldSpec := padrao_char_10{}
oDCUNIDME:HyperLabel := HyperLabel{#UNIDME,"char_10",NULL_STRING,"Gc_UNIDME"}

oDCCODME04 := combobox{self,ResourceID{JGC_CODME04,_GetInst()}}
oDCCODME04:HyperLabel := HyperLabel{#CODME04,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCODME04:FillUsing(Self:TABINS( ))
oDCCODME04:FieldSpec := padrao_CHAR_08{}
oDCCODME04:TooltipText := "Tipo do Instrumento"

oDCNOMME04 := SingleLineEdit{self,ResourceID{JGC_NOMME04,_GetInst()}}
oDCNOMME04:FieldSpec := padrao_CHAR_40{}
oDCNOMME04:HyperLabel := HyperLabel{#NOMME04,"Nomme04:",NULL_STRING,"Gc_NOMME04"}
oDCNOMME04:TooltipText := "Descritivo do Instrumento"

oDCCODME01 := combobox{self,ResourceID{JGC_CODME01,_GetInst()}}
oDCCODME01:HyperLabel := HyperLabel{#CODME01,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCODME01:FillUsing(Self:PEGMP01( ))
oDCCODME01:FieldSpec := padrao_CHAR_12{}
oDCCODME01:TooltipText := "Codigo do Equipamento/Maquina"

oDCNOMME01 := SingleLineEdit{self,ResourceID{JGC_NOMME01,_GetInst()}}
oDCNOMME01:FieldSpec := padrao_CHAR_40{}
oDCNOMME01:HyperLabel := HyperLabel{#NOMME01,"Nomme01:",NULL_STRING,"Gc_NOMME01"}
oDCNOMME01:TooltipText := "Descritivo do Equipamento/Maquina"

oDCVALX := SingleLineEdit{self,ResourceID{JGC_VALX,_GetInst()}}
oDCVALX:FieldSpec := padrao_num_09_4{}
oDCVALX:HyperLabel := HyperLabel{#VALX,"Valx:",NULL_STRING,"Gc_VALX"}
oDCVALX:TooltipText := "Valor Nominal"

oDCVINI := SingleLineEdit{self,ResourceID{JGC_VINI,_GetInst()}}
oDCVINI:FieldSpec := padrao_num_09_4{}
oDCVINI:HyperLabel := HyperLabel{#VINI,"Vini:",NULL_STRING,"Gc_VINI"}
oDCVINI:TooltipText := "Ponto Minimo Para o Grafico"

oDCVMAX := SingleLineEdit{self,ResourceID{JGC_VMAX,_GetInst()}}
oDCVMAX:FieldSpec := padrao_num_09_4{}
oDCVMAX:HyperLabel := HyperLabel{#VMAX,"Vdiv:",NULL_STRING,"Gc_VDIV"}
oDCVMAX:TooltipText := "Ponto Maximo Para o Grafico"

oDCRMAX := SingleLineEdit{self,ResourceID{JGC_RMAX,_GetInst()}}
oDCRMAX:FieldSpec := padrao_num_07_4{}
oDCRMAX:HyperLabel := HyperLabel{#RMAX,"Valr:",NULL_STRING,"Gc_VALR"}
oDCRMAX:TooltipText := "Valor de R Maximo Para o Grafico"

oDCLIE := SingleLineEdit{self,ResourceID{JGC_LIE,_GetInst()}}
oDCLIE:FieldSpec := padrao_Num_09_4{}
oDCLIE:HyperLabel := HyperLabel{#LIE,"Lie:",NULL_STRING,"Gc_LIE"}
oDCLIE:TooltipText := "Limite Inferior Especificado(Engenharia)"

oDCLSE := SingleLineEdit{self,ResourceID{JGC_LSE,_GetInst()}}
oDCLSE:FieldSpec := padrao_num_09_4{}
oDCLSE:HyperLabel := HyperLabel{#LSE,"Lse:",NULL_STRING,"Gc_LSE"}
oDCLSE:TooltipText := "Limite Superior Especificado(Engenharia)"

oDCLIC := SingleLineEdit{self,ResourceID{JGC_LIC,_GetInst()}}
oDCLIC:FieldSpec := padrao_num_09_4{}
oDCLIC:HyperLabel := HyperLabel{#LIC,"Lic:",NULL_STRING,"Gc_LIC"}
oDCLIC:TooltipText := "Limite Inferior Calculado"

oDCLSC := SingleLineEdit{self,ResourceID{JGC_LSC,_GetInst()}}
oDCLSC:FieldSpec := padrao_num_09_4{}
oDCLSC:HyperLabel := HyperLabel{#LSC,"Lsc:",NULL_STRING,"Gc_LSC"}
oDCLSC:TooltipText := "Limite Superior Calculado"

oDCVALR := SingleLineEdit{self,ResourceID{JGC_VALR,_GetInst()}}
oDCVALR:FieldSpec := padrao_num_07_4{}
oDCVALR:HyperLabel := HyperLabel{#VALR,"Valr:",NULL_STRING,"Gc_VALR"}
oDCVALR:TooltipText := "Valor de R (Ref Grafico)"

oDCLSCR := SingleLineEdit{self,ResourceID{JGC_LSCR,_GetInst()}}
oDCLSCR:FieldSpec := padrao_num_07_4{}
oDCLSCR:HyperLabel := HyperLabel{#LSCR,"Lscr:",NULL_STRING,"Gc_LSCR"}
oDCLSCR:TooltipText := "Limite Superior Calculado R"

oDCobs := SingleLineEdit{self,ResourceID{JGC_OBS,_GetInst()}}
oDCobs:FieldSpec := padrao_CHAR_80{}
oDCobs:HyperLabel := HyperLabel{#obs,"Nome:",NULL_STRING,"Gc_NOME"}
oDCobs:TooltipText := "Observaçoes"

oDCSC_FREQ := FixedText{self,ResourceID{JGC_SC_FREQ,_GetInst()}}
oDCSC_FREQ:HyperLabel := HyperLabel{#SC_FREQ,"Frequencia:",NULL_STRING,NULL_STRING}

oDCSC_UNIDME := FixedText{self,ResourceID{JGC_SC_UNIDME,_GetInst()}}
oDCSC_UNIDME:HyperLabel := HyperLabel{#SC_UNIDME,"Unidade:",NULL_STRING,NULL_STRING}

oDCSC_GC := FixedText{self,ResourceID{JGC_SC_GC,_GetInst()}}
oDCSC_GC:HyperLabel := HyperLabel{#SC_GC,"Gc:",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{JGC_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JGC_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_SEQ := FixedText{self,ResourceID{JGC_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSC_SSQ := FixedText{self,ResourceID{JGC_SC_SSQ,_GetInst()}}
oDCSC_SSQ:HyperLabel := HyperLabel{#SC_SSQ,"Ssq:",NULL_STRING,NULL_STRING}

oDCSC_CARAC := FixedText{self,ResourceID{JGC_SC_CARAC,_GetInst()}}
oDCSC_CARAC:HyperLabel := HyperLabel{#SC_CARAC,"Caracteristica:",NULL_STRING,NULL_STRING}

oDCSC_ESPEC := FixedText{self,ResourceID{JGC_SC_ESPEC,_GetInst()}}
oDCSC_ESPEC:HyperLabel := HyperLabel{#SC_ESPEC,"Especificado:",NULL_STRING,NULL_STRING}

oDCSC_TAM := FixedText{self,ResourceID{JGC_SC_TAM,_GetInst()}}
oDCSC_TAM:HyperLabel := HyperLabel{#SC_TAM,"Tamanho Amostra:",NULL_STRING,NULL_STRING}

oDCSC_VALX := FixedText{self,ResourceID{JGC_SC_VALX,_GetInst()}}
oDCSC_VALX:HyperLabel := HyperLabel{#SC_VALX,"Valx(Nominal)",NULL_STRING,NULL_STRING}

oDCSC_LIC := FixedText{self,ResourceID{JGC_SC_LIC,_GetInst()}}
oDCSC_LIC:HyperLabel := HyperLabel{#SC_LIC,"Lic:(Inferior)",NULL_STRING,NULL_STRING}

oDCSC_LSC := FixedText{self,ResourceID{JGC_SC_LSC,_GetInst()}}
oDCSC_LSC:HyperLabel := HyperLabel{#SC_LSC,"Lsc:(Superior)",NULL_STRING,NULL_STRING}

oDCSC_LIE := FixedText{self,ResourceID{JGC_SC_LIE,_GetInst()}}
oDCSC_LIE:HyperLabel := HyperLabel{#SC_LIE,"Lie(Inferior)(Eng.)",NULL_STRING,NULL_STRING}

oDCSC_LSE := FixedText{self,ResourceID{JGC_SC_LSE,_GetInst()}}
oDCSC_LSE:HyperLabel := HyperLabel{#SC_LSE,"Lse(Superior)(Eng)",NULL_STRING,NULL_STRING}

oDCSC_VINI := FixedText{self,ResourceID{JGC_SC_VINI,_GetInst()}}
oDCSC_VINI:HyperLabel := HyperLabel{#SC_VINI,"Min X(Ref.Grafico Inferior)",NULL_STRING,NULL_STRING}

oDCSC_VALR := FixedText{self,ResourceID{JGC_SC_VALR,_GetInst()}}
oDCSC_VALR:HyperLabel := HyperLabel{#SC_VALR,"Valr:",NULL_STRING,NULL_STRING}

oDCSC_LSCR := FixedText{self,ResourceID{JGC_SC_LSCR,_GetInst()}}
oDCSC_LSCR:HyperLabel := HyperLabel{#SC_LSCR,"Lscr",NULL_STRING,NULL_STRING}

oDCSC_EQU := FixedText{self,ResourceID{JGC_SC_EQU,_GetInst()}}
oDCSC_EQU:HyperLabel := HyperLabel{#SC_EQU,"Equipamento:",NULL_STRING,NULL_STRING}

oDCGC := SingleLineEdit{self,ResourceID{JGC_GC,_GetInst()}}
oDCGC:FieldSpec := padrao_num_08{}
oDCGC:HyperLabel := HyperLabel{#GC,"Gc:",NULL_STRING,"Gc_GC"}
oDCGC:TooltipText := "Numero do GC"
oDCGC:BackGround := aBrushes[1]
oDCGC:Font(aFonts[1], FALSE)

oDCSC_VALR1 := FixedText{self,ResourceID{JGC_SC_VALR1,_GetInst()}}
oDCSC_VALR1:HyperLabel := HyperLabel{#SC_VALR1,"R max.(Ref.Grafico)",NULL_STRING,NULL_STRING}

oDCSC_VDIV1 := FixedText{self,ResourceID{JGC_SC_VDIV1,_GetInst()}}
oDCSC_VDIV1:HyperLabel := HyperLabel{#SC_VDIV1,"Max X(Ref.Grafico Superior)",NULL_STRING,NULL_STRING}

oDCSC_INSTRU1 := FixedText{self,ResourceID{JGC_SC_INSTRU1,_GetInst()}}
oDCSC_INSTRU1:HyperLabel := HyperLabel{#SC_INSTRU1,"Instrumento Tipo",NULL_STRING,NULL_STRING}

oCCescfor := PushButton{self,ResourceID{JGC_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}
oCCescfor:TooltipText := "Escolher um Cliente"

oCCesccod := PushButton{self,ResourceID{JGC_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}
oCCesccod:TooltipText := "Escolher um Produto"

oCCporov := PushButton{self,ResourceID{JGC_POROV,_GetInst()}}
oCCporov:Image := ICO_AZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Organizar por Numero GC"

oCCbuscanum := PushButton{self,ResourceID{JGC_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Localizar um GC"

oCCbtnpegma01 := PushButton{self,ResourceID{JGC_BTNPEGMA01,_GetInst()}}
oCCbtnpegma01:HyperLabel := HyperLabel{#btnpegma01,"-->",NULL_STRING,NULL_STRING}
oCCbtnpegma01:TooltipText := "Trazer o Nome do Cliente"

oCCbtnpegms01 := PushButton{self,ResourceID{JGC_BTNPEGMS01,_GetInst()}}
oCCbtnpegms01:HyperLabel := HyperLabel{#btnpegms01,"-->",NULL_STRING,NULL_STRING}
oCCbtnpegms01:TooltipText := "Trazer o Nome do Produto"

oCCbtnpegms06 := PushButton{self,ResourceID{JGC_BTNPEGMS06,_GetInst()}}
oCCbtnpegms06:HyperLabel := HyperLabel{#btnpegms06,"-->",NULL_STRING,NULL_STRING}
oCCbtnpegms06:TooltipText := "Retorna o Descritivo da Operaçao"

oDCGroupBox1 := GroupBox{self,ResourceID{JGC_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Cartas Inicial E Final",NULL_STRING,NULL_STRING}

oDCGroupBox2 := GroupBox{self,ResourceID{JGC_GROUPBOX2,_GetInst()}}
oDCGroupBox2:HyperLabel := HyperLabel{#GroupBox2,"Carta Inicial",NULL_STRING,NULL_STRING}

oDCGroupBox3 := GroupBox{self,ResourceID{JGC_GROUPBOX3,_GetInst()}}
oDCGroupBox3:HyperLabel := HyperLabel{#GroupBox3,"Carta Final",NULL_STRING,NULL_STRING}

oDCAEP := SingleLineEdit{self,ResourceID{JGC_AEP,_GetInst()}}
oDCAEP:FieldSpec := padrao_NUM_08{}
oDCAEP:HyperLabel := HyperLabel{#AEP,"Cliente:",NULL_STRING,"Gc_CLIENTE"}
oDCAEP:TooltipText := "Numero do Aep Que Originou"

oDCSC_CLIENTE1 := FixedText{self,ResourceID{JGC_SC_CLIENTE1,_GetInst()}}
oDCSC_CLIENTE1:HyperLabel := HyperLabel{#SC_CLIENTE1,"AEP",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE2 := FixedText{self,ResourceID{JGC_SC_CLIENTE2,_GetInst()}}
oDCSC_CLIENTE2:HyperLabel := HyperLabel{#SC_CLIENTE2,"ACP",NULL_STRING,NULL_STRING}

oDCACP := SingleLineEdit{self,ResourceID{JGC_ACP,_GetInst()}}
oDCACP:FieldSpec := padrao_NUM_08{}
oDCACP:HyperLabel := HyperLabel{#ACP,"Cliente:",NULL_STRING,"Gc_CLIENTE"}
oDCACP:TooltipText := "Numero da ACP que Originou"

oCCImpacp := PushButton{self,ResourceID{JGC_IMPACP,_GetInst()}}
oCCImpacp:HyperLabel := HyperLabel{#Impacp,"Imp",NULL_STRING,NULL_STRING}

oCCImpaep := PushButton{self,ResourceID{JGC_IMPAEP,_GetInst()}}
oCCImpaep:HyperLabel := HyperLabel{#Impaep,"Imp",NULL_STRING,NULL_STRING}

oDCSC_SSQ1 := FixedText{self,ResourceID{JGC_SC_SSQ1,_GetInst()}}
oDCSC_SSQ1:HyperLabel := HyperLabel{#SC_SSQ1,"obs",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JGC_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JGC_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

self:Caption := "Nome:"
self:HyperLabel := HyperLabel{#JGC,"Nome:",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBGC := DataColumn{padrao_num_08{}}
oDBGC:Width := 8
oDBGC:HyperLabel := oDCGC:HyperLabel 
oDBGC:Caption := "Gc:"
oDBGC:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBGC)

oDBCLIENTE := DataColumn{padrao_NUM_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
self:Browser:AddColumn(oDBCLIENTE)

oDBCLINOME := DataColumn{padrao_CHAR_50{}}
oDBCLINOME:Width := 16
oDBCLINOME:HyperLabel := oDCCLINOME:HyperLabel 
oDBCLINOME:Caption := "Clinome:"
self:Browser:AddColumn(oDBCLINOME)

oDBCODIGO := DataColumn{padrao_CHAR_24{}}
oDBCODIGO:Width := 12
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{padrao_CHAR_40{}}
oDBNOME:Width := 23
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBSEQ := DataColumn{padrao_NUM_03{}}
oDBSEQ:Width := 5
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
self:Browser:AddColumn(oDBSEQ)

oDBSSQ := DataColumn{padrao_NUM_03{}}
oDBSSQ:Width := 5
oDBSSQ:HyperLabel := oDCSSQ:HyperLabel 
oDBSSQ:Caption := "Ssq:"
self:Browser:AddColumn(oDBSSQ)

oDBCARAC := DataColumn{padrao_CHAR_50{}}
oDBCARAC:Width := 16
oDBCARAC:HyperLabel := oDCCARAC:HyperLabel 
oDBCARAC:Caption := "Carac:"
self:Browser:AddColumn(oDBCARAC)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LIC() 
return self:FieldGet(#LIC)


assign LIC(uValue) 
self:FieldPut(#LIC, uValue)
return LIC := uValue


access LIE() 
return self:FieldGet(#LIE)


assign LIE(uValue) 
self:FieldPut(#LIE, uValue)
return LIE := uValue


access LSC() 
return self:FieldGet(#LSC)


assign LSC(uValue) 
self:FieldPut(#LSC, uValue)
return LSC := uValue


access LSCR() 
return self:FieldGet(#LSCR)


assign LSCR(uValue) 
self:FieldPut(#LSCR, uValue)
return LSCR := uValue


access LSE() 
return self:FieldGet(#LSE)


assign LSE(uValue) 
self:FieldPut(#LSE, uValue)
return LSE := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access NOMME01() 
return self:FieldGet(#NOMME01)


assign NOMME01(uValue) 
self:FieldPut(#NOMME01, uValue)
return NOMME01 := uValue


access NOMME04() 
return self:FieldGet(#NOMME04)


assign NOMME04(uValue) 
self:FieldPut(#NOMME04, uValue)
return NOMME04 := uValue


access obs() 
return self:FieldGet(#obs)


assign obs(uValue) 
self:FieldPut(#obs, uValue)
return obs := uValue


access RMAX() 
return self:FieldGet(#RMAX)


assign RMAX(uValue) 
self:FieldPut(#RMAX, uValue)
return RMAX := uValue


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


access TAM() 
return self:FieldGet(#TAM)


assign TAM(uValue) 
self:FieldPut(#TAM, uValue)
return TAM := uValue


access UNIDME() 
return self:FieldGet(#UNIDME)


assign UNIDME(uValue) 
self:FieldPut(#UNIDME, uValue)
return UNIDME := uValue


access VALR() 
return self:FieldGet(#VALR)


assign VALR(uValue) 
self:FieldPut(#VALR, uValue)
return VALR := uValue


access VALX() 
return self:FieldGet(#VALX)


assign VALX(uValue) 
self:FieldPut(#VALX, uValue)
return VALX := uValue


access VINI() 
return self:FieldGet(#VINI)


assign VINI(uValue) 
self:FieldPut(#VINI, uValue)
return VINI := uValue


access VMAX() 
return self:FieldGet(#VMAX)


assign VMAX(uValue) 
self:FieldPut(#VMAX, uValue)
return VMAX := uValue


END CLASS
