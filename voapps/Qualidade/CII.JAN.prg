#region DEFINES
STATIC DEFINE JCII_CENC := 111 
STATIC DEFINE JCII_CESPE := 110 
STATIC DEFINE JCII_CI := 100 
STATIC DEFINE JCII_DESVIO := 107 
STATIC DEFINE JCII_ENC := 106 
STATIC DEFINE JCII_ESPE := 102 
STATIC DEFINE JCII_ITEM := 101 
STATIC DEFINE JCII_LAUDO := 108 
STATIC DEFINE JCII_LOCALI := 109 
STATIC DEFINE JCII_MAX := 103 
STATIC DEFINE JCII_MIN := 104 
STATIC DEFINE JCII_SC_CI := 112 
STATIC DEFINE JCII_SC_DESVIO := 119 
STATIC DEFINE JCII_SC_ENC := 118 
STATIC DEFINE JCII_SC_ESPE := 114 
STATIC DEFINE JCII_SC_ITEM := 113 
STATIC DEFINE JCII_SC_LAUDO := 120 
STATIC DEFINE JCII_SC_LOCALI := 121 
STATIC DEFINE JCII_SC_MAX := 115 
STATIC DEFINE JCII_SC_MIN := 116 
STATIC DEFINE JCII_SC_UND := 105 
STATIC DEFINE JCII_THEFIXEDTEXT10 := 122 
STATIC DEFINE JCII_THEFIXEDTEXT11 := 123 
STATIC DEFINE JCII_UND := 117 
#endregion

