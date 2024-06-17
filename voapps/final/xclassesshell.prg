CLASS finshell INHERIT StandardShellWindow

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




	SELF:Menu := EmptyShellMenu{ SELF }

	SELF:Icon := Icon{ResourceID{IDI_STANDARDICON}}
	
	RETURN SELF



METHOD sayCOM() 
  LOCAL oJCOM AS JCOM
  oJCOM:=jCOM{SELF}
  OjCOM:show()		
  SELF:Caption:="Módulo Final - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		

METHOD XDESMARCAR 	
	
LOCAL oESC AS XESCCOD	
LOCAL cCODIGO AS STRING
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY


IF ! entramenu("FIN",6)
	RETU SELF
ENDIF	


oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF ! Oesc:lok
   RETU SELF
ENDIF	
cCODIGO:=oESC:CODIGO
aDAD:={zCURINI,"RIFPR.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU SELF
ENDIF
oSERVER:GOTOP()
IF ! oSERVER:SEEK(cCODIGO)	
   oSERVER:APPEND()
   oSERVER:FIELDPUT("PRODUTO",cCODIGO)
ENDIF
oSERVER:FIELDPUT("SEL100",CToD(Space(8)))	
oSERVER:FIELDPUT("RIFSEL",0)
oSERVER:CLOSE()
	

METHOD XMARCAR	
LOCAL oESC AS XESCCOD	
LOCAL cCODIGO AS STRING
LOCAL dDATA AS DATE
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL oBUSCA AS XBUSCA 

dDATA:=Today()+30

IF ! entramenu("FIN",5)
	RETU SELF
ENDIF	


oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF ! Oesc:lok
   RETU SELF
ENDIF	
cCODIGO:=oESC:CODIGO


oBUSCA:=XBUSCA{SELF,"Confirmação","Confirme o Produto",cCODIGO}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF ! oBUSCA:lOK
   RETU SELF	
ENDIF
cCODIGO:=oBUSCA:cBUSCA


oBUSCA:=XBUSCA{SELF,"Informe o Prazo","Digite Data Limite",DToC(Today()+30)}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   dDATA:=CToD(oBUSCA:cBUSCA)
ENDIF


aDAD:={zCURINI,"RIFPR.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU SELF
ENDIF
oSERVER:GOTOP()
IF ! oSERVER:SEEK(cCODIGO)	
   oSERVER:APPEND()
   oSERVER:FIELDPUT("PRODUTO",cCODIGO)
ENDIF
oSERVER:FIELDPUT("SEL100",dDATA)	
oSERVER:FIELDPUT("RIFSEL",0)
oSERVER:CLOSE()


	

METHOD  XWRPTRIF 
SELF:XWRPTGRP("RIF","")



END CLASS
