#region DEFINES
STATIC DEFINE JPTOCOM_ANO := 105 
STATIC DEFINE JPTOCOM_BUSCANUM := 110 
STATIC DEFINE JPTOCOM_CMDORDENAR := 109 
STATIC DEFINE JPTOCOM_DATAFIM := 108 
STATIC DEFINE JPTOCOM_DATAINI := 107 
STATIC DEFINE JPTOCOM_EMPRESA := 111 
STATIC DEFINE JPTOCOM_FECHADO := 113 
STATIC DEFINE JPTOCOM_MES := 104 
STATIC DEFINE JPTOCOM_MESEXT := 106 
STATIC DEFINE JPTOCOM_SC_ANO := 101 
STATIC DEFINE JPTOCOM_SC_DATAINI := 103 
STATIC DEFINE JPTOCOM_SC_MES := 100 
STATIC DEFINE JPTOCOM_SC_MES1 := 112 
STATIC DEFINE JPTOCOM_SC_MES2 := 114 
STATIC DEFINE JPTOCOM_SC_MESEXT := 102 
#endregion

PARTIAL class JPTOCOM inherit MYDataWindow 

	PROTECT oDBMES as DataColumn
	PROTECT oDBANO as DataColumn
	PROTECT oDBEMPRESA as DataColumn
	PROTECT oDBMESEXT as DataColumn
	PROTECT oDBDATAINI as DataColumn
	PROTECT oDBDATAFIM as DataColumn
	protect oDCSC_MES as FIXEDTEXT
	protect oDCSC_ANO as FIXEDTEXT
	protect oDCSC_MESEXT as FIXEDTEXT
	protect oDCSC_DATAINI as FIXEDTEXT
	protect oDCMES as SINGLELINEEDIT
	protect oDCANO as SINGLELINEEDIT
	protect oDCMESEXT as SINGLELINEEDIT
	protect oDCDATAINI as DATESLE
	protect oDCDATAFIM as DATESLE
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
	protect oDCEMPRESA as SINGLELINEEDIT
	protect oDCSC_MES1 as FIXEDTEXT
	protect oDCFECHADO as SINGLELINEEDIT
	protect oDCSC_MES2 as FIXEDTEXT
