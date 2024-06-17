#region DEFINES
STATIC DEFINE JSOM_ANOFIM := 103 
STATIC DEFINE JSOM_ANOINI := 101 
STATIC DEFINE JSOM_ARQUSO := 121 
STATIC DEFINE JSOM_ATUAL := 105 
STATIC DEFINE JSOM_BAIXADO := 106 
STATIC DEFINE JSOM_CAMDA2 := 118 
STATIC DEFINE JSOM_CAMDAT := 119 
STATIC DEFINE JSOM_CANCELAR := 112 
STATIC DEFINE JSOM_CARQACU := 113 
STATIC DEFINE JSOM_CARQBAI := 115 
STATIC DEFINE JSOM_CARQFEC := 114 
STATIC DEFINE JSOM_CARQUSO := 116 
STATIC DEFINE JSOM_CMDMAIS := 123 
STATIC DEFINE JSOM_CMDMAIS1 := 127 
STATIC DEFINE JSOM_CMDMAIS2 := 129 
STATIC DEFINE JSOM_CMDMAIS3 := 131 
STATIC DEFINE JSOM_CMDMENOS := 122 
STATIC DEFINE JSOM_CMDMENOS1 := 126 
STATIC DEFINE JSOM_CMDMENOS2 := 128 
STATIC DEFINE JSOM_CMDMENOS3 := 130 
STATIC DEFINE JSOM_CMDMENOS4 := 132 
STATIC DEFINE JSOM_CMDMESMOANO := 137 
STATIC DEFINE JSOM_FIXEDTEXT1 := 125 
STATIC DEFINE JSOM_FIXEDTEXT10 := 136 
STATIC DEFINE JSOM_FIXEDTEXT2 := 108 
STATIC DEFINE JSOM_FIXEDTEXT3 := 109 
STATIC DEFINE JSOM_FIXEDTEXT5 := 124 
STATIC DEFINE JSOM_FIXEDTEXT6 := 117 
STATIC DEFINE JSOM_FIXEDTEXT9 := 135 
STATIC DEFINE JSOM_INCPER := 104 
STATIC DEFINE JSOM_MES01 := 133 
STATIC DEFINE JSOM_MESFIM := 102 
STATIC DEFINE JSOM_MESINI := 100 
STATIC DEFINE JSOM_OK := 107 
STATIC DEFINE JSOM_PROGBAR := 134 
STATIC DEFINE JSOM_REGISTRO := 120 
STATIC DEFINE JSOM_THEFIXEDTEXT10 := 110 
STATIC DEFINE JSOM_THEFIXEDTEXT9 := 111 
#endregion

class JSOM inherit DATADIALOG 

	protect oDCmesini as SINGLELINEEDIT
	protect oDCanoini as SINGLELINEEDIT
	protect oDCmesfim as SINGLELINEEDIT
	protect oDCanofim as SINGLELINEEDIT
	protect oDCINCPER as CHECKBOX
	protect oDCAtual as CHECKBOX
	protect oDCBaixado as CHECKBOX
	protect oCCOK as PUSHBUTTON
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCFixedText3 as FIXEDTEXT
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCcarqacu as SINGLELINEEDIT
	protect oDCcarqfec as SINGLELINEEDIT
	protect oDCcarqbai as SINGLELINEEDIT
	protect oDCcarquso as SINGLELINEEDIT
	protect oDCFixedText6 as FIXEDTEXT
	protect oDCCAMDA2 as SINGLELINEEDIT
	protect oDCCAMDAT as SINGLELINEEDIT
	protect oDCregistro as FIXEDTEXT
	protect oDCarquso as FIXEDTEXT
	protect oCCcmdmenos as PUSHBUTTON
	protect oCCcmdmais as PUSHBUTTON
	protect oDCFixedText5 as FIXEDTEXT
	protect oDCFixedText1 as FIXEDTEXT
	protect oCCcmdmenos1 as PUSHBUTTON
	protect oCCcmdmais1 as PUSHBUTTON
	protect oCCcmdmenos2 as PUSHBUTTON
	protect oCCcmdmais2 as PUSHBUTTON
	protect oCCcmdmenos3 as PUSHBUTTON
	protect oCCcmdmais3 as PUSHBUTTON
	protect oCCcmdmenos4 as PUSHBUTTON
	protect oCCmes01 as PUSHBUTTON
	protect oDCProgBar as PROGRESSBAR
	protect oDCFixedText9 as FIXEDTEXT
	protect oDCFixedText10 as FIXEDTEXT
	protect oCCcmdmesmoano as PUSHBUTTON
