#region DEFINES
STATIC DEFINE JFO_RELHR_ALMOCO := 112 
STATIC DEFINE JFO_RELHR_BUSCANUM := 117 
STATIC DEFINE JFO_RELHR_CMDALM := 120 
STATIC DEFINE JFO_RELHR_CMDESC := 123 
STATIC DEFINE JFO_RELHR_CMDINI := 122 
STATIC DEFINE JFO_RELHR_CMDMARALM := 121 
STATIC DEFINE JFO_RELHR_CMDORDENAR := 125 
STATIC DEFINE JFO_RELHR_CMDPAD1 := 126 
STATIC DEFINE JFO_RELHR_ESCCOD := 124 
STATIC DEFINE JFO_RELHR_ESCFUN := 118 
STATIC DEFINE JFO_RELHR_GRUPO := 111 
STATIC DEFINE JFO_RELHR_HFOL00 := 110 
STATIC DEFINE JFO_RELHR_HORREF := 114 
STATIC DEFINE JFO_RELHR_MARALM := 115 
STATIC DEFINE JFO_RELHR_MARMES := 116 
STATIC DEFINE JFO_RELHR_NOME := 109 
STATIC DEFINE JFO_RELHR_NUMERO := 108 
STATIC DEFINE JFO_RELHR_PADRAO := 113 
STATIC DEFINE JFO_RELHR_PEGNOME := 119 
STATIC DEFINE JFO_RELHR_SC_ALMOCO := 104 
STATIC DEFINE JFO_RELHR_SC_GRUPO := 103 
STATIC DEFINE JFO_RELHR_SC_HFOL00 := 102 
STATIC DEFINE JFO_RELHR_SC_HORREF := 105 
STATIC DEFINE JFO_RELHR_SC_MARALM := 106 
STATIC DEFINE JFO_RELHR_SC_MARMES := 107 
STATIC DEFINE JFO_RELHR_SC_NOME := 101 
STATIC DEFINE JFO_RELHR_SC_NUMERO := 100 
#endregion

PARTIAL class JFO_RELHR inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBHFOL00 as DataColumn
	PROTECT oDBGRUPO as DataColumn
	PROTECT oDBMARALM as DataColumn
	PROTECT oDBALMOCO as DataColumn
	PROTECT oDBHORREF as DataColumn
	PROTECT oDBMARMES as DataColumn
	PROTECT oDBPADRAO as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_HFOL00 as FIXEDTEXT
	protect oDCSC_GRUPO as FIXEDTEXT
	protect oDCSC_ALMOCO as FIXEDTEXT
	protect oDCSC_HORREF as FIXEDTEXT
	protect oDCSC_MARALM as FIXEDTEXT
	protect oDCSC_MARMES as FIXEDTEXT
	protect oDCNUMERO as RIGHTSLE
	protect oDCNOME as SINGLELINEEDIT
	protect oDCHFOL00 as SINGLELINEEDIT
	protect oDCGRUPO as SINGLELINEEDIT
	protect oDCALMOCO as SINGLELINEEDIT
	protect oDCHORREF as SINGLELINEEDIT
	protect oDCMARALM as SINGLELINEEDIT
	protect oDCMARMES as SINGLELINEEDIT
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCescFUN as PUSHBUTTON
	protect oCCpegnome as PUSHBUTTON
	protect oCCcmdALM as PUSHBUTTON
	protect oCCcmdmaralm as PUSHBUTTON
	protect oCCcmdini as PUSHBUTTON
	protect oCCcmdesc as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCcmdpad1 as PUSHBUTTON
