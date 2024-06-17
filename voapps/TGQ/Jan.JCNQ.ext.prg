#region DEFINES
STATIC DEFINE JCNQEXT_CALC := 126 
STATIC DEFINE JCNQEXT_DATAFEC := 135 
STATIC DEFINE JCNQEXT_FECHAR := 134 
STATIC DEFINE JCNQEXT_IMPRNC := 143 
STATIC DEFINE JCNQEXT_OK := 130 
STATIC DEFINE JCNQEXT_PCVALEXT := 128 
STATIC DEFINE JCNQEXT_PEGPRECO := 127 
STATIC DEFINE JCNQEXT_QTE01 := 100 
STATIC DEFINE JCNQEXT_QTE02 := 101 
STATIC DEFINE JCNQEXT_QTE03 := 102 
STATIC DEFINE JCNQEXT_QTE04 := 103 
STATIC DEFINE JCNQEXT_QTE05 := 104 
STATIC DEFINE JCNQEXT_QTE06 := 105 
STATIC DEFINE JCNQEXT_QTE07 := 106 
STATIC DEFINE JCNQEXT_QTE08 := 107 
STATIC DEFINE JCNQEXT_QTE09 := 132 
STATIC DEFINE JCNQEXT_QTE10 := 141 
STATIC DEFINE JCNQEXT_QTE11 := 138 
STATIC DEFINE JCNQEXT_SC_DATA1 := 136 
STATIC DEFINE JCNQEXT_SC_QTE01 := 118 
STATIC DEFINE JCNQEXT_SC_QTE02 := 120 
STATIC DEFINE JCNQEXT_SC_QTE03 := 119 
STATIC DEFINE JCNQEXT_SC_QTE04 := 121 
STATIC DEFINE JCNQEXT_SC_QTE05 := 122 
STATIC DEFINE JCNQEXT_SC_QTE06 := 123 
STATIC DEFINE JCNQEXT_SC_QTE07 := 124 
STATIC DEFINE JCNQEXT_SC_QTE8 := 133 
STATIC DEFINE JCNQEXT_SC_QTI03 := 142 
STATIC DEFINE JCNQEXT_SC_QTI04 := 139 
STATIC DEFINE JCNQEXT_THEFIXEDTEXT10 := 129 
STATIC DEFINE JCNQEXT_THEFIXEDTEXT18 := 125 
STATIC DEFINE JCNQEXT_THEFIXEDTEXT23 := 116 
STATIC DEFINE JCNQEXT_THEFIXEDTEXT24 := 117 
STATIC DEFINE JCNQEXT_VLE01 := 108 
STATIC DEFINE JCNQEXT_VLE02 := 109 
STATIC DEFINE JCNQEXT_VLE03 := 110 
STATIC DEFINE JCNQEXT_VLE04 := 111 
STATIC DEFINE JCNQEXT_VLE05 := 112 
STATIC DEFINE JCNQEXT_VLE06 := 113 
STATIC DEFINE JCNQEXT_VLE07 := 114 
STATIC DEFINE JCNQEXT_VLE08 := 115 
STATIC DEFINE JCNQEXT_VLE09 := 131 
STATIC DEFINE JCNQEXT_VLE10 := 140 
STATIC DEFINE JCNQEXT_VLE11 := 137 
#endregion

