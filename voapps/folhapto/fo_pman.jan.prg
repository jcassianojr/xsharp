#region DEFINES
STATIC DEFINE JFO_PMAN_BCOOCO := 117 
STATIC DEFINE JFO_PMAN_BUSCANUM := 125 
STATIC DEFINE JFO_PMAN_CMDORDENAR := 126 
STATIC DEFINE JFO_PMAN_CMDZER := 123 
STATIC DEFINE JFO_PMAN_CODOCO := 109 
STATIC DEFINE JFO_PMAN_DATOCO := 122 
STATIC DEFINE JFO_PMAN_ESCFUN := 124 
STATIC DEFINE JFO_PMAN_EXTOCO := 120 
STATIC DEFINE JFO_PMAN_FOLOCO := 119 
STATIC DEFINE JFO_PMAN_HOROC2 := 111 
STATIC DEFINE JFO_PMAN_HOROC3 := 112 
STATIC DEFINE JFO_PMAN_HOROC4 := 113 
STATIC DEFINE JFO_PMAN_HOROCO := 110 
STATIC DEFINE JFO_PMAN_MOTOCO := 115 
STATIC DEFINE JFO_PMAN_NUMERO := 108 
STATIC DEFINE JFO_PMAN_PUSHBUTTON1 := 121 
STATIC DEFINE JFO_PMAN_REDOCO := 118 
STATIC DEFINE JFO_PMAN_SC_DATOCO := 101 
STATIC DEFINE JFO_PMAN_SC_HOROC2 := 103 
STATIC DEFINE JFO_PMAN_SC_HOROC4 := 104 
STATIC DEFINE JFO_PMAN_SC_HOROCO := 102 
STATIC DEFINE JFO_PMAN_SC_MOTOCO := 106 
STATIC DEFINE JFO_PMAN_SC_NUMERO := 100 
STATIC DEFINE JFO_PMAN_SC_TIPOCO := 105 
STATIC DEFINE JFO_PMAN_SC_ZERHOR := 107 
STATIC DEFINE JFO_PMAN_TIPOCO := 114 
STATIC DEFINE JFO_PMAN_ZERHOR := 116 
#endregion

PARTIAL class jfo_pman inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBDATOCO as DataColumn
	PROTECT oDBTIPOCO as DataColumn
	PROTECT oDBCODOCO as DataColumn
	PROTECT oDBHOROCO as DataColumn
	PROTECT oDBHOROC2 as DataColumn
	PROTECT oDBHOROC3 as DataColumn
	PROTECT oDBHOROC4 as DataColumn
	PROTECT oDBZERHOR as DataColumn
	PROTECT oDBBCOOCO as DataColumn
	PROTECT oDBREDOCO as DataColumn
	PROTECT oDBFOLOCO as DataColumn
	PROTECT oDBEXTOCO as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_DATOCO as FIXEDTEXT
	protect oDCSC_HOROCO as FIXEDTEXT
	protect oDCSC_HOROC2 as FIXEDTEXT
	protect oDCSC_HOROC4 as FIXEDTEXT
	protect oDCSC_TIPOCO as FIXEDTEXT
	protect oDCSC_MOTOCO as FIXEDTEXT
	protect oDCSC_ZERHOR as FIXEDTEXT
	protect oDCNUMERO as RIGHTSLE
	protect oDCHOROCO as RIGHTSLE
	protect oDCHOROC2 as RIGHTSLE
	protect oDCHOROC3 as RIGHTSLE
	protect oDCHOROC4 as RIGHTSLE
	protect oDCTIPOCO as SINGLELINEEDIT
	protect oDCMOTOCO as SINGLELINEEDIT
	protect oDCZERHOR as SINGLELINEEDIT
	protect oCCPushButton1 as PUSHBUTTON
	protect oDCDATOCO as DATETIMEPICKER
	protect oCCcmdzer as PUSHBUTTON
	protect oCCescFUN as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
