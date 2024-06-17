#region DEFINES
STATIC DEFINE JMW02_COMPED := 104 
STATIC DEFINE JMW02_ITECOD := 106 
STATIC DEFINE JMW02_ITEM := 105 
STATIC DEFINE JMW02_ITENOM := 107 
STATIC DEFINE JMW02_ITETIP := 108 
STATIC DEFINE JMW02_SC_COMPED := 100 
STATIC DEFINE JMW02_SC_ITECOD := 102 
STATIC DEFINE JMW02_SC_ITEM := 101 
STATIC DEFINE JMW02_SC_ITENOM := 103 
#endregion

class jmw02 inherit DATAWINDOW 

	PROTECT oDBCOMPED as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBITETIP as DataColumn
	PROTECT oDBITECOD as DataColumn
	PROTECT oDBITENOM as DataColumn
	protect oDCSC_COMPED as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCSC_ITECOD as FIXEDTEXT
	protect oDCSC_ITENOM as FIXEDTEXT
	protect oDCCOMPED as SINGLELINEEDIT
	protect oDCITEM as SINGLELINEEDIT
	protect oDCITECOD as SINGLELINEEDIT
	protect oDCITENOM as SINGLELINEEDIT
	protect oDCITETIP as SINGLELINEEDIT
// 	instance COMPED 
// 	instance ITEM 
// 	instance ITECOD 
// 	instance ITENOM 
// 	instance ITETIP 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access COMPED() 
return self:FieldGet(#COMPED)


assign COMPED(uValue) 
self:FieldPut(#COMPED, uValue)
return COMPED := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jmw02",_GetInst()},iCtlID)

oDCSC_COMPED := FixedText{self,ResourceID{JMW02_SC_COMPED,_GetInst()}}
oDCSC_COMPED:HyperLabel := HyperLabel{#SC_COMPED,"Comped:",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JMW02_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCSC_ITECOD := FixedText{self,ResourceID{JMW02_SC_ITECOD,_GetInst()}}
oDCSC_ITECOD:HyperLabel := HyperLabel{#SC_ITECOD,"Itecod:",NULL_STRING,NULL_STRING}

oDCSC_ITENOM := FixedText{self,ResourceID{JMW02_SC_ITENOM,_GetInst()}}
oDCSC_ITENOM:HyperLabel := HyperLabel{#SC_ITENOM,"Itenom:",NULL_STRING,NULL_STRING}

oDCCOMPED := SingleLineEdit{self,ResourceID{JMW02_COMPED,_GetInst()}}
oDCCOMPED:FieldSpec := PADRAO_NUM_08{}
oDCCOMPED:HyperLabel := HyperLabel{#COMPED,"Pedido",NULL_STRING,"MW02_COMPED"}

oDCITEM := SingleLineEdit{self,ResourceID{JMW02_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_NUM_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"MW02_ITEM"}

oDCITECOD := SingleLineEdit{self,ResourceID{JMW02_ITECOD,_GetInst()}}
oDCITECOD:FieldSpec := PADRAO_CHAR_24{}
oDCITECOD:HyperLabel := HyperLabel{#ITECOD,"Codigo",NULL_STRING,"MW02_ITECOD"}

oDCITENOM := SingleLineEdit{self,ResourceID{JMW02_ITENOM,_GetInst()}}
oDCITENOM:FieldSpec := PADRAO_CHAR_200{}
oDCITENOM:HyperLabel := HyperLabel{#ITENOM,"Nome",NULL_STRING,"MW02_ITENOM"}

oDCITETIP := SingleLineEdit{self,ResourceID{JMW02_ITETIP,_GetInst()}}
oDCITETIP:FieldSpec := PADRAO_CHAR_01{}
oDCITETIP:HyperLabel := HyperLabel{#ITETIP,"T",NULL_STRING,"MW02_ITEM"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jmw02,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCOMPED := DataColumn{PADRAO_NUM_08{}}
oDBCOMPED:Width := 9
oDBCOMPED:HyperLabel := oDCCOMPED:HyperLabel 
oDBCOMPED:Caption := "Pedido"
self:Browser:AddColumn(oDBCOMPED)

oDBITEM := DataColumn{PADRAO_NUM_03{}}
oDBITEM:Width := 6
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
self:Browser:AddColumn(oDBITEM)

oDBITETIP := DataColumn{PADRAO_CHAR_01{}}
oDBITETIP:Width := 4
oDBITETIP:HyperLabel := oDCITETIP:HyperLabel 
oDBITETIP:Caption := "T"
self:Browser:AddColumn(oDBITETIP)

oDBITECOD := DataColumn{PADRAO_CHAR_24{}}
oDBITECOD:Width := 19
oDBITECOD:HyperLabel := oDCITECOD:HyperLabel 
oDBITECOD:Caption := "Codigo"
self:Browser:AddColumn(oDBITECOD)

oDBITENOM := DataColumn{PADRAO_CHAR_200{}}
oDBITENOM:Width := 38
oDBITENOM:HyperLabel := oDCITENOM:HyperLabel 
oDBITENOM:Caption := "Nome"
self:Browser:AddColumn(oDBITENOM)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITECOD() 
return self:FieldGet(#ITECOD)


assign ITECOD(uValue) 
self:FieldPut(#ITECOD, uValue)
return ITECOD := uValue


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access ITENOM() 
return self:FieldGet(#ITENOM)


assign ITENOM(uValue) 
self:FieldPut(#ITENOM, uValue)
return ITENOM := uValue


access ITETIP() 
return self:FieldGet(#ITETIP)


assign ITETIP(uValue) 
self:FieldPut(#ITETIP, uValue)
return ITETIP := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


END CLASS
