PARTIAL CLASS JFER
METHOD Alterar( ) 
	SELF:oSFJFERRAMI:VIEWFORM()

METHOD Anterior( ) 
SELF:oSFJFERRAMI:SkipPREVIOUS()
IF SELF:oSFJFERRAMI:Server:BOF
	SELF:oSFJFERRAMI:SkipNEXT()
ENDIF	

METHOD APPEND(oOWNER) 
LOCAL oNOVAFER AS xBUSCA
oNOVAFER:=xBUSCA{oOWNER,"Incluir","Digite o N� "}
oNOVAFER:lMES:=.T.
oNOVAFER:SHOW()
IF oNOVAFER:lOK
SELF:server:setorder(1)
SELF:server:gotop()
IF ! SELF:server:seek(oNOVAFER:cBUSCA)
	SELF:SERVER:SUSPENDNOTIFICATION()
    SUPER:append()
    SELF:SERVER:FIELDPUT("FERRAM",oNOVAFER:cBUSCA)
    SELF:SERVER:FIELDPUT("NUMERO",SELF:SERVER:RECNO)
	SELF:SERVER:resetnotification()
	SELF:SERVER:notify(notifyappend)
ELSE
  alert("J� Cadastrado")
ENDIF	
ENDIF
RETURN .t.

METHOD busca( ) 
	SELF:KeyFind()

METHOD buscanum( ) 
LOCAL oBUSCA AS xBUSCA
oBUSCA:=xBUSCA{SELF,"Localizar","Digite o N� "}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   SELF:SERVER:SETORDER(3)
   SELF:SERVER:GOTOP()
   SELF:SERVER:SEEK(Val(oBUSCA:cBUSCA))
ENDIF

METHOD ButtonClick( oControlEvent ) 
//	LOCAL oControl AS Control
	 IIf( oControlEvent == NULL_OBJECT, NULL_OBJECT, oControlEvent:Control )    //oControl :=
	SUPER:ButtonClick( oControlEvent )
	//Put your changes here
   IF IsString(SELF:SERVER:SITUACAO)
      IF SELF:SERVER:SITUACAO="O"
        IF Empty(SELF:SERVER:DATAOUT)
           SELF:SERVER:DATAOUT:=Today()
        ENDIF
        SELF:SERVER:DATAATV:=CToD(Space(8))
        SELF:SERVER:DATADES:=CToD(Space(8))
        SELF:SERVER:DATADEV:=CToD(Space(8))
      ENDIF		
      IF SELF:SERVER:SITUACAO="I"
         IF Empty(SELF:SERVER:DATADES)
            SELF:SERVER:DATADES:=Today()
         ENDIF
         SELF:SERVER:DATAATV:=CToD(Space(8))
         SELF:SERVER:DATAOUT:=CToD(Space(8))
         SELF:SERVER:DATADEV:=CToD(Space(8))
      ENDIF		
      IF SELF:SERVER:SITUACAO="A"
         IF Empty(SELF:SERVER:DATAATV)
            SELF:SERVER:DATAATV:=Today()
         ENDIF
         SELF:SERVER:DATAOUT:=CToD(Space(8))
         SELF:SERVER:DATADES:=CToD(Space(8))
         SELF:SERVER:DATADEV:=CToD(Space(8))
      ENDIF		
      IF SELF:SERVER:SITUACAO="D"
         IF Empty(SELF:SERVER:DATADEV)
            SELF:SERVER:DATADEV:=Today()
         ENDIF
         SELF:SERVER:DATAATV:=CToD(Space(8))
         SELF:SERVER:DATADES:=CToD(Space(8))
         SELF:SERVER:DATAOUT:=CToD(Space(8))
      ENDIF		
   ENDIF
RETURN NIL

