#region DEFINES
STATIC DEFINE JRNCINC_CODRNC := 111 
STATIC DEFINE JRNCINC_DISPO := 118 
STATIC DEFINE JRNCINC_OK := 119 
STATIC DEFINE JRNCINC_QTL := 109 
STATIC DEFINE JRNCINC_QTLN := 110 
STATIC DEFINE JRNCINC_RADIOBUTTON23 := 107 
STATIC DEFINE JRNCINC_RB1 := 106 
STATIC DEFINE JRNCINC_RB14 := 115 
STATIC DEFINE JRNCINC_RB2 := 105 
STATIC DEFINE JRNCINC_RB3 := 104 
STATIC DEFINE JRNCINC_RB4 := 103 
STATIC DEFINE JRNCINC_RB5 := 117 
STATIC DEFINE JRNCINC_RB6 := 114 
STATIC DEFINE JRNCINC_RB7 := 112 
STATIC DEFINE JRNCINC_RB8 := 116 
STATIC DEFINE JRNCINC_RB9 := 113 
STATIC DEFINE JRNCINC_RNC := 108 
STATIC DEFINE JRNCINC_SC_QTL := 101 
STATIC DEFINE JRNCINC_SC_QTL1 := 102 
STATIC DEFINE JRNCINC_SC_RNC := 100 
#endregion

class jrncinc inherit DATADIALOG 

	protect oDCSC_RNC as FIXEDTEXT
	protect oDCSC_QTL as FIXEDTEXT
	protect oDCSC_QTL1 as FIXEDTEXT
	protect oCCRB4 as RADIOBUTTON
	protect oCCRB3 as RADIOBUTTON
	protect oCCRB2 as RADIOBUTTON
	protect oCCRB1 as RADIOBUTTON
	protect oCCRadioButton23 as RADIOBUTTON
	protect oDCRNC as SINGLELINEEDIT
	protect oDCQTL as SINGLELINEEDIT
	protect oDCQTLN as SINGLELINEEDIT
	protect oDCCODRNC as RADIOBUTTONGROUP
	protect oCCRB7 as RADIOBUTTON
	protect oCCRB9 as RADIOBUTTON
	protect oCCRB6 as RADIOBUTTON
	protect oCCRB14 as RADIOBUTTON
	protect oCCRB8 as RADIOBUTTON
	protect oCCRB5 as RADIOBUTTON
	protect oDCDISPO as RADIOBUTTONGROUP
	protect oCCOK as PUSHBUTTON
