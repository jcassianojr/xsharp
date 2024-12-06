#region DEFINES
STATIC DEFINE DLGPRINTINFO_BTNABORT := 101 
STATIC DEFINE DLGPRINTINFO_TXTPRINTING := 100 
#endregion

CLASS DlgPrintInfo INHERIT DIALOGWINDOW

	PROTECT oDCtxtPrinting AS FIXEDTEXT
	PROTECT oCCbtnAbort AS PUSHBUTTON

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

	PROTECT oPrinter AS Printer

METHOD btnAbort( ) 

	IF SELF:oPrinter != NULL_OBJECT
		SELF:oPrinter:Abort()
	ENDIF


ASSIGN Button(uValue) 
	IF IsString(uValue)
		SELF:oCCbtnAbort:Caption := uValue
	ENDIF
	RETURN SELF:oCCbtnAbort:Caption


ASSIGN InfoText(uValue) 
	IF IsString(uValue)
		SELF:oDCtxtPrinting:Caption := uValue
	ENDIF
	RETURN SELF:oDCtxtPrinting:Caption


CONSTRUCTOR(oParent,uExtra) 

SELF:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"DlgPrintInfo",_GetInst()},FALSE)

oDCtxtPrinting := FixedText{SELF,ResourceID{DLGPRINTINFO_TXTPRINTING,_GetInst()}}
oDCtxtPrinting:HyperLabel := HyperLabel{#txtPrinting,"Printing page ",NULL_STRING,NULL_STRING}

oCCbtnAbort := PushButton{SELF,ResourceID{DLGPRINTINFO_BTNABORT,_GetInst()}}
oCCbtnAbort:HyperLabel := HyperLabel{#btnAbort,"Abort",NULL_STRING,NULL_STRING}

SELF:Caption := "Print with BL_Printer"
SELF:HyperLabel := HyperLabel{#DlgPrintInfo,"Print with BL_Printer",NULL_STRING,NULL_STRING}

SELF:PostInit(oParent,uExtra)

RETURN SELF


METHOD PreInit(oParent,uExtra) 
	
	IF IsInstanceOfUsual(uExtra, #Printer)
		SELF:oPrinter := uExtra
	ENDIF


END CLASS
