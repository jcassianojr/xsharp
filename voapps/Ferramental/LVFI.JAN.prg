#region DEFINES
STATIC DEFINE JLVFI_DESCRI := 105 
STATIC DEFINE JLVFI_ITEM := 103 
STATIC DEFINE JLVFI_LVF := 102 
STATIC DEFINE JLVFI_OPER01 := 106 
STATIC DEFINE JLVFI_OPER02 := 109 
STATIC DEFINE JLVFI_SC_DESCRI := 104 
STATIC DEFINE JLVFI_SC_ITEM := 101 
STATIC DEFINE JLVFI_SC_LVF := 100 
STATIC DEFINE JLVFI_THERADIOBUTTON1 := 108 
STATIC DEFINE JLVFI_THERADIOBUTTON2 := 107 
STATIC DEFINE JLVFI_THERADIOBUTTON3 := 110 
STATIC DEFINE JLVFI_THERADIOBUTTON4 := 111 
#endregion

class JLVFI inherit DATAWINDOW 

	PROTECT oDBLVF as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBOPER01 as DataColumn
	PROTECT oDBOPER02 as DataColumn
	protect oDCSC_LVF as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCLVF as SINGLELINEEDIT
	protect oDCITEM as RIGHTSLE
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCOPER01 as RADIOBUTTONGROUP
	protect oCCtheRadioButton2 as RADIOBUTTON
	protect oCCtheRadioButton1 as RADIOBUTTON
	protect oDCOPER02 as RADIOBUTTONGROUP
	protect oCCtheRadioButton3 as RADIOBUTTON
	protect oCCtheRadioButton4 as RADIOBUTTON
// 	instance LVF 
// 	instance ITEM 
// 	instance DESCRI 
// 	instance OPER01 
// 	instance OPER02 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JLVFI",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_LVF := FixedText{self,ResourceID{JLVFI_SC_LVF,_GetInst()}}
oDCSC_LVF:HyperLabel := HyperLabel{#SC_LVF,"Lvf:",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JLVFI_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCLVF := SingleLineEdit{self,ResourceID{JLVFI_LVF,_GetInst()}}
oDCLVF:FieldSpec := PADRAO_NUM_08{}
oDCLVF:HyperLabel := HyperLabel{#LVF,"Lvf:",NULL_STRING,"LVFI_LVF"}
oDCLVF:BackGround := aBrushes[1]
oDCLVF:Font(aFonts[1], FALSE)

oDCITEM := rightSle{self,ResourceID{JLVFI_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_NUM_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"LVFI_ITEM"}

oDCSC_DESCRI := FixedText{self,ResourceID{JLVFI_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCDESCRI := SingleLineEdit{self,ResourceID{JLVFI_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_50{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descrição:",NULL_STRING,"LVFI_DESCRI"}

oCCtheRadioButton2 := RadioButton{self,ResourceID{JLVFI_THERADIOBUTTON2,_GetInst()}}
oCCtheRadioButton2:HyperLabel := HyperLabel{#theRadioButton2,"Não",NULL_STRING,NULL_STRING}

oCCtheRadioButton1 := RadioButton{self,ResourceID{JLVFI_THERADIOBUTTON1,_GetInst()}}
oCCtheRadioButton1:HyperLabel := HyperLabel{#theRadioButton1,"Sim",NULL_STRING,NULL_STRING}

oCCtheRadioButton3 := RadioButton{self,ResourceID{JLVFI_THERADIOBUTTON3,_GetInst()}}
oCCtheRadioButton3:HyperLabel := HyperLabel{#theRadioButton3,"Sim",NULL_STRING,NULL_STRING}

oCCtheRadioButton4 := RadioButton{self,ResourceID{JLVFI_THERADIOBUTTON4,_GetInst()}}
oCCtheRadioButton4:HyperLabel := HyperLabel{#theRadioButton4,"Não",NULL_STRING,NULL_STRING}

oDCOPER01 := RadioButtonGroup{self,ResourceID{JLVFI_OPER01,_GetInst()}}
oDCOPER01:FillUsing({ ;
						{oCCtheRadioButton2,"N"}, ;
						{oCCtheRadioButton1,"S"} ;
						})
oDCOPER01:HyperLabel := HyperLabel{#OPER01,"Normal",NULL_STRING,NULL_STRING}
oDCOPER01:FieldSpec := PADRAO_CHAR_01{}

oDCOPER02 := RadioButtonGroup{self,ResourceID{JLVFI_OPER02,_GetInst()}}
oDCOPER02:FillUsing({ ;
						{oCCtheRadioButton3,"S"}, ;
						{oCCtheRadioButton4,"N"} ;
						})
oDCOPER02:HyperLabel := HyperLabel{#OPER02,"Reparar",NULL_STRING,NULL_STRING}
oDCOPER02:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JLVFI,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBLVF := DataColumn{PADRAO_NUM_08{}}
oDBLVF:Width := 6
oDBLVF:HyperLabel := oDCLVF:HyperLabel 
oDBLVF:Caption := "Lvf:"
oDBLVF:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBLVF)

oDBITEM := DataColumn{PADRAO_NUM_03{}}
oDBITEM:Width := 6
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
self:Browser:AddColumn(oDBITEM)

oDBDESCRI := DataColumn{PADRAO_CHAR_50{}}
oDBDESCRI:Width := 28
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descrição:"
self:Browser:AddColumn(oDBDESCRI)

oDBOPER01 := DataColumn{PADRAO_CHAR_01{}}
oDBOPER01:Width := 16
oDBOPER01:HyperLabel := oDCOPER01:HyperLabel 
oDBOPER01:Caption := "Normal"
self:Browser:AddColumn(oDBOPER01)

oDBOPER02 := DataColumn{PADRAO_CHAR_01{}}
oDBOPER02:Width := 20
oDBOPER02:HyperLabel := oDCOPER02:HyperLabel 
oDBOPER02:Caption := "Reparar"
self:Browser:AddColumn(oDBOPER02)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access LVF() 
return self:FieldGet(#LVF)


assign LVF(uValue) 
self:FieldPut(#LVF, uValue)
return LVF := uValue


access OPER01() 
return self:FieldGet(#OPER01)


assign OPER01(uValue) 
self:FieldPut(#OPER01, uValue)
return OPER01 := uValue


access OPER02() 
return self:FieldGet(#OPER02)


assign OPER02(uValue) 
self:FieldPut(#OPER02, uValue)
return OPER02 := uValue


END CLASS
