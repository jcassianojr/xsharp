FUNCTION VALCEI(wk_cei)
//IF LastKey()=K_UP.OR.LastKey()=K_DOWN  && retorna caso seta para cima ou baixo
//   RETURN .t.
//ENDIF
LOCAL VER_DV AS LOGIC
LOCAL CEI AS ARRAY
LOCAL WK_STR AS STRING
LOCAL X,wk_val_cal,wk_cal,wk_val_du,wk_dv
IF Empty( WK_CEI )
   alert( "Numero Não Informado" )
   RETU .F.
ENDIF
ver_dv := .F.
CEI:={7,4,1,8,5,2,1,6,3,7,4}
IF Val (wk_cei) = 0
   alert(' Codigo do cei invalido')
ELSE
   wk_str := Trim (wk_cei)
   x := 1
   wk_val_cal := 0
   IF wk_str = ' '
      alert(' Codigo do cei invalido')
   ELSE
      IF Val (SubStr (wk_str, 1, 2)) < 2  .or. Val (SubStr (wk_str, 1, 2)) > 29
         alert(' Codigo do cei invalido ')
      ELSE
         IF Val (SubStr (wk_str, 11, 1)) > 0  .and. Val (SubStr (wk_str, 11, 1)) < 6
            alert(' Codigo do cei invalido ')
         ELSE
            DO WHILE x < 12
               wk_cal := Val (SubStr (wk_str, x, 1)) * cei [x]
               wk_val_cal := wk_val_cal + wk_cal
               x := x + 1
            ENDDO
            wk_cal := Str (wk_val_cal, 3)
            wk_val_du := Val (SubStr (wk_cal, 2, 1)) + Val (SubStr (wk_cal, 3, 1))
            wk_dv := Val (SubStr (Str (wk_val_du, 2), 2, 1))
            wk_dv := Str (10 - wk_dv, 2)
            wk_dv := SubStr (wk_dv, 2, 1)
            IF wk_dv = SubStr (wk_cei, 12, 1)
               ver_dv := .T.
            ELSE
               alert(' Codigo do cei invalido ')
            ENDIF
         ENDIF
      ENDIF
   ENDIF
ENDIF
RETURN ver_dv



