#region DEFINES
STATIC DEFINE JBE01_BUSCANUM := 105 
STATIC DEFINE JBE01_CODIGO := 102 
STATIC DEFINE JBE01_FIXEDTEXT1 := 100 
STATIC DEFINE JBE01_FIXEDTEXT2 := 101 
STATIC DEFINE JBE01_JBF01 := 106 
STATIC DEFINE JBE01_NOME := 103 
STATIC DEFINE JBE01_PORNUM := 104 
#endregion

class jbe01 inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCFixedText1 as FIXEDTEXT
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
// 	instance CODIGO 
// 	instance NOME 
	protect oSFJBF01 as JBF01

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jbe01",_GetInst()},iCtlID)

oDCFixedText1 := FixedText{self,ResourceID{JBE01_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Codigo",NULL_STRING,NULL_STRING}

oDCFixedText2 := FixedText{self,ResourceID{JBE01_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Nome",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JBE01_CODIGO,_GetInst()}}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JBE01_NOME,_GetInst()}}
oDCNOME:HyperLabel := HyperLabel{#NOME,NULL_STRING,NULL_STRING,NULL_STRING}

oCCpornum := PushButton{self,ResourceID{JBE01_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscanum := PushButton{self,ResourceID{JBE01_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Itens"
self:HyperLabel := HyperLabel{#jbe01,"Itens",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{19}
oDBCODIGO:Width := 19
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := ""
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{38}
oDBNOME:Width := 38
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := ""
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#FormView)

oSFJBF01 := JBF01{self,JBE01_JBF01}
oSFJBF01:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


END CLASS
