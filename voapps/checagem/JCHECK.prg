#region DEFINES
STATIC DEFINE _JCHECK_CGC := 100
STATIC DEFINE _JCHECK_CPF := 101
STATIC DEFINE _JCHECK_PIS := 102
STATIC DEFINE _JCHECK_IE := 103
STATIC DEFINE _JCHECK_UF := 104
STATIC DEFINE _JCHECK_CEI := 105
STATIC DEFINE _JCHECK_FGTS := 106
STATIC DEFINE _JCHECK_AGENCIA := 107
STATIC DEFINE _JCHECK_CONTA := 108
STATIC DEFINE _JCHECK_CARTAO := 109
STATIC DEFINE _JCHECK_RENAVAM := 110
STATIC DEFINE _JCHECK_RG := 111
STATIC DEFINE _JCHECK_CHECKCGC := 112
STATIC DEFINE _JCHECK_CHECKCPF := 113
STATIC DEFINE _JCHECK_CHECKPIS := 114
STATIC DEFINE _JCHECK_CHECKIE := 115
STATIC DEFINE _JCHECK_FIXEDTEXT1 := 116
STATIC DEFINE _JCHECK_CHECKCEI := 117
STATIC DEFINE _JCHECK_CHECKFGTS := 118
STATIC DEFINE _JCHECK_FIXEDTEXT2 := 119
STATIC DEFINE _JCHECK_FIXEDTEXT3 := 120
STATIC DEFINE _JCHECK_BANCO := 121
STATIC DEFINE _JCHECK_FIXEDTEXT4 := 122
STATIC DEFINE _JCHECK_FIXEDTEXT5 := 123
STATIC DEFINE _JCHECK_FIXEDTEXT6 := 124
STATIC DEFINE _JCHECK_CHECKCC := 125
STATIC DEFINE _JCHECK_THEFIXEDTEXT9 := 126
STATIC DEFINE _JCHECK_SAIR := 127
STATIC DEFINE _JCHECK_CHECKCARTAO := 128
STATIC DEFINE _JCHECK_CHECKIE1 := 129
STATIC DEFINE _JCHECK_CMD033 := 130
STATIC DEFINE _JCHECK_CMD237 := 131
STATIC DEFINE _JCHECK_CMD341 := 132
STATIC DEFINE _JCHECK_CHECKCARTAO1 := 133
STATIC DEFINE _JCHECK_CHECKRGCLICK := 134
STATIC DEFINE _JCHECK_CHECKTIT := 135
STATIC DEFINE _JCHECK_TITULO := 136
STATIC DEFINE _JCHECK_CHECKCNS := 137
STATIC DEFINE _JCHECK_CNS := 138
STATIC DEFINE _JCHECK_TXTEMAIL := 139
STATIC DEFINE _JCHECK_BTNCHECKEMAIL := 140
#endregion

