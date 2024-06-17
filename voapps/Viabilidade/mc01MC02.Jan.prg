#region DEFINES
STATIC DEFINE JCPP_AGENCIA := 158 
STATIC DEFINE JCPP_BAIRRO := 127 
STATIC DEFINE JCPP_BANCO := 156 
STATIC DEFINE JCPP_BUSCAOV := 101 
STATIC DEFINE JCPP_CELULAR := 145 
STATIC DEFINE JCPP_CEP := 123 
STATIC DEFINE JCPP_CGC := 111 
STATIC DEFINE JCPP_CIDADE := 122 
STATIC DEFINE JCPP_COGNOME := 108 
STATIC DEFINE JCPP_CONTA := 157 
STATIC DEFINE JCPP_CONTATO := 135 
STATIC DEFINE JCPP_COTA := 154 
STATIC DEFINE JCPP_DATANASC := 146 
STATIC DEFINE JCPP_DDD := 132 
STATIC DEFINE JCPP_DDD1 := 137 
STATIC DEFINE JCPP_DDDFAX := 143 
STATIC DEFINE JCPP_EMAIL := 103 
STATIC DEFINE JCPP_ENDERECO := 126 
STATIC DEFINE JCPP_ESTADO := 121 
STATIC DEFINE JCPP_IESTADUAL := 116 
STATIC DEFINE JCPP_NOME := 109 
STATIC DEFINE JCPP_NUMERO := 107 
STATIC DEFINE JCPP_PESSOA := 110 
STATIC DEFINE JCPP_PORCOMIS := 153 
STATIC DEFINE JCPP_POROV := 100 
STATIC DEFINE JCPP_RAMAL := 134 
STATIC DEFINE JCPP_SC_AGENCIA := 152 
STATIC DEFINE JCPP_SC_BAIRRO := 125 
STATIC DEFINE JCPP_SC_BANCO := 150 
STATIC DEFINE JCPP_SC_CELULAR := 141 
STATIC DEFINE JCPP_SC_CEP := 120 
STATIC DEFINE JCPP_SC_CGC := 112 
STATIC DEFINE JCPP_SC_CIDADE := 119 
STATIC DEFINE JCPP_SC_CIDADE1 := 102 
STATIC DEFINE JCPP_SC_COGNOME := 105 
STATIC DEFINE JCPP_SC_CONTA := 151 
STATIC DEFINE JCPP_SC_CONTATO := 131 
STATIC DEFINE JCPP_SC_COTA := 148 
STATIC DEFINE JCPP_SC_DATANASC := 140 
STATIC DEFINE JCPP_SC_DDD := 128 
STATIC DEFINE JCPP_SC_ENDERECO := 124 
STATIC DEFINE JCPP_SC_ESTADO := 118 
STATIC DEFINE JCPP_SC_IESTADUAL := 117 
STATIC DEFINE JCPP_SC_NOME := 106 
STATIC DEFINE JCPP_SC_NUMERO := 104 
STATIC DEFINE JCPP_SC_PORCOMIS := 147 
STATIC DEFINE JCPP_SC_RAMAL := 130 
STATIC DEFINE JCPP_SC_TELEFAX := 142 
STATIC DEFINE JCPP_SC_TELEFONE := 136 
STATIC DEFINE JCPP_SC_TELEFONE1 := 139 
STATIC DEFINE JCPP_SC_ZONA := 149 
STATIC DEFINE JCPP_TELEFAX := 144 
STATIC DEFINE JCPP_TELEFONE := 133 
STATIC DEFINE JCPP_TELEFONE1 := 138 
STATIC DEFINE JCPP_THEFIXEDTEXT26 := 129 
STATIC DEFINE JCPP_THERADIOBUTTON1 := 113 
STATIC DEFINE JCPP_THERADIOBUTTON2 := 114 
STATIC DEFINE JCPP_THERADIOBUTTON3 := 115 
STATIC DEFINE JCPP_ZONA := 155 
#endregion

