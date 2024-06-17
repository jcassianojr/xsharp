#region DEFINES
STATIC DEFINE JCTRHOR_ANO := 114 
STATIC DEFINE JCTRHOR_BUSCANUM := 123 
STATIC DEFINE JCTRHOR_CCUSTO := 127 
STATIC DEFINE JCTRHOR_CMDORDENAR := 122 
STATIC DEFINE JCTRHOR_DEPTO := 110 
STATIC DEFINE JCTRHOR_HRDSR := 118 
STATIC DEFINE JCTRHOR_HRJUS := 120 
STATIC DEFINE JCTRHOR_HRNJU := 119 
STATIC DEFINE JCTRHOR_HRTRA := 117 
STATIC DEFINE JCTRHOR_MES := 115 
STATIC DEFINE JCTRHOR_MODIRETA := 124 
STATIC DEFINE JCTRHOR_NOMEC := 113 
STATIC DEFINE JCTRHOR_QTFUN := 116 
STATIC DEFINE JCTRHOR_SC_ANO := 104 
STATIC DEFINE JCTRHOR_SC_CHAPA1 := 128 
STATIC DEFINE JCTRHOR_SC_CHAPA2 := 126 
STATIC DEFINE JCTRHOR_SC_DEPTO := 100 
STATIC DEFINE JCTRHOR_SC_HRDSR := 108 
STATIC DEFINE JCTRHOR_SC_HRNJU := 109 
STATIC DEFINE JCTRHOR_SC_HRNJU1 := 121 
STATIC DEFINE JCTRHOR_SC_HRTRA := 107 
STATIC DEFINE JCTRHOR_SC_MES := 105 
STATIC DEFINE JCTRHOR_SC_NOMEC := 103 
STATIC DEFINE JCTRHOR_SC_QTFUN := 106 
STATIC DEFINE JCTRHOR_SC_SECAO := 102 
STATIC DEFINE JCTRHOR_SC_SETOR := 101 
STATIC DEFINE JCTRHOR_SECAO := 112 
STATIC DEFINE JCTRHOR_SETOR := 111 
STATIC DEFINE JCTRHOR_UNIFUN := 125 
#endregion

class jctrhor inherit MYDataWindow 

	PROTECT oDBDEPTO as DataColumn
	PROTECT oDBSETOR as DataColumn
	PROTECT oDBSECAO as DataColumn
	PROTECT oDBNOMEC as DataColumn
	PROTECT oDBANO as DataColumn
	PROTECT oDBMES as DataColumn
	PROTECT oDBQTFUN as DataColumn
	PROTECT oDBHRTRA as DataColumn
	PROTECT oDBHRDSR as DataColumn
	PROTECT oDBHRNJU as DataColumn
	PROTECT oDBHRJUS as DataColumn
	protect oDCSC_DEPTO as FIXEDTEXT
	protect oDCSC_SETOR as FIXEDTEXT
	protect oDCSC_SECAO as FIXEDTEXT
	protect oDCSC_NOMEC as FIXEDTEXT
	protect oDCSC_ANO as FIXEDTEXT
	protect oDCSC_MES as FIXEDTEXT
	protect oDCSC_QTFUN as FIXEDTEXT
	protect oDCSC_HRTRA as FIXEDTEXT
	protect oDCSC_HRDSR as FIXEDTEXT
	protect oDCSC_HRNJU as FIXEDTEXT
	protect oDCDEPTO as SINGLELINEEDIT
	protect oDCSETOR as SINGLELINEEDIT
	protect oDCSECAO as SINGLELINEEDIT
	protect oDCNOMEC as SINGLELINEEDIT
	protect oDCANO as SINGLELINEEDIT
	protect oDCMES as SINGLELINEEDIT
	protect oDCQTFUN as SINGLELINEEDIT
	protect oDCHRTRA as SINGLELINEEDIT
	protect oDCHRDSR as SINGLELINEEDIT
	protect oDCHRNJU as SINGLELINEEDIT
	protect oDCHRJUS as SINGLELINEEDIT
	protect oDCSC_HRNJU1 as FIXEDTEXT
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
	protect oDCMODIRETA as SINGLELINEEDIT
	protect oDCUNIFUN as RIGHTSLE
	protect oDCSC_CHAPA2 as FIXEDTEXT
	protect oDCCCUSTO as RIGHTSLE
	protect oDCSC_CHAPA1 as FIXEDTEXT