PARTIAL CLASS jcnqext INHERIT DATADIALOG 

	PROTECT oDCQTE01 AS RIGHTSLE
	PROTECT oDCQTE02 AS RIGHTSLE
	PROTECT oDCQTE03 AS RIGHTSLE
	PROTECT oDCQTE04 AS RIGHTSLE
	PROTECT oDCQTE05 AS RIGHTSLE
	PROTECT oDCQTE06 AS RIGHTSLE
	PROTECT oDCQTE07 AS SINGLELINEEDIT
	PROTECT oDCQTE08 AS SINGLELINEEDIT
	PROTECT oDCVLE01 AS SINGLELINEEDIT
	PROTECT oDCVLE02 AS SINGLELINEEDIT
	PROTECT oDCVLE03 AS SINGLELINEEDIT
	PROTECT oDCVLE04 AS SINGLELINEEDIT
	PROTECT oDCVLE05 AS SINGLELINEEDIT
	PROTECT oDCVLE06 AS SINGLELINEEDIT
	PROTECT oDCVLE07 AS SINGLELINEEDIT
	PROTECT oDCVLE08 AS SINGLELINEEDIT
	PROTECT oDCtheFixedText23 AS FIXEDTEXT
	PROTECT oDCtheFixedText24 AS FIXEDTEXT
	PROTECT oDCSC_QTE01 AS FIXEDTEXT
	PROTECT oDCSC_QTE03 AS FIXEDTEXT
	PROTECT oDCSC_QTE02 AS FIXEDTEXT
	PROTECT oDCSC_QTE04 AS FIXEDTEXT
	PROTECT oDCSC_QTE05 AS FIXEDTEXT
	PROTECT oDCSC_QTE06 AS FIXEDTEXT
	PROTECT oDCSC_QTE07 AS FIXEDTEXT
	PROTECT oDCtheFixedText18 AS FIXEDTEXT
	PROTECT oCCCalc AS PUSHBUTTON
	PROTECT oCCPegPreco AS PUSHBUTTON
	PROTECT oDCPCVALEXT AS SINGLELINEEDIT
	PROTECT oDCtheFixedText10 AS FIXEDTEXT
	PROTECT oCCOK AS PUSHBUTTON
	PROTECT oDCVLE09 AS SINGLELINEEDIT
	PROTECT oDCQTE09 AS SINGLELINEEDIT
	PROTECT oDCSC_QTE8 AS FIXEDTEXT
	PROTECT oCCFechar AS PUSHBUTTON
	PROTECT oDCDATAFEC AS SINGLELINEEDIT
	PROTECT oDCSC_DATA1 AS FIXEDTEXT
	PROTECT oDCVLE11 AS SINGLELINEEDIT
	PROTECT oDCQTE11 AS SINGLELINEEDIT
	PROTECT oDCSC_QTI04 AS FIXEDTEXT
	PROTECT oDCVLE10 AS SINGLELINEEDIT
	PROTECT oDCQTE10 AS SINGLELINEEDIT
	PROTECT oDCSC_QTI03 AS FIXEDTEXT
	PROTECT oCCIMPRNC AS PUSHBUTTON
// 	instance QTE01 
// 	instance QTE02 
// 	instance QTE03 
// 	instance QTE04 
// 	instance QTE05 
// 	instance QTE06 
// 	instance QTE07 
// 	instance QTE08 
// 	instance VLE01 
// 	instance VLE02 
// 	instance VLE03 
// 	instance VLE04 
// 	instance VLE05 
// 	instance VLE06 
// 	instance VLE07 
// 	instance VLE08 
// 	instance PCVALEXT 
// 	instance VLE09 
// 	instance QTE09 
// 	instance DATAFEC 
// 	instance VLE11 
// 	instance QTE11 
// 	instance VLE10 
// 	instance QTE10 

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
   RETURN .F.
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
   RETURN .F.
ENDIF			
IF Empty(nRNC)
   alert("N�o � Custo de RNC")
   RETURN .F.
ENDIF	
IF ! MDG("Importar (Zera Lan�ametos Atuais)")
   RETURN .F.	
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
   SELF:SERVER:FIELDPUT("QTE06",oRNC:FIELDGET("SELTH"))	
   SELF:SERVER:FIELDPUT("VLE06",oRNC:FIELDGET("SELVL"))	
   SELF:SERVER:FIELDPUT("QTE09",oRNC:FIELDGET("REHTH"))	
   SELF:SERVER:FIELDPUT("VLE09",oRNC:FIELDGET("REHVL"))	
   SELF:SERVER:FIELDPUT("QTE10",oRNC:FIELDGET("RETTH"))	
   SELF:SERVER:FIELDPUT("VLE10",oRNC:FIELDGET("RETVL"))	
   SELF:SERVER:FIELDPUT("QTE11",oRNC:FIELDGET("REITH"))	
   SELF:SERVER:FIELDPUT("VLE11",oRNC:FIELDGET("REIVL"))	
   SELF:SERVER:FIELDPUT("QTE07",oRNC:FIELDGET("QTDSUC"))	
   SELF:SERVER:FIELDPUT("VLE07",oRNC:FIELDGET("VALSUC"))	
   SELF:SERVER:FIELDPUT("PCVALEXT",oRNC:FIELDGET("PECSUC"))	
