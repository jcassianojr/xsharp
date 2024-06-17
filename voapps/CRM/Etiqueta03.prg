#region DEFINES
STATIC DEFINE ETIQ03_BTNPEGMA01 := 126 
STATIC DEFINE ETIQ03_BTNPEGMS01 := 124 
STATIC DEFINE ETIQ03_CANCELAR := 121 
STATIC DEFINE ETIQ03_CLIENTE := 115 
STATIC DEFINE ETIQ03_CODIGO := 112 
STATIC DEFINE ETIQ03_CONFIMP := 122 
STATIC DEFINE ETIQ03_DATA := 111 
STATIC DEFINE ETIQ03_ESCCOD := 125 
STATIC DEFINE ETIQ03_ESCFOR := 127 
STATIC DEFINE ETIQ03_ESPE := 108 
STATIC DEFINE ETIQ03_FIXEDTEXT1 := 120 
STATIC DEFINE ETIQ03_FIXEDTEXT2 := 119 
STATIC DEFINE ETIQ03_FOTO := 131 
STATIC DEFINE ETIQ03_IMPRIMIR := 123 
STATIC DEFINE ETIQ03_NCLI := 114 
STATIC DEFINE ETIQ03_NOME := 113 
STATIC DEFINE ETIQ03_QTAMO := 117 
STATIC DEFINE ETIQ03_RASTRO := 116 
STATIC DEFINE ETIQ03_REFNUM := 128 
STATIC DEFINE ETIQ03_SC_CLIENTE := 105 
STATIC DEFINE ETIQ03_SC_CODIGO := 104 
STATIC DEFINE ETIQ03_SC_DATA := 103 
STATIC DEFINE ETIQ03_SC_DESTINO2 := 130 
STATIC DEFINE ETIQ03_SC_ESPE := 100 
STATIC DEFINE ETIQ03_SC_QTAMO := 107 
STATIC DEFINE ETIQ03_SC_QTAMO1 := 129 
STATIC DEFINE ETIQ03_SC_RASTRO := 106 
STATIC DEFINE ETIQ03_SC_SETOR := 102 
STATIC DEFINE ETIQ03_SC_USUARIO := 101 
STATIC DEFINE ETIQ03_SETOR := 110 
STATIC DEFINE ETIQ03_THEFIXEDTEXT13 := 118 
STATIC DEFINE ETIQ03_USUARIO := 109 
#endregion

PARTIAL class ETIQ03 inherit DATADIALOG 

	protect oDCSC_ESPE as FIXEDTEXT
	protect oDCSC_USUARIO as FIXEDTEXT
	protect oDCSC_SETOR as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCSC_QTAMO as FIXEDTEXT
	protect oDCESPE as SINGLELINEEDIT
	protect oDCUSUARIO as SINGLELINEEDIT
	protect oDCSETOR as SINGLELINEEDIT
	protect oDCDATA as DATESLE
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCNCLI as RIGHTSLE
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCQTAMO as RIGHTSLE
	protect oDCtheFixedText13 as FIXEDTEXT
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCFixedText1 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oCCCONFIMP as PUSHBUTTON
	protect oCCimprimir as PUSHBUTTON
	protect oCCbtnpegms01 as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oCCbtnpegma01 as PUSHBUTTON
	protect oCCescfor as PUSHBUTTON
	protect oDCREFNUM as RIGHTSLE
	protect oDCSC_QTAMO1 as FIXEDTEXT
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
// 	instance ESPE 
// 	instance USUARIO 
// 	instance SETOR 
// 	instance DATA 
// 	instance CODIGO 
// 	instance NOME 
// 	instance NCLI 
// 	instance CLIENTE 
// 	instance RASTRO 
// 	instance QTAMO 
// 	instance REFNUM 

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


METHOD CONFIMP( ) 
			LOCAL oPrinter AS PrintingDevice
	
	oPrinter := PrintingDevice{}
	oPrinter:Setup()

access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access ESPE() 
return self:FieldGet(#ESPE)


assign ESPE(uValue) 
self:FieldPut(#ESPE, uValue)
return ESPE := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"ETIQ03",_GetInst()},iCtlID)

