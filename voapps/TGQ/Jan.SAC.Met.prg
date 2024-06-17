PARTIAL CLASS JSAC
METHOD ALTERAR  
IF SELF:oSFJSACI:SERVER:FIELDGET("SAC")=0
	alert("Inclua Um Item Primeiro")
	RETURN .f.
ENDIF	
SELF:oSFJSACI:VIEWFORM()

METHOD ANTERIOR 
SELF:oSFJSACI:Browser:SuspendUpdate()
SELF:oSFJSACI:SkipPREVIOUS()
IF SELF:oSFJSACI:Server:BOF
	SELF:oSFJSACI:SkipNEXT()
ENDIF
SELF:oSFJSACI:Browser:RestoreUpdate()

METHOD APPEND() 
LOCAL nSAC AS DWORD
SELF:SERVER:SUSPENDNOTIFICATION()
SELF:oSFJSACI:SERVER:SUSPENDNOTIFICATION()
SELF:server:setorder(1)
SELF:server:gobottom()
nSAC:=SELF:Server:SAC
nSAC++
SUPER:append()
SELF:SERVER:FIELDPUT("SAC",nSAC)
SELF:SERVER:FIELDPUT("DATA",Today())
SELF:SERVER:FIELDPUT("INCUSER",ZUSER)
SELF:SERVER:FIELDPUT("INCDATA",Today())
SELF:oSFJSACI:SERVER:resetnotification()
SELF:oSFJSACI:SERVER:notify(notifyfilechange)
SELF:SERVER:RESETNOTIFICATION()
SELF:SERVER:Notify(notifyfilechange)
ENVIARsac(nSAC,"",0,"")
SELF:oSFJSACI:ViewTable()
RETURN   .t.

METHOD buscasac( ) 
	SELF:KeyFind()
//LOCAL oBUSCA AS XBUSCA
//oBUSCA:=XBUSCA{SELF,"Localizar","Digite o N�"}
//oBUSCA:lMES:=.T.
//oBUSCA:SHOW()
//IF oBUSCA:lOK
//   SELF:SERVER:SETORDER(1)
//   SELF:SERVER:GOTOP()
//   SELF:SERVER:SEEK(Val(oBUSCA:cBUSCA))
//ENDIF

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("SAC","SAC")		

METHOD DELETE() 
IF MDG("Apagar Registro") .AND. SELF:SERVER:LOCKcurrentrecord()
   SELF:SERVER:SUSPENDNOTIFICATION()
   SELF:oSFJSACI:SERVER:SUSPENDNOTIFICATION()
   SELF:oSFJSACI:SERVER:gotop()
   WHILE ! SELF:oSFJSACI:SERVER:eof
	 	SELF:oSFJSACI:SERVER:delete()
	 	SELF:oSFJSACI:SERVER:skip()	
      ENDDO
	SELF:oSFJSACI:SERVER:resetnotification()
	SELF:oSFJSACI:SERVER:notify(notifyfilechange)
	SELF:server:delete()
	SELF:server:unlock()
	SELF:SERVER:RESETNOTIFICATION()
	SELF:SERVER:Notify(notifyfilechange)
	SELF:SERVER:SKIPEX(-1)
	SELF:oSFJSACI:ViewTable()
ENDIF	

METHOD DUPLICAR() 
LOCAL nSAC,NREG,NFIELD,NFIELDI AS DWORD  //NSACOLD
LOCAL J,K AS WORD
LOCAL aDADOS,aITENS,aTMP AS ARRAY
LOCAL cCAUSA AS STRING
nFIELD:=SELF:SERVER:FCOUNT
nREG:=SELF:Server:recno
//nSACOLD:=SELF:SERVER:FIELDGET("SAC")
aDADOS:={}
FOR J:=1 TO nFIELD
    AAdd(aDADOS,SELF:SERVER:FIELDGET(J))
