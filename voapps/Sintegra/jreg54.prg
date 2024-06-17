#region DEFINES
STATIC DEFINE JREG54_BASEICM := 135 
STATIC DEFINE JREG54_BASESUB := 136 
STATIC DEFINE JREG54_BUSCANUM := 155 
STATIC DEFINE JREG54_CFOP := 128 
STATIC DEFINE JREG54_CGC := 124 
STATIC DEFINE JREG54_CMDCHECKALI := 152 
STATIC DEFINE JREG54_CMDCHECKCGC := 146 
STATIC DEFINE JREG54_CMDCHECKES := 150 
STATIC DEFINE JREG54_CMDCHECKUF := 149 
STATIC DEFINE JREG54_CMDCHECMOD := 153 
STATIC DEFINE JREG54_CMDESCMOD := 151 
STATIC DEFINE JREG54_CMDESCMOD1 := 154 
STATIC DEFINE JREG54_CMDTIPO := 147 
STATIC DEFINE JREG54_CMDTIPO1 := 148 
STATIC DEFINE JREG54_CODIGO := 140 
STATIC DEFINE JREG54_CODIGORED := 131 
STATIC DEFINE JREG54_DESCONTO := 134 
STATIC DEFINE JREG54_FORNECEDO := 143 
STATIC DEFINE JREG54_ICM := 138 
STATIC DEFINE JREG54_ITEM := 130 
STATIC DEFINE JREG54_MODELO := 125 
STATIC DEFINE JREG54_NUMERO := 127 
STATIC DEFINE JREG54_PORNUM := 156 
STATIC DEFINE JREG54_QTDE := 132 
STATIC DEFINE JREG54_SC_BASEICM := 112 
STATIC DEFINE JREG54_SC_BASESUB := 113 
STATIC DEFINE JREG54_SC_CFOP := 105 
STATIC DEFINE JREG54_SC_CGC := 101 
STATIC DEFINE JREG54_SC_CODIGO := 117 
STATIC DEFINE JREG54_SC_CODIGORED := 108 
STATIC DEFINE JREG54_SC_DESCONTO := 111 
STATIC DEFINE JREG54_SC_FORNECEDO := 120 
STATIC DEFINE JREG54_SC_ICM := 115 
STATIC DEFINE JREG54_SC_ITEM := 107 
STATIC DEFINE JREG54_SC_MODELO := 102 
STATIC DEFINE JREG54_SC_NUMERO := 104 
STATIC DEFINE JREG54_SC_QTDE := 109 
STATIC DEFINE JREG54_SC_SERIE := 103 
STATIC DEFINE JREG54_SC_SITUACAO := 106 
STATIC DEFINE JREG54_SC_SUB := 122 
STATIC DEFINE JREG54_SC_TIPO := 100 
STATIC DEFINE JREG54_SC_TIPOCLI := 119 
STATIC DEFINE JREG54_SC_TIPOENT := 116 
STATIC DEFINE JREG54_SC_TIPONF := 118 
STATIC DEFINE JREG54_SC_UF := 121 
STATIC DEFINE JREG54_SC_VALORIPI := 114 
STATIC DEFINE JREG54_SC_VALORMER := 110 
STATIC DEFINE JREG54_SERIE := 126 
STATIC DEFINE JREG54_SITUACAO := 129 
STATIC DEFINE JREG54_SUB := 145 
STATIC DEFINE JREG54_TIPO := 123 
STATIC DEFINE JREG54_TIPOCLI := 142 
STATIC DEFINE JREG54_TIPOENT := 139 
STATIC DEFINE JREG54_TIPONF := 141 
STATIC DEFINE JREG54_UF := 144 
STATIC DEFINE JREG54_VALORIPI := 137 
STATIC DEFINE JREG54_VALORMER := 133 
#endregion

