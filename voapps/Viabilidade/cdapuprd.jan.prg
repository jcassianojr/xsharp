#region DEFINES
STATIC DEFINE JCDAPUPRD_ANO := 101
STATIC DEFINE JCDAPUPRD_ATIVA := 109
STATIC DEFINE JCDAPUPRD_BUSCAOV := 164
STATIC DEFINE JCDAPUPRD_CD := 100
STATIC DEFINE JCDAPUPRD_CHKCLIPRO := 168
STATIC DEFINE JCDAPUPRD_CLIENTE := 104
STATIC DEFINE JCDAPUPRD_CODIGO := 102
STATIC DEFINE JCDAPUPRD_CODIGOINT := 103
STATIC DEFINE JCDAPUPRD_COGCLI := 105
STATIC DEFINE JCDAPUPRD_DATAINI := 106
STATIC DEFINE JCDAPUPRD_DATAPRO := 107
STATIC DEFINE JCDAPUPRD_EAC := 108
STATIC DEFINE JCDAPUPRD_ESCCOD := 167
STATIC DEFINE JCDAPUPRD_ESCFOR := 170
STATIC DEFINE JCDAPUPRD_MES01 := 112
STATIC DEFINE JCDAPUPRD_MES02 := 113
STATIC DEFINE JCDAPUPRD_MES03 := 114
STATIC DEFINE JCDAPUPRD_MES04 := 115
STATIC DEFINE JCDAPUPRD_MES05 := 116
STATIC DEFINE JCDAPUPRD_MES06 := 117
STATIC DEFINE JCDAPUPRD_MES07 := 124
STATIC DEFINE JCDAPUPRD_MES08 := 125
STATIC DEFINE JCDAPUPRD_MES09 := 126
STATIC DEFINE JCDAPUPRD_MES10 := 127
STATIC DEFINE JCDAPUPRD_MES11 := 128
STATIC DEFINE JCDAPUPRD_MES12 := 129
STATIC DEFINE JCDAPUPRD_MESESF := 110
STATIC DEFINE JCDAPUPRD_MESESP := 111
STATIC DEFINE JCDAPUPRD_PEGMA01 := 169 
STATIC DEFINE JCDAPUPRD_PEGMS01 := 166
STATIC DEFINE JCDAPUPRD_POROV := 163
STATIC DEFINE JCDAPUPRD_PRC01 := 118
STATIC DEFINE JCDAPUPRD_PRC02 := 119
STATIC DEFINE JCDAPUPRD_PRC03 := 120
STATIC DEFINE JCDAPUPRD_PRC04 := 121
STATIC DEFINE JCDAPUPRD_PRC05 := 122
STATIC DEFINE JCDAPUPRD_PRC06 := 123
STATIC DEFINE JCDAPUPRD_PRC07 := 130
STATIC DEFINE JCDAPUPRD_PRC08 := 131
STATIC DEFINE JCDAPUPRD_PRC09 := 132
STATIC DEFINE JCDAPUPRD_PRC10 := 133
STATIC DEFINE JCDAPUPRD_PRC11 := 134
STATIC DEFINE JCDAPUPRD_PRC12 := 135
STATIC DEFINE JCDAPUPRD_PRECO := 136
STATIC DEFINE JCDAPUPRD_PUSHBUTTON2 := 165
STATIC DEFINE JCDAPUPRD_SC_ANO := 138
STATIC DEFINE JCDAPUPRD_SC_ATIVA := 144
STATIC DEFINE JCDAPUPRD_SC_CD := 137
STATIC DEFINE JCDAPUPRD_SC_CLIENTE := 171
STATIC DEFINE JCDAPUPRD_SC_CODIGO := 139
STATIC DEFINE JCDAPUPRD_SC_CODIGOINT := 140
STATIC DEFINE JCDAPUPRD_SC_DATAINI := 141
STATIC DEFINE JCDAPUPRD_SC_DATAPRO := 142
STATIC DEFINE JCDAPUPRD_SC_EAC := 143
STATIC DEFINE JCDAPUPRD_SC_MES01 := 145
STATIC DEFINE JCDAPUPRD_SC_MES02 := 146
STATIC DEFINE JCDAPUPRD_SC_MES03 := 147
STATIC DEFINE JCDAPUPRD_SC_MES04 := 148
STATIC DEFINE JCDAPUPRD_SC_MES05 := 149
STATIC DEFINE JCDAPUPRD_SC_MES06 := 150
STATIC DEFINE JCDAPUPRD_SC_MES07 := 151
STATIC DEFINE JCDAPUPRD_SC_MES08 := 152
STATIC DEFINE JCDAPUPRD_SC_MES09 := 153
STATIC DEFINE JCDAPUPRD_SC_MES10 := 154
STATIC DEFINE JCDAPUPRD_SC_MES11 := 155
STATIC DEFINE JCDAPUPRD_SC_MES12 := 156
STATIC DEFINE JCDAPUPRD_SC_MESESF := 159
STATIC DEFINE JCDAPUPRD_SC_MESESP := 160
STATIC DEFINE JCDAPUPRD_SC_PRC01 := 157
STATIC DEFINE JCDAPUPRD_SC_PRC02 := 158
STATIC DEFINE JCDAPUPRD_SC_PRC2 := 162
STATIC DEFINE JCDAPUPRD_SC_PRC3 := 161
#endregion

