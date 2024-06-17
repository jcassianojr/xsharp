#region DEFINES
STATIC DEFINE JFERGI_CAUTO := 126 
STATIC DEFINE JFERGI_CCM := 127 
STATIC DEFINE JFERGI_CODIGO := 129 
STATIC DEFINE JFERGI_DATABALAN := 124 
STATIC DEFINE JFERGI_DESENHO := 131 
STATIC DEFINE JFERGI_DIASENT := 122 
STATIC DEFINE JFERGI_DIASEST := 123 
STATIC DEFINE JFERGI_ESTQENT := 118 
STATIC DEFINE JFERGI_ESTQINI := 120 
STATIC DEFINE JFERGI_ESTQMIN := 117 
STATIC DEFINE JFERGI_ESTQSAI := 119 
STATIC DEFINE JFERGI_ESTQSAL := 121 
STATIC DEFINE JFERGI_FERRAM := 114 
STATIC DEFINE JFERGI_MINDI := 125 
STATIC DEFINE JFERGI_NOME := 115 
STATIC DEFINE JFERGI_SAIMIN := 116 
STATIC DEFINE JFERGI_SC_CAUTO := 112 
STATIC DEFINE JFERGI_SC_CCM := 113 
STATIC DEFINE JFERGI_SC_CODIGO := 128 
STATIC DEFINE JFERGI_SC_DATABALAN := 110 
STATIC DEFINE JFERGI_SC_DESENHO := 130 
STATIC DEFINE JFERGI_SC_DIASENT := 108 
STATIC DEFINE JFERGI_SC_DIASEST := 109 
STATIC DEFINE JFERGI_SC_ESTQENT := 104 
STATIC DEFINE JFERGI_SC_ESTQINI := 106 
STATIC DEFINE JFERGI_SC_ESTQMIN := 103 
STATIC DEFINE JFERGI_SC_ESTQSAI := 105 
STATIC DEFINE JFERGI_SC_ESTQSAL := 107 
STATIC DEFINE JFERGI_SC_FERRAM := 100 
STATIC DEFINE JFERGI_SC_MINDI := 111 
STATIC DEFINE JFERGI_SC_NOME := 101 
STATIC DEFINE JFERGI_SC_SAIMIN := 102 
#endregion

class JFERGI inherit DATAWINDOW 

	PROTECT oDBFERRAM as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDESENHO as DataColumn
	PROTECT oDBESTQSAL as DataColumn
	protect oDCSC_FERRAM as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_SAIMIN as FIXEDTEXT
	protect oDCSC_ESTQMIN as FIXEDTEXT
	protect oDCSC_ESTQENT as FIXEDTEXT
	protect oDCSC_ESTQSAI as FIXEDTEXT
	protect oDCSC_ESTQINI as FIXEDTEXT
	protect oDCSC_ESTQSAL as FIXEDTEXT
	protect oDCSC_DIASENT as FIXEDTEXT
	protect oDCSC_DIASEST as FIXEDTEXT
	protect oDCSC_DATABALAN as FIXEDTEXT
	protect oDCSC_MINDI as FIXEDTEXT
	protect oDCSC_CAUTO as FIXEDTEXT
	protect oDCSC_CCM as FIXEDTEXT
	protect oDCFERRAM as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSAIMIN as SINGLELINEEDIT
	protect oDCESTQMIN as SINGLELINEEDIT
	protect oDCESTQENT as SINGLELINEEDIT
	protect oDCESTQSAI as SINGLELINEEDIT
	protect oDCESTQINI as SINGLELINEEDIT
	protect oDCESTQSAL as SINGLELINEEDIT
	protect oDCDIASENT as RIGHTSLE
	protect oDCDIASEST as RIGHTSLE
	protect oDCDATABALAN as SINGLELINEEDIT
	protect oDCMINDI as RIGHTSLE
	protect oDCCAUTO as RIGHTSLE
	protect oDCCCM as SINGLELINEEDIT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_DESENHO as FIXEDTEXT
	protect oDCDESENHO as SINGLELINEEDIT
