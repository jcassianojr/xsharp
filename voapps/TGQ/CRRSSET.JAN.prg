#region DEFINES
STATIC DEFINE JSET_BUSCANUM := 108 
STATIC DEFINE JSET_CODIGO := 102 
STATIC DEFINE JSET_COGNOME := 106 
STATIC DEFINE JSET_GRAFICO := 105 
STATIC DEFINE JSET_NOME := 103 
STATIC DEFINE JSET_PORNUM := 107 
STATIC DEFINE JSET_SC_CODIGO := 100 
STATIC DEFINE JSET_SC_COGNOME := 104 
STATIC DEFINE JSET_SC_NOME := 101 
#endregion

class JSET inherit MYDataWindow 

	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCGRAFICO as CHECKBOX
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oCCPORNUM as PUSHBUTTON
	protect oCCBuscanum as PUSHBUTTON
// 	instance CODIGO 
// 	instance NOME 
// 	instance GRAFICO 
// 	instance COGNOME 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Buscanum( ) 
	SELF:KeyFind()

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


access GRAFICO() 
return self:FieldGet(#GRAFICO)


assign GRAFICO(uValue) 
self:FieldPut(#GRAFICO, uValue)
return GRAFICO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JSET",_GetInst()},iCtlID)

oDCSC_CODIGO := FixedText{self,ResourceID{JSET_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JSET_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JSET_CODIGO,_GetInst()}}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"CRRSSET_CODIGO"}
oDCCODIGO:FieldSpec := PADRAO_CHAR_01{}

oDCNOME := SingleLineEdit{self,ResourceID{JSET_NOME,_GetInst()}}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"CRRSSET_NOME"}
oDCNOME:FieldSpec := PADRAO_CHAR_10{}

oDCSC_COGNOME := FixedText{self,ResourceID{JSET_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCGRAFICO := CheckBox{self,ResourceID{JSET_GRAFICO,_GetInst()}}
oDCGRAFICO:HyperLabel := HyperLabel{#GRAFICO,"Grafico",NULL_STRING,"CRRSSET_GRAFICO"}
oDCGRAFICO:FieldSpec := LOGIC_FIELD{}

oDCCOGNOME := SingleLineEdit{self,ResourceID{JSET_COGNOME,_GetInst()}}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"CRRSSET_COGNOME"}
oDCCOGNOME:FieldSpec := PADRAO_CHAR_05{}

oCCPORNUM := PushButton{self,ResourceID{JSET_PORNUM,_GetInst()}}
oCCPORNUM:Image := ico_az{}
oCCPORNUM:HyperLabel := HyperLabel{#PORNUM,NULL_STRING,NULL_STRING,NULL_STRING}

oCCBuscanum := PushButton{self,ResourceID{JSET_BUSCANUM,_GetInst()}}
oCCBuscanum:Image := ico_find{}
oCCBuscanum:HyperLabel := HyperLabel{#Buscanum,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Codigos"
self:HyperLabel := HyperLabel{#JSET,"Codigos",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


METHOD PORNUM( ) 
	SELF:KeyFind()

END CLASS
