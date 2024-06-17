#region DEFINES
STATIC DEFINE JCAF_ALTERAR := 110 
STATIC DEFINE JCAF_ANTERIOR := 108 
STATIC DEFINE JCAF_BUSCANUMERO := 113 
STATIC DEFINE JCAF_CONCEITO := 115 
STATIC DEFINE JCAF_EXCLUIR := 111 
STATIC DEFINE JCAF_INCLUIR := 112 
STATIC DEFINE JCAF_JCAFI := 106 
STATIC DEFINE JCAF_NOME := 105 
STATIC DEFINE JCAF_NUMERO := 103 
STATIC DEFINE JCAF_PROXIMO := 107 
STATIC DEFINE JCAF_QUALIFI := 116 
STATIC DEFINE JCAF_SC_CONCEITO := 101 
STATIC DEFINE JCAF_SC_CONCEITO1 := 114 
STATIC DEFINE JCAF_SC_NOME := 104 
STATIC DEFINE JCAF_SC_NUMERO := 100 
STATIC DEFINE JCAF_SC_QUALIFI := 102 
STATIC DEFINE JCAF_SUBRAMO := 117 
STATIC DEFINE JCAF_TABULAR := 109 
#endregion

PARTIAL class JCAF inherit MYDatadialog 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_CONCEITO as FIXEDTEXT
	protect oDCSC_QUALIFI as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCNOME as SINGLELINEEDIT
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCTabular as PUSHBUTTON
	protect oCCAlterar as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCIncluir as PUSHBUTTON
	protect oCCbuscanumero as PUSHBUTTON
	protect oDCSC_CONCEITO1 as FIXEDTEXT
	protect oDCCONCEITO as COMBOBOX
	protect oDCQUALIFI as COMBOBOX
	protect oDCSUBRAMO as COMBOBOX
// 	instance NUMERO 
// 	instance NOME 
// 	instance CONCEITO 
// 	instance QUALIFI 
// 	instance SUBRAMO 
	protect oSFJCAFI as JCAFI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CONCEITO() 
return self:FieldGet(#CONCEITO)


assign CONCEITO(uValue) 
self:FieldPut(#CONCEITO, uValue)
return CONCEITO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCAF",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_NUMERO := FixedText{self,ResourceID{JCAF_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_CONCEITO := FixedText{self,ResourceID{JCAF_SC_CONCEITO,_GetInst()}}
oDCSC_CONCEITO:HyperLabel := HyperLabel{#SC_CONCEITO,"Conceito:",NULL_STRING,NULL_STRING}

oDCSC_QUALIFI := FixedText{self,ResourceID{JCAF_SC_QUALIFI,_GetInst()}}
oDCSC_QUALIFI:HyperLabel := HyperLabel{#SC_QUALIFI,"Qualificaçäo:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JCAF_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"MB01_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]
oDCNUMERO:Font(aFonts[1], FALSE)

oDCSC_NOME := FixedText{self,ResourceID{JCAF_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JCAF_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MB01_NOME"}
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[1], FALSE)

oCCProximo := PushButton{self,ResourceID{JCAF_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_next{}

oCCAnterior := PushButton{self,ResourceID{JCAF_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_previous{}

oCCTabular := PushButton{self,ResourceID{JCAF_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Ver Itens",NULL_STRING,NULL_STRING}

oCCAlterar := PushButton{self,ResourceID{JCAF_ALTERAR,_GetInst()}}
oCCAlterar:HyperLabel := HyperLabel{#Alterar,"Editar Item",NULL_STRING,NULL_STRING}

oCCExcluir := PushButton{self,ResourceID{JCAF_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}

oCCIncluir := PushButton{self,ResourceID{JCAF_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}

oCCbuscanumero := PushButton{self,ResourceID{JCAF_BUSCANUMERO,_GetInst()}}
oCCbuscanumero:Image := ico_find{}
oCCbuscanumero:HyperLabel := HyperLabel{#buscanumero,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_CONCEITO1 := FixedText{self,ResourceID{JCAF_SC_CONCEITO1,_GetInst()}}
oDCSC_CONCEITO1:HyperLabel := HyperLabel{#SC_CONCEITO1,"Sub Ramo",NULL_STRING,NULL_STRING}

oDCCONCEITO := combobox{self,ResourceID{JCAF_CONCEITO,_GetInst()}}
oDCCONCEITO:HyperLabel := HyperLabel{#CONCEITO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCONCEITO:FillUsing(Self:TABCON( ))
oDCCONCEITO:FieldSpec := PADRAO_CHAR_02{}

oDCQUALIFI := combobox{self,ResourceID{JCAF_QUALIFI,_GetInst()}}
oDCQUALIFI:HyperLabel := HyperLabel{#QUALIFI,NULL_STRING,NULL_STRING,NULL_STRING}
oDCQUALIFI:FillUsing(Self:TABQUA( ))
oDCQUALIFI:FieldSpec := PADRAO_CHAR_12{}

oDCSUBRAMO := combobox{self,ResourceID{JCAF_SUBRAMO,_GetInst()}}
oDCSUBRAMO:HyperLabel := HyperLabel{#SUBRAMO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCSUBRAMO:FillUsing(Self:TABSUB( ))
oDCSUBRAMO:FieldSpec := PADRAO_CHAR_03{}

self:Caption := "Controle de Avaliacao de Fornecedores"
self:HyperLabel := HyperLabel{#JCAF,"Controle de Avaliacao de Fornecedores",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 14
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBNOME := DataColumn{PADRAO_CHAR_40{}}
oDBNOME:Width := 34
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#FormView)

oSFJCAFI := JCAFI{self,JCAF_JCAFI}
oSFJCAFI:show()

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


METHOD PORNUM( ) 
	SELF:KeyFind()

access QUALIFI() 
return self:FieldGet(#QUALIFI)


assign QUALIFI(uValue) 
self:FieldPut(#QUALIFI, uValue)
return QUALIFI := uValue


access SUBRAMO() 
return self:FieldGet(#SUBRAMO)


assign SUBRAMO(uValue) 
self:FieldPut(#SUBRAMO, uValue)
return SUBRAMO := uValue


END CLASS
