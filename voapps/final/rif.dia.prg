#region DEFINES
STATIC DEFINE JRIFDIA_CANCELAR := 101
STATIC DEFINE JRIFDIA_CDATA := 110
STATIC DEFINE JRIFDIA_CNOME := 109
STATIC DEFINE JRIFDIA_CODIGO := 103
STATIC DEFINE JRIFDIA_COS := 106
STATIC DEFINE JRIFDIA_CPF := 105
STATIC DEFINE JRIFDIA_DDATA := 111
STATIC DEFINE JRIFDIA_FOTO := 112
STATIC DEFINE JRIFDIA_NOS := 108
STATIC DEFINE JRIFDIA_NPF := 107
STATIC DEFINE JRIFDIA_OK := 100
STATIC DEFINE JRIFDIA_PUSHBUTTON1 := 100 
STATIC DEFINE JRIFDIA_THEFIXEDTEXT10 := 102
STATIC DEFINE JRIFDIA_THEFIXEDTEXT9 := 104
#endregion

PARTIAL CLASS JRifDia INHERIT MYDatadialog
PROTECT oCCOK AS PUSHBUTTON
PROTECT oCCCancelar AS PUSHBUTTON
PROTECT oDCtheFixedText10 AS FIXEDTEXT
PROTECT oDCcodigo AS FIXEDTEXT
PROTECT oDCtheFixedText9 AS FIXEDTEXT
PROTECT oDCcPF AS FIXEDTEXT
PROTECT oDCcOS AS FIXEDTEXT
PROTECT oDCnPF AS FIXEDTEXT
PROTECT oDCnOS AS FIXEDTEXT
PROTECT oDCcNOME AS FIXEDTEXT
PROTECT oDCcdata AS FIXEDTEXT
PROTECT oDCdDATA AS FIXEDTEXT
PROTECT oDCFOTO AS FabPaintLib.Control.FabPaintLibCtrl

// User code starts here (DO NOT remove this line)  ##USER##


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"JRifDia" , _GetInst()},iCtlID)

	SELF:oCCOK := PUSHBUTTON{SELF , ResourceID{ JRIFDIA_OK  , _GetInst() } }
	SELF:oCCOK:HyperLabel := HyperLabel{#OK , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oCCOK:Image := ico_ok{}

	SELF:oCCCancelar := PUSHBUTTON{SELF , ResourceID{ JRIFDIA_CANCELAR  , _GetInst() } }
	SELF:oCCCancelar:HyperLabel := HyperLabel{#Cancelar , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oCCCancelar:Image := ico_sair{}

	SELF:oDCtheFixedText10 := FIXEDTEXT{SELF , ResourceID{ JRIFDIA_THEFIXEDTEXT10  , _GetInst() } }
	SELF:oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10 , "OK" , NULL_STRING , NULL_STRING}

	SELF:oDCcodigo := FIXEDTEXT{SELF , ResourceID{ JRIFDIA_CODIGO  , _GetInst() } }
	SELF:oDCcodigo:HyperLabel := HyperLabel{#codigo , "codigo" , NULL_STRING , NULL_STRING}
	oFont := Font{  , 28 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCcodigo:Font( oFont )

	SELF:oDCtheFixedText9 := FIXEDTEXT{SELF , ResourceID{ JRIFDIA_THEFIXEDTEXT9  , _GetInst() } }
	SELF:oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9 , "Cancelar" , NULL_STRING , NULL_STRING}

	SELF:oDCcPF := FIXEDTEXT{SELF , ResourceID{ JRIFDIA_CPF  , _GetInst() } }
	SELF:oDCcPF:HyperLabel := HyperLabel{#cPF , "PF" , NULL_STRING , NULL_STRING}
	oFont := Font{  , 26 , "Times New Roman" }
	SELF:oDCcPF:Font( oFont )

	SELF:oDCcOS := FIXEDTEXT{SELF , ResourceID{ JRIFDIA_COS  , _GetInst() } }
	SELF:oDCcOS:HyperLabel := HyperLabel{#cOS , "OS" , NULL_STRING , NULL_STRING}
	oFont := Font{  , 26 , "Times New Roman" }
	SELF:oDCcOS:Font( oFont )

	SELF:oDCnPF := FIXEDTEXT{SELF , ResourceID{ JRIFDIA_NPF  , _GetInst() } }
	SELF:oDCnPF:HyperLabel := HyperLabel{#nPF , "PF" , NULL_STRING , NULL_STRING}
	oFont := Font{  , 26 , "Times New Roman" }
	SELF:oDCnPF:Font( oFont )

	SELF:oDCnOS := FIXEDTEXT{SELF , ResourceID{ JRIFDIA_NOS  , _GetInst() } }
	SELF:oDCnOS:HyperLabel := HyperLabel{#nOS , "OS" , NULL_STRING , NULL_STRING}
	oFont := Font{  , 26 , "Times New Roman" }
	SELF:oDCnOS:Font( oFont )

	SELF:oDCcNOME := FIXEDTEXT{SELF , ResourceID{ JRIFDIA_CNOME  , _GetInst() } }
	SELF:oDCcNOME:HyperLabel := HyperLabel{#cNOME , "codigo" , NULL_STRING , NULL_STRING}
	oFont := Font{  , 16 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCcNOME:Font( oFont )

	SELF:oDCcdata := FIXEDTEXT{SELF , ResourceID{ JRIFDIA_CDATA  , _GetInst() } }
	SELF:oDCcdata:HyperLabel := HyperLabel{#cdata , "Data" , NULL_STRING , NULL_STRING}
	oFont := Font{  , 26 , "Times New Roman" }
	SELF:oDCcdata:Font( oFont )

	SELF:oDCdDATA := FIXEDTEXT{SELF , ResourceID{ JRIFDIA_DDATA  , _GetInst() } }
	SELF:oDCdDATA:HyperLabel := HyperLabel{#dDATA , "DATA" , NULL_STRING , NULL_STRING}
	oFont := Font{  , 26 , "Times New Roman" }
	SELF:oDCdDATA:Font( oFont )

	SELF:oDCFOTO := FabPaintLib.Control.FabPaintLibCtrl{SELF , ResourceID{ JRIFDIA_FOTO  , _GetInst() } }
	SELF:oDCFOTO:HyperLabel := HyperLabel{#FOTO , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:Caption := "Confirmação"
	SELF:HyperLabel := HyperLabel{#JRifDia , "Confirmação" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


END CLASS
