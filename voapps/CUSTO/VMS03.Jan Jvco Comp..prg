#region DEFINES
STATIC DEFINE JVCO_CMDESCCO := 120 
STATIC DEFINE JVCO_CMDESCMP := 118 
STATIC DEFINE JVCO_CMDESCMT := 108 
STATIC DEFINE JVCO_CMDESCTR := 119 
STATIC DEFINE JVCO_CMDTOTAL := 127 
STATIC DEFINE JVCO_CODCOMP := 122 
STATIC DEFINE JVCO_CODFOLHA := 103 
STATIC DEFINE JVCO_IICM := 101 
STATIC DEFINE JVCO_NOMECOMP := 123 
STATIC DEFINE JVCO_OBS01 := 108 
STATIC DEFINE JVCO_ORIGEM := 106 
STATIC DEFINE JVCO_PRECO := 112 
STATIC DEFINE JVCO_QTDDE := 125 
STATIC DEFINE JVCO_REDICM := 102 
STATIC DEFINE JVCO_SC_CODCOMP := 121 
STATIC DEFINE JVCO_SC_NOMECOMP := 110 
STATIC DEFINE JVCO_SC_PRECO := 114 
STATIC DEFINE JVCO_SC_REDICM := 100 
STATIC DEFINE JVCO_SC_REDICM1 := 104 
STATIC DEFINE JVCO_SC_REDICM2 := 105 
STATIC DEFINE JVCO_THEFIXEDTEXT2 := 124 
STATIC DEFINE JVCO_THEFIXEDTEXT3 := 126 
STATIC DEFINE JVCO_THEFIXEDTEXT4 := 107 
STATIC DEFINE JVCO_THEFIXEDTEXT5 := 110 
STATIC DEFINE JVCO_THERADIOBUTTON1 := 114 
STATIC DEFINE JVCO_THERADIOBUTTON2 := 117 
STATIC DEFINE JVCO_THERADIOBUTTON3 := 116 
STATIC DEFINE JVCO_THERADIOBUTTON4 := 115 
STATIC DEFINE JVCO_TIPOENT := 113 
STATIC DEFINE JVCO_TOTAL := 128 
STATIC DEFINE JVCO_ULTDATA := 109 
STATIC DEFINE JVCO_ULTUND := 111 
#endregion

class JVCO inherit DATAWINDOW 

	PROTECT oDBTIPOENT as DataColumn
	PROTECT oDBCODCOMP as DataColumn
	PROTECT oDBNOMECOMP as DataColumn
	PROTECT oDBORIGEM as DataColumn
	PROTECT oDBQTDDE as DataColumn
	PROTECT oDBPRECO as DataColumn
	PROTECT oDBTOTAL as DataColumn
	PROTECT oDBULTUND as DataColumn
	PROTECT oDBULTDATA as DataColumn
	protect oDCSC_REDICM as FIXEDTEXT
	protect oDCIICM as CHECKBOX
	protect oDCREDICM as SINGLELINEEDIT
	protect oDCCODFOLHA as SINGLELINEEDIT
	protect oDCSC_REDICM1 as FIXEDTEXT
	protect oDCSC_REDICM2 as FIXEDTEXT
	protect oDCORIGEM as SINGLELINEEDIT
	protect oDCtheFixedText4 as FIXEDTEXT
	protect oDCOBS01 as SINGLELINEEDIT
	protect oDCULTDATA as SINGLELINEEDIT
	protect oDCtheFixedText5 as FIXEDTEXT
	protect oDCULTUND as SINGLELINEEDIT
	protect oDCPRECO as SINGLELINEEDIT
	protect oDCTIPOENT as RADIOBUTTONGROUP
	protect oCCtheRadioButton1 as RADIOBUTTON
	protect oCCtheRadioButton4 as RADIOBUTTON
	protect oCCtheRadioButton3 as RADIOBUTTON
	protect oCCtheRadioButton2 as RADIOBUTTON
	protect oCCcmdescmp as PUSHBUTTON
	protect oCCcmdesctr as PUSHBUTTON
	protect oCCcmdescco as PUSHBUTTON
	protect oDCSC_CODCOMP as FIXEDTEXT
	protect oDCCODCOMP as SINGLELINEEDIT
	protect oDCNOMECOMP as SINGLELINEEDIT
	protect oDCtheFixedText2 as FIXEDTEXT
	protect oDCQTDDE as SINGLELINEEDIT
	protect oDCtheFixedText3 as FIXEDTEXT
	protect oCCcmdtotal as PUSHBUTTON
	protect oDCTOTAL as SINGLELINEEDIT
