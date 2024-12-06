#region DEFINES
STATIC DEFINE JLC_BUSC03 := 127 
STATIC DEFINE JLC_BUSCA := 101 
STATIC DEFINE JLC_BUSCA01 := 119 
STATIC DEFINE JLC_BUSCA02 := 122 
STATIC DEFINE JLC_CDOCUMENTO := 121 
STATIC DEFINE JLC_CMDHOJE01 := 102 
STATIC DEFINE JLC_CNOVODOC := 124 
STATIC DEFINE JLC_CNUMERO := 128 
STATIC DEFINE JLC_CTIPO := 126 
STATIC DEFINE JLC_DATA := 109 
STATIC DEFINE JLC_DOCUMENTO := 106 
STATIC DEFINE JLC_GBOX := 118 
STATIC DEFINE JLC_NOVODATA := 115 
STATIC DEFINE JLC_NOVODOC := 114 
STATIC DEFINE JLC_NUMCOMP := 108 
STATIC DEFINE JLC_NUMERO := 107 
STATIC DEFINE JLC_ORDEM := 100 
STATIC DEFINE JLC_PASTA := 117 
STATIC DEFINE JLC_SC_DATA := 105 
STATIC DEFINE JLC_SC_DOCUMENTO := 102 
STATIC DEFINE JLC_SC_NOVODATA := 111 
STATIC DEFINE JLC_SC_NOVODOC := 110 
STATIC DEFINE JLC_THEFIXEDTEXT10 := 116 
STATIC DEFINE JLC_THEFIXEDTEXT4 := 120 
STATIC DEFINE JLC_THEFIXEDTEXT5 := 123 
STATIC DEFINE JLC_THEFIXEDTEXT6 := 103 
STATIC DEFINE JLC_THEFIXEDTEXT7 := 125 
STATIC DEFINE JLC_THEFIXEDTEXT8 := 112 
STATIC DEFINE JLC_THEFIXEDTEXT9 := 104 
STATIC DEFINE JLC_TIPO := 113 
#endregion

class JLC inherit MYDataWindow 

	PROTECT oDBDOCUMENTO as DataColumn
	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBNUMCOMP as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBNOVODOC as DataColumn
	PROTECT oDBNOVODATA as DataColumn
	PROTECT oDBTIPO as DataColumn
	protect oCCordem as PUSHBUTTON
	protect oCCbusca as PUSHBUTTON
	protect oDCSC_DOCUMENTO as FIXEDTEXT
	protect oDCtheFixedText6 as FIXEDTEXT
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCDOCUMENTO as SINGLELINEEDIT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCNUMCOMP as SINGLELINEEDIT
	protect oDCDATA as SINGLELINEEDIT
	protect oDCSC_NOVODOC as FIXEDTEXT
	protect oDCSC_NOVODATA as FIXEDTEXT
	protect oDCtheFixedText8 as FIXEDTEXT
	protect oDCTIPO as COMBOBOX
	protect oDCNOVODOC as SINGLELINEEDIT
	protect oDCNOVODATA as SINGLELINEEDIT
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oDCPASTA as SINGLELINEEDIT
	protect oDCGBox as GROUPBOX
	protect oCCBusca01 as PUSHBUTTON
	protect oDCtheFixedText4 as FIXEDTEXT
	protect oDCcDOCUMENTO as SINGLELINEEDIT
	protect oCCBusca02 as PUSHBUTTON
	protect oDCtheFixedText5 as FIXEDTEXT
	protect oDCcNOVODOC as SINGLELINEEDIT
	protect oDCtheFixedText7 as FIXEDTEXT
	protect oDCcTIPO as COMBOBOX
	protect oCCBUSC03 as PUSHBUTTON
	protect oDCcNUMERO as SINGLELINEEDIT
// 	instance DOCUMENTO 
// 	instance NUMERO 
// 	instance NUMCOMP 
// 	instance DATA 
// 	instance TIPO 
// 	instance NOVODOC 
// 	instance NOVODATA 
// 	instance PASTA 
// 	instance cDOCUMENTO 
// 	instance cNOVODOC 
// 	instance cTIPO 
// 	instance cNUMERO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD BUSC03() 
LOCAL cBUSCA AS STRING
cBUSCA:=SELF:ODCCTIPO:VALUE+STR(cNUMERO,20)
self:server:setorder(3)
self:server:gotop()
self:server:seek(cBUSCA)
IF self:server:eof
    self:server:gotop()
