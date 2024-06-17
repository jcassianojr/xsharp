#region DEFINES
STATIC DEFINE A2MIX_A2_BAIRRO := 128 
STATIC DEFINE A2MIX_A2_CEP := 132 
STATIC DEFINE A2MIX_A2_CGC := 108 
STATIC DEFINE A2MIX_A2_COD := 121 
STATIC DEFINE A2MIX_A2_CONTATO := 142 
STATIC DEFINE A2MIX_A2_END := 126 
STATIC DEFINE A2MIX_A2_EST := 100 
STATIC DEFINE A2MIX_A2_FAX := 150 
STATIC DEFINE A2MIX_A2_INSCR := 106 
STATIC DEFINE A2MIX_A2_MUN := 130 
STATIC DEFINE A2MIX_A2_NOME := 124 
STATIC DEFINE A2MIX_A2_NREDUZ := 122 
STATIC DEFINE A2MIX_A2_TEL := 140 
STATIC DEFINE A2MIX_BUSCANUM := 105 
STATIC DEFINE A2MIX_CARGOR := 158 
STATIC DEFINE A2MIX_CMDCHECKCGC := 113 
STATIC DEFINE A2MIX_CMDCHECKIE := 114 
STATIC DEFINE A2MIX_CMDCHECKUF := 115 
STATIC DEFINE A2MIX_CMDPESSOA := 110 
STATIC DEFINE A2MIX_CODMAT := 103 
STATIC DEFINE A2MIX_CONCEITO := 101 
STATIC DEFINE A2MIX_CONTATO1 := 147 
STATIC DEFINE A2MIX_DDD := 139 
STATIC DEFINE A2MIX_DDD1 := 144 
STATIC DEFINE A2MIX_DDDFAX := 149 
STATIC DEFINE A2MIX_EMAIL := 152 
STATIC DEFINE a2mix_FT19 := 104
STATIC DEFINE A2MIX_FT20 := 151 
STATIC DEFINE A2MIX_FT21 := 153 
STATIC DEFINE A2MIX_FT22 := 155 
STATIC DEFINE A2MIX_FT23 := 157 
STATIC DEFINE A2MIX_PESSOA := 111 
STATIC DEFINE A2MIX_PORNUM := 104 
STATIC DEFINE A2MIX_QUALIFI := 102 
STATIC DEFINE A2MIX_RAMAL := 141 
STATIC DEFINE A2MIX_RAMAL1 := 146 
STATIC DEFINE A2MIX_RESPF := 156 
STATIC DEFINE A2MIX_SC_BAIRRO := 127 
STATIC DEFINE A2MIX_SC_CEP := 131 
STATIC DEFINE A2MIX_SC_CIDADE := 129 
STATIC DEFINE A2MIX_SC_COGNOME := 119 
STATIC DEFINE A2MIX_SC_CONCEITO := 117 
STATIC DEFINE A2MIX_SC_CONTATO := 137 
STATIC DEFINE A2MIX_SC_DDD := 134 
STATIC DEFINE A2MIX_SC_ENDERECO := 125 
STATIC DEFINE A2MIX_SC_ESTADO := 133 
STATIC DEFINE A2MIX_SC_NOME := 123 
STATIC DEFINE A2MIX_SC_NUMERO := 120 
STATIC DEFINE A2MIX_SC_QUALIFI := 118 
STATIC DEFINE A2MIX_SC_RAMAL := 136 
STATIC DEFINE A2MIX_SC_TELEFAX2 := 109 
STATIC DEFINE A2MIX_SC_TELEFAX3 := 107 
STATIC DEFINE A2MIX_SC_TELEFAX4 := 112 
STATIC DEFINE A2MIX_SC_TELEFONE := 135 
STATIC DEFINE A2MIX_SITE := 154 
STATIC DEFINE A2MIX_TELEFONE1 := 145 
STATIC DEFINE A2MIX_THEFIXEDTEXT16 := 138 
STATIC DEFINE A2MIX_THEFIXEDTEXT17 := 143 
STATIC DEFINE A2MIX_THEFIXEDTEXT18 := 148 
STATIC DEFINE A2MIX_THEFIXEDTEXT21 := 116 
#endregion

