#region DEFINES
STATIC DEFINE JCS_BUSCA := 143 
STATIC DEFINE JCS_CS := 109 
STATIC DEFINE JCS_DATA := 106 
STATIC DEFINE JCS_DATAPED := 127 
STATIC DEFINE JCS_DATASALDO := 130 
STATIC DEFINE JCS_DATAURG := 124 
STATIC DEFINE JCS_DATHPED := 114 
STATIC DEFINE JCS_DATHSAL := 117 
STATIC DEFINE JCS_DATHURG := 111 
STATIC DEFINE JCS_ESCFER := 145 
STATIC DEFINE JCS_ESCME01 := 144 
STATIC DEFINE JCS_FERRAM := 108 
STATIC DEFINE JCS_GRAVASALDO := 138 
STATIC DEFINE JCS_GROUPBOX1 := 136 
STATIC DEFINE JCS_GROUPBOX2 := 123 
STATIC DEFINE JCS_HRBAS := 122 
STATIC DEFINE JCS_HRPRE := 115 
STATIC DEFINE JCS_HRSAL := 118 
STATIC DEFINE JCS_HRTOT := 120 
STATIC DEFINE JCS_HRURG := 112 
STATIC DEFINE JCS_LANCADA := 139 
STATIC DEFINE JCS_LANCDAT := 141 
STATIC DEFINE JCS_LANCUSR := 142 
STATIC DEFINE JCS_NOME := 107 
STATIC DEFINE JCS_ORDEM := 146 
STATIC DEFINE JCS_PEGASALDO := 137 
STATIC DEFINE JCS_QTDEBASE := 134 
STATIC DEFINE JCS_QTDEPED := 128 
STATIC DEFINE JCS_QTDESALDO := 131 
STATIC DEFINE JCS_QTDETOT := 133 
STATIC DEFINE JCS_QTDEURG := 125 
STATIC DEFINE JCS_RADIOBUTTON2 := 105 
STATIC DEFINE JCS_RADIOBUTTON3 := 103 
STATIC DEFINE JCS_SC_LANCUSR := 140 
STATIC DEFINE JCS_SC_RO := 110 
STATIC DEFINE JCS_TECNICO := 101 
STATIC DEFINE JCS_TECNOME := 100 
STATIC DEFINE JCS_THEFIXEDTEXT10 := 113 
STATIC DEFINE JCS_THEFIXEDTEXT11 := 116 
STATIC DEFINE JCS_THEFIXEDTEXT12 := 119 
STATIC DEFINE JCS_THEFIXEDTEXT13 := 121 
STATIC DEFINE JCS_THEFIXEDTEXT4 := 135 
STATIC DEFINE JCS_THEFIXEDTEXT6 := 132 
STATIC DEFINE JCS_THEFIXEDTEXT7 := 129 
STATIC DEFINE JCS_THEFIXEDTEXT8 := 102 
STATIC DEFINE JCS_THEFIXEDTEXT9 := 126 
STATIC DEFINE JCS_TIPO := 104 
#endregion

