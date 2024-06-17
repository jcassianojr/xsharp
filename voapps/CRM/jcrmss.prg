#region DEFINES
STATIC DEFINE JCRMSS_APLICACAO := 117 
STATIC DEFINE JCRMSS_AR := 124 
STATIC DEFINE JCRMSS_BUSCANUM := 142 
STATIC DEFINE JCRMSS_CMDAGORA := 132 
STATIC DEFINE JCRMSS_CMDHOJE := 130 
STATIC DEFINE JCRMSS_CMDHOJE1 := 131 
STATIC DEFINE JCRMSS_CMDTRAPRO := 138 
STATIC DEFINE JCRMSS_CMDTRAPRO1 := 140 
STATIC DEFINE JCRMSS_CODIGO := 114 
STATIC DEFINE JCRMSS_CODIGOINT := 115 
STATIC DEFINE JCRMSS_DATA := 122 
STATIC DEFINE JCRMSS_DATAENV := 126 
STATIC DEFINE JCRMSS_ESCCOD := 136 
STATIC DEFINE JCRMSS_ESCCOD1 := 137 
STATIC DEFINE JCRMSS_ESCETI := 133 
STATIC DEFINE JCRMSS_ESCFOR := 129 
STATIC DEFINE JCRMSS_ESPE := 120 
STATIC DEFINE JCRMSS_FORNECEDO := 118 
STATIC DEFINE JCRMSS_FORNOME := 119 
STATIC DEFINE JCRMSS_FOTO := 144 
STATIC DEFINE JCRMSS_HORAENV := 127 
STATIC DEFINE JCRMSS_ITEM := 125 
STATIC DEFINE JCRMSS_NORMA := 116 
STATIC DEFINE JCRMSS_NUMERO := 113 
STATIC DEFINE JCRMSS_PEGAR := 139 
STATIC DEFINE JCRMSS_PEGETI := 134 
STATIC DEFINE JCRMSS_PEGFOR := 128 
STATIC DEFINE JCRMSS_PEGRIST := 135 
STATIC DEFINE JCRMSS_PORNUM := 141 
STATIC DEFINE JCRMSS_RASTRO := 121 
STATIC DEFINE JCRMSS_RIST := 123 
STATIC DEFINE JCRMSS_SC_APLICACAO := 104 
STATIC DEFINE JCRMSS_SC_AR := 110 
STATIC DEFINE JCRMSS_SC_CODIGO := 101 
STATIC DEFINE JCRMSS_SC_CODIGOINT := 102 
STATIC DEFINE JCRMSS_SC_DATA := 108 
STATIC DEFINE JCRMSS_SC_DATAENV := 111 
STATIC DEFINE JCRMSS_SC_DESTINO2 := 143 
STATIC DEFINE JCRMSS_SC_ESPE := 106 
STATIC DEFINE JCRMSS_SC_FORNECEDO := 105 
STATIC DEFINE JCRMSS_SC_HORAENV := 112 
STATIC DEFINE JCRMSS_SC_NORMA := 103 
STATIC DEFINE JCRMSS_SC_NUMERO := 100 
STATIC DEFINE JCRMSS_SC_RASTRO := 107 
STATIC DEFINE JCRMSS_SC_RIST := 109 
#endregion

class jcrmss inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBAPLICACAO as DataColumn
	PROTECT oDBRASTRO as DataColumn
	PROTECT oDBDATA as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_CODIGOINT as FIXEDTEXT
	protect oDCSC_NORMA as FIXEDTEXT
	protect oDCSC_APLICACAO as FIXEDTEXT
	protect oDCSC_FORNECEDO as FIXEDTEXT
	protect oDCSC_ESPE as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_RIST as FIXEDTEXT
	protect oDCSC_AR as FIXEDTEXT
	protect oDCSC_DATAENV as FIXEDTEXT
	protect oDCSC_HORAENV as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCCODIGOINT as SINGLELINEEDIT
	protect oDCNORMA as SINGLELINEEDIT
	protect oDCAPLICACAO as SINGLELINEEDIT
	protect oDCFORNECEDO as RIGHTSLE
	protect oDCFORNOME as SINGLELINEEDIT
	protect oDCESPE as SINGLELINEEDIT
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCDATA as DATESLE
	protect oDCRIST as SINGLELINEEDIT
	protect oDCAR as SINGLELINEEDIT
	protect oDCITEM as SINGLELINEEDIT
	protect oDCDATAENV as DATESLE
	protect oDCHORAENV as SINGLELINEEDIT
	protect oCCpegfor as PUSHBUTTON
	protect oCCESCFOR as PUSHBUTTON
	protect oCCcmdHoje as PUSHBUTTON
	protect oCCcmdHoje1 as PUSHBUTTON
	protect oCCcmdagora as PUSHBUTTON
	protect oCCESCETI as PUSHBUTTON
	protect oCCpegETI as PUSHBUTTON
	protect oCCPegRist as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oCCesccod1 as PUSHBUTTON
	protect oCCcmdtrapro as PUSHBUTTON
	protect oCCpegar as PUSHBUTTON
	protect oCCcmdtrapro1 as PUSHBUTTON
	protect oCCporNUM as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
