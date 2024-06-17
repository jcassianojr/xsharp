PARTIAL CLASS jimppf
METHOD AtuMs06( ) 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL aDAD,aUSO AS ARRAY
LOCAL oSERVER AS USEREDE
LOCAL cSQL,cDESCRI AS STRING
LOCAL nPf,nSEQ,nSSQ AS DWORD
LOCAL nFATBAT,nFATCOR,nPCHORA AS FLOAT

aDAD:={zCURINI,"MS06.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU .F.
ENDIF

cSQL:="SELECT PF,SEQ,SSQ,DESCRI,CODINT,CODMP01,CODMP02,CODMP02B,CODMP02C,CODMP02D,CODMP03"
cSQL:=cSQL+",FERRAMEN,FERRAME2,FERRAME3,FERRAME4,MONTAGEM,PCHORA,FATBAT,FATCORTE"
cSQL:=cSQL+" FROM PFS "
AltD()
oConn := SQLConnection{}
IF ! oConn:connect("pf","","")
   alert("Erro na Conecção")
   oserver:close()
   RETURN .f.
ENDIF	
oSERVER:SETORDER(5)
oreg:= SQLSelect{cSQL,oconn}
WHILE ! OREG:EoF
   nPF :=FIXNUM(oREG:FIELDGET("PF"))
   nSEQ:=FIXNUM(oREG:FIELDGET("SEQ"))
   nSSQ:=FIXNUM(oREG:FIELDGET("SSQ"))
   SELF:oDCtexto:Caption:=Str(nPF,8)+"-"+Str(nSEQ)+"-"+Str(nSSQ)
   oSERVER:GOTOP()
   IF oSERVER:SEEK(Str(nPF,8)+Str(nSEQ,3)+Str(nSSQ,3))
  	  cDESCRI:=FIXSTR(oREG:FIELDGET("DESCRI"))
      oSERVER:FIELDPUT("DESCRI",cDESCRI)

      aUSO:=SELF:Nomer(cDESCRI)
      IF Len(aUSO[1])>0
         oSERVER:FIELDPUT("NOMER",aUSO[1])
         oSERVER:FIELDPUT("PULREQ",aUSO[2])
         oSERVER:FIELDPUT("SETOROP",aUSO[3])
      ENDIF	

      oSERVER:FIELDPUT("CODMP01",FIXSTR(oREG:FIELDGET("CODMP01")))
      oSERVER:FIELDPUT("CODMP02",FIXSTR(oREG:FIELDGET("CODMP02")))
      oSERVER:FIELDPUT("CODMP02B",FIXSTR(oREG:FIELDGET("CODMP02B")))
      oSERVER:FIELDPUT("CODMP02C",FIXSTR(oREG:FIELDGET("CODMP02C")))
      oSERVER:FIELDPUT("CODMP02D",FIXSTR(oREG:FIELDGET("CODMP02D")))
      oSERVER:FIELDPUT("CODMP03",FIXSTR(oREG:FIELDGET("CODMP03")))
      oSERVER:FIELDPUT("FERRAMEN",FIXSTR(oREG:FIELDGET("FERRAMEN")))
      oSERVER:FIELDPUT("FERRAME2",FIXSTR(oREG:FIELDGET("FERRAME2")))
      oSERVER:FIELDPUT("FERRAME3",FIXSTR(oREG:FIELDGET("FERRAME3")))
      oSERVER:FIELDPUT("FERRAME4",FIXSTR(oREG:FIELDGET("FERRAME4")))
      oSERVER:FIELDPUT("CODINT",FIXSTR(oREG:FIELDGET("CODINT")))
      IF FIXSTR(oREG:FIELDGET("MONTAGEM"))="S"
     	 oSERVER:FIELDPUT("FIPFEC","9")
      ENDIF	
      nPCHORA:=FIXNUM(oREG:FIELDGET("PCHORA"))
      oSERVER:FIELDPUT("PCHORA",nPCHORA)
      nFATBAT:=FIXNUM(oREG:FIELDGET("FATBAT"))
      nFATCOR:=FIXNUM(oREG:FIELDGET("FATCORTE"))
      IF nFATBAT>0 .AND. nFATCOR>0
         oSERVER:FIELDPUT("FATBAT",nFATCOR/nFATBAT)
      ELSE
         oSERVER:FIELDPUT("FATBAT",nFATBAT)
      ENDIF	
   ENDIF
   Oreg:Skip()
ENDDO
oREG:Close()
oConn:Disconnect()
oSERVER:CLOSE()
alert("Termino Importaçäo","Encerrado")



	

METHOD chkseq(oOWNER) 
LOCAL oJAN AS XJPRO
oJAN:=XJPRO{SELF,AllTrim(SELF:oDCCCODIGO:TextValue),zcurINI,zcurDIR,adir}
oJAN:SHOW()
IF oJAN:aRETSEQ[1]
   SELF:oDCSEQ:TextValue:=Str(oJAN:aRETSEQ[2])
   SELF:oDCSsQ:TextValue:=Str(oJAN:aRETSEQ[3])
ENDIF	
IF oJAN:aRETPRO[1]
  SELF:oDCCCODIGO:TextValue:=oJAN:aRETPRO[2]
ENDIF	
	


METHOD Encerrar( ) 
	SELF:EndWindow()

METHOD esccod( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF oESC:LOK
    SELF:oDCcCODIGO:TextValue:=OESC:CODIGO
ENDIF
	

METHOD escpf( ) 
LOCAL oJAN AS XJPFDIA
oJAN:=XJPFDIA{SELF}
oJAN:SHOW()
IF oJAN:lOK
  IF Empty(SELF:oDCcCODIGO:TextValue)
     SELF:oDCcCODIGO:TextValue:=oJAN:cCODIGO
  ENDIF
  SELF:oDCnPF:TextValue:=Str(oJAN:NPF)
ENDIF	
	


METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:oDCCCODIGO:TextValue)," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETURN .f.
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG",cCODIGO}
OFOTOVIEW:SHOW()
	

METHOD ImpCom( ) 
	LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cPF,cSQL,cCODIGO AS STRING
    LOCAL aCAM AS ARRAY


    cPF:=AllTrim(oDCnPF:TextValue)
    IF Empty(cPF)
       RETURN .f.
    ENDIF	

    IF ! SELF:TEMCODIGO()
       RETURN .f.
    ENDIF	


    cCODIGO:=AllTrim(oDCcCODIGO:TextValue)



    IF SELF:ODCLIMPACO:Value = .T.
       IF ! MDG("Apagar Componentes e Importar")
          GRAVALOG(cCODIGO+" "+cPF,"DEL","Imp PF Del Comp")	
       	  RETURN .f.
       ENDIF
       APAGAMS03(cCODIGO,"C")
    ENDIF






   oConn := SQLConnection{}
   IF ! oConn:connect("pf","","")
  	  alert("Erro na Conecção")
   	  RETURN .f.
   ENDIF	


   cSQL:="SELECT CODCOMP,DESCRI,QTDDE,BAIXAC,SEQ,SSQ,OPCAO FROM PFMS03 WHERE PF="+cPF
   oreg:= SQLSelect{cSQL,oconn}

   WHILE ! OREG:EoF
      aCAM:={}
      AAdd(aCAM,cCODIGO) //1
      AAdd(aCAM,"C")                     //2
      AAdd(aCAM,oREG:FIELDGET("CODCOMP"))  //3
      AAdd(aCAM,oREG:FIELDGET("DESCRI"))  //4
      AAdd(aCAM,oREG:FIELDGET("QTDDE"))  //5
      AAdd(aCAM,"0")         //6
      AAdd(aCAM,"0")         //7
      AAdd(aCAM,oREG:FIELDGET("BAIXAC"))         //8
      AAdd(aCAM,oREG:FIELDGET("SEQ"))  //9
      AAdd(aCAM,oREG:FIELDGET("SSQ"))  //10
      IF ! IsNil(oREG:FIELDGET("OPCAO"))     //Verifica nil necessita str
         AAdd(aCAM,Str(oREG:FIELDGET("OPCAO"),1))         //11
      ELSE
         AAdd(aCAM," ")
      ENDIF
      GRAVAMS03(aCAM)
      Oreg:Skip()
   ENDDO

  oREG:Close()
   oConn:Disconnect()

   SELF:MAILPF("PRD00002",cPF,cCODIGO)
  alert("Termino Importaçäo","Encerrado")
	

METHOD ImpMao( ) 
	
	LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cPF,cSQL,cCODIGO,cOPCAO AS STRING
    LOCAL nHORAS AS FLOAT
    LOCAL aCAM AS ARRAY




    cPF:=AllTrim(oDCnPF:TextValue)
    IF Empty(cPF)
       RETURN .f.
    ENDIF	

    IF ! SELF:TEMCODIGO()
       RETURN .f.
    ENDIF	


    cCODIGO:=AllTrim(oDCcCODIGO:TextValue)



    IF SELF:ODCLIMPAMO:Value = .T.
       IF ! MDG("Apagar Mao de Obra e Importar")
          GRAVALOG(cCODIGO+" "+cPF,"DEL","Imp PF Del ImpMao")	
       	  RETURN .f.
       ENDIF

       APAGAMS03(cCODIGO,"E")
       APAGAMS03(cCODIGO,"H")
       APAGAMS03(cCODIGO,"T")
    ENDIF





   oConn := SQLConnection{}
   IF ! oConn:connect("pf","","")
	  alert("Erro na Conecção")
   	  RETURN .f.
   ENDIF	


   cSQL:="SELECT PCHORA,OPCAO,CODMP01,CODMP02,CODMP02B,CODMP02C,CODMP02D,CODMP03,DESCRI,SEQ,SSQ FROM PFS WHERE PF="+cPF
   oreg:= SQLSelect{cSQL,oconn}

   WHILE ! OREG:EoF
       nHORAS := 0
       cOPCAO := "1"
       IF oREG:FIELDGET("PCHORA") > 0
           nHORAS := 1 / oREG:FIELDGET("PCHORA")
       END IF
       IF ! IsNil(oREG:FIELDGET("OPCAO"))
          cOPCAO := Str(oREG:FIELDGET("OPCAO"))
       END IF

      aCAM:={}
      AAdd(aCAM,cCODIGO) //1
      AAdd(aCAM,"E")                     //2
      AAdd(aCAM,oREG:FIELDGET("CODMP01"))  //3
      AAdd(aCAM,oREG:FIELDGET("DESCRI"))  //4
      AAdd(aCAM,nHORAS)  //5
      AAdd(aCAM,"0")         //6
      AAdd(aCAM,"0")         //7
      AAdd(aCAM,"N")         //8
      AAdd(aCAM,oREG:FIELDGET("SEQ"))  //9
      AAdd(aCAM,oREG:FIELDGET("SSQ"))  //10
      AAdd(aCAM,cOPCAO)         //11
      SELF:oDCtexto:Caption:=Str(FIXNUM(aCAM[9]))+"-"+Str(FIXNUM(aCAM[10]))
      GRAVAMS03(aCAM)

      aCAM[2]:="H"
      aCAM[3]:=oREG:FIELDGET("CODMP02")
      GRAVAMS03(aCAM)

      aCAM[2]:="H"
      aCAM[3]:=oREG:FIELDGET("CODMP02B")
      GRAVAMS03(aCAM)

      aCAM[2]:="H"
      aCAM[3]:=oREG:FIELDGET("CODMP02C")
      GRAVAMS03(aCAM)

      aCAM[2]:="H"
      aCAM[3]:=oREG:FIELDGET("CODMP02D")
      GRAVAMS03(aCAM)

      aCAM[2]:="T"
      aCAM[3]:=oREG:FIELDGET("CODMP03")
      GRAVAMS03(aCAM)

      Oreg:Skip()
   ENDDO

  oREG:Close()
   oConn:Disconnect()

   SELF:MAILPF("PRD00003",cPF,cCODIGO)
  alert("Termino Importaçäo","Encerrado")
	

METHOD ImpMP( ) 
	LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cPF,cSQL,cCODIGO AS STRING
    LOCAL aCAM AS ARRAY


    cPF:=AllTrim(oDCnPF:TextValue)
    IF Empty(cPF)
       RETURN .f.
    ENDIF	


    IF ! SELF:TEMCODIGO()
       RETURN .f.
    ENDIF	

    cCODIGO:=AllTrim(oDCcCODIGO:TextValue)


    IF SELF:ODCLIMPAMP:Value = .T.
       IF ! MDG("Apagar Mat Prima e Importar")
          GRAVALOG(cCODIGO+" "+cPF,"DEL","Imp PF Del MP")	
       	  RETURN .f.
       ENDIF

       APAGAMS03(cCODIGO,"M")
    ENDIF

   oConn := SQLConnection{}
   IF ! oConn:connect("pf","","")
   	  alert("Erro na Conecção")
   	  RETURN .f.
   ENDIF	

   cSQL:="SELECT CODMU011,NOMMU011,PESMU011,SEQMU011,SSQMU011 FROM PF WHERE PF="+cPF
   oreg:= SQLSelect{cSQL,oconn}
   IF ! oREG:EoF
	   aCAM:={}
	   AAdd(aCAM,cCODIGO) //1
	   AAdd(aCAM,"M")                     //2
	   AAdd(aCAM,oREG:FIELDGET("CODMU011"))  //3
	   AAdd(aCAM,oREG:FIELDGET("NOMMU011"))  //4
	   AAdd(aCAM,oREG:FIELDGET("PESMU011"))  //5
	   AAdd(aCAM,"0")         //6
	   AAdd(aCAM,"0")         //7
	   AAdd(aCAM,"N")         //8
	   AAdd(aCAM,oREG:FIELDGET("SEQMU011"))  //9
	   AAdd(aCAM,oREG:FIELDGET("SSQMU011"))  //10
	   AAdd(aCAM,"1")         //11
	   GRAVAMS03(aCAM)
   ENDIF	
   oREG:Close()

   cSQL:="SELECT CODMU012,NOMMU012,PESMU012,SEQMU012,SSQMU012 FROM PF WHERE PF="+cPF
   oreg:= SQLSelect{cSQL,oconn}

   IF ! oREG:EoF
	   aCAM:={}
	   AAdd(aCAM,cCODIGO) //1
	   AAdd(aCAM,"M")                     //2
	   AAdd(aCAM,oREG:FIELDGET("CODMU012"))  //3
	   AAdd(aCAM,oREG:FIELDGET("NOMMU012"))  //4
	   AAdd(aCAM,oREG:FIELDGET("PESMU012"))  //5
	   AAdd(aCAM,"0")         //6
	   AAdd(aCAM,"0")         //7
	   AAdd(aCAM,"S")         //8
	   AAdd(aCAM,oREG:FIELDGET("SEQMU012"))  //9
	   AAdd(aCAM,oREG:FIELDGET("SSQMU012"))  //10
	   AAdd(aCAM,"2")         //11
	   GRAVAMS03(aCAM)
   ENDIF	
   oREG:Close()

   cSQL:="SELECT CODMU013,NOMMU013,PESMU013,SEQMU013,SSQMU013 FROM PF WHERE PF="+cPF
   oreg:= SQLSelect{cSQL,oconn}
   IF ! oREG:EoF
	   aCAM:={}
	   AAdd(aCAM,CCODIGO) //1
	   AAdd(aCAM,"M")                     //2
	   AAdd(aCAM,oREG:FIELDGET("CODMU013"))  //3
	   AAdd(aCAM,oREG:FIELDGET("NOMMU013"))  //4
	   AAdd(aCAM,oREG:FIELDGET("PESMU013"))  //5
	   AAdd(aCAM,"0")         //6
	   AAdd(aCAM,"0")         //7
	   AAdd(aCAM,"S")         //8
	   AAdd(aCAM,oREG:FIELDGET("SEQMU013"))  //9
	   AAdd(aCAM,oREG:FIELDGET("SSQMU013"))  //10
	   AAdd(aCAM,"3")         //11
	   GRAVAMS03(aCAM)
   ENDIF
   oREG:Close()
   oConn:Disconnect()

   SELF:MAILPF("PRD00001",cPF,cCODIGO)
   alert("Termino Importaçäo","Encerrado")

METHOD ImpSEQ( ) 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL aDAD,aUSO AS ARRAY
LOCAL oSERVER AS USEREDE
LOCAL cPF,cCODIGO,cSEQ,cSSQ,cSQL,cDESCRI AS STRING
LOCAL nSEQ,nSSQ AS DWORD
LOCAL nFATBAT,nFATCOR,nPCHORA AS FLOAT  
NSEQ:=0
nSSQ:=0

cPF:=AllTrim(oDCnPF:TextValue)
IF Empty(cPF)
  RETURN .f.
ENDIF	

    IF ! SELF:TEMCODIGO()
       RETURN .f.
    ENDIF	


cCODIGO:=AllTrim(oDCcCODIGO:TextValue)




cSEQ:=AllTrim(oDCSEQ:TextValue)
cSSQ:=AllTrim(oDCSSQ:TextValue)


IF SELF:oDClimpaSQ:VALUE = .T.
   IF ! MDG("Apagar Sequencia e Importar")
      GRAVALOG(cCODIGO+" "+cPF,"DEL","Imp PF Del Seq")	
	  RETURN .f.
   ENDIF
ENDIF

//Apagando OP
aDAD:={zCURINI,"OP02.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU .F.
ENDIF
IF SELF:oDClimpaSQ:VALUE = .T.
   oSERVER:GOTOP()
   oSERVER:SetOrder(3) //Codigo do Produto
   oSERVER:SEEK(cCODIGO)
   WHILE AllTrim(oSERVER:FIELDGET("CODIGO"))=cCODIGO .AND. ! oSERVER:EOF
        oSERVER:DELETE()
	    oSERVER:SKIP()
   ENDDO		
ENDIF	
oSERVER:CLOSE()

//Apagando Sequencia
aDAD:={zCURINI,"MS06.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU .F.
ENDIF
IF SELF:oDClimpaSQ:VALUE = .T.
   oSERVER:GOTOP()
   oSERVER:SEEK(cCODIGO)
   WHILE AllTrim(oSERVER:FIELDGET("CODIGO"))=cCODIGO .AND. ! oSERVER:EOF
        oSERVER:DELETE()
	    oSERVER:SKIP()
   ENDDO		
ENDIF	

cSQL:="SELECT SEQ,SSQ,DESCRI,CODINT,CODMP01,CODMP02,CODMP02B,CODMP02C,CODMP02D,CODMP03"
cSQL:=cSQL+",FERRAMEN,FERRAME2,FERRAME3,FERRAME4,MONTAGEM,PCHORA,FATBAT,FATCORTE"
cSQL:=cSQL+" FROM PFS WHERE PF="+cPF
IF Val(cSEQ)>0 .AND. Val(cSSQ)>0
   cSQL:=cSQL+" AND SEQ="+cSEQ+" AND SSQ="+cSSQ
ENDIF	
oConn := SQLConnection{}
IF ! oConn:connect("pf","","")
  	  alert("Erro na Conecção")
   RETURN .f.
ENDIF	
oreg:= SQLSelect{cSQL,oconn}
WHILE ! OREG:EoF
   nSEQ:=FIXNUM(oREG:FIELDGET("SEQ"))
   nSSQ:=FIXNUM(oREG:FIELDGET("SSQ"))
   SELF:oDCtexto:Caption:=Str(nSEQ)+"-"+Str(nSSQ)
   oSERVER:GOTOP()
   IF ! oSERVER:SEEK(PadR(cCODIGO,24)+Str(nSEQ,3)+Str(nSSQ,3))
      oSERVER:APPEND()
      oSERVER:FIELDPUT("CODIGO",cCODIGO)
      oSERVER:FIELDPUT("SEQ",nSEQ)
      oSERVER:FIELDPUT("SSQ",nSSQ)
   ELSE
      oSERVER:LockCurrentRecord()
   ENDIF	
   cDESCRI:=FIXSTR(oREG:FIELDGET("DESCRI"))
   oSERVER:FIELDPUT("DESCRI",cDESCRI)
   cDESCRI:=Upper(cDESCRI)
   aUSO:=SELF:Nomer(cDESCRI)
   IF Len(aUSO[1])>0
      oSERVER:FIELDPUT("NOMER",aUSO[1])
      oSERVER:FIELDPUT("PULREQ",aUSO[2])
      oSERVER:FIELDPUT("SETOROP",aUSO[3])
   ENDIF	
   oSERVER:FIELDPUT("CODMP01",FIXSTR(oREG:FIELDGET("CODMP01")))
   oSERVER:FIELDPUT("CODMP02",FIXSTR(oREG:FIELDGET("CODMP02")))
   oSERVER:FIELDPUT("CODMP02B",FIXSTR(oREG:FIELDGET("CODMP02B")))
   oSERVER:FIELDPUT("CODMP02C",FIXSTR(oREG:FIELDGET("CODMP02C")))
   oSERVER:FIELDPUT("CODMP02D",FIXSTR(oREG:FIELDGET("CODMP02D")))
   oSERVER:FIELDPUT("CODMP03",FIXSTR(oREG:FIELDGET("CODMP03")))
   oSERVER:FIELDPUT("FERRAMEN",FIXSTR(oREG:FIELDGET("FERRAMEN")))
   oSERVER:FIELDPUT("FERRAME2",FIXSTR(oREG:FIELDGET("FERRAME2")))
   oSERVER:FIELDPUT("FERRAME3",FIXSTR(oREG:FIELDGET("FERRAME3")))
   oSERVER:FIELDPUT("FERRAME4",FIXSTR(oREG:FIELDGET("FERRAME4")))
   oSERVER:FIELDPUT("CODINT",FIXSTR(oREG:FIELDGET("CODINT")))
   IF FIXSTR(oREG:FIELDGET("MONTAGEM"))="S"
   	 oSERVER:FIELDPUT("FIPFEC","9")
   ENDIF	
   nPCHORA:=FIXNUM(oREG:FIELDGET("PCHORA"))
   oSERVER:FIELDPUT("PCHORA",nPCHORA)
   nFATBAT:=FIXNUM(oREG:FIELDGET("FATBAT"))
   nFATCOR:=FIXNUM(oREG:FIELDGET("FATCORTE"))
   IF nFATBAT>0 .AND. nFATCOR>0
      oSERVER:FIELDPUT("FATBAT",nFATCOR/nFATBAT)
   ELSE
      oSERVER:FIELDPUT("FATBAT",nFATBAT)
   ENDIF	
   oSERVER:FIELDPUT("PF",Val(cPF))
   oSERVER:FIELDPUT("DATAINI",Today())
   oSERVER:COMMIT()
   Oreg:Skip()
ENDDO
oREG:Close()
oConn:Disconnect()
oSERVER:Append()
oSERVER:FIELDPUT("codigo",cCODIGO)
oSERVER:FIELDPUT("SEQ",nSEQ)
oSERVER:FIELDPUT("SSQ",99)
oSERVER:FIELDPUT("DESCRI","Final")
oSERVER:FIELDPUT("NOMER","Final")
oSERVER:FIELDPUT("PULREQ","S")
oSERVER:FIELDPUT("SETOROP","X")
oSERVER:FIELDPUT("PF",Val(cPF))
oSERVER:FIELDPUT("DATAINI",Today())
oSERVER:COMMIT()
oSERVER:CLOSE()
alert("Termino Importaçäo","Encerrado")
alert("Verificar Ordem/Prod - Seq Prod")

SELF:MAILPF("PRD00004",cPF,cCODIGO)



METHOD ImpTudo( ) 	
	SELF:ImpMP()
	SELF:ImpCom()
	SELF:ImpMao()
	SELF:ImpSEQ()

METHOD MAILPF(cERRO,cPF,cCODIGO) 
LOCAL aERRO AS ARRAY	
aERRO:={}
AAdd(aERRO,"PF:"+cPF)
AAdd(aERRO,"Codigo:"+cCODIGO)
EMAILINT(cERRO,ZUSER,aERRO,ZCURINI,zCURDIR)		


METHOD Nomer(cDESCRI) 
LOCAL aRETU AS ARRAY
aRETU:={"","",""}
   cDESCRI:=Upper(cDESCRI)
   IF At("EMBALAR",cDESCRI)>0
      aRETU[1]:="Embalar"
      aRETU[2]:="S"
      aRETU[3]:="F"
   ENDIF	
   IF At("RETORNO",cDESCRI)>0
      aRETU[1]:="Retorno"
      aRETU[2]:="S"
      aRETU[3]:="X"
   ENDIF	
   IF At("ZINCA",cDESCRI)>0
      aRETU[1]:="Zincar"
      aRETU[2]:="S"
      aRETU[3]:="T"
   ENDIF	
   IF At("PINTURA",cDESCRI)>0
      aRETU[1]:="Pintura"
      aRETU[2]:="S"
      aRETU[3]:="T"
   ENDIF	
   IF At("FOSFAR",cDESCRI)>0
      aRETU[1]:="Fosfatizar"
      aRETU[2]:="S"
      aRETU[3]:="T"
   ENDIF	
   IF At("SOLDAR",cDESCRI)>0
      aRETU[1]:="Soldar"
      aRETU[2]:="N"
      aRETU[3]:="S"
   ENDIF	
   IF At("TAMBOR",cDESCRI)>0
      aRETU[1]:="Tamborear"
      aRETU[2]:="N"
      aRETU[3]:="E"
   ENDIF	
   IF At("RECORTAR",cDESCRI)>0
      aRETU[1]:="Recortar"
      aRETU[2]:="N"
      aRETU[3]:="E"
   ENDIF	
   IF At("REBITAR",cDESCRI)>0
      aRETU[1]:="Rebitar"
      aRETU[2]:="N"
      aRETU[3]:="U"
   ENDIF	
   IF At("PUNCIONAR",cDESCRI)>0
      aRETU[1]:="Puncionar"
      aRETU[2]:="N"
      aRETU[3]:="E"
   ENDIF	
RETU aRETU


	

METHOD pegcod( ) 
	LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cPF AS STRING

    cPF:=AllTrim(oDCnPF:TextValue)
    IF Empty(cPF)
       RETURN .f.
    ENDIF	


   cPF:="SELECT * FROM PF WHERE PF="+cPF

   oConn := SQLConnection{}
   IF ! oConn:connect("pf","","")
	  alert("Erro na Conecção")
   	  RETURN .f.
   ENDIF	

   oreg:= SQLSelect{cPF,oconn}

   SELF:oDCcCODIGO:TextValue:=FIXSTR(oREG:FIELDGET("CODFINAL"))

   oREG:Close()
   oConn:Disconnect()


METHOD TEMCODIGO() 
LOCAL aRETU AS ARRAY
IF Empty(SELF:oDCCCODIGO:TextValue)
   alert("Codigo PCP Nao Preenchido")
   RETU .F.
ENDIF	
aRETU:=PEGMS01(SELF:oDCCCODIGO:TextValue)	
IF ! aRETU[1]
   alert("Produto Nao cadastrato PCP")
ENDIF	
RETU aRETU[1]


END CLASS
FUNCTION APAGAMS03(cCODIGO,cTIPO)
LOCAL aDAD AS ARRAY
LOCAL oSERVER AS USEREDE
cCODIGO:=AllTrim(cCODIGO)
aDAD:={zCURINI,"MS03.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU .F.
ENDIF
oSERVER:GOTOP()
oSERVER:SEEK(cCODIGO)
WHILE AllTrim(oSERVER:FIELDGET("CODIGO"))=cCODIGO .AND. ! oSERVER:EOF
    IF oSERVER:FIELDGET("TIPOENT")=cTIPO
       oSERVER:DELETE()
    ENDIF	
	oSERVER:SKIP()
ENDDO	
oSERVER:CLOSE()	

FUNCTION GRAVAMS03(aCAM AS ARRAY)
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
IF IsNil(acam[3]) //Sem  Codigo
   RETU .F.
ENDIF
aCAM[1]:=FIXSTR(aCAM[1]) //Codigo Produdo
aCAM[3]:=FIXSTR(aCAM[3]) //Codigo Componente/MP
aCAM[4]:=FIXSTR(aCAM[4]) //Nome Componente/MP
aCAM[8]:=FIXSTR(aCAM[8]) //Baixa
aCAM[11]:=FIXSTR(aCAM[11]) //Opcao
aCAM[5]:=FIXNUM(aCAM[5])	 //Peso
aCAM[9]:=FIXNUM(aCAM[9])	//Seq
aCAM[10]:=FIXNUM(aCAM[10])	 //ssq
IF Acam[2]="T"
   aCAM[3]:=aCAM[1]	
ENDIF	


aDAD:={zCURINI,"MS03.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU .F.
ENDIF
oSERVER:GOTOP()
IF ! oSERVER:SEEK(PadR(acam[1],24)+acam[2]+PadR(acam[3],24)+Str(acam[9],3)+Str(acam[10],3))
   oSERVER:APPEND()
   oSERVER:FIELDPUT("CODIGO",aCAM[1])
   oSERVER:FIELDPUT("TIPOENT",aCAM[2])
   oSERVER:FIELDPUT("CODCOMP",aCAM[3])
   oSERVER:FIELDPUT("BSEQ",aCAM[9])
   oSERVER:FIELDPUT("BSSQ",aCAM[10])
ELSE
   oSERVER:LockCurrentRecord()
ENDIF
oSERVER:FIELDPUT("NOMECOMP",aCAM[4])
oSERVER:FIELDPUT("QTDDE",aCAM[5])
oSERVER:FIELDPUT("BAIXAC",aCAM[8])
oSERVER:FIELDPUT("OPCAO",aCAM[11])
oSERVER:CLOSE()
RETU .T.


