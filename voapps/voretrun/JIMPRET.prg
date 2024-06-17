#region DEFINES
STATIC DEFINE _JIMPRET_ARQUIVO := 104 
STATIC DEFINE _JIMPRET_CANCELAR := 113 
STATIC DEFINE _JIMPRET_CONECCAO := 116 
STATIC DEFINE _JIMPRET_CONFIMP := 101 
STATIC DEFINE _JIMPRET_CONSULTA := 117 
STATIC DEFINE _JIMPRET_EDITAR := 115 
STATIC DEFINE _JIMPRET_FIXEDTEXT1 := 102 
STATIC DEFINE _JIMPRET_FIXEDTEXT2 := 100 
STATIC DEFINE _JIMPRET_FIXEDTEXT3 := 107 
STATIC DEFINE _JIMPRET_IMPRIMIR := 103 
STATIC DEFINE _JIMPRET_IMPRIMIR1 := 106 
STATIC DEFINE _JIMPRET_SALVARRTF := 109 
STATIC DEFINE _JIMPRET_SALVARTXT := 111 
STATIC DEFINE _JIMPRET_SC_ARQUIVO := 105 
STATIC DEFINE _JIMPRET_THEFIXEDTEXT13 := 112 
STATIC DEFINE _JIMPRET_THEFIXEDTEXT14 := 110 
STATIC DEFINE _JIMPRET_THEFIXEDTEXT15 := 108 
STATIC DEFINE _JIMPRET_THEFIXEDTEXT16 := 114 
#endregion

CLASS _JIMPRET INHERIT DATADIALOG 

	PROTECT oDCFixedText2 AS FIXEDTEXT
	PROTECT oCCCONFIMP AS PUSHBUTTON
	PROTECT oDCFixedText1 AS FIXEDTEXT
	PROTECT oCCimprimir AS PUSHBUTTON
	PROTECT oDCARQUIVO AS SINGLELINEEDIT
	PROTECT oDCSC_ARQUIVO AS FIXEDTEXT
	PROTECT oCCimprimir1 AS PUSHBUTTON
	PROTECT oDCFixedText3 AS FIXEDTEXT
	PROTECT oDCtheFixedText15 AS FIXEDTEXT
	PROTECT oCCSalvarRTF AS PUSHBUTTON
	PROTECT oDCtheFixedText14 AS FIXEDTEXT
	PROTECT oCCSalvarTXT AS PUSHBUTTON
	PROTECT oDCtheFixedText13 AS FIXEDTEXT
	PROTECT oCCCancelar AS PUSHBUTTON
	PROTECT oDCtheFixedText16 AS FIXEDTEXT
	PROTECT oCCeditar AS PUSHBUTTON
	PROTECT oDCconeccao AS SINGLELINEEDIT
	PROTECT oDCconsulta AS MULTILINEEDIT
// 	instance ARQUIVO 
// 	instance coneccao 
// 	instance consulta 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

