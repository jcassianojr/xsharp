#region DEFINES
STATIC DEFINE JME01CR_BUSCA := 116 
STATIC DEFINE JME01CR_CANO := 113 
STATIC DEFINE JME01CR_CODIGO := 104 
STATIC DEFINE JME01CR_EFETUADA := 107 
STATIC DEFINE JME01CR_ESCFOR := 108 
STATIC DEFINE JME01CR_FECHAR := 109 
STATIC DEFINE JME01CR_LVM := 111 
STATIC DEFINE JME01CR_NOME := 105 
STATIC DEFINE JME01CR_ORDEM := 115 
STATIC DEFINE JME01CR_PEGCOD := 110 
STATIC DEFINE JME01CR_PROGRAMA := 106 
STATIC DEFINE JME01CR_SC_CODIGO := 100 
STATIC DEFINE JME01CR_SC_EFETUADA := 103 
STATIC DEFINE JME01CR_SC_EFETUADA1 := 112 
STATIC DEFINE JME01CR_SC_EFETUADA2 := 114 
STATIC DEFINE JME01CR_SC_NOME := 101 
STATIC DEFINE JME01CR_SC_PROGRAMA := 102 
#endregion

PARTIAL class JME01CR inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBPROGRAMA as DataColumn
	PROTECT oDBEFETUADA as DataColumn
	PROTECT oDBLVM as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_PROGRAMA as FIXEDTEXT
	protect oDCSC_EFETUADA as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCPROGRAMA as DATESLE
	protect oDCEFETUADA as SINGLELINEEDIT
	protect oCCescfor as PUSHBUTTON
	protect oCCFechar as PUSHBUTTON
	protect oCCpegcod as PUSHBUTTON
	protect oDCLVM as SINGLELINEEDIT
	protect oDCSC_EFETUADA1 as FIXEDTEXT
	protect oDCCANO as SINGLELINEEDIT
	protect oDCSC_EFETUADA2 as FIXEDTEXT
	protect oCCordem as PUSHBUTTON
	protect oCCbusca as PUSHBUTTON
// 	instance CODIGO 
// 	instance NOME 
// 	instance PROGRAMA 
// 	instance EFETUADA 
// 	instance LVM 
// 	instance CANO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD busca( ) 
	SELF:KeyFind()

