#region DEFINES
STATIC DEFINE JFERHGI_DATA := 106 
STATIC DEFINE JFERHGI_HFIM := 108 
STATIC DEFINE JFERHGI_HGAS := 109 
STATIC DEFINE JFERHGI_HINI := 107 
STATIC DEFINE JFERHGI_OBS := 111 
STATIC DEFINE JFERHGI_OS := 105 
STATIC DEFINE JFERHGI_SC_DATA := 101 
STATIC DEFINE JFERHGI_SC_HGAS := 103 
STATIC DEFINE JFERHGI_SC_HINI := 102 
STATIC DEFINE JFERHGI_SC_HINI1 := 110 
STATIC DEFINE JFERHGI_SC_OBS := 104 
STATIC DEFINE JFERHGI_SC_OS := 100 
#endregion

class jferhgi inherit DATAWINDOW 

	PROTECT oDBOS as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBHINI as DataColumn
	PROTECT oDBHFIM as DataColumn
	PROTECT oDBHGAS as DataColumn
	protect oDCSC_OS as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_HINI as FIXEDTEXT
	protect oDCSC_HGAS as FIXEDTEXT
	protect oDCSC_OBS as FIXEDTEXT
	protect oDCOS as SINGLELINEEDIT
	protect oDCDATA as DATESLE
	protect oDCHINI as RIGHTSLE
	protect oDCHFIM as RIGHTSLE
	protect oDCHGAS as RIGHTSLE
	protect oDCSC_HINI1 as FIXEDTEXT
	protect oDCobs as MULTILINEEDIT
// 	instance OS 
// 	instance DATA 
// 	instance HINI 
// 	instance HFIM 
// 	instance HGAS 
// 	instance obs 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access HFIM() 
return self:FieldGet(#HFIM)


assign HFIM(uValue) 
self:FieldPut(#HFIM, uValue)
return HFIM := uValue


access HGAS() 
return self:FieldGet(#HGAS)


assign HGAS(uValue) 
self:FieldPut(#HGAS, uValue)
return HGAS := uValue


access HINI() 
return self:FieldGet(#HINI)


assign HINI(uValue) 
self:FieldPut(#HINI, uValue)
return HINI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jferhgi",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_OS := FixedText{self,ResourceID{JFERHGI_SC_OS,_GetInst()}}
oDCSC_OS:HyperLabel := HyperLabel{#SC_OS,"Os:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JFERHGI_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_HINI := FixedText{self,ResourceID{JFERHGI_SC_HINI,_GetInst()}}
oDCSC_HINI:HyperLabel := HyperLabel{#SC_HINI,"Hora Inicial",NULL_STRING,NULL_STRING}

oDCSC_HGAS := FixedText{self,ResourceID{JFERHGI_SC_HGAS,_GetInst()}}
oDCSC_HGAS:HyperLabel := HyperLabel{#SC_HGAS,"Horas Gastas",NULL_STRING,NULL_STRING}

oDCSC_OBS := FixedText{self,ResourceID{JFERHGI_SC_OBS,_GetInst()}}
oDCSC_OBS:HyperLabel := HyperLabel{#SC_OBS,"Obs:",NULL_STRING,NULL_STRING}

oDCOS := SingleLineEdit{self,ResourceID{JFERHGI_OS,_GetInst()}}
oDCOS:FieldSpec := PADRAO_NUM_08{}
oDCOS:HyperLabel := HyperLabel{#OS,"Os:",NULL_STRING,"FERHGI_OS"}
oDCOS:TooltipText := "Numero da OS"
oDCOS:BackGround := aBrushes[1]
oDCOS:Font(aFonts[1], FALSE)

oDCDATA := DateSle{self,ResourceID{JFERHGI_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"FERHGI_DATA"}
oDCDATA:TooltipText := "Data do Serviço"

oDCHINI := rightSle{self,ResourceID{JFERHGI_HINI,_GetInst()}}
oDCHINI:FieldSpec := PADRAO_NUM_05_2{}
oDCHINI:HyperLabel := HyperLabel{#HINI,"Hini:",NULL_STRING,"FERHGI_HINI"}
oDCHINI:TooltipText := "Hora Inicial do Serviço"

oDCHFIM := rightSle{self,ResourceID{JFERHGI_HFIM,_GetInst()}}
oDCHFIM:FieldSpec := PADRAO_NUM_05_2{}
oDCHFIM:HyperLabel := HyperLabel{#HFIM,"Hfim:",NULL_STRING,"FERHGI_HFIM"}
oDCHFIM:TooltipText := "Hora Final do Serviço"

oDCHGAS := rightSle{self,ResourceID{JFERHGI_HGAS,_GetInst()}}
oDCHGAS:FieldSpec := PADRAO_NUM_05_2{}
oDCHGAS:HyperLabel := HyperLabel{#HGAS,"Hgas:",NULL_STRING,"FERHGI_HGAS"}
oDCHGAS:TooltipText := "Horas Gastas"

oDCSC_HINI1 := FixedText{self,ResourceID{JFERHGI_SC_HINI1,_GetInst()}}
oDCSC_HINI1:HyperLabel := HyperLabel{#SC_HINI1,"Hora Final",NULL_STRING,NULL_STRING}

oDCobs := MultiLineEdit{self,ResourceID{JFERHGI_OBS,_GetInst()}}
oDCobs:FieldSpec := PADRAO_CHAR_255{}
oDCobs:HyperLabel := HyperLabel{#obs,"obs",NULL_STRING,NULL_STRING}
oDCobs:TooltipText := "Observaçoes do Serviço"

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jferhgi,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBOS := DataColumn{PADRAO_NUM_08{}}
oDBOS:Width := 11
oDBOS:HyperLabel := oDCOS:HyperLabel 
oDBOS:Caption := "Os:"
oDBOS:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOS)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 13
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)

oDBHINI := DataColumn{PADRAO_NUM_05_2{}}
oDBHINI:Width := 9
oDBHINI:HyperLabel := oDCHINI:HyperLabel 
oDBHINI:Caption := "Hini:"
self:Browser:AddColumn(oDBHINI)

oDBHFIM := DataColumn{PADRAO_NUM_05_2{}}
oDBHFIM:Width := 10
oDBHFIM:HyperLabel := oDCHFIM:HyperLabel 
oDBHFIM:Caption := "Hfim:"
self:Browser:AddColumn(oDBHFIM)

oDBHGAS := DataColumn{PADRAO_NUM_05_2{}}
oDBHGAS:Width := 8
oDBHGAS:HyperLabel := oDCHGAS:HyperLabel 
oDBHGAS:Caption := "Hgas:"
self:Browser:AddColumn(oDBHGAS)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access obs() 
return self:FieldGet(#obs)


assign obs(uValue) 
self:FieldPut(#obs, uValue)
return obs := uValue


access OS() 
return self:FieldGet(#OS)


assign OS(uValue) 
self:FieldPut(#OS, uValue)
return OS := uValue


END CLASS
