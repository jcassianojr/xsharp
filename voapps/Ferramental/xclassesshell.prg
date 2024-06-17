CLASS fershell INHERIT StandardShellWindow

METHOD IMGFER(oOWNER) 
LOCAL nFout AS PTR
LOCAL cARQ AS STRING
cARQ:=PEGINIVAL(ZCURINI,"PATH","IMGJPG")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("IMGJPG"),String2Psz("{IMGFER}"),String2Psz(carq),SW_SHOWNORMAL) 
ShellExecuteErro(nFout)  
		

METHOD IMGME01(oOWNER) 
LOCAL cARQ AS STRING
LOCAL nFout AS PTR
cARQ:=PEGINIVAL(ZCURINI,"PATH","IMGJPG")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("IMGJPG"),String2Psz("{IMGME01}"),String2Psz(carq),SW_SHOWNORMAL) 
ShellExecuteErro(nFout) 
		

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
  SELF:Caption:="Módulo Ferramental - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		

METHOD XSINFER(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL oConn AS SQLConnection
LOCAL oTABLE AS SQLTABLE
LOCAL cSQL,cARQIMG,cCODIGO AS STRING
LOCAL nNUMERO
LOCAL oStmt AS SQLStatement
LOCAL aDAD AS ARRAY

aDAD:={zCURINI,"FERRAM.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETURN .f.
ENDIF


cARQIMG:="IMGFER"
oConn := SQLConnection{}
IF ! oConn:connect(cARQIMG,"","")
   oSERVER:CLOSE()	
   SELF:POINTER:=POINTER{}
   alert("Erro na Conecção Arquivo Foto")
   RETURN .f.
ENDIF	

oSERVER:GOTOP()
WHILE ! oSERVER:EoF
   nNUMERO:=oSERVER:FIELDGET("NUMERO")
   cCODIGO:=AllTrim(oSERVER:FIELDGET("FERRAM"))
   IF ! Empty(cCODIGO)
      oTABLE:=SQLTABLE{"IMAGENS",{"IMAGENS","NUMERO"},oCONN}
      IF ! oTABLE:SEEK("NUMERO",nNUMERO)
   	    oTABLE:CLOSE()
     	cSQL:= "Insert into imagens (CODIGO,NUMERO) values ('"+cCODIGO+"',"+AllTrim(Str(nNUMERO))+")"
   	    oStmt := SQLStatement{cSQL,oConn}
        oSTMT:Execute()
      ENDIF	
   ENDIF
   oSERVER:SKIP()
ENDDO	
oCONN:Disconnect()

oSERVER:cLOSE()
SELF:POINTER:=POINTER{}

METHOD XSINME01(oOWNER) 
LOCAL oSERVER AS USEREDE
LOCAL oConn AS SQLConnection
LOCAL oTABLE AS SQLTABLE
LOCAL cSQL,cARQIMG,cCODIGO AS STRING
LOCAL nNUMERO
LOCAL oStmt AS SQLStatement
LOCAL aDAD AS ARRAY

aDAD:={zCURINI,"ME01.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETURN .f.
ENDIF


cARQIMG:="IMGME01"
oConn := SQLConnection{}
IF ! oConn:connect(cARQIMG,"","")
   oSERVER:CLOSE()	
   SELF:POINTER:=POINTER{}
   alert("Erro na Conecção Arquivo Foto")
   RETURN .f.
ENDIF	

oSERVER:GOTOP()
WHILE ! oSERVER:EoF
   cCODIGO:=AllTrim(oSERVER:FIELDGET("NUMERO"))
   nNUMERO:=Val(cCODIGO)
   oTABLE:=SQLTABLE{"IMAGENS",{"IMAGENS","NUMERO"},oCONN}
   IF ! oTABLE:SEEK("NUMERO",nNUMERO)
   	  oTABLE:CLOSE()
   	  cSQL:= "Insert into imagens (CODIGO,NUMERO) values ('"+cCODIGO+"',"+nNUMERO+")"
   	  oStmt := SQLStatement{cSQL,oConn}
      oSTMT:Execute()
   ENDIF	
   oSERVER:SKIP()
ENDDO	
oCONN:Disconnect()

oSERVER:cLOSE()
SELF:POINTER:=POINTER{}


METHOD XWRPTCRG 
SELF:XWRPTGRP("FR","CRG")	

METHOD XWRPTFEHG 
SELF:XWRPTGRP("FR","HG")	


METHOD XWRPTFR 
SELF:XWRPTGRP("FR","")	

METHOD XWRPTFRFR 
SELF:XWRPTGRP("FR","FR")	

METHOD XWRPTFRMQ 
SELF:XWRPTGRP("FR","MQ")	

METHOD XWRPTFROUT 
SELF:XWRPTGRP("FR","OUT")	

METHOD XWRPTFRRL 
SELF:XWRPTGRP("FR","RL")	

METHOD XWRPTFRRO 
SELF:XWRPTGRP("FR","RO")	

METHOD XWRPTfrsm 
SELF:XWRPTGRP("FR","SM")	

METHOD XWRPTLVF 
SELF:XWRPTGRP("FR","LVF")	

METHOD XWRPTLVM 
SELF:XWRPTGRP("FR","LVM")	

METHOD XWRPTME 
SELF:XWRPTGRP("ME","")	

METHOD XWRPTMEFR 
SELF:XWRPTGRP("ME","FR")	

METHOD XWRPTMEMQ 
SELF:XWRPTGRP("ME","MQ")	


END CLASS
