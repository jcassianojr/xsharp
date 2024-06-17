#region DEFINES
STATIC DEFINE JBTII_BTI := 107 
STATIC DEFINE JBTII_CAPACIDA := 113 
STATIC DEFINE JBTII_CAVIDADE := 110 
STATIC DEFINE JBTII_CICLO := 112 
STATIC DEFINE JBTII_DESCRICAO := 109 
STATIC DEFINE JBTII_PRECO := 111 
STATIC DEFINE JBTII_QTDE := 108 
STATIC DEFINE JBTII_SC_BTI := 100 
STATIC DEFINE JBTII_SC_CAPACIDA := 106 
STATIC DEFINE JBTII_SC_CAVIDADE := 103 
STATIC DEFINE JBTII_SC_CICLO := 105 
STATIC DEFINE JBTII_SC_DESCRICAO := 102 
STATIC DEFINE JBTII_SC_PRECO := 104 
STATIC DEFINE JBTII_SC_QTDE := 101 
#endregion

class jbtii inherit DATAWINDOW 

	PROTECT oDBBTI as DataColumn
	PROTECT oDBQTDE as DataColumn
	PROTECT oDBDESCRICAO as DataColumn
	PROTECT oDBCAVIDADE as DataColumn
	PROTECT oDBPRECO as DataColumn
	PROTECT oDBCICLO as DataColumn
	PROTECT oDBCAPACIDA as DataColumn
	protect oDCSC_BTI as FIXEDTEXT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCSC_DESCRICAO as FIXEDTEXT
	protect oDCSC_CAVIDADE as FIXEDTEXT
	protect oDCSC_PRECO as FIXEDTEXT
	protect oDCSC_CICLO as FIXEDTEXT
	protect oDCSC_CAPACIDA as FIXEDTEXT
	protect oDCBTI as SINGLELINEEDIT
	protect oDCQTDE as SINGLELINEEDIT
	protect oDCDESCRICAO as SINGLELINEEDIT
	protect oDCCAVIDADE as SINGLELINEEDIT
	protect oDCPRECO as SINGLELINEEDIT
	protect oDCCICLO as SINGLELINEEDIT
	protect oDCCAPACIDA as SINGLELINEEDIT
