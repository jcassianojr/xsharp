//#region DEFINES
//DEFINE CREATEPROCESS_MANIFEST_RESOURCE_ID := 1
//DEFINE RC_RT_MANIFEST                     := 24
//#endregion

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
//	LOCAL aDAD AS ARRAY
	LOCAL oJAN AS JIMPRET
    LOCAL cPARAM,cARQUIVO,cDIREITO,cCON,cSQL AS STRING
    LOCAL nPOS AS DWORD      //    ,nPOS2,nDIF
    LOCAL lEDITA AS LOGIC
    LOCAL lIMPRIME AS LOGIC
    LOCAL lSALVATXT AS LOGIC
    LOCAL lSALVARTF AS LOGIC
    LOCAL lVISUALIZA AS LOGIC 
//    LOCAL OFOTOVIEW AS fotoview

	SetExclusive(FALSE)
	SetDeleted(TRUE)
	SetSoftSeek(TRUE)
	SetDefault(DiskName()+":\"+CurDir())
	SetPath(GetEnv("PATH"))
    SetAnsi(FALSE)	//       Setar  Ansi  falso Compatibilidade programa em dos(Acentuacao)
    SetInternational(#CLIPPER)
    SetEpoch(Year(Today())-60)
    SetDateFormat("DD/MM/YYYY")
 //  SetDeleted( .T. ) 
    SetCollation("Clipper")     
    
    //    	 OFOTOVIEW:=fotoview{SELF,"c:\temp\teste.jpg","titulo"}
      // OFOTOVIEW:SHOW()

lEDITA :=.f.
 lIMPRIME  :=.f.
 lSALVATXT :=.f.
lSALVARTF   :=.f.
 lVISUALIZA :=.f.



 //   EnableAppVisualTheme(TRUE)
  //  DisableProcessWindowsGhosting()
   //   SetMaxDynSize( 0x4000000)               // 64MB dynamic RAM instead of 16MB
  //   DynSize(250)                            // increase the initial GC allocation to 12MB
  //   SetMaxRegisteredAxitMethods(64000) //Standard is 16000
 


   cParam := AllTrim(_GetCmdLine())

  // alert(cparam)

    nPOS:=At(" ",cPARAM)
   IF nPOS=0
      //cPARAM :="TESTE C:\TEMP\REF00001$SSSSSSSSS$#REFEICAO#SELECT * FROM REFB order by nome"
      cPARAM :="c:\develop\modelos\wrpt\ita00040.ret$SSSSSSSSS$#MANA5EMP#"
      //cPARAM :="TESTE c:\temp\viabili\ita00112$SSSSSSSSS$#MANA5VIA#"
   ELSE    
   	  NOP
  	  //alert(cPARAM)
   ENDIF

   cARQUIVO:=cPARAM
   nPOS:=At(" ",cARQUIVO)
   IF nPOS>0
      cARQUIVO:=SubStr(cPARAM,nPOS+1)
   ENDIF
   nPOS:=At("$",cARQUIVO)
   IF nPOS>0
      caRQUIVO:=SubStr(cARQUIVO,1,nPOS-1)
   ENDIF
   cARQUIVO:=AllTrim(cARQUIVO)
//   alert(cARQUIVO)

   cDIREITO:=cPARAM
   nPOS:=At("$",cDIREITO)
   IF nPOS>0
      cDIREITO:=SubStr(cDIREITO,nPOS+1)
   ENDIF
   nPOS:=At("$",cDIREITO)
   IF nPOS>0
      cDIREITO:=SubStr(cDIREITO,1,nPOS-1)
   ENDIF
//   alert(cDIREITO)

   cCON:=cPARAM
   nPOS:=At("#",cCON)
   IF nPOS>0
      cCON:=SubStr(cCON,nPOS+1)
   ENDIF
   nPOS:=At("#",cCON)
   IF nPOS>0
	  cSQL:=SubStr(cCON,nPOS+1)
      cCON:=SubStr(cCON,1,nPOS-1)
   ENDIF


//   'VB Comeca zero
//   ' 0-Novo,1-Abrir,2-Salvar,3-Salvacomo
//   ' 4-Editar,5-Visualizar,6-Imprimir,7-Exportar 8-Abrir Com
//   'VO comeca um
//   ' 1-Novo,2-Abrir,3-Salvar,4-Salvacomo
//   ' 5-Editar,6-Visualizar,7-Imprimir,8-Exportar 9-Abrir Com

      IF SubStr(cDIREITO,5,1)="S"
      	lEDITA:=.T.
      ENDIF	
      IF SubStr(cDIREITO,6,1)="S"
      	lVISUALIZA:=.T.
      ENDIF	
      IF SubStr(cDIREITO,7,1)="S"
      	lIMPRIME:=.T.
      ENDIF	
      IF SubStr(cDIREITO,4,1)="S"
      	lSALVATXT:=.T.
      ENDIF	
      IF SubStr(cDIREITO,4,1)="S"
      	lSALVARTF:=.T.
      ENDIF	


  
   
    
   
    oJAN:=JIMPRET{SELF,CARQUIVO,cCON,cSQL,{lEDITA,lVISUALIZA,lIMPRIME,lSALVATXT,lSALVARTF}}      
     
    oJAN:SHOW()

	


END CLASS
