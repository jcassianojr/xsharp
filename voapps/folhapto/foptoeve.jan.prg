#region DEFINES
STATIC DEFINE JPTOEVE_BCOSN := 111 
STATIC DEFINE JPTOEVE_BUSCANUM := 125 
STATIC DEFINE JPTOEVE_CMDBCO := 116 
STATIC DEFINE JPTOEVE_CMDDMAI := 122 
STATIC DEFINE JPTOEVE_CMDDMEN := 121 
STATIC DEFINE JPTOEVE_CMDFOL := 118 
STATIC DEFINE JPTOEVE_CMDMAIS := 120 
STATIC DEFINE JPTOEVE_CMDMENOS := 119 
STATIC DEFINE JPTOEVE_CMDORDENAR := 124 
STATIC DEFINE JPTOEVE_CMDRED := 117 
STATIC DEFINE JPTOEVE_CODIGO := 109 
STATIC DEFINE JPTOEVE_DESCRICAO := 110 
STATIC DEFINE JPTOEVE_DIA := 107 
STATIC DEFINE JPTOEVE_ESCCOD := 123 
STATIC DEFINE JPTOEVE_FIXEDTEXT7 := 114 
STATIC DEFINE JPTOEVE_FIXEDTEXT8 := 115 
STATIC DEFINE JPTOEVE_FOLSN := 113 
STATIC DEFINE JPTOEVE_MES := 108 
STATIC DEFINE JPTOEVE_REDSN := 112 
STATIC DEFINE JPTOEVE_SC_BCOSN := 104 
STATIC DEFINE JPTOEVE_SC_CODIGO := 102 
STATIC DEFINE JPTOEVE_SC_DESCRICAO := 103 
STATIC DEFINE JPTOEVE_SC_DIA := 100 
STATIC DEFINE JPTOEVE_SC_FOLSN := 106 
STATIC DEFINE JPTOEVE_SC_MES := 101 
STATIC DEFINE JPTOEVE_SC_REDSN := 105 
#endregion

PARTIAL class JPtoEve inherit MYDataWindow 

	PROTECT oDBMES as DataColumn
	PROTECT oDBDIA as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDESCRICAO as DataColumn
	PROTECT oDBBCOSN as DataColumn
	PROTECT oDBFOLSN as DataColumn
	PROTECT oDBREDSN as DataColumn
	protect oDCSC_DIA as FIXEDTEXT
	protect oDCSC_MES as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_DESCRICAO as FIXEDTEXT
	protect oDCSC_BCOSN as FIXEDTEXT
	protect oDCSC_REDSN as FIXEDTEXT
	protect oDCSC_FOLSN as FIXEDTEXT
	protect oDCDIA as RIGHTSLE
	protect oDCMES as RIGHTSLE
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCDESCRICAO as SINGLELINEEDIT
	protect oDCBCOSN as SINGLELINEEDIT
	protect oDCREDSN as SINGLELINEEDIT
	protect oDCFOLSN as SINGLELINEEDIT
	protect oDCFixedText7 as FIXEDTEXT
	protect oDCFixedText8 as FIXEDTEXT
	protect oCCcmdbco as PUSHBUTTON
	protect oCCcmdred as PUSHBUTTON
	protect oCCcmdfol as PUSHBUTTON
	protect oCCcmdmenos as PUSHBUTTON
	protect oCCcmdmais as PUSHBUTTON
	protect oCCcmddmen as PUSHBUTTON
	protect oCCcmddmai as PUSHBUTTON
	protect oCCESCCOD as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
