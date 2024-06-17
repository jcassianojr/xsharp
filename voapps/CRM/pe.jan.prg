#region DEFINES
STATIC DEFINE JPE_APLICACAO := 110 
STATIC DEFINE JPE_CODIGO := 106 
STATIC DEFINE JPE_COGNOME := 109 
STATIC DEFINE JPE_FORNECEDO := 108 
STATIC DEFINE JPE_LOCENT := 111 
STATIC DEFINE JPE_NOME := 107 
STATIC DEFINE JPE_PEDIDO := 105 
STATIC DEFINE JPE_SC_CODIGO := 101 
STATIC DEFINE JPE_SC_COGNOME := 104 
STATIC DEFINE JPE_SC_FORNECEDO := 103 
STATIC DEFINE JPE_SC_NOME := 102 
STATIC DEFINE JPE_SC_PEDIDO := 100 
STATIC DEFINE JPE_SC_PEDIDO1 := 112 
#endregion

class jpe inherit DATAWINDOW 

	PROTECT oDBPEDIDO as DataColumn
	PROTECT oDBLOCENT as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBFORNECEDO as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBAPLICACAO as DataColumn
	protect oDCSC_PEDIDO as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_FORNECEDO as FIXEDTEXT
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCPEDIDO as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCFORNECEDO as SINGLELINEEDIT
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCLOCENT as SINGLELINEEDIT
	protect oDCSC_PEDIDO1 as FIXEDTEXT
// 	instance PEDIDO 
// 	instance CODIGO 
// 	instance NOME 
// 	instance FORNECEDO 
// 	instance COGNOME 
// 	instance aplicacao 
// 	instance LOCENT 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access aplicacao() 
return self:FieldGet(#aplicacao)


assign aplicacao(uValue) 
self:FieldPut(#aplicacao, uValue)
return aplicacao := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


access FORNECEDO() 
return self:FieldGet(#FORNECEDO)


assign FORNECEDO(uValue) 
self:FieldPut(#FORNECEDO, uValue)
return FORNECEDO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jpe",_GetInst()},iCtlID)

oDCSC_PEDIDO := FixedText{self,ResourceID{JPE_SC_PEDIDO,_GetInst()}}
oDCSC_PEDIDO:HyperLabel := HyperLabel{#SC_PEDIDO,"Pedido:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JPE_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JPE_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_FORNECEDO := FixedText{self,ResourceID{JPE_SC_FORNECEDO,_GetInst()}}
oDCSC_FORNECEDO:HyperLabel := HyperLabel{#SC_FORNECEDO,"Fornecedo:",NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{self,ResourceID{JPE_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCPEDIDO := SingleLineEdit{self,ResourceID{JPE_PEDIDO,_GetInst()}}
oDCPEDIDO:FieldSpec := padrao_num_05{}
oDCPEDIDO:HyperLabel := HyperLabel{#PEDIDO,"Pedido:",NULL_STRING,"PE_PEDIDO"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JPE_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"PE_CODIGO"}

oDCNOME := SingleLineEdit{self,ResourceID{JPE_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_50{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"PE_NOME"}

oDCFORNECEDO := SingleLineEdit{self,ResourceID{JPE_FORNECEDO,_GetInst()}}
oDCFORNECEDO:FieldSpec := PADRAO_NUM_08{}
oDCFORNECEDO:HyperLabel := HyperLabel{#FORNECEDO,"No.Forn.",NULL_STRING,"PE_FORNECEDO"}

oDCCOGNOME := SingleLineEdit{self,ResourceID{JPE_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := PADRAO_CHAR_15{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"PE_COGNOME"}

oDCLOCENT := SingleLineEdit{self,ResourceID{JPE_LOCENT,_GetInst()}}
oDCLOCENT:FieldSpec := PADRAO_NUM_01{}
oDCLOCENT:HyperLabel := HyperLabel{#LOCENT,"Ent",NULL_STRING,"PE_PEDIDO"}

oDCSC_PEDIDO1 := FixedText{self,ResourceID{JPE_SC_PEDIDO1,_GetInst()}}
oDCSC_PEDIDO1:HyperLabel := HyperLabel{#SC_PEDIDO1,"Entregar",NULL_STRING,NULL_STRING}

self:Caption := "Programa Entrega"
self:HyperLabel := HyperLabel{#jpe,"Programa Entrega",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBPEDIDO := DataColumn{padrao_num_05{}}
oDBPEDIDO:Width := 8
oDBPEDIDO:HyperLabel := oDCPEDIDO:HyperLabel 
oDBPEDIDO:Caption := "Pedido:"
self:Browser:AddColumn(oDBPEDIDO)

oDBLOCENT := DataColumn{PADRAO_NUM_01{}}
oDBLOCENT:Width := 5
oDBLOCENT:HyperLabel := oDCLOCENT:HyperLabel 
oDBLOCENT:Caption := "Ent"
self:Browser:AddColumn(oDBLOCENT)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 15
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_50{}}
oDBNOME:Width := 27
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBFORNECEDO := DataColumn{PADRAO_NUM_08{}}
oDBFORNECEDO:Width := 10
oDBFORNECEDO:HyperLabel := oDCFORNECEDO:HyperLabel 
oDBFORNECEDO:Caption := "No.Forn."
self:Browser:AddColumn(oDBFORNECEDO)

oDBCOGNOME := DataColumn{PADRAO_CHAR_15{}}
oDBCOGNOME:Width := 14
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
self:Browser:AddColumn(oDBCOGNOME)

oDBAPLICACAO := DataColumn{PADRAO_CHAR_50{}}
oDBAPLICACAO:Width := 15
oDBAPLICACAO:HyperLabel := HyperLabel{#aplicacao,"Aplicacao",NULL_STRING,NULL_STRING} 
oDBAPLICACAO:Caption := "Aplicacao"
self:Browser:AddColumn(oDBAPLICACAO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LOCENT() 
return self:FieldGet(#LOCENT)


assign LOCENT(uValue) 
self:FieldPut(#LOCENT, uValue)
return LOCENT := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access PEDIDO() 
return self:FieldGet(#PEDIDO)


assign PEDIDO(uValue) 
self:FieldPut(#PEDIDO, uValue)
return PEDIDO := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


END CLASS
