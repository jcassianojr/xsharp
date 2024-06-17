#region DEFINES
STATIC DEFINE JCNQINT_CALC := 122 
STATIC DEFINE JCNQINT_DATAFEC := 126 
STATIC DEFINE JCNQINT_FECHAR := 125 
STATIC DEFINE JCNQINT_IMPRNC := 128 
STATIC DEFINE JCNQINT_OK := 124 
STATIC DEFINE JCNQINT_PCVALINT := 120 
STATIC DEFINE JCNQINT_PEGPRECO := 121 
STATIC DEFINE JCNQINT_QTI01 := 100 
STATIC DEFINE JCNQINT_QTI02 := 101 
STATIC DEFINE JCNQINT_QTI03 := 102 
STATIC DEFINE JCNQINT_QTI04 := 103 
STATIC DEFINE JCNQINT_QTI05 := 104 
STATIC DEFINE JCNQINT_QTI06 := 105 
STATIC DEFINE JCNQINT_SC_DATA1 := 127 
STATIC DEFINE JCNQINT_SC_QTI01 := 118 
STATIC DEFINE JCNQINT_SC_QTI02 := 117 
STATIC DEFINE JCNQINT_SC_QTI03 := 116 
STATIC DEFINE JCNQINT_SC_QTI04 := 115 
STATIC DEFINE JCNQINT_SC_QTI05 := 114 
STATIC DEFINE JCNQINT_THEFIXEDTEXT10 := 123 
STATIC DEFINE JCNQINT_THEFIXEDTEXT16 := 119 
STATIC DEFINE JCNQINT_THEFIXEDTEXT17 := 112 
STATIC DEFINE JCNQINT_THEFIXEDTEXT19 := 113 
STATIC DEFINE JCNQINT_VLI01 := 106 
STATIC DEFINE JCNQINT_VLI02 := 107 
STATIC DEFINE JCNQINT_VLI03 := 108 
STATIC DEFINE JCNQINT_VLI04 := 109 
STATIC DEFINE JCNQINT_VLI05 := 110 
STATIC DEFINE JCNQINT_VLI06 := 111 
#endregion

PARTIAL CLASS jcnqint INHERIT DATADIALOG 

	PROTECT oDCQTI01 AS RIGHTSLE
	PROTECT oDCQTI02 AS RIGHTSLE
	PROTECT oDCQTI03 AS RIGHTSLE
	PROTECT oDCQTI04 AS RIGHTSLE
	PROTECT oDCQTI05 AS RIGHTSLE
	PROTECT oDCQTI06 AS RIGHTSLE
	PROTECT oDCVLI01 AS RIGHTSLE
	PROTECT oDCVLI02 AS RIGHTSLE
	PROTECT oDCVLI03 AS RIGHTSLE
	PROTECT oDCVLI04 AS RIGHTSLE
	PROTECT oDCVLI05 AS SINGLELINEEDIT
	PROTECT oDCVLI06 AS SINGLELINEEDIT
	PROTECT oDCtheFixedText17 AS FIXEDTEXT
	PROTECT oDCtheFixedText19 AS FIXEDTEXT
	PROTECT oDCSC_QTI05 AS FIXEDTEXT
	PROTECT oDCSC_QTI04 AS FIXEDTEXT
	PROTECT oDCSC_QTI03 AS FIXEDTEXT
	PROTECT oDCSC_QTI02 AS FIXEDTEXT
	PROTECT oDCSC_QTI01 AS FIXEDTEXT
	PROTECT oDCtheFixedText16 AS FIXEDTEXT
	PROTECT oDCPCVALINT AS RIGHTSLE
	PROTECT oCCPegPreco AS PUSHBUTTON
	PROTECT oCCCalc AS PUSHBUTTON
	PROTECT oDCtheFixedText10 AS FIXEDTEXT
	PROTECT oCCOK AS PUSHBUTTON
	PROTECT oCCFechar AS PUSHBUTTON
	PROTECT oDCDATAFEC AS SINGLELINEEDIT
	PROTECT oDCSC_DATA1 AS FIXEDTEXT
	PROTECT oCCIMPRNC AS PUSHBUTTON