// 	instance NUMERO 
// 	instance CODOCO 
// 	instance HOROCO 
// 	instance HOROC2 
// 	instance HOROC3 
// 	instance HOROC4 
// 	instance TIPOCO 
// 	instance MOTOCO 
// 	instance ZERHOR 
// 	instance BCOOCO 
// 	instance REDOCO 
// 	instance FOLOCO 
// 	instance EXTOCO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access BCOOCO() 
return self:FieldGet(#BCOOCO)


assign BCOOCO(uValue) 
self:FieldPut(#BCOOCO, uValue)
return BCOOCO := uValue


access CODOCO() 
return self:FieldGet(#CODOCO)


assign CODOCO(uValue) 
self:FieldPut(#CODOCO, uValue)
return CODOCO := uValue


access EXTOCO() 
return self:FieldGet(#EXTOCO)


assign EXTOCO(uValue) 
self:FieldPut(#EXTOCO, uValue)
return EXTOCO := uValue


access FOLOCO() 
return self:FieldGet(#FOLOCO)


assign FOLOCO(uValue) 
self:FieldPut(#FOLOCO, uValue)
return FOLOCO := uValue


access HOROC2() 
return self:FieldGet(#HOROC2)


assign HOROC2(uValue) 
self:FieldPut(#HOROC2, uValue)
return HOROC2 := uValue


access HOROC3() 
return self:FieldGet(#HOROC3)


assign HOROC3(uValue) 
self:FieldPut(#HOROC3, uValue)
return HOROC3 := uValue


access HOROC4() 
return self:FieldGet(#HOROC4)


assign HOROC4(uValue) 
self:FieldPut(#HOROC4, uValue)
return HOROC4 := uValue


access HOROCO() 
return self:FieldGet(#HOROCO)


assign HOROCO(uValue) 
self:FieldPut(#HOROCO, uValue)
return HOROCO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jfo_pman",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_NUMERO := FixedText{self,ResourceID{JFO_PMAN_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_DATOCO := FixedText{self,ResourceID{JFO_PMAN_SC_DATOCO,_GetInst()}}
oDCSC_DATOCO:HyperLabel := HyperLabel{#SC_DATOCO,"Data:",NULL_STRING,NULL_STRING}

oDCSC_HOROCO := FixedText{self,ResourceID{JFO_PMAN_SC_HOROCO,_GetInst()}}
oDCSC_HOROCO:HyperLabel := HyperLabel{#SC_HOROCO,"Entrada",NULL_STRING,NULL_STRING}

oDCSC_HOROC2 := FixedText{self,ResourceID{JFO_PMAN_SC_HOROC2,_GetInst()}}
oDCSC_HOROC2:HyperLabel := HyperLabel{#SC_HOROC2,"Almoco",NULL_STRING,NULL_STRING}

oDCSC_HOROC4 := FixedText{self,ResourceID{JFO_PMAN_SC_HOROC4,_GetInst()}}
oDCSC_HOROC4:HyperLabel := HyperLabel{#SC_HOROC4,"Saida",NULL_STRING,NULL_STRING}

oDCSC_TIPOCO := FixedText{self,ResourceID{JFO_PMAN_SC_TIPOCO,_GetInst()}}
oDCSC_TIPOCO:HyperLabel := HyperLabel{#SC_TIPOCO,"T",NULL_STRING,NULL_STRING}

oDCSC_MOTOCO := FixedText{self,ResourceID{JFO_PMAN_SC_MOTOCO,_GetInst()}}
oDCSC_MOTOCO:HyperLabel := HyperLabel{#SC_MOTOCO,"Motivo",NULL_STRING,NULL_STRING}

oDCSC_ZERHOR := FixedText{self,ResourceID{JFO_PMAN_SC_ZERHOR,_GetInst()}}
oDCSC_ZERHOR:HyperLabel := HyperLabel{#SC_ZERHOR,"Zerar Horario",NULL_STRING,NULL_STRING}

oDCNUMERO := rightSle{self,ResourceID{JFO_PMAN_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"FO_PMAN_NUMERO"}

oDCHOROCO := rightSle{self,ResourceID{JFO_PMAN_HOROCO,_GetInst()}}
oDCHOROCO:FieldSpec := PADRAO_NUM_05_2{}
oDCHOROCO:HyperLabel := HyperLabel{#HOROCO,"Ent",NULL_STRING,"FO_PMAN_HOROCO"}

oDCHOROC2 := rightSle{self,ResourceID{JFO_PMAN_HOROC2,_GetInst()}}
oDCHOROC2:FieldSpec := PADRAO_NUM_05_2{}
oDCHOROC2:HyperLabel := HyperLabel{#HOROC2,"AlmE",NULL_STRING,"FO_PMAN_HOROC2"}

oDCHOROC3 := rightSle{self,ResourceID{JFO_PMAN_HOROC3,_GetInst()}}
oDCHOROC3:FieldSpec := PADRAO_NUM_05_2{}
oDCHOROC3:HyperLabel := HyperLabel{#HOROC3,"AlmS",NULL_STRING,"FO_PMAN_HOROC3"}

oDCHOROC4 := rightSle{self,ResourceID{JFO_PMAN_HOROC4,_GetInst()}}
oDCHOROC4:FieldSpec := PADRAO_NUM_05_2{}
oDCHOROC4:HyperLabel := HyperLabel{#HOROC4,"Saida",NULL_STRING,"FO_PMAN_HOROC4"}

oDCTIPOCO := SingleLineEdit{self,ResourceID{JFO_PMAN_TIPOCO,_GetInst()}}
oDCTIPOCO:FieldSpec := PADRAO_CHAR_01{}
oDCTIPOCO:HyperLabel := HyperLabel{#TIPOCO,"T",NULL_STRING,"FO_PMAN_TIPOCO"}
oDCTIPOCO:BackGround := aBrushes[1]

oDCMOTOCO := SingleLineEdit{self,ResourceID{JFO_PMAN_MOTOCO,_GetInst()}}
oDCMOTOCO:FieldSpec := PADRAO_CHAR_60{}
oDCMOTOCO:HyperLabel := HyperLabel{#MOTOCO,"Motoco:",NULL_STRING,"FO_PMAN_MOTOCO"}

oDCZERHOR := SingleLineEdit{self,ResourceID{JFO_PMAN_ZERHOR,_GetInst()}}
oDCZERHOR:FieldSpec := PADRAO_CHAR_01{}
oDCZERHOR:HyperLabel := HyperLabel{#ZERHOR,"Zera",NULL_STRING,"FO_PMAN_ZERHOR"}
oDCZERHOR:BackGround := aBrushes[1]

oCCPushButton1 := PushButton{self,ResourceID{JFO_PMAN_PUSHBUTTON1,_GetInst()}}
oCCPushButton1:HyperLabel := HyperLabel{#PushButton1,"(E)entrada (S)aida (1)AlmE (2)AlmS (T)odos",NULL_STRING,NULL_STRING}

oDCDATOCO := DateTimePicker{self,ResourceID{JFO_PMAN_DATOCO,_GetInst()}}
oDCDATOCO:HyperLabel := HyperLabel{#DATOCO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDATOCO:FieldSpec := DATE_FIELD{}

oCCcmdzer := PushButton{self,ResourceID{JFO_PMAN_CMDZER,_GetInst()}}
oCCcmdzer:HyperLabel := HyperLabel{#cmdzer,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCescFUN := PushButton{self,ResourceID{JFO_PMAN_ESCFUN,_GetInst()}}
oCCescFUN:HyperLabel := HyperLabel{#escFUN,"...",NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JFO_PMAN_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCcmdordenar := PushButton{self,ResourceID{JFO_PMAN_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Correçao de Passagens"
self:HyperLabel := HyperLabel{#jfo_pman,"Correçao de Passagens",NULL_STRING,NULL_STRING}
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

oDBDATOCO := DataColumn{DATE_FIELD{}}
oDBDATOCO:Width := 10
oDBDATOCO:HyperLabel := oDCDATOCO:HyperLabel 
oDBDATOCO:Caption := ""
self:Browser:AddColumn(oDBDATOCO)

oDBTIPOCO := DataColumn{PADRAO_CHAR_01{}}
oDBTIPOCO:Width := 4
oDBTIPOCO:HyperLabel := oDCTIPOCO:HyperLabel 
oDBTIPOCO:Caption := "T"
oDBTIPOCO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTIPOCO)

oDBCODOCO := DataColumn{PADRAO_CHAR_02{}}
oDBCODOCO:Width := 6
oDBCODOCO:HyperLabel := HyperLabel{#CODOCO,"Cod",NULL_STRING,"FO_PMAN_CODOCO"} 
oDBCODOCO:Caption := "Cod"
oDBCODOCO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODOCO)

oDBHOROCO := DataColumn{PADRAO_NUM_05_2{}}
oDBHOROCO:Width := 8
oDBHOROCO:HyperLabel := oDCHOROCO:HyperLabel 
oDBHOROCO:Caption := "Ent"
self:Browser:AddColumn(oDBHOROCO)

oDBHOROC2 := DataColumn{PADRAO_NUM_05_2{}}
oDBHOROC2:Width := 8
oDBHOROC2:HyperLabel := oDCHOROC2:HyperLabel 
oDBHOROC2:Caption := "AlmE"
self:Browser:AddColumn(oDBHOROC2)

oDBHOROC3 := DataColumn{PADRAO_NUM_05_2{}}
oDBHOROC3:Width := 8
oDBHOROC3:HyperLabel := oDCHOROC3:HyperLabel 
oDBHOROC3:Caption := "AlmS"
self:Browser:AddColumn(oDBHOROC3)

oDBHOROC4 := DataColumn{PADRAO_NUM_05_2{}}
oDBHOROC4:Width := 8
oDBHOROC4:HyperLabel := oDCHOROC4:HyperLabel 
oDBHOROC4:Caption := "Saida"
self:Browser:AddColumn(oDBHOROC4)

oDBZERHOR := DataColumn{PADRAO_CHAR_01{}}
oDBZERHOR:Width := 6
oDBZERHOR:HyperLabel := oDCZERHOR:HyperLabel 
oDBZERHOR:Caption := "Zera"
oDBZERHOR:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBZERHOR)

oDBBCOOCO := DataColumn{PADRAO_CHAR_01{}}
oDBBCOOCO:Width := 6
oDBBCOOCO:HyperLabel := HyperLabel{#BCOOCO,"Bco",NULL_STRING,"FO_PMAN_BCOOCO"} 
oDBBCOOCO:Caption := "Bco"
oDBBCOOCO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBBCOOCO)

oDBREDOCO := DataColumn{PADRAO_CHAR_01{}}
oDBREDOCO:Width := 6
oDBREDOCO:HyperLabel := HyperLabel{#REDOCO,"Red",NULL_STRING,"FO_PMAN_REDOCO"} 
oDBREDOCO:Caption := "Red"
oDBREDOCO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBREDOCO)

oDBFOLOCO := DataColumn{PADRAO_CHAR_01{}}
oDBFOLOCO:Width := 8
oDBFOLOCO:HyperLabel := HyperLabel{#FOLOCO,"Folga",NULL_STRING,"FO_PMAN_FOLOCO"} 
oDBFOLOCO:Caption := "Folga"
oDBFOLOCO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBFOLOCO)

oDBEXTOCO := DataColumn{PADRAO_CHAR_01{}}
oDBEXTOCO:Width := 8
oDBEXTOCO:HyperLabel := HyperLabel{#EXTOCO,"Extra",NULL_STRING,"FO_PMAN_EXTOCO"} 
oDBEXTOCO:Caption := "Extra"
oDBEXTOCO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBEXTOCO)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MOTOCO() 
return self:FieldGet(#MOTOCO)


assign MOTOCO(uValue) 
self:FieldPut(#MOTOCO, uValue)
return MOTOCO := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access REDOCO() 
return self:FieldGet(#REDOCO)


assign REDOCO(uValue) 
self:FieldPut(#REDOCO, uValue)
return REDOCO := uValue


access TIPOCO() 
return self:FieldGet(#TIPOCO)


assign TIPOCO(uValue) 
self:FieldPut(#TIPOCO, uValue)
return TIPOCO := uValue


access ZERHOR() 
return self:FieldGet(#ZERHOR)


assign ZERHOR(uValue) 
self:FieldPut(#ZERHOR, uValue)
return ZERHOR := uValue


END CLASS