// 	instance IICM 
// 	instance REDICM 
// 	instance CODFOLHA 
// 	instance ORIGEM 
// 	instance OBS01 
// 	instance ULTDATA 
// 	instance ULTUND 
// 	instance PRECO 
// 	instance TIPOENT 
// 	instance CODCOMP 
// 	instance NOMECOMP 
// 	instance QTDDE 
// 	instance TOTAL 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODCOMP() 
return self:FieldGet(#CODCOMP)


assign CODCOMP(uValue) 
self:FieldPut(#CODCOMP, uValue)
return CODCOMP := uValue


access CODFOLHA() 
return self:FieldGet(#CODFOLHA)


assign CODFOLHA(uValue) 
self:FieldPut(#CODFOLHA, uValue)
return CODFOLHA := uValue


access IICM() 
return self:FieldGet(#IICM)


assign IICM(uValue) 
self:FieldPut(#IICM, uValue)
return IICM := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JVCO",_GetInst()},iCtlID)

oDCSC_REDICM := FixedText{self,ResourceID{JVCO_SC_REDICM,_GetInst()}}
oDCSC_REDICM:HyperLabel := HyperLabel{#SC_REDICM,"Red.ICMS",NULL_STRING,NULL_STRING}

oDCIICM := CheckBox{self,ResourceID{JVCO_IICM,_GetInst()}}
oDCIICM:HyperLabel := HyperLabel{#IICM,"Sem  ICMS",NULL_STRING,"VMS03_IICM"}
oDCIICM:FieldSpec := logic_field{}

oDCREDICM := SingleLineEdit{self,ResourceID{JVCO_REDICM,_GetInst()}}
oDCREDICM:FieldSpec := padrao_num_06_2{}
oDCREDICM:HyperLabel := HyperLabel{#REDICM,"Redicm:",NULL_STRING,"VMS03_REDICM"}

oDCCODFOLHA := SingleLineEdit{self,ResourceID{JVCO_CODFOLHA,_GetInst()}}
oDCCODFOLHA:FieldSpec := padrao_num_05{}
oDCCODFOLHA:HyperLabel := HyperLabel{#CODFOLHA,"Sub",NULL_STRING,"VMS03_REDICM"}

oDCSC_REDICM1 := FixedText{self,ResourceID{JVCO_SC_REDICM1,_GetInst()}}
oDCSC_REDICM1:HyperLabel := HyperLabel{#SC_REDICM1,"SubCodigo",NULL_STRING,NULL_STRING}

oDCSC_REDICM2 := FixedText{self,ResourceID{JVCO_SC_REDICM2,_GetInst()}}
oDCSC_REDICM2:HyperLabel := HyperLabel{#SC_REDICM2,"Origem",NULL_STRING,NULL_STRING}

oDCORIGEM := SingleLineEdit{self,ResourceID{JVCO_ORIGEM,_GetInst()}}
oDCORIGEM:FieldSpec := padrao_char_20{}
oDCORIGEM:HyperLabel := HyperLabel{#ORIGEM,"Origem",NULL_STRING,"VMS03_TOTAL"}
oDCORIGEM:FocusSelect := FSEL_HOME

oDCtheFixedText4 := FixedText{self,ResourceID{JVCO_THEFIXEDTEXT4,_GetInst()}}
oDCtheFixedText4:HyperLabel := HyperLabel{#theFixedText4,"Obs",NULL_STRING,NULL_STRING}

oDCOBS01 := SingleLineEdit{self,ResourceID{JVCO_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := padrao_char_80{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Nome:",NULL_STRING,"VMS03_NOMECOMP"}
oDCOBS01:FocusSelect := FSEL_HOME

oDCULTDATA := SingleLineEdit{self,ResourceID{JVCO_ULTDATA,_GetInst()}}
oDCULTDATA:FieldSpec := date_field{}
oDCULTDATA:HyperLabel := HyperLabel{#ULTDATA,"PrcData",NULL_STRING,"VMS03_PRECO"}
oDCULTDATA:FocusSelect := FSEL_HOME

oDCtheFixedText5 := FixedText{self,ResourceID{JVCO_THEFIXEDTEXT5,_GetInst()}}
oDCtheFixedText5:HyperLabel := HyperLabel{#theFixedText5,"Data",NULL_STRING,NULL_STRING}

oDCULTUND := SingleLineEdit{self,ResourceID{JVCO_ULTUND,_GetInst()}}
oDCULTUND:FieldSpec := padrao_char_02{}
oDCULTUND:HyperLabel := HyperLabel{#ULTUND,"PrcUnd",NULL_STRING,"VMS03_PRECO"}
oDCULTUND:FocusSelect := FSEL_HOME

oDCPRECO := SingleLineEdit{self,ResourceID{JVCO_PRECO,_GetInst()}}
oDCPRECO:FieldSpec := padrao_num_12_4{}
oDCPRECO:HyperLabel := HyperLabel{#PRECO,"Preco",NULL_STRING,"VMS03_QTDDE"}
oDCPRECO:FocusSelect := FSEL_HOME

oCCtheRadioButton1 := RadioButton{self,ResourceID{JVCO_THERADIOBUTTON1,_GetInst()}}
oCCtheRadioButton1:HyperLabel := HyperLabel{#theRadioButton1,"Materia Prima",NULL_STRING,NULL_STRING}

oCCtheRadioButton4 := RadioButton{self,ResourceID{JVCO_THERADIOBUTTON4,_GetInst()}}
oCCtheRadioButton4:HyperLabel := HyperLabel{#theRadioButton4,"Componente",NULL_STRING,NULL_STRING}

oCCtheRadioButton3 := RadioButton{self,ResourceID{JVCO_THERADIOBUTTON3,_GetInst()}}
oCCtheRadioButton3:HyperLabel := HyperLabel{#theRadioButton3,"Ferramental",NULL_STRING,NULL_STRING}

oCCtheRadioButton2 := RadioButton{self,ResourceID{JVCO_THERADIOBUTTON2,_GetInst()}}
oCCtheRadioButton2:HyperLabel := HyperLabel{#theRadioButton2,"Terceiros/Tratamentos",NULL_STRING,NULL_STRING}

oCCcmdescmp := PushButton{self,ResourceID{JVCO_CMDESCMP,_GetInst()}}
oCCcmdescmp:HyperLabel := HyperLabel{#cmdescmp,"---",NULL_STRING,NULL_STRING}

oCCcmdesctr := PushButton{self,ResourceID{JVCO_CMDESCTR,_GetInst()}}
oCCcmdesctr:HyperLabel := HyperLabel{#cmdesctr,"---",NULL_STRING,NULL_STRING}

oCCcmdescco := PushButton{self,ResourceID{JVCO_CMDESCCO,_GetInst()}}
oCCcmdescco:HyperLabel := HyperLabel{#cmdescco,"---",NULL_STRING,NULL_STRING}

oDCSC_CODCOMP := FixedText{self,ResourceID{JVCO_SC_CODCOMP,_GetInst()}}
oDCSC_CODCOMP:HyperLabel := HyperLabel{#SC_CODCOMP,"Codigo",NULL_STRING,NULL_STRING}

oDCCODCOMP := SingleLineEdit{self,ResourceID{JVCO_CODCOMP,_GetInst()}}
oDCCODCOMP:FieldSpec := padrao_char_24{}
oDCCODCOMP:HyperLabel := HyperLabel{#CODCOMP,"Codigo",NULL_STRING,"VMS03_CODCOMP"}
oDCCODCOMP:FocusSelect := FSEL_HOME

oDCNOMECOMP := SingleLineEdit{self,ResourceID{JVCO_NOMECOMP,_GetInst()}}
oDCNOMECOMP:FieldSpec := padrao_char_120{}
oDCNOMECOMP:HyperLabel := HyperLabel{#NOMECOMP,"Nome:",NULL_STRING,"VMS03_NOMECOMP"}
oDCNOMECOMP:FocusSelect := FSEL_HOME

oDCtheFixedText2 := FixedText{self,ResourceID{JVCO_THEFIXEDTEXT2,_GetInst()}}
oDCtheFixedText2:HyperLabel := HyperLabel{#theFixedText2,"Qtdde",NULL_STRING,NULL_STRING}

oDCQTDDE := SingleLineEdit{self,ResourceID{JVCO_QTDDE,_GetInst()}}
oDCQTDDE:FieldSpec := padrao_nuM_10_5{}
oDCQTDDE:HyperLabel := HyperLabel{#QTDDE,"Qtdde:",NULL_STRING,"VMS03_QTDDE"}
oDCQTDDE:FocusSelect := FSEL_HOME

oDCtheFixedText3 := FixedText{self,ResourceID{JVCO_THEFIXEDTEXT3,_GetInst()}}
oDCtheFixedText3:HyperLabel := HyperLabel{#theFixedText3,"Preço",NULL_STRING,NULL_STRING}

oCCcmdtotal := PushButton{self,ResourceID{JVCO_CMDTOTAL,_GetInst()}}
oCCcmdtotal:HyperLabel := HyperLabel{#cmdtotal,"=",NULL_STRING,NULL_STRING}

oDCTOTAL := SingleLineEdit{self,ResourceID{JVCO_TOTAL,_GetInst()}}
oDCTOTAL:FieldSpec := padrao_num_12_4{}
oDCTOTAL:HyperLabel := HyperLabel{#TOTAL,"Total:",NULL_STRING,"VMS03_TOTAL"}
oDCTOTAL:FocusSelect := FSEL_HOME

oDCTIPOENT := RadioButtonGroup{self,ResourceID{JVCO_TIPOENT,_GetInst()}}
oDCTIPOENT:FillUsing({ ;
						{oCCtheRadioButton1,"M"}, ;
						{oCCtheRadioButton4,"C"}, ;
						{oCCtheRadioButton3,"F"}, ;
						{oCCtheRadioButton2,"T"} ;
						})
oDCTIPOENT:HyperLabel := HyperLabel{#TIPOENT,"T",NULL_STRING,NULL_STRING}
oDCTIPOENT:FieldSpec := padrao_char_01{}

self:Caption := "Composição do Produto"
self:HyperLabel := HyperLabel{#JVCO,"Composição do Produto","Composição do Produto",NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTIPOENT := DataColumn{padrao_char_01{}}
oDBTIPOENT:Width := 3
oDBTIPOENT:HyperLabel := oDCTIPOENT:HyperLabel 
oDBTIPOENT:Caption := "T"
self:Browser:AddColumn(oDBTIPOENT)

oDBCODCOMP := DataColumn{padrao_char_24{}}
oDBCODCOMP:Width := 11
oDBCODCOMP:HyperLabel := oDCCODCOMP:HyperLabel 
oDBCODCOMP:Caption := "Codigo"
self:Browser:AddColumn(oDBCODCOMP)

oDBNOMECOMP := DataColumn{padrao_char_120{}}
oDBNOMECOMP:Width := 16
oDBNOMECOMP:HyperLabel := oDCNOMECOMP:HyperLabel 
oDBNOMECOMP:Caption := "Nome:"
self:Browser:AddColumn(oDBNOMECOMP)

oDBORIGEM := DataColumn{padrao_char_20{}}
oDBORIGEM:Width := 11
oDBORIGEM:HyperLabel := oDCORIGEM:HyperLabel 
oDBORIGEM:Caption := "Origem"
self:Browser:AddColumn(oDBORIGEM)

oDBQTDDE := DataColumn{padrao_nuM_10_5{}}
oDBQTDDE:Width := 10
oDBQTDDE:HyperLabel := oDCQTDDE:HyperLabel 
oDBQTDDE:Caption := "Qtdde:"
self:Browser:AddColumn(oDBQTDDE)

oDBPRECO := DataColumn{padrao_num_12_4{}}
oDBPRECO:Width := 10
oDBPRECO:HyperLabel := oDCPRECO:HyperLabel 
oDBPRECO:Caption := "Preco"
self:Browser:AddColumn(oDBPRECO)

oDBTOTAL := DataColumn{padrao_num_12_4{}}
oDBTOTAL:Width := 11
oDBTOTAL:HyperLabel := oDCTOTAL:HyperLabel 
oDBTOTAL:Caption := "Total:"
self:Browser:AddColumn(oDBTOTAL)

oDBULTUND := DataColumn{padrao_char_02{}}
oDBULTUND:Width := 6
oDBULTUND:HyperLabel := oDCULTUND:HyperLabel 
oDBULTUND:Caption := "PrcUnd"
self:Browser:AddColumn(oDBULTUND)

oDBULTDATA := DataColumn{date_field{}}
oDBULTDATA:Width := 11
oDBULTDATA:HyperLabel := oDCULTDATA:HyperLabel 
oDBULTDATA:Caption := "PrcData"
self:Browser:AddColumn(oDBULTDATA)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOMECOMP() 
return self:FieldGet(#NOMECOMP)


assign NOMECOMP(uValue) 
self:FieldPut(#NOMECOMP, uValue)
return NOMECOMP := uValue


access OBS01() 
return self:FieldGet(#OBS01)


assign OBS01(uValue) 
self:FieldPut(#OBS01, uValue)
return OBS01 := uValue


access ORIGEM() 
return self:FieldGet(#ORIGEM)


assign ORIGEM(uValue) 
self:FieldPut(#ORIGEM, uValue)
return ORIGEM := uValue


access PRECO() 
return self:FieldGet(#PRECO)


assign PRECO(uValue) 
self:FieldPut(#PRECO, uValue)
return PRECO := uValue


access QTDDE() 
return self:FieldGet(#QTDDE)


assign QTDDE(uValue) 
self:FieldPut(#QTDDE, uValue)
return QTDDE := uValue


access REDICM() 
return self:FieldGet(#REDICM)


assign REDICM(uValue) 
self:FieldPut(#REDICM, uValue)
return REDICM := uValue


access TIPOENT() 
return self:FieldGet(#TIPOENT)


assign TIPOENT(uValue) 
self:FieldPut(#TIPOENT, uValue)
return TIPOENT := uValue


access TOTAL() 
return self:FieldGet(#TOTAL)


assign TOTAL(uValue) 
self:FieldPut(#TOTAL, uValue)
return TOTAL := uValue


access ULTDATA() 
return self:FieldGet(#ULTDATA)


assign ULTDATA(uValue) 
self:FieldPut(#ULTDATA, uValue)
return ULTDATA := uValue


access ULTUND() 
return self:FieldGet(#ULTUND)


assign ULTUND(uValue) 
self:FieldPut(#ULTUND, uValue)
return ULTUND := uValue


END CLASS