CLASS _JCheck INHERIT DATADIALOG
	PROTECT oDBcgc AS DataColumn
	PROTECT oDBcpf AS DataColumn
	PROTECT oDBPIS AS DataColumn
	PROTECT oDBIE AS DataColumn
	PROTECT oDBUF AS DataColumn
	PROTECT oDBCEI AS DataColumn
	PROTECT oDBFGTS AS DataColumn
	PROTECT oDBagencia AS DataColumn
	PROTECT oDBconta AS DataColumn
	PROTECT oDBcartao AS DataColumn
	PROTECT oDBrenavam AS DataColumn
	PROTECT oDBRG AS DataColumn
	PROTECT oDBbanco AS DataColumn
	PROTECT oDBTITULO AS DataColumn
	PROTECT oDBcns AS DataColumn
	PROTECT oDCcgc AS SINGLELINEEDIT
	PROTECT oDCcpf AS SINGLELINEEDIT
	PROTECT oDCPIS AS SINGLELINEEDIT
	PROTECT oDCIE AS SINGLELINEEDIT
	PROTECT oDCUF AS SINGLELINEEDIT
	PROTECT oDCCEI AS SINGLELINEEDIT
	PROTECT oDCFGTS AS SINGLELINEEDIT
	PROTECT oDCagencia AS SINGLELINEEDIT
	PROTECT oDCconta AS SINGLELINEEDIT
	PROTECT oDCcartao AS SINGLELINEEDIT
	PROTECT oDCrenavam AS SINGLELINEEDIT
	PROTECT oDCRG AS SINGLELINEEDIT
	PROTECT oCCcheckcgc AS PUSHBUTTON
	PROTECT oCCcheckcPF AS PUSHBUTTON
	PROTECT oCCcheckPIS AS PUSHBUTTON
	PROTECT oCCcheckIE AS PUSHBUTTON
	PROTECT oDCFixedText1 AS FIXEDTEXT
	PROTECT oCCcheckCEI AS PUSHBUTTON
	PROTECT oCCcheckFGTS AS PUSHBUTTON
	PROTECT oDCFixedText2 AS FIXEDTEXT
	PROTECT oDCFixedText3 AS FIXEDTEXT
	PROTECT oDCbanco AS SINGLELINEEDIT
	PROTECT oDCFixedText4 AS FIXEDTEXT
	PROTECT oDCFixedText5 AS FIXEDTEXT
	PROTECT oDCFixedText6 AS FIXEDTEXT
	PROTECT oCCcheckcc AS PUSHBUTTON
	PROTECT oDCtheFixedText9 AS FIXEDTEXT
	PROTECT oCCSAIR AS PUSHBUTTON
	PROTECT oCCcheckcartao AS PUSHBUTTON
	PROTECT oCCcheckIE1 AS PUSHBUTTON
	PROTECT oCCcmd033 AS PUSHBUTTON
	PROTECT oCCcmd237 AS PUSHBUTTON
	PROTECT oCCCMD341 AS PUSHBUTTON
	PROTECT oCCcheckcartao1 AS PUSHBUTTON
	PROTECT oCCcheckrgClick AS PUSHBUTTON
	PROTECT oCCcheckTIT AS PUSHBUTTON
	PROTECT oDCTITULO AS SINGLELINEEDIT
	PROTECT oCCcheckcns AS PUSHBUTTON
	PROTECT oDCcns AS SINGLELINEEDIT
	PROTECT oDCtxtEmail AS SINGLELINEEDIT
	PROTECT oCCbtnCheckEmail AS PUSHBUTTON

	// {{%UC%}} User code starts here (DO NOT remove this line)  

