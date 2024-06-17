#region DEFINES
STATIC DEFINE JMS06_CODIGO := 105 
STATIC DEFINE JMS06_CODINT := 116 
STATIC DEFINE JMS06_CODMP01 := 115 
STATIC DEFINE JMS06_DESCRI := 108 
STATIC DEFINE JMS06_PCHORA := 109 
STATIC DEFINE JMS06_PCHORAMD := 112 
STATIC DEFINE JMS06_PCHORMED := 110 
STATIC DEFINE JMS06_SC_CODIGO := 100 
STATIC DEFINE JMS06_SC_CODIGO1 := 114 
STATIC DEFINE JMS06_SC_CODIGO2 := 117 
STATIC DEFINE JMS06_SC_DESCRI := 103 
STATIC DEFINE JMS06_SC_PCHORA := 104 
STATIC DEFINE JMS06_SC_PCHORA2 := 111 
STATIC DEFINE JMS06_SC_PCHORA3 := 113 
STATIC DEFINE JMS06_SC_SEQ := 101 
STATIC DEFINE JMS06_SC_SSQ := 102 
STATIC DEFINE JMS06_SEQ := 106 
STATIC DEFINE JMS06_SSQ := 107 
#endregion

class JMS06 inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBSSQ as DataColumn
	PROTECT oDBSEQ as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBPCHORA as DataColumn
	PROTECT oDBPCHORMED as DataColumn
	PROTECT oDBPCHORAMD as DataColumn
	PROTECT oDBCODMP01 as DataColumn
	PROTECT oDBCODINT as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSC_SSQ as FIXEDTEXT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCSC_PCHORA as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSEQ as SINGLELINEEDIT
	protect oDCSSQ as SINGLELINEEDIT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCPCHORA as SINGLELINEEDIT
	protect oDCPCHORMED as SINGLELINEEDIT
	protect oDCSC_PCHORA2 as FIXEDTEXT
	protect oDCPCHORAMD as SINGLELINEEDIT
	protect oDCSC_PCHORA3 as FIXEDTEXT
	protect oDCSC_CODIGO1 as FIXEDTEXT
	protect oDCCODMP01 as SINGLELINEEDIT
	protect oDCCODINT as SINGLELINEEDIT
	protect oDCSC_CODIGO2 as FIXEDTEXT
