#region DEFINES
STATIC DEFINE JRIRM_ALTERAR := 142 
STATIC DEFINE JRIRM_APLICACAO := 123 
STATIC DEFINE JRIRM_AREA := 147 
STATIC DEFINE JRIRM_BUSCARIRM := 154 
STATIC DEFINE JRIRM_CARGO := 130 
STATIC DEFINE JRIRM_CERT := 116 
STATIC DEFINE JRIRM_CHECKNOM := 168 
STATIC DEFINE JRIRM_CHKENS := 179 
STATIC DEFINE JRIRM_CHKTIPO := 177 
STATIC DEFINE JRIRM_CLASSI := 167 
STATIC DEFINE JRIRM_CLOTECRT := 139 
STATIC DEFINE JRIRM_CMDBOBINA := 182 
STATIC DEFINE JRIRM_CMDCERT := 174 
STATIC DEFINE JRIRM_CMDINICIA := 181 
STATIC DEFINE JRIRM_CONTIG := 155 
STATIC DEFINE JRIRM_CRIAITENS := 163 
STATIC DEFINE JRIRM_CRM := 153 
STATIC DEFINE JRIRM_DATA := 170 
STATIC DEFINE JRIRM_DATAL := 151 
STATIC DEFINE JRIRM_DATANF := 128 
STATIC DEFINE JRIRM_DESCR := 117 
STATIC DEFINE JRIRM_DESENHO := 115 
STATIC DEFINE JRIRM_DIGAPL := 166 
STATIC DEFINE JRIRM_DIGCOD := 164 
STATIC DEFINE JRIRM_DIGCOD1 := 185 
STATIC DEFINE JRIRM_DIGDES := 165 
STATIC DEFINE JRIRM_EDITAR := 136 
STATIC DEFINE JRIRM_ETIQIDENT := 184 
STATIC DEFINE JRIRM_ETIQLAB := 169 
STATIC DEFINE JRIRM_ETIQMAT := 183 
STATIC DEFINE JRIRM_FORNE := 125 
STATIC DEFINE JRIRM_FOTO := 176 
STATIC DEFINE JRIRM_FT12 := 111 
STATIC DEFINE JRIRM_FT13 := 140 
STATIC DEFINE JRIRM_FT14 := 144 
STATIC DEFINE JRIRM_FT15 := 150 
STATIC DEFINE JRIRM_FT16 := 152 
STATIC DEFINE JRIRM_FT17 := 173 
STATIC DEFINE JRIRM_GB1 := 131 
STATIC DEFINE JRIRM_INSP := 162 
STATIC DEFINE JRIRM_INSTRU := 118 
STATIC DEFINE JRIRM_JRIMI := 122 
STATIC DEFINE JRIRM_LAUDO := 138 
STATIC DEFINE JRIRM_LAUDOF := 149 
STATIC DEFINE JRIRM_NFORN := 124 
STATIC DEFINE JRIRM_NQTDE := 141 
STATIC DEFINE JRIRM_NRNOTA := 127 
STATIC DEFINE JRIRM_NRNOTB := 143 
STATIC DEFINE JRIRM_OBS01 := 132 
STATIC DEFINE JRIRM_OBS02 := 133 
STATIC DEFINE JRIRM_OBS03 := 134 
STATIC DEFINE JRIRM_OBS04 := 135 
STATIC DEFINE JRIRM_PEDIDO := 126 
STATIC DEFINE JRIRM_PEGAMOSTRA := 156 
STATIC DEFINE JRIRM_PEGCLA := 180 
STATIC DEFINE JRIRM_QTAMO := 157 
STATIC DEFINE JRIRM_QTDE := 119 
STATIC DEFINE JRIRM_RASTRO := 121 
STATIC DEFINE JRIRM_RB6 := 159 
STATIC DEFINE JRIRM_RB7 := 160 
STATIC DEFINE JRIRM_RB8 := 161 
STATIC DEFINE JRIRM_RC := 145 
STATIC DEFINE JRIRM_RESPO := 129 
STATIC DEFINE JRIRM_RIRM := 114 
STATIC DEFINE JRIRM_SC_CERT := 107 
STATIC DEFINE JRIRM_SC_DATA := 171 
STATIC DEFINE JRIRM_SC_DATANF := 108 
STATIC DEFINE JRIRM_SC_DESCR := 100 
STATIC DEFINE JRIRM_SC_DESTINO2 := 175 
STATIC DEFINE JRIRM_SC_FORNE := 105 
STATIC DEFINE JRIRM_SC_INSTRU := 102 
STATIC DEFINE JRIRM_SC_LAUDOF := 120 
STATIC DEFINE JRIRM_SC_NRNOTA := 110 
STATIC DEFINE JRIRM_SC_OBS01 := 124 
STATIC DEFINE JRIRM_SC_OBS02 := 126 
STATIC DEFINE JRIRM_SC_OBS03 := 128 
STATIC DEFINE JRIRM_SC_PEDIDO := 113 
STATIC DEFINE JRIRM_SC_QTAMO := 158 
STATIC DEFINE JRIRM_SC_QTDE := 103 
STATIC DEFINE JRIRM_SC_QTDE1 := 148 
STATIC DEFINE JRIRM_SC_RASTRO := 112 
STATIC DEFINE JRIRM_SC_RIRM := 106 
STATIC DEFINE JRIRM_SUBCHKTIP := 178 
STATIC DEFINE JRIRM_TABULAR := 137 
STATIC DEFINE JRIRM_THEFIXEDTEXT12 := 101 
STATIC DEFINE JRIRM_THEFIXEDTEXT13 := 109 
STATIC DEFINE JRIRM_THEFIXEDTEXT14 := 104 
STATIC DEFINE JRIRM_TIPOENT := 172 
STATIC DEFINE JRIRM_TL := 146 
STATIC DEFINE JRIRM_UNID := 120 
#endregion

