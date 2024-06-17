#region DEFINES
STATIC DEFINE RONEW_CFERRAM := 115 
STATIC DEFINE RONEW_CMD01 := 101 
STATIC DEFINE RONEW_CMD02 := 103 
STATIC DEFINE RONEW_ESCFER := 105 
STATIC DEFINE RONEW_ESCME01 := 104 
STATIC DEFINE RONEW_FIXEDTEXT13 := 109 
STATIC DEFINE RONEW_FIXEDTEXT14 := 111 
STATIC DEFINE RONEW_GROUPBOX1 := 110 
STATIC DEFINE RONEW_NSM := 113 
STATIC DEFINE RONEW_PUSHBUTTON1 := 102 
STATIC DEFINE RONEW_TEXT1 := 112 
STATIC DEFINE RONEW_THEFIXEDTEXT1 := 114 
STATIC DEFINE RONEW_THEFIXEDTEXT10 := 100 
STATIC DEFINE RONEW_THEFIXEDTEXT9 := 102 
STATIC DEFINE RONEW_TIPO := 106 
STATIC DEFINE RONEW_TIPOFER := 107 
STATIC DEFINE RONEW_TIPOM := 108 
#endregion

class RONEW inherit DIALOGWINDOW 

	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCcmd01 as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCcmd02 as PUSHBUTTON
	protect oCCEscme01 as PUSHBUTTON
	protect oCCEscfer as PUSHBUTTON
	protect oDCTIPO as SINGLELINEEDIT
	protect oCCtipofer as PUSHBUTTON
	protect oCCtipom as PUSHBUTTON
	protect oDCFixedText13 as FIXEDTEXT
	protect oDCGroupBox1 as GROUPBOX
	protect oDCFixedText14 as FIXEDTEXT
	protect oDCText1 as FIXEDTEXT
	protect oDCnSM as SINGLELINEEDIT
	protect oDCtheFixedText1 as FIXEDTEXT
	protect oDCcFERRAM as SINGLELINEEDIT

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)
	
	EXPORT lOK AS LOGIC
	EXPORT nSM AS DWORD
	EXPORT cFERRAM AS STRING
	EXPORT cTIPO AS STRING

METHOD cmd01() 
lOK := .F.
IF IsNil(SELF:oDCnSM:VALUE)
   nSM:=0
ELSE
    nSM:=Val(SELF:oDCnSM:VALUE)
ENDIF
IF ! IsNumeric(nSM)
    nSM:=0
ENDIF
IF IsNil(SELF:oDCcFERRAM:VALUE)
   cFERRAM:=""
ELSE
    cFERRAM:=SELF:oDCcFERRAM:VALUE
ENDIF
IF IsNil(SELF:oDCTIPO:VALUE)
   cTIPO:=""
ELSE
    cTIPO:=SELF:oDCTIPO:VALUE
ENDIF

IF ! IsString(cFERRAM)
    cFERRAM:=""
ENDIF
IF ! IsString(cTIPO)
    cTIPO:=""
ENDIF
IF Empty(cFERRAM) .AND. nSM=0
   alert("Codigo da Ferramenta/Equipamento ou Numero Solicitação Não Preenchido")
   SELF:EndDialog()
ENDIF
IF ! Empty(cFERRAM) .AND. nSM>0
    alert("Preencha Codigo da Ferramenta/Equipamento ou Numero Solicitação")
    SELF:EndDialog()
ENDIF
IF ! Empty(cFERRAM) .AND. Empty(cTIPO)
    alert("Preencha o Tipo Ferramenta/Equipamento")
    SELF:EndDialog()	
ENDIF	
lOK:=.T.
SELF:EndDialog()

METHOD cmd02() 
lOK:=.F.
nSM:=0
cFERRAM:=""
cTIPO:=""
SELF:EndDialog()


METHOD escFER 
LOCAL oESC AS XESCFER
oESC:=XESCFER{SELF,"FERRAM.DBF",1}
oESC:SHOW()	
IF oESC:LOK
	SELF:oDCcFERRAM:TextValue:=oESC:NUMERO
//	SELF:oDCTIPO:TextValue:="F"	
	SELF:oDCTIPO:Value:="F"	
ENDIF


METHOD escME01 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"ME01.DBF"}
oESC:SHOW()	
IF oESC:LOK
	SELF:oDCcFERRAM:TextValue:=oESC:NUMERO
//	SELF:oDCTIPO:TextValue:="M"
	SELF:oDCTIPO:Value:="M"
ENDIF