METHOD cmdcalcular() 
IF SELF:SERVER:QTDESALDO >0
   IF SELF:SERVER:QTDESALDO>(SELF:SERVER:QTDEBASE*.8) .AND. Empty(SELF:SERVER:QTDEPED)
      SELF:SERVER:QTDEPED:=SELF:SERVER:QTDESALDO
   ENDIF
   IF SELF:SERVER:QTDESALDO>(SELF:SERVER:QTDEBASE*1.3) .AND. Empty(SELF:SERVER:QTDEURG)
      SELF:SERVER:QTDEURG:=SELF:SERVER:QTDESALDO
   ENDIF
   IF SELF:SERVER:QTDESALDO>(SELF:SERVER:QTDEBASE*.8) .AND. Empty(SELF:SERVER:DATAPED)
      SELF:SERVER:DATAPED:=Today()
   ENDIF
   IF SELF:SERVER:QTDESALDO>(SELF:SERVER:QTDEBASE*1.3) .AND. Empty(SELF:SERVER:DATAURG)
      SELF:SERVER:DATAURG:=Today()
   ENDIF
   SELF:SERVER:SITUACAO:="A"
   IF Empty(SELF:SERVER:DATAATV)
      SELF:SERVER:DATAATV:=Today()
   ENDIF
 ELSE
   IF SELF:SERVER:SITUACAO<>"O" .AND. SELF:SERVER:SITUACAO<>"D"
      SELF:SERVER:SITUACAO:="I"
      IF Empty(SELF:SERVER:DATADES)
         SELF:SERVER:DATADES:=Today()
      ENDIF
   ENDIF
 ENDIF
 //Calcula Horas Preventiva
 IF SELF:SERVER:HRSAL>0
    IF SELF:SERVER:FIELDGET("HRSAL")>(SELF:SERVER:FIELDGET("HRBAS")*.8) .AND. Empty(SELF:SERVER:FIELDGET("HRPRE"))
       SELF:SERVER:FIELDPUT("HRPRE",SELF:SERVER:HRSAL)
    ENDIF
    IF SELF:SERVER:FIELDGET("HRSAL")>(SELF:SERVER:FIELDGET("HRBAS")*1.3) .AND. Empty(SELF:SERVER:FIELDGET("HRURG"))
       SELF:SERVER:FIELDPUT("HRURG",SELF:SERVER:HRSAL)
    ENDIF
    IF SELF:SERVER:FIELDGET("HRSAL")>(SELF:SERVER:FIELDGET("HRBAS")*.8) .AND. Empty(SELF:SERVER:FIELDGET("DATHPED"))
       SELF:SERVER:FIELDPUT("DATHPED",SELF:SERVER:DATHSAL)
    ENDIF
    IF SELF:SERVER:FIELDGET("HRSAL")>(SELF:SERVER:FIELDGET("HRBAS")*1.3) .AND. Empty(SELF:SERVER:FIELDGET("DATHURG"))
       SELF:SERVER:FIELDPUT("DATHURG",SELF:SERVER:DATHSAL)
    ENDIF
 ENDIF

 //Calcula Vida Quantidade
 IF SELF:SERVER:QTDETOT>0
    IF SELF:SERVER:FIELDGET("QTDETOT")>(SELF:SERVER:FIELDGET("VDBAS")*.8) .AND. Empty(SELF:SERVER:FIELDGET("VDPRE"))
       SELF:SERVER:FIELDPUT("VDPRE",SELF:SERVER:QTDETOT)
    ENDIF
    IF SELF:SERVER:FIELDGET("QTDETOT")>(SELF:SERVER:FIELDGET("VDBAS")*1.3) .AND. Empty(SELF:SERVER:FIELDGET("VDURG"))
       SELF:SERVER:FIELDPUT("VDURG",SELF:SERVER:QTDETOT)
    ENDIF
    IF SELF:SERVER:FIELDGET("QTDETOT")>(SELF:SERVER:FIELDGET("VDBAS")*.8) .AND. Empty(SELF:SERVER:FIELDGET("VDDPRE"))
       SELF:SERVER:FIELDPUT("VDDPRE",SELF:SERVER:DATHSAL)
    ENDIF
    IF SELF:SERVER:FIELDGET("QTDETOT")>(SELF:SERVER:FIELDGET("VDBAS")*1.3) .AND. Empty(SELF:SERVER:FIELDGET("VDDURG"))
       SELF:SERVER:FIELDPUT("VDDURG",SELF:SERVER:DATHSAL)
    ENDIF
 ENDIF


 //Calcula Vida Horas
 IF SELF:SERVER:HRTOT>0
    IF SELF:SERVER:FIELDGET("HRTOT")>(SELF:SERVER:FIELDGET("VDHBAS")*.8) .AND. Empty(SELF:SERVER:FIELDGET("VDHPRE"))
       SELF:SERVER:FIELDPUT("VDHPRE",SELF:SERVER:HRTOT)
    ENDIF
    IF SELF:SERVER:FIELDGET("HRTOT")>(SELF:SERVER:FIELDGET("VDHBAS")*1.3) .AND. Empty(SELF:SERVER:FIELDGET("VDHURG"))
       SELF:SERVER:FIELDPUT("VDHURG",SELF:SERVER:HRTOT)
    ENDIF
    IF SELF:SERVER:FIELDGET("HRTOT")>(SELF:SERVER:FIELDGET("VDHBAS")*.8) .AND. Empty(SELF:SERVER:FIELDGET("VDHDPRE"))
       SELF:SERVER:FIELDPUT("VDHDPRE",SELF:SERVER:DATHSAL)
    ENDIF
    IF SELF:SERVER:FIELDGET("HRTOT")>(SELF:SERVER:FIELDGET("VDHBAS")*1.3) .AND. Empty(SELF:SERVER:FIELDGET("VDHDURG"))
       SELF:SERVER:FIELDPUT("VDHDURG",SELF:SERVER:DATHSAL)
    ENDIF
 ENDIF


