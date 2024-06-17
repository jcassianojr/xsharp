#region DEFINES
STATIC DEFINE JBA01_ACHA := 116
STATIC DEFINE JBA01_ACHADATA := 131
STATIC DEFINE JBA01_BUSCA := 127
STATIC DEFINE JBA01_BUSCAOV := 139
STATIC DEFINE JBA01_CHAVE := 140
STATIC DEFINE JBA01_CMDTIPO := 137
STATIC DEFINE JBA01_CODIGO := 115
STATIC DEFINE JBA01_DATA := 111
STATIC DEFINE JBA01_DATADEP := 113
STATIC DEFINE JBA01_ESCOLHA := 128
STATIC DEFINE JBA01_GROUPBOX1 := 134
STATIC DEFINE JBA01_GROUPBOX2 := 135
STATIC DEFINE JBA01_GROUPBOX3 := 136
STATIC DEFINE JBA01_HISTORICO := 120
STATIC DEFINE JBA01_ITEM := 132
STATIC DEFINE JBA01_JBBC01 := 129
STATIC DEFINE JBA01_LOCALIZA := 117
STATIC DEFINE JBA01_MBUSCA := 126
STATIC DEFINE JBA01_MDATA := 130
STATIC DEFINE JBA01_MNUMERO := 118
STATIC DEFINE JBA01_MSUB := 119
STATIC DEFINE JBA01_NRCONTA := 112
STATIC DEFINE JBA01_NUMERO := 109
STATIC DEFINE JBA01_ORDCN := 121
STATIC DEFINE JBA01_ORDDATA := 123
STATIC DEFINE JBA01_ORDNUM := 122
STATIC DEFINE JBA01_PORCODIGO := 124
STATIC DEFINE JBA01_PORDESCR := 125
STATIC DEFINE JBA01_POROV := 138
STATIC DEFINE JBA01_SC_DATA := 102
STATIC DEFINE JBA01_SC_DATA1 := 141
STATIC DEFINE JBA01_SC_DATADEP := 104
STATIC DEFINE JBA01_SC_HISTORICO := 110 
STATIC DEFINE JBA01_SC_ITEM := 107
STATIC DEFINE JBA01_SC_ITEM1 := 108
STATIC DEFINE JBA01_SC_NRCONTA := 103
STATIC DEFINE JBA01_SC_NUMERO := 100
STATIC DEFINE JBA01_SC_TIPO := 112 
STATIC DEFINE JBA01_SC_VALOR := 105
STATIC DEFINE JBA01_SUB := 110
STATIC DEFINE JBA01_THEFIXEDTEXT7 := 106
STATIC DEFINE JBA01_THEFIXEDTEXT8 := 101
STATIC DEFINE JBA01_THESINGLELINEEDIT7 := 106 
STATIC DEFINE JBA01_TIPO := 133
STATIC DEFINE JBA01_VALOR := 114
#endregion

