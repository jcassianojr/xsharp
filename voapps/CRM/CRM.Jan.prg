#region DEFINES
STATIC DEFINE JCRM_APLICACAO := 142 
STATIC DEFINE JCRM_AUT := 117 
STATIC DEFINE JCRM_BUSCACRM := 111 
STATIC DEFINE JCRM_CBUSCA := 140 
STATIC DEFINE JCRM_CERT := 155 
STATIC DEFINE JCRM_CLIFOR := 130 
STATIC DEFINE JCRM_CMDANO := 119 
STATIC DEFINE JCRM_CMDTRIANGULAR := 167 
STATIC DEFINE JCRM_CRIRM := 134 
STATIC DEFINE JCRM_CRM := 124 
STATIC DEFINE JCRM_DATA := 125 
STATIC DEFINE JCRM_DESCRI := 141 
STATIC DEFINE JCRM_ESCCOD := 112 
STATIC DEFINE JCRM_FOTO := 115 
STATIC DEFINE JCRM_FT13 := 129 
STATIC DEFINE JCRM_FT14 := 137 
STATIC DEFINE JCRM_FT15 := 148 
STATIC DEFINE JCRM_FT16 := 107 
STATIC DEFINE JCRM_FT17 := 132 
STATIC DEFINE JCRM_FT18 := 139 
STATIC DEFINE JCRM_FT19 := 145 
STATIC DEFINE JCRM_INSP := 153 
STATIC DEFINE JCRM_LAUDO := 162 
STATIC DEFINE JCRM_NIVEL := 154 
STATIC DEFINE JCRM_NOMEF := 131 
STATIC DEFINE JCRM_NRNOTA := 146 
STATIC DEFINE JCRM_NRNOTB := 109 
STATIC DEFINE JCRM_OBS := 102 
STATIC DEFINE JCRM_PEDIDO := 126 
STATIC DEFINE JCRM_PRODUTO := 100 
STATIC DEFINE JCRM_QTDE := 110 
STATIC DEFINE JCRM_QTDEA := 147 
STATIC DEFINE JCRM_QTDEB := 108 
STATIC DEFINE JCRM_RASTRO := 106 
STATIC DEFINE JCRM_RB1 := 127 
STATIC DEFINE JCRM_RB10 := 134 
STATIC DEFINE JCRM_RB11 := 135 
STATIC DEFINE JCRM_RB12 := 133 
STATIC DEFINE JCRM_RB13 := 103 
STATIC DEFINE JCRM_RB2 := 128 
STATIC DEFINE JCRM_RB3 := 163 
STATIC DEFINE JCRM_RB4 := 164 
STATIC DEFINE JCRM_RB5 := 165 
STATIC DEFINE JCRM_RB6 := 157 
STATIC DEFINE JCRM_RB7 := 158 
STATIC DEFINE JCRM_RB8 := 159 
STATIC DEFINE JCRM_RB9 := 136 
STATIC DEFINE JCRM_RIRM := 160 
STATIC DEFINE JCRM_RIST := 152 
STATIC DEFINE JCRM_SC_CRM := 121 
STATIC DEFINE JCRM_SC_CRM1 := 118 
STATIC DEFINE JCRM_SC_DATA := 120 
STATIC DEFINE JCRM_SC_DESCRI := 138 
STATIC DEFINE JCRM_SC_DESTINO2 := 114 
STATIC DEFINE JCRM_SC_LAUDO := 126 
STATIC DEFINE JCRM_SC_NIVEL := 149 
STATIC DEFINE JCRM_SC_NRNOTA := 143 
STATIC DEFINE JCRM_SC_OBS := 161 
STATIC DEFINE JCRM_SC_PEDIDO := 123 
STATIC DEFINE JCRM_SC_QTDE := 144 
STATIC DEFINE JCRM_SC_QTDE1 := 116 
STATIC DEFINE JCRM_SC_RIRM := 104 
STATIC DEFINE JCRM_SC_RIST := 105 
STATIC DEFINE JCRM_SC_TECNICO := 151 
STATIC DEFINE JCRM_SC_TIPOE := 110 
STATIC DEFINE JCRM_TECNICO := 156 
STATIC DEFINE JCRM_THEFIXEDTEXT13 := 128 
STATIC DEFINE JCRM_THEFIXEDTEXT16 := 150 
STATIC DEFINE JCRM_THESINGLELINEEDIT13 := 130 
STATIC DEFINE JCRM_TIPCAD := 122 
STATIC DEFINE JCRM_TIPOE := 132 
STATIC DEFINE JCRM_TRIANGULAR := 166 
STATIC DEFINE JCRM_TROCANF := 113 
STATIC DEFINE JCRM_UNID := 101 
#endregion

