#region DEFINES
STATIC DEFINE JRDT_ANO := 117 
STATIC DEFINE JRDT_BUSCAOV := 132 
STATIC DEFINE JRDT_CODIGO := 113 
STATIC DEFINE JRDT_DATAAPU := 126 
STATIC DEFINE JRDT_DATABAI := 127 
STATIC DEFINE JRDT_FOTO := 130 
STATIC DEFINE JRDT_MEDI4 := 124 
STATIC DEFINE JRDT_MEDIA := 123 
STATIC DEFINE JRDT_MES := 116 
STATIC DEFINE JRDT_PADRA4 := 122 
STATIC DEFINE JRDT_PADRAO := 121 
STATIC DEFINE JRDT_PHORAS := 119 
STATIC DEFINE JRDT_POROV := 131 
STATIC DEFINE JRDT_PQTDDE := 118 
STATIC DEFINE JRDT_QTDDE := 120 
STATIC DEFINE JRDT_SC_ANO := 104 
STATIC DEFINE JRDT_SC_CODIGO := 100 
STATIC DEFINE JRDT_SC_DATAAPU := 111 
STATIC DEFINE JRDT_SC_DATABAI := 112 
STATIC DEFINE JRDT_SC_DESTINO2 := 129 
STATIC DEFINE JRDT_SC_MEDIA := 110 
STATIC DEFINE JRDT_SC_MEDIA1 := 128 
STATIC DEFINE JRDT_SC_MES := 103 
STATIC DEFINE JRDT_SC_PADRA4 := 109 
STATIC DEFINE JRDT_SC_PADRAO := 108 
STATIC DEFINE JRDT_SC_PHORAS := 106 
STATIC DEFINE JRDT_SC_PQTDDE := 105 
STATIC DEFINE JRDT_SC_QTDDE := 107 
STATIC DEFINE JRDT_SC_SEQ := 101 
STATIC DEFINE JRDT_SC_SSQ := 102 
STATIC DEFINE JRDT_SEQ := 114 
STATIC DEFINE JRDT_SIMETRICA := 125 
STATIC DEFINE JRDT_SSQ := 115 
#endregion

