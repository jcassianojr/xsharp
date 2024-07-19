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

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		   FabCenterWindow( SELF )
	RETURN NIL


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
