#region DEFINES
STATIC DEFINE JMO_AREA := 103 
STATIC DEFINE JMO_BUSCOD := 122 
STATIC DEFINE JMO_BUSNOM := 123 
STATIC DEFINE JMO_CALCULAR := 126 
STATIC DEFINE JMO_CMDHOJE := 143 
STATIC DEFINE JMO_CODFOLHA := 105 
STATIC DEFINE JMO_CODIGO := 100 
STATIC DEFINE JMO_CURSO := 135 
STATIC DEFINE JMO_DATAREV := 109 
STATIC DEFINE JMO_DATATAL := 127 
STATIC DEFINE JMO_ESCCUR := 124 
STATIC DEFINE JMO_ESCOLA := 106 
STATIC DEFINE JMO_ESCOLA2 := 141 
STATIC DEFINE JMO_ESCOLA3 := 146 
STATIC DEFINE JMO_ESCOLD := 107 
STATIC DEFINE JMO_ESCOLD2 := 142 
STATIC DEFINE JMO_ESCOLD3 := 147 
STATIC DEFINE JMO_ESCPRO := 125 
STATIC DEFINE JMO_EXCLUIR := 137 
STATIC DEFINE JMO_EXCLUIRP := 112 
STATIC DEFINE JMO_FT3 := 134 
STATIC DEFINE JMO_FT4 := 138 
STATIC DEFINE JMO_FT5 := 110 
STATIC DEFINE JMO_FT6 := 115 
STATIC DEFINE JMO_FT7 := 118 
STATIC DEFINE JMO_INCLUIR := 136 
STATIC DEFINE JMO_INCLUIRP := 113 
STATIC DEFINE JMO_JMP2 := 139 
STATIC DEFINE JMO_JMPP := 111 
STATIC DEFINE JMO_NOME := 101 
STATIC DEFINE JMO_PEGCURDES := 144 
STATIC DEFINE JMO_PEGPRODES := 145 
STATIC DEFINE JMO_POR_CODIGO := 112 
STATIC DEFINE JMO_PORCODIGO := 120 
STATIC DEFINE JMO_PORNOME := 121 
STATIC DEFINE JMO_PROCTO := 114 
STATIC DEFINE JMO_SC_CODIGO := 131 
STATIC DEFINE JMO_SC_NOME := 133 
STATIC DEFINE JMO_SC_SETOR1 := 128 
STATIC DEFINE JMO_SC_SETOR2 := 129 
STATIC DEFINE JMO_SC_SETOR3 := 130 
STATIC DEFINE JMO_SC_SETOR4 := 140 
STATIC DEFINE JMO_SC_VALOR := 132 
STATIC DEFINE JMO_SETOR := 104 
STATIC DEFINE JMO_SUPIME := 108 
STATIC DEFINE JMO_TABCONTROL1 := 119 
STATIC DEFINE JMO_TIPO := 116 
STATIC DEFINE JMO_TIPOC := 117 
STATIC DEFINE JMO_VALOR := 102 
STATIC DEFINE TABCONTROL1_PAGE1_DES01 := 100 
STATIC DEFINE TABCONTROL1_PAGE1_DES02 := 101 
STATIC DEFINE TABCONTROL1_PAGE1_DES03 := 102 
STATIC DEFINE TABCONTROL1_PAGE1_DES04 := 103 
STATIC DEFINE TABCONTROL1_PAGE1_DES05 := 104 
STATIC DEFINE TABCONTROL1_PAGE1_DES06 := 105 
STATIC DEFINE TABCONTROL1_PAGE1_DES07 := 106 
STATIC DEFINE TABCONTROL1_PAGE1_DES08 := 107 
STATIC DEFINE TABCONTROL1_PAGE1_DES09 := 108 
STATIC DEFINE TABCONTROL1_PAGE1_DES10 := 109 
STATIC DEFINE TABCONTROL1_PAGE2_REQ01 := 100 
STATIC DEFINE TABCONTROL1_PAGE2_REQ02 := 101 
STATIC DEFINE TABCONTROL1_PAGE2_REQ03 := 102 
STATIC DEFINE TABCONTROL1_PAGE2_REQ04 := 103 
STATIC DEFINE TABCONTROL1_PAGE2_REQ05 := 104 
STATIC DEFINE TABCONTROL1_PAGE2_REQ06 := 105 
STATIC DEFINE TABCONTROL1_PAGE2_REQ07 := 106 
STATIC DEFINE TABCONTROL1_PAGE2_REQ08 := 107 
STATIC DEFINE TABCONTROL1_PAGE2_REQ09 := 108 
STATIC DEFINE TABCONTROL1_PAGE2_REQ10 := 109 
STATIC DEFINE TABCONTROL1_PAGE3_RED01 := 100 
STATIC DEFINE TABCONTROL1_PAGE3_RED02 := 101 
STATIC DEFINE TABCONTROL1_PAGE3_RED03 := 102 
STATIC DEFINE TABCONTROL1_PAGE3_RED04 := 103 
STATIC DEFINE TABCONTROL1_PAGE3_RED05 := 104 
STATIC DEFINE TABCONTROL1_PAGE3_RED06 := 105 
STATIC DEFINE TABCONTROL1_PAGE3_RED07 := 106 
STATIC DEFINE TABCONTROL1_PAGE3_RED08 := 107 
STATIC DEFINE TABCONTROL1_PAGE3_RED09 := 108 
STATIC DEFINE TABCONTROL1_PAGE3_RED10 := 109 
STATIC DEFINE TABCONTROL1_PAGE4_HAB01 := 100 
STATIC DEFINE TABCONTROL1_PAGE4_HAB02 := 101 
STATIC DEFINE TABCONTROL1_PAGE4_HAB03 := 102 
STATIC DEFINE TABCONTROL1_PAGE5_EXP01 := 100 
STATIC DEFINE TABCONTROL1_PAGE5_EXP02 := 101 
STATIC DEFINE TABCONTROL1_PAGE5_EXP03 := 102 
STATIC DEFINE TABCONTROL1_PAGE6_ANADAT := 106 
STATIC DEFINE TABCONTROL1_PAGE6_ANANOM := 108 
STATIC DEFINE TABCONTROL1_PAGE6_ANANUM := 110 
STATIC DEFINE TABCONTROL1_PAGE6_APRDAT := 112 
STATIC DEFINE TABCONTROL1_PAGE6_APRNOM := 114 
STATIC DEFINE TABCONTROL1_PAGE6_APRNUM := 116 
STATIC DEFINE TABCONTROL1_PAGE6_ELADAT := 105 
STATIC DEFINE TABCONTROL1_PAGE6_ELANOM := 100 
STATIC DEFINE TABCONTROL1_PAGE6_ELANUM := 103 
STATIC DEFINE TABCONTROL1_PAGE6_ESCSOL := 102 
STATIC DEFINE TABCONTROL1_PAGE6_ESCSOL1 := 109 
STATIC DEFINE TABCONTROL1_PAGE6_ESCSOL2 := 115 
STATIC DEFINE TABCONTROL1_PAGE6_PEGSOL := 101 
STATIC DEFINE TABCONTROL1_PAGE6_PEGSOL1 := 107 
STATIC DEFINE TABCONTROL1_PAGE6_PEGSOL2 := 113 
STATIC DEFINE TABCONTROL1_PAGE6_SC_NINSTU1 := 104 
STATIC DEFINE TABCONTROL1_PAGE6_SC_NINSTU2 := 111 
STATIC DEFINE TABCONTROL1_PAGE6_SC_NINSTU3 := 117 
#endregion

