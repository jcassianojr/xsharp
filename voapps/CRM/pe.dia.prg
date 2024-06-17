#region DEFINES
STATIC DEFINE PEDIA_BUSCA := 106 
STATIC DEFINE PEDIA_CANCELAR := 104 
STATIC DEFINE PEDIA_CBUSCA := 102 
STATIC DEFINE PEDIA_ESCOLHER := 101 
STATIC DEFINE PEDIA_JPE := 100 
STATIC DEFINE PEDIA_THEFIXEDTEXT10 := 105 
STATIC DEFINE PEDIA_THEFIXEDTEXT9 := 103 
#endregion

class pedia inherit DATADIALOG 

	protect oCCEscolher as PUSHBUTTON
	protect oDCcBUSCA as SINGLELINEEDIT
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCbusca as PUSHBUTTON
// 	instance cBUSCA 
	protect oSFjpe as jpe

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)




METHOD Cancelar( ) 
	SELF:EndWindow()

access cBUSCA() 
return self:FieldGet(#cBUSCA)


assign cBUSCA(uValue) 
self:FieldPut(#cBUSCA, uValue)
return cBUSCA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"pedia",_GetInst()},iCtlID)

oCCEscolher := PushButton{self,ResourceID{PEDIA_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,"Escolher",NULL_STRING,NULL_STRING}

oDCcBUSCA := SingleLineEdit{self,ResourceID{PEDIA_CBUSCA,_GetInst()}}
oDCcBUSCA:HyperLabel := HyperLabel{#cBUSCA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{PEDIA_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{PEDIA_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}

oDCtheFixedText10 := FixedText{self,ResourceID{PEDIA_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"Busca",NULL_STRING,NULL_STRING}

oCCbusca := PushButton{self,ResourceID{PEDIA_BUSCA,_GetInst()}}
oCCbusca:Image := ico_find{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Escolher Programação de Entrega"
self:HyperLabel := HyperLabel{#pedia,"Escolher Programação de Entrega",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjpe := jpe{self,PEDIA_JPE}
oSFjpe:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


END CLASS
CLASS xpedia INHERIT pedia
    EXPORT NUMERO AS DWORD
    EXPORT cTIPO AS STRING
    EXPORT cCODIGO AS STRING
    EXPORT nFORNECEDO AS DWORD
    EXPORT nCOMPRAS AS DWORD
    EXPORT nCOMITEM AS WORD
    EXPORT lOK AS LOGIC

METHOD BUSCA 
SELF:oSFJpe:SERVER:GOTOP()
SELF:oSFjpe:SERVER:SEEK(SELF:oDCcBUSCA:TEXTVALUE)
IF SELF:oSFjpe:SERVER:EOF
   SELF:oSFjpe:SERVER:GOTOP()
ENDIF	

METHOD Escolher( ) 
	SELF:NUMERO:=SELF:oSFJpe:SERVER:FIELDGET("PEDIDO")
	
	SELF:CTIPO:=SELF:oSFJpe:SERVER:FIELDGET("TIPPED")
    SELF:CCODIGO:=SELF:oSFJpe:SERVER:FIELDGET("CODIGO")
    SELF:NFORNECEDO:=SELF:oSFJpe:SERVER:FIELDGET("FORNECEDO")
	SELF:NCOMPRAS:=SELF:oSFJpe:SERVER:FIELDGET("COMPRAS")
	SELF:NCOMITEM:=SELF:oSFJpe:SERVER:FIELDGET("COMITEM")
					
	SELF:LOK:=.T.
	SELF:EndWindow()

CONSTRUCTOR(oOWNER,cCURINI,cCURDIR) 
LOCAL oSERVE2 AS USEREDE
LOCAL aDAD AS ARRAY
aDAD:={cCURINI,"PE.DBF",cCURDIR}
oSERVE2:=USEREDE{aDAD}
IF oSERVE2:nERRO#0
   RETU SELF
ENDIF
OSERVE2:SETFilter("COMPRAS>0 .AND. ! EMPTY(CODIGO)")
oSERVE2:SetOrder(3)
oSERVE2:GOTOP()
SUPER(oOWNER)
SELF:oSFJPE:USE(oSERVE2)
SELF:OSFJPE:Browser:SetStandardStyle(gBsreadonly)
SELF:LOK:=.F.
SELF:SHOW()		


END CLASS
