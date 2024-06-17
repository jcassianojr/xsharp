#region DEFINES
STATIC DEFINE JMP06_BUSCACODIGO := 113 
STATIC DEFINE JMP06_BUSCANOME := 111 
STATIC DEFINE JMP06_CODIGO := 102 
STATIC DEFINE JMP06_CURSO := 107 
STATIC DEFINE JMP06_ESCCUR := 109 
STATIC DEFINE JMP06_EXCLUIR := 105 
STATIC DEFINE JMP06_FT4 := 108 
STATIC DEFINE JMP06_INCLUIR := 106 
STATIC DEFINE JMP06_JMP2 := 104 
STATIC DEFINE JMP06_NOME := 103 
STATIC DEFINE JMP06_PORCODIGO := 112 
STATIC DEFINE JMP06_PORNOME := 110 
STATIC DEFINE JMP06_SC_CODIGO := 100 
STATIC DEFINE JMP06_SC_NOME := 101 
#endregion

PARTIAL class JMP06 inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBCURSO as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oCCExcluir as PUSHBUTTON
	protect oCCINCLUIR as PUSHBUTTON
	protect oDCCURSO as SINGLELINEEDIT
	protect oDCFT4 as FIXEDTEXT
	protect oCCesccur as PUSHBUTTON
	protect oCCpornome as PUSHBUTTON
	protect oCCbuscanome as PUSHBUTTON
	protect oCCporcodigo as PUSHBUTTON
	protect oCCbuscacodigo as PUSHBUTTON
// 	instance CODIGO 
// 	instance NOME 
// 	instance CURSO 
	protect oSFJMP2 as JMP2

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CURSO() 
return self:FieldGet(#CURSO)


assign CURSO(uValue) 
self:FieldPut(#CURSO, uValue)
return CURSO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMP06",_GetInst()},iCtlID)

oDCSC_CODIGO := FixedText{self,ResourceID{JMP06_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JMP06_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JMP06_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_12{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"Mp06_CODIGO"}

oDCNOME := SingleLineEdit{self,ResourceID{JMP06_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_30{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"Mp06_NOME"}

oCCExcluir := PushButton{self,ResourceID{JMP06_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}

oCCINCLUIR := PushButton{self,ResourceID{JMP06_INCLUIR,_GetInst()}}
oCCINCLUIR:HyperLabel := HyperLabel{#INCLUIR,"Incluir",NULL_STRING,NULL_STRING}

oDCCURSO := SingleLineEdit{self,ResourceID{JMP06_CURSO,_GetInst()}}
oDCCURSO:FieldSpec := padrao_char_20{}
oDCCURSO:HyperLabel := HyperLabel{#CURSO,"Curso",NULL_STRING,NULL_STRING}

oDCFT4 := FixedText{self,ResourceID{JMP06_FT4,_GetInst()}}
oDCFT4:HyperLabel := HyperLabel{#FT4,"Curso",NULL_STRING,NULL_STRING}

oCCesccur := PushButton{self,ResourceID{JMP06_ESCCUR,_GetInst()}}
oCCesccur:HyperLabel := HyperLabel{#esccur,"...",NULL_STRING,NULL_STRING}

oCCpornome := PushButton{self,ResourceID{JMP06_PORNOME,_GetInst()}}
oCCpornome:Image := ico_az{}
oCCpornome:HyperLabel := HyperLabel{#pornome,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscanome := PushButton{self,ResourceID{JMP06_BUSCANOME,_GetInst()}}
oCCbuscanome:Image := ico_find{}
oCCbuscanome:HyperLabel := HyperLabel{#buscanome,NULL_STRING,NULL_STRING,NULL_STRING}

oCCporcodigo := PushButton{self,ResourceID{JMP06_PORCODIGO,_GetInst()}}
oCCporcodigo:Image := ico_az{}
oCCporcodigo:HyperLabel := HyperLabel{#porcodigo,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscacodigo := PushButton{self,ResourceID{JMP06_BUSCACODIGO,_GetInst()}}
oCCbuscacodigo:Image := ico_find{}
oCCbuscacodigo:HyperLabel := HyperLabel{#buscacodigo,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Setores"
self:HyperLabel := HyperLabel{#JMP06,"Setores",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_12{}}
oDBCODIGO:Width := 11
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_30{}}
oDBNOME:Width := 13
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBCURSO := DataColumn{padrao_char_20{}}
oDBCURSO:Width := 20
oDBCURSO:HyperLabel := oDCCURSO:HyperLabel 
oDBCURSO:Caption := "Curso"
self:Browser:AddColumn(oDBCURSO)


self:ViewAs(#FormView)

oSFJMP2 := JMP2{self,JMP06_JMP2}
oSFJMP2:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


END CLASS
