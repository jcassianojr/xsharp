#region DEFINES
STATIC DEFINE JUF_ALIQUOTA := 104 
STATIC DEFINE JUF_BUSCANUM := 106 
STATIC DEFINE JUF_FIXEDTEXT1 := 100 
STATIC DEFINE JUF_FIXEDTEXT2 := 101 
STATIC DEFINE JUF_FIXEDTEXT3 := 108 
STATIC DEFINE JUF_NOMEEXT := 103 
STATIC DEFINE JUF_PORNUM := 105 
STATIC DEFINE JUF_SITE := 107 
STATIC DEFINE JUF_UFICMS := 102 
#endregion

class jUF inherit MYDataWindow 

	PROTECT oDBUFICMS as DataColumn
	PROTECT oDBNOMEEXT as DataColumn
	PROTECT oDBALIQUOTA as DataColumn
	protect oDCFixedText1 as FIXEDTEXT
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCUFICMS as SINGLELINEEDIT
	protect oDCNOMEEXT as SINGLELINEEDIT
	protect oDCALIQUOTA as RIGHTSLE
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oDCsite as RIGHTSLE
	protect oDCFixedText3 as FIXEDTEXT
// 	instance UFICMS 
// 	instance NOMEEXT 
// 	instance ALIQUOTA 
// 	instance site 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ALIQUOTA() 
return self:FieldGet(#ALIQUOTA)


assign ALIQUOTA(uValue) 
self:FieldPut(#ALIQUOTA, uValue)
return ALIQUOTA := uValue


METHOD append( ) 
	alert("Operacao Bloqueada")

METHOD buscanum( ) 
	SELF:keyfind()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()	

METHOD delete( ) 
	alert("Operacao Bloqueada")	

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jUF",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200,10}}

oDCFixedText1 := FixedText{self,ResourceID{JUF_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"UF",NULL_STRING,NULL_STRING}

oDCFixedText2 := FixedText{self,ResourceID{JUF_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Aliquota",NULL_STRING,NULL_STRING}

oDCUFICMS := SingleLineEdit{self,ResourceID{JUF_UFICMS,_GetInst()}}
oDCUFICMS:FieldSpec := PADRAO_CHAR_02{}
oDCUFICMS:HyperLabel := HyperLabel{#UFICMS,"UF",NULL_STRING,NULL_STRING}
oDCUFICMS:BackGround := aBrushes[1]
oDCUFICMS:Font(aFonts[1], FALSE)

oDCNOMEEXT := SingleLineEdit{self,ResourceID{JUF_NOMEEXT,_GetInst()}}
oDCNOMEEXT:FieldSpec := PADRAO_CHAR_20{}
oDCNOMEEXT:HyperLabel := HyperLabel{#NOMEEXT,"Nome",NULL_STRING,NULL_STRING}
oDCNOMEEXT:BackGround := aBrushes[1]
oDCNOMEEXT:Font(aFonts[1], FALSE)

oDCALIQUOTA := rightSle{self,ResourceID{JUF_ALIQUOTA,_GetInst()}}
oDCALIQUOTA:FieldSpec := PADRAO_NUM_05_2{}
oDCALIQUOTA:HyperLabel := HyperLabel{#ALIQUOTA,"Aliquota",NULL_STRING,NULL_STRING}

oCCpornum := PushButton{self,ResourceID{JUF_PORNUM,_GetInst()}}
oCCpornum:Image := ico_az{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,"Ordenar por Numero",NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

oCCbuscanum := PushButton{self,ResourceID{JUF_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ico_find{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,"Localizar Numero",NULL_STRING}
oCCbuscanum:TooltipText := "Clique Para Localizar Por Numero"

oDCsite := rightSle{self,ResourceID{JUF_SITE,_GetInst()}}
oDCsite:FieldSpec := padrao_char_30{}
oDCsite:HyperLabel := HyperLabel{#site,"Aliquota",NULL_STRING,NULL_STRING}

oDCFixedText3 := FixedText{self,ResourceID{JUF_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"site",NULL_STRING,NULL_STRING}

self:Caption := "Estados Aliquotas"
self:HyperLabel := HyperLabel{#jUF,"Estados Aliquotas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBUFICMS := DataColumn{PADRAO_CHAR_02{}}
oDBUFICMS:Width := 8
oDBUFICMS:HyperLabel := oDCUFICMS:HyperLabel 
oDBUFICMS:Caption := "UF"
oDBUFICMS:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBUFICMS)

oDBNOMEEXT := DataColumn{PADRAO_CHAR_20{}}
oDBNOMEEXT:Width := 17
oDBNOMEEXT:HyperLabel := oDCNOMEEXT:HyperLabel 
oDBNOMEEXT:Caption := "Nome"
oDBNOMEEXT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOMEEXT)

oDBALIQUOTA := DataColumn{PADRAO_NUM_05_2{}}
oDBALIQUOTA:Width := 17
oDBALIQUOTA:HyperLabel := oDCALIQUOTA:HyperLabel 
oDBALIQUOTA:Caption := "Aliquota"
self:Browser:AddColumn(oDBALIQUOTA)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOMEEXT() 
return self:FieldGet(#NOMEEXT)


assign NOMEEXT(uValue) 
self:FieldPut(#NOMEEXT, uValue)
return NOMEEXT := uValue


METHOD pornum( ) 	
	SELF:keyfind()
	

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   FabCenterWindow( SELF )
 RETURN SELF

access site() 
return self:FieldGet(#site)


assign site(uValue) 
self:FieldPut(#site, uValue)
return site := uValue


METHOD Timer() 
   SELF:SERVER:COMMIT()	

access UFICMS() 
return self:FieldGet(#UFICMS)


assign UFICMS(uValue) 
self:FieldPut(#UFICMS, uValue)
return UFICMS := uValue


END CLASS
