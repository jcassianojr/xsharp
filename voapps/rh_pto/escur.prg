#region DEFINES
STATIC DEFINE JESCCUR_BUSCA := 101 
STATIC DEFINE JESCCUR_BUSCAR := 112 
STATIC DEFINE JESCCUR_BUSCARNOME := 113 
STATIC DEFINE JESCCUR_BUSCOD := 102 
STATIC DEFINE JESCCUR_CANCELAR := 105 
STATIC DEFINE JESCCUR_ESCOLHER := 115 
STATIC DEFINE JESCCUR_INCLUIR := 103 
STATIC DEFINE JESCCUR_JCURB := 100 
STATIC DEFINE JESCCUR_PORCODIGO := 106 
STATIC DEFINE JESCCUR_PORGRUPOCOD := 108 
STATIC DEFINE JESCCUR_PORNOME := 107 
STATIC DEFINE JESCCUR_THEFIXEDTEXT10 := 109 
STATIC DEFINE JESCCUR_THEFIXEDTEXT11 := 110 
STATIC DEFINE JESCCUR_THEFIXEDTEXT12 := 111 
STATIC DEFINE JESCCUR_THEFIXEDTEXT13 := 114 
STATIC DEFINE JESCCUR_THEFIXEDTEXT9 := 104 
#endregion

class jesccur inherit DATADIALOG 

	protect oDCbusca as SINGLELINEEDIT
	protect oDCbuscod as SINGLELINEEDIT
	protect oCCIncluir as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oCCporcodigo as PUSHBUTTON
	protect oCCpornome as PUSHBUTTON
	protect oCCporgrupocod as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oDCtheFixedText12 as FIXEDTEXT
	protect oCCbuscar as PUSHBUTTON
	protect oCCBuscarNome as PUSHBUTTON
	protect oDCtheFixedText13 as FIXEDTEXT
	protect oCCescolher as PUSHBUTTON
