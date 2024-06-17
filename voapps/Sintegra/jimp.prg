#region DEFINES
STATIC DEFINE JIMPTXT_ARQUIVO := 102 
STATIC DEFINE JIMPTXT_CHAVE := 105 
STATIC DEFINE JIMPTXT_CMDIMP := 101 
STATIC DEFINE JIMPTXT_CMDSAIR := 100 
STATIC DEFINE JIMPTXT_PROGBAR := 107 
STATIC DEFINE JIMPTXT_PUSHBUTTON3 := 103 
STATIC DEFINE JIMPTXT_PUSHBUTTON4 := 104 
STATIC DEFINE JIMPTXT_PUSHBUTTON5 := 106 
#endregion

CLASS JIMPTXT INHERIT DATADIALOG 

	PROTECT oCCcmdsair AS PUSHBUTTON
	PROTECT oCCcmdimp AS PUSHBUTTON
	PROTECT oDCarquivo AS PBFILESLE
	PROTECT oCCPushButton3 AS PUSHBUTTON
	PROTECT oCCPushButton4 AS PUSHBUTTON
	PROTECT oDCchave AS FIXEDTEXT
	PROTECT oCCPushButton5 AS PUSHBUTTON
	PROTECT oDCProgBar AS PROGRESSBAR
// 	instance arquivo 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

