#region DEFINES
STATIC DEFINE JREG50_ALIQUOTA := 133 
STATIC DEFINE JREG50_ANTECIPA := 154 
STATIC DEFINE JREG50_BASE := 129 
STATIC DEFINE JREG50_BUSCANUM := 139 
STATIC DEFINE JREG50_CFOP := 127 
STATIC DEFINE JREG50_CGC := 119 
STATIC DEFINE JREG50_CMDANTECIPA := 153 
STATIC DEFINE JREG50_CMDCHECKALI := 161 
STATIC DEFINE JREG50_CMDCHECKCGC := 137 
STATIC DEFINE JREG50_CMDCHECKES := 147 
STATIC DEFINE JREG50_CMDCHECKIE := 136 
STATIC DEFINE JREG50_CMDCHECKTOT := 151 
STATIC DEFINE JREG50_CMDCHECKUF := 144 
STATIC DEFINE JREG50_CMDCHECMOD := 146 
STATIC DEFINE JREG50_CMDCHEKVAL := 152 
STATIC DEFINE JREG50_CMDEMITNETE := 148 
STATIC DEFINE JREG50_CMDESCMOD := 145 
STATIC DEFINE JREG50_CMDFRETE := 158 
STATIC DEFINE JREG50_CMDSITU := 141 
STATIC DEFINE JREG50_CMDTIPO := 140 
STATIC DEFINE JREG50_DATA := 121 
STATIC DEFINE JREG50_DESPESAS := 157 
STATIC DEFINE JREG50_EMITENTE := 149 
STATIC DEFINE JREG50_FRETE := 159 
STATIC DEFINE JREG50_IE := 120 
STATIC DEFINE JREG50_ISENTA := 131 
STATIC DEFINE JREG50_MODELO := 123 
STATIC DEFINE JREG50_NUMERO := 126 
STATIC DEFINE JREG50_OBS := 142 
STATIC DEFINE JREG50_OUTRAS := 132 
STATIC DEFINE JREG50_PORNUM := 138 
STATIC DEFINE JREG50_SC_ALIQUOTA := 115 
STATIC DEFINE JREG50_SC_BASE := 111 
STATIC DEFINE JREG50_SC_CFOP := 109 
STATIC DEFINE JREG50_SC_CGC := 101 
STATIC DEFINE JREG50_SC_DATA := 103 
STATIC DEFINE JREG50_SC_IE := 102 
STATIC DEFINE JREG50_SC_ISENTA := 113 
STATIC DEFINE JREG50_SC_MODELO := 105 
STATIC DEFINE JREG50_SC_NUMERO := 108 
STATIC DEFINE JREG50_SC_OUTRAS := 114 
STATIC DEFINE JREG50_SC_OUTRAS1 := 143 
STATIC DEFINE JREG50_SC_OUTRAS2 := 156 
STATIC DEFINE JREG50_SC_SERIE := 106 
STATIC DEFINE JREG50_SC_SITUACAO := 116 
STATIC DEFINE JREG50_SC_SUB := 107 
STATIC DEFINE JREG50_SC_TIPO := 100 
STATIC DEFINE JREG50_SC_TIPONF := 117 
STATIC DEFINE JREG50_SC_TIPONF1 := 150 
STATIC DEFINE JREG50_SC_TIPONF2 := 155 
STATIC DEFINE JREG50_SC_TIPONF3 := 160 
STATIC DEFINE JREG50_SC_UF := 104 
STATIC DEFINE JREG50_SC_VALOR := 112 
STATIC DEFINE JREG50_SC_VALORTOT := 110 
STATIC DEFINE JREG50_SERIE := 124 
STATIC DEFINE JREG50_SITUACAO := 134 
STATIC DEFINE JREG50_SUB := 125 
STATIC DEFINE JREG50_TIPO := 118 
STATIC DEFINE JREG50_TIPONF := 135 
STATIC DEFINE JREG50_UF := 122 
STATIC DEFINE JREG50_VALOR := 130 
STATIC DEFINE JREG50_VALORTOT := 128 
#endregion

