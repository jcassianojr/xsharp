#region DEFINES
STATIC DEFINE JLXPRO_ARITEM := 101 
STATIC DEFINE JLXPRO_CANCELAR := 103 
STATIC DEFINE JLXPRO_CODIGO := 119 
STATIC DEFINE JLXPRO_EMPRESA := 105 
STATIC DEFINE JLXPRO_FT15 := 116 
STATIC DEFINE JLXPRO_FT16 := 114 
STATIC DEFINE JLXPRO_FT17 := 121 
STATIC DEFINE JLXPRO_FT19 := 112 
STATIC DEFINE JLXPRO_FT20 := 110 
STATIC DEFINE JLXPRO_NCRM := 100 
STATIC DEFINE JLXPRO_OBS := 117 
STATIC DEFINE JLXPRO_PEGMC := 102 
STATIC DEFINE JLXPRO_QTDEEXC := 111 
STATIC DEFINE JLXPRO_QTDELIB := 115 
STATIC DEFINE JLXPRO_QTDEREJ := 113 
STATIC DEFINE JLXPRO_QTDESAL := 109 
STATIC DEFINE JLXPRO_RASTRO := 107 
STATIC DEFINE JLXPRO_SC_CLIFOR := 106 
STATIC DEFINE JLXPRO_SC_RASTRO := 108 
STATIC DEFINE JLXPRO_SC_RASTRO2 := 118 
STATIC DEFINE JLXPRO_SC_RASTRO4 := 120 
STATIC DEFINE JLXPRO_SITU := 122 
STATIC DEFINE JLXPRO_THEFIXEDTEXT13 := 104 
#endregion

PARTIAL class jlxpro inherit DATADIALOG 

	protect oDCnCRM as RIGHTSLE
	protect oDCARITEM as RIGHTSLE
	protect oCCPEGMC as PUSHBUTTON
	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText13 as FIXEDTEXT
	protect oDCEMPRESA as RIGHTSLE
	protect oDCSC_CLIFOR as FIXEDTEXT
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCQTDESAL as RIGHTSLE
	protect oDCFT20 as FIXEDTEXT
	protect oDCQTDEEXC as RIGHTSLE
	protect oDCFT19 as FIXEDTEXT
	protect oDCQTDEREJ as RIGHTSLE
	protect oDCFT16 as FIXEDTEXT
	protect oDCQTDELIB as RIGHTSLE
	protect oDCFT15 as FIXEDTEXT
	protect oDCOBS as SINGLELINEEDIT
	protect oDCSC_RASTRO2 as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_RASTRO4 as FIXEDTEXT
	protect oDCFT17 as FIXEDTEXT
	protect oDCSITU as RIGHTSLE
