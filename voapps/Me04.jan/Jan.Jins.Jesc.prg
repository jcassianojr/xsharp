#region DEFINES
STATIC DEFINE ESCME04_BUSCA := 102 
STATIC DEFINE ESCME04_CBUSCA := 101 
STATIC DEFINE ESCME04_ESCOLHER := 106 
STATIC DEFINE ESCME04_JINS := 100 
STATIC DEFINE ESCME04_PUSHBUTTON3 := 107 
STATIC DEFINE ESCME04_SAIR := 104 
STATIC DEFINE ESCME04_THEFIXEDTEXT11 := 105 
STATIC DEFINE ESCME04_THEFIXEDTEXT9 := 103 
STATIC DEFINE JESCC_CODIGO := 102 
STATIC DEFINE JESCC_NOME := 103 
STATIC DEFINE JESCC_SC_NOMTEC := 101 
STATIC DEFINE JESCC_SC_TECNICO := 100 
#endregion

class escme04 inherit DATADIALOG 

	protect oDCCBUSCA as SINGLELINEEDIT
	protect oCCBusca as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCsair as PUSHBUTTON
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCEscolher as PUSHBUTTON
	protect oCCPushButton3 as PUSHBUTTON
// 	instance CBUSCA 
	protect oSFjins as jins

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

  EXPORT CODIGO AS STRING
  EXPORT NOME AS STRING

METHOD Busca( ) 
SELF:oSFjINS:Server:gotop()	
SELF:oSFjINS:SERVER:Seek(AllTrim(SELF:CBUSCA),.T.)
IF SELF:oSFjINS:SERVER:EOF
   SELF:oSFjINS:SERVER:GoTop()	
ENDIF	

access CBUSCA() 
return self:FieldGet(#CBUSCA)


assign CBUSCA(uValue) 
self:FieldPut(#CBUSCA, uValue)
return CBUSCA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"escme04",_GetInst()},iCtlID)

oDCCBUSCA := SingleLineEdit{self,ResourceID{ESCME04_CBUSCA,_GetInst()}}
oDCCBUSCA:HyperLabel := HyperLabel{#CBUSCA,NULL_STRING,NULL_STRING,NULL_STRING}

oCCBusca := PushButton{self,ResourceID{ESCME04_BUSCA,_GetInst()}}
oCCBusca:Image := ICO_FIND{}
oCCBusca:HyperLabel := HyperLabel{#Busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{ESCME04_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCsair := PushButton{self,ResourceID{ESCME04_SAIR,_GetInst()}}
oCCsair:HyperLabel := HyperLabel{#sair,NULL_STRING,NULL_STRING,NULL_STRING}
oCCsair:Image := ICO_SAIR{}

oDCtheFixedText11 := FixedText{self,ResourceID{ESCME04_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Escolher",NULL_STRING,NULL_STRING}

oCCEscolher := PushButton{self,ResourceID{ESCME04_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,NULL_STRING,NULL_STRING,NULL_STRING}
oCCEscolher:Image := ICO_OK{}

oCCPushButton3 := PushButton{self,ResourceID{ESCME04_PUSHBUTTON3,_GetInst()}}
oCCPushButton3:HyperLabel := HyperLabel{#PushButton3,"Busca Detalhada",NULL_STRING,NULL_STRING}

self:Caption := "Escolher"
self:HyperLabel := HyperLabel{#escme04,"Escolher",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjins := jins{self,ESCME04_JINS}
oSFjins:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PushButton3( ) 
	SELF:oSFjins:KeyFind()

END CLASS
CLASS xescme04 INHERIT escme04
	EXPORT lOK AS LOGIC
	EXPORT cCODIGO AS STRING
	EXPORT cNOME AS STRING
	EXPORT cCODTIPO AS STRING
	EXPORT cNOMTIPO AS STRING

METHOD ESCOLHER 
	cCODIGO:=SELF:OSFJINS:SERVER:FIELDGET("CODIGO")
	cNOME:=SELF:OSFJINS:SERVER:FIELDGET("TIPO")
	cCODTIPO:=SELF:OSFJINS:SERVER:FIELDGET("CODTIPO")	
	cNOMTIPO:=SELF:OSFJINS:SERVER:FIELDGET("NOMTIPO")
	lOK:=.T.
	SELF:EndWindow()

CONSTRUCTOR(oOWNER,cFILTRO) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY	
aDAD:={zCURINI,"ME04.DBF",ZCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
//IF ! Empty(cFILTRO)	
//   oSERVER:SetFilter(cFILTRO)
//ENDIF
SUPER(oOWNER)
SELF:LOK:=.F.
SELF:oSFjins:USE(oSERVER)
IF ! Empty(cFILTRO)	
   SELF:oSFjins:SERVER:SetFilter(cFILTRO)
//   oSERVER:SetFilter(cFILTRO)
ENDIF

SELF:OSFJINS:Browser:SetStandardStyle(gBsreadonly)
SELF:oSFjins:VIEWTABLE()
SELF:SHOW()				

METHOD SAIr 
	SELF:ENDWINDOW()
	


END CLASS
