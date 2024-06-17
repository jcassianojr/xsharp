/*
TEXTBLOCK LAYOUT

FWrite(nHANDLE,PadR("00",2))                01-02 "00" empresa
FWrite(nHANDLE,PadR(cEMPEsa,2))                03-04 "01" "05" empresa
FWrite(nHANDLE,PadR(cCLIENTE,20))           05-24 cod_cliente
 FWrite(nHANDLE,PadR(cCODIGOINT,20))         25-44
 FWrite(nHANDLE,PadR(TIRAOUT(cCODIGO),30))   45-74
 FWrite(nHANDLE,PadR(cPLANTA,7))             75-81
 FWrite(nHANDLE,PadR(TIRAOUT(cDOCA),7))      82-88
 FWrite(nHANDLE,PadR(TIRAOUT(cDOCA),6))      89-94
 FWrite(nHANDLE,StrZero(nVAL/10000,7,0))     95-101
 FWrite(nHANDLE,"000")                       102-104//decimal qtde 3  nao usado
 FWrite(nHANDLE,DToC(dPRG))                  105-112
 FWrite(nHANDLE,cHORA)                       113-117
 FWrite(nHANDLE,Space(4))                    118-121 //milesimo horas nao usado
 FWrite(nHANDLE,PadR(CCLIPRG,32))            122-153 //contrato
 FWrite(nHANDLE,PadR(cCODY,25))              154-178 //Delivery
 FWrite(nHANDLE,PadR(cSTK,35))               179-213 //EStoquista
 FWrite(nHANDLE,"0")


*/
PARTIAL CLASS Jestqint
METHOD buscanum( ) 
	SELF:KEYFIND()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()


METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTIGRP("PCP","")
	

METHOD DELETE() 
IF ! MDG("Apagar Registro") .AND. SELF:SERVER:LockCurrentRecord()
	RETU SELF
ENDIF	
SELF:server:delete()
SELF:server:unlock()
SELF:server:skip(-1)
IF SELF:SERVER:BOF
	SELF:SErVER:GOTOP()
ENDIF	

METHOD porNUM( ) 
	SELF:KeyFind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   	    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()

END CLASS
PARTIAL CLASS jimpedi
METHOD APAGAR(carq) 
LOCAL cPLANTA,cATEPLANTA,cDAPLANTA AS STRING
LOCAL oOSPRG AS USEREDE
LOCAL ADAD AS ARRAY
LOCAL nPOS,nLASTREC AS DWORD
LOCAL nPERC AS INT

cPLANTA:=""
cATEPLANTA:=Repl("Z",12)
IF ! IsNil(SELF:daplanta)
   cDAPLANTA:=SELF:daplanta	
ENDIF	
IF ! IsNil(SELF:ATEplanta)
   cATEPLANTA:=SELF:ATEplanta	
ENDIF	
cDAPLANTA:=AllTrim(cDAPLANTA)
cATEPLANTA:=AllTrim(cATEPLANTA)
aDAD:={zCURINI,cARQ,zCURDIR}
oOSPRG:=USEREDE{aDAD,.F.}
IF oOSPRG:nERRO#0
   RETU SELF
ENDIF

nPOS:=0
nLASTREC:=oOSPRG:RecCount
SELF:POINTER:=POINTER{POINTERHOURGLASS}
oOSPRG:GOTOP()
WHILE ! oOSPRG:EOF
   nPerc := INT(100* nPOS/ nLASTREC)
   SELF:oDcProgBar:Position := nPerc	
   nPOS++
   cPLANTA:=oOSPRG:FIELDGET("PLANTA")
   IF cPLANTA>=CDAPLANTA .AND. cPLANTA<=cATEPLANTA	
      oOSPRG:DELETE()
   ENDIF
   oOSPRG:Skip()
ENDDO
oOSPRG:Pack()
oOSPRG:CLOSE()
SELF:POINTER:=POINTER{POINTERARROW}



METHOD Cancelar( ) 
	SELF:ENDWINDOW()

METHOD CriaArq(cARQ) 
LOCAL aDAD AS ARRAY	
   aDAD:={{"NUMERO","N",8,0},;
          {"PRODUTO","C",24,0},;
          {"PLANTA","C",10,0},;
          {"PROGRAMA","D",8,0},;
          {"QTDE","N",8,0},;
          {"DATAIMP","D",8,0},;
          {"HORAPRG","N",5,2},;
          {"SEQCLIPRG","N",5,0},;
          {"CODIGOINT","C",24,0}}

 	  FErase(cARQ+".DBF")
   	  FErase(cARQ+".CDX")
   	  DbCreate(cARQ,aDAD)
   	  CRIANTX({ZCURINI,cARQ,ZCURDIR})
	
	

METHOD Geralog(cORI,cINI) 
LOCAL oOSPRG,oOSCRT AS USEREDE	
LOCAL aDAD,aCOD,aCTR,aINS AS ARRAY
LOCAL nHANDLE,nHANERR
LOCAL nPOS,nNUMERO AS DWORD
LOCAL cCODIGO,cHORA,cCODX,cCODIGOINT,cCLIPRG,cCODY,cSTK AS STRING
LOCAL dINI,dFIM,dPRG AS DATE


dINI:=CToD(SELF:ODCDINI:TEXTValue)
dFIM:=CToD(SELF:ODCDFIM:TEXTValue)


aDAD:={zCURINI,cORI+".DBF",zCURDIR}
oOSPRG:=USEREDE{aDAD}
IF oOSPRG:nERRO#0
   RETU SELF
ENDIF	
aDAD:={zCURINI,"OSCRT.DBF",zCURDIR}
oOSCRT:=USEREDE{aDAD}
IF oOSCRT:nERRO#0
   oOSPRG:CLOSE()
   RETU SELF
ENDIF

nHANERR:=FCreate("C:\TEMP\X"+DToS(DATE())+".TXT")
oOSPRG:SETORDER(2) //Codigo
aCOD:={}
aCTR:={}
oOSCRT:GOTOP()
WHILE ! oOSCRT:EoF
    cCODIGO:=AllTrim(TIRAOUT(oOSCRT:FIELDGET("CODIGO")))
    oOSPRG:GOTOP()
    IF AScan(aCOD,cCODIGO)=0
       AAdd(aCOD,cCODIGO)
       AAdd(aCTR,{oOSCRT:FIELDGET("CODIGOINT"),oOSCRT:FIELDGET("CODCLI"),oOSCRT:FIELDGET("PEDIDOCLI"),oOSCRT:FIELDGET("DELIVERY"),oOSCRT:FIELDGET("STOCK")})	
    ELSE
        FWrite(nHANERR,"DUP" + PadR(cCODIGO,24))
        FWrite(nHANERR,oOSCRT:FIELDGET("CODIGO"))
        FWrite(nHANERR,Chr(13)+Chr(10))
    ENDIF
    oOSCRT:SKIP()
ENDDO


aINS:={}
oOSCRT:SETORDER(1)

