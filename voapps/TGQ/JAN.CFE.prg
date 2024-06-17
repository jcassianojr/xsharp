#region DEFINES
STATIC DEFINE JCFE_BUSCANUM := 133 
STATIC DEFINE JCFE_CLIENTE := 122 
STATIC DEFINE JCFE_CLIFOR := 101 
STATIC DEFINE JCFE_COGNOME := 102 
STATIC DEFINE JCFE_DATA := 100 
STATIC DEFINE JCFE_ESCCOD := 126 
STATIC DEFINE JCFE_ESCNON := 124 
STATIC DEFINE JCFE_FORNECEDOR := 123 
STATIC DEFINE JCFE_FOTO := 132 
STATIC DEFINE JCFE_JUSTIFI := 106 
STATIC DEFINE JCFE_MEIOTRAN := 105 
STATIC DEFINE JCFE_NOTA := 103 
STATIC DEFINE JCFE_NUMERO := 119 
STATIC DEFINE JCFE_PEGCOG := 125 
STATIC DEFINE JCFE_PESO := 104 
STATIC DEFINE JCFE_PORNUM := 134 
STATIC DEFINE JCFE_PRODUTO := 107 
STATIC DEFINE JCFE_SC_CLIFOR := 111 
STATIC DEFINE JCFE_SC_COGNOME := 112 
STATIC DEFINE JCFE_SC_DATA := 109 
STATIC DEFINE JCFE_SC_DESTINO2 := 131 
STATIC DEFINE JCFE_SC_JUSTIFI := 116 
STATIC DEFINE JCFE_SC_MEIOTRAN := 115 
STATIC DEFINE JCFE_SC_NOTA := 113 
STATIC DEFINE JCFE_SC_NUMERO := 108 
STATIC DEFINE JCFE_SC_PESO := 114 
STATIC DEFINE JCFE_SC_PRODUTO := 118 
STATIC DEFINE JCFE_SC_TIPOCLI := 110 
STATIC DEFINE JCFE_SC_TIPOENT := 117 
STATIC DEFINE JCFE_TIPOC := 129 
STATIC DEFINE JCFE_TIPOCLI := 120 
STATIC DEFINE JCFE_TIPOENT := 121 
STATIC DEFINE JCFE_TIPOM := 128 
STATIC DEFINE JCFE_TIPOP := 127 
STATIC DEFINE JCFE_TIPOT := 130 
#endregion

CLASS JCFE INHERIT MYDataWindow 

	PROTECT oDBNUMERO AS DataColumn
	PROTECT oDBDATA AS DataColumn
	PROTECT oDBCOGNOME AS DataColumn
	PROTECT oDBNOTA AS DataColumn
	PROTECT oDBPRODUTO AS DataColumn
	PROTECT oDCDATA AS DATESLE
	PROTECT oDCCLIFOR AS RIGHTSLE
	PROTECT oDCCOGNOME AS SINGLELINEEDIT
	PROTECT oDCNOTA AS SINGLELINEEDIT
	PROTECT oDCPESO AS RIGHTSLE
	PROTECT oDCMEIOTRAN AS SINGLELINEEDIT
	PROTECT oDCJUSTIFI AS SINGLELINEEDIT
	PROTECT oDCPRODUTO AS SINGLELINEEDIT
	PROTECT oDCSC_NUMERO AS FIXEDTEXT
	PROTECT oDCSC_DATA AS FIXEDTEXT
	PROTECT oDCSC_TIPOCLI AS FIXEDTEXT
	PROTECT oDCSC_CLIFOR AS FIXEDTEXT
	PROTECT oDCSC_COGNOME AS FIXEDTEXT
	PROTECT oDCSC_NOTA AS FIXEDTEXT
	PROTECT oDCSC_PESO AS FIXEDTEXT
	PROTECT oDCSC_MEIOTRAN AS FIXEDTEXT
	PROTECT oDCSC_JUSTIFI AS FIXEDTEXT
	PROTECT oDCSC_TIPOENT AS FIXEDTEXT
	PROTECT oDCSC_PRODUTO AS FIXEDTEXT
	PROTECT oDCNUMERO AS SINGLELINEEDIT
	PROTECT oDCTIPOCLI AS SINGLELINEEDIT
	PROTECT oDCTIPOENT AS SINGLELINEEDIT
	PROTECT oCCCliente AS PUSHBUTTON
	PROTECT oCCFornecedor AS PUSHBUTTON
	PROTECT oCCescnon AS PUSHBUTTON
	PROTECT oCCpegcog AS PUSHBUTTON
	PROTECT oCCesccod AS PUSHBUTTON
	PROTECT oCCtipop AS PUSHBUTTON
	PROTECT oCCtipom AS PUSHBUTTON
	PROTECT oCCtipoc AS PUSHBUTTON
	PROTECT oCCtipot AS PUSHBUTTON
	PROTECT oDCSC_DESTINO2 AS FIXEDTEXT
	PROTECT oCCfoto AS PUSHBUTTON
	PROTECT oCCBuscanum AS PUSHBUTTON
	PROTECT oCCPORNUM AS PUSHBUTTON
