#region DEFINES
STATIC DEFINE JFAPUI_FERRAM := 105 
STATIC DEFINE JFAPUI_HORAS := 107 
STATIC DEFINE JFAPUI_QTDE := 106 
STATIC DEFINE JFAPUI_SC_FERRAM := 101 
STATIC DEFINE JFAPUI_SC_HORAS := 103 
STATIC DEFINE JFAPUI_SC_QTDE := 102 
STATIC DEFINE JFAPUI_SC_SEQ := 100 
STATIC DEFINE JFAPUI_SEQ := 104 
#endregion

class JFAPUI inherit DATAWINDOW 

	PROTECT oDBSEQ as DataColumn
	PROTECT oDBFERRAM as DataColumn
	PROTECT oDBHORAS as DataColumn
	PROTECT oDBQTDE as DataColumn
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSC_FERRAM as FIXEDTEXT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCSC_HORAS as FIXEDTEXT
	protect oDCSEQ as SINGLELINEEDIT
	protect oDCFERRAM as SINGLELINEEDIT
	protect oDCQTDE as RIGHTSLE
	protect oDCHORAS as RIGHTSLE
// 	instance SEQ 
// 	instance FERRAM 
// 	instance QTDE 
// 	instance HORAS 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access FERRAM() 
return self:FieldGet(#FERRAM)


assign FERRAM(uValue) 
self:FieldPut(#FERRAM, uValue)
return FERRAM := uValue


access HORAS() 
return self:FieldGet(#HORAS)


assign HORAS(uValue) 
self:FieldPut(#HORAS, uValue)
return HORAS := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFAPUI",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_SEQ := FixedText{self,ResourceID{JFAPUI_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSC_FERRAM := FixedText{self,ResourceID{JFAPUI_SC_FERRAM,_GetInst()}}
oDCSC_FERRAM:HyperLabel := HyperLabel{#SC_FERRAM,"Fer/Maq",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{self,ResourceID{JFAPUI_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCSC_HORAS := FixedText{self,ResourceID{JFAPUI_SC_HORAS,_GetInst()}}
oDCSC_HORAS:HyperLabel := HyperLabel{#SC_HORAS,"Horas:",NULL_STRING,NULL_STRING}

oDCSEQ := SingleLineEdit{self,ResourceID{JFAPUI_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := padrao_num_08{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"fapui_SEQ"}
oDCSEQ:BackGround := aBrushes[1]
oDCSEQ:Font(aFonts[1], FALSE)

oDCFERRAM := SingleLineEdit{self,ResourceID{JFAPUI_FERRAM,_GetInst()}}
oDCFERRAM:FieldSpec := padrao_char_24{}
oDCFERRAM:HyperLabel := HyperLabel{#FERRAM,"Fer/Maq:",NULL_STRING,"fapui_FERRAM"}

oDCQTDE := rightSle{self,ResourceID{JFAPUI_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := padrao_num_12{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"fapui_QTDE"}

oDCHORAS := rightSle{self,ResourceID{JFAPUI_HORAS,_GetInst()}}
oDCHORAS:FieldSpec := padrao_num_09_2{}
oDCHORAS:HyperLabel := HyperLabel{#HORAS,"Horas:",NULL_STRING,"fapui_HORAS"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JFAPUI,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBSEQ := DataColumn{padrao_num_08{}}
oDBSEQ:Width := 5
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
oDBSEQ:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSEQ)

oDBFERRAM := DataColumn{padrao_char_24{}}
oDBFERRAM:Width := 21
oDBFERRAM:HyperLabel := oDCFERRAM:HyperLabel 
oDBFERRAM:Caption := "Fer/Maq:"
self:Browser:AddColumn(oDBFERRAM)

oDBHORAS := DataColumn{padrao_num_09_2{}}
oDBHORAS:Width := 10
oDBHORAS:HyperLabel := oDCHORAS:HyperLabel 
oDBHORAS:Caption := "Horas:"
self:Browser:AddColumn(oDBHORAS)

oDBQTDE := DataColumn{padrao_num_12{}}
oDBQTDE:Width := 12
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
self:Browser:AddColumn(oDBQTDE)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


END CLASS
