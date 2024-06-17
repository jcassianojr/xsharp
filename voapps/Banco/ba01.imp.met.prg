CLASS XJIMP INHERIT JIMP	

METHOD cmdimp( ) 
SELF:cmdimpx(0)		

METHOD cmdimp1( ) 
	SELF:cmdimpx(1)		

METHOD cmdimpx(nTIPO) 
LOCAL ARQWORK,mCHAVE AS STRING
LOCAL oBA01 AS USEREDE
LOCAL oML01 AS DBSERVER
LOCAL aDAD AS ARRAY
LOCAL cmes,cano AS STRING
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT
cMES:=StrZero(SELF:MES,2)
cANO:=StrZero(SELF:ANO,4)

IF SELF:empresa=1
   ARQWORK:=PEGINIVAL(ZCURINI,"PATH","MANA5EMP")+"ML01PG.DBF"
   IF ! SELF:Atual
      ARQWORK:=PEGINIVAL(ZCURINI,"PATH","MANA5")+"E"+CANO+"\ML"+Right(CANO,2)+CMES+".DBF"	
   ENDIF	
ELSE
   ARQWORK:=PEGINIVAL(ZCURINI,"PATH","MANA5EMP2")+"ML01PG.DBF"
   IF ! SELF:Atual
      ARQWORK:=PEGINIVAL(ZCURINI,"PATH","MANA52")+"E"+CANO+"\ML"+Right(CANO,2)+CMES+".DBF"	
   ENDIF	
ENDIF	

IF ! File(ARQWORK)
   alert("Arquivo Inexistente:"+arqwork,"Erro Abertura")
   RETURN .F.
ENDIF

oML01:=DBSERVER{ARQWORK}
IF ! oML01:Used
   RETURN .F.
ENDIF	
nLASTREC:=OML01:RecCount
nPOS:=0

aDAD:={zCURINI,"BA01.DBF",zCURDIR}
oBA01:=USEREDE{aDAD}
IF oBA01:nERRO#0
   oML01:CLOSE()
   RETURN .F.
ENDIF
	

oBA01:SETORDER(3)
oML01:GOTOP()
WHILE ! oML01:EOF
	
	nPerc := INT(100* nPOS/ nLASTREC)
    SELF:oDcProgBar:Position := nPerc
	nPOS++
	
   IF ! Empty(oML01:FIELDGET("OBSPG"))
       mCHAVE    :=DToS(oML01:FIELDGET("VENCIMENT"))+Str(oML01:FIELDGET("NRNOTA"),8)+oML01:FIELDGET("TIPFAT")
       SELF:oDCchave:Caption:=mCHAVE
       oBA01:GOTOP()
       IF ! oBA01:SEEK(mCHAVE)
       	  IF nTIPO=0
       	     oBA01:aPPEND()
       	     oBA01:FIELDPUT("NRCONTA",1)
		     oBA01:FIELDPUT("TIPO","D")
             oBA01:FIELDPUT("NUMERO",Val(oML01:FIELDGET("OBSPG")))
             oBA01:FIELDPUT("SUB",oML01:FIELDGET("TIPFAT"))
             oBA01:FIELDPUT("DATA",oML01:FIELDGET("DATAPG"))
             oBA01:FIELDPUT("CODIGO",Str(oML01:FIELDGET("FORNECEDO"),4))
             oBA01:FIELDPUT("HISTORICO",oML01:FIELDGET("COGNOME"))
             oBA01:FIELDPUT("VALOR",oML01:FIELDGET("VALORPG"))
             oBA01:FIELDPUT("ITEM",oML01:FIELDGET("COD"))
             oBA01:FIELDPUT("DATADEP",oML01:FIELDGET("DATAPG"))
             oBA01:FIELDPUT("CHAVE",mCHAVE)
          ENDIF
       ELSE
       	  IF nTIPO=1
       	  	 oBA01:Delete()
       	  ENDIF
       ENDIF
   ENDIF
   oML01:SKIP()
ENDDO
oML01:CLOSE()
oBA01:CLOSE()
SELF:EndWindow()
	

METHOD cmdSaida( ) 
	SELF:EndWindow()

CONSTRUCTOR(oOWNER) 
//LOCAL nMES,nANO AS DWORD	
IF ! entramenu("BCO",6)
	RETU SELF
ENDIF	
SUPER(oOWNER)
SELF:Atual:=.F.
//nMES:=Month(ZDATA)
//nANO:=Year(ZDATA)
//nMES--
//IF nMES=0
//   nMES:=12
//   nANO--
//ENDIF	
//SELF:MES:=StrZero(nMES,2)
//SELF:ANO:=StrZero(nANO,4)
//SELF:empresa:=1
SELF:MES:=ZMES
SELF:ANO:=ZANO
SELF:empresa:=ZEMPRESA
SELF:SHOW()	

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


