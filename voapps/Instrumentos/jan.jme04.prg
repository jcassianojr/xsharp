#region DEFINES
STATIC DEFINE _JME04_ENCERRAR := 100 
STATIC DEFINE _JME04_JINS := 101 
#endregion

class _JME04 inherit DATADIALOG 

	protect oCCEncerrar as PUSHBUTTON
	protect oSFJINS as JINS

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Encerrar( ) 
	SELF:EndWindow()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"_JME04",_GetInst()},iCtlID)

oCCEncerrar := PushButton{self,ResourceID{_JME04_ENCERRAR,_GetInst()}}
oCCEncerrar:HyperLabel := HyperLabel{#Encerrar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCEncerrar:Image := ico_sair{}

self:Caption := "Instrumentos"
self:HyperLabel := HyperLabel{#_JME04,"Instrumentos",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFJINS := JINS{self,_JME04_JINS}
oSFJINS:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
    FabCenterWindow( SELF )	
	RETURN NIL


END CLASS
CLASS XJME04 INHERIT _JME04

CONSTRUCTOR(oOWNER,cCODIGO,cCURINI,cCURDIR) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
aDAD:={cCURINI,"ME04.DBF",cCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
oSERVER:gotop()
IF ! oSERVER:SEEK(cCODIGO)
   alert("Codigo Não Cadastrado")
   RETU SELF
ENDIF
SUPER(oOWNER)
SELF:oSFJINS:use(oserver)
SELF:SHOW()	


END CLASS
