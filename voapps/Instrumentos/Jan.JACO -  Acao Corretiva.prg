#region DEFINES
STATIC DEFINE JACO_ACLI01 := 138 
STATIC DEFINE JACO_ACLI02 := 139 
STATIC DEFINE JACO_ACOR01 := 146 
STATIC DEFINE JACO_ACOR02 := 147 
STATIC DEFINE JACO_ACOR03 := 148 
STATIC DEFINE JACO_ACOR04 := 149 
STATIC DEFINE JACO_BUSCAOC := 103 
STATIC DEFINE JACO_CLINOME := 134 
STATIC DEFINE JACO_CODIGO := 112 
STATIC DEFINE JACO_CODIGOS := 130 
STATIC DEFINE JACO_DATAOCD := 111 
STATIC DEFINE JACO_EDITIP := 100 
STATIC DEFINE JACO_ESCTIP := 101 
STATIC DEFINE JACO_FREQ1 := 121 
STATIC DEFINE JACO_FREQ2 := 126 
STATIC DEFINE JACO_INCIDE := 140 
STATIC DEFINE JACO_INSPECAO := 120 
STATIC DEFINE JACO_INVALIDA := 114 
STATIC DEFINE JACO_MOTIVO := 105 
STATIC DEFINE JACO_NF := 136 
STATIC DEFINE JACO_OBS01 := 115 
STATIC DEFINE JACO_OBS02 := 118 
STATIC DEFINE JACO_OBS03 := 119 
STATIC DEFINE JACO_OCD := 108 
STATIC DEFINE JACO_POROC := 102 
STATIC DEFINE JACO_RB1 := 109 
STATIC DEFINE JACO_RB2 := 110 
STATIC DEFINE JACO_RB3 := 116 
STATIC DEFINE JACO_RB4 := 117 
STATIC DEFINE JACO_RB5 := 123 
STATIC DEFINE JACO_RB6 := 124 
STATIC DEFINE JACO_RB7 := 143 
STATIC DEFINE JACO_RESPON := 142 
STATIC DEFINE JACO_SC_ACLI01 := 137 
STATIC DEFINE JACO_SC_ACOR01 := 145 
STATIC DEFINE JACO_SC_CLINOME := 133 
STATIC DEFINE JACO_SC_CODIGO := 107 
STATIC DEFINE JACO_SC_CODIGOS := 129 
STATIC DEFINE JACO_SC_DATAOCD := 106 
STATIC DEFINE JACO_SC_FREQ1 := 122 
STATIC DEFINE JACO_SC_FREQ2 := 125 
STATIC DEFINE JACO_SC_NF := 135 
STATIC DEFINE JACO_SC_OBS01 := 113 
STATIC DEFINE JACO_SC_OCD := 104 
STATIC DEFINE JACO_SC_RESPON := 141 
STATIC DEFINE JACO_SC_VERIFI := 131 
STATIC DEFINE JACO_THEGROUPBOX1 := 127 
STATIC DEFINE JACO_THEGROUPBOX2 := 132 
STATIC DEFINE JACO_THERADIOBUTTON7 := 144 
STATIC DEFINE JACO_VERIFI := 128 
#endregion

