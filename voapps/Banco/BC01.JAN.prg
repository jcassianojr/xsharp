#region DEFINES
STATIC DEFINE JBC01_BUSCAOV := 106
STATIC DEFINE JBC01_CMDTIPO := 103
STATIC DEFINE JBC01_CODIGO := 107
STATIC DEFINE JBC01_DESCRICAO := 108
STATIC DEFINE JBC01_ITEM := 112
STATIC DEFINE JBC01_POROV := 105
STATIC DEFINE JBC01_SC_CODIGO := 100
STATIC DEFINE JBC01_SC_DESCRICAO := 101
STATIC DEFINE JBC01_SC_ITEM := 110
STATIC DEFINE JBC01_SC_ITEM1 := 102
STATIC DEFINE JBC01_SC_VALOR := 109
STATIC DEFINE JBC01_TIPO := 104
STATIC DEFINE JBC01_VALOR := 111
#endregion

PARTIAL CLASS JBC01 INHERIT MYDataWindow
PROTECT oDBCODIGO AS DataColumn
PROTECT oDBDESCRICAO AS DataColumn
PROTECT oDBVALOR AS DataColumn
PROTECT oDCSC_CODIGO AS FIXEDTEXT
PROTECT oDCSC_DESCRICAO AS FIXEDTEXT
PROTECT oDCSC_ITEM1 AS FIXEDTEXT
PROTECT oCCcmdtipo AS PUSHBUTTON
PROTECT oDCTIPO AS SINGLELINEEDIT
PROTECT oCCporov AS PUSHBUTTON
PROTECT oCCbuscaov AS PUSHBUTTON
PROTECT oDCCODIGO AS SINGLELINEEDIT
PROTECT oDCDESCRICAO AS SINGLELINEEDIT
PROTECT oDCSC_VALOR AS FIXEDTEXT
PROTECT oDCSC_ITEM AS FIXEDTEXT
PROTECT oDCVALOR AS rightSle
PROTECT oDCITEM AS COMBOBOX

// User code starts here (DO NOT remove this line)  ##USER##

