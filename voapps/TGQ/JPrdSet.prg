#region DEFINES
STATIC DEFINE JPRDSET_BUSCARACF := 108 
STATIC DEFINE JPRDSET_CODIGO := 101 
STATIC DEFINE JPRDSET_CODIGOINT := 100 
STATIC DEFINE JPRDSET_FIXEDTEXT1 := 104 
STATIC DEFINE JPRDSET_FIXEDTEXT2 := 105 
STATIC DEFINE JPRDSET_FIXEDTEXT3 := 106 
STATIC DEFINE JPRDSET_NOME := 102 
STATIC DEFINE JPRDSET_PORNUM := 107 
STATIC DEFINE JPRDSET_SEQAREA := 103 
#endregion

class jprdset inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBCODIGOINT as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBSEQAREA as DataColumn
	protect oDCCODIGOINT as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSEQAREA as SINGLELINEEDIT
	protect oDCFixedText1 as FIXEDTEXT
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCFixedText3 as FIXEDTEXT
	protect oCCPORNUM as PUSHBUTTON
	protect oCCbuscaRACF as PUSHBUTTON
// 	instance CODIGOINT 
// 	instance CODIGO 
// 	instance NOME 
// 	instance SEQAREA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD buscaRACF( ) 
	 SELF:KeyFind()

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODIGOINT() 
return self:FieldGet(#CODIGOINT)


assign CODIGOINT(uValue) 
self:FieldPut(#CODIGOINT, uValue)
return CODIGOINT := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jprdset",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCCODIGOINT := SingleLineEdit{self,ResourceID{JPRDSET_CODIGOINT,_GetInst()}}
oDCCODIGOINT:FieldSpec := padrao_char_24{}
oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT,"Codigo:",NULL_STRING,"MS01_CODIGO"}
oDCCODIGOINT:BackGround := aBrushes[1]
oDCCODIGOINT:Font(aFonts[1], FALSE)

oDCCODIGO := SingleLineEdit{self,ResourceID{JPRDSET_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MS01_CODIGO"}
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[1], FALSE)

oDCNOME := SingleLineEdit{self,ResourceID{JPRDSET_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MS01_NOME"}
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[1], FALSE)

oDCSEQAREA := SingleLineEdit{self,ResourceID{JPRDSET_SEQAREA,_GetInst()}}
oDCSEQAREA:HyperLabel := HyperLabel{#SEQAREA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText1 := FixedText{self,ResourceID{JPRDSET_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Codigo",NULL_STRING,NULL_STRING}

oDCFixedText2 := FixedText{self,ResourceID{JPRDSET_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Nome",NULL_STRING,NULL_STRING}

oDCFixedText3 := FixedText{self,ResourceID{JPRDSET_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Setores",NULL_STRING,NULL_STRING}

oCCPORNUM := PushButton{self,ResourceID{JPRDSET_PORNUM,_GetInst()}}
oCCPORNUM:Image := ico_az{}
oCCPORNUM:HyperLabel := HyperLabel{#PORNUM,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaRACF := PushButton{self,ResourceID{JPRDSET_BUSCARACF,_GetInst()}}
oCCbuscaRACF:Image := ico_find{}
oCCbuscaRACF:HyperLabel := HyperLabel{#buscaRACF,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Produtos Setor"
self:HyperLabel := HyperLabel{#jprdset,"Produtos Setor",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 22
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBCODIGOINT := DataColumn{padrao_char_24{}}
oDBCODIGOINT:Width := 22
oDBCODIGOINT:HyperLabel := oDCCODIGOINT:HyperLabel 
oDBCODIGOINT:Caption := "Codigo:"
oDBCODIGOINT:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGOINT)

oDBNOME := DataColumn{padrao_CHAR_40{}}
oDBNOME:Width := 38
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)

oDBSEQAREA := DataColumn{11}
oDBSEQAREA:Width := 11
oDBSEQAREA:HyperLabel := oDCSEQAREA:HyperLabel 
oDBSEQAREA:Caption := ""
self:Browser:AddColumn(oDBSEQAREA)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


METHOD PORNUM( ) 
	SELF:keyfind()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	   FabCenterWindow( SELF )
	RETURN NIL


access SEQAREA() 
return self:FieldGet(#SEQAREA)


assign SEQAREA(uValue) 
self:FieldPut(#SEQAREA, uValue)
return SEQAREA := uValue


END CLASS
