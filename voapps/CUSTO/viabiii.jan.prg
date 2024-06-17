#region DEFINES
STATIC DEFINE JVIII_APROBS := 124 
STATIC DEFINE JVIII_APROVACAO := 117 
STATIC DEFINE JVIII_CLICOG := 116 
STATIC DEFINE JVIII_CLIFOR := 115 
STATIC DEFINE JVIII_DADO := 128 
STATIC DEFINE JVIII_DATALC := 125 
STATIC DEFINE JVIII_GROUPBOX1 := 118 
STATIC DEFINE JVIII_OV := 109 
STATIC DEFINE JVIII_PRECO := 112 
STATIC DEFINE JVIII_PRECODT := 113 
STATIC DEFINE JVIII_PRECOUN := 114 
STATIC DEFINE JVIII_RADIOBUTTON1 := 120 
STATIC DEFINE JVIII_RADIOBUTTON2 := 121 
STATIC DEFINE JVIII_RADIOBUTTON3 := 122 
STATIC DEFINE JVIII_REV := 110 
STATIC DEFINE JVIII_SC_APROVACAO := 108 
STATIC DEFINE JVIII_SC_CLIFOR := 107 
STATIC DEFINE JVIII_SC_DADO := 101 
STATIC DEFINE JVIII_SC_DADO1 := 123 
STATIC DEFINE JVIII_SC_OV := 100 
STATIC DEFINE JVIII_SC_PRECO := 104 
STATIC DEFINE JVIII_SC_PRECODT := 105 
STATIC DEFINE JVIII_SC_PRECODT1 := 126 
STATIC DEFINE JVIII_SC_PRECOUN := 106 
STATIC DEFINE JVIII_SC_REV := 102 
STATIC DEFINE JVIII_SC_SITUACAO := 103 
STATIC DEFINE JVIII_SITOBS := 127 
STATIC DEFINE JVIII_SITUACAO := 111 
STATIC DEFINE JVIII_TIPO := 119 
#endregion

class JVIII inherit DATAWINDOW 

	PROTECT oDBOV as DataColumn
	PROTECT oDBTIPO as DataColumn
	PROTECT oDBDADO as DataColumn
	PROTECT oDBREV as DataColumn
	PROTECT oDBSITUACAO as DataColumn
	PROTECT oDBAPROVACAO as DataColumn
	protect oDCSC_OV as FIXEDTEXT
	protect oDCSC_DADO as FIXEDTEXT
	protect oDCSC_REV as FIXEDTEXT
	protect oDCSC_SITUACAO as FIXEDTEXT
	protect oDCSC_PRECO as FIXEDTEXT
	protect oDCSC_PRECODT as FIXEDTEXT
	protect oDCSC_PRECOUN as FIXEDTEXT
	protect oDCSC_CLIFOR as FIXEDTEXT
	protect oDCSC_APROVACAO as FIXEDTEXT
	protect oDCOV as SINGLELINEEDIT
	protect oDCREV as SINGLELINEEDIT
	protect oDCSITUACAO as SINGLELINEEDIT
	protect oDCPRECO as SINGLELINEEDIT
	protect oDCPRECODT as SINGLELINEEDIT
	protect oDCPRECOUN as SINGLELINEEDIT
	protect oDCCLIFOR as SINGLELINEEDIT
	protect oDCCLICOG as SINGLELINEEDIT
	protect oDCAPROVACAO as SINGLELINEEDIT
	protect oDCGroupBox1 as GROUPBOX
	protect oDCTIPO as RADIOBUTTONGROUP
	protect oCCRadioButton1 as RADIOBUTTON
	protect oCCRadioButton2 as RADIOBUTTON
	protect oCCRadioButton3 as RADIOBUTTON
	protect oDCSC_DADO1 as FIXEDTEXT
	protect oDCAPROBS as SINGLELINEEDIT
	protect oDCDATALC as DATESLE
	protect oDCSC_PRECODT1 as FIXEDTEXT
	protect oDCsitobs as MULTILINEEDIT
	protect oDCdado as MULTILINEEDIT
