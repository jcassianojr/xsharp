#region DEFINES
STATIC DEFINE JFALTA_APURA := 108 
STATIC DEFINE JFALTA_BUSCANUM := 112 
STATIC DEFINE JFALTA_CMDAPU := 114 
STATIC DEFINE JFALTA_CMDORDENAR := 115 
STATIC DEFINE JFALTA_CMDPAD := 113 
STATIC DEFINE JFALTA_CMDPAD1 := 124 
STATIC DEFINE JFALTA_CODFGR := 121 
STATIC DEFINE JFALTA_CODFGS := 120 
STATIC DEFINE JFALTA_CODIGO := 106 
STATIC DEFINE JFALTA_CODIMP01 := 117 
STATIC DEFINE JFALTA_CODIMP02 := 118 
STATIC DEFINE JFALTA_ESCTABFALTA1 := 126 
STATIC DEFINE JFALTA_FIXEDTEXT6 := 116 
STATIC DEFINE JFALTA_FIXEDTEXT7 := 119 
STATIC DEFINE JFALTA_FIXEDTEXT8 := 122 
STATIC DEFINE JFALTA_FORMULA := 109 
STATIC DEFINE JFALTA_MACPAD := 111 
STATIC DEFINE JFALTA_NOME := 107 
STATIC DEFINE JFALTA_OBS := 110 
STATIC DEFINE JFALTA_RHABCOD := 123 
STATIC DEFINE JFALTA_RHABJUST := 125 
STATIC DEFINE JFALTA_SC_APURA := 102 
STATIC DEFINE JFALTA_SC_CODIGO := 100 
STATIC DEFINE JFALTA_SC_FORMULA := 103 
STATIC DEFINE JFALTA_SC_MACPAD := 105 
STATIC DEFINE JFALTA_SC_NOME := 101 
STATIC DEFINE JFALTA_SC_OBS := 104 
#endregion

PARTIAL class JFALTA inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_APURA as FIXEDTEXT
	protect oDCSC_FORMULA as FIXEDTEXT
	protect oDCSC_OBS as FIXEDTEXT
	protect oDCSC_MACPAD as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCAPURA as SINGLELINEEDIT
	protect oDCFORMULA as SINGLELINEEDIT
	protect oDCOBS as SINGLELINEEDIT
	protect oDCMACPAD as SINGLELINEEDIT
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCcmdPAD as PUSHBUTTON
	protect oCCcmdAPU as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
	protect oDCFixedText6 as FIXEDTEXT
	protect oDCCODIMP01 as SINGLELINEEDIT
	protect oDCCODIMP02 as SINGLELINEEDIT
	protect oDCFixedText7 as FIXEDTEXT
	protect oDCCODFGS as SINGLELINEEDIT
	protect oDCCODFGR as SINGLELINEEDIT
	protect oDCFixedText8 as FIXEDTEXT
	protect oDCRHABCOD as SINGLELINEEDIT
	protect oCCcmdPAD1 as PUSHBUTTON
	protect oDCRHABJUST as SINGLELINEEDIT
	protect oCCesctabfalta1 as PUSHBUTTON
