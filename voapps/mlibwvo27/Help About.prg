#region DEFINES
STATIC DEFINE HELPABOUT_FIXEDTEXT3 := 106
STATIC DEFINE HelpAbout_IND_FONTSWISS12:= 1 
STATIC DEFINE HELPABOUT_INFO := 101
STATIC DEFINE HELPABOUT_INFOSISTEMA := 105
STATIC DEFINE HELPABOUT_PUSHBUTTON1 := 103
STATIC DEFINE HELPABOUT_THEFIXEDTEXT3 := 102
STATIC DEFINE HELPABOUT_THEFIXEDTEXT9 := 104
STATIC DEFINE HELPABOUT_THEGROUPBOX1 := 104 
STATIC DEFINE HELPABOUT_TITULO := 100
#endregion

PARTIAL CLASS HelpAbout INHERIT DIALOGWINDOW
PROTECT oDCTITULO AS FIXEDTEXT
PROTECT oDCInfo AS FIXEDICON
PROTECT oDCtheFixedText3 AS FIXEDTEXT
PROTECT oCCPushButton1 AS PUSHBUTTON
PROTECT oDCtheFixedText9 AS FIXEDTEXT
PROTECT oDCINFOSISTEMA AS RICHEDIT
PROTECT oDCFixedText3 AS Hyperlink

// User code starts here (DO NOT remove this line)  ##USER##

    EXPORT cTIMEINI AS STRING
    //EXPORT nTEMPO AS DWORD


CONSTRUCTOR(oParent,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oParent,uExtra)

	LoadLibrary(String2Psz("RICHED32.DLL"))

	SUPER(oParent , ResourceID{"HelpAbout" , _GetInst()} , TRUE)

	SELF:oDCTITULO := FIXEDTEXT{SELF , ResourceID{ HELPABOUT_TITULO  , _GetInst() } }
	oFont := Font{  , 12 , "Microsoft Sans Serif" }
	oFont:Bold := TRUE
	SELF:oDCTITULO:Font( oFont )
	SELF:oDCTITULO:HyperLabel := HyperLabel{#TITULO , "Nome da Aplicação" , NULL_STRING , NULL_STRING}

	SELF:oDCInfo := FIXEDICON{SELF , ResourceID{ HELPABOUT_INFO  , _GetInst() } }
	SELF:oDCInfo:HyperLabel := HyperLabel{#Info , "info_ico" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText3 := FIXEDTEXT{SELF , ResourceID{ HELPABOUT_THEFIXEDTEXT3  , _GetInst() } }
	SELF:oDCtheFixedText3:HyperLabel := HyperLabel{#theFixedText3 , "Copyright 2016" , NULL_STRING , NULL_STRING}

	SELF:oCCPushButton1 := PUSHBUTTON{SELF , ResourceID{ HELPABOUT_PUSHBUTTON1  , _GetInst() } }
	SELF:oCCPushButton1:TooltipText := "Clique Para Retornar"
	SELF:oCCPushButton1:Image := ICO_SAIR{}
	SELF:oCCPushButton1:HyperLabel := HyperLabel{#PushButton1 , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText9 := FIXEDTEXT{SELF , ResourceID{ HELPABOUT_THEFIXEDTEXT9  , _GetInst() } }
	SELF:oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9 , "Retornar" , NULL_STRING , NULL_STRING}

	SELF:oDCINFOSISTEMA := RICHEDIT{SELF , ResourceID{ HELPABOUT_INFOSISTEMA  , _GetInst() } }
	SELF:oDCINFOSISTEMA:HyperLabel := HyperLabel{#INFOSISTEMA , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText3 := Hyperlink{SELF , ResourceID{ HELPABOUT_FIXEDTEXT3  , _GetInst() } }
	SELF:oDCFixedText3:HyperLabel := HyperLabel{#FixedText3 , "www.google.com.br" , NULL_STRING , NULL_STRING}

	SELF:Caption := "Sobre a Aplicação"
	SELF:ClipperKeys := TRUE
	SELF:HyperLabel := HyperLabel{#HelpAbout , "Sobre a Aplicação" , NULL_STRING , NULL_STRING}

	SELF:PostInit(oParent,uExtra)

RETURN


METHOD PostInit() 
LOCAL aINFO AS ARRAY	
LOCAL cTEXTO AS STRING
LOCAL X,nLEN AS DWORD

   aINFO:=InfoSistema()
   nLEN:=ALen(aINFO)
   cTEXTO:=""
   FOR X := 1 TO nLEN
   	   cTEXTO:=cTEXTO+aINFO[X]+Chr(13)+Chr(10)
   NEXT
   SELF:oDCinfosistema:TextValue:=cTEXTO

   SELF:RegisterTimer(20,TRUE)

   FabCenterWindow( SELF )

  RETURN SELF


METHOD PushButton1( ) 
	SELF:EndDialog()

METHOD Timer() 
	SELF:Destroy()


ASSIGN titulo(uValue) 
    oDCTITULO:Caption:= uValue
END CLASS

FUNCTION InfoSistema()  
  LOCAL aITEM AS ARRAY
  aITEM:={}	
  RETU aITEM






