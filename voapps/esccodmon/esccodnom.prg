#region DEFINES
STATIC DEFINE ESCCOD_BUSCA := 102 
STATIC DEFINE ESCCOD_BUSCACOD := 109 
STATIC DEFINE ESCCOD_CBUSCA := 101 
STATIC DEFINE ESCCOD_ESCOLHER := 107 
STATIC DEFINE ESCCOD_JESCC := 100 
STATIC DEFINE ESCCOD_PUSHBUTTON4 := 110 
STATIC DEFINE ESCCOD_SAIR := 104 
STATIC DEFINE ESCCOD_THEFIXEDTEXT10 := 105 
STATIC DEFINE ESCCOD_THEFIXEDTEXT11 := 106 
STATIC DEFINE ESCCOD_THEFIXEDTEXT12 := 108 
STATIC DEFINE ESCCOD_THEFIXEDTEXT9 := 103 
STATIC DEFINE JESCC_BUSCANUM := 105 
STATIC DEFINE JESCC_CODIGO := 102 
STATIC DEFINE JESCC_NOME := 103 
STATIC DEFINE JESCC_PORNUM := 104 
STATIC DEFINE JESCC_SC_NOMTEC := 101 
STATIC DEFINE JESCC_SC_TECNICO := 100 
#endregion

class esccod inherit DATADIALOG 

	protect oDCCBUSCA as SINGLELINEEDIT
	protect oCCBusca as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCsair as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCEscolher as PUSHBUTTON
	protect oDCtheFixedText12 as FIXEDTEXT
	protect oCCBuscaCOD as PUSHBUTTON
	protect oCCPushButton4 as PUSHBUTTON
// 	instance CBUSCA 
	protect oSFjescC as jescC

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

  EXPORT CODIGO
  EXPORT NOME AS STRING

METHOD Busca( )  

METHOD BuscaCOD( )  

access CBUSCA() 
return self:FieldGet(#CBUSCA)


assign CBUSCA(uValue) 
self:FieldPut(#CBUSCA, uValue)
return CBUSCA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"esccod",_GetInst()},iCtlID)