// 	instance mesini 
// 	instance anoini 
// 	instance mesfim 
// 	instance anofim 
// 	instance INCPER 
// 	instance Atual 
// 	instance Baixado 
// 	instance carqacu 
// 	instance carqfec 
// 	instance carqbai 
// 	instance carquso 
// 	instance CAMDA2 
// 	instance CAMDAT 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)


  EXPORT oARQACU AS USEMANA5

access anofim() 
return self:FieldGet(#anofim)


assign anofim(uValue) 
self:FieldPut(#anofim, uValue)
return anofim := uValue


access anoini() 
return self:FieldGet(#anoini)


assign anoini(uValue) 
self:FieldPut(#anoini, uValue)
return anoini := uValue


access Atual() 
return self:FieldGet(#Atual)


assign Atual(uValue) 
self:FieldPut(#Atual, uValue)
return Atual := uValue


access Baixado() 
return self:FieldGet(#Baixado)


assign Baixado(uValue) 
self:FieldPut(#Baixado, uValue)
return Baixado := uValue


access CAMDA2() 
return self:FieldGet(#CAMDA2)


assign CAMDA2(uValue) 
self:FieldPut(#CAMDA2, uValue)
return CAMDA2 := uValue


access CAMDAT() 
return self:FieldGet(#CAMDAT)


assign CAMDAT(uValue) 
self:FieldPut(#CAMDAT, uValue)
return CAMDAT := uValue


access carqacu() 
return self:FieldGet(#carqacu)


assign carqacu(uValue) 
self:FieldPut(#carqacu, uValue)
return carqacu := uValue


access carqbai() 
return self:FieldGet(#carqbai)


assign carqbai(uValue) 
self:FieldPut(#carqbai, uValue)
return carqbai := uValue


access carqfec() 
return self:FieldGet(#carqfec)


assign carqfec(uValue) 
self:FieldPut(#carqfec, uValue)
return carqfec := uValue


access carquso() 
return self:FieldGet(#carquso)


assign carquso(uValue) 
self:FieldPut(#carquso, uValue)
return carquso := uValue


access INCPER() 
return self:FieldGet(#INCPER)


assign INCPER(uValue) 
self:FieldPut(#INCPER, uValue)
return INCPER := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JSOM",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCmesini := SingleLineEdit{self,ResourceID{JSOM_MESINI,_GetInst()}}
oDCmesini:HyperLabel := HyperLabel{#mesini,"1",NULL_STRING,NULL_STRING}
oDCmesini:TooltipText := "Mes Inicial"
oDCmesini:FieldSpec := PADRAO_num_02{}

oDCanoini := SingleLineEdit{self,ResourceID{JSOM_ANOINI,_GetInst()}}
oDCanoini:HyperLabel := HyperLabel{#anoini,NULL_STRING,NULL_STRING,NULL_STRING}
oDCanoini:TooltipText := "Ano Inicial"
oDCanoini:FieldSpec := PADRAO_num_04{}

oDCmesfim := SingleLineEdit{self,ResourceID{JSOM_MESFIM,_GetInst()}}
oDCmesfim:HyperLabel := HyperLabel{#mesfim,"12",NULL_STRING,NULL_STRING}
oDCmesfim:TooltipText := "Mes Final"
oDCmesfim:FieldSpec := PADRAO_num_02{}

oDCanofim := SingleLineEdit{self,ResourceID{JSOM_ANOFIM,_GetInst()}}
oDCanofim:HyperLabel := HyperLabel{#anofim,NULL_STRING,NULL_STRING,NULL_STRING}
oDCanofim:TooltipText := "Ano Final"
oDCanofim:FieldSpec := PADRAO_num_04{}

oDCINCPER := CheckBox{self,ResourceID{JSOM_INCPER,_GetInst()}}
oDCINCPER:HyperLabel := HyperLabel{#INCPER,"Incluir Periodo",NULL_STRING,NULL_STRING}
oDCINCPER:TooltipText := "Marque para incluir o movimento Atual"

oDCAtual := CheckBox{self,ResourceID{JSOM_ATUAL,_GetInst()}}
oDCAtual:HyperLabel := HyperLabel{#Atual,"Incluir Arquivo Atual Atual",NULL_STRING,NULL_STRING}
oDCAtual:TooltipText := "Marque para incluir o movimento Atual"

oDCBaixado := CheckBox{self,ResourceID{JSOM_BAIXADO,_GetInst()}}
oDCBaixado:HyperLabel := HyperLabel{#Baixado,"Incluir Arquivo Baixado",NULL_STRING,NULL_STRING}
oDCBaixado:TooltipText := "Marque Para Incluir o Movimento Baixado"

oCCOK := PushButton{self,ResourceID{JSOM_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ICO_OK{}
oCCOK:TooltipText := "Clique aqui Par Confirmar"

oDCFixedText2 := FixedText{self,ResourceID{JSOM_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Ano",NULL_STRING,NULL_STRING}

oDCFixedText3 := FixedText{self,ResourceID{JSOM_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Final",NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{self,ResourceID{JSOM_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{JSOM_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JSOM_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}
oCCCancelar:TooltipText := "Clique aqui Para Cancelar"

oDCcarqacu := SingleLineEdit{self,ResourceID{JSOM_CARQACU,_GetInst()}}
oDCcarqacu:HyperLabel := HyperLabel{#carqacu,NULL_STRING,NULL_STRING,NULL_STRING}
oDCcarqacu:TooltipText := "Arquivo Acumulador"
oDCcarqacu:BackGround := aBrushes[1]

oDCcarqfec := SingleLineEdit{self,ResourceID{JSOM_CARQFEC,_GetInst()}}
oDCcarqfec:HyperLabel := HyperLabel{#carqfec,NULL_STRING,NULL_STRING,NULL_STRING}
oDCcarqfec:TooltipText := "Arquivo Fechado "
oDCcarqfec:BackGround := aBrushes[1]

oDCcarqbai := SingleLineEdit{self,ResourceID{JSOM_CARQBAI,_GetInst()}}
oDCcarqbai:HyperLabel := HyperLabel{#carqbai,NULL_STRING,NULL_STRING,NULL_STRING}
oDCcarqbai:TooltipText := "Arquivo Baixado"
oDCcarqbai:BackGround := aBrushes[1]

oDCcarquso := SingleLineEdit{self,ResourceID{JSOM_CARQUSO,_GetInst()}}
oDCcarquso:HyperLabel := HyperLabel{#carquso,NULL_STRING,NULL_STRING,NULL_STRING}
oDCcarquso:TooltipText := "Arquivo Atual"
oDCcarquso:BackGround := aBrushes[1]

oDCFixedText6 := FixedText{self,ResourceID{JSOM_FIXEDTEXT6,_GetInst()}}
oDCFixedText6:HyperLabel := HyperLabel{#FixedText6,"Referencia",NULL_STRING,NULL_STRING}

oDCCAMDA2 := SingleLineEdit{self,ResourceID{JSOM_CAMDA2,_GetInst()}}
oDCCAMDA2:HyperLabel := HyperLabel{#CAMDA2,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCAMDA2:TooltipText := "Arquivo Baixado"
oDCCAMDA2:BackGround := aBrushes[1]

oDCCAMDAT := SingleLineEdit{self,ResourceID{JSOM_CAMDAT,_GetInst()}}
oDCCAMDAT:HyperLabel := HyperLabel{#CAMDAT,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCAMDAT:TooltipText := "Arquivo Atual"
oDCCAMDAT:BackGround := aBrushes[1]

oDCregistro := FixedText{self,ResourceID{JSOM_REGISTRO,_GetInst()}}
oDCregistro:HyperLabel := HyperLabel{#registro,NULL_STRING,NULL_STRING,NULL_STRING}
oDCregistro:BackGround := aBrushes[1]

oDCarquso := FixedText{self,ResourceID{JSOM_ARQUSO,_GetInst()}}
oDCarquso:HyperLabel := HyperLabel{#arquso,NULL_STRING,NULL_STRING,NULL_STRING}
oDCarquso:BackGround := aBrushes[1]

oCCcmdmenos := PushButton{self,ResourceID{JSOM_CMDMENOS,_GetInst()}}
oCCcmdmenos:HyperLabel := HyperLabel{#cmdmenos,"-",NULL_STRING,NULL_STRING}

oCCcmdmais := PushButton{self,ResourceID{JSOM_CMDMAIS,_GetInst()}}
oCCcmdmais:HyperLabel := HyperLabel{#cmdmais,"+",NULL_STRING,NULL_STRING}

oDCFixedText5 := FixedText{self,ResourceID{JSOM_FIXEDTEXT5,_GetInst()}}
oDCFixedText5:HyperLabel := HyperLabel{#FixedText5,"Inicio",NULL_STRING,NULL_STRING}

oDCFixedText1 := FixedText{self,ResourceID{JSOM_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Mes",NULL_STRING,NULL_STRING}

oCCcmdmenos1 := PushButton{self,ResourceID{JSOM_CMDMENOS1,_GetInst()}}
oCCcmdmenos1:HyperLabel := HyperLabel{#cmdmenos1,"-",NULL_STRING,NULL_STRING}

oCCcmdmais1 := PushButton{self,ResourceID{JSOM_CMDMAIS1,_GetInst()}}
oCCcmdmais1:HyperLabel := HyperLabel{#cmdmais1,"+",NULL_STRING,NULL_STRING}

oCCcmdmenos2 := PushButton{self,ResourceID{JSOM_CMDMENOS2,_GetInst()}}
oCCcmdmenos2:HyperLabel := HyperLabel{#cmdmenos2,"-",NULL_STRING,NULL_STRING}

oCCcmdmais2 := PushButton{self,ResourceID{JSOM_CMDMAIS2,_GetInst()}}
oCCcmdmais2:HyperLabel := HyperLabel{#cmdmais2,"+",NULL_STRING,NULL_STRING}

oCCcmdmenos3 := PushButton{self,ResourceID{JSOM_CMDMENOS3,_GetInst()}}
oCCcmdmenos3:HyperLabel := HyperLabel{#cmdmenos3,"-",NULL_STRING,NULL_STRING}

oCCcmdmais3 := PushButton{self,ResourceID{JSOM_CMDMAIS3,_GetInst()}}
oCCcmdmais3:HyperLabel := HyperLabel{#cmdmais3,"+",NULL_STRING,NULL_STRING}

oCCcmdmenos4 := PushButton{self,ResourceID{JSOM_CMDMENOS4,_GetInst()}}
oCCcmdmenos4:HyperLabel := HyperLabel{#cmdmenos4,"12",NULL_STRING,NULL_STRING}

oCCmes01 := PushButton{self,ResourceID{JSOM_MES01,_GetInst()}}
oCCmes01:HyperLabel := HyperLabel{#mes01,"01",NULL_STRING,NULL_STRING}

oDCProgBar := ProgressBar{self,ResourceID{JSOM_PROGBAR,_GetInst()}}
oDCProgBar:Range := Range{0,100}
oDCProgBar:HyperLabel := HyperLabel{#ProgBar,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText9 := FixedText{self,ResourceID{JSOM_FIXEDTEXT9,_GetInst()}}
oDCFixedText9:HyperLabel := HyperLabel{#FixedText9,"Arquivo",NULL_STRING,NULL_STRING}

oDCFixedText10 := FixedText{self,ResourceID{JSOM_FIXEDTEXT10,_GetInst()}}
oDCFixedText10:HyperLabel := HyperLabel{#FixedText10,"Registro",NULL_STRING,NULL_STRING}

oCCcmdmesmoano := PushButton{self,ResourceID{JSOM_CMDMESMOANO,_GetInst()}}
oCCcmdmesmoano:HyperLabel := HyperLabel{#cmdmesmoano,"=",NULL_STRING,NULL_STRING}

self:Caption := "Incluir Periodo"
self:HyperLabel := HyperLabel{#JSOM,"Incluir Periodo",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access mesfim() 
return self:FieldGet(#mesfim)


assign mesfim(uValue) 
self:FieldPut(#mesfim, uValue)
return mesfim := uValue


access mesini() 
return self:FieldGet(#mesini)


assign mesini(uValue) 
self:FieldPut(#mesini, uValue)
return mesini := uValue


END CLASS
