#region DEFINES
STATIC DEFINE JTLP_ACUANO := 113 
STATIC DEFINE JTLP_ANO := 103 
STATIC DEFINE JTLP_ANUAL := 119 
STATIC DEFINE JTLP_APURANDO := 123 
STATIC DEFINE JTLP_APURAR := 112 
STATIC DEFINE JTLP_APURAR1 := 122 
STATIC DEFINE JTLP_APURAR2 := 125 
STATIC DEFINE JTLP_APURAR3 := 126 
STATIC DEFINE JTLP_BUSCANUM := 120 
STATIC DEFINE JTLP_DESCRI := 104 
STATIC DEFINE JTLP_DIAFIM := 101 
STATIC DEFINE JTLP_DIAINI := 100 
STATIC DEFINE JTLP_GROUPBOX1 := 127 
STATIC DEFINE JTLP_GROUPBOX2 := 128 
STATIC DEFINE JTLP_LIMPAR := 114 
STATIC DEFINE JTLP_MES := 102 
STATIC DEFINE JTLP_PEGCOMP := 115 
STATIC DEFINE JTLP_PORNUM := 121 
STATIC DEFINE JTLP_PROGBAR := 124 
STATIC DEFINE JTLP_SC_ANO := 109 
STATIC DEFINE JTLP_SC_DESCRI := 108 
STATIC DEFINE JTLP_SC_DIAFIM := 110 
STATIC DEFINE JTLP_SC_DIAINI := 106 
STATIC DEFINE JTLP_SC_MES := 107 
STATIC DEFINE JTLP_SC_SEQ := 105 
STATIC DEFINE JTLP_SC_SEQ1 := 116 
STATIC DEFINE JTLP_SC_SEQ2 := 117 
STATIC DEFINE JTLP_SEMES := 118 
STATIC DEFINE JTLP_SEMESTRAL := 122 
STATIC DEFINE JTLP_SEQ := 111 
#endregion

PARTIAL class JTLP inherit MYDataWindow 

	PROTECT oDBSEQ as DataColumn
	PROTECT oDBMES as DataColumn
	PROTECT oDBANO as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBANUAL as DataColumn
	PROTECT oDBSEMES as DataColumn
	protect oDCDIAINI as DATETIMEPICKER
	protect oDCDIAFIM as DATETIMEPICKER
	protect oDCMES as SINGLELINEEDIT
	protect oDCANO as SINGLELINEEDIT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSC_DIAINI as FIXEDTEXT
	protect oDCSC_MES as FIXEDTEXT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCSC_ANO as FIXEDTEXT
	protect oDCSC_DIAFIM as FIXEDTEXT
	protect oDCSEQ as SINGLELINEEDIT
	protect oCCAPURAR as PUSHBUTTON
	protect oCCACUANO as PUSHBUTTON
	protect oCCLimpar as PUSHBUTTON
	protect oCCpegcomp as PUSHBUTTON
	protect oDCSC_SEQ1 as FIXEDTEXT
	protect oDCSC_SEQ2 as FIXEDTEXT
	protect oDCSEMES as SINGLELINEEDIT
	protect oDCANUAL as SINGLELINEEDIT
	protect oCCBuscanum as PUSHBUTTON
	protect oCCPORNUM as PUSHBUTTON
	protect oCCAPURAR1 as PUSHBUTTON
	protect oDCApurando as FIXEDTEXT
	protect oDCProgBar as PROGRESSBAR
	protect oCCAPURAR2 as PUSHBUTTON
	protect oCCAPURAR3 as PUSHBUTTON
	protect oDCGroupBox1 as GROUPBOX
	protect oDCGroupBox2 as GROUPBOX
