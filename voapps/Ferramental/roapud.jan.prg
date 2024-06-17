#region DEFINES
STATIC DEFINE JROAPUD_CMDAPURAR := 105 
STATIC DEFINE JROAPUD_DATAFINAL := 110 
STATIC DEFINE JROAPUD_DATAINICIAL := 107 
STATIC DEFINE JROAPUD_DATAUSO := 109 
STATIC DEFINE JROAPUD_DIAFIM := 102 
STATIC DEFINE JROAPUD_DIAINI := 101 
STATIC DEFINE JROAPUD_FIXEDTEXT1 := 100 
STATIC DEFINE JROAPUD_RADIOBUTTON1 := 108 
STATIC DEFINE JROAPUD_SAIR := 104 
STATIC DEFINE JROAPUD_THEFIXEDTEXT9 := 103 
STATIC DEFINE JROAPUD_TXTDIZ := 106 
#endregion

class jroapud inherit DATAWINDOW 

	protect oDCFixedText1 as FIXEDTEXT
	protect oDCdiaini as DATESLE
	protect oDCdiafim as DATESLE
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCsair as PUSHBUTTON
	protect oCCCmdApurar as PUSHBUTTON
	protect oDCtxtdiz as FIXEDTEXT
	protect oCCDataInicial as RADIOBUTTON
	protect oCCRadioButton1 as RADIOBUTTON
	protect oDCDatauso as RADIOBUTTONGROUP
	protect oCCdatafinal as RADIOBUTTON
// 	instance diaini 
// 	instance diafim 
// 	instance Datauso 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD CmdApurar( ) 
LOCAL oSERVER,oME01,oFER AS USEREDE
LOCAL cTIPO AS STRING
LOCAL cCODIGO AS STRING
LOCAL dDATA,dINI,dFIM,dDATARO AS DATE
LOCAL aDAD AS ARRAY
LOCAL nDIAS
LOCAL nTOTDIA,nTOTOCO AS DWORD
LOCAL cCAMDATA AS STRING
LOCAL nDIAPAI AS DWORD
LOCAL nDIAAVO AS DWORD
cCAMDATA:="DATA"
IF SELF:oDCDatauso:value="I"
    cCAMDATA:="DATAINI"
ENDIF	
IF SELF:oDCDatauso:value="F"
    cCAMDATA:="DATAFIM"
