#region DEFINES
STATIC DEFINE JPE01_DATAFAT := 105 
STATIC DEFINE JPE01_ITEM := 109 
STATIC DEFINE JPE01_SC_DATAFAT := 100 
STATIC DEFINE JPE01_SC_ITEM := 104 
STATIC DEFINE JPE01_SC_TOTKGANT := 102 
STATIC DEFINE JPE01_SC_TOTKGEST := 103 
STATIC DEFINE JPE01_SC_TOTKGINI := 101 
STATIC DEFINE JPE01_TOTKGANT := 107 
STATIC DEFINE JPE01_TOTKGEST := 108 
STATIC DEFINE JPE01_TOTKGINI := 106 
#endregion

class jpe01 inherit DATAWINDOW 

	PROTECT oDBITEM as DataColumn
	PROTECT oDBDATAFAT as DataColumn
	PROTECT oDBTOTKGINI as DataColumn
	PROTECT oDBTOTKGANT as DataColumn
	PROTECT oDBTOTKGEST as DataColumn
	protect oDCSC_DATAFAT as FIXEDTEXT
	protect oDCSC_TOTKGINI as FIXEDTEXT
	protect oDCSC_TOTKGANT as FIXEDTEXT
	protect oDCSC_TOTKGEST as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCDATAFAT as SINGLELINEEDIT
	protect oDCTOTKGINI as SINGLELINEEDIT
	protect oDCTOTKGANT as SINGLELINEEDIT
	protect oDCTOTKGEST as SINGLELINEEDIT
	protect oDCITEM as SINGLELINEEDIT
// 	instance DATAFAT 
// 	instance TOTKGINI 
// 	instance TOTKGANT 
// 	instance TOTKGEST 
// 	instance ITEM 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DATAFAT() 
return self:FieldGet(#DATAFAT)


assign DATAFAT(uValue) 
self:FieldPut(#DATAFAT, uValue)
return DATAFAT := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jpe01",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_DATAFAT := FixedText{self,ResourceID{JPE01_SC_DATAFAT,_GetInst()}}
oDCSC_DATAFAT:HyperLabel := HyperLabel{#SC_DATAFAT,"Programa",NULL_STRING,NULL_STRING}

oDCSC_TOTKGINI := FixedText{self,ResourceID{JPE01_SC_TOTKGINI,_GetInst()}}
oDCSC_TOTKGINI:HyperLabel := HyperLabel{#SC_TOTKGINI,"Inicial",NULL_STRING,NULL_STRING}

oDCSC_TOTKGANT := FixedText{self,ResourceID{JPE01_SC_TOTKGANT,_GetInst()}}
oDCSC_TOTKGANT:HyperLabel := HyperLabel{#SC_TOTKGANT,"Anterior",NULL_STRING,NULL_STRING}

oDCSC_TOTKGEST := FixedText{self,ResourceID{JPE01_SC_TOTKGEST,_GetInst()}}
oDCSC_TOTKGEST:HyperLabel := HyperLabel{#SC_TOTKGEST,"Saldo",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JPE01_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCDATAFAT := SingleLineEdit{self,ResourceID{JPE01_DATAFAT,_GetInst()}}
oDCDATAFAT:FieldSpec := date_field{}
oDCDATAFAT:HyperLabel := HyperLabel{#DATAFAT,"Data",NULL_STRING,"PE01_DATAFAT"}
oDCDATAFAT:BackGround := aBrushes[1]
oDCDATAFAT:Font(aFonts[1], FALSE)

oDCTOTKGINI := SingleLineEdit{self,ResourceID{JPE01_TOTKGINI,_GetInst()}}
oDCTOTKGINI:FieldSpec := PADRAO_num_06{}
oDCTOTKGINI:HyperLabel := HyperLabel{#TOTKGINI,"Inicial",NULL_STRING,"PE01_TOTKGINI"}
oDCTOTKGINI:BackGround := aBrushes[1]
oDCTOTKGINI:Font(aFonts[1], FALSE)

oDCTOTKGANT := SingleLineEdit{self,ResourceID{JPE01_TOTKGANT,_GetInst()}}
oDCTOTKGANT:FieldSpec := PADRAO_num_06{}
oDCTOTKGANT:HyperLabel := HyperLabel{#TOTKGANT,"Anterior",NULL_STRING,"PE01_TOTKGANT"}
oDCTOTKGANT:BackGround := aBrushes[1]
oDCTOTKGANT:Font(aFonts[1], FALSE)

oDCTOTKGEST := SingleLineEdit{self,ResourceID{JPE01_TOTKGEST,_GetInst()}}
oDCTOTKGEST:FieldSpec := PADRAO_num_06{}
oDCTOTKGEST:HyperLabel := HyperLabel{#TOTKGEST,"Saldo",NULL_STRING,"PE01_TOTKGEST"}
oDCTOTKGEST:BackGround := aBrushes[1]
oDCTOTKGEST:Font(aFonts[1], FALSE)

oDCITEM := SingleLineEdit{self,ResourceID{JPE01_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_num_02{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"PE01_ITEM"}
oDCITEM:BackGround := aBrushes[1]
oDCITEM:Font(aFonts[1], FALSE)

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jpe01,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBITEM := DataColumn{PADRAO_num_02{}}
oDBITEM:Width := 6
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
oDBITEM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBITEM)

oDBDATAFAT := DataColumn{date_field{}}
oDBDATAFAT:Width := 13
oDBDATAFAT:HyperLabel := oDCDATAFAT:HyperLabel 
oDBDATAFAT:Caption := "Data"
oDBDATAFAT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDATAFAT)

oDBTOTKGINI := DataColumn{PADRAO_num_06{}}
oDBTOTKGINI:Width := 10
oDBTOTKGINI:HyperLabel := oDCTOTKGINI:HyperLabel 
oDBTOTKGINI:Caption := "Inicial"
oDBTOTKGINI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTOTKGINI)

oDBTOTKGANT := DataColumn{PADRAO_num_06{}}
oDBTOTKGANT:Width := 10
oDBTOTKGANT:HyperLabel := oDCTOTKGANT:HyperLabel 
oDBTOTKGANT:Caption := "Anterior"
oDBTOTKGANT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTOTKGANT)

oDBTOTKGEST := DataColumn{PADRAO_num_06{}}
oDBTOTKGEST:Width := 10
oDBTOTKGEST:HyperLabel := oDCTOTKGEST:HyperLabel 
oDBTOTKGEST:Caption := "Saldo"
oDBTOTKGEST:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTOTKGEST)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access TOTKGANT() 
return self:FieldGet(#TOTKGANT)


assign TOTKGANT(uValue) 
self:FieldPut(#TOTKGANT, uValue)
return TOTKGANT := uValue


access TOTKGEST() 
return self:FieldGet(#TOTKGEST)


assign TOTKGEST(uValue) 
self:FieldPut(#TOTKGEST, uValue)
return TOTKGEST := uValue


access TOTKGINI() 
return self:FieldGet(#TOTKGINI)


assign TOTKGINI(uValue) 
self:FieldPut(#TOTKGINI, uValue)
return TOTKGINI := uValue


END CLASS
