#region DEFINES
STATIC DEFINE JPFDIA_BUSCA := 107 
STATIC DEFINE JPFDIA_BUSCA3D := 112 
STATIC DEFINE JPFDIA_BUSCACODFIN := 109 
STATIC DEFINE JPFDIA_BUSCACODINT := 115 
STATIC DEFINE JPFDIA_BUSCAPF := 111 
STATIC DEFINE JPFDIA_CBUSCA := 106 
STATIC DEFINE JPFDIA_ESCOLHER := 104 
STATIC DEFINE JPFDIA_JPF := 100 
STATIC DEFINE JPFDIA_SAIR := 102 
STATIC DEFINE JPFDIA_THEFIXEDTEXT10 := 105 
STATIC DEFINE JPFDIA_THEFIXEDTEXT11 := 103 
STATIC DEFINE JPFDIA_THEFIXEDTEXT12 := 108 
STATIC DEFINE JPFDIA_THEFIXEDTEXT13 := 110 
STATIC DEFINE JPFDIA_THEFIXEDTEXT14 := 113 
STATIC DEFINE JPFDIA_THEFIXEDTEXT15 := 114 
STATIC DEFINE JPFDIA_THEFIXEDTEXT9 := 101 
#endregion

class JPFDIA inherit DATADIALOG 

	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCsair as PUSHBUTTON
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCEscolher as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oDCCBUSCA as SINGLELINEEDIT
	protect oCCBusca as PUSHBUTTON
	protect oDCtheFixedText12 as FIXEDTEXT
	protect oCCBuscacodfin as PUSHBUTTON
	protect oDCtheFixedText13 as FIXEDTEXT
	protect oCCBuscaPF as PUSHBUTTON
	protect oCCBusca3d as PUSHBUTTON
	protect oDCtheFixedText14 as FIXEDTEXT
	protect oDCtheFixedText15 as FIXEDTEXT
	protect oCCBuscacodINT as PUSHBUTTON
// 	instance CBUSCA 
	protect oSFJPF as JPF

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CBUSCA() 
return self:FieldGet(#CBUSCA)


assign CBUSCA(uValue) 
self:FieldPut(#CBUSCA, uValue)
return CBUSCA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPFDIA",_GetInst()},iCtlID)

oDCtheFixedText9 := FixedText{self,ResourceID{JPFDIA_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCsair := PushButton{self,ResourceID{JPFDIA_SAIR,_GetInst()}}
oCCsair:HyperLabel := HyperLabel{#sair,NULL_STRING,NULL_STRING,NULL_STRING}
oCCsair:Image := ico_sair{}

oDCtheFixedText11 := FixedText{self,ResourceID{JPFDIA_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Escolher",NULL_STRING,NULL_STRING}

oCCEscolher := PushButton{self,ResourceID{JPFDIA_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,NULL_STRING,NULL_STRING,NULL_STRING}
oCCEscolher:Image := ico_ok{}

oDCtheFixedText10 := FixedText{self,ResourceID{JPFDIA_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"Codigo",NULL_STRING,NULL_STRING}

oDCCBUSCA := SingleLineEdit{self,ResourceID{JPFDIA_CBUSCA,_GetInst()}}
oDCCBUSCA:HyperLabel := HyperLabel{#CBUSCA,NULL_STRING,NULL_STRING,NULL_STRING}

oCCBusca := PushButton{self,ResourceID{JPFDIA_BUSCA,_GetInst()}}
oCCBusca:Image := ico_find{}
oCCBusca:HyperLabel := HyperLabel{#Busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText12 := FixedText{self,ResourceID{JPFDIA_THEFIXEDTEXT12,_GetInst()}}
oDCtheFixedText12:HyperLabel := HyperLabel{#theFixedText12,"CodFinal",NULL_STRING,NULL_STRING}

oCCBuscacodfin := PushButton{self,ResourceID{JPFDIA_BUSCACODFIN,_GetInst()}}
oCCBuscacodfin:Image := ico_find{}
oCCBuscacodfin:HyperLabel := HyperLabel{#Buscacodfin,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText13 := FixedText{self,ResourceID{JPFDIA_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"PF",NULL_STRING,NULL_STRING}

oCCBuscaPF := PushButton{self,ResourceID{JPFDIA_BUSCAPF,_GetInst()}}
oCCBuscaPF:Image := ico_find{}
oCCBuscaPF:HyperLabel := HyperLabel{#BuscaPF,NULL_STRING,NULL_STRING,NULL_STRING}

oCCBusca3d := PushButton{self,ResourceID{JPFDIA_BUSCA3D,_GetInst()}}
oCCBusca3d:Image := ico_find{}
oCCBusca3d:HyperLabel := HyperLabel{#Busca3d,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText14 := FixedText{self,ResourceID{JPFDIA_THEFIXEDTEXT14,_GetInst()}}
oDCtheFixedText14:HyperLabel := HyperLabel{#theFixedText14,"CodRed",NULL_STRING,NULL_STRING}

oDCtheFixedText15 := FixedText{self,ResourceID{JPFDIA_THEFIXEDTEXT15,_GetInst()}}
oDCtheFixedText15:HyperLabel := HyperLabel{#theFixedText15,"CodInt",NULL_STRING,NULL_STRING}

oCCBuscacodINT := PushButton{self,ResourceID{JPFDIA_BUSCACODINT,_GetInst()}}
oCCBuscacodINT:Image := ico_find{}
oCCBuscacodINT:HyperLabel := HyperLabel{#BuscacodINT,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Escolhendo Processo Fabricação"
self:HyperLabel := HyperLabel{#JPFDIA,"Escolhendo Processo Fabricação",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFJPF := JPF{self,JPFDIA_JPF}
oSFJPF:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
