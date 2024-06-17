#region DEFINES
STATIC DEFINE JLVMI_DESCRI := 108 
STATIC DEFINE JLVMI_ITEM := 107 
STATIC DEFINE JLVMI_LVM := 106 
STATIC DEFINE JLVMI_OPER01 := 109 
STATIC DEFINE JLVMI_OPER02 := 110 
STATIC DEFINE JLVMI_OPER03 := 111 
STATIC DEFINE JLVMI_SC_DESCRI := 102 
STATIC DEFINE JLVMI_SC_ITEM := 101 
STATIC DEFINE JLVMI_SC_LVM := 100 
STATIC DEFINE JLVMI_SC_OPER01 := 103 
STATIC DEFINE JLVMI_SC_OPER02 := 104 
STATIC DEFINE JLVMI_SC_OPER03 := 105 
#endregion

class JLVMI inherit DATAWINDOW 

	PROTECT oDBLVM as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBOPER01 as DataColumn
	PROTECT oDBOPER02 as DataColumn
	protect oDCSC_LVM as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCSC_OPER01 as FIXEDTEXT
	protect oDCSC_OPER02 as FIXEDTEXT
	protect oDCSC_OPER03 as FIXEDTEXT
	protect oDCLVM as RIGHTSLE
	protect oDCITEM as SEARCHSLE
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCOPER01 as SINGLELINEEDIT
	protect oDCOPER02 as SINGLELINEEDIT
	protect oDCOPER03 as SINGLELINEEDIT
// 	instance LVM 
// 	instance ITEM 
// 	instance DESCRI 
// 	instance OPER01 
// 	instance OPER02 
// 	instance OPER03 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JLVMI",_GetInst()},iCtlID)

oDCSC_LVM := FixedText{self,ResourceID{JLVMI_SC_LVM,_GetInst()}}
oDCSC_LVM:HyperLabel := HyperLabel{#SC_LVM,"Lvm:",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JLVMI_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{self,ResourceID{JLVMI_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCSC_OPER01 := FixedText{self,ResourceID{JLVMI_SC_OPER01,_GetInst()}}
oDCSC_OPER01:HyperLabel := HyperLabel{#SC_OPER01,"Reparar:",NULL_STRING,NULL_STRING}

oDCSC_OPER02 := FixedText{self,ResourceID{JLVMI_SC_OPER02,_GetInst()}}
oDCSC_OPER02:HyperLabel := HyperLabel{#SC_OPER02,"Normal:",NULL_STRING,NULL_STRING}

oDCSC_OPER03 := FixedText{self,ResourceID{JLVMI_SC_OPER03,_GetInst()}}
oDCSC_OPER03:HyperLabel := HyperLabel{#SC_OPER03,"Aplicavel",NULL_STRING,NULL_STRING}

oDCLVM := rightSle{self,ResourceID{JLVMI_LVM,_GetInst()}}
oDCLVM:FieldSpec := PADRAO_NUM_08{}
oDCLVM:HyperLabel := HyperLabel{#LVM,"Lvm:",NULL_STRING,"Lvmi_LVM"}

oDCITEM := SearchSLE{self,ResourceID{JLVMI_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_NUM_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"Lvmi_ITEM"}

oDCDESCRI := SingleLineEdit{self,ResourceID{JLVMI_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_150{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descrição:",NULL_STRING,"Lvmi_DESCRI"}

oDCOPER01 := SingleLineEdit{self,ResourceID{JLVMI_OPER01,_GetInst()}}
oDCOPER01:FieldSpec := PADRAO_CHAR_01{}
oDCOPER01:HyperLabel := HyperLabel{#OPER01,"Normal",NULL_STRING,"Lvmi_OPER01"}

oDCOPER02 := SingleLineEdit{self,ResourceID{JLVMI_OPER02,_GetInst()}}
oDCOPER02:FieldSpec := PADRAO_CHAR_01{}
oDCOPER02:HyperLabel := HyperLabel{#OPER02,"Reparar",NULL_STRING,"Lvmi_OPER02"}

oDCOPER03 := SingleLineEdit{self,ResourceID{JLVMI_OPER03,_GetInst()}}
oDCOPER03:FieldSpec := PADRAO_CHAR_01{}
oDCOPER03:HyperLabel := HyperLabel{#OPER03,"Aplicavel",NULL_STRING,"Lvmi_OPER03"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JLVMI,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBLVM := DataColumn{PADRAO_NUM_08{}}
oDBLVM:Width := 7
oDBLVM:HyperLabel := oDCLVM:HyperLabel 
oDBLVM:Caption := "Lvm:"
self:Browser:AddColumn(oDBLVM)

oDBITEM := DataColumn{PADRAO_NUM_03{}}
oDBITEM:Width := 6
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
self:Browser:AddColumn(oDBITEM)

oDBDESCRI := DataColumn{PADRAO_CHAR_150{}}
oDBDESCRI:Width := 34
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descrição:"
self:Browser:AddColumn(oDBDESCRI)

oDBOPER01 := DataColumn{PADRAO_CHAR_01{}}
oDBOPER01:Width := 8
oDBOPER01:HyperLabel := oDCOPER01:HyperLabel 
oDBOPER01:Caption := "Normal"
self:Browser:AddColumn(oDBOPER01)

oDBOPER02 := DataColumn{PADRAO_CHAR_01{}}
oDBOPER02:Width := 9
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


access LVM() 
return self:FieldGet(#LVM)


assign LVM(uValue) 
self:FieldPut(#LVM, uValue)
return LVM := uValue


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


access OPER03() 
return self:FieldGet(#OPER03)


assign OPER03(uValue) 
self:FieldPut(#OPER03, uValue)
return OPER03 := uValue


END CLASS
