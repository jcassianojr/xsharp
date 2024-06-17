#region DEFINES
STATIC DEFINE JCRTAUM_DATA := 109 
STATIC DEFINE JCRTAUM_HORA := 105 
STATIC DEFINE JCRTAUM_SALA := 110 
STATIC DEFINE JCRTAUM_SC_DATA := 101 
STATIC DEFINE JCRTAUM_SC_HORA := 102 
STATIC DEFINE JCRTAUM_SC_TIPO := 100 
STATIC DEFINE JCRTAUM_SC_VALOR := 103 
STATIC DEFINE JCRTAUM_SC_VALOR1 := 111 
STATIC DEFINE JCRTAUM_TEMPERATURA := 108 
STATIC DEFINE JCRTAUM_TIPO := 104 
STATIC DEFINE JCRTAUM_UMIDADE := 107 
STATIC DEFINE JCRTAUM_VALOR := 106 
#endregion

class JCRTAUM inherit MYDataWindow 

	PROTECT oDBTIPO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBHORA as DataColumn
	PROTECT oDBVALOR as DataColumn
	PROTECT oDBSALA as DataColumn
	protect oDCSC_TIPO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_HORA as FIXEDTEXT
	protect oDCSC_VALOR as FIXEDTEXT
	protect oDCTIPO as SINGLELINEEDIT
	protect oDCHORA as RIGHTSLE
	protect oDCVALOR as RIGHTSLE
	protect oCCUmidade as PUSHBUTTON
	protect oCCTemperatura as PUSHBUTTON
	protect oDCDATA as DATETIMEPICKER
	protect oDCSALA as SINGLELINEEDIT
	protect oDCSC_VALOR1 as FIXEDTEXT
// 	instance TIPO 
// 	instance HORA 
// 	instance VALOR 
// 	instance SALA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD APPEND() 
SUPER:Append()	
SELF:SERVER:FIELDPUT("TIPO","T")	
SELF:SERVER:FIELDPUT("DATA",Today())
SELF:SERVER:FIELDPUT("HORA",Val(Left(StrTran(Time(),":","."),5)))

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("CP","GC")	


access HORA() 
return self:FieldGet(#HORA)


assign HORA(uValue) 
self:FieldPut(#HORA, uValue)
return HORA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCRTAUM",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_TIPO := FixedText{self,ResourceID{JCRTAUM_SC_TIPO,_GetInst()}}
oDCSC_TIPO:HyperLabel := HyperLabel{#SC_TIPO,"Tipo:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JCRTAUM_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_HORA := FixedText{self,ResourceID{JCRTAUM_SC_HORA,_GetInst()}}
oDCSC_HORA:HyperLabel := HyperLabel{#SC_HORA,"Hora:",NULL_STRING,NULL_STRING}

oDCSC_VALOR := FixedText{self,ResourceID{JCRTAUM_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor:",NULL_STRING,NULL_STRING}

oDCTIPO := SingleLineEdit{self,ResourceID{JCRTAUM_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := PADRAO_CHAR_01{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo:",NULL_STRING,"CRTAUM_TIPO"}
oDCTIPO:BackGround := aBrushes[1]
oDCTIPO:Font(aFonts[1], FALSE)

oDCHORA := rightSle{self,ResourceID{JCRTAUM_HORA,_GetInst()}}
oDCHORA:FieldSpec := padrao_num_05_2{}
oDCHORA:HyperLabel := HyperLabel{#HORA,"Hora:",NULL_STRING,"CRTAUM_HORA"}

oDCVALOR := rightSle{self,ResourceID{JCRTAUM_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := padrao_num_08{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Valor:",NULL_STRING,"CRTAUM_VALOR"}

oCCUmidade := PushButton{self,ResourceID{JCRTAUM_UMIDADE,_GetInst()}}
oCCUmidade:HyperLabel := HyperLabel{#Umidade,"Umidade",NULL_STRING,NULL_STRING}

oCCTemperatura := PushButton{self,ResourceID{JCRTAUM_TEMPERATURA,_GetInst()}}
oCCTemperatura:HyperLabel := HyperLabel{#Temperatura,"Temperatura",NULL_STRING,NULL_STRING}

oDCDATA := DateTimePicker{self,ResourceID{JCRTAUM_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data",NULL_STRING,NULL_STRING}

oDCSALA := SingleLineEdit{self,ResourceID{JCRTAUM_SALA,_GetInst()}}
oDCSALA:FieldSpec := padrao_char_05{}
oDCSALA:HyperLabel := HyperLabel{#SALA,"Sala",NULL_STRING,"CRTAUM_VALOR"}

oDCSC_VALOR1 := FixedText{self,ResourceID{JCRTAUM_SC_VALOR1,_GetInst()}}
oDCSC_VALOR1:HyperLabel := HyperLabel{#SC_VALOR1,"Sala",NULL_STRING,NULL_STRING}

self:Caption := "Carta Temperatura/Umidade"
self:HyperLabel := HyperLabel{#JCRTAUM,"Carta Temperatura/Umidade",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTIPO := DataColumn{PADRAO_CHAR_01{}}
oDBTIPO:Width := 11
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "Tipo:"
oDBTIPO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTIPO)

oDBDATA := DataColumn{date_field{}}
oDBDATA:Width := 14
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data"
self:Browser:AddColumn(oDBDATA)

oDBHORA := DataColumn{padrao_num_05_2{}}
oDBHORA:Width := 12
oDBHORA:HyperLabel := oDCHORA:HyperLabel 
oDBHORA:Caption := "Hora:"
self:Browser:AddColumn(oDBHORA)

oDBVALOR := DataColumn{padrao_num_08{}}
oDBVALOR:Width := 12
oDBVALOR:HyperLabel := oDCVALOR:HyperLabel 
oDBVALOR:Caption := "Valor:"
self:Browser:AddColumn(oDBVALOR)

oDBSALA := DataColumn{padrao_char_05{}}
oDBSALA:Width := 10
oDBSALA:HyperLabel := oDCSALA:HyperLabel 
oDBSALA:Caption := "Sala"
self:Browser:AddColumn(oDBSALA)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   FabCenterWindow( SELF )
 RETURN SELF

access SALA() 
return self:FieldGet(#SALA)


assign SALA(uValue) 
self:FieldPut(#SALA, uValue)
return SALA := uValue


METHOD Temperatura( ) 
	SELF:SERVER:FIELDPUT("TIPO","T")	

METHOD Timer() 
   SELF:SERVER:COMMIT()


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


METHOD Umidade( ) 
	SELF:SERVER:FIELDPUT("TIPO","U")

access VALOR() 
return self:FieldGet(#VALOR)


assign VALOR(uValue) 
self:FieldPut(#VALOR, uValue)
return VALOR := uValue


END CLASS
