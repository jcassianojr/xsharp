#region DEFINES
STATIC DEFINE JCRMFN_BTNPEGMS01 := 137 
STATIC DEFINE JCRMFN_BUSCAR := 148 
STATIC DEFINE JCRMFN_CALCEMB := 142 
STATIC DEFINE JCRMFN_CALCPECA := 140 
STATIC DEFINE JCRMFN_CALCPESO := 141 
STATIC DEFINE JCRMFN_CLIENTE := 105 
STATIC DEFINE JCRMFN_CMDCRM := 129 
STATIC DEFINE JCRMFN_CMDGERA := 124 
STATIC DEFINE JCRMFN_CMDMAIS2 := 127 
STATIC DEFINE JCRMFN_CMDMENOS2 := 126 
STATIC DEFINE JCRMFN_CMDMO := 132 
STATIC DEFINE JCRMFN_CMDSO := 130 
STATIC DEFINE JCRMFN_CMDZERA := 125 
STATIC DEFINE JCRMFN_CODIGO := 104 
STATIC DEFINE JCRMFN_CODMR01 := 109 
STATIC DEFINE JCRMFN_COGNOME := 103 
STATIC DEFINE JCRMFN_DATA := 100 
STATIC DEFINE JCRMFN_ESCCLI := 147 
STATIC DEFINE JCRMFN_ESCCOD := 136 
STATIC DEFINE JCRMFN_ESCFOR := 134 
STATIC DEFINE JCRMFN_ESCMR := 143 
STATIC DEFINE JCRMFN_FORNECEDO := 102 
STATIC DEFINE JCRMFN_FOTO := 146 
STATIC DEFINE JCRMFN_NOMMR01 := 110 
STATIC DEFINE JCRMFN_NUMERO := 122 
STATIC DEFINE JCRMFN_PCEMB := 111 
STATIC DEFINE JCRMFN_PCEMBQ := 112 
STATIC DEFINE JCRMFN_PEGFOR := 135 
STATIC DEFINE JCRMFN_PEGMR01 := 144 
STATIC DEFINE JCRMFN_PESOUNI := 106 
STATIC DEFINE JCRMFN_QTDEKG := 108 
STATIC DEFINE JCRMFN_QTDEPC := 107 
STATIC DEFINE JCRMFN_RASTRO := 123 
STATIC DEFINE JCRMFN_RASTROANO := 128 
STATIC DEFINE JCRMFN_RASTRONUM := 101 
STATIC DEFINE JCRMFN_SC_CLIENTE := 117 
STATIC DEFINE JCRMFN_SC_CODIGO := 116 
STATIC DEFINE JCRMFN_SC_CODMR01 := 119 
STATIC DEFINE JCRMFN_SC_DATA := 114 
STATIC DEFINE JCRMFN_SC_DESTINO2 := 145 
STATIC DEFINE JCRMFN_SC_FORNECEDO := 115 
STATIC DEFINE JCRMFN_SC_NUMERO := 113 
STATIC DEFINE JCRMFN_SC_PCEMB := 120 
STATIC DEFINE JCRMFN_SC_PCEMBQ := 121 
STATIC DEFINE JCRMFN_SC_PESOUNI := 118 
STATIC DEFINE JCRMFN_SC_QTDEKG := 138 
STATIC DEFINE JCRMFN_SC_QTDEPC := 139 
STATIC DEFINE JCRMFN_THEFIXEDTEXT7 := 133 
STATIC DEFINE JCRMFN_TIPCOD := 131 
#endregion