PARTIAL CLASS JBA01 INHERIT MYDataWindow
PROTECT oDBData AS DataColumn
PROTECT oDBNUMERO AS DataColumn
PROTECT oDBSUB AS DataColumn
PROTECT oDBNRCONTA AS DataColumn
PROTECT oDBVALOR AS DataColumn
PROTECT oDBCODIGO AS DataColumn
PROTECT oDBHISTORICO AS DataColumn
PROTECT oDBITEM AS DataColumn
PROTECT oDBTIPO AS DataColumn
PROTECT oDCSC_NUMERO AS FIXEDTEXT
PROTECT oDCtheFixedText8 AS FIXEDTEXT
PROTECT oDCSC_DATA AS FIXEDTEXT
PROTECT oDCSC_NRCONTA AS FIXEDTEXT
PROTECT oDCSC_DATADEP AS FIXEDTEXT
PROTECT oDCSC_VALOR AS FIXEDTEXT
PROTECT oDCtheFixedText7 AS FIXEDTEXT
PROTECT oDCSC_ITEM AS FIXEDTEXT
PROTECT oDCSC_ITEM1 AS FIXEDTEXT
PROTECT oDCNUMERO AS SINGLELINEEDIT
PROTECT oDCSUB AS SINGLELINEEDIT
PROTECT oDCData AS DATETIMEPICKER
PROTECT oDCNRCONTA AS rightSle
PROTECT oDCDATADEP AS DATETIMEPICKER
PROTECT oDCVALOR AS SINGLELINEEDIT
PROTECT oDCCODIGO AS SINGLELINEEDIT
PROTECT oCCAcha AS PUSHBUTTON
PROTECT oCCLocaliza AS PUSHBUTTON
PROTECT oDCmNUMERO AS rightSle
PROTECT oDCmSUB AS SINGLELINEEDIT
PROTECT oDCHISTORICO AS SINGLELINEEDIT
PROTECT oCCORDCN AS PUSHBUTTON
PROTECT oCCORDNUM AS PUSHBUTTON
PROTECT oCCOrdData AS PUSHBUTTON
PROTECT oCCPorCodigo AS PUSHBUTTON
PROTECT oCCPorDescr AS PUSHBUTTON
PROTECT oDCmBUSCA AS SINGLELINEEDIT
PROTECT oCCBusca AS PUSHBUTTON
PROTECT oCCEscolha AS PUSHBUTTON
PROTECT oSFJBBC01 AS JBBC01
PROTECT oDCmDATA AS DATETIMEPICKER
PROTECT oCCAchaData AS PUSHBUTTON
PROTECT oDCITEM AS SINGLELINEEDIT
PROTECT oDCTIPO AS SINGLELINEEDIT
PROTECT oDCGroupBox1 AS GROUPBOX
PROTECT oDCGroupBox2 AS GROUPBOX
PROTECT oDCGroupBox3 AS GROUPBOX
PROTECT oCCcmdtipo AS PUSHBUTTON
PROTECT oCCporov AS PUSHBUTTON
PROTECT oCCbuscaov AS PUSHBUTTON
PROTECT oDCCHAVE AS SINGLELINEEDIT
PROTECT oDCSC_DATA1 AS FIXEDTEXT

// User code starts here (DO NOT remove this line)  ##USER##

