#region DEFINES
STATIC DEFINE CRMJANTRI_AUT := 108 
STATIC DEFINE CRMJANTRI_CANCELAR := 114 
STATIC DEFINE CRMJANTRI_CMDGERAAUT := 107 
STATIC DEFINE CRMJANTRI_FT15 := 105 
STATIC DEFINE CRMJANTRI_FT16 := 104 
STATIC DEFINE CRMJANTRI_FT18 := 101 
STATIC DEFINE CRMJANTRI_FT19 := 110 
STATIC DEFINE CRMJANTRI_FT6 := 119 
STATIC DEFINE CRMJANTRI_FT8 := 109 
STATIC DEFINE CRMJANTRI_INCLUIR := 116 
STATIC DEFINE CRMJANTRI_PEITE := 117 
STATIC DEFINE CRMJANTRI_PEPED := 118 
STATIC DEFINE CRMJANTRI_PGTO := 111 
STATIC DEFINE CRMJANTRI_PRECO := 106 
STATIC DEFINE CRMJANTRI_PRECOPR := 100 
STATIC DEFINE CRMJANTRI_QTDEA := 103 
STATIC DEFINE CRMJANTRI_QTDEB := 102 
STATIC DEFINE CRMJANTRI_SC_NUMMB4 := 112 
STATIC DEFINE CRMJANTRI_THEFIXEDTEXT10 := 115 
STATIC DEFINE CRMJANTRI_THEFIXEDTEXT11 := 113 
#endregion

PARTIAL class crmJanTri inherit DATADIALOG 

	protect oDCPRECOPR as SINGLELINEEDIT
	protect oDCFT18 as FIXEDTEXT
	protect oDCQTDEB as RIGHTSLE
	protect oDCQTDEA as RIGHTSLE
	protect oDCFT16 as FIXEDTEXT
	protect oDCFT15 as FIXEDTEXT
	protect oDCPRECO as RIGHTSLE
	protect oCCcmdGeraAut as PUSHBUTTON
	protect oDCAUT as RIGHTSLE
	protect oDCFT8 as FIXEDTEXT
	protect oDCFT19 as FIXEDTEXT
	protect oDCPGTO as SINGLELINEEDIT
	protect oDCSC_NUMMB4 as FIXEDTEXT
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCINCLUIR as PUSHBUTTON
	protect oDCPEITE as RIGHTSLE
	protect oDCPEPED as RIGHTSLE
	protect oDCFT6 as FIXEDTEXT
// 	instance PRECOPR 
// 	instance QTDEB 
// 	instance QTDEA 
// 	instance PRECO 
// 	instance AUT 
// 	instance PGTO 
// 	instance PEITE 
// 	instance PEPED 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AUT() 
return self:FieldGet(#AUT)


assign AUT(uValue) 
self:FieldPut(#AUT, uValue)
return AUT := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"crmJanTri",_GetInst()},iCtlID)