// 	instance BTI 
// 	instance QTDE 
// 	instance DESCRICAO 
// 	instance CAVIDADE 
// 	instance PRECO 
// 	instance CICLO 
// 	instance CAPACIDA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access BTI() 
return self:FieldGet(#BTI)


assign BTI(uValue) 
self:FieldPut(#BTI, uValue)
return BTI := uValue


access CAPACIDA() 
return self:FieldGet(#CAPACIDA)


assign CAPACIDA(uValue) 
self:FieldPut(#CAPACIDA, uValue)
return CAPACIDA := uValue


access CAVIDADE() 
return self:FieldGet(#CAVIDADE)


assign CAVIDADE(uValue) 
self:FieldPut(#CAVIDADE, uValue)
return CAVIDADE := uValue


access CICLO() 
return self:FieldGet(#CICLO)


assign CICLO(uValue) 
self:FieldPut(#CICLO, uValue)
return CICLO := uValue


access DESCRICAO() 
return self:FieldGet(#DESCRICAO)


assign DESCRICAO(uValue) 
self:FieldPut(#DESCRICAO, uValue)
return DESCRICAO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jbtii",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_BTI := FixedText{self,ResourceID{JBTII_SC_BTI,_GetInst()}}
oDCSC_BTI:HyperLabel := HyperLabel{#SC_BTI,"Bti:",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{self,ResourceID{JBTII_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCSC_DESCRICAO := FixedText{self,ResourceID{JBTII_SC_DESCRICAO,_GetInst()}}
oDCSC_DESCRICAO:HyperLabel := HyperLabel{#SC_DESCRICAO,"Descricao:",NULL_STRING,NULL_STRING}

oDCSC_CAVIDADE := FixedText{self,ResourceID{JBTII_SC_CAVIDADE,_GetInst()}}
oDCSC_CAVIDADE:HyperLabel := HyperLabel{#SC_CAVIDADE,"Cavidade:",NULL_STRING,NULL_STRING}

oDCSC_PRECO := FixedText{self,ResourceID{JBTII_SC_PRECO,_GetInst()}}
oDCSC_PRECO:HyperLabel := HyperLabel{#SC_PRECO,"Preco:",NULL_STRING,NULL_STRING}

oDCSC_CICLO := FixedText{self,ResourceID{JBTII_SC_CICLO,_GetInst()}}
oDCSC_CICLO:HyperLabel := HyperLabel{#SC_CICLO,"Ciclo:",NULL_STRING,NULL_STRING}

oDCSC_CAPACIDA := FixedText{self,ResourceID{JBTII_SC_CAPACIDA,_GetInst()}}
oDCSC_CAPACIDA:HyperLabel := HyperLabel{#SC_CAPACIDA,"Capacidade",NULL_STRING,NULL_STRING}

oDCBTI := SingleLineEdit{self,ResourceID{JBTII_BTI,_GetInst()}}
oDCBTI:FieldSpec := PADRAO_NUM_08{}
oDCBTI:HyperLabel := HyperLabel{#BTI,"Bti:",NULL_STRING,"BTII_BTI"}
oDCBTI:BackGround := aBrushes[1]
oDCBTI:Font(aFonts[1], FALSE)

oDCQTDE := SingleLineEdit{self,ResourceID{JBTII_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := PADRAO_NUM_08{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Nº Tools",NULL_STRING,"BTII_QTDE"}

oDCDESCRICAO := SingleLineEdit{self,ResourceID{JBTII_DESCRICAO,_GetInst()}}
oDCDESCRICAO:FieldSpec := PADRAO_CHAR_80{}
oDCDESCRICAO:HyperLabel := HyperLabel{#DESCRICAO,"Descricao:",NULL_STRING,"BTII_DESCRICAO"}

oDCCAVIDADE := SingleLineEdit{self,ResourceID{JBTII_CAVIDADE,_GetInst()}}
oDCCAVIDADE:FieldSpec := PADRAO_NUM_08{}
oDCCAVIDADE:HyperLabel := HyperLabel{#CAVIDADE,"Cavidade:",NULL_STRING,"BTII_CAVIDADE"}

oDCPRECO := SingleLineEdit{self,ResourceID{JBTII_PRECO,_GetInst()}}
oDCPRECO:FieldSpec := padrao_num_12_2{}
oDCPRECO:HyperLabel := HyperLabel{#PRECO,"Preco:",NULL_STRING,"BTII_PRECO"}

oDCCICLO := SingleLineEdit{self,ResourceID{JBTII_CICLO,_GetInst()}}
oDCCICLO:FieldSpec := padrao_char_20{}
oDCCICLO:HyperLabel := HyperLabel{#CICLO,"Ciclo:",NULL_STRING,"BTII_CICLO"}

oDCCAPACIDA := SingleLineEdit{self,ResourceID{JBTII_CAPACIDA,_GetInst()}}
oDCCAPACIDA:FieldSpec := padrao_char_20{}
oDCCAPACIDA:HyperLabel := HyperLabel{#CAPACIDA,"Capacida:",NULL_STRING,"BTII_CAPACIDA"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jbtii,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBBTI := DataColumn{PADRAO_NUM_08{}}
oDBBTI:Width := 5
oDBBTI:HyperLabel := oDCBTI:HyperLabel 
oDBBTI:Caption := "Bti:"
oDBBTI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBBTI)

oDBQTDE := DataColumn{PADRAO_NUM_08{}}
oDBQTDE:Width := 7
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Nº Tools"
self:Browser:AddColumn(oDBQTDE)

oDBDESCRICAO := DataColumn{PADRAO_CHAR_80{}}
oDBDESCRICAO:Width := 26
oDBDESCRICAO:HyperLabel := oDCDESCRICAO:HyperLabel 
oDBDESCRICAO:Caption := "Descricao:"
self:Browser:AddColumn(oDBDESCRICAO)

oDBCAVIDADE := DataColumn{PADRAO_NUM_08{}}
oDBCAVIDADE:Width := 10
oDBCAVIDADE:HyperLabel := oDCCAVIDADE:HyperLabel 
oDBCAVIDADE:Caption := "Cavidade:"
self:Browser:AddColumn(oDBCAVIDADE)

oDBPRECO := DataColumn{padrao_num_12_2{}}
oDBPRECO:Width := 13
oDBPRECO:HyperLabel := oDCPRECO:HyperLabel 
oDBPRECO:Caption := "Preco:"
self:Browser:AddColumn(oDBPRECO)

oDBCICLO := DataColumn{padrao_char_20{}}
oDBCICLO:Width := 7
oDBCICLO:HyperLabel := oDCCICLO:HyperLabel 
oDBCICLO:Caption := "Ciclo:"
self:Browser:AddColumn(oDBCICLO)

oDBCAPACIDA := DataColumn{padrao_char_20{}}
oDBCAPACIDA:Width := 10
oDBCAPACIDA:HyperLabel := oDCCAPACIDA:HyperLabel 
oDBCAPACIDA:Caption := "Capacida:"
self:Browser:AddColumn(oDBCAPACIDA)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PRECO() 
return self:FieldGet(#PRECO)


assign PRECO(uValue) 
self:FieldPut(#PRECO, uValue)
return PRECO := uValue


access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


END CLASS
