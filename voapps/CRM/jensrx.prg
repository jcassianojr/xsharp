#region DEFINES
STATIC DEFINE JENSRX_CANCELAR := 104 
STATIC DEFINE JENSRX_CMDCERT := 105 
STATIC DEFINE JENSRX_JENSR := 100 
STATIC DEFINE JENSRX_OK := 102 
STATIC DEFINE JENSRX_THEFIXEDTEXT10 := 101 
STATIC DEFINE JENSRX_THEFIXEDTEXT9 := 103 
#endregion

class jensrx inherit DATADIALOG 

	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oCCcmdcert as PUSHBUTTON
	protect oSFjensr as jensr

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)



CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jensrx",_GetInst()},iCtlID)

oDCtheFixedText10 := FixedText{self,ResourceID{JENSRX_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JENSRX_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ICO_OK{}
oCCOK:TooltipText := "Clique aqui Par Confirmar"

oDCtheFixedText9 := FixedText{self,ResourceID{JENSRX_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JENSRX_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}
oCCCancelar:TooltipText := "Clique aqui Para Cancelar"

oCCcmdcert := PushButton{self,ResourceID{JENSRX_CMDCERT,_GetInst()}}
oCCcmdcert:HyperLabel := HyperLabel{#cmdcert,"Conforme Certificado",NULL_STRING,NULL_STRING}

self:Caption := "Checagem Certificado"
self:HyperLabel := HyperLabel{#jensrx,"Checagem Certificado",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjensr := jensr{self,JENSRX_JENSR}
oSFjensr:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
