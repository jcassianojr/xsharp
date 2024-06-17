#region DEFINES
STATIC DEFINE JSEQ_AREA := 116 
STATIC DEFINE JSEQ_CMDESCMP01 := 129 
STATIC DEFINE JSEQ_CMDESCMP02 := 130 
STATIC DEFINE JSEQ_CMDESCMP02B := 131 
STATIC DEFINE JSEQ_CMDESCMP03 := 133 
STATIC DEFINE JSEQ_CODFOLHA := 108 
STATIC DEFINE JSEQ_CODMP01 := 107 
STATIC DEFINE JSEQ_CODMP02 := 109 
STATIC DEFINE JSEQ_CODMP02B := 110 
STATIC DEFINE JSEQ_CODMP03 := 111 
STATIC DEFINE JSEQ_DESCRI := 106 
STATIC DEFINE JSEQ_ECCMP02B := 120 
STATIC DEFINE JSEQ_ESCMP01 := 118 
STATIC DEFINE JSEQ_ESCMP02B := 120 
STATIC DEFINE JSEQ_FATOR := 114 
STATIC DEFINE JSEQ_FLUXO := 105 
STATIC DEFINE JSEQ_HRFER := 104 
STATIC DEFINE JSEQ_PCHORA := 102 
STATIC DEFINE JSEQ_PCMEDIA := 103 
STATIC DEFINE JSEQ_PRECO := 112 
STATIC DEFINE JSEQ_QTDDE := 113 
STATIC DEFINE JSEQ_SC_CODMP01 := 134 
STATIC DEFINE JSEQ_SC_CODMP02 := 135 
STATIC DEFINE JSEQ_SC_CODMP03 := 132 
STATIC DEFINE JSEQ_SC_DESCRI := 128 
STATIC DEFINE JSEQ_SC_PCHORA := 127 
STATIC DEFINE JSEQ_SC_PCHORA1 := 118 
STATIC DEFINE JSEQ_SC_PCHORA2 := 122 
STATIC DEFINE JSEQ_SC_PRECO := 119 
STATIC DEFINE JSEQ_SC_PRECO1 := 124 
STATIC DEFINE JSEQ_SC_QTDDE := 120 
STATIC DEFINE JSEQ_SC_SEQ := 125 
STATIC DEFINE JSEQ_SC_SSQ := 126 
STATIC DEFINE JSEQ_SC_SSQ1 := 117 
STATIC DEFINE JSEQ_SC_SSQ2 := 123 
STATIC DEFINE JSEQ_SC_TOTAL := 121 
STATIC DEFINE JSEQ_SEQ := 100 
STATIC DEFINE JSEQ_SSQ := 101 
STATIC DEFINE JSEQ_THEFIXEDTEXT7 := 136 
STATIC DEFINE JSEQ_TOTAL := 115 
#endregion

