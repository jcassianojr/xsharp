#region DEFINES
STATIC DEFINE JVIII_APROBS := 112 
STATIC DEFINE JVIII_APROVACAO := 110 
STATIC DEFINE JVIII_DADO := 114 
STATIC DEFINE JVIII_OV := 106 
STATIC DEFINE JVIII_REV := 108 
STATIC DEFINE JVIII_SC_APROBS := 111 
STATIC DEFINE JVIII_SC_APROVACAO := 105 
STATIC DEFINE JVIII_SC_DADO := 102 
STATIC DEFINE JVIII_SC_OV := 100 
STATIC DEFINE JVIII_SC_REV := 103 
STATIC DEFINE JVIII_SC_SITUACAO := 104 
STATIC DEFINE JVIII_SC_TIPO := 101 
STATIC DEFINE JVIII_SITOBS := 113 
STATIC DEFINE JVIII_SITUACAO := 109 
STATIC DEFINE JVIII_TIPO := 107 
#endregion

class JVIII inherit DATAWINDOW 

	PROTECT oDBOV as DataColumn
	PROTECT oDBTIPO as DataColumn
	PROTECT oDBREV as DataColumn
	PROTECT oDBSITUACAO as DataColumn
	PROTECT oDBAPROVACAO as DataColumn
	PROTECT oDBDADO as DataColumn
	protect oDCSC_OV as FIXEDTEXT
	protect oDCSC_TIPO as FIXEDTEXT
	protect oDCSC_DADO as FIXEDTEXT
	protect oDCSC_REV as FIXEDTEXT
	protect oDCSC_SITUACAO as FIXEDTEXT
	protect oDCSC_APROVACAO as FIXEDTEXT
	protect oDCOV as SINGLELINEEDIT
	protect oDCTIPO as SINGLELINEEDIT
	protect oDCREV as SINGLELINEEDIT
	protect oDCSITUACAO as SINGLELINEEDIT
	protect oDCAPROVACAO as SINGLELINEEDIT
	protect oDCSC_APROBS as FIXEDTEXT
	protect oDCaprobs as MULTILINEEDIT
	protect oDCsitobs as MULTILINEEDIT
	protect oDCDADO as MULTILINEEDIT
