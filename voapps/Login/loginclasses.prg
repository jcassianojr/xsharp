CLASS LogonDialog INHERIT _LogonDialog
	EXPORT logonOk AS LOGIC
	EXPORT logonID AS STRING
    EXPORT logonNome AS STRING
	EXPORT logonWRPT AS DWORD	
	EXPORT logonFOLHA AS DWORD
	EXPORT aARQ AS ARRAY
	EXPORT nMES AS DWORD
	EXPORT nANO AS DWORD
	EXPORT nEMPRESA AS DWORD
	EXPORT nPERC AS DWORD
	PROTECT wLogonCount

METHOD Ajuda() 
	SELF:HelpDisplay:Show( "Login" )
METHOD CancelButton() 
	logonOk := FALSE
	logonID := ""
	logonWRPT := 0
	SELF:EndDialog()
	RETURN SELF

METHOD cmdmais( ) 
SELF:oDCMES:Value:=Str(INCDEC(SELF:oDCMES:Value,1,1,12),2)		


METHOD cmdmais2( ) 
SELF:oDCANO:Value:=Str(INCDEC(SELF:oDCANO:Value,1,1900,2100),4)					


METHOD cmdmais3( ) 
SELF:oDCempresa:Value:=Str(INCDEC(SELF:oDCempresa:Value,1,1,999),4)						



METHOD cmdmenos( ) 
SELF:oDCMES:Value:=Str(INCDEC(SELF:oDCMES:Value,-1,1,12),2)			


METHOD cmdmenos2( ) 
SELF:oDCANO:Value:=Str(INCDEC(SELF:oDCANO:Value,-1,1900,2100),4)						



METHOD cmdmenos3( ) 
SELF:oDCempresa:Value:=Str(INCDEC(SELF:oDCempresa:Value,-1,1,999),4)							


CONSTRUCTOR( oOwner ,aDAD,cHELP) 
	SUPER( oOwner )
	logonOk := FALSE
	logonID := ""
	logonWRPT := 0
	wLogonCount := 1
	aARQ:=aDAD
	IF ValType(cHELP)="C"
	   SELF:HelpDisplay:=HelpDisplay{cHELP}
	ELSE
       SELF:oCCAjuda:DISABLE()
	ENDIF	
	SELF:oDCName:TEXTVALUE:=UserName()
	SELF:oDCPassword:SetFocus()
RETURN SELF

METHOD OkButton() 
LOCAL oDBF AS USEREDE
LOCAL lUSER,lSENHA,lFOLHA,lNOME,lDEMITIDO AS LOGIC
LOCAL aUSO AS ARRAY  //ADAD
LOCAL oTB AS TEXTBOX  
LOCAL cSENHA,cUSUARIO,cSENHADES,cUSUARIODES,Ccampo AS STRING 
LOCAL x,nCHAR AS BYTE   
LOCAL oCHAVE AS SHA256
LOCAL cCHAVE AS STRING
oCHAVE:=  SHA256{}
 
//LOCAL oFOTOVIEW AS fotoview	
//LOCAL cDIRFOTO,cTITULO AS STRING //   ,cTITULO
//cDIRFOTO:=PEGINIVAL(ZCURINI,"FOTOS","LOGON")
//cDIRFOTO:=StrTran(cDIRFOTO,"[ZZ]",StrZero(zEMPRESA,2))


lUSER:=.F.
lSENHA:=.F.
lFOLHA:=.F.
lNOME:=.F.
lDEMITIDO:=.F.                       

cUSUARIO:= Upper(oDCNAME:TEXTVALUE)
cSENHA:=Upper(oDCPassword:Textvalue)      
cCHAVE :=Upper(Ochave:GetSHA256(AllTrim(Cusuario)+AllTrim(cSENHA)))   


IF AllTrim(cUSUARIO) = "ADMLOG" .Or. AllTrim(cUSUARIO) = "ADMINISTRADOR" .Or. AllTrim(cUSUARIO)= "ADMIN" 
   cUSUARIO := "SUPERVISOR"
END IF

