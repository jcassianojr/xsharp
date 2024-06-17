CLASS proshell INHERIT StandardShellWindow

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

	SELF:Menu := EmptyShellMenu{ SELF }

	SELF:Icon := Icon{ResourceID{IDI_STANDARDICON}}
	
	RETURN SELF



METHOD sayCOM() 
  LOCAL oJCOM AS JCOM
  oJCOM:=jCOM{SELF}
  OjCOM:show()		
  SELF:Caption:="Módulo Producao - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		

METHOD XANUAL() 
LOCAL oRD,oRDPT,oRDP AS USEREDE
LOCAL aDAD AS ARRAY	
LOCAL nMES,X,Y,Z AS BYTE
LOCAL nSEQ AS WORD
LOCAL nTOTAL AS FLOAT
LOCAL cVAR,cNUMERO,cNOME AS STRING
SELF:POINTER:=POINTER{POINTERHOURGLASS}

aDAD:={zCURINI,"RDPT.DBF",zCURDIR}
oRDPT:=USEREDE{aDAD,.F.}
IF oRDPT:nERRO#0
   RETU SELF
ENDIF	
oRDPT:Zap()
oRDPT:Pack()
oRDPT:CLOSE()


aDAD:={zCURINI,"RD.DBF",zCURDIR}
oRD:=USEREDE{aDAD}
IF oRD:nERRO#0
   RETU SELF
ENDIF

aDAD:={zCURINI,"RDPT.DBF",zCURDIR}
oRDPT:=USEREDE{aDAD,.F.}
IF oRDPT:nERRO#0
   oRD:CLOSE()
   RETU SELF
ENDIF

aDAD:={zCURINI,"RDP.DBF",zCURDIR}
oRDP:=USEREDE{aDAD}
IF oRDP:nERRO#0
   oRD:CLOSE()
   oRDPT:CLOSE()
   RETU SELF
ENDIF


oRD:GOTOP()
WHILE ! oRD:EOF
   IF oRD:FIELDGET("ANUAL")="S"
   	  nSEQ:=ORD:FIELDGET("SEQ")
   	  nMES:=oRD:FIELDGET("MES")
   	  IF nMES>0 .AND. nMES<13
   	  	 oRDP:GOTOP()
   	  	 oRDP:SEEK(nSEQ)
   	  	 WHILE oRDP:FIELDGET("SEQ")=nSEQ .AND. ! oRDP:EOF
   	  	 	oRDP:FIELDPUT("ANUAL","S")
   	  	 	oRDP:FIELDPUT("MES",nMES)
   	  	 	cNUMERO:=ORDP:FIELDGET("NUMERO")
   	  	 	cNOME:=oRDP:FIELDGET("NOME")
	   	  	 	oRDPT:GOTOP()
   		  	 	IF ! oRDPT:SEEK(cNUMERO)
   	  		 	   oRDPT:APPEND()
            	   oRDPT:FIELDPUT("NUMERO",cNUMERO)	
	               oRDPT:FIELDPUT("NOME",cNOME)	
    	        ENDIF
        	    cVAR:="VAL"+StrZero(nMES,2)
	            oRDPT:FIELDPUT(cVAR,oRDP:FIELDGET("HP"))
   	  	 	oRDP:SKIP()
   	  	 ENDDO	
   	  ENDIF	
   ENDIF		
   oRD:SKIP()	
ENDDO	
oRD:CLOSE()
oRDP:CLOSE()

oRDPT:GOTOP()
WHILE ! oRDPT:EoF
	nTOTAL:=0
	FOR X:=1 TO 12
  	    cVAR:="VAL"+StrZero(X,2)
		nTOTAL+=oRDPT:FIELDGET(cVAR)
	NEXT X	
    oRDPT:FIELDPUT("TOTAL",nTOTAL)
	oRDPT:SKIP()
ENDDO	
FOR Y:=0 TO 12
	cVAR:="VAL"+StrZero(Y,2)
	oRDPT:SetOrder(cVar)
	oRDPT:GOTOP()
	X:=1
	Z:=1
	WHILE ! oRDPT:EoF
	   cVAR:="POS"+StrZero(Y,2)
       oRDPT:FIELDPUT(cVAR,X)		
	   X++
	   IF oRDPT:FIELDGET("NUMERO")<>"999"
    	  cVAR:="POX"+StrZero(Y,2)
          oRDPT:FIELDPUT(cVAR,Z)		
	      Z++	
	   ENDIF	
	   oRDPT:SKIP()
	ENDDO	
NEXT Y	


X:=1
oRDPT:SETORDER("TOTAL")
oRDPT:GOTOP()
WHILE ! Eof()	
   oRDPT:FIELDPUT("POSTOT",X)	
   oRDPT:SKIP()
   X++
ENDDO	
oRDPT:CLOSE()

SELF:POINTER:=POINTER{POINTERARROW}

METHOD XIMPIAC 	
SELF:XWRPTGRP("IAC","")	


METHOD XIMPPR 	
SELF:XWRPTGRP("PR","")	

METHOD XJRTCOD 
LOCAL oBUSCA AS XBUSCA
IF ! entramenu("PRO",6)
	RETU SELF
ENDIF	
oBUSCA:=XBUSCA{SELF,"Retornar Tempo Apurado","Digite O Código"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF ! oBUSCA:lOK
   RETURN .f.	
ENDIF
RDTBAIXA(oBUSCA:cBUSCA,0,0,"RDTBX.DBF","RDT.DBF")



METHOD XRDTCOD 
LOCAL oBUSCA AS XBUSCA
IF ! entramenu("PRO",6)
	RETU SELF
ENDIF	
oBUSCA:=XBUSCA{SELF,"Baixar Tempo Apurado","Digite O Código"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF ! oBUSCA:lOK
   RETURN .f.	
ENDIF
RDTBAIXA(oBUSCA:cBUSCA,0,0,"RDT.DBF","RDTBX.DBF")

METHOD XSUBEQ 
SELF:XWRPTGRP("PR","EQ")	


METHOD XSUBOP 
SELF:XWRPTGRP("PR","OP")	

METHOD XSUBOU 
SELF:XWRPTGRP("PR","OU")	

METHOD XSUBPA 
SELF:XWRPTGRP("PR","PA")	

METHOD XSUBPR 
SELF:XWRPTGRP("PR","PR")	


END CLASS
