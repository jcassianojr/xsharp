CLASS insshell INHERIT StandardShellWindow

METHOD IMGME04(oOWNER) 
LOCAL cARQ AS STRING  
LOCAL nFout AS PTR
IF ! entramenu("INS",11)
	RETU SELF
ENDIF		
cARQ:=PEGINIVAL(ZCURINI,"PATH","IMGJPG")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("IMGJPG"),String2Psz("{IMGME04}"),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 
		

METHOD IMGME06(oOWNER) 
LOCAL cARQ AS STRING  
LOCAL nFout AS PTR
IF ! entramenu("INS",12)
	RETU SELF
ENDIF		
cARQ:=PEGINIVAL(ZCURINI,"PATH","IMGJPG")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("IMGJPG"),String2Psz("{IMGME06}"),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 

METHOD  IMPProteusMe04 
    LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cSQL,cCODIGO AS STRING
    LOCAL aDAD,aRETU AS ARRAY
    LOCAL oSERVER AS USEREDE
    LOCAL oPROGWIN AS PROGWIN
    LOCAL nLASTREC,nPOS AS DWORD
    LOCAL nPERC AS INT
    LOCAL dDATA,dDAT1 AS DATE

IF ! entramenu("INS",7)
	RETU SELF
ENDIF	



   aDAD:={zCURINI,"ME04.DBF",zCURDIR}
   oSERVER:=USEREDE{aDAD}
   IF oSERVER:nERRO#0
      RETU SELF
   ENDIF

   oProgWin := ProgWin{}
   oProgWin:Caption:="Sincronizando dados"
   oProgWin:SHOW()

   oConn := SQLConnection{}
   IF ! oConn:connect("protheus","","")
  	  alert("Erro na Conecção")
   	  RETURN .f.
   ENDIF	

   CSQL:=" SELECT * FROM qm2010 "


   nLASTREC:=100
   nPOS:=1

   oreg:= SQLSelect{cSQL,oconn}
   WHILE ! OREG:EoF	
      	 nPerc := INT(100* nPOS/ nLASTREC)
         nPOS++
         IF nPOS>100
         	nPOS:=1
         ENDIF
         oProgWin:oDcProgBar:Position := nPerc
         cCODIGO := AllTrim(FIXSTR(oREG:FIELDGET("qm2_instr")))
         oProgWin:oDCMessage:textValue:=cCODIGO

         oSERVER:GOTOP()
         IF .not. oSERVER:SEEK(cCODIGO)
            oSERVER:APPEND()
            oSERVER:FIELDPUT("CODIGO",cCODIGO)
         ENDIF
         IF Empty(oSERVER:FIELDGET("NOMTIPO"))
            oSERVER:FIELDPUT("NOMTIPO",FIXSTR(oREG:FIELDGET("qm2_descr")))
         ENDIF	


         IF Empty(oSERVER:FIELDGET("MARCA"))
            oSERVER:FIELDPUT("MARCA",FIXSTR(oREG:FIELDGET("qm2_fabr")))
         ENDIF	


         IF Empty(oSERVER:FIELDGET("CODTIPO"))
            oSERVER:FIELDPUT("CODTIPO",oREG:FIELDGET("qm2_tipo"))
         ENDIF	

         dDATA:=FIXDATA(oREG:FIELDGET("qm2_usoini"))
         IF Empty(oSERVER:FIELDGET("DATAUSO"))
            oSERVER:FIELDPUT("DATAUSO",dDATA)
         ENDIF	

         IF Empty(oSERVER:FIELDGET("CALIBRAR"))
            oSERVER:FIELDPUT("CALIBRAR",INT(oREG:FIELDGET("qm2_freqaf")/30))
         ENDIF	

        IF Empty(oSERVER:FIELDGET("APLIC"))
            oSERVER:FIELDPUT("APLIC",oREG:FIELDGET("qm2_local"))
        ENDIF	

         dDATA:=FIXDATA(oREG:FIELDGET("qm2_valdaf"))
         dDAT1:=oSERVER:FIELDGET("CALPRO")
         IF oSERVER:FIELDGET("DATAEXT")>dDAT1
            dDAT1:=oSERVER:FIELDGET("DATAEXT")
         ENDIF	
         IF dDATA>dDAT1
         	oSERVER:FIELDPUT("DATAEXT",dDAT1)
         ENDIF	
   	   Oreg:skip()
   ENDDO	
   Oreg:close()
   Oconn:Disconnect()

   nLASTREC:=oSERVER:RecCount
   nPOS:=1
   oSERVER:GOTOP()
   WHILE ! oSERVER:EoF
   	  	nPerc := INT(100* nPOS/ nLASTREC)
        nPOS++
        oProgWin:oDcProgBar:Position := nPerc
        cCODIGO := oSERVER:FIELDGET("CODIGO")
        oProgWin:oDCMessage:textValue:=cCODIGO
   	    IF Empty(oSERVER:FIELDGET("TIPO")) .AND. ! Empty(oSERVER:FIELDGET("CODTIPO"))
   	       aRETU:=PEGMD02(AllTrim(oSERVER:FIELDGET("CODTIPO")),"TIPINS",30)
   	       IF aRETU[1]
     	      oSERVER:FIELDPUT("TIPO",aRETU[2])	
     	   ENDIF
   	    ENDIF
   	    oSERVER:Skip()
   ENDDO

   Oserver:CLOSE()
   OPROGWIN:EndDialog()
   alert("Concluido")


CONSTRUCTOR( oOwnerApp ) 
//	LOCAL oSB AS StatusBar
	LOCAL oSBIUSER AS StatusBarItem
        LOCAL oSBIDATE AS StatusBarItem	
        LOCAL cDATE AS STRING
	
	SUPER: INIT( oOwnerApp )
	
	aChildWindows := {}

        oSBIDate := StatusBarItem{}
	oSBIDate:Style := SBITEMSUNKEN
	cDate := Ddia(Today()) //+ //FullDate(Today())
	oSBIDate:Width := 8* Len(cDate)
	oSBIDate:NameSym := #SBDateItem
	
	oSBIUser := StatusBarItem{}
	oSBIUser:Style := SBITEMRAISED
	oSBIUser:Width := 8*(25) //8 N + "-" + Cognome(15) Len("ADMIN")
	oSBIUser:NameSym := #SBUser
	

	//oSB := SELF:EnableStatusBar()
	SELF:StatusBar:DisplayKeyboard() //
	SELF:StatusBar:DisplayTime()         //
        SELF:StatusBar:Additem (oSBIDATE)
        SELF:StatusBar:Additem (oSBIUser)
	SELF:statusBar:SetText (cDate, #SBDateItem)
	
//	SELF:statusBar:SetText (Str(ZFOLHA,8)+"-"+ZUSER, #SBUser)
// mudado startup para refresh var




	SELF:Menu := EmptyShellMenu{ SELF }

	SELF:Icon := Icon{ResourceID{IDI_STANDARDICON}}
	
	RETURN SELF



METHOD sayCOM() 
  LOCAL oJCOM AS JCOM
  oJCOM:=jCOM{SELF}
  OjCOM:show()		
  SELF:Caption:="Módulo Metrologia - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		

METHOD XWRPTM4 
SELF:XWRPTGRP("M4","")


END CLASS
