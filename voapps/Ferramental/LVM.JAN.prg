#region DEFINES
STATIC DEFINE JLVM_ACESSOR := 118 
STATIC DEFINE JLVM_BUSCA := 140 
STATIC DEFINE JLVM_CHECAR := 138 
STATIC DEFINE JLVM_CONTABIL := 119 
STATIC DEFINE JLVM_DATA := 116 
STATIC DEFINE JLVM_ESCRES := 139 
STATIC DEFINE JLVM_EXCLUIR := 134 
STATIC DEFINE JLVM_FABRICANTE := 120 
STATIC DEFINE JLVM_GROUPBOX1 := 131 
STATIC DEFINE JLVM_HORAS := 130 
STATIC DEFINE JLVM_IMPRO := 137 
STATIC DEFINE JLVM_INCLUIR := 135 
STATIC DEFINE JLVM_JLVMI := 136 
STATIC DEFINE JLVM_LVM := 113 
STATIC DEFINE JLVM_MODELO := 121 
STATIC DEFINE JLVM_NOME := 115 
STATIC DEFINE JLVM_NORMAL := 133 
STATIC DEFINE JLVM_NUMERO := 114 
STATIC DEFINE JLVM_OBS01 := 124 
STATIC DEFINE JLVM_OBS02 := 125 
STATIC DEFINE JLVM_OBS03 := 126 
STATIC DEFINE JLVM_OBS04 := 127 
STATIC DEFINE JLVM_OBS05 := 128 
STATIC DEFINE JLVM_ORDEM := 142 
STATIC DEFINE JLVM_PEGTEC := 141 
STATIC DEFINE JLVM_REPARAR := 132 
STATIC DEFINE JLVM_RO := 129 
STATIC DEFINE JLVM_SC_ACESSOR := 105 
STATIC DEFINE JLVM_SC_CONTABIL := 106 
STATIC DEFINE JLVM_SC_DATA := 103 
STATIC DEFINE JLVM_SC_FABRICANTE := 107 
STATIC DEFINE JLVM_SC_HORAS := 112 
STATIC DEFINE JLVM_SC_LVM := 100 
STATIC DEFINE JLVM_SC_MODELO := 108 
STATIC DEFINE JLVM_SC_NOME := 102 
STATIC DEFINE JLVM_SC_NUMERO := 101 
STATIC DEFINE JLVM_SC_RO := 111 
STATIC DEFINE JLVM_SC_SETOR := 104 
STATIC DEFINE JLVM_SC_TECNICO := 109 
STATIC DEFINE JLVM_SC_TECNOME := 110 
STATIC DEFINE JLVM_SETOR := 117 
STATIC DEFINE JLVM_TECNICO := 122 
STATIC DEFINE JLVM_TECNOME := 123 
#endregion

PARTIAL class JLVM inherit MYDataWindow 

	PROTECT oDBLVM as DataColumn
	PROTECT oDBRO as DataColumn
	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBTECNICO as DataColumn
	PROTECT oDBTECNOME as DataColumn
	protect oDCSC_LVM as FIXEDTEXT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_SETOR as FIXEDTEXT
	protect oDCSC_ACESSOR as FIXEDTEXT
	protect oDCSC_CONTABIL as FIXEDTEXT
	protect oDCSC_FABRICANTE as FIXEDTEXT
	protect oDCSC_MODELO as FIXEDTEXT
	protect oDCSC_TECNICO as FIXEDTEXT
	protect oDCSC_TECNOME as FIXEDTEXT
	protect oDCSC_RO as FIXEDTEXT
	protect oDCSC_HORAS as FIXEDTEXT
	protect oDCLVM as SINGLELINEEDIT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCDATA as DATESLE
	protect oDCSETOR as SINGLELINEEDIT
	protect oDCACESSOR as SINGLELINEEDIT
	protect oDCCONTABIL as SINGLELINEEDIT
	protect oDCFABRICANTE as SINGLELINEEDIT
	protect oDCMODELO as SINGLELINEEDIT
	protect oDCTECNICO as RIGHTSLE
	protect oDCTECNOME as SINGLELINEEDIT
	protect oDCOBS01 as SINGLELINEEDIT
	protect oDCOBS02 as SINGLELINEEDIT
	protect oDCOBS03 as SINGLELINEEDIT
	protect oDCOBS04 as SINGLELINEEDIT
	protect oDCOBS05 as SINGLELINEEDIT
	protect oDCRO as SINGLELINEEDIT
	protect oDCHORAS as RIGHTSLE
	protect oDCGroupBox1 as GROUPBOX
	protect oCCReparar as PUSHBUTTON
	protect oCCNormal as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCIncluir as PUSHBUTTON
	protect oCCIMPRO as PUSHBUTTON
	protect oCCcHECAR as PUSHBUTTON
	protect oCCescres as PUSHBUTTON
	protect oCCbusca as PUSHBUTTON
	protect oCCpegtec as PUSHBUTTON
	protect oCCordem as PUSHBUTTON
