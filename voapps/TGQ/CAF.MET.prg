PARTIAL CLASS JCAF
METHOD ALTERAR  
SELF:oSFJCAFI:VIEWFORM()

METHOD ANTERIOR 
SELF:oSFJCAFI:Browser:SuspendUpdate()
SELF:oSFJCAFI:SkipPREVIOUS()
IF SELF:oSFJCAFI:Server:BOF
	SELF:oSFJCAFI:SkipNEXT()
ENDIF
SELF:oSFJCAFI:Browser:RestoreUpdate()

METHOD APPEND() 
alert("Operacao Bloqueada")
RETURN SELF

METHOD buscaNUMERO( ) 
//	SELF:keyfind()    Datadialog datadialog
LOCAL oBUSCA AS XBUSCA
oBUSCA:=XBUSCA{SELF,"Localizar","Digite o N�"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   SELF:SERVER:SETORDER(1)
   SELF:SERVER:GOTOP()
   SELF:SERVER:SEEK(Val(oBUSCA:cBUSCA))
ENDIF	

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("PPAP","")		

METHOD DELETE() 
alert("Operacao Bloqueada")
RETURN SELF

METHOD EXCLUIR 
IF  MDG("Apagar Registro") .AND. SELF:oSFJCAFI:server:LockCurrentRecord()
    SELF:oSFJCAFI:SERVER:SUSPENDNOTIFICATION()	
    SELF:oSFJCAFI:server:delete()
    SELF:oSFJCAFI:server:unlock()
    SELF:oSFJCAFI:SERVER:resetnotification()
	SELF:oSFJCAFI:SERVER:notify(notifyfilechange)
	SELF:oSFJCAFI:SERVER:GOTOP()
	SELF:oSFJCAFI:Browser:refresh()
ENDIF	


METHOD INCLUIR 
LOCAL nNUMERO AS DWORD
LOCAL dDATA AS DATE
nNUMERO:=SELF:SERVER:FIELDGET("NUMERO")
SELF:oSFJCAFI:SERVER:GOBOTTOM()
dDATA:=SELF:oSFJCAFI:FIELDGET("EFETUADO")
IF Empty(dDATA) .OR. IsNil(dDATA)
   dDATA:=Today()	
ENDIF	
dDATA:=dDATA+912
SELF:oSFJCAFI:SERVER:SUSPENDNOTIFICATION()
SELF:oSFJCAFI:SERVER:APPEND()
SELF:oSFJCAFI:SERVER:FIELDPUT("NUMERO",nNUMERO)
SELF:oSFJCAFI:SERVER:FIELDPUT("PREVISTO",dDATA)
SELF:oSFJCAFI:SERVER:commit()
SELF:oSFJCAFI:SERVER:resetnotification()
SELF:oSFJCAFI:SERVER:notify(notifyappend)
SELF:oSFJCAFI:Browser:refresh()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
      FabCenterWindow( SELF )
 RETURN SELF

METHOD PROXIMO 
SELF:oSFJCAFI:Browser:SuspendUpdate()
SELF:oSFJCAFI:SkipNext()
IF SELF:oSFJCAFI:Server:Eof
	SELF:oSFJCAFI:SkipPrevious()
ENDIF
SELF:oSFJCAFI:Browser:RestoreUpdate()

METHOD TABCON 
RETU MTD02("CONFOR",2)

METHOD TABQUA 
RETU MTD02("QUALIFI",12)

METHOD TABSUB 
RETU MTD02("SUBRAMO",3)

METHOD TABULAR  
SELF:oSFJCAFI:VIEWTABLE()

METHOD Timer() 
   SELF:SERVER:COMMIT()


END CLASS
PARTIAL CLASS JCAFI
METHOD cmdEFICAZ( ) 
	SELF:server:FIELDPUT("EFICAZ",SIMNAO(SELF:SERVER:FIELDGET("EFICAZ"),{"S","N"," "}))	


END CLASS
