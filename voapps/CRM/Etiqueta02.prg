#region DEFINES
STATIC DEFINE ETIQ02_ARITEM := 101 
STATIC DEFINE ETIQ02_CANCELAR := 123 
STATIC DEFINE ETIQ02_CAPLICACAO := 108 
STATIC DEFINE ETIQ02_CCERT := 148 
STATIC DEFINE ETIQ02_CCODIGO := 104 
STATIC DEFINE ETIQ02_CLIFOR := 103 
STATIC DEFINE ETIQ02_CMDMAIS3 := 145 
STATIC DEFINE ETIQ02_CMDMENOS3 := 144 
STATIC DEFINE ETIQ02_CNOME := 107 
STATIC DEFINE ETIQ02_CONFIMP := 128 
STATIC DEFINE ETIQ02_CRASTRO := 102 
STATIC DEFINE ETIQ02_CRESPO := 109 
STATIC DEFINE ETIQ02_EMPRESA := 146 
STATIC DEFINE ETIQ02_ESCFOR := 143 
STATIC DEFINE ETIQ02_FIXEDTEXT1 := 125 
STATIC DEFINE ETIQ02_FIXEDTEXT2 := 127 
STATIC DEFINE ETIQ02_FIXEDTEXT3 := 130 
STATIC DEFINE ETIQ02_FIXEDTEXT4 := 147 
STATIC DEFINE ETIQ02_FT1 := 120 
STATIC DEFINE ETIQ02_FT15 := 138 
STATIC DEFINE ETIQ02_FT16 := 137 
STATIC DEFINE ETIQ02_FT17 := 135 
STATIC DEFINE ETIQ02_FT19 := 133 
STATIC DEFINE ETIQ02_FT20 := 134 
STATIC DEFINE ETIQ02_FT3 := 117 
STATIC DEFINE ETIQ02_FT5 := 136 
STATIC DEFINE ETIQ02_IMPORTAR := 116 
STATIC DEFINE ETIQ02_IMPORTAR1 := 140 
STATIC DEFINE ETIQ02_IMPRIMIR := 126 
STATIC DEFINE ETIQ02_IMPRIMIR1 := 129 
STATIC DEFINE ETIQ02_MDATA := 105 
STATIC DEFINE ETIQ02_NCRM := 100 
STATIC DEFINE ETIQ02_NQTDE := 106 
STATIC DEFINE ETIQ02_NRNOTA := 110 
STATIC DEFINE ETIQ02_NRNOTB := 113 
STATIC DEFINE ETIQ02_PEGAR := 141 
STATIC DEFINE ETIQ02_PEGMC := 142 
STATIC DEFINE ETIQ02_PESONFA := 112 
STATIC DEFINE ETIQ02_PESONFB := 115 
STATIC DEFINE ETIQ02_QTDEA := 111 
STATIC DEFINE ETIQ02_QTDEB := 114 
STATIC DEFINE ETIQ02_SC_CLIFOR := 139 
STATIC DEFINE ETIQ02_SC_DATA := 119 
STATIC DEFINE ETIQ02_SC_RASTRO := 118 
STATIC DEFINE ETIQ02_SC_RASTRO1 := 121 
STATIC DEFINE ETIQ02_SC_RASTRO2 := 122 
STATIC DEFINE ETIQ02_SC_RASTRO3 := 131 
STATIC DEFINE ETIQ02_SC_RASTRO4 := 132 
STATIC DEFINE ETIQ02_SC_RASTRO5 := 149 
STATIC DEFINE ETIQ02_THEFIXEDTEXT13 := 124 
#endregion

class ETIQ02 inherit DATADIALOG 

	protect oDCnCRM as RIGHTSLE
	protect oDCARITEM as RIGHTSLE
	protect oDCcRASTRO as SINGLELINEEDIT
	protect oDCCLIFOR as RIGHTSLE
	protect oDCcCODIGO as SINGLELINEEDIT
	protect oDCMDATA as DATESLE
	protect oDCNQTDE as RIGHTSLE
	protect oDCCNOME as MULTILINEEDIT
	protect oDCcAPLICACAO as SINGLELINEEDIT
	protect oDCcRESPO as SINGLELINEEDIT
	protect oDCNRNOTA as RIGHTSLE
	protect oDCQTDEA as RIGHTSLE
	protect oDCPESONFA as RIGHTSLE
	protect oDCNRNOTB as RIGHTSLE
	protect oDCQTDEB as RIGHTSLE
	protect oDCPESONFB as RIGHTSLE
	protect oCCIMPORTAR as PUSHBUTTON
	protect oDCFT3 as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCFT1 as FIXEDTEXT
	protect oDCSC_RASTRO1 as FIXEDTEXT
	protect oDCSC_RASTRO2 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText13 as FIXEDTEXT
	protect oDCFixedText1 as FIXEDTEXT
	protect oCCImprimir as PUSHBUTTON
	protect oDCFixedText2 as FIXEDTEXT
	protect oCCCONFIMP as PUSHBUTTON
	protect oCCImprimir1 as PUSHBUTTON
	protect oDCFixedText3 as FIXEDTEXT
	protect oDCSC_RASTRO3 as FIXEDTEXT
	protect oDCSC_RASTRO4 as FIXEDTEXT
	protect oDCFT19 as FIXEDTEXT
	protect oDCFT20 as FIXEDTEXT
	protect oDCFT17 as FIXEDTEXT
	protect oDCFT5 as FIXEDTEXT
	protect oDCFT16 as FIXEDTEXT
	protect oDCFT15 as FIXEDTEXT
	protect oDCSC_CLIFOR as FIXEDTEXT
	protect oCCIMPORTAR1 as PUSHBUTTON
	protect oCCPEGAR as PUSHBUTTON
	protect oCCPEGMC as PUSHBUTTON
	protect oCCESCFOR as PUSHBUTTON
	protect oCCcmdmenos3 as PUSHBUTTON
	protect oCCcmdmais3 as PUSHBUTTON
	protect oDCempresa as RIGHTSLE
	protect oDCFixedText4 as FIXEDTEXT
	protect oDCcCERT as SINGLELINEEDIT
	protect oDCSC_RASTRO5 as FIXEDTEXT