PARTIAL class JACO inherit MYDataWindow 

	PROTECT oDBOCD as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDATAOCD as DataColumn
	protect oCCediTIP as PUSHBUTTON
	protect oCCESCTIP as PUSHBUTTON
	protect oCCporoc as PUSHBUTTON
	protect oCCbuscaoc as PUSHBUTTON
	protect oDCSC_OCD as FIXEDTEXT
	protect oDCMOTIVO as RADIOBUTTONGROUP
	protect oDCSC_DATAOCD as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCOCD as SINGLELINEEDIT
	protect oCCRB1 as RADIOBUTTON
	protect oCCRB2 as RADIOBUTTON
	protect oDCDATAOCD as DATESLE
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCSC_OBS01 as FIXEDTEXT
	protect oDCINVALIDA as RADIOBUTTONGROUP
	protect oDCOBS01 as SINGLELINEEDIT
	protect oCCRB3 as RADIOBUTTON
	protect oCCRB4 as RADIOBUTTON
	protect oDCOBS02 as SINGLELINEEDIT
	protect oDCOBS03 as SINGLELINEEDIT
	protect oDCINSPECAO as RADIOBUTTONGROUP
	protect oDCFREQ1 as SINGLELINEEDIT
	protect oDCSC_FREQ1 as FIXEDTEXT
	protect oCCRB5 as RADIOBUTTON
	protect oCCRB6 as RADIOBUTTON
	protect oDCSC_FREQ2 as FIXEDTEXT
	protect oDCFREQ2 as SINGLELINEEDIT
	protect oDCtheGroupBox1 as GROUPBOX
	protect oDCVERIFI as SINGLELINEEDIT
	protect oDCSC_CODIGOS as FIXEDTEXT
	protect oDCCODIGOS as SINGLELINEEDIT
	protect oDCSC_VERIFI as FIXEDTEXT
	protect oDCtheGroupBox2 as GROUPBOX
	protect oDCSC_CLINOME as FIXEDTEXT
	protect oDCCLINOME as SINGLELINEEDIT
	protect oDCSC_NF as FIXEDTEXT
	protect oDCNF as SINGLELINEEDIT
	protect oDCSC_ACLI01 as FIXEDTEXT
	protect oDCACLI01 as SINGLELINEEDIT
	protect oDCACLI02 as SINGLELINEEDIT
	protect oDCINCIDE as RADIOBUTTONGROUP
	protect oDCSC_RESPON as FIXEDTEXT
	protect oDCRESPON as SINGLELINEEDIT
	protect oCCRB7 as RADIOBUTTON
	protect oCCtheRadioButton7 as RADIOBUTTON
	protect oDCSC_ACOR01 as FIXEDTEXT
	protect oDCACOR01 as SINGLELINEEDIT
	protect oDCACOR02 as SINGLELINEEDIT
	protect oDCACOR03 as SINGLELINEEDIT
	protect oDCACOR04 as SINGLELINEEDIT
