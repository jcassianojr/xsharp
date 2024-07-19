#region DEFINES
STATIC DEFINE JBA01_ACHA := 116 
STATIC DEFINE JBA01_ACHADATA := 131 
STATIC DEFINE JBA01_BUSCA := 127 
STATIC DEFINE JBA01_BUSCAOV := 139 
STATIC DEFINE JBA01_CHAVE := 140 
STATIC DEFINE JBA01_CMDTIPO := 137 
STATIC DEFINE JBA01_CODIGO := 115 
STATIC DEFINE JBA01_DATA := 111 
STATIC DEFINE JBA01_DATADEP := 113 
STATIC DEFINE JBA01_ESCOLHA := 128 
STATIC DEFINE JBA01_GROUPBOX1 := 134 
STATIC DEFINE JBA01_GROUPBOX2 := 135 
STATIC DEFINE JBA01_GROUPBOX3 := 136 
STATIC DEFINE JBA01_HISTORICO := 120 
STATIC DEFINE JBA01_ITEM := 132 
STATIC DEFINE JBA01_JBBC01 := 129 
STATIC DEFINE JBA01_LOCALIZA := 117 
STATIC DEFINE JBA01_MBUSCA := 126 
STATIC DEFINE JBA01_MDATA := 130 
STATIC DEFINE JBA01_MNUMERO := 118 
STATIC DEFINE JBA01_MSUB := 119 
STATIC DEFINE JBA01_NRCONTA := 112 
STATIC DEFINE JBA01_NUMERO := 109 
STATIC DEFINE JBA01_ORDCN := 121 
STATIC DEFINE JBA01_ORDDATA := 123 
STATIC DEFINE JBA01_ORDNUM := 122 
STATIC DEFINE JBA01_PORCODIGO := 124 
STATIC DEFINE JBA01_PORDESCR := 125 
STATIC DEFINE JBA01_POROV := 138 
STATIC DEFINE JBA01_SC_DATA := 102 
STATIC DEFINE JBA01_SC_DATA1 := 141 
STATIC DEFINE JBA01_SC_DATADEP := 104 
STATIC DEFINE JBA01_SC_HISTORICO := 110 
STATIC DEFINE JBA01_SC_ITEM := 107 
STATIC DEFINE JBA01_SC_ITEM1 := 108 
STATIC DEFINE JBA01_SC_NRCONTA := 103 
STATIC DEFINE JBA01_SC_NUMERO := 100 
STATIC DEFINE JBA01_SC_TIPO := 112 
STATIC DEFINE JBA01_SC_VALOR := 105 
STATIC DEFINE JBA01_SUB := 110 
STATIC DEFINE JBA01_THEFIXEDTEXT7 := 106 
STATIC DEFINE JBA01_THEFIXEDTEXT8 := 101 
STATIC DEFINE JBA01_THESINGLELINEEDIT7 := 106 
STATIC DEFINE JBA01_TIPO := 133 
STATIC DEFINE JBA01_VALOR := 114 
#endregion

