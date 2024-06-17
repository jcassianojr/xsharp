#region DEFINES
STATIC DEFINE JORCAI_DATAREV := 114 
STATIC DEFINE JORCAI_DESCR := 103 
STATIC DEFINE JORCAI_DESENHO := 112 
STATIC DEFINE JORCAI_FERRA := 110 
STATIC DEFINE JORCAI_LOTEMIN := 111 
STATIC DEFINE JORCAI_OBSITE2 := 105 
STATIC DEFINE JORCAI_OBSITE3 := 106 
STATIC DEFINE JORCAI_OBSITE4 := 107 
STATIC DEFINE JORCAI_OBSITE5 := 108 
STATIC DEFINE JORCAI_OBSITEM := 104 
STATIC DEFINE JORCAI_ORCA := 123 
STATIC DEFINE JORCAI_ORD := 100 
STATIC DEFINE JORCAI_QTDDE := 101 
STATIC DEFINE JORCAI_REV := 113 
STATIC DEFINE JORCAI_SC_DESCR := 124 
STATIC DEFINE JORCAI_SC_DESCR1 := 116 
STATIC DEFINE JORCAI_SC_DESENHO := 119 
STATIC DEFINE JORCAI_SC_FERRA := 126 
STATIC DEFINE JORCAI_SC_LOTEMIN := 127 
STATIC DEFINE JORCAI_SC_ORCA := 120 
STATIC DEFINE JORCAI_SC_ORD := 121 
STATIC DEFINE JORCAI_SC_QTDDE := 115 
STATIC DEFINE JORCAI_SC_REV := 118 
STATIC DEFINE JORCAI_SC_REV1 := 117 
STATIC DEFINE JORCAI_SC_UNID := 122 
STATIC DEFINE JORCAI_SC_VALPEC := 125 
STATIC DEFINE JORCAI_UNID := 102 
STATIC DEFINE JORCAI_VALPEC := 109 
#endregion

class JORCAI inherit DATAWINDOW 

	PROTECT oDBORCA as DataColumn
	PROTECT oDBORD as DataColumn
	PROTECT oDBQTDDE as DataColumn
	PROTECT oDBUNID as DataColumn
	PROTECT oDBDESCR as DataColumn
	PROTECT oDBVALPEC as DataColumn
	PROTECT oDBFERRA as DataColumn
	PROTECT oDBLOTEMIN as DataColumn
	PROTECT oDBOBSITEM as DataColumn
	protect oDCORD as RIGHTSLE
	protect oDCQTDDE as RIGHTSLE
	protect oDCUNID as SINGLELINEEDIT
	protect oDCDESCR as SINGLELINEEDIT
	protect oDCOBSITEM as SINGLELINEEDIT
	protect oDCOBSITE2 as SINGLELINEEDIT
	protect oDCOBSITE3 as SINGLELINEEDIT
	protect oDCOBSITE4 as SINGLELINEEDIT
	protect oDCOBSITE5 as SINGLELINEEDIT
	protect oDCVALPEC as SINGLELINEEDIT
	protect oDCFERRA as SINGLELINEEDIT
	protect oDCLOTEMIN as SINGLELINEEDIT
	protect oDCDESENHO as SINGLELINEEDIT
	protect oDCREV as SINGLELINEEDIT
	protect oDCDATAREV as DATESLE
	protect oDCSC_QTDDE as FIXEDTEXT
	protect oDCSC_DESCR1 as FIXEDTEXT
	protect oDCSC_REV1 as FIXEDTEXT
	protect oDCSC_REV as FIXEDTEXT
	protect oDCSC_DESENHO as FIXEDTEXT
	protect oDCSC_ORCA as FIXEDTEXT
	protect oDCSC_ORD as FIXEDTEXT
	protect oDCSC_UNID as FIXEDTEXT
	protect oDCORCA as SINGLELINEEDIT
	protect oDCSC_DESCR as FIXEDTEXT
	protect oDCSC_VALPEC as FIXEDTEXT
	protect oDCSC_FERRA as FIXEDTEXT
	protect oDCSC_LOTEMIN as FIXEDTEXT