CONSTRUCTOR(oParent,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"RONEW",_GetInst()},TRUE)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCtheFixedText10 := FixedText{self,ResourceID{RONEW_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCcmd01 := PushButton{self,ResourceID{RONEW_CMD01,_GetInst()}}
oCCcmd01:HyperLabel := HyperLabel{#cmd01,NULL_STRING,NULL_STRING,NULL_STRING}
oCCcmd01:Image := ico_ok{}
oCCcmd01:TooltipText := "Cria o Registro Ocorrencia"

oDCtheFixedText9 := FixedText{self,ResourceID{RONEW_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCcmd02 := PushButton{self,ResourceID{RONEW_CMD02,_GetInst()}}
oCCcmd02:HyperLabel := HyperLabel{#cmd02,NULL_STRING,NULL_STRING,NULL_STRING}
oCCcmd02:Image := ico_sair{}
oCCcmd02:TooltipText := "Retornar Sem Criar o Registro Ocorrencia"

oCCEscme01 := PushButton{self,ResourceID{RONEW_ESCME01,_GetInst()}}
oCCEscme01:HyperLabel := HyperLabel{#Escme01,"M...",NULL_STRING,NULL_STRING}
oCCEscme01:TooltipText := "Escolher Uma Maquina/Equipamento"

oCCEscfer := PushButton{self,ResourceID{RONEW_ESCFER,_GetInst()}}
oCCEscfer:HyperLabel := HyperLabel{#Escfer,"F...",NULL_STRING,NULL_STRING}
oCCEscfer:TooltipText := "Escolher Uma Ferramenta"

oDCTIPO := SingleLineEdit{self,ResourceID{RONEW_TIPO,_GetInst()}}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCTIPO:BackGround := aBrushes[1]
oDCTIPO:Font(aFonts[1], FALSE)

oCCtipofer := PushButton{self,ResourceID{RONEW_TIPOFER,_GetInst()}}
oCCtipofer:HyperLabel := HyperLabel{#tipofer,"F",NULL_STRING,NULL_STRING}
oCCtipofer:TooltipText := "Marca Tipo Ferramenta(F)"

oCCtipom := PushButton{self,ResourceID{RONEW_TIPOM,_GetInst()}}
oCCtipom:HyperLabel := HyperLabel{#tipom,"M",NULL_STRING,NULL_STRING}
oCCtipom:TooltipText := "Marca Tipo (M) Maquina/Equipamento"

oDCFixedText13 := FixedText{self,ResourceID{RONEW_FIXEDTEXT13,_GetInst()}}
oDCFixedText13:HyperLabel := HyperLabel{#FixedText13,"(M)áquina",NULL_STRING,NULL_STRING}

oDCGroupBox1 := GroupBox{self,ResourceID{RONEW_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Codigo",NULL_STRING,NULL_STRING}
oDCGroupBox1:TooltipText := "Origem da Ocorrencia"

oDCFixedText14 := FixedText{self,ResourceID{RONEW_FIXEDTEXT14,_GetInst()}}
oDCFixedText14:HyperLabel := HyperLabel{#FixedText14,"(F)erramenta",NULL_STRING,NULL_STRING}

oDCText1 := FixedText{self,ResourceID{RONEW_TEXT1,_GetInst()}}
oDCText1:HyperLabel := HyperLabel{#Text1,"Digite o Numero da SM:",NULL_STRING,NULL_STRING}

oDCnSM := SingleLineEdit{self,ResourceID{RONEW_NSM,_GetInst()}}
oDCnSM:HyperLabel := HyperLabel{#nSM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCnSM:TooltipText := "Numero da Solicitacao de Manutençao"

oDCtheFixedText1 := FixedText{self,ResourceID{RONEW_THEFIXEDTEXT1,_GetInst()}}
oDCtheFixedText1:HyperLabel := HyperLabel{#theFixedText1,"ou Codigo Maquina/Ferramenta para Preventiva",NULL_STRING,NULL_STRING}

oDCcFERRAM := SingleLineEdit{self,ResourceID{RONEW_CFERRAM,_GetInst()}}
oDCcFERRAM:HyperLabel := HyperLabel{#cFERRAM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCcFERRAM:TooltipText := "Codigo da Ferramenta/Maquina Equipamento"

self:Caption := "Novo Registro Ocorrencia"
self:HyperLabel := HyperLabel{#RONEW,"Novo Registro Ocorrencia",NULL_STRING,NULL_STRING}

self:PostInit(oParent,uExtra)

return self


METHOD PostInit(oParent,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


METHOD tipofer( ) 
		SELF:oDCTIPO:Value:="F"

METHOD tipom( ) 
		SELF:oDCTIPO:Value:="M"

END CLASS