CLASS JReg50 INHERIT MYDataWindow 

	PROTECT oDBCGC AS DataColumn
	PROTECT oDBIE AS DataColumn
	PROTECT oDBDATA AS DataColumn
	PROTECT oDBNUMERO AS DataColumn
	PROTECT oDBCFOP AS DataColumn
	PROTECT oDBVALORTOT AS DataColumn
	PROTECT oDBBASE AS DataColumn
	PROTECT oDBVALOR AS DataColumn
	PROTECT oDBISENTA AS DataColumn
	PROTECT oDBOUTRAS AS DataColumn
	PROTECT oDCSC_TIPO AS FIXEDTEXT
	PROTECT oDCSC_CGC AS FIXEDTEXT
	PROTECT oDCSC_IE AS FIXEDTEXT
	PROTECT oDCSC_DATA AS FIXEDTEXT
	PROTECT oDCSC_UF AS FIXEDTEXT
	PROTECT oDCSC_MODELO AS FIXEDTEXT
	PROTECT oDCSC_SERIE AS FIXEDTEXT
	PROTECT oDCSC_SUB AS FIXEDTEXT
	PROTECT oDCSC_NUMERO AS FIXEDTEXT
	PROTECT oDCSC_CFOP AS FIXEDTEXT
	PROTECT oDCSC_VALORTOT AS FIXEDTEXT
	PROTECT oDCSC_BASE AS FIXEDTEXT
	PROTECT oDCSC_VALOR AS FIXEDTEXT
	PROTECT oDCSC_ISENTA AS FIXEDTEXT
	PROTECT oDCSC_OUTRAS AS FIXEDTEXT
	PROTECT oDCSC_ALIQUOTA AS FIXEDTEXT
	PROTECT oDCSC_SITUACAO AS FIXEDTEXT
	PROTECT oDCSC_TIPONF AS FIXEDTEXT
	PROTECT oDCTIPO AS SINGLELINEEDIT
	PROTECT oDCCGC AS SINGLELINEEDIT
	PROTECT oDCIE AS SINGLELINEEDIT
	PROTECT oDCDATA AS DATESLE
	PROTECT oDCUF AS SINGLELINEEDIT
	PROTECT oDCMODELO AS SINGLELINEEDIT
	PROTECT oDCSERIE AS SINGLELINEEDIT
	PROTECT oDCSUB AS SINGLELINEEDIT
	PROTECT oDCNUMERO AS RIGHTSLE
	PROTECT oDCCFOP AS SINGLELINEEDIT
	PROTECT oDCVALORTOT AS SINGLELINEEDIT
	PROTECT oDCBASE AS SINGLELINEEDIT
	PROTECT oDCVALOR AS SINGLELINEEDIT
	PROTECT oDCISENTA AS SINGLELINEEDIT
	PROTECT oDCOUTRAS AS SINGLELINEEDIT
	PROTECT oDCALIQUOTA AS SINGLELINEEDIT
	PROTECT oDCSITUACAO AS SINGLELINEEDIT
	PROTECT oDCTIPONF AS SINGLELINEEDIT
	PROTECT oCCcmdcheckie AS PUSHBUTTON
	PROTECT oCCcmdcheckcgc AS PUSHBUTTON
	PROTECT oCCpornum AS PUSHBUTTON
	PROTECT oCCbuscanum AS PUSHBUTTON
	PROTECT oCCCmdTipo AS PUSHBUTTON
	PROTECT oCCcmdsitu AS PUSHBUTTON
	PROTECT oDCobs AS SINGLELINEEDIT
	PROTECT oDCSC_OUTRAS1 AS FIXEDTEXT
	PROTECT oCCcmdcheckuf AS PUSHBUTTON
	PROTECT oCCcmdescmod AS PUSHBUTTON
	PROTECT oCCcmdchecmod AS PUSHBUTTON
	PROTECT oCCcmdcheckES AS PUSHBUTTON
	PROTECT oCCCmdemitnete AS PUSHBUTTON
	PROTECT oDCemitente AS SINGLELINEEDIT
	PROTECT oDCSC_TIPONF1 AS FIXEDTEXT
	PROTECT oCCcmdchecktot AS PUSHBUTTON
	PROTECT oCCcmdchekval AS PUSHBUTTON
	PROTECT oCCcmdantecipa AS PUSHBUTTON
	PROTECT oDCANTECIPA AS SINGLELINEEDIT
	PROTECT oDCSC_TIPONF2 AS FIXEDTEXT
	PROTECT oDCSC_OUTRAS2 AS FIXEDTEXT
	PROTECT oDCdespesas AS SINGLELINEEDIT
	PROTECT oCCCmdfrete AS PUSHBUTTON
	PROTECT oDCfrete AS SINGLELINEEDIT
	PROTECT oDCSC_TIPONF3 AS FIXEDTEXT
	PROTECT oCCcmdcheckali AS PUSHBUTTON
// 	instance TIPO 
// 	instance CGC 
// 	instance IE 
// 	instance DATA 
// 	instance UF 
// 	instance MODELO 
// 	instance SERIE 
// 	instance SUB 
// 	instance NUMERO 
// 	instance CFOP 
// 	instance VALORTOT 
// 	instance BASE 
// 	instance VALOR 
// 	instance ISENTA 
// 	instance OUTRAS 
// 	instance ALIQUOTA 
// 	instance SITUACAO 
// 	instance TIPONF 
// 	instance obs 
// 	instance emitente 
// 	instance ANTECIPA 
// 	instance despesas 
// 	instance frete 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