endif


METHOD busca( ) 
	SELF:KeyFind()

METHOD Busca01() 
self:server:setorder(1)
self:server:gotop()
self:server:seek(cDOCUMENTO)
IF self:server:eof
    self:server:gotop()
endif

METHOD Busca02() 
self:server:setorder(2)
self:server:gotop()
self:server:seek(cNOVODOC)
IF self:server:eof
    self:server:gotop()
endif


access cDOCUMENTO() 
return self:FieldGet(#cDOCUMENTO)


assign cDOCUMENTO(uValue) 
self:FieldPut(#cDOCUMENTO, uValue)
return cDOCUMENTO := uValue


METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("EN","")	


access cNOVODOC() 
return self:FieldGet(#cNOVODOC)


assign cNOVODOC(uValue) 
self:FieldPut(#cNOVODOC, uValue)
return cNOVODOC := uValue


access cNUMERO() 
return self:FieldGet(#cNUMERO)


assign cNUMERO(uValue) 
self:FieldPut(#cNUMERO, uValue)
return cNUMERO := uValue


access cTIPO() 
return self:FieldGet(#cTIPO)


assign cTIPO(uValue) 
self:FieldPut(#cTIPO, uValue)
return cTIPO := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access DOCUMENTO() 
return self:FieldGet(#DOCUMENTO)


assign DOCUMENTO(uValue) 
self:FieldPut(#DOCUMENTO, uValue)
return DOCUMENTO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JLC",_GetInst()},iCtlID)

oCCordem := PushButton{self,ResourceID{JLC_ORDEM,_GetInst()}}
oCCordem:Image := ico_az{}
oCCordem:HyperLabel := HyperLabel{#ordem,NULL_STRING,NULL_STRING,NULL_STRING}
oCCordem:TooltipText := "Ordenar Por Numero"

oCCbusca := PushButton{self,ResourceID{JLC_BUSCA,_GetInst()}}
oCCbusca:Image := ICO_FIND{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_DOCUMENTO := FixedText{self,ResourceID{JLC_SC_DOCUMENTO,_GetInst()}}
oDCSC_DOCUMENTO:HyperLabel := HyperLabel{#SC_DOCUMENTO,"Documento:",NULL_STRING,NULL_STRING}

oDCtheFixedText6 := FixedText{self,ResourceID{JLC_THEFIXEDTEXT6,_GetInst()}}
oDCtheFixedText6:HyperLabel := HyperLabel{#theFixedText6,"Numero",NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{JLC_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Comp.",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JLC_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCDOCUMENTO := SingleLineEdit{self,ResourceID{JLC_DOCUMENTO,_GetInst()}}
oDCDOCUMENTO:FieldSpec := PADRAO_CHAR_20{}
oDCDOCUMENTO:HyperLabel := HyperLabel{#DOCUMENTO,"Documento:",NULL_STRING,"LC_DOCUMENTO"}
oDCDOCUMENTO:TooltipText := "Numero do Documento"

oDCNUMERO := SingleLineEdit{self,ResourceID{JLC_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_10{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"LC_DOCUMENTO"}
oDCNUMERO:TooltipText := "Numero "

oDCNUMCOMP := SingleLineEdit{self,ResourceID{JLC_NUMCOMP,_GetInst()}}
oDCNUMCOMP:FieldSpec := PADRAO_CHAR_10{}
oDCNUMCOMP:HyperLabel := HyperLabel{#NUMCOMP,"Comp",NULL_STRING,"LC_DOCUMENTO"}
oDCNUMCOMP:TooltipText := "Complemento"

oDCDATA := SingleLineEdit{self,ResourceID{JLC_DATA,_GetInst()}}
oDCDATA:FieldSpec := PADRAO_CHAR_10{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"LC_DATA"}
oDCDATA:TooltipText := "Data"

oDCSC_NOVODOC := FixedText{self,ResourceID{JLC_SC_NOVODOC,_GetInst()}}
oDCSC_NOVODOC:HyperLabel := HyperLabel{#SC_NOVODOC,"Substituição/Atualização",NULL_STRING,NULL_STRING}

oDCSC_NOVODATA := FixedText{self,ResourceID{JLC_SC_NOVODATA,_GetInst()}}
oDCSC_NOVODATA:HyperLabel := HyperLabel{#SC_NOVODATA,"Data",NULL_STRING,NULL_STRING}

oDCtheFixedText8 := FixedText{self,ResourceID{JLC_THEFIXEDTEXT8,_GetInst()}}
oDCtheFixedText8:HyperLabel := HyperLabel{#theFixedText8,"Tipo",NULL_STRING,NULL_STRING}

oDCTIPO := combobox{self,ResourceID{JLC_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := PADRAO_CHAR_20{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo",NULL_STRING,NULL_STRING}
oDCTIPO:TooltipText := "Tipo de Norma"

oDCNOVODOC := SingleLineEdit{self,ResourceID{JLC_NOVODOC,_GetInst()}}
oDCNOVODOC:FieldSpec := PADRAO_CHAR_40{}
oDCNOVODOC:HyperLabel := HyperLabel{#NOVODOC,"Sub/Alt",NULL_STRING,"LC_NOVODOC"}
oDCNOVODOC:TooltipText := "Substituição/Atualizacao"

oDCNOVODATA := SingleLineEdit{self,ResourceID{JLC_NOVODATA,_GetInst()}}
oDCNOVODATA:FieldSpec := PADRAO_CHAR_10{}
oDCNOVODATA:HyperLabel := HyperLabel{#NOVODATA,"Data",NULL_STRING,"LC_NOVODATA"}
oDCNOVODATA:TooltipText := "Data Sub/Alt"

oDCtheFixedText10 := FixedText{self,ResourceID{JLC_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"Pasta",NULL_STRING,NULL_STRING}

oDCPASTA := SingleLineEdit{self,ResourceID{JLC_PASTA,_GetInst()}}
oDCPASTA:FieldSpec := PADRAO_CHAR_10{}
oDCPASTA:HyperLabel := HyperLabel{#PASTA,"Numero:",NULL_STRING,"LC_DOCUMENTO"}
oDCPASTA:TooltipText := "Pasta"

oDCGBox := GroupBox{self,ResourceID{JLC_GBOX,_GetInst()}}
oDCGBox:HyperLabel := HyperLabel{#GBox,"Busca",NULL_STRING,NULL_STRING}

oCCBusca01 := PushButton{self,ResourceID{JLC_BUSCA01,_GetInst()}}
oCCBusca01:HyperLabel := HyperLabel{#Busca01,"Busca",NULL_STRING,NULL_STRING}
oCCBusca01:TooltipText := "Clique para Busca o Documento"

oDCtheFixedText4 := FixedText{self,ResourceID{JLC_THEFIXEDTEXT4,_GetInst()}}
oDCtheFixedText4:HyperLabel := HyperLabel{#theFixedText4,"Documento:",NULL_STRING,NULL_STRING}

oDCcDOCUMENTO := SingleLineEdit{self,ResourceID{JLC_CDOCUMENTO,_GetInst()}}
oDCcDOCUMENTO:FieldSpec := PADRAO_CHAR_20{}
oDCcDOCUMENTO:HyperLabel := HyperLabel{#cDOCUMENTO,"Documento:",NULL_STRING,"LC_DOCUMENTO"}
oDCcDOCUMENTO:TooltipText := "Digite o Codigo do Documento Para Busca"

oCCBusca02 := PushButton{self,ResourceID{JLC_BUSCA02,_GetInst()}}
oCCBusca02:HyperLabel := HyperLabel{#Busca02,"Busca",NULL_STRING,NULL_STRING}
oCCBusca02:TooltipText := "Clique para Buscar Sub/Atual"

oDCtheFixedText5 := FixedText{self,ResourceID{JLC_THEFIXEDTEXT5,_GetInst()}}
oDCtheFixedText5:HyperLabel := HyperLabel{#theFixedText5,"Sub./Atual.",NULL_STRING,NULL_STRING}

oDCcNOVODOC := SingleLineEdit{self,ResourceID{JLC_CNOVODOC,_GetInst()}}
oDCcNOVODOC:FieldSpec := PADRAO_CHAR_40{}
oDCcNOVODOC:HyperLabel := HyperLabel{#cNOVODOC,"Novodoc:",NULL_STRING,"LC_NOVODOC"}
oDCcNOVODOC:TooltipText := "Digite  A Sub/Atualização Para Busca"

oDCtheFixedText7 := FixedText{self,ResourceID{JLC_THEFIXEDTEXT7,_GetInst()}}
oDCtheFixedText7:HyperLabel := HyperLabel{#theFixedText7,"Numero",NULL_STRING,NULL_STRING}

oDCcTIPO := combobox{self,ResourceID{JLC_CTIPO,_GetInst()}}
oDCcTIPO:FieldSpec := PADRAO_CHAR_20{}
oDCcTIPO:HyperLabel := HyperLabel{#cTIPO,"Tipo",NULL_STRING,NULL_STRING}
oDCcTIPO:TooltipText := "Digite O Tipo Para Busca"

oCCBUSC03 := PushButton{self,ResourceID{JLC_BUSC03,_GetInst()}}
oCCBUSC03:HyperLabel := HyperLabel{#BUSC03,"Busca",NULL_STRING,NULL_STRING}
oCCBUSC03:TooltipText := "Clique Para Busca Numero/tipo"

oDCcNUMERO := SingleLineEdit{self,ResourceID{JLC_CNUMERO,_GetInst()}}
oDCcNUMERO:FieldSpec := PADRAO_NUM_10{}
oDCcNUMERO:HyperLabel := HyperLabel{#cNUMERO,"Documento:",NULL_STRING,"LC_DOCUMENTO"}
oDCcNUMERO:TooltipText := "Digite o Numero"

self:Caption := "Controle de Normas"
self:HyperLabel := HyperLabel{#JLC,"Controle de Normas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDOCUMENTO := DataColumn{PADRAO_CHAR_20{}}
oDBDOCUMENTO:Width := 11
oDBDOCUMENTO:HyperLabel := oDCDOCUMENTO:HyperLabel 
oDBDOCUMENTO:Caption := "Documento:"
self:Browser:AddColumn(oDBDOCUMENTO)

oDBNUMERO := DataColumn{PADRAO_NUM_10{}}
oDBNUMERO:Width := 14
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBNUMCOMP := DataColumn{PADRAO_CHAR_10{}}
oDBNUMCOMP:Width := 13
oDBNUMCOMP:HyperLabel := oDCNUMCOMP:HyperLabel 
oDBNUMCOMP:Caption := "Comp"
self:Browser:AddColumn(oDBNUMCOMP)

oDBDATA := DataColumn{PADRAO_CHAR_10{}}
oDBDATA:Width := 11
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)

oDBNOVODOC := DataColumn{PADRAO_CHAR_40{}}
oDBNOVODOC:Width := 18
oDBNOVODOC:HyperLabel := oDCNOVODOC:HyperLabel 
oDBNOVODOC:Caption := "Sub/Alt"
self:Browser:AddColumn(oDBNOVODOC)

oDBNOVODATA := DataColumn{PADRAO_CHAR_10{}}
oDBNOVODATA:Width := 10
oDBNOVODATA:HyperLabel := oDCNOVODATA:HyperLabel 
oDBNOVODATA:Caption := "Data"
self:Browser:AddColumn(oDBNOVODATA)

oDBTIPO := DataColumn{PADRAO_CHAR_20{}}
oDBTIPO:Width := 14
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "Tipo"
self:Browser:AddColumn(oDBTIPO)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOVODATA() 
return self:FieldGet(#NOVODATA)


assign NOVODATA(uValue) 
self:FieldPut(#NOVODATA, uValue)
return NOVODATA := uValue


access NOVODOC() 
return self:FieldGet(#NOVODOC)


assign NOVODOC(uValue) 
self:FieldPut(#NOVODOC, uValue)
return NOVODOC := uValue


access NUMCOMP() 
return self:FieldGet(#NUMCOMP)


assign NUMCOMP(uValue) 
self:FieldPut(#NUMCOMP, uValue)
return NUMCOMP := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


METHOD ordem( ) 
	SELF:KeyFind()

access PASTA() 
return self:FieldGet(#PASTA)


assign PASTA(uValue) 
self:FieldPut(#PASTA, uValue)
return PASTA := uValue


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
    oDCTIPO:FillUsing({{"_","_"}})
     oDccTIPO:FillUsing({{"_","_"}})

 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


END CLASS
