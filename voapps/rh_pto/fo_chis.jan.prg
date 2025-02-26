#region DEFINES
STATIC DEFINE JCHIS_ADMISSAO := 103 
STATIC DEFINE JCHIS_ARQUIVO := 105 
STATIC DEFINE JCHIS_BNUMERO := 113 
STATIC DEFINE JCHIS_DEMISSAO := 104 
STATIC DEFINE JCHIS_FOTO := 115 
STATIC DEFINE JCHIS_FOTO1 := 116 
STATIC DEFINE JCHIS_NOME := 102 
STATIC DEFINE JCHIS_NUMERO := 101 
STATIC DEFINE JCHIS_OBS := 106 
STATIC DEFINE JCHIS_PORNUMERO := 112 
STATIC DEFINE JCHIS_SC_ADMISSAO := 108 
STATIC DEFINE JCHIS_SC_ARQUIVO := 110 
STATIC DEFINE JCHIS_SC_DEMISSAO := 109 
STATIC DEFINE JCHIS_SC_DESTINO2 := 114 
STATIC DEFINE JCHIS_SC_DESTINO3 := 117 
STATIC DEFINE JCHIS_SC_NOME := 107 
STATIC DEFINE JCHIS_SC_NUMERO := 100 
STATIC DEFINE JCHIS_SC_OBS := 111 
#endregion

CLASS jchis INHERIT MYDataWindow 

	PROTECT oDBNUMERO AS DataColumn
	PROTECT oDBNOME AS DataColumn
	PROTECT oDBADMISSAO AS DataColumn
	PROTECT oDBDEMISSAO AS DataColumn
	PROTECT oDBARQUIVO AS DataColumn
	PROTECT oDBOBS AS DataColumn
	PROTECT oDCSC_NUMERO AS FIXEDTEXT
	PROTECT oDCNUMERO AS RIGHTSLE
	PROTECT oDCNOME AS SINGLELINEEDIT
	PROTECT oDCADMISSAO AS DATESLE
	PROTECT oDCDEMISSAO AS DATESLE
	PROTECT oDCARQUIVO AS SINGLELINEEDIT
	PROTECT oDCOBS AS SINGLELINEEDIT
	PROTECT oDCSC_NOME AS FIXEDTEXT
	PROTECT oDCSC_ADMISSAO AS FIXEDTEXT
	PROTECT oDCSC_DEMISSAO AS FIXEDTEXT
	PROTECT oDCSC_ARQUIVO AS FIXEDTEXT
	PROTECT oDCSC_OBS AS FIXEDTEXT
	PROTECT oCCpornumero AS PUSHBUTTON
	PROTECT oCCbnumero AS PUSHBUTTON
	PROTECT oDCSC_DESTINO2 AS FIXEDTEXT
	PROTECT oCCfoto AS PUSHBUTTON
	PROTECT oCCfoto1 AS PUSHBUTTON
	PROTECT oDCSC_DESTINO3 AS FIXEDTEXT
// 	instance NUMERO 
// 	instance NOME 
// 	instance ADMISSAO 
// 	instance DEMISSAO 
// 	instance ARQUIVO 
// 	instance OBS 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

