#region DEFINES
STATIC DEFINE J01_CERT := 102 
STATIC DEFINE J01_OK := 105 
STATIC DEFINE J01_RASTRO := 103 
STATIC DEFINE J01_SC_CERT := 100 
STATIC DEFINE J01_SC_RASTRO := 101 
STATIC DEFINE J01_THEFIXEDTEXT10 := 104 
#endregion

class J01 inherit DATADIALOG 

	protect oDCSC_CERT as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCCERT as SINGLELINEEDIT
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
// 	instance CERT 
// 	instance RASTRO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CERT() 
return self:FieldGet(#CERT)


assign CERT(uValue) 
self:FieldPut(#CERT, uValue)
return CERT := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"J01",_GetInst()},iCtlID)

oDCSC_CERT := FixedText{self,ResourceID{J01_SC_CERT,_GetInst()}}
oDCSC_CERT:HyperLabel := HyperLabel{#SC_CERT,"Certificado:",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{J01_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCCERT := SingleLineEdit{self,ResourceID{J01_CERT,_GetInst()}}
oDCCERT:HyperLabel := HyperLabel{#CERT,"Cert:",NULL_STRING,"Crm_CERT"}
oDCCERT:FocusSelect := FSEL_HOME
oDCCERT:FieldSpec := padrao_char_40{}

oDCRASTRO := SingleLineEdit{self,ResourceID{J01_RASTRO,_GetInst()}}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"Crm_RASTRO"}
oDCRASTRO:FocusSelect := FSEL_HOME
oDCRASTRO:FieldSpec := padraO_CHAR_12{}

oDCtheFixedText10 := FixedText{self,ResourceID{J01_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{J01_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}

self:Caption := "Certificado/Rastro"
self:HyperLabel := HyperLabel{#J01,"Certificado/Rastro",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD OK( ) 
LOCAL oSERVER,oCRMEST AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL cRASTRO AS STRING
LOCAL aRETU AS ARRAY
LOCAL nNRNOTA,nNRNOTB,nCRM AS DWORD
LOCAL cTIPO,cCODIGO AS STRING
nNRNOTA :=0
nNRNOTB :=0
nCRM     :=0

cRASTRO:=SELF:SERVER:FIELDGET("RASTRO")
aRETU:=CHECKRASTRO(cRASTRO)	
IF aRETU[1]
   cRASTRO:=aRETU[2]
   SELF:SERVER:FIELDPUT("RASTRO",cRASTRO)
ENDIF	
aDAD:={zCURINI,"CRM.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO=0
   oSERVER:GoTop()
   IF oSERVER:SEEK(SELF:SERVER:FIELDGET("CRM"))
   	  oSERVER:FIELDPUT("RASTRO",cRASTRO)
   	  oSERVER:FIELDPUT("CERT",AllTrim(SELF:SERVER:FIELDGET("CERT")))
   	  cTIPO:=OSERVER:FIELDGET("TIPOE")
      nCRM:=OSERVER:FIELDGET("CRM")
      nNRNOTA:=OSERVER:FIELDGET("NRNOTA")
      nNRNOTB:=OSERVER:FIELDGET("NRNOTB")
      cCODIGO:=OSERVER:FIELDGET("CBUSCA")
   ENDIF
   oSERVER:CLOSE()
   SELF:EndWINDOW()
ENDIF


IF cTIPO="M"
   aDAD:={zCURINI,"CRMEST.DBF",zCURDIR}
   oCRMEST:=USEREDE{aDAD}
   IF oCRMEST:nERRO=0
   	  oCRMEST:SetOrder(2)
   	  oCRMEST:GOTOP()
   	  OCRMEST:SEEK(Str(nNRNOTA,8)+cCODIGO)
   	  WHILE oCRMEST:FIELDGET("CRM")=nCRM .AND. ! oCRMEST:EoF
          oCRMEST:FIELDPUT("RASTRO",cRASTRO)
   	  	  oCRMEST:Skip()
  	  ENDDO
 	  oCRMEST:GOTOP()
  	  OCRMEST:SEEK(Str(nNRNOTB,8)+cCODIGO)
   	  WHILE oCRMEST:FIELDGET("CRM")=nCRM .AND. ! oCRMEST:EoF
          oCRMEST:FIELDPUT("RASTRO",cRASTRO)
   	  	  oCRMEST:SKIP()
  	  ENDDO
      oCRMEST:CLOSE()
   ENDIF	
ENDIF

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


access RASTRO() 
return self:FieldGet(#RASTRO)


assign RASTRO(uValue) 
self:FieldPut(#RASTRO, uValue)
return RASTRO := uValue


END CLASS