// 	instance MOTIVO 
// 	instance OCD 
// 	instance DATAOCD 
// 	instance CODIGO 
// 	instance INVALIDA 
// 	instance OBS01 
// 	instance OBS02 
// 	instance OBS03 
// 	instance INSPECAO 
// 	instance FREQ1 
// 	instance FREQ2 
// 	instance VERIFI 
// 	instance CODIGOS 
// 	instance CLINOME 
// 	instance NF 
// 	instance ACLI01 
// 	instance ACLI02 
// 	instance INCIDE 
// 	instance RESPON 
// 	instance ACOR01 
// 	instance ACOR02 
// 	instance ACOR03 
// 	instance ACOR04 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ACLI01() 
return self:FieldGet(#ACLI01)


assign ACLI01(uValue) 
self:FieldPut(#ACLI01, uValue)
return ACLI01 := uValue


access ACLI02() 
return self:FieldGet(#ACLI02)


assign ACLI02(uValue) 
self:FieldPut(#ACLI02, uValue)
return ACLI02 := uValue


access ACOR01() 
return self:FieldGet(#ACOR01)


assign ACOR01(uValue) 
self:FieldPut(#ACOR01, uValue)
return ACOR01 := uValue


access ACOR02() 
return self:FieldGet(#ACOR02)


assign ACOR02(uValue) 
self:FieldPut(#ACOR02, uValue)
return ACOR02 := uValue


access ACOR03() 
return self:FieldGet(#ACOR03)


assign ACOR03(uValue) 
self:FieldPut(#ACOR03, uValue)
return ACOR03 := uValue


access ACOR04() 
return self:FieldGet(#ACOR04)


assign ACOR04(uValue) 
self:FieldPut(#ACOR04, uValue)
return ACOR04 := uValue


access CLINOME() 
return self:FieldGet(#CLINOME)


assign CLINOME(uValue) 
self:FieldPut(#CLINOME, uValue)
return CLINOME := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODIGOS() 
return self:FieldGet(#CODIGOS)


assign CODIGOS(uValue) 
self:FieldPut(#CODIGOS, uValue)
return CODIGOS := uValue


access DATAOCD() 
return self:FieldGet(#DATAOCD)


assign DATAOCD(uValue) 
self:FieldPut(#DATAOCD, uValue)
return DATAOCD := uValue


access FREQ1() 
return self:FieldGet(#FREQ1)


assign FREQ1(uValue) 
self:FieldPut(#FREQ1, uValue)
return FREQ1 := uValue


access FREQ2() 
return self:FieldGet(#FREQ2)


assign FREQ2(uValue) 
self:FieldPut(#FREQ2, uValue)
return FREQ2 := uValue


access INCIDE() 
return self:FieldGet(#INCIDE)


assign INCIDE(uValue) 
self:FieldPut(#INCIDE, uValue)
return INCIDE := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JACO",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oCCediTIP := PushButton{self,ResourceID{JACO_EDITIP,_GetInst()}}
oCCediTIP:HyperLabel := HyperLabel{#ediTIP,"E",NULL_STRING,NULL_STRING}

oCCESCTIP := PushButton{self,ResourceID{JACO_ESCTIP,_GetInst()}}
oCCESCTIP:HyperLabel := HyperLabel{#ESCTIP,NULL_STRING,NULL_STRING,NULL_STRING}
oCCESCTIP:Image := ICO_FIND{}

oCCporoc := PushButton{self,ResourceID{JACO_POROC,_GetInst()}}
oCCporoc:Image := ICO_AZ{}
oCCporoc:HyperLabel := HyperLabel{#poroc,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporoc:TooltipText := "Ordenar Por Numero"

oCCbuscaoc := PushButton{self,ResourceID{JACO_BUSCAOC,_GetInst()}}
oCCbuscaoc:Image := ICO_FIND{}
oCCbuscaoc:HyperLabel := HyperLabel{#buscaoc,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaoc:TooltipText := "Localizar Um Nº OCC"

oDCSC_OCD := FixedText{self,ResourceID{JACO_SC_OCD,_GetInst()}}
oDCSC_OCD:HyperLabel := HyperLabel{#SC_OCD,"Numéro",NULL_STRING,NULL_STRING}

oDCSC_DATAOCD := FixedText{self,ResourceID{JACO_SC_DATAOCD,_GetInst()}}
oDCSC_DATAOCD:HyperLabel := HyperLabel{#SC_DATAOCD,"Data Ocorrencia",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JACO_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCOCD := SingleLineEdit{self,ResourceID{JACO_OCD,_GetInst()}}
oDCOCD:FieldSpec := padrao_num_08{}
oDCOCD:HyperLabel := HyperLabel{#OCD,"Numero",NULL_STRING,"ME04D_OCD"}
oDCOCD:BackGround := aBrushes[1]
oDCOCD:Font(aFonts[1], FALSE)

oCCRB1 := RadioButton{self,ResourceID{JACO_RB1,_GetInst()}}
oCCRB1:HyperLabel := HyperLabel{#RB1,"Danificado",NULL_STRING,NULL_STRING}

oCCRB2 := RadioButton{self,ResourceID{JACO_RB2,_GetInst()}}
oCCRB2:HyperLabel := HyperLabel{#RB2,"Descalibrado",NULL_STRING,NULL_STRING}

oDCDATAOCD := DateSle{self,ResourceID{JACO_DATAOCD,_GetInst()}}
oDCDATAOCD:FieldSpec := date_field{}
oDCDATAOCD:HyperLabel := HyperLabel{#DATAOCD,"Data",NULL_STRING,"ME04D_DATAOCD"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JACO_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"ME04D_CODIGO"}

oDCSC_OBS01 := FixedText{self,ResourceID{JACO_SC_OBS01,_GetInst()}}
oDCSC_OBS01:HyperLabel := HyperLabel{#SC_OBS01,"Descrição da Ocorrência",NULL_STRING,NULL_STRING}

oDCOBS01 := SingleLineEdit{self,ResourceID{JACO_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := padrao_char_50{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Obs01:",NULL_STRING,"ME04D_OBS01"}

oCCRB3 := RadioButton{self,ResourceID{JACO_RB3,_GetInst()}}
oCCRB3:HyperLabel := HyperLabel{#RB3,"Sim",NULL_STRING,NULL_STRING}

oCCRB4 := RadioButton{self,ResourceID{JACO_RB4,_GetInst()}}
oCCRB4:HyperLabel := HyperLabel{#RB4,"Não",NULL_STRING,NULL_STRING}

oDCOBS02 := SingleLineEdit{self,ResourceID{JACO_OBS02,_GetInst()}}
oDCOBS02:FieldSpec := padrao_char_50{}
oDCOBS02:HyperLabel := HyperLabel{#OBS02,"Obs02:",NULL_STRING,"ME04D_OBS02"}

oDCOBS03 := SingleLineEdit{self,ResourceID{JACO_OBS03,_GetInst()}}
oDCOBS03:FieldSpec := padrao_char_50{}
oDCOBS03:HyperLabel := HyperLabel{#OBS03,"Obs03:",NULL_STRING,"ME04D_OBS03"}

oDCFREQ1 := SingleLineEdit{self,ResourceID{JACO_FREQ1,_GetInst()}}
oDCFREQ1:FieldSpec := padrao_char_20{}
oDCFREQ1:HyperLabel := HyperLabel{#FREQ1,"Freq1:",NULL_STRING,"ME04D_FREQ1"}

oDCSC_FREQ1 := FixedText{self,ResourceID{JACO_SC_FREQ1,_GetInst()}}
oDCSC_FREQ1:HyperLabel := HyperLabel{#SC_FREQ1,"Frequencia de Calibração:",NULL_STRING,NULL_STRING}

oCCRB5 := RadioButton{self,ResourceID{JACO_RB5,_GetInst()}}
oCCRB5:HyperLabel := HyperLabel{#RB5,"Aprovado",NULL_STRING,NULL_STRING}

oCCRB6 := RadioButton{self,ResourceID{JACO_RB6,_GetInst()}}
oCCRB6:HyperLabel := HyperLabel{#RB6,"Rejeitado",NULL_STRING,NULL_STRING}

oDCSC_FREQ2 := FixedText{self,ResourceID{JACO_SC_FREQ2,_GetInst()}}
oDCSC_FREQ2:HyperLabel := HyperLabel{#SC_FREQ2,"Freq. Calibibração  Atual",NULL_STRING,NULL_STRING}

oDCFREQ2 := SingleLineEdit{self,ResourceID{JACO_FREQ2,_GetInst()}}
oDCFREQ2:FieldSpec := padrao_char_20{}
oDCFREQ2:HyperLabel := HyperLabel{#FREQ2,"Freq2:",NULL_STRING,"ME04D_FREQ2"}

oDCtheGroupBox1 := GroupBox{self,ResourceID{JACO_THEGROUPBOX1,_GetInst()}}
oDCtheGroupBox1:HyperLabel := HyperLabel{#theGroupBox1,"Caso Haja produtos não expedidos",NULL_STRING,NULL_STRING}

oDCVERIFI := SingleLineEdit{self,ResourceID{JACO_VERIFI,_GetInst()}}
oDCVERIFI:FieldSpec := padrao_char_20{}
oDCVERIFI:HyperLabel := HyperLabel{#VERIFI,"Verifi:",NULL_STRING,"ME04D_VERIFI"}

oDCSC_CODIGOS := FixedText{self,ResourceID{JACO_SC_CODIGOS,_GetInst()}}
oDCSC_CODIGOS:HyperLabel := HyperLabel{#SC_CODIGOS,"Peças",NULL_STRING,NULL_STRING}

oDCCODIGOS := SingleLineEdit{self,ResourceID{JACO_CODIGOS,_GetInst()}}
oDCCODIGOS:FieldSpec := padrao_char_24{}
oDCCODIGOS:HyperLabel := HyperLabel{#CODIGOS,"Codigos:",NULL_STRING,"ME04D_CODIGOS"}

oDCSC_VERIFI := FixedText{self,ResourceID{JACO_SC_VERIFI,_GetInst()}}
oDCSC_VERIFI:HyperLabel := HyperLabel{#SC_VERIFI,"Verificado Por:",NULL_STRING,NULL_STRING}

oDCtheGroupBox2 := GroupBox{self,ResourceID{JACO_THEGROUPBOX2,_GetInst()}}
oDCtheGroupBox2:HyperLabel := HyperLabel{#theGroupBox2,"Caso os Produtos foram expedidos:",NULL_STRING,NULL_STRING}

oDCSC_CLINOME := FixedText{self,ResourceID{JACO_SC_CLINOME,_GetInst()}}
oDCSC_CLINOME:HyperLabel := HyperLabel{#SC_CLINOME,"Cliente",NULL_STRING,NULL_STRING}

oDCCLINOME := SingleLineEdit{self,ResourceID{JACO_CLINOME,_GetInst()}}
oDCCLINOME:FieldSpec := padrao_char_40{}
oDCCLINOME:HyperLabel := HyperLabel{#CLINOME,"Clinome:",NULL_STRING,"ME04D_CLINOME"}

oDCSC_NF := FixedText{self,ResourceID{JACO_SC_NF,_GetInst()}}
oDCSC_NF:HyperLabel := HyperLabel{#SC_NF,"Nota Fiscal:",NULL_STRING,NULL_STRING}

oDCNF := SingleLineEdit{self,ResourceID{JACO_NF,_GetInst()}}
oDCNF:FieldSpec := padrao_char_30{}
oDCNF:HyperLabel := HyperLabel{#NF,"Nf:",NULL_STRING,"ME04D_NF"}

oDCSC_ACLI01 := FixedText{self,ResourceID{JACO_SC_ACLI01,_GetInst()}}
oDCSC_ACLI01:HyperLabel := HyperLabel{#SC_ACLI01,"Ação Junto ao Cliente",NULL_STRING,NULL_STRING}

oDCACLI01 := SingleLineEdit{self,ResourceID{JACO_ACLI01,_GetInst()}}
oDCACLI01:FieldSpec := padrao_char_50{}
oDCACLI01:HyperLabel := HyperLabel{#ACLI01,"Acli01:",NULL_STRING,"ME04D_ACLI01"}

oDCACLI02 := SingleLineEdit{self,ResourceID{JACO_ACLI02,_GetInst()}}
oDCACLI02:FieldSpec := padrao_char_50{}
oDCACLI02:HyperLabel := HyperLabel{#ACLI02,"Acli02:",NULL_STRING,"ME04D_ACLI02"}

oDCSC_RESPON := FixedText{self,ResourceID{JACO_SC_RESPON,_GetInst()}}
oDCSC_RESPON:HyperLabel := HyperLabel{#SC_RESPON,"Responsável:",NULL_STRING,NULL_STRING}

oDCRESPON := SingleLineEdit{self,ResourceID{JACO_RESPON,_GetInst()}}
oDCRESPON:FieldSpec := padrao_char_30{}
oDCRESPON:HyperLabel := HyperLabel{#RESPON,"Respon:",NULL_STRING,"ME04D_RESPON"}

oCCRB7 := RadioButton{self,ResourceID{JACO_RB7,_GetInst()}}
oCCRB7:HyperLabel := HyperLabel{#RB7,"Sim",NULL_STRING,NULL_STRING}

oCCtheRadioButton7 := RadioButton{self,ResourceID{JACO_THERADIOBUTTON7,_GetInst()}}
oCCtheRadioButton7:HyperLabel := HyperLabel{#theRadioButton7,"Não",NULL_STRING,NULL_STRING}

oDCSC_ACOR01 := FixedText{self,ResourceID{JACO_SC_ACOR01,_GetInst()}}
oDCSC_ACOR01:HyperLabel := HyperLabel{#SC_ACOR01,"Ação Corretiva",NULL_STRING,NULL_STRING}

oDCACOR01 := SingleLineEdit{self,ResourceID{JACO_ACOR01,_GetInst()}}
oDCACOR01:FieldSpec := padrao_char_75{}
oDCACOR01:HyperLabel := HyperLabel{#ACOR01,"Acor01:",NULL_STRING,"ME04D_ACOR01"}

oDCACOR02 := SingleLineEdit{self,ResourceID{JACO_ACOR02,_GetInst()}}
oDCACOR02:FieldSpec := padrao_char_75{}
oDCACOR02:HyperLabel := HyperLabel{#ACOR02,"Acor02:",NULL_STRING,"ME04D_ACOR02"}

oDCACOR03 := SingleLineEdit{self,ResourceID{JACO_ACOR03,_GetInst()}}
oDCACOR03:FieldSpec := padrao_char_75{}
oDCACOR03:HyperLabel := HyperLabel{#ACOR03,"Acor03:",NULL_STRING,"ME04D_ACOR03"}

oDCACOR04 := SingleLineEdit{self,ResourceID{JACO_ACOR04,_GetInst()}}
oDCACOR04:FieldSpec := padrao_char_75{}
oDCACOR04:HyperLabel := HyperLabel{#ACOR04,"Acor04:",NULL_STRING,"ME04D_ACOR04"}

oDCMOTIVO := RadioButtonGroup{self,ResourceID{JACO_MOTIVO,_GetInst()}}
oDCMOTIVO:FillUsing({ ;
						{oCCRB1,"D"}, ;
						{oCCRB2,"E"} ;
						})
oDCMOTIVO:HyperLabel := HyperLabel{#MOTIVO,"Tipo",NULL_STRING,NULL_STRING}
oDCMOTIVO:FieldSpec := padrao_char_01{}

oDCINVALIDA := RadioButtonGroup{self,ResourceID{JACO_INVALIDA,_GetInst()}}
oDCINVALIDA:FillUsing({ ;
						{oCCRB3,"S"}, ;
						{oCCRB4,"N"} ;
						})
oDCINVALIDA:HyperLabel := HyperLabel{#INVALIDA,"Invalida os Resultado Inspeção",NULL_STRING,NULL_STRING}
oDCINVALIDA:FieldSpec := padrao_char_01{}

oDCINSPECAO := RadioButtonGroup{self,ResourceID{JACO_INSPECAO,_GetInst()}}
oDCINSPECAO:FillUsing({ ;
						{oCCRB5,"A"}, ;
						{oCCRB6,"R"} ;
						})
oDCINSPECAO:HyperLabel := HyperLabel{#INSPECAO,"Resultado da Reinspeção",NULL_STRING,NULL_STRING}
oDCINSPECAO:FieldSpec := padrao_char_01{}

oDCINCIDE := RadioButtonGroup{self,ResourceID{JACO_INCIDE,_GetInst()}}
oDCINCIDE:FillUsing({ ;
						{oCCRB7,"S"}, ;
						{oCCtheRadioButton7,"N"} ;
						})
oDCINCIDE:HyperLabel := HyperLabel{#INCIDE,"A ocorrência é reincidente",NULL_STRING,NULL_STRING}
oDCINCIDE:FieldSpec := padrao_char_01{}

self:Caption := "Ação Corretiva"
self:HyperLabel := HyperLabel{#JACO,"Ação Corretiva",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBOCD := DataColumn{padrao_num_08{}}
oDBOCD:Width := 11
oDBOCD:HyperLabel := oDCOCD:HyperLabel 
oDBOCD:Caption := "Numero"
oDBOCD:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBOCD)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 31
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBDATAOCD := DataColumn{date_field{}}
oDBDATAOCD:Width := 29
oDBDATAOCD:HyperLabel := oDCDATAOCD:HyperLabel 
oDBDATAOCD:Caption := "Data"
self:Browser:AddColumn(oDBDATAOCD)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access INSPECAO() 
return self:FieldGet(#INSPECAO)


assign INSPECAO(uValue) 
self:FieldPut(#INSPECAO, uValue)
return INSPECAO := uValue


access INVALIDA() 
return self:FieldGet(#INVALIDA)


assign INVALIDA(uValue) 
self:FieldPut(#INVALIDA, uValue)
return INVALIDA := uValue


access MOTIVO() 
return self:FieldGet(#MOTIVO)


assign MOTIVO(uValue) 
self:FieldPut(#MOTIVO, uValue)
return MOTIVO := uValue


access NF() 
return self:FieldGet(#NF)


assign NF(uValue) 
self:FieldPut(#NF, uValue)
return NF := uValue


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


access OCD() 
return self:FieldGet(#OCD)


assign OCD(uValue) 
self:FieldPut(#OCD, uValue)
return OCD := uValue


access RESPON() 
return self:FieldGet(#RESPON)


assign RESPON(uValue) 
self:FieldPut(#RESPON, uValue)
return RESPON := uValue


access VERIFI() 
return self:FieldGet(#VERIFI)


assign VERIFI(uValue) 
self:FieldPut(#VERIFI, uValue)
return VERIFI := uValue


END CLASS
