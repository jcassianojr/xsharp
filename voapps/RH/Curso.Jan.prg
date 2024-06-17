#region DEFINES
STATIC DEFINE JCUR_ALTERAR := 111 
STATIC DEFINE JCUR_ANTERIOR := 109 
STATIC DEFINE JCUR_ATUALIZA := 100 
STATIC DEFINE JCUR_BUSCACURSO := 102 
STATIC DEFINE JCUR_BUSCANOME := 104 
STATIC DEFINE JCUR_CARGA := 124 
STATIC DEFINE JCUR_CERT := 120 
STATIC DEFINE JCUR_CURSO := 125 
STATIC DEFINE JCUR_DESCUR := 126 
STATIC DEFINE JCUR_EDITAR := 118 
STATIC DEFINE JCUR_ESCOLHER := 114 
STATIC DEFINE JCUR_EXCLUIR := 112 
STATIC DEFINE JCUR_GRUPO := 105 
STATIC DEFINE JCUR_JCURGRP := 107 
STATIC DEFINE JCUR_MCUR := 115 
STATIC DEFINE JCUR_MNOM := 116 
STATIC DEFINE JCUR_NOVO := 113 
STATIC DEFINE JCUR_PORCURSO := 101 
STATIC DEFINE JCUR_PORNOME := 103 
STATIC DEFINE JCUR_PROXIMO := 108 
STATIC DEFINE JCUR_RB1 := 129 
STATIC DEFINE JCUR_RB2 := 130 
STATIC DEFINE JCUR_RB3 := 122 
STATIC DEFINE JCUR_RB4 := 123 
STATIC DEFINE JCUR_SC_CARGA := 119 
STATIC DEFINE JCUR_SC_CARGA1 := 106 
STATIC DEFINE JCUR_SC_DESCUR := 127 
STATIC DEFINE JCUR_TABULAR := 110 
STATIC DEFINE JCUR_THEFIXEDTEXT3 := 121 
STATIC DEFINE JCUR_THESINGLELINEEDIT4 := 116 
STATIC DEFINE JCUR_TIPCUR := 128 
STATIC DEFINE JCUR_TROCACURSO := 117 
#endregion

PARTIAL class JCUR inherit MYDataWindow 

	PROTECT oDBCURSO as DataColumn
	PROTECT oDBDESCUR as DataColumn
	protect oCCAtualiza as PUSHBUTTON
	protect oCCporcurso as PUSHBUTTON
	protect oCCbuscacurso as PUSHBUTTON
	protect oCCpornome as PUSHBUTTON
	protect oCCbuscanome as PUSHBUTTON
	protect oDCGRUPO as SINGLELINEEDIT
	protect oDCSC_CARGA1 as FIXEDTEXT
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCTabular as PUSHBUTTON
	protect oCCALTERAR as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCNOVO as PUSHBUTTON
	protect oCCEscolher as PUSHBUTTON
	protect oCCmcur as PUSHBUTTON
	protect oCCmnom as PUSHBUTTON
	protect oCCtrocaCurso as PUSHBUTTON
	protect oCCEditar as PUSHBUTTON
	protect oDCSC_CARGA as FIXEDTEXT
	protect oDCCERT as RADIOBUTTONGROUP
	protect oDCtheFixedText3 as FIXEDTEXT
	protect oCCRB3 as RADIOBUTTON
	protect oCCRB4 as RADIOBUTTON
	protect oDCCARGA as RIGHTSLE
	protect oDCCURSO as SINGLELINEEDIT
	protect oDCDESCUR as SINGLELINEEDIT
	protect oDCSC_DESCUR as FIXEDTEXT
	protect oDCTIPCUR as RADIOBUTTONGROUP
	protect oCCRB1 as RADIOBUTTON
	protect oCCRB2 as RADIOBUTTON