// 	instance NUMERO 
// 	instance NOME 
// 	instance HFOL00 
// 	instance GRUPO 
// 	instance ALMOCO 
// 	instance PADRAO 
// 	instance HORREF 
// 	instance MARALM 
// 	instance MARMES 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ALMOCO() 
return self:FieldGet(#ALMOCO)


assign ALMOCO(uValue) 
self:FieldPut(#ALMOCO, uValue)
return ALMOCO := uValue


METHOD cmdordenar( ) 
	SELF:KeyFind()

METHOD cmdpad1( ) 
	SELF:server:FIELDPUT("ALMOCO",SIMNAO(SELF:SERVER:FIELDGET("ALMOCO")))	

access GRUPO() 
return self:FieldGet(#GRUPO)


assign GRUPO(uValue) 
self:FieldPut(#GRUPO, uValue)
return GRUPO := uValue


access HFOL00() 
return self:FieldGet(#HFOL00)


assign HFOL00(uValue) 
self:FieldPut(#HFOL00, uValue)
return HFOL00 := uValue


access HORREF() 
return self:FieldGet(#HORREF)


assign HORREF(uValue) 
self:FieldPut(#HORREF, uValue)
return HORREF := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFO_RELHR",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_NUMERO := FixedText{self,ResourceID{JFO_RELHR_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JFO_RELHR_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_HFOL00 := FixedText{self,ResourceID{JFO_RELHR_SC_HFOL00,_GetInst()}}
oDCSC_HFOL00:HyperLabel := HyperLabel{#SC_HFOL00,"Escala",NULL_STRING,NULL_STRING}

oDCSC_GRUPO := FixedText{self,ResourceID{JFO_RELHR_SC_GRUPO,_GetInst()}}
oDCSC_GRUPO:HyperLabel := HyperLabel{#SC_GRUPO,"Codigo Escala",NULL_STRING,NULL_STRING}

oDCSC_ALMOCO := FixedText{self,ResourceID{JFO_RELHR_SC_ALMOCO,_GetInst()}}
oDCSC_ALMOCO:HyperLabel := HyperLabel{#SC_ALMOCO,"Almoco:",NULL_STRING,NULL_STRING}

oDCSC_HORREF := FixedText{self,ResourceID{JFO_RELHR_SC_HORREF,_GetInst()}}
oDCSC_HORREF:HyperLabel := HyperLabel{#SC_HORREF,"Horario Referencia",NULL_STRING,NULL_STRING}

oDCSC_MARALM := FixedText{self,ResourceID{JFO_RELHR_SC_MARALM,_GetInst()}}
oDCSC_MARALM:HyperLabel := HyperLabel{#SC_MARALM,"Marca Amoço",NULL_STRING,NULL_STRING}

oDCSC_MARMES := FixedText{self,ResourceID{JFO_RELHR_SC_MARMES,_GetInst()}}
oDCSC_MARMES:HyperLabel := HyperLabel{#SC_MARMES,"Controla Ponto",NULL_STRING,NULL_STRING}

oDCNUMERO := rightSle{self,ResourceID{JFO_RELHR_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"FO_RELHR_NUMERO"}

oDCNOME := SingleLineEdit{self,ResourceID{JFO_RELHR_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_30{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"FO_RELHR_NOME"}

oDCHFOL00 := SingleLineEdit{self,ResourceID{JFO_RELHR_HFOL00,_GetInst()}}
oDCHFOL00:FieldSpec := PADRAO_CHAR_01{}
oDCHFOL00:HyperLabel := HyperLabel{#HFOL00,"Escala",NULL_STRING,"FO_RELHR_HFOL00"}
oDCHFOL00:BackGround := aBrushes[1]

oDCGRUPO := SingleLineEdit{self,ResourceID{JFO_RELHR_GRUPO,_GetInst()}}
oDCGRUPO:FieldSpec := PADRAO_CHAR_02{}
oDCGRUPO:HyperLabel := HyperLabel{#GRUPO,"CodEsc",NULL_STRING,"FO_RELHR_GRUPO"}

oDCALMOCO := SingleLineEdit{self,ResourceID{JFO_RELHR_ALMOCO,_GetInst()}}
oDCALMOCO:FieldSpec := PADRAO_CHAR_01{}
oDCALMOCO:HyperLabel := HyperLabel{#ALMOCO,"Almoco:",NULL_STRING,"FO_RELHR_ALMOCO"}
oDCALMOCO:BackGround := aBrushes[1]

oDCHORREF := SingleLineEdit{self,ResourceID{JFO_RELHR_HORREF,_GetInst()}}
oDCHORREF:FieldSpec := PADRAO_CHAR_02{}
oDCHORREF:HyperLabel := HyperLabel{#HORREF,"Horref:",NULL_STRING,"FO_RELHR_HORREF"}
oDCHORREF:BackGround := aBrushes[1]

oDCMARALM := SingleLineEdit{self,ResourceID{JFO_RELHR_MARALM,_GetInst()}}
oDCMARALM:FieldSpec := PADRAO_CHAR_01{}
oDCMARALM:HyperLabel := HyperLabel{#MARALM,"MarcaAlm",NULL_STRING,"FO_RELHR_MARALM"}
oDCMARALM:BackGround := aBrushes[1]

oDCMARMES := SingleLineEdit{self,ResourceID{JFO_RELHR_MARMES,_GetInst()}}
oDCMARMES:FieldSpec := PADRAO_CHAR_01{}
oDCMARMES:HyperLabel := HyperLabel{#MARMES,"Inicia",NULL_STRING,"FO_RELHR_MARMES"}
oDCMARMES:BackGround := aBrushes[1]

oCCbuscaNUM := PushButton{self,ResourceID{JFO_RELHR_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCescFUN := PushButton{self,ResourceID{JFO_RELHR_ESCFUN,_GetInst()}}
oCCescFUN:HyperLabel := HyperLabel{#escFUN,"...",NULL_STRING,NULL_STRING}

oCCpegnome := PushButton{self,ResourceID{JFO_RELHR_PEGNOME,_GetInst()}}
oCCpegnome:HyperLabel := HyperLabel{#pegnome,"-->",NULL_STRING,NULL_STRING}

oCCcmdALM := PushButton{self,ResourceID{JFO_RELHR_CMDALM,_GetInst()}}
oCCcmdALM:HyperLabel := HyperLabel{#cmdALM,"Faixa ABCDE",NULL_STRING,NULL_STRING}

oCCcmdmaralm := PushButton{self,ResourceID{JFO_RELHR_CMDMARALM,_GetInst()}}
oCCcmdmaralm:HyperLabel := HyperLabel{#cmdmaralm,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdini := PushButton{self,ResourceID{JFO_RELHR_CMDINI,_GetInst()}}
oCCcmdini:HyperLabel := HyperLabel{#cmdini,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdesc := PushButton{self,ResourceID{JFO_RELHR_CMDESC,_GetInst()}}
oCCcmdesc:HyperLabel := HyperLabel{#cmdesc,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JFO_RELHR_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JFO_RELHR_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCcmdpad1 := PushButton{self,ResourceID{JFO_RELHR_CMDPAD1,_GetInst()}}
oCCcmdpad1:HyperLabel := HyperLabel{#cmdpad1,"Sim/Nao",NULL_STRING,NULL_STRING}

self:Caption := "Funcionarios/Horarios"
self:HyperLabel := HyperLabel{#JFO_RELHR,"Funcionarios/Horarios",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 13
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBNOME := DataColumn{PADRAO_CHAR_30{}}
oDBNOME:Width := 22
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBHFOL00 := DataColumn{PADRAO_CHAR_01{}}
oDBHFOL00:Width := 8
oDBHFOL00:HyperLabel := oDCHFOL00:HyperLabel 
oDBHFOL00:Caption := "Escala"
oDBHFOL00:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBHFOL00)

oDBGRUPO := DataColumn{PADRAO_CHAR_02{}}
oDBGRUPO:Width := 7
oDBGRUPO:HyperLabel := oDCGRUPO:HyperLabel 
oDBGRUPO:Caption := "CodEsc"
self:Browser:AddColumn(oDBGRUPO)

oDBMARALM := DataColumn{PADRAO_CHAR_01{}}
oDBMARALM:Width := 7
oDBMARALM:HyperLabel := oDCMARALM:HyperLabel 
oDBMARALM:Caption := "MarcaAlm"
oDBMARALM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMARALM)

oDBALMOCO := DataColumn{PADRAO_CHAR_01{}}
oDBALMOCO:Width := 8
oDBALMOCO:HyperLabel := oDCALMOCO:HyperLabel 
oDBALMOCO:Caption := "Almoco:"
oDBALMOCO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBALMOCO)

oDBHORREF := DataColumn{PADRAO_CHAR_02{}}
oDBHORREF:Width := 8
oDBHORREF:HyperLabel := oDCHORREF:HyperLabel 
oDBHORREF:Caption := "Horref:"
oDBHORREF:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBHORREF)

oDBMARMES := DataColumn{PADRAO_CHAR_01{}}
oDBMARMES:Width := 8
oDBMARMES:HyperLabel := oDCMARMES:HyperLabel 
oDBMARMES:Caption := "Inicia"
oDBMARMES:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMARMES)

oDBPADRAO := DataColumn{PADRAO_CHAR_01{}}
oDBPADRAO:Width := 8
oDBPADRAO:HyperLabel := HyperLabel{#PADRAO,"Padrao:",NULL_STRING,"FO_RELHR_PADRAO"} 
oDBPADRAO:Caption := "Padrao:"
oDBPADRAO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBPADRAO)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MARALM() 
return self:FieldGet(#MARALM)


assign MARALM(uValue) 
self:FieldPut(#MARALM, uValue)
return MARALM := uValue


access MARMES() 
return self:FieldGet(#MARMES)


assign MARMES(uValue) 
self:FieldPut(#MARMES, uValue)
return MARMES := uValue


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


access PADRAO() 
return self:FieldGet(#PADRAO)


assign PADRAO(uValue) 
self:FieldPut(#PADRAO, uValue)
return PADRAO := uValue


END CLASS
