#region DEFINES
STATIC DEFINE JFERGRP_ALTERAR := 103 
STATIC DEFINE JFERGRP_ANTERIOR := 110 
STATIC DEFINE JFERGRP_ANTERIOR1 := 114 
STATIC DEFINE JFERGRP_BALANCO := 101 
STATIC DEFINE JFERGRP_BUSCA := 112 
STATIC DEFINE JFERGRP_CANCELAR := 116 
STATIC DEFINE JFERGRP_CANCELAR1 := 122 
STATIC DEFINE JFERGRP_DELETAR := 119 
STATIC DEFINE JFERGRP_ENTRADA := 100 
STATIC DEFINE JFERGRP_EXCLUIR := 104 
STATIC DEFINE JFERGRP_GRUPO := 108 
STATIC DEFINE JFERGRP_INCLUIR := 105 
STATIC DEFINE JFERGRP_JFERGI := 106 
STATIC DEFINE JFERGRP_NOVO := 118 
STATIC DEFINE JFERGRP_PROXIMO := 109 
STATIC DEFINE JFERGRP_PROXIMO1 := 113 
STATIC DEFINE JFERGRP_SAIDA := 111 
STATIC DEFINE JFERGRP_SC_GRUPO := 107 
STATIC DEFINE JFERGRP_TABULAR := 102 
STATIC DEFINE JFERGRP_THEFIXEDTEXT10 := 117 
STATIC DEFINE JFERGRP_THEFIXEDTEXT11 := 120 
STATIC DEFINE JFERGRP_THEFIXEDTEXT12 := 121 
STATIC DEFINE JFERGRP_THEFIXEDTEXT9 := 115 
#endregion

PARTIAL class JFERGRP inherit MYDatadialog 

	PROTECT oDBGRUPO as DataColumn
	protect oCCEntrada as PUSHBUTTON
	protect oCCBALANCO as PUSHBUTTON
	protect oCCTabular as PUSHBUTTON
	protect oCCAlterar as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCIncluir as PUSHBUTTON
	protect oDCSC_GRUPO as FIXEDTEXT
	protect oDCGRUPO as SINGLELINEEDIT
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCSaida as PUSHBUTTON
	protect oCCbusca as PUSHBUTTON
	protect oCCProximo1 as PUSHBUTTON
	protect oCCAnterior1 as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCnovo as PUSHBUTTON
	protect oCCdeletar as PUSHBUTTON
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oDCtheFixedText12 as FIXEDTEXT
	protect oCCCancelar1 as PUSHBUTTON
// 	instance GRUPO 
	protect oSFJFERGI as JFERGI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD busca( ) 
//SELF:KeyFind()	defeito pois ficou dialog do dialog
LOCAL oBUSCA AS xBUSCA
oBUSCA:=xBUSCA{SELF,"Localizar","Digite o Grupo "}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   SELF:SERVER:SETORDER(1)
   SELF:SERVER:GOTOP()
   SELF:SERVER:SEEK(oBUSCA:cBUSCA)
ENDIF

