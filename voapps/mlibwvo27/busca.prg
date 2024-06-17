#region DEFINES
STATIC DEFINE BUSCA_CANCELAR := 103 
STATIC DEFINE BUSCA_OBS := 100 
STATIC DEFINE BUSCA_OK := 105 
STATIC DEFINE BUSCA_THEFIXEDTEXT10 := 104 
STATIC DEFINE BUSCA_THEFIXEDTEXT9 := 102 
STATIC DEFINE BUSCA_TITULO := 101 
STATIC DEFINE CRMBUSCA_SC_OBS := 100 
#endregion

CLASS busca INHERIT DIALOGWINDOW 

	PROTECT oDCobs AS RIGHTSLE
	PROTECT oDCTitulo AS FIXEDTEXT
	PROTECT oDCtheFixedText9 AS FIXEDTEXT
	PROTECT oCCCancelar AS PUSHBUTTON
	PROTECT oDCtheFixedText10 AS FIXEDTEXT
	PROTECT oCCOK AS PUSHBUTTON

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)


  EXPORT cBUSCA AS STRING
  EXPORT lMES:=.F. AS LOGIC
  EXPORT lOK:=.F. AS LOGIC


METHOD Cancelar( ) 
	lok:=.f.
	SELF:EndDialog()

CONSTRUCTOR(oParent,uExtra)  

SELF:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"busca",_GetInst()},TRUE)

oDCobs := rightSle{SELF,ResourceID{BUSCA_OBS,_GetInst()}}
oDCobs:HyperLabel := HyperLabel{#obs,NULL_STRING,NULL_STRING,NULL_STRING}
oDCobs:TooltipText := "Digite a Informaçao"

oDCTitulo := FixedText{SELF,ResourceID{BUSCA_TITULO,_GetInst()}}
oDCTitulo:HyperLabel := HyperLabel{#Titulo,"Buscar:",NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{SELF,ResourceID{BUSCA_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{SELF,ResourceID{BUSCA_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}
oCCCancelar:TooltipText := "Clique aqui Para Cancelar"

oDCtheFixedText10 := FixedText{SELF,ResourceID{BUSCA_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{SELF,ResourceID{BUSCA_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ICO_OK{}
oCCOK:TooltipText := "Clique aqui Par Confirmar"

SELF:Caption := "Localizar"
SELF:HyperLabel := HyperLabel{#busca,"Localizar",NULL_STRING,NULL_STRING}

SELF:PostInit(oParent,uExtra)

RETURN 


METHOD Ok(oOWNER ) 
LOCAL oERRO AS ERRORBOX	
cBUSCA:=""
IF ! IsNil(oDCOBS:TEXTVALUE)
	cBUSCA:=AllTrim(oDCOBS:TEXTVALUE)
	lOK:=.T.
ELSE
   IF lMES
   	oERRO:=ERRORBOX{oOWNER,"Não Preenchido"}
   	oERRO:Show()
   	lOK:=.F.
   ENDIF	
ENDIF	
SELF:EndDialog()	
	



METHOD PostInit(oParent,uExtra) 
	
	//Put your PostInit additions here
		    FabCenterWindow( SELF )
	RETURN NIL


END CLASS
CLASS XBUSCA INHERIT BUSCA

CONSTRUCTOR(oOWNER,cCABECARIO,cTITULO,cVALOR) 
SUPER(oOWNER)
IF ValType(cCABECARIO)="C"
   SELF:Caption:=cCABECARIO	
ENDIF
IF ValType(cTITULO)="C"
   SELF:oDCTitulo:TEXTVALUE:=cTITULO
ENDIF
IF ValType(cVALOR)="C"
   SELF:oDCobs:TEXTValue:=cVALOR
ENDIF


END CLASS
