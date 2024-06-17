#region DEFINES
STATIC DEFINE JRIST_APLICACAO := 132 
STATIC DEFINE JRIST_AREA := 164 
STATIC DEFINE JRIST_BUSCARIST := 172 
STATIC DEFINE JRIST_CARGO := 162 
STATIC DEFINE JRIST_CERT := 125 
STATIC DEFINE JRIST_CHKCLI := 168 
STATIC DEFINE JRIST_CHKENS := 187 
STATIC DEFINE JRIST_CHKTIPO := 185 
STATIC DEFINE JRIST_CLASSI := 151 
STATIC DEFINE JRIST_CLIENTE := 134 
STATIC DEFINE JRIST_CLOTECRT := 149 
STATIC DEFINE JRIST_CMDBOBINA := 190 
STATIC DEFINE JRIST_CMDCERT := 182 
STATIC DEFINE JRIST_CMDENVIO := 181 
STATIC DEFINE JRIST_CMDINICIA := 189 
STATIC DEFINE JRIST_CODIGO := 130 
STATIC DEFINE JRIST_CONTIG := 174 
STATIC DEFINE JRIST_CORPO := 126 
STATIC DEFINE JRIST_CRIAITENS := 175 
STATIC DEFINE JRIST_CRM := 154 
STATIC DEFINE JRIST_DATA := 180 
STATIC DEFINE JRIST_DATAL := 158 
STATIC DEFINE JRIST_DATANF := 153 
STATIC DEFINE JRIST_DENO := 131 
STATIC DEFINE JRIST_DIGAPL := 176 
STATIC DEFINE JRIST_DIGAPL1 := 193 
STATIC DEFINE JRIST_DIGCOD := 178 
STATIC DEFINE JRIST_DIGDES := 177 
STATIC DEFINE JRIST_EDITAR := 147 
STATIC DEFINE JRIST_ETIQIDENT := 192 
STATIC DEFINE JRIST_ETIQLAB := 179 
STATIC DEFINE JRIST_ETIQMAT := 191 
STATIC DEFINE JRIST_FORNE := 122 
STATIC DEFINE JRIST_FOTO := 184 
STATIC DEFINE JRIST_FT13 := 150 
STATIC DEFINE JRIST_FT14 := 155 
STATIC DEFINE JRIST_FT15 := 161 
STATIC DEFINE JRIST_FT16 := 114 
STATIC DEFINE JRIST_FT17 := 159 
STATIC DEFINE JRIST_FT20 := 108 
STATIC DEFINE JRIST_GB1 := 143 
STATIC DEFINE JRIST_INSP := 136 
STATIC DEFINE JRIST_JRISTI := 124 
STATIC DEFINE JRIST_LAUDO := 148 
STATIC DEFINE JRIST_LAUDOF := 160 
STATIC DEFINE JRIST_LOTE := 129 
STATIC DEFINE JRIST_NCLI := 133 
STATIC DEFINE JRIST_NF := 123 
STATIC DEFINE JRIST_NFB := 152 
STATIC DEFINE JRIST_NFORN := 121 
STATIC DEFINE JRIST_NIVEL := 140 
STATIC DEFINE JRIST_OBS01 := 144 
STATIC DEFINE JRIST_OBS02 := 145 
STATIC DEFINE JRIST_OS := 135 
STATIC DEFINE JRIST_PEGAMOSTRA := 169 
STATIC DEFINE JRIST_PEGCLA := 188 
STATIC DEFINE JRIST_PEGTIPTRA := 173 
STATIC DEFINE JRIST_QTAMO := 141 
STATIC DEFINE JRIST_QTDE := 170 
STATIC DEFINE JRIST_RASTRO := 116 
STATIC DEFINE JRIST_RB1 := 118 
STATIC DEFINE JRIST_RB2 := 119 
STATIC DEFINE JRIST_RB3 := 120 
STATIC DEFINE JRIST_RB4 := 137 
STATIC DEFINE JRIST_RB5 := 138 
STATIC DEFINE JRIST_RB6 := 139 
STATIC DEFINE JRIST_RB7 := 127 
STATIC DEFINE JRIST_RB8 := 128 
STATIC DEFINE JRIST_RC := 156 
STATIC DEFINE JRIST_RESPO := 163 
STATIC DEFINE JRIST_RIST := 115 
STATIC DEFINE JRIST_SC_CERT := 109 
STATIC DEFINE JRIST_SC_CLIENTE := 110 
STATIC DEFINE JRIST_SC_CODIGO := 106 
STATIC DEFINE JRIST_SC_CORPO := 136 
STATIC DEFINE JRIST_SC_DATA := 102 
STATIC DEFINE JRIST_SC_DATANF := 105 
STATIC DEFINE JRIST_SC_DENO := 107 
STATIC DEFINE JRIST_SC_DESTINO2 := 183 
STATIC DEFINE JRIST_SC_FORNE := 103 
STATIC DEFINE JRIST_SC_INSP := 130 
STATIC DEFINE JRIST_SC_LAUDOF := 138 
STATIC DEFINE JRIST_SC_NF := 104 
STATIC DEFINE JRIST_SC_NIVEL := 112 
STATIC DEFINE JRIST_SC_OBS01 := 140 
STATIC DEFINE JRIST_SC_OBS02 := 142 
STATIC DEFINE JRIST_SC_OBS03 := 144 
STATIC DEFINE JRIST_SC_OS := 111 
STATIC DEFINE JRIST_SC_QTAMO := 113 
STATIC DEFINE JRIST_SC_QTDE := 171 
STATIC DEFINE JRIST_SC_QTDE1 := 167 
STATIC DEFINE JRIST_SC_RASTRO := 101 
STATIC DEFINE JRIST_SC_RIST := 100 
STATIC DEFINE JRIST_SUBCHKTIP := 186 
STATIC DEFINE JRIST_TABULAR := 146 
STATIC DEFINE JRIST_THEFIXEDTEXT13 := 166 
STATIC DEFINE JRIST_THEFIXEDTEXT14 := 165 
STATIC DEFINE JRIST_TIPO := 117 
STATIC DEFINE JRIST_TL := 157 
STATIC DEFINE JRIST_UNID := 142 
#endregion

