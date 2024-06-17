#region DEFINES
STATIC DEFINE JRATI_ACAO01 := 121 
STATIC DEFINE JRATI_ACAO02 := 122 
STATIC DEFINE JRATI_ACAO03 := 123 
STATIC DEFINE JRATI_ANAL01 := 116 
STATIC DEFINE JRATI_ANAL02 := 117 
STATIC DEFINE JRATI_ANAL03 := 118 
STATIC DEFINE JRATI_ANAL04 := 119 
STATIC DEFINE JRATI_ANAL05 := 120 
STATIC DEFINE JRATI_CODIGO := 109 
STATIC DEFINE JRATI_ESCRES := 132 
STATIC DEFINE JRATI_GROUPBOX1 := 128 
STATIC DEFINE JRATI_GROUPBOX2 := 129 
STATIC DEFINE JRATI_GROUPBOX3 := 130 
STATIC DEFINE JRATI_LACAO := 131 
STATIC DEFINE JRATI_PARADA := 134 
STATIC DEFINE JRATI_PEGRES := 133 
STATIC DEFINE JRATI_PRAZO := 112 
STATIC DEFINE JRATI_PROB01 := 113 
STATIC DEFINE JRATI_PROB02 := 114 
STATIC DEFINE JRATI_PROB03 := 115 
STATIC DEFINE JRATI_QTDE := 110 
STATIC DEFINE JRATI_RACF := 127 
STATIC DEFINE JRATI_RADIOBUTTON1 := 136 
STATIC DEFINE JRATI_RADIOBUTTON2 := 137 
STATIC DEFINE JRATI_RADIOBUTTON3 := 138 
STATIC DEFINE JRATI_RASTRO := 111 
STATIC DEFINE JRATI_RAT := 108 
STATIC DEFINE JRATI_RELACAO := 135 
STATIC DEFINE JRATI_RESNOME := 125 
STATIC DEFINE JRATI_RESNUM := 124 
STATIC DEFINE JRATI_SAC := 126 
STATIC DEFINE JRATI_SC_CODIGO := 101 
STATIC DEFINE JRATI_SC_PRAZO := 104 
STATIC DEFINE JRATI_SC_QTDE := 102 
STATIC DEFINE JRATI_SC_RACF := 107 
STATIC DEFINE JRATI_SC_RASTRO := 103 
STATIC DEFINE JRATI_SC_RAT := 100 
STATIC DEFINE JRATI_SC_RESNUM := 105 
STATIC DEFINE JRATI_SC_SAC := 106 
#endregion

class jrati inherit DATAWINDOW 

	PROTECT oDBRAT as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBQTDE as DataColumn
	PROTECT oDBRASTRO as DataColumn
	PROTECT oDBPRAZO as DataColumn
	PROTECT oDBSAC as DataColumn
	PROTECT oDBRACF as DataColumn
	PROTECT oDBLACAO as DataColumn
	protect oDCSC_RAT as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCSC_PRAZO as FIXEDTEXT
	protect oDCSC_RESNUM as FIXEDTEXT
	protect oDCSC_SAC as FIXEDTEXT
	protect oDCSC_RACF as FIXEDTEXT
	protect oDCRAT as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCQTDE as RIGHTSLE
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCPRAZO as DATESLE
	protect oDCPROB01 as SINGLELINEEDIT
	protect oDCPROB02 as SINGLELINEEDIT
	protect oDCPROB03 as SINGLELINEEDIT
	protect oDCANAL01 as SINGLELINEEDIT
	protect oDCANAL02 as SINGLELINEEDIT
	protect oDCANAL03 as SINGLELINEEDIT
	protect oDCANAL04 as SINGLELINEEDIT
	protect oDCANAL05 as SINGLELINEEDIT
	protect oDCACAO01 as SINGLELINEEDIT
	protect oDCACAO02 as SINGLELINEEDIT
	protect oDCACAO03 as SINGLELINEEDIT
	protect oDCRESNUM as RIGHTSLE
	protect oDCRESNOME as SINGLELINEEDIT
	protect oDCSAC as SINGLELINEEDIT
	protect oDCRACF as SINGLELINEEDIT
	protect oDCGroupBox1 as GROUPBOX
	protect oDCGroupBox2 as GROUPBOX
	protect oDCGroupBox3 as GROUPBOX
	protect oDCLACAO as CHECKBOX
	protect oCCescres as PUSHBUTTON
	protect oCCpegres as PUSHBUTTON
	protect oDCPARADA as CHECKBOX
	protect oDCRELACAO as RADIOBUTTONGROUP
	protect oCCRadioButton1 as RADIOBUTTON
	protect oCCRadioButton2 as RADIOBUTTON
	protect oCCRadioButton3 as RADIOBUTTON
