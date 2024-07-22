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
#endregion

PARTIAL CLASS _JCheck INHERIT DATADIALOG
PROTECT oDCcgc AS rightSle
PROTECT oDCcpf AS rightSle
PROTECT oDCPIS AS rightSle
PROTECT oDCIE AS rightSle
PROTECT oDCUF AS rightSle
PROTECT oDCCEI AS rightSle
PROTECT oDCFGTS AS rightSle
PROTECT oDCagencia AS rightSle
PROTECT oDCconta AS rightSle
PROTECT oDCcartao AS rightSle
PROTECT oDCrenavam AS rightSle
PROTECT oDCRG AS rightSle
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
PROTECT oDCTITULO AS rightSle
PROTECT oCCcheckcns AS PUSHBUTTON
PROTECT oDCcns AS rightSle
PROTECT oDCtxtEmail AS rightSle
PROTECT oCCBtnCheckEmail AS PUSHBUTTON

// User code starts here (DO NOT remove this line)  ##USER##

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

	SELF:oDCcgc := rightSle{SELF , ResourceID{ _JCHECK_CGC  , _GetInst() } }
	SELF:oDCcgc:FieldSpec := padrao_char_18{}
	SELF:oDCcgc:TooltipText := "Digite o CGC"
	SELF:oDCcgc:Picture := "99.999.999/9999-99"
	SELF:oDCcgc:HyperLabel := HyperLabel{#cgc , "cgc" , NULL_STRING , NULL_STRING}

	SELF:oDCcpf := rightSle{SELF , ResourceID{ _JCHECK_CPF  , _GetInst() } }
	SELF:oDCcpf:FieldSpec := padrao_char_14{}
	SELF:oDCcpf:TooltipText := "Digite o CPF"
	SELF:oDCcpf:Picture := "999.999.999-99"
	SELF:oDCcpf:HyperLabel := HyperLabel{#cpf , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCPIS := rightSle{SELF , ResourceID{ _JCHECK_PIS  , _GetInst() } }
	SELF:oDCPIS:FieldSpec := padrao_char_11{}
	SELF:oDCPIS:TooltipText := "Digite o Pis"
	SELF:oDCPIS:HyperLabel := HyperLabel{#PIS , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCIE := rightSle{SELF , ResourceID{ _JCHECK_IE  , _GetInst() } }
	SELF:oDCIE:FieldSpec := PADRAO_CHAR_16{}
	SELF:oDCIE:TooltipText := "Digite a Inscricao Estadual"
	SELF:oDCIE:HyperLabel := HyperLabel{#IE , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCUF := rightSle{SELF , ResourceID{ _JCHECK_UF  , _GetInst() } }
	SELF:oDCUF:FieldSpec := UF_FIELD{}
	SELF:oDCUF:TooltipText := "Digite o Estado"
	SELF:oDCUF:HyperLabel := HyperLabel{#UF , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCCEI := rightSle{SELF , ResourceID{ _JCHECK_CEI  , _GetInst() } }
	SELF:oDCCEI:FieldSpec := padrao_char_12{}
	SELF:oDCCEI:TooltipText := "Digite o CEI"
	SELF:oDCCEI:HyperLabel := HyperLabel{#CEI , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCFGTS := rightSle{SELF , ResourceID{ _JCHECK_FGTS  , _GetInst() } }
	SELF:oDCFGTS:FieldSpec := padrao_char_11{}
	SELF:oDCFGTS:TooltipText := "Digite o Numero conta FGTS"
	SELF:oDCFGTS:HyperLabel := HyperLabel{#FGTS , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCagencia := rightSle{SELF , ResourceID{ _JCHECK_AGENCIA  , _GetInst() } }
	SELF:oDCagencia:FieldSpec := paDRAO_CHAR_07{}
	SELF:oDCagencia:TooltipText := "Digite o Nome da Agencia"
	SELF:oDCagencia:HyperLabel := HyperLabel{#agencia , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCconta := rightSle{SELF , ResourceID{ _JCHECK_CONTA  , _GetInst() } }
	SELF:oDCconta:FieldSpec := padrao_char_12{}
	SELF:oDCconta:TooltipText := "Digite o Numero da Conta"
	SELF:oDCconta:HyperLabel := HyperLabel{#conta , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCcartao := rightSle{SELF , ResourceID{ _JCHECK_CARTAO  , _GetInst() } }
	SELF:oDCcartao:FieldSpec := PADRAO_CHAR_20{}
	SELF:oDCcartao:TooltipText := "Digite o Numero Cartao Credito"
	SELF:oDCcartao:HyperLabel := HyperLabel{#cartao , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCrenavam := rightSle{SELF , ResourceID{ _JCHECK_RENAVAM  , _GetInst() } }
	SELF:oDCrenavam:FieldSpec := PADRAO_CHAR_20{}
	SELF:oDCrenavam:TooltipText := "Digite o Numero Renavam"
	SELF:oDCrenavam:HyperLabel := HyperLabel{#renavam , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCRG := rightSle{SELF , ResourceID{ _JCHECK_RG  , _GetInst() } }
	SELF:oDCRG:FieldSpec := PADRAO_CHAR_12{}
	SELF:oDCRG:TooltipText := "Digite o Numero RGCarteira de Identidade"
	SELF:oDCRG:HyperLabel := HyperLabel{#RG , "RG" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckcgc := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCGC  , _GetInst() } }
	SELF:oCCcheckcgc:TooltipText := "Checar CNPJ/CGC"
	SELF:oCCcheckcgc:HyperLabel := HyperLabel{#checkcgc , "Checar CNPJ" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckcPF := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCPF  , _GetInst() } }
	SELF:oCCcheckcPF:TooltipText := "Checar CPF"
	SELF:oCCcheckcPF:HyperLabel := HyperLabel{#checkcPF , "Checar CPF" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckPIS := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKPIS  , _GetInst() } }
	SELF:oCCcheckPIS:TooltipText := "Checar PIS"
	SELF:oCCcheckPIS:HyperLabel := HyperLabel{#checkPIS , "Checar PIS" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckIE := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKIE  , _GetInst() } }
	SELF:oCCcheckIE:TooltipText := "Checar Insc.Estadual"
	SELF:oCCcheckIE:HyperLabel := HyperLabel{#checkIE , "Checar Insc Est." , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText1 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_FIXEDTEXT1  , _GetInst() } }
	SELF:oDCFixedText1:HyperLabel := HyperLabel{#FixedText1 , "UF" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckCEI := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCEI  , _GetInst() } }
	SELF:oCCcheckCEI:TooltipText := "Checar Cei"
	SELF:oCCcheckCEI:HyperLabel := HyperLabel{#checkCEI , "Checar CEI" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckFGTS := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKFGTS  , _GetInst() } }
	SELF:oCCcheckFGTS:TooltipText := "Checar Conta FGTS"
	SELF:oCCcheckFGTS:HyperLabel := HyperLabel{#checkFGTS , "Checar Conta FGTS" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText2 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_FIXEDTEXT2  , _GetInst() } }
	SELF:oDCFixedText2:HyperLabel := HyperLabel{#FixedText2 , "Preencha O CGC Acima" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText3 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_FIXEDTEXT3  , _GetInst() } }
	oFont := Font{  , 14 , "Microsoft Sans Serif" }
	SELF:oDCFixedText3:Font( oFont )
	SELF:oDCFixedText3:HyperLabel := HyperLabel{#FixedText3 , "Obs: Checagem de Referência Apenas" , NULL_STRING , NULL_STRING}

	SELF:oDCbanco := SINGLELINEEDIT{SELF , ResourceID{ _JCHECK_BANCO  , _GetInst() } }
	SELF:oDCbanco:HyperLabel := HyperLabel{#banco , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText4 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_FIXEDTEXT4  , _GetInst() } }
	SELF:oDCFixedText4:HyperLabel := HyperLabel{#FixedText4 , "Bco:" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText5 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_FIXEDTEXT5  , _GetInst() } }
	SELF:oDCFixedText5:HyperLabel := HyperLabel{#FixedText5 , "Ag." , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText6 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_FIXEDTEXT6  , _GetInst() } }
	SELF:oDCFixedText6:HyperLabel := HyperLabel{#FixedText6 , "CC" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckcc := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCC  , _GetInst() } }
	SELF:oCCcheckcc:TooltipText := "Checar Conta Corrente"
	SELF:oCCcheckcc:HyperLabel := HyperLabel{#checkcc , "Checar Conta Corrente" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText9 := FIXEDTEXT{SELF , ResourceID{ _JCHECK_THEFIXEDTEXT9  , _GetInst() } }
	SELF:oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9 , "Retornar" , NULL_STRING , NULL_STRING}

	SELF:oCCSAIR := PUSHBUTTON{SELF , ResourceID{ _JCHECK_SAIR  , _GetInst() } }
	SELF:oCCSAIR:TooltipText := "Encerrar"
	SELF:oCCSAIR:Image := ICO_SAIR{}
	SELF:oCCSAIR:HyperLabel := HyperLabel{#SAIR , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCcheckcartao := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCARTAO  , _GetInst() } }
	SELF:oCCcheckcartao:TooltipText := "Checar Cartao Credito"
	SELF:oCCcheckcartao:HyperLabel := HyperLabel{#checkcartao , "Checar Cartão Credito" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckIE1 := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKIE1  , _GetInst() } }
	SELF:oCCcheckIE1:TooltipText := "Checar Insc Estadual Metodo II"
	SELF:oCCcheckIE1:HyperLabel := HyperLabel{#checkIE1 , "Checagem II" , NULL_STRING , NULL_STRING}

	SELF:oCCcmd033 := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CMD033  , _GetInst() } }
	SELF:oCCcmd033:TooltipText := "Escolhe Banespa"
	SELF:oCCcmd033:HyperLabel := HyperLabel{#cmd033 , "033-Banespa" , NULL_STRING , NULL_STRING}

	SELF:oCCcmd237 := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CMD237  , _GetInst() } }
	SELF:oCCcmd237:TooltipText := "Escolhe Bradesco"
	SELF:oCCcmd237:HyperLabel := HyperLabel{#cmd237 , "237-Bradesco" , NULL_STRING , NULL_STRING}

	SELF:oCCCMD341 := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CMD341  , _GetInst() } }
	SELF:oCCCMD341:TooltipText := "Escolhe Itau"
	SELF:oCCCMD341:HyperLabel := HyperLabel{#CMD341 , "341-Itau" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckcartao1 := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCARTAO1  , _GetInst() } }
	SELF:oCCcheckcartao1:TooltipText := "Checar Numero Renavam"
	SELF:oCCcheckcartao1:HyperLabel := HyperLabel{#checkcartao1 , "Checar Numero Renavam" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckrgClick := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKRGCLICK  , _GetInst() } }
	SELF:oCCcheckrgClick:TooltipText := "Checar Numero Renavam"
	SELF:oCCcheckrgClick:HyperLabel := HyperLabel{#checkrgClick , "Checar Numero RG" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckTIT := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKTIT  , _GetInst() } }
	SELF:oCCcheckTIT:TooltipText := "Checar Numero Renavam"
	SELF:oCCcheckTIT:HyperLabel := HyperLabel{#checkTIT , "Checar Titulo Eleitor" , NULL_STRING , NULL_STRING}

	SELF:oDCTITULO := rightSle{SELF , ResourceID{ _JCHECK_TITULO  , _GetInst() } }
	SELF:oDCTITULO:FieldSpec := PADRAO_CHAR_14{}
	SELF:oDCTITULO:TooltipText := "Digite o Numero RGCarteira de Identidade"
	SELF:oDCTITULO:HyperLabel := HyperLabel{#TITULO , "TITULO" , NULL_STRING , NULL_STRING}

	SELF:oCCcheckcns := PUSHBUTTON{SELF , ResourceID{ _JCHECK_CHECKCNS  , _GetInst() } }
	SELF:oCCcheckcns:TooltipText := "Checar PIS"
	SELF:oCCcheckcns:HyperLabel := HyperLabel{#checkcns , "Checar cns" , NULL_STRING , NULL_STRING}

	SELF:oDCcns := rightSle{SELF , ResourceID{ _JCHECK_CNS  , _GetInst() } }
	SELF:oDCcns:FieldSpec := padrao_char_15{}
	SELF:oDCcns:TooltipText := "Digite o Pis"
	SELF:oDCcns:HyperLabel := HyperLabel{#cns , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCtxtEmail := rightSle{SELF , ResourceID{ _JCHECK_TXTEMAIL  , _GetInst() } }
	SELF:oDCtxtEmail:FieldSpec := padrao_char_15{}
	SELF:oDCtxtEmail:TooltipText := "Digite o Pis"
	SELF:oDCtxtEmail:HyperLabel := HyperLabel{#txtEmail , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCBtnCheckEmail := PUSHBUTTON{SELF , ResourceID{ _JCHECK_BTNCHECKEMAIL  , _GetInst() } }
	SELF:oCCBtnCheckEmail:TooltipText := "Checar PIS"
	SELF:oCCBtnCheckEmail:HyperLabel := HyperLabel{#BtnCheckEmail , "Checar Email" , NULL_STRING , NULL_STRING}

	SELF:Caption := "Checagem de Codigos"
	SELF:ClipperKeys := TRUE
	SELF:HyperLabel := HyperLabel{#_JCheck , "Checagem de Codigos" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF


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

ACCESS UF
RETURN SELF:FieldGet( #UF )

ASSIGN UF( uValue )
SELF:FieldPut( #UF , uValue )

ACCESS txtEmail
RETURN SELF:FieldGet( #txtEmail )

ASSIGN txtEmail( uValue )
SELF:FieldPut( #txtEmail , uValue )

END CLASS
STATIC DEFINE _JCHECK_TXTEMAIL := 139
STATIC DEFINE _JCHECK_BTNCHECKEMAIL := 140
