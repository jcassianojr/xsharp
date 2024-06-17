#region DEFINES
STATIC DEFINE JWREL_CHKATIVOS := 116 
STATIC DEFINE JWREL_CHKEXP := 113 
STATIC DEFINE JWREL_CMDBCO := 114 
STATIC DEFINE JWREL_CMDBCO1 := 117 
STATIC DEFINE JWREL_CMDCANCEL := 101 
STATIC DEFINE JWREL_DFIM := 103 
STATIC DEFINE JWREL_DINI := 104 
STATIC DEFINE JWREL_FFIM := 107 
STATIC DEFINE JWREL_FINI := 106 
STATIC DEFINE JWREL_LAYOUT := 115 
STATIC DEFINE JWREL_PER := 102 
STATIC DEFINE JWREL_PER1 := 105 
STATIC DEFINE JWREL_PER2 := 108 
STATIC DEFINE JWREL_PUSHBUTTON1 := 100 
STATIC DEFINE JWREL_REL01 := 109 
STATIC DEFINE JWREL_REL02 := 110 
STATIC DEFINE JWREL_REL03 := 111 
STATIC DEFINE JWREL_REL04 := 112 
STATIC DEFINE JWREL_TIPOCRE := 118 
STATIC DEFINE JWREL_TIPOENTSAI := 119 
#endregion

class jwrel inherit DATADIALOG 

	protect oCCPushButton1 as PUSHBUTTON
	protect oCCcmdcancel as PUSHBUTTON
	protect oDCper as FIXEDTEXT
	protect oDCDFIM as DATESLE
	protect oDCDINI as DATESLE
	protect oDCper1 as FIXEDTEXT
	protect oDCFINI as RIGHTSLE
	protect oDCFFIM as RIGHTSLE
	protect oDCper2 as FIXEDTEXT
	protect oDCREL01 as RIGHTSLE
	protect oDCREL02 as RIGHTSLE
	protect oDCREL03 as RIGHTSLE
	protect oDCREL04 as RIGHTSLE
	protect oDCchkexp as CHECKBOX
	protect oCCcmdbco as PUSHBUTTON
	protect oDCLAYOUT as SINGLELINEEDIT
	protect oDCchkativos as CHECKBOX
	protect oCCcmdbco1 as PUSHBUTTON
	protect oDCTIPOCRE as SINGLELINEEDIT
	protect oDCTipoEntSai as CHECKBOX
// 	instance DFIM 
// 	instance DINI 
// 	instance FINI 
// 	instance FFIM 
// 	instance REL01 
// 	instance REL02 
// 	instance REL03 
// 	instance REL04 
// 	instance chkexp 
// 	instance LAYOUT 
// 	instance chkativos 
// 	instance TIPOCRE 
// 	instance TipoEntSai 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)


  EXPORT lOK AS LOGIC
  EXPORT dINICIO AS DATE
  EXPORT dFINAL AS DATE
  EXPORT nFUNINI AS DWORD
  EXPORT nFUNFIM AS DWORD
  EXPORT nREL01 AS DWORD
  EXPORT nREL02 AS DWORD
  EXPORT nREL03 AS DWORD
  EXPORT nREL04 AS DWORD
  EXPORT lEXPORT AS LOGIC
  EXPORT lMOVENTSAI AS LOGIC
  EXPORT lATIVOS AS LOGIC
  EXPORT cLAYOUT AS STRING
  EXPORT cTIPOCRE AS STRING

