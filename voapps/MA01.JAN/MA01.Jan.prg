#region DEFINES
STATIC DEFINE JANCLI_BAIRRO := 130 
STATIC DEFINE JANCLI_BUSCANUM := 101 
STATIC DEFINE JANCLI_CEP := 136 
STATIC DEFINE JANCLI_CGC := 105 
STATIC DEFINE JANCLI_CIDADE := 134 
STATIC DEFINE JANCLI_CMDCHECKCGC := 113 
STATIC DEFINE JANCLI_CMDCHECKIE := 112 
STATIC DEFINE JANCLI_CMDCHECKUF := 114 
STATIC DEFINE JANCLI_CMDPESSOA := 111 
STATIC DEFINE JANCLI_CODIGO := 103 
STATIC DEFINE JANCLI_CODIGOINT := 117 
STATIC DEFINE JANCLI_COGNOME := 124 
STATIC DEFINE JANCLI_COMPRADOR := 155 
STATIC DEFINE JANCLI_CONTATO := 143 
STATIC DEFINE JANCLI_CONTATO1 := 147 
STATIC DEFINE JANCLI_DDD := 140 
STATIC DEFINE JANCLI_DDD1 := 144 
STATIC DEFINE JANCLI_DDDFAX := 149 
STATIC DEFINE JANCLI_EMAIL := 115 
STATIC DEFINE JANCLI_ENDERECO := 128 
STATIC DEFINE JANCLI_ESTADO := 132 
STATIC DEFINE JANCLI_FT15 := 153 
STATIC DEFINE JANCLI_FT16 := 104 
STATIC DEFINE JANCLI_FT17 := 118 
STATIC DEFINE JANCLI_FT18 := 120 
STATIC DEFINE JANCLI_GRUPOEMP := 119 
STATIC DEFINE JANCLI_INSCR := 106 
STATIC DEFINE JANCLI_NOME := 126 
STATIC DEFINE JANCLI_NUMERO := 123 
STATIC DEFINE JANCLI_PESSOA := 110 
STATIC DEFINE JANCLI_PORNUM := 100 
STATIC DEFINE JANCLI_RAMAL := 142 
STATIC DEFINE JANCLI_RAMAL1 := 146 
STATIC DEFINE JANCLI_SC_BAIRRO := 129 
STATIC DEFINE JANCLI_SC_CEP := 135 
STATIC DEFINE JANCLI_SC_CIDADE := 133 
STATIC DEFINE JANCLI_SC_CIDADE1 := 116 
STATIC DEFINE JANCLI_SC_COGNOME := 122 
STATIC DEFINE JANCLI_SC_COMPRADOR := 152 
STATIC DEFINE JANCLI_SC_CONTATO := 139 
STATIC DEFINE JANCLI_SC_CONTATO1 := 130 
STATIC DEFINE JANCLI_SC_DDD1 := 124 
STATIC DEFINE JANCLI_SC_DDDFAX := 136 
STATIC DEFINE JANCLI_SC_ENDERECO := 127 
STATIC DEFINE JANCLI_SC_ESTADO := 131 
STATIC DEFINE JANCLI_SC_NOME := 125 
STATIC DEFINE JANCLI_SC_NUMERO := 121 
STATIC DEFINE JANCLI_SC_RAMAL := 138 
STATIC DEFINE JANCLI_SC_RAMAL1 := 128 
STATIC DEFINE JANCLI_SC_TELEFAX := 148 
STATIC DEFINE JANCLI_SC_TELEFAX1 := 102 
STATIC DEFINE JANCLI_SC_TELEFAX2 := 107 
STATIC DEFINE JANCLI_SC_TELEFAX3 := 108 
STATIC DEFINE JANCLI_SC_TELEFAX4 := 109 
STATIC DEFINE JANCLI_SC_TELEFONE := 137 
STATIC DEFINE JANCLI_SC_TELEFONE1 := 126 
STATIC DEFINE JANCLI_SC_ZONA := 151 
STATIC DEFINE JANCLI_TELEFAX := 150 
STATIC DEFINE JANCLI_TELEFONE := 141 
STATIC DEFINE JANCLI_TELEFONE1 := 145 
STATIC DEFINE JANCLI_VENDEDOR := 156 
STATIC DEFINE JANCLI_ZONA := 154 
#endregion

