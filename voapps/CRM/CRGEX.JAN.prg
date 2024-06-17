#region DEFINES
STATIC DEFINE JCRGEX_BUSCACRM := 119 
STATIC DEFINE JCRGEX_COGNOME := 115 
STATIC DEFINE JCRGEX_CRGEX := 113 
STATIC DEFINE JCRGEX_DATA := 100 
STATIC DEFINE JCRGEX_ESCFOR := 117 
STATIC DEFINE JCRGEX_FORNECEDO := 101 
STATIC DEFINE JCRGEX_NOTA := 102 
STATIC DEFINE JCRGEX_PEGFOR := 118 
STATIC DEFINE JCRGEX_PERCEX := 114 
STATIC DEFINE JCRGEX_PESOEC := 104 
STATIC DEFINE JCRGEX_PESOLQ := 105 
STATIC DEFINE JCRGEX_PESONF := 103 
STATIC DEFINE JCRGEX_SC_CRGEX := 106 
STATIC DEFINE JCRGEX_SC_DATA := 107 
STATIC DEFINE JCRGEX_SC_FORNECEDO := 108 
STATIC DEFINE JCRGEX_SC_NOTA := 109 
STATIC DEFINE JCRGEX_SC_PERCEX := 112 
STATIC DEFINE JCRGEX_SC_PESOEC := 111 
STATIC DEFINE JCRGEX_SC_PESONF := 110 
STATIC DEFINE JCRGEX_SC_PESONF1 := 116 
#endregion

class JCRGEX inherit MYDataWindow 

	PROTECT oDBCRGEX as DataColumn
	PROTECT oDBFORNECEDO as DataColumn
	PROTECT oDBNOTA as DataColumn
	PROTECT oDBPESONF as DataColumn
	PROTECT oDBPESOEC as DataColumn
	PROTECT oDBPERCEX as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBPESOLQ as DataColumn
	protect oDCDATA as DATETIMEPICKER
	protect oDCFORNECEDO as RIGHTSLE
	protect oDCNOTA as SINGLELINEEDIT
	protect oDCPESONF as RIGHTSLE
	protect oDCPESOEC as RIGHTSLE
	protect oDCPESOLQ as RIGHTSLE
	protect oDCSC_CRGEX as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_FORNECEDO as FIXEDTEXT
	protect oDCSC_NOTA as FIXEDTEXT
	protect oDCSC_PESONF as FIXEDTEXT
	protect oDCSC_PESOEC as FIXEDTEXT
	protect oDCSC_PERCEX as FIXEDTEXT
	protect oDCCRGEX as SINGLELINEEDIT
	protect oDCPERCEX as SINGLELINEEDIT
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCSC_PESONF1 as FIXEDTEXT
	protect oCCescfor as PUSHBUTTON
	protect oCCpegfor as PUSHBUTTON
	protect oCCbuscacrm as PUSHBUTTON
// 	instance FORNECEDO 
// 	instance NOTA 
// 	instance PESONF 
// 	instance PESOEC 
// 	instance PESOLQ 
// 	instance CRGEX 
// 	instance PERCEX 
// 	instance COGNOME 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


