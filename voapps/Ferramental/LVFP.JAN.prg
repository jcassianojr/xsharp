#region DEFINES
STATIC DEFINE JLVFP_BUSCA := 104 
STATIC DEFINE JLVFP_DESCRI := 108 
STATIC DEFINE JLVFP_GRUPO := 102 
STATIC DEFINE JLVFP_ITEM := 107 
STATIC DEFINE JLVFP_ORDEM := 103 
STATIC DEFINE JLVFP_RADIOBUTTON6 := 101 
STATIC DEFINE JLVFP_RADIOBUTTON7 := 100 
STATIC DEFINE JLVFP_SC_DESCRI := 105 
STATIC DEFINE JLVFP_SC_ITEM := 106 
#endregion

PARTIAL class JLVFP inherit MYDataWindow 

	PROTECT oDBITEM as DataColumn
	PROTECT oDBGRUPO as DataColumn
	PROTECT oDBDESCRI as DataColumn
	protect oCCRadioButton7 as RADIOBUTTON
	protect oCCRadioButton6 as RADIOBUTTON
	protect oDCGRUPO as RADIOBUTTONGROUP
	protect oCCordem as PUSHBUTTON
	protect oCCbusca as PUSHBUTTON
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCITEM as RIGHTSLE
	protect oDCDESCRI as SINGLELINEEDIT
// 	instance GRUPO 
// 	instance ITEM 
// 	instance DESCRI 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


access GRUPO() 
return self:FieldGet(#GRUPO)


assign GRUPO(uValue) 
self:FieldPut(#GRUPO, uValue)
return GRUPO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JLVFP",_GetInst()},iCtlID)

oCCRadioButton7 := RadioButton{self,ResourceID{JLVFP_RADIOBUTTON7,_GetInst()}}
oCCRadioButton7:HyperLabel := HyperLabel{#RadioButton7,"Dispositivo",NULL_STRING,NULL_STRING}

oCCRadioButton6 := RadioButton{self,ResourceID{JLVFP_RADIOBUTTON6,_GetInst()}}
oCCRadioButton6:HyperLabel := HyperLabel{#RadioButton6,"Ferramenta",NULL_STRING,NULL_STRING}

oCCordem := PushButton{self,ResourceID{JLVFP_ORDEM,_GetInst()}}
oCCordem:Image := ico_az{}
oCCordem:HyperLabel := HyperLabel{#ordem,NULL_STRING,NULL_STRING,NULL_STRING}
oCCordem:TooltipText := "Ordenar Por Numero"

oCCbusca := PushButton{self,ResourceID{JLVFP_BUSCA,_GetInst()}}
oCCbusca:Image := ICO_FIND{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{self,ResourceID{JLVFP_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JLVFP_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCITEM := rightSle{self,ResourceID{JLVFP_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_NUM_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"LVFP_ITEM"}

oDCDESCRI := SingleLineEdit{self,ResourceID{JLVFP_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_60{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descricao",NULL_STRING,"LVFP_DESCRI"}

oDCGRUPO := RadioButtonGroup{self,ResourceID{JLVFP_GRUPO,_GetInst()}}
oDCGRUPO:FillUsing({ ;
						{oCCRadioButton7,"D"}, ;
						{oCCRadioButton6,"F"} ;
						})
oDCGRUPO:HyperLabel := HyperLabel{#GRUPO,"Tipo",NULL_STRING,NULL_STRING}
oDCGRUPO:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "Lista de Verificação"
self:HyperLabel := HyperLabel{#JLVFP,"Lista de Verificação",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBITEM := DataColumn{PADRAO_NUM_03{}}
oDBITEM:Width := 15
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
self:Browser:AddColumn(oDBITEM)

oDBGRUPO := DataColumn{PADRAO_CHAR_01{}}
oDBGRUPO:Width := 7
oDBGRUPO:HyperLabel := oDCGRUPO:HyperLabel 
oDBGRUPO:Caption := "Tipo"
self:Browser:AddColumn(oDBGRUPO)

oDBDESCRI := DataColumn{PADRAO_CHAR_60{}}
oDBDESCRI:Width := 50
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descricao"
self:Browser:AddColumn(oDBDESCRI)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


END CLASS
