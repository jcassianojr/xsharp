#region DEFINES
STATIC DEFINE JETQ01_CANCELAR := 119 
STATIC DEFINE JETQ01_CODIGO := 103 
STATIC DEFINE JETQ01_CONFIMP := 117 
STATIC DEFINE JETQ01_ENGENHA := 105 
STATIC DEFINE JETQ01_ESCCOD := 114 
STATIC DEFINE JETQ01_FIXEDTEXT1 := 115 
STATIC DEFINE JETQ01_FIXEDTEXT2 := 116 
STATIC DEFINE JETQ01_FOTO := 121 
STATIC DEFINE JETQ01_NOME := 104 
STATIC DEFINE JETQ01_NUMERO := 100 
STATIC DEFINE JETQ01_OK := 106 
STATIC DEFINE JETQ01_PEGCOD := 112 
STATIC DEFINE JETQ01_POSINI := 101 
STATIC DEFINE JETQ01_SC_CODIGO := 108 
STATIC DEFINE JETQ01_SC_DESTINO2 := 120 
STATIC DEFINE JETQ01_SC_ENGENHA := 111 
STATIC DEFINE JETQ01_SC_NOME := 109 
STATIC DEFINE JETQ01_SC_NUMERO := 107 
STATIC DEFINE JETQ01_SC_NUMERO1 := 113 
STATIC DEFINE JETQ01_SC_SUFIX := 110 
STATIC DEFINE JETQ01_SUFIX := 102 
STATIC DEFINE JETQ01_THEFIXEDTEXT13 := 118 
#endregion

class jetq01 inherit DATADIALOG 

	protect oDCNUMERO as RIGHTSLE
	protect oDCPOSINI as RIGHTSLE
	protect oDCSUFIX as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCENGENHA as SINGLELINEEDIT
	protect oCCOK as PUSHBUTTON
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_SUFIX as FIXEDTEXT
	protect oDCSC_ENGENHA as FIXEDTEXT
	protect oCCpegcod as PUSHBUTTON
	protect oDCSC_NUMERO1 as FIXEDTEXT
	protect oCCesccod as PUSHBUTTON
	protect oDCFixedText1 as FIXEDTEXT
	protect oDCFixedText2 as FIXEDTEXT
	protect oCCCONFIMP as PUSHBUTTON
	protect oDCtheFixedText13 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
// 	instance NUMERO 
// 	instance POSINI 
// 	instance SUFIX 
// 	instance CODIGO 
// 	instance NOME 
// 	instance ENGENHA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access ENGENHA() 
return self:FieldGet(#ENGENHA)


assign ENGENHA(uValue) 
self:FieldPut(#ENGENHA, uValue)
return ENGENHA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jetq01",_GetInst()},iCtlID)

oDCNUMERO := rightSle{self,ResourceID{JETQ01_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_04{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"ETIPPP_NUMERO"}
oDCNUMERO:FocusSelect := FSEL_ALL

oDCPOSINI := rightSle{self,ResourceID{JETQ01_POSINI,_GetInst()}}
oDCPOSINI:FieldSpec := padrao_num_08{}
oDCPOSINI:HyperLabel := HyperLabel{#POSINI,"Numero:",NULL_STRING,"ETIPPP_NUMERO"}
oDCPOSINI:FocusSelect := FSEL_ALL

oDCSUFIX := SingleLineEdit{self,ResourceID{JETQ01_SUFIX,_GetInst()}}
oDCSUFIX:FieldSpec := padrao_char_05{}
oDCSUFIX:HyperLabel := HyperLabel{#SUFIX,"Sufix:",NULL_STRING,"ETIPPP_SUFIX"}
oDCSUFIX:FocusSelect := FSEL_ALL

oDCCODIGO := SingleLineEdit{self,ResourceID{JETQ01_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"ETIPPP_CODIGO"}
oDCCODIGO:FocusSelect := FSEL_ALL

oDCNOME := SingleLineEdit{self,ResourceID{JETQ01_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_50{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"ETIPPP_NOME"}
oDCNOME:FocusSelect := FSEL_ALL

oDCENGENHA := SingleLineEdit{self,ResourceID{JETQ01_ENGENHA,_GetInst()}}
oDCENGENHA:FieldSpec := padrao_char_50{}
oDCENGENHA:HyperLabel := HyperLabel{#ENGENHA,"Engenha:",NULL_STRING,"ETIPPP_ENGENHA"}
oDCENGENHA:FocusSelect := FSEL_ALL

oCCOK := PushButton{self,ResourceID{JETQ01_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ICO_PRINT{}

oDCSC_NUMERO := FixedText{self,ResourceID{JETQ01_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Quantidade",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JETQ01_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JETQ01_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_SUFIX := FixedText{self,ResourceID{JETQ01_SC_SUFIX,_GetInst()}}
oDCSC_SUFIX:HyperLabel := HyperLabel{#SC_SUFIX,"Sufix:",NULL_STRING,NULL_STRING}

oDCSC_ENGENHA := FixedText{self,ResourceID{JETQ01_SC_ENGENHA,_GetInst()}}
oDCSC_ENGENHA:HyperLabel := HyperLabel{#SC_ENGENHA,"Engenheiro",NULL_STRING,NULL_STRING}

oCCpegcod := PushButton{self,ResourceID{JETQ01_PEGCOD,_GetInst()}}
oCCpegcod:HyperLabel := HyperLabel{#pegcod,"--->",NULL_STRING,NULL_STRING}

oDCSC_NUMERO1 := FixedText{self,ResourceID{JETQ01_SC_NUMERO1,_GetInst()}}
oDCSC_NUMERO1:HyperLabel := HyperLabel{#SC_NUMERO1,"INICIAL",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JETQ01_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oDCFixedText1 := FixedText{self,ResourceID{JETQ01_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Imprimir",NULL_STRING,NULL_STRING}

oDCFixedText2 := FixedText{self,ResourceID{JETQ01_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Conf Imp",NULL_STRING,NULL_STRING}

oCCCONFIMP := PushButton{self,ResourceID{JETQ01_CONFIMP,_GetInst()}}
oCCCONFIMP:HyperLabel := HyperLabel{#CONFIMP,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCONFIMP:Image := ICO_PRINTCFG{}

oDCtheFixedText13 := FixedText{self,ResourceID{JETQ01_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JETQ01_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JETQ01_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JETQ01_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

self:Caption := "Etiqueta Pre Prototype"
self:HyperLabel := HyperLabel{#jetq01,"Etiqueta Pre Prototype",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif

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


access POSINI() 
return self:FieldGet(#POSINI)


assign POSINI(uValue) 
self:FieldPut(#POSINI, uValue)
return POSINI := uValue


access SUFIX() 
return self:FieldGet(#SUFIX)


assign SUFIX(uValue) 
self:FieldPut(#SUFIX, uValue)
return SUFIX := uValue


END CLASS
