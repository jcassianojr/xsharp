#region DEFINES
STATIC DEFINE JIMP_CANCELAR := 106 
STATIC DEFINE JIMP_CMBBUSCAVIA := 109 
STATIC DEFINE JIMP_CODIGO := 100 
STATIC DEFINE JIMP_FIXEDTEXT1 := 101 
STATIC DEFINE JIMP_FIXEDTEXT2 := 107 
STATIC DEFINE JIMP_GERAPLAN := 102 
STATIC DEFINE JIMP_NVIABILIDADE := 108 
STATIC DEFINE JIMP_OK := 104 
STATIC DEFINE JIMP_THEFIXEDTEXT10 := 103 
STATIC DEFINE JIMP_THEFIXEDTEXT9 := 105 
#endregion

class jimp inherit DIALOGWINDOW 

	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCFixedText1 as FIXEDTEXT
	protect oDCGeraplan as CHECKBOX
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCnVIABILIDADE as SINGLELINEEDIT
	protect oCCcmbBuscaVia as PUSHBUTTON

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

 	EXPORT lok AS LOGIC
  	EXPORT cCODIGO AS STRING

CONSTRUCTOR(oParent,uExtra)  

self:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"jimp",_GetInst()},TRUE)

oDCCODIGO := SingleLineEdit{self,ResourceID{JIMP_CODIGO,_GetInst()}}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCODIGO:TooltipText := "Codigo do Produto"

oDCFixedText1 := FixedText{self,ResourceID{JIMP_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Codigo de Produto",NULL_STRING,NULL_STRING}

oDCGeraplan := CheckBox{self,ResourceID{JIMP_GERAPLAN,_GetInst()}}
oDCGeraplan:HyperLabel := HyperLabel{#Geraplan,"Gerar Nova Planilha de Orçamento",NULL_STRING,NULL_STRING}
oDCGeraplan:TooltipText := "Marque para Gerar Planilha de Orçamento"

oDCtheFixedText10 := FixedText{self,ResourceID{JIMP_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JIMP_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}
oCCOK:TooltipText := "Clique Para Iniciar"

oDCtheFixedText9 := FixedText{self,ResourceID{JIMP_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JIMP_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}
oCCCancelar:TooltipText := "Clique Para Cancelar"

oDCFixedText2 := FixedText{self,ResourceID{JIMP_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Viabilidade",NULL_STRING,NULL_STRING}

oDCnVIABILIDADE := SingleLineEdit{self,ResourceID{JIMP_NVIABILIDADE,_GetInst()}}
oDCnVIABILIDADE:HyperLabel := HyperLabel{#nVIABILIDADE,NULL_STRING,NULL_STRING,NULL_STRING}
oDCnVIABILIDADE:TooltipText := "Numero da Viabilidade"

oCCcmbBuscaVia := PushButton{self,ResourceID{JIMP_CMBBUSCAVIA,_GetInst()}}
oCCcmbBuscaVia:HyperLabel := HyperLabel{#cmbBuscaVia,"-->",NULL_STRING,NULL_STRING}
oCCcmbBuscaVia:TooltipText := "Clique Para Localizar Codigo da Viabilidade"

self:Caption := "Importar Produto"
self:HyperLabel := HyperLabel{#jimp,"Importar Produto",NULL_STRING,NULL_STRING}

self:PostInit(oParent,uExtra)

return self


END CLASS
