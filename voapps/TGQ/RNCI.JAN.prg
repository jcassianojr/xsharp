#region DEFINES
STATIC DEFINE JRNCI_CODERR := 105 
STATIC DEFINE JRNCI_FT22 := 103 
STATIC DEFINE JRNCI_QTNC := 100 
STATIC DEFINE JRNCI_SC_QTNC := 101 
STATIC DEFINE JRNCI_SETCOD := 104 
STATIC DEFINE JRNCI_STCO := 102 
#endregion

class JRNCI inherit DATAWINDOW 

	PROTECT oDBSETCOD as DataColumn
	PROTECT oDBCODERR as DataColumn
	PROTECT oDBQTNC as DataColumn
	protect oDCQTNC as SINGLELINEEDIT
	protect oDCSC_QTNC as FIXEDTEXT
	protect oDCSTCO as FIXEDTEXT
	protect oDCFT22 as FIXEDTEXT
	protect oDCSETCOD as SINGLELINEEDIT
	protect oDCCODERR as SINGLELINEEDIT
// 	instance QTNC 
// 	instance SETCOD 
// 	instance CODERR 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODERR() 
return self:FieldGet(#CODERR)


assign CODERR(uValue) 
self:FieldPut(#CODERR, uValue)
return CODERR := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRNCI",_GetInst()},iCtlID)

oDCQTNC := SingleLineEdit{self,ResourceID{JRNCI_QTNC,_GetInst()}}
oDCQTNC:FieldSpec := PADRAO_NUM_08{}
oDCQTNC:HyperLabel := HyperLabel{#QTNC,"Qtdde Não Conforme",NULL_STRING,"RNC_QTNC"}

oDCSC_QTNC := FixedText{self,ResourceID{JRNCI_SC_QTNC,_GetInst()}}
oDCSC_QTNC:HyperLabel := HyperLabel{#SC_QTNC,"Qtd. não Conf:",NULL_STRING,NULL_STRING}

oDCSTCO := FixedText{self,ResourceID{JRNCI_STCO,_GetInst()}}
oDCSTCO:HyperLabel := HyperLabel{#STCO,"Erro",NULL_STRING,NULL_STRING}

oDCFT22 := FixedText{self,ResourceID{JRNCI_FT22,_GetInst()}}
oDCFT22:HyperLabel := HyperLabel{#FT22,"Setor",NULL_STRING,NULL_STRING}

oDCSETCOD := SingleLineEdit{self,ResourceID{JRNCI_SETCOD,_GetInst()}}
oDCSETCOD:FieldSpec := padrao_chaR_01{}
oDCSETCOD:HyperLabel := HyperLabel{#SETCOD,"Setor",NULL_STRING,"RNC_QTNC"}

oDCCODERR := SingleLineEdit{self,ResourceID{JRNCI_CODERR,_GetInst()}}
oDCCODERR:FieldSpec := padrao_chaR_03{}
oDCCODERR:HyperLabel := HyperLabel{#CODERR,"Erro",NULL_STRING,"RNC_QTNC"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JRNCI,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBSETCOD := DataColumn{padrao_chaR_01{}}
oDBSETCOD:Width := 12
oDBSETCOD:HyperLabel := oDCSETCOD:HyperLabel 
oDBSETCOD:Caption := "Setor"
self:Browser:AddColumn(oDBSETCOD)

oDBCODERR := DataColumn{padrao_chaR_03{}}
oDBCODERR:Width := 17
oDBCODERR:HyperLabel := oDCCODERR:HyperLabel 
oDBCODERR:Caption := "Erro"
self:Browser:AddColumn(oDBCODERR)

oDBQTNC := DataColumn{PADRAO_NUM_08{}}
oDBQTNC:Width := 23
oDBQTNC:HyperLabel := oDCQTNC:HyperLabel 
oDBQTNC:Caption := "Qtdde Não Conforme"
self:Browser:AddColumn(oDBQTNC)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access QTNC() 
return self:FieldGet(#QTNC)


assign QTNC(uValue) 
self:FieldPut(#QTNC, uValue)
return QTNC := uValue


access SETCOD() 
return self:FieldGet(#SETCOD)


assign SETCOD(uValue) 
self:FieldPut(#SETCOD, uValue)
return SETCOD := uValue


END CLASS