NEXT J
aITENS:={}
nFIELDI:=SELF:oSFJSACI:SERVER:FCOUNT
SELF:oSFJSACI:SERVER:gotop()
WHILE ! SELF:oSFJSACI:SERVER:eof
    aTMP:={}
    FOR J:=1 TO nFIELDI
        AAdd(aTMP,SELF:oSFJSACI:SERVER:FIELDGET(J))
    NEXT J
    AAdd(aITENS,aTMP)
 	SELF:oSFJSACI:SERVER:skip()	
ENDDO
SELF:server:setorder(1)
SELF:server:gobottom()
nSAC:=SELF:Server:SAC
nSAC++
SUPER:SERVER:APPEND()
FOR J:=1 TO nFIELD
    SELF:SERVER:FIELDPUT(J,aDADOS[J])
NEXT J
SELF:SERVER:FIELDPUT("SAC",nSAC)
SELF:SERVER:FIELDPUT("DATA",Today())
SELF:SERVER:FIELDPUT("INCUSER",ZUSER)
SELF:SERVER:FIELDPUT("INCDATA",Today())
SELF:server:goto(nREG)
SELF:server:FIELDPUT("nova",nSAC)
FOR K:=1 TO ALen(aITENS)
    SELF:oSFJSACI:SERVER:APPEND()
    FOR J:=1 TO nFIELDI
        SELF:oSFJSACI:SERVER:FIELDPUT(J,aITENS[K][J])
    NEXT J
    SELF:oSFJSACI:SERVER:FIELDPUT("SAC",nSAC)
NEXT K
SELF:SERVER:GOTOP()
SELF:SERVER:GoBottom()
cCAUSA:=AllTrim(SELF:SERVER:DESC01)+Chr(13)+Chr(10)
cCAUSA+="_"+AllTrim(SELF:SERVER:DESC01)+Chr(13)+Chr(10)
cCAUSA+="_"+AllTrim(SELF:SERVER:DESC02)+Chr(13)+Chr(10)	
cCAUSA+="_"+AllTrim(SELF:SERVER:DESC03)+Chr(13)+Chr(10)	
cCAUSA+="_"+AllTrim(SELF:SERVER:DESC04)+Chr(13)+Chr(10)
ENVIARsac(SELF:SERVER:SAC,SELF:SERVER:CODIGO,SELF:SERVER:CLIENTE,cCAUSA)	
RETURN    .t.


METHOD EXCLUIR 
IF  MDG("Apagar Registro") .AND. SELF:oSFJSACI:server:LockCurrentRecord()
	SELF:oSFJSACI:SERVER:SUSPENDNOTIFICATION()
    SELF:oSFJSACI:server:delete()
    SELF:oSFJSACI:server:unlock()
    SELF:oSFJSACI:SERVER:resetnotification()
    SELF:oSFJSACI:SERVER:notify(notifyDELETE)
    SELF:oSFJSACI:Browser:REFRESH()
ENDIF	






METHOD FECHAR() 
LOCAL oJSACFEC AS jsacfec
LOCAL aMAIL AS ARRAY
LOCAL nANTIGO AS DWORD
IF Empty(SELF:SERVER:FIELDGET("REVPF"))
   alert("Necesario Revisar PF Nao Preenchido")
   RETURN .f.
ENDIF	
IF Empty(SELF:SERVER:FIELDGET("REVPC"))
   alert("Necesario Revisar PC Nao Preenchido")
   RETURN .f.
ENDIF	
IF ! Empty(SELF:SERVER:FIELDGET("RESUL"))
   alert("Fechamento J� fornecido")
   RETURN .f.
ENDIF	
IF Empty(SELF:SERVER:FIELDGET("FEMEAREVD"))
   alert("Sem Data Revisao Femea")
   RETURN .f.
ENDIF	
IF SELF:SERVER:FIELDGET("FEMEAREVD")<SELF:SERVER:FIELDGET("DATA")
   alert("Data Revisao Femea Inferior a Sac")
   RETURN .f.
