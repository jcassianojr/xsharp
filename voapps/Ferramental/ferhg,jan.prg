#region DEFINES
STATIC DEFINE JFERHG_BUSCA := 124
STATIC DEFINE JFERHG_CODFERR := 107
STATIC DEFINE JFERHG_CODME01 := 108
STATIC DEFINE JFERHG_DATA := 109
STATIC DEFINE JFERHG_EDITAR := 117
STATIC DEFINE JFERHG_ESCFER := 121
STATIC DEFINE JFERHG_ESCME01 := 120
STATIC DEFINE JFERHG_EXCLUIR := 116
STATIC DEFINE JFERHG_INCLUIR := 115
STATIC DEFINE JFERHG_ITENS := 118
STATIC DEFINE JFERHG_JFERHGI := 114
STATIC DEFINE JFERHG_ORDEM := 123
STATIC DEFINE JFERHG_OS := 106
STATIC DEFINE JFERHG_SC_CODME2 := 113
STATIC DEFINE JFERHG_SC_DATA := 101
STATIC DEFINE JFERHG_SC_OS := 100
STATIC DEFINE JFERHG_SC_SEQ := 102
STATIC DEFINE JFERHG_SC_SERVICO := 105
STATIC DEFINE JFERHG_SC_SSQ := 103
STATIC DEFINE JFERHG_SC_TIPSER := 104
STATIC DEFINE JFERHG_SEQ := 110
STATIC DEFINE JFERHG_SERVICO := 112
STATIC DEFINE JFERHG_SSQ := 111
STATIC DEFINE JFERHG_TIPSER := 119
STATIC DEFINE JFERHG_VERPCP := 122
#endregion

PARTIAL CLASS jferhg INHERIT MYDataWindow
PROTECT oDBOS AS DataColumn
PROTECT oDBCODFERR AS DataColumn
PROTECT oDBCODME01 AS DataColumn
PROTECT oDBDATA AS DataColumn
PROTECT oDBSEQ AS DataColumn
PROTECT oDBSSQ AS DataColumn
PROTECT oDCSC_OS AS FIXEDTEXT
PROTECT oDCSC_DATA AS FIXEDTEXT
PROTECT oDCSC_SEQ AS FIXEDTEXT
PROTECT oDCSC_SSQ AS FIXEDTEXT
PROTECT oDCSC_TIPSER AS FIXEDTEXT
PROTECT oDCSC_SERVICO AS FIXEDTEXT
PROTECT oDCOS AS SINGLELINEEDIT
PROTECT oDCCODFERR AS SINGLELINEEDIT
PROTECT oDCCODME01 AS SINGLELINEEDIT
PROTECT oDCDATA AS DateSle
PROTECT oDCSEQ AS rightSle
PROTECT oDCSSQ AS rightSle
PROTECT oDCSERVICO AS MULTILINEEDIT
PROTECT oDCSC_CODME2 AS FIXEDTEXT
PROTECT oSFjferhgi AS jferhgi
PROTECT oCCIncluIr AS PUSHBUTTON
PROTECT oCCExcluir AS PUSHBUTTON
PROTECT oCCEditar AS PUSHBUTTON
PROTECT oCCItens AS PUSHBUTTON
PROTECT oDCtipser AS COMBOBOX
PROTECT oCCEscme01 AS PUSHBUTTON
PROTECT oCCEscfer AS PUSHBUTTON
PROTECT oCCVERPCP AS PUSHBUTTON
PROTECT oCCordem AS PUSHBUTTON
PROTECT oCCbusca AS PUSHBUTTON

// User code starts here (DO NOT remove this line)  ##USER##

METHOD busca( ) 
	SELF:KeyFind()

