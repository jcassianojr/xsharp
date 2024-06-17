CLASS XJSYS INHERIT jdiasys

METHOD cmdimp( ) 
 LOCAL cDIR, cEXE, cCODNEW AS STRING
 LOCAL nFout AS PTR

   IF ! entramenu(SELF:oSFjsys:SERVER:FIELDGET("ITEMENU"),SELF:oSFjsys:SERVER:FIELDGET("POSICAO"),"MUSERB.DBF")
	   RETURN SELF
    ENDIF	

    cCODNEW := Upper(AllTrim(SELF:oSFjsys:SERVER:FIELDGET("EXECUTAR")))

  IF ! File(cCODNEW)
       alert("Nao Encontrado" + cCODNEW)
      RETURN SELF
   END IF


cDIR:=GetFileNameFromPath(cCODNEW)
cEXE:=GetPathFromFileName(cCODNEW)

nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz(cEXE),String2Psz(""),String2Psz(cDIR),SW_SHOWNORMAL)
ShellExecuteErro(nFout) 

METHOD cmdSaida( ) 
	SELF:EndWindow()

CONSTRUCTOR(oOWNER) 
LOCAL aDAD AS ARRAY
LOCAL oSERVER AS USEREDE
aDAD:={zCURINI,"SYSOPT.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU SELF
ENDIF
SUPER(oOWNER)
SELF:oSFjsys:USE(oSERVER)
SELF:OSFJSYS:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	   FabCenterWindow( SELF )
	RETURN NIL



END CLASS
