#region DEFINES
STATIC DEFINE JIMPEDI_ACUMULADA := 132 
STATIC DEFINE JIMPEDI_ACUSEMANA := 125 
STATIC DEFINE JIMPEDI_APAGARANT := 112 
STATIC DEFINE JIMPEDI_ATEPLANTA := 105 
STATIC DEFINE JIMPEDI_CAMINHO := 106 
STATIC DEFINE JIMPEDI_CANCELAR := 108 
STATIC DEFINE JIMPEDI_CHKGERARRND := 134 
STATIC DEFINE JIMPEDI_CHKLOG := 128 
STATIC DEFINE JIMPEDI_CHKSTK := 133 
STATIC DEFINE JIMPEDI_CMDAPAGAR := 122 
STATIC DEFINE JIMPEDI_CMDESCARQ := 119 
STATIC DEFINE JIMPEDI_DAPLANTA := 104 
STATIC DEFINE JIMPEDI_DFIM := 101 
STATIC DEFINE JIMPEDI_DIMPF := 103 
STATIC DEFINE JIMPEDI_DIMPI := 102 
STATIC DEFINE JIMPEDI_DINI := 100 
STATIC DEFINE JIMPEDI_EXPORTAR := 131 
STATIC DEFINE JIMPEDI_FIXEDTEXT2 := 111 
STATIC DEFINE JIMPEDI_FIXEDTEXT3 := 114 
STATIC DEFINE JIMPEDI_FIXEDTEXT4 := 115 
STATIC DEFINE JIMPEDI_FIXEDTEXT5 := 117 
STATIC DEFINE JIMPEDI_OK := 110 
STATIC DEFINE JIMPEDI_PONTO := 113 
STATIC DEFINE JIMPEDI_PRODUTO := 116 
STATIC DEFINE JIMPEDI_PROGBAR := 127 
STATIC DEFINE JIMPEDI_PUSHBUTTON5 := 129 
STATIC DEFINE JIMPEDI_PUSHBUTTON8 := 130 
STATIC DEFINE JIMPEDI_RECRIA := 120 
STATIC DEFINE JIMPEDI_REGISTRO := 118 
STATIC DEFINE JIMPEDI_SEMANA := 126 
STATIC DEFINE JIMPEDI_SEMORDEM := 121 
STATIC DEFINE JIMPEDI_SQLLOGIX := 124 
STATIC DEFINE JIMPEDI_SQLSERVER := 123 
STATIC DEFINE JIMPEDI_THEFIXEDTEXT10 := 109 
STATIC DEFINE JIMPEDI_THEFIXEDTEXT9 := 107 
#endregion

PARTIAL class jimpedi inherit DATADIALOG 

	protect oDCDINI as DATESLE
	protect oDCDFIM as DATESLE
	protect oDCDIMPI as DATESLE
	protect oDCDIMPF as DATESLE
	protect oDCdaplanta as SINGLELINEEDIT
	protect oDCateplanta as SINGLELINEEDIT
	protect oDCcaminho as SINGLELINEEDIT
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCok as PUSHBUTTON
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCApagarANT as CHECKBOX
	protect oDCPonto as CHECKBOX
	protect oDCFixedText3 as FIXEDTEXT
	protect oDCFixedText4 as FIXEDTEXT
	protect oDCproduto as FIXEDTEXT
	protect oDCFixedText5 as FIXEDTEXT
	protect oDCregistro as FIXEDTEXT
	protect oCCcmdescarq as PUSHBUTTON
	protect oDCrecria as CHECKBOX
	protect oDCsemordem as CHECKBOX
	protect oCCcmdapagar as PUSHBUTTON
	protect oDCsqlserver as CHECKBOX
	protect oDCsqllogix as CHECKBOX
	protect oCCAcuSemana as PUSHBUTTON
	protect oDCsemana as RIGHTSLE
	protect oDCProgBar as PROGRESSBAR
	protect oDCchklog as CHECKBOX
	protect oCCPushButton5 as PUSHBUTTON
	protect oCCPushButton8 as PUSHBUTTON
	protect oCCExportar as PUSHBUTTON
	protect oCCAcumulada as PUSHBUTTON
	protect oDCchkstk as CHECKBOX
	protect oDCchkGerarRnd as CHECKBOX
