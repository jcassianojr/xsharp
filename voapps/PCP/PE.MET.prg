PARTIAL CLASS JPE
METHOD APPEND() 
alert("Opera�ao Bloqueada")

METHOD BUSCAPED( ) 
SELF:KeyFind()

METHOD CALC01( ) 
	SELF:PEGAR(1)

METHOD CALC02( ) 
	SELF:PEGAR(2)	

METHOD CALC03( ) 
	SELF:PEGAR(3)	

METHOD CALC04( ) 
	SELF:PEGAR(4)	

METHOD CALC05( ) 
	SELF:PEGAR(5)	

METHOD CALC06( ) 
	SELF:PEGAR(6)	

METHOD CALC07( ) 
	SELF:PEGAR(7)	

METHOD CALC08( ) 
	SELF:PEGAR(8)	

METHOD CALC09( ) 
	SELF:PEGAR(9)	

METHOD CALC10( ) 
	SELF:PEGAR(10)	

METHOD CALC11( ) 
	SELF:PEGAR(11)	

METHOD CALC12( ) 
	SELF:PEGAR(12)	

METHOD CALC13( ) 
	SELF:PEGAR(13)	

METHOD CALC14( ) 
	SELF:PEGAR(14)	

METHOD CALC15( ) 
	SELF:PEGAR(15)	

METHOD CALC16( ) 
	SELF:PEGAR(16)	

METHOD CALC17( ) 
	SELF:PEGAR(17)	

METHOD CALC18( ) 
	SELF:PEGAR(18)	

METHOD CALC19( ) 
	SELF:PEGAR(19)	

METHOD CALC20( ) 
	SELF:PEGAR(20)	
	

METHOD cmddata 
LOCAL cVAL AS STRING	
LOCAL oBUSCA AS xBUSCA
LOCAL dDATA
IF Empty(SELF:oSFJPE01:SERVER:FIELDGET("DATAFAT"))
  Cval:=DToC(Today())	
ELSE	
  cVAL:=DToC(SELF:oSFJPE01:SERVER:FIELDGET("DATAFAT"))
ENDIF
oBUSCA:=xBUSCA{SELF,"Forne�a a DATA dd/mm/yyyy","Digite Data",cVAL}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   dDATA:=CToD(oBUSCA:cBUSCA)
   IF IsDate(Ddata)
      SELF:oSFJPE01:SERVER:FIELDPUT("DATAFAT",dDATA)
   ENDIF
ENDIF	

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("PE","PE")	

METHOD cmdqtde 
LOCAL cVAL AS STRING	
LOCAL oBUSCA AS xBUSCA
cVAL:=Str(SELF:oSFJPE01:SERVER:FIELDGET("TOTKGINI"))
oBUSCA:=xBUSCA{SELF,"Forne�a a Quantidade","Digite Qtde",cVAL}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   SELF:oSFJPE01:SERVER:FIELDPUT("TOTKGINI",Val(oBUSCA:cBUSCA))
   SELF:oSFJPE01:SERVER:FIELDPUT("TOTKGANT",Val(oBUSCA:cBUSCA))
   SELF:oSFJPE01:SERVER:FIELDPUT("TOTKGEST",Val(oBUSCA:cBUSCA))
ENDIF	


METHOD DELETE() 
alert("Opera�ao Bloqueada")
	

METHOD EXCLUIR 
IF ! MDG("Apagar Registro") .AND. SELF:oSFJPE01:server:LockCurrentRecord()
   RETURN .f.
ENDIF
SELF:oSFJPE01:SERVER:SUSPENDNOTIFICATION()
SELF:oSFJPE01:server:delete()
SELF:oSFJPE01:server:unlock()
SELF:oSFJPE01:SERVER:resetnotification()
SELF:oSFJPE01:SERVER:notify(notifyFILECHANGE)
SELF:oSFJPE01:SERVER:GOTOP()
SELF:oSFJPE01:Browser:refresH()

METHOD INCLUIR 
LOCAL nOV,nITEM AS DWORD
LOCAL oBUSCA AS XBUSCA
LOCAL lTEM AS LOGIC
LOCAL nNRNOTA

