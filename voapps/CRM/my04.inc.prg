#region DEFINES
STATIC DEFINE JMY04_AUT := 106 
STATIC DEFINE JMY04_CANCELAR := 145 
STATIC DEFINE JMY04_CARGA := 138 
STATIC DEFINE JMY04_CODIGO := 122 
STATIC DEFINE JMY04_COGNOME := 127 
STATIC DEFINE JMY04_DATA := 110 
STATIC DEFINE JMY04_DEP := 135 
STATIC DEFINE JMY04_ESCPED := 128 
STATIC DEFINE JMY04_FIXEDTEXT3 := 146 
STATIC DEFINE JMY04_IMPRIMIR1 := 147 
STATIC DEFINE JMY04_IPI := 129 
STATIC DEFINE JMY04_ITEM := 101 
STATIC DEFINE JMY04_MTCO := 139 
STATIC DEFINE JMY04_MUDDAT := 141 
STATIC DEFINE JMY04_NOME := 137 
STATIC DEFINE JMY04_NRNOTA := 103 
STATIC DEFINE JMY04_NUMMB01 := 124 
STATIC DEFINE JMY04_OBS := 107 
STATIC DEFINE JMY04_OK := 143 
STATIC DEFINE JMY04_OS := 100 
STATIC DEFINE JMY04_PEGPED := 108 
STATIC DEFINE JMY04_PGTO := 132 
STATIC DEFINE JMY04_PRAZO := 134 
STATIC DEFINE JMY04_PRCMW02 := 125 
STATIC DEFINE JMY04_PRCMY04 := 104 
STATIC DEFINE JMY04_QTDE := 102 
STATIC DEFINE JMY04_QTDEINI := 123 
STATIC DEFINE JMY04_RASTRO := 105 
STATIC DEFINE JMY04_SC_CODIGO := 112 
STATIC DEFINE JMY04_SC_NRNOTA := 118 
STATIC DEFINE JMY04_SC_NUMMB01 := 119 
STATIC DEFINE JMY04_SC_NUMMB2 := 130 
STATIC DEFINE JMY04_SC_NUMMB3 := 131 
STATIC DEFINE JMY04_SC_NUMMB4 := 133 
STATIC DEFINE JMY04_SC_NUMMB5 := 136 
STATIC DEFINE JMY04_SC_OBS := 116 
STATIC DEFINE JMY04_SC_OS := 115 
STATIC DEFINE JMY04_SC_OS1 := 126 
STATIC DEFINE JMY04_SC_PRCMW02 := 120 
STATIC DEFINE JMY04_SC_QTDE := 113 
STATIC DEFINE JMY04_SC_RASTRO := 117 
STATIC DEFINE JMY04_SC_RASTRO1 := 140 
STATIC DEFINE JMY04_SC_TIPO2 := 111 
STATIC DEFINE JMY04_SC_UNID := 114 
STATIC DEFINE JMY04_THEFIXEDTEXT10 := 142 
STATIC DEFINE JMY04_THEFIXEDTEXT9 := 144 
STATIC DEFINE JMY04_TIPO2 := 121 
STATIC DEFINE JMY04_UNID := 109 
STATIC DEFINE JMY04_ZERA := 148 
#endregion

