#region DEFINES
STATIC DEFINE JIACMES_BUSCANUM := 124 
STATIC DEFINE JIACMES_CGC := 122 
STATIC DEFINE JIACMES_CODCLIENTE := 120 
STATIC DEFINE JIACMES_CODIGO := 115 
STATIC DEFINE JIACMES_CODIGOINT := 119 
STATIC DEFINE JIACMES_DATA := 111 
STATIC DEFINE JIACMES_ENTREGA := 116 
STATIC DEFINE JIACMES_FORNECEDO := 112 
STATIC DEFINE JIACMES_INDEXPB := 123 
STATIC DEFINE JIACMES_NOME := 121 
STATIC DEFINE JIACMES_NUMERO := 110 
STATIC DEFINE JIACMES_OS := 113 
STATIC DEFINE JIACMES_OSITEM := 118 
STATIC DEFINE JIACMES_QTDE := 114 
STATIC DEFINE JIACMES_QTDESAL := 117 
STATIC DEFINE JIACMES_SC_CGC := 109 
STATIC DEFINE JIACMES_SC_CODCLIENTE := 107 
STATIC DEFINE JIACMES_SC_CODIGO := 104 
STATIC DEFINE JIACMES_SC_CODIGOINT := 106 
STATIC DEFINE JIACMES_SC_DATA := 101 
STATIC DEFINE JIACMES_SC_NOME := 108 
STATIC DEFINE JIACMES_SC_NUMERO := 100 
STATIC DEFINE JIACMES_SC_OS := 102 
STATIC DEFINE JIACMES_SC_OSITEM := 105 
STATIC DEFINE JIACMES_SC_QTDE := 103 
STATIC DEFINE JIACSEQ_ANO := 103 
STATIC DEFINE JIACSEQ_ANUAL := 116 
STATIC DEFINE JIACSEQ_BUSCANUM := 117 
STATIC DEFINE JIACSEQ_CHAVE := 124 
STATIC DEFINE JIACSEQ_CMDANUAL := 131 
STATIC DEFINE JIACSEQ_CMDAPURAR := 126 
STATIC DEFINE JIACSEQ_CMDCHKTIP := 125 
STATIC DEFINE JIACSEQ_CMDCRIAARQ := 119 
STATIC DEFINE JIACSEQ_CMDCRIAARQ1 := 121 
STATIC DEFINE JIACSEQ_CMDLIMPAR := 127 
STATIC DEFINE JIACSEQ_CMDSEMES := 130 
STATIC DEFINE JIACSEQ_DESCR2 := 118 
STATIC DEFINE JIACSEQ_DESCRI := 104 
STATIC DEFINE JIACSEQ_DIAFIM := 101 
STATIC DEFINE JIACSEQ_DIAINI := 100 
STATIC DEFINE JIACSEQ_INDEXPB := 120 
STATIC DEFINE JIACSEQ_MES := 102 
STATIC DEFINE JIACSEQ_NUMERO := 128 
STATIC DEFINE JIACSEQ_PEGCOMP := 112 
STATIC DEFINE JIACSEQ_PROGBAR := 123 
STATIC DEFINE JIACSEQ_PUSHBUTTON10 := 129 
STATIC DEFINE JIACSEQ_PUSHBUTTON9 := 122 
STATIC DEFINE JIACSEQ_SC_ANO := 109 
STATIC DEFINE JIACSEQ_SC_DESCRI := 108 
STATIC DEFINE JIACSEQ_SC_DIAFIM := 110 
STATIC DEFINE JIACSEQ_SC_DIAINI := 106 
STATIC DEFINE JIACSEQ_SC_MES := 107 
STATIC DEFINE JIACSEQ_SC_SEQ := 105 
STATIC DEFINE JIACSEQ_SC_SEQ1 := 113 
STATIC DEFINE JIACSEQ_SC_SEQ2 := 114 
STATIC DEFINE JIACSEQ_SEMES := 115 
STATIC DEFINE JIACSEQ_SEQ := 111 
STATIC DEFINE JTLP_SEMESTRAL := 122 
#endregion

CLASS JIACMES INHERIT MYDataWindow 

	PROTECT oDBNUMERO AS DataColumn
	PROTECT oDBDATA AS DataColumn
	PROTECT oDBFORNECEDO AS DataColumn
	PROTECT oDBENTREGA AS DataColumn
	PROTECT oDBQTDESAL AS DataColumn
	PROTECT oDBQTDE AS DataColumn
	PROTECT oDBCODIGO AS DataColumn
	PROTECT oDCSC_NUMERO AS FIXEDTEXT
	PROTECT oDCSC_DATA AS FIXEDTEXT
	PROTECT oDCSC_OS AS FIXEDTEXT
	PROTECT oDCSC_QTDE AS FIXEDTEXT
	PROTECT oDCSC_CODIGO AS FIXEDTEXT
	PROTECT oDCSC_OSITEM AS FIXEDTEXT
	PROTECT oDCSC_CODIGOINT AS FIXEDTEXT
	PROTECT oDCSC_CODCLIENTE AS FIXEDTEXT
	PROTECT oDCSC_NOME AS FIXEDTEXT
	PROTECT oDCSC_CGC AS FIXEDTEXT
	PROTECT oDCNUMERO AS RIGHTSLE
	PROTECT oDCDATA AS DATESLE
	PROTECT oDCFORNECEDO AS RIGHTSLE
	PROTECT oDCOS AS RIGHTSLE
	PROTECT oDCQTDE AS RIGHTSLE
	PROTECT oDCCODIGO AS SINGLELINEEDIT
	PROTECT oDCENTREGA AS DATESLE
	PROTECT oDCQTDESAL AS RIGHTSLE
	PROTECT oDCOSITEM AS RIGHTSLE
	PROTECT oDCCODIGOINT AS SINGLELINEEDIT
	PROTECT oDCCODCLIENTE AS SINGLELINEEDIT
	PROTECT oDCNOME AS SINGLELINEEDIT
	PROTECT oDCCGC AS SINGLELINEEDIT
	PROTECT oCCIndexPB AS PUSHBUTTON
	PROTECT oCCBuscanum AS PUSHBUTTON
// 	instance NUMERO 
// 	instance DATA 
// 	instance FORNECEDO 
// 	instance OS 
// 	instance QTDE 
// 	instance CODIGO 
// 	instance ENTREGA 
// 	instance QTDESAL 
// 	instance OSITEM 
// 	instance CODIGOINT 
// 	instance CODCLIENTE 
// 	instance NOME 
// 	instance CGC 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Buscanum( ) 
	SELF:KeyFind()

