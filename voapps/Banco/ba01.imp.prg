#region DEFINES
STATIC DEFINE JIMP_ANO := 112 
STATIC DEFINE JIMP_ATUAL := 100 
STATIC DEFINE JIMP_CHAVE := 117 
STATIC DEFINE JIMP_CMDIMP := 101 
STATIC DEFINE JIMP_CMDIMP1 := 104 
STATIC DEFINE JIMP_CMDMAIS := 114 
STATIC DEFINE JIMP_CMDMAIS2 := 110 
STATIC DEFINE JIMP_CMDMAIS3 := 106 
STATIC DEFINE JIMP_CMDMENOS := 113 
STATIC DEFINE JIMP_CMDMENOS2 := 109 
STATIC DEFINE JIMP_CMDMENOS3 := 105 
STATIC DEFINE JIMP_CMDSAIDA := 102 
STATIC DEFINE JIMP_DFIM := 119 
STATIC DEFINE JIMP_DINI := 120 
STATIC DEFINE JIMP_EMPRESA := 107 
STATIC DEFINE JIMP_FIXEDTEXT1 := 116 
STATIC DEFINE JIMP_FIXEDTEXT2 := 111 
STATIC DEFINE JIMP_FIXEDTEXT3 := 103 
STATIC DEFINE JIMP_FIXEDTEXT4 := 108 
STATIC DEFINE JIMP_MES := 115 
STATIC DEFINE JIMP_PER := 121 
STATIC DEFINE JIMP_PROGBAR := 118 
STATIC DEFINE JIMP_PUSHBUTTON9 := 122 
#endregion

class JIMP inherit DATADIALOG 

	protect oDCAtual as CHECKBOX
	protect oCCcmdimp as PUSHBUTTON
	protect oCCcmdSaida as PUSHBUTTON
	protect oDCFixedText3 as FIXEDTEXT
	protect oCCcmdimp1 as PUSHBUTTON
	protect oCCcmdmenos3 as PUSHBUTTON
	protect oCCcmdmais3 as PUSHBUTTON
	protect oDCempresa as SINGLELINEEDIT
	protect oDCFixedText4 as FIXEDTEXT
	protect oCCcmdmenos2 as PUSHBUTTON
	protect oCCcmdmais2 as PUSHBUTTON
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCano as SINGLELINEEDIT
	protect oCCcmdmenos as PUSHBUTTON
	protect oCCcmdmais as PUSHBUTTON
	protect oDCmes as SINGLELINEEDIT
	protect oDCFixedText1 as FIXEDTEXT
	protect oDCchave as FIXEDTEXT
	protect oDCProgBar as PROGRESSBAR
	protect oDCDFIM as DATESLE
	protect oDCDINI as DATESLE
	protect oDCper as FIXEDTEXT
	protect oCCPushButton9 as PUSHBUTTON