oDCSC_ESPE := FixedText{self,ResourceID{ETIQ03_SC_ESPE,_GetInst()}}
oDCSC_ESPE:HyperLabel := HyperLabel{#SC_ESPE,"Especificado:",NULL_STRING,NULL_STRING}

oDCSC_USUARIO := FixedText{self,ResourceID{ETIQ03_SC_USUARIO,_GetInst()}}
oDCSC_USUARIO:HyperLabel := HyperLabel{#SC_USUARIO,"Usuario:",NULL_STRING,NULL_STRING}

oDCSC_SETOR := FixedText{self,ResourceID{ETIQ03_SC_SETOR,_GetInst()}}
oDCSC_SETOR:HyperLabel := HyperLabel{#SC_SETOR,"Setor:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{ETIQ03_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{ETIQ03_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{ETIQ03_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{ETIQ03_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCSC_QTAMO := FixedText{self,ResourceID{ETIQ03_SC_QTAMO,_GetInst()}}
oDCSC_QTAMO:HyperLabel := HyperLabel{#SC_QTAMO,"Qtde",NULL_STRING,NULL_STRING}

oDCESPE := SingleLineEdit{self,ResourceID{ETIQ03_ESPE,_GetInst()}}
oDCESPE:FieldSpec := PADRAO_CHAR_80{}
oDCESPE:HyperLabel := HyperLabel{#ESPE,"Espe:",NULL_STRING,"CRME03_ESPE"}

oDCUSUARIO := SingleLineEdit{self,ResourceID{ETIQ03_USUARIO,_GetInst()}}
oDCUSUARIO:FieldSpec := PADRAO_CHAR_10{}
oDCUSUARIO:HyperLabel := HyperLabel{#USUARIO,"Usuario:",NULL_STRING,"CRME03_USUARIO"}

oDCSETOR := SingleLineEdit{self,ResourceID{ETIQ03_SETOR,_GetInst()}}
oDCSETOR:FieldSpec := PADRAO_CHAR_30{}
oDCSETOR:HyperLabel := HyperLabel{#SETOR,"Setor:",NULL_STRING,"CRME03_SETOR"}

oDCDATA := DateSle{self,ResourceID{ETIQ03_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"CRME03_DATA"}

oDCCODIGO := SingleLineEdit{self,ResourceID{ETIQ03_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"CRME03_CODIGO"}

oDCNOME := SingleLineEdit{self,ResourceID{ETIQ03_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"CRME03_NOME"}

oDCNCLI := rightSle{self,ResourceID{ETIQ03_NCLI,_GetInst()}}
oDCNCLI:FieldSpec := PADRAO_NUM_08{}
oDCNCLI:HyperLabel := HyperLabel{#NCLI,"Ncli:",NULL_STRING,"CRME03_NCLI"}

oDCCLIENTE := SingleLineEdit{self,ResourceID{ETIQ03_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_CHAR_30{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"CRME03_CLIENTE"}

oDCRASTRO := SingleLineEdit{self,ResourceID{ETIQ03_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := PADRAO_CHAR_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"CRME03_RASTRO"}

oDCQTAMO := rightSle{self,ResourceID{ETIQ03_QTAMO,_GetInst()}}
oDCQTAMO:FieldSpec := PADRAO_NUM_12{}
oDCQTAMO:HyperLabel := HyperLabel{#QTAMO,"1",NULL_STRING,"CRME03_QTAMO"}

oDCtheFixedText13 := FixedText{self,ResourceID{ETIQ03_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Retornar",NULL_STRING,NULL_STRING}

oDCFixedText2 := FixedText{self,ResourceID{ETIQ03_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Conf Imp",NULL_STRING,NULL_STRING}

oDCFixedText1 := FixedText{self,ResourceID{ETIQ03_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Imprimir",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{ETIQ03_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}

oCCCONFIMP := PushButton{self,ResourceID{ETIQ03_CONFIMP,_GetInst()}}
oCCCONFIMP:HyperLabel := HyperLabel{#CONFIMP,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCONFIMP:Image := ICO_PRINTCFG{}

oCCimprimir := PushButton{self,ResourceID{ETIQ03_IMPRIMIR,_GetInst()}}
oCCimprimir:HyperLabel := HyperLabel{#imprimir,NULL_STRING,NULL_STRING,NULL_STRING}
oCCimprimir:Image := ICO_PRINT{}

oCCbtnpegms01 := PushButton{self,ResourceID{ETIQ03_BTNPEGMS01,_GetInst()}}
oCCbtnpegms01:HyperLabel := HyperLabel{#btnpegms01,"-->",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{ETIQ03_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oCCbtnpegma01 := PushButton{self,ResourceID{ETIQ03_BTNPEGMA01,_GetInst()}}
oCCbtnpegma01:HyperLabel := HyperLabel{#btnpegma01,"-->",NULL_STRING,NULL_STRING}

oCCescfor := PushButton{self,ResourceID{ETIQ03_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}

oDCREFNUM := rightSle{self,ResourceID{ETIQ03_REFNUM,_GetInst()}}
oDCREFNUM:FieldSpec := PADRAO_NUM_08{}
oDCREFNUM:HyperLabel := HyperLabel{#REFNUM,"Qtamo:",NULL_STRING,"CRME03_QTAMO"}

oDCSC_QTAMO1 := FixedText{self,ResourceID{ETIQ03_SC_QTAMO1,_GetInst()}}
oDCSC_QTAMO1:HyperLabel := HyperLabel{#SC_QTAMO1,"Referencia",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{ETIQ03_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{ETIQ03_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

self:Caption := "Solicitacao de Teste e Inspecao Laboratório"
self:HyperLabel := HyperLabel{#ETIQ03,"Solicitacao de Teste e Inspecao Laboratório",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NCLI() 
return self:FieldGet(#NCLI)


assign NCLI(uValue) 
self:FieldPut(#NCLI, uValue)
return NCLI := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access QTAMO() 
return self:FieldGet(#QTAMO)


assign QTAMO(uValue) 
self:FieldPut(#QTAMO, uValue)
return QTAMO := uValue


access RASTRO() 
return self:FieldGet(#RASTRO)


assign RASTRO(uValue) 
self:FieldPut(#RASTRO, uValue)
return RASTRO := uValue


access REFNUM() 
return self:FieldGet(#REFNUM)


assign REFNUM(uValue) 
self:FieldPut(#REFNUM, uValue)
return REFNUM := uValue


access SETOR() 
return self:FieldGet(#SETOR)


assign SETOR(uValue) 
self:FieldPut(#SETOR, uValue)
return SETOR := uValue


access USUARIO() 
return self:FieldGet(#USUARIO)


assign USUARIO(uValue) 
self:FieldPut(#USUARIO, uValue)
return USUARIO := uValue


END CLASS