ENDIF	
aDAD:={zCURINI,"RO.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF	

dINI:=SELF:SERVER:FIELDGET("DIAINI")
dFIM:=SELF:SERVER:FIELDGET("DIAFIM")

aDAD:={zCURINI,"ME01.DBF",zCURDIR}
oME01:=USEREDE{aDAD}
IF oME01:nERRO#0
   oSERVER:CLOSE()
   RETU SELF
ENDIF

aDAD:={zCURINI,"FERRAM.DBF",zCURDIR}
oFER:=USEREDE{aDAD}
IF oFER:nERRO#0
	oSERVER:CLOSE()
	oME01:CLOSE()
    RETU SELF
ENDIF
SELF:POINTER:=POINTER{POINTERHOURGLASS}
oME01:GOTOP()
WHILE ! oME01:EoF
	oME01:FIELDPUT("MEDIARO",0)
	oME01:SKIP()
ENDDO	

oFER:GOTOP()
WHILE ! OFER:EoF
	OFER:FIELDPUT("MEDIARO",0)
	OFER:SKIP()
ENDDO	

oSERVER:SetOrder(3)
IF SELF:oDCDatauso:value="I"
   oSERVER:SetOrder(4)	
ENDIF	
AltD()
IF SELF:oDCDatauso:value="F"
   oSERVER:SetOrder(5)	
ENDIF	

oSERVER:GOTOP()
WHILE ! oSERVER:EoF
	WHILE Empty(oSERVER:FIELDGET("FERRAM"))  .AND. ! oSERVER:EoF
		oSERVER:SKIP()
	ENDDO	
    AltD()
	cCODIGO:=oSERVER:FIELDGET("FERRAM")
	cTIPO:=oSERVER:FIELDGET("TIPO")
	dDATA:=CToD(Space(8))
	nTOTOCO:=0
	nTOTDIA:=0
	nDIAPAI:=0
	nDIAAVO:=0
	WHILE cCODIGO=oSERVER:FIELDGET("FERRAM") .AND. cTIPO=oSERVER:FIELDGET("TIPO") .AND. ! oSERVER:EoF
		SELF:oDCtxtdiz:Caption:=cCODIGO
		IF oSERVER:FIELDGET("TIPORO")="C"
		  dDATARO:=oserver:FIELDGET(ccamDATA)		
		  IF Empty(dDATARO)
    		 IF .NOT.MDG("RO com data em branco "+Str(oSERVER:FIELDGET("RO"))+" Continuar")
    		 	oSERVER:close()
    		 	oFER:CLOSE()
    		 	oME01:CLOSE()
    		 	RETUrn .f.
    		 ENDIF
    	  ENDIF	
           IF dDATARO>=dINI .AND. dDATARO<=dFIM			
	  	      IF ! Empty(dDATA)
  		       	  nDIAS := dDATARO-dDATA
  		       	  IF nDIAS<0
  		       	  	 alert("RO com data Menor que a Anterior "+Str(oSERVER:FIELDGET("RO")))
  		       	  ELSE	
  		       	  	  oSERVER:FIELDPUT("DIASANT",nDIAS)
  		       	  	  oSERVER:FIELDPUT("DIASPAI",nDIAPAI)
  		       	  	  oSERVER:FIELDPUT("DIASAVO",nDIAAVO)
	  	       	      nTOTDIA:=nTOTDIA+nDIAS
	  	       	      nDIAAVO:=nDIAPAI
	  	       	      nDIAPAI:=nDIAS	
  		       	  ENDIF
  		       ELSE
                  nDIAPAI:=oSERVER:FIELDGET("DIASANT")	
  		       ENDIF
	 	   	   dDATA:=oSERVER:FIELDGET(ccamDATA)	//Armazena a data antiga para o calculo			
	 	   	   nTOTOCO:=nTOTOCO+1
	 	   ENDIF	
		ENDIF		
	    oSERVER:SKIP()
	ENDDO
    IF nTOTOCO>1   //No minimo duas ocorrencias
       IF cTIPO="M"
       	  oME01:GOTOP()
       	  IF oME01:SEEK(cCODIGO)
       	  	 oME01:FIELDPUT("MEDIARO",INT(nTOTDIA/(nTOTOCO-1)))
       	  ENDIF
       ENDIF
       IF cTIPO="F"
       	  oFER:GOTOP()
       	  IF oFER:SEEK(cCODIGO)
       	  	 oFER:FIELDPUT("MEDIARO",INT(nTOTDIA/(nTOTOCO-1)))
       	  ENDIF
       ENDIF
    ENDIF
ENDDO
oSERVER:CLOSE()	
oME01:CLOSE()
oFER:CLOSE()
SELF:POINTER:=POINTER{}
alert("Concluido")




access Datauso() 
return self:FieldGet(#Datauso)


assign Datauso(uValue) 
self:FieldPut(#Datauso, uValue)
return Datauso := uValue


access diafim() 
return self:FieldGet(#diafim)


assign diafim(uValue) 
self:FieldPut(#diafim, uValue)
return diafim := uValue


access diaini() 
return self:FieldGet(#diaini)


assign diaini(uValue) 
self:FieldPut(#diaini, uValue)
return diaini := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jroapud",_GetInst()},iCtlID)

oDCFixedText1 := FixedText{self,ResourceID{JROAPUD_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Periodo",NULL_STRING,NULL_STRING}

oDCdiaini := DateSle{self,ResourceID{JROAPUD_DIAINI,_GetInst()}}
oDCdiaini:FieldSpec := date_field{}
oDCdiaini:HyperLabel := HyperLabel{#diaini,NULL_STRING,NULL_STRING,NULL_STRING}

oDCdiafim := DateSle{self,ResourceID{JROAPUD_DIAFIM,_GetInst()}}
oDCdiafim:FieldSpec := DATE_FIELD{}
oDCdiafim:HyperLabel := HyperLabel{#diafim,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{JROAPUD_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCsair := PushButton{self,ResourceID{JROAPUD_SAIR,_GetInst()}}
oCCsair:HyperLabel := HyperLabel{#sair,NULL_STRING,NULL_STRING,NULL_STRING}
oCCsair:Image := ICO_SAIR{}

oCCCmdApurar := PushButton{self,ResourceID{JROAPUD_CMDAPURAR,_GetInst()}}
oCCCmdApurar:HyperLabel := HyperLabel{#CmdApurar,"Apurar",NULL_STRING,NULL_STRING}

oDCtxtdiz := FixedText{self,ResourceID{JROAPUD_TXTDIZ,_GetInst()}}
oDCtxtdiz:HyperLabel := HyperLabel{#txtdiz,NULL_STRING,NULL_STRING,NULL_STRING}

oCCDataInicial := RadioButton{self,ResourceID{JROAPUD_DATAINICIAL,_GetInst()}}
oCCDataInicial:HyperLabel := HyperLabel{#DataInicial,"Data Inicial",NULL_STRING,NULL_STRING}

oCCRadioButton1 := RadioButton{self,ResourceID{JROAPUD_RADIOBUTTON1,_GetInst()}}
oCCRadioButton1:HyperLabel := HyperLabel{#RadioButton1,"Data",NULL_STRING,NULL_STRING}

oCCdatafinal := RadioButton{self,ResourceID{JROAPUD_DATAFINAL,_GetInst()}}
oCCdatafinal:HyperLabel := HyperLabel{#datafinal,"Data Final",NULL_STRING,NULL_STRING}

oDCDatauso := RadioButtonGroup{self,ResourceID{JROAPUD_DATAUSO,_GetInst()}}
oDCDatauso:FillUsing({ ;
						{oCCDataInicial,"I"}, ;
						{oCCRadioButton1,"D"}, ;
						{oCCdatafinal,"F"} ;
						})
oDCDatauso:HyperLabel := HyperLabel{#Datauso,"Usar",NULL_STRING,NULL_STRING}

self:Caption := "Apuracao Dias Entre Ocorrencias"
self:HyperLabel := HyperLabel{#jroapud,"Apuracao Dias Entre Ocorrencias",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	SELF:oDCDatauso:value:="D"
	 FabCenterWindow( SELF )
	RETURN NIL


METHOD sair( ) 
	SELF:endwindow()

END CLASS
