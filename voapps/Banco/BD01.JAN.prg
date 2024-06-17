#region DEFINES
STATIC DEFINE JBD01_BAIRRO := 103 
STATIC DEFINE JBD01_BUSCANUM := 138 
STATIC DEFINE JBD01_CEP := 106 
STATIC DEFINE JBD01_CIDADE := 105 
STATIC DEFINE JBD01_COGNOME := 100 
STATIC DEFINE JBD01_CONTATO := 110 
STATIC DEFINE JBD01_CONTATO1 := 114 
STATIC DEFINE JBD01_DDD := 107 
STATIC DEFINE JBD01_DDD1 := 111 
STATIC DEFINE JBD01_DDDFAX := 115 
STATIC DEFINE JBD01_EMAIL := 117 
STATIC DEFINE JBD01_ENDERECO := 102 
STATIC DEFINE JBD01_ESTADO := 104 
STATIC DEFINE JBD01_FT20 := 135 
STATIC DEFINE JBD01_FT21 := 136 
STATIC DEFINE JBD01_JBF01 := 139 
STATIC DEFINE JBD01_NOME := 101 
STATIC DEFINE JBD01_NUMERO := 121 
STATIC DEFINE JBD01_PORNUM := 137 
STATIC DEFINE JBD01_RAMAL := 109 
STATIC DEFINE JBD01_RAMAL1 := 113 
STATIC DEFINE JBD01_SC_BAIRRO := 124 
STATIC DEFINE JBD01_SC_CEP := 127 
STATIC DEFINE JBD01_SC_CIDADE := 125 
STATIC DEFINE JBD01_SC_COGNOME := 119 
STATIC DEFINE JBD01_SC_CONTATO := 131 
STATIC DEFINE JBD01_SC_DDD := 128 
STATIC DEFINE JBD01_SC_ENDERECO := 123 
STATIC DEFINE JBD01_SC_ESTADO := 126 
STATIC DEFINE JBD01_SC_NOME := 122 
STATIC DEFINE JBD01_SC_NUMERO := 120 
STATIC DEFINE JBD01_SC_RAMAL := 130 
STATIC DEFINE JBD01_SC_TELEFONE := 129 
STATIC DEFINE JBD01_SITE := 118 
STATIC DEFINE JBD01_TELEFAX := 116 
STATIC DEFINE JBD01_TELEFONE := 108 
STATIC DEFINE JBD01_TELEFONE1 := 112 
STATIC DEFINE JBD01_THEFIXEDTEXT16 := 132 
STATIC DEFINE JBD01_THEFIXEDTEXT17 := 133 
STATIC DEFINE JBD01_THEFIXEDTEXT18 := 134 
#endregion

