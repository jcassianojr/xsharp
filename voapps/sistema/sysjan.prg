#region DEFINES
STATIC DEFINE JSYS_DESCM := 101 
STATIC DEFINE JSYS_SC_DESCM := 100 
#endregion

class jsys inherit DATAWINDOW 

	PROTECT oDBDESCM as DataColumn
	protect oDCSC_DESCM as FIXEDTEXT
	protect oDCDESCM as SINGLELINEEDIT
// 	instance DESCM 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DESCM() 
return self:FieldGet(#DESCM)


assign DESCM(uValue) 
self:FieldPut(#DESCM, uValue)
return DESCM := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jsys",_GetInst()},iCtlID)

oDCSC_DESCM := FixedText{self,ResourceID{JSYS_SC_DESCM,_GetInst()}}
oDCSC_DESCM:HyperLabel := HyperLabel{#SC_DESCM,"Descm:",NULL_STRING,NULL_STRING}

oDCDESCM := SingleLineEdit{self,ResourceID{JSYS_DESCM,_GetInst()}}
oDCDESCM:FieldSpec := PADRAO_CHAR_75{}
oDCDESCM:HyperLabel := HyperLabel{#DESCM,"Sistema",NULL_STRING,"sysopt_DESCM"}

self:Caption := "Sistema"
self:HyperLabel := HyperLabel{#jsys,"Sistema",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDESCM := DataColumn{PADRAO_CHAR_75{}}
oDBDESCM:Width := 76
oDBDESCM:HyperLabel := oDCDESCM:HyperLabel 
oDBDESCM:Caption := "Sistema"
self:Browser:AddColumn(oDBDESCM)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
