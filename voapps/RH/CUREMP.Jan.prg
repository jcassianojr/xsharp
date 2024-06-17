#region DEFINES
STATIC DEFINE JCEM_BAIRRO := 118 
STATIC DEFINE JCEM_BUSCANOME := 102 
STATIC DEFINE JCEM_BUSCANUMERO := 104 
STATIC DEFINE JCEM_CEP := 120 
STATIC DEFINE JCEM_CGC := 145 
STATIC DEFINE JCEM_CIDADE := 123 
STATIC DEFINE JCEM_COGNOME := 109 
STATIC DEFINE JCEM_CONTATO := 130 
STATIC DEFINE JCEM_CONTATO1 := 134 
STATIC DEFINE JCEM_CURSO := 149 
STATIC DEFINE JCEM_DDD := 131 
STATIC DEFINE JCEM_DDD1 := 135 
STATIC DEFINE JCEM_DDDFAX := 138 
STATIC DEFINE JCEM_EMAIL := 142 
STATIC DEFINE JCEM_ENDERECO := 116 
STATIC DEFINE JCEM_ESCCUR := 100 
STATIC DEFINE JCEM_ESTADO := 122 
STATIC DEFINE JCEM_EXCLUIR := 151 
STATIC DEFINE JCEM_IESTADUAL := 147 
STATIC DEFINE JCEM_INCLUIR := 150 
STATIC DEFINE JCEM_JCEI := 148 
STATIC DEFINE JCEM_NOME := 114 
STATIC DEFINE JCEM_NUMERO := 108 
STATIC DEFINE JCEM_PESSOA := 107 
STATIC DEFINE JCEM_PORCOGNOME := 101 
STATIC DEFINE JCEM_PORNUMERO := 103 
STATIC DEFINE JCEM_RAMAL := 129 
STATIC DEFINE JCEM_RAMAL1 := 133 
STATIC DEFINE JCEM_RB1 := 110 
STATIC DEFINE JCEM_RB2 := 111 
STATIC DEFINE JCEM_RB3 := 112 
STATIC DEFINE JCEM_SC_BAIRRO := 117 
STATIC DEFINE JCEM_SC_CEP := 119 
STATIC DEFINE JCEM_SC_CGC := 144 
STATIC DEFINE JCEM_SC_CIDADE := 124 
STATIC DEFINE JCEM_SC_COGNOME := 106 
STATIC DEFINE JCEM_SC_CONTATO := 126 
STATIC DEFINE JCEM_SC_DDD := 127 
STATIC DEFINE JCEM_SC_EMAIL := 141 
STATIC DEFINE JCEM_SC_ENDERECO := 115 
STATIC DEFINE JCEM_SC_ESTADO := 121 
STATIC DEFINE JCEM_SC_IESTADUAL := 146 
STATIC DEFINE JCEM_SC_NOME := 113 
STATIC DEFINE JCEM_SC_RAMAL := 125 
STATIC DEFINE JCEM_SC_SITE := 143 
STATIC DEFINE JCEM_SC_TELEFONE := 128 
STATIC DEFINE JCEM_SITE := 140 
STATIC DEFINE JCEM_TELEFAX := 139 
STATIC DEFINE JCEM_TELEFONE := 132 
STATIC DEFINE JCEM_TELEFONE1 := 136 
STATIC DEFINE JCEM_THEFIXEDTEXT18 := 105 
STATIC DEFINE JCEM_THEFIXEDTEXT19 := 137 
#endregion