// 	instance FERRAM 
// 	instance NOME 
// 	instance SAIMIN 
// 	instance ESTQMIN 
// 	instance ESTQENT 
// 	instance ESTQSAI 
// 	instance ESTQINI 
// 	instance ESTQSAL 
// 	instance DIASENT 
// 	instance DIASEST 
// 	instance DATABALAN 
// 	instance MINDI 
// 	instance CAUTO 
// 	instance CCM 
// 	instance CODIGO 
// 	instance DESENHO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CAUTO() 
return self:FieldGet(#CAUTO)


assign CAUTO(uValue) 
self:FieldPut(#CAUTO, uValue)
return CAUTO := uValue


access CCM() 
return self:FieldGet(#CCM)


assign CCM(uValue) 
self:FieldPut(#CCM, uValue)
return CCM := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DATABALAN() 
return self:FieldGet(#DATABALAN)


assign DATABALAN(uValue) 
self:FieldPut(#DATABALAN, uValue)
return DATABALAN := uValue


access DESENHO() 
return self:FieldGet(#DESENHO)


assign DESENHO(uValue) 
self:FieldPut(#DESENHO, uValue)
return DESENHO := uValue


access DIASENT() 
return self:FieldGet(#DIASENT)


assign DIASENT(uValue) 
self:FieldPut(#DIASENT, uValue)
return DIASENT := uValue


access DIASEST() 
return self:FieldGet(#DIASEST)


assign DIASEST(uValue) 
self:FieldPut(#DIASEST, uValue)
return DIASEST := uValue


access ESTQENT() 
return self:FieldGet(#ESTQENT)


assign ESTQENT(uValue) 
self:FieldPut(#ESTQENT, uValue)
return ESTQENT := uValue


access ESTQINI() 
return self:FieldGet(#ESTQINI)


assign ESTQINI(uValue) 
self:FieldPut(#ESTQINI, uValue)
return ESTQINI := uValue


access ESTQMIN() 
return self:FieldGet(#ESTQMIN)


assign ESTQMIN(uValue) 
self:FieldPut(#ESTQMIN, uValue)
return ESTQMIN := uValue


access ESTQSAI() 
return self:FieldGet(#ESTQSAI)


assign ESTQSAI(uValue) 
self:FieldPut(#ESTQSAI, uValue)
return ESTQSAI := uValue


access ESTQSAL() 
return self:FieldGet(#ESTQSAL)


assign ESTQSAL(uValue) 
self:FieldPut(#ESTQSAL, uValue)
return ESTQSAL := uValue


access FERRAM() 
return self:FieldGet(#FERRAM)


assign FERRAM(uValue) 
self:FieldPut(#FERRAM, uValue)
return FERRAM := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFERGI",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_FERRAM := FixedText{self,ResourceID{JFERGI_SC_FERRAM,_GetInst()}}
oDCSC_FERRAM:HyperLabel := HyperLabel{#SC_FERRAM,"Ferramenta /Grupo",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JFERGI_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_SAIMIN := FixedText{self,ResourceID{JFERGI_SC_SAIMIN,_GetInst()}}
oDCSC_SAIMIN:HyperLabel := HyperLabel{#SC_SAIMIN,"CMM Mvto:",NULL_STRING,NULL_STRING}

oDCSC_ESTQMIN := FixedText{self,ResourceID{JFERGI_SC_ESTQMIN,_GetInst()}}
oDCSC_ESTQMIN:HyperLabel := HyperLabel{#SC_ESTQMIN,"Minimo Movto",NULL_STRING,NULL_STRING}

oDCSC_ESTQENT := FixedText{self,ResourceID{JFERGI_SC_ESTQENT,_GetInst()}}
oDCSC_ESTQENT:HyperLabel := HyperLabel{#SC_ESTQENT,"Entradas:",NULL_STRING,NULL_STRING}

oDCSC_ESTQSAI := FixedText{self,ResourceID{JFERGI_SC_ESTQSAI,_GetInst()}}
oDCSC_ESTQSAI:HyperLabel := HyperLabel{#SC_ESTQSAI,"Saidas",NULL_STRING,NULL_STRING}

oDCSC_ESTQINI := FixedText{self,ResourceID{JFERGI_SC_ESTQINI,_GetInst()}}
oDCSC_ESTQINI:HyperLabel := HyperLabel{#SC_ESTQINI,"Inicial",NULL_STRING,NULL_STRING}

oDCSC_ESTQSAL := FixedText{self,ResourceID{JFERGI_SC_ESTQSAL,_GetInst()}}
oDCSC_ESTQSAL:HyperLabel := HyperLabel{#SC_ESTQSAL,"Saldo",NULL_STRING,NULL_STRING}

oDCSC_DIASENT := FixedText{self,ResourceID{JFERGI_SC_DIASENT,_GetInst()}}
oDCSC_DIASENT:HyperLabel := HyperLabel{#SC_DIASENT,"Dias Entrega:",NULL_STRING,NULL_STRING}

oDCSC_DIASEST := FixedText{self,ResourceID{JFERGI_SC_DIASEST,_GetInst()}}
oDCSC_DIASEST:HyperLabel := HyperLabel{#SC_DIASEST,"Dias Estoque",NULL_STRING,NULL_STRING}

oDCSC_DATABALAN := FixedText{self,ResourceID{JFERGI_SC_DATABALAN,_GetInst()}}
oDCSC_DATABALAN:HyperLabel := HyperLabel{#SC_DATABALAN,"Em:",NULL_STRING,NULL_STRING}

oDCSC_MINDI := FixedText{self,ResourceID{JFERGI_SC_MINDI,_GetInst()}}
oDCSC_MINDI:HyperLabel := HyperLabel{#SC_MINDI,"Minimo Indicado",NULL_STRING,NULL_STRING}

oDCSC_CAUTO := FixedText{self,ResourceID{JFERGI_SC_CAUTO,_GetInst()}}
oDCSC_CAUTO:HyperLabel := HyperLabel{#SC_CAUTO,"Disparar com:",NULL_STRING,NULL_STRING}

oDCSC_CCM := FixedText{self,ResourceID{JFERGI_SC_CCM,_GetInst()}}
oDCSC_CCM:HyperLabel := HyperLabel{#SC_CCM,"Ccm Apurado",NULL_STRING,NULL_STRING}

oDCFERRAM := SingleLineEdit{self,ResourceID{JFERGI_FERRAM,_GetInst()}}
oDCFERRAM:FieldSpec := PADRAO_CHAR_24{}
oDCFERRAM:HyperLabel := HyperLabel{#FERRAM,"Ferramenta/Grupo",NULL_STRING,"Fergi_FERRAM"}
oDCFERRAM:BackGround := aBrushes[1]
oDCFERRAM:Font(aFonts[1], FALSE)

oDCNOME := SingleLineEdit{self,ResourceID{JFERGI_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"DataWindow Caption",NULL_STRING,"Fergi_NOME"}

oDCSAIMIN := SingleLineEdit{self,ResourceID{JFERGI_SAIMIN,_GetInst()}}
oDCSAIMIN:FieldSpec := PADRAO_NUM_12_3{}
oDCSAIMIN:HyperLabel := HyperLabel{#SAIMIN,"Saimin:",NULL_STRING,"Fergi_SAIMIN"}
oDCSAIMIN:BackGround := aBrushes[1]
oDCSAIMIN:Font(aFonts[1], FALSE)

oDCESTQMIN := SingleLineEdit{self,ResourceID{JFERGI_ESTQMIN,_GetInst()}}
oDCESTQMIN:FieldSpec := PADRAO_NUM_12_3{}
oDCESTQMIN:HyperLabel := HyperLabel{#ESTQMIN,"Estqmin:",NULL_STRING,"Fergi_ESTQMIN"}
oDCESTQMIN:BackGround := aBrushes[1]
oDCESTQMIN:Font(aFonts[1], FALSE)

oDCESTQENT := SingleLineEdit{self,ResourceID{JFERGI_ESTQENT,_GetInst()}}
oDCESTQENT:FieldSpec := PADRAO_NUM_12_3{}
oDCESTQENT:HyperLabel := HyperLabel{#ESTQENT,"Estqent:",NULL_STRING,"Fergi_ESTQENT"}
oDCESTQENT:BackGround := aBrushes[1]
oDCESTQENT:Font(aFonts[1], FALSE)

oDCESTQSAI := SingleLineEdit{self,ResourceID{JFERGI_ESTQSAI,_GetInst()}}
oDCESTQSAI:FieldSpec := PADRAO_NUM_12_3{}
oDCESTQSAI:HyperLabel := HyperLabel{#ESTQSAI,"Estqsai:",NULL_STRING,"Fergi_ESTQSAI"}
oDCESTQSAI:BackGround := aBrushes[1]
oDCESTQSAI:Font(aFonts[1], FALSE)

oDCESTQINI := SingleLineEdit{self,ResourceID{JFERGI_ESTQINI,_GetInst()}}
oDCESTQINI:FieldSpec := PADRAO_NUM_12_3{}
oDCESTQINI:HyperLabel := HyperLabel{#ESTQINI,"Estqini:",NULL_STRING,"Fergi_ESTQINI"}
oDCESTQINI:BackGround := aBrushes[1]
oDCESTQINI:Font(aFonts[1], FALSE)

oDCESTQSAL := SingleLineEdit{self,ResourceID{JFERGI_ESTQSAL,_GetInst()}}
oDCESTQSAL:FieldSpec := PADRAO_NUM_12_3{}
oDCESTQSAL:HyperLabel := HyperLabel{#ESTQSAL,"Estoque",NULL_STRING,"Fergi_ESTQSAL"}
oDCESTQSAL:BackGround := aBrushes[1]
oDCESTQSAL:Font(aFonts[1], FALSE)

oDCDIASENT := rightSle{self,ResourceID{JFERGI_DIASENT,_GetInst()}}
oDCDIASENT:FieldSpec := PADRAO_NUM_03{}
oDCDIASENT:HyperLabel := HyperLabel{#DIASENT,"Diasent:",NULL_STRING,"Fergi_DIASENT"}

oDCDIASEST := rightSle{self,ResourceID{JFERGI_DIASEST,_GetInst()}}
oDCDIASEST:FieldSpec := PADRAO_NUM_03{}
oDCDIASEST:HyperLabel := HyperLabel{#DIASEST,"Diasest:",NULL_STRING,"Fergi_DIASEST"}

oDCDATABALAN := SingleLineEdit{self,ResourceID{JFERGI_DATABALAN,_GetInst()}}
oDCDATABALAN:FieldSpec := DATE_FIELD{}
oDCDATABALAN:HyperLabel := HyperLabel{#DATABALAN,"Databalan:",NULL_STRING,"Fergi_DATABALAN"}
oDCDATABALAN:BackGround := aBrushes[1]
oDCDATABALAN:Font(aFonts[1], FALSE)

oDCMINDI := rightSle{self,ResourceID{JFERGI_MINDI,_GetInst()}}
oDCMINDI:FieldSpec := PADRAO_NUM_12_3{}
oDCMINDI:HyperLabel := HyperLabel{#MINDI,"Mindi:",NULL_STRING,"Fergi_MINDI"}

oDCCAUTO := rightSle{self,ResourceID{JFERGI_CAUTO,_GetInst()}}
oDCCAUTO:FieldSpec := PADRAO_NUM_12_3{}
oDCCAUTO:HyperLabel := HyperLabel{#CAUTO,"Cauto:",NULL_STRING,"Fergi_CAUTO"}

oDCCCM := SingleLineEdit{self,ResourceID{JFERGI_CCM,_GetInst()}}
oDCCCM:FieldSpec := PADRAO_NUM_15_6{}
oDCCCM:HyperLabel := HyperLabel{#CCM,"Ccm:",NULL_STRING,"Fergi_CCM"}
oDCCCM:BackGround := aBrushes[1]
oDCCCM:Font(aFonts[1], FALSE)

oDCSC_CODIGO := FixedText{self,ResourceID{JFERGI_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JFERGI_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_20{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"Fergi_CODIGO"}

oDCSC_DESENHO := FixedText{self,ResourceID{JFERGI_SC_DESENHO,_GetInst()}}
oDCSC_DESENHO:HyperLabel := HyperLabel{#SC_DESENHO,"Desenho:",NULL_STRING,NULL_STRING}

oDCDESENHO := SingleLineEdit{self,ResourceID{JFERGI_DESENHO,_GetInst()}}
oDCDESENHO:FieldSpec := PADRAO_CHAR_40{}
oDCDESENHO:HyperLabel := HyperLabel{#DESENHO,"Desenho:",NULL_STRING,"Fergi_DESENHO"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JFERGI,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBFERRAM := DataColumn{PADRAO_CHAR_24{}}
oDBFERRAM:Width := 18
oDBFERRAM:HyperLabel := oDCFERRAM:HyperLabel 
oDBFERRAM:Caption := "Ferramenta/Grupo"
oDBFERRAM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBFERRAM)

oDBCODIGO := DataColumn{PADRAO_CHAR_20{}}
oDBCODIGO:Width := 15
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBDESENHO := DataColumn{PADRAO_CHAR_40{}}
oDBDESENHO:Width := 15
oDBDESENHO:HyperLabel := oDCDESENHO:HyperLabel 
oDBDESENHO:Caption := "Desenho:"
self:Browser:AddColumn(oDBDESENHO)

oDBESTQSAL := DataColumn{PADRAO_NUM_12_3{}}
oDBESTQSAL:Width := 18
oDBESTQSAL:HyperLabel := oDCESTQSAL:HyperLabel 
oDBESTQSAL:Caption := "Estoque"
oDBESTQSAL:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBESTQSAL)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MINDI() 
return self:FieldGet(#MINDI)


assign MINDI(uValue) 
self:FieldPut(#MINDI, uValue)
return MINDI := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access SAIMIN() 
return self:FieldGet(#SAIMIN)


assign SAIMIN(uValue) 
self:FieldPut(#SAIMIN, uValue)
return SAIMIN := uValue


END CLASS
