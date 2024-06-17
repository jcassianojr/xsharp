#region DEFINES
STATIC DEFINE _JDIATREIN_ENCERRAR := 101 
STATIC DEFINE _JDIATREIN_THEFIXEDTEXT9 := 102 
STATIC DEFINE _JDIATREIN_ZJTRE := 100 
#endregion

class _jDIATREIN inherit DATADIALOG 

	protect oCCEncerrar as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oSFZJTRE as ZJTRE

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"_jDIATREIN",_GetInst()},iCtlID)

oCCEncerrar := PushButton{self,ResourceID{_JDIATREIN_ENCERRAR,_GetInst()}}
oCCEncerrar:HyperLabel := HyperLabel{#Encerrar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCEncerrar:Image := ico_sair{}

oDCtheFixedText9 := FixedText{self,ResourceID{_JDIATREIN_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

self:Caption := "Visualizando Treinamento"
self:HyperLabel := HyperLabel{#_jDIATREIN,"Visualizando Treinamento",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFZJTRE := ZJTRE{self,_JDIATREIN_ZJTRE}
oSFZJTRE:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	FabCenterWindow( SELF )
	RETURN NIL


END CLASS
CLASS jDIATREIN INHERIT _JDIATREIN

METHOD Encerrar( ) 
	SELF:EndWindow()

CONSTRUCTOR(oOWNER,nTREIN) 
ZTREIN:=nTREIN	
SUPER(oOWNER)
SELF:SHOW()		


END CLASS
