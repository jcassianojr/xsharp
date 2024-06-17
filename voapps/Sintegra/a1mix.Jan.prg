#region DEFINES
STATIC DEFINE A1MIX_A1_BAIRRO := 130 
STATIC DEFINE A1MIX_A1_CEP := 136 
STATIC DEFINE A1MIX_A1_CGC := 105 
STATIC DEFINE A1MIX_A1_COD := 120 
STATIC DEFINE A1MIX_A1_CONTATO := 143 
STATIC DEFINE A1MIX_A1_END := 128 
STATIC DEFINE A1MIX_A1_EST := 132 
STATIC DEFINE A1MIX_A1_FAX := 150 
STATIC DEFINE A1MIX_A1_INSCR := 106 
STATIC DEFINE A1MIX_A1_MUN := 134 
STATIC DEFINE A1MIX_A1_NOME := 126 
STATIC DEFINE A1MIX_A1_NREDUZ := 121 
STATIC DEFINE A1MIX_A1_TEL := 141 
STATIC DEFINE A1MIX_BUSCANUM := 101 
STATIC DEFINE A1MIX_CMDCHECKCGC := 113 
STATIC DEFINE A1MIX_CMDCHECKIE := 112 
STATIC DEFINE A1MIX_CMDCHECKUF := 114 
STATIC DEFINE A1MIX_CMDPESSOA := 111 
STATIC DEFINE A1MIX_CODIGO := 103 
STATIC DEFINE A1MIX_COMPRADOR := 123 
STATIC DEFINE A1MIX_CONTATO1 := 147 
STATIC DEFINE A1MIX_DDD := 140 
STATIC DEFINE A1MIX_DDD1 := 144 
STATIC DEFINE A1MIX_DDDFAX := 149 
STATIC DEFINE A1MIX_FT15 := 119 
STATIC DEFINE A1MIX_FT16 := 104 
STATIC DEFINE A1MIX_PESSOA := 110 
STATIC DEFINE A1MIX_PORNUM := 100 
STATIC DEFINE A1MIX_RAMAL := 142 
STATIC DEFINE A1MIX_RAMAL1 := 146 
STATIC DEFINE A1MIX_SC_BAIRRO := 129 
STATIC DEFINE A1MIX_SC_CEP := 135 
STATIC DEFINE A1MIX_SC_CIDADE := 133 
STATIC DEFINE A1MIX_SC_COGNOME := 116 
STATIC DEFINE A1MIX_SC_COMPRADOR := 118 
STATIC DEFINE A1MIX_SC_CONTATO := 139 
STATIC DEFINE a1mix_SC_CONTATO1 := 130
STATIC DEFINE a1mix_SC_DDD1 := 124
STATIC DEFINE a1mix_SC_DDDFAX := 136
STATIC DEFINE A1MIX_SC_ENDERECO := 127 
STATIC DEFINE A1MIX_SC_ESTADO := 131 
STATIC DEFINE A1MIX_SC_NOME := 125 
STATIC DEFINE A1MIX_SC_NUMERO := 115 
STATIC DEFINE A1MIX_SC_RAMAL := 138 
STATIC DEFINE a1mix_SC_RAMAL1 := 128
STATIC DEFINE A1MIX_SC_TELEFAX := 148 
STATIC DEFINE A1MIX_SC_TELEFAX1 := 102 
STATIC DEFINE A1MIX_SC_TELEFAX2 := 107 
STATIC DEFINE A1MIX_SC_TELEFAX3 := 108 
STATIC DEFINE A1MIX_SC_TELEFAX4 := 109 
STATIC DEFINE A1MIX_SC_TELEFONE := 137 
STATIC DEFINE a1mix_SC_TELEFONE1 := 126
STATIC DEFINE A1MIX_SC_ZONA := 117 
STATIC DEFINE A1MIX_TELEFONE1 := 145 
STATIC DEFINE A1MIX_VENDEDOR := 124 
STATIC DEFINE A1MIX_ZONA := 122 
#endregion

