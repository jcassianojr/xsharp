PARTIAL CLASS Jferhg
METHOD APPEND 
LOCAL nos AS DWORD
SELF:SERVER:GOBOTTOM()
nos:=SELF:SERVER:os
nos++
SUPER:APPEND()
SELF:SERVER:os:=nos
SELF:SERVER:DATA:=Today()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("FR","HG")	

METHOD DELETe() 
IF ! MDG("Apagar Registro") .AND. SELF:server:LockCurrentRecord()
	RETU SELF
ENDIF	
SELF:oSFJferhgi:SERVER:SUSPENDNOTIFICATION()
SELF:oSFJferhgi:server:GOTOP()	
WHILE ! oSFJferhgi:server:EOF
 	SELF:oSFJferhgi:server:delete()
ENDDO	
SELF:server:delete()
SELF:server:unlock()
SELF:server:skip(-1)
SELF:oSFJferhgi:SERVER:resetnotification()
SELF:oSFJferhgi:SERVER:notify(notifyfilechange)	
IF SELF:SERVER:BOF
   SELF:SERVER:GOTOP()
ENDIF	

METHOD EDITAR 
SELF:oSFJFERHGI:ViewForm()

METHOD escFER 
LOCAL oESC AS XESCFER
oESC:=XESCFER{SELF,"FERRAM.DBF",1}
oESC:SHOW()	
IF oESC:LOK
   SELF:SERVER:FIELDPUT("CODFERR",oESC:NUMERO)	
ENDIF


METHOD escME01 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"ME01.DBF"}
oESC:SHOW()	
IF oESC:LOK
    SELF:SERVER:FIELDPUT("CODME01",oESC:NUMERO)
ENDIF


METHOD EXCLUIR 
SELF:oSFJFERHGI:SERVER:SUSPENDNOTIFICATION()
IF MDG("Apagar ReHGIstro") .AND. SELF:oSFJFERHGI:server:LockCurrentRecord()
    SELF:oSFJFERHGI:server:delete()
    SELF:oSFJFERHGI:server:unlock()
    SELF:oSFJFERHGI:server:skip(-1)
 ENDIF	
SELF:oSFJFERHGI:SERVER:resetnotification()
SELF:oSFJFERHGI:SERVER:notify(notifyfilechange)
SELF:oSFjferhgi:Browser:REFRESH()

METHOD INCLUIR 
LOCAL nOS AS DWORD
nOS:=SELF:SERVER:FIELDGET("OS")
SELF:oSFJFERHGI:SERVER:SUSPENDNOTIFICATION()
SELF:oSFJFERHGI:SERVER:APPEND()
SELF:oSFJFERHGI:SERVER:FIELDPUT("OS",nOS)
SELF:oSFJFERHGI:SERVER:FIELDPUT("data",Today())
SELF:oSFJFERHGI:SERVER:commit()
SELF:oSFJFERHGI:SERVER:resetnotification()
SELF:oSFJFERHGI:SERVER:notify(notifyappend)

METHOD ITENS  
SELF:oSFJFERHGI:VIEWTABLE()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )       
        SELF:oDCtipser:FillUsing(SELF:servicox( ))

 RETURN SELF

METHOD servicox 
LOCAL aRETU AS ARRAY
aRETU:={}
AAdd(aRETU,{"Manutenção","M"})	
AAdd(aRETU,{"Construção","C"})	
AAdd(aRETU,{"Protótipo","P"})	
AAdd(aRETU,{"Outros","O"})	
RETU arETU

METHOD Timer() 
   SELF:SERVER:COMMIT()
    SELF:OSFJFERHGI:SERVER:COMMIT()



METHOD VERPCP( ) 
LOCAL oJAN AS XJPRO
//oJAN:=XJPRO{SELF,SELF:SERVER:FIELDGET("peca"),zcurINI,zcurDIR,adir}
oJAN:=XJPRO{SELF,"",zcurINI,zcurDIR,adir}
oJAN:SHOW()
IF oJAN:aRETSEQ[1]
   SELF:SERVER:FIELDPUT("SEQ",oJAN:aRETSEQ[2])
   SELF:SERVER:FIELDPUT("SSQ",oJAN:aRETSEQ[3])	
ENDIF	
	


END CLASS