class JRIST inherit MYDataWindow 

	PROTECT oDBRIST as DataColumn
	PROTECT oDBRASTRO as DataColumn
	PROTECT oDBLOTE as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDENO as DataColumn
	PROTECT oDBAPLICACAO as DataColumn
	protect oDCSC_RIST as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_FORNE as FIXEDTEXT
	protect oDCSC_NF as FIXEDTEXT
	protect oDCSC_DATANF as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_DENO as FIXEDTEXT
	protect oDCFT20 as FIXEDTEXT
	protect oDCSC_CERT as FIXEDTEXT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCSC_OS as FIXEDTEXT
	protect oDCSC_NIVEL as FIXEDTEXT
	protect oDCSC_QTAMO as FIXEDTEXT
	protect oDCFT16 as FIXEDTEXT
	protect oDCRIST as SINGLELINEEDIT
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCTIPO as RADIOBUTTONGROUP
	protect oCCRB1 as RADIOBUTTON
	protect oCCRB2 as RADIOBUTTON
	protect oCCRB3 as RADIOBUTTON
	protect oDCNFORN as SINGLELINEEDIT
	protect oDCFORNE as SINGLELINEEDIT
	protect oDCNF as SINGLELINEEDIT
	protect oDCCERT as SINGLELINEEDIT
	protect oDCCORPO as RADIOBUTTONGROUP
	protect oCCRB7 as RADIOBUTTON
	protect oCCRB8 as RADIOBUTTON
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCDENO as SINGLELINEEDIT
	protect oDCAPLICACAO as SINGLELINEEDIT
	protect oDCNCLI as SINGLELINEEDIT
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCOS as SINGLELINEEDIT
	protect oDCINSP as RADIOBUTTONGROUP
	protect oCCRB4 as RADIOBUTTON
	protect oCCRB5 as RADIOBUTTON
	protect oCCRB6 as RADIOBUTTON
	protect oDCNIVEL as SINGLELINEEDIT
	protect oDCQTAMO as RIGHTSLE
	protect oDCUNID as SINGLELINEEDIT
	protect oDCGB1 as GROUPBOX
	protect oDCOBS01 as SINGLELINEEDIT
	protect oDCOBS02 as SINGLELINEEDIT
	protect oCCTabular as PUSHBUTTON
	protect oCCEditar as PUSHBUTTON
	protect oCCLaudo as PUSHBUTTON
	protect oDCCLOTECRT as SINGLELINEEDIT
	protect oDCFT13 as FIXEDTEXT
	protect oDCCLASSI as SINGLELINEEDIT
	protect oDCNFB as SINGLELINEEDIT
	protect oDCDATANF as SINGLELINEEDIT
	protect oDCCRM as SINGLELINEEDIT
	protect oDCFT14 as FIXEDTEXT
	protect oCCRC as PUSHBUTTON
	protect oCCTL as PUSHBUTTON
	protect oDCDATAL as SINGLELINEEDIT
	protect oDCFT17 as FIXEDTEXT
	protect oDCLAUDOF as SINGLELINEEDIT
	protect oDCFT15 as FIXEDTEXT
	protect oDCCARGO as SINGLELINEEDIT
	protect oDCRESPO as SINGLELINEEDIT
	protect oDCAREA as SINGLELINEEDIT
	protect oDCtheFixedText14 as FIXEDTEXT
	protect oDCtheFixedText13 as FIXEDTEXT
	protect oDCSC_QTDE1 as FIXEDTEXT
	protect oCCchkcli as PUSHBUTTON
	protect oCCpegamostra as PUSHBUTTON
	protect oDCQTDE as SINGLELINEEDIT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oCCbuscarist as PUSHBUTTON
	protect oCCPEGTIPTRA as PUSHBUTTON
	protect oDCCONTIG as CHECKBOX
	protect oCCcriaitens as PUSHBUTTON
	protect oCCdigapl as PUSHBUTTON
	protect oCCdigdes as PUSHBUTTON
	protect oCCdigcod as PUSHBUTTON
	protect oCCetiqlab as PUSHBUTTON
	protect oDCDATA as SINGLELINEEDIT
	protect oCCcmdEnvio as PUSHBUTTON
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
	protect oCCdigapl1 as PUSHBUTTON
