#region DEFINES
STATIC DEFINE _FOTOVIEW_CANCELAR := 102 
STATIC DEFINE _FOTOVIEW_FOTO := 100 
STATIC DEFINE _FOTOVIEW_FOTOJPG := 104 
STATIC DEFINE _FOTOVIEW_THEFIXEDTEXT9 := 101 
STATIC DEFINE _FOTOVIEW_TITULO := 103 
#endregion

class _fotoview inherit DATADIALOG 

	protect oDCFOTO as FABPAINTLIBCTRL
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCTITULO as FIXEDTEXT
	protect oDCfotojpg as FIXEDBITMAP

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Cancelar( ) 
	SELF:EndWindow()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"_fotoview",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCFOTO := FabPaintLibCtrl{self,ResourceID{_FOTOVIEW_FOTO,_GetInst()}}
oDCFOTO:HyperLabel := HyperLabel{#FOTO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{_FOTOVIEW_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{_FOTOVIEW_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}

oDCTITULO := FixedText{self,ResourceID{_FOTOVIEW_TITULO,_GetInst()}}
oDCTITULO:HyperLabel := HyperLabel{#TITULO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCTITULO:Font(aFonts[1], FALSE)
oDCTITULO:BackGround := aBrushes[1]

oDCfotojpg := FIXEDBITMAP{self,ResourceID{_FOTOVIEW_FOTOJPG,_GetInst()}}
oDCfotojpg:HyperLabel := HyperLabel{#fotojpg,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Visualizar"
self:HyperLabel := HyperLabel{#_fotoview,"Visualizar",NULL_STRING,NULL_STRING}

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
CLASS fotoview INHERIT _fotoview

CONSTRUCTOR(oOWNER,cFILE,cTITULO)  
   LOCAL oOBJ AS FabPaintLib
	
   SUPER(oOWNER)

   IF ValType(cTITULO)#"C"
   	  cTITULO:=""
   ENDIF	

   IF File(cFILE)

  	  oOBJ:=FabPaintLib{cFILE,SELF}
      SELF:oDCfoto:ImageFit:=.T.
      SELF:odcfoto:Image:=oOBJ
      SELF:oDCTITULO:CAPTION:=cTITULO
   ELSE
      alert("Arquivo Nao Localizado "+Cfile)
  ENDIF



	


END CLASS
