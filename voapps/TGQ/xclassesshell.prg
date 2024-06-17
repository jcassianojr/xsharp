CLASS TGQSHELL INHERIT StandardShellWindow

CONSTRUCTOR( oOwnerApp ) 
//	LOCAL oSB AS StatusBar
	LOCAL oSBIUSER AS StatusBarItem
        LOCAL oSBIDATE AS StatusBarItem	
        LOCAL cDATE AS STRING
	
	SUPER: INIT( oOwnerApp )
	
	aChildWindows := {}
 
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




	SELF:Menu := EmptyShellMenu{ SELF }

	SELF:Icon := Icon{ResourceID{IDI_STANDARDICON}}
	
	RETURN SELF



METHOD sayCOM() 
  LOCAL oJCOM AS JCOM
  oJCOM:=jCOM{SELF}
  OjCOM:show()		
  SELF:Caption:="Módulo TGQ - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		

METHOD XWRPTADP 
SELF:XWRPTGRP("ADP","")	

METHOD XWRPTCFE 
SELF:XWRPTGRP("CFE","")	


METHOD XWRPTCNQ 
SELF:XWRPTGRP("CNQ","")	

METHOD XWRPTCRRS 
SELF:XWRPTGRP("CRRS","")	

METHOD XWRPTIQF 
SELF:XWRPTGRP("IQF","")	

METHOD XWRPTPPAP 
SELF:XWRPTGRP("PPAP","")	

METHOD XWRPTRACF 
SELF:XWRPTGRP("RACF","")	

METHOD XWRPTRAT 
SELF:XWRPTGRP("RAT","")	

METHOD XWRPTRDP 
SELF:XWRPTGRP("SAC","RDP")	


METHOD XWRPTRNC 
SELF:XWRPTGRP("RNC","")	

METHOD XWRPTSAC 
SELF:XWRPTGRP("SAC","SAC")	


END CLASS
