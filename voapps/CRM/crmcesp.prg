#region DEFINES
STATIC DEFINE JCRMCESP_BUSCAR := 113 
STATIC DEFINE JCRMCESP_CODIGO := 107 
STATIC DEFINE JCRMCESP_ESCCOD := 109 
STATIC DEFINE JCRMCESP_NOME := 105 
STATIC DEFINE JCRMCESP_NUMERO := 104 
STATIC DEFINE JCRMCESP_PEGCOD := 108 
STATIC DEFINE JCRMCESP_SC_CODIGO := 103 
STATIC DEFINE JCRMCESP_SC_NOME := 101 
STATIC DEFINE JCRMCESP_SC_NUMERO := 100 
STATIC DEFINE JCRMCESP_SC_TIPOENT := 102 
STATIC DEFINE JCRMCESP_TIPOC := 110 
STATIC DEFINE JCRMCESP_TIPOENT := 106 
STATIC DEFINE JCRMCESP_TIPOM := 112 
STATIC DEFINE JCRMCESP_TIPOT := 111 
#endregion

class jcrmcesp inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBTIPOENT as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_TIPOENT as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCTIPOENT as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oCCpegcod as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oCCTIPOC as PUSHBUTTON
	protect oCCTIPOT as PUSHBUTTON
	protect oCCTIPOM as PUSHBUTTON
	protect oCCbuscar as PUSHBUTTON
// 	instance NUMERO 
// 	instance NOME 
// 	instance TIPOENT 
// 	instance CODIGO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcrmcesp",_GetInst()},iCtlID)

oDCSC_NUMERO := FixedText{self,ResourceID{JCRMCESP_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JCRMCESP_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_TIPOENT := FixedText{self,ResourceID{JCRMCESP_SC_TIPOENT,_GetInst()}}
oDCSC_TIPOENT:HyperLabel := HyperLabel{#SC_TIPOENT,"Tipoent:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JCRMCESP_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JCRMCESP_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"CRMCESP_NUMERO"}

oDCNOME := SingleLineEdit{self,ResourceID{JCRMCESP_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_100{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"CRMCESP_NOME"}

oDCTIPOENT := SingleLineEdit{self,ResourceID{JCRMCESP_TIPOENT,_GetInst()}}
oDCTIPOENT:FieldSpec := PADRAO_CHAR_01{}
oDCTIPOENT:HyperLabel := HyperLabel{#TIPOENT,"T",NULL_STRING,"CRMCESP_TIPOENT"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JCRMCESP_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo",NULL_STRING,"CRMCESP_CODIGO"}

oCCpegcod := PushButton{self,ResourceID{JCRMCESP_PEGCOD,_GetInst()}}
oCCpegcod:HyperLabel := HyperLabel{#pegcod,"-->",NULL_STRING,NULL_STRING}
oCCpegcod:TooltipText := "Escolher Cliente/Fornecedor"

oCCesccod := PushButton{self,ResourceID{JCRMCESP_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oCCTIPOC := PushButton{self,ResourceID{JCRMCESP_TIPOC,_GetInst()}}
oCCTIPOC:HyperLabel := HyperLabel{#TIPOC,"(C)omponente",NULL_STRING,NULL_STRING}
oCCTIPOC:TooltipText := "Marca Tipo Como Componete"

oCCTIPOT := PushButton{self,ResourceID{JCRMCESP_TIPOT,_GetInst()}}
oCCTIPOT:HyperLabel := HyperLabel{#TIPOT,"(T)rat/Serviço",NULL_STRING,NULL_STRING}
oCCTIPOT:TooltipText := "Marca Tipo Como Tratamento/Servicos"

oCCTIPOM := PushButton{self,ResourceID{JCRMCESP_TIPOM,_GetInst()}}
oCCTIPOM:HyperLabel := HyperLabel{#TIPOM,"(M)at.Prima",NULL_STRING,NULL_STRING}
oCCTIPOM:TooltipText := "Marca Tipo Como Materia Prima"

oCCbuscar := PushButton{self,ResourceID{JCRMCESP_BUSCAR,_GetInst()}}
oCCbuscar:Image := ICO_FIND{}
oCCbuscar:HyperLabel := HyperLabel{#buscar,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Codigos Especiais RIRM/RIST"
self:HyperLabel := HyperLabel{#jcrmcesp,"Codigos Especiais RIRM/RIST",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBTIPOENT := DataColumn{PADRAO_CHAR_01{}}
oDBTIPOENT:Width := 4
oDBTIPOENT:HyperLabel := oDCTIPOENT:HyperLabel 
oDBTIPOENT:Caption := "T"
self:Browser:AddColumn(oDBTIPOENT)

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 29
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo"
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_100{}}
oDBNOME:Width := 64
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access TIPOENT() 
return self:FieldGet(#TIPOENT)


assign TIPOENT(uValue) 
self:FieldPut(#TIPOENT, uValue)
return TIPOENT := uValue


END CLASS
