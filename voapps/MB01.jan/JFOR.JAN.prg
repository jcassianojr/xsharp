#region DEFINES
STATIC DEFINE JFOR_BAIRRO := 130 
STATIC DEFINE JFOR_BUSCANUM := 105 
STATIC DEFINE JFOR_CARGOR := 160 
STATIC DEFINE JFOR_CEP := 134 
STATIC DEFINE JFOR_CGC := 108 
STATIC DEFINE JFOR_CIDADE := 132 
STATIC DEFINE JFOR_CMDCHECKCGC := 113 
STATIC DEFINE JFOR_CMDCHECKIE := 114 
STATIC DEFINE JFOR_CMDCHECKUF := 115 
STATIC DEFINE JFOR_CMDPESSOA := 110 
STATIC DEFINE JFOR_CODMAT := 103 
STATIC DEFINE JFOR_COGNOME := 124 
STATIC DEFINE JFOR_CONCEITO := 101 
STATIC DEFINE JFOR_CONTATO := 144 
STATIC DEFINE JFOR_CONTATO1 := 149 
STATIC DEFINE JFOR_DDD := 141 
STATIC DEFINE JFOR_DDD1 := 146 
STATIC DEFINE JFOR_DDDFAX := 151 
STATIC DEFINE JFOR_EMAIL := 154 
STATIC DEFINE JFOR_EMAIL1 := 116 
STATIC DEFINE JFOR_ENDERECO := 128 
STATIC DEFINE JFOR_ESTADO := 100 
STATIC DEFINE JFOR_FT19 := 104 
STATIC DEFINE JFOR_FT20 := 153 
STATIC DEFINE JFOR_FT21 := 155 
STATIC DEFINE JFOR_FT22 := 157 
STATIC DEFINE JFOR_FT23 := 159 
STATIC DEFINE JFOR_IESTADUAL := 106 
STATIC DEFINE JFOR_NOME := 126 
STATIC DEFINE JFOR_NUMERO := 123 
STATIC DEFINE JFOR_PESSOA := 111 
STATIC DEFINE JFOR_PORNUM := 104 
STATIC DEFINE JFOR_QUALIFI := 102 
STATIC DEFINE JFOR_RAMAL := 143 
STATIC DEFINE JFOR_RAMAL1 := 148 
STATIC DEFINE JFOR_RESPF := 158 
STATIC DEFINE JFOR_SC_BAIRRO := 129 
STATIC DEFINE JFOR_SC_CEP := 133 
STATIC DEFINE JFOR_SC_CIDADE := 131 
STATIC DEFINE JFOR_SC_CIDADE1 := 117 
STATIC DEFINE JFOR_SC_COGNOME := 121 
STATIC DEFINE JFOR_SC_CONCEITO := 119 
STATIC DEFINE JFOR_SC_CONTATO := 139 
STATIC DEFINE JFOR_SC_DDD := 136 
STATIC DEFINE JFOR_SC_ENDERECO := 127 
STATIC DEFINE JFOR_SC_ESTADO := 135 
STATIC DEFINE JFOR_SC_NOME := 125 
STATIC DEFINE JFOR_SC_NUMERO := 122 
STATIC DEFINE JFOR_SC_QUALIFI := 120 
STATIC DEFINE JFOR_SC_RAMAL := 138 
STATIC DEFINE JFOR_SC_TELEFAX2 := 109 
STATIC DEFINE JFOR_SC_TELEFAX3 := 107 
STATIC DEFINE JFOR_SC_TELEFAX4 := 112 
STATIC DEFINE JFOR_SC_TELEFONE := 137 
STATIC DEFINE JFOR_SITE := 156 
STATIC DEFINE JFOR_TELEFAX := 152 
STATIC DEFINE JFOR_TELEFONE := 142 
STATIC DEFINE JFOR_TELEFONE1 := 147 
STATIC DEFINE JFOR_THEFIXEDTEXT16 := 140 
STATIC DEFINE JFOR_THEFIXEDTEXT17 := 145 
STATIC DEFINE JFOR_THEFIXEDTEXT18 := 150 
STATIC DEFINE JFOR_THEFIXEDTEXT21 := 118 
#endregion