class JRIRM inherit MYDataWindow 

	PROTECT oDBRIRM as DataColumn
	PROTECT oDBDESENHO as DataColumn
	PROTECT oDBDESCR as DataColumn
	PROTECT oDBNFORN as DataColumn
	PROTECT oDBFORNE as DataColumn
	PROTECT oDBAPLICACAO as DataColumn
	PROTECT oDBCERT as DataColumn
	PROTECT oDBINSTRU as DataColumn
	PROTECT oDBQTDE as DataColumn
	PROTECT oDBUNID as DataColumn
	PROTECT oDBRASTRO as DataColumn
	PROTECT oDBPEDIDO as DataColumn
	PROTECT oDBNRNOTA as DataColumn
	protect oDCSC_DESCR as FIXEDTEXT
	protect oDCtheFixedText12 as FIXEDTEXT
	protect oDCSC_INSTRU as FIXEDTEXT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCtheFixedText14 as FIXEDTEXT
	protect oDCSC_FORNE as FIXEDTEXT
	protect oDCSC_RIRM as FIXEDTEXT
	protect oDCSC_CERT as FIXEDTEXT
	protect oDCSC_DATANF as FIXEDTEXT
	protect oDCtheFixedText13 as FIXEDTEXT
	protect oDCSC_NRNOTA as FIXEDTEXT
	protect oDCFT12 as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCSC_PEDIDO as FIXEDTEXT
	protect oDCRIRM as SINGLELINEEDIT
	protect oDCDESENHO as SINGLELINEEDIT
	protect oDCCERT as SINGLELINEEDIT
	protect oDCDESCR as SINGLELINEEDIT
	protect oDCINSTRU as SINGLELINEEDIT
	protect oDCQTDE as SINGLELINEEDIT
	protect oDCUNID as SINGLELINEEDIT
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCAPLICACAO as SINGLELINEEDIT
	protect oDCNFORN as SINGLELINEEDIT
	protect oDCFORNE as SINGLELINEEDIT
	protect oDCPEDIDO as SINGLELINEEDIT
	protect oDCNRNOTA as SINGLELINEEDIT
	protect oDCDATANF as DATETIMEPICKER
	protect oDCRESPO as SINGLELINEEDIT
	protect oDCCARGO as SINGLELINEEDIT
	protect oDCGB1 as GROUPBOX
	protect oDCOBS01 as SINGLELINEEDIT
	protect oDCOBS02 as SINGLELINEEDIT
	protect oDCOBS03 as SINGLELINEEDIT
	protect oDCOBS04 as SINGLELINEEDIT
	protect oCCEditar as PUSHBUTTON
	protect oCCTabular as PUSHBUTTON
	protect oCCLaudo as PUSHBUTTON
	protect oDCCLOTECRT as SINGLELINEEDIT
	protect oDCFT13 as FIXEDTEXT
	protect oDCnQTDE as RIGHTSLE
	protect oCCAlterar as PUSHBUTTON
	protect oDCNRNOTB as SINGLELINEEDIT
	protect oDCFT14 as FIXEDTEXT
	protect oCCRC as PUSHBUTTON
	protect oCCTL as PUSHBUTTON
	protect oDCAREA as SINGLELINEEDIT
	protect oDCSC_QTDE1 as FIXEDTEXT
	protect oDCLAUDOF as SINGLELINEEDIT
	protect oDCFT15 as FIXEDTEXT
	protect oDCDATAL as SINGLELINEEDIT
	protect oDCFT16 as FIXEDTEXT
	protect oDCCRM as SINGLELINEEDIT
	protect oCCbuscarirm as PUSHBUTTON
	protect oDCCONTIG as CHECKBOX
	protect oCCpegamostra as PUSHBUTTON
	protect oDCQTAMO as RIGHTSLE
	protect oDCSC_QTAMO as FIXEDTEXT
	protect oCCRB6 as RADIOBUTTON
	protect oCCRB7 as RADIOBUTTON
	protect oCCRB8 as RADIOBUTTON
	protect oDCINSP as RADIOBUTTONGROUP
	protect oCCcriaitens as PUSHBUTTON
	protect oCCdigcod as PUSHBUTTON
	protect oCCdigdes as PUSHBUTTON
	protect oCCdigapl as PUSHBUTTON
	protect oDCCLASSI as SINGLELINEEDIT
	protect oCCchecknom as PUSHBUTTON
	protect oCCetiqlab as PUSHBUTTON
	protect oDCDATA as SINGLELINEEDIT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCTIPOENT as SINGLELINEEDIT
	protect oDCFT17 as FIXEDTEXT
	protect oCCcmdcert as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCCHKTIPO as PUSHBUTTON
	protect oCCsubchktip as PUSHBUTTON
	protect oCCCHKens as PUSHBUTTON
	protect oCCpegcla as PUSHBUTTON
	protect oCCcmdinicia as PUSHBUTTON
	protect oCCcmdbobina as PUSHBUTTON
	protect oCCetiqmat as PUSHBUTTON
	protect oCCetiqIdent as PUSHBUTTON
	protect oCCdigcod1 as PUSHBUTTON
