#region DEFINES
STATIC DEFINE ESCFO_TAB_BUSCACOD := 103 
STATIC DEFINE ESCFO_TAB_ESCOLHER := 104 
STATIC DEFINE ESCFO_TAB_JFO_TAB := 102 
STATIC DEFINE ESCFO_TAB_SAIR := 105 
STATIC DEFINE ESCFO_TAB_THEFIXEDTEXT11 := 101 
STATIC DEFINE ESCFO_TAB_THEFIXEDTEXT9 := 100 
STATIC DEFINE JFO_TAB_CODIG2 := 107 
STATIC DEFINE JFO_TAB_CODIGO := 106 
STATIC DEFINE JFO_TAB_DESCRI := 108 
STATIC DEFINE JFO_TAB_SC_CODIG2 := 102 
STATIC DEFINE JFO_TAB_SC_CODIGO := 101 
STATIC DEFINE JFO_TAB_SC_DESCRI := 103 
STATIC DEFINE JFO_TAB_SC_TABELA := 100 
STATIC DEFINE JFO_TAB_SC_VALOR := 104 
STATIC DEFINE JFO_TAB_TABELA := 105 
STATIC DEFINE JFO_TAB_VALOR := 109 
STATIC DEFINE XESCFO_TAB_BUSCACOD := 104 
STATIC DEFINE XESCFO_TAB_ESCOLHER := 103 
STATIC DEFINE XESCFO_TAB_JFO_TAB := 105 
STATIC DEFINE XESCFO_TAB_SAIR := 102 
STATIC DEFINE XESCFO_TAB_THEFIXEDTEXT11 := 101 
STATIC DEFINE XESCFO_TAB_THEFIXEDTEXT9 := 100 
#endregion

class escfo_tab inherit DATADIALOG 

	protect oDCtheFixedText9 as FIXEDTEXT
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCBuscaCOD as PUSHBUTTON
	protect oCCEscolher as PUSHBUTTON
	protect oCCsair as PUSHBUTTON
	protect oSFjfo_tab as jfo_tab

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD BuscaCOD( ) 
	SELF:oSFjfo_tab:KeyFind()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"escfo_tab",_GetInst()},iCtlID)

