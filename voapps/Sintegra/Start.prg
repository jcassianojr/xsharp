//#region DEFINES
//DEFINE CREATEPROCESS_MANIFEST_RESOURCE_ID := 1
//DEFINE RC_RT_MANIFEST                     := 24
//#endregion

GLOBAL aCODI AS ARRAY

GLOBAL aCODIN AS ARRAY

GLOBAL aUF AS ARRAY

GLOBAL aUFA AS ARRAY

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
	LOCAL oWINDOW AS sinshell //StandardShellWindow
	LOCAL oLogonDialog AS LogonDialog
	LOCAL oMAIL AS XJMAIL	
	LOCAL aDAD,aLOGIN AS ARRAY

	
	SetExclusive(FALSE)
	SetDeleted(TRUE)
	SetSoftSeek(TRUE)
	SetDefault(DiskName()+":\"+CurDir())
	SetPath(GetEnv("PATH"))
    SetAnsi(FALSE)	//       Setar  Ansi  falso Compatibilidade programa em dos(Acentuacao)
    SetInternational(#CLIPPER)
    SetEpoch(Year(Today())-60)
    SetDateFormat("DD/MM/YYYY")
 //   SetDeleted( .T. ) 
    SetCollation("Clipper")     


 //   EnableAppVisualTheme(TRUE)
  //  DisableProcessWindowsGhosting()
   //   SetMaxDynSize( 0x4000000)               // 64MB dynamic RAM instead of 16MB
  //   DynSize(250)                            // increase the initial GC allocation to 12MB
  //   SetMaxRegisteredAxitMethods(64000) //Standard is 16000
 

	ZCURDIR:= DiskName()+":\"+CurDir()+"\"
	ZCURINI:=ZCURDIR+"SINTEGRA.INI"
    ZDATA:=Today()    
    
       ZEMPRESA:=1
    ZMES:=Month(Today())
    ZANO:=Year(Today())

	oWINDOW := sinshell{SELF}
	
  cHELP:=PEGINIVAL(ZCURINI,"HELP","CAMINHO")
   // cHELP+="sintegra.chm"       //hlp nao funciona em versao novos sistema operacional migrados para chm
    IF File(cHELP)
      oWINDOW:HelpDisplay := HelpDisplay{cHELP}	// Hook in help subsystem
      oWINDOW:HelpDisplay:EnableHTMLHelp(TRUE) //true chm //hlp comentar linha
    ELSE 
      ALERT("Arquivo de ajuda nao encontrado: "+cHELP)	
    ENDIF		


	oWINDOW:Caption := "Modulo Sintegra"
	//oWINDOW:Show(SHOWZOOMED)//	oWINDOW:Show()
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
   	oWINDOW:Caption := "Modulo Sintegra  Empresa: "+StrZero(Zempresa,3)+" Competencia: "+StrZero(Zmes,2)+"/"+StrZero(Zano,4)



    IF aLOGIN[1]
//       GRVLOG("ACESSOU","ENT","BCO")
       oMAIL:=XJMAIL{SELF,.T.}
       oMAIL:SHOW()		
       oWINDOW:Show(SHOWZOOMED)//	oWINDOW:Show()		
       oWindow:statusBar:SetText (Str(ZFOLHA,8)+"-"+ZUSER, #SBUser)	
       montaAUF()
       SELF:Exec()
    ELSE
       // Exit program
       SELF:Quit()
    ENDIF
ENDIF

END CLASS
