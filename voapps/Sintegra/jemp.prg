#region DEFINES
STATIC DEFINE JEMP_BAIRRO := 103 
STATIC DEFINE JEMP_BUSCANUM := 124 
STATIC DEFINE JEMP_CARGOR := 120 
STATIC DEFINE JEMP_CEP := 106 
STATIC DEFINE JEMP_CGC := 121 
STATIC DEFINE JEMP_CIDADE := 105 
STATIC DEFINE JEMP_CMDCHECKCGC := 130 
STATIC DEFINE JEMP_CMDCHECKIE := 131 
STATIC DEFINE JEMP_CMDCHECKUF := 132 
STATIC DEFINE JEMP_CMDPESSOA := 127 
STATIC DEFINE JEMP_COGNOME := 100 
STATIC DEFINE JEMP_CONTATO := 110 
STATIC DEFINE JEMP_CONTATO1 := 114 
STATIC DEFINE JEMP_DDD := 107 
STATIC DEFINE JEMP_DDD1 := 111 
STATIC DEFINE JEMP_DDDFAX := 115 
STATIC DEFINE JEMP_EMAIL := 117 
STATIC DEFINE JEMP_ENDERECO := 102 
STATIC DEFINE JEMP_ESTADO := 104 
STATIC DEFINE JEMP_FT20 := 149 
STATIC DEFINE JEMP_FT21 := 150 
STATIC DEFINE JEMP_FT22 := 151 
STATIC DEFINE JEMP_FT23 := 152 
STATIC DEFINE JEMP_INSCR := 122 
STATIC DEFINE JEMP_NOME := 101 
STATIC DEFINE JEMP_NUMERO := 135 
STATIC DEFINE JEMP_PESSOA := 128 
STATIC DEFINE JEMP_PORNUM := 123 
STATIC DEFINE JEMP_RAMAL := 109 
STATIC DEFINE JEMP_RAMAL1 := 113 
STATIC DEFINE JEMP_RESPF := 119 
STATIC DEFINE JEMP_SC_BAIRRO := 138 
STATIC DEFINE JEMP_SC_CEP := 140 
STATIC DEFINE JEMP_SC_CIDADE := 139 
STATIC DEFINE JEMP_SC_COGNOME := 133 
STATIC DEFINE JEMP_SC_CONTATO := 145 
STATIC DEFINE JEMP_SC_DDD := 142 
STATIC DEFINE JEMP_SC_ENDERECO := 137 
STATIC DEFINE JEMP_SC_ESTADO := 141 
STATIC DEFINE JEMP_SC_NOME := 136 
STATIC DEFINE JEMP_SC_NUMERO := 134 
STATIC DEFINE JEMP_SC_RAMAL := 144 
STATIC DEFINE JEMP_SC_TELEFAX2 := 126 
STATIC DEFINE JEMP_SC_TELEFAX3 := 125 
STATIC DEFINE JEMP_SC_TELEFAX4 := 129 
STATIC DEFINE JEMP_SC_TELEFONE := 143 
STATIC DEFINE JEMP_SITE := 118 
STATIC DEFINE JEMP_TELEFAX := 116 
STATIC DEFINE JEMP_TELEFONE := 108 
STATIC DEFINE JEMP_TELEFONE1 := 112 
STATIC DEFINE JEMP_THEFIXEDTEXT16 := 146 
STATIC DEFINE JEMP_THEFIXEDTEXT17 := 147 
STATIC DEFINE JEMP_THEFIXEDTEXT18 := 148 
#endregion

