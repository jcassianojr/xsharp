#region DEFINES
STATIC DEFINE JRII_CMDESCMP2 := 118 
STATIC DEFINE JRII_DESVIO := 105 
STATIC DEFINE JRII_ENC := 104 
STATIC DEFINE JRII_ESPE := 103 
STATIC DEFINE JRII_FIXEDTEXT17 := 112 
STATIC DEFINE JRII_FIXEDTEXT18 := 117 
STATIC DEFINE JRII_ITEM := 101 
STATIC DEFINE JRII_LAUDO := 113 
STATIC DEFINE JRII_LOCALI := 102 
STATIC DEFINE JRII_RI := 108 
STATIC DEFINE JRII_SC_DESVIO := 111 
STATIC DEFINE JRII_SC_ENC := 110 
STATIC DEFINE JRII_SC_ESPE := 109 
STATIC DEFINE JRII_SC_ITEM := 100 
STATIC DEFINE JRII_SC_LOCALI := 107 
STATIC DEFINE JRII_SC_RI := 106 
STATIC DEFINE JRII_SC_RI1 := 114 
STATIC DEFINE JRII_SC_RI2 := 116 
STATIC DEFINE JRII_TIPINSP := 115 
#endregion

class JRII inherit DATAWINDOW 

	PROTECT oDBRI as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBLOCALI as DataColumn
	PROTECT oDBTIPINSP as DataColumn
	PROTECT oDBESPE as DataColumn
	PROTECT oDBENC as DataColumn
	PROTECT oDBLAUDO as DataColumn
	PROTECT oDBDESVIO as DataColumn
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCITEM as RIGHTSLE
	protect oDCLOCALI as SINGLELINEEDIT
	protect oDCESPE as SINGLELINEEDIT
	protect oDCENC as SINGLELINEEDIT
	protect oDCDESVIO as SINGLELINEEDIT
	protect oDCSC_RI as FIXEDTEXT
	protect oDCSC_LOCALI as FIXEDTEXT
	protect oDCRI as SINGLELINEEDIT
	protect oDCSC_ESPE as FIXEDTEXT
	protect oDCSC_ENC as FIXEDTEXT
	protect oDCSC_DESVIO as FIXEDTEXT
	protect oDCFixedText17 as FIXEDTEXT
	protect oDCLAUDO as SINGLELINEEDIT
	protect oDCSC_RI1 as FIXEDTEXT
	protect oDCTIPINSP as SINGLELINEEDIT
	protect oDCSC_RI2 as FIXEDTEXT
	protect oDCFixedText18 as FIXEDTEXT
	protect oCCcmdescmp2 as PUSHBUTTON
// 	instance ITEM 
// 	instance LOCALI 
// 	instance ESPE 
// 	instance ENC 
// 	instance DESVIO 
// 	instance RI 
// 	instance LAUDO 
// 	instance TIPINSP 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD cmdescmp2( ) 
LOCAL oESC AS XESCNUM
oESC:=XESCNUM{SELF,"FLUXO.DBF"}
oESC:SHOW()
IF oESC:LOK
   	SELF:SERVER:FIELDPUT("TIPINSP",CHR(oESC:NUMERO))
ENDIF