PARTIAL class JMO inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBVALOR as DataColumn
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCVALOR as SINGLELINEEDIT
	protect oDCAREA as COMBOBOX
	protect oDCSETOR as COMBOBOX
	protect oDCCODFOLHA as COMBOBOX
	protect oDCESCOLA as COMBOBOX
	protect oDCESCOLD as SINGLELINEEDIT
	protect oDCSUPIME as SINGLELINEEDIT
	protect oDCDATAREV as DATESLE
	protect oDCFT5 as FIXEDTEXT
	protect oCCExcluirP as PUSHBUTTON
	protect oCCINCLUIRP as PUSHBUTTON
	protect oDCPROCTO as SINGLELINEEDIT
	protect oDCFT6 as FIXEDTEXT
	protect oCCTIPO as PUSHBUTTON
	protect oCCTIPOC as PUSHBUTTON
	protect oDCft7 as FIXEDTEXT
	protect oDCTabControl1 as TABCONTROL
	protect oTPTABCONTROL1_PAGE1 as TABCONTROL1_PAGE1
	protect oTPTABCONTROL1_PAGE2 as TABCONTROL1_PAGE2
	protect oTPTABCONTROL1_PAGE3 as TABCONTROL1_PAGE3
	protect oTPTABCONTROL1_PAGE4 as TABCONTROL1_PAGE4
	protect oTPTABCONTROL1_PAGE5 as TABCONTROL1_PAGE5
	protect oTPTABCONTROL1_PAGE6 as TABCONTROL1_PAGE6
	protect oCCporcodigo as PUSHBUTTON
	protect oCCpornome as PUSHBUTTON
	protect oCCbuscod as PUSHBUTTON
	protect oCCbusnom as PUSHBUTTON
	protect oCCesccur as PUSHBUTTON
	protect oCCescPRO as PUSHBUTTON
	protect oCCCalcular as PUSHBUTTON
	protect oDCDATATAL as SINGLELINEEDIT
	protect oDCSC_SETOR1 as FIXEDTEXT
	protect oDCSC_SETOR2 as FIXEDTEXT
	protect oDCSC_SETOR3 as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_VALOR as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCFT3 as FIXEDTEXT
	protect oDCCURSO as SINGLELINEEDIT
	protect oCCINCLUIR as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oDCFT4 as FIXEDTEXT
	protect oDCSC_SETOR4 as FIXEDTEXT
	protect oDCESCOLa2 as COMBOBOX
	protect oDCESCOLD2 as SINGLELINEEDIT
	protect oCCcmdHoje as PUSHBUTTON
	protect oCCpegcurdes as PUSHBUTTON
	protect oCCpegprodes as PUSHBUTTON
	protect oDCESCOLa3 as COMBOBOX
	protect oDCESCOLD3 as SINGLELINEEDIT
