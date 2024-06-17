#region DEFINES
STATIC DEFINE JRHAB_CMDPERIC := 114 
STATIC DEFINE JRHAB_CODIGO := 105 
STATIC DEFINE JRHAB_CODIGO2 := 108 
STATIC DEFINE JRHAB_DATA := 111 
STATIC DEFINE JRHAB_DUPLICAR := 107 
STATIC DEFINE JRHAB_ESCTABFALTA := 110 
STATIC DEFINE JRHAB_ESCTABFALTA1 := 112 
STATIC DEFINE JRHAB_HORAS := 106 
STATIC DEFINE JRHAB_JUSTIFICA := 113 
STATIC DEFINE JRHAB_NUMERO := 104 
STATIC DEFINE JRHAB_SC_CODIGO := 101 
STATIC DEFINE JRHAB_SC_CODIGO2 := 109 
STATIC DEFINE JRHAB_SC_DATA := 102 
STATIC DEFINE JRHAB_SC_HORAS := 103 
STATIC DEFINE JRHAB_SC_NUMERO := 100 
#endregion

PARTIAL class JRHAB inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBCODIGO2 as DataColumn
	PROTECT oDBJUSTIFICA as DataColumn
	PROTECT oDBHORAS as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_HORAS as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCHORAS as SINGLELINEEDIT
	protect oCCDuplicar as PUSHBUTTON
	protect oDCCODIGO2 as SINGLELINEEDIT
	protect oDCSC_CODIGO2 as FIXEDTEXT
	protect oCCesctabfalta as PUSHBUTTON
	protect oDCDATA as SINGLELINEEDIT
	protect oCCesctabfalta1 as PUSHBUTTON
	protect oDCJUSTIFICA as SINGLELINEEDIT
	protect oCCcmdPERIC as PUSHBUTTON
// 	instance NUMERO 
// 	instance CODIGO 
// 	instance HORAS 
// 	instance CODIGO2 
// 	instance DATA 
// 	instance JUSTIFICA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODIGO2() 
return self:FieldGet(#CODIGO2)


assign CODIGO2(uValue) 
self:FieldPut(#CODIGO2, uValue)
return CODIGO2 := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access HORAS() 
return self:FieldGet(#HORAS)


assign HORAS(uValue) 
self:FieldPut(#HORAS, uValue)
return HORAS := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[2] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRHAB",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{253,254,220}}
aBrushes[2] := Brush{Color{255,255,200}}

oDCSC_NUMERO := FixedText{self,ResourceID{JRHAB_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JRHAB_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JRHAB_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_HORAS := FixedText{self,ResourceID{JRHAB_SC_HORAS,_GetInst()}}
oDCSC_HORAS:HyperLabel := HyperLabel{#SC_HORAS,"Horas:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JRHAB_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"RHAB_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]

oDCCODIGO := SingleLineEdit{self,ResourceID{JRHAB_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_02{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"RHAB_CODIGO"}

oDCHORAS := SingleLineEdit{self,ResourceID{JRHAB_HORAS,_GetInst()}}
oDCHORAS:FieldSpec := PADRAO_NUM_05_2{}
oDCHORAS:HyperLabel := HyperLabel{#HORAS,"Horas:",NULL_STRING,"RHAB_HORAS"}

oCCDuplicar := PushButton{self,ResourceID{JRHAB_DUPLICAR,_GetInst()}}
oCCDuplicar:HyperLabel := HyperLabel{#Duplicar,"Duplicar Dia Seguinte",NULL_STRING,NULL_STRING}

oDCCODIGO2 := SingleLineEdit{self,ResourceID{JRHAB_CODIGO2,_GetInst()}}
oDCCODIGO2:FieldSpec := PADRAO_CHAR_02{}
oDCCODIGO2:HyperLabel := HyperLabel{#CODIGO2,"Cod2:",NULL_STRING,"RHAB_CODIGO"}

oDCSC_CODIGO2 := FixedText{self,ResourceID{JRHAB_SC_CODIGO2,_GetInst()}}
oDCSC_CODIGO2:HyperLabel := HyperLabel{#SC_CODIGO2,"Codigo 2:",NULL_STRING,NULL_STRING}

oCCesctabfalta := PushButton{self,ResourceID{JRHAB_ESCTABFALTA,_GetInst()}}
oCCesctabfalta:HyperLabel := HyperLabel{#esctabfalta,"..",NULL_STRING,NULL_STRING}

oDCDATA := SingleLineEdit{self,ResourceID{JRHAB_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data",NULL_STRING,"RHAB_NUMERO"}
oDCDATA:BackGround := aBrushes[1]

oCCesctabfalta1 := PushButton{self,ResourceID{JRHAB_ESCTABFALTA1,_GetInst()}}
oCCesctabfalta1:HyperLabel := HyperLabel{#esctabfalta1,"..",NULL_STRING,NULL_STRING}

oDCJUSTIFICA := SingleLineEdit{self,ResourceID{JRHAB_JUSTIFICA,_GetInst()}}
oDCJUSTIFICA:FieldSpec := PADRAO_CHAR_01{}
oDCJUSTIFICA:HyperLabel := HyperLabel{#JUSTIFICA,"Justifica",NULL_STRING,"FO_PES_TIPO"}
oDCJUSTIFICA:BackGround := aBrushes[2]
oDCJUSTIFICA:Font(aFonts[1], FALSE)

oCCcmdPERIC := PushButton{self,ResourceID{JRHAB_CMDPERIC,_GetInst()}}
oCCcmdPERIC:HyperLabel := HyperLabel{#cmdPERIC,"Justificada S/N",NULL_STRING,NULL_STRING}

self:Caption := "Absenteismo"
self:HyperLabel := HyperLabel{#JRHAB,"Absenteismo",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

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

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 12
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data"
oDBDATA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDATA)

oDBCODIGO := DataColumn{PADRAO_CHAR_02{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBCODIGO2 := DataColumn{PADRAO_CHAR_02{}}
oDBCODIGO2:Width := 5
oDBCODIGO2:HyperLabel := oDCCODIGO2:HyperLabel 
oDBCODIGO2:Caption := "Cod2:"
self:Browser:AddColumn(oDBCODIGO2)

oDBJUSTIFICA := DataColumn{PADRAO_CHAR_01{}}
oDBJUSTIFICA:Width := 14
oDBJUSTIFICA:HyperLabel := oDCJUSTIFICA:HyperLabel 
oDBJUSTIFICA:Caption := "Justifica"
oDBJUSTIFICA:BackGround := aBrushes[2]
self:Browser:AddColumn(oDBJUSTIFICA)

oDBHORAS := DataColumn{PADRAO_NUM_05_2{}}
oDBHORAS:Width := 12
oDBHORAS:HyperLabel := oDCHORAS:HyperLabel 
oDBHORAS:Caption := "Horas:"
self:Browser:AddColumn(oDBHORAS)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access JUSTIFICA() 
return self:FieldGet(#JUSTIFICA)


assign JUSTIFICA(uValue) 
self:FieldPut(#JUSTIFICA, uValue)
return JUSTIFICA := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


END CLASS