// 	instance busca 
// 	instance buscod 
	protect oSFjcurb as jcurb

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access busca() 
return self:FieldGet(#busca)


assign busca(uValue) 
self:FieldPut(#busca, uValue)
return busca := uValue


access buscod() 
return self:FieldGet(#buscod)


assign buscod(uValue) 
self:FieldPut(#buscod, uValue)
return buscod := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jesccur",_GetInst()},iCtlID)

oDCbusca := SingleLineEdit{self,ResourceID{JESCCUR_BUSCA,_GetInst()}}
oDCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,"Digite a Descriçao",NULL_STRING}

oDCbuscod := SingleLineEdit{self,ResourceID{JESCCUR_BUSCOD,_GetInst()}}
oDCbuscod:HyperLabel := HyperLabel{#buscod,NULL_STRING,"Digite o Codigo",NULL_STRING}

oCCIncluir := PushButton{self,ResourceID{JESCCUR_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir Novo Codigo","Clique para Incluir um Novo Codigo",NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{JESCCUR_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JESCCUR_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}
oCCCancelar:TooltipText := "Retornar sem Escolher"

oCCporcodigo := PushButton{self,ResourceID{JESCCUR_PORCODIGO,_GetInst()}}
oCCporcodigo:Image := ico_az{}
oCCporcodigo:HyperLabel := HyperLabel{#porcodigo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporcodigo:TooltipText := "Ordena a Lista por Código"

oCCpornome := PushButton{self,ResourceID{JESCCUR_PORNOME,_GetInst()}}
oCCpornome:Image := ico_az{}
oCCpornome:HyperLabel := HyperLabel{#pornome,NULL_STRING,NULL_STRING,NULL_STRING}
oCCpornome:TooltipText := "Ordena a Lista Por Descriçao"

oCCporgrupocod := PushButton{self,ResourceID{JESCCUR_PORGRUPOCOD,_GetInst()}}
oCCporgrupocod:Image := ico_az{}
oCCporgrupocod:HyperLabel := HyperLabel{#porgrupocod,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporgrupocod:TooltipText := "Ordena a Lista Por Grupo"

oDCtheFixedText10 := FixedText{self,ResourceID{JESCCUR_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"Ordenar Codigo",NULL_STRING,NULL_STRING}

oDCtheFixedText11 := FixedText{self,ResourceID{JESCCUR_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Ordem Nome",NULL_STRING,NULL_STRING}

oDCtheFixedText12 := FixedText{self,ResourceID{JESCCUR_THEFIXEDTEXT12,_GetInst()}}
oDCtheFixedText12:HyperLabel := HyperLabel{#theFixedText12,"Ordem Grp/Cod",NULL_STRING,NULL_STRING}

oCCbuscar := PushButton{self,ResourceID{JESCCUR_BUSCAR,_GetInst()}}
oCCbuscar:Image := ico_find{}
oCCbuscar:HyperLabel := HyperLabel{#buscar,NULL_STRING,"Clique Para Buscar Codigo",NULL_STRING}

oCCBuscarNome := PushButton{self,ResourceID{JESCCUR_BUSCARNOME,_GetInst()}}
oCCBuscarNome:Image := ico_find{}
oCCBuscarNome:HyperLabel := HyperLabel{#BuscarNome,NULL_STRING,"Clique Para Buscar Descriçao",NULL_STRING}

oDCtheFixedText13 := FixedText{self,ResourceID{JESCCUR_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Escolher",NULL_STRING,NULL_STRING}

oCCescolher := PushButton{self,ResourceID{JESCCUR_ESCOLHER,_GetInst()}}
oCCescolher:HyperLabel := HyperLabel{#escolher,NULL_STRING,NULL_STRING,NULL_STRING}
oCCescolher:Image := ico_ok{}
oCCescolher:TooltipText := "Clique para escolher o item em destaque da lista"

self:Caption := "DataDialog Caption"
self:HyperLabel := HyperLabel{#jesccur,"DataDialog Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjcurb := jcurb{self,JESCCUR_JCURB}
oSFjcurb:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


END CLASS
CLASS xesccur INHERIT jesccur
    EXPORT CODIGO AS STRING
    EXPORT NOME AS STRING
    EXPORT lOK AS LOGIC


METHOD Buscar( ) 
	SELF:oSFjcurb:server:SetOrder(1)
	SELF:oSFjcurb:SERVER:gotop()
	SELF:oSFjcurb:SERVER:seek(AllTrim(SELF:oDCbuscod:TEXTVALUE))
	IF SELF:oSFjcurb:SERVER:EOF
	   SELF:oSFjcurb:SERVER:GOTOP()
    ENDIF		

METHOD Buscarnome( ) 
	SELF:oSFjcurb:server:SetOrder(2)
	SELF:oSFjcurb:SERVER:gotop()
	SELF:oSFjcurb:SERVER:seek(AllTrim(SELF:oDCbusca:TEXTVALUE))
	IF SELF:oSFjcurb:SERVER:EOF
	   SELF:oSFjcurb:SERVER:GOTOP()
    ENDIF				
	

METHOD Cancelar( ) 
	SELF:EndWindow()
	

METHOD Escolher( ) 
	SELF:CODIGO:=SELF:oSFjcurb:SERVER:FIELDGET("CURSO")
	SELF:NOME:=SELF:oSFjcurb:SERVER:FIELDGET("DESCUR")
	SELF:LOK:=.T.
	SELF:EndWindow()

METHOD INCLUIR() 	
SELF:oSFjcurb:SERVER:GOTOP()
IF ! SELF:oSFjcurb:SERVER:SEEK(AllTrim(SELF:oDCbuscod:TEXTVALUE))	
	SELF:oSFjcurb:SERVER:APPEND()
	SELF:oSFjcurb:SERVER:FIELDPUT("CURSO",AllTrim(SELF:oDCbuscod:TEXTVALUE))
	SELF:oSFjcurb:SERVER:FIELDPUT("DESCUR",AllTrim(SELF:oDCbusca:TEXTVALUE))	
ELSE
	alert("Código Já cadastrado","Erro Inclusão")
ENDIF	
	
	
	

CONSTRUCTOR(oOWNER,cCURINI,cCURDIR,cARQ) 
LOCAL oSERVE2 AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
aDAD:={cCURINI,cARQ,cCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oSERVE2:=USEREDE{aDAD,,,,aCOM}
IF oSERVE2:nERRO#0
   RETU SELF
ENDIF
oSERVE2:SetOrder(2)
oSERVE2:GOTOP()
SUPER(oOWNER)
SELF:oSFjcurb:USE(oSERVE2)
SELF:LOK:=.F.
SELF:SHOW()		

METHOD porcodigo( ) 	
SELF:oSFjcurb:server:SetOrder(1)
SELF:oSFjcurb:SERVER:gotop()

METHOD porgrupocod( ) 	
SELF:oSFjcurb:server:SetOrder(3)
SELF:oSFjcurb:SERVER:gotop()

	

METHOD pornome( ) 	
SELF:oSFjcurb:server:SetOrder(2)
SELF:oSFjcurb:SERVER:gotop()


END CLASS
