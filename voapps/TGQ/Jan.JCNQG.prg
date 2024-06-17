#region DEFINES
STATIC DEFINE JCNG_CANCELA := 105 
STATIC DEFINE JCNG_DFIM := 101 
STATIC DEFINE JCNG_DINI := 100 
STATIC DEFINE JCNG_OK := 103 
STATIC DEFINE JCNG_THEFIXEDTEXT10 := 102 
STATIC DEFINE JCNG_THEFIXEDTEXT9 := 104 
#endregion

class JCNG inherit DATADIALOG 

	protect oDCDini as DATETIMEPICKER
	protect oDCdfim as DATETIMEPICKER
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancela as PUSHBUTTON

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Cancela( ) 
	SELF:EndWINDOW()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCNG",_GetInst()},iCtlID)

oDCDini := DateTimePicker{self,ResourceID{JCNG_DINI,_GetInst()}}
oDCDini:HyperLabel := HyperLabel{#Dini,NULL_STRING,NULL_STRING,NULL_STRING}

oDCdfim := DateTimePicker{self,ResourceID{JCNG_DFIM,_GetInst()}}
oDCdfim:HyperLabel := HyperLabel{#dfim,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{self,ResourceID{JCNG_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JCNG_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ICO_OK{}

oDCtheFixedText9 := FixedText{self,ResourceID{JCNG_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancela := PushButton{self,ResourceID{JCNG_CANCELA,_GetInst()}}
oCCCancela:HyperLabel := HyperLabel{#Cancela,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancela:Image := ICO_SAIR{}

self:Caption := "Checar RNC-RAT"
self:HyperLabel := HyperLabel{#JCNG,"Checar RNC-RAT",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD Ok( ) 
LOCAL oRAT,oRATI,oRNC,oACPNC AS USEREDE
LOCAL aDAD,aUSO AS ARRAY
LOCAL dINI,dFIM AS DATE
LOCAL nRAT,nACPNC,Y AS DWORD
LOCAL X

DINI:=CToD(SELF:oDCDINI:TextValue)
DFIM:=CToD(SELF:oDCDFIM:TextValue)		
aDAD:={zCURINI,"RAT.DBF",ZCURDIR}
oRAT:=USEREDE{aDAD}
IF oRAT:nERRO#0
    RETU SELF
ENDIF
aDAD:={zCURINI,"RATI.DBF",ZCURDIR}
oRATI:=USEREDE{aDAD}
IF oRATI:nERRO#0
    oRAT:CLOSE()
    RETU SELF
ENDIF
aDAD:={zCURINI,"RNC.DBF",ZCURDIR}
oRNC:=USEREDE{aDAD}
IF oRNC:nERRO#0
	oRAT:CLOSE()
	oRATI:CLOSE()
    RETU SELF
ENDIF
aDAD:={zCURINI,"ACPNC.DBF",ZCURDIR}
oACPNC:=USEREDE{aDAD}
IF oACPNC:nERRO#0
	oRNC:CLOSE()
	oRAT:CLOSE()
	oRATI:CLOSE()
    RETU SELF
ENDIF

SELF:POINTER:=POINTER{POINTERHOURGLASS}
oRAT:SetOrder(2)
oRNC:SETORDER(2)
FOR X:=dINI TO dFIM
	oRAT:GOTOP()
	oRAT:SEEK(X)
	WHILE oRAT:FIELDGET("DATA")=X .AND. ! oRAT:EoF
        nRAT:=oRAT:FIELDGET("RAT")
    	oRATI:GOTOP()
    	oRATI:SEEK(nRAT)
		WHILE nRAT=oRATI:FIELDGET("RAT") .AND. ! oRATI:EoF
   		      oACPNC:GOTOP()
		      oACPNC:SETORDER(4)
		      IF ! oACPNC:SEEK(Str(nRAT,8)+oRATI:FIELDGET("CODIGO"))
		         oACPNC:SETORDER(1)		
		  	     oACPNC:Gobottom()
   		  	     nACPNC:=oACPNC:FIELDGET("ACPNC")
  		  	     nACPNC++
   		  	     oACPNC:APPEND()
                 oACPNC:FIELDPUT("ACPNC",nACPNC)
                 oACPNC:FIELDPUT("DATA",oRAT:FIELDGET("DATA"))
                 oACPNC:FIELDPUT("CLIENTE",oRAT:FIELDGET("CLIENTE"))
                 oACPNC:FIELDPUT("CLINOME",oRAT:FIELDGET("CLINOME"))
                 oACPNC:FIELDPUT("produto",oRATI:FIELDGET("CODIGO"))
                 oACPNC:FIELDPUT("SAC",oRATI:FIELDGET("SAC"))
                 aUSO:=PEGMS01(oRATI:FIELDGET("CODIGO"))
                 IF aUSO[1]=.T. .AND. ! Empty(aUSO[2])
                    oACPNC:FIELDPUT("DESPRO",aUSO[2])
                 ENDIF
                 oACPNC:FIELDPUT("RAT",nRAT)
                 FOR Y:=1 TO 7
              	     oACPNC:FIELDPUT("QTI"+StrZero(Y,2),0)
            	     oACPNC:FIELDPUT("VLI"+StrZero(Y,2),0)	
                 NEXT
                 FOR Y:=1 TO 11
                     oACPNC:FIELDPUT("QTE"+StrZero(Y,2),0)
            	     oACPNC:FIELDPUT("VLE"+StrZero(Y,2),0)		
                NEXT Y	
             ELSE
             	IF Empty(oACPNC:FIELDGET("SAC"))
      	           oACPNC:FIELDPUT("SAC",oRATI:FIELDGET("SAC"))
      	        ENDIF
             ENDIF
             oRATI:SKIP()
		ENDDO	
		oRAT:SKIP()
	ENDDO	
	oRNC:GOTOP()
	oRNC:SEEK(X)
	WHILE oRNC:FIELDGET("DATA")=X .AND. ! oRNC:EoF		
		  oACPNC:GOTOP()
		  oACPNC:SETORDER(3)
		  IF ! oACPNC:SEEK(oRNC:FIELDGET("RNC"))
	         oACPNC:SETORDER(1)		
	  	     oACPNC:Gobottom()
		  	 nACPNC:=oACPNC:FIELDGET("ACPNC")
		  	 nACPNC++
		  	 oACPNC:APPEND()
             oACPNC:FIELDPUT("ACPNC",nACPNC)
             oACPNC:FIELDPUT("DATA",oRNC:FIELDGET("DATA"))
             oACPNC:FIELDPUT("CLIENTE",oRNC:FIELDGET("CLIFOR"))
             oACPNC:FIELDPUT("CLINOME",oRNC:FIELDGET("NOME"))
             oACPNC:FIELDPUT("produto",oRNC:FIELDGET("CODIGO"))
             oACPNC:FIELDPUT("DESPRO",oRNC:FIELDGET("DESCRI"))
             oACPNC:FIELDPUT("RNC",oRNC:FIELDGET("RNC"))
             oACPNC:FIELDPUT("SAC",oRNC:FIELDGET("NSAC"))
             FOR Y:=1 TO 6
              	oACPNC:FIELDPUT("QTI"+StrZero(Y,2),0)
            	oACPNC:FIELDPUT("VLI"+StrZero(Y,2),0)	
             NEXT Y
             FOR Y:=1 TO 11
                oACPNC:FIELDPUT("QTE"+StrZero(Y,2),0)
            	oACPNC:FIELDPUT("VLE"+StrZero(Y,2),0)		
             NEXT Y	
          ENDIF
		  oRNC:SKIP()
	ENDDO	
NEXT X
oRAT:CLOSE()
oRATI:CLOSE()
oRNC:CLOSE()	
SELF:POINTER:=POINTER{}
SELF:EndWindow()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	   FabCenterWindow( SELF )
	RETURN NIL


END CLASS
