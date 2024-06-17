#region DEFINES
STATIC DEFINE JCRMR_BUSCACRM := 120 
STATIC DEFINE JCRMR_CMDHOJE := 121 
STATIC DEFINE JCRMR_CRM := 113 
STATIC DEFINE JCRMR_DATA := 117 
STATIC DEFINE JCRMR_DATAF := 100 
STATIC DEFINE JCRMR_FOTO := 122 
STATIC DEFINE JCRMR_OBS := 101 
STATIC DEFINE JCRMR_PRODUTO := 102 
STATIC DEFINE JCRMR_RASTRO := 110 
STATIC DEFINE JCRMR_RASTROA := 112 
STATIC DEFINE JCRMR_RASTRON := 111 
STATIC DEFINE JCRMR_RIRM := 114 
STATIC DEFINE JCRMR_RIST := 115 
STATIC DEFINE JCRMR_SC_CRM := 106 
STATIC DEFINE JCRMR_SC_DATAF := 109 
STATIC DEFINE JCRMR_SC_DATAF1 := 118 
STATIC DEFINE JCRMR_SC_DESTINO2 := 123 
STATIC DEFINE JCRMR_SC_RASTRO := 103 
STATIC DEFINE JCRMR_SC_RASTROA := 105 
STATIC DEFINE JCRMR_SC_RASTRON := 104 
STATIC DEFINE JCRMR_SC_RIRM := 107 
STATIC DEFINE JCRMR_SC_RIST := 108 
STATIC DEFINE JCRMR_SC_RIST1 := 116 
STATIC DEFINE JCRMR_SC_RIST2 := 119 
#endregion

class JCRMR inherit MYDataWindow 

	PROTECT oDBRASTRON as DataColumn
	PROTECT oDBRASTROA as DataColumn
	PROTECT oDBCRM as DataColumn
	PROTECT oDBRIRM as DataColumn
	PROTECT oDBRIST as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBDATAF as DataColumn
	PROTECT oDBPRODUTO as DataColumn
	PROTECT oDBOBS as DataColumn
	protect oDCDATAF as DATESLE
	protect oDCOBS as SINGLELINEEDIT
	protect oDCPRODUTO as SINGLELINEEDIT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCSC_RASTRON as FIXEDTEXT
	protect oDCSC_RASTROA as FIXEDTEXT
	protect oDCSC_CRM as FIXEDTEXT
	protect oDCSC_RIRM as FIXEDTEXT
	protect oDCSC_RIST as FIXEDTEXT
	protect oDCSC_DATAF as FIXEDTEXT
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCRASTRON as SINGLELINEEDIT
	protect oDCRASTROA as SINGLELINEEDIT
	protect oDCCRM as SINGLELINEEDIT
	protect oDCRIRM as SINGLELINEEDIT
	protect oDCRIST as SINGLELINEEDIT
	protect oDCSC_RIST1 as FIXEDTEXT
	protect oDCDATA as SINGLELINEEDIT
	protect oDCSC_DATAF1 as FIXEDTEXT
	protect oDCSC_RIST2 as FIXEDTEXT
	protect oCCbuscacrm as PUSHBUTTON
	protect oCCcmdHoje as PUSHBUTTON
	protect oCCfoto as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
