#region DEFINES
STATIC DEFINE JPCORTEI_APLICACAO := 106 
STATIC DEFINE JPCORTEI_CODIGO := 119 
STATIC DEFINE JPCORTEI_COMITEM := 122 
STATIC DEFINE JPCORTEI_COMPRAS := 121 
STATIC DEFINE JPCORTEI_DESCRICAO := 120 
STATIC DEFINE JPCORTEI_FIXEDTEXT23 := 130 
STATIC DEFINE JPCORTEI_ITECOM := 103 
STATIC DEFINE JPCORTEI_ITELAR := 102 
STATIC DEFINE JPCORTEI_NUMERO := 118 
STATIC DEFINE JPCORTEI_PE := 124 
STATIC DEFINE JPCORTEI_PESO := 105 
STATIC DEFINE JPCORTEI_PRAZO := 100 
STATIC DEFINE JPCORTEI_QTDE := 101 
STATIC DEFINE JPCORTEI_RETDATA := 108 
STATIC DEFINE JPCORTEI_RETNF := 107 
STATIC DEFINE JPCORTEI_RETQTDE := 109 
STATIC DEFINE JPCORTEI_ROLOS := 104 
STATIC DEFINE JPCORTEI_SC_CODIGO := 111 
STATIC DEFINE JPCORTEI_SC_COMPRAS := 117 
STATIC DEFINE JPCORTEI_SC_ITECOM := 113 
STATIC DEFINE JPCORTEI_SC_ITELAR := 112 
STATIC DEFINE JPCORTEI_SC_ITELAR1 := 126 
STATIC DEFINE JPCORTEI_SC_NFNOSSA2 := 128 
STATIC DEFINE JPCORTEI_SC_NFUSINA1 := 129 
STATIC DEFINE JPCORTEI_SC_NUMERO := 110 
STATIC DEFINE JPCORTEI_SC_PESO := 115 
STATIC DEFINE JPCORTEI_SC_PESO1 := 123 
STATIC DEFINE JPCORTEI_SC_PESO2 := 127 
STATIC DEFINE JPCORTEI_SC_PRAZO := 116 
STATIC DEFINE JPCORTEI_SC_ROLOS := 114 
STATIC DEFINE JPCORTEI_SC_ROLOS1 := 125 
#endregion

class jpcortei inherit DATAWINDOW 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDESCRICAO as DataColumn
	PROTECT oDBQTDE as DataColumn
	PROTECT oDBITELAR as DataColumn
	PROTECT oDBITECOM as DataColumn
	PROTECT oDBROLOS as DataColumn
	PROTECT oDBPESO as DataColumn
	PROTECT oDBPRAZO as DataColumn
	PROTECT oDBPE as DataColumn
	PROTECT oDBCOMPRAS as DataColumn
	PROTECT oDBCOMITEM as DataColumn
	protect oDCPRAZO as DATESLE
	protect oDCQTDE as RIGHTSLE
	protect oDCITELAR as RIGHTSLE
	protect oDCITECOM as RIGHTSLE
	protect oDCROLOS as RIGHTSLE
	protect oDCPESO as RIGHTSLE
	protect oDCAPLICACAO as RIGHTSLE
	protect oDCRETNF as RIGHTSLE
	protect oDCRETDATA as DATESLE
	protect oDCRETQTDE as RIGHTSLE
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_ITELAR as FIXEDTEXT
	protect oDCSC_ITECOM as FIXEDTEXT
	protect oDCSC_ROLOS as FIXEDTEXT
	protect oDCSC_PESO as FIXEDTEXT
	protect oDCSC_PRAZO as FIXEDTEXT
	protect oDCSC_COMPRAS as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCDESCRICAO as SINGLELINEEDIT
	protect oDCCOMPRAS as RIGHTSLE
	protect oDCCOMITEM as RIGHTSLE
	protect oDCSC_PESO1 as FIXEDTEXT
	protect oDCPE as RIGHTSLE
	protect oDCSC_ROLOS1 as FIXEDTEXT
	protect oDCSC_ITELAR1 as FIXEDTEXT
	protect oDCSC_PESO2 as FIXEDTEXT
	protect oDCSC_NFNOSSA2 as FIXEDTEXT
	protect oDCSC_NFUSINA1 as FIXEDTEXT
	protect oDCFixedText23 as FIXEDTEXT