// 	instance NUMERO 
// 	instance CODIGO 
// 	instance CODIGOINT 
// 	instance NORMA 
// 	instance APLICACAO 
// 	instance FORNECEDO 
// 	instance FORNOME 
// 	instance ESPE 
// 	instance RASTRO 
// 	instance DATA 
// 	instance RIST 
// 	instance AR 
// 	instance ITEM 
// 	instance DATAENV 
// 	instance HORAENV 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access APLICACAO() 
return self:FieldGet(#APLICACAO)


assign APLICACAO(uValue) 
self:FieldPut(#APLICACAO, uValue)
return APLICACAO := uValue


access AR() 
return self:FieldGet(#AR)


assign AR(uValue) 
self:FieldPut(#AR, uValue)
return AR := uValue


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


access DATAENV() 
return self:FieldGet(#DATAENV)


assign DATAENV(uValue) 
self:FieldPut(#DATAENV, uValue)
return DATAENV := uValue


access ESPE() 
return self:FieldGet(#ESPE)


assign ESPE(uValue) 
self:FieldPut(#ESPE, uValue)
return ESPE := uValue


access FORNECEDO() 
return self:FieldGet(#FORNECEDO)


assign FORNECEDO(uValue) 
self:FieldPut(#FORNECEDO, uValue)
return FORNECEDO := uValue


access FORNOME() 
return self:FieldGet(#FORNOME)


assign FORNOME(uValue) 
self:FieldPut(#FORNOME, uValue)
return FORNOME := uValue


access HORAENV() 
return self:FieldGet(#HORAENV)


assign HORAENV(uValue) 
self:FieldPut(#HORAENV, uValue)
return HORAENV := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[3] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcrmss",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Times New Roman"}
aFonts[2]:Bold := TRUE
aFonts[3] := Font{,10,"Trebuchet MS"}
aFonts[3]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_NUMERO := FixedText{self,ResourceID{JCRMSS_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JCRMSS_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_CODIGOINT := FixedText{self,ResourceID{JCRMSS_SC_CODIGOINT,_GetInst()}}
oDCSC_CODIGOINT:HyperLabel := HyperLabel{#SC_CODIGOINT,"Codigoint:",NULL_STRING,NULL_STRING}

oDCSC_NORMA := FixedText{self,ResourceID{JCRMSS_SC_NORMA,_GetInst()}}
oDCSC_NORMA:HyperLabel := HyperLabel{#SC_NORMA,"Norma:",NULL_STRING,NULL_STRING}

oDCSC_APLICACAO := FixedText{self,ResourceID{JCRMSS_SC_APLICACAO,_GetInst()}}
oDCSC_APLICACAO:HyperLabel := HyperLabel{#SC_APLICACAO,"Aplicacao:",NULL_STRING,NULL_STRING}

oDCSC_FORNECEDO := FixedText{self,ResourceID{JCRMSS_SC_FORNECEDO,_GetInst()}}
oDCSC_FORNECEDO:HyperLabel := HyperLabel{#SC_FORNECEDO,"Fornecedor:",NULL_STRING,NULL_STRING}

oDCSC_ESPE := FixedText{self,ResourceID{JCRMSS_SC_ESPE,_GetInst()}}
oDCSC_ESPE:HyperLabel := HyperLabel{#SC_ESPE,"Especificacao:",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{JCRMSS_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JCRMSS_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_RIST := FixedText{self,ResourceID{JCRMSS_SC_RIST,_GetInst()}}
oDCSC_RIST:HyperLabel := HyperLabel{#SC_RIST,"Rist:",NULL_STRING,NULL_STRING}

oDCSC_AR := FixedText{self,ResourceID{JCRMSS_SC_AR,_GetInst()}}
oDCSC_AR:HyperLabel := HyperLabel{#SC_AR,"Ar:",NULL_STRING,NULL_STRING}

oDCSC_DATAENV := FixedText{self,ResourceID{JCRMSS_SC_DATAENV,_GetInst()}}
oDCSC_DATAENV:HyperLabel := HyperLabel{#SC_DATAENV,"Data Envio:",NULL_STRING,NULL_STRING}

oDCSC_HORAENV := FixedText{self,ResourceID{JCRMSS_SC_HORAENV,_GetInst()}}
oDCSC_HORAENV:HyperLabel := HyperLabel{#SC_HORAENV,"Hora:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JCRMSS_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"CRMSS_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]
oDCNUMERO:Font(aFonts[1], FALSE)

oDCCODIGO := SingleLineEdit{self,ResourceID{JCRMSS_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"CRMSS_CODIGO"}

oDCCODIGOINT := SingleLineEdit{self,ResourceID{JCRMSS_CODIGOINT,_GetInst()}}
oDCCODIGOINT:FieldSpec := padrao_char_24{}
oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT,"Codigoint:",NULL_STRING,"CRMSS_CODIGOINT"}

oDCNORMA := SingleLineEdit{self,ResourceID{JCRMSS_NORMA,_GetInst()}}
oDCNORMA:FieldSpec := padrao_char_24{}
oDCNORMA:HyperLabel := HyperLabel{#NORMA,"Norma:",NULL_STRING,"CRMSS_NORMA"}

oDCAPLICACAO := SingleLineEdit{self,ResourceID{JCRMSS_APLICACAO,_GetInst()}}
oDCAPLICACAO:FieldSpec := padrao_char_30{}
oDCAPLICACAO:HyperLabel := HyperLabel{#APLICACAO,"Aplicacao:",NULL_STRING,"CRMSS_APLICACAO"}

oDCFORNECEDO := rightSle{self,ResourceID{JCRMSS_FORNECEDO,_GetInst()}}
oDCFORNECEDO:FieldSpec := padrao_num_08{}
oDCFORNECEDO:HyperLabel := HyperLabel{#FORNECEDO,"Fornecedo:",NULL_STRING,"CRMSS_FORNECEDO"}

oDCFORNOME := SingleLineEdit{self,ResourceID{JCRMSS_FORNOME,_GetInst()}}
oDCFORNOME:FieldSpec := padrao_char_30{}
oDCFORNOME:HyperLabel := HyperLabel{#FORNOME,"Fornome:",NULL_STRING,"CRMSS_FORNOME"}

oDCESPE := SingleLineEdit{self,ResourceID{JCRMSS_ESPE,_GetInst()}}
oDCESPE:FieldSpec := padrao_char_60{}
oDCESPE:HyperLabel := HyperLabel{#ESPE,"Espe:",NULL_STRING,"CRMSS_ESPE"}

oDCRASTRO := SingleLineEdit{self,ResourceID{JCRMSS_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := padrao_char_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"CRMSS_RASTRO"}

oDCDATA := DateSle{self,ResourceID{JCRMSS_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"CRMSS_DATA"}

oDCRIST := SingleLineEdit{self,ResourceID{JCRMSS_RIST,_GetInst()}}
oDCRIST:FieldSpec := padrao_num_08{}
oDCRIST:HyperLabel := HyperLabel{#RIST,"Rist:",NULL_STRING,"CRMSS_RIST"}
oDCRIST:Font(aFonts[2], FALSE)
oDCRIST:FocusSelect := FSEL_ALL

oDCAR := SingleLineEdit{self,ResourceID{JCRMSS_AR,_GetInst()}}
oDCAR:FieldSpec := padrao_num_08{}
oDCAR:HyperLabel := HyperLabel{#AR,"Ar:",NULL_STRING,"CRMSS_AR"}
oDCAR:Font(aFonts[3], FALSE)
oDCAR:FocusSelect := FSEL_ALL

oDCITEM := SingleLineEdit{self,ResourceID{JCRMSS_ITEM,_GetInst()}}
oDCITEM:FieldSpec := padrao_num_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"CRMSS_ITEM"}
oDCITEM:Font(aFonts[3], FALSE)
oDCITEM:FocusSelect := FSEL_ALL

oDCDATAENV := DateSle{self,ResourceID{JCRMSS_DATAENV,_GetInst()}}
oDCDATAENV:FieldSpec := date_field{}
oDCDATAENV:HyperLabel := HyperLabel{#DATAENV,"Dataenv:",NULL_STRING,"CRMSS_DATAENV"}

oDCHORAENV := SingleLineEdit{self,ResourceID{JCRMSS_HORAENV,_GetInst()}}
oDCHORAENV:FieldSpec := padrao_char_05{}
oDCHORAENV:HyperLabel := HyperLabel{#HORAENV,"Horaenv:",NULL_STRING,"CRMSS_HORAENV"}

oCCpegfor := PushButton{self,ResourceID{JCRMSS_PEGFOR,_GetInst()}}
oCCpegfor:HyperLabel := HyperLabel{#pegfor,"-->",NULL_STRING,NULL_STRING}
oCCpegfor:TooltipText := "Clique Para Trazer o Nome do Fornecedor"

oCCESCFOR := PushButton{self,ResourceID{JCRMSS_ESCFOR,_GetInst()}}
oCCESCFOR:HyperLabel := HyperLabel{#ESCFOR,"...",NULL_STRING,NULL_STRING}
oCCESCFOR:TooltipText := "Escolher Fornecedor"

oCCcmdHoje := PushButton{self,ResourceID{JCRMSS_CMDHOJE,_GetInst()}}
oCCcmdHoje:HyperLabel := HyperLabel{#cmdHoje,"H",NULL_STRING,NULL_STRING}

oCCcmdHoje1 := PushButton{self,ResourceID{JCRMSS_CMDHOJE1,_GetInst()}}
oCCcmdHoje1:HyperLabel := HyperLabel{#cmdHoje1,"H",NULL_STRING,NULL_STRING}

oCCcmdagora := PushButton{self,ResourceID{JCRMSS_CMDAGORA,_GetInst()}}
oCCcmdagora:HyperLabel := HyperLabel{#cmdagora,"A",NULL_STRING,NULL_STRING}

oCCESCETI := PushButton{self,ResourceID{JCRMSS_ESCETI,_GetInst()}}
oCCESCETI:HyperLabel := HyperLabel{#ESCETI,"...",NULL_STRING,NULL_STRING}

oCCpegETI := PushButton{self,ResourceID{JCRMSS_PEGETI,_GetInst()}}
oCCpegETI:HyperLabel := HyperLabel{#pegETI,"-->",NULL_STRING,NULL_STRING}
oCCpegETI:TooltipText := "Clique Para Trazer o Nome do Fornecedor"

oCCPegRist := PushButton{self,ResourceID{JCRMSS_PEGRIST,_GetInst()}}
oCCPegRist:HyperLabel := HyperLabel{#PegRist,"-->",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JCRMSS_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oCCesccod1 := PushButton{self,ResourceID{JCRMSS_ESCCOD1,_GetInst()}}
oCCesccod1:HyperLabel := HyperLabel{#esccod1,"...",NULL_STRING,NULL_STRING}

oCCcmdtrapro := PushButton{self,ResourceID{JCRMSS_CMDTRAPRO,_GetInst()}}
oCCcmdtrapro:HyperLabel := HyperLabel{#cmdtrapro,"<-",NULL_STRING,NULL_STRING}
oCCcmdtrapro:TooltipText := "Acho a Tratamento Pela Aplicaco"

oCCpegar := PushButton{self,ResourceID{JCRMSS_PEGAR,_GetInst()}}
oCCpegar:HyperLabel := HyperLabel{#pegar,"-->",NULL_STRING,NULL_STRING}

oCCcmdtrapro1 := PushButton{self,ResourceID{JCRMSS_CMDTRAPRO1,_GetInst()}}
oCCcmdtrapro1:HyperLabel := HyperLabel{#cmdtrapro1,"<-",NULL_STRING,NULL_STRING}
oCCcmdtrapro1:TooltipText := "Acho a Tratamento Pelo Codigo Interno"

oCCporNUM := PushButton{self,ResourceID{JCRMSS_PORNUM,_GetInst()}}
oCCporNUM:Image := ico_az{}
oCCporNUM:HyperLabel := HyperLabel{#porNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporNUM:TooltipText := "Ordenar Por Requisicao"

oCCbuscaNUM := PushButton{self,ResourceID{JCRMSS_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar Um Nº Requesiçao"

oDCSC_DESTINO2 := FixedText{self,ResourceID{JCRMSS_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JCRMSS_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

self:Caption := "Controle de Salt-Spray"
self:HyperLabel := HyperLabel{#jcrmss,"Controle de Salt-Spray",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 12
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBAPLICACAO := DataColumn{padrao_char_30{}}
oDBAPLICACAO:Width := 17
oDBAPLICACAO:HyperLabel := oDCAPLICACAO:HyperLabel 
oDBAPLICACAO:Caption := "Aplicacao:"
self:Browser:AddColumn(oDBAPLICACAO)

oDBRASTRO := DataColumn{padrao_char_12{}}
oDBRASTRO:Width := 17
oDBRASTRO:HyperLabel := oDCRASTRO:HyperLabel 
oDBRASTRO:Caption := "Rastro:"
self:Browser:AddColumn(oDBRASTRO)

oDBDATA := DataColumn{date_field{}}
oDBDATA:Width := 21
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access NORMA() 
return self:FieldGet(#NORMA)


assign NORMA(uValue) 
self:FieldPut(#NORMA, uValue)
return NORMA := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access RASTRO() 
return self:FieldGet(#RASTRO)


assign RASTRO(uValue) 
self:FieldPut(#RASTRO, uValue)
return RASTRO := uValue


access RIST() 
return self:FieldGet(#RIST)


assign RIST(uValue) 
self:FieldPut(#RIST, uValue)
return RIST := uValue


END CLASS