PARTIAL class JRDT inherit MYDataWindow 

	PROTECT oDBMES as DataColumn
	PROTECT oDBANO as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBSEQ as DataColumn
	PROTECT oDBSSQ as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSC_SSQ as FIXEDTEXT
	protect oDCSC_MES as FIXEDTEXT
	protect oDCSC_ANO as FIXEDTEXT
	protect oDCSC_PQTDDE as FIXEDTEXT
	protect oDCSC_PHORAS as FIXEDTEXT
	protect oDCSC_QTDDE as FIXEDTEXT
	protect oDCSC_PADRAO as FIXEDTEXT
	protect oDCSC_PADRA4 as FIXEDTEXT
	protect oDCSC_MEDIA as FIXEDTEXT
	protect oDCSC_DATAAPU as FIXEDTEXT
	protect oDCSC_DATABAI as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSEQ as SINGLELINEEDIT
	protect oDCSSQ as SINGLELINEEDIT
	protect oDCMES as SINGLELINEEDIT
	protect oDCANO as SINGLELINEEDIT
	protect oDCPQTDDE as SINGLELINEEDIT
	protect oDCPHORAS as SINGLELINEEDIT
	protect oDCQTDDE as SINGLELINEEDIT
	protect oDCPADRAO as SINGLELINEEDIT
	protect oDCPADRA4 as SINGLELINEEDIT
	protect oDCMEDIA as SINGLELINEEDIT
	protect oDCMEDI4 as SINGLELINEEDIT
	protect oDCSIMETRICA as CHECKBOX
	protect oDCDATAAPU as SINGLELINEEDIT
	protect oDCDATABAI as SINGLELINEEDIT
	protect oDCSC_MEDIA1 as FIXEDTEXT
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
// 	instance CODIGO 
// 	instance SEQ 
// 	instance SSQ 
// 	instance MES 
// 	instance ANO 
// 	instance PQTDDE 
// 	instance PHORAS 
// 	instance QTDDE 
// 	instance PADRAO 
// 	instance PADRA4 
// 	instance MEDIA 
// 	instance MEDI4 
// 	instance SIMETRICA 
// 	instance DATAAPU 
// 	instance DATABAI 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANO() 
return self:FieldGet(#ANO)


assign ANO(uValue) 
self:FieldPut(#ANO, uValue)
return ANO := uValue


METHOD buscaov( ) 
	SELF:KeyFind()

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DATAAPU() 
return self:FieldGet(#DATAAPU)


assign DATAAPU(uValue) 
self:FieldPut(#DATAAPU, uValue)
return DATAAPU := uValue


access DATABAI() 
return self:FieldGet(#DATABAI)


assign DATABAI(uValue) 
self:FieldPut(#DATABAI, uValue)
return DATABAI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRDT",_GetInst()},iCtlID)

oDCSC_CODIGO := FixedText{self,ResourceID{JRDT_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_SEQ := FixedText{self,ResourceID{JRDT_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSC_SSQ := FixedText{self,ResourceID{JRDT_SC_SSQ,_GetInst()}}
oDCSC_SSQ:HyperLabel := HyperLabel{#SC_SSQ,"Ssq:",NULL_STRING,NULL_STRING}

oDCSC_MES := FixedText{self,ResourceID{JRDT_SC_MES,_GetInst()}}
oDCSC_MES:HyperLabel := HyperLabel{#SC_MES,"Mes:",NULL_STRING,NULL_STRING}

oDCSC_ANO := FixedText{self,ResourceID{JRDT_SC_ANO,_GetInst()}}
oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO,"Ano:",NULL_STRING,NULL_STRING}

oDCSC_PQTDDE := FixedText{self,ResourceID{JRDT_SC_PQTDDE,_GetInst()}}
oDCSC_PQTDDE:HyperLabel := HyperLabel{#SC_PQTDDE,"P Qtde",NULL_STRING,NULL_STRING}

oDCSC_PHORAS := FixedText{self,ResourceID{JRDT_SC_PHORAS,_GetInst()}}
oDCSC_PHORAS:HyperLabel := HyperLabel{#SC_PHORAS,"PC Horas:",NULL_STRING,NULL_STRING}

oDCSC_QTDDE := FixedText{self,ResourceID{JRDT_SC_QTDDE,_GetInst()}}
oDCSC_QTDDE:HyperLabel := HyperLabel{#SC_QTDDE,"Qtdde:",NULL_STRING,NULL_STRING}

oDCSC_PADRAO := FixedText{self,ResourceID{JRDT_SC_PADRAO,_GetInst()}}
oDCSC_PADRAO:HyperLabel := HyperLabel{#SC_PADRAO,"Padrao:",NULL_STRING,NULL_STRING}

oDCSC_PADRA4 := FixedText{self,ResourceID{JRDT_SC_PADRA4,_GetInst()}}
oDCSC_PADRA4:HyperLabel := HyperLabel{#SC_PADRA4,"Padrao II",NULL_STRING,NULL_STRING}

oDCSC_MEDIA := FixedText{self,ResourceID{JRDT_SC_MEDIA,_GetInst()}}
oDCSC_MEDIA:HyperLabel := HyperLabel{#SC_MEDIA,"Media:",NULL_STRING,NULL_STRING}

oDCSC_DATAAPU := FixedText{self,ResourceID{JRDT_SC_DATAAPU,_GetInst()}}
oDCSC_DATAAPU:HyperLabel := HyperLabel{#SC_DATAAPU,"Data Apuracao",NULL_STRING,NULL_STRING}

oDCSC_DATABAI := FixedText{self,ResourceID{JRDT_SC_DATABAI,_GetInst()}}
oDCSC_DATABAI:HyperLabel := HyperLabel{#SC_DATABAI,"Data Baixa",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JRDT_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"RDT_CODIGO"}

oDCSEQ := SingleLineEdit{self,ResourceID{JRDT_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := padrao_num_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"RDT_SEQ"}

oDCSSQ := SingleLineEdit{self,ResourceID{JRDT_SSQ,_GetInst()}}
oDCSSQ:FieldSpec := padrao_num_03{}
oDCSSQ:HyperLabel := HyperLabel{#SSQ,"Ssq:",NULL_STRING,"RDT_SSQ"}

oDCMES := SingleLineEdit{self,ResourceID{JRDT_MES,_GetInst()}}
oDCMES:FieldSpec := padrao_num_02{}
oDCMES:HyperLabel := HyperLabel{#MES,"Mes:",NULL_STRING,"RDT_MES"}

oDCANO := SingleLineEdit{self,ResourceID{JRDT_ANO,_GetInst()}}
oDCANO:FieldSpec := padrao_num_04{}
oDCANO:HyperLabel := HyperLabel{#ANO,"Ano:",NULL_STRING,"RDT_ANO"}

oDCPQTDDE := SingleLineEdit{self,ResourceID{JRDT_PQTDDE,_GetInst()}}
oDCPQTDDE:FieldSpec := padrao_num_06{}
oDCPQTDDE:HyperLabel := HyperLabel{#PQTDDE,"Pqtdde:",NULL_STRING,"RDT_PQTDDE"}

oDCPHORAS := SingleLineEdit{self,ResourceID{JRDT_PHORAS,_GetInst()}}
oDCPHORAS:FieldSpec := padrao_num_06_2{}
oDCPHORAS:HyperLabel := HyperLabel{#PHORAS,"Phoras:",NULL_STRING,"RDT_PHORAS"}

oDCQTDDE := SingleLineEdit{self,ResourceID{JRDT_QTDDE,_GetInst()}}
oDCQTDDE:FieldSpec := padrao_num_09_2{}
oDCQTDDE:HyperLabel := HyperLabel{#QTDDE,"Qtdde:",NULL_STRING,"RDT_QTDDE"}

oDCPADRAO := SingleLineEdit{self,ResourceID{JRDT_PADRAO,_GetInst()}}
oDCPADRAO:FieldSpec := padrao_num_05{}
oDCPADRAO:HyperLabel := HyperLabel{#PADRAO,"Padrao:",NULL_STRING,"RDT_PADRAO"}

oDCPADRA4 := SingleLineEdit{self,ResourceID{JRDT_PADRA4,_GetInst()}}
oDCPADRA4:FieldSpec := padrao_num_05{}
oDCPADRA4:HyperLabel := HyperLabel{#PADRA4,"Padra4:",NULL_STRING,"RDT_PADRA4"}

oDCMEDIA := SingleLineEdit{self,ResourceID{JRDT_MEDIA,_GetInst()}}
oDCMEDIA:FieldSpec := padrao_num_06_2{}
oDCMEDIA:HyperLabel := HyperLabel{#MEDIA,"Media:",NULL_STRING,"RDT_MEDIA"}

oDCMEDI4 := SingleLineEdit{self,ResourceID{JRDT_MEDI4,_GetInst()}}
oDCMEDI4:FieldSpec := padrao_num_06_2{}
oDCMEDI4:HyperLabel := HyperLabel{#MEDI4,"Medi4:",NULL_STRING,"RDT_MEDI4"}

oDCSIMETRICA := CheckBox{self,ResourceID{JRDT_SIMETRICA,_GetInst()}}
oDCSIMETRICA:HyperLabel := HyperLabel{#SIMETRICA,"Simetrica",NULL_STRING,"RDT_SIMETRICA"}
oDCSIMETRICA:FieldSpec := logic_field{}

oDCDATAAPU := SingleLineEdit{self,ResourceID{JRDT_DATAAPU,_GetInst()}}
oDCDATAAPU:FieldSpec := date_field{}
oDCDATAAPU:HyperLabel := HyperLabel{#DATAAPU,"Dataapu:",NULL_STRING,"RDT_DATAAPU"}

oDCDATABAI := SingleLineEdit{self,ResourceID{JRDT_DATABAI,_GetInst()}}
oDCDATABAI:FieldSpec := date_field{}
oDCDATABAI:HyperLabel := HyperLabel{#DATABAI,"Databai:",NULL_STRING,"RDT_DATABAI"}

oDCSC_MEDIA1 := FixedText{self,ResourceID{JRDT_SC_MEDIA1,_GetInst()}}
oDCSC_MEDIA1:HyperLabel := HyperLabel{#SC_MEDIA1,"Media II",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JRDT_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JRDT_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oCCporov := PushButton{self,ResourceID{JRDT_POROV,_GetInst()}}
oCCporov:Image := ICO_AZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Clique para ordenar por Numero"

oCCbuscaov := PushButton{self,ResourceID{JRDT_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ICO_FIND{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaov:TooltipText := "Clique Para Localizar Por Numero"

self:Caption := "Tempo Produto Apurado"
self:HyperLabel := HyperLabel{#JRDT,"Tempo Produto Apurado",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBMES := DataColumn{padrao_num_02{}}
oDBMES:Width := 6
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "Mes:"
self:Browser:AddColumn(oDBMES)

oDBANO := DataColumn{padrao_num_04{}}
oDBANO:Width := 10
oDBANO:HyperLabel := oDCANO:HyperLabel 
oDBANO:Caption := "Ano:"
self:Browser:AddColumn(oDBANO)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 32
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBSEQ := DataColumn{padrao_num_03{}}
oDBSEQ:Width := 6
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
self:Browser:AddColumn(oDBSEQ)

oDBSSQ := DataColumn{padrao_num_03{}}
oDBSSQ:Width := 7
oDBSSQ:HyperLabel := oDCSSQ:HyperLabel 
oDBSSQ:Caption := "Ssq:"
self:Browser:AddColumn(oDBSSQ)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MEDI4() 
return self:FieldGet(#MEDI4)


assign MEDI4(uValue) 
self:FieldPut(#MEDI4, uValue)
return MEDI4 := uValue


access MEDIA() 
return self:FieldGet(#MEDIA)


assign MEDIA(uValue) 
self:FieldPut(#MEDIA, uValue)
return MEDIA := uValue


access MES() 
return self:FieldGet(#MES)


assign MES(uValue) 
self:FieldPut(#MES, uValue)
return MES := uValue


access PADRA4() 
return self:FieldGet(#PADRA4)


assign PADRA4(uValue) 
self:FieldPut(#PADRA4, uValue)
return PADRA4 := uValue


access PADRAO() 
return self:FieldGet(#PADRAO)


assign PADRAO(uValue) 
self:FieldPut(#PADRAO, uValue)
return PADRAO := uValue


access PHORAS() 
return self:FieldGet(#PHORAS)


assign PHORAS(uValue) 
self:FieldPut(#PHORAS, uValue)
return PHORAS := uValue


METHOD porov( ) 
	SELF:KeyFind()

access PQTDDE() 
return self:FieldGet(#PQTDDE)


assign PQTDDE(uValue) 
self:FieldPut(#PQTDDE, uValue)
return PQTDDE := uValue


access QTDDE() 
return self:FieldGet(#QTDDE)


assign QTDDE(uValue) 
self:FieldPut(#QTDDE, uValue)
return QTDDE := uValue


access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


access SIMETRICA() 
return self:FieldGet(#SIMETRICA)


assign SIMETRICA(uValue) 
self:FieldPut(#SIMETRICA, uValue)
return SIMETRICA := uValue


access SSQ() 
return self:FieldGet(#SSQ)


assign SSQ(uValue) 
self:FieldPut(#SSQ, uValue)
return SSQ := uValue


END CLASS