//Zera Se Necessario Preventiva
IF SELF:SERVER:QTDESALDO<(SELF:SERVER:QTDEBASE*.8)
   SELF:SERVER:QTDEPED:=0
   SELF:SERVER:DATAPED:=CToD(Space(8))
ENDIF
IF SELF:SERVER:QTDESALDO<(SELF:SERVER:QTDEBASE*1.3)
   SELF:SERVER:QTDEURG:=0
   SELF:SERVER:DATAURG:=CToD(Space(8))
ENDIF
IF SELF:SERVER:FIELDGET("HRSAL")<(SELF:SERVER:FIELDGET("HRBAS")*.8)
   SELF:SERVER:FIELDPUT("HRPRE",0)
   SELF:SERVER:FIELDPUT("DATHPED",CToD(Space(8)))
ENDIF
IF SELF:SERVER:FIELDGET("HRSAL")<(SELF:SERVER:FIELDGET("HRBAS")*1.3)
   SELF:SERVER:FIELDPUT("HRURG",0)
   SELF:SERVER:FIELDPUT("DATHURG",CToD(Space(8)))
ENDIF

//Zera Vida Util
IF SELF:SERVER:QTDETOT<(SELF:SERVER:VDBAS*.8)
   SELF:SERVER:VDPRE:=0
   SELF:SERVER:VDDPRE:=CToD(Space(8))
ENDIF
IF SELF:SERVER:QTDETOT<(SELF:SERVER:VDBAS*1.3)
   SELF:SERVER:VDURG:=0
   SELF:SERVER:VDDURG:=CToD(Space(8))
ENDIF
IF SELF:SERVER:FIELDGET("HRTOT")<(SELF:SERVER:FIELDGET("VDHBAS")*.8)
   SELF:SERVER:FIELDPUT("VDHPRE",0)
   SELF:SERVER:FIELDPUT("VDHDPRE",CToD(Space(8)))
ENDIF
IF SELF:SERVER:FIELDGET("HRTOT")<(SELF:SERVER:FIELDGET("VDHBAS")*1.3)
   SELF:SERVER:FIELDPUT("VDHURG",0)
   SELF:SERVER:FIELDPUT("VDHDURG",CToD(Space(8)))
ENDIF

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("FR","FR")	

METHOD DELETE() 
IF ! MDG("Apagar Registro") .AND. SELF:server:LockCurrentRecord()
	RETU SELF
ENDIF	
GRAVALOG(SELF:SERVER:FIELDGET("FERRAM"),"DEL","FERRAM")	
SELF:server:delete()
SELF:server:unlock()
IF ! SELF:SERVER:BOF
   SELF:server:skip(-1)
ENDIF

METHOD ESTOQUE( ) 
  IF Empty(SELF:SERVER:FIELDGET("GRUPO"))
    SELF:SERVER:FIELDPUT("GRUPO",SELF:SERVER:FIELDGET("FERRAM"))	
    SELF:SERVER:Commit()
  ENDIF
  SELF:ESTQ(SELF:SERVER:FIELDGET("GRUPO"))