// 	instance DATAF 
// 	instance OBS 
// 	instance PRODUTO 
// 	instance RASTRO 
// 	instance RASTRON 
// 	instance RASTROA 
// 	instance CRM 
// 	instance RIRM 
// 	instance RIST 
// 	instance DATA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CRM() 
return self:FieldGet(#CRM)


assign CRM(uValue) 
self:FieldPut(#CRM, uValue)
return CRM := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access DATAF() 
return self:FieldGet(#DATAF)


assign DATAF(uValue) 
self:FieldPut(#DATAF, uValue)
return DATAF := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCRMR",_GetInst()},iCtlID)

oDCDATAF := DateSle{self,ResourceID{JCRMR_DATAF,_GetInst()}}
oDCDATAF:FieldSpec := DATE_FIELD{}
oDCDATAF:HyperLabel := HyperLabel{#DATAF,"Fec",NULL_STRING,"CRMR_DATAF"}
oDCDATAF:TooltipText := "Data Fechamento do Rastro"

oDCOBS := SingleLineEdit{self,ResourceID{JCRMR_OBS,_GetInst()}}
oDCOBS:FieldSpec := PADRAO_CHAR_100{}
oDCOBS:HyperLabel := HyperLabel{#OBS,"Obs",NULL_STRING,"CRMR_DATAF"}
oDCOBS:TooltipText := "Observaçoes sobre Fechamento"

oDCPRODUTO := SingleLineEdit{self,ResourceID{JCRMR_PRODUTO,_GetInst()}}
oDCPRODUTO:FieldSpec := PADRAO_CHAR_50{}
oDCPRODUTO:HyperLabel := HyperLabel{#PRODUTO,"Produto",NULL_STRING,"CRMR_DATAF"}
oDCPRODUTO:TooltipText := "Produto"

oDCSC_RASTRO := FixedText{self,ResourceID{JCRMR_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCSC_RASTRON := FixedText{self,ResourceID{JCRMR_SC_RASTRON,_GetInst()}}
oDCSC_RASTRON:HyperLabel := HyperLabel{#SC_RASTRON,"Numero",NULL_STRING,NULL_STRING}

oDCSC_RASTROA := FixedText{self,ResourceID{JCRMR_SC_RASTROA,_GetInst()}}
oDCSC_RASTROA:HyperLabel := HyperLabel{#SC_RASTROA,"Ano",NULL_STRING,NULL_STRING}

oDCSC_CRM := FixedText{self,ResourceID{JCRMR_SC_CRM,_GetInst()}}
oDCSC_CRM:HyperLabel := HyperLabel{#SC_CRM,"Crm:",NULL_STRING,NULL_STRING}

oDCSC_RIRM := FixedText{self,ResourceID{JCRMR_SC_RIRM,_GetInst()}}
oDCSC_RIRM:HyperLabel := HyperLabel{#SC_RIRM,"Rirm:",NULL_STRING,NULL_STRING}

oDCSC_RIST := FixedText{self,ResourceID{JCRMR_SC_RIST,_GetInst()}}
oDCSC_RIST:HyperLabel := HyperLabel{#SC_RIST,"Rist:",NULL_STRING,NULL_STRING}

oDCSC_DATAF := FixedText{self,ResourceID{JCRMR_SC_DATAF,_GetInst()}}
oDCSC_DATAF:HyperLabel := HyperLabel{#SC_DATAF,"Fechamento",NULL_STRING,NULL_STRING}

oDCRASTRO := SingleLineEdit{self,ResourceID{JCRMR_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := PADRAO_CHAR_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"CRMR_RASTRO"}

oDCRASTRON := SingleLineEdit{self,ResourceID{JCRMR_RASTRON,_GetInst()}}
oDCRASTRON:FieldSpec := PADRAO_NUM_08{}
oDCRASTRON:HyperLabel := HyperLabel{#RASTRON,"Nº ",NULL_STRING,"CRMR_RASTRON"}

oDCRASTROA := SingleLineEdit{self,ResourceID{JCRMR_RASTROA,_GetInst()}}
oDCRASTROA:FieldSpec := PADRAO_NUM_04{}
oDCRASTROA:HyperLabel := HyperLabel{#RASTROA,"Ano",NULL_STRING,"CRMR_RASTROA"}

oDCCRM := SingleLineEdit{self,ResourceID{JCRMR_CRM,_GetInst()}}
oDCCRM:FieldSpec := PADRAO_NUM_08{}
oDCCRM:HyperLabel := HyperLabel{#CRM,"Crm:",NULL_STRING,"CRMR_CRM"}

oDCRIRM := SingleLineEdit{self,ResourceID{JCRMR_RIRM,_GetInst()}}
oDCRIRM:FieldSpec := PADRAO_NUM_08{}
oDCRIRM:HyperLabel := HyperLabel{#RIRM,"Rirm:",NULL_STRING,"CRMR_RIRM"}

oDCRIST := SingleLineEdit{self,ResourceID{JCRMR_RIST,_GetInst()}}
oDCRIST:FieldSpec := PADRAO_NUM_08{}
oDCRIST:HyperLabel := HyperLabel{#RIST,"Rist:",NULL_STRING,"CRMR_RIST"}

oDCSC_RIST1 := FixedText{self,ResourceID{JCRMR_SC_RIST1,_GetInst()}}
oDCSC_RIST1:HyperLabel := HyperLabel{#SC_RIST1,"Obs:",NULL_STRING,NULL_STRING}

oDCDATA := SingleLineEdit{self,ResourceID{JCRMR_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data",NULL_STRING,"CRMR_DATAF"}

oDCSC_DATAF1 := FixedText{self,ResourceID{JCRMR_SC_DATAF1,_GetInst()}}
oDCSC_DATAF1:HyperLabel := HyperLabel{#SC_DATAF1,"Data",NULL_STRING,NULL_STRING}

oDCSC_RIST2 := FixedText{self,ResourceID{JCRMR_SC_RIST2,_GetInst()}}
oDCSC_RIST2:HyperLabel := HyperLabel{#SC_RIST2,"Produto",NULL_STRING,NULL_STRING}

oCCbuscacrm := PushButton{self,ResourceID{JCRMR_BUSCACRM,_GetInst()}}
oCCbuscacrm:Image := ICO_FIND{}
oCCbuscacrm:HyperLabel := HyperLabel{#buscacrm,NULL_STRING,NULL_STRING,NULL_STRING}

oCCcmdHoje := PushButton{self,ResourceID{JCRMR_CMDHOJE,_GetInst()}}
oCCcmdHoje:HyperLabel := HyperLabel{#cmdHoje,"H",NULL_STRING,NULL_STRING}
oCCcmdHoje:TooltipText := "Marca Fechamento com a Data de Hoje"

oCCfoto := PushButton{self,ResourceID{JCRMR_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JCRMR_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

self:Caption := "Controle de Rastros"
self:HyperLabel := HyperLabel{#JCRMR,"Controle de Rastros",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRASTRON := DataColumn{PADRAO_NUM_08{}}
oDBRASTRON:Width := 9
oDBRASTRON:HyperLabel := oDCRASTRON:HyperLabel 
oDBRASTRON:Caption := "Nº "
self:Browser:AddColumn(oDBRASTRON)

oDBRASTROA := DataColumn{PADRAO_NUM_04{}}
oDBRASTROA:Width := 9
oDBRASTROA:HyperLabel := oDCRASTROA:HyperLabel 
oDBRASTROA:Caption := "Ano"
self:Browser:AddColumn(oDBRASTROA)

oDBCRM := DataColumn{PADRAO_NUM_08{}}
oDBCRM:Width := 7
oDBCRM:HyperLabel := oDCCRM:HyperLabel 
oDBCRM:Caption := "Crm:"
self:Browser:AddColumn(oDBCRM)

oDBRIRM := DataColumn{PADRAO_NUM_08{}}
oDBRIRM:Width := 8
oDBRIRM:HyperLabel := oDCRIRM:HyperLabel 
oDBRIRM:Caption := "Rirm:"
self:Browser:AddColumn(oDBRIRM)

oDBRIST := DataColumn{PADRAO_NUM_08{}}
oDBRIST:Width := 7
oDBRIST:HyperLabel := oDCRIST:HyperLabel 
oDBRIST:Caption := "Rist:"
self:Browser:AddColumn(oDBRIST)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 6
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data"
self:Browser:AddColumn(oDBDATA)

oDBDATAF := DataColumn{DATE_FIELD{}}
oDBDATAF:Width := 7
oDBDATAF:HyperLabel := oDCDATAF:HyperLabel 
oDBDATAF:Caption := "Fec"
self:Browser:AddColumn(oDBDATAF)

oDBPRODUTO := DataColumn{PADRAO_CHAR_50{}}
oDBPRODUTO:Width := 9
oDBPRODUTO:HyperLabel := oDCPRODUTO:HyperLabel 
oDBPRODUTO:Caption := "Produto"
self:Browser:AddColumn(oDBPRODUTO)

oDBOBS := DataColumn{PADRAO_CHAR_100{}}
oDBOBS:Width := 5
oDBOBS:HyperLabel := oDCOBS:HyperLabel 
oDBOBS:Caption := "Obs"
self:Browser:AddColumn(oDBOBS)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access OBS() 
return self:FieldGet(#OBS)


assign OBS(uValue) 
self:FieldPut(#OBS, uValue)
return OBS := uValue


access PRODUTO() 
return self:FieldGet(#PRODUTO)


assign PRODUTO(uValue) 
self:FieldPut(#PRODUTO, uValue)
return PRODUTO := uValue


access RASTRO() 
return self:FieldGet(#RASTRO)


assign RASTRO(uValue) 
self:FieldPut(#RASTRO, uValue)
return RASTRO := uValue


access RASTROA() 
return self:FieldGet(#RASTROA)


assign RASTROA(uValue) 
self:FieldPut(#RASTROA, uValue)
return RASTROA := uValue


access RASTRON() 
return self:FieldGet(#RASTRON)


assign RASTRON(uValue) 
self:FieldPut(#RASTRON, uValue)
return RASTRON := uValue


access RIRM() 
return self:FieldGet(#RIRM)


assign RIRM(uValue) 
self:FieldPut(#RIRM, uValue)
return RIRM := uValue


access RIST() 
return self:FieldGet(#RIST)


assign RIST(uValue) 
self:FieldPut(#RIST, uValue)
return RIST := uValue


END CLASS