PARTIAL class JCEM inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBDDD as DataColumn
	PROTECT oDBTELEFONE as DataColumn
	PROTECT oDBSITE as DataColumn
	PROTECT oDBEMAIL as DataColumn
	protect oCCesccur as PUSHBUTTON
	protect oCCporcognome as PUSHBUTTON
	protect oCCbuscanome as PUSHBUTTON
	protect oCCpornumero as PUSHBUTTON
	protect oCCbuscanumero as PUSHBUTTON
	protect oDCtheFixedText18 as FIXEDTEXT
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCPESSOA as RADIOBUTTONGROUP
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oCCRB1 as RADIOBUTTON
	protect oCCRB2 as RADIOBUTTON
	protect oCCRB3 as RADIOBUTTON
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSC_ENDERECO as FIXEDTEXT
	protect oDCENDERECO as SINGLELINEEDIT
	protect oDCSC_BAIRRO as FIXEDTEXT
	protect oDCBAIRRO as SINGLELINEEDIT
	protect oDCSC_CEP as FIXEDTEXT
	protect oDCCEP as SINGLELINEEDIT
	protect oDCSC_ESTADO as FIXEDTEXT
	protect oDCESTADO as SINGLELINEEDIT
	protect oDCCIDADE as SINGLELINEEDIT
	protect oDCSC_CIDADE as FIXEDTEXT
	protect oDCSC_RAMAL as FIXEDTEXT
	protect oDCSC_CONTATO as FIXEDTEXT
	protect oDCSC_DDD as FIXEDTEXT
	protect oDCSC_TELEFONE as FIXEDTEXT
	protect oDCRAMAL as SINGLELINEEDIT
	protect oDCCONTATO as SINGLELINEEDIT
	protect oDCDDD as SINGLELINEEDIT
	protect oDCTELEFONE as SINGLELINEEDIT
	protect oDCRAMAL1 as SINGLELINEEDIT
	protect oDCCONTATO1 as SINGLELINEEDIT
	protect oDCDDD1 as SINGLELINEEDIT
	protect oDCTELEFONE1 as SINGLELINEEDIT
	protect oDCtheFixedText19 as FIXEDTEXT
	protect oDCDDDFAX as SINGLELINEEDIT
	protect oDCTELEFAX as SINGLELINEEDIT
	protect oDCSITE as SINGLELINEEDIT
	protect oDCSC_EMAIL as FIXEDTEXT
	protect oDCEMAIL as SINGLELINEEDIT
	protect oDCSC_SITE as FIXEDTEXT
	protect oDCSC_CGC as FIXEDTEXT
	protect oDCCGC as SINGLELINEEDIT
	protect oDCSC_IESTADUAL as FIXEDTEXT
	protect oDCIESTADUAL as SINGLELINEEDIT
	protect oDCCURSO as SINGLELINEEDIT
	protect oCCINCLUIR as PUSHBUTTON
	protect oCCEXCLUIR as PUSHBUTTON
// 	instance PESSOA 
// 	instance NUMERO 
// 	instance COGNOME 
// 	instance NOME 
// 	instance ENDERECO 
// 	instance BAIRRO 
// 	instance CEP 
// 	instance ESTADO 
// 	instance CIDADE 
// 	instance RAMAL 
// 	instance CONTATO 
// 	instance DDD 
// 	instance TELEFONE 
// 	instance RAMAL1 
// 	instance CONTATO1 
// 	instance DDD1 
// 	instance TELEFONE1 
// 	instance DDDFAX 
// 	instance TELEFAX 
// 	instance SITE 
// 	instance EMAIL 
// 	instance CGC 
// 	instance IESTADUAL 
// 	instance CURSO 
	protect oSFJCEI as JCEI

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


