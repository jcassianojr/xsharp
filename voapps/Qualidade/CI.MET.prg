﻿PARTIAL CLASS JCI
METHOD ANTERIOR 
self:oSFJCII:Browser:SuspendUpdate()
self:oSFJCII:SkipPREVIOUS()
IF self:oSFJCII:Server:BOF
	self:oSFJCII:SkipNEXT()
ENDIF
self:oSFJCII:Browser:RestoreUpdate()

METHOD APPEND() 
LOCAL nCI AS DWORD
LOCAL x,y AS BYTE
LOCAL oCICI,oCIC AS USEREDE
LOCAL oCINEW AS CINEW
LOCAL aCLI AS ARRAY
LOCAL aDAD AS ARRAY



oCINEW:=CINEW{}
oCINEW:SHOW()
IF ! oCINEW:lOK
    RETU
ENDIF
IF Empty(oCINEW:CCODIGO)
    RETU
ENDIF
aDAD:={zCURINI,"CIC.DBF",zCURDIR}
oCIC:=USEREDE{aDAD}
IF oCIC:nERRO#0
   RETU
ENDIF
oCIC:GOTOP()
IF ! oCIC:SEEK(oCINEW:CCODIGO)
    oCIC:CLOSE()
    alert("Produto não Cadastrado")
    RETU
ENDIF
SELF:SERVER:SUSPENDNOTIFICATION()
SELF:server:setorder(1)
SELF:server:gobottom()
nCI:=SELF:Server:CI
nCI++
SUPER:append()
SELF:server:cI:=nCI
SELF:server:data:=Today()
SELF:server:FIELDPUT("desenho",oCIC:FIELDGET("desenho"))
SELF:server:FIELDPUT("revd",oCIC:FIELDGET("revd"))
SELF:server:FIELDPUT("datad",oCIC:FIELDGET("datad"))
SELF:server:FIELDPUT("datar",oCIC:FIELDGET("datar"))
SELF:server:FIELDPUT("descri",oCIC:FIELDGET("descri"))
SELF:SERVER:FIELDPUT("CLIENTE",oCIC:FIELDGET("CLIENTE"))
 aCLI:=PEGMA01(oCIC:FIELDGET("CLIENTE"),zcurini,zcurdir)
 IF aCLI[1]=.T.
      SELF:SERVER:FIELDPUT("CLINOME",aCLI[2])
ENDIF

SELF:server:resetnotification()
SELF:server:notify(notifyappend)
SELF:oSFJCII:SERVER:SUSPENDNOTIFICATION()
oCIC:CLOSE()
y:=1
aDAD:={zCURINI,"CICI.DBF",zCURDIR}
oCICI:=USEREDE{aDAD}
IF oCICI:nERRO#0
   RETU
ENDIF
oCICI:GOTOP()
oCICI:SEEK(oCINEW:CCODIGO)
WHILE ! oCICI:EOF .AND. AllTrim(oCICI:FIELDGET("DESENHO"))=oCINEW:CCODIGO
    SELF:oSFJCII:SERVER:APPEND()
    SELF:oSFJCII:SERVER:FIELDPUT("CI",nCI)
    SELF:oSFJCII:SERVER:FIELDPUT("ITEM",Y)
    SELF:oSFJCII:SERVER:FIELDPUT("LOCALI",oCICI:FIELDGET("LOCALI"))
    SELF:oSFJCII:SERVER:FIELDPUT("ESPE",oCICI:FIELDGET("ESPE"))
    SELF:oSFJCII:SERVER:FIELDPUT("cESPE",oCICI:FIELDGET("cESPE"))
    SELF:oSFJCII:SERVER:FIELDPUT("UND",oCICI:FIELDGET("UND"))
    SELF:oSFJCII:SERVER:FIELDPUT("MIN",oCICI:FIELDGET("MIN"))
    SELF:oSFJCII:SERVER:FIELDPUT("MAX",oCICI:FIELDGET("MAX"))
	oCICI:SKIP()
	Y++
