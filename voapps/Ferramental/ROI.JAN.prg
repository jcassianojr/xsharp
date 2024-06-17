#region DEFINES
STATIC DEFINE JROI_CODIGO := 102 
STATIC DEFINE JROI_QTDE := 100 
STATIC DEFINE JROI_RO := 104 
STATIC DEFINE JROI_SC_CODIGO := 103 
STATIC DEFINE JROI_SC_QTDE := 101 
STATIC DEFINE JROI_SC_RO := 105 
#endregion

class JROI inherit DATAWINDOW 

	PROTECT oDBRO as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBQTDE as DataColumn
	protect oDCQTDE as RIGHTSLE
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCRO as SINGLELINEEDIT
	protect oDCSC_RO as FIXEDTEXT
// 	instance QTDE 
// 	instance CODIGO 
// 	instance RO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JROI",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCQTDE := rightSle{self,ResourceID{JROI_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := PADRAO_NUM_08{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"Roi_QTDE"}

oDCSC_QTDE := FixedText{self,ResourceID{JROI_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JROI_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_20{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"Roi_CODIGO"}

oDCSC_CODIGO := FixedText{self,ResourceID{JROI_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCRO := SingleLineEdit{self,ResourceID{JROI_RO,_GetInst()}}
oDCRO:FieldSpec := PADRAO_NUM_08{}
oDCRO:HyperLabel := HyperLabel{#RO,"Ro:",NULL_STRING,"Roi_RO"}
oDCRO:BackGround := aBrushes[1]
oDCRO:Font(aFonts[1], FALSE)

oDCSC_RO := FixedText{self,ResourceID{JROI_SC_RO,_GetInst()}}
oDCSC_RO:HyperLabel := HyperLabel{#SC_RO,"Ro:",NULL_STRING,NULL_STRING}

self:Caption := "Itens RO"
self:HyperLabel := HyperLabel{#JROI,"Itens RO",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRO := DataColumn{PADRAO_NUM_08{}}
oDBRO:Width := 8
oDBRO:HyperLabel := oDCRO:HyperLabel 
oDBRO:Caption := "Ro:"
oDBRO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRO)

oDBCODIGO := DataColumn{PADRAO_CHAR_20{}}
oDBCODIGO:Width := 18
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBQTDE := DataColumn{PADRAO_NUM_08{}}
oDBQTDE:Width := 18
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
self:Browser:AddColumn(oDBQTDE)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


access RO() 
return self:FieldGet(#RO)


assign RO(uValue) 
self:FieldPut(#RO, uValue)
return RO := uValue


END CLASS
