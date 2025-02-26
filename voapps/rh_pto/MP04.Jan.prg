#region DEFINES
STATIC DEFINE JTERH_ADMITIDO := 102
STATIC DEFINE JTERH_ANTIGO := 148
STATIC DEFINE JTERH_ANTIGO1 := 165
STATIC DEFINE JTERH_ARE2 := 130
STATIC DEFINE JTERH_AREA := 117
STATIC DEFINE JTERH_BNUMERO := 124
STATIC DEFINE JTERH_CHECKCPF := 182
STATIC DEFINE JTERH_CMDVERTREIN := 163
STATIC DEFINE JTERH_CMDVERTREIN1 := 174
STATIC DEFINE JTERH_COGTEC := 101
STATIC DEFINE JTERH_CPF := 181
STATIC DEFINE JTERH_CURSO := 129
STATIC DEFINE JTERH_DATAEXM := 161
STATIC DEFINE JTERH_DATAHAB := 159
STATIC DEFINE JTERH_DATAVIS := 160
STATIC DEFINE JTERH_DATTRANSF := 179
STATIC DEFINE JTERH_DEMITIDO := 103
STATIC DEFINE JTERH_DEPTO2 := 177
STATIC DEFINE JTERH_EMAILEXT := 122
STATIC DEFINE JTERH_EMAILINT := 121
STATIC DEFINE JTERH_EMPILHAD := 135
STATIC DEFINE JTERH_ESCCOMOB := 152
STATIC DEFINE JTERH_ESCCOMPR := 151
STATIC DEFINE JTERH_ESCCUR := 128
STATIC DEFINE JTERH_ESCRAIS := 138
STATIC DEFINE JTERH_EXCLUIR := 126
STATIC DEFINE JTERH_EXCLUIR1 := 132
STATIC DEFINE JTERH_FIXEDTEXT22 := 170
STATIC DEFINE JTERH_FIXEDTEXT23 := 171
STATIC DEFINE JTERH_FIXEDTEXT24 := 172
STATIC DEFINE JTERH_FIXEDTEXT25 := 173
STATIC DEFINE JTERH_FOTO := 158
STATIC DEFINE JTERH_FOTO1 := 176
STATIC DEFINE JTERH_FT6 := 110
STATIC DEFINE JTERH_FT7 := 111
STATIC DEFINE JTERH_FT8 := 149
STATIC DEFINE JTERH_IMPORTAR := 147
STATIC DEFINE JTERH_IMPORTAR1 := 164
STATIC DEFINE JTERH_IMPORTAR2 := 167
STATIC DEFINE JTERH_INCLUIR := 127
STATIC DEFINE JTERH_INCLUIR1 := 133
STATIC DEFINE JTERH_JMP04A := 131
STATIC DEFINE JTERH_JMP04C := 125
STATIC DEFINE JTERH_MATANT := 162
STATIC DEFINE JTERH_MATANT1 := 166
STATIC DEFINE JTERH_NOMTEC := 104
STATIC DEFINE JTERH_NUMEMPANT := 178
STATIC DEFINE JTERH_NUMFOLHA := 150
STATIC DEFINE JTERH_OBSESCOLA := 144
STATIC DEFINE JTERH_OBSPOS := 153
STATIC DEFINE JTERH_OBSTECNO := 145
STATIC DEFINE JTERH_OBSUNIVER := 146
STATIC DEFINE JTERH_OLDEMP := 168
STATIC DEFINE JTERH_OLDEMP1 := 169
STATIC DEFINE JTERH_PEGCURDES := 155
STATIC DEFINE JTERH_PEGCURDES1 := 156
STATIC DEFINE JTERH_PONTOROL := 136
STATIC DEFINE JTERH_PORNUMERO := 123
STATIC DEFINE JTERH_SC_ADMITIDO1 := 180
STATIC DEFINE JTERH_SC_AREA := 114
STATIC DEFINE JTERH_SC_AREA1 := 141
STATIC DEFINE JTERH_SC_AREA2 := 142
STATIC DEFINE JTERH_SC_AREA3 := 143
STATIC DEFINE JTERH_SC_AREA4 := 154
STATIC DEFINE JTERH_SC_COGTEC := 109
STATIC DEFINE JTERH_SC_COGTEC1 := 119
STATIC DEFINE JTERH_SC_COGTEC2 := 120
STATIC DEFINE JTERH_SC_DESTINO2 := 157
STATIC DEFINE JTERH_SC_DESTINO3 := 175
STATIC DEFINE JTERH_SC_NOMTEC := 112
STATIC DEFINE JTERH_SC_NOMTEC1 := 105
STATIC DEFINE JTERH_SC_NOMTEC4 := 106
STATIC DEFINE JTERH_SC_NOMTEC5 := 107
STATIC DEFINE JTERH_SC_SETOR := 115
STATIC DEFINE JTERH_SC_SETOR1 := 137
STATIC DEFINE JTERH_SC_SETOR2 := 139
STATIC DEFINE JTERH_SC_SETOR3 := 140
STATIC DEFINE JTERH_SC_TABTEC := 113
STATIC DEFINE JTERH_SC_TECNICO := 108
STATIC DEFINE JTERH_SETOR := 118
STATIC DEFINE JTERH_SOLDADOR := 134
STATIC DEFINE JTERH_TABTEC := 116
STATIC DEFINE JTERH_TECNICO := 100
#endregion

