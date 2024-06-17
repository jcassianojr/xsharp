#region DEFINES
STATIC DEFINE _JRIFRASTRO_CANCELAR := 106
STATIC DEFINE _JRIFRASTRO_CMDALT := 119
STATIC DEFINE _JRIFRASTRO_CMDAR := 117
STATIC DEFINE _JRIFRASTRO_CMDB := 120
STATIC DEFINE _JRIFRASTRO_CMDBUSCA := 113
STATIC DEFINE _JRIFRASTRO_CMDCRM := 118
STATIC DEFINE _JRIFRASTRO_CMDGERA := 115
STATIC DEFINE _JRIFRASTRO_CMDMAIS2 := 111
STATIC DEFINE _JRIFRASTRO_CMDMENOS2 := 110
STATIC DEFINE _JRIFRASTRO_CMDMO := 122
STATIC DEFINE _JRIFRASTRO_CMDOP := 123
STATIC DEFINE _JRIFRASTRO_CMDSO := 121
STATIC DEFINE _JRIFRASTRO_CMDZERA := 116
STATIC DEFINE _JRIFRASTRO_CRASTRO := 124
STATIC DEFINE _JRIFRASTRO_FIXEDTEXT2 := 107
STATIC DEFINE _JRIFRASTRO_FIXEDTEXT3 := 108
STATIC DEFINE _JRIFRASTRO_FIXEDTEXT4 := 109
STATIC DEFINE _JRIFRASTRO_INFO := 112
STATIC DEFINE _JRIFRASTRO_OK := 104
STATIC DEFINE _JRIFRASTRO_RASTROANO := 101
STATIC DEFINE _JRIFRASTRO_RASTROITEM := 114
STATIC DEFINE _JRIFRASTRO_RASTRONUM := 100
STATIC DEFINE _JRIFRASTRO_THEFIXEDTEXT10 := 103
STATIC DEFINE _JRIFRASTRO_THEFIXEDTEXT9 := 105
STATIC DEFINE _JRIFRASTRO_TIPCOD := 102
#endregion

PARTIAL CLASS _jrifrastro INHERIT DATADIALOG
PROTECT oDCRASTRONUM AS rightSle
PROTECT oDCRASTROANO AS SINGLELINEEDIT
PROTECT oDCTIPCOD AS SINGLELINEEDIT
PROTECT oDCtheFixedText10 AS FIXEDTEXT
PROTECT oCCOK AS PUSHBUTTON
PROTECT oDCtheFixedText9 AS FIXEDTEXT
PROTECT oCCCancelar AS PUSHBUTTON
PROTECT oDCFixedText2 AS FIXEDTEXT
PROTECT oDCFixedText3 AS FIXEDTEXT
PROTECT oDCFixedText4 AS FIXEDTEXT
PROTECT oCCcmdmenos2 AS PUSHBUTTON
PROTECT oCCcmdmais2 AS PUSHBUTTON
PROTECT oDCinfo AS FIXEDTEXT
PROTECT oCCcmdbusca AS PUSHBUTTON
PROTECT oDCRASTROITEM AS rightSle
PROTECT oCCcmdgera AS PUSHBUTTON
PROTECT oCCcmdzera AS PUSHBUTTON
PROTECT oCCcmdAR AS PUSHBUTTON
PROTECT oCCcmdcrm AS PUSHBUTTON
PROTECT oCCcmdalt AS PUSHBUTTON
PROTECT oCCcmdB AS PUSHBUTTON
PROTECT oCCcmdso AS PUSHBUTTON
PROTECT oCCcmdmO AS PUSHBUTTON
PROTECT oCCcmdop AS PUSHBUTTON
PROTECT oDCcRASTRO AS SINGLELINEEDIT

// User code starts here (DO NOT remove this line)  ##USER##