// 	instance DIA 
// 	instance MES 
// 	instance CODIGO 
// 	instance DESCRICAO 
// 	instance BCOSN 
// 	instance REDSN 
// 	instance FOLSN 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access BCOSN() 
return self:FieldGet(#BCOSN)


assign BCOSN(uValue) 
self:FieldPut(#BCOSN, uValue)
return BCOSN := uValue


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


access DIA() 
return self:FieldGet(#DIA)


assign DIA(uValue) 
self:FieldPut(#DIA, uValue)
return DIA := uValue


access FOLSN() 
return self:FieldGet(#FOLSN)


assign FOLSN(uValue) 
self:FieldPut(#FOLSN, uValue)
return FOLSN := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPtoEve",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_DIA := FixedText{self,ResourceID{JPTOEVE_SC_DIA,_GetInst()}}
oDCSC_DIA:HyperLabel := HyperLabel{#SC_DIA,"Dia:",NULL_STRING,NULL_STRING}

oDCSC_MES := FixedText{self,ResourceID{JPTOEVE_SC_MES,_GetInst()}}
oDCSC_MES:HyperLabel := HyperLabel{#SC_MES,"Mes:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JPTOEVE_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_DESCRICAO := FixedText{self,ResourceID{JPTOEVE_SC_DESCRICAO,_GetInst()}}
oDCSC_DESCRICAO:HyperLabel := HyperLabel{#SC_DESCRICAO,"Descricao:",NULL_STRING,NULL_STRING}

oDCSC_BCOSN := FixedText{self,ResourceID{JPTOEVE_SC_BCOSN,_GetInst()}}
oDCSC_BCOSN:HyperLabel := HyperLabel{#SC_BCOSN,"Banco Horas ",NULL_STRING,NULL_STRING}

oDCSC_REDSN := FixedText{self,ResourceID{JPTOEVE_SC_REDSN,_GetInst()}}
oDCSC_REDSN:HyperLabel := HyperLabel{#SC_REDSN,"Reduçao Jornada ",NULL_STRING,NULL_STRING}

oDCSC_FOLSN := FixedText{self,ResourceID{JPTOEVE_SC_FOLSN,_GetInst()}}
oDCSC_FOLSN:HyperLabel := HyperLabel{#SC_FOLSN,"Folga ",NULL_STRING,NULL_STRING}

oDCDIA := rightSle{self,ResourceID{JPTOEVE_DIA,_GetInst()}}
oDCDIA:FieldSpec := PADRAO_NUM_02{}
oDCDIA:HyperLabel := HyperLabel{#DIA,"Dia:",NULL_STRING,"FOPTOEVE_DIA"}
oDCDIA:TooltipText := "Dia do Mes ou Semana"

oDCMES := rightSle{self,ResourceID{JPTOEVE_MES,_GetInst()}}
oDCMES:FieldSpec := PADRAO_NUM_02{}
oDCMES:HyperLabel := HyperLabel{#MES,"Mes:",NULL_STRING,"FOPTOEVE_MES"}
oDCMES:TooltipText := "Mes"

oDCCODIGO := SingleLineEdit{self,ResourceID{JPTOEVE_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_02{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"FOPTOEVE_CODIGO"}
oDCCODIGO:TooltipText := "Codigo"
oDCCODIGO:BackGround := aBrushes[1]

oDCDESCRICAO := SingleLineEdit{self,ResourceID{JPTOEVE_DESCRICAO,_GetInst()}}
oDCDESCRICAO:FieldSpec := PADRAO_CHAR_40{}
oDCDESCRICAO:HyperLabel := HyperLabel{#DESCRICAO,"Descricao:",NULL_STRING,"FOPTOEVE_DESCRICAO"}
oDCDESCRICAO:TooltipText := "Descriçao do Evento"

oDCBCOSN := SingleLineEdit{self,ResourceID{JPTOEVE_BCOSN,_GetInst()}}
oDCBCOSN:FieldSpec := PADRAO_CHAR_01{}
oDCBCOSN:HyperLabel := HyperLabel{#BCOSN,"Bcosn:",NULL_STRING,"FOPTOEVE_BCOSN"}
oDCBCOSN:TooltipText := "Banco Horas Sim/Nao"
oDCBCOSN:BackGround := aBrushes[1]

oDCREDSN := SingleLineEdit{self,ResourceID{JPTOEVE_REDSN,_GetInst()}}
oDCREDSN:FieldSpec := PADRAO_CHAR_01{}
oDCREDSN:HyperLabel := HyperLabel{#REDSN,"Redsn:",NULL_STRING,"FOPTOEVE_REDSN"}
oDCREDSN:TooltipText := "Reduçao de Jornada Sim/Nao"
oDCREDSN:BackGround := aBrushes[1]

oDCFOLSN := SingleLineEdit{self,ResourceID{JPTOEVE_FOLSN,_GetInst()}}
oDCFOLSN:FieldSpec := PADRAO_CHAR_01{}
oDCFOLSN:HyperLabel := HyperLabel{#FOLSN,"Folsn:",NULL_STRING,"FOPTOEVE_FOLSN"}
oDCFOLSN:TooltipText := "Folga (S)im (N)ao"
oDCFOLSN:BackGround := aBrushes[1]

oDCFixedText7 := FixedText{self,ResourceID{JPTOEVE_FIXEDTEXT7,_GetInst()}}
oDCFixedText7:HyperLabel := HyperLabel{#FixedText7,"1 - Domingo  2 - Segunda 3 - Terça 4 - Quarta 5 - Quinta 6 - Sexta  7 - Sabado ",NULL_STRING,NULL_STRING}

oDCFixedText8 := FixedText{self,ResourceID{JPTOEVE_FIXEDTEXT8,_GetInst()}}
oDCFixedText8:HyperLabel := HyperLabel{#FixedText8,"Para Dias da Semana Deixe o Mes com 0(Zero) e o Dia com valores abaixo",NULL_STRING,NULL_STRING}

oCCcmdbco := PushButton{self,ResourceID{JPTOEVE_CMDBCO,_GetInst()}}
oCCcmdbco:HyperLabel := HyperLabel{#cmdbco,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdred := PushButton{self,ResourceID{JPTOEVE_CMDRED,_GetInst()}}
oCCcmdred:HyperLabel := HyperLabel{#cmdred,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdfol := PushButton{self,ResourceID{JPTOEVE_CMDFOL,_GetInst()}}
oCCcmdfol:HyperLabel := HyperLabel{#cmdfol,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdmenos := PushButton{self,ResourceID{JPTOEVE_CMDMENOS,_GetInst()}}
oCCcmdmenos:HyperLabel := HyperLabel{#cmdmenos,"-",NULL_STRING,NULL_STRING}

oCCcmdmais := PushButton{self,ResourceID{JPTOEVE_CMDMAIS,_GetInst()}}
oCCcmdmais:HyperLabel := HyperLabel{#cmdmais,"+",NULL_STRING,NULL_STRING}

oCCcmddmen := PushButton{self,ResourceID{JPTOEVE_CMDDMEN,_GetInst()}}
oCCcmddmen:HyperLabel := HyperLabel{#cmddmen,"-",NULL_STRING,NULL_STRING}

oCCcmddmai := PushButton{self,ResourceID{JPTOEVE_CMDDMAI,_GetInst()}}
oCCcmddmai:HyperLabel := HyperLabel{#cmddmai,"+",NULL_STRING,NULL_STRING}

oCCESCCOD := PushButton{self,ResourceID{JPTOEVE_ESCCOD,_GetInst()}}
oCCESCCOD:HyperLabel := HyperLabel{#ESCCOD,"...",NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JPTOEVE_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JPTOEVE_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

self:Caption := "Eventos/Feriados"
self:HyperLabel := HyperLabel{#JPtoEve,"Eventos/Feriados",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBMES := DataColumn{PADRAO_NUM_02{}}
oDBMES:Width := 5
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "Mes:"
self:Browser:AddColumn(oDBMES)

oDBDIA := DataColumn{PADRAO_NUM_02{}}
oDBDIA:Width := 5
oDBDIA:HyperLabel := oDCDIA:HyperLabel 
oDBDIA:Caption := "Dia:"
self:Browser:AddColumn(oDBDIA)

oDBCODIGO := DataColumn{PADRAO_CHAR_02{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBDESCRICAO := DataColumn{PADRAO_CHAR_40{}}
oDBDESCRICAO:Width := 11
oDBDESCRICAO:HyperLabel := oDCDESCRICAO:HyperLabel 
oDBDESCRICAO:Caption := "Descricao:"
self:Browser:AddColumn(oDBDESCRICAO)

oDBBCOSN := DataColumn{PADRAO_CHAR_01{}}
oDBBCOSN:Width := 7
oDBBCOSN:HyperLabel := oDCBCOSN:HyperLabel 
oDBBCOSN:Caption := "Bcosn:"
oDBBCOSN:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBBCOSN)

oDBFOLSN := DataColumn{PADRAO_CHAR_01{}}
oDBFOLSN:Width := 7
oDBFOLSN:HyperLabel := oDCFOLSN:HyperLabel 
oDBFOLSN:Caption := "Folsn:"
oDBFOLSN:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBFOLSN)

oDBREDSN := DataColumn{PADRAO_CHAR_01{}}
oDBREDSN:Width := 7
oDBREDSN:HyperLabel := oDCREDSN:HyperLabel 
oDBREDSN:Caption := "Redsn:"
oDBREDSN:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBREDSN)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MES() 
return self:FieldGet(#MES)


assign MES(uValue) 
self:FieldPut(#MES, uValue)
return MES := uValue


access REDSN() 
return self:FieldGet(#REDSN)


assign REDSN(uValue) 
self:FieldPut(#REDSN, uValue)
return REDSN := uValue


END CLASS
