#region DEFINES
STATIC DEFINE ESCNUM_BUSCA := 102 
STATIC DEFINE ESCNUM_CBUSCA := 101 
STATIC DEFINE ESCNUM_ESCOLHER := 105 
STATIC DEFINE ESCNUM_JESC := 100 
STATIC DEFINE ESCNUM_PUSHBUTTON4 := 107 
STATIC DEFINE ESCNUM_SAIR := 104 
STATIC DEFINE ESCNUM_THEFIXEDTEXT11 := 106 
STATIC DEFINE ESCNUM_THEFIXEDTEXT9 := 103 
STATIC DEFINE JESC_NOME := 103 
STATIC DEFINE JESC_NUMERO := 102 
STATIC DEFINE JESC_SC_NOMTEC := 101 
STATIC DEFINE JESC_SC_TECNICO := 100 
#endregion

class escnum inherit DATADIALOG 

	protect oDCCBUSCA as SINGLELINEEDIT
	protect oCCBusca as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCsair as PUSHBUTTON
	protect oCCEscolher as PUSHBUTTON
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCPushButton4 as PUSHBUTTON
// 	instance CBUSCA 
	protect oSFjesc as jesc

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

  EXPORT NUMERO
  EXPORT NOME AS STRING

METHOD Busca( ) 
IF Empty(SELF:CBUSCA)
	RETURN SELF
ENDIF	
SELF:oSFjesc:Server:gotop()	
SELF:oSFjesc:SERVER:Seek(AllTrim(SELF:CBUSCA),.T.)
IF SELF:oSFjesc:SERVER:EOF
   SELF:oSFjesc:SERVER:GoTop()	
ENDIF	

access CBUSCA() 
return self:FieldGet(#CBUSCA)


assign CBUSCA(uValue) 
self:FieldPut(#CBUSCA, uValue)
return CBUSCA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"escnum",_GetInst()},iCtlID)

oDCCBUSCA := SingleLineEdit{self,ResourceID{ESCNUM_CBUSCA,_GetInst()}}
oDCCBUSCA:HyperLabel := HyperLabel{#CBUSCA,NULL_STRING,NULL_STRING,NULL_STRING}

oCCBusca := PushButton{self,ResourceID{ESCNUM_BUSCA,_GetInst()}}
oCCBusca:Image := ICO_FIND{}
oCCBusca:HyperLabel := HyperLabel{#Busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{ESCNUM_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCsair := PushButton{self,ResourceID{ESCNUM_SAIR,_GetInst()}}
oCCsair:HyperLabel := HyperLabel{#sair,NULL_STRING,NULL_STRING,NULL_STRING}
oCCsair:Image := ICO_SAIR{}

oCCEscolher := PushButton{self,ResourceID{ESCNUM_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,NULL_STRING,NULL_STRING,NULL_STRING}
oCCEscolher:Image := ICO_OK{}

oDCtheFixedText11 := FixedText{self,ResourceID{ESCNUM_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Escolher",NULL_STRING,NULL_STRING}

oCCPushButton4 := PushButton{self,ResourceID{ESCNUM_PUSHBUTTON4,_GetInst()}}
oCCPushButton4:HyperLabel := HyperLabel{#PushButton4,"Busca Detalhada",NULL_STRING,NULL_STRING}

self:Caption := "Escolher"
self:HyperLabel := HyperLabel{#escnum,"Escolher",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjesc := jesc{self,ESCNUM_JESC}
oSFjesc:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	SELF:oSFjesc:Browser:SetStandardStyle(gBsreadonly)
	 FabCenterWindow( SELF )
	RETURN NIL


METHOD PushButton4( ) 
SELF:oSFjesc:KeyFind()

END CLASS
class jesc inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCSC_TECNICO as FIXEDTEXT
	protect oDCSC_NOMTEC as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
// 	instance NUMERO 
// 	instance NOME 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jesc",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_TECNICO := FixedText{self,ResourceID{JESC_SC_TECNICO,_GetInst()}}
oDCSC_TECNICO:HyperLabel := HyperLabel{#SC_TECNICO,"No.",NULL_STRING,NULL_STRING}

oDCSC_NOMTEC := FixedText{self,ResourceID{JESC_SC_NOMTEC,_GetInst()}}
oDCSC_NOMTEC:HyperLabel := HyperLabel{#SC_NOMTEC,"Descrição/Nome:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JESC_NUMERO,_GetInst()}}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"No.",NULL_STRING,NULL_STRING}
oDCNUMERO:BackGround := aBrushes[1]

oDCNOME := SingleLineEdit{self,ResourceID{JESC_NOME,_GetInst()}}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome/Descrição:",NULL_STRING,NULL_STRING}

self:Caption := "Escolha Pesquisa"
self:HyperLabel := HyperLabel{#jesc,"Escolha Pesquisa",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{11}
oDBNUMERO:Width := 11
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "No."
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBNOME := DataColumn{67}
oDBNOME:Width := 67
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome/Descrição:"
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


END CLASS
CLASS XESCNUM INHERIT ESCNUM
	EXPORT LOK AS LOGIC

METHOD Escolher( ) 
	SELF:NUMERO:=SELF:oSFJESC:SERVER:FIELDGET("NUMERO")
	SELF:NOME:=SELF:oSFJESC:SERVER:FIELDGET("NOME")
	LOK:=.T.
	SELF:EndWindow()

CONSTRUCTOR(oOWNER,cARQ,nORDER,oSERVER) 
LOCAL oSERVE2 AS USEREDE
LOCAL aDAD AS ARRAY
IF ValType(nORDER)#"N"
   nORDER:=2
ENDIF	
LOK:=.F.
IF ! Empty(cARQ)
   aDAD:={zCURINI,cARQ,zCURDIR}
   oSERVE2:=USEREDE{aDAD}
   IF oSERVE2:nERRO#0
      RETU SELF
   ENDIF
   oSERVE2:SETORDER(nORDER)
   oSERVE2:GOTOP()
   SUPER(oOWNER)
   SELF:oSFJESC:USE(oSERVE2)
   SELF:SHOW()		
ELSE
   oSERVER:SETORDER(nORDER)
   SUPER(oOWNER)
   SELF:oSFJESC:USE(oSERVER)
   SELF:SHOW()				
ENDIF


METHOD sair( ) 
	lok:=.f.
	SELF:EndWindow()


END CLASS
