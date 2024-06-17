#region DEFINES
STATIC DEFINE JFUN_BUSCACODIGO := 106 
STATIC DEFINE JFUN_CODIGO := 102 
STATIC DEFINE JFUN_JFUNTAB := 104 
STATIC DEFINE JFUN_NOME := 103 
STATIC DEFINE JFUN_PORCODIGO := 105 
STATIC DEFINE JFUN_SC_CODIGO := 100 
STATIC DEFINE JFUN_SC_NOME := 101 
STATIC DEFINE JFUN_TAB1_AREA := 106 
STATIC DEFINE JFUN_TAB1_CBO := 101 
STATIC DEFINE JFUN_TAB1_CBONEW := 100 
STATIC DEFINE JFUN_TAB1_FAIXA := 103 
STATIC DEFINE JFUN_TAB1_FNOME := 102 
STATIC DEFINE JFUN_TAB1_PUSHBUTTON1 := 114 
STATIC DEFINE JFUN_TAB1_PUSHBUTTON2 := 115 
STATIC DEFINE JFUN_TAB1_SC_AREA := 111 
STATIC DEFINE JFUN_TAB1_SC_CBO := 108 
STATIC DEFINE JFUN_TAB1_SC_CBO1 := 113 
STATIC DEFINE JFUN_TAB1_SC_CODMP02 := 112 
STATIC DEFINE JFUN_TAB1_SC_FAIXA := 110 
STATIC DEFINE JFUN_TAB1_SC_FNOME := 109 
STATIC DEFINE JFUN_TAB1_SC_VALOR := 107 
STATIC DEFINE JFUN_TAB1_TABTEC := 105 
STATIC DEFINE JFUN_TAB1_VALOR := 104 
STATIC DEFINE JFUNTAB_PAGE2_DES01 := 100 
STATIC DEFINE JFUNTAB_PAGE2_DES02 := 101 
STATIC DEFINE JFUNTAB_PAGE2_DES03 := 102 
STATIC DEFINE JFUNTAB_PAGE2_DES04 := 103 
STATIC DEFINE JFUNTAB_PAGE2_DES05 := 104 
STATIC DEFINE JFUNTAB_PAGE2_DES06 := 105 
STATIC DEFINE JFUNTAB_PAGE2_DES07 := 106 
STATIC DEFINE JFUNTAB_PAGE2_DES08 := 107 
STATIC DEFINE JFUNTAB_PAGE2_DES09 := 108 
STATIC DEFINE JFUNTAB_PAGE2_DES10 := 109 
STATIC DEFINE JFUNTAB_PAGE3_REQ01 := 100 
STATIC DEFINE JFUNTAB_PAGE3_REQ02 := 101 
STATIC DEFINE JFUNTAB_PAGE3_REQ03 := 102 
STATIC DEFINE JFUNTAB_PAGE3_REQ04 := 103 
STATIC DEFINE JFUNTAB_PAGE3_REQ05 := 104 
STATIC DEFINE JFUNTAB_PAGE3_REQ06 := 105 
STATIC DEFINE JFUNTAB_PAGE3_REQ07 := 106 
STATIC DEFINE JFUNTAB_PAGE3_REQ08 := 107 
STATIC DEFINE JFUNTAB_PAGE3_REQ09 := 108 
STATIC DEFINE JFUNTAB_PAGE3_REQ10 := 109 
STATIC DEFINE JFUNTAB_PAGE4_RED01 := 100 
STATIC DEFINE JFUNTAB_PAGE4_RED02 := 101 
STATIC DEFINE JFUNTAB_PAGE4_RED03 := 102 
STATIC DEFINE JFUNTAB_PAGE4_RED04 := 103 
STATIC DEFINE JFUNTAB_PAGE4_RED05 := 104 
STATIC DEFINE JFUNTAB_PAGE4_RED06 := 105 
STATIC DEFINE JFUNTAB_PAGE4_RED07 := 106 
STATIC DEFINE JFUNTAB_PAGE4_RED08 := 107 
STATIC DEFINE JFUNTAB_PAGE4_RED09 := 108 
STATIC DEFINE JFUNTAB_PAGE4_RED10 := 109 
#endregion