class a1mix inherit MYDataWindow 

	PROTECT oDBA1_COD as DataColumn
	PROTECT oDBA1_NREDUZ as DataColumn
	PROTECT oDBA1_NOME as DataColumn
	PROTECT oDBDDD as DataColumn
	PROTECT oDBA1_TEL as DataColumn
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oDCSC_TELEFAX1 as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCFT16 as FIXEDTEXT
	protect oDCA1_CGC as SINGLELINEEDIT
	protect oDCA1_INSCR as SINGLELINEEDIT
	protect oDCSC_TELEFAX2 as FIXEDTEXT
	protect oDCSC_TELEFAX3 as FIXEDTEXT
	protect oDCSC_TELEFAX4 as FIXEDTEXT
	protect oDCpessoa as SINGLELINEEDIT
	protect oCCcmdpessoa as PUSHBUTTON
	protect oCCcmdcheckie as PUSHBUTTON
	protect oCCcmdcheckcgc as PUSHBUTTON
	protect oCCCMDCHECKUF as PUSHBUTTON
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCSC_ZONA as FIXEDTEXT
	protect oDCSC_COMPRADOR as FIXEDTEXT
	protect oDCFT15 as FIXEDTEXT
	protect oDCA1_COD as SINGLELINEEDIT
	protect oDCA1_NREDUZ as SINGLELINEEDIT
	protect oDCZONA as SINGLELINEEDIT
	protect oDCCOMPRADOR as SINGLELINEEDIT
	protect oDCVENDEDOR as SINGLELINEEDIT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCa1_NOME as SINGLELINEEDIT
	protect oDCSC_ENDERECO as FIXEDTEXT
	protect oDCA1_END as SINGLELINEEDIT
	protect oDCSC_BAIRRO as FIXEDTEXT
	protect oDCA1_BAIRRO as SINGLELINEEDIT
	protect oDCSC_ESTADO as FIXEDTEXT
	protect oDCA1_EST as SINGLELINEEDIT
	protect oDCSC_CIDADE as FIXEDTEXT
	protect oDCA1_MUN as SINGLELINEEDIT
	protect oDCSC_CEP as FIXEDTEXT
	protect oDCA1_CEP as SINGLELINEEDIT
	protect oDCSC_TELEFONE as FIXEDTEXT
	protect oDCSC_RAMAL as FIXEDTEXT
	protect oDCSC_CONTATO as FIXEDTEXT
	protect oDCDDD as SINGLELINEEDIT
	protect oDCA1_TEL as SINGLELINEEDIT
	protect oDCRAMAL as SINGLELINEEDIT
	protect oDCA1_CONTATO as SINGLELINEEDIT
	protect oDCDDD1 as SINGLELINEEDIT
	protect oDCTELEFONE1 as SINGLELINEEDIT
	protect oDCRAMAL1 as SINGLELINEEDIT
	protect oDCCONTATO1 as SINGLELINEEDIT
	protect oDCSC_TELEFAX as FIXEDTEXT
	protect oDCDDDFAX as SINGLELINEEDIT
	protect oDCA1_FAX as SINGLELINEEDIT
