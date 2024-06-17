#region DEFINES
STATIC DEFINE JPTOHOR_ALMF := 110 
STATIC DEFINE JPTOHOR_ALMI := 109 
STATIC DEFINE JPTOHOR_BUSCANUM := 115 
STATIC DEFINE JPTOHOR_CMDFOL := 122 
STATIC DEFINE JPTOHOR_CMDORDENAR := 120 
STATIC DEFINE JPTOHOR_CMDVIR := 116 
STATIC DEFINE JPTOHOR_CODAJU := 113 
STATIC DEFINE JPTOHOR_CODIGO := 107 
STATIC DEFINE JPTOHOR_ENT := 108 
STATIC DEFINE JPTOHOR_FOLGASN := 123 
STATIC DEFINE JPTOHOR_FORMAJU := 114 
STATIC DEFINE JPTOHOR_NOME := 117 
STATIC DEFINE JPTOHOR_PEGDES := 119 
STATIC DEFINE JPTOHOR_SAI := 111 
STATIC DEFINE JPTOHOR_SC_ALMI := 102 
STATIC DEFINE JPTOHOR_SC_ALMI1 := 118 
STATIC DEFINE JPTOHOR_SC_CODAJU := 105 
STATIC DEFINE JPTOHOR_SC_CODIGO := 100 
STATIC DEFINE JPTOHOR_SC_ENT := 101 
STATIC DEFINE JPTOHOR_SC_FOLOCO := 121 
STATIC DEFINE JPTOHOR_SC_FORMAJU := 106 
STATIC DEFINE JPTOHOR_SC_SAI := 103 
STATIC DEFINE JPTOHOR_SC_VIRADA := 104 
STATIC DEFINE JPTOHOR_VIRADA := 112 
#endregion

PARTIAL class JPtoHor inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBENT as DataColumn
	PROTECT oDBALMI as DataColumn
	PROTECT oDBALMF as DataColumn
	PROTECT oDBSAI as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_ENT as FIXEDTEXT
	protect oDCSC_ALMI as FIXEDTEXT
	protect oDCSC_SAI as FIXEDTEXT
	protect oDCSC_VIRADA as FIXEDTEXT
	protect oDCSC_CODAJU as FIXEDTEXT
	protect oDCSC_FORMAJU as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCENT as RIGHTSLE
	protect oDCALMI as RIGHTSLE
	protect oDCALMF as RIGHTSLE
	protect oDCSAI as RIGHTSLE
	protect oDCVIRADA as SINGLELINEEDIT
	protect oDCCODAJU as SINGLELINEEDIT
	protect oDCFORMAJU as SINGLELINEEDIT
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCcmdvir as PUSHBUTTON
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSC_ALMI1 as FIXEDTEXT
	protect oCCpegdes as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
	protect oDCSC_FOLOCO as FIXEDTEXT
	protect oCCcmdfol as PUSHBUTTON
	protect oDCFOLGASN as SINGLELINEEDIT