ACCESS ARQUIVO() 
RETURN SELF:FieldGet(#ARQUIVO)


ASSIGN ARQUIVO(uValue) 
SELF:FieldPut(#ARQUIVO, uValue)

ACCESS coneccao() 
RETURN SELF:FieldGet(#coneccao)


ASSIGN coneccao(uValue) 
SELF:FieldPut(#coneccao, uValue)


ACCESS consulta() 
RETURN SELF:FieldGet(#consulta)


ASSIGN consulta(uValue) 
SELF:FieldPut(#consulta, uValue)



CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra) 

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"_JIMPRET",_GetInst()},iCtlID)

oDCFixedText2 := FixedText{SELF,ResourceID{_JIMPRET_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Conf Imp",NULL_STRING,NULL_STRING}

oCCCONFIMP := PushButton{SELF,ResourceID{_JIMPRET_CONFIMP,_GetInst()}}
oCCCONFIMP:HyperLabel := HyperLabel{#CONFIMP,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCONFIMP:Image := ico_PRINTCFG{}

oDCFixedText1 := FixedText{SELF,ResourceID{_JIMPRET_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Imprimir e Visualizar",NULL_STRING,NULL_STRING}

oCCimprimir := PushButton{SELF,ResourceID{_JIMPRET_IMPRIMIR,_GetInst()}}
oCCimprimir:HyperLabel := HyperLabel{#imprimir,NULL_STRING,NULL_STRING,NULL_STRING}
oCCimprimir:Image := ICO_PRINT{}

oDCARQUIVO := SingleLineEdit{SELF,ResourceID{_JIMPRET_ARQUIVO,_GetInst()}}
oDCARQUIVO:HyperLabel := HyperLabel{#ARQUIVO,"Arquivo:",NULL_STRING,"VORET_ARQUIVO"}

oDCSC_ARQUIVO := FixedText{SELF,ResourceID{_JIMPRET_SC_ARQUIVO,_GetInst()}}
oDCSC_ARQUIVO:HyperLabel := HyperLabel{#SC_ARQUIVO,"Relatorio:",NULL_STRING,NULL_STRING}

oCCimprimir1 := PushButton{SELF,ResourceID{_JIMPRET_IMPRIMIR1,_GetInst()}}
oCCimprimir1:HyperLabel := HyperLabel{#imprimir1,NULL_STRING,NULL_STRING,NULL_STRING}
oCCimprimir1:Image := ico_print{}

oDCFixedText3 := FixedText{SELF,ResourceID{_JIMPRET_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Imprimir",NULL_STRING,NULL_STRING}

oDCtheFixedText15 := FixedText{SELF,ResourceID{_JIMPRET_THEFIXEDTEXT15,_GetInst()}}
oDCtheFixedText15:HyperLabel := HyperLabel{#theFixedText15,"GravarRTF",NULL_STRING,NULL_STRING}

oCCSalvarRTF := PushButton{SELF,ResourceID{_JIMPRET_SALVARRTF,_GetInst()}}
oCCSalvarRTF:HyperLabel := HyperLabel{#SalvarRTF,NULL_STRING,NULL_STRING,NULL_STRING}
oCCSalvarRTF:Image := ico_grava{}

oDCtheFixedText14 := FixedText{SELF,ResourceID{_JIMPRET_THEFIXEDTEXT14,_GetInst()}}
oDCtheFixedText14:HyperLabel := HyperLabel{#theFixedText14,"GravarTxt",NULL_STRING,NULL_STRING}

oCCSalvarTXT := PushButton{SELF,ResourceID{_JIMPRET_SALVARTXT,_GetInst()}}
oCCSalvarTXT:HyperLabel := HyperLabel{#SalvarTXT,NULL_STRING,NULL_STRING,NULL_STRING}
oCCSalvarTXT:Image := ico_grava{}

oDCtheFixedText13 := FixedText{SELF,ResourceID{_JIMPRET_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{SELF,ResourceID{_JIMPRET_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}

oDCtheFixedText16 := FixedText{SELF,ResourceID{_JIMPRET_THEFIXEDTEXT16,_GetInst()}}
oDCtheFixedText16:HyperLabel := HyperLabel{#theFixedText16,"Editar",NULL_STRING,NULL_STRING}

oCCeditar := PushButton{SELF,ResourceID{_JIMPRET_EDITAR,_GetInst()}}
oCCeditar:HyperLabel := HyperLabel{#editar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCeditar:Image := ico_editor{}

oDCconeccao := SingleLineEdit{SELF,ResourceID{_JIMPRET_CONECCAO,_GetInst()}}
oDCconeccao:HyperLabel := HyperLabel{#coneccao,"Arquivo:",NULL_STRING,"VORET_ARQUIVO"}

oDCconsulta := MultiLineEdit{SELF,ResourceID{_JIMPRET_CONSULTA,_GetInst()}}
oDCconsulta:HyperLabel := HyperLabel{#consulta,"sql",NULL_STRING,NULL_STRING}

SELF:Caption := "Imprimir Relatorio"
SELF:HyperLabel := HyperLabel{#_JIMPRET,"Imprimir Relatorio",NULL_STRING,NULL_STRING}

IF .NOT. IsNil(oServer)
	SELF:Use(oServer)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		   FabCenterWindow( SELF )
	RETURN NIL


END CLASS
CLASS JIMPRET INHERIT _JIMPRET
 EXPORT lEDITA,lIMPRIME,lSALVARTXT,lSALVARRTF,lVISUALIZA AS LOGIC	
 EXPORT cARQUIVO,cCON,cSQL AS STRING

METHOD Cancelar( ) 
	SELF:EnDWINDOW()

METHOD CHAMAR(cTIPO,cFILENAME) 
LOCAL oIMP AS ImprET   //usada abaixo  oIMP:=ImprET{SELF,cDB,cARQ,cSQL,,cTIPO,cFILENAME} apesar de mencionar como nao usada na compilacao
LOCAL oJRTF AS JRTF
LOCAL cDB,cARQ,cSQL AS STRING


IF ValType(cFILENAME)#"C"
   cFILENAME:=""	
ENDIF	

cDB:=FIXSTR(SELF:cCON)

//Pega o Arquivo Passado Pelo Parametro
cARQ:=SELF:CARQUIVO
IF At(".",cARQ)=0
   cARQ+=".RET"	
ENDIF
//alert(Carq)	
IF .NOT. File(cARQ) //Se nao o arquivo da Configuraçao
   alert("Relatorio nao Encontrado:"+CArq)
ENDIF
cSQL:=FIXSTR(SELF:CSQL)
//Oower,conn,arq,sql,parametros,tipo,arquivodesino)
oIMP:=ImprET{SELF,cDB,cARQ,cSQL,,cTIPO,cFILENAME}
OIMP:Show()	
IF cTIPO="R" .OR. cTIPO="T"
   IF MDG("Ver Arquivo Exportado")
      oJRTF:=JRTF{SELF,cFILENAME,"A",SELF:lEDITA,SELF:lIMPRIME,SELF:lSALVARTXT,SELF:lSALVARRTF}
      oJRTF:SHOW()		
   ENDIF
ENDIF	

METHOD CONFIMP( ) 
	LOCAL oPrinter AS PrintingDevice
	
	oPrinter := PrintingDevice{}
	oPrinter:Setup()

METHOD editar( ) 
	SELF:CHAMAR("E")	

METHOD imprimir( ) 
SELF:CHAMAR("V")	

METHOD imprimir1( ) 
SELF:CHAMAR("P")	

CONSTRUCTOR(oOwner,cARQ,cCON,cSQL,aDIREITO) 
SUPER(oOwner)
IF ValType(aDIREITO)#"A"
   SELF:lEDITA:=.F.
   SELF:lIMPRIME:=.F.	
   SELF:lSALVARTXT:=.F.
   SELF:lSALVARRTF:=.F.
   SELF:lVISUALIZA:=.F.
ELSE
   SELF:lEDITA:=aDIREITO[1]
   SELF:lVISUALIZA:=ADIREITO[2]
   SELF:lIMPRIME:=aDIREITO[3]
   SELF:lSALVARTXT:=aDIREITO[4]
   SELF:lSALVARRTF:=aDIREITO[5]
ENDIF	
IF ValType(cARQ)="C"
   SELF:CARQUIVO:=cARQ	
   SELF:oDCARQUIVO:TEXTVALUE:=cARQ
ENDIF	
IF ValType(cCON)="C"
   SELF:CCON:=cCON
   SELF:oDCconeccao:TEXTVALUE:=cCON
ENDIF	
IF ValType(cSQL)="C"
   SELF:CSQL:=cSQL
   SELF:oDCconsulta:TEXTVALUE:=cSQL

ENDIF	
IF .NOT. SELF:lEDITA
   SELF:oCCeditar:disable()
   SELF:oDCconeccao:disable()
   SELF:oDCconsulta:DISABLE()
   SELF:oDCconsulta:HIDE()
   SELF:oDCconeccao:HIDE()
   SELF:oCCeditar:HIDE()
//   SELF:ODCCONSULTA:

//   SELF:ODCCONSULTA:VISIBLE:=FALSE
ENDIF	
IF .NOT. SELF:lIMPRIME
   SELF:oCCCONFIMP:disable()
   SELF:oCCimprimir:disable()
ENDIF
IF .NOT. SELF:LVISUALIZA .OR. ! SELF:lIMPRIME
   SELF:oCCimprimir1:disable()
ENDIF	
IF .NOT. SELF:lSALVARTXT
   SELF:oCCSalvarTXT:DISABLE()	
ENDIF	
IF .NOT. SELF:lSALVARRTF
   SELF:oCCSalvarRTF:DISABLE()	
ENDIF	
SELF:SHOW()	

METHOD Salvar(cEXT ) 
	LOCAL oOD AS SaveAsDialog
//	LOCAL oTB AS TextBox
//	LOCAL lWrite := TRUE AS LOGIC
	LOCAL aFilter, aFilterDesc AS ARRAY
	LOCAL cFILENAME AS STRING
	aFilter := {"*."+cEXT}
	IF cEXT="RTF"
   		aFilterDesc := {"Arquivo RTF"}
    ELSE
   		aFilterDesc := {"Arquivo de Texto"}
    ENDIF		
    CFILENAME:="Arquivo"
	oOD := SaveAsDialog{SELF,".\"+CFILENAME}
	oOD:SetFilter(aFilter, aFilterDesc, 1)
	oOD:Show()	
	CFILENAME := oOD:FileName
	IF Empty(CFILENAME)
		alert("Nome do Arquivo em Branco")
		CFILENAME:=""
	ENDIF		
	IF File(CFILENAME)
       IF .NOT. MDG("Já existe o Arquivo!", "Sobreescrever ?" )
		 CFILENAME:=""
	   ENDIF	
	ENDIF
RETU cFILENAME

METHOD SalvarRTF( ) 
LOCAL cFILENAME AS STRING		
	cFILENAME:=SELF:SALVAR("RTF")
	IF .NOT. Empty(cFILENAME)	
    	SELF:CHAMAR("R",cFILENAME)
    ENDIF

METHOD SalvarTXT( ) 
LOCAL cFILENAME AS STRING	
	cFILENAME:=SELF:SALVAR("TXT")
	IF .NOT. Empty(cFILENAME)	
    	SELF:CHAMAR("T",cFILENAME)
    ENDIF



END CLASS
