#region DEFINES
STATIC DEFINE JRIFPR_BUSCAOV := 113 
STATIC DEFINE JRIFPR_FIXEDTEXT7 := 111 
STATIC DEFINE JRIFPR_FOTO := 115 
STATIC DEFINE JRIFPR_POROV := 112 
STATIC DEFINE JRIFPR_PRODUTO := 104 
STATIC DEFINE JRIFPR_QTDE := 105 
STATIC DEFINE JRIFPR_RIF1200 := 106 
STATIC DEFINE JRIFPR_RIFSEL := 110 
STATIC DEFINE JRIFPR_RIFTOT := 108 
STATIC DEFINE JRIFPR_RIFULT := 107 
STATIC DEFINE JRIFPR_SC_DESTINO2 := 114 
STATIC DEFINE JRIFPR_SC_PRODUTO := 100 
STATIC DEFINE JRIFPR_SC_RIFTOT := 102 
STATIC DEFINE JRIFPR_SC_RIFULT := 101 
STATIC DEFINE JRIFPR_SC_SEL100 := 103 
STATIC DEFINE JRIFPR_SEL100 := 109 
#endregion

class jrifpr inherit MYDataWindow 

	PROTECT oDBPRODUTO as DataColumn
	PROTECT oDBRIF1200 as DataColumn
	PROTECT oDBQTDE as DataColumn
	PROTECT oDBSEL100 as DataColumn
	PROTECT oDBRIFSEL as DataColumn
	PROTECT oDBRIFULT as DataColumn
	PROTECT oDBRIFTOT as DataColumn
	protect oDCSC_PRODUTO as FIXEDTEXT
	protect oDCSC_RIFULT as FIXEDTEXT
	protect oDCSC_RIFTOT as FIXEDTEXT
	protect oDCSC_SEL100 as FIXEDTEXT
	protect oDCPRODUTO as SINGLELINEEDIT
	protect oDCQTDE as SINGLELINEEDIT
	protect oDCRIF1200 as SINGLELINEEDIT
	protect oDCRIFULT as SINGLELINEEDIT
	protect oDCRIFTOT as SINGLELINEEDIT
	protect oDCSEL100 as SINGLELINEEDIT
	protect oDCRIFSEL as SINGLELINEEDIT
	protect oDCFixedText7 as FIXEDTEXT
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
// 	instance PRODUTO 
// 	instance QTDE 
// 	instance RIF1200 
// 	instance RIFULT 
// 	instance RIFTOT 
// 	instance SEL100 
// 	instance RIFSEL 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jrifpr",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_PRODUTO := FixedText{self,ResourceID{JRIFPR_SC_PRODUTO,_GetInst()}}
oDCSC_PRODUTO:HyperLabel := HyperLabel{#SC_PRODUTO,"Produto:",NULL_STRING,NULL_STRING}

oDCSC_RIFULT := FixedText{self,ResourceID{JRIFPR_SC_RIFULT,_GetInst()}}
oDCSC_RIFULT:HyperLabel := HyperLabel{#SC_RIFULT,"Ultima RIF",NULL_STRING,NULL_STRING}

oDCSC_RIFTOT := FixedText{self,ResourceID{JRIFPR_SC_RIFTOT,_GetInst()}}
oDCSC_RIFTOT:HyperLabel := HyperLabel{#SC_RIFTOT,"Qtde Total",NULL_STRING,NULL_STRING}

oDCSC_SEL100 := FixedText{self,ResourceID{JRIFPR_SC_SEL100,_GetInst()}}
oDCSC_SEL100:HyperLabel := HyperLabel{#SC_SEL100,"Seleção 100%",NULL_STRING,NULL_STRING}

oDCPRODUTO := SingleLineEdit{self,ResourceID{JRIFPR_PRODUTO,_GetInst()}}
oDCPRODUTO:FieldSpec := PADRAO_CHAR_24{}
oDCPRODUTO:HyperLabel := HyperLabel{#PRODUTO,"Produto:",NULL_STRING,"rifpr_PRODUTO"}
oDCPRODUTO:BackGround := aBrushes[1]
oDCPRODUTO:Font(aFonts[1], FALSE)

oDCQTDE := SingleLineEdit{self,ResourceID{JRIFPR_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := PADRAO_NUM_08{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"rifpr_QTDE"}
oDCQTDE:Font(aFonts[1], FALSE)
oDCQTDE:BackGround := aBrushes[1]

oDCRIF1200 := SingleLineEdit{self,ResourceID{JRIFPR_RIF1200,_GetInst()}}
oDCRIF1200:FieldSpec := PADRAO_NUM_08{}
oDCRIF1200:HyperLabel := HyperLabel{#RIF1200,"Rif1200:",NULL_STRING,"rifpr_RIF1200"}
oDCRIF1200:BackGround := aBrushes[1]
oDCRIF1200:Font(aFonts[1], FALSE)

oDCRIFULT := SingleLineEdit{self,ResourceID{JRIFPR_RIFULT,_GetInst()}}
oDCRIFULT:FieldSpec := PADRAO_NUM_08{}
oDCRIFULT:HyperLabel := HyperLabel{#RIFULT,"Rifult:",NULL_STRING,"rifpr_RIFULT"}
oDCRIFULT:BackGround := aBrushes[1]
oDCRIFULT:Font(aFonts[1], FALSE)

oDCRIFTOT := SingleLineEdit{self,ResourceID{JRIFPR_RIFTOT,_GetInst()}}
oDCRIFTOT:FieldSpec := PADRAO_NUM_15{}
oDCRIFTOT:HyperLabel := HyperLabel{#RIFTOT,"Riftot:",NULL_STRING,"rifpr_RIFTOT"}
oDCRIFTOT:BackGround := aBrushes[1]
oDCRIFTOT:Font(aFonts[1], FALSE)

oDCSEL100 := SingleLineEdit{self,ResourceID{JRIFPR_SEL100,_GetInst()}}
oDCSEL100:FieldSpec := DATE_FIELD{}
oDCSEL100:HyperLabel := HyperLabel{#SEL100,"Sel100:",NULL_STRING,"rifpr_SEL100"}
oDCSEL100:BackGround := aBrushes[1]
oDCSEL100:Font(aFonts[1], FALSE)

oDCRIFSEL := SingleLineEdit{self,ResourceID{JRIFPR_RIFSEL,_GetInst()}}
oDCRIFSEL:FieldSpec := PADRAO_NUM_08{}
oDCRIFSEL:HyperLabel := HyperLabel{#RIFSEL,"Rifsel:",NULL_STRING,"rifpr_RIFSEL"}
oDCRIFSEL:BackGround := aBrushes[1]
oDCRIFSEL:Font(aFonts[1], FALSE)

oDCFixedText7 := FixedText{self,ResourceID{JRIFPR_FIXEDTEXT7,_GetInst()}}
oDCFixedText7:HyperLabel := HyperLabel{#FixedText7,"1200 Pecas",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JRIFPR_POROV,_GetInst()}}
oCCporov:Image := ico_az{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaov := PushButton{self,ResourceID{JRIFPR_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ico_find{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JRIFPR_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JRIFPR_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}
oCCfoto:TooltipText := "Exibe foto do produto"

self:Caption := "Controle RIF/Produo"
self:HyperLabel := HyperLabel{#jrifpr,"Controle RIF/Produo",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBPRODUTO := DataColumn{PADRAO_CHAR_24{}}
oDBPRODUTO:Width := 14
oDBPRODUTO:HyperLabel := oDCPRODUTO:HyperLabel 
oDBPRODUTO:Caption := "Produto:"
oDBPRODUTO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBPRODUTO)

oDBRIF1200 := DataColumn{PADRAO_NUM_08{}}
oDBRIF1200:Width := 9
oDBRIF1200:HyperLabel := oDCRIF1200:HyperLabel 
oDBRIF1200:Caption := "Rif1200:"
oDBRIF1200:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRIF1200)

oDBQTDE := DataColumn{PADRAO_NUM_08{}}
oDBQTDE:Width := 6
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
oDBQTDE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBQTDE)

oDBSEL100 := DataColumn{DATE_FIELD{}}
oDBSEL100:Width := 8
oDBSEL100:HyperLabel := oDCSEL100:HyperLabel 
oDBSEL100:Caption := "Sel100:"
oDBSEL100:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSEL100)

oDBRIFSEL := DataColumn{PADRAO_NUM_08{}}
oDBRIFSEL:Width := 8
oDBRIFSEL:HyperLabel := oDCRIFSEL:HyperLabel 
oDBRIFSEL:Caption := "Rifsel:"
oDBRIFSEL:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRIFSEL)

oDBRIFULT := DataColumn{PADRAO_NUM_08{}}
oDBRIFULT:Width := 8
oDBRIFULT:HyperLabel := oDCRIFULT:HyperLabel 
oDBRIFULT:Caption := "Rifult:"
oDBRIFULT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRIFULT)

oDBRIFTOT := DataColumn{PADRAO_NUM_15{}}
oDBRIFTOT:Width := 12
oDBRIFTOT:HyperLabel := oDCRIFTOT:HyperLabel 
oDBRIFTOT:Caption := "Riftot:"
oDBRIFTOT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRIFTOT)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PRODUTO() 
return self:FieldGet(#PRODUTO)


assign PRODUTO(uValue) 
self:FieldPut(#PRODUTO, uValue)
return PRODUTO := uValue


access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


access RIF1200() 
return self:FieldGet(#RIF1200)


assign RIF1200(uValue) 
self:FieldPut(#RIF1200, uValue)
return RIF1200 := uValue


access RIFSEL() 
return self:FieldGet(#RIFSEL)


assign RIFSEL(uValue) 
self:FieldPut(#RIFSEL, uValue)
return RIFSEL := uValue


access RIFTOT() 
return self:FieldGet(#RIFTOT)


assign RIFTOT(uValue) 
self:FieldPut(#RIFTOT, uValue)
return RIFTOT := uValue


access RIFULT() 
return self:FieldGet(#RIFULT)


assign RIFULT(uValue) 
self:FieldPut(#RIFULT, uValue)
return RIFULT := uValue


access SEL100() 
return self:FieldGet(#SEL100)


assign SEL100(uValue) 
self:FieldPut(#SEL100, uValue)
return SEL100 := uValue


END CLASS
