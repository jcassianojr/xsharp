FUNC MS02PRC(cCODIGO,cLISTA,lICM,lPEC,cCURINI,cCURDIR,aDIR) //Produlo Cliente, Desconta Icms, Divide cento/milheiro
LOCAL aRETU:={0,"  ",CToD(Space(8)),"  "} //Valor,Unidade,DataBase,CODIPI
LOCAL cUF AS STRING
LOCAL oSERVER AS USEMANA5
LOCAL oMD05 AS USEMANA5
LOCAL aDAD AS ARRAY
LOCAL nICMS AS FLOAT
IF ValType(lICM)#"L"
   lICM:=.F.
ENDIF	
IF ValType(lPEC)#"L"
   lPEC:=.F.
ENDIF	
IF Empty(Ccodigo)
   alert("Código Produto não preenchido")
   RETU aRETU
ENDIF	
IF Empty(CLISTA)
   alert("Código Cliente não preenchido")
   RETU aRETU
ENDIF		
aDAD:={cCURINI,"MS02",cCURDIR,aDIR}
oSERVER:=USEMANA5{aDAD}
IF oSERVER:nERRO#0
    RETU aRETU
ENDIF
cCODIGO:=PadR(cCODIGO,24)
oSERVER:SetOrder(5)
oSERVER:GOTOP()
oSERVER:SEEK(cCODIGO+Str(cLISTA,5))
WHILE AllTrim(cCODIGO)=AllTrim(oSERVER:FIELDGET("CODIGO")) .AND. cLISTA=oSERVER:FIELDGET("FORNECEDO") .AND. ! oSERVER:EoF
   IF oSERVER:FIELDGET("ATUAL")#"N"
      aRETU[1]:=oSERVER:FIELDGET("VALOR")
      aRETU[3]:=oSERVER:FIELDGET("DATA")
      IF ! Empty(oSERVER:FIELDGET("UNIDE"))
         aRETU[2]:=oSERVER:FIELDGET("UNIDE")
      ENDIF
      IF ! Empty(oSERVER:FIELDGET("COIDE"))
         aRETU[4]:=oSERVER:FIELDGET("COIDE")
      ENDIF
   ENDIF
   oSERVER:SKIP()
ENDDO
oSERVER:CLOSE()
IF aRETU[1]=0
   alert("Não Achei Lista de Preco")
   RETU aRETU
ENDIF
IF lICM
   aDAD:=PEGMA01(cLISTA,cCURINI,cCURDIR)
   IF aDAD[1]
   	  cUF:=aDAD[5]
   	  nICMS:=0
      aDAD:={cCURINI,"MD05",cCURDIR,aDIR}
      oMD05:=USEMANA5{aDAD}
      IF oMD05:nERRO#0
       	 aRETU[1]:=0
       	 alert("Erro Abrindo Tabela ICMS")
         RETU aRETU
      ENDIF
      oMD05:GOTOP()
      IF oMD05:SEEK(cUF)
         nICMS:=oMD05:FIELDGET("ALIQUOTA")	
      ENDIF	
      oMD05:CLOSE()
      IF nICMS=0
       	 aRETU[1]:=0
       	 alert("Aliquota ICMS Não Encontrada")
         RETU aRETU
      ENDIF	
      aRETU[1]:=aRETU[1]*((100-nICMS)/100)
   ENDIF
ENDIF
IF lPEC
   IF aRETU[2]="CT"
      aRETU[1]:=aRETU[1]/100
   ENDIF
   IF aRETU[2]="ML"
      aRETU[1]:=aRETU[1]/1000
   ENDIF
ENDIF	
RETU aRETU	

FUNC PEGMS(cARQ AS STRING,cCODIGO AS STRING)
LOCAL aRETU:={.F.,"","",0,"",0,"","","","","",""} //11 delivery 12-//stock usadas na pegmsext
LOCAL oARQ AS USEREDE
LOCAL aDAD AS ARRAY
IF IsNil(cCODIGO)
   RETU aRETU
ENDIF
IF Empty(AllTrim(cCODIGO))
   RETU aRETU
