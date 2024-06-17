#region DEFINES
STATIC DEFINE JVIAREV_DATA := 108 
STATIC DEFINE JVIAREV_HORA := 110 
STATIC DEFINE JVIAREV_MOTIVO := 104 
STATIC DEFINE JVIAREV_OPR := 107 
STATIC DEFINE JVIAREV_OV := 106 
STATIC DEFINE JVIAREV_REV := 105 
STATIC DEFINE JVIAREV_SC_MOTIVO := 103 
STATIC DEFINE JVIAREV_SC_OV := 100 
STATIC DEFINE JVIAREV_SC_REV := 101 
STATIC DEFINE JVIAREV_SC_TIME := 102 
STATIC DEFINE JVIAREV_SC_TIME1 := 109 
STATIC DEFINE JVIAREV_SC_TIME2 := 112 
STATIC DEFINE JVIAREV_USUARIO := 111 
#endregion

class jviarev inherit DATAWINDOW 

	PROTECT oDBOV as DataColumn
	PROTECT oDBREV as DataColumn
	PROTECT oDBOPR as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBHORA as DataColumn
	PROTECT oDBUSUARIO as DataColumn
	PROTECT oDBMOTIVO as DataColumn
	protect oDCSC_OV as FIXEDTEXT
	protect oDCSC_REV as FIXEDTEXT
	protect oDCSC_TIME as FIXEDTEXT
	protect oDCSC_MOTIVO as FIXEDTEXT
	protect oDCMOTIVO as SINGLELINEEDIT
	protect oDCREV as SINGLELINEEDIT
	protect oDCOV as SINGLELINEEDIT
	protect oDCOPR as SINGLELINEEDIT
	protect oDCDATA as SINGLELINEEDIT
	protect oDCSC_TIME1 as FIXEDTEXT
	protect oDCHora as SINGLELINEEDIT
	protect oDCuSUARIO as SINGLELINEEDIT
	protect oDCSC_TIME2 as FIXEDTEXT
