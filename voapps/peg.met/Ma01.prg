FUNC PEGMA01(nCLIENTE,cCURINI,cCURDIR)
LOCAL aRETU:={.F.,"","","","",""}
LOCAL oARQ AS USEREDE
LOCAL aDAD AS ARRAY
IF IsNil(nCLIENTE)
     RETU aRETU
ENDIF
aDAD:={cCURINI,"MA01.DBF",cCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:nERRO#0
    RETU aRETU
ENDIF
oARQ:GOTOP()
IF oARQ:SEEK(nCLIENTE)
   aRETU[1]:=.T.
   aRETU[2]:=oARQ:FIELDGET("NOME")
   aRETU[3]:=oARQ:FIELDGET("COGNOME")
   aRETU[4]:=oARQ:FIELDGET("COMPRADOR")
   aRETU[5]:=oARQ:FIELDGET("ESTADO")
   aRETU[6]:=oARQ:FIELDGET("CODIGOINT")
ENDIF
oARQ:CLOSE()
RETU aRETU