class jmy04 inherit MYDatadialog 

	protect oDCOS as RIGHTSLE
	protect oDCITEM as RIGHTSLE
	protect oDCQTDE as RIGHTSLE
	protect oDCNRNOTA as RIGHTSLE
	protect oDCPRCMY04 as RIGHTSLE
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCAUT as RIGHTSLE
	protect oDCOBS as SINGLELINEEDIT
	protect oCCPEGPED as PUSHBUTTON
	protect oDCUNID as SINGLELINEEDIT
	protect oDCDATA as SINGLELINEEDIT
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
	protect oDCTIPO2 as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCQTDEINI as SINGLELINEEDIT
	protect oDCNUMMB01 as SINGLELINEEDIT
	protect oDCPRCMW02 as SINGLELINEEDIT
	protect oDCSC_OS1 as FIXEDTEXT
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oCCescped as PUSHBUTTON
	protect oDCIPI as SINGLELINEEDIT
	protect oDCSC_NUMMB2 as FIXEDTEXT
	protect oDCSC_NUMMB3 as FIXEDTEXT
	protect oDCPGTO as SINGLELINEEDIT
	protect oDCSC_NUMMB4 as FIXEDTEXT
	protect oDCPRAZO as SINGLELINEEDIT
	protect oDCDEP as SINGLELINEEDIT
	protect oDCSC_NUMMB5 as FIXEDTEXT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCCarga as CHECKBOX
	protect oDCMTCO as CHECKBOX
	protect oDCSC_RASTRO1 as FIXEDTEXT
	protect oCCmuddat as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCFixedText3 as FIXEDTEXT
	protect oCCimprimir1 as PUSHBUTTON
	protect oCCzera as PUSHBUTTON
