#region DEFINES
STATIC DEFINE _LOGONDIALOG_AJUDA := 112
STATIC DEFINE _LOGONDIALOG_ANO := 104
STATIC DEFINE _LOGONDIALOG_CANCELBUTTON := 106
STATIC DEFINE _LOGONDIALOG_CMDMAIS := 117
STATIC DEFINE _LOGONDIALOG_CMDMAIS2 := 114
STATIC DEFINE _LOGONDIALOG_CMDMAIS3 := 120
STATIC DEFINE _LOGONDIALOG_CMDMENOS := 116
STATIC DEFINE _LOGONDIALOG_CMDMENOS2 := 113
STATIC DEFINE _LOGONDIALOG_CMDMENOS3 := 119
STATIC DEFINE _LOGONDIALOG_EMPRESA := 105
STATIC DEFINE _LOGONDIALOG_FIXEDTEXT1 := 118
STATIC DEFINE _LOGONDIALOG_FIXEDTEXT2 := 115
STATIC DEFINE _LOGONDIALOG_FIXEDTEXT3 := 121
STATIC DEFINE _LOGONDIALOG_MES := 103
STATIC DEFINE _LOGONDIALOG_NAME := 100
STATIC DEFINE _LOGONDIALOG_OKBUTTON := 102
STATIC DEFINE _LOGONDIALOG_PASSWORD := 101
STATIC DEFINE _LOGONDIALOG_PROGBAR := 122
STATIC DEFINE _LOGONDIALOG_THEFIXEDTEXT1 := 107
STATIC DEFINE _LOGONDIALOG_THEFIXEDTEXT2 := 108
STATIC DEFINE _LOGONDIALOG_X := 109
STATIC DEFINE _LOGONDIALOG_X1 := 110
STATIC DEFINE _LOGONDIALOG_X2 := 111
#endregion

PARTIAL CLASS _LogonDialog INHERIT DIALOGWINDOW
PROTECT oDCName AS SINGLELINEEDIT
PROTECT oDCPassword AS SINGLELINEEDIT
PROTECT oCCOKButton AS PUSHBUTTON
PROTECT oDCmes AS SINGLELINEEDIT
PROTECT oDCano AS SINGLELINEEDIT
PROTECT oDCempresa AS SINGLELINEEDIT
PROTECT oCCCancelButton AS PUSHBUTTON
PROTECT oDCtheFixedText1 AS FIXEDTEXT
PROTECT oDCtheFixedText2 AS FIXEDTEXT
PROTECT oDCx AS FIXEDTEXT
PROTECT oDCx1 AS FIXEDTEXT
PROTECT oDCx2 AS FIXEDTEXT
PROTECT oCCAjuda AS PUSHBUTTON
PROTECT oCCcmdmenos2 AS PUSHBUTTON
PROTECT oCCcmdmais2 AS PUSHBUTTON
PROTECT oDCFixedText2 AS FIXEDTEXT
PROTECT oCCcmdmenos AS PUSHBUTTON
PROTECT oCCcmdmais AS PUSHBUTTON
PROTECT oDCFixedText1 AS FIXEDTEXT
PROTECT oCCcmdmenos3 AS PUSHBUTTON
PROTECT oCCcmdmais3 AS PUSHBUTTON
PROTECT oDCFixedText3 AS FIXEDTEXT
PROTECT oDCProgBar AS PROGRESSBAR

// User code starts here (DO NOT remove this line)  ##USER##