// 	instance Atual 
// 	instance empresa 
// 	instance ano 
// 	instance mes 
// 	instance DFIM 
// 	instance DINI 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ano() 
return self:FieldGet(#ano)


assign ano(uValue) 
self:FieldPut(#ano, uValue)
return ano := uValue


access Atual() 
return self:FieldGet(#Atual)


assign Atual(uValue) 
self:FieldPut(#Atual, uValue)
return Atual := uValue


access DFIM() 
return self:FieldGet(#DFIM)


assign DFIM(uValue) 
self:FieldPut(#DFIM, uValue)
return DFIM := uValue


access DINI() 
return self:FieldGet(#DINI)


assign DINI(uValue) 
self:FieldPut(#DINI, uValue)
return DINI := uValue


access empresa() 
return self:FieldGet(#empresa)


assign empresa(uValue) 
self:FieldPut(#empresa, uValue)
return empresa := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JIMP",_GetInst()},iCtlID)

oDCAtual := CheckBox{self,ResourceID{JIMP_ATUAL,_GetInst()}}
oDCAtual:HyperLabel := HyperLabel{#Atual,"Competencia Atual",NULL_STRING,NULL_STRING}

oCCcmdimp := PushButton{self,ResourceID{JIMP_CMDIMP,_GetInst()}}
oCCcmdimp:HyperLabel := HyperLabel{#cmdimp,"Iniciar Importação",NULL_STRING,NULL_STRING}

oCCcmdSaida := PushButton{self,ResourceID{JIMP_CMDSAIDA,_GetInst()}}
oCCcmdSaida:HyperLabel := HyperLabel{#cmdSaida,NULL_STRING,NULL_STRING,NULL_STRING}
oCCcmdSaida:Image := ICO_SAIR{}

oDCFixedText3 := FixedText{self,ResourceID{JIMP_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Retornar",NULL_STRING,NULL_STRING}

oCCcmdimp1 := PushButton{self,ResourceID{JIMP_CMDIMP1,_GetInst()}}
oCCcmdimp1:HyperLabel := HyperLabel{#cmdimp1,"Apagar Importacao",NULL_STRING,NULL_STRING}

oCCcmdmenos3 := PushButton{self,ResourceID{JIMP_CMDMENOS3,_GetInst()}}
oCCcmdmenos3:HyperLabel := HyperLabel{#cmdmenos3,"-",NULL_STRING,NULL_STRING}

oCCcmdmais3 := PushButton{self,ResourceID{JIMP_CMDMAIS3,_GetInst()}}
oCCcmdmais3:HyperLabel := HyperLabel{#cmdmais3,"+",NULL_STRING,NULL_STRING}

oDCempresa := SingleLineEdit{self,ResourceID{JIMP_EMPRESA,_GetInst()}}
oDCempresa:HyperLabel := HyperLabel{#empresa,NULL_STRING,NULL_STRING,NULL_STRING}
oDCempresa:TooltipText := "Ano Inicial"
oDCempresa:FieldSpec := PADRAO_num_04{}

oDCFixedText4 := FixedText{self,ResourceID{JIMP_FIXEDTEXT4,_GetInst()}}
oDCFixedText4:HyperLabel := HyperLabel{#FixedText4,"Empresa",NULL_STRING,NULL_STRING}

oCCcmdmenos2 := PushButton{self,ResourceID{JIMP_CMDMENOS2,_GetInst()}}
oCCcmdmenos2:HyperLabel := HyperLabel{#cmdmenos2,"-",NULL_STRING,NULL_STRING}

oCCcmdmais2 := PushButton{self,ResourceID{JIMP_CMDMAIS2,_GetInst()}}
oCCcmdmais2:HyperLabel := HyperLabel{#cmdmais2,"+",NULL_STRING,NULL_STRING}

oDCFixedText2 := FixedText{self,ResourceID{JIMP_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Ano",NULL_STRING,NULL_STRING}

oDCano := SingleLineEdit{self,ResourceID{JIMP_ANO,_GetInst()}}
oDCano:HyperLabel := HyperLabel{#ano,NULL_STRING,NULL_STRING,NULL_STRING}
oDCano:TooltipText := "Ano Inicial"
oDCano:FieldSpec := PADRAO_num_04{}

oCCcmdmenos := PushButton{self,ResourceID{JIMP_CMDMENOS,_GetInst()}}
oCCcmdmenos:HyperLabel := HyperLabel{#cmdmenos,"-",NULL_STRING,NULL_STRING}

oCCcmdmais := PushButton{self,ResourceID{JIMP_CMDMAIS,_GetInst()}}
oCCcmdmais:HyperLabel := HyperLabel{#cmdmais,"+",NULL_STRING,NULL_STRING}

oDCmes := SingleLineEdit{self,ResourceID{JIMP_MES,_GetInst()}}
oDCmes:HyperLabel := HyperLabel{#mes,"1",NULL_STRING,NULL_STRING}
oDCmes:TooltipText := "Mes Inicial"
oDCmes:FieldSpec := PADRAO_num_02{}

oDCFixedText1 := FixedText{self,ResourceID{JIMP_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Mes",NULL_STRING,NULL_STRING}

oDCchave := FixedText{self,ResourceID{JIMP_CHAVE,_GetInst()}}
oDCchave:HyperLabel := HyperLabel{#chave,NULL_STRING,NULL_STRING,NULL_STRING}

oDCProgBar := ProgressBar{self,ResourceID{JIMP_PROGBAR,_GetInst()}}
oDCProgBar:Range := Range{0,100}
oDCProgBar:HyperLabel := HyperLabel{#ProgBar,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDFIM := DateSle{self,ResourceID{JIMP_DFIM,_GetInst()}}
oDCDFIM:FieldSpec := DATE_FIELD{}
oDCDFIM:HyperLabel := HyperLabel{#DFIM,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDINI := DateSle{self,ResourceID{JIMP_DINI,_GetInst()}}
oDCDINI:FieldSpec := DATE_FIELD{}
oDCDINI:HyperLabel := HyperLabel{#DINI,NULL_STRING,NULL_STRING,NULL_STRING}

oDCper := FixedText{self,ResourceID{JIMP_PER,_GetInst()}}
oDCper:HyperLabel := HyperLabel{#per,"Periodo",NULL_STRING,NULL_STRING}

oCCPushButton9 := PushButton{self,ResourceID{JIMP_PUSHBUTTON9,_GetInst()}}
oCCPushButton9:HyperLabel := HyperLabel{#PushButton9,"Importar Integrado",NULL_STRING,NULL_STRING}

self:Caption := "Importar Contas Pagas"
self:HyperLabel := HyperLabel{#JIMP,"Importar Contas Pagas",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access mes() 
return self:FieldGet(#mes)


assign mes(uValue) 
self:FieldPut(#mes, uValue)
return mes := uValue


END CLASS