// 	instance LVM 
// 	instance NUMERO 
// 	instance NOME 
// 	instance DATA 
// 	instance SETOR 
// 	instance ACESSOR 
// 	instance CONTABIL 
// 	instance FABRICANTE 
// 	instance MODELO 
// 	instance TECNICO 
// 	instance TECNOME 
// 	instance OBS01 
// 	instance OBS02 
// 	instance OBS03 
// 	instance OBS04 
// 	instance OBS05 
// 	instance RO 
// 	instance HORAS 
	protect oSFJLVMI as JLVMI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ACESSOR() 
return self:FieldGet(#ACESSOR)


assign ACESSOR(uValue) 
self:FieldPut(#ACESSOR, uValue)
return ACESSOR := uValue


access CONTABIL() 
return self:FieldGet(#CONTABIL)


assign CONTABIL(uValue) 
self:FieldPut(#CONTABIL, uValue)
return CONTABIL := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access FABRICANTE() 
return self:FieldGet(#FABRICANTE)


assign FABRICANTE(uValue) 
self:FieldPut(#FABRICANTE, uValue)
return FABRICANTE := uValue


access HORAS() 
return self:FieldGet(#HORAS)


assign HORAS(uValue) 
self:FieldPut(#HORAS, uValue)
return HORAS := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JLVM",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_LVM := FixedText{self,ResourceID{JLVM_SC_LVM,_GetInst()}}
oDCSC_LVM:HyperLabel := HyperLabel{#SC_LVM,"Lvm:",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JLVM_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JLVM_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JLVM_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_SETOR := FixedText{self,ResourceID{JLVM_SC_SETOR,_GetInst()}}
oDCSC_SETOR:HyperLabel := HyperLabel{#SC_SETOR,"Setor:",NULL_STRING,NULL_STRING}

oDCSC_ACESSOR := FixedText{self,ResourceID{JLVM_SC_ACESSOR,_GetInst()}}
oDCSC_ACESSOR:HyperLabel := HyperLabel{#SC_ACESSOR,"Acessorios:",NULL_STRING,NULL_STRING}

oDCSC_CONTABIL := FixedText{self,ResourceID{JLVM_SC_CONTABIL,_GetInst()}}
oDCSC_CONTABIL:HyperLabel := HyperLabel{#SC_CONTABIL,"No.Patrimonio",NULL_STRING,NULL_STRING}

oDCSC_FABRICANTE := FixedText{self,ResourceID{JLVM_SC_FABRICANTE,_GetInst()}}
oDCSC_FABRICANTE:HyperLabel := HyperLabel{#SC_FABRICANTE,"Fabricante:",NULL_STRING,NULL_STRING}

oDCSC_MODELO := FixedText{self,ResourceID{JLVM_SC_MODELO,_GetInst()}}
oDCSC_MODELO:HyperLabel := HyperLabel{#SC_MODELO,"Modelo:",NULL_STRING,NULL_STRING}

oDCSC_TECNICO := FixedText{self,ResourceID{JLVM_SC_TECNICO,_GetInst()}}
oDCSC_TECNICO:HyperLabel := HyperLabel{#SC_TECNICO,"Tecnico:",NULL_STRING,NULL_STRING}

oDCSC_TECNOME := FixedText{self,ResourceID{JLVM_SC_TECNOME,_GetInst()}}
oDCSC_TECNOME:HyperLabel := HyperLabel{#SC_TECNOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_RO := FixedText{self,ResourceID{JLVM_SC_RO,_GetInst()}}
oDCSC_RO:HyperLabel := HyperLabel{#SC_RO,"Ro:",NULL_STRING,NULL_STRING}

oDCSC_HORAS := FixedText{self,ResourceID{JLVM_SC_HORAS,_GetInst()}}
oDCSC_HORAS:HyperLabel := HyperLabel{#SC_HORAS,"Horas:",NULL_STRING,NULL_STRING}

oDCLVM := SingleLineEdit{self,ResourceID{JLVM_LVM,_GetInst()}}
oDCLVM:FieldSpec := PADRAO_NUM_08{}
oDCLVM:HyperLabel := HyperLabel{#LVM,"Lvm:",NULL_STRING,"Lvm_LVM"}
oDCLVM:BackGround := aBrushes[1]
oDCLVM:Font(aFonts[1], FALSE)

oDCNUMERO := SingleLineEdit{self,ResourceID{JLVM_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"Lvm_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]
oDCNUMERO:Font(aFonts[2], FALSE)

oDCNOME := SingleLineEdit{self,ResourceID{JLVM_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"Lvm_NOME"}
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[2], FALSE)

oDCDATA := DateSle{self,ResourceID{JLVM_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"Lvm_DATA"}

oDCSETOR := SingleLineEdit{self,ResourceID{JLVM_SETOR,_GetInst()}}
oDCSETOR:FieldSpec := PADRAO_CHAR_10{}
oDCSETOR:HyperLabel := HyperLabel{#SETOR,"Setor:",NULL_STRING,"Lvm_SETOR"}
oDCSETOR:BackGround := aBrushes[1]
oDCSETOR:Font(aFonts[2], FALSE)

oDCACESSOR := SingleLineEdit{self,ResourceID{JLVM_ACESSOR,_GetInst()}}
oDCACESSOR:FieldSpec := PADRAO_CHAR_20{}
oDCACESSOR:HyperLabel := HyperLabel{#ACESSOR,"Acessor:",NULL_STRING,"Lvm_ACESSOR"}

oDCCONTABIL := SingleLineEdit{self,ResourceID{JLVM_CONTABIL,_GetInst()}}
oDCCONTABIL:FieldSpec := PADRAO_CHAR_08{}
oDCCONTABIL:HyperLabel := HyperLabel{#CONTABIL,"Contabil:",NULL_STRING,"Lvm_CONTABIL"}
oDCCONTABIL:BackGround := aBrushes[1]
oDCCONTABIL:Font(aFonts[2], FALSE)

oDCFABRICANTE := SingleLineEdit{self,ResourceID{JLVM_FABRICANTE,_GetInst()}}
oDCFABRICANTE:FieldSpec := PADRAO_CHAR_20{}
oDCFABRICANTE:HyperLabel := HyperLabel{#FABRICANTE,"Fabricante:",NULL_STRING,"Lvm_FABRICANTE"}
oDCFABRICANTE:BackGround := aBrushes[1]
oDCFABRICANTE:Font(aFonts[2], FALSE)

oDCMODELO := SingleLineEdit{self,ResourceID{JLVM_MODELO,_GetInst()}}
oDCMODELO:FieldSpec := PADRAO_CHAR_20{}
oDCMODELO:HyperLabel := HyperLabel{#MODELO,"Modelo:",NULL_STRING,"Lvm_MODELO"}
oDCMODELO:BackGround := aBrushes[1]
oDCMODELO:Font(aFonts[2], FALSE)

oDCTECNICO := rightSle{self,ResourceID{JLVM_TECNICO,_GetInst()}}
oDCTECNICO:FieldSpec := PADRAO_NUM_08{}
oDCTECNICO:HyperLabel := HyperLabel{#TECNICO,"Tecnico:",NULL_STRING,"Lvm_TECNICO"}

oDCTECNOME := SingleLineEdit{self,ResourceID{JLVM_TECNOME,_GetInst()}}
oDCTECNOME:FieldSpec := PADRAO_CHAR_40{}
oDCTECNOME:HyperLabel := HyperLabel{#TECNOME,"Tecnome:",NULL_STRING,"Lvm_TECNOME"}
oDCTECNOME:BackGround := aBrushes[1]
oDCTECNOME:Font(aFonts[2], FALSE)

oDCOBS01 := SingleLineEdit{self,ResourceID{JLVM_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := PADRAO_CHAR_60{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Obs01:",NULL_STRING,"Lvm_OBS01"}

oDCOBS02 := SingleLineEdit{self,ResourceID{JLVM_OBS02,_GetInst()}}
oDCOBS02:FieldSpec := PADRAO_CHAR_60{}
oDCOBS02:HyperLabel := HyperLabel{#OBS02,"Obs02:",NULL_STRING,"Lvm_OBS02"}

oDCOBS03 := SingleLineEdit{self,ResourceID{JLVM_OBS03,_GetInst()}}
oDCOBS03:FieldSpec := PADRAO_CHAR_60{}
oDCOBS03:HyperLabel := HyperLabel{#OBS03,"Obs03:",NULL_STRING,"Lvm_OBS03"}

oDCOBS04 := SingleLineEdit{self,ResourceID{JLVM_OBS04,_GetInst()}}
oDCOBS04:FieldSpec := PADRAO_CHAR_60{}
oDCOBS04:HyperLabel := HyperLabel{#OBS04,"Obs04:",NULL_STRING,"Lvm_OBS04"}

oDCOBS05 := SingleLineEdit{self,ResourceID{JLVM_OBS05,_GetInst()}}
oDCOBS05:FieldSpec := PADRAO_CHAR_60{}
oDCOBS05:HyperLabel := HyperLabel{#OBS05,"Obs05:",NULL_STRING,"Lvm_OBS05"}

oDCRO := SingleLineEdit{self,ResourceID{JLVM_RO,_GetInst()}}
oDCRO:FieldSpec := PADRAO_NUM_08{}
oDCRO:HyperLabel := HyperLabel{#RO,"Ro:",NULL_STRING,"Lvm_RO"}
oDCRO:BackGround := aBrushes[1]
oDCRO:Font(aFonts[2], FALSE)

oDCHORAS := rightSle{self,ResourceID{JLVM_HORAS,_GetInst()}}
oDCHORAS:FieldSpec := PADRAO_NUM_06_2{}
oDCHORAS:HyperLabel := HyperLabel{#HORAS,"Horas:",NULL_STRING,"Lvm_HORAS"}

oDCGroupBox1 := GroupBox{self,ResourceID{JLVM_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Observação",NULL_STRING,NULL_STRING}

oCCReparar := PushButton{self,ResourceID{JLVM_REPARAR,_GetInst()}}
oCCReparar:HyperLabel := HyperLabel{#Reparar,"Reparar",NULL_STRING,NULL_STRING}

oCCNormal := PushButton{self,ResourceID{JLVM_NORMAL,_GetInst()}}
oCCNormal:HyperLabel := HyperLabel{#Normal,"Normal",NULL_STRING,NULL_STRING}

oCCExcluir := PushButton{self,ResourceID{JLVM_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}

oCCIncluir := PushButton{self,ResourceID{JLVM_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}

oCCIMPRO := PushButton{self,ResourceID{JLVM_IMPRO,_GetInst()}}
oCCIMPRO:HyperLabel := HyperLabel{#IMPRO,"Importar RO",NULL_STRING,NULL_STRING}

oCCcHECAR := PushButton{self,ResourceID{JLVM_CHECAR,_GetInst()}}
oCCcHECAR:HyperLabel := HyperLabel{#cHECAR,"Checar",NULL_STRING,NULL_STRING}

oCCescres := PushButton{self,ResourceID{JLVM_ESCRES,_GetInst()}}
oCCescres:HyperLabel := HyperLabel{#escres,"...",NULL_STRING,NULL_STRING}

oCCbusca := PushButton{self,ResourceID{JLVM_BUSCA,_GetInst()}}
oCCbusca:Image := ICO_FIND{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

oCCpegtec := PushButton{self,ResourceID{JLVM_PEGTEC,_GetInst()}}
oCCpegtec:HyperLabel := HyperLabel{#pegtec,"-->",NULL_STRING,NULL_STRING}

oCCordem := PushButton{self,ResourceID{JLVM_ORDEM,_GetInst()}}
oCCordem:Image := ico_az{}
oCCordem:HyperLabel := HyperLabel{#ordem,NULL_STRING,NULL_STRING,NULL_STRING}
oCCordem:TooltipText := "Ordenar Por Numero"

self:Caption := "Lista de Verificação de Maquinas"
self:HyperLabel := HyperLabel{#JLVM,"Lista de Verificação de Maquinas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBLVM := DataColumn{PADRAO_NUM_08{}}
oDBLVM:Width := 11
oDBLVM:HyperLabel := oDCLVM:HyperLabel 
oDBLVM:Caption := "Lvm:"
oDBLVM:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBLVM)

oDBRO := DataColumn{PADRAO_NUM_08{}}
oDBRO:Width := 9
oDBRO:HyperLabel := oDCRO:HyperLabel 
oDBRO:Caption := "Ro:"
oDBRO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRO)

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 12
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBNOME := DataColumn{PADRAO_CHAR_40{}}
oDBNOME:Width := 15
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 9
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)

oDBTECNICO := DataColumn{PADRAO_NUM_08{}}
oDBTECNICO:Width := 18
oDBTECNICO:HyperLabel := oDCTECNICO:HyperLabel 
oDBTECNICO:Caption := "Tecnico:"
self:Browser:AddColumn(oDBTECNICO)

oDBTECNOME := DataColumn{PADRAO_CHAR_40{}}
oDBTECNOME:Width := 16
oDBTECNOME:HyperLabel := oDCTECNOME:HyperLabel 
oDBTECNOME:Caption := "Tecnome:"
oDBTECNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTECNOME)


self:ViewAs(#FormView)

oSFJLVMI := JLVMI{self,JLVM_JLVMI}
oSFJLVMI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LVM() 
return self:FieldGet(#LVM)


assign LVM(uValue) 
self:FieldPut(#LVM, uValue)
return LVM := uValue


access MODELO() 
return self:FieldGet(#MODELO)


assign MODELO(uValue) 
self:FieldPut(#MODELO, uValue)
return MODELO := uValue


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


access OBS01() 
return self:FieldGet(#OBS01)


assign OBS01(uValue) 
self:FieldPut(#OBS01, uValue)
return OBS01 := uValue


access OBS02() 
return self:FieldGet(#OBS02)


assign OBS02(uValue) 
self:FieldPut(#OBS02, uValue)
return OBS02 := uValue


access OBS03() 
return self:FieldGet(#OBS03)


assign OBS03(uValue) 
self:FieldPut(#OBS03, uValue)
return OBS03 := uValue


access OBS04() 
return self:FieldGet(#OBS04)


assign OBS04(uValue) 
self:FieldPut(#OBS04, uValue)
return OBS04 := uValue


access OBS05() 
return self:FieldGet(#OBS05)


assign OBS05(uValue) 
self:FieldPut(#OBS05, uValue)
return OBS05 := uValue


METHOD ordem( ) 
	SELF:KeyFind()

access RO() 
return self:FieldGet(#RO)


assign RO(uValue) 
self:FieldPut(#RO, uValue)
return RO := uValue


access SETOR() 
return self:FieldGet(#SETOR)


assign SETOR(uValue) 
self:FieldPut(#SETOR, uValue)
return SETOR := uValue


access TECNICO() 
return self:FieldGet(#TECNICO)


assign TECNICO(uValue) 
self:FieldPut(#TECNICO, uValue)
return TECNICO := uValue


access TECNOME() 
return self:FieldGet(#TECNOME)


assign TECNOME(uValue) 
self:FieldPut(#TECNOME, uValue)
return TECNOME := uValue


END CLASS
