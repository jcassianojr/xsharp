#region DEFINES
DEFINE CREATEPROCESS_MANIFEST_RESOURCE_ID := 1
DEFINE RC_RT_MANIFEST                     := 24
#endregion

[STAThread];
FUNCTION Start() AS INT
	LOCAL oXApp AS XApp
	TRY
		oXApp := XApp{}
		oXApp:Start()
	CATCH oException AS Exception
		ErrorDialog(oException)
	END TRY
RETURN 0

CLASS XApp INHERIT App
METHOD Start() 
	LOCAL oWindow AS BCOSHELL //StandardShellWindow
	LOCAL oLogonDialog AS LogonDialog
	LOCAL oMAIL AS XJMAIL	
	LOCAL aDAD,aLOGIN AS ARRAY       
	
	 
	 /*
	//
	// odbc requer no wchar marcado senao tras so a primeira letra
	//
	//
	//
	
	
	LOCAL GLOoCONNECTION AS  SQLConnection   
	LOCAL cStatement AS STRING   
	LOCAL cCONN AS STRING
	LOCAL GLOoSTATEMENT AS SQLStatemenT    
	LOCAL GLOcDATABASE AS STRING                
	LOCAL GLOcALIAS AS STRING 
	LOCAL CSQL AS STRING
	LOCAL OREG AS SQLSelect 
	LOCAL cVALOR AS STRING
	
	SQLConnectErrorMsg( TRUE )         
	cCONN :=   "SQLite3"
//	cCONN :=   "Access"
	GLOoCONNECTION := SQLConnection{cCONN, "", "" }	    
	
	GLOoCONNECTION:connect()
  IF GLOoCONNECTION:Connected    
  	 alert ("Connected")
  ENDIF  
 
 // if there's a secondary database, attach it first    
 // 	GLOcDATABASE := "d:\develop\modelos\banco\banco.sqlite"     
//  	GLOcDATABASE := "d:\develop\modelos\controle\pf.mdb"     
//  	GLOcALIAS := "banco"
 // 	GLOcALIAS := "pf"       
 
    GLOcDATABASE := "c:\temp\chinook.sqlite "	  
    GLOcALIAS :=  "chinook"
    
  cStatement := "ATTACH DATABASE '"+GLOcDATABASE+"' AS "+ GLOcALIAS
 	GLOoSTATEMENT := SQLStatement{cStatement , GLOoCONNECTION }

 IF !GLOoSTATEMENT:Execute()
		// we've used this method primarily to test for correct syntax
		ALERT( "didn't execute " + cStatement) 
		RETURN FALSE
 ENDIF  
 
 cSQL :="SELECT  name as nome  FROM genres;"

  oreg:= SQLSelect{cSQL,GLOoCONNECTION}
   WHILE ! OREG:EoF	
    //   cVALOR:=oREG:FieldGetFormatted("Nome") 
       cVALOR:=  oreg:FieldGet(1)
    //   ALERT(Str(Len(oREG:FIELDGET("Name"))))   
     //  alert(ValType(oREG:FIELDGET("Name")) )
       ALERT(cVALOR)
    Oreg:skip()
   ENDDO    
   
 //GLOoSTATEMENT:FreeStmt( SQL_DROP  )
 */
                
	SetExclusive(FALSE)
	SetDeleted(TRUE)
	SetSoftSeek(TRUE)
	SetDefault(DiskName()+":\"+CurDir())
	SetPath(GetEnv("PATH"))
    SetAnsi(FALSE)	//       Setar  Ansi  falso Compatibilidade programa em dos(Acentuacao)
    SetInternational(#CLIPPER)
    SetEpoch(Year(Today())-60)
    SetDateFormat("DD/MM/YYYY")
    SetDeleted( .T. )

    EnableAppVisualTheme(TRUE)
    DisableProcessWindowsGhosting()

	ZCURDIR:= DiskName()+":\"+CurDir()+"\"
	ZCURINI:=ZCURDIR+"BANCO.INI"
    ZDATA:=Today()

    ZEMPRESA:=1
    ZMES:=Month(Today())
    ZANO:=Year(Today())
	oWindow := BCOSHELL{SELF}
	
    cHELP:=PEGINIVAL(ZCURINI,"HELP","CAMINHO")
    IF File(cHELP)
      oWINDOW:HelpDisplay := HelpDisplay{cHELP}	// Hook in help subsystem
      oWINDOW:HelpDisplay:EnableHTMLHelp(TRUE) //true chm //hlp comentar linha
    ELSE
      alert(cHELP)	
    ENDIF	

    oWINDOW:Caption := "Modulo Bancario"
    aDIR:=PEGCONFIGU(ZCURINI,ZCURDIR)
    IF aDIR[1]=" "
      SELF:QUIT()
    ENDIF
IF RunningInstances() > 1
   alert("Aplicativo ja esta sendo usado")	
   IF ! MDG("Continuar Mesmo Assim")
      SELF:Quit()
   ENDIF
ELSE	
	 aDAD:={ZCURINI,"MUSER.DBF",zCURDIR}
   ZEMPRESA:=1
   ZMES:=Month(Today())
   ZANO:=Year(Today())
   aLOGIN:=CHECKLOGIN(_GetCmdLine(),aDAD)
   IF ! aLOGIN[1]
      oLogonDialog := LogonDialog{SELF,aDAD,cHELP}
      oLogonDialog:Show()
      IF oLogonDialog:logonOk
  	     aLOGIN[2] := Upper(oLogonDialog:logonID)	
    	 aLOGIN[3] := oLOGONDIALOG:logonFOLHA
         aLOGIN[4] := oLogonDialog:logonWRPT
       	 aLOGIN[5] := oLOGONDIALOG:logonNOME
         aLOGIN[1]:=.T.
         ZEMPRESA:=oLogonDialog:nEMPRESA
         ZMES:=oLogonDialog:nMES
         ZANO:=oLogonDialog:nANO
      ENDIF
    ENDIF
    ZUSER:=aLOGIN[2]
    ZFOLHA:=aLOGIN[3]	
    zWRPT:=aLOGIN[4]
    ZNOMEFOLHA:=aLOGIN[5]
    IF  aLOGIN[1]
        GRAVALOG("ACESSOU","ENT","BCO")
        oMAIL:=XJMAIL{SELF,.T.}
        oMAIL:SHOW()		
	    oWindow:Show(SHOWZOOMED)//	oWindow:Show()		
  	    oWindow:statusBar:SetText (Str(ZFOLHA,8)+"-"+ZUSER, #SBUser)
	    oWINDOW:Caption := "Módulo BANCO  Empresa: "+StrZero(Zempresa,3)+" Competencia: "+StrZero(Zmes,2)+"/"+StrZero(Zano,4)
	    SELF:Exec()
    ELSE
	   // Exit program
	   SELF:Quit()
    ENDIF
ENDIF

END CLASS
