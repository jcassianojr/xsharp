#region DEFINES
STATIC DEFINE JTURNO_APURA := 109 
STATIC DEFINE JTURNO_BUSCANUM := 111 
STATIC DEFINE JTURNO_CMDAPU := 112 
STATIC DEFINE JTURNO_CMDORDENAR := 113 
STATIC DEFINE JTURNO_CODIGO := 105 
STATIC DEFINE JTURNO_DESCRICAO := 108 
STATIC DEFINE JTURNO_FORMULA := 110 
STATIC DEFINE JTURNO_NOM2 := 107 
STATIC DEFINE JTURNO_NOME := 106 
STATIC DEFINE JTURNO_SC_APURA := 103 
STATIC DEFINE JTURNO_SC_CODIGO := 100 
STATIC DEFINE JTURNO_SC_DESCRICAO := 102 
STATIC DEFINE JTURNO_SC_FORMULA := 104 
STATIC DEFINE JTURNO_SC_NOME := 101 
#endregion

PARTIAL class JTurno inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBNOM2 as DataColumn
	PROTECT oDBDESCRICAO as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_DESCRICAO as FIXEDTEXT
	protect oDCSC_APURA as FIXEDTEXT
	protect oDCSC_FORMULA as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCNOM2 as SINGLELINEEDIT
	protect oDCDESCRICAO as SINGLELINEEDIT
	protect oDCAPURA as SINGLELINEEDIT
	protect oDCFORMULA as SINGLELINEEDIT
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCcmdAPU as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
// 	instance CODIGO 
// 	instance NOME 
// 	instance NOM2 
// 	instance DESCRICAO 
// 	instance APURA 
// 	instance FORMULA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access APURA() 
return self:FieldGet(#APURA)


assign APURA(uValue) 
self:FieldPut(#APURA, uValue)
return APURA := uValue


METHOD cmdordenar( ) 
	SELF:KeyFind()

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DESCRICAO() 
return self:FieldGet(#DESCRICAO)


assign DESCRICAO(uValue) 
self:FieldPut(#DESCRICAO, uValue)
return DESCRICAO := uValue


access FORMULA() 
return self:FieldGet(#FORMULA)


assign FORMULA(uValue) 
self:FieldPut(#FORMULA, uValue)
return FORMULA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JTurno",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_CODIGO := FixedText{self,ResourceID{JTURNO_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JTURNO_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_DESCRICAO := FixedText{self,ResourceID{JTURNO_SC_DESCRICAO,_GetInst()}}
oDCSC_DESCRICAO:HyperLabel := HyperLabel{#SC_DESCRICAO,"Descricao:",NULL_STRING,NULL_STRING}

oDCSC_APURA := FixedText{self,ResourceID{JTURNO_SC_APURA,_GetInst()}}
oDCSC_APURA:HyperLabel := HyperLabel{#SC_APURA,"Apura:",NULL_STRING,NULL_STRING}

oDCSC_FORMULA := FixedText{self,ResourceID{JTURNO_SC_FORMULA,_GetInst()}}
oDCSC_FORMULA:HyperLabel := HyperLabel{#SC_FORMULA,"Formula:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JTURNO_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_02{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"TABTURNO_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]

oDCNOME := SingleLineEdit{self,ResourceID{JTURNO_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"TABTURNO_NOME"}
oDCNOME:TooltipText := "Descriçao Horario"

oDCNOM2 := SingleLineEdit{self,ResourceID{JTURNO_NOM2,_GetInst()}}
oDCNOM2:FieldSpec := PADRAO_CHAR_40{}
oDCNOM2:HyperLabel := HyperLabel{#NOM2,"Nom2:",NULL_STRING,"TABTURNO_NOM2"}
oDCNOM2:TooltipText := "Descriçao Horario"

oDCDESCRICAO := SingleLineEdit{self,ResourceID{JTURNO_DESCRICAO,_GetInst()}}
oDCDESCRICAO:FieldSpec := PADRAO_CHAR_40{}
oDCDESCRICAO:HyperLabel := HyperLabel{#DESCRICAO,"Descricao:",NULL_STRING,"TABTURNO_DESCRICAO"}
oDCDESCRICAO:TooltipText := "Descriçao do Codigo"

oDCAPURA := SingleLineEdit{self,ResourceID{JTURNO_APURA,_GetInst()}}
oDCAPURA:FieldSpec := PADRAO_CHAR_01{}
oDCAPURA:HyperLabel := HyperLabel{#APURA,"Apura:",NULL_STRING,"TABTURNO_APURA"}
oDCAPURA:TooltipText := "Se Apura S/N"
oDCAPURA:BackGround := aBrushes[1]

oDCFORMULA := SingleLineEdit{self,ResourceID{JTURNO_FORMULA,_GetInst()}}
oDCFORMULA:FieldSpec := PADRAO_CHAR_40{}
oDCFORMULA:HyperLabel := HyperLabel{#FORMULA,"Formula:",NULL_STRING,"TABTURNO_FORMULA"}
oDCFORMULA:TooltipText := "Formula de Apuraçao"

oCCbuscaNUM := PushButton{self,ResourceID{JTURNO_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCcmdAPU := PushButton{self,ResourceID{JTURNO_CMDAPU,_GetInst()}}
oCCcmdAPU:HyperLabel := HyperLabel{#cmdAPU,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JTURNO_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Turnos"
self:HyperLabel := HyperLabel{#JTurno,"Turnos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_02{}}
oDBCODIGO:Width := 11
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_40{}}
oDBNOME:Width := 17
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBNOM2 := DataColumn{PADRAO_CHAR_40{}}
oDBNOM2:Width := 16
oDBNOM2:HyperLabel := oDCNOM2:HyperLabel 
oDBNOM2:Caption := "Nom2:"
self:Browser:AddColumn(oDBNOM2)

oDBDESCRICAO := DataColumn{PADRAO_CHAR_40{}}
oDBDESCRICAO:Width := 22
oDBDESCRICAO:HyperLabel := oDCDESCRICAO:HyperLabel 
oDBDESCRICAO:Caption := "Descricao:"
self:Browser:AddColumn(oDBDESCRICAO)


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


END CLASS
