﻿FUNCTION CHECKALT(cTIPCOD,nRASTRONUM,nRASTROANO)
LOCAL oSERVER AS USEREDE
LOCAL ADAD AS ARRAY
LOCAL cBUSCA AS STRING
LOCAL nERRO AS WORD
LOCAL lRETU AS LOGIC

nERRO:=0
lRETU:=.F.
cBUSCA:=cTIPCOD+StrZero(nRASTRONUM,4)+"/"+StrZero(nRASTROANO,4)
//alert(cBUSCA)
aDAD:={zCURINI,"CRMA.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU lRETU
ENDIF
oSERVER:SetOrder(2)
oSERVER:GOTOP()
IF  oSERVER:Seek(cBUSCA)
   lRETU:=.T.
ELSE	
   nERRO:=1	
ENDIF
oSERVER:CLOSE()
IF nERRO=1
   alert("Rastro Alternativo nao Encontrado")
ENDIF
RETU lRETU

FUNCTION checkens(cTIPO,cCODIGO)
LOCAL cMES AS STRING
LOCAL aDAD AS ARRAY
LOCAL oARQ AS USEREDE
LOCAL cARQ AS STRING
AltD()
cMES:="Ensaios PARA RIRM ou Rist não Cadastrados"
IF ValType(cTIPO)#"C" .OR. ValType(cCODIGO)#"C"
   alert (cmes )
   RETU .f.
ENDIF	
CCODIGO:=AllTrim(CCODIGO)
IF Empty(cTIPO) .OR. Empty(cCODIGO)
   alert (cmes)
   RETU .f.
ENDIF	
IF CTIPO $ "TCM"
   cARQ:="MU01I"
   DO CASE
   	  CASE CTIPO="T"
   	  	 cARQ:="MP03I"
   	  CASE CTIPO="C"
   	  	 cARQ:="MT01I"
   ENDCASE
   aDAD:={zCURINI,cARQ+".DBF",zCURDIR}
   oARQ:=USEREDE{aDAD}
   IF oARQ:nERRO=0
      oARQ:GOTOP()
	  oARQ:SEEK(cCODIGO)
	  IF (cCODIGO<>AllTrim(oARQ:FIELDGET("CODIGO"))) .OR. oARQ:EOF
	  	 oARQ:CLOSE()	
	     alert("Ensaios PARA RIRM ou Rist não Cadastrados")
         RETU .F.
	  ENDIF	
	  oARQ:Close()	
   ENDIF
ENDIF
RETU .T.


FUNC DELEENS(cARQ,cARQI,nNUMERO,cCAMPO)
LOCAL oSERVER,oSERVE2 AS USEREDE
LOCAL aDAD AS ARRAY
aDAD:={zCURINI,cARQ,zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU
ENDIF
aDAD:={zCURINI,cARQI,zCURDIR}
oSERVE2:=USEREDE{aDAD}
IF oSERVE2:nERRO#0
	oSERVER:Close() //Fecha Master
   RETU
ENDIF	
oSERVER:GOTOP()
IF oSERVER:SEEK(nNUMERO)
   oSERVER:DELETE()
   oSERVE2:GOTOP()
   oSERVE2:sEEK(nNUMERO)
   WHILE oSERVE2:FIELDGET(cCAMPO)=nNUMERO  .AND. ! oSERVE2:EOF
	  	 oSERVE2:DELETE()
		 oSERVE2:SKIP()
   ENDDO					
ENDIF		
oSERVER:CLOSE()
oSERVE2:CLOSE()

	






FUNCTION GRAVARASTRO(nRASTRO,nCRM,nRIRM,nRIST,cCODIGO,cOBS)
LOCAL oCRMR AS USEREDE
LOCAL aDAD AS ARRAY
aDAD:={zCURINI,"CRMR.DBF",zCURDIR}
oCRMR:=USEREDE{aDAD}
IF oCRMR:nERRO=0
    oCRMR:GOTOP()
    IF oCRMR:SEEK(nRASTRO)
       oCRMR:FIELDPUT("CRM",nCRM)
       oCRMR:FIELDPUT("RIRM",nRIRM)
       oCRMR:FIELDPUT("RIST",nRIST)
       oCRMR:FIELDPUT("PRODUTO",cCODIGO)
       oCRMR:FIELDPUT("OBS",cOBS)
    ENDIF
    oCRMR:CLOSE()

ENDIF
RETU

FUNCTION NOVOLOTE(nFORN,cCODIGO)
LOCAL nLOTE AS WORD
LOCAL cLOTE AS STRING
LOCAL aDAD AS ARRAY
LOCAL oCRML AS USEREDE
nLOTE:=0
cLOTE:="0"
aDAD:={zCURINI,"CRML.DBF",zCURDIR}
oCRML:=USEREDE{aDAD}
IF oCRML:nERRO=0
   oCRML:GOTOP()
   oCRML:SEEK(Str(nFORN,8)+CCODIGO)
   IF oCRML:FOUND
      nLOTE:=oCRML:FIELDGET("LOTE")
      nLOTE++
      IF nLOTE=11 //Era 6 Mudou 11
         nLOTE:=1
      ENDIF
      oCRML:FIELDPUT("LOTE",nLOTE)
   ELSE
      oCRML:APPEND()
      oCRML:FIELDPUT("CLIFOR",nFORN)
      oCRML:FIELDPUT("CODIGO",cCODIGO)
      oCRML:FIELDPUT("LOTE",1)
      nLOTE:=1
   ENDIF
   oCRML:CLOSE()
ENDIF
IF nlote=10	
   cLOTE:="0"
ELSE
  cLOTE:=Str(nLOTE,1)	
ENDIF
RETU cLOTE


FUNCTION NOVORASTRO()
LOCAL nRASTRO AS DWORD
LOCAL cRASTRO AS STRING
LOCAL aRETU AS ARRAY
LOCAL oCRMR AS USEREDE
LOCAL aDAD AS ARRAY
aRETU:={0,""}
aDAD:={zCURINI,"CRMR.DBF",zCURDIR}
oCRMR:=USEREDE{aDAD}
IF oCRMR:nERRO=0
    oCRMR:gobottom()
    nRASTRO:=oCRMR:FIELDGET("RASTRON")
    nRASTRO++
    oCRMR:APPEND()
    oCRMR:FIELDPUT("RASTRON",nRASTRO)
    oCRMR:FIELDPUT("RASTROA",Year(Today()))
    cRASTRO:=StrZero(nRASTRO,4)+"/"+Str(oCRMR:FIELDGET("RASTROA"),4)
    oCRMR:FIELDPUT("RASTRO",cRASTRO)
    oCRMR:FIELDPUT("DATA",Today())
    oCRMR:CLOSE()
    aRETU:={nRASTRO,cRASTRO}
ENDIF
RETU ARETU

FUNCTION PEGCondPAG(nCOMPED)
LOCAL aDAD AS ARRAY
LOCAL oMW01 AS USEREDE
LOCAL lACHEI AS LOGIC
LOCAL cPGTO AS STRING
cPGTO:=""
IF nCOMPED>0
	lACHEI:=.F.
	aDAD:={zCURINI,"MW01.DBF",zCURDIR}
	oMW01:=USEREDE{aDAD}
	IF oMW01:nERRO=0
		oMW01:GOTOP()
		IF oMW01:SEEK(nCOMPED)
           CPGTO:=oMW01:FIELDGET("COMCPAG")+"-"+AllTrim(oMW01:FIELDGET("COMCPAGD"))	
           lACHEI:=.T.
		ENDIF	
	    oMW01:CLOSE()
	ENDIF	
    IF ! lACHEI
    	aDAD:={zCURINI,"MW01BX.DBF",zCURDIR}
	    oMW01:=USEREDE{aDAD}
    	IF oMW01:nERRO=0
	       oMW01:GOTOP()
 		   IF oMW01:SEEK(nCOMPED)
              CPGTO:=oMW01:FIELDGET("COMCPAG")+"-"+AllTrim(oMW01:FIELDGET("COMCPAGD"))	
              lACHEI:=.T.
    	   ENDIF	
	    oMW01:CLOSE()
    	ENDIF	
    ENDIF	
ENDIF
RETU cPGTO

	

FUNCTION XChkRastro(oOWNER,cARQ,cTIPO,cCODIGO)
LOCAL oBUSCA AS XBUSCA
LOCAL oARQ AS USEMANA5
LOCAL aDAD AS ARRAY
LOCAL nNRNOTA AS DWORD	
LOCAL cRASTRO AS STRING
LOCAL aTMP AS ARRAY
LOCAL aRETU AS ARRAY
aRETU:={.F.,""}
IF cTIPO<>"T"
   alert("Não é Tratamento Servicos Tratamento/Serviços")	
   RETU aRETU
ENDIF		





oBUSCA:=XBUSCA{oOWNER,"Codigo do Produto","Confirme o Produto",cCODIGO}
oBUSCA:SHOW()
IF ! oBUSCA:lOK
	RETU ARETU
ENDIF
Ccodigo:=AllTrim(OBUSCA:cbusca)



oBUSCA:=XBUSCA{oOWNER,"Localizar Rastro","Digite Nº Nossa Nota Fiscal"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF ! oBUSCA:lOK
   RETU ARETU
ENDIF
nNRNota:=Val(oBUSCA:cBUSCA)
aDAD:={zCURINI,cARQ,zCURDIR,aDIR}
oARQ:=USEMANA5{aDAD}
IF ! oARQ:USED	
   RETU ARETU
ENDIF
oARQ:GOTOP()
oARQ:SEEK(Str(nNRNOTA,8))
WHILE nNRNOTA=oARQ:FIELDGET("NUMERO") .AND. ! oARQ:EoF
	IF oARQ:FIELDGET("TIPOENT")="T"
	   IF AllTrim(oARQ:FIELDGET("CODIGO"))=cCODIGO
          cRASTRO:=oARQ:FIELDGET("RASTRO")	
          aTMP:=CHECKRASTRO(cRASTRO)	
          IF aTMP[1]
          	 aRETU[2]:=aTMP[2]
          ENDIF	
	   ENDIF	
	ENDIF	
	oARQ:SKIP()
ENDDO	
oARQ:CLOSE()
RETU aRETU