ENDIF	
SELF:server:FIELDPUT("DATAF",Today())
oJsacfec:=Jsacfec{SELF}
oJsacfec:SHOW()
aMAIL:={}
AAdd(aMAIL,"SAC: "+StrTRIM(SELF:SERVER:FIELDGET("sac"),8,0))
AAdd(aMAIL,"Codigo: "+SELF:SERVER:FIELDGET("CODIGO"))
AAdd(aMAIL,"Cliente: "+StrTRIM(SELF:SERVER:FIELDGET("CLIENTE"),8,0))
AAdd(aMAIL,"Resultado: "+IF(SELF:SERVER:FIELDGET("RESUL")="R","Reprovado","Aprovado"))
SELF:oSFJSACI:SERVER:gotop()
WHILE ! SELF:oSFJSACI:SERVER:eof
    AAdd(Amail,AllTrim(SELF:oSFJSACI:SERVER:FIELDGET("ACAO01")))
    IF ! Empty(SELF:oSFJSACI:SERVER:FIELDGET("ACAO02"))
        AAdd(Amail,AllTrim(SELF:oSFJSACI:SERVER:FIELDGET("ACAO02")))
    ENDIF
    IF ! Empty(SELF:oSFJSACI:SERVER:FIELDGET("ACAO03"))
        AAdd(Amail,AllTrim(SELF:oSFJSACI:SERVER:FIELDGET("ACAO03")))
    ENDIF
    IF ! Empty(SELF:oSFJSACI:SERVER:FIELDGET("ACAO04"))
        AAdd(Amail,AllTrim(SELF:oSFJSACI:SERVER:FIELDGET("ACAO04")))
    ENDIF
	SELF:oSFJSACI:SERVER:skip()	
ENDDO
EMAILINT("SAC00003",ZUSER,aMAIL,ZCURINI,zCURDIR)	
IF SELF:SERVER:FIELDGET("RESUL")="R"
   alert("Sac Reprovada - Nova Sac Aberta")	
   nANTIGO:=SELF:SERVER:FIELDGET("sac")
   SELF:DUPLICAR()	
   SELF:SERVER:DATAF:=CToD(Space(8))
   SELF:SERVER:RESUL:=""
   SELF:SERVER:ANTERIOR:=nANTIGO
ENDIF	


METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:SERVER:FIELDGET("CODIGO"))," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETURN .f.
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG",cCODIGO}
OFOTOVIEW:SHOW()	

METHOD INCLUIR 
LOCAL nSAC AS DWORD
nSAC:=SELF:SERVER:FIELDGET("SAC")
SELF:oSFJSACI:SERVER:SUSPENDNOTIFICATION()
SELF:oSFJSACI:SERVER:APPEND()
SELF:oSFJSACI:SERVER:FIELDPUT("SAC",nSAC)
SELF:oSFJSACI:SERVER:commit()
SELF:oSFJSACI:SERVER:resetnotification()
SELF:oSFJSACI:SERVER:notify(notifyappend)
SELF:oSFJSACI:Browser:refresh()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
      FabCenterWindow( SELF )
 RETURN SELF

METHOD PROXIMO 
SELF:oSFJSACI:Browser:SuspendUpdate()
SELF:oSFJSACI:SkipNext()
IF SELF:oSFJSACI:Server:Eof
	SELF:oSFJSACI:SkipPrevious()
ENDIF
SELF:oSFJSACI:Browser:RestoreUpdate()

METHOD PushButton8( ) 
LOCAL cTEXTO AS STRING
LOCAL aCAMPOS AS ARRAY
LOCAL X AS WORD

