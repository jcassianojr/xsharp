#region DEFINES
STATIC DEFINE JCRM3L_CODIGO := 100 
STATIC DEFINE JCRM3L_DESC01 := 106 
STATIC DEFINE JCRM3L_DESC02 := 105 
STATIC DEFINE JCRM3L_DESC03 := 104 
STATIC DEFINE JCRM3L_DESC04 := 103 
STATIC DEFINE JCRM3L_DESC05 := 102 
STATIC DEFINE JCRM3L_FIXEDTEXT1 := 101 
STATIC DEFINE JCRM3L_FIXEDTEXT2 := 107 
STATIC DEFINE JCRM3L_FIXEDTEXT3 := 108 
STATIC DEFINE JCRM3L_NVEZES := 110 
STATIC DEFINE JCRM3L_RACF := 109 
#endregion

class jcrm3l inherit DATAWINDOW 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBRACF as DataColumn
	PROTECT oDBNVEZES as DataColumn
	PROTECT oDBDESC01 as DataColumn
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCFixedText1 as FIXEDTEXT
	protect oDCDESC05 as SINGLELINEEDIT
	protect oDCDESC04 as SINGLELINEEDIT
	protect oDCDESC03 as SINGLELINEEDIT
	protect oDCDESC02 as SINGLELINEEDIT
	protect oDCDESC01 as SINGLELINEEDIT
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCFixedText3 as FIXEDTEXT
	protect oDCRACF as RIGHTSLE
	protect oDCNVEZES as RIGHTSLE
// 	instance CODIGO 
// 	instance DESC05 
// 	instance DESC04 
// 	instance DESC03 
// 	instance DESC02 
// 	instance DESC01 
// 	instance RACF 
// 	instance NVEZES 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DESC01() 
return self:FieldGet(#DESC01)


assign DESC01(uValue) 
self:FieldPut(#DESC01, uValue)
return DESC01 := uValue


access DESC02() 
return self:FieldGet(#DESC02)


assign DESC02(uValue) 
self:FieldPut(#DESC02, uValue)
return DESC02 := uValue


access DESC03() 
return self:FieldGet(#DESC03)


assign DESC03(uValue) 
self:FieldPut(#DESC03, uValue)
return DESC03 := uValue


access DESC04() 
return self:FieldGet(#DESC04)


assign DESC04(uValue) 
self:FieldPut(#DESC04, uValue)
return DESC04 := uValue


access DESC05() 
return self:FieldGet(#DESC05)


assign DESC05(uValue) 
self:FieldPut(#DESC05, uValue)
return DESC05 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcrm3l",_GetInst()},iCtlID)

oDCCODIGO := SingleLineEdit{self,ResourceID{JCRM3L_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo",NULL_STRING,NULL_STRING}

oDCFixedText1 := FixedText{self,ResourceID{JCRM3L_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Codigo",NULL_STRING,NULL_STRING}

oDCDESC05 := SingleLineEdit{self,ResourceID{JCRM3L_DESC05,_GetInst()}}
oDCDESC05:FieldSpec := PADRAO_CHAR_90{}
oDCDESC05:HyperLabel := HyperLabel{#DESC05,"Desc03:",NULL_STRING,"RACF_DESC03"}

oDCDESC04 := SingleLineEdit{self,ResourceID{JCRM3L_DESC04,_GetInst()}}
oDCDESC04:FieldSpec := PADRAO_CHAR_90{}
oDCDESC04:HyperLabel := HyperLabel{#DESC04,"Desc03:",NULL_STRING,"RACF_DESC03"}

oDCDESC03 := SingleLineEdit{self,ResourceID{JCRM3L_DESC03,_GetInst()}}
oDCDESC03:FieldSpec := PADRAO_CHAR_90{}
oDCDESC03:HyperLabel := HyperLabel{#DESC03,"Desc03:",NULL_STRING,"RACF_DESC03"}

oDCDESC02 := SingleLineEdit{self,ResourceID{JCRM3L_DESC02,_GetInst()}}
oDCDESC02:FieldSpec := PADRAO_CHAR_90{}
oDCDESC02:HyperLabel := HyperLabel{#DESC02,"Desc02:",NULL_STRING,"RACF_DESC02"}

oDCDESC01 := SingleLineEdit{self,ResourceID{JCRM3L_DESC01,_GetInst()}}
oDCDESC01:FieldSpec := PADRAO_CHAR_90{}
oDCDESC01:HyperLabel := HyperLabel{#DESC01,"Erro",NULL_STRING,"RACF_DESC01"}

oDCFixedText2 := FixedText{self,ResourceID{JCRM3L_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Racf",NULL_STRING,NULL_STRING}

oDCFixedText3 := FixedText{self,ResourceID{JCRM3L_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Vezes",NULL_STRING,NULL_STRING}

oDCRACF := rightSle{self,ResourceID{JCRM3L_RACF,_GetInst()}}
oDCRACF:FieldSpec := PADRAO_NUM_08{}
oDCRACF:HyperLabel := HyperLabel{#RACF,"Racf",NULL_STRING,NULL_STRING}

oDCNVEZES := rightSle{self,ResourceID{JCRM3L_NVEZES,_GetInst()}}
oDCNVEZES:FieldSpec := PADRAO_NUM_08{}
oDCNVEZES:HyperLabel := HyperLabel{#NVEZES,"Falta",NULL_STRING,NULL_STRING}

self:Caption := "Marcadas Racf"
self:HyperLabel := HyperLabel{#jcrm3l,"Marcadas Racf",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 34
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo"
self:Browser:AddColumn(oDBCODIGO)

oDBRACF := DataColumn{PADRAO_NUM_08{}}
oDBRACF:Width := 10
oDBRACF:HyperLabel := oDCRACF:HyperLabel 
oDBRACF:Caption := "Racf"
self:Browser:AddColumn(oDBRACF)

oDBNVEZES := DataColumn{PADRAO_NUM_08{}}
oDBNVEZES:Width := 8
oDBNVEZES:HyperLabel := oDCNVEZES:HyperLabel 
oDBNVEZES:Caption := "Falta"
self:Browser:AddColumn(oDBNVEZES)

oDBDESC01 := DataColumn{PADRAO_CHAR_90{}}
oDBDESC01:Width := 31
oDBDESC01:HyperLabel := oDCDESC01:HyperLabel 
oDBDESC01:Caption := "Erro"
self:Browser:AddColumn(oDBDESC01)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NVEZES() 
return self:FieldGet(#NVEZES)


assign NVEZES(uValue) 
self:FieldPut(#NVEZES, uValue)
return NVEZES := uValue


access RACF() 
return self:FieldGet(#RACF)


assign RACF(uValue) 
self:FieldPut(#RACF, uValue)
return RACF := uValue


END CLASS