// 	instance CODIGO 
// 	instance NOME 
// 	instance APURA 
// 	instance FORMULA 
// 	instance OBS 
// 	instance MACPAD 
// 	instance CODIMP01 
// 	instance CODIMP02 
// 	instance CODFGS 
// 	instance CODFGR 
// 	instance RHABCOD 
// 	instance RHABJUST 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access APURA() 
return self:FieldGet(#APURA)


assign APURA(uValue) 
self:FieldPut(#APURA, uValue)
return APURA := uValue


METHOD cmdPAD1( ) 
SELF:server:FIELDPUT("RHABJUST",SIMNAO(SELF:SERVER:FIELDGET("RHABJUST")))

access CODFGR() 
return self:FieldGet(#CODFGR)


assign CODFGR(uValue) 
self:FieldPut(#CODFGR, uValue)
return CODFGR := uValue


access CODFGS() 
return self:FieldGet(#CODFGS)


assign CODFGS(uValue) 
self:FieldPut(#CODFGS, uValue)
return CODFGS := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODIMP01() 
return self:FieldGet(#CODIMP01)


assign CODIMP01(uValue) 
self:FieldPut(#CODIMP01, uValue)
return CODIMP01 := uValue


access CODIMP02() 
return self:FieldGet(#CODIMP02)


assign CODIMP02(uValue) 
self:FieldPut(#CODIMP02, uValue)
return CODIMP02 := uValue


METHOD esctabfalta1( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"rhabcod.dbf"}
oESC:SHOW()	
IF Oesc:lok
   SELF:SERVER:FIELDPUT("RHABCOD",oESC:CODIGO)
ENDIF									

access FORMULA() 
return self:FieldGet(#FORMULA)


assign FORMULA(uValue) 
self:FieldPut(#FORMULA, uValue)
return FORMULA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFALTA",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_CODIGO := FixedText{self,ResourceID{JFALTA_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JFALTA_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_APURA := FixedText{self,ResourceID{JFALTA_SC_APURA,_GetInst()}}
oDCSC_APURA:HyperLabel := HyperLabel{#SC_APURA,"Apura:",NULL_STRING,NULL_STRING}

oDCSC_FORMULA := FixedText{self,ResourceID{JFALTA_SC_FORMULA,_GetInst()}}
oDCSC_FORMULA:HyperLabel := HyperLabel{#SC_FORMULA,"Formula:",NULL_STRING,NULL_STRING}

oDCSC_OBS := FixedText{self,ResourceID{JFALTA_SC_OBS,_GetInst()}}
oDCSC_OBS:HyperLabel := HyperLabel{#SC_OBS,"Obs:",NULL_STRING,NULL_STRING}

oDCSC_MACPAD := FixedText{self,ResourceID{JFALTA_SC_MACPAD,_GetInst()}}
oDCSC_MACPAD:HyperLabel := HyperLabel{#SC_MACPAD,"Marcar Padrão",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JFALTA_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_02{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"TABFALTA_CODIGO"}
oDCCODIGO:TooltipText := "Codigo"
oDCCODIGO:BackGround := aBrushes[1]

oDCNOME := SingleLineEdit{self,ResourceID{JFALTA_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"TABFALTA_NOME"}
oDCNOME:TooltipText := "Descrição"

oDCAPURA := SingleLineEdit{self,ResourceID{JFALTA_APURA,_GetInst()}}
oDCAPURA:FieldSpec := PADRAO_CHAR_01{}
oDCAPURA:HyperLabel := HyperLabel{#APURA,"Apura:",NULL_STRING,"TABFALTA_APURA"}
oDCAPURA:TooltipText := "Se Apura Sim/Não"
oDCAPURA:BackGround := aBrushes[1]

oDCFORMULA := SingleLineEdit{self,ResourceID{JFALTA_FORMULA,_GetInst()}}
oDCFORMULA:FieldSpec := PADRAO_CHAR_40{}
oDCFORMULA:HyperLabel := HyperLabel{#FORMULA,"Formula:",NULL_STRING,"TABFALTA_FORMULA"}
oDCFORMULA:TooltipText := "Formula Para Apuraçao"

oDCOBS := SingleLineEdit{self,ResourceID{JFALTA_OBS,_GetInst()}}
oDCOBS:FieldSpec := PADRAO_CHAR_50{}
oDCOBS:HyperLabel := HyperLabel{#OBS,"Obs:",NULL_STRING,"TABFALTA_OBS"}
oDCOBS:TooltipText := "Observaçoes"

oDCMACPAD := SingleLineEdit{self,ResourceID{JFALTA_MACPAD,_GetInst()}}
oDCMACPAD:FieldSpec := PADRAO_CHAR_01{}
oDCMACPAD:HyperLabel := HyperLabel{#MACPAD,"Macpad:",NULL_STRING,"TABFALTA_MACPAD"}
oDCMACPAD:TooltipText := "Se Marcar Padrao (S)im (N)ão"
oDCMACPAD:BackGround := aBrushes[1]

oCCbuscaNUM := PushButton{self,ResourceID{JFALTA_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCcmdPAD := PushButton{self,ResourceID{JFALTA_CMDPAD,_GetInst()}}
oCCcmdPAD:HyperLabel := HyperLabel{#cmdPAD,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdAPU := PushButton{self,ResourceID{JFALTA_CMDAPU,_GetInst()}}
oCCcmdAPU:HyperLabel := HyperLabel{#cmdAPU,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JFALTA_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText6 := FixedText{self,ResourceID{JFALTA_FIXEDTEXT6,_GetInst()}}
oDCFixedText6:HyperLabel := HyperLabel{#FixedText6,"Integracao LX",NULL_STRING,NULL_STRING}

oDCCODIMP01 := SingleLineEdit{self,ResourceID{JFALTA_CODIMP01,_GetInst()}}
oDCCODIMP01:FieldSpec := PADRAO_NUM_03{}
oDCCODIMP01:HyperLabel := HyperLabel{#CODIMP01,"Formula:",NULL_STRING,"TABFALTA_FORMULA"}

oDCCODIMP02 := SingleLineEdit{self,ResourceID{JFALTA_CODIMP02,_GetInst()}}
oDCCODIMP02:FieldSpec := PADRAO_NUM_03{}
oDCCODIMP02:HyperLabel := HyperLabel{#CODIMP02,"Formula:",NULL_STRING,"TABFALTA_FORMULA"}

oDCFixedText7 := FixedText{self,ResourceID{JFALTA_FIXEDTEXT7,_GetInst()}}
oDCFixedText7:HyperLabel := HyperLabel{#FixedText7,"Codigo Fgts Saida/Retorno",NULL_STRING,NULL_STRING}

oDCCODFGS := SingleLineEdit{self,ResourceID{JFALTA_CODFGS,_GetInst()}}
oDCCODFGS:FieldSpec := PADRAO_CHAR_02{}
oDCCODFGS:HyperLabel := HyperLabel{#CODFGS,"Formula:",NULL_STRING,"TABFALTA_FORMULA"}
oDCCODFGS:TooltipText := "Formula Para Apuraçao"

oDCCODFGR := SingleLineEdit{self,ResourceID{JFALTA_CODFGR,_GetInst()}}
oDCCODFGR:FieldSpec := PADRAO_CHAR_02{}
oDCCODFGR:HyperLabel := HyperLabel{#CODFGR,"Formula:",NULL_STRING,"TABFALTA_FORMULA"}
oDCCODFGR:TooltipText := "Formula Para Apuraçao"

oDCFixedText8 := FixedText{self,ResourceID{JFALTA_FIXEDTEXT8,_GetInst()}}
oDCFixedText8:HyperLabel := HyperLabel{#FixedText8,"Codigo Absenteismo",NULL_STRING,NULL_STRING}

oDCRHABCOD := SingleLineEdit{self,ResourceID{JFALTA_RHABCOD,_GetInst()}}
oDCRHABCOD:FieldSpec := PADRAO_CHAR_02{}
oDCRHABCOD:HyperLabel := HyperLabel{#RHABCOD,"Formula:",NULL_STRING,"TABFALTA_FORMULA"}
oDCRHABCOD:TooltipText := "Formula Para Apuraçao"

oCCcmdPAD1 := PushButton{self,ResourceID{JFALTA_CMDPAD1,_GetInst()}}
oCCcmdPAD1:HyperLabel := HyperLabel{#cmdPAD1,"Justifica Sim/Nao",NULL_STRING,NULL_STRING}

oDCRHABJUST := SingleLineEdit{self,ResourceID{JFALTA_RHABJUST,_GetInst()}}
oDCRHABJUST:FieldSpec := PADRAO_CHAR_01{}
oDCRHABJUST:HyperLabel := HyperLabel{#RHABJUST,"Macpad:",NULL_STRING,"TABFALTA_MACPAD"}
oDCRHABJUST:TooltipText := "Justifica (S)im (N)ão"
oDCRHABJUST:BackGround := aBrushes[1]

oCCesctabfalta1 := PushButton{self,ResourceID{JFALTA_ESCTABFALTA1,_GetInst()}}
oCCesctabfalta1:HyperLabel := HyperLabel{#esctabfalta1,"..",NULL_STRING,NULL_STRING}

self:Caption := "Codigos Faltas e Atrasos"
self:HyperLabel := HyperLabel{#JFALTA,"Codigos Faltas e Atrasos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_02{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_40{}}
oDBNOME:Width := 40
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MACPAD() 
return self:FieldGet(#MACPAD)


assign MACPAD(uValue) 
self:FieldPut(#MACPAD, uValue)
return MACPAD := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access OBS() 
return self:FieldGet(#OBS)


assign OBS(uValue) 
self:FieldPut(#OBS, uValue)
return OBS := uValue


access RHABCOD() 
return self:FieldGet(#RHABCOD)


assign RHABCOD(uValue) 
self:FieldPut(#RHABCOD, uValue)
return RHABCOD := uValue


access RHABJUST() 
return self:FieldGet(#RHABJUST)


assign RHABJUST(uValue) 
self:FieldPut(#RHABJUST, uValue)
return RHABJUST := uValue


END CLASS
