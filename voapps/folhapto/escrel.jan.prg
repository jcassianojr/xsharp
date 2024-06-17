#region DEFINES
STATIC DEFINE JESCREL_BOTAO1 := 102 
STATIC DEFINE JESCREL_BOTAO2 := 103 
STATIC DEFINE JESCREL_BOTAO3 := 104 
STATIC DEFINE JESCREL_BOTAO4 := 105 
STATIC DEFINE JESCREL_BOTAO5 := 106 
STATIC DEFINE JESCREL_CANCELAR := 101 
STATIC DEFINE JESCREL_THEFIXEDTEXT9 := 100 
#endregion

class JESCREL inherit DATADIALOG 

	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oCCBotao1 as PUSHBUTTON
	protect oCCBotao2 as PUSHBUTTON
	protect oCCBotao3 as PUSHBUTTON
	protect oCCBotao4 as PUSHBUTTON
	protect oCCBotao5 as PUSHBUTTON

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Botao1( ) 
		ZREL:=1
	SELF:EndWindow()

METHOD Botao2( ) 
	ZREL:=2
	SELF:EndWindow()

METHOD Botao3( ) 
		ZREL:=3
	SELF:EndWindow()

METHOD Botao4( ) 
	ZREL:=4
	SELF:EndWindow()

METHOD Botao5( ) 
	ZREL:=5
	SELF:EndWindow()

METHOD Cancelar( ) 
	ZREL:=0
	SELF:EndWindow()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JESCREL",_GetInst()},iCtlID)

oDCtheFixedText9 := FixedText{self,ResourceID{JESCREL_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JESCREL_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}
oCCCancelar:TooltipText := "Clique aqui Para Cancelar"

oCCBotao1 := PushButton{self,ResourceID{JESCREL_BOTAO1,_GetInst()}}
oCCBotao1:HyperLabel := HyperLabel{#Botao1,"Relogio",NULL_STRING,NULL_STRING}

oCCBotao2 := PushButton{self,ResourceID{JESCREL_BOTAO2,_GetInst()}}
oCCBotao2:HyperLabel := HyperLabel{#Botao2,"Refeitorio",NULL_STRING,NULL_STRING}

oCCBotao3 := PushButton{self,ResourceID{JESCREL_BOTAO3,_GetInst()}}
oCCBotao3:HyperLabel := HyperLabel{#Botao3,"Portaria",NULL_STRING,NULL_STRING}

oCCBotao4 := PushButton{self,ResourceID{JESCREL_BOTAO4,_GetInst()}}
oCCBotao4:HyperLabel := HyperLabel{#Botao4,"Rodbel",NULL_STRING,NULL_STRING}

oCCBotao5 := PushButton{self,ResourceID{JESCREL_BOTAO5,_GetInst()}}
oCCBotao5:HyperLabel := HyperLabel{#Botao5,"RelogioII",NULL_STRING,NULL_STRING}

self:Caption := "Escolher Relogio"
self:HyperLabel := HyperLabel{#JESCREL,"Escolher Relogio",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
 FabCenterWindow( SELF )	
	RETURN NIL


END CLASS
