#region DEFINES
STATIC DEFINE JOPAI_ESPEC := 102 
STATIC DEFINE JOPAI_LAUDO := 103 
STATIC DEFINE JOPAI_OPAE := 104 
STATIC DEFINE JOPAI_SC_ESPEC := 100 
STATIC DEFINE JOPAI_SC_LAUDO := 101 
STATIC DEFINE JOPAI_SC_OPAE := 105 
#endregion

class jOPAI inherit DATAWINDOW 

	PROTECT oDBOPAE as DataColumn
	PROTECT oDBLAUDO as DataColumn
	PROTECT oDBESPEC as DataColumn
	protect oDCSC_ESPEC as FIXEDTEXT
	protect oDCSC_LAUDO as FIXEDTEXT
	protect oDCESPEC as SINGLELINEEDIT
	protect oDCLAUDO as SINGLELINEEDIT
	protect oDCOPAE as SINGLELINEEDIT
	protect oDCSC_OPAE as FIXEDTEXT
// 	instance ESPEC 
// 	instance LAUDO 
// 	instance OPAE 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ESPEC() 
return self:FieldGet(#ESPEC)


assign ESPEC(uValue) 
self:FieldPut(#ESPEC, uValue)
return ESPEC := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jOPAI",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,12,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_ESPEC := FixedText{self,ResourceID{JOPAI_SC_ESPEC,_GetInst()}}
oDCSC_ESPEC:HyperLabel := HyperLabel{#SC_ESPEC,"Espec:",NULL_STRING,NULL_STRING}

oDCSC_LAUDO := FixedText{self,ResourceID{JOPAI_SC_LAUDO,_GetInst()}}
oDCSC_LAUDO:HyperLabel := HyperLabel{#SC_LAUDO,"Laudo:",NULL_STRING,NULL_STRING}

oDCESPEC := SingleLineEdit{self,ResourceID{JOPAI_ESPEC,_GetInst()}}
oDCESPEC:FieldSpec := PADRAO_CHAR_100{}
oDCESPEC:HyperLabel := HyperLabel{#ESPEC,"Espec:",NULL_STRING,"OPAI_ESPEC"}
oDCESPEC:BackGround := aBrushes[1]
oDCESPEC:Font(aFonts[1], FALSE)

oDCLAUDO := SingleLineEdit{self,ResourceID{JOPAI_LAUDO,_GetInst()}}
oDCLAUDO:FieldSpec := PADRAO_CHAR_01{}
oDCLAUDO:HyperLabel := HyperLabel{#LAUDO,"Laudo:",NULL_STRING,"OPAI_LAUDO"}
oDCLAUDO:BackGround := aBrushes[1]
oDCLAUDO:Font(aFonts[2], FALSE)

oDCOPAE := SingleLineEdit{self,ResourceID{JOPAI_OPAE,_GetInst()}}
oDCOPAE:FieldSpec := PADRAO_NUM_08{}
oDCOPAE:HyperLabel := HyperLabel{#OPAE,"Opae:",NULL_STRING,"OPAE_OPAE"}
oDCOPAE:BackGround := aBrushes[1]
oDCOPAE:Font(aFonts[2], FALSE)

oDCSC_OPAE := FixedText{self,ResourceID{JOPAI_SC_OPAE,_GetInst()}}
oDCSC_OPAE:HyperLabel := HyperLabel{#SC_OPAE,"Opae:",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jOPAI,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBOPAE := DataColumn{PADRAO_NUM_08{}}
oDBOPAE:Width := 6
oDBOPAE:HyperLabel := oDCOPAE:HyperLabel 
oDBOPAE:Caption := "Opae:"
oDBOPAE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOPAE)

oDBLAUDO := DataColumn{PADRAO_CHAR_01{}}
oDBLAUDO:Width := 7
oDBLAUDO:HyperLabel := oDCLAUDO:HyperLabel 
oDBLAUDO:Caption := "Laudo:"
oDBLAUDO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBLAUDO)

oDBESPEC := DataColumn{PADRAO_CHAR_100{}}
oDBESPEC:Width := 80
oDBESPEC:HyperLabel := oDCESPEC:HyperLabel 
oDBESPEC:Caption := "Espec:"
oDBESPEC:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBESPEC)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LAUDO() 
return self:FieldGet(#LAUDO)


assign LAUDO(uValue) 
self:FieldPut(#LAUDO, uValue)
return LAUDO := uValue


access OPAE() 
return self:FieldGet(#OPAE)


assign OPAE(uValue) 
self:FieldPut(#OPAE, uValue)
return OPAE := uValue


END CLASS