ACCESS cRASTRO
RETURN SELF:FieldGet( #cRASTRO )

ASSIGN cRASTRO( uValue )
SELF:FieldPut( #cRASTRO , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"_jrifrastro" , _GetInst()},iCtlID)

	SELF:oDCRASTRONUM := rightSle{SELF , ResourceID{ _JRIFRASTRO_RASTRONUM  , _GetInst() } }
	SELF:oDCRASTRONUM:FieldSpec := padrao_NUM_08{}
	SELF:oDCRASTRONUM:HyperLabel := HyperLabel{#RASTRONUM , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCRASTROANO := SINGLELINEEDIT{SELF , ResourceID{ _JRIFRASTRO_RASTROANO  , _GetInst() } }
	SELF:oDCRASTROANO:FieldSpec := padrao_NUM_04{}
	SELF:oDCRASTROANO:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCRASTROANO:Font( oFont )
	SELF:oDCRASTROANO:HyperLabel := HyperLabel{#RASTROANO , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCTIPCOD := SINGLELINEEDIT{SELF , ResourceID{ _JRIFRASTRO_TIPCOD  , _GetInst() } }
	SELF:oDCTIPCOD:FieldSpec := padrao_CHAR_02{}
	SELF:oDCTIPCOD:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCTIPCOD:Font( oFont )
	SELF:oDCTIPCOD:HyperLabel := HyperLabel{#TIPCOD , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText10 := FIXEDTEXT{SELF , ResourceID{ _JRIFRASTRO_THEFIXEDTEXT10  , _GetInst() } }
	SELF:oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10 , "OK" , NULL_STRING , NULL_STRING}

	SELF:oCCOK := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_OK  , _GetInst() } }
	SELF:oCCOK:Image := ico_ok{}
	SELF:oCCOK:HyperLabel := HyperLabel{#OK , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText9 := FIXEDTEXT{SELF , ResourceID{ _JRIFRASTRO_THEFIXEDTEXT9  , _GetInst() } }
	SELF:oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9 , "Cancelar" , NULL_STRING , NULL_STRING}

	SELF:oCCCancelar := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CANCELAR  , _GetInst() } }
	SELF:oCCCancelar:Image := ico_sair{}
	SELF:oCCCancelar:HyperLabel := HyperLabel{#Cancelar , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText2 := FIXEDTEXT{SELF , ResourceID{ _JRIFRASTRO_FIXEDTEXT2  , _GetInst() } }
	SELF:oDCFixedText2:HyperLabel := HyperLabel{#FixedText2 , "Tipo" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText3 := FIXEDTEXT{SELF , ResourceID{ _JRIFRASTRO_FIXEDTEXT3  , _GetInst() } }
	SELF:oDCFixedText3:HyperLabel := HyperLabel{#FixedText3 , "Rastro" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText4 := FIXEDTEXT{SELF , ResourceID{ _JRIFRASTRO_FIXEDTEXT4  , _GetInst() } }
	SELF:oDCFixedText4:HyperLabel := HyperLabel{#FixedText4 , "Ano" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmenos2 := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CMDMENOS2  , _GetInst() } }
	SELF:oCCcmdmenos2:HyperLabel := HyperLabel{#cmdmenos2 , "-" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmais2 := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CMDMAIS2  , _GetInst() } }
	SELF:oCCcmdmais2:HyperLabel := HyperLabel{#cmdmais2 , "+" , NULL_STRING , NULL_STRING}

	SELF:oDCinfo := FIXEDTEXT{SELF , ResourceID{ _JRIFRASTRO_INFO  , _GetInst() } }
	SELF:oDCinfo:TextColor := Color{ 255 , 0 , 0 }
	SELF:oDCinfo:Background := Brush{ Color{ 255 , 255 , 255 } }
	oFont := Font{  , 12 , "Microsoft Sans Serif" }
	SELF:oDCinfo:Font( oFont )
	SELF:oDCinfo:HyperLabel := HyperLabel{#info , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCcmdbusca := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CMDBUSCA  , _GetInst() } }
	SELF:oCCcmdbusca:Image := ico_find{}
	SELF:oCCcmdbusca:HyperLabel := HyperLabel{#cmdbusca , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCRASTROITEM := rightSle{SELF , ResourceID{ _JRIFRASTRO_RASTROITEM  , _GetInst() } }
	SELF:oDCRASTROITEM:FieldSpec := padrao_NUM_04{}
	SELF:oDCRASTROITEM:TooltipText := "Numero da Rastreabilidade"
	SELF:oDCRASTROITEM:HyperLabel := HyperLabel{#RASTROITEM , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCcmdgera := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CMDGERA  , _GetInst() } }
	SELF:oCCcmdgera:TooltipText := "Clique Para Gerar o Nº Rastreabilidade"
	SELF:oCCcmdgera:HyperLabel := HyperLabel{#cmdgera , "Rastro-->" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdzera := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CMDZERA  , _GetInst() } }
	SELF:oCCcmdzera:TooltipText := "Apaga o Numero Rastro Gerado"
	SELF:oCCcmdzera:HyperLabel := HyperLabel{#cmdzera , "Zera" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdAR := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CMDAR  , _GetInst() } }
	SELF:oCCcmdAR:TooltipText := "Marca CRMSem Tipo"
	SELF:oCCcmdAR:HyperLabel := HyperLabel{#cmdAR , "AR" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdcrm := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CMDCRM  , _GetInst() } }
	SELF:oCCcmdcrm:TooltipText := "Marca CRMSem Tipo"
	SELF:oCCcmdcrm:HyperLabel := HyperLabel{#cmdcrm , "CRM" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdalt := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CMDALT  , _GetInst() } }
	SELF:oCCcmdalt:TooltipText := "Marca o Rastro como alternativo"
	SELF:oCCcmdalt:HyperLabel := HyperLabel{#cmdalt , "Alt" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdB := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CMDB  , _GetInst() } }
	SELF:oCCcmdB:TooltipText := "Marca o Rastro como Beneficiamento"
	SELF:oCCcmdB:HyperLabel := HyperLabel{#cmdB , "B" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdso := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CMDSO  , _GetInst() } }
	SELF:oCCcmdso:TooltipText := "Marca o Rastro como Solda"
	SELF:oCCcmdso:HyperLabel := HyperLabel{#cmdso , "SO" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmO := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CMDMO  , _GetInst() } }
	SELF:oCCcmdmO:TooltipText := "Marca O Rastro Como Montagem"
	SELF:oCCcmdmO:HyperLabel := HyperLabel{#cmdmO , "MO" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdop := PUSHBUTTON{SELF , ResourceID{ _JRIFRASTRO_CMDOP  , _GetInst() } }
	SELF:oCCcmdop:TooltipText := "Marca CRMSem Tipo"
	SELF:oCCcmdop:HyperLabel := HyperLabel{#cmdop , "OP" , NULL_STRING , NULL_STRING}

	SELF:oDCcRASTRO := SINGLELINEEDIT{SELF , ResourceID{ _JRIFRASTRO_CRASTRO  , _GetInst() } }
	SELF:oDCcRASTRO:FieldSpec := padrao_CHAR_12{}
	SELF:oDCcRASTRO:TooltipText := "Numero da Rastreabilidade"
	SELF:oDCcRASTRO:FocusSelect := FSEL_ALL
	SELF:oDCcRASTRO:HyperLabel := HyperLabel{#cRASTRO , "Codigo" , NULL_STRING , NULL_STRING}

	SELF:Caption := "Informe o Rastro"
	SELF:HyperLabel := HyperLabel{#_jrifrastro , "Informe o Rastro" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS RASTROANO
RETURN SELF:FieldGet( #RASTROANO )

ASSIGN RASTROANO( uValue )
SELF:FieldPut( #RASTROANO , uValue )

ACCESS RASTROITEM
RETURN SELF:FieldGet( #RASTROITEM )

ASSIGN RASTROITEM( uValue )
SELF:FieldPut( #RASTROITEM , uValue )

ACCESS RASTRONUM
RETURN SELF:FieldGet( #RASTRONUM )

ASSIGN RASTRONUM( uValue )
SELF:FieldPut( #RASTRONUM , uValue )

ACCESS TIPCOD
RETURN SELF:FieldGet( #TIPCOD )

ASSIGN TIPCOD( uValue )
SELF:FieldPut( #TIPCOD , uValue )

END CLASS
