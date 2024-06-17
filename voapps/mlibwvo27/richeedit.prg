#region DEFINES
STATIC DEFINE _JRTF_CANCELAR := 101 
STATIC DEFINE _JRTF_CNVANSI := 112 
STATIC DEFINE _JRTF_CNVOEM := 111 
STATIC DEFINE _JRTF_CONFIMP := 103 
STATIC DEFINE _JRTF_FIXEDTEXT1 := 104 
STATIC DEFINE _JRTF_FIXEDTEXT2 := 102 
STATIC DEFINE _JRTF_IMPRIMIR := 105 
STATIC DEFINE _JRTF_SALVARRTF := 108 
STATIC DEFINE _JRTF_SALVARTXT := 107 
STATIC DEFINE _JRTF_TEXTO := 106 
STATIC DEFINE _JRTF_THEFIXEDTEXT13 := 100 
STATIC DEFINE _JRTF_THEFIXEDTEXT14 := 109 
STATIC DEFINE _JRTF_THEFIXEDTEXT15 := 110 
#endregion

CLASS _JRTF INHERIT DATADIALOG 

	PROTECT oDCtheFixedText13 AS FIXEDTEXT
	PROTECT oCCCancelar AS PUSHBUTTON
	PROTECT oDCFixedText2 AS FIXEDTEXT
	PROTECT oCCCONFIMP AS PUSHBUTTON
	PROTECT oDCFixedText1 AS FIXEDTEXT
	PROTECT oCCimprimir AS PUSHBUTTON
	PROTECT oDCTexto AS RICHEDIT
	PROTECT oCCSalvarTXT AS PUSHBUTTON
	PROTECT oCCSalvarRTF AS PUSHBUTTON
	PROTECT oDCtheFixedText14 AS FIXEDTEXT
	PROTECT oDCtheFixedText15 AS FIXEDTEXT
	PROTECT oCCcnvoem AS PUSHBUTTON
	PROTECT oCCcnvansi AS PUSHBUTTON

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

LoadLibrary(String2Psz("RICHED32.DLL"))
SUPER(oWindow,ResourceID{"_JRTF",_GetInst()},iCtlID)