METHOD ESTOQUECOD( ) 	
    SELF:ESTQ(SELF:SERVER:FIELDGET("FERRAM"))	

METHOD ESTOQUEGER( ) 	
    SELF:ESTQ("GERAL")	

METHOD ESTQ(cCODIGO) 
LOCAL oJAN AS XJFERGRP
//alert(cCODIGO)
oJAN:=XJFERGRP{SELF,cCODIGO}
oJAN:SHOW()

METHOD localizareg(oOWNER) 
LOCAL oNOVAFER AS xBUSCA
oNOVAFER:=xBUSCA{oOWNER,"Localizar","Digite o N� "}
oNOVAFER:lMES:=.T.
oNOVAFER:SHOW()
IF oNOVAFER:lOK
SELF:server:setorder(1)
SELF:server:gotop()
SELF:server:seek(oNOVAFER:cBUSCA)
IF SELF:server:eof
  SELF:server:gotop()
ENDIF
ENDIF
RETURN .t.

METHOD PORCOD() 
	SELF:KeyFind()
//	SELF:SERVER:SETORDER(1)

METHOD PORNUM() 	
	SELF:SERVER:SETORDER(3)

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()


END CLASS
PARTIAL CLASS TabControl1_Page1
METHOD escfor( ) 
LOCAL oESC AS XESCNUM	
LOCAL aFORN AS ARRAY
oESC:=XESCNUM{SELF,"MA01.DBF"}
oESC:SHOW()	
IF oESC:LOK
    SELF:SERVER:FIELDPUT("CLIENTE",oESC:NUMERO)
    aFORN:=PEGMA01(SELF:SERVER:CLIENTE,ZCURINI,ZCURDIR)
    IF aFORN[1]=.T.
       SELF:SERVER:FIELDPUT("COGCLI",aFORN[3])
    ENDIF
ENDIF

METHOD pegcli( ) 
LOCAL aFORN AS ARRAY	
    aFORN:=PEGMA01(SELF:SERVER:CLIENTE,ZCURINI,ZCURDIR)
    IF aFORN[1]=.T.
       SELF:SERVER:FIELDPUT("COGCLI",aFORN[3])
    ENDIF	

END CLASS
PARTIAL CLASS TABCONTROL1_PAGE2
METHOD EditFocusChange(oEditFocusChangeEvent) 
	LOCAL oControl AS Control
//	LOCAL lGotFocus AS LOGIC
	oControl := IIf(oEditFocusChangeEvent == NULL_OBJECT, NULL_OBJECT, oEditFocusChangeEvent:Control)
	IIf(oEditFocusChangeEvent == NULL_OBJECT, FALSE, oEditFocusChangeEvent:GotFocus)  //lGotFocus :=
	SUPER:EditFocusChange(oEditFocusChangeEvent)
	//Put your changes here
	DO CASE
		       CASE oCONTROL:NAMESYM==#QTDESALDO
		             IF IsNumeric(SELF:SERVER:QTDESALDO)
			        IF SELF:SERVER:SITUACAO<>"O" .AND. SELF:SERVER:SITUACAO<>"D" .AND. SELF:SERVER:QTDESALDO<=0
                                         SELF:SERVER:SITUACAO:="I"
                                         IF Empty(SELF:SERVER:DATADES)
	                                       SELF:SERVER:DATADES:=Today()
	                                ENDIF
                                         SELF:SERVER:DATAATV:=CToD(Space(8))
                                         SELF:SERVER:DATAOUT:=CToD(Space(8))
                                         SELF:SERVER:DATADEV:=CToD(Space(8))
                                    ENDIF		
			        IF SELF:SERVER:SITUACAO="I" .AND. SELF:SERVER:QTDESALDO>0
                                         SELF:SERVER:SITUACAO:="A"
                                         IF Empty(SELF:SERVER:DATAATV)
	                                     SELF:SERVER:DATAATV:=Today()
	                                ENDIF
                                         SELF:SERVER:DATADES:=CToD(Space(8))
                                         SELF:SERVER:DATAOUT:=CToD(Space(8))
                                         SELF:SERVER:DATADEV:=CToD(Space(8))
                                  ENDIF		
 	           ENDIF
	ENDCASE
	
	RETURN NIL



