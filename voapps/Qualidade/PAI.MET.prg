﻿PARTIAL CLASS JPAI
METHOD ALTERAR  
SELF:oSFJPAEI:VIEWFORM()

METHOD ANTERIOR 
SELF:oSFJPAEI:Browser:SuspendUpdate()
SELF:oSFJPAEI:SERVER:Skipex(-1)
//SELF:oSFJPAEI:SkipPREVIOUS()
//IF SELF:oSFJPAEI:Server:BOF
//	SELF:oSFJPAEI:SkipNEXT()
//ENDIF
SELF:oSFJPAEI:Browser:RestoreUpdate()

 METHOD APPEND() 
SELF:SERVER:SUSPENDNOTIFICATION()
SUPER:append()
SELF:SERVER:resetnotification()
SELF:SERVER:notify(notifyappend)
RETURN

METHOD btnPEGMS01 
LOCAL aPRO AS ARRAY
aPRO:=PEGMS01(SELF:SERVER:DESENHO)
IF aPRO[1]=.T. .AND. ! Empty(aPRO[2])
   SELF:SERVER:FIELDPUT("DESCRI",aPRO[2])
ENDIF

METHOD buscanum( ) 
	SELF:KEYFIND()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("CP","PAE")	

METHOD esccod( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF oESC:LOK
    SELF:SERVER:FIELDPUT("DESENHO",oESC:CODIGO)
    SELF:SERVER:FIELDPUT("DESCRI",oESC:NOME)
ENDIF		

METHOD EXCLUIR 
SELF:oSFJPAEI:SERVER:SUSPENDNOTIFICATION()
IF  MDG("Apagar Registro") .AND. SELF:oSFJPAEI:server:LockCurrentRecord()
    SELF:oSFJPAEI:server:delete()
    SELF:oSFJPAEI:server:unlock()
    SELF:oSFJPAEI:SERVER:Skipex(-1)
    //SELF:oSFJPAEI:server:skip(-1)
 ENDIF	
SELF:oSFJPAEI:SERVER:resetnotification()
SELF:oSFJPAEI:SERVER:notify(notifyfilechange)

METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:SERVER:FIELDGET("DESENHO"))," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETU
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG"}
OFOTOVIEW:SHOW()

METHOD INCLUIR 
LOCAL cDESENHO AS STRING
AltD()
cDESENHO:=SELF:SERVER:FIELDGET("DESENHO")
SELF:oSFJPAEI:SERVER:SUSPENDNOTIFICATION()
SELF:oSFJPAEI:SERVER:APPEND()
SELF:oSFJPAEI:SERVER:FIELDPUT("DESENHO",cDESENHO)
SELF:oSFJPAEI:SERVER:commit()
SELF:oSFJPAEI:SERVER:resetnotification()
SELF:oSFJPAEI:SERVER:notify(notifyappend)

METHOD porov( ) 
	SELF:KeyFind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   FabCenterWindow( SELF )
 RETURN SELF

METHOD PROXIMO 
SELF:oSFJPAEI:Browser:SuspendUpdate()
SELF:oSFJPAEI:SERVER:Skipex(1)
//SELF:oSFJPAEI:SkipNext()
//IF SELF:oSFJPAEI:Server:Eof
//	SELF:oSFJPAEI:SkipPrevious()
//ENDIF
SELF:oSFJPAEI:Browser:RestoreUpdate()

METHOD TABULAR  
SELF:oSFJPAEI:VIEWTABLE()

METHOD Timer() 
   SELF:SERVER:COMMIT()
   SELF:oSFJPAEI:Server:COMMIT()


END CLASS
