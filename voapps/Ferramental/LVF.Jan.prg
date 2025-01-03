#region DEFINES
STATIC DEFINE JLFV_SC_OBS01 := 116 
STATIC DEFINE JLFV_SC_OBS02 := 118 
STATIC DEFINE JLFV_SC_OBS03 := 120 
STATIC DEFINE JLVF_ACESSOR := 119
STATIC DEFINE JLVF_AREA := 113
STATIC DEFINE JLVF_BUSCA := 105
STATIC DEFINE JLVF_CHECAR := 106
STATIC DEFINE JLVF_CLIENTE := 121
STATIC DEFINE JLVF_CLINOME := 122
STATIC DEFINE JLVF_DATA := 102
STATIC DEFINE JLVF_DESCRI := 114
STATIC DEFINE JLVF_ESCRES := 104
STATIC DEFINE JLVF_EXCLUIR := 128
STATIC DEFINE JLVF_FERRAM := 116
STATIC DEFINE JLVF_IMPRO := 103
STATIC DEFINE JLVF_INCLUIR := 127
STATIC DEFINE JLVF_JLVFI := 126
STATIC DEFINE JLVF_LVF := 112
STATIC DEFINE JLVF_NOME := 117
STATIC DEFINE JLVF_NORMAL := 129
STATIC DEFINE JLVF_OBS01 := 131
STATIC DEFINE JLVF_OBS02 := 132
STATIC DEFINE JLVF_OBS03 := 133
STATIC DEFINE JLVF_OBS04 := 134
STATIC DEFINE JLVF_OBS05 := 135
STATIC DEFINE JLVF_ORDEM := 110
STATIC DEFINE JLVF_PEGCLI := 107
STATIC DEFINE JLVF_PEGFER := 109
STATIC DEFINE JLVF_PEGTEC := 108
STATIC DEFINE JLVF_REPARAR := 130
STATIC DEFINE JLVF_SC_AREA := 111
STATIC DEFINE JLVF_SC_CLIENTE := 120
STATIC DEFINE JLVF_SC_DATA := 101
STATIC DEFINE JLVF_SC_FERRAM := 115
STATIC DEFINE JLVF_SC_LVF := 100
STATIC DEFINE JLVF_SC_TECNICO := 124
STATIC DEFINE JLVF_TECNICO := 125
STATIC DEFINE JLVF_TECNOME := 123
STATIC DEFINE JLVF_THEFIXEDTEXT6 := 118
STATIC DEFINE JLVF_THEGROUPBOX1 := 136
#endregion

PARTIAL CLASS JLVF INHERIT MYDataWindow
PROTECT oDBLVF AS DataColumn
PROTECT oDBFERRAM AS DataColumn
PROTECT oDBNOME AS DataColumn
PROTECT oDBCLIENTE AS DataColumn
PROTECT oDBCLINOME AS DataColumn
PROTECT oDBTECNICO AS DataColumn
PROTECT oDBTECNOME AS DataColumn
PROTECT oDCSC_LVF AS FIXEDTEXT
PROTECT oDCSC_DATA AS FIXEDTEXT
PROTECT oDCDATA AS DATETIMEPICKER
PROTECT oCCIMPRO AS PUSHBUTTON
PROTECT oCCESCRES AS PUSHBUTTON
PROTECT oCCbusca AS PUSHBUTTON
PROTECT oCCChecar AS PUSHBUTTON
PROTECT oCCpegcli AS PUSHBUTTON
PROTECT oCCPEGTEC AS PUSHBUTTON
PROTECT oCCpegfer AS PUSHBUTTON
PROTECT oCCordem AS PUSHBUTTON
PROTECT oDCSC_AREA AS FIXEDTEXT
PROTECT oDCLVF AS SINGLELINEEDIT
PROTECT oDCAREA AS COMBOBOX
PROTECT oDCDESCRI AS SINGLELINEEDIT
PROTECT oDCSC_FERRAM AS FIXEDTEXT
PROTECT oDCFERRAM AS SINGLELINEEDIT
PROTECT oDCNOME AS SINGLELINEEDIT
PROTECT oDCtheFixedText6 AS FIXEDTEXT
PROTECT oDCACESSOR AS SINGLELINEEDIT
PROTECT oDCSC_CLIENTE AS FIXEDTEXT
PROTECT oDCCLIENTE AS SINGLELINEEDIT
PROTECT oDCCLINOME AS SINGLELINEEDIT
PROTECT oDCTECNOME AS SINGLELINEEDIT
PROTECT oDCSC_TECNICO AS FIXEDTEXT
PROTECT oDCTECNICO AS rightSle
PROTECT oSFJLVFI AS JLVFI
PROTECT oCCIncluir AS PUSHBUTTON
PROTECT oCCExcluir AS PUSHBUTTON
PROTECT oCCNormal AS PUSHBUTTON
PROTECT oCCReparar AS PUSHBUTTON
PROTECT oDCOBS01 AS SINGLELINEEDIT
PROTECT oDCOBS02 AS SINGLELINEEDIT
PROTECT oDCOBS03 AS SINGLELINEEDIT
PROTECT oDCOBS04 AS SINGLELINEEDIT
PROTECT oDCOBS05 AS SINGLELINEEDIT
PROTECT oDCtheGroupBox1 AS GROUPBOX