ACCESS ADMISSAO() 
RETURN SELF:FieldGet(#ADMISSAO)


ASSIGN ADMISSAO(uValue) 
SELF:FieldPut(#ADMISSAO, uValue)
RETURN ADMISSAO := uValue


ACCESS ARQUIVO() 
RETURN SELF:FieldGet(#ARQUIVO)


ASSIGN ARQUIVO(uValue) 
SELF:FieldPut(#ARQUIVO, uValue)
RETURN ARQUIVO := uValue


METHOD BNumero( ) 
SELF:KeyFind()

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("RH","HIS")	


ACCESS DEMISSAO() 
RETURN SELF:FieldGet(#DEMISSAO)


ASSIGN DEMISSAO(uValue) 
SELF:FieldPut(#DEMISSAO, uValue)
RETURN DEMISSAO := uValue


METHOD FOTO( ) 
LOCAL cDIRFOTO AS STRING
LOCAL cCPF AS STRING
LOCAL cARQ AS STRING
LOCAL nFout AS PTR
cCPF:=SELF:SERVER:FIELDGET("CPF")
IF Valcpf(cCPF)
	cDIRFOTO :=PEGINIVAL(ZCURINI,"FOTOS","FUNJPGCPF")		
	cDIRFOTO+=StrZero(Val(TIRAOUT(cCPF)),11)+".jpg"
ENDIF
cARQ:=PEGINIVAL(ZCURINI,"PATH","IMGJPG")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("IMGJPG"),String2Psz(CCPF+"#"+cDIRFOTO+"${IMGMP04CPF}"),String2Psz(carq),SW_SHOWNORMAL)
ShellExecuteErro(nFout) 

METHOD foto1( ) 	
LOCAL OFOTOVIEW AS FOTOVIEW
LOCAL cDIRFOTO,cTITULO AS STRING	
cDIRFOTO:=PEGINIVAL(ZCURINI,"FOTOS","FUNBMP")	
CDIRFOTO:=CAMINEX(cDIRFOTO,ZMES,ZANO,ZEMPRESA)
cDIRFOTO:=cDIRFOTO+StrZero(SELF:SERVER:FIELDGET("NUMERO"),4)+".BMP"
cTITULO:=Str(SELF:SERVER:FIELDGET("NUMERO"))+"-"+SELF:SERVER:FIELDGET("NOME")
OFOTOVIEW:=fotoview{SELF,cDIRFOTO,cTITULO}
OFOTOVIEW:SHOW()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jchis",_GetInst()},iCtlID)

oDCSC_NUMERO := FixedText{SELF,ResourceID{JCHIS_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCNUMERO := rightSle{SELF,ResourceID{JCHIS_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"Fo_chis_NUMERO"}
oDCNUMERO:FocusSelect := FSEL_HOME

oDCNOME := SingleLineEdit{SELF,ResourceID{JCHIS_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"Fo_chis_NOME"}
oDCNOME:FocusSelect := FSEL_HOME

oDCADMISSAO := DateSle{SELF,ResourceID{JCHIS_ADMISSAO,_GetInst()}}
oDCADMISSAO:FieldSpec := date_field{}
oDCADMISSAO:HyperLabel := HyperLabel{#ADMISSAO,"Admissao:",NULL_STRING,"Fo_chis_ADMISSAO"}
oDCADMISSAO:FocusSelect := FSEL_HOME

oDCDEMISSAO := DateSle{SELF,ResourceID{JCHIS_DEMISSAO,_GetInst()}}
oDCDEMISSAO:FieldSpec := date_field{}
oDCDEMISSAO:HyperLabel := HyperLabel{#DEMISSAO,"Demissao:",NULL_STRING,"Fo_chis_DEMISSAO"}
oDCDEMISSAO:FocusSelect := FSEL_HOME

oDCARQUIVO := SingleLineEdit{SELF,ResourceID{JCHIS_ARQUIVO,_GetInst()}}
oDCARQUIVO:FieldSpec := padrao_char_20{}
oDCARQUIVO:HyperLabel := HyperLabel{#ARQUIVO,"Arquivo:",NULL_STRING,"Fo_chis_ARQUIVO"}
oDCARQUIVO:FocusSelect := FSEL_HOME

oDCOBS := SingleLineEdit{SELF,ResourceID{JCHIS_OBS,_GetInst()}}
oDCOBS:FieldSpec := padrao_char_40{}
oDCOBS:HyperLabel := HyperLabel{#OBS,"Obs:",NULL_STRING,"Fo_chis_OBS"}
oDCOBS:FocusSelect := FSEL_HOME

oDCSC_NOME := FixedText{SELF,ResourceID{JCHIS_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_ADMISSAO := FixedText{SELF,ResourceID{JCHIS_SC_ADMISSAO,_GetInst()}}
oDCSC_ADMISSAO:HyperLabel := HyperLabel{#SC_ADMISSAO,"Admissao:",NULL_STRING,NULL_STRING}

oDCSC_DEMISSAO := FixedText{SELF,ResourceID{JCHIS_SC_DEMISSAO,_GetInst()}}
oDCSC_DEMISSAO:HyperLabel := HyperLabel{#SC_DEMISSAO,"Demissao:",NULL_STRING,NULL_STRING}

oDCSC_ARQUIVO := FixedText{SELF,ResourceID{JCHIS_SC_ARQUIVO,_GetInst()}}
oDCSC_ARQUIVO:HyperLabel := HyperLabel{#SC_ARQUIVO,"Arquivo:",NULL_STRING,NULL_STRING}

oDCSC_OBS := FixedText{SELF,ResourceID{JCHIS_SC_OBS,_GetInst()}}
oDCSC_OBS:HyperLabel := HyperLabel{#SC_OBS,"Obs:",NULL_STRING,NULL_STRING}

oCCpornumero := PushButton{SELF,ResourceID{JCHIS_PORNUMERO,_GetInst()}}
oCCpornumero:Image := ico_az{}
oCCpornumero:HyperLabel := HyperLabel{#pornumero,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbnumero := PushButton{SELF,ResourceID{JCHIS_BNUMERO,_GetInst()}}
oCCbnumero:Image := ico_find{}
oCCbnumero:HyperLabel := HyperLabel{#bnumero,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{SELF,ResourceID{JCHIS_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto Editar",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{SELF,ResourceID{JCHIS_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ico_camera{}

oCCfoto1 := PushButton{SELF,ResourceID{JCHIS_FOTO1,_GetInst()}}
oCCfoto1:HyperLabel := HyperLabel{#foto1,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto1:Image := ico_camera{}

oDCSC_DESTINO3 := FixedText{SELF,ResourceID{JCHIS_SC_DESTINO3,_GetInst()}}
oDCSC_DESTINO3:HyperLabel := HyperLabel{#SC_DESTINO3," Foto   Ver",NULL_STRING,NULL_STRING}

SELF:Caption := "Admissao:"
SELF:HyperLabel := HyperLabel{#jchis,"Admissao:",NULL_STRING,NULL_STRING}
SELF:Menu := STANDARDSHELLMENU{}
SELF:ClipperKeys := TRUE

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF
SELF:Browser := DataBrowser{SELF}

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
SELF:Browser:AddColumn(oDBNUMERO)

oDBNOME := DataColumn{padrao_char_40{}}
oDBNOME:Width := 6
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
SELF:Browser:AddColumn(oDBNOME)

oDBADMISSAO := DataColumn{date_field{}}
oDBADMISSAO:Width := 10
oDBADMISSAO:HyperLabel := oDCADMISSAO:HyperLabel 
oDBADMISSAO:Caption := "Admissao:"
SELF:Browser:AddColumn(oDBADMISSAO)

oDBDEMISSAO := DataColumn{date_field{}}
oDBDEMISSAO:Width := 10
oDBDEMISSAO:HyperLabel := oDCDEMISSAO:HyperLabel 
oDBDEMISSAO:Caption := "Demissao:"
SELF:Browser:AddColumn(oDBDEMISSAO)

oDBARQUIVO := DataColumn{padrao_char_20{}}
oDBARQUIVO:Width := 9
oDBARQUIVO:HyperLabel := oDCARQUIVO:HyperLabel 
oDBARQUIVO:Caption := "Arquivo:"
SELF:Browser:AddColumn(oDBARQUIVO)

oDBOBS := DataColumn{padrao_char_40{}}
oDBOBS:Width := 5
oDBOBS:HyperLabel := oDCOBS:HyperLabel 
oDBOBS:Caption := "Obs:"
SELF:Browser:AddColumn(oDBOBS)


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


ACCESS OBS() 
RETURN SELF:FieldGet(#OBS)


ASSIGN OBS(uValue) 
SELF:FieldPut(#OBS, uValue)
RETURN OBS := uValue


METHOD PorNumero( ) 
SELF:KeyFind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()


END CLASS