// 	instance RNC 
// 	instance QTL 
// 	instance QTLN 
// 	instance CODRNC 
// 	instance DISPO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODRNC() 
return self:FieldGet(#CODRNC)


assign CODRNC(uValue) 
self:FieldPut(#CODRNC, uValue)
return CODRNC := uValue


access DISPO() 
return self:FieldGet(#DISPO)


assign DISPO(uValue) 
self:FieldPut(#DISPO, uValue)
return DISPO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jrncinc",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_RNC := FixedText{self,ResourceID{JRNCINC_SC_RNC,_GetInst()}}
oDCSC_RNC:HyperLabel := HyperLabel{#SC_RNC,"Rnc:",NULL_STRING,NULL_STRING}

oDCSC_QTL := FixedText{self,ResourceID{JRNCINC_SC_QTL,_GetInst()}}
oDCSC_QTL:HyperLabel := HyperLabel{#SC_QTL,"Qtde Não Conforme",NULL_STRING,NULL_STRING}

oDCSC_QTL1 := FixedText{self,ResourceID{JRNCINC_SC_QTL1,_GetInst()}}
oDCSC_QTL1:HyperLabel := HyperLabel{#SC_QTL1,"Qtde Lote:",NULL_STRING,NULL_STRING}

oCCRB4 := RadioButton{self,ResourceID{JRNCINC_RB4,_GetInst()}}
oCCRB4:HyperLabel := HyperLabel{#RB4,"Cliente",NULL_STRING,NULL_STRING}

oCCRB3 := RadioButton{self,ResourceID{JRNCINC_RB3,_GetInst()}}
oCCRB3:HyperLabel := HyperLabel{#RB3,"Final",NULL_STRING,NULL_STRING}

oCCRB2 := RadioButton{self,ResourceID{JRNCINC_RB2,_GetInst()}}
oCCRB2:HyperLabel := HyperLabel{#RB2,"Processo",NULL_STRING,NULL_STRING}

oCCRB1 := RadioButton{self,ResourceID{JRNCINC_RB1,_GetInst()}}
oCCRB1:HyperLabel := HyperLabel{#RB1,"Recebimento",NULL_STRING,NULL_STRING}

oCCRadioButton23 := RadioButton{self,ResourceID{JRNCINC_RADIOBUTTON23,_GetInst()}}
oCCRadioButton23:HyperLabel := HyperLabel{#RadioButton23,"Fornecedor",NULL_STRING,NULL_STRING}

oDCRNC := SingleLineEdit{self,ResourceID{JRNCINC_RNC,_GetInst()}}
oDCRNC:FieldSpec := PADRAO_NUM_08{}
oDCRNC:HyperLabel := HyperLabel{#RNC,"Rnc:",NULL_STRING,"RNC_RNC"}
oDCRNC:BackGround := aBrushes[1]
oDCRNC:Font(aFonts[1], FALSE)

oDCQTL := SingleLineEdit{self,ResourceID{JRNCINC_QTL,_GetInst()}}
oDCQTL:HyperLabel := HyperLabel{#QTL,"Qtl:",NULL_STRING,"RNC_QTL"}
oDCQTL:FieldSpec := PADRAO_NUM_08{}

oDCQTLN := SingleLineEdit{self,ResourceID{JRNCINC_QTLN,_GetInst()}}
oDCQTLN:FieldSpec := PADRAO_NUM_08{}
oDCQTLN:HyperLabel := HyperLabel{#QTLN,"Qtl:",NULL_STRING,"RNC_QTL"}

oCCRB7 := RadioButton{self,ResourceID{JRNCINC_RB7,_GetInst()}}
oCCRB7:HyperLabel := HyperLabel{#RB7,"Sucatar",NULL_STRING,NULL_STRING}

oCCRB9 := RadioButton{self,ResourceID{JRNCINC_RB9,_GetInst()}}
oCCRB9:HyperLabel := HyperLabel{#RB9,"Devolver ao Fornecedor",NULL_STRING,NULL_STRING}

oCCRB6 := RadioButton{self,ResourceID{JRNCINC_RB6,_GetInst()}}
oCCRB6:HyperLabel := HyperLabel{#RB6,"Aprovar Condicional",NULL_STRING,NULL_STRING}

oCCRB14 := RadioButton{self,ResourceID{JRNCINC_RB14,_GetInst()}}
oCCRB14:HyperLabel := HyperLabel{#RB14,"Seleção",NULL_STRING,NULL_STRING}

oCCRB8 := RadioButton{self,ResourceID{JRNCINC_RB8,_GetInst()}}
oCCRB8:HyperLabel := HyperLabel{#RB8,"Solicitar Aprovaçào com Desvios",NULL_STRING,NULL_STRING}

oCCRB5 := RadioButton{self,ResourceID{JRNCINC_RB5,_GetInst()}}
oCCRB5:HyperLabel := HyperLabel{#RB5,"Retrabalhar",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JRNCINC_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,"OK",NULL_STRING,NULL_STRING}

oDCCODRNC := RadioButtonGroup{self,ResourceID{JRNCINC_CODRNC,_GetInst()}}
oDCCODRNC:FillUsing({ ;
						{oCCRB4,"C"}, ;
						{oCCRB3,"F"}, ;
						{oCCRB2,"P"}, ;
						{oCCRB1,"R"}, ;
						{oCCRadioButton23,"O"} ;
						})
oDCCODRNC:HyperLabel := HyperLabel{#CODRNC,"Tipo de Não Conformidade",NULL_STRING,NULL_STRING}
oDCCODRNC:FieldSpec := PADRAO_CHAR_01{}

oDCDISPO := RadioButtonGroup{self,ResourceID{JRNCINC_DISPO,_GetInst()}}
oDCDISPO:FillUsing({ ;
						{oCCRB7,"U"}, ;
						{oCCRB9,"D"}, ;
						{oCCRB6,"A"}, ;
						{oCCRB14,"E"}, ;
						{oCCRB8,"S"}, ;
						{oCCRB5,"R"} ;
						})
oDCDISPO:HyperLabel := HyperLabel{#DISPO,"Disposição",NULL_STRING,NULL_STRING}
oDCDISPO:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "Rnc Inclusão"
self:HyperLabel := HyperLabel{#jrncinc,"Rnc Inclusão",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD OK( ) 
	SELF:ENDWINDOW()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	   FabCenterWindow( SELF )
	RETURN NIL


access QTL() 
return self:FieldGet(#QTL)


assign QTL(uValue) 
self:FieldPut(#QTL, uValue)
return QTL := uValue


access QTLN() 
return self:FieldGet(#QTLN)


assign QTLN(uValue) 
self:FieldPut(#QTLN, uValue)
return QTLN := uValue


access RNC() 
return self:FieldGet(#RNC)


assign RNC(uValue) 
self:FieldPut(#RNC, uValue)
return RNC := uValue


END CLASS
