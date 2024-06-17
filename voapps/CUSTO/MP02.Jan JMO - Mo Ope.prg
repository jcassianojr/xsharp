#region DEFINES
STATIC DEFINE JMO_AREA := 108 
STATIC DEFINE JMO_BUSCACOD := 101 
STATIC DEFINE JMO_CODIGO := 104 
STATIC DEFINE JMO_FT3 := 106 
STATIC DEFINE JMO_NOME := 105 
STATIC DEFINE JMO_PORCOD := 100 
STATIC DEFINE JMO_SC_CODIGO := 102 
STATIC DEFINE JMO_SC_NOME := 103 
STATIC DEFINE JMO_SC_VALOR := 107 
STATIC DEFINE JMO_VALORC := 109 
#endregion

class JMO inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBVALORC as DataColumn
	protect oCCporcod as PUSHBUTTON
	protect oCCbuscacod as PUSHBUTTON
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCFT3 as FIXEDTEXT
	protect oDCSC_VALOR as FIXEDTEXT
	protect oDCAREA as SINGLELINEEDIT
	protect oDCVALORC as RIGHTSLE
// 	instance CODIGO 
// 	instance NOME 
// 	instance AREA 
// 	instance VALORC 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AREA() 
return self:FieldGet(#AREA)


assign AREA(uValue) 
self:FieldPut(#AREA, uValue)
return AREA := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMO",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oCCporcod := PushButton{self,ResourceID{JMO_PORCOD,_GetInst()}}
oCCporcod:Image := ICO_AZ{}
oCCporcod:HyperLabel := HyperLabel{#porcod,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscacod := PushButton{self,ResourceID{JMO_BUSCACOD,_GetInst()}}
oCCbuscacod:Image := ICO_FIND{}
oCCbuscacod:HyperLabel := HyperLabel{#buscacod,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JMO_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JMO_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JMO_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MP02_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]

oDCNOME := SingleLineEdit{self,ResourceID{JMO_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_100{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MP02_NOME"}
oDCNOME:BackGround := aBrushes[1]

oDCFT3 := FixedText{self,ResourceID{JMO_FT3,_GetInst()}}
oDCFT3:HyperLabel := HyperLabel{#FT3,"Area",NULL_STRING,NULL_STRING}

oDCSC_VALOR := FixedText{self,ResourceID{JMO_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor:",NULL_STRING,NULL_STRING}

oDCAREA := SingleLineEdit{self,ResourceID{JMO_AREA,_GetInst()}}
oDCAREA:FieldSpec := PADRAO_CHAR_02{}
oDCAREA:HyperLabel := HyperLabel{#AREA,"Codigo:",NULL_STRING,"MP02_CODIGO"}
oDCAREA:BackGround := aBrushes[1]

oDCVALORC := rightSle{self,ResourceID{JMO_VALORC,_GetInst()}}
oDCVALORC:FieldSpec := PADRAO_NUM_12_2{}
oDCVALORC:HyperLabel := HyperLabel{#VALORC,"Valor:",NULL_STRING,"MP02_VALOR"}
oDCVALORC:FocusSelect := FSEL_HOME

self:Caption := "Mao de Obra Operador"
self:HyperLabel := HyperLabel{#JMO,"Mao de Obra Operador",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 19
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_100{}}
oDBNOME:Width := 32
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)

oDBVALORC := DataColumn{PADRAO_NUM_12_2{}}
oDBVALORC:Width := 24
oDBVALORC:HyperLabel := oDCVALORC:HyperLabel 
oDBVALORC:Caption := "Valor:"
self:Browser:AddColumn(oDBVALORC)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access VALORC() 
return self:FieldGet(#VALORC)


assign VALORC(uValue) 
self:FieldPut(#VALORC, uValue)
return VALORC := uValue


END CLASS