class JCPP inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBCGC as DataColumn
	PROTECT oDBIESTADUAL as DataColumn
	PROTECT oDBCIDADE as DataColumn
	PROTECT oDBCEP as DataColumn
	PROTECT oDBENDERECO as DataColumn
	PROTECT oDBBAIRRO as DataColumn
	PROTECT oDBDDD as DataColumn
	PROTECT oDBTELEFONE as DataColumn
	PROTECT oDBRAMAL as DataColumn
	PROTECT oDBCONTATO as DataColumn
	PROTECT oDBDDD1 as DataColumn
	PROTECT oDBTELEFONE1 as DataColumn
	PROTECT oDBDDDFAX as DataColumn
	PROTECT oDBTELEFAX as DataColumn
	PROTECT oDBCELULAR as DataColumn
	PROTECT oDBDATANASC as DataColumn
	PROTECT oDBPORCOMIS as DataColumn
	PROTECT oDBCOTA as DataColumn
	PROTECT oDBZONA as DataColumn
	PROTECT oDBCONTA as DataColumn
	PROTECT oDBBANCO as DataColumn
	PROTECT oDBAGENCIA as DataColumn
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oDCSC_CIDADE1 as FIXEDTEXT
	protect oDCEMAIL as SINGLELINEEDIT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCPESSOA as RADIOBUTTONGROUP
	protect oDCCGC as SINGLELINEEDIT
	protect oDCSC_CGC as FIXEDTEXT
	protect oCCtheRadioButton1 as RADIOBUTTON
	protect oCCtheRadioButton2 as RADIOBUTTON
	protect oCCtheRadioButton3 as RADIOBUTTON
	protect oDCIESTADUAL as SINGLELINEEDIT
	protect oDCSC_IESTADUAL as FIXEDTEXT
	protect oDCSC_ESTADO as FIXEDTEXT
	protect oDCSC_CIDADE as FIXEDTEXT
	protect oDCSC_CEP as FIXEDTEXT
	protect oDCESTADO as COMBOBOX
	protect oDCCIDADE as SINGLELINEEDIT
	protect oDCCEP as SINGLELINEEDIT
	protect oDCSC_ENDERECO as FIXEDTEXT
	protect oDCSC_BAIRRO as FIXEDTEXT
	protect oDCENDERECO as SINGLELINEEDIT
	protect oDCBAIRRO as SINGLELINEEDIT
	protect oDCSC_DDD as FIXEDTEXT
	protect oDCtheFixedText26 as FIXEDTEXT
	protect oDCSC_RAMAL as FIXEDTEXT
	protect oDCSC_CONTATO as FIXEDTEXT
	protect oDCDDD as SINGLELINEEDIT
	protect oDCTELEFONE as SINGLELINEEDIT
	protect oDCRAMAL as SINGLELINEEDIT
	protect oDCCONTATO as SINGLELINEEDIT
	protect oDCSC_TELEFONE as FIXEDTEXT
	protect oDCDDD1 as SINGLELINEEDIT
	protect oDCTELEFONE1 as SINGLELINEEDIT
	protect oDCSC_TELEFONE1 as FIXEDTEXT
	protect oDCSC_DATANASC as FIXEDTEXT
	protect oDCSC_CELULAR as FIXEDTEXT
	protect oDCSC_TELEFAX as FIXEDTEXT
	protect oDCDDDFAX as SINGLELINEEDIT
	protect oDCTELEFAX as SINGLELINEEDIT
	protect oDCCELULAR as SINGLELINEEDIT
	protect oDCDATANASC as DATESLE
	protect oDCSC_PORCOMIS as FIXEDTEXT
	protect oDCSC_COTA as FIXEDTEXT
	protect oDCSC_ZONA as FIXEDTEXT
	protect oDCSC_BANCO as FIXEDTEXT
	protect oDCSC_CONTA as FIXEDTEXT
	protect oDCSC_AGENCIA as FIXEDTEXT
	protect oDCPORCOMIS as SINGLELINEEDIT
	protect oDCCOTA as SINGLELINEEDIT
	protect oDCZONA as SINGLELINEEDIT
	protect oDCBANCO as SINGLELINEEDIT
	protect oDCCONTA as SINGLELINEEDIT
	protect oDCAGENCIA as SINGLELINEEDIT
