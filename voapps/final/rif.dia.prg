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

class JRifDia inherit MYDatadialog 

	protect oCCOK as PUSHBUTTON
	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oDCcodigo as FIXEDTEXT
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oDCcPF as FIXEDTEXT
	protect oDCcOS as FIXEDTEXT
	protect oDCnPF as FIXEDTEXT
	protect oDCnOS as FIXEDTEXT
	protect oDCcNOME as FIXEDTEXT
	protect oDCcdata as FIXEDTEXT
	protect oDCdDATA as FIXEDTEXT
	protect oDCFOTO as FABPAINTLIBCTRL

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra) 
LOCAL DIM aFonts[3] AS OBJECT

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRifDia",_GetInst()},iCtlID)

aFonts[1] := Font{,28,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,26,"Times New Roman"}
aFonts[3] := Font{,16,"Times New Roman"}
aFonts[3]:Bold := TRUE

oCCOK := PushButton{SELF,ResourceID{JRIFDIA_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}

oCCCancelar := PushButton{SELF,ResourceID{JRIFDIA_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}

oDCtheFixedText10 := FixedText{SELF,ResourceID{JRIFDIA_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oDCcodigo := FixedText{SELF,ResourceID{JRIFDIA_CODIGO,_GetInst()}}
oDCcodigo:HyperLabel := HyperLabel{#codigo,"codigo",NULL_STRING,NULL_STRING}
oDCcodigo:Font(aFonts[1], FALSE)

oDCtheFixedText9 := FixedText{SELF,ResourceID{JRIFDIA_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Cancelar",NULL_STRING,NULL_STRING}

oDCcPF := FixedText{SELF,ResourceID{JRIFDIA_CPF,_GetInst()}}
oDCcPF:HyperLabel := HyperLabel{#cPF,"PF",NULL_STRING,NULL_STRING}
oDCcPF:Font(aFonts[2], FALSE)

oDCcOS := FixedText{SELF,ResourceID{JRIFDIA_COS,_GetInst()}}
oDCcOS:HyperLabel := HyperLabel{#cOS,"OS",NULL_STRING,NULL_STRING}
oDCcOS:Font(aFonts[2], FALSE)

oDCnPF := FixedText{SELF,ResourceID{JRIFDIA_NPF,_GetInst()}}
oDCnPF:HyperLabel := HyperLabel{#nPF,"PF",NULL_STRING,NULL_STRING}
oDCnPF:Font(aFonts[2], FALSE)

oDCnOS := FixedText{SELF,ResourceID{JRIFDIA_NOS,_GetInst()}}
oDCnOS:HyperLabel := HyperLabel{#nOS,"OS",NULL_STRING,NULL_STRING}
oDCnOS:Font(aFonts[2], FALSE)

oDCcNOME := FixedText{SELF,ResourceID{JRIFDIA_CNOME,_GetInst()}}
oDCcNOME:HyperLabel := HyperLabel{#cNOME,"codigo",NULL_STRING,NULL_STRING}
oDCcNOME:Font(aFonts[3], FALSE)

oDCcdata := FixedText{SELF,ResourceID{JRIFDIA_CDATA,_GetInst()}}
oDCcdata:HyperLabel := HyperLabel{#cdata,"Data",NULL_STRING,NULL_STRING}
oDCcdata:Font(aFonts[2], FALSE)

oDCdDATA := FixedText{SELF,ResourceID{JRIFDIA_DDATA,_GetInst()}}
oDCdDATA:HyperLabel := HyperLabel{#dDATA,"DATA",NULL_STRING,NULL_STRING}
oDCdDATA:Font(aFonts[2], FALSE)

oDCFOTO := FabPaintLibCtrl{SELF,ResourceID{JRIFDIA_FOTO,_GetInst()}}
oDCFOTO:HyperLabel := HyperLabel{#FOTO,NULL_STRING,NULL_STRING,NULL_STRING}

SELF:Caption := "Confirmação"
SELF:HyperLabel := HyperLabel{#JRifDia,"Confirmação",NULL_STRING,NULL_STRING}

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF



END CLASS