PARTIAL class JCS inherit MYDataWindow 

	PROTECT oDBCS as DataColumn
	PROTECT oDBFERRAM as DataColumn
	PROTECT oDBDATA as DataColumn
	protect oDCTECNOME as SINGLELINEEDIT
	protect oDCTECNICO as SINGLELINEEDIT
	protect oDCtheFixedText8 as FIXEDTEXT
	protect oCCRadioButton3 as RADIOBUTTON
	protect oDCTIPO as RADIOBUTTONGROUP
	protect oCCRadioButton2 as RADIOBUTTON
	protect oDCDATA as DATETIMEPICKER
	protect oDCNOME as SINGLELINEEDIT
	protect oDCFERRAM as SINGLELINEEDIT
	protect oDCCS as SINGLELINEEDIT
	protect oDCSC_RO as FIXEDTEXT
	protect oDCDATHURG as DATESLE
	protect oDCHRURG as RIGHTSLE
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oDCDATHPED as DATESLE
	protect oDCHRPRE as RIGHTSLE
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oDCDATHSAL as DATESLE
	protect oDCHRSAL as RIGHTSLE
	protect oDCtheFixedText12 as FIXEDTEXT
	protect oDCHRTOT as RIGHTSLE
	protect oDCtheFixedText13 as FIXEDTEXT
	protect oDCHRBAS as RIGHTSLE
	protect oDCGroupBox2 as GROUPBOX
	protect oDCDATAURG as DATESLE
	protect oDCQTDEURG as RIGHTSLE
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oDCDATAPED as DATESLE
	protect oDCQTDEPED as RIGHTSLE
	protect oDCtheFixedText7 as FIXEDTEXT
	protect oDCDATASALDO as DATESLE
	protect oDCQTDESALDO as RIGHTSLE
	protect oDCtheFixedText6 as FIXEDTEXT
	protect oDCQTDETOT as RIGHTSLE
	protect oDCQTDEBASE as RIGHTSLE
	protect oDCtheFixedText4 as FIXEDTEXT
	protect oDCGroupBox1 as GROUPBOX
	protect oCCPEGASALDO as PUSHBUTTON
	protect oCCGRAVASALDO as PUSHBUTTON
	protect oDCLANCADA as CHECKBOX
	protect oDCSC_LANCUSR as FIXEDTEXT
	protect oDCLANCDAT as SINGLELINEEDIT
	protect oDCLANCUSR as SINGLELINEEDIT
	protect oCCbusca as PUSHBUTTON
	protect oCCEscme01 as PUSHBUTTON
	protect oCCEscfer as PUSHBUTTON
	protect oCCordem as PUSHBUTTON
