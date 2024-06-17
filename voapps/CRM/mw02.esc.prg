#region DEFINES
STATIC DEFINE ESCMW02_BUSCA := 105 
STATIC DEFINE ESCMW02_CANCELAR := 104 
STATIC DEFINE ESCMW02_CBUSCA := 102 
STATIC DEFINE ESCMW02_ESCOLHER := 100 
STATIC DEFINE ESCMW02_JMW02 := 101 
STATIC DEFINE ESCMW02_THEFIXEDTEXT10 := 106 
STATIC DEFINE ESCMW02_THEFIXEDTEXT9 := 103 
#endregion

class escmw02 inherit DATADIALOG 

	protect oCCescolher as PUSHBUTTON
	protect oDCcBUSCA as SINGLELINEEDIT
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oCCbusca as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
// 	instance cBUSCA 
	protect oSFjmw02 as jmw02

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD CANCELAR 
	SELF:EndWindow()


access cBUSCA() 
return self:FieldGet(#cBUSCA)


assign cBUSCA(uValue) 
self:FieldPut(#cBUSCA, uValue)
return cBUSCA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"escmw02",_GetInst()},iCtlID)

oCCescolher := PushButton{self,ResourceID{ESCMW02_ESCOLHER,_GetInst()}}
oCCescolher:HyperLabel := HyperLabel{#escolher,"escolher",NULL_STRING,NULL_STRING}

oDCcBUSCA := SingleLineEdit{self,ResourceID{ESCMW02_CBUSCA,_GetInst()}}
oDCcBUSCA:HyperLabel := HyperLabel{#cBUSCA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{ESCMW02_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{ESCMW02_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}

oCCbusca := PushButton{self,ResourceID{ESCMW02_BUSCA,_GetInst()}}
oCCbusca:Image := ico_find{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{self,ResourceID{ESCMW02_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"Busca",NULL_STRING,NULL_STRING}

self:Caption := "Escolher Pedido"
self:HyperLabel := HyperLabel{#escmw02,"Escolher Pedido",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjmw02 := jmw02{self,ESCMW02_JMW02}
oSFjmw02:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


END CLASS
CLASS XESCMW02 INHERIT escmw02
    EXPORT NUMERO AS DWORD
    EXPORT ITEM AS DWORD
    EXPORT cCODIGO AS STRING
    EXPORT cTIPO AS STRING
    EXPORT nSALDO AS FLOAT
    EXPORT lOK AS LOGIC

METHOD BUSCA 
SELF:oSFJMW02:SERVER:GOTOP()
SELF:oSFjmw02:SERVER:SEEK(SELF:oDCcBUSCA:TEXTVALUE)
IF SELF:oSFjmw02:SERVER:EOF
   SELF:oSFjmw02:SERVER:GOTOP()
ENDIF	

METHOD Escolher( ) 
	SELF:NUMERO:=SELF:oSFJMW02:SERVER:FIELDGET("COMPED")
	SELF:ITEM:=SELF:oSFjmw02:SERVER:FIELDGET("ITEM")
	SELF:CCODIGO:=SELF:oSFjmw02:SERVER:FIELDGET("ITECOD")
	SELF:CTIPO:=SELF:oSFjmw02:SERVER:FIELDGET("ITETIP")
	SELF:NSALDO:=SELF:oSFjmw02:SERVER:FIELDGET("ITESAL")			
	SELF:LOK:=.T.
	SELF:EndWindow()

CONSTRUCTOR(oOWNER,cCURINI,cCURDIR,cFILTRO) 
LOCAL oSERVE2 AS USEREDE
LOCAL aDAD AS ARRAY
aDAD:={cCURINI,"MW02.DBF",cCURDIR}
oSERVE2:=USEREDE{aDAD}
IF oSERVE2:nERRO#0
   RETU SELF
ENDIF
OSERVE2:SETFilter(cFILTRO)
oSERVE2:SetOrder(3)
oSERVE2:GOTOP()
SUPER(oOWNER)
SELF:oSFJmw02:USE(oSERVE2)
SELF:oSFjmw02:Browser:SetStandardStyle(GBSREADONLY)
SELF:LOK:=.F.
SELF:SHOW()		


END CLASS
