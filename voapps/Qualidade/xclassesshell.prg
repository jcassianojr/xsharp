﻿CLASS quashell INHERIT StandardShellWindow

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
	

//	oSB := SELF:EnableStatusBar()
	SELF:StatusBar:DisplayKeyboard() //
	SELF:StatusBar:DisplayTime()         //
        SELF:StatusBar:Additem (oSBIDATE)
        SELF:StatusBar:Additem (oSBIUser)
	SELF:statusBar:SetText (cDate, #SBDateItem)
	
//	SELF:statusBar:SetText (Str(ZFOLHA,8)+"-"+ZUSER, #SBUser)
// mudado startup para refresh var




	SELF:Menu := EmptyShellMenu{ SELF }

	SELF:Icon := Icon{ResourceID{IDI_STANDARDICON}}
	
	RETURN SELF



METHOD sayCOM() 
  LOCAL oJCOM AS JCOM
  oJCOM:=jCOM{SELF}
  OjCOM:show()		
  SELF:Caption:="Módulo Qualidade - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		

METHOD XWRPTACP 	
		SELF:xwrptgrp("CP","ACP")

METHOD XWRPTAEP 	
	SELF:xwrptgrp("CP","AEP")	

METHOD XWRPTCI 	
		SELF:xwrptgrp("CP","CI")

METHOD XWRPTGC 	
		SELF:xwrptgrp("CP","GC")

METHOD XWRPTOUT 	
		SELF:xwrptgrp("CP","OUT")

METHOD XWRPTPAE 	
		SELF:xwrptgrp("CP","PAE")

METHOD XWRPTPLC 	
		SELF:xwrptgrp("CP","PLC")

METHOD XWRPTRI 	
		SELF:xwrptgrp("CP","RI")

METHOD XWRPTRR 	
	SELF:xwrptgrp("CP","RR")

METHOD XWRPTTEEP 	
		SELF:xwrptgrp("CP","TEEP")


END CLASS
