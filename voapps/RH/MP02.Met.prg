PARTIAL CLASS JMO
METHOD APPEND(oOWNER) 
LOCAL oBUSCA AS xBUSCA
LOCAL oERRO AS ERRORBOX
oBUSCA:=xBUSCA{oOWNER,"Incluir","Digite o Codigo"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF ! Obusca:lOK
   RETURN .f.
ENDIF	
SELF:server:setorder(1)
SELF:server:gotop()
IF ! SELF:server:seek(oBUSCA:cBUSCA)
	SELF:SERVER:SUSPENDNOTIFICATION()
    SUPER:append()
    SELF:SERVER:FIELDPUT("CODIGO",oBUSCA:cBUSCA)
	SELF:SERVER:resetnotification()
	SELF:SERVER:notify(notifyappend)
ELSE
	oERRO:=ERRORBOX{oOWNER,"J� Cadastrado"}
    oERRO:Show()	
ENDIF	
RETURN	.t.
	


METHOD BusCod( ) 
LOCAL oBUSCA AS xBUSCA
oBUSCA:=xBUSCA{SELF,"Localizar","Digite o Codigo"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   SELF:SERVER:SETORDER(1)
   SELF:SERVER:GOTOP()
   SELF:SERVER:SEEK(oBUSCA:cBUSCA)
   IF SELF:server:Eof
	  SELF:server:gotop()
   ENDIF	
ENDIF			
	


METHOD BusNom( ) 
LOCAL oBUSCA AS xBUSCA
oBUSCA:=xBUSCA{SELF,"Localizar","Digite o Nome"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   SELF:SERVER:SETORDER(2)
   SELF:SERVER:GOTOP()
   SELF:SERVER:SEEK(oBUSCA:cBUSCA)
   IF SELF:server:Eof
	  SELF:server:gotop()
   ENDIF	
ENDIF			


METHOD Calcular( ) 
LOCAL aCUR,aFUN,aTRE,aTMP,aDAD,aCOM AS ARRAY
LOCAL oMP04,oTREIN,oTREII,oMP02TAL,oMP04A,oMP04C AS USEREDE	
LOCAL X,Y,nCUR,nNUMERO,nPOS AS DWORD
LOCAL nTREIN
LOCAL cCODIGO AS STRING
LOCAL lGRAVA AS LOGIC
aCUR:={}
aFUN:={}
aTRE:={}
SELF:oSFJMP2:SERVER:gotop()
WHILE ! SELF:oSFJMP2:SERVER:eof
	IF SELF:osfjmp2:SERVER:FIELDGET("TIPO")="O"
  	   AAdd(aCUR,SELF:osfjmp2:FIELDGET("CURSO"))
  	ENDIF
	SELF:oSFJMP2:SERVER:skip()	
ENDDO	
nCUR:=Len(aCUR)
IF nCUR=0
   RETURN .f.
ENDIF
aTMP:=ArrayNew(nCUR)
AFill(aTMP,0)

aDAD:={zCURINI,"TREIN.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oTREIN:=USEREDE{aDAD,,,,aCOM}
IF oTREIN:nERRO#0
    RETURN .f.
ENDIF
aDAD:={zCURINI,"TREII.DBF",zCURDIR}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oTREII:=USEREDE{aDAD,,,,aCOM}
IF oTREII:nERRO#0
	oTREIN:Close() //Fecha Master
   RETURN .f.
ENDIF
aDAD:={zCURINI,"MP04A.DBF",zCURDIR}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oMP04A:=USEREDE{aDAD,,,,aCOM}
IF oMP04A:nERRO#0
	oTREIN:Close() //Fecha Master
	oTREII:CLOSE()
   RETURN .f.
ENDIF
aDAD:={zCURINI,"MP04C.DBF",zCURDIR}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oMP04C:=USEREDE{aDAD,,,,aCOM}
IF oMP04C:nERRO#0
	oTREIN:Close() //Fecha Master
	oTREII:CLOSE()
	oMP04C:CLOSE()
   RETURN .f.
ENDIF
oTREIN:SetOrder(2) //Codigo do Treinamento
oMP04A:SETORDER(2)
oMP04C:SETORDER(2)
FOR X:=1 TO nCUR
	oTREIN:GOTOP()
	oTREIN:SEEK(aCUR[X])
	WHILE oTREIN:FIELDGET("CURSO")=aCUR[X] .AND. ! oTREIN:EOF
		nTREIN:=oTREIN:FIELDGET("TREIN")
		oTREII:GOTOP()
		WHILE oTREII:FIELDGET("TREIN")=nTREIN .AND. ! oTREII:EoF			
			nNUMERO:=oTREII:FIELDGET("NUMFUN")
			nPOS:=AScan(aFUN,nNUMERO)
			IF nPOS>0
			   aTRE[NPOS][X]:=nTREIN	
			ELSE	
			   AAdd(Afun,Nnumero)
			   AAdd(ATRE,aTMP)
			   nPOS:=Len(aFUN)
               aTRE[NPOS][X]:=nTREIN				
		    ENDIF
			oTREII:SKIP()
        ENDDO		
		oTREIN:SKIP()
    ENDDO		
	oMP04A:GOTOP()
	oMP04A:SEEK(aCUR[X])
	WHILE oMP04A:FIELDGET("CURSO")=aCUR[X] .AND. ! oMP04A:EOF
		 nNUMERO:=oMP04A:FIELDGET("TECNICO")
		 nTREIN:=oMP04A:FIELDGET("TREIN")
		 nPOS:=AScan(aFUN,nNUMERO)
		 IF nPOS>0
		    aTRE[NPOS][X]:=nTREIN	
    	 ELSE	
  	        AAdd(Afun,Nnumero)
  		    AAdd(ATRE,aTMP)
			nPOS:=Len(aFUN)
            aTRE[NPOS][X]:=nTREIN				
 	    ENDIF		
		oMP04A:SKIP()
    ENDDO		
	oMP04C:GOTOP()
	oMP04C:SEEK(aCUR[X])
	WHILE oMP04C:FIELDGET("CURSO")=aCUR[X] .AND. ! oMP04C:EOF
		 nNUMERO:=oMP04C:FIELDGET("TECNICO")
		 nTREIN:=-1 //Nao tem numero pois e anteiror marca um para evitar dele�ao
		 nPOS:=AScan(aFUN,nNUMERO)
		 IF nPOS>0
		    aTRE[NPOS][X]:=nTREIN	
    	 ELSE	
  	        AAdd(Afun,Nnumero)
  		    AAdd(ATRE,aTMP)
			nPOS:=Len(aFUN)
            aTRE[NPOS][X]:=nTREIN				
 	    ENDIF		
		oMP04C:SKIP()
    ENDDO		
NEXT X	
oTREIN:Close() //Fecha Master
oTREII:CLOSE() //Fecha Itens
oMP04A:CLOSE()
oMP04C:CLOSE()


cCODIGO:=SELF:SERVER:FIELDGET("CODIGO")

aDAD:={zCURINI,"MP02TAL.DBF",zCURDIR}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oMP02TAL:=USEREDE{aDAD,,,,aCOM}
IF oMP02TAL:nERRO#0
   RETURN .f.
ENDIF
oMP02TAL:GOTOP()
oMP02TAL:SEEK(cCODIGO)
WHILE oMP02TAL:FIELDGET("CODIGO")=cCODIGO .AND. ! oMP02TAL:EoF
	oMP02TAL:DELETE()
	oMP02TAL:skip()
ENDDO	
oMP02TAL:PACK()
oMP02TAL:CLOSE() //Fecha para fazer o PACK

nPOS:=Len(aFUN)
IF nPOS=0
   RETURN .f.
ENDIF


aDAD:={zCURINI,"MP02TAL.DBF",zCURDIR}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oMP02TAL:=USEREDE{aDAD,,,,aCOM}
IF oMP02TAL:nERRO#0
   RETURN .f.
ENDIF
aDAD:={zCURINI,"MP04.DBF",zCURDIR}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oMP04:=USEREDE{aDAD,,,,aCOM}
IF oMP04:nERRO#0
   oMP02TAL:CLOSE()
   RETURN .f.
ENDIF

nPOS:=Len(aFUN)
FOR X:=1 TO nPOS
	nNUMERO:=aFUN[X]
	oMP04:GOTOP()
	IF oMP04:SEEK(nNUMERO)
	   IF Empty(oMP04:FIELDGET("DEMITIDO"))
	   	  lGRAVA:=.T.
	   	  FOR Y:=1 TO nCUR
	   	  	  IF aTRE[X][Y]=0
	   	  	  	 lGRAVA:=.F.
	   	  	  ENDIF	
	   	  NEXT Y
	   	  IF lGRAVA
	   	  	 FOR y:=1 TO nCUR
	   	  	     oMP02TAL:APPEND()
	   	  	     oMP02TAL:FIELDPUT("CODIGO",cCODIGO)
	   	  	     oMP02TAL:FIELDPUT("CURSO",aCUR[Y])
	   	  	     oMP02TAL:FIELDPUT("NUMFUN",aFUN[X])
	   	  	     oMP02TAL:FIELDPUT("TREIN",aTRE[X][Y])
	         NEXT Y
	   	  ENDIF		
	   ENDIF
	ENDIF
NEXT X	
oMP04:CLOSE()
oMP02TAL:CLOSE()
SELF:SERVER:FIELDPUT("DATATAL",Today())


METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD cmdhoje 
	SELF:SERVER:FIELDPUT("DATAREV",Today())
	

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("RH","FUN")	


METHOD DELETE() 
IF  MDG("Apagar Registro") .AND. SELF:SERVER:LOCKcurrentrecord()
   SELF:oSFJMP2:SERVER:SUSPENDNOTIFICATION()
   SELF:oSFJMP2:SERVER:gotop()
   WHILE ! SELF:oSFJMP2:SERVER:eof
	 	SELF:oSFJMP2:SERVER:delete()
	 	SELF:oSFJMP2:SERVER:skip()	
    ENDDO
	SELF:oSFJMP2:SERVER:resetnotification()
	SELF:oSFJMP2:SERVER:notify(notifyfilechange)

   SELF:oSFJMPP:SERVER:SUSPENDNOTIFICATION()
   SELF:oSFJMPP:SERVER:gotop()
   WHILE ! SELF:oSFJMPP:SERVER:eof
	 	SELF:oSFJMPP:SERVER:delete()
	 	SELF:oSFJMPP:SERVER:skip()	
    ENDDO
	SELF:oSFJMPP:SERVER:resetnotification()
	SELF:oSFJMPP:SERVER:notify(notifyfilechange)
	
	SELF:server:delete()
	SELF:server:unlock()
	IF SELF:SERVER:BOF
  	   SELF:server:skip(-1)
  	ENDIF
ENDIF

METHOD ESCCUR 
LOCAL oJAN AS XESCCUR
oJAN:=XESCCUR{SELF,ZCURINI,ZCURDIR,"CURSO.DBF"}
oJAN:SHOW()
IF oJAN:lOK
   SELF:oDCCURSO:TextValue:=oJAN:CODIGO
ENDIF


METHOD ESCPRO 
LOCAL oJAN AS XESCCUR
oJAN:=XESCCUR{SELF,ZCURINI,ZCURDIR,"PROCEDIM.DBF"}
oJAN:SHOW()
IF oJAN:lOK
   SELF:oDCPROCTO:TextValue:=oJAN:CODIGO
ENDIF


METHOD EXCLUIR 
IF MDG("Apagar Registro") .AND. SELF:oSFJMP2:server:LockCurrentRecord()
   SELF:oSFJMP2:SERVER:SUSPENDNOTIFICATION()	
   SELF:oSFJMP2:server:delete()
   SELF:oSFJMP2:server:unlock()
   SELF:oSFJMP2:SERVER:resetnotification()
   SELF:oSFJMP2:SERVER:notify(notifyfilechange)
ENDIF	

METHOD EXCLUIRP 
IF MDG("Apagar Registro") .AND. SELF:oSFJMPP:server:LockCurrentRecord()
   SELF:oSFJMPP:SERVER:SUSPENDNOTIFICATION()	
   SELF:oSFJMPP:server:delete()
   SELF:oSFJMPP:server:unlock()
   SELF:oSFJMPP:SERVER:resetnotification()
   SELF:oSFJMPP:SERVER:notify(notifyfilechange)
ENDIF	

METHOD INCLUIR(oOWNER) 
LOCAL cCODIGO AS STRING
LOCAL cCURSO AS STRING
LOCAL aCUR AS ARRAY
LOCAL oERRO AS ERRORBOX
cCODIGO:=SELF:SERVER:CODIGO
cCURSO:=AllTrim(SELF:CURSO)
IF Empty(cCURSO)
   oERRO:=ERRORBOX{oOWNER,"Codigo Curso em Branco"}
   oERRO:SHOW()
   RETU NIL
ENDIF
aCUR:=PEGCUR(cCURSO)
IF aCUR[1]=.F.
   oERRO:=ERRORBOX{oOWNER,"Codigo nao Cadastrado"}
   oERRO:SHOW()
   RETU NIL
ENDIF
SELF:oSFJMP2:SERVER:SUSPENDNOTIFICATION()
SELF:oSFJMP2:SERVER:APPEND()
SELF:oSFJMP2:SERVER:CODIGO:=cCODIGO
SELF:oSFJMP2:SERVER:CURSO:=cCURSO
SELF:oSFJMP2:SERVER:commit()
SELF:oSFJMP2:SERVER:resetnotification()
SELF:oSFJMP2:SERVER:notify(notifyappend) //Contas do Livro



METHOD INCLUIRP(oOWNER) 
LOCAL cCODIGO AS STRING
LOCAL cCURSO AS STRING
LOCAL aCUR AS ARRAY
LOCAL oERRO AS ERRORBOX
cCODIGO:=SELF:SERVER:CODIGO
cCURSO:=AllTrim(SELF:PROCTO)
IF Empty(cCURSO)
     oERRO:=ERRORBOX{oOWNER,"Codigo Procedimento em Branco"}
     oERRO:SHOW()
     RETU NIL
ENDIF
aCUR:=PEGPRO(cCURSO)
IF aCUR[1]=.F.
   oERRO:=ERRORBOX{oOWNER,"Codigo nao Cadastrado"}
   oERRO:SHOW()
   RETU NIL
ENDIF
SELF:oSFJMPP:SERVER:SUSPENDNOTIFICATION()
SELF:oSFJMPP:SERVER:APPEND()
SELF:oSFJMPP:SERVER:CODIGO:=cCODIGO
SELF:oSFJMPP:SERVER:CURSO:=cCURSO
SELF:oSFJMPP:SERVER:TIPO:="O"
SELF:oSFJMPP:SERVER:commit()
SELF:oSFJMPP:SERVER:resetnotification()
SELF:oSFJMPP:SERVER:notify(notifyappend) //Contas do Livro

METHOD ListBoxSelect(oControlEvent) 
	LOCAL oControl AS Control
	LOCAL aRESP AS ARRAY
	oControl := IIf(oControlEvent == NULL_OBJECT, NULL_OBJECT, oControlEvent:Control)
	SUPER:ListBoxSelect(oControlEvent)
	//Put your changes here
   DO CASE
       CASE oCONTROL:NAMESYM==#ESCOLA
            aRESP:=PEGESCDES(SELF:SERVER:ESCOLA,ZCURINI,ZCURDIR)
            IF aRESP[1]=.T.
               SELF:SERVER:ESCOLD:=aRESP[2]
            ENDIF
       CASE oCONTROL:NAMESYM==#ESCOLA2
            aRESP:=PEGESCDES(SELF:SERVER:ESCOLA2,ZCURINI,ZCURDIR)
            IF aRESP[1]=.T.
               SELF:SERVER:ESCOLD2:=aRESP[2]
            ENDIF
       CASE oCONTROL:NAMESYM==#ESCOLA3
            aRESP:=PEGESCDES(SELF:SERVER:ESCOLA3,ZCURINI,ZCURDIR)
            IF aRESP[1]=.T.
               SELF:SERVER:ESCOLD3:=aRESP[2]
            ENDIF


	ENDCASE
	RETURN NIL


METHOD PEGFUNCAO() 
RETU PEGCOMBO("FUNCAO.DBF","NOME","CODIGO")
	

METHOD PEGMP05() 
RETU PEGCOMBO("MP05.DBF","DESCRI","CODIGO")

METHOD PEGMP06() 
RETU PEGCOMBO("MP06.DBF","NOME","CODIGO")

METHOD PEGRHES2() 
RETU PEGCOMBO("RHESC.DBF","DESCRI","CODIGO")

METHOD PEGRHESC() 
RETU PEGCOMBO("RHESC.DBF","DESCRI","CODIGO")

METHOD PORCODIGO() 
SELF:server:setorder(1)
RETURN .t.

METHOD PORNOME() 
SELF:server:setorder(2)
RETURN .t.

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()
   SELF:oSFJMP2:SERVER:Commit()
   SELF:oSFJMPp:Server:COMMIT()


METHOD TIPO 
IF SELF:oSFJMPP:server:TIPO="O"
   SELF:oSFJMPP:server:TIPO:="C"
ELSE
   SELF:oSFJMPP:server:TIPO:="O"
ENDIF



METHOD TIPOC 
IF SELF:oSFJMP2:server:TIPO="O"
   SELF:oSFJMP2:server:TIPO:="C"
ELSE
   SELF:oSFJMP2:server:TIPO:="O"
ENDIF



END CLASS
FUNC PEGESCDES(cCODIGO)
LOCAL aRETU:={.F.,""}
LOCAL oARQ AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
IF IsNil(cCODIGO)
     RETU aRETU
ENDIF
aDAD:={ZCURINI,"RHESC.DBF",ZCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oARQ:=USEREDE{aDAD,,,,aCOM}
IF oARQ:nERRO#0
    RETU aRETU
ENDIF
oARQ:GOTOP()
IF oARQ:SEEK(cCODIGO)
   aRETU[1]:=.T.
   aRETU[2]:=oARQ:FIELDGET("DESCRI")
ENDIF
oARQ:CLOSE()
RETU aRETU