oDCCBUSCA := SingleLineEdit{self,ResourceID{ESCCOD_CBUSCA,_GetInst()}}
oDCCBUSCA:HyperLabel := HyperLabel{#CBUSCA,NULL_STRING,NULL_STRING,NULL_STRING}

oCCBusca := PushButton{self,ResourceID{ESCCOD_BUSCA,_GetInst()}}
oCCBusca:Image := ICO_FIND{}
oCCBusca:HyperLabel := HyperLabel{#Busca,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{ESCCOD_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCsair := PushButton{self,ResourceID{ESCCOD_SAIR,_GetInst()}}
oCCsair:HyperLabel := HyperLabel{#sair,NULL_STRING,NULL_STRING,NULL_STRING}
oCCsair:Image := ICO_SAIR{}

oDCtheFixedText10 := FixedText{self,ResourceID{ESCCOD_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"Busca Nome",NULL_STRING,NULL_STRING}

oDCtheFixedText11 := FixedText{self,ResourceID{ESCCOD_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Escolher",NULL_STRING,NULL_STRING}

oCCEscolher := PushButton{self,ResourceID{ESCCOD_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,NULL_STRING,NULL_STRING,NULL_STRING}
oCCEscolher:Image := ICO_OK{}

oDCtheFixedText12 := FixedText{self,ResourceID{ESCCOD_THEFIXEDTEXT12,_GetInst()}}
oDCtheFixedText12:HyperLabel := HyperLabel{#theFixedText12,"Busca Codigo",NULL_STRING,NULL_STRING}

oCCBuscaCOD := PushButton{self,ResourceID{ESCCOD_BUSCACOD,_GetInst()}}
oCCBuscaCOD:Image := ICO_FIND{}
oCCBuscaCOD:HyperLabel := HyperLabel{#BuscaCOD,NULL_STRING,NULL_STRING,NULL_STRING}

oCCPushButton4 := PushButton{self,ResourceID{ESCCOD_PUSHBUTTON4,_GetInst()}}
oCCPushButton4:HyperLabel := HyperLabel{#PushButton4,"Busca Detalhada",NULL_STRING,NULL_STRING}

self:Caption := "Escolher"
self:HyperLabel := HyperLabel{#esccod,"Escolher",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjescC := jescC{self,ESCCOD_JESCC}
oSFjescC:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


METHOD PushButton4( ) 
	SELF:oSFjescC:KeyFind()

END CLASS
class jescc inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCSC_TECNICO as FIXEDTEXT
	protect oDCSC_NOMTEC as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
// 	instance CODIGO 
// 	instance NOME 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD buscanum( ) 
	SELF:KeyFind()
	

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()	

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jescc",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_TECNICO := FixedText{self,ResourceID{JESCC_SC_TECNICO,_GetInst()}}
oDCSC_TECNICO:HyperLabel := HyperLabel{#SC_TECNICO,"Codigo",NULL_STRING,NULL_STRING}

oDCSC_NOMTEC := FixedText{self,ResourceID{JESCC_SC_NOMTEC,_GetInst()}}
oDCSC_NOMTEC:HyperLabel := HyperLabel{#SC_NOMTEC,"Nome:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JESCC_CODIGO,_GetInst()}}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo",NULL_STRING,NULL_STRING}
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[1], FALSE)

oDCNOME := SingleLineEdit{self,ResourceID{JESCC_NOME,_GetInst()}}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,NULL_STRING}
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[1], FALSE)

oCCpornum := PushButton{self,ResourceID{JESCC_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

oCCbuscanum := PushButton{self,ResourceID{JESCC_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Clique Para Localizar Por Numero"

self:Caption := "Escolha Pesquisa"
self:HyperLabel := HyperLabel{#jescc,"Escolha Pesquisa",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{24}
oDBCODIGO:Width := 24
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{67}
oDBNOME:Width := 67
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


METHOD pornum( ) 
	SELF:KEYFIND()

END CLASS
CLASS XESCCOD INHERIT ESCCOD
	EXPORT LOK AS LOGIC
	EXPORT nORDER AS WORD

METHOD Busca( ) 
LOCAL eBUSCA
IF Empty(SELF:CBUSCA)
   RETURN SELF
ENDIF	
SELF:oSFjescC:Server:setorder(SELF:Norder)
IF ValType(SELF:OSFJESCC:SERVER:ORDERINFO(DBOI_KEYVAL))="N"
   eBUSCA:=Val(SELF:CBUSCA)
ELSE	
   EBUSCA:=	AllTrim(SELF:CBUSCA)
ENDIF
SELF:oSFjescC:Server:gotop()	
SELF:oSFjescC:SERVER:Seek(EBUSCA,.T.)
IF SELF:oSFjesCc:SERVER:EOF
   SELF:oSFjesCc:SERVER:GoTop()	
ENDIF	

METHOD Buscacod( ) 
LOCAL eBUSCA	
IF Empty(SELF:CBUSCA)
   RETURN SELF
ENDIF	
SELF:oSFjescC:Server:setorder(1)
AltD()
IF ValType(SELF:OSFJESCC:SERVER:ORDERINFO(DBOI_KEYVAL))="N"
   eBUSCA:=Val(SELF:CBUSCA)	
ELSE	
   EBUSCA:=	AllTrim(SELF:CBUSCA)
ENDIF
SELF:oSFjescC:Server:gotop()	
SELF:oSFjescC:SERVER:Seek(eBUSCA,.T.)
IF SELF:oSFjesCc:SERVER:EOF
   SELF:oSFjesCc:SERVER:GoTop()	
ENDIF	

METHOD Escolher( ) 
	SELF:CODIGO:=SELF:oSFJESCC:SERVER:FIELDGET("CODIGO")
	SELF:NOME:=SELF:oSFJESCC:SERVER:FIELDGET("NOME")
	LOK:=.T.
	SELF:EndWindow()

CONSTRUCTOR(oOWNER,cARQ,cBUSCA,nORDER,oSERVER) 
LOCAL oSERVE2 AS USEREDE
LOCAL aDAD AS ARRAY
IF ValType(nORDER)#"N"
   nORDER:=2	
ENDIF	
SELF:NORDER:=2
LOK:=.F.
IF ! Empty(cARQ)
   aDAD:={zCURINI,cARQ,zCURDIR}
   oSERVE2:=USEREDE{aDAD}
   IF oSERVE2:nERRO#0
      RETU SELF
   ENDIF
   SUPER(oOWNER)
   SELF:oSFJESCC:USE(oSERVE2)
ELSE
   oSERVER:SETORDER(nORDER)
   SUPER(oOWNER)
   SELF:oSFJESCC:USE(oSERVER)
ENDIF
SELF:oSFjescC:SERVER:SETORDER(nORDER)
SELF:oSFjescC:SERVER:GOTOP()
IF ValType(cBUSCA)="C"
   SELF:oSFJESCC:SERVER:SEEK(cBUSCA)
   IF SELF:oSFjescC:server:eof
   	  SELF:oSFjescC:SERVER:GOTOP()
   ENDIF	
ENDIF	
SELF:oSFjescC:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()		


METHOD sair( ) 
	lok:=.f.
	SELF:EndWindow()


END CLASS
