#region DEFINES
STATIC DEFINE JRLI_CODME01 := 103 
STATIC DEFINE JRLI_LUB01 := 104 
STATIC DEFINE JRLI_LUB02 := 108 
STATIC DEFINE JRLI_LUB03 := 112 
STATIC DEFINE JRLI_LUB04 := 116 
STATIC DEFINE JRLI_LUB05 := 120 
STATIC DEFINE JRLI_RADIOBUTTON1 := 105 
STATIC DEFINE JRLI_RADIOBUTTON11 := 118 
STATIC DEFINE JRLI_RADIOBUTTON12 := 121 
STATIC DEFINE JRLI_RADIOBUTTON13 := 119 
STATIC DEFINE JRLI_RADIOBUTTON14 := 122 
STATIC DEFINE JRLI_RADIOBUTTON15 := 123 
STATIC DEFINE JRLI_RADIOBUTTON16 := 109 
STATIC DEFINE JRLI_RADIOBUTTON17 := 110 
STATIC DEFINE JRLI_RADIOBUTTON18 := 111 
STATIC DEFINE JRLI_RADIOBUTTON2 := 106 
STATIC DEFINE JRLI_RADIOBUTTON3 := 107 
STATIC DEFINE JRLI_RADIOBUTTON6 := 113 
STATIC DEFINE JRLI_RADIOBUTTON7 := 114 
STATIC DEFINE JRLI_RADIOBUTTON8 := 115 
STATIC DEFINE JRLI_RADIOBUTTON9 := 117 
STATIC DEFINE JRLI_RL := 102 
STATIC DEFINE JRLI_SC_CODME01 := 101 
STATIC DEFINE JRLI_SC_RL := 100 
#endregion

class JRLI inherit DATAWINDOW 

	PROTECT oDBRL as DataColumn
	PROTECT oDBCODME01 as DataColumn
	PROTECT oDBLUB01 as DataColumn
	PROTECT oDBLUB02 as DataColumn
	PROTECT oDBLUB03 as DataColumn
	PROTECT oDBLUB04 as DataColumn
	PROTECT oDBLUB05 as DataColumn
	protect oDCSC_RL as FIXEDTEXT
	protect oDCSC_CODME01 as FIXEDTEXT
	protect oDCRL as SINGLELINEEDIT
	protect oDCCODME01 as SINGLELINEEDIT
	protect oDCLUB01 as RADIOBUTTONGROUP
	protect oCCRadioButton1 as RADIOBUTTON
	protect oCCRadioButton2 as RADIOBUTTON
	protect oCCRadioButton3 as RADIOBUTTON
	protect oDCLUB02 as RADIOBUTTONGROUP
	protect oCCRadioButton16 as RADIOBUTTON
	protect oCCRadioButton17 as RADIOBUTTON
	protect oCCRadioButton18 as RADIOBUTTON
	protect oDCLUB03 as RADIOBUTTONGROUP
	protect oCCRadioButton6 as RADIOBUTTON
	protect oCCRadioButton7 as RADIOBUTTON
	protect oCCRadioButton8 as RADIOBUTTON
	protect oDCLUB04 as RADIOBUTTONGROUP
	protect oCCRadioButton9 as RADIOBUTTON
	protect oCCRadioButton11 as RADIOBUTTON
	protect oCCRadioButton13 as RADIOBUTTON
	protect oDCLUB05 as RADIOBUTTONGROUP
	protect oCCRadioButton12 as RADIOBUTTON
	protect oCCRadioButton14 as RADIOBUTTON
	protect oCCRadioButton15 as RADIOBUTTON
