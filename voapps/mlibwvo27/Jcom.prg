#region DEFINES
STATIC DEFINE _JCOM_CMDMENOS3 := 100
STATIC DEFINE _JCOM_CMDMAIS3 := 101
STATIC DEFINE _JCOM_EMPRESA := 102
STATIC DEFINE _JCOM_CMDMENOS2 := 103
STATIC DEFINE _JCOM_CMDMAIS2 := 104
STATIC DEFINE _JCOM_ANO := 105
STATIC DEFINE _JCOM_FIXEDTEXT2 := 106
STATIC DEFINE _JCOM_CMDMENOS := 107
STATIC DEFINE _JCOM_CMDMAIS := 108
STATIC DEFINE _JCOM_MES := 109
STATIC DEFINE _JCOM_FIXEDTEXT1 := 110
STATIC DEFINE _JCOM_FIXEDTEXT3 := 111
STATIC DEFINE _JCOM_THEFIXEDTEXT10 := 112
STATIC DEFINE _JCOM_OK := 113
#endregion

PARTIAL CLASS _Jcom INHERIT DATADIALOG
	PROTECT oCCcmdmenos3 AS PUSHBUTTON
	PROTECT oCCcmdmais3 AS PUSHBUTTON
	PROTECT oDCempresa AS SINGLELINEEDIT
	PROTECT oCCcmdmenos2 AS PUSHBUTTON
	PROTECT oCCcmdmais2 AS PUSHBUTTON
	PROTECT oDCano AS SINGLELINEEDIT
	PROTECT oDCFixedText2 AS FIXEDTEXT
	PROTECT oCCcmdmenos AS PUSHBUTTON
	PROTECT oCCcmdmais AS PUSHBUTTON
	PROTECT oDCmes AS SINGLELINEEDIT
	PROTECT oDCFixedText1 AS FIXEDTEXT
	PROTECT oDCFixedText3 AS FIXEDTEXT
	PROTECT oDCtheFixedText10 AS FIXEDTEXT
	PROTECT oCCOK AS PUSHBUTTON

	// {{%UC%}} User code starts here (DO NOT remove this line)  


    EXPORT nEMPRESA AS DWORD
    EXPORT nANO AS DWORD
    EXPORT nMES AS DWORD