SELF:POINTER:=POINTER{POINTERHOURGLASS}
SetCentury(FALSE)
nHANDLE:=FCreate("C:\TEMP\"+cINI+DToS(DATE())+".TXT")
oOSPRG:GOTOP()
WHILE ! oOSPRG:EoF
   cCODIGO:=AllTrim(TIRAOUT(oOSPRG:FIELDGET("PRODUTO")))

   cCODX:=""
   cCODIGOINT:=""
   cCLIPRG:=""
   cCODY:=""
   cSTK:=""

   nPOS:=AScan(aCOD,cCODIGO)
   IF nPOS>0
      cCODX:="0001"+aCTR[nPOS,2]
      cCODIGOINT:=aCTR[nPOS,1]
      cCLIPRG:=aCTR[nPOS,3]
      cCODY:=aCTR[nPOS,4]
      cSTK:=aCTR[nPOS,5]
   ELSE
      cCODX:="0001"
      FWrite(nHANERR,"X "+ PadR(cCODIGO,24))
      FWrite(nHANERR,oOSPRG:FIELDGET("PRODUTO"))
      FWrite(nHANERR,Chr(13)+Chr(10))
      IF cORI="OSPRH"  .OR. cORI= "OSPRI"
      	 IF AScan(aINS,cCODIGO)=0
      	    AAdd(aINS,cCODIGO)
      	    oOSCRT:GOBOTTOM()
      	    nNUMERO:=oOSCRT:FIELDGET("OS")
      	    nNUMERO++
      	    oOSCRT:Append()
      	    oOSCRT:FIELDPUT("CODIGO",Left(cCODIGO,3)+"."+SubStr(cCODIGO,4))
      	    oOSCRT:FIELDPUT("OS",nNUMERO)
      	    FWrite(nHANERR,"INC "+ PadR(cCODIGO,24))
            FWrite(nHANERR,oOSPRG:FIELDGET("PRODUTO"))
            FWrite(nHANERR,Chr(13)+Chr(10))
         ENDIF
      ENDIF	
   ENDIF

   dPRG:=OOSPRG:FIELDGET("PROGRAMA")
   IF dPRG>=dINI .AND. dPRG<=dFIM
      cHORA:=StrZero(oOSPRG:FIELDGET("HORAPRG"),5,2)
      cHORA:=StrTran(cHORA,".",":")
      FWrite(nHANDLE,PadR(cCODX,24))
      FWrite(nHANDLE,PadR(cCODIGOINT,20))
      FWrite(nHANDLE,PadR(TIRAOUT(cCODIGO),30))
      FWrite(nHANDLE,PadR(oOSPRG:FIELDGET("PLANTA"),7))
      FWrite(nHANDLE,PadR(oOSPRG:FIELDGET("PLANTA"),7))
      FWrite(nHANDLE,PadR(oOSPRG:FIELDGET("PLANTA"),6))
      FWrite(nHANDLE,StrZero(oOSPRG:FIELDGET("QTDE"),7,0))
      FWrite(nHANDLE,"000")
      FWrite(nHANDLE,DToC(dPRG))
      FWrite(nHANDLE,cHORA) //HORA
      FWrite(nHANDLE,Space(4))
      FWrite(nHANDLE,PadR(cCLIPRG,32))
      FWrite(nHANDLE,PadR(cCODY,25))
      FWrite(nHANDLE,PadR(cSTK,35))
      FWrite(nHANDLE,"0")
      FWrite(nHANDLE,Chr(13)+Chr(10))
   ENDIF

   oOSPRG:Skip()
ENDDO	

FClose(nHANDLE)
FClose(nHANERR)
SetCentury(TRUE)
oOSCRT:CLOSE()
oOSPRG:CLOSE()
SELF:POINTER:=POINTER{POINTERARROW}
alert("Concluida")	

METHOD IMPDBFELE() 
LOCAL CARQUIVO,cCODIGO,cDAPLANTA,cPLANTA,cATEPLANTA AS STRING    //ccaminho
LOCAL cTOTREC AS STRING
LOCAL oCDIMP AS DBSERVER	
LOCAL oOSPRH AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL dprg,dINI,dFIM AS DATE     //dimp
LOCAL nVAL AS FLOAT
LOCAL J,nFIELD AS DWORD       //  nrecnoini        x       nsemanas
LOCAL cNOME,cCODCAM AS STRING
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT

IF ! MDG("Iniciar Importação","Confirmação de Processo")
   RETU .F.
ENDIF	

IF SELF:recria
   SELF:CriaArq("OSPRH")	
ENDIF	


	

SELF:POINTER:=POINTER{POINTERHOURGLASS}

cPLANTA:=""
cATEPLANTA:=Repl("Z",12)
IF ! IsNil(SELF:daplanta)
   cDAPLANTA:=SELF:daplanta	
ENDIF	
IF ! IsNil(SELF:ATEplanta)
   cATEPLANTA:=SELF:ATEplanta	
ENDIF	

cDAPLANTA:=AllTrim(cDAPLANTA)
cATEPLANTA:=AllTrim(cATEPLANTA)

CARQUIVO:=FIXSTR(SELF:CAMINHO)

IF ! File(CARQUIVO)
   alert("Falta Arquivo "+CARQuivo,"Erro Abertura")
   RETURN .f.
ENDIF	

IF SELF:ApagarANT
   ZERADBFREDE("OSPRH")
ENDIF



aDAD:={zCURINI,"OSPRH.DBF",zCURDIR}
oOSPRH:=USEREDE{aDAD}
IF oOSPRH:nERRO#0
   RETU SELF
ENDIF



oCDIMP:=DBSERVER{CARQUIVO,.T.,.T.,"DBFCDX"}
IF ! oCDIMP:Used
   alert("Erro abrindo arquivo Importação Tente Mais Tarde")	
   oOSPRH:CLOSE()
   RETURN .f.
ENDIF	
oCDIMP:SuspendNotification()

IF SELF:semordem
   oCDIMP:SETORDER(0)	
ENDIF	


dINI:=CToD(SELF:ODCDINI:TEXTValue)
dFIM:=CToD(SELF:ODCDFIM:TEXTValue)


SELF:oDcPRODUTO:Caption:="Aguarde.."	


AltD()
cTOTREC:="/"+Str(oCDIMP:RecCount)
nFIELD:=ocdimp:FCOUNT


nPOS:=0
nLASTREC:=OCDIMP:RecCount

AltD()
FOR J:=1 TO nFIELD
    cNOME:=OCDIMP:FieldName(J)
    IF At("PART",cNOME)>0 .AND. At("NUMB",cNOME)>0
       cCODCAM:=cNOME
       EXIT
    ENDIF	
NEXT X


oCDIMP:GOTOP()
WHILE ! oCDIMP:EOF	
 	 nPerc := INT(100* nPOS/ nLASTREC)
     SELF:oDcProgBar:Position := nPerc	
  	 nPOS++

	SELF:oDCregistro:Caption:=Str(oCDIMP:RECNO)+cTOTREC
	   cPLANTA:=oCDIMP:FIELDGET("FACTORY")
	   IF ValType(oCDIMP:FIELDGET(cCODCAM))="C"
          cCODIGO:=oCDIMP:FIELDGET(cCODCAM)
       ELSE
       	  cCODIGO:=AllTrim(Str(oCDIMP:FIELDGET(cCODCAM)))
       ENDIF
	   IF cPLANTA>=CDAPLANTA .AND. cPLANTA<=cATEPLANTA		
	   	  SELF:oDCPRODUTO:Caption:=cCODIGO
          FOR J:=1 TO nFIELD
          	  cNOME:=OCDIMP:FieldName(J)
              IF At("/",cNOME)>0 .OR. Val(cNOME)>0
              	 IF ValType(OCDIMP:FIELDGET(J))="C"
              	    nVAL:=Val(OCDIMP:FIELDGET(J))
              	 ELSE
                    nVAL:=OCDIMP:FIELDGET(J)
              	 ENDIF
                 IF nVAL>0
                 	IF At("/",cNOME)>0
                 	   dPRG:=CToD(cNOME)
                 	ELSE
                 	   dPRG:=CToD(SubStr(cNOME,1,2)+"/"+SubStr(cNOME,3,2)+"/"+SubStr(cNOME,5))	
                    ENDIF
                 	IF (dPRG>=dINI .AND. dPRG<=dFIM)	
                       oOSPRH:APPEND()
                       oOSPRH:FIELDPUT("NUMERO",oOSPRH:RECNO)	
                       OOSPRH:FIELDPUT("PRODUTO",cCODIGO)
                       OOSPRH:FIELDPUT("PLANTA",cPLANTA)
                       OOSPRH:FIELDPUT("PROGRAMA",dPRG)
                       oOSPRH:FIELDPUT("dataimp",Today())
                       OOSPRH:FIELDPUT("QTDE",nVAL)
                       OOSPRH:FIELDPUT("HORAPRG",0)
                    ENDIF
                 ENDIF
              ENDIF
          NEXT J
       ENDIF

    oCDIMP:SKIP()
ENDDO	
oCDIMP:CLOSE()
oOSPRH:CLOSE()
SELF:POINTER:=POINTER{}
SELF:ENDWINDOW()	

METHOD IMPMGRDBF(cARQ,cREF) 
LOCAL cARQUIVO,cCODIGO,cDAPLANTA,cPLANTA,cATEPLANTA,cHORA AS STRING
LOCAL cCLIPRG,cCLIOLD,cTOTREC AS STRING
LOCAL oCDIMP AS DBSERVER	
LOCAL oOSPRG,oMA01,oOSCRT AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL dimp,dprg,dINI,dFIM,dIMPI,dIMPF AS DATE
LOCAL nVAL,nHORA AS FLOAT
LOCAL nRECNOINI,nCLIENTE AS DWORD
    LOCAL nLASTREC AS DWORD
    LOCAL nPOS AS DWORD
    LOCAL nPERC AS INT



IF ! MDG("Iniciar Importação","Confirmação de Processo")
   RETU .F.
ENDIF	



IF SELF:recria
   IF cREF="111"	
   	  SELF:CRIAARQ("OSPRG")
   ELSE	
   	  SELF:CRIAARQ("OSPR2")
   ENDIF	
ENDIF	


	

SELF:POINTER:=POINTER{POINTERHOURGLASS}

cPLANTA:=""
cATEPLANTA:=Repl("Z",12)
IF ! IsNil(SELF:daplanta)
   cDAPLANTA:=SELF:daplanta	
ENDIF	
IF ! IsNil(SELF:ATEplanta)
   cATEPLANTA:=SELF:ATEplanta	
ENDIF	

cDAPLANTA:=AllTrim(cDAPLANTA)
cATEPLANTA:=AllTrim(cATEPLANTA)

cARQUIVO:=SELF:CAMINHO

IF ! File(cARQUIVO)
   alert("Falta Arquivo "+Carquivo,"Erro Abertura")
   RETURN .f.
ENDIF	

IF SELF:ApagarANT
   IF cREF="111"	
   	  ZERADBFREDE("OSPRG")
   ELSE	
   	  ZERADBFREDE("OSPR2")
   ENDIF	
ENDIF


aDAD:={zCURINI,cARQ,zCURDIR}
oOSPRG:=USEREDE{aDAD}
IF oOSPRG:nERRO#0
   RETU SELF
ENDIF



oCDIMP:=DBSERVER{cARQUIVO,.T.,.T.,"DBFCDX"}
IF ! oCDIMP:Used
   alert("Erro abrindo arquivo Importação Tente Mais Tarde")	
   oOSPRG:CLOSE()
   RETURN .f.
ENDIF	
oCDIMP:SuspendNotification()


aDAD:={zCURINI,"MA01.DBF",zCURDIR}
oMA01:=USEREDE{aDAD}
IF oMA01:nERRO#0
   oCDIMP:CLOSE()	
   oOSPRG:CLOSE()
   RETU SELF
ENDIF
oMA01:SETORDER(6) //Sisco Planta


aDAD:={zCURINI,"OSCRT.DBF",zCURDIR}
oOSCRT:=USEREDE{aDAD}
IF oOSCRT:nERRO#0
   oCDIMP:CLOSE()	
   oOSPRG:CLOSE()
   oMA01:CLOSE()
   RETU SELF
ENDIF
oOSCRT:setorder(2) //Produto Cliente

IF SELF:semordem
   oCDIMP:SETORDER(0)	
ENDIF	


dINI:=CToD(SELF:ODCDINI:TEXTValue)
dFIM:=CToD(SELF:ODCDFIM:TEXTValue)
dIMPI:=CToD(SELF:ODCDIMPI:TEXTValue)
dIMPF:=CToD(SELF:ODCDIMPF:TEXTValue)


SELF:oDCproduto:Caption:="Aguarde.."	

nPOS:=0
nLASTREC:=oCDIMP:RecCount

oCDIMP:GOTOP()
nRECNOINI:=oCDIMP:RecNo //Trava Evitar Retorno
cTOTREC:="/"+Str(oCDIMP:RecCount)
WHILE ! oCDIMP:EOF	
	
 	nPerc := INT(100* nPOS/ nLASTREC)
    SELF:oDcProgBar:Position := nPerc	
  	nPOS++

	
	SELF:oDCregistro:Caption:=Str(oCDIMP:RECNO)+cTOTREC
	IF cREF="111"
  	   dIMP:=SToD(oCDIMP:FIELDGET("CD111D0004"))
  	ELSE
  	   dIMP:=SToD(oCDIMP:FIELDGET("CD049D0035"))
    ENDIF
	dPRG:=SToD(oCDIMP:FIELDGET("CD"+cREF+"A8024"))
	nHORA:=0
	cHORA:=SubStr(oCDIMP:FIELDGET("CD"+cREF+"A8024"),9)
	IF Len(cHORA)>0
	   nHORA:=Val(cHORA)/100
	ENDIF	
	IF (dPRG>=dINI .AND. dPRG<=dFIM) .AND. (dIMP>=dIMPI .AND. dIMP<=dIMPF)
	   cPLANTA:=AllTrim(oCDIMP:FIELDGET("CD"+cREF+"A0010"))
	   cCLIPRG:=""
	   IF cREF="111"
  	      cCLIPRG:=AllTrim(oCDIMP:FIELDGET("CD"+cREF+"A0009"))	
	   ENDIF	
	   IF cPLANTA>=CDAPLANTA .AND. cPLANTA<=cATEPLANTA	
          oOSPRG:APPEND()
          oOSPRG:FIELDPUT("NUMERO",oOSPRG:RECNO)	
          cCODIGO:=oCDIMP:FIELDGET("CD"+cREF+"A0007")
          IF SELF:Ponto
             cCODIGO:=SubStr( cCODIGO, 1, 2 ) + "." + SubStr( cCODIGO, 3, 3 ) + "." + SubStr( cCODIGO, 6, 3 )
          ENDIF
          SELF:oDCproduto:Caption:=cCODIGO
          OOSPRG:FIELDPUT("PRODUTO",cCODIGO)
          OOSPRG:FIELDPUT("PLANTA",cPLANTA)
          OOSPRG:FIELDPUT("PROGRAMA",dPRG)
          oosprg:FIELDPUT("dataimp",dIMP)
          nVAL:=Val(oCDIMP:FIELDGET("CD"+cREF+"N0025"))
          OOSPRG:FIELDPUT("QTDE",nVAL/10000)
          OOSPRG:FIELDPUT("HORAPRG",nHORA)
          IF ! Empty(cCLIPRG)
          	 nCLIENTE:=0
      	   	 oMA01:GOTOP()
      	   	 IF oMA01:SEEK(cPLANTA)
      	   	    nCLIENTE:=oMA01:FIELDGET("NUMERO")
      	   	 	oOSCRT:gotop()
                IF oOSCRT:SEEK(Str(nCLIENTE,8)+cCodigo)
                   cCLIOLD:=AllTrim(oOSCRT:FIELDGET("PEDIDOCLI"))
                   IF cCLIOLD<>cCLIprg
                      IF MDG("Atualizar "+cCODIGO+" "+cPLANTA+" "+cCLIOLD+"->"+cCLIprg)
                         oOSCRT:FIELDPUT("PEDIDOCLI",cCLIPRG)
                      ENDIF
                   ENDIF
                ENDIF
    	   	 ENDIF
          ENDIF	
       ELSE
          SELF:oDCproduto:Caption:="Aguarde.."
       ENDIF
    ENDIF
    oCDIMP:SKIP()
    IF nRECNOINI=oCDIMP:RecNo
       EXIT
    ENDIF	
ENDDO	
oOSPRG:CLOSE()
oCDIMP:CLOSE()
SELF:POINTER:=POINTER{}

METHOD IMPMGRSQL(cARQ,cREF) 
LOCAL cCODIGO,cDAPLANTA,cPLANTA,cATEPLANTA,cHORA AS STRING
LOCAL cCLIPRG,cSQL,cDOCA,cCODIGOINT,cCODX,cCODY,cSTK AS STRING
LOCAL cCLINOME AS STRING
LOCAL oOSPRG,oMA01,oOSCRT,oMS01,oMS01X AS USEREDE
LOCAL aDAD,aGMFI AS ARRAY
LOCAL dimp,dprg,dINI,dFIM,dIMPI,dIMPF AS DATE
LOCAL nVAL,nHORA AS FLOAT
LOCAL nRECNOINI,nCLIENTE,nOS AS DWORD
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL nLASTREC,nPOS AS DWORD
LOCAL nPERC AS INT
LOCAL nHANDLE,nHANCON
          
          nHANDLE:= NIL
nHANCON:= NIL                           

IF ! MDG("Iniciar Importação","Confirmação de Processo")
   RETU .F.
ENDIF	



IF SELF:recria
   IF cREF="111"	
   	  SELF:CriaArq("OSPRG")
   ELSE	
   	  SELF:CriaArq("OSPR2")
   ENDIF	
ENDIF	


	

SELF:POINTER:=POINTER{POINTERHOURGLASS}

cPLANTA:=""
cATEPLANTA:=Repl("Z",12)
IF ! IsNil(SELF:daplanta)
   cDAPLANTA:=SELF:daplanta	
ENDIF	
IF ! IsNil(SELF:ATEplanta)
   cATEPLANTA:=SELF:ATEplanta	
ENDIF	

cDAPLANTA:=AllTrim(cDAPLANTA)
cATEPLANTA:=AllTrim(cATEPLANTA)

//cARQUIVO:=SELF:CAMINHO


IF SELF:ApagarANT
   IF cREF="111"	
   	  ZERADBFREDE("OSPRG")
   ELSE	
   	  ZERADBFREDE("OSPR2")
   ENDIF	
ENDIF


aDAD:={zCURINI,cARQ,zCURDIR}
oOSPRG:=USEREDE{aDAD}
IF oOSPRG:nERRO#0
   RETU SELF
ENDIF

//abrir

oConn := SQLConnection{}

IF ! oConn:connect("ediw32","sa","")
   alert("Erro na Conecção")
   RETURN .f.
ENDIF	

dINI:=CToD(SELF:ODCDINI:TEXTValue)
dFIM:=CToD(SELF:ODCDFIM:TEXTValue)
dIMPI:=CToD(SELF:ODCDIMPI:TEXTValue)
dIMPF:=CToD(SELF:ODCDIMPF:TEXTValue)

aDAD:={zCURINI,"MA01.DBF",zCURDIR}
oMA01:=USEREDE{aDAD}
IF oMA01:nERRO#0
   oOSPRG:CLOSE()
   RETU SELF
ENDIF
oMA01:SETORDER(6) //Sisco Planta


aDAD:={zCURINI,"OSCRT.DBF",zCURDIR}
oOSCRT:=USEREDE{aDAD}
IF oOSCRT:nERRO#0
   oOSPRG:CLOSE()
   oMA01:CLOSE()
   RETU SELF
ENDIF
oOSCRT:setorder(2) //Produto Cliente

aDAD:={zCURINI,"MS01.DBF",zCURDIR}
oMS01:=USEREDE{aDAD}
IF oMS01:nERRO#0
   oOSPRG:CLOSE()
   oMA01:CLOSE()
   oOSCRT:CLOSE()
   RETU SELF
ENDIF
oMS01:setorder(2)


aDAD:={zCURINI,"MS01X.DBF",zCURDIR}
oMS01X:=USEREDE{aDAD}
IF oMS01X:nERRO#0
   oOSPRG:CLOSE()
   oMA01:CLOSE()
   oOSCRT:CLOSE()
   oMS01:CLOSE()
   RETU SELF
ENDIF
SELF:oDCproduto:Caption:="Aguarde.."	

IF SELF:CHKstk
	cSQL:="SELECT * FROM CD048"
	csql:= csql + " where CD048D0012>='" + DToS(DIMPI)+ "'"
    oreg:= SQLSelect{cSQL,oconn}
    AltD()
    WHILE ! oREG:EOF
		CPLANTA:=AllTrim(oREG:FIELDGET("CD048A0002"))	
        cCODIGO:=oREG:FIELDGET("CD048A0007")	
        IF SELF:Ponto
           cCODIGO:=SubStr( cCODIGO, 1, 2 ) + "." + SubStr( cCODIGO, 3, 3 ) + "." + SubStr( cCODIGO, 6, 3 )
        ENDIF	
        SELF:oDCproduto:Caption:="STK:"+cCODIGO
      	oMA01:GOTOP()
      	IF oMA01:SEEK(cPLANTA)
   	       nCLIENTE:=oMA01:FIELDGET("NUMERO")
           oOSCRT:gotop()
           IF oOSCRT:SEEK(Str(nCLIENTE,8)+cCodigo)
           	  cSTK:=AllTrim(oREG:FIELDGET("CD048A3044"))
           	  Ooscrt:fieldpute("STOCK",cSTK)
           ENDIF	
        ENDIF
        oREG:SKIP()
    ENDDO
    oREG:CLOSE()
ENDIF	

cSQL:="SELECT * FROM CD" + cref
IF cREF="111"
	csql:= csql + " where CD111D0035>='" + DToS(DIMPI)+ "'"
ELSE
    csql:= csql + " where CD049D0035>='" + DToS(DIMPI)+ "'"
ENDIF
oreg:= SQLSelect{cSQL,oconn}




nPOS:=0
nLASTREC:=100

IF SELF:CHKLOG
   SetCentury(FALSE)
   IF cREF="111"
      nHANDLE:=FCreate("C:\TEMP\M"+DToS(DATE())+".TXT")
      nHANCON:=FCreate("C:\TEMP\C"+DToS(DATE())+".TXT")	
   ELSE
      nHANDLE:=FCreate("C:\TEMP\D"+DToS(DATE())+".TXT")	
   ENDIF
ENDIF
nRECNOINI:=0
WHILE ! oREG:EOF
   	  nPerc := INT(100* nPOS/ nLASTREC)
      SELF:oDcProgBar:Position := nPerc	
  	  nPOS++
  	  IF nPOS=101
  	       nPOS:=0
  	  ENDIF

	
    nRECNOINI+=1
	SELF:oDCregistro:Caption:= Str(nRECNOINI,0)
	IF cREF="111"
  	   dIMP:=SToD(oREG:FIELDGET("CD111D0035"))
  	ELSE
  	   dIMP:=SToD(oREG:FIELDGET("CD049D0035"))
    ENDIF
	dPRG:=SToD(oREG:FIELDGET("CD"+cREF+"A8024"))
	nHORA:=0
	cHORA:=SubStr(oREG:FIELDGET("CD"+cREF+"A8024"),9)
	IF Len(cHORA)>0
	   nHORA:=Val(cHORA)/100
	ENDIF	
    IF cREF="049"	 //'diaria
       IF nHORA=0
       	  nHORA:=0.01
       ENDIF	
    ENDIF	
	IF (dPRG>=dINI .AND. dPRG<=dFIM) .AND. (dIMP>=dIMPI .AND. dIMP<=dIMPF)
	   cDOCA:=""	
	   cSTK:=""	
	   IF cREF="111"	
	      CPLANTA:=AllTrim(oREG:FIELDGET("CD111A0002"))	
	      cDOCA:=AllTrim(oREG:FIELDGET("CD111A0021"))	
	      cCODY:=Space(25)
	   ELSE
	      cPLANTA:=AllTrim(oREG:FIELDGET("CD049A0002"))
          cDOCA:=AllTrim(oREG:FIELDGET("CD049A0021"))		
          cCODY:=AllTrim(oREG:FIELDGET("CD049A3018"))		
       ENDIF
	   cCLIPRG:=""
	   IF cREF="111"
  	      cCLIPRG:=AllTrim(oREG:FIELDGET("CD"+cREF+"A0009"))	
	   ENDIF	
	   IF cPLANTA>=CDAPLANTA .AND. cPLANTA<=cATEPLANTA	
          oOSPRG:APPEND()
          oOSPRG:FIELDPUT("NUMERO",oOSPRG:RECNO)	
          cCODIGO:=oREG:FIELDGET("CD"+cREF+"A0007")
          IF SELF:Ponto
             cCODIGO:=SubStr( cCODIGO, 1, 2 ) + "." + SubStr( cCODIGO, 3, 3 ) + "." + SubStr( cCODIGO, 6, 3 )
          ENDIF
          cCODIGOINT:=""
          oMS01:GOTOP()
          IF oMS01:SEEK(cCODIGO)
          	 cCODIGOINT:=oMS01:FIELDGET("CODIGOINT")
          ENDIF	
          IF Empty(cCODIGOINT)
             oMS01X:GOTOP()
             IF oMS01X:SEEK(cCODIGO)
          	    cCODIGOINT:=oMS01X:FIELDGET("CODIGOINT")
             ENDIF	
          ENDIF	

          SELF:oDCproduto:Caption:=cCODIGO
          OOSPRG:FIELDPUT("PRODUTO",cCODIGO)
          OOSPRG:FIELDPUT("PLANTA",cPLANTA)
          OOSPRG:FIELDPUT("PROGRAMA",dPRG)
          oosprg:FIELDPUT("dataimp",dIMP)
          nVAL:=Val(oREG:FIELDGET("CD"+cREF+"N0025"))
          OOSPRG:FIELDPUT("QTDE",nVAL/10000)
          OOSPRG:FIELDPUT("HORAPRG",nHORA)

          nCLIENTE:=0
          cCLINOME:=""
      	  oMA01:GOTOP()
      	  IF oMA01:SEEK(cPLANTA)
      	     nCLIENTE:=oMA01:FIELDGET("NUMERO")
      	     cCLINOME:=oMA01:FIELDGET("NOME")
             oOSCRT:gotop()
             IF oOSCRT:SEEK(Str(nCLIENTE,8)+cCodigo)
                IF cREF="111"	
                	Ooscrt:FIELDPUTe("PEDIDOCLI",cCLIPRG)
                ELSE
                   cCLIPRG:=AllTrim(oOSCRT:FIELDGET("PEDIDOCLI")) //Diaria Pega o Armazenado	
    	   	    ENDIF
    	   	    IF Empty(cSTK)
    	   	       cSTK:=oOSCRT:FIELDGET("STOCK")
     	   	    ELSE
                   OOSCRT:FIELDPUTE("STOCK",cSTK)
                ENDIF
    	   	    IF Empty(cCODY)
    	   	       cCODY:=oOSCRT:FIELDGET("DELIVERY")	
    	   	    ELSE
                   oOSCRT:FIELDPUTE("DELIVERY",cCODY)
    	   	    ENDIF
                IF Empty(cDOCA)
    	   	       cDOCA:=oOSCRT:FIELDGET("DOCA")	
              	ELSE
              	   oOSCRT:FIELDPUTE("DOCA",cDOCA)	
                ENDIF
    	   	 ELSE
                 oOSCRT:setorder(1) //CODIGO
                 oOSCRT:gobottom()
                 nOS:=OOSCRT:FIELDGET("OS")
                 nOS:=nOS+1
                 aGMFI:=PEGGMFI(cCODIGO)
                 oOSCRT:APPEND()
                 oOSCRT:FIELDPUT("OS",nOS)				
                 oOSCRT:FIELDPUT("codigo",cCODIGO)	
                 oOSCRT:FIELDPUT("codigoint",cCODIGOINT)	
                 oOSCRT:FIELDPUT("PEDIDOCLI",cCLIPRG)					
                 oOSCRT:FIELDPUT("CLIENTE",nCLIENTE)					
                 oOSCRT:FIELDPUT("CLINOME",cCLINOME)
                 oOSCRT:FIELDPUT("DELIVERY",cCODY)
                 oOSCRT:FIELDPUT("DOCA",cDOCA)
                 oOSCRT:FIELDPUT("DATA",Today())
                 IF aGMFI[1]
                    oMS01:FIELDPUT("NOME",aGMFI[2])	
                 ENDIF	
                 oOSCRT:setorder(2) //Produto
    	   	 ENDIF
          ENDIF

          IF nCLIENTE>0    //novos Produtos
             oMS01:GOTOP()
             aGMFI:=PEGGMFI(cCODIGO)
             IF ! oMS01:SEeK(cCODIGO)
                oMS01:Append()
                oMS01:FIELDPUT("codigo",cCODIGO)	
	            oMS01:FIELDPUT("codigoint",cCODIGOINT)
                oMS01:FIELDPUT("FORNECEDO",nCLIENTE)	
                oMS01:FIELDPUT("CLIPCP",nCLIENTE)
                IF aGMFI[1]
                   oMS01:FIELDPUT("NOME",aGMFI[2])	
                ENDIF	
             ELSE
              	IF Empty(oMS01:FIELDGET("CLIPCP"))
                   oMS01:FIELDPUTE("CLIPCP",nCLIENTE)
             	ENDIF
              	IF Empty(oMS01:FIELDGET("FORNECEDO"))
             	   oMS01:FIELDPUT("FORNECEDO",nCLIENTE)		
             	ENDIF
               	IF Empty(oMS01:FIELDGET("CODIGOINT"))
 	               oMS01:FIELDPUT("codigoint",cCODIGOINT)
             	ENDIF
               	IF Empty(oMS01:FIELDGET("NOME")) .AND. aGMFI[1]
                   oMS01:FIELDPUT("NOME",aGMFI[2])	
               	ENDIF	
             ENDIF
          ENDIF



          IF SELF:CHKLOG //cPLANTA="72667"
          	 cCODX:="00011005"
          	 DO CASE
	 	        CASE cPLANTA="72669"
                     cCODX:="00011000"
 	 	        CASE cPLANTA="72677"
                     cCODX:="00011000"
 	 	        CASE cPLANTA="72664"
                     cCODX:="00011000"
 	 	        CASE cPLANTA="72668"
                     cCODX:="00011000"
                CASE cPLANTA="72667"
                     cCODX:="00011005"
                CASE cPLANTA="72671"
                     cCODX:="00011005"
                CASE cPLANTA="72480"
                     cCODX:="00011007"
                CASE cPLANTA="72474"
                     cCODX:="00011014"
                CASE cPLANTA="72475"
                     cCODX:="00011009"
          	 	CASE cPLANTA="23765"
                     cCODX:="00011010"
                CASE cPLANTA="72477"
                     cCODX:="00011011"
                CASE cPLANTA="72479"
                     cCODX:="00011012"
                CASE cPLANTA="72443"
                     cCODX:="00011013"
          	 ENDCASE	
             cHORA:=StrZero(NHORA,5,2)
             cHORA:=StrTran(cHORA,".",":")
             FWrite(nHANDLE,PadR(cCODX,24))
             FWrite(nHANDLE,PadR(cCODIGOINT,20))
             FWrite(nHANDLE,PadR(TIRAOUT(cCODIGO),30))
             FWrite(nHANDLE,PadR(cPLANTA,7))
             FWrite(nHANDLE,PadR(TIRAOUT(cDOCA),7))
             FWrite(nHANDLE,PadR(TIRAOUT(cDOCA),6))
             FWrite(nHANDLE,StrZero(nVAL/10000,7,0))
             FWrite(nHANDLE,"000")
             FWrite(nHANDLE,DToC(dPRG))
             FWrite(nHANDLE,cHORA)
             FWrite(nHANDLE,Space(4))
             FWrite(nHANDLE,PadR(CCLIPRG,32))
             FWrite(nHANDLE,PadR(cCODY,25))
             FWrite(nHANDLE,PadR(cSTK,35))
             FWrite(nHANDLE,"0")
             FWrite(nHANDLE,Chr(13)+Chr(10))
          ENDIF
       ELSE
          SELF:oDCproduto:Caption:="Aguarde.."
       ENDIF
    ENDIF
    oREG:SKIP()
ENDDO	
IF SELF:CHKLOG
   FClose(NHANDLE)
   IF cREF="111"	
      FClose(NHANCON)
   ENDIF	
   SetCentury(TRUE)
ENDIF
oOSPRG:CLOSE()
oREG:CLOSE()
oConn:Disconnect()
SELF:POINTER:=POINTER{}
SELF:ENDWINDOW()	

METHOD IMPPEDLX() 
LOCAL oOSPRG,oMS01,oMA01,oOSCRT AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL dPRG AS DATE
LOCAL oConn AS SQLConnection
LOCAL nVAL AS FLOAT
LOCAL oREG AS SQLSelect
LOCAL cSQL,cCODIGO,cPLANTA,cCODIGOINT AS STRING
LOCAL nRECNOINI,nLASTREC,nPOS,nCLIENTE,nOS AS DWORD
LOCAL nPERC AS INT
LOCAL X AS WORD
LOCAL oSTMT AS SQLStatement


IF ! MDG("Iniciar Importação","Confirmação de Processo")
   RETU .F.
ENDIF	



IF SELF:recria
   SELF:CRIAARQ("OSPRS")
ENDIF	

SELF:POINTER:=POINTER{POINTERHOURGLASS}


IF SELF:ApagarANT
   ZERADBFREDE("OSPRS")	
ENDIF


aDAD:={zCURINI,"OSPRS.DBF",zCURDIR}
oOSPRG:=USEREDE{aDAD}
IF oOSPRG:nERRO#0
   RETU SELF
ENDIF


aDAD:={zCURINI,"MA01.DBF",zCURDIR}
oMA01:=USEREDE{aDAD}
IF oMA01:nERRO#0
   oOSPRG:CLOSE()
   RETU SELF
ENDIF


//abrir

oConn := SQLConnection{}

IF ! oConn:connect("ol_logix")
   alert("Erro na Conecção")
   RETURN .f.
ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

dINI:=CToD(SELF:ODCDINI:TEXTValue)
dFIM:=CToD(SELF:ODCDFIM:TEXTValue)



cSQL:=" SELECT tiraout(cnpjcpf(clientes.num_cgc_cpf)) AS cnpjcpf ,clientes.nom_reduzido,pedidos.num_pedido_repres,pedidos.cod_cliente, "
cSQL+="        to_char(ped_itens.prz_entrega) AS entrega,pedidos.num_pedido_cli[1,12],pedidos.cod_empresa, ped_itens.cod_item, "
cSQL+="       (ped_itens.qtd_pecas_solic-(ped_itens.qtd_pecas_atend+ped_itens.qtd_pecas_cancel)) AS saldo,cliente_item.cod_item_cliente "
cSQL+=" FROM ped_itens,pedidos,cliente_item,clientes where ped_itens.cod_empresa=pedidos.cod_empresa "
cSQL+="      AND ped_itens.num_pedido=pedidos.num_pedido  "
cSQL+="      AND (ped_itens.qtd_pecas_solic-(ped_itens.qtd_pecas_atend+ped_itens.qtd_pecas_cancel))>0 "
cSQL+="      AND ped_itens.cod_empresa = cliente_item.cod_empresa  AND pedidos.cod_cliente = cliente_item.cod_cliente_matriz "
cSQL+="      AND ped_itens.cod_item = cliente_item.cod_item "
//clientes com edi
//cSQL+="      AND pedidos.cod_cliente[1,2]<>'10' and  pedidos.cod_cliente[1,2]<>'11' AND  pedidos.cod_cliente[1,2]<>'30' AND "
//cSQL+="          pedidos.cod_cliente[1,2]<>'40' "
cSQL+="      AND pedidos.cod_nat_oper<>999 AND pedidos.cod_nat_oper<>203 AND pedidos.cod_cliente=clientes.cod_cliente "
cSQL+=" order by pedidos.cod_cliente,cliente_item.cod_item_cliente ,ped_itens.prz_entrega "


oreg:= SQLSelect{cSQL,oconn}


SELF:oDCproduto:Caption:="Aguarde.."	
nRECNOINI:=0

nPOS:=0
nLASTREC:=100

WHILE ! oREG:EOF	
 	  nPerc := INT(100* nPOS/ nLASTREC)
     SELF:oDcProgBar:Position := nPerc	
 	  nPOS++
 	  IF nPOS=101
  	       nPOS:=0
  	  ENDIF

    nRECNOINI+=1
	SELF:oDCregistro:Caption:= Str(nRECNOINI,0)
	dPRG:=CToD(oREG:FIELDGET("entrega"))
	IF dPRG<=dFIM
        cCODIGO:=AllTrim(oREG:FIELDGET("cod_item"))
        nVAL:=oREG:FIELDGET("saldo")
        SELF:oDCproduto:Caption:=cCODIGO
           nCLIENTE:=0	
           oOSPRG:APPEND()
           oOSPRG:FIELDPUT("NUMERO",oOSPRG:RECNO)	
           cPLANTA:=FIXSTR(oREG:FIELDGET("num_pedido_repres"))
           IF ! Empty(cPLANTA)
           	  oMA01:SetOrder(6) //Sisco
           	  oMA01:GOTOP()
              IF oMA01:SEEK(cPLANTA)
                 nCLIENTE:=oMA01:FIELDGET("NUMERO")
              ENDIF
           ENDIF
           IF Empty(nCLIENTE)
           	  cPLANTA:=oREG:FIELDGET("cod_cliente")
           	  oMA01:SetOrder(8) //codigo interno cliente(logix)
           	  oMA01:GOTOP()
              IF oMA01:SEEK(cPLANTA)
                 nCLIENTE:=oMA01:FIELDGET("NUMERO")
              ENDIF
           ENDIF
           IF Empty(nCLIENTE) //Busca CNPJ     
           	 NOP
       //    	  cPLANTA:=oREG:FIELDGET("cod_cliente")
       //    	  oMA01:SetOrder(8) //codigo interno cliente(logix)
       //    	  oMA01:GOTOP()
       //       IF oMA01:SEEK(cPLANTA)
       //          nCLIENTE:=oMA01:FIELDGET("NUMERO")
       //       ENDIF
           ENDIF


           OOSPRG:FIELDPUT("PlANTA",cPLANTA)
           OOSPRG:FIELDPUT("CODIGOINT",cCODIGO)
           OOSPRG:FIELDPUT("PROGRAMA",dPRG)
           oosprg:FIELDPUT("dataimp",Today())
           OOSPRG:FIELDPUT("QTDE",Nval)
           OOSPRG:FIELDPUT("CLIENTE",NCLIENTE)

    ELSE
        SELF:oDCproduto:Caption:="Aguarde.."
    ENDIF
    oREG:SKIP()
ENDDO	
oREG:CLOSE()
oConn:Disconnect()
oOSPRG:CLOSE()

//Reabrindo nao estava gravando corretamente
aDAD:={zCURINI,"OSPRS.DBF",zCURDIR}
oOSPRG:=USEREDE{aDAD}
IF oOSPRG:nERRO#0
   RETU SELF
ENDIF
oOSPRG:SETORDER(5) //codigo interno
FOR x:=1 TO 2
  IF X=1	
     aDAD:={zCURINI,"MS01.DBF",zCURDIR}
  ELSE
     aDAD:={zCURINI,"MS01X.DBF",zCURDIR}
  ENDIF
  oMS01:=USEREDE{aDAD}
  IF oMS01:nERRO#0
  	 oOSPRG:CLOSE()
     RETU SELF
  ENDIF
  oMS01:setorder(3) //Codigo Interno
  oOSPRG:GOTOP()
  WHILE ! oOSPRG:EoF
      cCODIGOINT:=AllTrim(oOSPRG:FIELDGET("CODIGOINT"))
      cCODIGO:=""
      SELF:oDCproduto:Caption:=cCODIGOINT
      oMS01:GOTOP()
      IF oMS01:SEEK(cCODIGOINT)
		 cCODIGO:=Oms01:FIELDGET("CODIGO")
      ENDIF
      WHILE cCODIGOINT=AllTrim(oOSPRG:FIELDGET("CODIGOINT")) .and. ! Oosprg:EOF
          IF Empty(oOSPRG:FIELDGET("PRODUTO")) .AND. ! Empty(cCODIGO)
             OOSPRG:FIELDPUT("PRODUTO",CCODIGO)
          ENDIF	
  	      oOSPRG:Skip()
      ENDDO	
  ENDDO
   oMS01:CLOSE()
NEXT X

aDAD:={zCURINI,"OSCRT.DBF",zCURDIR}
oOSCRT:=USEREDE{aDAD}
IF oOSCRT:nERRO#0
   RETU SELF
ENDIF


 oOSPRG:GOTOP()
 WHILE ! oOSPRG:EoF
 	nCLIENTE:=OOSPRG:FIELDGET("CLIENTE")
 	cCODIGO:=OOSPRG:FIELDGET("PRODUTO")
 	cCODIGOINT:=AllTrim(oOSPRG:FIELDGET("CODIGOINT"))
    SELF:oDCproduto:Caption:=cCODIGOINT
    IF ! Empty(nCLIENTE) .AND. ! Empty(cCODIGO)
       oOSCRT:setorder(2) //str(cliente,8)+Produto
       oOSCRT:gotop()
       IF oOSCRT:SEEK(Str(nCLIENTE,8)+cCODIGO)
          oOSCRT:FIELDPUT("DATAIMP",Today())
          IF Empty(oOSCRT:FIELDGET("CODIGOINT"))
             oOSCRT:FIELDPUT("codigoint",cCODIGOINT)
          ENDIF
       ELSE
          oOSCRT:setorder(1) //CODIGO
          oOSCRT:gobottom()
          nOS:=OOSCRT:FIELDGET("OS")
          nOS:=nOS+1
          oOSCRT:APPEND()
          oOSCRT:FIELDPUT("OS",nOS)				
          oOSCRT:FIELDPUT("codigo",cCODIGO)	
          oOSCRT:FIELDPUT("CLIENTE",nCLIENTE)					
          oOSCRT:FIELDPUT("codigoint",cCODIGOINT)	
          oOSCRT:FIELDPUT("DATA",Today())					
   	      oOSCRT:FIELDPUT("DATAIMP",Today())
       ENDIF
    ENDIF
    Oosprg:skip()
ENDDO

oOSCRT:CLOSE()
oOSPRG:CLOSE()

SELF:POINTER:=POINTER{POINTERARROW}
SELF:ENDWINDOW()	

METHOD IMPTXTGM(NTIPO) 
LOCAL aDAD AS ARRAY
LOCAL cARQUIVO,cVAR,cPRODUTO,cPLANTA,cTMP,cCLIOLD,cCLIINT AS STRING
LOCAL cDAPLANTA,cATEPLANTA,cCLIPRG,cCODNOVO,cCLINOME,cHORA,cDOCA AS STRING
LOCAL nLIN,nCLIENTE AS DWORD    //y      nposx
LOCAL dPROGRAMA,dINI,dFIM AS DATE
LOCAL oOSPRG,oOSCRT,oMA01,oMS01 AS USEREDE
LOCAL nQTDE,nHORA
LOCAL lGRAVA AS LOGIC
//LOCAL oBUSCA AS xBUSCA
LOCAL aGMFI AS ARRAY
LOCAL nOS AS DWORD
LOCAL cBUSCA,cVARGRV AS STRING
LOCAL cARQIMP,cCODY,cSTK,cARQEXP,cARQCON AS STRING
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT
LOCAL nCORRIGE
//LOCAL nORIGEM
LOCAL nHANDLE
LOCAL nHANCON
LOCAL nFileSize
LOCAL oVIEW AS JRTF
 
nHANCON:= NIL
nCORRIGE:= NIL
lGRAVA:=.F.


cARQIMP:="OSPR2"
IF NTIPO=2
   cARQIMP:="OSPRG"	
ENDIF	
IF NTIPO=3
   cARQIMP:="OSPRH"	
ENDIF	

IF ! MDG("Iniciar Importação","Confirmação de Processo")
   RETU .F.
ENDIF	

IF SELF:recria
  SELF:CriaArq(cARQIMP)	
ENDIF	


//nNUMERO:=0
cPRODUTO:=""
cPLANTA:=""
dPROGRAMA:=Today()
nQTDE:=0
//dDATAIMP:=Today()
//nHORAPRG:=0
//nPEDCLIITE:=0
dINI:=CToD(SELF:ODCDINI:TEXTValue)
dFIM:=CToD(SELF:ODCDFIM:TEXTValue)
cPLANTA:=""
cATEPLANTA:=Repl("Z",12)
IF ! IsNil(SELF:daplanta)
   cDAPLANTA:=SELF:daplanta	
ENDIF	
IF ! IsNil(SELF:ATEplanta)
   cATEPLANTA:=SELF:ATEplanta	
ENDIF	

cDAPLANTA:=AllTrim(cDAPLANTA)
cATEPLANTA:=AllTrim(cATEPLANTA)


cARQUIVO:=SELF:CAMINHO
IF ! File(cARQUIVO)
   alert("Arquivo Nao Encontrado")	
   RETU .F.
ENDIF	
//nFileSize :=100
nHANDLE:=FOpen(CARQUIVO)
nFileSize := FSeek3(nHandle,0,FS_END)	
nLIN:=nFileSize/214
FSeek3(nHandle,0,FS_SET)								// Goto first Data record
IF SELF:ApagarANT
   ZERADBFREDE(cARQIMP)	
ENDIF
aDAD:={zCURINI,CARQIMP+".DBF",zCURDIR}
oOSPRG:=USEREDE{aDAD}
IF oOSPRG:nERRO#0
   RETU SELF
ENDIF
aDAD:={zCURINI,"MA01.DBF",zCURDIR}
oMA01:=USEREDE{aDAD}
IF oMA01:nERRO#0
   oOSPRG:CLOSE()
   RETU SELF
ENDIF
oMA01:SetOrder(6) //Sisco
aDAD:={zCURINI,"OSCRT.DBF",zCURDIR}
oOSCRT:=USEREDE{aDAD}
IF oOSCRT:nERRO#0
   oMA01:CLOSE()
   oOSPRG:CLOSE() //Fechar Programa
   RETU SELF
ENDIF
oOSCRT:setorder(2) //Produto Cliente
aDAD:={zCURINI,"MS01.DBF",zCURDIR}
oMS01:=USEREDE{aDAD}
IF oMS01:nERRO#0
   oMA01:CLOSE()	
   oOSPRG:CLOSE()
   oOSCRT:CLOSE()
   RETU SELF
ENDIF
oOSCRT:setorder(2) //Produto


SELF:POINTER:=POINTER{POINTERHOURGLASS}


IF NTIPO=1
   cARQEXP:="C:\TEMP\DIARIA_GM_"+DToS(Today())+".TXT"
   cARQCON:="C:\TEMP\CD_"+DToS(DATE())+".TXT"
   nHANCON:=FCreate(cARQCON)	
   nCORRIGE:=FCreate(cARQEXP)
ENDIF
IF NTIPO=2
   cARQEXP:="C:\TEMP\MENSAL_GM_"+DToS(Today())+".TXT"
   cARQCON:="C:\TEMP\CM_"+DToS(DATE())+".TXT"
   nHANCON:=FCreate(cARQCON)	
   nCORRIGE:=FCreate(cARQEXP)	
ENDIF
IF NTIPO=3
   cARQEXP:="C:\TEMP\DIARIA_ELE_"+DToS(Today())+".TXT"
   cARQCON:="C:\TEMP\CD_ELE_"+DToS(DATE())+".TXT"
   nHANCON:=FCreate(cARQCON)	
   nCORRIGE:=FCreate(cARQEXP)	
ENDIF

FWrite(nHANCON,"Arquivo Programacao:"+cARQEXP+Chr(13)+Chr(10))
FWrite(nHANCON,"Checagem Contrato  :"+cARQcon+Chr(13)+Chr(10))

nPOS:=0
nLASTREC:=nLIN

 WHILE !FEof(Nhandle) //FOR Y=1 TO nLIN
	
    nPerc := INT(100* nPOS/ nLASTREC)
    SELF:oDcProgBar:Position := nPerc	
    nPOS++

	SELF:oDCregistro:Caption:=Str(Npos)+"/"+Str(NLIN)	
    cVARGRV:=FReadLine(nHANDLE,215)
    cVAR:=AllTrim(cVARGRV)

    IF ! Empty(cVAR)
       cCODNOVO:=SubStr(CVAR,25,12)	
       cPRODUTO:=SubStr(cVAR,45,8)	

       IF SELF:Ponto
       	  IF NTIPO=1 .OR. NTIPO=2
            cproduto:=SubStr( cproduto, 1, 2 ) + "." + SubStr( cproduto, 3, 3 ) + "." + SubStr( cproduto, 6, 3 )
          ENDIF
       	  IF NTIPO=3
            cproduto:=SubStr( cproduto, 1, 3 ) + "." +  SubStr( cproduto,4 )
          ENDIF
       ENDIF

       cPLANTA:=SubStr(cVAR,75,5)	

	   cTMP:=SubStr(cVAR,95,10)
       nQTDE:=Val(cTMP)
       nQTDE:=nQTDE/1000 //TRES Casas Decimais


       cTMP:=SubStr(cVAR,105,8)	
       Dprograma:=CToD(ctmp)

       cTMP:=SubStr(cVAR,113,5)	
       Ctmp:=StrTran(cTMP,":",".")
       nHORA:=Val(CTMP)

       IF nTIPO=1 .or. Ntipo=3 //'diaria
          IF nHORA=0
       	     nHORA:=0.01
          ENDIF	
       ENDIF	


       cCLIPRG:=SubStr(cVAR,122,8)	

       cDOCA:=SubStr(cVAR,82,7)
       cCODY:=SubStr(cVAR,154,25)
       cSTK:=SubStr(cVAR,179,35)
       Cstk:=StrTran(cstk,"STOCKMAN","")
       Cstk:=StrTran(cstk,"XXXXXXX","")

       nCLIENTE:=0
       cCLINOME:=""
       cCLIINT:=SubStr(cVAR,5,20)
       oMA01:GOTOP()
       IF oMA01:SEEK(cPLANTA)
      	  nCLIENTE:=oMA01:FIELDGET("NUMERO")
   	      cCLINOME:=oMA01:FIELDGET("NOME")
   	      cCLIINT:=oMA01:FIELDGET("CODIGOINT")
       ENDIF

       aGMFI:={.F.,""}
       oMS01:GOTOP()
       IF oMS01:SEeK(cPRODUTO)
          IF Empty(oms01:FIELDGET("CODIGOINT"))
          	 oMS01:FIELDPUT("codigoint",cCODNOVO)
          ELSE
             IF Empty(cCODNOVO)
             	cCODNOVO:=oMS01:FIELDGET("codigoint")
             ENDIF	
          ENDIF
       ELSE
           aGMFI:=PEGGMFI(cPRODUTO)
           oMS01:Append()
           oMS01:FIELDPUT("codigo",cPRODUTO)	
	       oMS01:FIELDPUT("codigoint",cCODNOVO)
           oMS01:FIELDPUT("FORNECEDO",nCLIENTE)	
           oMS01:FIELDPUT("CLIPCP",nCLIENTE)
           IF aGMFI[1]
              oMS01:FIELDPUT("NOME",aGMFI[2])	
           ENDIF	
       ENDIF

       IF (dPROGRAMA>=dINI .AND. dPROGRAMA<=dFIM)
           IF cPLANTA>=CDAPLANTA .AND. cPLANTA<=cATEPLANTA
              cBUSCA:=CPRODUTO+CPLANTA+DToS(dPROGRAMA)
              oOSPRG:SEEK(cBUSCA,TRUE)
              IF cPRODUTO=oOSPRG:FIELDGET("PRODUTO") .AND. cPLANTA=oOSPRG:FIELDGET("PLANTA") .AND. dPROGRAMA=oOSPRG:FIELDGET("PROGRAMA")
              	oOSPRG:FIELDPUT("QTDE",nQTDE)
                oOSPRG:FIELDPUT("DATAIMP",Today())
              ELSE	
                oOSPRG:APPEND()
	  	        oOSPRG:FIELDPUT("NUMERO",oOSPRG:RECNO)
			    oOSPRG:FIELDPUT("PRODUTO",cPRODUTO)
			    oOSPRG:FIELDPUT("PLANTA",cPLANTA)
			    oOSPRG:FIELDPUT("PROGRAMA",dPROGRAMA)
			    oOSPRG:FIELDPUT("QTDE",nQTDE)
			    oOSPRG:FIELDPUT("DATAIMP",Today())
			  ENDIF
              oOSCRT:gotop()
              IF oOSCRT:SEEK(Str(nCLIENTE,8)+cPRODUTO)
               	 oOSCRT:FIELDPUT("DATAIMP",Today())
               	 cCLIOLD:=AllTrim(oOSCRT:FIELDGET("PEDIDOCLI"))
               	 IF ! Empty(cCLIPRG)
                    IF cCLIOLD<>cCLIPRG
                       oOSCRT:FIELDPUT("PEDIDOCLI",cCLIPRG)	
       		           FWrite(nHANCON,cPRODUTO+" "+cCODNOVO+" "+cPLANTA+" "+cCLIOLD+"->"+cCLIprg)
                       FWrite(nHANCON,Chr(13)+Chr(10))
                    ENDIF
                 ENDIF
                 oOSCRT:FIELDPUTE("codigoint",cCODNOVO)
                 oOSCRT:FIELDPUTE("DELIVERY",cCODY) //delivery location handling
                 oOSCRT:FIELDPUTE("STOCK",cSTK)
                 oOSCRT:FIELDPUTE("DOCA",cDOCA)
                 oOSCRT:FIELDPUTE("CODCLI",cCLIINT)
                 IF Empty(cCODY)
                    cCODY:=oOSCRT:FIELDGET("DELIVERY")
                 ENDIF
                 IF Empty(cSTK)
                     cSTK:=oOSCRT:FIELDGET("STOCK")
                 ENDIF	
                 IF Empty(cDOCA)
                 	cDOCA:=oOSCRT:FIELDGET("DOCA")
                 ENDIF	
              ELSE
                 oOSCRT:setorder(1) //CODIGO
                 oOSCRT:gobottom()
                 nOS:=OOSCRT:FIELDGET("OS")
                 nOS:=nOS+1
                 aGMFI:=PEGGMFI(cPRODUTO)
                 oOSCRT:APPEND()
                 oOSCRT:FIELDPUT("OS",nOS)				
                 oOSCRT:FIELDPUT("codigo",cPRODUTO)	
                 oOSCRT:FIELDPUT("codigoint",cCODNOVO)	
                 oOSCRT:FIELDPUT("PEDIDOCLI",cCLIPRG)					
                 oOSCRT:FIELDPUT("CLIENTE",nCLIENTE)					
                 oOSCRT:FIELDPUT("CLINOME",cCLINOME)
                 oOSCRT:FIELDPUT("DATA",Today())					
                 oOSCRT:FIELDPUT("DELIVERY",cCODY)
                 oOSCRT:FIELDPUT("STOCK",cSTK)
                 oOSCRT:FIELDPUT("DOCA",cDOCA)
                 IF aGMFI[1]
                    oMS01:FIELDPUT("NOME",aGMFI[2])	
                 ENDIF	
               	 oOSCRT:FIELDPUT("DATAIMP",Today())
               	 oOSCRT:FIELDPUT("CODCLI",cCLIINT)
                 oOSCRT:setorder(2) //Produto
              ENDIF


               cHORA:=StrZero(NHORA,5,2)
               cHORA:=StrTran(cHORA,".",":")

               cVARGRV:=Left(cVAR,24)
               cVARGRV+=PadR(cCODNOVO,20)
               cVARGRV+=SubStr(CVAR,45,68)  //posicao 45 a 112 =  68 caracter
               cVARGRV+=cHORA
               cVARGRV+=SubStr(CVAR,118,36) //posicao 118 a 153 36 caracter
               cvarGRV+=PadR(cCODY,25)
               cvarGRV+=PadR(cSTK,35)
               cvarGRV+="0"+Chr(13)+Chr(10)


              FWrite(nCORRIGE,cVARGRV)
           ENDIF //if planta			
       ENDIF //if periodo entrega
    ENDIF  //if empty(cvar)
ENDDO
oOSPRG:CLOSE()
IF lGRAVA
   oOSCRT:CLOSE()
ENDIF
oMA01:CLOSE()
oMS01:CLOSE()
FClose(nCORRIGE)
FClose(nHANDLE)
FClose(nHANCON)
SELF:POINTER:=POINTER{}
alert("Importacao Concluida")
oVIEW:=JRTF{SELF,cARQCON,"A",.T.,.T.,.T.,.T.}
oVIEW:SHOW()

		

METHOD ok( )  

METHOD PushButton5( ) 
SELF:DINI:=SELF:DINI+7

METHOD PushButton8( ) 
SELF:DFIM:=SELF:DFIM+7

METHOD SomaAcumulado(cORI,cDES) 
LOCAL oOSPRG AS USEREDE
LOCAL oOSPRA AS USEREDE
LOCAL dDATAINI,dDATAPRG,dDATAFIM,dPROGRAMA AS DATE
LOCAL aDAD AS ARRAY
LOCAL X,nSEMANAS,nPOS,nLASTREC AS DWORD 
LOCAL nPERC AS INT
LOCAL cPRODUTO AS STRING
LOCAL nQTDE AS FLOAT


aDAD:={zCURINI,cORI+".DBF",zCURDIR}
oOSPRG:=USEREDE{aDAD}
IF oOSPRG:nERRO#0
   RETU SELF
ENDIF	

aDAD:={zCURINI,cDES+".DBF",zCURDIR}
oOSPRA:=USEREDE{aDAD}
IF oOSPRA:nERRO#0
   oOSPRG:CLOSE()
   RETU SELF
ENDIF		
OOSPRG:SETORDER(2)

SELF:POINTER:=POINTER{POINTERHOURGLASS}

dDATAINI:=CToD(SELF:ODCDINI:TEXTValue) //Inicia segunda soma 6 so aqui
dDATAFIM:=dDATAINI+6
nSEMANAS:=SELF:semana
dDATAPRG:=dDATAINI



SELF:oDCproduto:Caption:="Aguarde.."	
nLASTREC:=oOSPRG:RecCount

FOR X:=1 TO nSEMANAS
    nPOS:=0
    oOSPRG:GOTOP()
    WHILE ! oOSPRG:EOF
         cPRODUTO:=oOSPRG:FIELDGET("PRODUTO")
         nQTDE:=0
         SELF:oDCproduto:Caption:=cPRODUTO+" "+DToC(Ddataini)
         WHILE cPRODUTO=oOSPRG:FIELDGET("PRODUTO") .AND. ! oOSPRG:EOF
         	 SELF:oDCregistro:Caption:=Str(oOSPRG:RECNO)
         	 nPerc := INT(100* nPOS/ nLASTREC)
             SELF:oDcProgBar:Position := nPerc	
  	         nPOS++
             dPROGRAMA:=oOSPRG:FIELDGET("PROGRAMA")
             IF dPROGRAMA>=dDATAINI .AND. dPROGRAMA<=dDATAFIM
                nQTDE+=oOSPRG:FIELDGET("QTDE")
             ENDIF
             oOSPRG:Skip()
         ENDDO
         IF nQTDE>0 .AND. ! Empty(cPRODUTO)
         	oOSPRA:GOTOP()
         	IF ! oOSPRA:SEEK(cPRODUTO+DToS(dDATAPRG)+DToS(dDATAINI))
         	   oOSPRA:APPEND()
         	   oOSPRA:FIELDPUT("PRODUTO",cPRODUTO)
               oOSPRA:FIELDPUT("DATAACM",dDATAPRG)
               oOSPRA:FIELDPUT("DATAPRG",dDATAINI)
            ENDIF
            oOSPRA:FIELDPUT("QTDE",nQTDE)
         ENDIF
    ENDDO
    dDATAINI:=Ddatafim+1
    dDATAFIM+=7
NEXT X
oOSPRG:CLOSE()
oOSPRA:CLOSE()

SELF:POINTER:=POINTER{POINTERARROW}

METHOD SomaSemana(cORI,cDES) 
LOCAL cPLANTA,cCODIGO AS STRING	
LOCAL aDAD AS ARRAY
LOCAL oOSPRH,oOSPRI AS USEREDE
LOCAL dPRG AS DATE
LOCAL nVAL AS FLOAT
LOCAL nPOS,X,nLASTREC,nSEMANAS AS DWORD
LOCAL nPERC AS INT

dINI:=CToD(SELF:ODCDINI:TEXTValue)
IF MDG("Domingo Na Semana Seguinte")
   dFIM:=dINI+5 //aqui e seis pois a referencia e a domingo
ELSE	
   dFIM:=dINI+6 //aqui e seis pois a referencia e a segunda
ENDIF
nSEMANAS:=SELF:semana


SELF:POINTER:=POINTER{POINTERHOURGLASS}

ZERADBFREDE(cDES)

aDAD:={zCURINI,cORI+".DBF",zCURDIR}
oOSPRH:=USEREDE{aDAD}
IF oOSPRH:nERRO#0
   RETU SELF
ENDIF

aDAD:={zCURINI,cDES+".DBF",zCURDIR}
oOSPRI:=USEREDE{aDAD}
IF oOSPRI:nERRO#0
   RETU SELF
ENDIF

SELF:oDcPRODUTO:Caption:="Aguarde.."	
nLASTREC:=OOSPRH:RecCount

FOR X:=1 TO nSEMANAS
//	alert(DToC(dINI)+" a "+DToC(dFIM))
    nPOS:=0
    oOSPRh:SetOrder(3)
    OOSPRH:GOTOP()
    WHILE ! OOSPRH:EOF
         cCODIGO:=OOSPRH:FIELDGET("PRODUTO")
         cPLANTA:=OOSPRH:FIELDGET("PLANTA")
         nVAL:=0
         SELF:oDcPRODUTO:Caption:=cCODIGO+" "+DToC(dINI)+" a "+DToC(dFIM)
         WHILE cCODIGO=OOSPRH:FIELDGET("PRODUTO") .AND. cPLANTA=OOSPRH:FIELDGET("PLANTA") .AND. ! OOSPRH:EOF
         	 SELF:oDCregistro:Caption:=Str(OOSPRH:RECNO)
         	 nPerc := INT(100* nPOS/ nLASTREC)
             SELF:oDcProgBar:Position := nPerc	
  	         nPOS++
             dPRG:=OOSPRH:FIELDGET("PROGRAMA")
             IF dPRG>=dINI .AND. dPRG<=dFIM
                nVAL+=OOSPRH:FIELDGET("QTDE")
             ENDIF
             OOSPRH:Skip()
         ENDDO
         IF nVAL>0
       	    oOSPRi:SetOrder(3)
         	oOSPRI:GOTOP()
         	IF ! oOSPRI:SEEK(PadR(cCODIGO,24)+PadR(CPLANTA,10)+DToS(dINI))
       	       oOSPRI:APPEND()
               oOSPRI:FIELDPUT("NUMERO",oOSPRI:RECNO)	
               OOSPRI:FIELDPUT("PRODUTO",cCODIGO)
               OOSPRI:FIELDPUT("PLANTA",cPLANTA)
               OOSPRI:FIELDPUT("PROGRAMA",dINI)
            ENDIF
            oOSPRI:FIELDPUT("dataimp",Today())
            OOSPRI:FIELDPUT("QTDE",nVAL)
            OOSPRI:FIELDPUT("HORAPRG",0)
         ENDIF
    ENDDO
    dINI:=dfim+1
    dFIM+=7
NEXT X

oOSPRI:CLOSE()
oOSPRH:CLOSE()

SELF:POINTER:=POINTER{}
SELF:ENDWINDOW()		

END CLASS
PARTIAL CLASS Xjimpdel
METHOD Acumulada( ) 
   SELF:somaacumulado("OSPRH","OSPRB")	

METHOD AcuSemana( ) 
  SELF:somasemana("OSPRH","OSPRI")

METHOD cmdapagar( ) 
	SELF:Apagar("OSPRH.DBF")

METHOD cmdescarq( ) 
//LOCAL oDlg	AS OpenDlg
//oDlg	:=	OpenDlg{SELF}
LOCAL odlg AS StandardFileDialog
	oDlg	:=	StandardFileDialog{SELF}
	oDlg:SetStyle(OFN_SHOWHELP,FALSE)
    oDLG:SetFilter({"progentr.*"},{"Arquivos de Programacao progent.*"}, 1)	
	IF oDlg:Show()
   	   IF !Empty(oDlg:FileName)
 	   	  SELF:oDCCAMINHO:TextValue:=oDLG:FileName
       ENDIF
	ENDIF	



METHOD ok( ) 
LOCAL aDAD AS ARRAY
LOCAL cARQUIVO,cARQ,cVAR,cPRODUTO,cPLANTA,cTIPO,cTMP,cUNID AS STRING
LOCAL cDAPLANTA,cATEPLANTA,cCLIPRG AS STRING
LOCAL nLIN,Y,nCLIENTE,nPEDCLIITE,nPOS AS DWORD
LOCAL dPROGRAMA,dDATAIMP,dINI,dFIM AS DATE
LOCAL oOSPRH,oOSCRT,oMA01 AS USEREDE
LOCAL nQTDE
LOCAL lGRAVA AS LOGIC
LOCAL oBUSCA AS xBUSCA


lGRAVA:=.F.

IF ! MDG("Iniciar Importação","Confirmação de Processo")
   RETU .F.
ENDIF	

IF SELF:recria
  SELF:CRIAARQ("OSPRH")
ENDIF	


//nNUMERO:=0   
nCLIENTE:=0
//nHORAPRG:=0
cPRODUTO:=""
cPLANTA:=""
dPROGRAMA:=Today()
nQTDE:=0
dDATAIMP:=Today()
//nHORAPRG:=0
dINI:=CToD(SELF:ODCDINI:TEXTValue)
dFIM:=CToD(SELF:ODCDFIM:TEXTValue)
cPLANTA:=""
cATEPLANTA:=Repl("Z",12)
IF ! IsNil(SELF:daplanta)
   cDAPLANTA:=SELF:daplanta	
ENDIF	
IF ! IsNil(SELF:ATEplanta)
   cATEPLANTA:=SELF:ATEplanta	
ENDIF	

cDAPLANTA:=AllTrim(cDAPLANTA)
cATEPLANTA:=AllTrim(cATEPLANTA)


cARQUIVO:=SELF:CAMINHO
IF ! File(cARQUIVO)
   alert("Arquivo Nao Encontrado")	
   RETU .F.
ENDIF	

IF SELF:ApagarANT
   ZERADBFREDE("OSPRH")	
ENDIF
       	   	
aDAD:={zCURINI,"MA01.DBF",zCURDIR}
oMA01:=USEREDE{aDAD}
IF oMA01:nERRO#0   
   RETU SELF
ENDIF

aDAD:={zCURINI,"OSCRT.DBF",zCURDIR}
oOSCRT:=USEREDE{aDAD}
IF oOSCRT:nERRO#0
   oMA01:CLOSE()
   RETU SELF
ENDIF
       
aDAD:={zCURINI,"OSPRH.DBF",zCURDIR}
oOSPRH:=USEREDE{aDAD}
IF oOSPRH:nERRO#0
   oMA01:CLOSE()
   oOSCRT:CLOSE()
   RETU SELF
ENDIF
            	   	

cARQ:=MemoRead(cARQUIVO)
nLIN:=MLCount(cARQ)
FOR Y:=1 TO nLIN
	SELF:oDCregistro:Caption:=Str(Y)	
    cVAR:=AllTrim(MLine(cARQ,y))
    IF ! Empty(cVAR)
       cTIPO:=SubStr(cVAR,1,2)
       DO CASE
       	   CASE cTIPO="01"
       	   	    cTMP:=SubStr(cVAR,13,8)
       	   	    dDATAIMP:=SToD(String2Psz(cTMP))
       	   	    cTMP:=SubStr(cVAR,3,10)
       	   	    cCLIPRG:=SubStr(cTMP,5)+"/"+Left(cTMP,4)
       	   	    IF ! MDG("Importar Programa "+cCLIPRG+" de "+DToC(dDATAIMP))
       	   	       RETU .F.
       	   	    ENDIF
       	   	    cCLIPRG:=SubStr(cTMP,5)
       	   	    lGRAVA:=MDG("Grava Pedido Controle OS "+cCLIPRG)
       	   	    IF lGRAVA
       	   	       oBUSCA:=xBUSCA{SELF,"Pedido","Confirme o Numero do Pedido",cCLIPRG}
                   oBUSCA:lMES:=.T.
                   oBUSCA:SHOW()
                   IF ! oBUSCA:lOK
                      RETU .F.
                   ENDIF	
                   cCLIPRG:= oBUSCA:cBUSCA
                ENDIF
       	   	   
                oMA01:SetOrder(6) //Sisco
                IF lGRAVA
   				   oOSCRT:setorder(2) //Produto Cliente
                ENDIF

                SELF:POINTER:=POINTER{POINTERHOURGLASS}
       	   CASE cTIPO="02"
      	   	    cTMP:=SubStr(cVAR,25,5)
      	   	    cPLANTA:=cTMP
      	   	    nCLIENTE:=0
      	   	    oMA01:GOTOP()
      	   	    IF oMA01:SEEK(cPLANTA)
      	   	       nCLIENTE:=oMA01:FIELDGET("NUMERO")
      	   	    ENDIF
       	   CASE cTIPO="03"
       	   	    cTMP:=SubStr(cVAR,22,15)
       	   	    cPRODUTO:=AllTrim(cTMP)
      	   	    nPOS:=At("*",cPRODUTO)
      	   	    IF nPOS>0
       	   	   	   cPRODUTO:=SubStr(cPRODUTO,1,nPOS-1)
        	   	ENDIF
   	            IF SELF:Ponto
   	            	cPRODUTO:=SubStr( cPRODUTO, 1, 3 ) + "." + SubStr( cPRODUTO, 4 )
                ENDIF
  	   	        SELF:oDCproduto:Caption:=cPRODUTO

       	   	    cTMP:=SubStr(cVAR,46,3)
      	   	    cUNID:=AllTrim(cTMP)
      	   	    IF cUNID="MI"
      	   	       cUNID:="ML"
      	   	    ENDIF

      	   	    cTMP:=SubStr(cVAR,37,9)
                nQTDE:=Val(cTMP)
                nQTDE:=nQTDE/100 //Duas Casas Decimais

                nQTDE:=convun(nQTDE,cUNID)

      	   	    cTMP:=SubStr(cVAR,49,8)
         	   	dPROGRAMA:=SToD(String2Psz(cTMP))


       	   	   cTMP:=SubStr(cVAR,3,6)
      	   	   nPEDCLIITE:=Val(cTMP)


                IF dPROGRAMA>=dINI .AND. dPROGRAMA<=dFIM
                   IF cPLANTA>=CDAPLANTA .AND. cPLANTA<=cATEPLANTA	
				      oOSPRH:APPEND()
				      oOSPRH:FIELDPUT("NUMERO",oOSPRH:RECNO)
				      oOSPRH:FIELDPUT("PRODUTO",cPRODUTO)
				      oOSPRH:FIELDPUT("PLANTA",cPLANTA)
				      oOSPRH:FIELDPUT("PROGRAMA",dPROGRAMA)
				      oOSPRH:FIELDPUT("QTDE",nQTDE)
				      oOSPRH:FIELDPUT("DATAIMP",dDATAIMP)
				      oOSPRH:FIELDPUT("SEQCLIPRG",nPEDCLIITE)
				      IF lGRAVA
                         oOSCRT:gotop()
                         IF oOSCRT:SEEK(Str(nCLIENTE,8)+cPRODUTO)
                         	oOSCRT:FIELDPUT("PEDIDOCLI",cCLIPRG)
                         ENDIF
                      ENDIF

				
				   ENDIF
				ENDIF
       END CASE
    ENDIF
NEXT Y
OOSPRH:CLOSE()
oOSCRT:CLOSE()
oMA01:CLOSE()
SELF:POINTER:=POINTER{}
	

END CLASS
PARTIAL CLASS XjimpedD
METHOD Acumulada( ) 
   SELF:somaacumulado("OSPR2","OSPRA")	

METHOD AcuSemana( ) 
  SELF:somasemana("OSPR2","OSPRG")

METHOD cmdapagar( ) 
	SELF:Apagar("OSPR2.DBF")	

METHOD cmdescarq( ) 	
//LOCAL oDlg	AS OpenDlg
LOCAL odlg AS StandardFileDialog
//	oDlg	:=	OpenDlg{SELF}
	oDlg	:=	StandardFileDialog{SELF}	
	oDlg:SetStyle(OFN_SHOWHELP,FALSE)
    oDLG:SetFilter({"CD049.dbf"},{"Arquivos de programacao CD049.DBF"}, 1)	
	IF oDlg:Show()
   	   IF !Empty(oDlg:FileName)
 	   	  SELF:oDCCAMINHO:TextValue:=oDLG:FileName
       ENDIF
	ENDIF	
	

METHOD ok( ) 
IF sqlserver	
   SELF:IMPMGRSQL("OSPR2.DBF","049")	
ELSE	
   SELF:IMPMGRDBF("OSPR2.DBF","049")	
ENDIF


END CLASS
PARTIAL CLASS XjimpedM
METHOD Acumulada( ) 
   SELF:somaacumulado("OSPRG","OSPRA")	

METHOD cmdapagar( ) 
	SELF:Apagar("OSPRG.DBF")

METHOD cmdescarq( ) 
//LOCAL oDlg	AS OpenDlg
LOCAL odlg AS StandardFileDialog
//	oDlg	:=	OpenDlg{SELF}
	oDlg	:=	StandardFileDialog{SELF}	
    oDLG:SetFilter({"CD111.dbf"},{"Arquivos de Programacao CD111.DBF"}, 1)	
	IF oDlg:Show()
   	   IF !Empty(oDlg:FileName)
 	   	  SELF:oDCCAMINHO:TextValue:=oDLG:FileName
       ENDIF
	ENDIF	
	
	

METHOD ok( ) 
IF SELF:sqlserver	
	SELF:IMPMGRSQL("OSPRG.DBF","111")
ELSE
	SELF:IMPMGRDBF("OSPRG.DBF","111")	
ENDIF	
IF MDG("Gerar Acumulado")
   SELF:somaacumulado("OSPRG","OSPRA")
ENDIF


END CLASS
PARTIAL CLASS XjimpeLE
METHOD Acumulada( ) 
   SELF:somaacumulado("OSPRH","OSPRB")	

METHOD AcuSemana( ) 
  SELF:somasemana("OSPRH","OSPRI")

METHOD cmdapagar( ) 
	SELF:Apagar("OSPRh.DBF")	

METHOD cmdescarq( ) 
//LOCAL oDlg	AS OpenDlg
LOCAL odlg AS StandardFileDialog

//	oDlg	:=	OpenDlg{SELF}
	oDlg	:=	StandardFileDialog{SELF}	
	oDlg:SetStyle(OFN_SHOWHELP,FALSE)
    oDLG:SetFilter({"*.dbf"},{"Arquivos de Programacao *.DBF"}, 1)	
	IF oDlg:Show()
   	   IF !Empty(oDlg:FileName)
 	   	  SELF:oDCCAMINHO:TextValue:=oDLG:FileName
       ENDIF
	ENDIF		
				

METHOD EXPORTar() 
IF MDG("Diaria")	
  SELF:Geralog("OSPRH","ED")
ELSE
  SELF:Geralog("OSPRI","ES")	
ENDIF

METHOD OK() 
   SELF:IMPDBFELE()
   IF MDG("Acumular Semanal")	
   	  SELF:somasemana("OSPRH","OSPRI")
   ENDIF	

END CLASS
PARTIAL CLASS XjimpLOG
METHOD Acumulada( ) 
   SELF:somaacumulado("OSPRS","OSPRO")	

METHOD AcuSemana( ) 
  SELF:somasemana("OSPRS","OSPRR")

METHOD cmdapagar( ) 
	SELF:Apagar("OSPRs.DBF")	

METHOD OK() 
	SELF:IMPPEDLX()

END CLASS
PARTIAL CLASS XjimpORD
METHOD Acumulada( ) 
   SELF:somaacumulado("OSPRH","OSPRB")	

METHOD AcuSemana( ) 
  SELF:somasemana("OSPRH","OSPRI")

METHOD cmdapagar( ) 	
 SELF:APAGAR("OSPRH")

METHOD cmdescarq( ) 
//LOCAL oDlg	AS OpenDlg
LOCAL odlg AS StandardFileDialog
//	oDlg	:=	OpenDlg{SELF}
	oDlg	:=	StandardFileDialog{SELF}	
	oDlg:SetStyle(OFN_SHOWHELP,FALSE)
    oDLG:SetFilter({"pedido.*"},{"Arquivos de Pedidos pedido.*"}, 1)	
	IF oDlg:Show()
   	   IF !Empty(oDlg:FileName)
 	   	  SELF:oDCCAMINHO:TextValue:=oDLG:FileName
       ENDIF
	ENDIF	

METHOD ok( ) 
LOCAL aDAD AS ARRAY
LOCAL cARQUIVO,cARQ,cVAR,cPRODUTO,cPLANTA,cTIPO,cTMP,cUNID,cCLIOLD,cCGC AS STRING
LOCAL cDAPLANTA,cATEPLANTA,cCLIPRG AS STRING
LOCAL nLIN,Y,nCLIENTE,nPEDCLIITE,nPOS AS DWORD
LOCAL dPROGRAMA,dDATAIMP,dINI,dFIM AS DATE
LOCAL oOSPRG,oOSCRT,oMA01 AS USEREDE
LOCAL nQTDE
LOCAL lGRAVA AS LOGIC
LOCAL oBUSCA AS xBUSCA


IF ! MDG("Iniciar Importação","Confirmação de Processo")
   RETU .F.
ENDIF	

IF SELF:recria
  SELF:CRIAARQ("OSPRH")
ENDIF	


//nNUMERO:=0
cPRODUTO:=""
cPLANTA:=""
dPROGRAMA:=Today()
nQTDE:=0
dDATAIMP:=Today()
//nHORAPRG:=0
nPEDCLIITE:=0
dINI:=CToD(SELF:ODCDINI:TEXTValue)
dFIM:=CToD(SELF:ODCDFIM:TEXTValue)
cPLANTA:=""
cATEPLANTA:=Repl("Z",12)
IF ! IsNil(SELF:daplanta)
   cDAPLANTA:=SELF:daplanta	
ENDIF	
IF ! IsNil(SELF:ATEplanta)
   cATEPLANTA:=SELF:ATEplanta	
ENDIF	

cDAPLANTA:=AllTrim(cDAPLANTA)
cATEPLANTA:=AllTrim(cATEPLANTA)


cARQUIVO:=SELF:CAMINHO
IF ! File(cARQUIVO)
   alert("Arquivo Nao Encontrado")	
   RETU .F.
ENDIF	
cARQ:=MemoRead(cARQUIVO)
nLIN:=MLCount(cARQ)
cVAR:=AllTrim(MemoLine(cARQ,200,1))
cTMP:=SubStr(cVAR,24,8)
dDATAIMP:=SToD(String2Psz(cTMP))
cTMP:=SubStr(cVAR,3,15)
cCLIPRG:=AllTrim(cTMP)
IF ! MDG("Importar Pedido "+cCLIPRG+" de "+DToC(dDATAIMP))
   RETU .F.
ENDIF
lGRAVA:=MDG("Grava Pedido Controle OS "+cCLIPRG)
IF lGRAVA
   oBUSCA:=xBUSCA{SELF,"Pedido","Confirme o Numero do Pedido",cCLIPRG}
   oBUSCA:lMES:=.T.
   oBUSCA:SHOW()
   IF ! oBUSCA:lOK
      RETU .F.
   ENDIF	
   cCLIPRG:= oBUSCA:cBUSCA
ENDIF
IF SELF:ApagarANT
   ZERADBFREDE("OSPRH")	
ENDIF
aDAD:={zCURINI,"OSPRH.DBF",zCURDIR}
oOSPRG:=USEREDE{aDAD}
IF oOSPRG:nERRO#0
   RETU SELF
ENDIF
aDAD:={zCURINI,"MA01.DBF",zCURDIR}
oMA01:=USEREDE{aDAD}
IF oMA01:nERRO#0
   oOSPRG:CLOSE()
   RETU SELF
ENDIF
oMA01:SetOrder(6) //Sisco
IF lGRAVA
   aDAD:={zCURINI,"OSCRT.DBF",zCURDIR}
   oOSCRT:=USEREDE{aDAD}
   IF oOSCRT:nERRO#0
      oMA01:CLOSE()
      oOSPRG:CLOSE() //Fechar Programa
      RETU SELF
   ENDIF
   oOSCRT:setorder(2) //Produto Cliente
ENDIF
SELF:POINTER:=POINTER{POINTERHOURGLASS}
cCGC:=SubStr(cVAR,156,14)
cCGC:=formatcnpj(cCGC)
cPLANTA:="?????"
nCLIENTE:=0
oMA01:GOTOP()
oMA01:SETORDER(4)
IF oMA01:SEEK(cCGC)
   nCLIENTE:=oMA01:FIELDGET("NUMERO")
   cPLANTA:=oMA01:FIELDGET("SISCO")
ENDIF
oMA01:CLOSE()
alert(Str(nCLIENTE,8,0))
alert(cPLANTA)
FOR Y:=2 TO nLIN
	SELF:oDCregistro:Caption:=Str(Y)	
    cVAR:=AllTrim(MLine(cARQ,Y))
    IF ! Empty(cVAR)
       cTIPO:=SubStr(cVAR,1,2)
       DO CASE
       	  CASE cTIPO="04"
       	   	   cTMP:=SubStr(cVAR,26,15)
       	   	   cPRODUTO:=AllTrim(cTMP)
       	   	   nPOS:=At("*",cPRODUTO)
       	   	   IF nPOS>0
       	   	   	  cPRODUTO:=SubStr(cPRODUTO,1,nPOS-1)
      	   	   ENDIF
   	           IF SELF:Ponto
    	          cPRODUTO:=SubStr( cPRODUTO, 1, 3 ) + "." + SubStr( cPRODUTO, 4 )
               ENDIF
  	   	       SELF:oDCproduto:Caption:=cPRODUTO
  	   	       cTMP:=SubStr(cVAR,65,3)
      	   	   cUNID:=AllTrim(cTMP)
     	   	   IF cUNID="MI"
      	   	      cUNID:="ML"
      	   	   ENDIF
      	   	   cTMP:=SubStr(cVAR,3,8)
      	   	   nPEDCLIITE:=Val(cTMP)

       	  CASE cTIPO="05"
    	   	   cTMP:=SubStr(cVAR,16,9)
               nQTDE:=Val(cTMP)
               nQTDE:=nQTDE/100 //Duas Casas Decimais

               nQTDE:=convun(nQTDE,cUNID)

      	   	   cTMP:=SubStr(cVAR,25,8)
         	   dPROGRAMA:=SToD(String2Psz(cTMP))

               IF (dPROGRAMA>=dINI .AND. dPROGRAMA<=dFIM)
                  IF cPLANTA>=CDAPLANTA .AND. cPLANTA<=cATEPLANTA	
				      oOSPRG:APPEND()
				      oOSPRG:FIELDPUT("NUMERO",oOSPRG:RECNO)
				      oOSPRG:FIELDPUT("PRODUTO",cPRODUTO)
				      oOSPRG:FIELDPUT("PLANTA",cPLANTA)
				      oOSPRG:FIELDPUT("PROGRAMA",dPROGRAMA)
				      oOSPRG:FIELDPUT("QTDE",nQTDE)
				      oOSPRG:FIELDPUT("DATAIMP",dDATAIMP)
				      oOSPRG:FIELDPUT("SEQCLIPRG",nPEDCLIITE)
				
				      IF lGRAVA
                         oOSCRT:gotop()
                         IF oOSCRT:SEEK(Str(nCLIENTE,8)+cPRODUTO)
                         	cCLIOLD:=AllTrim(oOSCRT:FIELDGET("PEDIDOCLI"))
                         	IF cCLIOLD<>cCLIPRG
                         	   oOSCRT:FIELDPUT("PEDIDOCLI",cCLIPRG)
							   oOSCRT:FIELDPUT("PEDCLIITE",nPEDCLIITE)
                         	ENDIF
                         ENDIF
                      ENDIF
				   ENDIF
			  ENDIF
       ENDCASE
    ENDIF
NEXT Y
oOSPRG:CLOSE()
IF lGRAVA
   oOSCRT:CLOSE()
ENDIF
SELF:POINTER:=POINTER{}
alert("CONCLUIDO")
	

END CLASS
PARTIAL CLASS XPDGMB
METHOD Acumulada( ) 
   SELF:somaacumulado("OSPR2","OSPRA")	

METHOD AcuSemana( ) 
  SELF:somasemana("OSPR2","OSPRG")

METHOD cmdapagar( ) 
	SELF:Apagar("OSPR2.DBF")	

METHOD cmdescarq( ) 
//LOCAL oDlg	AS OpenDlg
LOCAL odlg AS StandardFileDialog

//	oDlg	:=	OpenDLg{SELF}

oDlg	:=	StandardFileDialog{SELF}


	oDlg:SetStyle(OFN_SHOWHELP,FALSE)
    oDLG:SetFilter({"PDGM*.*"},{"Arquivos de Programacao pdgm*.*"}, 1)	
	IF oDlg:Show()
   	   IF !Empty(oDlg:FileName)
 	   	  SELF:oDCCAMINHO:TextValue:=oDLG:FileName
       ENDIF
	ENDIF	

METHOD EXPORTar() 
  SELF:Geralog("OSPR2","PDGM")	

METHOD OK() 
SELF:IMPTXTGM(1)

END CLASS
PARTIAL CLASS XPMGMB
METHOD Acumulada( ) 
   SELF:somaacumulado("OSPRG","OSPRA")	

METHOD cmdapagar( ) 	
	SELF:Apagar("OSPRg.DBF")

METHOD cmdescarq( ) 
//LOCAL oDlg	AS OpenDlg
LOCAL odlg AS StandardFileDialog
//	oDlg	:=	OpenDlg{SELF}
	oDlg	:=	StandardFileDialog{SELF}
	oDlg:SetStyle(OFN_SHOWHELP,FALSE)
    oDLG:SetFilter({"PMGM*.*"},{"Arquivos de Programacao pmgm*.*"}, 1)	
	IF oDlg:Show()
   	   IF !Empty(oDlg:FileName)
 	   	  SELF:oDCCAMINHO:TextValue:=oDLG:FileName
       ENDIF
	ENDIF	

METHOD EXPORTar() 
  SELF:Geralog("OSPRG","PMGM")	

METHOD OK() 	
SELF:IMPTXTGM(2)

END CLASS
PARTIAL CLASS XTXTELEDIR
METHOD Acumulada( ) 
   SELF:somaacumulado("OSPRH","OSPRB")	

METHOD AcuSemana( ) 
  SELF:somasemana("OSPRH","OSPRI")

METHOD cmdescarq( ) 	
//LOCAL oDlg	AS OpenDlg
LOCAL odlg AS StandardFileDialog
//	oDlg	:=	OpenDLg{SELF}
	oDlg	:=	StandardFileDialog{SELF}	
	oDlg:SetStyle(OFN_SHOWHELP,FALSE)
    oDLG:SetFilter({"*.*"},{"Arquivos de Programacao *.*"}, 1)	
	IF oDlg:Show()
   	   IF !Empty(oDlg:FileName)
 	   	  SELF:oDCCAMINHO:TextValue:=oDLG:FileName
       ENDIF
	ENDIF	

METHOD OK() 
SELF:IMPTXTGM(3)


END CLASS