// 	instance RAT 
// 	instance CODIGO 
// 	instance QTDE 
// 	instance RASTRO 
// 	instance PRAZO 
// 	instance PROB01 
// 	instance PROB02 
// 	instance PROB03 
// 	instance ANAL01 
// 	instance ANAL02 
// 	instance ANAL03 
// 	instance ANAL04 
// 	instance ANAL05 
// 	instance ACAO01 
// 	instance ACAO02 
// 	instance ACAO03 
// 	instance RESNUM 
// 	instance RESNOME 
// 	instance SAC 
// 	instance RACF 
// 	instance LACAO 
// 	instance PARADA 
// 	instance RELACAO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ACAO01() 
return self:FieldGet(#ACAO01)


assign ACAO01(uValue) 
self:FieldPut(#ACAO01, uValue)
return ACAO01 := uValue


access ACAO02() 
return self:FieldGet(#ACAO02)


assign ACAO02(uValue) 
self:FieldPut(#ACAO02, uValue)
return ACAO02 := uValue


access ACAO03() 
return self:FieldGet(#ACAO03)


assign ACAO03(uValue) 
self:FieldPut(#ACAO03, uValue)
return ACAO03 := uValue


access ANAL01() 
return self:FieldGet(#ANAL01)


assign ANAL01(uValue) 
self:FieldPut(#ANAL01, uValue)
return ANAL01 := uValue


access ANAL02() 
return self:FieldGet(#ANAL02)


assign ANAL02(uValue) 
self:FieldPut(#ANAL02, uValue)
return ANAL02 := uValue


access ANAL03() 
return self:FieldGet(#ANAL03)


assign ANAL03(uValue) 
self:FieldPut(#ANAL03, uValue)
return ANAL03 := uValue


access ANAL04() 
return self:FieldGet(#ANAL04)


assign ANAL04(uValue) 
self:FieldPut(#ANAL04, uValue)
return ANAL04 := uValue


access ANAL05() 
return self:FieldGet(#ANAL05)


assign ANAL05(uValue) 
self:FieldPut(#ANAL05, uValue)
return ANAL05 := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jrati",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_RAT := FixedText{self,ResourceID{JRATI_SC_RAT,_GetInst()}}
oDCSC_RAT:HyperLabel := HyperLabel{#SC_RAT,"Rat:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JRATI_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{self,ResourceID{JRATI_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{JRATI_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCSC_PRAZO := FixedText{self,ResourceID{JRATI_SC_PRAZO,_GetInst()}}
oDCSC_PRAZO:HyperLabel := HyperLabel{#SC_PRAZO,"Prazo:",NULL_STRING,NULL_STRING}

oDCSC_RESNUM := FixedText{self,ResourceID{JRATI_SC_RESNUM,_GetInst()}}
oDCSC_RESNUM:HyperLabel := HyperLabel{#SC_RESNUM,"Responsável",NULL_STRING,NULL_STRING}

oDCSC_SAC := FixedText{self,ResourceID{JRATI_SC_SAC,_GetInst()}}
oDCSC_SAC:HyperLabel := HyperLabel{#SC_SAC,"Sac:",NULL_STRING,NULL_STRING}

oDCSC_RACF := FixedText{self,ResourceID{JRATI_SC_RACF,_GetInst()}}
oDCSC_RACF:HyperLabel := HyperLabel{#SC_RACF,"Racf:",NULL_STRING,NULL_STRING}

oDCRAT := SingleLineEdit{self,ResourceID{JRATI_RAT,_GetInst()}}
oDCRAT:FieldSpec := PADRAO_NUM_08{}
oDCRAT:HyperLabel := HyperLabel{#RAT,"Rat:",NULL_STRING,"RATI_RAT"}
oDCRAT:TooltipText := "No RAT"
oDCRAT:BackGround := aBrushes[1]
oDCRAT:Font(aFonts[1], FALSE)

oDCCODIGO := SingleLineEdit{self,ResourceID{JRATI_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"RATI_CODIGO"}
oDCCODIGO:TooltipText := "Codigo do Produto"
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[1], FALSE)

oDCQTDE := rightSle{self,ResourceID{JRATI_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := PADRAO_NUM_08{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"RATI_QTDE"}
oDCQTDE:TooltipText := "Quantidade"

oDCRASTRO := SingleLineEdit{self,ResourceID{JRATI_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := PADRAO_CHAR_10{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"RATI_RASTRO"}
oDCRASTRO:TooltipText := "No da Rastreabilidade"

oDCPRAZO := DateSle{self,ResourceID{JRATI_PRAZO,_GetInst()}}
oDCPRAZO:FieldSpec := DATE_FIELD{}
oDCPRAZO:HyperLabel := HyperLabel{#PRAZO,"Prazo:",NULL_STRING,"RATI_PRAZO"}
oDCPRAZO:TooltipText := "Data Prazo da Rat"

oDCPROB01 := SingleLineEdit{self,ResourceID{JRATI_PROB01,_GetInst()}}
oDCPROB01:FieldSpec := PADRAO_CHAR_100{}
oDCPROB01:HyperLabel := HyperLabel{#PROB01,"Prob01:",NULL_STRING,"RATI_PROB01"}
oDCPROB01:TooltipText := "Descrição Não Conformidade"

oDCPROB02 := SingleLineEdit{self,ResourceID{JRATI_PROB02,_GetInst()}}
oDCPROB02:FieldSpec := PADRAO_CHAR_100{}
oDCPROB02:HyperLabel := HyperLabel{#PROB02,"Prob02:",NULL_STRING,"RATI_PROB02"}
oDCPROB02:TooltipText := "Descrição Não Conformidade"

oDCPROB03 := SingleLineEdit{self,ResourceID{JRATI_PROB03,_GetInst()}}
oDCPROB03:FieldSpec := PADRAO_CHAR_100{}
oDCPROB03:HyperLabel := HyperLabel{#PROB03,"Prob03:",NULL_STRING,"RATI_PROB03"}
oDCPROB03:TooltipText := "Descrição Não Conformidade"

oDCANAL01 := SingleLineEdit{self,ResourceID{JRATI_ANAL01,_GetInst()}}
oDCANAL01:FieldSpec := PADRAO_CHAR_100{}
oDCANAL01:HyperLabel := HyperLabel{#ANAL01,"Anal01:",NULL_STRING,"RATI_ANAL01"}
oDCANAL01:TooltipText := "Descrição Analise Critica"

oDCANAL02 := SingleLineEdit{self,ResourceID{JRATI_ANAL02,_GetInst()}}
oDCANAL02:FieldSpec := PADRAO_CHAR_100{}
oDCANAL02:HyperLabel := HyperLabel{#ANAL02,"Anal02:",NULL_STRING,"RATI_ANAL02"}
oDCANAL02:TooltipText := "Descrição Analise Critica"

oDCANAL03 := SingleLineEdit{self,ResourceID{JRATI_ANAL03,_GetInst()}}
oDCANAL03:FieldSpec := PADRAO_CHAR_100{}
oDCANAL03:HyperLabel := HyperLabel{#ANAL03,"Anal03:",NULL_STRING,"RATI_ANAL03"}
oDCANAL03:TooltipText := "Descrição Analise Critica"

oDCANAL04 := SingleLineEdit{self,ResourceID{JRATI_ANAL04,_GetInst()}}
oDCANAL04:FieldSpec := PADRAO_CHAR_100{}
oDCANAL04:HyperLabel := HyperLabel{#ANAL04,"Anal04:",NULL_STRING,"RATI_ANAL04"}
oDCANAL04:TooltipText := "Descrição Analise Critica"

oDCANAL05 := SingleLineEdit{self,ResourceID{JRATI_ANAL05,_GetInst()}}
oDCANAL05:HyperLabel := HyperLabel{#ANAL05,"Anal05:",NULL_STRING,"RATI_ANAL05"}
oDCANAL05:TooltipText := "Descrição Analise Critica"
oDCANAL05:FieldSpec := PADRAO_CHAR_100{}

oDCACAO01 := SingleLineEdit{self,ResourceID{JRATI_ACAO01,_GetInst()}}
oDCACAO01:FieldSpec := PADRAO_CHAR_100{}
oDCACAO01:HyperLabel := HyperLabel{#ACAO01,"Acao01:",NULL_STRING,"RATI_ACAO01"}
oDCACAO01:TooltipText := "Descrição Ação Imediata"

oDCACAO02 := SingleLineEdit{self,ResourceID{JRATI_ACAO02,_GetInst()}}
oDCACAO02:FieldSpec := PADRAO_CHAR_100{}
oDCACAO02:HyperLabel := HyperLabel{#ACAO02,"Acao02:",NULL_STRING,"RATI_ACAO02"}
oDCACAO02:TooltipText := "Descrição Ação Imediata"

oDCACAO03 := SingleLineEdit{self,ResourceID{JRATI_ACAO03,_GetInst()}}
oDCACAO03:FieldSpec := PADRAO_CHAR_100{}
oDCACAO03:HyperLabel := HyperLabel{#ACAO03,"Acao03:",NULL_STRING,"RATI_ACAO03"}
oDCACAO03:TooltipText := "Descrição Ação Imediata"

oDCRESNUM := rightSle{self,ResourceID{JRATI_RESNUM,_GetInst()}}
oDCRESNUM:FieldSpec := PADRAO_NUM_08{}
oDCRESNUM:HyperLabel := HyperLabel{#RESNUM,"Resnum:",NULL_STRING,"RATI_RESNUM"}
oDCRESNUM:TooltipText := "Numero Reg. Responsavel"

oDCRESNOME := SingleLineEdit{self,ResourceID{JRATI_RESNOME,_GetInst()}}
oDCRESNOME:FieldSpec := PADRAO_CHAR_40{}
oDCRESNOME:HyperLabel := HyperLabel{#RESNOME,"Resnome:",NULL_STRING,"RATI_RESNOME"}

oDCSAC := SingleLineEdit{self,ResourceID{JRATI_SAC,_GetInst()}}
oDCSAC:FieldSpec := PADRAO_NUM_08{}
oDCSAC:HyperLabel := HyperLabel{#SAC,"Sac:",NULL_STRING,"RATI_SAC"}
oDCSAC:TooltipText := "No da Sac"
oDCSAC:BackGround := aBrushes[1]
oDCSAC:Font(aFonts[1], FALSE)

oDCRACF := SingleLineEdit{self,ResourceID{JRATI_RACF,_GetInst()}}
oDCRACF:FieldSpec := PADRAO_NUM_08{}
oDCRACF:HyperLabel := HyperLabel{#RACF,"Racf:",NULL_STRING,"RATI_RACF"}
oDCRACF:TooltipText := "No da Racf"
oDCRACF:BackGround := aBrushes[1]
oDCRACF:Font(aFonts[1], FALSE)

oDCGroupBox1 := GroupBox{self,ResourceID{JRATI_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Acao Imediata",NULL_STRING,NULL_STRING}

oDCGroupBox2 := GroupBox{self,ResourceID{JRATI_GROUPBOX2,_GetInst()}}
oDCGroupBox2:HyperLabel := HyperLabel{#GroupBox2,"Analise Critica",NULL_STRING,NULL_STRING}

oDCGroupBox3 := GroupBox{self,ResourceID{JRATI_GROUPBOX3,_GetInst()}}
oDCGroupBox3:HyperLabel := HyperLabel{#GroupBox3,"Descricao Não Conformidade",NULL_STRING,NULL_STRING}

oDCLACAO := CheckBox{self,ResourceID{JRATI_LACAO,_GetInst()}}
oDCLACAO:HyperLabel := HyperLabel{#LACAO,"RA",NULL_STRING,NULL_STRING}
oDCLACAO:FieldSpec := LOGIC_FIELD{}
oDCLACAO:TooltipText := "Requer Ação"

oCCescres := PushButton{self,ResourceID{JRATI_ESCRES,_GetInst()}}
oCCescres:HyperLabel := HyperLabel{#escres,"...",NULL_STRING,NULL_STRING}
oCCescres:TooltipText := "Clique para Escolher Resp. Lista"

oCCpegres := PushButton{self,ResourceID{JRATI_PEGRES,_GetInst()}}
oCCpegres:HyperLabel := HyperLabel{#pegres,"-->",NULL_STRING,NULL_STRING}
oCCpegres:TooltipText := "Clique para Trazer Nome Funcionario"

oDCPARADA := CheckBox{self,ResourceID{JRATI_PARADA,_GetInst()}}
oDCPARADA:HyperLabel := HyperLabel{#PARADA,"Paradas No Cliente/Devolução Campo",NULL_STRING,NULL_STRING}
oDCPARADA:FieldSpec := LOGIC_FIELD{}
oDCPARADA:TooltipText := "Marcar Se Foi Parada NoCliente/Dev.Campo"

oCCRadioButton1 := RadioButton{self,ResourceID{JRATI_RADIOBUTTON1,_GetInst()}}
oCCRadioButton1:HyperLabel := HyperLabel{#RadioButton1,"Entrega",NULL_STRING,NULL_STRING}
oCCRadioButton1:TooltipText := "Marcar Como Relaçao de Entrega"

oCCRadioButton2 := RadioButton{self,ResourceID{JRATI_RADIOBUTTON2,_GetInst()}}
oCCRadioButton2:HyperLabel := HyperLabel{#RadioButton2,"Qualidade",NULL_STRING,NULL_STRING}
oCCRadioButton2:TooltipText := "Marca Como Relaçao Qualidade"

oCCRadioButton3 := RadioButton{self,ResourceID{JRATI_RADIOBUTTON3,_GetInst()}}
oCCRadioButton3:HyperLabel := HyperLabel{#RadioButton3,"Nenhuma",NULL_STRING,NULL_STRING}
oCCRadioButton3:TooltipText := "Marca Como Relaçao Qualidade"

oDCRELACAO := RadioButtonGroup{self,ResourceID{JRATI_RELACAO,_GetInst()}}
oDCRELACAO:FillUsing({ ;
						{oCCRadioButton1,"E"}, ;
						{oCCRadioButton2,"Q"}, ;
						{oCCRadioButton3,"N"} ;
						})
oDCRELACAO:HyperLabel := HyperLabel{#RELACAO,"Relaçao de:",NULL_STRING,NULL_STRING}
oDCRELACAO:FieldSpec := PADRAO_CHAR_01{}
oDCRELACAO:TooltipText := "Tipo de Relaçao"

self:Caption := "Itens do Relatorio de Assistencia Tecnica"
self:HyperLabel := HyperLabel{#jrati,"Itens do Relatorio de Assistencia Tecnica",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRAT := DataColumn{PADRAO_NUM_08{}}
oDBRAT:Width := 5
oDBRAT:HyperLabel := oDCRAT:HyperLabel 
oDBRAT:Caption := "Rat:"
oDBRAT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRAT)

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 24
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBQTDE := DataColumn{PADRAO_NUM_08{}}
oDBQTDE:Width := 10
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
self:Browser:AddColumn(oDBQTDE)

oDBRASTRO := DataColumn{PADRAO_CHAR_10{}}
oDBRASTRO:Width := 8
oDBRASTRO:HyperLabel := oDCRASTRO:HyperLabel 
oDBRASTRO:Caption := "Rastro:"
self:Browser:AddColumn(oDBRASTRO)

oDBPRAZO := DataColumn{DATE_FIELD{}}
oDBPRAZO:Width := 11
oDBPRAZO:HyperLabel := oDCPRAZO:HyperLabel 
oDBPRAZO:Caption := "Prazo:"
self:Browser:AddColumn(oDBPRAZO)

oDBSAC := DataColumn{PADRAO_NUM_08{}}
oDBSAC:Width := 9
oDBSAC:HyperLabel := oDCSAC:HyperLabel 
oDBSAC:Caption := "Sac:"
oDBSAC:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSAC)

oDBRACF := DataColumn{PADRAO_NUM_08{}}
oDBRACF:Width := 8
oDBRACF:HyperLabel := oDCRACF:HyperLabel 
oDBRACF:Caption := "Racf:"
oDBRACF:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRACF)

oDBLACAO := DataColumn{LOGIC_FIELD{}}
oDBLACAO:Width := 5
oDBLACAO:HyperLabel := oDCLACAO:HyperLabel 
oDBLACAO:Caption := "RA"
self:Browser:AddColumn(oDBLACAO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LACAO() 
return self:FieldGet(#LACAO)


assign LACAO(uValue) 
self:FieldPut(#LACAO, uValue)
return LACAO := uValue


access PARADA() 
return self:FieldGet(#PARADA)


assign PARADA(uValue) 
self:FieldPut(#PARADA, uValue)
return PARADA := uValue


METHOD pegres( )  

access PRAZO() 
return self:FieldGet(#PRAZO)


assign PRAZO(uValue) 
self:FieldPut(#PRAZO, uValue)
return PRAZO := uValue


access PROB01() 
return self:FieldGet(#PROB01)


assign PROB01(uValue) 
self:FieldPut(#PROB01, uValue)
return PROB01 := uValue


access PROB02() 
return self:FieldGet(#PROB02)


assign PROB02(uValue) 
self:FieldPut(#PROB02, uValue)
return PROB02 := uValue


access PROB03() 
return self:FieldGet(#PROB03)


assign PROB03(uValue) 
self:FieldPut(#PROB03, uValue)
return PROB03 := uValue


access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


access RACF() 
return self:FieldGet(#RACF)


assign RACF(uValue) 
self:FieldPut(#RACF, uValue)
return RACF := uValue


access RASTRO() 
return self:FieldGet(#RASTRO)


assign RASTRO(uValue) 
self:FieldPut(#RASTRO, uValue)
return RASTRO := uValue


access RAT() 
return self:FieldGet(#RAT)


assign RAT(uValue) 
self:FieldPut(#RAT, uValue)
return RAT := uValue


access RELACAO() 
return self:FieldGet(#RELACAO)


assign RELACAO(uValue) 
self:FieldPut(#RELACAO, uValue)
return RELACAO := uValue


access RESNOME() 
return self:FieldGet(#RESNOME)


assign RESNOME(uValue) 
self:FieldPut(#RESNOME, uValue)
return RESNOME := uValue


access RESNUM() 
return self:FieldGet(#RESNUM)


assign RESNUM(uValue) 
self:FieldPut(#RESNUM, uValue)
return RESNUM := uValue


access SAC() 
return self:FieldGet(#SAC)


assign SAC(uValue) 
self:FieldPut(#SAC, uValue)
return SAC := uValue


END CLASS