ACCESS ano
RETURN SELF:FieldGet( #ano )

ASSIGN ano( uValue )
SELF:FieldPut( #ano , uValue )

METHOD cmdmais( ) 
SELF:oDCMES:Value:=Str(INCDEC(SELF:oDCMES:Value,1,1,12),2)		


METHOD cmdmais2( ) 
SELF:oDCANO:Value:=Str(INCDEC(SELF:oDCANO:Value,1,1900,2100),4)					


METHOD cmdmais3( ) 
SELF:oDCempresa:Value:=Str(INCDEC(SELF:oDCempresa:Value,1,1,999),4)						



METHOD cmdmenos( ) 
SELF:oDCMES:Value:=Str(INCDEC(SELF:oDCMES:Value,-1,1,12),2)			


METHOD cmdmenos2( ) 
SELF:oDCANO:Value:=Str(INCDEC(SELF:oDCANO:Value,-1,1900,2100),4)						



METHOD cmdmenos3( ) 
SELF:oDCempresa:Value:=Str(INCDEC(SELF:oDCempresa:Value,-1,1,999),4)							


ACCESS empresa
RETURN SELF:FieldGet( #empresa )

ASSIGN empresa( uValue )
SELF:FieldPut( #empresa , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"_Jcom" , _GetInst()},iCtlID)

	SELF:oCCcmdmenos3 := PUSHBUTTON{SELF , ResourceID{ _JCOM_CMDMENOS3  , _GetInst() } }
	SELF:oCCcmdmenos3:HyperLabel := HyperLabel{#cmdmenos3 , "-" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmais3 := PUSHBUTTON{SELF , ResourceID{ _JCOM_CMDMAIS3  , _GetInst() } }
	SELF:oCCcmdmais3:HyperLabel := HyperLabel{#cmdmais3 , "+" , NULL_STRING , NULL_STRING}

	SELF:oDCempresa := SINGLELINEEDIT{SELF , ResourceID{ _JCOM_EMPRESA  , _GetInst() } }
	SELF:oDCempresa:FieldSpec := PADRAO_num_04{}
	SELF:oDCempresa:TooltipText := "Ano Inicial"
	SELF:oDCempresa:HyperLabel := HyperLabel{#empresa , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmenos2 := PUSHBUTTON{SELF , ResourceID{ _JCOM_CMDMENOS2  , _GetInst() } }
	SELF:oCCcmdmenos2:HyperLabel := HyperLabel{#cmdmenos2 , "-" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmais2 := PUSHBUTTON{SELF , ResourceID{ _JCOM_CMDMAIS2  , _GetInst() } }
	SELF:oCCcmdmais2:HyperLabel := HyperLabel{#cmdmais2 , "+" , NULL_STRING , NULL_STRING}

	SELF:oDCano := SINGLELINEEDIT{SELF , ResourceID{ _JCOM_ANO  , _GetInst() } }
	SELF:oDCano:FieldSpec := PADRAO_num_04{}
	SELF:oDCano:TooltipText := "Ano Inicial"
	SELF:oDCano:HyperLabel := HyperLabel{#ano , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText2 := FIXEDTEXT{SELF , ResourceID{ _JCOM_FIXEDTEXT2  , _GetInst() } }
	SELF:oDCFixedText2:HyperLabel := HyperLabel{#FixedText2 , "Ano" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmenos := PUSHBUTTON{SELF , ResourceID{ _JCOM_CMDMENOS  , _GetInst() } }
	SELF:oCCcmdmenos:HyperLabel := HyperLabel{#cmdmenos , "-" , NULL_STRING , NULL_STRING}

	SELF:oCCcmdmais := PUSHBUTTON{SELF , ResourceID{ _JCOM_CMDMAIS  , _GetInst() } }
	SELF:oCCcmdmais:HyperLabel := HyperLabel{#cmdmais , "+" , NULL_STRING , NULL_STRING}

	SELF:oDCmes := SINGLELINEEDIT{SELF , ResourceID{ _JCOM_MES  , _GetInst() } }
	SELF:oDCmes:FieldSpec := PADRAO_num_02{}
	SELF:oDCmes:TooltipText := "Mes Inicial"
	SELF:oDCmes:HyperLabel := HyperLabel{#mes , "1" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText1 := FIXEDTEXT{SELF , ResourceID{ _JCOM_FIXEDTEXT1  , _GetInst() } }
	SELF:oDCFixedText1:HyperLabel := HyperLabel{#FixedText1 , "Mes" , NULL_STRING , NULL_STRING}

	SELF:oDCFixedText3 := FIXEDTEXT{SELF , ResourceID{ _JCOM_FIXEDTEXT3  , _GetInst() } }
	SELF:oDCFixedText3:HyperLabel := HyperLabel{#FixedText3 , "Empresa" , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText10 := FIXEDTEXT{SELF , ResourceID{ _JCOM_THEFIXEDTEXT10  , _GetInst() } }
	SELF:oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10 , "OK" , NULL_STRING , NULL_STRING}

	SELF:oCCOK := PUSHBUTTON{SELF , ResourceID{ _JCOM_OK  , _GetInst() } }
	SELF:oCCOK:TooltipText := "Clique Para Concluir"
	SELF:oCCOK:Image := ico_ok{}
	SELF:oCCOK:HyperLabel := HyperLabel{#OK , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:Caption := "Trocar Competencia"
	SELF:HyperLabel := HyperLabel{#_Jcom , "Trocar Competencia" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS mes
RETURN SELF:FieldGet( #mes )

ASSIGN mes( uValue )
SELF:FieldPut( #mes , uValue )

  METHOD OK( ) 
   NEMPRESA:=SELF:empresa
   NANO:=SELF:ANO
   NMES:=SELF:MES
  SELF:EndWindow()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 

   SELF:empresa:=ZEMPRESA
   SELF:ANO:=ZANO
   SELF:MES:=ZMES

   	    FabCenterWindow( SELF )
RETURN NIL



END CLASS
PARTIAL CLASS JCOM INHERIT _JCOM

CONSTRUCTOR(oOWNER) 
SUPER(oOWNER)


METHOD OK( ) 
   ZEMPRESA:=SELF:empresa
   ZANO:=SELF:ANO
   ZMES:=SELF:MES
  SELF:EndWindow()


END CLASS
PARTIAL CLASS JMESANO INHERIT _JCOM	
	EXPORT cCOMP AS STRING

CONSTRUCTOR(oOWNER) 
SUPER(oOWNER)

METHOD OK( ) 
LOCAL cMES AS STRING
LOCAL cANO AS STRING	
  SELF:NEMPRESA:=SELF:empresa
  SELF:NANO:=SELF:ANO
  SELF:NMES:=SELF:MES
  cMES:=StrZero(SELF:NMES,2)
  cANO:=StrZero(SELF:nANO,4)
  SELF:cCOMP:=Right(cANO,2)+cMES
  SELF:EndWindow()


END CLASS
