#region DEFINES
STATIC DEFINE JFOPTO_REV_ALIREV := 106 
STATIC DEFINE JFOPTO_REV_ALSREV := 107 
STATIC DEFINE JFOPTO_REV_BUSCANUM := 119 
STATIC DEFINE JFOPTO_REV_CMDDO := 116 
STATIC DEFINE JFOPTO_REV_CMDDO1 := 122 
STATIC DEFINE JFOPTO_REV_CMDDO2 := 123 
STATIC DEFINE JFOPTO_REV_CMDFO := 117 
STATIC DEFINE JFOPTO_REV_CMDFOL := 124 
STATIC DEFINE JFOPTO_REV_CMDORDENAR := 121 
STATIC DEFINE JFOPTO_REV_CMDVIR := 110 
STATIC DEFINE JFOPTO_REV_CMDZERAR := 118 
STATIC DEFINE JFOPTO_REV_CODREV := 104 
STATIC DEFINE JFOPTO_REV_DATA := 127 
STATIC DEFINE JFOPTO_REV_ENTREV := 105 
STATIC DEFINE JFOPTO_REV_ESCCOD := 120 
STATIC DEFINE JFOPTO_REV_ESCHOR := 115 
STATIC DEFINE JFOPTO_REV_FOLGASN := 125 
STATIC DEFINE JFOPTO_REV_GRUPO := 103 
STATIC DEFINE JFOPTO_REV_SAIREV := 108 
STATIC DEFINE JFOPTO_REV_SC_ALMI := 113 
STATIC DEFINE JFOPTO_REV_SC_CODREV := 102 
STATIC DEFINE JFOPTO_REV_SC_DATA := 101 
STATIC DEFINE JFOPTO_REV_SC_ENT := 114 
STATIC DEFINE JFOPTO_REV_SC_FOLOCO := 126 
STATIC DEFINE JFOPTO_REV_SC_GRUPO := 100 
STATIC DEFINE JFOPTO_REV_SC_SAI := 112 
STATIC DEFINE JFOPTO_REV_SC_VIRADA1 := 111 
STATIC DEFINE JFOPTO_REV_VIRADA := 109 
#endregion

PARTIAL class JFOPTO_REV inherit MYDataWindow 

	PROTECT oDBGRUPO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBCODREV as DataColumn
	PROTECT oDBENTREV as DataColumn
	PROTECT oDBALIREV as DataColumn
	PROTECT oDBALSREV as DataColumn
	PROTECT oDBSAIREV as DataColumn
	PROTECT oDBVIRADA as DataColumn
	PROTECT oDBFOLGASN as DataColumn
	protect oDCSC_GRUPO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_CODREV as FIXEDTEXT
	protect oDCGRUPO as SINGLELINEEDIT
	protect oDCCODREV as SINGLELINEEDIT
	protect oDCENTREV as RIGHTSLE
	protect oDCALIREV as RIGHTSLE
	protect oDCALSREV as RIGHTSLE
	protect oDCSAIREV as RIGHTSLE
	protect oDCVIRADA as SINGLELINEEDIT
	protect oCCcmdvir as PUSHBUTTON
	protect oDCSC_VIRADA1 as FIXEDTEXT
	protect oDCSC_SAI as FIXEDTEXT
	protect oDCSC_ALMI as FIXEDTEXT
	protect oDCSC_ENT as FIXEDTEXT
	protect oCCeschor as PUSHBUTTON
	protect oCCcmdDO as PUSHBUTTON
	protect oCCcmdfo as PUSHBUTTON
	protect oCCCmdZerar as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCESCCOD as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCcmdDO1 as PUSHBUTTON
	protect oCCcmdDO2 as PUSHBUTTON
	protect oCCcmdfol as PUSHBUTTON
	protect oDCFOLGASN as SINGLELINEEDIT
	protect oDCSC_FOLOCO as FIXEDTEXT
	protect oDCDATA as DATESLE
