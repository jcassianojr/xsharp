#region DEFINES
STATIC DEFINE JPRNECA_BUSCACOD := 121 
STATIC DEFINE JPRNECA_CALC01 := 143 
STATIC DEFINE JPRNECA_CALC02 := 142 
STATIC DEFINE JPRNECA_CALC03 := 141 
STATIC DEFINE JPRNECA_CALC04 := 140 
STATIC DEFINE JPRNECA_CALC05 := 139 
STATIC DEFINE JPRNECA_CALC06 := 138 
STATIC DEFINE JPRNECA_CALC07 := 137 
STATIC DEFINE JPRNECA_CALC08 := 136 
STATIC DEFINE JPRNECA_CALC09 := 135 
STATIC DEFINE JPRNECA_CALC10 := 134 
STATIC DEFINE JPRNECA_CALC11 := 133 
STATIC DEFINE JPRNECA_CALC12 := 132 
STATIC DEFINE JPRNECA_CALC13 := 131 
STATIC DEFINE JPRNECA_CALC14 := 130 
STATIC DEFINE JPRNECA_CALC15 := 129 
STATIC DEFINE JPRNECA_CALC16 := 128 
STATIC DEFINE JPRNECA_CALC17 := 127 
STATIC DEFINE JPRNECA_CALC18 := 126 
STATIC DEFINE JPRNECA_CALC19 := 125 
STATIC DEFINE JPRNECA_CALC20 := 124 
STATIC DEFINE JPRNECA_CODIGO := 100 
STATIC DEFINE JPRNECA_ESCCOD := 144 
STATIC DEFINE JPRNECA_QTDE := 123 
STATIC DEFINE JPRNECA_QTDE01 := 101 
STATIC DEFINE JPRNECA_QTDE02 := 102 
STATIC DEFINE JPRNECA_QTDE03 := 103 
STATIC DEFINE JPRNECA_QTDE04 := 104 
STATIC DEFINE JPRNECA_QTDE05 := 105 
STATIC DEFINE JPRNECA_QTDE06 := 106 
STATIC DEFINE JPRNECA_QTDE07 := 107 
STATIC DEFINE JPRNECA_QTDE08 := 108 
STATIC DEFINE JPRNECA_QTDE09 := 109 
STATIC DEFINE JPRNECA_QTDE10 := 110 
STATIC DEFINE JPRNECA_QTDE11 := 111 
STATIC DEFINE JPRNECA_QTDE12 := 112 
STATIC DEFINE JPRNECA_QTDE13 := 113 
STATIC DEFINE JPRNECA_QTDE14 := 114 
STATIC DEFINE JPRNECA_QTDE15 := 115 
STATIC DEFINE JPRNECA_QTDE16 := 116 
STATIC DEFINE JPRNECA_QTDE17 := 117 
STATIC DEFINE JPRNECA_QTDE18 := 118 
STATIC DEFINE JPRNECA_QTDE19 := 119 
STATIC DEFINE JPRNECA_QTDE20 := 120 
STATIC DEFINE JPRNECA_SC_CODIGO := 122 
#endregion

