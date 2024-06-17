#region DEFINES
STATIC DEFINE JFO_DIO_BUSCANUM := 106 
STATIC DEFINE JFO_DIO_CMDORDENAR := 107 
STATIC DEFINE JFO_DIO_DATA := 104 
STATIC DEFINE JFO_DIO_HORA := 105 
STATIC DEFINE JFO_DIO_NUMERO := 103 
STATIC DEFINE JFO_DIO_RELOGIO := 108 
STATIC DEFINE JFO_DIO_SC_DATA := 101 
STATIC DEFINE JFO_DIO_SC_HORA := 102 
STATIC DEFINE JFO_DIO_SC_HORA1 := 109 
STATIC DEFINE JFO_DIO_SC_NUMERO := 100 
#endregion

PARTIAL class jfo_dio inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBHORA as DataColumn
	PROTECT oDBRELOGIO as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_HORA as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCDATA as SINGLELINEEDIT
	protect oDCHORA as SINGLELINEEDIT
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
	protect oDCRELOGIO as SINGLELINEEDIT
	protect oDCSC_HORA1 as FIXEDTEXT
// 	instance NUMERO 
// 	instance DATA 
// 	instance HORA 
// 	instance RELOGIO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access HORA() 
return self:FieldGet(#HORA)


assign HORA(uValue) 
self:FieldPut(#HORA, uValue)
return HORA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jfo_dio",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_NUMERO := FixedText{self,ResourceID{JFO_DIO_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JFO_DIO_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_HORA := FixedText{self,ResourceID{JFO_DIO_SC_HORA,_GetInst()}}
oDCSC_HORA:HyperLabel := HyperLabel{#SC_HORA,"Hora:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JFO_DIO_NUMERO,_GetInst()}}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"FO_DIO_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]

oDCDATA := SingleLineEdit{self,ResourceID{JFO_DIO_DATA,_GetInst()}}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"FO_DIO_DATA"}
oDCDATA:BackGround := aBrushes[1]

oDCHORA := SingleLineEdit{self,ResourceID{JFO_DIO_HORA,_GetInst()}}
oDCHORA:HyperLabel := HyperLabel{#HORA,"Hora:",NULL_STRING,"FO_DIO_HORA"}
oDCHORA:BackGround := aBrushes[1]

oCCbuscaNUM := PushButton{self,ResourceID{JFO_DIO_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCcmdordenar := PushButton{self,ResourceID{JFO_DIO_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oDCRELOGIO := SingleLineEdit{self,ResourceID{JFO_DIO_RELOGIO,_GetInst()}}
oDCRELOGIO:HyperLabel := HyperLabel{#RELOGIO,"Relogio",NULL_STRING,"FO_DIO_HORA"}
oDCRELOGIO:BackGround := aBrushes[1]

oDCSC_HORA1 := FixedText{self,ResourceID{JFO_DIO_SC_HORA1,_GetInst()}}
oDCSC_HORA1:HyperLabel := HyperLabel{#SC_HORA1,"Relogio",NULL_STRING,NULL_STRING}

self:Caption := "Arquivo MIgrado"
self:HyperLabel := HyperLabel{#jfo_dio,"Arquivo MIgrado",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{12}
oDBNUMERO:Width := 12
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBDATA := DataColumn{13}
oDBDATA:Width := 13
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
oDBDATA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDATA)

oDBHORA := DataColumn{18}
oDBHORA:Width := 18
oDBHORA:HyperLabel := oDCHORA:HyperLabel 
oDBHORA:Caption := "Hora:"
oDBHORA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBHORA)

oDBRELOGIO := DataColumn{8}
oDBRELOGIO:Width := 8
oDBRELOGIO:HyperLabel := oDCRELOGIO:HyperLabel 
oDBRELOGIO:Caption := "Relogio"
oDBRELOGIO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRELOGIO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access RELOGIO() 
return self:FieldGet(#RELOGIO)


assign RELOGIO(uValue) 
self:FieldPut(#RELOGIO, uValue)
return RELOGIO := uValue


END CLASS