class JCRM inherit MYDataWindow 

	PROTECT oDBCRM as DataColumn
	PROTECT oDBCBUSCA as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBCLIFOR as DataColumn
	PROTECT oDBNOMEF as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBPEDIDO as DataColumn
	PROTECT oDBTECNICO as DataColumn
	PROTECT oDBNRNOTA as DataColumn
	protect oDCPRODUTO as SINGLELINEEDIT
	protect oDCUNID as SINGLELINEEDIT
	protect oDCOBS as SINGLELINEEDIT
	protect oCCRB13 as RADIOBUTTON
	protect oDCSC_rirm as FIXEDTEXT
	protect oDCsc_rist as FIXEDTEXT
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCFT16 as FIXEDTEXT
	protect oDCQTDEB as SINGLELINEEDIT
	protect oDCNRNOTB as SINGLELINEEDIT
	protect oDCQTDE as SINGLELINEEDIT
	protect oCCbuscacrm as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oCCtrocanf as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oDCSC_QTDE1 as FIXEDTEXT
	protect oDCAUT as SINGLELINEEDIT
	protect oDCSC_CRM1 as FIXEDTEXT
	protect oCCcmdAno as PUSHBUTTON
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_CRM as FIXEDTEXT
	protect oDCTIPCAD as RADIOBUTTONGROUP
	protect oDCSC_PEDIDO as FIXEDTEXT
	protect oDCCRM as SINGLELINEEDIT
	protect oDCDATA as SINGLELINEEDIT
	protect oDCPEDIDO as SINGLELINEEDIT
	protect oCCRB1 as RADIOBUTTON
	protect oCCRB2 as RADIOBUTTON
	protect oDCFT13 as FIXEDTEXT
	protect oDCCLIFOR as SINGLELINEEDIT
	protect oDCNOMEF as SINGLELINEEDIT
	protect oDCTIPOE as RADIOBUTTONGROUP
	protect oCCRB12 as RADIOBUTTON
	protect oCCRB10 as RADIOBUTTON
	protect oCCRB11 as RADIOBUTTON
	protect oCCRB9 as RADIOBUTTON
	protect oDCFT14 as FIXEDTEXT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCFT18 as FIXEDTEXT
	protect oDCCBUSCA as SINGLELINEEDIT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCAPLICACAO as SINGLELINEEDIT
	protect oDCSC_NRNOTA as FIXEDTEXT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCFT19 as FIXEDTEXT
	protect oDCNRNOTA as SINGLELINEEDIT
	protect oDCQTDEA as SINGLELINEEDIT
	protect oDCFT15 as FIXEDTEXT
	protect oDCSC_NIVEL as FIXEDTEXT
	protect oDCtheFixedText16 as FIXEDTEXT
	protect oDCSC_TECNICO as FIXEDTEXT
	protect oDCRIST as SINGLELINEEDIT
	protect oDCINSP as RADIOBUTTONGROUP
	protect oDCNIVEL as SINGLELINEEDIT
	protect oDCCERT as SINGLELINEEDIT
	protect oDCTECNICO as SINGLELINEEDIT
	protect oCCRB6 as RADIOBUTTON
	protect oCCRB7 as RADIOBUTTON
	protect oCCRB8 as RADIOBUTTON
	protect oDCRIRM as SINGLELINEEDIT
	protect oDCSC_OBS as FIXEDTEXT
	protect oDCLAUDO as RADIOBUTTONGROUP
	protect oCCRB3 as RADIOBUTTON
	protect oCCRB4 as RADIOBUTTON
	protect oCCRB5 as RADIOBUTTON
	protect oDCTRIANGULAR as SINGLELINEEDIT
	protect oCCcmdtriangular as PUSHBUTTON
