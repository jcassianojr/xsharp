#region DEFINES
STATIC DEFINE JOPAE_BUSCANUM := 121 
STATIC DEFINE JOPAE_CLIENTE := 102 
STATIC DEFINE JOPAE_CMDLAUDO := 124 
STATIC DEFINE JOPAE_CODIGO := 101 
STATIC DEFINE JOPAE_CODMP04 := 106 
STATIC DEFINE JOPAE_DATA := 100 
STATIC DEFINE JOPAE_ESCFOR := 117 
STATIC DEFINE JOPAE_ESCRES := 122 
STATIC DEFINE JOPAE_FOTO := 119 
STATIC DEFINE JOPAE_JOPAI := 123 
STATIC DEFINE JOPAE_LOTE := 104 
STATIC DEFINE JOPAE_OCOR := 107 
STATIC DEFINE JOPAE_OPAE := 115 
STATIC DEFINE JOPAE_POROV := 120 
STATIC DEFINE JOPAE_QTDE := 105 
STATIC DEFINE JOPAE_RASTRO := 103 
STATIC DEFINE JOPAE_SC_CODIGO := 111 
STATIC DEFINE JOPAE_SC_CODMP04 := 108 
STATIC DEFINE JOPAE_SC_DATA := 110 
STATIC DEFINE JOPAE_SC_DESTINO2 := 118 
STATIC DEFINE JOPAE_SC_OCOR := 113 
STATIC DEFINE JOPAE_SC_OPAE := 109 
STATIC DEFINE JOPAE_SC_QTDE := 114 
STATIC DEFINE JOPAE_SC_QTDE1 := 116 
STATIC DEFINE JOPAE_SC_RASTRO := 112 
#endregion

PARTIAL class JOPAE inherit MYDataWindow 

	PROTECT oDBDATA as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBRASTRO as DataColumn
	PROTECT oDBLOTE as DataColumn
	PROTECT oDBQTDE as DataColumn
	PROTECT oDBCODMP04 as DataColumn
	PROTECT oDBOCOR as DataColumn
	PROTECT oDBOPAE as DataColumn
	protect oDCDATA as DATESLE
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCQTDE as SINGLELINEEDIT
	protect oDCCODMP04 as SINGLELINEEDIT
	protect oDCOCOR as SINGLELINEEDIT
	protect oDCSC_CODMP04 as FIXEDTEXT
	protect oDCSC_OPAE as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCSC_OCOR as FIXEDTEXT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCOPAE as SINGLELINEEDIT
	protect oDCSC_QTDE1 as FIXEDTEXT
	protect oCCescfor as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oCCESCRES as PUSHBUTTON
	protect oCCcmdlaudo as PUSHBUTTON
// 	instance DATA 
// 	instance CODIGO 
// 	instance CLIENTE 
// 	instance RASTRO 
// 	instance LOTE 
// 	instance QTDE 
// 	instance CODMP04 
// 	instance OCOR 
// 	instance OPAE 
	protect oSFJOPAI as JOPAI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CLIENTE() 