aCAMPOS:={}
AAdd(aCAMPOS,"ACAO01")
AAdd(aCAMPOS,"ACAO02")
AAdd(aCAMPOS,"ACAO03")
AAdd(aCAMPOS,"ACAO04")
AAdd(aCAMPOS,"ACAO05")
AAdd(aCAMPOS,"ACAO06")
AAdd(aCAMPOS,"ACAO07")
AAdd(aCAMPOS,"ACAO08")
AAdd(aCAMPOS,"ACAO09")
AAdd(aCAMPOS,"ACAO10")

AAdd(aCAMPOS,"INV01")
AAdd(aCAMPOS,"INV02")
AAdd(aCAMPOS,"INV03")
AAdd(aCAMPOS,"INV04")
AAdd(aCAMPOS,"INV05")
AAdd(aCAMPOS,"INV06")
AAdd(aCAMPOS,"INV07")
AAdd(aCAMPOS,"INV08")
AAdd(aCAMPOS,"INV09")
AAdd(aCAMPOS,"INV10")


AAdd(aCAMPOS,"ACM01")
AAdd(aCAMPOS,"ACM02")
AAdd(aCAMPOS,"ACM03")
AAdd(aCAMPOS,"ACM04")
AAdd(aCAMPOS,"ACM05")
AAdd(aCAMPOS,"ACM06")

SELF:SERVER:GOTOP()
WHILE ! SELF:SERVER:EOF
	SELF:oSFJSACI:SERVER:GOTOP()
	WHILE ! SELF:oSFJSACI:serveR:EOf		
       FOR X:=1 TO 26
           cTEXTO:=SELF:oSFJSACI:SERVER:FIELDGET(aCAMPOS[X])
           cTEXTO:=StrTran(cTEXTO,"� O","��O")
           cTEXTO:=StrTran(cTEXTO,"C O","��O")
           cTEXTO:=StrTran(cTEXTO,"DIMENS O","DIMENS�O")
           cTEXTO:=StrTran(cTEXTO,"JOS  NILTON","JOS� NILTON ")
           cTEXTO:=StrTran(cTEXTO,"A N O ","A N�O ")
 		   cTEXTO:=StrTran(cTEXTO,"EXTENS O ","EXTANS�O ")
           cTEXTO:=StrTran(cTEXTO,"PRESS O ","PRESS�O ")
           cTEXTO:=StrTran(cTEXTO,"E N O ","E N�O ")
           cTEXTO:=StrTran(cTEXTO,",N O ",",N�O ")
           cTEXTO:=StrTran(cTEXTO,", N O ",", N�O ")
           cTEXTO:=StrTran(cTEXTO,"REGI O ","REGI�O ")
           SELF:oSFJSACI:SERVER:FIELDPUT(aCAMPOS[X],cTEXTO)
       NEXT X
       SELF:oSFJSACI:server:Skip()
    ENDDO		
    SELF:SERVER:SKIP()
ENDDO	

METHOD TABULAR  
SELF:oSFJSACI:VIEWTABLE()

METHOD Timer() 
   SELF:SERVER:COMMIT()
   SELF:oSFJSACI:SERVER:Commit()


END CLASS
PARTIAL CLASS JSACI
METHOD ListBoxSelect( oControlEvent ) 
        LOCAL aRESP AS ARRAY
	LOCAL oControl AS Control
	oControl := IIf( oControlEvent == NULL_OBJECT, NULL_OBJECT, oControlEvent:Control )
	SUPER:ListBoxSelect( oControlEvent )
	//Put your changes here
        DO CASE
   	       CASE oCONTROL:NAMESYM==#AREA
                             aRESP:=PEGMP05(SELF:SERVER:AREA,ZCURINI,ZCURDIR)
                             IF aRESP[1]=.T.
                                  SELF:SERVER:RESPON:=aRESP[2]
                                  SELF:SERVER:DESARE:=aRESP[4]
                             ENDIF
	ENDCASE

RETURN NIL


METHOD comboPEGMP05() 
RETU PEGCOMBO("MP05.DBF","DESCRI","CODIGO")

