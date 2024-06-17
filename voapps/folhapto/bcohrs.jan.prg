#region DEFINES
STATIC DEFINE JBCOHRS_ANO := 108 
STATIC DEFINE JBCOHRS_BUSCANUM := 122 
STATIC DEFINE JBCOHRS_CMDORDENAR := 121 
STATIC DEFINE JBCOHRS_CREDITO := 112 
STATIC DEFINE JBCOHRS_DEBITO := 113 
STATIC DEFINE JBCOHRS_DIAANT := 114 
STATIC DEFINE JBCOHRS_DIACRE := 115 
STATIC DEFINE JBCOHRS_DIADEB := 116 
STATIC DEFINE JBCOHRS_DIASAL := 117 
STATIC DEFINE JBCOHRS_ESCFUN := 118 
STATIC DEFINE JBCOHRS_FIXEDTEXT11 := 119 
STATIC DEFINE JBCOHRS_FIXEDTEXT12 := 120 
STATIC DEFINE JBCOHRS_MES := 109 
STATIC DEFINE JBCOHRS_NUMERO := 107 
STATIC DEFINE JBCOHRS_SALANT := 111 
STATIC DEFINE JBCOHRS_SALDO := 110 
STATIC DEFINE JBCOHRS_SC_ANO := 101 
STATIC DEFINE JBCOHRS_SC_CREDITO := 105 
STATIC DEFINE JBCOHRS_SC_DEBITO := 106 
STATIC DEFINE JBCOHRS_SC_MES := 102 
STATIC DEFINE JBCOHRS_SC_NUMERO := 100 
STATIC DEFINE JBCOHRS_SC_SALANT := 104 
STATIC DEFINE JBCOHRS_SC_SALDO := 103 
#endregion

