#region DEFINES
STATIC DEFINE JCRMENS_CODIGO := 103 
STATIC DEFINE JCRMENS_NOME := 104 
STATIC DEFINE JCRMENS_SC_CODIGO := 100 
STATIC DEFINE JCRMENS_SC_DESCRICAO := 101 
STATIC DEFINE JCRMENS_SC_VALOR := 102 
STATIC DEFINE JCRMENS_VALOR := 105 
#endregion

class JCRMENS inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBVALOR as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_DESCRICAO as FIXEDTEXT
	protect oDCSC_VALOR as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCVALOR as RIGHTSLE
// 	instance CODIGO 
// 	instance NOME 
// 	instance VALOR 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCRMENS",_GetInst()},iCtlID)

oDCSC_CODIGO := FixedText{self,ResourceID{JCRMENS_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_DESCRICAO := FixedText{self,ResourceID{JCRMENS_SC_DESCRICAO,_GetInst()}}
oDCSC_DESCRICAO:HyperLabel := HyperLabel{#SC_DESCRICAO,"Descricao:",NULL_STRING,NULL_STRING}

oDCSC_VALOR := FixedText{self,ResourceID{JCRMENS_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Tempo",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JCRMENS_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_10{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"CRMENS_CODIGO"}

oDCNOME := SingleLineEdit{self,ResourceID{JCRMENS_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Descricao:",NULL_STRING,"CRMENS_DESCRICAO"}

oDCVALOR := rightSle{self,ResourceID{JCRMENS_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := PADRAO_NUM_12_8{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Tempo",NULL_STRING,"CRMENS_VALOR"}

self:Caption := "Cadastro de Ensaios"
self:HyperLabel := HyperLabel{#JCRMENS,"Cadastro de Ensaios",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_10{}}
oDBCODIGO:Width := 21
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_40{}}
oDBNOME:Width := 30
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Descricao:"
self:Browser:AddColumn(oDBNOME)

oDBVALOR := DataColumn{PADRAO_NUM_12_8{}}
oDBVALOR:Width := 11
oDBVALOR:HyperLabel := oDCVALOR:HyperLabel 
oDBVALOR:Caption := "Tempo"
self:Browser:AddColumn(oDBVALOR)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access VALOR() 
return self:FieldGet(#VALOR)


assign VALOR(uValue) 
self:FieldPut(#VALOR, uValue)
return VALOR := uValue


END CLASS