access CURSO() 
return self:FieldGet(#CURSO)


assign CURSO(uValue) 
self:FieldPut(#CURSO, uValue)
return CURSO := uValue


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
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCEM",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{253,254,220}}

oCCesccur := PushButton{self,ResourceID{JCEM_ESCCUR,_GetInst()}}
oCCesccur:HyperLabel := HyperLabel{#esccur,"...",NULL_STRING,NULL_STRING}

oCCporcognome := PushButton{self,ResourceID{JCEM_PORCOGNOME,_GetInst()}}
oCCporcognome:Image := ICO_AZ{}
oCCporcognome:HyperLabel := HyperLabel{#porcognome,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscanome := PushButton{self,ResourceID{JCEM_BUSCANOME,_GetInst()}}
oCCbuscanome:Image := ICO_FIND{}
oCCbuscanome:HyperLabel := HyperLabel{#buscanome,NULL_STRING,NULL_STRING,NULL_STRING}

oCCpornumero := PushButton{self,ResourceID{JCEM_PORNUMERO,_GetInst()}}
oCCpornumero:Image := ICO_AZ{}
oCCpornumero:HyperLabel := HyperLabel{#pornumero,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscanumero := PushButton{self,ResourceID{JCEM_BUSCANUMERO,_GetInst()}}
oCCbuscanumero:Image := ICO_FIND{}
oCCbuscanumero:HyperLabel := HyperLabel{#buscanumero,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText18 := FixedText{self,ResourceID{JCEM_THEFIXEDTEXT18,_GetInst()}}
oDCtheFixedText18:HyperLabel := HyperLabel{#theFixedText18,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{self,ResourceID{JCEM_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JCEM_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"CUREMP_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]

oDCCOGNOME := SingleLineEdit{self,ResourceID{JCEM_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := padrao_char_15{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"CUREMP_COGNOME"}

oCCRB1 := RadioButton{self,ResourceID{JCEM_RB1,_GetInst()}}
oCCRB1:HyperLabel := HyperLabel{#RB1,"Fisica",NULL_STRING,NULL_STRING}

oCCRB2 := RadioButton{self,ResourceID{JCEM_RB2,_GetInst()}}
oCCRB2:HyperLabel := HyperLabel{#RB2,"Juridica",NULL_STRING,NULL_STRING}

oCCRB3 := RadioButton{self,ResourceID{JCEM_RB3,_GetInst()}}
oCCRB3:HyperLabel := HyperLabel{#RB3,"Outras",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JCEM_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JCEM_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"CUREMP_NOME"}

oDCSC_ENDERECO := FixedText{self,ResourceID{JCEM_SC_ENDERECO,_GetInst()}}
oDCSC_ENDERECO:HyperLabel := HyperLabel{#SC_ENDERECO,"Endereco:",NULL_STRING,NULL_STRING}

oDCENDERECO := SingleLineEdit{self,ResourceID{JCEM_ENDERECO,_GetInst()}}
oDCENDERECO:FieldSpec := padrao_char_40{}
oDCENDERECO:HyperLabel := HyperLabel{#ENDERECO,"Endereco:",NULL_STRING,"CUREMP_ENDERECO"}

oDCSC_BAIRRO := FixedText{self,ResourceID{JCEM_SC_BAIRRO,_GetInst()}}
oDCSC_BAIRRO:HyperLabel := HyperLabel{#SC_BAIRRO,"Bairro:",NULL_STRING,NULL_STRING}

oDCBAIRRO := SingleLineEdit{self,ResourceID{JCEM_BAIRRO,_GetInst()}}
oDCBAIRRO:FieldSpec := padrao_char_30{}
oDCBAIRRO:HyperLabel := HyperLabel{#BAIRRO,"Bairro:",NULL_STRING,"CUREMP_BAIRRO"}

oDCSC_CEP := FixedText{self,ResourceID{JCEM_SC_CEP,_GetInst()}}
oDCSC_CEP:HyperLabel := HyperLabel{#SC_CEP,"Cep:",NULL_STRING,NULL_STRING}

oDCCEP := SingleLineEdit{self,ResourceID{JCEM_CEP,_GetInst()}}
oDCCEP:FieldSpec := padrao_char_09{}
oDCCEP:HyperLabel := HyperLabel{#CEP,"Cep:",NULL_STRING,"CUREMP_CEP"}

oDCSC_ESTADO := FixedText{self,ResourceID{JCEM_SC_ESTADO,_GetInst()}}
oDCSC_ESTADO:HyperLabel := HyperLabel{#SC_ESTADO,"Estado:",NULL_STRING,NULL_STRING}

oDCESTADO := SingleLineEdit{self,ResourceID{JCEM_ESTADO,_GetInst()}}
oDCESTADO:FieldSpec := padrao_char_02{}
oDCESTADO:HyperLabel := HyperLabel{#ESTADO,"Estado:",NULL_STRING,"CUREMP_ESTADO"}

oDCCIDADE := SingleLineEdit{self,ResourceID{JCEM_CIDADE,_GetInst()}}
oDCCIDADE:FieldSpec := padrao_char_30{}
oDCCIDADE:HyperLabel := HyperLabel{#CIDADE,"Cidade:",NULL_STRING,"CUREMP_CIDADE"}

oDCSC_CIDADE := FixedText{self,ResourceID{JCEM_SC_CIDADE,_GetInst()}}
oDCSC_CIDADE:HyperLabel := HyperLabel{#SC_CIDADE,"Cidade:",NULL_STRING,NULL_STRING}

oDCSC_RAMAL := FixedText{self,ResourceID{JCEM_SC_RAMAL,_GetInst()}}
oDCSC_RAMAL:HyperLabel := HyperLabel{#SC_RAMAL,"Ramal:",NULL_STRING,NULL_STRING}

oDCSC_CONTATO := FixedText{self,ResourceID{JCEM_SC_CONTATO,_GetInst()}}
oDCSC_CONTATO:HyperLabel := HyperLabel{#SC_CONTATO,"Contato:",NULL_STRING,NULL_STRING}

oDCSC_DDD := FixedText{self,ResourceID{JCEM_SC_DDD,_GetInst()}}
oDCSC_DDD:HyperLabel := HyperLabel{#SC_DDD,"Ddd:",NULL_STRING,NULL_STRING}

oDCSC_TELEFONE := FixedText{self,ResourceID{JCEM_SC_TELEFONE,_GetInst()}}
oDCSC_TELEFONE:HyperLabel := HyperLabel{#SC_TELEFONE,"Telefone:",NULL_STRING,NULL_STRING}

oDCRAMAL := SingleLineEdit{self,ResourceID{JCEM_RAMAL,_GetInst()}}
oDCRAMAL:FieldSpec := padrao_char_04{}
oDCRAMAL:HyperLabel := HyperLabel{#RAMAL,"Ramal:",NULL_STRING,"CUREMP_RAMAL"}

oDCCONTATO := SingleLineEdit{self,ResourceID{JCEM_CONTATO,_GetInst()}}
oDCCONTATO:FieldSpec := padrao_char_22{}
oDCCONTATO:HyperLabel := HyperLabel{#CONTATO,"Contato:",NULL_STRING,"CUREMP_CONTATO"}

oDCDDD := SingleLineEdit{self,ResourceID{JCEM_DDD,_GetInst()}}
oDCDDD:FieldSpec := padrao_char_04{}
oDCDDD:HyperLabel := HyperLabel{#DDD,"Ddd:",NULL_STRING,"CUREMP_DDD"}

oDCTELEFONE := SingleLineEdit{self,ResourceID{JCEM_TELEFONE,_GetInst()}}
oDCTELEFONE:FieldSpec := padrao_char_12{}
oDCTELEFONE:HyperLabel := HyperLabel{#TELEFONE,"Telefone:",NULL_STRING,"CUREMP_TELEFONE"}

oDCRAMAL1 := SingleLineEdit{self,ResourceID{JCEM_RAMAL1,_GetInst()}}
oDCRAMAL1:FieldSpec := padrao_char_04{}
oDCRAMAL1:HyperLabel := HyperLabel{#RAMAL1,"Ramal1:",NULL_STRING,"CUREMP_RAMAL1"}

oDCCONTATO1 := SingleLineEdit{self,ResourceID{JCEM_CONTATO1,_GetInst()}}
oDCCONTATO1:FieldSpec := padrao_char_22{}
oDCCONTATO1:HyperLabel := HyperLabel{#CONTATO1,"Contato1:",NULL_STRING,"CUREMP_CONTATO1"}

oDCDDD1 := SingleLineEdit{self,ResourceID{JCEM_DDD1,_GetInst()}}
oDCDDD1:FieldSpec := padrao_char_04{}
oDCDDD1:HyperLabel := HyperLabel{#DDD1,"Ddd1:",NULL_STRING,"CUREMP_DDD1"}

oDCTELEFONE1 := SingleLineEdit{self,ResourceID{JCEM_TELEFONE1,_GetInst()}}
oDCTELEFONE1:FieldSpec := padrao_char_12{}
oDCTELEFONE1:HyperLabel := HyperLabel{#TELEFONE1,"Telefone1:",NULL_STRING,"CUREMP_TELEFONE1"}

oDCtheFixedText19 := FixedText{self,ResourceID{JCEM_THEFIXEDTEXT19,_GetInst()}}
oDCtheFixedText19:HyperLabel := HyperLabel{#theFixedText19,"FAX",NULL_STRING,NULL_STRING}

oDCDDDFAX := SingleLineEdit{self,ResourceID{JCEM_DDDFAX,_GetInst()}}
oDCDDDFAX:FieldSpec := padrao_char_04{}
oDCDDDFAX:HyperLabel := HyperLabel{#DDDFAX,"Dddfax:",NULL_STRING,"CUREMP_DDDFAX"}

oDCTELEFAX := SingleLineEdit{self,ResourceID{JCEM_TELEFAX,_GetInst()}}
oDCTELEFAX:FieldSpec := padrao_char_12{}
oDCTELEFAX:HyperLabel := HyperLabel{#TELEFAX,"Telefax:",NULL_STRING,"CUREMP_TELEFAX"}

oDCSITE := SingleLineEdit{self,ResourceID{JCEM_SITE,_GetInst()}}
oDCSITE:FieldSpec := padrao_char_30{}
oDCSITE:HyperLabel := HyperLabel{#SITE,"Site:",NULL_STRING,"CUREMP_SITE"}

oDCSC_EMAIL := FixedText{self,ResourceID{JCEM_SC_EMAIL,_GetInst()}}
oDCSC_EMAIL:HyperLabel := HyperLabel{#SC_EMAIL,"Email:",NULL_STRING,NULL_STRING}

oDCEMAIL := SingleLineEdit{self,ResourceID{JCEM_EMAIL,_GetInst()}}
oDCEMAIL:FieldSpec := padrao_char_30{}
oDCEMAIL:HyperLabel := HyperLabel{#EMAIL,"Email:",NULL_STRING,"CUREMP_EMAIL"}

oDCSC_SITE := FixedText{self,ResourceID{JCEM_SC_SITE,_GetInst()}}
oDCSC_SITE:HyperLabel := HyperLabel{#SC_SITE,"Site:",NULL_STRING,NULL_STRING}

oDCSC_CGC := FixedText{self,ResourceID{JCEM_SC_CGC,_GetInst()}}
oDCSC_CGC:HyperLabel := HyperLabel{#SC_CGC,"CGC/CPF:",NULL_STRING,NULL_STRING}

oDCCGC := SingleLineEdit{self,ResourceID{JCEM_CGC,_GetInst()}}
oDCCGC:FieldSpec := padrao_char_18{}
oDCCGC:HyperLabel := HyperLabel{#CGC,"Cgc:",NULL_STRING,"CUREMP_CGC"}

oDCSC_IESTADUAL := FixedText{self,ResourceID{JCEM_SC_IESTADUAL,_GetInst()}}
oDCSC_IESTADUAL:HyperLabel := HyperLabel{#SC_IESTADUAL,"Ins.Estadual/RG:",NULL_STRING,NULL_STRING}

oDCIESTADUAL := SingleLineEdit{self,ResourceID{JCEM_IESTADUAL,_GetInst()}}
oDCIESTADUAL:FieldSpec := padrao_char_16{}
oDCIESTADUAL:HyperLabel := HyperLabel{#IESTADUAL,"Iestadual:",NULL_STRING,"CUREMP_IESTADUAL"}

oDCCURSO := SingleLineEdit{self,ResourceID{JCEM_CURSO,_GetInst()}}
oDCCURSO:HyperLabel := HyperLabel{#CURSO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCURSO:FieldSpec := padrao_char_20{}

oCCINCLUIR := PushButton{self,ResourceID{JCEM_INCLUIR,_GetInst()}}
oCCINCLUIR:HyperLabel := HyperLabel{#INCLUIR,"Incluir",NULL_STRING,NULL_STRING}

oCCEXCLUIR := PushButton{self,ResourceID{JCEM_EXCLUIR,_GetInst()}}
oCCEXCLUIR:HyperLabel := HyperLabel{#EXCLUIR,"Excluir",NULL_STRING,NULL_STRING}

oDCPESSOA := RadioButtonGroup{self,ResourceID{JCEM_PESSOA,_GetInst()}}
oDCPESSOA:FillUsing({ ;
						{oCCRB1,"F"}, ;
						{oCCRB2,"J"}, ;
						{oCCRB3,"O"} ;
						})
oDCPESSOA:HyperLabel := HyperLabel{#PESSOA,"Pessoa",NULL_STRING,NULL_STRING}
oDCPESSOA:FieldSpec := padrao_char_01{}

self:Caption := "Escolas"
self:HyperLabel := HyperLabel{#JCEM,"Escolas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBCOGNOME := DataColumn{padrao_char_15{}}
oDBCOGNOME:Width := 9
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
self:Browser:AddColumn(oDBCOGNOME)

oDBNOME := DataColumn{padrao_char_40{}}
oDBNOME:Width := 32
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBDDD := DataColumn{padrao_char_04{}}
oDBDDD:Width := 5
oDBDDD:HyperLabel := oDCDDD:HyperLabel 
oDBDDD:Caption := "Ddd:"
self:Browser:AddColumn(oDBDDD)

oDBTELEFONE := DataColumn{padrao_char_12{}}
oDBTELEFONE:Width := 10
oDBTELEFONE:HyperLabel := oDCTELEFONE:HyperLabel 
oDBTELEFONE:Caption := "Telefone:"
self:Browser:AddColumn(oDBTELEFONE)

oDBSITE := DataColumn{padrao_char_30{}}
oDBSITE:Width := 15
oDBSITE:HyperLabel := oDCSITE:HyperLabel 
oDBSITE:Caption := "Site:"
self:Browser:AddColumn(oDBSITE)

oDBEMAIL := DataColumn{padrao_char_30{}}
oDBEMAIL:Width := 27
oDBEMAIL:HyperLabel := oDCEMAIL:HyperLabel 
oDBEMAIL:Caption := "Email:"
self:Browser:AddColumn(oDBEMAIL)


self:ViewAs(#FormView)

oSFJCEI := JCEI{self,JCEM_JCEI}
oSFJCEI:show()

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


access PESSOA() 
return self:FieldGet(#PESSOA)


assign PESSOA(uValue) 
self:FieldPut(#PESSOA, uValue)
return PESSOA := uValue


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


ACCESS theSingleLineEdit22() 
RETURN self:FieldGet(#theSingleLineEdit22)


ACCESS theSingleLineEdit24() 
RETURN self:FieldGet(#theSingleLineEdit24)


END CLASS