END CLASS
PARTIAL CLASS tabsac_pag1
METHOD buscaANT() 
LOCAL nANTERIOR AS DWORD
nANTERIOR:=SELF:server:ANTERIOR
SELF:SERVER:SETORDER(1)
SELF:SERVER:GOTOP()
SELF:SERVER:SEEK(nANTERIOR)
	

METHOD buscanova() 
LOCAL nNOVA AS DWORD
nNOVA:=SELF:server:NOVA
   SELF:SERVER:SETORDER(1)
   SELF:SERVER:GOTOP()
   SELF:SERVER:SEEK(nNOVA)


METHOD cmdrevpc( ) 
IF ! Empty(SELF:SERVER:FIELDGET("RESUL"))
   alert("Fechamento J� fornecido")
   RETURN .f.
ENDIF		
SELF:SERVER:FIELDPUT("REVPC",SIMNAO(SELF:SERVER:FIELDGET("REVPC")))

METHOD cmdrevpf( ) 
IF ! Empty(SELF:SERVER:FIELDGET("RESUL"))
   alert("Fechamento J� fornecido")
   RETURN .f.
ENDIF		
SELF:SERVER:FIELDPUT("REVPF",SIMNAO(SELF:SERVER:FIELDGET("REVPF")))

METHOD esccod 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF ! IsNil(oESC:CODIGO)
    SELF:SERVER:FIELDPUT("CODIGO",oESC:CODIGO)
    SELF:SERVER:FIELDPUT("NOME",oESC:NOME)
ENDIF		

METHOD ESCFOR 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"MA01.DBF"}
oESC:SHOW()	
IF ! IsNil(oESC:NUMERO)
    SELF:SERVER:FIELDPUT("CLIENTE",oESC:NUMERO)
    SELF:SERVER:FIELDPUT("CLINOME",oESC:NOME)
ENDIF

METHOD Femea( ) 
LOCAL oJSACFEM AS jsacfeM
IF ! Empty(SELF:SERVER:FIELDGET("RESUL"))
   alert("Fechamento J� fornecido")
   RETURN .f.
ENDIF	
oJsacFEM:=JsacFEM{SELF}
IF ! Empty(SELF:SERVER:FIELDGET("PF"))
   SELF:oDCPF:Disable()	
ENDIF	
oJsacFEM:SHOW()

	

METHOD Notificar( ) 
LOCAL cCAUSA
cCAUSA:=AllTrim(SELF:SERVER:DESC01)+Chr(13)+Chr(10)
cCAUSA+=" "+AllTrim(SELF:SERVER:DESC01)+Chr(13)+Chr(10)
cCAUSA+=" "+AllTrim(SELF:SERVER:DESC02)+Chr(13)+Chr(10)	
cCAUSA+=" "+AllTrim(SELF:SERVER:DESC03)+Chr(13)+Chr(10)	
cCAUSA+=" "+AllTrim(SELF:SERVER:DESC04)+Chr(13)+Chr(10)	
ENVIARsac(SELF:SERVER:SAC,SELF:SERVER:CODIGO,SELF:SERVER:CLIENTE,cCAUSA)	
RETURN .t.

METHOD btnpegma01 
LOCAL aCLI AS ARRAY	
aCLI:=PEGMA01(SELF:SERVER:CLIENTE,zcurini,zcurdir)
IF aCLI[1]=.T.
   SELF:SERVER:CLINOME:=aCLI[2]
ENDIF

METHOD btnpegmS01 
LOCAL aPRO AS ARRAY	
SELF:SERVER:CODIGO:=AllTrim(SELF:SERVER:CODIGO)
aPRO:=PEGMS01(SELF:SERVER:CODIGO)
IF aPRO[1]=.T. .AND. ! Empty(aPRO[2])
   SELF:SERVER:NOME:=aPRO[2]
ENDIF



END CLASS