class jemp inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCENDERECO as SINGLELINEEDIT
	protect oDCBAIRRO as SINGLELINEEDIT
	protect oDCESTADO as SINGLELINEEDIT
	protect oDCCIDADE as SINGLELINEEDIT
	protect oDCCEP as SINGLELINEEDIT
	protect oDCDDD as SINGLELINEEDIT
	protect oDCTELEFONE as SINGLELINEEDIT
	protect oDCRAMAL as SINGLELINEEDIT
	protect oDCCONTATO as SINGLELINEEDIT
	protect oDCDDD1 as SINGLELINEEDIT
	protect oDCTELEFONE1 as SINGLELINEEDIT
	protect oDCRAMAL1 as SINGLELINEEDIT
	protect oDCCONTATO1 as SINGLELINEEDIT
	protect oDCDDDFAX as SINGLELINEEDIT
	protect oDCTELEFAX as SINGLELINEEDIT
	protect oDCEMAIL as SINGLELINEEDIT
	protect oDCSITE as SINGLELINEEDIT
	protect oDCRESPF as SINGLELINEEDIT
	protect oDCCARGOR as SINGLELINEEDIT
	protect oDCCGC as SINGLELINEEDIT
	protect oDCINSCR as SINGLELINEEDIT
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oDCSC_TELEFAX3 as FIXEDTEXT
	protect oDCSC_TELEFAX2 as FIXEDTEXT
	protect oCCcmdpessoa as PUSHBUTTON
	protect oDCpessoa as SINGLELINEEDIT
	protect oDCSC_TELEFAX4 as FIXEDTEXT
	protect oCCcmdcheckcgc as PUSHBUTTON
	protect oCCcmdcheckie as PUSHBUTTON
	protect oCCcmdcheckuf as PUSHBUTTON
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_ENDERECO as FIXEDTEXT
	protect oDCSC_BAIRRO as FIXEDTEXT
	protect oDCSC_CIDADE as FIXEDTEXT
	protect oDCSC_CEP as FIXEDTEXT
	protect oDCSC_ESTADO as FIXEDTEXT
	protect oDCSC_DDD as FIXEDTEXT
	protect oDCSC_TELEFONE as FIXEDTEXT
	protect oDCSC_RAMAL as FIXEDTEXT
	protect oDCSC_CONTATO as FIXEDTEXT
	protect oDCtheFixedText16 as FIXEDTEXT
	protect oDCtheFixedText17 as FIXEDTEXT
	protect oDCtheFixedText18 as FIXEDTEXT
	protect oDCft20 as FIXEDTEXT
	protect oDCFT21 as FIXEDTEXT
	protect oDCFT22 as FIXEDTEXT
	protect oDCFT23 as FIXEDTEXT
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
// 	instance RESPF 
// 	instance CARGOR 
// 	instance CGC 
// 	instance INSCR 
// 	instance pessoa 
// 	instance NUMERO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD append( ) 	
	alert("Operacao Bloqueada")

