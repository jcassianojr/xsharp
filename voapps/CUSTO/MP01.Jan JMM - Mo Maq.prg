#region DEFINES
STATIC DEFINE JMM_AREA := 111 
STATIC DEFINE JMM_BUSCACOD := 107 
STATIC DEFINE JMM_CODFOLHA := 101 
STATIC DEFINE JMM_CODIGO := 110 
STATIC DEFINE JMM_COGCUSTO := 102 
STATIC DEFINE JMM_COGNOME := 104 
STATIC DEFINE JMM_FT3 := 109 
STATIC DEFINE JMM_FT4 := 105 
STATIC DEFINE JMM_NOME := 113 
STATIC DEFINE JMM_PORCOD := 106 
STATIC DEFINE JMM_SC_CODIGO := 108 
STATIC DEFINE JMM_SC_NOME := 112 
STATIC DEFINE JMM_SC_VALOR := 114 
STATIC DEFINE JMM_SC_VALOR1 := 100 
STATIC DEFINE JMM_SC_VALOR2 := 103 
STATIC DEFINE JMM_VALOR := 115 
#endregion

class JMM inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBCODFOLHA as DataColumn
	PROTECT oDBVALOR as DataColumn
	protect oDCSC_VALOR1 as FIXEDTEXT
	protect oDCCODFOLHA as RIGHTSLE
	protect oDCCOGCUSTO as SINGLELINEEDIT
	protect oDCSC_VALOR2 as FIXEDTEXT
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCFT4 as FIXEDTEXT
	protect oCCporcod as PUSHBUTTON
	protect oCCbuscacod as PUSHBUTTON
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCFT3 as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCAREA as SINGLELINEEDIT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSC_VALOR as FIXEDTEXT
	protect oDCVALOR as RIGHTSLE
// 	instance CODFOLHA 
// 	instance COGCUSTO 
// 	instance COGNOME 
// 	instance CODIGO 
// 	instance AREA 
// 	instance NOME 
// 	instance VALOR 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AREA() 
return self:FieldGet(#AREA)


assign AREA(uValue) 
self:FieldPut(#AREA, uValue)
return AREA := uValue


access CODFOLHA() 
return self:FieldGet(#CODFOLHA)


assign CODFOLHA(uValue) 
self:FieldPut(#CODFOLHA, uValue)
return CODFOLHA := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access COGCUSTO() 
return self:FieldGet(#COGCUSTO)


assign COGCUSTO(uValue) 
self:FieldPut(#COGCUSTO, uValue)
return COGCUSTO := uValue


access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMM",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_VALOR1 := FixedText{self,ResourceID{JMM_SC_VALOR1,_GetInst()}}
oDCSC_VALOR1:HyperLabel := HyperLabel{#SC_VALOR1,"Cod.Reduzido",NULL_STRING,NULL_STRING}

oDCCODFOLHA := rightSle{self,ResourceID{JMM_CODFOLHA,_GetInst()}}
oDCCODFOLHA:FieldSpec := PADRAO_NUM_08{}
oDCCODFOLHA:HyperLabel := HyperLabel{#CODFOLHA,"Red",NULL_STRING,"MP01_VALOR"}

oDCCOGCUSTO := SingleLineEdit{self,ResourceID{JMM_COGCUSTO,_GetInst()}}
oDCCOGCUSTO:FieldSpec := PADRAO_CHAR_20{}
oDCCOGCUSTO:HyperLabel := HyperLabel{#COGCUSTO,"Valor:",NULL_STRING,"MP01_VALOR"}

oDCSC_VALOR2 := FixedText{self,ResourceID{JMM_SC_VALOR2,_GetInst()}}
oDCSC_VALOR2:HyperLabel := HyperLabel{#SC_VALOR2,"Cognome",NULL_STRING,NULL_STRING}

oDCCOGNOME := SingleLineEdit{self,ResourceID{JMM_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := PADRAO_CHAR_10{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Codigo:",NULL_STRING,"MP01_CODIGO"}
oDCCOGNOME:BackGround := aBrushes[1]

oDCFT4 := FixedText{self,ResourceID{JMM_FT4,_GetInst()}}
oDCFT4:HyperLabel := HyperLabel{#FT4,"Cognome PCP","Area na Empresa",NULL_STRING}

oCCporcod := PushButton{self,ResourceID{JMM_PORCOD,_GetInst()}}
oCCporcod:Image := ICO_AZ{}
oCCporcod:HyperLabel := HyperLabel{#porcod,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscacod := PushButton{self,ResourceID{JMM_BUSCACOD,_GetInst()}}
oCCbuscacod:Image := ICO_FIND{}
oCCbuscacod:HyperLabel := HyperLabel{#buscacod,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JMM_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCFT3 := FixedText{self,ResourceID{JMM_FT3,_GetInst()}}
oDCFT3:HyperLabel := HyperLabel{#FT3,"Area","Area na Empresa",NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JMM_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Tabela Mao de Obra Maquina",NULL_STRING,"MP01_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]

oDCAREA := SingleLineEdit{self,ResourceID{JMM_AREA,_GetInst()}}
oDCAREA:FieldSpec := PADRAO_CHAR_02{}
oDCAREA:HyperLabel := HyperLabel{#AREA,"Codigo:",NULL_STRING,"MP01_CODIGO"}
oDCAREA:BackGround := aBrushes[1]

oDCSC_NOME := FixedText{self,ResourceID{JMM_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JMM_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_100{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MP01_NOME"}
oDCNOME:BackGround := aBrushes[1]

oDCSC_VALOR := FixedText{self,ResourceID{JMM_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor Custo",NULL_STRING,NULL_STRING}

oDCVALOR := rightSle{self,ResourceID{JMM_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := PADRAO_NUM_12_2{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Valor:",NULL_STRING,"MP01_VALOR"}

self:Caption := "Tabela Mao de Obra Maquina"
self:HyperLabel := HyperLabel{#JMM,"Tabela Mao de Obra Maquina",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 19
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Tabela Mao de Obra Maquina"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_100{}}
oDBNOME:Width := 36
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)

oDBCODFOLHA := DataColumn{PADRAO_NUM_08{}}
oDBCODFOLHA:Width := 9
oDBCODFOLHA:HyperLabel := oDCCODFOLHA:HyperLabel 
oDBCODFOLHA:Caption := "Red"
self:Browser:AddColumn(oDBCODFOLHA)

oDBVALOR := DataColumn{PADRAO_NUM_12_2{}}
oDBVALOR:Width := 19
oDBVALOR:HyperLabel := oDCVALOR:HyperLabel 
oDBVALOR:Caption := "Valor:"
self:Browser:AddColumn(oDBVALOR)


self:ViewAs(#FormView)

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
