#region DEFINES
STATIC DEFINE JCRMA_BUSCAR := 147 
STATIC DEFINE JCRMA_CLIENTE := 106 
STATIC DEFINE JCRMA_CMDGERA := 143 
STATIC DEFINE JCRMA_CMDMAIS2 := 144 
STATIC DEFINE JCRMA_CMDMENOS2 := 145 
STATIC DEFINE JCRMA_CMDMOT := 142 
STATIC DEFINE JCRMA_CODIGO := 102 
STATIC DEFINE JCRMA_COGCLI := 107 
STATIC DEFINE JCRMA_COGFOR := 105 
STATIC DEFINE JCRMA_CRM := 109 
STATIC DEFINE JCRMA_DATA := 100 
STATIC DEFINE JCRMA_DATAOK := 126 
STATIC DEFINE JCRMA_ESCCLI := 136 
STATIC DEFINE JCRMA_ESCCOD := 137 
STATIC DEFINE JCRMA_ESCFOR := 134 
STATIC DEFINE JCRMA_ESCPRO := 138 
STATIC DEFINE JCRMA_FORNECEDO := 123 
STATIC DEFINE JCRMA_JCRMMOT := 141 
STATIC DEFINE JCRMA_MOTIVO := 127 
STATIC DEFINE JCRMA_NF := 101 
STATIC DEFINE JCRMA_NUMERO := 121 
STATIC DEFINE JCRMA_PEGCLI := 135 
STATIC DEFINE JCRMA_PEGCRM := 139 
STATIC DEFINE JCRMA_PEGFOR := 133 
STATIC DEFINE JCRMA_PRODUTO := 103 
STATIC DEFINE JCRMA_RASTROA := 124 
STATIC DEFINE JCRMA_RASTROANO := 146 
STATIC DEFINE JCRMA_RASTRONUM := 108 
STATIC DEFINE JCRMA_RASTROOK := 125 
STATIC DEFINE JCRMA_SC_CLIENTE := 116 
STATIC DEFINE JCRMA_SC_CODIGO := 113 
STATIC DEFINE JCRMA_SC_DATA := 111 
STATIC DEFINE JCRMA_SC_DATAOK := 119 
STATIC DEFINE JCRMA_SC_FORNECEDO := 104 
STATIC DEFINE JCRMA_SC_MOTIVO := 120 
STATIC DEFINE JCRMA_SC_NF := 114 
STATIC DEFINE JCRMA_SC_NF1 := 140 
STATIC DEFINE JCRMA_SC_NUMERO := 110 
STATIC DEFINE JCRMA_SC_PRODUTO := 115 
STATIC DEFINE JCRMA_SC_RASTROA := 117 
STATIC DEFINE JCRMA_SC_RASTROOK := 118 
STATIC DEFINE JCRMA_SC_TIPOENT := 112 
STATIC DEFINE JCRMA_TIPOC := 131 
STATIC DEFINE JCRMA_TIPOENT := 122 
STATIC DEFINE JCRMA_TIPOM := 132 
STATIC DEFINE JCRMA_TIPOO := 128 
STATIC DEFINE JCRMA_TIPOP := 129 
STATIC DEFINE JCRMA_TIPOT := 130 
#endregion