oDCtheFixedText9 := FixedText{self,ResourceID{ESCFO_TAB_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oDCtheFixedText11 := FixedText{self,ResourceID{ESCFO_TAB_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Escolher",NULL_STRING,NULL_STRING}

oCCBuscaCOD := PushButton{self,ResourceID{ESCFO_TAB_BUSCACOD,_GetInst()}}
oCCBuscaCOD:Image := ICO_FIND{}
oCCBuscaCOD:HyperLabel := HyperLabel{#BuscaCOD,NULL_STRING,NULL_STRING,NULL_STRING}

oCCEscolher := PushButton{self,ResourceID{ESCFO_TAB_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,NULL_STRING,NULL_STRING,NULL_STRING}
oCCEscolher:Image := ICO_OK{}

oCCsair := PushButton{self,ResourceID{ESCFO_TAB_SAIR,_GetInst()}}
oCCsair:HyperLabel := HyperLabel{#sair,NULL_STRING,NULL_STRING,NULL_STRING}
oCCsair:Image := ICO_SAIR{}

self:Caption := "DataDialog Caption"
self:HyperLabel := HyperLabel{#escfo_tab,"DataDialog Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFjfo_tab := jfo_tab{self,ESCFO_TAB_JFO_TAB}
oSFjfo_tab:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	FabCenterWindow( SELF )
	RETURN NIL


END CLASS
class jfo_tab inherit MYDataWindow 

	PROTECT oDBTABELA as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBCODIG2 as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBVALOR as DataColumn
	protect oDCSC_TABELA as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_CODIG2 as FIXEDTEXT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCSC_VALOR as FIXEDTEXT
	protect oDCTABELA as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCCODIG2 as SINGLELINEEDIT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCVALOR as SINGLELINEEDIT
// 	instance TABELA 
// 	instance CODIGO 
// 	instance CODIG2 
// 	instance DESCRI 
// 	instance VALOR 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIG2() 
return self:FieldGet(#CODIG2)


assign CODIG2(uValue) 
self:FieldPut(#CODIG2, uValue)
return CODIG2 := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jfo_tab",_GetInst()},iCtlID)

oDCSC_TABELA := FixedText{self,ResourceID{JFO_TAB_SC_TABELA,_GetInst()}}
oDCSC_TABELA:HyperLabel := HyperLabel{#SC_TABELA,"Tabela:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JFO_TAB_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_CODIG2 := FixedText{self,ResourceID{JFO_TAB_SC_CODIG2,_GetInst()}}
oDCSC_CODIG2:HyperLabel := HyperLabel{#SC_CODIG2,"SubCod",NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{self,ResourceID{JFO_TAB_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição",NULL_STRING,NULL_STRING}

oDCSC_VALOR := FixedText{self,ResourceID{JFO_TAB_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor:",NULL_STRING,NULL_STRING}

oDCTABELA := SingleLineEdit{self,ResourceID{JFO_TAB_TABELA,_GetInst()}}
oDCTABELA:FieldSpec := padrao_char_04{}
oDCTABELA:HyperLabel := HyperLabel{#TABELA,"Tabela:",NULL_STRING,"fo_tab_TABELA"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JFO_TAB_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_05{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"fo_tab_CODIGO"}

oDCCODIG2 := SingleLineEdit{self,ResourceID{JFO_TAB_CODIG2,_GetInst()}}
oDCCODIG2:FieldSpec := PADRAO_CHAR_05{}
oDCCODIG2:HyperLabel := HyperLabel{#CODIG2,"Codig2:",NULL_STRING,"fo_tab_CODIG2"}

oDCDESCRI := SingleLineEdit{self,ResourceID{JFO_TAB_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_70{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descri:",NULL_STRING,"fo_tab_DESCRI"}

oDCVALOR := SingleLineEdit{self,ResourceID{JFO_TAB_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := PADRAO_num_12_6{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Valor:",NULL_STRING,"fo_tab_VALOR"}

self:Caption := "Tabelas Diversas"
self:HyperLabel := HyperLabel{#jfo_tab,"Tabelas Diversas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTABELA := DataColumn{padrao_char_04{}}
oDBTABELA:Width := 8
oDBTABELA:HyperLabel := oDCTABELA:HyperLabel 
oDBTABELA:Caption := "Tabela:"
self:Browser:AddColumn(oDBTABELA)

oDBCODIGO := DataColumn{PADRAO_CHAR_05{}}
oDBCODIGO:Width := 8
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBCODIG2 := DataColumn{PADRAO_CHAR_05{}}
oDBCODIG2:Width := 8
oDBCODIG2:HyperLabel := oDCCODIG2:HyperLabel 
oDBCODIG2:Caption := "Codig2:"
self:Browser:AddColumn(oDBCODIG2)

oDBDESCRI := DataColumn{PADRAO_CHAR_70{}}
oDBDESCRI:Width := 48
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descri:"
self:Browser:AddColumn(oDBDESCRI)

oDBVALOR := DataColumn{PADRAO_num_12_6{}}
oDBVALOR:Width := 15
oDBVALOR:HyperLabel := oDCVALOR:HyperLabel 
oDBVALOR:Caption := "Valor:"
self:Browser:AddColumn(oDBVALOR)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access TABELA() 
return self:FieldGet(#TABELA)


assign TABELA(uValue) 
self:FieldPut(#TABELA, uValue)
return TABELA := uValue


access VALOR() 
return self:FieldGet(#VALOR)


assign VALOR(uValue) 
self:FieldPut(#VALOR, uValue)
return VALOR := uValue


END CLASS
CLASS Xescfo_tab INHERIT ESCfo_tab
	EXPORT LOK AS LOGIC
	EXPORT cCODIGO AS STRING
	EXPORT cNOME AS STRING

METHOD Escolher( ) 
	CCODIGO:=SELF:oSFJFO_TAB:SERVER:FIELDGET("CODIGO")
	CNOME:=SELF:oSFJFO_TAB:SERVER:FIELDGET("DESCRI")
	LOK:=.T.
	SELF:EndWindow()

CONSTRUCTOR(oOWNER,cTAB,cBUSCA) 
LOCAL oSERVER AS USEFOLHA
LOCAL cFILTRO AS STRING
LOK:=.F.
cCODIGO:=""
cNOME:=""
AltD()
oSERVER:=USEFOLHA{"FO_TAB"}
IF oSERVER:nERRO#0
   RETU SELF
ENDIF
cFILTRO:="TABELA='"+cTAB+"'"
oSERVER:SetFilter(cFILTRO)
//oSERVER:OrderBottomScope(cTAB)
//OSERVER:ORDERTOPSCOPE(cTAB+"ZZZZZ")
SUPER(oOWNER)
SELF:oSFjfo_tab:USE(oSERVER)
SELF:oSFjfo_tab:SERVER:GOTOP()
IF ValType(cBUSCA)="C"
   SELF:oSFjfo_tab:SERVER:SEEK(cTAB+cBUSCA)
   IF SELF:oSFjfo_tab:server:eof
   	  SELF:oSFjfo_tab:SERVER:GOTOP()
   ENDIF	
ENDIF	
SELF:oSFjfo_tab:viewtable()
SELF:oSFjfo_tab:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()			

METHOD sair( ) 
	lok:=.f.
	cCODIGO:=""
	cNOME:=""
	SELF:EndWindow()


END CLASS
