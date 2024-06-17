#region DEFINES
STATIC DEFINE _JESCOS_BUSCA := 102 
STATIC DEFINE _JESCOS_BUSCA1 := 110 
STATIC DEFINE _JESCOS_CBUSCA := 101 
STATIC DEFINE _JESCOS_CODIGOINT := 109 
STATIC DEFINE _JESCOS_ESCOLHER := 106 
STATIC DEFINE _JESCOS_FIXEDTEXT3 := 108 
STATIC DEFINE _JESCOS_JOSC := 100 
STATIC DEFINE _JESCOS_OS := 107 
STATIC DEFINE _JESCOS_SAIR := 104 
STATIC DEFINE _JESCOS_THEFIXEDTEXT11 := 105 
STATIC DEFINE _JESCOS_THEFIXEDTEXT9 := 103 
#endregion

class _jescos inherit DATADIALOG 

	protect oDCCBUSCA as RIGHTSLE
	protect oCCBusca as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCsair as PUSHBUTTON
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCEscolher as PUSHBUTTON
	protect oDCOS as RIGHTSLE
	protect oDCFixedText3 as FIXEDTEXT
	protect oDCCODIGOINT as RIGHTSLE
	protect oCCBusca1 as PUSHBUTTON
// 	instance CBUSCA 
// 	instance OS 
// 	instance CODIGOINT 
	protect oSFjosc as josc

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CBUSCA() 
return self:FieldGet(#CBUSCA)


assign CBUSCA(uValue) 
self:FieldPut(#CBUSCA, uValue)
return CBUSCA := uValue


access CODIGOINT() 
return self:FieldGet(#CODIGOINT)


assign CODIGOINT(uValue) 
self:FieldPut(#CODIGOINT, uValue)
return CODIGOINT := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"_jescos",_GetInst()},iCtlID)

oDCCBUSCA := rightSle{self,ResourceID{_JESCOS_CBUSCA,_GetInst()}}
oDCCBUSCA:HyperLabel := HyperLabel{#CBUSCA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCBUSCA:FieldSpec := PADRAO_CHAR_24{}

oCCBusca := PushButton{self,ResourceID{_JESCOS_BUSCA,_GetInst()}}
oCCBusca:Image := ico_find{}
oCCBusca:HyperLabel := HyperLabel{#Busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{_JESCOS_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCsair := PushButton{self,ResourceID{_JESCOS_SAIR,_GetInst()}}
oCCsair:HyperLabel := HyperLabel{#sair,NULL_STRING,NULL_STRING,NULL_STRING}
oCCsair:Image := ico_sair{}

oDCtheFixedText11 := FixedText{self,ResourceID{_JESCOS_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Escolher",NULL_STRING,NULL_STRING}

oCCEscolher := PushButton{self,ResourceID{_JESCOS_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,NULL_STRING,NULL_STRING,NULL_STRING}
oCCEscolher:Image := ico_ok{}

oDCOS := rightSle{self,ResourceID{_JESCOS_OS,_GetInst()}}
oDCOS:FieldSpec := PADRAO_NUM_08{}
oDCOS:HyperLabel := HyperLabel{#OS,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText3 := FixedText{self,ResourceID{_JESCOS_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"OS",NULL_STRING,NULL_STRING}

oDCCODIGOINT := rightSle{self,ResourceID{_JESCOS_CODIGOINT,_GetInst()}}
oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT,NULL_STRING,NULL_STRING,NULL_STRING}

oCCBusca1 := PushButton{self,ResourceID{_JESCOS_BUSCA1,_GetInst()}}
oCCBusca1:Image := ico_find{}
oCCBusca1:HyperLabel := HyperLabel{#Busca1,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Escolher Os"
self:HyperLabel := HyperLabel{#_jescos,"Escolher Os",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjosc := josc{self,_JESCOS_JOSC}
oSFjosc:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access OS() 
return self:FieldGet(#OS)


assign OS(uValue) 
self:FieldPut(#OS, uValue)
return OS := uValue


END CLASS
