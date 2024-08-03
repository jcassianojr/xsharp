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

PARTIAL CLASS JIMP INHERIT DATADIALOG
PROTECT oDCAtual AS CHECKBOX
PROTECT oCCcmdimp AS PUSHBUTTON
PROTECT oCCcmdSaida AS PUSHBUTTON
PROTECT oDCFixedText3 AS FIXEDTEXT
PROTECT oCCcmdimp1 AS PUSHBUTTON
PROTECT oCCcmdmenos3 AS PUSHBUTTON
PROTECT oCCcmdmais3 AS PUSHBUTTON
PROTECT oDCempresa AS SINGLELINEEDIT
PROTECT oDCFixedText4 AS FIXEDTEXT
PROTECT oCCcmdmenos2 AS PUSHBUTTON
PROTECT oCCcmdmais2 AS PUSHBUTTON
PROTECT oDCFixedText2 AS FIXEDTEXT
PROTECT oDCano AS SINGLELINEEDIT
PROTECT oCCcmdmenos AS PUSHBUTTON
PROTECT oCCcmdmais AS PUSHBUTTON
PROTECT oDCmes AS SINGLELINEEDIT
PROTECT oDCFixedText1 AS FIXEDTEXT
PROTECT oDCchave AS FIXEDTEXT
PROTECT oDCProgBar AS PROGRESSBAR
PROTECT oDCDFIM AS DateSle
PROTECT oDCDINI AS DateSle
PROTECT oDCper AS FIXEDTEXT
PROTECT oCCPushButton9 AS PUSHBUTTON
PROTECT oDCDateTimePicker1 AS DATETIMEPICKER

// User code starts here (DO NOT remove this line)  ##USER##

