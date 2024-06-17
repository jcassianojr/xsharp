#region DEFINES
STATIC DEFINE JENS_APLICACAO := 109 
STATIC DEFINE JENS_BUSCACODIGO := 113 
STATIC DEFINE JENS_CHKTIPO := 127 
STATIC DEFINE JENS_CMDDESGP12 := 130 
STATIC DEFINE JENS_CMDESCTIPA := 128 
STATIC DEFINE JENS_CMDESCTIPA1 := 134 
STATIC DEFINE JENS_CMDIMP := 141 
STATIC DEFINE JENS_CMDIMP1 := 142 
STATIC DEFINE JENS_CMDMARGP12 := 129 
STATIC DEFINE JENS_CMDRENUM := 121 
STATIC DEFINE JENS_CMDRENUM1 := 136 
STATIC DEFINE JENS_CMDVERGP12 := 131 
STATIC DEFINE JENS_CMDVERGP13 := 132 
STATIC DEFINE JENS_CODIGO := 106 
STATIC DEFINE JENS_CODIGOINT := 145 
STATIC DEFINE JENS_CODIMP01 := 143 
STATIC DEFINE JENS_CODIMP02 := 144 
STATIC DEFINE JENS_EDITAR := 111 
STATIC DEFINE JENS_EDITAR1 := 140 
STATIC DEFINE JENS_ESCPF := 147 
STATIC DEFINE JENS_EXCLUIR := 114 
STATIC DEFINE JENS_EXCLUIR1 := 120 
STATIC DEFINE JENS_EXCLUIR2 := 135 
STATIC DEFINE JENS_EXCLUIR3 := 137 
STATIC DEFINE JENS_FIXEDTEXT3 := 117 
STATIC DEFINE JENS_FIXEDTEXT4 := 118 
STATIC DEFINE JENS_FT10 := 146 
STATIC DEFINE JENS_IMPMC := 148 
STATIC DEFINE JENS_IMPPFCOM := 119 
STATIC DEFINE JENS_IMPPFCOM1 := 123 
STATIC DEFINE JENS_IMPPFCOM2 := 124 
STATIC DEFINE JENS_IMPPFCOM3 := 125 
STATIC DEFINE JENS_IMPPFSEQ := 110 
STATIC DEFINE JENS_IMPPFSEQ1 := 122 
STATIC DEFINE JENS_INCLUIR := 115 
STATIC DEFINE JENS_INCLUIR1 := 138 
STATIC DEFINE JENS_JCRMENS := 126 
STATIC DEFINE JENS_JENSI := 116 
STATIC DEFINE JENS_JENSR := 133 
STATIC DEFINE JENS_NOM2 := 108 
STATIC DEFINE JENS_NOME := 107 
STATIC DEFINE JENS_NPF := 100 
STATIC DEFINE JENS_NSEQ := 101 
STATIC DEFINE JENS_NSSQ := 102 
STATIC DEFINE JENS_SC_APLICACAO := 105 
STATIC DEFINE JENS_SC_CODIGO := 103 
STATIC DEFINE JENS_SC_NOME := 104 
STATIC DEFINE JENS_TABULAR := 112 
STATIC DEFINE JENS_TABULAR1 := 139 
#endregion

class JENS inherit MYDataWindow 

	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBNOM2 as DataColumn
	PROTECT oDBAPLICACAO as DataColumn
	protect oDCnPF as RIGHTSLE
	protect oDCnSEQ as RIGHTSLE
	protect oDCnSSQ as RIGHTSLE
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_APLICACAO as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCNOM2 as SINGLELINEEDIT
	protect oDCAPLICACAO as SINGLELINEEDIT
	protect oCCIMPPFSEQ as PUSHBUTTON
	protect oCCEditar as PUSHBUTTON
	protect oCCTabular as PUSHBUTTON
	protect oCCbuscacodigo as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCIncluir as PUSHBUTTON
	protect oDCFixedText3 as FIXEDTEXT
	protect oDCFixedText4 as FIXEDTEXT
	protect oCCIMPPFcom as PUSHBUTTON
	protect oCCExcluir1 as PUSHBUTTON
	protect oCCCMDRENUM as PUSHBUTTON
	protect oCCIMPPFSEQ1 as PUSHBUTTON
	protect oCCIMPPFcom1 as PUSHBUTTON
	protect oCCIMPPFcom2 as PUSHBUTTON
	protect oCCIMPPFcom3 as PUSHBUTTON
	protect oCCCHKTIPO as PUSHBUTTON
	protect oCCcmdesctipa as PUSHBUTTON
	protect oCCcmdmargp12 as PUSHBUTTON
	protect oCCcmddesgp12 as PUSHBUTTON
	protect oCCcmdvergp12 as PUSHBUTTON
	protect oCCcmdvergp13 as PUSHBUTTON
	protect oCCcmdesctipa1 as PUSHBUTTON
	protect oCCExcluir2 as PUSHBUTTON
	protect oCCCMDRENUM1 as PUSHBUTTON
	protect oCCExcluir3 as PUSHBUTTON
	protect oCCIncluir1 as PUSHBUTTON
	protect oCCTabular1 as PUSHBUTTON
	protect oCCEditar1 as PUSHBUTTON
	protect oCCcmdimp as PUSHBUTTON
	protect oCCcmdimp1 as PUSHBUTTON
	protect oDCcodimp01 as RIGHTSLE
	protect oDCcodimp02 as RIGHTSLE
	protect oDCCODIGOINT as SINGLELINEEDIT
	protect oDCFT10 as FIXEDTEXT
	protect oCCescPF as PUSHBUTTON
	protect oCCImpMC as PUSHBUTTON
