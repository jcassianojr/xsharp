#region DEFINES
STATIC DEFINE JRO_ALTERAR := 128
STATIC DEFINE JRO_ANTERIOR := 133
STATIC DEFINE JRO_AREA := 101
STATIC DEFINE JRO_BUSCA := 145
STATIC DEFINE JRO_CHECKLIST := 134
STATIC DEFINE JRO_CLIENTE := 121
STATIC DEFINE JRO_CLINOME := 120
STATIC DEFINE JRO_CMDCONCLUIDA := 124
STATIC DEFINE JRO_CONCLUIDA := 123
STATIC DEFINE JRO_DATA := 100
STATIC DEFINE JRO_DATAFIM := 114
STATIC DEFINE JRO_DATAINI := 112
STATIC DEFINE JRO_DATAPAR := 117
STATIC DEFINE JRO_DEFEIT2 := 106
STATIC DEFINE JRO_DEFEIT3 := 107
STATIC DEFINE JRO_DEFEITO := 105
STATIC DEFINE JRO_DESCRI := 102
STATIC DEFINE JRO_ESCRES1 := 143
STATIC DEFINE JRO_ESCRES2 := 144
STATIC DEFINE JRO_EXCLUIR := 129
STATIC DEFINE JRO_FERRAM := 152
STATIC DEFINE JRO_FIXEDTEXT12 := 141
STATIC DEFINE JRO_FIXEDTEXT13 := 142
STATIC DEFINE JRO_GROUPBOX1 := 137
STATIC DEFINE JRO_GROUPBOX2 := 138
STATIC DEFINE JRO_HORA := 116
STATIC DEFINE JRO_HORAFIM := 115
STATIC DEFINE JRO_HORAINI := 113
STATIC DEFINE JRO_HORAPAR := 119
STATIC DEFINE JRO_HORAPINI := 118
STATIC DEFINE JRO_INCLUIR := 130
STATIC DEFINE JRO_JROI := 131
STATIC DEFINE JRO_NOME := 153
STATIC DEFINE JRO_ORDEM := 172
STATIC DEFINE JRO_PEGCLI := 160
STATIC DEFINE JRO_PEGFER := 161
STATIC DEFINE JRO_PEGSOL := 158
STATIC DEFINE JRO_PEGTEC := 159
STATIC DEFINE JRO_PROXIMO := 132
STATIC DEFINE JRO_REQNOME := 135
STATIC DEFINE JRO_REQNUM := 104
STATIC DEFINE JRO_RO := 148
STATIC DEFINE JRO_SC_AREA := 147
STATIC DEFINE JRO_SC_CLIENTE := 122
STATIC DEFINE JRO_SC_DATA := 151
STATIC DEFINE JRO_SC_DEFEITO := 156
STATIC DEFINE JRO_SC_FERRAM := 149
STATIC DEFINE JRO_SC_HORA := 150
STATIC DEFINE JRO_SC_HORA2 := 171
STATIC DEFINE JRO_SC_RO := 146
STATIC DEFINE JRO_SC_SM := 125
STATIC DEFINE JRO_SC_SOLUCAO := 157
STATIC DEFINE JRO_SM := 126
STATIC DEFINE JRO_SOLUCA2 := 109
STATIC DEFINE JRO_SOLUCA3 := 110
STATIC DEFINE JRO_SOLUCA4 := 111
STATIC DEFINE JRO_SOLUCAO := 108
STATIC DEFINE JRO_TABULAR := 127
STATIC DEFINE JRO_TECNICO := 103
STATIC DEFINE JRO_TECNOME := 155
STATIC DEFINE JRO_THEFIXEDTEXT10 := 162
STATIC DEFINE JRO_THEFIXEDTEXT12 := 163
STATIC DEFINE JRO_THEFIXEDTEXT13 := 165
STATIC DEFINE JRO_THEFIXEDTEXT14 := 168
STATIC DEFINE JRO_THEFIXEDTEXT15 := 170
STATIC DEFINE JRO_THEFIXEDTEXT6 := 167
STATIC DEFINE JRO_THEFIXEDTEXT8 := 154
STATIC DEFINE JRO_THEFIXEDTEXT9 := 136
STATIC DEFINE JRO_THEGROUPBOX2 := 166
STATIC DEFINE JRO_THEGROUPBOX3 := 164
STATIC DEFINE JRO_THEGROUPBOX4 := 169
STATIC DEFINE JRO_THERADIOBUTTON3 := 124 
STATIC DEFINE JRO_THESINGLELINEEDIT11 := 118 
STATIC DEFINE JRO_TIPO := 139
STATIC DEFINE JRO_TIPORO := 140
#endregion

