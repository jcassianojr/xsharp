#region DEFINES
STATIC DEFINE JBXNAO_AOCODIGO := 106 
STATIC DEFINE JBXNAO_CMDIMP := 103 
STATIC DEFINE JBXNAO_CMDSAIDA := 101 
STATIC DEFINE JBXNAO_DOCODIGO := 104 
STATIC DEFINE JBXNAO_FIXEDTEXT3 := 100 
STATIC DEFINE JBXNAO_FIXEDTEXT4 := 102 
STATIC DEFINE JBXNAO_FIXEDTEXT5 := 105 
STATIC DEFINE JBXNAO_FIXEDTEXT6 := 107 
#endregion

CLASS JBXNAO INHERIT DATAWINDOW 

	PROTECT oDCFixedText3 AS FIXEDTEXT
	PROTECT oCCcmdSaida AS PUSHBUTTON
	PROTECT oDCFixedText4 AS FIXEDTEXT
	PROTECT oCCcmdimp AS PUSHBUTTON
	PROTECT oDCDoCodigo AS SINGLELINEEDIT
	PROTECT oDCFixedText5 AS FIXEDTEXT
	PROTECT oDCAoCodigo AS SINGLELINEEDIT
	PROTECT oDCFixedText6 AS FIXEDTEXT
// 	instance DoCodigo 
// 	instance AoCodigo 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