// 	instance MES 
// 	instance ANO 
// 	instance MESEXT 
// 	instance DATAINI 
// 	instance DATAFIM 
// 	instance EMPRESA 
// 	instance FECHADO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANO() 
return self:FieldGet(#ANO)


assign ANO(uValue) 
self:FieldPut(#ANO, uValue)
return ANO := uValue


access DATAFIM() 
return self:FieldGet(#DATAFIM)


assign DATAFIM(uValue) 
self:FieldPut(#DATAFIM, uValue)
return DATAFIM := uValue


access DATAINI() 
return self:FieldGet(#DATAINI)


assign DATAINI(uValue) 
self:FieldPut(#DATAINI, uValue)
return DATAINI := uValue


access EMPRESA() 
return self:FieldGet(#EMPRESA)


assign EMPRESA(uValue) 
self:FieldPut(#EMPRESA, uValue)
return EMPRESA := uValue


access FECHADO() 
return self:FieldGet(#FECHADO)


assign FECHADO(uValue) 
self:FieldPut(#FECHADO, uValue)
return FECHADO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPTOCOM",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_MES := FixedText{self,ResourceID{JPTOCOM_SC_MES,_GetInst()}}
oDCSC_MES:HyperLabel := HyperLabel{#SC_MES,"Mes:",NULL_STRING,NULL_STRING}

oDCSC_ANO := FixedText{self,ResourceID{JPTOCOM_SC_ANO,_GetInst()}}
oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO,"Ano:",NULL_STRING,NULL_STRING}

oDCSC_MESEXT := FixedText{self,ResourceID{JPTOCOM_SC_MESEXT,_GetInst()}}
oDCSC_MESEXT:HyperLabel := HyperLabel{#SC_MESEXT,"MesExtenso:",NULL_STRING,NULL_STRING}

oDCSC_DATAINI := FixedText{self,ResourceID{JPTOCOM_SC_DATAINI,_GetInst()}}
oDCSC_DATAINI:HyperLabel := HyperLabel{#SC_DATAINI,"Periodo",NULL_STRING,NULL_STRING}

oDCMES := SingleLineEdit{self,ResourceID{JPTOCOM_MES,_GetInst()}}
oDCMES:FieldSpec := PADRAO_NUM_02{}
oDCMES:HyperLabel := HyperLabel{#MES,"Mes:",NULL_STRING,"FOPTOCOM_MES"}
oDCMES:BackGround := aBrushes[1]

oDCANO := SingleLineEdit{self,ResourceID{JPTOCOM_ANO,_GetInst()}}
oDCANO:FieldSpec := PADRAO_NUM_04{}
oDCANO:HyperLabel := HyperLabel{#ANO,"Ano:",NULL_STRING,"FOPTOCOM_ANO"}
oDCANO:BackGround := aBrushes[1]

oDCMESEXT := SingleLineEdit{self,ResourceID{JPTOCOM_MESEXT,_GetInst()}}
oDCMESEXT:FieldSpec := PADRAO_CHAR_10{}
oDCMESEXT:HyperLabel := HyperLabel{#MESEXT,"Mesext:",NULL_STRING,"FOPTOCOM_MESEXT"}
oDCMESEXT:BackGround := aBrushes[1]

oDCDATAINI := DateSle{self,ResourceID{JPTOCOM_DATAINI,_GetInst()}}
oDCDATAINI:FieldSpec := DATE_FIELD{}
oDCDATAINI:HyperLabel := HyperLabel{#DATAINI,"Inicio",NULL_STRING,"FOPTOCOM_DATAINI"}

oDCDATAFIM := DateSle{self,ResourceID{JPTOCOM_DATAFIM,_GetInst()}}
oDCDATAFIM:FieldSpec := DATE_FIELD{}
oDCDATAFIM:HyperLabel := HyperLabel{#DATAFIM,"Fim",NULL_STRING,"FOPTOCOM_DATAFIM"}

oCCcmdordenar := PushButton{self,ResourceID{JPTOCOM_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JPTOCOM_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oDCEMPRESA := SingleLineEdit{self,ResourceID{JPTOCOM_EMPRESA,_GetInst()}}
oDCEMPRESA:FieldSpec := PADRAO_NUM_02{}
oDCEMPRESA:HyperLabel := HyperLabel{#EMPRESA,"emp",NULL_STRING,"FOPTOCOM_MES"}
oDCEMPRESA:BackGround := aBrushes[1]

oDCSC_MES1 := FixedText{self,ResourceID{JPTOCOM_SC_MES1,_GetInst()}}
oDCSC_MES1:HyperLabel := HyperLabel{#SC_MES1,"Empresa",NULL_STRING,NULL_STRING}

oDCFECHADO := SingleLineEdit{self,ResourceID{JPTOCOM_FECHADO,_GetInst()}}
oDCFECHADO:FieldSpec := PADRAO_CHAR_01{}
oDCFECHADO:HyperLabel := HyperLabel{#FECHADO,"Mes:",NULL_STRING,"FOPTOCOM_MES"}
oDCFECHADO:BackGround := aBrushes[1]

oDCSC_MES2 := FixedText{self,ResourceID{JPTOCOM_SC_MES2,_GetInst()}}
oDCSC_MES2:HyperLabel := HyperLabel{#SC_MES2,"Fechado",NULL_STRING,NULL_STRING}

self:Caption := "Competencia"
self:HyperLabel := HyperLabel{#JPTOCOM,"Competencia",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBMES := DataColumn{PADRAO_NUM_02{}}
oDBMES:Width := 7
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "Mes:"
oDBMES:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMES)

oDBANO := DataColumn{PADRAO_NUM_04{}}
oDBANO:Width := 9
oDBANO:HyperLabel := oDCANO:HyperLabel 
oDBANO:Caption := "Ano:"
oDBANO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBANO)

oDBEMPRESA := DataColumn{PADRAO_NUM_02{}}
oDBEMPRESA:Width := 9
oDBEMPRESA:HyperLabel := oDCEMPRESA:HyperLabel 
oDBEMPRESA:Caption := "emp"
oDBEMPRESA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBEMPRESA)

oDBMESEXT := DataColumn{PADRAO_CHAR_10{}}
oDBMESEXT:Width := 12
oDBMESEXT:HyperLabel := oDCMESEXT:HyperLabel 
oDBMESEXT:Caption := "Mesext:"
oDBMESEXT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMESEXT)

oDBDATAINI := DataColumn{DATE_FIELD{}}
oDBDATAINI:Width := 18
oDBDATAINI:HyperLabel := oDCDATAINI:HyperLabel 
oDBDATAINI:Caption := "Inicio"
self:Browser:AddColumn(oDBDATAINI)

oDBDATAFIM := DataColumn{DATE_FIELD{}}
oDBDATAFIM:Width := 19
oDBDATAFIM:HyperLabel := oDCDATAFIM:HyperLabel 
oDBDATAFIM:Caption := "Fim"
self:Browser:AddColumn(oDBDATAFIM)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MES() 
return self:FieldGet(#MES)


assign MES(uValue) 
self:FieldPut(#MES, uValue)
return MES := uValue


access MESEXT() 
return self:FieldGet(#MESEXT)


assign MESEXT(uValue) 
self:FieldPut(#MESEXT, uValue)
return MESEXT := uValue


END CLASS
