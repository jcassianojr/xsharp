#region DEFINES
STATIC DEFINE JZVE_BUSCAOV := 101 
STATIC DEFINE JZVE_COGNOME := 105 
STATIC DEFINE JZVE_LOCAL1 := 107 
STATIC DEFINE JZVE_LOCAL2 := 108 
STATIC DEFINE JZVE_LOCAL3 := 109 
STATIC DEFINE JZVE_LOCAL4 := 110 
STATIC DEFINE JZVE_LOCAL5 := 111 
STATIC DEFINE JZVE_LOCAL6 := 112 
STATIC DEFINE JZVE_NUMERO := 104 
STATIC DEFINE JZVE_POROV := 100 
STATIC DEFINE JZVE_SC_COGNOME := 103 
STATIC DEFINE JZVE_SC_NUMERO := 102 
STATIC DEFINE JZVE_THEGROUPBOX1 := 106 
#endregion

class JZVE inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBLOCAL1 as DataColumn
	protect oCCporov as PUSHBUTTON
	protect oCCbuscaov as PUSHBUTTON
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCtheGroupBox1 as GROUPBOX
	protect oDCLOCAL1 as SINGLELINEEDIT
	protect oDCLOCAL2 as SINGLELINEEDIT
	protect oDCLOCAL3 as SINGLELINEEDIT
	protect oDCLOCAL4 as SINGLELINEEDIT
	protect oDCLOCAL5 as SINGLELINEEDIT
	protect oDCLOCAL6 as SINGLELINEEDIT
// 	instance NUMERO 
// 	instance COGNOME 
// 	instance LOCAL1 
// 	instance LOCAL2 
// 	instance LOCAL3 
// 	instance LOCAL4 
// 	instance LOCAL5 
// 	instance LOCAL6 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JZVE",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oCCporov := PushButton{self,ResourceID{JZVE_POROV,_GetInst()}}
oCCporov:Image := ico_az{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaov := PushButton{self,ResourceID{JZVE_BUSCAOV,_GetInst()}}
oCCbuscaov:Image := ico_find{}
oCCbuscaov:HyperLabel := HyperLabel{#buscaov,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JZVE_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Regiao",NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{self,ResourceID{JZVE_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JZVE_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_char_06{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Regiao",NULL_STRING,"MH01_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]

oDCCOGNOME := SingleLineEdit{self,ResourceID{JZVE_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := padrao_char_12{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"MH01_COGNOME"}
oDCCOGNOME:BackGround := aBrushes[1]

oDCtheGroupBox1 := GroupBox{self,ResourceID{JZVE_THEGROUPBOX1,_GetInst()}}
oDCtheGroupBox1:HyperLabel := HyperLabel{#theGroupBox1,"Areas Abrangidas",NULL_STRING,NULL_STRING}

oDCLOCAL1 := SingleLineEdit{self,ResourceID{JZVE_LOCAL1,_GetInst()}}
oDCLOCAL1:FieldSpec := padrao_char_75{}
oDCLOCAL1:HyperLabel := HyperLabel{#LOCAL1,"Local1:",NULL_STRING,"MH01_LOCAL1"}
oDCLOCAL1:BackGround := aBrushes[1]

oDCLOCAL2 := SingleLineEdit{self,ResourceID{JZVE_LOCAL2,_GetInst()}}
oDCLOCAL2:FieldSpec := padrao_char_75{}
oDCLOCAL2:HyperLabel := HyperLabel{#LOCAL2,"Local2:",NULL_STRING,"MH01_LOCAL2"}
oDCLOCAL2:BackGround := aBrushes[1]

oDCLOCAL3 := SingleLineEdit{self,ResourceID{JZVE_LOCAL3,_GetInst()}}
oDCLOCAL3:FieldSpec := padrao_char_75{}
oDCLOCAL3:HyperLabel := HyperLabel{#LOCAL3,"Local3:",NULL_STRING,"MH01_LOCAL3"}
oDCLOCAL3:BackGround := aBrushes[1]

oDCLOCAL4 := SingleLineEdit{self,ResourceID{JZVE_LOCAL4,_GetInst()}}
oDCLOCAL4:FieldSpec := padrao_char_75{}
oDCLOCAL4:HyperLabel := HyperLabel{#LOCAL4,"Local4:",NULL_STRING,"MH01_LOCAL4"}
oDCLOCAL4:BackGround := aBrushes[1]

oDCLOCAL5 := SingleLineEdit{self,ResourceID{JZVE_LOCAL5,_GetInst()}}
oDCLOCAL5:FieldSpec := padrao_char_75{}
oDCLOCAL5:HyperLabel := HyperLabel{#LOCAL5,"Local5:",NULL_STRING,"MH01_LOCAL5"}
oDCLOCAL5:BackGround := aBrushes[1]

oDCLOCAL6 := SingleLineEdit{self,ResourceID{JZVE_LOCAL6,_GetInst()}}
oDCLOCAL6:FieldSpec := padrao_char_75{}
oDCLOCAL6:HyperLabel := HyperLabel{#LOCAL6,"Local6:",NULL_STRING,"MH01_LOCAL6"}
oDCLOCAL6:BackGround := aBrushes[1]

self:Caption := "Zonas de Vendas"
self:HyperLabel := HyperLabel{#JZVE,"Zonas de Vendas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_char_06{}}
oDBNUMERO:Width := 13
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Regiao"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBCOGNOME := DataColumn{padrao_char_12{}}
oDBCOGNOME:Width := 17
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
oDBCOGNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCOGNOME)

oDBLOCAL1 := DataColumn{padrao_char_75{}}
oDBLOCAL1:Width := 25
oDBLOCAL1:HyperLabel := oDCLOCAL1:HyperLabel 
oDBLOCAL1:Caption := "Local1:"
oDBLOCAL1:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBLOCAL1)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LOCAL1() 
return self:FieldGet(#LOCAL1)


assign LOCAL1(uValue) 
self:FieldPut(#LOCAL1, uValue)
return LOCAL1 := uValue


access LOCAL2() 
return self:FieldGet(#LOCAL2)


assign LOCAL2(uValue) 
self:FieldPut(#LOCAL2, uValue)
return LOCAL2 := uValue


access LOCAL3() 
return self:FieldGet(#LOCAL3)


assign LOCAL3(uValue) 
self:FieldPut(#LOCAL3, uValue)
return LOCAL3 := uValue


access LOCAL4() 
return self:FieldGet(#LOCAL4)


assign LOCAL4(uValue) 
self:FieldPut(#LOCAL4, uValue)
return LOCAL4 := uValue


access LOCAL5() 
return self:FieldGet(#LOCAL5)


assign LOCAL5(uValue) 
self:FieldPut(#LOCAL5, uValue)
return LOCAL5 := uValue


access LOCAL6() 
return self:FieldGet(#LOCAL6)


assign LOCAL6(uValue) 
self:FieldPut(#LOCAL6, uValue)
return LOCAL6 := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


END CLASS