// 	instance RIRM 
// 	instance DESENHO 
// 	instance CERT 
// 	instance DESCR 
// 	instance INSTRU 
// 	instance QTDE 
// 	instance UNID 
// 	instance RASTRO 
// 	instance APLICACAO 
// 	instance NFORN 
// 	instance FORNE 
// 	instance PEDIDO 
// 	instance NRNOTA 
// 	instance RESPO 
// 	instance CARGO 
// 	instance OBS01 
// 	instance OBS02 
// 	instance OBS03 
// 	instance OBS04 
// 	instance CLOTECRT 
// 	instance nQTDE 
// 	instance NRNOTB 
// 	instance AREA 
// 	instance LAUDOF 
// 	instance DATAL 
// 	instance CRM 
// 	instance CONTIG 
// 	instance QTAMO 
// 	instance INSP 
// 	instance CLASSI 
// 	instance DATA 
// 	instance TIPOENT 
	protect oSFJRIMI as JRIMI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access APLICACAO() 
return self:FieldGet(#APLICACAO)


assign APLICACAO(uValue) 
self:FieldPut(#APLICACAO, uValue)
return APLICACAO := uValue


access AREA() 
return self:FieldGet(#AREA)


assign AREA(uValue) 
self:FieldPut(#AREA, uValue)
return AREA := uValue


access CARGO() 
return self:FieldGet(#CARGO)


assign CARGO(uValue) 
self:FieldPut(#CARGO, uValue)
return CARGO := uValue


access CERT() 
return self:FieldGet(#CERT)


assign CERT(uValue) 
self:FieldPut(#CERT, uValue)
return CERT := uValue


access CLASSI() 
return self:FieldGet(#CLASSI)


assign CLASSI(uValue) 
self:FieldPut(#CLASSI, uValue)
return CLASSI := uValue


access CLOTECRT() 
return self:FieldGet(#CLOTECRT)


assign CLOTECRT(uValue) 
self:FieldPut(#CLOTECRT, uValue)
return CLOTECRT := uValue


access CONTIG() 
return self:FieldGet(#CONTIG)


assign CONTIG(uValue) 
self:FieldPut(#CONTIG, uValue)
return CONTIG := uValue


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


access DATAL() 
return self:FieldGet(#DATAL)


assign DATAL(uValue) 
self:FieldPut(#DATAL, uValue)
return DATAL := uValue


access DESCR() 
return self:FieldGet(#DESCR)


assign DESCR(uValue) 
self:FieldPut(#DESCR, uValue)
return DESCR := uValue


access DESENHO() 
return self:FieldGet(#DESENHO)


assign DESENHO(uValue) 
self:FieldPut(#DESENHO, uValue)
return DESENHO := uValue


access FORNE() 
return self:FieldGet(#FORNE)


assign FORNE(uValue) 
self:FieldPut(#FORNE, uValue)
return FORNE := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRIRM",_GetInst()},iCtlID)

oDCSC_DESCR := FixedText{self,ResourceID{JRIRM_SC_DESCR,_GetInst()}}
oDCSC_DESCR:HyperLabel := HyperLabel{#SC_DESCR,"Descrição do Material:",NULL_STRING,NULL_STRING}

oDCtheFixedText12 := FixedText{self,ResourceID{JRIRM_THEFIXEDTEXT12,_GetInst()}}
oDCtheFixedText12:HyperLabel := HyperLabel{#theFixedText12,"Aplicação",NULL_STRING,NULL_STRING}

oDCSC_INSTRU := FixedText{self,ResourceID{JRIRM_SC_INSTRU,_GetInst()}}
oDCSC_INSTRU:HyperLabel := HyperLabel{#SC_INSTRU,"Instrução de Trabalho:",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{self,ResourceID{JRIRM_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Quantidade:",NULL_STRING,NULL_STRING}

oDCtheFixedText14 := FixedText{self,ResourceID{JRIRM_THEFIXEDTEXT14,_GetInst()}}
oDCtheFixedText14:HyperLabel := HyperLabel{#theFixedText14,"Cargo:",NULL_STRING,NULL_STRING}

oDCSC_FORNE := FixedText{self,ResourceID{JRIRM_SC_FORNE,_GetInst()}}
oDCSC_FORNE:HyperLabel := HyperLabel{#SC_FORNE,"Fornecedor:",NULL_STRING,NULL_STRING}

oDCSC_RIRM := FixedText{self,ResourceID{JRIRM_SC_RIRM,_GetInst()}}
oDCSC_RIRM:HyperLabel := HyperLabel{#SC_RIRM,"Rirm:",NULL_STRING,NULL_STRING}

oDCSC_CERT := FixedText{self,ResourceID{JRIRM_SC_CERT,_GetInst()}}
oDCSC_CERT:HyperLabel := HyperLabel{#SC_CERT,"Certificado:",NULL_STRING,NULL_STRING}

oDCSC_DATANF := FixedText{self,ResourceID{JRIRM_SC_DATANF,_GetInst()}}
oDCSC_DATANF:HyperLabel := HyperLabel{#SC_DATANF,"Data Nota:",NULL_STRING,NULL_STRING}

oDCtheFixedText13 := FixedText{self,ResourceID{JRIRM_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Responsável:",NULL_STRING,NULL_STRING}

oDCSC_NRNOTA := FixedText{self,ResourceID{JRIRM_SC_NRNOTA,_GetInst()}}
oDCSC_NRNOTA:HyperLabel := HyperLabel{#SC_NRNOTA,"Número Nota:",NULL_STRING,NULL_STRING}

oDCFT12 := FixedText{self,ResourceID{JRIRM_FT12,_GetInst()}}
oDCFT12:HyperLabel := HyperLabel{#FT12,"Unidade",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{JRIRM_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCSC_PEDIDO := FixedText{self,ResourceID{JRIRM_SC_PEDIDO,_GetInst()}}
oDCSC_PEDIDO:HyperLabel := HyperLabel{#SC_PEDIDO,"Pedido:",NULL_STRING,NULL_STRING}

oDCRIRM := SingleLineEdit{self,ResourceID{JRIRM_RIRM,_GetInst()}}
oDCRIRM:FieldSpec := PADRAO_NUM_08{}
oDCRIRM:HyperLabel := HyperLabel{#RIRM,"Rirm:",NULL_STRING,"RIRM_RIRM"}

oDCDESENHO := SingleLineEdit{self,ResourceID{JRIRM_DESENHO,_GetInst()}}
oDCDESENHO:FieldSpec := PADRAO_CHAR_24{}
oDCDESENHO:HyperLabel := HyperLabel{#DESENHO,"Codigo",NULL_STRING,NULL_STRING}

oDCCERT := SingleLineEdit{self,ResourceID{JRIRM_CERT,_GetInst()}}
oDCCERT:FieldSpec := PADRAO_CHAR_40{}
oDCCERT:HyperLabel := HyperLabel{#CERT,"Cert:",NULL_STRING,"RIRM_CERT"}

oDCDESCR := SingleLineEdit{self,ResourceID{JRIRM_DESCR,_GetInst()}}
oDCDESCR:FieldSpec := PADRAO_CHAR_40{}
oDCDESCR:HyperLabel := HyperLabel{#DESCR,"Descr:",NULL_STRING,"RIRM_DESCR"}

oDCINSTRU := SingleLineEdit{self,ResourceID{JRIRM_INSTRU,_GetInst()}}
oDCINSTRU:FieldSpec := PADRAO_CHAR_40{}
oDCINSTRU:HyperLabel := HyperLabel{#INSTRU,"Instru:",NULL_STRING,"RIRM_INSTRU"}

oDCQTDE := SingleLineEdit{self,ResourceID{JRIRM_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := PADRAO_NUM_12_3{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"RIRM_QTDE"}

oDCUNID := SingleLineEdit{self,ResourceID{JRIRM_UNID,_GetInst()}}
oDCUNID:FieldSpec := PADRAO_CHAR_04{}
oDCUNID:HyperLabel := HyperLabel{#UNID,"Und",NULL_STRING,NULL_STRING}

oDCRASTRO := SingleLineEdit{self,ResourceID{JRIRM_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := padrao_chAR_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"RIRM_RASTRO"}
oDCRASTRO:FocusSelect := FSEL_HOME

oDCAPLICACAO := SingleLineEdit{self,ResourceID{JRIRM_APLICACAO,_GetInst()}}
oDCAPLICACAO:FieldSpec := PADRAO_CHAR_30{}
oDCAPLICACAO:HyperLabel := HyperLabel{#APLICACAO,"Aplicação",NULL_STRING,NULL_STRING}

oDCNFORN := SingleLineEdit{self,ResourceID{JRIRM_NFORN,_GetInst()}}
oDCNFORN:FieldSpec := PADRAO_NUM_08{}
oDCNFORN:HyperLabel := HyperLabel{#NFORN,"No.For.",NULL_STRING,NULL_STRING}

oDCFORNE := SingleLineEdit{self,ResourceID{JRIRM_FORNE,_GetInst()}}
oDCFORNE:FieldSpec := PADRAO_CHAR_40{}
oDCFORNE:HyperLabel := HyperLabel{#FORNE,"Fornecedor:",NULL_STRING,"RIRM_FORNE"}

oDCPEDIDO := SingleLineEdit{self,ResourceID{JRIRM_PEDIDO,_GetInst()}}
oDCPEDIDO:FieldSpec := PADRAO_CHAR_20{}
oDCPEDIDO:HyperLabel := HyperLabel{#PEDIDO,"Pedido:",NULL_STRING,"RIRM_PEDIDO"}

oDCNRNOTA := SingleLineEdit{self,ResourceID{JRIRM_NRNOTA,_GetInst()}}
oDCNRNOTA:FieldSpec := PADRAO_NUM_08{}
oDCNRNOTA:HyperLabel := HyperLabel{#NRNOTA,"Nrnota:",NULL_STRING,"RIRM_NRNOTA"}

oDCDATANF := DateTimePicker{self,ResourceID{JRIRM_DATANF,_GetInst()}}
oDCDATANF:FieldSpec := DATE_FIELD{}
oDCDATANF:HyperLabel := HyperLabel{#DATANF,"Datanf",NULL_STRING,NULL_STRING}

oDCRESPO := SingleLineEdit{self,ResourceID{JRIRM_RESPO,_GetInst()}}
oDCRESPO:FieldSpec := PADRAO_CHAR_40{}
oDCRESPO:HyperLabel := HyperLabel{#RESPO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCARGO := SingleLineEdit{self,ResourceID{JRIRM_CARGO,_GetInst()}}
oDCCARGO:FieldSpec := PADRAO_CHAR_40{}
oDCCARGO:HyperLabel := HyperLabel{#CARGO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCGB1 := GroupBox{self,ResourceID{JRIRM_GB1,_GetInst()}}
oDCGB1:HyperLabel := HyperLabel{#GB1,"Observações",NULL_STRING,NULL_STRING}

oDCOBS01 := SingleLineEdit{self,ResourceID{JRIRM_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := PADRAO_CHAR_80{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Obs01:",NULL_STRING,"RIRM_OBS01"}

oDCOBS02 := SingleLineEdit{self,ResourceID{JRIRM_OBS02,_GetInst()}}
oDCOBS02:FieldSpec := PADRAO_CHAR_80{}
oDCOBS02:HyperLabel := HyperLabel{#OBS02,"Obs02:",NULL_STRING,"RIRM_OBS02"}

oDCOBS03 := SingleLineEdit{self,ResourceID{JRIRM_OBS03,_GetInst()}}
oDCOBS03:FieldSpec := PADRAO_CHAR_80{}
oDCOBS03:HyperLabel := HyperLabel{#OBS03,"Obs03:",NULL_STRING,"RIRM_OBS03"}

oDCOBS04 := SingleLineEdit{self,ResourceID{JRIRM_OBS04,_GetInst()}}
oDCOBS04:FieldSpec := PADRAO_CHAR_80{}
oDCOBS04:HyperLabel := HyperLabel{#OBS04,"Obs03:",NULL_STRING,"RIRM_OBS03"}

oCCEditar := PushButton{self,ResourceID{JRIRM_EDITAR,_GetInst()}}
oCCEditar:HyperLabel := HyperLabel{#Editar,"E"+_chr(38)+"ditar",NULL_STRING,NULL_STRING}

oCCTabular := PushButton{self,ResourceID{JRIRM_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,_chr(38)+"Tabular",NULL_STRING,NULL_STRING}

oCCLaudo := PushButton{self,ResourceID{JRIRM_LAUDO,_GetInst()}}
oCCLaudo:HyperLabel := HyperLabel{#Laudo,"Laudo",NULL_STRING,NULL_STRING}

oDCCLOTECRT := SingleLineEdit{self,ResourceID{JRIRM_CLOTECRT,_GetInst()}}
oDCCLOTECRT:FieldSpec := PADRAO_CHAR_01{}
oDCCLOTECRT:HyperLabel := HyperLabel{#CLOTECRT,"Und",NULL_STRING,NULL_STRING}

oDCFT13 := FixedText{self,ResourceID{JRIRM_FT13,_GetInst()}}
oDCFT13:HyperLabel := HyperLabel{#FT13,"Lote/CRT",NULL_STRING,NULL_STRING}

oDCnQTDE := rightSle{self,ResourceID{JRIRM_NQTDE,_GetInst()}}
oDCnQTDE:FieldSpec := PADRAO_NUM_12_2{}
oDCnQTDE:HyperLabel := HyperLabel{#nQTDE,"Qtde:",NULL_STRING,"RIRM_QTDE"}

oCCAlterar := PushButton{self,ResourceID{JRIRM_ALTERAR,_GetInst()}}
oCCAlterar:HyperLabel := HyperLabel{#Alterar,"Marcar Qtdes",NULL_STRING,NULL_STRING}
oCCAlterar:TooltipText := "Marcas as Quantidades de Todos os Items"

oDCNRNOTB := SingleLineEdit{self,ResourceID{JRIRM_NRNOTB,_GetInst()}}
oDCNRNOTB:FieldSpec := PADRAO_NUM_08{}
oDCNRNOTB:HyperLabel := HyperLabel{#NRNOTB,"Nrnota:",NULL_STRING,"RIRM_NRNOTA"}

oDCFT14 := FixedText{self,ResourceID{JRIRM_FT14,_GetInst()}}
oDCFT14:HyperLabel := HyperLabel{#FT14,"CRM",NULL_STRING,NULL_STRING}

oCCRC := PushButton{self,ResourceID{JRIRM_RC,_GetInst()}}
oCCRC:HyperLabel := HyperLabel{#RC,"Rastro/Cert",NULL_STRING,NULL_STRING}

oCCTL := PushButton{self,ResourceID{JRIRM_TL,_GetInst()}}
oCCTL:HyperLabel := HyperLabel{#TL,"Laudo",NULL_STRING,NULL_STRING}

oDCAREA := SingleLineEdit{self,ResourceID{JRIRM_AREA,_GetInst()}}
oDCAREA:FieldSpec := PADRAO_CHAR_02{}
oDCAREA:HyperLabel := HyperLabel{#AREA,"AREA",NULL_STRING,"RIRM_NRNOTA"}

oDCSC_QTDE1 := FixedText{self,ResourceID{JRIRM_SC_QTDE1,_GetInst()}}
oDCSC_QTDE1:HyperLabel := HyperLabel{#SC_QTDE1,"Area",NULL_STRING,NULL_STRING}

oDCLAUDOF := SingleLineEdit{self,ResourceID{JRIRM_LAUDOF,_GetInst()}}
oDCLAUDOF:FieldSpec := PADRAO_CHAR_01{}
oDCLAUDOF:HyperLabel := HyperLabel{#LAUDOF,"Und",NULL_STRING,NULL_STRING}

oDCFT15 := FixedText{self,ResourceID{JRIRM_FT15,_GetInst()}}
oDCFT15:HyperLabel := HyperLabel{#FT15,"Laudo",NULL_STRING,NULL_STRING}

oDCDATAL := SingleLineEdit{self,ResourceID{JRIRM_DATAL,_GetInst()}}
oDCDATAL:FieldSpec := DATE_FIELD{}
oDCDATAL:HyperLabel := HyperLabel{#DATAL,"Und",NULL_STRING,NULL_STRING}

oDCFT16 := FixedText{self,ResourceID{JRIRM_FT16,_GetInst()}}
oDCFT16:HyperLabel := HyperLabel{#FT16,"Em",NULL_STRING,NULL_STRING}

oDCCRM := SingleLineEdit{self,ResourceID{JRIRM_CRM,_GetInst()}}
oDCCRM:FieldSpec := PADRAO_NUM_08{}
oDCCRM:HyperLabel := HyperLabel{#CRM,"Und",NULL_STRING,NULL_STRING}

oCCbuscarirm := PushButton{self,ResourceID{JRIRM_BUSCARIRM,_GetInst()}}
oCCbuscarirm:Image := ico_find{}
oCCbuscarirm:HyperLabel := HyperLabel{#buscarirm,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCONTIG := CheckBox{self,ResourceID{JRIRM_CONTIG,_GetInst()}}
oDCCONTIG:HyperLabel := HyperLabel{#CONTIG,"Contigencia",NULL_STRING,"Rist_CONTIG"}
oDCCONTIG:FieldSpec := LOGIC_FIELD{}

oCCpegamostra := PushButton{self,ResourceID{JRIRM_PEGAMOSTRA,_GetInst()}}
oCCpegamostra:HyperLabel := HyperLabel{#pegamostra,"...",NULL_STRING,NULL_STRING}

oDCQTAMO := rightSle{self,ResourceID{JRIRM_QTAMO,_GetInst()}}
oDCQTAMO:FieldSpec := PADRAO_NUM_08{}
oDCQTAMO:HyperLabel := HyperLabel{#QTAMO,"Qtamo:",NULL_STRING,"RIST_QTAMO"}

oDCSC_QTAMO := FixedText{self,ResourceID{JRIRM_SC_QTAMO,_GetInst()}}
oDCSC_QTAMO:HyperLabel := HyperLabel{#SC_QTAMO,"Qtde. Amostra",NULL_STRING,NULL_STRING}

oCCRB6 := RadioButton{self,ResourceID{JRIRM_RB6,_GetInst()}}
oCCRB6:HyperLabel := HyperLabel{#RB6,"IV",NULL_STRING,NULL_STRING}

oCCRB7 := RadioButton{self,ResourceID{JRIRM_RB7,_GetInst()}}
oCCRB7:HyperLabel := HyperLabel{#RB7,"ISIII",NULL_STRING,NULL_STRING}

oCCRB8 := RadioButton{self,ResourceID{JRIRM_RB8,_GetInst()}}
oCCRB8:HyperLabel := HyperLabel{#RB8,"INII",NULL_STRING,NULL_STRING}

oCCcriaitens := PushButton{self,ResourceID{JRIRM_CRIAITENS,_GetInst()}}
oCCcriaitens:HyperLabel := HyperLabel{#criaitens,"criaitens",NULL_STRING,NULL_STRING}

oCCdigcod := PushButton{self,ResourceID{JRIRM_DIGCOD,_GetInst()}}
oCCdigcod:HyperLabel := HyperLabel{#digcod,"...",NULL_STRING,NULL_STRING}

oCCdigdes := PushButton{self,ResourceID{JRIRM_DIGDES,_GetInst()}}
oCCdigdes:HyperLabel := HyperLabel{#digdes,"...",NULL_STRING,NULL_STRING}

oCCdigapl := PushButton{self,ResourceID{JRIRM_DIGAPL,_GetInst()}}
oCCdigapl:HyperLabel := HyperLabel{#digapl,"E.",NULL_STRING,NULL_STRING}
oCCdigapl:TooltipText := "Preencher Manualmente a Aplicacao"

oDCCLASSI := SingleLineEdit{self,ResourceID{JRIRM_CLASSI,_GetInst()}}
oDCCLASSI:FieldSpec := PADRAO_CHAR_01{}
oDCCLASSI:HyperLabel := HyperLabel{#CLASSI,"Classi:",NULL_STRING,"Rist_CLASSI"}

oCCchecknom := PushButton{self,ResourceID{JRIRM_CHECKNOM,_GetInst()}}
oCCchecknom:HyperLabel := HyperLabel{#checknom,"-->",NULL_STRING,NULL_STRING}

oCCetiqlab := PushButton{self,ResourceID{JRIRM_ETIQLAB,_GetInst()}}
oCCetiqlab:HyperLabel := HyperLabel{#etiqlab,"Etiq.Lab.",NULL_STRING,NULL_STRING}
oCCetiqlab:TooltipText := "Imprimir Etiqueta de Laboratorio"

oDCDATA := SingleLineEdit{self,ResourceID{JRIRM_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Und",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JRIRM_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCTIPOENT := SingleLineEdit{self,ResourceID{JRIRM_TIPOENT,_GetInst()}}
oDCTIPOENT:FieldSpec := PADRAO_CHAR_01{}
oDCTIPOENT:HyperLabel := HyperLabel{#TIPOENT,"Und",NULL_STRING,NULL_STRING}

oDCFT17 := FixedText{self,ResourceID{JRIRM_FT17,_GetInst()}}
oDCFT17:HyperLabel := HyperLabel{#FT17,"(M)atPrima (C)omponente",NULL_STRING,NULL_STRING}

oCCcmdcert := PushButton{self,ResourceID{JRIRM_CMDCERT,_GetInst()}}
oCCcmdcert:HyperLabel := HyperLabel{#cmdcert,"Conforme Certificado",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JRIRM_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JRIRM_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oCCCHKTIPO := PushButton{self,ResourceID{JRIRM_CHKTIPO,_GetInst()}}
oCCCHKTIPO:HyperLabel := HyperLabel{#CHKTIPO,"Checar Tipo Todos Rirm",NULL_STRING,NULL_STRING}

oCCsubchktip := PushButton{self,ResourceID{JRIRM_SUBCHKTIP,_GetInst()}}
oCCsubchktip:HyperLabel := HyperLabel{#subchktip,"Checar Tipos",NULL_STRING,NULL_STRING}

oCCCHKens := PushButton{self,ResourceID{JRIRM_CHKENS,_GetInst()}}
oCCCHKens:HyperLabel := HyperLabel{#CHKens,"Checar Ensaios 2004",NULL_STRING,NULL_STRING}

oCCpegcla := PushButton{self,ResourceID{JRIRM_PEGCLA,_GetInst()}}
oCCpegcla:HyperLabel := HyperLabel{#pegcla,"...",NULL_STRING,NULL_STRING}
oCCpegcla:TooltipText := "Pegar a Classificacao do Fornecedor"

oCCcmdinicia := PushButton{self,ResourceID{JRIRM_CMDINICIA,_GetInst()}}
oCCcmdinicia:HyperLabel := HyperLabel{#cmdinicia,"Iniciar Preenchimento",NULL_STRING,NULL_STRING}

oCCcmdbobina := PushButton{self,ResourceID{JRIRM_CMDBOBINA,_GetInst()}}
oCCcmdbobina:HyperLabel := HyperLabel{#cmdbobina,"Executa Liberacao da Bobina",NULL_STRING,NULL_STRING}

oCCetiqmat := PushButton{self,ResourceID{JRIRM_ETIQMAT,_GetInst()}}
oCCetiqmat:HyperLabel := HyperLabel{#etiqmat,"Etiq.Mat.Apr.",NULL_STRING,NULL_STRING}
oCCetiqmat:TooltipText := "Imprimir Etiqueta Material Aprovado"

oCCetiqIdent := PushButton{self,ResourceID{JRIRM_ETIQIDENT,_GetInst()}}
oCCetiqIdent:HyperLabel := HyperLabel{#etiqIdent,"Etiq.Ident.",NULL_STRING,NULL_STRING}
oCCetiqIdent:TooltipText := "Imprimir Etiqueta Material Aprovado"

oCCdigcod1 := PushButton{self,ResourceID{JRIRM_DIGCOD1,_GetInst()}}
oCCdigcod1:HyperLabel := HyperLabel{#digcod1,"...",NULL_STRING,NULL_STRING}
oCCdigcod1:TooltipText := "Escolher a Aplicacao cadastro Produto"

oDCINSP := RadioButtonGroup{self,ResourceID{JRIRM_INSP,_GetInst()}}
oDCINSP:FillUsing({ ;
					{oCCRB6,"C"}, ;
					{oCCRB7,"B"}, ;
					{oCCRB8,"A"} ;
					})
oDCINSP:HyperLabel := HyperLabel{#INSP,"Tipo de Inspeção",NULL_STRING,NULL_STRING}
oDCINSP:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "Inspeção e Ensaio Recebimento de Material"
self:HyperLabel := HyperLabel{#JRIRM,"Inspeção e Ensaio Recebimento de Material",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRIRM := DataColumn{PADRAO_NUM_08{}}
oDBRIRM:Width := 6
oDBRIRM:HyperLabel := oDCRIRM:HyperLabel 
oDBRIRM:Caption := "Rirm:"
self:Browser:AddColumn(oDBRIRM)

oDBDESENHO := DataColumn{PADRAO_CHAR_24{}}
oDBDESENHO:Width := 11
oDBDESENHO:HyperLabel := oDCDESENHO:HyperLabel 
oDBDESENHO:Caption := "Codigo"
self:Browser:AddColumn(oDBDESENHO)

oDBDESCR := DataColumn{PADRAO_CHAR_40{}}
oDBDESCR:Width := 14
oDBDESCR:HyperLabel := oDCDESCR:HyperLabel 
oDBDESCR:Caption := "Descr:"
self:Browser:AddColumn(oDBDESCR)

oDBNFORN := DataColumn{PADRAO_NUM_08{}}
oDBNFORN:Width := 8
oDBNFORN:HyperLabel := oDCNFORN:HyperLabel 
oDBNFORN:Caption := "No.For."
self:Browser:AddColumn(oDBNFORN)

oDBFORNE := DataColumn{PADRAO_CHAR_40{}}
oDBFORNE:Width := 8
oDBFORNE:HyperLabel := oDCFORNE:HyperLabel 
oDBFORNE:Caption := "Fornecedor:"
self:Browser:AddColumn(oDBFORNE)

oDBAPLICACAO := DataColumn{PADRAO_CHAR_30{}}
oDBAPLICACAO:Width := 9
oDBAPLICACAO:HyperLabel := oDCAPLICACAO:HyperLabel 
oDBAPLICACAO:Caption := "Aplicação"
self:Browser:AddColumn(oDBAPLICACAO)

oDBCERT := DataColumn{PADRAO_CHAR_40{}}
oDBCERT:Width := 8
oDBCERT:HyperLabel := oDCCERT:HyperLabel 
oDBCERT:Caption := "Cert:"
self:Browser:AddColumn(oDBCERT)

oDBINSTRU := DataColumn{PADRAO_CHAR_40{}}
oDBINSTRU:Width := 8
oDBINSTRU:HyperLabel := oDCINSTRU:HyperLabel 
oDBINSTRU:Caption := "Instru:"
self:Browser:AddColumn(oDBINSTRU)

oDBQTDE := DataColumn{PADRAO_NUM_12_3{}}
oDBQTDE:Width := 6
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
self:Browser:AddColumn(oDBQTDE)

oDBUNID := DataColumn{PADRAO_CHAR_04{}}
oDBUNID:Width := 6
oDBUNID:HyperLabel := oDCUNID:HyperLabel 
oDBUNID:Caption := "Und"
self:Browser:AddColumn(oDBUNID)

oDBRASTRO := DataColumn{padrao_chAR_12{}}
oDBRASTRO:Width := 8
oDBRASTRO:HyperLabel := oDCRASTRO:HyperLabel 
oDBRASTRO:Caption := "Rastro:"
self:Browser:AddColumn(oDBRASTRO)

oDBPEDIDO := DataColumn{PADRAO_CHAR_20{}}
oDBPEDIDO:Width := 8
oDBPEDIDO:HyperLabel := oDCPEDIDO:HyperLabel 
oDBPEDIDO:Caption := "Pedido:"
self:Browser:AddColumn(oDBPEDIDO)

oDBNRNOTA := DataColumn{PADRAO_NUM_08{}}
oDBNRNOTA:Width := 8
oDBNRNOTA:HyperLabel := oDCNRNOTA:HyperLabel 
oDBNRNOTA:Caption := "Nrnota:"
self:Browser:AddColumn(oDBNRNOTA)


self:ViewAs(#FormView)

oSFJRIMI := JRIMI{self,JRIRM_JRIMI}
oSFJRIMI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access INSP() 
return self:FieldGet(#INSP)


assign INSP(uValue) 
self:FieldPut(#INSP, uValue)
return INSP := uValue


access INSTRU() 
return self:FieldGet(#INSTRU)


assign INSTRU(uValue) 
self:FieldPut(#INSTRU, uValue)
return INSTRU := uValue


access LAUDOF() 
return self:FieldGet(#LAUDOF)


assign LAUDOF(uValue) 
self:FieldPut(#LAUDOF, uValue)
return LAUDOF := uValue


access NFORN() 
return self:FieldGet(#NFORN)


assign NFORN(uValue) 
self:FieldPut(#NFORN, uValue)
return NFORN := uValue


access nQTDE() 
return self:FieldGet(#nQTDE)


assign nQTDE(uValue) 
self:FieldPut(#nQTDE, uValue)
return nQTDE := uValue


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


access OBS01() 
return self:FieldGet(#OBS01)


assign OBS01(uValue) 
self:FieldPut(#OBS01, uValue)
return OBS01 := uValue


access OBS02() 
return self:FieldGet(#OBS02)


assign OBS02(uValue) 
self:FieldPut(#OBS02, uValue)
return OBS02 := uValue


access OBS03() 
return self:FieldGet(#OBS03)


assign OBS03(uValue) 
self:FieldPut(#OBS03, uValue)
return OBS03 := uValue


access OBS04() 
return self:FieldGet(#OBS04)


assign OBS04(uValue) 
self:FieldPut(#OBS04, uValue)
return OBS04 := uValue


access PEDIDO() 
return self:FieldGet(#PEDIDO)


assign PEDIDO(uValue) 
self:FieldPut(#PEDIDO, uValue)
return PEDIDO := uValue


access QTAMO() 
return self:FieldGet(#QTAMO)


assign QTAMO(uValue) 
self:FieldPut(#QTAMO, uValue)
return QTAMO := uValue


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


access RESPO() 
return self:FieldGet(#RESPO)


assign RESPO(uValue) 
self:FieldPut(#RESPO, uValue)
return RESPO := uValue


access RIRM() 
return self:FieldGet(#RIRM)


assign RIRM(uValue) 
self:FieldPut(#RIRM, uValue)
return RIRM := uValue


access TIPOENT() 
return self:FieldGet(#TIPOENT)


assign TIPOENT(uValue) 
self:FieldPut(#TIPOENT, uValue)
return TIPOENT := uValue


access UNID() 
return self:FieldGet(#UNID)


assign UNID(uValue) 
self:FieldPut(#UNID, uValue)
return UNID := uValue


END CLASS