// 	instance EMAIL 
// 	instance NUMERO 
// 	instance COGNOME 
// 	instance NOME 
// 	instance PESSOA 
// 	instance CGC 
// 	instance IESTADUAL 
// 	instance ESTADO 
// 	instance CIDADE 
// 	instance CEP 
// 	instance ENDERECO 
// 	instance BAIRRO 
// 	instance DDD 
// 	instance TELEFONE 
// 	instance RAMAL 
// 	instance CONTATO 
// 	instance DDD1 
// 	instance TELEFONE1 
// 	instance DDDFAX 
// 	instance TELEFAX 
// 	instance CELULAR 
// 	instance DATANASC 
// 	instance PORCOMIS 
// 	instance COTA 
// 	instance ZONA 
// 	instance BANCO 
// 	instance CONTA 
// 	instance AGENCIA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AGENCIA() 
return self:FieldGet(#AGENCIA)


assign AGENCIA(uValue) 
self:FieldPut(#AGENCIA, uValue)
return AGENCIA := uValue


access BAIRRO() 
return self:FieldGet(#BAIRRO)


assign BAIRRO(uValue) 
self:FieldPut(#BAIRRO, uValue)
return BAIRRO := uValue


access BANCO() 
return self:FieldGet(#BANCO)


assign BANCO(uValue) 
self:FieldPut(#BANCO, uValue)
return BANCO := uValue


access CELULAR() 
return self:FieldGet(#CELULAR)


assign CELULAR(uValue) 
self:FieldPut(#CELULAR, uValue)
return CELULAR := uValue


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


access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


access CONTA() 
return self:FieldGet(#CONTA)


assign CONTA(uValue) 
self:FieldPut(#CONTA, uValue)
return CONTA := uValue


access CONTATO() 
return self:FieldGet(#CONTATO)


assign CONTATO(uValue) 
self:FieldPut(#CONTATO, uValue)
return CONTATO := uValue


access COTA() 
return self:FieldGet(#COTA)


assign COTA(uValue) 
self:FieldPut(#COTA, uValue)
return COTA := uValue


access DATANASC() 
return self:FieldGet(#DATANASC)


assign DATANASC(uValue) 
self:FieldPut(#DATANASC, uValue)
return DATANASC := uValue


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


access IESTADUAL() 
return self:FieldGet(#IESTADUAL)


assign IESTADUAL(uValue) 
self:FieldPut(#IESTADUAL, uValue)
return IESTADUAL := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCPP",_GetInst()},iCtlID)

oCCporov := PushButton{self,ResourceID{JCPP_POROV,_GetInst()}}
oCCporov:Image := ICO_AZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Clique para ordenar por Numero"

oCCbuscaov := PushButton{self,ResourceID{JCPP_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ICO_FIND{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaov:TooltipText := "Clique Para Localizar Por Numero"

oDCSC_CIDADE1 := FixedText{self,ResourceID{JCPP_SC_CIDADE1,_GetInst()}}
oDCSC_CIDADE1:HyperLabel := HyperLabel{#SC_CIDADE1,"eMAIL:",NULL_STRING,NULL_STRING}

oDCEMAIL := SingleLineEdit{self,ResourceID{JCPP_EMAIL,_GetInst()}}
oDCEMAIL:FieldSpec := EMAIL_FIELD{}
oDCEMAIL:HyperLabel := HyperLabel{#EMAIL,NULL_STRING,NULL_STRING,"MC02_CIDADE"}

oDCSC_NUMERO := FixedText{self,ResourceID{JCPP_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{self,ResourceID{JCPP_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JCPP_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JCPP_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_char_05{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"MC02_NUMERO"}

oDCCOGNOME := SingleLineEdit{self,ResourceID{JCPP_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := padrao_char_12{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"MC02_COGNOME"}

oDCNOME := SingleLineEdit{self,ResourceID{JCPP_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MC02_NOME"}

oDCCGC := SingleLineEdit{self,ResourceID{JCPP_CGC,_GetInst()}}
oDCCGC:FieldSpec := padrao_char_18{}
oDCCGC:HyperLabel := HyperLabel{#CGC,"Cgc:",NULL_STRING,"MC02_CGC"}

oDCSC_CGC := FixedText{self,ResourceID{JCPP_SC_CGC,_GetInst()}}
oDCSC_CGC:HyperLabel := HyperLabel{#SC_CGC,"CGC/CPF",NULL_STRING,NULL_STRING}

oCCtheRadioButton1 := RadioButton{self,ResourceID{JCPP_THERADIOBUTTON1,_GetInst()}}
oCCtheRadioButton1:HyperLabel := HyperLabel{#theRadioButton1,"Fisica",NULL_STRING,NULL_STRING}

oCCtheRadioButton2 := RadioButton{self,ResourceID{JCPP_THERADIOBUTTON2,_GetInst()}}
oCCtheRadioButton2:HyperLabel := HyperLabel{#theRadioButton2,"Juridica",NULL_STRING,NULL_STRING}

oCCtheRadioButton3 := RadioButton{self,ResourceID{JCPP_THERADIOBUTTON3,_GetInst()}}
oCCtheRadioButton3:HyperLabel := HyperLabel{#theRadioButton3,"Outras",NULL_STRING,NULL_STRING}

oDCIESTADUAL := SingleLineEdit{self,ResourceID{JCPP_IESTADUAL,_GetInst()}}
oDCIESTADUAL:FieldSpec := padrao_char_15{}
oDCIESTADUAL:HyperLabel := HyperLabel{#IESTADUAL,"Iestadual:",NULL_STRING,"MC02_IESTADUAL"}

oDCSC_IESTADUAL := FixedText{self,ResourceID{JCPP_SC_IESTADUAL,_GetInst()}}
oDCSC_IESTADUAL:HyperLabel := HyperLabel{#SC_IESTADUAL,"Iestadual:",NULL_STRING,NULL_STRING}

oDCSC_ESTADO := FixedText{self,ResourceID{JCPP_SC_ESTADO,_GetInst()}}
oDCSC_ESTADO:HyperLabel := HyperLabel{#SC_ESTADO,"Estado:",NULL_STRING,NULL_STRING}

oDCSC_CIDADE := FixedText{self,ResourceID{JCPP_SC_CIDADE,_GetInst()}}
oDCSC_CIDADE:HyperLabel := HyperLabel{#SC_CIDADE,"Cidade:",NULL_STRING,NULL_STRING}

oDCSC_CEP := FixedText{self,ResourceID{JCPP_SC_CEP,_GetInst()}}
oDCSC_CEP:HyperLabel := HyperLabel{#SC_CEP,"Cep:",NULL_STRING,NULL_STRING}

oDCESTADO := combobox{self,ResourceID{JCPP_ESTADO,_GetInst()}}
oDCESTADO:FieldSpec := PADRAO_CHAR_02{}
oDCESTADO:FillUsing(Self:PEGMD05( ))
oDCESTADO:HyperLabel := HyperLabel{#ESTADO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCIDADE := SingleLineEdit{self,ResourceID{JCPP_CIDADE,_GetInst()}}
oDCCIDADE:FieldSpec := PADRAO_CHAR_35{}
oDCCIDADE:HyperLabel := HyperLabel{#CIDADE,"Cidade:",NULL_STRING,"MC02_CIDADE"}

oDCCEP := SingleLineEdit{self,ResourceID{JCPP_CEP,_GetInst()}}
oDCCEP:FieldSpec := CEP_FIELD{}
oDCCEP:HyperLabel := HyperLabel{#CEP,"Cep:",NULL_STRING,"MC02_CEP"}

oDCSC_ENDERECO := FixedText{self,ResourceID{JCPP_SC_ENDERECO,_GetInst()}}
oDCSC_ENDERECO:HyperLabel := HyperLabel{#SC_ENDERECO,"Endereco:",NULL_STRING,NULL_STRING}

oDCSC_BAIRRO := FixedText{self,ResourceID{JCPP_SC_BAIRRO,_GetInst()}}
oDCSC_BAIRRO:HyperLabel := HyperLabel{#SC_BAIRRO,"Bairro:",NULL_STRING,NULL_STRING}

oDCENDERECO := SingleLineEdit{self,ResourceID{JCPP_ENDERECO,_GetInst()}}
oDCENDERECO:FieldSpec := PADRAO_CHAR_40{}
oDCENDERECO:HyperLabel := HyperLabel{#ENDERECO,"Endereco:",NULL_STRING,"MC02_ENDERECO"}

oDCBAIRRO := SingleLineEdit{self,ResourceID{JCPP_BAIRRO,_GetInst()}}
oDCBAIRRO:FieldSpec := PADRAO_CHAR_30{}
oDCBAIRRO:HyperLabel := HyperLabel{#BAIRRO,"Bairro:",NULL_STRING,"MC02_BAIRRO"}

oDCSC_DDD := FixedText{self,ResourceID{JCPP_SC_DDD,_GetInst()}}
oDCSC_DDD:HyperLabel := HyperLabel{#SC_DDD,"Ddd:",NULL_STRING,NULL_STRING}

oDCtheFixedText26 := FixedText{self,ResourceID{JCPP_THEFIXEDTEXT26,_GetInst()}}
oDCtheFixedText26:HyperLabel := HyperLabel{#theFixedText26,"Numero",NULL_STRING,NULL_STRING}

oDCSC_RAMAL := FixedText{self,ResourceID{JCPP_SC_RAMAL,_GetInst()}}
oDCSC_RAMAL:HyperLabel := HyperLabel{#SC_RAMAL,"Ramal:",NULL_STRING,NULL_STRING}

oDCSC_CONTATO := FixedText{self,ResourceID{JCPP_SC_CONTATO,_GetInst()}}
oDCSC_CONTATO:HyperLabel := HyperLabel{#SC_CONTATO,"Contato:",NULL_STRING,NULL_STRING}

oDCDDD := SingleLineEdit{self,ResourceID{JCPP_DDD,_GetInst()}}
oDCDDD:FieldSpec := DDD_FIELD{}
oDCDDD:HyperLabel := HyperLabel{#DDD,"Ddd:",NULL_STRING,"MC02_DDD"}

oDCTELEFONE := SingleLineEdit{self,ResourceID{JCPP_TELEFONE,_GetInst()}}
oDCTELEFONE:FieldSpec := PADRAO_CHAR_12{}
oDCTELEFONE:HyperLabel := HyperLabel{#TELEFONE,"Telefone:",NULL_STRING,"MC02_TELEFONE"}

oDCRAMAL := SingleLineEdit{self,ResourceID{JCPP_RAMAL,_GetInst()}}
oDCRAMAL:FieldSpec := PADRAO_CHAR_04{}
oDCRAMAL:HyperLabel := HyperLabel{#RAMAL,"Ramal:",NULL_STRING,"MC02_RAMAL"}

oDCCONTATO := SingleLineEdit{self,ResourceID{JCPP_CONTATO,_GetInst()}}
oDCCONTATO:FieldSpec := PADRAO_CHAR_22{}
oDCCONTATO:HyperLabel := HyperLabel{#CONTATO,"Contato:",NULL_STRING,"MC02_CONTATO"}

oDCSC_TELEFONE := FixedText{self,ResourceID{JCPP_SC_TELEFONE,_GetInst()}}
oDCSC_TELEFONE:HyperLabel := HyperLabel{#SC_TELEFONE,"Telefone:",NULL_STRING,NULL_STRING}

oDCDDD1 := SingleLineEdit{self,ResourceID{JCPP_DDD1,_GetInst()}}
oDCDDD1:FieldSpec := DDD_FIELD{}
oDCDDD1:HyperLabel := HyperLabel{#DDD1,"Ddd1:",NULL_STRING,"MC02_DDD1"}

oDCTELEFONE1 := SingleLineEdit{self,ResourceID{JCPP_TELEFONE1,_GetInst()}}
oDCTELEFONE1:FieldSpec := PADRAO_CHAR_12{}
oDCTELEFONE1:HyperLabel := HyperLabel{#TELEFONE1,"Telefone1:",NULL_STRING,"MC02_TELEFONE1"}

oDCSC_TELEFONE1 := FixedText{self,ResourceID{JCPP_SC_TELEFONE1,_GetInst()}}
oDCSC_TELEFONE1:HyperLabel := HyperLabel{#SC_TELEFONE1,"Telefone1:",NULL_STRING,NULL_STRING}

oDCSC_DATANASC := FixedText{self,ResourceID{JCPP_SC_DATANASC,_GetInst()}}
oDCSC_DATANASC:HyperLabel := HyperLabel{#SC_DATANASC,"Data de Nascimento","Data de Nascimento do Comprador",NULL_STRING}

oDCSC_CELULAR := FixedText{self,ResourceID{JCPP_SC_CELULAR,_GetInst()}}
oDCSC_CELULAR:HyperLabel := HyperLabel{#SC_CELULAR,"Celular:",NULL_STRING,NULL_STRING}

oDCSC_TELEFAX := FixedText{self,ResourceID{JCPP_SC_TELEFAX,_GetInst()}}
oDCSC_TELEFAX:HyperLabel := HyperLabel{#SC_TELEFAX,"Telefax:",NULL_STRING,NULL_STRING}

oDCDDDFAX := SingleLineEdit{self,ResourceID{JCPP_DDDFAX,_GetInst()}}
oDCDDDFAX:FieldSpec := DDD_FIELD{}
oDCDDDFAX:HyperLabel := HyperLabel{#DDDFAX,"Dddfax:",NULL_STRING,"MC02_DDDFAX"}

oDCTELEFAX := SingleLineEdit{self,ResourceID{JCPP_TELEFAX,_GetInst()}}
oDCTELEFAX:FieldSpec := PADRAO_CHAR_12{}
oDCTELEFAX:HyperLabel := HyperLabel{#TELEFAX,"Telefax:",NULL_STRING,"MC02_TELEFAX"}

oDCCELULAR := SingleLineEdit{self,ResourceID{JCPP_CELULAR,_GetInst()}}
oDCCELULAR:FieldSpec := PADRAO_CHAR_12{}
oDCCELULAR:HyperLabel := HyperLabel{#CELULAR,"Celular:",NULL_STRING,"MC02_CELULAR"}

oDCDATANASC := DateSle{self,ResourceID{JCPP_DATANASC,_GetInst()}}
oDCDATANASC:FieldSpec := DATE_FIELD{}
oDCDATANASC:HyperLabel := HyperLabel{#DATANASC,"Cadastro de Compradores","Data de Nascimento do Comprador","MC02_DATANASC"}

oDCSC_PORCOMIS := FixedText{self,ResourceID{JCPP_SC_PORCOMIS,_GetInst()}}
oDCSC_PORCOMIS:HyperLabel := HyperLabel{#SC_PORCOMIS,"% Comissão",NULL_STRING,NULL_STRING}

oDCSC_COTA := FixedText{self,ResourceID{JCPP_SC_COTA,_GetInst()}}
oDCSC_COTA:HyperLabel := HyperLabel{#SC_COTA,"Cota:",NULL_STRING,NULL_STRING}

oDCSC_ZONA := FixedText{self,ResourceID{JCPP_SC_ZONA,_GetInst()}}
oDCSC_ZONA:HyperLabel := HyperLabel{#SC_ZONA,"Zona:",NULL_STRING,NULL_STRING}

oDCSC_BANCO := FixedText{self,ResourceID{JCPP_SC_BANCO,_GetInst()}}
oDCSC_BANCO:HyperLabel := HyperLabel{#SC_BANCO,"Banco:",NULL_STRING,NULL_STRING}

oDCSC_CONTA := FixedText{self,ResourceID{JCPP_SC_CONTA,_GetInst()}}
oDCSC_CONTA:HyperLabel := HyperLabel{#SC_CONTA,"Conta:",NULL_STRING,NULL_STRING}

oDCSC_AGENCIA := FixedText{self,ResourceID{JCPP_SC_AGENCIA,_GetInst()}}
oDCSC_AGENCIA:HyperLabel := HyperLabel{#SC_AGENCIA,"Agencia:",NULL_STRING,NULL_STRING}

oDCPORCOMIS := SingleLineEdit{self,ResourceID{JCPP_PORCOMIS,_GetInst()}}
oDCPORCOMIS:FieldSpec := PADRAO_NUM_05_2{}
oDCPORCOMIS:HyperLabel := HyperLabel{#PORCOMIS,"Porcomis:",NULL_STRING,"MC02_PORCOMIS"}

oDCCOTA := SingleLineEdit{self,ResourceID{JCPP_COTA,_GetInst()}}
oDCCOTA:FieldSpec := PADRAO_NUM_12_2{}
oDCCOTA:HyperLabel := HyperLabel{#COTA,"Cota:",NULL_STRING,"MC02_COTA"}

oDCZONA := SingleLineEdit{self,ResourceID{JCPP_ZONA,_GetInst()}}
oDCZONA:FieldSpec := PADRAO_CHAR_06{}
oDCZONA:HyperLabel := HyperLabel{#ZONA,"Zona:",NULL_STRING,"MC02_ZONA"}

oDCBANCO := SingleLineEdit{self,ResourceID{JCPP_BANCO,_GetInst()}}
oDCBANCO:FieldSpec := PADRAO_NUM_03{}
oDCBANCO:HyperLabel := HyperLabel{#BANCO,"Banco:",NULL_STRING,"MC02_BANCO"}

oDCCONTA := SingleLineEdit{self,ResourceID{JCPP_CONTA,_GetInst()}}
oDCCONTA:FieldSpec := PADRAO_CHAR_12{}
oDCCONTA:HyperLabel := HyperLabel{#CONTA,"Conta:",NULL_STRING,"MC02_CONTA"}

oDCAGENCIA := SingleLineEdit{self,ResourceID{JCPP_AGENCIA,_GetInst()}}
oDCAGENCIA:FieldSpec := PADRAO_CHAR_07{}
oDCAGENCIA:HyperLabel := HyperLabel{#AGENCIA,"Agencia:",NULL_STRING,"MC02_AGENCIA"}

oDCPESSOA := RadioButtonGroup{self,ResourceID{JCPP_PESSOA,_GetInst()}}
oDCPESSOA:FillUsing({ ;
						{oCCtheRadioButton1,"F"}, ;
						{oCCtheRadioButton2,"J"}, ;
						{oCCtheRadioButton3,"O"} ;
						})
oDCPESSOA:HyperLabel := HyperLabel{#PESSOA,"Pessoa",NULL_STRING,NULL_STRING}
oDCPESSOA:FieldSpec := padrao_char_01{}

self:Caption := "Cadastro de Compradores"
self:HyperLabel := HyperLabel{#JCPP,"Cadastro de Compradores",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_char_05{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBCOGNOME := DataColumn{padrao_char_12{}}
oDBCOGNOME:Width := 9
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
self:Browser:AddColumn(oDBCOGNOME)

oDBNOME := DataColumn{padrao_char_40{}}
oDBNOME:Width := 6
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBCGC := DataColumn{padrao_char_18{}}
oDBCGC:Width := 5
oDBCGC:HyperLabel := oDCCGC:HyperLabel 
oDBCGC:Caption := "Cgc:"
self:Browser:AddColumn(oDBCGC)

oDBIESTADUAL := DataColumn{padrao_char_15{}}
oDBIESTADUAL:Width := 11
oDBIESTADUAL:HyperLabel := oDCIESTADUAL:HyperLabel 
oDBIESTADUAL:Caption := "Iestadual:"
self:Browser:AddColumn(oDBIESTADUAL)

oDBCIDADE := DataColumn{PADRAO_CHAR_35{}}
oDBCIDADE:Width := 8
oDBCIDADE:HyperLabel := oDCCIDADE:HyperLabel 
oDBCIDADE:Caption := "Cidade:"
self:Browser:AddColumn(oDBCIDADE)

oDBCEP := DataColumn{CEP_FIELD{}}
oDBCEP:Width := 5
oDBCEP:HyperLabel := oDCCEP:HyperLabel 
oDBCEP:Caption := "Cep:"
self:Browser:AddColumn(oDBCEP)

oDBENDERECO := DataColumn{PADRAO_CHAR_40{}}
oDBENDERECO:Width := 10
oDBENDERECO:HyperLabel := oDCENDERECO:HyperLabel 
oDBENDERECO:Caption := "Endereco:"
self:Browser:AddColumn(oDBENDERECO)

oDBBAIRRO := DataColumn{PADRAO_CHAR_30{}}
oDBBAIRRO:Width := 8
oDBBAIRRO:HyperLabel := oDCBAIRRO:HyperLabel 
oDBBAIRRO:Caption := "Bairro:"
self:Browser:AddColumn(oDBBAIRRO)

oDBDDD := DataColumn{DDD_FIELD{}}
oDBDDD:Width := 5
oDBDDD:HyperLabel := oDCDDD:HyperLabel 
oDBDDD:Caption := "Ddd:"
self:Browser:AddColumn(oDBDDD)

oDBTELEFONE := DataColumn{PADRAO_CHAR_12{}}
oDBTELEFONE:Width := 10
oDBTELEFONE:HyperLabel := oDCTELEFONE:HyperLabel 
oDBTELEFONE:Caption := "Telefone:"
self:Browser:AddColumn(oDBTELEFONE)

oDBRAMAL := DataColumn{PADRAO_CHAR_04{}}
oDBRAMAL:Width := 7
oDBRAMAL:HyperLabel := oDCRAMAL:HyperLabel 
oDBRAMAL:Caption := "Ramal:"
self:Browser:AddColumn(oDBRAMAL)

oDBCONTATO := DataColumn{PADRAO_CHAR_22{}}
oDBCONTATO:Width := 9
oDBCONTATO:HyperLabel := oDCCONTATO:HyperLabel 
oDBCONTATO:Caption := "Contato:"
self:Browser:AddColumn(oDBCONTATO)

oDBDDD1 := DataColumn{DDD_FIELD{}}
oDBDDD1:Width := 6
oDBDDD1:HyperLabel := oDCDDD1:HyperLabel 
oDBDDD1:Caption := "Ddd1:"
self:Browser:AddColumn(oDBDDD1)

oDBTELEFONE1 := DataColumn{PADRAO_CHAR_12{}}
oDBTELEFONE1:Width := 11
oDBTELEFONE1:HyperLabel := oDCTELEFONE1:HyperLabel 
oDBTELEFONE1:Caption := "Telefone1:"
self:Browser:AddColumn(oDBTELEFONE1)

oDBDDDFAX := DataColumn{DDD_FIELD{}}
oDBDDDFAX:Width := 8
oDBDDDFAX:HyperLabel := oDCDDDFAX:HyperLabel 
oDBDDDFAX:Caption := "Dddfax:"
self:Browser:AddColumn(oDBDDDFAX)

oDBTELEFAX := DataColumn{PADRAO_CHAR_12{}}
oDBTELEFAX:Width := 9
oDBTELEFAX:HyperLabel := oDCTELEFAX:HyperLabel 
oDBTELEFAX:Caption := "Telefax:"
self:Browser:AddColumn(oDBTELEFAX)

oDBCELULAR := DataColumn{PADRAO_CHAR_12{}}
oDBCELULAR:Width := 9
oDBCELULAR:HyperLabel := oDCCELULAR:HyperLabel 
oDBCELULAR:Caption := "Celular:"
self:Browser:AddColumn(oDBCELULAR)

oDBDATANASC := DataColumn{DATE_FIELD{}}
oDBDATANASC:Width := 10
oDBDATANASC:HyperLabel := oDCDATANASC:HyperLabel 
oDBDATANASC:Caption := "Cadastro de Compradores"
self:Browser:AddColumn(oDBDATANASC)

oDBPORCOMIS := DataColumn{PADRAO_NUM_05_2{}}
oDBPORCOMIS:Width := 10
oDBPORCOMIS:HyperLabel := oDCPORCOMIS:HyperLabel 
oDBPORCOMIS:Caption := "Porcomis:"
self:Browser:AddColumn(oDBPORCOMIS)

oDBCOTA := DataColumn{PADRAO_NUM_12_2{}}
oDBCOTA:Width := 6
oDBCOTA:HyperLabel := oDCCOTA:HyperLabel 
oDBCOTA:Caption := "Cota:"
self:Browser:AddColumn(oDBCOTA)

oDBZONA := DataColumn{PADRAO_CHAR_06{}}
oDBZONA:Width := 6
oDBZONA:HyperLabel := oDCZONA:HyperLabel 
oDBZONA:Caption := "Zona:"
self:Browser:AddColumn(oDBZONA)

oDBCONTA := DataColumn{PADRAO_CHAR_12{}}
oDBCONTA:Width := 7
oDBCONTA:HyperLabel := oDCCONTA:HyperLabel 
oDBCONTA:Caption := "Conta:"
self:Browser:AddColumn(oDBCONTA)

oDBBANCO := DataColumn{PADRAO_NUM_03{}}
oDBBANCO:Width := 7
oDBBANCO:HyperLabel := oDCBANCO:HyperLabel 
oDBBANCO:Caption := "Banco:"
self:Browser:AddColumn(oDBBANCO)

oDBAGENCIA := DataColumn{PADRAO_CHAR_07{}}
oDBAGENCIA:Width := 9
oDBAGENCIA:HyperLabel := oDCAGENCIA:HyperLabel 
oDBAGENCIA:Caption := "Agencia:"
self:Browser:AddColumn(oDBAGENCIA)


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


METHOD PEGMD05() 
RETU PEGCOMBO("MD05.DBF","NOMEEXT","UFICMS")

access PESSOA() 
return self:FieldGet(#PESSOA)


assign PESSOA(uValue) 
self:FieldPut(#PESSOA, uValue)
return PESSOA := uValue


access PORCOMIS() 
return self:FieldGet(#PORCOMIS)


assign PORCOMIS(uValue) 
self:FieldPut(#PORCOMIS, uValue)
return PORCOMIS := uValue


access RAMAL() 
return self:FieldGet(#RAMAL)


assign RAMAL(uValue) 
self:FieldPut(#RAMAL, uValue)
return RAMAL := uValue


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


access ZONA() 
return self:FieldGet(#ZONA)


assign ZONA(uValue) 
self:FieldPut(#ZONA, uValue)
return ZONA := uValue


END CLASS