ENDIF	
oRNC:CLOSE()


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcnqext",_GetInst()},iCtlID)

oDCQTE01 := rightSle{SELF,ResourceID{JCNQEXT_QTE01,_GetInst()}}
oDCQTE01:FieldSpec := padrao_num_09_2{}
oDCQTE01:HyperLabel := HyperLabel{#QTE01,"Qte01:",NULL_STRING,"ACPNC_QTE01"}

oDCQTE02 := rightSle{SELF,ResourceID{JCNQEXT_QTE02,_GetInst()}}
oDCQTE02:FieldSpec := padrao_num_09_2{}
oDCQTE02:HyperLabel := HyperLabel{#QTE02,"Qte02:",NULL_STRING,"ACPNC_QTE02"}

oDCQTE03 := rightSle{SELF,ResourceID{JCNQEXT_QTE03,_GetInst()}}
oDCQTE03:FieldSpec := padrao_num_09_2{}
oDCQTE03:HyperLabel := HyperLabel{#QTE03,"Qte03:",NULL_STRING,"ACPNC_QTE03"}

oDCQTE04 := rightSle{SELF,ResourceID{JCNQEXT_QTE04,_GetInst()}}
oDCQTE04:FieldSpec := padrao_num_09_2{}
oDCQTE04:HyperLabel := HyperLabel{#QTE04,"Qte04:",NULL_STRING,"ACPNC_QTE04"}

oDCQTE05 := rightSle{SELF,ResourceID{JCNQEXT_QTE05,_GetInst()}}
oDCQTE05:FieldSpec := padrao_num_09_2{}
oDCQTE05:HyperLabel := HyperLabel{#QTE05,"Qte05:",NULL_STRING,"ACPNC_QTE05"}

oDCQTE06 := rightSle{SELF,ResourceID{JCNQEXT_QTE06,_GetInst()}}
oDCQTE06:FieldSpec := padrao_num_09_2{}
oDCQTE06:HyperLabel := HyperLabel{#QTE06,"Sucatas",NULL_STRING,"ACPNC_QTE06"}

oDCQTE07 := SingleLineEdit{SELF,ResourceID{JCNQEXT_QTE07,_GetInst()}}
oDCQTE07:FieldSpec := padrao_num_09_2{}
oDCQTE07:HyperLabel := HyperLabel{#QTE07,"Qte07:",NULL_STRING,"ACPNC_QTE07"}

oDCQTE08 := SingleLineEdit{SELF,ResourceID{JCNQEXT_QTE08,_GetInst()}}
oDCQTE08:FieldSpec := padrao_num_09_2{}
oDCQTE08:HyperLabel := HyperLabel{#QTE08,"Qte08:",NULL_STRING,"ACPNC_QTE08"}

oDCVLE01 := SingleLineEdit{SELF,ResourceID{JCNQEXT_VLE01,_GetInst()}}
oDCVLE01:FieldSpec := padrao_num_12_2{}
oDCVLE01:HyperLabel := HyperLabel{#VLE01,"Vle01:",NULL_STRING,"ACPNC_VLE01"}

oDCVLE02 := SingleLineEdit{SELF,ResourceID{JCNQEXT_VLE02,_GetInst()}}
oDCVLE02:FieldSpec := padrao_num_12_2{}
oDCVLE02:HyperLabel := HyperLabel{#VLE02,"Vle02:",NULL_STRING,"ACPNC_VLE02"}

oDCVLE03 := SingleLineEdit{SELF,ResourceID{JCNQEXT_VLE03,_GetInst()}}
oDCVLE03:FieldSpec := padrao_num_12_2{}
oDCVLE03:HyperLabel := HyperLabel{#VLE03,"Vle03:",NULL_STRING,"ACPNC_VLE03"}

oDCVLE04 := SingleLineEdit{SELF,ResourceID{JCNQEXT_VLE04,_GetInst()}}
oDCVLE04:FieldSpec := padrao_num_12_2{}
oDCVLE04:HyperLabel := HyperLabel{#VLE04,"Vle04:",NULL_STRING,"ACPNC_VLE04"}

oDCVLE05 := SingleLineEdit{SELF,ResourceID{JCNQEXT_VLE05,_GetInst()}}
oDCVLE05:FieldSpec := padrao_num_12_2{}
oDCVLE05:HyperLabel := HyperLabel{#VLE05,"Vle05:",NULL_STRING,"ACPNC_VLE05"}

oDCVLE06 := SingleLineEdit{SELF,ResourceID{JCNQEXT_VLE06,_GetInst()}}
oDCVLE06:FieldSpec := padrao_num_12_2{}
oDCVLE06:HyperLabel := HyperLabel{#VLE06,"Vle06:",NULL_STRING,"ACPNC_VLE06"}

oDCVLE07 := SingleLineEdit{SELF,ResourceID{JCNQEXT_VLE07,_GetInst()}}
oDCVLE07:FieldSpec := padrao_num_12_2{}
oDCVLE07:HyperLabel := HyperLabel{#VLE07,"Vle07:",NULL_STRING,"ACPNC_VLE07"}

oDCVLE08 := SingleLineEdit{SELF,ResourceID{JCNQEXT_VLE08,_GetInst()}}
oDCVLE08:FieldSpec := padrao_num_12_2{}
oDCVLE08:HyperLabel := HyperLabel{#VLE08,"Vle08:",NULL_STRING,"ACPNC_VLE08"}

oDCtheFixedText23 := FixedText{SELF,ResourceID{JCNQEXT_THEFIXEDTEXT23,_GetInst()}}
oDCtheFixedText23:HyperLabel := HyperLabel{#theFixedText23,"Valores",NULL_STRING,NULL_STRING}

oDCtheFixedText24 := FixedText{SELF,ResourceID{JCNQEXT_THEFIXEDTEXT24,_GetInst()}}
oDCtheFixedText24:HyperLabel := HyperLabel{#theFixedText24,"Quantidade/Horas",NULL_STRING,NULL_STRING}

oDCSC_QTE01 := FixedText{SELF,ResourceID{JCNQEXT_SC_QTE01,_GetInst()}}
oDCSC_QTE01:HyperLabel := HyperLabel{#SC_QTE01,"Despesas de Percurso",NULL_STRING,NULL_STRING}

oDCSC_QTE03 := FixedText{SELF,ResourceID{JCNQEXT_SC_QTE03,_GetInst()}}
oDCSC_QTE03:HyperLabel := HyperLabel{#SC_QTE03,"Material Usado Retrabalho",NULL_STRING,NULL_STRING}

oDCSC_QTE02 := FixedText{SELF,ResourceID{JCNQEXT_SC_QTE02,_GetInst()}}
oDCSC_QTE02:HyperLabel := HyperLabel{#SC_QTE02,"Sele�ao Retrabalho Cliente ",NULL_STRING,NULL_STRING}

oDCSC_QTE04 := FixedText{SELF,ResourceID{JCNQEXT_SC_QTE04,_GetInst()}}
oDCSC_QTE04:HyperLabel := HyperLabel{#SC_QTE04,"Transp.Alim.Hospe.",NULL_STRING,NULL_STRING}

oDCSC_QTE05 := FixedText{SELF,ResourceID{JCNQEXT_SC_QTE05,_GetInst()}}
oDCSC_QTE05:HyperLabel := HyperLabel{#SC_QTE05,"Analise de Devolu�ao",NULL_STRING,NULL_STRING}

oDCSC_QTE06 := FixedText{SELF,ResourceID{JCNQEXT_SC_QTE06,_GetInst()}}
oDCSC_QTE06:HyperLabel := HyperLabel{#SC_QTE06,"Sele�ao",NULL_STRING,NULL_STRING}

oDCSC_QTE07 := FixedText{SELF,ResourceID{JCNQEXT_SC_QTE07,_GetInst()}}
oDCSC_QTE07:HyperLabel := HyperLabel{#SC_QTE07,"Sucatas",NULL_STRING,NULL_STRING}

oDCtheFixedText18 := FixedText{SELF,ResourceID{JCNQEXT_THEFIXEDTEXT18,_GetInst()}}
oDCtheFixedText18:HyperLabel := HyperLabel{#theFixedText18,"Outros",NULL_STRING,NULL_STRING}

oCCCalc := PushButton{SELF,ResourceID{JCNQEXT_CALC,_GetInst()}}
oCCCalc:HyperLabel := HyperLabel{#Calc,"Calcular",NULL_STRING,NULL_STRING}

oCCPegPreco := PushButton{SELF,ResourceID{JCNQEXT_PEGPRECO,_GetInst()}}
oCCPegPreco:HyperLabel := HyperLabel{#PegPreco,"Pre�o",NULL_STRING,NULL_STRING}

oDCPCVALEXT := SingleLineEdit{SELF,ResourceID{JCNQEXT_PCVALEXT,_GetInst()}}
oDCPCVALEXT:FieldSpec := padrao_num_10_4{}
oDCPCVALEXT:HyperLabel := HyperLabel{#PCVALEXT,"Pcvalint:",NULL_STRING,"ACPNC_PCVALINT"}

oDCtheFixedText10 := FixedText{SELF,ResourceID{JCNQEXT_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{SELF,ResourceID{JCNQEXT_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}

oDCVLE09 := SingleLineEdit{SELF,ResourceID{JCNQEXT_VLE09,_GetInst()}}
oDCVLE09:FieldSpec := padrao_num_12_2{}
oDCVLE09:HyperLabel := HyperLabel{#VLE09,"Vle07:",NULL_STRING,"ACPNC_VLE07"}

oDCQTE09 := SingleLineEdit{SELF,ResourceID{JCNQEXT_QTE09,_GetInst()}}
oDCQTE09:FieldSpec := padrao_num_09_2{}
oDCQTE09:HyperLabel := HyperLabel{#QTE09,"Qte07:",NULL_STRING,"ACPNC_QTE07"}

oDCSC_QTE8 := FixedText{SELF,ResourceID{JCNQEXT_SC_QTE8,_GetInst()}}
oDCSC_QTE8:HyperLabel := HyperLabel{#SC_QTE8,"Retrabalho Hora Homem",NULL_STRING,NULL_STRING}

oCCFechar := PushButton{SELF,ResourceID{JCNQEXT_FECHAR,_GetInst()}}
oCCFechar:HyperLabel := HyperLabel{#Fechar,"Fechar",NULL_STRING,NULL_STRING}

oDCDATAFEC := SingleLineEdit{SELF,ResourceID{JCNQEXT_DATAFEC,_GetInst()}}
oDCDATAFEC:FieldSpec := date_field{}
oDCDATAFEC:HyperLabel := HyperLabel{#DATAFEC,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_DATA1 := FixedText{SELF,ResourceID{JCNQEXT_SC_DATA1,_GetInst()}}
oDCSC_DATA1:HyperLabel := HyperLabel{#SC_DATA1,"Data Fechamento",NULL_STRING,NULL_STRING}

oDCVLE11 := SingleLineEdit{SELF,ResourceID{JCNQEXT_VLE11,_GetInst()}}
oDCVLE11:FieldSpec := padrao_num_12_2{}
oDCVLE11:HyperLabel := HyperLabel{#VLE11,"Vli03:",NULL_STRING,"ACPNC_VLI04"}

oDCQTE11 := SingleLineEdit{SELF,ResourceID{JCNQEXT_QTE11,_GetInst()}}
oDCQTE11:FieldSpec := padrao_num_09_2{}
oDCQTE11:HyperLabel := HyperLabel{#QTE11,"Qti04:",NULL_STRING,"ACPNC_QTI04"}

oDCSC_QTI04 := FixedText{SELF,ResourceID{JCNQEXT_SC_QTI04,_GetInst()}}
oDCSC_QTI04:HyperLabel := HyperLabel{#SC_QTI04,"Reinspe��o",NULL_STRING,NULL_STRING}

oDCVLE10 := SingleLineEdit{SELF,ResourceID{JCNQEXT_VLE10,_GetInst()}}
oDCVLE10:FieldSpec := padrao_num_12_2{}
oDCVLE10:HyperLabel := HyperLabel{#VLE10,"Vli03:",NULL_STRING,"ACPNC_VLI03"}

oDCQTE10 := SingleLineEdit{SELF,ResourceID{JCNQEXT_QTE10,_GetInst()}}
oDCQTE10:FieldSpec := padrao_num_09_2{}
oDCQTE10:HyperLabel := HyperLabel{#QTE10,"Qti03:",NULL_STRING,"ACPNC_QTI03"}

oDCSC_QTI03 := FixedText{SELF,ResourceID{JCNQEXT_SC_QTI03,_GetInst()}}
oDCSC_QTI03:HyperLabel := HyperLabel{#SC_QTI03,"Retrabalho M�quina",NULL_STRING,NULL_STRING}

oCCIMPRNC := PushButton{SELF,ResourceID{JCNQEXT_IMPRNC,_GetInst()}}
oCCIMPRNC:HyperLabel := HyperLabel{#IMPRNC,"Checar RNC",NULL_STRING,NULL_STRING}

SELF:Caption := "Custo N�o Qualidade Externo"
SELF:HyperLabel := HyperLabel{#jcnqext,"Custo N�o Qualidade Externo",NULL_STRING,NULL_STRING}

IF !IsNil(oServer)
	SELF:Use(oServer)
ELSE
	SELF:Use(SELF:Owner:Server)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


METHOD OK( ) 
	SELF:endwindow()

ACCESS PCVALEXT() 
RETURN SELF:FieldGet(#PCVALEXT)


ASSIGN PCVALEXT(uValue) 
SELF:FieldPut(#PCVALEXT, uValue)
RETURN PCVALEXT := uValue


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
 RETURN SELF

ACCESS QTE01() 
RETURN SELF:FieldGet(#QTE01)


ASSIGN QTE01(uValue) 
SELF:FieldPut(#QTE01, uValue)
RETURN QTE01 := uValue


ACCESS QTE02() 
RETURN SELF:FieldGet(#QTE02)


ASSIGN QTE02(uValue) 
SELF:FieldPut(#QTE02, uValue)
RETURN QTE02 := uValue


ACCESS QTE03() 
RETURN SELF:FieldGet(#QTE03)


ASSIGN QTE03(uValue) 
SELF:FieldPut(#QTE03, uValue)
RETURN QTE03 := uValue


ACCESS QTE04() 
RETURN SELF:FieldGet(#QTE04)


ASSIGN QTE04(uValue) 
SELF:FieldPut(#QTE04, uValue)
RETURN QTE04 := uValue


ACCESS QTE05() 
RETURN SELF:FieldGet(#QTE05)


ASSIGN QTE05(uValue) 
SELF:FieldPut(#QTE05, uValue)
RETURN QTE05 := uValue


ACCESS QTE06() 
RETURN SELF:FieldGet(#QTE06)


ASSIGN QTE06(uValue) 
SELF:FieldPut(#QTE06, uValue)
RETURN QTE06 := uValue


ACCESS QTE07() 
RETURN SELF:FieldGet(#QTE07)


ASSIGN QTE07(uValue) 
SELF:FieldPut(#QTE07, uValue)
RETURN QTE07 := uValue


ACCESS QTE08() 
RETURN SELF:FieldGet(#QTE08)


ASSIGN QTE08(uValue) 
SELF:FieldPut(#QTE08, uValue)
RETURN QTE08 := uValue


ACCESS QTE09() 
RETURN SELF:FieldGet(#QTE09)


ASSIGN QTE09(uValue) 
SELF:FieldPut(#QTE09, uValue)
RETURN QTE09 := uValue


ACCESS QTE10() 
RETURN SELF:FieldGet(#QTE10)


ASSIGN QTE10(uValue) 
SELF:FieldPut(#QTE10, uValue)
RETURN QTE10 := uValue


ACCESS QTE11() 
RETURN SELF:FieldGet(#QTE11)


ASSIGN QTE11(uValue) 
SELF:FieldPut(#QTE11, uValue)
RETURN QTE11 := uValue


METHOD Timer() 
   SELF:SERVER:COMMIT()


ACCESS VLE01() 
RETURN SELF:FieldGet(#VLE01)


ASSIGN VLE01(uValue) 
SELF:FieldPut(#VLE01, uValue)
RETURN VLE01 := uValue


ACCESS VLE02() 
RETURN SELF:FieldGet(#VLE02)


ASSIGN VLE02(uValue) 
SELF:FieldPut(#VLE02, uValue)
RETURN VLE02 := uValue


ACCESS VLE03() 
RETURN SELF:FieldGet(#VLE03)


ASSIGN VLE03(uValue) 
SELF:FieldPut(#VLE03, uValue)
RETURN VLE03 := uValue


ACCESS VLE04() 
RETURN SELF:FieldGet(#VLE04)


ASSIGN VLE04(uValue) 
SELF:FieldPut(#VLE04, uValue)
RETURN VLE04 := uValue


ACCESS VLE05() 
RETURN SELF:FieldGet(#VLE05)


ASSIGN VLE05(uValue) 
SELF:FieldPut(#VLE05, uValue)
RETURN VLE05 := uValue


ACCESS VLE06() 
RETURN SELF:FieldGet(#VLE06)


ASSIGN VLE06(uValue) 
SELF:FieldPut(#VLE06, uValue)
RETURN VLE06 := uValue


ACCESS VLE07() 
RETURN SELF:FieldGet(#VLE07)


ASSIGN VLE07(uValue) 
SELF:FieldPut(#VLE07, uValue)
RETURN VLE07 := uValue


ACCESS VLE08() 
RETURN SELF:FieldGet(#VLE08)


ASSIGN VLE08(uValue) 
SELF:FieldPut(#VLE08, uValue)
RETURN VLE08 := uValue


ACCESS VLE09() 
RETURN SELF:FieldGet(#VLE09)


ASSIGN VLE09(uValue) 
SELF:FieldPut(#VLE09, uValue)
RETURN VLE09 := uValue


ACCESS VLE10() 
RETURN SELF:FieldGet(#VLE10)


ASSIGN VLE10(uValue) 
SELF:FieldPut(#VLE10, uValue)
RETURN VLE10 := uValue


ACCESS VLE11() 
RETURN SELF:FieldGet(#VLE11)


ASSIGN VLE11(uValue) 
SELF:FieldPut(#VLE11, uValue)
RETURN VLE11 := uValue


END CLASS
CLASS XJCNQEXT INHERIT JCNQEXT


CONSTRUCTOR(oOWNER,oSERVER) 
SUPER(oOWNER,,oSERVER)	
SELF:oDCQTE01:disable()
SELF:oDCQTE02:disable()
SELF:oDCQTE03:disable()
SELF:oDCQTE04:disable()
SELF:oDCQTE05:disable()
SELF:oDCQTE06:disable()
SELF:oDCQTE07:disable()
SELF:oDCQTE08:disable()
SELF:oDCQTE09:disable()
SELF:oDCQTE10:disable()
SELF:oDCQTE11:disable()


SELF:oDCVLE01:disable()
SELF:oDCVLE02:disable()
SELF:oDCVLE03:disable()
SELF:oDCVLE04:disable()
SELF:oDCVLE05:disable()
SELF:oDCVLE06:disable()
SELF:oDCVLE07:disable()
SELF:oDCVLE08:disable()
SELF:oDCVLE09:disable()
SELF:oDCVLE10:disable()
SELF:oDCVLE11:disable()

SELF:oDCPCVALEXT:disable()
SELF:oCCIMPRNC:disable()
SELF:oCCPegPreco:disable()
SELF:oCCCalc:disable()
SELF:oCCFechar:disable()


SELF:SHOW()


END CLASS
