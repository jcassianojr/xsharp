#region DEFINES
STATIC DEFINE JCRMGP12_CODIGO := 100 
STATIC DEFINE JCRMGP12_FIXEDTEXT1 := 101 
#endregion

class JCRMGP12 inherit DATAWINDOW 

	PROTECT oDBCODIGO as DataColumn
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCFixedText1 as FIXEDTEXT
// 	instance CODIGO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCRMGP12",_GetInst()},iCtlID)

oDCCODIGO := SingleLineEdit{self,ResourceID{JCRMGP12_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo",NULL_STRING,NULL_STRING}

oDCFixedText1 := FixedText{self,ResourceID{JCRMGP12_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Codigo",NULL_STRING,NULL_STRING}

self:Caption := "Marcada GP12"
self:HyperLabel := HyperLabel{#JCRMGP12,"Marcada GP12",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 34
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo"
self:Browser:AddColumn(oDBCODIGO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
