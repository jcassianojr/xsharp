#region DEFINES
STATIC DEFINE JPAEI_DESENHO := 100 
STATIC DEFINE JPAEI_ESPEC := 101 
STATIC DEFINE JPAEI_SC_CODIGO := 102 
STATIC DEFINE JPAEI_SC_ESPEC := 103 
#endregion

class JPAEI inherit MYDataWindow 

	PROTECT oDBDESENHO as DataColumn
	PROTECT oDBESPEC as DataColumn
	protect oDCDESENHO as SINGLELINEEDIT
	protect oDCESPEC as SINGLELINEEDIT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_ESPEC as FIXEDTEXT
// 	instance DESENHO 
// 	instance ESPEC 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DESENHO() 
return self:FieldGet(#DESENHO)


assign DESENHO(uValue) 
self:FieldPut(#DESENHO, uValue)
return DESENHO := uValue


access ESPEC() 
return self:FieldGet(#ESPEC)


assign ESPEC(uValue) 
self:FieldPut(#ESPEC, uValue)
return ESPEC := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPAEI",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDESENHO := SingleLineEdit{self,ResourceID{JPAEI_DESENHO,_GetInst()}}
oDCDESENHO:FieldSpec := padrao_char_24{}
oDCDESENHO:HyperLabel := HyperLabel{#DESENHO,"Codigo:",NULL_STRING,"PAEI_CODIGO"}
oDCDESENHO:BackGround := aBrushes[1]
oDCDESENHO:Font(aFonts[1], FALSE)

oDCESPEC := SingleLineEdit{self,ResourceID{JPAEI_ESPEC,_GetInst()}}
oDCESPEC:FieldSpec := padrao_char_100{}
oDCESPEC:HyperLabel := HyperLabel{#ESPEC,"Especificação:",NULL_STRING,"PAEI_ESPEC"}

oDCSC_CODIGO := FixedText{self,ResourceID{JPAEI_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_ESPEC := FixedText{self,ResourceID{JPAEI_SC_ESPEC,_GetInst()}}
oDCSC_ESPEC:HyperLabel := HyperLabel{#SC_ESPEC,"Especificação",NULL_STRING,NULL_STRING}

self:Caption := "Plano de Auditoria de Embarque - Especificacoes"
self:HyperLabel := HyperLabel{#JPAEI,"Plano de Auditoria de Embarque - Especificacoes",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDESENHO := DataColumn{padrao_char_24{}}
oDBDESENHO:Width := 25
oDBDESENHO:HyperLabel := oDCDESENHO:HyperLabel 
oDBDESENHO:Caption := "Codigo:"
oDBDESENHO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDESENHO)

oDBESPEC := DataColumn{padrao_char_100{}}
oDBESPEC:Width := 44
oDBESPEC:HyperLabel := oDCESPEC:HyperLabel 
oDBESPEC:Caption := "Especificação:"
self:Browser:AddColumn(oDBESPEC)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
