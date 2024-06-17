#region DEFINES
STATIC DEFINE JBCOREQ_BUSCANUM := 117 
STATIC DEFINE JBCOREQ_CMDORDENAR := 116 
STATIC DEFINE JBCOREQ_CMDTIPO := 114 
STATIC DEFINE JBCOREQ_DATA := 113 
STATIC DEFINE JBCOREQ_DIAS := 111 
STATIC DEFINE JBCOREQ_ESCFUN := 115 
STATIC DEFINE JBCOREQ_HORAS := 110 
STATIC DEFINE JBCOREQ_NUMERO := 108 
STATIC DEFINE JBCOREQ_OBS := 112 
STATIC DEFINE JBCOREQ_REQUISI := 107 
STATIC DEFINE JBCOREQ_SC_DATA := 102 
STATIC DEFINE JBCOREQ_SC_DIAS := 105 
STATIC DEFINE JBCOREQ_SC_HORAS := 104 
STATIC DEFINE JBCOREQ_SC_NUMERO := 101 
STATIC DEFINE JBCOREQ_SC_OBS := 106 
STATIC DEFINE JBCOREQ_SC_REQUISI := 100 
STATIC DEFINE JBCOREQ_SC_TIPO := 103 
STATIC DEFINE JBCOREQ_TIPO := 109 
#endregion

PARTIAL class JBCOREQ inherit MYDataWindow 

	PROTECT oDBREQUISI as DataColumn
	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBTIPO as DataColumn
	PROTECT oDBHORAS as DataColumn
	PROTECT oDBDIAS as DataColumn
	PROTECT oDBOBS as DataColumn
	protect oDCSC_REQUISI as FIXEDTEXT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_TIPO as FIXEDTEXT
	protect oDCSC_HORAS as FIXEDTEXT
	protect oDCSC_DIAS as FIXEDTEXT
	protect oDCSC_OBS as FIXEDTEXT
	protect oDCREQUISI as SINGLELINEEDIT
	protect oDCNUMERO as RIGHTSLE
	protect oDCTIPO as SINGLELINEEDIT
	protect oDCHORAS as RIGHTSLE
	protect oDCDIAS as RIGHTSLE
	protect oDCOBS as SINGLELINEEDIT
	protect oDCDATA as DATETIMEPICKER
	protect oCCcmdtipo as PUSHBUTTON
	protect oCCescfun as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