// 	instance DATA 
// 	instance CLIFOR 
// 	instance COGNOME 
// 	instance NOTA 
// 	instance PESO 
// 	instance MEIOTRAN 
// 	instance JUSTIFI 
// 	instance PRODUTO 
// 	instance NUMERO 
// 	instance TIPOCLI 
// 	instance TIPOENT 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD APPEND() 
LOCAL nNUMERO AS DWORD	
SELF:SERVER:SETORDER(1)
SELF:SERVER:GOBOTTOM()		
nNUMERO:=SELF:SERVER:FIELDGET("NUMERO")
nNUMERO++
SUPER:APPEND()
SELF:SERVER:FIELDPUT("NUMERO",nNUMERO)
SELF:SERVER:FIELDPUT("DATA",Today())
SELF:SERVER:FIELDPUT("TIPOCLI","C")
SELF:SERVER:FIELDPUT("TIPOENT","P")

METHOD Buscanum( ) 
	SELF:KeyFind()

METHOD Cliente( ) 
	SELF:server:FIELDPUT("tipocli","C")
	

ACCESS CLIFOR() 
RETURN SELF:FieldGet(#CLIFOR)


ASSIGN CLIFOR(uValue) 
SELF:FieldPut(#CLIFOR, uValue)
RETURN CLIFOR := uValue


METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("CFE","")		

ACCESS COGNOME() 
RETURN SELF:FieldGet(#COGNOME)


ASSIGN COGNOME(uValue) 
SELF:FieldPut(#COGNOME, uValue)
RETURN COGNOME := uValue


ACCESS DATA() 
RETURN SELF:FieldGet(#DATA)


ASSIGN DATA(uValue) 
SELF:FieldPut(#DATA, uValue)
RETURN DATA := uValue


METHOD DELETE() 
IF MDG("Apagar Lançamento")	
   SELF:SERVER:DELETE()
   SELF:SERVER:SKIPex(-1)
ENDIF

METHOD esccod( ) 
LOCAL oESC AS XESCCOD	
DO CASE
	CASE SELF:SERVER:FIELDGET("TIPOENT")="M"
       oESC:=XESCCOD{SELF,"MU01.DBF"}		
	CASE SELF:SERVER:FIELDGET("TIPOENT")="C"
       oESC:=XESCCOD{SELF,"MT01.DBF"}		
	CASE SELF:SERVER:FIELDGET("TIPOENT")="T"
       oESC:=XESCCOD{SELF,"MP03.DBF"}		
	OTHERWISE
       oESC:=XESCCOD{SELF,"MS01.DBF"}
ENDCASE
oESC:SHOW()	
IF Oesc:lok
    SELF:SERVER:FIELDPUT("PRODUTO",oESC:CODIGO)
ENDIF				
	

METHOD escnon( ) 
LOCAL oESC AS XESCNUM	
IF SELF:SERVER:FIELDGET("TIPOCLI")="C"
   oESC:=XESCNUM{SELF,"MA01.DBF"}
ELSE
   oESC:=XESCNUM{SELF,"MB01.DBF"}	
ENDIF
oESC:SHOW()	
IF Oesc:lok
    SELF:SERVER:FIELDPUT("CLIFOR",oESC:NUMERO)
ENDIF	
SELF:PEGCOG()

METHOD Fornecedor( ) 
	SELF:server:FIELDPUT("tipocli","F")	


METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
IF SELF:SERVER:FIELDGET("TIPOENT")#"P"
   alert("Nao e Tipo Produto")	
   RETURN .f.
ENDIF	
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:SERVER:FIELDGET("produto"))," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETURN .f.
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG",cCODIGO}
OFOTOVIEW:SHOW()	

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
LOCAL DIM aFonts[1] AS OBJECT
LOCAL DIM aBrushes[1] AS OBJECT

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCFE",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDATA := DateSle{SELF,ResourceID{JCFE_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"CFE_DATA"}
oDCDATA:TooltipText := "Data do Lançamento"

oDCCLIFOR := rightSle{SELF,ResourceID{JCFE_CLIFOR,_GetInst()}}
oDCCLIFOR:FieldSpec := PADRAO_NUM_08{}
oDCCLIFOR:HyperLabel := HyperLabel{#CLIFOR,"Clifor:",NULL_STRING,"CFE_CLIFOR"}
oDCCLIFOR:TooltipText := "Numero Cadastro Cliente ou Fornecedor"

oDCCOGNOME := SingleLineEdit{SELF,ResourceID{JCFE_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := PADRAO_CHAR_20{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"CFE_COGNOME"}
oDCCOGNOME:TooltipText := "Cognome do Cliente/Fornecedor"

oDCNOTA := SingleLineEdit{SELF,ResourceID{JCFE_NOTA,_GetInst()}}
oDCNOTA:FieldSpec := PADRAO_CHAR_30{}
oDCNOTA:HyperLabel := HyperLabel{#NOTA,"Nota:",NULL_STRING,"CFE_NOTA"}
oDCNOTA:TooltipText := "Numero da Nota(s)Fiscal"

oDCPESO := rightSle{SELF,ResourceID{JCFE_PESO,_GetInst()}}
oDCPESO:FieldSpec := PADRAO_NUM_12_2{}
oDCPESO:HyperLabel := HyperLabel{#PESO,"Peso:",NULL_STRING,"CFE_PESO"}
oDCPESO:TooltipText := "Peso"

oDCMEIOTRAN := SingleLineEdit{SELF,ResourceID{JCFE_MEIOTRAN,_GetInst()}}
oDCMEIOTRAN:FieldSpec := PADRAO_CHAR_30{}
oDCMEIOTRAN:HyperLabel := HyperLabel{#MEIOTRAN,"Meiotran:",NULL_STRING,"CFE_MEIOTRAN"}
oDCMEIOTRAN:TooltipText := "Meio de Transporte"

oDCJUSTIFI := SingleLineEdit{SELF,ResourceID{JCFE_JUSTIFI,_GetInst()}}
oDCJUSTIFI:FieldSpec := PADRAO_CHAR_80{}
oDCJUSTIFI:HyperLabel := HyperLabel{#JUSTIFI,"Justifi:",NULL_STRING,"CFE_JUSTIFI"}
oDCJUSTIFI:TooltipText := "Digite a Justificativa"

oDCPRODUTO := SingleLineEdit{SELF,ResourceID{JCFE_PRODUTO,_GetInst()}}
oDCPRODUTO:FieldSpec := PADRAO_CHAR_24{}
oDCPRODUTO:HyperLabel := HyperLabel{#PRODUTO,"Produto:",NULL_STRING,"CFE_PRODUTO"}
oDCPRODUTO:TooltipText := "Codigo do Produto"

oDCSC_NUMERO := FixedText{SELF,ResourceID{JCFE_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{SELF,ResourceID{JCFE_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_TIPOCLI := FixedText{SELF,ResourceID{JCFE_SC_TIPOCLI,_GetInst()}}
oDCSC_TIPOCLI:HyperLabel := HyperLabel{#SC_TIPOCLI,"Tipo",NULL_STRING,NULL_STRING}

oDCSC_CLIFOR := FixedText{SELF,ResourceID{JCFE_SC_CLIFOR,_GetInst()}}
oDCSC_CLIFOR:HyperLabel := HyperLabel{#SC_CLIFOR,"Numero",NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{SELF,ResourceID{JCFE_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCSC_NOTA := FixedText{SELF,ResourceID{JCFE_SC_NOTA,_GetInst()}}
oDCSC_NOTA:HyperLabel := HyperLabel{#SC_NOTA,"Nota:",NULL_STRING,NULL_STRING}

oDCSC_PESO := FixedText{SELF,ResourceID{JCFE_SC_PESO,_GetInst()}}
oDCSC_PESO:HyperLabel := HyperLabel{#SC_PESO,"Peso:",NULL_STRING,NULL_STRING}

oDCSC_MEIOTRAN := FixedText{SELF,ResourceID{JCFE_SC_MEIOTRAN,_GetInst()}}
oDCSC_MEIOTRAN:HyperLabel := HyperLabel{#SC_MEIOTRAN,"Meio de Transporte",NULL_STRING,NULL_STRING}

oDCSC_JUSTIFI := FixedText{SELF,ResourceID{JCFE_SC_JUSTIFI,_GetInst()}}
oDCSC_JUSTIFI:HyperLabel := HyperLabel{#SC_JUSTIFI,"Justificativa:",NULL_STRING,NULL_STRING}

oDCSC_TIPOENT := FixedText{SELF,ResourceID{JCFE_SC_TIPOENT,_GetInst()}}
oDCSC_TIPOENT:HyperLabel := HyperLabel{#SC_TIPOENT,"Tipo",NULL_STRING,NULL_STRING}

oDCSC_PRODUTO := FixedText{SELF,ResourceID{JCFE_SC_PRODUTO,_GetInst()}}
oDCSC_PRODUTO:HyperLabel := HyperLabel{#SC_PRODUTO,"Produto:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{SELF,ResourceID{JCFE_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_10{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"CFE_NUMERO"}
oDCNUMERO:TooltipText := "Numero do Lançamento"
oDCNUMERO:BackGround := aBrushes[1]
oDCNUMERO:Font(aFonts[1], FALSE)

oDCTIPOCLI := SingleLineEdit{SELF,ResourceID{JCFE_TIPOCLI,_GetInst()}}
oDCTIPOCLI:FieldSpec := PADRAO_CHAR_01{}
oDCTIPOCLI:HyperLabel := HyperLabel{#TIPOCLI,"Tipocli:",NULL_STRING,"CFE_TIPOCLI"}
oDCTIPOCLI:TooltipText := "Tipo (C)Cliente (F)Fornecedor"
oDCTIPOCLI:BackGround := aBrushes[1]
oDCTIPOCLI:Font(aFonts[1], FALSE)

oDCTIPOENT := SingleLineEdit{SELF,ResourceID{JCFE_TIPOENT,_GetInst()}}
oDCTIPOENT:FieldSpec := PADRAO_CHAR_01{}
oDCTIPOENT:HyperLabel := HyperLabel{#TIPOENT,"Tipoent:",NULL_STRING,"CFE_TIPOENT"}
oDCTIPOENT:TooltipText := "Tipo de Produto (P)roduto(M)atPrima(C)Componente"
oDCTIPOENT:BackGround := aBrushes[1]
oDCTIPOENT:Font(aFonts[1], FALSE)

oCCCliente := PushButton{SELF,ResourceID{JCFE_CLIENTE,_GetInst()}}
oCCCliente:HyperLabel := HyperLabel{#Cliente,"Cliente",NULL_STRING,NULL_STRING}
oCCCliente:TooltipText := "Clique Se For Cliente"

oCCFornecedor := PushButton{SELF,ResourceID{JCFE_FORNECEDOR,_GetInst()}}
oCCFornecedor:HyperLabel := HyperLabel{#Fornecedor,"Fornecedor",NULL_STRING,NULL_STRING}
oCCFornecedor:TooltipText := "Clique se For Fornecedor"

oCCescnon := PushButton{SELF,ResourceID{JCFE_ESCNON,_GetInst()}}
oCCescnon:HyperLabel := HyperLabel{#escnon,"...",NULL_STRING,NULL_STRING}
oCCescnon:TooltipText := "Clique para Ver Lista/Cliente Fornecedor"

oCCpegcog := PushButton{SELF,ResourceID{JCFE_PEGCOG,_GetInst()}}
oCCpegcog:HyperLabel := HyperLabel{#pegcog,"-->",NULL_STRING,NULL_STRING}
oCCpegcog:TooltipText := "Clique para Obter o Nome do Fornecedor"

oCCesccod := PushButton{SELF,ResourceID{JCFE_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}
oCCesccod:TooltipText := "Clique para Ver Produto"

oCCtipop := PushButton{SELF,ResourceID{JCFE_TIPOP,_GetInst()}}
oCCtipop:HyperLabel := HyperLabel{#tipop,"Produto",NULL_STRING,NULL_STRING}
oCCtipop:TooltipText := "Clique Se For Produto"

oCCtipom := PushButton{SELF,ResourceID{JCFE_TIPOM,_GetInst()}}
oCCtipom:HyperLabel := HyperLabel{#tipom,"Mat.Prima",NULL_STRING,NULL_STRING}
oCCtipom:TooltipText := "Clique Se For Materia Prima"

oCCtipoc := PushButton{SELF,ResourceID{JCFE_TIPOC,_GetInst()}}
oCCtipoc:HyperLabel := HyperLabel{#tipoc,"Comp.",NULL_STRING,NULL_STRING}
oCCtipoc:TooltipText := "Clique Se For Componente"

oCCtipot := PushButton{SELF,ResourceID{JCFE_TIPOT,_GetInst()}}
oCCtipot:HyperLabel := HyperLabel{#tipot,"Tratamento",NULL_STRING,NULL_STRING}
oCCtipot:TooltipText := "Clique Se For Tratamento/Serv.Terceiros"

oDCSC_DESTINO2 := FixedText{SELF,ResourceID{JCFE_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{SELF,ResourceID{JCFE_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oCCBuscanum := PushButton{SELF,ResourceID{JCFE_BUSCANUM,_GetInst()}}
oCCBuscanum:Image := ico_find{}
oCCBuscanum:HyperLabel := HyperLabel{#Buscanum,NULL_STRING,NULL_STRING,NULL_STRING}

oCCPORNUM := PushButton{SELF,ResourceID{JCFE_PORNUM,_GetInst()}}
oCCPORNUM:Image := ico_az{}
oCCPORNUM:HyperLabel := HyperLabel{#PORNUM,NULL_STRING,NULL_STRING,NULL_STRING}

SELF:Caption := "Controle de Fretes Excessivos"
SELF:HyperLabel := HyperLabel{#JCFE,"Controle de Fretes Excessivos",NULL_STRING,NULL_STRING}
SELF:Menu := STANDARDSHELLMENU{}

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF
SELF:Browser := DataBrowser{SELF}

oDBNUMERO := DataColumn{PADRAO_NUM_10{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
oDBNUMERO:BackGround := aBrushes[1]
SELF:Browser:AddColumn(oDBNUMERO)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 14
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
SELF:Browser:AddColumn(oDBDATA)

oDBCOGNOME := DataColumn{PADRAO_CHAR_20{}}
oDBCOGNOME:Width := 12
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
SELF:Browser:AddColumn(oDBCOGNOME)

oDBNOTA := DataColumn{PADRAO_CHAR_30{}}
oDBNOTA:Width := 19
oDBNOTA:HyperLabel := oDCNOTA:HyperLabel 
oDBNOTA:Caption := "Nota:"
SELF:Browser:AddColumn(oDBNOTA)

oDBPRODUTO := DataColumn{PADRAO_CHAR_24{}}
oDBPRODUTO:Width := 17
oDBPRODUTO:HyperLabel := oDCPRODUTO:HyperLabel 
oDBPRODUTO:Caption := "Produto:"
SELF:Browser:AddColumn(oDBPRODUTO)


SELF:ViewAs(#FormView)

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


ACCESS JUSTIFI() 
RETURN SELF:FieldGet(#JUSTIFI)


ASSIGN JUSTIFI(uValue) 
SELF:FieldPut(#JUSTIFI, uValue)
RETURN JUSTIFI := uValue


ACCESS MEIOTRAN() 
RETURN SELF:FieldGet(#MEIOTRAN)


ASSIGN MEIOTRAN(uValue) 
SELF:FieldPut(#MEIOTRAN, uValue)
RETURN MEIOTRAN := uValue


ACCESS NOTA() 
RETURN SELF:FieldGet(#NOTA)


ASSIGN NOTA(uValue) 
SELF:FieldPut(#NOTA, uValue)
RETURN NOTA := uValue


ACCESS NUMERO() 
RETURN SELF:FieldGet(#NUMERO)


ASSIGN NUMERO(uValue) 
SELF:FieldPut(#NUMERO, uValue)
RETURN NUMERO := uValue


METHOD pegcog( ) 
LOCAL aCLI AS ARRAY
IF SELF:SERVER:FIELDGET("TIPOCLI")="C"
   aCLI:=PEGMA01(SELF:SERVER:FIELDGET("CLIFOR"),ZCURINI,ZCURDIR)
ELSE
   aCLI:=PEGMB01(SELF:SERVER:FIELDGET("CLIFOR"),ZCURINI,ZCURDIR)	
ENDIF
IF aCLI[1]=.T.
   SELF:SERVER:FIELDPUT("COGNOME",aCLI[3])
ENDIF
	
	

ACCESS PESO() 
RETURN SELF:FieldGet(#PESO)


ASSIGN PESO(uValue) 
SELF:FieldPut(#PESO, uValue)
RETURN PESO := uValue


METHOD PORNUM( ) 
	SELF:KeyFind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
      FabCenterWindow( SELF )
 RETURN SELF

ACCESS PRODUTO() 
RETURN SELF:FieldGet(#PRODUTO)


ASSIGN PRODUTO(uValue) 
SELF:FieldPut(#PRODUTO, uValue)
RETURN PRODUTO := uValue


METHOD Timer() 
   SELF:SERVER:COMMIT()


METHOD tipoc( ) 
		SELF:SERVER:FIELDPUT("TIPOENT","C")

ACCESS TIPOCLI() 
RETURN SELF:FieldGet(#TIPOCLI)


ASSIGN TIPOCLI(uValue) 
SELF:FieldPut(#TIPOCLI, uValue)
RETURN TIPOCLI := uValue


ACCESS TIPOENT() 
RETURN SELF:FieldGet(#TIPOENT)


ASSIGN TIPOENT(uValue) 
SELF:FieldPut(#TIPOENT, uValue)
RETURN TIPOENT := uValue


METHOD tipom( ) 
	SELF:SERVER:FIELDPUT("TIPOENT","M")	

METHOD tipop( ) 
	SELF:SERVER:FIELDPUT("TIPOENT","P")

METHOD tipot( ) 
	SELF:SERVER:FIELDPUT("TIPOENT","T")	

END CLASS