// 	instance RIST 
// 	instance RASTRO 
// 	instance TIPO 
// 	instance NFORN 
// 	instance FORNE 
// 	instance NF 
// 	instance CERT 
// 	instance CORPO 
// 	instance LOTE 
// 	instance CODIGO 
// 	instance DENO 
// 	instance APLICACAO 
// 	instance NCLI 
// 	instance CLIENTE 
// 	instance OS 
// 	instance INSP 
// 	instance NIVEL 
// 	instance QTAMO 
// 	instance UNID 
// 	instance OBS01 
// 	instance OBS02 
// 	instance CLOTECRT 
// 	instance CLASSI 
// 	instance NFB 
// 	instance DATANF 
// 	instance CRM 
// 	instance DATAL 
// 	instance LAUDOF 
// 	instance CARGO 
// 	instance RESPO 
// 	instance AREA 
// 	instance QTDE 
// 	instance CONTIG 
// 	instance DATA 
	protect oSFJRISTI as JRISTI

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


access CLIENTE() 
return self:FieldGet(#CLIENTE)


assign CLIENTE(uValue) 
self:FieldPut(#CLIENTE, uValue)
return CLIENTE := uValue


access CLOTECRT() 
return self:FieldGet(#CLOTECRT)


assign CLOTECRT(uValue) 
self:FieldPut(#CLOTECRT, uValue)
return CLOTECRT := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CONTIG() 
return self:FieldGet(#CONTIG)


assign CONTIG(uValue) 
self:FieldPut(#CONTIG, uValue)
return CONTIG := uValue


access CORPO() 
return self:FieldGet(#CORPO)


assign CORPO(uValue) 
self:FieldPut(#CORPO, uValue)
return CORPO := uValue


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


access DATANF() 
return self:FieldGet(#DATANF)


assign DATANF(uValue) 
self:FieldPut(#DATANF, uValue)
return DATANF := uValue


access DENO() 
return self:FieldGet(#DENO)


assign DENO(uValue) 
self:FieldPut(#DENO, uValue)
return DENO := uValue


access FORNE() 
return self:FieldGet(#FORNE)


assign FORNE(uValue) 
self:FieldPut(#FORNE, uValue)
return FORNE := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRIST",_GetInst()},iCtlID)

oDCSC_RIST := FixedText{self,ResourceID{JRIST_SC_RIST,_GetInst()}}
oDCSC_RIST:HyperLabel := HyperLabel{#SC_RIST,"RIST No.",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{JRIST_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JRIST_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_FORNE := FixedText{self,ResourceID{JRIST_SC_FORNE,_GetInst()}}
oDCSC_FORNE:HyperLabel := HyperLabel{#SC_FORNE,"Fornecedor:",NULL_STRING,NULL_STRING}

oDCSC_NF := FixedText{self,ResourceID{JRIST_SC_NF,_GetInst()}}
oDCSC_NF:HyperLabel := HyperLabel{#SC_NF,"Nota Fiscal",NULL_STRING,NULL_STRING}

oDCSC_DATANF := FixedText{self,ResourceID{JRIST_SC_DATANF,_GetInst()}}
oDCSC_DATANF:HyperLabel := HyperLabel{#SC_DATANF,"Data NF.",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JRIST_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Código:",NULL_STRING,NULL_STRING}

oDCSC_DENO := FixedText{self,ResourceID{JRIST_SC_DENO,_GetInst()}}
oDCSC_DENO:HyperLabel := HyperLabel{#SC_DENO,"Denominação:",NULL_STRING,NULL_STRING}

oDCFT20 := FixedText{self,ResourceID{JRIST_FT20,_GetInst()}}
oDCFT20:HyperLabel := HyperLabel{#FT20,"Aplicação",NULL_STRING,NULL_STRING}

oDCSC_CERT := FixedText{self,ResourceID{JRIST_SC_CERT,_GetInst()}}
oDCSC_CERT:HyperLabel := HyperLabel{#SC_CERT,"Certificado",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{JRIST_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCSC_OS := FixedText{self,ResourceID{JRIST_SC_OS,_GetInst()}}
oDCSC_OS:HyperLabel := HyperLabel{#SC_OS,"Pedido",NULL_STRING,NULL_STRING}

oDCSC_NIVEL := FixedText{self,ResourceID{JRIST_SC_NIVEL,_GetInst()}}
oDCSC_NIVEL:HyperLabel := HyperLabel{#SC_NIVEL,"Nivel:",NULL_STRING,NULL_STRING}

oDCSC_QTAMO := FixedText{self,ResourceID{JRIST_SC_QTAMO,_GetInst()}}
oDCSC_QTAMO:HyperLabel := HyperLabel{#SC_QTAMO,"Qtde. Amostra",NULL_STRING,NULL_STRING}

oDCFT16 := FixedText{self,ResourceID{JRIST_FT16,_GetInst()}}
oDCFT16:HyperLabel := HyperLabel{#FT16,"Unidade",NULL_STRING,NULL_STRING}

oDCRIST := SingleLineEdit{self,ResourceID{JRIST_RIST,_GetInst()}}
oDCRIST:FieldSpec := PADRAO_NUM_08{}
oDCRIST:HyperLabel := HyperLabel{#RIST,"Rist:",NULL_STRING,"RIST_RIST"}

oDCRASTRO := SingleLineEdit{self,ResourceID{JRIST_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := padrao_char_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"RIST_RASTRO"}

oCCRB1 := RadioButton{self,ResourceID{JRIST_RB1,_GetInst()}}
oCCRB1:HyperLabel := HyperLabel{#RB1,"Trat.Termico",NULL_STRING,NULL_STRING}

oCCRB2 := RadioButton{self,ResourceID{JRIST_RB2,_GetInst()}}
oCCRB2:HyperLabel := HyperLabel{#RB2,"Trat. Superficial",NULL_STRING,NULL_STRING}

oCCRB3 := RadioButton{self,ResourceID{JRIST_RB3,_GetInst()}}
oCCRB3:HyperLabel := HyperLabel{#RB3,"Mão de Obra",NULL_STRING,NULL_STRING}

oDCNFORN := SingleLineEdit{self,ResourceID{JRIST_NFORN,_GetInst()}}
oDCNFORN:FieldSpec := PADRAO_NUM_08{}
oDCNFORN:HyperLabel := HyperLabel{#NFORN,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFORNE := SingleLineEdit{self,ResourceID{JRIST_FORNE,_GetInst()}}
oDCFORNE:FieldSpec := PADRAO_CHAR_30{}
oDCFORNE:HyperLabel := HyperLabel{#FORNE,"Forne:",NULL_STRING,"RIST_FORNE"}

oDCNF := SingleLineEdit{self,ResourceID{JRIST_NF,_GetInst()}}
oDCNF:FieldSpec := PADRAO_NUM_08{}
oDCNF:HyperLabel := HyperLabel{#NF,"Nf:",NULL_STRING,"RIST_NF"}

oDCCERT := SingleLineEdit{self,ResourceID{JRIST_CERT,_GetInst()}}
oDCCERT:FieldSpec := PADRAO_CHAR_40{}
oDCCERT:HyperLabel := HyperLabel{#CERT,"Cert:",NULL_STRING,"RIST_CERT"}

oCCRB7 := RadioButton{self,ResourceID{JRIST_RB7,_GetInst()}}
oCCRB7:HyperLabel := HyperLabel{#RB7,"Sim",NULL_STRING,NULL_STRING}

oCCRB8 := RadioButton{self,ResourceID{JRIST_RB8,_GetInst()}}
oCCRB8:HyperLabel := HyperLabel{#RB8,"Não",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JRIST_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"RIST_CODIGO"}

oDCDENO := SingleLineEdit{self,ResourceID{JRIST_DENO,_GetInst()}}
oDCDENO:FieldSpec := PADRAO_CHAR_40{}
oDCDENO:HyperLabel := HyperLabel{#DENO,"Deno:",NULL_STRING,"RIST_DENO"}

oDCAPLICACAO := SingleLineEdit{self,ResourceID{JRIST_APLICACAO,_GetInst()}}
oDCAPLICACAO:FieldSpec := PADRAO_CHAR_25{}
oDCAPLICACAO:HyperLabel := HyperLabel{#APLICACAO,"Aplicacao",NULL_STRING,NULL_STRING}
oDCAPLICACAO:FocusSelect := FSEL_ALL

oDCNCLI := SingleLineEdit{self,ResourceID{JRIST_NCLI,_GetInst()}}
oDCNCLI:FieldSpec := PADRAO_NUM_08{}
oDCNCLI:HyperLabel := HyperLabel{#NCLI,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCLIENTE := SingleLineEdit{self,ResourceID{JRIST_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_CHAR_30{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"RIST_CLIENTE"}

oDCOS := SingleLineEdit{self,ResourceID{JRIST_OS,_GetInst()}}
oDCOS:FieldSpec := PADRAO_CHAR_18{}
oDCOS:HyperLabel := HyperLabel{#OS,"Os:",NULL_STRING,"RIST_OS"}

oCCRB4 := RadioButton{self,ResourceID{JRIST_RB4,_GetInst()}}
oCCRB4:HyperLabel := HyperLabel{#RB4,"INII",NULL_STRING,NULL_STRING}

oCCRB5 := RadioButton{self,ResourceID{JRIST_RB5,_GetInst()}}
oCCRB5:HyperLabel := HyperLabel{#RB5,"ISIII",NULL_STRING,NULL_STRING}

oCCRB6 := RadioButton{self,ResourceID{JRIST_RB6,_GetInst()}}
oCCRB6:HyperLabel := HyperLabel{#RB6,"IV",NULL_STRING,NULL_STRING}

oDCNIVEL := SingleLineEdit{self,ResourceID{JRIST_NIVEL,_GetInst()}}
oDCNIVEL:FieldSpec := PADRAO_CHAR_05{}
oDCNIVEL:HyperLabel := HyperLabel{#NIVEL,"Nivel:",NULL_STRING,"RIST_NIVEL"}

oDCQTAMO := rightSle{self,ResourceID{JRIST_QTAMO,_GetInst()}}
oDCQTAMO:FieldSpec := PADRAO_NUM_05{}
oDCQTAMO:HyperLabel := HyperLabel{#QTAMO,"Qtamo:",NULL_STRING,"RIST_QTAMO"}

oDCUNID := SingleLineEdit{self,ResourceID{JRIST_UNID,_GetInst()}}
oDCUNID:HyperLabel := HyperLabel{#UNID,"UNID",NULL_STRING,NULL_STRING}
oDCUNID:FieldSpec := PADRAO_CHAR_04{}

oDCGB1 := GroupBox{self,ResourceID{JRIST_GB1,_GetInst()}}
oDCGB1:HyperLabel := HyperLabel{#GB1,"Observações",NULL_STRING,NULL_STRING}

oDCOBS01 := SingleLineEdit{self,ResourceID{JRIST_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := PADRAO_CHAR_80{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Obs01:",NULL_STRING,"RIST_OBS01"}

oDCOBS02 := SingleLineEdit{self,ResourceID{JRIST_OBS02,_GetInst()}}
oDCOBS02:FieldSpec := PADRAO_CHAR_80{}
oDCOBS02:HyperLabel := HyperLabel{#OBS02,"Obs02:",NULL_STRING,"RIST_OBS02"}

oCCTabular := PushButton{self,ResourceID{JRIST_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Ver Itens",NULL_STRING,NULL_STRING}

oCCEditar := PushButton{self,ResourceID{JRIST_EDITAR,_GetInst()}}
oCCEditar:HyperLabel := HyperLabel{#Editar,"Editar Item",NULL_STRING,NULL_STRING}

oCCLaudo := PushButton{self,ResourceID{JRIST_LAUDO,_GetInst()}}
oCCLaudo:HyperLabel := HyperLabel{#Laudo,"Laudo",NULL_STRING,NULL_STRING}

oDCCLOTECRT := SingleLineEdit{self,ResourceID{JRIST_CLOTECRT,_GetInst()}}
oDCCLOTECRT:FieldSpec := PADRAO_CHAR_01{}
oDCCLOTECRT:HyperLabel := HyperLabel{#CLOTECRT,"Und",NULL_STRING,NULL_STRING}

oDCFT13 := FixedText{self,ResourceID{JRIST_FT13,_GetInst()}}
oDCFT13:HyperLabel := HyperLabel{#FT13,"Lote/CR",NULL_STRING,NULL_STRING}

oDCCLASSI := SingleLineEdit{self,ResourceID{JRIST_CLASSI,_GetInst()}}
oDCCLASSI:FieldSpec := PADRAO_CHAR_01{}
oDCCLASSI:HyperLabel := HyperLabel{#CLASSI,"Classi:",NULL_STRING,"Rist_CLASSI"}

oDCNFB := SingleLineEdit{self,ResourceID{JRIST_NFB,_GetInst()}}
oDCNFB:FieldSpec := PADRAO_NUM_08{}
oDCNFB:HyperLabel := HyperLabel{#NFB,"Nf:",NULL_STRING,"RIST_NF"}

oDCDATANF := SingleLineEdit{self,ResourceID{JRIST_DATANF,_GetInst()}}
oDCDATANF:FieldSpec := DATE_FIELD{}
oDCDATANF:HyperLabel := HyperLabel{#DATANF,"Nf:",NULL_STRING,"RIST_NF"}

oDCCRM := SingleLineEdit{self,ResourceID{JRIST_CRM,_GetInst()}}
oDCCRM:FieldSpec := PADRAO_NUM_08{}
oDCCRM:HyperLabel := HyperLabel{#CRM,"Und",NULL_STRING,NULL_STRING}

oDCFT14 := FixedText{self,ResourceID{JRIST_FT14,_GetInst()}}
oDCFT14:HyperLabel := HyperLabel{#FT14,"CRM",NULL_STRING,NULL_STRING}

oCCRC := PushButton{self,ResourceID{JRIST_RC,_GetInst()}}
oCCRC:HyperLabel := HyperLabel{#RC,"Rastro/Cert",NULL_STRING,NULL_STRING}

oCCTL := PushButton{self,ResourceID{JRIST_TL,_GetInst()}}
oCCTL:HyperLabel := HyperLabel{#TL,"Laudo",NULL_STRING,NULL_STRING}

oDCDATAL := SingleLineEdit{self,ResourceID{JRIST_DATAL,_GetInst()}}
oDCDATAL:FieldSpec := DATE_FIELD{}
oDCDATAL:HyperLabel := HyperLabel{#DATAL,"Und",NULL_STRING,NULL_STRING}

oDCFT17 := FixedText{self,ResourceID{JRIST_FT17,_GetInst()}}
oDCFT17:HyperLabel := HyperLabel{#FT17,"Em",NULL_STRING,NULL_STRING}

oDCLAUDOF := SingleLineEdit{self,ResourceID{JRIST_LAUDOF,_GetInst()}}
oDCLAUDOF:FieldSpec := PADRAO_CHAR_01{}
oDCLAUDOF:HyperLabel := HyperLabel{#LAUDOF,"Und",NULL_STRING,NULL_STRING}

oDCFT15 := FixedText{self,ResourceID{JRIST_FT15,_GetInst()}}
oDCFT15:HyperLabel := HyperLabel{#FT15,"Laudo",NULL_STRING,NULL_STRING}

oDCCARGO := SingleLineEdit{self,ResourceID{JRIST_CARGO,_GetInst()}}
oDCCARGO:FieldSpec := PADRAO_CHAR_40{}
oDCCARGO:HyperLabel := HyperLabel{#CARGO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCRESPO := SingleLineEdit{self,ResourceID{JRIST_RESPO,_GetInst()}}
oDCRESPO:FieldSpec := PADRAO_CHAR_40{}
oDCRESPO:HyperLabel := HyperLabel{#RESPO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCAREA := SingleLineEdit{self,ResourceID{JRIST_AREA,_GetInst()}}
oDCAREA:FieldSpec := PADRAO_CHAR_02{}
oDCAREA:HyperLabel := HyperLabel{#AREA,"AREA",NULL_STRING,"RIRM_NRNOTA"}

oDCtheFixedText14 := FixedText{self,ResourceID{JRIST_THEFIXEDTEXT14,_GetInst()}}
oDCtheFixedText14:HyperLabel := HyperLabel{#theFixedText14,"Cargo:",NULL_STRING,NULL_STRING}

oDCtheFixedText13 := FixedText{self,ResourceID{JRIST_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Responsável:",NULL_STRING,NULL_STRING}

oDCSC_QTDE1 := FixedText{self,ResourceID{JRIST_SC_QTDE1,_GetInst()}}
oDCSC_QTDE1:HyperLabel := HyperLabel{#SC_QTDE1,"Area",NULL_STRING,NULL_STRING}

oCCchkcli := PushButton{self,ResourceID{JRIST_CHKCLI,_GetInst()}}
oCCchkcli:HyperLabel := HyperLabel{#chkcli,"...",NULL_STRING,NULL_STRING}

oCCpegamostra := PushButton{self,ResourceID{JRIST_PEGAMOSTRA,_GetInst()}}
oCCpegamostra:HyperLabel := HyperLabel{#pegamostra,"...",NULL_STRING,NULL_STRING}

oDCQTDE := SingleLineEdit{self,ResourceID{JRIST_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := PADRAO_NUM_10_3{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"RIRM_QTDE"}

oDCSC_QTDE := FixedText{self,ResourceID{JRIST_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Quantidade:",NULL_STRING,NULL_STRING}

oCCbuscarist := PushButton{self,ResourceID{JRIST_BUSCARIST,_GetInst()}}
oCCbuscarist:Image := ico_find{}
oCCbuscarist:HyperLabel := HyperLabel{#buscarist,NULL_STRING,NULL_STRING,NULL_STRING}

oCCPEGTIPTRA := PushButton{self,ResourceID{JRIST_PEGTIPTRA,_GetInst()}}
oCCPEGTIPTRA:HyperLabel := HyperLabel{#PEGTIPTRA,"...",NULL_STRING,NULL_STRING}

oDCCONTIG := CheckBox{self,ResourceID{JRIST_CONTIG,_GetInst()}}
oDCCONTIG:HyperLabel := HyperLabel{#CONTIG,"Contigencia",NULL_STRING,"Rist_CONTIG"}
oDCCONTIG:FieldSpec := LOGIC_FIELD{}

oCCcriaitens := PushButton{self,ResourceID{JRIST_CRIAITENS,_GetInst()}}
oCCcriaitens:HyperLabel := HyperLabel{#criaitens,"criaitens",NULL_STRING,NULL_STRING}

oCCdigapl := PushButton{self,ResourceID{JRIST_DIGAPL,_GetInst()}}
oCCdigapl:HyperLabel := HyperLabel{#digapl,"E.",NULL_STRING,NULL_STRING}
oCCdigapl:TooltipText := "Preencher a Aplicacao"

oCCdigdes := PushButton{self,ResourceID{JRIST_DIGDES,_GetInst()}}
oCCdigdes:HyperLabel := HyperLabel{#digdes,"...",NULL_STRING,NULL_STRING}

oCCdigcod := PushButton{self,ResourceID{JRIST_DIGCOD,_GetInst()}}
oCCdigcod:HyperLabel := HyperLabel{#digcod,"...",NULL_STRING,NULL_STRING}

oCCetiqlab := PushButton{self,ResourceID{JRIST_ETIQLAB,_GetInst()}}
oCCetiqlab:HyperLabel := HyperLabel{#etiqlab,"Etiq.Lab.",NULL_STRING,NULL_STRING}
oCCetiqlab:TooltipText := "Imprimir Etiqueta de Laboratorio"

oDCDATA := SingleLineEdit{self,ResourceID{JRIST_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Und",NULL_STRING,NULL_STRING}

oCCcmdEnvio := PushButton{self,ResourceID{JRIST_CMDENVIO,_GetInst()}}
oCCcmdEnvio:HyperLabel := HyperLabel{#cmdEnvio,"DataEnvio",NULL_STRING,NULL_STRING}

oCCcmdcert := PushButton{self,ResourceID{JRIST_CMDCERT,_GetInst()}}
oCCcmdcert:HyperLabel := HyperLabel{#cmdcert,"Conforme Certificado",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JRIST_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JRIST_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oCCCHKTIPO := PushButton{self,ResourceID{JRIST_CHKTIPO,_GetInst()}}
oCCCHKTIPO:HyperLabel := HyperLabel{#CHKTIPO,"Checar Tipo Todos Rist",NULL_STRING,NULL_STRING}

oCCsubchktip := PushButton{self,ResourceID{JRIST_SUBCHKTIP,_GetInst()}}
oCCsubchktip:HyperLabel := HyperLabel{#subchktip,"Checar Tipos",NULL_STRING,NULL_STRING}

oCCCHKens := PushButton{self,ResourceID{JRIST_CHKENS,_GetInst()}}
oCCCHKens:HyperLabel := HyperLabel{#CHKens,"Checar Ensaios 2004",NULL_STRING,NULL_STRING}

oCCpegcla := PushButton{self,ResourceID{JRIST_PEGCLA,_GetInst()}}
oCCpegcla:HyperLabel := HyperLabel{#pegcla,"...",NULL_STRING,NULL_STRING}
oCCpegcla:TooltipText := "Pegar a Classificacao do Fornecedor"

oCCcmdinicia := PushButton{self,ResourceID{JRIST_CMDINICIA,_GetInst()}}
oCCcmdinicia:HyperLabel := HyperLabel{#cmdinicia,"Iniciar Preenchimento",NULL_STRING,NULL_STRING}

oCCcmdbobina := PushButton{self,ResourceID{JRIST_CMDBOBINA,_GetInst()}}
oCCcmdbobina:HyperLabel := HyperLabel{#cmdbobina,"Executa Liberacao da Bobina",NULL_STRING,NULL_STRING}

oCCetiqmat := PushButton{self,ResourceID{JRIST_ETIQMAT,_GetInst()}}
oCCetiqmat:HyperLabel := HyperLabel{#etiqmat,"Etiq.Mat.Apr.",NULL_STRING,NULL_STRING}
oCCetiqmat:TooltipText := "Imprimir Etiqueta Material Aprovado"

oCCetiqIdent := PushButton{self,ResourceID{JRIST_ETIQIDENT,_GetInst()}}
oCCetiqIdent:HyperLabel := HyperLabel{#etiqIdent,"Etiq.Ident.",NULL_STRING,NULL_STRING}
oCCetiqIdent:TooltipText := "Imprimir Etiqueta Material Aprovado"

oCCdigapl1 := PushButton{self,ResourceID{JRIST_DIGAPL1,_GetInst()}}
oCCdigapl1:HyperLabel := HyperLabel{#digapl1,"...",NULL_STRING,NULL_STRING}
oCCdigapl1:TooltipText := "Escolher a Aplicacao"

oDCTIPO := RadioButtonGroup{self,ResourceID{JRIST_TIPO,_GetInst()}}
oDCTIPO:FillUsing({ ;
					{oCCRB1,"T"}, ;
					{oCCRB2,"S"}, ;
					{oCCRB3,"O"} ;
					})
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo",NULL_STRING,NULL_STRING}
oDCTIPO:FieldSpec := PADRAO_CHAR_01{}

oDCCORPO := RadioButtonGroup{self,ResourceID{JRIST_CORPO,_GetInst()}}
oDCCORPO:FillUsing({ ;
						{oCCRB7,"S"}, ;
						{oCCRB8,"N"} ;
						})
oDCCORPO:HyperLabel := HyperLabel{#CORPO,"Corpo de Prova",NULL_STRING,NULL_STRING}
oDCCORPO:FieldSpec := PADRAO_CHAR_01{}

oDCINSP := RadioButtonGroup{self,ResourceID{JRIST_INSP,_GetInst()}}
oDCINSP:FillUsing({ ;
					{oCCRB4,"A"}, ;
					{oCCRB5,"B"}, ;
					{oCCRB6,"C"} ;
					})
oDCINSP:HyperLabel := HyperLabel{#INSP,"Tipo de Inspeção",NULL_STRING,NULL_STRING}
oDCINSP:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "Rist"
self:HyperLabel := HyperLabel{#JRIST,"Rist",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRIST := DataColumn{PADRAO_NUM_08{}}
oDBRIST:Width := 6
oDBRIST:HyperLabel := oDCRIST:HyperLabel 
oDBRIST:Caption := "Rist:"
self:Browser:AddColumn(oDBRIST)

oDBRASTRO := DataColumn{padrao_char_12{}}
oDBRASTRO:Width := 8
oDBRASTRO:HyperLabel := oDCRASTRO:HyperLabel 
oDBRASTRO:Caption := "Rastro:"
self:Browser:AddColumn(oDBRASTRO)

oDBLOTE := DataColumn{PADRAO_NUM_08{}}
oDBLOTE:Width := 6
oDBLOTE:HyperLabel := HyperLabel{#LOTE,"Lote:",NULL_STRING,"RIST_LOTE"} 
oDBLOTE:Caption := "Lote:"
self:Browser:AddColumn(oDBLOTE)

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBDENO := DataColumn{PADRAO_CHAR_40{}}
oDBDENO:Width := 9
oDBDENO:HyperLabel := oDCDENO:HyperLabel 
oDBDENO:Caption := "Deno:"
self:Browser:AddColumn(oDBDENO)

oDBAPLICACAO := DataColumn{PADRAO_CHAR_25{}}
oDBAPLICACAO:Width := 18
oDBAPLICACAO:HyperLabel := oDCAPLICACAO:HyperLabel 
oDBAPLICACAO:Caption := "Aplicacao"
self:Browser:AddColumn(oDBAPLICACAO)


self:ViewAs(#FormView)

oSFJRISTI := JRISTI{self,JRIST_JRISTI}
oSFJRISTI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access INSP() 
return self:FieldGet(#INSP)


assign INSP(uValue) 
self:FieldPut(#INSP, uValue)
return INSP := uValue


access LAUDOF() 
return self:FieldGet(#LAUDOF)


assign LAUDOF(uValue) 
self:FieldPut(#LAUDOF, uValue)
return LAUDOF := uValue


access LOTE() 
return self:FieldGet(#LOTE)


assign LOTE(uValue) 
self:FieldPut(#LOTE, uValue)
return LOTE := uValue


access NCLI() 
return self:FieldGet(#NCLI)


assign NCLI(uValue) 
self:FieldPut(#NCLI, uValue)
return NCLI := uValue


access NF() 
return self:FieldGet(#NF)


assign NF(uValue) 
self:FieldPut(#NF, uValue)
return NF := uValue


access NFB() 
return self:FieldGet(#NFB)


assign NFB(uValue) 
self:FieldPut(#NFB, uValue)
return NFB := uValue


access NFORN() 
return self:FieldGet(#NFORN)


assign NFORN(uValue) 
self:FieldPut(#NFORN, uValue)
return NFORN := uValue


access NIVEL() 
return self:FieldGet(#NIVEL)


assign NIVEL(uValue) 
self:FieldPut(#NIVEL, uValue)
return NIVEL := uValue


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


access OS() 
return self:FieldGet(#OS)


assign OS(uValue) 
self:FieldPut(#OS, uValue)
return OS := uValue


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


access RIST() 
return self:FieldGet(#RIST)


assign RIST(uValue) 
self:FieldPut(#RIST, uValue)
return RIST := uValue


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


access UNID() 
return self:FieldGet(#UNID)


assign UNID(uValue) 
self:FieldPut(#UNID, uValue)
return UNID := uValue


END CLASS