ACCESS CODFERR
RETURN SELF:FieldGet( #CODFERR )

ASSIGN CODFERR( uValue )
SELF:FieldPut( #CODFERR , uValue )

ACCESS CODME01
RETURN SELF:FieldGet( #CODME01 )

ASSIGN CODME01( uValue )
SELF:FieldPut( #CODME01 , uValue )

ACCESS DATA
RETURN SELF:FieldGet( #DATA )

ASSIGN DATA( uValue )
SELF:FieldPut( #DATA , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"jferhg" , _GetInst()},iCtlID)

	SELF:oDCSC_OS := FIXEDTEXT{SELF , ResourceID{ JFERHG_SC_OS  , _GetInst() } }
	SELF:oDCSC_OS:HyperLabel := HyperLabel{#SC_OS , "Os:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_DATA := FIXEDTEXT{SELF , ResourceID{ JFERHG_SC_DATA  , _GetInst() } }
	SELF:oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA , "Data:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_SEQ := FIXEDTEXT{SELF , ResourceID{ JFERHG_SC_SEQ  , _GetInst() } }
	SELF:oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ , "Seq:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_SSQ := FIXEDTEXT{SELF , ResourceID{ JFERHG_SC_SSQ  , _GetInst() } }
	SELF:oDCSC_SSQ:HyperLabel := HyperLabel{#SC_SSQ , "Ssq:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_TIPSER := FIXEDTEXT{SELF , ResourceID{ JFERHG_SC_TIPSER  , _GetInst() } }
	SELF:oDCSC_TIPSER:HyperLabel := HyperLabel{#SC_TIPSER , "Servico" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_SERVICO := FIXEDTEXT{SELF , ResourceID{ JFERHG_SC_SERVICO  , _GetInst() } }
	SELF:oDCSC_SERVICO:HyperLabel := HyperLabel{#SC_SERVICO , "Servico:" , NULL_STRING , NULL_STRING}

	SELF:oDCOS := SINGLELINEEDIT{SELF , ResourceID{ JFERHG_OS  , _GetInst() } }
	SELF:oDCOS:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCOS:Background := Brush{ Color{ 255 , 255 , 200 } }
	SELF:oDCOS:TooltipText := "Numero da Os"
	oFont := Font{  , 12 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCOS:Font( oFont )
	SELF:oDCOS:HyperLabel := HyperLabel{#OS , "Os:" , NULL_STRING , "FERHG_OS"}

	SELF:oDCCODFERR := SINGLELINEEDIT{SELF , ResourceID{ JFERHG_CODFERR  , _GetInst() } }
	SELF:oDCCODFERR:FieldSpec := PADRAO_CHAR_24{}
	SELF:oDCCODFERR:TooltipText := "Ferramenta"
	SELF:oDCCODFERR:HyperLabel := HyperLabel{#CODFERR , "Ferramenta" , NULL_STRING , "FERHG_CODFERR"}

	SELF:oDCCODME01 := SINGLELINEEDIT{SELF , ResourceID{ JFERHG_CODME01  , _GetInst() } }
	SELF:oDCCODME01:FieldSpec := PADRAO_CHAR_04{}
	SELF:oDCCODME01:TooltipText := "Equipamento"
	SELF:oDCCODME01:HyperLabel := HyperLabel{#CODME01 , "Maq" , NULL_STRING , "FERHG_CODME01"}

	SELF:oDCDATA := DateSle{SELF , ResourceID{ JFERHG_DATA  , _GetInst() } }
	SELF:oDCDATA:FieldSpec := DATE_FIELD{}
	SELF:oDCDATA:TooltipText := "Data Abertura OS"
	SELF:oDCDATA:HyperLabel := HyperLabel{#DATA , "Data:" , NULL_STRING , "FERHG_DATA"}

	SELF:oDCSEQ := rightSle{SELF , ResourceID{ JFERHG_SEQ  , _GetInst() } }
	SELF:oDCSEQ:FieldSpec := PADRAO_NUM_03{}
	SELF:oDCSEQ:TooltipText := "Sequencia da Operaçao"
	SELF:oDCSEQ:HyperLabel := HyperLabel{#SEQ , "Seq:" , NULL_STRING , "FERHG_SEQ"}

	SELF:oDCSSQ := rightSle{SELF , ResourceID{ JFERHG_SSQ  , _GetInst() } }
	SELF:oDCSSQ:FieldSpec := PADRAO_NUM_03{}
	SELF:oDCSSQ:TooltipText := "Sub Sequencia da Operaçao"
	SELF:oDCSSQ:HyperLabel := HyperLabel{#SSQ , "Ssq:" , NULL_STRING , "FERHG_SSQ"}

	SELF:oDCSERVICO := MULTILINEEDIT{SELF , ResourceID{ JFERHG_SERVICO  , _GetInst() } }
	SELF:oDCSERVICO:FieldSpec := PADRAO_CHAR_255{}
	SELF:oDCSERVICO:TooltipText := "Detalhes do Servico Executado"
	SELF:oDCSERVICO:HyperLabel := HyperLabel{#SERVICO , "Servico:" , NULL_STRING , "FERHG_SERVICO"}

	SELF:oDCSC_CODME2 := FIXEDTEXT{SELF , ResourceID{ JFERHG_SC_CODME2  , _GetInst() } }
	SELF:oDCSC_CODME2:HyperLabel := HyperLabel{#SC_CODME2 , "Operaçao" , NULL_STRING , NULL_STRING}

	SELF:oCCIncluIr := PUSHBUTTON{SELF , ResourceID{ JFERHG_INCLUIR  , _GetInst() } }
	SELF:oCCIncluIr:TooltipText := "Incluir um Item da OS"
	SELF:oCCIncluIr:HyperLabel := HyperLabel{#IncluIr , "Incluir" , NULL_STRING , NULL_STRING}

	SELF:oCCExcluir := PUSHBUTTON{SELF , ResourceID{ JFERHG_EXCLUIR  , _GetInst() } }
	SELF:oCCExcluir:TooltipText := "Excluir um Item da OS"
	SELF:oCCExcluir:HyperLabel := HyperLabel{#Excluir , "Excluir" , NULL_STRING , NULL_STRING}

	SELF:oCCEditar := PUSHBUTTON{SELF , ResourceID{ JFERHG_EDITAR  , _GetInst() } }
	SELF:oCCEditar:TooltipText := "Editar o Item em Destauque"
	SELF:oCCEditar:HyperLabel := HyperLabel{#Editar , "Editar" , NULL_STRING , NULL_STRING}

	SELF:oCCItens := PUSHBUTTON{SELF , ResourceID{ JFERHG_ITENS  , _GetInst() } }
	SELF:oCCItens:TooltipText := "Ver Item em Destaque"
	SELF:oCCItens:HyperLabel := HyperLabel{#Itens , "Ver Itens" , NULL_STRING , NULL_STRING}

	SELF:oDCtipser := COMBOBOX{SELF , ResourceID{ JFERHG_TIPSER  , _GetInst() } }
	SELF:oDCtipser:FieldSpec := PADRAO_CHAR_01{}
	SELF:oDCtipser:HyperLabel := HyperLabel{#tipser , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCEscme01 := PUSHBUTTON{SELF , ResourceID{ JFERHG_ESCME01  , _GetInst() } }
	SELF:oCCEscme01:TooltipText := "Escolher Uma Maquina/Equipamento"
	SELF:oCCEscme01:HyperLabel := HyperLabel{#Escme01 , "Maquina" , NULL_STRING , NULL_STRING}

	SELF:oCCEscfer := PUSHBUTTON{SELF , ResourceID{ JFERHG_ESCFER  , _GetInst() } }
	SELF:oCCEscfer:TooltipText := "Escolher Uma Ferramenta"
	SELF:oCCEscfer:HyperLabel := HyperLabel{#Escfer , "Ferramenta" , NULL_STRING , NULL_STRING}

	SELF:oCCVERPCP := PUSHBUTTON{SELF , ResourceID{ JFERHG_VERPCP  , _GetInst() } }
	SELF:oCCVERPCP:HyperLabel := HyperLabel{#VERPCP , "Ver Composicao Sequencia" , NULL_STRING , NULL_STRING}

	SELF:oCCordem := PUSHBUTTON{SELF , ResourceID{ JFERHG_ORDEM  , _GetInst() } }
	SELF:oCCordem:TooltipText := "Ordenar Por Numero"
	SELF:oCCordem:Image := ico_az{}
	SELF:oCCordem:HyperLabel := HyperLabel{#ordem , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCbusca := PUSHBUTTON{SELF , ResourceID{ JFERHG_BUSCA  , _GetInst() } }
	SELF:oCCbusca:Image := ico_find{}
	SELF:oCCbusca:HyperLabel := HyperLabel{#busca , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:Caption := "Registro de Horas Gastas Ferramentaria"
	SELF:Menu := STANDARDSHELLMENU{}
	SELF:HyperLabel := HyperLabel{#jferhg , "Registro de Horas Gastas Ferramentaria" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF

	SELF:Browser := DataBrowser{SELF}

	SELF:oDBOS := DataColumn{PADRAO_NUM_08{}}
	SELF:oDBOS:Width := 9
	SELF:oDBOS:HyperLabel := SELF:oDCOS:HyperLabel
	SELF:oDBOS:Caption := "Os:"
	SELF:Browser:AddColumn(SELF:oDBOS)

	SELF:oDBCODFERR := DataColumn{PADRAO_CHAR_24{}}
	SELF:oDBCODFERR:Width := 14
	SELF:oDBCODFERR:HyperLabel := SELF:oDCCODFERR:HyperLabel
	SELF:oDBCODFERR:Caption := "Ferramenta"
	SELF:Browser:AddColumn(SELF:oDBCODFERR)

	SELF:oDBCODME01 := DataColumn{PADRAO_CHAR_04{}}
	SELF:oDBCODME01:Width := 9
	SELF:oDBCODME01:HyperLabel := SELF:oDCCODME01:HyperLabel
	SELF:oDBCODME01:Caption := "Maq"
	SELF:Browser:AddColumn(SELF:oDBCODME01)

	SELF:oDBDATA := DataColumn{DATE_FIELD{}}
	SELF:oDBDATA:Width := 13
	SELF:oDBDATA:HyperLabel := SELF:oDCDATA:HyperLabel
	SELF:oDBDATA:Caption := "Data:"
	SELF:Browser:AddColumn(SELF:oDBDATA)

	SELF:oDBSEQ := DataColumn{PADRAO_NUM_03{}}
	SELF:oDBSEQ:Width := 5
	SELF:oDBSEQ:HyperLabel := SELF:oDCSEQ:HyperLabel
	SELF:oDBSEQ:Caption := "Seq:"
	SELF:Browser:AddColumn(SELF:oDBSEQ)

	SELF:oDBSSQ := DataColumn{PADRAO_NUM_03{}}
	SELF:oDBSSQ:Width := 5
	SELF:oDBSSQ:HyperLabel := SELF:oDCSSQ:HyperLabel
	SELF:oDBSSQ:Caption := "Ssq:"
	SELF:Browser:AddColumn(SELF:oDBSSQ)

	SELF:ViewAs(#FormView)

	SELF:oSFjferhgi := jferhgi{SELF , JFERHG_JFERHGI }
	SELF:oSFjferhgi:Show()

	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


METHOD ordem( ) 
	SELF:KEYFIND()

ACCESS OS
RETURN SELF:FieldGet( #OS )

ASSIGN OS( uValue )
SELF:FieldPut( #OS , uValue )

ACCESS SEQ
RETURN SELF:FieldGet( #SEQ )

ASSIGN SEQ( uValue )
SELF:FieldPut( #SEQ , uValue )

ACCESS SERVICO
RETURN SELF:FieldGet( #SERVICO )

ASSIGN SERVICO( uValue )
SELF:FieldPut( #SERVICO , uValue )

ACCESS SSQ
RETURN SELF:FieldGet( #SSQ )

ASSIGN SSQ( uValue )
SELF:FieldPut( #SSQ , uValue )

ACCESS tipser
RETURN SELF:FieldGet( #tipser )

ASSIGN tipser( uValue )
SELF:FieldPut( #tipser , uValue )

END CLASS