PARTIAL CLASS JRO INHERIT MYDataWindow
PROTECT oDBREQNUM AS DataColumn
PROTECT oDBFERRAM AS DataColumn
PROTECT oDBNOME AS DataColumn
PROTECT oDBDEFEITO AS DataColumn
PROTECT oDCDATA AS DATETIMEPICKER
PROTECT oDCAREA AS COMBOBOX
PROTECT oDCDESCRI AS SINGLELINEEDIT
PROTECT oDCTECNICO AS rightSle
PROTECT oDCREQNUM AS rightSle
PROTECT oDCDEFEITO AS SINGLELINEEDIT
PROTECT oDCDEFEIT2 AS SINGLELINEEDIT
PROTECT oDCDEFEIT3 AS SINGLELINEEDIT
PROTECT oDCSOLUCAO AS SINGLELINEEDIT
PROTECT oDCSOLUCA2 AS SINGLELINEEDIT
PROTECT oDCSOLUCA3 AS SINGLELINEEDIT
PROTECT oDCSOLUCA4 AS SINGLELINEEDIT
PROTECT oDCDATAINI AS DateSle
PROTECT oDCHORAINI AS rightSle
PROTECT oDCDATAFIM AS DateSle
PROTECT oDCHORAFIM AS rightSle
PROTECT oDCHORA AS SINGLELINEEDIT
PROTECT oDCdatapar AS DateSle
PROTECT oDChorapINI AS rightSle
PROTECT oDChorapar AS rightSle
PROTECT oDCCLINOME AS SINGLELINEEDIT
PROTECT oDCCLIENTE AS SINGLELINEEDIT
PROTECT oDCSC_CLIENTE AS FIXEDTEXT
PROTECT oDCCONCLUIDA AS CHECKBOX
PROTECT oCCCmdConcluida AS PUSHBUTTON
PROTECT oDCSC_SM AS FIXEDTEXT
PROTECT oDCSM AS SINGLELINEEDIT
PROTECT oCCTabular AS PUSHBUTTON
PROTECT oCCAlterar AS PUSHBUTTON
PROTECT oCCExcluir AS PUSHBUTTON
PROTECT oCCIncluir AS PUSHBUTTON
PROTECT oSFJROI AS JROI
PROTECT oCCProximo AS PUSHBUTTON
PROTECT oCCAnterior AS PUSHBUTTON
PROTECT oCCCheckList AS PUSHBUTTON
PROTECT oDCREQNOME AS SINGLELINEEDIT
PROTECT oDCtheFixedText9 AS FIXEDTEXT
PROTECT oDCGroupBox1 AS GROUPBOX
PROTECT oDCGroupBox2 AS GROUPBOX
PROTECT oDCTIPO AS SINGLELINEEDIT
PROTECT oDCTIPORO AS SINGLELINEEDIT
PROTECT oDCFixedText12 AS FIXEDTEXT
PROTECT oDCFixedText13 AS FIXEDTEXT
PROTECT oCCescres1 AS PUSHBUTTON
PROTECT oCCescres2 AS PUSHBUTTON
PROTECT oCCbusca AS PUSHBUTTON
PROTECT oDCSC_RO AS FIXEDTEXT
PROTECT oDCSC_AREA AS FIXEDTEXT
PROTECT oDCRO AS SINGLELINEEDIT
PROTECT oDCSC_FERRAM AS FIXEDTEXT
PROTECT oDCSC_HORA AS FIXEDTEXT
PROTECT oDCSC_DATA AS FIXEDTEXT
PROTECT oDCFERRAM AS SINGLELINEEDIT
PROTECT oDCNOME AS SINGLELINEEDIT
PROTECT oDCtheFixedText8 AS FIXEDTEXT
PROTECT oDCTECNOME AS SINGLELINEEDIT
PROTECT oDCSC_DEFEITO AS FIXEDTEXT
PROTECT oDCSC_SOLUCAO AS FIXEDTEXT
PROTECT oCCPEGsol AS PUSHBUTTON
PROTECT oCCpegtec AS PUSHBUTTON
PROTECT oCCpegcli AS PUSHBUTTON
PROTECT oCCpegfer AS PUSHBUTTON
PROTECT oDCtheFixedText10 AS FIXEDTEXT
PROTECT oDCtheFixedText12 AS FIXEDTEXT
PROTECT oDCtheGroupBox3 AS GROUPBOX
PROTECT oDCtheFixedText13 AS FIXEDTEXT
PROTECT oDCtheGroupBox2 AS GROUPBOX
PROTECT oDCtheFixedText6 AS FIXEDTEXT
PROTECT oDCtheFixedText14 AS FIXEDTEXT
PROTECT oDCtheGroupBox4 AS GROUPBOX
PROTECT oDCtheFixedText15 AS FIXEDTEXT
PROTECT oDCSC_HORA2 AS FIXEDTEXT
PROTECT oCCordem AS PUSHBUTTON

// User code starts here (DO NOT remove this line)  ##USER##

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

