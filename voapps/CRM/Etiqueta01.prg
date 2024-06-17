#region DEFINES
STATIC DEFINE ETIQ01_ARITEM := 101 
STATIC DEFINE ETIQ01_CANCELAR := 110 
STATIC DEFINE ETIQ01_CONFIMP := 115 
STATIC DEFINE ETIQ01_CRASTRO := 103 
STATIC DEFINE ETIQ01_FIXEDTEXT1 := 112 
STATIC DEFINE ETIQ01_FIXEDTEXT2 := 114 
STATIC DEFINE ETIQ01_FT1 := 108 
STATIC DEFINE ETIQ01_FT3 := 105 
STATIC DEFINE ETIQ01_IMPORTAR := 109 
STATIC DEFINE ETIQ01_IMPORTAR1 := 116 
STATIC DEFINE ETIQ01_IMPRIMIR := 113 
STATIC DEFINE ETIQ01_MDATA := 104 
STATIC DEFINE ETIQ01_NQTDE := 102 
STATIC DEFINE ETIQ01_NRIRM := 100 
STATIC DEFINE ETIQ01_PEGAR := 117 
STATIC DEFINE ETIQ01_PEGMC := 118 
STATIC DEFINE ETIQ01_SC_DATA := 107 
STATIC DEFINE ETIQ01_SC_RASTRO := 106 
STATIC DEFINE ETIQ01_THEFIXEDTEXT13 := 111 
STATIC DEFINE ETIQ01X_CANCELAR := 108 
STATIC DEFINE ETIQ01X_CONFIMP := 113 
STATIC DEFINE ETIQ01X_CRASTRO := 102 
STATIC DEFINE ETIQ01X_FIXEDTEXT1 := 110 
STATIC DEFINE ETIQ01X_FIXEDTEXT2 := 112 
STATIC DEFINE ETIQ01X_FT1 := 106 
STATIC DEFINE ETIQ01X_FT3 := 103 
STATIC DEFINE ETIQ01X_IMPORTAR := 107 
STATIC DEFINE ETIQ01X_IMPORTAR1 := 114 
STATIC DEFINE ETIQ01X_IMPRIMIR := 111 
STATIC DEFINE ETIQ01X_MDATA := 115 
STATIC DEFINE ETIQ01X_NQTDE := 101 
STATIC DEFINE ETIQ01X_NRIRM := 100 
STATIC DEFINE ETIQ01X_SC_DATA := 105 
STATIC DEFINE ETIQ01X_SC_RASTRO := 104 
STATIC DEFINE ETIQ01X_THEFIXEDTEXT13 := 109 
#endregion

class ETIQ01 inherit DATADIALOG 

	protect oDCnRIRM as RIGHTSLE
	protect oDCARITEM as RIGHTSLE
	protect oDCNQTDE as RIGHTSLE
	protect oDCcRASTRO as RIGHTSLE
	protect oDCMDATA as DATESLE
	protect oDCFT3 as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCFT1 as FIXEDTEXT
	protect oCCIMPORTAR as PUSHBUTTON
	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText13 as FIXEDTEXT
	protect oDCFixedText1 as FIXEDTEXT
	protect oCCimprimir as PUSHBUTTON
	protect oDCFixedText2 as FIXEDTEXT
	protect oCCCONFIMP as PUSHBUTTON
	protect oCCIMPORTAR1 as PUSHBUTTON
	protect oCCPEGAR as PUSHBUTTON
	protect oCCPEGMC as PUSHBUTTON
