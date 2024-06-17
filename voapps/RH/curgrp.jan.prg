#region DEFINES
STATIC DEFINE JCURGRP_GRUPO := 102 
STATIC DEFINE JCURGRP_NOME := 103 
STATIC DEFINE JCURGRP_SC_GRUPO := 100 
STATIC DEFINE JCURGRP_SC_NOME := 101 
#endregion

class jcurgrp inherit DATAWINDOW 

	PROTECT oDBGRUPO as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCSC_GRUPO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCGRUPO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
// 	instance GRUPO 
// 	instance NOME 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access GRUPO() 
return self:FieldGet(#GRUPO)


assign GRUPO(uValue) 
self:FieldPut(#GRUPO, uValue)
return GRUPO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcurgrp",_GetInst()},iCtlID)

oDCSC_GRUPO := FixedText{self,ResourceID{JCURGRP_SC_GRUPO,_GetInst()}}
oDCSC_GRUPO:HyperLabel := HyperLabel{#SC_GRUPO,"Grupo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JCURGRP_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCGRUPO := SingleLineEdit{self,ResourceID{JCURGRP_GRUPO,_GetInst()}}
oDCGRUPO:FieldSpec := padrao_char_05{}
oDCGRUPO:HyperLabel := HyperLabel{#GRUPO,"Grupo:",NULL_STRING,"CURGRP_GRUPO"}

oDCNOME := SingleLineEdit{self,ResourceID{JCURGRP_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"CURGRP_NOME"}

self:Caption := "Grupo de Curso"
self:HyperLabel := HyperLabel{#jcurgrp,"Grupo de Curso",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBGRUPO := DataColumn{padrao_char_05{}}
oDBGRUPO:Width := 16
oDBGRUPO:HyperLabel := oDCGRUPO:HyperLabel 
oDBGRUPO:Caption := "Grupo:"
self:Browser:AddColumn(oDBGRUPO)

oDBNOME := DataColumn{padrao_char_40{}}
oDBNOME:Width := 53
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


END CLASS
