#region DEFINES
STATIC DEFINE JCNPJIE_BUSCANUM := 104 
STATIC DEFINE JCNPJIE_CATEGORIA := 118 
STATIC DEFINE JCNPJIE_CNAE := 112 
STATIC DEFINE JCNPJIE_CNPJ := 100 
STATIC DEFINE JCNPJIE_DATA := 108 
STATIC DEFINE JCNPJIE_FIXEDTEXT1 := 102 
STATIC DEFINE JCNPJIE_FIXEDTEXT2 := 103 
STATIC DEFINE JCNPJIE_FIXEDTEXT3 := 107 
STATIC DEFINE JCNPJIE_FIXEDTEXT4 := 109 
STATIC DEFINE JCNPJIE_FIXEDTEXT5 := 111 
STATIC DEFINE JCNPJIE_FIXEDTEXT6 := 113 
STATIC DEFINE JCNPJIE_FIXEDTEXT7 := 115 
STATIC DEFINE JCNPJIE_FIXEDTEXT8 := 117 
STATIC DEFINE JCNPJIE_FIXEDTEXT9 := 119 
STATIC DEFINE JCNPJIE_IE := 101 
STATIC DEFINE JCNPJIE_MUNICIPIO := 114 
STATIC DEFINE JCNPJIE_NOME := 116 
STATIC DEFINE JCNPJIE_PORNUM := 105 
STATIC DEFINE JCNPJIE_SITUACAO := 106 
STATIC DEFINE JCNPJIE_UF := 110 
#endregion

class jcnpjie inherit MYDataWindow 

	PROTECT oDBCNPJ as DataColumn
	PROTECT oDBIE as DataColumn
	protect oDCCNPJ as SINGLELINEEDIT
	protect oDCIE as SINGLELINEEDIT
	protect oDCFixedText1 as FIXEDTEXT
	protect oDCFixedText2 as FIXEDTEXT
	protect oCCbuscanum as PUSHBUTTON
	protect oCCpornum as PUSHBUTTON
	protect oDCSITUACAO as SINGLELINEEDIT
	protect oDCFixedText3 as FIXEDTEXT
	protect oDCDATA as SINGLELINEEDIT
	protect oDCFixedText4 as FIXEDTEXT
	protect oDCUF as SINGLELINEEDIT
	protect oDCFixedText5 as FIXEDTEXT
	protect oDCCNAE as SINGLELINEEDIT
	protect oDCFixedText6 as FIXEDTEXT
	protect oDCMUNICIPIO as SINGLELINEEDIT
	protect oDCFixedText7 as FIXEDTEXT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCFixedText8 as FIXEDTEXT
	protect oDCCATEGORIA as SINGLELINEEDIT
	protect oDCFixedText9 as FIXEDTEXT
// 	instance CNPJ 
// 	instance IE 
// 	instance SITUACAO 
// 	instance DATA 
// 	instance UF 
// 	instance CNAE 
// 	instance MUNICIPIO 
// 	instance NOME 
// 	instance CATEGORIA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD buscanum( ) 
	SELF:KEYFIND()


