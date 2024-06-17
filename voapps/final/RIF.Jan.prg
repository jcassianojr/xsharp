#region DEFINES
STATIC DEFINE JRIF_ALTERAR := 128 
STATIC DEFINE JRIF_ANTERIOR := 126 
STATIC DEFINE JRIF_BUSCAOV := 139 
STATIC DEFINE JRIF_CHKCLIPRO := 149 
STATIC DEFINE JRIF_CLIENTE := 115 
STATIC DEFINE JRIF_CLINOME := 116 
STATIC DEFINE JRIF_CMDALTDEF := 146 
STATIC DEFINE JRIF_CMDIMP := 135 
STATIC DEFINE JRIF_CMDTRCRAS := 147 
STATIC DEFINE JRIF_CODIGO := 117 
STATIC DEFINE JRIF_CODIGOINT := 148 
STATIC DEFINE JRIF_DATA := 136 
STATIC DEFINE JRIF_EXCLUIR := 129 
STATIC DEFINE JRIF_FECHAR := 134 
STATIC DEFINE JRIF_FOTO := 142 
STATIC DEFINE JRIF_INSNOM := 123 
STATIC DEFINE JRIF_INSNUM := 122 
STATIC DEFINE JRIF_ISIII := 121 
STATIC DEFINE JRIF_JRIFI := 124 
STATIC DEFINE JRIF_LAUDO := 143 
STATIC DEFINE JRIF_NOME := 118 
STATIC DEFINE JRIF_OK1 := 131 
STATIC DEFINE JRIF_OKRIF := 130 
STATIC DEFINE JRIF_OS := 120 
STATIC DEFINE JRIF_PCFTIPO := 133 
STATIC DEFINE JRIF_PEGSEV := 101 
STATIC DEFINE JRIF_PF := 114 
STATIC DEFINE JRIF_POROV := 138 
STATIC DEFINE JRIF_PROXIMO := 125 
STATIC DEFINE JRIF_QTDE := 100 
STATIC DEFINE JRIF_RASTRO := 102 
STATIC DEFINE JRIF_REVDATA := 119 
STATIC DEFINE JRIF_RIF := 113 
STATIC DEFINE JRIF_SC_CLIENTE := 105 
STATIC DEFINE JRIF_SC_CODIGO := 106 
STATIC DEFINE JRIF_SC_DESTINO2 := 141 
STATIC DEFINE JRIF_SC_INSNUM := 112 
STATIC DEFINE JRIF_SC_ISIII := 110 
STATIC DEFINE JRIF_SC_OS := 109 
STATIC DEFINE JRIF_SC_OS1 := 137 
STATIC DEFINE JRIF_SC_PCFTIPO := 132 
STATIC DEFINE JRIF_SC_PF := 104 
STATIC DEFINE JRIF_SC_PF1 := 144 
STATIC DEFINE JRIF_SC_PF2 := 145 
STATIC DEFINE JRIF_SC_QTDE := 108 
STATIC DEFINE JRIF_SC_RASTRO := 111 
STATIC DEFINE JRIF_SC_REVISAO := 107 
STATIC DEFINE JRIF_SC_RIF := 103 
STATIC DEFINE JRIF_TABULAR := 127 
STATIC DEFINE JRIF_TRCDATA := 140 
#endregion

class JRIF inherit MYDataWindow 

	PROTECT oDBRIF as DataColumn
	PROTECT oDBOS as DataColumn
	PROTECT oDBPF as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCLINOME as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBQTDE as DataColumn
	PROTECT oDBRASTRO as DataColumn
	PROTECT oDBPCFTIPO as DataColumn
	protect oDCQTDE as RIGHTSLE
	protect oCCpegsev as PUSHBUTTON
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCSC_RIF as FIXEDTEXT
	protect oDCSC_PF as FIXEDTEXT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_REVISAO as FIXEDTEXT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCSC_OS as FIXEDTEXT
	protect oDCSC_ISIII as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCSC_INSNUM as FIXEDTEXT
	protect oDCRIF as SINGLELINEEDIT
	protect oDCPF as SINGLELINEEDIT
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCCLINOME as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCREVDATA as SINGLELINEEDIT
	protect oDCOS as SINGLELINEEDIT
	protect oDCISIII as SINGLELINEEDIT
	protect oDCINSNUM as SINGLELINEEDIT
	protect oDCINSNOM as SINGLELINEEDIT
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCTabular as PUSHBUTTON
	protect oCCAlterar as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCOKrif as PUSHBUTTON
	protect oCCOK1 as PUSHBUTTON
	protect oDCSC_PCFTIPO as FIXEDTEXT
	protect oDCPCFTIPO as SINGLELINEEDIT
	protect oCCFechar as PUSHBUTTON
	protect oCCcmdimp as PUSHBUTTON
	protect oDCDATA as SINGLELINEEDIT
	protect oDCSC_OS1 as FIXEDTEXT
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oCCtrcdata as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oDCLAUDO as SINGLELINEEDIT
	protect oDCSC_PF1 as FIXEDTEXT
	protect oDCSC_PF2 as FIXEDTEXT
	protect oCCcmdaltdef as PUSHBUTTON
	protect oCCcmdtrcras as PUSHBUTTON
	protect oDCCODIGOINT as SINGLELINEEDIT
	protect oCCchkclipro as PUSHBUTTON
