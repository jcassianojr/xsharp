PARTIAL CLASS jtrjob
METHOD ALTERAR  
SELF:osfjtrjobi:VIEWFORM()

METHOD ANTERIOR 
SELF:osfjtrjobi:SkipPrevious()
IF SELF:osfjtrjobi:Server:bof
SELF:osfjtrjobi:SERVER:gotop()
ENDIF

METHOD APPEND() 
LOCAL nNUMERO AS DWORD
SELF:oSFjtrjobi:SERVER:SUSPENDNOTIFICATION()
SELF:server:clearfilter()
SELF:server:setorder(1)
SELF:server:gobottom()
nNUMERO:=SELF:Server:FIELDGET("NUMERO")
nNUMERO++
SUPER:append()
SELF:SERVER:FIELDPUT("NUMERO",nNUMERO)
SELF:SERVER:FIELDPUT("DATA",Today())
SELF:SERVER:FIELDPUT("DATF",Today())
SELF:SERVER:commit()
SELF:oSFjtrjobi:SERVER:resetnotification()
SELF:oSFjtrjobi:SERVER:notify(notifyfilechange)
RETURN  .t.





METHOD BuscaFUN( ) 
SELF:oSFJTREINF:SERVER:SETORDER(2)
SELF:oSFJTREINF:SERVER:GOTOP()
SELF:oSFJTREINF:SERVER:SEEK(AllTrim(FIXSTR(SELF:CNOME)))
IF SELF:oSFJTREINF:SERVER:EOF
   SELF:oSFJTREINF:GOTOP()
ENDIF	
	

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("RH","TRE")	


METHOD DELETE() 
IF  MDG("Apagar Registro") .AND. SELF:SERVER:LOCKcurrentrecord()
   SELF:oSFJtrjobi:SERVER:SUSPENDNOTIFICATION()
	SELF:oSFJtrjobi:SERVER:gotop()
   WHILE ! SELF:oSFJtrjobi:SERVER:eof
	 	SELF:oSFJtrjobi:SERVER:delete()
	 	SELF:oSFJtrjobi:SERVER:skip()	
      ENDDO
	SELF:oSFJtrjobi:SERVER:resetnotification()
	SELF:oSFJtrjobi:SERVER:notify(notifyfilechange)
	SELF:server:delete()
	SELF:server:unlock()
	SELF:server:GoBottom()
ENDIF	

METHOD esccod( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF oESC:LOK
    SELF:oSFJTRJOBI:SERVER:FIELDPUT("PECA",oESC:CODIGO)

ENDIF		


METHOD esccodPRI( ) 
LOCAL oESCMP04 AS XESCMP04
oESCMP04:=XESCMP04{SELF}
IF oESCMP04:LOK
   SELF:nFUNC:=OESCMP04:NUMERO
ENDIF
	

METHOD escfun( ) 
LOCAL oESCMP04 AS XESCMP04
oESCMP04:=XESCMP04{SELF}
IF oESCMP04:LOK
   SELF:oSFJTRJOBI:SERVER:FIELDPUT("NUMTEC",oESCMP04:NUMERO)
   SELF:oSFJTRJOBI:SERVER:FIELDPUT("NOMTEC",oESCMP04:NOME)
ENDIF

METHOD escINS( ) 
LOCAL oESCMP04 AS XESCMP04
oESCMP04:=XESCMP04{SELF}
IF oESCMP04:LOK
   SELF:SERVER:FIELDPUT("NUMINS",oESCMP04:NUMERO)
   SELF:SERVER:FIELDPUT("NOMINS",oESCMP04:NOME)
ENDIF

METHOD ESCINS1 
SELF:SERVER:FIELDPUT("NUMINS",SELF:oSFJTREINF:SERVER:FIELDGET("TECNICO"))
SELF:SERVER:FIELDPUT("NOMINS",SELF:oSFJTREINF:SERVER:FIELDGET("NOMTEC"))

METHOD escmaq 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"ME01.DBF"}
oESC:SHOW()	
IF oESC:LOK
	SELF:SERVER:FIELDPUT("codmaq",oESC:NUMERO)
ENDIF

METHOD ESCOLHER 
SELF:NFUNC:=SELF:oSFJTREINF:SERVER:FIELDGET("TECNICO")