class jcrmfn inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBRASTRO as DataColumn
	PROTECT oDBFORNECEDO as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBPESOUNI as DataColumn
	PROTECT oDBCODMR01 as DataColumn
	PROTECT oDBPCEMB as DataColumn
	PROTECT oDBPCEMBQ as DataColumn
	PROTECT oDBRASTROANO as DataColumn
	PROTECT oDBRASTRONUM as DataColumn
	PROTECT oDBTIPCOD as DataColumn
	PROTECT oDBQTDEKG as DataColumn
	PROTECT oDBQTDEPC as DataColumn
	protect oDCDATA as DATESLE
	protect oDCRASTRONUM as RIGHTSLE
	protect oDCFORNECEDO as RIGHTSLE
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCCLIENTE as RIGHTSLE
	protect oDCPESOUNI as RIGHTSLE
	protect oDCQTDEPC as RIGHTSLE
	protect oDCQTDEKG as RIGHTSLE
	protect oDCCODMR01 as SINGLELINEEDIT
	protect oDCNOMMR01 as SINGLELINEEDIT
	protect oDCPCEMB as RIGHTSLE
	protect oDCPCEMBQ as RIGHTSLE
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_FORNECEDO as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCSC_PESOUNI as FIXEDTEXT
	protect oDCSC_CODMR01 as FIXEDTEXT
	protect oDCSC_PCEMB as FIXEDTEXT
	protect oDCSC_PCEMBQ as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCRASTRO as SINGLELINEEDIT
	protect oCCcmdgera as PUSHBUTTON
	protect oCCcmdzera as PUSHBUTTON
	protect oCCcmdmenos2 as PUSHBUTTON
	protect oCCcmdmais2 as PUSHBUTTON
	protect oDCRASTROANO as SINGLELINEEDIT
	protect oCCcmdcrm as PUSHBUTTON
	protect oCCcmdso as PUSHBUTTON
	protect oDCTIPCOD as SINGLELINEEDIT
	protect oCCcmdmO as PUSHBUTTON
	protect oDCtheFixedText7 as FIXEDTEXT
	protect oCCESCFOR as PUSHBUTTON
	protect oCCpegfor as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oCCbtnpegms01 as PUSHBUTTON
	protect oDCSC_QTDEKG as FIXEDTEXT
	protect oDCSC_QTDEPC as FIXEDTEXT
	protect oCCcalcpeca as PUSHBUTTON
	protect oCCcalcpeso as PUSHBUTTON
	protect oCCcalcemb as PUSHBUTTON
	protect oCCescmr as PUSHBUTTON
	protect oCCpegmr01 as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCESCCLI as PUSHBUTTON
	protect oCCbuscar as PUSHBUTTON
