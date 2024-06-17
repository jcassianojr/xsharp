#region DEFINES
STATIC DEFINE JRNCCI_ABRNOM := 106
STATIC DEFINE JRNCCI_ABRNUM := 110
STATIC DEFINE JRNCCI_CANCELAR := 148
STATIC DEFINE JRNCCI_CLIFOR := 112
STATIC DEFINE JRNCCI_CODIGO := 120
STATIC DEFINE JRNCCI_CODRET := 133
STATIC DEFINE JRNCCI_DEC01 := 102
STATIC DEFINE JRNCCI_DEC02 := 101
STATIC DEFINE JRNCCI_DEC03 := 100
STATIC DEFINE JRNCCI_DESCRI := 118
STATIC DEFINE JRNCCI_ESCCOD := 144
STATIC DEFINE JRNCCI_ESCFOR := 109
STATIC DEFINE JRNCCI_ESCRES := 108
STATIC DEFINE JRNCCI_FOTO := 153
STATIC DEFINE JRNCCI_FT26 := 135
STATIC DEFINE JRNCCI_FT27 := 140
STATIC DEFINE JRNCCI_FT28 := 143
STATIC DEFINE JRNCCI_GB1 := 103
STATIC DEFINE JRNCCI_IMPRAT := 141
STATIC DEFINE JRNCCI_NFC := 114
STATIC DEFINE JRNCCI_NOME := 107
STATIC DEFINE JRNCCI_NSAC := 142
STATIC DEFINE JRNCCI_OK := 150
STATIC DEFINE JRNCCI_PEGCLI := 137
STATIC DEFINE JRNCCI_PEGCOD := 138
STATIC DEFINE JRNCCI_PEGMP04 := 136 
STATIC DEFINE JRNCCI_QTL := 145
STATIC DEFINE JRNCCI_QTLN := 104
STATIC DEFINE JRNCCI_RASTRO := 126
STATIC DEFINE JRNCCI_RAT := 139
STATIC DEFINE JRNCCI_RB17 := 122
STATIC DEFINE JRNCCI_RB18 := 123
STATIC DEFINE JRNCCI_RB19 := 132
STATIC DEFINE JRNCCI_RB20 := 131
STATIC DEFINE JRNCCI_RB21 := 151
STATIC DEFINE JRNCCI_RESP := 129
STATIC DEFINE JRNCCI_REVI := 116
STATIC DEFINE JRNCCI_RIC := 127
STATIC DEFINE JRNCCI_SC_CODIGO := 121
STATIC DEFINE JRNCCI_SC_DESCRI := 119
STATIC DEFINE JRNCCI_SC_DESTINO2 := 152
STATIC DEFINE JRNCCI_SC_NFC := 115
STATIC DEFINE JRNCCI_SC_NOME := 113
STATIC DEFINE JRNCCI_SC_QTL2 := 105
STATIC DEFINE JRNCCI_SC_QTL3 := 146
STATIC DEFINE JRNCCI_SC_RASTRO := 125
STATIC DEFINE JRNCCI_SC_RESP := 130
STATIC DEFINE JRNCCI_SC_REVI := 117
STATIC DEFINE JRNCCI_SC_RIC := 128
STATIC DEFINE JRNCCI_SC_SETOR1 := 111
STATIC DEFINE JRNCCI_THEFIXEDTEXT11 := 149
STATIC DEFINE JRNCCI_THEFIXEDTEXT9 := 147
STATIC DEFINE JRNCCI_TIPERR := 124
STATIC DEFINE JRNCCI_UNID := 134
#endregion