PARTIAL CLASS jcdapuprd INHERIT MYDataWindow
PROTECT oDBCD AS DataColumn
PROTECT oDBANO AS DataColumn
PROTECT oDBCODIGO AS DataColumn
PROTECT oDBCODIGOINT AS DataColumn
PROTECT oDBDATAINI AS DataColumn
PROTECT oDBDATAPRO AS DataColumn
PROTECT oDBEAC AS DataColumn
PROTECT oDBATIVA AS DataColumn
PROTECT oDBMESESF AS DataColumn
PROTECT oDBMESESP AS DataColumn
PROTECT oDCCD AS SINGLELINEEDIT
PROTECT oDCANO AS rightSle
PROTECT oDCCODIGO AS SINGLELINEEDIT
PROTECT oDCCODIGOINT AS SINGLELINEEDIT
PROTECT oDCCLIENTE AS rightSle
PROTECT oDCCOGCLI AS SINGLELINEEDIT
PROTECT oDCDATAINI AS DateSle
PROTECT oDCDATAPRO AS DateSle
PROTECT oDCEAC AS rightSle
PROTECT oDCATIVA AS SINGLELINEEDIT
PROTECT oDCMESESF AS rightSle
PROTECT oDCMESESP AS rightSle
PROTECT oDCMES01 AS rightSle
PROTECT oDCMES02 AS rightSle
PROTECT oDCMES03 AS rightSle
PROTECT oDCMES04 AS rightSle
PROTECT oDCMES05 AS rightSle
PROTECT oDCMES06 AS rightSle
PROTECT oDCPRC01 AS rightSle
PROTECT oDCPRC02 AS rightSle
PROTECT oDCPRC03 AS rightSle
PROTECT oDCPRC04 AS rightSle
PROTECT oDCPRC05 AS rightSle
PROTECT oDCPRC06 AS rightSle
PROTECT oDCMES07 AS rightSle
PROTECT oDCMES08 AS rightSle
PROTECT oDCMES09 AS rightSle
PROTECT oDCMES10 AS rightSle
PROTECT oDCMES11 AS rightSle
PROTECT oDCMES12 AS rightSle
PROTECT oDCPRC07 AS rightSle
PROTECT oDCPRC08 AS rightSle
PROTECT oDCPRC09 AS rightSle
PROTECT oDCPRC10 AS rightSle
PROTECT oDCPRC11 AS rightSle
PROTECT oDCPRC12 AS rightSle
PROTECT oDCpreco AS SINGLELINEEDIT
PROTECT oDCSC_CD AS FIXEDTEXT
PROTECT oDCSC_ANO AS FIXEDTEXT
PROTECT oDCSC_CODIGO AS FIXEDTEXT
PROTECT oDCSC_CODIGOINT AS FIXEDTEXT
PROTECT oDCSC_DATAINI AS FIXEDTEXT
PROTECT oDCSC_DATAPRO AS FIXEDTEXT
PROTECT oDCSC_EAC AS FIXEDTEXT
PROTECT oDCSC_ATIVA AS FIXEDTEXT
PROTECT oDCSC_MES01 AS FIXEDTEXT
PROTECT oDCSC_MES02 AS FIXEDTEXT
PROTECT oDCSC_MES03 AS FIXEDTEXT
PROTECT oDCSC_MES04 AS FIXEDTEXT
PROTECT oDCSC_MES05 AS FIXEDTEXT
PROTECT oDCSC_MES06 AS FIXEDTEXT
PROTECT oDCSC_MES07 AS FIXEDTEXT
PROTECT oDCSC_MES08 AS FIXEDTEXT
PROTECT oDCSC_MES09 AS FIXEDTEXT
PROTECT oDCSC_MES10 AS FIXEDTEXT
PROTECT oDCSC_MES11 AS FIXEDTEXT
PROTECT oDCSC_MES12 AS FIXEDTEXT
PROTECT oDCSC_PRC01 AS FIXEDTEXT
PROTECT oDCSC_PRC02 AS FIXEDTEXT
PROTECT oDCSC_MESESF AS FIXEDTEXT
PROTECT oDCSC_MESESP AS FIXEDTEXT
PROTECT oDCSC_PRC3 AS FIXEDTEXT
PROTECT oDCSC_PRC2 AS FIXEDTEXT
PROTECT oCCporov AS PUSHBUTTON
PROTECT oCCbuscaov AS PUSHBUTTON
PROTECT oCCPushButton2 AS PUSHBUTTON
PROTECT oCCpegms01 AS PUSHBUTTON
PROTECT oCCesccod AS PUSHBUTTON
PROTECT oCCchkclipro AS PUSHBUTTON
PROTECT oCCbtnpegma01 AS PUSHBUTTON
PROTECT oCCescfor AS PUSHBUTTON
PROTECT oDCSC_CLIENTE AS FIXEDTEXT

// User code starts here (DO NOT remove this line)  ##USER##

