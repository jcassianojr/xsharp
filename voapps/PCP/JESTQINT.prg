#region DEFINES
STATIC DEFINE JESTQINT_BUSCANUM := 123 
STATIC DEFINE JESTQINT_COD_EMPRES := 111 
STATIC DEFINE JESTQINT_COD_ITEM := 112 
STATIC DEFINE JESTQINT_DAT_ULT_EN := 120 
STATIC DEFINE JESTQINT_DAT_ULT_IN := 119 
STATIC DEFINE JESTQINT_DAT_ULT_SA := 121 
STATIC DEFINE JESTQINT_PORNUM := 122 
STATIC DEFINE JESTQINT_QTD_DISP_V := 117 
STATIC DEFINE JESTQINT_QTD_IMPEDI := 114 
STATIC DEFINE JESTQINT_QTD_LIB_EX := 116 
STATIC DEFINE JESTQINT_QTD_LIBERA := 113 
STATIC DEFINE JESTQINT_QTD_REJEIT := 115 
STATIC DEFINE JESTQINT_QTD_RESERV := 118 
STATIC DEFINE JESTQINT_SC_COD_EMPRES := 100 
STATIC DEFINE JESTQINT_SC_COD_ITEM := 101 
STATIC DEFINE JESTQINT_SC_DAT_ULT_EN := 109 
STATIC DEFINE JESTQINT_SC_DAT_ULT_IN := 108 
STATIC DEFINE JESTQINT_SC_DAT_ULT_SA := 110 
STATIC DEFINE JESTQINT_SC_QTD_DISP_V := 106 
STATIC DEFINE JESTQINT_SC_QTD_IMPEDI := 103 
STATIC DEFINE JESTQINT_SC_QTD_LIB_EX := 105 
STATIC DEFINE JESTQINT_SC_QTD_LIBERA := 102 
STATIC DEFINE JESTQINT_SC_QTD_REJEIT := 104 
STATIC DEFINE JESTQINT_SC_QTD_RESERV := 107 
#endregion