// 	instance QTDE 
// 	instance RASTRO 
// 	instance RIF 
// 	instance PF 
// 	instance CLIENTE 
// 	instance CLINOME 
// 	instance CODIGO 
// 	instance NOME 
// 	instance REVDATA 
// 	instance OS 
// 	instance ISIII 
// 	instance INSNUM 
// 	instance INSNOM 
// 	instance PCFTIPO 
// 	instance DATA 
// 	instance LAUDO 
// 	instance CODIGOINT 
	protect oSFjrifi as jrifi

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CLIENTE() 
return self:FieldGet(#CLIENTE)


assign CLIENTE(uValue) 
self:FieldPut(#CLIENTE, uValue)
return CLIENTE := uValue


access CLINOME() 
return self:FieldGet(#CLINOME)


assign CLINOME(uValue) 
self:FieldPut(#CLINOME, uValue)
return CLINOME := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODIGOINT() 
return self:FieldGet(#CODIGOINT)


assign CODIGOINT(uValue) 
self:FieldPut(#CODIGOINT, uValue)
return CODIGOINT := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRIF",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Trebuchet MS"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCQTDE := rightSle{self,ResourceID{JRIF_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := PADRAO_NUM_08{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"RIF_QTDE"}

oCCpegsev := PushButton{self,ResourceID{JRIF_PEGSEV,_GetInst()}}
oCCpegsev:HyperLabel := HyperLabel{#pegsev,_chr(38)+"Q-->",NULL_STRING,NULL_STRING}

oDCRASTRO := SingleLineEdit{self,ResourceID{JRIF_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := PADRAO_CHAR_14{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"RIF_RASTRO"}
oDCRASTRO:BackGround := aBrushes[1]
oDCRASTRO:Font(aFonts[1], FALSE)

oDCSC_RIF := FixedText{self,ResourceID{JRIF_SC_RIF,_GetInst()}}
oDCSC_RIF:HyperLabel := HyperLabel{#SC_RIF,"Rif:",NULL_STRING,NULL_STRING}

oDCSC_PF := FixedText{self,ResourceID{JRIF_SC_PF,_GetInst()}}
oDCSC_PF:HyperLabel := HyperLabel{#SC_PF,"Pf:",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{JRIF_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JRIF_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_REVISAO := FixedText{self,ResourceID{JRIF_SC_REVISAO,_GetInst()}}
oDCSC_REVISAO:HyperLabel := HyperLabel{#SC_REVISAO,"Rev:",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{self,ResourceID{JRIF_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCSC_OS := FixedText{self,ResourceID{JRIF_SC_OS,_GetInst()}}
oDCSC_OS:HyperLabel := HyperLabel{#SC_OS,"Os:",NULL_STRING,NULL_STRING}

oDCSC_ISIII := FixedText{self,ResourceID{JRIF_SC_ISIII,_GetInst()}}
oDCSC_ISIII:HyperLabel := HyperLabel{#SC_ISIII,"Isiii:",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{JRIF_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCSC_INSNUM := FixedText{self,ResourceID{JRIF_SC_INSNUM,_GetInst()}}
oDCSC_INSNUM:HyperLabel := HyperLabel{#SC_INSNUM,"Inspetor",NULL_STRING,NULL_STRING}

oDCRIF := SingleLineEdit{self,ResourceID{JRIF_RIF,_GetInst()}}
oDCRIF:FieldSpec := PADRAO_NUM_08{}
oDCRIF:HyperLabel := HyperLabel{#RIF,"Rif:",NULL_STRING,"RIF_RIF"}
oDCRIF:BackGround := aBrushes[1]
oDCRIF:Font(aFonts[1], FALSE)

oDCPF := SingleLineEdit{self,ResourceID{JRIF_PF,_GetInst()}}
oDCPF:FieldSpec := PADRAO_NUM_08{}
oDCPF:HyperLabel := HyperLabel{#PF,"Pf:",NULL_STRING,"RIF_PF"}
oDCPF:BackGround := aBrushes[1]
oDCPF:Font(aFonts[1], FALSE)

oDCCLIENTE := SingleLineEdit{self,ResourceID{JRIF_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"RIF_CLIENTE"}
oDCCLIENTE:BackGround := aBrushes[1]
oDCCLIENTE:Font(aFonts[1], FALSE)

oDCCLINOME := SingleLineEdit{self,ResourceID{JRIF_CLINOME,_GetInst()}}
oDCCLINOME:FieldSpec := PADRAO_CHAR_50{}
oDCCLINOME:HyperLabel := HyperLabel{#CLINOME,"Clinome:",NULL_STRING,"RIF_CLINOME"}
oDCCLINOME:BackGround := aBrushes[1]
oDCCLINOME:Font(aFonts[1], FALSE)

oDCCODIGO := SingleLineEdit{self,ResourceID{JRIF_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"RIF_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[1], FALSE)

oDCNOME := SingleLineEdit{self,ResourceID{JRIF_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"RIF_NOME"}
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[1], FALSE)

oDCREVDATA := SingleLineEdit{self,ResourceID{JRIF_REVDATA,_GetInst()}}
oDCREVDATA:FieldSpec := DATE_FIELD{}
oDCREVDATA:HyperLabel := HyperLabel{#REVDATA,"Revisao:",NULL_STRING,"RIF_REVISAO"}
oDCREVDATA:BackGround := aBrushes[1]
oDCREVDATA:Font(aFonts[1], FALSE)

oDCOS := SingleLineEdit{self,ResourceID{JRIF_OS,_GetInst()}}
oDCOS:FieldSpec := PADRAO_NUM_08_2{}
oDCOS:HyperLabel := HyperLabel{#OS,"Os:",NULL_STRING,"RIF_OS"}
oDCOS:BackGround := aBrushes[1]
oDCOS:Font(aFonts[1], FALSE)

oDCISIII := SingleLineEdit{self,ResourceID{JRIF_ISIII,_GetInst()}}
oDCISIII:FieldSpec := PADRAO_NUM_04{}
oDCISIII:HyperLabel := HyperLabel{#ISIII,"Isiii:",NULL_STRING,"RIF_ISIII"}
oDCISIII:BackGround := aBrushes[1]
oDCISIII:Font(aFonts[1], FALSE)

oDCINSNUM := SingleLineEdit{self,ResourceID{JRIF_INSNUM,_GetInst()}}
oDCINSNUM:FieldSpec := PADRAO_NUM_08{}
oDCINSNUM:HyperLabel := HyperLabel{#INSNUM,"Insnum:",NULL_STRING,"RIF_INSNUM"}
oDCINSNUM:BackGround := aBrushes[1]
oDCINSNUM:Font(aFonts[1], FALSE)

oDCINSNOM := SingleLineEdit{self,ResourceID{JRIF_INSNOM,_GetInst()}}
oDCINSNOM:FieldSpec := PADRAO_CHAR_40{}
oDCINSNOM:HyperLabel := HyperLabel{#INSNOM,"Insnom:",NULL_STRING,"RIF_INSNOM"}
oDCINSNOM:BackGround := aBrushes[1]
oDCINSNOM:Font(aFonts[1], FALSE)

oCCProximo := PushButton{self,ResourceID{JRIF_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_next{}

oCCAnterior := PushButton{self,ResourceID{JRIF_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_previous{}

oCCTabular := PushButton{self,ResourceID{JRIF_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Ver Itens",NULL_STRING,NULL_STRING}

oCCAlterar := PushButton{self,ResourceID{JRIF_ALTERAR,_GetInst()}}
oCCAlterar:HyperLabel := HyperLabel{#Alterar,"Alterar Item",NULL_STRING,NULL_STRING}

oCCExcluir := PushButton{self,ResourceID{JRIF_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}

oCCOKrif := PushButton{self,ResourceID{JRIF_OKRIF,_GetInst()}}
oCCOKrif:HyperLabel := HyperLabel{#OKrif,"OK",NULL_STRING,NULL_STRING}

oCCOK1 := PushButton{self,ResourceID{JRIF_OK1,_GetInst()}}
oCCOK1:HyperLabel := HyperLabel{#OK1,"Não OK",NULL_STRING,NULL_STRING}

oDCSC_PCFTIPO := FixedText{self,ResourceID{JRIF_SC_PCFTIPO,_GetInst()}}
oDCSC_PCFTIPO:HyperLabel := HyperLabel{#SC_PCFTIPO,"Tipo:",NULL_STRING,NULL_STRING}

oDCPCFTIPO := SingleLineEdit{self,ResourceID{JRIF_PCFTIPO,_GetInst()}}
oDCPCFTIPO:FieldSpec := PADRAO_CHAR_01{}
oDCPCFTIPO:HyperLabel := HyperLabel{#PCFTIPO,"Pcftipo:",NULL_STRING,"RIF_PCFTIPO"}
oDCPCFTIPO:BackGround := aBrushes[1]
oDCPCFTIPO:Font(aFonts[2], FALSE)

oCCFechar := PushButton{self,ResourceID{JRIF_FECHAR,_GetInst()}}
oCCFechar:HyperLabel := HyperLabel{#Fechar,_chr(38)+"Fechar",NULL_STRING,NULL_STRING}

oCCcmdimp := PushButton{self,ResourceID{JRIF_CMDIMP,_GetInst()}}
oCCcmdimp:HyperLabel := HyperLabel{#cmdimp,_chr(38)+"Imprimir Transferencia",NULL_STRING,NULL_STRING}

oDCDATA := SingleLineEdit{self,ResourceID{JRIF_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Os:",NULL_STRING,"RIF_OS"}
oDCDATA:BackGround := aBrushes[1]
oDCDATA:Font(aFonts[1], FALSE)

oDCSC_OS1 := FixedText{self,ResourceID{JRIF_SC_OS1,_GetInst()}}
oDCSC_OS1:HyperLabel := HyperLabel{#SC_OS1,"Data:",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JRIF_POROV,_GetInst()}}
oCCporov:Image := ico_az{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaov := PushButton{self,ResourceID{JRIF_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ico_find{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}

oCCtrcdata := PushButton{self,ResourceID{JRIF_TRCDATA,_GetInst()}}
oCCtrcdata:HyperLabel := HyperLabel{#trcdata,_chr(38)+"D...",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JRIF_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JRIF_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oDCLAUDO := SingleLineEdit{self,ResourceID{JRIF_LAUDO,_GetInst()}}
oDCLAUDO:FieldSpec := PADRAO_CHAR_01{}
oDCLAUDO:HyperLabel := HyperLabel{#LAUDO,"Pcftipo:",NULL_STRING,"RIF_PCFTIPO"}
oDCLAUDO:BackGround := aBrushes[1]
oDCLAUDO:Font(aFonts[1], FALSE)

oDCSC_PF1 := FixedText{self,ResourceID{JRIF_SC_PF1,_GetInst()}}
oDCSC_PF1:HyperLabel := HyperLabel{#SC_PF1,"Laudo",NULL_STRING,NULL_STRING}

oDCSC_PF2 := FixedText{self,ResourceID{JRIF_SC_PF2,_GetInst()}}
oDCSC_PF2:HyperLabel := HyperLabel{#SC_PF2,"(A)provado (R)eprovado",NULL_STRING,NULL_STRING}

oCCcmdaltdef := PushButton{self,ResourceID{JRIF_CMDALTDEF,_GetInst()}}
oCCcmdaltdef:HyperLabel := HyperLabel{#cmdaltdef,"Alt->Def",NULL_STRING,NULL_STRING}
oCCcmdaltdef:TooltipText := "Troca o Rastro Alternativo Pelo Difinitivo"

oCCcmdtrcras := PushButton{self,ResourceID{JRIF_CMDTRCRAS,_GetInst()}}
oCCcmdtrcras:TooltipText := "Troca o Rastro Atual"
oCCcmdtrcras:HyperLabel := HyperLabel{#cmdtrcras,"Nº Rastro",NULL_STRING,NULL_STRING}

oDCCODIGOINT := SingleLineEdit{self,ResourceID{JRIF_CODIGOINT,_GetInst()}}
oDCCODIGOINT:FieldSpec := padrao_CHAR_24{}
oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT,"Codigo Int",NULL_STRING,NULL_STRING}
oDCCODIGOINT:TooltipText := "Observações sobre entrega"
oDCCODIGOINT:BackGround := aBrushes[1]
oDCCODIGOINT:Font(aFonts[1], FALSE)

oCCchkclipro := PushButton{self,ResourceID{JRIF_CHKCLIPRO,_GetInst()}}
oCCchkclipro:HyperLabel := HyperLabel{#chkclipro,"Checar Cliente Produto",NULL_STRING,NULL_STRING}
oCCchkclipro:TooltipText := "Verificar os Nomes Clientes Produtos"

self:Caption := "RIF - Registro de Inspeção Final"
self:HyperLabel := HyperLabel{#JRIF,"RIF - Registro de Inspeção Final",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRIF := DataColumn{PADRAO_NUM_08{}}
oDBRIF:Width := 7
oDBRIF:HyperLabel := oDCRIF:HyperLabel 
oDBRIF:Caption := "Rif:"
oDBRIF:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRIF)

oDBOS := DataColumn{PADRAO_NUM_08_2{}}
oDBOS:Width := 7
oDBOS:HyperLabel := oDCOS:HyperLabel 
oDBOS:Caption := "Os:"
oDBOS:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOS)

oDBPF := DataColumn{PADRAO_NUM_08{}}
oDBPF:Width := 7
oDBPF:HyperLabel := oDCPF:HyperLabel 
oDBPF:Caption := "Pf:"
oDBPF:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBPF)

oDBCLIENTE := DataColumn{PADRAO_NUM_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
oDBCLIENTE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCLIENTE)

oDBCLINOME := DataColumn{PADRAO_CHAR_50{}}
oDBCLINOME:Width := 14
oDBCLINOME:HyperLabel := oDCCLINOME:HyperLabel 
oDBCLINOME:Caption := "Clinome:"
oDBCLINOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCLINOME)

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_40{}}
oDBNOME:Width := 24
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)

oDBQTDE := DataColumn{PADRAO_NUM_08{}}
oDBQTDE:Width := 6
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
self:Browser:AddColumn(oDBQTDE)

oDBRASTRO := DataColumn{PADRAO_CHAR_14{}}
oDBRASTRO:Width := 8
oDBRASTRO:HyperLabel := oDCRASTRO:HyperLabel 
oDBRASTRO:Caption := "Rastro:"
oDBRASTRO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRASTRO)

oDBPCFTIPO := DataColumn{PADRAO_CHAR_01{}}
oDBPCFTIPO:Width := 9
oDBPCFTIPO:HyperLabel := oDCPCFTIPO:HyperLabel 
oDBPCFTIPO:Caption := "Pcftipo:"
oDBPCFTIPO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBPCFTIPO)


self:ViewAs(#FormView)

oSFjrifi := jrifi{self,JRIF_JRIFI}
oSFjrifi:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access INSNOM() 
return self:FieldGet(#INSNOM)


assign INSNOM(uValue) 
self:FieldPut(#INSNOM, uValue)
return INSNOM := uValue


access INSNUM() 
return self:FieldGet(#INSNUM)


assign INSNUM(uValue) 
self:FieldPut(#INSNUM, uValue)
return INSNUM := uValue


access ISIII() 
return self:FieldGet(#ISIII)


assign ISIII(uValue) 
self:FieldPut(#ISIII, uValue)
return ISIII := uValue


access LAUDO() 
return self:FieldGet(#LAUDO)


assign LAUDO(uValue) 
self:FieldPut(#LAUDO, uValue)
return LAUDO := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access OS() 
return self:FieldGet(#OS)


assign OS(uValue) 
self:FieldPut(#OS, uValue)
return OS := uValue


access PCFTIPO() 
return self:FieldGet(#PCFTIPO)


assign PCFTIPO(uValue) 
self:FieldPut(#PCFTIPO, uValue)
return PCFTIPO := uValue


access PF() 
return self:FieldGet(#PF)


assign PF(uValue) 
self:FieldPut(#PF, uValue)
return PF := uValue


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


access REVDATA() 
return self:FieldGet(#REVDATA)


assign REVDATA(uValue) 
self:FieldPut(#REVDATA, uValue)
return REVDATA := uValue


access RIF() 
return self:FieldGet(#RIF)


assign RIF(uValue) 
self:FieldPut(#RIF, uValue)
return RIF := uValue


END CLASS