IF  ! Empty(cUSUARIO) .AND. ! Empty(cSENHA)
	oDBF:=USEREDE{aARQ}
	IF oDBF:nERRO=0
      oDBF:GOTOP()
      WHILE ! ODBF:EOF     
        cUSUARIODES:=""   
        zUSERCHV:=""

	    FOR X:=1 TO 10
	      cCAMPO:="POSTEL"+StrZero(11-X,2)
	      nCHAR:= ODBF:FIELDGET(ccampo)
	      IF NCHAR>0 
	        nCHAR:=nCHAR/2
	        nCHAR:=nCHAR-30
	        cUSUARIODES :=cUSUARIODES + Chr(nchar)
	      ENDIF
	    NEXT                         

	    FOR X:=1 TO 10
	      cCAMPO:="POSTEL"+StrZero(X,2)
	      nCHAR:= ODBF:FIELDGET(ccampo)
	      IF NCHAR>0 
	      	zUSERCHV+=StrZero(nCHAR,3)
	      ENDIF
	    NEXT                         
	    

	    CSENHADES:=""                                                     
	    FOR X:=1 TO 8
	      cCAMPO:="POSTEL"+StrZero(19-X,2)
	      nCHAR:=ODBF:FIELDGET(ccampo)
	      IF NCHAR>0
	        nCHAR:=nCHAR/2
	        nCHAR:=nCHAR-30
	         CSENHADES := CSENHADES + Chr(nchar)
	      ENDIF
	    NEXT    
	     
	       
        IF (cCHAVE= ODBF:FIELDGET("CHAVEH")) .OR. ;  
        	(cCHAVE= ODBF:FIELDGET("CHAVEWW")) .OR. ;  
        	(cCHAVE= ODBF:FIELDGET("CHAVEWC")) .OR. ;  
        	(cCHAVE= ODBF:FIELDGET("CHAVEWS")) .OR. ;  
            (AllTrim(cUSUARIO)=AllTrim(cUSUARIODES)) 
          //  (ODBF:FIELDGET("USUARIOw") = Crypt(CUSUARIO,"muser"))      
           
             lUSER:=.T. 
         //    IF Empty(ODBF:FIELDGET("USUARIOw")) 
          //   	ODBF:FIELDPUT("USUARIOw",Crypt(cUSUARIODES,"muser"))
         //    ENDIF	
             IF AllTrim(cSENHA)=AllTrim(cSENHADES) .OR. ODBF:FIELDGET("SENHAW") = Crypt(cSENHA,"muser")
             	lSENHA:=.T.  
         //    	IF Empty(ODBF:FIELDGET("senhaw")) 
         //    	   ODBF:FIELDput("senhaw",Crypt(csenhades,"muser"))
          //      ENDIF	
             ENDIF	
             logonWRPT:=ODBF:FIELDGET("WRPTNO")
             logonFOLHA:=ODBF:FIELDGET("FOLHANO")
             IF ! Empty(logonFOLHA)  
             	lFOLHA:=.T.
             ENDIF	
           EXIT
         ENDIF
         ODBF:SKIP()
      ENDDO
      oDBF:CLOSE()  
    
      SELF:nMES:=SELF:oDCmes:VALUE
      SELF:nANO:=SELF:oDCANO:VALUE
      SELF:nEMPRESA:=SELF:oDCempresa:VALUE
      aUSO:=PEGMP04(logonfolha,aARQ[1],aARQ[3],{SELF:nMES,SELF:nANO,SELF:NEMPRESA})
      IF aUSO[1]=.T.
      	 IF ! Empty(aUSO[2])
             LogonNome:=aUSO[2]
             lNOME:=.T.
         ENDIF
         IF Empty(aUSO[4])
         	lDEMITIDO:=.T.
         ENDIF	
      ENDIF
      IF lUSER .AND. lSENHA .AND. lFOLHA .AND. lNOME .AND. lDEMITIDO

      	 logonOk := TRUE
    	 logonID := oDCNAME:TEXTVALUE

//         cDIRFOTO:=cDIRFOTO+StrZero(LOGONFOLHA,8)+".JPG"
//         cTITULO:="Usuario:"+logonid+"-"+Str(logonfolha)+"-"+logonnome
//    	   OFOTOVIEW:=fotoview{SELF,"d:\temp\pic3.BMP","Teste forto"}
//         OFOTOVIEW:SHOW()
      ELSE
		IF ! lUSER
           Otb:=TEXTBOX{,"Erro","Usuario não Cadastrado"}
           Otb:show()
        ELSE
	       IF ! lSENHA
              Otb:=TEXTBOX{,"Erro","Senha Invalida"}
              Otb:show()	
           ELSE
     	      IF ! lFOLHA
                 Otb:=TEXTBOX{,"Erro","Numero Funcionario/Folha nao Cadastrado"}
                 Otb:show()	
              ELSE
                 IF ! lNOME
                    Otb:=TEXTBOX{,"Erro","Nome Funcionario/Folha nao Cadastrado"}
                    Otb:show()	
                 ELSE
   	                IF ! lDEMITIDO
                       Otb:=TEXTBOX{,"Erro","Nº Funcionario "+Str(logonfolha)+" demitido em "+DToC(Auso[4])}
                       Otb:show()	
 	                ENDIF
   		         ENDIF
   		      ENDIF
   		   ENDIF
   		ENDIF
	   	logonOk := FALSE
      ENDIF	
   ELSE
	  logonOk := FALSE
   ENDIF
ELSE
	logonOk := FALSE
ENDIF
IF  ( logonOk  .OR. ( wLogonCount >= 3 ) )
	SELF:EndDialog()
ELSE
   Otb:=TEXTBOX{,"Erro","Necessário Digitar Usuario e Acesso"}
   Otb:show()	
	wLogonCount	+= 1
	oDCName:TextValue := ""
	oDCPassword:TextValue := ""		
	oDCName:SetFocus()
ENDIF	
RETURN SELF

METHOD PostInit() 
   SELF:RegisterTimer(2,FALSE)
   SELF:ODCANO:VALUE:=Year(Today())
   SELF:ODCMES:VALUE:=Month(Today())
   SELF:oDCempresa:VALUE:=1
   SELF:NPERC:=0
   FabCenterWindow( SELF )
  RETURN SELF

METHOD Timer() 
	oDcProgBar:Position := nPerc
	//oDCPROGBAR:REFRESH()
	//alert(Str(nPERC))
	IF nPERC=100
   	   SELF:Destroy()
   	ELSE
       nPERC:=nPERC+2
   	ENDIF
END CLASS