PARTIAL CLASS JTERH INHERIT MYDataWindow
PROTECT oDBTECNICO AS DataColumn
PROTECT oDBNOMTEC AS DataColumn
PROTECT oDCTECNICO AS SINGLELINEEDIT
PROTECT oDCCOGTEC AS SINGLELINEEDIT
PROTECT oDCADMITIDO AS DATETIMEPICKER
PROTECT oDCDEMITIDO AS DateSle
PROTECT oDCNOMTEC AS SINGLELINEEDIT
PROTECT oDCSC_NOMTEC1 AS FIXEDTEXT
PROTECT oDCSC_NOMTEC4 AS FIXEDTEXT
PROTECT oDCSC_NOMTEC5 AS FIXEDTEXT
PROTECT oDCSC_TECNICO AS FIXEDTEXT
PROTECT oDCSC_COGTEC AS FIXEDTEXT
PROTECT oDCFT6 AS FIXEDTEXT
PROTECT oDCFT7 AS FIXEDTEXT
PROTECT oDCSC_NOMTEC AS FIXEDTEXT
PROTECT oDCSC_TABTEC AS FIXEDTEXT
PROTECT oDCSC_AREA AS FIXEDTEXT
PROTECT oDCSC_SETOR AS FIXEDTEXT
PROTECT oDCTABTEC AS COMBOBOX
PROTECT oDCAREA AS COMBOBOX
PROTECT oDCSETOR AS COMBOBOX
PROTECT oDCSC_COGTEC1 AS FIXEDTEXT
PROTECT oDCSC_COGTEC2 AS FIXEDTEXT
PROTECT oDCEMAILINT AS SINGLELINEEDIT
PROTECT oDCEMAILEXT AS SINGLELINEEDIT
PROTECT oCCpornumero AS PUSHBUTTON
PROTECT oCCbnumero AS PUSHBUTTON
PROTECT oSFjmp04c AS jmp04c
PROTECT oCCEXCLUIR AS PUSHBUTTON
PROTECT oCCINCLUIR AS PUSHBUTTON
PROTECT oCCesccur AS PUSHBUTTON
PROTECT oDCCURSO AS SINGLELINEEDIT
PROTECT oDCARE2 AS COMBOBOX
PROTECT oSFjmp04a AS jmp04a
PROTECT oCCEXCLUIR1 AS PUSHBUTTON
PROTECT oCCINCLUIR1 AS PUSHBUTTON
PROTECT oDCSOLDADOR AS CHECKBOX
PROTECT oDCEMPILHAD AS CHECKBOX
PROTECT oDCPONTOROL AS CHECKBOX
PROTECT oDCSC_SETOR1 AS FIXEDTEXT
PROTECT oDCESCRAIS AS COMBOBOX
PROTECT oDCSC_SETOR2 AS FIXEDTEXT
PROTECT oDCSC_SETOR3 AS FIXEDTEXT
PROTECT oDCSC_AREA1 AS FIXEDTEXT
PROTECT oDCSC_AREA2 AS FIXEDTEXT
PROTECT oDCSC_AREA3 AS FIXEDTEXT
PROTECT oDCOBSESCOLA AS SINGLELINEEDIT
PROTECT oDCOBSTECNO AS SINGLELINEEDIT
PROTECT oDCOBSUNIVER AS SINGLELINEEDIT
PROTECT oCCimportar AS PUSHBUTTON
PROTECT oDCantigo AS rightSle
PROTECT oDCFT8 AS FIXEDTEXT
PROTECT oDCnumfolha AS rightSle
PROTECT oDCESCCOMPR AS CHECKBOX
PROTECT oDCESCCOMOB AS SINGLELINEEDIT
PROTECT oDCOBSPOS AS SINGLELINEEDIT
PROTECT oDCSC_AREA4 AS FIXEDTEXT
PROTECT oCCpegcurdes AS PUSHBUTTON
PROTECT oCCpegcurdes1 AS PUSHBUTTON
PROTECT oDCSC_DESTINO2 AS FIXEDTEXT
PROTECT oCCfoto AS PUSHBUTTON
PROTECT oDCDATAHAB AS DateSle
PROTECT oDCDATAVIS AS DateSle
PROTECT oDCDATAEXM AS DateSle
PROTECT oCCmatant AS PUSHBUTTON
PROTECT oCCcmdvertrein AS PUSHBUTTON
PROTECT oCCimportar1 AS PUSHBUTTON
PROTECT oDCantigo1 AS rightSle
PROTECT oCCmatant1 AS PUSHBUTTON
PROTECT oCCimportar2 AS PUSHBUTTON
PROTECT oDColdemp AS rightSle
PROTECT oDColdemp1 AS rightSle
PROTECT oDCFixedText22 AS FIXEDTEXT
PROTECT oDCFixedText23 AS FIXEDTEXT
PROTECT oDCFixedText24 AS FIXEDTEXT
PROTECT oDCFixedText25 AS FIXEDTEXT
PROTECT oCCcmdvertrein1 AS PUSHBUTTON
PROTECT oDCSC_DESTINO3 AS FIXEDTEXT
PROTECT oCCfoto1 AS PUSHBUTTON
PROTECT oDCDEPTO2 AS rightSle
PROTECT oDCNUMEMPANT AS rightSle
PROTECT oDCDATTRANSF AS DateSle
PROTECT oDCSC_ADMITIDO1 AS FIXEDTEXT
PROTECT oDCcpf AS rightSle
PROTECT oCCcheckcPF AS PUSHBUTTON

// User code starts here (DO NOT remove this line)  ##USER##