ACCESS ALIQUOTA() 
RETURN SELF:FieldGet(#ALIQUOTA)


ASSIGN ALIQUOTA(uValue) 
SELF:FieldPut(#ALIQUOTA, uValue)
RETURN ALIQUOTA := uValue


ACCESS ANTECIPA() 
RETURN SELF:FieldGet(#ANTECIPA)


ASSIGN ANTECIPA(uValue) 
SELF:FieldPut(#ANTECIPA, uValue)
RETURN ANTECIPA := uValue


ACCESS BASE() 
RETURN SELF:FieldGet(#BASE)


ASSIGN BASE(uValue) 
SELF:FieldPut(#BASE, uValue)
RETURN BASE := uValue


METHOD buscanum( ) 
	SELF:keyfind()

ACCESS CFOP() 
RETURN SELF:FieldGet(#CFOP)


ASSIGN CFOP(uValue) 
SELF:FieldPut(#CFOP, uValue)
RETURN CFOP := uValue


ACCESS CGC() 
RETURN SELF:FieldGet(#CGC)


ASSIGN CGC(uValue) 
SELF:FieldPut(#CGC, uValue)
RETURN CGC := uValue


METHOD cmdantecipa( ) 
LOCAL cUSO AS STRING	
	SELF:server:FIELDPUT("antecipa",SIMNAO(SELF:SERVER:FIELDGET("antecipa"),{" ","1","2","3","4","5","6"}))
cUSO:=	SELF:SERVER:FIELDGET("antecipa")
DO CASE
	CASE cUSO=" "
		alert("Substituição Tributária informada pelo substituto ou pelo substituído ")
	CASE cUSO="1"
		alert("1 Pagamento de substituição efetuada pelo destinatário, quando não efetuada ou efetuada a menor pelo substituto ")
	CASE cUSO="2"
		alert("2 Antecipação tributária efetuada pelo destinatário apenas com complementação DO diferencial de aliquota ")
	CASE cUSO="3"
		alert("3 Antecipação tributária com MVA (Margem de Valor Agregado), efetuada pelo destinatário sem encerrar a fase de tributação ")
	CASE cUSO="4"
		alert("4 Antecipação tributária com MVA (Margem de Valor Agregado), efetuada pelo destinatário encerrando a fase de tributação ")
	CASE cUSO="5"	
		alert("Substituição tributária interna motivada por regime especial de tributação")
	CASE cUSO="6"
		alert("ICMS pago na importação")		
ENDCASE	


METHOD cmdcheckali( ) 
LOCAL nALI AS FLOAT	
nALI:=CHECKUFA(SELF:server:FIELDGET("UF"))
IF nALI=SELF:SERVER:FIELDGET("ALIQUOTA")
   alert("aliquota ok")	
   RETU .T.
ENDIF	
IF Empty(SELF:SERVER:FIELDGET("ALIQUOTA"))
   alert("aliquota Em Branco")
   IF SELF:SERVER:FIELDGET("VALOR")>0
      alert("aliquota 0 com valor")
   ENDIF	
   SELF:cmdchecktot()
ELSE
   alert("aliquota <> Estado")	
    SELF:cmdchecktot()
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
	

METHOD cmdcheckie( ) 
LOCAL cPESSOA AS STRING	
LOCAL cCGC AS STRING
cCGC:=AllTrim(TIRAOUT(SELF:SERVER:FIELDGET("CGC")))
cPESSOA:="J"
IF Len(CCGC)<12
   cPESSOA:="F"	
ENDIF	
IF cPESSOA="J"
   IF ValIE(SELF:SERVER:FIELDGET("UF"),SELF:SERVER:FIELDGET("IE"))      
   	 NOP
   ELSE   
   	 NOP
   ENDIF	
   IF ! checkieuf(SELF:SERVER:FIELDGET("IE"),SELF:SERVER:FIELDGET("UF"))
   	  alert("IE Nao encontrada cadastro de referencia do estado"  )
   ENDIF
ENDIF	
IF cPESSOA="F"
   IF CheckRG(SELF:SERVER:FIELDGET("IE"))
   	  alert("RG OK")
   ENDIF		
ENDIF	

		

METHOD cmdchecktot( ) 
LOCAL nTOT AS FLOAT
   nTOT:=SELF:SERVER:FIELDGET("BASE")	
   nTOT:=nTOT+SELF:SERVER:FIELDGET("VALOR")	
   nTOT:=nTOT+SELF:SERVER:FIELDGET("ISENTA")	
   nTOT:=nTOT+SELF:SERVER:FIELDGET("OUTRAS")	
   nTOT:=nTOT+SELF:SERVER:FIELDGET("OBS")	
   IF nTOT<>SELF:SERVER:FIELDGET("VALORTOT")
     alert("Total <> Base+valor+isenta+outras+obs")
   ENDIF	




METHOD cmdcheckuf( ) 
	ufCheck(SELF:server:FIELDGET("UF"))

METHOD cmdchecmod( ) 
	checkmod("50",SELF:SERVER:FIELDGET("MODELO"))

METHOD cmdchekval( ) 
LOCAL nVALOR AS FLOAT
nVALOR:=Round(SELF:SERVER:FIELDGET("BASE")*SELF:SERVER:FIELDGET("ALIQUOTA")/100,2)	
IF nVALOR<>SELF:SERVER:FIELDGET("VALOR")
	alert("Base * Aliquota <> Valor")
ENDIF	

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD Cmdemitnete( ) 
			SELF:server:FIELDPUT("emitente",SIMNAO(SELF:SERVER:FIELDGET("emitente"),{"P","T"}))

METHOD cmdescmod( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"SINTDOC.DBF",Str(SELF:SERVER:FIELDGET("MODELO"),2)}
oESC:SHOW()	
IF OesC:lok
    SELF:SERVER:FIELDPUT("MODELO",Val(oESC:CODIGO))
ENDIF					

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()	

METHOD Cmdfrete( ) 
	SELF:server:FIELDPUT("frete",SIMNAO(SELF:SERVER:FIELDGET("frete"),{"1","2","0"}))

METHOD cmdsitu( ) 
			SELF:server:FIELDPUT("SITUACAO",SIMNAO(SELF:SERVER:FIELDGET("SITUACAO"),{"N","S","E","X"}))

METHOD CmdTipo( ) 
		SELF:server:FIELDPUT("TIPONF",SIMNAO(SELF:SERVER:FIELDGET("TIPONF"),{"E","S"}))

ACCESS DATA() 
RETURN SELF:FieldGet(#DATA)


ASSIGN DATA(uValue) 
SELF:FieldPut(#DATA, uValue)
RETURN DATA := uValue


ACCESS despesas() 
RETURN SELF:FieldGet(#despesas)


ASSIGN despesas(uValue) 
SELF:FieldPut(#despesas, uValue)
RETURN despesas := uValue


ACCESS emitente() 
RETURN SELF:FieldGet(#emitente)


ASSIGN emitente(uValue) 
SELF:FieldPut(#emitente, uValue)
RETURN emitente := uValue


ACCESS frete() 
RETURN SELF:FieldGet(#frete)


ASSIGN frete(uValue) 
SELF:FieldPut(#frete, uValue)
RETURN frete := uValue


ACCESS IE() 
RETURN SELF:FieldGet(#IE)


ASSIGN IE(uValue) 
SELF:FieldPut(#IE, uValue)
RETURN IE := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
LOCAL DIM aFonts[1] AS OBJECT
LOCAL DIM aBrushes[1] AS OBJECT

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JReg50",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200,10}}

oDCSC_TIPO := FixedText{SELF,ResourceID{JREG50_SC_TIPO,_GetInst()}}
oDCSC_TIPO:HyperLabel := HyperLabel{#SC_TIPO,"Tipo:",NULL_STRING,NULL_STRING}

oDCSC_CGC := FixedText{SELF,ResourceID{JREG50_SC_CGC,_GetInst()}}
oDCSC_CGC:HyperLabel := HyperLabel{#SC_CGC,"CGC/CPF",NULL_STRING,NULL_STRING}

oDCSC_IE := FixedText{SELF,ResourceID{JREG50_SC_IE,_GetInst()}}
oDCSC_IE:HyperLabel := HyperLabel{#SC_IE,"IE/RG",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{SELF,ResourceID{JREG50_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_UF := FixedText{SELF,ResourceID{JREG50_SC_UF,_GetInst()}}
oDCSC_UF:HyperLabel := HyperLabel{#SC_UF,"Uf:",NULL_STRING,NULL_STRING}

oDCSC_MODELO := FixedText{SELF,ResourceID{JREG50_SC_MODELO,_GetInst()}}
oDCSC_MODELO:HyperLabel := HyperLabel{#SC_MODELO,"Modelo:",NULL_STRING,NULL_STRING}

oDCSC_SERIE := FixedText{SELF,ResourceID{JREG50_SC_SERIE,_GetInst()}}
oDCSC_SERIE:HyperLabel := HyperLabel{#SC_SERIE,"Serie:",NULL_STRING,NULL_STRING}

oDCSC_SUB := FixedText{SELF,ResourceID{JREG50_SC_SUB,_GetInst()}}
oDCSC_SUB:HyperLabel := HyperLabel{#SC_SUB,"Sub:",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{SELF,ResourceID{JREG50_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_CFOP := FixedText{SELF,ResourceID{JREG50_SC_CFOP,_GetInst()}}
oDCSC_CFOP:HyperLabel := HyperLabel{#SC_CFOP,"Cfop:",NULL_STRING,NULL_STRING}

oDCSC_VALORTOT := FixedText{SELF,ResourceID{JREG50_SC_VALORTOT,_GetInst()}}
oDCSC_VALORTOT:HyperLabel := HyperLabel{#SC_VALORTOT,"Total",NULL_STRING,NULL_STRING}

oDCSC_BASE := FixedText{SELF,ResourceID{JREG50_SC_BASE,_GetInst()}}
oDCSC_BASE:HyperLabel := HyperLabel{#SC_BASE,"Base:",NULL_STRING,NULL_STRING}

oDCSC_VALOR := FixedText{SELF,ResourceID{JREG50_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor:",NULL_STRING,NULL_STRING}

oDCSC_ISENTA := FixedText{SELF,ResourceID{JREG50_SC_ISENTA,_GetInst()}}
oDCSC_ISENTA:HyperLabel := HyperLabel{#SC_ISENTA,"Isenta:",NULL_STRING,NULL_STRING}

oDCSC_OUTRAS := FixedText{SELF,ResourceID{JREG50_SC_OUTRAS,_GetInst()}}
oDCSC_OUTRAS:HyperLabel := HyperLabel{#SC_OUTRAS,"Outras:",NULL_STRING,NULL_STRING}

oDCSC_ALIQUOTA := FixedText{SELF,ResourceID{JREG50_SC_ALIQUOTA,_GetInst()}}
oDCSC_ALIQUOTA:HyperLabel := HyperLabel{#SC_ALIQUOTA,"%",NULL_STRING,NULL_STRING}

oDCSC_SITUACAO := FixedText{SELF,ResourceID{JREG50_SC_SITUACAO,_GetInst()}}
oDCSC_SITUACAO:HyperLabel := HyperLabel{#SC_SITUACAO,"Situacao:",NULL_STRING,NULL_STRING}

oDCSC_TIPONF := FixedText{SELF,ResourceID{JREG50_SC_TIPONF,_GetInst()}}
oDCSC_TIPONF:HyperLabel := HyperLabel{#SC_TIPONF,"Tipo NF",NULL_STRING,NULL_STRING}

oDCTIPO := SingleLineEdit{SELF,ResourceID{JREG50_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := PADRAO_CHAR_02{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo:",NULL_STRING,"sint50_TIPO"}
oDCTIPO:BackGround := aBrushes[1]
oDCTIPO:Font(aFonts[1], FALSE)

oDCCGC := SingleLineEdit{SELF,ResourceID{JREG50_CGC,_GetInst()}}
oDCCGC:FieldSpec := PADRAO_CHAR_18{}
oDCCGC:HyperLabel := HyperLabel{#CGC,"Cgc:",NULL_STRING,"sint50_CGC"}

oDCIE := SingleLineEdit{SELF,ResourceID{JREG50_IE,_GetInst()}}
oDCIE:FieldSpec := PADRAO_CHAR_20{}
oDCIE:HyperLabel := HyperLabel{#IE,"Ie:",NULL_STRING,"sint50_IE"}

oDCDATA := DateSle{SELF,ResourceID{JREG50_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"sint50_DATA"}

oDCUF := SingleLineEdit{SELF,ResourceID{JREG50_UF,_GetInst()}}
oDCUF:FieldSpec := uf_field{}
oDCUF:HyperLabel := HyperLabel{#UF,"Uf:",NULL_STRING,"sint50_UF"}

oDCMODELO := SingleLineEdit{SELF,ResourceID{JREG50_MODELO,_GetInst()}}
oDCMODELO:FieldSpec := padrao_num_02{}
oDCMODELO:HyperLabel := HyperLabel{#MODELO,"Modelo:",NULL_STRING,"sint50_MODELO"}

oDCSERIE := SingleLineEdit{SELF,ResourceID{JREG50_SERIE,_GetInst()}}
oDCSERIE:FieldSpec := padrao_char_03{}
oDCSERIE:HyperLabel := HyperLabel{#SERIE,"Serie:",NULL_STRING,"sint50_SERIE"}

oDCSUB := SingleLineEdit{SELF,ResourceID{JREG50_SUB,_GetInst()}}
oDCSUB:FieldSpec := padrao_char_02{}
oDCSUB:HyperLabel := HyperLabel{#SUB,"Sub:",NULL_STRING,"sint50_SUB"}

oDCNUMERO := rightSle{SELF,ResourceID{JREG50_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"sint50_NUMERO"}

oDCCFOP := SingleLineEdit{SELF,ResourceID{JREG50_CFOP,_GetInst()}}
oDCCFOP:FieldSpec := padrao_char_04{}
oDCCFOP:HyperLabel := HyperLabel{#CFOP,"Cfop:",NULL_STRING,"sint50_CFOP"}

oDCVALORTOT := SingleLineEdit{SELF,ResourceID{JREG50_VALORTOT,_GetInst()}}
oDCVALORTOT:FieldSpec := padrao_num_10_2{}
oDCVALORTOT:HyperLabel := HyperLabel{#VALORTOT,"Valortot:",NULL_STRING,"sint50_VALORTOT"}

oDCBASE := SingleLineEdit{SELF,ResourceID{JREG50_BASE,_GetInst()}}
oDCBASE:FieldSpec := padrao_num_10_2{}
oDCBASE:HyperLabel := HyperLabel{#BASE,"Base:",NULL_STRING,"sint50_BASE"}

oDCVALOR := SingleLineEdit{SELF,ResourceID{JREG50_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := padrao_num_10_2{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Valor:",NULL_STRING,"sint50_VALOR"}

oDCISENTA := SingleLineEdit{SELF,ResourceID{JREG50_ISENTA,_GetInst()}}
oDCISENTA:FieldSpec := padrao_num_10_2{}
oDCISENTA:HyperLabel := HyperLabel{#ISENTA,"Isenta:",NULL_STRING,"sint50_ISENTA"}

oDCOUTRAS := SingleLineEdit{SELF,ResourceID{JREG50_OUTRAS,_GetInst()}}
oDCOUTRAS:FieldSpec := padrao_num_10_2{}
oDCOUTRAS:HyperLabel := HyperLabel{#OUTRAS,"Outras:",NULL_STRING,"sint50_OUTRAS"}

oDCALIQUOTA := SingleLineEdit{SELF,ResourceID{JREG50_ALIQUOTA,_GetInst()}}
oDCALIQUOTA:FieldSpec := padrao_num_05_2{}
oDCALIQUOTA:HyperLabel := HyperLabel{#ALIQUOTA,"Aliquota:",NULL_STRING,"sint50_ALIQUOTA"}

oDCSITUACAO := SingleLineEdit{SELF,ResourceID{JREG50_SITUACAO,_GetInst()}}
oDCSITUACAO:FieldSpec := padrao_char_01{}
oDCSITUACAO:HyperLabel := HyperLabel{#SITUACAO,"Situacao:",NULL_STRING,"sint50_SITUACAO"}
oDCSITUACAO:BackGround := aBrushes[1]
oDCSITUACAO:Font(aFonts[1], FALSE)

oDCTIPONF := SingleLineEdit{SELF,ResourceID{JREG50_TIPONF,_GetInst()}}
oDCTIPONF:FieldSpec := padrao_char_01{}
oDCTIPONF:HyperLabel := HyperLabel{#TIPONF,"Tiponf:",NULL_STRING,"sint50_TIPONF"}
oDCTIPONF:BackGround := aBrushes[1]
oDCTIPONF:Font(aFonts[1], FALSE)

oCCcmdcheckie := PushButton{SELF,ResourceID{JREG50_CMDCHECKIE,_GetInst()}}
oCCcmdcheckie:HyperLabel := HyperLabel{#cmdcheckie,"Checar",NULL_STRING,NULL_STRING}

oCCcmdcheckcgc := PushButton{SELF,ResourceID{JREG50_CMDCHECKCGC,_GetInst()}}
oCCcmdcheckcgc:HyperLabel := HyperLabel{#cmdcheckcgc,"Checar",NULL_STRING,NULL_STRING}

oCCpornum := PushButton{SELF,ResourceID{JREG50_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

oCCbuscanum := PushButton{SELF,ResourceID{JREG50_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Clique Para Localizar Por Numero"

oCCCmdTipo := PushButton{SELF,ResourceID{JREG50_CMDTIPO,_GetInst()}}
oCCCmdTipo:HyperLabel := HyperLabel{#CmdTipo,"(E)ntrada (S)aida",NULL_STRING,NULL_STRING}
oCCCmdTipo:TooltipText := "Tipo Entrada/Saida"

oCCcmdsitu := PushButton{SELF,ResourceID{JREG50_CMDSITU,_GetInst()}}
oCCcmdsitu:HyperLabel := HyperLabel{#cmdsitu,"(N)ormal (S)Cancelado (E)xtemporanio normal (X)Estemporanio cancelado",NULL_STRING,NULL_STRING}
oCCcmdsitu:TooltipText := "Tipo Entrada/Saida"

oDCobs := SingleLineEdit{SELF,ResourceID{JREG50_OBS,_GetInst()}}
oDCobs:FieldSpec := padrao_num_10_2{}
oDCobs:HyperLabel := HyperLabel{#obs,"Outras:",NULL_STRING,"sint50_Obs"}

oDCSC_OUTRAS1 := FixedText{SELF,ResourceID{JREG50_SC_OUTRAS1,_GetInst()}}
oDCSC_OUTRAS1:HyperLabel := HyperLabel{#SC_OUTRAS1,"Obs:",NULL_STRING,NULL_STRING}

oCCcmdcheckuf := PushButton{SELF,ResourceID{JREG50_CMDCHECKUF,_GetInst()}}
oCCcmdcheckuf:HyperLabel := HyperLabel{#cmdcheckuf,"Checar",NULL_STRING,NULL_STRING}

oCCcmdescmod := PushButton{SELF,ResourceID{JREG50_CMDESCMOD,_GetInst()}}
oCCcmdescmod:HyperLabel := HyperLabel{#cmdescmod,"..",NULL_STRING,NULL_STRING}

oCCcmdchecmod := PushButton{SELF,ResourceID{JREG50_CMDCHECMOD,_GetInst()}}
oCCcmdchecmod:HyperLabel := HyperLabel{#cmdchecmod,"Checar",NULL_STRING,NULL_STRING}

oCCcmdcheckES := PushButton{SELF,ResourceID{JREG50_CMDCHECKES,_GetInst()}}
oCCcmdcheckES:HyperLabel := HyperLabel{#cmdcheckES,"Checar",NULL_STRING,NULL_STRING}

oCCCmdemitnete := PushButton{SELF,ResourceID{JREG50_CMDEMITNETE,_GetInst()}}
oCCCmdemitnete:HyperLabel := HyperLabel{#Cmdemitnete,"(P)roprio (T)erceiro",NULL_STRING,NULL_STRING}
oCCCmdemitnete:TooltipText := "Tipo Entrada/Saida"

oDCemitente := SingleLineEdit{SELF,ResourceID{JREG50_EMITENTE,_GetInst()}}
oDCemitente:FieldSpec := padrao_char_01{}
oDCemitente:HyperLabel := HyperLabel{#emitente,"Tiponf:",NULL_STRING,"sint50_TIPONF"}
oDCemitente:BackGround := aBrushes[1]
oDCemitente:Font(aFonts[1], FALSE)

oDCSC_TIPONF1 := FixedText{SELF,ResourceID{JREG50_SC_TIPONF1,_GetInst()}}
oDCSC_TIPONF1:HyperLabel := HyperLabel{#SC_TIPONF1,"Emitente",NULL_STRING,NULL_STRING}

oCCcmdchecktot := PushButton{SELF,ResourceID{JREG50_CMDCHECKTOT,_GetInst()}}
oCCcmdchecktot:HyperLabel := HyperLabel{#cmdchecktot,"Checar",NULL_STRING,NULL_STRING}

oCCcmdchekval := PushButton{SELF,ResourceID{JREG50_CMDCHEKVAL,_GetInst()}}
oCCcmdchekval:HyperLabel := HyperLabel{#cmdchekval,"Checar",NULL_STRING,NULL_STRING}

oCCcmdantecipa := PushButton{SELF,ResourceID{JREG50_CMDANTECIPA,_GetInst()}}
oCCcmdantecipa:HyperLabel := HyperLabel{#cmdantecipa,"( ) (1)(2)(3)(4)(5)(6)",NULL_STRING,NULL_STRING}
oCCcmdantecipa:TooltipText := "Tipo Entrada/Saida"

oDCANTECIPA := SingleLineEdit{SELF,ResourceID{JREG50_ANTECIPA,_GetInst()}}
oDCANTECIPA:FieldSpec := padrao_char_01{}
oDCANTECIPA:HyperLabel := HyperLabel{#ANTECIPA,"Tiponf:",NULL_STRING,"sint50_TIPONF"}
oDCANTECIPA:BackGround := aBrushes[1]
oDCANTECIPA:Font(aFonts[1], FALSE)

oDCSC_TIPONF2 := FixedText{SELF,ResourceID{JREG50_SC_TIPONF2,_GetInst()}}
oDCSC_TIPONF2:HyperLabel := HyperLabel{#SC_TIPONF2,"Antecipacao",NULL_STRING,NULL_STRING}

oDCSC_OUTRAS2 := FixedText{SELF,ResourceID{JREG50_SC_OUTRAS2,_GetInst()}}
oDCSC_OUTRAS2:HyperLabel := HyperLabel{#SC_OUTRAS2,"Despesas",NULL_STRING,NULL_STRING}

oDCdespesas := SingleLineEdit{SELF,ResourceID{JREG50_DESPESAS,_GetInst()}}
oDCdespesas:FieldSpec := padrao_num_10_2{}
oDCdespesas:HyperLabel := HyperLabel{#despesas,"Outras:",NULL_STRING,"sint50_Obs"}

oCCCmdfrete := PushButton{SELF,ResourceID{JREG50_CMDFRETE,_GetInst()}}
oCCCmdfrete:HyperLabel := HyperLabel{#Cmdfrete,"(1)CIF (2)FOB (0)Outros",NULL_STRING,NULL_STRING}
oCCCmdfrete:TooltipText := "Tipo Entrada/Saida"

oDCfrete := SingleLineEdit{SELF,ResourceID{JREG50_FRETE,_GetInst()}}
oDCfrete:FieldSpec := padrao_char_01{}
oDCfrete:HyperLabel := HyperLabel{#frete,"Tiponf:",NULL_STRING,"sint50_TIPONF"}
oDCfrete:BackGround := aBrushes[1]
oDCfrete:Font(aFonts[1], FALSE)

oDCSC_TIPONF3 := FixedText{SELF,ResourceID{JREG50_SC_TIPONF3,_GetInst()}}
oDCSC_TIPONF3:HyperLabel := HyperLabel{#SC_TIPONF3,"Frete",NULL_STRING,NULL_STRING}

oCCcmdcheckali := PushButton{SELF,ResourceID{JREG50_CMDCHECKALI,_GetInst()}}
oCCcmdcheckali:HyperLabel := HyperLabel{#cmdcheckali,"Checar",NULL_STRING,NULL_STRING}

SELF:Caption := "Checagem de Valores"
SELF:HyperLabel := HyperLabel{#JReg50,"Checagem de Valores",NULL_STRING,NULL_STRING}
SELF:Menu := STANDARDSHELLMENU{}

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF
SELF:Browser := DataBrowser{SELF}

oDBCGC := DataColumn{PADRAO_CHAR_18{}}
oDBCGC:Width := 16
oDBCGC:HyperLabel := oDCCGC:HyperLabel 
oDBCGC:Caption := "Cgc:"
SELF:Browser:AddColumn(oDBCGC)

oDBIE := DataColumn{PADRAO_CHAR_20{}}
oDBIE:Width := 15
oDBIE:HyperLabel := oDCIE:HyperLabel 
oDBIE:Caption := "Ie:"
SELF:Browser:AddColumn(oDBIE)

oDBDATA := DataColumn{date_field{}}
oDBDATA:Width := 13
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
SELF:Browser:AddColumn(oDBDATA)

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 10
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
SELF:Browser:AddColumn(oDBNUMERO)

oDBCFOP := DataColumn{padrao_char_04{}}
oDBCFOP:Width := 7
oDBCFOP:HyperLabel := oDCCFOP:HyperLabel 
oDBCFOP:Caption := "Cfop:"
SELF:Browser:AddColumn(oDBCFOP)

oDBVALORTOT := DataColumn{padrao_num_10_2{}}
oDBVALORTOT:Width := 10
oDBVALORTOT:HyperLabel := oDCVALORTOT:HyperLabel 
oDBVALORTOT:Caption := "Valortot:"
SELF:Browser:AddColumn(oDBVALORTOT)

oDBBASE := DataColumn{padrao_num_10_2{}}
oDBBASE:Width := 12
oDBBASE:HyperLabel := oDCBASE:HyperLabel 
oDBBASE:Caption := "Base:"
SELF:Browser:AddColumn(oDBBASE)

oDBVALOR := DataColumn{padrao_num_10_2{}}
oDBVALOR:Width := 9
oDBVALOR:HyperLabel := oDCVALOR:HyperLabel 
oDBVALOR:Caption := "Valor:"
SELF:Browser:AddColumn(oDBVALOR)

oDBISENTA := DataColumn{padrao_num_10_2{}}
oDBISENTA:Width := 8
oDBISENTA:HyperLabel := oDCISENTA:HyperLabel 
oDBISENTA:Caption := "Isenta:"
SELF:Browser:AddColumn(oDBISENTA)

oDBOUTRAS := DataColumn{padrao_num_10_2{}}
oDBOUTRAS:Width := 8
oDBOUTRAS:HyperLabel := oDCOUTRAS:HyperLabel 
oDBOUTRAS:Caption := "Outras:"
SELF:Browser:AddColumn(oDBOUTRAS)


SELF:ViewAs(#FormView)

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


ACCESS ISENTA() 
RETURN SELF:FieldGet(#ISENTA)


ASSIGN ISENTA(uValue) 
SELF:FieldPut(#ISENTA, uValue)
RETURN ISENTA := uValue


ACCESS MODELO() 
RETURN SELF:FieldGet(#MODELO)


ASSIGN MODELO(uValue) 
SELF:FieldPut(#MODELO, uValue)
RETURN MODELO := uValue


ACCESS NUMERO() 
RETURN SELF:FieldGet(#NUMERO)


ASSIGN NUMERO(uValue) 
SELF:FieldPut(#NUMERO, uValue)
RETURN NUMERO := uValue


ACCESS obs() 
RETURN SELF:FieldGet(#obs)


ASSIGN obs(uValue) 
SELF:FieldPut(#obs, uValue)
RETURN obs := uValue


ACCESS OUTRAS() 
RETURN SELF:FieldGet(#OUTRAS)


ASSIGN OUTRAS(uValue) 
SELF:FieldPut(#OUTRAS, uValue)
RETURN OUTRAS := uValue


METHOD pornum( ) 
	SELF:keyfind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   FabCenterWindow( SELF )
 RETURN SELF

ACCESS SERIE() 
RETURN SELF:FieldGet(#SERIE)


ASSIGN SERIE(uValue) 
SELF:FieldPut(#SERIE, uValue)
RETURN SERIE := uValue


ACCESS SITUACAO() 
RETURN SELF:FieldGet(#SITUACAO)


ASSIGN SITUACAO(uValue) 
SELF:FieldPut(#SITUACAO, uValue)
RETURN SITUACAO := uValue


ACCESS SUB() 
RETURN SELF:FieldGet(#SUB)


ASSIGN SUB(uValue) 
SELF:FieldPut(#SUB, uValue)
RETURN SUB := uValue


METHOD Timer() 
   SELF:SERVER:COMMIT()

ACCESS TIPO() 
RETURN SELF:FieldGet(#TIPO)


ASSIGN TIPO(uValue) 
SELF:FieldPut(#TIPO, uValue)
RETURN TIPO := uValue


ACCESS TIPONF() 
RETURN SELF:FieldGet(#TIPONF)


ASSIGN TIPONF(uValue) 
SELF:FieldPut(#TIPONF, uValue)
RETURN TIPONF := uValue


ACCESS UF() 
RETURN SELF:FieldGet(#UF)


ASSIGN UF(uValue) 
SELF:FieldPut(#UF, uValue)
RETURN UF := uValue


ACCESS VALOR() 
RETURN SELF:FieldGet(#VALOR)


ASSIGN VALOR(uValue) 
SELF:FieldPut(#VALOR, uValue)
RETURN VALOR := uValue


ACCESS VALORTOT() 
RETURN SELF:FieldGet(#VALORTOT)


ASSIGN VALORTOT(uValue) 
SELF:FieldPut(#VALORTOT, uValue)
RETURN VALORTOT := uValue


END CLASS
