#region DEFINES
STATIC DEFINE JPEMO_APLICACAO := 118 
STATIC DEFINE JPEMO_BUSCA := 134 
STATIC DEFINE JPEMO_CHKPED := 119 
STATIC DEFINE JPEMO_CODAVU := 131 
STATIC DEFINE JPEMO_CODIGO := 110 
STATIC DEFINE JPEMO_COGNOME := 113 
STATIC DEFINE JPEMO_COMITEM := 117 
STATIC DEFINE JPEMO_COMPRAS := 116 
STATIC DEFINE JPEMO_ESCCOD := 129 
STATIC DEFINE JPEMO_ESCCOD1 := 130 
STATIC DEFINE JPEMO_ESCCOD2 := 132 
STATIC DEFINE JPEMO_ESCFOR := 124 
STATIC DEFINE JPEMO_ESCPED := 122 
STATIC DEFINE JPEMO_ESCPED1 := 121 
STATIC DEFINE JPEMO_ESCPED2 := 120 
STATIC DEFINE JPEMO_FORNECEDO := 112 
STATIC DEFINE JPEMO_NOM2 := 115 
STATIC DEFINE JPEMO_NOME := 111 
STATIC DEFINE JPEMO_PEDIDO := 108 
STATIC DEFINE JPEMO_PEGCOD := 128 
STATIC DEFINE JPEMO_PEGCOD1 := 133 
STATIC DEFINE JPEMO_PEGFOR := 123 
STATIC DEFINE JPEMO_SC_APLICACAO := 107 
STATIC DEFINE JPEMO_SC_CODIGO := 102 
STATIC DEFINE JPEMO_SC_COMPRAS := 106 
STATIC DEFINE JPEMO_SC_FORNECEDO := 104 
STATIC DEFINE JPEMO_SC_NOME := 103 
STATIC DEFINE JPEMO_SC_PEDIDO := 100 
STATIC DEFINE JPEMO_SC_TIPPED := 101 
STATIC DEFINE JPEMO_SC_UNID := 105 
STATIC DEFINE JPEMO_TIPOC := 126 
STATIC DEFINE JPEMO_TIPOM := 127 
STATIC DEFINE JPEMO_TIPOT := 125 
STATIC DEFINE JPEMO_TIPPED := 109 
STATIC DEFINE JPEMO_UNID := 114 
#endregion

class jpemo inherit MYDataWindow 

	PROTECT oDBPEDIDO as DataColumn
	PROTECT oDBCOMPRAS as DataColumn
	PROTECT oDBCOMITEM as DataColumn
	PROTECT oDBTIPPED as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBNOM2 as DataColumn
	PROTECT oDBFORNECEDO as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBUNID as DataColumn
	PROTECT oDBAPLICACAO as DataColumn
	protect oDCSC_PEDIDO as FIXEDTEXT
	protect oDCSC_TIPPED as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_FORNECEDO as FIXEDTEXT
	protect oDCSC_UNID as FIXEDTEXT
	protect oDCSC_COMPRAS as FIXEDTEXT
	protect oDCSC_APLICACAO as FIXEDTEXT
	protect oDCPEDIDO as SINGLELINEEDIT
	protect oDCTIPPED as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCFORNECEDO as RIGHTSLE
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCUNID as SINGLELINEEDIT
	protect oDCNOM2 as SINGLELINEEDIT
	protect oDCCOMPRAS as RIGHTSLE
	protect oDCCOMITEM as RIGHTSLE
	protect oDCAPLICACAO as SINGLELINEEDIT
	protect oCCCHKPED as PUSHBUTTON
	protect oCCescped2 as PUSHBUTTON
	protect oCCescped1 as PUSHBUTTON
	protect oCCescped as PUSHBUTTON
	protect oCCpegfor as PUSHBUTTON
	protect oCCESCFOR as PUSHBUTTON
	protect oCCTIPOT as PUSHBUTTON
	protect oCCTIPOC as PUSHBUTTON
	protect oCCTIPOM as PUSHBUTTON
	protect oCCpegcod as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oCCesccod1 as PUSHBUTTON
	protect oDCcodavu as RIGHTSLE
	protect oCCesccod2 as PUSHBUTTON
	protect oCCpegcod1 as PUSHBUTTON
	protect oCCbusca as PUSHBUTTON