return self:FieldGet(#CLIENTE)


assign CLIENTE(uValue) 
self:FieldPut(#CLIENTE, uValue)
return CLIENTE := uValue


METHOD cmdlaudo( ) 
	SELF:oSFJOPAI:SERVER:FIELDPUT("LAUDO",SIMNAO(SELF:oSFJOPAI:FIELDGET("LAUDO"),{"A","R","C"}))

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODMP04() 
return self:FieldGet(#CODMP04)


assign CODMP04(uValue) 
self:FieldPut(#CODMP04, uValue)
return CODMP04 := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JOPAE",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,12,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDATA := DateSle{self,ResourceID{JOPAE_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"OPAE_DATA"}
oDCDATA:FocusSelect := FSEL_ALL

oDCCODIGO := SingleLineEdit{self,ResourceID{JOPAE_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"OPAE_CODIGO"}
oDCCODIGO:FocusSelect := FSEL_ALL
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[1], FALSE)

oDCCLIENTE := SingleLineEdit{self,ResourceID{JOPAE_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Qtde:",NULL_STRING,"OPAE_CLIENTE"}
oDCCLIENTE:FocusSelect := FSEL_ALL

oDCRASTRO := SingleLineEdit{self,ResourceID{JOPAE_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := PADRAO_CHAR_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"OPAE_RASTRO"}
oDCRASTRO:FocusSelect := FSEL_ALL

oDCQTDE := SingleLineEdit{self,ResourceID{JOPAE_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := PADRAO_NUM_10{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"OPAE_QTDE"}
oDCQTDE:FocusSelect := FSEL_ALL

oDCCODMP04 := SingleLineEdit{self,ResourceID{JOPAE_CODMP04,_GetInst()}}
oDCCODMP04:FieldSpec := PADRAO_NUM_08{}
oDCCODMP04:HyperLabel := HyperLabel{#CODMP04,"Codmp04:",NULL_STRING,"OPAE_CODMP04"}
oDCCODMP04:FocusSelect := FSEL_ALL

oDCOCOR := SingleLineEdit{self,ResourceID{JOPAE_OCOR,_GetInst()}}
oDCOCOR:FieldSpec := PADRAO_CHAR_100{}
oDCOCOR:HyperLabel := HyperLabel{#OCOR,"Ocor:",NULL_STRING,"OPAE_OCOR"}
oDCOCOR:FocusSelect := FSEL_ALL

oDCSC_CODMP04 := FixedText{self,ResourceID{JOPAE_SC_CODMP04,_GetInst()}}
oDCSC_CODMP04:HyperLabel := HyperLabel{#SC_CODMP04,"No.Funcionário",NULL_STRING,NULL_STRING}

oDCSC_OPAE := FixedText{self,ResourceID{JOPAE_SC_OPAE,_GetInst()}}
oDCSC_OPAE:HyperLabel := HyperLabel{#SC_OPAE,"Opae:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JOPAE_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JOPAE_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{JOPAE_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCSC_OCOR := FixedText{self,ResourceID{JOPAE_SC_OCOR,_GetInst()}}
oDCSC_OCOR:HyperLabel := HyperLabel{#SC_OCOR,"Ocorrência:",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{self,ResourceID{JOPAE_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCOPAE := SingleLineEdit{self,ResourceID{JOPAE_OPAE,_GetInst()}}
oDCOPAE:FieldSpec := PADRAO_NUM_08{}
oDCOPAE:HyperLabel := HyperLabel{#OPAE,"Opae:",NULL_STRING,"OPAE_OPAE"}
oDCOPAE:BackGround := aBrushes[1]
oDCOPAE:Font(aFonts[2], FALSE)

oDCSC_QTDE1 := FixedText{self,ResourceID{JOPAE_SC_QTDE1,_GetInst()}}
oDCSC_QTDE1:HyperLabel := HyperLabel{#SC_QTDE1,"Cliente",NULL_STRING,NULL_STRING}

oCCescfor := PushButton{self,ResourceID{JOPAE_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JOPAE_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JOPAE_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oCCporov := PushButton{self,ResourceID{JOPAE_POROV,_GetInst()}}
oCCporov:Image := ICO_AZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Organizar por Numero GC"

oCCbuscanum := PushButton{self,ResourceID{JOPAE_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Localizar um GC"

oCCESCRES := PushButton{self,ResourceID{JOPAE_ESCRES,_GetInst()}}
oCCESCRES:HyperLabel := HyperLabel{#ESCRES,"...",NULL_STRING,NULL_STRING}

oCCcmdlaudo := PushButton{self,ResourceID{JOPAE_CMDLAUDO,_GetInst()}}
oCCcmdlaudo:HyperLabel := HyperLabel{#cmdlaudo,"laudo",NULL_STRING,NULL_STRING}

self:Caption := "Ocorencia do Plano de Auditoria de Embarque"
self:HyperLabel := HyperLabel{#JOPAE,"Ocorencia do Plano de Auditoria de Embarque",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 6
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBCLIENTE := DataColumn{PADRAO_NUM_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Qtde:"
self:Browser:AddColumn(oDBCLIENTE)

oDBRASTRO := DataColumn{PADRAO_CHAR_12{}}
oDBRASTRO:Width := 8
oDBRASTRO:HyperLabel := oDCRASTRO:HyperLabel 
oDBRASTRO:Caption := "Rastro:"
self:Browser:AddColumn(oDBRASTRO)

oDBLOTE := DataColumn{PADRAO_CHAR_10{}}
oDBLOTE:Width := 6
oDBLOTE:HyperLabel := HyperLabel{#LOTE,"Lote:",NULL_STRING,"OPAE_LOTE"} 
oDBLOTE:Caption := "Lote:"
self:Browser:AddColumn(oDBLOTE)

oDBQTDE := DataColumn{PADRAO_NUM_10{}}
oDBQTDE:Width := 6
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
self:Browser:AddColumn(oDBQTDE)

oDBCODMP04 := DataColumn{PADRAO_NUM_08{}}
oDBCODMP04:Width := 9
oDBCODMP04:HyperLabel := oDCCODMP04:HyperLabel 
oDBCODMP04:Caption := "Codmp04:"
self:Browser:AddColumn(oDBCODMP04)

oDBOCOR := DataColumn{PADRAO_CHAR_100{}}
oDBOCOR:Width := 6
oDBOCOR:HyperLabel := oDCOCOR:HyperLabel 
oDBOCOR:Caption := "Ocor:"
self:Browser:AddColumn(oDBOCOR)

oDBOPAE := DataColumn{PADRAO_NUM_08{}}
oDBOPAE:Width := 6
oDBOPAE:HyperLabel := oDCOPAE:HyperLabel 
oDBOPAE:Caption := "Opae:"
oDBOPAE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOPAE)


self:ViewAs(#FormView)

oSFJOPAI := JOPAI{self,JOPAE_JOPAI}
oSFJOPAI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LOTE() 
return self:FieldGet(#LOTE)


assign LOTE(uValue) 
self:FieldPut(#LOTE, uValue)
return LOTE := uValue


access OCOR() 
return self:FieldGet(#OCOR)


assign OCOR(uValue) 
self:FieldPut(#OCOR, uValue)
return OCOR := uValue


access OPAE() 
return self:FieldGet(#OPAE)


assign OPAE(uValue) 
self:FieldPut(#OPAE, uValue)
return OPAE := uValue


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


END CLASS