ENDIF
aDAD:={ZCURINI,cARQ+".DBF",ZCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:nERRO#0
    RETU aRETU
ENDIF
oARQ:GOTOP()
IF oARQ:SEEK(AllTrim(cCODIGO))
   aRETU[1]:=.T.
   aRETU[2]:=oARQ:FIELDGET("NOME")
   aRETU[3]:=oARQ:FIELDGET("NORMAT")
   aRETU[4]:=oARQ:FIELDGET("FORNECEDO")
   aRETU[5]:=oARQ:FIELDGET("REVI")
   aRETU[6]:=oARQ:FIELDGET("PESOUNI")
   aRETU[7]:=oARQ:FIELDGET("CODIGOINT")
   aRETU[8]:=oARQ:FIELDGET("CODIPI")
   aRETU[9]:=oARQ:FIELDGET("CLASSIPI")
   aRETU[10]:=oARQ:FIELDGET("CLICODINT")
   aRETU[11]:="" //delivery  usadas pela pegmsext
   aRETU[12]:="" //stock usadas pela pegmsext
ENDIF
oARQ:CLOSE()
RETU aRETU






FUNC PEGMS01(cCODIGO AS STRING)
RETU PEGMS("MS01",cCODIGO)	

FUNC PEGMS01X(cCODIGO AS STRING)
RETU PEGMS("MS01X",cCODIGO)	

FUNC PEGMS06(cCODIGO AS STRING,nSEQ AS WORD,nSSQ AS WORD,cCURINI AS STRING,cCURDIR AS STRING)
LOCAL aRETU:={.F.,""}
LOCAL oARQ AS USEREDE
LOCAL aDAD AS ARRAY
IF IsNil(cCODIGO)
     RETU aRETU
ENDIF
IF IsNil(nSEQ)
   RETU aRETU
ENDIF
IF IsNil(nSSQ)
   RETU aRETU
ENDIF
aDAD:={cCURINI,"MS06.DBF",cCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:nERRO#0
    RETU aRETU
ENDIF
oARQ:GOTOP()
IF oARQ:SEEK(PadR(cCODIGO,24)+Str(nSEQ,3)+Str(NSSQ,3))
   aRETU[1]:=.T.
   aRETU[2]:=oARQ:FIELDGET("DESCRI")
ENDIF
oARQ:CLOSE()
RETU aRETU

FUNCTION PEGMSEXT(cCODIGO,lGMFI)
LOCAL aDAD AS ARRAY
LOCAL aGMFI AS ARRAY
LOCAL cPRODBUS
aDAD:={.F.,"","",0,"",0,"","","","","",""} //11 delivery 12-//stock usadas na pegmsext
IF ValType(lGMFI)#"L"
   lGMFI:=.T.
ENDIF
cCODIGO:=AllTrim(cCODIGO)
aDAD:=PEGMS01(cCODIGO)
IF ! aDAD[1]
   aDAD:=PEGMS01X(cCODIGO)
ENDIF
IF ! aDAD[1] ///tenta com o ponto GM	99.999.999
   cprodBUS:=SubStr( cCODIGO, 1, 2 ) + "." + SubStr( cCODIGO, 3, 3 ) + "." + SubStr( cCODIGO, 6, 3 )
   aDAD:=PEGMS01(cPRODBUS)
   IF ! aDAD[1]
      aDAD:=PEGMS01X(cPRODBUS)
   ENDIF
ENDIF
IF ! aDAD[1] //tenta com o ponto electrolux 999.99999
   cprodBUS:=SubStr( cCODIGO, 1, 3 ) + "." + SubStr( cCODIGO, 4 )
   aDAD:=PEGMS01(cPRODBUS)
   IF ! aDAD[1]
      aDAD:=PEGMS01X(cPRODBUS)
   ENDIF
ENDIF
IF lGMFI
   aGMFI:=PEGGMFI(cCODIGO)
   IF ! aGMFI[1]
      aGMFI:=PEGGMFI(TIRAOUT(cCODIGO)) //Tenta sem tracos
   ENDIF
   IF aGMFI[1]
  	  aDAD[1]:=.T.
      IF ! Empty(aGMFI[2]) .AND. Empty(aDAD[2])
          aDAD[2]:=aGMFI[2]	
      ENDIF
      IF ! Empty(aGMFI[3]) .AND. Empty(aDAD[11])
         aDAD[11]:=aGMFI[3]	
      ENDIF
      IF ! Empty(aGMFI[4]) .AND. Empty(aDAD[12])
          aDAD[12]:=aGMFI[4]
      ENDIF
   ENDIF	
ENDIF
RETU aDAD


