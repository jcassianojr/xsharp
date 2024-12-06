#region DEFINES
STATIC DEFINE DLGINFO_VO_BTNOK := 104 
STATIC DEFINE DLGINFO_VO_COPYRIGHT := 103 
STATIC DEFINE DLGINFO_VO_COPYRIGHT2 := 105 
STATIC DEFINE DLGINFO_VO_FIXEDICON1 := 100 
STATIC DEFINE DLGINFO_VO_NAME := 101 
STATIC DEFINE DLGINFO_VO_VERSION := 102 
#endregion

CLASS APP_ICON INHERIT Icon

CONSTRUCTOR() 
   SUPER(ResourceID{"APP_ICON", _GetInst()})	

END CLASS
CLASS DlgInfo INHERIT DlgInfo_vo
	

// constructor inserted by xPorter, remove superfluous arguments
CONSTRUCTOR(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9) CLIPPER
SUPER(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
METHOD btnOK() 
	SELF:EndDialog()


METHOD Dispatch(oEvent) 
	
	IF oEvent:Message == WM_COMMAND
		IF oEvent:WParam == IDCANCEL
			SELF:EndDialog()
			RETURN 1L
		ENDIF
	ENDIF

	RETURN SUPER:Dispatch(oEvent)


METHOD PostInit() 
	
	SELF:oDCVersion:Caption   := "Version 1.14 from 18.11.2004"
	SELF:oDCCopyright:Caption := "Copyright 2002-2004 ©  Bernhard Lehmbrock"
	
	RETURN NIL


END CLASS
class DlgInfo_vo inherit DIALOGWINDOW 

	protect oDCFixedIcon1 as FIXEDICON
	protect oDCName as FIXEDTEXT
	protect oDCVersion as FIXEDTEXT
	protect oDCCopyright as FIXEDTEXT
	protect oCCbtnOK as PUSHBUTTON
	protect oDCCopyright2 as FIXEDTEXT

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oParent,uExtra)  

self:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"DlgInfo_vo",_GetInst()},TRUE)

oDCFixedIcon1 := FIXEDICON{self,ResourceID{DLGINFO_VO_FIXEDICON1,_GetInst()}}
oDCFixedIcon1:HyperLabel := HyperLabel{#FixedIcon1,"APP_ICON",NULL_STRING,NULL_STRING}

oDCName := FixedText{self,ResourceID{DLGINFO_VO_NAME,_GetInst()}}
oDCName:HyperLabel := HyperLabel{#Name,"Demo of using the BL_Printer class",NULL_STRING,NULL_STRING}

oDCVersion := FixedText{self,ResourceID{DLGINFO_VO_VERSION,_GetInst()}}
oDCVersion:HyperLabel := HyperLabel{#Version,"Version 1.00 beta  from 01.05.2002",NULL_STRING,NULL_STRING}

oDCCopyright := FixedText{self,ResourceID{DLGINFO_VO_COPYRIGHT,_GetInst()}}
oDCCopyright:HyperLabel := HyperLabel{#Copyright,"Copyright 2002-2003 ©  Bernhard Lehmbrock",NULL_STRING,NULL_STRING}

oCCbtnOK := PushButton{self,ResourceID{DLGINFO_VO_BTNOK,_GetInst()}}
oCCbtnOK:HyperLabel := HyperLabel{#btnOK,"OK",NULL_STRING,NULL_STRING}

oDCCopyright2 := FixedText{self,ResourceID{DLGINFO_VO_COPYRIGHT2,_GetInst()}}
oDCCopyright2:HyperLabel := HyperLabel{#Copyright2,"Lehmbrock@t-online.de",NULL_STRING,NULL_STRING}

self:Caption := "Info about BL_Printer Demo"
self:HyperLabel := HyperLabel{#DlgInfo_vo,"Info about BL_Printer Demo",NULL_STRING,NULL_STRING}

self:PostInit(oParent,uExtra)

return self


END CLASS