// 	instance DATA 
// 	instance RASTRONUM 
// 	instance FORNECEDO 
// 	instance COGNOME 
// 	instance CODIGO 
// 	instance CLIENTE 
// 	instance PESOUNI 
// 	instance QTDEPC 
// 	instance QTDEKG 
// 	instance CODMR01 
// 	instance NOMMR01 
// 	instance PCEMB 
// 	instance PCEMBQ 
// 	instance NUMERO 
// 	instance RASTRO 
// 	instance RASTROANO 
// 	instance TIPCOD 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CLIENTE() 
return self:FieldGet(#CLIENTE)


assign CLIENTE(uValue) 
self:FieldPut(#CLIENTE, uValue)
return CLIENTE := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODMR01() 
return self:FieldGet(#CODMR01)


assign CODMR01(uValue) 
self:FieldPut(#CODMR01, uValue)
return CODMR01 := uValue


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


access FORNECEDO() 
return self:FieldGet(#FORNECEDO)


assign FORNECEDO(uValue) 
self:FieldPut(#FORNECEDO, uValue)
return FORNECEDO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcrmfn",_GetInst()},iCtlID)

oDCDATA := DateSle{self,ResourceID{JCRMFN_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"CRMFN_DATA"}

oDCRASTRONUM := rightSle{self,ResourceID{JCRMFN_RASTRONUM,_GetInst()}}
oDCRASTRONUM:HyperLabel := HyperLabel{#RASTRONUM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCRASTRONUM:FieldSpec := padrao_NUM_04{}
oDCRASTRONUM:TooltipText := "Numero da Rastreabilidade"

oDCFORNECEDO := rightSle{self,ResourceID{JCRMFN_FORNECEDO,_GetInst()}}
oDCFORNECEDO:FieldSpec := padrao_num_08{}
oDCFORNECEDO:HyperLabel := HyperLabel{#FORNECEDO,"Fornecedo:",NULL_STRING,"CRMFN_FORNECEDO"}

oDCCOGNOME := SingleLineEdit{self,ResourceID{JCRMFN_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := PADRAO_CHAR_12{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"CRMFN_COGNOME"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JCRMFN_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"CRMFN_CODIGO"}

oDCCLIENTE := rightSle{self,ResourceID{JCRMFN_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"CRMFN_CLIENTE"}

oDCPESOUNI := rightSle{self,ResourceID{JCRMFN_PESOUNI,_GetInst()}}
oDCPESOUNI:FieldSpec := PADRAO_NUM_07_3{}
oDCPESOUNI:HyperLabel := HyperLabel{#PESOUNI,"Pesouni:",NULL_STRING,"CRMFN_PESOUNI"}

oDCQTDEPC := rightSle{self,ResourceID{JCRMFN_QTDEPC,_GetInst()}}
oDCQTDEPC:FieldSpec := PADRAO_NUM_09{}
oDCQTDEPC:HyperLabel := HyperLabel{#QTDEPC,"Qtdepc:",NULL_STRING,"CRMFN_QTDEPC"}

oDCQTDEKG := rightSle{self,ResourceID{JCRMFN_QTDEKG,_GetInst()}}
oDCQTDEKG:FieldSpec := PADRAO_NUM_09_3{}
oDCQTDEKG:HyperLabel := HyperLabel{#QTDEKG,"Qtdekg:",NULL_STRING,"CRMFN_QTDEKG"}

oDCCODMR01 := SingleLineEdit{self,ResourceID{JCRMFN_CODMR01,_GetInst()}}
oDCCODMR01:FieldSpec := PADRAO_CHAR_10{}
oDCCODMR01:HyperLabel := HyperLabel{#CODMR01,"Codmr01:",NULL_STRING,"CRMFN_CODMR01"}

oDCNOMMR01 := SingleLineEdit{self,ResourceID{JCRMFN_NOMMR01,_GetInst()}}
oDCNOMMR01:FieldSpec := PADRAO_CHAR_30{}
oDCNOMMR01:HyperLabel := HyperLabel{#NOMMR01,"Codmr01:",NULL_STRING,"CRMFN_CODMR01"}

oDCPCEMB := rightSle{self,ResourceID{JCRMFN_PCEMB,_GetInst()}}
oDCPCEMB:FieldSpec := PADRAO_NUM_07{}
oDCPCEMB:HyperLabel := HyperLabel{#PCEMB,"Pcemb:",NULL_STRING,"CRMFN_PCEMB"}

oDCPCEMBQ := rightSle{self,ResourceID{JCRMFN_PCEMBQ,_GetInst()}}
oDCPCEMBQ:FieldSpec := PADRAO_NUM_07{}
oDCPCEMBQ:HyperLabel := HyperLabel{#PCEMBQ,"Pcembq:",NULL_STRING,"CRMFN_PCEMBQ"}

oDCSC_NUMERO := FixedText{self,ResourceID{JCRMFN_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JCRMFN_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_FORNECEDO := FixedText{self,ResourceID{JCRMFN_SC_FORNECEDO,_GetInst()}}
oDCSC_FORNECEDO:HyperLabel := HyperLabel{#SC_FORNECEDO,"Fornecedo:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JCRMFN_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{JCRMFN_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCSC_PESOUNI := FixedText{self,ResourceID{JCRMFN_SC_PESOUNI,_GetInst()}}
oDCSC_PESOUNI:HyperLabel := HyperLabel{#SC_PESOUNI,"Pesouni:",NULL_STRING,NULL_STRING}

oDCSC_CODMR01 := FixedText{self,ResourceID{JCRMFN_SC_CODMR01,_GetInst()}}
oDCSC_CODMR01:HyperLabel := HyperLabel{#SC_CODMR01,"Cod Embalagem",NULL_STRING,NULL_STRING}

oDCSC_PCEMB := FixedText{self,ResourceID{JCRMFN_SC_PCEMB,_GetInst()}}
oDCSC_PCEMB:HyperLabel := HyperLabel{#SC_PCEMB,"Pc/Emb",NULL_STRING,NULL_STRING}

oDCSC_PCEMBQ := FixedText{self,ResourceID{JCRMFN_SC_PCEMBQ,_GetInst()}}
oDCSC_PCEMBQ:HyperLabel := HyperLabel{#SC_PCEMBQ,"Qtde/Emb",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JCRMFN_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"CRMFN_NUMERO"}

oDCRASTRO := SingleLineEdit{self,ResourceID{JCRMFN_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := padrao_char_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"CRMFN_RASTRO"}

oCCcmdgera := PushButton{self,ResourceID{JCRMFN_CMDGERA,_GetInst()}}
oCCcmdgera:HyperLabel := HyperLabel{#cmdgera,"Rastro-->",NULL_STRING,NULL_STRING}
oCCcmdgera:TooltipText := "Clique Para Gerar o Nº Rastreabilidade"

oCCcmdzera := PushButton{self,ResourceID{JCRMFN_CMDZERA,_GetInst()}}
oCCcmdzera:HyperLabel := HyperLabel{#cmdzera,"Zera",NULL_STRING,NULL_STRING}
oCCcmdzera:TooltipText := "Apaga o Numero Rastro Gerado"

oCCcmdmenos2 := PushButton{self,ResourceID{JCRMFN_CMDMENOS2,_GetInst()}}
oCCcmdmenos2:HyperLabel := HyperLabel{#cmdmenos2,"-",NULL_STRING,NULL_STRING}
oCCcmdmenos2:TooltipText := "Diminui o Ano da Rastreabilidade"

oCCcmdmais2 := PushButton{self,ResourceID{JCRMFN_CMDMAIS2,_GetInst()}}
oCCcmdmais2:HyperLabel := HyperLabel{#cmdmais2,"+",NULL_STRING,NULL_STRING}
oCCcmdmais2:TooltipText := "Aumenta Ano Rastreabilidade"

oDCRASTROANO := SingleLineEdit{self,ResourceID{JCRMFN_RASTROANO,_GetInst()}}
oDCRASTROANO:HyperLabel := HyperLabel{#RASTROANO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCRASTROANO:FieldSpec := padrao_NUM_04{}
oDCRASTROANO:TooltipText := "Ano da Rastreabilidade"

oCCcmdcrm := PushButton{self,ResourceID{JCRMFN_CMDCRM,_GetInst()}}
oCCcmdcrm:HyperLabel := HyperLabel{#cmdcrm,"CRM",NULL_STRING,NULL_STRING}
oCCcmdcrm:TooltipText := "Marca CRM(Sem Tipo)"

oCCcmdso := PushButton{self,ResourceID{JCRMFN_CMDSO,_GetInst()}}
oCCcmdso:HyperLabel := HyperLabel{#cmdso,"SO",NULL_STRING,NULL_STRING}
oCCcmdso:TooltipText := "Marca o Rastro como Solda"

oDCTIPCOD := SingleLineEdit{self,ResourceID{JCRMFN_TIPCOD,_GetInst()}}
oDCTIPCOD:HyperLabel := HyperLabel{#TIPCOD,NULL_STRING,NULL_STRING,NULL_STRING}
oDCTIPCOD:FieldSpec := padrao_CHAR_02{}
oDCTIPCOD:TooltipText := "Tipo da Rastreabilidade"

oCCcmdmO := PushButton{self,ResourceID{JCRMFN_CMDMO,_GetInst()}}
oCCcmdmO:HyperLabel := HyperLabel{#cmdmO,"MO",NULL_STRING,NULL_STRING}
oCCcmdmO:TooltipText := "Marca O Rastro Como Montagem"

oDCtheFixedText7 := FixedText{self,ResourceID{JCRMFN_THEFIXEDTEXT7,_GetInst()}}
oDCtheFixedText7:HyperLabel := HyperLabel{#theFixedText7,"Rastro",NULL_STRING,NULL_STRING}

oCCESCFOR := PushButton{self,ResourceID{JCRMFN_ESCFOR,_GetInst()}}
oCCESCFOR:HyperLabel := HyperLabel{#ESCFOR,"...",NULL_STRING,NULL_STRING}
oCCESCFOR:TooltipText := "Escolher Fornecedor"

oCCpegfor := PushButton{self,ResourceID{JCRMFN_PEGFOR,_GetInst()}}
oCCpegfor:HyperLabel := HyperLabel{#pegfor,"-->",NULL_STRING,NULL_STRING}
oCCpegfor:TooltipText := "Clique Para Trazer o Nome do Fornecedor"

oCCesccod := PushButton{self,ResourceID{JCRMFN_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}
oCCesccod:TooltipText := "Escolhe Produto na Lista"

oCCbtnpegms01 := PushButton{self,ResourceID{JCRMFN_BTNPEGMS01,_GetInst()}}
oCCbtnpegms01:HyperLabel := HyperLabel{#btnpegms01,"-->",NULL_STRING,NULL_STRING}
oCCbtnpegms01:TooltipText := "Localizar Embalagem Conforme Produto"

oDCSC_QTDEKG := FixedText{self,ResourceID{JCRMFN_SC_QTDEKG,_GetInst()}}
oDCSC_QTDEKG:HyperLabel := HyperLabel{#SC_QTDEKG,"Qtdekg:",NULL_STRING,NULL_STRING}

oDCSC_QTDEPC := FixedText{self,ResourceID{JCRMFN_SC_QTDEPC,_GetInst()}}
oDCSC_QTDEPC:HyperLabel := HyperLabel{#SC_QTDEPC,"Qtdepc:",NULL_STRING,NULL_STRING}

oCCcalcpeca := PushButton{self,ResourceID{JCRMFN_CALCPECA,_GetInst()}}
oCCcalcpeca:HyperLabel := HyperLabel{#calcpeca,"Calcular Peca",NULL_STRING,NULL_STRING}
oCCcalcpeca:TooltipText := "Calcular Peças do Produto"

oCCcalcpeso := PushButton{self,ResourceID{JCRMFN_CALCPESO,_GetInst()}}
oCCcalcpeso:HyperLabel := HyperLabel{#calcpeso,"Calcular Peso",NULL_STRING,NULL_STRING}
oCCcalcpeso:TooltipText := "Calcular Peso do Produto"

oCCcalcemb := PushButton{self,ResourceID{JCRMFN_CALCEMB,_GetInst()}}
oCCcalcemb:HyperLabel := HyperLabel{#calcemb,"Calcular Qtde Emb",NULL_STRING,NULL_STRING}
oCCcalcemb:TooltipText := "Calcular Qtde de Embalagens"

oCCescmr := PushButton{self,ResourceID{JCRMFN_ESCMR,_GetInst()}}
oCCescmr:HyperLabel := HyperLabel{#escmr,"...",NULL_STRING,NULL_STRING}
oCCescmr:TooltipText := "Escolher Codigo Embalagem Lista"

oCCpegmr01 := PushButton{self,ResourceID{JCRMFN_PEGMR01,_GetInst()}}
oCCpegmr01:HyperLabel := HyperLabel{#pegmr01,"-->",NULL_STRING,NULL_STRING}
oCCpegmr01:TooltipText := "Clique Para Trazer o Nome da Embalagem"

oDCSC_DESTINO2 := FixedText{self,ResourceID{JCRMFN_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JCRMFN_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oCCESCCLI := PushButton{self,ResourceID{JCRMFN_ESCCLI,_GetInst()}}
oCCESCCLI:HyperLabel := HyperLabel{#ESCCLI,"...",NULL_STRING,NULL_STRING}
oCCESCCLI:TooltipText := "Escolher Fornecedor"

oCCbuscar := PushButton{self,ResourceID{JCRMFN_BUSCAR,_GetInst()}}
oCCbuscar:Image := ICO_FIND{}
oCCbuscar:HyperLabel := HyperLabel{#buscar,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Controle CRM/FINAL"
self:HyperLabel := HyperLabel{#jcrmfn,"Controle CRM/FINAL",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBDATA := DataColumn{date_field{}}
oDBDATA:Width := 6
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)

oDBRASTRO := DataColumn{padrao_char_12{}}
oDBRASTRO:Width := 8
oDBRASTRO:HyperLabel := oDCRASTRO:HyperLabel 
oDBRASTRO:Caption := "Rastro:"
self:Browser:AddColumn(oDBRASTRO)

oDBFORNECEDO := DataColumn{padrao_num_08{}}
oDBFORNECEDO:Width := 11
oDBFORNECEDO:HyperLabel := oDCFORNECEDO:HyperLabel 
oDBFORNECEDO:Caption := "Fornecedo:"
self:Browser:AddColumn(oDBFORNECEDO)

oDBCOGNOME := DataColumn{PADRAO_CHAR_12{}}
oDBCOGNOME:Width := 9
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
self:Browser:AddColumn(oDBCOGNOME)

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBCLIENTE := DataColumn{PADRAO_NUM_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
self:Browser:AddColumn(oDBCLIENTE)

oDBPESOUNI := DataColumn{PADRAO_NUM_07_3{}}
oDBPESOUNI:Width := 9
oDBPESOUNI:HyperLabel := oDCPESOUNI:HyperLabel 
oDBPESOUNI:Caption := "Pesouni:"
self:Browser:AddColumn(oDBPESOUNI)

oDBCODMR01 := DataColumn{PADRAO_CHAR_10{}}
oDBCODMR01:Width := 9
oDBCODMR01:HyperLabel := oDCCODMR01:HyperLabel 
oDBCODMR01:Caption := "Codmr01:"
self:Browser:AddColumn(oDBCODMR01)

oDBPCEMB := DataColumn{PADRAO_NUM_07{}}
oDBPCEMB:Width := 7
oDBPCEMB:HyperLabel := oDCPCEMB:HyperLabel 
oDBPCEMB:Caption := "Pcemb:"
self:Browser:AddColumn(oDBPCEMB)

oDBPCEMBQ := DataColumn{PADRAO_NUM_07{}}
oDBPCEMBQ:Width := 8
oDBPCEMBQ:HyperLabel := oDCPCEMBQ:HyperLabel 
oDBPCEMBQ:Caption := "Pcembq:"
self:Browser:AddColumn(oDBPCEMBQ)

oDBRASTROANO := DataColumn{padrao_NUM_04{}}
oDBRASTROANO:Width := 11
oDBRASTROANO:HyperLabel := oDCRASTROANO:HyperLabel 
oDBRASTROANO:Caption := ""
self:Browser:AddColumn(oDBRASTROANO)

oDBRASTRONUM := DataColumn{padrao_NUM_04{}}
oDBRASTRONUM:Width := 11
oDBRASTRONUM:HyperLabel := oDCRASTRONUM:HyperLabel 
oDBRASTRONUM:Caption := ""
self:Browser:AddColumn(oDBRASTRONUM)

oDBTIPCOD := DataColumn{padrao_CHAR_02{}}
oDBTIPCOD:Width := 8
oDBTIPCOD:HyperLabel := oDCTIPCOD:HyperLabel 
oDBTIPCOD:Caption := ""
self:Browser:AddColumn(oDBTIPCOD)

oDBQTDEKG := DataColumn{PADRAO_NUM_09_3{}}
oDBQTDEKG:Width := 8
oDBQTDEKG:HyperLabel := oDCQTDEKG:HyperLabel 
oDBQTDEKG:Caption := "Qtdekg:"
self:Browser:AddColumn(oDBQTDEKG)

oDBQTDEPC := DataColumn{PADRAO_NUM_09{}}
oDBQTDEPC:Width := 8
oDBQTDEPC:HyperLabel := oDCQTDEPC:HyperLabel 
oDBQTDEPC:Caption := "Qtdepc:"
self:Browser:AddColumn(oDBQTDEPC)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOMMR01() 
return self:FieldGet(#NOMMR01)


assign NOMMR01(uValue) 
self:FieldPut(#NOMMR01, uValue)
return NOMMR01 := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access PCEMB() 
return self:FieldGet(#PCEMB)


assign PCEMB(uValue) 
self:FieldPut(#PCEMB, uValue)
return PCEMB := uValue


access PCEMBQ() 
return self:FieldGet(#PCEMBQ)


assign PCEMBQ(uValue) 
self:FieldPut(#PCEMBQ, uValue)
return PCEMBQ := uValue


access PESOUNI() 
return self:FieldGet(#PESOUNI)


assign PESOUNI(uValue) 
self:FieldPut(#PESOUNI, uValue)
return PESOUNI := uValue


access QTDEKG() 
return self:FieldGet(#QTDEKG)


assign QTDEKG(uValue) 
self:FieldPut(#QTDEKG, uValue)
return QTDEKG := uValue


access QTDEPC() 
return self:FieldGet(#QTDEPC)


assign QTDEPC(uValue) 
self:FieldPut(#QTDEPC, uValue)
return QTDEPC := uValue


access RASTRO() 
return self:FieldGet(#RASTRO)


assign RASTRO(uValue) 
self:FieldPut(#RASTRO, uValue)
return RASTRO := uValue


access RASTROANO() 
return self:FieldGet(#RASTROANO)


assign RASTROANO(uValue) 
self:FieldPut(#RASTROANO, uValue)
return RASTROANO := uValue


access RASTRONUM() 
return self:FieldGet(#RASTRONUM)


assign RASTRONUM(uValue) 
self:FieldPut(#RASTRONUM, uValue)
return RASTRONUM := uValue


access TIPCOD() 
return self:FieldGet(#TIPCOD)


assign TIPCOD(uValue) 
self:FieldPut(#TIPCOD, uValue)
return TIPCOD := uValue


END CLASS
