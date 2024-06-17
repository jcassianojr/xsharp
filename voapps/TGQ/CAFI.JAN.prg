#region DEFINES
STATIC DEFINE JCAFI_CMDEFICAZ := 112 
STATIC DEFINE JCAFI_DPLANO := 109 
STATIC DEFINE JCAFI_EFETUADO := 106 
STATIC DEFINE JCAFI_EFICAZ := 110 
STATIC DEFINE JCAFI_NUMERO := 104 
STATIC DEFINE JCAFI_OBS := 107 
STATIC DEFINE JCAFI_PREVISTO := 105 
STATIC DEFINE JCAFI_SC_EFETUADO := 102 
STATIC DEFINE JCAFI_SC_EFETUADO1 := 111 
STATIC DEFINE JCAFI_SC_NUMERO := 100 
STATIC DEFINE JCAFI_SC_OBS := 103 
STATIC DEFINE JCAFI_SC_PREVISTO := 101 
STATIC DEFINE JCAFI_XDPLANO := 108 
#endregion

PARTIAL class JCAFI inherit DATAWINDOW 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBPREVISTO as DataColumn
	PROTECT oDBEFETUADO as DataColumn
	PROTECT oDBDPLANO as DataColumn
	PROTECT oDBEFICAZ as DataColumn
	PROTECT oDBOBS as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_PREVISTO as FIXEDTEXT
	protect oDCSC_EFETUADO as FIXEDTEXT
	protect oDCSC_OBS as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCPREVISTO as DATESLE
	protect oDCEFETUADO as DATESLE
	protect oDCOBS as SINGLELINEEDIT
	protect oDCXDPLANO as FIXEDTEXT
	protect oDCDPLANO as DATESLE
	protect oDCEFICAZ as SINGLELINEEDIT
	protect oDCSC_EFETUADO1 as FIXEDTEXT
	protect oCCcmdEFICAZ as PUSHBUTTON