END CLASS
PARTIAL CLASS TABCONTROL1_PAGE3
METHOD escres( ) 
LOCAL oESCMP04 AS XESCMP04
oESCMP04:=XESCMP04{SELF}
IF oESCMP04:lOK
   SELF:SERVER:FIELDPUT("VISUALNUM",oESCMP04:NUMERO)
   SELF:SERVER:FIELDPUT("VISUALNOM",oESCMP04:NOME)
ENDIF

METHOD foto( ) 
LOCAL cARQ,CCODIGO AS STRING
LOCAL nFout AS PTR
cARQ:=PEGINIVAL(ZCURINI,"PATH","IMGJPG")
CCODIGO:=SELF:SERVER:FIELDGET("FERRAM")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("IMGJPG"),String2Psz(CCODIGO+"#{IMGFER}"),String2Psz(carq),SW_SHOWNORMAL) 
ShellExecuteErro(nFout)  
		

METHOD PEGAVA( ) 
LOCAL ACLI,aCOM AS ARRAY
aCOM:={zMES,zANO,ZEMPRESA}
	        	aCLI:=PEGMP04(SELF:SERVER:VISUALNUM,ZCURINI,ZCURDIR,aCOM)
		    IF aCLI[1]=.T.
        	   SELF:SERVER:VISUALNOM:=aCLI[2]
		    ENDIF


END CLASS
PARTIAL CLASS TabControl1_Page4
METHOD escmat( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MU01.DBF"}
oESC:SHOW()	
IF oESC:LOK
    SELF:SERVER:FIELDPUT("MATCOD",oESC:CODIGO)
    SELF:SERVER:FIELDPUT("MATNOM",oESC:NOME)
ENDIF		

METHOD escprensa( ) 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"ME01.DBF"}
oESC:SHOW()	
IF oESC:LOK
    SELF:SERVER:FIELDPUT("PRENSA",oESC:NUMERO)
    SELF:server:FIELDPUT("PRENSAN",oESC:NOME)
ENDIF	

METHOD escprod( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF oESC:LOK
    SELF:SERVER:FIELDPUT("PECA",oESC:CODIGO)
    SELF:SERVER:FIELDPUT("PECAN",oESC:NOME)
ENDIF		

METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:SERVER:FIELDGET("PECA"))," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETURN .f.
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG"}
OFOTOVIEW:SHOW()
	

METHOD pegcod( ) 
LOCAL aPRO AS ARRAY	
aPRO:=PEGMS01(SELF:SERVER:PECA)
IF aPRO[1]=.T.
   SELF:SERVER:FIELDPUT("PECAN",aPRO[2])
ENDIF			

METHOD pegmat( ) 
LOCAL aPRO AS ARRAY	
aPRO:=PEGMU01(SELF:SERVER:MATCOD,zcurini,zcurdir)
IF aPRO[1]=.T.
   SELF:SERVER:FIELDPUT("MATNOM",aPRO[2])
ENDIF			

METHOD PEGMP01() 
RETU PEGCOMBO("MP01.DBF","NOME","CODIGO")

METHOD pegprensa( ) 
LOCAL aPRO AS ARRAY	
aPRO:=PEGME01(SELF:SERVER:PRENSA,zcurini,zcurdir)
IF aPRO[1]=.T.
   SELF:SERVER:FIELDPUT("PRENSAN",aPRO[2])
   SELF:SERVER:FIELDPUT("CODMP01",aPRO[8])
ENDIF		

METHOD pegseq( ) 
LOCAL aPRO AS ARRAY	
aPRO:=PEGMS06(SELF:SERVER:PECA,SELF:SERVER:SEQ,SELF:SERVER:SSQ,zcurini,zcurdir)
IF aPRO[1]=.T.
   SELF:SERVER:OPERN:=aPRO[2]
ENDIF	

METHOD VERPCP( ) 
LOCAL oJAN AS XJPRO
oJAN:=XJPRO{SELF,SELF:SERVER:FIELDGET("peca"),zcurINI,zcurDIR,adir}
oJAN:SHOW()
IF oJAN:aRETCOM[1]
   SELF:SERVER:FIELDPUT("MATCOD",oJAN:aRETCOM[3])	