access CANO() 
return self:FieldGet(#CANO)


assign CANO(uValue) 
self:FieldPut(#CANO, uValue)
return CANO := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access EFETUADA() 
return self:FieldGet(#EFETUADA)


assign EFETUADA(uValue) 
self:FieldPut(#EFETUADA, uValue)
return EFETUADA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JME01CR",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_CODIGO := FixedText{self,ResourceID{JME01CR_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JME01CR_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_PROGRAMA := FixedText{self,ResourceID{JME01CR_SC_PROGRAMA,_GetInst()}}
oDCSC_PROGRAMA:HyperLabel := HyperLabel{#SC_PROGRAMA,"Programa:",NULL_STRING,NULL_STRING}

oDCSC_EFETUADA := FixedText{self,ResourceID{JME01CR_SC_EFETUADA,_GetInst()}}
oDCSC_EFETUADA:HyperLabel := HyperLabel{#SC_EFETUADA,"Efetuada:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JME01CR_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_04{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"ME01CR_CODIGO"}

oDCNOME := SingleLineEdit{self,ResourceID{JME01CR_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"ME01CR_NOME"}

oDCPROGRAMA := DateSle{self,ResourceID{JME01CR_PROGRAMA,_GetInst()}}
oDCPROGRAMA:FieldSpec := DATE_FIELD{}
oDCPROGRAMA:HyperLabel := HyperLabel{#PROGRAMA,"Programa:",NULL_STRING,"ME01CR_PROGRAMA"}

oDCEFETUADA := SingleLineEdit{self,ResourceID{JME01CR_EFETUADA,_GetInst()}}
oDCEFETUADA:FieldSpec := DATE_FIELD{}
oDCEFETUADA:HyperLabel := HyperLabel{#EFETUADA,"Efetuada:",NULL_STRING,"ME01CR_EFETUADA"}
oDCEFETUADA:BackGround := aBrushes[1]
oDCEFETUADA:Font(aFonts[1], FALSE)

oCCescfor := PushButton{self,ResourceID{JME01CR_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}

oCCFechar := PushButton{self,ResourceID{JME01CR_FECHAR,_GetInst()}}
oCCFechar:HyperLabel := HyperLabel{#Fechar,"Fechar",NULL_STRING,NULL_STRING}

oCCpegcod := PushButton{self,ResourceID{JME01CR_PEGCOD,_GetInst()}}
oCCpegcod:HyperLabel := HyperLabel{#pegcod,"-->",NULL_STRING,NULL_STRING}

oDCLVM := SingleLineEdit{self,ResourceID{JME01CR_LVM,_GetInst()}}
oDCLVM:FieldSpec := PADRAO_NUM_08{}
oDCLVM:HyperLabel := HyperLabel{#LVM,"LVM",NULL_STRING,"ME01CR_EFETUADA"}
oDCLVM:BackGround := aBrushes[1]
oDCLVM:Font(aFonts[1], FALSE)

oDCSC_EFETUADA1 := FixedText{self,ResourceID{JME01CR_SC_EFETUADA1,_GetInst()}}
oDCSC_EFETUADA1:HyperLabel := HyperLabel{#SC_EFETUADA1,"LVM",NULL_STRING,NULL_STRING}

oDCCANO := SingleLineEdit{self,ResourceID{JME01CR_CANO,_GetInst()}}
oDCCANO:FieldSpec := PADRAO_CHAR_04{}
oDCCANO:HyperLabel := HyperLabel{#CANO,NULL_STRING,NULL_STRING,"ME01CR_EFETUADA"}
oDCCANO:BackGround := aBrushes[1]
oDCCANO:Font(aFonts[1], FALSE)

oDCSC_EFETUADA2 := FixedText{self,ResourceID{JME01CR_SC_EFETUADA2,_GetInst()}}
oDCSC_EFETUADA2:HyperLabel := HyperLabel{#SC_EFETUADA2,"Ano",NULL_STRING,NULL_STRING}

oCCordem := PushButton{self,ResourceID{JME01CR_ORDEM,_GetInst()}}
oCCordem:Image := ico_az{}
oCCordem:HyperLabel := HyperLabel{#ordem,NULL_STRING,NULL_STRING,NULL_STRING}
oCCordem:TooltipText := "Ordenar Por Numero"

oCCbusca := PushButton{self,ResourceID{JME01CR_BUSCA,_GetInst()}}
oCCbusca:Image := ICO_FIND{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Cronograma Manutencao Maquinas"
self:HyperLabel := HyperLabel{#JME01CR,"Cronograma Manutencao Maquinas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_04{}}
oDBCODIGO:Width := 10
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_40{}}
oDBNOME:Width := 12
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBPROGRAMA := DataColumn{DATE_FIELD{}}
oDBPROGRAMA:Width := 11
oDBPROGRAMA:HyperLabel := oDCPROGRAMA:HyperLabel 
oDBPROGRAMA:Caption := "Programa:"
self:Browser:AddColumn(oDBPROGRAMA)

oDBEFETUADA := DataColumn{DATE_FIELD{}}
oDBEFETUADA:Width := 11
oDBEFETUADA:HyperLabel := oDCEFETUADA:HyperLabel 
oDBEFETUADA:Caption := "Efetuada:"
oDBEFETUADA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBEFETUADA)

oDBLVM := DataColumn{PADRAO_NUM_08{}}
oDBLVM:Width := 7
oDBLVM:HyperLabel := oDCLVM:HyperLabel 
oDBLVM:Caption := "LVM"
oDBLVM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBLVM)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LVM() 
return self:FieldGet(#LVM)


assign LVM(uValue) 
self:FieldPut(#LVM, uValue)
return LVM := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


METHOD ordem( ) 
	SELF:KeyFind()

access PROGRAMA() 
return self:FieldGet(#PROGRAMA)


assign PROGRAMA(uValue) 
self:FieldPut(#PROGRAMA, uValue)
return PROGRAMA := uValue


END CLASS
