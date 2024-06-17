#region DEFINES
STATIC DEFINE JMP05_BUSCANUM := 103 
STATIC DEFINE JMP05_CARGO := 113 
STATIC DEFINE JMP05_CODIGO := 107 
STATIC DEFINE JMP05_DESCRI := 106 
STATIC DEFINE JMP05_PORNUM := 102 
STATIC DEFINE JMP05_RESPON := 109 
STATIC DEFINE JMP05_SC_CARGO := 112 
STATIC DEFINE JMP05_SC_CODIGO := 104 
STATIC DEFINE JMP05_SC_DESCRI := 105 
STATIC DEFINE JMP05_SC_RESPON := 108 
STATIC DEFINE JMP05_SC_SETOR := 101 
STATIC DEFINE JMP05_SC_SUPLE := 110 
STATIC DEFINE JMP05_SETOR := 100 
STATIC DEFINE JMP05_SUPLE := 111 
#endregion

class JMP05 inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBRESPON as DataColumn
	PROTECT oDBCARGO as DataColumn
	PROTECT oDBSUPLE as DataColumn
	protect oDCSETOR as SINGLELINEEDIT
	protect oDCSC_SETOR as FIXEDTEXT
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_RESPON as FIXEDTEXT
	protect oDCRESPON as SINGLELINEEDIT
	protect oDCSC_SUPLE as FIXEDTEXT
	protect oDCSUPLE as SINGLELINEEDIT
	protect oDCSC_CARGO as FIXEDTEXT
	protect oDCCARGO as SINGLELINEEDIT
// 	instance SETOR 
// 	instance DESCRI 
// 	instance CODIGO 
// 	instance RESPON 
// 	instance SUPLE 
// 	instance CARGO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD buscanum( ) 
	SELF:KeyFind()

access CARGO() 
return self:FieldGet(#CARGO)


assign CARGO(uValue) 
self:FieldPut(#CARGO, uValue)
return CARGO := uValue


METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("MP","AREA")		

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

oDCSETOR := SingleLineEdit{self,ResourceID{JMP05_SETOR,_GetInst()}}
oDCSETOR:FieldSpec := PADRAO_CHAR_12{}
oDCSETOR:HyperLabel := HyperLabel{#SETOR,"Setor",NULL_STRING,"MP04_COGTEC"}

oDCSC_SETOR := FixedText{self,ResourceID{JMP05_SC_SETOR,_GetInst()}}
oDCSC_SETOR:HyperLabel := HyperLabel{#SC_SETOR,"Setor:",NULL_STRING,NULL_STRING}

oCCpornum := PushButton{self,ResourceID{JMP05_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

oCCbuscanum := PushButton{self,ResourceID{JMP05_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Clique Para Localizar Por Numero"

oDCSC_CODIGO := FixedText{self,ResourceID{JMP05_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{self,ResourceID{JMP05_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCDESCRI := SingleLineEdit{self,ResourceID{JMP05_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_30{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descrição:",NULL_STRING,"MP05_DESCRI"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JMP05_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_02{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Código:",NULL_STRING,"MP05_CODIGO"}

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
oDCCARGO:FieldSpec := PADRAO_CHAR_40{}
oDCCARGO:HyperLabel := HyperLabel{#CARGO,"Cargo:",NULL_STRING,"MP05_CARGO"}

self:Caption := "Areas da Empresa"
self:HyperLabel := HyperLabel{#JMP05,"Areas da Empresa",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

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

oDBCARGO := DataColumn{PADRAO_CHAR_40{}}
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


METHOD pornum( ) 
	SELF:KeyFind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   	    FabCenterWindow( SELF )
 RETURN SELF

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


METHOD Timer() 
   SELF:SERVER:COMMIT()

END CLASS