// 	instance nCRM 
// 	instance ARITEM 
// 	instance cRASTRO 
// 	instance CLIFOR 
// 	instance cCODIGO 
// 	instance MDATA 
// 	instance NQTDE 
// 	instance CNOME 
// 	instance cAPLICACAO 
// 	instance cRESPO 
// 	instance NRNOTA 
// 	instance QTDEA 
// 	instance PESONFA 
// 	instance NRNOTB 
// 	instance QTDEB 
// 	instance PESONFB 
// 	instance empresa 
// 	instance cCERT 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ARITEM() 
return self:FieldGet(#ARITEM)


assign ARITEM(uValue) 
self:FieldPut(#ARITEM, uValue)
return ARITEM := uValue


METHOD Cancelar( ) 
	SELF:EndWINDOW()

access cAPLICACAO() 
return self:FieldGet(#cAPLICACAO)


assign cAPLICACAO(uValue) 
self:FieldPut(#cAPLICACAO, uValue)
return cAPLICACAO := uValue


access cCERT() 
return self:FieldGet(#cCERT)


assign cCERT(uValue) 
self:FieldPut(#cCERT, uValue)
return cCERT := uValue


access cCODIGO() 
return self:FieldGet(#cCODIGO)


assign cCODIGO(uValue) 
self:FieldPut(#cCODIGO, uValue)
return cCODIGO := uValue


access CLIFOR() 
return self:FieldGet(#CLIFOR)


assign CLIFOR(uValue) 
self:FieldPut(#CLIFOR, uValue)
return CLIFOR := uValue


METHOD cmdmais3( ) 
SELF:oDCempresa:Value:=Str(INCDEC(SELF:oDCempresa:Value,1,1,999),4)						



METHOD cmdmenos3( ) 
SELF:oDCempresa:Value:=Str(INCDEC(SELF:oDCempresa:Value,-1,1,999),4)							

access CNOME() 
return self:FieldGet(#CNOME)


assign CNOME(uValue) 
self:FieldPut(#CNOME, uValue)
return CNOME := uValue


METHOD CONFIMP( ) 
		LOCAL oPrinter AS PrintingDevice
	
	oPrinter := PrintingDevice{}
	oPrinter:Setup()

access cRASTRO() 
return self:FieldGet(#cRASTRO)


assign cRASTRO(uValue) 
self:FieldPut(#cRASTRO, uValue)
return cRASTRO := uValue


access cRESPO() 
return self:FieldGet(#cRESPO)


assign cRESPO(uValue) 
self:FieldPut(#cRESPO, uValue)
return cRESPO := uValue


access empresa() 
return self:FieldGet(#empresa)


assign empresa(uValue) 
self:FieldPut(#empresa, uValue)
return empresa := uValue


METHOD ESCFOR( ) 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"MA01.DBF"}
oESC:SHOW()	
IF Oesc:lok
    SELF:CLIFOR:=OESC:NUMERO
ENDIF
	

METHOD IMPORTAR( ) 
LOCAL oCRM AS USEREDE
LOCAL cTIPO,cCODIGO AS STRING
LOCAL aDAD AS ARRAY
aDAD:={zCURINI,"CRM.DBF",zCURDIR}
oCRM:=USEREDE{aDAD}
IF oCRM:nERRO#0
    RETU
ENDIF
cTIPO:=" "
IF oCRM:SEEK(Val(SELF:oDCnCRM:TextValue))
	oDCcRASTRO:TextValue:=oCRM:FIELDGET("RASTRO")
	oDCmDATA:TextValue:=DToC(oCRM:FIELDGET("DATA"))
    cTIPO:=oCRM:FIELDGET("TIPOE")
    cCODIGO:=AllTrim(oCRM:FIELDGET("CBUSCA"))
    SELF:oDCcCODIGO:TextValue:=cCODIGO
    SELF:oDCCLIFOR:TEXTVALUE:=Str(oCRM:FIELDGET("CLIFOR"))
    SELF:oDCNRNOTA:TextValue:=Str(oCRM:FIELDGET("NRNOTA"))
    SELF:oDCNRNOTB:TextValue:=Str(oCRM:FIELDGET("NRNOTB"))
    SELF:oDCQTDEA:TextValue:=Str(oCRM:FIELDGET("QTDEA"))
    SELF:oDCQTDEB:TextValue:=Str(oCRM:FIELDGET("QTDEB"))
    SELF:oDCPESONFA:TextValue:=Str(oCRM:FIELDGET("PESONFA"))
    SELF:oDCPESONFB:TextValue:=Str(oCRM:FIELDGET("PESONFB"))
ENDIF	
oCRM:CLOSE()
SELF:PEGNOME(cTIPO)

METHOD IMPORTAR1( ) 
LOCAL oCRM AS USEREDE
LOCAL cTIPO,cCODIGO AS STRING
LOCAL aDAD AS ARRAY
aDAD:={zCURINI,"RIRM.DBF",zCURDIR}
oCRM:=USEREDE{aDAD}
IF oCRM:nERRO#0
    RETU
ENDIF
IF oCRM:SEEK(Val(SELF:oDCnCRM:TextValue))
	oDCcRASTRO:TextValue:=oCRM:FIELDGET("RASTRO")
	oDCmDATA:TextValue:=DToC(oCRM:FIELDGET("DATA"))	
    cTIPO:=oCRM:FIELDGET("TIPOENT")
    cCODIGO:=AllTrim(oCRM:FIELDGET("DESENHO"))
    SELF:oDCcCODIGO:TextValue:=cCODIGO
    SELF:oDCCLIFOR:TEXTVALUE:=Str(oCRM:FIELDGET("NFORN"))
    SELF:oDCNRNOTA:TextValue:=Str(oCRM:FIELDGET("NRNOTA"))
    SELF:oDCNRNOTB:TextValue:=Str(oCRM:FIELDGET("NRNOTB"))
    SELF:oDCQTDEA:TextValue:=Str(oCRM:FIELDGET("QTDE"))
ENDIF	
oCRM:CLOSE()
SELF:PEGNOME(cTIPO)
	






		

METHOD Imprimir( ) 
	SELF:IMPRIMIRX(1)

METHOD Imprimir1( ) 
	SELF:IMPRIMIRX(2)

METHOD imprimirX(nTIPO) 
//LOCAL oRUN AS APP
LOCAL cVORETRUN,cPARAM AS STRING
LOCAL J AS DWORD
LOCAL dDATA AS DATE
LOCAL oCRME02 AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL nFout AS PTR

IF ! entramenu("CRM",9)
	RETU SELF
ENDIF	
dDATA:=CToD(SELF:oDCmDATA:TextValue)
aDAD:={zCURINI,"CRME02.DBF",zCURDIR,.F.}
oCRME02:=USEREDE{aDAD}
IF oCRME02:nERRO#0
   RETU SELF
ENDIF
oCRME02:GOTOP()
WHILE ! oCRME02:EOF
    oCRME02:LockCurrentRecord()
    oCRME02:Delete()
    oCRME02:SKIP()
ENDDO
oCRME02:PACK()
oCRME02:CLOSE()

oCRME02:=USEREDE{aDAD}
IF oCRME02:nERRO#0
   RETU SELF
ENDIF
FOR J:=1 TO SELF:nQTDE
    oCRME02:APPEND()
    oCRME02:FIELDPUT("RASTRO",SELF:cRASTRO)
    oCRME02:FIELDPUT("CERT",SELF:cCERT)
    oCRME02:FIELDPUT("DATA",dDATA)
    oCRME02:FIELDPUT("NOME",SubStr(SELF:oDCcNOME:TextValue,1,30))
    oCRME02:FIELDPUT("NOM2",SubStr(SELF:oDCcNOME:TextValue,31,35))
    oCRME02:FIELDPUT("NOM3",SubStr(SELF:oDCcNOME:TextValue,66))
    oCRME02:FIELDPUT("APLICACAO",SELF:ODCCAPLICACAO:TextValue)
    oCRME02:FIELDPUT("CODIGO",SELF:cCODIGO)
    oCRME02:FIELDPUT("RESPO",SELF:cRESPO)
    oCRME02:FIELDPUT("FORNECEDOR",SELF:CLIFOR)
    oCRME02:FIELDPUT("NRNOTA",SELF:NRNOTA)
    oCRME02:FIELDPUT("NRNOTB",SELF:NRNOTB)
    oCRME02:FIELDPUT("QTDEA",SELF:QTDEA)
    oCRME02:FIELDPUT("QTDEB",SELF:QTDEB)
    oCRME02:FIELDPUT("PESONFA",SELF:PESONFA)
    oCRME02:FIELDPUT("PESONFB",SELF:PESONFB)
    oCRME02:FIELDPUT("POS",Str(J,5)+"/"+Str(nQTDE,5))
NEXT J
oCRME02:CLOSE()
GRAVALOG("ETIQUET2","IMP","CRM_ETIQ")	
//oRUN:=APP{SELF}
cVORETRUN:=PEGINIVAL(ZCURINI,"PATH","VORETRUN")+ "VORETRUN"
IF nTIPO=1
	cPARAM:=PEGINIVAL(ZCURINI,"RET_ETIQ02","CAMINHO")+"$NNNNNSSSN$#MANA5CRM#"
 // oRUN:RUN("CARETRUN.EXE "+PEGINIVAL(ZCURINI,"RET_ETIQ02","CAMINHO"))
ELSE	
	cPARAM:=PEGINIVAL(ZCURINI,"RET_ETIQ02B","CAMINHO")+"$NNNNNSSSN$#MANA5CRM#"
 // oRUN:RUN("CARETRUN.EXE "+PEGINIVAL(ZCURINI,"RET_ETIQ02B","CAMINHO"))
ENDIF
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz(cVORETRUN),String2Psz(cPARAM),String2Psz(""),1)
ShellExecuteErro(nFout) 
//     hwnd,   lpOperation,  lpFile,   lpParameters,   lpDirectory,    SW_SHOWNORMAL = 1//fica no diretorio atual ondes estao os dbfs

RETU SELF



	

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"ETIQ02",_GetInst()},iCtlID)

oDCnCRM := rightSle{self,ResourceID{ETIQ02_NCRM,_GetInst()}}
oDCnCRM:HyperLabel := HyperLabel{#nCRM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCnCRM:FieldSpec := PADRAO_NUM_08{}
oDCnCRM:FocusSelect := FSEL_ALL

oDCARITEM := rightSle{self,ResourceID{ETIQ02_ARITEM,_GetInst()}}
oDCARITEM:FieldSpec := PADRAO_NUM_03{}
oDCARITEM:HyperLabel := HyperLabel{#ARITEM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCARITEM:FocusSelect := FSEL_ALL
oDCARITEM:TooltipText := "Item do Pedido de Compras"

oDCcRASTRO := SingleLineEdit{self,ResourceID{ETIQ02_CRASTRO,_GetInst()}}
oDCcRASTRO:HyperLabel := HyperLabel{#cRASTRO,"Rastro:",NULL_STRING,"CRME01_RASTRO"}
oDCcRASTRO:FocusSelect := FSEL_ALL
oDCcRASTRO:FieldSpec := PADRAO_CHAR_12{}

oDCCLIFOR := rightSle{self,ResourceID{ETIQ02_CLIFOR,_GetInst()}}
oDCCLIFOR:FieldSpec := PADRAO_NUM_08{}
oDCCLIFOR:HyperLabel := HyperLabel{#CLIFOR,"Clifor:",NULL_STRING,"CRM_CLIFOR"}
oDCCLIFOR:FocusSelect := FSEL_ALL
oDCCLIFOR:TooltipText := "Numero Cliente/Fornecedor"

oDCcCODIGO := SingleLineEdit{self,ResourceID{ETIQ02_CCODIGO,_GetInst()}}
oDCcCODIGO:HyperLabel := HyperLabel{#cCODIGO,"CODIGO",NULL_STRING,"CRME01_RASTRO"}
oDCcCODIGO:FocusSelect := FSEL_ALL
oDCcCODIGO:FieldSpec := PADRAO_CHAR_12{}

oDCMDATA := DateSle{self,ResourceID{ETIQ02_MDATA,_GetInst()}}
oDCMDATA:FieldSpec := DATE_FIELD{}
oDCMDATA:HyperLabel := HyperLabel{#MDATA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCNQTDE := rightSle{self,ResourceID{ETIQ02_NQTDE,_GetInst()}}
oDCNQTDE:HyperLabel := HyperLabel{#NQTDE,"1",NULL_STRING,NULL_STRING}
oDCNQTDE:FieldSpec := PADRAO_NUM_03{}
oDCNQTDE:FocusSelect := FSEL_ALL

oDCCNOME := MultiLineEdit{self,ResourceID{ETIQ02_CNOME,_GetInst()}}
oDCCNOME:HyperLabel := HyperLabel{#CNOME,NULL_STRING,NULL_STRING,NULL_STRING}

oDCcAPLICACAO := SingleLineEdit{self,ResourceID{ETIQ02_CAPLICACAO,_GetInst()}}
oDCcAPLICACAO:HyperLabel := HyperLabel{#cAPLICACAO,NULL_STRING,NULL_STRING,"CRME01_RASTRO"}
oDCcAPLICACAO:FocusSelect := FSEL_ALL

oDCcRESPO := SingleLineEdit{self,ResourceID{ETIQ02_CRESPO,_GetInst()}}
oDCcRESPO:HyperLabel := HyperLabel{#cRESPO,NULL_STRING,NULL_STRING,"CRME01_RASTRO"}
oDCcRESPO:FocusSelect := FSEL_ALL

oDCNRNOTA := rightSle{self,ResourceID{ETIQ02_NRNOTA,_GetInst()}}
oDCNRNOTA:FieldSpec := PADRAO_NUM_08{}
oDCNRNOTA:HyperLabel := HyperLabel{#NRNOTA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCNRNOTA:FocusSelect := FSEL_ALL

oDCQTDEA := rightSle{self,ResourceID{ETIQ02_QTDEA,_GetInst()}}
oDCQTDEA:FieldSpec := PADRAO_NUM_12_3{}
oDCQTDEA:HyperLabel := HyperLabel{#QTDEA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCQTDEA:FocusSelect := FSEL_ALL

oDCPESONFA := rightSle{self,ResourceID{ETIQ02_PESONFA,_GetInst()}}
oDCPESONFA:FieldSpec := PADRAO_NUM_12_3{}
oDCPESONFA:HyperLabel := HyperLabel{#PESONFA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPESONFA:FocusSelect := FSEL_ALL

oDCNRNOTB := rightSle{self,ResourceID{ETIQ02_NRNOTB,_GetInst()}}
oDCNRNOTB:FieldSpec := PADRAO_NUM_08{}
oDCNRNOTB:HyperLabel := HyperLabel{#NRNOTB,NULL_STRING,NULL_STRING,NULL_STRING}
oDCNRNOTB:FocusSelect := FSEL_ALL
oDCNRNOTB:TooltipText := "Numero 2 Nota Fiscal"

oDCQTDEB := rightSle{self,ResourceID{ETIQ02_QTDEB,_GetInst()}}
oDCQTDEB:FieldSpec := PADRAO_NUM_12_3{}
oDCQTDEB:HyperLabel := HyperLabel{#QTDEB,NULL_STRING,NULL_STRING,NULL_STRING}
oDCQTDEB:FocusSelect := FSEL_ALL
oDCQTDEB:TooltipText := "Qtde 2 Nora Fiscal"

oDCPESONFB := rightSle{self,ResourceID{ETIQ02_PESONFB,_GetInst()}}
oDCPESONFB:FieldSpec := PADRAO_NUM_12_3{}
oDCPESONFB:HyperLabel := HyperLabel{#PESONFB,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPESONFB:FocusSelect := FSEL_ALL

oCCIMPORTAR := PushButton{self,ResourceID{ETIQ02_IMPORTAR,_GetInst()}}
oCCIMPORTAR:HyperLabel := HyperLabel{#IMPORTAR,"CRM",NULL_STRING,NULL_STRING}

oDCFT3 := FixedText{self,ResourceID{ETIQ02_FT3,_GetInst()}}
oDCFT3:HyperLabel := HyperLabel{#FT3,"Nº",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{ETIQ02_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{ETIQ02_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCFT1 := FixedText{self,ResourceID{ETIQ02_FT1,_GetInst()}}
oDCFT1:HyperLabel := HyperLabel{#FT1,"Nº Etiquetas",NULL_STRING,NULL_STRING}

oDCSC_RASTRO1 := FixedText{self,ResourceID{ETIQ02_SC_RASTRO1,_GetInst()}}
oDCSC_RASTRO1:HyperLabel := HyperLabel{#SC_RASTRO1,"Descrição",NULL_STRING,NULL_STRING}

oDCSC_RASTRO2 := FixedText{self,ResourceID{ETIQ02_SC_RASTRO2,_GetInst()}}
oDCSC_RASTRO2:HyperLabel := HyperLabel{#SC_RASTRO2,"Aplicação",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{ETIQ02_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}

oDCtheFixedText13 := FixedText{self,ResourceID{ETIQ02_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Retornar",NULL_STRING,NULL_STRING}

oDCFixedText1 := FixedText{self,ResourceID{ETIQ02_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Imprimir Modelo A",NULL_STRING,NULL_STRING}

oCCImprimir := PushButton{self,ResourceID{ETIQ02_IMPRIMIR,_GetInst()}}
oCCImprimir:HyperLabel := HyperLabel{#Imprimir,NULL_STRING,NULL_STRING,NULL_STRING}
oCCImprimir:Image := ICO_PRINT{}

oDCFixedText2 := FixedText{self,ResourceID{ETIQ02_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Conf Imp",NULL_STRING,NULL_STRING}

oCCCONFIMP := PushButton{self,ResourceID{ETIQ02_CONFIMP,_GetInst()}}
oCCCONFIMP:HyperLabel := HyperLabel{#CONFIMP,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCONFIMP:Image := ICO_PRINTCFG{}

oCCImprimir1 := PushButton{self,ResourceID{ETIQ02_IMPRIMIR1,_GetInst()}}
oCCImprimir1:HyperLabel := HyperLabel{#Imprimir1,NULL_STRING,NULL_STRING,NULL_STRING}
oCCImprimir1:Image := ICO_PRINT{}

oDCFixedText3 := FixedText{self,ResourceID{ETIQ02_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Imprimir Modelo B",NULL_STRING,NULL_STRING}

oDCSC_RASTRO3 := FixedText{self,ResourceID{ETIQ02_SC_RASTRO3,_GetInst()}}
oDCSC_RASTRO3:HyperLabel := HyperLabel{#SC_RASTRO3,"Responsavel",NULL_STRING,NULL_STRING}

oDCSC_RASTRO4 := FixedText{self,ResourceID{ETIQ02_SC_RASTRO4,_GetInst()}}
oDCSC_RASTRO4:HyperLabel := HyperLabel{#SC_RASTRO4,"Codigo",NULL_STRING,NULL_STRING}

oDCFT19 := FixedText{self,ResourceID{ETIQ02_FT19,_GetInst()}}
oDCFT19:HyperLabel := HyperLabel{#FT19,"Peso",NULL_STRING,NULL_STRING}

oDCFT20 := FixedText{self,ResourceID{ETIQ02_FT20,_GetInst()}}
oDCFT20:HyperLabel := HyperLabel{#FT20,"Peso",NULL_STRING,NULL_STRING}

oDCFT17 := FixedText{self,ResourceID{ETIQ02_FT17,_GetInst()}}
oDCFT17:HyperLabel := HyperLabel{#FT17,"NF Nº",NULL_STRING,NULL_STRING}

oDCFT5 := FixedText{self,ResourceID{ETIQ02_FT5,_GetInst()}}
oDCFT5:HyperLabel := HyperLabel{#FT5,"NF Nº",NULL_STRING,NULL_STRING}

oDCFT16 := FixedText{self,ResourceID{ETIQ02_FT16,_GetInst()}}
oDCFT16:HyperLabel := HyperLabel{#FT16,"Qtde",NULL_STRING,NULL_STRING}

oDCFT15 := FixedText{self,ResourceID{ETIQ02_FT15,_GetInst()}}
oDCFT15:HyperLabel := HyperLabel{#FT15,"Qtde",NULL_STRING,NULL_STRING}

oDCSC_CLIFOR := FixedText{self,ResourceID{ETIQ02_SC_CLIFOR,_GetInst()}}
oDCSC_CLIFOR:HyperLabel := HyperLabel{#SC_CLIFOR,"Fornecedor",NULL_STRING,NULL_STRING}

oCCIMPORTAR1 := PushButton{self,ResourceID{ETIQ02_IMPORTAR1,_GetInst()}}
oCCIMPORTAR1:HyperLabel := HyperLabel{#IMPORTAR1,"RIRM",NULL_STRING,NULL_STRING}

oCCPEGAR := PushButton{self,ResourceID{ETIQ02_PEGAR,_GetInst()}}
oCCPEGAR:HyperLabel := HyperLabel{#PEGAR,"AR",NULL_STRING,NULL_STRING}

oCCPEGMC := PushButton{self,ResourceID{ETIQ02_PEGMC,_GetInst()}}
oCCPEGMC:HyperLabel := HyperLabel{#PEGMC,"MC",NULL_STRING,NULL_STRING}

oCCESCFOR := PushButton{self,ResourceID{ETIQ02_ESCFOR,_GetInst()}}
oCCESCFOR:HyperLabel := HyperLabel{#ESCFOR,"...",NULL_STRING,NULL_STRING}
oCCESCFOR:TooltipText := "Escolher Cliente/Fornecedor"

oCCcmdmenos3 := PushButton{self,ResourceID{ETIQ02_CMDMENOS3,_GetInst()}}
oCCcmdmenos3:HyperLabel := HyperLabel{#cmdmenos3,"-",NULL_STRING,NULL_STRING}

oCCcmdmais3 := PushButton{self,ResourceID{ETIQ02_CMDMAIS3,_GetInst()}}
oCCcmdmais3:HyperLabel := HyperLabel{#cmdmais3,"+",NULL_STRING,NULL_STRING}

oDCempresa := rightSle{self,ResourceID{ETIQ02_EMPRESA,_GetInst()}}
oDCempresa:HyperLabel := HyperLabel{#empresa,NULL_STRING,NULL_STRING,NULL_STRING}
oDCempresa:TooltipText := "Ano Inicial"
oDCempresa:FieldSpec := PADRAO_num_04{}

oDCFixedText4 := FixedText{self,ResourceID{ETIQ02_FIXEDTEXT4,_GetInst()}}
oDCFixedText4:HyperLabel := HyperLabel{#FixedText4,"Empresa",NULL_STRING,NULL_STRING}

oDCcCERT := SingleLineEdit{self,ResourceID{ETIQ02_CCERT,_GetInst()}}
oDCcCERT:HyperLabel := HyperLabel{#cCERT,"Rastro:",NULL_STRING,"CRME01_CERT"}
oDCcCERT:FocusSelect := FSEL_ALL
oDCcCERT:FieldSpec := PADRAO_CHAR_50{}

oDCSC_RASTRO5 := FixedText{self,ResourceID{ETIQ02_SC_RASTRO5,_GetInst()}}
oDCSC_RASTRO5:HyperLabel := HyperLabel{#SC_RASTRO5,"Certificado:",NULL_STRING,NULL_STRING}

self:Caption := "Etiqueta Identificacao"
self:HyperLabel := HyperLabel{#ETIQ02,"Etiqueta Identificacao",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MDATA() 
return self:FieldGet(#MDATA)


assign MDATA(uValue) 
self:FieldPut(#MDATA, uValue)
return MDATA := uValue


access nCRM() 
return self:FieldGet(#nCRM)


assign nCRM(uValue) 
self:FieldPut(#nCRM, uValue)
return nCRM := uValue


access NQTDE() 
return self:FieldGet(#NQTDE)


assign NQTDE(uValue) 
self:FieldPut(#NQTDE, uValue)
return NQTDE := uValue


access NRNOTA() 
return self:FieldGet(#NRNOTA)


assign NRNOTA(uValue) 
self:FieldPut(#NRNOTA, uValue)
return NRNOTA := uValue


access NRNOTB() 
return self:FieldGet(#NRNOTB)


assign NRNOTB(uValue) 
self:FieldPut(#NRNOTB, uValue)
return NRNOTB := uValue


METHOD PEGAR( ) 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL aDAD AS ARRAY
LOCAL oMANA5,oMB01 AS USEMANA5
LOCAL CSQL,cUNID,cCGC,cTIPO AS STRING      //CMIG
LOCAL nQUANT AS FLOAT
LOCAL X AS DWORD
LOCAL oSTMT AS SQLStatement


  // cMIG:=PEGEMPMIG(zempRESA)

    aDAD:={zCURINI,"MB01",zCURDIR,aDIR}
    oMB01:=USEMANA5{aDAD}
    IF oMB01:nERRO#0
       RETU SELF
    ENDIF
    oMB01:SETORDER(3) //CGC



   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
   	  RETU
   ENDIF	


cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

  CSQL:=" SELECT aviso_rec.*, "
  CSQL+=" nf_sup.num_nf, nf_sup.cod_fornecedor "
  CSQL+=" FROM "
  CSQL+=" aviso_rec INNER JOIN nf_sup ON aviso_rec.num_aviso_rec = nf_sup.num_aviso_rec"
  csql+=" where aviso_rec.num_aviso_rec=" +Trim(Str(SELF:NCRM))  +" AND  aviso_rec.num_seq="+  Str(SELF:ARITEM)
  csql+=" AND aviso_rec.cod_empresa="+  Str(SELF:EMPRESA)



   oreg:= SQLSelect{cSQL,oconn}
   IF ! OREG:EoF	
     cUNID:=OREG:FIELDGET("cod_unid_med_nf")
     SELF:MDATA:=OREG:FIELDGET("dat_inclusao_seq")
     nQUANT:=oreg:FIELDGET("qtd_declarad_nf")
     IF Cunid="T"
     	cUNID:="KG"
        nQUANT:=nQUANT*1000
     ENDIF	
     IF Cunid="ML"
     	 cUNID:="PC"
      	 nQUANT:=nQUANT*1000
     ENDIF	
     IF Cunid="CT"
      	cUNID:="PC"
         nQUANT:=nQUANT*100
     ENDIF	
     SELF:QTDEA:=nQUANT
     SELF:pesonfa:=nQUANT
     SELF:NRNOTA:=OREG:FIELDGET("num_nf")
     SELF:cCODIGO:=OREG:FIELDGET("cod_item")
     cCGC:=oREG:FIELDGET("Cod_fornecedor")
     cCGC:=SubStr(CCGC,2)
     IF Left(cCGC,3)="000" //CPF
        cCGC:= SubStr(cCGC,4,3)+"."+SubStr(cCGC,7,3)+"."+SubStr(cCGC,10,3)+"-"+SubStr(cCGC,13,2)
     ELSE
         cCGC:=Left(cCGC,2)+"."+SubStr(cCGC,3,3)+"."+SubStr(cCGC,6,3)+"/"+SubStr(cCGC,9,4)+"-"+SubStr(cCGC,13,2)
     ENDIF
     oMB01:GOTOP()
     IF oMB01:SEEK(cCGC)
        SELF:CLIFOR:=oMB01:FIELDGET("NUMERO")
     ENDIF




   ENDIF
   Oreg:close()
   Oconn:Disconnect()
   oMB01:CLOSE()




cTIPO:=" "
FOR X:=1 TO 3
   IF Empty(CTIPO)
   	  DO CASE
   	  	 CASE X=1
            aDAD:={zCURINI,"MU01",zCURDIR,aDIR}
   	  	 CASE X=2
            aDAD:={zCURINI,"MT01",zCURDIR,aDIR}
  	  	 CASE X=3
            aDAD:={zCURINI,"MP03",zCURDIR,aDIR}
   	  ENDCASE
      oMANA5:=USEMANA5{aDAD}
      IF oMANA5:nERRO#0
         RETU SELF
      ENDIF
      oMANA5:GOTOP()
      IF oMANA5:SEEK(Trim(SELF:cCODIGO))
   	     DO CASE
   	  	    CASE X=1
   	  	 	    cTIPO:="M"
   	  	    CASE X=2
   	  	 	    cTIPO:="C"
  	  	    CASE X=3
   	  	 	    cTIPO:="T"
   	     ENDCASE
      ENDIF
      oMANA5:CLOSE()
   ENDIF
NEXT X


SELF:CRASTRO:=CRIARASTRO("AR",SELF:nCRM,Year(Today()),SELF:ARITEM)
SELF:PEGNOME(cTIPO)

METHOD PEGMC( ) 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL OMB01,oMANA5 AS USEMANA5
LOCAL CSQL,cUNID,cCGC,cTIPO AS STRING //CMIG
LOCAL nQUANT AS FLOAT
LOCAL X AS DWORD
LOCAL aDAD AS ARRAY


 //  cMIG:=PEGEMPMIG(zempRESA)

   aDAD:={zCURINI,"MB01",zCURDIR,aDIR}
   oMB01:=USEMANA5{aDAD}
    IF oMB01:nERRO#0
       RETU SELF
    ENDIF
    oMB01:SETORDER(3) //CGC

  SELF:POINTER:=POINTER{POINTERHOURGLASS}

   oConn := SQLConnection{}
   IF ! oConn:connect("protheus","","")
  	  alert("Erro na Conecção")
   	  RETU
   ENDIF	



  CSQL:="SELECT  qek010.*,sa2010.a2_cgc,qel_zzcert "
  csql+="  FROM  qek010,sa2010,qel010"
  csql+="  where qek010.qek_fornec=sa2010.a2_cod"
  csql+="  and   qek010.qek_lote=qel010.qel_lote"
  csql+="  and   (qek010.qek_lote='" +StrZero(SELF:NCRM,6)+"/"+  StrZero(SELF:ARITEM,3) + "' OR qek010.qek_lote='" +StrZero(SELF:NCRM,6)+"/"+  StrZero(SELF:ARITEM,3) +"01')"
  csql+="  and   qek010.qek_filial='01'"
  csql+="  and   qel010.qel_laudo='A'"
  csql+="  and   qek010.r_e_c_d_e_l_=0"


   oreg:= SQLSelect{cSQL,oconn}
   IF ! OREG:EoF	
 	 cUNID:=OREG:FIELDGET("qek_unimed")
     SELF:MDATA:=SToD(OREG:FIELDGET("qek_dtentr"))
     nQUANT:=Val(StrTran(oreg:FIELDGET("qek_tamlot"),",","."))
     IF Cunid="T"
     	cUNID:="KG"
        nQUANT:=nQUANT*1000
     ENDIF	
     IF Cunid="ML"
     	 cUNID:="PC"
      	 nQUANT:=nQUANT*1000
     ENDIF	
     IF Cunid="CT"
      	cUNID:="PC"
         nQUANT:=nQUANT*100
     ENDIF	
     SELF:QTDEA:=nQUANT
     SELF:pesonfa:=nQUANT

     SELF:NRNOTA:=Val(OREG:FIELDGET("qek_ntfisc"))
     SELF:cCODIGO:=OREG:FIELDGET("qek_produt")
     SELF:cCERT:=FIXSTR(OREG:FIELDGET("qeL_ZZCERT"))

     cCGC:=oREG:FIELDGET("a2_cgc")
     cCGC:=SubStr(cCGC,1,2)+"."+SubStr(cCGC,3,3)+"."+SubStr(cCGC,6,3)+"/"+SubStr(cCGC,9,4)+"-"+SubStr(cCGC,13,2)

     oMB01:GOTOP()
     IF oMB01:SEEK(cCGC)
        SELF:CLIFOR:=oMB01:FIELDGET("NUMERO")
     ENDIF




   ENDIF
   Oreg:close()
   Oconn:Disconnect()

cTIPO:=" "
FOR X:=1 TO 3
   IF Empty(CTIPO)
   	  DO CASE
   	  	 CASE X=1
            aDAD:={zCURINI,"MU01",zCURDIR,aDIR}
   	  	 CASE X=2
            aDAD:={zCURINI,"MT01",zCURDIR,aDIR}
  	  	 CASE X=3
            aDAD:={zCURINI,"MP03",zCURDIR,aDIR}
   	  ENDCASE
      oMANA5:=USEMANA5{aDAD}
      IF oMANA5:nERRO#0
         RETU SELF
      ENDIF
      oMANA5:GOTOP()
      IF oMANA5:SEEK(Trim(SELF:cCODIGO))
   	     DO CASE
   	  	    CASE X=1
   	  	 	    cTIPO:="M"
   	  	    CASE X=2
   	  	 	    cTIPO:="C"
  	  	    CASE X=3
   	  	 	    cTIPO:="T"
   	     ENDCASE
      ENDIF
      oMANA5:CLOSE()
   ENDIF
NEXT X







SELF:CRASTRO:=CRIARASTRO("IE",SELF:nCRM,Year(Today()),SELF:ARITEM)
SELF:PEGNOME(cTIPO)	
   SELF:POINTER:=POINTER{POINTERARROW}

METHOD PEGNOME(cTIPO) 
LOCAL cBUSCA AS STRING
LOCAL aDAD AS ARRAY
cBUSCA:=SELF:cCODIGO	
IF cTIPO="M"
   aDAD:=PEGMU01(cBUSCA,ZCURINI,ZCURDIR)
   IF aDAD[1]
      SELF:cNOME:=aDAD[2]
      SELF:CAPLICACAO:=aDAD[3]
   ENDIF
ENDIF
IF cTIPO="C"
   aDAD:=PEGMT01(cBUSCA,zcurini,zcurdir)
   IF aDAD[1]
      SELF:cNOME:=aDAD[2]
      SELF:CAPLICACAO:=aDAD[3]
   ENDIF
ENDIF
IF cTIPO="T"
   aDAD:=PEGMP03(cBUSCA,zcurini,zcurdir)
   IF aDAD[1]
      SELF:cNOME:=aDAD[2]
      SELF:CAPLICACAO:=aDAD[3]
   ENDIF
ENDIF	
	






	

access PESONFA() 
return self:FieldGet(#PESONFA)


assign PESONFA(uValue) 
self:FieldPut(#PESONFA, uValue)
return PESONFA := uValue


access PESONFB() 
return self:FieldGet(#PESONFB)


assign PESONFB(uValue) 
self:FieldPut(#PESONFB, uValue)
return PESONFB := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	SELF:EMPRESA:=1
	 FabCenterWindow( SELF )
	RETURN NIL


access QTDEA() 
return self:FieldGet(#QTDEA)


assign QTDEA(uValue) 
self:FieldPut(#QTDEA, uValue)
return QTDEA := uValue


access QTDEB() 
return self:FieldGet(#QTDEB)


assign QTDEB(uValue) 
self:FieldPut(#QTDEB, uValue)
return QTDEB := uValue


END CLASS
