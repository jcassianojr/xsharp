#region DEFINES
STATIC DEFINE JTREINF_NOMTEC := 103 
STATIC DEFINE JTREINF_SC_NOMTEC := 101 
STATIC DEFINE JTREINF_SC_TECNICO := 100 
STATIC DEFINE JTREINF_TECNICO := 102 
#endregion

class JTREINF inherit DATAWINDOW 

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

SUPER(oWindow,ResourceID{"JTREINF",_GetInst()},iCtlID)

oDCSC_TECNICO := FixedText{self,ResourceID{JTREINF_SC_TECNICO,_GetInst()}}
oDCSC_TECNICO:HyperLabel := HyperLabel{#SC_TECNICO,"Numero",NULL_STRING,NULL_STRING}

oDCSC_NOMTEC := FixedText{self,ResourceID{JTREINF_SC_NOMTEC,_GetInst()}}
oDCSC_NOMTEC:HyperLabel := HyperLabel{#SC_NOMTEC,"Nome",NULL_STRING,NULL_STRING}

oDCTECNICO := SingleLineEdit{self,ResourceID{JTREINF_TECNICO,_GetInst()}}
oDCTECNICO:FieldSpec := PADRAO_NUM_05{}
oDCTECNICO:HyperLabel := HyperLabel{#TECNICO,"Numero",NULL_STRING,"Mp04_TECNICO"}

oDCNOMTEC := SingleLineEdit{self,ResourceID{JTREINF_NOMTEC,_GetInst()}}
oDCNOMTEC:FieldSpec := PADRAO_CHAR_40{}
oDCNOMTEC:HyperLabel := HyperLabel{#NOMTEC,"Nome",NULL_STRING,"Mp04_NOMTEC"}

self:Caption := "Escolha Funcionarios"
self:HyperLabel := HyperLabel{#JTREINF,"Escolha Funcionarios",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTECNICO := DataColumn{PADRAO_NUM_05{}}
oDBTECNICO:Width := 11
oDBTECNICO:HyperLabel := oDCTECNICO:HyperLabel 
oDBTECNICO:Caption := "Numero"
self:Browser:AddColumn(oDBTECNICO)

oDBNOMTEC := DataColumn{PADRAO_CHAR_40{}}
oDBNOMTEC:Width := 43
oDBNOMTEC:HyperLabel := oDCNOMTEC:HyperLabel 
oDBNOMTEC:Caption := "Nome"
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