// 	instance MOTIVO 
// 	instance REV 
// 	instance OV 
// 	instance OPR 
// 	instance DATA 
// 	instance Hora 
// 	instance uSUARIO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access Hora() 
return self:FieldGet(#Hora)


assign Hora(uValue) 
self:FieldPut(#Hora, uValue)
return Hora := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jviarev",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,12,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_OV := FixedText{self,ResourceID{JVIAREV_SC_OV,_GetInst()}}
oDCSC_OV:HyperLabel := HyperLabel{#SC_OV,"Ov:",NULL_STRING,NULL_STRING}

oDCSC_REV := FixedText{self,ResourceID{JVIAREV_SC_REV,_GetInst()}}
oDCSC_REV:HyperLabel := HyperLabel{#SC_REV,"Rev:",NULL_STRING,NULL_STRING}

oDCSC_TIME := FixedText{self,ResourceID{JVIAREV_SC_TIME,_GetInst()}}
oDCSC_TIME:HyperLabel := HyperLabel{#SC_TIME,"Hora",NULL_STRING,NULL_STRING}

oDCSC_MOTIVO := FixedText{self,ResourceID{JVIAREV_SC_MOTIVO,_GetInst()}}
oDCSC_MOTIVO:HyperLabel := HyperLabel{#SC_MOTIVO,"Motivo:",NULL_STRING,NULL_STRING}

oDCMOTIVO := SingleLineEdit{self,ResourceID{JVIAREV_MOTIVO,_GetInst()}}
oDCMOTIVO:FieldSpec := padrao_char_255{}
oDCMOTIVO:HyperLabel := HyperLabel{#MOTIVO,"Motivo:",NULL_STRING,"VIAREV_MOTIVO"}
oDCMOTIVO:BackGround := aBrushes[1]
oDCMOTIVO:Font(aFonts[1], FALSE)

oDCREV := SingleLineEdit{self,ResourceID{JVIAREV_REV,_GetInst()}}
oDCREV:FieldSpec := padrao_char_01{}
oDCREV:HyperLabel := HyperLabel{#REV,"ReV:",NULL_STRING,"VIABILI_OV"}
oDCREV:BackGround := aBrushes[1]
oDCREV:Font(aFonts[2], FALSE)

oDCOV := SingleLineEdit{self,ResourceID{JVIAREV_OV,_GetInst()}}
oDCOV:FieldSpec := padrao_num_08{}
oDCOV:HyperLabel := HyperLabel{#OV,"Ov:",NULL_STRING,"VIABILI_OV"}
oDCOV:BackGround := aBrushes[1]
oDCOV:Font(aFonts[2], FALSE)

oDCOPR := SingleLineEdit{self,ResourceID{JVIAREV_OPR,_GetInst()}}
oDCOPR:FieldSpec := padrao_char_01{}
oDCOPR:HyperLabel := HyperLabel{#OPR,"Opr:",NULL_STRING,"VIABILI_OV"}
oDCOPR:BackGround := aBrushes[1]
oDCOPR:Font(aFonts[2], FALSE)

oDCDATA := SingleLineEdit{self,ResourceID{JVIAREV_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"VIABILI_OV"}
oDCDATA:BackGround := aBrushes[1]
oDCDATA:Font(aFonts[2], FALSE)

oDCSC_TIME1 := FixedText{self,ResourceID{JVIAREV_SC_TIME1,_GetInst()}}
oDCSC_TIME1:HyperLabel := HyperLabel{#SC_TIME1,"data",NULL_STRING,NULL_STRING}

oDCHora := SingleLineEdit{self,ResourceID{JVIAREV_HORA,_GetInst()}}
oDCHora:FieldSpec := padrao_char_08{}
oDCHora:HyperLabel := HyperLabel{#Hora,"Hora:",NULL_STRING,"VIABILI_OV"}
oDCHora:BackGround := aBrushes[1]
oDCHora:Font(aFonts[2], FALSE)

oDCuSUARIO := SingleLineEdit{self,ResourceID{JVIAREV_USUARIO,_GetInst()}}
oDCuSUARIO:FieldSpec := padrao_char_10{}
oDCuSUARIO:HyperLabel := HyperLabel{#uSUARIO,"Usuario:",NULL_STRING,"VIABILI_OV"}
oDCuSUARIO:BackGround := aBrushes[1]
oDCuSUARIO:Font(aFonts[2], FALSE)

oDCSC_TIME2 := FixedText{self,ResourceID{JVIAREV_SC_TIME2,_GetInst()}}
oDCSC_TIME2:HyperLabel := HyperLabel{#SC_TIME2,"Usuario",NULL_STRING,NULL_STRING}

self:Caption := "Motivos"
self:HyperLabel := HyperLabel{#jviarev,"Motivos",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBOV := DataColumn{padrao_num_08{}}
oDBOV:Width := 13
oDBOV:HyperLabel := oDCOV:HyperLabel 
oDBOV:Caption := "Ov:"
oDBOV:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOV)

oDBREV := DataColumn{padrao_char_01{}}
oDBREV:Width := 6
oDBREV:HyperLabel := oDCREV:HyperLabel 
oDBREV:Caption := "ReV:"
oDBREV:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBREV)

oDBOPR := DataColumn{padrao_char_01{}}
oDBOPR:Width := 7
oDBOPR:HyperLabel := oDCOPR:HyperLabel 
oDBOPR:Caption := "Opr:"
oDBOPR:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOPR)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 13
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
oDBDATA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDATA)

oDBHORA := DataColumn{padrao_char_08{}}
oDBHORA:Width := 13
oDBHORA:HyperLabel := oDCHORA:HyperLabel 
oDBHORA:Caption := "Hora:"
oDBHora:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBHORA)

oDBUSUARIO := DataColumn{padrao_char_10{}}
oDBUSUARIO:Width := 13
oDBUSUARIO:HyperLabel := oDCUSUARIO:HyperLabel 
oDBUSUARIO:Caption := "Usuario:"
oDBuSUARIO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBUSUARIO)

oDBMOTIVO := DataColumn{padrao_char_255{}}
oDBMOTIVO:Width := 35
oDBMOTIVO:HyperLabel := oDCMOTIVO:HyperLabel 
oDBMOTIVO:Caption := "Motivo:"
oDBMOTIVO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMOTIVO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MOTIVO() 
return self:FieldGet(#MOTIVO)


assign MOTIVO(uValue) 
self:FieldPut(#MOTIVO, uValue)
return MOTIVO := uValue


access OPR() 
return self:FieldGet(#OPR)


assign OPR(uValue) 
self:FieldPut(#OPR, uValue)
return OPR := uValue


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


access uSUARIO() 
return self:FieldGet(#uSUARIO)


assign uSUARIO(uValue) 
self:FieldPut(#uSUARIO, uValue)
return uSUARIO := uValue


END CLASS