// 	instance nPF 
// 	instance nSEQ 
// 	instance nSSQ 
// 	instance CODIGO 
// 	instance NOME 
// 	instance NOM2 
// 	instance APLICACAO 
// 	instance codimp01 
// 	instance codimp02 
// 	instance CODIGOINT 
	protect oSFJENSI as JENSI
	protect oSFJCRMENS as JCRMENS
	protect oSFJENSR as JENSR

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access APLICACAO() 
return self:FieldGet(#APLICACAO)


assign APLICACAO(uValue) 
self:FieldPut(#APLICACAO, uValue)
return APLICACAO := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODIGOINT() 
return self:FieldGet(#CODIGOINT)


assign CODIGOINT(uValue) 
self:FieldPut(#CODIGOINT, uValue)
return CODIGOINT := uValue


access codimp01() 
return self:FieldGet(#codimp01)


assign codimp01(uValue) 
self:FieldPut(#codimp01, uValue)
return codimp01 := uValue


access codimp02() 
return self:FieldGet(#codimp02)


assign codimp02(uValue) 
self:FieldPut(#codimp02, uValue)
return codimp02 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JENS",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCnPF := rightSle{self,ResourceID{JENS_NPF,_GetInst()}}
oDCnPF:HyperLabel := HyperLabel{#nPF,NULL_STRING,NULL_STRING,NULL_STRING}
oDCnPF:TooltipText := "Nº PF para Importar"
oDCnPF:FieldSpec := PADRAO_NUM_05{}

oDCnSEQ := rightSle{self,ResourceID{JENS_NSEQ,_GetInst()}}
oDCnSEQ:HyperLabel := HyperLabel{#nSEQ,NULL_STRING,NULL_STRING,NULL_STRING}
oDCnSEQ:TooltipText := "Nº Seq Importar"
oDCnSEQ:FieldSpec := PADRAO_NUM_03{}

oDCnSSQ := rightSle{self,ResourceID{JENS_NSSQ,_GetInst()}}
oDCnSSQ:HyperLabel := HyperLabel{#nSSQ,NULL_STRING,NULL_STRING,NULL_STRING}
oDCnSSQ:TooltipText := "Nº Ssq Importar"
oDCnSSQ:FieldSpec := PADRAO_NUM_03{}

oDCSC_CODIGO := FixedText{self,ResourceID{JENS_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JENS_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_APLICACAO := FixedText{self,ResourceID{JENS_SC_APLICACAO,_GetInst()}}
oDCSC_APLICACAO:HyperLabel := HyperLabel{#SC_APLICACAO,"Aplicacao:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JENS_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MU01_CODIGO"}
oDCCODIGO:TooltipText := "Codigo"
oDCCODIGO:BackGround := aBrushes[1]
oDCCODIGO:Font(aFonts[1], FALSE)

oDCNOME := SingleLineEdit{self,ResourceID{JENS_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_50{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MU01_NOME"}
oDCNOME:TooltipText := "Descriçao"
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[2], FALSE)

oDCNOM2 := SingleLineEdit{self,ResourceID{JENS_NOM2,_GetInst()}}
oDCNOM2:FieldSpec := PADRAO_CHAR_50{}
oDCNOM2:HyperLabel := HyperLabel{#NOM2,"Nom2:",NULL_STRING,"MU01_NOM2"}
oDCNOM2:BackGround := aBrushes[1]
oDCNOM2:Font(aFonts[2], FALSE)

oDCAPLICACAO := SingleLineEdit{self,ResourceID{JENS_APLICACAO,_GetInst()}}
oDCAPLICACAO:FieldSpec := PADRAO_CHAR_50{}
oDCAPLICACAO:HyperLabel := HyperLabel{#APLICACAO,"Aplicacao:",NULL_STRING,"MU01_APLICACAO"}
oDCAPLICACAO:TooltipText := "Aplicacao"
oDCAPLICACAO:BackGround := aBrushes[1]
oDCAPLICACAO:Font(aFonts[2], FALSE)

oCCIMPPFSEQ := PushButton{self,ResourceID{JENS_IMPPFSEQ,_GetInst()}}
oCCIMPPFSEQ:HyperLabel := HyperLabel{#IMPPFSEQ,"PF Seq/SSQ",NULL_STRING,NULL_STRING}
oCCIMPPFSEQ:TooltipText := "Importar Plano Controle Seq/ssq"

oCCEditar := PushButton{self,ResourceID{JENS_EDITAR,_GetInst()}}
oCCEditar:HyperLabel := HyperLabel{#Editar,"E"+_chr(38)+"ditar",NULL_STRING,NULL_STRING}
oCCEditar:TooltipText := "Edita o Item em destaque"

oCCTabular := PushButton{self,ResourceID{JENS_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,_chr(38)+"Ver Itens",NULL_STRING,NULL_STRING}
oCCTabular:TooltipText := "Visualiza todos os Itens"

oCCbuscacodigo := PushButton{self,ResourceID{JENS_BUSCACODIGO,_GetInst()}}
oCCbuscacodigo:Image := ico_find{}
oCCbuscacodigo:HyperLabel := HyperLabel{#buscacodigo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscacodigo:TooltipText := "Localiza um Codigo"

oCCExcluir := PushButton{self,ResourceID{JENS_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}
oCCExcluir:TooltipText := "Exclui o Item e Destaque"

oCCIncluir := PushButton{self,ResourceID{JENS_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}
oCCIncluir:TooltipText := "Inclui um Novo Item"

oDCFixedText3 := FixedText{self,ResourceID{JENS_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"PF",NULL_STRING,NULL_STRING}

oDCFixedText4 := FixedText{self,ResourceID{JENS_FIXEDTEXT4,_GetInst()}}
oDCFixedText4:HyperLabel := HyperLabel{#FixedText4,"Seq/Ssq",NULL_STRING,NULL_STRING}

oCCIMPPFcom := PushButton{self,ResourceID{JENS_IMPPFCOM,_GetInst()}}
oCCIMPPFcom:HyperLabel := HyperLabel{#IMPPFcom,"PF Componente",NULL_STRING,NULL_STRING}
oCCIMPPFcom:TooltipText := "Importar Plano Controle Componente"

oCCExcluir1 := PushButton{self,ResourceID{JENS_EXCLUIR1,_GetInst()}}
oCCExcluir1:HyperLabel := HyperLabel{#Excluir1,"Excluir Todos",NULL_STRING,NULL_STRING}
oCCExcluir1:TooltipText := "Exclui Todos os Itens"

oCCCMDRENUM := PushButton{self,ResourceID{JENS_CMDRENUM,_GetInst()}}
oCCCMDRENUM:HyperLabel := HyperLabel{#CMDRENUM,"Renumerar",NULL_STRING,NULL_STRING}
oCCCMDRENUM:TooltipText := "Exclui Todos os Itens"

oCCIMPPFSEQ1 := PushButton{self,ResourceID{JENS_IMPPFSEQ1,_GetInst()}}
oCCIMPPFSEQ1:HyperLabel := HyperLabel{#IMPPFSEQ1,"PFP Seq/SSQ",NULL_STRING,NULL_STRING}
oCCIMPPFSEQ1:TooltipText := "Importar Plano Controle Preliminar Seq/ssq"

oCCIMPPFcom1 := PushButton{self,ResourceID{JENS_IMPPFCOM1,_GetInst()}}
oCCIMPPFcom1:HyperLabel := HyperLabel{#IMPPFcom1,"PFP Componente",NULL_STRING,NULL_STRING}
oCCIMPPFcom1:TooltipText := "Importar Plano Controle Preliminar Componente"

oCCIMPPFcom2 := PushButton{self,ResourceID{JENS_IMPPFCOM2,_GetInst()}}
oCCIMPPFcom2:HyperLabel := HyperLabel{#IMPPFcom2,"PF Receb.",NULL_STRING,NULL_STRING}
oCCIMPPFcom2:TooltipText := "Importar Plano Controle Recebimento"

oCCIMPPFcom3 := PushButton{self,ResourceID{JENS_IMPPFCOM3,_GetInst()}}
oCCIMPPFcom3:HyperLabel := HyperLabel{#IMPPFcom3,"PFP Recebimento",NULL_STRING,NULL_STRING}
oCCIMPPFcom3:TooltipText := "Importar Plano Controle Preliminar Recebimento"

oCCCHKTIPO := PushButton{self,ResourceID{JENS_CHKTIPO,_GetInst()}}
oCCCHKTIPO:HyperLabel := HyperLabel{#CHKTIPO,"Checar Tipo",NULL_STRING,NULL_STRING}

oCCcmdesctipa := PushButton{self,ResourceID{JENS_CMDESCTIPA,_GetInst()}}
oCCcmdesctipa:HyperLabel := HyperLabel{#cmdesctipa,"Escolher Ensaios",NULL_STRING,NULL_STRING}

oCCcmdmargp12 := PushButton{self,ResourceID{JENS_CMDMARGP12,_GetInst()}}
oCCcmdmargp12:HyperLabel := HyperLabel{#cmdmargp12,"Marcar GP12",NULL_STRING,NULL_STRING}

oCCcmddesgp12 := PushButton{self,ResourceID{JENS_CMDDESGP12,_GetInst()}}
oCCcmddesgp12:HyperLabel := HyperLabel{#cmddesgp12,"DesMarcar GP12",NULL_STRING,NULL_STRING}

oCCcmdvergp12 := PushButton{self,ResourceID{JENS_CMDVERGP12,_GetInst()}}
oCCcmdvergp12:HyperLabel := HyperLabel{#cmdvergp12,"Verificar GP12",NULL_STRING,NULL_STRING}

oCCcmdvergp13 := PushButton{self,ResourceID{JENS_CMDVERGP13,_GetInst()}}
oCCcmdvergp13:HyperLabel := HyperLabel{#cmdvergp13,"Verificar Mar Racf",NULL_STRING,NULL_STRING}

oCCcmdesctipa1 := PushButton{self,ResourceID{JENS_CMDESCTIPA1,_GetInst()}}
oCCcmdesctipa1:HyperLabel := HyperLabel{#cmdesctipa1,"Escolher Conf Certi.",NULL_STRING,NULL_STRING}

oCCExcluir2 := PushButton{self,ResourceID{JENS_EXCLUIR2,_GetInst()}}
oCCExcluir2:HyperLabel := HyperLabel{#Excluir2,"Excluir Todos",NULL_STRING,NULL_STRING}
oCCExcluir2:TooltipText := "Exclui Todos os Itens"

oCCCMDRENUM1 := PushButton{self,ResourceID{JENS_CMDRENUM1,_GetInst()}}
oCCCMDRENUM1:HyperLabel := HyperLabel{#CMDRENUM1,"Renumerar",NULL_STRING,NULL_STRING}
oCCCMDRENUM1:TooltipText := "Exclui Todos os Itens"

oCCExcluir3 := PushButton{self,ResourceID{JENS_EXCLUIR3,_GetInst()}}
oCCExcluir3:HyperLabel := HyperLabel{#Excluir3,"Excluir",NULL_STRING,NULL_STRING}
oCCExcluir3:TooltipText := "Exclui o Item e Destaque"

oCCIncluir1 := PushButton{self,ResourceID{JENS_INCLUIR1,_GetInst()}}
oCCIncluir1:HyperLabel := HyperLabel{#Incluir1,"Incluir",NULL_STRING,NULL_STRING}
oCCIncluir1:TooltipText := "Inclui um Novo Item"

oCCTabular1 := PushButton{self,ResourceID{JENS_TABULAR1,_GetInst()}}
oCCTabular1:HyperLabel := HyperLabel{#Tabular1,_chr(38)+"Ver Itens",NULL_STRING,NULL_STRING}
oCCTabular1:TooltipText := "Visualiza todos os Itens"

oCCEditar1 := PushButton{self,ResourceID{JENS_EDITAR1,_GetInst()}}
oCCEditar1:HyperLabel := HyperLabel{#Editar1,"E"+_chr(38)+"ditar",NULL_STRING,NULL_STRING}
oCCEditar1:TooltipText := "Edita o Item em destaque"

oCCcmdimp := PushButton{self,ResourceID{JENS_CMDIMP,_GetInst()}}
oCCcmdimp:HyperLabel := HyperLabel{#cmdimp,"Importar",NULL_STRING,NULL_STRING}

oCCcmdimp1 := PushButton{self,ResourceID{JENS_CMDIMP1,_GetInst()}}
oCCcmdimp1:HyperLabel := HyperLabel{#cmdimp1,"Importar",NULL_STRING,NULL_STRING}

oDCcodimp01 := rightSle{self,ResourceID{JENS_CODIMP01,_GetInst()}}
oDCcodimp01:HyperLabel := HyperLabel{#codimp01,NULL_STRING,NULL_STRING,NULL_STRING}
oDCcodimp01:TooltipText := "Codigo para Importar"
oDCcodimp01:FieldSpec := PADRAO_CHAR_24{}

oDCcodimp02 := rightSle{self,ResourceID{JENS_CODIMP02,_GetInst()}}
oDCcodimp02:HyperLabel := HyperLabel{#codimp02,NULL_STRING,NULL_STRING,NULL_STRING}
oDCcodimp02:TooltipText := "Codigo para Importar"
oDCcodimp02:FieldSpec := PADRAO_CHAR_24{}

oDCCODIGOINT := SingleLineEdit{self,ResourceID{JENS_CODIGOINT,_GetInst()}}
oDCCODIGOINT:FieldSpec := padrao_CHAR_24{}
oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT,NULL_STRING,NULL_STRING,NULL_STRING}
oDCCODIGOINT:TooltipText := "Observações sobre entrega"

oDCFT10 := FixedText{self,ResourceID{JENS_FT10,_GetInst()}}
oDCFT10:HyperLabel := HyperLabel{#FT10,"Codigo Integrado",NULL_STRING,NULL_STRING}

oCCescPF := PushButton{self,ResourceID{JENS_ESCPF,_GetInst()}}
oCCescPF:HyperLabel := HyperLabel{#escPF,"...",NULL_STRING,NULL_STRING}
oCCescPF:TooltipText := "Escolher o PF"
oCCescPF:Image := ico_FIND{}

oCCImpMC := PushButton{self,ResourceID{JENS_IMPMC,_GetInst()}}
oCCImpMC:HyperLabel := HyperLabel{#ImpMC,"MC",NULL_STRING,NULL_STRING}

self:Caption := "Ensaios"
self:Menu := STANDARDSHELLMENU{}
self:HyperLabel := HyperLabel{#JENS,"Ensaios",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCODIGO := DataColumn{PADRAO_CHAR_24{}}
oDBCODIGO:Width := 19
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
oDBCODIGO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCODIGO)

oDBNOME := DataColumn{PADRAO_CHAR_50{}}
oDBNOME:Width := 41
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)

oDBNOM2 := DataColumn{PADRAO_CHAR_50{}}
oDBNOM2:Width := 22
oDBNOM2:HyperLabel := oDCNOM2:HyperLabel 
oDBNOM2:Caption := "Nom2:"
oDBNOM2:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOM2)

oDBAPLICACAO := DataColumn{PADRAO_CHAR_50{}}
oDBAPLICACAO:Width := 27
oDBAPLICACAO:HyperLabel := oDCAPLICACAO:HyperLabel 
oDBAPLICACAO:Caption := "Aplicacao:"
oDBAPLICACAO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBAPLICACAO)


self:ViewAs(#FormView)

oSFJENSI := JENSI{self,JENS_JENSI}
oSFJENSI:show()

oSFJCRMENS := JCRMENS{self,JENS_JCRMENS}
oSFJCRMENS:show()

oSFJENSR := JENSR{self,JENS_JENSR}
oSFJENSR:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOM2() 
return self:FieldGet(#NOM2)


assign NOM2(uValue) 
self:FieldPut(#NOM2, uValue)
return NOM2 := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access nPF() 
return self:FieldGet(#nPF)


assign nPF(uValue) 
self:FieldPut(#nPF, uValue)
return nPF := uValue


access nSEQ() 
return self:FieldGet(#nSEQ)


assign nSEQ(uValue) 
self:FieldPut(#nSEQ, uValue)
return nSEQ := uValue


access nSSQ() 
return self:FieldGet(#nSSQ)


assign nSSQ(uValue) 
self:FieldPut(#nSSQ, uValue)
return nSSQ := uValue


END CLASS