// 	instance DEPTO 
// 	instance SETOR 
// 	instance SECAO 
// 	instance NOMEC 
// 	instance ANO 
// 	instance MES 
// 	instance QTFUN 
// 	instance HRTRA 
// 	instance HRDSR 
// 	instance HRNJU 
// 	instance HRJUS 
// 	instance MODIRETA 
// 	instance UNIFUN 
// 	instance CCUSTO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANO() 
return self:FieldGet(#ANO)


assign ANO(uValue) 
self:FieldPut(#ANO, uValue)
return ANO := uValue


METHOD buscaNUM( ) 
	SELF:KeyFind()

access CCUSTO() 
return self:FieldGet(#CCUSTO)


assign CCUSTO(uValue) 
self:FieldPut(#CCUSTO, uValue)
return CCUSTO := uValue


METHOD cmdordenar( ) 
	SELF:KeyFind()

access DEPTO() 
return self:FieldGet(#DEPTO)


assign DEPTO(uValue) 
self:FieldPut(#DEPTO, uValue)
return DEPTO := uValue


access HRDSR() 
return self:FieldGet(#HRDSR)


assign HRDSR(uValue) 
self:FieldPut(#HRDSR, uValue)
return HRDSR := uValue


access HRJUS() 
return self:FieldGet(#HRJUS)


assign HRJUS(uValue) 
self:FieldPut(#HRJUS, uValue)
return HRJUS := uValue


access HRNJU() 
return self:FieldGet(#HRNJU)


assign HRNJU(uValue) 
self:FieldPut(#HRNJU, uValue)
return HRNJU := uValue


access HRTRA() 
return self:FieldGet(#HRTRA)


assign HRTRA(uValue) 
self:FieldPut(#HRTRA, uValue)
return HRTRA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jctrhor",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_DEPTO := FixedText{self,ResourceID{JCTRHOR_SC_DEPTO,_GetInst()}}
oDCSC_DEPTO:HyperLabel := HyperLabel{#SC_DEPTO,"Depto:",NULL_STRING,NULL_STRING}

oDCSC_SETOR := FixedText{self,ResourceID{JCTRHOR_SC_SETOR,_GetInst()}}
oDCSC_SETOR:HyperLabel := HyperLabel{#SC_SETOR,"Setor:",NULL_STRING,NULL_STRING}

oDCSC_SECAO := FixedText{self,ResourceID{JCTRHOR_SC_SECAO,_GetInst()}}
oDCSC_SECAO:HyperLabel := HyperLabel{#SC_SECAO,"Secao:",NULL_STRING,NULL_STRING}

oDCSC_NOMEC := FixedText{self,ResourceID{JCTRHOR_SC_NOMEC,_GetInst()}}
oDCSC_NOMEC:HyperLabel := HyperLabel{#SC_NOMEC,"Nome",NULL_STRING,NULL_STRING}

oDCSC_ANO := FixedText{self,ResourceID{JCTRHOR_SC_ANO,_GetInst()}}
oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO,"Ano:",NULL_STRING,NULL_STRING}

oDCSC_MES := FixedText{self,ResourceID{JCTRHOR_SC_MES,_GetInst()}}
oDCSC_MES:HyperLabel := HyperLabel{#SC_MES,"Mes:",NULL_STRING,NULL_STRING}

oDCSC_QTFUN := FixedText{self,ResourceID{JCTRHOR_SC_QTFUN,_GetInst()}}
oDCSC_QTFUN:HyperLabel := HyperLabel{#SC_QTFUN,"Qtde Funcionarios",NULL_STRING,NULL_STRING}

oDCSC_HRTRA := FixedText{self,ResourceID{JCTRHOR_SC_HRTRA,_GetInst()}}
oDCSC_HRTRA:HyperLabel := HyperLabel{#SC_HRTRA,"Horas Trabalhadas",NULL_STRING,NULL_STRING}

oDCSC_HRDSR := FixedText{self,ResourceID{JCTRHOR_SC_HRDSR,_GetInst()}}
oDCSC_HRDSR:HyperLabel := HyperLabel{#SC_HRDSR,"Horas DSR",NULL_STRING,NULL_STRING}

oDCSC_HRNJU := FixedText{self,ResourceID{JCTRHOR_SC_HRNJU,_GetInst()}}
oDCSC_HRNJU:HyperLabel := HyperLabel{#SC_HRNJU,"Horas Nao Justificadas",NULL_STRING,NULL_STRING}

oDCDEPTO := SingleLineEdit{self,ResourceID{JCTRHOR_DEPTO,_GetInst()}}
oDCDEPTO:FieldSpec := padrao_num_04{}
oDCDEPTO:HyperLabel := HyperLabel{#DEPTO,"Depto:",NULL_STRING,"CTRHOR_DEPTO"}
oDCDEPTO:BackGround := aBrushes[1]
oDCDEPTO:Font(aFonts[1], FALSE)

oDCSETOR := SingleLineEdit{self,ResourceID{JCTRHOR_SETOR,_GetInst()}}
oDCSETOR:FieldSpec := padrao_num_03{}
oDCSETOR:HyperLabel := HyperLabel{#SETOR,"Setor:",NULL_STRING,"CTRHOR_SETOR"}
oDCSETOR:BackGround := aBrushes[1]
oDCSETOR:Font(aFonts[1], FALSE)

oDCSECAO := SingleLineEdit{self,ResourceID{JCTRHOR_SECAO,_GetInst()}}
oDCSECAO:FieldSpec := padrao_num_03{}
oDCSECAO:HyperLabel := HyperLabel{#SECAO,"Secao:",NULL_STRING,"CTRHOR_SECAO"}
oDCSECAO:BackGround := aBrushes[1]
oDCSECAO:Font(aFonts[1], FALSE)

oDCNOMEC := SingleLineEdit{self,ResourceID{JCTRHOR_NOMEC,_GetInst()}}
oDCNOMEC:FieldSpec := padrao_char_15{}
oDCNOMEC:HyperLabel := HyperLabel{#NOMEC,"Nomec:",NULL_STRING,"CTRHOR_NOMEC"}
oDCNOMEC:BackGround := aBrushes[1]
oDCNOMEC:Font(aFonts[1], FALSE)

oDCANO := SingleLineEdit{self,ResourceID{JCTRHOR_ANO,_GetInst()}}
oDCANO:FieldSpec := padrao_num_04{}
oDCANO:HyperLabel := HyperLabel{#ANO,"Ano:",NULL_STRING,"CTRHOR_ANO"}
oDCANO:BackGround := aBrushes[1]
oDCANO:Font(aFonts[1], FALSE)

oDCMES := SingleLineEdit{self,ResourceID{JCTRHOR_MES,_GetInst()}}
oDCMES:FieldSpec := padrao_num_02{}
oDCMES:HyperLabel := HyperLabel{#MES,"Mes:",NULL_STRING,"CTRHOR_MES"}
oDCMES:BackGround := aBrushes[1]
oDCMES:Font(aFonts[1], FALSE)

oDCQTFUN := SingleLineEdit{self,ResourceID{JCTRHOR_QTFUN,_GetInst()}}
oDCQTFUN:FieldSpec := padrao_num_04{}
oDCQTFUN:HyperLabel := HyperLabel{#QTFUN,"Qtfun:",NULL_STRING,"CTRHOR_QTFUN"}

oDCHRTRA := SingleLineEdit{self,ResourceID{JCTRHOR_HRTRA,_GetInst()}}
oDCHRTRA:FieldSpec := padrao_num_07_2{}
oDCHRTRA:HyperLabel := HyperLabel{#HRTRA,"Hrtra:",NULL_STRING,"CTRHOR_HRTRA"}

oDCHRDSR := SingleLineEdit{self,ResourceID{JCTRHOR_HRDSR,_GetInst()}}
oDCHRDSR:FieldSpec := padrao_num_07_2{}
oDCHRDSR:HyperLabel := HyperLabel{#HRDSR,"Hrdsr:",NULL_STRING,"CTRHOR_HRDSR"}

oDCHRNJU := SingleLineEdit{self,ResourceID{JCTRHOR_HRNJU,_GetInst()}}
oDCHRNJU:FieldSpec := padrao_num_07_2{}
oDCHRNJU:HyperLabel := HyperLabel{#HRNJU,"Hrnju:",NULL_STRING,"CTRHOR_HRNJU"}

oDCHRJUS := SingleLineEdit{self,ResourceID{JCTRHOR_HRJUS,_GetInst()}}
oDCHRJUS:FieldSpec := padrao_num_07_2{}
oDCHRJUS:HyperLabel := HyperLabel{#HRJUS,"Hrjus:",NULL_STRING,"CTRHOR_HRJUS"}

oDCSC_HRNJU1 := FixedText{self,ResourceID{JCTRHOR_SC_HRNJU1,_GetInst()}}
oDCSC_HRNJU1:HyperLabel := HyperLabel{#SC_HRNJU1,"Horas Justificadas",NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JCTRHOR_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JCTRHOR_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}

oDCMODIRETA := SingleLineEdit{self,ResourceID{JCTRHOR_MODIRETA,_GetInst()}}
oDCMODIRETA:FieldSpec := PADRAO_CHAR_01{}
oDCMODIRETA:HyperLabel := HyperLabel{#MODIRETA,"Chapa:",NULL_STRING,"FO_PES_CHAPA"}
oDCMODIRETA:BackGround := aBrushes[1]
oDCMODIRETA:Font(aFonts[1], FALSE)

oDCUNIFUN := rightSle{self,ResourceID{JCTRHOR_UNIFUN,_GetInst()}}
oDCUNIFUN:FieldSpec := PADRAO_char_10{}
oDCUNIFUN:HyperLabel := HyperLabel{#UNIFUN,"Chapa:",NULL_STRING,"FO_PES_CHAPA"}
oDCUNIFUN:BackGround := aBrushes[1]

oDCSC_CHAPA2 := FixedText{self,ResourceID{JCTRHOR_SC_CHAPA2,_GetInst()}}
oDCSC_CHAPA2:HyperLabel := HyperLabel{#SC_CHAPA2,"Unid.Funcional",NULL_STRING,NULL_STRING}

oDCCCUSTO := rightSle{self,ResourceID{JCTRHOR_CCUSTO,_GetInst()}}
oDCCCUSTO:FieldSpec := PADRAO_NUM_06{}
oDCCCUSTO:HyperLabel := HyperLabel{#CCUSTO,"Chapa:",NULL_STRING,"FO_PES_CHAPA"}
oDCCCUSTO:BackGround := aBrushes[1]

oDCSC_CHAPA1 := FixedText{self,ResourceID{JCTRHOR_SC_CHAPA1,_GetInst()}}
oDCSC_CHAPA1:HyperLabel := HyperLabel{#SC_CHAPA1,"CentroCusto",NULL_STRING,NULL_STRING}

self:Caption := "Controle Horas"
self:HyperLabel := HyperLabel{#jctrhor,"Controle Horas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDEPTO := DataColumn{padrao_num_04{}}
oDBDEPTO:Width := 7
oDBDEPTO:HyperLabel := oDCDEPTO:HyperLabel 
oDBDEPTO:Caption := "Depto:"
oDBDEPTO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDEPTO)

oDBSETOR := DataColumn{padrao_num_03{}}
oDBSETOR:Width := 7
oDBSETOR:HyperLabel := oDCSETOR:HyperLabel 
oDBSETOR:Caption := "Setor:"
oDBSETOR:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSETOR)

oDBSECAO := DataColumn{padrao_num_03{}}
oDBSECAO:Width := 7
oDBSECAO:HyperLabel := oDCSECAO:HyperLabel 
oDBSECAO:Caption := "Secao:"
oDBSECAO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSECAO)

oDBNOMEC := DataColumn{padrao_char_15{}}
oDBNOMEC:Width := 7
oDBNOMEC:HyperLabel := oDCNOMEC:HyperLabel 
oDBNOMEC:Caption := "Nomec:"
oDBNOMEC:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOMEC)

oDBANO := DataColumn{padrao_num_04{}}
oDBANO:Width := 5
oDBANO:HyperLabel := oDCANO:HyperLabel 
oDBANO:Caption := "Ano:"
oDBANO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBANO)

oDBMES := DataColumn{padrao_num_02{}}
oDBMES:Width := 5
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "Mes:"
oDBMES:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMES)

oDBQTFUN := DataColumn{padrao_num_04{}}
oDBQTFUN:Width := 7
oDBQTFUN:HyperLabel := oDCQTFUN:HyperLabel 
oDBQTFUN:Caption := "Qtfun:"
self:Browser:AddColumn(oDBQTFUN)

oDBHRTRA := DataColumn{padrao_num_07_2{}}
oDBHRTRA:Width := 7
oDBHRTRA:HyperLabel := oDCHRTRA:HyperLabel 
oDBHRTRA:Caption := "Hrtra:"
self:Browser:AddColumn(oDBHRTRA)

oDBHRDSR := DataColumn{padrao_num_07_2{}}
oDBHRDSR:Width := 7
oDBHRDSR:HyperLabel := oDCHRDSR:HyperLabel 
oDBHRDSR:Caption := "Hrdsr:"
self:Browser:AddColumn(oDBHRDSR)

oDBHRNJU := DataColumn{padrao_num_07_2{}}
oDBHRNJU:Width := 7
oDBHRNJU:HyperLabel := oDCHRNJU:HyperLabel 
oDBHRNJU:Caption := "Hrnju:"
self:Browser:AddColumn(oDBHRNJU)

oDBHRJUS := DataColumn{padrao_num_07_2{}}
oDBHRJUS:Width := 7
oDBHRJUS:HyperLabel := oDCHRJUS:HyperLabel 
oDBHRJUS:Caption := "Hrjus:"
self:Browser:AddColumn(oDBHRJUS)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MES() 
return self:FieldGet(#MES)


assign MES(uValue) 
self:FieldPut(#MES, uValue)
return MES := uValue


access MODIRETA() 
return self:FieldGet(#MODIRETA)


assign MODIRETA(uValue) 
self:FieldPut(#MODIRETA, uValue)
return MODIRETA := uValue


access NOMEC() 
return self:FieldGet(#NOMEC)


assign NOMEC(uValue) 
self:FieldPut(#NOMEC, uValue)
return NOMEC := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


access QTFUN() 
return self:FieldGet(#QTFUN)


assign QTFUN(uValue) 
self:FieldPut(#QTFUN, uValue)
return QTFUN := uValue


access SECAO() 
return self:FieldGet(#SECAO)


assign SECAO(uValue) 
self:FieldPut(#SECAO, uValue)
return SECAO := uValue


access SETOR() 
return self:FieldGet(#SETOR)


assign SETOR(uValue) 
self:FieldPut(#SETOR, uValue)
return SETOR := uValue


access UNIFUN() 
return self:FieldGet(#UNIFUN)


assign UNIFUN(uValue) 
self:FieldPut(#UNIFUN, uValue)
return UNIFUN := uValue


END CLASS