oDCtheFixedText13 := FixedText{SELF,ResourceID{_JRTF_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{SELF,ResourceID{_JRTF_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}
oCCCancelar:TooltipText := "Clique Para Retornar"

oDCFixedText2 := FixedText{SELF,ResourceID{_JRTF_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Conf Imp",NULL_STRING,NULL_STRING}

oCCCONFIMP := PushButton{SELF,ResourceID{_JRTF_CONFIMP,_GetInst()}}
oCCCONFIMP:HyperLabel := HyperLabel{#CONFIMP,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCONFIMP:Image := ICO_PRINTCFG{}
oCCCONFIMP:TooltipText := "Clique Para Configurar a Impressora"

oDCFixedText1 := FixedText{SELF,ResourceID{_JRTF_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Imprimir",NULL_STRING,NULL_STRING}

oCCimprimir := PushButton{SELF,ResourceID{_JRTF_IMPRIMIR,_GetInst()}}
oCCimprimir:HyperLabel := HyperLabel{#imprimir,NULL_STRING,NULL_STRING,NULL_STRING}
oCCimprimir:Image := ICO_PRINT{}
oCCimprimir:TooltipText := "Clique Para Imprimir"

oDCTexto := RichEdit{SELF,ResourceID{_JRTF_TEXTO,_GetInst()}}
oDCTexto:HyperLabel := HyperLabel{#Texto,NULL_STRING,NULL_STRING,NULL_STRING}

oCCSalvarTXT := PushButton{SELF,ResourceID{_JRTF_SALVARTXT,_GetInst()}}
oCCSalvarTXT:HyperLabel := HyperLabel{#SalvarTXT,NULL_STRING,NULL_STRING,NULL_STRING}
oCCSalvarTXT:Image := ICO_GRAVA{}

oCCSalvarRTF := PushButton{SELF,ResourceID{_JRTF_SALVARRTF,_GetInst()}}
oCCSalvarRTF:HyperLabel := HyperLabel{#SalvarRTF,NULL_STRING,NULL_STRING,NULL_STRING}
oCCSalvarRTF:Image := ICO_GRAVA{}

oDCtheFixedText14 := FixedText{SELF,ResourceID{_JRTF_THEFIXEDTEXT14,_GetInst()}}
oDCtheFixedText14:HyperLabel := HyperLabel{#theFixedText14,"GravarTxt",NULL_STRING,NULL_STRING}

oDCtheFixedText15 := FixedText{SELF,ResourceID{_JRTF_THEFIXEDTEXT15,_GetInst()}}
oDCtheFixedText15:HyperLabel := HyperLabel{#theFixedText15,"GravarRTF",NULL_STRING,NULL_STRING}

oCCcnvoem := PushButton{SELF,ResourceID{_JRTF_CNVOEM,_GetInst()}}
oCCcnvoem:HyperLabel := HyperLabel{#cnvoem,"Ansi->Oem",NULL_STRING,NULL_STRING}
oCCcnvoem:TooltipText := "Convert Ansi(Window->Oem Dos)"

oCCcnvansi := PushButton{SELF,ResourceID{_JRTF_CNVANSI,_GetInst()}}
oCCcnvansi:HyperLabel := HyperLabel{#cnvansi,"Oem->Ansi",NULL_STRING,NULL_STRING}
oCCcnvansi:TooltipText := "Convert Oem-(Dos)->Ansi(Window)"

SELF:Caption := "Texto"
SELF:HyperLabel := HyperLabel{#_JRTF,"Texto",NULL_STRING,NULL_STRING}

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN 


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		    FabCenterWindow( SELF )
	RETURN NIL


END CLASS
CLASS JRTF INHERIT _JRTF
	EXPORT cFName AS STRING

METHOD Cancelar( ) 
	SELF:EndWindow()
	

METHOD cnvansi( ) 
		oDCTEXTO:TextValue:=Oem2Ansi(oDCTEXTO:TextValue)

METHOD cnvoem( ) 
	oDCTEXTO:TextValue:=Ansi2Oem(oDCTEXTO:TextValue)

METHOD CONFIMP( ) 
LOCAL oPrinter AS PrintingDevice
	
oPrinter := PrintingDevice{}
oPrinter:Setup()	

METHOD imprimir( ) 
	SELF:oDCTexto:PRINT()

CONSTRUCTOR(oOWNER,cTEXTO,cTIPO,lEDITA,lIMPRIME,lSALVATXT,lSALVARTF) 	
	
IF ValType(cTIPO)#"C"
   cTIPO:="A" //Arquivo
ENDIF	
IF ValType(Ctexto)#"C"
   cTEXTO:=""	
ENDIF	
//cTIPO="T" Texto
IF ValType(lEDITA)#"L"
   lEDITA:=.F.	
ENDIF	
IF ValType(lSALVATXT)#"L"
   lSALVATXT:=.F.	
ENDIF	
IF ValType(lSALVARTF)#"L"
   lSALVARTF:=.F.	
ENDIF	
IF ValType(lIMPRIME)#"L"
   lIMPRIME:=.F.	
ENDIF	
SUPER(oOWNER)

IF ! lEDITA
   SELF:oDCTexto:DISABLE()	
ENDIF	
IF ! lSALVATXT
   SELF:oCCSalvarTXT:DISABLE()
ENDIF	
IF ! lSALVARTF
   SELF:oCCSalvarRTF:DISABLE()
ENDIF	
IF ! lIMPRIME
  SELF:oCCimprimir:DISABLE()
  SELF:oCCCONFIMP:DISABLE()	
ENDIF	

SELF:cFName:="Arquivo"
IF cTIPO="A"
   cTEXTO:=Upper(cTEXTO)
   IF ! File(cTEXTO)
   	  alert("Arquivo Nao Encontrado "+Ctexto)
   ENDIF	
   IF At(".TXT",cTEXTO)>0
   	  SELF:oDCTexto:TEXTVALUE:=MemoRead(cTEXTO)
   ELSE	
   	  SELF:ODCTEXTO:LOADFROMFILE(cTEXTO)
   ENDIF	
ELSE
   SELF:oDCTexto:TextValue:=cTEXTO	
ENDIF	


IF ! lEDITA
   SELF:oDCTexto:DISABLE()	
ENDIF	
IF ! lSALVATXT
   SELF:oCCSalvarTXT:DISABLE()
ENDIF	
IF ! lSALVARTF
   SELF:oCCSalvarRTF:DISABLE()
ENDIF	
IF ! lIMPRIME
  SELF:oCCimprimir:DISABLE()
  SELF:oCCCONFIMP:DISABLE()	
ENDIF	

SELF:Show()	

METHOD Salvar(cEXT ) 
	LOCAL oOD AS SaveAsDialog
	//LOCAL oTB AS TextBox
	LOCAL lWrite := TRUE AS LOGIC
	LOCAL aFilter, aFilterDesc AS ARRAY
	LOCAL cFileName AS STRING
	aFilter := {"*."+cEXT}
	IF cEXT="RTF"
   		aFilterDesc := {"Arquivo RTF"}
    ELSE
   		aFilterDesc := {"Arquivo de Texto"}
    ENDIF		
	oOD := SaveAsDialog{SELF,".\"+SELF:cFNAME}
	oOD:SetFilter(aFilter, aFilterDesc, 1)
	oOD:Show()	
	cFileName := oOD:FileName
   // +"." +cExt
	//alert(cFileName)
	IF Empty(cFileName)
		lWrite := FALSE
	ENDIF		
	IF File(cFilename)
	//	oTB := TextBox{SELF, "Já existe o Arquivo!", "Sobreescrever ?" }
	//	oTB:Type := BUTTONYESNO + BOXICONHAND //+ MB_DEFBUTTON2	
    //		IF oTB:Show() = BOXREPLYNO
	//		lWrite := FALSE
	//	ENDIF    
		Lwrite:=mdg("Já existe o Arquivo!", "Sobreescrever ?")         
	ENDIF
	IF lWrite
		IF cExt = "RTF"
			SELF:oDCTEXTO:SaveToFile(cFilename)
		 ELSE	
		 	MemoWrit(cFileName, oDCTEXTO:TextValue)
		ENDIF
	//	SELF:cFName := oOD:FileName
    //	SELF:Caption := cFname
	ENDIF


	

METHOD SalvarRTF( ) 
SELF:SALVAR("RTF")

METHOD SalvarTXT( ) 
SELF:SALVAR("TXT")


END CLASS
FUNCTION ARRAYRTF(oOwner,aRETU)
LOCAL nN, nN2, nCount AS DWORD
LOCAL cRow AS STRING
LOCAL cTEXTO AS STRING
LOCAL oJAN AS JRTF

//LOCAL X,nLEN AS DWORD
//nLEN:=Len(aRETU)
//FOR X=1 TO nLEN
//   cTEXTO:=cTEXTO+aRETU[X]+CHR(13)+CHR(10)	
//NEXT X

	IF !IsArray(aRETU)
		cTEXTO := "Funcao Arrayrtf parametro aRETU nao é uma matriz"
	ELSEIF IsString(aRETU[1])	// simple array
		nCount := ALen(aRETU)
//		cTEXTO := "Information Collected: " + CRLF + CRLF
		FOR nN := 1 UPTO nCount
			cTEXTO += AsString(aRETU[nN]) + CRLF
		NEXT
	ELSEIF IsArray(aRETU[1])	// compound strings
		nCount := ALen(aRETU)
//		cTEXTO := "Information Collected: " + CRLF + CRLF
		FOR nN := 1 UPTO nCount
			cRow := ""
			FOR nN2 := 1 UPTO ALen(aRETU[nN])
				cRow += AsString(aRETU[nN, nN2]) + "   "
			NEXT
			cTEXTO += cRow + CRLF
		NEXT
		
	ENDIF
oJAN:=JRTF{oOWNER,cTEXTO,"T",.T.,.T.,.T.,.T.}  
ojan:Show()