PARTIAL CLASS JRNCCI INHERIT DATADIALOG
PROTECT oDCDEC03 AS SINGLELINEEDIT
PROTECT oDCDEC02 AS SINGLELINEEDIT
PROTECT oDCDEC01 AS SINGLELINEEDIT
PROTECT oDCGB1 AS GROUPBOX
PROTECT oDCQTLN AS rightSle
PROTECT oDCSC_QTL2 AS FIXEDTEXT
PROTECT oDCABRNOM AS SINGLELINEEDIT
PROTECT oDCNOME AS SINGLELINEEDIT
PROTECT oCCESCRES AS PUSHBUTTON
PROTECT oCCESCFOR AS PUSHBUTTON
PROTECT oDCABRNUM AS rightSle
PROTECT oDCSC_SETOR1 AS FIXEDTEXT
PROTECT oDCCLIFOR AS rightSle
PROTECT oDCSC_NOME AS FIXEDTEXT
PROTECT oDCNFC AS SINGLELINEEDIT
PROTECT oDCSC_NFC AS FIXEDTEXT
PROTECT oDCREVI AS SINGLELINEEDIT
PROTECT oDCSC_REVI AS FIXEDTEXT
PROTECT oDCDESCRI AS SINGLELINEEDIT
PROTECT oDCSC_DESCRI AS FIXEDTEXT
PROTECT oDCCODIGO AS SINGLELINEEDIT
PROTECT oDCSC_CODIGO AS FIXEDTEXT
PROTECT oCCRB17 AS RADIOBUTTON
PROTECT oCCRB18 AS RADIOBUTTON
PROTECT oDCTIPERR AS RADIOBUTTONGROUP
PROTECT oDCSC_RASTRO AS FIXEDTEXT
PROTECT oDCRASTRO AS SINGLELINEEDIT
PROTECT oDCRIC AS SINGLELINEEDIT
PROTECT oDCSC_RIC AS FIXEDTEXT
PROTECT oDCRESP AS SINGLELINEEDIT
PROTECT oDCSC_RESP AS FIXEDTEXT
PROTECT oCCRB20 AS RADIOBUTTON
PROTECT oCCRB19 AS RADIOBUTTON
PROTECT oDCCODRET AS RADIOBUTTONGROUP
PROTECT oDCUNID AS SINGLELINEEDIT
PROTECT oDCFT26 AS FIXEDTEXT
PROTECT oCCbtnPEGMP04 AS PUSHBUTTON
PROTECT oCCPEGCLI AS PUSHBUTTON
PROTECT oCCPEGCOD AS PUSHBUTTON
PROTECT oDCRAT AS rightSle
PROTECT oDCFT27 AS FIXEDTEXT
PROTECT oCCimprat AS PUSHBUTTON
PROTECT oDCNSAC AS SINGLELINEEDIT
PROTECT oDCFT28 AS FIXEDTEXT
PROTECT oCCesccod AS PUSHBUTTON
PROTECT oDCQTL AS rightSle
PROTECT oDCSC_QTL3 AS FIXEDTEXT
PROTECT oDCtheFixedText9 AS FIXEDTEXT
PROTECT oCCcancelar AS PUSHBUTTON
PROTECT oDCtheFixedText11 AS FIXEDTEXT
PROTECT oCCOK AS PUSHBUTTON
PROTECT oCCRB21 AS RADIOBUTTON
PROTECT oDCSC_DESTINO2 AS FIXEDTEXT
PROTECT oCCfoto AS PUSHBUTTON

// User code starts here (DO NOT remove this line)  ##USER##

