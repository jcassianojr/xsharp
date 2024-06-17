#region DEFINES
STATIC DEFINE JCICI_CCESP := 100 
STATIC DEFINE JCICI_CESPE := 105 
STATIC DEFINE JCICI_DESENHO := 108 
STATIC DEFINE JCICI_ESPE := 101 
STATIC DEFINE JCICI_LOCALI := 100 
STATIC DEFINE JCICI_MAX := 102 
STATIC DEFINE JCICI_MIN := 103 
STATIC DEFINE JCICI_SC_DESENHO := 106 
STATIC DEFINE JCICI_SC_ESPE := 109 
STATIC DEFINE JCICI_SC_LOCALI := 107 
STATIC DEFINE JCICI_SC_MAX := 110 
STATIC DEFINE JCICI_SC_MIN := 111 
STATIC DEFINE JCICI_SC_UND := 112 
STATIC DEFINE JCICI_THEFIXEDTEXT6 := 113 
STATIC DEFINE JCICI_UND := 104 
#endregion

class JCICI inherit DATAWINDOW 

	PROTECT oDBDESENHO as DataColumn
	PROTECT oDBLOCALI as DataColumn
	PROTECT oDBUND as DataColumn
	PROTECT oDBESPE as DataColumn
	PROTECT oDBCESPE as DataColumn
	PROTECT oDBMIN as DataColumn
	PROTECT oDBMAX as DataColumn
	protect oDCLOCALI as SINGLELINEEDIT
	protect oDCESPE as RIGHTSLE
	protect oDCMAX as RIGHTSLE
	protect oDCMIN as RIGHTSLE
	protect oDCUND as SINGLELINEEDIT
	protect oDCCESPE as SINGLELINEEDIT
	protect oDCSC_DESENHO as FIXEDTEXT
	protect oDCSC_LOCALI as FIXEDTEXT
	protect oDCDESENHO as SINGLELINEEDIT
	protect oDCSC_ESPE as FIXEDTEXT
	protect oDCSC_MAX as FIXEDTEXT
	protect oDCSC_MIN as FIXEDTEXT
	protect oDCSC_UND as FIXEDTEXT
	protect oDCtheFixedText6 as FIXEDTEXT