ACCESS ano
RETURN SELF:FieldGet( #ano )

ASSIGN ano( uValue )
SELF:FieldPut( #ano , uValue )

ACCESS Atual
RETURN SELF:FieldGet( #Atual )

ASSIGN Atual( uValue )
SELF:FieldPut( #Atual , uValue )

ACCESS DFIM
RETURN SELF:FieldGet( #DFIM )

ASSIGN DFIM( uValue )
SELF:FieldPut( #DFIM , uValue )

ACCESS DINI
RETURN SELF:FieldGet( #DINI )

ASSIGN DINI( uValue )
SELF:FieldPut( #DINI , uValue )

ACCESS empresa
RETURN SELF:FieldGet( #empresa )

ASSIGN empresa( uValue )
SELF:FieldPut( #empresa , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"JIMP" , _GetInst()},iCtlID)

	SELF:oDCAtual := CHECKBOX{SELF , ResourceID{ JIMP_ATUAL  , _GetInst() } }
	SELF:oDCAtual:HyperLabel := HyperLabel{#Atual , "Competencia Atual" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdimp := PUSHBUTTON{SELF , ResourceID{ JIMP_CMDIMP  , _GetInst() } }
	SELF:oCCcmdimp:HyperLabel := HyperLabel{#cmdimp , "Iniciar Importação" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdSaida := PUSHBUTTON{SELF , ResourceID{ JIMP_CMDSAIDA  , _GetInst() } }
	SELF:oCCcmdSaida:HyperLabel := HyperLabel{#cmdSaida , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oCCcmdSaida:Image := ICO_SAIR{}

	SELF:oDCFixedText3 := FIXEDTEXT{SELF , ResourceID{ JIMP_FIXEDTEXT3  , _GetInst() } }
	SELF:oDCFixedText3:HyperLabel := HyperLabel{#FixedText3 , "Retornar" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdimp1 := PUSHBUTTON{SELF , ResourceID{ JIMP_CMDIMP1  , _GetInst() } }
	SELF:oCCcmdimp1:HyperLabel := HyperLabel{#cmdimp1 , "Apagar Importacao" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmenos3 := PUSHBUTTON{SELF , ResourceID{ JIMP_CMDMENOS3  , _GetInst() } }
	SELF:oCCcmdmenos3:HyperLabel := HyperLabel{#cmdmenos3 , "-" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmais3 := PUSHBUTTON{SELF , ResourceID{ JIMP_CMDMAIS3  , _GetInst() } }
	SELF:oCCcmdmais3:HyperLabel := HyperLabel{#cmdmais3 , "+" , NULL_STRING , NULL_STRING}

	SELF:oDCempresa := SINGLELINEEDIT{SELF , ResourceID{ JIMP_EMPRESA  , _GetInst() } }
	SELF:oDCempresa:HyperLabel := HyperLabel{#empresa , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCempresa:FieldSpec := PADRAO_num_04{}
	SELF:oDCempresa:TooltipText := "Ano Inicial"

	SELF:oDCFixedText4 := FIXEDTEXT{SELF , ResourceID{ JIMP_FIXEDTEXT4  , _GetInst() } }
	SELF:oDCFixedText4:HyperLabel := HyperLabel{#FixedText4 , "Empresa" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmenos2 := PUSHBUTTON{SELF , ResourceID{ JIMP_CMDMENOS2  , _GetInst() } }
	SELF:oCCcmdmenos2:HyperLabel := HyperLabel{#cmdmenos2 , "-" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmais2 := PUSHBUTTON{SELF , ResourceID{ JIMP_CMDMAIS2  , _GetInst() } }
	SELF:oCCcmdmais2:HyperLabel := HyperLabel{#cmdmais2 , "+" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText2 := FIXEDTEXT{SELF , ResourceID{ JIMP_FIXEDTEXT2  , _GetInst() } }
	SELF:oDCFixedText2:HyperLabel := HyperLabel{#FixedText2 , "Ano" , NULL_STRING , NULL_STRING}

	SELF:oDCano := SINGLELINEEDIT{SELF , ResourceID{ JIMP_ANO  , _GetInst() } }
	SELF:oDCano:HyperLabel := HyperLabel{#ano , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCano:FieldSpec := PADRAO_num_04{}
	SELF:oDCano:TooltipText := "Ano Inicial"

	SELF:oCCcmdmenos := PUSHBUTTON{SELF , ResourceID{ JIMP_CMDMENOS  , _GetInst() } }
	SELF:oCCcmdmenos:HyperLabel := HyperLabel{#cmdmenos , "-" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmais := PUSHBUTTON{SELF , ResourceID{ JIMP_CMDMAIS  , _GetInst() } }
	SELF:oCCcmdmais:HyperLabel := HyperLabel{#cmdmais , "+" , NULL_STRING , NULL_STRING}

	SELF:oDCmes := SINGLELINEEDIT{SELF , ResourceID{ JIMP_MES  , _GetInst() } }
	SELF:oDCmes:HyperLabel := HyperLabel{#mes , "1" , NULL_STRING , NULL_STRING}
	SELF:oDCmes:FieldSpec := PADRAO_num_02{}
	SELF:oDCmes:TooltipText := "Mes Inicial"

	SELF:oDCFixedText1 := FIXEDTEXT{SELF , ResourceID{ JIMP_FIXEDTEXT1  , _GetInst() } }
	SELF:oDCFixedText1:HyperLabel := HyperLabel{#FixedText1 , "Mes" , NULL_STRING , NULL_STRING}

	SELF:oDCchave := FIXEDTEXT{SELF , ResourceID{ JIMP_CHAVE  , _GetInst() } }
	SELF:oDCchave:HyperLabel := HyperLabel{#chave , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCProgBar := PROGRESSBAR{SELF , ResourceID{ JIMP_PROGBAR  , _GetInst() } }
	SELF:oDCProgBar:HyperLabel := HyperLabel{#ProgBar , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCProgBar:Range := Range{0 , 100}

	SELF:oDCDFIM := DateSle{SELF , ResourceID{ JIMP_DFIM  , _GetInst() } }
	SELF:oDCDFIM:HyperLabel := HyperLabel{#DFIM , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCDFIM:FieldSpec := date_field{}

	SELF:oDCDINI := DateSle{SELF , ResourceID{ JIMP_DINI  , _GetInst() } }
	SELF:oDCDINI:HyperLabel := HyperLabel{#DINI , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCDINI:FieldSpec := DATE_FIELD{}

	SELF:oDCper := FIXEDTEXT{SELF , ResourceID{ JIMP_PER  , _GetInst() } }
	SELF:oDCper:HyperLabel := HyperLabel{#per , "Periodo" , NULL_STRING , NULL_STRING}

	SELF:oCCPushButton9 := PUSHBUTTON{SELF , ResourceID{ JIMP_PUSHBUTTON9  , _GetInst() } }
	SELF:oCCPushButton9:HyperLabel := HyperLabel{#PushButton9 , "Importar Integrado" , NULL_STRING , NULL_STRING}

	SELF:oDCDateTimePicker1 := DATETIMEPICKER{SELF , ResourceID{ JIMP_DATETIMEPICKER1  , _GetInst() } }
	SELF:oDCDateTimePicker1:HyperLabel := HyperLabel{#DateTimePicker1 , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCDateTimePicker1:FieldSpec := date_field{}

	SELF:Caption := "Importar Contas Pagas"
	SELF:HyperLabel := HyperLabel{#JIMP , "Importar Contas Pagas" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS mes
RETURN SELF:FieldGet( #mes )

ASSIGN mes( uValue )
SELF:FieldPut( #mes , uValue )

END CLASS
STATIC DEFINE JIMP_DATETIMEPICKER1 := 123