// 	instance GRUPO 
// 	instance CERT 
// 	instance CARGA 
// 	instance CURSO 
// 	instance DESCUR 
// 	instance TIPCUR 
	protect oSFjcurgrp as jcurgrp

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CARGA() 
return self:FieldGet(#CARGA)


assign CARGA(uValue) 
self:FieldPut(#CARGA, uValue)
return CARGA := uValue


access CERT() 
return self:FieldGet(#CERT)


assign CERT(uValue) 
self:FieldPut(#CERT, uValue)
return CERT := uValue


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
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCUR",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{253,254,220}}

oCCAtualiza := PushButton{self,ResourceID{JCUR_ATUALIZA,_GetInst()}}
oCCAtualiza:HyperLabel := HyperLabel{#Atualiza,"Atualizar Descrição PT/TREIN",NULL_STRING,NULL_STRING}
oCCAtualiza:TooltipText := "Permite Atualizar Trein/PT Qdo Mudança nome do curso"

oCCporcurso := PushButton{self,ResourceID{JCUR_PORCURSO,_GetInst()}}
oCCporcurso:Image := ico_az{}
oCCporcurso:HyperLabel := HyperLabel{#porcurso,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporcurso:TooltipText := "Ordenar Por Codigo"

oCCbuscacurso := PushButton{self,ResourceID{JCUR_BUSCACURSO,_GetInst()}}
oCCbuscacurso:Image := ICO_FIND{}
oCCbuscacurso:HyperLabel := HyperLabel{#buscacurso,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscacurso:TooltipText := "Localizar um Codigo"

oCCpornome := PushButton{self,ResourceID{JCUR_PORNOME,_GetInst()}}
oCCpornome:Image := ico_az{}
oCCpornome:HyperLabel := HyperLabel{#pornome,NULL_STRING,NULL_STRING,NULL_STRING}
oCCpornome:TooltipText := "Ordenar por Descriçao"

oCCbuscanome := PushButton{self,ResourceID{JCUR_BUSCANOME,_GetInst()}}
oCCbuscanome:Image := ico_find{}
oCCbuscanome:HyperLabel := HyperLabel{#buscanome,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanome:TooltipText := "Localizar uma Descrição"

oDCGRUPO := SingleLineEdit{self,ResourceID{JCUR_GRUPO,_GetInst()}}
oDCGRUPO:FieldSpec := padrao_char_05{}
oDCGRUPO:HyperLabel := HyperLabel{#GRUPO,"Carga:",NULL_STRING,"TREIN_CARGA"}
oDCGRUPO:FocusSelect := FSEL_HOME
oDCGRUPO:TooltipText := "Grupo que o curso pertence"

oDCSC_CARGA1 := FixedText{self,ResourceID{JCUR_SC_CARGA1,_GetInst()}}
oDCSC_CARGA1:HyperLabel := HyperLabel{#SC_CARGA1,"Grupo",NULL_STRING,NULL_STRING}

oCCProximo := PushButton{self,ResourceID{JCUR_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_next{}
oCCProximo:TooltipText := "Avança um Grupo na Lista"

oCCAnterior := PushButton{self,ResourceID{JCUR_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_previous{}
oCCAnterior:TooltipText := "Retorna um Grupo na Lista"

oCCTabular := PushButton{self,ResourceID{JCUR_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Ver Itens",NULL_STRING,NULL_STRING}
oCCTabular:TooltipText := "Retorna a lista dos grupos"

oCCALTERAR := PushButton{self,ResourceID{JCUR_ALTERAR,_GetInst()}}
oCCALTERAR:HyperLabel := HyperLabel{#ALTERAR,"Alterar Item",NULL_STRING,NULL_STRING}
oCCALTERAR:TooltipText := "Altera dados do grupo"

oCCExcluir := PushButton{self,ResourceID{JCUR_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir Item",NULL_STRING,NULL_STRING}
oCCExcluir:TooltipText := "Exclui grupo em destaque da lista"

oCCNOVO := PushButton{self,ResourceID{JCUR_NOVO,_GetInst()}}
oCCNOVO:HyperLabel := HyperLabel{#NOVO,"Novo Item",NULL_STRING,NULL_STRING}
oCCNOVO:TooltipText := "Inclui um novo grupo"

oCCEscolher := PushButton{self,ResourceID{JCUR_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,"Escolher",NULL_STRING,NULL_STRING}
oCCEscolher:TooltipText := "Escolhe o Grupo para o curso"

oCCmcur := PushButton{self,ResourceID{JCUR_MCUR,_GetInst()}}
oCCmcur:HyperLabel := HyperLabel{#mcur,"M",NULL_STRING,NULL_STRING}
oCCmcur:TooltipText := "Clique para deixar o Codigo do Curso em Maisculas"

oCCmnom := PushButton{self,ResourceID{JCUR_MNOM,_GetInst()}}
oCCmnom:HyperLabel := HyperLabel{#mnom,"M",NULL_STRING,NULL_STRING}
oCCmnom:TooltipText := "Clique para deixar o Descrição do Curso em Maisculas"

oCCtrocaCurso := PushButton{self,ResourceID{JCUR_TROCACURSO,_GetInst()}}
oCCtrocaCurso:HyperLabel := HyperLabel{#trocaCurso,"Trocar Codigos Curso",NULL_STRING,NULL_STRING}
oCCtrocaCurso:TooltipText := "Permite Atualizar Trein/PT Qdo Mudança codigo do curso"

oCCEditar := PushButton{self,ResourceID{JCUR_EDITAR,_GetInst()}}
oCCEditar:HyperLabel := HyperLabel{#Editar,"E",NULL_STRING,NULL_STRING}
oCCEditar:TooltipText := "Clique para Alterar o Codigo do Curso em Maisculas"

oDCSC_CARGA := FixedText{self,ResourceID{JCUR_SC_CARGA,_GetInst()}}
oDCSC_CARGA:HyperLabel := HyperLabel{#SC_CARGA,"Carga Horária:",NULL_STRING,NULL_STRING}

oDCtheFixedText3 := FixedText{self,ResourceID{JCUR_THEFIXEDTEXT3,_GetInst()}}
oDCtheFixedText3:HyperLabel := HyperLabel{#theFixedText3,"Curso:",NULL_STRING,NULL_STRING}

oCCRB3 := RadioButton{self,ResourceID{JCUR_RB3,_GetInst()}}
oCCRB3:HyperLabel := HyperLabel{#RB3,"Sim",NULL_STRING,NULL_STRING}
oCCRB3:TooltipText := "O Curso Requer Certificado"

oCCRB4 := RadioButton{self,ResourceID{JCUR_RB4,_GetInst()}}
oCCRB4:HyperLabel := HyperLabel{#RB4,"Não",NULL_STRING,NULL_STRING}
oCCRB4:TooltipText := "O Curso não Requer Certificado"

oDCCARGA := rightSle{self,ResourceID{JCUR_CARGA,_GetInst()}}
oDCCARGA:FieldSpec := padrao_num_08_2{}
oDCCARGA:HyperLabel := HyperLabel{#CARGA,"Carga:",NULL_STRING,"TREIN_CARGA"}
oDCCARGA:FocusSelect := FSEL_HOME
oDCCARGA:TooltipText := "Carga Horaria do Curso"

oDCCURSO := SingleLineEdit{self,ResourceID{JCUR_CURSO,_GetInst()}}
oDCCURSO:FieldSpec := padrao_char_20{}
oDCCURSO:HyperLabel := HyperLabel{#CURSO,"Curso:",NULL_STRING,"CURSO_CURSO"}
oDCCURSO:FocusSelect := FSEL_HOME
oDCCURSO:BackGround := aBrushes[1]

oDCDESCUR := SingleLineEdit{self,ResourceID{JCUR_DESCUR,_GetInst()}}
oDCDESCUR:FieldSpec := padrao_char_120{}
oDCDESCUR:HyperLabel := HyperLabel{#DESCUR,"Descrição",NULL_STRING,"CURSO_DESCUR"}
oDCDESCUR:FocusSelect := FSEL_HOME

oDCSC_DESCUR := FixedText{self,ResourceID{JCUR_SC_DESCUR,_GetInst()}}
oDCSC_DESCUR:HyperLabel := HyperLabel{#SC_DESCUR,"Descrição:",NULL_STRING,NULL_STRING}

oCCRB1 := RadioButton{self,ResourceID{JCUR_RB1,_GetInst()}}
oCCRB1:HyperLabel := HyperLabel{#RB1,"Interno",NULL_STRING,NULL_STRING}
oCCRB1:TooltipText := "Curso Interno"

oCCRB2 := RadioButton{self,ResourceID{JCUR_RB2,_GetInst()}}
oCCRB2:HyperLabel := HyperLabel{#RB2,"Externo",NULL_STRING,NULL_STRING}
oCCRB2:TooltipText := "Curso Externo"

oDCCERT := RadioButtonGroup{self,ResourceID{JCUR_CERT,_GetInst()}}
oDCCERT:FillUsing({ ;
					{oCCRB3,"S"}, ;
					{oCCRB4,"N"} ;
					})
oDCCERT:HyperLabel := HyperLabel{#CERT,"Requer Certificado",NULL_STRING,NULL_STRING}
oDCCERT:FieldSpec := padrao_char_01{}
oDCCERT:TooltipText := "Se O Curso Requer Certificado"

oDCTIPCUR := RadioButtonGroup{self,ResourceID{JCUR_TIPCUR,_GetInst()}}
oDCTIPCUR:FillUsing({ ;
						{oCCRB1,"I"}, ;
						{oCCRB2,"E"} ;
						})
oDCTIPCUR:HyperLabel := HyperLabel{#TIPCUR,"Tipo",NULL_STRING,NULL_STRING}
oDCTIPCUR:FieldSpec := padrao_char_01{}
oDCTIPCUR:TooltipText := "Tipo de Curso Interno/Externo"

self:Caption := "Cadastro de Cursos"
self:HyperLabel := HyperLabel{#JCUR,"Cadastro de Cursos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCURSO := DataColumn{padrao_char_20{}}
oDBCURSO:Width := 13
oDBCURSO:HyperLabel := oDCCURSO:HyperLabel 
oDBCURSO:Caption := "Curso:"
oDBCURSO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCURSO)

oDBDESCUR := DataColumn{padrao_char_120{}}
oDBDESCUR:Width := 49
oDBDESCUR:HyperLabel := oDCDESCUR:HyperLabel 
oDBDESCUR:Caption := "Descrição"
self:Browser:AddColumn(oDBDESCUR)


self:ViewAs(#FormView)

oSFjcurgrp := jcurgrp{self,JCUR_JCURGRP}
oSFjcurgrp:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD mnom( ) 
	SELF:server:FIELDPUT("DESCUR",Upper(SELF:server:FIELDGET("DESCUR")))	

access TIPCUR() 
return self:FieldGet(#TIPCUR)


assign TIPCUR(uValue) 
self:FieldPut(#TIPCUR, uValue)
return TIPCUR := uValue


METHOD trocaCurso( ) 
LOCAL oJAN AS XJTRO	
oJAN:=XJTRO{SELF,SELF:SERVER:FIELDGET("CURSO")}
oJAN:SHOW()		

END CLASS