ACCESS AoCodigo() 
RETURN SELF:FieldGet(#AoCodigo)


ASSIGN AoCodigo(uValue) 
SELF:FieldPut(#AoCodigo, uValue)
RETURN AoCodigo := uValue


METHOD cmdSaida( ) 
	SELF:EndWindow()

ACCESS DoCodigo() 
RETURN SELF:FieldGet(#DoCodigo)


ASSIGN DoCodigo(uValue) 
SELF:FieldPut(#DoCodigo, uValue)
RETURN DoCodigo := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JBXNAO",_GetInst()},iCtlID)

oDCFixedText3 := FixedText{SELF,ResourceID{JBXNAO_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Retornar",NULL_STRING,NULL_STRING}

oCCcmdSaida := PushButton{SELF,ResourceID{JBXNAO_CMDSAIDA,_GetInst()}}
oCCcmdSaida:HyperLabel := HyperLabel{#cmdSaida,NULL_STRING,NULL_STRING,NULL_STRING}
oCCcmdSaida:Image := ICO_SAIR{}

oDCFixedText4 := FixedText{SELF,ResourceID{JBXNAO_FIXEDTEXT4,_GetInst()}}
oDCFixedText4:HyperLabel := HyperLabel{#FixedText4,"Baixar",NULL_STRING,NULL_STRING}

oCCcmdimp := PushButton{SELF,ResourceID{JBXNAO_CMDIMP,_GetInst()}}
oCCcmdimp:HyperLabel := HyperLabel{#cmdimp,NULL_STRING,NULL_STRING,NULL_STRING}
oCCcmdimp:Image := ICO_OK{}

oDCDoCodigo := SingleLineEdit{SELF,ResourceID{JBXNAO_DOCODIGO,_GetInst()}}
oDCDoCodigo:HyperLabel := HyperLabel{#DoCodigo,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText5 := FixedText{SELF,ResourceID{JBXNAO_FIXEDTEXT5,_GetInst()}}
oDCFixedText5:HyperLabel := HyperLabel{#FixedText5,"Do C�digo",NULL_STRING,NULL_STRING}

oDCAoCodigo := SingleLineEdit{SELF,ResourceID{JBXNAO_AOCODIGO,_GetInst()}}
oDCAoCodigo:HyperLabel := HyperLabel{#AoCodigo,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText6 := FixedText{SELF,ResourceID{JBXNAO_FIXEDTEXT6,_GetInst()}}
oDCFixedText6:HyperLabel := HyperLabel{#FixedText6,"Ao C�digo",NULL_STRING,NULL_STRING}

SELF:Caption := "Baixar N�o Ativos"
SELF:HyperLabel := HyperLabel{#JBXNAO,"Baixar N�o Ativos",NULL_STRING,NULL_STRING}

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		    FabCenterWindow( SELF )
	RETURN NIL


END CLASS
PARTIAL CLASS xJBXNAO
METHOD cmdimp( ) 
LOCAL doCODIGO,AoCODIGO AS STRING
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF ! IsNil(SELF:doCODIGO)
   doCODIGO:=SELF:doCODIGO
ELSE
   DOCODIGO:=""
ENDIF
IF ! IsNil(SELF:AOCODIGO)
   aoCODIGO:=SELF:aoCODIGO
ELSE
   AOCODIGO:=""	
ENDIF
doCODIGO:=AllTrim(doCODIGO)	
aoCODIGO:=AllTrim(aoCODIGO)	
aDAD:={zCURINI,"MS01.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SELF:POINTER:=POINTER{POINTERHOURGLASS}
oSERVER:GOTOP()
WHILE ! oSERVER:EOF
	IF oSERVER:FIELDGET("ATIVO")="N"
       IF oSERVER:FIELDGET("CODIGO")>=DOcodigo .and. oSERVER:FIELDGET("CODIGO")<=aocodigo	
          RDTBAIXA(oSERVER:FIELDGET("CODIGO"),0,0,"RDT.DBF","RDTBX.DBF")		
       ENDIF
	ENDIF	
   oSERVER:SKIP()	
ENDDO	
oSERVER:CLOSE()	
SELF:POINTER:=POINTER{POINTERARROW}

END CLASS
PARTIAL CLASS xJBXOBS
METHOD cmdimp( ) 
LOCAL doCODIGO,AoCODIGO,cCODIGO AS STRING
LOCAL oMS06,oSERVER,oBAIXA AS USEREDE
LOCAL aDAD,aDADOS AS ARRAY
LOCAL nFIELD,J AS DWORD
LOCAL nSEQ,nSSQ AS DWORD
LOCAL LFALTA,lGRUPO AS LOGIC


IF ! IsNil(SELF:doCODIGO)
   doCODIGO:=SELF:doCODIGO
ELSE
   DOCODIGO:=""
ENDIF
IF ! IsNil(SELF:AOCODIGO)
   aoCODIGO:=SELF:aoCODIGO
ELSE
   AOCODIGO:=""	
ENDIF
doCODIGO:=AllTrim(doCODIGO)	
aoCODIGO:=AllTrim(aoCODIGO)	
aDAD:={zCURINI,"MS06.DBF",zCURDIR}
oMS06:=USEREDE{aDAD}
IF oMS06:nERRO#0
    RETU SELF
ENDIF

aDAD:={zCURINI,"RDT.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   oMS06:CLOSE()
    RETURN .f.
ENDIF
aDAD:={zCURINI,"RDTBX.DBF",zCURDIR}
oBAIXA:=USEREDE{aDAD}
IF oBAIXA:nERRO#0
   oMS06:CLOSE()	
   oSERVER:CLOSE()
   RETURN .f.
ENDIF
nFIELD:=oBAIXA:FCOUNT

SELF:POINTER:=POINTER{POINTERHOURGLASS}
oSERVER:GOTOP()
WHILE ! oSERVEr:EoF
   lFALTA:=.F.
   nSEQ:=OSERVER:FIELDGET("SEQ")
   nSSQ:=OSERVER:FIELDGET("SSQ")
   cCODIGO:=AllTrim(OSERVER:FIELDGET("CODIGO"))
   lGRUPO:=cCODIGO>=DOcodigo .and. cCODIGO<=aocodigo	
   IF lGRUPO
      oMS06:GOTOP()
      IF ! oMS06:SEEK(PadR(cCODIGO,24)+Str(nSEQ,3)+Str(nSSQ,3))
   	    lFALTA:=.T.
      ENDIF	
   ENDIF
   WHILE AllTrim(oSERVER:FIELDGET("CODIGO"))=cCODIGO .AND. oSERVER:FIELDGET("SEQ")=nSEQ .AND. oSERVER:FIELDGET("SSQ")=nSSQ .AND. ! oSERVER:EoF
	   IF lFALTA .AND. lGRUPO
   		  aDADOS:={}
	      FOR J:=1 TO nFIELD
    	      AAdd(aDADOS,oSERVER:FIELDGET(J))
	      NEXT J
    	  oBAIXA:Append()
	      FOR J:=1 TO nFIELD
    	      oBAIXA:FIELDPUT(J,aDADOS[J])
	      NEXT J
    	  oBAIXA:FIELDPUT("DATABAI",Today())
	     oSERVER:DELETE()
	   ENDIF
	   oSERVER:SKIP()
   ENDDO
ENDDO	
oSERVER:PACK()
oSERVER:CLOSE()
oBAIXA:CLOSE()
oMS06:CLOSE()
SELF:POINTER:=POINTER{POINTERARROW}
SELF:EndWindow()


END CLASS