// 	instance PRODUTO 
// 	instance UNID 
// 	instance OBS 
// 	instance RASTRO 
// 	instance QTDEB 
// 	instance NRNOTB 
// 	instance QTDE 
// 	instance AUT 
// 	instance TIPCAD 
// 	instance CRM 
// 	instance DATA 
// 	instance PEDIDO 
// 	instance CLIFOR 
// 	instance NOMEF 
// 	instance TIPOE 
// 	instance CBUSCA 
// 	instance DESCRI 
// 	instance APLICACAO 
// 	instance NRNOTA 
// 	instance QTDEA 
// 	instance RIST 
// 	instance INSP 
// 	instance NIVEL 
// 	instance CERT 
// 	instance TECNICO 
// 	instance RIRM 
// 	instance LAUDO 
// 	instance TRIANGULAR 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access APLICACAO() 
return self:FieldGet(#APLICACAO)


assign APLICACAO(uValue) 
self:FieldPut(#APLICACAO, uValue)
return APLICACAO := uValue


access AUT() 
return self:FieldGet(#AUT)


assign AUT(uValue) 
self:FieldPut(#AUT, uValue)
return AUT := uValue


access CBUSCA() 
return self:FieldGet(#CBUSCA)


assign CBUSCA(uValue) 
self:FieldPut(#CBUSCA, uValue)
return CBUSCA := uValue


access CERT() 
return self:FieldGet(#CERT)


assign CERT(uValue) 
self:FieldPut(#CERT, uValue)
return CERT := uValue


access CLIFOR() 
return self:FieldGet(#CLIFOR)


assign CLIFOR(uValue) 
self:FieldPut(#CLIFOR, uValue)
return CLIFOR := uValue


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


access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCRM",_GetInst()},iCtlID)

oDCPRODUTO := SingleLineEdit{self,ResourceID{JCRM_PRODUTO,_GetInst()}}
oDCPRODUTO:FieldSpec := PADRAO_CHAR_24{}
oDCPRODUTO:HyperLabel := HyperLabel{#PRODUTO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCUNID := SingleLineEdit{self,ResourceID{JCRM_UNID,_GetInst()}}
oDCUNID:FieldSpec := PADRAO_CHAR_04{}
oDCUNID:HyperLabel := HyperLabel{#UNID,NULL_STRING,NULL_STRING,NULL_STRING}

oDCOBS := SingleLineEdit{self,ResourceID{JCRM_OBS,_GetInst()}}
oDCOBS:FieldSpec := PADRAO_CHAR_100{}
oDCOBS:HyperLabel := HyperLabel{#OBS,"Obs:",NULL_STRING,"CRM_OBS"}

oCCRB13 := RadioButton{self,ResourceID{JCRM_RB13,_GetInst()}}
oCCRB13:HyperLabel := HyperLabel{#RB13,"Outros",NULL_STRING,NULL_STRING}

oDCSC_rirm := FixedText{self,ResourceID{JCRM_SC_RIRM,_GetInst()}}
oDCSC_rirm:HyperLabel := HyperLabel{#SC_rirm,"Rirm",NULL_STRING,NULL_STRING}

oDCsc_rist := FixedText{self,ResourceID{JCRM_SC_RIST,_GetInst()}}
oDCsc_rist:HyperLabel := HyperLabel{#sc_rist,"Rist:",NULL_STRING,NULL_STRING}

oDCRASTRO := SingleLineEdit{self,ResourceID{JCRM_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := PADRAO_CHAR_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Controle de Recebimento Mercadorias",NULL_STRING,NULL_STRING}

oDCFT16 := FixedText{self,ResourceID{JCRM_FT16,_GetInst()}}
oDCFT16:HyperLabel := HyperLabel{#FT16,"Rastro",NULL_STRING,NULL_STRING}

oDCQTDEB := SingleLineEdit{self,ResourceID{JCRM_QTDEB,_GetInst()}}
oDCQTDEB:FieldSpec := PADRAO_NUM_12_3{}
oDCQTDEB:HyperLabel := HyperLabel{#QTDEB,"Qtde:",NULL_STRING,"CRM_QTDE"}

oDCNRNOTB := SingleLineEdit{self,ResourceID{JCRM_NRNOTB,_GetInst()}}
oDCNRNOTB:FieldSpec := PADRAO_NUM_08{}
oDCNRNOTB:HyperLabel := HyperLabel{#NRNOTB,"Nrnota:",NULL_STRING,"CRM_NRNOTA"}

oDCQTDE := SingleLineEdit{self,ResourceID{JCRM_QTDE,_GetInst()}}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"CRM_QTDE"}
oDCQTDE:FieldSpec := PADRAO_NUM_12_3{}

oCCbuscacrm := PushButton{self,ResourceID{JCRM_BUSCACRM,_GetInst()}}
oCCbuscacrm:Image := ICO_FIND{}
oCCbuscacrm:HyperLabel := HyperLabel{#buscacrm,NULL_STRING,NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JCRM_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oCCtrocanf := PushButton{self,ResourceID{JCRM_TROCANF,_GetInst()}}
oCCtrocanf:HyperLabel := HyperLabel{#trocanf,"Trocar Nº NF",NULL_STRING,NULL_STRING}
oCCtrocanf:TooltipText := "Utilize Para Corrigir o Nº da Nota Fiscal"

oDCSC_DESTINO2 := FixedText{self,ResourceID{JCRM_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JCRM_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oDCSC_QTDE1 := FixedText{self,ResourceID{JCRM_SC_QTDE1,_GetInst()}}
oDCSC_QTDE1:HyperLabel := HyperLabel{#SC_QTDE1,"Qtde Total",NULL_STRING,NULL_STRING}

oDCAUT := SingleLineEdit{self,ResourceID{JCRM_AUT,_GetInst()}}
oDCAUT:FieldSpec := PADRAO_NUM_08{}
oDCAUT:HyperLabel := HyperLabel{#AUT,"Crm:",NULL_STRING,"CRM_CRM"}

oDCSC_CRM1 := FixedText{self,ResourceID{JCRM_SC_CRM1,_GetInst()}}
oDCSC_CRM1:HyperLabel := HyperLabel{#SC_CRM1,"Autorizacao",NULL_STRING,NULL_STRING}

oCCcmdAno := PushButton{self,ResourceID{JCRM_CMDANO,_GetInst()}}
oCCcmdAno:HyperLabel := HyperLabel{#cmdAno,"...",NULL_STRING,NULL_STRING}
oCCcmdAno:TooltipText := "Ajustar Digito Ano Rastro"

oDCSC_DATA := FixedText{self,ResourceID{JCRM_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_CRM := FixedText{self,ResourceID{JCRM_SC_CRM,_GetInst()}}
oDCSC_CRM:HyperLabel := HyperLabel{#SC_CRM,"Crm:",NULL_STRING,NULL_STRING}

oDCSC_PEDIDO := FixedText{self,ResourceID{JCRM_SC_PEDIDO,_GetInst()}}
oDCSC_PEDIDO:HyperLabel := HyperLabel{#SC_PEDIDO,"Pedido:",NULL_STRING,NULL_STRING}

oDCCRM := SingleLineEdit{self,ResourceID{JCRM_CRM,_GetInst()}}
oDCCRM:FieldSpec := PADRAO_NUM_08{}
oDCCRM:HyperLabel := HyperLabel{#CRM,"Crm:",NULL_STRING,"CRM_CRM"}

oDCDATA := SingleLineEdit{self,ResourceID{JCRM_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"CRM_DATA"}

oDCPEDIDO := SingleLineEdit{self,ResourceID{JCRM_PEDIDO,_GetInst()}}
oDCPEDIDO:FieldSpec := PADRAO_CHAR_20{}
oDCPEDIDO:HyperLabel := HyperLabel{#PEDIDO,"Pedido:",NULL_STRING,"CRM_PEDIDO"}

oCCRB1 := RadioButton{self,ResourceID{JCRM_RB1,_GetInst()}}
oCCRB1:HyperLabel := HyperLabel{#RB1,"Cliente",NULL_STRING,NULL_STRING}

oCCRB2 := RadioButton{self,ResourceID{JCRM_RB2,_GetInst()}}
oCCRB2:HyperLabel := HyperLabel{#RB2,"Fornecedor",NULL_STRING,NULL_STRING}

oDCFT13 := FixedText{self,ResourceID{JCRM_FT13,_GetInst()}}
oDCFT13:HyperLabel := HyperLabel{#FT13,"Cliente/Fornecedor",NULL_STRING,NULL_STRING}

oDCCLIFOR := SingleLineEdit{self,ResourceID{JCRM_CLIFOR,_GetInst()}}
oDCCLIFOR:FieldSpec := PADRAO_NUM_08{}
oDCCLIFOR:HyperLabel := HyperLabel{#CLIFOR,"Clifor:",NULL_STRING,"CRM_CLIFOR"}

oDCNOMEF := SingleLineEdit{self,ResourceID{JCRM_NOMEF,_GetInst()}}
oDCNOMEF:HyperLabel := HyperLabel{#NOMEF,"Fornecedor",NULL_STRING,NULL_STRING}
oDCNOMEF:FieldSpec := PADRAO_CHAR_40{}

oCCRB12 := RadioButton{self,ResourceID{JCRM_RB12,_GetInst()}}
oCCRB12:HyperLabel := HyperLabel{#RB12,"Matéria Prima",NULL_STRING,NULL_STRING}

oCCRB10 := RadioButton{self,ResourceID{JCRM_RB10,_GetInst()}}
oCCRB10:HyperLabel := HyperLabel{#RB10,"Tratamento./Terceiro",NULL_STRING,NULL_STRING}

oCCRB11 := RadioButton{self,ResourceID{JCRM_RB11,_GetInst()}}
oCCRB11:HyperLabel := HyperLabel{#RB11,"Componente",NULL_STRING,NULL_STRING}

oCCRB9 := RadioButton{self,ResourceID{JCRM_RB9,_GetInst()}}
oCCRB9:HyperLabel := HyperLabel{#RB9,"Produto",NULL_STRING,NULL_STRING}

oDCFT14 := FixedText{self,ResourceID{JCRM_FT14,_GetInst()}}
oDCFT14:HyperLabel := HyperLabel{#FT14,"Código",NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{self,ResourceID{JCRM_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCFT18 := FixedText{self,ResourceID{JCRM_FT18,_GetInst()}}
oDCFT18:HyperLabel := HyperLabel{#FT18,"Aplicação",NULL_STRING,NULL_STRING}

oDCCBUSCA := SingleLineEdit{self,ResourceID{JCRM_CBUSCA,_GetInst()}}
oDCCBUSCA:FieldSpec := PADRAO_CHAR_24{}
oDCCBUSCA:HyperLabel := HyperLabel{#CBUSCA,"Codigo",NULL_STRING,NULL_STRING}

oDCDESCRI := SingleLineEdit{self,ResourceID{JCRM_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_40{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descriçào:",NULL_STRING,"CRM_DESCRI"}

oDCAPLICACAO := SingleLineEdit{self,ResourceID{JCRM_APLICACAO,_GetInst()}}
oDCAPLICACAO:FieldSpec := PADRAO_CHAR_30{}
oDCAPLICACAO:HyperLabel := HyperLabel{#APLICACAO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_NRNOTA := FixedText{self,ResourceID{JCRM_SC_NRNOTA,_GetInst()}}
oDCSC_NRNOTA:HyperLabel := HyperLabel{#SC_NRNOTA,"No. da Nota",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{self,ResourceID{JCRM_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCFT19 := FixedText{self,ResourceID{JCRM_FT19,_GetInst()}}
oDCFT19:HyperLabel := HyperLabel{#FT19,"Produto Recebido",NULL_STRING,NULL_STRING}

oDCNRNOTA := SingleLineEdit{self,ResourceID{JCRM_NRNOTA,_GetInst()}}
oDCNRNOTA:FieldSpec := PADRAO_NUM_08{}
oDCNRNOTA:HyperLabel := HyperLabel{#NRNOTA,"Nrnota:",NULL_STRING,"CRM_NRNOTA"}

oDCQTDEA := SingleLineEdit{self,ResourceID{JCRM_QTDEA,_GetInst()}}
oDCQTDEA:FieldSpec := PADRAO_NUM_12_3{}
oDCQTDEA:HyperLabel := HyperLabel{#QTDEA,"Qtde:",NULL_STRING,"CRM_QTDE"}

oDCFT15 := FixedText{self,ResourceID{JCRM_FT15,_GetInst()}}
oDCFT15:HyperLabel := HyperLabel{#FT15,"Unidade",NULL_STRING,NULL_STRING}

oDCSC_NIVEL := FixedText{self,ResourceID{JCRM_SC_NIVEL,_GetInst()}}
oDCSC_NIVEL:HyperLabel := HyperLabel{#SC_NIVEL,"Nivel:",NULL_STRING,NULL_STRING}

oDCtheFixedText16 := FixedText{self,ResourceID{JCRM_THEFIXEDTEXT16,_GetInst()}}
oDCtheFixedText16:HyperLabel := HyperLabel{#theFixedText16,"Certificado",NULL_STRING,NULL_STRING}

oDCSC_TECNICO := FixedText{self,ResourceID{JCRM_SC_TECNICO,_GetInst()}}
oDCSC_TECNICO:HyperLabel := HyperLabel{#SC_TECNICO,"Tecnico:",NULL_STRING,NULL_STRING}

oDCRIST := SingleLineEdit{self,ResourceID{JCRM_RIST,_GetInst()}}
oDCRIST:FieldSpec := PADRAO_NUM_08{}
oDCRIST:HyperLabel := HyperLabel{#RIST,NULL_STRING,NULL_STRING,NULL_STRING}

oDCNIVEL := SingleLineEdit{self,ResourceID{JCRM_NIVEL,_GetInst()}}
oDCNIVEL:FieldSpec := PADRAO_CHAR_10{}
oDCNIVEL:HyperLabel := HyperLabel{#NIVEL,"Nivel:",NULL_STRING,"CRM_NIVEL"}

oDCCERT := SingleLineEdit{self,ResourceID{JCRM_CERT,_GetInst()}}
oDCCERT:FieldSpec := PADRAO_CHAR_40{}
oDCCERT:HyperLabel := HyperLabel{#CERT,"Nivel:",NULL_STRING,"CRM_NIVEL"}

oDCTECNICO := SingleLineEdit{self,ResourceID{JCRM_TECNICO,_GetInst()}}
oDCTECNICO:FieldSpec := PADRAO_NUM_08{}
oDCTECNICO:HyperLabel := HyperLabel{#TECNICO,"Tecnico:",NULL_STRING,"CRM_TECNICO"}

oCCRB6 := RadioButton{self,ResourceID{JCRM_RB6,_GetInst()}}
oCCRB6:HyperLabel := HyperLabel{#RB6,"INII",NULL_STRING,NULL_STRING}

oCCRB7 := RadioButton{self,ResourceID{JCRM_RB7,_GetInst()}}
oCCRB7:HyperLabel := HyperLabel{#RB7,"ISIII",NULL_STRING,NULL_STRING}

oCCRB8 := RadioButton{self,ResourceID{JCRM_RB8,_GetInst()}}
oCCRB8:HyperLabel := HyperLabel{#RB8,"IV",NULL_STRING,NULL_STRING}

oDCRIRM := SingleLineEdit{self,ResourceID{JCRM_RIRM,_GetInst()}}
oDCRIRM:FieldSpec := PADRAO_NUM_08{}
oDCRIRM:HyperLabel := HyperLabel{#RIRM,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_OBS := FixedText{self,ResourceID{JCRM_SC_OBS,_GetInst()}}
oDCSC_OBS:HyperLabel := HyperLabel{#SC_OBS,"Obs:",NULL_STRING,NULL_STRING}

oCCRB3 := RadioButton{self,ResourceID{JCRM_RB3,_GetInst()}}
oCCRB3:HyperLabel := HyperLabel{#RB3,"Aprovado",NULL_STRING,NULL_STRING}

oCCRB4 := RadioButton{self,ResourceID{JCRM_RB4,_GetInst()}}
oCCRB4:HyperLabel := HyperLabel{#RB4,"Aprovado/Condicional",NULL_STRING,NULL_STRING}

oCCRB5 := RadioButton{self,ResourceID{JCRM_RB5,_GetInst()}}
oCCRB5:HyperLabel := HyperLabel{#RB5,"Reprovado",NULL_STRING,NULL_STRING}

oDCTRIANGULAR := SingleLineEdit{self,ResourceID{JCRM_TRIANGULAR,_GetInst()}}
oDCTRIANGULAR:FieldSpec := padrao_char_01{}
oDCTRIANGULAR:HyperLabel := HyperLabel{#TRIANGULAR,NULL_STRING,NULL_STRING,NULL_STRING}

oCCcmdtriangular := PushButton{self,ResourceID{JCRM_CMDTRIANGULAR,_GetInst()}}
oCCcmdtriangular:HyperLabel := HyperLabel{#cmdtriangular,"Checar Triangular",NULL_STRING,NULL_STRING}

oDCTIPCAD := RadioButtonGroup{self,ResourceID{JCRM_TIPCAD,_GetInst()}}
oDCTIPCAD:FillUsing({ ;
						{oCCRB1,"C"}, ;
						{oCCRB2,"F"} ;
						})
oDCTIPCAD:HyperLabel := HyperLabel{#TIPCAD,"Tipo",NULL_STRING,NULL_STRING}
oDCTIPCAD:FieldSpec := PADRAO_CHAR_01{}

oDCTIPOE := RadioButtonGroup{self,ResourceID{JCRM_TIPOE,_GetInst()}}
oDCTIPOE:FillUsing({ ;
						{oCCRB13,"X"}, ;
						{oCCRB12,"M"}, ;
						{oCCRB10,"T"}, ;
						{oCCRB11,"C"}, ;
						{oCCRB9,"P"} ;
						})
oDCTIPOE:HyperLabel := HyperLabel{#TIPOE,"Tipo de Entrada",NULL_STRING,NULL_STRING}
oDCTIPOE:FieldSpec := PADRAO_CHAR_01{}

oDCINSP := RadioButtonGroup{self,ResourceID{JCRM_INSP,_GetInst()}}
oDCINSP:FillUsing({ ;
					{oCCRB6,"A"}, ;
					{oCCRB7,"B"}, ;
					{oCCRB8,"C"} ;
					})
oDCINSP:HyperLabel := HyperLabel{#INSP,"Tipo de Inspeção",NULL_STRING,NULL_STRING}
oDCINSP:FieldSpec := PADRAO_CHAR_01{}

oDCLAUDO := RadioButtonGroup{self,ResourceID{JCRM_LAUDO,_GetInst()}}
oDCLAUDO:FillUsing({ ;
						{oCCRB3,"A"}, ;
						{oCCRB4,"C"}, ;
						{oCCRB5,"R"} ;
						})
oDCLAUDO:HyperLabel := HyperLabel{#LAUDO,"Laudo:",NULL_STRING,NULL_STRING}
oDCLAUDO:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "Controle de Recebimento Mercadorias"
self:HyperLabel := HyperLabel{#JCRM,"Controle de Recebimento Mercadorias",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCRM := DataColumn{PADRAO_NUM_08{}}
oDBCRM:Width := 8
oDBCRM:HyperLabel := oDCCRM:HyperLabel 
oDBCRM:Caption := "Crm:"
self:Browser:AddColumn(oDBCRM)

oDBCBUSCA := DataColumn{PADRAO_CHAR_24{}}
oDBCBUSCA:Width := 12
oDBCBUSCA:HyperLabel := oDCCBUSCA:HyperLabel 
oDBCBUSCA:Caption := "Codigo"
self:Browser:AddColumn(oDBCBUSCA)

oDBDESCRI := DataColumn{PADRAO_CHAR_40{}}
oDBDESCRI:Width := 12
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descriçào:"
self:Browser:AddColumn(oDBDESCRI)

oDBCLIFOR := DataColumn{PADRAO_NUM_08{}}
oDBCLIFOR:Width := 8
oDBCLIFOR:HyperLabel := oDCCLIFOR:HyperLabel 
oDBCLIFOR:Caption := "Clifor:"
self:Browser:AddColumn(oDBCLIFOR)

oDBNOMEF := DataColumn{PADRAO_CHAR_40{}}
oDBNOMEF:Width := 12
oDBNOMEF:HyperLabel := oDCNOMEF:HyperLabel 
oDBNOMEF:Caption := "Fornecedor"
self:Browser:AddColumn(oDBNOMEF)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 10
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)

oDBPEDIDO := DataColumn{PADRAO_CHAR_20{}}
oDBPEDIDO:Width := 14
oDBPEDIDO:HyperLabel := oDCPEDIDO:HyperLabel 
oDBPEDIDO:Caption := "Pedido:"
self:Browser:AddColumn(oDBPEDIDO)

oDBTECNICO := DataColumn{PADRAO_NUM_08{}}
oDBTECNICO:Width := 9
oDBTECNICO:HyperLabel := oDCTECNICO:HyperLabel 
oDBTECNICO:Caption := "Tecnico:"
self:Browser:AddColumn(oDBTECNICO)

oDBNRNOTA := DataColumn{PADRAO_NUM_08{}}
oDBNRNOTA:Width := 8
oDBNRNOTA:HyperLabel := oDCNRNOTA:HyperLabel 
oDBNRNOTA:Caption := "Nrnota:"
self:Browser:AddColumn(oDBNRNOTA)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access INSP() 
return self:FieldGet(#INSP)


assign INSP(uValue) 
self:FieldPut(#INSP, uValue)
return INSP := uValue


access LAUDO() 
return self:FieldGet(#LAUDO)


assign LAUDO(uValue) 
self:FieldPut(#LAUDO, uValue)
return LAUDO := uValue


access NIVEL() 
return self:FieldGet(#NIVEL)


assign NIVEL(uValue) 
self:FieldPut(#NIVEL, uValue)
return NIVEL := uValue


access NOMEF() 
return self:FieldGet(#NOMEF)


assign NOMEF(uValue) 
self:FieldPut(#NOMEF, uValue)
return NOMEF := uValue


access NRNOTA() 
return self:FieldGet(#NRNOTA)


assign NRNOTA(uValue) 
self:FieldPut(#NRNOTA, uValue)
return NRNOTA := uValue


access NRNOTB() 
return self:FieldGet(#NRNOTB)


assign NRNOTB(uValue) 
self:FieldPut(#NRNOTB, uValue)
return NRNOTB := uValue


access OBS() 
return self:FieldGet(#OBS)


assign OBS(uValue) 
self:FieldPut(#OBS, uValue)
return OBS := uValue


access PEDIDO() 
return self:FieldGet(#PEDIDO)


assign PEDIDO(uValue) 
self:FieldPut(#PEDIDO, uValue)
return PEDIDO := uValue


access PRODUTO() 
return self:FieldGet(#PRODUTO)


assign PRODUTO(uValue) 
self:FieldPut(#PRODUTO, uValue)
return PRODUTO := uValue


access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


access QTDEA() 
return self:FieldGet(#QTDEA)


assign QTDEA(uValue) 
self:FieldPut(#QTDEA, uValue)
return QTDEA := uValue


access QTDEB() 
return self:FieldGet(#QTDEB)


assign QTDEB(uValue) 
self:FieldPut(#QTDEB, uValue)
return QTDEB := uValue


access RASTRO() 
return self:FieldGet(#RASTRO)


assign RASTRO(uValue) 
self:FieldPut(#RASTRO, uValue)
return RASTRO := uValue


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


access TECNICO() 
return self:FieldGet(#TECNICO)


assign TECNICO(uValue) 
self:FieldPut(#TECNICO, uValue)
return TECNICO := uValue


access TIPCAD() 
return self:FieldGet(#TIPCAD)


assign TIPCAD(uValue) 
self:FieldPut(#TIPCAD, uValue)
return TIPCAD := uValue


access TIPOE() 
return self:FieldGet(#TIPOE)


assign TIPOE(uValue) 
self:FieldPut(#TIPOE, uValue)
return TIPOE := uValue


access TRIANGULAR() 
return self:FieldGet(#TRIANGULAR)


assign TRIANGULAR(uValue) 
self:FieldPut(#TRIANGULAR, uValue)
return TRIANGULAR := uValue


access UNID() 
return self:FieldGet(#UNID)


assign UNID(uValue) 
self:FieldPut(#UNID, uValue)
return UNID := uValue


END CLASS
