﻿FUNCTION GRVVIAREV(nOV,cREV,cOPR,cDESC)
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
aDAD:={zCURINI,"VIAREV.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU .F.
ENDIF
oSERVER:APPEND()
oSERVER:FIELDPUT("OV",nOV)
oSERVER:FIELDPUT("REV",cREV)
oSERVER:FIELDPUT("DATA",Today())
oSERVER:FIELDPUT("HORA",Time())
oSERVER:FIELDPUT("OPR",cOPR)
oSERVER:FIELDPUT("MOTIVO",cDESC)
oSERVER:FIELDPUT("USUARIO",ZUSER)
oSERVER:CLOSE()



FUNC MARR(cARQ)
LOCAL aRETU:={}
LOCAL aDAD AS ARRAY
LOCAL oARQ AS  USEMANA5
aDAD:={zCURINI,cARQ,zCURDIR,aDIR}
oARQ:=USEMANA5{aDAD}
IF oARQ:USED
   oARQ:GOTOP()
   WHILE ! OARQ:EOF
    	IF cARQ="MP01"
           AAdd(aRETU,{Str(oARQ:FIELDGET("CODFOLHA"))+" "+oARQ:FIELDGET("CODIGO")+" "+AllTrim(oARQ:FIELDGET("NOME"))+" "+AllTrim(oARQ:FIELDGET("NOM2")),oARQ:FIELDGET("CODIGO")})
        ELSE
           AAdd(aRETU,{oARQ:FIELDGET("CODIGO")+" "+AllTrim(oARQ:FIELDGET("NOME"))+" "+AllTrim(oARQ:FIELDGET("NOM2")),oARQ:FIELDGET("CODIGO")})
        ENDIF
         oARQ:SKIP()
   ENDDO
   oARQ:CLOSE()
ENDIF
RETU aRETU




FUNC PEGICMS(cUF)
LOCAL nICMS AS FLOAT
LOCAL aDAD AS ARRAY
LOCAL oSERVER AS USEREDE
nICMS:=0
aDAD:={zCURINI,"MD05.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU 0
ENDIF
oSERVER:GOTOP()
IF oSERVER:SEEK(cUF)
   nICMS:=oSERVER:FIELDGET("ALIQUOTA")	
ENDIF	
RETU nICMS

FUNC PEGMARKUP	
LOCAL oSERVER AS USEREDE
LOCAL nMAR AS FLOAT
LOCAL aDAD AS ARRAY
nMAR:=0
aDAD:={zCURINI,"VMARK.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU nMAR
ENDIF
oSERVER:GOTOP()
WHILE ! oSERVER:EOF
 	nMAR+=oSERVER:FIELDGET("PERCE")
    oSERVER:SKIP()
ENDDO
oSERVER:CLOSE()
RETU nMAR

FUNC TRANSFER(aORI,aDES,cCODIGO,lREV,lNEW,lDEL)
LOCAL oSERVER,oSERVE2,oSERVE3 AS USEREDE
LOCAL dSERVER,dSERVE2,dSERVE3 AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL nOV,nOVNEW AS DWORD
LOCAL cREV,cREVNEW,cCAMPO AS STRING
LOCAL nREV  AS DWORD
LOCAL nFIELD,J AS WORD
LOCAL nVFERID,nCPIS,nCFIN AS FLOAT
LOCAL cCLIENTE,cPISCON AS STRING



aDAD:={zCURINI,aORI[1],zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU .F.
ENDIF
aDAD:={zCURINI,aORI[2],zCURDIR}
oSERVE2:=USEREDE{aDAD}
IF oSERVE2:nERRO#0
	oSERVER:Close() //Fecha Master
   RETU .F.
ENDIF
aDAD:={zCURINI,aORI[3],zCURDIR}
oSERVE3:=USEREDE{aDAD}
IF oSERVE3:nERRO#0
	oSERVER:Close() //Fecha Master
	oSERVE2:CLOSE()
   RETU .F.
ENDIF
aDAD:={zCURINI,aDES[1],zCURDIR}
dSERVER:=USEREDE{aDAD}
IF dSERVER:nERRO#0
	oSERVER:Close() //Origem
	oSERVE2:CLOSE()
	oSERVE3:CLOSE()
   RETU .F.
ENDIF
aDAD:={zCURINI,aDES[2],zCURDIR}
dSERVE2:=USEREDE{aDAD}
IF dSERVE2:nERRO#0
	oSERVER:Close() //Fecha Origem
	oSERVE2:CLOSE()
	oSERVE3:CLOSE()	
	dSERVER:Close() //Fecha Destino
   RETU .F.
ENDIF
aDAD:={zCURINI,aDES[3],zCURDIR}
dSERVE3:=USEREDE{aDAD}
IF dSERVE3:nERRO#0
	oSERVER:Close() //Fecha Origem
	oSERVE2:CLOSE()
	oSERVE3:CLOSE()	
	dSERVER:Close() //Fecha Destino
	dSERVE2:CLOSE()
   RETU .F.
ENDIF
oSERVER:SETORDER(2) //Codigo
oSERVER:GOTOP()
IF ! oSERVER:sEEK(cCODIGO)
	alert("Produto Não Cadastrado","Erro Item")
	oSERVER:Close() //Fecha Origem
	oSERVE2:CLOSE()
	oSERVE3:CLOSE()	
	dSERVER:Close() //Fecha Destino
	dSERVE2:CLOSE()
	dSERVE3:CLOSE()	
   RETU .F.	
ENDIF	
nOV:=oSERVER:FIELDGET("OV")
cREV:=oSERVER:FIELDGET("REV")
nOVNEW:=nOV
cREVNEW:=cREV
IF lNEW
   dSERVER:GoBottom()
   nOVNEW:=dSERVER:FIELDGET("OV")
   nOVNEW:=nOVNEW+1
ENDIF	
IF lREV	
   IF Empty(Crev)
	  cREVNEW:="A"	
   ELSE		
  	  nREV:=Asc(cREV)
	  nREV:=nREV+1
	  cREVNEW:=CHR(nREV)	
   ENDIF
ENDIF	
nFIELD:=dSERVER:FCOUNT
dSERVER:Append()
FOR J:=1 TO nFIELD
	cCAMPO:=dSERVER:FieldName(J)
    dSERVER:FIELDPUT(cCAMPO,oSERVER:FIELDGET(cCAMPO))
NEXT J
dSERVER:FIELDPUT("OV",nOVNEW)
dSERVER:FIELDPUT("REV",CREVNEW)
dSERVER:FIELDPUT("CODIGO",cCODIGO)
IF aDES[1]="VPORC.DBF"
   GRVVIAREV(oSERVER:FIELDGET("VIABILI"),oSERVER:FIELDGET("OVREV"),"P","Estimativa Transferida Planilha")

ENDIF	
IF lDEL
   oSERVER:Delete()
ENDIF
DO CASE
   CASE aDES[1]="VPORC.DBF" .OR. aDES[1]="ESP.DBF" //Planilha ou Revisao
   	    dSERVER:FIELDPUT("ELANUM",0)
   	    dSERVER:FIELDPUT("ELANOM","")
   	    dSERVER:FIELDPUT("ELADAT",CToD(Space(8)))
   	    dSERVER:FIELDPUT("ELAHOR","")
   CASE aDES[1]="ESF.DBF"
	  	dSERVER:FIELDPUT("ELANOM",ZNOMEFOLHA)
   	    dSERVER:FIELDPUT("ELANUM",zfolha)
   	    dSERVER:FIELDPUT("ELADAT",Today())
   	    dSERVER:FIELDPUT("ELAHOR",Time())
ENDCASE
IF aDES[1]="VPORC.DBF"
   nVFERID:=Val(PEGINIVAL(ZCURINI,"VALORES","VFERID"))
   cPISCON:=PEGINIVAL(ZCURINI,"VALORES","PISCON")
//   nPIS:=Val(PEGINIVAL(ZCURINI,"VALORES","PIS"))
//   nFIN:=Val(PEGINIVAL(ZCURINI,"VALORES","CONFINS"))
   dSERVER:FIELDPUT("PMAK",PEGMARKUP())	
   dSERVER:FIELDPUT("VFERID",nVFERID)
   dSERVER:FIELDPUT("PRRJ",1)
   dSERVER:FIELDPUT("PLUC",10)
   dSERVER:FIELDPUT("TIPOIMP","3") //Estimativa de Processo
   dSERVER:FIELDPUT("lICM",.T.)
   dserver:FIELDPUT("PISCON",cPISCON)
   cCLIENTE:=AllTrim(Str(dSERVER:FIELDGET("CLIENTE")))
   nCPIS:=Val(PEGINIVAL(ZCURINI,cCLIENTE,"PIS"))
   nCFIN:=Val(PEGINIVAL(ZCURINI,cCLIENTE,"CONFINS"))
   IF nCPIS>0
      Dserver:FIELDPUT("ppis",nCPIS)
   ENDIF
   IF nCFIN>0
      Dserver:FIELDPUT("pcon",nCFIN)
   ENDIF
ENDIF	
oSERVER:CLOSE()
dSERVER:CLOSE()

nFIELD:=dSERVE2:FCOUNT
oSERVE2:SETORDER(1) //OV
oSERVE2:GOTOP()
oSERVE2:SEEK(nOV)
WHILE oSERVE2:FIELDGET("OV")=nOV .AND. ! oSERVE2:EoF
   dSERVE2:Append()
   FOR J:=1 TO nFIELD
       cCAMPO:=dSERVE2:FieldName(J)
       dSERVE2:FIELDPUT(cCAMPO,oSERVE2:FIELDGET(cCAMPO))
   NEXT J
   dSERVE2:FIELDPUT("OV",nOVNEW)
//   dSERVE2:FIELDPUT("CODIGO",cCODIGO)
   IF lDEL
  	  oSERVE2:Delete()
   ENDIF	
   oSERVE2:SKIP()
ENDDO	
oSERVE2:CLOSE()
dSERVE2:CLOSE()

nFIELD:=dSERVE3:FCOUNT
oSERVE3:SETORDER(1) //OV
oSERVE3:GOTOP()
oSERVE3:SEEK(nOV)
WHILE oSERVE3:FIELDGET("OV")=nOV .AND. ! oSERVE3:EoF
   dSERVE3:Append()
   FOR J:=1 TO nFIELD
       cCAMPO:=dSERVE3:FieldName(J)
       dSERVE3:FIELDPUT(cCAMPO,oSERVE3:FIELDGET(cCAMPO))
   NEXT J
   dSERVE3:FIELDPUT("OV",nOVNEW)
//   dSERVE3:FIELDPUT("CODIGO",cCODIGO)
   IF lDEL
  	  oSERVE3:Delete()
   ENDIF	
   oSERVE3:SKIP()
ENDDO	
oSERVE3:CLOSE()
dSERVE3:CLOSE()
RETU .T.

FUNC VS3PRECO(cTIPOENT AS STRING,cCODCOMP AS STRING,lULTIMO AS LOGIC) AS ARRAY
LOCAL cARQ AS STRING
LOCAL cVAL,aDAD AS ARRAY
LOCAL oDBF AS USEMANA5
cVAL:={0,"",0,0,CToD(Space(8)),"",""}
//1Preco,2Nome,3RedIcm,4CodRed,5UltData,6UltUnid,7Cognome
IF Empty(cTIPOENT)
   RETU Cval
ENDIF	
IF Empty(cCODCOMP)
   RETU Cval
ENDIF	
DO CASE
	CASE cTIPOENT="M" ; cARQ:="MU01" //MP
	CASE cTIPOENT="C" ; cARQ:="MT01" //Componente
	CASE cTIPOENT="E" ; cARQ:="MP01" //Equipamentos
	CASE cTIPOENT="H" ; cARQ:="MP02" //Homem
	CASE cTIPOENT="T" ; cARQ:="MP03" //Terceiros
	CASE cTIPOENT="I" ; cARQ:="ETI" //ETI
	OTHERWISE ; cARQ:=""
ENDCASE
IF Empty(cARQ)
   RETU cVAL
ENDIF
aDAD:={zCURINI,cARQ,zCURDIR,aDIR}
oDBF:=USEMANA5{aDAD}
IF oDBF:USED
   oDBF:SETORDER(1)
   oDBF:GOTOP()
   IF oDBF:SEEK(AllTrim(cCODCOMP))
      DO CASE
         CASE cTIPOENT="I" //Terceiro
    		  cVAL[2]:=ODBF:FIELDGET("NOME")
         CASE cTIPOENT="T" //Terceiro
   	    	  cVAL[1]:=ODBF:FIELDGET("ULTPRC")
    		  cVAL[2]:=ODBF:FIELDGET("NOME")
    		  cVAL[3]:=oDBF:FIELDGET("REDICM")
  	    	  cVAL[5]:=ODBF:FIELDGET("ULTDATA")
  	    	  cVAL[6]:=ODBF:FIELDGET("ULTUND")
         CASE cTIPOENT="E" //Equipamento
	      	  cVAL[1]:=oDBF:FIELDGET("VALOR")
	      	  IF ! Empty(Odbf:FIELDGET("COGCUSTO"))
     			 cVAL[2]:=ODBF:FIELDGET("COGCUSTO")
     	      ELSE
                 cVAL[2]:=ODBF:FIELDGET("NOME")
              ENDIF		
    		  cVAL[4]:=oDBF:FIELDGET("CODFOLHA")
              cVAL[7]:=oDBF:FIELDGET("COGNOME")
         CASE cTIPOENT="H" //Homem
	     	  cVAL[1]:=ODBF:FIELDGET("VALORC")
    		  cVAL[2]:=ODBF:FIELDGET("NOME")
    		  cVAL[4]:=oDBF:FIELDGET("CODFOLHA")
	     OTHERWISE //Materia Prima Componente
	      	  cVAL[1]:=ODBF:FIELDGET("ULTPRC")
    		  cVAL[2]:=ODBF:FIELDGET("NOME")
  	    	  cVAL[5]:=ODBF:FIELDGET("ULTDATA")
  	    	  cVAL[6]:=ODBF:FIELDGET("ULTUND")
      ENDCASE
   ENDIF
ENDIF
RETU cVAL


