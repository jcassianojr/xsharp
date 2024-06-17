#region DEFINES
STATIC DEFINE JADPI_ADP := 104 
STATIC DEFINE JADPI_ENCO := 106 
STATIC DEFINE JADPI_ESPC := 105 
STATIC DEFINE JADPI_LAUDO := 107 
STATIC DEFINE JADPI_SC_ADP := 100 
STATIC DEFINE JADPI_SC_ENCO := 102 
STATIC DEFINE JADPI_SC_ESPC := 101 
STATIC DEFINE JADPI_SC_LAUDO := 103 
#endregion

class JADPI inherit DATAWINDOW 

	PROTECT oDBADP as DataColumn
	PROTECT oDBESPC as DataColumn
	PROTECT oDBENCO as DataColumn
	PROTECT oDBLAUDO as DataColumn
	protect oDCSC_ADP as FIXEDTEXT
	protect oDCSC_ESPC as FIXEDTEXT
	protect oDCSC_ENCO as FIXEDTEXT
	protect oDCSC_LAUDO as FIXEDTEXT
	protect oDCADP as SINGLELINEEDIT
	protect oDCESPC as SINGLELINEEDIT
	protect oDCENCO as SINGLELINEEDIT
	protect oDCLAUDO as SINGLELINEEDIT
// 	instance ADP 
// 	instance ESPC 
// 	instance ENCO 
// 	instance LAUDO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ADP() 
return self:FieldGet(#ADP)


assign ADP(uValue) 
self:FieldPut(#ADP, uValue)
return ADP := uValue


access ENCO() 
return self:FieldGet(#ENCO)


assign ENCO(uValue) 
self:FieldPut(#ENCO, uValue)
return ENCO := uValue


access ESPC() 
return self:FieldGet(#ESPC)


assign ESPC(uValue) 
self:FieldPut(#ESPC, uValue)
return ESPC := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JADPI",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_ADP := FixedText{self,ResourceID{JADPI_SC_ADP,_GetInst()}}
oDCSC_ADP:HyperLabel := HyperLabel{#SC_ADP,"Adp:",NULL_STRING,NULL_STRING}

oDCSC_ESPC := FixedText{self,ResourceID{JADPI_SC_ESPC,_GetInst()}}
oDCSC_ESPC:HyperLabel := HyperLabel{#SC_ESPC,"Especificado:",NULL_STRING,NULL_STRING}

oDCSC_ENCO := FixedText{self,ResourceID{JADPI_SC_ENCO,_GetInst()}}
oDCSC_ENCO:HyperLabel := HyperLabel{#SC_ENCO,"Encontrado:",NULL_STRING,NULL_STRING}

oDCSC_LAUDO := FixedText{self,ResourceID{JADPI_SC_LAUDO,_GetInst()}}
oDCSC_LAUDO:HyperLabel := HyperLabel{#SC_LAUDO,"Laudo:",NULL_STRING,NULL_STRING}

oDCADP := SingleLineEdit{self,ResourceID{JADPI_ADP,_GetInst()}}
oDCADP:FieldSpec := PADRAO_NUM_08{}
oDCADP:HyperLabel := HyperLabel{#ADP,"Adp:",NULL_STRING,"ADPI_ADP"}
oDCADP:BackGround := aBrushes[1]
oDCADP:Font(aFonts[1], FALSE)

oDCESPC := SingleLineEdit{self,ResourceID{JADPI_ESPC,_GetInst()}}
oDCESPC:FieldSpec := PADRAO_CHAR_80{}
oDCESPC:HyperLabel := HyperLabel{#ESPC,"Especificado:",NULL_STRING,"ADPI_ESPC"}

oDCENCO := SingleLineEdit{self,ResourceID{JADPI_ENCO,_GetInst()}}
oDCENCO:FieldSpec := PADRAO_CHAR_80{}
oDCENCO:HyperLabel := HyperLabel{#ENCO,"Encontrado:",NULL_STRING,"ADPI_ENCO"}

oDCLAUDO := SingleLineEdit{self,ResourceID{JADPI_LAUDO,_GetInst()}}
oDCLAUDO:FieldSpec := PADRAO_CHAR_01{}
oDCLAUDO:HyperLabel := HyperLabel{#LAUDO,"L",NULL_STRING,"ADPI_LAUDO"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JADPI,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBADP := DataColumn{PADRAO_NUM_08{}}
oDBADP:Width := 6
oDBADP:HyperLabel := oDCADP:HyperLabel 
oDBADP:Caption := "Adp:"
oDBADP:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBADP)

oDBESPC := DataColumn{PADRAO_CHAR_80{}}
oDBESPC:Width := 32
oDBESPC:HyperLabel := oDCESPC:HyperLabel 
oDBESPC:Caption := "Especificado:"
self:Browser:AddColumn(oDBESPC)

oDBENCO := DataColumn{PADRAO_CHAR_80{}}
oDBENCO:Width := 31
oDBENCO:HyperLabel := oDCENCO:HyperLabel 
oDBENCO:Caption := "Encontrado:"
self:Browser:AddColumn(oDBENCO)

oDBLAUDO := DataColumn{PADRAO_CHAR_01{}}
oDBLAUDO:Width := 7
oDBLAUDO:HyperLabel := oDCLAUDO:HyperLabel 
oDBLAUDO:Caption := "L"
self:Browser:AddColumn(oDBLAUDO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LAUDO() 
return self:FieldGet(#LAUDO)


assign LAUDO(uValue) 
self:FieldPut(#LAUDO, uValue)
return LAUDO := uValue


END CLASS
