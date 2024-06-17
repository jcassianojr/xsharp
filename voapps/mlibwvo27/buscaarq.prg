#region DEFINES
STATIC DEFINE BUSCAARQ_ARQUIVO := 105 
STATIC DEFINE BUSCAARQ_CANCELAR := 102 
STATIC DEFINE BUSCAARQ_OK := 104 
STATIC DEFINE BUSCAARQ_PUSHBUTTON2 := 106 
STATIC DEFINE BUSCAARQ_THEFIXEDTEXT10 := 103 
STATIC DEFINE BUSCAARQ_THEFIXEDTEXT9 := 101 
STATIC DEFINE BUSCAARQ_TITULO := 100 
STATIC DEFINE CRMBUSCA_SC_OBS := 100 
#endregion

CLASS buscaArq INHERIT DIALOGWINDOW 

	PROTECT oDCTitulo AS FIXEDTEXT
	PROTECT oDCtheFixedText9 AS FIXEDTEXT
	PROTECT oCCCancelar AS PUSHBUTTON
	PROTECT oDCtheFixedText10 AS FIXEDTEXT
	PROTECT oCCOK AS PUSHBUTTON
	PROTECT oDCArquivo AS PBFILESLE
	PROTECT oCCPushButton2 AS PUSHBUTTON

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)


  EXPORT cBUSCA AS STRING
  EXPORT lMES:=.F. AS LOGIC
  EXPORT lOK:=.F. AS LOGIC


METHOD Cancelar( ) 
	lok:=.f.
	SELF:EndDialog()

CONSTRUCTOR(oParent,uExtra)  

SELF:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"buscaArq",_GetInst()},TRUE)

oDCTitulo := FixedText{SELF,ResourceID{BUSCAARQ_TITULO,_GetInst()}}
oDCTitulo:HyperLabel := HyperLabel{#Titulo,"Buscar:",NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{SELF,ResourceID{BUSCAARQ_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{SELF,ResourceID{BUSCAARQ_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}
oCCCancelar:TooltipText := "Clique aqui Para Cancelar"

oDCtheFixedText10 := FixedText{SELF,ResourceID{BUSCAARQ_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{SELF,ResourceID{BUSCAARQ_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ICO_OK{}
oCCOK:TooltipText := "Clique aqui Par Confirmar"

oDCArquivo := pbFileSLE{SELF,ResourceID{BUSCAARQ_ARQUIVO,_GetInst()}}
oDCArquivo:HyperLabel := HyperLabel{#Arquivo,NULL_STRING,NULL_STRING,NULL_STRING}
oDCArquivo:TooltipText := "Nome do Arquivo"

oCCPushButton2 := PushButton{SELF,ResourceID{BUSCAARQ_PUSHBUTTON2,_GetInst()}}
oCCPushButton2:HyperLabel := HyperLabel{#PushButton2,"Limpar",NULL_STRING,NULL_STRING}

SELF:Caption := "Localizar"
SELF:HyperLabel := HyperLabel{#buscaArq,"Localizar",NULL_STRING,NULL_STRING}

SELF:PostInit(oParent,uExtra)

RETURN 


METHOD Ok(oOWNER ) 
LOCAL oERRO AS ERRORBOX	
cBUSCA:=""
IF ! IsNil(oDCARQUIVO:TEXTVALUE)
	cBUSCA:=AllTrim(oDCARQUIVO:TEXTVALUE)
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


METHOD PushButton2( ) 
	SELF:oDCArquivo:TextValue:=""

METHOD SETarFiltro(cFILTRO,cDESC) 
   SELF:oDCArquivo:xFilter:=cFILTRO
   SELF:oDCArquivo:xFilterDesc:=cDESC


END CLASS
CLASS XBUSCAARQ INHERIT BUSCAARQ

CONSTRUCTOR(oOWNER,cCABECARIO,cTITULO,cVALOR) 
SUPER(oOWNER)
IF ValType(cCABECARIO)="C"
   SELF:Caption:=cCABECARIO	
ENDIF
IF ValType(cTITULO)="C"
   SELF:oDCTitulo:TEXTVALUE:=cTITULO
ENDIF
IF ValType(cVALOR)="C"
   SELF:oDCARQUIVO:TEXTValue:=cVALOR
ENDIF


END CLASS