class JFOR inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCESTADO as SINGLELINEEDIT
	protect oDCCONCEITO as SINGLELINEEDIT
	protect oDCQUALIFI as SINGLELINEEDIT
	protect oDCCODMAT as SINGLELINEEDIT
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oDCIESTADUAL as SINGLELINEEDIT
	protect oDCSC_TELEFAX3 as FIXEDTEXT
	protect oDCCGC as SINGLELINEEDIT
	protect oDCSC_TELEFAX2 as FIXEDTEXT
	protect oCCcmdpessoa as PUSHBUTTON
	protect oDCpessoa as SINGLELINEEDIT
	protect oDCSC_TELEFAX4 as FIXEDTEXT
	protect oCCcmdcheckcgc as PUSHBUTTON
	protect oCCcmdcheckie as PUSHBUTTON
	protect oCCcmdcheckuf as PUSHBUTTON
	protect oDCEMAIL1 as SINGLELINEEDIT
	protect oDCSC_CIDADE1 as FIXEDTEXT
	protect oDCtheFixedText21 as FIXEDTEXT
	protect oDCSC_CONCEITO as FIXEDTEXT
	protect oDCSC_QUALIFI as FIXEDTEXT
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSC_ENDERECO as FIXEDTEXT
	protect oDCENDERECO as SINGLELINEEDIT
	protect oDCSC_BAIRRO as FIXEDTEXT
	protect oDCBAIRRO as SINGLELINEEDIT
	protect oDCSC_CIDADE as FIXEDTEXT
	protect oDCCIDADE as SINGLELINEEDIT
	protect oDCSC_CEP as FIXEDTEXT
	protect oDCCEP as SINGLELINEEDIT
	protect oDCSC_ESTADO as FIXEDTEXT
	protect oDCSC_DDD as FIXEDTEXT
	protect oDCSC_TELEFONE as FIXEDTEXT
	protect oDCSC_RAMAL as FIXEDTEXT
	protect oDCSC_CONTATO as FIXEDTEXT
	protect oDCtheFixedText16 as FIXEDTEXT
	protect oDCDDD as SINGLELINEEDIT
	protect oDCTELEFONE as SINGLELINEEDIT
	protect oDCRAMAL as SINGLELINEEDIT
	protect oDCCONTATO as SINGLELINEEDIT
	protect oDCtheFixedText17 as FIXEDTEXT
	protect oDCDDD1 as SINGLELINEEDIT
	protect oDCTELEFONE1 as SINGLELINEEDIT
	protect oDCRAMAL1 as SINGLELINEEDIT
	protect oDCCONTATO1 as SINGLELINEEDIT
	protect oDCtheFixedText18 as FIXEDTEXT
	protect oDCDDDFAX as SINGLELINEEDIT
	protect oDCTELEFAX as SINGLELINEEDIT
	protect oDCft20 as FIXEDTEXT
	protect oDCEMAIL as SINGLELINEEDIT
	protect oDCFT21 as FIXEDTEXT
	protect oDCSITE as SINGLELINEEDIT
	protect oDCFT22 as FIXEDTEXT
	protect oDCRESPF as SINGLELINEEDIT
	protect oDCFT23 as FIXEDTEXT
	protect oDCCARGOR as SINGLELINEEDIT
