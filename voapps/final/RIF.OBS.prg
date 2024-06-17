#region DEFINES
STATIC DEFINE JRIFOBS_LINHA01 := 102 
STATIC DEFINE JRIFOBS_LINHA02 := 103 
STATIC DEFINE JRIFOBS_LINHA03 := 104 
STATIC DEFINE JRIFOBS_LINHA04 := 105 
STATIC DEFINE JRIFOBS_LINHA05 := 106 
STATIC DEFINE JRIFOBS_LINHA06 := 107 
STATIC DEFINE JRIFOBS_OKX := 101 
STATIC DEFINE JRIFOBS_THEFIXEDTEXT10 := 100 
#endregion

class JRIFOBS inherit DATADIALOG 

	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOKx as PUSHBUTTON
	protect oDClinha01 as FIXEDTEXT
	protect oDClinha02 as FIXEDTEXT
	protect oDClinha03 as FIXEDTEXT
	protect oDClinha04 as FIXEDTEXT
	protect oDClinha05 as FIXEDTEXT
	protect oDClinha06 as FIXEDTEXT

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRIFOBS",_GetInst()},iCtlID)

aFonts[1] := Font{,16,"Times New Roman"}

oDCtheFixedText10 := FixedText{self,ResourceID{JRIFOBS_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOKx := PushButton{self,ResourceID{JRIFOBS_OKX,_GetInst()}}
oCCOKx:HyperLabel := HyperLabel{#OKx,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOKx:Image := ico_ok{}

oDClinha01 := FixedText{self,ResourceID{JRIFOBS_LINHA01,_GetInst()}}
oDClinha01:HyperLabel := HyperLabel{#linha01,"Fixed Text",NULL_STRING,NULL_STRING}
oDClinha01:Font(aFonts[1], FALSE)

oDClinha02 := FixedText{self,ResourceID{JRIFOBS_LINHA02,_GetInst()}}
oDClinha02:HyperLabel := HyperLabel{#linha02,"Fixed Text",NULL_STRING,NULL_STRING}
oDClinha02:Font(aFonts[1], FALSE)

oDClinha03 := FixedText{self,ResourceID{JRIFOBS_LINHA03,_GetInst()}}
oDClinha03:HyperLabel := HyperLabel{#linha03,"Fixed Text",NULL_STRING,NULL_STRING}
oDClinha03:Font(aFonts[1], FALSE)

oDClinha04 := FixedText{self,ResourceID{JRIFOBS_LINHA04,_GetInst()}}
oDClinha04:HyperLabel := HyperLabel{#linha04,"Fixed Text",NULL_STRING,NULL_STRING}
oDClinha04:Font(aFonts[1], FALSE)

oDClinha05 := FixedText{self,ResourceID{JRIFOBS_LINHA05,_GetInst()}}
oDClinha05:HyperLabel := HyperLabel{#linha05,"Fixed Text",NULL_STRING,NULL_STRING}
oDClinha05:Font(aFonts[1], FALSE)

oDClinha06 := FixedText{self,ResourceID{JRIFOBS_LINHA06,_GetInst()}}
oDClinha06:HyperLabel := HyperLabel{#linha06,"Fixed Text",NULL_STRING,NULL_STRING}
oDClinha06:Font(aFonts[1], FALSE)

self:Caption := "Observações"
self:HyperLabel := HyperLabel{#JRIFOBS,"Observações",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD OKx( ) 
	SELF:EndWindow()

END CLASS
