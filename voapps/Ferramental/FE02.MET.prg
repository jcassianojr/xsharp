PARTIAL CLASS JFE02
METHOD APPEND() 
alert("Incluis�o Bloqueada")
RETUrn .f.

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD DELETE() 
alert("Exclus�o Bloqueada")
RETUrn .f.

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
