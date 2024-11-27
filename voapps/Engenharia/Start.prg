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
	LOCAL oWindow AS engshell //StandardShellWindow
	LOCAL oLogonDialog AS LogonDialog
	LOCAL oMAIL AS XJMAIL	
	LOCAL aDAD,aLOGIN AS ARRAY
//	LOCAL cPARAM

	SetExclusive(FALSE)
	SetDeleted(TRUE)
	SetSoftSeek(TRUE)
	SetDefault(DiskName()+":\"+CurDir())
	SetPath(GetEnv("PATH"))
    SetAnsi(FALSE)	//       Setar  Ansi  falso Compatibilidade programa em dos(Acentuacao)
    SetInternational(#CLIPPER)
    SetEpoch(Year(Today())-60)
    SetDateFormat("DD/MM/YYYY")

        EnableAppVisualTheme(TRUE)
DisableProcessWindowsGhosting()

//     SetMaxDynSize( 0x4000000)               // 64MB dynamic RAM instead of 16MB
//     DynSize(250)                            // increase the initial GC allocation to 12MB
 //    SetMaxRegisteredAxitMethods(64000) //Standard is 16000




	ZCURDIR:= DiskName()+":\"+CurDir()+"\"
	ZCURINI:=ZCURDIR+"ENGENHA.INI"
    ZDATA:=Today()
       ZEMPRESA:=1
    ZMES:=Month(Today())
    ZANO:=Year(Today())

	oWindow := engshell{SELF}
	
	
  cHELP:=PEGINIVAL(ZCURINI,"HELP","CAMINHO")
//    cHELP+="engenha.chm"       //hlp nao funciona em versao novos sistema operacional migrados para chm
    IF File(cHELP)
      oWINDOW:HelpDisplay := HelpDisplay{cHELP}	// Hook in help subsystem
      oWINDOW:HelpDisplay:EnableHTMLHelp(TRUE) //true chm //hlp comentar linha
    ELSE
      alert(cHELP)	
    ENDIF	
	oWINDOW:Caption := "Modulo ENGENHARIA"
    aDIR:=PEGCONFIGU(ZCURINI,ZCURDIR)
    IF aDIR[1]=" "
      SELF:QUIT()
    ENDIF	

    ZDIRFOTO:=PEGINIVAL(ZCURINI,"FOTOS","CAMINHO")
IF RunningInstances() > 1
   alert("Programa Ja em Uso")
     IF ! MDG("Continuar Mesmo Assim")
      SELF:Quit()
   ENDIF

ELSE
   aDAD:={ZCURINI,"MUSER.DBF",zCURDIR}
   aLOGIN:=CHECKLOGIN(_GetCmdLine(),aDAD)
   IF ! aLOGIN[1]
      oLogonDialog := LogonDialog{SELF,aDAD,cHELP}
      oLogonDialog:Show()
      IF oLogonDialog:logonOk
	     aLOGIN[2] := Upper(oLogonDialog:logonID)	
	     aLOGIN[3] := oLOGONDIALOG:logonFOLHA
         aLOGIN[4] := oLogonDialog:logonWRPT
         aLOGIN[5]:= oLogonDialog:logonNome
         aLOGIN[1]:=.T.
      ENDIF
    ENDIF
    ZUSER:=aLOGIN[2]
    ZFOLHA:=aLOGIN[3]	
    zWRPT:=aLOGIN[4]
    ZNOMEFOLHA:=aLOGIN[5]

    ZEMPRESA:=oLogonDialog:nEMPRESA
    ZMES:=oLogonDialog:nMES
    ZANO:=oLogonDialog:nANO
   	oWINDOW:Caption := "Modulo Engenharia  Empresa: "+StrZero(Zempresa,3)+" Competencia: "+StrZero(Zmes,2)+"/"+StrZero(Zano,4)


    IF aLOGIN[1]
       GRAVALOG("ACESSOU","ENT","ENG")
       oMAIL:=XJMAIL{SELF,.T.}
       oMAIL:SHOW()		
       oWindow:Show(SHOWZOOMED)//	oWindow:Show()		
       oWindow:statusBar:SetText (Str(ZFOLHA,8)+"-"+ZUSER, #SBUser)
       SELF:Exec()
    ELSE
       // Exit program
       SELF:Quit()
    ENDIF
ENDIF	

END CLASS
