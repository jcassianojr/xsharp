

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
    LOCAL oJMail AS XJMAIL
    LOCAL oSERVER AS USEREDE	
    LOCAL cPARAM,cVAR AS STRING
    LOCAL nPOS AS DWORD
    LOCAL lENCERRA AS LOGIC
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
	ZCURINI:=ZCURDIR+"MAIL.INI"
    ZDATA:=Today()   
    
       ZEMPRESA:=1
    ZMES:=Month(Today())
    ZANO:=Year(Today())

    
	aDIR:=PEGCONFIGU(ZCURINI,ZCURDIR)
    IF aDIR[1]=" "
       SELF:Quit()
    ENDIF	


   cParam := AllTrim(_GetCmdLine())
 
// alert(Cparam)    
//alert(_GetCmdLine())      
                         
 IF At(" ",cPARAM)=0
      cPARAM:="$SOFTECx"
   ENDIF
               
//alert(Cparam)    
//alert(_GetCmdLine())
   

   lENCERRA:=.T.
   IF At("%",cPARAM)>0
   	  lENCERRA:=.F.
   ENDIF


   nPOS:=At("$",cPARAM)
   ZUSER:=SubStr(cPARAM,nPOS+1)

   IF IsString(ZUSER)
   	  ZUSER:=Upper(ZUSER)
   ELSE
       ZUSER:=""
   ENDIF	

IF RunningInstances() > 1
   alert("Aplicativo ja esta sendo usado")	
     IF ! MDG("Continuar Mesmo Assim")
      SELF:Quit()
   ENDIF  
ELSE
   IF ! Empty(ZUSER)



      cVAR:="DESTINO='"+ZUSER+"'"
      aDAD:={zCURINI,"MAIL.DBF",zCURDIR}
      oSERVER:=USEREDE{aDAD}
      IF oSERVER:nERRO#0
         SELF:QUIT()
      ENDIF                     
      
      oSERVER:SetFilter(cVAR)   
      
     
      IF Oserver:FIELDGET("DESTINO")=ZUSER
      	oJMAIL:=XJMAIL{SELF,oServer,zcurini,zcurdir,ZUSER,lENCERRA,cHELP}


//         cHELP:=PEGINIVAL(ZCURINI,"HELP","CAMINHO")

	   // IF File(cHELP)
	   //   oJMAIL:HelpDisplay := HelpDisplay{cHELP}	// Hook in help subsystem
	   //   oJMAIL:HelpDisplay:EnableHTMLHelp(TRUE) //true chm //hlp comentar linha
	  //  ELSE
	  //    alert("falta arquivo de ajuda"+cHELP)	
	  //  ENDIF	


        oJMAIL:SHOW()



      ELSE
      	alert("sem mensagens")
      	SELF:Quit()
      ENDIF	


      
      
   ENDIF
ENDIF


//    SELF:exec()




	



END CLASS
