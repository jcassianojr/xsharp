#region DEFINES
STATIC DEFINE JREQ_AUT := 130 
STATIC DEFINE JREQ_BUSCANUM := 132 
STATIC DEFINE JREQ_CODIGO := 119 
STATIC DEFINE JREQ_DATA := 116 
STATIC DEFINE JREQ_ITEM := 123 
STATIC DEFINE JREQ_NRNOTA := 126 
STATIC DEFINE JREQ_NUMERO := 115 
STATIC DEFINE JREQ_NUMMB01 := 127 
STATIC DEFINE JREQ_OBS := 124 
STATIC DEFINE JREQ_OS := 122 
STATIC DEFINE JREQ_PORNUM := 131 
STATIC DEFINE JREQ_PRCMW02 := 128 
STATIC DEFINE JREQ_PRCMY04 := 129 
STATIC DEFINE JREQ_QTDE := 120 
STATIC DEFINE JREQ_RASTRO := 125 
STATIC DEFINE JREQ_SC_AUT := 114 
STATIC DEFINE JREQ_SC_CODIGO := 104 
STATIC DEFINE JREQ_SC_DATA := 101 
STATIC DEFINE JREQ_SC_NRNOTA := 110 
STATIC DEFINE JREQ_SC_NUMERO := 100 
STATIC DEFINE JREQ_SC_NUMMB01 := 111 
STATIC DEFINE JREQ_SC_OBS := 108 
STATIC DEFINE JREQ_SC_OS := 107 
STATIC DEFINE JREQ_SC_PRCMW02 := 112 
STATIC DEFINE JREQ_SC_PRCMY04 := 113 
STATIC DEFINE JREQ_SC_QTDE := 105 
STATIC DEFINE JREQ_SC_RASTRO := 109 
STATIC DEFINE JREQ_SC_TIPO1 := 102 
STATIC DEFINE JREQ_SC_TIPO2 := 103 
STATIC DEFINE JREQ_SC_UNID := 106 
STATIC DEFINE JREQ_TIPO1 := 117 
STATIC DEFINE JREQ_TIPO2 := 118 
STATIC DEFINE JREQ_TROCANF := 133 
STATIC DEFINE JREQ_UNID := 121 
#endregion

class JREQ inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBTIPO1 as DataColumn
	PROTECT oDBTIPO2 as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBQTDE as DataColumn
	PROTECT oDBUNID as DataColumn
	PROTECT oDBOS as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBNRNOTA as DataColumn
	PROTECT oDBNUMMB01 as DataColumn
	PROTECT oDBAUT as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_TIPO1 as FIXEDTEXT
	protect oDCSC_TIPO2 as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCSC_UNID as FIXEDTEXT
	protect oDCSC_OS as FIXEDTEXT
	protect oDCSC_OBS as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCSC_NRNOTA as FIXEDTEXT
	protect oDCSC_NUMMB01 as FIXEDTEXT
	protect oDCSC_PRCMW02 as FIXEDTEXT
	protect oDCSC_PRCMY04 as FIXEDTEXT
	protect oDCSC_AUT as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCDATA as SINGLELINEEDIT
	protect oDCTIPO1 as SINGLELINEEDIT
	protect oDCTIPO2 as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCQTDE as SINGLELINEEDIT
	protect oDCUNID as SINGLELINEEDIT
	protect oDCOS as SINGLELINEEDIT
	protect oDCITEM as SINGLELINEEDIT
	protect oDCOBS as SINGLELINEEDIT
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCNRNOTA as SINGLELINEEDIT
	protect oDCNUMMB01 as SINGLELINEEDIT
	protect oDCPRCMW02 as SINGLELINEEDIT
	protect oDCPRCMY04 as SINGLELINEEDIT
	protect oDCAUT as SINGLELINEEDIT
	protect oCCporNUM as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCTROCANF as PUSHBUTTON
