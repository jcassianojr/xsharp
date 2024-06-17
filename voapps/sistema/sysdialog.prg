#region DEFINES
STATIC DEFINE JDIASYS_CMDIMP := 101 
STATIC DEFINE JDIASYS_CMDSAIDA := 103 
STATIC DEFINE JDIASYS_FIXEDTEXT3 := 102 
STATIC DEFINE JDIASYS_JSYS := 100 
#endregion

class jdiasys inherit DATADIALOG 

	protect oCCcmdimp as PUSHBUTTON
	protect oDCFixedText3 as FIXEDTEXT
	protect oCCcmdSaida as PUSHBUTTON
	protect oSFjsys as jsys

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jdiasys",_GetInst()},iCtlID)

oCCcmdimp := PushButton{self,ResourceID{JDIASYS_CMDIMP,_GetInst()}}
oCCcmdimp:HyperLabel := HyperLabel{#cmdimp,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText3 := FixedText{self,ResourceID{JDIASYS_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Retornar",NULL_STRING,NULL_STRING}

oCCcmdSaida := PushButton{self,ResourceID{JDIASYS_CMDSAIDA,_GetInst()}}
oCCcmdSaida:HyperLabel := HyperLabel{#cmdSaida,NULL_STRING,NULL_STRING,NULL_STRING}
oCCcmdSaida:Image := ico_sair{}

self:Caption := "Menu de Sistemas"
self:HyperLabel := HyperLabel{#jdiasys,"Menu de Sistemas",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjsys := jsys{self,JDIASYS_JSYS}
oSFjsys:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