PARTIAL class Jestqint inherit MYDataWindow 

	PROTECT oDBCOD_ITEM as DataColumn
	PROTECT oDBQTD_LIBERA as DataColumn
	protect oDCSC_COD_EMPRES as FIXEDTEXT
	protect oDCSC_COD_ITEM as FIXEDTEXT
	protect oDCSC_QTD_LIBERA as FIXEDTEXT
	protect oDCSC_QTD_IMPEDI as FIXEDTEXT
	protect oDCSC_QTD_REJEIT as FIXEDTEXT
	protect oDCSC_QTD_LIB_EX as FIXEDTEXT
	protect oDCSC_QTD_DISP_V as FIXEDTEXT
	protect oDCSC_QTD_RESERV as FIXEDTEXT
	protect oDCSC_DAT_ULT_IN as FIXEDTEXT
	protect oDCSC_DAT_ULT_EN as FIXEDTEXT
	protect oDCSC_DAT_ULT_SA as FIXEDTEXT
	protect oDCCOD_EMPRES as SINGLELINEEDIT
	protect oDCCOD_ITEM as SINGLELINEEDIT
	protect oDCQTD_LIBERA as RIGHTSLE
	protect oDCQTD_IMPEDI as RIGHTSLE
	protect oDCQTD_REJEIT as RIGHTSLE
	protect oDCQTD_LIB_EX as RIGHTSLE
	protect oDCQTD_DISP_V as RIGHTSLE
	protect oDCQTD_RESERV as RIGHTSLE
	protect oDCDAT_ULT_IN as DATESLE
	protect oDCDAT_ULT_EN as DATESLE
	protect oDCDAT_ULT_SA as DATESLE
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
// 	instance COD_EMPRES 
// 	instance COD_ITEM 
// 	instance QTD_LIBERA 
// 	instance QTD_IMPEDI 
// 	instance QTD_REJEIT 
// 	instance QTD_LIB_EX 
// 	instance QTD_DISP_V 
// 	instance QTD_RESERV 
// 	instance DAT_ULT_IN 
// 	instance DAT_ULT_EN 
// 	instance DAT_ULT_SA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access COD_EMPRES() 
return self:FieldGet(#COD_EMPRES)


assign COD_EMPRES(uValue) 
self:FieldPut(#COD_EMPRES, uValue)
return COD_EMPRES := uValue


access COD_ITEM() 
return self:FieldGet(#COD_ITEM)


assign COD_ITEM(uValue) 
self:FieldPut(#COD_ITEM, uValue)
return COD_ITEM := uValue


access DAT_ULT_EN() 
return self:FieldGet(#DAT_ULT_EN)


assign DAT_ULT_EN(uValue) 
self:FieldPut(#DAT_ULT_EN, uValue)
return DAT_ULT_EN := uValue


access DAT_ULT_IN() 
return self:FieldGet(#DAT_ULT_IN)


assign DAT_ULT_IN(uValue) 
self:FieldPut(#DAT_ULT_IN, uValue)
return DAT_ULT_IN := uValue


access DAT_ULT_SA() 
return self:FieldGet(#DAT_ULT_SA)


assign DAT_ULT_SA(uValue) 
self:FieldPut(#DAT_ULT_SA, uValue)
return DAT_ULT_SA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"Jestqint",_GetInst()},iCtlID)

oDCSC_COD_EMPRES := FixedText{self,ResourceID{JESTQINT_SC_COD_EMPRES,_GetInst()}}
oDCSC_COD_EMPRES:HyperLabel := HyperLabel{#SC_COD_EMPRES,"Cod Empres:",NULL_STRING,NULL_STRING}

oDCSC_COD_ITEM := FixedText{self,ResourceID{JESTQINT_SC_COD_ITEM,_GetInst()}}
oDCSC_COD_ITEM:HyperLabel := HyperLabel{#SC_COD_ITEM,"Cod Item:",NULL_STRING,NULL_STRING}

oDCSC_QTD_LIBERA := FixedText{self,ResourceID{JESTQINT_SC_QTD_LIBERA,_GetInst()}}
oDCSC_QTD_LIBERA:HyperLabel := HyperLabel{#SC_QTD_LIBERA,"Qtd Libera:",NULL_STRING,NULL_STRING}

oDCSC_QTD_IMPEDI := FixedText{self,ResourceID{JESTQINT_SC_QTD_IMPEDI,_GetInst()}}
oDCSC_QTD_IMPEDI:HyperLabel := HyperLabel{#SC_QTD_IMPEDI,"Qtd Impedi:",NULL_STRING,NULL_STRING}

oDCSC_QTD_REJEIT := FixedText{self,ResourceID{JESTQINT_SC_QTD_REJEIT,_GetInst()}}
oDCSC_QTD_REJEIT:HyperLabel := HyperLabel{#SC_QTD_REJEIT,"Qtd Rejeit:",NULL_STRING,NULL_STRING}

oDCSC_QTD_LIB_EX := FixedText{self,ResourceID{JESTQINT_SC_QTD_LIB_EX,_GetInst()}}
oDCSC_QTD_LIB_EX:HyperLabel := HyperLabel{#SC_QTD_LIB_EX,"Qtd Lib Ex:",NULL_STRING,NULL_STRING}

oDCSC_QTD_DISP_V := FixedText{self,ResourceID{JESTQINT_SC_QTD_DISP_V,_GetInst()}}
oDCSC_QTD_DISP_V:HyperLabel := HyperLabel{#SC_QTD_DISP_V,"Qtd Disp V:",NULL_STRING,NULL_STRING}

oDCSC_QTD_RESERV := FixedText{self,ResourceID{JESTQINT_SC_QTD_RESERV,_GetInst()}}
oDCSC_QTD_RESERV:HyperLabel := HyperLabel{#SC_QTD_RESERV,"Qtd Reserv:",NULL_STRING,NULL_STRING}

oDCSC_DAT_ULT_IN := FixedText{self,ResourceID{JESTQINT_SC_DAT_ULT_IN,_GetInst()}}
oDCSC_DAT_ULT_IN:HyperLabel := HyperLabel{#SC_DAT_ULT_IN,"Dat Ult In:",NULL_STRING,NULL_STRING}

oDCSC_DAT_ULT_EN := FixedText{self,ResourceID{JESTQINT_SC_DAT_ULT_EN,_GetInst()}}
oDCSC_DAT_ULT_EN:HyperLabel := HyperLabel{#SC_DAT_ULT_EN,"Dat Ult En:",NULL_STRING,NULL_STRING}

oDCSC_DAT_ULT_SA := FixedText{self,ResourceID{JESTQINT_SC_DAT_ULT_SA,_GetInst()}}
oDCSC_DAT_ULT_SA:HyperLabel := HyperLabel{#SC_DAT_ULT_SA,"Dat Ult Sa:",NULL_STRING,NULL_STRING}

oDCCOD_EMPRES := SingleLineEdit{self,ResourceID{JESTQINT_COD_EMPRES,_GetInst()}}
oDCCOD_EMPRES:FieldSpec := padrao_char_01{}
oDCCOD_EMPRES:HyperLabel := HyperLabel{#COD_EMPRES,"Cod Empres:",NULL_STRING,"estqint_COD_EMPRES"}

oDCCOD_ITEM := SingleLineEdit{self,ResourceID{JESTQINT_COD_ITEM,_GetInst()}}
oDCCOD_ITEM:FieldSpec := padrao_char_14{}
oDCCOD_ITEM:HyperLabel := HyperLabel{#COD_ITEM,"Cod Item:",NULL_STRING,"estqint_COD_ITEM"}

oDCQTD_LIBERA := rightSle{self,ResourceID{JESTQINT_QTD_LIBERA,_GetInst()}}
oDCQTD_LIBERA:FieldSpec := padrao_num_12_4{}
oDCQTD_LIBERA:HyperLabel := HyperLabel{#QTD_LIBERA,"Qtd Libera:",NULL_STRING,"estqint_QTD_LIBERA"}

oDCQTD_IMPEDI := rightSle{self,ResourceID{JESTQINT_QTD_IMPEDI,_GetInst()}}
oDCQTD_IMPEDI:FieldSpec := padrao_num_12_4{}
oDCQTD_IMPEDI:HyperLabel := HyperLabel{#QTD_IMPEDI,"Qtd Impedi:",NULL_STRING,"estqint_QTD_IMPEDI"}

oDCQTD_REJEIT := rightSle{self,ResourceID{JESTQINT_QTD_REJEIT,_GetInst()}}
oDCQTD_REJEIT:FieldSpec := padrao_num_12_4{}
oDCQTD_REJEIT:HyperLabel := HyperLabel{#QTD_REJEIT,"Qtd Rejeit:",NULL_STRING,"estqint_QTD_REJEIT"}

oDCQTD_LIB_EX := rightSle{self,ResourceID{JESTQINT_QTD_LIB_EX,_GetInst()}}
oDCQTD_LIB_EX:FieldSpec := padrao_num_12_4{}
oDCQTD_LIB_EX:HyperLabel := HyperLabel{#QTD_LIB_EX,"Qtd Lib Ex:",NULL_STRING,"estqint_QTD_LIB_EX"}

oDCQTD_DISP_V := rightSle{self,ResourceID{JESTQINT_QTD_DISP_V,_GetInst()}}
oDCQTD_DISP_V:FieldSpec := padrao_num_12_4{}
oDCQTD_DISP_V:HyperLabel := HyperLabel{#QTD_DISP_V,"Qtd Disp V:",NULL_STRING,"estqint_QTD_DISP_V"}

oDCQTD_RESERV := rightSle{self,ResourceID{JESTQINT_QTD_RESERV,_GetInst()}}
oDCQTD_RESERV:FieldSpec := padrao_num_12_4{}
oDCQTD_RESERV:HyperLabel := HyperLabel{#QTD_RESERV,"Qtd Reserv:",NULL_STRING,"estqint_QTD_RESERV"}

oDCDAT_ULT_IN := DateSle{self,ResourceID{JESTQINT_DAT_ULT_IN,_GetInst()}}
oDCDAT_ULT_IN:FieldSpec := date_FIELD{}
oDCDAT_ULT_IN:HyperLabel := HyperLabel{#DAT_ULT_IN,"Dat Ult In:",NULL_STRING,"estqint_DAT_ULT_IN"}

oDCDAT_ULT_EN := DateSle{self,ResourceID{JESTQINT_DAT_ULT_EN,_GetInst()}}
oDCDAT_ULT_EN:FieldSpec := DATE_FIELD{}
oDCDAT_ULT_EN:HyperLabel := HyperLabel{#DAT_ULT_EN,"Dat Ult En:",NULL_STRING,"estqint_DAT_ULT_EN"}

oDCDAT_ULT_SA := DateSle{self,ResourceID{JESTQINT_DAT_ULT_SA,_GetInst()}}
oDCDAT_ULT_SA:FieldSpec := date_field{}
oDCDAT_ULT_SA:HyperLabel := HyperLabel{#DAT_ULT_SA,"Dat Ult Sa:",NULL_STRING,"estqint_DAT_ULT_SA"}

oCCpornum := PushButton{self,ResourceID{JESTQINT_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscanum := PushButton{self,ResourceID{JESTQINT_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Estoque Importado"
self:HyperLabel := HyperLabel{#Jestqint,"Estoque Importado",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCOD_ITEM := DataColumn{padrao_char_14{}}
oDBCOD_ITEM:Width := 27
oDBCOD_ITEM:HyperLabel := oDCCOD_ITEM:HyperLabel 
oDBCOD_ITEM:Caption := "Cod Item:"
self:Browser:AddColumn(oDBCOD_ITEM)

oDBQTD_LIBERA := DataColumn{padrao_num_12_4{}}
oDBQTD_LIBERA:Width := 21
oDBQTD_LIBERA:HyperLabel := oDCQTD_LIBERA:HyperLabel 
oDBQTD_LIBERA:Caption := "Qtd Libera:"
self:Browser:AddColumn(oDBQTD_LIBERA)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access QTD_DISP_V() 
return self:FieldGet(#QTD_DISP_V)


assign QTD_DISP_V(uValue) 
self:FieldPut(#QTD_DISP_V, uValue)
return QTD_DISP_V := uValue


access QTD_IMPEDI() 
return self:FieldGet(#QTD_IMPEDI)


assign QTD_IMPEDI(uValue) 
self:FieldPut(#QTD_IMPEDI, uValue)
return QTD_IMPEDI := uValue


access QTD_LIB_EX() 
return self:FieldGet(#QTD_LIB_EX)


assign QTD_LIB_EX(uValue) 
self:FieldPut(#QTD_LIB_EX, uValue)
return QTD_LIB_EX := uValue


access QTD_LIBERA() 
return self:FieldGet(#QTD_LIBERA)


assign QTD_LIBERA(uValue) 
self:FieldPut(#QTD_LIBERA, uValue)
return QTD_LIBERA := uValue


access QTD_REJEIT() 
return self:FieldGet(#QTD_REJEIT)


assign QTD_REJEIT(uValue) 
self:FieldPut(#QTD_REJEIT, uValue)
return QTD_REJEIT := uValue


access QTD_RESERV() 
return self:FieldGet(#QTD_RESERV)


assign QTD_RESERV(uValue) 
self:FieldPut(#QTD_RESERV, uValue)
return QTD_RESERV := uValue


END CLASS