PARTIAL class JFUN inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCJFUNTAB as TABCONTROL
	protect oTPJFUN_TAB1 as JFUN_TAB1
	protect oTPJFUNTAB_PAGE2 as JFUNTAB_PAGE2
	protect oTPJFUNTAB_PAGE3 as JFUNTAB_PAGE3
	protect oTPJFUNTAB_PAGE4 as JFUNTAB_PAGE4
	protect oCCporcodigo as PUSHBUTTON
	protect oCCbuscacodigo as PUSHBUTTON
// 	instance CODIGO 
// 	instance NOME 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFUN",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{253,254,220}}

oDCSC_CODIGO := FixedText{self,ResourceID{JFUN_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JFUN_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JFUN_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_NUM_04{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"FUNCAO_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[1], FALSE)

oDCNOME := SingleLineEdit{self,ResourceID{JFUN_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"FUNCAO_NOME"}

oDCJFUNTAB := TabControl{self,ResourceID{JFUN_JFUNTAB,_GetInst()}}
oDCJFUNTAB:HyperLabel := HyperLabel{#JFUNTAB,NULL_STRING,NULL_STRING,NULL_STRING}

oCCporcodigo := PushButton{self,ResourceID{JFUN_PORCODIGO,_GetInst()}}
oCCporcodigo:Image := ico_az{}
oCCporcodigo:HyperLabel := HyperLabel{#porcodigo,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscacodigo := PushButton{self,ResourceID{JFUN_BUSCACODIGO,_GetInst()}}
oCCbuscacodigo:Image := ico_find{}
oCCbuscacodigo:HyperLabel := HyperLabel{#buscacodigo,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Cadastro de Funcao Folha"
self:HyperLabel := HyperLabel{#JFUN,"Cadastro de Funcao Folha",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_NUM_04{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_40{}}
oDBNOME:Width := 52
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#FormView)
oTPJFUN_TAB1 := JFUN_TAB1{self, 0}
oDCJFUNTAB:AppendTab(#JFUN_TAB1,"Cadastro",oTPJFUN_TAB1,0)
oTPJFUNTAB_PAGE2 := JFUNTAB_PAGE2{self, 0}
oDCJFUNTAB:AppendTab(#JFUNTAB_PAGE2,"Detalhamento",oTPJFUNTAB_PAGE2,0)
oTPJFUNTAB_PAGE3 := JFUNTAB_PAGE3{self, 0}
oDCJFUNTAB:AppendTab(#JFUNTAB_PAGE3,"Requisitos Necesarios",oTPJFUNTAB_PAGE3,0)
oTPJFUNTAB_PAGE4 := JFUNTAB_PAGE4{self, 0}
oDCJFUNTAB:AppendTab(#JFUNTAB_PAGE4,"Requisitos Desejaveis",oTPJFUNTAB_PAGE4,0)
oDCJFUNTAB:SelectTab(#JFUN_TAB1)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


END CLASS
PARTIAL class JFUN_TAB1 inherit DATAWINDOW 

	protect oDCCBOnew as SINGLELINEEDIT
	protect oDCCBO as SINGLELINEEDIT
	protect oDCFNOME as SINGLELINEEDIT
	protect oDCFAIXA as SINGLELINEEDIT
	protect oDCVALOR as RIGHTSLE
	protect oDCTABTEC as COMBOBOX
	protect oDCAREA as COMBOBOX
	protect oDCSC_VALOR as FIXEDTEXT
	protect oDCSC_CBO as FIXEDTEXT
	protect oDCSC_FNOME as FIXEDTEXT
	protect oDCSC_FAIXA as FIXEDTEXT
	protect oDCSC_AREA as FIXEDTEXT
	protect oDCSC_CODMP02 as FIXEDTEXT
	protect oDCSC_CBO1 as FIXEDTEXT
	protect oCCPushButton1 as PUSHBUTTON
	protect oCCPushButton2 as PUSHBUTTON
// 	instance CBOnew 
// 	instance CBO 
// 	instance FNOME 
// 	instance FAIXA 
// 	instance VALOR 
// 	instance TABTEC 
// 	instance AREA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AREA() 
return self:FieldGet(#AREA)


assign AREA(uValue) 
self:FieldPut(#AREA, uValue)
return AREA := uValue


access CBO() 
return self:FieldGet(#CBO)


assign CBO(uValue) 
self:FieldPut(#CBO, uValue)
return CBO := uValue


access CBOnew() 
return self:FieldGet(#CBOnew)


assign CBOnew(uValue) 
self:FieldPut(#CBOnew, uValue)
return CBOnew := uValue


access FAIXA() 
return self:FieldGet(#FAIXA)


assign FAIXA(uValue) 
self:FieldPut(#FAIXA, uValue)
return FAIXA := uValue


access FNOME() 
return self:FieldGet(#FNOME)


assign FNOME(uValue) 
self:FieldPut(#FNOME, uValue)
return FNOME := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFUN_TAB1",_GetInst()},iCtlID)

oDCCBOnew := SingleLineEdit{self,ResourceID{JFUN_TAB1_CBONEW,_GetInst()}}
oDCCBOnew:FieldSpec := PADRAO_CHAR_06{}
oDCCBOnew:HyperLabel := HyperLabel{#CBOnew,"Cbo:",NULL_STRING,"FUNCAO_CBO"}

oDCCBO := SingleLineEdit{self,ResourceID{JFUN_TAB1_CBO,_GetInst()}}
oDCCBO:FieldSpec := PADRAO_CHAR_05{}
oDCCBO:HyperLabel := HyperLabel{#CBO,"Cbo :",NULL_STRING,"FUNCAO_CBO"}

oDCFNOME := SingleLineEdit{self,ResourceID{JFUN_TAB1_FNOME,_GetInst()}}
oDCFNOME:FieldSpec := PADRAO_CHAR_17{}
oDCFNOME:HyperLabel := HyperLabel{#FNOME,"Fnome:",NULL_STRING,"FUNCAO_FNOME"}

oDCFAIXA := SingleLineEdit{self,ResourceID{JFUN_TAB1_FAIXA,_GetInst()}}
oDCFAIXA:FieldSpec := PADRAO_CHAR_02{}
oDCFAIXA:HyperLabel := HyperLabel{#FAIXA,"Faixa:",NULL_STRING,"FUNCAO_FAIXA"}

oDCVALOR := rightSle{self,ResourceID{JFUN_TAB1_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := PADRAO_NUM_11_2{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Valor:",NULL_STRING,"FUNCAO_VALOR"}

oDCTABTEC := combobox{self,ResourceID{JFUN_TAB1_TABTEC,_GetInst()}}
oDCTABTEC:FieldSpec := PADRAO_CHAR_10{}
oDCTABTEC:HyperLabel := HyperLabel{#TABTEC,NULL_STRING,NULL_STRING,NULL_STRING}

oDCAREA := combobox{self,ResourceID{JFUN_TAB1_AREA,_GetInst()}}
oDCAREA:FieldSpec := PADRAO_CHAR_02{}
oDCAREA:HyperLabel := HyperLabel{#AREA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_VALOR := FixedText{self,ResourceID{JFUN_TAB1_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor:",NULL_STRING,NULL_STRING}

oDCSC_CBO := FixedText{self,ResourceID{JFUN_TAB1_SC_CBO,_GetInst()}}
oDCSC_CBO:HyperLabel := HyperLabel{#SC_CBO,"Cbo Antigo:",NULL_STRING,NULL_STRING}

oDCSC_FNOME := FixedText{self,ResourceID{JFUN_TAB1_SC_FNOME,_GetInst()}}
oDCSC_FNOME:HyperLabel := HyperLabel{#SC_FNOME,"CogNome",NULL_STRING,NULL_STRING}

oDCSC_FAIXA := FixedText{self,ResourceID{JFUN_TAB1_SC_FAIXA,_GetInst()}}
oDCSC_FAIXA:HyperLabel := HyperLabel{#SC_FAIXA,"Faixa:",NULL_STRING,NULL_STRING}

oDCSC_AREA := FixedText{self,ResourceID{JFUN_TAB1_SC_AREA,_GetInst()}}
oDCSC_AREA:HyperLabel := HyperLabel{#SC_AREA,"Area:",NULL_STRING,NULL_STRING}

oDCSC_CODMP02 := FixedText{self,ResourceID{JFUN_TAB1_SC_CODMP02,_GetInst()}}
oDCSC_CODMP02:HyperLabel := HyperLabel{#SC_CODMP02,"Codigo Manager",NULL_STRING,NULL_STRING}

oDCSC_CBO1 := FixedText{self,ResourceID{JFUN_TAB1_SC_CBO1,_GetInst()}}
oDCSC_CBO1:HyperLabel := HyperLabel{#SC_CBO1,"CboNovo",NULL_STRING,NULL_STRING}

oCCPushButton1 := PushButton{self,ResourceID{JFUN_TAB1_PUSHBUTTON1,_GetInst()}}
oCCPushButton1:HyperLabel := HyperLabel{#PushButton1,"...",NULL_STRING,NULL_STRING}

oCCPushButton2 := PushButton{self,ResourceID{JFUN_TAB1_PUSHBUTTON2,_GetInst()}}
oCCPushButton2:HyperLabel := HyperLabel{#PushButton2,"...",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JFUN_TAB1,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PushButton1( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"FO_CBO.DBF"}
oESC:SHOW()	
IF Oesc:lok
   SELF:SERVER:FIELDPUT("CBO",oESC:CODIGO)
ENDIF					

METHOD PushButton2( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"FO_CBON.DBF"}
oESC:SHOW()	
IF Oesc:lok
   SELF:SERVER:FIELDPUT("CBONEW",oESC:CODIGO)
ENDIF	

access TABTEC() 
return self:FieldGet(#TABTEC)


assign TABTEC(uValue) 
self:FieldPut(#TABTEC, uValue)
return TABTEC := uValue


access VALOR() 
return self:FieldGet(#VALOR)


assign VALOR(uValue) 
self:FieldPut(#VALOR, uValue)
return VALOR := uValue


END CLASS
class JFUNTAB_Page2 inherit DATAWINDOW 

	protect oDCDES01 as SINGLELINEEDIT
	protect oDCDES02 as SINGLELINEEDIT
	protect oDCDES03 as SINGLELINEEDIT
	protect oDCDES04 as SINGLELINEEDIT
	protect oDCDES05 as SINGLELINEEDIT
	protect oDCDES06 as SINGLELINEEDIT
	protect oDCDES07 as SINGLELINEEDIT
	protect oDCDES08 as SINGLELINEEDIT
	protect oDCDES09 as SINGLELINEEDIT
	protect oDCDES10 as SINGLELINEEDIT
// 	instance DES01 
// 	instance DES02 
// 	instance DES03 
// 	instance DES04 
// 	instance DES05 
// 	instance DES06 
// 	instance DES07 
// 	instance DES08 
// 	instance DES09 
// 	instance DES10 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DES01() 
return self:FieldGet(#DES01)


assign DES01(uValue) 
self:FieldPut(#DES01, uValue)
return DES01 := uValue


access DES02() 
return self:FieldGet(#DES02)


assign DES02(uValue) 
self:FieldPut(#DES02, uValue)
return DES02 := uValue


access DES03() 
return self:FieldGet(#DES03)


assign DES03(uValue) 
self:FieldPut(#DES03, uValue)
return DES03 := uValue


access DES04() 
return self:FieldGet(#DES04)


assign DES04(uValue) 
self:FieldPut(#DES04, uValue)
return DES04 := uValue


access DES05() 
return self:FieldGet(#DES05)


assign DES05(uValue) 
self:FieldPut(#DES05, uValue)
return DES05 := uValue


access DES06() 
return self:FieldGet(#DES06)


assign DES06(uValue) 
self:FieldPut(#DES06, uValue)
return DES06 := uValue


access DES07() 
return self:FieldGet(#DES07)


assign DES07(uValue) 
self:FieldPut(#DES07, uValue)
return DES07 := uValue


access DES08() 
return self:FieldGet(#DES08)


assign DES08(uValue) 
self:FieldPut(#DES08, uValue)
return DES08 := uValue


access DES09() 
return self:FieldGet(#DES09)


assign DES09(uValue) 
self:FieldPut(#DES09, uValue)
return DES09 := uValue


access DES10() 
return self:FieldGet(#DES10)


assign DES10(uValue) 
self:FieldPut(#DES10, uValue)
return DES10 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFUNTAB_Page2",_GetInst()},iCtlID)

oDCDES01 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE2_DES01,_GetInst()}}
oDCDES01:FieldSpec := PADRAO_CHAR_70{}
oDCDES01:HyperLabel := HyperLabel{#DES01,NULL_STRING,NULL_STRING,"FUNCAO_DES01"}

oDCDES02 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE2_DES02,_GetInst()}}
oDCDES02:FieldSpec := PADRAO_CHAR_70{}
oDCDES02:HyperLabel := HyperLabel{#DES02,"Des02:",NULL_STRING,"FUNCAO_DES02"}

oDCDES03 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE2_DES03,_GetInst()}}
oDCDES03:FieldSpec := PADRAO_CHAR_70{}
oDCDES03:HyperLabel := HyperLabel{#DES03,"Des03:",NULL_STRING,"FUNCAO_DES03"}

oDCDES04 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE2_DES04,_GetInst()}}
oDCDES04:FieldSpec := PADRAO_CHAR_70{}
oDCDES04:HyperLabel := HyperLabel{#DES04,"Des04:",NULL_STRING,"FUNCAO_DES04"}

oDCDES05 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE2_DES05,_GetInst()}}
oDCDES05:FieldSpec := PADRAO_CHAR_70{}
oDCDES05:HyperLabel := HyperLabel{#DES05,"Des05:",NULL_STRING,"FUNCAO_DES05"}

oDCDES06 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE2_DES06,_GetInst()}}
oDCDES06:FieldSpec := PADRAO_CHAR_70{}
oDCDES06:HyperLabel := HyperLabel{#DES06,"Des06:",NULL_STRING,"FUNCAO_DES06"}

oDCDES07 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE2_DES07,_GetInst()}}
oDCDES07:FieldSpec := PADRAO_CHAR_70{}
oDCDES07:HyperLabel := HyperLabel{#DES07,"Des07:",NULL_STRING,"FUNCAO_DES07"}

oDCDES08 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE2_DES08,_GetInst()}}
oDCDES08:FieldSpec := PADRAO_CHAR_70{}
oDCDES08:HyperLabel := HyperLabel{#DES08,"Des08:",NULL_STRING,"FUNCAO_DES08"}

oDCDES09 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE2_DES09,_GetInst()}}
oDCDES09:FieldSpec := PADRAO_CHAR_70{}
oDCDES09:HyperLabel := HyperLabel{#DES09,"Des09:",NULL_STRING,"FUNCAO_DES09"}

oDCDES10 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE2_DES10,_GetInst()}}
oDCDES10:FieldSpec := PADRAO_CHAR_70{}
oDCDES10:HyperLabel := HyperLabel{#DES10,"Des10:",NULL_STRING,"FUNCAO_DES10"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JFUNTAB_Page2,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
class JFUNTAB_Page3 inherit DATAWINDOW 

	protect oDCREQ01 as SINGLELINEEDIT
	protect oDCREQ02 as SINGLELINEEDIT
	protect oDCREQ03 as SINGLELINEEDIT
	protect oDCREQ04 as SINGLELINEEDIT
	protect oDCREQ05 as SINGLELINEEDIT
	protect oDCREQ06 as SINGLELINEEDIT
	protect oDCREQ07 as SINGLELINEEDIT
	protect oDCREQ08 as SINGLELINEEDIT
	protect oDCREQ09 as SINGLELINEEDIT
	protect oDCREQ10 as SINGLELINEEDIT
// 	instance REQ01 
// 	instance REQ02 
// 	instance REQ03 
// 	instance REQ04 
// 	instance REQ05 
// 	instance REQ06 
// 	instance REQ07 
// 	instance REQ08 
// 	instance REQ09 
// 	instance REQ10 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFUNTAB_Page3",_GetInst()},iCtlID)

oDCREQ01 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE3_REQ01,_GetInst()}}
oDCREQ01:FieldSpec := PADRAO_CHAR_70{}
oDCREQ01:HyperLabel := HyperLabel{#REQ01,"Req01:",NULL_STRING,"FUNCAO_REQ01"}

oDCREQ02 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE3_REQ02,_GetInst()}}
oDCREQ02:FieldSpec := PADRAO_CHAR_70{}
oDCREQ02:HyperLabel := HyperLabel{#REQ02,"Req02:",NULL_STRING,"FUNCAO_REQ02"}

oDCREQ03 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE3_REQ03,_GetInst()}}
oDCREQ03:FieldSpec := PADRAO_CHAR_70{}
oDCREQ03:HyperLabel := HyperLabel{#REQ03,"Req03:",NULL_STRING,"FUNCAO_REQ03"}

oDCREQ04 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE3_REQ04,_GetInst()}}
oDCREQ04:FieldSpec := PADRAO_CHAR_70{}
oDCREQ04:HyperLabel := HyperLabel{#REQ04,"Req04:",NULL_STRING,"FUNCAO_REQ04"}

oDCREQ05 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE3_REQ05,_GetInst()}}
oDCREQ05:FieldSpec := PADRAO_CHAR_70{}
oDCREQ05:HyperLabel := HyperLabel{#REQ05,"Req05:",NULL_STRING,"FUNCAO_REQ05"}

oDCREQ06 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE3_REQ06,_GetInst()}}
oDCREQ06:FieldSpec := PADRAO_CHAR_70{}
oDCREQ06:HyperLabel := HyperLabel{#REQ06,"Req06:",NULL_STRING,"FUNCAO_REQ06"}

oDCREQ07 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE3_REQ07,_GetInst()}}
oDCREQ07:FieldSpec := PADRAO_CHAR_70{}
oDCREQ07:HyperLabel := HyperLabel{#REQ07,"Req07:",NULL_STRING,"FUNCAO_REQ07"}

oDCREQ08 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE3_REQ08,_GetInst()}}
oDCREQ08:FieldSpec := PADRAO_CHAR_70{}
oDCREQ08:HyperLabel := HyperLabel{#REQ08,"Req08:",NULL_STRING,"FUNCAO_REQ08"}

oDCREQ09 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE3_REQ09,_GetInst()}}
oDCREQ09:FieldSpec := PADRAO_CHAR_70{}
oDCREQ09:HyperLabel := HyperLabel{#REQ09,"Req09:",NULL_STRING,"FUNCAO_REQ09"}

oDCREQ10 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE3_REQ10,_GetInst()}}
oDCREQ10:FieldSpec := PADRAO_CHAR_70{}
oDCREQ10:HyperLabel := HyperLabel{#REQ10,"Req10:",NULL_STRING,"FUNCAO_REQ10"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JFUNTAB_Page3,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access REQ01() 
return self:FieldGet(#REQ01)


assign REQ01(uValue) 
self:FieldPut(#REQ01, uValue)
return REQ01 := uValue


access REQ02() 
return self:FieldGet(#REQ02)


assign REQ02(uValue) 
self:FieldPut(#REQ02, uValue)
return REQ02 := uValue


access REQ03() 
return self:FieldGet(#REQ03)


assign REQ03(uValue) 
self:FieldPut(#REQ03, uValue)
return REQ03 := uValue


access REQ04() 
return self:FieldGet(#REQ04)


assign REQ04(uValue) 
self:FieldPut(#REQ04, uValue)
return REQ04 := uValue


access REQ05() 
return self:FieldGet(#REQ05)


assign REQ05(uValue) 
self:FieldPut(#REQ05, uValue)
return REQ05 := uValue


access REQ06() 
return self:FieldGet(#REQ06)


assign REQ06(uValue) 
self:FieldPut(#REQ06, uValue)
return REQ06 := uValue


access REQ07() 
return self:FieldGet(#REQ07)


assign REQ07(uValue) 
self:FieldPut(#REQ07, uValue)
return REQ07 := uValue


access REQ08() 
return self:FieldGet(#REQ08)


assign REQ08(uValue) 
self:FieldPut(#REQ08, uValue)
return REQ08 := uValue


access REQ09() 
return self:FieldGet(#REQ09)


assign REQ09(uValue) 
self:FieldPut(#REQ09, uValue)
return REQ09 := uValue


access REQ10() 
return self:FieldGet(#REQ10)


assign REQ10(uValue) 
self:FieldPut(#REQ10, uValue)
return REQ10 := uValue


END CLASS
class JFUNTAB_Page4 inherit DATAWINDOW 

	protect oDCRED01 as SINGLELINEEDIT
	protect oDCRED02 as SINGLELINEEDIT
	protect oDCRED03 as SINGLELINEEDIT
	protect oDCRED04 as SINGLELINEEDIT
	protect oDCRED05 as SINGLELINEEDIT
	protect oDCRED06 as SINGLELINEEDIT
	protect oDCRED07 as SINGLELINEEDIT
	protect oDCRED08 as SINGLELINEEDIT
	protect oDCRED09 as SINGLELINEEDIT
	protect oDCRED10 as SINGLELINEEDIT
// 	instance RED01 
// 	instance RED02 
// 	instance RED03 
// 	instance RED04 
// 	instance RED05 
// 	instance RED06 
// 	instance RED07 
// 	instance RED08 
// 	instance RED09 
// 	instance RED10 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFUNTAB_Page4",_GetInst()},iCtlID)

oDCRED01 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE4_RED01,_GetInst()}}
oDCRED01:FieldSpec := PADRAO_CHAR_70{}
oDCRED01:HyperLabel := HyperLabel{#RED01,"Red01:",NULL_STRING,"FUNCAO_RED01"}

oDCRED02 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE4_RED02,_GetInst()}}
oDCRED02:FieldSpec := PADRAO_CHAR_70{}
oDCRED02:HyperLabel := HyperLabel{#RED02,"Red02:",NULL_STRING,"FUNCAO_RED02"}

oDCRED03 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE4_RED03,_GetInst()}}
oDCRED03:FieldSpec := PADRAO_CHAR_70{}
oDCRED03:HyperLabel := HyperLabel{#RED03,"Red03:",NULL_STRING,"FUNCAO_RED03"}

oDCRED04 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE4_RED04,_GetInst()}}
oDCRED04:FieldSpec := PADRAO_CHAR_70{}
oDCRED04:HyperLabel := HyperLabel{#RED04,"Red04:",NULL_STRING,"FUNCAO_RED04"}

oDCRED05 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE4_RED05,_GetInst()}}
oDCRED05:FieldSpec := PADRAO_CHAR_70{}
oDCRED05:HyperLabel := HyperLabel{#RED05,"Red05:",NULL_STRING,"FUNCAO_RED05"}

oDCRED06 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE4_RED06,_GetInst()}}
oDCRED06:FieldSpec := PADRAO_CHAR_70{}
oDCRED06:HyperLabel := HyperLabel{#RED06,"Red06:",NULL_STRING,"FUNCAO_RED06"}

oDCRED07 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE4_RED07,_GetInst()}}
oDCRED07:FieldSpec := PADRAO_CHAR_70{}
oDCRED07:HyperLabel := HyperLabel{#RED07,"Red07:",NULL_STRING,"FUNCAO_RED07"}

oDCRED08 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE4_RED08,_GetInst()}}
oDCRED08:FieldSpec := PADRAO_CHAR_70{}
oDCRED08:HyperLabel := HyperLabel{#RED08,"Red08:",NULL_STRING,"FUNCAO_RED08"}

oDCRED09 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE4_RED09,_GetInst()}}
oDCRED09:FieldSpec := PADRAO_CHAR_70{}
oDCRED09:HyperLabel := HyperLabel{#RED09,"Red09:",NULL_STRING,"FUNCAO_RED09"}

oDCRED10 := SingleLineEdit{self,ResourceID{JFUNTAB_PAGE4_RED10,_GetInst()}}
oDCRED10:FieldSpec := PADRAO_CHAR_70{}
oDCRED10:HyperLabel := HyperLabel{#RED10,"Red10:",NULL_STRING,"FUNCAO_RED10"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JFUNTAB_Page4,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access RED01() 
return self:FieldGet(#RED01)


assign RED01(uValue) 
self:FieldPut(#RED01, uValue)
return RED01 := uValue


access RED02() 
return self:FieldGet(#RED02)


assign RED02(uValue) 
self:FieldPut(#RED02, uValue)
return RED02 := uValue


access RED03() 
return self:FieldGet(#RED03)


assign RED03(uValue) 
self:FieldPut(#RED03, uValue)
return RED03 := uValue


access RED04() 
return self:FieldGet(#RED04)


assign RED04(uValue) 
self:FieldPut(#RED04, uValue)
return RED04 := uValue


access RED05() 
return self:FieldGet(#RED05)


assign RED05(uValue) 
self:FieldPut(#RED05, uValue)
return RED05 := uValue


access RED06() 
return self:FieldGet(#RED06)


assign RED06(uValue) 
self:FieldPut(#RED06, uValue)
return RED06 := uValue


access RED07() 
return self:FieldGet(#RED07)


assign RED07(uValue) 
self:FieldPut(#RED07, uValue)
return RED07 := uValue


access RED08() 
return self:FieldGet(#RED08)


assign RED08(uValue) 
self:FieldPut(#RED08, uValue)
return RED08 := uValue


access RED09() 
return self:FieldGet(#RED09)


assign RED09(uValue) 
self:FieldPut(#RED09, uValue)
return RED09 := uValue


access RED10() 
return self:FieldGet(#RED10)


assign RED10(uValue) 
self:FieldPut(#RED10, uValue)
return RED10 := uValue


END CLASS
