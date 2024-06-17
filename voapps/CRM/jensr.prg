#region DEFINES
STATIC DEFINE JENSR_CHECADO := 128 
STATIC DEFINE JENSR_CODIGO := 125 
STATIC DEFINE JENSR_ENCO := 102 
STATIC DEFINE JENSR_ESPE := 101 
STATIC DEFINE JENSR_ITEM := 100 
STATIC DEFINE JENSR_QTDEREF := 111 
STATIC DEFINE JENSR_SC_CODIGO := 112 
STATIC DEFINE JENSR_SC_ENCO := 115 
STATIC DEFINE JENSR_SC_ESPE := 114 
STATIC DEFINE JENSR_SC_ITEM := 113 
STATIC DEFINE JENSR_SC_QTDEREF := 124 
STATIC DEFINE JENSR_SC_TIPA := 122 
STATIC DEFINE JENSR_SC_TOLMAX := 119 
STATIC DEFINE JENSR_SC_TOLMIN := 120 
STATIC DEFINE JENSR_SC_UNIDADE := 121 
STATIC DEFINE JENSR_SC_UNIDREF := 123 
STATIC DEFINE JENSR_SC_VALMAX := 117 
STATIC DEFINE JENSR_SC_VALMIN := 118 
STATIC DEFINE JENSR_SC_VALPAD := 116 
STATIC DEFINE JENSR_SC_VALPAD1 := 126 
STATIC DEFINE JENSR_SC_VALPAD2 := 127 
STATIC DEFINE JENSR_TIPA := 109 
STATIC DEFINE JENSR_TOLMAX := 106 
STATIC DEFINE JENSR_TOLMIN := 107 
STATIC DEFINE JENSR_UNIDADE := 108 
STATIC DEFINE JENSR_UNIDREF := 110 
STATIC DEFINE JENSR_VALMAX := 104 
STATIC DEFINE JENSR_VALMIN := 105 
STATIC DEFINE JENSR_VALPAD := 103 
#endregion

class jensR inherit DATAWINDOW 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBTIPA as DataColumn
	PROTECT oDBESPE as DataColumn
	PROTECT oDBCHECADO as DataColumn
	protect oDCITEM as RIGHTSLE
	protect oDCESPE as SINGLELINEEDIT
	protect oDCENCO as SINGLELINEEDIT
	protect oDCVALPAD as RIGHTSLE
	protect oDCVALMAX as RIGHTSLE
	protect oDCVALMIN as RIGHTSLE
	protect oDCTOLMAX as RIGHTSLE
	protect oDCTOLMIN as RIGHTSLE
	protect oDCUNIDADE as SINGLELINEEDIT
	protect oDCTIPA as SINGLELINEEDIT
	protect oDCUNIDREF as SINGLELINEEDIT
	protect oDCQTDEREF as RIGHTSLE
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCSC_ESPE as FIXEDTEXT
	protect oDCSC_ENCO as FIXEDTEXT
	protect oDCSC_VALPAD as FIXEDTEXT
	protect oDCSC_VALMAX as FIXEDTEXT
	protect oDCSC_VALMIN as FIXEDTEXT
	protect oDCSC_TOLMAX as FIXEDTEXT
	protect oDCSC_TOLMIN as FIXEDTEXT
	protect oDCSC_UNIDADE as FIXEDTEXT
	protect oDCSC_TIPA as FIXEDTEXT
	protect oDCSC_UNIDREF as FIXEDTEXT
	protect oDCSC_QTDEREF as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_VALPAD1 as FIXEDTEXT
	protect oDCSC_VALPAD2 as FIXEDTEXT
	protect oDCchecado as SINGLELINEEDIT