// 	instance ORD 
// 	instance QTDDE 
// 	instance UNID 
// 	instance DESCR 
// 	instance OBSITEM 
// 	instance OBSITE2 
// 	instance OBSITE3 
// 	instance OBSITE4 
// 	instance OBSITE5 
// 	instance VALPEC 
// 	instance FERRA 
// 	instance LOTEMIN 
// 	instance DESENHO 
// 	instance REV 
// 	instance DATAREV 
// 	instance ORCA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DATAREV() 
return self:FieldGet(#DATAREV)


assign DATAREV(uValue) 
self:FieldPut(#DATAREV, uValue)
return DATAREV := uValue


access DESCR() 
return self:FieldGet(#DESCR)


assign DESCR(uValue) 
self:FieldPut(#DESCR, uValue)
return DESCR := uValue


access DESENHO() 
return self:FieldGet(#DESENHO)


assign DESENHO(uValue) 
self:FieldPut(#DESENHO, uValue)
return DESENHO := uValue


access FERRA() 
return self:FieldGet(#FERRA)


assign FERRA(uValue) 
self:FieldPut(#FERRA, uValue)
return FERRA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JORCAI",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCORD := rightSle{self,ResourceID{JORCAI_ORD,_GetInst()}}
oDCORD:FieldSpec := PADRAO_NUM_03{}
oDCORD:HyperLabel := HyperLabel{#ORD,"Ord:",NULL_STRING,"ORCAI_ORD"}

oDCQTDDE := rightSle{self,ResourceID{JORCAI_QTDDE,_GetInst()}}
oDCQTDDE:FieldSpec := PADRAO_NUM_10{}
oDCQTDDE:HyperLabel := HyperLabel{#QTDDE,"Qtdde:",NULL_STRING,"ORCAI_QTDDE"}

oDCUNID := SingleLineEdit{self,ResourceID{JORCAI_UNID,_GetInst()}}
oDCUNID:FieldSpec := PADRAO_CHAR_02{}
oDCUNID:HyperLabel := HyperLabel{#UNID,"Unid:",NULL_STRING,"ORCAI_UNID"}

oDCDESCR := SingleLineEdit{self,ResourceID{JORCAI_DESCR,_GetInst()}}
oDCDESCR:FieldSpec := PADRAO_CHAR_150{}
oDCDESCR:HyperLabel := HyperLabel{#DESCR,"Descr:",NULL_STRING,"ORCAI_DESCR"}

oDCOBSITEM := SingleLineEdit{self,ResourceID{JORCAI_OBSITEM,_GetInst()}}
oDCOBSITEM:FieldSpec := PADRAO_CHAR_80{}
oDCOBSITEM:HyperLabel := HyperLabel{#OBSITEM,"Obs",NULL_STRING,"ORCAI_DESCR"}

oDCOBSITE2 := SingleLineEdit{self,ResourceID{JORCAI_OBSITE2,_GetInst()}}
oDCOBSITE2:FieldSpec := PADRAO_CHAR_80{}
oDCOBSITE2:HyperLabel := HyperLabel{#OBSITE2,"Obs",NULL_STRING,"ORCAI_DESCR"}

oDCOBSITE3 := SingleLineEdit{self,ResourceID{JORCAI_OBSITE3,_GetInst()}}
oDCOBSITE3:FieldSpec := PADRAO_CHAR_80{}
oDCOBSITE3:HyperLabel := HyperLabel{#OBSITE3,"Obs",NULL_STRING,"ORCAI_DESCR"}

oDCOBSITE4 := SingleLineEdit{self,ResourceID{JORCAI_OBSITE4,_GetInst()}}
oDCOBSITE4:FieldSpec := PADRAO_CHAR_80{}
oDCOBSITE4:HyperLabel := HyperLabel{#OBSITE4,"Obs",NULL_STRING,"ORCAI_DESCR"}

oDCOBSITE5 := SingleLineEdit{self,ResourceID{JORCAI_OBSITE5,_GetInst()}}
oDCOBSITE5:FieldSpec := PADRAO_CHAR_80{}
oDCOBSITE5:HyperLabel := HyperLabel{#OBSITE5,"Obs",NULL_STRING,"ORCAI_DESCR"}

oDCVALPEC := SingleLineEdit{self,ResourceID{JORCAI_VALPEC,_GetInst()}}
oDCVALPEC:FieldSpec := PADRAO_NUM_10_5{}
oDCVALPEC:HyperLabel := HyperLabel{#VALPEC,"V.Peça",NULL_STRING,"ORCAI_VALPEC"}

oDCFERRA := SingleLineEdit{self,ResourceID{JORCAI_FERRA,_GetInst()}}
oDCFERRA:FieldSpec := PADRAO_NUM_12_2{}
oDCFERRA:HyperLabel := HyperLabel{#FERRA,"V.Ferramenta",NULL_STRING,"ORCAI_FERRA"}

oDCLOTEMIN := SingleLineEdit{self,ResourceID{JORCAI_LOTEMIN,_GetInst()}}
oDCLOTEMIN:FieldSpec := PADRAO_NUM_08{}
oDCLOTEMIN:HyperLabel := HyperLabel{#LOTEMIN,"Lote Minimo:",NULL_STRING,"ORCAI_LOTEMIN"}

oDCDESENHO := SingleLineEdit{self,ResourceID{JORCAI_DESENHO,_GetInst()}}
oDCDESENHO:FieldSpec := padrao_char_24{}
oDCDESENHO:HyperLabel := HyperLabel{#DESENHO,"Desenho:",NULL_STRING,"CDI_DESENHO"}

oDCREV := SingleLineEdit{self,ResourceID{JORCAI_REV,_GetInst()}}
oDCREV:FieldSpec := padrao_char_20{}
oDCREV:HyperLabel := HyperLabel{#REV,"Rev:",NULL_STRING,"CDI_REV"}

oDCDATAREV := DateSle{self,ResourceID{JORCAI_DATAREV,_GetInst()}}
oDCDATAREV:FieldSpec := DATE_FIELD{}
oDCDATAREV:HyperLabel := HyperLabel{#DATAREV,"Data",NULL_STRING,"CDI_REV"}

oDCSC_QTDDE := FixedText{self,ResourceID{JORCAI_SC_QTDDE,_GetInst()}}
oDCSC_QTDDE:HyperLabel := HyperLabel{#SC_QTDDE,"Qtdde:",NULL_STRING,NULL_STRING}

oDCSC_DESCR1 := FixedText{self,ResourceID{JORCAI_SC_DESCR1,_GetInst()}}
oDCSC_DESCR1:HyperLabel := HyperLabel{#SC_DESCR1,"Observação",NULL_STRING,NULL_STRING}

oDCSC_REV1 := FixedText{self,ResourceID{JORCAI_SC_REV1,_GetInst()}}
oDCSC_REV1:HyperLabel := HyperLabel{#SC_REV1,"Data",NULL_STRING,NULL_STRING}

oDCSC_REV := FixedText{self,ResourceID{JORCAI_SC_REV,_GetInst()}}
oDCSC_REV:HyperLabel := HyperLabel{#SC_REV,"Rev:",NULL_STRING,NULL_STRING}

oDCSC_DESENHO := FixedText{self,ResourceID{JORCAI_SC_DESENHO,_GetInst()}}
oDCSC_DESENHO:HyperLabel := HyperLabel{#SC_DESENHO,"Desenho:",NULL_STRING,NULL_STRING}

oDCSC_ORCA := FixedText{self,ResourceID{JORCAI_SC_ORCA,_GetInst()}}
oDCSC_ORCA:HyperLabel := HyperLabel{#SC_ORCA,"Orca:",NULL_STRING,NULL_STRING}

oDCSC_ORD := FixedText{self,ResourceID{JORCAI_SC_ORD,_GetInst()}}
oDCSC_ORD:HyperLabel := HyperLabel{#SC_ORD,"Ord:",NULL_STRING,NULL_STRING}

oDCSC_UNID := FixedText{self,ResourceID{JORCAI_SC_UNID,_GetInst()}}
oDCSC_UNID:HyperLabel := HyperLabel{#SC_UNID,"Unidade:",NULL_STRING,NULL_STRING}

oDCORCA := SingleLineEdit{self,ResourceID{JORCAI_ORCA,_GetInst()}}
oDCORCA:FieldSpec := PADRAO_NUM_08{}
oDCORCA:HyperLabel := HyperLabel{#ORCA,"Orca:",NULL_STRING,"ORCAI_ORCA"}
oDCORCA:BackGround := aBrushes[1]
oDCORCA:Font(aFonts[1], FALSE)

oDCSC_DESCR := FixedText{self,ResourceID{JORCAI_SC_DESCR,_GetInst()}}
oDCSC_DESCR:HyperLabel := HyperLabel{#SC_DESCR,"Descrição:",NULL_STRING,NULL_STRING}

oDCSC_VALPEC := FixedText{self,ResourceID{JORCAI_SC_VALPEC,_GetInst()}}
oDCSC_VALPEC:HyperLabel := HyperLabel{#SC_VALPEC,"Valor Peça:",NULL_STRING,NULL_STRING}

oDCSC_FERRA := FixedText{self,ResourceID{JORCAI_SC_FERRA,_GetInst()}}
oDCSC_FERRA:HyperLabel := HyperLabel{#SC_FERRA,"Ferramental:",NULL_STRING,NULL_STRING}

oDCSC_LOTEMIN := FixedText{self,ResourceID{JORCAI_SC_LOTEMIN,_GetInst()}}
oDCSC_LOTEMIN:HyperLabel := HyperLabel{#SC_LOTEMIN,"Lotemin:",NULL_STRING,NULL_STRING}

self:Caption := "Descr:"
self:HyperLabel := HyperLabel{#JORCAI,"Descr:",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBORCA := DataColumn{PADRAO_NUM_08{}}
oDBORCA:Width := 6
oDBORCA:HyperLabel := oDCORCA:HyperLabel 
oDBORCA:Caption := "Orca:"
oDBORCA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBORCA)

oDBORD := DataColumn{PADRAO_NUM_03{}}
oDBORD:Width := 5
oDBORD:HyperLabel := oDCORD:HyperLabel 
oDBORD:Caption := "Ord:"
self:Browser:AddColumn(oDBORD)

oDBQTDDE := DataColumn{PADRAO_NUM_10{}}
oDBQTDDE:Width := 13
oDBQTDDE:HyperLabel := oDCQTDDE:HyperLabel 
oDBQTDDE:Caption := "Qtdde:"
self:Browser:AddColumn(oDBQTDDE)

oDBUNID := DataColumn{PADRAO_CHAR_02{}}
oDBUNID:Width := 6
oDBUNID:HyperLabel := oDCUNID:HyperLabel 
oDBUNID:Caption := "Unid:"
self:Browser:AddColumn(oDBUNID)

oDBDESCR := DataColumn{PADRAO_CHAR_150{}}
oDBDESCR:Width := 14
oDBDESCR:HyperLabel := oDCDESCR:HyperLabel 
oDBDESCR:Caption := "Descr:"
self:Browser:AddColumn(oDBDESCR)

oDBVALPEC := DataColumn{PADRAO_NUM_10_5{}}
oDBVALPEC:Width := 9
oDBVALPEC:HyperLabel := oDCVALPEC:HyperLabel 
oDBVALPEC:Caption := "V.Peça"
self:Browser:AddColumn(oDBVALPEC)

oDBFERRA := DataColumn{PADRAO_NUM_12_2{}}
oDBFERRA:Width := 12
oDBFERRA:HyperLabel := oDCFERRA:HyperLabel 
oDBFERRA:Caption := "V.Ferramenta"
self:Browser:AddColumn(oDBFERRA)

oDBLOTEMIN := DataColumn{PADRAO_NUM_08{}}
oDBLOTEMIN:Width := 11
oDBLOTEMIN:HyperLabel := oDCLOTEMIN:HyperLabel 
oDBLOTEMIN:Caption := "Lote Minimo:"
self:Browser:AddColumn(oDBLOTEMIN)

oDBOBSITEM := DataColumn{PADRAO_CHAR_80{}}
oDBOBSITEM:Width := 18
oDBOBSITEM:HyperLabel := oDCOBSITEM:HyperLabel 
oDBOBSITEM:Caption := "Obs"
self:Browser:AddColumn(oDBOBSITEM)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LOTEMIN() 
return self:FieldGet(#LOTEMIN)


assign LOTEMIN(uValue) 
self:FieldPut(#LOTEMIN, uValue)
return LOTEMIN := uValue


access OBSITE2() 
return self:FieldGet(#OBSITE2)


assign OBSITE2(uValue) 
self:FieldPut(#OBSITE2, uValue)
return OBSITE2 := uValue


access OBSITE3() 
return self:FieldGet(#OBSITE3)


assign OBSITE3(uValue) 
self:FieldPut(#OBSITE3, uValue)
return OBSITE3 := uValue


access OBSITE4() 
return self:FieldGet(#OBSITE4)


assign OBSITE4(uValue) 
self:FieldPut(#OBSITE4, uValue)
return OBSITE4 := uValue


access OBSITE5() 
return self:FieldGet(#OBSITE5)


assign OBSITE5(uValue) 
self:FieldPut(#OBSITE5, uValue)
return OBSITE5 := uValue


access OBSITEM() 
return self:FieldGet(#OBSITEM)


assign OBSITEM(uValue) 
self:FieldPut(#OBSITEM, uValue)
return OBSITEM := uValue


access ORCA() 
return self:FieldGet(#ORCA)


assign ORCA(uValue) 
self:FieldPut(#ORCA, uValue)
return ORCA := uValue


access ORD() 
return self:FieldGet(#ORD)


assign ORD(uValue) 
self:FieldPut(#ORD, uValue)
return ORD := uValue


access QTDDE() 
return self:FieldGet(#QTDDE)


assign QTDDE(uValue) 
self:FieldPut(#QTDDE, uValue)
return QTDDE := uValue


access REV() 
return self:FieldGet(#REV)


assign REV(uValue) 
self:FieldPut(#REV, uValue)
return REV := uValue


access UNID() 
return self:FieldGet(#UNID)


assign UNID(uValue) 
self:FieldPut(#UNID, uValue)
return UNID := uValue


access VALPEC() 
return self:FieldGet(#VALPEC)


assign VALPEC(uValue) 
self:FieldPut(#VALPEC, uValue)
return VALPEC := uValue


END CLASS
