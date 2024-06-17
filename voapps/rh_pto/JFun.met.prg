PARTIAL CLASS JFUN
METHOD buscacodigo() 
	SELF:KeyFind()
//LOCAL oBUSCA AS xBUSCA
//oBUSCA:=xBUSCA{SELF,"Localizar","Digite o Codigo"}
//oBUSCA:lMES:=.T.
//oBUSCA:SHOW()
//IF oBUSCA:lOK
//   SELF:SERVER:SETORDER(1)
//   SELF:SERVER:GOTOP()
//   SELF:SERVER:SEEK(oBUSCA:cBUSCA)
//ENDIF	


METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD porcodigo() 
	SELF:KeyFind()
//   SELF:SERVER:SETORDER(1)	

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
 FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()




END CLASS