class jprneca inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCQTDE01 as RIGHTSLE
	protect oDCQTDE02 as RIGHTSLE
	protect oDCQTDE03 as RIGHTSLE
	protect oDCQTDE04 as RIGHTSLE
	protect oDCQTDE05 as RIGHTSLE
	protect oDCQTDE06 as RIGHTSLE
	protect oDCQTDE07 as RIGHTSLE
	protect oDCQTDE08 as RIGHTSLE
	protect oDCQTDE09 as RIGHTSLE
	protect oDCQTDE10 as RIGHTSLE
	protect oDCQTDE11 as RIGHTSLE
	protect oDCQTDE12 as RIGHTSLE
	protect oDCQTDE13 as RIGHTSLE
	protect oDCQTDE14 as RIGHTSLE
	protect oDCQTDE15 as RIGHTSLE
	protect oDCQTDE16 as RIGHTSLE
	protect oDCQTDE17 as RIGHTSLE
	protect oDCQTDE18 as RIGHTSLE
	protect oDCQTDE19 as RIGHTSLE
	protect oDCQTDE20 as RIGHTSLE
	protect oCCbuscacod as PUSHBUTTON
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCQTDE as RIGHTSLE
	protect oCCCALC20 as PUSHBUTTON
	protect oCCCALC19 as PUSHBUTTON
	protect oCCCALC18 as PUSHBUTTON
	protect oCCCALC17 as PUSHBUTTON
	protect oCCCALC16 as PUSHBUTTON
	protect oCCCALC15 as PUSHBUTTON
	protect oCCCALC14 as PUSHBUTTON
	protect oCCCALC13 as PUSHBUTTON
	protect oCCCALC12 as PUSHBUTTON
	protect oCCCALC11 as PUSHBUTTON
	protect oCCCALC10 as PUSHBUTTON
	protect oCCCALC09 as PUSHBUTTON
	protect oCCCALC08 as PUSHBUTTON
	protect oCCCALC07 as PUSHBUTTON
	protect oCCCALC06 as PUSHBUTTON
	protect oCCCALC05 as PUSHBUTTON
	protect oCCCALC04 as PUSHBUTTON
	protect oCCCALC03 as PUSHBUTTON
	protect oCCCALC02 as PUSHBUTTON
	protect oCCCALC01 as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
// 	instance CODIGO 
// 	instance QTDE01 
// 	instance QTDE02 
// 	instance QTDE03 
// 	instance QTDE04 
// 	instance QTDE05 
// 	instance QTDE06 
// 	instance QTDE07 
// 	instance QTDE08 
// 	instance QTDE09 
// 	instance QTDE10 
// 	instance QTDE11 
// 	instance QTDE12 
// 	instance QTDE13 
// 	instance QTDE14 
// 	instance QTDE15 
// 	instance QTDE16 
// 	instance QTDE17 
// 	instance QTDE18 
// 	instance QTDE19 
// 	instance QTDE20 
// 	instance QTDE 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD buscacod( ) 
	SELF:KeyFind()

METHOD CALC01( ) 
SELF:CALCULA(1)

METHOD CALC02( ) 
SELF:CALCULA(2)

METHOD CALC03( ) 
SELF:CALCULA(3)

METHOD CALC04( ) 
SELF:CALCULA(4)

METHOD CALC05( ) 
SELF:CALCULA(5)

METHOD CALC06( ) 
SELF:CALCULA(6)

METHOD CALC07( ) 
SELF:CALCULA(7)

METHOD CALC08( ) 
SELF:CALCULA(8)

METHOD CALC09( ) 
SELF:CALCULA(9)

METHOD CALC10( ) 
SELF:CALCULA(10)

METHOD CALC11( ) 
SELF:CALCULA(11)

METHOD CALC12( ) 
SELF:CALCULA(12)

METHOD CALC13( ) 
SELF:CALCULA(13)

METHOD CALC14( ) 
SELF:CALCULA(14)

METHOD CALC15( ) 
SELF:CALCULA(15)

METHOD CALC16( ) 
SELF:CALCULA(16)

METHOD CALC17( ) 
SELF:CALCULA(17)

METHOD CALC18( ) 
SELF:CALCULA(18)

METHOD CALC19( ) 
SELF:CALCULA(19)

METHOD CALC20( ) 
SELF:CALCULA(20)

METHOD CALCULA(nINI) 
LOCAL X,nQTDE AS DWORD
LOCAL cVAR AS STRING
nQTDE:=SELF:QTDE
FOR X:=nINI TO 20
	cVAR:="QTDE"+StrZero(X,2)
    SELF:SERVER:FIELDPUT(cVAR,nQTDE)
NEXT

















	

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("PE","PE")	

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


