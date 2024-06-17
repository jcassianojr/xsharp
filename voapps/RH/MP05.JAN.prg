#region DEFINES
STATIC DEFINE JMP05_BUSCACODIGO := 103 
STATIC DEFINE JMP05_BUSCANOME := 101 
STATIC DEFINE JMP05_CARGO := 115 
STATIC DEFINE JMP05_CODIGO := 107 
STATIC DEFINE JMP05_DESCRI := 109 
STATIC DEFINE JMP05_PORCODIGO := 102 
STATIC DEFINE JMP05_PORNOME := 100 
STATIC DEFINE JMP05_RESPON := 111 
STATIC DEFINE JMP05_SC_CARGO := 114 
STATIC DEFINE JMP05_SC_CODIGO := 106 
STATIC DEFINE JMP05_SC_CODIGO1 := 105 
STATIC DEFINE JMP05_SC_DESCRI := 108 
STATIC DEFINE JMP05_SC_RESPON := 110 
STATIC DEFINE JMP05_SC_SUPLE := 112 
STATIC DEFINE JMP05_SETOR := 104 
STATIC DEFINE JMP05_SUPLE := 113 
#endregion

PARTIAL class JMP05 inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBRESPON as DataColumn
	PROTECT oDBCARGO as DataColumn
	PROTECT oDBSUPLE as DataColumn
	protect oCCpornome as PUSHBUTTON
	protect oCCbuscanome as PUSHBUTTON
	protect oCCporcodigo as PUSHBUTTON
	protect oCCbuscacodigo as PUSHBUTTON
	protect oDCSETOR as SINGLELINEEDIT
	protect oDCSC_CODIGO1 as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCSC_RESPON as FIXEDTEXT
	protect oDCRESPON as SINGLELINEEDIT
	protect oDCSC_SUPLE as FIXEDTEXT
	protect oDCSUPLE as SINGLELINEEDIT
	protect oDCSC_CARGO as FIXEDTEXT
	protect oDCCARGO as SINGLELINEEDIT