PARTIAL class JBCOHRS inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBANO as DataColumn
	PROTECT oDBMES as DataColumn
	PROTECT oDBSALANT as DataColumn
	PROTECT oDBCREDITO as DataColumn
	PROTECT oDBDEBITO as DataColumn
	PROTECT oDBSALDO as DataColumn
	PROTECT oDBDIAANT as DataColumn
	PROTECT oDBDIACRE as DataColumn
	PROTECT oDBDIADEB as DataColumn
	PROTECT oDBDIASAL as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_ANO as FIXEDTEXT
	protect oDCSC_MES as FIXEDTEXT
	protect oDCSC_SALDO as FIXEDTEXT
	protect oDCSC_SALANT as FIXEDTEXT
	protect oDCSC_CREDITO as FIXEDTEXT
	protect oDCSC_DEBITO as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCANO as RIGHTSLE
	protect oDCMES as RIGHTSLE
	protect oDCSALDO as SINGLELINEEDIT
	protect oDCSALANT as SINGLELINEEDIT
	protect oDCCREDITO as SINGLELINEEDIT
	protect oDCDEBITO as SINGLELINEEDIT
	protect oDCDIAANT as SINGLELINEEDIT
	protect oDCDIACRE as SINGLELINEEDIT
	protect oDCDIADEB as SINGLELINEEDIT
	protect oDCDIASAL as SINGLELINEEDIT
	protect oCCescfun as PUSHBUTTON
	protect oDCFixedText11 as FIXEDTEXT
	protect oDCFixedText12 as FIXEDTEXT
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
// 	instance NUMERO 
// 	instance ANO 
// 	instance MES 
// 	instance SALDO 
// 	instance SALANT 
// 	instance CREDITO 
// 	instance DEBITO 
// 	instance DIAANT 
// 	instance DIACRE 
// 	instance DIADEB 
// 	instance DIASAL 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANO() 
return self:FieldGet(#ANO)


assign ANO(uValue) 
self:FieldPut(#ANO, uValue)
return ANO := uValue


access CREDITO() 
return self:FieldGet(#CREDITO)


assign CREDITO(uValue) 
self:FieldPut(#CREDITO, uValue)
return CREDITO := uValue


access DEBITO() 
return self:FieldGet(#DEBITO)


assign DEBITO(uValue) 
self:FieldPut(#DEBITO, uValue)
return DEBITO := uValue


access DIAANT() 
return self:FieldGet(#DIAANT)


assign DIAANT(uValue) 
self:FieldPut(#DIAANT, uValue)
return DIAANT := uValue


access DIACRE() 
return self:FieldGet(#DIACRE)


assign DIACRE(uValue) 
self:FieldPut(#DIACRE, uValue)
return DIACRE := uValue


access DIADEB() 
return self:FieldGet(#DIADEB)


assign DIADEB(uValue) 
self:FieldPut(#DIADEB, uValue)
return DIADEB := uValue


access DIASAL() 
return self:FieldGet(#DIASAL)


assign DIASAL(uValue) 
self:FieldPut(#DIASAL, uValue)
return DIASAL := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JBCOHRS",_GetInst()},iCtlID)

oDCSC_NUMERO := FixedText{self,ResourceID{JBCOHRS_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_ANO := FixedText{self,ResourceID{JBCOHRS_SC_ANO,_GetInst()}}
oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO,"Ano:",NULL_STRING,NULL_STRING}

oDCSC_MES := FixedText{self,ResourceID{JBCOHRS_SC_MES,_GetInst()}}
oDCSC_MES:HyperLabel := HyperLabel{#SC_MES,"Mes:",NULL_STRING,NULL_STRING}

oDCSC_SALDO := FixedText{self,ResourceID{JBCOHRS_SC_SALDO,_GetInst()}}
oDCSC_SALDO:HyperLabel := HyperLabel{#SC_SALDO,"Saldo:",NULL_STRING,NULL_STRING}

oDCSC_SALANT := FixedText{self,ResourceID{JBCOHRS_SC_SALANT,_GetInst()}}
oDCSC_SALANT:HyperLabel := HyperLabel{#SC_SALANT,"Anterior",NULL_STRING,NULL_STRING}

oDCSC_CREDITO := FixedText{self,ResourceID{JBCOHRS_SC_CREDITO,_GetInst()}}
oDCSC_CREDITO:HyperLabel := HyperLabel{#SC_CREDITO,"Credito:",NULL_STRING,NULL_STRING}

oDCSC_DEBITO := FixedText{self,ResourceID{JBCOHRS_SC_DEBITO,_GetInst()}}
oDCSC_DEBITO:HyperLabel := HyperLabel{#SC_DEBITO,"Debito:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JBCOHRS_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"BCOHRS_NUMERO"}

oDCANO := rightSle{self,ResourceID{JBCOHRS_ANO,_GetInst()}}
oDCANO:FieldSpec := PADRAO_NUM_04{}
oDCANO:HyperLabel := HyperLabel{#ANO,"Ano:",NULL_STRING,"BCOHRS_ANO"}

oDCMES := rightSle{self,ResourceID{JBCOHRS_MES,_GetInst()}}
oDCMES:FieldSpec := PADRAO_NUM_02{}
oDCMES:HyperLabel := HyperLabel{#MES,"Mes:",NULL_STRING,"BCOHRS_MES"}

oDCSALDO := SingleLineEdit{self,ResourceID{JBCOHRS_SALDO,_GetInst()}}
oDCSALDO:FieldSpec := PADRAO_NUM_08_2{}
oDCSALDO:HyperLabel := HyperLabel{#SALDO,"Saldo:",NULL_STRING,"BCOHRS_SALDO"}

oDCSALANT := SingleLineEdit{self,ResourceID{JBCOHRS_SALANT,_GetInst()}}
oDCSALANT:FieldSpec := PADRAO_NUM_08_2{}
oDCSALANT:HyperLabel := HyperLabel{#SALANT,"Salant:",NULL_STRING,"BCOHRS_SALANT"}

oDCCREDITO := SingleLineEdit{self,ResourceID{JBCOHRS_CREDITO,_GetInst()}}
oDCCREDITO:FieldSpec := PADRAO_NUM_08_2{}
oDCCREDITO:HyperLabel := HyperLabel{#CREDITO,"Credito:",NULL_STRING,"BCOHRS_CREDITO"}

oDCDEBITO := SingleLineEdit{self,ResourceID{JBCOHRS_DEBITO,_GetInst()}}
oDCDEBITO:FieldSpec := PADRAO_NUM_08_2{}
oDCDEBITO:HyperLabel := HyperLabel{#DEBITO,"Debito:",NULL_STRING,"BCOHRS_DEBITO"}

oDCDIAANT := SingleLineEdit{self,ResourceID{JBCOHRS_DIAANT,_GetInst()}}
oDCDIAANT:FieldSpec := PADRAO_NUM_08_2{}
oDCDIAANT:HyperLabel := HyperLabel{#DIAANT,"Diaant:",NULL_STRING,"BCOHRS_DIAANT"}

oDCDIACRE := SingleLineEdit{self,ResourceID{JBCOHRS_DIACRE,_GetInst()}}
oDCDIACRE:FieldSpec := PADRAO_NUM_08_2{}
oDCDIACRE:HyperLabel := HyperLabel{#DIACRE,"Diacre:",NULL_STRING,"BCOHRS_DIACRE"}

oDCDIADEB := SingleLineEdit{self,ResourceID{JBCOHRS_DIADEB,_GetInst()}}
oDCDIADEB:FieldSpec := PADRAO_NUM_08_2{}
oDCDIADEB:HyperLabel := HyperLabel{#DIADEB,"Diadeb:",NULL_STRING,"BCOHRS_DIADEB"}

oDCDIASAL := SingleLineEdit{self,ResourceID{JBCOHRS_DIASAL,_GetInst()}}
oDCDIASAL:FieldSpec := PADRAO_NUM_08_2{}
oDCDIASAL:HyperLabel := HyperLabel{#DIASAL,"Diasal:",NULL_STRING,"BCOHRS_DIASAL"}

oCCescfun := PushButton{self,ResourceID{JBCOHRS_ESCFUN,_GetInst()}}
oCCescfun:HyperLabel := HyperLabel{#escfun,"...",NULL_STRING,NULL_STRING}

oDCFixedText11 := FixedText{self,ResourceID{JBCOHRS_FIXEDTEXT11,_GetInst()}}
oDCFixedText11:HyperLabel := HyperLabel{#FixedText11,"Horas",NULL_STRING,NULL_STRING}

oDCFixedText12 := FixedText{self,ResourceID{JBCOHRS_FIXEDTEXT12,_GetInst()}}
oDCFixedText12:HyperLabel := HyperLabel{#FixedText12,"Dias",NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JBCOHRS_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JBCOHRS_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Banco de Horas"
self:HyperLabel := HyperLabel{#JBCOHRS,"Banco de Horas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBANO := DataColumn{PADRAO_NUM_04{}}
oDBANO:Width := 6
oDBANO:HyperLabel := oDCANO:HyperLabel 
oDBANO:Caption := "Ano:"
self:Browser:AddColumn(oDBANO)

oDBMES := DataColumn{PADRAO_NUM_02{}}
oDBMES:Width := 5
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "Mes:"
self:Browser:AddColumn(oDBMES)

oDBSALANT := DataColumn{PADRAO_NUM_08_2{}}
oDBSALANT:Width := 8
oDBSALANT:HyperLabel := oDCSALANT:HyperLabel 
oDBSALANT:Caption := "Salant:"
self:Browser:AddColumn(oDBSALANT)

oDBCREDITO := DataColumn{PADRAO_NUM_08_2{}}
oDBCREDITO:Width := 9
oDBCREDITO:HyperLabel := oDCCREDITO:HyperLabel 
oDBCREDITO:Caption := "Credito:"
self:Browser:AddColumn(oDBCREDITO)

oDBDEBITO := DataColumn{PADRAO_NUM_08_2{}}
oDBDEBITO:Width := 8
oDBDEBITO:HyperLabel := oDCDEBITO:HyperLabel 
oDBDEBITO:Caption := "Debito:"
self:Browser:AddColumn(oDBDEBITO)

oDBSALDO := DataColumn{PADRAO_NUM_08_2{}}
oDBSALDO:Width := 7
oDBSALDO:HyperLabel := oDCSALDO:HyperLabel 
oDBSALDO:Caption := "Saldo:"
self:Browser:AddColumn(oDBSALDO)

oDBDIAANT := DataColumn{PADRAO_NUM_08_2{}}
oDBDIAANT:Width := 7
oDBDIAANT:HyperLabel := oDCDIAANT:HyperLabel 
oDBDIAANT:Caption := "Diaant:"
self:Browser:AddColumn(oDBDIAANT)

oDBDIACRE := DataColumn{PADRAO_NUM_08_2{}}
oDBDIACRE:Width := 7
oDBDIACRE:HyperLabel := oDCDIACRE:HyperLabel 
oDBDIACRE:Caption := "Diacre:"
self:Browser:AddColumn(oDBDIACRE)

oDBDIADEB := DataColumn{PADRAO_NUM_08_2{}}
oDBDIADEB:Width := 7
oDBDIADEB:HyperLabel := oDCDIADEB:HyperLabel 
oDBDIADEB:Caption := "Diadeb:"
self:Browser:AddColumn(oDBDIADEB)

oDBDIASAL := DataColumn{PADRAO_NUM_08_2{}}
oDBDIASAL:Width := 7
oDBDIASAL:HyperLabel := oDCDIASAL:HyperLabel 
oDBDIASAL:Caption := "Diasal:"
self:Browser:AddColumn(oDBDIASAL)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MES() 
return self:FieldGet(#MES)


assign MES(uValue) 
self:FieldPut(#MES, uValue)
return MES := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access SALANT() 
return self:FieldGet(#SALANT)


assign SALANT(uValue) 
self:FieldPut(#SALANT, uValue)
return SALANT := uValue


access SALDO() 
return self:FieldGet(#SALDO)


assign SALDO(uValue) 
self:FieldPut(#SALDO, uValue)
return SALDO := uValue


END CLASS