// 	instance NUMERO 
// 	instance DATA 
// 	instance TIPO1 
// 	instance TIPO2 
// 	instance CODIGO 
// 	instance QTDE 
// 	instance UNID 
// 	instance OS 
// 	instance ITEM 
// 	instance OBS 
// 	instance RASTRO 
// 	instance NRNOTA 
// 	instance NUMMB01 
// 	instance PRCMW02 
// 	instance PRCMY04 
// 	instance AUT 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AUT() 
return self:FieldGet(#AUT)


assign AUT(uValue) 
self:FieldPut(#AUT, uValue)
return AUT := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JREQ",_GetInst()},iCtlID)

oDCSC_NUMERO := FixedText{self,ResourceID{JREQ_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JREQ_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_TIPO1 := FixedText{self,ResourceID{JREQ_SC_TIPO1,_GetInst()}}
oDCSC_TIPO1:HyperLabel := HyperLabel{#SC_TIPO1,"Tipo",NULL_STRING,NULL_STRING}

oDCSC_TIPO2 := FixedText{self,ResourceID{JREQ_SC_TIPO2,_GetInst()}}
oDCSC_TIPO2:HyperLabel := HyperLabel{#SC_TIPO2,"Tipo:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JREQ_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{self,ResourceID{JREQ_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCSC_UNID := FixedText{self,ResourceID{JREQ_SC_UNID,_GetInst()}}
oDCSC_UNID:HyperLabel := HyperLabel{#SC_UNID,"Unid:",NULL_STRING,NULL_STRING}

oDCSC_OS := FixedText{self,ResourceID{JREQ_SC_OS,_GetInst()}}
oDCSC_OS:HyperLabel := HyperLabel{#SC_OS,"Pedido/Os",NULL_STRING,NULL_STRING}

oDCSC_OBS := FixedText{self,ResourceID{JREQ_SC_OBS,_GetInst()}}
oDCSC_OBS:HyperLabel := HyperLabel{#SC_OBS,"Obs:",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{JREQ_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCSC_NRNOTA := FixedText{self,ResourceID{JREQ_SC_NRNOTA,_GetInst()}}
oDCSC_NRNOTA:HyperLabel := HyperLabel{#SC_NRNOTA,"Nrnota:",NULL_STRING,NULL_STRING}

oDCSC_NUMMB01 := FixedText{self,ResourceID{JREQ_SC_NUMMB01,_GetInst()}}
oDCSC_NUMMB01:HyperLabel := HyperLabel{#SC_NUMMB01,"Fornecedor",NULL_STRING,NULL_STRING}

oDCSC_PRCMW02 := FixedText{self,ResourceID{JREQ_SC_PRCMW02,_GetInst()}}
oDCSC_PRCMW02:HyperLabel := HyperLabel{#SC_PRCMW02,"Preco",NULL_STRING,NULL_STRING}

oDCSC_PRCMY04 := FixedText{self,ResourceID{JREQ_SC_PRCMY04,_GetInst()}}
oDCSC_PRCMY04:HyperLabel := HyperLabel{#SC_PRCMY04,"Preco Req",NULL_STRING,NULL_STRING}

oDCSC_AUT := FixedText{self,ResourceID{JREQ_SC_AUT,_GetInst()}}
oDCSC_AUT:HyperLabel := HyperLabel{#SC_AUT,"Aut:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JREQ_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"MY04_NUMERO"}

oDCDATA := SingleLineEdit{self,ResourceID{JREQ_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"MY04_DATA"}

oDCTIPO1 := SingleLineEdit{self,ResourceID{JREQ_TIPO1,_GetInst()}}
oDCTIPO1:FieldSpec := padrao_char_01{}
oDCTIPO1:HyperLabel := HyperLabel{#TIPO1,"T",NULL_STRING,"MY04_TIPO1"}

oDCTIPO2 := SingleLineEdit{self,ResourceID{JREQ_TIPO2,_GetInst()}}
oDCTIPO2:FieldSpec := padrao_char_01{}
oDCTIPO2:HyperLabel := HyperLabel{#TIPO2,"T",NULL_STRING,"MY04_TIPO2"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JREQ_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MY04_CODIGO"}

oDCQTDE := SingleLineEdit{self,ResourceID{JREQ_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := padrao_num_10_3{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"MY04_QTDE"}

oDCUNID := SingleLineEdit{self,ResourceID{JREQ_UNID,_GetInst()}}
oDCUNID:FieldSpec := padrao_char_02{}
oDCUNID:HyperLabel := HyperLabel{#UNID,"Un:",NULL_STRING,"MY04_UNID"}

oDCOS := SingleLineEdit{self,ResourceID{JREQ_OS,_GetInst()}}
oDCOS:FieldSpec := padrao_num_08{}
oDCOS:HyperLabel := HyperLabel{#OS,"Os:",NULL_STRING,"MY04_OS"}

oDCITEM := SingleLineEdit{self,ResourceID{JREQ_ITEM,_GetInst()}}
oDCITEM:FieldSpec := padrao_num_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"MY04_ITEM"}

oDCOBS := SingleLineEdit{self,ResourceID{JREQ_OBS,_GetInst()}}
oDCOBS:FieldSpec := padrao_char_40{}
oDCOBS:HyperLabel := HyperLabel{#OBS,"Obs:",NULL_STRING,"MY04_OBS"}

oDCRASTRO := SingleLineEdit{self,ResourceID{JREQ_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := padrao_char_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"MY04_RASTRO"}

oDCNRNOTA := SingleLineEdit{self,ResourceID{JREQ_NRNOTA,_GetInst()}}
oDCNRNOTA:FieldSpec := padrao_num_08{}
oDCNRNOTA:HyperLabel := HyperLabel{#NRNOTA,"Nrnota:",NULL_STRING,"MY04_NRNOTA"}

oDCNUMMB01 := SingleLineEdit{self,ResourceID{JREQ_NUMMB01,_GetInst()}}
oDCNUMMB01:FieldSpec := padrao_num_08{}
oDCNUMMB01:HyperLabel := HyperLabel{#NUMMB01,"Fornec",NULL_STRING,"MY04_NUMMB01"}

oDCPRCMW02 := SingleLineEdit{self,ResourceID{JREQ_PRCMW02,_GetInst()}}
oDCPRCMW02:FieldSpec := padrao_num_15_6{}
oDCPRCMW02:HyperLabel := HyperLabel{#PRCMW02,"Prcmw02:",NULL_STRING,"MY04_PRCMW02"}

oDCPRCMY04 := SingleLineEdit{self,ResourceID{JREQ_PRCMY04,_GetInst()}}
oDCPRCMY04:FieldSpec := padrao_num_15_6{}
oDCPRCMY04:HyperLabel := HyperLabel{#PRCMY04,"Prcmy04:",NULL_STRING,"MY04_PRCMY04"}

oDCAUT := SingleLineEdit{self,ResourceID{JREQ_AUT,_GetInst()}}
oDCAUT:FieldSpec := padrao_num_08{}
oDCAUT:HyperLabel := HyperLabel{#AUT,"Aut:",NULL_STRING,"MY04_AUT"}

oCCporNUM := PushButton{self,ResourceID{JREQ_PORNUM,_GetInst()}}
oCCporNUM:Image := ico_az{}
oCCporNUM:HyperLabel := HyperLabel{#porNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporNUM:TooltipText := "Ordenar Por Requisicao"

oCCbuscaNUM := PushButton{self,ResourceID{JREQ_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar Um Nº Requesiçao"

oCCTROCANF := PushButton{self,ResourceID{JREQ_TROCANF,_GetInst()}}
oCCTROCANF:HyperLabel := HyperLabel{#TROCANF,"Trocar Nº NF",NULL_STRING,NULL_STRING}
oCCTROCANF:TooltipText := "Trocar Numero Nota Fiscal"

self:Caption := "Requisiçoes Ent/Sai"
self:HyperLabel := HyperLabel{#JREQ,"Requisiçoes Ent/Sai",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 9
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBDATA := DataColumn{date_field{}}
oDBDATA:Width := 9
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)

oDBTIPO1 := DataColumn{padrao_char_01{}}
oDBTIPO1:Width := 5
oDBTIPO1:HyperLabel := oDCTIPO1:HyperLabel 
oDBTIPO1:Caption := "T"
self:Browser:AddColumn(oDBTIPO1)

oDBTIPO2 := DataColumn{padrao_char_01{}}
oDBTIPO2:Width := 5
oDBTIPO2:HyperLabel := oDCTIPO2:HyperLabel 
oDBTIPO2:Caption := "T"
self:Browser:AddColumn(oDBTIPO2)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBQTDE := DataColumn{padrao_num_10_3{}}
oDBQTDE:Width := 6
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
self:Browser:AddColumn(oDBQTDE)

oDBUNID := DataColumn{padrao_char_02{}}
oDBUNID:Width := 5
oDBUNID:HyperLabel := oDCUNID:HyperLabel 
oDBUNID:Caption := "Un:"
self:Browser:AddColumn(oDBUNID)

oDBOS := DataColumn{padrao_num_08{}}
oDBOS:Width := 7
oDBOS:HyperLabel := oDCOS:HyperLabel 
oDBOS:Caption := "Os:"
self:Browser:AddColumn(oDBOS)

oDBITEM := DataColumn{padrao_num_03{}}
oDBITEM:Width := 4
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
self:Browser:AddColumn(oDBITEM)

oDBNRNOTA := DataColumn{padrao_num_08{}}
oDBNRNOTA:Width := 8
oDBNRNOTA:HyperLabel := oDCNRNOTA:HyperLabel 
oDBNRNOTA:Caption := "Nrnota:"
self:Browser:AddColumn(oDBNRNOTA)

oDBNUMMB01 := DataColumn{padrao_num_08{}}
oDBNUMMB01:Width := 9
oDBNUMMB01:HyperLabel := oDCNUMMB01:HyperLabel 
oDBNUMMB01:Caption := "Fornec"
self:Browser:AddColumn(oDBNUMMB01)

oDBAUT := DataColumn{padrao_num_08{}}
oDBAUT:Width := 5
oDBAUT:HyperLabel := oDCAUT:HyperLabel 
oDBAUT:Caption := "Aut:"
self:Browser:AddColumn(oDBAUT)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access NRNOTA() 
return self:FieldGet(#NRNOTA)


assign NRNOTA(uValue) 
self:FieldPut(#NRNOTA, uValue)
return NRNOTA := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access NUMMB01() 
return self:FieldGet(#NUMMB01)


assign NUMMB01(uValue) 
self:FieldPut(#NUMMB01, uValue)
return NUMMB01 := uValue


access OBS() 
return self:FieldGet(#OBS)


assign OBS(uValue) 
self:FieldPut(#OBS, uValue)
return OBS := uValue


access OS() 
return self:FieldGet(#OS)


assign OS(uValue) 
self:FieldPut(#OS, uValue)
return OS := uValue


access PRCMW02() 
return self:FieldGet(#PRCMW02)


assign PRCMW02(uValue) 
self:FieldPut(#PRCMW02, uValue)
return PRCMW02 := uValue


access PRCMY04() 
return self:FieldGet(#PRCMY04)


assign PRCMY04(uValue) 
self:FieldPut(#PRCMY04, uValue)
return PRCMY04 := uValue


access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


access RASTRO() 
return self:FieldGet(#RASTRO)


assign RASTRO(uValue) 
self:FieldPut(#RASTRO, uValue)
return RASTRO := uValue


access TIPO1() 
return self:FieldGet(#TIPO1)


assign TIPO1(uValue) 
self:FieldPut(#TIPO1, uValue)
return TIPO1 := uValue


access TIPO2() 
return self:FieldGet(#TIPO2)


assign TIPO2(uValue) 
self:FieldPut(#TIPO2, uValue)
return TIPO2 := uValue


access UNID() 
return self:FieldGet(#UNID)


assign UNID(uValue) 
self:FieldPut(#UNID, uValue)
return UNID := uValue


END CLASS