// 	instance PRAZO 
// 	instance QTDE 
// 	instance ITELAR 
// 	instance ITECOM 
// 	instance ROLOS 
// 	instance PESO 
// 	instance APLICACAO 
// 	instance RETNF 
// 	instance RETDATA 
// 	instance RETQTDE 
// 	instance NUMERO 
// 	instance CODIGO 
// 	instance DESCRICAO 
// 	instance COMPRAS 
// 	instance COMITEM 
// 	instance PE 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access APLICACAO() 
return self:FieldGet(#APLICACAO)


assign APLICACAO(uValue) 
self:FieldPut(#APLICACAO, uValue)
return APLICACAO := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access COMITEM() 
return self:FieldGet(#COMITEM)


assign COMITEM(uValue) 
self:FieldPut(#COMITEM, uValue)
return COMITEM := uValue


access COMPRAS() 
return self:FieldGet(#COMPRAS)


assign COMPRAS(uValue) 
self:FieldPut(#COMPRAS, uValue)
return COMPRAS := uValue


access DESCRICAO() 
return self:FieldGet(#DESCRICAO)


assign DESCRICAO(uValue) 
self:FieldPut(#DESCRICAO, uValue)
return DESCRICAO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[3] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jpcortei",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Times New Roman"}
aFonts[2]:Bold := TRUE
aFonts[2]:Italic := TRUE
aFonts[3] := Font{,10,"Times New Roman"}
aFonts[3]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCPRAZO := DateSle{self,ResourceID{JPCORTEI_PRAZO,_GetInst()}}
oDCPRAZO:FieldSpec := date_field{}
oDCPRAZO:HyperLabel := HyperLabel{#PRAZO,"Prazo",NULL_STRING,"PCORTEI_PRAZO"}

oDCQTDE := rightSle{self,ResourceID{JPCORTEI_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := padrao_num_08{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"PCORTEI_PESO"}

oDCITELAR := rightSle{self,ResourceID{JPCORTEI_ITELAR,_GetInst()}}
oDCITELAR:FieldSpec := padrao_num_10_2{}
oDCITELAR:HyperLabel := HyperLabel{#ITELAR,"Larg.",NULL_STRING,"PCORTEI_ITELAR"}

oDCITECOM := rightSle{self,ResourceID{JPCORTEI_ITECOM,_GetInst()}}
oDCITECOM:FieldSpec := padrao_num_10_2{}
oDCITECOM:HyperLabel := HyperLabel{#ITECOM,"Comp",NULL_STRING,"PCORTEI_ITECOM"}

oDCROLOS := rightSle{self,ResourceID{JPCORTEI_ROLOS,_GetInst()}}
oDCROLOS:FieldSpec := padrao_num_03{}
oDCROLOS:HyperLabel := HyperLabel{#ROLOS,"Rolos",NULL_STRING,"PCORTEI_ROLOS"}

oDCPESO := rightSle{self,ResourceID{JPCORTEI_PESO,_GetInst()}}
oDCPESO:FieldSpec := padrao_num_08{}
oDCPESO:HyperLabel := HyperLabel{#PESO,"Peso",NULL_STRING,"PCORTEI_PESO"}

oDCAPLICACAO := rightSle{self,ResourceID{JPCORTEI_APLICACAO,_GetInst()}}
oDCAPLICACAO:FieldSpec := padrao_char_40{}
oDCAPLICACAO:HyperLabel := HyperLabel{#APLICACAO,"Larg.",NULL_STRING,"PCORTEI_ITELAR"}

oDCRETNF := rightSle{self,ResourceID{JPCORTEI_RETNF,_GetInst()}}
oDCRETNF:FieldSpec := PADRAO_NUM_08{}
oDCRETNF:HyperLabel := HyperLabel{#RETNF,"Nfusina:",NULL_STRING,"PCORTE_NFUSINA"}

oDCRETDATA := DateSle{self,ResourceID{JPCORTEI_RETDATA,_GetInst()}}
oDCRETDATA:HyperLabel := HyperLabel{#RETDATA,"Esp:",NULL_STRING,"PCORTE_ESP"}
oDCRETDATA:FieldSpec := DATE_FIELD{}

oDCRETQTDE := rightSle{self,ResourceID{JPCORTEI_RETQTDE,_GetInst()}}
oDCRETQTDE:FieldSpec := PADRAO_NUM_08{}
oDCRETQTDE:HyperLabel := HyperLabel{#RETQTDE,"Peso:",NULL_STRING,"PCORTE_PESO"}

oDCSC_NUMERO := FixedText{self,ResourceID{JPCORTEI_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"No.",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JPCORTEI_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_ITELAR := FixedText{self,ResourceID{JPCORTEI_SC_ITELAR,_GetInst()}}
oDCSC_ITELAR:HyperLabel := HyperLabel{#SC_ITELAR,"Largura",NULL_STRING,NULL_STRING}

oDCSC_ITECOM := FixedText{self,ResourceID{JPCORTEI_SC_ITECOM,_GetInst()}}
oDCSC_ITECOM:HyperLabel := HyperLabel{#SC_ITECOM,"Comprimento",NULL_STRING,NULL_STRING}

oDCSC_ROLOS := FixedText{self,ResourceID{JPCORTEI_SC_ROLOS,_GetInst()}}
oDCSC_ROLOS:HyperLabel := HyperLabel{#SC_ROLOS,"Rolos:",NULL_STRING,NULL_STRING}

oDCSC_PESO := FixedText{self,ResourceID{JPCORTEI_SC_PESO,_GetInst()}}
oDCSC_PESO:HyperLabel := HyperLabel{#SC_PESO,"Peso:",NULL_STRING,NULL_STRING}

oDCSC_PRAZO := FixedText{self,ResourceID{JPCORTEI_SC_PRAZO,_GetInst()}}
oDCSC_PRAZO:HyperLabel := HyperLabel{#SC_PRAZO,"Prazo:",NULL_STRING,NULL_STRING}

oDCSC_COMPRAS := FixedText{self,ResourceID{JPCORTEI_SC_COMPRAS,_GetInst()}}
oDCSC_COMPRAS:HyperLabel := HyperLabel{#SC_COMPRAS,"Compras:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JPCORTEI_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Nº",NULL_STRING,"PCORTEI_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]
oDCNUMERO:Font(aFonts[1], FALSE)

oDCCODIGO := SingleLineEdit{self,ResourceID{JPCORTEI_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"PCORTEI_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[2], FALSE)

oDCDESCRICAO := SingleLineEdit{self,ResourceID{JPCORTEI_DESCRICAO,_GetInst()}}
oDCDESCRICAO:FieldSpec := PADRAO_CHAR_40{}
oDCDESCRICAO:HyperLabel := HyperLabel{#DESCRICAO,"Descricao:",NULL_STRING,"PCORTEI_DESCRICAO"}
oDCDESCRICAO:BackGround := aBrushes[1]
oDCDESCRICAO:Font(aFonts[3], FALSE)

oDCCOMPRAS := rightSle{self,ResourceID{JPCORTEI_COMPRAS,_GetInst()}}
oDCCOMPRAS:FieldSpec := padrao_num_08{}
oDCCOMPRAS:HyperLabel := HyperLabel{#COMPRAS,"Compras",NULL_STRING,"PCORTEI_COMPRAS"}
oDCCOMPRAS:BackGround := aBrushes[1]
oDCCOMPRAS:Font(aFonts[3], FALSE)

oDCCOMITEM := rightSle{self,ResourceID{JPCORTEI_COMITEM,_GetInst()}}
oDCCOMITEM:FieldSpec := padrao_num_03{}
oDCCOMITEM:HyperLabel := HyperLabel{#COMITEM,"Item",NULL_STRING,"PCORTEI_COMITEM"}
oDCCOMITEM:BackGround := aBrushes[1]
oDCCOMITEM:Font(aFonts[3], FALSE)

oDCSC_PESO1 := FixedText{self,ResourceID{JPCORTEI_SC_PESO1,_GetInst()}}
oDCSC_PESO1:HyperLabel := HyperLabel{#SC_PESO1,"Qtde",NULL_STRING,NULL_STRING}

oDCPE := rightSle{self,ResourceID{JPCORTEI_PE,_GetInst()}}
oDCPE:FieldSpec := padrao_num_08{}
oDCPE:HyperLabel := HyperLabel{#PE,"PE",NULL_STRING,"PCORTEI_ROLOS"}
oDCPE:BackGround := aBrushes[1]
oDCPE:Font(aFonts[3], FALSE)

oDCSC_ROLOS1 := FixedText{self,ResourceID{JPCORTEI_SC_ROLOS1,_GetInst()}}
oDCSC_ROLOS1:HyperLabel := HyperLabel{#SC_ROLOS1,"PrgEntrg",NULL_STRING,NULL_STRING}

oDCSC_ITELAR1 := FixedText{self,ResourceID{JPCORTEI_SC_ITELAR1,_GetInst()}}
oDCSC_ITELAR1:HyperLabel := HyperLabel{#SC_ITELAR1,"Aplicacao/Produto",NULL_STRING,NULL_STRING}

oDCSC_PESO2 := FixedText{self,ResourceID{JPCORTEI_SC_PESO2,_GetInst()}}
oDCSC_PESO2:HyperLabel := HyperLabel{#SC_PESO2,"Peso:",NULL_STRING,NULL_STRING}

oDCSC_NFNOSSA2 := FixedText{self,ResourceID{JPCORTEI_SC_NFNOSSA2,_GetInst()}}
oDCSC_NFNOSSA2:HyperLabel := HyperLabel{#SC_NFNOSSA2,"Data",NULL_STRING,NULL_STRING}

oDCSC_NFUSINA1 := FixedText{self,ResourceID{JPCORTEI_SC_NFUSINA1,_GetInst()}}
oDCSC_NFUSINA1:HyperLabel := HyperLabel{#SC_NFUSINA1,"NF",NULL_STRING,NULL_STRING}

oDCFixedText23 := FixedText{self,ResourceID{JPCORTEI_FIXEDTEXT23,_GetInst()}}
oDCFixedText23:HyperLabel := HyperLabel{#FixedText23,"Entrada",NULL_STRING,NULL_STRING}

self:Caption := ""
self:HyperLabel := HyperLabel{#jpcortei,NULL_STRING,NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 7
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Nº"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 13
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBDESCRICAO := DataColumn{PADRAO_CHAR_40{}}
oDBDESCRICAO:Width := 11
oDBDESCRICAO:HyperLabel := oDCDESCRICAO:HyperLabel 
oDBDESCRICAO:Caption := "Descricao:"
oDBDESCRICAO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDESCRICAO)

oDBQTDE := DataColumn{padrao_num_08{}}
oDBQTDE:Width := 7
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
self:Browser:AddColumn(oDBQTDE)

oDBITELAR := DataColumn{padrao_num_10_2{}}
oDBITELAR:Width := 8
oDBITELAR:HyperLabel := oDCITELAR:HyperLabel 
oDBITELAR:Caption := "Larg."
self:Browser:AddColumn(oDBITELAR)

oDBITECOM := DataColumn{padrao_num_10_2{}}
oDBITECOM:Width := 8
oDBITECOM:HyperLabel := oDCITECOM:HyperLabel 
oDBITECOM:Caption := "Comp"
self:Browser:AddColumn(oDBITECOM)

oDBROLOS := DataColumn{padrao_num_03{}}
oDBROLOS:Width := 7
oDBROLOS:HyperLabel := oDCROLOS:HyperLabel 
oDBROLOS:Caption := "Rolos"
self:Browser:AddColumn(oDBROLOS)

oDBPESO := DataColumn{padrao_num_08{}}
oDBPESO:Width := 6
oDBPESO:HyperLabel := oDCPESO:HyperLabel 
oDBPESO:Caption := "Peso"
self:Browser:AddColumn(oDBPESO)

oDBPRAZO := DataColumn{date_field{}}
oDBPRAZO:Width := 9
oDBPRAZO:HyperLabel := oDCPRAZO:HyperLabel 
oDBPRAZO:Caption := "Prazo"
self:Browser:AddColumn(oDBPRAZO)

oDBPE := DataColumn{padrao_num_08{}}
oDBPE:Width := 5
oDBPE:HyperLabel := oDCPE:HyperLabel 
oDBPE:Caption := "PE"
oDBPE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBPE)

oDBCOMPRAS := DataColumn{padrao_num_08{}}
oDBCOMPRAS:Width := 6
oDBCOMPRAS:HyperLabel := oDCCOMPRAS:HyperLabel 
oDBCOMPRAS:Caption := "Compras"
oDBCOMPRAS:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCOMPRAS)

oDBCOMITEM := DataColumn{padrao_num_03{}}
oDBCOMITEM:Width := 5
oDBCOMITEM:HyperLabel := oDCCOMITEM:HyperLabel 
oDBCOMITEM:Caption := "Item"
oDBCOMITEM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCOMITEM)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITECOM() 
return self:FieldGet(#ITECOM)


assign ITECOM(uValue) 
self:FieldPut(#ITECOM, uValue)
return ITECOM := uValue


access ITELAR() 
return self:FieldGet(#ITELAR)


assign ITELAR(uValue) 
self:FieldPut(#ITELAR, uValue)
return ITELAR := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access PE() 
return self:FieldGet(#PE)


assign PE(uValue) 
self:FieldPut(#PE, uValue)
return PE := uValue


access PESO() 
return self:FieldGet(#PESO)


assign PESO(uValue) 
self:FieldPut(#PESO, uValue)
return PESO := uValue


access PRAZO() 
return self:FieldGet(#PRAZO)


assign PRAZO(uValue) 
self:FieldPut(#PRAZO, uValue)
return PRAZO := uValue


access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


access RETDATA() 
return self:FieldGet(#RETDATA)


assign RETDATA(uValue) 
self:FieldPut(#RETDATA, uValue)
return RETDATA := uValue


access RETNF() 
return self:FieldGet(#RETNF)


assign RETNF(uValue) 
self:FieldPut(#RETNF, uValue)
return RETNF := uValue


access RETQTDE() 
return self:FieldGet(#RETQTDE)


assign RETQTDE(uValue) 
self:FieldPut(#RETQTDE, uValue)
return RETQTDE := uValue


access ROLOS() 
return self:FieldGet(#ROLOS)


assign ROLOS(uValue) 
self:FieldPut(#ROLOS, uValue)
return ROLOS := uValue


END CLASS