// 	instance OV 
// 	instance REV 
// 	instance SITUACAO 
// 	instance PRECO 
// 	instance PRECODT 
// 	instance PRECOUN 
// 	instance CLIFOR 
// 	instance CLICOG 
// 	instance APROVACAO 
// 	instance TIPO 
// 	instance APROBS 
// 	instance DATALC 
// 	instance sitobs 
// 	instance dado 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access APROBS() 
return self:FieldGet(#APROBS)


assign APROBS(uValue) 
self:FieldPut(#APROBS, uValue)
return APROBS := uValue


access APROVACAO() 
return self:FieldGet(#APROVACAO)


assign APROVACAO(uValue) 
self:FieldPut(#APROVACAO, uValue)
return APROVACAO := uValue


access CLICOG() 
return self:FieldGet(#CLICOG)


assign CLICOG(uValue) 
self:FieldPut(#CLICOG, uValue)
return CLICOG := uValue


access CLIFOR() 
return self:FieldGet(#CLIFOR)


assign CLIFOR(uValue) 
self:FieldPut(#CLIFOR, uValue)
return CLIFOR := uValue


access dado() 
return self:FieldGet(#dado)


assign dado(uValue) 
self:FieldPut(#dado, uValue)
return dado := uValue


access DATALC() 
return self:FieldGet(#DATALC)


assign DATALC(uValue) 
self:FieldPut(#DATALC, uValue)
return DATALC := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JVIII",_GetInst()},iCtlID)

oDCSC_OV := FixedText{self,ResourceID{JVIII_SC_OV,_GetInst()}}
oDCSC_OV:HyperLabel := HyperLabel{#SC_OV,"Ov:",NULL_STRING,NULL_STRING}

oDCSC_DADO := FixedText{self,ResourceID{JVIII_SC_DADO,_GetInst()}}
oDCSC_DADO:HyperLabel := HyperLabel{#SC_DADO,"Dado:",NULL_STRING,NULL_STRING}

oDCSC_REV := FixedText{self,ResourceID{JVIII_SC_REV,_GetInst()}}
oDCSC_REV:HyperLabel := HyperLabel{#SC_REV,"Rev:",NULL_STRING,NULL_STRING}

oDCSC_SITUACAO := FixedText{self,ResourceID{JVIII_SC_SITUACAO,_GetInst()}}
oDCSC_SITUACAO:HyperLabel := HyperLabel{#SC_SITUACAO,"Situação:",NULL_STRING,NULL_STRING}

oDCSC_PRECO := FixedText{self,ResourceID{JVIII_SC_PRECO,_GetInst()}}
oDCSC_PRECO:HyperLabel := HyperLabel{#SC_PRECO,"Preço:",NULL_STRING,NULL_STRING}

oDCSC_PRECODT := FixedText{self,ResourceID{JVIII_SC_PRECODT,_GetInst()}}
oDCSC_PRECODT:HyperLabel := HyperLabel{#SC_PRECODT,"Data",NULL_STRING,NULL_STRING}

oDCSC_PRECOUN := FixedText{self,ResourceID{JVIII_SC_PRECOUN,_GetInst()}}
oDCSC_PRECOUN:HyperLabel := HyperLabel{#SC_PRECOUN,"Unidade",NULL_STRING,NULL_STRING}

oDCSC_CLIFOR := FixedText{self,ResourceID{JVIII_SC_CLIFOR,_GetInst()}}
oDCSC_CLIFOR:HyperLabel := HyperLabel{#SC_CLIFOR,"Fornecedor",NULL_STRING,NULL_STRING}

oDCSC_APROVACAO := FixedText{self,ResourceID{JVIII_SC_APROVACAO,_GetInst()}}
oDCSC_APROVACAO:HyperLabel := HyperLabel{#SC_APROVACAO,"Condicional",NULL_STRING,NULL_STRING}

oDCOV := SingleLineEdit{self,ResourceID{JVIII_OV,_GetInst()}}
oDCOV:FieldSpec := PADRAO_NUM_08{}
oDCOV:HyperLabel := HyperLabel{#OV,"Ov:",NULL_STRING,"VIABIII_OV"}

oDCREV := SingleLineEdit{self,ResourceID{JVIII_REV,_GetInst()}}
oDCREV:FieldSpec := PADRAO_CHAR_10{}
oDCREV:HyperLabel := HyperLabel{#REV,"Rev:",NULL_STRING,"VIABIII_REV"}
oDCREV:FocusSelect := FSEL_HOME

oDCSITUACAO := SingleLineEdit{self,ResourceID{JVIII_SITUACAO,_GetInst()}}
oDCSITUACAO:FieldSpec := PADRAO_CHAR_01{}
oDCSITUACAO:HyperLabel := HyperLabel{#SITUACAO,"S",NULL_STRING,"VIABIII_SITUACAO"}

oDCPRECO := SingleLineEdit{self,ResourceID{JVIII_PRECO,_GetInst()}}
oDCPRECO:FieldSpec := PADRAO_NUM_12_2{}
oDCPRECO:HyperLabel := HyperLabel{#PRECO,"Preco:",NULL_STRING,"VIABIII_PRECO"}

oDCPRECODT := SingleLineEdit{self,ResourceID{JVIII_PRECODT,_GetInst()}}
oDCPRECODT:FieldSpec := DATE_FIELD{}
oDCPRECODT:HyperLabel := HyperLabel{#PRECODT,"Precodt:",NULL_STRING,"VIABIII_PRECODT"}

oDCPRECOUN := SingleLineEdit{self,ResourceID{JVIII_PRECOUN,_GetInst()}}
oDCPRECOUN:FieldSpec := PADRAO_CHAR_02{}
oDCPRECOUN:HyperLabel := HyperLabel{#PRECOUN,"Precoun:",NULL_STRING,"VIABIII_PRECOUN"}

oDCCLIFOR := SingleLineEdit{self,ResourceID{JVIII_CLIFOR,_GetInst()}}
oDCCLIFOR:FieldSpec := PADRAO_NUM_08{}
oDCCLIFOR:HyperLabel := HyperLabel{#CLIFOR,"Clifor:",NULL_STRING,"VIABIII_CLIFOR"}

oDCCLICOG := SingleLineEdit{self,ResourceID{JVIII_CLICOG,_GetInst()}}
oDCCLICOG:FieldSpec := PADRAO_CHAR_12{}
oDCCLICOG:HyperLabel := HyperLabel{#CLICOG,"Clicog:",NULL_STRING,"VIABIII_CLICOG"}

oDCAPROVACAO := SingleLineEdit{self,ResourceID{JVIII_APROVACAO,_GetInst()}}
oDCAPROVACAO:FieldSpec := PADRAO_CHAR_01{}
oDCAPROVACAO:HyperLabel := HyperLabel{#APROVACAO,"A",NULL_STRING,"VIABIII_APROVACAO"}

oDCGroupBox1 := GroupBox{self,ResourceID{JVIII_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Cotação",NULL_STRING,NULL_STRING}

oCCRadioButton1 := RadioButton{self,ResourceID{JVIII_RADIOBUTTON1,_GetInst()}}
oCCRadioButton1:HyperLabel := HyperLabel{#RadioButton1,"Desenho",NULL_STRING,NULL_STRING}

oCCRadioButton2 := RadioButton{self,ResourceID{JVIII_RADIOBUTTON2,_GetInst()}}
oCCRadioButton2:HyperLabel := HyperLabel{#RadioButton2,"Norma",NULL_STRING,NULL_STRING}

oCCRadioButton3 := RadioButton{self,ResourceID{JVIII_RADIOBUTTON3,_GetInst()}}
oCCRadioButton3:HyperLabel := HyperLabel{#RadioButton3,"Cotação",NULL_STRING,NULL_STRING}

oDCSC_DADO1 := FixedText{self,ResourceID{JVIII_SC_DADO1,_GetInst()}}
oDCSC_DADO1:HyperLabel := HyperLabel{#SC_DADO1,"Obs:",NULL_STRING,NULL_STRING}

oDCAPROBS := SingleLineEdit{self,ResourceID{JVIII_APROBS,_GetInst()}}
oDCAPROBS:FieldSpec := PADRAO_CHAR_255{}
oDCAPROBS:HyperLabel := HyperLabel{#APROBS,"Obs:",NULL_STRING,NULL_STRING}
oDCAPROBS:FocusSelect := FSEL_HOME

oDCDATALC := DateSle{self,ResourceID{JVIII_DATALC,_GetInst()}}
oDCDATALC:FieldSpec := DATE_FIELD{}
oDCDATALC:HyperLabel := HyperLabel{#DATALC,"Precodt:",NULL_STRING,"VIABIII_PRECODT"}

oDCSC_PRECODT1 := FixedText{self,ResourceID{JVIII_SC_PRECODT1,_GetInst()}}
oDCSC_PRECODT1:HyperLabel := HyperLabel{#SC_PRECODT1,"Cotar até/Prazo",NULL_STRING,NULL_STRING}

oDCsitobs := MultiLineEdit{self,ResourceID{JVIII_SITOBS,_GetInst()}}
oDCsitobs:HyperLabel := HyperLabel{#sitobs,NULL_STRING,NULL_STRING,NULL_STRING}
oDCsitobs:FieldSpec := PADRAO_CHAR_255{}

oDCdado := MultiLineEdit{self,ResourceID{JVIII_DADO,_GetInst()}}
oDCdado:HyperLabel := HyperLabel{#dado,"Descricao",NULL_STRING,NULL_STRING}
oDCdado:FieldSpec := PADRAO_CHAR_255{}

oDCTIPO := RadioButtonGroup{self,ResourceID{JVIII_TIPO,_GetInst()}}
oDCTIPO:FillUsing({ ;
					{oCCRadioButton1,"D"}, ;
					{oCCRadioButton2,"N"}, ;
					{oCCRadioButton3,"C"} ;
					})
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo",NULL_STRING,NULL_STRING}
oDCTIPO:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JVIII,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBOV := DataColumn{PADRAO_NUM_08{}}
oDBOV:Width := 7
oDBOV:HyperLabel := oDCOV:HyperLabel 
oDBOV:Caption := "Ov:"
self:Browser:AddColumn(oDBOV)

oDBTIPO := DataColumn{PADRAO_CHAR_01{}}
oDBTIPO:Width := 5
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "Tipo"
self:Browser:AddColumn(oDBTIPO)

oDBDADO := DataColumn{PADRAO_CHAR_255{}}
oDBDADO:Width := 39
oDBDADO:HyperLabel := oDCDADO:HyperLabel 
oDBDADO:Caption := "Descricao"
self:Browser:AddColumn(oDBDADO)

oDBREV := DataColumn{PADRAO_CHAR_10{}}
oDBREV:Width := 5
oDBREV:HyperLabel := oDCREV:HyperLabel 
oDBREV:Caption := "Rev:"
self:Browser:AddColumn(oDBREV)

oDBSITUACAO := DataColumn{PADRAO_CHAR_01{}}
oDBSITUACAO:Width := 4
oDBSITUACAO:HyperLabel := oDCSITUACAO:HyperLabel 
oDBSITUACAO:Caption := "S"
self:Browser:AddColumn(oDBSITUACAO)

oDBAPROVACAO := DataColumn{PADRAO_CHAR_01{}}
oDBAPROVACAO:Width := 6
oDBAPROVACAO:HyperLabel := oDCAPROVACAO:HyperLabel 
oDBAPROVACAO:Caption := "A"
self:Browser:AddColumn(oDBAPROVACAO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access OV() 
return self:FieldGet(#OV)


assign OV(uValue) 
self:FieldPut(#OV, uValue)
return OV := uValue


access PRECO() 
return self:FieldGet(#PRECO)


assign PRECO(uValue) 
self:FieldPut(#PRECO, uValue)
return PRECO := uValue


access PRECODT() 
return self:FieldGet(#PRECODT)


assign PRECODT(uValue) 
self:FieldPut(#PRECODT, uValue)
return PRECODT := uValue


access PRECOUN() 
return self:FieldGet(#PRECOUN)


assign PRECOUN(uValue) 
self:FieldPut(#PRECOUN, uValue)
return PRECOUN := uValue


access REV() 
return self:FieldGet(#REV)


assign REV(uValue) 
self:FieldPut(#REV, uValue)
return REV := uValue


access sitobs() 
return self:FieldGet(#sitobs)


assign sitobs(uValue) 
self:FieldPut(#sitobs, uValue)
return sitobs := uValue


access SITUACAO() 
return self:FieldGet(#SITUACAO)


assign SITUACAO(uValue) 
self:FieldPut(#SITUACAO, uValue)
return SITUACAO := uValue


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


END CLASS
