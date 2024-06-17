#region DEFINES
STATIC DEFINE JPTI_NOMFUN := 100 
STATIC DEFINE JPTI_NUMFUN := 105 
STATIC DEFINE JPTI_SC_NOMFUN := 101 
STATIC DEFINE JPTI_SC_NUMFUN := 102 
STATIC DEFINE JPTI_SC_TREIN := 104 
STATIC DEFINE JPTI_TREIN := 103 
#endregion

class JPTI inherit DATAWINDOW 

	PROTECT oDBTREIN as DataColumn
	PROTECT oDBNUMFUN as DataColumn
	PROTECT oDBNOMFUN as DataColumn
	protect oDCNOMFUN as SINGLELINEEDIT
	protect oDCSC_NOMFUN as FIXEDTEXT
	protect oDCSC_NUMFUN as FIXEDTEXT
	protect oDCTREIN as SINGLELINEEDIT
	protect oDCSC_TREIN as FIXEDTEXT
	protect oDCNUMFUN as SINGLELINEEDIT
// 	instance NOMFUN 
// 	instance TREIN 
// 	instance NUMFUN 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPTI",_GetInst()},iCtlID)

oDCNOMFUN := SingleLineEdit{self,ResourceID{JPTI_NOMFUN,_GetInst()}}
oDCNOMFUN:FieldSpec := PADRAO_CHAR_40{}
oDCNOMFUN:HyperLabel := HyperLabel{#NOMFUN,"Nome:",NULL_STRING,"TREII_NOMFUN"}

oDCSC_NOMFUN := FixedText{self,ResourceID{JPTI_SC_NOMFUN,_GetInst()}}
oDCSC_NOMFUN:HyperLabel := HyperLabel{#SC_NOMFUN,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_NUMFUN := FixedText{self,ResourceID{JPTI_SC_NUMFUN,_GetInst()}}
oDCSC_NUMFUN:HyperLabel := HyperLabel{#SC_NUMFUN,"Número",NULL_STRING,NULL_STRING}

oDCTREIN := SingleLineEdit{self,ResourceID{JPTI_TREIN,_GetInst()}}
oDCTREIN:FieldSpec := PADRAO_NUM_08{}
oDCTREIN:HyperLabel := HyperLabel{#TREIN,"PT",NULL_STRING,"TREII_TREIN"}

oDCSC_TREIN := FixedText{self,ResourceID{JPTI_SC_TREIN,_GetInst()}}
oDCSC_TREIN:HyperLabel := HyperLabel{#SC_TREIN,"PT",NULL_STRING,NULL_STRING}

oDCNUMFUN := SingleLineEdit{self,ResourceID{JPTI_NUMFUN,_GetInst()}}
oDCNUMFUN:FieldSpec := PADRAO_NUM_08{}
oDCNUMFUN:HyperLabel := HyperLabel{#NUMFUN,"Numero:",NULL_STRING,"TREII_TREIN"}

self:Caption := "Itens da Programacao de Treinamento"
self:HyperLabel := HyperLabel{#JPTI,"Itens da Programacao de Treinamento",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTREIN := DataColumn{PADRAO_NUM_08{}}
oDBTREIN:Width := 7
oDBTREIN:HyperLabel := oDCTREIN:HyperLabel 
oDBTREIN:Caption := "PT"
self:Browser:AddColumn(oDBTREIN)

oDBNUMFUN := DataColumn{PADRAO_NUM_08{}}
oDBNUMFUN:Width := 12
oDBNUMFUN:HyperLabel := oDCNUMFUN:HyperLabel 
oDBNUMFUN:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMFUN)

oDBNOMFUN := DataColumn{PADRAO_CHAR_40{}}
oDBNOMFUN:Width := 47
oDBNOMFUN:HyperLabel := oDCNOMFUN:HyperLabel 
oDBNOMFUN:Caption := "Nome:"
self:Browser:AddColumn(oDBNOMFUN)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOMFUN() 
return self:FieldGet(#NOMFUN)


assign NOMFUN(uValue) 
self:FieldPut(#NOMFUN, uValue)
return NOMFUN := uValue


access NUMFUN() 
return self:FieldGet(#NUMFUN)


assign NUMFUN(uValue) 
self:FieldPut(#NUMFUN, uValue)
return NUMFUN := uValue


access TREIN() 
return self:FieldGet(#TREIN)


assign TREIN(uValue) 
self:FieldPut(#TREIN, uValue)
return TREIN := uValue


END CLASS