METHOD PushButton9( ) 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL aDAD AS ARRAY
LOCAL oSERVER AS USEREDE
LOCAL oMB01 AS USEMANA5
LOCAL dataini,datafim AS DATE
LOCAL mCHAVE,cMIG,cCGC,cSQL,cCOGNOME AS STRING
LOCAL nFORN,nNUMNF,nNUMDOC,nLASTREC,nPOS AS DWORD
LOCAL nEMP AS DWORD
LOCAL nPERC AS INT
LOCAL oSTMT AS SQLStatement
LOCAL lFILTRAEMP AS LOGIC

lFILTRAEMP:=MDG("Filtrar empresa")
    IMPFOR(.F.)

   nEMP:=ZEMPRESA
   IF SELF:EMPRESA>0
   	  nEMP:=SELF:empresa
   ENDIF	

	IF lFILTRAEMP
   		cMIG:=PEGEMPMIG(nEMP)
	ENDIF

    aDAD:={zCURINI,"BA01.DBF",zCURDIR}
    oSERVER:=USEREDE{aDAD}
    IF oSERVER:nERRO#0
       RETURN .F.
    ENDIF
    oSERVER:SETORDER(3) //Chave


    aDAD:={zCURINI,"MB01",zCURDIR,aDIR}
    oMB01:=USEMANA5{aDAD}
    IF oMB01:nERRO#0
       oSERVER:CLOSE()
       RETURN .F.
    ENDIF
    oMB01:SETORDER(3) //CGC

   dataini:=SELF:DINI
   datafim:=SELF:DFIM

   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
   	  RETURN .F.
   ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()


   AltD()
csql:="select b.num_docum_pgto,b.num_nf,b.dat_pgto,a.cod_tip_despesa,b.val_nom_ap,a.cod_fornecedor "
csql+=" from ad_mestre a, ap b "
csql+=" where a.cod_empresa = b.cod_empresa and a.num_nf = b.num_nf and a.cod_fornecedor = b.cod_fornecedor "
csql+=" and b.dat_pgto>='" +DToC(dataini) +"' and b.dat_pgto<='" +DToC(datafim) + "'"

//' por enquanto todas AS empresa
IF lFILTRAEMP
   cSQL+=" AND COD_EMPRESA='" +CMIG+ "'"
ENDIF

   oreg:= SQLSelect{cSQL,oconn}

    nPOS:=0
    nLASTREC:=100

   WHILE ! OREG:EoF	
   	  nPerc := INT(100* nPOS/ nLASTREC)
      SELF:oDcProgBar:Position := nPerc	
  	  nPOS++
  	  IF nPOS=101
  	       nPOS:=0
  	  ENDIF

  	  cCGC:=oREG:FIELDGET("Cod_fornecedor")
      IF SubStr(cCGC,10,4)="0000"
         cCGC:= SubStr(cCGC,1,3)+"."+SubStr(cCGC,4,3)+"."+SubStr(cCGC,7,3)+"-"+SubStr(cCGC,14,2)
      ELSE
    	 cCGC:=SubStr(CCGC,2)
         cCGC:=Left(cCGC,2)+"."+SubStr(cCGC,3,3)+"."+SubStr(cCGC,6,3)+"/"+SubStr(cCGC,9,4)+"-"+SubStr(cCGC,13,2)
      ENDIF

      nFORN:=0
      cCOGNOME:=cCGC
       oMB01:SETORDER(3)
      oMB01:GOTOP()
      IF oMB01:SEEK(cCGC)
         nFORN:=oMB01:FIELDGET("NUMERO")
         cCOGNOME:=oMB01:FIELDGET("COGNOME")
      ENDIF	
      nNUMNF:=Val(oREG:FIELDGET("num_nf"))
      nNUMDOC:=FIXNUM(oreg:FIELDGET("num_docum_pgto"))
      IF nNUMDOC>0
         mCHAVE:=Str(nNUMDOC,8)+Str(nNUMNF,8)+Str(nFORN,8)
         oSERVER:GOTOP()
         IF ! oSERVER:SEEK(mCHAVE)
      	    oSERVER:APPEND()
            Oserver:FIELDPUT("NRCONTA",1)
		    Oserver:FIELDPUT("TIPO","D")
            Oserver:FIELDPUT("NUMERO",nNUMDOC)
            Oserver:FIELDPUT("DATA",oREG:FIELDGET("dat_pgto"))
            Oserver:FIELDPUT("CODIGO",StrZero(nFORN,4))
            Oserver:FIELDPUT("HISTORICO",cCOGNOME)
            Oserver:FIELDPUT("VALOR",oREG:FIELDGET("val_nom_ap"))
            Oserver:FIELDPUT("ITEM",StrZero(oREG:FIELDGET("cod_tip_despesa"),4))
            Oserver:FIELDPUT("DATADEP",oREG:FIELDGET("dat_pgto"))
            Oserver:FIELDPUT("CHAVE",mCHAVE)
         ENDIF
      ENDIF
   	  Oreg:skip()
   ENDDO	
   Oreg:close()
   Oconn:Disconnect()
   Oserver:CLOSE()
   alert("Concluido")
	


END CLASS
