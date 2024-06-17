#region DEFINES
STATIC DEFINE JMSRD_ACAO01 := 105 
STATIC DEFINE JMSRD_BUSCANUM := 117 
STATIC DEFINE JMSRD_CLIENTE := 102 
STATIC DEFINE JMSRD_CODIGO := 114 
STATIC DEFINE JMSRD_DATA := 100 
STATIC DEFINE JMSRD_DESC01 := 103 
STATIC DEFINE JMSRD_DESC02 := 104 
STATIC DEFINE JMSRD_ESCCLI := 121 
STATIC DEFINE JMSRD_FIXEDTEXT8 := 120 
STATIC DEFINE JMSRD_FOTO := 123 
STATIC DEFINE JMSRD_INV01 := 106 
STATIC DEFINE JMSRD_MSRD := 113 
STATIC DEFINE JMSRD_OCORREU := 101 
STATIC DEFINE JMSRD_PF := 115 
STATIC DEFINE JMSRD_PORNUM := 116 
STATIC DEFINE JMSRD_SC_CODIGO := 108 
STATIC DEFINE JMSRD_SC_DATA := 110 
STATIC DEFINE JMSRD_SC_DESC01 := 112 
STATIC DEFINE JMSRD_SC_DESC2 := 118 
STATIC DEFINE JMSRD_SC_DESC3 := 119 
STATIC DEFINE JMSRD_SC_DESTINO2 := 122 
STATIC DEFINE JMSRD_SC_MSRD := 107 
STATIC DEFINE JMSRD_SC_OCORREU := 111 
STATIC DEFINE JMSRD_SC_PF := 109 
#endregion

PARTIAL class JMSRD inherit MYDataWindow 

	PROTECT oDBMSRD as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBPF as DataColumn
	PROTECT oDBCODIGO as DataColumn
	protect oDCDATA as DATESLE
	protect oDCOCORREU as SINGLELINEEDIT
	protect oDCCLIENTE as RIGHTSLE
	protect oDCDESC01 as SINGLELINEEDIT
	protect oDCDESC02 as SINGLELINEEDIT
	protect oDCACAO01 as SINGLELINEEDIT
	protect oDCINV01 as SINGLELINEEDIT
	protect oDCSC_MSRD as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_PF as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_OCORREU as FIXEDTEXT
	protect oDCSC_DESC01 as FIXEDTEXT
	protect oDCMSRD as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCPF as SINGLELINEEDIT
	protect oCCPORNUM as PUSHBUTTON
	protect oCCBuscanum as PUSHBUTTON
	protect oDCSC_DESC2 as FIXEDTEXT
	protect oDCSC_DESC3 as FIXEDTEXT
	protect oDCFixedText8 as FIXEDTEXT
	protect oCCesccli as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
