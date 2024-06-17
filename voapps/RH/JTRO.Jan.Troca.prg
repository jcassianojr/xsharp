#region DEFINES
STATIC DEFINE JTRO_CANCELAR := 107 
STATIC DEFINE JTRO_DES := 101 
STATIC DEFINE JTRO_FIXEDTEXT1 := 102 
STATIC DEFINE JTRO_FIXEDTEXT2 := 103 
STATIC DEFINE JTRO_IMPANT := 110 
STATIC DEFINE JTRO_IMPCUR := 112 
STATIC DEFINE JTRO_IMPPRE := 111 
STATIC DEFINE JTRO_IMPPT := 109 
STATIC DEFINE JTRO_IMPTREI := 108 
STATIC DEFINE JTRO_OK := 105 
STATIC DEFINE JTRO_ORI := 100 
STATIC DEFINE JTRO_THEFIXEDTEXT10 := 104 
STATIC DEFINE JTRO_THEFIXEDTEXT9 := 106 
#endregion

class JTRO inherit DIALOGWINDOW 

	protect oDCORI as SINGLELINEEDIT
	protect oDCDES as SINGLELINEEDIT
	protect oDCFixedText1 as FIXEDTEXT
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCimptrei as CHECKBOX
	protect oDCimppt as CHECKBOX
	protect oDCimpant as CHECKBOX
	protect oDCimppre as CHECKBOX
	protect oDCimpcur as CHECKBOX

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Cancelar( ) 
	SELF:EndDialog()

CONSTRUCTOR(oParent,uExtra)  

self:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"JTRO",_GetInst()},TRUE)

