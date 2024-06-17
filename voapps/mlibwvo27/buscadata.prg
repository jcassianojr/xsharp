#region DEFINES
STATIC DEFINE BUSCADATA_CANCELAR := 103 
STATIC DEFINE BUSCADATA_OBS := 100 
STATIC DEFINE BUSCADATA_OK := 105 
STATIC DEFINE BUSCADATA_THEFIXEDTEXT10 := 104 
STATIC DEFINE BUSCADATA_THEFIXEDTEXT9 := 102 
STATIC DEFINE BUSCADATA_TITULO := 101 
STATIC DEFINE CRMBUSCA_SC_OBS := 100 
#endregion

class buscaDATA inherit DIALOGWINDOW 

	protect oDCobs as DATESLE
	protect oDCTitulo as FIXEDTEXT
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)


  EXPORT cBUSCA AS STRING
  EXPORT lMES:=.F. AS LOGIC
  EXPORT lOK:=.F. AS LOGIC


METHOD Cancelar( ) 
	lok:=.f.
	SELF:EndDialog()

CONSTRUCTOR(oParent,uExtra)  

self:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"buscaDATA",_GetInst()},TRUE)

oDCobs := DateSle{self,ResourceID{BUSCADATA_OBS,_GetInst()}}
oDCobs:HyperLabel := HyperLabel{#obs,NULL_STRING,NULL_STRING,NULL_STRING}
oDCobs:TooltipText := "Digite a Informaçao"

oDCTitulo := FixedText{self,ResourceID{BUSCADATA_TITULO,_GetInst()}}
oDCTitulo:HyperLabel := HyperLabel{#Titulo,"Buscar:",NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{BUSCADATA_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{BUSCADATA_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}
oCCCancelar:TooltipText := "Clique aqui Para Cancelar"

oDCtheFixedText10 := FixedText{self,ResourceID{BUSCADATA_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{BUSCADATA_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ICO_OK{}
oCCOK:TooltipText := "Clique aqui Par Confirmar"

self:Caption := "Localizar"
self:HyperLabel := HyperLabel{#buscaDATA,"Localizar",NULL_STRING,NULL_STRING}

self:PostInit(oParent,uExtra)

return self


METHOD Ok(oOWNER ) 
LOCAL oERRO AS ERRORBOX	
cBUSCA:=""
IF ! IsNil(oDCOBS:TEXTVALUE)
	cBUSCA:=AllTrim(oDCOBS:TEXTVALUE)
	lOK:=.T.
ELSE
   lOK:=.F.
   IF lMES
   	  oERRO:=ERRORBOX{oOWNER,"Não Preenchido"}
   	  oERRO:Show()
   ENDIF	
ENDIF	
SELF:EndDialog()	
	



METHOD PostInit(oParent,uExtra) 
	//Put your PostInit additions here
		    FabCenterWindow( SELF )
	RETURN NIL


END CLASS
