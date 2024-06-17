#region DEFINES
STATIC DEFINE JESCMP04_NOMTEC := 103 
STATIC DEFINE JESCMP04_SC_NOMTEC := 101 
STATIC DEFINE JESCMP04_SC_TECNICO := 100 
STATIC DEFINE JESCMP04_TECNICO := 102 
#endregion

class jescmp04 inherit MYDataWindow 

	PROTECT oDBTECNICO as DataColumn
	PROTECT oDBNOMTEC as DataColumn
	protect oDCSC_TECNICO as FIXEDTEXT
	protect oDCSC_NOMTEC as FIXEDTEXT
	protect oDCTECNICO as SINGLELINEEDIT
	protect oDCNOMTEC as SINGLELINEEDIT
// 	instance TECNICO 
// 	instance NOMTEC 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jescmp04",_GetInst()},iCtlID)

oDCSC_TECNICO := FixedText{self,ResourceID{JESCMP04_SC_TECNICO,_GetInst()}}
oDCSC_TECNICO:HyperLabel := HyperLabel{#SC_TECNICO,"Técnico:",NULL_STRING,NULL_STRING}

oDCSC_NOMTEC := FixedText{self,ResourceID{JESCMP04_SC_NOMTEC,_GetInst()}}
oDCSC_NOMTEC:HyperLabel := HyperLabel{#SC_NOMTEC,"Nome:",NULL_STRING,NULL_STRING}

oDCTECNICO := SingleLineEdit{self,ResourceID{JESCMP04_TECNICO,_GetInst()}}
oDCTECNICO:HyperLabel := HyperLabel{#TECNICO,"Tecnico:",NULL_STRING,"Mp04_TECNICO"}

oDCNOMTEC := SingleLineEdit{self,ResourceID{JESCMP04_NOMTEC,_GetInst()}}
oDCNOMTEC:HyperLabel := HyperLabel{#NOMTEC,"Nome:",NULL_STRING,"Mp04_NOMTEC"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jescmp04,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTECNICO := DataColumn{9}
oDBTECNICO:Width := 9
oDBTECNICO:HyperLabel := oDCTECNICO:HyperLabel 
oDBTECNICO:Caption := "Tecnico:"
self:Browser:AddColumn(oDBTECNICO)

oDBNOMTEC := DataColumn{67}
oDBNOMTEC:Width := 67
oDBNOMTEC:HyperLabel := oDCNOMTEC:HyperLabel 
oDBNOMTEC:Caption := "Nome:"
self:Browser:AddColumn(oDBNOMTEC)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOMTEC() 
return self:FieldGet(#NOMTEC)


assign NOMTEC(uValue) 
self:FieldPut(#NOMTEC, uValue)
return NOMTEC := uValue


access TECNICO() 
return self:FieldGet(#TECNICO)


assign TECNICO(uValue) 
self:FieldPut(#TECNICO, uValue)
return TECNICO := uValue


END CLASS