ACCESS CODIGO
RETURN SELF:FieldGet( #CODIGO )

ASSIGN CODIGO( uValue )
SELF:FieldPut( #CODIGO , uValue )

ACCESS DESCRICAO
RETURN SELF:FieldGet( #DESCRICAO )

ASSIGN DESCRICAO( uValue )
SELF:FieldPut( #DESCRICAO , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"JBC01" , _GetInst()},iCtlID)

	SELF:oDCSC_CODIGO := FIXEDTEXT{SELF , ResourceID{ JBC01_SC_CODIGO  , _GetInst() } }
	SELF:oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO , "Código:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_DESCRICAO := FIXEDTEXT{SELF , ResourceID{ JBC01_SC_DESCRICAO  , _GetInst() } }
	SELF:oDCSC_DESCRICAO:HyperLabel := HyperLabel{#SC_DESCRICAO , "Descrição:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_ITEM1 := FIXEDTEXT{SELF , ResourceID{ JBC01_SC_ITEM1  , _GetInst() } }
	SELF:oDCSC_ITEM1:HyperLabel := HyperLabel{#SC_ITEM1 , "Tipo" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdtipo := PUSHBUTTON{SELF , ResourceID{ JBC01_CMDTIPO  , _GetInst() } }
	SELF:oCCcmdtipo:HyperLabel := HyperLabel{#cmdtipo , "Credito Debito" , NULL_STRING , NULL_STRING}

	SELF:oDCTIPO := SINGLELINEEDIT{SELF , ResourceID{ JBC01_TIPO  , _GetInst() } }
	SELF:oDCTIPO:FieldSpec := PADRAO_char_01{}
	SELF:oDCTIPO:TooltipText := "Tipo Credito Debito"
	SELF:oDCTIPO:HyperLabel := HyperLabel{#TIPO , "Tipo" , NULL_STRING , "BA01_NUMERO"}

	SELF:oCCporov := PUSHBUTTON{SELF , ResourceID{ JBC01_POROV  , _GetInst() } }
	SELF:oCCporov:TooltipText := "Clique para ordenar por Numero"
	SELF:oCCporov:Image := ICO_AZ{}
	SELF:oCCporov:HyperLabel := HyperLabel{#porov , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCbuscaov := PUSHBUTTON{SELF , ResourceID{ JBC01_BUSCAOV  , _GetInst() } }
	SELF:oCCbuscaov:TooltipText := "Clique Para Localizar Por Numero"
	SELF:oCCbuscaov:Image := ICO_FIND{}
	SELF:oCCbuscaov:HyperLabel := HyperLabel{#buscaov , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCCODIGO := SINGLELINEEDIT{SELF , ResourceID{ JBC01_CODIGO  , _GetInst() } }
	SELF:oDCCODIGO:FieldSpec := padrao_char_04{}
	SELF:oDCCODIGO:HyperLabel := HyperLabel{#CODIGO , "Codigo:" , NULL_STRING , "BC01_CODIGO"}

	SELF:oDCDESCRICAO := SINGLELINEEDIT{SELF , ResourceID{ JBC01_DESCRICAO  , _GetInst() } }
	SELF:oDCDESCRICAO:FieldSpec := padrao_char_35{}
	SELF:oDCDESCRICAO:HyperLabel := HyperLabel{#DESCRICAO , "Descricao:" , NULL_STRING , "BC01_DESCRICAO"}

	SELF:oDCSC_VALOR := FIXEDTEXT{SELF , ResourceID{ JBC01_SC_VALOR  , _GetInst() } }
	SELF:oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR , "Valor:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_ITEM := FIXEDTEXT{SELF , ResourceID{ JBC01_SC_ITEM  , _GetInst() } }
	SELF:oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM , "Item:" , NULL_STRING , NULL_STRING}

	SELF:oDCVALOR := rightSle{SELF , ResourceID{ JBC01_VALOR  , _GetInst() } }
	SELF:oDCVALOR:FieldSpec := padrao_num_12_2{}
	SELF:oDCVALOR:HyperLabel := HyperLabel{#VALOR , "Valor:" , NULL_STRING , "BC01_VALOR"}

	SELF:oDCITEM := COMBOBOX{SELF , ResourceID{ JBC01_ITEM  , _GetInst() } }
	SELF:oDCITEM:FieldSpec := padrao_char_03{}
	SELF:oDCITEM:HyperLabel := HyperLabel{#ITEM , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:Caption := "Histórico Padrão"
	SELF:Menu := STANDARDSHELLMENU{}
	SELF:ClipperKeys := TRUE
	SELF:HyperLabel := HyperLabel{#JBC01 , "Histórico Padrão" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF

	SELF:Browser := DataBrowser{SELF}

	SELF:oDBCODIGO := DataColumn{padrao_char_04{}}
	SELF:oDBCODIGO:Width := 8
	SELF:oDBCODIGO:HyperLabel := SELF:oDCCODIGO:HyperLabel
	SELF:oDBCODIGO:Caption := "Codigo:"
	SELF:Browser:AddColumn(SELF:oDBCODIGO)

	SELF:oDBDESCRICAO := DataColumn{padrao_char_35{}}
	SELF:oDBDESCRICAO:Width := 26
	SELF:oDBDESCRICAO:HyperLabel := SELF:oDCDESCRICAO:HyperLabel
	SELF:oDBDESCRICAO:Caption := "Descricao:"
	SELF:Browser:AddColumn(SELF:oDBDESCRICAO)

	SELF:oDBVALOR := DataColumn{padrao_num_12_2{}}
	SELF:oDBVALOR:Width := 7
	SELF:oDBVALOR:HyperLabel := SELF:oDCVALOR:HyperLabel
	SELF:oDBVALOR:Caption := "Valor:"
	SELF:Browser:AddColumn(SELF:oDBVALOR)

	SELF:ViewAs(#FormView)


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS ITEM
RETURN SELF:FieldGet( #ITEM )

ASSIGN ITEM( uValue )
SELF:FieldPut( #ITEM , uValue )

ACCESS TIPO
RETURN SELF:FieldGet( #TIPO )

ASSIGN TIPO( uValue )
SELF:FieldPut( #TIPO , uValue )

ACCESS VALOR
RETURN SELF:FieldGet( #VALOR )

ASSIGN VALOR( uValue )
SELF:FieldPut( #VALOR , uValue )

END CLASS