ENDDO
oCICI:CLOSE()
FOR x:=y TO 25
     SELF:oSFJCII:SERVER:APPEND()
     SELF:oSFJCII:SERVER:FIELDPUT("CI",nCI)
     SELF:oSFJCII:SERVER:FIELDPUT("ITEM",x)
NEXT x
SELF:oSFJCII:SERVER:resetnotification()
SELF:oSFJCII:SERVER:notify(notifyfilechange)
SELF:oSFJCII:SERVER:gotop()
RETURN

METHOD buscanum( ) 
	SELF:KeyFind()

method calcular() 
local nvalor,nmax,nmin as float

IF ISNiL(SELF:oDCvalor:VALUE)
   nvalor:=0
ELSE
    nvalor:=SELF:oDCvalor:VALUE
ENDIF
IF ! ISNUMERIC(valor)
    nvalor:=0
ENDIF


nmin:=self:oSFJCII:SERVER:espe-self:oSFJCII:SERVER:min
nmax:=self:oSFJCII:SERVER:espe+self:oSFJCII:SERVER:max
self:oSFJCII:SERVER:SUSPENDNOTIFICATION()
self:oSFJCII:SERVER:enc:=nVALOR
self:oSFJCII:SERVER:desvio:=(self:oSFJCII:SERVER:espe*-1) +nVALOR
if nvalor>=nmin .and. nvalor<=nmax
   self:oSFJCII:SERVER:LAUDO:="A"
else
   self:oSFJCII:SERVER:LAUDO:="R"
endif
self:oSFJCII:SERVER:resetnotification()
self:oSFJCII:SERVER:notify(NOTIFYRECORDCHANGE)


METHOD cmdCalc2() 
self:oSFJCII:SERVER:SUSPENDNOTIFICATION()
self:oSFJCII:SERVER:cenc:=odccenctmp:CURRENTTEXT
self:oSFJCII:SERVER:LAUDO:=odcclaudo:VALUE
self:oSFJCII:SERVER:resetnotification()
self:oSFJCII:SERVER:notify(NOTIFYRECORDCHANGE)

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("CP","CI")	


METHOD DELETE() 
IF MDG("Apagar Registro") .AND. SELF:SERVER:LOCKcurrentrecord()
	SELF:server:delete()
	SELF:server:unlock()
   SELF:oSFJCII:SERVER:SUSPENDNOTIFICATION()
	SELF:oSFJCII:SERVER:gotop()
   WHILE ! SELF:oSFJCII:SERVER:eof
	 	SELF:oSFJCII:SERVER:delete()
	 	SELF:oSFJCII:SERVER:skip()	
      ENDDO
	SELF:oSFJCII:SERVER:resetnotification()
	SELF:oSFJCII:SERVER:notify(notifyfilechange)
	SELF:server:skip(-1)	
ENDIF	


METHOD escres( ) 
LOCAL oESCMP04 AS XESCMP04
oESCMP04:=XESCMP04{SELF}
IF oESCMP04:LOK
   SELF:SERVER:FIELDPUT("INSNUM",oESCMP04:NUMERO)
   SELF:SERVER:FIELDPUT("INSNOM",oESCMP04:NOME)
ENDIF

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

METHOD PEGins( ) 
LOCAL aTEC,aCOM AS ARRAY	
aCOM:={zMES,zANO,ZEMPRESA}
aTEC:=PEGMP04(SELF:SERVER:FIELDGET("insnum"),ZCURINI,ZCURDIR,aCOM)
IF aTEC[1]=.T.
   SELF:SERVER:FIELDPUT("insnom",aTEC[2])	
ENDIF		


METHOD porov( ) 
	SELF:KEYFIND()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
FabCenterWindow( SELF )
 RETURN SELF

METHOD PROXIMO 
self:oSFJCII:Browser:SuspendUpdate()
self:oSFJCII:SkipNext()
IF self:oSFJCII:Server:Eof
	self:oSFJCII:SkipPrevious()
ENDIF
self:oSFJCII:Browser:RestoreUpdate()


METHOD Timer() 
   SELF:SERVER:COMMIT()
   SELF:oSFJCII:SERVER:Commit()



END CLASS