class jreg54 inherit MYDataWindow 

	PROTECT oDBTIPO as DataColumn
	PROTECT oDBCGC as DataColumn
	PROTECT oDBMODELO as DataColumn
	PROTECT oDBSERIE as DataColumn
	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCFOP as DataColumn
	PROTECT oDBSITUACAO as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBCODIGORED as DataColumn
	PROTECT oDBQTDE as DataColumn
	PROTECT oDBVALORMER as DataColumn
	PROTECT oDBDESCONTO as DataColumn
	PROTECT oDBBASEICM as DataColumn
	PROTECT oDBBASESUB as DataColumn
	PROTECT oDBVALORIPI as DataColumn
	PROTECT oDBICM as DataColumn
	PROTECT oDBTIPOENT as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBTIPONF as DataColumn
	PROTECT oDBTIPOCLI as DataColumn
	PROTECT oDBFORNECEDO as DataColumn
	PROTECT oDBUF as DataColumn
	PROTECT oDBSUB as DataColumn
	protect oDCSC_TIPO as FIXEDTEXT
	protect oDCSC_CGC as FIXEDTEXT
	protect oDCSC_MODELO as FIXEDTEXT
	protect oDCSC_SERIE as FIXEDTEXT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_CFOP as FIXEDTEXT
	protect oDCSC_SITUACAO as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCSC_CODIGORED as FIXEDTEXT
	protect oDCSC_QTDE as FIXEDTEXT
	protect oDCSC_VALORMER as FIXEDTEXT
	protect oDCSC_DESCONTO as FIXEDTEXT
	protect oDCSC_BASEICM as FIXEDTEXT
	protect oDCSC_BASESUB as FIXEDTEXT
	protect oDCSC_VALORIPI as FIXEDTEXT
	protect oDCSC_ICM as FIXEDTEXT
	protect oDCSC_TIPOENT as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_TIPONF as FIXEDTEXT
	protect oDCSC_TIPOCLI as FIXEDTEXT
	protect oDCSC_FORNECEDO as FIXEDTEXT
	protect oDCSC_UF as FIXEDTEXT
	protect oDCSC_SUB as FIXEDTEXT
	protect oDCTIPO as SINGLELINEEDIT
	protect oDCCGC as SINGLELINEEDIT
	protect oDCMODELO as SINGLELINEEDIT
	protect oDCSERIE as SINGLELINEEDIT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCCFOP as SINGLELINEEDIT
	protect oDCSITUACAO as SINGLELINEEDIT
	protect oDCITEM as SINGLELINEEDIT
	protect oDCCODIGORED as SINGLELINEEDIT
	protect oDCQTDE as SINGLELINEEDIT
	protect oDCVALORMER as SINGLELINEEDIT
	protect oDCDESCONTO as SINGLELINEEDIT
	protect oDCBASEICM as SINGLELINEEDIT
	protect oDCBASESUB as SINGLELINEEDIT
	protect oDCVALORIPI as SINGLELINEEDIT
	protect oDCICM as SINGLELINEEDIT
	protect oDCTIPOENT as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCTIPONF as SINGLELINEEDIT
	protect oDCTIPOCLI as SINGLELINEEDIT
	protect oDCFORNECEDO as SINGLELINEEDIT
	protect oDCUF as SINGLELINEEDIT
	protect oDCSUB as SINGLELINEEDIT
	protect oCCcmdcheckcgc as PUSHBUTTON
	protect oCCCmdTipo as PUSHBUTTON
	protect oCCCmdTipo1 as PUSHBUTTON
	protect oCCcmdcheckuf as PUSHBUTTON
	protect oCCcmdcheckES as PUSHBUTTON
	protect oCCcmdescmod as PUSHBUTTON
	protect oCCcmdcheckali as PUSHBUTTON
	protect oCCcmdchecmod as PUSHBUTTON
	protect oCCcmdescmod1 as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oCCpornum as PUSHBUTTON
