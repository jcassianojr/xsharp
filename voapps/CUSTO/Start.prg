//#region DEFINES
//DEFINE CREATEPROCESS_MANIFEST_RESOURCE_ID := 1
//DEFINE RC_RT_MANIFEST                     := 24
//#endregion

GLOBAL aETI AS ARRAY

GLOBAL aMP01 AS ARRAY

GLOBAL aMP02 AS ARRAY

GLOBAL aMP03 AS ARRAY

GLOBAL aMT01 AS ARRAY

GLOBAL aMU01 AS ARRAY

GLOBAL ZARR AS ARRAY


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
	LOCAL oWindow AS cusshell //StandardShellWindow
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
//       EnableXPStyles(TRUE)
       EnableAppVisualTheme(TRUE)
       DisableProcessWindowsGhosting()



	ZCURDIR:= DiskName()+":\"+CurDir()+"\"
	ZCURINI:=ZCURDIR+"custo.INI"
   ZDATA:=Today()
      ZEMPRESA:=1
    ZMES:=Month(Today())
    ZANO:=Year(Today())


	oWindow := cusshell{SELF}
	
  cHELP:=PEGINIVAL(ZCURINI,"HELP","CAMINHO")
  //  cHELP+="custo.chm"       //hlp nao funciona em versao novos sistema operacional migrados para chm
    IF File(cHELP)
      oWINDOW:HelpDisplay := HelpDisplay{cHELP}	// Hook in help subsystem
      oWINDOW:HelpDisplay:EnableHTMLHelp(TRUE) //true chm //hlp comentar linha
    ELSE
      alert(cHELP)	
    ENDIF		
	

	oWINDOW:Caption := "Modulo Custo"
//	oWindow:Show(SHOWZOOMED)//	oWindow:Show()
   aDIR:=PEGCONFIGU(ZCURINI,ZCURDIR)
   IF aDIR[1]=" "
      SELF:QUIT()
   ENDIF

    ZDIRFOTO:=PEGINIVAL(ZCURINI,"FOTOS","CAMINHO")
IF RunningInstances() > 1
   alert("Aplicativo ja esta sendo usado")	
     IF ! MDG("Continuar Mesmo Assim")
      SELF:Quit()
   ENDIF
ELSE

   aMU01:=MARR("MU01")
   aMT01:=MARR("MT01")	
   aMP01:=MARR("MP01")
   aMP02:=MARR("MP02")
   aETI:=MARR("ETI")
   aMP03:=MARR("MP03")

    ZEMPRESA:=1
    ZMES:=Month(Today())
    ZANO:=Year(Today())

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
        ZEMPRESA:=oLogonDialog:nEMPRESA
        ZMES:=oLogonDialog:nMES
        ZANO:=oLogonDialog:nANO
      ENDIF
    ENDIF
    ZUSER:=aLOGIN[2]
    ZFOLHA:=aLOGIN[3]	
    zWRPT:=aLOGIN[4]
    ZNOMEFOLHA:=aLOGIN[5]

   	oWINDOW:Caption := "Modulo Custo  Empresa: "+StrZero(Zempresa,3)+" Competencia: "+StrZero(Zmes,2)+"/"+StrZero(Zano,4)
    IF aLOGIN[1]

       GRAVALOG("ACESSOU","ENT","SCT")
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