METHOD EXCLUIR 
SELF:oSFjtrjobi:SERVER:SUSPENDNOTIFICATION()
SELF:osfjtrjobi:SERVER:Delete()
SELF:oSFJtrjobi:SERVER:resetnotification()
SELF:oSFJtrjobi:SERVER:notify(notifyfilechange)
SELF:osfjtrjobi:GOTOP()
SELF:osfjtrjobi:Browser:refresh()

METHOD incfunc( ) 
	SELF:ESCOLHER()
	SELF:novo()

METHOD NOVO 
LOCAL nNUMERO AS DWORD
LOCAL aTEC AS ARRAY
nNUMERO:=SELF:SERVER:FIELDGET("NUMERO")
IF SELF:NFUNC=0
   alert("Codigo Funcionarios em Branco")
   RETU NIL
ENDIF
IF SELF:NCARGA=0
   alert("Carga Em Branco")
   RETU NIL
ENDIF
IF Empty(SELF:CCODIGO)
   alert("Codigo Em Branco")
   RETU NIL
ENDIF
aTEC:=PEGMP04(SELF:NFUNC,ZCURINI,ZCURDIR,{zMES,zANO,ZEMPRESA})
IF aTEC[1]=.F.
   alert("Funcionarios nao cadastrado")
   RETU NIL
ENDIF
SELF:oSFjtrjobi:SERVER:SUSPENDNOTIFICATION()
SELF:oSFjtrjobi:SERVER:APPEND()
SELF:oSFjtrjobi:SERVER:FIELDPUT("NUMERO",nNUMERO)
SELF:oSFjtrjobi:SERVER:FIELDPUT("NUMTEC",SELF:NFUNC)
SELF:oSFjtrjobi:SERVER:FIELDPUT("NOMTEC",aTEC[2])
SELF:oSFjtrjobi:SERVER:FIELDPUT("PECA",SELF:CCODIGO)
SELF:oSFjtrjobi:SERVER:FIELDPUT("CARGA",SELF:nCARGA)
SELF:oSFjtrjobi:SERVER:commit()
SELF:oSFjtrjobi:SERVER:resetnotification()
SELF:oSFjtrjobi:SERVER:notify(notifyappend)
SELF:oDCcCODIGO:SetFocus()




METHOD PEGFUN( ) 
LOCAL aTEC AS ARRAY	
aTEC:=PEGMP04(SELF:OSFJTRJOBI:SERVER:FIELDGET("NUMTEC"),ZCURINI,ZCURDIR,{zMES,zANO,ZEMPRESA})
IF aTEC[1]=.T.
   SELF:OSFJTRJOBI:SERVER:FIELDPUT("NOMTEC",aTEC[2])	
ENDIF		

METHOD PEGINS( ) 
LOCAL aTEC AS ARRAY	
aTEC:=PEGMP04(SELF:SERVER:FIELDGET("NUMINS"),ZCURINI,ZCURDIR,{zMES,zANO,ZEMPRESA})
IF aTEC[1]=.T.
   SELF:SERVER:FIELDPUT("NOMINS",aTEC[2])	
ENDIF		

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
 RETURN SELF

METHOD PROXIMO 
SELF:osfjtrjobi:SkipNext()
IF SELF:osfjtrjobi:Server:Eof
	SELF:osfjtrjobi:gobottom()
ENDIF

METHOD TABULAR  
SELF:osfjtrjobi:VIEWTABLE()

METHOD Timer() 
   SELF:SERVER:COMMIT()
   SELF:oSFjtrjobi:SERVER:Commit()


END CLASS
PARTIAL CLASS YJtrjob
METHOD buscaavancada() 
	alert("Opera��o Bloqueada")

METHOD cmddelfiltro() 
	alert("Opera��o Bloqueada")

METHOD cmdfiltrar() 
	alert("Opera��o Bloqueada")

METHOD DELETE() 
	alert("Opera��o Bloqueada")

METHOD keyfind() 
	alert("Opera��o Bloqueada")

METHOD viewform() 
	alert("Opera��o Bloqueada")

METHOD viewtable() 
	alert("Opera��o Bloqueada")


END CLASS
