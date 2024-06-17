#region DEFINES
STATIC DEFINE JPRO_ALTERAR := 113 
STATIC DEFINE JPRO_ANTERIOR := 111 
STATIC DEFINE JPRO_BUSCACURSO := 107 
STATIC DEFINE JPRO_BUSCANOME := 105 
STATIC DEFINE JPRO_CURSO := 102 
STATIC DEFINE JPRO_DESCUR := 100 
STATIC DEFINE JPRO_ESCOLHER := 116 
STATIC DEFINE JPRO_EXCLUIR := 114 
STATIC DEFINE JPRO_GRUPO := 108 
STATIC DEFINE JPRO_JCURGRP := 117 
STATIC DEFINE JPRO_NOVO := 115 
STATIC DEFINE JPRO_PORCURSO := 106 
STATIC DEFINE JPRO_PORNOME := 104 
STATIC DEFINE JPRO_PROXIMO := 110 
STATIC DEFINE JPRO_SC_CARGA1 := 109 
STATIC DEFINE JPRO_SC_DESCUR := 101 
STATIC DEFINE JPRO_TABULAR := 112 
STATIC DEFINE JPRO_THEFIXEDTEXT3 := 103 
#endregion

PARTIAL class JPRO inherit MYDataWindow 

	PROTECT oDBDESCUR as DataColumn
	PROTECT oDBCURSO as DataColumn
	PROTECT oDBGRUPO as DataColumn
	protect oDCDESCUR as SINGLELINEEDIT
	protect oDCSC_DESCUR as FIXEDTEXT
	protect oDCCURSO as SINGLELINEEDIT
	protect oDCtheFixedText3 as FIXEDTEXT
	protect oCCpornome as PUSHBUTTON
	protect oCCbuscanome as PUSHBUTTON
	protect oCCporcurso as PUSHBUTTON
	protect oCCbuscacurso as PUSHBUTTON
	protect oDCGRUPO as SINGLELINEEDIT
	protect oDCSC_CARGA1 as FIXEDTEXT
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCTabular as PUSHBUTTON
	protect oCCALTERAR as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCNOVO as PUSHBUTTON
	protect oCCEscolher as PUSHBUTTON
