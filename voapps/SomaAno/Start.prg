//#region DEFINES
//DEFINE CREATEPROCESS_MANIFEST_RESOURCE_ID := 1
//DEFINE RC_RT_MANIFEST                     := 24
//#endregion

GLOBAL cDATA AS STRING

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
//	LOCAL aDAD AS ARRAY
    LOCAL oJSOM AS xJSOM
    LOCAL cCODIGO,cPARAM
    LOCAL nPOS AS DWORD
 //   LOCAL oARQ AS  USEMANA5

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

   //  SetMaxDynSize( 0x4000000)               // 64MB dynamic RAM instead of 16MB
   //  DynSize(250)                            // increase the initial GC allocation to 12MB
    // SetMaxRegisteredAxitMethods(64000) //Standard is 16000
//DisableProcessWindowsGhosting()

	ZCURDIR:= DiskName()+":\"+CurDir()+"\"
	ZCURINI:=ZCURDIR+"SOMAANO.INI"
    ZDATA:=Today()  
       ZEMPRESA:=1
    ZMES:=Month(Today())
    ZANO:=Year(Today())

    
	aDIR:=PEGCONFIGU(ZCURINI,ZCURDIR)
    IF aDIR[1]=" "
       SELF:Quit()
    ENDIF	

IF RunningInstances() > 1
	alert("Programa ja esta sendo Executado")
   IF ! MDG("Continuar Mesmo Assim")
      SELF:Quit()
   ENDIF
ELSE
	

   cCODIGO:=""
   cParam := Upper(AllTrim(_GetCmdLine()))
   nPOS:=At("$",cPARAM)
   IF nPOS=0 //teSTE
      cCODIGO:="ML01"
   ELSE
      cCODIGO:=SubStr(cPARAM,nPOS+1)
   ENDIF
   oJSOM:=xJSOM{SELF}
    IF  Ojsom:valoresini(cCODIGO)
 	  oJSOM:SHOW()
    ENDIF	

ENDIF


END CLASS