// 	instance TIPO 
// 	instance CGC 
// 	instance MODELO 
// 	instance SERIE 
// 	instance NUMERO 
// 	instance CFOP 
// 	instance SITUACAO 
// 	instance ITEM 
// 	instance CODIGORED 
// 	instance QTDE 
// 	instance VALORMER 
// 	instance DESCONTO 
// 	instance BASEICM 
// 	instance BASESUB 
// 	instance VALORIPI 
// 	instance ICM 
// 	instance TIPOENT 
// 	instance CODIGO 
// 	instance TIPONF 
// 	instance TIPOCLI 
// 	instance FORNECEDO 
// 	instance UF 
// 	instance SUB 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access BASEICM() 
return self:FieldGet(#BASEICM)


assign BASEICM(uValue) 
self:FieldPut(#BASEICM, uValue)
return BASEICM := uValue


access BASESUB() 
return self:FieldGet(#BASESUB)


assign BASESUB(uValue) 
self:FieldPut(#BASESUB, uValue)
return BASESUB := uValue


METHOD buscanum( ) 
	SELF:KeyFind()

access CFOP() 
return self:FieldGet(#CFOP)


assign CFOP(uValue) 
self:FieldPut(#CFOP, uValue)
return CFOP := uValue


access CGC() 
return self:FieldGet(#CGC)


assign CGC(uValue) 
self:FieldPut(#CGC, uValue)
return CGC := uValue


METHOD cmdcheckali( ) 
	LOCAL nALI AS FLOAT	
nALI:=CHECKUFA(SELF:server:FIELDGET("UF"))
IF nALI=SELF:SERVER:FIELDGET("icm")
   alert("aliquota ok")	
   RETU .T.
ENDIF	
IF Empty(SELF:SERVER:FIELDGET("icm"))
   alert("aliquota Em Branco")
ELSE
   alert("aliquota <> Estado")	
ENDIF	


METHOD cmdcheckcgc( ) 
LOCAL cPESSOA AS STRING	
LOCAL cCGC AS STRING
cCGC:=AllTrim(TIRAOUT(SELF:SERVER:FIELDGET("CGC")))
cPESSOA:="J"
IF Len(CCGC)<12
   cPESSOA:="F"	
ENDIF	
IF cPESSOA="J"
   IF VALCGC(cCGC)
   	  alert("CGC OK")
   ENDIF	
ENDIF	
IF cPESSOA="F"
   IF Valcpf(CCGC)
   	  alert("CPF OK")
   ENDIF		
ENDIF			

METHOD cmdcheckES( ) 
LOCAL nCFO AS DWORD
LOCAL cTIPO AS STRING
cTIPO:=SELF:SERVER:FIELDGET("TIPONF")
nCFO:=Val(SELF:SERVER:FIELDGET("CFOP"))
IF nCFO<1000  //antigos
   IF nCFO<500
      IF cTIPO="E"
     	 alert("CFO Entrada OK")
      ENDIF
      IF cTIPO="S"
     	 alert("CFO Nao e de Entrada ")
      ENDIF
   ELSE
      IF cTIPO="S"
     	 alert("CFO Saida OK")
      ENDIF
      IF cTIPO="E"
     	 alert("CFO Nao e de Saida ")
      ENDIF
   ENDIF	
ELSE      //novos
  IF nCFO<5000
      IF cTIPO="E"
     	 alert("CFO Entrada OK")
      ENDIF
      IF cTIPO="S"
     	 alert("CFO Nao e de Entrada ")
      ENDIF
   ELSE
      IF cTIPO="S"
     	 alert("CFO Saida OK")
      ENDIF
      IF cTIPO="E"
     	 alert("CFO Nao e de Saida ")
      ENDIF
   ENDIF		
ENDIF	
		

METHOD cmdcheckuf( ) 
		ufCheck(SELF:server:FIELDGET("UF"))

METHOD cmdchecmod( ) 
	LOCAL nPOS AS DWORD
nPOS:=CHECKCODI(SELF:SErver:FIELDGET("SITUACAO"))
IF nPOS=0
   alert("Codigo ICM Invalido")	
ELSE
	alert(ACODin[Npos])
ENDIF	

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD cmdescmod( ) 
	LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"SINTDOC.DBF",Str(SELF:SERVER:FIELDGET("MODELO"),2)}
oESC:SHOW()	
IF OesC:lok
    SELF:SERVER:FIELDPUT("MODELO",Val(oESC:CODIGO))
ENDIF					

METHOD cmdescmod1( ) 
	LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"CST_ICMS.DBF",StrZero(SELF:SERVER:FIELDGET("situacao"),3)}
oESC:SHOW()	
IF OesC:lok
    SELF:SERVER:FIELDPUT("situacao",Val(oESC:CODIGO))
ENDIF					

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()	

METHOD CmdTipo( ) 
  SELF:server:FIELDPUT("TIPONF",SIMNAO(SELF:SERVER:FIELDGET("TIPONF"),{"E","S"}))

METHOD CmdTipo1( ) 
			SELF:server:FIELDPUT("TIPOCLI",SIMNAO(SELF:SERVER:FIELDGET("TIPOCLI"),{"C","F"}))
			

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODIGORED() 
return self:FieldGet(#CODIGORED)


assign CODIGORED(uValue) 
self:FieldPut(#CODIGORED, uValue)
return CODIGORED := uValue


access DESCONTO() 
return self:FieldGet(#DESCONTO)


assign DESCONTO(uValue) 
self:FieldPut(#DESCONTO, uValue)
return DESCONTO := uValue


access FORNECEDO() 
return self:FieldGet(#FORNECEDO)


assign FORNECEDO(uValue) 
self:FieldPut(#FORNECEDO, uValue)
return FORNECEDO := uValue


access ICM() 
return self:FieldGet(#ICM)


assign ICM(uValue) 
self:FieldPut(#ICM, uValue)
return ICM := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jreg54",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Times"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200,10}}

oDCSC_TIPO := FixedText{self,ResourceID{JREG54_SC_TIPO,_GetInst()}}
oDCSC_TIPO:HyperLabel := HyperLabel{#SC_TIPO,"Tipo:",NULL_STRING,NULL_STRING}

oDCSC_CGC := FixedText{self,ResourceID{JREG54_SC_CGC,_GetInst()}}
oDCSC_CGC:HyperLabel := HyperLabel{#SC_CGC,"Cgc:",NULL_STRING,NULL_STRING}

oDCSC_MODELO := FixedText{self,ResourceID{JREG54_SC_MODELO,_GetInst()}}
oDCSC_MODELO:HyperLabel := HyperLabel{#SC_MODELO,"Modelo:",NULL_STRING,NULL_STRING}

oDCSC_SERIE := FixedText{self,ResourceID{JREG54_SC_SERIE,_GetInst()}}
oDCSC_SERIE:HyperLabel := HyperLabel{#SC_SERIE,"Serie:",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JREG54_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_CFOP := FixedText{self,ResourceID{JREG54_SC_CFOP,_GetInst()}}
oDCSC_CFOP:HyperLabel := HyperLabel{#SC_CFOP,"Cfop:",NULL_STRING,NULL_STRING}

oDCSC_SITUACAO := FixedText{self,ResourceID{JREG54_SC_SITUACAO,_GetInst()}}
oDCSC_SITUACAO:HyperLabel := HyperLabel{#SC_SITUACAO,"CodIcm",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JREG54_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCSC_CODIGORED := FixedText{self,ResourceID{JREG54_SC_CODIGORED,_GetInst()}}
oDCSC_CODIGORED:HyperLabel := HyperLabel{#SC_CODIGORED,"Codigored:",NULL_STRING,NULL_STRING}

oDCSC_QTDE := FixedText{self,ResourceID{JREG54_SC_QTDE,_GetInst()}}
oDCSC_QTDE:HyperLabel := HyperLabel{#SC_QTDE,"Qtde:",NULL_STRING,NULL_STRING}

oDCSC_VALORMER := FixedText{self,ResourceID{JREG54_SC_VALORMER,_GetInst()}}
oDCSC_VALORMER:HyperLabel := HyperLabel{#SC_VALORMER,"Valor:",NULL_STRING,NULL_STRING}

oDCSC_DESCONTO := FixedText{self,ResourceID{JREG54_SC_DESCONTO,_GetInst()}}
oDCSC_DESCONTO:HyperLabel := HyperLabel{#SC_DESCONTO,"Desconto:",NULL_STRING,NULL_STRING}

oDCSC_BASEICM := FixedText{self,ResourceID{JREG54_SC_BASEICM,_GetInst()}}
oDCSC_BASEICM:HyperLabel := HyperLabel{#SC_BASEICM,"Base ICM:",NULL_STRING,NULL_STRING}

oDCSC_BASESUB := FixedText{self,ResourceID{JREG54_SC_BASESUB,_GetInst()}}
oDCSC_BASESUB:HyperLabel := HyperLabel{#SC_BASESUB,"Base Subs.",NULL_STRING,NULL_STRING}

oDCSC_VALORIPI := FixedText{self,ResourceID{JREG54_SC_VALORIPI,_GetInst()}}
oDCSC_VALORIPI:HyperLabel := HyperLabel{#SC_VALORIPI,"IPI",NULL_STRING,NULL_STRING}

oDCSC_ICM := FixedText{self,ResourceID{JREG54_SC_ICM,_GetInst()}}
oDCSC_ICM:HyperLabel := HyperLabel{#SC_ICM,"Icm",NULL_STRING,NULL_STRING}

oDCSC_TIPOENT := FixedText{self,ResourceID{JREG54_SC_TIPOENT,_GetInst()}}
oDCSC_TIPOENT:HyperLabel := HyperLabel{#SC_TIPOENT,"Tipo:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JREG54_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_TIPONF := FixedText{self,ResourceID{JREG54_SC_TIPONF,_GetInst()}}
oDCSC_TIPONF:HyperLabel := HyperLabel{#SC_TIPONF,"Tipo NF:",NULL_STRING,NULL_STRING}

oDCSC_TIPOCLI := FixedText{self,ResourceID{JREG54_SC_TIPOCLI,_GetInst()}}
oDCSC_TIPOCLI:HyperLabel := HyperLabel{#SC_TIPOCLI,"Tipocli:",NULL_STRING,NULL_STRING}

oDCSC_FORNECEDO := FixedText{self,ResourceID{JREG54_SC_FORNECEDO,_GetInst()}}
oDCSC_FORNECEDO:HyperLabel := HyperLabel{#SC_FORNECEDO,"Forn/Cliente",NULL_STRING,NULL_STRING}

oDCSC_UF := FixedText{self,ResourceID{JREG54_SC_UF,_GetInst()}}
oDCSC_UF:HyperLabel := HyperLabel{#SC_UF,"Uf:",NULL_STRING,NULL_STRING}

oDCSC_SUB := FixedText{self,ResourceID{JREG54_SC_SUB,_GetInst()}}
oDCSC_SUB:HyperLabel := HyperLabel{#SC_SUB,"Sub:",NULL_STRING,NULL_STRING}

oDCTIPO := SingleLineEdit{self,ResourceID{JREG54_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := PADRAO_CHAR_02{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo:",NULL_STRING,"SINT54_TIPO"}
oDCTIPO:BackGround := aBrushes[1]
oDCTIPO:Font(aFonts[1], FALSE)

oDCCGC := SingleLineEdit{self,ResourceID{JREG54_CGC,_GetInst()}}
oDCCGC:FieldSpec := padrao_char_18{}
oDCCGC:HyperLabel := HyperLabel{#CGC,"Cgc:",NULL_STRING,"SINT54_CGC"}

oDCMODELO := SingleLineEdit{self,ResourceID{JREG54_MODELO,_GetInst()}}
oDCMODELO:FieldSpec := padrao_num_02{}
oDCMODELO:HyperLabel := HyperLabel{#MODELO,"Modelo:",NULL_STRING,"SINT54_MODELO"}

oDCSERIE := SingleLineEdit{self,ResourceID{JREG54_SERIE,_GetInst()}}
oDCSERIE:FieldSpec := padrao_char_03{}
oDCSERIE:HyperLabel := HyperLabel{#SERIE,"Serie:",NULL_STRING,"SINT54_SERIE"}

oDCNUMERO := SingleLineEdit{self,ResourceID{JREG54_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"SINT54_NUMERO"}

oDCCFOP := SingleLineEdit{self,ResourceID{JREG54_CFOP,_GetInst()}}
oDCCFOP:FieldSpec := padrao_char_04{}
oDCCFOP:HyperLabel := HyperLabel{#CFOP,"Cfop:",NULL_STRING,"SINT54_CFOP"}

oDCSITUACAO := SingleLineEdit{self,ResourceID{JREG54_SITUACAO,_GetInst()}}
oDCSITUACAO:FieldSpec := padrao_num_03{}
oDCSITUACAO:HyperLabel := HyperLabel{#SITUACAO,"Situacao:",NULL_STRING,"SINT54_SITUACAO"}

oDCITEM := SingleLineEdit{self,ResourceID{JREG54_ITEM,_GetInst()}}
oDCITEM:FieldSpec := padrao_num_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"SINT54_ITEM"}

oDCCODIGORED := SingleLineEdit{self,ResourceID{JREG54_CODIGORED,_GetInst()}}
oDCCODIGORED:FieldSpec := padrao_char_14{}
oDCCODIGORED:HyperLabel := HyperLabel{#CODIGORED,"Codigored:",NULL_STRING,"SINT54_CODIGORED"}

oDCQTDE := SingleLineEdit{self,ResourceID{JREG54_QTDE,_GetInst()}}
oDCQTDE:FieldSpec := padrao_num_12_2{}
oDCQTDE:HyperLabel := HyperLabel{#QTDE,"Qtde:",NULL_STRING,"SINT54_QTDE"}

oDCVALORMER := SingleLineEdit{self,ResourceID{JREG54_VALORMER,_GetInst()}}
oDCVALORMER:FieldSpec := padrao_num_12_2{}
oDCVALORMER:HyperLabel := HyperLabel{#VALORMER,"Valormer:",NULL_STRING,"SINT54_VALORMER"}

oDCDESCONTO := SingleLineEdit{self,ResourceID{JREG54_DESCONTO,_GetInst()}}
oDCDESCONTO:FieldSpec := padrao_num_12_2{}
oDCDESCONTO:HyperLabel := HyperLabel{#DESCONTO,"Desconto:",NULL_STRING,"SINT54_DESCONTO"}

oDCBASEICM := SingleLineEdit{self,ResourceID{JREG54_BASEICM,_GetInst()}}
oDCBASEICM:FieldSpec := padrao_num_12_2{}
oDCBASEICM:HyperLabel := HyperLabel{#BASEICM,"Baseicm:",NULL_STRING,"SINT54_BASEICM"}

oDCBASESUB := SingleLineEdit{self,ResourceID{JREG54_BASESUB,_GetInst()}}
oDCBASESUB:FieldSpec := padrao_num_12_2{}
oDCBASESUB:HyperLabel := HyperLabel{#BASESUB,"Basesub:",NULL_STRING,"SINT54_BASESUB"}

oDCVALORIPI := SingleLineEdit{self,ResourceID{JREG54_VALORIPI,_GetInst()}}
oDCVALORIPI:FieldSpec := padrao_num_12_2{}
oDCVALORIPI:HyperLabel := HyperLabel{#VALORIPI,"Valoripi:",NULL_STRING,"SINT54_VALORIPI"}

oDCICM := SingleLineEdit{self,ResourceID{JREG54_ICM,_GetInst()}}
oDCICM:FieldSpec := padrao_num_05_2{}
oDCICM:HyperLabel := HyperLabel{#ICM,"Icm:",NULL_STRING,"SINT54_ICM"}

oDCTIPOENT := SingleLineEdit{self,ResourceID{JREG54_TIPOENT,_GetInst()}}
oDCTIPOENT:FieldSpec := padrao_char_01{}
oDCTIPOENT:HyperLabel := HyperLabel{#TIPOENT,"Tipoent:",NULL_STRING,"SINT54_TIPOENT"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JREG54_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"SINT54_CODIGO"}

oDCTIPONF := SingleLineEdit{self,ResourceID{JREG54_TIPONF,_GetInst()}}
oDCTIPONF:FieldSpec := padrao_char_01{}
oDCTIPONF:HyperLabel := HyperLabel{#TIPONF,"Tiponf:",NULL_STRING,"SINT54_TIPONF"}
oDCTIPONF:BackGround := aBrushes[1]
oDCTIPONF:Font(aFonts[1], FALSE)

oDCTIPOCLI := SingleLineEdit{self,ResourceID{JREG54_TIPOCLI,_GetInst()}}
oDCTIPOCLI:FieldSpec := padrao_char_01{}
oDCTIPOCLI:HyperLabel := HyperLabel{#TIPOCLI,"Tipocli:",NULL_STRING,"SINT54_TIPOCLI"}
oDCTIPOCLI:BackGround := aBrushes[1]
oDCTIPOCLI:Font(aFonts[2], FALSE)

oDCFORNECEDO := SingleLineEdit{self,ResourceID{JREG54_FORNECEDO,_GetInst()}}
oDCFORNECEDO:FieldSpec := padrao_num_08{}
oDCFORNECEDO:HyperLabel := HyperLabel{#FORNECEDO,"Fornecedo:",NULL_STRING,"SINT54_FORNECEDO"}

oDCUF := SingleLineEdit{self,ResourceID{JREG54_UF,_GetInst()}}
oDCUF:FieldSpec := uf_field{}
oDCUF:HyperLabel := HyperLabel{#UF,"Uf:",NULL_STRING,"SINT54_UF"}

oDCSUB := SingleLineEdit{self,ResourceID{JREG54_SUB,_GetInst()}}
oDCSUB:FieldSpec := padrao_char_02{}
oDCSUB:HyperLabel := HyperLabel{#SUB,"Sub:",NULL_STRING,"SINT54_SUB"}

oCCcmdcheckcgc := PushButton{self,ResourceID{JREG54_CMDCHECKCGC,_GetInst()}}
oCCcmdcheckcgc:HyperLabel := HyperLabel{#cmdcheckcgc,"Checar",NULL_STRING,NULL_STRING}

oCCCmdTipo := PushButton{self,ResourceID{JREG54_CMDTIPO,_GetInst()}}
oCCCmdTipo:HyperLabel := HyperLabel{#CmdTipo,"(E)ntrada (S)aida",NULL_STRING,NULL_STRING}
oCCCmdTipo:TooltipText := "Tipo Entrada/Saida"

oCCCmdTipo1 := PushButton{self,ResourceID{JREG54_CMDTIPO1,_GetInst()}}
oCCCmdTipo1:HyperLabel := HyperLabel{#CmdTipo1,"(C)liente (F)ornecedor",NULL_STRING,NULL_STRING}
oCCCmdTipo1:TooltipText := "Tipo Entrada/Saida"

oCCcmdcheckuf := PushButton{self,ResourceID{JREG54_CMDCHECKUF,_GetInst()}}
oCCcmdcheckuf:HyperLabel := HyperLabel{#cmdcheckuf,"Checar",NULL_STRING,NULL_STRING}

oCCcmdcheckES := PushButton{self,ResourceID{JREG54_CMDCHECKES,_GetInst()}}
oCCcmdcheckES:HyperLabel := HyperLabel{#cmdcheckES,"Checar",NULL_STRING,NULL_STRING}

oCCcmdescmod := PushButton{self,ResourceID{JREG54_CMDESCMOD,_GetInst()}}
oCCcmdescmod:HyperLabel := HyperLabel{#cmdescmod,"..",NULL_STRING,NULL_STRING}

oCCcmdcheckali := PushButton{self,ResourceID{JREG54_CMDCHECKALI,_GetInst()}}
oCCcmdcheckali:HyperLabel := HyperLabel{#cmdcheckali,"Checar",NULL_STRING,NULL_STRING}

oCCcmdchecmod := PushButton{self,ResourceID{JREG54_CMDCHECMOD,_GetInst()}}
oCCcmdchecmod:HyperLabel := HyperLabel{#cmdchecmod,"Checar",NULL_STRING,NULL_STRING}

oCCcmdescmod1 := PushButton{self,ResourceID{JREG54_CMDESCMOD1,_GetInst()}}
oCCcmdescmod1:HyperLabel := HyperLabel{#cmdescmod1,"..",NULL_STRING,NULL_STRING}

oCCbuscanum := PushButton{self,ResourceID{JREG54_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Clique Para Localizar Por Numero"

oCCpornum := PushButton{self,ResourceID{JREG54_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

self:Caption := "Registro 54"
self:HyperLabel := HyperLabel{#jreg54,"Registro 54",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTIPO := DataColumn{PADRAO_CHAR_02{}}
oDBTIPO:Width := 6
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "Tipo:"
oDBTIPO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTIPO)

oDBCGC := DataColumn{padrao_char_18{}}
oDBCGC:Width := 5
oDBCGC:HyperLabel := oDCCGC:HyperLabel 
oDBCGC:Caption := "Cgc:"
self:Browser:AddColumn(oDBCGC)

oDBMODELO := DataColumn{padrao_num_02{}}
oDBMODELO:Width := 8
oDBMODELO:HyperLabel := oDCMODELO:HyperLabel 
oDBMODELO:Caption := "Modelo:"
self:Browser:AddColumn(oDBMODELO)

oDBSERIE := DataColumn{padrao_char_03{}}
oDBSERIE:Width := 7
oDBSERIE:HyperLabel := oDCSERIE:HyperLabel 
oDBSERIE:Caption := "Serie:"
self:Browser:AddColumn(oDBSERIE)

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBCFOP := DataColumn{padrao_char_04{}}
oDBCFOP:Width := 6
oDBCFOP:HyperLabel := oDCCFOP:HyperLabel 
oDBCFOP:Caption := "Cfop:"
self:Browser:AddColumn(oDBCFOP)

oDBSITUACAO := DataColumn{padrao_num_03{}}
oDBSITUACAO:Width := 10
oDBSITUACAO:HyperLabel := oDCSITUACAO:HyperLabel 
oDBSITUACAO:Caption := "Situacao:"
self:Browser:AddColumn(oDBSITUACAO)

oDBITEM := DataColumn{padrao_num_03{}}
oDBITEM:Width := 6
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
self:Browser:AddColumn(oDBITEM)

oDBCODIGORED := DataColumn{padrao_char_14{}}
oDBCODIGORED:Width := 11
oDBCODIGORED:HyperLabel := oDCCODIGORED:HyperLabel 
oDBCODIGORED:Caption := "Codigored:"
self:Browser:AddColumn(oDBCODIGORED)

oDBQTDE := DataColumn{padrao_num_12_2{}}
oDBQTDE:Width := 6
oDBQTDE:HyperLabel := oDCQTDE:HyperLabel 
oDBQTDE:Caption := "Qtde:"
self:Browser:AddColumn(oDBQTDE)

oDBVALORMER := DataColumn{padrao_num_12_2{}}
oDBVALORMER:Width := 10
oDBVALORMER:HyperLabel := oDCVALORMER:HyperLabel 
oDBVALORMER:Caption := "Valormer:"
self:Browser:AddColumn(oDBVALORMER)

oDBDESCONTO := DataColumn{padrao_num_12_2{}}
oDBDESCONTO:Width := 10
oDBDESCONTO:HyperLabel := oDCDESCONTO:HyperLabel 
oDBDESCONTO:Caption := "Desconto:"
self:Browser:AddColumn(oDBDESCONTO)

oDBBASEICM := DataColumn{padrao_num_12_2{}}
oDBBASEICM:Width := 9
oDBBASEICM:HyperLabel := oDCBASEICM:HyperLabel 
oDBBASEICM:Caption := "Baseicm:"
self:Browser:AddColumn(oDBBASEICM)

oDBBASESUB := DataColumn{padrao_num_12_2{}}
oDBBASESUB:Width := 9
oDBBASESUB:HyperLabel := oDCBASESUB:HyperLabel 
oDBBASESUB:Caption := "Basesub:"
self:Browser:AddColumn(oDBBASESUB)

oDBVALORIPI := DataColumn{padrao_num_12_2{}}
oDBVALORIPI:Width := 10
oDBVALORIPI:HyperLabel := oDCVALORIPI:HyperLabel 
oDBVALORIPI:Caption := "Valoripi:"
self:Browser:AddColumn(oDBVALORIPI)

oDBICM := DataColumn{padrao_num_05_2{}}
oDBICM:Width := 5
oDBICM:HyperLabel := oDCICM:HyperLabel 
oDBICM:Caption := "Icm:"
self:Browser:AddColumn(oDBICM)

oDBTIPOENT := DataColumn{padrao_char_01{}}
oDBTIPOENT:Width := 9
oDBTIPOENT:HyperLabel := oDCTIPOENT:HyperLabel 
oDBTIPOENT:Caption := "Tipoent:"
self:Browser:AddColumn(oDBTIPOENT)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBTIPONF := DataColumn{padrao_char_01{}}
oDBTIPONF:Width := 8
oDBTIPONF:HyperLabel := oDCTIPONF:HyperLabel 
oDBTIPONF:Caption := "Tiponf:"
oDBTIPONF:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTIPONF)

oDBTIPOCLI := DataColumn{padrao_char_01{}}
oDBTIPOCLI:Width := 9
oDBTIPOCLI:HyperLabel := oDCTIPOCLI:HyperLabel 
oDBTIPOCLI:Caption := "Tipocli:"
oDBTIPOCLI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTIPOCLI)

oDBFORNECEDO := DataColumn{padrao_num_08{}}
oDBFORNECEDO:Width := 11
oDBFORNECEDO:HyperLabel := oDCFORNECEDO:HyperLabel 
oDBFORNECEDO:Caption := "Fornecedo:"
self:Browser:AddColumn(oDBFORNECEDO)

oDBUF := DataColumn{uf_field{}}
oDBUF:Width := 4
oDBUF:HyperLabel := oDCUF:HyperLabel 
oDBUF:Caption := "Uf:"
self:Browser:AddColumn(oDBUF)

oDBSUB := DataColumn{padrao_char_02{}}
oDBSUB:Width := 5
oDBSUB:HyperLabel := oDCSUB:HyperLabel 
oDBSUB:Caption := "Sub:"
self:Browser:AddColumn(oDBSUB)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access MODELO() 
return self:FieldGet(#MODELO)


assign MODELO(uValue) 
self:FieldPut(#MODELO, uValue)
return MODELO := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


METHOD pornum( ) 
	SELF:KeyFind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   FabCenterWindow( SELF )
 RETURN SELF

access QTDE() 
return self:FieldGet(#QTDE)


assign QTDE(uValue) 
self:FieldPut(#QTDE, uValue)
return QTDE := uValue


access SERIE() 
return self:FieldGet(#SERIE)


assign SERIE(uValue) 
self:FieldPut(#SERIE, uValue)
return SERIE := uValue


access SITUACAO() 
return self:FieldGet(#SITUACAO)


assign SITUACAO(uValue) 
self:FieldPut(#SITUACAO, uValue)
return SITUACAO := uValue


access SUB() 
return self:FieldGet(#SUB)


assign SUB(uValue) 
self:FieldPut(#SUB, uValue)
return SUB := uValue


METHOD Timer() 
   SELF:SERVER:COMMIT()			

access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


access TIPOCLI() 
return self:FieldGet(#TIPOCLI)


assign TIPOCLI(uValue) 
self:FieldPut(#TIPOCLI, uValue)
return TIPOCLI := uValue


access TIPOENT() 
return self:FieldGet(#TIPOENT)


assign TIPOENT(uValue) 
self:FieldPut(#TIPOENT, uValue)
return TIPOENT := uValue


access TIPONF() 
return self:FieldGet(#TIPONF)


assign TIPONF(uValue) 
self:FieldPut(#TIPONF, uValue)
return TIPONF := uValue


access UF() 
return self:FieldGet(#UF)


assign UF(uValue) 
self:FieldPut(#UF, uValue)
return UF := uValue


access VALORIPI() 
return self:FieldGet(#VALORIPI)


assign VALORIPI(uValue) 
self:FieldPut(#VALORIPI, uValue)
return VALORIPI := uValue


access VALORMER() 
return self:FieldGet(#VALORMER)


assign VALORMER(uValue) 
self:FieldPut(#VALORMER, uValue)
return VALORMER := uValue


END CLASS
