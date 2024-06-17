#region DEFINES
STATIC DEFINE JCDI_DATAREV := 102 
STATIC DEFINE JCDI_DESENHO := 100 
STATIC DEFINE JCDI_REV := 101 
STATIC DEFINE JCDI_SC_DESENHO := 103 
STATIC DEFINE JCDI_SC_REV := 104 
STATIC DEFINE JCDI_SC_REV1 := 105 
#endregion

class JCDI inherit DATAWINDOW 

	PROTECT oDBDESENHO as DataColumn
	PROTECT oDBREV as DataColumn
	PROTECT oDBDATAREV as DataColumn
	protect oDCDESENHO as SINGLELINEEDIT
	protect oDCREV as SINGLELINEEDIT
	protect oDCDATAREV as DATESLE
	protect oDCSC_DESENHO as FIXEDTEXT
	protect oDCSC_REV as FIXEDTEXT
	protect oDCSC_REV1 as FIXEDTEXT
// 	instance DESENHO 
// 	instance REV 
// 	instance DATAREV 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DATAREV() 
return self:FieldGet(#DATAREV)


assign DATAREV(uValue) 
self:FieldPut(#DATAREV, uValue)
return DATAREV := uValue


access DESENHO() 
return self:FieldGet(#DESENHO)


assign DESENHO(uValue) 
self:FieldPut(#DESENHO, uValue)
return DESENHO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCDI",_GetInst()},iCtlID)

oDCDESENHO := SingleLineEdit{self,ResourceID{JCDI_DESENHO,_GetInst()}}
oDCDESENHO:FieldSpec := padrao_char_24{}
oDCDESENHO:HyperLabel := HyperLabel{#DESENHO,"Desenho:",NULL_STRING,"CDI_DESENHO"}

oDCREV := SingleLineEdit{self,ResourceID{JCDI_REV,_GetInst()}}
oDCREV:FieldSpec := padrao_char_20{}
oDCREV:HyperLabel := HyperLabel{#REV,"Rev:",NULL_STRING,"CDI_REV"}

oDCDATAREV := DateSle{self,ResourceID{JCDI_DATAREV,_GetInst()}}
oDCDATAREV:FieldSpec := DATE_FIELD{}
oDCDATAREV:HyperLabel := HyperLabel{#DATAREV,"Data",NULL_STRING,"CDI_REV"}

oDCSC_DESENHO := FixedText{self,ResourceID{JCDI_SC_DESENHO,_GetInst()}}
oDCSC_DESENHO:HyperLabel := HyperLabel{#SC_DESENHO,"Desenho:",NULL_STRING,NULL_STRING}

oDCSC_REV := FixedText{self,ResourceID{JCDI_SC_REV,_GetInst()}}
oDCSC_REV:HyperLabel := HyperLabel{#SC_REV,"Rev:",NULL_STRING,NULL_STRING}

oDCSC_REV1 := FixedText{self,ResourceID{JCDI_SC_REV1,_GetInst()}}
oDCSC_REV1:HyperLabel := HyperLabel{#SC_REV1,"Data Rev:",NULL_STRING,NULL_STRING}

self:Caption := "Itens CD"
self:HyperLabel := HyperLabel{#JCDI,"Itens CD",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDESENHO := DataColumn{padrao_char_24{}}
oDBDESENHO:Width := 27
oDBDESENHO:HyperLabel := oDCDESENHO:HyperLabel 
oDBDESENHO:Caption := "Desenho:"
self:Browser:AddColumn(oDBDESENHO)

oDBREV := DataColumn{padrao_char_20{}}
oDBREV:Width := 19
oDBREV:HyperLabel := oDCREV:HyperLabel 
oDBREV:Caption := "Rev:"
self:Browser:AddColumn(oDBREV)

oDBDATAREV := DataColumn{DATE_FIELD{}}
oDBDATAREV:Width := 13
oDBDATAREV:HyperLabel := oDCDATAREV:HyperLabel 
oDBDATAREV:Caption := "Data"
self:Browser:AddColumn(oDBDATAREV)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		   FabCenterWindow( SELF )
	RETURN NIL


access REV() 
return self:FieldGet(#REV)


assign REV(uValue) 
self:FieldPut(#REV, uValue)
return REV := uValue


END CLASS
