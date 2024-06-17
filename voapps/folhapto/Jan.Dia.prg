#region DEFINES
STATIC DEFINE JDIA_CMDMAIS := 106 
STATIC DEFINE JDIA_CMDMENOS := 107 
STATIC DEFINE JDIA_DIA := 100 
STATIC DEFINE JDIA_EMPRESA := 104 
STATIC DEFINE JDIA_FIXEDTEXT1 := 101 
STATIC DEFINE JDIA_FIXEDTEXT2 := 105 
STATIC DEFINE JDIA_FIXEDTEXT3 := 109 
STATIC DEFINE JDIA_OK := 103 
STATIC DEFINE JDIA_SENHA := 108 
STATIC DEFINE JDIA_THEFIXEDTEXT10 := 102 
#endregion

CLASS JDIA INHERIT DATADIALOG 

	PROTECT oDCDIA AS DATETIMEPICKER
	PROTECT oDCFixedText1 AS FIXEDTEXT
	PROTECT oDCtheFixedText10 AS FIXEDTEXT
	PROTECT oCCOK AS PUSHBUTTON
	PROTECT oDCEMPRESA AS SINGLELINEEDIT
	PROTECT oDCFixedText2 AS FIXEDTEXT
	PROTECT oCCcmdmais AS PUSHBUTTON
	PROTECT oCCcmdmenos AS PUSHBUTTON
	PROTECT oDCsenha AS SINGLELINEEDIT
	PROTECT oDCFixedText3 AS FIXEDTEXT
// 	instance EMPRESA 
// 	instance senha 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD cmdmais( ) 
SELF:oDCEMPRESA:TextValue:=Str(INCDEC(SELF:oDCEMPRESA:TextValue,1,1,99),2)	

METHOD cmdmenos( ) 
SELF:oDCEMPRESA:TextValue:=Str(INCDEC(SELF:oDCEMPRESA:TextValue,-1,1,99),2)		
	

ACCESS EMPRESA() 
RETURN SELF:FieldGet(#EMPRESA)


ASSIGN EMPRESA(uValue) 
SELF:FieldPut(#EMPRESA, uValue)
RETURN EMPRESA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JDIA",_GetInst()},iCtlID)

oDCDIA := DateTimePicker{SELF,ResourceID{JDIA_DIA,_GetInst()}}
oDCDIA:HyperLabel := HyperLabel{#DIA,NULL_STRING,NULL_STRING,NULL_STRING}
oDCDIA:TooltipText := "Dia de Trabalho"

oDCFixedText1 := FixedText{SELF,ResourceID{JDIA_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Dia de Trabalho",NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{SELF,ResourceID{JDIA_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{SELF,ResourceID{JDIA_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}
oCCOK:TooltipText := "Clique Para Concluir"

oDCEMPRESA := SingleLineEdit{SELF,ResourceID{JDIA_EMPRESA,_GetInst()}}
oDCEMPRESA:HyperLabel := HyperLabel{#EMPRESA,"1",NULL_STRING,NULL_STRING}
oDCEMPRESA:TooltipText := "Numero da Empresa"

oDCFixedText2 := FixedText{SELF,ResourceID{JDIA_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Empresa",NULL_STRING,NULL_STRING}

oCCcmdmais := PushButton{SELF,ResourceID{JDIA_CMDMAIS,_GetInst()}}
oCCcmdmais:HyperLabel := HyperLabel{#cmdmais,"+",NULL_STRING,NULL_STRING}

oCCcmdmenos := PushButton{SELF,ResourceID{JDIA_CMDMENOS,_GetInst()}}
oCCcmdmenos:HyperLabel := HyperLabel{#cmdmenos,"-",NULL_STRING,NULL_STRING}

oDCsenha := SingleLineEdit{SELF,ResourceID{JDIA_SENHA,_GetInst()}}
oDCsenha:HyperLabel := HyperLabel{#senha,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText3 := FixedText{SELF,ResourceID{JDIA_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Senha Admin",NULL_STRING,NULL_STRING}

SELF:Caption := "Troca de Data Trabalho"
SELF:HyperLabel := HyperLabel{#JDIA,"Troca de Data Trabalho",NULL_STRING,"JDIA"}

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


METHOD OK( ) 
//LOCAL aESTRU AS ARRAY
LOCAL dDATA AS DATE


dDATA:=CToD(SELF:oDCDIA:TextValue)
ZDUSO:=dDATA
ZANO:=Year(dDATA)
ZMES:=Month(dDATA)
ZEMPRESA:=Val(SELF:oDCEMPRESA:TextValue)
zcomp:=Right(StrZero(zano,4),2)+StrZero(zmes,2)
lSECBCO:=.F.
IF SELF:oDCsenha:TextValue="BANCO"
   alert("Controle Admin ativado")
   lSECBCO:=.T.	
ENDIF	
	
//Alert(Zcomp)
//owindow:Caption:="Controle de Ponto - Empresa:"+Str(ZEMP,2)+" Competencia:"+Str(ZMES,2)+"/"+Str(ZANO,4)		
SELF:ENDWINDOW()	

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


ACCESS senha() 
RETURN SELF:FieldGet(#senha)


ASSIGN senha(uValue) 
SELF:FieldPut(#senha, uValue)
RETURN senha := uValue


END CLASS