// 	instance CODIGO 
// 	instance NOME 
// 	instance VALOR 
// 	instance AREA 
// 	instance SETOR 
// 	instance CODFOLHA 
// 	instance ESCOLA 
// 	instance ESCOLD 
// 	instance SUPIME 
// 	instance DATAREV 
// 	instance PROCTO 
// 	instance DATATAL 
// 	instance CURSO 
// 	instance ESCOLa2 
// 	instance ESCOLD2 
// 	instance ESCOLa3 
// 	instance ESCOLD3 
	protect oSFJMPp as JMPp
	protect oSFJMP2 as JMP2

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AREA() 
return self:FieldGet(#AREA)


assign AREA(uValue) 
self:FieldPut(#AREA, uValue)
return AREA := uValue


access CODFOLHA() 
return self:FieldGet(#CODFOLHA)


assign CODFOLHA(uValue) 
self:FieldPut(#CODFOLHA, uValue)
return CODFOLHA := uValue


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


access DATAREV() 
return self:FieldGet(#DATAREV)


assign DATAREV(uValue) 
self:FieldPut(#DATAREV, uValue)
return DATAREV := uValue


access DATATAL() 
return self:FieldGet(#DATATAL)


assign DATATAL(uValue) 
self:FieldPut(#DATATAL, uValue)
return DATATAL := uValue


access ESCOLA() 
return self:FieldGet(#ESCOLA)


assign ESCOLA(uValue) 
self:FieldPut(#ESCOLA, uValue)
return ESCOLA := uValue


access ESCOLa2() 
return self:FieldGet(#ESCOLa2)


assign ESCOLa2(uValue) 
self:FieldPut(#ESCOLa2, uValue)
return ESCOLa2 := uValue


access ESCOLa3() 
return self:FieldGet(#ESCOLa3)


assign ESCOLa3(uValue) 
self:FieldPut(#ESCOLa3, uValue)
return ESCOLa3 := uValue


access ESCOLD() 
return self:FieldGet(#ESCOLD)


assign ESCOLD(uValue) 
self:FieldPut(#ESCOLD, uValue)
return ESCOLD := uValue


access ESCOLD2() 
return self:FieldGet(#ESCOLD2)


assign ESCOLD2(uValue) 
self:FieldPut(#ESCOLD2, uValue)
return ESCOLD2 := uValue


access ESCOLD3() 
return self:FieldGet(#ESCOLD3)


assign ESCOLD3(uValue) 
self:FieldPut(#ESCOLD3, uValue)
return ESCOLD3 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMO",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{253,254,220}}

oDCCODIGO := SingleLineEdit{self,ResourceID{JMO_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_12{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MP02_CODIGO"}
oDCCODIGO:TooltipText := "Codigo da Função"

oDCNOME := SingleLineEdit{self,ResourceID{JMO_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_30{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MP02_NOME"}
oDCNOME:TooltipText := "Descriçao da Função"

oDCVALOR := SingleLineEdit{self,ResourceID{JMO_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := PADRAO_NUM_12_2{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Valor:",NULL_STRING,"MP02_VALOR"}
oDCVALOR:TooltipText := "Valor Hora Função"

oDCAREA := combobox{self,ResourceID{JMO_AREA,_GetInst()}}
oDCAREA:FieldSpec := PADRAO_CHAR_02{}
oDCAREA:FillUsing(Self:PEGMP05( ))
oDCAREA:HyperLabel := HyperLabel{#AREA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCAREA:TooltipText := "Area "

oDCSETOR := combobox{self,ResourceID{JMO_SETOR,_GetInst()}}
oDCSETOR:FieldSpec := PADRAO_CHAR_12{}
oDCSETOR:FillUsing(Self:PEGMP06( ))
oDCSETOR:HyperLabel := HyperLabel{#SETOR,NULL_STRING,NULL_STRING,NULL_STRING}
oDCSETOR:TooltipText := "Setor"

oDCCODFOLHA := combobox{self,ResourceID{JMO_CODFOLHA,_GetInst()}}
oDCCODFOLHA:FieldSpec := PADRAO_NUM_05{}
oDCCODFOLHA:FillUsing(Self:PEGFUNCAO( ))
oDCCODFOLHA:HyperLabel := HyperLabel{#CODFOLHA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCODFOLHA:TooltipText := "Codigo Sistema Folha"

oDCESCOLA := combobox{self,ResourceID{JMO_ESCOLA,_GetInst()}}
oDCESCOLA:FieldSpec := PADRAO_CHAR_02{}
oDCESCOLA:FillUsing(Self:PEGRHESC( ))
oDCESCOLA:HyperLabel := HyperLabel{#ESCOLA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCESCOLA:TooltipText := "Escolaridade"

oDCESCOLD := SingleLineEdit{self,ResourceID{JMO_ESCOLD,_GetInst()}}
oDCESCOLD:FieldSpec := PADRAO_CHAR_100{}
oDCESCOLD:HyperLabel := HyperLabel{#ESCOLD,"Nome:",NULL_STRING,"MP02_NOME"}
oDCESCOLD:TooltipText := "Descrição Escolaridade"

oDCSUPIME := SingleLineEdit{self,ResourceID{JMO_SUPIME,_GetInst()}}
oDCSUPIME:FieldSpec := PADRAO_CHAR_30{}
oDCSUPIME:HyperLabel := HyperLabel{#SUPIME,"Valor:","Superior Imediato","MP02_VALOR"}
oDCSUPIME:TooltipText := "Superior Imediato"

oDCDATAREV := DateSle{self,ResourceID{JMO_DATAREV,_GetInst()}}
oDCDATAREV:FieldSpec := DATE_FIELD{}
oDCDATAREV:HyperLabel := HyperLabel{#DATAREV,"Valor:","Data Revisao","MP02_VALOR"}
oDCDATAREV:TooltipText := "Data Revisao Cadastro"

oDCFT5 := FixedText{self,ResourceID{JMO_FT5,_GetInst()}}
oDCFT5:HyperLabel := HyperLabel{#FT5,"Codigo Folha",NULL_STRING,NULL_STRING}

oCCExcluirP := PushButton{self,ResourceID{JMO_EXCLUIRP,_GetInst()}}
oCCExcluirP:HyperLabel := HyperLabel{#ExcluirP,"Excluir",NULL_STRING,NULL_STRING}
oCCExcluirP:TooltipText := "Excluir Procedimento"

oCCINCLUIRP := PushButton{self,ResourceID{JMO_INCLUIRP,_GetInst()}}
oCCINCLUIRP:HyperLabel := HyperLabel{#INCLUIRP,"Incluir",NULL_STRING,NULL_STRING}
oCCINCLUIRP:TooltipText := "Incluir Procedimento"

oDCPROCTO := SingleLineEdit{self,ResourceID{JMO_PROCTO,_GetInst()}}
oDCPROCTO:FieldSpec := PADRAO_CHAR_20{}
oDCPROCTO:HyperLabel := HyperLabel{#PROCTO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPROCTO:TooltipText := "Codigo do Procedimento"

oDCFT6 := FixedText{self,ResourceID{JMO_FT6,_GetInst()}}
oDCFT6:HyperLabel := HyperLabel{#FT6,"Procmto",NULL_STRING,NULL_STRING}

oCCTIPO := PushButton{self,ResourceID{JMO_TIPO,_GetInst()}}
oCCTIPO:HyperLabel := HyperLabel{#TIPO,"TIPO",NULL_STRING,NULL_STRING}
oCCTIPO:TooltipText := "Tipo de Procedimento"

oCCTIPOC := PushButton{self,ResourceID{JMO_TIPOC,_GetInst()}}
oCCTIPOC:HyperLabel := HyperLabel{#TIPOC,"TIPO",NULL_STRING,NULL_STRING}
oCCTIPOC:TooltipText := "Tipo De Curso"

oDCft7 := FixedText{self,ResourceID{JMO_FT7,_GetInst()}}
oDCft7:HyperLabel := HyperLabel{#ft7,"Setor",NULL_STRING,NULL_STRING}

oDCTabControl1 := TabControl{self,ResourceID{JMO_TABCONTROL1,_GetInst()}}
oDCTabControl1:HyperLabel := HyperLabel{#TabControl1,NULL_STRING,NULL_STRING,NULL_STRING}

oCCporcodigo := PushButton{self,ResourceID{JMO_PORCODIGO,_GetInst()}}
oCCporcodigo:Image := ico_az{}
oCCporcodigo:HyperLabel := HyperLabel{#porcodigo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporcodigo:TooltipText := "Ordenar por Codigo"

oCCpornome := PushButton{self,ResourceID{JMO_PORNOME,_GetInst()}}
oCCpornome:Image := ico_az{}
oCCpornome:HyperLabel := HyperLabel{#pornome,NULL_STRING,NULL_STRING,NULL_STRING}
oCCpornome:TooltipText := "Ordenar Nome"

oCCbuscod := PushButton{self,ResourceID{JMO_BUSCOD,_GetInst()}}
oCCbuscod:Image := ico_find{}
oCCbuscod:HyperLabel := HyperLabel{#buscod,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscod:TooltipText := "Bsucar Codigo"

oCCbusnom := PushButton{self,ResourceID{JMO_BUSNOM,_GetInst()}}
oCCbusnom:Image := ico_find{}
oCCbusnom:HyperLabel := HyperLabel{#busnom,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbusnom:TooltipText := "Buscar Nome"

oCCesccur := PushButton{self,ResourceID{JMO_ESCCUR,_GetInst()}}
oCCesccur:HyperLabel := HyperLabel{#esccur,"...",NULL_STRING,NULL_STRING}
oCCesccur:TooltipText := "Escolher Curso"

oCCescPRO := PushButton{self,ResourceID{JMO_ESCPRO,_GetInst()}}
oCCescPRO:HyperLabel := HyperLabel{#escPRO,"...",NULL_STRING,NULL_STRING}
oCCescPRO:TooltipText := "Escolher Procedimento"

oCCCalcular := PushButton{self,ResourceID{JMO_CALCULAR,_GetInst()}}
oCCCalcular:HyperLabel := HyperLabel{#Calcular,"Calcular Candidatos","Calcular Candidatos",NULL_STRING}
oCCCalcular:TooltipText := "Calcular Candidatos"

oDCDATATAL := SingleLineEdit{self,ResourceID{JMO_DATATAL,_GetInst()}}
oDCDATATAL:FieldSpec := DATE_FIELD{}
oDCDATATAL:HyperLabel := HyperLabel{#DATATAL,"Codigo:","Data Ultimo Calculo Candidato","MP02_CODIGO"}
oDCDATATAL:TooltipText := "Data Ultimo Calculo Candidatos"
oDCDATATAL:BackGround := aBrushes[1]

oDCSC_SETOR1 := FixedText{self,ResourceID{JMO_SC_SETOR1,_GetInst()}}
oDCSC_SETOR1:HyperLabel := HyperLabel{#SC_SETOR1,"Escolaridade",NULL_STRING,NULL_STRING}

oDCSC_SETOR2 := FixedText{self,ResourceID{JMO_SC_SETOR2,_GetInst()}}
oDCSC_SETOR2:HyperLabel := HyperLabel{#SC_SETOR2,"Sup Imediato",NULL_STRING,NULL_STRING}

oDCSC_SETOR3 := FixedText{self,ResourceID{JMO_SC_SETOR3,_GetInst()}}
oDCSC_SETOR3:HyperLabel := HyperLabel{#SC_SETOR3,"Data Rev.:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JMO_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_VALOR := FixedText{self,ResourceID{JMO_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JMO_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Mão de Obra Operador (Funções)",NULL_STRING,NULL_STRING}

oDCFT3 := FixedText{self,ResourceID{JMO_FT3,_GetInst()}}
oDCFT3:HyperLabel := HyperLabel{#FT3,"Area",NULL_STRING,NULL_STRING}

oDCCURSO := SingleLineEdit{self,ResourceID{JMO_CURSO,_GetInst()}}
oDCCURSO:FieldSpec := PADRAO_CHAR_20{}
oDCCURSO:HyperLabel := HyperLabel{#CURSO,NULL_STRING,"Codigo do Curso",NULL_STRING}
oDCCURSO:TooltipText := "Codigo do Curso"

oCCINCLUIR := PushButton{self,ResourceID{JMO_INCLUIR,_GetInst()}}
oCCINCLUIR:HyperLabel := HyperLabel{#INCLUIR,"Incluir",NULL_STRING,NULL_STRING}
oCCINCLUIR:TooltipText := "Incluir Curso"

oCCExcluir := PushButton{self,ResourceID{JMO_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}
oCCExcluir:TooltipText := "Excluir Curso"

oDCFT4 := FixedText{self,ResourceID{JMO_FT4,_GetInst()}}
oDCFT4:HyperLabel := HyperLabel{#FT4,"Curso",NULL_STRING,NULL_STRING}

oDCSC_SETOR4 := FixedText{self,ResourceID{JMO_SC_SETOR4,_GetInst()}}
oDCSC_SETOR4:HyperLabel := HyperLabel{#SC_SETOR4,"Escol.Futura",NULL_STRING,NULL_STRING}

oDCESCOLa2 := combobox{self,ResourceID{JMO_ESCOLA2,_GetInst()}}
oDCESCOLa2:FieldSpec := PADRAO_CHAR_02{}
oDCESCOLa2:FillUsing(Self:PEGRHES2( ))
oDCESCOLa2:HyperLabel := HyperLabel{#ESCOLa2,NULL_STRING,NULL_STRING,NULL_STRING}
oDCESCOLa2:TooltipText := "Escolaridade Futura"

oDCESCOLD2 := SingleLineEdit{self,ResourceID{JMO_ESCOLD2,_GetInst()}}
oDCESCOLD2:FieldSpec := PADRAO_CHAR_100{}
oDCESCOLD2:HyperLabel := HyperLabel{#ESCOLD2,"Nome:",NULL_STRING,"MP02_NOME"}
oDCESCOLD2:TooltipText := "Descrição Escolaridade"

oCCcmdHoje := PushButton{self,ResourceID{JMO_CMDHOJE,_GetInst()}}
oCCcmdHoje:HyperLabel := HyperLabel{#cmdHoje,"H",NULL_STRING,NULL_STRING}
oCCcmdHoje:TooltipText := "Marcar a Data Revisao Com Data Atual"

oCCpegcurdes := PushButton{self,ResourceID{JMO_PEGCURDES,_GetInst()}}
oCCpegcurdes:HyperLabel := HyperLabel{#pegcurdes,"..i",NULL_STRING,NULL_STRING}
oCCpegcurdes:TooltipText := "Clique para Ver o Descriçao do Curso"

oCCpegprodes := PushButton{self,ResourceID{JMO_PEGPRODES,_GetInst()}}
oCCpegprodes:HyperLabel := HyperLabel{#pegprodes,"..i",NULL_STRING,NULL_STRING}
oCCpegprodes:TooltipText := "Clique para Ver o Descriçao do Procedimento"

oDCESCOLa3 := combobox{self,ResourceID{JMO_ESCOLA3,_GetInst()}}
oDCESCOLa3:FieldSpec := PADRAO_CHAR_02{}
oDCESCOLa3:FillUsing(Self:PEGRHES2( ))
oDCESCOLa3:HyperLabel := HyperLabel{#ESCOLa3,NULL_STRING,NULL_STRING,NULL_STRING}
oDCESCOLa3:TooltipText := "Escolaridade Futura"

oDCESCOLD3 := SingleLineEdit{self,ResourceID{JMO_ESCOLD3,_GetInst()}}
oDCESCOLD3:FieldSpec := PADRAO_CHAR_100{}
oDCESCOLD3:HyperLabel := HyperLabel{#ESCOLD3,"Nome:",NULL_STRING,"MP02_NOME"}
oDCESCOLD3:TooltipText := "Descrição Escolaridade"

self:Caption := "Mão de Obra Operador (Funções)"
self:HyperLabel := HyperLabel{#JMO,"Mão de Obra Operador (Funções)",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_12{}}
oDBCODIGO:Width := 19
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_30{}}
oDBNOME:Width := 29
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBVALOR := DataColumn{PADRAO_NUM_12_2{}}
oDBVALOR:Width := 24
oDBVALOR:HyperLabel := oDCVALOR:HyperLabel 
oDBVALOR:Caption := "Valor:"
self:Browser:AddColumn(oDBVALOR)


self:ViewAs(#FormView)

oSFJMPp := JMPp{self,JMO_JMPP}
oSFJMPp:show()
oTPTABCONTROL1_PAGE1 := TABCONTROL1_PAGE1{self, 0}
oDCTabControl1:AppendTab(#TABCONTROL1_PAGE1,"Descrição",oTPTABCONTROL1_PAGE1,0)
oTPTABCONTROL1_PAGE2 := TABCONTROL1_PAGE2{self, 0}
oDCTabControl1:AppendTab(#TABCONTROL1_PAGE2,"Requisitos Necessarios",oTPTABCONTROL1_PAGE2,0)
oTPTABCONTROL1_PAGE3 := TABCONTROL1_PAGE3{self, 0}
oDCTabControl1:AppendTab(#TABCONTROL1_PAGE3,"Requisitos Desejaveis",oTPTABCONTROL1_PAGE3,0)
oTPTABCONTROL1_PAGE4 := TABCONTROL1_PAGE4{self, 0}
oDCTabControl1:AppendTab(#TABCONTROL1_PAGE4,"Habilidade",oTPTABCONTROL1_PAGE4,0)
oTPTABCONTROL1_PAGE5 := TABCONTROL1_PAGE5{self, 0}
oDCTabControl1:AppendTab(#TABCONTROL1_PAGE5,"Experiencia",oTPTABCONTROL1_PAGE5,0)
oTPTABCONTROL1_PAGE6 := TABCONTROL1_PAGE6{self, 0}
oDCTabControl1:AppendTab(#TABCONTROL1_PAGE6,"Page",oTPTABCONTROL1_PAGE6,0)
oDCTabControl1:SelectTab(#TABCONTROL1_PAGE1)

oSFJMP2 := JMP2{self,JMO_JMP2}
oSFJMP2:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


METHOD pegcurdes( ) 
LOCAL aPRO AS ARRAY
LOCAL cCOD
cCOD:=SELF:oSFJMP2:SERVER:curso
IF ! Empty(cCOD)
   aPRO:=PEGCUR(cCOD,ZCURINI,ZCURDIR)
   IF aPRO[1]=.T.
      alert(Apro[2])	
   ENDIF	
ENDIF	

METHOD pegprodes( ) 
LOCAL aPRO AS ARRAY
LOCAL cCOD
cCOD:=SELF:oSFJMPp:SERVER:curso
IF ! Empty(cCOD)
   aPRO:=PEGPRO(cCOD,ZCURINI,ZCURDIR)
   IF aPRO[1]=.T.
      alert(Apro[2])	
   ENDIF	
ENDIF		

access PROCTO() 
return self:FieldGet(#PROCTO)


assign PROCTO(uValue) 
self:FieldPut(#PROCTO, uValue)
return PROCTO := uValue


access SETOR() 
return self:FieldGet(#SETOR)


assign SETOR(uValue) 
self:FieldPut(#SETOR, uValue)
return SETOR := uValue


access SUPIME() 
return self:FieldGet(#SUPIME)


assign SUPIME(uValue) 
self:FieldPut(#SUPIME, uValue)
return SUPIME := uValue


access VALOR() 
return self:FieldGet(#VALOR)


assign VALOR(uValue) 
self:FieldPut(#VALOR, uValue)
return VALOR := uValue


END CLASS
class TabControl1_Page1 inherit DATAWINDOW 

	protect oDCDES01 as SINGLELINEEDIT
	protect oDCDES02 as SINGLELINEEDIT
	protect oDCDES03 as SINGLELINEEDIT
	protect oDCDES04 as SINGLELINEEDIT
	protect oDCDES05 as SINGLELINEEDIT
	protect oDCDES06 as SINGLELINEEDIT
	protect oDCDES07 as SINGLELINEEDIT
	protect oDCDES08 as SINGLELINEEDIT
	protect oDCDES09 as SINGLELINEEDIT
	protect oDCDES10 as SINGLELINEEDIT
// 	instance DES01 
// 	instance DES02 
// 	instance DES03 
// 	instance DES04 
// 	instance DES05 
// 	instance DES06 
// 	instance DES07 
// 	instance DES08 
// 	instance DES09 
// 	instance DES10 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DES01() 
return self:FieldGet(#DES01)


assign DES01(uValue) 
self:FieldPut(#DES01, uValue)
return DES01 := uValue


access DES02() 
return self:FieldGet(#DES02)


assign DES02(uValue) 
self:FieldPut(#DES02, uValue)
return DES02 := uValue


access DES03() 
return self:FieldGet(#DES03)


assign DES03(uValue) 
self:FieldPut(#DES03, uValue)
return DES03 := uValue


access DES04() 
return self:FieldGet(#DES04)


assign DES04(uValue) 
self:FieldPut(#DES04, uValue)
return DES04 := uValue


access DES05() 
return self:FieldGet(#DES05)


assign DES05(uValue) 
self:FieldPut(#DES05, uValue)
return DES05 := uValue


access DES06() 
return self:FieldGet(#DES06)


assign DES06(uValue) 
self:FieldPut(#DES06, uValue)
return DES06 := uValue


access DES07() 
return self:FieldGet(#DES07)


assign DES07(uValue) 
self:FieldPut(#DES07, uValue)
return DES07 := uValue


access DES08() 
return self:FieldGet(#DES08)


assign DES08(uValue) 
self:FieldPut(#DES08, uValue)
return DES08 := uValue


access DES09() 
return self:FieldGet(#DES09)


assign DES09(uValue) 
self:FieldPut(#DES09, uValue)
return DES09 := uValue


access DES10() 
return self:FieldGet(#DES10)


assign DES10(uValue) 
self:FieldPut(#DES10, uValue)
return DES10 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"TabControl1_Page1",_GetInst()},iCtlID)

oDCDES01 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE1_DES01,_GetInst()}}
oDCDES01:FieldSpec := PADRAO_CHAR_150{}
oDCDES01:HyperLabel := HyperLabel{#DES01,"Des01:",NULL_STRING,"MP02_DES01"}

oDCDES02 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE1_DES02,_GetInst()}}
oDCDES02:FieldSpec := PADRAO_CHAR_150{}
oDCDES02:HyperLabel := HyperLabel{#DES02,"Des02:",NULL_STRING,"MP02_DES02"}

oDCDES03 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE1_DES03,_GetInst()}}
oDCDES03:FieldSpec := PADRAO_CHAR_150{}
oDCDES03:HyperLabel := HyperLabel{#DES03,"Des03:",NULL_STRING,"MP02_DES03"}

oDCDES04 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE1_DES04,_GetInst()}}
oDCDES04:FieldSpec := PADRAO_CHAR_150{}
oDCDES04:HyperLabel := HyperLabel{#DES04,"Des04:",NULL_STRING,"MP02_DES04"}

oDCDES05 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE1_DES05,_GetInst()}}
oDCDES05:FieldSpec := PADRAO_CHAR_150{}
oDCDES05:HyperLabel := HyperLabel{#DES05,"Des05:",NULL_STRING,"MP02_DES05"}

oDCDES06 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE1_DES06,_GetInst()}}
oDCDES06:FieldSpec := PADRAO_CHAR_150{}
oDCDES06:HyperLabel := HyperLabel{#DES06,"Des06:",NULL_STRING,"MP02_DES06"}

oDCDES07 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE1_DES07,_GetInst()}}
oDCDES07:FieldSpec := PADRAO_CHAR_150{}
oDCDES07:HyperLabel := HyperLabel{#DES07,"Des07:",NULL_STRING,"MP02_DES07"}

oDCDES08 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE1_DES08,_GetInst()}}
oDCDES08:FieldSpec := PADRAO_CHAR_150{}
oDCDES08:HyperLabel := HyperLabel{#DES08,"Des08:",NULL_STRING,"MP02_DES08"}

oDCDES09 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE1_DES09,_GetInst()}}
oDCDES09:FieldSpec := PADRAO_CHAR_150{}
oDCDES09:HyperLabel := HyperLabel{#DES09,"Des09:",NULL_STRING,"MP02_DES09"}

oDCDES10 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE1_DES10,_GetInst()}}
oDCDES10:FieldSpec := PADRAO_CHAR_150{}
oDCDES10:HyperLabel := HyperLabel{#DES10,"Des10:",NULL_STRING,"MP02_DES10"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#TabControl1_Page1,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
class TabControl1_Page2 inherit DATAWINDOW 

	protect oDCREQ01 as SINGLELINEEDIT
	protect oDCREQ02 as SINGLELINEEDIT
	protect oDCREQ03 as SINGLELINEEDIT
	protect oDCREQ04 as SINGLELINEEDIT
	protect oDCREQ05 as SINGLELINEEDIT
	protect oDCREQ06 as SINGLELINEEDIT
	protect oDCREQ07 as SINGLELINEEDIT
	protect oDCREQ08 as SINGLELINEEDIT
	protect oDCREQ09 as SINGLELINEEDIT
	protect oDCREQ10 as SINGLELINEEDIT
// 	instance REQ01 
// 	instance REQ02 
// 	instance REQ03 
// 	instance REQ04 
// 	instance REQ05 
// 	instance REQ06 
// 	instance REQ07 
// 	instance REQ08 
// 	instance REQ09 
// 	instance REQ10 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"TabControl1_Page2",_GetInst()},iCtlID)

oDCREQ01 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE2_REQ01,_GetInst()}}
oDCREQ01:FieldSpec := PADRAO_CHAR_100{}
oDCREQ01:HyperLabel := HyperLabel{#REQ01,"Req01:",NULL_STRING,"MP02_REQ01"}

oDCREQ02 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE2_REQ02,_GetInst()}}
oDCREQ02:FieldSpec := PADRAO_CHAR_100{}
oDCREQ02:HyperLabel := HyperLabel{#REQ02,"Req02:",NULL_STRING,"MP02_REQ02"}

oDCREQ03 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE2_REQ03,_GetInst()}}
oDCREQ03:FieldSpec := PADRAO_CHAR_100{}
oDCREQ03:HyperLabel := HyperLabel{#REQ03,"Req03:",NULL_STRING,"MP02_REQ03"}

oDCREQ04 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE2_REQ04,_GetInst()}}
oDCREQ04:FieldSpec := PADRAO_CHAR_100{}
oDCREQ04:HyperLabel := HyperLabel{#REQ04,"Req04:",NULL_STRING,"MP02_REQ04"}

oDCREQ05 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE2_REQ05,_GetInst()}}
oDCREQ05:FieldSpec := PADRAO_CHAR_100{}
oDCREQ05:HyperLabel := HyperLabel{#REQ05,"Req05:",NULL_STRING,"MP02_REQ05"}

oDCREQ06 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE2_REQ06,_GetInst()}}
oDCREQ06:FieldSpec := PADRAO_CHAR_100{}
oDCREQ06:HyperLabel := HyperLabel{#REQ06,"Req06:",NULL_STRING,"MP02_REQ06"}

oDCREQ07 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE2_REQ07,_GetInst()}}
oDCREQ07:FieldSpec := PADRAO_CHAR_100{}
oDCREQ07:HyperLabel := HyperLabel{#REQ07,"Req07:",NULL_STRING,"MP02_REQ07"}

oDCREQ08 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE2_REQ08,_GetInst()}}
oDCREQ08:FieldSpec := PADRAO_CHAR_100{}
oDCREQ08:HyperLabel := HyperLabel{#REQ08,"Req08:",NULL_STRING,"MP02_REQ08"}

oDCREQ09 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE2_REQ09,_GetInst()}}
oDCREQ09:FieldSpec := PADRAO_CHAR_100{}
oDCREQ09:HyperLabel := HyperLabel{#REQ09,"Req09:",NULL_STRING,"MP02_REQ09"}

oDCREQ10 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE2_REQ10,_GetInst()}}
oDCREQ10:FieldSpec := PADRAO_CHAR_100{}
oDCREQ10:HyperLabel := HyperLabel{#REQ10,"Req10:",NULL_STRING,"MP02_REQ10"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#TabControl1_Page2,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access REQ01() 
return self:FieldGet(#REQ01)


assign REQ01(uValue) 
self:FieldPut(#REQ01, uValue)
return REQ01 := uValue


access REQ02() 
return self:FieldGet(#REQ02)


assign REQ02(uValue) 
self:FieldPut(#REQ02, uValue)
return REQ02 := uValue


access REQ03() 
return self:FieldGet(#REQ03)


assign REQ03(uValue) 
self:FieldPut(#REQ03, uValue)
return REQ03 := uValue


access REQ04() 
return self:FieldGet(#REQ04)


assign REQ04(uValue) 
self:FieldPut(#REQ04, uValue)
return REQ04 := uValue


access REQ05() 
return self:FieldGet(#REQ05)


assign REQ05(uValue) 
self:FieldPut(#REQ05, uValue)
return REQ05 := uValue


access REQ06() 
return self:FieldGet(#REQ06)


assign REQ06(uValue) 
self:FieldPut(#REQ06, uValue)
return REQ06 := uValue


access REQ07() 
return self:FieldGet(#REQ07)


assign REQ07(uValue) 
self:FieldPut(#REQ07, uValue)
return REQ07 := uValue


access REQ08() 
return self:FieldGet(#REQ08)


assign REQ08(uValue) 
self:FieldPut(#REQ08, uValue)
return REQ08 := uValue


access REQ09() 
return self:FieldGet(#REQ09)


assign REQ09(uValue) 
self:FieldPut(#REQ09, uValue)
return REQ09 := uValue


access REQ10() 
return self:FieldGet(#REQ10)


assign REQ10(uValue) 
self:FieldPut(#REQ10, uValue)
return REQ10 := uValue


END CLASS
class TabControl1_Page3 inherit DATAWINDOW 

	protect oDCRED01 as SINGLELINEEDIT
	protect oDCRED02 as SINGLELINEEDIT
	protect oDCRED03 as SINGLELINEEDIT
	protect oDCRED04 as SINGLELINEEDIT
	protect oDCRED05 as SINGLELINEEDIT
	protect oDCRED06 as SINGLELINEEDIT
	protect oDCRED07 as SINGLELINEEDIT
	protect oDCRED08 as SINGLELINEEDIT
	protect oDCRED09 as SINGLELINEEDIT
	protect oDCRED10 as SINGLELINEEDIT
// 	instance RED01 
// 	instance RED02 
// 	instance RED03 
// 	instance RED04 
// 	instance RED05 
// 	instance RED06 
// 	instance RED07 
// 	instance RED08 
// 	instance RED09 
// 	instance RED10 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"TabControl1_Page3",_GetInst()},iCtlID)

oDCRED01 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE3_RED01,_GetInst()}}
oDCRED01:FieldSpec := PADRAO_CHAR_75{}
oDCRED01:HyperLabel := HyperLabel{#RED01,"Red01:",NULL_STRING,"MP02_RED01"}

oDCRED02 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE3_RED02,_GetInst()}}
oDCRED02:FieldSpec := PADRAO_CHAR_75{}
oDCRED02:HyperLabel := HyperLabel{#RED02,"Red02:",NULL_STRING,"MP02_RED02"}

oDCRED03 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE3_RED03,_GetInst()}}
oDCRED03:FieldSpec := PADRAO_CHAR_75{}
oDCRED03:HyperLabel := HyperLabel{#RED03,"Red03:",NULL_STRING,"MP02_RED03"}

oDCRED04 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE3_RED04,_GetInst()}}
oDCRED04:FieldSpec := PADRAO_CHAR_75{}
oDCRED04:HyperLabel := HyperLabel{#RED04,"Red04:",NULL_STRING,"MP02_RED04"}

oDCRED05 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE3_RED05,_GetInst()}}
oDCRED05:FieldSpec := PADRAO_CHAR_75{}
oDCRED05:HyperLabel := HyperLabel{#RED05,"Red05:",NULL_STRING,"MP02_RED05"}

oDCRED06 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE3_RED06,_GetInst()}}
oDCRED06:FieldSpec := PADRAO_CHAR_75{}
oDCRED06:HyperLabel := HyperLabel{#RED06,"Red06:",NULL_STRING,"MP02_RED06"}

oDCRED07 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE3_RED07,_GetInst()}}
oDCRED07:FieldSpec := PADRAO_CHAR_75{}
oDCRED07:HyperLabel := HyperLabel{#RED07,"Red07:",NULL_STRING,"MP02_RED07"}

oDCRED08 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE3_RED08,_GetInst()}}
oDCRED08:FieldSpec := PADRAO_CHAR_75{}
oDCRED08:HyperLabel := HyperLabel{#RED08,"Red08:",NULL_STRING,"MP02_RED08"}

oDCRED09 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE3_RED09,_GetInst()}}
oDCRED09:FieldSpec := PADRAO_CHAR_75{}
oDCRED09:HyperLabel := HyperLabel{#RED09,"Red09:",NULL_STRING,"MP02_RED09"}

oDCRED10 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE3_RED10,_GetInst()}}
oDCRED10:FieldSpec := PADRAO_CHAR_75{}
oDCRED10:HyperLabel := HyperLabel{#RED10,"Red10:",NULL_STRING,"MP02_RED10"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#TabControl1_Page3,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access RED01() 
return self:FieldGet(#RED01)


assign RED01(uValue) 
self:FieldPut(#RED01, uValue)
return RED01 := uValue


access RED02() 
return self:FieldGet(#RED02)


assign RED02(uValue) 
self:FieldPut(#RED02, uValue)
return RED02 := uValue


access RED03() 
return self:FieldGet(#RED03)


assign RED03(uValue) 
self:FieldPut(#RED03, uValue)
return RED03 := uValue


access RED04() 
return self:FieldGet(#RED04)


assign RED04(uValue) 
self:FieldPut(#RED04, uValue)
return RED04 := uValue


access RED05() 
return self:FieldGet(#RED05)


assign RED05(uValue) 
self:FieldPut(#RED05, uValue)
return RED05 := uValue


access RED06() 
return self:FieldGet(#RED06)


assign RED06(uValue) 
self:FieldPut(#RED06, uValue)
return RED06 := uValue


access RED07() 
return self:FieldGet(#RED07)


assign RED07(uValue) 
self:FieldPut(#RED07, uValue)
return RED07 := uValue


access RED08() 
return self:FieldGet(#RED08)


assign RED08(uValue) 
self:FieldPut(#RED08, uValue)
return RED08 := uValue


access RED09() 
return self:FieldGet(#RED09)


assign RED09(uValue) 
self:FieldPut(#RED09, uValue)
return RED09 := uValue


access RED10() 
return self:FieldGet(#RED10)


assign RED10(uValue) 
self:FieldPut(#RED10, uValue)
return RED10 := uValue


END CLASS
class TabControl1_Page4 inherit DATAWINDOW 

	protect oDCHAB01 as SINGLELINEEDIT
	protect oDCHAB02 as SINGLELINEEDIT
	protect oDCHAB03 as SINGLELINEEDIT
// 	instance HAB01 
// 	instance HAB02 
// 	instance HAB03 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access HAB01() 
return self:FieldGet(#HAB01)


assign HAB01(uValue) 
self:FieldPut(#HAB01, uValue)
return HAB01 := uValue


access HAB02() 
return self:FieldGet(#HAB02)


assign HAB02(uValue) 
self:FieldPut(#HAB02, uValue)
return HAB02 := uValue


access HAB03() 
return self:FieldGet(#HAB03)


assign HAB03(uValue) 
self:FieldPut(#HAB03, uValue)
return HAB03 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"TabControl1_Page4",_GetInst()},iCtlID)

oDCHAB01 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE4_HAB01,_GetInst()}}
oDCHAB01:FieldSpec := PADRAO_CHAR_75{}
oDCHAB01:HyperLabel := HyperLabel{#HAB01,"Hab01:",NULL_STRING,"MP02_HAB01"}

oDCHAB02 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE4_HAB02,_GetInst()}}
oDCHAB02:FieldSpec := PADRAO_CHAR_75{}
oDCHAB02:HyperLabel := HyperLabel{#HAB02,"Hab02:",NULL_STRING,"MP02_HAB02"}

oDCHAB03 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE4_HAB03,_GetInst()}}
oDCHAB03:FieldSpec := PADRAO_CHAR_75{}
oDCHAB03:HyperLabel := HyperLabel{#HAB03,"Hab03:",NULL_STRING,"MP02_HAB03"}

self:Caption := "Habilidade"
self:HyperLabel := HyperLabel{#TabControl1_Page4,"Habilidade",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
class TabControl1_Page5 inherit DATAWINDOW 

	protect oDCEXP01 as SINGLELINEEDIT
	protect oDCEXP02 as SINGLELINEEDIT
	protect oDCEXP03 as SINGLELINEEDIT
// 	instance EXP01 
// 	instance EXP02 
// 	instance EXP03 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access EXP01() 
return self:FieldGet(#EXP01)


assign EXP01(uValue) 
self:FieldPut(#EXP01, uValue)
return EXP01 := uValue


access EXP02() 
return self:FieldGet(#EXP02)


assign EXP02(uValue) 
self:FieldPut(#EXP02, uValue)
return EXP02 := uValue


access EXP03() 
return self:FieldGet(#EXP03)


assign EXP03(uValue) 
self:FieldPut(#EXP03, uValue)
return EXP03 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"TabControl1_Page5",_GetInst()},iCtlID)

oDCEXP01 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE5_EXP01,_GetInst()}}
oDCEXP01:FieldSpec := PADRAO_CHAR_75{}
oDCEXP01:HyperLabel := HyperLabel{#EXP01,"Exp01:",NULL_STRING,"MP02_EXP01"}

oDCEXP02 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE5_EXP02,_GetInst()}}
oDCEXP02:FieldSpec := PADRAO_CHAR_75{}
oDCEXP02:HyperLabel := HyperLabel{#EXP02,"Exp02:",NULL_STRING,"MP02_EXP02"}

oDCEXP03 := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE5_EXP03,_GetInst()}}
oDCEXP03:FieldSpec := PADRAO_CHAR_75{}
oDCEXP03:HyperLabel := HyperLabel{#EXP03,"Exp03:",NULL_STRING,"MP02_EXP03"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#TabControl1_Page5,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
class TabControl1_Page6 inherit DATAWINDOW 

	protect oDCELANOM as SINGLELINEEDIT
	protect oCCPEGSOL as PUSHBUTTON
	protect oCCESCSOL as PUSHBUTTON
	protect oDCELANUM as RIGHTSLE
	protect oDCSC_NINSTU1 as FIXEDTEXT
	protect oDCELADAT as DATESLE
	protect oDCANADAT as DATESLE
	protect oCCPEGSOL1 as PUSHBUTTON
	protect oDCANANOM as SINGLELINEEDIT
	protect oCCESCSOL1 as PUSHBUTTON
	protect oDCANANUM as RIGHTSLE
	protect oDCSC_NINSTU2 as FIXEDTEXT
	protect oDCAPRDAT as DATESLE
	protect oCCPEGSOL2 as PUSHBUTTON
	protect oDCAPRNOM as SINGLELINEEDIT
	protect oCCESCSOL2 as PUSHBUTTON
	protect oDCAPRNUM as RIGHTSLE
	protect oDCSC_NINSTU3 as FIXEDTEXT
// 	instance ELANOM 
// 	instance ELANUM 
// 	instance ELADAT 
// 	instance ANADAT 
// 	instance ANANOM 
// 	instance ANANUM 
// 	instance APRDAT 
// 	instance APRNOM 
// 	instance APRNUM 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANADAT() 
return self:FieldGet(#ANADAT)


assign ANADAT(uValue) 
self:FieldPut(#ANADAT, uValue)
return ANADAT := uValue


access ANANOM() 
return self:FieldGet(#ANANOM)


assign ANANOM(uValue) 
self:FieldPut(#ANANOM, uValue)
return ANANOM := uValue


access ANANUM() 
return self:FieldGet(#ANANUM)


assign ANANUM(uValue) 
self:FieldPut(#ANANUM, uValue)
return ANANUM := uValue


access APRDAT() 
return self:FieldGet(#APRDAT)


assign APRDAT(uValue) 
self:FieldPut(#APRDAT, uValue)
return APRDAT := uValue


access APRNOM() 
return self:FieldGet(#APRNOM)


assign APRNOM(uValue) 
self:FieldPut(#APRNOM, uValue)
return APRNOM := uValue


access APRNUM() 
return self:FieldGet(#APRNUM)


assign APRNUM(uValue) 
self:FieldPut(#APRNUM, uValue)
return APRNUM := uValue


access ELADAT() 
return self:FieldGet(#ELADAT)


assign ELADAT(uValue) 
self:FieldPut(#ELADAT, uValue)
return ELADAT := uValue


access ELANOM() 
return self:FieldGet(#ELANOM)


assign ELANOM(uValue) 
self:FieldPut(#ELANOM, uValue)
return ELANOM := uValue


access ELANUM() 
return self:FieldGet(#ELANUM)


assign ELANUM(uValue) 
self:FieldPut(#ELANUM, uValue)
return ELANUM := uValue


METHOD ESCSOL( ) 
LOCAL oESCMP04 AS XESCMP04
oESCMP04:=XESCMP04{SELF}
IF oESCMP04:LOK
   SELF:SERVER:FIELDPUT("ELANUM",oESCMP04:NUMERO)
   SELF:SERVER:FIELDPUT("ELANOM",oESCMP04:NOME)
ENDIF	

METHOD ESCSOL1( ) 
LOCAL oESCMP04 AS XESCMP04
oESCMP04:=XESCMP04{SELF}
IF oESCMP04:LOK
   SELF:SERVER:FIELDPUT("ANANUM",oESCMP04:NUMERO)
   SELF:SERVER:FIELDPUT("ANANOM",oESCMP04:NOME)
ENDIF		

METHOD ESCSOL2( ) 
LOCAL oESCMP04 AS XESCMP04
oESCMP04:=XESCMP04{SELF}
IF oESCMP04:LOK
   SELF:SERVER:FIELDPUT("APRNUM",oESCMP04:NUMERO)
   SELF:SERVER:FIELDPUT("APRNOM",oESCMP04:NOME)
ENDIF		

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"TabControl1_Page6",_GetInst()},iCtlID)

oDCELANOM := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE6_ELANOM,_GetInst()}}
oDCELANOM:FieldSpec := PADRAO_CHAR_30{}
oDCELANOM:HyperLabel := HyperLabel{#ELANOM,"Instru:",NULL_STRING,"TREIN_INSTRU"}
oDCELANOM:TooltipText := "Nome do Solicitabnte"

oCCPEGSOL := PushButton{self,ResourceID{TABCONTROL1_PAGE6_PEGSOL,_GetInst()}}
oCCPEGSOL:HyperLabel := HyperLabel{#PEGSOL,"-->",NULL_STRING,NULL_STRING}

oCCESCSOL := PushButton{self,ResourceID{TABCONTROL1_PAGE6_ESCSOL,_GetInst()}}
oCCESCSOL:HyperLabel := HyperLabel{#ESCSOL,"...",NULL_STRING,NULL_STRING}

oDCELANUM := rightSle{self,ResourceID{TABCONTROL1_PAGE6_ELANUM,_GetInst()}}
oDCELANUM:FieldSpec := PADRAO_NUM_08{}
oDCELANUM:HyperLabel := HyperLabel{#ELANUM,"Ninstu:",NULL_STRING,"TREIN_NINSTU"}
oDCELANUM:TooltipText := "Numero do Solicitante do Curso"

oDCSC_NINSTU1 := FixedText{self,ResourceID{TABCONTROL1_PAGE6_SC_NINSTU1,_GetInst()}}
oDCSC_NINSTU1:HyperLabel := HyperLabel{#SC_NINSTU1,"Elaborador",NULL_STRING,NULL_STRING}

oDCELADAT := DateSle{self,ResourceID{TABCONTROL1_PAGE6_ELADAT,_GetInst()}}
oDCELADAT:FieldSpec := date_FIELD{}
oDCELADAT:HyperLabel := HyperLabel{#ELADAT,"Horini:",NULL_STRING,"TREIN_HORINI"}

oDCANADAT := DateSle{self,ResourceID{TABCONTROL1_PAGE6_ANADAT,_GetInst()}}
oDCANADAT:FieldSpec := date_FIELD{}
oDCANADAT:HyperLabel := HyperLabel{#ANADAT,"Horini:",NULL_STRING,"TREIN_HORINI"}

oCCPEGSOL1 := PushButton{self,ResourceID{TABCONTROL1_PAGE6_PEGSOL1,_GetInst()}}
oCCPEGSOL1:HyperLabel := HyperLabel{#PEGSOL1,"-->",NULL_STRING,NULL_STRING}

oDCANANOM := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE6_ANANOM,_GetInst()}}
oDCANANOM:FieldSpec := PADRAO_CHAR_30{}
oDCANANOM:HyperLabel := HyperLabel{#ANANOM,"Instru:",NULL_STRING,"TREIN_INSTRU"}
oDCANANOM:TooltipText := "Nome do Solicitabnte"

oCCESCSOL1 := PushButton{self,ResourceID{TABCONTROL1_PAGE6_ESCSOL1,_GetInst()}}
oCCESCSOL1:HyperLabel := HyperLabel{#ESCSOL1,"...",NULL_STRING,NULL_STRING}

oDCANANUM := rightSle{self,ResourceID{TABCONTROL1_PAGE6_ANANUM,_GetInst()}}
oDCANANUM:FieldSpec := PADRAO_NUM_08{}
oDCANANUM:HyperLabel := HyperLabel{#ANANUM,"Ninstu:",NULL_STRING,"TREIN_NINSTU"}
oDCANANUM:TooltipText := "Numero do Solicitante do Curso"

oDCSC_NINSTU2 := FixedText{self,ResourceID{TABCONTROL1_PAGE6_SC_NINSTU2,_GetInst()}}
oDCSC_NINSTU2:HyperLabel := HyperLabel{#SC_NINSTU2,"Analise ",NULL_STRING,NULL_STRING}

oDCAPRDAT := DateSle{self,ResourceID{TABCONTROL1_PAGE6_APRDAT,_GetInst()}}
oDCAPRDAT:FieldSpec := date_FIELD{}
oDCAPRDAT:HyperLabel := HyperLabel{#APRDAT,"Horini:",NULL_STRING,"TREIN_HORINI"}

oCCPEGSOL2 := PushButton{self,ResourceID{TABCONTROL1_PAGE6_PEGSOL2,_GetInst()}}
oCCPEGSOL2:HyperLabel := HyperLabel{#PEGSOL2,"-->",NULL_STRING,NULL_STRING}

oDCAPRNOM := SingleLineEdit{self,ResourceID{TABCONTROL1_PAGE6_APRNOM,_GetInst()}}
oDCAPRNOM:FieldSpec := PADRAO_CHAR_30{}
oDCAPRNOM:HyperLabel := HyperLabel{#APRNOM,"Instru:",NULL_STRING,"TREIN_INSTRU"}
oDCAPRNOM:TooltipText := "Nome do Solicitabnte"

oCCESCSOL2 := PushButton{self,ResourceID{TABCONTROL1_PAGE6_ESCSOL2,_GetInst()}}
oCCESCSOL2:HyperLabel := HyperLabel{#ESCSOL2,"...",NULL_STRING,NULL_STRING}

oDCAPRNUM := rightSle{self,ResourceID{TABCONTROL1_PAGE6_APRNUM,_GetInst()}}
oDCAPRNUM:FieldSpec := PADRAO_NUM_08{}
oDCAPRNUM:HyperLabel := HyperLabel{#APRNUM,"Ninstu:",NULL_STRING,"TREIN_NINSTU"}
oDCAPRNUM:TooltipText := "Numero do Solicitante do Curso"

oDCSC_NINSTU3 := FixedText{self,ResourceID{TABCONTROL1_PAGE6_SC_NINSTU3,_GetInst()}}
oDCSC_NINSTU3:HyperLabel := HyperLabel{#SC_NINSTU3,"Aprovacao",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#TabControl1_Page6,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PEGSOL( ) 
LOCAL aTEC AS ARRAY	
aTEC:=PEGMP04(SELF:SERVER:FIELDGET("ELANUM"),ZCURINI,ZCURDIR,{zMES,zANO,ZEMPRESA})
IF aTEC[1]=.T.
   SELF:SERVER:FIELDPUT("ELANOM",aTEC[2])	
ENDIF			

METHOD PEGSOL1( ) 
LOCAL aTEC AS ARRAY	
aTEC:=PEGMP04(SELF:SERVER:FIELDGET("ANANUM"),ZCURINI,ZCURDIR,{zMES,zANO,ZEMPRESA})
IF aTEC[1]=.T.
   SELF:SERVER:FIELDPUT("ANANOM",aTEC[2])	
ENDIF				

METHOD PEGSOL2( ) 
LOCAL aTEC AS ARRAY	
aTEC:=PEGMP04(SELF:SERVER:FIELDGET("APRNUM"),ZCURINI,ZCURDIR,{zMES,zANO,ZEMPRESA})
IF aTEC[1]=.T.
   SELF:SERVER:FIELDPUT("APRNOM",aTEC[2])	
ENDIF				

END CLASS