oDCPRECOPR := SingleLineEdit{self,ResourceID{CRMJANTRI_PRECOPR,_GetInst()}}
oDCPRECOPR:HyperLabel := HyperLabel{#PRECOPR,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPRECOPR:FocusSelect := FSEL_ALL
oDCPRECOPR:FieldSpec := PADRAO_NUM_15_6{}

oDCFT18 := FixedText{self,ResourceID{CRMJANTRI_FT18,_GetInst()}}
oDCFT18:HyperLabel := HyperLabel{#FT18,"Preço Pedido",NULL_STRING,NULL_STRING}

oDCQTDEB := rightSle{self,ResourceID{CRMJANTRI_QTDEB,_GetInst()}}
oDCQTDEB:FieldSpec := PADRAO_NUM_12_3{}
oDCQTDEB:HyperLabel := HyperLabel{#QTDEB,NULL_STRING,NULL_STRING,NULL_STRING}
oDCQTDEB:FocusSelect := FSEL_ALL
oDCQTDEB:TooltipText := "Qtde 2 Nora Fiscal"

oDCQTDEA := rightSle{self,ResourceID{CRMJANTRI_QTDEA,_GetInst()}}
oDCQTDEA:FieldSpec := PADRAO_NUM_12_3{}
oDCQTDEA:HyperLabel := HyperLabel{#QTDEA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCQTDEA:FocusSelect := FSEL_ALL

oDCFT16 := FixedText{self,ResourceID{CRMJANTRI_FT16,_GetInst()}}
oDCFT16:HyperLabel := HyperLabel{#FT16,"Qtde",NULL_STRING,NULL_STRING}

oDCFT15 := FixedText{self,ResourceID{CRMJANTRI_FT15,_GetInst()}}
oDCFT15:HyperLabel := HyperLabel{#FT15,"Qtde",NULL_STRING,NULL_STRING}

oDCPRECO := rightSle{self,ResourceID{CRMJANTRI_PRECO,_GetInst()}}
oDCPRECO:HyperLabel := HyperLabel{#PRECO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPRECO:FocusSelect := FSEL_ALL
oDCPRECO:FieldSpec := PADRAO_NUM_15_6{}
oDCPRECO:TooltipText := "Preço da Nota Fiscal"

oCCcmdGeraAut := PushButton{self,ResourceID{CRMJANTRI_CMDGERAAUT,_GetInst()}}
oCCcmdGeraAut:HyperLabel := HyperLabel{#cmdGeraAut,"Gerar Autorizacao Preco",NULL_STRING,NULL_STRING}
oCCcmdGeraAut:TooltipText := "Outras Entradas"

oDCAUT := rightSle{self,ResourceID{CRMJANTRI_AUT,_GetInst()}}
oDCAUT:HyperLabel := HyperLabel{#AUT,NULL_STRING,NULL_STRING,NULL_STRING}
oDCAUT:FocusSelect := FSEL_ALL
oDCAUT:FieldSpec := PADRAO_NUM_08{}
oDCAUT:TooltipText := "Autorizaçao Para Recebimento com Divergencias"

oDCFT8 := FixedText{self,ResourceID{CRMJANTRI_FT8,_GetInst()}}
oDCFT8:HyperLabel := HyperLabel{#FT8,"Autorizacao",NULL_STRING,NULL_STRING}

oDCFT19 := FixedText{self,ResourceID{CRMJANTRI_FT19,_GetInst()}}
oDCFT19:HyperLabel := HyperLabel{#FT19,"Preço",NULL_STRING,NULL_STRING}

oDCPGTO := SingleLineEdit{self,ResourceID{CRMJANTRI_PGTO,_GetInst()}}
oDCPGTO:HyperLabel := HyperLabel{#PGTO,NULL_STRING,NULL_STRING,"MY04_NUMMB01"}

oDCSC_NUMMB4 := FixedText{self,ResourceID{CRMJANTRI_SC_NUMMB4,_GetInst()}}
oDCSC_NUMMB4:HyperLabel := HyperLabel{#SC_NUMMB4,"Pgto",NULL_STRING,NULL_STRING}

oDCtheFixedText11 := FixedText{self,ResourceID{CRMJANTRI_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{CRMJANTRI_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}
oCCCancelar:TooltipText := "Encerra os Lançamento"

oDCtheFixedText10 := FixedText{self,ResourceID{CRMJANTRI_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCINCLUIR := PushButton{self,ResourceID{CRMJANTRI_INCLUIR,_GetInst()}}
oCCINCLUIR:HyperLabel := HyperLabel{#INCLUIR,NULL_STRING,NULL_STRING,NULL_STRING}
oCCINCLUIR:Image := ICO_OK{}
oCCINCLUIR:TooltipText := "Inclui O Lançamento"

oDCPEITE := rightSle{self,ResourceID{CRMJANTRI_PEITE,_GetInst()}}
oDCPEITE:FieldSpec := PADRAO_NUM_03{}
oDCPEITE:HyperLabel := HyperLabel{#PEITE,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPEITE:FocusSelect := FSEL_ALL
oDCPEITE:TooltipText := "Item do Pedido de Compras"

oDCPEPED := rightSle{self,ResourceID{CRMJANTRI_PEPED,_GetInst()}}
oDCPEPED:FieldSpec := PADRAO_NUM_08{}
oDCPEPED:HyperLabel := HyperLabel{#PEPED,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPEPED:FocusSelect := FSEL_ALL
oDCPEPED:TooltipText := "Numero do Pedido de Compras"

oDCFT6 := FixedText{self,ResourceID{CRMJANTRI_FT6,_GetInst()}}
oDCFT6:HyperLabel := HyperLabel{#FT6,"Pedido",NULL_STRING,NULL_STRING}

self:Caption := "Operacao Triangular Checagem"
self:HyperLabel := HyperLabel{#crmJanTri,"Operacao Triangular Checagem",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PEITE() 
return self:FieldGet(#PEITE)


assign PEITE(uValue) 
self:FieldPut(#PEITE, uValue)
return PEITE := uValue


access PEPED() 
return self:FieldGet(#PEPED)


assign PEPED(uValue) 
self:FieldPut(#PEPED, uValue)
return PEPED := uValue


access PGTO() 
return self:FieldGet(#PGTO)


assign PGTO(uValue) 
self:FieldPut(#PGTO, uValue)
return PGTO := uValue


access PRECO() 
return self:FieldGet(#PRECO)


assign PRECO(uValue) 
self:FieldPut(#PRECO, uValue)
return PRECO := uValue


access PRECOPR() 
return self:FieldGet(#PRECOPR)


assign PRECOPR(uValue) 
self:FieldPut(#PRECOPR, uValue)
return PRECOPR := uValue


access QTDEA() 
return self:FieldGet(#QTDEA)


assign QTDEA(uValue) 
self:FieldPut(#QTDEA, uValue)
return QTDEA := uValue


access QTDEB() 
return self:FieldGet(#QTDEB)


assign QTDEB(uValue) 
self:FieldPut(#QTDEB, uValue)
return QTDEB := uValue


END CLASS