class a2mix inherit MYDataWindow 

	PROTECT oDBA2_COD as DataColumn
	PROTECT oDBA2_NREDUZ as DataColumn
	PROTECT oDBA2_NOME as DataColumn
	protect oDCA2_EST as SINGLELINEEDIT
	protect oDCCONCEITO as SINGLELINEEDIT
	protect oDCQUALIFI as SINGLELINEEDIT
	protect oDCCODMAT as SINGLELINEEDIT
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oDCA2_INSCR as SINGLELINEEDIT
	protect oDCSC_TELEFAX3 as FIXEDTEXT
	protect oDCA2_CGC as SINGLELINEEDIT
	protect oDCSC_TELEFAX2 as FIXEDTEXT
	protect oCCcmdpessoa as PUSHBUTTON
	protect oDCpessoa as SINGLELINEEDIT
	protect oDCSC_TELEFAX4 as FIXEDTEXT
	protect oCCcmdcheckcgc as PUSHBUTTON
	protect oCCcmdcheckie as PUSHBUTTON
	protect oCCcmdcheckuf as PUSHBUTTON
	protect oDCtheFixedText21 as FIXEDTEXT
	protect oDCSC_CONCEITO as FIXEDTEXT
	protect oDCSC_QUALIFI as FIXEDTEXT
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCA2_COD as SINGLELINEEDIT
	protect oDCA2_NREDUZ as SINGLELINEEDIT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCA2_NOME as SINGLELINEEDIT
	protect oDCSC_ENDERECO as FIXEDTEXT
	protect oDCA2_END as SINGLELINEEDIT
	protect oDCSC_BAIRRO as FIXEDTEXT
	protect oDCA2_BAIRRO as SINGLELINEEDIT
	protect oDCSC_CIDADE as FIXEDTEXT
	protect oDCA2_MUN as SINGLELINEEDIT
	protect oDCSC_CEP as FIXEDTEXT
	protect oDCA2_CEP as SINGLELINEEDIT
	protect oDCSC_ESTADO as FIXEDTEXT
	protect oDCSC_DDD as FIXEDTEXT
	protect oDCSC_TELEFONE as FIXEDTEXT
	protect oDCSC_RAMAL as FIXEDTEXT
	protect oDCSC_CONTATO as FIXEDTEXT
	protect oDCtheFixedText16 as FIXEDTEXT
	protect oDCDDD as SINGLELINEEDIT
	protect oDCA2_TEL as SINGLELINEEDIT
	protect oDCRAMAL as SINGLELINEEDIT
	protect oDCA2_CONTATO as SINGLELINEEDIT
	protect oDCtheFixedText17 as FIXEDTEXT
	protect oDCDDD1 as SINGLELINEEDIT
	protect oDCTELEFONE1 as SINGLELINEEDIT
	protect oDCRAMAL1 as SINGLELINEEDIT
	protect oDCCONTATO1 as SINGLELINEEDIT
	protect oDCtheFixedText18 as FIXEDTEXT
	protect oDCDDDFAX as SINGLELINEEDIT
	protect oDCA2_FAX as SINGLELINEEDIT
	protect oDCft20 as FIXEDTEXT
	protect oDCEMAIL as SINGLELINEEDIT
	protect oDCFT21 as FIXEDTEXT
	protect oDCSITE as SINGLELINEEDIT
	protect oDCFT22 as FIXEDTEXT
	protect oDCRESPF as SINGLELINEEDIT
	protect oDCFT23 as FIXEDTEXT
	protect oDCCARGOR as SINGLELINEEDIT