ACCESS ANO
RETURN SELF:FieldGet( #ANO )

ASSIGN ANO( uValue )
SELF:FieldPut( #ANO , uValue )

ACCESS ATIVA
RETURN SELF:FieldGet( #ATIVA )

ASSIGN ATIVA( uValue )
SELF:FieldPut( #ATIVA , uValue )

ACCESS CD
RETURN SELF:FieldGet( #CD )

ASSIGN CD( uValue )
SELF:FieldPut( #CD , uValue )

ACCESS CLIENTE
RETURN SELF:FieldGet( #CLIENTE )

ASSIGN CLIENTE( uValue )
SELF:FieldPut( #CLIENTE , uValue )

ACCESS CODIGO
RETURN SELF:FieldGet( #CODIGO )

ASSIGN CODIGO( uValue )
SELF:FieldPut( #CODIGO , uValue )

ACCESS CODIGOINT
RETURN SELF:FieldGet( #CODIGOINT )

ASSIGN CODIGOINT( uValue )
SELF:FieldPut( #CODIGOINT , uValue )

ACCESS COGCLI
RETURN SELF:FieldGet( #COGCLI )

ASSIGN COGCLI( uValue )
SELF:FieldPut( #COGCLI , uValue )

ACCESS DATAINI
RETURN SELF:FieldGet( #DATAINI )

ASSIGN DATAINI( uValue )
SELF:FieldPut( #DATAINI , uValue )

ACCESS DATAPRO
RETURN SELF:FieldGet( #DATAPRO )

ASSIGN DATAPRO( uValue )
SELF:FieldPut( #DATAPRO , uValue )

ACCESS EAC
RETURN SELF:FieldGet( #EAC )

ASSIGN EAC( uValue )
SELF:FieldPut( #EAC , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"jcdapuprd" , _GetInst()},iCtlID)

	SELF:oDCCD := SINGLELINEEDIT{SELF , ResourceID{ JCDAPUPRD_CD  , _GetInst() } }
	SELF:oDCCD:FieldSpec := padrao_num_08{}
	SELF:oDCCD:HyperLabel := HyperLabel{#CD , "Cd:" , NULL_STRING , "CDAPUPRD_CD"}

	SELF:oDCANO := rightSle{SELF , ResourceID{ JCDAPUPRD_ANO  , _GetInst() } }
	SELF:oDCANO:FieldSpec := padrao_num_04{}
	SELF:oDCANO:HyperLabel := HyperLabel{#ANO , "Ano:" , NULL_STRING , "CDAPUPRD_ANO"}

	SELF:oDCCODIGO := SINGLELINEEDIT{SELF , ResourceID{ JCDAPUPRD_CODIGO  , _GetInst() } }
	SELF:oDCCODIGO:FieldSpec := padrao_char_24{}
	SELF:oDCCODIGO:HyperLabel := HyperLabel{#CODIGO , "Codigo:" , NULL_STRING , "CDAPUPRD_CODIGO"}

	SELF:oDCCODIGOINT := SINGLELINEEDIT{SELF , ResourceID{ JCDAPUPRD_CODIGOINT  , _GetInst() } }
	SELF:oDCCODIGOINT:FieldSpec := padrao_char_24{}
	SELF:oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT , "Codigoint:" , NULL_STRING , "CDAPUPRD_CODIGOINT"}

	SELF:oDCCLIENTE := rightSle{SELF , ResourceID{ JCDAPUPRD_CLIENTE  , _GetInst() } }
	SELF:oDCCLIENTE:FieldSpec := padrao_num_08{}
	SELF:oDCCLIENTE:TooltipText := "Codigo do Cliente"
	SELF:oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE , "Cliente:" , NULL_STRING , "CD_CLIENTE"}

	SELF:oDCCOGCLI := SINGLELINEEDIT{SELF , ResourceID{ JCDAPUPRD_COGCLI  , _GetInst() } }
	SELF:oDCCOGCLI:FieldSpec := padrao_char_15{}
	SELF:oDCCOGCLI:TooltipText := "Cognome do Cliente"
	SELF:oDCCOGCLI:HyperLabel := HyperLabel{#COGCLI , "Cliente:" , NULL_STRING , "CD_CLIENTE"}

	SELF:oDCDATAINI := DateSle{SELF , ResourceID{ JCDAPUPRD_DATAINI  , _GetInst() } }
	SELF:oDCDATAINI:FieldSpec := date_field{}
	SELF:oDCDATAINI:HyperLabel := HyperLabel{#DATAINI , "Dataini:" , NULL_STRING , "CDAPUPRD_DATAINI"}

	SELF:oDCDATAPRO := DateSle{SELF , ResourceID{ JCDAPUPRD_DATAPRO  , _GetInst() } }
	SELF:oDCDATAPRO:FieldSpec := date_field{}
	SELF:oDCDATAPRO:HyperLabel := HyperLabel{#DATAPRO , "Datapro:" , NULL_STRING , "CDAPUPRD_DATAPRO"}

	SELF:oDCEAC := rightSle{SELF , ResourceID{ JCDAPUPRD_EAC  , _GetInst() } }
	SELF:oDCEAC:FieldSpec := padrao_num_06{}
	SELF:oDCEAC:HyperLabel := HyperLabel{#EAC , "Eac:" , NULL_STRING , "CDAPUPRD_EAC"}

	SELF:oDCATIVA := SINGLELINEEDIT{SELF , ResourceID{ JCDAPUPRD_ATIVA  , _GetInst() } }
	SELF:oDCATIVA:FieldSpec := padrao_char_01{}
	SELF:oDCATIVA:FocusSelect := FSEL_ALL
	SELF:oDCATIVA:HyperLabel := HyperLabel{#ATIVA , "A" , NULL_STRING , "CDAPUPRD_ATIVA"}

	SELF:oDCMESESF := rightSle{SELF , ResourceID{ JCDAPUPRD_MESESF  , _GetInst() } }
	SELF:oDCMESESF:FieldSpec := padrao_num_02{}
	SELF:oDCMESESF:HyperLabel := HyperLabel{#MESESF , "MF" , NULL_STRING , "CDAPUPRD_MESESF"}

	SELF:oDCMESESP := rightSle{SELF , ResourceID{ JCDAPUPRD_MESESP  , _GetInst() } }
	SELF:oDCMESESP:FieldSpec := padrao_num_02{}
	SELF:oDCMESESP:HyperLabel := HyperLabel{#MESESP , "MP" , NULL_STRING , "CDAPUPRD_MESESP"}

	SELF:oDCMES01 := rightSle{SELF , ResourceID{ JCDAPUPRD_MES01  , _GetInst() } }
	SELF:oDCMES01:FieldSpec := padrao_num_08{}
	SELF:oDCMES01:HyperLabel := HyperLabel{#MES01 , "Mes01:" , NULL_STRING , "CDAPUPRD_MES01"}

	SELF:oDCMES02 := rightSle{SELF , ResourceID{ JCDAPUPRD_MES02  , _GetInst() } }
	SELF:oDCMES02:FieldSpec := padrao_num_08{}
	SELF:oDCMES02:HyperLabel := HyperLabel{#MES02 , "Mes02:" , NULL_STRING , "CDAPUPRD_MES02"}

	SELF:oDCMES03 := rightSle{SELF , ResourceID{ JCDAPUPRD_MES03  , _GetInst() } }
	SELF:oDCMES03:FieldSpec := padrao_num_08{}
	SELF:oDCMES03:HyperLabel := HyperLabel{#MES03 , "Mes03:" , NULL_STRING , "CDAPUPRD_MES03"}

	SELF:oDCMES04 := rightSle{SELF , ResourceID{ JCDAPUPRD_MES04  , _GetInst() } }
	SELF:oDCMES04:FieldSpec := padrao_num_08{}
	SELF:oDCMES04:HyperLabel := HyperLabel{#MES04 , "Mes04:" , NULL_STRING , "CDAPUPRD_MES04"}

	SELF:oDCMES05 := rightSle{SELF , ResourceID{ JCDAPUPRD_MES05  , _GetInst() } }
	SELF:oDCMES05:FieldSpec := padrao_num_08{}
	SELF:oDCMES05:HyperLabel := HyperLabel{#MES05 , "Mes05:" , NULL_STRING , "CDAPUPRD_MES05"}

	SELF:oDCMES06 := rightSle{SELF , ResourceID{ JCDAPUPRD_MES06  , _GetInst() } }
	SELF:oDCMES06:FieldSpec := padrao_num_08{}
	SELF:oDCMES06:HyperLabel := HyperLabel{#MES06 , "Mes06:" , NULL_STRING , "CDAPUPRD_MES06"}

	SELF:oDCPRC01 := rightSle{SELF , ResourceID{ JCDAPUPRD_PRC01  , _GetInst() } }
	SELF:oDCPRC01:FieldSpec := padrao_num_08_4{}
	SELF:oDCPRC01:HyperLabel := HyperLabel{#PRC01 , "Prc01:" , NULL_STRING , "CDAPUPRD_PRC01"}

	SELF:oDCPRC02 := rightSle{SELF , ResourceID{ JCDAPUPRD_PRC02  , _GetInst() } }
	SELF:oDCPRC02:FieldSpec := padrao_num_08_4{}
	SELF:oDCPRC02:HyperLabel := HyperLabel{#PRC02 , "Prc02:" , NULL_STRING , "CDAPUPRD_PRC02"}

	SELF:oDCPRC03 := rightSle{SELF , ResourceID{ JCDAPUPRD_PRC03  , _GetInst() } }
	SELF:oDCPRC03:FieldSpec := padrao_num_08_4{}
	SELF:oDCPRC03:HyperLabel := HyperLabel{#PRC03 , "Prc03:" , NULL_STRING , "CDAPUPRD_PRC03"}

	SELF:oDCPRC04 := rightSle{SELF , ResourceID{ JCDAPUPRD_PRC04  , _GetInst() } }
	SELF:oDCPRC04:FieldSpec := padrao_num_08_4{}
	SELF:oDCPRC04:HyperLabel := HyperLabel{#PRC04 , "Prc04:" , NULL_STRING , "CDAPUPRD_PRC04"}

	SELF:oDCPRC05 := rightSle{SELF , ResourceID{ JCDAPUPRD_PRC05  , _GetInst() } }
	SELF:oDCPRC05:FieldSpec := padrao_num_08_4{}
	SELF:oDCPRC05:HyperLabel := HyperLabel{#PRC05 , "Prc05:" , NULL_STRING , "CDAPUPRD_PRC05"}

	SELF:oDCPRC06 := rightSle{SELF , ResourceID{ JCDAPUPRD_PRC06  , _GetInst() } }
	SELF:oDCPRC06:FieldSpec := padrao_num_08_4{}
	SELF:oDCPRC06:HyperLabel := HyperLabel{#PRC06 , "Prc06:" , NULL_STRING , "CDAPUPRD_PRC06"}

	SELF:oDCMES07 := rightSle{SELF , ResourceID{ JCDAPUPRD_MES07  , _GetInst() } }
	SELF:oDCMES07:FieldSpec := padrao_num_08{}
	SELF:oDCMES07:HyperLabel := HyperLabel{#MES07 , "Mes07:" , NULL_STRING , "CDAPUPRD_MES07"}

	SELF:oDCMES08 := rightSle{SELF , ResourceID{ JCDAPUPRD_MES08  , _GetInst() } }
	SELF:oDCMES08:FieldSpec := padrao_num_08{}
	SELF:oDCMES08:HyperLabel := HyperLabel{#MES08 , "Mes08:" , NULL_STRING , "CDAPUPRD_MES08"}

	SELF:oDCMES09 := rightSle{SELF , ResourceID{ JCDAPUPRD_MES09  , _GetInst() } }
	SELF:oDCMES09:FieldSpec := padrao_num_08{}
	SELF:oDCMES09:HyperLabel := HyperLabel{#MES09 , "Mes09:" , NULL_STRING , "CDAPUPRD_MES09"}

	SELF:oDCMES10 := rightSle{SELF , ResourceID{ JCDAPUPRD_MES10  , _GetInst() } }
	SELF:oDCMES10:FieldSpec := padrao_num_08{}
	SELF:oDCMES10:HyperLabel := HyperLabel{#MES10 , "Mes10:" , NULL_STRING , "CDAPUPRD_MES10"}

	SELF:oDCMES11 := rightSle{SELF , ResourceID{ JCDAPUPRD_MES11  , _GetInst() } }
	SELF:oDCMES11:FieldSpec := padrao_num_08{}
	SELF:oDCMES11:HyperLabel := HyperLabel{#MES11 , "Mes11:" , NULL_STRING , "CDAPUPRD_MES11"}

	SELF:oDCMES12 := rightSle{SELF , ResourceID{ JCDAPUPRD_MES12  , _GetInst() } }
	SELF:oDCMES12:FieldSpec := padrao_num_08{}
	SELF:oDCMES12:HyperLabel := HyperLabel{#MES12 , "Mes12:" , NULL_STRING , "CDAPUPRD_MES12"}

	SELF:oDCPRC07 := rightSle{SELF , ResourceID{ JCDAPUPRD_PRC07  , _GetInst() } }
	SELF:oDCPRC07:FieldSpec := padrao_num_08_4{}
	SELF:oDCPRC07:HyperLabel := HyperLabel{#PRC07 , "Prc07:" , NULL_STRING , "CDAPUPRD_PRC07"}

	SELF:oDCPRC08 := rightSle{SELF , ResourceID{ JCDAPUPRD_PRC08  , _GetInst() } }
	SELF:oDCPRC08:FieldSpec := padrao_num_08_4{}
	SELF:oDCPRC08:HyperLabel := HyperLabel{#PRC08 , "Prc08:" , NULL_STRING , "CDAPUPRD_PRC08"}

	SELF:oDCPRC09 := rightSle{SELF , ResourceID{ JCDAPUPRD_PRC09  , _GetInst() } }
	SELF:oDCPRC09:FieldSpec := padrao_num_08_4{}
	SELF:oDCPRC09:HyperLabel := HyperLabel{#PRC09 , "Prc09:" , NULL_STRING , "CDAPUPRD_PRC09"}

	SELF:oDCPRC10 := rightSle{SELF , ResourceID{ JCDAPUPRD_PRC10  , _GetInst() } }
	SELF:oDCPRC10:FieldSpec := padrao_num_08_4{}
	SELF:oDCPRC10:HyperLabel := HyperLabel{#PRC10 , "Prc10:" , NULL_STRING , "CDAPUPRD_PRC10"}

	SELF:oDCPRC11 := rightSle{SELF , ResourceID{ JCDAPUPRD_PRC11  , _GetInst() } }
	SELF:oDCPRC11:FieldSpec := padrao_num_08_4{}
	SELF:oDCPRC11:HyperLabel := HyperLabel{#PRC11 , "Prc11:" , NULL_STRING , "CDAPUPRD_PRC11"}

	SELF:oDCPRC12 := rightSle{SELF , ResourceID{ JCDAPUPRD_PRC12  , _GetInst() } }
	SELF:oDCPRC12:FieldSpec := padrao_num_08_4{}
	SELF:oDCPRC12:HyperLabel := HyperLabel{#PRC12 , "Prc12:" , NULL_STRING , "CDAPUPRD_PRC12"}

	SELF:oDCpreco := SINGLELINEEDIT{SELF , ResourceID{ JCDAPUPRD_PRECO  , _GetInst() } }
	SELF:oDCpreco:FieldSpec := padrao_num_08_4{}
	SELF:oDCpreco:HyperLabel := HyperLabel{#preco , "Preco" , NULL_STRING , "CDAPUPRD_PRC06"}

	SELF:oDCSC_CD := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_CD  , _GetInst() } }
	SELF:oDCSC_CD:HyperLabel := HyperLabel{#SC_CD , "Cd:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_ANO := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_ANO  , _GetInst() } }
	SELF:oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO , "Ano:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_CODIGO := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_CODIGO  , _GetInst() } }
	SELF:oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO , "Codigo:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_CODIGOINT := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_CODIGOINT  , _GetInst() } }
	SELF:oDCSC_CODIGOINT:HyperLabel := HyperLabel{#SC_CODIGOINT , "Codigoint:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_DATAINI := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_DATAINI  , _GetInst() } }
	SELF:oDCSC_DATAINI:HyperLabel := HyperLabel{#SC_DATAINI , "Data Inicial:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_DATAPRO := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_DATAPRO  , _GetInst() } }
	SELF:oDCSC_DATAPRO:HyperLabel := HyperLabel{#SC_DATAPRO , "Data Producao:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_EAC := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_EAC  , _GetInst() } }
	SELF:oDCSC_EAC:HyperLabel := HyperLabel{#SC_EAC , "Eac:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_ATIVA := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_ATIVA  , _GetInst() } }
	SELF:oDCSC_ATIVA:HyperLabel := HyperLabel{#SC_ATIVA , "Ativa:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MES01 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MES01  , _GetInst() } }
	SELF:oDCSC_MES01:HyperLabel := HyperLabel{#SC_MES01 , "Jan:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MES02 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MES02  , _GetInst() } }
	SELF:oDCSC_MES02:HyperLabel := HyperLabel{#SC_MES02 , "Fev:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MES03 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MES03  , _GetInst() } }
	SELF:oDCSC_MES03:HyperLabel := HyperLabel{#SC_MES03 , "Mar:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MES04 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MES04  , _GetInst() } }
	SELF:oDCSC_MES04:HyperLabel := HyperLabel{#SC_MES04 , "Abr:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MES05 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MES05  , _GetInst() } }
	SELF:oDCSC_MES05:HyperLabel := HyperLabel{#SC_MES05 , "Mai:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MES06 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MES06  , _GetInst() } }
	SELF:oDCSC_MES06:HyperLabel := HyperLabel{#SC_MES06 , "Jun:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MES07 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MES07  , _GetInst() } }
	SELF:oDCSC_MES07:HyperLabel := HyperLabel{#SC_MES07 , "Jul:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MES08 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MES08  , _GetInst() } }
	SELF:oDCSC_MES08:HyperLabel := HyperLabel{#SC_MES08 , "Ago:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MES09 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MES09  , _GetInst() } }
	SELF:oDCSC_MES09:HyperLabel := HyperLabel{#SC_MES09 , "Set:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MES10 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MES10  , _GetInst() } }
	SELF:oDCSC_MES10:HyperLabel := HyperLabel{#SC_MES10 , "Out:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MES11 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MES11  , _GetInst() } }
	SELF:oDCSC_MES11:HyperLabel := HyperLabel{#SC_MES11 , "Nov:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MES12 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MES12  , _GetInst() } }
	SELF:oDCSC_MES12:HyperLabel := HyperLabel{#SC_MES12 , "Dez:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_PRC01 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_PRC01  , _GetInst() } }
	SELF:oDCSC_PRC01:HyperLabel := HyperLabel{#SC_PRC01 , "Preco:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_PRC02 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_PRC02  , _GetInst() } }
	SELF:oDCSC_PRC02:HyperLabel := HyperLabel{#SC_PRC02 , "Qtde" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MESESF := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MESESF  , _GetInst() } }
	SELF:oDCSC_MESESF:HyperLabel := HyperLabel{#SC_MESESF , "Meses " , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MESESP := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_MESESP  , _GetInst() } }
	SELF:oDCSC_MESESP:HyperLabel := HyperLabel{#SC_MESESP , "Meses prod:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_PRC3 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_PRC3  , _GetInst() } }
	SELF:oDCSC_PRC3:HyperLabel := HyperLabel{#SC_PRC3 , "Qtde" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_PRC2 := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_PRC2  , _GetInst() } }
	SELF:oDCSC_PRC2:HyperLabel := HyperLabel{#SC_PRC2 , "Preco:" , NULL_STRING , NULL_STRING}

	SELF:oCCporov := PUSHBUTTON{SELF , ResourceID{ JCDAPUPRD_POROV  , _GetInst() } }
	SELF:oCCporov:TooltipText := "Clique para ordenar por Numero"
	SELF:oCCporov:Image := ICO_AZ{}
	SELF:oCCporov:HyperLabel := HyperLabel{#porov , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCbuscaov := PUSHBUTTON{SELF , ResourceID{ JCDAPUPRD_BUSCAOV  , _GetInst() } }
	SELF:oCCbuscaov:TooltipText := "Clique Para Localizar Por Numero"
	SELF:oCCbuscaov:Image := ICO_FIND{}
	SELF:oCCbuscaov:HyperLabel := HyperLabel{#buscaov , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCPushButton2 := PUSHBUTTON{SELF , ResourceID{ JCDAPUPRD_PUSHBUTTON2  , _GetInst() } }
	SELF:oCCPushButton2:HyperLabel := HyperLabel{#PushButton2 , "Preco 12 Meses" , NULL_STRING , NULL_STRING}

	SELF:oCCpegms01 := PUSHBUTTON{SELF , ResourceID{ JCDAPUPRD_PEGMS01  , _GetInst() } }
	SELF:oCCpegms01:TooltipText := "Clique para preencher nome Produto"
	SELF:oCCpegms01:HyperLabel := HyperLabel{#pegms01 , "-->" , NULL_STRING , NULL_STRING}

	SELF:oCCesccod := PUSHBUTTON{SELF , ResourceID{ JCDAPUPRD_ESCCOD  , _GetInst() } }
	SELF:oCCesccod:HyperLabel := HyperLabel{#esccod , "..." , NULL_STRING , NULL_STRING}

	SELF:oCCchkclipro := PUSHBUTTON{SELF , ResourceID{ JCDAPUPRD_CHKCLIPRO  , _GetInst() } }
	SELF:oCCchkclipro:TooltipText := "Verificar os Nomes Clientes Produtos"
	SELF:oCCchkclipro:HyperLabel := HyperLabel{#chkclipro , "Checar Cliente Produto" , NULL_STRING , NULL_STRING}

	SELF:oCCbtnpegma01 := PUSHBUTTON{SELF , ResourceID{ JCDAPUPRD_BTNPEGMA01  , _GetInst() } }
	SELF:oCCbtnpegma01:TooltipText := "Clique para puxar o nome do cliente"
	SELF:oCCbtnpegma01:HyperLabel := HyperLabel{#btnpegma01 , "-->" , NULL_STRING , NULL_STRING}

	SELF:oCCescfor := PUSHBUTTON{SELF , ResourceID{ JCDAPUPRD_ESCFOR  , _GetInst() } }
	SELF:oCCescfor:TooltipText := "Clique Para Incluir um Cliente"
	SELF:oCCescfor:HyperLabel := HyperLabel{#escfor , "..." , NULL_STRING , NULL_STRING}

	SELF:oDCSC_CLIENTE := FIXEDTEXT{SELF , ResourceID{ JCDAPUPRD_SC_CLIENTE  , _GetInst() } }
	SELF:oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE , "Cliente:" , NULL_STRING , NULL_STRING}

	SELF:Caption := "Controle de produtos"
	SELF:Menu := STANDARDSHELLMENU{}
	SELF:HyperLabel := HyperLabel{#jcdapuprd , "Controle de produtos" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF

	SELF:Browser := DataBrowser{SELF}

	SELF:oDBCD := DataColumn{padrao_num_08{}}
	SELF:oDBCD:Width := 9
	SELF:oDBCD:HyperLabel := SELF:oDCCD:HyperLabel
	SELF:oDBCD:Caption := "Cd:"
	SELF:Browser:AddColumn(SELF:oDBCD)

	SELF:oDBANO := DataColumn{padrao_num_04{}}
	SELF:oDBANO:Width := 8
	SELF:oDBANO:HyperLabel := SELF:oDCANO:HyperLabel
	SELF:oDBANO:Caption := "Ano:"
	SELF:Browser:AddColumn(SELF:oDBANO)

	SELF:oDBCODIGO := DataColumn{padrao_char_24{}}
	SELF:oDBCODIGO:Width := 23
	SELF:oDBCODIGO:HyperLabel := SELF:oDCCODIGO:HyperLabel
	SELF:oDBCODIGO:Caption := "Codigo:"
	SELF:Browser:AddColumn(SELF:oDBCODIGO)

	SELF:oDBCODIGOINT := DataColumn{padrao_char_24{}}
	SELF:oDBCODIGOINT:Width := 23
	SELF:oDBCODIGOINT:HyperLabel := SELF:oDCCODIGOINT:HyperLabel
	SELF:oDBCODIGOINT:Caption := "Codigoint:"
	SELF:Browser:AddColumn(SELF:oDBCODIGOINT)

	SELF:oDBDATAINI := DataColumn{date_field{}}
	SELF:oDBDATAINI:Width := 9
	SELF:oDBDATAINI:HyperLabel := SELF:oDCDATAINI:HyperLabel
	SELF:oDBDATAINI:Caption := "Dataini:"
	SELF:Browser:AddColumn(SELF:oDBDATAINI)

	SELF:oDBDATAPRO := DataColumn{date_field{}}
	SELF:oDBDATAPRO:Width := 9
	SELF:oDBDATAPRO:HyperLabel := SELF:oDCDATAPRO:HyperLabel
	SELF:oDBDATAPRO:Caption := "Datapro:"
	SELF:Browser:AddColumn(SELF:oDBDATAPRO)

	SELF:oDBEAC := DataColumn{padrao_num_06{}}
	SELF:oDBEAC:Width := 12
	SELF:oDBEAC:HyperLabel := SELF:oDCEAC:HyperLabel
	SELF:oDBEAC:Caption := "Eac:"
	SELF:Browser:AddColumn(SELF:oDBEAC)

	SELF:oDBATIVA := DataColumn{padrao_char_01{}}
	SELF:oDBATIVA:Width := 4
	SELF:oDBATIVA:HyperLabel := SELF:oDCATIVA:HyperLabel
	SELF:oDBATIVA:Caption := "A"
	SELF:Browser:AddColumn(SELF:oDBATIVA)

	SELF:oDBMESESF := DataColumn{padrao_num_02{}}
	SELF:oDBMESESF:Width := 6
	SELF:oDBMESESF:HyperLabel := SELF:oDCMESESF:HyperLabel
	SELF:oDBMESESF:Caption := "MF"
	SELF:Browser:AddColumn(SELF:oDBMESESF)

	SELF:oDBMESESP := DataColumn{padrao_num_02{}}
	SELF:oDBMESESP:Width := 8
	SELF:oDBMESESP:HyperLabel := SELF:oDCMESESP:HyperLabel
	SELF:oDBMESESP:Caption := "MP"
	SELF:Browser:AddColumn(SELF:oDBMESESP)

	SELF:ViewAs(#FormView)


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS MES01
RETURN SELF:FieldGet( #MES01 )

ASSIGN MES01( uValue )
SELF:FieldPut( #MES01 , uValue )

ACCESS MES02
RETURN SELF:FieldGet( #MES02 )

ASSIGN MES02( uValue )
SELF:FieldPut( #MES02 , uValue )

ACCESS MES03
RETURN SELF:FieldGet( #MES03 )

ASSIGN MES03( uValue )
SELF:FieldPut( #MES03 , uValue )

ACCESS MES04
RETURN SELF:FieldGet( #MES04 )

ASSIGN MES04( uValue )
SELF:FieldPut( #MES04 , uValue )

ACCESS MES05
RETURN SELF:FieldGet( #MES05 )

ASSIGN MES05( uValue )
SELF:FieldPut( #MES05 , uValue )

ACCESS MES06
RETURN SELF:FieldGet( #MES06 )

ASSIGN MES06( uValue )
SELF:FieldPut( #MES06 , uValue )

ACCESS MES07
RETURN SELF:FieldGet( #MES07 )

ASSIGN MES07( uValue )
SELF:FieldPut( #MES07 , uValue )

ACCESS MES08
RETURN SELF:FieldGet( #MES08 )

ASSIGN MES08( uValue )
SELF:FieldPut( #MES08 , uValue )

ACCESS MES09
RETURN SELF:FieldGet( #MES09 )

ASSIGN MES09( uValue )
SELF:FieldPut( #MES09 , uValue )

ACCESS MES10
RETURN SELF:FieldGet( #MES10 )

ASSIGN MES10( uValue )
SELF:FieldPut( #MES10 , uValue )

ACCESS MES11
RETURN SELF:FieldGet( #MES11 )

ASSIGN MES11( uValue )
SELF:FieldPut( #MES11 , uValue )

ACCESS MES12
RETURN SELF:FieldGet( #MES12 )

ASSIGN MES12( uValue )
SELF:FieldPut( #MES12 , uValue )

ACCESS MESESF
RETURN SELF:FieldGet( #MESESF )

ASSIGN MESESF( uValue )
SELF:FieldPut( #MESESF , uValue )

ACCESS MESESP
RETURN SELF:FieldGet( #MESESP )

ASSIGN MESESP( uValue )
SELF:FieldPut( #MESESP , uValue )

ACCESS PRC01
RETURN SELF:FieldGet( #PRC01 )

ASSIGN PRC01( uValue )
SELF:FieldPut( #PRC01 , uValue )

ACCESS PRC02
RETURN SELF:FieldGet( #PRC02 )

ASSIGN PRC02( uValue )
SELF:FieldPut( #PRC02 , uValue )

ACCESS PRC03
RETURN SELF:FieldGet( #PRC03 )

ASSIGN PRC03( uValue )
SELF:FieldPut( #PRC03 , uValue )

ACCESS PRC04
RETURN SELF:FieldGet( #PRC04 )

ASSIGN PRC04( uValue )
SELF:FieldPut( #PRC04 , uValue )

ACCESS PRC05
RETURN SELF:FieldGet( #PRC05 )

ASSIGN PRC05( uValue )
SELF:FieldPut( #PRC05 , uValue )

ACCESS PRC06
RETURN SELF:FieldGet( #PRC06 )

ASSIGN PRC06( uValue )
SELF:FieldPut( #PRC06 , uValue )

ACCESS PRC07
RETURN SELF:FieldGet( #PRC07 )

ASSIGN PRC07( uValue )
SELF:FieldPut( #PRC07 , uValue )

ACCESS PRC08
RETURN SELF:FieldGet( #PRC08 )

ASSIGN PRC08( uValue )
SELF:FieldPut( #PRC08 , uValue )

ACCESS PRC09
RETURN SELF:FieldGet( #PRC09 )

ASSIGN PRC09( uValue )
SELF:FieldPut( #PRC09 , uValue )

ACCESS PRC10
RETURN SELF:FieldGet( #PRC10 )

ASSIGN PRC10( uValue )
SELF:FieldPut( #PRC10 , uValue )

ACCESS PRC11
RETURN SELF:FieldGet( #PRC11 )

ASSIGN PRC11( uValue )
SELF:FieldPut( #PRC11 , uValue )

ACCESS PRC12
RETURN SELF:FieldGet( #PRC12 )

ASSIGN PRC12( uValue )
SELF:FieldPut( #PRC12 , uValue )

ACCESS preco
RETURN SELF:FieldGet( #preco )

ASSIGN preco( uValue )
SELF:FieldPut( #preco , uValue )

END CLASS
STATIC DEFINE JCDAPUPRD_BTNPEGMA01 := 169