METHOD esccod( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF ! IsNil(oESC:CODIGO)
    SELF:SERVER:FIELDPUT("CODIGO",oESC:CODIGO)
ENDIF	

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jprneca",_GetInst()},iCtlID)

oDCCODIGO := SingleLineEdit{self,ResourceID{JPRNECA_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"PRNEC_CODIGO"}

oDCQTDE01 := rightSle{self,ResourceID{JPRNECA_QTDE01,_GetInst()}}
oDCQTDE01:FieldSpec := PADRAO_NUM_06{}
oDCQTDE01:HyperLabel := HyperLabel{#QTDE01,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE02 := rightSle{self,ResourceID{JPRNECA_QTDE02,_GetInst()}}
oDCQTDE02:FieldSpec := PADRAO_NUM_06{}
oDCQTDE02:HyperLabel := HyperLabel{#QTDE02,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE03 := rightSle{self,ResourceID{JPRNECA_QTDE03,_GetInst()}}
oDCQTDE03:FieldSpec := PADRAO_NUM_06{}
oDCQTDE03:HyperLabel := HyperLabel{#QTDE03,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE04 := rightSle{self,ResourceID{JPRNECA_QTDE04,_GetInst()}}
oDCQTDE04:FieldSpec := PADRAO_NUM_06{}
oDCQTDE04:HyperLabel := HyperLabel{#QTDE04,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE05 := rightSle{self,ResourceID{JPRNECA_QTDE05,_GetInst()}}
oDCQTDE05:FieldSpec := PADRAO_NUM_06{}
oDCQTDE05:HyperLabel := HyperLabel{#QTDE05,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE06 := rightSle{self,ResourceID{JPRNECA_QTDE06,_GetInst()}}
oDCQTDE06:FieldSpec := PADRAO_NUM_06{}
oDCQTDE06:HyperLabel := HyperLabel{#QTDE06,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE07 := rightSle{self,ResourceID{JPRNECA_QTDE07,_GetInst()}}
oDCQTDE07:FieldSpec := PADRAO_NUM_06{}
oDCQTDE07:HyperLabel := HyperLabel{#QTDE07,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE08 := rightSle{self,ResourceID{JPRNECA_QTDE08,_GetInst()}}
oDCQTDE08:FieldSpec := PADRAO_NUM_06{}
oDCQTDE08:HyperLabel := HyperLabel{#QTDE08,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE09 := rightSle{self,ResourceID{JPRNECA_QTDE09,_GetInst()}}
oDCQTDE09:FieldSpec := PADRAO_NUM_06{}
oDCQTDE09:HyperLabel := HyperLabel{#QTDE09,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE10 := rightSle{self,ResourceID{JPRNECA_QTDE10,_GetInst()}}
oDCQTDE10:FieldSpec := PADRAO_NUM_06{}
oDCQTDE10:HyperLabel := HyperLabel{#QTDE10,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE11 := rightSle{self,ResourceID{JPRNECA_QTDE11,_GetInst()}}
oDCQTDE11:FieldSpec := PADRAO_NUM_06{}
oDCQTDE11:HyperLabel := HyperLabel{#QTDE11,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE12 := rightSle{self,ResourceID{JPRNECA_QTDE12,_GetInst()}}
oDCQTDE12:FieldSpec := PADRAO_NUM_06{}
oDCQTDE12:HyperLabel := HyperLabel{#QTDE12,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE13 := rightSle{self,ResourceID{JPRNECA_QTDE13,_GetInst()}}
oDCQTDE13:FieldSpec := PADRAO_NUM_06{}
oDCQTDE13:HyperLabel := HyperLabel{#QTDE13,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE14 := rightSle{self,ResourceID{JPRNECA_QTDE14,_GetInst()}}
oDCQTDE14:FieldSpec := PADRAO_NUM_06{}
oDCQTDE14:HyperLabel := HyperLabel{#QTDE14,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE15 := rightSle{self,ResourceID{JPRNECA_QTDE15,_GetInst()}}
oDCQTDE15:FieldSpec := PADRAO_NUM_06{}
oDCQTDE15:HyperLabel := HyperLabel{#QTDE15,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE16 := rightSle{self,ResourceID{JPRNECA_QTDE16,_GetInst()}}
oDCQTDE16:FieldSpec := PADRAO_NUM_06{}
oDCQTDE16:HyperLabel := HyperLabel{#QTDE16,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE17 := rightSle{self,ResourceID{JPRNECA_QTDE17,_GetInst()}}
oDCQTDE17:FieldSpec := PADRAO_NUM_06{}
oDCQTDE17:HyperLabel := HyperLabel{#QTDE17,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE18 := rightSle{self,ResourceID{JPRNECA_QTDE18,_GetInst()}}
oDCQTDE18:FieldSpec := PADRAO_NUM_06{}
oDCQTDE18:HyperLabel := HyperLabel{#QTDE18,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE19 := rightSle{self,ResourceID{JPRNECA_QTDE19,_GetInst()}}
oDCQTDE19:FieldSpec := PADRAO_NUM_06{}
oDCQTDE19:HyperLabel := HyperLabel{#QTDE19,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oDCQTDE20 := rightSle{self,ResourceID{JPRNECA_QTDE20,_GetInst()}}
oDCQTDE20:FieldSpec := PADRAO_NUM_06{}
oDCQTDE20:HyperLabel := HyperLabel{#QTDE20,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oCCbuscacod := PushButton{self,ResourceID{JPRNECA_BUSCACOD,_GetInst()}}
oCCbuscacod:Image := icO_find{}
oCCbuscacod:HyperLabel := HyperLabel{#buscacod,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JPRNECA_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCQTDE := rightSle{self,ResourceID{JPRNECA_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := PADRAO_NUM_06{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde01:",NULL_STRING,"PRNEC_QTDE01"}

oCCCALC20 := PushButton{self,ResourceID{JPRNECA_CALC20,_GetInst()}}
oCCCALC20:HyperLabel := HyperLabel{#CALC20,"20",NULL_STRING,NULL_STRING}
oCCCALC20:TooltipText := "Programa para  20 Entregas"

oCCCALC19 := PushButton{self,ResourceID{JPRNECA_CALC19,_GetInst()}}
oCCCALC19:HyperLabel := HyperLabel{#CALC19,"19",NULL_STRING,NULL_STRING}
oCCCALC19:TooltipText := "Programa para  19 Entregas"

oCCCALC18 := PushButton{self,ResourceID{JPRNECA_CALC18,_GetInst()}}
oCCCALC18:HyperLabel := HyperLabel{#CALC18,"18",NULL_STRING,NULL_STRING}
oCCCALC18:TooltipText := "Programa para  18 Entregas"

oCCCALC17 := PushButton{self,ResourceID{JPRNECA_CALC17,_GetInst()}}
oCCCALC17:HyperLabel := HyperLabel{#CALC17,"17",NULL_STRING,NULL_STRING}
oCCCALC17:TooltipText := "Programa para  17 Entregas"

oCCCALC16 := PushButton{self,ResourceID{JPRNECA_CALC16,_GetInst()}}
oCCCALC16:HyperLabel := HyperLabel{#CALC16,"16",NULL_STRING,NULL_STRING}
oCCCALC16:TooltipText := "Programa para  16 Entregas"

oCCCALC15 := PushButton{self,ResourceID{JPRNECA_CALC15,_GetInst()}}
oCCCALC15:HyperLabel := HyperLabel{#CALC15,"15",NULL_STRING,NULL_STRING}
oCCCALC15:TooltipText := "Programa para  15 Entregas"

oCCCALC14 := PushButton{self,ResourceID{JPRNECA_CALC14,_GetInst()}}
oCCCALC14:HyperLabel := HyperLabel{#CALC14,"14",NULL_STRING,NULL_STRING}
oCCCALC14:TooltipText := "Programa para  14 Entregas"

oCCCALC13 := PushButton{self,ResourceID{JPRNECA_CALC13,_GetInst()}}
oCCCALC13:HyperLabel := HyperLabel{#CALC13,"13",NULL_STRING,NULL_STRING}
oCCCALC13:TooltipText := "Programa para  13 Entregas"

oCCCALC12 := PushButton{self,ResourceID{JPRNECA_CALC12,_GetInst()}}
oCCCALC12:HyperLabel := HyperLabel{#CALC12,"12",NULL_STRING,NULL_STRING}
oCCCALC12:TooltipText := "Programa para  12 Entregas"

oCCCALC11 := PushButton{self,ResourceID{JPRNECA_CALC11,_GetInst()}}
oCCCALC11:HyperLabel := HyperLabel{#CALC11,"11",NULL_STRING,NULL_STRING}
oCCCALC11:TooltipText := "Programa para  11 Entregas"

oCCCALC10 := PushButton{self,ResourceID{JPRNECA_CALC10,_GetInst()}}
oCCCALC10:HyperLabel := HyperLabel{#CALC10,"10",NULL_STRING,NULL_STRING}
oCCCALC10:TooltipText := "Programa para  10 Entregas"

oCCCALC09 := PushButton{self,ResourceID{JPRNECA_CALC09,_GetInst()}}
oCCCALC09:HyperLabel := HyperLabel{#CALC09,"09",NULL_STRING,NULL_STRING}
oCCCALC09:TooltipText := "Programa para  9 Entregas"

oCCCALC08 := PushButton{self,ResourceID{JPRNECA_CALC08,_GetInst()}}
oCCCALC08:HyperLabel := HyperLabel{#CALC08,"08",NULL_STRING,NULL_STRING}
oCCCALC08:TooltipText := "Programa para  8 Entregas"

oCCCALC07 := PushButton{self,ResourceID{JPRNECA_CALC07,_GetInst()}}
oCCCALC07:HyperLabel := HyperLabel{#CALC07,"07",NULL_STRING,NULL_STRING}
oCCCALC07:TooltipText := "Programa para  7 Entregas"

oCCCALC06 := PushButton{self,ResourceID{JPRNECA_CALC06,_GetInst()}}
oCCCALC06:HyperLabel := HyperLabel{#CALC06,"06",NULL_STRING,NULL_STRING}
oCCCALC06:TooltipText := "Programa para  6 Entregas"

oCCCALC05 := PushButton{self,ResourceID{JPRNECA_CALC05,_GetInst()}}
oCCCALC05:HyperLabel := HyperLabel{#CALC05,"05",NULL_STRING,NULL_STRING}
oCCCALC05:TooltipText := "Programa para  5 Entregas"

oCCCALC04 := PushButton{self,ResourceID{JPRNECA_CALC04,_GetInst()}}
oCCCALC04:HyperLabel := HyperLabel{#CALC04,"04",NULL_STRING,NULL_STRING}
oCCCALC04:TooltipText := "Programa para 4 Entregas"

oCCCALC03 := PushButton{self,ResourceID{JPRNECA_CALC03,_GetInst()}}
oCCCALC03:HyperLabel := HyperLabel{#CALC03,"03",NULL_STRING,NULL_STRING}
oCCCALC03:TooltipText := "Programa para  3 Entregas"

oCCCALC02 := PushButton{self,ResourceID{JPRNECA_CALC02,_GetInst()}}
oCCCALC02:HyperLabel := HyperLabel{#CALC02,"02",NULL_STRING,NULL_STRING}
oCCCALC02:TooltipText := "Programa para  2 Entregas"

oCCCALC01 := PushButton{self,ResourceID{JPRNECA_CALC01,_GetInst()}}
oCCCALC01:HyperLabel := HyperLabel{#CALC01,"01",NULL_STRING,NULL_STRING}
oCCCALC01:TooltipText := "Programa para 1 Entrega"

oCCesccod := PushButton{self,ResourceID{JPRNECA_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}
oCCesccod:TooltipText := "Exibe Lista de Produtos(PCP)"

self:Caption := "Programacao Avulsa"
self:HyperLabel := HyperLabel{#jprneca,"Programacao Avulsa",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 22
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
	    FabCenterWindow( SELF )
 RETURN SELF


access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


access QTDE01() 
return self:FieldGet(#QTDE01)


assign QTDE01(uValue) 
self:FieldPut(#QTDE01, uValue)
return QTDE01 := uValue


access QTDE02() 
return self:FieldGet(#QTDE02)


assign QTDE02(uValue) 
self:FieldPut(#QTDE02, uValue)
return QTDE02 := uValue


access QTDE03() 
return self:FieldGet(#QTDE03)


assign QTDE03(uValue) 
self:FieldPut(#QTDE03, uValue)
return QTDE03 := uValue


access QTDE04() 
return self:FieldGet(#QTDE04)


assign QTDE04(uValue) 
self:FieldPut(#QTDE04, uValue)
return QTDE04 := uValue


access QTDE05() 
return self:FieldGet(#QTDE05)


assign QTDE05(uValue) 
self:FieldPut(#QTDE05, uValue)
return QTDE05 := uValue


access QTDE06() 
return self:FieldGet(#QTDE06)


assign QTDE06(uValue) 
self:FieldPut(#QTDE06, uValue)
return QTDE06 := uValue


access QTDE07() 
return self:FieldGet(#QTDE07)


assign QTDE07(uValue) 
self:FieldPut(#QTDE07, uValue)
return QTDE07 := uValue


access QTDE08() 
return self:FieldGet(#QTDE08)


assign QTDE08(uValue) 
self:FieldPut(#QTDE08, uValue)
return QTDE08 := uValue


access QTDE09() 
return self:FieldGet(#QTDE09)


assign QTDE09(uValue) 
self:FieldPut(#QTDE09, uValue)
return QTDE09 := uValue


access QTDE10() 
return self:FieldGet(#QTDE10)


assign QTDE10(uValue) 
self:FieldPut(#QTDE10, uValue)
return QTDE10 := uValue


access QTDE11() 
return self:FieldGet(#QTDE11)


assign QTDE11(uValue) 
self:FieldPut(#QTDE11, uValue)
return QTDE11 := uValue


access QTDE12() 
return self:FieldGet(#QTDE12)


assign QTDE12(uValue) 
self:FieldPut(#QTDE12, uValue)
return QTDE12 := uValue


access QTDE13() 
return self:FieldGet(#QTDE13)


assign QTDE13(uValue) 
self:FieldPut(#QTDE13, uValue)
return QTDE13 := uValue


access QTDE14() 
return self:FieldGet(#QTDE14)


assign QTDE14(uValue) 
self:FieldPut(#QTDE14, uValue)
return QTDE14 := uValue


access QTDE15() 
return self:FieldGet(#QTDE15)


assign QTDE15(uValue) 
self:FieldPut(#QTDE15, uValue)
return QTDE15 := uValue


access QTDE16() 
return self:FieldGet(#QTDE16)


assign QTDE16(uValue) 
self:FieldPut(#QTDE16, uValue)
return QTDE16 := uValue


access QTDE17() 
return self:FieldGet(#QTDE17)


assign QTDE17(uValue) 
self:FieldPut(#QTDE17, uValue)
return QTDE17 := uValue


access QTDE18() 
return self:FieldGet(#QTDE18)


assign QTDE18(uValue) 
self:FieldPut(#QTDE18, uValue)
return QTDE18 := uValue


access QTDE19() 
return self:FieldGet(#QTDE19)


assign QTDE19(uValue) 
self:FieldPut(#QTDE19, uValue)
return QTDE19 := uValue


access QTDE20() 
return self:FieldGet(#QTDE20)


assign QTDE20(uValue) 
self:FieldPut(#QTDE20, uValue)
return QTDE20 := uValue


END CLASS