class JANCLI inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBDDD as DataColumn
	PROTECT oDBTELEFONE as DataColumn
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oDCSC_TELEFAX1 as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCFT16 as FIXEDTEXT
	protect oDCCGC as SINGLELINEEDIT
	protect oDCINSCR as SINGLELINEEDIT
	protect oDCSC_TELEFAX2 as FIXEDTEXT
	protect oDCSC_TELEFAX3 as FIXEDTEXT
	protect oDCSC_TELEFAX4 as FIXEDTEXT
	protect oDCpessoa as SINGLELINEEDIT
	protect oCCcmdpessoa as PUSHBUTTON
	protect oCCcmdcheckie as PUSHBUTTON
	protect oCCcmdcheckcgc as PUSHBUTTON
	protect oCCCMDCHECKUF as PUSHBUTTON
	protect oDCEMAIL as SINGLELINEEDIT
	protect oDCSC_CIDADE1 as FIXEDTEXT
	protect oDCCODIGOINT as SINGLELINEEDIT
	protect oDCFT17 as FIXEDTEXT
	protect oDCGRUPOEMP as SINGLELINEEDIT
	protect oDCFT18 as FIXEDTEXT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSC_ENDERECO as FIXEDTEXT
	protect oDCENDERECO as SINGLELINEEDIT
	protect oDCSC_BAIRRO as FIXEDTEXT
	protect oDCBAIRRO as SINGLELINEEDIT
	protect oDCSC_ESTADO as FIXEDTEXT
	protect oDCESTADO as SINGLELINEEDIT
	protect oDCSC_CIDADE as FIXEDTEXT
	protect oDCCIDADE as SINGLELINEEDIT
	protect oDCSC_CEP as FIXEDTEXT
	protect oDCCEP as SINGLELINEEDIT
	protect oDCSC_TELEFONE as FIXEDTEXT
	protect oDCSC_RAMAL as FIXEDTEXT
	protect oDCSC_CONTATO as FIXEDTEXT
	protect oDCDDD as SINGLELINEEDIT
	protect oDCTELEFONE as SINGLELINEEDIT
	protect oDCRAMAL as SINGLELINEEDIT
	protect oDCCONTATO as SINGLELINEEDIT
	protect oDCDDD1 as SINGLELINEEDIT
	protect oDCTELEFONE1 as SINGLELINEEDIT
	protect oDCRAMAL1 as SINGLELINEEDIT
	protect oDCCONTATO1 as SINGLELINEEDIT
	protect oDCSC_TELEFAX as FIXEDTEXT
	protect oDCDDDFAX as SINGLELINEEDIT
	protect oDCTELEFAX as SINGLELINEEDIT
	protect oDCSC_ZONA as FIXEDTEXT
	protect oDCSC_COMPRADOR as FIXEDTEXT
	protect oDCFT15 as FIXEDTEXT
	protect oDCZONA as SINGLELINEEDIT
	protect oDCCOMPRADOR as SINGLELINEEDIT
	protect oDCVENDEDOR as SINGLELINEEDIT
// 	instance CODIGO 
// 	instance CGC 
// 	instance INSCR 
// 	instance pessoa 
// 	instance EMAIL 
// 	instance CODIGOINT 
// 	instance GRUPOEMP 
// 	instance NUMERO 
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
// 	instance ZONA 
// 	instance COMPRADOR 
// 	instance VENDEDOR 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD APPEND(lINC) 
IF ValType(lINC)#"L"
   lINC:=FALSE
ENDIF	
IF .NOT. lINC
  alert("inclusao bloqueada")
ELSE
	SUPER:Append()
ENDIF


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

METHOD CMDCHECKUF( ) 
	ufCheck(SELF:SERVER:FIELDGET("ESTADO"))

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("MA","")	