// 	instance MES 
// 	instance ANO 
// 	instance DESCRI 
// 	instance SEQ 
// 	instance SEMES 
// 	instance ANUAL 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANO() 
return self:FieldGet(#ANO)


assign ANO(uValue) 
self:FieldPut(#ANO, uValue)
return ANO := uValue


access ANUAL() 
return self:FieldGet(#ANUAL)


assign ANUAL(uValue) 
self:FieldPut(#ANUAL, uValue)
return ANUAL := uValue


METHOD APURAR2( )  

METHOD APURAR3( )  

access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JTLP",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDIAINI := DateTimePicker{self,ResourceID{JTLP_DIAINI,_GetInst()}}
oDCDIAINI:FieldSpec := DATE_FIELD{}
oDCDIAINI:HyperLabel := HyperLabel{#DIAINI,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDIAFIM := DateTimePicker{self,ResourceID{JTLP_DIAFIM,_GetInst()}}
oDCDIAFIM:FieldSpec := DATE_FIELD{}
oDCDIAFIM:HyperLabel := HyperLabel{#DIAFIM,NULL_STRING,NULL_STRING,NULL_STRING}

oDCMES := SingleLineEdit{self,ResourceID{JTLP_MES,_GetInst()}}
oDCMES:FieldSpec := PADRAO_NUM_02{}
oDCMES:HyperLabel := HyperLabel{#MES,"Mes:",NULL_STRING,"CRTLP_MES"}
oDCMES:BackGround := aBrushes[1]
oDCMES:Font(aFonts[1], FALSE)

oDCANO := SingleLineEdit{self,ResourceID{JTLP_ANO,_GetInst()}}
oDCANO:FieldSpec := PADRAO_NUM_04{}
oDCANO:HyperLabel := HyperLabel{#ANO,"Ano:",NULL_STRING,"CRTLP_ANO"}
oDCANO:BackGround := aBrushes[1]
oDCANO:Font(aFonts[1], FALSE)

oDCDESCRI := SingleLineEdit{self,ResourceID{JTLP_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_30{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Competencia",NULL_STRING,"CRTLP_DESCRI"}
oDCDESCRI:BackGround := aBrushes[1]
oDCDESCRI:Font(aFonts[1], FALSE)

oDCSC_SEQ := FixedText{self,ResourceID{JTLP_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSC_DIAINI := FixedText{self,ResourceID{JTLP_SC_DIAINI,_GetInst()}}
oDCSC_DIAINI:HyperLabel := HyperLabel{#SC_DIAINI,"Início",NULL_STRING,NULL_STRING}

oDCSC_MES := FixedText{self,ResourceID{JTLP_SC_MES,_GetInst()}}
oDCSC_MES:HyperLabel := HyperLabel{#SC_MES,"Mês:",NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{self,ResourceID{JTLP_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCSC_ANO := FixedText{self,ResourceID{JTLP_SC_ANO,_GetInst()}}
oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO,"Ano:",NULL_STRING,NULL_STRING}

oDCSC_DIAFIM := FixedText{self,ResourceID{JTLP_SC_DIAFIM,_GetInst()}}
oDCSC_DIAFIM:HyperLabel := HyperLabel{#SC_DIAFIM,"Fim",NULL_STRING,NULL_STRING}

oDCSEQ := SingleLineEdit{self,ResourceID{JTLP_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := PADRAO_NUM_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"CRTLP_SEQ"}
oDCSEQ:BackGround := aBrushes[1]
oDCSEQ:Font(aFonts[1], FALSE)

oCCAPURAR := PushButton{self,ResourceID{JTLP_APURAR,_GetInst()}}
oCCAPURAR:HyperLabel := HyperLabel{#APURAR,"CRM ",NULL_STRING,NULL_STRING}

oCCACUANO := PushButton{self,ResourceID{JTLP_ACUANO,_GetInst()}}
oCCACUANO:HyperLabel := HyperLabel{#ACUANO,"Semestra/Anual",NULL_STRING,NULL_STRING}

oCCLimpar := PushButton{self,ResourceID{JTLP_LIMPAR,_GetInst()}}
oCCLimpar:HyperLabel := HyperLabel{#Limpar,"Limpar",NULL_STRING,NULL_STRING}

oCCpegcomp := PushButton{self,ResourceID{JTLP_PEGCOMP,_GetInst()}}
oCCpegcomp:HyperLabel := HyperLabel{#pegcomp,"-->",NULL_STRING,NULL_STRING}

oDCSC_SEQ1 := FixedText{self,ResourceID{JTLP_SC_SEQ1,_GetInst()}}
oDCSC_SEQ1:HyperLabel := HyperLabel{#SC_SEQ1,"Semestral",NULL_STRING,NULL_STRING}

oDCSC_SEQ2 := FixedText{self,ResourceID{JTLP_SC_SEQ2,_GetInst()}}
oDCSC_SEQ2:HyperLabel := HyperLabel{#SC_SEQ2,"Anual",NULL_STRING,NULL_STRING}

oDCSEMES := SingleLineEdit{self,ResourceID{JTLP_SEMES,_GetInst()}}
oDCSEMES:FieldSpec := PADRAO_CHAR_01{}
oDCSEMES:HyperLabel := HyperLabel{#SEMES,"Semes",NULL_STRING,"CRTLP_SEQ"}
oDCSEMES:BackGround := aBrushes[1]
oDCSEMES:Font(aFonts[1], FALSE)

oDCANUAL := SingleLineEdit{self,ResourceID{JTLP_ANUAL,_GetInst()}}
oDCANUAL:FieldSpec := PADRAO_CHAR_01{}
oDCANUAL:HyperLabel := HyperLabel{#ANUAL,"Anual",NULL_STRING,"CRTLP_SEQ"}
oDCANUAL:BackGround := aBrushes[1]
oDCANUAL:Font(aFonts[1], FALSE)

oCCBuscanum := PushButton{self,ResourceID{JTLP_BUSCANUM,_GetInst()}}
oCCBuscanum:Image := ico_find{}
oCCBuscanum:HyperLabel := HyperLabel{#Buscanum,NULL_STRING,NULL_STRING,NULL_STRING}

oCCPORNUM := PushButton{self,ResourceID{JTLP_PORNUM,_GetInst()}}
oCCPORNUM:Image := ico_az{}
oCCPORNUM:HyperLabel := HyperLabel{#PORNUM,NULL_STRING,NULL_STRING,NULL_STRING}

oCCAPURAR1 := PushButton{self,ResourceID{JTLP_APURAR1,_GetInst()}}
oCCAPURAR1:HyperLabel := HyperLabel{#APURAR1,"RIRM/RIST",NULL_STRING,NULL_STRING}

oDCApurando := FixedText{self,ResourceID{JTLP_APURANDO,_GetInst()}}
oDCApurando:HyperLabel := HyperLabel{#Apurando,NULL_STRING,NULL_STRING,NULL_STRING}

oDCProgBar := ProgressBar{self,ResourceID{JTLP_PROGBAR,_GetInst()}}
oDCProgBar:Range := Range{0,100}
oDCProgBar:HyperLabel := HyperLabel{#ProgBar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCAPURAR2 := PushButton{self,ResourceID{JTLP_APURAR2,_GetInst()}}
oCCAPURAR2:HyperLabel := HyperLabel{#APURAR2,"CRM",NULL_STRING,NULL_STRING}

oCCAPURAR3 := PushButton{self,ResourceID{JTLP_APURAR3,_GetInst()}}
oCCAPURAR3:HyperLabel := HyperLabel{#APURAR3,"RIRM/RIST",NULL_STRING,NULL_STRING}

oDCGroupBox1 := GroupBox{self,ResourceID{JTLP_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Apurar Mensal -  IAC Prog Entrega",NULL_STRING,NULL_STRING}

oDCGroupBox2 := GroupBox{self,ResourceID{JTLP_GROUPBOX2,_GetInst()}}
oDCGroupBox2:HyperLabel := HyperLabel{#GroupBox2,"Apurar Mensal -  IAC AR",NULL_STRING,NULL_STRING}

self:Caption := "Sequencia de Apurações"
self:HyperLabel := HyperLabel{#JTLP,"Sequencia de Apurações",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBSEQ := DataColumn{PADRAO_NUM_03{}}
oDBSEQ:Width := 7
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
oDBSEQ:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSEQ)

oDBMES := DataColumn{PADRAO_NUM_02{}}
oDBMES:Width := 9
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "Mes:"
oDBMES:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMES)

oDBANO := DataColumn{PADRAO_NUM_04{}}
oDBANO:Width := 10
oDBANO:HyperLabel := oDCANO:HyperLabel 
oDBANO:Caption := "Ano:"
oDBANO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBANO)

oDBDESCRI := DataColumn{PADRAO_CHAR_30{}}
oDBDESCRI:Width := 16
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Competencia"
oDBDESCRI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDESCRI)

oDBANUAL := DataColumn{PADRAO_CHAR_01{}}
oDBANUAL:Width := 8
oDBANUAL:HyperLabel := oDCANUAL:HyperLabel 
oDBANUAL:Caption := "Anual"
oDBANUAL:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBANUAL)

oDBSEMES := DataColumn{PADRAO_CHAR_01{}}
oDBSEMES:Width := 10
oDBSEMES:HyperLabel := oDCSEMES:HyperLabel 
oDBSEMES:Caption := "Semes"
oDBSEMES:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSEMES)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MES() 
return self:FieldGet(#MES)


assign MES(uValue) 
self:FieldPut(#MES, uValue)
return MES := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	   FabCenterWindow( SELF )
	RETURN NIL


access SEMES() 
return self:FieldGet(#SEMES)


assign SEMES(uValue) 
self:FieldPut(#SEMES, uValue)
return SEMES := uValue


access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


END CLASS