ENDIF	
IF oJAN:aRETSEQ[1]
   SELF:SERVER:FIELDPUT("SEQ",oJAN:aRETSEQ[2])
   SELF:SERVER:FIELDPUT("SSQ",oJAN:aRETSEQ[3])	
   SELF:SERVER:FIELDPUT("OPERN",oJAN:aRETSEQ[4])		
ENDIF	
IF oJAN:aRETPRO[1]
   SELF:SERVER:FIELDPUT("PECA",oJAN:aRETPRO[2])	
   SELF:SERVER:FIELDPUT("PECAN",oJAN:aRETPRO[3])	
ENDIF	


END CLASS
PARTIAL CLASS TabControl1_Page5
METHOD cmdtipalmo( ) 
LOCAL x,nLEN AS DWORD
LOCAL cCAMPO,cVAR AS STRING	
IF ! MDG("Trocar Tipo Almofada")
    RETURN .f.
ENDIF	
SELF:server:FIELDPUT("ESQTIP",SIMNAO(SELF:SERVER:FIELDGET("ESQTIP"),{"6","8"}))	
nLEN:=Val(SELF:SERVER:FIELDGET("ESQTIP"))
FOR x:=1 TO 8	
  	IF nLEN=6
  	   cVAR:=Repl("�",6)+Space(2)
  	   IF X>=5
  	   	  cVAR:=Space(8)
  	   ENDIF	
  	ELSE
  	   cVAR:=Repl("�",8)
    ENDIF

	cCAMPO:="ESQL"+StrZero(X,2)
	SELF:SERVER:FIELDPUT(cCAMPO,cVAR)
NEXT	

	
		

METHOD cmdtroca(nLIN,nCOL) 
LOCAL cCAMPO,cVAR,cDIG AS STRING
IF SELF:SERVER:FIELDGET("ESQTIP")="6"
   IF nCOL>=7
   	  RETURN .f.
   ENDIF
   IF nLIN>=5
   	  RETURN .f.
   ENDIF
ENDIF	
cCAMPO:="ESQL"+StrZero(nLIN,2)
cVAR:=SELF:SERVER:FIELDGET(cCAMPO)
cDIG:=SubStr(cVAR,nCOL,1)
cDIG:=SIMNAO(cDIG,{"l","�"})
cVAR:=Stuff(cVAR,nCOL,1,cDIG)
SELF:SERVER:FIELDPUT(cCAMPO,cVAR)

METHOD esc11( ) 
	SELF:cmdtroca(1,1)

METHOD esc12( ) 
		SELF:cmdtroca(1,2)

METHOD esc13( ) 
		SELF:cmdtroca(1,3)

METHOD esc14( ) 
		SELF:cmdtroca(1,4)

METHOD esc15( ) 
	SELF:cmdtroca(1,5)

METHOD esc16( ) 
		SELF:cmdtroca(1,6)

METHOD esc17( ) 
		SELF:cmdtroca(1,7)

METHOD esc18( ) 
		SELF:cmdtroca(1,8)		



METHOD esc21( ) 
	SELF:cmdtroca(2,1)

METHOD esc22( ) 
		SELF:cmdtroca(2,2)

METHOD esc23( ) 
		SELF:cmdtroca(2,3)

METHOD esc24( ) 
		SELF:cmdtroca(2,4)

METHOD esc25( ) 
	SELF:cmdtroca(2,5)

METHOD esc26( ) 
		SELF:cmdtroca(2,6)

METHOD esc27( ) 
		SELF:cmdtroca(2,7)

METHOD esc28( ) 
		SELF:cmdtroca(2,8)		
		



METHOD esc31( ) 
	    SELF:cmdtroca(3,1)

METHOD esc32( ) 
		SELF:cmdtroca(3,2)

METHOD esc33( ) 
		SELF:cmdtroca(3,3)

METHOD esc34( ) 
		SELF:cmdtroca(3,4)

METHOD esc35( ) 
  	    SELF:cmdtroca(3,5)

METHOD esc36( ) 
		SELF:cmdtroca(3,6)

METHOD esc37( ) 
		SELF:cmdtroca(3,7)

METHOD esc38( ) 
		SELF:cmdtroca(3,8)		
		
		


METHOD esc41( ) 
	    SELF:cmdtroca(4,1)

METHOD esc42( ) 
		SELF:cmdtroca(4,2)

METHOD esc43( ) 
		SELF:cmdtroca(4,3)