access DESVIO() 
return self:FieldGet(#DESVIO)


assign DESVIO(uValue) 
self:FieldPut(#DESVIO, uValue)
return DESVIO := uValue


access ENC() 
return self:FieldGet(#ENC)


assign ENC(uValue) 
self:FieldPut(#ENC, uValue)
return ENC := uValue


access ESPE() 
return self:FieldGet(#ESPE)


assign ESPE(uValue) 
self:FieldPut(#ESPE, uValue)
return ESPE := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRII",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,14,"isoqsymbol"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_ITEM := FixedText{self,ResourceID{JRII_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCITEM := rightSle{self,ResourceID{JRII_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_NUM_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"RII_ITEM"}

oDCLOCALI := SingleLineEdit{self,ResourceID{JRII_LOCALI,_GetInst()}}
oDCLOCALI:FieldSpec := PADRAO_CHAR_30{}
oDCLOCALI:HyperLabel := HyperLabel{#LOCALI,"Local:",NULL_STRING,"RII_LOCALI"}

oDCESPE := SingleLineEdit{self,ResourceID{JRII_ESPE,_GetInst()}}
oDCESPE:FieldSpec := PADRAO_CHAR_100{}
oDCESPE:HyperLabel := HyperLabel{#ESPE,"Especificado:",NULL_STRING,"RII_ESPE"}

oDCENC := SingleLineEdit{self,ResourceID{JRII_ENC,_GetInst()}}
oDCENC:FieldSpec := PADRAO_CHAR_40{}
oDCENC:HyperLabel := HyperLabel{#ENC,"Encontrado:",NULL_STRING,"RII_ENC"}

oDCDESVIO := SingleLineEdit{self,ResourceID{JRII_DESVIO,_GetInst()}}
oDCDESVIO:FieldSpec := PADRAO_CHAR_20{}
oDCDESVIO:HyperLabel := HyperLabel{#DESVIO,"Desvio:",NULL_STRING,"RII_DESVIO"}

oDCSC_RI := FixedText{self,ResourceID{JRII_SC_RI,_GetInst()}}
oDCSC_RI:HyperLabel := HyperLabel{#SC_RI,"Ri:",NULL_STRING,NULL_STRING}

oDCSC_LOCALI := FixedText{self,ResourceID{JRII_SC_LOCALI,_GetInst()}}
oDCSC_LOCALI:HyperLabel := HyperLabel{#SC_LOCALI,"Local:",NULL_STRING,NULL_STRING}

oDCRI := SingleLineEdit{self,ResourceID{JRII_RI,_GetInst()}}
oDCRI:FieldSpec := PADRAO_NUM_08{}
oDCRI:HyperLabel := HyperLabel{#RI,"Ri:",NULL_STRING,"RII_RI"}
oDCRI:BackGround := aBrushes[1]
oDCRI:Font(aFonts[1], FALSE)

oDCSC_ESPE := FixedText{self,ResourceID{JRII_SC_ESPE,_GetInst()}}
oDCSC_ESPE:HyperLabel := HyperLabel{#SC_ESPE,"Especificado:",NULL_STRING,NULL_STRING}

oDCSC_ENC := FixedText{self,ResourceID{JRII_SC_ENC,_GetInst()}}
oDCSC_ENC:HyperLabel := HyperLabel{#SC_ENC,"Encontrado:",NULL_STRING,NULL_STRING}

oDCSC_DESVIO := FixedText{self,ResourceID{JRII_SC_DESVIO,_GetInst()}}
oDCSC_DESVIO:HyperLabel := HyperLabel{#SC_DESVIO,"Desvio:",NULL_STRING,NULL_STRING}

oDCFixedText17 := FixedText{self,ResourceID{JRII_FIXEDTEXT17,_GetInst()}}
oDCFixedText17:HyperLabel := HyperLabel{#FixedText17,"(A)provado (R)eprovado (G)uarda Resposta",NULL_STRING,NULL_STRING}

oDCLAUDO := SingleLineEdit{self,ResourceID{JRII_LAUDO,_GetInst()}}
oDCLAUDO:FieldSpec := PADRAO_CHAR_01{}
oDCLAUDO:HyperLabel := HyperLabel{#LAUDO,"L",NULL_STRING,"RI_RI"}
oDCLAUDO:BackGround := aBrushes[1]
oDCLAUDO:Font(aFonts[1], FALSE)

oDCSC_RI1 := FixedText{self,ResourceID{JRII_SC_RI1,_GetInst()}}
oDCSC_RI1:HyperLabel := HyperLabel{#SC_RI1,"Laudo",NULL_STRING,NULL_STRING}

oDCTIPINSP := SingleLineEdit{self,ResourceID{JRII_TIPINSP,_GetInst()}}
oDCTIPINSP:FieldSpec := PADRAO_CHAR_01{}
oDCTIPINSP:HyperLabel := HyperLabel{#TIPINSP,"T",NULL_STRING,"RI_RI"}
oDCTIPINSP:BackGround := aBrushes[1]
oDCTIPINSP:Font(aFonts[2], FALSE)

oDCSC_RI2 := FixedText{self,ResourceID{JRII_SC_RI2,_GetInst()}}
oDCSC_RI2:HyperLabel := HyperLabel{#SC_RI2,"TipIns",NULL_STRING,NULL_STRING}

oDCFixedText18 := FixedText{self,ResourceID{JRII_FIXEDTEXT18,_GetInst()}}
oDCFixedText18:HyperLabel := HyperLabel{#FixedText18,"Alto(I)mpacto Critica(P)roduto Seguranca(O)perador AltoImpacto(C)liente (S)eguranca",NULL_STRING,NULL_STRING}

oCCcmdescmp2 := PushButton{self,ResourceID{JRII_CMDESCMP2,_GetInst()}}
oCCcmdescmp2:HyperLabel := HyperLabel{#cmdescmp2,"FX",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JRII,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRI := DataColumn{PADRAO_NUM_08{}}
oDBRI:Width := 9
oDBRI:HyperLabel := oDCRI:HyperLabel 
oDBRI:Caption := "Ri:"
oDBRI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRI)

oDBITEM := DataColumn{PADRAO_NUM_03{}}
oDBITEM:Width := 6
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
self:Browser:AddColumn(oDBITEM)

oDBLOCALI := DataColumn{PADRAO_CHAR_30{}}
oDBLOCALI:Width := 17
oDBLOCALI:HyperLabel := oDCLOCALI:HyperLabel 
oDBLOCALI:Caption := "Local:"
self:Browser:AddColumn(oDBLOCALI)

oDBTIPINSP := DataColumn{PADRAO_CHAR_01{}}
oDBTIPINSP:Width := 4
oDBTIPINSP:HyperLabel := oDCTIPINSP:HyperLabel 
oDBTIPINSP:Caption := "T"
oDBTIPINSP:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTIPINSP)

oDBESPE := DataColumn{PADRAO_CHAR_100{}}
oDBESPE:Width := 16
oDBESPE:HyperLabel := oDCESPE:HyperLabel 
oDBESPE:Caption := "Especificado:"
self:Browser:AddColumn(oDBESPE)

oDBENC := DataColumn{PADRAO_CHAR_40{}}
oDBENC:Width := 18
oDBENC:HyperLabel := oDCENC:HyperLabel 
oDBENC:Caption := "Encontrado:"
self:Browser:AddColumn(oDBENC)

oDBLAUDO := DataColumn{PADRAO_CHAR_01{}}
oDBLAUDO:Width := 3
oDBLAUDO:HyperLabel := oDCLAUDO:HyperLabel 
oDBLAUDO:Caption := "L"
oDBLAUDO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBLAUDO)

oDBDESVIO := DataColumn{PADRAO_CHAR_20{}}
oDBDESVIO:Width := 16
oDBDESVIO:HyperLabel := oDCDESVIO:HyperLabel 
oDBDESVIO:Caption := "Desvio:"
self:Browser:AddColumn(oDBDESVIO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access LAUDO() 
return self:FieldGet(#LAUDO)


assign LAUDO(uValue) 
self:FieldPut(#LAUDO, uValue)
return LAUDO := uValue


access LOCALI() 
return self:FieldGet(#LOCALI)


assign LOCALI(uValue) 
self:FieldPut(#LOCALI, uValue)
return LOCALI := uValue


access RI() 
return self:FieldGet(#RI)


assign RI(uValue) 
self:FieldPut(#RI, uValue)
return RI := uValue


access TIPINSP() 
return self:FieldGet(#TIPINSP)


assign TIPINSP(uValue) 
self:FieldPut(#TIPINSP, uValue)
return TIPINSP := uValue


END CLASS