nOV:=SELF:SERVER:FIELDGET("PEDIDO")

SELF:oSFJPE01:SERVER:GOBOTTOM()
nITEM:=SELF:oSFJPE01:SERVER:FIELDGET("ITEM")
nITEM++
IF nITEM=100
   nITEM:=0
   lTEM:=.F.
   WHILE ! lTEM
   	  lTEM:=.T.
   	  nITEM++
      SELF:oSFJPE01:SERVER:GOTOP()
      WHILE !  SELF:oSFJPE01:SERVER:EOF
     	IF SELF:oSFJPE01:SERVER:FIELDGET("ITEM")=nITEM
     	   lTEM:=.F.	
        ENDIF		
        SELF:oSFJPE01:SERVER:SKIP()
      ENDDO
   ENDDO
ENDIF	

oBUSCA:=XBUSCA{SELF,"Forneca o Item","Digite o Item",Str(Nitem)}
oBUSCA:SHOW()
IF ! oBUSCA:lOK
   RETURN .f.	
ENDIF
nITEM:=Val(oBUSCA:cBUSCA)

nNRNOTA:=Str(SELF:SERVER:FIELDGET("PEDIDO"),5)
nNRNOTA+="."
nNRNOTA+=Str(nITEM,2)

SELF:oSFJPE01:SERVER:SUSPENDNOTIFICATION()
SELF:oSFJPE01:SERVER:APPEND()
SELF:oSFJPE01:SERVER:FIELDPUT("PEDIDO",nOV)
SELF:oSFJPE01:SERVER:FIELDPUT("ITEM",nITEM)
SELF:oSFJPE01:SERVER:commit()
SELF:oSFJPE01:SERVER:resetnotification()
SELF:oSFJPE01:SERVER:notify(notifyappend)
SELF:oSFJPE01:SERVER:FIELDPUT("TIPPED",SELF:SERVER:FIELDGET("TIPPED"))
SELF:oSFJPE01:SERVER:FIELDPUT("CODIGO",SELF:SERVER:FIELDGET("CODIGO"))
SELF:oSFJPE01:SERVER:FIELDPUT("NOME",SELF:SERVER:FIELDGET("NOME"))
SELF:oSFJPE01:SERVER:FIELDPUT("NOM2",SELF:SERVER:FIELDGET("NOM2"))
SELF:oSFJPE01:SERVER:FIELDPUT("CLIENTE",SELF:SERVER:FIELDGET("FORNECEDO"))
SELF:oSFJPE01:SERVER:FIELDPUT("COGNOME",SELF:SERVER:FIELDGET("COGNOME"))
SELF:oSFJPE01:SERVER:FIELDPUT("UNIDADE",SELF:SERVER:FIELDGET("UNID"))
SELF:oSFJPE01:SERVER:FIELDPUT("TIPOCLI",SELF:SERVER:FIELDGET("F"))
SELF:oSFJPE01:SERVER:FIELDPUT("NRNOTAINI",Val(nNRNOTA))
SELF:oSFJPE01:SERVER:commit()
SELF:oSFJPE01:Browser:REFRESH()




METHOD PEGAR(nDIA) 	
LOCAL cVAR AS STRING	
	SELF:INCLUIR()
	cVAR:="DATR"+StrZero(nDIA,2)
	SELF:oSFJPE01:SERVER:FIELDPUT("DATAFAT",SELF:oSFJNEC:FIELDGET(cVAR))
	cVAR:="QTDI"+StrZero(nDIA,2)
	SELF:oSFJPE01:SERVER:FIELDPUT("TOTKGINI",SELF:oSFJNEC:FIELDGET(cVAR))
	SELF:oSFJPE01:SERVER:FIELDPUT("TOTKGANT",SELF:oSFJNEC:FIELDGET(cVAR))
	SELF:oSFJPE01:SERVER:FIELDPUT("TOTKGEST",SELF:oSFJNEC:FIELDGET(cVAR))	
	SELF:oSFJPE01:SERVER:Commit()
	SELF:oSFJPE01:Browser:REFRESH()
	

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
	    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