ACCESS CHAVE
RETURN SELF:FieldGet( #CHAVE )

ASSIGN CHAVE( uValue )
SELF:FieldPut( #CHAVE , uValue )

ACCESS CODIGO
RETURN SELF:FieldGet( #CODIGO )

ASSIGN CODIGO( uValue )
SELF:FieldPut( #CODIGO , uValue )

ACCESS HISTORICO
RETURN SELF:FieldGet( #HISTORICO )

ASSIGN HISTORICO( uValue )
SELF:FieldPut( #HISTORICO , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"JBA01" , _GetInst()},iCtlID)

	SELF:oDCSC_NUMERO := FIXEDTEXT{SELF , ResourceID{ JBA01_SC_NUMERO  , _GetInst() } }
	SELF:oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO , "Numero:" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText8 := FIXEDTEXT{SELF , ResourceID{ JBA01_THEFIXEDTEXT8  , _GetInst() } }
	SELF:oDCtheFixedText8:HyperLabel := HyperLabel{#theFixedText8 , "D" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_DATA := FIXEDTEXT{SELF , ResourceID{ JBA01_SC_DATA  , _GetInst() } }
	SELF:oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA , "Data:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_NRCONTA := FIXEDTEXT{SELF , ResourceID{ JBA01_SC_NRCONTA  , _GetInst() } }
	SELF:oDCSC_NRCONTA:HyperLabel := HyperLabel{#SC_NRCONTA , "Banco" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_DATADEP := FIXEDTEXT{SELF , ResourceID{ JBA01_SC_DATADEP  , _GetInst() } }
	SELF:oDCSC_DATADEP:HyperLabel := HyperLabel{#SC_DATADEP , "Data Deposito" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_VALOR := FIXEDTEXT{SELF , ResourceID{ JBA01_SC_VALOR  , _GetInst() } }
	SELF:oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR , "Valor:" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText7 := FIXEDTEXT{SELF , ResourceID{ JBA01_THEFIXEDTEXT7  , _GetInst() } }
	SELF:oDCtheFixedText7:HyperLabel := HyperLabel{#theFixedText7 , "Historico" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_ITEM := FIXEDTEXT{SELF , ResourceID{ JBA01_SC_ITEM  , _GetInst() } }
	SELF:oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM , "Codigo Despesa" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_ITEM1 := FIXEDTEXT{SELF , ResourceID{ JBA01_SC_ITEM1  , _GetInst() } }
	SELF:oDCSC_ITEM1:HyperLabel := HyperLabel{#SC_ITEM1 , "Tipo" , NULL_STRING , NULL_STRING}

	SELF:oDCNUMERO := SINGLELINEEDIT{SELF , ResourceID{ JBA01_NUMERO  , _GetInst() } }
	SELF:oDCNUMERO:TooltipText := "Numero Documento"
	SELF:oDCNUMERO:Picture := "9999999"
	SELF:oDCNUMERO:HyperLabel := HyperLabel{#NUMERO , "Numero:" , NULL_STRING , "BA01_NUMERO"}

	SELF:oDCSUB := SINGLELINEEDIT{SELF , ResourceID{ JBA01_SUB  , _GetInst() } }
	SELF:oDCSUB:FieldSpec := padrao_CHAR_01{}
	SELF:oDCSUB:TooltipText := "Sub Codigo Documento A/B.."
	SELF:oDCSUB:HyperLabel := HyperLabel{#SUB , "Sub" , NULL_STRING , "BA01_NUMERO"}

	SELF:oDCData := DATETIMEPICKER{SELF , ResourceID{ JBA01_DATA  , _GetInst() } }
	SELF:oDCData:FieldSpec := DATE_FIELD{}
	SELF:oDCData:TooltipText := "Data Lançamento"
	SELF:oDCData:HyperLabel := HyperLabel{#Data , "Data" , NULL_STRING , NULL_STRING}

	SELF:oDCNRCONTA := rightSle{SELF , ResourceID{ JBA01_NRCONTA  , _GetInst() } }
	SELF:oDCNRCONTA:FieldSpec := padrao_NUM_02{}
	SELF:oDCNRCONTA:TooltipText := "Numero do Banco"
	SELF:oDCNRCONTA:Picture := "9999999"
	SELF:oDCNRCONTA:HyperLabel := HyperLabel{#NRCONTA , "Conta" , NULL_STRING , "BA01_NUMERO"}

	SELF:oDCDATADEP := DATETIMEPICKER{SELF , ResourceID{ JBA01_DATADEP  , _GetInst() } }
	SELF:oDCDATADEP:FieldSpec := DATE_FIELD{}
	SELF:oDCDATADEP:TooltipText := "Data de Deposito"
	SELF:oDCDATADEP:HyperLabel := HyperLabel{#DATADEP , "14/02/2021" , NULL_STRING , NULL_STRING}

	SELF:oDCVALOR := SINGLELINEEDIT{SELF , ResourceID{ JBA01_VALOR  , _GetInst() } }
	SELF:oDCVALOR:FieldSpec := padrao_NUM_12_2{}
	SELF:oDCVALOR:TooltipText := "Valor "
	SELF:oDCVALOR:Picture := "9999999.99"
	SELF:oDCVALOR:FocusSelect := FSEL_ALL
	SELF:oDCVALOR:HyperLabel := HyperLabel{#VALOR , "Valor:" , NULL_STRING , "BA01_VALOR"}

	SELF:oDCCODIGO := SINGLELINEEDIT{SELF , ResourceID{ JBA01_CODIGO  , _GetInst() } }
	SELF:oDCCODIGO:FieldSpec := padrao_CHAR_04{}
	SELF:oDCCODIGO:TooltipText := "Historico"
	SELF:oDCCODIGO:HyperLabel := HyperLabel{#CODIGO , "Codigo" , NULL_STRING , NULL_STRING}

	SELF:oCCAcha := PUSHBUTTON{SELF , ResourceID{ JBA01_ACHA  , _GetInst() } }
	SELF:oCCAcha:HyperLabel := HyperLabel{#Acha , "Acha" , NULL_STRING , NULL_STRING}

	SELF:oCCLocaliza := PUSHBUTTON{SELF , ResourceID{ JBA01_LOCALIZA  , _GetInst() } }
	SELF:oCCLocaliza:TooltipText := "Localiza um Documento"
	SELF:oCCLocaliza:HyperLabel := HyperLabel{#Localiza , "..." , NULL_STRING , NULL_STRING}

	SELF:oDCmNUMERO := rightSle{SELF , ResourceID{ JBA01_MNUMERO  , _GetInst() } }
	SELF:oDCmNUMERO:FieldSpec := PADRAO_num_08{}
	SELF:oDCmNUMERO:TooltipText := "Numero Documento Localizar"
	SELF:oDCmNUMERO:HyperLabel := HyperLabel{#mNUMERO , "Numero:" , NULL_STRING , "BA01_NUMERO"}

	SELF:oDCmSUB := SINGLELINEEDIT{SELF , ResourceID{ JBA01_MSUB  , _GetInst() } }
	SELF:oDCmSUB:FieldSpec := PADRAO_char_01{}
	SELF:oDCmSUB:TooltipText := "Sub documento a Localizar"
	SELF:oDCmSUB:HyperLabel := HyperLabel{#mSUB , "Numero:" , NULL_STRING , "BA01_NUMERO"}

	SELF:oDCHISTORICO := SINGLELINEEDIT{SELF , ResourceID{ JBA01_HISTORICO  , _GetInst() } }
	SELF:oDCHISTORICO:FieldSpec := padrao_char_30{}
	SELF:oDCHISTORICO:TooltipText := "Descrição do Historico"
	SELF:oDCHISTORICO:HyperLabel := HyperLabel{#HISTORICO , "Historico:" , NULL_STRING , "BA01_HISTORICO"}

	SELF:oCCORDCN := PUSHBUTTON{SELF , ResourceID{ JBA01_ORDCN  , _GetInst() } }
	SELF:oCCORDCN:TooltipText := "Ordena Conta Numero Lancamento"
	SELF:oCCORDCN:HyperLabel := HyperLabel{#ORDCN , "Cta/Numero" , NULL_STRING , NULL_STRING}

	SELF:oCCORDNUM := PUSHBUTTON{SELF , ResourceID{ JBA01_ORDNUM  , _GetInst() } }
	SELF:oCCORDNUM:TooltipText := "Ordena Numero de Lançamento"
	SELF:oCCORDNUM:HyperLabel := HyperLabel{#ORDNUM , "Numero" , NULL_STRING , NULL_STRING}

	SELF:oCCOrdData := PUSHBUTTON{SELF , ResourceID{ JBA01_ORDDATA  , _GetInst() } }
	SELF:oCCOrdData:TooltipText := "Ordena Data de Lancamento"
	SELF:oCCOrdData:HyperLabel := HyperLabel{#OrdData , "Data" , NULL_STRING , NULL_STRING}

	SELF:oCCPorCodigo := PUSHBUTTON{SELF , ResourceID{ JBA01_PORCODIGO  , _GetInst() } }
	SELF:oCCPorCodigo:TooltipText := "Ordena Lista Codigo"
	SELF:oCCPorCodigo:HyperLabel := HyperLabel{#PorCodigo , "Ordem de Código" , NULL_STRING , NULL_STRING}

	SELF:oCCPorDescr := PUSHBUTTON{SELF , ResourceID{ JBA01_PORDESCR  , _GetInst() } }
	SELF:oCCPorDescr:TooltipText := "Ordena Lista Por Descriçao"
	SELF:oCCPorDescr:HyperLabel := HyperLabel{#PorDescr , "Ordem Descrição" , NULL_STRING , NULL_STRING}

	SELF:oDCmBUSCA := SINGLELINEEDIT{SELF , ResourceID{ JBA01_MBUSCA  , _GetInst() } }
	SELF:oDCmBUSCA:FieldSpec := PADRAO_CHAR_35{}
	SELF:oDCmBUSCA:HyperLabel := HyperLabel{#mBUSCA , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCBusca := PUSHBUTTON{SELF , ResourceID{ JBA01_BUSCA  , _GetInst() } }
	SELF:oCCBusca:TooltipText := "Localiza um Codigo"
	SELF:oCCBusca:HyperLabel := HyperLabel{#Busca , "Busca" , NULL_STRING , NULL_STRING}

	SELF:oCCEscolha := PUSHBUTTON{SELF , ResourceID{ JBA01_ESCOLHA  , _GetInst() } }
	SELF:oCCEscolha:TooltipText := "Escolhe o Codigo em Destaque"
	SELF:oCCEscolha:HyperLabel := HyperLabel{#Escolha , "Escolher" , NULL_STRING , NULL_STRING}

	SELF:oDCmDATA := DATETIMEPICKER{SELF , ResourceID{ JBA01_MDATA  , _GetInst() } }
	SELF:oDCmDATA:FieldSpec := date_field{}
	SELF:oDCmDATA:TooltipText := "Data a Localizar"
	SELF:oDCmDATA:HyperLabel := HyperLabel{#mDATA , "14/02/2021" , NULL_STRING , NULL_STRING}

	SELF:oCCAchaData := PUSHBUTTON{SELF , ResourceID{ JBA01_ACHADATA  , _GetInst() } }
	SELF:oCCAchaData:TooltipText := "Localizar Uma Data"
	SELF:oCCAchaData:HyperLabel := HyperLabel{#AchaData , "..." , NULL_STRING , NULL_STRING}

	SELF:oDCITEM := SINGLELINEEDIT{SELF , ResourceID{ JBA01_ITEM  , _GetInst() } }
	SELF:oDCITEM:FieldSpec := padrAO_char_04{}
	SELF:oDCITEM:TooltipText := "Codigo de Despesa"
	SELF:oDCITEM:HyperLabel := HyperLabel{#ITEM , "Item" , NULL_STRING , "BA01_ITEM"}

	SELF:oDCTIPO := SINGLELINEEDIT{SELF , ResourceID{ JBA01_TIPO  , _GetInst() } }
	SELF:oDCTIPO:FieldSpec := PADRAO_char_01{}
	SELF:oDCTIPO:Background := Brush{ Color{ 255 , 255 , 200 } }
	SELF:oDCTIPO:TooltipText := "Tipo Credito Debito"
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCTIPO:Font( oFont )
	SELF:oDCTIPO:HyperLabel := HyperLabel{#TIPO , "Tipo" , NULL_STRING , "BA01_NUMERO"}

	SELF:oDCGroupBox1 := GROUPBOX{SELF , ResourceID{ JBA01_GROUPBOX1  , _GetInst() } }
	SELF:oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1 , "Localizar" , NULL_STRING , NULL_STRING}

	SELF:oDCGroupBox2 := GROUPBOX{SELF , ResourceID{ JBA01_GROUPBOX2  , _GetInst() } }
	SELF:oDCGroupBox2:HyperLabel := HyperLabel{#GroupBox2 , "Ordenar" , NULL_STRING , NULL_STRING}

	SELF:oDCGroupBox3 := GROUPBOX{SELF , ResourceID{ JBA01_GROUPBOX3  , _GetInst() } }
	SELF:oDCGroupBox3:HyperLabel := HyperLabel{#GroupBox3 , "Numero:" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdtipo := PUSHBUTTON{SELF , ResourceID{ JBA01_CMDTIPO  , _GetInst() } }
	SELF:oCCcmdtipo:HyperLabel := HyperLabel{#cmdtipo , "Credito Debito" , NULL_STRING , NULL_STRING}

	SELF:oCCporov := PUSHBUTTON{SELF , ResourceID{ JBA01_POROV  , _GetInst() } }
	SELF:oCCporov:TooltipText := "Clique para ordenar por Numero"
	SELF:oCCporov:Image := ICO_AZ{}
	SELF:oCCporov:HyperLabel := HyperLabel{#porov , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCbuscaov := PUSHBUTTON{SELF , ResourceID{ JBA01_BUSCAOV  , _GetInst() } }
	SELF:oCCbuscaov:TooltipText := "Clique Para Localizar Por Numero"
	SELF:oCCbuscaov:Image := ICO_FIND{}
	SELF:oCCbuscaov:HyperLabel := HyperLabel{#buscaov , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCCHAVE := SINGLELINEEDIT{SELF , ResourceID{ JBA01_CHAVE  , _GetInst() } }
	SELF:oDCCHAVE:FieldSpec := PADRAO_char_24{}
	SELF:oDCCHAVE:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCCHAVE:Font( oFont )
	SELF:oDCCHAVE:HyperLabel := HyperLabel{#CHAVE , "Tipo" , NULL_STRING , "BA01_NUMERO"}

	SELF:oDCSC_DATA1 := FIXEDTEXT{SELF , ResourceID{ JBA01_SC_DATA1  , _GetInst() } }
	SELF:oDCSC_DATA1:HyperLabel := HyperLabel{#SC_DATA1 , "Chave Importacao" , NULL_STRING , NULL_STRING}

	SELF:Caption := "Lançamentos"
	SELF:Menu := STANDARDSHELLMENU{}
	SELF:ClipperKeys := TRUE
	SELF:HyperLabel := HyperLabel{#JBA01 , "Lançamentos" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF

	SELF:Browser := DataBrowser{SELF}

	SELF:oDBData := DataColumn{DATE_FIELD{}}
	SELF:oDBData:Width := 11
	SELF:oDBData:HyperLabel := SELF:oDCData:HyperLabel
	SELF:oDBData:Caption := "Data"
	SELF:Browser:AddColumn(SELF:oDBData)

	SELF:oDBNUMERO := DataColumn{10}
	SELF:oDBNUMERO:Width := 10
	SELF:oDBNUMERO:HyperLabel := SELF:oDCNUMERO:HyperLabel
	SELF:oDBNUMERO:Caption := "Numero:"
	SELF:Browser:AddColumn(SELF:oDBNUMERO)

	SELF:oDBSUB := DataColumn{padrao_CHAR_01{}}
	SELF:oDBSUB:Width := 5
	SELF:oDBSUB:HyperLabel := SELF:oDCSUB:HyperLabel
	SELF:oDBSUB:Caption := "Sub"
	SELF:Browser:AddColumn(SELF:oDBSUB)

	SELF:oDBNRCONTA := DataColumn{padrao_NUM_02{}}
	SELF:oDBNRCONTA:Width := 9
	SELF:oDBNRCONTA:HyperLabel := SELF:oDCNRCONTA:HyperLabel
	SELF:oDBNRCONTA:Caption := "Conta"
	SELF:Browser:AddColumn(SELF:oDBNRCONTA)

	SELF:oDBVALOR := DataColumn{padrao_NUM_12_2{}}
	SELF:oDBVALOR:Width := 13
	SELF:oDBVALOR:HyperLabel := SELF:oDCVALOR:HyperLabel
	SELF:oDBVALOR:Caption := "Valor:"
	SELF:Browser:AddColumn(SELF:oDBVALOR)

	SELF:oDBCODIGO := DataColumn{padrao_CHAR_04{}}
	SELF:oDBCODIGO:Width := 8
	SELF:oDBCODIGO:HyperLabel := SELF:oDCCODIGO:HyperLabel
	SELF:oDBCODIGO:Caption := "Codigo"
	SELF:Browser:AddColumn(SELF:oDBCODIGO)

	SELF:oDBHISTORICO := DataColumn{padrao_char_30{}}
	SELF:oDBHISTORICO:Width := 15
	SELF:oDBHISTORICO:HyperLabel := SELF:oDCHISTORICO:HyperLabel
	SELF:oDBHISTORICO:Caption := "Historico:"
	SELF:Browser:AddColumn(SELF:oDBHISTORICO)

	SELF:oDBITEM := DataColumn{padrAO_char_04{}}
	SELF:oDBITEM:Width := 6
	SELF:oDBITEM:HyperLabel := SELF:oDCITEM:HyperLabel
	SELF:oDBITEM:Caption := "Item"
	SELF:Browser:AddColumn(SELF:oDBITEM)

	SELF:oDBTIPO := DataColumn{PADRAO_char_01{}}
	SELF:oDBTIPO:Width := 6
	SELF:oDBTIPO:HyperLabel := SELF:oDCTIPO:HyperLabel
	SELF:oDBTIPO:Caption := "Tipo"
	SELF:Browser:AddColumn(SELF:oDBTIPO)

	SELF:ViewAs(#FormView)

	SELF:oSFJBBC01 := JBBC01{SELF , JBA01_JBBC01 }
	SELF:oSFJBBC01:Show()

	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS ITEM
RETURN SELF:FieldGet( #ITEM )

ASSIGN ITEM( uValue )
SELF:FieldPut( #ITEM , uValue )

ACCESS mBUSCA
RETURN SELF:FieldGet( #mBUSCA )

ASSIGN mBUSCA( uValue )
SELF:FieldPut( #mBUSCA , uValue )

ACCESS mNUMERO
RETURN SELF:FieldGet( #mNUMERO )

ASSIGN mNUMERO( uValue )
SELF:FieldPut( #mNUMERO , uValue )

ACCESS mSUB
RETURN SELF:FieldGet( #mSUB )

ASSIGN mSUB( uValue )
SELF:FieldPut( #mSUB , uValue )

ACCESS NRCONTA
RETURN SELF:FieldGet( #NRCONTA )

ASSIGN NRCONTA( uValue )
SELF:FieldPut( #NRCONTA , uValue )

ACCESS NUMERO
RETURN SELF:FieldGet( #NUMERO )

ASSIGN NUMERO( uValue )
SELF:FieldPut( #NUMERO , uValue )

ACCESS SUB
RETURN SELF:FieldGet( #SUB )

ASSIGN SUB( uValue )
SELF:FieldPut( #SUB , uValue )

ACCESS TIPO
RETURN SELF:FieldGet( #TIPO )

ASSIGN TIPO( uValue )
SELF:FieldPut( #TIPO , uValue )

ACCESS VALOR
RETURN SELF:FieldGet( #VALOR )

ASSIGN VALOR( uValue )
SELF:FieldPut( #VALOR , uValue )

END CLASS