// 	instance ESTADO 
// 	instance CONCEITO 
// 	instance QUALIFI 
// 	instance CODMAT 
// 	instance IESTADUAL 
// 	instance CGC 
// 	instance pessoa 
// 	instance EMAIL1 
// 	instance NUMERO 
// 	instance COGNOME 
// 	instance NOME 
// 	instance ENDERECO 
// 	instance BAIRRO 
// 	instance CIDADE 
// 	instance CEP 
// 	instance DDD 
// 	instance TELEFONE 
// 	instance RAMAL 
// 	instance CONTATO 
// 	instance DDD1 
// 	instance TELEFONE1 
// 	instance RAMAL1 
// 	instance CONTATO1 
// 	instance DDDFAX 
// 	instance TELEFAX 
// 	instance EMAIL 
// 	instance SITE 
// 	instance RESPF 
// 	instance CARGOR 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD APPEND() 
LOCAL	otb AS TEXTBOX
Otb:=TEXTBOX{,"Erro","Operação Bloqueada"}
Otb:show()



access BAIRRO() 
return self:FieldGet(#BAIRRO)


assign BAIRRO(uValue) 
self:FieldPut(#BAIRRO, uValue)
return BAIRRO := uValue


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


access CEP() 
return self:FieldGet(#CEP)


assign CEP(uValue) 
self:FieldPut(#CEP, uValue)
return CEP := uValue


access CGC() 
return self:FieldGet(#CGC)


assign CGC(uValue) 
self:FieldPut(#CGC, uValue)
return CGC := uValue


access CIDADE() 
return self:FieldGet(#CIDADE)


assign CIDADE(uValue) 
self:FieldPut(#CIDADE, uValue)
return CIDADE := uValue


METHOD cmdcheckcgc( ) 
LOCAL cPESSOA AS STRING	
cPESSOA:=SELF:SERVER:FIELDGET("PESSOA")
IF cPESSOA="J"
   IF VALCGC(SELF:SERVER:FIELDGET("CGC"))
   	  alert("CGC OK")
   ENDIF	
ENDIF	
IF cPESSOA="F"
   IF Valcpf(SELF:SERVER:FIELDGET("CGC"))
   	  alert("CPF OK")
   ENDIF		
ENDIF		

METHOD cmdcheckie( ) 
	LOCAL cPESSOA AS STRING	
cPESSOA:=SELF:SERVER:FIELDGET("PESSOA")
IF cPESSOA="J"
   ValIE(SELF:SERVER:FIELDGET("ESTADO"),SELF:SERVER:FIELDGET("IESTADUAL"))
ENDIF	
IF cPESSOA="F"
   IF CheckRG(SELF:SERVER:FIELDGET("IESTADUAL"))
   	   alert("RG OK")
   ENDIF		
ENDIF		

METHOD cmdcheckuf( ) 
	ufCheck(SELF:server:FIELDGET("ESTADO"))

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("MB","")		

METHOD cmdpessoa( ) 
		SELF:server:FIELDPUT("PESSOA",SIMNAO(SELF:SERVER:FIELDGET("PESSOA"),{"J","F","O"}))

access CODMAT() 
return self:FieldGet(#CODMAT)


assign CODMAT(uValue) 
self:FieldPut(#CODMAT, uValue)
return CODMAT := uValue


access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


access CONCEITO() 
return self:FieldGet(#CONCEITO)


assign CONCEITO(uValue) 
self:FieldPut(#CONCEITO, uValue)
return CONCEITO := uValue


access CONTATO() 
return self:FieldGet(#CONTATO)


assign CONTATO(uValue) 
self:FieldPut(#CONTATO, uValue)
return CONTATO := uValue


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


access EMAIL1() 
return self:FieldGet(#EMAIL1)


assign EMAIL1(uValue) 
self:FieldPut(#EMAIL1, uValue)
return EMAIL1 := uValue


access ENDERECO() 
return self:FieldGet(#ENDERECO)


assign ENDERECO(uValue) 
self:FieldPut(#ENDERECO, uValue)
return ENDERECO := uValue


access ESTADO() 
return self:FieldGet(#ESTADO)


assign ESTADO(uValue) 
self:FieldPut(#ESTADO, uValue)
return ESTADO := uValue


access IESTADUAL() 
return self:FieldGet(#IESTADUAL)


assign IESTADUAL(uValue) 
self:FieldPut(#IESTADUAL, uValue)
return IESTADUAL := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFOR",_GetInst()},iCtlID)

oDCESTADO := SingleLineEdit{self,ResourceID{JFOR_ESTADO,_GetInst()}}
oDCESTADO:FieldSpec := UF_FIELD{}
oDCESTADO:HyperLabel := HyperLabel{#ESTADO,"Numero:","Estado","MB01_NUMERO"}
oDCESTADO:TooltipText := "Estado"

oDCCONCEITO := SingleLineEdit{self,ResourceID{JFOR_CONCEITO,_GetInst()}}
oDCCONCEITO:FieldSpec := padrao_char_02{}
oDCCONCEITO:HyperLabel := HyperLabel{#CONCEITO,"Numero:","Conceito","MB01_NUMERO"}
oDCCONCEITO:TooltipText := "Conceito"

oDCQUALIFI := SingleLineEdit{self,ResourceID{JFOR_QUALIFI,_GetInst()}}
oDCQUALIFI:FieldSpec := padrao_char_12{}
oDCQUALIFI:HyperLabel := HyperLabel{#QUALIFI,"Numero:","Qualificação","MB01_NUMERO"}
oDCQUALIFI:TooltipText := "Qualificacao"

oDCCODMAT := SingleLineEdit{self,ResourceID{JFOR_CODMAT,_GetInst()}}
oDCCODMAT:FieldSpec := padrao_char_04{}
oDCCODMAT:HyperLabel := HyperLabel{#CODMAT,"Numero:","Ramo de Atividade","MB01_NUMERO"}
oDCCODMAT:TooltipText := "Ramo de Atividade"

oCCpornum := PushButton{self,ResourceID{JFOR_PORNUM,_GetInst()}}
oCCpornum:Image := ico_az{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,"Ordenar por Numero",NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

oCCbuscanum := PushButton{self,ResourceID{JFOR_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ico_find{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,"Localizar Numero",NULL_STRING}
oCCbuscanum:TooltipText := "Clique Para Localizar Por Numero"

oDCIESTADUAL := SingleLineEdit{self,ResourceID{JFOR_IESTADUAL,_GetInst()}}
oDCIESTADUAL:FieldSpec := padrao_char_16{}
oDCIESTADUAL:HyperLabel := HyperLabel{#IESTADUAL,NULL_STRING,NULL_STRING,"MA01_CODIGO"}
oDCIESTADUAL:TooltipText := "Codigo Junto ao Cliente"

oDCSC_TELEFAX3 := FixedText{self,ResourceID{JFOR_SC_TELEFAX3,_GetInst()}}
oDCSC_TELEFAX3:HyperLabel := HyperLabel{#SC_TELEFAX3,"IE/RG",NULL_STRING,NULL_STRING}

oDCCGC := SingleLineEdit{self,ResourceID{JFOR_CGC,_GetInst()}}
oDCCGC:FieldSpec := padrao_char_18{}
oDCCGC:HyperLabel := HyperLabel{#CGC,NULL_STRING,NULL_STRING,"MA01_CODIGO"}
oDCCGC:TooltipText := "Codigo Junto ao Cliente"

oDCSC_TELEFAX2 := FixedText{self,ResourceID{JFOR_SC_TELEFAX2,_GetInst()}}
oDCSC_TELEFAX2:HyperLabel := HyperLabel{#SC_TELEFAX2,"CGC/CPF",NULL_STRING,NULL_STRING}

oCCcmdpessoa := PushButton{self,ResourceID{JFOR_CMDPESSOA,_GetInst()}}
oCCcmdpessoa:HyperLabel := HyperLabel{#cmdpessoa,"FJO",NULL_STRING,NULL_STRING}

oDCpessoa := SingleLineEdit{self,ResourceID{JFOR_PESSOA,_GetInst()}}
oDCpessoa:FieldSpec := padrao_char_01{}
oDCpessoa:HyperLabel := HyperLabel{#pessoa,NULL_STRING,NULL_STRING,"MA01_NUMERO"}
oDCpessoa:TooltipText := "Estado"

oDCSC_TELEFAX4 := FixedText{self,ResourceID{JFOR_SC_TELEFAX4,_GetInst()}}
oDCSC_TELEFAX4:HyperLabel := HyperLabel{#SC_TELEFAX4,"Pessoa",NULL_STRING,NULL_STRING}

oCCcmdcheckcgc := PushButton{self,ResourceID{JFOR_CMDCHECKCGC,_GetInst()}}
oCCcmdcheckcgc:HyperLabel := HyperLabel{#cmdcheckcgc,"Checar",NULL_STRING,NULL_STRING}

oCCcmdcheckie := PushButton{self,ResourceID{JFOR_CMDCHECKIE,_GetInst()}}
oCCcmdcheckie:HyperLabel := HyperLabel{#cmdcheckie,"Checar",NULL_STRING,NULL_STRING}

oCCcmdcheckuf := PushButton{self,ResourceID{JFOR_CMDCHECKUF,_GetInst()}}
oCCcmdcheckuf:HyperLabel := HyperLabel{#cmdcheckuf,"Checar",NULL_STRING,NULL_STRING}

oDCEMAIL1 := SingleLineEdit{self,ResourceID{JFOR_EMAIL1,_GetInst()}}
oDCEMAIL1:FieldSpec := EMAIL_FIELD{}
oDCEMAIL1:HyperLabel := HyperLabel{#EMAIL1,NULL_STRING,NULL_STRING,"MC02_CIDADE"}

oDCSC_CIDADE1 := FixedText{self,ResourceID{JFOR_SC_CIDADE1,_GetInst()}}
oDCSC_CIDADE1:HyperLabel := HyperLabel{#SC_CIDADE1,"eMAIL:",NULL_STRING,NULL_STRING}

oDCtheFixedText21 := FixedText{self,ResourceID{JFOR_THEFIXEDTEXT21,_GetInst()}}
oDCtheFixedText21:HyperLabel := HyperLabel{#theFixedText21,"Ramo Atividade",NULL_STRING,NULL_STRING}

oDCSC_CONCEITO := FixedText{self,ResourceID{JFOR_SC_CONCEITO,_GetInst()}}
oDCSC_CONCEITO:HyperLabel := HyperLabel{#SC_CONCEITO,"Conceito:",NULL_STRING,NULL_STRING}

oDCSC_QUALIFI := FixedText{self,ResourceID{JFOR_SC_QUALIFI,_GetInst()}}
oDCSC_QUALIFI:HyperLabel := HyperLabel{#SC_QUALIFI,"Qualificação:",NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{self,ResourceID{JFOR_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JFOR_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JFOR_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:","Numero de Cadastramento","MB01_NUMERO"}

oDCCOGNOME := SingleLineEdit{self,ResourceID{JFOR_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := padrao_char_15{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:","Cognome","MB01_COGNOME"}

oDCSC_NOME := FixedText{self,ResourceID{JFOR_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JFOR_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:","Razao Social","MB01_NOME"}
oDCNOME:TooltipText := "Razao Social"

oDCSC_ENDERECO := FixedText{self,ResourceID{JFOR_SC_ENDERECO,_GetInst()}}
oDCSC_ENDERECO:HyperLabel := HyperLabel{#SC_ENDERECO,"Endereço:",NULL_STRING,NULL_STRING}

oDCENDERECO := SingleLineEdit{self,ResourceID{JFOR_ENDERECO,_GetInst()}}
oDCENDERECO:FieldSpec := padrao_char_40{}
oDCENDERECO:HyperLabel := HyperLabel{#ENDERECO,"Endereco:","Endereço","MB01_ENDERECO"}
oDCENDERECO:TooltipText := "Endereco"

oDCSC_BAIRRO := FixedText{self,ResourceID{JFOR_SC_BAIRRO,_GetInst()}}
oDCSC_BAIRRO:HyperLabel := HyperLabel{#SC_BAIRRO,"Bairro:",NULL_STRING,NULL_STRING}

oDCBAIRRO := SingleLineEdit{self,ResourceID{JFOR_BAIRRO,_GetInst()}}
oDCBAIRRO:FieldSpec := padrao_char_30{}
oDCBAIRRO:HyperLabel := HyperLabel{#BAIRRO,"Bairro:","Bairro","MB01_BAIRRO"}
oDCBAIRRO:TooltipText := "Bairro"

oDCSC_CIDADE := FixedText{self,ResourceID{JFOR_SC_CIDADE,_GetInst()}}
oDCSC_CIDADE:HyperLabel := HyperLabel{#SC_CIDADE,"Cidade:",NULL_STRING,NULL_STRING}

oDCCIDADE := SingleLineEdit{self,ResourceID{JFOR_CIDADE,_GetInst()}}
oDCCIDADE:FieldSpec := padrao_char_30{}
oDCCIDADE:HyperLabel := HyperLabel{#CIDADE,"Cidade:","Cidade","MB01_CIDADE"}
oDCCIDADE:TooltipText := "Cidade"

oDCSC_CEP := FixedText{self,ResourceID{JFOR_SC_CEP,_GetInst()}}
oDCSC_CEP:HyperLabel := HyperLabel{#SC_CEP,"Cep:",NULL_STRING,NULL_STRING}

oDCCEP := SingleLineEdit{self,ResourceID{JFOR_CEP,_GetInst()}}
oDCCEP:FieldSpec := padrao_char_09{}
oDCCEP:HyperLabel := HyperLabel{#CEP,"Cep:","CEP","MB01_CEP"}
oDCCEP:TooltipText := "Cep"

oDCSC_ESTADO := FixedText{self,ResourceID{JFOR_SC_ESTADO,_GetInst()}}
oDCSC_ESTADO:HyperLabel := HyperLabel{#SC_ESTADO,"Estado:",NULL_STRING,NULL_STRING}

oDCSC_DDD := FixedText{self,ResourceID{JFOR_SC_DDD,_GetInst()}}
oDCSC_DDD:HyperLabel := HyperLabel{#SC_DDD,"DDD:",NULL_STRING,NULL_STRING}

oDCSC_TELEFONE := FixedText{self,ResourceID{JFOR_SC_TELEFONE,_GetInst()}}
oDCSC_TELEFONE:HyperLabel := HyperLabel{#SC_TELEFONE,"Telefone:",NULL_STRING,NULL_STRING}

oDCSC_RAMAL := FixedText{self,ResourceID{JFOR_SC_RAMAL,_GetInst()}}
oDCSC_RAMAL:HyperLabel := HyperLabel{#SC_RAMAL,"Ramal:",NULL_STRING,NULL_STRING}

oDCSC_CONTATO := FixedText{self,ResourceID{JFOR_SC_CONTATO,_GetInst()}}
oDCSC_CONTATO:HyperLabel := HyperLabel{#SC_CONTATO,"Contato",NULL_STRING,NULL_STRING}

oDCtheFixedText16 := FixedText{self,ResourceID{JFOR_THEFIXEDTEXT16,_GetInst()}}
oDCtheFixedText16:HyperLabel := HyperLabel{#theFixedText16,"Telefone",NULL_STRING,NULL_STRING}

oDCDDD := SingleLineEdit{self,ResourceID{JFOR_DDD,_GetInst()}}
oDCDDD:FieldSpec := padrao_char_03{}
oDCDDD:HyperLabel := HyperLabel{#DDD,"Ddd:",NULL_STRING,"MB01_DDD"}
oDCDDD:TooltipText := "DDD"

oDCTELEFONE := SingleLineEdit{self,ResourceID{JFOR_TELEFONE,_GetInst()}}
oDCTELEFONE:FieldSpec := padrao_char_12{}
oDCTELEFONE:HyperLabel := HyperLabel{#TELEFONE,"Telefone:",NULL_STRING,"MB01_TELEFONE"}
oDCTELEFONE:TooltipText := "Numero do Telefone"

oDCRAMAL := SingleLineEdit{self,ResourceID{JFOR_RAMAL,_GetInst()}}
oDCRAMAL:FieldSpec := padrao_char_04{}
oDCRAMAL:HyperLabel := HyperLabel{#RAMAL,"Ramal:",NULL_STRING,"MB01_RAMAL"}
oDCRAMAL:TooltipText := "Ramal"

oDCCONTATO := SingleLineEdit{self,ResourceID{JFOR_CONTATO,_GetInst()}}
oDCCONTATO:FieldSpec := padrao_char_22{}
oDCCONTATO:HyperLabel := HyperLabel{#CONTATO,"Contato:",NULL_STRING,"MB01_CONTATO"}
oDCCONTATO:TooltipText := "Contato"

oDCtheFixedText17 := FixedText{self,ResourceID{JFOR_THEFIXEDTEXT17,_GetInst()}}
oDCtheFixedText17:HyperLabel := HyperLabel{#theFixedText17,"Telefone",NULL_STRING,NULL_STRING}

oDCDDD1 := SingleLineEdit{self,ResourceID{JFOR_DDD1,_GetInst()}}
oDCDDD1:FieldSpec := padrao_char_03{}
oDCDDD1:HyperLabel := HyperLabel{#DDD1,"Ddd1:",NULL_STRING,"MB01_DDD1"}
oDCDDD1:TooltipText := "DDD"

oDCTELEFONE1 := SingleLineEdit{self,ResourceID{JFOR_TELEFONE1,_GetInst()}}
oDCTELEFONE1:FieldSpec := padrao_char_12{}
oDCTELEFONE1:HyperLabel := HyperLabel{#TELEFONE1,"Telefone1:",NULL_STRING,"MB01_TELEFONE1"}
oDCTELEFONE1:TooltipText := "Telefone"

oDCRAMAL1 := SingleLineEdit{self,ResourceID{JFOR_RAMAL1,_GetInst()}}
oDCRAMAL1:FieldSpec := padrao_char_04{}
oDCRAMAL1:HyperLabel := HyperLabel{#RAMAL1,"Ramal1:",NULL_STRING,"MB01_RAMAL1"}
oDCRAMAL1:TooltipText := "Ramal"

oDCCONTATO1 := SingleLineEdit{self,ResourceID{JFOR_CONTATO1,_GetInst()}}
oDCCONTATO1:FieldSpec := padrao_char_22{}
oDCCONTATO1:HyperLabel := HyperLabel{#CONTATO1,"Contato1:",NULL_STRING,"MB01_CONTATO1"}
oDCCONTATO1:TooltipText := "Contato"

oDCtheFixedText18 := FixedText{self,ResourceID{JFOR_THEFIXEDTEXT18,_GetInst()}}
oDCtheFixedText18:HyperLabel := HyperLabel{#theFixedText18,"Fax:",NULL_STRING,NULL_STRING}

oDCDDDFAX := SingleLineEdit{self,ResourceID{JFOR_DDDFAX,_GetInst()}}
oDCDDDFAX:FieldSpec := padrao_char_03{}
oDCDDDFAX:HyperLabel := HyperLabel{#DDDFAX,"Dddfax:",NULL_STRING,"MB01_DDDFAX"}
oDCDDDFAX:TooltipText := "Fax"

oDCTELEFAX := SingleLineEdit{self,ResourceID{JFOR_TELEFAX,_GetInst()}}
oDCTELEFAX:FieldSpec := padrao_char_12{}
oDCTELEFAX:HyperLabel := HyperLabel{#TELEFAX,"Telefax:",NULL_STRING,"MB01_TELEFAX"}
oDCTELEFAX:TooltipText := "Numero do Fax"

oDCft20 := FixedText{self,ResourceID{JFOR_FT20,_GetInst()}}
oDCft20:HyperLabel := HyperLabel{#ft20,"Email",NULL_STRING,NULL_STRING}

oDCEMAIL := SingleLineEdit{self,ResourceID{JFOR_EMAIL,_GetInst()}}
oDCEMAIL:FieldSpec := EMAIL_FIELD{}
oDCEMAIL:HyperLabel := HyperLabel{#EMAIL,NULL_STRING,NULL_STRING,NULL_STRING}
oDCEMAIL:TooltipText := "Email"

oDCFT21 := FixedText{self,ResourceID{JFOR_FT21,_GetInst()}}
oDCFT21:HyperLabel := HyperLabel{#FT21,"Site",NULL_STRING,NULL_STRING}

oDCSITE := SingleLineEdit{self,ResourceID{JFOR_SITE,_GetInst()}}
oDCSITE:FieldSpec := padrao_char_30{}
oDCSITE:HyperLabel := HyperLabel{#SITE,NULL_STRING,NULL_STRING,NULL_STRING}
oDCSITE:TooltipText := "Site"

oDCFT22 := FixedText{self,ResourceID{JFOR_FT22,_GetInst()}}
oDCFT22:HyperLabel := HyperLabel{#FT22,"Responsável",NULL_STRING,NULL_STRING}

oDCRESPF := SingleLineEdit{self,ResourceID{JFOR_RESPF,_GetInst()}}
oDCRESPF:FieldSpec := padrao_char_30{}
oDCRESPF:HyperLabel := HyperLabel{#RESPF,NULL_STRING,NULL_STRING,NULL_STRING}
oDCRESPF:TooltipText := "Nome do Responsavel"

oDCFT23 := FixedText{self,ResourceID{JFOR_FT23,_GetInst()}}
oDCFT23:HyperLabel := HyperLabel{#FT23,"Cargo do Responsável",NULL_STRING,NULL_STRING}

oDCCARGOR := SingleLineEdit{self,ResourceID{JFOR_CARGOR,_GetInst()}}
oDCCARGOR:FieldSpec := PADRAO_CHAR_30{}
oDCCARGOR:HyperLabel := HyperLabel{#CARGOR,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCARGOR:TooltipText := "Funçao do Responsavel"

self:Caption := "Cadastro de Fornecedores"
self:HyperLabel := HyperLabel{#JFOR,"Cadastro de Fornecedores",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 14
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBCOGNOME := DataColumn{padrao_char_15{}}
oDBCOGNOME:Width := 18
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
self:Browser:AddColumn(oDBCOGNOME)

oDBNOME := DataColumn{PADRAO_CHAR_40{}}
oDBNOME:Width := 51
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


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


access TELEFAX() 
return self:FieldGet(#TELEFAX)


assign TELEFAX(uValue) 
self:FieldPut(#TELEFAX, uValue)
return TELEFAX := uValue


access TELEFONE() 
return self:FieldGet(#TELEFONE)


assign TELEFONE(uValue) 
self:FieldPut(#TELEFONE, uValue)
return TELEFONE := uValue


access TELEFONE1() 
return self:FieldGet(#TELEFONE1)


assign TELEFONE1(uValue) 
self:FieldPut(#TELEFONE1, uValue)
return TELEFONE1 := uValue


METHOD Timer() 
   SELF:SERVER:COMMIT()

ACCESS VENDEDOR() 
RETURN self:FieldGet(#VENDEDOR)


END CLASS
