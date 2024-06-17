#region DEFINES
STATIC DEFINE JFO_POCO_ABONA := 132 
STATIC DEFINE JFO_POCO_BUSCANUM := 129 
STATIC DEFINE JFO_POCO_CESTA := 136 
STATIC DEFINE JFO_POCO_CMDALM := 123 
STATIC DEFINE JFO_POCO_CMDBCO := 120 
STATIC DEFINE JFO_POCO_CMDEXT := 119 
STATIC DEFINE JFO_POCO_CMDEXT1 := 135 
STATIC DEFINE JFO_POCO_CMDEXT2 := 131 
STATIC DEFINE JFO_POCO_CMDFOL := 117 
STATIC DEFINE JFO_POCO_CMDORDENAR := 130 
STATIC DEFINE JFO_POCO_CMDRED := 124 
STATIC DEFINE JFO_POCO_ESCCOD := 126 
STATIC DEFINE JFO_POCO_ESCFUN := 127 
STATIC DEFINE JFO_POCO_ESCSUB := 128 
STATIC DEFINE JFO_POCO_HRABO := 138 
STATIC DEFINE JFO_POCO_HRREL := 134 
STATIC DEFINE JFO_POCO_NUMERO := 106 
STATIC DEFINE JFO_POCO_OCOALM := 114 
STATIC DEFINE JFO_POCO_OCOBCO := 110 
STATIC DEFINE JFO_POCO_OCOCOD := 107 
STATIC DEFINE JFO_POCO_OCOEXT := 113 
STATIC DEFINE JFO_POCO_OCOFIM := 116 
STATIC DEFINE JFO_POCO_OCOFOL := 112 
STATIC DEFINE JFO_POCO_OCOINI := 115 
STATIC DEFINE JFO_POCO_OCOMOT := 108 
STATIC DEFINE JFO_POCO_OCORED := 111 
STATIC DEFINE JFO_POCO_OCOSUB := 109 
STATIC DEFINE JFO_POCO_SC_BCOOCO := 122 
STATIC DEFINE JFO_POCO_SC_EXTOCO := 121 
STATIC DEFINE JFO_POCO_SC_EXTOCO1 := 137 
STATIC DEFINE JFO_POCO_SC_EXTOCO2 := 133 
STATIC DEFINE JFO_POCO_SC_FOLOCO := 118 
STATIC DEFINE JFO_POCO_SC_NUMERO := 100 
STATIC DEFINE JFO_POCO_SC_OCOALM := 105 
STATIC DEFINE JFO_POCO_SC_OCOCOD := 102 
STATIC DEFINE JFO_POCO_SC_OCOINI := 101 
STATIC DEFINE JFO_POCO_SC_OCOMOT := 103 
STATIC DEFINE JFO_POCO_SC_OCOSUB := 104 
STATIC DEFINE JFO_POCO_SC_REDOCO := 125 
#endregion

PARTIAL class jfo_poco inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBOCOCOD as DataColumn
	PROTECT oDBOCOSUB as DataColumn
	PROTECT oDBOCOBCO as DataColumn
	PROTECT oDBOCORED as DataColumn
	PROTECT oDBOCOFOL as DataColumn
	PROTECT oDBOCOEXT as DataColumn
	PROTECT oDBOCOALM as DataColumn
	PROTECT oDBOCOMOT as DataColumn
	PROTECT oDBOCOINI as DataColumn
	PROTECT oDBOCOFIM as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_OCOINI as FIXEDTEXT
	protect oDCSC_OCOCOD as FIXEDTEXT
	protect oDCSC_OCOMOT as FIXEDTEXT
	protect oDCSC_OCOSUB as FIXEDTEXT
	protect oDCSC_OCOALM as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCOCOCOD as SINGLELINEEDIT
	protect oDCOCOMOT as SINGLELINEEDIT
	protect oDCOCOSUB as SINGLELINEEDIT
	protect oDCOCOBCO as SINGLELINEEDIT
	protect oDCOCORED as SINGLELINEEDIT
	protect oDCOCOFOL as SINGLELINEEDIT
	protect oDCOCOEXT as SINGLELINEEDIT
	protect oDCOCOALM as SINGLELINEEDIT
	protect oDCocoini as DATETIMEPICKER
	protect oDCocofim as DATETIMEPICKER
	protect oCCcmdfol as PUSHBUTTON
	protect oDCSC_FOLOCO as FIXEDTEXT
	protect oCCcmdext as PUSHBUTTON
	protect oCCcmdbco as PUSHBUTTON
	protect oDCSC_EXTOCO as FIXEDTEXT
	protect oDCSC_BCOOCO as FIXEDTEXT
	protect oCCcmdALM as PUSHBUTTON
	protect oCCcmdred as PUSHBUTTON
	protect oDCSC_REDOCO as FIXEDTEXT
	protect oCCesccod as PUSHBUTTON
	protect oCCescFUN as PUSHBUTTON
	protect oCCescSUB as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCcmdext2 as PUSHBUTTON
	protect oDCABONA as SINGLELINEEDIT
	protect oDCSC_EXTOCO2 as FIXEDTEXT
	protect oDCHRREL as SINGLELINEEDIT
	protect oCCcmdext1 as PUSHBUTTON
	protect oDCCESTA as SINGLELINEEDIT
	protect oDCSC_EXTOCO1 as FIXEDTEXT
	protect oDCHRABO as SINGLELINEEDIT