// 	instance CODIGO 
// 	instance A1_CGC 
// 	instance A1_INSCR 
// 	instance pessoa 
// 	instance A1_COD 
// 	instance A1_NREDUZ 
// 	instance ZONA 
// 	instance COMPRADOR 
// 	instance VENDEDOR 
// 	instance a1_NOME 
// 	instance A1_END 
// 	instance A1_BAIRRO 
// 	instance A1_EST 
// 	instance A1_MUN 
// 	instance A1_CEP 
// 	instance DDD 
// 	instance A1_TEL 
// 	instance RAMAL 
// 	instance A1_CONTATO 
// 	instance DDD1 
// 	instance TELEFONE1 
// 	instance RAMAL1 
// 	instance CONTATO1 
// 	instance DDDFAX 
// 	instance A1_FAX 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access A1_BAIRRO() 
return self:FieldGet(#A1_BAIRRO)


assign A1_BAIRRO(uValue) 
self:FieldPut(#A1_BAIRRO, uValue)
return A1_BAIRRO := uValue


access A1_CEP() 
return self:FieldGet(#A1_CEP)


assign A1_CEP(uValue) 
self:FieldPut(#A1_CEP, uValue)
return A1_CEP := uValue


access A1_CGC() 
return self:FieldGet(#A1_CGC)


assign A1_CGC(uValue) 
self:FieldPut(#A1_CGC, uValue)
return A1_CGC := uValue


access A1_COD() 
return self:FieldGet(#A1_COD)


assign A1_COD(uValue) 
self:FieldPut(#A1_COD, uValue)
return A1_COD := uValue


access A1_CONTATO() 
return self:FieldGet(#A1_CONTATO)


assign A1_CONTATO(uValue) 
self:FieldPut(#A1_CONTATO, uValue)
return A1_CONTATO := uValue


access A1_END() 
return self:FieldGet(#A1_END)


assign A1_END(uValue) 
self:FieldPut(#A1_END, uValue)
return A1_END := uValue


access A1_EST() 
return self:FieldGet(#A1_EST)


assign A1_EST(uValue) 
self:FieldPut(#A1_EST, uValue)
return A1_EST := uValue


access A1_FAX() 
return self:FieldGet(#A1_FAX)


assign A1_FAX(uValue) 
self:FieldPut(#A1_FAX, uValue)
return A1_FAX := uValue


access A1_INSCR() 
return self:FieldGet(#A1_INSCR)


assign A1_INSCR(uValue) 
self:FieldPut(#A1_INSCR, uValue)
return A1_INSCR := uValue


access A1_MUN() 
return self:FieldGet(#A1_MUN)


assign A1_MUN(uValue) 
self:FieldPut(#A1_MUN, uValue)
return A1_MUN := uValue


access a1_NOME() 
return self:FieldGet(#a1_NOME)


assign a1_NOME(uValue) 
self:FieldPut(#a1_NOME, uValue)
return a1_NOME := uValue


access A1_NREDUZ() 
return self:FieldGet(#A1_NREDUZ)


assign A1_NREDUZ(uValue) 
self:FieldPut(#A1_NREDUZ, uValue)
return A1_NREDUZ := uValue


access A1_TEL() 
return self:FieldGet(#A1_TEL)


assign A1_TEL(uValue) 
self:FieldPut(#A1_TEL, uValue)
return A1_TEL := uValue


METHOD APPEND() 
 alert("inclusao bloqueada"	)

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

METHOD cmdcheckcgc( ) 
LOCAL cPESSOA AS STRING	
CPESSOA:=sempessoa(SELF:SERVER:FIELDGET("A1_CGC"))
IF cPESSOA="J"
   IF VALCGC(SELF:SERVER:FIELDGET("A1_CGC"))
   	  alert("CGC OK")
   ENDIF	
ENDIF	
IF cPESSOA="F"
   IF Valcpf(SELF:SERVER:FIELDGET("A1_CGC"))
   	  alert("CPF OK")
   ENDIF		
ENDIF	

METHOD cmdcheckie( ) 
LOCAL cPESSOA AS STRING	
CPESSOA:=sempessoa(SELF:SERVER:FIELDGET("A1_CGC"))
IF cPESSOA="J"
   ValIE(SELF:SERVER:FIELDGET("A1_EST"),SELF:SERVER:FIELDGET("A1_INSCR"))
ENDIF	
IF cPESSOA="F"
   IF CheckRG(SELF:SERVER:FIELDGET("A1_INSCR"))
   	  alert("RG OK")
   ENDIF		
ENDIF		

METHOD CMDCHECKUF( ) 
	ufCheck(SELF:SERVER:FIELDGET("A1_EST"))

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD cmdpessoa( ) 
	SELF:server:FIELDPUT("PESSOA",SIMNAO(SELF:SERVER:FIELDGET("PESSOA"),{"J","F","O"}))

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access COMPRADOR() 
return self:FieldGet(#COMPRADOR)


assign COMPRADOR(uValue) 
self:FieldPut(#COMPRADOR, uValue)
return COMPRADOR := uValue


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
 alert("exclusao bloqueada"	)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"a1mix",_GetInst()},iCtlID)

oCCpornum := PushButton{self,ResourceID{A1MIX_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

oCCbuscanum := PushButton{self,ResourceID{A1MIX_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Clique Para Localizar Por Numero"

oDCSC_TELEFAX1 := FixedText{self,ResourceID{A1MIX_SC_TELEFAX1,_GetInst()}}
oDCSC_TELEFAX1:HyperLabel := HyperLabel{#SC_TELEFAX1,"DDD",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{A1MIX_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_15{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Cognome:",NULL_STRING,"MA01_CODIGO"}
oDCCODIGO:TooltipText := "Codigo Junto ao Cliente"

oDCFT16 := FixedText{self,ResourceID{A1MIX_FT16,_GetInst()}}
oDCFT16:HyperLabel := HyperLabel{#FT16,"Codigo Junto ao Cliente",NULL_STRING,NULL_STRING}

oDCA1_CGC := SingleLineEdit{self,ResourceID{A1MIX_A1_CGC,_GetInst()}}
oDCA1_CGC:FieldSpec := padrao_char_18{}
oDCA1_CGC:HyperLabel := HyperLabel{#A1_CGC,NULL_STRING,NULL_STRING,"MA01_CODIGO"}
oDCA1_CGC:TooltipText := "Codigo Junto ao Cliente"

oDCA1_INSCR := SingleLineEdit{self,ResourceID{A1MIX_A1_INSCR,_GetInst()}}
oDCA1_INSCR:FieldSpec := padrao_char_16{}
oDCA1_INSCR:HyperLabel := HyperLabel{#A1_INSCR,NULL_STRING,NULL_STRING,"MA01_CODIGO"}
oDCA1_INSCR:TooltipText := "Codigo Junto ao Cliente"

oDCSC_TELEFAX2 := FixedText{self,ResourceID{A1MIX_SC_TELEFAX2,_GetInst()}}
oDCSC_TELEFAX2:HyperLabel := HyperLabel{#SC_TELEFAX2,"CGC/CPF",NULL_STRING,NULL_STRING}

oDCSC_TELEFAX3 := FixedText{self,ResourceID{A1MIX_SC_TELEFAX3,_GetInst()}}
oDCSC_TELEFAX3:HyperLabel := HyperLabel{#SC_TELEFAX3,"IE/RG",NULL_STRING,NULL_STRING}

oDCSC_TELEFAX4 := FixedText{self,ResourceID{A1MIX_SC_TELEFAX4,_GetInst()}}
oDCSC_TELEFAX4:HyperLabel := HyperLabel{#SC_TELEFAX4,"Pessoa",NULL_STRING,NULL_STRING}

oDCpessoa := SingleLineEdit{self,ResourceID{A1MIX_PESSOA,_GetInst()}}
oDCpessoa:FieldSpec := padrao_char_01{}
oDCpessoa:HyperLabel := HyperLabel{#pessoa,NULL_STRING,NULL_STRING,"MA01_NUMERO"}
oDCpessoa:TooltipText := "Estado"

oCCcmdpessoa := PushButton{self,ResourceID{A1MIX_CMDPESSOA,_GetInst()}}
oCCcmdpessoa:HyperLabel := HyperLabel{#cmdpessoa,"FJO",NULL_STRING,NULL_STRING}

oCCcmdcheckie := PushButton{self,ResourceID{A1MIX_CMDCHECKIE,_GetInst()}}
oCCcmdcheckie:HyperLabel := HyperLabel{#cmdcheckie,"Checar",NULL_STRING,NULL_STRING}

oCCcmdcheckcgc := PushButton{self,ResourceID{A1MIX_CMDCHECKCGC,_GetInst()}}
oCCcmdcheckcgc:HyperLabel := HyperLabel{#cmdcheckcgc,"Checar",NULL_STRING,NULL_STRING}

oCCCMDCHECKUF := PushButton{self,ResourceID{A1MIX_CMDCHECKUF,_GetInst()}}
oCCCMDCHECKUF:HyperLabel := HyperLabel{#CMDCHECKUF,"Checar",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{A1MIX_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{self,ResourceID{A1MIX_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCSC_ZONA := FixedText{self,ResourceID{A1MIX_SC_ZONA,_GetInst()}}
oDCSC_ZONA:HyperLabel := HyperLabel{#SC_ZONA,"Zona:",NULL_STRING,NULL_STRING}

oDCSC_COMPRADOR := FixedText{self,ResourceID{A1MIX_SC_COMPRADOR,_GetInst()}}
oDCSC_COMPRADOR:HyperLabel := HyperLabel{#SC_COMPRADOR,"Comprador:",NULL_STRING,NULL_STRING}

oDCFT15 := FixedText{self,ResourceID{A1MIX_FT15,_GetInst()}}
oDCFT15:HyperLabel := HyperLabel{#FT15,"Vendedor",NULL_STRING,NULL_STRING}

oDCA1_COD := SingleLineEdit{self,ResourceID{A1MIX_A1_COD,_GetInst()}}
oDCA1_COD:FieldSpec := PADRAO_char_06{}
oDCA1_COD:HyperLabel := HyperLabel{#A1_COD,"Numero:",NULL_STRING,"MA01_NUMERO"}
oDCA1_COD:TooltipText := "Numero de Cadastramento"

oDCA1_NREDUZ := SingleLineEdit{self,ResourceID{A1MIX_A1_NREDUZ,_GetInst()}}
oDCA1_NREDUZ:FieldSpec := padrao_char_20{}
oDCA1_NREDUZ:HyperLabel := HyperLabel{#A1_NREDUZ,"Cognome:",NULL_STRING,"MA01_COGNOME"}
oDCA1_NREDUZ:TooltipText := "Cognome"

oDCZONA := SingleLineEdit{self,ResourceID{A1MIX_ZONA,_GetInst()}}
oDCZONA:FieldSpec := padrao_char_06{}
oDCZONA:HyperLabel := HyperLabel{#ZONA,"Cognome:",NULL_STRING,"MA01_COGNOME"}
oDCZONA:TooltipText := "Zona de Vensas"

oDCCOMPRADOR := SingleLineEdit{self,ResourceID{A1MIX_COMPRADOR,_GetInst()}}
oDCCOMPRADOR:FieldSpec := padrao_char_05{}
oDCCOMPRADOR:HyperLabel := HyperLabel{#COMPRADOR,"Cognome:",NULL_STRING,"MA01_COGNOME"}
oDCCOMPRADOR:TooltipText := "Codigo do Comprador"

oDCVENDEDOR := SingleLineEdit{self,ResourceID{A1MIX_VENDEDOR,_GetInst()}}
oDCVENDEDOR:FieldSpec := padrao_char_05{}
oDCVENDEDOR:HyperLabel := HyperLabel{#VENDEDOR,"Cognome:",NULL_STRING,"MA01_COGNOME"}
oDCVENDEDOR:TooltipText := "Codigo do Vendedor"

oDCSC_NOME := FixedText{self,ResourceID{A1MIX_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCa1_NOME := SingleLineEdit{self,ResourceID{A1MIX_A1_NOME,_GetInst()}}
oDCa1_NOME:FieldSpec := padrao_char_50{}
oDCa1_NOME:HyperLabel := HyperLabel{#a1_NOME,"Nome:",NULL_STRING,"MA01_NOME"}
oDCa1_NOME:TooltipText := "Razao Socail"

oDCSC_ENDERECO := FixedText{self,ResourceID{A1MIX_SC_ENDERECO,_GetInst()}}
oDCSC_ENDERECO:HyperLabel := HyperLabel{#SC_ENDERECO,"Endereço:",NULL_STRING,NULL_STRING}

oDCA1_END := SingleLineEdit{self,ResourceID{A1MIX_A1_END,_GetInst()}}
oDCA1_END:FieldSpec := padrao_char_40{}
oDCA1_END:HyperLabel := HyperLabel{#A1_END,"Endereco:",NULL_STRING,"MA01_ENDERECO"}
oDCA1_END:TooltipText := "Endereço"

oDCSC_BAIRRO := FixedText{self,ResourceID{A1MIX_SC_BAIRRO,_GetInst()}}
oDCSC_BAIRRO:HyperLabel := HyperLabel{#SC_BAIRRO,"Bairro:",NULL_STRING,NULL_STRING}

oDCA1_BAIRRO := SingleLineEdit{self,ResourceID{A1MIX_A1_BAIRRO,_GetInst()}}
oDCA1_BAIRRO:FieldSpec := padrao_char_30{}
oDCA1_BAIRRO:HyperLabel := HyperLabel{#A1_BAIRRO,"Bairro:",NULL_STRING,"MA01_BAIRRO"}
oDCA1_BAIRRO:TooltipText := "Bairro"

oDCSC_ESTADO := FixedText{self,ResourceID{A1MIX_SC_ESTADO,_GetInst()}}
oDCSC_ESTADO:HyperLabel := HyperLabel{#SC_ESTADO,"Estado:",NULL_STRING,NULL_STRING}

oDCA1_EST := SingleLineEdit{self,ResourceID{A1MIX_A1_EST,_GetInst()}}
oDCA1_EST:FieldSpec := uf_field{}
oDCA1_EST:HyperLabel := HyperLabel{#A1_EST,"Numero:",NULL_STRING,"MA01_NUMERO"}
oDCA1_EST:TooltipText := "Digite  o Estado"

oDCSC_CIDADE := FixedText{self,ResourceID{A1MIX_SC_CIDADE,_GetInst()}}
oDCSC_CIDADE:HyperLabel := HyperLabel{#SC_CIDADE,"Cidade:",NULL_STRING,NULL_STRING}

oDCA1_MUN := SingleLineEdit{self,ResourceID{A1MIX_A1_MUN,_GetInst()}}
oDCA1_MUN:FieldSpec := padrao_char_30{}
oDCA1_MUN:HyperLabel := HyperLabel{#A1_MUN,"Cidade:",NULL_STRING,"MA01_CIDADE"}
oDCA1_MUN:TooltipText := "Cidade"

oDCSC_CEP := FixedText{self,ResourceID{A1MIX_SC_CEP,_GetInst()}}
oDCSC_CEP:HyperLabel := HyperLabel{#SC_CEP,"Cep:",NULL_STRING,NULL_STRING}

oDCA1_CEP := SingleLineEdit{self,ResourceID{A1MIX_A1_CEP,_GetInst()}}
oDCA1_CEP:FieldSpec := padrao_char_09{}
oDCA1_CEP:HyperLabel := HyperLabel{#A1_CEP,"Cep:",NULL_STRING,"MA01_CEP"}
oDCA1_CEP:TooltipText := "CEP"

oDCSC_TELEFONE := FixedText{self,ResourceID{A1MIX_SC_TELEFONE,_GetInst()}}
oDCSC_TELEFONE:HyperLabel := HyperLabel{#SC_TELEFONE,"Telefone:",NULL_STRING,NULL_STRING}

oDCSC_RAMAL := FixedText{self,ResourceID{A1MIX_SC_RAMAL,_GetInst()}}
oDCSC_RAMAL:HyperLabel := HyperLabel{#SC_RAMAL,"Ramal:",NULL_STRING,NULL_STRING}

oDCSC_CONTATO := FixedText{self,ResourceID{A1MIX_SC_CONTATO,_GetInst()}}
oDCSC_CONTATO:HyperLabel := HyperLabel{#SC_CONTATO,"Contato:",NULL_STRING,NULL_STRING}

oDCDDD := SingleLineEdit{self,ResourceID{A1MIX_DDD,_GetInst()}}
oDCDDD:FieldSpec := padrao_char_03{}
oDCDDD:HyperLabel := HyperLabel{#DDD,"Ddd:",NULL_STRING,"MA01_DDD"}
oDCDDD:TooltipText := "Codigo DDD"

oDCA1_TEL := SingleLineEdit{self,ResourceID{A1MIX_A1_TEL,_GetInst()}}
oDCA1_TEL:FieldSpec := padrao_char_15{}
oDCA1_TEL:HyperLabel := HyperLabel{#A1_TEL,"Telefone:",NULL_STRING,"MA01_TELEFONE"}
oDCA1_TEL:TooltipText := "Numero do Telefone"

oDCRAMAL := SingleLineEdit{self,ResourceID{A1MIX_RAMAL,_GetInst()}}
oDCRAMAL:FieldSpec := padrao_char_04{}
oDCRAMAL:HyperLabel := HyperLabel{#RAMAL,"Ramal:",NULL_STRING,"MA01_RAMAL"}
oDCRAMAL:TooltipText := "Ramal"

oDCA1_CONTATO := SingleLineEdit{self,ResourceID{A1MIX_A1_CONTATO,_GetInst()}}
oDCA1_CONTATO:FieldSpec := padrao_char_22{}
oDCA1_CONTATO:HyperLabel := HyperLabel{#A1_CONTATO,"Contato:",NULL_STRING,"MA01_CONTATO"}
oDCA1_CONTATO:TooltipText := "Nome do Contato"

oDCDDD1 := SingleLineEdit{self,ResourceID{A1MIX_DDD1,_GetInst()}}
oDCDDD1:FieldSpec := padrao_char_03{}
oDCDDD1:HyperLabel := HyperLabel{#DDD1,"Ddd1:",NULL_STRING,"MA01_DDD1"}
oDCDDD1:TooltipText := "Codigo DDD"

oDCTELEFONE1 := SingleLineEdit{self,ResourceID{A1MIX_TELEFONE1,_GetInst()}}
oDCTELEFONE1:FieldSpec := padrao_char_09{}
oDCTELEFONE1:HyperLabel := HyperLabel{#TELEFONE1,"Telefone1:",NULL_STRING,"MA01_TELEFONE1"}
oDCTELEFONE1:TooltipText := "Numero do Telefone"

oDCRAMAL1 := SingleLineEdit{self,ResourceID{A1MIX_RAMAL1,_GetInst()}}
oDCRAMAL1:FieldSpec := padrao_char_04{}
oDCRAMAL1:HyperLabel := HyperLabel{#RAMAL1,"Ramal1:",NULL_STRING,"MA01_RAMAL1"}
oDCRAMAL1:TooltipText := "Ramal"

oDCCONTATO1 := SingleLineEdit{self,ResourceID{A1MIX_CONTATO1,_GetInst()}}
oDCCONTATO1:FieldSpec := padrao_char_22{}
oDCCONTATO1:HyperLabel := HyperLabel{#CONTATO1,"Contato1:",NULL_STRING,"MA01_CONTATO1"}
oDCCONTATO1:TooltipText := "Nome do Contato"

oDCSC_TELEFAX := FixedText{self,ResourceID{A1MIX_SC_TELEFAX,_GetInst()}}
oDCSC_TELEFAX:HyperLabel := HyperLabel{#SC_TELEFAX,"Telefax:",NULL_STRING,NULL_STRING}

oDCDDDFAX := SingleLineEdit{self,ResourceID{A1MIX_DDDFAX,_GetInst()}}
oDCDDDFAX:FieldSpec := padrao_char_03{}
oDCDDDFAX:HyperLabel := HyperLabel{#DDDFAX,"Dddfax:",NULL_STRING,"MA01_DDDFAX"}
oDCDDDFAX:TooltipText := "Codigo DDD"

oDCA1_FAX := SingleLineEdit{self,ResourceID{A1MIX_A1_FAX,_GetInst()}}
oDCA1_FAX:FieldSpec := padrao_char_15{}
oDCA1_FAX:HyperLabel := HyperLabel{#A1_FAX,"Telefax:",NULL_STRING,"MA01_TELEFAX"}
oDCA1_FAX:TooltipText := "Numero do Fax"

self:Caption := "Cadastro de Clientes"
self:HyperLabel := HyperLabel{#a1mix,"Cadastro de Clientes",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBA1_COD := DataColumn{PADRAO_char_06{}}
oDBA1_COD:Width := 11
oDBA1_COD:HyperLabel := oDCA1_COD:HyperLabel 
oDBA1_COD:Caption := "Numero:"
self:Browser:AddColumn(oDBA1_COD)

oDBA1_NREDUZ := DataColumn{padrao_char_20{}}
oDBA1_NREDUZ:Width := 17
oDBA1_NREDUZ:HyperLabel := oDCA1_NREDUZ:HyperLabel 
oDBA1_NREDUZ:Caption := "Cognome:"
self:Browser:AddColumn(oDBA1_NREDUZ)

oDBA1_NOME := DataColumn{padrao_char_50{}}
oDBA1_NOME:Width := 26
oDBA1_NOME:HyperLabel := oDCA1_NOME:HyperLabel 
oDBA1_NOME:Caption := "Nome:"
self:Browser:AddColumn(oDBA1_NOME)

oDBDDD := DataColumn{padrao_char_03{}}
oDBDDD:Width := 6
oDBDDD:HyperLabel := oDCDDD:HyperLabel 
oDBDDD:Caption := "Ddd:"
self:Browser:AddColumn(oDBDDD)

oDBA1_TEL := DataColumn{padrao_char_15{}}
oDBA1_TEL:Width := 10
oDBA1_TEL:HyperLabel := oDCA1_TEL:HyperLabel 
oDBA1_TEL:Caption := "Telefone:"
self:Browser:AddColumn(oDBA1_TEL)


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


access TELEFONE1() 
return self:FieldGet(#TELEFONE1)


assign TELEFONE1(uValue) 
self:FieldPut(#TELEFONE1, uValue)
return TELEFONE1 := uValue


METHOD Timer() 
   SELF:SERVER:COMMIT()

access VENDEDOR() 
return self:FieldGet(#VENDEDOR)


assign VENDEDOR(uValue) 
self:FieldPut(#VENDEDOR, uValue)
return VENDEDOR := uValue


access ZONA() 
return self:FieldGet(#ZONA)


assign ZONA(uValue) 
self:FieldPut(#ZONA, uValue)
return ZONA := uValue


END CLASS
