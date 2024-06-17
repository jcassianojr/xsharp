#region DEFINES
STATIC DEFINE JIMPDIV_CANCELAR := 101 
STATIC DEFINE JIMPDIV_CHAVE := 108 
STATIC DEFINE JIMPDIV_DFIM := 104 
STATIC DEFINE JIMPDIV_DINI := 105 
STATIC DEFINE JIMPDIV_OK := 103 
STATIC DEFINE JIMPDIV_PER := 106 
STATIC DEFINE JIMPDIV_PROGBAR := 107 
STATIC DEFINE JIMPDIV_THEFIXEDTEXT10 := 102 
STATIC DEFINE JIMPDIV_THEFIXEDTEXT9 := 100 
#endregion

class jimpdiv inherit DATADIALOG 

	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
	protect oDCDFIM as DATESLE
	protect oDCDINI as DATESLE
	protect oDCper as FIXEDTEXT
	protect oDCProgBar as PROGRESSBAR
	protect oDCchave as FIXEDTEXT
// 	instance DFIM 
// 	instance DINI 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Cancelar( ) 
	SELF:EndWindow()

access DFIM() 
return self:FieldGet(#DFIM)


assign DFIM(uValue) 
self:FieldPut(#DFIM, uValue)
return DFIM := uValue


access DINI() 
return self:FieldGet(#DINI)


assign DINI(uValue) 
self:FieldPut(#DINI, uValue)
return DINI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jimpdiv",_GetInst()},iCtlID)

oDCtheFixedText9 := FixedText{self,ResourceID{JIMPDIV_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JIMPDIV_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}
oCCCancelar:TooltipText := "Clique aqui Para Cancelar"

oDCtheFixedText10 := FixedText{self,ResourceID{JIMPDIV_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JIMPDIV_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}
oCCOK:TooltipText := "Clique aqui Par Confirmar"

oDCDFIM := DateSle{self,ResourceID{JIMPDIV_DFIM,_GetInst()}}
oDCDFIM:FieldSpec := DATE_FIELD{}
oDCDFIM:HyperLabel := HyperLabel{#DFIM,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDINI := DateSle{self,ResourceID{JIMPDIV_DINI,_GetInst()}}
oDCDINI:FieldSpec := DATE_FIELD{}
oDCDINI:HyperLabel := HyperLabel{#DINI,NULL_STRING,NULL_STRING,NULL_STRING}

oDCper := FixedText{self,ResourceID{JIMPDIV_PER,_GetInst()}}
oDCper:HyperLabel := HyperLabel{#per,"Periodo",NULL_STRING,NULL_STRING}

oDCProgBar := ProgressBar{self,ResourceID{JIMPDIV_PROGBAR,_GetInst()}}
oDCProgBar:Range := Range{0,100}
oDCProgBar:HyperLabel := HyperLabel{#ProgBar,NULL_STRING,NULL_STRING,NULL_STRING}

oDCchave := FixedText{self,ResourceID{JIMPDIV_CHAVE,_GetInst()}}
oDCchave:HyperLabel := HyperLabel{#chave,"Fixed Text",NULL_STRING,NULL_STRING}

self:Caption := "DataDialog Caption"
self:HyperLabel := HyperLabel{#jimpdiv,"DataDialog Caption",NULL_STRING,NULL_STRING}

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