class JBA01 inherit MYDataWindow 

	PROTECT oDBDATA as DataColumn
	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBSUB as DataColumn
	PROTECT oDBNRCONTA as DataColumn
	PROTECT oDBVALOR as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBHISTORICO as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBTIPO as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCtheFixedText8 as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_NRCONTA as FIXEDTEXT
	protect oDCSC_DATADEP as FIXEDTEXT
	protect oDCSC_VALOR as FIXEDTEXT
	protect oDCtheFixedText7 as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCSC_ITEM1 as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCSUB as SINGLELINEEDIT
	protect oDCData as DATETIMEPICKER
	protect oDCNRCONTA as RIGHTSLE
	protect oDCDATADEP as DATETIMEPICKER
	protect oDCVALOR as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oCCAcha as PUSHBUTTON
	protect oCCLocaliza as PUSHBUTTON
	protect oDCmNUMERO as RIGHTSLE
	protect oDCmSUB as SINGLELINEEDIT
	protect oDCHISTORICO as SINGLELINEEDIT
	protect oCCORDCN as PUSHBUTTON
	protect oCCORDNUM as PUSHBUTTON
	protect oCCOrdData as PUSHBUTTON
	protect oCCPorCodigo as PUSHBUTTON
	protect oCCPorDescr as PUSHBUTTON
	protect oDCmBUSCA as SINGLELINEEDIT
	protect oCCBusca as PUSHBUTTON
	protect oCCEscolha as PUSHBUTTON
	protect oDCmDATA as DATETIMEPICKER
	protect oCCAchaData as PUSHBUTTON
	protect oDCITEM as SINGLELINEEDIT
	protect oDCTIPO as SINGLELINEEDIT
	protect oDCGroupBox1 as GROUPBOX
	protect oDCGroupBox2 as GROUPBOX
	protect oDCGroupBox3 as GROUPBOX
	protect oCCcmdtipo as PUSHBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oDCCHAVE as SINGLELINEEDIT
	protect oDCSC_DATA1 as FIXEDTEXT