// 	instance DATA 
// 	instance OCORREU 
// 	instance CLIENTE 
// 	instance DESC01 
// 	instance DESC02 
// 	instance ACAO01 
// 	instance INV01 
// 	instance MSRD 
// 	instance CODIGO 
// 	instance PF 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ACAO01() 
return self:FieldGet(#ACAO01)


assign ACAO01(uValue) 
self:FieldPut(#ACAO01, uValue)
return ACAO01 := uValue


access CLIENTE() 
return self:FieldGet(#CLIENTE)


assign CLIENTE(uValue) 
self:FieldPut(#CLIENTE, uValue)
return CLIENTE := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access DESC01() 
return self:FieldGet(#DESC01)


assign DESC01(uValue) 
self:FieldPut(#DESC01, uValue)
return DESC01 := uValue


access DESC02() 
return self:FieldGet(#DESC02)


assign DESC02(uValue) 
self:FieldPut(#DESC02, uValue)
return DESC02 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMSRD",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDATA := DateSle{self,ResourceID{JMSRD_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"MSRD_DATA"}

oDCOCORREU := SingleLineEdit{self,ResourceID{JMSRD_OCORREU,_GetInst()}}
oDCOCORREU:FieldSpec := padrao_CHAR_20{}
oDCOCORREU:HyperLabel := HyperLabel{#OCORREU,"Ocorreu:",NULL_STRING,"MSRD_OCORREU"}

oDCCLIENTE := rightSle{self,ResourceID{JMSRD_CLIENTE,_GetInst()}}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCLIENTE:FieldSpec := padrao_num_08{}

oDCDESC01 := SingleLineEdit{self,ResourceID{JMSRD_DESC01,_GetInst()}}
oDCDESC01:FieldSpec := padrao_CHAR_80{}
oDCDESC01:HyperLabel := HyperLabel{#DESC01,"Desc01:",NULL_STRING,"MSRD_DESC01"}

oDCDESC02 := SingleLineEdit{self,ResourceID{JMSRD_DESC02,_GetInst()}}
oDCDESC02:FieldSpec := padrao_CHAR_80{}
oDCDESC02:HyperLabel := HyperLabel{#DESC02,"Desc02:",NULL_STRING,"MSRD_DESC02"}

oDCACAO01 := SingleLineEdit{self,ResourceID{JMSRD_ACAO01,_GetInst()}}
oDCACAO01:FieldSpec := padrao_CHAR_80{}
oDCACAO01:HyperLabel := HyperLabel{#ACAO01,NULL_STRING,NULL_STRING,NULL_STRING}

oDCINV01 := SingleLineEdit{self,ResourceID{JMSRD_INV01,_GetInst()}}
oDCINV01:FieldSpec := padrao_CHAR_80{}
oDCINV01:HyperLabel := HyperLabel{#INV01,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_MSRD := FixedText{self,ResourceID{JMSRD_SC_MSRD,_GetInst()}}
oDCSC_MSRD:HyperLabel := HyperLabel{#SC_MSRD,"Msrd:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JMSRD_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_PF := FixedText{self,ResourceID{JMSRD_SC_PF,_GetInst()}}
oDCSC_PF:HyperLabel := HyperLabel{#SC_PF,"Pf:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JMSRD_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_OCORREU := FixedText{self,ResourceID{JMSRD_SC_OCORREU,_GetInst()}}
oDCSC_OCORREU:HyperLabel := HyperLabel{#SC_OCORREU,"Ocorrencia",NULL_STRING,NULL_STRING}

oDCSC_DESC01 := FixedText{self,ResourceID{JMSRD_SC_DESC01,_GetInst()}}
oDCSC_DESC01:HyperLabel := HyperLabel{#SC_DESC01,"Descrição",NULL_STRING,NULL_STRING}

oDCMSRD := SingleLineEdit{self,ResourceID{JMSRD_MSRD,_GetInst()}}
oDCMSRD:FieldSpec := padrao_NUM_08{}
oDCMSRD:HyperLabel := HyperLabel{#MSRD,"Msrd:",NULL_STRING,"MSRD_MSRD"}
oDCMSRD:BackGround := aBrushes[1]
oDCMSRD:Font(aFonts[1], FALSE)

oDCCODIGO := SingleLineEdit{self,ResourceID{JMSRD_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MSRD_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[2], FALSE)

oDCPF := SingleLineEdit{self,ResourceID{JMSRD_PF,_GetInst()}}
oDCPF:FieldSpec := padrao_NUM_08{}
oDCPF:HyperLabel := HyperLabel{#PF,"Pf:",NULL_STRING,"MSRD_PF"}
oDCPF:BackGround := aBrushes[1]
oDCPF:Font(aFonts[2], FALSE)

oCCPORNUM := PushButton{self,ResourceID{JMSRD_PORNUM,_GetInst()}}
oCCPORNUM:Image := ico_az{}
oCCPORNUM:HyperLabel := HyperLabel{#PORNUM,NULL_STRING,NULL_STRING,NULL_STRING}

oCCBuscanum := PushButton{self,ResourceID{JMSRD_BUSCANUM,_GetInst()}}
oCCBuscanum:Image := ico_find{}
oCCBuscanum:HyperLabel := HyperLabel{#Buscanum,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_DESC2 := FixedText{self,ResourceID{JMSRD_SC_DESC2,_GetInst()}}
oDCSC_DESC2:HyperLabel := HyperLabel{#SC_DESC2,"Investigacao \Causa",NULL_STRING,NULL_STRING}

oDCSC_DESC3 := FixedText{self,ResourceID{JMSRD_SC_DESC3,_GetInst()}}
oDCSC_DESC3:HyperLabel := HyperLabel{#SC_DESC3,"Açao Coretiva",NULL_STRING,NULL_STRING}

oDCFixedText8 := FixedText{self,ResourceID{JMSRD_FIXEDTEXT8,_GetInst()}}
oDCFixedText8:HyperLabel := HyperLabel{#FixedText8,"Cliente",NULL_STRING,NULL_STRING}

oCCesccli := PushButton{self,ResourceID{JMSRD_ESCCLI,_GetInst()}}
oCCesccli:HyperLabel := HyperLabel{#esccli,"..",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JMSRD_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JMSRD_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

self:Caption := "Registro Defeitos Produtos"
self:HyperLabel := HyperLabel{#JMSRD,"Registro Defeitos Produtos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBMSRD := DataColumn{padrao_NUM_08{}}
oDBMSRD:Width := 6
oDBMSRD:HyperLabel := oDCMSRD:HyperLabel 
oDBMSRD:Caption := "Msrd:"
oDBMSRD:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMSRD)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 15
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)

oDBPF := DataColumn{padrao_NUM_08{}}
oDBPF:Width := 9
oDBPF:HyperLabel := oDCPF:HyperLabel 
oDBPF:Caption := "Pf:"
oDBPF:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBPF)

oDBCODIGO := DataColumn{padrao_CHAR_24{}}
oDBCODIGO:Width := 28
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access INV01() 
return self:FieldGet(#INV01)


assign INV01(uValue) 
self:FieldPut(#INV01, uValue)
return INV01 := uValue


access MSRD() 
return self:FieldGet(#MSRD)


assign MSRD(uValue) 
self:FieldPut(#MSRD, uValue)
return MSRD := uValue


access OCORREU() 
return self:FieldGet(#OCORREU)


assign OCORREU(uValue) 
self:FieldPut(#OCORREU, uValue)
return OCORREU := uValue


access PF() 
return self:FieldGet(#PF)


assign PF(uValue) 
self:FieldPut(#PF, uValue)
return PF := uValue


END CLASS