class jcrma inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBTIPOENT as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBFORNECEDO as DataColumn
	PROTECT oDBCOGFOR as DataColumn
	PROTECT oDBNF as DataColumn
	PROTECT oDBPRODUTO as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCOGCLI as DataColumn
	PROTECT oDBRASTROA as DataColumn
	PROTECT oDBRASTROOK as DataColumn
	PROTECT oDBDATAOK as DataColumn
	PROTECT oDBMOTIVO as DataColumn
	protect oDCDATA as DATESLE
	protect oDCNF as RIGHTSLE
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCPRODUTO as SINGLELINEEDIT
	protect oDCSC_FORNECEDO as FIXEDTEXT
	protect oDCCOGFOR as SINGLELINEEDIT
	protect oDCCLIENTE as RIGHTSLE
	protect oDCCOGCLI as SINGLELINEEDIT
	protect oDCRASTRONUM as RIGHTSLE
	protect oDCCRM as SINGLELINEEDIT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_TIPOENT as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NF as FIXEDTEXT
	protect oDCSC_PRODUTO as FIXEDTEXT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCSC_RASTROA as FIXEDTEXT
	protect oDCSC_RASTROOK as FIXEDTEXT
	protect oDCSC_DATAOK as FIXEDTEXT
	protect oDCSC_MOTIVO as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCTIPOENT as SINGLELINEEDIT
	protect oDCFORNECEDO as RIGHTSLE
	protect oDCRASTROA as SINGLELINEEDIT
	protect oDCRASTROOK as SINGLELINEEDIT
	protect oDCDATAOK as SINGLELINEEDIT
	protect oDCMOTIVO as SINGLELINEEDIT
	protect oCCTIPOO as PUSHBUTTON
	protect oCCTIPOP as PUSHBUTTON
	protect oCCTIPOT as PUSHBUTTON
	protect oCCTIPOC as PUSHBUTTON
	protect oCCTIPOM as PUSHBUTTON
	protect oCCpegfor as PUSHBUTTON
	protect oCCESCFOR as PUSHBUTTON
	protect oCCpegCLI as PUSHBUTTON
	protect oCCESCCLI as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oCCescPRO as PUSHBUTTON
	protect oCCpegCRM as PUSHBUTTON
	protect oDCSC_NF1 as FIXEDTEXT
	protect oCCcmdmot as PUSHBUTTON
	protect oCCcmdgera as PUSHBUTTON
	protect oCCcmdmais2 as PUSHBUTTON
	protect oCCcmdmenos2 as PUSHBUTTON
	protect oDCRASTROANO as SINGLELINEEDIT
	protect oCCbuscar as PUSHBUTTON
// 	instance DATA 
// 	instance NF 
// 	instance CODIGO 
// 	instance PRODUTO 
// 	instance COGFOR 
// 	instance CLIENTE 
// 	instance COGCLI 
// 	instance RASTRONUM 
// 	instance CRM 
// 	instance NUMERO 
// 	instance TIPOENT 
// 	instance FORNECEDO 
// 	instance RASTROA 
// 	instance RASTROOK 
// 	instance DATAOK 
// 	instance MOTIVO 
// 	instance RASTROANO 
	protect oSFJCRMMOT as JCRMMOT

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