// 	instance GRUPO 
// 	instance CODREV 
// 	instance ENTREV 
// 	instance ALIREV 
// 	instance ALSREV 
// 	instance SAIREV 
// 	instance VIRADA 
// 	instance FOLGASN 
// 	instance DATA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ALIREV() 
return self:FieldGet(#ALIREV)


assign ALIREV(uValue) 
self:FieldPut(#ALIREV, uValue)
return ALIREV := uValue


access ALSREV() 
return self:FieldGet(#ALSREV)


assign ALSREV(uValue) 
self:FieldPut(#ALSREV, uValue)
return ALSREV := uValue


access CODREV() 
return self:FieldGet(#CODREV)


assign CODREV(uValue) 
self:FieldPut(#CODREV, uValue)
return CODREV := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access ENTREV() 
return self:FieldGet(#ENTREV)


assign ENTREV(uValue) 
self:FieldPut(#ENTREV, uValue)
return ENTREV := uValue


access FOLGASN() 
return self:FieldGet(#FOLGASN)


assign FOLGASN(uValue) 
self:FieldPut(#FOLGASN, uValue)
return FOLGASN := uValue


access GRUPO() 
return self:FieldGet(#GRUPO)


assign GRUPO(uValue) 
self:FieldPut(#GRUPO, uValue)
return GRUPO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFOPTO_REV",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_GRUPO := FixedText{self,ResourceID{JFOPTO_REV_SC_GRUPO,_GetInst()}}
oDCSC_GRUPO:HyperLabel := HyperLabel{#SC_GRUPO,"Grupo:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JFOPTO_REV_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_CODREV := FixedText{self,ResourceID{JFOPTO_REV_SC_CODREV,_GetInst()}}
oDCSC_CODREV:HyperLabel := HyperLabel{#SC_CODREV,"Horario",NULL_STRING,NULL_STRING}

oDCGRUPO := SingleLineEdit{self,ResourceID{JFOPTO_REV_GRUPO,_GetInst()}}
oDCGRUPO:FieldSpec := PADRAO_CHAR_02{}
oDCGRUPO:HyperLabel := HyperLabel{#GRUPO,"Grupo:",NULL_STRING,"FOPTOREV_GRUPO"}

oDCCODREV := SingleLineEdit{self,ResourceID{JFOPTO_REV_CODREV,_GetInst()}}
oDCCODREV:FieldSpec := PADRAO_CHAR_02{}
oDCCODREV:HyperLabel := HyperLabel{#CODREV,"Cod",NULL_STRING,"FOPTOREV_CODREV"}
oDCCODREV:BackGround := aBrushes[1]

oDCENTREV := rightSle{self,ResourceID{JFOPTO_REV_ENTREV,_GetInst()}}
oDCENTREV:FieldSpec := PADRAO_NUM_05_2{}
oDCENTREV:HyperLabel := HyperLabel{#ENTREV,"Ent:",NULL_STRING,"FOPTOREV_ENTREV"}

oDCALIREV := rightSle{self,ResourceID{JFOPTO_REV_ALIREV,_GetInst()}}
oDCALIREV:FieldSpec := PADRAO_NUM_05_2{}
oDCALIREV:HyperLabel := HyperLabel{#ALIREV,"RefS",NULL_STRING,"FOPTOREV_ALIREV"}

oDCALSREV := rightSle{self,ResourceID{JFOPTO_REV_ALSREV,_GetInst()}}
oDCALSREV:FieldSpec := PADRAO_NUM_05_2{}
oDCALSREV:HyperLabel := HyperLabel{#ALSREV,"RefE",NULL_STRING,"FOPTOREV_ALSREV"}

oDCSAIREV := rightSle{self,ResourceID{JFOPTO_REV_SAIREV,_GetInst()}}
oDCSAIREV:FieldSpec := PADRAO_NUM_05_2{}
oDCSAIREV:HyperLabel := HyperLabel{#SAIREV,"Sai:",NULL_STRING,"FOPTOREV_SAIREV"}

oDCVIRADA := SingleLineEdit{self,ResourceID{JFOPTO_REV_VIRADA,_GetInst()}}
oDCVIRADA:FieldSpec := PADRAO_CHAR_01{}
oDCVIRADA:HyperLabel := HyperLabel{#VIRADA,"Virada:",NULL_STRING,"FOPTOREV_VIRADA"}
oDCVIRADA:BackGround := aBrushes[1]

oCCcmdvir := PushButton{self,ResourceID{JFOPTO_REV_CMDVIR,_GetInst()}}
oCCcmdvir:HyperLabel := HyperLabel{#cmdvir,"Sim/Nao",NULL_STRING,NULL_STRING}

oDCSC_VIRADA1 := FixedText{self,ResourceID{JFOPTO_REV_SC_VIRADA1,_GetInst()}}
oDCSC_VIRADA1:HyperLabel := HyperLabel{#SC_VIRADA1,"Virada:",NULL_STRING,NULL_STRING}

oDCSC_SAI := FixedText{self,ResourceID{JFOPTO_REV_SC_SAI,_GetInst()}}
oDCSC_SAI:HyperLabel := HyperLabel{#SC_SAI,"Saida:",NULL_STRING,NULL_STRING}

oDCSC_ALMI := FixedText{self,ResourceID{JFOPTO_REV_SC_ALMI,_GetInst()}}
oDCSC_ALMI:HyperLabel := HyperLabel{#SC_ALMI,"refeicao",NULL_STRING,NULL_STRING}

oDCSC_ENT := FixedText{self,ResourceID{JFOPTO_REV_SC_ENT,_GetInst()}}
oDCSC_ENT:HyperLabel := HyperLabel{#SC_ENT,"Entrada:",NULL_STRING,NULL_STRING}

oCCeschor := PushButton{self,ResourceID{JFOPTO_REV_ESCHOR,_GetInst()}}
oCCeschor:HyperLabel := HyperLabel{#eschor,"Horario",NULL_STRING,NULL_STRING}

oCCcmdDO := PushButton{self,ResourceID{JFOPTO_REV_CMDDO,_GetInst()}}
oCCcmdDO:HyperLabel := HyperLabel{#cmdDO,"Domingo",NULL_STRING,NULL_STRING}

oCCcmdfo := PushButton{self,ResourceID{JFOPTO_REV_CMDFO,_GetInst()}}
oCCcmdfo:HyperLabel := HyperLabel{#cmdfo,"Folga",NULL_STRING,NULL_STRING}

oCCCmdZerar := PushButton{self,ResourceID{JFOPTO_REV_CMDZERAR,_GetInst()}}
oCCCmdZerar:HyperLabel := HyperLabel{#CmdZerar,"Zerar",NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JFOPTO_REV_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCESCCOD := PushButton{self,ResourceID{JFOPTO_REV_ESCCOD,_GetInst()}}
oCCESCCOD:HyperLabel := HyperLabel{#ESCCOD,"Codigo",NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JFOPTO_REV_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCcmdDO1 := PushButton{self,ResourceID{JFOPTO_REV_CMDDO1,_GetInst()}}
oCCcmdDO1:HyperLabel := HyperLabel{#cmdDO1,"Feriado",NULL_STRING,NULL_STRING}

oCCcmdDO2 := PushButton{self,ResourceID{JFOPTO_REV_CMDDO2,_GetInst()}}
oCCcmdDO2:HyperLabel := HyperLabel{#cmdDO2,"Sabado",NULL_STRING,NULL_STRING}

oCCcmdfol := PushButton{self,ResourceID{JFOPTO_REV_CMDFOL,_GetInst()}}
oCCcmdfol:HyperLabel := HyperLabel{#cmdfol,"Sim/Nao",NULL_STRING,NULL_STRING}

oDCFOLGASN := SingleLineEdit{self,ResourceID{JFOPTO_REV_FOLGASN,_GetInst()}}
oDCFOLGASN:FieldSpec := PADRAO_CHAR_01{}
oDCFOLGASN:HyperLabel := HyperLabel{#FOLGASN,"Folga",NULL_STRING,"FO_PON_FOLSN"}
oDCFOLGASN:BackGround := aBrushes[1]

oDCSC_FOLOCO := FixedText{self,ResourceID{JFOPTO_REV_SC_FOLOCO,_GetInst()}}
oDCSC_FOLOCO:HyperLabel := HyperLabel{#SC_FOLOCO,"Folga",NULL_STRING,NULL_STRING}

oDCDATA := DateSle{self,ResourceID{JFOPTO_REV_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data",NULL_STRING,NULL_STRING}

self:Caption := "Escala de Revesamento"
self:HyperLabel := HyperLabel{#JFOPTO_REV,"Escala de Revesamento",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBGRUPO := DataColumn{PADRAO_CHAR_02{}}
oDBGRUPO:Width := 7
oDBGRUPO:HyperLabel := oDCGRUPO:HyperLabel 
oDBGRUPO:Caption := "Grupo:"
self:Browser:AddColumn(oDBGRUPO)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 11
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data"
self:Browser:AddColumn(oDBDATA)

oDBCODREV := DataColumn{PADRAO_CHAR_02{}}
oDBCODREV:Width := 7
oDBCODREV:HyperLabel := oDCCODREV:HyperLabel 
oDBCODREV:Caption := "Cod"
oDBCODREV:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODREV)

oDBENTREV := DataColumn{PADRAO_NUM_05_2{}}
oDBENTREV:Width := 8
oDBENTREV:HyperLabel := oDCENTREV:HyperLabel 
oDBENTREV:Caption := "Ent:"
self:Browser:AddColumn(oDBENTREV)

oDBALIREV := DataColumn{PADRAO_NUM_05_2{}}
oDBALIREV:Width := 8
oDBALIREV:HyperLabel := oDCALIREV:HyperLabel 
oDBALIREV:Caption := "RefS"
self:Browser:AddColumn(oDBALIREV)

oDBALSREV := DataColumn{PADRAO_NUM_05_2{}}
oDBALSREV:Width := 8
oDBALSREV:HyperLabel := oDCALSREV:HyperLabel 
oDBALSREV:Caption := "RefE"
self:Browser:AddColumn(oDBALSREV)

oDBSAIREV := DataColumn{PADRAO_NUM_05_2{}}
oDBSAIREV:Width := 8
oDBSAIREV:HyperLabel := oDCSAIREV:HyperLabel 
oDBSAIREV:Caption := "Sai:"
self:Browser:AddColumn(oDBSAIREV)

oDBVIRADA := DataColumn{PADRAO_CHAR_01{}}
oDBVIRADA:Width := 5
oDBVIRADA:HyperLabel := oDCVIRADA:HyperLabel 
oDBVIRADA:Caption := "Virada:"
oDBVIRADA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBVIRADA)

oDBFOLGASN := DataColumn{PADRAO_CHAR_01{}}
oDBFOLGASN:Width := 5
oDBFOLGASN:HyperLabel := oDCFOLGASN:HyperLabel 
oDBFOLGASN:Caption := "Folga"
oDBFOLGASN:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBFOLGASN)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access SAIREV() 
return self:FieldGet(#SAIREV)


assign SAIREV(uValue) 
self:FieldPut(#SAIREV, uValue)
return SAIREV := uValue


access VIRADA() 
return self:FieldGet(#VIRADA)


assign VIRADA(uValue) 
self:FieldPut(#VIRADA, uValue)
return VIRADA := uValue


END CLASS