// 	instance REQUISI 
// 	instance NUMERO 
// 	instance TIPO 
// 	instance HORAS 
// 	instance DIAS 
// 	instance OBS 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DIAS() 
return self:FieldGet(#DIAS)


assign DIAS(uValue) 
self:FieldPut(#DIAS, uValue)
return DIAS := uValue


access HORAS() 
return self:FieldGet(#HORAS)


assign HORAS(uValue) 
self:FieldPut(#HORAS, uValue)
return HORAS := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JBCOREQ",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_REQUISI := FixedText{self,ResourceID{JBCOREQ_SC_REQUISI,_GetInst()}}
oDCSC_REQUISI:HyperLabel := HyperLabel{#SC_REQUISI,"Requisiçao",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JBCOREQ_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JBCOREQ_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_TIPO := FixedText{self,ResourceID{JBCOREQ_SC_TIPO,_GetInst()}}
oDCSC_TIPO:HyperLabel := HyperLabel{#SC_TIPO,"Tipo:",NULL_STRING,NULL_STRING}

oDCSC_HORAS := FixedText{self,ResourceID{JBCOREQ_SC_HORAS,_GetInst()}}
oDCSC_HORAS:HyperLabel := HyperLabel{#SC_HORAS,"Horas:",NULL_STRING,NULL_STRING}

oDCSC_DIAS := FixedText{self,ResourceID{JBCOREQ_SC_DIAS,_GetInst()}}
oDCSC_DIAS:HyperLabel := HyperLabel{#SC_DIAS,"Dias:",NULL_STRING,NULL_STRING}

oDCSC_OBS := FixedText{self,ResourceID{JBCOREQ_SC_OBS,_GetInst()}}
oDCSC_OBS:HyperLabel := HyperLabel{#SC_OBS,"Obs/Motivo:",NULL_STRING,NULL_STRING}

oDCREQUISI := SingleLineEdit{self,ResourceID{JBCOREQ_REQUISI,_GetInst()}}
oDCREQUISI:FieldSpec := PADRAO_NUM_08{}
oDCREQUISI:HyperLabel := HyperLabel{#REQUISI,"Requisi:",NULL_STRING,"BCOREQ_REQUISI"}
oDCREQUISI:BackGround := aBrushes[1]

oDCNUMERO := rightSle{self,ResourceID{JBCOREQ_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"BCOREQ_NUMERO"}

oDCTIPO := SingleLineEdit{self,ResourceID{JBCOREQ_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := PADRAO_CHAR_01{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo:",NULL_STRING,"BCOREQ_TIPO"}
oDCTIPO:BackGround := aBrushes[1]
oDCTIPO:Font(aFonts[1], FALSE)

oDCHORAS := rightSle{self,ResourceID{JBCOREQ_HORAS,_GetInst()}}
oDCHORAS:FieldSpec := PADRAO_NUM_06_2{}
oDCHORAS:HyperLabel := HyperLabel{#HORAS,"Horas:",NULL_STRING,"BCOREQ_HORAS"}

oDCDIAS := rightSle{self,ResourceID{JBCOREQ_DIAS,_GetInst()}}
oDCDIAS:FieldSpec := PADRAO_NUM_06_2{}
oDCDIAS:HyperLabel := HyperLabel{#DIAS,"Dias:",NULL_STRING,"BCOREQ_DIAS"}

oDCOBS := SingleLineEdit{self,ResourceID{JBCOREQ_OBS,_GetInst()}}
oDCOBS:FieldSpec := PADRAO_CHAR_60{}
oDCOBS:HyperLabel := HyperLabel{#OBS,"Obs:",NULL_STRING,"BCOREQ_OBS"}

oDCDATA := DateTimePicker{self,ResourceID{JBCOREQ_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,NULL_STRING,NULL_STRING,NULL_STRING}

oCCcmdtipo := PushButton{self,ResourceID{JBCOREQ_CMDTIPO,_GetInst()}}
oCCcmdtipo:HyperLabel := HyperLabel{#cmdtipo,"Credito Debito",NULL_STRING,NULL_STRING}

oCCescfun := PushButton{self,ResourceID{JBCOREQ_ESCFUN,_GetInst()}}
oCCescfun:HyperLabel := HyperLabel{#escfun,"...",NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JBCOREQ_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JBCOREQ_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Requisiçao Banco de Horas"
self:HyperLabel := HyperLabel{#JBCOREQ,"Requisiçao Banco de Horas",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBREQUISI := DataColumn{PADRAO_NUM_08{}}
oDBREQUISI:Width := 9
oDBREQUISI:HyperLabel := oDCREQUISI:HyperLabel 
oDBREQUISI:Caption := "Requisi:"
oDBREQUISI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBREQUISI)

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 13
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := ""
self:Browser:AddColumn(oDBDATA)

oDBTIPO := DataColumn{PADRAO_CHAR_01{}}
oDBTIPO:Width := 6
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "Tipo:"
oDBTIPO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTIPO)

oDBHORAS := DataColumn{PADRAO_NUM_06_2{}}
oDBHORAS:Width := 7
oDBHORAS:HyperLabel := oDCHORAS:HyperLabel 
oDBHORAS:Caption := "Horas:"
self:Browser:AddColumn(oDBHORAS)

oDBDIAS := DataColumn{PADRAO_NUM_06_2{}}
oDBDIAS:Width := 6
oDBDIAS:HyperLabel := oDCDIAS:HyperLabel 
oDBDIAS:Caption := "Dias:"
self:Browser:AddColumn(oDBDIAS)

oDBOBS := DataColumn{PADRAO_CHAR_60{}}
oDBOBS:Width := 10
oDBOBS:HyperLabel := oDCOBS:HyperLabel 
oDBOBS:Caption := "Obs:"
self:Browser:AddColumn(oDBOBS)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access OBS() 
return self:FieldGet(#OBS)


assign OBS(uValue) 
self:FieldPut(#OBS, uValue)
return OBS := uValue


access REQUISI() 
return self:FieldGet(#REQUISI)


assign REQUISI(uValue) 
self:FieldPut(#REQUISI, uValue)
return REQUISI := uValue


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


END CLASS