// 	instance PEDIDO 
// 	instance TIPPED 
// 	instance CODIGO 
// 	instance NOME 
// 	instance FORNECEDO 
// 	instance COGNOME 
// 	instance UNID 
// 	instance NOM2 
// 	instance COMPRAS 
// 	instance COMITEM 
// 	instance APLICACAO 
// 	instance codavu 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access APLICACAO() 
return self:FieldGet(#APLICACAO)


assign APLICACAO(uValue) 
self:FieldPut(#APLICACAO, uValue)
return APLICACAO := uValue


access codavu() 
return self:FieldGet(#codavu)


assign codavu(uValue) 
self:FieldPut(#codavu, uValue)
return codavu := uValue


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


access COMITEM() 
return self:FieldGet(#COMITEM)


assign COMITEM(uValue) 
self:FieldPut(#COMITEM, uValue)
return COMITEM := uValue


access COMPRAS() 
return self:FieldGet(#COMPRAS)


assign COMPRAS(uValue) 
self:FieldPut(#COMPRAS, uValue)
return COMPRAS := uValue


access FORNECEDO() 
return self:FieldGet(#FORNECEDO)


assign FORNECEDO(uValue) 
self:FieldPut(#FORNECEDO, uValue)
return FORNECEDO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jpemo",_GetInst()},iCtlID)

oDCSC_PEDIDO := FixedText{self,ResourceID{JPEMO_SC_PEDIDO,_GetInst()}}
oDCSC_PEDIDO:HyperLabel := HyperLabel{#SC_PEDIDO,"Pedido:",NULL_STRING,NULL_STRING}

oDCSC_TIPPED := FixedText{self,ResourceID{JPEMO_SC_TIPPED,_GetInst()}}
oDCSC_TIPPED:HyperLabel := HyperLabel{#SC_TIPPED,"T",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JPEMO_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JPEMO_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_FORNECEDO := FixedText{self,ResourceID{JPEMO_SC_FORNECEDO,_GetInst()}}
oDCSC_FORNECEDO:HyperLabel := HyperLabel{#SC_FORNECEDO,"Fornecedor/Cliente",NULL_STRING,NULL_STRING}

oDCSC_UNID := FixedText{self,ResourceID{JPEMO_SC_UNID,_GetInst()}}
oDCSC_UNID:HyperLabel := HyperLabel{#SC_UNID,"Unid:",NULL_STRING,NULL_STRING}

oDCSC_COMPRAS := FixedText{self,ResourceID{JPEMO_SC_COMPRAS,_GetInst()}}
oDCSC_COMPRAS:HyperLabel := HyperLabel{#SC_COMPRAS,"Compras:",NULL_STRING,NULL_STRING}

oDCSC_APLICACAO := FixedText{self,ResourceID{JPEMO_SC_APLICACAO,_GetInst()}}
oDCSC_APLICACAO:HyperLabel := HyperLabel{#SC_APLICACAO,"Aplicacao:",NULL_STRING,NULL_STRING}

oDCPEDIDO := SingleLineEdit{self,ResourceID{JPEMO_PEDIDO,_GetInst()}}
oDCPEDIDO:FieldSpec := padrao_num_08{}
oDCPEDIDO:HyperLabel := HyperLabel{#PEDIDO,"Pedido:",NULL_STRING,"pemo_PEDIDO"}

oDCTIPPED := SingleLineEdit{self,ResourceID{JPEMO_TIPPED,_GetInst()}}
oDCTIPPED:FieldSpec := padrao_char_01{}
oDCTIPPED:HyperLabel := HyperLabel{#TIPPED,"T",NULL_STRING,"pemo_TIPPED"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JPEMO_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"pemo_CODIGO"}

oDCNOME := SingleLineEdit{self,ResourceID{JPEMO_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_50{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"pemo_NOME"}

oDCFORNECEDO := rightSle{self,ResourceID{JPEMO_FORNECEDO,_GetInst()}}
oDCFORNECEDO:FieldSpec := padrao_num_08{}
oDCFORNECEDO:HyperLabel := HyperLabel{#FORNECEDO,"For/Cli",NULL_STRING,"pemo_FORNECEDO"}

oDCCOGNOME := SingleLineEdit{self,ResourceID{JPEMO_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := padrao_char_15{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"pemo_COGNOME"}

oDCUNID := SingleLineEdit{self,ResourceID{JPEMO_UNID,_GetInst()}}
oDCUNID:FieldSpec := padrao_char_02{}
oDCUNID:HyperLabel := HyperLabel{#UNID,"Unid:",NULL_STRING,"pemo_UNID"}

oDCNOM2 := SingleLineEdit{self,ResourceID{JPEMO_NOM2,_GetInst()}}
oDCNOM2:FieldSpec := padrao_char_50{}
oDCNOM2:HyperLabel := HyperLabel{#NOM2,"Nom2:",NULL_STRING,"pemo_NOM2"}

oDCCOMPRAS := rightSle{self,ResourceID{JPEMO_COMPRAS,_GetInst()}}
oDCCOMPRAS:FieldSpec := padrao_num_08{}
oDCCOMPRAS:HyperLabel := HyperLabel{#COMPRAS,"Compras:",NULL_STRING,"pemo_COMPRAS"}

oDCCOMITEM := rightSle{self,ResourceID{JPEMO_COMITEM,_GetInst()}}
oDCCOMITEM:FieldSpec := padrao_num_03{}
oDCCOMITEM:HyperLabel := HyperLabel{#COMITEM,"Item",NULL_STRING,"pemo_COMITEM"}

oDCAPLICACAO := SingleLineEdit{self,ResourceID{JPEMO_APLICACAO,_GetInst()}}
oDCAPLICACAO:FieldSpec := padrao_char_50{}
oDCAPLICACAO:HyperLabel := HyperLabel{#APLICACAO,"Aplicacao:",NULL_STRING,"pemo_APLICACAO"}

oCCCHKPED := PushButton{self,ResourceID{JPEMO_CHKPED,_GetInst()}}
oCCCHKPED:HyperLabel := HyperLabel{#CHKPED,"Buscar",NULL_STRING,NULL_STRING}
oCCCHKPED:TooltipText := "Localizar"

oCCescped2 := PushButton{self,ResourceID{JPEMO_ESCPED2,_GetInst()}}
oCCescped2:HyperLabel := HyperLabel{#escped2,"M",NULL_STRING,NULL_STRING}
oCCescped2:TooltipText := "Pedidos Materia Prima"

oCCescped1 := PushButton{self,ResourceID{JPEMO_ESCPED1,_GetInst()}}
oCCescped1:HyperLabel := HyperLabel{#escped1,"C",NULL_STRING,NULL_STRING}
oCCescped1:TooltipText := "Pedidos Componentes"

oCCescped := PushButton{self,ResourceID{JPEMO_ESCPED,_GetInst()}}
oCCescped:HyperLabel := HyperLabel{#escped,"T",NULL_STRING,NULL_STRING}
oCCescped:TooltipText := "Pedidos Tratamento"

oCCpegfor := PushButton{self,ResourceID{JPEMO_PEGFOR,_GetInst()}}
oCCpegfor:HyperLabel := HyperLabel{#pegfor,"-->",NULL_STRING,NULL_STRING}
oCCpegfor:TooltipText := "trazer descritivo cliente"

oCCESCFOR := PushButton{self,ResourceID{JPEMO_ESCFOR,_GetInst()}}
oCCESCFOR:HyperLabel := HyperLabel{#ESCFOR,"...",NULL_STRING,NULL_STRING}
oCCESCFOR:TooltipText := "Escolher Cliente/Fornecedor"

oCCTIPOT := PushButton{self,ResourceID{JPEMO_TIPOT,_GetInst()}}
oCCTIPOT:HyperLabel := HyperLabel{#TIPOT,"(T)rat/Serviço",NULL_STRING,NULL_STRING}
oCCTIPOT:TooltipText := "Marca Tipo Como Tratamento/Servicos"

oCCTIPOC := PushButton{self,ResourceID{JPEMO_TIPOC,_GetInst()}}
oCCTIPOC:HyperLabel := HyperLabel{#TIPOC,"(C)omponente",NULL_STRING,NULL_STRING}
oCCTIPOC:TooltipText := "Marca Tipo Como Componete"

oCCTIPOM := PushButton{self,ResourceID{JPEMO_TIPOM,_GetInst()}}
oCCTIPOM:HyperLabel := HyperLabel{#TIPOM,"(M)at.Prima",NULL_STRING,NULL_STRING}
oCCTIPOM:TooltipText := "Marca Tipo Como Materia Prima"

oCCpegcod := PushButton{self,ResourceID{JPEMO_PEGCOD,_GetInst()}}
oCCpegcod:HyperLabel := HyperLabel{#pegcod,"-->",NULL_STRING,NULL_STRING}
oCCpegcod:TooltipText := "trazer discritivo codigo"

oCCesccod := PushButton{self,ResourceID{JPEMO_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oCCesccod1 := PushButton{self,ResourceID{JPEMO_ESCCOD1,_GetInst()}}
oCCesccod1:HyperLabel := HyperLabel{#esccod1,"...",NULL_STRING,NULL_STRING}
oCCesccod1:TooltipText := "Escolher Aplicacao"

oDCcodavu := rightSle{self,ResourceID{JPEMO_CODAVU,_GetInst()}}
oDCcodavu:FieldSpec := padrao_num_08{}
oDCcodavu:HyperLabel := HyperLabel{#codavu,"Compras:",NULL_STRING,"pemo_COMPRAS"}
oDCcodavu:TooltipText := "codigos especias de entrega"

oCCesccod2 := PushButton{self,ResourceID{JPEMO_ESCCOD2,_GetInst()}}
oCCesccod2:HyperLabel := HyperLabel{#esccod2,"...",NULL_STRING,NULL_STRING}
oCCesccod2:TooltipText := "escolher codigo especial de entrega"

oCCpegcod1 := PushButton{self,ResourceID{JPEMO_PEGCOD1,_GetInst()}}
oCCpegcod1:HyperLabel := HyperLabel{#pegcod1,"-->",NULL_STRING,NULL_STRING}
oCCpegcod1:TooltipText := "trazer descritivo codigo especial"

oCCbusca := PushButton{self,ResourceID{JPEMO_BUSCA,_GetInst()}}
oCCbusca:Image := ICO_FIND{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbusca:TooltipText := "Localizar"

self:Caption := "Programas"
self:HyperLabel := HyperLabel{#jpemo,"Programas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBPEDIDO := DataColumn{padrao_num_08{}}
oDBPEDIDO:Width := 8
oDBPEDIDO:HyperLabel := oDCPEDIDO:HyperLabel 
oDBPEDIDO:Caption := "Pedido:"
self:Browser:AddColumn(oDBPEDIDO)

oDBCOMPRAS := DataColumn{padrao_num_08{}}
oDBCOMPRAS:Width := 9
oDBCOMPRAS:HyperLabel := oDCCOMPRAS:HyperLabel 
oDBCOMPRAS:Caption := "Compras:"
self:Browser:AddColumn(oDBCOMPRAS)

oDBCOMITEM := DataColumn{padrao_num_03{}}
oDBCOMITEM:Width := 9
oDBCOMITEM:HyperLabel := oDCCOMITEM:HyperLabel 
oDBCOMITEM:Caption := "Item"
self:Browser:AddColumn(oDBCOMITEM)

oDBTIPPED := DataColumn{padrao_char_01{}}
oDBTIPPED:Width := 4
oDBTIPPED:HyperLabel := oDCTIPPED:HyperLabel 
oDBTIPPED:Caption := "T"
self:Browser:AddColumn(oDBTIPPED)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 15
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{padrao_char_50{}}
oDBNOME:Width := 30
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBNOM2 := DataColumn{padrao_char_50{}}
oDBNOM2:Width := 6
oDBNOM2:HyperLabel := oDCNOM2:HyperLabel 
oDBNOM2:Caption := "Nom2:"
self:Browser:AddColumn(oDBNOM2)

oDBFORNECEDO := DataColumn{padrao_num_08{}}
oDBFORNECEDO:Width := 11
oDBFORNECEDO:HyperLabel := oDCFORNECEDO:HyperLabel 
oDBFORNECEDO:Caption := "For/Cli"
self:Browser:AddColumn(oDBFORNECEDO)

oDBCOGNOME := DataColumn{padrao_char_15{}}
oDBCOGNOME:Width := 9
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
self:Browser:AddColumn(oDBCOGNOME)

oDBUNID := DataColumn{padrao_char_02{}}
oDBUNID:Width := 6
oDBUNID:HyperLabel := oDCUNID:HyperLabel 
oDBUNID:Caption := "Unid:"
self:Browser:AddColumn(oDBUNID)

oDBAPLICACAO := DataColumn{padrao_char_50{}}
oDBAPLICACAO:Width := 11
oDBAPLICACAO:HyperLabel := oDCAPLICACAO:HyperLabel 
oDBAPLICACAO:Caption := "Aplicacao:"
self:Browser:AddColumn(oDBAPLICACAO)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOM2() 
return self:FieldGet(#NOM2)


assign NOM2(uValue) 
self:FieldPut(#NOM2, uValue)
return NOM2 := uValue


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


access TIPPED() 
return self:FieldGet(#TIPPED)


assign TIPPED(uValue) 
self:FieldPut(#TIPPED, uValue)
return TIPPED := uValue


access UNID() 
return self:FieldGet(#UNID)


assign UNID(uValue) 
self:FieldPut(#UNID, uValue)
return UNID := uValue


END CLASS