// 	instance LOCALI 
// 	instance ESPE 
// 	instance MAX 
// 	instance MIN 
// 	instance UND 
// 	instance CESPE 
// 	instance DESENHO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CESPE() 
return self:FieldGet(#CESPE)


assign CESPE(uValue) 
self:FieldPut(#CESPE, uValue)
return CESPE := uValue


access DESENHO() 
return self:FieldGet(#DESENHO)


assign DESENHO(uValue) 
self:FieldPut(#DESENHO, uValue)
return DESENHO := uValue


access ESPE() 
return self:FieldGet(#ESPE)


assign ESPE(uValue) 
self:FieldPut(#ESPE, uValue)
return ESPE := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCICI",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCLOCALI := SingleLineEdit{self,ResourceID{JCICI_LOCALI,_GetInst()}}
oDCLOCALI:FieldSpec := PADRAO_CHAR_30{}
oDCLOCALI:HyperLabel := HyperLabel{#LOCALI,"Locali:",NULL_STRING,"CICI_LOCALI"}

oDCESPE := rightSle{self,ResourceID{JCICI_ESPE,_GetInst()}}
oDCESPE:FieldSpec := PADRAO_NUM_09_4{}
oDCESPE:HyperLabel := HyperLabel{#ESPE,"Espe:",NULL_STRING,"CICI_ESPE"}

oDCMAX := rightSle{self,ResourceID{JCICI_MAX,_GetInst()}}
oDCMAX:FieldSpec := PADRAO_NUM_09_4{}
oDCMAX:HyperLabel := HyperLabel{#MAX,"Max:",NULL_STRING,"CICI_MAX"}

oDCMIN := rightSle{self,ResourceID{JCICI_MIN,_GetInst()}}
oDCMIN:FieldSpec := PADRAO_NUM_09_4{}
oDCMIN:HyperLabel := HyperLabel{#MIN,"Min:",NULL_STRING,"CICI_MIN"}

oDCUND := SingleLineEdit{self,ResourceID{JCICI_UND,_GetInst()}}
oDCUND:FieldSpec := PADRAO_CHAR_02{}
oDCUND:HyperLabel := HyperLabel{#UND,"Und:",NULL_STRING,"CICI_UND"}

oDCCESPE := SingleLineEdit{self,ResourceID{JCICI_CESPE,_GetInst()}}
oDCCESPE:FieldSpec := PADRAO_CHAR_30{}
oDCCESPE:HyperLabel := HyperLabel{#CESPE,"Esp.Desc",NULL_STRING,"CICI_ESPE"}

oDCSC_DESENHO := FixedText{self,ResourceID{JCICI_SC_DESENHO,_GetInst()}}
oDCSC_DESENHO:HyperLabel := HyperLabel{#SC_DESENHO,"Desenho:",NULL_STRING,NULL_STRING}

oDCSC_LOCALI := FixedText{self,ResourceID{JCICI_SC_LOCALI,_GetInst()}}
oDCSC_LOCALI:HyperLabel := HyperLabel{#SC_LOCALI,"Local:",NULL_STRING,NULL_STRING}

oDCDESENHO := SingleLineEdit{self,ResourceID{JCICI_DESENHO,_GetInst()}}
oDCDESENHO:FieldSpec := PADRAO_CHAR_24{}
oDCDESENHO:HyperLabel := HyperLabel{#DESENHO,"Desenho:",NULL_STRING,"CICI_DESENHO"}
oDCDESENHO:BackGround := aBrushes[1]
oDCDESENHO:Font(aFonts[1], FALSE)

oDCSC_ESPE := FixedText{self,ResourceID{JCICI_SC_ESPE,_GetInst()}}
oDCSC_ESPE:HyperLabel := HyperLabel{#SC_ESPE,"Especificado:",NULL_STRING,NULL_STRING}

oDCSC_MAX := FixedText{self,ResourceID{JCICI_SC_MAX,_GetInst()}}
oDCSC_MAX:HyperLabel := HyperLabel{#SC_MAX,"Max:",NULL_STRING,NULL_STRING}

oDCSC_MIN := FixedText{self,ResourceID{JCICI_SC_MIN,_GetInst()}}
oDCSC_MIN:HyperLabel := HyperLabel{#SC_MIN,"Min:",NULL_STRING,NULL_STRING}

oDCSC_UND := FixedText{self,ResourceID{JCICI_SC_UND,_GetInst()}}
oDCSC_UND:HyperLabel := HyperLabel{#SC_UND,"Und:",NULL_STRING,NULL_STRING}

oDCtheFixedText6 := FixedText{self,ResourceID{JCICI_THEFIXEDTEXT6,_GetInst()}}
oDCtheFixedText6:HyperLabel := HyperLabel{#theFixedText6,"Especificado Descritivo:",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JCICI,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDESENHO := DataColumn{PADRAO_CHAR_24{}}
oDBDESENHO:Width := 12
oDBDESENHO:HyperLabel := oDCDESENHO:HyperLabel 
oDBDESENHO:Caption := "Desenho:"
oDBDESENHO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDESENHO)

oDBLOCALI := DataColumn{PADRAO_CHAR_30{}}
oDBLOCALI:Width := 9
oDBLOCALI:HyperLabel := oDCLOCALI:HyperLabel 
oDBLOCALI:Caption := "Locali:"
self:Browser:AddColumn(oDBLOCALI)

oDBUND := DataColumn{PADRAO_CHAR_02{}}
oDBUND:Width := 6
oDBUND:HyperLabel := oDCUND:HyperLabel 
oDBUND:Caption := "Und:"
self:Browser:AddColumn(oDBUND)

oDBESPE := DataColumn{PADRAO_NUM_09_4{}}
oDBESPE:Width := 12
oDBESPE:HyperLabel := oDCESPE:HyperLabel 
oDBESPE:Caption := "Espe:"
self:Browser:AddColumn(oDBESPE)

oDBCESPE := DataColumn{PADRAO_CHAR_30{}}
oDBCESPE:Width := 10
oDBCESPE:HyperLabel := oDCCESPE:HyperLabel 
oDBCESPE:Caption := "Esp.Desc"
self:Browser:AddColumn(oDBCESPE)

oDBMIN := DataColumn{PADRAO_NUM_09_4{}}
oDBMIN:Width := 9
oDBMIN:HyperLabel := oDCMIN:HyperLabel 
oDBMIN:Caption := "Min:"
self:Browser:AddColumn(oDBMIN)

oDBMAX := DataColumn{PADRAO_NUM_09_4{}}
oDBMAX:Width := 10
oDBMAX:HyperLabel := oDCMAX:HyperLabel 
oDBMAX:Caption := "Max:"
self:Browser:AddColumn(oDBMAX)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LOCALI() 
return self:FieldGet(#LOCALI)


assign LOCALI(uValue) 
self:FieldPut(#LOCALI, uValue)
return LOCALI := uValue


access MAX() 
return self:FieldGet(#MAX)


assign MAX(uValue) 
self:FieldPut(#MAX, uValue)
return MAX := uValue


access MIN() 
return self:FieldGet(#MIN)


assign MIN(uValue) 
self:FieldPut(#MIN, uValue)
return MIN := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	FabCenterWindow( SELF )
	RETURN NIL


access UND() 
return self:FieldGet(#UND)


assign UND(uValue) 
self:FieldPut(#UND, uValue)
return UND := uValue


END CLASS