// 	instance DESCUR 
// 	instance CURSO 
// 	instance GRUPO 
	protect oSFjcurgrp as jcurgrp

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CURSO() 
return self:FieldGet(#CURSO)


assign CURSO(uValue) 
self:FieldPut(#CURSO, uValue)
return CURSO := uValue


access DESCUR() 
return self:FieldGet(#DESCUR)


assign DESCUR(uValue) 
self:FieldPut(#DESCUR, uValue)
return DESCUR := uValue


access GRUPO() 
return self:FieldGet(#GRUPO)


assign GRUPO(uValue) 
self:FieldPut(#GRUPO, uValue)
return GRUPO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPRO",_GetInst()},iCtlID)

oDCDESCUR := SingleLineEdit{self,ResourceID{JPRO_DESCUR,_GetInst()}}
oDCDESCUR:FieldSpec := padrao_char_120{}
oDCDESCUR:HyperLabel := HyperLabel{#DESCUR,"Descrição",NULL_STRING,"PROCEDIM_DESCUR"}
oDCDESCUR:FocusSelect := FSEL_HOME

oDCSC_DESCUR := FixedText{self,ResourceID{JPRO_SC_DESCUR,_GetInst()}}
oDCSC_DESCUR:HyperLabel := HyperLabel{#SC_DESCUR,"Descrição:",NULL_STRING,NULL_STRING}

oDCCURSO := SingleLineEdit{self,ResourceID{JPRO_CURSO,_GetInst()}}
oDCCURSO:FieldSpec := padrao_char_20{}
oDCCURSO:HyperLabel := HyperLabel{#CURSO,"Curso:",NULL_STRING,"PROCEDIM_CURSO"}
oDCCURSO:FocusSelect := FSEL_HOME

oDCtheFixedText3 := FixedText{self,ResourceID{JPRO_THEFIXEDTEXT3,_GetInst()}}
oDCtheFixedText3:HyperLabel := HyperLabel{#theFixedText3,"Procedimento",NULL_STRING,NULL_STRING}

oCCpornome := PushButton{self,ResourceID{JPRO_PORNOME,_GetInst()}}
oCCpornome:Image := ico_az{}
oCCpornome:HyperLabel := HyperLabel{#pornome,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscanome := PushButton{self,ResourceID{JPRO_BUSCANOME,_GetInst()}}
oCCbuscanome:Image := ico_find{}
oCCbuscanome:HyperLabel := HyperLabel{#buscanome,NULL_STRING,NULL_STRING,NULL_STRING}

oCCporcurso := PushButton{self,ResourceID{JPRO_PORCURSO,_GetInst()}}
oCCporcurso:Image := ico_az{}
oCCporcurso:HyperLabel := HyperLabel{#porcurso,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscacurso := PushButton{self,ResourceID{JPRO_BUSCACURSO,_GetInst()}}
oCCbuscacurso:Image := ico_find{}
oCCbuscacurso:HyperLabel := HyperLabel{#buscacurso,NULL_STRING,NULL_STRING,NULL_STRING}

oDCGRUPO := SingleLineEdit{self,ResourceID{JPRO_GRUPO,_GetInst()}}
oDCGRUPO:FieldSpec := padrao_char_05{}
oDCGRUPO:HyperLabel := HyperLabel{#GRUPO,"Carga:",NULL_STRING,"TREIN_CARGA"}
oDCGRUPO:FocusSelect := FSEL_HOME

oDCSC_CARGA1 := FixedText{self,ResourceID{JPRO_SC_CARGA1,_GetInst()}}
oDCSC_CARGA1:HyperLabel := HyperLabel{#SC_CARGA1,"Grupo",NULL_STRING,NULL_STRING}

oCCProximo := PushButton{self,ResourceID{JPRO_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_next{}

oCCAnterior := PushButton{self,ResourceID{JPRO_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_previous{}

oCCTabular := PushButton{self,ResourceID{JPRO_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Ver Itens",NULL_STRING,NULL_STRING}

oCCALTERAR := PushButton{self,ResourceID{JPRO_ALTERAR,_GetInst()}}
oCCALTERAR:HyperLabel := HyperLabel{#ALTERAR,"Alterar Item",NULL_STRING,NULL_STRING}

oCCExcluir := PushButton{self,ResourceID{JPRO_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir Item",NULL_STRING,NULL_STRING}

oCCNOVO := PushButton{self,ResourceID{JPRO_NOVO,_GetInst()}}
oCCNOVO:HyperLabel := HyperLabel{#NOVO,"Novo Item",NULL_STRING,NULL_STRING}

oCCEscolher := PushButton{self,ResourceID{JPRO_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,"Escolher",NULL_STRING,NULL_STRING}

self:Caption := "Procedimentos"
self:HyperLabel := HyperLabel{#JPRO,"Procedimentos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDESCUR := DataColumn{padrao_char_120{}}
oDBDESCUR:Width := 49
oDBDESCUR:HyperLabel := oDCDESCUR:HyperLabel 
oDBDESCUR:Caption := "Descrição"
self:Browser:AddColumn(oDBDESCUR)

oDBCURSO := DataColumn{padrao_char_20{}}
oDBCURSO:Width := 13
oDBCURSO:HyperLabel := oDCCURSO:HyperLabel 
oDBCURSO:Caption := "Curso:"
self:Browser:AddColumn(oDBCURSO)

oDBGRUPO := DataColumn{padrao_char_05{}}
oDBGRUPO:Width := 7
oDBGRUPO:HyperLabel := oDCGRUPO:HyperLabel 
oDBGRUPO:Caption := "Carga:"
self:Browser:AddColumn(oDBGRUPO)


self:ViewAs(#FormView)

oSFjcurgrp := jcurgrp{self,JPRO_JCURGRP}
oSFjcurgrp:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