access COGCLI() 
return self:FieldGet(#COGCLI)


assign COGCLI(uValue) 
self:FieldPut(#COGCLI, uValue)
return COGCLI := uValue


access COGFOR() 
return self:FieldGet(#COGFOR)


assign COGFOR(uValue) 
self:FieldPut(#COGFOR, uValue)
return COGFOR := uValue


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


access DATAOK() 
return self:FieldGet(#DATAOK)


assign DATAOK(uValue) 
self:FieldPut(#DATAOK, uValue)
return DATAOK := uValue


access FORNECEDO() 
return self:FieldGet(#FORNECEDO)


assign FORNECEDO(uValue) 
self:FieldPut(#FORNECEDO, uValue)
return FORNECEDO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcrma",_GetInst()},iCtlID)

oDCDATA := DateSle{self,ResourceID{JCRMA_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"CRMA_DATA"}

oDCNF := rightSle{self,ResourceID{JCRMA_NF,_GetInst()}}
oDCNF:FieldSpec := padrao_num_08{}
oDCNF:HyperLabel := HyperLabel{#NF,"Nf:",NULL_STRING,"CRMA_NF"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JCRMA_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"CRMA_CODIGO"}

oDCPRODUTO := SingleLineEdit{self,ResourceID{JCRMA_PRODUTO,_GetInst()}}
oDCPRODUTO:FieldSpec := PADRAO_CHAR_24{}
oDCPRODUTO:HyperLabel := HyperLabel{#PRODUTO,"Produto:",NULL_STRING,"CRMA_PRODUTO"}

oDCSC_FORNECEDO := FixedText{self,ResourceID{JCRMA_SC_FORNECEDO,_GetInst()}}
oDCSC_FORNECEDO:HyperLabel := HyperLabel{#SC_FORNECEDO,"Fornecedo:",NULL_STRING,NULL_STRING}

oDCCOGFOR := SingleLineEdit{self,ResourceID{JCRMA_COGFOR,_GetInst()}}
oDCCOGFOR:FieldSpec := PADRAO_CHAR_15{}
oDCCOGFOR:HyperLabel := HyperLabel{#COGFOR,"Cogfor:",NULL_STRING,"CRMA_COGFOR"}

oDCCLIENTE := rightSle{self,ResourceID{JCRMA_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"CRMA_CLIENTE"}

oDCCOGCLI := SingleLineEdit{self,ResourceID{JCRMA_COGCLI,_GetInst()}}
oDCCOGCLI:FieldSpec := PADRAO_CHAR_12{}
oDCCOGCLI:HyperLabel := HyperLabel{#COGCLI,"Cogcli:",NULL_STRING,"CRMA_COGCLI"}

oDCRASTRONUM := rightSle{self,ResourceID{JCRMA_RASTRONUM,_GetInst()}}
oDCRASTRONUM:HyperLabel := HyperLabel{#RASTRONUM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCRASTRONUM:FieldSpec := padrao_NUM_04{}
oDCRASTRONUM:TooltipText := "Numero da Rastreabilidade"

oDCCRM := SingleLineEdit{self,ResourceID{JCRMA_CRM,_GetInst()}}
oDCCRM:FieldSpec := PADRAO_NUM_08{}
oDCCRM:HyperLabel := HyperLabel{#CRM,"Nf:",NULL_STRING,"CRMA_NF"}

oDCSC_NUMERO := FixedText{self,ResourceID{JCRMA_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JCRMA_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_TIPOENT := FixedText{self,ResourceID{JCRMA_SC_TIPOENT,_GetInst()}}
oDCSC_TIPOENT:HyperLabel := HyperLabel{#SC_TIPOENT,"Tipo",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JCRMA_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NF := FixedText{self,ResourceID{JCRMA_SC_NF,_GetInst()}}
oDCSC_NF:HyperLabel := HyperLabel{#SC_NF,"Nf:",NULL_STRING,NULL_STRING}

oDCSC_PRODUTO := FixedText{self,ResourceID{JCRMA_SC_PRODUTO,_GetInst()}}
oDCSC_PRODUTO:HyperLabel := HyperLabel{#SC_PRODUTO,"Produto:",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{JCRMA_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCSC_RASTROA := FixedText{self,ResourceID{JCRMA_SC_RASTROA,_GetInst()}}
oDCSC_RASTROA:HyperLabel := HyperLabel{#SC_RASTROA,"Rastroa:",NULL_STRING,NULL_STRING}

oDCSC_RASTROOK := FixedText{self,ResourceID{JCRMA_SC_RASTROOK,_GetInst()}}
oDCSC_RASTROOK:HyperLabel := HyperLabel{#SC_RASTROOK,"Rastro",NULL_STRING,NULL_STRING}

oDCSC_DATAOK := FixedText{self,ResourceID{JCRMA_SC_DATAOK,_GetInst()}}
oDCSC_DATAOK:HyperLabel := HyperLabel{#SC_DATAOK,"Data:",NULL_STRING,NULL_STRING}

oDCSC_MOTIVO := FixedText{self,ResourceID{JCRMA_SC_MOTIVO,_GetInst()}}
oDCSC_MOTIVO:HyperLabel := HyperLabel{#SC_MOTIVO,"Motivo:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JCRMA_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"CRMA_NUMERO"}

oDCTIPOENT := SingleLineEdit{self,ResourceID{JCRMA_TIPOENT,_GetInst()}}
oDCTIPOENT:FieldSpec := PADRAO_CHAR_01{}
oDCTIPOENT:HyperLabel := HyperLabel{#TIPOENT,"Tipoent:",NULL_STRING,"CRMA_TIPOENT"}

oDCFORNECEDO := rightSle{self,ResourceID{JCRMA_FORNECEDO,_GetInst()}}
oDCFORNECEDO:FieldSpec := PADRAO_NUM_08{}
oDCFORNECEDO:HyperLabel := HyperLabel{#FORNECEDO,"Fornecedo:",NULL_STRING,"CRMA_FORNECEDO"}

oDCRASTROA := SingleLineEdit{self,ResourceID{JCRMA_RASTROA,_GetInst()}}
oDCRASTROA:FieldSpec := PADRAO_CHAR_12{}
oDCRASTROA:HyperLabel := HyperLabel{#RASTROA,"Rastroa:",NULL_STRING,"CRMA_RASTROA"}

oDCRASTROOK := SingleLineEdit{self,ResourceID{JCRMA_RASTROOK,_GetInst()}}
oDCRASTROOK:FieldSpec := PADRAO_CHAR_12{}
oDCRASTROOK:HyperLabel := HyperLabel{#RASTROOK,"Rastrook:",NULL_STRING,"CRMA_RASTROOK"}

oDCDATAOK := SingleLineEdit{self,ResourceID{JCRMA_DATAOK,_GetInst()}}
oDCDATAOK:FieldSpec := DATE_FIELD{}
oDCDATAOK:HyperLabel := HyperLabel{#DATAOK,"Dataok:",NULL_STRING,"CRMA_DATAOK"}

oDCMOTIVO := SingleLineEdit{self,ResourceID{JCRMA_MOTIVO,_GetInst()}}
oDCMOTIVO:FieldSpec := PADRAO_CHAR_03{}
oDCMOTIVO:HyperLabel := HyperLabel{#MOTIVO,"Motivo:",NULL_STRING,"CRMA_MOTIVO"}

oCCTIPOO := PushButton{self,ResourceID{JCRMA_TIPOO,_GetInst()}}
oCCTIPOO:HyperLabel := HyperLabel{#TIPOO,"(X)Outros",NULL_STRING,NULL_STRING}
oCCTIPOO:TooltipText := "Marca Tipo Como Outras Entradas"

oCCTIPOP := PushButton{self,ResourceID{JCRMA_TIPOP,_GetInst()}}
oCCTIPOP:HyperLabel := HyperLabel{#TIPOP,"(P)rodutos",NULL_STRING,NULL_STRING}
oCCTIPOP:TooltipText := "Marca Tipo Como Produtos"

oCCTIPOT := PushButton{self,ResourceID{JCRMA_TIPOT,_GetInst()}}
oCCTIPOT:HyperLabel := HyperLabel{#TIPOT,"(T)rat/Serviço",NULL_STRING,NULL_STRING}
oCCTIPOT:TooltipText := "Marca Tipo Como Tratamento/Servicos"

oCCTIPOC := PushButton{self,ResourceID{JCRMA_TIPOC,_GetInst()}}
oCCTIPOC:HyperLabel := HyperLabel{#TIPOC,"(C)omp.",NULL_STRING,NULL_STRING}
oCCTIPOC:TooltipText := "Marca Tipo Como Componete"

oCCTIPOM := PushButton{self,ResourceID{JCRMA_TIPOM,_GetInst()}}
oCCTIPOM:HyperLabel := HyperLabel{#TIPOM,"(M)at.Prima",NULL_STRING,NULL_STRING}
oCCTIPOM:TooltipText := "Marca Tipo Como Materia Prima"

oCCpegfor := PushButton{self,ResourceID{JCRMA_PEGFOR,_GetInst()}}
oCCpegfor:HyperLabel := HyperLabel{#pegfor,"-->",NULL_STRING,NULL_STRING}
oCCpegfor:TooltipText := "Clique Para Trazer o cogome do Fornecedor"

oCCESCFOR := PushButton{self,ResourceID{JCRMA_ESCFOR,_GetInst()}}
oCCESCFOR:HyperLabel := HyperLabel{#ESCFOR,"...",NULL_STRING,NULL_STRING}
oCCESCFOR:TooltipText := "Escolher Fornecedor"

oCCpegCLI := PushButton{self,ResourceID{JCRMA_PEGCLI,_GetInst()}}
oCCpegCLI:HyperLabel := HyperLabel{#pegCLI,"-->",NULL_STRING,NULL_STRING}
oCCpegCLI:TooltipText := "Clique Para Trazer o Cognome do Cliente"

oCCESCCLI := PushButton{self,ResourceID{JCRMA_ESCCLI,_GetInst()}}
oCCESCCLI:HyperLabel := HyperLabel{#ESCCLI,"...",NULL_STRING,NULL_STRING}
oCCESCCLI:TooltipText := "Escolher Cliente"

oCCesccod := PushButton{self,ResourceID{JCRMA_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}
oCCesccod:TooltipText := "Escolhe codigoa na Lista"

oCCescPRO := PushButton{self,ResourceID{JCRMA_ESCPRO,_GetInst()}}
oCCescPRO:HyperLabel := HyperLabel{#escPRO,"...",NULL_STRING,NULL_STRING}
oCCescPRO:TooltipText := "Escolhe Produto na Lista"

oCCpegCRM := PushButton{self,ResourceID{JCRMA_PEGCRM,_GetInst()}}
oCCpegCRM:HyperLabel := HyperLabel{#pegCRM,"-->",NULL_STRING,NULL_STRING}
oCCpegCRM:TooltipText := "Clique Para Trazer o Rastro"

oDCSC_NF1 := FixedText{self,ResourceID{JCRMA_SC_NF1,_GetInst()}}
oDCSC_NF1:HyperLabel := HyperLabel{#SC_NF1,"CRM",NULL_STRING,NULL_STRING}

oCCcmdmot := PushButton{self,ResourceID{JCRMA_CMDMOT,_GetInst()}}
oCCcmdmot:HyperLabel := HyperLabel{#cmdmot,"Escolher",NULL_STRING,NULL_STRING}
oCCcmdmot:TooltipText := "Escolha o Motivo do Rastro"

oCCcmdgera := PushButton{self,ResourceID{JCRMA_CMDGERA,_GetInst()}}
oCCcmdgera:HyperLabel := HyperLabel{#cmdgera,"Rastro-->",NULL_STRING,NULL_STRING}
oCCcmdgera:TooltipText := "Clique Para Gerar o Nº Rastreabilidade"

oCCcmdmais2 := PushButton{self,ResourceID{JCRMA_CMDMAIS2,_GetInst()}}
oCCcmdmais2:HyperLabel := HyperLabel{#cmdmais2,"+",NULL_STRING,NULL_STRING}
oCCcmdmais2:TooltipText := "Aumenta Ano Rastreabilidade"

oCCcmdmenos2 := PushButton{self,ResourceID{JCRMA_CMDMENOS2,_GetInst()}}
oCCcmdmenos2:HyperLabel := HyperLabel{#cmdmenos2,"-",NULL_STRING,NULL_STRING}
oCCcmdmenos2:TooltipText := "Diminui o Ano da Rastreabilidade"

oDCRASTROANO := SingleLineEdit{self,ResourceID{JCRMA_RASTROANO,_GetInst()}}
oDCRASTROANO:HyperLabel := HyperLabel{#RASTROANO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCRASTROANO:FieldSpec := padrao_NUM_04{}
oDCRASTROANO:TooltipText := "Ano da Rastreabilidade"

oCCbuscar := PushButton{self,ResourceID{JCRMA_BUSCAR,_GetInst()}}
oCCbuscar:Image := ICO_FIND{}
oCCbuscar:HyperLabel := HyperLabel{#buscar,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Controle de Rastro Alternativos"
self:HyperLabel := HyperLabel{#jcrma,"Controle de Rastro Alternativos",NULL_STRING,NULL_STRING}
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

oDBTIPOENT := DataColumn{PADRAO_CHAR_01{}}
oDBTIPOENT:Width := 9
oDBTIPOENT:HyperLabel := oDCTIPOENT:HyperLabel 
oDBTIPOENT:Caption := "Tipoent:"
self:Browser:AddColumn(oDBTIPOENT)

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBFORNECEDO := DataColumn{PADRAO_NUM_08{}}
oDBFORNECEDO:Width := 7
oDBFORNECEDO:HyperLabel := oDCFORNECEDO:HyperLabel 
oDBFORNECEDO:Caption := "Fornecedo:"
self:Browser:AddColumn(oDBFORNECEDO)

oDBCOGFOR := DataColumn{PADRAO_CHAR_15{}}
oDBCOGFOR:Width := 8
oDBCOGFOR:HyperLabel := oDCCOGFOR:HyperLabel 
oDBCOGFOR:Caption := "Cogfor:"
self:Browser:AddColumn(oDBCOGFOR)

oDBNF := DataColumn{padrao_num_08{}}
oDBNF:Width := 4
oDBNF:HyperLabel := oDCNF:HyperLabel 
oDBNF:Caption := "Nf:"
self:Browser:AddColumn(oDBNF)

oDBPRODUTO := DataColumn{PADRAO_CHAR_24{}}
oDBPRODUTO:Width := 9
oDBPRODUTO:HyperLabel := oDCPRODUTO:HyperLabel 
oDBPRODUTO:Caption := "Produto:"
self:Browser:AddColumn(oDBPRODUTO)

oDBCLIENTE := DataColumn{PADRAO_NUM_08{}}
oDBCLIENTE:Width := 7
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
self:Browser:AddColumn(oDBCLIENTE)

oDBCOGCLI := DataColumn{PADRAO_CHAR_12{}}
oDBCOGCLI:Width := 8
oDBCOGCLI:HyperLabel := oDCCOGCLI:HyperLabel 
oDBCOGCLI:Caption := "Cogcli:"
self:Browser:AddColumn(oDBCOGCLI)

oDBRASTROA := DataColumn{PADRAO_CHAR_12{}}
oDBRASTROA:Width := 9
oDBRASTROA:HyperLabel := oDCRASTROA:HyperLabel 
oDBRASTROA:Caption := "Rastroa:"
self:Browser:AddColumn(oDBRASTROA)

oDBRASTROOK := DataColumn{PADRAO_CHAR_12{}}
oDBRASTROOK:Width := 10
oDBRASTROOK:HyperLabel := oDCRASTROOK:HyperLabel 
oDBRASTROOK:Caption := "Rastrook:"
self:Browser:AddColumn(oDBRASTROOK)

oDBDATAOK := DataColumn{DATE_FIELD{}}
oDBDATAOK:Width := 8
oDBDATAOK:HyperLabel := oDCDATAOK:HyperLabel 
oDBDATAOK:Caption := "Dataok:"
self:Browser:AddColumn(oDBDATAOK)

oDBMOTIVO := DataColumn{PADRAO_CHAR_03{}}
oDBMOTIVO:Width := 8
oDBMOTIVO:HyperLabel := oDCMOTIVO:HyperLabel 
oDBMOTIVO:Caption := "Motivo:"
self:Browser:AddColumn(oDBMOTIVO)


self:ViewAs(#FormView)

oSFJCRMMOT := JCRMMOT{self,JCRMA_JCRMMOT}
oSFJCRMMOT:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MOTIVO() 
return self:FieldGet(#MOTIVO)


assign MOTIVO(uValue) 
self:FieldPut(#MOTIVO, uValue)
return MOTIVO := uValue


access NF() 
return self:FieldGet(#NF)


assign NF(uValue) 
self:FieldPut(#NF, uValue)
return NF := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access PRODUTO() 
return self:FieldGet(#PRODUTO)


assign PRODUTO(uValue) 
self:FieldPut(#PRODUTO, uValue)
return PRODUTO := uValue


access RASTROA() 
return self:FieldGet(#RASTROA)


assign RASTROA(uValue) 
self:FieldPut(#RASTROA, uValue)
return RASTROA := uValue


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


access RASTROOK() 
return self:FieldGet(#RASTROOK)


assign RASTROOK(uValue) 
self:FieldPut(#RASTROOK, uValue)
return RASTROOK := uValue


access TIPOENT() 
return self:FieldGet(#TIPOENT)


assign TIPOENT(uValue) 
self:FieldPut(#TIPOENT, uValue)
return TIPOENT := uValue


END CLASS
