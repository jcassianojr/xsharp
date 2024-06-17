FUNCTION CHECKCODI(nCODI)
LOCAL nPOS AS DWORD
nPOS:=AScan(ACODI,StrZero(nCODI,3))
RETU nPOS

FUNCTION checkieuf(cIE,cUF)
LOCAL lRETU AS LOGIC
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
lRETU:=.T.
//estados sem cadastro
//IF cUF="AC" .OR. CUF="AM".or. cUF="AP" .OR. CUF="DF" .or.cUF= "FN"
//   RETU Lretu
//ENDIF	
//IF cUF="EX" .OR. CUF="XX".or. cUF="MG" .OR. CUF="PA" .or.cUF= "PB"
//   RETU Lretu
//ENDIF	
//IF cUF="PE" .OR. CUF="RN".or. cUF="RO" .OR. CUF="RR" .or.cUF= "SP"
//   RETU Lretu
//ENDIF	
Cie:=AllTrim(TIRAOUT(cie))
aDAD:={zCURINI,"CNPJIE"+cUF+".DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU lRETU
ENDIF
oSERVER:GOTOP()
IF ! Oserver:seek(Cie)
   lRETU:=.F.	
ENDIF	
oSERVER:CLOSE()
RETU lRETU

FUNCTION checkmod(CREG,nMOD)
LOCAL lRETU AS LOGIC
lRETU:=FALSE
IF cREG="50" .or. creg="51"
   IF nMOD=1  .OR. nMOD=6 .OR. NMOD=3 .OR. NMOD=22 // 1 1A 03 06 22
   	  lRETU:=TRUE
   ENDIF		
ENDIF	
RETU lRETU

FUNCTION CHECKUFA(cUF)
LOCAL nPOS AS DWORD
LOCAL nRETU AS FLOAT
nRETU:=0
nPOS:=AScan(AUF,cUF)
IF nPOS>0
   nRETU:=AUFA[nPOS]
ENDIF	
RETU nRETU

FUNCTION montaACODI()
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
aCODI:={}
aCODIN:={}
aDAD:={zCURINI,"CST_ICMS.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU .F.
ENDIF
oSERVER:GOTOP()
WHILE .NOT. oSERVER:EOF
   AAdd(ACODI,oSERVER:FIELDGET("CODIGO"))	
   AAdd(ACODIN,oSERVER:FIELDGET("NOME"))	
   oSERVER:SKIP()	
ENDDO	
oSERVER:CLOSE()

FUNCTION montaAUF()
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
aUF:={}
aUFa:={}
aDAD:={zCURINI,"MD05.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU .F.
ENDIF
oSERVER:GOTOP()
WHILE .NOT. oSERVER:EOF
   AAdd(AUF,oSERVER:FIELDGET("UFICMS"))	
   AAdd(AUFA,oSERVER:FIELDGET("ALIQUOTA"))	
   oSERVER:SKIP()	
ENDDO	
oSERVER:CLOSE()


FUNCTION sempessoa(Ccgc)
Ccgc:=TIRAOUT(ccgc)
ccGc:=AllTrim(ccgc)
IF Len(Ccgc)=14 .and. Left(cCGC,3)<>"000"
//	 alert("J")
	RETU "J"
ENDIF
//alert("F")
RETU "F"