CONSTRUCTOR(oParent,uExtra)

	SELF:PreInit(oParent,uExtra)

	SUPER(oParent , ResourceID{"_LogonDialog" , _GetInst()} , TRUE)

	SELF:oDCName := SINGLELINEEDIT{SELF , ResourceID{ _LOGONDIALOG_NAME  , _GetInst() } }
	SELF:oDCName:TooltipText := "Digite o Nome Para Acesso ao Sistema"
	SELF:oDCName:FocusSelect := FSEL_ALL
	SELF:oDCName:HyperLabel := HyperLabel{#Name , NULL_STRING , NULL_STRING , "login"}

	SELF:oDCPassword := SINGLELINEEDIT{SELF , ResourceID{ _LOGONDIALOG_PASSWORD  , _GetInst() } }
	SELF:oDCPassword:TooltipText := "Digite Sua Senha de Acesso"
	SELF:oDCPassword:FocusSelect := FSEL_ALL
	SELF:oDCPassword:HyperLabel := HyperLabel{#Password , NULL_STRING , NULL_STRING , "login"}

	SELF:oCCOKButton := PUSHBUTTON{SELF , ResourceID{ _LOGONDIALOG_OKBUTTON  , _GetInst() } }
	SELF:oCCOKButton:TooltipText := "Clique Para Acessar o Sistema"
	SELF:oCCOKButton:Image := ICO_CHAVE2{}
	SELF:oCCOKButton:HyperLabel := HyperLabel{#OKButton , NULL_STRING , NULL_STRING , "login"}

	SELF:oDCmes := SINGLELINEEDIT{SELF , ResourceID{ _LOGONDIALOG_MES  , _GetInst() } }
	SELF:oDCmes:FieldSpec := PADRAO_num_02{}
	SELF:oDCmes:TooltipText := "Mes Inicial"
	SELF:oDCmes:FocusSelect := FSEL_ALL
	SELF:oDCmes:HyperLabel := HyperLabel{#mes , "1" , NULL_STRING , NULL_STRING}

	SELF:oDCano := SINGLELINEEDIT{SELF , ResourceID{ _LOGONDIALOG_ANO  , _GetInst() } }
	SELF:oDCano:FieldSpec := PADRAO_num_04{}
	SELF:oDCano:TooltipText := "Ano Inicial"
	SELF:oDCano:FocusSelect := FSEL_ALL
	SELF:oDCano:HyperLabel := HyperLabel{#ano , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCempresa := SINGLELINEEDIT{SELF , ResourceID{ _LOGONDIALOG_EMPRESA  , _GetInst() } }
	SELF:oDCempresa:FieldSpec := PADRAO_num_04{}
	SELF:oDCempresa:TooltipText := "Ano Inicial"
	SELF:oDCempresa:HyperLabel := HyperLabel{#empresa , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCCancelButton := PUSHBUTTON{SELF , ResourceID{ _LOGONDIALOG_CANCELBUTTON  , _GetInst() } }
	SELF:oCCCancelButton:TooltipText := "Clique para  Não Acessar "
	SELF:oCCCancelButton:Image := ICO_SAIR{}
	SELF:oCCCancelButton:HyperLabel := HyperLabel{#CancelButton , NULL_STRING , NULL_STRING , "login"}

	SELF:oDCtheFixedText1 := FIXEDTEXT{SELF , ResourceID{ _LOGONDIALOG_THEFIXEDTEXT1  , _GetInst() } }
	SELF:oDCtheFixedText1:HyperLabel := HyperLabel{#theFixedText1 , "&Nome:" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText2 := FIXEDTEXT{SELF , ResourceID{ _LOGONDIALOG_THEFIXEDTEXT2  , _GetInst() } }
	SELF:oDCtheFixedText2:HyperLabel := HyperLabel{#theFixedText2 , "&Senha:" , NULL_STRING , NULL_STRING}

	SELF:oDCx := FIXEDTEXT{SELF , ResourceID{ _LOGONDIALOG_X  , _GetInst() } }
	SELF:oDCx:HyperLabel := HyperLabel{#x , "Cancelar" , NULL_STRING , NULL_STRING}

	SELF:oDCx1 := FIXEDTEXT{SELF , ResourceID{ _LOGONDIALOG_X1  , _GetInst() } }
	SELF:oDCx1:HyperLabel := HyperLabel{#x1 , "Acessar" , NULL_STRING , NULL_STRING}

	SELF:oDCx2 := FIXEDTEXT{SELF , ResourceID{ _LOGONDIALOG_X2  , _GetInst() } }
	SELF:oDCx2:HyperLabel := HyperLabel{#x2 , "Ajuda" , NULL_STRING , NULL_STRING}

	SELF:oCCAjuda := PUSHBUTTON{SELF , ResourceID{ _LOGONDIALOG_AJUDA  , _GetInst() } }
	SELF:oCCAjuda:TooltipText := "Clique Para Acessar a Ajuda"
	SELF:oCCAjuda:Image := ICO_AJUDA{}
	SELF:oCCAjuda:HyperLabel := HyperLabel{#Ajuda , NULL_STRING , NULL_STRING , "login"}

	SELF:oCCcmdmenos2 := PUSHBUTTON{SELF , ResourceID{ _LOGONDIALOG_CMDMENOS2  , _GetInst() } }
	SELF:oCCcmdmenos2:HyperLabel := HyperLabel{#cmdmenos2 , "-" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmais2 := PUSHBUTTON{SELF , ResourceID{ _LOGONDIALOG_CMDMAIS2  , _GetInst() } }
	SELF:oCCcmdmais2:HyperLabel := HyperLabel{#cmdmais2 , "+" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText2 := FIXEDTEXT{SELF , ResourceID{ _LOGONDIALOG_FIXEDTEXT2  , _GetInst() } }
	SELF:oDCFixedText2:HyperLabel := HyperLabel{#FixedText2 , "Ano" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmenos := PUSHBUTTON{SELF , ResourceID{ _LOGONDIALOG_CMDMENOS  , _GetInst() } }
	SELF:oCCcmdmenos:HyperLabel := HyperLabel{#cmdmenos , "-" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmais := PUSHBUTTON{SELF , ResourceID{ _LOGONDIALOG_CMDMAIS  , _GetInst() } }
	SELF:oCCcmdmais:HyperLabel := HyperLabel{#cmdmais , "+" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText1 := FIXEDTEXT{SELF , ResourceID{ _LOGONDIALOG_FIXEDTEXT1  , _GetInst() } }
	SELF:oDCFixedText1:HyperLabel := HyperLabel{#FixedText1 , "Mes" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmenos3 := PUSHBUTTON{SELF , ResourceID{ _LOGONDIALOG_CMDMENOS3  , _GetInst() } }
	SELF:oCCcmdmenos3:HyperLabel := HyperLabel{#cmdmenos3 , "-" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmais3 := PUSHBUTTON{SELF , ResourceID{ _LOGONDIALOG_CMDMAIS3  , _GetInst() } }
	SELF:oCCcmdmais3:HyperLabel := HyperLabel{#cmdmais3 , "+" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText3 := FIXEDTEXT{SELF , ResourceID{ _LOGONDIALOG_FIXEDTEXT3  , _GetInst() } }
	SELF:oDCFixedText3:HyperLabel := HyperLabel{#FixedText3 , "Empresa" , NULL_STRING , NULL_STRING}

	SELF:oDCProgBar := PROGRESSBAR{SELF , ResourceID{ _LOGONDIALOG_PROGBAR  , _GetInst() } }
	SELF:oDCProgBar:HyperLabel := HyperLabel{#ProgBar , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCProgBar:Range := Range{0 , 100}

	SELF:Caption := "Acesso ao Sistema:"
	SELF:HyperLabel := HyperLabel{#_LogonDialog , "Acesso ao Sistema:" , NULL_STRING , "login"}

	SELF:PostInit(oParent,uExtra)

RETURN


METHOD OKButton( )
RETURN NIL


END CLASS
