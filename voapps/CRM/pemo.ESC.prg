#region DEFINES
STATIC DEFINE ESCPEMO_BUSCA := 105 
STATIC DEFINE ESCPEMO_CANCELAR := 102 
STATIC DEFINE ESCPEMO_CBUSCA := 106 
STATIC DEFINE ESCPEMO_ESCOLHER := 103 
STATIC DEFINE ESCPEMO_JPEMO := 100 
STATIC DEFINE ESCPEMO_THEFIXEDTEXT10 := 104 
STATIC DEFINE ESCPEMO_THEFIXEDTEXT9 := 101 
#endregion

class escpemo inherit DATADIALOG 

	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oCCescolher as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCbusca as PUSHBUTTON
	protect oDCcBUSCA as SINGLELINEEDIT
// 	instance cBUSCA 
	protect oSFjpemo as jpemo

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access cBUSCA() 
return self:FieldGet(#cBUSCA)


assign cBUSCA(uValue) 
self:FieldPut(#cBUSCA, uValue)
return cBUSCA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"escpemo",_GetInst()},iCtlID)

oDCtheFixedText9 := FixedText{self,ResourceID{ESCPEMO_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{ESCPEMO_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}

oCCescolher := PushButton{self,ResourceID{ESCPEMO_ESCOLHER,_GetInst()}}
oCCescolher:HyperLabel := HyperLabel{#escolher,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{self,ResourceID{ESCPEMO_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"Busca",NULL_STRING,NULL_STRING}

oCCbusca := PushButton{self,ResourceID{ESCPEMO_BUSCA,_GetInst()}}
oCCbusca:Image := ico_find{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCcBUSCA := SingleLineEdit{self,ResourceID{ESCPEMO_CBUSCA,_GetInst()}}
oDCcBUSCA:HyperLabel := HyperLabel{#cBUSCA,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Escolher"
self:HyperLabel := HyperLabel{#escpemo,"Escolher",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjpemo := jpemo{self,ESCPEMO_JPEMO}
oSFjpemo:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


END CLASS
CLASS Xescpemo INHERIT escpemo
    EXPORT nPEDIDO AS DWORD
    EXPORT nCOMPRAS AS DWORD
    EXPORT nCOMITEM AS DWORD
    EXPORT cCODIGO AS STRING
    EXPORT cTIPO AS STRING
    EXPORT nFORNECEDO AS DWORD
    EXPORT lOK AS LOGIC







METHOD BUSCA 
SELF:osfjpemo:SERVER:GOTOP()
SELF:osfjpemo:SERVER:SEEK(SELF:oDCcBUSCA:TEXTVALUE)
IF SELF:osfjpemo:SERVER:EOF
   SELF:osfjpemo:SERVER:GOTOP()
ENDIF	

METHOD CANCELAR 
	SELF:EndWindow()

METHOD Escolher( ) 
	SELF:NPEDIDO:=SELF:osfjpemo:SERVER:FIELDGET("PEDIDO")
	SELF:NCOMPRAS:=SELF:osfjpemo:SERVER:FIELDGET("COMPRAS")
	SELF:NCOMITEM:=SELF:osfjpemo:SERVER:FIELDGET("COMITEM")
	SELF:CCODIGO:=SELF:osfjpemo:SERVER:FIELDGET("CODIGO")
	SELF:CTIPO:=SELF:osfjpemo:SERVER:FIELDGET("TIPPED")			
	SELF:NFORNECEDO:=SELF:osfjpemo:SERVER:FIELDGET("FORNECEDO")				
	SELF:LOK:=.T.
	SELF:EndWindow()

CONSTRUCTOR(oOWNER,cCURINI,cCURDIR,cARQ) 
LOCAL oSERVE2 AS USEREDE
LOCAL aDAD AS ARRAY
aDAD:={cCURINI,CARQ+".DBF",cCURDIR}
oSERVE2:=USEREDE{aDAD}
IF oSERVE2:nERRO#0
   RETU SELF
ENDIF
oSERVE2:GOTOP()
SUPER(oOWNER)
SELF:osfjpemo:USE(oSERVE2)
SELF:osfjpemo:Browser:SetStandardStyle(GBSREADONLY)
SELF:oSFjpemo:VIEWTABLE()
SELF:LOK:=.F.
SELF:SHOW()		


END CLASS