// 	instance RL 
// 	instance CODME01 
// 	instance LUB01 
// 	instance LUB02 
// 	instance LUB03 
// 	instance LUB04 
// 	instance LUB05 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODME01() 
return self:FieldGet(#CODME01)


assign CODME01(uValue) 
self:FieldPut(#CODME01, uValue)
return CODME01 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRLI",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_RL := FixedText{self,ResourceID{JRLI_SC_RL,_GetInst()}}
oDCSC_RL:HyperLabel := HyperLabel{#SC_RL,"Rl:",NULL_STRING,NULL_STRING}

oDCSC_CODME01 := FixedText{self,ResourceID{JRLI_SC_CODME01,_GetInst()}}
oDCSC_CODME01:HyperLabel := HyperLabel{#SC_CODME01,"Maquina",NULL_STRING,NULL_STRING}

oDCRL := SingleLineEdit{self,ResourceID{JRLI_RL,_GetInst()}}
oDCRL:FieldSpec := PADRAO_NUM_08{}
oDCRL:HyperLabel := HyperLabel{#RL,"Rl:",NULL_STRING,"Rli_RL"}
oDCRL:BackGround := aBrushes[1]
oDCRL:Font(aFonts[1], FALSE)

oDCCODME01 := SingleLineEdit{self,ResourceID{JRLI_CODME01,_GetInst()}}
oDCCODME01:FieldSpec := PADRAO_CHAR_05{}
oDCCODME01:HyperLabel := HyperLabel{#CODME01,"Maq",NULL_STRING,"Rli_CODME01"}
oDCCODME01:BackGround := aBrushes[1]
oDCCODME01:Font(aFonts[1], FALSE)

oCCRadioButton1 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON1,_GetInst()}}
oCCRadioButton1:HyperLabel := HyperLabel{#RadioButton1,"Satisfatorio",NULL_STRING,NULL_STRING}

oCCRadioButton2 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON2,_GetInst()}}
oCCRadioButton2:HyperLabel := HyperLabel{#RadioButton2,"Não Satisf.",NULL_STRING,NULL_STRING}

oCCRadioButton3 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON3,_GetInst()}}
oCCRadioButton3:HyperLabel := HyperLabel{#RadioButton3,"Não Aplicado",NULL_STRING,NULL_STRING}

oCCRadioButton16 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON16,_GetInst()}}
oCCRadioButton16:HyperLabel := HyperLabel{#RadioButton16,"Satisfatorio",NULL_STRING,NULL_STRING}

oCCRadioButton17 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON17,_GetInst()}}
oCCRadioButton17:HyperLabel := HyperLabel{#RadioButton17,"Não Satisf",NULL_STRING,NULL_STRING}

oCCRadioButton18 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON18,_GetInst()}}
oCCRadioButton18:HyperLabel := HyperLabel{#RadioButton18,"Não Aplicado",NULL_STRING,NULL_STRING}

oCCRadioButton6 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON6,_GetInst()}}
oCCRadioButton6:HyperLabel := HyperLabel{#RadioButton6,"Satisfatorio",NULL_STRING,NULL_STRING}

oCCRadioButton7 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON7,_GetInst()}}
oCCRadioButton7:HyperLabel := HyperLabel{#RadioButton7,"Não Satisf.",NULL_STRING,NULL_STRING}

oCCRadioButton8 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON8,_GetInst()}}
oCCRadioButton8:HyperLabel := HyperLabel{#RadioButton8,"Não Aplicado",NULL_STRING,NULL_STRING}

oCCRadioButton9 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON9,_GetInst()}}
oCCRadioButton9:HyperLabel := HyperLabel{#RadioButton9,"Satisfatorio",NULL_STRING,NULL_STRING}

oCCRadioButton11 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON11,_GetInst()}}
oCCRadioButton11:HyperLabel := HyperLabel{#RadioButton11,"Não Satisf.",NULL_STRING,NULL_STRING}

oCCRadioButton13 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON13,_GetInst()}}
oCCRadioButton13:HyperLabel := HyperLabel{#RadioButton13,"Não Aplicado",NULL_STRING,NULL_STRING}

oCCRadioButton12 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON12,_GetInst()}}
oCCRadioButton12:HyperLabel := HyperLabel{#RadioButton12,"Satisfatorio",NULL_STRING,NULL_STRING}

oCCRadioButton14 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON14,_GetInst()}}
oCCRadioButton14:HyperLabel := HyperLabel{#RadioButton14,"Não Satisf.",NULL_STRING,NULL_STRING}

oCCRadioButton15 := RadioButton{self,ResourceID{JRLI_RADIOBUTTON15,_GetInst()}}
oCCRadioButton15:HyperLabel := HyperLabel{#RadioButton15,"Não Aplicado",NULL_STRING,NULL_STRING}

oDCLUB01 := RadioButtonGroup{self,ResourceID{JRLI_LUB01,_GetInst()}}
oDCLUB01:FillUsing({ ;
						{oCCRadioButton1,"S"}, ;
						{oCCRadioButton2,"N"}, ;
						{oCCRadioButton3,"A"} ;
						})
oDCLUB01:HyperLabel := HyperLabel{#LUB01,"Fuso",NULL_STRING,NULL_STRING}
oDCLUB01:FieldSpec := PADRAO_CHAR_01{}

oDCLUB02 := RadioButtonGroup{self,ResourceID{JRLI_LUB02,_GetInst()}}
oDCLUB02:FillUsing({ ;
						{oCCRadioButton16,"S"}, ;
						{oCCRadioButton17,"N"}, ;
						{oCCRadioButton18,"A"} ;
						})
oDCLUB02:HyperLabel := HyperLabel{#LUB02,"Graxa",NULL_STRING,NULL_STRING}
oDCLUB02:FieldSpec := PADRAO_CHAR_01{}

oDCLUB03 := RadioButtonGroup{self,ResourceID{JRLI_LUB03,_GetInst()}}
oDCLUB03:FillUsing({ ;
						{oCCRadioButton6,"S"}, ;
						{oCCRadioButton7,"N"}, ;
						{oCCRadioButton8,"A"} ;
						})
oDCLUB03:HyperLabel := HyperLabel{#LUB03,"Pneumatica",NULL_STRING,NULL_STRING}
oDCLUB03:FieldSpec := PADRAO_CHAR_01{}

oDCLUB04 := RadioButtonGroup{self,ResourceID{JRLI_LUB04,_GetInst()}}
oDCLUB04:FillUsing({ ;
						{oCCRadioButton9,"S"}, ;
						{oCCRadioButton11,"N"}, ;
						{oCCRadioButton13,"A"} ;
						})
oDCLUB04:HyperLabel := HyperLabel{#LUB04,"Hidraulica",NULL_STRING,NULL_STRING}
oDCLUB04:FieldSpec := PADRAO_CHAR_01{}

oDCLUB05 := RadioButtonGroup{self,ResourceID{JRLI_LUB05,_GetInst()}}
oDCLUB05:FillUsing({ ;
						{oCCRadioButton12,"S"}, ;
						{oCCRadioButton14,"N"}, ;
						{oCCRadioButton15,"A"} ;
						})
oDCLUB05:HyperLabel := HyperLabel{#LUB05,"Caixa de Engrenagem",NULL_STRING,NULL_STRING}
oDCLUB05:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JRLI,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRL := DataColumn{PADRAO_NUM_08{}}
oDBRL:Width := 4
oDBRL:HyperLabel := oDCRL:HyperLabel 
oDBRL:Caption := "Rl:"
oDBRL:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRL)

oDBCODME01 := DataColumn{PADRAO_CHAR_05{}}
oDBCODME01:Width := 9
oDBCODME01:HyperLabel := oDCCODME01:HyperLabel 
oDBCODME01:Caption := "Maq"
oDBCODME01:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODME01)

oDBLUB01 := DataColumn{PADRAO_CHAR_01{}}
oDBLUB01:Width := 8
oDBLUB01:HyperLabel := oDCLUB01:HyperLabel 
oDBLUB01:Caption := "Fuso"
self:Browser:AddColumn(oDBLUB01)

oDBLUB02 := DataColumn{PADRAO_CHAR_01{}}
oDBLUB02:Width := 8
oDBLUB02:HyperLabel := oDCLUB02:HyperLabel 
oDBLUB02:Caption := "Graxa"
self:Browser:AddColumn(oDBLUB02)

oDBLUB03 := DataColumn{PADRAO_CHAR_01{}}
oDBLUB03:Width := 9
oDBLUB03:HyperLabel := oDCLUB03:HyperLabel 
oDBLUB03:Caption := "Pneumatica"
self:Browser:AddColumn(oDBLUB03)

oDBLUB04 := DataColumn{PADRAO_CHAR_01{}}
oDBLUB04:Width := 9
oDBLUB04:HyperLabel := oDCLUB04:HyperLabel 
oDBLUB04:Caption := "Hidraulica"
self:Browser:AddColumn(oDBLUB04)

oDBLUB05 := DataColumn{PADRAO_CHAR_01{}}
oDBLUB05:Width := 10
oDBLUB05:HyperLabel := oDCLUB05:HyperLabel 
oDBLUB05:Caption := "Caixa de Engrenagem"
self:Browser:AddColumn(oDBLUB05)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LUB01() 
return self:FieldGet(#LUB01)


assign LUB01(uValue) 
self:FieldPut(#LUB01, uValue)
return LUB01 := uValue


access LUB02() 
return self:FieldGet(#LUB02)


assign LUB02(uValue) 
self:FieldPut(#LUB02, uValue)
return LUB02 := uValue


access LUB03() 
return self:FieldGet(#LUB03)


assign LUB03(uValue) 
self:FieldPut(#LUB03, uValue)
return LUB03 := uValue


access LUB04() 
return self:FieldGet(#LUB04)


assign LUB04(uValue) 
self:FieldPut(#LUB04, uValue)
return LUB04 := uValue


access LUB05() 
return self:FieldGet(#LUB05)


assign LUB05(uValue) 
self:FieldPut(#LUB05, uValue)
return LUB05 := uValue


access RL() 
return self:FieldGet(#RL)


assign RL(uValue) 
self:FieldPut(#RL, uValue)
return RL := uValue


END CLASS