// 	instance nRIRM 
// 	instance ARITEM 
// 	instance NQTDE 
// 	instance cRASTRO 
// 	instance MDATA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ARITEM() 
return self:FieldGet(#ARITEM)


assign ARITEM(uValue) 
self:FieldPut(#ARITEM, uValue)
return ARITEM := uValue


METHOD Cancelar( ) 
	SELF:EndWindow()

METHOD CONFIMP( ) 
		LOCAL oPrinter AS PrintingDevice
	
	oPrinter := PrintingDevice{}
	oPrinter:Setup()

access cRASTRO() 
return self:FieldGet(#cRASTRO)


assign cRASTRO(uValue) 
self:FieldPut(#cRASTRO, uValue)
return cRASTRO := uValue


ACCESS DATA() 
RETURN self:FieldGet(#DATA)


METHOD IMPORTAR() 
LOCAL aRIRM AS ARRAY
aRIRM:=PEGRIRM(SELF:nRIRM)
IF aRIRM[1]=.T.
     SELF:cRASTRO:=aRIRM[3]
     SELF:oDCmDATA:TextValue:=DToC(aRIRM[4])
ENDIF


METHOD IMPORTAR1( ) 
LOCAL aRIST AS ARRAY
aRIST:=PEGRIst(SELF:nRIRM)
IF aRIST[1]=.T.
     SELF:cRASTRO:=aRIST[3]
     SELF:oDCmDATA:TextValue:=DToC(aRIST[4])
ENDIF

METHOD imprimir(oOWNER) 
//LOCAL oRUN AS APP
LOCAL J AS DWORD
LOCAL dDATA AS DATE
LOCAL oCRME01 AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL cVORETRUN,cPARAM AS STRING

        LOCAL nFout AS PTR

IF ! entramenu("CRM",8)
	RETU SELF
ENDIF	
dDATA:=CToD(SELF:oDCmDATA:TextValue)
aDAD:={zCURINI,"CRME01.DBF",zCURDIR}
oCRME01:=USEREDE{aDAD,.F.}
IF oCRME01:nERRO#0
   RETU SELF
ENDIF
oCRME01:GOTOP()
WHILE ! oCRME01:EOF
    oCRME01:LockCurrentRecord()
    oCRME01:Delete()
    oCRME01:SKIP()
ENDDO
oCRME01:PACK()
oCRME01:CLOSE()
oCRME01:=USEREDE{aDAD}
IF oCRME01:nERRO#0
   RETU SELF
ENDIF
FOR J:=1 TO SELF:nQTDE
    oCRME01:APPEND()
    oCRME01:FIELDPUT("RASTRO",SELF:cRASTRO)
    oCRME01:FIELDPUT("DATA",dDATA)
NEXT J
oCRME01:CLOSE()
GRAVALOG("ETIQUETA","IMP","CRM_ETIQ")	
//oRUN:=APP{oOWNER}
//oRUN:RUN("CARETRUN.EXE "+PEGINIVAL(ZCURINI,"RET_ETIQ01","CAMINHO"))
	cVORETRUN:=PEGINIVAL(ZCURINI,"PATH","VORETRUN")+ "VORETRUN"
	cPARAM:=PEGINIVAL(ZCURINI,"RET_ETIQ01","CAMINHO")+"$NNNNNSSSN$#MANA5CRM#"
	nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz(cVORETRUN),String2Psz(cPARAM),String2Psz(""),1)
    ShellExecuteErro(nFout) 
//     hwnd,   lpOperation,  lpFile,   lpParameters,   lpDirectory,    SW_SHOWNORMAL = 1//fica no diretorio atual ondes estao os dbfs

RETU SELF





CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"ETIQ01",_GetInst()},iCtlID)

oDCnRIRM := rightSle{self,ResourceID{ETIQ01_NRIRM,_GetInst()}}
oDCnRIRM:HyperLabel := HyperLabel{#nRIRM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCnRIRM:FieldSpec := PADRAO_NUM_08{}
oDCnRIRM:FocusSelect := FSEL_ALL

oDCARITEM := rightSle{self,ResourceID{ETIQ01_ARITEM,_GetInst()}}
oDCARITEM:FieldSpec := PADRAO_NUM_03{}
oDCARITEM:HyperLabel := HyperLabel{#ARITEM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCARITEM:FocusSelect := FSEL_ALL
oDCARITEM:TooltipText := "Item do Pedido de Compras"

oDCNQTDE := rightSle{self,ResourceID{ETIQ01_NQTDE,_GetInst()}}
oDCNQTDE:HyperLabel := HyperLabel{#NQTDE,"1",NULL_STRING,NULL_STRING}
oDCNQTDE:FieldSpec := PADRAO_NUM_12_2{}
oDCNQTDE:FocusSelect := FSEL_ALL

oDCcRASTRO := rightSle{self,ResourceID{ETIQ01_CRASTRO,_GetInst()}}
oDCcRASTRO:FieldSpec := PADRAO_CHAR_12{}
oDCcRASTRO:HyperLabel := HyperLabel{#cRASTRO,"Rastro:",NULL_STRING,"CRME01_RASTRO"}
oDCcRASTRO:FocusSelect := FSEL_ALL

oDCMDATA := DateSle{self,ResourceID{ETIQ01_MDATA,_GetInst()}}
oDCMDATA:FieldSpec := DATE_FIELD{}
oDCMDATA:HyperLabel := HyperLabel{#MDATA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFT3 := FixedText{self,ResourceID{ETIQ01_FT3,_GetInst()}}
oDCFT3:HyperLabel := HyperLabel{#FT3,"Rirm/Rist",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{ETIQ01_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{ETIQ01_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCFT1 := FixedText{self,ResourceID{ETIQ01_FT1,_GetInst()}}
oDCFT1:HyperLabel := HyperLabel{#FT1,"Quantidade",NULL_STRING,NULL_STRING}

oCCIMPORTAR := PushButton{self,ResourceID{ETIQ01_IMPORTAR,_GetInst()}}
oCCIMPORTAR:HyperLabel := HyperLabel{#IMPORTAR,"Rirm",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{ETIQ01_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}

oDCtheFixedText13 := FixedText{self,ResourceID{ETIQ01_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Retornar",NULL_STRING,NULL_STRING}

oDCFixedText1 := FixedText{self,ResourceID{ETIQ01_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Imprimir",NULL_STRING,NULL_STRING}

oCCimprimir := PushButton{self,ResourceID{ETIQ01_IMPRIMIR,_GetInst()}}
oCCimprimir:HyperLabel := HyperLabel{#imprimir,NULL_STRING,NULL_STRING,NULL_STRING}
oCCimprimir:Image := ICO_PRINT{}

oDCFixedText2 := FixedText{self,ResourceID{ETIQ01_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Conf Imp",NULL_STRING,NULL_STRING}

oCCCONFIMP := PushButton{self,ResourceID{ETIQ01_CONFIMP,_GetInst()}}
oCCCONFIMP:HyperLabel := HyperLabel{#CONFIMP,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCONFIMP:Image := ICO_PRINTCFG{}

oCCIMPORTAR1 := PushButton{self,ResourceID{ETIQ01_IMPORTAR1,_GetInst()}}
oCCIMPORTAR1:HyperLabel := HyperLabel{#IMPORTAR1,"Rist",NULL_STRING,NULL_STRING}

oCCPEGAR := PushButton{self,ResourceID{ETIQ01_PEGAR,_GetInst()}}
oCCPEGAR:HyperLabel := HyperLabel{#PEGAR,"AR",NULL_STRING,NULL_STRING}

oCCPEGMC := PushButton{self,ResourceID{ETIQ01_PEGMC,_GetInst()}}
oCCPEGMC:HyperLabel := HyperLabel{#PEGMC,"MC",NULL_STRING,NULL_STRING}

self:Caption := "Etiqueta de Material Aprovado"
self:HyperLabel := HyperLabel{#ETIQ01,"Etiqueta de Material Aprovado",NULL_STRING,NULL_STRING}

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


access NQTDE() 
return self:FieldGet(#NQTDE)


assign NQTDE(uValue) 
self:FieldPut(#NQTDE, uValue)
return NQTDE := uValue


access nRIRM() 
return self:FieldGet(#nRIRM)


assign nRIRM(uValue) 
self:FieldPut(#nRIRM, uValue)
return nRIRM := uValue


METHOD PEGAR( ) 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL CSQL,cUNID AS STRING   //CMIG
LOCAL nQUANT AS FLOAT
LOCAL oSTMT AS SQLStatement


//   cMIG:=PEGEMPMIG(zempRESA)



   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
   	  RETU
   ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()


  CSQL:=" SELECT * FROM  aviso_rec "
  csql+=" where aviso_rec.num_aviso_rec=" +Trim(Str(SELF:NRIRM))  +" AND  aviso_rec.num_seq="+  Str(SELF:ARITEM)



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
     SELF:NQTDE:=nQUANT
   ENDIF
   Oreg:close()
   Oconn:Disconnect()


SELF:CRASTRO:=CRIARASTRO("AR",SELF:nRIRM,Year(Today()),SELF:ARITEM)



	

METHOD PEGMC( ) 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL CSQL,cUNID AS STRING    //CMIG
LOCAL nQUANT AS FLOAT


 //  cMIG:=PEGEMPMIG(zempRESA)

   oConn := SQLConnection{}
   IF ! oConn:connect("protheus","","")
  	  alert("Erro na Conecção")
   	  RETU
   ENDIF	


  CSQL:=" SELECT * FROM  qek010 "
  csql+=" where qek_lote='" +StrZero(SELF:NRIRM,6)+"/"+  StrZero(SELF:ARITEM,3) + "'"



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
     SELF:NQTDE:=nQUANT
   ENDIF
   Oreg:close()
   Oconn:Disconnect()


SELF:CRASTRO:=CRIARASTRO("IE",SELF:nRIRM,Year(Today()),SELF:ARITEM)



		

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


ACCESS RASTRO() 
RETURN self:FieldGet(#RASTRO)


END CLASS