class JCII inherit DATAWINDOW 

	PROTECT oDBCI as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBLOCALI as DataColumn
	PROTECT oDBUND as DataColumn
	PROTECT oDBESPE as DataColumn
	PROTECT oDBCESPE as DataColumn
	PROTECT oDBMAX as DataColumn
	PROTECT oDBMIN as DataColumn
	PROTECT oDBENC as DataColumn
	PROTECT oDBCENC as DataColumn
	PROTECT oDBDESVIO as DataColumn
	PROTECT oDBLAUDO as DataColumn
	protect oDCCI as RIGHTSLE
	protect oDCITEM as RIGHTSLE
	protect oDCESPE as RIGHTSLE
	protect oDCMAX as RIGHTSLE
	protect oDCMIN as RIGHTSLE
	protect oDCSC_UND as FIXEDTEXT
	protect oDCENC as RIGHTSLE
	protect oDCDESVIO as RIGHTSLE
	protect oDCLAUDO as SINGLELINEEDIT
	protect oDCLOCALI as SINGLELINEEDIT
	protect oDCCESPE as SINGLELINEEDIT
	protect oDCCENC as SINGLELINEEDIT
	protect oDCSC_CI as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCSC_ESPE as FIXEDTEXT
	protect oDCSC_MAX as FIXEDTEXT
	protect oDCSC_MIN as FIXEDTEXT
	protect oDCUND as SINGLELINEEDIT
	protect oDCSC_ENC as FIXEDTEXT
	protect oDCSC_DESVIO as FIXEDTEXT
	protect oDCSC_LAUDO as FIXEDTEXT
	protect oDCSC_LOCALI as FIXEDTEXT
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oDCtheFixedText11 as FIXEDTEXT
// 	instance CI 
// 	instance ITEM 
// 	instance ESPE 
// 	instance MAX 
// 	instance MIN 
// 	instance ENC 
// 	instance DESVIO 
// 	instance LAUDO 
// 	instance LOCALI 
// 	instance CESPE 
// 	instance CENC 
// 	instance UND 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CENC() 
return self:FieldGet(#CENC)


assign CENC(uValue) 
self:FieldPut(#CENC, uValue)
return CENC := uValue


access CESPE() 
return self:FieldGet(#CESPE)


assign CESPE(uValue) 
self:FieldPut(#CESPE, uValue)
return CESPE := uValue


access CI() 
return self:FieldGet(#CI)


assign CI(uValue) 
self:FieldPut(#CI, uValue)
return CI := uValue


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

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCII",_GetInst()},iCtlID)

oDCCI := rightSle{self,ResourceID{JCII_CI,_GetInst()}}
oDCCI:FieldSpec := PADRAO_NUM_08{}
oDCCI:HyperLabel := HyperLabel{#CI,"Ci",NULL_STRING,"CII_CI"}

oDCITEM := rightSle{self,ResourceID{JCII_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_NUM_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item",NULL_STRING,"CII_ITEM"}

oDCESPE := rightSle{self,ResourceID{JCII_ESPE,_GetInst()}}
oDCESPE:FieldSpec := PADRAO_NUM_09_4{}
oDCESPE:HyperLabel := HyperLabel{#ESPE,"Espec.",NULL_STRING,"CII_ESPE"}

oDCMAX := rightSle{self,ResourceID{JCII_MAX,_GetInst()}}
oDCMAX:FieldSpec := PADRAO_NUM_09_4{}
oDCMAX:HyperLabel := HyperLabel{#MAX,"Max.",NULL_STRING,"CII_MAX"}

oDCMIN := rightSle{self,ResourceID{JCII_MIN,_GetInst()}}
oDCMIN:FieldSpec := PADRAO_NUM_09_4{}
oDCMIN:HyperLabel := HyperLabel{#MIN,"Min.",NULL_STRING,"CII_MIN"}

oDCSC_UND := FixedText{self,ResourceID{JCII_SC_UND,_GetInst()}}
oDCSC_UND:HyperLabel := HyperLabel{#SC_UND,"Und:",NULL_STRING,NULL_STRING}

oDCENC := rightSle{self,ResourceID{JCII_ENC,_GetInst()}}
oDCENC:FieldSpec := PADRAO_NUM_09_4{}
oDCENC:HyperLabel := HyperLabel{#ENC,"Enc.",NULL_STRING,"CII_ENC"}

oDCDESVIO := rightSle{self,ResourceID{JCII_DESVIO,_GetInst()}}
oDCDESVIO:FieldSpec := PADRAO_NUM_09_4{}
oDCDESVIO:HyperLabel := HyperLabel{#DESVIO,"Desvio",NULL_STRING,"CII_DESVIO"}

oDCLAUDO := SingleLineEdit{self,ResourceID{JCII_LAUDO,_GetInst()}}
oDCLAUDO:FieldSpec := PADRAO_CHAR_01{}
oDCLAUDO:HyperLabel := HyperLabel{#LAUDO,"Laudo",NULL_STRING,"CII_LAUDO"}

oDCLOCALI := SingleLineEdit{self,ResourceID{JCII_LOCALI,_GetInst()}}
oDCLOCALI:FieldSpec := PADRAO_CHAR_30{}
oDCLOCALI:HyperLabel := HyperLabel{#LOCALI,"Local",NULL_STRING,"CII_LOCALI"}

oDCCESPE := SingleLineEdit{self,ResourceID{JCII_CESPE,_GetInst()}}
oDCCESPE:FieldSpec := PADRAO_CHAR_40{}
oDCCESPE:HyperLabel := HyperLabel{#CESPE,"Enc.",NULL_STRING,"CII_ENC"}

oDCCENC := SingleLineEdit{self,ResourceID{JCII_CENC,_GetInst()}}
oDCCENC:FieldSpec := PADRAO_CHAR_30{}
oDCCENC:HyperLabel := HyperLabel{#CENC,"Enc.",NULL_STRING,"CII_ENC"}

oDCSC_CI := FixedText{self,ResourceID{JCII_SC_CI,_GetInst()}}
oDCSC_CI:HyperLabel := HyperLabel{#SC_CI,"Ci:",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JCII_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCSC_ESPE := FixedText{self,ResourceID{JCII_SC_ESPE,_GetInst()}}
oDCSC_ESPE:HyperLabel := HyperLabel{#SC_ESPE,"Espe:",NULL_STRING,NULL_STRING}

oDCSC_MAX := FixedText{self,ResourceID{JCII_SC_MAX,_GetInst()}}
oDCSC_MAX:HyperLabel := HyperLabel{#SC_MAX,"Max:",NULL_STRING,NULL_STRING}

oDCSC_MIN := FixedText{self,ResourceID{JCII_SC_MIN,_GetInst()}}
oDCSC_MIN:HyperLabel := HyperLabel{#SC_MIN,"Min:",NULL_STRING,NULL_STRING}

oDCUND := SingleLineEdit{self,ResourceID{JCII_UND,_GetInst()}}
oDCUND:FieldSpec := PADRAO_CHAR_20{}
oDCUND:HyperLabel := HyperLabel{#UND,"Und",NULL_STRING,"CII_UND"}

oDCSC_ENC := FixedText{self,ResourceID{JCII_SC_ENC,_GetInst()}}
oDCSC_ENC:HyperLabel := HyperLabel{#SC_ENC,"Enc:",NULL_STRING,NULL_STRING}

oDCSC_DESVIO := FixedText{self,ResourceID{JCII_SC_DESVIO,_GetInst()}}
oDCSC_DESVIO:HyperLabel := HyperLabel{#SC_DESVIO,"Desvio:",NULL_STRING,NULL_STRING}

oDCSC_LAUDO := FixedText{self,ResourceID{JCII_SC_LAUDO,_GetInst()}}
oDCSC_LAUDO:HyperLabel := HyperLabel{#SC_LAUDO,"Laudo:",NULL_STRING,NULL_STRING}

oDCSC_LOCALI := FixedText{self,ResourceID{JCII_SC_LOCALI,_GetInst()}}
oDCSC_LOCALI:HyperLabel := HyperLabel{#SC_LOCALI,"Locali:",NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{self,ResourceID{JCII_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"Espec.Desc.",NULL_STRING,NULL_STRING}

oDCtheFixedText11 := FixedText{self,ResourceID{JCII_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Enc.Desc.",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JCII,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCI := DataColumn{PADRAO_NUM_08{}}
oDBCI:Width := 4
oDBCI:HyperLabel := oDCCI:HyperLabel 
oDBCI:Caption := "Ci"
self:Browser:AddColumn(oDBCI)

oDBITEM := DataColumn{PADRAO_NUM_03{}}
oDBITEM:Width := 5
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item"
self:Browser:AddColumn(oDBITEM)

oDBLOCALI := DataColumn{PADRAO_CHAR_30{}}
oDBLOCALI:Width := 8
oDBLOCALI:HyperLabel := oDCLOCALI:HyperLabel 
oDBLOCALI:Caption := "Local"
self:Browser:AddColumn(oDBLOCALI)

oDBUND := DataColumn{PADRAO_CHAR_20{}}
oDBUND:Width := 5
oDBUND:HyperLabel := oDCUND:HyperLabel 
oDBUND:Caption := "Und"
self:Browser:AddColumn(oDBUND)

oDBESPE := DataColumn{PADRAO_NUM_09_4{}}
oDBESPE:Width := 7
oDBESPE:HyperLabel := oDCESPE:HyperLabel 
oDBESPE:Caption := "Espec."
self:Browser:AddColumn(oDBESPE)

oDBCESPE := DataColumn{PADRAO_CHAR_40{}}
oDBCESPE:Width := 9
oDBCESPE:HyperLabel := oDCCESPE:HyperLabel 
oDBCESPE:Caption := "Enc."
self:Browser:AddColumn(oDBCESPE)

oDBMAX := DataColumn{PADRAO_NUM_09_4{}}
oDBMAX:Width := 7
oDBMAX:HyperLabel := oDCMAX:HyperLabel 
oDBMAX:Caption := "Max."
self:Browser:AddColumn(oDBMAX)

oDBMIN := DataColumn{PADRAO_NUM_09_4{}}
oDBMIN:Width := 7
oDBMIN:HyperLabel := oDCMIN:HyperLabel 
oDBMIN:Caption := "Min."
self:Browser:AddColumn(oDBMIN)

oDBENC := DataColumn{PADRAO_NUM_09_4{}}
oDBENC:Width := 9
oDBENC:HyperLabel := oDCENC:HyperLabel 
oDBENC:Caption := "Enc."
self:Browser:AddColumn(oDBENC)

oDBCENC := DataColumn{PADRAO_CHAR_30{}}
oDBCENC:Width := 7
oDBCENC:HyperLabel := oDCCENC:HyperLabel 
oDBCENC:Caption := "Enc."
self:Browser:AddColumn(oDBCENC)

oDBDESVIO := DataColumn{PADRAO_NUM_09_4{}}
oDBDESVIO:Width := 8
oDBDESVIO:HyperLabel := oDCDESVIO:HyperLabel 
oDBDESVIO:Caption := "Desvio"
self:Browser:AddColumn(oDBDESVIO)

oDBLAUDO := DataColumn{PADRAO_CHAR_01{}}
oDBLAUDO:Width := 7
oDBLAUDO:HyperLabel := oDCLAUDO:HyperLabel 
oDBLAUDO:Caption := "Laudo"
self:Browser:AddColumn(oDBLAUDO)


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


access UND() 
return self:FieldGet(#UND)


assign UND(uValue) 
self:FieldPut(#UND, uValue)
return UND := uValue


END CLASS
