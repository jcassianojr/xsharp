#region DEFINES
STATIC DEFINE JCONTAS_BUSCANUM := 104 
STATIC DEFINE JCONTAS_CMDORDENAR := 105 
STATIC DEFINE JCONTAS_CODIGO := 102 
STATIC DEFINE JCONTAS_DESCR := 103 
STATIC DEFINE JCONTAS_SC_CODIGO := 100 
STATIC DEFINE JCONTAS_SC_DESCR := 101 
#endregion

PARTIAL class JCONTAS inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDESCR as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_DESCR as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCDESCR as SINGLELINEEDIT
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
// 	instance CODIGO 
// 	instance DESCR 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DESCR() 
return self:FieldGet(#DESCR)


assign DESCR(uValue) 
self:FieldPut(#DESCR, uValue)
return DESCR := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCONTAS",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_CODIGO := FixedText{self,ResourceID{JCONTAS_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_DESCR := FixedText{self,ResourceID{JCONTAS_SC_DESCR,_GetInst()}}
oDCSC_DESCR:HyperLabel := HyperLabel{#SC_DESCR,"Descr:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JCONTAS_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_04{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"CONTAS_CODIGO"}
oDCCODIGO:TooltipText := "Numero da Conta"
oDCCODIGO:BackGround := aBrushes[1]

oDCDESCR := SingleLineEdit{self,ResourceID{JCONTAS_DESCR,_GetInst()}}
oDCDESCR:FieldSpec := PADRAO_CHAR_35{}
oDCDESCR:HyperLabel := HyperLabel{#DESCR,"Descr:",NULL_STRING,"CONTAS_DESCR"}

oCCbuscaNUM := PushButton{self,ResourceID{JCONTAS_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JCONTAS_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Plano de Contas"
self:HyperLabel := HyperLabel{#JCONTAS,"Plano de Contas",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_04{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBDESCR := DataColumn{PADRAO_CHAR_35{}}
oDBDESCR:Width := 35
oDBDESCR:HyperLabel := oDCDESCR:HyperLabel 
oDBDESCR:Caption := "Descr:"
self:Browser:AddColumn(oDBDESCR)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
