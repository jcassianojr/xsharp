PARTIAL CLASS TABORCA_Page4
METHOD ListBoxSelect(oControlEvent) 
	LOCAL oControl AS Control
    LOCAL aRESP AS ARRAY
	oControl := IIf(oControlEvent == NULL_OBJECT, NULL_OBJECT, oControlEvent:Control)
	SUPER:ListBoxSelect(oControlEvent)
	//Put your changes here
	DO CASE
	       CASE oCONTROL:NAMESYM==#SETOR
                             aRESP:=PEGMP05(SELF:SERVER:SETOR,ZCURINI,ZCURDIR)
                             IF aRESP[1]=.T.
                                  SELF:SERVER:RESPO:=aRESP[2]
                                  SELF:SERVER:CARGO:=aRESP[3]
                             ENDIF
	ENDCASE
	
	RETURN NIL


METHOD comboPEGMP05()
RETU PEGCOMBO("MP05.DBF","DESCRI","CODIGO")


END CLASS
