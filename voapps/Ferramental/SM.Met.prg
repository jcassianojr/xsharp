PARTIAL CLASS JSM
METHOD APPEND() 
LOCAL nSM AS DWORD
SELF:server:setorder(1)
SELF:server:gobottom()
nSM:=SELF:Server:SM
nSM++
SUPER:append()
SELF:SERVER:FIELDPUT("SM",nSM)
SELF:server:FIELDPUT("DATA",Today())
SELF:SERVER:FIELDPUT("DATAPP",Today())
SELF:SERVER:FIELDPUT("CONCLUIDA",.F.)
RETURN .t.

METHOD busca( ) 
	SELF:keyfind()
//LOCAL oBUSCA AS xBUSCA
//oBUSCA:=xBUSCA{SELF,"Localizar","Digite o N� "}
//oBUSCA:lMES:=.T.
//oBUSCA:SHOW()
//IF oBUSCA:lOK
//   SELF:SERVER:SETORDER(1)
//   SELF:SERVER:GOTOP()
//   SELF:SERVER:SEEK(Val(oBUSCA:cBUSCA))
//ENDIF
	

METHOD cmdConcluida() 
SELF:SERVER:CONCLUIDA:=.T.	

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("FR","SM")	

METHOD DELETE() 
IF MDG("Apagar Registro") .AND. SELF:SERVER:LOCKcurrentrecord()
	SELF:server:delete()
	SELF:server:unlock()
	SELF:server:skip(-1)
ENDIF	

METHOD escFER 
LOCAL oESC AS XESCFER
oESC:=XESCFER{SELF,"FERRAM.DBF",1}
oESC:SHOW()	
IF oESC:LOK
	SELF:SERVER:FIELDPUT("CODIGO",oESC:NUMERO)	
    SELF:SERVER:FIELDPUT("NOME",oESC:NOME)	
    SELF:SERVER:FIELDPUT("TIPO","F")
ENDIF


METHOD escfor( ) 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"MA01.DBF"}
oESC:SHOW()	
IF oESC:LOK
    SELF:SERVER:FIELDPUT("CLIENTE",oESC:NUMERO)
    SELF:SERVER:FIELDPUT("CLInome",oESC:NOME)
ENDIF

METHOD escME01 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"ME01.DBF"}
oESC:SHOW()	
IF oESC:LOK
	SELF:SERVER:FIELDPUT("CODIGO",oESC:NUMERO)
    SELF:SERVER:FIELDPUT("NOME",oESC:NOME)
    SELF:SERVER:FIELDPUT("TIPO","M")
ENDIF


METHOD escres( ) 
LOCAL oESCMP04 AS XESCMP04
oESCMP04:=XESCMP04{SELF}
IF oESCMP04:LOK
   SELF:SERVER:FIELDPUT("REQNUM",oESCMP04:NUMERO)
   SELF:SERVER:FIELDPUT("REQNOME",oESCMP04:NOME)
ENDIF

METHOD BTNPEGMA01 
LOCAL aFER AS ARRAY	
IF Empty(SELF:SERVER:FIELDGET("CLIENTE"))
   SELF:BTNPEGME01()
   RETURN .f. //eVITA LOOP POIS PEGME01 TAMBEM TEM PEGMA01	
ENDIF
aFER:=PEGMA01(SELF:SERVER:CLIENTE,ZCURINI,ZCURDIR)
IF aFER[1]=.T.
   SELF:SERVER:FIELDPUT("CLINOME",aFER[2])
ENDIF	

METHOD BTNPEGME01 
LOCAL aFER AS ARRAY	
DO CASE
   CASE SELF:SERVER:TIPO="F"
        SELF:SERVER:FIELDPUT("CODIGO",AllTrim(SELF:SERVER:FIELDGET("CODIGO")))
	    aFER:=PEGFERRAM(SELF:SERVER:CODIGO)
	    IF aFER[1]=.T.
    	   SELF:SERVER:NOME:=aFER[2]
           IF ! Empty(aFER[3])
       	      SELF:SERVER:CLIENTE:=aFER[3]
       	      SELF:BTNPEGMA01()
           ENDIF
	    ENDIF
    CASE SELF:SERVER:TIPO="M"
    	 SELF:SERVER:FIELDPUT("CODIGO",AllTrim(SELF:SERVER:FIELDGET("CODIGO")))
	     aFER:=PEGME01(AllTrim(SELF:SERVER:CODIGO),ZCURINI,ZCURDIR)
         IF aFER[1]=.T.
   		    SELF:SERVER:NOME:=aFER[2]
         ENDIF		
ENDCASE

METHOD BTNPEGMP04 	
LOCAL aFER,aCOM AS ARRAY	
aCOM:={ZMES,ZANO,ZEMPRESA}
aFER:=PEGMP04(SELF:SERVER:REQNUM,ZCURINI,ZCURDIR,aCOM)
IF aFER[1]=.T.
   SELF:SERVER:REQNOME:=aFER[2]
ENDIF


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
