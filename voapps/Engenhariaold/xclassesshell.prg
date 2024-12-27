PARTIAL CLASS engshell INHERIT StandardShellWindow
	PROTECT oPrinter   		AS BL_Printer
	PROTECT oMenuVorschau 	AS BL_PrinterMenu
	
	PROTECT oPrinterRTF		AS BL_Printer
	PROTECT cFileRTF		AS STRING
	
	EXPORT OWNER

CONSTRUCTOR( oOwnerApp ) 
//	LOCAL oSB AS StatusBar
	LOCAL oSBIUSER AS StatusBarItem
        LOCAL oSBIDATE AS StatusBarItem	
        LOCAL cDATE AS STRING
	
	SUPER: INIT( oOwnerApp )
	
	aChildWindows := {}

	SetDeleted( .T. )
	
	//AltD()

        oSBIDate := StatusBarItem{}
	oSBIDate:Style := SBITEMSUNKEN
	cDate := Ddia(Today()) //+ //FullDate(Today())
	oSBIDate:Width := 8* Len(cDate)
	oSBIDate:NameSym := #SBDateItem
	
	oSBIUser := StatusBarItem{}
	oSBIUser:Style := SBITEMRAISED
	oSBIUser:Width := 8*(25) //8 N + "-" + Cognome(15) Len("ADMIN")
	oSBIUser:NameSym := #SBUser
	

	//oSB := SELF:EnableStatusBar()
	SELF:StatusBar:DisplayKeyboard() //
	SELF:StatusBar:DisplayTime()         //
        SELF:StatusBar:Additem (oSBIDATE)
        SELF:StatusBar:Additem (oSBIUser)
	SELF:statusBar:SetText (cDate, #SBDateItem)
	
//	SELF:statusBar:SetText (Str(ZFOLHA,8)+"-"+ZUSER, #SBUser)
// mudado startup para refresh var


	oPrinter := BL_Printer{SELF, "Druck mit BL_Printer", , FALSE}
  	// oPrinter:PrintingDevice:Orientation := DMORIENT_PORTRAIT   // 1
  	oPrinter:PrintingDevice:Orientation := DMORIENT_LANDSCAPE 	// 2
  	// oPrinter:ClipPage := FALSE
  	oPrinter:Update()
  	// oPrinter:PrinterInfo()

  	oPrinterRTF := BL_Printer{SELF, "Druck mit BL_Printer", , FALSE}
  	oPrinterRTF:PrintingDevice:Orientation := DMORIENT_PORTRAIT   // 1
  	// oPrinterRTF:ClipPage := FALSE
  	cFileRTF := ""



	SELF:Menu := EmptyShellMenu{ SELF }

	SELF:Icon := Icon{ResourceID{IDI_STANDARDICON}}
	
	RETURN SELF



METHOD sayCOM() 
  LOCAL oJCOM AS JCOM
  oJCOM:=jCOM{SELF}
  OjCOM:show()		
  SELF:Caption:="Módulo Engenharia - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		

METHOD XWRPTEN 
	SELF:XWRPTGRP("EN","")


END CLASS