// 	instance DINI 
// 	instance DFIM 
// 	instance DIMPI 
// 	instance DIMPF 
// 	instance daplanta 
// 	instance ateplanta 
// 	instance caminho 
// 	instance ApagarANT 
// 	instance Ponto 
// 	instance recria 
// 	instance semordem 
// 	instance sqlserver 
// 	instance sqllogix 
// 	instance semana 
// 	instance chklog 
// 	instance chkstk 
// 	instance chkGerarRnd 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ApagarANT() 
return self:FieldGet(#ApagarANT)


assign ApagarANT(uValue) 
self:FieldPut(#ApagarANT, uValue)
return ApagarANT := uValue


access ateplanta() 
return self:FieldGet(#ateplanta)


assign ateplanta(uValue) 
self:FieldPut(#ateplanta, uValue)
return ateplanta := uValue


access caminho() 
return self:FieldGet(#caminho)


assign caminho(uValue) 
self:FieldPut(#caminho, uValue)
return caminho := uValue


access chkGerarRnd() 
return self:FieldGet(#chkGerarRnd)


assign chkGerarRnd(uValue) 
self:FieldPut(#chkGerarRnd, uValue)
return chkGerarRnd := uValue


access chklog() 
return self:FieldGet(#chklog)


assign chklog(uValue) 
self:FieldPut(#chklog, uValue)
return chklog := uValue


access chkstk() 
return self:FieldGet(#chkstk)


assign chkstk(uValue) 
self:FieldPut(#chkstk, uValue)
return chkstk := uValue


access daplanta() 
return self:FieldGet(#daplanta)


assign daplanta(uValue) 
self:FieldPut(#daplanta, uValue)
return daplanta := uValue


access DFIM() 
return self:FieldGet(#DFIM)


assign DFIM(uValue) 
self:FieldPut(#DFIM, uValue)
return DFIM := uValue


access DIMPF() 
return self:FieldGet(#DIMPF)


assign DIMPF(uValue) 
self:FieldPut(#DIMPF, uValue)
return DIMPF := uValue


access DIMPI() 
return self:FieldGet(#DIMPI)


assign DIMPI(uValue) 
self:FieldPut(#DIMPI, uValue)
return DIMPI := uValue


access DINI() 
return self:FieldGet(#DINI)


assign DINI(uValue) 
self:FieldPut(#DINI, uValue)
return DINI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jimpedi",_GetInst()},iCtlID)

oDCDINI := DateSle{self,ResourceID{JIMPEDI_DINI,_GetInst()}}
oDCDINI:HyperLabel := HyperLabel{#DINI,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDINI:FieldSpec := DATE_FIELD{}

oDCDFIM := DateSle{self,ResourceID{JIMPEDI_DFIM,_GetInst()}}
oDCDFIM:HyperLabel := HyperLabel{#DFIM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDFIM:FieldSpec := DATE_FIELD{}

oDCDIMPI := DateSle{self,ResourceID{JIMPEDI_DIMPI,_GetInst()}}
oDCDIMPI:HyperLabel := HyperLabel{#DIMPI,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDIMPI:FieldSpec := DATE_FIELD{}

oDCDIMPF := DateSle{self,ResourceID{JIMPEDI_DIMPF,_GetInst()}}
oDCDIMPF:HyperLabel := HyperLabel{#DIMPF,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDIMPF:FieldSpec := DATE_FIELD{}

oDCdaplanta := SingleLineEdit{self,ResourceID{JIMPEDI_DAPLANTA,_GetInst()}}
oDCdaplanta:HyperLabel := HyperLabel{#daplanta,NULL_STRING,NULL_STRING,NULL_STRING}
oDCdaplanta:TooltipText := "Localização do Arquivo"
oDCdaplanta:FieldSpec := padrao_CHAR_10{}

oDCateplanta := SingleLineEdit{self,ResourceID{JIMPEDI_ATEPLANTA,_GetInst()}}
oDCateplanta:HyperLabel := HyperLabel{#ateplanta,NULL_STRING,NULL_STRING,NULL_STRING}
oDCateplanta:TooltipText := "Localização do Arquivo"
oDCateplanta:FieldSpec := padrao_CHAR_10{}

oDCcaminho := SingleLineEdit{self,ResourceID{JIMPEDI_CAMINHO,_GetInst()}}
oDCcaminho:HyperLabel := HyperLabel{#caminho,NULL_STRING,NULL_STRING,NULL_STRING}
oDCcaminho:TooltipText := "Localização do Arquivo"

oDCtheFixedText9 := FixedText{self,ResourceID{JIMPEDI_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Cancelar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JIMPEDI_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}
oCCCancelar:TooltipText := "Clique para Cancelar"

oDCtheFixedText10 := FixedText{self,ResourceID{JIMPEDI_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCok := PushButton{self,ResourceID{JIMPEDI_OK,_GetInst()}}
oCCok:HyperLabel := HyperLabel{#ok,NULL_STRING,NULL_STRING,NULL_STRING}
oCCok:Image := ico_ok{}
oCCok:TooltipText := "Clique Para Inciar a Impotação"

oDCFixedText2 := FixedText{self,ResourceID{JIMPEDI_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Caminho do Arquivo",NULL_STRING,NULL_STRING}

oDCApagarANT := CheckBox{self,ResourceID{JIMPEDI_APAGARANT,_GetInst()}}
oDCApagarANT:HyperLabel := HyperLabel{#ApagarANT,"Apagar Anterior",NULL_STRING,NULL_STRING}
oDCApagarANT:TooltipText := "Marque Para Apagar Toda Progamação Importada "

oDCPonto := CheckBox{self,ResourceID{JIMPEDI_PONTO,_GetInst()}}
oDCPonto:HyperLabel := HyperLabel{#Ponto,"Incluir Pontuação",NULL_STRING,NULL_STRING}
oDCPonto:TooltipText := "Ajusta Codigo GM  para  mascaara 99.999.999"

oDCFixedText3 := FixedText{self,ResourceID{JIMPEDI_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Periodo Programação(Data Entrega)",NULL_STRING,NULL_STRING}

oDCFixedText4 := FixedText{self,ResourceID{JIMPEDI_FIXEDTEXT4,_GetInst()}}
oDCFixedText4:HyperLabel := HyperLabel{#FixedText4,"Periodo Arquivo (Data Geracao Prg)",NULL_STRING,NULL_STRING}

oDCproduto := FixedText{self,ResourceID{JIMPEDI_PRODUTO,_GetInst()}}
oDCproduto:HyperLabel := HyperLabel{#produto,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText5 := FixedText{self,ResourceID{JIMPEDI_FIXEDTEXT5,_GetInst()}}
oDCFixedText5:HyperLabel := HyperLabel{#FixedText5,"Grupo Planta",NULL_STRING,NULL_STRING}

oDCregistro := FixedText{self,ResourceID{JIMPEDI_REGISTRO,_GetInst()}}
oDCregistro:HyperLabel := HyperLabel{#registro,NULL_STRING,NULL_STRING,NULL_STRING}

oCCcmdescarq := PushButton{self,ResourceID{JIMPEDI_CMDESCARQ,_GetInst()}}
oCCcmdescarq:HyperLabel := HyperLabel{#cmdescarq,"...",NULL_STRING,NULL_STRING}

oDCrecria := CheckBox{self,ResourceID{JIMPEDI_RECRIA,_GetInst()}}
oDCrecria:HyperLabel := HyperLabel{#recria,"Recriar Arquivos ",NULL_STRING,NULL_STRING}
oDCrecria:TooltipText := "Ajusta Codigo GM  para  mascaara 99.999.999"

oDCsemordem := CheckBox{self,ResourceID{JIMPEDI_SEMORDEM,_GetInst()}}
oDCsemordem:HyperLabel := HyperLabel{#semordem,"Ignorar Ordem Arquivo",NULL_STRING,NULL_STRING}

oCCcmdapagar := PushButton{self,ResourceID{JIMPEDI_CMDAPAGAR,_GetInst()}}
oCCcmdapagar:HyperLabel := HyperLabel{#cmdapagar,"Apagar",NULL_STRING,NULL_STRING}

oDCsqlserver := CheckBox{self,ResourceID{JIMPEDI_SQLSERVER,_GetInst()}}
oDCsqlserver:HyperLabel := HyperLabel{#sqlserver,"Conecao  SQL Server EDI",NULL_STRING,NULL_STRING}

oDCsqllogix := CheckBox{self,ResourceID{JIMPEDI_SQLLOGIX,_GetInst()}}
oDCsqllogix:HyperLabel := HyperLabel{#sqllogix,"Importar LX",NULL_STRING,NULL_STRING}

oCCAcuSemana := PushButton{self,ResourceID{JIMPEDI_ACUSEMANA,_GetInst()}}
oCCAcuSemana:HyperLabel := HyperLabel{#AcuSemana,"Acumular Semanal",NULL_STRING,NULL_STRING}

oDCsemana := rightSle{self,ResourceID{JIMPEDI_SEMANA,_GetInst()}}
oDCsemana:FieldSpec := padrao_num_02{}
oDCsemana:HyperLabel := HyperLabel{#semana,"8",NULL_STRING,NULL_STRING}

oDCProgBar := ProgressBar{self,ResourceID{JIMPEDI_PROGBAR,_GetInst()}}
oDCProgBar:Range := Range{0,100}
oDCProgBar:HyperLabel := HyperLabel{#ProgBar,NULL_STRING,NULL_STRING,NULL_STRING}

oDCchklog := CheckBox{self,ResourceID{JIMPEDI_CHKLOG,_GetInst()}}
oDCchklog:HyperLabel := HyperLabel{#chklog,"Gerar Log",NULL_STRING,NULL_STRING}

oCCPushButton5 := PushButton{self,ResourceID{JIMPEDI_PUSHBUTTON5,_GetInst()}}
oCCPushButton5:HyperLabel := HyperLabel{#PushButton5,"+1",NULL_STRING,NULL_STRING}

oCCPushButton8 := PushButton{self,ResourceID{JIMPEDI_PUSHBUTTON8,_GetInst()}}
oCCPushButton8:HyperLabel := HyperLabel{#PushButton8,"+1",NULL_STRING,NULL_STRING}

oCCExportar := PushButton{self,ResourceID{JIMPEDI_EXPORTAR,_GetInst()}}
oCCExportar:HyperLabel := HyperLabel{#Exportar,"Exportar",NULL_STRING,NULL_STRING}

oCCAcumulada := PushButton{self,ResourceID{JIMPEDI_ACUMULADA,_GetInst()}}
oCCAcumulada:HyperLabel := HyperLabel{#Acumulada,"Acumular Evolução",NULL_STRING,NULL_STRING}

oDCchkstk := CheckBox{self,ResourceID{JIMPEDI_CHKSTK,_GetInst()}}
oDCchkstk:HyperLabel := HyperLabel{#chkstk,"Importar Estoquista",NULL_STRING,NULL_STRING}

oDCchkGerarRnd := CheckBox{self,ResourceID{JIMPEDI_CHKGERARRND,_GetInst()}}
oDCchkGerarRnd:HyperLabel := HyperLabel{#chkGerarRnd,"Gerar RND",NULL_STRING,NULL_STRING}

self:Caption := "Importar Programacao"
self:HyperLabel := HyperLabel{#jimpedi,"Importar Programacao",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access Ponto() 
return self:FieldGet(#Ponto)


assign Ponto(uValue) 
self:FieldPut(#Ponto, uValue)
return Ponto := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		    FabCenterWindow( SELF )
	RETURN NIL


access recria() 
return self:FieldGet(#recria)


assign recria(uValue) 
self:FieldPut(#recria, uValue)
return recria := uValue


access semana() 
return self:FieldGet(#semana)


assign semana(uValue) 
self:FieldPut(#semana, uValue)
return semana := uValue


access semordem() 
return self:FieldGet(#semordem)


assign semordem(uValue) 
self:FieldPut(#semordem, uValue)
return semordem := uValue


access sqllogix() 
return self:FieldGet(#sqllogix)


assign sqllogix(uValue) 
self:FieldPut(#sqllogix, uValue)
return sqllogix := uValue


access sqlserver() 
return self:FieldGet(#sqlserver)


assign sqlserver(uValue) 
self:FieldPut(#sqlserver, uValue)
return sqlserver := uValue


END CLASS