ACCESS ABRNOM
RETURN SELF:FieldGet( #ABRNOM )

ASSIGN ABRNOM( uValue )
SELF:FieldPut( #ABRNOM , uValue )

ACCESS ABRNUM
RETURN SELF:FieldGet( #ABRNUM )

ASSIGN ABRNUM( uValue )
SELF:FieldPut( #ABRNUM , uValue )

METHOD Cancelar( ) 
	SELF:endwindow()

ACCESS CLIFOR
RETURN SELF:FieldGet( #CLIFOR )

ASSIGN CLIFOR( uValue )
SELF:FieldPut( #CLIFOR , uValue )

ACCESS CODIGO
RETURN SELF:FieldGet( #CODIGO )

ASSIGN CODIGO( uValue )
SELF:FieldPut( #CODIGO , uValue )

ACCESS CODRET
RETURN SELF:FieldGet( #CODRET )

ASSIGN CODRET( uValue )
SELF:FieldPut( #CODRET , uValue )

ACCESS DEC01
RETURN SELF:FieldGet( #DEC01 )

ASSIGN DEC01( uValue )
SELF:FieldPut( #DEC01 , uValue )

ACCESS DEC02
RETURN SELF:FieldGet( #DEC02 )

ASSIGN DEC02( uValue )
SELF:FieldPut( #DEC02 , uValue )

ACCESS DEC03
RETURN SELF:FieldGet( #DEC03 )

ASSIGN DEC03( uValue )
SELF:FieldPut( #DEC03 , uValue )

ACCESS DESCRI
RETURN SELF:FieldGet( #DESCRI )

ASSIGN DESCRI( uValue )
SELF:FieldPut( #DESCRI , uValue )

METHOD esccod( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF ! IsNil(oESC:CODIGO)
    SELF:CODIGO:=oESC:CODIGO
    SELF:DESCRI:=oESC:NOME
ENDIF	

METHOD ESCFOR( ) 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"MA01.DBF"}
oESC:SHOW()	
IF ! IsNil(oESC:NUMERO)
	SELF:CLIFOR:=oESC:NUMERO
	SELF:NOME:=oESC:NOME
ENDIF	

METHOD ESCRES( ) 
LOCAL oESCMP04 AS XESCMP04
oESCMP04:=XESCMP04{SELF}
IF oESCMP04:LOK
   SELF:ABRNUM:=oESCMP04:NUMERO
   SELF:ABRNOM:=oESCMP04:NOME
ENDIF	

METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:oDCCODIGO:TextValue)," ",""))

IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETURN .f.
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG",cCODIGO}
OFOTOVIEW:SHOW()
		

METHOD imprat( ) 
LOCAL aDAD AS ARRAY
LOCAL oSERVER AS USEREDE	
aDAD:={zCURINI,"RAT.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU SELF
ENDIF		
oSERVER:GOTOP()
IF oSERVER:SEEK(SELF:RAT)
   SELF:CLIFOR:=oSERVER:FIELDGET("CLIENTE")
   SELF:NOME:=oSERVER:FIELDGET("CLINOME")	
ENDIF	
oSERVER:cLOSE()
aDAD:={zCURINI,"RATI.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU SELF
ENDIF		
oSERVER:GOTOP()
oSERVER:SEEK(SELF:RAT)
WHILE SELF:RAT=oSERVER:FIELDGET("RAT") .AND. ! oSERVER:EoF
   IF AllTrim(SELF:CODIGO)=AllTrim(oSERVER:FIELDGET("CODIGO"))	
   	  SELF:QTLN:=OSERVER:FIELDGET("QTDE")
   	  SELF:RASTRO:=OSERVER:FIELDGET("RASTRO")
   	  SELF:DEC01:=OSERVER:FIELDGET("PROB01")
   	  SELF:DEC02:=OSERVER:FIELDGET("PROB02")
   	  SELF:DEC03:=OSERVER:FIELDGET("PROB03")
   	  SELF:RESP:=OSERVER:FIELDGET("RESNOME")
   	  SELF:NSAC:=OSERVER:FIELDGET("SAC")
   ENDIF
   oSERVER:SKIP()	
ENDDO
oSERVER:cLOSE()	
	

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"JRNCCI" , _GetInst()},iCtlID)

	SELF:oDCDEC03 := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_DEC03  , _GetInst() } }
	SELF:oDCDEC03:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCDEC03:HyperLabel := HyperLabel{#DEC03 , "Dec03:" , NULL_STRING , "RNC_DEC03"}

	SELF:oDCDEC02 := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_DEC02  , _GetInst() } }
	SELF:oDCDEC02:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCDEC02:HyperLabel := HyperLabel{#DEC02 , "Dec02:" , NULL_STRING , "RNC_DEC02"}

	SELF:oDCDEC01 := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_DEC01  , _GetInst() } }
	SELF:oDCDEC01:FieldSpec := PADRAO_CHAR_100{}
	SELF:oDCDEC01:HyperLabel := HyperLabel{#DEC01 , "Dec01:" , NULL_STRING , "RNC_DEC01"}

	SELF:oDCGB1 := GROUPBOX{SELF , ResourceID{ JRNCCI_GB1  , _GetInst() } }
	SELF:oDCGB1:HyperLabel := HyperLabel{#GB1 , "Descri��o do Problema" , NULL_STRING , NULL_STRING}

	SELF:oDCQTLN := rightSle{SELF , ResourceID{ JRNCCI_QTLN  , _GetInst() } }
	SELF:oDCQTLN:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCQTLN:HyperLabel := HyperLabel{#QTLN , "Qtl:" , NULL_STRING , "RNC_QTL"}

	SELF:oDCSC_QTL2 := FIXEDTEXT{SELF , ResourceID{ JRNCCI_SC_QTL2  , _GetInst() } }
	SELF:oDCSC_QTL2:HyperLabel := HyperLabel{#SC_QTL2 , "Qtde Lote n/c:" , NULL_STRING , NULL_STRING}

	SELF:oDCABRNOM := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_ABRNOM  , _GetInst() } }
	SELF:oDCABRNOM:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCABRNOM:HyperLabel := HyperLabel{#ABRNOM , "Abrnom:" , NULL_STRING , "RNC_ABRNOM"}

	SELF:oDCNOME := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_NOME  , _GetInst() } }
	SELF:oDCNOME:FieldSpec := PADRAO_CHAR_50{}
	SELF:oDCNOME:HyperLabel := HyperLabel{#NOME , "Nome:" , NULL_STRING , "RNC_NOME"}

	SELF:oCCESCRES := PUSHBUTTON{SELF , ResourceID{ JRNCCI_ESCRES  , _GetInst() } }
	SELF:oCCESCRES:HyperLabel := HyperLabel{#ESCRES , "..." , NULL_STRING , NULL_STRING}

	SELF:oCCESCFOR := PUSHBUTTON{SELF , ResourceID{ JRNCCI_ESCFOR  , _GetInst() } }
	SELF:oCCESCFOR:HyperLabel := HyperLabel{#ESCFOR , "..." , NULL_STRING , NULL_STRING}

	SELF:oDCABRNUM := rightSle{SELF , ResourceID{ JRNCCI_ABRNUM  , _GetInst() } }
	SELF:oDCABRNUM:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCABRNUM:HyperLabel := HyperLabel{#ABRNUM , "Abrnum:" , NULL_STRING , "RNC_ABRNUM"}

	SELF:oDCSC_SETOR1 := FIXEDTEXT{SELF , ResourceID{ JRNCCI_SC_SETOR1  , _GetInst() } }
	SELF:oDCSC_SETOR1:HyperLabel := HyperLabel{#SC_SETOR1 , "Aberto Por" , NULL_STRING , NULL_STRING}

	SELF:oDCCLIFOR := rightSle{SELF , ResourceID{ JRNCCI_CLIFOR  , _GetInst() } }
	SELF:oDCCLIFOR:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCCLIFOR:HyperLabel := HyperLabel{#CLIFOR , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCSC_NOME := FIXEDTEXT{SELF , ResourceID{ JRNCCI_SC_NOME  , _GetInst() } }
	SELF:oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME , "Cliente" , NULL_STRING , NULL_STRING}

	SELF:oDCNFC := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_NFC  , _GetInst() } }
	SELF:oDCNFC:FieldSpec := PADRAO_CHAR_20{}
	SELF:oDCNFC:HyperLabel := HyperLabel{#NFC , "Nfc:" , NULL_STRING , "RNC_NFC"}

	SELF:oDCSC_NFC := FIXEDTEXT{SELF , ResourceID{ JRNCCI_SC_NFC  , _GetInst() } }
	SELF:oDCSC_NFC:HyperLabel := HyperLabel{#SC_NFC , "Nota Fiscal Cliente" , NULL_STRING , NULL_STRING}

	SELF:oDCREVI := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_REVI  , _GetInst() } }
	SELF:oDCREVI:FieldSpec := PADRAO_CHAR_02{}
	SELF:oDCREVI:HyperLabel := HyperLabel{#REVI , "Revi:" , NULL_STRING , "RNC_REVI"}

	SELF:oDCSC_REVI := FIXEDTEXT{SELF , ResourceID{ JRNCCI_SC_REVI  , _GetInst() } }
	SELF:oDCSC_REVI:HyperLabel := HyperLabel{#SC_REVI , "Revis�o:" , NULL_STRING , NULL_STRING}

	SELF:oDCDESCRI := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_DESCRI  , _GetInst() } }
	SELF:oDCDESCRI:FieldSpec := PADRAO_CHAR_30{}
	SELF:oDCDESCRI:HyperLabel := HyperLabel{#DESCRI , "Descri:" , NULL_STRING , "RNC_DESCRI"}

	SELF:oDCSC_DESCRI := FIXEDTEXT{SELF , ResourceID{ JRNCCI_SC_DESCRI  , _GetInst() } }
	SELF:oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI , "Descri��o:" , NULL_STRING , NULL_STRING}

	SELF:oDCCODIGO := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_CODIGO  , _GetInst() } }
	SELF:oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
	SELF:oDCCODIGO:HyperLabel := HyperLabel{#CODIGO , "Codigo:" , NULL_STRING , "RNC_CODIGO"}

	SELF:oDCSC_CODIGO := FIXEDTEXT{SELF , ResourceID{ JRNCCI_SC_CODIGO  , _GetInst() } }
	SELF:oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO , "Codigo/Aplica��o" , NULL_STRING , NULL_STRING}

	SELF:oCCRB17 := RADIOBUTTON{SELF , ResourceID{ JRNCCI_RB17  , _GetInst() } }
	SELF:oCCRB17:HyperLabel := HyperLabel{#RB17 , "InternoProblemas Cliente" , NULL_STRING , NULL_STRING}

	SELF:oCCRB18 := RADIOBUTTON{SELF , ResourceID{ JRNCCI_RB18  , _GetInst() } }
	SELF:oCCRB18:HyperLabel := HyperLabel{#RB18 , "Externo Problemas Fornecedor" , NULL_STRING , NULL_STRING}

	SELF:oDCTIPERR := RADIOBUTTONGROUP{SELF , ResourceID{ JRNCCI_TIPERR  , _GetInst() } }
	SELF:oDCTIPERR:FieldSpec := PADRAO_CHAR_01{}
	SELF:oDCTIPERR:HyperLabel := HyperLabel{#TIPERR , "Tipo do Erro" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_RASTRO := FIXEDTEXT{SELF , ResourceID{ JRNCCI_SC_RASTRO  , _GetInst() } }
	SELF:oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO , "Rastro:" , NULL_STRING , NULL_STRING}

	SELF:oDCRASTRO := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_RASTRO  , _GetInst() } }
	SELF:oDCRASTRO:FieldSpec := PADRAO_CHAR_20{}
	SELF:oDCRASTRO:HyperLabel := HyperLabel{#RASTRO , "Rastro:" , NULL_STRING , "RNC_RASTRO"}

	SELF:oDCRIC := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_RIC  , _GetInst() } }
	SELF:oDCRIC:FieldSpec := PADRAO_CHAR_20{}
	SELF:oDCRIC:HyperLabel := HyperLabel{#RIC , "Ric:" , NULL_STRING , "RNC_RIC"}

	SELF:oDCSC_RIC := FIXEDTEXT{SELF , ResourceID{ JRNCCI_SC_RIC  , _GetInst() } }
	SELF:oDCSC_RIC:HyperLabel := HyperLabel{#SC_RIC , "Relat�rio /Inspe��o Cliente" , NULL_STRING , NULL_STRING}

	SELF:oDCRESP := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_RESP  , _GetInst() } }
	SELF:oDCRESP:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCRESP:HyperLabel := HyperLabel{#RESP , "RACF" , NULL_STRING , "RNC_RESP"}

	SELF:oDCSC_RESP := FIXEDTEXT{SELF , ResourceID{ JRNCCI_SC_RESP  , _GetInst() } }
	SELF:oDCSC_RESP:HyperLabel := HyperLabel{#SC_RESP , "Respons�vel pela N�o Conformidade Externa" , NULL_STRING , NULL_STRING}

	SELF:oCCRB20 := RADIOBUTTON{SELF , ResourceID{ JRNCCI_RB20  , _GetInst() } }
	SELF:oCCRB20:HyperLabel := HyperLabel{#RB20 , "Dev. Sucata" , NULL_STRING , NULL_STRING}

	SELF:oCCRB19 := RADIOBUTTON{SELF , ResourceID{ JRNCCI_RB19  , _GetInst() } }
	SELF:oCCRB19:HyperLabel := HyperLabel{#RB19 , "Dev.Retrabalho" , NULL_STRING , NULL_STRING}

	SELF:oDCCODRET := RADIOBUTTONGROUP{SELF , ResourceID{ JRNCCI_CODRET  , _GetInst() } }
	SELF:oDCCODRET:FieldSpec := PADRAO_CHAR_01{}
	SELF:oDCCODRET:HyperLabel := HyperLabel{#CODRET , "Tipo" , NULL_STRING , NULL_STRING}

	SELF:oDCUNID := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_UNID  , _GetInst() } }
	SELF:oDCUNID:FieldSpec := PADRAO_CHAR_02{}
	SELF:oDCUNID:HyperLabel := HyperLabel{#UNID , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCFT26 := FIXEDTEXT{SELF , ResourceID{ JRNCCI_FT26  , _GetInst() } }
	SELF:oDCFT26:HyperLabel := HyperLabel{#FT26 , "Unid." , NULL_STRING , NULL_STRING}

	SELF:oCCbtnPEGMP04 := PUSHBUTTON{SELF , ResourceID{ JRNCCI_BTNPEGMP04  , _GetInst() } }
	SELF:oCCbtnPEGMP04:HyperLabel := HyperLabel{#btnPEGMP04 , "-->" , NULL_STRING , NULL_STRING}

	SELF:oCCPEGCLI := PUSHBUTTON{SELF , ResourceID{ JRNCCI_PEGCLI  , _GetInst() } }
	SELF:oCCPEGCLI:HyperLabel := HyperLabel{#PEGCLI , "-->" , NULL_STRING , NULL_STRING}

	SELF:oCCPEGCOD := PUSHBUTTON{SELF , ResourceID{ JRNCCI_PEGCOD  , _GetInst() } }
	SELF:oCCPEGCOD:HyperLabel := HyperLabel{#PEGCOD , "-->" , NULL_STRING , NULL_STRING}

	SELF:oDCRAT := rightSle{SELF , ResourceID{ JRNCCI_RAT  , _GetInst() } }
	SELF:oDCRAT:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCRAT:HyperLabel := HyperLabel{#RAT , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCFT27 := FIXEDTEXT{SELF , ResourceID{ JRNCCI_FT27  , _GetInst() } }
	SELF:oDCFT27:HyperLabel := HyperLabel{#FT27 , "RAT" , NULL_STRING , NULL_STRING}

	SELF:oCCimprat := PUSHBUTTON{SELF , ResourceID{ JRNCCI_IMPRAT  , _GetInst() } }
	SELF:oCCimprat:HyperLabel := HyperLabel{#imprat , "Imp" , NULL_STRING , NULL_STRING}

	SELF:oDCNSAC := SINGLELINEEDIT{SELF , ResourceID{ JRNCCI_NSAC  , _GetInst() } }
	SELF:oDCNSAC:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCNSAC:HyperLabel := HyperLabel{#NSAC , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCFT28 := FIXEDTEXT{SELF , ResourceID{ JRNCCI_FT28  , _GetInst() } }
	SELF:oDCFT28:HyperLabel := HyperLabel{#FT28 , "SAC" , NULL_STRING , NULL_STRING}

	SELF:oCCesccod := PUSHBUTTON{SELF , ResourceID{ JRNCCI_ESCCOD  , _GetInst() } }
	SELF:oCCesccod:HyperLabel := HyperLabel{#esccod , "..." , NULL_STRING , NULL_STRING}

	SELF:oDCQTL := rightSle{SELF , ResourceID{ JRNCCI_QTL  , _GetInst() } }
	SELF:oDCQTL:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCQTL:HyperLabel := HyperLabel{#QTL , "Qtl:" , NULL_STRING , "RNC_QTL"}

	SELF:oDCSC_QTL3 := FIXEDTEXT{SELF , ResourceID{ JRNCCI_SC_QTL3  , _GetInst() } }
	SELF:oDCSC_QTL3:HyperLabel := HyperLabel{#SC_QTL3 , "Qtde Lote :" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText9 := FIXEDTEXT{SELF , ResourceID{ JRNCCI_THEFIXEDTEXT9  , _GetInst() } }
	SELF:oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9 , "Cancelar" , NULL_STRING , NULL_STRING}

	SELF:oCCcancelar := PUSHBUTTON{SELF , ResourceID{ JRNCCI_CANCELAR  , _GetInst() } }
	SELF:oCCcancelar:Image := ico_sair{}
	SELF:oCCcancelar:HyperLabel := HyperLabel{#cancelar , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText11 := FIXEDTEXT{SELF , ResourceID{ JRNCCI_THEFIXEDTEXT11  , _GetInst() } }
	SELF:oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11 , "OK" , NULL_STRING , NULL_STRING}

	SELF:oCCOK := PUSHBUTTON{SELF , ResourceID{ JRNCCI_OK  , _GetInst() } }
	SELF:oCCOK:Image := ico_ok{}
	SELF:oCCOK:HyperLabel := HyperLabel{#OK , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCRB21 := RADIOBUTTON{SELF , ResourceID{ JRNCCI_RB21  , _GetInst() } }
	SELF:oCCRB21:HyperLabel := HyperLabel{#RB21 , "Sucata" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_DESTINO2 := FIXEDTEXT{SELF , ResourceID{ JRNCCI_SC_DESTINO2  , _GetInst() } }
	SELF:oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2 , "Foto" , NULL_STRING , NULL_STRING}

	SELF:oCCfoto := PUSHBUTTON{SELF , ResourceID{ JRNCCI_FOTO  , _GetInst() } }
	SELF:oCCfoto:Image := ico_camera{}
	SELF:oCCfoto:HyperLabel := HyperLabel{#foto , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCTIPERR:FillUsing({ ;
	                         {SELF:oCCRB17, "I"}, ;
	                         {SELF:oCCRB18, "E"} ;
	                         })

	SELF:oDCCODRET:FillUsing({ ;
	                         {SELF:oCCRB20, "E"}, ;
	                         {SELF:oCCRB19, "D"}, ;
	                         {SELF:oCCRB21, "S"} ;
	                         })

	SELF:Caption := "RNC Cliente Inclusao"
	SELF:HyperLabel := HyperLabel{#JRNCCI , "RNC Cliente Inclusao" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS NFC
RETURN SELF:FieldGet( #NFC )

ASSIGN NFC( uValue )
SELF:FieldPut( #NFC , uValue )

ACCESS NOME
RETURN SELF:FieldGet( #NOME )

ASSIGN NOME( uValue )
SELF:FieldPut( #NOME , uValue )

ACCESS NSAC
RETURN SELF:FieldGet( #NSAC )

ASSIGN NSAC( uValue )
SELF:FieldPut( #NSAC , uValue )

METHOD OK( ) 
LOCAL oSERVER,oRACF,oSAC,oRATI AS USEREDE
LOCAL aDAD,aCAMPOS AS ARRAY
LOCAL nRNC,nRACF,nSAC AS DWORD
LOCAL lSAC,lCON AS LOGIC
LOCAL cCAUSA AS STRING

IF Empty(SELF:CLIFOR)
   alert("Cliente em Branco")	
   RETURN .f.
ENDIF
IF Empty(SELF:NOME)
   alert("Nome Cliente em Branco")	
   RETURN .f.
ENDIF
IF Empty(SELF:CODIGO)
   alert("Codigo Produto em Branco")	
   RETURN .f.
ENDIF
IF Empty(SELF:DESCRI)
   alert("Descri�ao Produto em Branco")	
   RETURN .f.
ENDIF

nRNC:=0
nRACF:=0
nSAC:=0
aDAD:={zCURINI,"RNC.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU SELF
ENDIF		
aDAD:={zCURINI,"RACF.DBF",zCURDIR}
oRACF:=USEREDE{aDAD}
IF oRACF:nERRO#0
   oSERVER:CLOSE()
   RETU SELF
ENDIF
aDAD:={zCURINI,"SAC.DBF",zCURDIR}
oSAC:=USEREDE{aDAD}
IF oSAC:nERRO#0
   oRACF:CLOSE()	
   oSERVER:CLOSE()
   RETU SELF
ENDIF

oSERVER:GoBottom()
nRNC:=oSERVER:FIELDGET("RNC")
nRNC++
oSERVER:APPEND()
oSERVER:FIELDPUT("RNC",nRNC)
oSERVER:FIELDPUT("ABRNUM",SELF:ABRNUM)
oSERVER:FIELDPUT("ABRNOM",SELF:ABRNOM)
oSERVER:FIELDPUT("CLIFOR",SELF:CLIFOR)
oSERVER:FIELDPUT("CODIGO",SELF:CODIGO)
oSERVER:FIELDPUT("DEC01",SELF:DEC01)
oSERVER:FIELDPUT("DEC02",SELF:DEC02)
oSERVER:FIELDPUT("DEC03",SELF:DEC03)
oSERVER:FIELDPUT("DESCRI",SELF:DESCRI)
oSERVER:FIELDPUT("NFC",SELF:NFC)
oSERVER:FIELDPUT("REVI",SELF:REVI)
oSERVER:FIELDPUT("NOME",SELF:NOME)
oSERVER:FIELDPUT("QTLN",SELF:QTLN)
oSERVER:FIELDPUT("QTL",SELF:QTL)
oSERVER:FIELDPUT("RASTRO",SELF:RASTRO)
oSERVER:FIELDPUT("RIC",SELF:RIC)
oSERVER:FIELDPUT("RESP",SELF:RESP)
oSERVER:FIELDPUT("UNID",SELF:UNID)
oSERVER:FIELDPUT("DISPO","C") //Cliente
oSERVER:FIELDPUT("CODRNC","C") //Cliente
oSERVER:FIELDPUT("CODRET",SELF:CODRET)
oSERVER:FIELDPUT("TIPERR",SELF:TIPERR)
oSERVER:FIELDPUT("INCUSER",ZUSER)
OSERVER:FIELDPUT("INCDATA",Today())
OSERVER:FIELDPUT("DATA",Today())
OSERVER:FIELDPUT("TIPCAD","C")
oSERVER:FIELDPUT("FECHADA",.F.)
IF oSERVER:FIELDGET("TIPERR")="E"
   oRACF:GOBOTTOM()
   nRACF:=oRACF:FIELDGET("RACF")
   nRACF++
   oRACF:APPEND()
   oRACF:FIELDPUT("RACF",nRACF)
   oRACF:FIELDPUT("DATA",Today())
   oRACF:FIELDPUT("INCUSER",ZUSER)
   ORACF:FIELDPUT("INCDATA",Today())
   oRACF:FIELDPUT("RNC",oSERVER:FIELDGET("RNC"))
   oRACF:FIELDPUT("RASTRO",oSERVER:FIELDGET("RASTRO"))
   oRACF:FIELDPUT("CNFFOR",oSERVER:FIELDGET("NFC"))
   oRACF:FIELDPUT("DESENHO",oSERVER:FIELDGET("CODIGO"))
   oRACF:FIELDPUT("DENO",oSERVER:FIELDGET("DESCRI"))
   oRACF:FIELDPUT("QTN1",oSERVER:FIELDGET("QTLN"))
   oRACF:FIELDPUT("UNID",oSERVER:FIELDGET("UNID"))
   oRACF:FIELDPUT("DESC01",oSERVER:FIELDGET("DEC01"))
   oRACF:FIELDPUT("DESC02",oSERVER:FIELDGET("DEC02"))
   oRACF:FIELDPUT("DESC03",oSERVER:FIELDGET("DEC03"))
   oRACF:FIELDPUT("RAT",SELF:RAT)
   oSERVER:FIELDPUT("NRACF",nRACF)
   ENVIARACF(nRNC,nRACF)
ENDIF
oRACF:CLOSE()
IF oSERVER:FIELDGET("TIPERR")="I"
   nSAC:=SELF:NSAC
   lSAC:=.F.
   lCON:=.F.
   IF SELF:RAT=0 .OR. nSAC=0
      oSAC:GOBOTTOM()
      nSAC:=oSAC:FIELDGET("SAC")
      nSAC++
      lSAC:=.T.
   ENDIF
   IF lSAC
      oSAC:APPEND()
      oSAC:FIELDPUT("SAC",nSAC)
      lCON:=.T.
   ELSE
   	  oSAC:GOTOP()
   	  IF oSAC:SEEK(nSAC)
   	  	 lCON:=.T.
   	  ENDIF	
   ENDIF
   IF Lcon
      oSAC:FIELDPUT("DATA",Today())
      oSAC:FIELDPUT("RNC",oSERVER:FIELDGET("RNC"))
      oSAC:FIELDPUT("RASTRO",oSERVER:FIELDGET("RASTRO"))
      oSAC:FIELDPUT("CODIGO",oSERVER:FIELDGET("CODIGO"))
      oSAC:FIELDPUT("NOME",oSERVER:FIELDGET("DESCRI"))
      oSAC:FIELDPUT("QTN",oSERVER:FIELDGET("QTLN"))
      oSAC:FIELDPUT("CLIENTE",oSERVER:FIELDGET("CLIFOR"))
      oSAC:FIELDPUT("CLINOME",oSERVER:FIELDGET("NOME"))
      oSAC:FIELDPUT("DOCUMENTO",oSERVER:FIELDGET("RIC"))
      oSAC:FIELDPUT("INCUSER",ZUSER)
      OSAC:FIELDPUT("INCDATA",Today())
      oSAC:FIELDPUT("DESC01",SELF:DEC01)
      oSAC:FIELDPUT("DESC02",SELF:DEC02)
      oSAC:FIELDPUT("DESC03",SELF:DEC03)
      oSAC:FIELDPUT("TIPO","R")
      oSAC:FIELDPUT("RAT",SELF:RAT)
   ENDIF
   cCAUSA:=AllTrim(oSAC:FIELDGET("DESC01"))
   cCAUSA+="_"+AllTrim(oSAC:FIELDGET("DESC02"))	
   cCAUSA+="_"+AllTrim(oSAC:FIELDGET("DESC03"))	
   cCAUSA+="_"+AllTrim(oSAC:FIELDGET("DESC04"))	
   ENVIARsac(nSAC,oSAC:FIELDGET("CODIGO"),oSAC:FIELDGET("CLIENTE"),cCAUSA)	
   oSAC:CLOSE()
   oSERVER:FIELDPUT("NSAC",nSAC)
ENDIF
oSERVER:CLOSE()

IF SELF:RAT>0
   aDAD:={zCURINI,"RATI.DBF",zCURDIR}
   oRATI:=USEREDE{aDAD}
   IF oRATI:nERRO#0
      RETU SELF
   ENDIF		
   oRATI:GOTOP()
   oRATI:SEEK(SELF:RAT)
   WHILE SELF:RAT=oRATI:FIELDGET("RAT") .AND. ! oRATI:EoF
      IF AllTrim(SELF:CODIGO)=AllTrim(oRATI:FIELDGET("CODIGO"))	
      	 oRATI:FIELDPUT("LACAO",.T.)
      	 oRATI:FIELDPUT("SAC",nSAC)
      	 oRATI:FIELDPUT("RACF",nRACF)
      ENDIF
     oRATI:SKIP()	
   ENDDO
   oRATI:cLOSE()	
ELSE
   aCAMPOS:={}
   AAdd(aCAMPOS,SELF:CLIFOR)
   AAdd(aCAMPOS,SELF:NOME)
   AAdd(aCAMPOS,SELF:CODIGO)
   AAdd(aCAMPOS,SELF:DESCRI)
   AAdd(Acampos,0)
   AAdd(aCAMPOS,nRNC)
   AAdd(Acampos,Today())
   AAdd(aCAMPOS,nSAC)
   AAdd(aCAMPOS,"")
   NOVOCNQ(aCAMPOS)
ENDIF
ENVIARNC(NRNC,"Cliente",SELF:CODIGO,{SELF:DEC01,SELF:DEC02,SELF:DEC03})	
DIGANUM(nRNC,nRACF,nSAC)
SELF:EndWindow()




METHOD PEGCLI( ) 
LOCAL aCLI AS ARRAY	
aCLI:=PEGMA01(SELF:CLIFOR,ZCURINI,ZCURDIR)
IF aCLI[1]=.T.
   SELF:NOME:=aCLI[2]
ENDIF	

METHOD PEGCOD( ) 
LOCAL aPRO	
aPRO:=PEGMS01(SELF:CODIGO)
IF aPRO[1]=.T. .AND. ! Empty(aPRO[2])
   SELF:DESCRI:=aPRO[2]
ENDIF

METHOD btnPEGMP04( ) 
LOCAL aTEC AS ARRAY
LOCAL ACOM AS ARRAY
aCOM:={zMES,zANO,ZEMPRESA}	
aTEC:=PEGMP04(SELF:ABRNUM,ZCURINI,ZCURDIR,ACOM)
IF aTEC[1]=.T.
   SELF:ABRNOM:=aTEC[2]
ENDIF

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
//	   FabCenterWindow( SELF )
	RETURN NIL


ACCESS QTL
RETURN SELF:FieldGet( #QTL )

ASSIGN QTL( uValue )
SELF:FieldPut( #QTL , uValue )

ACCESS QTLN
RETURN SELF:FieldGet( #QTLN )

ASSIGN QTLN( uValue )
SELF:FieldPut( #QTLN , uValue )

ACCESS RASTRO
RETURN SELF:FieldGet( #RASTRO )

ASSIGN RASTRO( uValue )
SELF:FieldPut( #RASTRO , uValue )

ACCESS RAT
RETURN SELF:FieldGet( #RAT )

ASSIGN RAT( uValue )
SELF:FieldPut( #RAT , uValue )

ACCESS RESP
RETURN SELF:FieldGet( #RESP )

ASSIGN RESP( uValue )
SELF:FieldPut( #RESP , uValue )

ACCESS REVI
RETURN SELF:FieldGet( #REVI )

ASSIGN REVI( uValue )
SELF:FieldPut( #REVI , uValue )

ACCESS RIC
RETURN SELF:FieldGet( #RIC )

ASSIGN RIC( uValue )
SELF:FieldPut( #RIC , uValue )

ACCESS TIPERR
RETURN SELF:FieldGet( #TIPERR )

ASSIGN TIPERR( uValue )
SELF:FieldPut( #TIPERR , uValue )

ACCESS UNID
RETURN SELF:FieldGet( #UNID )

ASSIGN UNID( uValue )
SELF:FieldPut( #UNID , uValue )

END CLASS
STATIC DEFINE JRNCCI_BTNPEGMP04 := 136