// 	instance NUMERO 
// 	instance PREVISTO 
// 	instance EFETUADO 
// 	instance OBS 
// 	instance DPLANO 
// 	instance EFICAZ 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DPLANO() 
return self:FieldGet(#DPLANO)


assign DPLANO(uValue) 
self:FieldPut(#DPLANO, uValue)
return DPLANO := uValue


access EFETUADO() 
return self:FieldGet(#EFETUADO)


assign EFETUADO(uValue) 
self:FieldPut(#EFETUADO, uValue)
return EFETUADO := uValue


access EFICAZ() 
return self:FieldGet(#EFICAZ)


assign EFICAZ(uValue) 
self:FieldPut(#EFICAZ, uValue)
return EFICAZ := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCAFI",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_NUMERO := FixedText{self,ResourceID{JCAFI_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_PREVISTO := FixedText{self,ResourceID{JCAFI_SC_PREVISTO,_GetInst()}}
oDCSC_PREVISTO:HyperLabel := HyperLabel{#SC_PREVISTO,"Previsto:",NULL_STRING,NULL_STRING}

oDCSC_EFETUADO := FixedText{self,ResourceID{JCAFI_SC_EFETUADO,_GetInst()}}
oDCSC_EFETUADO:HyperLabel := HyperLabel{#SC_EFETUADO,"Efetuado:",NULL_STRING,NULL_STRING}

oDCSC_OBS := FixedText{self,ResourceID{JCAFI_SC_OBS,_GetInst()}}
oDCSC_OBS:HyperLabel := HyperLabel{#SC_OBS,"Obs:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JCAFI_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"CAF_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]
oDCNUMERO:Font(aFonts[1], FALSE)

oDCPREVISTO := DateSle{self,ResourceID{JCAFI_PREVISTO,_GetInst()}}
oDCPREVISTO:FieldSpec := DATE_FIELD{}
oDCPREVISTO:HyperLabel := HyperLabel{#PREVISTO,"Previsto:",NULL_STRING,"CAF_PREVISTO"}

oDCEFETUADO := DateSle{self,ResourceID{JCAFI_EFETUADO,_GetInst()}}
oDCEFETUADO:FieldSpec := DATE_FIELD{}
oDCEFETUADO:HyperLabel := HyperLabel{#EFETUADO,"Efetuado:",NULL_STRING,"CAF_EFETUADO"}

oDCOBS := SingleLineEdit{self,ResourceID{JCAFI_OBS,_GetInst()}}
oDCOBS:FieldSpec := PADRAO_CHAR_80{}
oDCOBS:HyperLabel := HyperLabel{#OBS,"Obs:",NULL_STRING,"CAF_OBS"}

oDCXDPLANO := FixedText{self,ResourceID{JCAFI_XDPLANO,_GetInst()}}
oDCXDPLANO:HyperLabel := HyperLabel{#XDPLANO,"Plano de Acao",NULL_STRING,NULL_STRING}

oDCDPLANO := DateSle{self,ResourceID{JCAFI_DPLANO,_GetInst()}}
oDCDPLANO:FieldSpec := DATE_FIELD{}
oDCDPLANO:HyperLabel := HyperLabel{#DPLANO,"Plano",NULL_STRING,"CAF_PREVISTO"}

oDCEFICAZ := SingleLineEdit{self,ResourceID{JCAFI_EFICAZ,_GetInst()}}
oDCEFICAZ:FieldSpec := PADRAO_CHAR_01{}
oDCEFICAZ:HyperLabel := HyperLabel{#EFICAZ,"Numero:",NULL_STRING,"CAF_NUMERO"}
oDCEFICAZ:BackGround := aBrushes[1]
oDCEFICAZ:Font(aFonts[1], FALSE)

oDCSC_EFETUADO1 := FixedText{self,ResourceID{JCAFI_SC_EFETUADO1,_GetInst()}}
oDCSC_EFETUADO1:HyperLabel := HyperLabel{#SC_EFETUADO1,"Eficaz",NULL_STRING,NULL_STRING}

oCCcmdEFICAZ := PushButton{self,ResourceID{JCAFI_CMDEFICAZ,_GetInst()}}
oCCcmdEFICAZ:HyperLabel := HyperLabel{#cmdEFICAZ,"Sim/Nao",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JCAFI,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBPREVISTO := DataColumn{DATE_FIELD{}}
oDBPREVISTO:Width := 15
oDBPREVISTO:HyperLabel := oDCPREVISTO:HyperLabel 
oDBPREVISTO:Caption := "Previsto:"
self:Browser:AddColumn(oDBPREVISTO)

oDBEFETUADO := DataColumn{DATE_FIELD{}}
oDBEFETUADO:Width := 14
oDBEFETUADO:HyperLabel := oDCEFETUADO:HyperLabel 
oDBEFETUADO:Caption := "Efetuado:"
self:Browser:AddColumn(oDBEFETUADO)

oDBDPLANO := DataColumn{DATE_FIELD{}}
oDBDPLANO:Width := 13
oDBDPLANO:HyperLabel := oDCDPLANO:HyperLabel 
oDBDPLANO:Caption := "Plano"
self:Browser:AddColumn(oDBDPLANO)

oDBEFICAZ := DataColumn{PADRAO_CHAR_01{}}
oDBEFICAZ:Width := 5
oDBEFICAZ:HyperLabel := oDCEFICAZ:HyperLabel 
oDBEFICAZ:Caption := "Numero:"
oDBEFICAZ:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBEFICAZ)

oDBOBS := DataColumn{PADRAO_CHAR_80{}}
oDBOBS:Width := 26
oDBOBS:HyperLabel := oDCOBS:HyperLabel 
oDBOBS:Caption := "Obs:"
self:Browser:AddColumn(oDBOBS)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access OBS() 
return self:FieldGet(#OBS)


assign OBS(uValue) 
self:FieldPut(#OBS, uValue)
return OBS := uValue


access PREVISTO() 
return self:FieldGet(#PREVISTO)


assign PREVISTO(uValue) 
self:FieldPut(#PREVISTO, uValue)
return PREVISTO := uValue


END CLASS
