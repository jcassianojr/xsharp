#region DEFINES
STATIC DEFINE JVCE_CMDESCCO := 113 
STATIC DEFINE JVCE_CMDESCMP := 111 
STATIC DEFINE JVCE_CMDESCTR := 112 
STATIC DEFINE JVCE_CODCOMP := 115 
STATIC DEFINE JVCE_NOMECOMP := 116 
STATIC DEFINE JVCE_OBS01 := 105 
STATIC DEFINE JVCE_ORIGEM := 102 
STATIC DEFINE JVCE_QTDDE := 100 
STATIC DEFINE JVCE_SC_CODCOMP := 114 
STATIC DEFINE JVCE_SC_CODCOMP1 := 101 
STATIC DEFINE JVCE_SC_CODCOMP2 := 103 
STATIC DEFINE JVCE_SC_CODCOMP3 := 104 
STATIC DEFINE JVCE_THERADIOBUTTON1 := 107 
STATIC DEFINE JVCE_THERADIOBUTTON2 := 108 
STATIC DEFINE JVCE_THERADIOBUTTON3 := 110 
STATIC DEFINE JVCE_THERADIOBUTTON4 := 109 
STATIC DEFINE JVCE_TIPOENT := 106 
STATIC DEFINE JVCO_CMDESCMT := 108 
STATIC DEFINE JVCO_SC_NOMECOMP := 110 
STATIC DEFINE JVCO_SC_PRECO := 114 
STATIC DEFINE JVCO_THEFIXEDTEXT5 := 116 
#endregion

class JVCE inherit DATAWINDOW 

	PROTECT oDBTIPOENT as DataColumn
	PROTECT oDBCODCOMP as DataColumn
	PROTECT oDBORIGEM as DataColumn
	PROTECT oDBNOMECOMP as DataColumn
	PROTECT oDBQTDDE as DataColumn
	protect oDCQTDDE as SINGLELINEEDIT
	protect oDCSC_CODCOMP1 as FIXEDTEXT
	protect oDCORIGEM as SINGLELINEEDIT
	protect oDCSC_CODCOMP2 as FIXEDTEXT
	protect oDCSC_CODCOMP3 as FIXEDTEXT
	protect oDCOBS01 as SINGLELINEEDIT
	protect oDCTIPOENT as RADIOBUTTONGROUP
	protect oCCtheRadioButton1 as RADIOBUTTON
	protect oCCtheRadioButton2 as RADIOBUTTON
	protect oCCtheRadioButton4 as RADIOBUTTON
	protect oCCtheRadioButton3 as RADIOBUTTON
	protect oCCcmdescmp as PUSHBUTTON
	protect oCCcmdesctr as PUSHBUTTON
	protect oCCcmdescco as PUSHBUTTON
	protect oDCSC_CODCOMP as FIXEDTEXT
	protect oDCCODCOMP as SINGLELINEEDIT
	protect oDCNOMECOMP as SINGLELINEEDIT
