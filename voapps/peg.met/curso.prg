FUNC PEGCUR(cCODIGO)
LOCAL aRETU:={.F.,"","",0,""}
LOCAL aDAD,aCOM AS ARRAY
LOCAL oARQ AS USEREDE
IF IsNil(cCODIGO)
   RETU aRETU
ENDIF
aDAD:={zCURINI,"CURSO.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oARQ:=USEREDE{aDAD,,,,aCOM}
IF oARQ:nERRO=0
   oARQ:GOTOP()
    IF oARQ:SEEK(cCODIGO)
       aRETU[1]:=.T.
       aRETU[2]:=oARQ:FIELDGET("DESCUR")
       aRETU[3]:=oARQ:FIELDGET("CERT")
       aRETU[4]:=oARQ:FIELDGET("CARGA")
       aRETU[5]:=oARQ:FIELDGET("TIPCUR")
    ENDIF
    oARQ:CLOSE()
ENDIF
RETU aRETU


