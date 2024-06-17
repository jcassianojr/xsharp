//#region DEFINES
//DEFINE CREATEPROCESS_MANIFEST_RESOURCE_ID := 1
//DEFINE RC_RT_MANIFEST                     := 24
//#endregion

[STAThread];
FUNCTION Start() AS INT
	LOCAL oXApp AS XAPP
	TRY
		oXApp := XAPP{}
		oXApp:Start()
	CATCH oException AS Exception
		ErrorDialog(oException)
	END TRY
RETURN 0

CLASS XAPP INHERIT App
METHOD Start()  
	LOCAL aDAD AS ARRAY
	LOCAL oJAN AS XJSYS
	LOCAL cHELP AS STRING
	LOCAL oLogonDialog AS LogonDialog	
	LOCAL aLOGIN AS ARRAY
    LOCAL oMAIL AS XJMAIL


	Enable3dControls()
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

  //   SetMaxDynSize( 0x4000000)               // 64MB dynamic RAM instead of 16MB
   //  DynSize(250)                            // increase the initial GC allocation to 12MB
    // SetMaxRegisteredAxitMethods(64000) //Standard is 16000
 //  DisableProcessWindowsGhosting()

    ZCURDIR:= DiskName()+":\"+CurDir()+"\"
	ZCURINI:=ZCURDIR+"SISTEMA.INI"

    ZEMPRESA:=1
    ZMES:=Month(Today())
    ZANO:=Year(Today())


IF RunningInstances() > 1
   alert("Aplicativo ja esta sendo usado")	
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
         aLOGIN[5] := oLogonDialog:logonNOME    
          ZEMPRESA:=oLogonDialog:nEMPRESA
         ZMES:=oLogonDialog:nMES
         ZANO:=oLogonDialog:nANO
  
         aLOGIN[1]:=.T.
      ENDIF
    ENDIF
    ZUSER:=aLOGIN[2]
    ZFOLHA:=aLOGIN[3]	
    zWRPT:=aLOGIN[4]
    ZNOMEFOLHA:=aLOGIN[5]	
  


    IF aLOGIN[1]
       GRAVALOG("ACESSOU","ENT","SIS")
       oMAIL:=XJMAIL{SELF,.T.}
       oMAIL:SHOW()		
       oJAN:=XJSYS{SELF}
       oJAN:Caption := "Modulo Sistemas  Empresa: "+StrZero(Zempresa,3)+" Competencia: "+StrZero(Zmes,2)+"/"+StrZero(Zano,4)




       oJAN:SHOW()
    ELSE
       // Exit program
       SELF:Quit()
    ENDIF
ENDIF	

END CLASS