// 	instance OS 
// 	instance ITEM 
// 	instance QTDE 
// 	instance NRNOTA 
// 	instance PRCMY04 
// 	instance RASTRO 
// 	instance AUT 
// 	instance OBS 
// 	instance UNID 
// 	instance DATA 
// 	instance TIPO2 
// 	instance CODIGO 
// 	instance QTDEINI 
// 	instance NUMMB01 
// 	instance PRCMW02 
// 	instance COGNOME 
// 	instance IPI 
// 	instance PGTO 
// 	instance PRAZO 
// 	instance DEP 
// 	instance NOME 
// 	instance Carga 
// 	instance MTCO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AUT() 
return self:FieldGet(#AUT)


assign AUT(uValue) 
self:FieldPut(#AUT, uValue)
return AUT := uValue


access Carga() 
return self:FieldGet(#Carga)


assign Carga(uValue) 
self:FieldPut(#Carga, uValue)
return Carga := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access DEP() 
return self:FieldGet(#DEP)


assign DEP(uValue) 
self:FieldPut(#DEP, uValue)
return DEP := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jmy04",_GetInst()},iCtlID)

oDCOS := rightSle{self,ResourceID{JMY04_OS,_GetInst()}}
oDCOS:FieldSpec := PADRAO_NUM_08{}
oDCOS:HyperLabel := HyperLabel{#OS,"Os:",NULL_STRING,"MY04_OS"}
oDCOS:FocusSelect := FSEL_ALL
oDCOS:TooltipText := "Numero do Pedido"

oDCITEM := rightSle{self,ResourceID{JMY04_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_NUM_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"MY04_ITEM"}
oDCITEM:FocusSelect := FSEL_ALL
oDCITEM:TooltipText := "item do Pedido"

oDCQTDE := rightSle{self,ResourceID{JMY04_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := PADRAO_NUM_10_3{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"MY04_QTDE"}
oDCQTDE:TooltipText := "Quantidade Recebida"

oDCNRNOTA := rightSle{self,ResourceID{JMY04_NRNOTA,_GetInst()}}
oDCNRNOTA:FieldSpec := PADRAO_NUM_08{}
oDCNRNOTA:HyperLabel := HyperLabel{#NRNOTA,"Nrnota:",NULL_STRING,"MY04_NRNOTA"}
oDCNRNOTA:TooltipText := "Numero da Nota Fiscal"

oDCPRCMY04 := rightSle{self,ResourceID{JMY04_PRCMY04,_GetInst()}}
oDCPRCMY04:FieldSpec := PADRAO_NUM_15_6{}
oDCPRCMY04:HyperLabel := HyperLabel{#PRCMY04,"Prcmy04:",NULL_STRING,"MY04_PRCMY04"}
oDCPRCMY04:TooltipText := "Preço da Nota Fiscal"

oDCRASTRO := SingleLineEdit{self,ResourceID{JMY04_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := PADRAO_CHAR_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"MY04_RASTRO"}
oDCRASTRO:TooltipText := "Numero da Rastreabilidade"

oDCAUT := rightSle{self,ResourceID{JMY04_AUT,_GetInst()}}
oDCAUT:FieldSpec := PADRAO_NUM_08{}
oDCAUT:HyperLabel := HyperLabel{#AUT,"AUT",NULL_STRING,"MY04_OS"}
oDCAUT:TooltipText := "Numero Autorizacao caso haja Divergencia do Pedido"

oDCOBS := SingleLineEdit{self,ResourceID{JMY04_OBS,_GetInst()}}
oDCOBS:FieldSpec := PADRAO_CHAR_40{}
oDCOBS:HyperLabel := HyperLabel{#OBS,"Obs:",NULL_STRING,"MY04_OBS"}
oDCOBS:TooltipText := "Observaçoes"

oCCPEGPED := PushButton{self,ResourceID{JMY04_PEGPED,_GetInst()}}
oCCPEGPED:HyperLabel := HyperLabel{#PEGPED,"-->",NULL_STRING,NULL_STRING}
oCCPEGPED:TooltipText := "Retorna os Dados de Um Pedido"

oDCUNID := SingleLineEdit{self,ResourceID{JMY04_UNID,_GetInst()}}
oDCUNID:FieldSpec := PADRAO_CHAR_02{}
oDCUNID:HyperLabel := HyperLabel{#UNID,"Unid:",NULL_STRING,"MY04_UNID"}
oDCUNID:TooltipText := "Unidade do Pedido"

oDCDATA := SingleLineEdit{self,ResourceID{JMY04_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"MY04_DATA"}
oDCDATA:TooltipText := "Data"

oDCSC_TIPO2 := FixedText{self,ResourceID{JMY04_SC_TIPO2,_GetInst()}}
oDCSC_TIPO2:HyperLabel := HyperLabel{#SC_TIPO2,"T",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JMY04_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{self,ResourceID{JMY04_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCSC_UNID := FixedText{self,ResourceID{JMY04_SC_UNID,_GetInst()}}
oDCSC_UNID:HyperLabel := HyperLabel{#SC_UNID,"Unid:",NULL_STRING,NULL_STRING}

oDCSC_OS := FixedText{self,ResourceID{JMY04_SC_OS,_GetInst()}}
oDCSC_OS:HyperLabel := HyperLabel{#SC_OS,"Pedido",NULL_STRING,NULL_STRING}

oDCSC_OBS := FixedText{self,ResourceID{JMY04_SC_OBS,_GetInst()}}
oDCSC_OBS:HyperLabel := HyperLabel{#SC_OBS,"Obs:",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{JMY04_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCSC_NRNOTA := FixedText{self,ResourceID{JMY04_SC_NRNOTA,_GetInst()}}
oDCSC_NRNOTA:HyperLabel := HyperLabel{#SC_NRNOTA,"Nrnota:",NULL_STRING,NULL_STRING}

oDCSC_NUMMB01 := FixedText{self,ResourceID{JMY04_SC_NUMMB01,_GetInst()}}
oDCSC_NUMMB01:HyperLabel := HyperLabel{#SC_NUMMB01,"Fornecedor",NULL_STRING,NULL_STRING}

oDCSC_PRCMW02 := FixedText{self,ResourceID{JMY04_SC_PRCMW02,_GetInst()}}
oDCSC_PRCMW02:HyperLabel := HyperLabel{#SC_PRCMW02,"Preço",NULL_STRING,NULL_STRING}

oDCTIPO2 := SingleLineEdit{self,ResourceID{JMY04_TIPO2,_GetInst()}}
oDCTIPO2:FieldSpec := PADRAO_CHAR_01{}
oDCTIPO2:HyperLabel := HyperLabel{#TIPO2,"Tipo2:",NULL_STRING,"MY04_TIPO2"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JMY04_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MY04_CODIGO"}

oDCQTDEINI := SingleLineEdit{self,ResourceID{JMY04_QTDEINI,_GetInst()}}
oDCQTDEINI:FieldSpec := PADRAO_NUM_10_3{}
oDCQTDEINI:HyperLabel := HyperLabel{#QTDEINI,"Qtdeini:",NULL_STRING,"MY04_QTDEINI"}
oDCQTDEINI:TooltipText := "Quantidade do Pedido"

oDCNUMMB01 := SingleLineEdit{self,ResourceID{JMY04_NUMMB01,_GetInst()}}
oDCNUMMB01:FieldSpec := PADRAO_NUM_08{}
oDCNUMMB01:HyperLabel := HyperLabel{#NUMMB01,"Nummb01:",NULL_STRING,"MY04_NUMMB01"}

oDCPRCMW02 := SingleLineEdit{self,ResourceID{JMY04_PRCMW02,_GetInst()}}
oDCPRCMW02:FieldSpec := PADRAO_NUM_15_6{}
oDCPRCMW02:HyperLabel := HyperLabel{#PRCMW02,"Prcmw02:",NULL_STRING,"MY04_PRCMW02"}
oDCPRCMW02:TooltipText := "Preço do Pedido"

oDCSC_OS1 := FixedText{self,ResourceID{JMY04_SC_OS1,_GetInst()}}
oDCSC_OS1:HyperLabel := HyperLabel{#SC_OS1,"Autorizacao",NULL_STRING,NULL_STRING}

oDCCOGNOME := SingleLineEdit{self,ResourceID{JMY04_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := PADRAO_CHAR_10{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"COGNOME",NULL_STRING,"MY04_RASTRO"}

oCCescped := PushButton{self,ResourceID{JMY04_ESCPED,_GetInst()}}
oCCescped:HyperLabel := HyperLabel{#escped,"...",NULL_STRING,NULL_STRING}
oCCescped:TooltipText := "Escolher os Dados do Pedido"

oDCIPI := SingleLineEdit{self,ResourceID{JMY04_IPI,_GetInst()}}
oDCIPI:HyperLabel := HyperLabel{#IPI,"IPI",NULL_STRING,"MY04_NUMMB01"}

oDCSC_NUMMB2 := FixedText{self,ResourceID{JMY04_SC_NUMMB2,_GetInst()}}
oDCSC_NUMMB2:HyperLabel := HyperLabel{#SC_NUMMB2,"IPI",NULL_STRING,NULL_STRING}

oDCSC_NUMMB3 := FixedText{self,ResourceID{JMY04_SC_NUMMB3,_GetInst()}}
oDCSC_NUMMB3:HyperLabel := HyperLabel{#SC_NUMMB3,"Prazo",NULL_STRING,NULL_STRING}

oDCPGTO := SingleLineEdit{self,ResourceID{JMY04_PGTO,_GetInst()}}
oDCPGTO:HyperLabel := HyperLabel{#PGTO,"PGTO",NULL_STRING,"MY04_NUMMB01"}

oDCSC_NUMMB4 := FixedText{self,ResourceID{JMY04_SC_NUMMB4,_GetInst()}}
oDCSC_NUMMB4:HyperLabel := HyperLabel{#SC_NUMMB4,"Pgto",NULL_STRING,NULL_STRING}

oDCPRAZO := SingleLineEdit{self,ResourceID{JMY04_PRAZO,_GetInst()}}
oDCPRAZO:HyperLabel := HyperLabel{#PRAZO,"PRAZO",NULL_STRING,"MY04_NUMMB01"}

oDCDEP := SingleLineEdit{self,ResourceID{JMY04_DEP,_GetInst()}}
oDCDEP:HyperLabel := HyperLabel{#DEP,"DEP",NULL_STRING,"MY04_NUMMB01"}

oDCSC_NUMMB5 := FixedText{self,ResourceID{JMY04_SC_NUMMB5,_GetInst()}}
oDCSC_NUMMB5:HyperLabel := HyperLabel{#SC_NUMMB5,"Dep",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JMY04_NOME,_GetInst()}}
oDCNOME:HyperLabel := HyperLabel{#NOME,"NOME",NULL_STRING,"MY04_CODIGO"}

oDCCarga := CheckBox{self,ResourceID{JMY04_CARGA,_GetInst()}}
oDCCarga:HyperLabel := HyperLabel{#Carga,"Carga/Aceitar",NULL_STRING,NULL_STRING}
oDCCarga:TooltipText := "Aceitar Carga Excessiva"

oDCMTCO := CheckBox{self,ResourceID{JMY04_MTCO,_GetInst()}}
oDCMTCO:HyperLabel := HyperLabel{#MTCO,"MT-CO/Aceitar",NULL_STRING,NULL_STRING}
oDCMTCO:TooltipText := "Materia Prima /Mao Obra Aceitar"

oDCSC_RASTRO1 := FixedText{self,ResourceID{JMY04_SC_RASTRO1,_GetInst()}}
oDCSC_RASTRO1:HyperLabel := HyperLabel{#SC_RASTRO1,"Data:",NULL_STRING,NULL_STRING}

oCCmuddat := PushButton{self,ResourceID{JMY04_MUDDAT,_GetInst()}}
oCCmuddat:HyperLabel := HyperLabel{#muddat,"Data",NULL_STRING,NULL_STRING}
oCCmuddat:TooltipText := "Habilita Troca de Data"

oDCtheFixedText10 := FixedText{self,ResourceID{JMY04_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JMY04_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}
oCCOK:TooltipText := "Lança o Recebimento"

oDCtheFixedText9 := FixedText{self,ResourceID{JMY04_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JMY04_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}
oCCCancelar:TooltipText := "Encerrar Lançamentos"

oDCFixedText3 := FixedText{self,ResourceID{JMY04_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Imprimir",NULL_STRING,NULL_STRING}

oCCimprimir1 := PushButton{self,ResourceID{JMY04_IMPRIMIR1,_GetInst()}}
oCCimprimir1:HyperLabel := HyperLabel{#imprimir1,NULL_STRING,NULL_STRING,NULL_STRING}
oCCimprimir1:Image := ico_print{}
oCCimprimir1:TooltipText := "Chama Relatorios de Recebimento"

oCCzera := PushButton{self,ResourceID{JMY04_ZERA,_GetInst()}}
oCCzera:HyperLabel := HyperLabel{#zera,"zerar",NULL_STRING,NULL_STRING}
oCCzera:TooltipText := "Zera os Dados Para Iniciar Novo Lançamento"

self:Caption := "Outros Lançamentos"
self:HyperLabel := HyperLabel{#jmy04,"Outros Lançamentos",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access IPI() 
return self:FieldGet(#IPI)


assign IPI(uValue) 
self:FieldPut(#IPI, uValue)
return IPI := uValue


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access MTCO() 
return self:FieldGet(#MTCO)


assign MTCO(uValue) 
self:FieldPut(#MTCO, uValue)
return MTCO := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access NRNOTA() 
return self:FieldGet(#NRNOTA)


assign NRNOTA(uValue) 
self:FieldPut(#NRNOTA, uValue)
return NRNOTA := uValue


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


access PGTO() 
return self:FieldGet(#PGTO)


assign PGTO(uValue) 
self:FieldPut(#PGTO, uValue)
return PGTO := uValue


access PRAZO() 
return self:FieldGet(#PRAZO)


assign PRAZO(uValue) 
self:FieldPut(#PRAZO, uValue)
return PRAZO := uValue


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


access QTDEINI() 
return self:FieldGet(#QTDEINI)


assign QTDEINI(uValue) 
self:FieldPut(#QTDEINI, uValue)
return QTDEINI := uValue


access RASTRO() 
return self:FieldGet(#RASTRO)


assign RASTRO(uValue) 
self:FieldPut(#RASTRO, uValue)
return RASTRO := uValue


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