// 	instance SETOR 
// 	instance CODIGO 
// 	instance DESCRI 
// 	instance RESPON 
// 	instance SUPLE 
// 	instance CARGO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CARGO() 
return self:FieldGet(#CARGO)


assign CARGO(uValue) 
self:FieldPut(#CARGO, uValue)
return CARGO := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMP05",_GetInst()},iCtlID)

oCCpornome := PushButton{self,ResourceID{JMP05_PORNOME,_GetInst()}}
oCCpornome:Image := ico_az{}
oCCpornome:HyperLabel := HyperLabel{#pornome,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscanome := PushButton{self,ResourceID{JMP05_BUSCANOME,_GetInst()}}
oCCbuscanome:Image := ico_find{}
oCCbuscanome:HyperLabel := HyperLabel{#buscanome,NULL_STRING,NULL_STRING,NULL_STRING}

oCCporcodigo := PushButton{self,ResourceID{JMP05_PORCODIGO,_GetInst()}}
oCCporcodigo:Image := ico_az{}
oCCporcodigo:HyperLabel := HyperLabel{#porcodigo,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscacodigo := PushButton{self,ResourceID{JMP05_BUSCACODIGO,_GetInst()}}
oCCbuscacodigo:Image := ico_find{}
oCCbuscacodigo:HyperLabel := HyperLabel{#buscacodigo,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSETOR := SingleLineEdit{self,ResourceID{JMP05_SETOR,_GetInst()}}
oDCSETOR:FieldSpec := PADRAO_CHAR_03{}
oDCSETOR:HyperLabel := HyperLabel{#SETOR,"Código:",NULL_STRING,"MP05_CODIGO"}

oDCSC_CODIGO1 := FixedText{self,ResourceID{JMP05_SC_CODIGO1,_GetInst()}}
oDCSC_CODIGO1:HyperLabel := HyperLabel{#SC_CODIGO1,"Setor",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JMP05_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JMP05_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_02{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Código:",NULL_STRING,"MP05_CODIGO"}

oDCSC_DESCRI := FixedText{self,ResourceID{JMP05_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCDESCRI := SingleLineEdit{self,ResourceID{JMP05_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_30{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descrição:",NULL_STRING,"MP05_DESCRI"}

oDCSC_RESPON := FixedText{self,ResourceID{JMP05_SC_RESPON,_GetInst()}}
oDCSC_RESPON:HyperLabel := HyperLabel{#SC_RESPON,"Responsável:",NULL_STRING,NULL_STRING}

oDCRESPON := SingleLineEdit{self,ResourceID{JMP05_RESPON,_GetInst()}}
oDCRESPON:FieldSpec := PADRAO_CHAR_40{}
oDCRESPON:HyperLabel := HyperLabel{#RESPON,"Responsável:",NULL_STRING,"MP05_RESPON"}

oDCSC_SUPLE := FixedText{self,ResourceID{JMP05_SC_SUPLE,_GetInst()}}
oDCSC_SUPLE:HyperLabel := HyperLabel{#SC_SUPLE,"Suplente:",NULL_STRING,NULL_STRING}

oDCSUPLE := SingleLineEdit{self,ResourceID{JMP05_SUPLE,_GetInst()}}
oDCSUPLE:FieldSpec := PADRAO_CHAR_40{}
oDCSUPLE:HyperLabel := HyperLabel{#SUPLE,"Suplente:",NULL_STRING,"MP05_SUPLE"}

oDCSC_CARGO := FixedText{self,ResourceID{JMP05_SC_CARGO,_GetInst()}}
oDCSC_CARGO:HyperLabel := HyperLabel{#SC_CARGO,"Cargo:",NULL_STRING,NULL_STRING}

oDCCARGO := SingleLineEdit{self,ResourceID{JMP05_CARGO,_GetInst()}}
oDCCARGO:FieldSpec := PADRAO_CHAR_30{}
oDCCARGO:HyperLabel := HyperLabel{#CARGO,"Cargo:",NULL_STRING,"MP05_CARGO"}

self:Caption := "Areas da Empresa"
self:HyperLabel := HyperLabel{#JMP05,"Areas da Empresa",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_02{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Código:"
self:Browser:AddColumn(oDBCODIGO)

oDBDESCRI := DataColumn{PADRAO_CHAR_30{}}
oDBDESCRI:Width := 18
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descrição:"
self:Browser:AddColumn(oDBDESCRI)

oDBRESPON := DataColumn{PADRAO_CHAR_40{}}
oDBRESPON:Width := 19
oDBRESPON:HyperLabel := oDCRESPON:HyperLabel 
oDBRESPON:Caption := "Responsável:"
self:Browser:AddColumn(oDBRESPON)

oDBCARGO := DataColumn{PADRAO_CHAR_30{}}
oDBCARGO:Width := 18
oDBCARGO:HyperLabel := oDCCARGO:HyperLabel 
oDBCARGO:Caption := "Cargo:"
self:Browser:AddColumn(oDBCARGO)

oDBSUPLE := DataColumn{PADRAO_CHAR_40{}}
oDBSUPLE:Width := 16
oDBSUPLE:HyperLabel := oDCSUPLE:HyperLabel 
oDBSUPLE:Caption := "Suplente:"
self:Browser:AddColumn(oDBSUPLE)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access RESPON() 
return self:FieldGet(#RESPON)


assign RESPON(uValue) 
self:FieldPut(#RESPON, uValue)
return RESPON := uValue


access SETOR() 
return self:FieldGet(#SETOR)


assign SETOR(uValue) 
self:FieldPut(#SETOR, uValue)
return SETOR := uValue


access SUPLE() 
return self:FieldGet(#SUPLE)


assign SUPLE(uValue) 
self:FieldPut(#SUPLE, uValue)
return SUPLE := uValue


END CLASS