access GRUPO() 
return self:FieldGet(#GRUPO)


assign GRUPO(uValue) 
self:FieldPut(#GRUPO, uValue)
return GRUPO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFERGRP",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oCCEntrada := PushButton{self,ResourceID{JFERGRP_ENTRADA,_GetInst()}}
oCCEntrada:HyperLabel := HyperLabel{#Entrada,"Entrada Estoque",NULL_STRING,NULL_STRING}
oCCEntrada:TooltipText := "Entradas para codigo"

oCCBALANCO := PushButton{self,ResourceID{JFERGRP_BALANCO,_GetInst()}}
oCCBALANCO:HyperLabel := HyperLabel{#BALANCO,"Balanco",NULL_STRING,NULL_STRING}
oCCBALANCO:TooltipText := "Inicia o Saldo do Codigo"

oCCTabular := PushButton{self,ResourceID{JFERGRP_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Tabular",NULL_STRING,NULL_STRING}
oCCTabular:TooltipText := "Visualiza Todos os Codigo do Grupo"

oCCAlterar := PushButton{self,ResourceID{JFERGRP_ALTERAR,_GetInst()}}
oCCAlterar:HyperLabel := HyperLabel{#Alterar,"Alterar",NULL_STRING,NULL_STRING}
oCCAlterar:TooltipText := "Altera o Codigo em Destaque"

oCCExcluir := PushButton{self,ResourceID{JFERGRP_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}
oCCExcluir:TooltipText := "Exclui o o Codigo em Destaque da Lista "

oCCIncluir := PushButton{self,ResourceID{JFERGRP_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}
oCCIncluir:TooltipText := "Inclui um Codigo para o Grupo"

oDCSC_GRUPO := FixedText{self,ResourceID{JFERGRP_SC_GRUPO,_GetInst()}}
oDCSC_GRUPO:HyperLabel := HyperLabel{#SC_GRUPO,"Grupo/Final",NULL_STRING,NULL_STRING}

oDCGRUPO := SingleLineEdit{self,ResourceID{JFERGRP_GRUPO,_GetInst()}}
oDCGRUPO:FieldSpec := PADRAO_CHAR_24{}
oDCGRUPO:HyperLabel := HyperLabel{#GRUPO,"Grupo:",NULL_STRING,"FERGRP_GRUPO"}
oDCGRUPO:TooltipText := "Codigo do Grupo"
oDCGRUPO:BackGround := aBrushes[1]
oDCGRUPO:Font(aFonts[1], FALSE)

oCCProximo := PushButton{self,ResourceID{JFERGRP_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ICO_NEXT{}
oCCProximo:TooltipText := "Avança um Codigo"

oCCAnterior := PushButton{self,ResourceID{JFERGRP_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ICO_PREVIOUS{}
oCCAnterior:TooltipText := "Retorno um Codigo"

oCCSaida := PushButton{self,ResourceID{JFERGRP_SAIDA,_GetInst()}}
oCCSaida:HyperLabel := HyperLabel{#Saida,"Saida Estoque",NULL_STRING,NULL_STRING}
oCCSaida:TooltipText := "Saidas de Estoque  Para o Codigo"

oCCbusca := PushButton{self,ResourceID{JFERGRP_BUSCA,_GetInst()}}
oCCbusca:Image := ICO_FIND{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbusca:TooltipText := "Localizar Um Grupo"

oCCProximo1 := PushButton{self,ResourceID{JFERGRP_PROXIMO1,_GetInst()}}
oCCProximo1:HyperLabel := HyperLabel{#Proximo1,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo1:Image := ICO_NEXT{}
oCCProximo1:TooltipText := "Avancar um Grupo"

oCCAnterior1 := PushButton{self,ResourceID{JFERGRP_ANTERIOR1,_GetInst()}}
oCCAnterior1:HyperLabel := HyperLabel{#Anterior1,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior1:Image := ICO_PREVIOUS{}
oCCAnterior1:TooltipText := "Retornar Um Grupo"

oDCtheFixedText9 := FixedText{self,ResourceID{JFERGRP_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JFERGRP_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}
oCCCancelar:TooltipText := "Encerra Edicáo"

oDCtheFixedText10 := FixedText{self,ResourceID{JFERGRP_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"novo",NULL_STRING,NULL_STRING}

oCCnovo := PushButton{self,ResourceID{JFERGRP_NOVO,_GetInst()}}
oCCnovo:HyperLabel := HyperLabel{#novo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCnovo:Image := ICO_NEW{}
oCCnovo:TooltipText := "Incluir um Novo Grupo"

oCCdeletar := PushButton{self,ResourceID{JFERGRP_DELETAR,_GetInst()}}
oCCdeletar:HyperLabel := HyperLabel{#deletar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCdeletar:Image := ICO_DELETE{}
oCCdeletar:TooltipText := "Excluir o Grupo Atual"

oDCtheFixedText11 := FixedText{self,ResourceID{JFERGRP_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"excluir",NULL_STRING,NULL_STRING}

oDCtheFixedText12 := FixedText{self,ResourceID{JFERGRP_THEFIXEDTEXT12,_GetInst()}}
oDCtheFixedText12:HyperLabel := HyperLabel{#theFixedText12,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar1 := PushButton{self,ResourceID{JFERGRP_CANCELAR1,_GetInst()}}
oCCCancelar1:HyperLabel := HyperLabel{#Cancelar1,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar1:Image := ICO_SAIR{}
oCCCancelar1:TooltipText := "Encerra Ediçao"

self:Caption := "Grupos"
self:HyperLabel := HyperLabel{#JFERGRP,"Grupos",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBGRUPO := DataColumn{PADRAO_CHAR_24{}}
oDBGRUPO:Width := 43
oDBGRUPO:HyperLabel := oDCGRUPO:HyperLabel 
oDBGRUPO:Caption := "Grupo:"
oDBGRUPO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBGRUPO)


self:ViewAs(#FormView)

oSFJFERGI := JFERGI{self,JFERGRP_JFERGI}
oSFJFERGI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD ordem( ) 
	SELF:KeyFind()

END CLASS