access chkativos() 
return self:FieldGet(#chkativos)


assign chkativos(uValue) 
self:FieldPut(#chkativos, uValue)
return chkativos := uValue


access chkexp() 
return self:FieldGet(#chkexp)


assign chkexp(uValue) 
self:FieldPut(#chkexp, uValue)
return chkexp := uValue


METHOD cmdbco( ) 
  LOCAL cLAYOUT
  cLAYOUT:=SELF:LAYOUT
  cLAYOUT:=SIMNAO(clayout,{"A","B","C"})
  SELF:LAYOUT:=CLAYOUT
//  SELF:LAYOUT:TEXT:=SIMNAO(,{"C","D"}))	

METHOD cmdbco1( ) 
LOCAL cTIPOCRE
  cTIPOCRE:=SELF:TIPOCRE
  cTIPOCRE:=SIMNAO(cTIPOCRE,{"C","N"})
  SELF:TIPOCRE:=CTIPOCRE


METHOD cmdcancel( ) 
	SELF:EndWindow()

access DFIM() 
return self:FieldGet(#DFIM)


assign DFIM(uValue) 
self:FieldPut(#DFIM, uValue)
return DFIM := uValue


access DINI() 
return self:FieldGet(#DINI)


assign DINI(uValue) 
self:FieldPut(#DINI, uValue)
return DINI := uValue


access FFIM() 
return self:FieldGet(#FFIM)


assign FFIM(uValue) 
self:FieldPut(#FFIM, uValue)
return FFIM := uValue


access FINI() 
return self:FieldGet(#FINI)


assign FINI(uValue) 
self:FieldPut(#FINI, uValue)
return FINI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jwrel",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oCCPushButton1 := PushButton{self,ResourceID{JWREL_PUSHBUTTON1,_GetInst()}}
oCCPushButton1:HyperLabel := HyperLabel{#PushButton1,"OK",NULL_STRING,NULL_STRING}

oCCcmdcancel := PushButton{self,ResourceID{JWREL_CMDCANCEL,_GetInst()}}
oCCcmdcancel:HyperLabel := HyperLabel{#cmdcancel,"Cancela",NULL_STRING,NULL_STRING}

oDCper := FixedText{self,ResourceID{JWREL_PER,_GetInst()}}
oDCper:HyperLabel := HyperLabel{#per,"Periodo",NULL_STRING,NULL_STRING}

oDCDFIM := DateSle{self,ResourceID{JWREL_DFIM,_GetInst()}}
oDCDFIM:FieldSpec := DATE_FIELD{}
oDCDFIM:HyperLabel := HyperLabel{#DFIM,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDINI := DateSle{self,ResourceID{JWREL_DINI,_GetInst()}}
oDCDINI:FieldSpec := DATE_FIELD{}
oDCDINI:HyperLabel := HyperLabel{#DINI,NULL_STRING,NULL_STRING,NULL_STRING}

oDCper1 := FixedText{self,ResourceID{JWREL_PER1,_GetInst()}}
oDCper1:HyperLabel := HyperLabel{#per1,"Funcionario",NULL_STRING,NULL_STRING}

oDCFINI := rightSLE{self,ResourceID{JWREL_FINI,_GetInst()}}
oDCFINI:FieldSpec := PADRAO_NUM_08{}
oDCFINI:HyperLabel := HyperLabel{#FINI,NULL_STRING,NULL_STRING,NULL_STRING}
oDCFINI:FocusSelect := FSEL_ALL

oDCFFIM := rightSLE{self,ResourceID{JWREL_FFIM,_GetInst()}}
oDCFFIM:FieldSpec := PADRAO_NUM_08{}
oDCFFIM:HyperLabel := HyperLabel{#FFIM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCFFIM:FocusSelect := FSEL_ALL

oDCper2 := FixedText{self,ResourceID{JWREL_PER2,_GetInst()}}
oDCper2:HyperLabel := HyperLabel{#per2,"Relogios",NULL_STRING,NULL_STRING}

oDCREL01 := rightSLE{self,ResourceID{JWREL_REL01,_GetInst()}}
oDCREL01:FieldSpec := PADRAO_NUM_04{}
oDCREL01:HyperLabel := HyperLabel{#REL01,NULL_STRING,NULL_STRING,NULL_STRING}
oDCREL01:FocusSelect := FSEL_ALL

oDCREL02 := rightSLE{self,ResourceID{JWREL_REL02,_GetInst()}}
oDCREL02:FieldSpec := PADRAO_NUM_04{}
oDCREL02:HyperLabel := HyperLabel{#REL02,NULL_STRING,NULL_STRING,NULL_STRING}
oDCREL02:FocusSelect := FSEL_ALL

oDCREL03 := rightSLE{self,ResourceID{JWREL_REL03,_GetInst()}}
oDCREL03:FieldSpec := PADRAO_NUM_04{}
oDCREL03:HyperLabel := HyperLabel{#REL03,NULL_STRING,NULL_STRING,NULL_STRING}
oDCREL03:FocusSelect := FSEL_ALL

oDCREL04 := rightSLE{self,ResourceID{JWREL_REL04,_GetInst()}}
oDCREL04:FieldSpec := PADRAO_NUM_04{}
oDCREL04:HyperLabel := HyperLabel{#REL04,NULL_STRING,NULL_STRING,NULL_STRING}
oDCREL04:FocusSelect := FSEL_ALL

oDCchkexp := CheckBox{self,ResourceID{JWREL_CHKEXP,_GetInst()}}
oDCchkexp:HyperLabel := HyperLabel{#chkexp,"Exportar ",NULL_STRING,NULL_STRING}

oCCcmdbco := PushButton{self,ResourceID{JWREL_CMDBCO,_GetInst()}}
oCCcmdbco:HyperLabel := HyperLabel{#cmdbco,"Layout A/B/C",NULL_STRING,NULL_STRING}

oDCLAYOUT := SingleLineEdit{self,ResourceID{JWREL_LAYOUT,_GetInst()}}
oDCLAYOUT:FieldSpec := PADRAO_CHAR_01{}
oDCLAYOUT:HyperLabel := HyperLabel{#LAYOUT,"Bcosn:",NULL_STRING,"FOPTOEVE_BCOSN"}
oDCLAYOUT:TooltipText := "Banco Horas Sim/Nao"
oDCLAYOUT:BackGround := aBrushes[1]

oDCchkativos := CheckBox{self,ResourceID{JWREL_CHKATIVOS,_GetInst()}}
oDCchkativos:HyperLabel := HyperLabel{#chkativos,"Somente Funcionarios Da Empresa em Uso",NULL_STRING,NULL_STRING}

oCCcmdbco1 := PushButton{self,ResourceID{JWREL_CMDBCO1,_GetInst()}}
oCCcmdbco1:HyperLabel := HyperLabel{#cmdbco1,"(C)redencial(N)umero",NULL_STRING,NULL_STRING}

oDCTIPOCRE := SingleLineEdit{self,ResourceID{JWREL_TIPOCRE,_GetInst()}}
oDCTIPOCRE:FieldSpec := PADRAO_CHAR_01{}
oDCTIPOCRE:HyperLabel := HyperLabel{#TIPOCRE,"Bcosn:",NULL_STRING,"FOPTOEVE_BCOSN"}
oDCTIPOCRE:TooltipText := "Banco Horas Sim/Nao"
oDCTIPOCRE:BackGround := aBrushes[1]

oDCTipoEntSai := CheckBox{self,ResourceID{JWREL_TIPOENTSAI,_GetInst()}}
oDCTipoEntSai:HyperLabel := HyperLabel{#TipoEntSai,"Somente Exportar Entradas",NULL_STRING,NULL_STRING}

self:Caption := "DataDialog Caption"
self:HyperLabel := HyperLabel{#jwrel,"DataDialog Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LAYOUT() 
return self:FieldGet(#LAYOUT)


assign LAYOUT(uValue) 
self:FieldPut(#LAYOUT, uValue)
return LAYOUT := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	LOCAL aRETU AS ARRAY
	//Put your PostInit additions here
	SELF:LOK:=.F.	
    aRETU:=pegcomp()
    DINI:=ARETU[1]
    DFIM:=ARETU[2]
    SELF:FINI:=1
    SELF:FFIM:=99999999
    SELF:LAYOUT:="A"
    SELF:TIPOCRE:="N"
    SELF:chkativos:=.T.
 FabCenterWindow( SELF )
	RETURN NIL


METHOD PushButton1( ) 
	SELF:LOK:=.T.
	SELF:dINICIO:=CToD(SELF:oDCDINI:TEXTVALUE)
    SELF:DFINAL:=CToD(SELF:oDCDFIM:TEXTVALUE)
    SELF:nFUNFIM:=SELF:FFIM
    SELF:NFUNINI:=SELF:FINI
    SELF:NREL01:=SELF:REL01
    SELF:NREL02:=SELF:REL02
    SELF:NREL03:=SELF:REL03
    SELF:NREL04:=SELF:REL04
    SELF:LEXPORT:=SELF:chkexp
    SELF:lMOVENTSAI:=SELF:TipoEntSai
    SELF:CLAYOUT:=SELF:LAYOUT
    SELF:CTIPOCRE:=SELF:TIPOCRE
    SELF:LATIVOS:=SELF:chkativos
	SELF:EndWindow()

access REL01() 
return self:FieldGet(#REL01)


assign REL01(uValue) 
self:FieldPut(#REL01, uValue)
return REL01 := uValue


access REL02() 
return self:FieldGet(#REL02)


assign REL02(uValue) 
self:FieldPut(#REL02, uValue)
return REL02 := uValue


access REL03() 
return self:FieldGet(#REL03)


assign REL03(uValue) 
self:FieldPut(#REL03, uValue)
return REL03 := uValue


access REL04() 
return self:FieldGet(#REL04)


assign REL04(uValue) 
self:FieldPut(#REL04, uValue)
return REL04 := uValue


METHOD relogios(aREL) 
SELF:REL01:=aREL[1]	
SELF:REL02:=aREL[2]	
SELF:REL03:=aREL[3]	
SELF:REL04:=aREL[4]	

access TIPOCRE() 
return self:FieldGet(#TIPOCRE)


assign TIPOCRE(uValue) 
self:FieldPut(#TIPOCRE, uValue)
return TIPOCRE := uValue


access TipoEntSai() 
return self:FieldGet(#TipoEntSai)


assign TipoEntSai(uValue) 
self:FieldPut(#TipoEntSai, uValue)
return TipoEntSai := uValue


END CLASS
