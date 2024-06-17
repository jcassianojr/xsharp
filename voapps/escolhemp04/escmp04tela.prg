#region DEFINES
STATIC DEFINE ESCMP04X_BUSCA := 106 
STATIC DEFINE ESCMP04X_BUSCA1 := 109 
STATIC DEFINE ESCMP04X_CANCELAR := 103 
STATIC DEFINE ESCMP04X_CBUSCA := 101 
STATIC DEFINE ESCMP04X_CBUSCA1 := 108 
STATIC DEFINE ESCMP04X_ESCOLHER := 105 
STATIC DEFINE ESCMP04X_JESCMP04 := 100 
STATIC DEFINE ESCMP04X_PUSHBUTTON3 := 107 
STATIC DEFINE ESCMP04X_THEFIXEDTEXT11 := 104 
STATIC DEFINE ESCMP04X_THEFIXEDTEXT9 := 102 
STATIC DEFINE JESCMP04_NOMTEC := 103 
STATIC DEFINE JESCMP04_SC_NOMTEC := 101 
STATIC DEFINE JESCMP04_SC_TECNICO := 100 
STATIC DEFINE JESCMP04_TECNICO := 102 
#endregion

class escmp04x inherit DATADIALOG 

	protect oDCCBUSCA as SINGLELINEEDIT
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCcancelar as PUSHBUTTON
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCEscolher as PUSHBUTTON
	protect oCCBusca as PUSHBUTTON
	protect oCCPushButton3 as PUSHBUTTON
	protect oDCCBUSCA1 as RIGHTSLE
	protect oCCBusca1 as PUSHBUTTON
// 	instance CBUSCA 
// 	instance CBUSCA1 
	protect oSFjescmp04 as jescmp04

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

  EXPORT NUMERO AS DWORD
  EXPORT NOME AS STRING
  EXPORT lOK AS LOGIC

METHOD Busca( ) 
SELF:oSFjescmp04:server:setorder(2)	
SELF:oSFJESCMP04:SERVER:GOTOP()
SELF:oSFJESCMP04:SERVER:Seek(AllTrim(FIXSTR(SELF:CBUSCA)),.T.)
IF SELF:oSFJESCMP04:SERVER:EOF
   SELF:oSFJESCMP04:SERVER:GoTop()	
ENDIF	

METHOD Busca1( ) 
SELF:oSFjescmp04:server:setorder(1)	
SELF:oSFJESCMP04:SERVER:GOTOP()
SELF:oSFJESCMP04:SERVER:Seek(SELF:CBUSCA1,.T.)
IF SELF:oSFJESCMP04:SERVER:EOF
   SELF:oSFJESCMP04:SERVER:GoTop()	
ENDIF		

METHOD Cancelar( ) 
	lOK:=.F.
	SELF:EndWindow()
	

access CBUSCA() 
return self:FieldGet(#CBUSCA)


assign CBUSCA(uValue) 
self:FieldPut(#CBUSCA, uValue)
return CBUSCA := uValue


access CBUSCA1() 
return self:FieldGet(#CBUSCA1)


assign CBUSCA1(uValue) 
self:FieldPut(#CBUSCA1, uValue)
return CBUSCA1 := uValue


METHOD Escolher( ) 
	lOK:=.T.
	SELF:NUMERO:=SELF:oSFJESCMP04:SERVER:FIELDGET("TECNICO")
	SELF:NOME:=SELF:oSFJESCMP04:SERVER:FIELDGET("NOMTEC")
	SELF:EndWindow()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"escmp04x",_GetInst()},iCtlID)

oDCCBUSCA := SingleLineEdit{self,ResourceID{ESCMP04X_CBUSCA,_GetInst()}}
oDCCBUSCA:HyperLabel := HyperLabel{#CBUSCA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCBUSCA:TooltipText := "Digite o Dado para Busca"
oDCCBUSCA:FieldSpec := PADRAO_CHAR_40{}
oDCCBUSCA:FocusSelect := FSEL_ALL

oDCtheFixedText9 := FixedText{self,ResourceID{ESCMP04X_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCcancelar := PushButton{self,ResourceID{ESCMP04X_CANCELAR,_GetInst()}}
oCCcancelar:HyperLabel := HyperLabel{#cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCcancelar:Image := ico_sair{}
oCCcancelar:TooltipText := "Retornar sem Escolher"

oDCtheFixedText11 := FixedText{self,ResourceID{ESCMP04X_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Escolher",NULL_STRING,NULL_STRING}

oCCEscolher := PushButton{self,ResourceID{ESCMP04X_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,NULL_STRING,NULL_STRING,NULL_STRING}
oCCEscolher:Image := ico_ok{}
oCCEscolher:TooltipText := "Escolher o Item da Lista"

oCCBusca := PushButton{self,ResourceID{ESCMP04X_BUSCA,_GetInst()}}
oCCBusca:HyperLabel := HyperLabel{#Busca,"Nome",NULL_STRING,NULL_STRING}
oCCBusca:TooltipText := "Buscar Nome"

oCCPushButton3 := PushButton{self,ResourceID{ESCMP04X_PUSHBUTTON3,_GetInst()}}
oCCPushButton3:HyperLabel := HyperLabel{#PushButton3,"Busca Detalhada",NULL_STRING,NULL_STRING}

oDCCBUSCA1 := rightSle{self,ResourceID{ESCMP04X_CBUSCA1,_GetInst()}}
oDCCBUSCA1:HyperLabel := HyperLabel{#CBUSCA1,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCBUSCA1:TooltipText := "Digite o Dado para Busca"
oDCCBUSCA1:FieldSpec := padrao_num_08{}
oDCCBUSCA1:FocusSelect := FSEL_ALL

oCCBusca1 := PushButton{self,ResourceID{ESCMP04X_BUSCA1,_GetInst()}}
oCCBusca1:HyperLabel := HyperLabel{#Busca1,"Numero",NULL_STRING,NULL_STRING}
oCCBusca1:TooltipText := "Buscar Numero"

self:Caption := "Escolher"
self:HyperLabel := HyperLabel{#escmp04x,"Escolher",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjescmp04 := jescmp04{self,ESCMP04X_JESCMP04}
oSFjescmp04:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


METHOD PushButton3( ) 
	  SELF:oSFjescmp04:KeyFind()

END CLASS