PARTIAL class JSEQ inherit DATAWINDOW 

	PROTECT oDBSEQ as DataColumn
	PROTECT oDBSSQ as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBPCHORA as DataColumn
	PROTECT oDBHRFER as DataColumn
	PROTECT oDBCODFOLHA as DataColumn
	PROTECT oDBCODMP01 as DataColumn
	PROTECT oDBPRECO as DataColumn
	PROTECT oDBQTDDE as DataColumn
	PROTECT oDBFATOR as DataColumn
	PROTECT oDBTOTAL as DataColumn
	PROTECT oDBPCMEDIA as DataColumn
	PROTECT oDBFLUXO as DataColumn
	protect oDCSEQ as SINGLELINEEDIT
	protect oDCSSQ as SINGLELINEEDIT
	protect oDCPCHORA as SINGLELINEEDIT
	protect oDCPCMEDIA as SINGLELINEEDIT
	protect oDCHRFER as SINGLELINEEDIT
	protect oDCFLUXO as SINGLELINEEDIT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCCODMP01 as SINGLELINEEDIT
	protect oDCCODFOLHA as SINGLELINEEDIT
	protect oDCCODMP02 as SINGLELINEEDIT
	protect oDCCODMP02B as SINGLELINEEDIT
	protect oDCCODMP03 as SINGLELINEEDIT
	protect oDCPRECO as SINGLELINEEDIT
	protect oDCQTDDE as SINGLELINEEDIT
	protect oDCFATOR as SINGLELINEEDIT
	protect oDCTOTAL as SINGLELINEEDIT
	protect oDCAREA as COMBOBOX
	protect oDCSC_SSQ1 as FIXEDTEXT
	protect oDCSC_PCHORA1 as FIXEDTEXT
	protect oDCSC_PRECO as FIXEDTEXT
	protect oDCSC_QTDDE as FIXEDTEXT
	protect oDCSC_TOTAL as FIXEDTEXT
	protect oDCSC_PCHORA2 as FIXEDTEXT
	protect oDCSC_SSQ2 as FIXEDTEXT
	protect oDCSC_PRECO1 as FIXEDTEXT
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSC_SSQ as FIXEDTEXT
	protect oDCSC_PCHORA as FIXEDTEXT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oCCcmdEscmp01 as PUSHBUTTON
	protect oCCcmdescmp02 as PUSHBUTTON
	protect oCCcmdescmp02b as PUSHBUTTON
	protect oDCSC_CODMP03 as FIXEDTEXT
	protect oCCcmdescmp03 as PUSHBUTTON
	protect oDCSC_CODMP01 as FIXEDTEXT
	protect oDCSC_CODMP02 as FIXEDTEXT
	protect oDCtheFixedText7 as FIXEDTEXT