METHOD cmdpessoa( ) 
	SELF:server:FIELDPUT("PESSOA",SIMNAO(SELF:SERVER:FIELDGET("PESSOA"),{"J","F","O"}))

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODIGOINT() 
return self:FieldGet(#CODIGOINT)


assign CODIGOINT(uValue) 
self:FieldPut(#CODIGOINT, uValue)
return CODIGOINT := uValue


access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


access COMPRADOR() 
return self:FieldGet(#COMPRADOR)


assign COMPRADOR(uValue) 
self:FieldPut(#COMPRADOR, uValue)
return COMPRADOR := uValue


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
 alert("exclusao bloqueada"	)

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


access GRUPOEMP() 
return self:FieldGet(#GRUPOEMP)


assign GRUPOEMP(uValue) 
self:FieldPut(#GRUPOEMP, uValue)
return GRUPOEMP := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JANCLI",_GetInst()},iCtlID)

oCCpornum := PushButton{self,ResourceID{JANCLI_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

oCCbuscanum := PushButton{self,ResourceID{JANCLI_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Clique Para Localizar Por Numero"

oDCSC_TELEFAX1 := FixedText{self,ResourceID{JANCLI_SC_TELEFAX1,_GetInst()}}
oDCSC_TELEFAX1:HyperLabel := HyperLabel{#SC_TELEFAX1,"DDD",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JANCLI_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_15{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Cognome:",NULL_STRING,"MA01_CODIGO"}
oDCCODIGO:TooltipText := "Codigo Junto ao Cliente"

oDCFT16 := FixedText{self,ResourceID{JANCLI_FT16,_GetInst()}}
oDCFT16:HyperLabel := HyperLabel{#FT16,"Codigo Junto ao Cliente",NULL_STRING,NULL_STRING}

oDCCGC := SingleLineEdit{self,ResourceID{JANCLI_CGC,_GetInst()}}
oDCCGC:FieldSpec := padrao_char_18{}
oDCCGC:HyperLabel := HyperLabel{#CGC,NULL_STRING,NULL_STRING,"MA01_CODIGO"}
oDCCGC:TooltipText := "Codigo Junto ao Cliente"

oDCINSCR := SingleLineEdit{self,ResourceID{JANCLI_INSCR,_GetInst()}}
oDCINSCR:FieldSpec := padrao_char_16{}
oDCINSCR:HyperLabel := HyperLabel{#INSCR,NULL_STRING,NULL_STRING,"MA01_CODIGO"}
oDCINSCR:TooltipText := "Codigo Junto ao Cliente"

oDCSC_TELEFAX2 := FixedText{self,ResourceID{JANCLI_SC_TELEFAX2,_GetInst()}}
oDCSC_TELEFAX2:HyperLabel := HyperLabel{#SC_TELEFAX2,"CGC/CPF",NULL_STRING,NULL_STRING}

oDCSC_TELEFAX3 := FixedText{self,ResourceID{JANCLI_SC_TELEFAX3,_GetInst()}}
oDCSC_TELEFAX3:HyperLabel := HyperLabel{#SC_TELEFAX3,"IE/RG",NULL_STRING,NULL_STRING}

oDCSC_TELEFAX4 := FixedText{self,ResourceID{JANCLI_SC_TELEFAX4,_GetInst()}}
oDCSC_TELEFAX4:HyperLabel := HyperLabel{#SC_TELEFAX4,"Pessoa",NULL_STRING,NULL_STRING}

oDCpessoa := SingleLineEdit{self,ResourceID{JANCLI_PESSOA,_GetInst()}}
oDCpessoa:FieldSpec := padrao_char_01{}
oDCpessoa:HyperLabel := HyperLabel{#pessoa,NULL_STRING,NULL_STRING,"MA01_NUMERO"}
oDCpessoa:TooltipText := "Estado"

oCCcmdpessoa := PushButton{self,ResourceID{JANCLI_CMDPESSOA,_GetInst()}}
oCCcmdpessoa:HyperLabel := HyperLabel{#cmdpessoa,"FJO",NULL_STRING,NULL_STRING}

oCCcmdcheckie := PushButton{self,ResourceID{JANCLI_CMDCHECKIE,_GetInst()}}
oCCcmdcheckie:HyperLabel := HyperLabel{#cmdcheckie,"Checar",NULL_STRING,NULL_STRING}

oCCcmdcheckcgc := PushButton{self,ResourceID{JANCLI_CMDCHECKCGC,_GetInst()}}
oCCcmdcheckcgc:HyperLabel := HyperLabel{#cmdcheckcgc,"Checar",NULL_STRING,NULL_STRING}

oCCCMDCHECKUF := PushButton{self,ResourceID{JANCLI_CMDCHECKUF,_GetInst()}}
oCCCMDCHECKUF:HyperLabel := HyperLabel{#CMDCHECKUF,"Checar",NULL_STRING,NULL_STRING}

oDCEMAIL := SingleLineEdit{self,ResourceID{JANCLI_EMAIL,_GetInst()}}
oDCEMAIL:FieldSpec := EMAIL_FIELD{}
oDCEMAIL:HyperLabel := HyperLabel{#EMAIL,NULL_STRING,NULL_STRING,"MC02_CIDADE"}

oDCSC_CIDADE1 := FixedText{self,ResourceID{JANCLI_SC_CIDADE1,_GetInst()}}
oDCSC_CIDADE1:HyperLabel := HyperLabel{#SC_CIDADE1,"eMAIL:",NULL_STRING,NULL_STRING}

oDCCODIGOINT := SingleLineEdit{self,ResourceID{JANCLI_CODIGOINT,_GetInst()}}
oDCCODIGOINT:FieldSpec := padrao_char_15{}
oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT,"Cognome:",NULL_STRING,"MA01_CODIGO"}
oDCCODIGOINT:TooltipText := "Codigo Junto ao Cliente"

oDCFT17 := FixedText{self,ResourceID{JANCLI_FT17,_GetInst()}}
oDCFT17:HyperLabel := HyperLabel{#FT17,"Codigo Interno LX",NULL_STRING,NULL_STRING}

oDCGRUPOEMP := SingleLineEdit{self,ResourceID{JANCLI_GRUPOEMP,_GetInst()}}
oDCGRUPOEMP:FieldSpec := padrao_char_15{}
oDCGRUPOEMP:HyperLabel := HyperLabel{#GRUPOEMP,"Grupo Emtp",NULL_STRING,"MA01_CODIGO"}
oDCGRUPOEMP:TooltipText := "Codigo Junto ao Cliente"

oDCFT18 := FixedText{self,ResourceID{JANCLI_FT18,_GetInst()}}
oDCFT18:HyperLabel := HyperLabel{#FT18,"Grupo Emp",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JANCLI_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{self,ResourceID{JANCLI_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JANCLI_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"MA01_NUMERO"}
oDCNUMERO:TooltipText := "Numero de Cadastramento"

oDCCOGNOME := SingleLineEdit{self,ResourceID{JANCLI_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := padrao_char_12{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"MA01_COGNOME"}
oDCCOGNOME:TooltipText := "Cognome"

oDCSC_NOME := FixedText{self,ResourceID{JANCLI_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JANCLI_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_50{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MA01_NOME"}
oDCNOME:TooltipText := "Razao Socail"

oDCSC_ENDERECO := FixedText{self,ResourceID{JANCLI_SC_ENDERECO,_GetInst()}}
oDCSC_ENDERECO:HyperLabel := HyperLabel{#SC_ENDERECO,"Endereço:",NULL_STRING,NULL_STRING}

oDCENDERECO := SingleLineEdit{self,ResourceID{JANCLI_ENDERECO,_GetInst()}}
oDCENDERECO:FieldSpec := padrao_char_40{}
oDCENDERECO:HyperLabel := HyperLabel{#ENDERECO,"Endereco:",NULL_STRING,"MA01_ENDERECO"}
oDCENDERECO:TooltipText := "Endereço"

oDCSC_BAIRRO := FixedText{self,ResourceID{JANCLI_SC_BAIRRO,_GetInst()}}
oDCSC_BAIRRO:HyperLabel := HyperLabel{#SC_BAIRRO,"Bairro:",NULL_STRING,NULL_STRING}

oDCBAIRRO := SingleLineEdit{self,ResourceID{JANCLI_BAIRRO,_GetInst()}}
oDCBAIRRO:FieldSpec := padrao_char_30{}
oDCBAIRRO:HyperLabel := HyperLabel{#BAIRRO,"Bairro:",NULL_STRING,"MA01_BAIRRO"}
oDCBAIRRO:TooltipText := "Bairro"

oDCSC_ESTADO := FixedText{self,ResourceID{JANCLI_SC_ESTADO,_GetInst()}}
oDCSC_ESTADO:HyperLabel := HyperLabel{#SC_ESTADO,"Estado:",NULL_STRING,NULL_STRING}

oDCESTADO := SingleLineEdit{self,ResourceID{JANCLI_ESTADO,_GetInst()}}
oDCESTADO:FieldSpec := uf_field{}
oDCESTADO:HyperLabel := HyperLabel{#ESTADO,"Numero:",NULL_STRING,"MA01_NUMERO"}
oDCESTADO:TooltipText := "Digite  o Estado"

oDCSC_CIDADE := FixedText{self,ResourceID{JANCLI_SC_CIDADE,_GetInst()}}
oDCSC_CIDADE:HyperLabel := HyperLabel{#SC_CIDADE,"Cidade:",NULL_STRING,NULL_STRING}

oDCCIDADE := SingleLineEdit{self,ResourceID{JANCLI_CIDADE,_GetInst()}}
oDCCIDADE:FieldSpec := padrao_char_30{}
oDCCIDADE:HyperLabel := HyperLabel{#CIDADE,"Cidade:",NULL_STRING,"MA01_CIDADE"}
oDCCIDADE:TooltipText := "Cidade"

oDCSC_CEP := FixedText{self,ResourceID{JANCLI_SC_CEP,_GetInst()}}
oDCSC_CEP:HyperLabel := HyperLabel{#SC_CEP,"Cep:",NULL_STRING,NULL_STRING}

oDCCEP := SingleLineEdit{self,ResourceID{JANCLI_CEP,_GetInst()}}
oDCCEP:FieldSpec := padrao_char_09{}
oDCCEP:HyperLabel := HyperLabel{#CEP,"Cep:",NULL_STRING,"MA01_CEP"}
oDCCEP:TooltipText := "CEP"

oDCSC_TELEFONE := FixedText{self,ResourceID{JANCLI_SC_TELEFONE,_GetInst()}}
oDCSC_TELEFONE:HyperLabel := HyperLabel{#SC_TELEFONE,"Telefone:",NULL_STRING,NULL_STRING}

oDCSC_RAMAL := FixedText{self,ResourceID{JANCLI_SC_RAMAL,_GetInst()}}
oDCSC_RAMAL:HyperLabel := HyperLabel{#SC_RAMAL,"Ramal:",NULL_STRING,NULL_STRING}

oDCSC_CONTATO := FixedText{self,ResourceID{JANCLI_SC_CONTATO,_GetInst()}}
oDCSC_CONTATO:HyperLabel := HyperLabel{#SC_CONTATO,"Contato:",NULL_STRING,NULL_STRING}

oDCDDD := SingleLineEdit{self,ResourceID{JANCLI_DDD,_GetInst()}}
oDCDDD:FieldSpec := padrao_char_03{}
oDCDDD:HyperLabel := HyperLabel{#DDD,"Ddd:",NULL_STRING,"MA01_DDD"}
oDCDDD:TooltipText := "Codigo DDD"

oDCTELEFONE := SingleLineEdit{self,ResourceID{JANCLI_TELEFONE,_GetInst()}}
oDCTELEFONE:FieldSpec := padrao_char_12{}
oDCTELEFONE:HyperLabel := HyperLabel{#TELEFONE,"Telefone:",NULL_STRING,"MA01_TELEFONE"}
oDCTELEFONE:TooltipText := "Numero do Telefone"

oDCRAMAL := SingleLineEdit{self,ResourceID{JANCLI_RAMAL,_GetInst()}}
oDCRAMAL:FieldSpec := padrao_char_04{}
oDCRAMAL:HyperLabel := HyperLabel{#RAMAL,"Ramal:",NULL_STRING,"MA01_RAMAL"}
oDCRAMAL:TooltipText := "Ramal"

oDCCONTATO := SingleLineEdit{self,ResourceID{JANCLI_CONTATO,_GetInst()}}
oDCCONTATO:FieldSpec := padrao_char_22{}
oDCCONTATO:HyperLabel := HyperLabel{#CONTATO,"Contato:",NULL_STRING,"MA01_CONTATO"}
oDCCONTATO:TooltipText := "Nome do Contato"

oDCDDD1 := SingleLineEdit{self,ResourceID{JANCLI_DDD1,_GetInst()}}
oDCDDD1:FieldSpec := padrao_char_03{}
oDCDDD1:HyperLabel := HyperLabel{#DDD1,"Ddd1:",NULL_STRING,"MA01_DDD1"}
oDCDDD1:TooltipText := "Codigo DDD"

oDCTELEFONE1 := SingleLineEdit{self,ResourceID{JANCLI_TELEFONE1,_GetInst()}}
oDCTELEFONE1:FieldSpec := padrao_char_12{}
oDCTELEFONE1:HyperLabel := HyperLabel{#TELEFONE1,"Telefone1:",NULL_STRING,"MA01_TELEFONE1"}
oDCTELEFONE1:TooltipText := "Numero do Telefone"

oDCRAMAL1 := SingleLineEdit{self,ResourceID{JANCLI_RAMAL1,_GetInst()}}
oDCRAMAL1:FieldSpec := padrao_char_04{}
oDCRAMAL1:HyperLabel := HyperLabel{#RAMAL1,"Ramal1:",NULL_STRING,"MA01_RAMAL1"}
oDCRAMAL1:TooltipText := "Ramal"

oDCCONTATO1 := SingleLineEdit{self,ResourceID{JANCLI_CONTATO1,_GetInst()}}
oDCCONTATO1:FieldSpec := padrao_char_22{}
oDCCONTATO1:HyperLabel := HyperLabel{#CONTATO1,"Contato1:",NULL_STRING,"MA01_CONTATO1"}
oDCCONTATO1:TooltipText := "Nome do Contato"

oDCSC_TELEFAX := FixedText{self,ResourceID{JANCLI_SC_TELEFAX,_GetInst()}}
oDCSC_TELEFAX:HyperLabel := HyperLabel{#SC_TELEFAX,"Telefax:",NULL_STRING,NULL_STRING}

oDCDDDFAX := SingleLineEdit{self,ResourceID{JANCLI_DDDFAX,_GetInst()}}
oDCDDDFAX:FieldSpec := padrao_char_03{}
oDCDDDFAX:HyperLabel := HyperLabel{#DDDFAX,"Dddfax:",NULL_STRING,"MA01_DDDFAX"}
oDCDDDFAX:TooltipText := "Codigo DDD"

oDCTELEFAX := SingleLineEdit{self,ResourceID{JANCLI_TELEFAX,_GetInst()}}
oDCTELEFAX:FieldSpec := padrao_char_12{}
oDCTELEFAX:HyperLabel := HyperLabel{#TELEFAX,"Telefax:",NULL_STRING,"MA01_TELEFAX"}
oDCTELEFAX:TooltipText := "Numero do Fax"

oDCSC_ZONA := FixedText{self,ResourceID{JANCLI_SC_ZONA,_GetInst()}}
oDCSC_ZONA:HyperLabel := HyperLabel{#SC_ZONA,"Zona:",NULL_STRING,NULL_STRING}

oDCSC_COMPRADOR := FixedText{self,ResourceID{JANCLI_SC_COMPRADOR,_GetInst()}}
oDCSC_COMPRADOR:HyperLabel := HyperLabel{#SC_COMPRADOR,"Comprador:",NULL_STRING,NULL_STRING}

oDCFT15 := FixedText{self,ResourceID{JANCLI_FT15,_GetInst()}}
oDCFT15:HyperLabel := HyperLabel{#FT15,"Vendedor",NULL_STRING,NULL_STRING}

oDCZONA := SingleLineEdit{self,ResourceID{JANCLI_ZONA,_GetInst()}}
oDCZONA:FieldSpec := padrao_char_06{}
oDCZONA:HyperLabel := HyperLabel{#ZONA,"Cognome:",NULL_STRING,"MA01_COGNOME"}
oDCZONA:TooltipText := "Zona de Vensas"

oDCCOMPRADOR := SingleLineEdit{self,ResourceID{JANCLI_COMPRADOR,_GetInst()}}
oDCCOMPRADOR:FieldSpec := padrao_char_05{}
oDCCOMPRADOR:HyperLabel := HyperLabel{#COMPRADOR,"Cognome:",NULL_STRING,"MA01_COGNOME"}
oDCCOMPRADOR:TooltipText := "Codigo do Comprador"

oDCVENDEDOR := SingleLineEdit{self,ResourceID{JANCLI_VENDEDOR,_GetInst()}}
oDCVENDEDOR:FieldSpec := padrao_char_05{}
oDCVENDEDOR:HyperLabel := HyperLabel{#VENDEDOR,"Cognome:",NULL_STRING,"MA01_COGNOME"}
oDCVENDEDOR:TooltipText := "Codigo do Vendedor"

self:Caption := "Cadastro de Clientes"
self:HyperLabel := HyperLabel{#JANCLI,"Cadastro de Clientes",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{PADRAO_num_08{}}
oDBNUMERO:Width := 11
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBCOGNOME := DataColumn{padrao_char_12{}}
oDBCOGNOME:Width := 17
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
self:Browser:AddColumn(oDBCOGNOME)

oDBNOME := DataColumn{padrao_char_50{}}
oDBNOME:Width := 26
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBDDD := DataColumn{padrao_char_03{}}
oDBDDD:Width := 6
oDBDDD:HyperLabel := oDCDDD:HyperLabel 
oDBDDD:Caption := "Ddd:"
self:Browser:AddColumn(oDBDDD)

oDBTELEFONE := DataColumn{padrao_char_12{}}
oDBTELEFONE:Width := 10
oDBTELEFONE:HyperLabel := oDCTELEFONE:HyperLabel 
oDBTELEFONE:Caption := "Telefone:"
self:Browser:AddColumn(oDBTELEFONE)


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
