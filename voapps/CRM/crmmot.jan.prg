#region DEFINES
STATIC DEFINE JCRMMOT_CODIGO := 102 
STATIC DEFINE JCRMMOT_DIZER := 103 
STATIC DEFINE JCRMMOT_SC_CODIGO := 100 
STATIC DEFINE JCRMMOT_SC_DIZER := 101 
#endregion

class jcrmmot inherit DATAWINDOW 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDIZER as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_DIZER as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCDIZER as SINGLELINEEDIT
// 	instance CODIGO 
// 	instance DIZER 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DIZER() 
return self:FieldGet(#DIZER)


assign DIZER(uValue) 
self:FieldPut(#DIZER, uValue)
return DIZER := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcrmmot",_GetInst()},iCtlID)

oDCSC_CODIGO := FixedText{self,ResourceID{JCRMMOT_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_DIZER := FixedText{self,ResourceID{JCRMMOT_SC_DIZER,_GetInst()}}
oDCSC_DIZER:HyperLabel := HyperLabel{#SC_DIZER,"Dizer:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JCRMMOT_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_02{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"CRMMOT_CODIGO"}

oDCDIZER := SingleLineEdit{self,ResourceID{JCRMMOT_DIZER,_GetInst()}}
oDCDIZER:FieldSpec := padrao_char_50{}
oDCDIZER:HyperLabel := HyperLabel{#DIZER,"Dizer:",NULL_STRING,"CRMMOT_DIZER"}

self:Caption := "Motivos de Rastros Alternativos"
self:HyperLabel := HyperLabel{#jcrmmot,"Motivos de Rastros Alternativos",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{padrao_char_02{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBDIZER := DataColumn{padrao_char_50{}}
oDBDIZER:Width := 59
oDBDIZER:HyperLabel := oDCDIZER:HyperLabel 
oDBDIZER:Caption := "Dizer:"
self:Browser:AddColumn(oDBDIZER)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


END CLASS