access CATEGORIA() 
return self:FieldGet(#CATEGORIA)


assign CATEGORIA(uValue) 
self:FieldPut(#CATEGORIA, uValue)
return CATEGORIA := uValue


METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()	

access CNAE() 
return self:FieldGet(#CNAE)


assign CNAE(uValue) 
self:FieldPut(#CNAE, uValue)
return CNAE := uValue


access CNPJ() 
return self:FieldGet(#CNPJ)


assign CNPJ(uValue) 
self:FieldPut(#CNPJ, uValue)
return CNPJ := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access IE() 
return self:FieldGet(#IE)


assign IE(uValue) 
self:FieldPut(#IE, uValue)
return IE := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcnpjie",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200,10}}

oDCCNPJ := SingleLineEdit{self,ResourceID{JCNPJIE_CNPJ,_GetInst()}}
oDCCNPJ:HyperLabel := HyperLabel{#CNPJ,"CNPJ",NULL_STRING,NULL_STRING}
oDCCNPJ:BackGround := aBrushes[1]
oDCCNPJ:Font(aFonts[1], FALSE)

oDCIE := SingleLineEdit{self,ResourceID{JCNPJIE_IE,_GetInst()}}
oDCIE:HyperLabel := HyperLabel{#IE,"IE",NULL_STRING,NULL_STRING}
oDCIE:BackGround := aBrushes[1]
oDCIE:Font(aFonts[1], FALSE)

oDCFixedText1 := FixedText{self,ResourceID{JCNPJIE_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"CGC/CPF",NULL_STRING,NULL_STRING}

oDCFixedText2 := FixedText{self,ResourceID{JCNPJIE_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"IE/RG",NULL_STRING,NULL_STRING}

oCCbuscanum := PushButton{self,ResourceID{JCNPJIE_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Clique Para Localizar Por Numero"

oCCpornum := PushButton{self,ResourceID{JCNPJIE_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

oDCSITUACAO := SingleLineEdit{self,ResourceID{JCNPJIE_SITUACAO,_GetInst()}}
oDCSITUACAO:HyperLabel := HyperLabel{#SITUACAO,"IE",NULL_STRING,NULL_STRING}
oDCSITUACAO:BackGround := aBrushes[1]
oDCSITUACAO:Font(aFonts[1], FALSE)

oDCFixedText3 := FixedText{self,ResourceID{JCNPJIE_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"situacao",NULL_STRING,NULL_STRING}

oDCDATA := SingleLineEdit{self,ResourceID{JCNPJIE_DATA,_GetInst()}}
oDCDATA:HyperLabel := HyperLabel{#DATA,"IE",NULL_STRING,NULL_STRING}
oDCDATA:BackGround := aBrushes[1]
oDCDATA:Font(aFonts[1], FALSE)

oDCFixedText4 := FixedText{self,ResourceID{JCNPJIE_FIXEDTEXT4,_GetInst()}}
oDCFixedText4:HyperLabel := HyperLabel{#FixedText4,"Data",NULL_STRING,NULL_STRING}

oDCUF := SingleLineEdit{self,ResourceID{JCNPJIE_UF,_GetInst()}}
oDCUF:HyperLabel := HyperLabel{#UF,"IE",NULL_STRING,NULL_STRING}
oDCUF:BackGround := aBrushes[1]
oDCUF:Font(aFonts[1], FALSE)

oDCFixedText5 := FixedText{self,ResourceID{JCNPJIE_FIXEDTEXT5,_GetInst()}}
oDCFixedText5:HyperLabel := HyperLabel{#FixedText5,"UF",NULL_STRING,NULL_STRING}

oDCCNAE := SingleLineEdit{self,ResourceID{JCNPJIE_CNAE,_GetInst()}}
oDCCNAE:HyperLabel := HyperLabel{#CNAE,"IE",NULL_STRING,NULL_STRING}
oDCCNAE:BackGround := aBrushes[1]
oDCCNAE:Font(aFonts[1], FALSE)

oDCFixedText6 := FixedText{self,ResourceID{JCNPJIE_FIXEDTEXT6,_GetInst()}}
oDCFixedText6:HyperLabel := HyperLabel{#FixedText6,"CNAE",NULL_STRING,NULL_STRING}

oDCMUNICIPIO := SingleLineEdit{self,ResourceID{JCNPJIE_MUNICIPIO,_GetInst()}}
oDCMUNICIPIO:HyperLabel := HyperLabel{#MUNICIPIO,"IE",NULL_STRING,NULL_STRING}
oDCMUNICIPIO:BackGround := aBrushes[1]
oDCMUNICIPIO:Font(aFonts[1], FALSE)

oDCFixedText7 := FixedText{self,ResourceID{JCNPJIE_FIXEDTEXT7,_GetInst()}}
oDCFixedText7:HyperLabel := HyperLabel{#FixedText7,"Municipio",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JCNPJIE_NOME,_GetInst()}}
oDCNOME:HyperLabel := HyperLabel{#NOME,NULL_STRING,NULL_STRING,NULL_STRING}
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[1], FALSE)

oDCFixedText8 := FixedText{self,ResourceID{JCNPJIE_FIXEDTEXT8,_GetInst()}}
oDCFixedText8:HyperLabel := HyperLabel{#FixedText8,"Nome",NULL_STRING,NULL_STRING}

oDCCATEGORIA := SingleLineEdit{self,ResourceID{JCNPJIE_CATEGORIA,_GetInst()}}
oDCCATEGORIA:HyperLabel := HyperLabel{#CATEGORIA,"IE",NULL_STRING,NULL_STRING}
oDCCATEGORIA:BackGround := aBrushes[1]
oDCCATEGORIA:Font(aFonts[1], FALSE)

oDCFixedText9 := FixedText{self,ResourceID{JCNPJIE_FIXEDTEXT9,_GetInst()}}
oDCFixedText9:HyperLabel := HyperLabel{#FixedText9,"Categoria",NULL_STRING,NULL_STRING}

self:Caption := "CNPJ CPF / IE RG"
self:HyperLabel := HyperLabel{#jcnpjie,"CNPJ CPF / IE RG",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCNPJ := DataColumn{28}
oDBCNPJ:Width := 28
oDBCNPJ:HyperLabel := oDCCNPJ:HyperLabel 
oDBCNPJ:Caption := "CNPJ"
oDBCNPJ:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCNPJ)

oDBIE := DataColumn{33}
oDBIE:Width := 33
oDBIE:HyperLabel := oDCIE:HyperLabel 
oDBIE:Caption := "IE"
oDBIE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBIE)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MUNICIPIO() 
return self:FieldGet(#MUNICIPIO)


assign MUNICIPIO(uValue) 
self:FieldPut(#MUNICIPIO, uValue)
return MUNICIPIO := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


METHOD pornum( ) 
	SELF:KEYFIND()

METHOD PostInit() 	
   SELF:RegisterTimer(300,FALSE)
 RETURN SELF

access SITUACAO() 
return self:FieldGet(#SITUACAO)


assign SITUACAO(uValue) 
self:FieldPut(#SITUACAO, uValue)
return SITUACAO := uValue


METHOD Timer() 
   SELF:SERVER:COMMIT()

access UF() 
return self:FieldGet(#UF)


assign UF(uValue) 
self:FieldPut(#UF, uValue)
return UF := uValue


END CLASS