// 	instance CODIGO 
// 	instance SEQ 
// 	instance SSQ 
// 	instance DESCRI 
// 	instance PCHORA 
// 	instance PCHORMED 
// 	instance PCHORAMD 
// 	instance CODMP01 
// 	instance CODINT 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODINT() 
return self:FieldGet(#CODINT)


assign CODINT(uValue) 
self:FieldPut(#CODINT, uValue)
return CODINT := uValue


access CODMP01() 
return self:FieldGet(#CODMP01)


assign CODMP01(uValue) 
self:FieldPut(#CODMP01, uValue)
return CODMP01 := uValue


access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMS06",_GetInst()},iCtlID)

oDCSC_CODIGO := FixedText{self,ResourceID{JMS06_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_SEQ := FixedText{self,ResourceID{JMS06_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSC_SSQ := FixedText{self,ResourceID{JMS06_SC_SSQ,_GetInst()}}
oDCSC_SSQ:HyperLabel := HyperLabel{#SC_SSQ,"Ssq:",NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{self,ResourceID{JMS06_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCSC_PCHORA := FixedText{self,ResourceID{JMS06_SC_PCHORA,_GetInst()}}
oDCSC_PCHORA:HyperLabel := HyperLabel{#SC_PCHORA,"Pchora PCP:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JMS06_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"Ms06_CODIGO"}

oDCSEQ := SingleLineEdit{self,ResourceID{JMS06_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := padrao_num_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"Ms06_SEQ"}

oDCSSQ := SingleLineEdit{self,ResourceID{JMS06_SSQ,_GetInst()}}
oDCSSQ:FieldSpec := padrao_num_03{}
oDCSSQ:HyperLabel := HyperLabel{#SSQ,"Ssq:",NULL_STRING,"Ms06_SSQ"}

oDCDESCRI := SingleLineEdit{self,ResourceID{JMS06_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := padrao_char_70{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descrição:",NULL_STRING,"Ms06_DESCRI"}

oDCPCHORA := SingleLineEdit{self,ResourceID{JMS06_PCHORA,_GetInst()}}
oDCPCHORA:FieldSpec := padrao_num_06{}
oDCPCHORA:HyperLabel := HyperLabel{#PCHORA,"phPCP",NULL_STRING,"Ms06_PCHORA"}

oDCPCHORMED := SingleLineEdit{self,ResourceID{JMS06_PCHORMED,_GetInst()}}
oDCPCHORMED:FieldSpec := padrao_num_06{}
oDCPCHORMED:HyperLabel := HyperLabel{#PCHORMED,"phMed",NULL_STRING,"Ms06_PCHORA"}

oDCSC_PCHORA2 := FixedText{self,ResourceID{JMS06_SC_PCHORA2,_GetInst()}}
oDCSC_PCHORA2:HyperLabel := HyperLabel{#SC_PCHORA2,"Pchora Med",NULL_STRING,NULL_STRING}

oDCPCHORAMD := SingleLineEdit{self,ResourceID{JMS06_PCHORAMD,_GetInst()}}
oDCPCHORAMD:FieldSpec := padrao_num_06{}
oDCPCHORAMD:HyperLabel := HyperLabel{#PCHORAMD,"PHInt",NULL_STRING,"Ms06_PCHORA"}

oDCSC_PCHORA3 := FixedText{self,ResourceID{JMS06_SC_PCHORA3,_GetInst()}}
oDCSC_PCHORA3:HyperLabel := HyperLabel{#SC_PCHORA3,"Pchr MedInt",NULL_STRING,NULL_STRING}

oDCSC_CODIGO1 := FixedText{self,ResourceID{JMS06_SC_CODIGO1,_GetInst()}}
oDCSC_CODIGO1:HyperLabel := HyperLabel{#SC_CODIGO1,"Codigo:",NULL_STRING,NULL_STRING}

oDCCODMP01 := SingleLineEdit{self,ResourceID{JMS06_CODMP01,_GetInst()}}
oDCCODMP01:FieldSpec := padrao_char_12{}
oDCCODMP01:HyperLabel := HyperLabel{#CODMP01,"Equipamento",NULL_STRING,"Ms06_CODIGO"}

oDCCODINT := SingleLineEdit{self,ResourceID{JMS06_CODINT,_GetInst()}}
oDCCODINT:FieldSpec := padrao_char_12{}
oDCCODINT:HyperLabel := HyperLabel{#CODINT,"CodigoInt",NULL_STRING,"Ms06_CODIGO"}

oDCSC_CODIGO2 := FixedText{self,ResourceID{JMS06_SC_CODIGO2,_GetInst()}}
oDCSC_CODIGO2:HyperLabel := HyperLabel{#SC_CODIGO2,"Codigo Integrado",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JMS06,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 19
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBSSQ := DataColumn{padrao_num_03{}}
oDBSSQ:Width := 5
oDBSSQ:HyperLabel := oDCSSQ:HyperLabel 
oDBSSQ:Caption := "Ssq:"
self:Browser:AddColumn(oDBSSQ)

oDBSEQ := DataColumn{padrao_num_03{}}
oDBSEQ:Width := 5
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
self:Browser:AddColumn(oDBSEQ)

oDBDESCRI := DataColumn{padrao_char_70{}}
oDBDESCRI:Width := 21
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descrição:"
self:Browser:AddColumn(oDBDESCRI)

oDBPCHORA := DataColumn{padrao_num_06{}}
oDBPCHORA:Width := 9
oDBPCHORA:HyperLabel := oDCPCHORA:HyperLabel 
oDBPCHORA:Caption := "phPCP"
self:Browser:AddColumn(oDBPCHORA)

oDBPCHORMED := DataColumn{padrao_num_06{}}
oDBPCHORMED:Width := 9
oDBPCHORMED:HyperLabel := oDCPCHORMED:HyperLabel 
oDBPCHORMED:Caption := "phMed"
self:Browser:AddColumn(oDBPCHORMED)

oDBPCHORAMD := DataColumn{padrao_num_06{}}
oDBPCHORAMD:Width := 9
oDBPCHORAMD:HyperLabel := oDCPCHORAMD:HyperLabel 
oDBPCHORAMD:Caption := "PHInt"
self:Browser:AddColumn(oDBPCHORAMD)

oDBCODMP01 := DataColumn{padrao_char_12{}}
oDBCODMP01:Width := 17
oDBCODMP01:HyperLabel := oDCCODMP01:HyperLabel 
oDBCODMP01:Caption := "Equipamento"
self:Browser:AddColumn(oDBCODMP01)

oDBCODINT := DataColumn{padrao_char_12{}}
oDBCODINT:Width := 17
oDBCODINT:HyperLabel := oDCCODINT:HyperLabel 
oDBCODINT:Caption := "CodigoInt"
self:Browser:AddColumn(oDBCODINT)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PCHORA() 
return self:FieldGet(#PCHORA)


assign PCHORA(uValue) 
self:FieldPut(#PCHORA, uValue)
return PCHORA := uValue


access PCHORAMD() 
return self:FieldGet(#PCHORAMD)


assign PCHORAMD(uValue) 
self:FieldPut(#PCHORAMD, uValue)
return PCHORAMD := uValue


access PCHORMED() 
return self:FieldGet(#PCHORMED)


assign PCHORMED(uValue) 
self:FieldPut(#PCHORMED, uValue)
return PCHORMED := uValue


access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


access SSQ() 
return self:FieldGet(#SSQ)


assign SSQ(uValue) 
self:FieldPut(#SSQ, uValue)
return SSQ := uValue


END CLASS
