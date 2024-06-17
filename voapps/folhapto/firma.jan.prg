#region DEFINES
STATIC DEFINE JFIRMA_BAIRRO := 103 
STATIC DEFINE JFIRMA_BUSCANUM := 127 
STATIC DEFINE JFIRMA_CEP := 106 
STATIC DEFINE JFIRMA_CGC := 109 
STATIC DEFINE JFIRMA_CIDADE := 105 
STATIC DEFINE JFIRMA_CMDCHECKUF := 129 
STATIC DEFINE JFIRMA_CMDORDENAR := 128 
STATIC DEFINE JFIRMA_CMDPESSOA := 125 
STATIC DEFINE JFIRMA_CODEMPMIG := 132 
STATIC DEFINE JFIRMA_CODMANA5 := 134 
STATIC DEFINE JFIRMA_COGNOME := 100 
STATIC DEFINE JFIRMA_ENDERECO := 102 
STATIC DEFINE JFIRMA_ESCUF := 131 
STATIC DEFINE JFIRMA_ESTADO := 104 
STATIC DEFINE JFIRMA_FAX := 108 
STATIC DEFINE JFIRMA_IMGCON := 111 
STATIC DEFINE JFIRMA_INSC := 110 
STATIC DEFINE JFIRMA_NRCLIEN := 123 
STATIC DEFINE JFIRMA_PESSOA := 124 
STATIC DEFINE JFIRMA_RAZAO := 101 
STATIC DEFINE JFIRMA_SC_BAIRRO := 116 
STATIC DEFINE JFIRMA_SC_CEP := 118 
STATIC DEFINE JFIRMA_SC_CGC := 121 
STATIC DEFINE JFIRMA_SC_CGC1 := 126 
STATIC DEFINE JFIRMA_SC_CIDADE := 117 
STATIC DEFINE JFIRMA_SC_COGNOME := 113 
STATIC DEFINE JFIRMA_SC_ENDERECO := 115 
STATIC DEFINE JFIRMA_SC_ESTADO := 130 
STATIC DEFINE JFIRMA_SC_ESTADO1 := 133 
STATIC DEFINE JFIRMA_SC_ESTADO2 := 135 
STATIC DEFINE JFIRMA_SC_FAX := 120 
STATIC DEFINE JFIRMA_SC_INSC := 122 
STATIC DEFINE JFIRMA_SC_NRCLIEN := 112 
STATIC DEFINE JFIRMA_SC_RAZAO := 114 
STATIC DEFINE JFIRMA_SC_TELEFONE := 119 
STATIC DEFINE JFIRMA_TELEFONE := 107 
#endregion

PARTIAL class JFIRMA inherit MYDataWindow 

	PROTECT oDBNRCLIEN as DataColumn
	PROTECT oDBCOGNOME as DataColumn
	PROTECT oDBRAZAO as DataColumn
	protect oDCCOGNOME as SINGLELINEEDIT
	protect oDCRAZAO as SINGLELINEEDIT
	protect oDCENDERECO as SINGLELINEEDIT
	protect oDCBAIRRO as SINGLELINEEDIT
	protect oDCESTADO as SINGLELINEEDIT
	protect oDCCIDADE as SINGLELINEEDIT
	protect oDCCEP as SINGLELINEEDIT
	protect oDCTELEFONE as SINGLELINEEDIT
	protect oDCFAX as SINGLELINEEDIT
	protect oDCCGC as SINGLELINEEDIT
	protect oDCINSC as SINGLELINEEDIT
	protect oDCIMGCON as SINGLELINEEDIT
	protect oDCSC_NRCLIEN as FIXEDTEXT
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCSC_RAZAO as FIXEDTEXT
	protect oDCSC_ENDERECO as FIXEDTEXT
	protect oDCSC_BAIRRO as FIXEDTEXT
	protect oDCSC_CIDADE as FIXEDTEXT
	protect oDCSC_CEP as FIXEDTEXT
	protect oDCSC_TELEFONE as FIXEDTEXT
	protect oDCSC_FAX as FIXEDTEXT
	protect oDCSC_CGC as FIXEDTEXT
	protect oDCSC_INSC as FIXEDTEXT
	protect oDCNRCLIEN as SINGLELINEEDIT
	protect oDCPESSOA as SINGLELINEEDIT
	protect oCCcmdPESSOA as PUSHBUTTON
	protect oDCSC_CGC1 as FIXEDTEXT
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCCMDCHECKUF as PUSHBUTTON
	protect oDCSC_ESTADO as FIXEDTEXT
	protect oCCescUF as PUSHBUTTON
	protect oDCCODEMPMIG as SINGLELINEEDIT
	protect oDCSC_ESTADO1 as FIXEDTEXT
	protect oDCCODMANA5 as SINGLELINEEDIT
	protect oDCSC_ESTADO2 as FIXEDTEXT