// User code starts here (DO NOT remove this line)  ##USER##

ACCESS ACESSOR
RETURN SELF:FieldGet( #ACESSOR )

ASSIGN ACESSOR( uValue )
SELF:FieldPut( #ACESSOR , uValue )

ACCESS AREA
RETURN SELF:FieldGet( #AREA )

ASSIGN AREA( uValue )
SELF:FieldPut( #AREA , uValue )

ACCESS CLIENTE
RETURN SELF:FieldGet( #CLIENTE )

ASSIGN CLIENTE( uValue )
SELF:FieldPut( #CLIENTE , uValue )

ACCESS CLINOME
RETURN SELF:FieldGet( #CLINOME )

ASSIGN CLINOME( uValue )
SELF:FieldPut( #CLINOME , uValue )

ACCESS DESCRI
RETURN SELF:FieldGet( #DESCRI )

ASSIGN DESCRI( uValue )
SELF:FieldPut( #DESCRI , uValue )

ACCESS FERRAM
RETURN SELF:FieldGet( #FERRAM )

ASSIGN FERRAM( uValue )
SELF:FieldPut( #FERRAM , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"JLVF" , _GetInst()},iCtlID)

	SELF:oDCSC_LVF := FIXEDTEXT{SELF , ResourceID{ JLVF_SC_LVF  , _GetInst() } }
	SELF:oDCSC_LVF:HyperLabel := HyperLabel{#SC_LVF , "Lvf:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_DATA := FIXEDTEXT{SELF , ResourceID{ JLVF_SC_DATA  , _GetInst() } }
	SELF:oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA , "Data:" , NULL_STRING , NULL_STRING}

	SELF:oDCDATA := DATETIMEPICKER{SELF , ResourceID{ JLVF_DATA  , _GetInst() } }
	SELF:oDCDATA:FieldSpec := DATE_FIELD{}
	SELF:oDCDATA:HyperLabel := HyperLabel{#DATA , "13/02/2021" , NULL_STRING , NULL_STRING}

	SELF:oCCIMPRO := PUSHBUTTON{SELF , ResourceID{ JLVF_IMPRO  , _GetInst() } }
	SELF:oCCIMPRO:HyperLabel := HyperLabel{#IMPRO , "Importar RO" , NULL_STRING , NULL_STRING}

	SELF:oCCESCRES := PUSHBUTTON{SELF , ResourceID{ JLVF_ESCRES  , _GetInst() } }
	SELF:oCCESCRES:HyperLabel := HyperLabel{#ESCRES , "..." , NULL_STRING , NULL_STRING}

	SELF:oCCbusca := PUSHBUTTON{SELF , ResourceID{ JLVF_BUSCA  , _GetInst() } }
	SELF:oCCbusca:Image := ICO_FIND{}
	SELF:oCCbusca:HyperLabel := HyperLabel{#busca , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCChecar := PUSHBUTTON{SELF , ResourceID{ JLVF_CHECAR  , _GetInst() } }
	SELF:oCCChecar:HyperLabel := HyperLabel{#Checar , "Checar" , NULL_STRING , NULL_STRING}

	SELF:oCCpegcli := PUSHBUTTON{SELF , ResourceID{ JLVF_PEGCLI  , _GetInst() } }
	SELF:oCCpegcli:HyperLabel := HyperLabel{#pegcli , "-->" , NULL_STRING , NULL_STRING}

	SELF:oCCPEGTEC := PUSHBUTTON{SELF , ResourceID{ JLVF_PEGTEC  , _GetInst() } }
	SELF:oCCPEGTEC:HyperLabel := HyperLabel{#PEGTEC , "-->" , NULL_STRING , NULL_STRING}

	SELF:oCCpegfer := PUSHBUTTON{SELF , ResourceID{ JLVF_PEGFER  , _GetInst() } }
	SELF:oCCpegfer:HyperLabel := HyperLabel{#pegfer , "-->" , NULL_STRING , NULL_STRING}

	SELF:oCCordem := PUSHBUTTON{SELF , ResourceID{ JLVF_ORDEM  , _GetInst() } }
	SELF:oCCordem:TooltipText := "Ordenar Por Numero"
	SELF:oCCordem:Image := ico_az{}
	SELF:oCCordem:HyperLabel := HyperLabel{#ordem , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCSC_AREA := FIXEDTEXT{SELF , ResourceID{ JLVF_SC_AREA  , _GetInst() } }
	SELF:oDCSC_AREA:HyperLabel := HyperLabel{#SC_AREA , "Area:" , NULL_STRING , NULL_STRING}

	SELF:oDCLVF := SINGLELINEEDIT{SELF , ResourceID{ JLVF_LVF  , _GetInst() } }
	SELF:oDCLVF:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCLVF:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 12 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCLVF:Font( oFont )
	SELF:oDCLVF:HyperLabel := HyperLabel{#LVF , "Lvf:" , NULL_STRING , "LVF_LVF"}

	SELF:oDCAREA := COMBOBOX{SELF , ResourceID{ JLVF_AREA  , _GetInst() } }
	SELF:oDCAREA:FieldSpec := PADRAO_CHAR_02{}
	SELF:oDCAREA:HyperLabel := HyperLabel{#AREA , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCDESCRI := SINGLELINEEDIT{SELF , ResourceID{ JLVF_DESCRI  , _GetInst() } }
	SELF:oDCDESCRI:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCDESCRI:HyperLabel := HyperLabel{#DESCRI , "Descri:" , NULL_STRING , "LVF_DESCRI"}

	SELF:oDCSC_FERRAM := FIXEDTEXT{SELF , ResourceID{ JLVF_SC_FERRAM  , _GetInst() } }
	SELF:oDCSC_FERRAM:HyperLabel := HyperLabel{#SC_FERRAM , "Ferramenta:" , NULL_STRING , NULL_STRING}

	SELF:oDCFERRAM := SINGLELINEEDIT{SELF , ResourceID{ JLVF_FERRAM  , _GetInst() } }
	SELF:oDCFERRAM:FieldSpec := PADRAO_CHAR_24{}
	SELF:oDCFERRAM:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCFERRAM:Font( oFont )
	SELF:oDCFERRAM:HyperLabel := HyperLabel{#FERRAM , "Ferram:" , NULL_STRING , "LVF_FERRAM"}

	SELF:oDCNOME := SINGLELINEEDIT{SELF , ResourceID{ JLVF_NOME  , _GetInst() } }
	SELF:oDCNOME:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCNOME:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCNOME:Font( oFont )
	SELF:oDCNOME:HyperLabel := HyperLabel{#NOME , "Nome:" , NULL_STRING , "LVF_NOME"}

	SELF:oDCtheFixedText6 := FIXEDTEXT{SELF , ResourceID{ JLVF_THEFIXEDTEXT6  , _GetInst() } }
	SELF:oDCtheFixedText6:HyperLabel := HyperLabel{#theFixedText6 , "Acessorios" , NULL_STRING , NULL_STRING}

	SELF:oDCACESSOR := SINGLELINEEDIT{SELF , ResourceID{ JLVF_ACESSOR  , _GetInst() } }
	SELF:oDCACESSOR:FieldSpec := PADRAO_CHAR_50{}
	SELF:oDCACESSOR:HyperLabel := HyperLabel{#ACESSOR , "Clinome:" , NULL_STRING , "LVF_CLINOME"}

	SELF:oDCSC_CLIENTE := FIXEDTEXT{SELF , ResourceID{ JLVF_SC_CLIENTE  , _GetInst() } }
	SELF:oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE , "Cliente:" , NULL_STRING , NULL_STRING}

	SELF:oDCCLIENTE := SINGLELINEEDIT{SELF , ResourceID{ JLVF_CLIENTE  , _GetInst() } }
	SELF:oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCCLIENTE:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCCLIENTE:Font( oFont )
	SELF:oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE , "Cliente:" , NULL_STRING , "LVF_CLIENTE"}

	SELF:oDCCLINOME := SINGLELINEEDIT{SELF , ResourceID{ JLVF_CLINOME  , _GetInst() } }
	SELF:oDCCLINOME:FieldSpec := PADRAO_CHAR_50{}
	SELF:oDCCLINOME:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCCLINOME:Font( oFont )
	SELF:oDCCLINOME:HyperLabel := HyperLabel{#CLINOME , "Clinome:" , NULL_STRING , "LVF_CLINOME"}

	SELF:oDCTECNOME := SINGLELINEEDIT{SELF , ResourceID{ JLVF_TECNOME  , _GetInst() } }
	SELF:oDCTECNOME:FieldSpec := PADRAO_CHAR_50{}
	SELF:oDCTECNOME:HyperLabel := HyperLabel{#TECNOME , "Tecnome:" , NULL_STRING , "LVF_TECNOME"}

	SELF:oDCSC_TECNICO := FIXEDTEXT{SELF , ResourceID{ JLVF_SC_TECNICO  , _GetInst() } }
	SELF:oDCSC_TECNICO:HyperLabel := HyperLabel{#SC_TECNICO , "Tecnico:" , NULL_STRING , NULL_STRING}

	SELF:oDCTECNICO := rightSle{SELF , ResourceID{ JLVF_TECNICO  , _GetInst() } }
	SELF:oDCTECNICO:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCTECNICO:HyperLabel := HyperLabel{#TECNICO , "Tecnico:" , NULL_STRING , "LVF_TECNICO"}

	SELF:oCCIncluir := PUSHBUTTON{SELF , ResourceID{ JLVF_INCLUIR  , _GetInst() } }
	SELF:oCCIncluir:HyperLabel := HyperLabel{#Incluir , "Incluir" , NULL_STRING , NULL_STRING}

	SELF:oCCExcluir := PUSHBUTTON{SELF , ResourceID{ JLVF_EXCLUIR  , _GetInst() } }
	SELF:oCCExcluir:HyperLabel := HyperLabel{#Excluir , "Excluir" , NULL_STRING , NULL_STRING}

	SELF:oCCNormal := PUSHBUTTON{SELF , ResourceID{ JLVF_NORMAL  , _GetInst() } }
	SELF:oCCNormal:HyperLabel := HyperLabel{#Normal , "Normal" , NULL_STRING , NULL_STRING}

	SELF:oCCReparar := PUSHBUTTON{SELF , ResourceID{ JLVF_REPARAR  , _GetInst() } }
	SELF:oCCReparar:HyperLabel := HyperLabel{#Reparar , "Reparar" , NULL_STRING , NULL_STRING}

	SELF:oDCOBS01 := SINGLELINEEDIT{SELF , ResourceID{ JLVF_OBS01  , _GetInst() } }
	SELF:oDCOBS01:FieldSpec := PADRAO_CHAR_60{}
	SELF:oDCOBS01:HyperLabel := HyperLabel{#OBS01 , "Obs01:" , NULL_STRING , "LVF_OBS01"}

	SELF:oDCOBS02 := SINGLELINEEDIT{SELF , ResourceID{ JLVF_OBS02  , _GetInst() } }
	SELF:oDCOBS02:FieldSpec := PADRAO_CHAR_60{}
	SELF:oDCOBS02:HyperLabel := HyperLabel{#OBS02 , "Obs02:" , NULL_STRING , "LVF_OBS02"}

	SELF:oDCOBS03 := SINGLELINEEDIT{SELF , ResourceID{ JLVF_OBS03  , _GetInst() } }
	SELF:oDCOBS03:FieldSpec := PADRAO_CHAR_60{}
	SELF:oDCOBS03:HyperLabel := HyperLabel{#OBS03 , "Obs03:" , NULL_STRING , "LVF_OBS03"}

	SELF:oDCOBS04 := SINGLELINEEDIT{SELF , ResourceID{ JLVF_OBS04  , _GetInst() } }
	SELF:oDCOBS04:FieldSpec := PADRAO_CHAR_60{}
	SELF:oDCOBS04:HyperLabel := HyperLabel{#OBS04 , "Obs03:" , NULL_STRING , "LVF_OBS03"}

	SELF:oDCOBS05 := SINGLELINEEDIT{SELF , ResourceID{ JLVF_OBS05  , _GetInst() } }
	SELF:oDCOBS05:FieldSpec := PADRAO_CHAR_60{}
	SELF:oDCOBS05:HyperLabel := HyperLabel{#OBS05 , "Obs03:" , NULL_STRING , "LVF_OBS03"}

	SELF:oDCtheGroupBox1 := GROUPBOX{SELF , ResourceID{ JLVF_THEGROUPBOX1  , _GetInst() } }
	SELF:oDCtheGroupBox1:HyperLabel := HyperLabel{#theGroupBox1 , "Observações" , NULL_STRING , NULL_STRING}

	SELF:Caption := "Lista de Verificacao de Ferrramenta"
	SELF:Menu := STANDARDSHELLMENU{}
	SELF:ClipperKeys := TRUE
	SELF:HyperLabel := HyperLabel{#JLVF , "Lista de Verificacao de Ferrramenta" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF

	SELF:Browser := DataBrowser{SELF}

	SELF:oDBLVF := DataColumn{PADRAO_NUM_08{}}
	SELF:oDBLVF:Width := 9
	SELF:oDBLVF:HyperLabel := SELF:oDCLVF:HyperLabel
	SELF:oDBLVF:Caption := "Lvf:"
	SELF:Browser:AddColumn(SELF:oDBLVF)

	SELF:oDBFERRAM := DataColumn{PADRAO_CHAR_24{}}
	SELF:oDBFERRAM:Width := 17
	SELF:oDBFERRAM:HyperLabel := SELF:oDCFERRAM:HyperLabel
	SELF:oDBFERRAM:Caption := "Ferram:"
	SELF:Browser:AddColumn(SELF:oDBFERRAM)

	SELF:oDBNOME := DataColumn{PADRAO_CHAR_40{}}
	SELF:oDBNOME:Width := 17
	SELF:oDBNOME:HyperLabel := SELF:oDCNOME:HyperLabel
	SELF:oDBNOME:Caption := "Nome:"
	SELF:Browser:AddColumn(SELF:oDBNOME)

	SELF:oDBCLIENTE := DataColumn{PADRAO_NUM_08{}}
	SELF:oDBCLIENTE:Width := 9
	SELF:oDBCLIENTE:HyperLabel := SELF:oDCCLIENTE:HyperLabel
	SELF:oDBCLIENTE:Caption := "Cliente:"
	SELF:Browser:AddColumn(SELF:oDBCLIENTE)

	SELF:oDBCLINOME := DataColumn{PADRAO_CHAR_50{}}
	SELF:oDBCLINOME:Width := 9
	SELF:oDBCLINOME:HyperLabel := SELF:oDCCLINOME:HyperLabel
	SELF:oDBCLINOME:Caption := "Clinome:"
	SELF:Browser:AddColumn(SELF:oDBCLINOME)

	SELF:oDBTECNICO := DataColumn{PADRAO_NUM_08{}}
	SELF:oDBTECNICO:Width := 9
	SELF:oDBTECNICO:HyperLabel := SELF:oDCTECNICO:HyperLabel
	SELF:oDBTECNICO:Caption := "Tecnico:"
	SELF:Browser:AddColumn(SELF:oDBTECNICO)

	SELF:oDBTECNOME := DataColumn{PADRAO_CHAR_50{}}
	SELF:oDBTECNOME:Width := 21
	SELF:oDBTECNOME:HyperLabel := SELF:oDCTECNOME:HyperLabel
	SELF:oDBTECNOME:Caption := "Tecnome:"
	SELF:Browser:AddColumn(SELF:oDBTECNOME)

	SELF:ViewAs(#FormView)

	SELF:oSFJLVFI := JLVFI{SELF , JLVF_JLVFI }
	SELF:oSFJLVFI:Show()

	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS LVF
RETURN SELF:FieldGet( #LVF )

ASSIGN LVF( uValue )
SELF:FieldPut( #LVF , uValue )

ACCESS NOME
RETURN SELF:FieldGet( #NOME )

ASSIGN NOME( uValue )
SELF:FieldPut( #NOME , uValue )

ACCESS OBS01
RETURN SELF:FieldGet( #OBS01 )

ASSIGN OBS01( uValue )
SELF:FieldPut( #OBS01 , uValue )

ACCESS OBS02
RETURN SELF:FieldGet( #OBS02 )

ASSIGN OBS02( uValue )
SELF:FieldPut( #OBS02 , uValue )

ACCESS OBS03
RETURN SELF:FieldGet( #OBS03 )

ASSIGN OBS03( uValue )
SELF:FieldPut( #OBS03 , uValue )

ACCESS OBS04
RETURN SELF:FieldGet( #OBS04 )

ASSIGN OBS04( uValue )
SELF:FieldPut( #OBS04 , uValue )

ACCESS OBS05
RETURN SELF:FieldGet( #OBS05 )

ASSIGN OBS05( uValue )
SELF:FieldPut( #OBS05 , uValue )

METHOD ordem( ) 
	SELF:KeyFind()

ACCESS TECNICO
RETURN SELF:FieldGet( #TECNICO )

ASSIGN TECNICO( uValue )
SELF:FieldPut( #TECNICO , uValue )

ACCESS TECNOME
RETURN SELF:FieldGet( #TECNOME )

ASSIGN TECNOME( uValue )
SELF:FieldPut( #TECNOME , uValue )

END CLASS
