#region DEFINES
STATIC DEFINE JCODESC_BUSCACODIGO := 103 
STATIC DEFINE JCODESC_CODIGO := 100 
STATIC DEFINE JCODESC_DESCRI := 101 
STATIC DEFINE JCODESC_PORCODIGO := 102 
#endregion

class jcodesc inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDESCRI as DataColumn
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oCCporcodigo as PUSHBUTTON
	protect oCCbuscacodigo as PUSHBUTTON
// 	instance CODIGO 
// 	instance DESCRI 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD buscacodigo( ) 
	SELF:keyfind()



METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("RH","")	


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

SUPER(oWindow,ResourceID{"jcodesc",_GetInst()},iCtlID)

oDCCODIGO := SingleLineEdit{self,ResourceID{JCODESC_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_02{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo",NULL_STRING,NULL_STRING}

oDCDESCRI := SingleLineEdit{self,ResourceID{JCODESC_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_70{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descritivo",NULL_STRING,NULL_STRING}

oCCporcodigo := PushButton{self,ResourceID{JCODESC_PORCODIGO,_GetInst()}}
oCCporcodigo:Image := ico_az{}
oCCporcodigo:HyperLabel := HyperLabel{#porcodigo,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscacodigo := PushButton{self,ResourceID{JCODESC_BUSCACODIGO,_GetInst()}}
oCCbuscacodigo:Image := ico_find{}
oCCbuscacodigo:HyperLabel := HyperLabel{#buscacodigo,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Codigos Escolaridade"
self:HyperLabel := HyperLabel{#jcodesc,"Codigos Escolaridade",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_02{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo"
self:Browser:AddColumn(oDBCODIGO)

oDBDESCRI := DataColumn{PADRAO_CHAR_70{}}
oDBDESCRI:Width := 58
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descritivo"
self:Browser:AddColumn(oDBDESCRI)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PORCODIGO() 
	SELF:keyfind()




METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
