#region DEFINES
STATIC DEFINE JPTOALM_ANO := 104 
STATIC DEFINE JPTOALM_BUSCANUM := 115 
STATIC DEFINE JPTOALM_CMDORDENAR := 114 
STATIC DEFINE JPTOALM_DESCT := 105 
STATIC DEFINE JPTOALM_DESCTB := 106 
STATIC DEFINE JPTOALM_DESCTC := 107 
STATIC DEFINE JPTOALM_DESCTD := 108 
STATIC DEFINE JPTOALM_DESCTE := 109 
STATIC DEFINE JPTOALM_MES := 103 
STATIC DEFINE JPTOALM_SC_ANO := 101 
STATIC DEFINE JPTOALM_SC_DESCT := 102 
STATIC DEFINE JPTOALM_SC_DESCT1 := 110 
STATIC DEFINE JPTOALM_SC_DESCT2 := 111 
STATIC DEFINE JPTOALM_SC_DESCT3 := 112 
STATIC DEFINE JPTOALM_SC_DESCT4 := 113 
STATIC DEFINE JPTOALM_SC_MES := 100 
#endregion

PARTIAL class JPTOALM inherit MYDataWindow 

	PROTECT oDBMES as DataColumn
	PROTECT oDBANO as DataColumn
	PROTECT oDBDESCT as DataColumn
	PROTECT oDBDESCTB as DataColumn
	PROTECT oDBDESCTC as DataColumn
	PROTECT oDBDESCTD as DataColumn
	PROTECT oDBDESCTE as DataColumn
	protect oDCSC_MES as FIXEDTEXT
	protect oDCSC_ANO as FIXEDTEXT
	protect oDCSC_DESCT as FIXEDTEXT
	protect oDCMES as SINGLELINEEDIT
	protect oDCANO as SINGLELINEEDIT
	protect oDCDESCT as SINGLELINEEDIT
	protect oDCDESCTB as SINGLELINEEDIT
	protect oDCDESCTC as SINGLELINEEDIT
	protect oDCDESCTD as SINGLELINEEDIT
	protect oDCDESCTE as SINGLELINEEDIT
	protect oDCSC_DESCT1 as FIXEDTEXT
	protect oDCSC_DESCT2 as FIXEDTEXT
	protect oDCSC_DESCT3 as FIXEDTEXT
	protect oDCSC_DESCT4 as FIXEDTEXT
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
// 	instance MES 
// 	instance ANO 
// 	instance DESCT 
// 	instance DESCTB 
// 	instance DESCTC 
// 	instance DESCTD 
// 	instance DESCTE 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANO() 
return self:FieldGet(#ANO)


assign ANO(uValue) 
self:FieldPut(#ANO, uValue)
return ANO := uValue


access DESCT() 
return self:FieldGet(#DESCT)


assign DESCT(uValue) 
self:FieldPut(#DESCT, uValue)
return DESCT := uValue


access DESCTB() 
return self:FieldGet(#DESCTB)


assign DESCTB(uValue) 
self:FieldPut(#DESCTB, uValue)
return DESCTB := uValue


access DESCTC() 
return self:FieldGet(#DESCTC)


assign DESCTC(uValue) 
self:FieldPut(#DESCTC, uValue)
return DESCTC := uValue


access DESCTD() 
return self:FieldGet(#DESCTD)


assign DESCTD(uValue) 
self:FieldPut(#DESCTD, uValue)
return DESCTD := uValue


access DESCTE() 
return self:FieldGet(#DESCTE)


assign DESCTE(uValue) 
self:FieldPut(#DESCTE, uValue)
return DESCTE := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPTOALM",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_MES := FixedText{self,ResourceID{JPTOALM_SC_MES,_GetInst()}}
oDCSC_MES:HyperLabel := HyperLabel{#SC_MES,"Mes:",NULL_STRING,NULL_STRING}

oDCSC_ANO := FixedText{self,ResourceID{JPTOALM_SC_ANO,_GetInst()}}
oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO,"Ano:",NULL_STRING,NULL_STRING}

oDCSC_DESCT := FixedText{self,ResourceID{JPTOALM_SC_DESCT,_GetInst()}}
oDCSC_DESCT:HyperLabel := HyperLabel{#SC_DESCT,"Valor A",NULL_STRING,NULL_STRING}

oDCMES := SingleLineEdit{self,ResourceID{JPTOALM_MES,_GetInst()}}
oDCMES:FieldSpec := PADRAO_NUM_02{}
oDCMES:HyperLabel := HyperLabel{#MES,"Mes:",NULL_STRING,"FOPTOALM_MES"}
oDCMES:BackGround := aBrushes[1]

oDCANO := SingleLineEdit{self,ResourceID{JPTOALM_ANO,_GetInst()}}
oDCANO:FieldSpec := PADRAO_NUM_04{}
oDCANO:HyperLabel := HyperLabel{#ANO,"Ano:",NULL_STRING,"FOPTOALM_ANO"}
oDCANO:BackGround := aBrushes[1]

oDCDESCT := SingleLineEdit{self,ResourceID{JPTOALM_DESCT,_GetInst()}}
oDCDESCT:FieldSpec := PADRAO_NUM_10_2{}
oDCDESCT:HyperLabel := HyperLabel{#DESCT,"A",NULL_STRING,"FOPTOALM_DESCT"}

oDCDESCTB := SingleLineEdit{self,ResourceID{JPTOALM_DESCTB,_GetInst()}}
oDCDESCTB:FieldSpec := PADRAO_NUM_10_2{}
oDCDESCTB:HyperLabel := HyperLabel{#DESCTB,"B",NULL_STRING,"FOPTOALM_DESCTB"}

oDCDESCTC := SingleLineEdit{self,ResourceID{JPTOALM_DESCTC,_GetInst()}}
oDCDESCTC:FieldSpec := PADRAO_NUM_10_2{}
oDCDESCTC:HyperLabel := HyperLabel{#DESCTC,"C",NULL_STRING,"FOPTOALM_DESCTC"}

oDCDESCTD := SingleLineEdit{self,ResourceID{JPTOALM_DESCTD,_GetInst()}}
oDCDESCTD:FieldSpec := PADRAO_NUM_10_2{}
oDCDESCTD:HyperLabel := HyperLabel{#DESCTD,"D",NULL_STRING,"FOPTOALM_DESCTD"}

oDCDESCTE := SingleLineEdit{self,ResourceID{JPTOALM_DESCTE,_GetInst()}}
oDCDESCTE:FieldSpec := PADRAO_NUM_10_2{}
oDCDESCTE:HyperLabel := HyperLabel{#DESCTE,"E",NULL_STRING,"FOPTOALM_DESCTE"}

oDCSC_DESCT1 := FixedText{self,ResourceID{JPTOALM_SC_DESCT1,_GetInst()}}
oDCSC_DESCT1:HyperLabel := HyperLabel{#SC_DESCT1,"Valor B",NULL_STRING,NULL_STRING}

oDCSC_DESCT2 := FixedText{self,ResourceID{JPTOALM_SC_DESCT2,_GetInst()}}
oDCSC_DESCT2:HyperLabel := HyperLabel{#SC_DESCT2,"Valor C",NULL_STRING,NULL_STRING}

oDCSC_DESCT3 := FixedText{self,ResourceID{JPTOALM_SC_DESCT3,_GetInst()}}
oDCSC_DESCT3:HyperLabel := HyperLabel{#SC_DESCT3,"Valor D",NULL_STRING,NULL_STRING}

oDCSC_DESCT4 := FixedText{self,ResourceID{JPTOALM_SC_DESCT4,_GetInst()}}
oDCSC_DESCT4:HyperLabel := HyperLabel{#SC_DESCT4,"Valor E",NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JPTOALM_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JPTOALM_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

self:Caption := "Tabela Refeiçao"
self:HyperLabel := HyperLabel{#JPTOALM,"Tabela Refeiçao",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBMES := DataColumn{PADRAO_NUM_02{}}
oDBMES:Width := 5
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "Mes:"
oDBMES:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMES)

oDBANO := DataColumn{PADRAO_NUM_04{}}
oDBANO:Width := 7
oDBANO:HyperLabel := oDCANO:HyperLabel 
oDBANO:Caption := "Ano:"
oDBANO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBANO)

oDBDESCT := DataColumn{PADRAO_NUM_10_2{}}
oDBDESCT:Width := 9
oDBDESCT:HyperLabel := oDCDESCT:HyperLabel 
oDBDESCT:Caption := "A"
self:Browser:AddColumn(oDBDESCT)

oDBDESCTB := DataColumn{PADRAO_NUM_10_2{}}
oDBDESCTB:Width := 8
oDBDESCTB:HyperLabel := oDCDESCTB:HyperLabel 
oDBDESCTB:Caption := "B"
self:Browser:AddColumn(oDBDESCTB)

oDBDESCTC := DataColumn{PADRAO_NUM_10_2{}}
oDBDESCTC:Width := 8
oDBDESCTC:HyperLabel := oDCDESCTC:HyperLabel 
oDBDESCTC:Caption := "C"
self:Browser:AddColumn(oDBDESCTC)

oDBDESCTD := DataColumn{PADRAO_NUM_10_2{}}
oDBDESCTD:Width := 8
oDBDESCTD:HyperLabel := oDCDESCTD:HyperLabel 
oDBDESCTD:Caption := "D"
self:Browser:AddColumn(oDBDESCTD)

oDBDESCTE := DataColumn{PADRAO_NUM_10_2{}}
oDBDESCTE:Width := 8
oDBDESCTE:HyperLabel := oDCDESCTE:HyperLabel 
oDBDESCTE:Caption := "E"
self:Browser:AddColumn(oDBDESCTE)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MES() 
return self:FieldGet(#MES)


assign MES(uValue) 
self:FieldPut(#MES, uValue)
return MES := uValue


END CLASS