ACCESS arquivo() 
RETURN SELF:FieldGet(#arquivo)


ASSIGN arquivo(uValue) 
SELF:FieldPut(#arquivo, uValue)
RETURN arquivo := uValue


METHOD CHECKFOR(cTIPO) 
//LOCAL oConn AS SQLConnection
LOCAL oMA01 AS USEREDE
LOCAL oMB01 AS USEREDE
LOCAL oORI AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL cBUSCA AS STRING
LOCAL cCNPJ AS STRING
LOCAL nFORNECEDO AS DWORD
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT
LOCAL nCFO AS DWORD
LOCAL cTIPOCLI AS STRING
//LOCAL oSTMT AS SQLStatement

aDAD:={zCURINI,"SINT"+CTIPO+".DBF",ZCURDIR}
oORI:=USEREDE{aDAD,.F.}
IF oORI:nERRO#0
    RETURN .F.
ENDIF
aDAD:={zCURINI,"MA01.DBF",ZCURDIR}
oMA01:=USEREDE{aDAD,.F.}
IF oMA01:nERRO#0
   oORI:CLOSE()
   RETURN .F.
ENDIF
oMA01:SETORDER(4) //CNPJ

aDAD:={zCURINI,"MB01.DBF",ZCURDIR}
oMB01:=USEREDE{aDAD,.F.}
IF oMB01:nERRO#0
   oMA01:CLOSE()
   oORI:CLOSE()
   RETURN .F.
ENDIF
oMB01:SETORDER(3) //CNPJ


nPOS:=0
nLASTREC:=oORI:RecCount

oORI:GOTOP()
WHILE ! oORI:EOF
	

	cCNPJ:=oORI:FIELDGET("CGC")	
	cBUSCA:=SubStr(cCNPJ,1,2)+"."+SubStr(cCNPJ,3,3)+"."+SubStr(cCNPJ,6,3)+"/"+SubStr(cCNPJ,9,4)+"-"+SubStr(cCNPJ,13,2)
	
	
	nPerc := INT(100* nPOS/ nLASTREC)
    SELF:oDcProgBar:Position := nPerc	
	nPOS++
	

	SELF:oDCchave:Caption:= cBUSCA +" "+Str(oORi:RecNo)+"/"+Str(nLASTREC)
	
	
  	nFORNECEDO:=0
	nCFO:=Val(oORI:FIELDGET("CFOP"))
	cTIPOCLI:=""
    IF nCFO<5000	
   	   oMB01:SETORDER(3) //CNPJ
       oMB01:GOTOP()	
	   IF oMB01:SEEK(CBUSCA)
	      nFORNECEDO:=oMB01:FIELDGET("NUMERO")
	      cTIPOCLI  :="F"
   	   ENDIF
    ELSE
 	   oMA01:GOTOP()
	   IF oMA01:SEEK(CBUSCA)
	      nFORNECEDO:=oMA01:FIELDGET("NUMERO")	
          cTIPOCLI :="C"	
	   ENDIF
    ENDIF	
    IF nFORNECEDO>0
       oORI:FIELDPUT("FORNECEDO",nFORNECEDO)
       oORI:FIELDPUT("TIPOCLI",cTIPOCLI)
    ENDIF
	oORI:SKIP()
ENDDO	
oORI:CLOSE()
oMA01:CLOSE()
oMB01:CLOSE()
//alert("Sincronizacao Concluida" + cTIPO)



METHOD cmdimp( ) 
LOCAL aDBF50,aDBF51,aDBF53,aDBF54,aDBF70,aDBF75,aDAD AS ARRAY
LOCAL oSINT50,oSINT51,oSINT53,oSINT54,oSINT70,oSINT75 AS USEREDE
LOCAL cREG,cLINHA,cCAMPO,cARQUIVO AS STRING
LOCAL eVALOR
LOCAL X AS DWORD
LOCAL nFILE

cARQUIVO:=SELF:ARQUIVO
IF ! File(cARQUIVO)
   alert("Arquivo Nao Encontrado")	
   RETU .F.
ENDIF	


aDAD:={zCURINI,"SINT50.DBF",ZCURDIR}
oSINT50:=USEREDE{aDAD,.F.}
IF oSINT50:nERRO#0
   RETURN .F.
ENDIF
oSINT50:ZAP()


aDAD:={zCURINI,"SINT51.DBF",ZCURDIR}
oSINT51:=USEREDE{aDAD,.F.}
IF oSINT51:nERRO#0
   oSINT50:CLOSE()	
   RETURN .F.
ENDIF
oSINT51:ZAP()


aDAD:={zCURINI,"SINT53.DBF",ZCURDIR}
oSINT53:=USEREDE{aDAD,.F.}
IF oSINT53:nERRO#0
   oSINT50:CLOSE()	
   oSINT51:CLOSE()		
   RETURN .F.
ENDIF
oSINT53:ZAP()


aDAD:={zCURINI,"SINT54.DBF",ZCURDIR}
oSINT54:=USEREDE{aDAD,.F.}
IF oSINT54:nERRO#0
   oSINT50:CLOSE()	
   oSINT51:CLOSE()		
   oSINT53:CLOSE()			
   RETURN .F.
ENDIF
oSINT54:ZAP()

aDAD:={zCURINI,"SINT70.DBF",ZCURDIR}
oSINT70:=USEREDE{aDAD,.F.}
IF oSINT70:nERRO#0
   oSINT50:CLOSE()	
   oSINT51:CLOSE()		
   oSINT53:CLOSE()			
   oSINT54:CLOSE()				
   RETURN .F.
ENDIF
oSINT70:ZAP()


aDAD:={zCURINI,"SINT75.DBF",ZCURDIR}
oSINT75:=USEREDE{aDAD,.F.}
IF oSINT75:nERRO#0
   oSINT50:CLOSE()	
   oSINT51:CLOSE()		
   oSINT53:CLOSE()			
   oSINT54:CLOSE()				
   oSINT70:CLOSE()					
   RETURN .F.
ENDIF
oSINT75:ZAP()





    nFile := FOpen( "SINTEGRA.TXT" )


aDBF50:={ {"TIPO"        ,"C", 2,0},    ;
          {"CGC"         ,"C",14,0},    ;
          {"IE"          ,"C",14,0},    ;
          {"DATA"        ,"SD", 8,0},    ;
          {"UF"          ,"C", 2,0},    ;
          {"MODELO"      ,"N", 2,0},    ;
          {"SERIE"       ,"C", 3,0},    ;
          {"NUMERO"      ,"N", 6,0},    ;
          {"CFOP"        ,"C", 4,0},    ;
          {"EMITENTE"    ,"C", 1,0},    ;
          {"VALORTOT"    ,"N",13,2},    ;
          {"BASE"        ,"N",13,2},    ;
          {"VALOR"       ,"N",13,2},    ;
          {"ISENTA"      ,"N",13,2},    ;
          {"OUTRAS"      ,"N",13,2},    ;
          {"ALIQUOTA"    ,"N", 4,2},    ;
          {"SITUACAO"    ,"C", 1,0}}

aDBF51:={ {"TIPO"        ,"C", 2,0},    ;
          {"CGC"         ,"C",14,0},    ;
          {"IE"          ,"C",14,0},    ;
          {"DATA"        ,"SD", 8,0},    ;
          {"UF"          ,"C", 2,0},    ;
          {"SERIE"       ,"C", 3,0},    ;
          {"NUMERO"      ,"N", 6,0},    ;
          {"CFOP"        ,"C", 4,0},    ;
          {"VALORTOT"    ,"N",13,2},    ;
          {"VALOR"       ,"N",13,2},    ;
          {"ISENTA"      ,"N",13,2},    ;
          {"OUTRAS"      ,"N",13,2},    ;
          {"BRANCOS"     ,"C", 20,2},    ;
          {"SITUACAO"    ,"C", 1,0}}

aDBF53:={ {"TIPO"        ,"C", 2,0},    ;
          {"CGC"         ,"C",14,0},    ;
          {"IE"          ,"C",14,0},    ;
          {"DATA"        ,"SD", 8,0},    ;
          {"UF"          ,"C", 2,0},    ;
          {"MODELO"      ,"N", 2,0},    ;
          {"SERIE"       ,"C", 3,0},    ;
          {"NUMERO"      ,"N", 6,0},    ;
          {"CFOP"        ,"C", 4,0},    ;
          {"EMITENTE"    ,"C", 1,0},    ;
          {"BASE"        ,"N",13,2},    ;
          {"VALOR"       ,"N",13,2},    ;
          {"DESPESAS"    ,"N",13,2},    ;
          {"SITUACAO"    ,"C", 1,0},    ;
          {"ANTECIPA"    ,"C", 1,0},    ;
          {"BRANCOS"     ,"C", 29,2}}

aDBF54:={ {"TIPO"        ,"C", 2,0},    ;
          {"CGC"         ,"C",14,0},    ;
          {"MODELO"      ,"N", 2,0},    ;
          {"SERIE"       ,"C", 3,0},    ;
          {"NUMERO"      ,"N", 6,0},    ;
          {"CFOP"        ,"C", 4,0},    ;
          {"SITUACAO"    ,"N", 3,0},    ;
          {"ITEM"        ,"N", 3,0},    ;
          {"CODIGORED"   ,"C",14,0},    ;
          {"QTDE"        ,"N",11,3},    ;
          {"VALORMER"    ,"N",12,2},    ;
          {"DESCONTO"    ,"N",12,2},    ;
          {"BASEICM"     ,"N",12,2},    ;
          {"BASESUB"     ,"N",12,2},    ;
          {"VALORIPI"    ,"N",12,2},    ;
          {"ICM"         ,"N", 4,2}}


aDBF70:={ {"TIPO"        ,"C", 2,0},    ;
          {"CGC"         ,"C",14,0},    ;
          {"IE"          ,"C",14,0},    ;
          {"DATA"        ,"SD", 8,0},    ;
          {"UF"          ,"C", 2,0},    ;
          {"MODELO"      ,"N", 2,0},    ;
          {"SERIE"       ,"C", 1,0},    ;
          {"SUB"         ,"C", 2,0},    ;
          {"NUMERO"      ,"N", 6,0},    ;
          {"CFOP"        ,"C", 4,0},    ;
          {"VALORTOT"    ,"N",13,2},    ;
          {"BASE"        ,"N",14,2},    ;
          {"VALOR"       ,"N",14,2},    ;
          {"ISENTA"      ,"N",14,2},    ;
          {"OUTRAS"      ,"N",14,2},    ;
          {"FRETE"       ,"C", 1,2},    ;
          {"SITUACAO"    ,"C", 1,0}}


aDBF75:={ {"TIPO"        ,"C", 2,0}, ;
          {"DATAINI"     ,"SD",8,0}, ;
          {"DATAFIM"     ,"SD",8,0}, ;
          {"CODIGORED"   ,"C",14,0}, ;
          {"CLASSIPI"    ,"C", 8,0}, ;
          {"DESCRICAO"   ,"C",53,0}, ;
          {"UNID"        ,"C", 6,0}, ;
          {"IPI"         ,"N", 5,2}, ;
          {"ICM"         ,"N", 4,2}, ;
          {"REDICM"      ,"N", 4,2}, ;
          {"SUBICM"      ,"N", 4,2}}



      aDBF50:=sdvarrpos(aDBF50)
      aDBF51:=sdvarrpos(aDBF51)
      aDBF53:=sdvarrpos(aDBF53)
      aDBF54:=sdvarrpos(aDBF54)
      aDBF70:=sdvarrpos(aDBF70)
      aDBF75:=sdvarrpos(aDBF75)


      DO WHILE .NOT. FEof(nfile)
         cLINHA:=FReadLine(nfile)
         cREG:=Left(cLINHA,2)
         DO CASE
            CASE cREG="50"
                 oSINT50:APPEND()
                 FOR X:=1 TO 17
                     cCAMPO:=aDBF50[X][1]
                     eVALOR:=sdvpegpos(cLINha,aDBF50,X,.T.)
                     oSINT50:FIELDPUT(cCAMPO,eVALOR)
                 NEXT X
            CASE cREG="51"
                 oSINT51:APPEND()
                 FOR X:=1 TO 14
                     cCAMPO:=aDBF51[X][1]
                     eVALOR:=sdvpegpos(cLINha,aDBF51,X,.T.)
                     IF X<>13
                        oSINT51:FIELDPUT(cCAMPO,eVALOR)
                     ENDIF
                 NEXT X
            CASE cREG="53"
                 oSINT51:APPEND()
                 FOR X:=1 TO 16
                     cCAMPO:=aDBF53[X][1]
                     eVALOR:=sdvpegpos(cLINha,aDBF53,X,.T.)
                     oSINT53:FIELDPUT(cCAMPO,eVALOR)
                 NEXT X
            CASE cREG="54"
                 oSINT54:APPEND()
                 FOR X:=1 TO 16
                     cCAMPO:=aDBF54[X][1]
                     eVALOR:=sdvpegpos(cLINha,aDBF54,X,.T.)
                     oSINT54:FIELDPUT(cCAMPO,eVALOR)
                 NEXT X
            CASE cREG="70"
                 oSINT70:APPEND()
                 FOR X:=1 TO 17
                     cCAMPO:=aDBF70[X][1]
                     eVALOR:=sdvpegpos(cLINha,aDBF70,X,.T.)
                     oSINT70:FieldPut(cCAMPO,eVALOR)
                 NEXT X
            CASE cREG="75"
                 oSINT75:APPEND()
                 FOR X:=1 TO 11
                     cCAMPO:=aDBF75[X][1]
                     eVALOR:=sdvpegpos(cLINha,aDBF75,X,.T.)
                     oSINT75:FieldPut(cCAMPO,eVALOR)
                 NEXT X

         ENDCASE
      ENDDO

      FClose(nFILE)
RETURN .T.	

METHOD cmdsair( ) 
	SELF:endwindow()


METHOD CODLOGIX54(cARQ,cTIPO,cORI) 
LOCAL oORI AS USEREDE
LOCAL oPRO AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL cCODIGO AS STRING
LOCAL cCODINT AS STRING
LOCAL cBUSCA AS STRING
LOCAL lBUSCA AS LOGIC
LOCAL nITEM AS DWORD
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT
LOCAL cCLASSIPI AS STRING
LOCAL oSINT50 AS USEREDE
LOCAL dDATA AS DATE
LOCAL cCGC AS STRING
LOCAL nNUMERO AS DWORD

aDAD:={zCURINI,cORI+".DBF",ZCURDIR}
oORI:=USEREDE{aDAD,.F.}
IF oORI:nERRO#0
    RETURN .F.
ENDIF
IF cORI="SINT75"
  oORI:SetOrder(1) //codigo reduzido SINT75
ELSE	
  oORI:SetOrder(3) //codigo reduzido SINT54
ENDIF
aDAD:={zCURINI,CARQ+".DBF",ZCURDIR}
oPRO:=USEREDE{aDAD,.F.}
IF oPRO:nERRO#0
   oORI:CLOSE()
   RETURN .F.
ENDIF

nLASTREC:=OPRO:RecCount
nPOS:=0
oPRO:GOTOP()
WHILE ! oPRO:EOF
	
	nPerc := INT(100* nPOS/ nLASTREC)
    SELF:oDcProgBar:Position := nPerc	
	nPOS++
	
	cCODIGO:=AllTrim(oPRO:FIELDGET("CODIGO"))
	SELF:oDCchave:Caption:= CCODIGO+" "+StrZero(oPRO:RecNo,8)+"/"+StrZero(nLASTREC,8)
	CBUSCA:=CCODIGO
	cCODINT:=""
	cCLASSIPI:=TIRAOUT(oPRO:FIELDGET("CLASSIPI"))
	lBUSCA:=.F.
	IF CARQ=="MS01" .OR. CARQ=="MP03" .OR. CARQ=="MS01X" .OR. CARQ=="MP03X"
		IF ! Empty(oPRO:FIELDGET("CODIGOINT"))
     	   cCODINT:=oPRO:FIELDGET("CODIGOINT")
     	   cBUSCA:=CCODINT
    	   lBUSCA:=.T.
   	    ENDIF
   	ELSE
   	   lBUSCA:=.T.
	ENDIF	
//    IF cCODIGO="BB-0007"
//       AltD()
//    ENDIF	

    IF lBUSCA
       CBUSCA:=AllTrim(CBUSCA)
       oORI:GOTOP()
       IF oORI:SEEK(cBUSCA)	
          WHILE AllTrim(oORI:FIELDGET("CODIGORED"))=CBUSCA .AND. ! oORI:EOF
          	 IF Empty(oORI:FIELDGET("TIPOENT"))
                oORI:FIELDPUT("TIPOENT",cTIPO)	
                oORI:FIELDPUT("CODIGO",cCODIGO)
                IF cORI="SINT75"
                  IF Val(oORI:FIELDGET("CLASSIPI"))=0
                     oORI:FIELDPUT("CLASSIPI",cCLASSIPI)
                  ENDIF	
                ENDIF
             ENDIF
             oORI:Skip()
          ENDDO
    	ENDIF	
    ENDIF
	oPRO:Skip()
ENDDO
oPRO:CLOSE()

IF CARQ="MS01"     //fazer apenas uma vez
   nLASTREC:=OORI:RecCount
   nPOS:=0
   oORI:GOTOP()
   WHILE ! OORI:EOF
     nPerc := INT(100* nPOS/ nLASTREC)
     SELF:oDcProgBar:Position := nPerc	
	 NPOS++
     SELF:oDCchave:Caption:= oORI:FIELDGET("CODIGO")+" "+Str(oORI:RECNO)
     IF cORI="SINT54"
     	nITEM:=oORI:FIELDGET("ITEM")
        IF nITEM>900
   	       oORI:FIELDPUT("TIPOENT","X")	
   	       DO CASE
   	  	      CASE nITEM=991
	    	       oORI:FIELDPUT("CODIGO","FRETE")
   	  	      CASE nITEM=992
    	           oORI:FIELDPUT("CODIGO","SEGURO")
   	  	      CASE nITEM=993
	               oORI:FIELDPUT("CODIGO","PISCONFINS")
   	  	      CASE nITEM=997
    	           oORI:FIELDPUT("CODIGO","COMPLEMENTO")
   	  	      CASE nITEM=998
	               oORI:FIELDPUT("CODIGO","NAOTRIBUTADO")
   	  	      CASE nITEM=999
	               oORI:FIELDPUT("CODIGO","ACESSORIAS")
           ENDCASE
        ENDIF
     ENDIF	
     IF Left(oORI:FIELDGET("CODIGO"),3)="99.9"
        oORI:FIELDPUT("TIPOENT","X")	
        oORI:FIELDPUT("CODIGO","DIVERSOS")
     ENDIF	
     oORI:SKIP()	
   ENDDO
ENDIF


IF CARQ="MS01" .AND. cORI="SINT54"     //fazer apenas uma vez
   AltD()
   oORI:SetOrder(6) //cgc+str(numero,8)
   aDAD:={zCURINI,"SINT50.DBF",ZCURDIR}
   oSINT50:=USEREDE{aDAD,.F.}
   IF oSINT50:nERRO#0
      RETURN .F.
   ENDIF
   nLASTREC:=OSINT50:RecCount
   nPOS:=0
   oSINT50:SETORDER(0) //processar sem indexacao
   oSINT50:GOTOP()
   WHILE ! oSINT50:EoF
       nnumero:=OSINT50:FIELDGET("NUMERO")
       CCGC:=OSINT50:FIELDGET("CGC")
       DDATA:=OSINT50:FIELDGET("DATA")
       CBUSCA:=Str(NNUMERO,8)+cCGC
       nPerc := INT(100* nPOS/ nLASTREC)
       SELF:oDcProgBar:Position := nPerc	
	   NPOS++
       SELF:oDCchave:Caption:= CBUSCA
       oORI:GOTOP()
       oORI:SEEK(cBUSCA)	
   	   WHILE cCGC=OORI:FIELDGET("CGC") .AND. NNUMERO=OORI:FIELDGET("NUMERO") .AND. ! oORI:EOF
   	   	   OORI:FIELDPUT("DATA",DDATA)
   	   	   oori:Skip()
   	   ENDDO	
   	   oSINT50:Skip()
   ENDDO	
ENDIF

oORI:CLOSE()
//alert("Sincronizacao Concluida:" + cARQ)


METHOD exportarOLD(CREG) 
LOCAL oORI AS USEREDE
LOCAL oDES AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT

aDAD:={zCURINI,"SI"+CREG+".DBF",ZCURDIR}
oORI:=USEREDE{aDAD,.F.}
IF oORI:nERRO#0
    RETURN .F.
ENDIF
aDAD:={zCURINI,"SINT"+CREG+".DBF",ZCURDIR}
oDES:=USEREDE{aDAD,.F.}
IF oDES:nERRO#0
   oORI:CLOSE()
   RETURN .F.
ENDIF
oDES:ZAP()
nPOS:=0
nLASTREC:=oORi:RecCount
oORI:GOTOP()
WHILE .NOT. oORI:EOF
	SELF:oDCchave:Caption:=Str(oORI:RecNo)+"/"+Str(nLASTREC)
	nPerc := INT(100* nPOS/ nLASTREC)
    SELF:oDcProgBar:Position := nPerc	
 	nPOS++
    oDES:APPEND()	
	oDES:FIELDPUT("TIPO",oORI:FIELDGET("TIPO"))
	IF cREG="50" .or. cREG="51" .OR. cREG="53" .OR. cREG="70"
	   oDES:FIELDPUT("CGC",oORI:FIELDGET("CGC"))
	   oDES:FIELDPUT("IE",oORI:FIELDGET("IE"))
	   oDES:FIELDPUT("DATA",SToD(oORI:FIELDGET("DATA")))
	   oDES:FIELDPUT("UF",oORI:FIELDGET("UF"))
	   oDES:FIELDPUT("SERIE",oORI:FIELDGET("SERIE"))
	   oDES:FIELDPUT("NUMERO",Val(oORI:FIELDGET("NUMERO")))
	   oDES:FIELDPUT("CFOP",oORI:FIELDGET("CFOP"))
	   oDES:FIELDPUT("VALOR",Val(oORI:FIELDGET("VALOR"))/100)
	   oDES:FIELDPUT("SITUACAO",oORI:FIELDGET("SITUACAO"))	 //aqui cancelada sn
	ENDIF	
    IF cREG="50" .or. cREG="51" .or. cREG="70"
	   oDES:FIELDPUT("VALORTOT",Val(oORI:FIELDGET("VALORTOT"))/100)
   	   oDES:FIELDPUT("ISENTA",Val(oORI:FIELDGET("ISENTA"))/100)
	   oDES:FIELDPUT("OUTRAS",Val(oORI:FIELDGET("OUTRAS"))/100)
	ENDIF
	IF cREG="50" .OR. cREG="53"
	   oDES:FIELDPUT("EMITENTE",oORI:FIELDGET("EMITENTE"))		
	ENDIF	
	IF cREG="50" .OR. cREG="53" .or. cREG="70"
       oDES:FIELDPUT("BASE",Val(oORI:FIELDGET("BASE"))/100)
  	   oDES:FIELDPUT("MODELO",Val(oORI:FIELDGET("MODELO")))		
	ENDIF	
	IF cREG="50"
       oDES:FIELDPUT("ALIQUOTA",Val(oORI:FIELDGET("ALIQUOTA"))/100)
	ENDIF	
	IF cREG="53"
       oDES:FIELDPUT("DESPESAS",Val(oORI:FIELDGET("DESPESAS"))/100)	
	   oDES:FIELDPUT("ANTECIPA",oORI:FIELDGET("ANTECIPA"))	
    ENDIF
	IF cREG="70"
	   oDES:FIELDPUT("SUB",oORI:FIELDGET("SUB"))	
	   oDES:FIELDPUT("FRETE",oORI:FIELDGET("FRETE"))	
    ENDIF
    IF cREG="54"
       oDES:FIELDPUT("CGC",oORI:FIELDGET("CGC"))	
       oDES:FIELDPUT("MODELO",Val(oORI:FIELDGET("MODELO")))	
       oDES:FIELDPUT("SERIE",oORI:FIELDGET("SERIE"))	
       oDES:FIELDPUT("NUMERO",Val(oORI:FIELDGET("NUMERO")))	
       oDES:FIELDPUT("CFOP",oORI:FIELDGET("CFOP"))	
       oDES:FIELDPUT("SITUACAO",Val(oORI:FIELDGET("SITUACAO")))	 //aqui situcao tributaria
       oDES:FIELDPUT("item",Val(oORI:FIELDGET("item")))	
       oDES:FIELDPUT("CODIGORED",oORI:FIELDGET("CODIGORED"))	
       oDES:FIELDPUT("QTDE",Val(oORI:FIELDGET("QTDE"))/1000)	
       oDES:FIELDPUT("VALORMER",Val(oORI:FIELDGET("VALORMER"))/100)	
       oDES:FIELDPUT("DESCONTO",Val(oORI:FIELDGET("DESCONTO"))/100)	
       oDES:FIELDPUT("BASEICM",Val(oORI:FIELDGET("BASEICM"))/100)	
       oDES:FIELDPUT("BASESUB",Val(oORI:FIELDGET("BASESUB"))/100)	
       oDES:FIELDPUT("VALORIPI",Val(oORI:FIELDGET("VALORIPI"))/100)	
       oDES:FIELDPUT("ICM",Val(oORI:FIELDGET("ICM"))/100)	
    ENDIF
    IF cREG="75"
       oDES:FIELDPUT("CODIGORED",oORI:FIELDGET("CODIGORED"))	
       oDES:FIELDPUT("DATAINI",SToD(oORI:FIELDGET("DATAINI")))	
       oDES:FIELDPUT("DATAFIM",SToD(oORI:FIELDGET("DATAFIM")))
       oDES:FIELDPUT("CLASSIPI",TIRAOUT(oORI:FIELDGET("CLASSIPI"))	)
       oDES:FIELDPUT("DESCRICAO",oORI:FIELDGET("DESCRICAO"))
       oDES:FIELDPUT("UNID",oORI:FIELDGET("UNID"))		
       oDES:FIELDPUT("IPI",Val(oORI:FIELDGET("IPI"))/100)	
       oDES:FIELDPUT("ICM",Val(oORI:FIELDGET("ICM"))/100)	
       oDES:FIELDPUT("REDICM",Val(oORI:FIELDGET("REDICM"))/100)	
       oDES:FIELDPUT("SUBICM",Val(oORI:FIELDGET("SUBICM"))/100)	
   	ENDIF
    oori:Skip()
ENDDO
oORI:CLOSE()
oDES:CLOSE()	
alert("registro "+creg+ " exportado")



CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JIMPTXT",_GetInst()},iCtlID)

oCCcmdsair := PushButton{SELF,ResourceID{JIMPTXT_CMDSAIR,_GetInst()}}
oCCcmdsair:HyperLabel := HyperLabel{#cmdsair,"Sair",NULL_STRING,NULL_STRING}

oCCcmdimp := PushButton{SELF,ResourceID{JIMPTXT_CMDIMP,_GetInst()}}
oCCcmdimp:HyperLabel := HyperLabel{#cmdimp,"Importar Arquivo de Texto",NULL_STRING,NULL_STRING}

oDCarquivo := pbFileSLE{SELF,ResourceID{JIMPTXT_ARQUIVO,_GetInst()}}
oDCarquivo:HyperLabel := HyperLabel{#arquivo,NULL_STRING,NULL_STRING,NULL_STRING}

oCCPushButton3 := PushButton{SELF,ResourceID{JIMPTXT_PUSHBUTTON3,_GetInst()}}
oCCPushButton3:HyperLabel := HyperLabel{#PushButton3,"Sincronizar 54 Outros/Mana5",NULL_STRING,NULL_STRING}

oCCPushButton4 := PushButton{SELF,ResourceID{JIMPTXT_PUSHBUTTON4,_GetInst()}}
oCCPushButton4:HyperLabel := HyperLabel{#PushButton4,"Sincronizar CNPJ Mana5",NULL_STRING,NULL_STRING}

oDCchave := FixedText{SELF,ResourceID{JIMPTXT_CHAVE,_GetInst()}}
oDCchave:HyperLabel := HyperLabel{#chave,NULL_STRING,NULL_STRING,NULL_STRING}

oCCPushButton5 := PushButton{SELF,ResourceID{JIMPTXT_PUSHBUTTON5,_GetInst()}}
oCCPushButton5:HyperLabel := HyperLabel{#PushButton5,"Sincronizar 75 Classificacao",NULL_STRING,NULL_STRING}

oDCProgBar := ProgressBar{SELF,ResourceID{JIMPTXT_PROGBAR,_GetInst()}}
oDCProgBar:Range := Range{0,100}
oDCProgBar:HyperLabel := HyperLabel{#ProgBar,NULL_STRING,NULL_STRING,NULL_STRING}

SELF:Caption := "Importacao Arquivo Sintegra"
SELF:HyperLabel := HyperLabel{#JIMPTXT,"Importacao Arquivo Sintegra",NULL_STRING,NULL_STRING}

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	FabCenterWindow( SELF )
	RETURN NIL


METHOD PushButton3( ) 
SELF:CODLOGIX54("MS01","P","SINT54")	
SELF:CODLOGIX54("MS01X","P","SINT54")	

SELF:CODLOGIX54("MU01","M","SINT54")	
SELF:CODLOGIX54("MT01","C","SINT54")	

SELF:CODLOGIX54("MW05","O","SINT54")	
SELF:CODLOGIX54("MW07","R","SINT54")	
SELF:CODLOGIX54("MR01","B","SINT54")	
SELF:CODLOGIX54("MP03X","T","SINT54")		

SELF:CODLOGIX54("MQ01","S","SINT54")		
SELF:CODLOGIX54("MQ01X","S","SINT54")		

SELF:CODLOGIX54("MP03","T","SINT54")		
alert("Sincronizacao Concluida:" )	
//SELF:CODLOGIX75()  //classificacao

METHOD PushButton4( ) 
	IMPFOR()
    IMPCLI()
	SELF:CHECKfor("50")	
	SELF:CHECKfor("51")	
    SELF:CHECKfor("53")	
  	SELF:CHECKfor("70")	
	SELF:CHECKfor("54")	
	alert("Sincronizacao Concluida:" )	

METHOD PushButton5( ) 
SELF:CODLOGIX54("MS01","P","SINT75")	
SELF:CODLOGIX54("MS01X","P","SINT75")	
SELF:CODLOGIX54("MT01","C","SINT75")	
SELF:CODLOGIX54("MU01","M","SINT75")	
SELF:CODLOGIX54("MW05","O","SINT75")	
SELF:CODLOGIX54("MW07","R","SINT75")	
SELF:CODLOGIX54("MR01","B","SINT75")		
SELF:CODLOGIX54("MP03X","T","SINT75")	

SELF:CODLOGIX54("MQ01","S","SINT75")		
SELF:CODLOGIX54("MQ01X","S","SINT75")		

		
SELF:CODLOGIX54("MP03","T","SINT75")			
	
alert("Sincronizacao Concluida:" )	

END CLASS