// 	instance NUMERO 
// 	instance SUB 
// 	instance NRCONTA 
// 	instance VALOR 
// 	instance CODIGO 
// 	instance mNUMERO 
// 	instance mSUB 
// 	instance HISTORICO 
// 	instance mBUSCA 
// 	instance ITEM 
// 	instance TIPO 
// 	instance CHAVE 
	protect oSFJBBC01 as JBBC01

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CHAVE() 
return self:FieldGet(#CHAVE)


assign CHAVE(uValue) 
self:FieldPut(#CHAVE, uValue)
return CHAVE := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access HISTORICO() 
return self:FieldGet(#HISTORICO)


assign HISTORICO(uValue) 
self:FieldPut(#HISTORICO, uValue)
return HISTORICO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JBA01",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_NUMERO := FixedText{self,ResourceID{JBA01_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCtheFixedText8 := FixedText{self,ResourceID{JBA01_THEFIXEDTEXT8,_GetInst()}}
oDCtheFixedText8:HyperLabel := HyperLabel{#theFixedText8,"D",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JBA01_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_NRCONTA := FixedText{self,ResourceID{JBA01_SC_NRCONTA,_GetInst()}}
oDCSC_NRCONTA:HyperLabel := HyperLabel{#SC_NRCONTA,"Banco",NULL_STRING,NULL_STRING}

oDCSC_DATADEP := FixedText{self,ResourceID{JBA01_SC_DATADEP,_GetInst()}}
oDCSC_DATADEP:HyperLabel := HyperLabel{#SC_DATADEP,"Data Deposito",NULL_STRING,NULL_STRING}

oDCSC_VALOR := FixedText{self,ResourceID{JBA01_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor:",NULL_STRING,NULL_STRING}

oDCtheFixedText7 := FixedText{self,ResourceID{JBA01_THEFIXEDTEXT7,_GetInst()}}
oDCtheFixedText7:HyperLabel := HyperLabel{#theFixedText7,"Historico",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JBA01_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Codigo Despesa",NULL_STRING,NULL_STRING}

oDCSC_ITEM1 := FixedText{self,ResourceID{JBA01_SC_ITEM1,_GetInst()}}
oDCSC_ITEM1:HyperLabel := HyperLabel{#SC_ITEM1,"Tipo",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JBA01_NUMERO,_GetInst()}}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"BA01_NUMERO"}
oDCNUMERO:Picture := "9999999"
oDCNUMERO:TooltipText := "Numero Documento"

oDCSUB := SingleLineEdit{self,ResourceID{JBA01_SUB,_GetInst()}}
oDCSUB:FieldSpec := padrao_CHAR_01{}
oDCSUB:HyperLabel := HyperLabel{#SUB,"Sub",NULL_STRING,"BA01_NUMERO"}
oDCSUB:TooltipText := "Sub Codigo Documento (A/B..)"

oDCData := DateTimePicker{self,ResourceID{JBA01_DATA,_GetInst()}}
oDCData:FieldSpec := DATE_FIELD{}
oDCData:HyperLabel := HyperLabel{#Data,"Data",NULL_STRING,NULL_STRING}
oDCData:TooltipText := "Data Lançamento"

oDCNRCONTA := rightSle{self,ResourceID{JBA01_NRCONTA,_GetInst()}}
oDCNRCONTA:FieldSpec := padrao_NUM_02{}
oDCNRCONTA:HyperLabel := HyperLabel{#NRCONTA,"Conta",NULL_STRING,"BA01_NUMERO"}
oDCNRCONTA:Picture := "9999999"
oDCNRCONTA:TooltipText := "Numero do Banco"

oDCDATADEP := DateTimePicker{self,ResourceID{JBA01_DATADEP,_GetInst()}}
oDCDATADEP:FieldSpec := DATE_FIELD{}
oDCDATADEP:HyperLabel := HyperLabel{#DATADEP,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDATADEP:TooltipText := "Data de Deposito"

oDCVALOR := SingleLineEdit{self,ResourceID{JBA01_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := padrao_NUM_12_2{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Valor:",NULL_STRING,"BA01_VALOR"}
oDCVALOR:Picture := "9999999.99"
oDCVALOR:FocusSelect := FSEL_ALL
oDCVALOR:TooltipText := "Valor "

oDCCODIGO := SingleLineEdit{self,ResourceID{JBA01_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_CHAR_04{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo",NULL_STRING,NULL_STRING}
oDCCODIGO:TooltipText := "Historico"

oCCAcha := PushButton{self,ResourceID{JBA01_ACHA,_GetInst()}}
oCCAcha:HyperLabel := HyperLabel{#Acha,"Acha",NULL_STRING,NULL_STRING}

oCCLocaliza := PushButton{self,ResourceID{JBA01_LOCALIZA,_GetInst()}}
oCCLocaliza:HyperLabel := HyperLabel{#Localiza,"...",NULL_STRING,NULL_STRING}
oCCLocaliza:TooltipText := "Localiza um Documento"

oDCmNUMERO := rightSle{self,ResourceID{JBA01_MNUMERO,_GetInst()}}
oDCmNUMERO:FieldSpec := PADRAO_num_08{}
oDCmNUMERO:HyperLabel := HyperLabel{#mNUMERO,"Numero:",NULL_STRING,"BA01_NUMERO"}
oDCmNUMERO:TooltipText := "Numero Documento Localizar"

oDCmSUB := SingleLineEdit{self,ResourceID{JBA01_MSUB,_GetInst()}}
oDCmSUB:FieldSpec := PADRAO_char_01{}
oDCmSUB:HyperLabel := HyperLabel{#mSUB,"Numero:",NULL_STRING,"BA01_NUMERO"}
oDCmSUB:TooltipText := "Sub documento a Localizar"

oDCHISTORICO := SingleLineEdit{self,ResourceID{JBA01_HISTORICO,_GetInst()}}
oDCHISTORICO:FieldSpec := padrao_char_30{}
oDCHISTORICO:HyperLabel := HyperLabel{#HISTORICO,"Historico:",NULL_STRING,"BA01_HISTORICO"}
oDCHISTORICO:TooltipText := "Descrição do Historico"

oCCORDCN := PushButton{self,ResourceID{JBA01_ORDCN,_GetInst()}}
oCCORDCN:HyperLabel := HyperLabel{#ORDCN,"Cta/Numero",NULL_STRING,NULL_STRING}
oCCORDCN:TooltipText := "Ordena Conta Numero Lancamento"

oCCORDNUM := PushButton{self,ResourceID{JBA01_ORDNUM,_GetInst()}}
oCCORDNUM:HyperLabel := HyperLabel{#ORDNUM,"Numero",NULL_STRING,NULL_STRING}
oCCORDNUM:TooltipText := "Ordena Numero de Lançamento"

oCCOrdData := PushButton{self,ResourceID{JBA01_ORDDATA,_GetInst()}}
oCCOrdData:HyperLabel := HyperLabel{#OrdData,"Data",NULL_STRING,NULL_STRING}
oCCOrdData:TooltipText := "Ordena Data de Lancamento"

oCCPorCodigo := PushButton{self,ResourceID{JBA01_PORCODIGO,_GetInst()}}
oCCPorCodigo:HyperLabel := HyperLabel{#PorCodigo,"Ordem de Código",NULL_STRING,NULL_STRING}
oCCPorCodigo:TooltipText := "Ordena Lista Codigo"

oCCPorDescr := PushButton{self,ResourceID{JBA01_PORDESCR,_GetInst()}}
oCCPorDescr:HyperLabel := HyperLabel{#PorDescr,"Ordem Descrição",NULL_STRING,NULL_STRING}
oCCPorDescr:TooltipText := "Ordena Lista Por Descriçao"

oDCmBUSCA := SingleLineEdit{self,ResourceID{JBA01_MBUSCA,_GetInst()}}
oDCmBUSCA:FieldSpec := PADRAO_CHAR_35{}
oDCmBUSCA:HyperLabel := HyperLabel{#mBUSCA,NULL_STRING,NULL_STRING,NULL_STRING}

oCCBusca := PushButton{self,ResourceID{JBA01_BUSCA,_GetInst()}}
oCCBusca:HyperLabel := HyperLabel{#Busca,"Busca",NULL_STRING,NULL_STRING}
oCCBusca:TooltipText := "Localiza um Codigo"

oCCEscolha := PushButton{self,ResourceID{JBA01_ESCOLHA,_GetInst()}}
oCCEscolha:HyperLabel := HyperLabel{#Escolha,"Escolher",NULL_STRING,NULL_STRING}
oCCEscolha:TooltipText := "Escolhe o Codigo em Destaque"

oDCmDATA := DateTimePicker{self,ResourceID{JBA01_MDATA,_GetInst()}}
oDCmDATA:FieldSpec := date_field{}
oDCmDATA:HyperLabel := HyperLabel{#mDATA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCmDATA:TooltipText := "Data a Localizar"

oCCAchaData := PushButton{self,ResourceID{JBA01_ACHADATA,_GetInst()}}
oCCAchaData:HyperLabel := HyperLabel{#AchaData,"...",NULL_STRING,NULL_STRING}
oCCAchaData:TooltipText := "Localizar Uma Data"

oDCITEM := SingleLineEdit{self,ResourceID{JBA01_ITEM,_GetInst()}}
oDCITEM:FieldSpec := padrAO_char_04{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item",NULL_STRING,"BA01_ITEM"}
oDCITEM:TooltipText := "Codigo de Despesa"

oDCTIPO := SingleLineEdit{self,ResourceID{JBA01_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := PADRAO_char_01{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo",NULL_STRING,"BA01_NUMERO"}
oDCTIPO:TooltipText := "Tipo (C)redito (D)ebito"
oDCTIPO:BackGround := aBrushes[1]
oDCTIPO:Font(aFonts[1], FALSE)

oDCGroupBox1 := GroupBox{self,ResourceID{JBA01_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Localizar",NULL_STRING,NULL_STRING}

oDCGroupBox2 := GroupBox{self,ResourceID{JBA01_GROUPBOX2,_GetInst()}}
oDCGroupBox2:HyperLabel := HyperLabel{#GroupBox2,"Ordenar",NULL_STRING,NULL_STRING}

oDCGroupBox3 := GroupBox{self,ResourceID{JBA01_GROUPBOX3,_GetInst()}}
oDCGroupBox3:HyperLabel := HyperLabel{#GroupBox3,"Numero:",NULL_STRING,NULL_STRING}

oCCcmdtipo := PushButton{self,ResourceID{JBA01_CMDTIPO,_GetInst()}}
oCCcmdtipo:HyperLabel := HyperLabel{#cmdtipo,"(C)redito (D)ebito",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JBA01_POROV,_GetInst()}}
oCCporov:Image := ICO_AZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Clique para ordenar por Numero"

oCCbuscaov := PushButton{self,ResourceID{JBA01_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ICO_FIND{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaov:TooltipText := "Clique Para Localizar Por Numero"

oDCCHAVE := SingleLineEdit{self,ResourceID{JBA01_CHAVE,_GetInst()}}
oDCCHAVE:FieldSpec := PADRAO_char_24{}
oDCCHAVE:HyperLabel := HyperLabel{#CHAVE,"Tipo",NULL_STRING,"BA01_NUMERO"}
oDCCHAVE:BackGround := aBrushes[1]
oDCCHAVE:Font(aFonts[1], FALSE)

oDCSC_DATA1 := FixedText{self,ResourceID{JBA01_SC_DATA1,_GetInst()}}
oDCSC_DATA1:HyperLabel := HyperLabel{#SC_DATA1,"Chave Importacao",NULL_STRING,NULL_STRING}

self:Caption := "Lançamentos"
self:HyperLabel := HyperLabel{#JBA01,"Lançamentos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 11
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data"
self:Browser:AddColumn(oDBDATA)

oDBNUMERO := DataColumn{10}
oDBNUMERO:Width := 10
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBSUB := DataColumn{padrao_CHAR_01{}}
oDBSUB:Width := 5
oDBSUB:HyperLabel := oDCSUB:HyperLabel 
oDBSUB:Caption := "Sub"
self:Browser:AddColumn(oDBSUB)

oDBNRCONTA := DataColumn{padrao_NUM_02{}}
oDBNRCONTA:Width := 9
oDBNRCONTA:HyperLabel := oDCNRCONTA:HyperLabel 
oDBNRCONTA:Caption := "Conta"
self:Browser:AddColumn(oDBNRCONTA)

oDBVALOR := DataColumn{padrao_NUM_12_2{}}
oDBVALOR:Width := 13
oDBVALOR:HyperLabel := oDCVALOR:HyperLabel 
oDBVALOR:Caption := "Valor:"
self:Browser:AddColumn(oDBVALOR)

oDBCODIGO := DataColumn{padrao_CHAR_04{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo"
self:Browser:AddColumn(oDBCODIGO)

oDBHISTORICO := DataColumn{padrao_char_30{}}
oDBHISTORICO:Width := 15
oDBHISTORICO:HyperLabel := oDCHISTORICO:HyperLabel 
oDBHISTORICO:Caption := "Historico:"
self:Browser:AddColumn(oDBHISTORICO)

oDBITEM := DataColumn{padrAO_char_04{}}
oDBITEM:Width := 6
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item"
self:Browser:AddColumn(oDBITEM)

oDBTIPO := DataColumn{PADRAO_char_01{}}
oDBTIPO:Width := 6
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "Tipo"
oDBTIPO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTIPO)


self:ViewAs(#FormView)

oSFJBBC01 := JBBC01{self,JBA01_JBBC01}
oSFJBBC01:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access mBUSCA() 
return self:FieldGet(#mBUSCA)


assign mBUSCA(uValue) 
self:FieldPut(#mBUSCA, uValue)
return mBUSCA := uValue


access mNUMERO() 
return self:FieldGet(#mNUMERO)


assign mNUMERO(uValue) 
self:FieldPut(#mNUMERO, uValue)
return mNUMERO := uValue


access mSUB() 
return self:FieldGet(#mSUB)


assign mSUB(uValue) 
self:FieldPut(#mSUB, uValue)
return mSUB := uValue


access NRCONTA() 
return self:FieldGet(#NRCONTA)


assign NRCONTA(uValue) 
self:FieldPut(#NRCONTA, uValue)
return NRCONTA := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access SUB() 
return self:FieldGet(#SUB)


assign SUB(uValue) 
self:FieldPut(#SUB, uValue)
return SUB := uValue


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


access VALOR() 
return self:FieldGet(#VALOR)


assign VALOR(uValue) 
self:FieldPut(#VALOR, uValue)
return VALOR := uValue


END CLASS
