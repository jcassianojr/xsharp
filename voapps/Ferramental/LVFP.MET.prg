PARTIAL CLASS JLVFP
METHOD APPEND() 
local nITEM as dword
self:server:setorder(1)
self:server:gobottom()
nITEM:=self:Server:ITEM
nITEM++
super:append()
self:SERVER:FIELDPUT(#ITEM,nITEM)
return .t.

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD DELETE() 
IF  MDG("Apagar Registro") .AND. SELF:SERVER:LOCKcurrentrecord()
	SELF:server:delete()
	SELF:server:unlock()
	SELF:server:skip(-1)
ENDIF	


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