class JBD01 inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBEMAIL as DataColumn
	PROTECT oDBDDD as DataColumn
	PROTECT oDBTELEFONE as DataColumn
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCENDERECO as SINGLELINEEDIT
	protect oDCBAIRRO as SINGLELINEEDIT
	protect oDCESTADO as SINGLELINEEDIT
	protect oDCCIDADE as SINGLELINEEDIT
	protect oDCCEP as SINGLELINEEDIT
	protect oDCDDD as RIGHTSLE
	protect oDCTELEFONE as RIGHTSLE
	protect oDCRAMAL as SINGLELINEEDIT
	protect oDCCONTATO as SINGLELINEEDIT
	protect oDCDDD1 as RIGHTSLE
	protect oDCTELEFONE1 as RIGHTSLE
	protect oDCRAMAL1 as SINGLELINEEDIT
	protect oDCCONTATO1 as SINGLELINEEDIT
	protect oDCDDDFAX as RIGHTSLE
	protect oDCTELEFAX as RIGHTSLE
	protect oDCEMAIL as SINGLELINEEDIT
	protect oDCSITE as SINGLELINEEDIT
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_ENDERECO as FIXEDTEXT
	protect oDCSC_BAIRRO as FIXEDTEXT
	protect oDCSC_CIDADE as FIXEDTEXT
	protect oDCSC_ESTADO as FIXEDTEXT
	protect oDCSC_CEP as FIXEDTEXT
	protect oDCSC_DDD as FIXEDTEXT
	protect oDCSC_TELEFONE as FIXEDTEXT
	protect oDCSC_RAMAL as FIXEDTEXT
	protect oDCSC_CONTATO as FIXEDTEXT
	protect oDCtheFixedText16 as FIXEDTEXT
	protect oDCtheFixedText17 as FIXEDTEXT
	protect oDCtheFixedText18 as FIXEDTEXT
	protect oDCft20 as FIXEDTEXT
	protect oDCFT21 as FIXEDTEXT
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
// 	instance COGNOME 
// 	instance NOME 
// 	instance ENDERECO 
// 	instance BAIRRO 
// 	instance ESTADO 
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
// 	instance NUMERO 
	protect oSFJBF01 as JBF01

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access BAIRRO() 
return self:FieldGet(#BAIRRO)


assign BAIRRO(uValue) 
self:FieldPut(#BAIRRO, uValue)
return BAIRRO := uValue


access CEP() 
return self:FieldGet(#CEP)


assign CEP(uValue) 
self:FieldPut(#CEP, uValue)
return CEP := uValue


access CIDADE() 
return self:FieldGet(#CIDADE)


assign CIDADE(uValue) 
self:FieldPut(#CIDADE, uValue)
return CIDADE := uValue


access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


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


access EMAIL() 
return self:FieldGet(#EMAIL)


assign EMAIL(uValue) 
self:FieldPut(#EMAIL, uValue)
return EMAIL := uValue


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


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JBD01",_GetInst()},iCtlID)

oDCCOGNOME := SingleLineEdit{self,ResourceID{JBD01_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := PADRAO_CHAR_15{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"MB01_COGNOME"}

oDCNOME := SingleLineEdit{self,ResourceID{JBD01_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MB01_NOME"}

oDCENDERECO := SingleLineEdit{self,ResourceID{JBD01_ENDERECO,_GetInst()}}
oDCENDERECO:FieldSpec := PADRAO_CHAR_40{}
oDCENDERECO:HyperLabel := HyperLabel{#ENDERECO,"Endereco:",NULL_STRING,"MB01_ENDERECO"}

oDCBAIRRO := SingleLineEdit{self,ResourceID{JBD01_BAIRRO,_GetInst()}}
oDCBAIRRO:FieldSpec := PADRAO_CHAR_30{}
oDCBAIRRO:HyperLabel := HyperLabel{#BAIRRO,"Bairro:",NULL_STRING,"MB01_BAIRRO"}

oDCESTADO := SingleLineEdit{self,ResourceID{JBD01_ESTADO,_GetInst()}}
oDCESTADO:FieldSpec := UF_FIELD{}
oDCESTADO:HyperLabel := HyperLabel{#ESTADO,"Numero:",NULL_STRING,"MB01_NUMERO"}

oDCCIDADE := SingleLineEdit{self,ResourceID{JBD01_CIDADE,_GetInst()}}
oDCCIDADE:FieldSpec := PAdrao_char_30{}
oDCCIDADE:HyperLabel := HyperLabel{#CIDADE,"Cidade:",NULL_STRING,"MB01_CIDADE"}

oDCCEP := SingleLineEdit{self,ResourceID{JBD01_CEP,_GetInst()}}
oDCCEP:FieldSpec := cep_field{}
oDCCEP:HyperLabel := HyperLabel{#CEP,"Cep:",NULL_STRING,"MB01_CEP"}

oDCDDD := rightSle{self,ResourceID{JBD01_DDD,_GetInst()}}
oDCDDD:FieldSpec := ddd_field{}
oDCDDD:HyperLabel := HyperLabel{#DDD,"Ddd:",NULL_STRING,"MB01_DDD"}

oDCTELEFONE := rightSle{self,ResourceID{JBD01_TELEFONE,_GetInst()}}
oDCTELEFONE:FieldSpec := PADRAO_CHAR_12{}
oDCTELEFONE:HyperLabel := HyperLabel{#TELEFONE,"Telefone:",NULL_STRING,"MB01_TELEFONE"}

oDCRAMAL := SingleLineEdit{self,ResourceID{JBD01_RAMAL,_GetInst()}}
oDCRAMAL:FieldSpec := padrao_char_04{}
oDCRAMAL:HyperLabel := HyperLabel{#RAMAL,"Ramal:",NULL_STRING,"MB01_RAMAL"}

oDCCONTATO := SingleLineEdit{self,ResourceID{JBD01_CONTATO,_GetInst()}}
oDCCONTATO:FieldSpec := padrao_char_22{}
oDCCONTATO:HyperLabel := HyperLabel{#CONTATO,"Contato:",NULL_STRING,"MB01_CONTATO"}

oDCDDD1 := rightSle{self,ResourceID{JBD01_DDD1,_GetInst()}}
oDCDDD1:FieldSpec := ddd_field{}
oDCDDD1:HyperLabel := HyperLabel{#DDD1,"Ddd1:",NULL_STRING,"MB01_DDD1"}

oDCTELEFONE1 := rightSle{self,ResourceID{JBD01_TELEFONE1,_GetInst()}}
oDCTELEFONE1:FieldSpec := PADRAO_CHAR_12{}
oDCTELEFONE1:HyperLabel := HyperLabel{#TELEFONE1,"Telefone1:",NULL_STRING,"MB01_TELEFONE1"}

oDCRAMAL1 := SingleLineEdit{self,ResourceID{JBD01_RAMAL1,_GetInst()}}
oDCRAMAL1:FieldSpec := padrao_char_04{}
oDCRAMAL1:HyperLabel := HyperLabel{#RAMAL1,"Ramal1:",NULL_STRING,"MB01_RAMAL1"}

oDCCONTATO1 := SingleLineEdit{self,ResourceID{JBD01_CONTATO1,_GetInst()}}
oDCCONTATO1:FieldSpec := padrao_char_22{}
oDCCONTATO1:HyperLabel := HyperLabel{#CONTATO1,"Contato1:",NULL_STRING,"MB01_CONTATO1"}

oDCDDDFAX := rightSle{self,ResourceID{JBD01_DDDFAX,_GetInst()}}
oDCDDDFAX:FieldSpec := ddd_field{}
oDCDDDFAX:HyperLabel := HyperLabel{#DDDFAX,"Dddfax:",NULL_STRING,"MB01_DDDFAX"}

oDCTELEFAX := rightSle{self,ResourceID{JBD01_TELEFAX,_GetInst()}}
oDCTELEFAX:FieldSpec := PADRAO_CHAR_12{}
oDCTELEFAX:HyperLabel := HyperLabel{#TELEFAX,"Telefax:",NULL_STRING,"MB01_TELEFAX"}

oDCEMAIL := SingleLineEdit{self,ResourceID{JBD01_EMAIL,_GetInst()}}
oDCEMAIL:FieldSpec := email_field{}
oDCEMAIL:HyperLabel := HyperLabel{#EMAIL,"Email",NULL_STRING,NULL_STRING}

oDCSITE := SingleLineEdit{self,ResourceID{JBD01_SITE,_GetInst()}}
oDCSITE:FieldSpec := padrao_char_30{}
oDCSITE:HyperLabel := HyperLabel{#SITE,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{self,ResourceID{JBD01_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JBD01_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JBD01_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_05{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"MB01_NUMERO"}

oDCSC_NOME := FixedText{self,ResourceID{JBD01_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_ENDERECO := FixedText{self,ResourceID{JBD01_SC_ENDERECO,_GetInst()}}
oDCSC_ENDERECO:HyperLabel := HyperLabel{#SC_ENDERECO,"Endereço:",NULL_STRING,NULL_STRING}

oDCSC_BAIRRO := FixedText{self,ResourceID{JBD01_SC_BAIRRO,_GetInst()}}
oDCSC_BAIRRO:HyperLabel := HyperLabel{#SC_BAIRRO,"Bairro:",NULL_STRING,NULL_STRING}

oDCSC_CIDADE := FixedText{self,ResourceID{JBD01_SC_CIDADE,_GetInst()}}
oDCSC_CIDADE:HyperLabel := HyperLabel{#SC_CIDADE,"Cidade:",NULL_STRING,NULL_STRING}

oDCSC_ESTADO := FixedText{self,ResourceID{JBD01_SC_ESTADO,_GetInst()}}
oDCSC_ESTADO:HyperLabel := HyperLabel{#SC_ESTADO,"Estado:",NULL_STRING,NULL_STRING}

oDCSC_CEP := FixedText{self,ResourceID{JBD01_SC_CEP,_GetInst()}}
oDCSC_CEP:HyperLabel := HyperLabel{#SC_CEP,"Cep:",NULL_STRING,NULL_STRING}

oDCSC_DDD := FixedText{self,ResourceID{JBD01_SC_DDD,_GetInst()}}
oDCSC_DDD:HyperLabel := HyperLabel{#SC_DDD,"DDD:",NULL_STRING,NULL_STRING}

oDCSC_TELEFONE := FixedText{self,ResourceID{JBD01_SC_TELEFONE,_GetInst()}}
oDCSC_TELEFONE:HyperLabel := HyperLabel{#SC_TELEFONE,"Telefone:",NULL_STRING,NULL_STRING}

oDCSC_RAMAL := FixedText{self,ResourceID{JBD01_SC_RAMAL,_GetInst()}}
oDCSC_RAMAL:HyperLabel := HyperLabel{#SC_RAMAL,"Ramal:",NULL_STRING,NULL_STRING}

oDCSC_CONTATO := FixedText{self,ResourceID{JBD01_SC_CONTATO,_GetInst()}}
oDCSC_CONTATO:HyperLabel := HyperLabel{#SC_CONTATO,"Contato:",NULL_STRING,NULL_STRING}

oDCtheFixedText16 := FixedText{self,ResourceID{JBD01_THEFIXEDTEXT16,_GetInst()}}
oDCtheFixedText16:HyperLabel := HyperLabel{#theFixedText16,"Telefone",NULL_STRING,NULL_STRING}

oDCtheFixedText17 := FixedText{self,ResourceID{JBD01_THEFIXEDTEXT17,_GetInst()}}
oDCtheFixedText17:HyperLabel := HyperLabel{#theFixedText17,"Telefone",NULL_STRING,NULL_STRING}

oDCtheFixedText18 := FixedText{self,ResourceID{JBD01_THEFIXEDTEXT18,_GetInst()}}
oDCtheFixedText18:HyperLabel := HyperLabel{#theFixedText18,"Fax:",NULL_STRING,NULL_STRING}

oDCft20 := FixedText{self,ResourceID{JBD01_FT20,_GetInst()}}
oDCft20:HyperLabel := HyperLabel{#ft20,"Email",NULL_STRING,NULL_STRING}

oDCFT21 := FixedText{self,ResourceID{JBD01_FT21,_GetInst()}}
oDCFT21:HyperLabel := HyperLabel{#FT21,"Site",NULL_STRING,NULL_STRING}

oCCpornum := PushButton{self,ResourceID{JBD01_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscanum := PushButton{self,ResourceID{JBD01_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Cadastro de Contatos"
self:HyperLabel := HyperLabel{#JBD01,"Cadastro de Contatos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{PADRAO_NUM_05{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBCOGNOME := DataColumn{PADRAO_CHAR_15{}}
oDBCOGNOME:Width := 10
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
self:Browser:AddColumn(oDBCOGNOME)

oDBNOME := DataColumn{PADRAO_CHAR_40{}}
oDBNOME:Width := 51
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBEMAIL := DataColumn{email_field{}}
oDBEMAIL:Width := 17
oDBEMAIL:HyperLabel := oDCEMAIL:HyperLabel 
oDBEMAIL:Caption := "Email"
self:Browser:AddColumn(oDBEMAIL)

oDBDDD := DataColumn{ddd_field{}}
oDBDDD:Width := 5
oDBDDD:HyperLabel := oDCDDD:HyperLabel 
oDBDDD:Caption := "Ddd:"
self:Browser:AddColumn(oDBDDD)

oDBTELEFONE := DataColumn{PADRAO_CHAR_12{}}
oDBTELEFONE:Width := 10
oDBTELEFONE:HyperLabel := oDCTELEFONE:HyperLabel 
oDBTELEFONE:Caption := "Telefone:"
self:Browser:AddColumn(oDBTELEFONE)


self:ViewAs(#FormView)

oSFJBF01 := JBF01{self,JBD01_JBF01}
oSFJBF01:show()

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


END CLASS
