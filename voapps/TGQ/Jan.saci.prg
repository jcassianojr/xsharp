#region DEFINES
STATIC DEFINE JSACI_ACAO := 123
STATIC DEFINE JSACI_ACAO01 := 103
STATIC DEFINE JSACI_ACAO02 := 102
STATIC DEFINE JSACI_ACAO03 := 101
STATIC DEFINE JSACI_ACAO04 := 100
STATIC DEFINE JSACI_ACAO05 := 143
STATIC DEFINE JSACI_ACAO06 := 144
STATIC DEFINE JSACI_ACAO07 := 145
STATIC DEFINE JSACI_ACAO08 := 146
STATIC DEFINE JSACI_ACAO09 := 147
STATIC DEFINE JSACI_ACAO10 := 148
STATIC DEFINE JSACI_ACM01 := 136
STATIC DEFINE JSACI_ACM02 := 135
STATIC DEFINE JSACI_ACM03 := 134
STATIC DEFINE JSACI_ACM04 := 133
STATIC DEFINE JSACI_ACM05 := 132
STATIC DEFINE JSACI_ACM06 := 131
STATIC DEFINE JSACI_AREA := 107
STATIC DEFINE JSACI_CAUSA := 120
STATIC DEFINE JSACI_DATAF := 115
STATIC DEFINE JSACI_DESARE := 106
STATIC DEFINE JSACI_FECHO := 112
STATIC DEFINE JSACI_INV01 := 127
STATIC DEFINE JSACI_INV02 := 126
STATIC DEFINE JSACI_INV03 := 125
STATIC DEFINE JSACI_INV04 := 124
STATIC DEFINE JSACI_INV05 := 130
STATIC DEFINE JSACI_INV06 := 129
STATIC DEFINE JSACI_INV07 := 139
STATIC DEFINE JSACI_INV08 := 140
STATIC DEFINE JSACI_INV09 := 141
STATIC DEFINE JSACI_INV10 := 142
STATIC DEFINE JSACI_LPAE := 138
STATIC DEFINE JSACI_POSICAO := 111
STATIC DEFINE JSACI_PRAZO := 116
STATIC DEFINE JSACI_RADIOBUTTON7 := 110
STATIC DEFINE JSACI_RADIOBUTTON9 := 108
STATIC DEFINE JSACI_RB1 := 109
STATIC DEFINE JSACI_RESPON := 105
STATIC DEFINE JSACI_SAC := 117
STATIC DEFINE JSACI_SC_SAC := 118
STATIC DEFINE JSACI_SC_SAC2 := 121
STATIC DEFINE JSACI_SC_SAC3 := 122
STATIC DEFINE JSACI_THEFIXEDTEXT16 := 114
STATIC DEFINE JSACI_THEFIXEDTEXT17 := 113
STATIC DEFINE JSACI_THEFIXEDTEXT18 := 119
STATIC DEFINE JSACI_THEGROUPBOX2 := 104
STATIC DEFINE JSACI_THEGROUPBOX3 := 128
STATIC DEFINE JSACI_THEGROUPBOX4 := 137
#endregion

