FUNC PEGME01(cCODIGO AS STRING,cCURINI AS STRING,cCURDIR AS STRING)
LOCAL aRETU:={.F.,"","","","","","",""}
LOCAL oARQ AS USEREDE
LOCAL aDAD AS ARRAY
IF IsNil(cCODIGO)
   RETU aRETU
ENDIF
aDAD:={cCURINI,"ME01.DBF",cCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:nERRO#0
    RETU aRETU
ENDIF
oARQ:GOTOP()
IF oARQ:SEEK(cCODIGO)
   aRETU[1]:=.T.
   aRETU[2]:=oARQ:FIELDGET("NOME")
   aRETU[3]:=oARQ:FIELDGET("CONTABIL")
   aRETU[4]:=oARQ:FIELDGET("SETOR")
   aRETU[5]:=oARQ:FIELDGET("FABRICANTE")
   aRETU[6]:=oARQ:FIELDGET("MODELO")
   aRETU[7]:=oARQ:FIELDGET("GRUPO")
   aRETU[8]:=oARQ:FIELDGET("CODMP01")
ENDIF
oARQ:CLOSE()
RETU aRETU