access CRGEX() 
return self:FieldGet(#CRGEX)


assign CRGEX(uValue) 
self:FieldPut(#CRGEX, uValue)
return CRGEX := uValue


access FORNECEDO() 
return self:FieldGet(#FORNECEDO)


assign FORNECEDO(uValue) 
self:FieldPut(#FORNECEDO, uValue)
return FORNECEDO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCRGEX",_GetInst()},iCtlID)

oDCDATA := DateTimePicker{self,ResourceID{JCRGEX_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDATA:TooltipText := "Data "

oDCFORNECEDO := rightSle{self,ResourceID{JCRGEX_FORNECEDO,_GetInst()}}
oDCFORNECEDO:FieldSpec := padrao_NUM_08{}
oDCFORNECEDO:HyperLabel := HyperLabel{#FORNECEDO,"Fornecedo:",NULL_STRING,"CRGEX_FORNECEDO"}
oDCFORNECEDO:TooltipText := "Codigo do Fornecedor"

oDCNOTA := SingleLineEdit{self,ResourceID{JCRGEX_NOTA,_GetInst()}}
oDCNOTA:FieldSpec := padrao_CHAR_50{}
oDCNOTA:HyperLabel := HyperLabel{#NOTA,"Nota:",NULL_STRING,"CRGEX_NOTA"}
oDCNOTA:TooltipText := "Numero de Notas Fiscal"

oDCPESONF := rightSle{self,ResourceID{JCRGEX_PESONF,_GetInst()}}
oDCPESONF:FieldSpec := padrao_NUM_06{}
oDCPESONF:HyperLabel := HyperLabel{#PESONF,"Pesonf:",NULL_STRING,"CRGEX_PESONF"}
oDCPESONF:TooltipText := "Peso Bruto Nota Fiscal"

oDCPESOEC := rightSle{self,ResourceID{JCRGEX_PESOEC,_GetInst()}}
oDCPESOEC:FieldSpec := padrao_NUM_06{}
oDCPESOEC:HyperLabel := HyperLabel{#PESOEC,"Pesoec:",NULL_STRING,"CRGEX_PESOEC"}
oDCPESOEC:TooltipText := "Peso Encontrado"

oDCPESOLQ := rightSle{self,ResourceID{JCRGEX_PESOLQ,_GetInst()}}
oDCPESOLQ:FieldSpec := padrao_NUM_06{}
oDCPESOLQ:HyperLabel := HyperLabel{#PESOLQ,"Pesonf:",NULL_STRING,"CRGEX_PESONF"}
oDCPESOLQ:TooltipText := "Peso Liquido Nota Fiscal"

oDCSC_CRGEX := FixedText{self,ResourceID{JCRGEX_SC_CRGEX,_GetInst()}}
oDCSC_CRGEX:HyperLabel := HyperLabel{#SC_CRGEX,"Numero",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JCRGEX_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_FORNECEDO := FixedText{self,ResourceID{JCRGEX_SC_FORNECEDO,_GetInst()}}
oDCSC_FORNECEDO:HyperLabel := HyperLabel{#SC_FORNECEDO,"Fornecedor:",NULL_STRING,NULL_STRING}

oDCSC_NOTA := FixedText{self,ResourceID{JCRGEX_SC_NOTA,_GetInst()}}
oDCSC_NOTA:HyperLabel := HyperLabel{#SC_NOTA,"Nota:",NULL_STRING,NULL_STRING}

oDCSC_PESONF := FixedText{self,ResourceID{JCRGEX_SC_PESONF,_GetInst()}}
oDCSC_PESONF:HyperLabel := HyperLabel{#SC_PESONF,"Peso Nf:",NULL_STRING,NULL_STRING}

oDCSC_PESOEC := FixedText{self,ResourceID{JCRGEX_SC_PESOEC,_GetInst()}}
oDCSC_PESOEC:HyperLabel := HyperLabel{#SC_PESOEC,"Peso Enc.",NULL_STRING,NULL_STRING}

oDCSC_PERCEX := FixedText{self,ResourceID{JCRGEX_SC_PERCEX,_GetInst()}}
oDCSC_PERCEX:HyperLabel := HyperLabel{#SC_PERCEX,"%",NULL_STRING,NULL_STRING}

oDCCRGEX := SingleLineEdit{self,ResourceID{JCRGEX_CRGEX,_GetInst()}}
oDCCRGEX:FieldSpec := padrao_num_08{}
oDCCRGEX:HyperLabel := HyperLabel{#CRGEX,"Crgex:",NULL_STRING,"CRGEX_CRGEX"}
oDCCRGEX:TooltipText := "Numero do Lançamento"

oDCPERCEX := SingleLineEdit{self,ResourceID{JCRGEX_PERCEX,_GetInst()}}
oDCPERCEX:FieldSpec := padrao_NUM_06_3{}
oDCPERCEX:HyperLabel := HyperLabel{#PERCEX,"Percex:",NULL_STRING,"CRGEX_PERCEX"}
oDCPERCEX:TooltipText := "Percentual Diferenca Peso"

oDCCOGNOME := SingleLineEdit{self,ResourceID{JCRGEX_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := padrao_CHAR_20{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Crgex:",NULL_STRING,"CRGEX_CRGEX"}
oDCCOGNOME:TooltipText := "Cognome do Fornecedor"

oDCSC_PESONF1 := FixedText{self,ResourceID{JCRGEX_SC_PESONF1,_GetInst()}}
oDCSC_PESONF1:HyperLabel := HyperLabel{#SC_PESONF1,"Peso Liq",NULL_STRING,NULL_STRING}

oCCescfor := PushButton{self,ResourceID{JCRGEX_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}
oCCescfor:TooltipText := "Escolher Fornecedor "

oCCpegfor := PushButton{self,ResourceID{JCRGEX_PEGFOR,_GetInst()}}
oCCpegfor:HyperLabel := HyperLabel{#pegfor,"-->",NULL_STRING,NULL_STRING}
oCCpegfor:TooltipText := "Clique Para Trazer o Nome do Fornecedor"

oCCbuscacrm := PushButton{self,ResourceID{JCRGEX_BUSCACRM,_GetInst()}}
oCCbuscacrm:Image := ICO_FIND{}
oCCbuscacrm:HyperLabel := HyperLabel{#buscacrm,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Carga Excedente"
self:HyperLabel := HyperLabel{#JCRGEX,"Carga Excedente",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCRGEX := DataColumn{padrao_num_08{}}
oDBCRGEX:Width := 7
oDBCRGEX:HyperLabel := oDCCRGEX:HyperLabel 
oDBCRGEX:Caption := "Crgex:"
self:Browser:AddColumn(oDBCRGEX)

oDBFORNECEDO := DataColumn{padrao_NUM_08{}}
oDBFORNECEDO:Width := 11
oDBFORNECEDO:HyperLabel := oDCFORNECEDO:HyperLabel 
oDBFORNECEDO:Caption := "Fornecedo:"
self:Browser:AddColumn(oDBFORNECEDO)

oDBNOTA := DataColumn{padrao_CHAR_50{}}
oDBNOTA:Width := 6
oDBNOTA:HyperLabel := oDCNOTA:HyperLabel 
oDBNOTA:Caption := "Nota:"
self:Browser:AddColumn(oDBNOTA)

oDBPESONF := DataColumn{padrao_NUM_06{}}
oDBPESONF:Width := 8
oDBPESONF:HyperLabel := oDCPESONF:HyperLabel 
oDBPESONF:Caption := "Pesonf:"
self:Browser:AddColumn(oDBPESONF)

oDBPESOEC := DataColumn{padrao_NUM_06{}}
oDBPESOEC:Width := 8
oDBPESOEC:HyperLabel := oDCPESOEC:HyperLabel 
oDBPESOEC:Caption := "Pesoec:"
self:Browser:AddColumn(oDBPESOEC)

oDBPERCEX := DataColumn{padrao_NUM_06_3{}}
oDBPERCEX:Width := 8
oDBPERCEX:HyperLabel := oDCPERCEX:HyperLabel 
oDBPERCEX:Caption := "Percex:"
self:Browser:AddColumn(oDBPERCEX)

oDBCOGNOME := DataColumn{padrao_CHAR_20{}}
oDBCOGNOME:Width := 9
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Crgex:"
self:Browser:AddColumn(oDBCOGNOME)

oDBPESOLQ := DataColumn{padrao_NUM_06{}}
oDBPESOLQ:Width := 8
oDBPESOLQ:HyperLabel := oDCPESOLQ:HyperLabel 
oDBPESOLQ:Caption := "Pesonf:"
self:Browser:AddColumn(oDBPESOLQ)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOTA() 
return self:FieldGet(#NOTA)


assign NOTA(uValue) 
self:FieldPut(#NOTA, uValue)
return NOTA := uValue


access PERCEX() 
return self:FieldGet(#PERCEX)


assign PERCEX(uValue) 
self:FieldPut(#PERCEX, uValue)
return PERCEX := uValue


access PESOEC() 
return self:FieldGet(#PESOEC)


assign PESOEC(uValue) 
self:FieldPut(#PESOEC, uValue)
return PESOEC := uValue


access PESOLQ() 
return self:FieldGet(#PESOLQ)


assign PESOLQ(uValue) 
self:FieldPut(#PESOLQ, uValue)
return PESOLQ := uValue


access PESONF() 
return self:FieldGet(#PESONF)


assign PESONF(uValue) 
self:FieldPut(#PESONF, uValue)
return PESONF := uValue


END CLASS
