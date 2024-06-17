#region DEFINES
STATIC DEFINE JTRJOBI_CARGA := 109 
STATIC DEFINE JTRJOBI_ESCCOD := 110 
STATIC DEFINE JTRJOBI_ESCFUN := 112 
STATIC DEFINE JTRJOBI_NOMTEC := 108 
STATIC DEFINE JTRJOBI_NUMERO := 105 
STATIC DEFINE JTRJOBI_NUMTEC := 107 
STATIC DEFINE JTRJOBI_PECA := 106 
STATIC DEFINE JTRJOBI_PEGFUN := 111 
STATIC DEFINE JTRJOBI_SC_CARGA := 104 
STATIC DEFINE JTRJOBI_SC_NOMTEC := 103 
STATIC DEFINE JTRJOBI_SC_NUMERO := 100 
STATIC DEFINE JTRJOBI_SC_NUMTEC := 102 
STATIC DEFINE JTRJOBI_SC_PECA := 101 
#endregion

class jtrjobi inherit DATAWINDOW 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBPECA as DataColumn
	PROTECT oDBNUMTEC as DataColumn
	PROTECT oDBNOMTEC as DataColumn
	PROTECT oDBCARGA as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_PECA as FIXEDTEXT
	protect oDCSC_NUMTEC as FIXEDTEXT
	protect oDCSC_NOMTEC as FIXEDTEXT
	protect oDCSC_CARGA as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCPECA as SINGLELINEEDIT
	protect oDCNUMTEC as SINGLELINEEDIT
	protect oDCNOMTEC as SINGLELINEEDIT
	protect oDCCARGA as SINGLELINEEDIT
	protect oCCesccod as PUSHBUTTON
	protect oCCPEGfun as PUSHBUTTON
	protect oCCESCfun as PUSHBUTTON
// 	instance NUMERO 
// 	instance PECA 
// 	instance NUMTEC 
// 	instance NOMTEC 
// 	instance CARGA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CARGA() 
return self:FieldGet(#CARGA)


assign CARGA(uValue) 
self:FieldPut(#CARGA, uValue)
return CARGA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jtrjobi",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{253,254,220}}

oDCSC_NUMERO := FixedText{self,ResourceID{JTRJOBI_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero",NULL_STRING,NULL_STRING}

oDCSC_PECA := FixedText{self,ResourceID{JTRJOBI_SC_PECA,_GetInst()}}
oDCSC_PECA:HyperLabel := HyperLabel{#SC_PECA,"Peca:",NULL_STRING,NULL_STRING}

oDCSC_NUMTEC := FixedText{self,ResourceID{JTRJOBI_SC_NUMTEC,_GetInst()}}
oDCSC_NUMTEC:HyperLabel := HyperLabel{#SC_NUMTEC,"Funcionario",NULL_STRING,NULL_STRING}

oDCSC_NOMTEC := FixedText{self,ResourceID{JTRJOBI_SC_NOMTEC,_GetInst()}}
oDCSC_NOMTEC:HyperLabel := HyperLabel{#SC_NOMTEC,"Nome",NULL_STRING,NULL_STRING}

oDCSC_CARGA := FixedText{self,ResourceID{JTRJOBI_SC_CARGA,_GetInst()}}
oDCSC_CARGA:HyperLabel := HyperLabel{#SC_CARGA,"Carga:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JTRJOBI_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero",NULL_STRING,"TRJOB_NUMINS"}
oDCNUMERO:BackGround := aBrushes[1]

oDCPECA := SingleLineEdit{self,ResourceID{JTRJOBI_PECA,_GetInst()}}
oDCPECA:FieldSpec := padrao_char_24{}
oDCPECA:HyperLabel := HyperLabel{#PECA,"Peça:",NULL_STRING,"TRJOBI_PECA"}

oDCNUMTEC := SingleLineEdit{self,ResourceID{JTRJOBI_NUMTEC,_GetInst()}}
oDCNUMTEC:FieldSpec := padrao_num_08{}
oDCNUMTEC:HyperLabel := HyperLabel{#NUMTEC,"Nº",NULL_STRING,"TRJOB_NUMINS"}

oDCNOMTEC := SingleLineEdit{self,ResourceID{JTRJOBI_NOMTEC,_GetInst()}}
oDCNOMTEC:FieldSpec := padrao_CHAR_40{}
oDCNOMTEC:HyperLabel := HyperLabel{#NOMTEC,"Nome",NULL_STRING,"TRJOBI_NOMTEC"}

oDCCARGA := SingleLineEdit{self,ResourceID{JTRJOBI_CARGA,_GetInst()}}
oDCCARGA:FieldSpec := padrao_num_05_2{}
oDCCARGA:HyperLabel := HyperLabel{#CARGA,"Carga:",NULL_STRING,"TRJOBI_CARGA"}

oCCesccod := PushButton{self,ResourceID{JTRJOBI_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}
oCCesccod:TooltipText := "Escolher um Produto"

oCCPEGfun := PushButton{self,ResourceID{JTRJOBI_PEGFUN,_GetInst()}}
oCCPEGfun:HyperLabel := HyperLabel{#PEGfun,"-->",NULL_STRING,NULL_STRING}
oCCPEGfun:TooltipText := "Retorna o Nome do Nº Funcionario"

oCCESCfun := PushButton{self,ResourceID{JTRJOBI_ESCFUN,_GetInst()}}
oCCESCfun:HyperLabel := HyperLabel{#ESCfun,"...",NULL_STRING,NULL_STRING}
oCCESCfun:TooltipText := "Exibe lista funcionario  para escolha"

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jtrjobi,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBPECA := DataColumn{padrao_char_24{}}
oDBPECA:Width := 14
oDBPECA:HyperLabel := oDCPECA:HyperLabel 
oDBPECA:Caption := "Peça:"
self:Browser:AddColumn(oDBPECA)

oDBNUMTEC := DataColumn{padrao_num_08{}}
oDBNUMTEC:Width := 11
oDBNUMTEC:HyperLabel := oDCNUMTEC:HyperLabel 
oDBNUMTEC:Caption := "Nº"
self:Browser:AddColumn(oDBNUMTEC)

oDBNOMTEC := DataColumn{padrao_CHAR_40{}}
oDBNOMTEC:Width := 19
oDBNOMTEC:HyperLabel := oDCNOMTEC:HyperLabel 
oDBNOMTEC:Caption := "Nome"
self:Browser:AddColumn(oDBNOMTEC)

oDBCARGA := DataColumn{padrao_num_05_2{}}
oDBCARGA:Width := 10
oDBCARGA:HyperLabel := oDCCARGA:HyperLabel 
oDBCARGA:Caption := "Carga:"
self:Browser:AddColumn(oDBCARGA)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOMTEC() 
return self:FieldGet(#NOMTEC)


assign NOMTEC(uValue) 
self:FieldPut(#NOMTEC, uValue)
return NOMTEC := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access NUMTEC() 
return self:FieldGet(#NUMTEC)


assign NUMTEC(uValue) 
self:FieldPut(#NUMTEC, uValue)
return NUMTEC := uValue


access PECA() 
return self:FieldGet(#PECA)


assign PECA(uValue) 
self:FieldPut(#PECA, uValue)
return PECA := uValue


END CLASS
