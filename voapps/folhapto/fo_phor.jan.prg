#region DEFINES
STATIC DEFINE JFO_PHOR_BUSCANUM := 110 
STATIC DEFINE JFO_PHOR_CMDORDENAR := 112 
STATIC DEFINE JFO_PHOR_ESCCOD := 109 
STATIC DEFINE JFO_PHOR_ESCFUN := 111 
STATIC DEFINE JFO_PHOR_NUMERO := 104 
STATIC DEFINE JFO_PHOR_OCOCOD := 107 
STATIC DEFINE JFO_PHOR_OCOFIM := 106 
STATIC DEFINE JFO_PHOR_OCOINI := 105 
STATIC DEFINE JFO_PHOR_OCOMOT := 108 
STATIC DEFINE JFO_PHOR_SC_NUMERO := 100 
STATIC DEFINE JFO_PHOR_SC_OCOCOD := 102 
STATIC DEFINE JFO_PHOR_SC_OCOINI := 101 
STATIC DEFINE JFO_PHOR_SC_OCOMOT := 103 
#endregion

PARTIAL class jfo_phor inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBOCOINI as DataColumn
	PROTECT oDBOCOFIM as DataColumn
	PROTECT oDBOCOCOD as DataColumn
	PROTECT oDBOCOMOT as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_OCOINI as FIXEDTEXT
	protect oDCSC_OCOCOD as FIXEDTEXT
	protect oDCSC_OCOMOT as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCOCOINI as DATESLE
	protect oDCOCOFIM as DATESLE
	protect oDCOCOCOD as SINGLELINEEDIT
	protect oDCOCOMOT as SINGLELINEEDIT
	protect oCCesccod as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCescFUN as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
// 	instance NUMERO 
// 	instance OCOINI 
// 	instance OCOFIM 
// 	instance OCOCOD 
// 	instance OCOMOT 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jfo_phor",_GetInst()},iCtlID)

oDCSC_NUMERO := FixedText{self,ResourceID{JFO_PHOR_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_OCOINI := FixedText{self,ResourceID{JFO_PHOR_SC_OCOINI,_GetInst()}}
oDCSC_OCOINI:HyperLabel := HyperLabel{#SC_OCOINI,"Periodo",NULL_STRING,NULL_STRING}

oDCSC_OCOCOD := FixedText{self,ResourceID{JFO_PHOR_SC_OCOCOD,_GetInst()}}
oDCSC_OCOCOD:HyperLabel := HyperLabel{#SC_OCOCOD,"Horario",NULL_STRING,NULL_STRING}

oDCSC_OCOMOT := FixedText{self,ResourceID{JFO_PHOR_SC_OCOMOT,_GetInst()}}
oDCSC_OCOMOT:HyperLabel := HyperLabel{#SC_OCOMOT,"Obs/Motivo",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JFO_PHOR_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"FO_PHOR_NUMERO"}

oDCOCOINI := DateSle{self,ResourceID{JFO_PHOR_OCOINI,_GetInst()}}
oDCOCOINI:FieldSpec := DATE_FIELD{}
oDCOCOINI:HyperLabel := HyperLabel{#OCOINI,"INI",NULL_STRING,"FO_PHOR_OCOINI"}

oDCOCOFIM := DateSle{self,ResourceID{JFO_PHOR_OCOFIM,_GetInst()}}
oDCOCOFIM:FieldSpec := DATE_FIELD{}
oDCOCOFIM:HyperLabel := HyperLabel{#OCOFIM,"Fim",NULL_STRING,"FO_PHOR_OCOFIM"}

oDCOCOCOD := SingleLineEdit{self,ResourceID{JFO_PHOR_OCOCOD,_GetInst()}}
oDCOCOCOD:FieldSpec := PADRAO_CHAR_02{}
oDCOCOCOD:HyperLabel := HyperLabel{#OCOCOD,"Hor",NULL_STRING,"FO_PHOR_OCOCOD"}

oDCOCOMOT := SingleLineEdit{self,ResourceID{JFO_PHOR_OCOMOT,_GetInst()}}
oDCOCOMOT:FieldSpec := PADRAO_CHAR_60{}
oDCOCOMOT:HyperLabel := HyperLabel{#OCOMOT,"Obs/Mot",NULL_STRING,"FO_PHOR_OCOMOT"}

oCCesccod := PushButton{self,ResourceID{JFO_PHOR_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JFO_PHOR_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCescFUN := PushButton{self,ResourceID{JFO_PHOR_ESCFUN,_GetInst()}}
oCCescFUN:HyperLabel := HyperLabel{#escFUN,"...",NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JFO_PHOR_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Correçao de Horarios"
self:HyperLabel := HyperLabel{#jfo_phor,"Correçao de Horarios",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBOCOINI := DataColumn{DATE_FIELD{}}
oDBOCOINI:Width := 13
oDBOCOINI:HyperLabel := oDCOCOINI:HyperLabel 
oDBOCOINI:Caption := "INI"
self:Browser:AddColumn(oDBOCOINI)

oDBOCOFIM := DataColumn{DATE_FIELD{}}
oDBOCOFIM:Width := 13
oDBOCOFIM:HyperLabel := oDCOCOFIM:HyperLabel 
oDBOCOFIM:Caption := "Fim"
self:Browser:AddColumn(oDBOCOFIM)

oDBOCOCOD := DataColumn{PADRAO_CHAR_02{}}
oDBOCOCOD:Width := 8
oDBOCOCOD:HyperLabel := oDCOCOCOD:HyperLabel 
oDBOCOCOD:Caption := "Hor"
self:Browser:AddColumn(oDBOCOCOD)

oDBOCOMOT := DataColumn{PADRAO_CHAR_60{}}
oDBOCOMOT:Width := 20
oDBOCOMOT:HyperLabel := oDCOCOMOT:HyperLabel 
oDBOCOMOT:Caption := "Obs/Mot"
self:Browser:AddColumn(oDBOCOMOT)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access OCOCOD() 
return self:FieldGet(#OCOCOD)


assign OCOCOD(uValue) 
self:FieldPut(#OCOCOD, uValue)
return OCOCOD := uValue


access OCOFIM() 
return self:FieldGet(#OCOFIM)


assign OCOFIM(uValue) 
self:FieldPut(#OCOFIM, uValue)
return OCOFIM := uValue


access OCOINI() 
return self:FieldGet(#OCOINI)


assign OCOINI(uValue) 
self:FieldPut(#OCOINI, uValue)
return OCOINI := uValue


access OCOMOT() 
return self:FieldGet(#OCOMOT)


assign OCOMOT(uValue) 
self:FieldPut(#OCOMOT, uValue)
return OCOMOT := uValue


END CLASS