ACCESS antigo
RETURN SELF:FieldGet( #antigo )

ASSIGN antigo( uValue )
SELF:FieldPut( #antigo , uValue )

ACCESS antigo1
RETURN SELF:FieldGet( #antigo1 )

ASSIGN antigo1( uValue )
SELF:FieldPut( #antigo1 , uValue )

ACCESS ARE2
RETURN SELF:FieldGet( #ARE2 )

ASSIGN ARE2( uValue )
SELF:FieldPut( #ARE2 , uValue )

ACCESS AREA
RETURN SELF:FieldGet( #AREA )

ASSIGN AREA( uValue )
SELF:FieldPut( #AREA , uValue )

ACCESS COGTEC
RETURN SELF:FieldGet( #COGTEC )

ASSIGN COGTEC( uValue )
SELF:FieldPut( #COGTEC , uValue )

ACCESS cpf
RETURN SELF:FieldGet( #cpf )

ASSIGN cpf( uValue )
SELF:FieldPut( #cpf , uValue )

ACCESS CURSO
RETURN SELF:FieldGet( #CURSO )

ASSIGN CURSO( uValue )
SELF:FieldPut( #CURSO , uValue )

ACCESS DATAEXM
RETURN SELF:FieldGet( #DATAEXM )

ASSIGN DATAEXM( uValue )
SELF:FieldPut( #DATAEXM , uValue )

ACCESS DATAHAB
RETURN SELF:FieldGet( #DATAHAB )

ASSIGN DATAHAB( uValue )
SELF:FieldPut( #DATAHAB , uValue )

ACCESS DATAVIS
RETURN SELF:FieldGet( #DATAVIS )

ASSIGN DATAVIS( uValue )
SELF:FieldPut( #DATAVIS , uValue )

ACCESS DATTRANSF
RETURN SELF:FieldGet( #DATTRANSF )

ASSIGN DATTRANSF( uValue )
SELF:FieldPut( #DATTRANSF , uValue )

ACCESS DEMITIDO
RETURN SELF:FieldGet( #DEMITIDO )

ASSIGN DEMITIDO( uValue )
SELF:FieldPut( #DEMITIDO , uValue )

ACCESS DEPTO2
RETURN SELF:FieldGet( #DEPTO2 )

ASSIGN DEPTO2( uValue )
SELF:FieldPut( #DEPTO2 , uValue )

ACCESS EMAILEXT
RETURN SELF:FieldGet( #EMAILEXT )

ASSIGN EMAILEXT( uValue )
SELF:FieldPut( #EMAILEXT , uValue )

ACCESS EMAILINT
RETURN SELF:FieldGet( #EMAILINT )

ASSIGN EMAILINT( uValue )
SELF:FieldPut( #EMAILINT , uValue )

ACCESS EMPILHAD
RETURN SELF:FieldGet( #EMPILHAD )

ASSIGN EMPILHAD( uValue )
SELF:FieldPut( #EMPILHAD , uValue )

ACCESS ESCCOMOB
RETURN SELF:FieldGet( #ESCCOMOB )

ASSIGN ESCCOMOB( uValue )
SELF:FieldPut( #ESCCOMOB , uValue )

ACCESS ESCCOMPR
RETURN SELF:FieldGet( #ESCCOMPR )

ASSIGN ESCCOMPR( uValue )
SELF:FieldPut( #ESCCOMPR , uValue )

ACCESS ESCRAIS
RETURN SELF:FieldGet( #ESCRAIS )

ASSIGN ESCRAIS( uValue )
SELF:FieldPut( #ESCRAIS , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"JTERH" , _GetInst()},iCtlID)

	SELF:oDCTECNICO := SINGLELINEEDIT{SELF , ResourceID{ JTERH_TECNICO  , _GetInst() } }
	SELF:oDCTECNICO:FieldSpec := PADRAO_NUM_05{}
	SELF:oDCTECNICO:Background := Brush{ Color{ 253 , 254 , 220 } }
	SELF:oDCTECNICO:HyperLabel := HyperLabel{#TECNICO , "Tecnico:" , NULL_STRING , "MP04_TECNICO"}

	SELF:oDCCOGTEC := SINGLELINEEDIT{SELF , ResourceID{ JTERH_COGTEC  , _GetInst() } }
	SELF:oDCCOGTEC:FieldSpec := PADRAO_CHAR_12{}
	SELF:oDCCOGTEC:HyperLabel := HyperLabel{#COGTEC , "Cognome" , NULL_STRING , "MP04_COGTEC"}

	SELF:oDCADMITIDO := DATETIMEPICKER{SELF , ResourceID{ JTERH_ADMITIDO  , _GetInst() } }
	SELF:oDCADMITIDO:FieldSpec := DATE_FIELD{}
	SELF:oDCADMITIDO:HyperLabel := HyperLabel{#ADMITIDO , "Admitido" , "Admitido" , NULL_STRING}

	SELF:oDCDEMITIDO := DateSle{SELF , ResourceID{ JTERH_DEMITIDO  , _GetInst() } }
	SELF:oDCDEMITIDO:FieldSpec := DATE_FIELD{}
	SELF:oDCDEMITIDO:HyperLabel := HyperLabel{#DEMITIDO , "Demitido" , NULL_STRING , "MP04_COGTEC"}

	SELF:oDCNOMTEC := SINGLELINEEDIT{SELF , ResourceID{ JTERH_NOMTEC  , _GetInst() } }
	SELF:oDCNOMTEC:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCNOMTEC:HyperLabel := HyperLabel{#NOMTEC , "Nome" , NULL_STRING , "MP04_NOMTEC"}

	SELF:oDCSC_NOMTEC1 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_NOMTEC1  , _GetInst() } }
	SELF:oDCSC_NOMTEC1:HyperLabel := HyperLabel{#SC_NOMTEC1 , "Exame M�dico" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_NOMTEC4 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_NOMTEC4  , _GetInst() } }
	SELF:oDCSC_NOMTEC4:HyperLabel := HyperLabel{#SC_NOMTEC4 , "Exame Vista:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_NOMTEC5 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_NOMTEC5  , _GetInst() } }
	SELF:oDCSC_NOMTEC5:HyperLabel := HyperLabel{#SC_NOMTEC5 , "Habilita��o" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_TECNICO := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_TECNICO  , _GetInst() } }
	SELF:oDCSC_TECNICO:HyperLabel := HyperLabel{#SC_TECNICO , "Numero" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_COGTEC := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_COGTEC  , _GetInst() } }
	SELF:oDCSC_COGTEC:HyperLabel := HyperLabel{#SC_COGTEC , "Cognome:" , NULL_STRING , NULL_STRING}

	SELF:oDCFT6 := FIXEDTEXT{SELF , ResourceID{ JTERH_FT6  , _GetInst() } }
	SELF:oDCFT6:HyperLabel := HyperLabel{#FT6 , "Admitido" , NULL_STRING , NULL_STRING}

	SELF:oDCFT7 := FIXEDTEXT{SELF , ResourceID{ JTERH_FT7  , _GetInst() } }
	SELF:oDCFT7:HyperLabel := HyperLabel{#FT7 , "Demitido" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_NOMTEC := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_NOMTEC  , _GetInst() } }
	SELF:oDCSC_NOMTEC:HyperLabel := HyperLabel{#SC_NOMTEC , "Nome:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_TABTEC := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_TABTEC  , _GetInst() } }
	SELF:oDCSC_TABTEC:HyperLabel := HyperLabel{#SC_TABTEC , "Fun��o/Tab Mao Obra" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_AREA := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_AREA  , _GetInst() } }
	SELF:oDCSC_AREA:HyperLabel := HyperLabel{#SC_AREA , "�rea:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_SETOR := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_SETOR  , _GetInst() } }
	SELF:oDCSC_SETOR:HyperLabel := HyperLabel{#SC_SETOR , "Setor:" , NULL_STRING , NULL_STRING}

	SELF:oDCTABTEC := COMBOBOX{SELF , ResourceID{ JTERH_TABTEC  , _GetInst() } }
	SELF:oDCTABTEC:FieldSpec := PADRAO_CHAR_12{}
	SELF:oDCTABTEC:HyperLabel := HyperLabel{#TABTEC , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCAREA := COMBOBOX{SELF , ResourceID{ JTERH_AREA  , _GetInst() } }
	SELF:oDCAREA:FieldSpec := PADRAO_CHAR_02{}
	SELF:oDCAREA:HyperLabel := HyperLabel{#AREA , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCSETOR := COMBOBOX{SELF , ResourceID{ JTERH_SETOR  , _GetInst() } }
	SELF:oDCSETOR:FieldSpec := PADRAO_CHAR_12{}
	SELF:oDCSETOR:HyperLabel := HyperLabel{#SETOR , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCSC_COGTEC1 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_COGTEC1  , _GetInst() } }
	SELF:oDCSC_COGTEC1:HyperLabel := HyperLabel{#SC_COGTEC1 , "Email Interno:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_COGTEC2 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_COGTEC2  , _GetInst() } }
	SELF:oDCSC_COGTEC2:HyperLabel := HyperLabel{#SC_COGTEC2 , "Email Externo:" , NULL_STRING , NULL_STRING}

	SELF:oDCEMAILINT := SINGLELINEEDIT{SELF , ResourceID{ JTERH_EMAILINT  , _GetInst() } }
	SELF:oDCEMAILINT:FieldSpec := PADRAO_CHAR_50{}
	SELF:oDCEMAILINT:HyperLabel := HyperLabel{#EMAILINT , "Cognome" , NULL_STRING , "MP04_COGTEC"}

	SELF:oDCEMAILEXT := SINGLELINEEDIT{SELF , ResourceID{ JTERH_EMAILEXT  , _GetInst() } }
	SELF:oDCEMAILEXT:FieldSpec := PADRAO_CHAR_50{}
	SELF:oDCEMAILEXT:HyperLabel := HyperLabel{#EMAILEXT , "Cognome" , NULL_STRING , "MP04_COGTEC"}

	SELF:oCCpornumero := PUSHBUTTON{SELF , ResourceID{ JTERH_PORNUMERO  , _GetInst() } }
	SELF:oCCpornumero:Image := ico_az{}
	SELF:oCCpornumero:HyperLabel := HyperLabel{#pornumero , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCbnumero := PUSHBUTTON{SELF , ResourceID{ JTERH_BNUMERO  , _GetInst() } }
	SELF:oCCbnumero:Image := ico_find{}
	SELF:oCCbnumero:HyperLabel := HyperLabel{#bnumero , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCEXCLUIR := PUSHBUTTON{SELF , ResourceID{ JTERH_EXCLUIR  , _GetInst() } }
	SELF:oCCEXCLUIR:HyperLabel := HyperLabel{#EXCLUIR , "Excluir" , NULL_STRING , NULL_STRING}

	SELF:oCCINCLUIR := PUSHBUTTON{SELF , ResourceID{ JTERH_INCLUIR  , _GetInst() } }
	SELF:oCCINCLUIR:HyperLabel := HyperLabel{#INCLUIR , "Incluir" , NULL_STRING , NULL_STRING}

	SELF:oCCesccur := PUSHBUTTON{SELF , ResourceID{ JTERH_ESCCUR  , _GetInst() } }
	SELF:oCCesccur:HyperLabel := HyperLabel{#esccur , "..." , NULL_STRING , NULL_STRING}

	SELF:oDCCURSO := SINGLELINEEDIT{SELF , ResourceID{ JTERH_CURSO  , _GetInst() } }
	SELF:oDCCURSO:FieldSpec := PADRAO_CHAR_20{}
	SELF:oDCCURSO:HyperLabel := HyperLabel{#CURSO , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCARE2 := COMBOBOX{SELF , ResourceID{ JTERH_ARE2  , _GetInst() } }
	SELF:oDCARE2:FieldSpec := PADRAO_CHAR_02{}
	SELF:oDCARE2:HyperLabel := HyperLabel{#ARE2 , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCEXCLUIR1 := PUSHBUTTON{SELF , ResourceID{ JTERH_EXCLUIR1  , _GetInst() } }
	SELF:oCCEXCLUIR1:HyperLabel := HyperLabel{#EXCLUIR1 , "Excluir" , NULL_STRING , NULL_STRING}

	SELF:oCCINCLUIR1 := PUSHBUTTON{SELF , ResourceID{ JTERH_INCLUIR1  , _GetInst() } }
	SELF:oCCINCLUIR1:HyperLabel := HyperLabel{#INCLUIR1 , "Incluir" , NULL_STRING , NULL_STRING}

	SELF:oDCSOLDADOR := CHECKBOX{SELF , ResourceID{ JTERH_SOLDADOR  , _GetInst() } }
	SELF:oDCSOLDADOR:FieldSpec := LOGIC_FIELD{}
	SELF:oDCSOLDADOR:HyperLabel := HyperLabel{#SOLDADOR , "Soldador" , NULL_STRING , "Mp04_SOLDADOR"}

	SELF:oDCEMPILHAD := CHECKBOX{SELF , ResourceID{ JTERH_EMPILHAD  , _GetInst() } }
	SELF:oDCEMPILHAD:FieldSpec := LOGIC_FIELD{}
	SELF:oDCEMPILHAD:HyperLabel := HyperLabel{#EMPILHAD , "Empilhadeira" , NULL_STRING , "Mp04_EMPILHAD"}

	SELF:oDCPONTOROL := CHECKBOX{SELF , ResourceID{ JTERH_PONTOROL  , _GetInst() } }
	SELF:oDCPONTOROL:FieldSpec := LOGIC_FIELD{}
	SELF:oDCPONTOROL:HyperLabel := HyperLabel{#PONTOROL , "Ponto Rolante" , NULL_STRING , "Mp04_PONTOROL"}

	SELF:oDCSC_SETOR1 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_SETOR1  , _GetInst() } }
	SELF:oDCSC_SETOR1:HyperLabel := HyperLabel{#SC_SETOR1 , "Escolaridade" , NULL_STRING , NULL_STRING}

	SELF:oDCESCRAIS := COMBOBOX{SELF , ResourceID{ JTERH_ESCRAIS  , _GetInst() } }
	SELF:oDCESCRAIS:FieldSpec := PADRAO_CHAR_02{}
	SELF:oDCESCRAIS:HyperLabel := HyperLabel{#ESCRAIS , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCSC_SETOR2 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_SETOR2  , _GetInst() } }
	SELF:oDCSC_SETOR2:HyperLabel := HyperLabel{#SC_SETOR2 , "Cursos Admis�es Anteriores" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_SETOR3 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_SETOR3  , _GetInst() } }
	SELF:oDCSC_SETOR3:HyperLabel := HyperLabel{#SC_SETOR3 , "Cursos Antes Contrata��o/Avulsos" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_AREA1 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_AREA1  , _GetInst() } }
	SELF:oDCSC_AREA1:HyperLabel := HyperLabel{#SC_AREA1 , "Obs" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_AREA2 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_AREA2  , _GetInst() } }
	SELF:oDCSC_AREA2:HyperLabel := HyperLabel{#SC_AREA2 , "T�cnico" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_AREA3 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_AREA3  , _GetInst() } }
	SELF:oDCSC_AREA3:HyperLabel := HyperLabel{#SC_AREA3 , "Superior" , NULL_STRING , NULL_STRING}

	SELF:oDCOBSESCOLA := SINGLELINEEDIT{SELF , ResourceID{ JTERH_OBSESCOLA  , _GetInst() } }
	SELF:oDCOBSESCOLA:FieldSpec := PADRAO_CHAR_50{}
	SELF:oDCOBSESCOLA:HyperLabel := HyperLabel{#OBSESCOLA , "Cognome" , NULL_STRING , "MP04_COGTEC"}

	SELF:oDCOBSTECNO := SINGLELINEEDIT{SELF , ResourceID{ JTERH_OBSTECNO  , _GetInst() } }
	SELF:oDCOBSTECNO:FieldSpec := PADRAO_CHAR_50{}
	SELF:oDCOBSTECNO:HyperLabel := HyperLabel{#OBSTECNO , "Cognome" , NULL_STRING , "MP04_COGTEC"}

	SELF:oDCOBSUNIVER := SINGLELINEEDIT{SELF , ResourceID{ JTERH_OBSUNIVER  , _GetInst() } }
	SELF:oDCOBSUNIVER:FieldSpec := PADRAO_CHAR_50{}
	SELF:oDCOBSUNIVER:HyperLabel := HyperLabel{#OBSUNIVER , "Cognome" , NULL_STRING , "MP04_COGTEC"}

	SELF:oCCimportar := PUSHBUTTON{SELF , ResourceID{ JTERH_IMPORTAR  , _GetInst() } }
	SELF:oCCimportar:TooltipText := "Importar Outra Matricula Treinamento"
	SELF:oCCimportar:HyperLabel := HyperLabel{#importar , "Importar Treinamentos" , NULL_STRING , NULL_STRING}

	SELF:oDCantigo := rightSle{SELF , ResourceID{ JTERH_ANTIGO  , _GetInst() } }
	SELF:oDCantigo:FieldSpec := PADRAO_NUM_05{}
	SELF:oDCantigo:HyperLabel := HyperLabel{#antigo , "Tecnico:" , NULL_STRING , "MP04_TECNICO"}

	SELF:oDCFT8 := FIXEDTEXT{SELF , ResourceID{ JTERH_FT8  , _GetInst() } }
	SELF:oDCFT8:HyperLabel := HyperLabel{#FT8 , "Folha N� Emp" , NULL_STRING , NULL_STRING}

	SELF:oDCnumfolha := rightSle{SELF , ResourceID{ JTERH_NUMFOLHA  , _GetInst() } }
	SELF:oDCnumfolha:FieldSpec := PADRAO_NUM_03{}
	SELF:oDCnumfolha:HyperLabel := HyperLabel{#numfolha , "Demitido" , NULL_STRING , "MP04_COGTEC"}

	SELF:oDCESCCOMPR := CHECKBOX{SELF , ResourceID{ JTERH_ESCCOMPR  , _GetInst() } }
	SELF:oDCESCCOMPR:FieldSpec := LOGIC_FIELD{}
	SELF:oDCESCCOMPR:HyperLabel := HyperLabel{#ESCCOMPR , "Comprovou" , NULL_STRING , NULL_STRING}

	SELF:oDCESCCOMOB := SINGLELINEEDIT{SELF , ResourceID{ JTERH_ESCCOMOB  , _GetInst() } }
	SELF:oDCESCCOMOB:FieldSpec := PADRAO_CHAR_50{}
	SELF:oDCESCCOMOB:HyperLabel := HyperLabel{#ESCCOMOB , "Cognome" , NULL_STRING , "MP04_COGTEC"}

	SELF:oDCOBSPOS := SINGLELINEEDIT{SELF , ResourceID{ JTERH_OBSPOS  , _GetInst() } }
	SELF:oDCOBSPOS:FieldSpec := PADRAO_CHAR_50{}
	SELF:oDCOBSPOS:TooltipText := "Observa�oes PosGradua�ao"
	SELF:oDCOBSPOS:HyperLabel := HyperLabel{#OBSPOS , "Cognome" , NULL_STRING , "MP04_COGTEC"}

	SELF:oDCSC_AREA4 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_AREA4  , _GetInst() } }
	SELF:oDCSC_AREA4:HyperLabel := HyperLabel{#SC_AREA4 , "Pos" , NULL_STRING , NULL_STRING}

	SELF:oCCpegcurdes := PUSHBUTTON{SELF , ResourceID{ JTERH_PEGCURDES  , _GetInst() } }
	SELF:oCCpegcurdes:TooltipText := "Clique para gravar Descri�ao do Curso"
	SELF:oCCpegcurdes:HyperLabel := HyperLabel{#pegcurdes , "..i" , NULL_STRING , NULL_STRING}

	SELF:oCCpegcurdes1 := PUSHBUTTON{SELF , ResourceID{ JTERH_PEGCURDES1  , _GetInst() } }
	SELF:oCCpegcurdes1:TooltipText := "Clique para gravar Descri�ao do Curso"
	SELF:oCCpegcurdes1:HyperLabel := HyperLabel{#pegcurdes1 , "..i" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_DESTINO2 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_DESTINO2  , _GetInst() } }
	SELF:oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2 , "Foto Editar" , NULL_STRING , NULL_STRING}

	SELF:oCCfoto := PUSHBUTTON{SELF , ResourceID{ JTERH_FOTO  , _GetInst() } }
	SELF:oCCfoto:Image := ico_camera{}
	SELF:oCCfoto:HyperLabel := HyperLabel{#foto , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCDATAHAB := DateSle{SELF , ResourceID{ JTERH_DATAHAB  , _GetInst() } }
	SELF:oDCDATAHAB:FieldSpec := DATE_FIELD{}
	SELF:oDCDATAHAB:HyperLabel := HyperLabel{#DATAHAB , "Demitido" , NULL_STRING , "MP04_COGTEC"}

	SELF:oDCDATAVIS := DateSle{SELF , ResourceID{ JTERH_DATAVIS  , _GetInst() } }
	SELF:oDCDATAVIS:FieldSpec := DATE_FIELD{}
	SELF:oDCDATAVIS:HyperLabel := HyperLabel{#DATAVIS , "Demitido" , NULL_STRING , "MP04_COGTEC"}

	SELF:oDCDATAEXM := DateSle{SELF , ResourceID{ JTERH_DATAEXM  , _GetInst() } }
	SELF:oDCDATAEXM:FieldSpec := DATE_FIELD{}
	SELF:oDCDATAEXM:HyperLabel := HyperLabel{#DATAEXM , "Demitido" , NULL_STRING , "MP04_COGTEC"}

	SELF:oCCmatant := PUSHBUTTON{SELF , ResourceID{ JTERH_MATANT  , _GetInst() } }
	SELF:oCCmatant:HyperLabel := HyperLabel{#matant , "Ir Para Mat. ANT" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdvertrein := PUSHBUTTON{SELF , ResourceID{ JTERH_CMDVERTREIN  , _GetInst() } }
	SELF:oCCcmdvertrein:HyperLabel := HyperLabel{#cmdvertrein , "Ver Treinamento" , NULL_STRING , NULL_STRING}

	SELF:oCCimportar1 := PUSHBUTTON{SELF , ResourceID{ JTERH_IMPORTAR1  , _GetInst() } }
	SELF:oCCimportar1:TooltipText := "Importar Outra Matricula Anteriores"
	SELF:oCCimportar1:HyperLabel := HyperLabel{#importar1 , "Importar" , NULL_STRING , NULL_STRING}

	SELF:oDCantigo1 := rightSle{SELF , ResourceID{ JTERH_ANTIGO1  , _GetInst() } }
	SELF:oDCantigo1:FieldSpec := PADRAO_NUM_05{}
	SELF:oDCantigo1:HyperLabel := HyperLabel{#antigo1 , "Tecnico:" , NULL_STRING , "MP04_TECNICO"}

	SELF:oCCmatant1 := PUSHBUTTON{SELF , ResourceID{ JTERH_MATANT1  , _GetInst() } }
	SELF:oCCmatant1:HyperLabel := HyperLabel{#matant1 , "Ir Para Mat. ANT" , NULL_STRING , NULL_STRING}

	SELF:oCCimportar2 := PUSHBUTTON{SELF , ResourceID{ JTERH_IMPORTAR2  , _GetInst() } }
	SELF:oCCimportar2:TooltipText := "Importar Outra Matricula Anteriores"
	SELF:oCCimportar2:HyperLabel := HyperLabel{#importar2 , "Importar" , NULL_STRING , NULL_STRING}

	SELF:oDColdemp := rightSle{SELF , ResourceID{ JTERH_OLDEMP  , _GetInst() } }
	SELF:oDColdemp:FieldSpec := PADRAO_NUM_05{}
	SELF:oDColdemp:HyperLabel := HyperLabel{#oldemp , "Tecnico:" , NULL_STRING , "MP04_TECNICO"}

	SELF:oDColdemp1 := rightSle{SELF , ResourceID{ JTERH_OLDEMP1  , _GetInst() } }
	SELF:oDColdemp1:FieldSpec := PADRAO_NUM_05{}
	SELF:oDColdemp1:HyperLabel := HyperLabel{#oldemp1 , "Tecnico:" , NULL_STRING , "MP04_TECNICO"}

	SELF:oDCFixedText22 := FIXEDTEXT{SELF , ResourceID{ JTERH_FIXEDTEXT22  , _GetInst() } }
	SELF:oDCFixedText22:HyperLabel := HyperLabel{#FixedText22 , "N�" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText23 := FIXEDTEXT{SELF , ResourceID{ JTERH_FIXEDTEXT23  , _GetInst() } }
	SELF:oDCFixedText23:HyperLabel := HyperLabel{#FixedText23 , "N�" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText24 := FIXEDTEXT{SELF , ResourceID{ JTERH_FIXEDTEXT24  , _GetInst() } }
	SELF:oDCFixedText24:HyperLabel := HyperLabel{#FixedText24 , "Emp" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText25 := FIXEDTEXT{SELF , ResourceID{ JTERH_FIXEDTEXT25  , _GetInst() } }
	SELF:oDCFixedText25:HyperLabel := HyperLabel{#FixedText25 , "Emp" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdvertrein1 := PUSHBUTTON{SELF , ResourceID{ JTERH_CMDVERTREIN1  , _GetInst() } }
	SELF:oCCcmdvertrein1:HyperLabel := HyperLabel{#cmdvertrein1 , "Ver Treinamento" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_DESTINO3 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_DESTINO3  , _GetInst() } }
	SELF:oDCSC_DESTINO3:HyperLabel := HyperLabel{#SC_DESTINO3 , "Foto Ver" , NULL_STRING , NULL_STRING}

	SELF:oCCfoto1 := PUSHBUTTON{SELF , ResourceID{ JTERH_FOTO1  , _GetInst() } }
	SELF:oCCfoto1:Image := ico_camera{}
	SELF:oCCfoto1:HyperLabel := HyperLabel{#foto1 , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCDEPTO2 := rightSle{SELF , ResourceID{ JTERH_DEPTO2  , _GetInst() } }
	SELF:oDCDEPTO2:FieldSpec := PADRAO_NUM_05{}
	SELF:oDCDEPTO2:HyperLabel := HyperLabel{#DEPTO2 , "NUMREGANT" , NULL_STRING , "FO_PES_DEPTO"}

	SELF:oDCNUMEMPANT := rightSle{SELF , ResourceID{ JTERH_NUMEMPANT  , _GetInst() } }
	SELF:oDCNUMEMPANT:FieldSpec := PADRAO_NUM_03{}
	SELF:oDCNUMEMPANT:HyperLabel := HyperLabel{#NUMEMPANT , "Dep" , NULL_STRING , "FO_PES_DEPTO"}

	SELF:oDCDATTRANSF := DateSle{SELF , ResourceID{ JTERH_DATTRANSF  , _GetInst() } }
	SELF:oDCDATTRANSF:FieldSpec := DATE_FIELD{}
	SELF:oDCDATTRANSF:HyperLabel := HyperLabel{#DATTRANSF , "Admitido:" , NULL_STRING , "FO_PES_ADMITIDO"}

	SELF:oDCSC_ADMITIDO1 := FIXEDTEXT{SELF , ResourceID{ JTERH_SC_ADMITIDO1  , _GetInst() } }
	SELF:oDCSC_ADMITIDO1:HyperLabel := HyperLabel{#SC_ADMITIDO1 , "Transferencia" , NULL_STRING , NULL_STRING}

	SELF:oDCcpf := rightSle{SELF , ResourceID{ JTERH_CPF  , _GetInst() } }
	SELF:oDCcpf:FieldSpec := padrao_char_14{}
	SELF:oDCcpf:TooltipText := "Digite o CPF"
	SELF:oDCcpf:Picture := "999.999.999-99"
	SELF:oDCcpf:HyperLabel := HyperLabel{#cpf , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCcheckcPF := PUSHBUTTON{SELF , ResourceID{ JTERH_CHECKCPF  , _GetInst() } }
	SELF:oCCcheckcPF:TooltipText := "Checar CPF"
	SELF:oCCcheckcPF:HyperLabel := HyperLabel{#checkcPF , "Checar CPF" , NULL_STRING , NULL_STRING}

	SELF:Caption := "Funcionarios-Treinamento"
	SELF:Menu := STANDARDSHELLMENU{}
	SELF:ClipperKeys := TRUE
	SELF:AllowServerClose := TRUE
	SELF:HyperLabel := HyperLabel{#JTERH , "Funcionarios-Treinamento" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF

	SELF:Browser := DataBrowser{SELF}

	SELF:oDBTECNICO := DataColumn{PADRAO_NUM_05{}}
	SELF:oDBTECNICO:Width := 11
	SELF:oDBTECNICO:HyperLabel := SELF:oDCTECNICO:HyperLabel
	SELF:oDBTECNICO:Caption := "Tecnico:"
	SELF:Browser:AddColumn(SELF:oDBTECNICO)

	SELF:oDBNOMTEC := DataColumn{PADRAO_CHAR_40{}}
	SELF:oDBNOMTEC:Width := 34
	SELF:oDBNOMTEC:HyperLabel := SELF:oDCNOMTEC:HyperLabel
	SELF:oDBNOMTEC:Caption := "Nome"
	SELF:Browser:AddColumn(SELF:oDBNOMTEC)

	SELF:ViewAs(#FormView)

	SELF:oSFjmp04c := jmp04c{SELF , JTERH_JMP04C }
	SELF:oSFjmp04c:Show()
	SELF:oSFjmp04a := jmp04a{SELF , JTERH_JMP04A }
	SELF:oSFjmp04a:Show()

	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS NOMTEC
RETURN SELF:FieldGet( #NOMTEC )

ASSIGN NOMTEC( uValue )
SELF:FieldPut( #NOMTEC , uValue )

ACCESS NUMEMPANT
RETURN SELF:FieldGet( #NUMEMPANT )

ASSIGN NUMEMPANT( uValue )
SELF:FieldPut( #NUMEMPANT , uValue )

ACCESS numfolha
RETURN SELF:FieldGet( #numfolha )

ASSIGN numfolha( uValue )
SELF:FieldPut( #numfolha , uValue )

ACCESS OBSESCOLA
RETURN SELF:FieldGet( #OBSESCOLA )

ASSIGN OBSESCOLA( uValue )
SELF:FieldPut( #OBSESCOLA , uValue )

ACCESS OBSPOS
RETURN SELF:FieldGet( #OBSPOS )

ASSIGN OBSPOS( uValue )
SELF:FieldPut( #OBSPOS , uValue )

ACCESS OBSTECNO
RETURN SELF:FieldGet( #OBSTECNO )

ASSIGN OBSTECNO( uValue )
SELF:FieldPut( #OBSTECNO , uValue )

ACCESS OBSUNIVER
RETURN SELF:FieldGet( #OBSUNIVER )

ASSIGN OBSUNIVER( uValue )
SELF:FieldPut( #OBSUNIVER , uValue )

ACCESS oldemp
RETURN SELF:FieldGet( #oldemp )

ASSIGN oldemp( uValue )
SELF:FieldPut( #oldemp , uValue )

ACCESS oldemp1
RETURN SELF:FieldGet( #oldemp1 )

ASSIGN oldemp1( uValue )
SELF:FieldPut( #oldemp1 , uValue )

ACCESS PONTOROL
RETURN SELF:FieldGet( #PONTOROL )

ASSIGN PONTOROL( uValue )
SELF:FieldPut( #PONTOROL , uValue )

ACCESS SETOR
RETURN SELF:FieldGet( #SETOR )

ASSIGN SETOR( uValue )
SELF:FieldPut( #SETOR , uValue )

ACCESS SOLDADOR
RETURN SELF:FieldGet( #SOLDADOR )

ASSIGN SOLDADOR( uValue )
SELF:FieldPut( #SOLDADOR , uValue )

ACCESS TABTEC
RETURN SELF:FieldGet( #TABTEC )

ASSIGN TABTEC( uValue )
SELF:FieldPut( #TABTEC , uValue )

ACCESS TECNICO
RETURN SELF:FieldGet( #TECNICO )

ASSIGN TECNICO( uValue )
SELF:FieldPut( #TECNICO , uValue )

END CLASS