oDCORI := SingleLineEdit{self,ResourceID{JTRO_ORI,_GetInst()}}
oDCORI:HyperLabel := HyperLabel{#ORI,NULL_STRING,NULL_STRING,NULL_STRING}
oDCORI:TooltipText := "Digite o Codigo Antigo"

oDCDES := SingleLineEdit{self,ResourceID{JTRO_DES,_GetInst()}}
oDCDES:HyperLabel := HyperLabel{#DES,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDES:TooltipText := "Digite o Codigo Novo"

oDCFixedText1 := FixedText{self,ResourceID{JTRO_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Codigo Antigo",NULL_STRING,NULL_STRING}

oDCFixedText2 := FixedText{self,ResourceID{JTRO_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Codigo Novo",NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{self,ResourceID{JTRO_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JTRO_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}
oCCOK:TooltipText := "Inicia a Conversão do Codigo"

oDCtheFixedText9 := FixedText{self,ResourceID{JTRO_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JTRO_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}
oCCCancelar:TooltipText := "Cancela Conversao e Retorna ao Menu"

oDCimptrei := CheckBox{self,ResourceID{JTRO_IMPTREI,_GetInst()}}
oDCimptrei:HyperLabel := HyperLabel{#imptrei,"Trocar Codigos Treinamento",NULL_STRING,NULL_STRING}
oDCimptrei:TooltipText := "Marque Para trocar Codigos Treinamento"

oDCimppt := CheckBox{self,ResourceID{JTRO_IMPPT,_GetInst()}}
oDCimppt:HyperLabel := HyperLabel{#imppt,"Trocar Codigos Progr. de Treinamentos",NULL_STRING,NULL_STRING}
oDCimppt:TooltipText := "Marque Para trocar Codigos Progr. de Treinamentos"

oDCimpant := CheckBox{self,ResourceID{JTRO_IMPANT,_GetInst()}}
oDCimpant:HyperLabel := HyperLabel{#impant,"Trocar Codigos Contr.Anteriores",NULL_STRING,NULL_STRING}
oDCimpant:TooltipText := "Marque Para trocar Codigos Contr.Anteriores"

oDCimppre := CheckBox{self,ResourceID{JTRO_IMPPRE,_GetInst()}}
oDCimppre:HyperLabel := HyperLabel{#imppre,"Trocar Codigos Antes Contratação",NULL_STRING,NULL_STRING}
oDCimppre:TooltipText := "Marque Para trocar Codigos Antes Contracao"

oDCimpcur := CheckBox{self,ResourceID{JTRO_IMPCUR,_GetInst()}}
oDCimpcur:HyperLabel := HyperLabel{#impcur,"Trocar Codigos Cadastro de Funçoes",NULL_STRING,NULL_STRING}
oDCimpcur:TooltipText := "Marque Para trocar Codigos Cadastro de Funções"

self:Caption := "Troca de Codigos"
self:HyperLabel := HyperLabel{#JTRO,"Troca de Codigos",NULL_STRING,NULL_STRING}

self:PostInit(oParent,uExtra)

return self


METHOD PostInit(oParent,uExtra) 
	//Put your PostInit additions here
	FabCenterWindow( SELF )
	RETURN NIL


END CLASS
PARTIAL CLASS XJTR2
METHOD OK( ) 
LOCAL cORI,cDES AS DWORD

SELF:POINTER:=POINTER{POINTERHOURGLASS}
cORI:=Val(SELF:ODCORI:TextValue)
cDES:=Val(SELF:ODCDES:TextValue)
IF Empty(cORI) .OR. Empty(cDES)
	alert("Necessario Preencher Origem /Destino")
   SELF:EndDialog()
ENDIF	
IF SELF:odcimpTREI:value
   TROCAFUN("TREII.DBF",cORI,cDES,"NUMFUN")
ENDIF
IF SELF:odcimpPT:value
   TROCAFUN("PTI.DBF",cORI,cDES,"NUMFUN")
ENDIF
IF SELF:odcimpANT:value
   TROCAFUN("MP04A.DBF",cORI,cDES,"TECNICO")
ENDIF
IF SELF:odcimpPRE:value
   TROCAFUN("MP04C.DBF",cORI,cDES,"TECNICO")
ENDIF
SELF:POINTER:=POINTER{}	
SELF:EndDialog()	

END CLASS
PARTIAL CLASS XJTRO
METHOD OK() 
LOCAL cORI,cDES	
SELF:POINTER:=POINTER{POINTERHOURGLASS}
cORI:=AllTrim(SELF:ODCORI:TextValue)
cDES:=AllTrim(SELF:ODCDES:TextValue)
IF Empty(cORI) .OR. Empty(cDES)
   alert("Necesario Preencher Origem/Destino")
   RETURN .f.
ENDIF	
IF SELF:odcimpTREI:value
	TROCACUR("TREIN.DBF",cORI,cDES)
ENDIF
IF SELF:odcimpPT:value	
	TROCACUR("PT.DBF",cORI,cDES)
ENDIF
IF SELF:odcimpANT:value	
	TROCACUR("MP04A.DBF",cORI,cDES)
ENDIF
IF SELF:odcimpPRE:value	
	TROCACUR("MP04C.DBF",cORI,cDES)
ENDIF	
IF SELF:odcimpCUR:value	
	TROCACUR("MP02C.DBF",cORI,cDES)
ENDIF	
SELF:POINTER:=POINTER{}	
SELF:EndDialog()


END CLASS
FUNCTION TROCACUR(cARQ,cORI,cDES)
LOCAL oSERVER AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
LOCAL cNOME AS STRING
aDAD:=PEGCUR(cDES)
cNOME:=aDAD[2]
aDAD:={zCURINI,cARQ,zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
   RETURN .f.
ENDIF	
Oserver:gotop()
WHILE ! Oserver:EoF
	IF AllTrim(oSERVER:FIELDGET("CURSO"))==cORI
	   oSERVER:FIELDPUT("CURSO",cDES)
	   IF cARQ#"MP02C.DBF"
  	      oSERVER:FIELDPUT("DESCUR",cNOME)	
  	   ENDIF
    ENDIF	
    Oserver:skip()	
ENDDO	
Oserver:close()	
RETURN .t.
	

FUNCTION TROCAFUN(cARQ,cORI,cDES,cCAMPO)
LOCAL oSERVER AS USEREDE
LOCAL aDAD,aCOM AS ARRAY
aDAD:={zCURINI,cARQ,zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
//Init(aDAD, lShareMode, lReadOnlyMode, cDriver, aCOM)
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
   RETURN .f.
ENDIF	
Oserver:gotop()
WHILE ! Oserver:EoF
	IF oSERVER:FIELDGET(cCAMPO)==cORI
	   oSERVER:FIELDPUT(cCAMPO,cDES)
    ENDIF	
    Oserver:skip()	
ENDDO	
Oserver:close()	
RETURN .t.