// 	instance CODIGO 
// 	instance ENT 
// 	instance ALMI 
// 	instance ALMF 
// 	instance SAI 
// 	instance VIRADA 
// 	instance CODAJU 
// 	instance FORMAJU 
// 	instance NOME 
// 	instance FOLGASN 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ALMF() 
return self:FieldGet(#ALMF)


assign ALMF(uValue) 
self:FieldPut(#ALMF, uValue)
return ALMF := uValue


access ALMI() 
return self:FieldGet(#ALMI)


assign ALMI(uValue) 
self:FieldPut(#ALMI, uValue)
return ALMI := uValue


access CODAJU() 
return self:FieldGet(#CODAJU)


assign CODAJU(uValue) 
self:FieldPut(#CODAJU, uValue)
return CODAJU := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access ENT() 
return self:FieldGet(#ENT)


assign ENT(uValue) 
self:FieldPut(#ENT, uValue)
return ENT := uValue


access FOLGASN() 
return self:FieldGet(#FOLGASN)


assign FOLGASN(uValue) 
self:FieldPut(#FOLGASN, uValue)
return FOLGASN := uValue


access FORMAJU() 
return self:FieldGet(#FORMAJU)


assign FORMAJU(uValue) 
self:FieldPut(#FORMAJU, uValue)
return FORMAJU := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPtoHor",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_CODIGO := FixedText{self,ResourceID{JPTOHOR_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_ENT := FixedText{self,ResourceID{JPTOHOR_SC_ENT,_GetInst()}}
oDCSC_ENT:HyperLabel := HyperLabel{#SC_ENT,"Ent:",NULL_STRING,NULL_STRING}

oDCSC_ALMI := FixedText{self,ResourceID{JPTOHOR_SC_ALMI,_GetInst()}}
oDCSC_ALMI:HyperLabel := HyperLabel{#SC_ALMI,"Almoco",NULL_STRING,NULL_STRING}

oDCSC_SAI := FixedText{self,ResourceID{JPTOHOR_SC_SAI,_GetInst()}}
oDCSC_SAI:HyperLabel := HyperLabel{#SC_SAI,"Sai:",NULL_STRING,NULL_STRING}

oDCSC_VIRADA := FixedText{self,ResourceID{JPTOHOR_SC_VIRADA,_GetInst()}}
oDCSC_VIRADA:HyperLabel := HyperLabel{#SC_VIRADA,"Virada:",NULL_STRING,NULL_STRING}

oDCSC_CODAJU := FixedText{self,ResourceID{JPTOHOR_SC_CODAJU,_GetInst()}}
oDCSC_CODAJU:HyperLabel := HyperLabel{#SC_CODAJU,"Codigo Ajuste",NULL_STRING,NULL_STRING}

oDCSC_FORMAJU := FixedText{self,ResourceID{JPTOHOR_SC_FORMAJU,_GetInst()}}
oDCSC_FORMAJU:HyperLabel := HyperLabel{#SC_FORMAJU,"Formula Ajuste",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JPTOHOR_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_02{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"FOPTOHOR_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]

oDCENT := rightSle{self,ResourceID{JPTOHOR_ENT,_GetInst()}}
oDCENT:FieldSpec := PADRAO_NUM_05_2{}
oDCENT:HyperLabel := HyperLabel{#ENT,"Ent:",NULL_STRING,"FOPTOHOR_ENT"}

oDCALMI := rightSle{self,ResourceID{JPTOHOR_ALMI,_GetInst()}}
oDCALMI:FieldSpec := PADRAO_NUM_05_2{}
oDCALMI:HyperLabel := HyperLabel{#ALMI,"Almi:",NULL_STRING,"FOPTOHOR_ALMI"}

oDCALMF := rightSle{self,ResourceID{JPTOHOR_ALMF,_GetInst()}}
oDCALMF:FieldSpec := PADRAO_NUM_05_2{}
oDCALMF:HyperLabel := HyperLabel{#ALMF,"Almf:",NULL_STRING,"FOPTOHOR_ALMF"}

oDCSAI := rightSle{self,ResourceID{JPTOHOR_SAI,_GetInst()}}
oDCSAI:FieldSpec := PADRAO_NUM_05_2{}
oDCSAI:HyperLabel := HyperLabel{#SAI,"Sai:",NULL_STRING,"FOPTOHOR_SAI"}

oDCVIRADA := SingleLineEdit{self,ResourceID{JPTOHOR_VIRADA,_GetInst()}}
oDCVIRADA:FieldSpec := PADRAO_CHAR_01{}
oDCVIRADA:HyperLabel := HyperLabel{#VIRADA,"Virada:",NULL_STRING,"FOPTOHOR_VIRADA"}
oDCVIRADA:BackGround := aBrushes[1]

oDCCODAJU := SingleLineEdit{self,ResourceID{JPTOHOR_CODAJU,_GetInst()}}
oDCCODAJU:FieldSpec := PADRAO_CHAR_02{}
oDCCODAJU:HyperLabel := HyperLabel{#CODAJU,"Codaju:",NULL_STRING,"FOPTOHOR_CODAJU"}

oDCFORMAJU := SingleLineEdit{self,ResourceID{JPTOHOR_FORMAJU,_GetInst()}}
oDCFORMAJU:FieldSpec := PADRAO_CHAR_60{}
oDCFORMAJU:HyperLabel := HyperLabel{#FORMAJU,"Formaju:",NULL_STRING,"FOPTOHOR_FORMAJU"}

oCCbuscaNUM := PushButton{self,ResourceID{JPTOHOR_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCcmdvir := PushButton{self,ResourceID{JPTOHOR_CMDVIR,_GetInst()}}
oCCcmdvir:HyperLabel := HyperLabel{#cmdvir,"Sim/Nao",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JPTOHOR_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_30{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Formaju:",NULL_STRING,"FOPTOHOR_NOME"}

oDCSC_ALMI1 := FixedText{self,ResourceID{JPTOHOR_SC_ALMI1,_GetInst()}}
oDCSC_ALMI1:HyperLabel := HyperLabel{#SC_ALMI1,"Descritivo",NULL_STRING,NULL_STRING}

oCCpegdes := PushButton{self,ResourceID{JPTOHOR_PEGDES,_GetInst()}}
oCCpegdes:HyperLabel := HyperLabel{#pegdes,"...",NULL_STRING,NULL_STRING}
oCCpegdes:TooltipText := "Gera Descritivo com Bases Nos Horarios"

oCCcmdordenar := PushButton{self,ResourceID{JPTOHOR_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_FOLOCO := FixedText{self,ResourceID{JPTOHOR_SC_FOLOCO,_GetInst()}}
oDCSC_FOLOCO:HyperLabel := HyperLabel{#SC_FOLOCO,"Folga",NULL_STRING,NULL_STRING}

oCCcmdfol := PushButton{self,ResourceID{JPTOHOR_CMDFOL,_GetInst()}}
oCCcmdfol:HyperLabel := HyperLabel{#cmdfol,"Sim/Nao",NULL_STRING,NULL_STRING}

oDCFOLGASN := SingleLineEdit{self,ResourceID{JPTOHOR_FOLGASN,_GetInst()}}
oDCFOLGASN:FieldSpec := PADRAO_CHAR_01{}
oDCFOLGASN:HyperLabel := HyperLabel{#FOLGASN,"Folga",NULL_STRING,"FO_PON_FOLSN"}
oDCFOLGASN:BackGround := aBrushes[1]

self:Caption := "Horarios Escalas / Ajustes"
self:HyperLabel := HyperLabel{#JPtoHor,"Horarios Escalas / Ajustes",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_02{}}
oDBCODIGO:Width := 9
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBENT := DataColumn{PADRAO_NUM_05_2{}}
oDBENT:Width := 8
oDBENT:HyperLabel := oDCENT:HyperLabel 
oDBENT:Caption := "Ent:"
self:Browser:AddColumn(oDBENT)

oDBALMI := DataColumn{PADRAO_NUM_05_2{}}
oDBALMI:Width := 9
oDBALMI:HyperLabel := oDCALMI:HyperLabel 
oDBALMI:Caption := "Almi:"
self:Browser:AddColumn(oDBALMI)

oDBALMF := DataColumn{PADRAO_NUM_05_2{}}
oDBALMF:Width := 8
oDBALMF:HyperLabel := oDCALMF:HyperLabel 
oDBALMF:Caption := "Almf:"
self:Browser:AddColumn(oDBALMF)

oDBSAI := DataColumn{PADRAO_NUM_05_2{}}
oDBSAI:Width := 9
oDBSAI:HyperLabel := oDCSAI:HyperLabel 
oDBSAI:Caption := "Sai:"
self:Browser:AddColumn(oDBSAI)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access SAI() 
return self:FieldGet(#SAI)


assign SAI(uValue) 
self:FieldPut(#SAI, uValue)
return SAI := uValue


access VIRADA() 
return self:FieldGet(#VIRADA)


assign VIRADA(uValue) 
self:FieldPut(#VIRADA, uValue)
return VIRADA := uValue


END CLASS
