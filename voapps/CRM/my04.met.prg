PARTIAL CLASS JREQ
METHOD APPEND 
alert("Opera�ao Bloqueada")	

METHOD BUSCAnum 	
SELF:KeyFind()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()


METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("MY","")	


METHOD DELETE 
alert("Opera�ao Bloqueada")	

METHOD PORNUM 
	SELF:KeyFind()
//	SELF:SERVER:SETORDER(1)

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()


METHOD TROCANF( ) 
LOCAL aMAIL AS ARRAY
LOCAL oBUSCA AS XBUSCA
IF Empty(SELF:server:FIELDGET("OS"))
   alert("Sem Pedido Troca Bloqueada")
   RETU .F.
ENDIF	
oBUSCA:=XBUSCA{SELF,"Localizar Nota","Digite o Numero Nota Fiscal"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   aMAIL:={}
   AAdd(aMAIL," Req_No:"+StrTRIM(SELF:SERVER:FIELDGET("NUMERO"),8,0))
   AAdd(aMAIL," Fornecedor:"+StrTRIM(SELF:SERVER:FIELDGET("NUMMB01"),8,0))
   AAdd(aMAIL," Codigo:"+AllTrim(SELF:SERVER:FIELDGET("CODIGO")))
   AAdd(aMAIL," Pedido:"+StrTRIM(SELF:SERVER:FIELDGET("NRNOTA"),8,0))
   AAdd(aMAIL," Nota Lan�ada:"+StrTRIM(SELF:SERVER:FIELDGET("NRNOTA"),8,0))
   AAdd(aMAIL," Nota Corriga:"+StrTRIM(Val(oBUSCA:cBUSCA),8,0))
   EMAILINT("CRM00008",ZUSER,aMAIL,ZCURINI,zCURDIR)		
   SELF:SERVER:FIELDPUT("NRNOTA",Val(oBUSCA:cBUSCA))
ENDIF


END CLASS