// 	instance COGNOME 
// 	instance RAZAO 
// 	instance ENDERECO 
// 	instance BAIRRO 
// 	instance ESTADO 
// 	instance CIDADE 
// 	instance CEP 
// 	instance TELEFONE 
// 	instance FAX 
// 	instance CGC 
// 	instance INSC 
// 	instance IMGCON 
// 	instance NRCLIEN 
// 	instance PESSOA 
// 	instance CODEMPMIG 
// 	instance CODMANA5 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access BAIRRO() 
return self:FieldGet(#BAIRRO)


assign BAIRRO(uValue) 
self:FieldPut(#BAIRRO, uValue)
return BAIRRO := uValue


access CEP() 
return self:FieldGet(#CEP)


assign CEP(uValue) 
self:FieldPut(#CEP, uValue)
return CEP := uValue


access CGC() 
return self:FieldGet(#CGC)


assign CGC(uValue) 
self:FieldPut(#CGC, uValue)
return CGC := uValue


access CIDADE() 
return self:FieldGet(#CIDADE)


assign CIDADE(uValue) 
self:FieldPut(#CIDADE, uValue)
return CIDADE := uValue


access CODEMPMIG() 
return self:FieldGet(#CODEMPMIG)


assign CODEMPMIG(uValue) 
self:FieldPut(#CODEMPMIG, uValue)
return CODEMPMIG := uValue


access CODMANA5() 
return self:FieldGet(#CODMANA5)


assign CODMANA5(uValue) 
self:FieldPut(#CODMANA5, uValue)
return CODMANA5 := uValue


access COGNOME() 
return self:FieldGet(#COGNOME)


assign COGNOME(uValue) 
self:FieldPut(#COGNOME, uValue)
return COGNOME := uValue


access ENDERECO() 
return self:FieldGet(#ENDERECO)


assign ENDERECO(uValue) 
self:FieldPut(#ENDERECO, uValue)
return ENDERECO := uValue


access ESTADO() 
return self:FieldGet(#ESTADO)


assign ESTADO(uValue) 
self:FieldPut(#ESTADO, uValue)
return ESTADO := uValue


access FAX() 
return self:FieldGet(#FAX)


assign FAX(uValue) 
self:FieldPut(#FAX, uValue)
return FAX := uValue


access IMGCON() 
return self:FieldGet(#IMGCON)


assign IMGCON(uValue) 
self:FieldPut(#IMGCON, uValue)
return IMGCON := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JFIRMA",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCCOGNOME := SingleLineEdit{self,ResourceID{JFIRMA_COGNOME,_GetInst()}}
oDCCOGNOME:FieldSpec := PADRAO_CHAR_14{}
oDCCOGNOME:HyperLabel := HyperLabel{#COGNOME,"Cognome:",NULL_STRING,"FIRMA_COGNOME"}
oDCCOGNOME:TooltipText := "Cognome"

oDCRAZAO := SingleLineEdit{self,ResourceID{JFIRMA_RAZAO,_GetInst()}}
oDCRAZAO:FieldSpec := PADRAO_CHAR_40{}
oDCRAZAO:HyperLabel := HyperLabel{#RAZAO,"Razao:",NULL_STRING,"FIRMA_RAZAO"}
oDCRAZAO:TooltipText := "Razão Social Nome"

oDCENDERECO := SingleLineEdit{self,ResourceID{JFIRMA_ENDERECO,_GetInst()}}
oDCENDERECO:FieldSpec := PADRAO_CHAR_30{}
oDCENDERECO:HyperLabel := HyperLabel{#ENDERECO,"Endereco:",NULL_STRING,"FIRMA_ENDERECO"}
oDCENDERECO:TooltipText := "Endereco"

oDCBAIRRO := SingleLineEdit{self,ResourceID{JFIRMA_BAIRRO,_GetInst()}}
oDCBAIRRO:FieldSpec := PADRAO_CHAR_15{}
oDCBAIRRO:HyperLabel := HyperLabel{#BAIRRO,"Bairro:",NULL_STRING,"FIRMA_BAIRRO"}
oDCBAIRRO:TooltipText := "Bairro"

oDCESTADO := SingleLineEdit{self,ResourceID{JFIRMA_ESTADO,_GetInst()}}
oDCESTADO:FieldSpec := uf_field{}
oDCESTADO:HyperLabel := HyperLabel{#ESTADO,"Numero:",NULL_STRING,"MA01_NUMERO"}
oDCESTADO:TooltipText := "Digite  o Estado"

oDCCIDADE := SingleLineEdit{self,ResourceID{JFIRMA_CIDADE,_GetInst()}}
oDCCIDADE:FieldSpec := PADRAO_CHAR_15{}
oDCCIDADE:HyperLabel := HyperLabel{#CIDADE,"Cidade:",NULL_STRING,"FIRMA_CIDADE"}
oDCCIDADE:TooltipText := "Cidade"

oDCCEP := SingleLineEdit{self,ResourceID{JFIRMA_CEP,_GetInst()}}
oDCCEP:FieldSpec := PADRAO_CHAR_09{}
oDCCEP:HyperLabel := HyperLabel{#CEP,"Cep:",NULL_STRING,"FIRMA_CEP"}
oDCCEP:TooltipText := "CEP"
oDCCEP:Picture := "99999-999"

oDCTELEFONE := SingleLineEdit{self,ResourceID{JFIRMA_TELEFONE,_GetInst()}}
oDCTELEFONE:FieldSpec := PADRAO_CHAR_12{}
oDCTELEFONE:HyperLabel := HyperLabel{#TELEFONE,"Telefone:",NULL_STRING,"FIRMA_TELEFONE"}
oDCTELEFONE:Picture := "9999-9999"

oDCFAX := SingleLineEdit{self,ResourceID{JFIRMA_FAX,_GetInst()}}
oDCFAX:FieldSpec := PADRAO_CHAR_12{}
oDCFAX:HyperLabel := HyperLabel{#FAX,"Fax:",NULL_STRING,"FIRMA_FAX"}
oDCFAX:Picture := "9999-9999"

oDCCGC := SingleLineEdit{self,ResourceID{JFIRMA_CGC,_GetInst()}}
oDCCGC:FieldSpec := PADRAO_CHAR_18{}
oDCCGC:HyperLabel := HyperLabel{#CGC,"Cgc:",NULL_STRING,"FIRMA_CGC"}

oDCINSC := SingleLineEdit{self,ResourceID{JFIRMA_INSC,_GetInst()}}
oDCINSC:FieldSpec := PADRAO_CHAR_15{}
oDCINSC:HyperLabel := HyperLabel{#INSC,"Insc:",NULL_STRING,"FIRMA_INSC"}

oDCIMGCON := SingleLineEdit{self,ResourceID{JFIRMA_IMGCON,_GetInst()}}
oDCIMGCON:FieldSpec := PADRAO_CHAR_08{}
oDCIMGCON:HyperLabel := HyperLabel{#IMGCON,"Cgc:",NULL_STRING,"FIRMA_CGC"}

oDCSC_NRCLIEN := FixedText{self,ResourceID{JFIRMA_SC_NRCLIEN,_GetInst()}}
oDCSC_NRCLIEN:HyperLabel := HyperLabel{#SC_NRCLIEN,"Nrclien:",NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{self,ResourceID{JFIRMA_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCSC_RAZAO := FixedText{self,ResourceID{JFIRMA_SC_RAZAO,_GetInst()}}
oDCSC_RAZAO:HyperLabel := HyperLabel{#SC_RAZAO,"Razao:",NULL_STRING,NULL_STRING}

oDCSC_ENDERECO := FixedText{self,ResourceID{JFIRMA_SC_ENDERECO,_GetInst()}}
oDCSC_ENDERECO:HyperLabel := HyperLabel{#SC_ENDERECO,"Endereco:",NULL_STRING,NULL_STRING}

oDCSC_BAIRRO := FixedText{self,ResourceID{JFIRMA_SC_BAIRRO,_GetInst()}}
oDCSC_BAIRRO:HyperLabel := HyperLabel{#SC_BAIRRO,"Bairro:",NULL_STRING,NULL_STRING}

oDCSC_CIDADE := FixedText{self,ResourceID{JFIRMA_SC_CIDADE,_GetInst()}}
oDCSC_CIDADE:HyperLabel := HyperLabel{#SC_CIDADE,"Cidade:",NULL_STRING,NULL_STRING}

oDCSC_CEP := FixedText{self,ResourceID{JFIRMA_SC_CEP,_GetInst()}}
oDCSC_CEP:HyperLabel := HyperLabel{#SC_CEP,"Cep:",NULL_STRING,NULL_STRING}

oDCSC_TELEFONE := FixedText{self,ResourceID{JFIRMA_SC_TELEFONE,_GetInst()}}
oDCSC_TELEFONE:HyperLabel := HyperLabel{#SC_TELEFONE,"Telefone:",NULL_STRING,NULL_STRING}

oDCSC_FAX := FixedText{self,ResourceID{JFIRMA_SC_FAX,_GetInst()}}
oDCSC_FAX:HyperLabel := HyperLabel{#SC_FAX,"Fax:",NULL_STRING,NULL_STRING}

oDCSC_CGC := FixedText{self,ResourceID{JFIRMA_SC_CGC,_GetInst()}}
oDCSC_CGC:HyperLabel := HyperLabel{#SC_CGC,"Cgc:",NULL_STRING,NULL_STRING}

oDCSC_INSC := FixedText{self,ResourceID{JFIRMA_SC_INSC,_GetInst()}}
oDCSC_INSC:HyperLabel := HyperLabel{#SC_INSC,"Insc:",NULL_STRING,NULL_STRING}

oDCNRCLIEN := SingleLineEdit{self,ResourceID{JFIRMA_NRCLIEN,_GetInst()}}
oDCNRCLIEN:FieldSpec := PADRAO_NUM_04{}
oDCNRCLIEN:HyperLabel := HyperLabel{#NRCLIEN,"Nrclien:",NULL_STRING,"FIRMA_NRCLIEN"}
oDCNRCLIEN:TooltipText := "Codigo da Empresa"
oDCNRCLIEN:BackGround := aBrushes[1]

oDCPESSOA := SingleLineEdit{self,ResourceID{JFIRMA_PESSOA,_GetInst()}}
oDCPESSOA:FieldSpec := PADRAO_CHAR_01{}
oDCPESSOA:HyperLabel := HyperLabel{#PESSOA,"Estado:",NULL_STRING,"FIRMA_PESSOA"}
oDCPESSOA:TooltipText := "Pessoa (F)isica (J)uridica (O)utros"
oDCPESSOA:BackGround := aBrushes[1]
oDCPESSOA:Font(aFonts[1], FALSE)

oCCcmdPESSOA := PushButton{self,ResourceID{JFIRMA_CMDPESSOA,_GetInst()}}
oCCcmdPESSOA:HyperLabel := HyperLabel{#cmdPESSOA,"Pessoa (F/J/O)",NULL_STRING,NULL_STRING}

oDCSC_CGC1 := FixedText{self,ResourceID{JFIRMA_SC_CGC1,_GetInst()}}
oDCSC_CGC1:HyperLabel := HyperLabel{#SC_CGC1,"Arquivo Fotos Connecção",NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JFIRMA_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JFIRMA_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCCMDCHECKUF := PushButton{self,ResourceID{JFIRMA_CMDCHECKUF,_GetInst()}}
oCCCMDCHECKUF:HyperLabel := HyperLabel{#CMDCHECKUF,"Checar",NULL_STRING,NULL_STRING}

oDCSC_ESTADO := FixedText{self,ResourceID{JFIRMA_SC_ESTADO,_GetInst()}}
oDCSC_ESTADO:HyperLabel := HyperLabel{#SC_ESTADO,"Estado:",NULL_STRING,NULL_STRING}

oCCescUF := PushButton{self,ResourceID{JFIRMA_ESCUF,_GetInst()}}
oCCescUF:HyperLabel := HyperLabel{#escUF,NULL_STRING,NULL_STRING,NULL_STRING}
oCCescUF:Image := ICO_FIND{}

oDCCODEMPMIG := SingleLineEdit{self,ResourceID{JFIRMA_CODEMPMIG,_GetInst()}}
oDCCODEMPMIG:FieldSpec := PADRAO_CHAR_02{}
oDCCODEMPMIG:HyperLabel := HyperLabel{#CODEMPMIG,"Numero:",NULL_STRING,"MA01_NUMERO"}
oDCCODEMPMIG:TooltipText := "Digite  o Estado"

oDCSC_ESTADO1 := FixedText{self,ResourceID{JFIRMA_SC_ESTADO1,_GetInst()}}
oDCSC_ESTADO1:HyperLabel := HyperLabel{#SC_ESTADO1,"Cod Empresa Integrado",NULL_STRING,NULL_STRING}

oDCCODMANA5 := SingleLineEdit{self,ResourceID{JFIRMA_CODMANA5,_GetInst()}}
oDCCODMANA5:FieldSpec := PADRAO_NUM_02{}
oDCCODMANA5:HyperLabel := HyperLabel{#CODMANA5,"Numero:",NULL_STRING,"MA01_NUMERO"}
oDCCODMANA5:TooltipText := "Digite  o Estado"

oDCSC_ESTADO2 := FixedText{self,ResourceID{JFIRMA_SC_ESTADO2,_GetInst()}}
oDCSC_ESTADO2:HyperLabel := HyperLabel{#SC_ESTADO2,"Cod Empresa MANA5",NULL_STRING,NULL_STRING}

self:Caption := "Cadastro de  Empresas"
self:HyperLabel := HyperLabel{#JFIRMA,"Cadastro de  Empresas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNRCLIEN := DataColumn{PADRAO_NUM_04{}}
oDBNRCLIEN:Width := 9
oDBNRCLIEN:HyperLabel := oDCNRCLIEN:HyperLabel 
oDBNRCLIEN:Caption := "Nrclien:"
oDBNRCLIEN:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNRCLIEN)

oDBCOGNOME := DataColumn{PADRAO_CHAR_14{}}
oDBCOGNOME:Width := 10
oDBCOGNOME:HyperLabel := oDCCOGNOME:HyperLabel 
oDBCOGNOME:Caption := "Cognome:"
self:Browser:AddColumn(oDBCOGNOME)

oDBRAZAO := DataColumn{PADRAO_CHAR_40{}}
oDBRAZAO:Width := 43
oDBRAZAO:HyperLabel := oDCRAZAO:HyperLabel 
oDBRAZAO:Caption := "Razao:"
self:Browser:AddColumn(oDBRAZAO)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access INSC() 
return self:FieldGet(#INSC)


assign INSC(uValue) 
self:FieldPut(#INSC, uValue)
return INSC := uValue


access NRCLIEN() 
return self:FieldGet(#NRCLIEN)


assign NRCLIEN(uValue) 
self:FieldPut(#NRCLIEN, uValue)
return NRCLIEN := uValue


access PESSOA() 
return self:FieldGet(#PESSOA)


assign PESSOA(uValue) 
self:FieldPut(#PESSOA, uValue)
return PESSOA := uValue


access RAZAO() 
return self:FieldGet(#RAZAO)


assign RAZAO(uValue) 
self:FieldPut(#RAZAO, uValue)
return RAZAO := uValue


access TELEFONE() 
return self:FieldGet(#TELEFONE)


assign TELEFONE(uValue) 
self:FieldPut(#TELEFONE, uValue)
return TELEFONE := uValue


END CLASS
