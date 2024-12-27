#region DEFINES
STATIC DEFINE JLCT_BUSCA := 101 
STATIC DEFINE JLCT_ORDEM := 100 
STATIC DEFINE JLCT_SC_TIPO := 103 
STATIC DEFINE JLCT_TIPO := 102 
#endregion

class JLCT inherit MYDataWindow 

	PROTECT oDBTIPO as DataColumn
	protect oCCordem as PUSHBUTTON
	protect oCCbusca as PUSHBUTTON
	protect oDCTIPO as SINGLELINEEDIT
	protect oDCSC_TIPO as FIXEDTEXT
// 	instance TIPO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JLCT",_GetInst()},iCtlID)

oCCordem := PushButton{self,ResourceID{JLCT_ORDEM,_GetInst()}}
oCCordem:Image := ico_az{}
oCCordem:HyperLabel := HyperLabel{#ordem,NULL_STRING,NULL_STRING,NULL_STRING}
oCCordem:TooltipText := "Ordenar Por Numero"

oCCbusca := PushButton{self,ResourceID{JLCT_BUSCA,_GetInst()}}
oCCbusca:Image := ICO_FIND{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCTIPO := SingleLineEdit{self,ResourceID{JLCT_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := PADRAO_CHAR_20{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo:",NULL_STRING,"LCT_TIPO"}
oDCTIPO:TooltipText := "Tipo de Norma"

oDCSC_TIPO := FixedText{self,ResourceID{JLCT_SC_TIPO,_GetInst()}}
oDCSC_TIPO:HyperLabel := HyperLabel{#SC_TIPO,"Tipo:",NULL_STRING,NULL_STRING}

self:Caption := "Tipos"
self:HyperLabel := HyperLabel{#JLCT,"Tipos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTIPO := DataColumn{PADRAO_CHAR_20{}}
oDBTIPO:Width := 43
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "Tipo:"
self:Browser:AddColumn(oDBTIPO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


END CLASS
