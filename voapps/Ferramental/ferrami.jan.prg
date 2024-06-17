#region DEFINES
STATIC DEFINE JFERRAMI_FERRAM := 104 
STATIC DEFINE JFERRAMI_ITEM := 102 
STATIC DEFINE JFERRAMI_LIN01 := 100 
STATIC DEFINE JFERRAMI_SC_FERRAM := 105 
STATIC DEFINE JFERRAMI_SC_NOME := 101 
STATIC DEFINE JFERRAMI_TEXTO := 103 
#endregion

class jferrami inherit DATAWINDOW 

	PROTECT oDBFERRAM as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBLIN01 as DataColumn
	protect oDCLIN01 as SINGLELINEEDIT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCITEM as RIGHTSLE
	protect oDCTEXTO as FIXEDTEXT
	protect oDCFERRAM as SINGLELINEEDIT
	protect oDCSC_FERRAM as FIXEDTEXT
// 	instance LIN01 
// 	instance ITEM 
// 	instance FERRAM 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access FERRAM() 
return self:FieldGet(#FERRAM)


assign FERRAM(uValue) 
self:FieldPut(#FERRAM, uValue)
return FERRAM := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jferrami",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCLIN01 := SingleLineEdit{self,ResourceID{JFERRAMI_LIN01,_GetInst()}}
oDCLIN01:FieldSpec := PADRAO_CHAR_80{}
oDCLIN01:HyperLabel := HyperLabel{#LIN01,"Descricao",NULL_STRING,"FERRAM_NOME"}

oDCSC_NOME := FixedText{self,ResourceID{JFERRAMI_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Instrucao",NULL_STRING,NULL_STRING}

oDCITEM := rightSLE{self,ResourceID{JFERRAMI_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_NUM_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item",NULL_STRING,"FERRAM_FERRAM"}

oDCTEXTO := FixedText{self,ResourceID{JFERRAMI_TEXTO,_GetInst()}}
oDCTEXTO:HyperLabel := HyperLabel{#TEXTO,"Seq",NULL_STRING,NULL_STRING}

oDCFERRAM := SingleLineEdit{self,ResourceID{JFERRAMI_FERRAM,_GetInst()}}
oDCFERRAM:FieldSpec := PADRAO_CHAR_24{}
oDCFERRAM:HyperLabel := HyperLabel{#FERRAM,"Ferram:",NULL_STRING,"FERRAM_FERRAM"}
oDCFERRAM:BackGround := aBrushes[1]
oDCFERRAM:Font(aFonts[1], FALSE)

oDCSC_FERRAM := FixedText{self,ResourceID{JFERRAMI_SC_FERRAM,_GetInst()}}
oDCSC_FERRAM:HyperLabel := HyperLabel{#SC_FERRAM,"Ferramenta",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jferrami,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBFERRAM := DataColumn{PADRAO_CHAR_24{}}
oDBFERRAM:Width := 23
oDBFERRAM:HyperLabel := oDCFERRAM:HyperLabel 
oDBFERRAM:Caption := "Ferram:"
oDBFERRAM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBFERRAM)

oDBITEM := DataColumn{PADRAO_NUM_03{}}
oDBITEM:Width := 7
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item"
self:Browser:AddColumn(oDBITEM)

oDBLIN01 := DataColumn{PADRAO_CHAR_80{}}
oDBLIN01:Width := 64
oDBLIN01:HyperLabel := oDCLIN01:HyperLabel 
oDBLIN01:Caption := "Descricao"
self:Browser:AddColumn(oDBLIN01)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access LIN01() 
return self:FieldGet(#LIN01)


assign LIN01(uValue) 
self:FieldPut(#LIN01, uValue)
return LIN01 := uValue


END CLASS
