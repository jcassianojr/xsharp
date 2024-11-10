CLASS MYDataWindow INHERIT DataWindow

METHOD BUSCAAVANCADA 
LOCAL oBUSCA AS xBUSCA
LOCAL oBUSCAP AS BuscaPalavra
oBUSCA:=xBUSCA{SELF,"Localizar ","Digite o Dado"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF oBUSCA:lOK
   oBUSCAP:=BuscaPalavra{SELF,SELF:SERVER,oBUSCA:cBUSCA}
   oBUSCAP:SHOW()
   IF oBUSCAP:LOK
   	  SELF:GOTO(oBUSCAP:nRECNO)
   ENDIF	
ENDIF	
	

METHOD cmddelfiltro 
	alert("Não Disponivel")

METHOD CMDFILTRAR 
	alert("Não Disponivel")

METHOD cmdimprimir 
	alert("Não Disponivel")	


METHOD KeyFind()  
        LOCAL oWin AS SmartFind
   oWin :=  SmartFind{ SELF:owner, , , SELF  }
   oWin:show()


METHOD xcmddelfiltro(lATU) 
	IF ValType(lATU)<>"L"
       lATU:=.F.
    ENDIF		
	alert("Filtro Apagado")
	SELF:server:clearfilter()
    IF lATU
//       alert("Refresh")	
       SELF:Browser:Refresh()	
  	ENDIF
	

METHOD xCMDFILTRAR(lATU) 
//LOCAL Od AS DLGFILTER
//oD:=DLGFILTER{SELF,SELF:SERVER,1)
//	 oD:Show()
//	 IF oD:lOK
//	   SELF:SERVER:setfilteR(oD:Filtre)
//	   SELF:SERVER:GOTOP()
//	   alert("filtro Ativado")
//	 ENDIF
LOCAL oJAN AS XJFILTRO
LOCAL aESTRU AS ARRAY
IF ValType(lATU)<>"L"
   lATU:=.F.
ENDIF		

aESTRU:=SELF:SERVER:dbSTRUCT
oJAN:=XJFILTRO{SELF,aESTRU}
oJAN:SHOW()
	 IF oJAN:LOK
	   alert("filtro Ativado:"+ojan:cFILTRO)	
//	   SELF:server:setfilter( FilterBlock{ SELF:server, oJAN:CFILTRO } )
	   SELF:SERVER:setfilteR(oJAN:cFILTRO)
       IF lATU
//  	       alert("Refresh")	
       	 SELF:SERVER:GOTOP()
         SELF:Browser:Refresh()	
  	   ENDIF
	 ENDIF
	

METHOD XWRPTFGRP(cGRP,cSUB) 
LOCAL cARQ,CNOME AS STRING  
LOCAL nFout AS PTR
cNOME:=Upper(AllTrim(ZUSER))
IF cNOME="SUPERVISOR" .OR. cNOME="SOFTEC"
   cNOME:="ADMIN"	
ENDIF
cARQ:=PEGINIVAL(ZCURINI,"WRPT","CAMINHO")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPT"),String2Psz("X$"+CNOME+"%"+cGRP+"#"+cSUB),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 

METHOD XWRPTGRP(cGRP,cSUB) 
LOCAL cARQ,CNOME AS STRING 
LOCAL nFout AS PTR
cNOME:=Upper(AllTrim(ZUSER))
IF cNOME="SUPERVISOR" .OR. cNOME="SOFTEC"
   cNOME:="ADMIN"	
ENDIF
cARQ:=PEGINIVAL(ZCURINI,"WRPT","CAMINHO")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPT"),String2Psz("X$"+CNOME+"%"+cGRP+"#"+cSUB),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 

METHOD XWRPTIGRP(cGRP,cSUB) 
LOCAL cARQ,CNOME AS STRING 
LOCAL nFout AS PTR
cNOME:=Upper(AllTrim(ZUSER))
IF cNOME="SUPERVISOR" .OR. cNOME="SOFTEC"
   cNOME:="ADMIN"	
ENDIF
cARQ:=PEGINIVAL(ZCURINI,"WRPT","CAMINHO")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPT"),String2Psz("I$"+CNOME+"%"+cGRP+"#"+cSUB),String2Psz(carq),SW_SHOWNORMAL) 
ShellExecuteErro(nFout)  		
END CLASS
