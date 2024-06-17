#region DEFINES
STATIC DEFINE ESCMP_CMDCANCELAR := 102 
STATIC DEFINE ESCMP_ESCOLHER := 104 
STATIC DEFINE ESCMP_LISTBOX := 100 
STATIC DEFINE ESCMP_THEFIXEDTEXT11 := 103 
STATIC DEFINE ESCMP_THEFIXEDTEXT9 := 101 
#endregion

class ESCMP inherit DATADIALOG 

	protect oDCLISTBOX as LISTBOX
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCcmdCancelar as PUSHBUTTON
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCEscolher as PUSHBUTTON
// 	instance LISTBOX 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"ESCMP",_GetInst()},iCtlID)

oDCLISTBOX := ListBox{self,ResourceID{ESCMP_LISTBOX,_GetInst()}}
oDCLISTBOX:HyperLabel := HyperLabel{#LISTBOX,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{ESCMP_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCcmdCancelar := PushButton{self,ResourceID{ESCMP_CMDCANCELAR,_GetInst()}}
oCCcmdCancelar:HyperLabel := HyperLabel{#cmdCancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCcmdCancelar:Image := ico_sair{}

oDCtheFixedText11 := FixedText{self,ResourceID{ESCMP_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Escolher",NULL_STRING,NULL_STRING}

oCCEscolher := PushButton{self,ResourceID{ESCMP_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,NULL_STRING,NULL_STRING,NULL_STRING}
oCCEscolher:Image := ico_ok{}

self:Caption := "DataDialog Caption"
self:HyperLabel := HyperLabel{#ESCMP,"DataDialog Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LISTBOX() 
return self:FieldGet(#LISTBOX)


assign LISTBOX(uValue) 
self:FieldPut(#LISTBOX, uValue)
return LISTBOX := uValue


END CLASS