// 	instance SEQ 
// 	instance SSQ 
// 	instance PCHORA 
// 	instance PCMEDIA 
// 	instance HRFER 
// 	instance FLUXO 
// 	instance DESCRI 
// 	instance CODMP01 
// 	instance CODFOLHA 
// 	instance CODMP02 
// 	instance CODMP02B 
// 	instance CODMP03 
// 	instance PRECO 
// 	instance QTDDE 
// 	instance FATOR 
// 	instance TOTAL 
// 	instance AREA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AREA() 
return self:FieldGet(#AREA)


assign AREA(uValue) 
self:FieldPut(#AREA, uValue)
return AREA := uValue


access CODFOLHA() 
return self:FieldGet(#CODFOLHA)


assign CODFOLHA(uValue) 
self:FieldPut(#CODFOLHA, uValue)
return CODFOLHA := uValue


access CODMP01() 
return self:FieldGet(#CODMP01)


assign CODMP01(uValue) 
self:FieldPut(#CODMP01, uValue)
return CODMP01 := uValue


access CODMP02() 
return self:FieldGet(#CODMP02)


assign CODMP02(uValue) 
self:FieldPut(#CODMP02, uValue)
return CODMP02 := uValue


access CODMP02B() 
return self:FieldGet(#CODMP02B)


assign CODMP02B(uValue) 
self:FieldPut(#CODMP02B, uValue)
return CODMP02B := uValue


access CODMP03() 
return self:FieldGet(#CODMP03)


assign CODMP03(uValue) 
self:FieldPut(#CODMP03, uValue)
return CODMP03 := uValue


access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


access FATOR() 
return self:FieldGet(#FATOR)


assign FATOR(uValue) 
self:FieldPut(#FATOR, uValue)
return FATOR := uValue


access FLUXO() 
return self:FieldGet(#FLUXO)


assign FLUXO(uValue) 
self:FieldPut(#FLUXO, uValue)
return FLUXO := uValue


access HRFER() 
return self:FieldGet(#HRFER)


assign HRFER(uValue) 
self:FieldPut(#HRFER, uValue)
return HRFER := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JSEQ",_GetInst()},iCtlID)

oDCSEQ := SingleLineEdit{self,ResourceID{JSEQ_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := padrao_num_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq",NULL_STRING,"VMS06_SEQ"}
oDCSEQ:FocusSelect := FSEL_HOME

oDCSSQ := SingleLineEdit{self,ResourceID{JSEQ_SSQ,_GetInst()}}
oDCSSQ:FieldSpec := padrao_num_03{}
oDCSSQ:HyperLabel := HyperLabel{#SSQ,"Ssq",NULL_STRING,"VMS06_SSQ"}
oDCSSQ:FocusSelect := FSEL_HOME

oDCPCHORA := SingleLineEdit{self,ResourceID{JSEQ_PCHORA,_GetInst()}}
oDCPCHORA:FieldSpec := padrao_num_05{}
oDCPCHORA:HyperLabel := HyperLabel{#PCHORA,"Pc Hr",NULL_STRING,"VMS06_PCHORA"}
oDCPCHORA:FocusSelect := FSEL_HOME

oDCPCMEDIA := SingleLineEdit{self,ResourceID{JSEQ_PCMEDIA,_GetInst()}}
oDCPCMEDIA:FieldSpec := padrao_num_05{}
oDCPCMEDIA:HyperLabel := HyperLabel{#PCMEDIA,"Hr.Media",NULL_STRING,"VMS06_PCHORA"}
oDCPCMEDIA:FocusSelect := FSEL_HOME

oDCHRFER := SingleLineEdit{self,ResourceID{JSEQ_HRFER,_GetInst()}}
oDCHRFER:FieldSpec := padrao_num_06{}
oDCHRFER:HyperLabel := HyperLabel{#HRFER,"Hr Fer",NULL_STRING,"VMS06_PCHORA"}
oDCHRFER:FocusSelect := FSEL_HOME

oDCFLUXO := SingleLineEdit{self,ResourceID{JSEQ_FLUXO,_GetInst()}}
oDCFLUXO:FieldSpec := PADRAO_NUM_03{}
oDCFLUXO:HyperLabel := HyperLabel{#FLUXO,"F",NULL_STRING,"VMS06_CODFOLHA"}
oDCFLUXO:FocusSelect := FSEL_HOME

oDCDESCRI := SingleLineEdit{self,ResourceID{JSEQ_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := padrao_CHAR_70{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descrição:",NULL_STRING,"VMS06_DESCRI"}
oDCDESCRI:FocusSelect := FSEL_HOME

oDCCODMP01 := SingleLineEdit{self,ResourceID{JSEQ_CODMP01,_GetInst()}}
oDCCODMP01:FieldSpec := PADRAO_CHAR_24{}
oDCCODMP01:HyperLabel := HyperLabel{#CODMP01,"Cod Maq",NULL_STRING,"VMS06_PCHORA"}
oDCCODMP01:FocusSelect := FSEL_HOME

oDCCODFOLHA := SingleLineEdit{self,ResourceID{JSEQ_CODFOLHA,_GetInst()}}
oDCCODFOLHA:FieldSpec := PADRAO_NUM_06{}
oDCCODFOLHA:HyperLabel := HyperLabel{#CODFOLHA,"Sub",NULL_STRING,"VMS06_CODFOLHA"}
oDCCODFOLHA:FocusSelect := FSEL_HOME

oDCCODMP02 := SingleLineEdit{self,ResourceID{JSEQ_CODMP02,_GetInst()}}
oDCCODMP02:FieldSpec := PADRAO_CHAR_24{}
oDCCODMP02:HyperLabel := HyperLabel{#CODMP02,"Pchora:",NULL_STRING,"VMS06_PCHORA"}
oDCCODMP02:FocusSelect := FSEL_HOME

oDCCODMP02B := SingleLineEdit{self,ResourceID{JSEQ_CODMP02B,_GetInst()}}
oDCCODMP02B:FieldSpec := PADRAO_CHAR_24{}
oDCCODMP02B:HyperLabel := HyperLabel{#CODMP02B,"Pchora:",NULL_STRING,"VMS06_PCHORA"}
oDCCODMP02B:FocusSelect := FSEL_HOME

oDCCODMP03 := SingleLineEdit{self,ResourceID{JSEQ_CODMP03,_GetInst()}}
oDCCODMP03:FieldSpec := PADRAO_CHAR_24{}
oDCCODMP03:HyperLabel := HyperLabel{#CODMP03,"Pchora:",NULL_STRING,"VMS06_PCHORA"}
oDCCODMP03:FocusSelect := FSEL_HOME

oDCPRECO := SingleLineEdit{self,ResourceID{JSEQ_PRECO,_GetInst()}}
oDCPRECO:FieldSpec := PADRAO_NUM_12_4{}
oDCPRECO:HyperLabel := HyperLabel{#PRECO,"Preco:",NULL_STRING,"Vms06_PRECO"}

oDCQTDDE := SingleLineEdit{self,ResourceID{JSEQ_QTDDE,_GetInst()}}
oDCQTDDE:FieldSpec := PADRAO_NUM_10_5{}
oDCQTDDE:HyperLabel := HyperLabel{#QTDDE,"Qtdde:",NULL_STRING,"Vms06_QTDDE"}

oDCFATOR := SingleLineEdit{self,ResourceID{JSEQ_FATOR,_GetInst()}}
oDCFATOR:FieldSpec := PADRAO_NUM_05_2{}
oDCFATOR:HyperLabel := HyperLabel{#FATOR,"Fator",NULL_STRING,"Vms06_PRECO"}

oDCTOTAL := SingleLineEdit{self,ResourceID{JSEQ_TOTAL,_GetInst()}}
oDCTOTAL:FieldSpec := PADRAO_NUM_12_4{}
oDCTOTAL:HyperLabel := HyperLabel{#TOTAL,"Total:",NULL_STRING,"Vms06_TOTAL"}

oDCAREA := combobox{self,ResourceID{JSEQ_AREA,_GetInst()}}
oDCAREA:FieldSpec := PADRAO_CHAR_02{}
oDCAREA:HyperLabel := HyperLabel{#AREA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_SSQ1 := FixedText{self,ResourceID{JSEQ_SC_SSQ1,_GetInst()}}
oDCSC_SSQ1:HyperLabel := HyperLabel{#SC_SSQ1,"Sub:",NULL_STRING,NULL_STRING}

oDCSC_PCHORA1 := FixedText{self,ResourceID{JSEQ_SC_PCHORA1,_GetInst()}}
oDCSC_PCHORA1:HyperLabel := HyperLabel{#SC_PCHORA1,"Ferramenta Horas",NULL_STRING,NULL_STRING}

oDCSC_PRECO := FixedText{self,ResourceID{JSEQ_SC_PRECO,_GetInst()}}
oDCSC_PRECO:HyperLabel := HyperLabel{#SC_PRECO,"Preco:",NULL_STRING,NULL_STRING}

oDCSC_QTDDE := FixedText{self,ResourceID{JSEQ_SC_QTDDE,_GetInst()}}
oDCSC_QTDDE:HyperLabel := HyperLabel{#SC_QTDDE,"Qtdde:",NULL_STRING,NULL_STRING}

oDCSC_TOTAL := FixedText{self,ResourceID{JSEQ_SC_TOTAL,_GetInst()}}
oDCSC_TOTAL:HyperLabel := HyperLabel{#SC_TOTAL,"Total:",NULL_STRING,NULL_STRING}

oDCSC_PCHORA2 := FixedText{self,ResourceID{JSEQ_SC_PCHORA2,_GetInst()}}
oDCSC_PCHORA2:HyperLabel := HyperLabel{#SC_PCHORA2,"PC/Hora Media",NULL_STRING,NULL_STRING}

oDCSC_SSQ2 := FixedText{self,ResourceID{JSEQ_SC_SSQ2,_GetInst()}}
oDCSC_SSQ2:HyperLabel := HyperLabel{#SC_SSQ2,"Fluxo",NULL_STRING,NULL_STRING}

oDCSC_PRECO1 := FixedText{self,ResourceID{JSEQ_SC_PRECO1,_GetInst()}}
oDCSC_PRECO1:HyperLabel := HyperLabel{#SC_PRECO1,"Fator:",NULL_STRING,NULL_STRING}

oDCSC_SEQ := FixedText{self,ResourceID{JSEQ_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSC_SSQ := FixedText{self,ResourceID{JSEQ_SC_SSQ,_GetInst()}}
oDCSC_SSQ:HyperLabel := HyperLabel{#SC_SSQ,"Ssq:",NULL_STRING,NULL_STRING}

oDCSC_PCHORA := FixedText{self,ResourceID{JSEQ_SC_PCHORA,_GetInst()}}
oDCSC_PCHORA:HyperLabel := HyperLabel{#SC_PCHORA,"Peças Hora",NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{self,ResourceID{JSEQ_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descriçao:",NULL_STRING,NULL_STRING}

oCCcmdEscmp01 := PushButton{self,ResourceID{JSEQ_CMDESCMP01,_GetInst()}}
oCCcmdEscmp01:HyperLabel := HyperLabel{#cmdEscmp01,"...",NULL_STRING,NULL_STRING}

oCCcmdescmp02 := PushButton{self,ResourceID{JSEQ_CMDESCMP02,_GetInst()}}
oCCcmdescmp02:HyperLabel := HyperLabel{#cmdescmp02,"...",NULL_STRING,NULL_STRING}

oCCcmdescmp02b := PushButton{self,ResourceID{JSEQ_CMDESCMP02B,_GetInst()}}
oCCcmdescmp02b:HyperLabel := HyperLabel{#cmdescmp02b,"...",NULL_STRING,NULL_STRING}

oDCSC_CODMP03 := FixedText{self,ResourceID{JSEQ_SC_CODMP03,_GetInst()}}
oDCSC_CODMP03:HyperLabel := HyperLabel{#SC_CODMP03,"Terceiros",NULL_STRING,NULL_STRING}

oCCcmdescmp03 := PushButton{self,ResourceID{JSEQ_CMDESCMP03,_GetInst()}}
oCCcmdescmp03:HyperLabel := HyperLabel{#cmdescmp03,"...",NULL_STRING,NULL_STRING}

oDCSC_CODMP01 := FixedText{self,ResourceID{JSEQ_SC_CODMP01,_GetInst()}}
oDCSC_CODMP01:HyperLabel := HyperLabel{#SC_CODMP01,"Maquinas",NULL_STRING,NULL_STRING}

oDCSC_CODMP02 := FixedText{self,ResourceID{JSEQ_SC_CODMP02,_GetInst()}}
oDCSC_CODMP02:HyperLabel := HyperLabel{#SC_CODMP02,"Operadores",NULL_STRING,NULL_STRING}

oDCtheFixedText7 := FixedText{self,ResourceID{JSEQ_THEFIXEDTEXT7,_GetInst()}}
oDCtheFixedText7:HyperLabel := HyperLabel{#theFixedText7,"Area",NULL_STRING,NULL_STRING}

self:Caption := "Sequencia do Produto"
self:HyperLabel := HyperLabel{#JSEQ,"Sequencia do Produto",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBSEQ := DataColumn{padrao_num_03{}}
oDBSEQ:Width := 5
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq"
self:Browser:AddColumn(oDBSEQ)

oDBSSQ := DataColumn{padrao_num_03{}}
oDBSSQ:Width := 5
oDBSSQ:HyperLabel := oDCSSQ:HyperLabel 
oDBSSQ:Caption := "Ssq"
self:Browser:AddColumn(oDBSSQ)

oDBDESCRI := DataColumn{padrao_CHAR_70{}}
oDBDESCRI:Width := 26
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descrição:"
self:Browser:AddColumn(oDBDESCRI)

oDBPCHORA := DataColumn{padrao_num_05{}}
oDBPCHORA:Width := 6
oDBPCHORA:HyperLabel := oDCPCHORA:HyperLabel 
oDBPCHORA:Caption := "Pc Hr"
self:Browser:AddColumn(oDBPCHORA)

oDBHRFER := DataColumn{padrao_num_06{}}
oDBHRFER:Width := 6
oDBHRFER:HyperLabel := oDCHRFER:HyperLabel 
oDBHRFER:Caption := "Hr Fer"
self:Browser:AddColumn(oDBHRFER)

oDBCODFOLHA := DataColumn{PADRAO_NUM_06{}}
oDBCODFOLHA:Width := 4
oDBCODFOLHA:HyperLabel := oDCCODFOLHA:HyperLabel 
oDBCODFOLHA:Caption := "Sub"
self:Browser:AddColumn(oDBCODFOLHA)

oDBCODMP01 := DataColumn{PADRAO_CHAR_24{}}
oDBCODMP01:Width := 15
oDBCODMP01:HyperLabel := oDCCODMP01:HyperLabel 
oDBCODMP01:Caption := "Cod Maq"
self:Browser:AddColumn(oDBCODMP01)

oDBPRECO := DataColumn{PADRAO_NUM_12_4{}}
oDBPRECO:Width := 8
oDBPRECO:HyperLabel := oDCPRECO:HyperLabel 
oDBPRECO:Caption := "Preco:"
self:Browser:AddColumn(oDBPRECO)

oDBQTDDE := DataColumn{PADRAO_NUM_10_5{}}
oDBQTDDE:Width := 7
oDBQTDDE:HyperLabel := oDCQTDDE:HyperLabel 
oDBQTDDE:Caption := "Qtdde:"
self:Browser:AddColumn(oDBQTDDE)

oDBFATOR := DataColumn{PADRAO_NUM_05_2{}}
oDBFATOR:Width := 7
oDBFATOR:HyperLabel := oDCFATOR:HyperLabel 
oDBFATOR:Caption := "Fator"
self:Browser:AddColumn(oDBFATOR)

oDBTOTAL := DataColumn{PADRAO_NUM_12_4{}}
oDBTOTAL:Width := 7
oDBTOTAL:HyperLabel := oDCTOTAL:HyperLabel 
oDBTOTAL:Caption := "Total:"
self:Browser:AddColumn(oDBTOTAL)

oDBPCMEDIA := DataColumn{padrao_num_05{}}
oDBPCMEDIA:Width := 8
oDBPCMEDIA:HyperLabel := oDCPCMEDIA:HyperLabel 
oDBPCMEDIA:Caption := "Hr.Media"
self:Browser:AddColumn(oDBPCMEDIA)

oDBFLUXO := DataColumn{PADRAO_NUM_03{}}
oDBFLUXO:Width := 5
oDBFLUXO:HyperLabel := oDCFLUXO:HyperLabel 
oDBFLUXO:Caption := "F"
self:Browser:AddColumn(oDBFLUXO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PCHORA() 
return self:FieldGet(#PCHORA)


assign PCHORA(uValue) 
self:FieldPut(#PCHORA, uValue)
return PCHORA := uValue


access PCMEDIA() 
return self:FieldGet(#PCMEDIA)


assign PCMEDIA(uValue) 
self:FieldPut(#PCMEDIA, uValue)
return PCMEDIA := uValue


access PRECO() 
return self:FieldGet(#PRECO)


assign PRECO(uValue) 
self:FieldPut(#PRECO, uValue)
return PRECO := uValue


access QTDDE() 
return self:FieldGet(#QTDDE)


assign QTDDE(uValue) 
self:FieldPut(#QTDDE, uValue)
return QTDDE := uValue


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


access TOTAL() 
return self:FieldGet(#TOTAL)


assign TOTAL(uValue) 
self:FieldPut(#TOTAL, uValue)
return TOTAL := uValue


END CLASS
