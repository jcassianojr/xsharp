#region DEFINES
STATIC DEFINE JMPP_CODIGO := 104 
STATIC DEFINE JMPP_CURSO := 106 
STATIC DEFINE JMPP_OBRIGATORIO := 101 
STATIC DEFINE JMPP_RECOMENDADO := 102 
STATIC DEFINE JMPP_SC_CODIGO := 103 
STATIC DEFINE JMPP_SC_CURSO := 105 
STATIC DEFINE JMPP_TIPO := 100 
#endregion

class JMPP inherit DATAWINDOW 

	PROTECT oDBCURSO as DataColumn
	PROTECT oDBTIPO as DataColumn
	protect oDCTIPO as RADIOBUTTONGROUP
	protect oCCObrigatorio as RADIOBUTTON
	protect oCCRecomendado as RADIOBUTTON
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_CURSO as FIXEDTEXT
	protect oDCCURSO as SINGLELINEEDIT
// 	instance TIPO 
// 	instance CODIGO 
// 	instance CURSO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CURSO() 
return self:FieldGet(#CURSO)


assign CURSO(uValue) 
self:FieldPut(#CURSO, uValue)
return CURSO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMPP",_GetInst()},iCtlID)

oCCObrigatorio := RadioButton{self,ResourceID{JMPP_OBRIGATORIO,_GetInst()}}
oCCObrigatorio:HyperLabel := HyperLabel{#Obrigatorio,"Obrigatorio",NULL_STRING,NULL_STRING}

oCCRecomendado := RadioButton{self,ResourceID{JMPP_RECOMENDADO,_GetInst()}}
oCCRecomendado:HyperLabel := HyperLabel{#Recomendado,"Recomendado",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JMPP_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JMPP_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_12{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MP02P_CODIGO"}

oDCSC_CURSO := FixedText{self,ResourceID{JMPP_SC_CURSO,_GetInst()}}
oDCSC_CURSO:HyperLabel := HyperLabel{#SC_CURSO,"Procedimento",NULL_STRING,NULL_STRING}

oDCCURSO := SingleLineEdit{self,ResourceID{JMPP_CURSO,_GetInst()}}
oDCCURSO:FieldSpec := padrao_char_20{}
oDCCURSO:HyperLabel := HyperLabel{#CURSO,"Procedimento",NULL_STRING,"MP02P_CURSO"}

oDCTIPO := RadioButtonGroup{self,ResourceID{JMPP_TIPO,_GetInst()}}
oDCTIPO:FillUsing({ ;
					{oCCObrigatorio,"O"}, ;
					{oCCRecomendado,"R"} ;
					})
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"TIPO",NULL_STRING,NULL_STRING}
oDCTIPO:FieldSpec := padrao_char_01{}

self:Caption := "Procedimentos"
self:HyperLabel := HyperLabel{#JMPP,"Procedimentos",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCURSO := DataColumn{padrao_char_20{}}
oDBCURSO:Width := 20
oDBCURSO:HyperLabel := oDCCURSO:HyperLabel 
oDBCURSO:Caption := "Procedimento"
self:Browser:AddColumn(oDBCURSO)

oDBTIPO := DataColumn{padrao_char_01{}}
oDBTIPO:Width := 7
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "TIPO"
self:Browser:AddColumn(oDBTIPO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


END CLASS