// 	instance A2_EST 
// 	instance CONCEITO 
// 	instance QUALIFI 
// 	instance CODMAT 
// 	instance A2_INSCR 
// 	instance A2_CGC 
// 	instance pessoa 
// 	instance A2_COD 
// 	instance A2_NREDUZ 
// 	instance A2_NOME 
// 	instance A2_END 
// 	instance A2_BAIRRO 
// 	instance A2_MUN 
// 	instance A2_CEP 
// 	instance DDD 
// 	instance A2_TEL 
// 	instance RAMAL 
// 	instance A2_CONTATO 
// 	instance DDD1 
// 	instance TELEFONE1 
// 	instance RAMAL1 
// 	instance CONTATO1 
// 	instance DDDFAX 
// 	instance A2_FAX 
// 	instance EMAIL 
// 	instance SITE 
// 	instance RESPF 
// 	instance CARGOR 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access A2_BAIRRO() 
return self:FieldGet(#A2_BAIRRO)


assign A2_BAIRRO(uValue) 
self:FieldPut(#A2_BAIRRO, uValue)
return A2_BAIRRO := uValue


access A2_CEP() 
return self:FieldGet(#A2_CEP)


assign A2_CEP(uValue) 
self:FieldPut(#A2_CEP, uValue)
return A2_CEP := uValue


access A2_CGC() 
return self:FieldGet(#A2_CGC)


assign A2_CGC(uValue) 
self:FieldPut(#A2_CGC, uValue)
return A2_CGC := uValue


access A2_COD() 
return self:FieldGet(#A2_COD)


assign A2_COD(uValue) 
self:FieldPut(#A2_COD, uValue)
return A2_COD := uValue


access A2_CONTATO() 
return self:FieldGet(#A2_CONTATO)


assign A2_CONTATO(uValue) 
self:FieldPut(#A2_CONTATO, uValue)
return A2_CONTATO := uValue


access A2_END() 
return self:FieldGet(#A2_END)


assign A2_END(uValue) 
self:FieldPut(#A2_END, uValue)
return A2_END := uValue


access A2_EST() 
return self:FieldGet(#A2_EST)


assign A2_EST(uValue) 
self:FieldPut(#A2_EST, uValue)
return A2_EST := uValue


access A2_FAX() 
return self:FieldGet(#A2_FAX)


assign A2_FAX(uValue) 
self:FieldPut(#A2_FAX, uValue)
return A2_FAX := uValue


access A2_INSCR() 
return self:FieldGet(#A2_INSCR)


assign A2_INSCR(uValue) 
self:FieldPut(#A2_INSCR, uValue)
return A2_INSCR := uValue


access A2_MUN() 
return self:FieldGet(#A2_MUN)


assign A2_MUN(uValue) 
self:FieldPut(#A2_MUN, uValue)
return A2_MUN := uValue


access A2_NOME() 
return self:FieldGet(#A2_NOME)


assign A2_NOME(uValue) 
self:FieldPut(#A2_NOME, uValue)
return A2_NOME := uValue


access A2_NREDUZ() 
return self:FieldGet(#A2_NREDUZ)


assign A2_NREDUZ(uValue) 
self:FieldPut(#A2_NREDUZ, uValue)
return A2_NREDUZ := uValue


access A2_TEL() 
return self:FieldGet(#A2_TEL)


assign A2_TEL(uValue) 
self:FieldPut(#A2_TEL, uValue)
return A2_TEL := uValue


METHOD APPEND() 
LOCAL	otb AS TEXTBOX
Otb:=TEXTBOX{,"Erro","Operação Bloqueada"}
Otb:show()



METHOD buscanum( ) 
	SELF:KeyFind()
//LOCAL oBUSCA AS xBUSCA
//oBUSCA:=xBUSCA{SELF,"Localizar...","Digite Nº"}
//oBUSCA:lMES:=.T.
//oBUSCA:SHOW()
//IF oBUSCA:lOK
//   SELF:SERVER:SETORDER(1)
//   SELF:SERVER:GOTOP()
//   SELF:SERVER:SEEK(Val(oBUSCA:cBUSCA))
//ENDIF

access CARGOR() 
return self:FieldGet(#CARGOR)


assign CARGOR(uValue) 
self:FieldPut(#CARGOR, uValue)
return CARGOR := uValue


METHOD cmdcheckcgc( ) 
LOCAL cPESSOA AS STRING	
CPESSOA:=sempessoa(SELF:SERVER:FIELDGET("A2_CGC"))
IF cPESSOA="J"
   IF VALCGC(SELF:SERVER:FIELDGET("A2_CGC"))
   	  alert("CGC OK")
   ENDIF	
ENDIF	
IF cPESSOA="F"
   IF Valcpf(SELF:SERVER:FIELDGET("A2_CGC"))
   	  alert("CPF OK")
   ENDIF		
ENDIF		

METHOD cmdcheckie( ) 
LOCAL cPESSOA AS STRING	
CPESSOA:=sempessoa(SELF:SERVER:FIELDGET("A2_CGC"))
IF cPESSOA="J"
   ValIE(SELF:SERVER:FIELDGET("A2_EST"),SELF:SERVER:FIELDGET("A2_INSCR"))
ENDIF	
IF cPESSOA="F"
   IF CheckRG(SELF:SERVER:FIELDGET("A2_INSCR"))
   	   alert("RG OK")
   ENDIF		
ENDIF		

METHOD cmdcheckuf( ) 
	ufCheck(SELF:server:FIELDGET("A2_EST"))

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD cmdpessoa( ) 
		SELF:server:FIELDPUT("PESSOA",SIMNAO(SELF:SERVER:FIELDGET("PESSOA"),{"J","F","O"}))

access CODMAT() 
return self:FieldGet(#CODMAT)


assign CODMAT(uValue) 
self:FieldPut(#CODMAT, uValue)
return CODMAT := uValue


access CONCEITO() 
return self:FieldGet(#CONCEITO)


assign CONCEITO(uValue) 
self:FieldPut(#CONCEITO, uValue)
return CONCEITO := uValue


access CONTATO1() 
return self:FieldGet(#CONTATO1)


assign CONTATO1(uValue) 
self:FieldPut(#CONTATO1, uValue)
return CONTATO1 := uValue


access DDD() 
return self:FieldGet(#DDD)


assign DDD(uValue) 
self:FieldPut(#DDD, uValue)
return DDD := uValue


access DDD1() 
return self:FieldGet(#DDD1)


assign DDD1(uValue) 
self:FieldPut(#DDD1, uValue)
return DDD1 := uValue


access DDDFAX() 
return self:FieldGet(#DDDFAX)


assign DDDFAX(uValue) 
self:FieldPut(#DDDFAX, uValue)
return DDDFAX := uValue


METHOD DELETE() 
LOCAL	otb AS TEXTBOX
Otb:=TEXTBOX{,"Erro","Operação Bloqueada"}
Otb:show()




access EMAIL() 
return self:FieldGet(#EMAIL)


assign EMAIL(uValue) 
self:FieldPut(#EMAIL, uValue)
return EMAIL := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"a2mix",_GetInst()},iCtlID)

oDCA2_EST := SingleLineEdit{self,ResourceID{A2MIX_A2_EST,_GetInst()}}
oDCA2_EST:FieldSpec := UF_FIELD{}
oDCA2_EST:HyperLabel := HyperLabel{#A2_EST,"Numero:","Estado","MB01_NUMERO"}
oDCA2_EST:TooltipText := "Estado"

oDCCONCEITO := SingleLineEdit{self,ResourceID{A2MIX_CONCEITO,_GetInst()}}
oDCCONCEITO:FieldSpec := padrao_char_02{}
oDCCONCEITO:HyperLabel := HyperLabel{#CONCEITO,"Numero:","Conceito","MB01_NUMERO"}
oDCCONCEITO:TooltipText := "Conceito"

oDCQUALIFI := SingleLineEdit{self,ResourceID{A2MIX_QUALIFI,_GetInst()}}
oDCQUALIFI:FieldSpec := padrao_char_12{}
oDCQUALIFI:HyperLabel := HyperLabel{#QUALIFI,"Numero:","Qualificação","MB01_NUMERO"}
oDCQUALIFI:TooltipText := "Qualificacao"

oDCCODMAT := SingleLineEdit{self,ResourceID{A2MIX_CODMAT,_GetInst()}}
oDCCODMAT:FieldSpec := padrao_char_04{}
oDCCODMAT:HyperLabel := HyperLabel{#CODMAT,"Numero:","Ramo de Atividade","MB01_NUMERO"}
oDCCODMAT:TooltipText := "Ramo de Atividade"

oCCpornum := PushButton{self,ResourceID{A2MIX_PORNUM,_GetInst()}}
oCCpornum:Image := ico_az{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,"Ordenar por Numero",NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

oCCbuscanum := PushButton{self,ResourceID{A2MIX_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ico_find{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,"Localizar Numero",NULL_STRING}
oCCbuscanum:TooltipText := "Clique Para Localizar Por Numero"

oDCA2_INSCR := SingleLineEdit{self,ResourceID{A2MIX_A2_INSCR,_GetInst()}}
oDCA2_INSCR:FieldSpec := padrao_char_16{}
oDCA2_INSCR:HyperLabel := HyperLabel{#A2_INSCR,NULL_STRING,NULL_STRING,"MA01_CODIGO"}
oDCA2_INSCR:TooltipText := "Codigo Junto ao Cliente"

oDCSC_TELEFAX3 := FixedText{self,ResourceID{A2MIX_SC_TELEFAX3,_GetInst()}}
oDCSC_TELEFAX3:HyperLabel := HyperLabel{#SC_TELEFAX3,"IE/RG",NULL_STRING,NULL_STRING}

oDCA2_CGC := SingleLineEdit{self,ResourceID{A2MIX_A2_CGC,_GetInst()}}
oDCA2_CGC:FieldSpec := padrao_char_18{}
oDCA2_CGC:HyperLabel := HyperLabel{#A2_CGC,NULL_STRING,NULL_STRING,"MA01_CODIGO"}
oDCA2_CGC:TooltipText := "Codigo Junto ao Cliente"

oDCSC_TELEFAX2 := FixedText{self,ResourceID{A2MIX_SC_TELEFAX2,_GetInst()}}
oDCSC_TELEFAX2:HyperLabel := HyperLabel{#SC_TELEFAX2,"CGC/CPF",NULL_STRING,NULL_STRING}

oCCcmdpessoa := PushButton{self,ResourceID{A2MIX_CMDPESSOA,_GetInst()}}
oCCcmdpessoa:HyperLabel := HyperLabel{#cmdpessoa,"FJO",NULL_STRING,NULL_STRING}

oDCpessoa := SingleLineEdit{self,ResourceID{A2MIX_PESSOA,_GetInst()}}
oDCpessoa:FieldSpec := padrao_char_01{}
oDCpessoa:HyperLabel := HyperLabel{#pessoa,NULL_STRING,NULL_STRING,"MA01_NUMERO"}
oDCpessoa:TooltipText := "Estado"

oDCSC_TELEFAX4 := FixedText{self,ResourceID{A2MIX_SC_TELEFAX4,_GetInst()}}
oDCSC_TELEFAX4:HyperLabel := HyperLabel{#SC_TELEFAX4,"Pessoa",NULL_STRING,NULL_STRING}

oCCcmdcheckcgc := PushButton{self,ResourceID{A2MIX_CMDCHECKCGC,_GetInst()}}
oCCcmdcheckcgc:HyperLabel := HyperLabel{#cmdcheckcgc,"Checar",NULL_STRING,NULL_STRING}

oCCcmdcheckie := PushButton{self,ResourceID{A2MIX_CMDCHECKIE,_GetInst()}}
oCCcmdcheckie:HyperLabel := HyperLabel{#cmdcheckie,"Checar",NULL_STRING,NULL_STRING}

oCCcmdcheckuf := PushButton{self,ResourceID{A2MIX_CMDCHECKUF,_GetInst()}}
oCCcmdcheckuf:HyperLabel := HyperLabel{#cmdcheckuf,"Checar",NULL_STRING,NULL_STRING}

oDCtheFixedText21 := FixedText{self,ResourceID{A2MIX_THEFIXEDTEXT21,_GetInst()}}
oDCtheFixedText21:HyperLabel := HyperLabel{#theFixedText21,"Ramo Atividade",NULL_STRING,NULL_STRING}

oDCSC_CONCEITO := FixedText{self,ResourceID{A2MIX_SC_CONCEITO,_GetInst()}}
oDCSC_CONCEITO:HyperLabel := HyperLabel{#SC_CONCEITO,"Conceito:",NULL_STRING,NULL_STRING}

oDCSC_QUALIFI := FixedText{self,ResourceID{A2MIX_SC_QUALIFI,_GetInst()}}
oDCSC_QUALIFI:HyperLabel := HyperLabel{#SC_QUALIFI,"Qualificação:",NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{self,ResourceID{A2MIX_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{A2MIX_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCA2_COD := SingleLineEdit{self,ResourceID{A2MIX_A2_COD,_GetInst()}}
oDCA2_COD:FieldSpec := padrao_char_06{}
oDCA2_COD:HyperLabel := HyperLabel{#A2_COD,"Numero:","Numero de Cadastramento","MB01_NUMERO"}

oDCA2_NREDUZ := SingleLineEdit{self,ResourceID{A2MIX_A2_NREDUZ,_GetInst()}}
oDCA2_NREDUZ:FieldSpec := padrao_char_20{}
oDCA2_NREDUZ:HyperLabel := HyperLabel{#A2_NREDUZ,"Cognome:","Cognome","MB01_COGNOME"}

oDCSC_NOME := FixedText{self,ResourceID{A2MIX_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCA2_NOME := SingleLineEdit{self,ResourceID{A2MIX_A2_NOME,_GetInst()}}
oDCA2_NOME:FieldSpec := PADRAO_CHAR_40{}
oDCA2_NOME:HyperLabel := HyperLabel{#A2_NOME,"Nome:","Razao Social","MB01_NOME"}
oDCA2_NOME:TooltipText := "Razao Social"

oDCSC_ENDERECO := FixedText{self,ResourceID{A2MIX_SC_ENDERECO,_GetInst()}}
oDCSC_ENDERECO:HyperLabel := HyperLabel{#SC_ENDERECO,"Endereço:",NULL_STRING,NULL_STRING}

oDCA2_END := SingleLineEdit{self,ResourceID{A2MIX_A2_END,_GetInst()}}
oDCA2_END:FieldSpec := padrao_char_40{}
oDCA2_END:HyperLabel := HyperLabel{#A2_END,"Endereco:","Endereço","MB01_ENDERECO"}
oDCA2_END:TooltipText := "Endereco"

oDCSC_BAIRRO := FixedText{self,ResourceID{A2MIX_SC_BAIRRO,_GetInst()}}
oDCSC_BAIRRO:HyperLabel := HyperLabel{#SC_BAIRRO,"Bairro:",NULL_STRING,NULL_STRING}

oDCA2_BAIRRO := SingleLineEdit{self,ResourceID{A2MIX_A2_BAIRRO,_GetInst()}}
oDCA2_BAIRRO:FieldSpec := padrao_char_30{}
oDCA2_BAIRRO:HyperLabel := HyperLabel{#A2_BAIRRO,"Bairro:","Bairro","MB01_BAIRRO"}
oDCA2_BAIRRO:TooltipText := "Bairro"

oDCSC_CIDADE := FixedText{self,ResourceID{A2MIX_SC_CIDADE,_GetInst()}}
oDCSC_CIDADE:HyperLabel := HyperLabel{#SC_CIDADE,"Cidade:",NULL_STRING,NULL_STRING}

oDCA2_MUN := SingleLineEdit{self,ResourceID{A2MIX_A2_MUN,_GetInst()}}
oDCA2_MUN:FieldSpec := padrao_char_30{}
oDCA2_MUN:HyperLabel := HyperLabel{#A2_MUN,"Cidade:","Cidade","MB01_CIDADE"}
oDCA2_MUN:TooltipText := "Cidade"

oDCSC_CEP := FixedText{self,ResourceID{A2MIX_SC_CEP,_GetInst()}}
oDCSC_CEP:HyperLabel := HyperLabel{#SC_CEP,"Cep:",NULL_STRING,NULL_STRING}

oDCA2_CEP := SingleLineEdit{self,ResourceID{A2MIX_A2_CEP,_GetInst()}}
oDCA2_CEP:FieldSpec := padrao_char_09{}
oDCA2_CEP:HyperLabel := HyperLabel{#A2_CEP,"Cep:","CEP","MB01_CEP"}
oDCA2_CEP:TooltipText := "Cep"

oDCSC_ESTADO := FixedText{self,ResourceID{A2MIX_SC_ESTADO,_GetInst()}}
oDCSC_ESTADO:HyperLabel := HyperLabel{#SC_ESTADO,"Estado:",NULL_STRING,NULL_STRING}

oDCSC_DDD := FixedText{self,ResourceID{A2MIX_SC_DDD,_GetInst()}}
oDCSC_DDD:HyperLabel := HyperLabel{#SC_DDD,"DDD:",NULL_STRING,NULL_STRING}

oDCSC_TELEFONE := FixedText{self,ResourceID{A2MIX_SC_TELEFONE,_GetInst()}}
oDCSC_TELEFONE:HyperLabel := HyperLabel{#SC_TELEFONE,"Telefone:",NULL_STRING,NULL_STRING}

oDCSC_RAMAL := FixedText{self,ResourceID{A2MIX_SC_RAMAL,_GetInst()}}
oDCSC_RAMAL:HyperLabel := HyperLabel{#SC_RAMAL,"Ramal:",NULL_STRING,NULL_STRING}

oDCSC_CONTATO := FixedText{self,ResourceID{A2MIX_SC_CONTATO,_GetInst()}}
oDCSC_CONTATO:HyperLabel := HyperLabel{#SC_CONTATO,"Contato",NULL_STRING,NULL_STRING}

oDCtheFixedText16 := FixedText{self,ResourceID{A2MIX_THEFIXEDTEXT16,_GetInst()}}
oDCtheFixedText16:HyperLabel := HyperLabel{#theFixedText16,"Telefone",NULL_STRING,NULL_STRING}

oDCDDD := SingleLineEdit{self,ResourceID{A2MIX_DDD,_GetInst()}}
oDCDDD:FieldSpec := padrao_char_03{}
oDCDDD:HyperLabel := HyperLabel{#DDD,"Ddd:",NULL_STRING,"MB01_DDD"}
oDCDDD:TooltipText := "DDD"

oDCA2_TEL := SingleLineEdit{self,ResourceID{A2MIX_A2_TEL,_GetInst()}}
oDCA2_TEL:FieldSpec := padrao_char_15{}
oDCA2_TEL:HyperLabel := HyperLabel{#A2_TEL,"Telefone:",NULL_STRING,"MB01_TELEFONE"}
oDCA2_TEL:TooltipText := "Numero do Telefone"

oDCRAMAL := SingleLineEdit{self,ResourceID{A2MIX_RAMAL,_GetInst()}}
oDCRAMAL:FieldSpec := padrao_char_04{}
oDCRAMAL:HyperLabel := HyperLabel{#RAMAL,"Ramal:",NULL_STRING,"MB01_RAMAL"}
oDCRAMAL:TooltipText := "Ramal"

oDCA2_CONTATO := SingleLineEdit{self,ResourceID{A2MIX_A2_CONTATO,_GetInst()}}
oDCA2_CONTATO:FieldSpec := padrao_char_22{}
oDCA2_CONTATO:HyperLabel := HyperLabel{#A2_CONTATO,"Contato:",NULL_STRING,"MB01_CONTATO"}
oDCA2_CONTATO:TooltipText := "Contato"

oDCtheFixedText17 := FixedText{self,ResourceID{A2MIX_THEFIXEDTEXT17,_GetInst()}}
oDCtheFixedText17:HyperLabel := HyperLabel{#theFixedText17,"Telefone",NULL_STRING,NULL_STRING}

oDCDDD1 := SingleLineEdit{self,ResourceID{A2MIX_DDD1,_GetInst()}}
oDCDDD1:FieldSpec := padrao_char_03{}
oDCDDD1:HyperLabel := HyperLabel{#DDD1,"Ddd1:",NULL_STRING,"MB01_DDD1"}
oDCDDD1:TooltipText := "DDD"

oDCTELEFONE1 := SingleLineEdit{self,ResourceID{A2MIX_TELEFONE1,_GetInst()}}
oDCTELEFONE1:FieldSpec := padrao_char_09{}
oDCTELEFONE1:HyperLabel := HyperLabel{#TELEFONE1,"Telefone1:",NULL_STRING,"MB01_TELEFONE1"}
oDCTELEFONE1:TooltipText := "Telefone"

oDCRAMAL1 := SingleLineEdit{self,ResourceID{A2MIX_RAMAL1,_GetInst()}}
oDCRAMAL1:FieldSpec := padrao_char_04{}
oDCRAMAL1:HyperLabel := HyperLabel{#RAMAL1,"Ramal1:",NULL_STRING,"MB01_RAMAL1"}
oDCRAMAL1:TooltipText := "Ramal"

oDCCONTATO1 := SingleLineEdit{self,ResourceID{A2MIX_CONTATO1,_GetInst()}}
oDCCONTATO1:FieldSpec := padrao_char_22{}
oDCCONTATO1:HyperLabel := HyperLabel{#CONTATO1,"Contato1:",NULL_STRING,"MB01_CONTATO1"}
oDCCONTATO1:TooltipText := "Contato"

oDCtheFixedText18 := FixedText{self,ResourceID{A2MIX_THEFIXEDTEXT18,_GetInst()}}
oDCtheFixedText18:HyperLabel := HyperLabel{#theFixedText18,"Fax:",NULL_STRING,NULL_STRING}

oDCDDDFAX := SingleLineEdit{self,ResourceID{A2MIX_DDDFAX,_GetInst()}}
oDCDDDFAX:FieldSpec := padrao_char_03{}
oDCDDDFAX:HyperLabel := HyperLabel{#DDDFAX,"Dddfax:",NULL_STRING,"MB01_DDDFAX"}
oDCDDDFAX:TooltipText := "Fax"

oDCA2_FAX := SingleLineEdit{self,ResourceID{A2MIX_A2_FAX,_GetInst()}}
oDCA2_FAX:FieldSpec := padrao_char_15{}
oDCA2_FAX:HyperLabel := HyperLabel{#A2_FAX,"Telefax:",NULL_STRING,"MB01_TELEFAX"}
oDCA2_FAX:TooltipText := "Numero do Fax"

oDCft20 := FixedText{self,ResourceID{A2MIX_FT20,_GetInst()}}
oDCft20:HyperLabel := HyperLabel{#ft20,"Email",NULL_STRING,NULL_STRING}

oDCEMAIL := SingleLineEdit{self,ResourceID{A2MIX_EMAIL,_GetInst()}}
oDCEMAIL:FieldSpec := EMAIL_FIELD{}
oDCEMAIL:HyperLabel := HyperLabel{#EMAIL,NULL_STRING,NULL_STRING,NULL_STRING}
oDCEMAIL:TooltipText := "Email"

oDCFT21 := FixedText{self,ResourceID{A2MIX_FT21,_GetInst()}}
oDCFT21:HyperLabel := HyperLabel{#FT21,"Site",NULL_STRING,NULL_STRING}

oDCSITE := SingleLineEdit{self,ResourceID{A2MIX_SITE,_GetInst()}}
oDCSITE:FieldSpec := padrao_char_30{}
oDCSITE:HyperLabel := HyperLabel{#SITE,NULL_STRING,NULL_STRING,NULL_STRING}
oDCSITE:TooltipText := "Site"

oDCFT22 := FixedText{self,ResourceID{A2MIX_FT22,_GetInst()}}
oDCFT22:HyperLabel := HyperLabel{#FT22,"Responsável",NULL_STRING,NULL_STRING}

oDCRESPF := SingleLineEdit{self,ResourceID{A2MIX_RESPF,_GetInst()}}
oDCRESPF:FieldSpec := padrao_char_30{}
oDCRESPF:HyperLabel := HyperLabel{#RESPF,NULL_STRING,NULL_STRING,NULL_STRING}
oDCRESPF:TooltipText := "Nome do Responsavel"

oDCFT23 := FixedText{self,ResourceID{A2MIX_FT23,_GetInst()}}
oDCFT23:HyperLabel := HyperLabel{#FT23,"Cargo do Responsável",NULL_STRING,NULL_STRING}

oDCCARGOR := SingleLineEdit{self,ResourceID{A2MIX_CARGOR,_GetInst()}}
oDCCARGOR:FieldSpec := PADRAO_CHAR_30{}
oDCCARGOR:HyperLabel := HyperLabel{#CARGOR,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCARGOR:TooltipText := "Funçao do Responsavel"

self:Caption := "Cadastro de Fornecedores"
self:HyperLabel := HyperLabel{#a2mix,"Cadastro de Fornecedores",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBA2_COD := DataColumn{padrao_char_06{}}
oDBA2_COD:Width := 14
oDBA2_COD:HyperLabel := oDCA2_COD:HyperLabel 
oDBA2_COD:Caption := "Numero:"
self:Browser:AddColumn(oDBA2_COD)

oDBA2_NREDUZ := DataColumn{padrao_char_20{}}
oDBA2_NREDUZ:Width := 18
oDBA2_NREDUZ:HyperLabel := oDCA2_NREDUZ:HyperLabel 
oDBA2_NREDUZ:Caption := "Cognome:"
self:Browser:AddColumn(oDBA2_NREDUZ)

oDBA2_NOME := DataColumn{PADRAO_CHAR_40{}}
oDBA2_NOME:Width := 51
oDBA2_NOME:HyperLabel := oDCA2_NOME:HyperLabel 
oDBA2_NOME:Caption := "Nome:"
self:Browser:AddColumn(oDBA2_NOME)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access pessoa() 
return self:FieldGet(#pessoa)


assign pessoa(uValue) 
self:FieldPut(#pessoa, uValue)
return pessoa := uValue


METHOD pornum( ) 
	SELF:KeyFind()
//	SELF:server:setorder(1)

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   FabCenterWindow( SELF )
 RETURN SELF

access QUALIFI() 
return self:FieldGet(#QUALIFI)


assign QUALIFI(uValue) 
self:FieldPut(#QUALIFI, uValue)
return QUALIFI := uValue


access RAMAL() 
return self:FieldGet(#RAMAL)


assign RAMAL(uValue) 
self:FieldPut(#RAMAL, uValue)
return RAMAL := uValue


access RAMAL1() 
return self:FieldGet(#RAMAL1)


assign RAMAL1(uValue) 
self:FieldPut(#RAMAL1, uValue)
return RAMAL1 := uValue


access RESPF() 
return self:FieldGet(#RESPF)


assign RESPF(uValue) 
self:FieldPut(#RESPF, uValue)
return RESPF := uValue


access SITE() 
return self:FieldGet(#SITE)


assign SITE(uValue) 
self:FieldPut(#SITE, uValue)
return SITE := uValue


access TELEFONE1() 
return self:FieldGet(#TELEFONE1)


assign TELEFONE1(uValue) 
self:FieldPut(#TELEFONE1, uValue)
return TELEFONE1 := uValue


METHOD Timer() 
   SELF:SERVER:COMMIT()

ACCESS VENDEDOR() 
RETURN SELF:FIELDGET(#VENDEDOR)


END CLASS