// 	instance TECNOME 
// 	instance TECNICO 
// 	instance TIPO 
// 	instance NOME 
// 	instance FERRAM 
// 	instance CS 
// 	instance DATHURG 
// 	instance HRURG 
// 	instance DATHPED 
// 	instance HRPRE 
// 	instance DATHSAL 
// 	instance HRSAL 
// 	instance HRTOT 
// 	instance HRBAS 
// 	instance DATAURG 
// 	instance QTDEURG 
// 	instance DATAPED 
// 	instance QTDEPED 
// 	instance DATASALDO 
// 	instance QTDESALDO 
// 	instance QTDETOT 
// 	instance QTDEBASE 
// 	instance LANCADA 
// 	instance LANCDAT 
// 	instance LANCUSR 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CS() 
return self:FieldGet(#CS)


assign CS(uValue) 
self:FieldPut(#CS, uValue)
return CS := uValue


access DATAPED() 
return self:FieldGet(#DATAPED)


assign DATAPED(uValue) 
self:FieldPut(#DATAPED, uValue)
return DATAPED := uValue


access DATASALDO() 
return self:FieldGet(#DATASALDO)


assign DATASALDO(uValue) 
self:FieldPut(#DATASALDO, uValue)
return DATASALDO := uValue


access DATAURG() 
return self:FieldGet(#DATAURG)


assign DATAURG(uValue) 
self:FieldPut(#DATAURG, uValue)
return DATAURG := uValue


access DATHPED() 
return self:FieldGet(#DATHPED)


assign DATHPED(uValue) 
self:FieldPut(#DATHPED, uValue)
return DATHPED := uValue


access DATHSAL() 
return self:FieldGet(#DATHSAL)


assign DATHSAL(uValue) 
self:FieldPut(#DATHSAL, uValue)
return DATHSAL := uValue


access DATHURG() 
return self:FieldGet(#DATHURG)


assign DATHURG(uValue) 
self:FieldPut(#DATHURG, uValue)
return DATHURG := uValue


access FERRAM() 
return self:FieldGet(#FERRAM)


assign FERRAM(uValue) 
self:FieldPut(#FERRAM, uValue)
return FERRAM := uValue


access HRBAS() 
return self:FieldGet(#HRBAS)


assign HRBAS(uValue) 
self:FieldPut(#HRBAS, uValue)
return HRBAS := uValue


access HRPRE() 
return self:FieldGet(#HRPRE)


assign HRPRE(uValue) 
self:FieldPut(#HRPRE, uValue)
return HRPRE := uValue


access HRSAL() 
return self:FieldGet(#HRSAL)


assign HRSAL(uValue) 
self:FieldPut(#HRSAL, uValue)
return HRSAL := uValue


access HRTOT() 
return self:FieldGet(#HRTOT)


assign HRTOT(uValue) 
self:FieldPut(#HRTOT, uValue)
return HRTOT := uValue


access HRURG() 
return self:FieldGet(#HRURG)


assign HRURG(uValue) 
self:FieldPut(#HRURG, uValue)
return HRURG := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[3] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCS",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,12,"Times New Roman"}
aFonts[2]:Bold := TRUE
aFonts[3] := Font{,10,"Trebuchet MS"}
aFonts[3]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCTECNOME := SingleLineEdit{self,ResourceID{JCS_TECNOME,_GetInst()}}
oDCTECNOME:FieldSpec := padrao_char_40{}
oDCTECNOME:HyperLabel := HyperLabel{#TECNOME,"Nome:",NULL_STRING,"RO_TECNOME"}
oDCTECNOME:BackGround := aBrushes[1]
oDCTECNOME:Font(aFonts[1], FALSE)

oDCTECNICO := SingleLineEdit{self,ResourceID{JCS_TECNICO,_GetInst()}}
oDCTECNICO:FieldSpec := padrao_num_08{}
oDCTECNICO:HyperLabel := HyperLabel{#TECNICO,"Ro:",NULL_STRING,"RO_RO"}
oDCTECNICO:BackGround := aBrushes[1]
oDCTECNICO:Font(aFonts[1], FALSE)

oDCtheFixedText8 := FixedText{self,ResourceID{JCS_THEFIXEDTEXT8,_GetInst()}}
oDCtheFixedText8:HyperLabel := HyperLabel{#theFixedText8,"Tecnico",NULL_STRING,NULL_STRING}

oCCRadioButton3 := RadioButton{self,ResourceID{JCS_RADIOBUTTON3,_GetInst()}}
oCCRadioButton3:HyperLabel := HyperLabel{#RadioButton3,"Maquina",NULL_STRING,NULL_STRING}

oCCRadioButton2 := RadioButton{self,ResourceID{JCS_RADIOBUTTON2,_GetInst()}}
oCCRadioButton2:HyperLabel := HyperLabel{#RadioButton2,"Ferramenta",NULL_STRING,NULL_STRING}

oDCDATA := DateTimePicker{self,ResourceID{JCS_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JCS_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"RO_NOME"}
oDCNOME:BackGround := aBrushes[1]
oDCNOME:Font(aFonts[1], FALSE)

oDCFERRAM := SingleLineEdit{self,ResourceID{JCS_FERRAM,_GetInst()}}
oDCFERRAM:FieldSpec := padrao_char_24{}
oDCFERRAM:HyperLabel := HyperLabel{#FERRAM,"Ferram:",NULL_STRING,"CS_FERRAM"}
oDCFERRAM:FocusSelect := FSEL_HOME

oDCCS := SingleLineEdit{self,ResourceID{JCS_CS,_GetInst()}}
oDCCS:FieldSpec := PADRAO_NUM_08{}
oDCCS:HyperLabel := HyperLabel{#CS,"cs",NULL_STRING,"RO_RO"}
oDCCS:BackGround := aBrushes[1]
oDCCS:Font(aFonts[2], FALSE)

oDCSC_RO := FixedText{self,ResourceID{JCS_SC_RO,_GetInst()}}
oDCSC_RO:HyperLabel := HyperLabel{#SC_RO,"CS",NULL_STRING,NULL_STRING}

oDCDATHURG := DateSle{self,ResourceID{JCS_DATHURG,_GetInst()}}
oDCDATHURG:FieldSpec := date_field{}
oDCDATHURG:HyperLabel := HyperLabel{#DATHURG,"Datap:",NULL_STRING,"FERRAM_DATAP"}

oDCHRURG := rightSle{self,ResourceID{JCS_HRURG,_GetInst()}}
oDCHRURG:FieldSpec := padrao_num_09_2{}
oDCHRURG:HyperLabel := HyperLabel{#HRURG,"Cliente:",NULL_STRING,"FERRAM_CLIENTE"}

oDCtheFixedText10 := FixedText{self,ResourceID{JCS_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"Critica",NULL_STRING,NULL_STRING}

oDCDATHPED := DateSle{self,ResourceID{JCS_DATHPED,_GetInst()}}
oDCDATHPED:FieldSpec := date_field{}
oDCDATHPED:HyperLabel := HyperLabel{#DATHPED,"Datap:",NULL_STRING,"FERRAM_DATAP"}

oDCHRPRE := rightSle{self,ResourceID{JCS_HRPRE,_GetInst()}}
oDCHRPRE:FieldSpec := padrao_num_09_2{}
oDCHRPRE:HyperLabel := HyperLabel{#HRPRE,"Cliente:",NULL_STRING,"FERRAM_CLIENTE"}

oDCtheFixedText11 := FixedText{self,ResourceID{JCS_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Preventiva",NULL_STRING,NULL_STRING}

oDCDATHSAL := DateSle{self,ResourceID{JCS_DATHSAL,_GetInst()}}
oDCDATHSAL:FieldSpec := date_field{}
oDCDATHSAL:HyperLabel := HyperLabel{#DATHSAL,"Datap:",NULL_STRING,"FERRAM_DATAP"}

oDCHRSAL := rightSle{self,ResourceID{JCS_HRSAL,_GetInst()}}
oDCHRSAL:FieldSpec := padrao_num_09_2{}
oDCHRSAL:HyperLabel := HyperLabel{#HRSAL,"Cliente:",NULL_STRING,"FERRAM_CLIENTE"}

oDCtheFixedText12 := FixedText{self,ResourceID{JCS_THEFIXEDTEXT12,_GetInst()}}
oDCtheFixedText12:HyperLabel := HyperLabel{#theFixedText12,"Saldo",NULL_STRING,NULL_STRING}

oDCHRTOT := rightSle{self,ResourceID{JCS_HRTOT,_GetInst()}}
oDCHRTOT:FieldSpec := padrao_num_09_2{}
oDCHRTOT:HyperLabel := HyperLabel{#HRTOT,"Cliente:",NULL_STRING,"FERRAM_CLIENTE"}

oDCtheFixedText13 := FixedText{self,ResourceID{JCS_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Referencia:",NULL_STRING,NULL_STRING}

oDCHRBAS := rightSle{self,ResourceID{JCS_HRBAS,_GetInst()}}
oDCHRBAS:FieldSpec := padrao_num_09_2{}
oDCHRBAS:HyperLabel := HyperLabel{#HRBAS,"Cliente:",NULL_STRING,"FERRAM_CLIENTE"}

oDCGroupBox2 := GroupBox{self,ResourceID{JCS_GROUPBOX2,_GetInst()}}
oDCGroupBox2:HyperLabel := HyperLabel{#GroupBox2,"Posição de Preventiva Horas",NULL_STRING,NULL_STRING}

oDCDATAURG := DateSle{self,ResourceID{JCS_DATAURG,_GetInst()}}
oDCDATAURG:FieldSpec := date_field{}
oDCDATAURG:HyperLabel := HyperLabel{#DATAURG,"Datap:",NULL_STRING,"FERRAM_DATAP"}

oDCQTDEURG := rightSle{self,ResourceID{JCS_QTDEURG,_GetInst()}}
oDCQTDEURG:FieldSpec := padrao_num_12{}
oDCQTDEURG:HyperLabel := HyperLabel{#QTDEURG,"Cliente:",NULL_STRING,"FERRAM_CLIENTE"}

oDCtheFixedText9 := FixedText{self,ResourceID{JCS_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Critica",NULL_STRING,NULL_STRING}

oDCDATAPED := DateSle{self,ResourceID{JCS_DATAPED,_GetInst()}}
oDCDATAPED:FieldSpec := date_field{}
oDCDATAPED:HyperLabel := HyperLabel{#DATAPED,"Datap:",NULL_STRING,"FERRAM_DATAP"}

oDCQTDEPED := rightSle{self,ResourceID{JCS_QTDEPED,_GetInst()}}
oDCQTDEPED:FieldSpec := padrao_num_12{}
oDCQTDEPED:HyperLabel := HyperLabel{#QTDEPED,"Cliente:",NULL_STRING,"FERRAM_CLIENTE"}

oDCtheFixedText7 := FixedText{self,ResourceID{JCS_THEFIXEDTEXT7,_GetInst()}}
oDCtheFixedText7:HyperLabel := HyperLabel{#theFixedText7,"Preventiva",NULL_STRING,NULL_STRING}

oDCDATASALDO := DateSle{self,ResourceID{JCS_DATASALDO,_GetInst()}}
oDCDATASALDO:FieldSpec := date_field{}
oDCDATASALDO:HyperLabel := HyperLabel{#DATASALDO,"Datap:",NULL_STRING,"FERRAM_DATAP"}

oDCQTDESALDO := rightSle{self,ResourceID{JCS_QTDESALDO,_GetInst()}}
oDCQTDESALDO:FieldSpec := padrao_num_12{}
oDCQTDESALDO:HyperLabel := HyperLabel{#QTDESALDO,"Cliente:",NULL_STRING,"FERRAM_CLIENTE"}

oDCtheFixedText6 := FixedText{self,ResourceID{JCS_THEFIXEDTEXT6,_GetInst()}}
oDCtheFixedText6:HyperLabel := HyperLabel{#theFixedText6,"Saldo",NULL_STRING,NULL_STRING}

oDCQTDETOT := rightSle{self,ResourceID{JCS_QTDETOT,_GetInst()}}
oDCQTDETOT:FieldSpec := padrao_num_12{}
oDCQTDETOT:HyperLabel := HyperLabel{#QTDETOT,"Cliente:",NULL_STRING,"FERRAM_CLIENTE"}

oDCQTDEBASE := rightSle{self,ResourceID{JCS_QTDEBASE,_GetInst()}}
oDCQTDEBASE:FieldSpec := padrao_num_12{}
oDCQTDEBASE:HyperLabel := HyperLabel{#QTDEBASE,"Cliente:",NULL_STRING,"FERRAM_CLIENTE"}

oDCtheFixedText4 := FixedText{self,ResourceID{JCS_THEFIXEDTEXT4,_GetInst()}}
oDCtheFixedText4:HyperLabel := HyperLabel{#theFixedText4,"Referencia:",NULL_STRING,NULL_STRING}

oDCGroupBox1 := GroupBox{self,ResourceID{JCS_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Posição de Preventiva Quantidade",NULL_STRING,NULL_STRING}

oCCPEGASALDO := PushButton{self,ResourceID{JCS_PEGASALDO,_GetInst()}}
oCCPEGASALDO:HyperLabel := HyperLabel{#PEGASALDO,"Saldo",NULL_STRING,NULL_STRING}

oCCGRAVASALDO := PushButton{self,ResourceID{JCS_GRAVASALDO,_GetInst()}}
oCCGRAVASALDO:HyperLabel := HyperLabel{#GRAVASALDO,"Lancar",NULL_STRING,NULL_STRING}

oDCLANCADA := CheckBox{self,ResourceID{JCS_LANCADA,_GetInst()}}
oDCLANCADA:HyperLabel := HyperLabel{#LANCADA,"Lancada",NULL_STRING,"Cs_LANCADA"}
oDCLANCADA:FieldSpec := logic_field{}

oDCSC_LANCUSR := FixedText{self,ResourceID{JCS_SC_LANCUSR,_GetInst()}}
oDCSC_LANCUSR:HyperLabel := HyperLabel{#SC_LANCUSR,"por:",NULL_STRING,NULL_STRING}

oDCLANCDAT := SingleLineEdit{self,ResourceID{JCS_LANCDAT,_GetInst()}}
oDCLANCDAT:FieldSpec := date_field{}
oDCLANCDAT:HyperLabel := HyperLabel{#LANCDAT,"Lancdat:",NULL_STRING,"Cs_LANCDAT"}
oDCLANCDAT:BackGround := aBrushes[1]
oDCLANCDAT:Font(aFonts[1], FALSE)

oDCLANCUSR := SingleLineEdit{self,ResourceID{JCS_LANCUSR,_GetInst()}}
oDCLANCUSR:FieldSpec := padrao_num_08{}
oDCLANCUSR:HyperLabel := HyperLabel{#LANCUSR,"Lancusr:",NULL_STRING,"Cs_LANCUSR"}
oDCLANCUSR:BackGround := aBrushes[1]
oDCLANCUSR:Font(aFonts[3], FALSE)

oCCbusca := PushButton{self,ResourceID{JCS_BUSCA,_GetInst()}}
oCCbusca:Image := ico_find{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

oCCEscme01 := PushButton{self,ResourceID{JCS_ESCME01,_GetInst()}}
oCCEscme01:HyperLabel := HyperLabel{#Escme01,"Maquina",NULL_STRING,NULL_STRING}
oCCEscme01:TooltipText := "Escolher Uma Maquina/Equipamento"

oCCEscfer := PushButton{self,ResourceID{JCS_ESCFER,_GetInst()}}
oCCEscfer:HyperLabel := HyperLabel{#Escfer,"Ferramenta",NULL_STRING,NULL_STRING}
oCCEscfer:TooltipText := "Escolher Uma Ferramenta"

oCCordem := PushButton{self,ResourceID{JCS_ORDEM,_GetInst()}}
oCCordem:Image := ico_az{}
oCCordem:HyperLabel := HyperLabel{#ordem,NULL_STRING,NULL_STRING,NULL_STRING}
oCCordem:TooltipText := "Ordenar Por Numero"

oDCTIPO := RadioButtonGroup{self,ResourceID{JCS_TIPO,_GetInst()}}
oDCTIPO:FillUsing({ ;
					{oCCRadioButton3,"M"}, ;
					{oCCRadioButton2,"F"} ;
					})
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo",NULL_STRING,NULL_STRING}
oDCTIPO:FieldSpec := padrao_char_01{}

self:Caption := "Correcao de Saldo"
self:HyperLabel := HyperLabel{#JCS,"Correcao de Saldo",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCS := DataColumn{PADRAO_NUM_08{}}
oDBCS:Width := 14
oDBCS:HyperLabel := oDCCS:HyperLabel 
oDBCS:Caption := "cs"
oDBCS:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCS)

oDBFERRAM := DataColumn{padrao_char_24{}}
oDBFERRAM:Width := 38
oDBFERRAM:HyperLabel := oDCFERRAM:HyperLabel 
oDBFERRAM:Caption := "Ferram:"
self:Browser:AddColumn(oDBFERRAM)

oDBDATA := DataColumn{date_field{}}
oDBDATA:Width := 18
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := ""
self:Browser:AddColumn(oDBDATA)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LANCADA() 
return self:FieldGet(#LANCADA)


assign LANCADA(uValue) 
self:FieldPut(#LANCADA, uValue)
return LANCADA := uValue


access LANCDAT() 
return self:FieldGet(#LANCDAT)


assign LANCDAT(uValue) 
self:FieldPut(#LANCDAT, uValue)
return LANCDAT := uValue


access LANCUSR() 
return self:FieldGet(#LANCUSR)


assign LANCUSR(uValue) 
self:FieldPut(#LANCUSR, uValue)
return LANCUSR := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


METHOD ordem( ) 
	SELF:KeyFind()

access QTDEBASE() 
return self:FieldGet(#QTDEBASE)


assign QTDEBASE(uValue) 
self:FieldPut(#QTDEBASE, uValue)
return QTDEBASE := uValue


access QTDEPED() 
return self:FieldGet(#QTDEPED)


assign QTDEPED(uValue) 
self:FieldPut(#QTDEPED, uValue)
return QTDEPED := uValue


access QTDESALDO() 
return self:FieldGet(#QTDESALDO)


assign QTDESALDO(uValue) 
self:FieldPut(#QTDESALDO, uValue)
return QTDESALDO := uValue


access QTDETOT() 
return self:FieldGet(#QTDETOT)


assign QTDETOT(uValue) 
self:FieldPut(#QTDETOT, uValue)
return QTDETOT := uValue


access QTDEURG() 
return self:FieldGet(#QTDEURG)


assign QTDEURG(uValue) 
self:FieldPut(#QTDEURG, uValue)
return QTDEURG := uValue


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


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


END CLASS