// 	instance ITEM 
// 	instance ESPE 
// 	instance ENCO 
// 	instance VALPAD 
// 	instance VALMAX 
// 	instance VALMIN 
// 	instance TOLMAX 
// 	instance TOLMIN 
// 	instance UNIDADE 
// 	instance TIPA 
// 	instance UNIDREF 
// 	instance QTDEREF 
// 	instance CODIGO 
// 	instance checado 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access checado() 
return self:FieldGet(#checado)


assign checado(uValue) 
self:FieldPut(#checado, uValue)
return checado := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access ENCO() 
return self:FieldGet(#ENCO)


assign ENCO(uValue) 
self:FieldPut(#ENCO, uValue)
return ENCO := uValue


access ESPE() 
return self:FieldGet(#ESPE)


assign ESPE(uValue) 
self:FieldPut(#ESPE, uValue)
return ESPE := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jensR",_GetInst()},iCtlID)

oDCITEM := rightSle{self,ResourceID{JENSR_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_NUM_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"MU01I_ITEM"}
oDCITEM:TooltipText := "Nº Sequencia"

oDCESPE := SingleLineEdit{self,ResourceID{JENSR_ESPE,_GetInst()}}
oDCESPE:FieldSpec := PADRAO_CHAR_60{}
oDCESPE:HyperLabel := HyperLabel{#ESPE,"Especificado:",NULL_STRING,"MU01I_ESPE"}
oDCESPE:TooltipText := "Especificado"

oDCENCO := SingleLineEdit{self,ResourceID{JENSR_ENCO,_GetInst()}}
oDCENCO:FieldSpec := PADRAO_CHAR_60{}
oDCENCO:HyperLabel := HyperLabel{#ENCO,"Enco:",NULL_STRING,"MU01I_ENCO"}
oDCENCO:TooltipText := "Pre Dizer Encontrado"

oDCVALPAD := rightSle{self,ResourceID{JENSR_VALPAD,_GetInst()}}
oDCVALPAD:FieldSpec := PADRAO_NUM_08_2{}
oDCVALPAD:HyperLabel := HyperLabel{#VALPAD,"Valpad:",NULL_STRING,"MU01I_VALPAD"}
oDCVALPAD:TooltipText := "Valor Padrao"

oDCVALMAX := rightSle{self,ResourceID{JENSR_VALMAX,_GetInst()}}
oDCVALMAX:FieldSpec := PADRAO_NUM_08_2{}
oDCVALMAX:HyperLabel := HyperLabel{#VALMAX,"Valmax:",NULL_STRING,"MU01I_VALMAX"}
oDCVALMAX:TooltipText := "Valor Maximo"

oDCVALMIN := rightSle{self,ResourceID{JENSR_VALMIN,_GetInst()}}
oDCVALMIN:FieldSpec := PADRAO_NUM_08_2{}
oDCVALMIN:HyperLabel := HyperLabel{#VALMIN,"Valmin:",NULL_STRING,"MU01I_VALMIN"}
oDCVALMIN:TooltipText := "Valro Minimo"

oDCTOLMAX := rightSle{self,ResourceID{JENSR_TOLMAX,_GetInst()}}
oDCTOLMAX:FieldSpec := PADRAO_NUM_08_2{}
oDCTOLMAX:HyperLabel := HyperLabel{#TOLMAX,"Tolmax:",NULL_STRING,"MU01I_TOLMAX"}
oDCTOLMAX:TooltipText := "Tolerancia Maxima"

oDCTOLMIN := rightSle{self,ResourceID{JENSR_TOLMIN,_GetInst()}}
oDCTOLMIN:FieldSpec := PADRAO_NUM_08_2{}
oDCTOLMIN:HyperLabel := HyperLabel{#TOLMIN,"Tolmin:",NULL_STRING,"MU01I_TOLMIN"}
oDCTOLMIN:TooltipText := "Tolerancia Minima"

oDCUNIDADE := SingleLineEdit{self,ResourceID{JENSR_UNIDADE,_GetInst()}}
oDCUNIDADE:FieldSpec := PADRAO_CHAR_03{}
oDCUNIDADE:HyperLabel := HyperLabel{#UNIDADE,"Unidade:",NULL_STRING,"MU01I_UNIDADE"}
oDCUNIDADE:TooltipText := "Unidade"

oDCTIPA := SingleLineEdit{self,ResourceID{JENSR_TIPA,_GetInst()}}
oDCTIPA:FieldSpec := PADRAO_CHAR_03{}
oDCTIPA:HyperLabel := HyperLabel{#TIPA,"Tipa:",NULL_STRING,"MU01I_TIPA"}
oDCTIPA:TooltipText := "Tipo "

oDCUNIDREF := SingleLineEdit{self,ResourceID{JENSR_UNIDREF,_GetInst()}}
oDCUNIDREF:FieldSpec := PADRAO_CHAR_04{}
oDCUNIDREF:HyperLabel := HyperLabel{#UNIDREF,"Unidref:",NULL_STRING,"MU01I_UNIDREF"}
oDCUNIDREF:TooltipText := "Unidade de Referencia"

oDCQTDEREF := rightSle{self,ResourceID{JENSR_QTDEREF,_GetInst()}}
oDCQTDEREF:FieldSpec := PADRAO_NUM_08_2{}
oDCQTDEREF:HyperLabel := HyperLabel{#QTDEREF,"Qtderef:",NULL_STRING,"MU01I_QTDEREF"}
oDCQTDEREF:TooltipText := "Quantidade de Referencia"

oDCSC_CODIGO := FixedText{self,ResourceID{JENSR_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JENSR_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCSC_ESPE := FixedText{self,ResourceID{JENSR_SC_ESPE,_GetInst()}}
oDCSC_ESPE:HyperLabel := HyperLabel{#SC_ESPE,"Espeificado:",NULL_STRING,NULL_STRING}

oDCSC_ENCO := FixedText{self,ResourceID{JENSR_SC_ENCO,_GetInst()}}
oDCSC_ENCO:HyperLabel := HyperLabel{#SC_ENCO,"Encontrado:",NULL_STRING,NULL_STRING}

oDCSC_VALPAD := FixedText{self,ResourceID{JENSR_SC_VALPAD,_GetInst()}}
oDCSC_VALPAD:HyperLabel := HyperLabel{#SC_VALPAD,"Padrao",NULL_STRING,NULL_STRING}

oDCSC_VALMAX := FixedText{self,ResourceID{JENSR_SC_VALMAX,_GetInst()}}
oDCSC_VALMAX:HyperLabel := HyperLabel{#SC_VALMAX,"max:",NULL_STRING,NULL_STRING}

oDCSC_VALMIN := FixedText{self,ResourceID{JENSR_SC_VALMIN,_GetInst()}}
oDCSC_VALMIN:HyperLabel := HyperLabel{#SC_VALMIN,"min:",NULL_STRING,NULL_STRING}

oDCSC_TOLMAX := FixedText{self,ResourceID{JENSR_SC_TOLMAX,_GetInst()}}
oDCSC_TOLMAX:HyperLabel := HyperLabel{#SC_TOLMAX,"Max:",NULL_STRING,NULL_STRING}

oDCSC_TOLMIN := FixedText{self,ResourceID{JENSR_SC_TOLMIN,_GetInst()}}
oDCSC_TOLMIN:HyperLabel := HyperLabel{#SC_TOLMIN,"min:",NULL_STRING,NULL_STRING}

oDCSC_UNIDADE := FixedText{self,ResourceID{JENSR_SC_UNIDADE,_GetInst()}}
oDCSC_UNIDADE:HyperLabel := HyperLabel{#SC_UNIDADE,"Unidade:",NULL_STRING,NULL_STRING}

oDCSC_TIPA := FixedText{self,ResourceID{JENSR_SC_TIPA,_GetInst()}}
oDCSC_TIPA:HyperLabel := HyperLabel{#SC_TIPA,"Tipo:",NULL_STRING,NULL_STRING}

oDCSC_UNIDREF := FixedText{self,ResourceID{JENSR_SC_UNIDREF,_GetInst()}}
oDCSC_UNIDREF:HyperLabel := HyperLabel{#SC_UNIDREF,"Unid Ref",NULL_STRING,NULL_STRING}

oDCSC_QTDEREF := FixedText{self,ResourceID{JENSR_SC_QTDEREF,_GetInst()}}
oDCSC_QTDEREF:HyperLabel := HyperLabel{#SC_QTDEREF,"Qtderef:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JENSR_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_10{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MU01I_CODIGO"}

oDCSC_VALPAD1 := FixedText{self,ResourceID{JENSR_SC_VALPAD1,_GetInst()}}
oDCSC_VALPAD1:HyperLabel := HyperLabel{#SC_VALPAD1,"Valor",NULL_STRING,NULL_STRING}

oDCSC_VALPAD2 := FixedText{self,ResourceID{JENSR_SC_VALPAD2,_GetInst()}}
oDCSC_VALPAD2:HyperLabel := HyperLabel{#SC_VALPAD2,"Tolerancia",NULL_STRING,NULL_STRING}

oDCchecado := SingleLineEdit{self,ResourceID{JENSR_CHECADO,_GetInst()}}
oDCchecado:HyperLabel := HyperLabel{#checado,"c",NULL_STRING,NULL_STRING}
oDCchecado:FieldSpec := padrao_char_01{}

self:Caption := "Ensaios Certificado"
self:HyperLabel := HyperLabel{#jensR,"Ensaios Certificado",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_10{}}
oDBCODIGO:Width := 14
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBITEM := DataColumn{PADRAO_NUM_03{}}
oDBITEM:Width := 6
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
self:Browser:AddColumn(oDBITEM)

oDBTIPA := DataColumn{PADRAO_CHAR_03{}}
oDBTIPA:Width := 8
oDBTIPA:HyperLabel := oDCTIPA:HyperLabel 
oDBTIPA:Caption := "Tipa:"
self:Browser:AddColumn(oDBTIPA)

oDBESPE := DataColumn{PADRAO_CHAR_60{}}
oDBESPE:Width := 43
oDBESPE:HyperLabel := oDCESPE:HyperLabel 
oDBESPE:Caption := "Especificado:"
self:Browser:AddColumn(oDBESPE)

oDBCHECADO := DataColumn{padrao_char_01{}}
oDBCHECADO:Width := 5
oDBCHECADO:HyperLabel := oDCCHECADO:HyperLabel 
oDBCHECADO:Caption := "c"
self:Browser:AddColumn(oDBCHECADO)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


access QTDEREF() 
return self:FieldGet(#QTDEREF)


assign QTDEREF(uValue) 
self:FieldPut(#QTDEREF, uValue)
return QTDEREF := uValue


access TIPA() 
return self:FieldGet(#TIPA)


assign TIPA(uValue) 
self:FieldPut(#TIPA, uValue)
return TIPA := uValue


access TOLMAX() 
return self:FieldGet(#TOLMAX)


assign TOLMAX(uValue) 
self:FieldPut(#TOLMAX, uValue)
return TOLMAX := uValue


access TOLMIN() 
return self:FieldGet(#TOLMIN)


assign TOLMIN(uValue) 
self:FieldPut(#TOLMIN, uValue)
return TOLMIN := uValue


access UNIDADE() 
return self:FieldGet(#UNIDADE)


assign UNIDADE(uValue) 
self:FieldPut(#UNIDADE, uValue)
return UNIDADE := uValue


access UNIDREF() 
return self:FieldGet(#UNIDREF)


assign UNIDREF(uValue) 
self:FieldPut(#UNIDREF, uValue)
return UNIDREF := uValue


access VALMAX() 
return self:FieldGet(#VALMAX)


assign VALMAX(uValue) 
self:FieldPut(#VALMAX, uValue)
return VALMAX := uValue


access VALMIN() 
return self:FieldGet(#VALMIN)


assign VALMIN(uValue) 
self:FieldPut(#VALMIN, uValue)
return VALMIN := uValue


access VALPAD() 
return self:FieldGet(#VALPAD)


assign VALPAD(uValue) 
self:FieldPut(#VALPAD, uValue)
return VALPAD := uValue


END CLASS
