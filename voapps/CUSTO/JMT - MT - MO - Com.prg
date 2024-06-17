#region DEFINES
STATIC DEFINE JMT_BUSCAOV := 105 
STATIC DEFINE JMT_CMDCOPIA := 112 
STATIC DEFINE JMT_CODIGO := 108 
STATIC DEFINE JMT_CUSTF := 114 
STATIC DEFINE JMT_NOME := 109 
STATIC DEFINE JMT_POROV := 104 
STATIC DEFINE JMT_SC_CODIGO := 106 
STATIC DEFINE JMT_SC_NOME := 107 
STATIC DEFINE JMT_SC_VALOR := 111 
STATIC DEFINE JMT_THEFIXEDTEXT4 := 110 
STATIC DEFINE JMT_THEFIXEDTEXT5 := 101 
STATIC DEFINE JMT_THEFIXEDTEXT6 := 103 
STATIC DEFINE JMT_THESINGLELINEEDIT4 := 108 
STATIC DEFINE JMT_ULTDATA := 102 
STATIC DEFINE JMT_ULTPRC := 113 
STATIC DEFINE JMT_ULTUND := 100 
#endregion

class JMT inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBULTPRC as DataColumn
	PROTECT oDBULTUND as DataColumn
	PROTECT oDBULTDATA as DataColumn
	PROTECT oDBCUSTF as DataColumn
	protect oDCULTUND as SINGLELINEEDIT
	protect oDCtheFixedText5 as FIXEDTEXT
	protect oDCULTDATA as SINGLELINEEDIT
	protect oDCtheFixedText6 as FIXEDTEXT
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCtheFixedText4 as FIXEDTEXT
	protect oDCSC_VALOR as FIXEDTEXT
	protect oCCcmdCOPIA as PUSHBUTTON
	protect oDCULTPRC as SINGLELINEEDIT
	protect oDCCUSTF as RIGHTSLE
// 	instance ULTUND 
// 	instance ULTDATA 
// 	instance CODIGO 
// 	instance NOME 
// 	instance ULTPRC 
// 	instance CUSTF 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CUSTF() 
return self:FieldGet(#CUSTF)


assign CUSTF(uValue) 
self:FieldPut(#CUSTF, uValue)
return CUSTF := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMT",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCULTUND := SingleLineEdit{self,ResourceID{JMT_ULTUND,_GetInst()}}
oDCULTUND:FieldSpec := padrao_char_02{}
oDCULTUND:HyperLabel := HyperLabel{#ULTUND,"UN",NULL_STRING,"MP03_CODIGO"}
oDCULTUND:BackGround := aBrushes[1]

oDCtheFixedText5 := FixedText{self,ResourceID{JMT_THEFIXEDTEXT5,_GetInst()}}
oDCtheFixedText5:HyperLabel := HyperLabel{#theFixedText5,"Un",NULL_STRING,NULL_STRING}

oDCULTDATA := SingleLineEdit{self,ResourceID{JMT_ULTDATA,_GetInst()}}
oDCULTDATA:FieldSpec := date_field{}
oDCULTDATA:HyperLabel := HyperLabel{#ULTDATA,"Em",NULL_STRING,"MP03_CODIGO"}
oDCULTDATA:BackGround := aBrushes[1]

oDCtheFixedText6 := FixedText{self,ResourceID{JMT_THEFIXEDTEXT6,_GetInst()}}
oDCtheFixedText6:HyperLabel := HyperLabel{#theFixedText6,"Data",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JMT_POROV,_GetInst()}}
oCCporov:Image := ico_az{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaov := PushButton{self,ResourceID{JMT_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ico_find{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JMT_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JMT_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JMT_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MP03_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]

oDCNOME := SingleLineEdit{self,ResourceID{JMT_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_100{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MP03_NOME"}
oDCNOME:BackGround := aBrushes[1]

oDCtheFixedText4 := FixedText{self,ResourceID{JMT_THEFIXEDTEXT4,_GetInst()}}
oDCtheFixedText4:HyperLabel := HyperLabel{#theFixedText4,"Ultimo Preço",NULL_STRING,NULL_STRING}

oDCSC_VALOR := FixedText{self,ResourceID{JMT_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Custo",NULL_STRING,NULL_STRING}

oCCcmdCOPIA := PushButton{self,ResourceID{JMT_CMDCOPIA,_GetInst()}}
oCCcmdCOPIA:HyperLabel := HyperLabel{#cmdCOPIA,"Copia",NULL_STRING,NULL_STRING}

oDCULTPRC := SingleLineEdit{self,ResourceID{JMT_ULTPRC,_GetInst()}}
oDCULTPRC:FieldSpec := padrao_num_15_6{}
oDCULTPRC:HyperLabel := HyperLabel{#ULTPRC,"Ult.Preço",NULL_STRING,"MP03_CODIGO"}
oDCULTPRC:BackGround := aBrushes[1]

oDCCUSTF := rightSle{self,ResourceID{JMT_CUSTF,_GetInst()}}
oDCCUSTF:FieldSpec := padrao_num_15_6{}
oDCCUSTF:HyperLabel := HyperLabel{#CUSTF,"Valor:",NULL_STRING,"MP03_VALOR"}

self:Caption := "Ultimos Preços"
self:HyperLabel := HyperLabel{#JMT,"Ultimos Preços",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 20
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{padrao_char_100{}}
oDBNOME:Width := 26
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)

oDBULTPRC := DataColumn{padrao_num_15_6{}}
oDBULTPRC:Width := 18
oDBULTPRC:HyperLabel := oDCULTPRC:HyperLabel 
oDBULTPRC:Caption := "Ult.Preço"
oDBULTPRC:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBULTPRC)

oDBULTUND := DataColumn{padrao_char_02{}}
oDBULTUND:Width := 5
oDBULTUND:HyperLabel := oDCULTUND:HyperLabel 
oDBULTUND:Caption := "UN"
oDBULTUND:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBULTUND)

oDBULTDATA := DataColumn{date_field{}}
oDBULTDATA:Width := 11
oDBULTDATA:HyperLabel := oDCULTDATA:HyperLabel 
oDBULTDATA:Caption := "Em"
oDBULTDATA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBULTDATA)

oDBCUSTF := DataColumn{padrao_num_15_6{}}
oDBCUSTF:Width := 16
oDBCUSTF:HyperLabel := oDCCUSTF:HyperLabel 
oDBCUSTF:Caption := "Valor:"
self:Browser:AddColumn(oDBCUSTF)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access ULTDATA() 
return self:FieldGet(#ULTDATA)


assign ULTDATA(uValue) 
self:FieldPut(#ULTDATA, uValue)
return ULTDATA := uValue


access ULTPRC() 
return self:FieldGet(#ULTPRC)


assign ULTPRC(uValue) 
self:FieldPut(#ULTPRC, uValue)
return ULTPRC := uValue


access ULTUND() 
return self:FieldGet(#ULTUND)


assign ULTUND(uValue) 
self:FieldPut(#ULTUND, uValue)
return ULTUND := uValue


END CLASS