// 	instance QTI01 
// 	instance QTI02 
// 	instance QTI03 
// 	instance QTI04 
// 	instance QTI05 
// 	instance QTI06 
// 	instance VLI01 
// 	instance VLI02 
// 	instance VLI03 
// 	instance VLI04 
// 	instance VLI05 
// 	instance VLI06 
// 	instance PCVALINT 
// 	instance DATAFEC 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

ACCESS DATAFEC() 
RETURN SELF:FieldGet(#DATAFEC)


ASSIGN DATAFEC(uValue) 
SELF:FieldPut(#DATAFEC, uValue)
RETURN DATAFEC := uValue


METHOD Fechar( ) 
LOCAL oJAN AS jcnqFEC
IF ! Empty(SELF:server:FIELDGET("DATAFEC"))
   alert("J� Fechada")
   RETURN .f.
ENDIF		
oJAN:=jcnqFEC{SELF}
oJAN:SHOW()	
	

METHOD IMPRNC( ) 
LOCAL oRNC AS USEREDE	
LOCAL aDAD AS ARRAY
//LOCAL cDISPO,cCODRET AS STRING
LOCAL nRNC AS DWORD
nRNC:=SELF:server:FIELDGET("RNC")
IF ! Empty(SELF:server:FIELDGET("DATAFEC"))
   alert("J� Fechada")
   RETURN .f.
ENDIF			
IF Empty(nRNC)
   alert("N�o � Custo de RNC")
   RETURN .f.
ENDIF	
IF ! MDG("Importar (Zera Lan�ametos Atuais)")
   RETURN .f.	
ENDIF	
//cDISPO:=""		
//cCODRET:=""
aDAD:={zCURINI,"RNC.DBF",ZCURDIR}
oRNC:=USEREDE{aDAD}
IF oRNC:nERRO#0
   RETU SELF
ENDIF
oRNC:GOTOP()
IF oRNC:Seek(nRNC)
   SELF:SERVER:FIELDPUT("QTI01",oRNC:FIELDGET("SELTH"))	
   SELF:SERVER:FIELDPUT("VLI01",oRNC:FIELDGET("SELVL"))	
   SELF:SERVER:FIELDPUT("QTI02",oRNC:FIELDGET("REHTH"))	
   SELF:SERVER:FIELDPUT("VLI02",oRNC:FIELDGET("REHVL"))	
   SELF:SERVER:FIELDPUT("QTI03",oRNC:FIELDGET("RETTH"))	
   SELF:SERVER:FIELDPUT("VLI03",oRNC:FIELDGET("RETVL"))	
   SELF:SERVER:FIELDPUT("QTI04",oRNC:FIELDGET("REITH"))	
   SELF:SERVER:FIELDPUT("VLI04",oRNC:FIELDGET("REIVL"))	
   SELF:SERVER:FIELDPUT("QTI05",oRNC:FIELDGET("QTDSUC"))	
   SELF:SERVER:FIELDPUT("VLI05",oRNC:FIELDGET("VALSUC"))	
   SELF:SERVER:FIELDPUT("PCVALINT",oRNC:FIELDGET("PECSUC"))	
//   cDISPO:=oRNC:FIELDGET("DISPO")
//   cCODRET:=oRNC:FIELDGET("CODRET")
ENDIF	
oRNC:CLOSE()
//IF cDISPO="U".OR.cCODRET="S"
//   aDAD:={zCURINI,"RNCI.DBF",ZCURDIR}
//   oRNCI:=USEREDE{aDAD}
//   IF oRNCI:nERRO#0
//      RETU SELF
//   ENDIF
//   oRNCI:GOTOP()
//   IF oRNCI:Seek(nRNC)	
//      WHILE oRNCI:FIELDGET("RNC")=nRNC.AND. ! oRNCI:EOF
//         nQTDE+=oRNCI:FIELDGET("QTNC")
//      ENDDO	
//   ENDIF	
//   oRNCI:CLOSE()
//   SELF:SERVER:FIELDPUT("QTI05",nQTDE)	
//ENDIF

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcnqint",_GetInst()},iCtlID)

oDCQTI01 := rightSle{SELF,ResourceID{JCNQINT_QTI01,_GetInst()}}
oDCQTI01:FieldSpec := padrao_num_09_2{}
oDCQTI01:HyperLabel := HyperLabel{#QTI01,"Qti01:",NULL_STRING,"ACPNC_QTI01"}

oDCQTI02 := rightSle{SELF,ResourceID{JCNQINT_QTI02,_GetInst()}}
oDCQTI02:FieldSpec := padrao_num_09_2{}
oDCQTI02:HyperLabel := HyperLabel{#QTI02,"Qti02:",NULL_STRING,"ACPNC_QTI02"}

oDCQTI03 := rightSle{SELF,ResourceID{JCNQINT_QTI03,_GetInst()}}
oDCQTI03:FieldSpec := padrao_num_09_2{}
oDCQTI03:HyperLabel := HyperLabel{#QTI03,"Qti03:",NULL_STRING,"ACPNC_QTI03"}

oDCQTI04 := rightSle{SELF,ResourceID{JCNQINT_QTI04,_GetInst()}}
oDCQTI04:FieldSpec := padrao_num_09_2{}
oDCQTI04:HyperLabel := HyperLabel{#QTI04,"Qti04:",NULL_STRING,"ACPNC_QTI04"}

oDCQTI05 := rightSle{SELF,ResourceID{JCNQINT_QTI05,_GetInst()}}
oDCQTI05:FieldSpec := padrao_num_09_2{}
oDCQTI05:HyperLabel := HyperLabel{#QTI05,"Qti05:",NULL_STRING,"ACPNC_QTI05"}

oDCQTI06 := rightSle{SELF,ResourceID{JCNQINT_QTI06,_GetInst()}}
oDCQTI06:FieldSpec := padrao_num_09_2{}
oDCQTI06:HyperLabel := HyperLabel{#QTI06,"Qti06:",NULL_STRING,"ACPNC_QTI06"}

oDCVLI01 := rightSle{SELF,ResourceID{JCNQINT_VLI01,_GetInst()}}
oDCVLI01:FieldSpec := padrao_num_12_2{}
oDCVLI01:HyperLabel := HyperLabel{#VLI01,"DataWindow Caption",NULL_STRING,"ACPNC_VLI01"}

oDCVLI02 := rightSle{SELF,ResourceID{JCNQINT_VLI02,_GetInst()}}
oDCVLI02:FieldSpec := padrao_num_12_2{}
oDCVLI02:HyperLabel := HyperLabel{#VLI02,"Vli02:",NULL_STRING,"ACPNC_VLI02"}

oDCVLI03 := rightSle{SELF,ResourceID{JCNQINT_VLI03,_GetInst()}}
oDCVLI03:FieldSpec := padrao_num_12_2{}
oDCVLI03:HyperLabel := HyperLabel{#VLI03,"Vli03:",NULL_STRING,"ACPNC_VLI03"}

oDCVLI04 := rightSle{SELF,ResourceID{JCNQINT_VLI04,_GetInst()}}
oDCVLI04:FieldSpec := padrao_num_12_2{}
oDCVLI04:HyperLabel := HyperLabel{#VLI04,"Vli04:",NULL_STRING,"ACPNC_VLI04"}

oDCVLI05 := SingleLineEdit{SELF,ResourceID{JCNQINT_VLI05,_GetInst()}}
oDCVLI05:FieldSpec := padrao_num_12_2{}
oDCVLI05:HyperLabel := HyperLabel{#VLI05,"Vli05:",NULL_STRING,"ACPNC_VLI05"}

oDCVLI06 := SingleLineEdit{SELF,ResourceID{JCNQINT_VLI06,_GetInst()}}
oDCVLI06:FieldSpec := padrao_num_12_2{}
oDCVLI06:HyperLabel := HyperLabel{#VLI06,"Vli06:",NULL_STRING,"ACPNC_VLI06"}

oDCtheFixedText17 := FixedText{SELF,ResourceID{JCNQINT_THEFIXEDTEXT17,_GetInst()}}
oDCtheFixedText17:HyperLabel := HyperLabel{#theFixedText17,"Valores",NULL_STRING,NULL_STRING}

oDCtheFixedText19 := FixedText{SELF,ResourceID{JCNQINT_THEFIXEDTEXT19,_GetInst()}}
oDCtheFixedText19:HyperLabel := HyperLabel{#theFixedText19,"Outros",NULL_STRING,NULL_STRING}

oDCSC_QTI05 := FixedText{SELF,ResourceID{JCNQINT_SC_QTI05,_GetInst()}}
oDCSC_QTI05:HyperLabel := HyperLabel{#SC_QTI05,"Sucata",NULL_STRING,NULL_STRING}

oDCSC_QTI04 := FixedText{SELF,ResourceID{JCNQINT_SC_QTI04,_GetInst()}}
oDCSC_QTI04:HyperLabel := HyperLabel{#SC_QTI04,"Reinspe��o",NULL_STRING,NULL_STRING}

oDCSC_QTI03 := FixedText{SELF,ResourceID{JCNQINT_SC_QTI03,_GetInst()}}
oDCSC_QTI03:HyperLabel := HyperLabel{#SC_QTI03,"Retrabalho M�quina",NULL_STRING,NULL_STRING}

oDCSC_QTI02 := FixedText{SELF,ResourceID{JCNQINT_SC_QTI02,_GetInst()}}
oDCSC_QTI02:HyperLabel := HyperLabel{#SC_QTI02,"Retrabalho Homem",NULL_STRING,NULL_STRING}

oDCSC_QTI01 := FixedText{SELF,ResourceID{JCNQINT_SC_QTI01,_GetInst()}}
oDCSC_QTI01:HyperLabel := HyperLabel{#SC_QTI01,"Sele��o",NULL_STRING,NULL_STRING}

oDCtheFixedText16 := FixedText{SELF,ResourceID{JCNQINT_THEFIXEDTEXT16,_GetInst()}}
oDCtheFixedText16:HyperLabel := HyperLabel{#theFixedText16,"Quantidade/Horas",NULL_STRING,NULL_STRING}

oDCPCVALINT := rightSle{SELF,ResourceID{JCNQINT_PCVALINT,_GetInst()}}
oDCPCVALINT:FieldSpec := padrao_num_10_4{}
oDCPCVALINT:HyperLabel := HyperLabel{#PCVALINT,"Pcvalint:",NULL_STRING,"ACPNC_PCVALINT"}

oCCPegPreco := PushButton{SELF,ResourceID{JCNQINT_PEGPRECO,_GetInst()}}
oCCPegPreco:HyperLabel := HyperLabel{#PegPreco,"Pre�o",NULL_STRING,NULL_STRING}

oCCCalc := PushButton{SELF,ResourceID{JCNQINT_CALC,_GetInst()}}
oCCCalc:HyperLabel := HyperLabel{#Calc,"Calcular",NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{SELF,ResourceID{JCNQINT_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{SELF,ResourceID{JCNQINT_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ICO_OK{}

oCCFechar := PushButton{SELF,ResourceID{JCNQINT_FECHAR,_GetInst()}}
oCCFechar:HyperLabel := HyperLabel{#Fechar,"Fechar",NULL_STRING,NULL_STRING}

oDCDATAFEC := SingleLineEdit{SELF,ResourceID{JCNQINT_DATAFEC,_GetInst()}}
oDCDATAFEC:FieldSpec := date_field{}
oDCDATAFEC:HyperLabel := HyperLabel{#DATAFEC,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_DATA1 := FixedText{SELF,ResourceID{JCNQINT_SC_DATA1,_GetInst()}}
oDCSC_DATA1:HyperLabel := HyperLabel{#SC_DATA1,"Data Fechamento",NULL_STRING,NULL_STRING}

oCCIMPRNC := PushButton{SELF,ResourceID{JCNQINT_IMPRNC,_GetInst()}}
oCCIMPRNC:HyperLabel := HyperLabel{#IMPRNC,"Checar RNC",NULL_STRING,NULL_STRING}

SELF:Caption := "Custo N�o Qualidade Interno"
SELF:HyperLabel := HyperLabel{#jcnqint,"Custo N�o Qualidade Interno",NULL_STRING,NULL_STRING}

IF !IsNil(oServer)
	SELF:Use(oServer)
ELSE
	SELF:Use(SELF:Owner:Server)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


METHOD OK( ) 
	SELF:endwindow()

ACCESS PCVALINT() 
RETURN SELF:FieldGet(#PCVALINT)


ASSIGN PCVALINT(uValue) 
SELF:FieldPut(#PCVALINT, uValue)
RETURN PCVALINT := uValue


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
 RETURN SELF

ACCESS QTI01() 
RETURN SELF:FieldGet(#QTI01)


ASSIGN QTI01(uValue) 
SELF:FieldPut(#QTI01, uValue)
RETURN QTI01 := uValue


ACCESS QTI02() 
RETURN SELF:FieldGet(#QTI02)


ASSIGN QTI02(uValue) 
SELF:FieldPut(#QTI02, uValue)
RETURN QTI02 := uValue


ACCESS QTI03() 
RETURN SELF:FieldGet(#QTI03)


ASSIGN QTI03(uValue) 
SELF:FieldPut(#QTI03, uValue)
RETURN QTI03 := uValue


ACCESS QTI04() 
RETURN SELF:FieldGet(#QTI04)


ASSIGN QTI04(uValue) 
SELF:FieldPut(#QTI04, uValue)
RETURN QTI04 := uValue


ACCESS QTI05() 
RETURN SELF:FieldGet(#QTI05)


ASSIGN QTI05(uValue) 
SELF:FieldPut(#QTI05, uValue)
RETURN QTI05 := uValue


ACCESS QTI06() 
RETURN SELF:FieldGet(#QTI06)


ASSIGN QTI06(uValue) 
SELF:FieldPut(#QTI06, uValue)
RETURN QTI06 := uValue


METHOD Timer() 
   SELF:SERVER:COMMIT()


METHOD VERRNC( ) 
LOCAL oRNC AS USEREDE	
LOCAL aDAD AS ARRAY
LOCAL nRNC AS DWORD
LOCAL oJAN AS JRNC4
nRNC:=SELF:server:FIELDGET("RNC")
IF ! Empty(SELF:server:FIELDGET("DATAFEC"))
   alert("J� Fechada")
   RETURN .f.
ENDIF			
IF Empty(nRNC)
   alert("N�o � Custo de RNC")
   RETURN .f.
ENDIF	
aDAD:={zCURINI,"RNC.DBF",ZCURDIR}
oRNC:=USEREDE{aDAD}
IF oRNC:nERRO#0
   RETU SELF
ENDIF
oRNC:GOTOP()
IF oRNC:Seek(nRNC)
   oJAN:=JRNC4{SELF,,oRNC}
   oJAN:SHOW()
ENDIF	
oRNC:CLOSE()
	

ACCESS VLI01() 
RETURN SELF:FieldGet(#VLI01)


ASSIGN VLI01(uValue) 
SELF:FieldPut(#VLI01, uValue)
RETURN VLI01 := uValue


ACCESS VLI02() 
RETURN SELF:FieldGet(#VLI02)


ASSIGN VLI02(uValue) 
SELF:FieldPut(#VLI02, uValue)
RETURN VLI02 := uValue


ACCESS VLI03() 
RETURN SELF:FieldGet(#VLI03)


ASSIGN VLI03(uValue) 
SELF:FieldPut(#VLI03, uValue)
RETURN VLI03 := uValue


ACCESS VLI04() 
RETURN SELF:FieldGet(#VLI04)


ASSIGN VLI04(uValue) 
SELF:FieldPut(#VLI04, uValue)
RETURN VLI04 := uValue


ACCESS VLI05() 
RETURN SELF:FieldGet(#VLI05)


ASSIGN VLI05(uValue) 
SELF:FieldPut(#VLI05, uValue)
RETURN VLI05 := uValue


ACCESS VLI06() 
RETURN SELF:FieldGet(#VLI06)


ASSIGN VLI06(uValue) 
SELF:FieldPut(#VLI06, uValue)
RETURN VLI06 := uValue


END CLASS