// 	instance NUMERO 
// 	instance OCOCOD 
// 	instance OCOMOT 
// 	instance OCOSUB 
// 	instance OCOBCO 
// 	instance OCORED 
// 	instance OCOFOL 
// 	instance OCOEXT 
// 	instance OCOALM 
// 	instance ABONA 
// 	instance HRREL 
// 	instance CESTA 
// 	instance HRABO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ABONA() 
return self:FieldGet(#ABONA)


assign ABONA(uValue) 
self:FieldPut(#ABONA, uValue)
return ABONA := uValue


access CESTA() 
return self:FieldGet(#CESTA)


assign CESTA(uValue) 
self:FieldPut(#CESTA, uValue)
return CESTA := uValue


access HRABO() 
return self:FieldGet(#HRABO)


assign HRABO(uValue) 
self:FieldPut(#HRABO, uValue)
return HRABO := uValue


access HRREL() 
return self:FieldGet(#HRREL)


assign HRREL(uValue) 
self:FieldPut(#HRREL, uValue)
return HRREL := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jfo_poco",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_NUMERO := FixedText{self,ResourceID{JFO_POCO_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_OCOINI := FixedText{self,ResourceID{JFO_POCO_SC_OCOINI,_GetInst()}}
oDCSC_OCOINI:HyperLabel := HyperLabel{#SC_OCOINI,"Periodo",NULL_STRING,NULL_STRING}

oDCSC_OCOCOD := FixedText{self,ResourceID{JFO_POCO_SC_OCOCOD,_GetInst()}}
oDCSC_OCOCOD:HyperLabel := HyperLabel{#SC_OCOCOD,"Cod:",NULL_STRING,NULL_STRING}

oDCSC_OCOMOT := FixedText{self,ResourceID{JFO_POCO_SC_OCOMOT,_GetInst()}}
oDCSC_OCOMOT:HyperLabel := HyperLabel{#SC_OCOMOT,"Mot/Obs",NULL_STRING,NULL_STRING}

oDCSC_OCOSUB := FixedText{self,ResourceID{JFO_POCO_SC_OCOSUB,_GetInst()}}
oDCSC_OCOSUB:HyperLabel := HyperLabel{#SC_OCOSUB,"Sub",NULL_STRING,NULL_STRING}

oDCSC_OCOALM := FixedText{self,ResourceID{JFO_POCO_SC_OCOALM,_GetInst()}}
oDCSC_OCOALM:HyperLabel := HyperLabel{#SC_OCOALM,"Almoco",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JFO_POCO_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"FO_POCO_NUMERO"}

oDCOCOCOD := SingleLineEdit{self,ResourceID{JFO_POCO_OCOCOD,_GetInst()}}
oDCOCOCOD:FieldSpec := PADRAO_CHAR_02{}
oDCOCOCOD:HyperLabel := HyperLabel{#OCOCOD,"cod",NULL_STRING,"FO_POCO_OCOCOD"}
oDCOCOCOD:BackGround := aBrushes[1]

oDCOCOMOT := SingleLineEdit{self,ResourceID{JFO_POCO_OCOMOT,_GetInst()}}
oDCOCOMOT:FieldSpec := PADRAO_CHAR_60{}
oDCOCOMOT:HyperLabel := HyperLabel{#OCOMOT,"Obs/Mot",NULL_STRING,"FO_POCO_OCOMOT"}

oDCOCOSUB := SingleLineEdit{self,ResourceID{JFO_POCO_OCOSUB,_GetInst()}}
oDCOCOSUB:FieldSpec := PADRAO_CHAR_02{}
oDCOCOSUB:HyperLabel := HyperLabel{#OCOSUB,"Sub",NULL_STRING,"FO_POCO_OCOSUB"}
oDCOCOSUB:BackGround := aBrushes[1]

oDCOCOBCO := SingleLineEdit{self,ResourceID{JFO_POCO_OCOBCO,_GetInst()}}
oDCOCOBCO:FieldSpec := PADRAO_CHAR_01{}
oDCOCOBCO:HyperLabel := HyperLabel{#OCOBCO,"bco",NULL_STRING,"FO_POCO_OCOBCO"}
oDCOCOBCO:BackGround := aBrushes[1]

oDCOCORED := SingleLineEdit{self,ResourceID{JFO_POCO_OCORED,_GetInst()}}
oDCOCORED:FieldSpec := PADRAO_CHAR_01{}
oDCOCORED:HyperLabel := HyperLabel{#OCORED,"red",NULL_STRING,"FO_POCO_OCORED"}
oDCOCORED:BackGround := aBrushes[1]

oDCOCOFOL := SingleLineEdit{self,ResourceID{JFO_POCO_OCOFOL,_GetInst()}}
oDCOCOFOL:FieldSpec := PADRAO_CHAR_01{}
oDCOCOFOL:HyperLabel := HyperLabel{#OCOFOL,"folga",NULL_STRING,"FO_POCO_OCOFOL"}
oDCOCOFOL:BackGround := aBrushes[1]

oDCOCOEXT := SingleLineEdit{self,ResourceID{JFO_POCO_OCOEXT,_GetInst()}}
oDCOCOEXT:FieldSpec := PADRAO_CHAR_01{}
oDCOCOEXT:HyperLabel := HyperLabel{#OCOEXT,"extra",NULL_STRING,"FO_POCO_OCOEXT"}
oDCOCOEXT:BackGround := aBrushes[1]

oDCOCOALM := SingleLineEdit{self,ResourceID{JFO_POCO_OCOALM,_GetInst()}}
oDCOCOALM:FieldSpec := PADRAO_CHAR_01{}
oDCOCOALM:HyperLabel := HyperLabel{#OCOALM,"alm",NULL_STRING,"FO_POCO_OCOALM"}
oDCOCOALM:BackGround := aBrushes[1]

oDCocoini := DateTimePicker{self,ResourceID{JFO_POCO_OCOINI,_GetInst()}}
oDCocoini:FieldSpec := DATE_FIELD{}
oDCocoini:HyperLabel := HyperLabel{#ocoini,"Ini",NULL_STRING,NULL_STRING}

oDCocofim := DateTimePicker{self,ResourceID{JFO_POCO_OCOFIM,_GetInst()}}
oDCocofim:FieldSpec := DATE_FIELD{}
oDCocofim:HyperLabel := HyperLabel{#ocofim,"fim",NULL_STRING,NULL_STRING}

oCCcmdfol := PushButton{self,ResourceID{JFO_POCO_CMDFOL,_GetInst()}}
oCCcmdfol:HyperLabel := HyperLabel{#cmdfol,"Sim/Nao",NULL_STRING,NULL_STRING}

oDCSC_FOLOCO := FixedText{self,ResourceID{JFO_POCO_SC_FOLOCO,_GetInst()}}
oDCSC_FOLOCO:HyperLabel := HyperLabel{#SC_FOLOCO,"Folga",NULL_STRING,NULL_STRING}

oCCcmdext := PushButton{self,ResourceID{JFO_POCO_CMDEXT,_GetInst()}}
oCCcmdext:HyperLabel := HyperLabel{#cmdext,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdbco := PushButton{self,ResourceID{JFO_POCO_CMDBCO,_GetInst()}}
oCCcmdbco:HyperLabel := HyperLabel{#cmdbco,"Sim/Nao",NULL_STRING,NULL_STRING}

oDCSC_EXTOCO := FixedText{self,ResourceID{JFO_POCO_SC_EXTOCO,_GetInst()}}
oDCSC_EXTOCO:HyperLabel := HyperLabel{#SC_EXTOCO,"Extra:",NULL_STRING,NULL_STRING}

oDCSC_BCOOCO := FixedText{self,ResourceID{JFO_POCO_SC_BCOOCO,_GetInst()}}
oDCSC_BCOOCO:HyperLabel := HyperLabel{#SC_BCOOCO,"Banco",NULL_STRING,NULL_STRING}

oCCcmdALM := PushButton{self,ResourceID{JFO_POCO_CMDALM,_GetInst()}}
oCCcmdALM:HyperLabel := HyperLabel{#cmdALM," ABCDE",NULL_STRING,NULL_STRING}

oCCcmdred := PushButton{self,ResourceID{JFO_POCO_CMDRED,_GetInst()}}
oCCcmdred:HyperLabel := HyperLabel{#cmdred,"Sim/Nao",NULL_STRING,NULL_STRING}

oDCSC_REDOCO := FixedText{self,ResourceID{JFO_POCO_SC_REDOCO,_GetInst()}}
oDCSC_REDOCO:HyperLabel := HyperLabel{#SC_REDOCO,"Reduçao Horario",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JFO_POCO_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oCCescFUN := PushButton{self,ResourceID{JFO_POCO_ESCFUN,_GetInst()}}
oCCescFUN:HyperLabel := HyperLabel{#escFUN,"...",NULL_STRING,NULL_STRING}

oCCescSUB := PushButton{self,ResourceID{JFO_POCO_ESCSUB,_GetInst()}}
oCCescSUB:HyperLabel := HyperLabel{#escSUB,"...",NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JFO_POCO_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCcmdordenar := PushButton{self,ResourceID{JFO_POCO_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCcmdext2 := PushButton{self,ResourceID{JFO_POCO_CMDEXT2,_GetInst()}}
oCCcmdext2:HyperLabel := HyperLabel{#cmdext2,"Sim/Nao/Pular",NULL_STRING,NULL_STRING}

oDCABONA := SingleLineEdit{self,ResourceID{JFO_POCO_ABONA,_GetInst()}}
oDCABONA:FieldSpec := PADRAO_CHAR_01{}
oDCABONA:HyperLabel := HyperLabel{#ABONA,NULL_STRING,NULL_STRING,"FO_POCO_OCOEXT"}
oDCABONA:BackGround := aBrushes[1]

oDCSC_EXTOCO2 := FixedText{self,ResourceID{JFO_POCO_SC_EXTOCO2,_GetInst()}}
oDCSC_EXTOCO2:HyperLabel := HyperLabel{#SC_EXTOCO2,"Abonar:",NULL_STRING,NULL_STRING}

oDCHRREL := SingleLineEdit{self,ResourceID{JFO_POCO_HRREL,_GetInst()}}
oDCHRREL:FieldSpec := PADRAO_NUM_05_2{}
oDCHRREL:HyperLabel := HyperLabel{#HRREL,"Numero:",NULL_STRING,"FO_POCO_NUMERO"}

oCCcmdext1 := PushButton{self,ResourceID{JFO_POCO_CMDEXT1,_GetInst()}}
oCCcmdext1:HyperLabel := HyperLabel{#cmdext1,"(P)ular(A)traso(M)edico(F)alta Acid(T)raba Ad(V)ertencia (C)racha Falta(J)us",NULL_STRING,NULL_STRING}

oDCCESTA := SingleLineEdit{self,ResourceID{JFO_POCO_CESTA,_GetInst()}}
oDCCESTA:FieldSpec := PADRAO_CHAR_01{}
oDCCESTA:HyperLabel := HyperLabel{#CESTA,NULL_STRING,NULL_STRING,"FO_POCO_OCOEXT"}
oDCCESTA:BackGround := aBrushes[1]

oDCSC_EXTOCO1 := FixedText{self,ResourceID{JFO_POCO_SC_EXTOCO1,_GetInst()}}
oDCSC_EXTOCO1:HyperLabel := HyperLabel{#SC_EXTOCO1,"Cesta Basica:",NULL_STRING,NULL_STRING}

oDCHRABO := SingleLineEdit{self,ResourceID{JFO_POCO_HRABO,_GetInst()}}
oDCHRABO:FieldSpec := PADRAO_NUM_05_2{}
oDCHRABO:HyperLabel := HyperLabel{#HRABO,"Numero:",NULL_STRING,"FO_POCO_NUMERO"}

self:Caption := "Ocorrencias"
self:HyperLabel := HyperLabel{#jfo_poco,"Ocorrencias",NULL_STRING,NULL_STRING}
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

oDBOCOCOD := DataColumn{PADRAO_CHAR_02{}}
oDBOCOCOD:Width := 6
oDBOCOCOD:HyperLabel := oDCOCOCOD:HyperLabel 
oDBOCOCOD:Caption := "cod"
oDBOCOCOD:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOCOCOD)

oDBOCOSUB := DataColumn{PADRAO_CHAR_02{}}
oDBOCOSUB:Width := 6
oDBOCOSUB:HyperLabel := oDCOCOSUB:HyperLabel 
oDBOCOSUB:Caption := "Sub"
oDBOCOSUB:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOCOSUB)

oDBOCOBCO := DataColumn{PADRAO_CHAR_01{}}
oDBOCOBCO:Width := 7
oDBOCOBCO:HyperLabel := oDCOCOBCO:HyperLabel 
oDBOCOBCO:Caption := "bco"
oDBOCOBCO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOCOBCO)

oDBOCORED := DataColumn{PADRAO_CHAR_01{}}
oDBOCORED:Width := 6
oDBOCORED:HyperLabel := oDCOCORED:HyperLabel 
oDBOCORED:Caption := "red"
oDBOCORED:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOCORED)

oDBOCOFOL := DataColumn{PADRAO_CHAR_01{}}
oDBOCOFOL:Width := 7
oDBOCOFOL:HyperLabel := oDCOCOFOL:HyperLabel 
oDBOCOFOL:Caption := "folga"
oDBOCOFOL:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOCOFOL)

oDBOCOEXT := DataColumn{PADRAO_CHAR_01{}}
oDBOCOEXT:Width := 6
oDBOCOEXT:HyperLabel := oDCOCOEXT:HyperLabel 
oDBOCOEXT:Caption := "extra"
oDBOCOEXT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOCOEXT)

oDBOCOALM := DataColumn{PADRAO_CHAR_01{}}
oDBOCOALM:Width := 6
oDBOCOALM:HyperLabel := oDCOCOALM:HyperLabel 
oDBOCOALM:Caption := "alm"
oDBOCOALM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOCOALM)

oDBOCOMOT := DataColumn{PADRAO_CHAR_60{}}
oDBOCOMOT:Width := 12
oDBOCOMOT:HyperLabel := oDCOCOMOT:HyperLabel 
oDBOCOMOT:Caption := "Obs/Mot"
self:Browser:AddColumn(oDBOCOMOT)

oDBOCOINI := DataColumn{DATE_FIELD{}}
oDBOCOINI:Width := 12
oDBOCOINI:HyperLabel := oDCOCOINI:HyperLabel 
oDBOCOINI:Caption := "Ini"
self:Browser:AddColumn(oDBOCOINI)

oDBOCOFIM := DataColumn{DATE_FIELD{}}
oDBOCOFIM:Width := 14
oDBOCOFIM:HyperLabel := oDCOCOFIM:HyperLabel 
oDBOCOFIM:Caption := "fim"
self:Browser:AddColumn(oDBOCOFIM)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access OCOALM() 
return self:FieldGet(#OCOALM)


assign OCOALM(uValue) 
self:FieldPut(#OCOALM, uValue)
return OCOALM := uValue


access OCOBCO() 
return self:FieldGet(#OCOBCO)


assign OCOBCO(uValue) 
self:FieldPut(#OCOBCO, uValue)
return OCOBCO := uValue


access OCOCOD() 
return self:FieldGet(#OCOCOD)


assign OCOCOD(uValue) 
self:FieldPut(#OCOCOD, uValue)
return OCOCOD := uValue


access OCOEXT() 
return self:FieldGet(#OCOEXT)


assign OCOEXT(uValue) 
self:FieldPut(#OCOEXT, uValue)
return OCOEXT := uValue


access OCOFOL() 
return self:FieldGet(#OCOFOL)


assign OCOFOL(uValue) 
self:FieldPut(#OCOFOL, uValue)
return OCOFOL := uValue


access OCOMOT() 
return self:FieldGet(#OCOMOT)


assign OCOMOT(uValue) 
self:FieldPut(#OCOMOT, uValue)
return OCOMOT := uValue


access OCORED() 
return self:FieldGet(#OCORED)


assign OCORED(uValue) 
self:FieldPut(#OCORED, uValue)
return OCORED := uValue


access OCOSUB() 
return self:FieldGet(#OCOSUB)


assign OCOSUB(uValue) 
self:FieldPut(#OCOSUB, uValue)
return OCOSUB := uValue


END CLASS