// 	instance QTDDE 
// 	instance ORIGEM 
// 	instance OBS01 
// 	instance TIPOENT 
// 	instance CODCOMP 
// 	instance NOMECOMP 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODCOMP() 
return self:FieldGet(#CODCOMP)


assign CODCOMP(uValue) 
self:FieldPut(#CODCOMP, uValue)
return CODCOMP := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra) 

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JVCE",_GetInst()},iCtlID)

oDCQTDDE := SingleLineEdit{self,ResourceID{JVCE_QTDDE,_GetInst()}}
oDCQTDDE:FieldSpec := padrao_num_10_5{}
oDCQTDDE:HyperLabel := HyperLabel{#QTDDE,"Quantidade",NULL_STRING,"VMS03_CODCOMP"}

oDCSC_CODCOMP1 := FixedText{self,ResourceID{JVCE_SC_CODCOMP1,_GetInst()}}
oDCSC_CODCOMP1:HyperLabel := HyperLabel{#SC_CODCOMP1,"Qtdde",NULL_STRING,NULL_STRING}

oDCORIGEM := SingleLineEdit{self,ResourceID{JVCE_ORIGEM,_GetInst()}}
oDCORIGEM:FieldSpec := padrao_char_20{}
oDCORIGEM:HyperLabel := HyperLabel{#ORIGEM,"Origem",NULL_STRING,"VMS03_CODCOMP"}

oDCSC_CODCOMP2 := FixedText{self,ResourceID{JVCE_SC_CODCOMP2,_GetInst()}}
oDCSC_CODCOMP2:HyperLabel := HyperLabel{#SC_CODCOMP2,"Origem",NULL_STRING,NULL_STRING}

oDCSC_CODCOMP3 := FixedText{self,ResourceID{JVCE_SC_CODCOMP3,_GetInst()}}
oDCSC_CODCOMP3:HyperLabel := HyperLabel{#SC_CODCOMP3,"obs:",NULL_STRING,NULL_STRING}

oDCOBS01 := SingleLineEdit{self,ResourceID{JVCE_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := padrao_char_80{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Nome:",NULL_STRING,"VMS03_NOMECOMP"}
oDCOBS01:FocusSelect := FSEL_HOME

oCCtheRadioButton1 := RadioButton{self,ResourceID{JVCE_THERADIOBUTTON1,_GetInst()}}
oCCtheRadioButton1:HyperLabel := HyperLabel{#theRadioButton1,"Materia Prima",NULL_STRING,NULL_STRING}

oCCtheRadioButton2 := RadioButton{self,ResourceID{JVCE_THERADIOBUTTON2,_GetInst()}}
oCCtheRadioButton2:HyperLabel := HyperLabel{#theRadioButton2,"Terceiros/Tratamentos",NULL_STRING,NULL_STRING}

oCCtheRadioButton4 := RadioButton{self,ResourceID{JVCE_THERADIOBUTTON4,_GetInst()}}
oCCtheRadioButton4:HyperLabel := HyperLabel{#theRadioButton4,"Componente",NULL_STRING,NULL_STRING}

oCCtheRadioButton3 := RadioButton{self,ResourceID{JVCE_THERADIOBUTTON3,_GetInst()}}
oCCtheRadioButton3:HyperLabel := HyperLabel{#theRadioButton3,"Ferramental",NULL_STRING,NULL_STRING}

oCCcmdescmp := PushButton{self,ResourceID{JVCE_CMDESCMP,_GetInst()}}
oCCcmdescmp:HyperLabel := HyperLabel{#cmdescmp,"---",NULL_STRING,NULL_STRING}

oCCcmdesctr := PushButton{self,ResourceID{JVCE_CMDESCTR,_GetInst()}}
oCCcmdesctr:HyperLabel := HyperLabel{#cmdesctr,"---",NULL_STRING,NULL_STRING}

oCCcmdescco := PushButton{self,ResourceID{JVCE_CMDESCCO,_GetInst()}}
oCCcmdescco:HyperLabel := HyperLabel{#cmdescco,"---",NULL_STRING,NULL_STRING}

oDCSC_CODCOMP := FixedText{self,ResourceID{JVCE_SC_CODCOMP,_GetInst()}}
oDCSC_CODCOMP:HyperLabel := HyperLabel{#SC_CODCOMP,"Componente",NULL_STRING,NULL_STRING}

oDCCODCOMP := SingleLineEdit{self,ResourceID{JVCE_CODCOMP,_GetInst()}}
oDCCODCOMP:FieldSpec := padrao_char_24{}
oDCCODCOMP:HyperLabel := HyperLabel{#CODCOMP,"Cod. Componente:",NULL_STRING,"VMS03_CODCOMP"}
oDCCODCOMP:FocusSelect := FSEL_HOME

oDCNOMECOMP := SingleLineEdit{self,ResourceID{JVCE_NOMECOMP,_GetInst()}}
oDCNOMECOMP:FieldSpec := padrao_char_120{}
oDCNOMECOMP:HyperLabel := HyperLabel{#NOMECOMP,"Nome:",NULL_STRING,"VMS03_NOMECOMP"}
oDCNOMECOMP:FocusSelect := FSEL_HOME

oDCTIPOENT := RadioButtonGroup{self,ResourceID{JVCE_TIPOENT,_GetInst()}}
oDCTIPOENT:FillUsing({ ;
						{oCCtheRadioButton1,"M"}, ;
						{oCCtheRadioButton2,"T"}, ;
						{oCCtheRadioButton4,"C"}, ;
						{oCCtheRadioButton3,"F"} ;
						})
oDCTIPOENT:HyperLabel := HyperLabel{#TIPOENT,"Tipo",NULL_STRING,NULL_STRING}
oDCTIPOENT:FieldSpec := padrao_char_01{}

SELF:Caption := "Composição do Produto"
SELF:HyperLabel := HyperLabel{#JVCE,"Composição do Produto","Composição do Produto",NULL_STRING}
SELF:Menu := STANDARDSHELLMENU{}
//SELF:FocusSelect(FSEL_HOME)
SELF:ClipperKeys := TRUE

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF
SELF:Browser := DataBrowser{SELF}

oDBTIPOENT := DataColumn{padrao_char_01{}}
oDBTIPOENT:Width := 8
oDBTIPOENT:HyperLabel := oDCTIPOENT:HyperLabel
oDBTIPOENT:Caption := "Tipo"
SELF:Browser:AddColumn(oDBTIPOENT)

oDBCODCOMP := DataColumn{padrao_char_24{}}
oDBCODCOMP:Width := 18
oDBCODCOMP:HyperLabel := oDCCODCOMP:HyperLabel
oDBCODCOMP:Caption := "Cod. Componente:"
SELF:Browser:AddColumn(oDBCODCOMP)

oDBORIGEM := DataColumn{padrao_char_20{}}
oDBORIGEM:Width := 11
oDBORIGEM:HyperLabel := oDCORIGEM:HyperLabel
oDBORIGEM:Caption := "Origem"
SELF:Browser:AddColumn(oDBORIGEM)

oDBNOMECOMP := DataColumn{padrao_char_120{}}
oDBNOMECOMP:Width := 36
oDBNOMECOMP:HyperLabel := oDCNOMECOMP:HyperLabel
oDBNOMECOMP:Caption := "Nome:"
SELF:Browser:AddColumn(oDBNOMECOMP)

oDBQTDDE := DataColumn{padrao_num_10_5{}}
oDBQTDDE:Width := 17
oDBQTDDE:HyperLabel := oDCQTDDE:HyperLabel
oDBQTDDE:Caption := "Quantidade"
SELF:Browser:AddColumn(oDBQTDDE)


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


access QTDDE() 
return self:FieldGet(#QTDDE)


assign QTDDE(uValue) 
self:FieldPut(#QTDDE, uValue)
return QTDDE := uValue


access TIPOENT() 
return self:FieldGet(#TIPOENT)


assign TIPOENT(uValue) 
self:FieldPut(#TIPOENT, uValue)
return TIPOENT := uValue


END CLASS