// 	instance OV 
// 	instance TIPO 
// 	instance REV 
// 	instance SITUACAO 
// 	instance APROVACAO 
// 	instance aprobs 
// 	instance sitobs 
// 	instance DADO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access aprobs() 
return self:FieldGet(#aprobs)


assign aprobs(uValue) 
self:FieldPut(#aprobs, uValue)
return aprobs := uValue


access APROVACAO() 
return self:FieldGet(#APROVACAO)


assign APROVACAO(uValue) 
self:FieldPut(#APROVACAO, uValue)
return APROVACAO := uValue


access DADO() 
return self:FieldGet(#DADO)


assign DADO(uValue) 
self:FieldPut(#DADO, uValue)
return DADO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JVIII",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_OV := FixedText{self,ResourceID{JVIII_SC_OV,_GetInst()}}
oDCSC_OV:HyperLabel := HyperLabel{#SC_OV,"Ov:",NULL_STRING,NULL_STRING}

oDCSC_TIPO := FixedText{self,ResourceID{JVIII_SC_TIPO,_GetInst()}}
oDCSC_TIPO:HyperLabel := HyperLabel{#SC_TIPO,"Tipo:",NULL_STRING,NULL_STRING}

oDCSC_DADO := FixedText{self,ResourceID{JVIII_SC_DADO,_GetInst()}}
oDCSC_DADO:HyperLabel := HyperLabel{#SC_DADO,"Dado:",NULL_STRING,NULL_STRING}

oDCSC_REV := FixedText{self,ResourceID{JVIII_SC_REV,_GetInst()}}
oDCSC_REV:HyperLabel := HyperLabel{#SC_REV,"Rev:",NULL_STRING,NULL_STRING}

oDCSC_SITUACAO := FixedText{self,ResourceID{JVIII_SC_SITUACAO,_GetInst()}}
oDCSC_SITUACAO:HyperLabel := HyperLabel{#SC_SITUACAO,"Situacao:",NULL_STRING,NULL_STRING}

oDCSC_APROVACAO := FixedText{self,ResourceID{JVIII_SC_APROVACAO,_GetInst()}}
oDCSC_APROVACAO:HyperLabel := HyperLabel{#SC_APROVACAO,"Aprovacao:",NULL_STRING,NULL_STRING}

oDCOV := SingleLineEdit{self,ResourceID{JVIII_OV,_GetInst()}}
oDCOV:FieldSpec := PADRAO_NUM_08{}
oDCOV:HyperLabel := HyperLabel{#OV,"Ov:",NULL_STRING,"VIABIII_OV"}
oDCOV:BackGround := aBrushes[1]
oDCOV:Font(aFonts[1], FALSE)

oDCTIPO := SingleLineEdit{self,ResourceID{JVIII_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := PADRAO_CHAR_01{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"T",NULL_STRING,"VIABIII_TIPO"}
oDCTIPO:BackGround := aBrushes[1]
oDCTIPO:Font(aFonts[1], FALSE)

oDCREV := SingleLineEdit{self,ResourceID{JVIII_REV,_GetInst()}}
oDCREV:FieldSpec := PADRAO_CHAR_10{}
oDCREV:HyperLabel := HyperLabel{#REV,"Rev:",NULL_STRING,"VIABIII_REV"}
oDCREV:BackGround := aBrushes[1]
oDCREV:Font(aFonts[1], FALSE)

oDCSITUACAO := SingleLineEdit{self,ResourceID{JVIII_SITUACAO,_GetInst()}}
oDCSITUACAO:FieldSpec := PADRAO_CHAR_01{}
oDCSITUACAO:HyperLabel := HyperLabel{#SITUACAO,"S",NULL_STRING,"VIABIII_SITUACAO"}
oDCSITUACAO:BackGround := aBrushes[1]
oDCSITUACAO:Font(aFonts[1], FALSE)

oDCAPROVACAO := SingleLineEdit{self,ResourceID{JVIII_APROVACAO,_GetInst()}}
oDCAPROVACAO:FieldSpec := PADRAO_CHAR_01{}
oDCAPROVACAO:HyperLabel := HyperLabel{#APROVACAO,"C",NULL_STRING,"VIABIII_APROVACAO"}
oDCAPROVACAO:BackGround := aBrushes[1]
oDCAPROVACAO:Font(aFonts[1], FALSE)

oDCSC_APROBS := FixedText{self,ResourceID{JVIII_SC_APROBS,_GetInst()}}
oDCSC_APROBS:HyperLabel := HyperLabel{#SC_APROBS,"Obs:",NULL_STRING,NULL_STRING}

oDCaprobs := MultiLineEdit{self,ResourceID{JVIII_APROBS,_GetInst()}}
oDCaprobs:FieldSpec := memo_field{}
oDCaprobs:HyperLabel := HyperLabel{#aprobs,NULL_STRING,NULL_STRING,NULL_STRING}

oDCsitobs := MultiLineEdit{self,ResourceID{JVIII_SITOBS,_GetInst()}}
oDCsitobs:FieldSpec := memo_field{}
oDCsitobs:HyperLabel := HyperLabel{#sitobs,NULL_STRING,NULL_STRING,NULL_STRING}
oDCsitobs:BackGround := aBrushes[1]
oDCsitobs:Font(aFonts[1], FALSE)

oDCDADO := MultiLineEdit{self,ResourceID{JVIII_DADO,_GetInst()}}
oDCDADO:FieldSpec := MEMO_FIELD{}
oDCDADO:HyperLabel := HyperLabel{#DADO,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JVIII,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBOV := DataColumn{PADRAO_NUM_08{}}
oDBOV:Width := 9
oDBOV:HyperLabel := oDCOV:HyperLabel 
oDBOV:Caption := "Ov:"
oDBOV:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOV)

oDBTIPO := DataColumn{PADRAO_CHAR_01{}}
oDBTIPO:Width := 4
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "T"
oDBTIPO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTIPO)

oDBREV := DataColumn{PADRAO_CHAR_10{}}
oDBREV:Width := 5
oDBREV:HyperLabel := oDCREV:HyperLabel 
oDBREV:Caption := "Rev:"
oDBREV:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBREV)

oDBSITUACAO := DataColumn{PADRAO_CHAR_01{}}
oDBSITUACAO:Width := 6
oDBSITUACAO:HyperLabel := oDCSITUACAO:HyperLabel 
oDBSITUACAO:Caption := "S"
oDBSITUACAO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSITUACAO)

oDBAPROVACAO := DataColumn{PADRAO_CHAR_01{}}
oDBAPROVACAO:Width := 5
oDBAPROVACAO:HyperLabel := oDCAPROVACAO:HyperLabel 
oDBAPROVACAO:Caption := "C"
oDBAPROVACAO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBAPROVACAO)

oDBDADO := DataColumn{MEMO_FIELD{}}
oDBDADO:Width := 48
oDBDADO:HyperLabel := oDCDADO:HyperLabel 
oDBDADO:Caption := ""
self:Browser:AddColumn(oDBDADO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access OV() 
return self:FieldGet(#OV)


assign OV(uValue) 
self:FieldPut(#OV, uValue)
return OV := uValue


access REV() 
return self:FieldGet(#REV)


assign REV(uValue) 
self:FieldPut(#REV, uValue)
return REV := uValue


access sitobs() 
return self:FieldGet(#sitobs)


assign sitobs(uValue) 
self:FieldPut(#sitobs, uValue)
return sitobs := uValue


access SITUACAO() 
return self:FieldGet(#SITUACAO)


assign SITUACAO(uValue) 
self:FieldPut(#SITUACAO, uValue)
return SITUACAO := uValue


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


END CLASS
