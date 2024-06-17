#region DEFINES
STATIC DEFINE JME4CCI_DIMENSAO := 106 
STATIC DEFINE JME4CCI_ENCONTRA := 107 
STATIC DEFINE JME4CCI_INCTOT := 110 
STATIC DEFINE JME4CCI_LAUDO := 109 
STATIC DEFINE JME4CCI_NUMERO := 105 
STATIC DEFINE JME4CCI_SC_DIMENSAO := 101 
STATIC DEFINE JME4CCI_SC_ENCONTRA := 102 
STATIC DEFINE JME4CCI_SC_LAUDO := 104 
STATIC DEFINE JME4CCI_SC_NUMERO := 100 
STATIC DEFINE JME4CCI_SC_TENDENCIA := 103 
STATIC DEFINE JME4CCI_SC_TENDENCIA1 := 111 
STATIC DEFINE JME4CCI_TENDENCIA := 108 
#endregion

class JME4CCI inherit DATAWINDOW 

	PROTECT oDBDIMENSAO as DataColumn
	PROTECT oDBENCONTRA as DataColumn
	PROTECT oDBTENDENCIA as DataColumn
	PROTECT oDBINCTOT as DataColumn
	PROTECT oDBLAUDO as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_DIMENSAO as FIXEDTEXT
	protect oDCSC_ENCONTRA as FIXEDTEXT
	protect oDCSC_TENDENCIA as FIXEDTEXT
	protect oDCSC_LAUDO as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCDIMENSAO as SINGLELINEEDIT
	protect oDCENCONTRA as SINGLELINEEDIT
	protect oDCTENDENCIA as SINGLELINEEDIT
	protect oDCLAUDO as SINGLELINEEDIT
	protect oDCINCTOT as SINGLELINEEDIT
	protect oDCSC_TENDENCIA1 as FIXEDTEXT
