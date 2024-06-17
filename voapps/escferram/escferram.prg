#region DEFINES
STATIC DEFINE ESCFER_BUSCA := 102 
STATIC DEFINE ESCFER_CBUSCA := 101 
STATIC DEFINE ESCFER_ESCOLHER := 105 
STATIC DEFINE ESCFER_JFERESC := 100 
STATIC DEFINE ESCFER_PUSHBUTTON4 := 107 
STATIC DEFINE ESCFER_SAIR := 104 
STATIC DEFINE ESCFER_THEFIXEDTEXT11 := 106 
STATIC DEFINE ESCFER_THEFIXEDTEXT9 := 103 
STATIC DEFINE JFERESC_FERRAM := 102 
STATIC DEFINE JFERESC_NOME := 103 
STATIC DEFINE JFERESC_SC_FERRAM := 100 
STATIC DEFINE JFERESC_SC_NOME := 101 
#endregion

class escfer inherit DATADIALOG 

	protect oDCCBUSCA as SINGLELINEEDIT
	protect oCCBusca as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCsair as PUSHBUTTON
	protect oCCEscolher as PUSHBUTTON
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCPushButton4 as PUSHBUTTON
// 	instance CBUSCA 
	protect oSFjferESC as jferESC

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

  EXPORT NUMERO
  EXPORT NOME AS STRING

METHOD Busca( ) 
IF Empty(SELF:CBUSCA)
	RETURN SELF
ENDIF	
SELF:oSFJFERESC:Server:gotop()	
SELF:oSFJFERESC:SERVER:Seek(AllTrim(SELF:CBUSCA),.T.)
IF SELF:oSFJFERESC:SERVER:EOF
   SELF:oSFJFERESC:SERVER:GoTop()	
ENDIF	

access CBUSCA() 
return self:FieldGet(#CBUSCA)


assign CBUSCA(uValue) 
self:FieldPut(#CBUSCA, uValue)
return CBUSCA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"escfer",_GetInst()},iCtlID)

oDCCBUSCA := SingleLineEdit{self,ResourceID{ESCFER_CBUSCA,_GetInst()}}
oDCCBUSCA:HyperLabel := HyperLabel{#CBUSCA,NULL_STRING,NULL_STRING,NULL_STRING}

oCCBusca := PushButton{self,ResourceID{ESCFER_BUSCA,_GetInst()}}
oCCBusca:Image := ico_find{}
oCCBusca:HyperLabel := HyperLabel{#Busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{ESCFER_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCsair := PushButton{self,ResourceID{ESCFER_SAIR,_GetInst()}}
oCCsair:HyperLabel := HyperLabel{#sair,NULL_STRING,NULL_STRING,NULL_STRING}
oCCsair:Image := ico_sair{}

oCCEscolher := PushButton{self,ResourceID{ESCFER_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,NULL_STRING,NULL_STRING,NULL_STRING}
oCCEscolher:Image := ico_ok{}

oDCtheFixedText11 := FixedText{self,ResourceID{ESCFER_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Escolher",NULL_STRING,NULL_STRING}

oCCPushButton4 := PushButton{self,ResourceID{ESCFER_PUSHBUTTON4,_GetInst()}}
oCCPushButton4:HyperLabel := HyperLabel{#PushButton4,"Busca Detalhada",NULL_STRING,NULL_STRING}

self:Caption := "Escolher"
self:HyperLabel := HyperLabel{#escfer,"Escolher",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjferESC := jferESC{self,ESCFER_JFERESC}
oSFjferESC:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


METHOD PushButton4( ) 
	SELF:oSFjferESC:KeyFind()

END CLASS
class jferESC inherit MYDataWindow 

	PROTECT oDBFERRAM as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCSC_FERRAM as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCFERRAM as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
// 	instance FERRAM 
// 	instance NOME 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access FERRAM() 
return self:FieldGet(#FERRAM)


assign FERRAM(uValue) 
self:FieldPut(#FERRAM, uValue)
return FERRAM := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jferESC",_GetInst()},iCtlID)

oDCSC_FERRAM := FixedText{self,ResourceID{JFERESC_SC_FERRAM,_GetInst()}}
oDCSC_FERRAM:HyperLabel := HyperLabel{#SC_FERRAM,"Ferram:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JFERESC_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCFERRAM := SingleLineEdit{self,ResourceID{JFERESC_FERRAM,_GetInst()}}
oDCFERRAM:HyperLabel := HyperLabel{#FERRAM,"Ferramenta:",NULL_STRING,"FERRAM_FERRAM"}

oDCNOME := SingleLineEdit{self,ResourceID{JFERESC_NOME,_GetInst()}}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"FERRAM_NOME"}

self:Caption := "Escolha Pesquisa"
self:HyperLabel := HyperLabel{#jferESC,"Escolha Pesquisa",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBFERRAM := DataColumn{37}
oDBFERRAM:Width := 37
oDBFERRAM:HyperLabel := oDCFERRAM:HyperLabel 
oDBFERRAM:Caption := "Ferramenta:"
self:Browser:AddColumn(oDBFERRAM)

oDBNOME := DataColumn{45}
oDBNOME:Width := 45
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


END CLASS
CLASS XESCfer INHERIT ESCfer
	EXPORT LOK AS LOGIC

METHOD Escolher( ) 
	SELF:NUMERO:=SELF:oSFJFERESC:SERVER:FIELDGET("FERRAM")
	SELF:NOME:=SELF:oSFJFERESC:SERVER:FIELDGET("NOME")
	LOK:=.T.
	SELF:EndWindow()

CONSTRUCTOR(oOWNER,cARQ,nORDER) 
LOCAL oSERVE2 AS USEREDE
LOCAL aDAD AS ARRAY
IF ValType(nORDER)#"N"
   nORDER:=2
ENDIF	
LOK:=.F.
aDAD:={zCURINI,cARQ,zCURDIR}
oSERVE2:=USEREDE{aDAD}
IF oSERVE2:nERRO#0
   RETU SELF
ENDIF
oSERVE2:SETORDER(nORDER)
oSERVE2:GOTOP()
SUPER(oOWNER)
SELF:oSFJferESC:USE(oSERVE2)
SELF:oSFjferesc:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()		

METHOD sair( ) 
	lok:=.f.
	SELF:EndWindow()


END CLASS
