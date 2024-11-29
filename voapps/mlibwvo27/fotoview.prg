USING FabPaintLib
#region DEFINES
STATIC DEFINE _FOTOVIEW_CANCELAR := 101
STATIC DEFINE _FOTOVIEW_FOTO := 104
STATIC DEFINE _FOTOVIEW_FOTOJPG := 103
STATIC DEFINE _FOTOVIEW_THEFIXEDTEXT9 := 100
STATIC DEFINE _FOTOVIEW_TITULO := 102
#endregion

PARTIAL CLASS _fotoview INHERIT DATADIALOG
PROTECT oDCtheFixedText9 AS FIXEDTEXT
PROTECT oCCCancelar AS PUSHBUTTON
PROTECT oDCTITULO AS FIXEDTEXT
PROTECT oDCfotojpg AS FIXEDBITMAP
PROTECT oDCfoto AS FabPaintLib.Control.FabPaintLibCtrl

// User code starts here (DO NOT remove this line)  ##USER##

METHOD Cancelar( ) 
	SELF:EndWindow()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"_fotoview" , _GetInst()},iCtlID)

	SELF:oDCtheFixedText9 := FIXEDTEXT{SELF , ResourceID{ _FOTOVIEW_THEFIXEDTEXT9  , _GetInst() } }
	SELF:oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9 , "Retornar" , NULL_STRING , NULL_STRING}

	SELF:oCCCancelar := PUSHBUTTON{SELF , ResourceID{ _FOTOVIEW_CANCELAR  , _GetInst() } }
	SELF:oCCCancelar:HyperLabel := HyperLabel{#Cancelar , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oCCCancelar:Image := ico_sair{}

	SELF:oDCTITULO := FIXEDTEXT{SELF , ResourceID{ _FOTOVIEW_TITULO  , _GetInst() } }
	SELF:oDCTITULO:HyperLabel := HyperLabel{#TITULO , NULL_STRING , NULL_STRING , NULL_STRING}
	SELF:oDCTITULO:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 12 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCTITULO:Font( oFont )

	SELF:oDCfotojpg := FIXEDBITMAP{SELF , ResourceID{ _FOTOVIEW_FOTOJPG  , _GetInst() } }
	SELF:oDCfotojpg:HyperLabel := HyperLabel{#fotojpg , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCfoto := FabPaintLib.Control.FabPaintLibCtrl{SELF , ResourceID{ _FOTOVIEW_FOTO  , _GetInst() } }
	SELF:oDCfoto:HyperLabel := HyperLabel{#foto , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:Caption := "Visualizar"
	SELF:HyperLabel := HyperLabel{#_fotoview , "Visualizar" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


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