// 	instance nCRM 
// 	instance ARITEM 
// 	instance EMPRESA 
// 	instance RASTRO 
// 	instance QTDESAL 
// 	instance QTDEEXC 
// 	instance QTDEREJ 
// 	instance QTDELIB 
// 	instance OBS 
// 	instance CODIGO 
// 	instance SITU 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ARITEM() 
return self:FieldGet(#ARITEM)


assign ARITEM(uValue) 
self:FieldPut(#ARITEM, uValue)
return ARITEM := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access EMPRESA() 
return self:FieldGet(#EMPRESA)


assign EMPRESA(uValue) 
self:FieldPut(#EMPRESA, uValue)
return EMPRESA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jlxpro",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCnCRM := rightSle{self,ResourceID{JLXPRO_NCRM,_GetInst()}}
oDCnCRM:HyperLabel := HyperLabel{#nCRM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCnCRM:FieldSpec := PADRAO_NUM_08{}
oDCnCRM:FocusSelect := FSEL_ALL

oDCARITEM := rightSle{self,ResourceID{JLXPRO_ARITEM,_GetInst()}}
oDCARITEM:FieldSpec := PADRAO_NUM_03{}
oDCARITEM:HyperLabel := HyperLabel{#ARITEM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCARITEM:FocusSelect := FSEL_ALL
oDCARITEM:TooltipText := "Item do Pedido de Compras"

oCCPEGMC := PushButton{self,ResourceID{JLXPRO_PEGMC,_GetInst()}}
oCCPEGMC:HyperLabel := HyperLabel{#PEGMC,"MC",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JLXPRO_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}

oDCtheFixedText13 := FixedText{self,ResourceID{JLXPRO_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Retornar",NULL_STRING,NULL_STRING}

oDCEMPRESA := rightSle{self,ResourceID{JLXPRO_EMPRESA,_GetInst()}}
oDCEMPRESA:HyperLabel := HyperLabel{#EMPRESA,NULL_STRING,NULL_STRING,"CRM_CLIFOR"}
oDCEMPRESA:FocusSelect := FSEL_ALL
oDCEMPRESA:TooltipText := "Numero Cliente/Fornecedor"
oDCEMPRESA:BackGround := aBrushes[1]

oDCSC_CLIFOR := FixedText{self,ResourceID{JLXPRO_SC_CLIFOR,_GetInst()}}
oDCSC_CLIFOR:HyperLabel := HyperLabel{#SC_CLIFOR,"Empresa",NULL_STRING,NULL_STRING}

oDCRASTRO := SingleLineEdit{self,ResourceID{JLXPRO_RASTRO,_GetInst()}}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"CRME01_RASTRO"}
oDCRASTRO:FocusSelect := FSEL_ALL
oDCRASTRO:FieldSpec := PADRAO_CHAR_12{}
oDCRASTRO:BackGround := aBrushes[1]

oDCSC_RASTRO := FixedText{self,ResourceID{JLXPRO_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCQTDESAL := rightSle{self,ResourceID{JLXPRO_QTDESAL,_GetInst()}}
oDCQTDESAL:FieldSpec := PADRAO_NUM_12{}
oDCQTDESAL:HyperLabel := HyperLabel{#QTDESAL,NULL_STRING,NULL_STRING,NULL_STRING}
oDCQTDESAL:FocusSelect := FSEL_ALL
oDCQTDESAL:BackGround := aBrushes[1]

oDCFT20 := FixedText{self,ResourceID{JLXPRO_FT20,_GetInst()}}
oDCFT20:HyperLabel := HyperLabel{#FT20,"Saldo",NULL_STRING,NULL_STRING}

oDCQTDEEXC := rightSle{self,ResourceID{JLXPRO_QTDEEXC,_GetInst()}}
oDCQTDEEXC:FieldSpec := PADRAO_NUM_12{}
oDCQTDEEXC:HyperLabel := HyperLabel{#QTDEEXC,NULL_STRING,NULL_STRING,NULL_STRING}
oDCQTDEEXC:FocusSelect := FSEL_ALL
oDCQTDEEXC:BackGround := aBrushes[1]

oDCFT19 := FixedText{self,ResourceID{JLXPRO_FT19,_GetInst()}}
oDCFT19:HyperLabel := HyperLabel{#FT19,"Excedente",NULL_STRING,NULL_STRING}

oDCQTDEREJ := rightSle{self,ResourceID{JLXPRO_QTDEREJ,_GetInst()}}
oDCQTDEREJ:FieldSpec := PADRAO_NUM_12{}
oDCQTDEREJ:HyperLabel := HyperLabel{#QTDEREJ,NULL_STRING,NULL_STRING,NULL_STRING}
oDCQTDEREJ:FocusSelect := FSEL_ALL
oDCQTDEREJ:TooltipText := "Qtde 2 Nora Fiscal"
oDCQTDEREJ:BackGround := aBrushes[1]

oDCFT16 := FixedText{self,ResourceID{JLXPRO_FT16,_GetInst()}}
oDCFT16:HyperLabel := HyperLabel{#FT16,"Qtde",NULL_STRING,NULL_STRING}

oDCQTDELIB := rightSle{self,ResourceID{JLXPRO_QTDELIB,_GetInst()}}
oDCQTDELIB:FieldSpec := PADRAO_NUM_12{}
oDCQTDELIB:HyperLabel := HyperLabel{#QTDELIB,NULL_STRING,NULL_STRING,NULL_STRING}
oDCQTDELIB:FocusSelect := FSEL_ALL
oDCQTDELIB:BackGround := aBrushes[1]

oDCFT15 := FixedText{self,ResourceID{JLXPRO_FT15,_GetInst()}}
oDCFT15:HyperLabel := HyperLabel{#FT15,"Liberada",NULL_STRING,NULL_STRING}

oDCOBS := SingleLineEdit{self,ResourceID{JLXPRO_OBS,_GetInst()}}
oDCOBS:HyperLabel := HyperLabel{#OBS,NULL_STRING,NULL_STRING,"CRME01_RASTRO"}
oDCOBS:FocusSelect := FSEL_ALL
oDCOBS:BackGround := aBrushes[1]

oDCSC_RASTRO2 := FixedText{self,ResourceID{JLXPRO_SC_RASTRO2,_GetInst()}}
oDCSC_RASTRO2:HyperLabel := HyperLabel{#SC_RASTRO2,"OBS",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JLXPRO_CODIGO,_GetInst()}}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"CODIGO",NULL_STRING,"CRME01_RASTRO"}
oDCCODIGO:FocusSelect := FSEL_ALL
oDCCODIGO:FieldSpec := PADRAO_CHAR_12{}
oDCCODIGO:BackGround := aBrushes[1]

oDCSC_RASTRO4 := FixedText{self,ResourceID{JLXPRO_SC_RASTRO4,_GetInst()}}
oDCSC_RASTRO4:HyperLabel := HyperLabel{#SC_RASTRO4,"Codigo",NULL_STRING,NULL_STRING}

oDCFT17 := FixedText{self,ResourceID{JLXPRO_FT17,_GetInst()}}
oDCFT17:HyperLabel := HyperLabel{#FT17,"Rejeitada",NULL_STRING,NULL_STRING}

oDCSITU := rightSle{self,ResourceID{JLXPRO_SITU,_GetInst()}}
oDCSITU:HyperLabel := HyperLabel{#SITU,NULL_STRING,NULL_STRING,"CRM_CLIFOR"}
oDCSITU:FocusSelect := FSEL_ALL
oDCSITU:TooltipText := "Numero Cliente/Fornecedor"
oDCSITU:BackGround := aBrushes[1]

self:Caption := "Consulta LX PRO"
self:HyperLabel := HyperLabel{#jlxpro,"Consulta LX PRO",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access nCRM() 
return self:FieldGet(#nCRM)


assign nCRM(uValue) 
self:FieldPut(#nCRM, uValue)
return nCRM := uValue


access OBS() 
return self:FieldGet(#OBS)


assign OBS(uValue) 
self:FieldPut(#OBS, uValue)
return OBS := uValue


access QTDEEXC() 
return self:FieldGet(#QTDEEXC)


assign QTDEEXC(uValue) 
self:FieldPut(#QTDEEXC, uValue)
return QTDEEXC := uValue


access QTDELIB() 
return self:FieldGet(#QTDELIB)


assign QTDELIB(uValue) 
self:FieldPut(#QTDELIB, uValue)
return QTDELIB := uValue


access QTDEREJ() 
return self:FieldGet(#QTDEREJ)


assign QTDEREJ(uValue) 
self:FieldPut(#QTDEREJ, uValue)
return QTDEREJ := uValue


access QTDESAL() 
return self:FieldGet(#QTDESAL)


assign QTDESAL(uValue) 
self:FieldPut(#QTDESAL, uValue)
return QTDESAL := uValue


access RASTRO() 
return self:FieldGet(#RASTRO)


assign RASTRO(uValue) 
self:FieldPut(#RASTRO, uValue)
return RASTRO := uValue


access SITU() 
return self:FieldGet(#SITU)


assign SITU(uValue) 
self:FieldPut(#SITU, uValue)
return SITU := uValue


END CLASS