ACCESS CGC() 
RETURN SELF:FieldGet(#CGC)


ASSIGN CGC(uValue) 
SELF:FieldPut(#CGC, uValue)
RETURN CGC := uValue


METHOD CMDimprimir( ) 
SELF:XWRPTGRP("IAC","")	

ACCESS CODCLIENTE() 
RETURN SELF:FieldGet(#CODCLIENTE)


ASSIGN CODCLIENTE(uValue) 
SELF:FieldPut(#CODCLIENTE, uValue)
RETURN CODCLIENTE := uValue


ACCESS CODIGO() 
RETURN SELF:FieldGet(#CODIGO)


ASSIGN CODIGO(uValue) 
SELF:FieldPut(#CODIGO, uValue)
RETURN CODIGO := uValue


ACCESS CODIGOINT() 
RETURN SELF:FieldGet(#CODIGOINT)


ASSIGN CODIGOINT(uValue) 
SELF:FieldPut(#CODIGOINT, uValue)
RETURN CODIGOINT := uValue


ACCESS DATA() 
RETURN SELF:FieldGet(#DATA)


ASSIGN DATA(uValue) 
SELF:FieldPut(#DATA, uValue)
RETURN DATA := uValue


ACCESS ENTREGA() 
RETURN SELF:FieldGet(#ENTREGA)


ASSIGN ENTREGA(uValue) 
SELF:FieldPut(#ENTREGA, uValue)
RETURN ENTREGA := uValue


ACCESS FORNECEDO() 
RETURN SELF:FieldGet(#FORNECEDO)


ASSIGN FORNECEDO(uValue) 
SELF:FieldPut(#FORNECEDO, uValue)
RETURN FORNECEDO := uValue


METHOD IndexPB( ) 
	SELF:KeyFind()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JIACMES",_GetInst()},iCtlID)

oDCSC_NUMERO := FixedText{SELF,ResourceID{JIACMES_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Nº NF:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{SELF,ResourceID{JIACMES_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_OS := FixedText{SELF,ResourceID{JIACMES_SC_OS,_GetInst()}}
oDCSC_OS:HyperLabel := HyperLabel{#SC_OS,"Os:",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{SELF,ResourceID{JIACMES_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{SELF,ResourceID{JIACMES_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_OSITEM := FixedText{SELF,ResourceID{JIACMES_SC_OSITEM,_GetInst()}}
oDCSC_OSITEM:HyperLabel := HyperLabel{#SC_OSITEM,"Ositem:",NULL_STRING,NULL_STRING}

oDCSC_CODIGOINT := FixedText{SELF,ResourceID{JIACMES_SC_CODIGOINT,_GetInst()}}
oDCSC_CODIGOINT:HyperLabel := HyperLabel{#SC_CODIGOINT,"Codigoint:",NULL_STRING,NULL_STRING}

oDCSC_CODCLIENTE := FixedText{SELF,ResourceID{JIACMES_SC_CODCLIENTE,_GetInst()}}
oDCSC_CODCLIENTE:HyperLabel := HyperLabel{#SC_CODCLIENTE,"Cliente",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{SELF,ResourceID{JIACMES_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_CGC := FixedText{SELF,ResourceID{JIACMES_SC_CGC,_GetInst()}}
oDCSC_CGC:HyperLabel := HyperLabel{#SC_CGC,"Cgc:",NULL_STRING,NULL_STRING}

oDCNUMERO := rightSle{SELF,ResourceID{JIACMES_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"IC200605_NUMERO"}

oDCDATA := DateSle{SELF,ResourceID{JIACMES_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"IC200605_DATA"}

oDCFORNECEDO := rightSle{SELF,ResourceID{JIACMES_FORNECEDO,_GetInst()}}
oDCFORNECEDO:FieldSpec := PADRAO_NUM_08{}
oDCFORNECEDO:HyperLabel := HyperLabel{#FORNECEDO,"Fornecedo:",NULL_STRING,"IC200605_FORNECEDO"}

oDCOS := rightSle{SELF,ResourceID{JIACMES_OS,_GetInst()}}
oDCOS:FieldSpec := PADRAO_NUM_08{}
oDCOS:HyperLabel := HyperLabel{#OS,"Os:",NULL_STRING,"IC200605_OS"}

oDCQTDE := rightSle{SELF,ResourceID{JIACMES_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := PADRAO_NUM_10_3{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"IC200605_QTDE"}

oDCCODIGO := SingleLineEdit{SELF,ResourceID{JIACMES_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"IC200605_CODIGO"}

oDCENTREGA := DateSle{SELF,ResourceID{JIACMES_ENTREGA,_GetInst()}}
oDCENTREGA:FieldSpec := DATE_FIELD{}
oDCENTREGA:HyperLabel := HyperLabel{#ENTREGA,"Entrega:",NULL_STRING,"IC200605_ENTREGA"}

oDCQTDESAL := rightSle{SELF,ResourceID{JIACMES_QTDESAL,_GetInst()}}
oDCQTDESAL:FieldSpec := PADRAO_NUM_10_3{}
oDCQTDESAL:HyperLabel := HyperLabel{#QTDESAL,"QtdeEnt:",NULL_STRING,"IC200605_QTDESAL"}

oDCOSITEM := rightSle{SELF,ResourceID{JIACMES_OSITEM,_GetInst()}}
oDCOSITEM:FieldSpec := PADRAO_NUM_08{}
oDCOSITEM:HyperLabel := HyperLabel{#OSITEM,"Ositem:",NULL_STRING,"IC200605_OSITEM"}

oDCCODIGOINT := SingleLineEdit{SELF,ResourceID{JIACMES_CODIGOINT,_GetInst()}}
oDCCODIGOINT:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT,"Codigoint:",NULL_STRING,"IC200605_CODIGOINT"}

oDCCODCLIENTE := SingleLineEdit{SELF,ResourceID{JIACMES_CODCLIENTE,_GetInst()}}
oDCCODCLIENTE:FieldSpec := PADRAO_CHAR_14{}
oDCCODCLIENTE:HyperLabel := HyperLabel{#CODCLIENTE,"Codcliente:",NULL_STRING,"IC200605_CODCLIENTE"}

oDCNOME := SingleLineEdit{SELF,ResourceID{JIACMES_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_25{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"IC200605_NOME"}

oDCCGC := SingleLineEdit{SELF,ResourceID{JIACMES_CGC,_GetInst()}}
oDCCGC:FieldSpec := PADRAO_CHAR_18{}
oDCCGC:HyperLabel := HyperLabel{#CGC,"Cgc:",NULL_STRING,"IC200605_CGC"}

oCCIndexPB := PushButton{SELF,ResourceID{JIACMES_INDEXPB,_GetInst()}}
oCCIndexPB:Image := ico_az{}
oCCIndexPB:HyperLabel := HyperLabel{#IndexPB,NULL_STRING,NULL_STRING,NULL_STRING}
oCCIndexPB:TooltipText := "Ordenar"

oCCBuscanum := PushButton{SELF,ResourceID{JIACMES_BUSCANUM,_GetInst()}}
oCCBuscanum:Image := ico_find{}
oCCBuscanum:HyperLabel := HyperLabel{#Buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCBuscanum:TooltipText := "Localizar"

SELF:Caption := "Checagem IAC"
SELF:HyperLabel := HyperLabel{#JIACMES,"Checagem IAC",NULL_STRING,NULL_STRING}
SELF:Menu := STANDARDSHELLMENU{}

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF
SELF:Browser := DataBrowser{SELF}

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
SELF:Browser:AddColumn(oDBNUMERO)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 10
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
SELF:Browser:AddColumn(oDBDATA)

oDBFORNECEDO := DataColumn{PADRAO_NUM_08{}}
oDBFORNECEDO:Width := 11
oDBFORNECEDO:HyperLabel := oDCFORNECEDO:HyperLabel 
oDBFORNECEDO:Caption := "Fornecedo:"
SELF:Browser:AddColumn(oDBFORNECEDO)

oDBENTREGA := DataColumn{DATE_FIELD{}}
oDBENTREGA:Width := 10
oDBENTREGA:HyperLabel := oDCENTREGA:HyperLabel 
oDBENTREGA:Caption := "Entrega:"
SELF:Browser:AddColumn(oDBENTREGA)

oDBQTDESAL := DataColumn{PADRAO_NUM_10_3{}}
oDBQTDESAL:Width := 9
oDBQTDESAL:HyperLabel := oDCQTDESAL:HyperLabel 
oDBQTDESAL:Caption := "QtdeEnt:"
SELF:Browser:AddColumn(oDBQTDESAL)

oDBQTDE := DataColumn{PADRAO_NUM_10_3{}}
oDBQTDE:Width := 9
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
SELF:Browser:AddColumn(oDBQTDE)

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 18
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
SELF:Browser:AddColumn(oDBCODIGO)


SELF:ViewAs(#FormView)

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


ACCESS NOME() 
RETURN SELF:FieldGet(#NOME)


ASSIGN NOME(uValue) 
SELF:FieldPut(#NOME, uValue)
RETURN NOME := uValue


ACCESS NUMERO() 
RETURN SELF:FieldGet(#NUMERO)


ASSIGN NUMERO(uValue) 
SELF:FieldPut(#NUMERO, uValue)
RETURN NUMERO := uValue


ACCESS OS() 
RETURN SELF:FieldGet(#OS)


ASSIGN OS(uValue) 
SELF:FieldPut(#OS, uValue)
RETURN OS := uValue


ACCESS OSITEM() 
RETURN SELF:FieldGet(#OSITEM)


ASSIGN OSITEM(uValue) 
SELF:FieldPut(#OSITEM, uValue)
RETURN OSITEM := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		    FabCenterWindow( SELF )
	RETURN NIL


ACCESS QTDE() 
RETURN SELF:FieldGet(#QTDE)


ASSIGN QTDE(uValue) 
SELF:FieldPut(#QTDE, uValue)
RETURN QTDE := uValue


ACCESS QTDESAL() 
RETURN SELF:FieldGet(#QTDESAL)


ASSIGN QTDESAL(uValue) 
SELF:FieldPut(#QTDESAL, uValue)
RETURN QTDESAL := uValue


END CLASS
CLASS JIACSEQ INHERIT MYDataWindow 

	PROTECT oDBSEQ AS DataColumn
	PROTECT oDBMES AS DataColumn
	PROTECT oDBANO AS DataColumn
	PROTECT oDBDESCRI AS DataColumn
	PROTECT oDBANUAL AS DataColumn
	PROTECT oDBSEMES AS DataColumn
	PROTECT oDCDIAINI AS DATETIMEPICKER
	PROTECT oDCDIAFIM AS DATETIMEPICKER
	PROTECT oDCMES AS SINGLELINEEDIT
	PROTECT oDCANO AS SINGLELINEEDIT
	PROTECT oDCDESCRI AS SINGLELINEEDIT
	PROTECT oDCSC_SEQ AS FIXEDTEXT
	PROTECT oDCSC_DIAINI AS FIXEDTEXT
	PROTECT oDCSC_MES AS FIXEDTEXT
	PROTECT oDCSC_DESCRI AS FIXEDTEXT
	PROTECT oDCSC_ANO AS FIXEDTEXT
	PROTECT oDCSC_DIAFIM AS FIXEDTEXT
	PROTECT oDCSEQ AS SINGLELINEEDIT
	PROTECT oCCpegcomp AS PUSHBUTTON
	PROTECT oDCSC_SEQ1 AS FIXEDTEXT
	PROTECT oDCSC_SEQ2 AS FIXEDTEXT
	PROTECT oDCSEMES AS SINGLELINEEDIT
	PROTECT oDCANUAL AS SINGLELINEEDIT
	PROTECT oCCBuscanum AS PUSHBUTTON
	PROTECT oDCDESCR2 AS SINGLELINEEDIT
	PROTECT oCCcmdcriaarq AS PUSHBUTTON
	PROTECT oCCIndexPB AS PUSHBUTTON
	PROTECT oCCcmdcriaarq1 AS PUSHBUTTON
	PROTECT oCCPushButton9 AS PUSHBUTTON
	PROTECT oDCProgBar AS PROGRESSBAR
	PROTECT oDCchave AS FIXEDTEXT
	PROTECT oCCcmdchktip AS PUSHBUTTON
	PROTECT oCCcmdApurar AS PUSHBUTTON
	PROTECT oCCcmdLimpar AS PUSHBUTTON
	PROTECT oDCNUMERO AS SINGLELINEEDIT
	PROTECT oCCPushButton10 AS PUSHBUTTON
	PROTECT oCCcmdSemes AS PUSHBUTTON
	PROTECT oCCcmdAnual AS PUSHBUTTON
// 	instance MES 
// 	instance ANO 
// 	instance DESCRI 
// 	instance SEQ 
// 	instance SEMES 
// 	instance ANUAL 
// 	instance DESCR2 
// 	instance NUMERO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

ACCESS ANO() 
RETURN SELF:FieldGet(#ANO)


ASSIGN ANO(uValue) 
SELF:FieldPut(#ANO, uValue)
RETURN ANO := uValue


ACCESS ANUAL() 
RETURN SELF:FieldGet(#ANUAL)


ASSIGN ANUAL(uValue) 
SELF:FieldPut(#ANUAL, uValue)
RETURN ANUAL := uValue


METHOD APPEND() 
LOCAL nSEQ AS DWORD
SELF:server:setorder(1)
SELF:server:gobottom()
nSEQ:=SELF:Server:FIELDGET("SEQ")
nSEQ++
SUPER:append()
SELF:SERVER:FIELDPUT("SEQ",nSEQ)
RETU SELF

METHOD Buscanum( ) 
	SELF:KeyFind()

METHOD cmdAnual( ) 
	SELF:SERVER:FIELDPUT("ANUAL",SIMNAO(SELF:SERVER:FIELDGET("ANUAL")))

METHOD cmdApurar( ) 
LOCAL cARQ,cDIRE,cEMPLOGIX AS STRING	
LOCAL oSERVER AS DBSERVER
LOCAL oMA01,oMS01  AS USEREDE
LOCAL oBS1,oBS2,oBS5,oBS6 AS USEMANA5
LOCAL QTDE,QTDESAL AS FLOAT
LOCAL nTOTENT,nCLIENT,nCODENT AS DWORD
LOCAL nTOTQTD,nCLIQTD,nCODQTD AS FLOAT

LOCAL nTOTF1,nTOTF2,nTOTF0 AS DWORD
LOCAL nCLIF1,nCLIF2,nCLIF0 AS DWORD
LOCAL nCODF1,nCODF2,nCODF0 AS DWORD

LOCAL nTOTQF1,nTOTQF2,nTOTQF0 AS FLOAT
LOCAL nCLIQF1,nCLIQF2,nCLIQF0 AS FLOAT
LOCAL nCODQF1,nCODQF2,nCODQF0 AS FLOAT

LOCAL cCODIGO,cCOGNOME,cGRUPO,cNOME,cCLINOME AS STRING
LOCAL nCLIENTE,nMES,nANO AS DWORD
LOCAL DATA,ENTREGA AS DATE
LOCAL nPOS AS DWORD
LOCAL aDAD AS ARRAY
LOCAL nLASTREC AS DWORD
LOCAL nPERC AS INT
  
nTOTQF1:=0
nTOTQF2:=0
nTOTQF0:=0


SELF:cmdLimpar()

nANO:=SELF:SERVER:FIELDGET("ANO")
nMES:=SELF:SERVER:FIELDGET("MES")

cDIRE:=PEGINIVAL(ZCURINI,"SISTEMAS","MANA5P")+"E"+StrZero(zempresa,3)+StrZero(SELF:ANO,4)+"\"
cARQ:="IC"+Right(StrZero(SELF:ANO,4),2)+StrZero(SELF:MES,2)

IF ! File(cDIRE+cARQ+".DBF")
   alert("Mes Nao Aberto")	
   RETU SELF
ENDIF	
oSERVER:=DBSERVER{cDIRE+CARQ,,,"DBFCDX"}
IF ! oSERVER:USED
   RETU SELF
ENDIF

aDAD:={zCURINI,"MA01.DBF",ZCURDIR}
oMA01:=USEREDE{aDAD,.F.}
IF oMA01:nERRO#0
   oSERVER:CLOSE()
   RETURN .f.
ENDIF

aDAD:={zCURINI,"MS01.DBF",ZCURDIR}
oMS01:=USEREDE{aDAD,.F.}
IF oMS01:nERRO#0
   oMA01:CLOSE()
   oSERVER:CLOSE()
   RETURN .f.
ENDIF

aDAD:={zCURINI,"BS2",ZCURDIR}
oBS2:=USEMANA5{aDAD}
IF oBS2:nERRO#0
   oSERVER:CLOSE()
   oMA01:CLOSE()
   oMS01:CLOSE()
   RETURN .f.
ENDIF

aDAD:={zCURINI,"BS5",ZCURDIR}
oBS5:=USEMANA5{aDAD}
IF oBS5:nERRO#0
   oSERVER:CLOSE()
   oMA01:CLOSE()
   oMS01:CLOSE()
   oBS2:CLOSE()
   RETURN .f.
ENDIF

aDAD:={zCURINI,"BS6",ZCURDIR}
oBS6:=USEMANA5{aDAD}
IF oBS6:nERRO#0
   oSERVER:CLOSE()
   oMA01:CLOSE()
   oMS01:CLOSE()
   oBS2:CLOSE()
   oBS5:CLOSE()
   RETURN .f.
ENDIF




nTOTENT:=0
nTOTQTD:=0	
nTOTF1:=0
nTOTF2:=0
nTOTF0:=0


nLASTREC:=Oserver:RecCount
nPOS:=0
oSERVER:SETORDER(6)
oSERVER:GOTOP()
WHILE ! oSERVER:EOF
   	nPerc := INT(100* nPOS/ nLASTREC)
    SELF:oDcProgBar:Position := nPerc	
  	 nPOS++
    SELF:oDCchave:Caption:=Str(oSERVER:RecNo,8)
 	nTOTENT+=1
    nTOTQTD+=oSERVER:FIELDGET("QTDE")		
	oSErVER:SKIP()
ENDDO


nPOS:=0
oSERVER:SETORDER(6)
oSERVER:GOTOP()
WHILE ! oSERVER:EOF
    nCLIENTE:=OSERVER:FIELDGET("FORNECEDO")
    nCLIENT:=0
    nCLIQTD:=0	
    nCLIF1:=0
    nCLIF2:=0
    nCLIF0:=0
    nCLIqF1:=0
    nCLIqF2:=0
    nCLIqF0:=0
    cCOGNOME:=OSERVER:FIELDGET("COGNOME")
    cGRUPO:=""
    cCLINOME:=""
    cEMPLOGIX:=OSERVER:FIELDGET("EMPLOGIX")
    oMA01:GOTOP()
    IF oMA01:SEEK(nCLIENTE)
       cCOGNOME:=oMA01:FIELDGET("COGNOME")
       cGRUPO:=oMA01:FIELDGET("GRUPOEMP")
       cCLINOME:=oMA01:FIELDGET("NOME")
    ENDIF	
    WHILE NCLIENTE=OSERVER:FIELDGET("FORNECEDO")  .AND. ! oSERVER:EOF
   	   cCODIGO:=oSERVER:FIELDGET("CODIGO")
	   nCODENT:=0
       nCODQTD:=0	
       nCODF1:=0
       nCODF2:=0
       nCODF0:=0
       nCODqF1:=0
       nCODqF2:=0
       nCODqF0:=0
   	   WHILE CCODIGO=oSERVER:FIELDGET("CODIGO") .AND. NCLIENTE=OSERVER:FIELDGET("FORNECEDO")  .AND. ! oSERVER:EOF
   	   	     nPerc := INT(100* nPOS/ nLASTREC)
             SELF:oDcProgBar:Position := nPerc	
  	         nPOS++
            SELF:oDCchave:Caption:=Str(nCLIENTE,8)+"-"+cCODIGO+"-"+Str(oSERVER:RecNo,8)
   	   		DATA:=oSERVER:FIELDGET("DATA")
            ENTREGA:=oSERVER:FIELDGET("ENTREGA")
	        QTDE:=OSERVER:FIELDGET("QTDE")
	        QTDESAL:=oSERVER:FIELDGET("QTDESAL")	
   	   		nCLIENT+=1
        	nCLIQTD+=qtde
   	   		nCODENT+=1
        	nCODQTD+=qtde
        	//variaveis
	        //analise variaveis
	        DO CASE
               CASE (DATA <= ENTREGA) .OR. (DATA = ENTREGA  .and. QTDE = QTDESAL)
             //       cCODERR := "FO"
                    nTOTF0+=1
                    nCLIF0+=1
                    nCODF0+=1
                    nTOTqF0+=qtde
                    nCLIqF0+=qtde
                    nCODqF0+=qtde
               CASE DATA > ENTREGA  .and. QTDE = QTDESAL
                //    cCODERR := "F1"
                    nTOTF1+=1
                    nCLIF1+=1
                    nCODF1+=1
                    nTOTqF1+=qtde
                    nCLIqF1+=qtde
                    nCODqF1+=qtde
               OTHERWISE
               //     cCODERR := "F2"
                    nTOTF2+=1
                    nCLIF2+=1
                    nCODF2+=1
                    nTOTqF2+=qtde
                    nCLIqF2+=qtde
                    nCODqF2+=qtde

//                 CASE DATA = ENTREGA .and. QTDE # QTDESAL
//                   cCODERR := "F2"
             ENDCASE
            oSERVER:SKIP()	
   	   ENDDO	
   	   cNOME:=OSERVER:FIELDGET("NOME")
       oMS01:GOTOP()
       IF oMS01:SEEK(cCODIGO)
       	  cNOME:=oMS01:FIELDGET("NOME")
       ENDIF
   	   //Produto
   	   oBS5:Append()
 	   OBS5:FIELDPUT("CLIENTE",nCLIENTE)
   	   OBS5:FIELDPUT("COGCLI",cCOGNOME)
   	   OBS5:FIELDPUT("GRUPO",cGRUPO)
       OBS5:FIELDPUT("CODIGO",cCODIGO)
       OBS5:FIELDPUT("NOME",cNOME)
       OBS5:FIELDPUT("QTDDE",nCODQTD)
       OBS5:FIELDPUT("QTD01",nCODqF0)
       OBS5:FIELDPUT("QTD02",nCODqF1)
       OBS5:FIELDPUT("QTD03",nCODqF2)
       OBS5:FIELDPUT("MES",NMES)
       OBS5:FIELDPUT("ANO",NANO)
 	   OBS5:FIELDPUT("PER01",PERC(nCODF0,nTOTENT,2))
       OBS5:FIELDPUT("PER02",PERC(nCODF1,nTOTENT,2))
       OBS5:FIELDPUT("PER03",PERC(nCODF2,nTOTENT,2))
       OBS5:FIELDPUT("PEQ01",PERC(nCODqF0,nTOTQTD,2))
       OBS5:FIELDPUT("PEQ02",PERC(nCODqF1,nTOTQTD,2))
       OBS5:FIELDPUT("PEQ03",PERC(nCODqF2,nTOTQTD,2))
       OBS5:FIELDPUT("F0",nCODF0)
       OBS5:FIELDPUT("F1",nCODF1)
       OBS5:FIELDPUT("F2",nCODF2)
       OBS5:FIELDPUT("ENT",nCODENT)
       OBS5:FIELDPUT("EMPLOGIX",cEMPLOGIX)
    ENDDO	

    //Cliente
    oBS6:Append()
 	OBS6:FIELDPUT("CLIENTE",nCLIENTE)
   	OBS6:FIELDPUT("COGCLI",cCOGNOME)
   	OBS6:FIELDPUT("GRUPO",cGRUPO)
    OBS6:FIELDPUT("NOME",cCLINOME)
    OBS6:FIELDPUT("QTDDE",nCLIQTD)
    OBS6:FIELDPUT("QTD01",nCLIqF0)
    OBS6:FIELDPUT("QTD02",nCLIqF1)
    OBS6:FIELDPUT("QTD03",nCLIqF2)
    OBS6:FIELDPUT("MES",NMES)
    OBS6:FIELDPUT("ANO",NANO)
    OBS6:FIELDPUT("PER01",PERC(nCLIF0,ncliENT,2))
    OBS6:FIELDPUT("PER02",PERC(nCLIF1,ncliENT,2))
    OBS6:FIELDPUT("PER03",PERC(nCLIF2,ncliENT,2))
    OBS6:FIELDPUT("PEQ01",PERC(nCLIqF0,ncliQTD,2))
    OBS6:FIELDPUT("PEQ02",PERC(nCLIqF1,ncliQTD,2))
    OBS6:FIELDPUT("PEQ03",PERC(nCLIqF2,ncliQTD,2))
    OBS6:FIELDPUT("F0",nCLIF0)
    OBS6:FIELDPUT("F1",nCLIF1)
    OBS6:FIELDPUT("F2",nCLIF2)
    OBS6:FIELDPUT("ENT",nCLIENT)
    OBS6:FIELDPUT("EMPLOGIX",cEMPLOGIX)

    //Grupo
    oBS2:GoTop()
    IF ! OBS2:SEEK(Str(nano,4)+Str(nmes,2)+Cgrupo)
       oBS2:Append()
       OBS2:FIELDPUT("GRUPO",cGRUPO)
       OBS2:FIELDPUT("MES",NMES)
       OBS2:FIELDPUT("ANO",NANO)
       OBS2:FIELDPUT("EMPLOGIX",cEMPLOGIX)
    ENDIF
    OBS2:FIELDPUT("QTDDE",oBS2:FIELDGET("QTDDE")+nCLIQTD)
    OBS2:FIELDPUT("QTD01",oBS2:FIELDGET("QTD01")+nCLIqF0)
    OBS2:FIELDPUT("QTD02",oBS2:FIELDGET("QTD02")+nCLIqF1)
    OBS2:FIELDPUT("QTD03",oBS2:FIELDGET("QTD03")+nCLIqF2)
    OBS2:FIELDPUT("F0",oBS2:FIELDGET("F0")+nCLIF0)
    OBS2:FIELDPUT("F1",oBS2:FIELDGET("F1")+nCLIF1)
    OBS2:FIELDPUT("F2",oBS2:FIELDGET("F2")+nCLIF2)
    OBS2:FIELDPUT("ENT",oBS2:FIELDGET("ENT")+nCLIENT)
    OBS2:FIELDPUT("PER01",PERC(oBS2:FIELDGET("F0"),Obs2:FIELDGET("ent"),2))
    OBS2:FIELDPUT("PER02",PERC(oBS2:FIELDGET("F1"),Obs2:FIELDGET("ent"),2))
    OBS2:FIELDPUT("PER03",PERC(oBS2:FIELDGET("F2"),Obs2:FIELDGET("ent"),2))
    OBS2:FIELDPUT("PEQ01",PERC(oBS2:FIELDGET("QTD01"),Obs2:FIELDGET("qtdde"),2))
    OBS2:FIELDPUT("PEQ02",PERC(oBS2:FIELDGET("QTD02"),Obs2:FIELDGET("qtdde"),2))
    OBS2:FIELDPUT("PEQ03",PERC(oBS2:FIELDGET("QTD03"),Obs2:FIELDGET("qtdde"),2))
ENDDO	

oMA01:CLOSE()
oSERVER:CLOSE()
oBS2:CLOSE()
oBS5:CLOSE()
OBS6:CLOSE()
//Geral
aDAD:={zCURINI,"BS1",ZCURDIR}
oBS1:=USEMANA5{aDAD}
IF oBS1:nERRO#0
   oSERVER:CLOSE()
   RETURN .f.
ENDIF
oBS1:Append()
OBS1:FIELDPUT("QTDDE",ntotqtd)
OBS1:FIELDPUT("QTD01",ntotqf0)
OBS1:FIELDPUT("QTD02",ntotqf1)
OBS1:FIELDPUT("QTD03",ntotqf2)
OBS1:FIELDPUT("MES",NMES)
OBS1:FIELDPUT("ANO",NANO)
OBS1:FIELDPUT("PER01",PERC(ntotf0,nTOTENT,2))
OBS1:FIELDPUT("PER02",PERC(ntotf1,nTOTENT,2))
OBS1:FIELDPUT("PER03",PERC(ntotf2,nTOTENT,2))
OBS1:FIELDPUT("PEQ01",PERC(ntotqf0,nTOTQTD,2))
OBS1:FIELDPUT("PEQ02",PERC(ntotqf1,nTOTQTD,2))
OBS1:FIELDPUT("PEQ03",PERC(ntotqf2,nTOTQTD,2))
OBS1:FIELDPUT("F0",ntotf0)
OBS1:FIELDPUT("F1",ntotf1)
OBS1:FIELDPUT("F2",ntotf2)
OBS1:FIELDPUT("ENT",ntotent)
Obs1:close()
alert("Concluido")


	
	
	
	
	

	

	
	
	
	


METHOD cmdchktip 
//LOCAL cORI AS STRING	
//SELF:cmdcriaarq()   //comentei esta zerando
SELF:CODLOGIX54("MS01","P")	
SELF:CODLOGIX54("MS01X","P")	
alert("Sincronizacao Concluida:")

METHOD cmdcriaarq( ) 
SELF:POINTER:=POINTER{POINTERHOURGLASS}
	checkiacmes(SELF:mes,SELF:ano)
SELF:POINTER:=POINTER{POINTERARROW}	
	


METHOD cmdcriaarq1( ) 
LOCAL cARQ AS STRING	
LOCAL cDIRE AS STRING
SELF:POINTER:=POINTER{POINTERHOURGLASS}
cDIRE:=PEGINIVAL(ZCURINI,"SISTEMAS","MANA5P")+"E"+StrZero(zempresa,3)+StrZero(SELF:ANO,4)+"\"
cARQ:="IC"+Right(StrZero(SELF:ANO,4),2)+StrZero(SELF:MES,2)
ZERADBF(cDIRE+CARQ)
SELF:POINTER:=POINTER{POINTERARROW}	



METHOD CMDimprimir( ) 
SELF:XWRPTGRP("PR","")		


METHOD cmdLimpar( ) 
LIMPARSEQ(SELF:MES,SELF:ANO,"BS1")	
LIMPARSEQ(SELF:MES,SELF:ANO,"BS2")	
LIMPARSEQ(SELF:MES,SELF:ANO,"BS5")	
LIMPARSEQ(SELF:MES,SELF:ANO,"BS6")	

METHOD cmdordena( ) 
	SELF:KeyFind()

METHOD cmdSemes( ) 
		SELF:SERVER:FIELDPUT("SEMES",SIMNAO(SELF:SERVER:FIELDGET("SEMES")))

METHOD CODLOGIX54(cARQ,cTIPO) 
LOCAL oORI AS DBSERVER
LOCAL oPRO AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL cORI,CDIRE AS STRING
LOCAL cCODIGO AS STRING
LOCAL cCODINT AS STRING
LOCAL cNOME AS STRING
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT
LOCAL cCLASSIPI AS STRING




cDIRE:=PEGINIVAL(ZCURINI,"SISTEMAS","MANA5P")+"E"+StrZero(zempresa,3)+StrZero(SELF:ANO,4)+"\"
cORI:="IC"+Right(StrZero(SELF:ANO,4),2)+StrZero(SELF:MES,2)
oORI:=DBSERVER{CDIRE+CORI,,,"DBFCDX"}
IF ! oori:USED
    RETU SELF
ENDIF
Oori:SetOrder(4)

aDAD:={zCURINI,CARQ+".DBF",ZCURDIR}
oPRO:=USEREDE{aDAD,.F.}
IF oPRO:nERRO#0
   oORI:CLOSE()
   RETURN .f.
ENDIF
nLASTREC:=OPRO:RecCount
nPOS:=0
oPRO:GOTOP()
WHILE ! oPRO:EOF	
	
	nPerc := INT(100* nPOS/ nLASTREC)
    SELF:oDcProgBar:Position := nPerc	
	nPOS++
	
	cCODIGO:=AllTrim(oPRO:FIELDGET("CODIGO"))
	cNOME:=AllTrim(oPRO:FIELDGET("NOME"))
    cCLASSIPI:=oPRO:FIELDGET("CLASSIPI")
    cCODINT:=AllTrim(oPRO:FIELDGET("CODIGOINT"))
	SELF:oDCchave:Caption:= CCODIGO+" "+Str(oORI:RECNO)
	
    IF ! Empty(CCODINT)
       oORI:GOTOP()
       oORI:SEEK(cCODINT)
       WHILE AllTrim(oORI:FIELDGET("CODIGOINT"))=CCODINT .AND. ! oORI:EOF
            oORI:FIELDPUT("TIPOENT",cTIPO)	
            IF Empty(oORI:FIELDGET("CODIGO"))
               oORI:FIELDPUT("CODIGO",cCODIGO)
            ENDIF
            IF Val(oORI:FIELDGET("CLASSIPI"))=0
               oORI:FIELDPUT("CLASSIPI",cCLASSIPI)
            ENDIF	
            IF Empty(oORI:FIELDGET("NOME"))
               oORI:FIELDPUT("NOME",cNOME)
            ENDIF	
            oORI:Skip()
        ENDDO
    ENDIF
	oPRO:Skip()
ENDDO


IF cARQ=="MS01"
   nPOS:=0
   oORI:GOTOP()
   WHILE ! oORI:EoF
   	   nPerc := INT(100* nPOS/ nLASTREC)
       SELF:oDcProgBar:Position := nPerc	
	   nPOS++
       SELF:oDCchave:Caption:= Str(oORI:RECNO)
       IF Val(Oori:FIELDGET("CODCLIENTE"))>9999 //fornecedores
       	  oORI:Delete()
   	   ENDIF

       cCODIGO:=AllTrim(oORI:FIELDGET("CODIGO"))
   	   oPRO:GOTOP()
   	   IF oPRO:SEEK(cCODIGO)
   	   	  IF oPRO:FIELDGET("ULTIMOFA")<oORI:FIELDGET("DATA")
             oPRO:FIELDPUT("ULTPRC",oORI:FIELDGET("PRECO"))
             oPRO:FIELDPUT("ULTDATA",oORI:FIELDGET("DATA"))
             oPRO:FIELDPUT("ULTIMOFA",oORI:FIELDGET("DATA"))
             oPRO:FIELDPUT("ULTIMONF",oORI:FIELDGET("NUMERO"))
             oPRO:FIELDPUT("ULTUND","PC")
   	   	  ENDIF	
   	   	  IF Empty(oPRO:FIELDGET("PRIFATDAT"))
             oPRO:FIELDPUT("PRIFATDAT",oORI:FIELDGET("DATA"))
             oPRO:FIELDPUT("PRIFATNF",oORI:FIELDGET("NUMERO"))
   	   	  ENDIF	
  	   	  IF Empty(oPRO:FIELDGET("FORNECEDO"))
      	    oPRO:FIELDPUT("FORNECEDO",oORI:FIELDGET("FORNECEDO"))
          ENDIF
          IF Empty(OPRO:FIELDGET("CLIPCP"))
    	     oPRO:FIELDPUT("CLIPCP",oORI:FIELDGET("FORNECEDO"))
          ENDIF	
          IF Empty(OPRO:FIELDGET("PLTINV"))
    	     oPRO:FIELDPUT("PLTINV",oORI:FIELDGET("FORNECEDO"))
          ENDIF	

          IF Empty(OPRO:FIELDGET("CODIGOINT"))
    	     oPRO:FIELDPUT("CODIGOINT",oORI:FIELDGET("CODIGOINT"))
          ENDIF	

          IF Empty(OPRO:FIELDGET("CLICODINT"))
    	     oPRO:FIELDPUT("CLICODINT",oORI:FIELDGET("CODCLIENTE"))
          ENDIF	



   	   ENDIF	
   	   oORI:SKIP()
   ENDDO	
ENDIF
oPRO:CLOSE()
oORI:CLOSE()
//alert("Sincronizacao Concluida:" + cARQ)


ACCESS DESCR2() 
RETURN SELF:FieldGet(#DESCR2)


ASSIGN DESCR2(uValue) 
SELF:FieldPut(#DESCR2, uValue)
RETURN DESCR2 := uValue


ACCESS DESCRI() 
RETURN SELF:FieldGet(#DESCRI)


ASSIGN DESCRI(uValue) 
SELF:FieldPut(#DESCRI, uValue)
RETURN DESCRI := uValue


METHOD IndexPB( ) 
	SELF:KeyFind()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
LOCAL DIM aFonts[1] AS OBJECT
LOCAL DIM aBrushes[1] AS OBJECT

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JIACSEQ",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDIAINI := DateTimePicker{SELF,ResourceID{JIACSEQ_DIAINI,_GetInst()}}
oDCDIAINI:FieldSpec := DATE_FIELD{}
oDCDIAINI:HyperLabel := HyperLabel{#DIAINI,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDIAFIM := DateTimePicker{SELF,ResourceID{JIACSEQ_DIAFIM,_GetInst()}}
oDCDIAFIM:FieldSpec := DATE_FIELD{}
oDCDIAFIM:HyperLabel := HyperLabel{#DIAFIM,NULL_STRING,NULL_STRING,NULL_STRING}

oDCMES := SingleLineEdit{SELF,ResourceID{JIACSEQ_MES,_GetInst()}}
oDCMES:FieldSpec := PADRAO_NUM_02{}
oDCMES:HyperLabel := HyperLabel{#MES,"Mes:",NULL_STRING,"CRTLP_MES"}
oDCMES:BackGround := aBrushes[1]
oDCMES:Font(aFonts[1], FALSE)

oDCANO := SingleLineEdit{SELF,ResourceID{JIACSEQ_ANO,_GetInst()}}
oDCANO:FieldSpec := PADRAO_NUM_04{}
oDCANO:HyperLabel := HyperLabel{#ANO,"Ano:",NULL_STRING,"CRTLP_ANO"}
oDCANO:BackGround := aBrushes[1]
oDCANO:Font(aFonts[1], FALSE)

oDCDESCRI := SingleLineEdit{SELF,ResourceID{JIACSEQ_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_30{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Competencia",NULL_STRING,"CRTLP_DESCRI"}
oDCDESCRI:BackGround := aBrushes[1]
oDCDESCRI:Font(aFonts[1], FALSE)

oDCSC_SEQ := FixedText{SELF,ResourceID{JIACSEQ_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSC_DIAINI := FixedText{SELF,ResourceID{JIACSEQ_SC_DIAINI,_GetInst()}}
oDCSC_DIAINI:HyperLabel := HyperLabel{#SC_DIAINI,"Início",NULL_STRING,NULL_STRING}

oDCSC_MES := FixedText{SELF,ResourceID{JIACSEQ_SC_MES,_GetInst()}}
oDCSC_MES:HyperLabel := HyperLabel{#SC_MES,"Mês:",NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{SELF,ResourceID{JIACSEQ_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCSC_ANO := FixedText{SELF,ResourceID{JIACSEQ_SC_ANO,_GetInst()}}
oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO,"Ano:",NULL_STRING,NULL_STRING}

oDCSC_DIAFIM := FixedText{SELF,ResourceID{JIACSEQ_SC_DIAFIM,_GetInst()}}
oDCSC_DIAFIM:HyperLabel := HyperLabel{#SC_DIAFIM,"Fim",NULL_STRING,NULL_STRING}

oDCSEQ := SingleLineEdit{SELF,ResourceID{JIACSEQ_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := PADRAO_NUM_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"CRTLP_SEQ"}
oDCSEQ:BackGround := aBrushes[1]
oDCSEQ:Font(aFonts[1], FALSE)

oCCpegcomp := PushButton{SELF,ResourceID{JIACSEQ_PEGCOMP,_GetInst()}}
oCCpegcomp:HyperLabel := HyperLabel{#pegcomp,"-->",NULL_STRING,NULL_STRING}
oCCpegcomp:TooltipText := "Preencher Informacoes do Mes"

oDCSC_SEQ1 := FixedText{SELF,ResourceID{JIACSEQ_SC_SEQ1,_GetInst()}}
oDCSC_SEQ1:HyperLabel := HyperLabel{#SC_SEQ1,"Semestral",NULL_STRING,NULL_STRING}

oDCSC_SEQ2 := FixedText{SELF,ResourceID{JIACSEQ_SC_SEQ2,_GetInst()}}
oDCSC_SEQ2:HyperLabel := HyperLabel{#SC_SEQ2,"Anual",NULL_STRING,NULL_STRING}

oDCSEMES := SingleLineEdit{SELF,ResourceID{JIACSEQ_SEMES,_GetInst()}}
oDCSEMES:FieldSpec := PADRAO_CHAR_01{}
oDCSEMES:HyperLabel := HyperLabel{#SEMES,"Semes",NULL_STRING,"CRTLP_SEQ"}
oDCSEMES:BackGround := aBrushes[1]
oDCSEMES:Font(aFonts[1], FALSE)

oDCANUAL := SingleLineEdit{SELF,ResourceID{JIACSEQ_ANUAL,_GetInst()}}
oDCANUAL:FieldSpec := PADRAO_CHAR_01{}
oDCANUAL:HyperLabel := HyperLabel{#ANUAL,"Anual",NULL_STRING,"CRTLP_SEQ"}
oDCANUAL:BackGround := aBrushes[1]
oDCANUAL:Font(aFonts[1], FALSE)

oCCBuscanum := PushButton{SELF,ResourceID{JIACSEQ_BUSCANUM,_GetInst()}}
oCCBuscanum:Image := ico_find{}
oCCBuscanum:HyperLabel := HyperLabel{#Buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCBuscanum:TooltipText := "Localizar"

oDCDESCR2 := SingleLineEdit{SELF,ResourceID{JIACSEQ_DESCR2,_GetInst()}}
oDCDESCR2:FieldSpec := padrao_char_10{}
oDCDESCR2:HyperLabel := HyperLabel{#DESCR2,"Competencia",NULL_STRING,"CRTLP_DESCRI"}
oDCDESCR2:BackGround := aBrushes[1]
oDCDESCR2:Font(aFonts[1], FALSE)

oCCcmdcriaarq := PushButton{SELF,ResourceID{JIACSEQ_CMDCRIAARQ,_GetInst()}}
oCCcmdcriaarq:HyperLabel := HyperLabel{#cmdcriaarq,"Iniciar Competencia",NULL_STRING,NULL_STRING}

oCCIndexPB := PushButton{SELF,ResourceID{JIACSEQ_INDEXPB,_GetInst()}}
oCCIndexPB:Image := ico_az{}
oCCIndexPB:HyperLabel := HyperLabel{#IndexPB,NULL_STRING,NULL_STRING,NULL_STRING}
oCCIndexPB:TooltipText := "Ordenar"

oCCcmdcriaarq1 := PushButton{SELF,ResourceID{JIACSEQ_CMDCRIAARQ1,_GetInst()}}
oCCcmdcriaarq1:HyperLabel := HyperLabel{#cmdcriaarq1,"Apagar Competencia",NULL_STRING,NULL_STRING}

oCCPushButton9 := PushButton{SELF,ResourceID{JIACSEQ_PUSHBUTTON9,_GetInst()}}
oCCPushButton9:HyperLabel := HyperLabel{#PushButton9,"Importar Integrado",NULL_STRING,NULL_STRING}

oDCProgBar := ProgressBar{SELF,ResourceID{JIACSEQ_PROGBAR,_GetInst()}}
oDCProgBar:Range := Range{0,100}
oDCProgBar:HyperLabel := HyperLabel{#ProgBar,NULL_STRING,NULL_STRING,NULL_STRING}

oDCchave := FixedText{SELF,ResourceID{JIACSEQ_CHAVE,_GetInst()}}
oDCchave:HyperLabel := HyperLabel{#chave,NULL_STRING,NULL_STRING,NULL_STRING}

oCCcmdchktip := PushButton{SELF,ResourceID{JIACSEQ_CMDCHKTIP,_GetInst()}}
oCCcmdchktip:HyperLabel := HyperLabel{#cmdchktip,"Checar Tipos",NULL_STRING,NULL_STRING}

oCCcmdApurar := PushButton{SELF,ResourceID{JIACSEQ_CMDAPURAR,_GetInst()}}
oCCcmdApurar:HyperLabel := HyperLabel{#cmdApurar,"Apurar",NULL_STRING,NULL_STRING}

oCCcmdLimpar := PushButton{SELF,ResourceID{JIACSEQ_CMDLIMPAR,_GetInst()}}
oCCcmdLimpar:HyperLabel := HyperLabel{#cmdLimpar,"Limpar Sequencia",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{SELF,ResourceID{JIACSEQ_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,NULL_STRING,NULL_STRING,NULL_STRING}

oCCPushButton10 := PushButton{SELF,ResourceID{JIACSEQ_PUSHBUTTON10,_GetInst()}}
oCCPushButton10:HyperLabel := HyperLabel{#PushButton10,"Apagar Cliente",NULL_STRING,NULL_STRING}

oCCcmdSemes := PushButton{SELF,ResourceID{JIACSEQ_CMDSEMES,_GetInst()}}
oCCcmdSemes:HyperLabel := HyperLabel{#cmdSemes,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdAnual := PushButton{SELF,ResourceID{JIACSEQ_CMDANUAL,_GetInst()}}
oCCcmdAnual:HyperLabel := HyperLabel{#cmdAnual,"Sim/Nao",NULL_STRING,NULL_STRING}

SELF:Caption := "Sequencia de Apurações"
SELF:HyperLabel := HyperLabel{#JIACSEQ,"Sequencia de Apurações",NULL_STRING,NULL_STRING}
SELF:Menu := STANDARDSHELLMENU{}
SELF:ClipperKeys := TRUE

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF
SELF:Browser := DataBrowser{SELF}

oDBSEQ := DataColumn{PADRAO_NUM_03{}}
oDBSEQ:Width := 7
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
oDBSEQ:BackGround := aBrushes[1]
SELF:Browser:AddColumn(oDBSEQ)

oDBMES := DataColumn{PADRAO_NUM_02{}}
oDBMES:Width := 9
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "Mes:"
oDBMES:BackGround := aBrushes[1]
SELF:Browser:AddColumn(oDBMES)

oDBANO := DataColumn{PADRAO_NUM_04{}}
oDBANO:Width := 10
oDBANO:HyperLabel := oDCANO:HyperLabel 
oDBANO:Caption := "Ano:"
oDBANO:BackGround := aBrushes[1]
SELF:Browser:AddColumn(oDBANO)

oDBDESCRI := DataColumn{PADRAO_CHAR_30{}}
oDBDESCRI:Width := 16
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Competencia"
oDBDESCRI:BackGround := aBrushes[1]
SELF:Browser:AddColumn(oDBDESCRI)

oDBANUAL := DataColumn{PADRAO_CHAR_01{}}
oDBANUAL:Width := 8
oDBANUAL:HyperLabel := oDCANUAL:HyperLabel 
oDBANUAL:Caption := "Anual"
oDBANUAL:BackGround := aBrushes[1]
SELF:Browser:AddColumn(oDBANUAL)

oDBSEMES := DataColumn{PADRAO_CHAR_01{}}
oDBSEMES:Width := 10
oDBSEMES:HyperLabel := oDCSEMES:HyperLabel 
oDBSEMES:Caption := "Semes"
oDBSEMES:BackGround := aBrushes[1]
SELF:Browser:AddColumn(oDBSEMES)


SELF:ViewAs(#FormView)

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


ACCESS MES() 
RETURN SELF:FieldGet(#MES)


ASSIGN MES(uValue) 
SELF:FieldPut(#MES, uValue)
RETURN MES := uValue


ACCESS NUMERO() 
RETURN SELF:FieldGet(#NUMERO)


ASSIGN NUMERO(uValue) 
SELF:FieldPut(#NUMERO, uValue)
RETURN NUMERO := uValue


METHOD pegcomp( ) 
SELF:server:ano:=Year(SELF:server:DIAINI)
SELF:server:mes:=Month(SELF:server:diafim)
SELF:server:DESCRI:=MESSTR(SELF:server:mes,SELF:server:ano,1,2)
SELF:server:DESCR2:=MESSTR(SELF:server:mes,SELF:server:ano,1,1)	

METHOD PORNUM( ) 
	SELF:KeyFind()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		    FabCenterWindow( SELF )
	RETURN NIL


METHOD PushButton10( ) 
LOCAL cARQ,cDIRE AS STRING	
LOCAL oARQ AS DBSERVER
LOCAL nFORNECEDO AS DWORD
nFORNECEDO:=SELF:NUMERO
SELF:POINTER:=POINTER{POINTERHOURGLASS}
cDIRE:=PEGINIVAL(ZCURINI,"SISTEMAS","MANA5P")+"E"+StrZero(zempresa,3)+StrZero(SELF:ANO,4)+"\"
cARQ:="IC"+StrZero(SELF:SERVER:FIELDGET("ANO"),4)+StrZero(SELF:SERVER:FIELDGET("MES"),2)
oARQ:=DBSERVER{CDIRE+carq,.f.,,"DBFCDX"}
IF oARQ:Used
   oARQ:SETORDER(6)	
   oARQ:GOTOP()
   oARQ:SEEK(Str(nFORNECEDO,8))
   WHILE oARQ:FIELDGET("FORNECEDO")=nFORNECEDO .AND. ! oARQ:EoF
       oARQ:Delete()
   	   oARQ:SKIP()
   ENDDO	
   oARQ:CLOSE()
ENDIF
SELF:POINTER:=POINTER{POINTERARROW}		

METHOD PushButton9( ) 
LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cSQL AS STRING
    LOCAL aDAD AS ARRAY
    LOCAL oSERVER AS DBSERVER
    LOCAL oMA01 AS USEREDE
    LOCAL cARQ,cDIRE AS STRING
    LOCAL dataini AS DATE
    LOCAL datafim AS DATE
  //  LOCAL cMIG AS STRING
    LOCAL nLASTREC AS DWORD
    LOCAL nPOS AS DWORD
    LOCAL nPERC AS INT
    LOCAL nSALDO AS FLOAT
    LOCAL cCODCLI AS STRING
    LOCAL cCGC AS STRING
    LOCAL nFORNECEDO AS DWORD
    LOCAL cCOGNOME AS STRING
    LOCAL oSTMT AS SQLStatement
    LOCAL dUSO AS DATE
    LOCAL lTEM AS LOGIC
    LOCAL lANO2011 AS LOGIC

   dataini:=SELF:SERVER:FIELDGET("DIAINI")
   datafim:=SELF:SERVER:FIELDGET("DIAFIM")

   lANO2011:=.T.
   IF Year(dataini)<2011
   	  alert("Somente para Ano maior que 2011")
   	  IF MDG("Checar dados")
         lANO2011:=.F.
      ENDIF
   ENDIF	


   IF lANO2011
       IF MDG("Checar Cliente")
	      IMPCLI()
	   ENDIF
	   IF MDG("Checar Codigos")
	     IMPCOD(1,1,.F.)
	   ENDIF
	   IF ! MDG("Apagar importacao Anterior e Importar")
	   	  RETURN .f.
	   ENDIF	
	   SELF:cmdcriaarq()
	   SELF:cmdcriaarq1()
   ENDIF	

  // cMIG:=PEGEMPMIG(zempRESA)



    cDIRE:=PEGINIVAL(ZCURINI,"SISTEMAS","MANA5P")+"E"+StrZero(zempresa,3)+StrZero(SELF:ANO,4)+"\"
    cARQ:="IC"+Right(StrZero(SELF:ANO,4),2)+StrZero(SELF:MES,2)
    oSERVER:=DBSERVER{cDIRE+CARQ,,,"DBFCDX"}
    IF ! oSERVER:USED
       RETU SELF
    ENDIF




IF Lano2011
   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
   	  RETURN .f.
   ENDIF	


	cSQL:= "set isolation to dirty read"
	oStmt := SQLStatement{cSQL,oConn}
	oSTMT:Execute()
	
	/* logix 5.10
	CSQL:=" SELECT "
	csql+=" nf_mestre.num_nff, nf_mestre.dat_emissao, nf_mestre.cod_cliente,"
	csql+=" nf_item.num_pedido, nf_item.num_sequencia, nf_item.cod_item, nf_item.qtd_item,"
	csql+=" nf_item.cod_cla_fisc, nf_item.val_liq_item, nf_item.pre_unit_nf,"
	csql+=" ped_itens.qtd_pecas_solic, ped_itens.qtd_pecas_cancel, ped_itens.prz_entrega"
	csql+=" FROM "
	csql+=" nf_mestre INNER JOIN nf_item ON nf_mestre.cod_empresa = nf_item.cod_empresa AND nf_mestre.num_nff = nf_item.num_nff LEFT JOIN ped_itens ON nf_item.cod_empresa = ped_itens.cod_empresa AND nf_item.num_pedido = ped_itens.num_pedido AND nf_item.num_sequencia = ped_itens.num_sequencia "
	csql+=" where nf_mestre.dat_emissao>='" +DToC(dataini) +"' and nf_mestre.dat_emissao<='" +DToC(datafim) + "'"
	csql+=" and nf_mestre.ies_situacao<>'C'"
	csql+=" and nf_mestre.ies_origem='P'"
	*/
	CSQL:=" SELECT FAT_nf_mestre.nota_fiscal, CAST(FAT_nf_mestre.dat_hor_emissao AS DATE) AS dat_hor_emissao, FAT_NF_MESTRE.cliente, "
	csql+="  FAT_nf_item.pedido, FAT_nf_item.seq_ITEM_PEDIDO, logix.fat_nf_item.item, logix.fat_nf_item.qtd_item,FAT_nf_MESTRE.empresa,  "
	csql+="  FAT_nf_item.classif_fisc, FAT_nf_item.preco_unit_liquido, FAT_nf_item.val_liquido_item , "
	csql+="  ped_itens.qtd_pecas_solic, ped_itens.qtd_pecas_cancel, ped_itens.prz_entrega,fat_nf_item.des_item,  "
	csql+="  FAT_nf_mestre.origem_nota_fiscal,cnpjcpf(clientes.num_cgc_cpf) AS cnpj,clientes.nom_reduzido,cliente_item.cod_item_cliente  "
	csql+="  FROM  "
	csql+="  FAT_nf_mestre INNER JOIN FAT_nf_item  ON fat_nf_mestre.trans_nota_fiscal=fat_nf_item.trans_nota_fiscal  "
	csql+="            LEFT JOIN ped_itens ON FAT_nf_MESTRE.empresa = ped_itens.cod_empresa "
	csql+="                                  AND FAT_nf_item.pedido = ped_itens.num_pedido   "
	csql+="                                  AND FAT_nf_item.seq_item_pedido = ped_itens.num_sequencia "
	csql+=" LEFT JOIN clientes ON fat_nf_mestre.cliente=clientes.cod_cliente "
	csql+=" LEFT JOIN cliente_item ON fat_nf_mestre.empresa=cliente_item.cod_empresa "
	csql+="      AND fat_nf_mestre.cliente = cliente_ITEM.cod_cliente_matriz "
	csql+="      AND FAT_nF_ITEM.item= cliente_item.cod_item "
	csql+="  where     CAST(FAT_nf_mestre.dat_hor_emissao AS DATE)>='" +DToC(dataini) +"'"
	csql+="        and CAST(FAT_nf_mestre.dat_HOR_EMISSAO AS DATE)<='" +DToC(datafim) +"'"
	csql+="        and FAT_nf_mestre.sit_nota_fiscal<>'C' "
	csql+="        and FAT_nf_mestre.origem_nota_fiscal='O' "
	csql+="        AND FAT_nf_item.pedido>0 and fat_nf_mestre.natureza_operacao<>203 and fat_nf_mestre.natureza_operacao<>999 "
	csql+="        AND LENGTH(fat_nf_item.item)=12 "
	
   SELF:POINTER:=POINTER{POINTERHOURGLASS}
   oreg:= SQLSelect{cSQL,oconn}
   nLASTREC:=100
   nPOS:=0
   WHILE ! OREG:EoF	
     	nPerc := INT(100* nPOS/ nLASTREC)
        SELF:oDcProgBar:Position := nPerc	
  	    nPOS++
  	    IF nPOS=101
  	       nPOS:=0
  	    ENDIF
  	     nSALDO:=FIXNUM(oreg:FIELDGET("qtd_pecas_solic"))-FIXNUM(oreg:FIELDGET("qtd_pecas_cancel"))
  	     IF nSALDO<=0 //'Pedidos Excluidos
  	     	nSALDO:=oreg:FIELDGET("qtd_item")
  	     ENDIF
     	 IF Empty(oreg:FIELDGET("prz_entrega"))
     	 	dUSO:=oreg:FIELDGET("dat_hor_emissao") //dat_emissao
     	 ELSE
     	 	dUSO:=oreg:FIELDGET("prz_entrega")
     	 ENDIF	
         SELF:oDCchave:Caption:=Str(oreg:FIELDGET("nOTA_FISCAL"),8)+"/"+DToC(oreg:FIELDGET("dat_hor_emissao"))          //NUM_NFF

      	 oSERVER:APPEND()
         Oserver:FIELDPUT("NUMERO",oreg:FIELDGET("nota_fiscal")) //NUM_NFF
         Oserver:FIELDPUT("DATA",oreg:FIELDGET("dat_hor_emissao"))  //dat_emissao
         Oserver:FIELDPUT("QTDE",oreg:FIELDGET("qtd_item"))
         Oserver:FIELDPUT("OS",oreg:FIELDGET("pedido"))  //num_pedido
         Oserver:FIELDPUT("ENTREGA",dUSO)
         Oserver:FIELDPUT("QTDESAL",nSALDO)
         Oserver:FIELDPUT("OSITEM",oreg:FIELDGET("seq_item_pedido")) //num_sequencia
         Oserver:FIELDPUT("CODIGOINT",oreg:FIELDGET("item"))         //cod_item
         Oserver:FIELDPUT("CODCLIENTE",oreg:FIELDGET("cliente")) //cod_cliente
         Oserver:FIELDPUT("valormer",oreg:FIELDGET("val_liquido_item")) //val_liq_item
         Oserver:FIELDPUT("preco",oreg:FIELDGET("preco_unit_liquido")) //pre_unit_nf
         Oserver:FIELDPUT("classipi",oreg:FIELDGET("classif_fisc")) //cod_cla_fisc
         Oserver:FIELDPUT("cgc",oreg:FIELDGET("cnpj"))
         Oserver:FIELDPUT("cognome",oreg:FIELDGET("nom_reduzido"))
         Oserver:FIELDPUT("nome",oreg:FIELDGET("des_item"))
         oserver:FIELDPUT("codigo",oreg:FIELDGET("cod_item_cliente"))
         Oserver:FIELDPUT("empLOGIX",oreg:FIELDGET("empresa"))

   	  Oreg:skip()
   ENDDO	
   Oreg:close()
   Oconn:Disconnect()
ENDIF



   aDAD:={zCURINI,"MA01.DBF",ZCURDIR}
   oMA01:=USEREDE{aDAD,.F.}
   IF oMA01:nERRO#0
   	  oSERVER:CLOSE()
      RETURN .f.
   ENDIF


   nLASTREC:=oSERVER:RecCount
   nPOS:=0

   oMA01:SETORDER(8) //Codigo Interno

   oSERVER:SETORDER(5) //Codcliente
   oSERVER:GOTOP()
   WHILE ! Oserver:EoF
   	    cCODCLI:=OSERVER:FIELDGET("CODCLIENTE")
        nFORNECEDO:=0
        cCOGNOME:=""
        cCGC:=""
        lTEM:=FALSE
        oMA01:GOTOP()
 	    IF oMA01:SEEK(cCODCLI)
	       nFORNECEDO:=oMA01:FIELDGET("NUMERO")
 	       cCOGNOME:=oMA01:FIELDGET("COGNOME")
	       cCGC:=oMA01:FIELDGET("CGC")
	       lTEM:=TRUE
        ENDIF
   	    WHILE cCODCLI=OSERVER:FIELDGET("CODCLIENTE")  .AND. ! Oserver:EoF
   	    	 NPerc := INT(100* nPOS/ nLASTREC)
             SELF:oDcProgBar:Position := nPerc	
  	         nPOS++
             SELF:oDCchave:Caption:=cCODCLI+"/"+Str(oSERVER:RecNo)
             IF lTEM
        		oSERVER:FIELDPUT("FORNECEDO",nFORNECEDO)
             	IF Empty(oSERVER:FIELDGET("CGC"))
	               oSERVER:FIELDPUT("CGC",cCGC)	
	            ENDIF
	            IF Empty(oSERVER:FIELDGET("COGNOME"))
	               oSERVER:FIELDPUT("COGNOME",cCOGNOME)
	            ENDIF
	         ENDIF
   	         oSERVER:Skip()	
        ENDDO
   ENDDO


   oMA01:SETORDER(4) //Cnpj
   oSERVER:GOTOP()
   WHILE ! Oserver:EoF
   	   cCODCLI:=OSERVER:FIELDGET("Cgc")
   	   SELF:oDCchave:Caption:=cCODCLI+"/"+Str(oSERVER:RecNo)
       IF Empty(OSERVER:FIELDGET("FORNECEDO"))
	      oMA01:GOTOP()
	      IF oMA01:SEEK(cCODCLI)
	         oSERVER:FIELDPUT("FORNECEDO",oMA01:FIELDGET("NUMERO"))
             IF Empty(oSERVER:FIELDGET("COGNOME"))
		        oSERVER:FIELDPUT("COGNOME",oMA01:FIELDGET("COGNOME"))
		     ENDIF
         ENDIF
	  ENDIF
      oSERVER:Skip()	
   ENDDO


oMA01:CLOSE()
OSERVER:CLOSE()


SELF:POINTER:=POINTER{POINTERARROW}	
alert("Concluido")
SELF:cmdchktip()

ACCESS SEMES() 
RETURN SELF:FieldGet(#SEMES)


ASSIGN SEMES(uValue) 
SELF:FieldPut(#SEMES, uValue)
RETURN SEMES := uValue


ACCESS SEQ() 
RETURN SELF:FieldGet(#SEQ)


ASSIGN SEQ(uValue) 
SELF:FieldPut(#SEQ, uValue)
RETURN SEQ := uValue


END CLASS
FUNC LIMPARSEQ(nMES,nANO,cARQ)
LOCAL aDAD AS ARRAY
LOCAL oARQ AS USEMANA5
aDAD:={zCURINI,cARQ,zCURDIR}
oARQ:=USEMANA5{aDAD,.F.}   //Abre Exclusivo Fazer Pack
IF oARQ:nERRO=0
   oARQ:GOTOP()
   oARQ:SEEK(Str(nANO,4)+Str(nMES,2))
   WHILE nANO=oARQ:FIELDGET("ANO") .AND. nMES=oARQ:FIELDGET("MES") .AND. ! oARQ:EOF
       oARQ:DELETE()
       oARQ:SKIP()
   ENDDO
   oARQ:PACK()
   oARQ:CLOSE()
ENDIF	
	