PARTIAL CLASS jsaci INHERIT DATAWINDOW
PROTECT oDBSAC AS DataColumn
PROTECT oDBCAUSA AS DataColumn
PROTECT oDBACAO AS DataColumn
PROTECT oDBPRAZO AS DataColumn
PROTECT oDBDATAF AS DataColumn
PROTECT oDBFECHO AS DataColumn
PROTECT oDCACAO04 AS SINGLELINEEDIT
PROTECT oDCACAO03 AS SINGLELINEEDIT
PROTECT oDCACAO02 AS SINGLELINEEDIT
PROTECT oDCACAO01 AS SINGLELINEEDIT
PROTECT oDCtheGroupBox2 AS GROUPBOX
PROTECT oDCRESPON AS SINGLELINEEDIT
PROTECT oDCDESARE AS SINGLELINEEDIT
PROTECT oDCAREA AS COMBOBOX
PROTECT oCCRadioButton9 AS RADIOBUTTON
PROTECT oCCrb1 AS RADIOBUTTON
PROTECT oCCRadioButton7 AS RADIOBUTTON
PROTECT oDCPOSICAO AS RADIOBUTTONGROUP
PROTECT oDCFECHO AS DATETIMEPICKER
PROTECT oDCtheFixedText17 AS FIXEDTEXT
PROTECT oDCtheFixedText16 AS FIXEDTEXT
PROTECT oDCDATAF AS DATETIMEPICKER
PROTECT oDCPRAZO AS DATETIMEPICKER
PROTECT oDCSAC AS SINGLELINEEDIT
PROTECT oDCSC_SAC AS FIXEDTEXT
PROTECT oDCtheFixedText18 AS FIXEDTEXT
PROTECT oDCCAUSA AS SINGLELINEEDIT
PROTECT oDCSC_SAC2 AS FIXEDTEXT
PROTECT oDCSC_SAC3 AS FIXEDTEXT
PROTECT oDCACAO AS SINGLELINEEDIT
PROTECT oDCINV04 AS SINGLELINEEDIT
PROTECT oDCINV03 AS SINGLELINEEDIT
PROTECT oDCINV02 AS SINGLELINEEDIT
PROTECT oDCINV01 AS SINGLELINEEDIT
PROTECT oDCtheGroupBox3 AS GROUPBOX
PROTECT oDCINV06 AS SINGLELINEEDIT
PROTECT oDCINV05 AS SINGLELINEEDIT
PROTECT oDCACM06 AS SINGLELINEEDIT
PROTECT oDCACM05 AS SINGLELINEEDIT
PROTECT oDCACM04 AS SINGLELINEEDIT
PROTECT oDCACM03 AS SINGLELINEEDIT
PROTECT oDCACM02 AS SINGLELINEEDIT
PROTECT oDCACM01 AS SINGLELINEEDIT
PROTECT oDCtheGroupBox4 AS GROUPBOX
PROTECT oDCLPAE AS CHECKBOX
PROTECT oDCINV07 AS SINGLELINEEDIT
PROTECT oDCINV08 AS SINGLELINEEDIT
PROTECT oDCINV09 AS SINGLELINEEDIT
PROTECT oDCINV10 AS SINGLELINEEDIT
PROTECT oDCACAO05 AS SINGLELINEEDIT
PROTECT oDCACAO06 AS SINGLELINEEDIT
PROTECT oDCACAO07 AS SINGLELINEEDIT
PROTECT oDCACAO08 AS SINGLELINEEDIT
PROTECT oDCACAO09 AS SINGLELINEEDIT
PROTECT oDCACAO10 AS SINGLELINEEDIT

// User code starts here (DO NOT remove this line)  ##USER##

