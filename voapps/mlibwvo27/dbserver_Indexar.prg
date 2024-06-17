#region DEFINES
STATIC DEFINE _INDEXAR_AJUDA := 105 
STATIC DEFINE _INDEXAR_CANCELAR := 100 
STATIC DEFINE _INDEXAR_PUSHBUTTON1 := 103 
STATIC DEFINE _INDEXAR_THEFIXEDTEXT1 := 106 
STATIC DEFINE _INDEXAR_THEFIXEDTEXT10 := 102 
STATIC DEFINE _INDEXAR_THEFIXEDTEXT9 := 101
STATIC DEFINE _INDEXAR_X2 := 104 
#endregion

class _Indexar inherit DATAWINDOW 

	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCPushButton1 as PUSHBUTTON
	protect oDCx2 as FIXEDTEXT
	protect oCCAjuda as PUSHBUTTON
	protect oDCtheFixedText1 as FIXEDTEXT

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"_Indexar",_GetInst()},iCtlID)

aFonts[1] := Font{,24,"MS Sans Serif"}
aFonts[1]:Bold := TRUE

oCCCancelar := PushButton{self,ResourceID{_INDEXAR_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,"Indexar"}
oCCCancelar:Image := ICO_SAIR{}
oCCCancelar:TooltipText := "Clique Para Cancelar Indexação"

oDCtheFixedText9 := FixedText{self,ResourceID{_INDEXAR_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,"Indexar"}

oDCtheFixedText10 := FixedText{self,ResourceID{_INDEXAR_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,"Indexar"}

oCCPushButton1 := PushButton{self,ResourceID{_INDEXAR_PUSHBUTTON1,_GetInst()}}
oCCPushButton1:HyperLabel := HyperLabel{#PushButton1,NULL_STRING,NULL_STRING,"Indexar"}
oCCPushButton1:Image := ICO_OK{}
oCCPushButton1:TooltipText := "Clique para Iniciar a Indexação"

oDCx2 := FixedText{self,ResourceID{_INDEXAR_X2,_GetInst()}}
oDCx2:HyperLabel := HyperLabel{#x2,"Ajuda",NULL_STRING,NULL_STRING}

oCCAjuda := PushButton{self,ResourceID{_INDEXAR_AJUDA,_GetInst()}}
oCCAjuda:HyperLabel := HyperLabel{#Ajuda,NULL_STRING,NULL_STRING,"login"}
oCCAjuda:Image := ICO_AJUDA{}
oCCAjuda:TooltipText := "Clique Para Acessar a Ajuda"

oDCtheFixedText1 := FixedText{self,ResourceID{_INDEXAR_THEFIXEDTEXT1,_GetInst()}}
oDCtheFixedText1:HyperLabel := HyperLabel{#theFixedText1,"Indexar Arquivos",NULL_STRING,"Indexar"}
oDCtheFixedText1:Font(aFonts[1], FALSE)

self:Caption := "Indexar Arquivos"
self:HyperLabel := HyperLabel{#_Indexar,"Indexar Arquivos",NULL_STRING,"Indexar"}

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
CLASS indexar INHERIT _indexar

METHOD Ajuda() 
	SELF:HelpDisplay:Show( "Indexar" )
	

METHOD cancelar() 
SELF:endwindow()

CONSTRUCTOR( oOwner ,cHELP) 
	SUPER( oOwner )
	IF ValType(cHELP)="C"
	   SELF:HelpDisplay:=HelpDisplay{cHELP}
	ELSE
       SELF:oCCAjuda:DISABLE()
	ENDIF	
RETURN SELF


END CLASS
