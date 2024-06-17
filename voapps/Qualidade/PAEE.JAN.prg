#region DEFINES
STATIC DEFINE JPAEE_BUSCANUM := 117 
STATIC DEFINE JPAEE_CLIENTE := 101 
STATIC DEFINE JPAEE_CODIGO := 102 
STATIC DEFINE JPAEE_DATA := 100 
STATIC DEFINE JPAEE_ESCCOD := 113 
STATIC DEFINE JPAEE_ESCFOR := 112 
STATIC DEFINE JPAEE_FOTO := 115 
STATIC DEFINE JPAEE_OBS01 := 103 
STATIC DEFINE JPAEE_OBS02 := 104 
STATIC DEFINE JPAEE_OBS03 := 105 
STATIC DEFINE JPAEE_PAEE := 111 
STATIC DEFINE JPAEE_POROV := 116 
STATIC DEFINE JPAEE_SC_CLIENTE := 108 
STATIC DEFINE JPAEE_SC_CODIGO := 109 
STATIC DEFINE JPAEE_SC_DATA := 106 
STATIC DEFINE JPAEE_SC_DESTINO2 := 114 
STATIC DEFINE JPAEE_SC_OBS01 := 110 
STATIC DEFINE JPAEE_SC_PAEE := 107 
#endregion

PARTIAL class JPAEE inherit MYDataWindow 

	PROTECT oDBPAEE as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCODIGO as DataColumn
	protect oDCDATA as DATESLE
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCOBS01 as SINGLELINEEDIT
	protect oDCOBS02 as SINGLELINEEDIT
	protect oDCOBS03 as SINGLELINEEDIT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_PAEE as FIXEDTEXT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_OBS01 as FIXEDTEXT
	protect oDCPAEE as SINGLELINEEDIT
	protect oCCescfor as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
// 	instance DATA 
// 	instance CLIENTE 
// 	instance CODIGO 
// 	instance OBS01 
// 	instance OBS02 
// 	instance OBS03 
// 	instance PAEE 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CLIENTE() 
return self:FieldGet(#CLIENTE)


assign CLIENTE(uValue) 
self:FieldPut(#CLIENTE, uValue)
return CLIENTE := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPAEE",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDATA := DateSle{self,ResourceID{JPAEE_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"PAEE_DATA"}

oDCCLIENTE := SingleLineEdit{self,ResourceID{JPAEE_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := padrao_num_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"PAEE_CLIENTE"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JPAEE_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"PAEE_CODIGO"}

oDCOBS01 := SingleLineEdit{self,ResourceID{JPAEE_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := padrao_char_200{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Obs01:",NULL_STRING,"PAEE_OBS01"}

oDCOBS02 := SingleLineEdit{self,ResourceID{JPAEE_OBS02,_GetInst()}}
oDCOBS02:FieldSpec := padrao_char_200{}
oDCOBS02:HyperLabel := HyperLabel{#OBS02,"Obs02:",NULL_STRING,"PAEE_OBS02"}

oDCOBS03 := SingleLineEdit{self,ResourceID{JPAEE_OBS03,_GetInst()}}
oDCOBS03:FieldSpec := padrao_char_200{}
oDCOBS03:HyperLabel := HyperLabel{#OBS03,"Obs03:",NULL_STRING,"PAEE_OBS03"}

oDCSC_DATA := FixedText{self,ResourceID{JPAEE_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_PAEE := FixedText{self,ResourceID{JPAEE_SC_PAEE,_GetInst()}}
oDCSC_PAEE:HyperLabel := HyperLabel{#SC_PAEE,"Paee:",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{JPAEE_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JPAEE_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_OBS01 := FixedText{self,ResourceID{JPAEE_SC_OBS01,_GetInst()}}
oDCSC_OBS01:HyperLabel := HyperLabel{#SC_OBS01,"Obs:",NULL_STRING,NULL_STRING}

oDCPAEE := SingleLineEdit{self,ResourceID{JPAEE_PAEE,_GetInst()}}
oDCPAEE:FieldSpec := padrao_num_08{}
oDCPAEE:HyperLabel := HyperLabel{#PAEE,"Paee:",NULL_STRING,"PAEE_PAEE"}
oDCPAEE:BackGround := aBrushes[1]
oDCPAEE:Font(aFonts[1], FALSE)

oCCescfor := PushButton{self,ResourceID{JPAEE_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JPAEE_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JPAEE_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JPAEE_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oCCporov := PushButton{self,ResourceID{JPAEE_POROV,_GetInst()}}
oCCporov:Image := ICO_AZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Organizar por Numero GC"

oCCbuscanum := PushButton{self,ResourceID{JPAEE_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Localizar um GC"

self:Caption := "Plano de Auditoria de Embarque - Ocorrencia Externas"
self:HyperLabel := HyperLabel{#JPAEE,"Plano de Auditoria de Embarque - Ocorrencia Externas",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBPAEE := DataColumn{padrao_num_08{}}
oDBPAEE:Width := 12
oDBPAEE:HyperLabel := oDCPAEE:HyperLabel 
oDBPAEE:Caption := "Paee:"
oDBPAEE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBPAEE)

oDBDATA := DataColumn{date_field{}}
oDBDATA:Width := 11
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)

oDBCLIENTE := DataColumn{padrao_num_08{}}
oDBCLIENTE:Width := 12
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
self:Browser:AddColumn(oDBCLIENTE)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 20
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access OBS01() 
return self:FieldGet(#OBS01)


assign OBS01(uValue) 
self:FieldPut(#OBS01, uValue)
return OBS01 := uValue


access OBS02() 
return self:FieldGet(#OBS02)


assign OBS02(uValue) 
self:FieldPut(#OBS02, uValue)
return OBS02 := uValue


access OBS03() 
return self:FieldGet(#OBS03)


assign OBS03(uValue) 
self:FieldPut(#OBS03, uValue)
return OBS03 := uValue


access PAEE() 
return self:FieldGet(#PAEE)


assign PAEE(uValue) 
self:FieldPut(#PAEE, uValue)
return PAEE := uValue


END CLASS
