﻿FUNC PEGLTIPO(cARQ)
LOCAL aRETU:={}
LOCAL aDAD AS ARRAY
LOCAL oARQ AS  USEREDE
aDAD:={zCURINI,cARQ,zCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:USED
    oARQ:GOTOP()
    WHILE ! OARQ:EOF
          AADD(aRETU,{oARQ:FIELDGET("TIPO"),oARQ:FIELDGET("TIPO")})
          oARQ:SKIP()
    ENDDO
    oARQ:CLOSE()
ENDIF
RETU aRETU





