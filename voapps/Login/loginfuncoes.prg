FUNCTION CHECKLOGIN(cPARAM,aARQ,aCOM)
	LOCAL nPOS,nPOS2 AS DWORD
	LOCAL odbf AS USEREDE
	LOCAL aRETU,aUSO AS ARRAY
	aRETU:={.F.,"",0,0,""}
	//ACHOU,USUARIO,IDFOLHA,IDWRPT,NomeFolha
	IF  ValType(cPARAM)#"C"
		RETURN aRETU
    ENDIF		
    nPOS:=At("__$",cPARAM)
    nPOS2:=At("$__",cPARAM)
    IF nPOS=0 .OR. nPOS2=0
   	   RETURN aRETU
   	ENDIF
 	cPARAM:=SubStr(cPARAM,nPOS+3)	
 	cPARAM:=SubStr(cPARAM,1,Len(cPARAM)-3)
	oDBF:=USEREDE{aARQ}
    IF oDBF:nERRO<>0
       RETURN aRETU
	ENDIF
    IF Upper(cPARAM)="ADMIN"
       cPARAM:="SOFTEC"
    ENDIF	
//    alert(cPARAM)
    oDBF:GOTOP()
    WHILE ! ODBF:EOF
       IF ODBF:FIELDGET("USUARIO")=(ENCODE( cPARAM,10,.T.,.T.))
          aRETU[4]:=ODBF:FIELDGET("WRPTNO")
          aRETU[3]:=ODBF:FIELDGET("FOLHANO")
          IF ! Empty(aRETU[3])
          	 aRETU[1]:=.T.
             aRETU[2]:=cPARAM
          ELSE
             alert("Codigo na Folha Não Cadastrado")
          ENDIF
          EXIT
       ENDIF
       ODBF:SKIP()
     ENDDO
     IF ValType(Acom)<>"A"
     	aCOM:={Month(Today()),Year(Today()),1}
     ENDIF	
     aUSO:=PEGMP04(aRETU[3],aARQ[1],aARQ[3],Acom)
     IF aUSO[1]=.T.
      	 IF ! Empty(aUSO[2])
             aRETU[5]:=aUSO[2]
         ELSE
        	aRETU[1]:=.F.
         ENDIF
     ELSE
     	aRETU[1]:=.F.
     ENDIF
     RETURN aRETU


FUNCTION UserName() AS STRING STRICT
LOCAL pszUser AS PSZ
LOCAL dwSize AS DWORD
LOCAL cUser AS STRING
dwSize :=MAX_ALLOC
pszUser :=MemAlloc(dwSize)
IF PTR(_CAST, pszUser) <> NULL_PTR
   GetUserName(PSZUser, @dwSize)
   cUser :=Psz2String(PSZUser)
//   MemFree(PSZUser)
ENDIF
MemFree(PSZUser)
IF IsNil(cUSER)
   cUSER:=PadR(NetName(),8)
ENDIF	
RETURN Upper(cUser)