// 	instance NUMERO 
// 	instance DIMENSAO 
// 	instance ENCONTRA 
// 	instance TENDENCIA 
// 	instance LAUDO 
// 	instance INCTOT 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DIMENSAO() 
return self:FieldGet(#DIMENSAO)


assign DIMENSAO(uValue) 
self:FieldPut(#DIMENSAO, uValue)
return DIMENSAO := uValue


access ENCONTRA() 
return self:FieldGet(#ENCONTRA)


assign ENCONTRA(uValue) 
self:FieldPut(#ENCONTRA, uValue)
return ENCONTRA := uValue


access INCTOT() 
return self:FieldGet(#INCTOT)


assign INCTOT(uValue) 
self:FieldPut(#INCTOT, uValue)
return INCTOT := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JME4CCI",_GetInst()},iCtlID)

oDCSC_NUMERO := FixedText{self,ResourceID{JME4CCI_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_DIMENSAO := FixedText{self,ResourceID{JME4CCI_SC_DIMENSAO,_GetInst()}}
oDCSC_DIMENSAO:HyperLabel := HyperLabel{#SC_DIMENSAO,"Dimensao:",NULL_STRING,NULL_STRING}

oDCSC_ENCONTRA := FixedText{self,ResourceID{JME4CCI_SC_ENCONTRA,_GetInst()}}
oDCSC_ENCONTRA:HyperLabel := HyperLabel{#SC_ENCONTRA,"Encontra:",NULL_STRING,NULL_STRING}

oDCSC_TENDENCIA := FixedText{self,ResourceID{JME4CCI_SC_TENDENCIA,_GetInst()}}
oDCSC_TENDENCIA:HyperLabel := HyperLabel{#SC_TENDENCIA,"Tendencia:",NULL_STRING,NULL_STRING}

oDCSC_LAUDO := FixedText{self,ResourceID{JME4CCI_SC_LAUDO,_GetInst()}}
oDCSC_LAUDO:HyperLabel := HyperLabel{#SC_LAUDO,"Laudo:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JME4CCI_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"ME4CCI_NUMERO"}

oDCDIMENSAO := SingleLineEdit{self,ResourceID{JME4CCI_DIMENSAO,_GetInst()}}
oDCDIMENSAO:FieldSpec := padrao_char_50{}
oDCDIMENSAO:HyperLabel := HyperLabel{#DIMENSAO,"Dimensao:",NULL_STRING,"ME4CCI_DIMENSAO"}

oDCENCONTRA := SingleLineEdit{self,ResourceID{JME4CCI_ENCONTRA,_GetInst()}}
oDCENCONTRA:FieldSpec := padrao_char_30{}
oDCENCONTRA:HyperLabel := HyperLabel{#ENCONTRA,"Encontra:",NULL_STRING,"ME4CCI_ENCONTRA"}

oDCTENDENCIA := SingleLineEdit{self,ResourceID{JME4CCI_TENDENCIA,_GetInst()}}
oDCTENDENCIA:FieldSpec := padrao_char_10{}
oDCTENDENCIA:HyperLabel := HyperLabel{#TENDENCIA,"Tendencia:",NULL_STRING,"ME4CCI_TENDENCIA"}

oDCLAUDO := SingleLineEdit{self,ResourceID{JME4CCI_LAUDO,_GetInst()}}
oDCLAUDO:FieldSpec := padrao_char_01{}
oDCLAUDO:HyperLabel := HyperLabel{#LAUDO,"Laudo:",NULL_STRING,"ME4CCI_LAUDO"}

oDCINCTOT := SingleLineEdit{self,ResourceID{JME4CCI_INCTOT,_GetInst()}}
oDCINCTOT:FieldSpec := padrao_char_10{}
oDCINCTOT:HyperLabel := HyperLabel{#INCTOT,"Inc Tot",NULL_STRING,"ME4CCI_TENDENCIA"}

oDCSC_TENDENCIA1 := FixedText{self,ResourceID{JME4CCI_SC_TENDENCIA1,_GetInst()}}
oDCSC_TENDENCIA1:HyperLabel := HyperLabel{#SC_TENDENCIA1,"Incerteza",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JME4CCI,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDIMENSAO := DataColumn{padrao_char_50{}}
oDBDIMENSAO:Width := 41
oDBDIMENSAO:HyperLabel := oDCDIMENSAO:HyperLabel 
oDBDIMENSAO:Caption := "Dimensao:"
self:Browser:AddColumn(oDBDIMENSAO)

oDBENCONTRA := DataColumn{padrao_char_30{}}
oDBENCONTRA:Width := 21
oDBENCONTRA:HyperLabel := oDCENCONTRA:HyperLabel 
oDBENCONTRA:Caption := "Encontra:"
self:Browser:AddColumn(oDBENCONTRA)

oDBTENDENCIA := DataColumn{padrao_char_10{}}
oDBTENDENCIA:Width := 11
oDBTENDENCIA:HyperLabel := oDCTENDENCIA:HyperLabel 
oDBTENDENCIA:Caption := "Tendencia:"
self:Browser:AddColumn(oDBTENDENCIA)

oDBINCTOT := DataColumn{padrao_char_10{}}
oDBINCTOT:Width := 9
oDBINCTOT:HyperLabel := oDCINCTOT:HyperLabel 
oDBINCTOT:Caption := "Inc Tot"
self:Browser:AddColumn(oDBINCTOT)

oDBLAUDO := DataColumn{padrao_char_01{}}
oDBLAUDO:Width := 6
oDBLAUDO:HyperLabel := oDCLAUDO:HyperLabel 
oDBLAUDO:Caption := "Laudo:"
self:Browser:AddColumn(oDBLAUDO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LAUDO() 
return self:FieldGet(#LAUDO)


assign LAUDO(uValue) 
self:FieldPut(#LAUDO, uValue)
return LAUDO := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access TENDENCIA() 
return self:FieldGet(#TENDENCIA)


assign TENDENCIA(uValue) 
self:FieldPut(#TENDENCIA, uValue)
return TENDENCIA := uValue


END CLASS