ACCESS ACAO
RETURN SELF:FieldGet( #ACAO )

ASSIGN ACAO( uValue )
SELF:FieldPut( #ACAO , uValue )

ACCESS ACAO01
RETURN SELF:FieldGet( #ACAO01 )

ASSIGN ACAO01( uValue )
SELF:FieldPut( #ACAO01 , uValue )

ACCESS ACAO02
RETURN SELF:FieldGet( #ACAO02 )

ASSIGN ACAO02( uValue )
SELF:FieldPut( #ACAO02 , uValue )

ACCESS ACAO03
RETURN SELF:FieldGet( #ACAO03 )

ASSIGN ACAO03( uValue )
SELF:FieldPut( #ACAO03 , uValue )

ACCESS ACAO04
RETURN SELF:FieldGet( #ACAO04 )

ASSIGN ACAO04( uValue )
SELF:FieldPut( #ACAO04 , uValue )

ACCESS ACAO05
RETURN SELF:FieldGet( #ACAO05 )

ASSIGN ACAO05( uValue )
SELF:FieldPut( #ACAO05 , uValue )

ACCESS ACAO06
RETURN SELF:FieldGet( #ACAO06 )

ASSIGN ACAO06( uValue )
SELF:FieldPut( #ACAO06 , uValue )

ACCESS ACAO07
RETURN SELF:FieldGet( #ACAO07 )

ASSIGN ACAO07( uValue )
SELF:FieldPut( #ACAO07 , uValue )

ACCESS ACAO08
RETURN SELF:FieldGet( #ACAO08 )

ASSIGN ACAO08( uValue )
SELF:FieldPut( #ACAO08 , uValue )

ACCESS ACAO09
RETURN SELF:FieldGet( #ACAO09 )

ASSIGN ACAO09( uValue )
SELF:FieldPut( #ACAO09 , uValue )

ACCESS ACAO10
RETURN SELF:FieldGet( #ACAO10 )

ASSIGN ACAO10( uValue )
SELF:FieldPut( #ACAO10 , uValue )

ACCESS ACM01
RETURN SELF:FieldGet( #ACM01 )

ASSIGN ACM01( uValue )
SELF:FieldPut( #ACM01 , uValue )

ACCESS ACM02
RETURN SELF:FieldGet( #ACM02 )

ASSIGN ACM02( uValue )
SELF:FieldPut( #ACM02 , uValue )

ACCESS ACM03
RETURN SELF:FieldGet( #ACM03 )

ASSIGN ACM03( uValue )
SELF:FieldPut( #ACM03 , uValue )

ACCESS ACM04
RETURN SELF:FieldGet( #ACM04 )

ASSIGN ACM04( uValue )
SELF:FieldPut( #ACM04 , uValue )

ACCESS ACM05
RETURN SELF:FieldGet( #ACM05 )

ASSIGN ACM05( uValue )
SELF:FieldPut( #ACM05 , uValue )

ACCESS ACM06
RETURN SELF:FieldGet( #ACM06 )

ASSIGN ACM06( uValue )
SELF:FieldPut( #ACM06 , uValue )

ACCESS AREA
RETURN SELF:FieldGet( #AREA )

ASSIGN AREA( uValue )
SELF:FieldPut( #AREA , uValue )

ACCESS CAUSA
RETURN SELF:FieldGet( #CAUSA )

ASSIGN CAUSA( uValue )
SELF:FieldPut( #CAUSA , uValue )

ACCESS DESARE
RETURN SELF:FieldGet( #DESARE )

ASSIGN DESARE( uValue )
SELF:FieldPut( #DESARE , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"jsaci" , _GetInst()},iCtlID)

	SELF:oDCACAO04 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACAO04  , _GetInst() } }
	SELF:oDCACAO04:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACAO04:HyperLabel := HyperLabel{#ACAO04 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCACAO03 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACAO03  , _GetInst() } }
	SELF:oDCACAO03:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACAO03:HyperLabel := HyperLabel{#ACAO03 , "Desc03:" , NULL_STRING , "SAC_DESC03"}

	SELF:oDCACAO02 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACAO02  , _GetInst() } }
	SELF:oDCACAO02:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACAO02:HyperLabel := HyperLabel{#ACAO02 , "Desc02:" , NULL_STRING , "SAC_DESC02"}

	SELF:oDCACAO01 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACAO01  , _GetInst() } }
	SELF:oDCACAO01:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACAO01:HyperLabel := HyperLabel{#ACAO01 , "Desc01:" , NULL_STRING , "SAC_DESC01"}

	SELF:oDCtheGroupBox2 := GROUPBOX{SELF , ResourceID{ JSACI_THEGROUPBOX2  , _GetInst() } }
	SELF:oDCtheGroupBox2:HyperLabel := HyperLabel{#theGroupBox2 , "A��es Corretivas - Corre��o Problemas" , NULL_STRING , NULL_STRING}

	SELF:oDCRESPON := SINGLELINEEDIT{SELF , ResourceID{ JSACI_RESPON  , _GetInst() } }
	SELF:oDCRESPON:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCRESPON:HyperLabel := HyperLabel{#RESPON , "Respon:" , NULL_STRING , "SAC_RESPON"}

	SELF:oDCDESARE := SINGLELINEEDIT{SELF , ResourceID{ JSACI_DESARE  , _GetInst() } }
	SELF:oDCDESARE:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCDESARE:HyperLabel := HyperLabel{#DESARE , "Desare:" , NULL_STRING , "SAC_DESARE"}

	SELF:oDCAREA := COMBOBOX{SELF , ResourceID{ JSACI_AREA  , _GetInst() } }
	SELF:oDCAREA:FillUsing( SELF:comboPEGMP05() )
	SELF:oDCAREA:FieldSpec := PADRAO_CHAR_02{}
	SELF:oDCAREA:HyperLabel := HyperLabel{#AREA , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCRadioButton9 := RADIOBUTTON{SELF , ResourceID{ JSACI_RADIOBUTTON9  , _GetInst() } }
	SELF:oCCRadioButton9:HyperLabel := HyperLabel{#RadioButton9 , "Concluido" , NULL_STRING , NULL_STRING}

	SELF:oCCrb1 := RADIOBUTTON{SELF , ResourceID{ JSACI_RB1  , _GetInst() } }
	SELF:oCCrb1:HyperLabel := HyperLabel{#rb1 , "Em Execu��o" , NULL_STRING , NULL_STRING}

	SELF:oCCRadioButton7 := RADIOBUTTON{SELF , ResourceID{ JSACI_RADIOBUTTON7  , _GetInst() } }
	SELF:oCCRadioButton7:HyperLabel := HyperLabel{#RadioButton7 , "N�o Executado" , NULL_STRING , NULL_STRING}

	SELF:oDCPOSICAO := RADIOBUTTONGROUP{SELF , ResourceID{ JSACI_POSICAO  , _GetInst() } }
	SELF:oDCPOSICAO:FieldSpec := padrao_char_01{}
	SELF:oDCPOSICAO:HyperLabel := HyperLabel{#POSICAO , "Sit" , NULL_STRING , NULL_STRING}

	SELF:oDCFECHO := DATETIMEPICKER{SELF , ResourceID{ JSACI_FECHO  , _GetInst() } }
	SELF:oDCFECHO:FieldSpec := date_field{}
	SELF:oDCFECHO:HyperLabel := HyperLabel{#FECHO , "Fechamento" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText17 := FIXEDTEXT{SELF , ResourceID{ JSACI_THEFIXEDTEXT17  , _GetInst() } }
	SELF:oDCtheFixedText17:HyperLabel := HyperLabel{#theFixedText17 , "Fechamento" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText16 := FIXEDTEXT{SELF , ResourceID{ JSACI_THEFIXEDTEXT16  , _GetInst() } }
	SELF:oDCtheFixedText16:HyperLabel := HyperLabel{#theFixedText16 , "Follow Up" , NULL_STRING , NULL_STRING}

	SELF:oDCDATAF := DATETIMEPICKER{SELF , ResourceID{ JSACI_DATAF  , _GetInst() } }
	SELF:oDCDATAF:FieldSpec := date_field{}
	SELF:oDCDATAF:HyperLabel := HyperLabel{#DATAF , "Follow Up" , NULL_STRING , NULL_STRING}

	SELF:oDCPRAZO := DATETIMEPICKER{SELF , ResourceID{ JSACI_PRAZO  , _GetInst() } }
	SELF:oDCPRAZO:FieldSpec := date_field{}
	SELF:oDCPRAZO:HyperLabel := HyperLabel{#PRAZO , "Prazo" , NULL_STRING , NULL_STRING}

	SELF:oDCSAC := SINGLELINEEDIT{SELF , ResourceID{ JSACI_SAC  , _GetInst() } }
	SELF:oDCSAC:FieldSpec := padrao_num_08{}
	SELF:oDCSAC:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCSAC:Font( oFont )
	SELF:oDCSAC:HyperLabel := HyperLabel{#SAC , "Sac:" , NULL_STRING , "SAC_SAC"}

	SELF:oDCSC_SAC := FIXEDTEXT{SELF , ResourceID{ JSACI_SC_SAC  , _GetInst() } }
	SELF:oDCSC_SAC:HyperLabel := HyperLabel{#SC_SAC , "Sac:" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText18 := FIXEDTEXT{SELF , ResourceID{ JSACI_THEFIXEDTEXT18  , _GetInst() } }
	SELF:oDCtheFixedText18:HyperLabel := HyperLabel{#theFixedText18 , "Prazo" , NULL_STRING , NULL_STRING}

	SELF:oDCCAUSA := SINGLELINEEDIT{SELF , ResourceID{ JSACI_CAUSA  , _GetInst() } }
	SELF:oDCCAUSA:FieldSpec := padrao_num_03{}
	SELF:oDCCAUSA:HyperLabel := HyperLabel{#CAUSA , "Causa" , NULL_STRING , "SAC_SAC"}

	SELF:oDCSC_SAC2 := FIXEDTEXT{SELF , ResourceID{ JSACI_SC_SAC2  , _GetInst() } }
	SELF:oDCSC_SAC2:HyperLabel := HyperLabel{#SC_SAC2 , "Causa" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_SAC3 := FIXEDTEXT{SELF , ResourceID{ JSACI_SC_SAC3  , _GetInst() } }
	SELF:oDCSC_SAC3:HyperLabel := HyperLabel{#SC_SAC3 , "A��o" , NULL_STRING , NULL_STRING}

	SELF:oDCACAO := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACAO  , _GetInst() } }
	SELF:oDCACAO:FieldSpec := padrao_num_03{}
	SELF:oDCACAO:HyperLabel := HyperLabel{#ACAO , "A��o" , NULL_STRING , "SAC_SAC"}

	SELF:oDCINV04 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_INV04  , _GetInst() } }
	SELF:oDCINV04:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCINV04:HyperLabel := HyperLabel{#INV04 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCINV03 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_INV03  , _GetInst() } }
	SELF:oDCINV03:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCINV03:HyperLabel := HyperLabel{#INV03 , "Desc03:" , NULL_STRING , "SAC_DESC03"}

	SELF:oDCINV02 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_INV02  , _GetInst() } }
	SELF:oDCINV02:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCINV02:HyperLabel := HyperLabel{#INV02 , "Desc02:" , NULL_STRING , "SAC_DESC02"}

	SELF:oDCINV01 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_INV01  , _GetInst() } }
	SELF:oDCINV01:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCINV01:HyperLabel := HyperLabel{#INV01 , "Desc01:" , NULL_STRING , "SAC_DESC01"}

	SELF:oDCtheGroupBox3 := GROUPBOX{SELF , ResourceID{ JSACI_THEGROUPBOX3  , _GetInst() } }
	SELF:oDCtheGroupBox3:HyperLabel := HyperLabel{#theGroupBox3 , "Investigacao da Causa" , NULL_STRING , NULL_STRING}

	SELF:oDCINV06 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_INV06  , _GetInst() } }
	SELF:oDCINV06:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCINV06:HyperLabel := HyperLabel{#INV06 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCINV05 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_INV05  , _GetInst() } }
	SELF:oDCINV05:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCINV05:HyperLabel := HyperLabel{#INV05 , "Desc03:" , NULL_STRING , "SAC_DESC03"}

	SELF:oDCACM06 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACM06  , _GetInst() } }
	SELF:oDCACM06:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACM06:HyperLabel := HyperLabel{#ACM06 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCACM05 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACM05  , _GetInst() } }
	SELF:oDCACM05:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACM05:HyperLabel := HyperLabel{#ACM05 , "Desc03:" , NULL_STRING , "SAC_DESC03"}

	SELF:oDCACM04 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACM04  , _GetInst() } }
	SELF:oDCACM04:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACM04:HyperLabel := HyperLabel{#ACM04 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCACM03 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACM03  , _GetInst() } }
	SELF:oDCACM03:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACM03:HyperLabel := HyperLabel{#ACM03 , "Desc03:" , NULL_STRING , "SAC_DESC03"}

	SELF:oDCACM02 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACM02  , _GetInst() } }
	SELF:oDCACM02:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACM02:HyperLabel := HyperLabel{#ACM02 , "Desc02:" , NULL_STRING , "SAC_DESC02"}

	SELF:oDCACM01 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACM01  , _GetInst() } }
	SELF:oDCACM01:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACM01:HyperLabel := HyperLabel{#ACM01 , "Desc01:" , NULL_STRING , "SAC_DESC01"}

	SELF:oDCtheGroupBox4 := GROUPBOX{SELF , ResourceID{ JSACI_THEGROUPBOX4  , _GetInst() } }
	SELF:oDCtheGroupBox4:HyperLabel := HyperLabel{#theGroupBox4 , "Acompanhamento da Eficacia" , NULL_STRING , NULL_STRING}

	SELF:oDCLPAE := CHECKBOX{SELF , ResourceID{ JSACI_LPAE  , _GetInst() } }
	SELF:oDCLPAE:FieldSpec := logic_field{}
	SELF:oDCLPAE:HyperLabel := HyperLabel{#LPAE , "Plano Aud Emb." , NULL_STRING , NULL_STRING}

	SELF:oDCINV07 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_INV07  , _GetInst() } }
	SELF:oDCINV07:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCINV07:HyperLabel := HyperLabel{#INV07 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCINV08 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_INV08  , _GetInst() } }
	SELF:oDCINV08:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCINV08:HyperLabel := HyperLabel{#INV08 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCINV09 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_INV09  , _GetInst() } }
	SELF:oDCINV09:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCINV09:HyperLabel := HyperLabel{#INV09 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCINV10 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_INV10  , _GetInst() } }
	SELF:oDCINV10:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCINV10:HyperLabel := HyperLabel{#INV10 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCACAO05 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACAO05  , _GetInst() } }
	SELF:oDCACAO05:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACAO05:HyperLabel := HyperLabel{#ACAO05 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCACAO06 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACAO06  , _GetInst() } }
	SELF:oDCACAO06:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACAO06:HyperLabel := HyperLabel{#ACAO06 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCACAO07 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACAO07  , _GetInst() } }
	SELF:oDCACAO07:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACAO07:HyperLabel := HyperLabel{#ACAO07 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCACAO08 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACAO08  , _GetInst() } }
	SELF:oDCACAO08:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACAO08:HyperLabel := HyperLabel{#ACAO08 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCACAO09 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACAO09  , _GetInst() } }
	SELF:oDCACAO09:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACAO09:HyperLabel := HyperLabel{#ACAO09 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCACAO10 := SINGLELINEEDIT{SELF , ResourceID{ JSACI_ACAO10  , _GetInst() } }
	SELF:oDCACAO10:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCACAO10:HyperLabel := HyperLabel{#ACAO10 , "Desc04:" , NULL_STRING , "SAC_DESC04"}

	SELF:oDCPOSICAO:FillUsing({ ;
	                          {SELF:oCCRadioButton9, "C"}, ;
	                          {SELF:oCCrb1, "E"}, ;
	                          {SELF:oCCRadioButton7, "N"} ;
	                          })

	SELF:Caption := "Itens Sac"
	SELF:HyperLabel := HyperLabel{#jsaci , "Itens Sac" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF

	SELF:Browser := DataBrowser{SELF}

	SELF:oDBSAC := DataColumn{padrao_num_08{}}
	SELF:oDBSAC:Width := 8
	SELF:oDBSAC:HyperLabel := SELF:oDCSAC:HyperLabel
	SELF:oDBSAC:Caption := "Sac:"
	SELF:Browser:AddColumn(SELF:oDBSAC)

	SELF:oDBCAUSA := DataColumn{padrao_num_03{}}
	SELF:oDBCAUSA:Width := 6
	SELF:oDBCAUSA:HyperLabel := SELF:oDCCAUSA:HyperLabel
	SELF:oDBCAUSA:Caption := "Causa"
	SELF:Browser:AddColumn(SELF:oDBCAUSA)

	SELF:oDBACAO := DataColumn{padrao_num_03{}}
	SELF:oDBACAO:Width := 6
	SELF:oDBACAO:HyperLabel := SELF:oDCACAO:HyperLabel
	SELF:oDBACAO:Caption := "A��o"
	SELF:Browser:AddColumn(SELF:oDBACAO)

	SELF:oDBPRAZO := DataColumn{date_field{}}
	SELF:oDBPRAZO:Width := 12
	SELF:oDBPRAZO:HyperLabel := SELF:oDCPRAZO:HyperLabel
	SELF:oDBPRAZO:Caption := "Prazo"
	SELF:Browser:AddColumn(SELF:oDBPRAZO)

	SELF:oDBDATAF := DataColumn{date_field{}}
	SELF:oDBDATAF:Width := 11
	SELF:oDBDATAF:HyperLabel := SELF:oDCDATAF:HyperLabel
	SELF:oDBDATAF:Caption := "Follow Up"
	SELF:Browser:AddColumn(SELF:oDBDATAF)

	SELF:oDBFECHO := DataColumn{date_field{}}
	SELF:oDBFECHO:Width := 13
	SELF:oDBFECHO:HyperLabel := SELF:oDCFECHO:HyperLabel
	SELF:oDBFECHO:Caption := "Fechamento"
	SELF:Browser:AddColumn(SELF:oDBFECHO)

	SELF:ViewAs(#BrowseView)


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS INV01
RETURN SELF:FieldGet( #INV01 )

ASSIGN INV01( uValue )
SELF:FieldPut( #INV01 , uValue )

ACCESS INV02
RETURN SELF:FieldGet( #INV02 )

ASSIGN INV02( uValue )
SELF:FieldPut( #INV02 , uValue )

ACCESS INV03
RETURN SELF:FieldGet( #INV03 )

ASSIGN INV03( uValue )
SELF:FieldPut( #INV03 , uValue )

ACCESS INV04
RETURN SELF:FieldGet( #INV04 )

ASSIGN INV04( uValue )
SELF:FieldPut( #INV04 , uValue )

ACCESS INV05
RETURN SELF:FieldGet( #INV05 )

ASSIGN INV05( uValue )
SELF:FieldPut( #INV05 , uValue )

ACCESS INV06
RETURN SELF:FieldGet( #INV06 )

ASSIGN INV06( uValue )
SELF:FieldPut( #INV06 , uValue )

ACCESS INV07
RETURN SELF:FieldGet( #INV07 )

ASSIGN INV07( uValue )
SELF:FieldPut( #INV07 , uValue )

ACCESS INV08
RETURN SELF:FieldGet( #INV08 )

ASSIGN INV08( uValue )
SELF:FieldPut( #INV08 , uValue )

ACCESS INV09
RETURN SELF:FieldGet( #INV09 )

ASSIGN INV09( uValue )
SELF:FieldPut( #INV09 , uValue )

ACCESS INV10
RETURN SELF:FieldGet( #INV10 )

ASSIGN INV10( uValue )
SELF:FieldPut( #INV10 , uValue )

ACCESS LPAE
RETURN SELF:FieldGet( #LPAE )

ASSIGN LPAE( uValue )
SELF:FieldPut( #LPAE , uValue )

ACCESS POSICAO
RETURN SELF:FieldGet( #POSICAO )

ASSIGN POSICAO( uValue )
SELF:FieldPut( #POSICAO , uValue )

ACCESS RESPON
RETURN SELF:FieldGet( #RESPON )

ASSIGN RESPON( uValue )
SELF:FieldPut( #RESPON , uValue )

ACCESS SAC
RETURN SELF:FieldGet( #SAC )

ASSIGN SAC( uValue )
SELF:FieldPut( #SAC , uValue )

END CLASS
