#region DEFINES
STATIC DEFINE JCESTA_ADMITIDO := 111 
STATIC DEFINE JCESTA_BUSCANUM := 107 
STATIC DEFINE JCESTA_CESTA := 103 
STATIC DEFINE JCESTA_CMDHORA := 101 
STATIC DEFINE JCESTA_CMDORDENAR := 106 
STATIC DEFINE JCESTA_NOME := 105 
STATIC DEFINE JCESTA_NUMERO := 108 
STATIC DEFINE JCESTA_OBS := 100 
STATIC DEFINE JCESTA_SC_ADMITIDO := 112 
STATIC DEFINE JCESTA_SC_NOME := 104 
STATIC DEFINE JCESTA_SC_NUMERO := 109 
STATIC DEFINE JCESTA_SC_TIPO := 102 
STATIC DEFINE JCESTA_SC_TIPO1 := 110 
#endregion

class jcesta inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBCESTA as DataColumn
	PROTECT oDBOBS as DataColumn
	protect oDCobs as SINGLELINEEDIT
	protect oCCcmdhora as PUSHBUTTON
	protect oDCSC_TIPO as FIXEDTEXT
	protect oDCCESTA as SINGLELINEEDIT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCNOME as SINGLELINEEDIT
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCbuscaNUM as PUSHBUTTON
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_TIPO1 as FIXEDTEXT
	protect oDCADMITIDO as SINGLELINEEDIT
	protect oDCSC_ADMITIDO as FIXEDTEXT
// 	instance obs 
// 	instance CESTA 
// 	instance NOME 
// 	instance NUMERO 
// 	instance ADMITIDO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ADMITIDO() 
return self:FieldGet(#ADMITIDO)


assign ADMITIDO(uValue) 
self:FieldPut(#ADMITIDO, uValue)
return ADMITIDO := uValue


METHOD buscaNUM( ) 
	SELF:keyfind()

access CESTA() 
return self:FieldGet(#CESTA)


assign CESTA(uValue) 
self:FieldPut(#CESTA, uValue)
return CESTA := uValue


METHOD cmdhora( ) 
	SELF:server:FIELDPUT("CESTA",SIMNAO(SELF:SERVER:FIELDGET("CESTA"),{"S","N","V"}))	


METHOD CMDimprimir( ) 
SELF:XWRPTFGRP("PTO","CEST")	


METHOD cmdordenar( ) 
	SELF:keyfind()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcesta",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,12,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCobs := SingleLineEdit{self,ResourceID{JCESTA_OBS,_GetInst()}}
oDCobs:FieldSpec := PADRAO_CHAR_40{}
oDCobs:HyperLabel := HyperLabel{#obs,"OBS:",NULL_STRING,"FO_PES_HT"}

oCCcmdhora := PushButton{self,ResourceID{JCESTA_CMDHORA,_GetInst()}}
oCCcmdhora:HyperLabel := HyperLabel{#cmdhora,"(S)im(N)ao(V)ale",NULL_STRING,NULL_STRING}

oDCSC_TIPO := FixedText{self,ResourceID{JCESTA_SC_TIPO,_GetInst()}}
oDCSC_TIPO:HyperLabel := HyperLabel{#SC_TIPO,"Sair Lista:",NULL_STRING,NULL_STRING}

oDCCESTA := SingleLineEdit{self,ResourceID{JCESTA_CESTA,_GetInst()}}
oDCCESTA:FieldSpec := PADRAO_CHAR_01{}
oDCCESTA:HyperLabel := HyperLabel{#CESTA,NULL_STRING,NULL_STRING,"FO_PES_TIPO"}
oDCCESTA:BackGround := aBrushes[1]
oDCCESTA:Font(aFonts[1], FALSE)

oDCSC_NOME := FixedText{self,ResourceID{JCESTA_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JCESTA_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_30{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"FO_PES_NOME"}
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[2], FALSE)

oCCcmdordenar := PushButton{self,ResourceID{JCESTA_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JCESTA_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JCESTA_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"FO_PES_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]
oDCNUMERO:Font(aFonts[2], FALSE)

oDCSC_NUMERO := FixedText{self,ResourceID{JCESTA_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_TIPO1 := FixedText{self,ResourceID{JCESTA_SC_TIPO1,_GetInst()}}
oDCSC_TIPO1:HyperLabel := HyperLabel{#SC_TIPO1,"OBS:",NULL_STRING,NULL_STRING}

oDCADMITIDO := SingleLineEdit{self,ResourceID{JCESTA_ADMITIDO,_GetInst()}}
oDCADMITIDO:FieldSpec := DATE_FIELD{}
oDCADMITIDO:HyperLabel := HyperLabel{#ADMITIDO,"Admitido:",NULL_STRING,"FO_PES_ADMITIDO"}
oDCADMITIDO:BackGround := aBrushes[1]
oDCADMITIDO:Font(aFonts[1], FALSE)

oDCSC_ADMITIDO := FixedText{self,ResourceID{JCESTA_SC_ADMITIDO,_GetInst()}}
oDCSC_ADMITIDO:HyperLabel := HyperLabel{#SC_ADMITIDO,"Admitido:",NULL_STRING,NULL_STRING}

self:Caption := "Cesta Basica"
self:HyperLabel := HyperLabel{#jcesta,"Cesta Basica",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBNOME := DataColumn{PADRAO_CHAR_30{}}
oDBNOME:Width := 21
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)

oDBCESTA := DataColumn{PADRAO_CHAR_01{}}
oDBCESTA:Width := 6
oDBCESTA:HyperLabel := oDCCESTA:HyperLabel 
oDBCESTA:Caption := ""
oDBCESTA:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCESTA)

oDBOBS := DataColumn{PADRAO_CHAR_40{}}
oDBOBS:Width := 36
oDBOBS:HyperLabel := oDCOBS:HyperLabel 
oDBOBS:Caption := "OBS:"
self:Browser:AddColumn(oDBOBS)


self:ViewAs(#FormView)

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


access obs() 
return self:FieldGet(#obs)


assign obs(uValue) 
self:FieldPut(#obs, uValue)
return obs := uValue


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()


END CLASS