access BAIRRO() 
return self:FieldGet(#BAIRRO)


assign BAIRRO(uValue) 
self:FieldPut(#BAIRRO, uValue)
return BAIRRO := uValue


METHOD buscanum( ) 
	SELF:KEYFIND()

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
   ValIE(SELF:SERVER:FIELDGET("ESTADO"),SELF:SERVER:FIELDGET("INSCR"))
ENDIF	
IF cPESSOA="F"
   IF CheckRG(SELF:SERVER:FIELDGET("INSCR"))
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

METHOD cmdpessoa( ) 
			SELF:server:FIELDPUT("PESSOA",SIMNAO(SELF:SERVER:FIELDGET("PESSOA"),{"J","F","O"}))

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


METHOD delete( ) 	
	alert("Operacao Bloqueada")	

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
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jemp",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200,10}}

oDCCOGNOME := SingleLineEdit{self,ResourceID{JEMP_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := padrao_char_12{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:","Cognome","MB01_COGNOME"}

oDCNOME := SingleLineEdit{self,ResourceID{JEMP_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:","Razao Social","MB01_NOME"}
oDCNOME:TooltipText := "Razao Social"

oDCENDERECO := SingleLineEdit{self,ResourceID{JEMP_ENDERECO,_GetInst()}}
oDCENDERECO:FieldSpec := padrao_char_40{}
oDCENDERECO:HyperLabel := HyperLabel{#ENDERECO,"Endereco:","Endereço","MB01_ENDERECO"}
oDCENDERECO:TooltipText := "Endereco"

oDCBAIRRO := SingleLineEdit{self,ResourceID{JEMP_BAIRRO,_GetInst()}}
oDCBAIRRO:FieldSpec := padrao_char_30{}
oDCBAIRRO:HyperLabel := HyperLabel{#BAIRRO,"Bairro:","Bairro","MB01_BAIRRO"}
oDCBAIRRO:TooltipText := "Bairro"

oDCESTADO := SingleLineEdit{self,ResourceID{JEMP_ESTADO,_GetInst()}}
oDCESTADO:FieldSpec := UF_FIELD{}
oDCESTADO:HyperLabel := HyperLabel{#ESTADO,"Numero:","Estado","MB01_NUMERO"}
oDCESTADO:TooltipText := "Estado"

oDCCIDADE := SingleLineEdit{self,ResourceID{JEMP_CIDADE,_GetInst()}}
oDCCIDADE:FieldSpec := padrao_char_30{}
oDCCIDADE:HyperLabel := HyperLabel{#CIDADE,"Cidade:","Cidade","MB01_CIDADE"}
oDCCIDADE:TooltipText := "Cidade"

oDCCEP := SingleLineEdit{self,ResourceID{JEMP_CEP,_GetInst()}}
oDCCEP:FieldSpec := cep_field{}
oDCCEP:HyperLabel := HyperLabel{#CEP,"Cep:","CEP","MB01_CEP"}
oDCCEP:TooltipText := "Cep"

oDCDDD := SingleLineEdit{self,ResourceID{JEMP_DDD,_GetInst()}}
oDCDDD:FieldSpec := ddd_field{}
oDCDDD:HyperLabel := HyperLabel{#DDD,"Ddd:",NULL_STRING,"MB01_DDD"}
oDCDDD:TooltipText := "DDD"

oDCTELEFONE := SingleLineEdit{self,ResourceID{JEMP_TELEFONE,_GetInst()}}
oDCTELEFONE:FieldSpec := PADRAO_CHAR_12{}
oDCTELEFONE:HyperLabel := HyperLabel{#TELEFONE,"Telefone:",NULL_STRING,"MB01_TELEFONE"}
oDCTELEFONE:TooltipText := "Numero do Telefone"

oDCRAMAL := SingleLineEdit{self,ResourceID{JEMP_RAMAL,_GetInst()}}
oDCRAMAL:FieldSpec := padrao_char_04{}
oDCRAMAL:HyperLabel := HyperLabel{#RAMAL,"Ramal:",NULL_STRING,"MB01_RAMAL"}
oDCRAMAL:TooltipText := "Ramal"

oDCCONTATO := SingleLineEdit{self,ResourceID{JEMP_CONTATO,_GetInst()}}
oDCCONTATO:FieldSpec := padrao_char_22{}
oDCCONTATO:HyperLabel := HyperLabel{#CONTATO,"Contato:",NULL_STRING,"MB01_CONTATO"}
oDCCONTATO:TooltipText := "Contato"

oDCDDD1 := SingleLineEdit{self,ResourceID{JEMP_DDD1,_GetInst()}}
oDCDDD1:FieldSpec := ddd_field{}
oDCDDD1:HyperLabel := HyperLabel{#DDD1,"Ddd1:",NULL_STRING,"MB01_DDD1"}
oDCDDD1:TooltipText := "DDD"

oDCTELEFONE1 := SingleLineEdit{self,ResourceID{JEMP_TELEFONE1,_GetInst()}}
oDCTELEFONE1:FieldSpec := PADRAO_CHAR_12{}
oDCTELEFONE1:HyperLabel := HyperLabel{#TELEFONE1,"Telefone1:",NULL_STRING,"MB01_TELEFONE1"}
oDCTELEFONE1:TooltipText := "Telefone"

oDCRAMAL1 := SingleLineEdit{self,ResourceID{JEMP_RAMAL1,_GetInst()}}
oDCRAMAL1:FieldSpec := padrao_char_04{}
oDCRAMAL1:HyperLabel := HyperLabel{#RAMAL1,"Ramal1:",NULL_STRING,"MB01_RAMAL1"}
oDCRAMAL1:TooltipText := "Ramal"

oDCCONTATO1 := SingleLineEdit{self,ResourceID{JEMP_CONTATO1,_GetInst()}}
oDCCONTATO1:FieldSpec := padrao_char_22{}
oDCCONTATO1:HyperLabel := HyperLabel{#CONTATO1,"Contato1:",NULL_STRING,"MB01_CONTATO1"}
oDCCONTATO1:TooltipText := "Contato"

oDCDDDFAX := SingleLineEdit{self,ResourceID{JEMP_DDDFAX,_GetInst()}}
oDCDDDFAX:FieldSpec := ddd_field{}
oDCDDDFAX:HyperLabel := HyperLabel{#DDDFAX,"Dddfax:",NULL_STRING,"MB01_DDDFAX"}
oDCDDDFAX:TooltipText := "Fax"

oDCTELEFAX := SingleLineEdit{self,ResourceID{JEMP_TELEFAX,_GetInst()}}
oDCTELEFAX:FieldSpec := PADRAO_CHAR_12{}
oDCTELEFAX:HyperLabel := HyperLabel{#TELEFAX,"Telefax:",NULL_STRING,"MB01_TELEFAX"}
oDCTELEFAX:TooltipText := "Numero do Fax"

oDCEMAIL := SingleLineEdit{self,ResourceID{JEMP_EMAIL,_GetInst()}}
oDCEMAIL:FieldSpec := EMAIL_FIELD{}
oDCEMAIL:HyperLabel := HyperLabel{#EMAIL,NULL_STRING,NULL_STRING,NULL_STRING}
oDCEMAIL:TooltipText := "Email"

oDCSITE := SingleLineEdit{self,ResourceID{JEMP_SITE,_GetInst()}}
oDCSITE:FieldSpec := padrao_char_30{}
oDCSITE:HyperLabel := HyperLabel{#SITE,NULL_STRING,NULL_STRING,NULL_STRING}
oDCSITE:TooltipText := "Site"

oDCRESPF := SingleLineEdit{self,ResourceID{JEMP_RESPF,_GetInst()}}
oDCRESPF:FieldSpec := padrao_char_30{}
oDCRESPF:HyperLabel := HyperLabel{#RESPF,NULL_STRING,NULL_STRING,NULL_STRING}
oDCRESPF:TooltipText := "Nome do Responsavel"

oDCCARGOR := SingleLineEdit{self,ResourceID{JEMP_CARGOR,_GetInst()}}
oDCCARGOR:FieldSpec := PADRAO_CHAR_30{}
oDCCARGOR:HyperLabel := HyperLabel{#CARGOR,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCARGOR:TooltipText := "Funçao do Responsavel"

oDCCGC := SingleLineEdit{self,ResourceID{JEMP_CGC,_GetInst()}}
oDCCGC:FieldSpec := padrao_char_18{}
oDCCGC:HyperLabel := HyperLabel{#CGC,NULL_STRING,NULL_STRING,"MA01_CODIGO"}
oDCCGC:TooltipText := "Codigo Junto ao Cliente"

oDCINSCR := SingleLineEdit{self,ResourceID{JEMP_INSCR,_GetInst()}}
oDCINSCR:FieldSpec := padrao_char_16{}
oDCINSCR:HyperLabel := HyperLabel{#INSCR,NULL_STRING,NULL_STRING,"MA01_CODIGO"}
oDCINSCR:TooltipText := "Codigo Junto ao Cliente"

oCCpornum := PushButton{self,ResourceID{JEMP_PORNUM,_GetInst()}}
oCCpornum:Image := ico_az{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,"Ordenar por Numero",NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

oCCbuscanum := PushButton{self,ResourceID{JEMP_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ico_find{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,"Localizar Numero",NULL_STRING}
oCCbuscanum:TooltipText := "Clique Para Localizar Por Numero"

oDCSC_TELEFAX3 := FixedText{self,ResourceID{JEMP_SC_TELEFAX3,_GetInst()}}
oDCSC_TELEFAX3:HyperLabel := HyperLabel{#SC_TELEFAX3,"IE/RG",NULL_STRING,NULL_STRING}

oDCSC_TELEFAX2 := FixedText{self,ResourceID{JEMP_SC_TELEFAX2,_GetInst()}}
oDCSC_TELEFAX2:HyperLabel := HyperLabel{#SC_TELEFAX2,"CGC/CPF",NULL_STRING,NULL_STRING}

oCCcmdpessoa := PushButton{self,ResourceID{JEMP_CMDPESSOA,_GetInst()}}
oCCcmdpessoa:HyperLabel := HyperLabel{#cmdpessoa,"FJO",NULL_STRING,NULL_STRING}

oDCpessoa := SingleLineEdit{self,ResourceID{JEMP_PESSOA,_GetInst()}}
oDCpessoa:FieldSpec := padrao_char_01{}
oDCpessoa:HyperLabel := HyperLabel{#pessoa,NULL_STRING,NULL_STRING,"MA01_NUMERO"}
oDCpessoa:TooltipText := "Estado"
oDCpessoa:BackGround := aBrushes[1]
oDCpessoa:Font(aFonts[1], FALSE)

oDCSC_TELEFAX4 := FixedText{self,ResourceID{JEMP_SC_TELEFAX4,_GetInst()}}
oDCSC_TELEFAX4:HyperLabel := HyperLabel{#SC_TELEFAX4,"Pessoa",NULL_STRING,NULL_STRING}

oCCcmdcheckcgc := PushButton{self,ResourceID{JEMP_CMDCHECKCGC,_GetInst()}}
oCCcmdcheckcgc:HyperLabel := HyperLabel{#cmdcheckcgc,"Checar",NULL_STRING,NULL_STRING}

oCCcmdcheckie := PushButton{self,ResourceID{JEMP_CMDCHECKIE,_GetInst()}}
oCCcmdcheckie:HyperLabel := HyperLabel{#cmdcheckie,"Checar",NULL_STRING,NULL_STRING}

oCCcmdcheckuf := PushButton{self,ResourceID{JEMP_CMDCHECKUF,_GetInst()}}
oCCcmdcheckuf:HyperLabel := HyperLabel{#cmdcheckuf,"Checar",NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{self,ResourceID{JEMP_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JEMP_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JEMP_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:","Numero de Cadastramento","MB01_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]
oDCNUMERO:Font(aFonts[1], FALSE)

oDCSC_NOME := FixedText{self,ResourceID{JEMP_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_ENDERECO := FixedText{self,ResourceID{JEMP_SC_ENDERECO,_GetInst()}}
oDCSC_ENDERECO:HyperLabel := HyperLabel{#SC_ENDERECO,"Endereço:",NULL_STRING,NULL_STRING}

oDCSC_BAIRRO := FixedText{self,ResourceID{JEMP_SC_BAIRRO,_GetInst()}}
oDCSC_BAIRRO:HyperLabel := HyperLabel{#SC_BAIRRO,"Bairro:",NULL_STRING,NULL_STRING}

oDCSC_CIDADE := FixedText{self,ResourceID{JEMP_SC_CIDADE,_GetInst()}}
oDCSC_CIDADE:HyperLabel := HyperLabel{#SC_CIDADE,"Cidade:",NULL_STRING,NULL_STRING}

oDCSC_CEP := FixedText{self,ResourceID{JEMP_SC_CEP,_GetInst()}}
oDCSC_CEP:HyperLabel := HyperLabel{#SC_CEP,"Cep:",NULL_STRING,NULL_STRING}

oDCSC_ESTADO := FixedText{self,ResourceID{JEMP_SC_ESTADO,_GetInst()}}
oDCSC_ESTADO:HyperLabel := HyperLabel{#SC_ESTADO,"Estado:",NULL_STRING,NULL_STRING}

oDCSC_DDD := FixedText{self,ResourceID{JEMP_SC_DDD,_GetInst()}}
oDCSC_DDD:HyperLabel := HyperLabel{#SC_DDD,"DDD:",NULL_STRING,NULL_STRING}

oDCSC_TELEFONE := FixedText{self,ResourceID{JEMP_SC_TELEFONE,_GetInst()}}
oDCSC_TELEFONE:HyperLabel := HyperLabel{#SC_TELEFONE,"Telefone:",NULL_STRING,NULL_STRING}

oDCSC_RAMAL := FixedText{self,ResourceID{JEMP_SC_RAMAL,_GetInst()}}
oDCSC_RAMAL:HyperLabel := HyperLabel{#SC_RAMAL,"Ramal:",NULL_STRING,NULL_STRING}

oDCSC_CONTATO := FixedText{self,ResourceID{JEMP_SC_CONTATO,_GetInst()}}
oDCSC_CONTATO:HyperLabel := HyperLabel{#SC_CONTATO,"Contato",NULL_STRING,NULL_STRING}

oDCtheFixedText16 := FixedText{self,ResourceID{JEMP_THEFIXEDTEXT16,_GetInst()}}
oDCtheFixedText16:HyperLabel := HyperLabel{#theFixedText16,"Telefone",NULL_STRING,NULL_STRING}

oDCtheFixedText17 := FixedText{self,ResourceID{JEMP_THEFIXEDTEXT17,_GetInst()}}
oDCtheFixedText17:HyperLabel := HyperLabel{#theFixedText17,"Telefone",NULL_STRING,NULL_STRING}

oDCtheFixedText18 := FixedText{self,ResourceID{JEMP_THEFIXEDTEXT18,_GetInst()}}
oDCtheFixedText18:HyperLabel := HyperLabel{#theFixedText18,"Fax:",NULL_STRING,NULL_STRING}

oDCft20 := FixedText{self,ResourceID{JEMP_FT20,_GetInst()}}
oDCft20:HyperLabel := HyperLabel{#ft20,"Email",NULL_STRING,NULL_STRING}

oDCFT21 := FixedText{self,ResourceID{JEMP_FT21,_GetInst()}}
oDCFT21:HyperLabel := HyperLabel{#FT21,"Site",NULL_STRING,NULL_STRING}

oDCFT22 := FixedText{self,ResourceID{JEMP_FT22,_GetInst()}}
oDCFT22:HyperLabel := HyperLabel{#FT22,"Responsável",NULL_STRING,NULL_STRING}

oDCFT23 := FixedText{self,ResourceID{JEMP_FT23,_GetInst()}}
oDCFT23:HyperLabel := HyperLabel{#FT23,"Cargo do Responsável",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jemp,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 14
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBCOGNOME := DataColumn{padrao_char_12{}}
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


access INSCR() 
return self:FieldGet(#INSCR)


assign INSCR(uValue) 
self:FieldPut(#INSCR, uValue)
return INSCR := uValue


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
	SELF:KEYFIND()


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

END CLASS