ACCESS CONCLUIDA
RETURN SELF:FieldGet( #CONCLUIDA )

ASSIGN CONCLUIDA( uValue )
SELF:FieldPut( #CONCLUIDA , uValue )

ACCESS DATAFIM
RETURN SELF:FieldGet( #DATAFIM )

ASSIGN DATAFIM( uValue )
SELF:FieldPut( #DATAFIM , uValue )

ACCESS DATAINI
RETURN SELF:FieldGet( #DATAINI )

ASSIGN DATAINI( uValue )
SELF:FieldPut( #DATAINI , uValue )

ACCESS datapar
RETURN SELF:FieldGet( #datapar )

ASSIGN datapar( uValue )
SELF:FieldPut( #datapar , uValue )

ACCESS DEFEIT2
RETURN SELF:FieldGet( #DEFEIT2 )

ASSIGN DEFEIT2( uValue )
SELF:FieldPut( #DEFEIT2 , uValue )

ACCESS DEFEIT3
RETURN SELF:FieldGet( #DEFEIT3 )

ASSIGN DEFEIT3( uValue )
SELF:FieldPut( #DEFEIT3 , uValue )

ACCESS DEFEITO
RETURN SELF:FieldGet( #DEFEITO )

ASSIGN DEFEITO( uValue )
SELF:FieldPut( #DEFEITO , uValue )

ACCESS DESCRI
RETURN SELF:FieldGet( #DESCRI )

ASSIGN DESCRI( uValue )
SELF:FieldPut( #DESCRI , uValue )

ACCESS FERRAM
RETURN SELF:FieldGet( #FERRAM )

ASSIGN FERRAM( uValue )
SELF:FieldPut( #FERRAM , uValue )

ACCESS HORA
RETURN SELF:FieldGet( #HORA )

ASSIGN HORA( uValue )
SELF:FieldPut( #HORA , uValue )

ACCESS HORAFIM
RETURN SELF:FieldGet( #HORAFIM )

ASSIGN HORAFIM( uValue )
SELF:FieldPut( #HORAFIM , uValue )

ACCESS HORAINI
RETURN SELF:FieldGet( #HORAINI )

ASSIGN HORAINI( uValue )
SELF:FieldPut( #HORAINI , uValue )

ACCESS horapar
RETURN SELF:FieldGet( #horapar )

ASSIGN horapar( uValue )
SELF:FieldPut( #horapar , uValue )

ACCESS horapINI
RETURN SELF:FieldGet( #horapINI )

ASSIGN horapINI( uValue )
SELF:FieldPut( #horapINI , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"JRO" , _GetInst()},iCtlID)

	SELF:oDCDATA := DATETIMEPICKER{SELF , ResourceID{ JRO_DATA  , _GetInst() } }
	SELF:oDCDATA:FieldSpec := DATE_FIELD{}
	SELF:oDCDATA:TooltipText := "Data Ocorrencia"
	SELF:oDCDATA:HyperLabel := HyperLabel{#DATA , "Registro de Ocorrencia" , NULL_STRING , NULL_STRING}

	SELF:oDCAREA := COMBOBOX{SELF , ResourceID{ JRO_AREA  , _GetInst() } }
	SELF:oDCAREA:FieldSpec := PADRAO_CHAR_02{}
	SELF:oDCAREA:TooltipText := "Area "
	SELF:oDCAREA:HyperLabel := HyperLabel{#AREA , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCDESCRI := SINGLELINEEDIT{SELF , ResourceID{ JRO_DESCRI  , _GetInst() } }
	SELF:oDCDESCRI:FieldSpec := PADRAO_CHAR_20{}
	SELF:oDCDESCRI:TooltipText := "Descriçao"
	SELF:oDCDESCRI:HyperLabel := HyperLabel{#DESCRI , "Descri:" , NULL_STRING , "RO_DESCRI"}

	SELF:oDCTECNICO := rightSle{SELF , ResourceID{ JRO_TECNICO  , _GetInst() } }
	SELF:oDCTECNICO:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCTECNICO:TooltipText := "Numero do Tecnico"
	SELF:oDCTECNICO:HyperLabel := HyperLabel{#TECNICO , "Ro:" , NULL_STRING , "RO_RO"}

	SELF:oDCREQNUM := rightSle{SELF , ResourceID{ JRO_REQNUM  , _GetInst() } }
	SELF:oDCREQNUM:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCREQNUM:TooltipText := "Numero do Soliciatante"
	SELF:oDCREQNUM:HyperLabel := HyperLabel{#REQNUM , "Ro:" , NULL_STRING , "RO_RO"}

	SELF:oDCDEFEITO := SINGLELINEEDIT{SELF , ResourceID{ JRO_DEFEITO  , _GetInst() } }
	SELF:oDCDEFEITO:FieldSpec := PADRAO_CHAR_80{}
	SELF:oDCDEFEITO:TooltipText := "Descriçao do Defeito"
	SELF:oDCDEFEITO:HyperLabel := HyperLabel{#DEFEITO , "Defeito:" , NULL_STRING , "RO_DEFEITO"}

	SELF:oDCDEFEIT2 := SINGLELINEEDIT{SELF , ResourceID{ JRO_DEFEIT2  , _GetInst() } }
	SELF:oDCDEFEIT2:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCDEFEIT2:TooltipText := "Descriçao do Defeito"
	SELF:oDCDEFEIT2:HyperLabel := HyperLabel{#DEFEIT2 , "Defeito:" , NULL_STRING , "RO_DEFEITO"}

	SELF:oDCDEFEIT3 := SINGLELINEEDIT{SELF , ResourceID{ JRO_DEFEIT3  , _GetInst() } }
	SELF:oDCDEFEIT3:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCDEFEIT3:TooltipText := "Descriçao do Defeito"
	SELF:oDCDEFEIT3:HyperLabel := HyperLabel{#DEFEIT3 , "Defeito:" , NULL_STRING , "RO_DEFEITO"}

	SELF:oDCSOLUCAO := SINGLELINEEDIT{SELF , ResourceID{ JRO_SOLUCAO  , _GetInst() } }
	SELF:oDCSOLUCAO:FieldSpec := PADRAO_CHAR_200{}
	SELF:oDCSOLUCAO:TooltipText := "Descriçao da Solucao "
	SELF:oDCSOLUCAO:HyperLabel := HyperLabel{#SOLUCAO , "Solucao:" , NULL_STRING , "RO_SOLUCAO"}

	SELF:oDCSOLUCA2 := SINGLELINEEDIT{SELF , ResourceID{ JRO_SOLUCA2  , _GetInst() } }
	SELF:oDCSOLUCA2:FieldSpec := PADRAO_CHAR_80{}
	SELF:oDCSOLUCA2:TooltipText := "Descriçao da Solucao "
	SELF:oDCSOLUCA2:HyperLabel := HyperLabel{#SOLUCA2 , "Solucao:" , NULL_STRING , "RO_SOLUCA2"}

	SELF:oDCSOLUCA3 := SINGLELINEEDIT{SELF , ResourceID{ JRO_SOLUCA3  , _GetInst() } }
	SELF:oDCSOLUCA3:FieldSpec := PADRAO_CHAR_80{}
	SELF:oDCSOLUCA3:TooltipText := "Descriçao da Solucao "
	SELF:oDCSOLUCA3:HyperLabel := HyperLabel{#SOLUCA3 , "Solucao:" , NULL_STRING , "RO_SOLUCA2"}

	SELF:oDCSOLUCA4 := SINGLELINEEDIT{SELF , ResourceID{ JRO_SOLUCA4  , _GetInst() } }
	SELF:oDCSOLUCA4:FieldSpec := PADRAO_CHAR_80{}
	SELF:oDCSOLUCA4:TooltipText := "Descriçao da Solucao "
	SELF:oDCSOLUCA4:HyperLabel := HyperLabel{#SOLUCA4 , "Solucao:" , NULL_STRING , "RO_SOLUCA2"}

	SELF:oDCDATAINI := DateSle{SELF , ResourceID{ JRO_DATAINI  , _GetInst() } }
	SELF:oDCDATAINI:FieldSpec := date_field{}
	SELF:oDCDATAINI:HyperLabel := HyperLabel{#DATAINI , "Datai:" , NULL_STRING , "Sm_DATAI"}

	SELF:oDCHORAINI := rightSle{SELF , ResourceID{ JRO_HORAINI  , _GetInst() } }
	SELF:oDCHORAINI:FieldSpec := padrao_num_05_2{}
	SELF:oDCHORAINI:HyperLabel := HyperLabel{#HORAINI , "Horaini:" , NULL_STRING , "Sm_HORAINI"}

	SELF:oDCDATAFIM := DateSle{SELF , ResourceID{ JRO_DATAFIM  , _GetInst() } }
	SELF:oDCDATAFIM:FieldSpec := date_field{}
	SELF:oDCDATAFIM:HyperLabel := HyperLabel{#DATAFIM , "Datat:" , NULL_STRING , "Sm_DATAT"}

	SELF:oDCHORAFIM := rightSle{SELF , ResourceID{ JRO_HORAFIM  , _GetInst() } }
	SELF:oDCHORAFIM:FieldSpec := padrao_num_05_2{}
	SELF:oDCHORAFIM:HyperLabel := HyperLabel{#HORAFIM , "Horafim:" , NULL_STRING , "Sm_HORAFIM"}

	SELF:oDCHORA := SINGLELINEEDIT{SELF , ResourceID{ JRO_HORA  , _GetInst() } }
	SELF:oDCHORA:FieldSpec := PADRAO_NUM_05_2{}
	SELF:oDCHORA:TooltipText := "Hora da Ocorrencia"
	SELF:oDCHORA:HyperLabel := HyperLabel{#HORA , "Hora:" , NULL_STRING , "RO_HORA"}

	SELF:oDCdatapar := DateSle{SELF , ResourceID{ JRO_DATAPAR  , _GetInst() } }
	SELF:oDCdatapar:FieldSpec := date_field{}
	SELF:oDCdatapar:HyperLabel := HyperLabel{#datapar , "Datai:" , NULL_STRING , "Sm_DATAI"}

	SELF:oDChorapINI := rightSle{SELF , ResourceID{ JRO_HORAPINI  , _GetInst() } }
	SELF:oDChorapINI:FieldSpec := padrao_num_05_2{}
	SELF:oDChorapINI:HyperLabel := HyperLabel{#horapINI , "Horaini:" , NULL_STRING , "Sm_HORAINI"}

	SELF:oDChorapar := rightSle{SELF , ResourceID{ JRO_HORAPAR  , _GetInst() } }
	SELF:oDChorapar:FieldSpec := padrao_num_05_2{}
	SELF:oDChorapar:HyperLabel := HyperLabel{#horapar , NULL_STRING , NULL_STRING , "Sm_HORAINI"}

	SELF:oDCCLINOME := SINGLELINEEDIT{SELF , ResourceID{ JRO_CLINOME  , _GetInst() } }
	SELF:oDCCLINOME:FieldSpec := PADRAO_CHAR_50{}
	SELF:oDCCLINOME:Background := Brush{ Color{ 255 , 255 , 200 } }
	SELF:oDCCLINOME:TooltipText := "Nome do Cliente"
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCCLINOME:Font( oFont )
	SELF:oDCCLINOME:HyperLabel := HyperLabel{#CLINOME , "Clinome:" , NULL_STRING , "RO_CLINOME"}

	SELF:oDCCLIENTE := SINGLELINEEDIT{SELF , ResourceID{ JRO_CLIENTE  , _GetInst() } }
	SELF:oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCCLIENTE:Background := Brush{ Color{ 255 , 255 , 200 } }
	SELF:oDCCLIENTE:TooltipText := "Numero do Cliente"
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCCLIENTE:Font( oFont )
	SELF:oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE , "Cliente:" , NULL_STRING , "RO_CLIENTE"}

	SELF:oDCSC_CLIENTE := FIXEDTEXT{SELF , ResourceID{ JRO_SC_CLIENTE  , _GetInst() } }
	SELF:oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE , "Cliente:" , NULL_STRING , NULL_STRING}

	SELF:oDCCONCLUIDA := CHECKBOX{SELF , ResourceID{ JRO_CONCLUIDA  , _GetInst() } }
	SELF:oDCCONCLUIDA:FieldSpec := LOGIC_FIELD{}
	SELF:oDCCONCLUIDA:TooltipText := "Indica se Ja foi Concludia"
	SELF:oDCCONCLUIDA:HyperLabel := HyperLabel{#CONCLUIDA , "Concluida" , NULL_STRING , "RO_CONCLUIDA"}

	SELF:oCCCmdConcluida := PUSHBUTTON{SELF , ResourceID{ JRO_CMDCONCLUIDA  , _GetInst() } }
	SELF:oCCCmdConcluida:TooltipText := "Clique Para Concluir o Registro Ocorrencai"
	SELF:oCCCmdConcluida:HyperLabel := HyperLabel{#CmdConcluida , "Concluida" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_SM := FIXEDTEXT{SELF , ResourceID{ JRO_SC_SM  , _GetInst() } }
	SELF:oDCSC_SM:HyperLabel := HyperLabel{#SC_SM , "Sm:" , NULL_STRING , NULL_STRING}

	SELF:oDCSM := SINGLELINEEDIT{SELF , ResourceID{ JRO_SM  , _GetInst() } }
	SELF:oDCSM:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCSM:Background := Brush{ Color{ 255 , 255 , 200 } }
	SELF:oDCSM:TooltipText := "Numero da Solicitaçao Manutençao"
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCSM:Font( oFont )
	SELF:oDCSM:HyperLabel := HyperLabel{#SM , "Sm:" , NULL_STRING , "RO_SM"}

	SELF:oCCTabular := PUSHBUTTON{SELF , ResourceID{ JRO_TABULAR  , _GetInst() } }
	SELF:oCCTabular:TooltipText := "Ver Todos Itens"
	SELF:oCCTabular:HyperLabel := HyperLabel{#Tabular , "Ver Itens" , NULL_STRING , NULL_STRING}

	SELF:oCCAlterar := PUSHBUTTON{SELF , ResourceID{ JRO_ALTERAR  , _GetInst() } }
	SELF:oCCAlterar:TooltipText := "Alterar o Item"
	SELF:oCCAlterar:HyperLabel := HyperLabel{#Alterar , "Alterar" , NULL_STRING , NULL_STRING}

	SELF:oCCExcluir := PUSHBUTTON{SELF , ResourceID{ JRO_EXCLUIR  , _GetInst() } }
	SELF:oCCExcluir:TooltipText := "Excluir um Item"
	SELF:oCCExcluir:HyperLabel := HyperLabel{#Excluir , "Excluir" , NULL_STRING , NULL_STRING}

	SELF:oCCIncluir := PUSHBUTTON{SELF , ResourceID{ JRO_INCLUIR  , _GetInst() } }
	SELF:oCCIncluir:TooltipText := "Incluir Um Item"
	SELF:oCCIncluir:HyperLabel := HyperLabel{#Incluir , "Incluir" , NULL_STRING , NULL_STRING}

	SELF:oCCProximo := PUSHBUTTON{SELF , ResourceID{ JRO_PROXIMO  , _GetInst() } }
	SELF:oCCProximo:TooltipText := "Avança Um Item"
	SELF:oCCProximo:Image := ico_next{}
	SELF:oCCProximo:HyperLabel := HyperLabel{#Proximo , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCAnterior := PUSHBUTTON{SELF , ResourceID{ JRO_ANTERIOR  , _GetInst() } }
	SELF:oCCAnterior:TooltipText := "Retorna um Item"
	SELF:oCCAnterior:Image := ico_previous{}
	SELF:oCCAnterior:HyperLabel := HyperLabel{#Anterior , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCCheckList := PUSHBUTTON{SELF , ResourceID{ JRO_CHECKLIST  , _GetInst() } }
	SELF:oCCCheckList:TooltipText := "Checar Lista de Verificaçao"
	SELF:oCCCheckList:HyperLabel := HyperLabel{#CheckList , "Checar Lista Verificacao" , NULL_STRING , NULL_STRING}

	SELF:oDCREQNOME := SINGLELINEEDIT{SELF , ResourceID{ JRO_REQNOME  , _GetInst() } }
	SELF:oDCREQNOME:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCREQNOME:Background := Brush{ Color{ 255 , 255 , 200 } }
	SELF:oDCREQNOME:TooltipText := "Nome do Solicitante"
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCREQNOME:Font( oFont )
	SELF:oDCREQNOME:HyperLabel := HyperLabel{#REQNOME , "Nome:" , NULL_STRING , "RO_TECNOME"}

	SELF:oDCtheFixedText9 := FIXEDTEXT{SELF , ResourceID{ JRO_THEFIXEDTEXT9  , _GetInst() } }
	SELF:oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9 , "Solicitante" , NULL_STRING , NULL_STRING}

	SELF:oDCGroupBox1 := GROUPBOX{SELF , ResourceID{ JRO_GROUPBOX1  , _GetInst() } }
	SELF:oDCGroupBox1:TooltipText := "Origem da Ocorrencia"
	SELF:oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1 , "Origem" , NULL_STRING , NULL_STRING}

	SELF:oDCGroupBox2 := GROUPBOX{SELF , ResourceID{ JRO_GROUPBOX2  , _GetInst() } }
	SELF:oDCGroupBox2:TooltipText := "Tipo de Ocorrencia"
	SELF:oDCGroupBox2:HyperLabel := HyperLabel{#GroupBox2 , "Tipo de Ocorrencia" , NULL_STRING , NULL_STRING}

	SELF:oDCTIPO := SINGLELINEEDIT{SELF , ResourceID{ JRO_TIPO  , _GetInst() } }
	SELF:oDCTIPO:FieldSpec := PADRAO_CHAR_01{}
	SELF:oDCTIPO:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCTIPO:Font( oFont )
	SELF:oDCTIPO:HyperLabel := HyperLabel{#TIPO , "Ro:" , "TIPO" , "RO_RO"}

	SELF:oDCTIPORO := SINGLELINEEDIT{SELF , ResourceID{ JRO_TIPORO  , _GetInst() } }
	SELF:oDCTIPORO:FieldSpec := PADRAO_CHAR_01{}
	SELF:oDCTIPORO:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCTIPORO:Font( oFont )
	SELF:oDCTIPORO:HyperLabel := HyperLabel{#TIPORO , "Ro:" , "TIPO" , "RO_RO"}

	SELF:oDCFixedText12 := FIXEDTEXT{SELF , ResourceID{ JRO_FIXEDTEXT12  , _GetInst() } }
	SELF:oDCFixedText12:HyperLabel := HyperLabel{#FixedText12 , "Corretiva Preventiva" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText13 := FIXEDTEXT{SELF , ResourceID{ JRO_FIXEDTEXT13  , _GetInst() } }
	SELF:oDCFixedText13:HyperLabel := HyperLabel{#FixedText13 , "Máquina Ferramenta Outras" , NULL_STRING , NULL_STRING}

	SELF:oCCescres1 := PUSHBUTTON{SELF , ResourceID{ JRO_ESCRES1  , _GetInst() } }
	SELF:oCCescres1:TooltipText := "Clique Para Escolher um tecnico"
	SELF:oCCescres1:HyperLabel := HyperLabel{#escres1 , "..." , NULL_STRING , NULL_STRING}

	SELF:oCCescres2 := PUSHBUTTON{SELF , ResourceID{ JRO_ESCRES2  , _GetInst() } }
	SELF:oCCescres2:TooltipText := "Clique para Escolher o Solciitante"
	SELF:oCCescres2:HyperLabel := HyperLabel{#escres2 , "..." , NULL_STRING , NULL_STRING}

	SELF:oCCbusca := PUSHBUTTON{SELF , ResourceID{ JRO_BUSCA  , _GetInst() } }
	SELF:oCCbusca:TooltipText := "Localizar  Registro Pelo Numero"
	SELF:oCCbusca:Image := ico_find{}
	SELF:oCCbusca:HyperLabel := HyperLabel{#busca , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCSC_RO := FIXEDTEXT{SELF , ResourceID{ JRO_SC_RO  , _GetInst() } }
	SELF:oDCSC_RO:HyperLabel := HyperLabel{#SC_RO , "Ro:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_AREA := FIXEDTEXT{SELF , ResourceID{ JRO_SC_AREA  , _GetInst() } }
	SELF:oDCSC_AREA:HyperLabel := HyperLabel{#SC_AREA , "Area:" , NULL_STRING , NULL_STRING}

	SELF:oDCRO := SINGLELINEEDIT{SELF , ResourceID{ JRO_RO  , _GetInst() } }
	SELF:oDCRO:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCRO:Background := Brush{ Color{ 255 , 255 , 200 } }
	SELF:oDCRO:TooltipText := "Numero do Registro de Ocorrencia"
	oFont := Font{  , 12 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCRO:Font( oFont )
	SELF:oDCRO:HyperLabel := HyperLabel{#RO , "Ro:" , NULL_STRING , "RO_RO"}

	SELF:oDCSC_FERRAM := FIXEDTEXT{SELF , ResourceID{ JRO_SC_FERRAM  , _GetInst() } }
	SELF:oDCSC_FERRAM:HyperLabel := HyperLabel{#SC_FERRAM , "Ferramenta/Maquina" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_HORA := FIXEDTEXT{SELF , ResourceID{ JRO_SC_HORA  , _GetInst() } }
	SELF:oDCSC_HORA:HyperLabel := HyperLabel{#SC_HORA , "Qtde Hora:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_DATA := FIXEDTEXT{SELF , ResourceID{ JRO_SC_DATA  , _GetInst() } }
	SELF:oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA , "Data:" , NULL_STRING , NULL_STRING}

	SELF:oDCFERRAM := SINGLELINEEDIT{SELF , ResourceID{ JRO_FERRAM  , _GetInst() } }
	SELF:oDCFERRAM:FieldSpec := PADRAO_CHAR_24{}
	SELF:oDCFERRAM:Background := Brush{ Color{ 255 , 255 , 200 } }
	SELF:oDCFERRAM:TooltipText := "Codigo da Marquina/Ferramenta"
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCFERRAM:Font( oFont )
	SELF:oDCFERRAM:HyperLabel := HyperLabel{#FERRAM , "Codigo" , NULL_STRING , "RO_FERRAM"}

	SELF:oDCNOME := SINGLELINEEDIT{SELF , ResourceID{ JRO_NOME  , _GetInst() } }
	SELF:oDCNOME:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCNOME:Background := Brush{ Color{ 255 , 255 , 200 } }
	SELF:oDCNOME:TooltipText := "Descriçao da Maquina/Ferramenta"
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCNOME:Font( oFont )
	SELF:oDCNOME:HyperLabel := HyperLabel{#NOME , "Nome:" , NULL_STRING , "RO_NOME"}

	SELF:oDCtheFixedText8 := FIXEDTEXT{SELF , ResourceID{ JRO_THEFIXEDTEXT8  , _GetInst() } }
	SELF:oDCtheFixedText8:HyperLabel := HyperLabel{#theFixedText8 , "Tecnico" , NULL_STRING , NULL_STRING}

	SELF:oDCTECNOME := SINGLELINEEDIT{SELF , ResourceID{ JRO_TECNOME  , _GetInst() } }
	SELF:oDCTECNOME:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCTECNOME:Background := Brush{ Color{ 255 , 255 , 200 } }
	SELF:oDCTECNOME:TooltipText := "Nome do Tecnico"
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCTECNOME:Font( oFont )
	SELF:oDCTECNOME:HyperLabel := HyperLabel{#TECNOME , "Nome:" , NULL_STRING , "RO_TECNOME"}

	SELF:oDCSC_DEFEITO := FIXEDTEXT{SELF , ResourceID{ JRO_SC_DEFEITO  , _GetInst() } }
	SELF:oDCSC_DEFEITO:HyperLabel := HyperLabel{#SC_DEFEITO , "Defeito Apresentado ou Descrição Manutenção" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_SOLUCAO := FIXEDTEXT{SELF , ResourceID{ JRO_SC_SOLUCAO  , _GetInst() } }
	SELF:oDCSC_SOLUCAO:HyperLabel := HyperLabel{#SC_SOLUCAO , "Solução:" , NULL_STRING , NULL_STRING}

	SELF:oCCPEGsol := PUSHBUTTON{SELF , ResourceID{ JRO_PEGSOL  , _GetInst() } }
	SELF:oCCPEGsol:HyperLabel := HyperLabel{#PEGsol , "-->" , NULL_STRING , NULL_STRING}

	SELF:oCCpegtec := PUSHBUTTON{SELF , ResourceID{ JRO_PEGTEC  , _GetInst() } }
	SELF:oCCpegtec:HyperLabel := HyperLabel{#pegtec , "-->" , NULL_STRING , NULL_STRING}

	SELF:oCCpegcli := PUSHBUTTON{SELF , ResourceID{ JRO_PEGCLI  , _GetInst() } }
	SELF:oCCpegcli:HyperLabel := HyperLabel{#pegcli , "-->" , NULL_STRING , NULL_STRING}

	SELF:oCCpegfer := PUSHBUTTON{SELF , ResourceID{ JRO_PEGFER  , _GetInst() } }
	SELF:oCCpegfer:HyperLabel := HyperLabel{#pegfer , "-->" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText10 := FIXEDTEXT{SELF , ResourceID{ JRO_THEFIXEDTEXT10  , _GetInst() } }
	SELF:oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10 , "Hora" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText12 := FIXEDTEXT{SELF , ResourceID{ JRO_THEFIXEDTEXT12  , _GetInst() } }
	SELF:oDCtheFixedText12:HyperLabel := HyperLabel{#theFixedText12 , "Data" , NULL_STRING , NULL_STRING}

	SELF:oDCtheGroupBox3 := GROUPBOX{SELF , ResourceID{ JRO_THEGROUPBOX3  , _GetInst() } }
	SELF:oDCtheGroupBox3:HyperLabel := HyperLabel{#theGroupBox3 , "Termino" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText13 := FIXEDTEXT{SELF , ResourceID{ JRO_THEFIXEDTEXT13  , _GetInst() } }
	SELF:oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13 , "Hora" , NULL_STRING , NULL_STRING}

	SELF:oDCtheGroupBox2 := GROUPBOX{SELF , ResourceID{ JRO_THEGROUPBOX2  , _GetInst() } }
	SELF:oDCtheGroupBox2:HyperLabel := HyperLabel{#theGroupBox2 , "Início" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText6 := FIXEDTEXT{SELF , ResourceID{ JRO_THEFIXEDTEXT6  , _GetInst() } }
	SELF:oDCtheFixedText6:HyperLabel := HyperLabel{#theFixedText6 , "Data" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText14 := FIXEDTEXT{SELF , ResourceID{ JRO_THEFIXEDTEXT14  , _GetInst() } }
	SELF:oDCtheFixedText14:HyperLabel := HyperLabel{#theFixedText14 , "Hora" , NULL_STRING , NULL_STRING}

	SELF:oDCtheGroupBox4 := GROUPBOX{SELF , ResourceID{ JRO_THEGROUPBOX4  , _GetInst() } }
	SELF:oDCtheGroupBox4:HyperLabel := HyperLabel{#theGroupBox4 , "Parada" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText15 := FIXEDTEXT{SELF , ResourceID{ JRO_THEFIXEDTEXT15  , _GetInst() } }
	SELF:oDCtheFixedText15:HyperLabel := HyperLabel{#theFixedText15 , "Data" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_HORA2 := FIXEDTEXT{SELF , ResourceID{ JRO_SC_HORA2  , _GetInst() } }
	SELF:oDCSC_HORA2:HyperLabel := HyperLabel{#SC_HORA2 , "Qtde Hora:" , NULL_STRING , NULL_STRING}

	SELF:oCCordem := PUSHBUTTON{SELF , ResourceID{ JRO_ORDEM  , _GetInst() } }
	SELF:oCCordem:TooltipText := "Ordenar Por Numero"
	SELF:oCCordem:Image := ico_az{}
	SELF:oCCordem:HyperLabel := HyperLabel{#ordem , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:Caption := "Registro de Ocorrencia"
	SELF:Menu := STANDARDSHELLMENU{}
	SELF:ClipperKeys := TRUE
	SELF:HyperLabel := HyperLabel{#JRO , "Registro de Ocorrencia" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF

	SELF:Browser := DataBrowser{SELF}

	SELF:oDBREQNUM := DataColumn{PADRAO_NUM_08{}}
	SELF:oDBREQNUM:Width := 8
	SELF:oDBREQNUM:HyperLabel := SELF:oDCREQNUM:HyperLabel
	SELF:oDBREQNUM:Caption := "Ro:"
	SELF:Browser:AddColumn(SELF:oDBREQNUM)

	SELF:oDBFERRAM := DataColumn{PADRAO_CHAR_24{}}
	SELF:oDBFERRAM:Width := 24
	SELF:oDBFERRAM:HyperLabel := SELF:oDCFERRAM:HyperLabel
	SELF:oDBFERRAM:Caption := "Codigo"
	SELF:Browser:AddColumn(SELF:oDBFERRAM)

	SELF:oDBNOME := DataColumn{PADRAO_CHAR_40{}}
	SELF:oDBNOME:Width := 23
	SELF:oDBNOME:HyperLabel := SELF:oDCNOME:HyperLabel
	SELF:oDBNOME:Caption := "Nome:"
	SELF:Browser:AddColumn(SELF:oDBNOME)

	SELF:oDBDEFEITO := DataColumn{PADRAO_CHAR_80{}}
	SELF:oDBDEFEITO:Width := 27
	SELF:oDBDEFEITO:HyperLabel := SELF:oDCDEFEITO:HyperLabel
	SELF:oDBDEFEITO:Caption := "Defeito:"
	SELF:Browser:AddColumn(SELF:oDBDEFEITO)

	SELF:ViewAs(#FormView)

	SELF:oSFJROI := JROI{SELF , JRO_JROI }
	SELF:oSFJROI:Show()

	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS NOME
RETURN SELF:FieldGet( #NOME )

ASSIGN NOME( uValue )
SELF:FieldPut( #NOME , uValue )

METHOD ordem( ) 
	SELF:KeyFind()

ACCESS REQNOME
RETURN SELF:FieldGet( #REQNOME )

ASSIGN REQNOME( uValue )
SELF:FieldPut( #REQNOME , uValue )

ACCESS REQNUM
RETURN SELF:FieldGet( #REQNUM )

ASSIGN REQNUM( uValue )
SELF:FieldPut( #REQNUM , uValue )

ACCESS RO
RETURN SELF:FieldGet( #RO )

ASSIGN RO( uValue )
SELF:FieldPut( #RO , uValue )

ACCESS SM
RETURN SELF:FieldGet( #SM )

ASSIGN SM( uValue )
SELF:FieldPut( #SM , uValue )

ACCESS SOLUCA2
RETURN SELF:FieldGet( #SOLUCA2 )

ASSIGN SOLUCA2( uValue )
SELF:FieldPut( #SOLUCA2 , uValue )

ACCESS SOLUCA3
RETURN SELF:FieldGet( #SOLUCA3 )

ASSIGN SOLUCA3( uValue )
SELF:FieldPut( #SOLUCA3 , uValue )

ACCESS SOLUCA4
RETURN SELF:FieldGet( #SOLUCA4 )

ASSIGN SOLUCA4( uValue )
SELF:FieldPut( #SOLUCA4 , uValue )

ACCESS SOLUCAO
RETURN SELF:FieldGet( #SOLUCAO )

ASSIGN SOLUCAO( uValue )
SELF:FieldPut( #SOLUCAO , uValue )

ACCESS TECNICO
RETURN SELF:FieldGet( #TECNICO )

ASSIGN TECNICO( uValue )
SELF:FieldPut( #TECNICO , uValue )

ACCESS TECNOME
RETURN SELF:FieldGet( #TECNOME )

ASSIGN TECNOME( uValue )
SELF:FieldPut( #TECNOME , uValue )

ACCESS theSingleLineEdit11() 
RETURN SELF:FieldGet(#theSingleLineEdit11)


ACCESS theSingleLineEdit12() 
RETURN SELF:FieldGet(#theSingleLineEdit12)


ACCESS TIPO
RETURN SELF:FieldGet( #TIPO )

ASSIGN TIPO( uValue )
SELF:FieldPut( #TIPO , uValue )

ACCESS TIPORO
RETURN SELF:FieldGet( #TIPORO )

ASSIGN TIPORO( uValue )
SELF:FieldPut( #TIPORO , uValue )

END CLASS
