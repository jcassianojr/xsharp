#region DEFINES
STATIC DEFINE JPRO_ANTERIOR := 110 
STATIC DEFINE JPRO_BTNPEGMP01 := 111 
STATIC DEFINE JPRO_BUSCA := 101 
STATIC DEFINE JPRO_CMDESCCOM := 113 
STATIC DEFINE JPRO_CMDESCCOM1 := 114 
STATIC DEFINE JPRO_CMDESCCOM2 := 115 
STATIC DEFINE JPRO_CODIGO := 104 
STATIC DEFINE JPRO_CODIGOINT := 118 
STATIC DEFINE JPRO_ESCCOD := 106 
STATIC DEFINE JPRO_FOTO := 117 
STATIC DEFINE JPRO_JMS03 := 112 
STATIC DEFINE JPRO_JMS06 := 100 
STATIC DEFINE JPRO_NOME := 105 
STATIC DEFINE JPRO_PROXIMO := 109 
STATIC DEFINE JPRO_SAIR := 108 
STATIC DEFINE JPRO_SC_CODIGO := 103 
STATIC DEFINE JPRO_SC_DESTINO2 := 116 
STATIC DEFINE JPRO_SC_NOME := 102 
STATIC DEFINE JPRO_THEFIXEDTEXT9 := 107 
STATIC DEFINE JPRO2_BUSCA := 101 
STATIC DEFINE JPRO2_CODIGO := 104 
STATIC DEFINE JPRO2_CUSTF := 108 
STATIC DEFINE JPRO2_FT3 := 107 
STATIC DEFINE JPRO2_JMS06 := 100 
STATIC DEFINE JPRO2_NOME := 105 
STATIC DEFINE JPRO2_NORMAT := 109 
STATIC DEFINE JPRO2_SC_CODIGO := 103 
STATIC DEFINE JPRO2_SC_CUSTF := 106 
STATIC DEFINE JPRO2_SC_NOME := 102 
#endregion

class JPRO inherit MYDatadialog 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oCCbusca as PUSHBUTTON
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oCCesccod as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCsair as PUSHBUTTON
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCBtnPegmp01 as PUSHBUTTON
	protect oCCcmdesccom as PUSHBUTTON
	protect oCCcmdesccom1 as PUSHBUTTON
	protect oCCcmdesccom2 as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oDCCODIGOINT as SINGLELINEEDIT
// 	instance CODIGO 
// 	instance NOME 
// 	instance CODIGOINT 
	protect oSFJMS06 as JMS06
	protect oSFjms03 as jms03

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

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


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPRO",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oCCbusca := PushButton{self,ResourceID{JPRO_BUSCA,_GetInst()}}
oCCbusca:Image := ico_find{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JPRO_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JPRO_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Código:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JPRO_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MS01_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[1], FALSE)

oDCNOME := SingleLineEdit{self,ResourceID{JPRO_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MS01_NOME"}
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[1], FALSE)

oCCesccod := PushButton{self,ResourceID{JPRO_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{JPRO_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCsair := PushButton{self,ResourceID{JPRO_SAIR,_GetInst()}}
oCCsair:HyperLabel := HyperLabel{#sair,NULL_STRING,NULL_STRING,NULL_STRING}
oCCsair:Image := ico_sair{}

oCCProximo := PushButton{self,ResourceID{JPRO_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_NEXT{}

oCCAnterior := PushButton{self,ResourceID{JPRO_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_PREVIOUS{}

oCCBtnPegmp01 := PushButton{self,ResourceID{JPRO_BTNPEGMP01,_GetInst()}}
oCCBtnPegmp01:HyperLabel := HyperLabel{#BtnPegmp01,"..i",NULL_STRING,NULL_STRING}

oCCcmdesccom := PushButton{self,ResourceID{JPRO_CMDESCCOM,_GetInst()}}
oCCcmdesccom:HyperLabel := HyperLabel{#cmdesccom,"E.",NULL_STRING,NULL_STRING}
oCCcmdesccom:TooltipText := "Escolher o Componente"

oCCcmdesccom1 := PushButton{self,ResourceID{JPRO_CMDESCCOM1,_GetInst()}}
oCCcmdesccom1:HyperLabel := HyperLabel{#cmdesccom1,"E.",NULL_STRING,NULL_STRING}
oCCcmdesccom1:TooltipText := "Escolher a Sequencia"

oCCcmdesccom2 := PushButton{self,ResourceID{JPRO_CMDESCCOM2,_GetInst()}}
oCCcmdesccom2:HyperLabel := HyperLabel{#cmdesccom2,"E.",NULL_STRING,NULL_STRING}
oCCcmdesccom2:TooltipText := "Escolher Produto"

oDCSC_DESTINO2 := FixedText{self,ResourceID{JPRO_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JPRO_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oDCCODIGOINT := SingleLineEdit{self,ResourceID{JPRO_CODIGOINT,_GetInst()}}
oDCCODIGOINT:FieldSpec := padrao_char_24{}
oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT,"Codigo:",NULL_STRING,"MS01_CODIGO"}
oDCCODIGOINT:BackGround := aBrushes[1]
oDCCODIGOINT:Font(aFonts[1], FALSE)

self:Caption := "Cadastro de Produtos"
self:HyperLabel := HyperLabel{#JPRO,"Cadastro de Produtos",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 22
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{padrao_CHAR_40{}}
oDBNOME:Width := 50
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#FormView)

oSFJMS06 := JMS06{self,JPRO_JMS06}
oSFJMS06:show()

oSFjms03 := jms03{self,JPRO_JMS03}
oSFjms03:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


END CLASS
PARTIAL CLASS XJPRO INHERIT JPRO
	EXPORT aRETCOM AS ARRAY
	EXPORT aRETSEQ AS ARRAY
	EXPORT aRETPRO AS ARRAY
	EXPORT cCURINI AS STRING
    EXPORT cDIRFOTO AS STRING	
	EXPORT cCURDIR AS STRING
	EXPORT aCURCFG AS ARRAY


END CLASS