ACCESS agencia
RETURN SELF:FieldGet( #agencia )

ASSIGN agencia( uValue )
SELF:FieldPut( #agencia , uValue )

ACCESS banco
RETURN SELF:FieldGet( #banco )

ASSIGN banco( uValue )
SELF:FieldPut( #banco , uValue )

ACCESS cartao
RETURN SELF:FieldGet( #cartao )

ASSIGN cartao( uValue )
SELF:FieldPut( #cartao , uValue )

ACCESS CEI
RETURN SELF:FieldGet( #CEI )

ASSIGN CEI( uValue )
SELF:FieldPut( #CEI , uValue )

ACCESS cgc
RETURN SELF:FieldGet( #cgc )

ASSIGN cgc( uValue )
SELF:FieldPut( #cgc , uValue )

ACCESS cns
RETURN SELF:FieldGet( #cns )

ASSIGN cns( uValue )
SELF:FieldPut( #cns , uValue )

ACCESS conta
RETURN SELF:FieldGet( #conta )

ASSIGN conta( uValue )
SELF:FieldPut( #conta , uValue )

ACCESS cpf
RETURN SELF:FieldGet( #cpf )

ASSIGN cpf( uValue )
SELF:FieldPut( #cpf , uValue )

ACCESS FGTS
RETURN SELF:FieldGet( #FGTS )

ASSIGN FGTS( uValue )
SELF:FieldPut( #FGTS , uValue )

ACCESS IE
RETURN SELF:FieldGet( #IE )

ASSIGN IE( uValue )
SELF:FieldPut( #IE , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"_JCheck" , _GetInst()},iCtlID)

	SELF:oDCcgc := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_CGC  , _GetInst() } }
	SELF:oDCcgc:HyperLabel := HyperLabel{#cgc , "cgc" , NULL_STRING , NULL_STRING}
	SELF:oDCcgc:FieldSpec := padrao_char_18{}
	SELF:oDCcgc:TooltipText := "Digite o CGC"
	SELF:oDCcgc:Picture := "NN.NNN.NNN/NNNN-99"

	SELF:oDCcpf := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_CPF  , _GetInst() } }
	SELF:oDCcpf:HyperLabel := HyperLabel{#cpf , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCcpf:FieldSpec := padrao_char_14{}
	SELF:oDCcpf:TooltipText := "Digite o CPF"
	SELF:oDCcpf:Picture := "999.999.999-99"

	SELF:oDCPIS := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_PIS  , _GetInst() } }
	SELF:oDCPIS:HyperLabel := HyperLabel{#PIS , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCPIS:FieldSpec := padrao_char_11{}
	SELF:oDCPIS:TooltipText := "Digite o Pis"

	SELF:oDCIE := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_IE  , _GetInst() } }
	SELF:oDCIE:HyperLabel := HyperLabel{#IE , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCIE:FieldSpec := PADRAO_CHAR_16{}
	SELF:oDCIE:TooltipText := "Digite a Inscricao Estadual"

	SELF:oDCUF := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_UF  , _GetInst() } }
	SELF:oDCUF:HyperLabel := HyperLabel{#UF , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCUF:FieldSpec := UF_FIELD{}
	SELF:oDCUF:TooltipText := "Digite o Estado"

	SELF:oDCCEI := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_CEI  , _GetInst() } }
	SELF:oDCCEI:HyperLabel := HyperLabel{#CEI , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCCEI:FieldSpec := padrao_char_12{}
	SELF:oDCCEI:TooltipText := "Digite o CEI"

	SELF:oDCFGTS := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_FGTS  , _GetInst() } }
	SELF:oDCFGTS:HyperLabel := HyperLabel{#FGTS , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCFGTS:FieldSpec := padrao_char_11{}
	SELF:oDCFGTS:TooltipText := "Digite o Numero conta FGTS"

	SELF:oDCagencia := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_AGENCIA  , _GetInst() } }
	SELF:oDCagencia:HyperLabel := HyperLabel{#agencia , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCagencia:FieldSpec := paDRAO_CHAR_07{}
	SELF:oDCagencia:TooltipText := "Digite o Nome da Agencia"

	SELF:oDCconta := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_CONTA  , _GetInst() } }
	SELF:oDCconta:HyperLabel := HyperLabel{#conta , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCconta:FieldSpec := padrao_char_12{}
	SELF:oDCconta:TooltipText := "Digite o Numero da Conta"

	SELF:oDCcartao := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_CARTAO  , _GetInst() } }
	SELF:oDCcartao:HyperLabel := HyperLabel{#cartao , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCcartao:FieldSpec := PADRAO_CHAR_20{}
	SELF:oDCcartao:TooltipText := "Digite o Numero Cartao Credito"

	SELF:oDCrenavam := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_RENAVAM  , _GetInst() } }
	SELF:oDCrenavam:HyperLabel := HyperLabel{#renavam , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCrenavam:FieldSpec := PADRAO_CHAR_20{}
	SELF:oDCrenavam:TooltipText := "Digite o Numero Renavam"

	SELF:oDCRG := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_RG  , _GetInst() } }
	SELF:oDCRG:HyperLabel := HyperLabel{#RG , "RG" , NULL_STRING , NULL_STRING}
	SELF:oDCRG:FieldSpec := PADRAO_CHAR_12{}
	SELF:oDCRG:TooltipText := "Digite o Numero RGCarteira de Identidade"

	SELF:oCCcheckcgc := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCGC  , _GetInst() } }
	SELF:oCCcheckcgc:HyperLabel := HyperLabel{#checkcgc , "Checar CNPJ" , NULL_STRING , NULL_STRING}
	SELF:oCCcheckcgc:TooltipText := "Checar CNPJ/CGC"

	SELF:oCCcheckcPF := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCPF  , _GetInst() } }
	SELF:oCCcheckcPF:HyperLabel := HyperLabel{#checkcPF , "Checar CPF" , NULL_STRING , NULL_STRING}
	SELF:oCCcheckcPF:TooltipText := "Checar CPF"

	SELF:oCCcheckPIS := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKPIS  , _GetInst() } }
	SELF:oCCcheckPIS:HyperLabel := HyperLabel{#checkPIS , "Checar PIS" , NULL_STRING , NULL_STRING}
	SELF:oCCcheckPIS:TooltipText := "Checar PIS"

	SELF:oCCcheckIE := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKIE  , _GetInst() } }
	SELF:oCCcheckIE:HyperLabel := HyperLabel{#checkIE , "Checar Insc Est." , NULL_STRING , NULL_STRING}
	SELF:oCCcheckIE:TooltipText := "Checar Insc.Estadual"

	SELF:oDCFixedText1 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_FIXEDTEXT1  , _GetInst() } }
	SELF:oDCFixedText1:HyperLabel := HyperLabel{#FixedText1 , "UF" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckCEI := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCEI  , _GetInst() } }
	SELF:oCCcheckCEI:HyperLabel := HyperLabel{#checkCEI , "Checar CEI" , NULL_STRING , NULL_STRING}
	SELF:oCCcheckCEI:TooltipText := "Checar Cei"

	SELF:oCCcheckFGTS := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKFGTS  , _GetInst() } }
	SELF:oCCcheckFGTS:HyperLabel := HyperLabel{#checkFGTS , "Checar Conta FGTS" , NULL_STRING , NULL_STRING}
	SELF:oCCcheckFGTS:TooltipText := "Checar Conta FGTS"

	SELF:oDCFixedText2 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_FIXEDTEXT2  , _GetInst() } }
	SELF:oDCFixedText2:HyperLabel := HyperLabel{#FixedText2 , "Preencha O CGC Acima" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText3 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_FIXEDTEXT3  , _GetInst() } }
	SELF:oDCFixedText3:HyperLabel := HyperLabel{#FixedText3 , "Obs: Checagem de Referência Apenas" , NULL_STRING , NULL_STRING}
	oFont := Font{  , 14 , "Microsoft Sans Serif" }
	SELF:oDCFixedText3:Font( oFont )

	SELF:oDCbanco := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_BANCO  , _GetInst() } }
	SELF:oDCbanco:HyperLabel := HyperLabel{#banco , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText4 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_FIXEDTEXT4  , _GetInst() } }
	SELF:oDCFixedText4:HyperLabel := HyperLabel{#FixedText4 , "Bco:" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText5 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_FIXEDTEXT5  , _GetInst() } }
	SELF:oDCFixedText5:HyperLabel := HyperLabel{#FixedText5 , "Ag." , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText6 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_FIXEDTEXT6  , _GetInst() } }
	SELF:oDCFixedText6:HyperLabel := HyperLabel{#FixedText6 , "CC" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckcc := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCC  , _GetInst() } }
	SELF:oCCcheckcc:HyperLabel := HyperLabel{#checkcc , "Checar Conta Corrente" , NULL_STRING , NULL_STRING}
	SELF:oCCcheckcc:TooltipText := "Checar Conta Corrente"

	SELF:oDCtheFixedText9 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_THEFIXEDTEXT9  , _GetInst() } }
	SELF:oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9 , "Retornar" , NULL_STRING , NULL_STRING}

	SELF:oCCSAIR := PUSHBUTTON{SELF , ResourceID{ _JCHECK_SAIR  , _GetInst() } }
	SELF:oCCSAIR:HyperLabel := HyperLabel{#SAIR , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oCCSAIR:TooltipText := "Encerrar"
	SELF:oCCSAIR:Image := ICO_SAIR{}

	SELF:oCCcheckcartao := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCARTAO  , _GetInst() } }
	SELF:oCCcheckcartao:HyperLabel := HyperLabel{#checkcartao , "Checar Cartão Credito" , NULL_STRING , NULL_STRING}
	SELF:oCCcheckcartao:TooltipText := "Checar Cartao Credito"

	SELF:oCCcheckIE1 := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKIE1  , _GetInst() } }
	SELF:oCCcheckIE1:HyperLabel := HyperLabel{#checkIE1 , "Checagem II" , NULL_STRING , NULL_STRING}
	SELF:oCCcheckIE1:TooltipText := "Checar Insc Estadual Metodo II"

	SELF:oCCcmd033 := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CMD033  , _GetInst() } }
	SELF:oCCcmd033:HyperLabel := HyperLabel{#cmd033 , "033-Banespa" , NULL_STRING , NULL_STRING}
	SELF:oCCcmd033:TooltipText := "Escolhe Banespa"

	SELF:oCCcmd237 := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CMD237  , _GetInst() } }
	SELF:oCCcmd237:HyperLabel := HyperLabel{#cmd237 , "237-Bradesco" , NULL_STRING , NULL_STRING}
	SELF:oCCcmd237:TooltipText := "Escolhe Bradesco"

	SELF:oCCCMD341 := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CMD341  , _GetInst() } }
	SELF:oCCCMD341:HyperLabel := HyperLabel{#CMD341 , "341-Itau" , NULL_STRING , NULL_STRING}
	SELF:oCCCMD341:TooltipText := "Escolhe Itau"

	SELF:oCCcheckcartao1 := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCARTAO1  , _GetInst() } }
	SELF:oCCcheckcartao1:HyperLabel := HyperLabel{#checkcartao1 , "Checar Numero Renavam" , NULL_STRING , NULL_STRING}
	SELF:oCCcheckcartao1:TooltipText := "Checar Numero Renavam"

	SELF:oCCcheckrgClick := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKRGCLICK  , _GetInst() } }
	SELF:oCCcheckrgClick:HyperLabel := HyperLabel{#checkrgClick , "Checar Numero RG" , NULL_STRING , NULL_STRING}
	SELF:oCCcheckrgClick:TooltipText := "Checar Numero Renavam"

	SELF:oCCcheckTIT := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKTIT  , _GetInst() } }
	SELF:oCCcheckTIT:HyperLabel := HyperLabel{#checkTIT , "Checar Titulo Eleitor" , NULL_STRING , NULL_STRING}
	SELF:oCCcheckTIT:TooltipText := "Checar Numero Renavam"

	SELF:oDCTITULO := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_TITULO  , _GetInst() } }
	SELF:oDCTITULO:HyperLabel := HyperLabel{#TITULO , "TITULO" , NULL_STRING , NULL_STRING}
	SELF:oDCTITULO:FieldSpec := PADRAO_CHAR_14{}
	SELF:oDCTITULO:TooltipText := "Digite o Numero RGCarteira de Identidade"

	SELF:oCCcheckcns := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCNS  , _GetInst() } }
	SELF:oCCcheckcns:HyperLabel := HyperLabel{#checkcns , "Checar cns" , NULL_STRING , NULL_STRING}
	SELF:oCCcheckcns:TooltipText := "Checar PIS"

	SELF:oDCcns := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_CNS  , _GetInst() } }
	SELF:oDCcns:HyperLabel := HyperLabel{#cns , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCcns:FieldSpec := padrao_char_15{}
	SELF:oDCcns:TooltipText := "Digite o Pis"

	SELF:oDCtxtEmail := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_TXTEMAIL  , _GetInst() } }
	SELF:oDCtxtEmail:HyperLabel := HyperLabel{#txtEmail , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCtxtEmail:FieldSpec := padrao_char_15{}
	SELF:oDCtxtEmail:TooltipText := "Digite o Pis"

	SELF:oCCbtnCheckEmail := PUSHBUTTON{SELF , ResourceID{ _JCHECK_BTNCHECKEMAIL  , _GetInst() } }
	SELF:oCCbtnCheckEmail:HyperLabel := HyperLabel{#btnCheckEmail , "Checar Email" , NULL_STRING , NULL_STRING}
	SELF:oCCbtnCheckEmail:TooltipText := "Checar PIS"

	SELF:Caption := "Checagem de Codigos"
	SELF:HyperLabel := HyperLabel{#_JCheck , "Checagem de Codigos" , NULL_STRING , NULL_STRING}
	SELF:ClipperKeys := True
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF

	SELF:Browser := DataBrowser{SELF}

	SELF:oDBcgc := DataColumn{padrao_char_18{}}
	SELF:oDBcgc:Width := 5
	SELF:oDBcgc:HyperLabel := SELF:oDCcgc:HyperLabel
	SELF:oDBcgc:Caption := "cgc"
	SELF:Browser:AddColumn(SELF:oDBcgc)

	SELF:oDBcpf := DataColumn{padrao_char_14{}}
	SELF:oDBcpf:Width := 5
	SELF:oDBcpf:HyperLabel := SELF:oDCcpf:HyperLabel
	SELF:oDBcpf:Caption := ""
	SELF:Browser:AddColumn(SELF:oDBcpf)

	SELF:oDBPIS := DataColumn{padrao_char_11{}}
	SELF:oDBPIS:Width := 5
	SELF:oDBPIS:HyperLabel := SELF:oDCPIS:HyperLabel
	SELF:oDBPIS:Caption := ""
	SELF:Browser:AddColumn(SELF:oDBPIS)

	SELF:oDBIE := DataColumn{PADRAO_CHAR_16{}}
	SELF:oDBIE:Width := 4
	SELF:oDBIE:HyperLabel := SELF:oDCIE:HyperLabel
	SELF:oDBIE:Caption := ""
	SELF:Browser:AddColumn(SELF:oDBIE)

	SELF:oDBUF := DataColumn{UF_FIELD{}}
	SELF:oDBUF:Width := 4
	SELF:oDBUF:HyperLabel := SELF:oDCUF:HyperLabel
	SELF:oDBUF:Caption := ""
	SELF:Browser:AddColumn(SELF:oDBUF)

	SELF:oDBCEI := DataColumn{padrao_char_12{}}
	SELF:oDBCEI:Width := 5
	SELF:oDBCEI:HyperLabel := SELF:oDCCEI:HyperLabel
	SELF:oDBCEI:Caption := ""
	SELF:Browser:AddColumn(SELF:oDBCEI)

	SELF:oDBFGTS := DataColumn{padrao_char_11{}}
	SELF:oDBFGTS:Width := 6
	SELF:oDBFGTS:HyperLabel := SELF:oDCFGTS:HyperLabel
	SELF:oDBFGTS:Caption := ""
	SELF:Browser:AddColumn(SELF:oDBFGTS)

	SELF:oDBagencia := DataColumn{paDRAO_CHAR_07{}}
	SELF:oDBagencia:Width := 9
	SELF:oDBagencia:HyperLabel := SELF:oDCagencia:HyperLabel
	SELF:oDBagencia:Caption := ""
	SELF:Browser:AddColumn(SELF:oDBagencia)

	SELF:oDBconta := DataColumn{padrao_char_12{}}
	SELF:oDBconta:Width := 7
	SELF:oDBconta:HyperLabel := SELF:oDCconta:HyperLabel
	SELF:oDBconta:Caption := ""
	SELF:Browser:AddColumn(SELF:oDBconta)

	SELF:oDBcartao := DataColumn{PADRAO_CHAR_20{}}
	SELF:oDBcartao:Width := 8
	SELF:oDBcartao:HyperLabel := SELF:oDCcartao:HyperLabel
	SELF:oDBcartao:Caption := ""
	SELF:Browser:AddColumn(SELF:oDBcartao)

	SELF:oDBrenavam := DataColumn{PADRAO_CHAR_20{}}
	SELF:oDBrenavam:Width := 9
	SELF:oDBrenavam:HyperLabel := SELF:oDCrenavam:HyperLabel
	SELF:oDBrenavam:Caption := ""
	SELF:Browser:AddColumn(SELF:oDBrenavam)

	SELF:oDBRG := DataColumn{PADRAO_CHAR_12{}}
	SELF:oDBRG:Width := 4
	SELF:oDBRG:HyperLabel := SELF:oDCRG:HyperLabel
	SELF:oDBRG:Caption := "RG"
	SELF:Browser:AddColumn(SELF:oDBRG)

	SELF:oDBbanco := DataColumn{7}
	SELF:oDBbanco:Width := 7
	SELF:oDBbanco:HyperLabel := SELF:oDCbanco:HyperLabel
	SELF:oDBbanco:Caption := ""
	SELF:Browser:AddColumn(SELF:oDBbanco)

	SELF:oDBTITULO := DataColumn{PADRAO_CHAR_14{}}
	SELF:oDBTITULO:Width := 8
	SELF:oDBTITULO:HyperLabel := SELF:oDCTITULO:HyperLabel
	SELF:oDBTITULO:Caption := "TITULO"
	SELF:Browser:AddColumn(SELF:oDBTITULO)

	SELF:oDBcns := DataColumn{padrao_char_15{}}
	SELF:oDBcns:Width := 5
	SELF:oDBcns:HyperLabel := SELF:oDCcns:HyperLabel
	SELF:oDBcns:Caption := ""
	SELF:Browser:AddColumn(SELF:oDBcns)

	SELF:ViewAs(#FormView)


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS PIS
RETURN SELF:FieldGet( #PIS )

ASSIGN PIS( uValue )
SELF:FieldPut( #PIS , uValue )

ACCESS renavam
RETURN SELF:FieldGet( #renavam )

ASSIGN renavam( uValue )
SELF:FieldPut( #renavam , uValue )

ACCESS RG
RETURN SELF:FieldGet( #RG )

ASSIGN RG( uValue )
SELF:FieldPut( #RG , uValue )

ACCESS TITULO
RETURN SELF:FieldGet( #TITULO )

ASSIGN TITULO( uValue )
SELF:FieldPut( #TITULO , uValue )

ACCESS txtEmail
RETURN SELF:FieldGet( #txtEmail )

ASSIGN txtEmail( uValue )
SELF:FieldPut( #txtEmail , uValue )

ACCESS UF
RETURN SELF:FieldGet( #UF )

ASSIGN UF( uValue )
SELF:FieldPut( #UF , uValue )

END CLASS