METHOD esc44( ) 
		SELF:cmdtroca(4,4)

METHOD esc45( ) 
  	    SELF:cmdtroca(4,5)

METHOD esc46( ) 
		SELF:cmdtroca(4,6)

METHOD esc47( ) 
		SELF:cmdtroca(4,7)

METHOD esc48( ) 
		SELF:cmdtroca(4,8)		
		
		
		

METHOD esc51( ) 
	    SELF:cmdtroca(5,1)

METHOD esc52( ) 
		SELF:cmdtroca(5,2)

METHOD esc53( ) 
		SELF:cmdtroca(5,3)

METHOD esc54( ) 
		SELF:cmdtroca(5,4)

METHOD esc55( ) 
  	    SELF:cmdtroca(5,5)

METHOD esc56( ) 
		SELF:cmdtroca(5,6)

METHOD esc57( ) 
		SELF:cmdtroca(5,7)

METHOD esc58( ) 
		SELF:cmdtroca(5,8)		
		
		

METHOD esc61( ) 
	    SELF:cmdtroca(6,1)

METHOD esc62( ) 
		SELF:cmdtroca(6,2)

METHOD esc63( ) 
		SELF:cmdtroca(6,3)

METHOD esc64( ) 
		SELF:cmdtroca(6,4)

METHOD esc65( ) 
  	    SELF:cmdtroca(6,5)

METHOD esc66( ) 
		SELF:cmdtroca(6,6)

METHOD esc67( ) 
		SELF:cmdtroca(6,7)

METHOD esc68( ) 
		SELF:cmdtroca(6,8)		
		

METHOD esc71( ) 
	    SELF:cmdtroca(7,1)

METHOD esc72( ) 
		SELF:cmdtroca(7,2)

METHOD esc73( ) 
		SELF:cmdtroca(7,3)

METHOD esc74( ) 
		SELF:cmdtroca(7,4)

METHOD esc75( ) 
  	    SELF:cmdtroca(7,5)

METHOD esc76( ) 
		SELF:cmdtroca(7,6)

METHOD esc77( ) 
		SELF:cmdtroca(7,7)

METHOD esc78( ) 
		SELF:cmdtroca(7,8)		



METHOD esc81( ) 
	    SELF:cmdtroca(8,1)

METHOD esc82( ) 
		SELF:cmdtroca(8,2)

METHOD esc83( ) 
		SELF:cmdtroca(8,3)

METHOD esc84( ) 
		SELF:cmdtroca(8,4)

METHOD esc85( ) 
  	    SELF:cmdtroca(8,5)

METHOD esc86( ) 
		SELF:cmdtroca(8,6)

METHOD esc87( ) 
		SELF:cmdtroca(8,7)

METHOD esc88( ) 
		SELF:cmdtroca(8,8)		
		
		
		
		
		
		

METHOD PushButton65( ) 
LOCAL X,nLIN,nCOL AS DWORD
LOCAL cCAMPO,cVAR AS STRING
LOCAL lESC AS LOGIC  
Nlin:=0
SELF:SERVER:GOTOP()	
WHILE ! SELF:SERVER:EOF
   FOR x:=1 TO 8
   	  IF x<5
  	     cVAR:=Repl("�",6)+Space(2)
  	  ELSE
  	  	 cVAR:=Space(8)
      ENDIF
   	  cCAMPO:="ESQL"+StrZero(X,2)
  	  SELF:SERVER:FIELDPUT(cCAMPO,cVAR)
   NEXT	
   FOR X:=1 TO 24
   	  DO CASE
   	  	  CASE X<=6
   	  	  	nLIN:=1
   	  	  CASE X>=7 .AND. X<=12
            nLIN:=2
   	  	  CASE X>=13 .AND. X<=18
            nLIN:=3
          CASE X>=19
            nLIN:=4
   	  ENDCASE
   	  nCOL:=X
   	  WHILE nCOL>7
   	  	 nCOL:=nCOL-6
   	  ENDDO
      cCAMPO:="ESQ"+StrZero(X,2)
      lESC:=SELF:SERVER:FIELDGET(cCAMPO)
   	  IF lESC
         SELF:cmdtroca(nLIN,nCOL)
      ENDIF
   NEXT X
   SELF:SERVER:SKIP()
ENDDO



END CLASS
