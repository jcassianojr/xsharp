CLASS XJPFDIA INHERIT JPFDIA
	EXPORT lOK AS LOGIC
	EXPORT cCODIGO AS STRING
	EXPORT nPF AS DWORD

METHOD Busca( ) 
IF IsNil(cBUSCA)
   RETURN SELF
ENDIF	
	SELF:oSFJPF:SERVER:SEEK("CODIGO",cBUSCA)

METHOD Busca3d( ) 
   LOCAL cCODIGO AS STRING	
IF  IsNil(cBUSCA)
   RETURN SELF
ENDIF	

   SELF:oSFJPF:server:gotop()
   WHILE  !    SELF:oSFJPF:SERVER:eof
   	  cCODIGO:=SELF:oSFJPF:SERVER:FIELDGET("CODIGO")
   	  IF At(cBUSCA,cCODIGO)>0
   	  	 EXIT
   	  ENDIF	
   	  SELF:oSFJPF:server:skip()
   ENDDO	
   IF SELF:oSFJPF:SERVER:eof
      SELF:oSFJPF:server:gotop()
   ENDIF	




METHOD Buscacodfin( ) 
IF IsNil(cBUSCA)
   RETURN SELF
ENDIF	
	
   SELF:oSFJPF:SERVER:SEEK("CODFINAL",cBUSCA)


METHOD BuscacodINT( ) 
IF IsNil(cBUSCA)
   RETURN SELF
ENDIF	
	
   SELF:oSFJPF:SERVER:SEEK("CODIGOINT",cBUSCA)


METHOD BuscaPF( ) 
IF IsNil(cBUSCA)
   RETURN SELF
ENDIF	
 SELF:oSFJPF:SERVER:SEEK("PF",Val(cBUSCA))
	

METHOD Escolher( ) 
	LOK:=.T.
	cCODIGO:=SELF:oSFJPF:FIELDGET("CODIGO")
	nPF:=SELF:oSFJPF:FIELDGET("PF")
	SELF:EndWindow()

CONSTRUCTOR(oOWNER,cBUSCA) 
SUPER(oOWNER)
SELF:oSFJPF:Browser:SetStandardStyle(gBsreadonly)
SELF:LOK:=.F.
SELF:CBUSCA:=cBUSCA
SELF:SHOW()	

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


METHOD sair( ) 
	LOK:=.F.
	SELF:EndWindow()


END CLASS
