#region DEFINES
STATIC DEFINE JRNCF_ANTERIOR := 104 
STATIC DEFINE JRNCF_CANCELAR := 106 
STATIC DEFINE JRNCF_CMDGRVNC := 111 
STATIC DEFINE JRNCF_ESCCODERR := 109 
STATIC DEFINE JRNCF_ESCREA1 := 154 
STATIC DEFINE JRNCF_ESCREA2 := 155 
STATIC DEFINE JRNCF_ESCREA3 := 156 
STATIC DEFINE JRNCF_ESCSETCOD := 110 
STATIC DEFINE JRNCF_EXCLUIR := 100 
STATIC DEFINE JRNCF_FIXEDTEXT25 := 144 
STATIC DEFINE JRNCF_FIXEDTEXT26 := 145 
STATIC DEFINE JRNCF_FIXEDTEXT27 := 146 
STATIC DEFINE JRNCF_FIXEDTEXT28 := 147 
STATIC DEFINE JRNCF_FIXEDTEXT29 := 171 
STATIC DEFINE JRNCF_FIXEDTEXT30 := 172 
STATIC DEFINE JRNCF_FIXEDTEXT33 := 149 
STATIC DEFINE JRNCF_FIXEDTEXT34 := 150 
STATIC DEFINE JRNCF_FIXEDTEXT37 := 151 
STATIC DEFINE JRNCF_FIXEDTEXT38 := 152 
STATIC DEFINE JRNCF_FIXEDTEXT39 := 157 
STATIC DEFINE JRNCF_FIXEDTEXT40 := 158 
STATIC DEFINE JRNCF_FIXEDTEXT41 := 159 
STATIC DEFINE JRNCF_FIXEDTEXT42 := 160 
STATIC DEFINE JRNCF_FIXEDTEXT43 := 161 
STATIC DEFINE JRNCF_FIXEDTEXT44 := 162 
STATIC DEFINE JRNCF_FIXEDTEXT45 := 163 
STATIC DEFINE JRNCF_FIXEDTEXT46 := 164 
STATIC DEFINE JRNCF_FIXEDTEXT47 := 165 
STATIC DEFINE JRNCF_FIXEDTEXT48 := 166 
STATIC DEFINE JRNCF_FIXEDTEXT49 := 176 
STATIC DEFINE JRNCF_FIXEDTEXT5 := 113 
STATIC DEFINE JRNCF_FIXEDTEXT50 := 178 
STATIC DEFINE JRNCF_FIXEDTEXT51 := 179 
STATIC DEFINE JRNCF_FIXEDTEXT52 := 180 
STATIC DEFINE JRNCF_GROUPBOX1 := 143 
STATIC DEFINE JRNCF_GROUPBOX2 := 148 
STATIC DEFINE JRNCF_GROUPBOX3 := 153 
STATIC DEFINE JRNCF_GROUPBOX4 := 167 
STATIC DEFINE JRNCF_GROUPBOX5 := 168 
STATIC DEFINE JRNCF_INCLUIR := 101 
STATIC DEFINE JRNCF_JRNCI := 102 
STATIC DEFINE JRNCF_MATCOD := 133 
STATIC DEFINE JRNCF_MATNOM := 134 
STATIC DEFINE JRNCF_NAOCONF := 112 
STATIC DEFINE JRNCF_OK := 108 
STATIC DEFINE JRNCF_PROXIMO := 103 
STATIC DEFINE JRNCF_REHDF := 173 
STATIC DEFINE JRNCF_REHDI := 174 
STATIC DEFINE JRNCF_REHHF := 175 
STATIC DEFINE JRNCF_REHHI := 177 
STATIC DEFINE JRNCF_REHTH := 170 
STATIC DEFINE JRNCF_REHVL := 169 
STATIC DEFINE JRNCF_REIDF := 129 
STATIC DEFINE JRNCF_REIDI := 127 
STATIC DEFINE JRNCF_REIHF := 128 
STATIC DEFINE JRNCF_REIHI := 126 
STATIC DEFINE JRNCF_REIQT := 132 
STATIC DEFINE JRNCF_REITH := 130 
STATIC DEFINE JRNCF_REIVL := 131 
STATIC DEFINE JRNCF_RETDF := 123 
STATIC DEFINE JRNCF_RETDI := 121 
STATIC DEFINE JRNCF_RETHF := 122 
STATIC DEFINE JRNCF_RETHI := 120 
STATIC DEFINE JRNCF_RETNO2 := 138 
STATIC DEFINE JRNCF_RETNO3 := 140 
STATIC DEFINE JRNCF_RETNOM := 136 
STATIC DEFINE JRNCF_RETOP2 := 137 
STATIC DEFINE JRNCF_RETOP3 := 139 
STATIC DEFINE JRNCF_RETOPR := 135 
STATIC DEFINE JRNCF_RETTH := 124 
STATIC DEFINE JRNCF_RETVAL := 141 
STATIC DEFINE JRNCF_RETVL := 125 
STATIC DEFINE JRNCF_SC_REIQT := 142 
STATIC DEFINE JRNCF_SELDF := 117 
STATIC DEFINE JRNCF_SELDI := 115 
STATIC DEFINE JRNCF_SELHF := 116 
STATIC DEFINE JRNCF_SELHI := 114 
STATIC DEFINE JRNCF_SELTH := 118 
STATIC DEFINE JRNCF_SELVL := 119 
STATIC DEFINE JRNCF_THEFIXEDTEXT11 := 107 
STATIC DEFINE JRNCF_THEFIXEDTEXT9 := 105 
#endregion

PARTIAL class JRNCF inherit MYDatadialog 

	protect oCCExcluir as PUSHBUTTON
	protect oCCIncluir as PUSHBUTTON
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCcancelar as PUSHBUTTON
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
	protect oCCesccoderr as PUSHBUTTON
	protect oCCescsetcod as PUSHBUTTON
	protect oCCcmdgrvnc as PUSHBUTTON
	protect oDCNAOCONF as SINGLELINEEDIT
	protect oDCFixedText5 as FIXEDTEXT
	protect oDCSELHI as RIGHTSLE
	protect oDCSELDI as DATESLE
	protect oDCSELHF as RIGHTSLE
	protect oDCSELDF as DATESLE
	protect oDCSELTH as RIGHTSLE
	protect oDCSELVL as RIGHTSLE
	protect oDCRETHI as RIGHTSLE
	protect oDCRETDI as DATESLE
	protect oDCRETHF as RIGHTSLE
	protect oDCRETDF as DATESLE
	protect oDCRETTH as RIGHTSLE
	protect oDCRETVL as RIGHTSLE
	protect oDCREIHI as RIGHTSLE
	protect oDCREIDI as DATESLE
	protect oDCREIHF as RIGHTSLE
	protect oDCREIDF as DATESLE
	protect oDCREITH as RIGHTSLE
	protect oDCREIVL as RIGHTSLE
	protect oDCREIQT as RIGHTSLE
	protect oDCMATCOD as SINGLELINEEDIT
	protect oDCMATNOM as SINGLELINEEDIT
	protect oDCRETOPR as RIGHTSLE
	protect oDCRETNOM as SINGLELINEEDIT
	protect oDCRETOP2 as RIGHTSLE
	protect oDCRETNO2 as SINGLELINEEDIT
	protect oDCRETOP3 as RIGHTSLE
	protect oDCRETNO3 as SINGLELINEEDIT
	protect oDCRETVAL as RIGHTSLE
	protect oDCSC_REIQT as FIXEDTEXT
	protect oDCGroupBox1 as GROUPBOX
	protect oDCFixedText25 as FIXEDTEXT
	protect oDCFixedText26 as FIXEDTEXT
	protect oDCFixedText27 as FIXEDTEXT
	protect oDCFixedText28 as FIXEDTEXT
	protect oDCGroupBox2 as GROUPBOX
	protect oDCFixedText33 as FIXEDTEXT
	protect oDCFixedText34 as FIXEDTEXT
	protect oDCFixedText37 as FIXEDTEXT
	protect oDCFixedText38 as FIXEDTEXT
	protect oDCGroupBox3 as GROUPBOX
	protect oCCESCREA1 as PUSHBUTTON
	protect oCCESCREA2 as PUSHBUTTON
	protect oCCESCREA3 as PUSHBUTTON
	protect oDCFixedText39 as FIXEDTEXT
	protect oDCFixedText40 as FIXEDTEXT
	protect oDCFixedText41 as FIXEDTEXT
	protect oDCFixedText42 as FIXEDTEXT
	protect oDCFixedText43 as FIXEDTEXT
	protect oDCFixedText44 as FIXEDTEXT
	protect oDCFixedText45 as FIXEDTEXT
	protect oDCFixedText46 as FIXEDTEXT
	protect oDCFixedText47 as FIXEDTEXT
	protect oDCFixedText48 as FIXEDTEXT
	protect oDCGroupBox4 as GROUPBOX
	protect oDCGroupBox5 as GROUPBOX
	protect oDCREHVL as RIGHTSLE
	protect oDCREHTH as RIGHTSLE
	protect oDCFixedText29 as FIXEDTEXT
	protect oDCFixedText30 as FIXEDTEXT
	protect oDCREHDF as DATESLE
	protect oDCREHDI as DATESLE
	protect oDCREHHF as RIGHTSLE
	protect oDCFixedText49 as FIXEDTEXT
	protect oDCREHHI as RIGHTSLE
	protect oDCFixedText50 as FIXEDTEXT
	protect oDCFixedText51 as FIXEDTEXT
	protect oDCFixedText52 as FIXEDTEXT
// 	instance NAOCONF 
// 	instance SELHI 
// 	instance SELDI 
// 	instance SELHF 
// 	instance SELDF 
// 	instance SELTH 
// 	instance SELVL 
// 	instance RETHI 
// 	instance RETDI 
// 	instance RETHF 
// 	instance RETDF 
// 	instance RETTH 
// 	instance RETVL 
// 	instance REIHI 
// 	instance REIDI 
// 	instance REIHF 
// 	instance REIDF 
// 	instance REITH 
// 	instance REIVL 
// 	instance REIQT 
// 	instance MATCOD 
// 	instance MATNOM 
// 	instance RETOPR 
// 	instance RETNOM 
// 	instance RETOP2 
// 	instance RETNO2 
// 	instance RETOP3 
// 	instance RETNO3 
// 	instance RETVAL 
// 	instance REHVL 
// 	instance REHTH 
// 	instance REHDF 
// 	instance REHDI 
// 	instance REHHF 
// 	instance REHHI 
	protect oSFJRNCI as JRNCI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRNCF",_GetInst()},iCtlID)

oCCExcluir := PushButton{self,ResourceID{JRNCF_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}

oCCIncluir := PushButton{self,ResourceID{JRNCF_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}

oCCProximo := PushButton{self,ResourceID{JRNCF_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_next{}

oCCAnterior := PushButton{self,ResourceID{JRNCF_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_previous{}

oDCtheFixedText9 := FixedText{self,ResourceID{JRNCF_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Cancelar",NULL_STRING,NULL_STRING}

oCCcancelar := PushButton{self,ResourceID{JRNCF_CANCELAR,_GetInst()}}
oCCcancelar:HyperLabel := HyperLabel{#cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCcancelar:Image := ico_sair{}

oDCtheFixedText11 := FixedText{self,ResourceID{JRNCF_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JRNCF_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}

oCCesccoderr := PushButton{self,ResourceID{JRNCF_ESCCODERR,_GetInst()}}
oCCesccoderr:HyperLabel := HyperLabel{#esccoderr,"Erro",NULL_STRING,NULL_STRING}

oCCescsetcod := PushButton{self,ResourceID{JRNCF_ESCSETCOD,_GetInst()}}
oCCescsetcod:HyperLabel := HyperLabel{#escsetcod,"Setor",NULL_STRING,NULL_STRING}

oCCcmdgrvnc := PushButton{self,ResourceID{JRNCF_CMDGRVNC,_GetInst()}}
oCCcmdgrvnc:HyperLabel := HyperLabel{#cmdgrvnc,"<---",NULL_STRING,NULL_STRING}

oDCNAOCONF := SingleLineEdit{self,ResourceID{JRNCF_NAOCONF,_GetInst()}}
oDCNAOCONF:FieldSpec := PADRAO_NUM_08{}
oDCNAOCONF:HyperLabel := HyperLabel{#NAOCONF,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText5 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT5,_GetInst()}}
oDCFixedText5:HyperLabel := HyperLabel{#FixedText5,"Qtde Nao Conforme",NULL_STRING,NULL_STRING}

oDCSELHI := rightSle{self,ResourceID{JRNCF_SELHI,_GetInst()}}
oDCSELHI:FieldSpec := PADRAO_NUm_05_2{}
oDCSELHI:HyperLabel := HyperLabel{#SELHI,"Selhi:",NULL_STRING,"RNC_SELHI"}

oDCSELDI := DateSle{self,ResourceID{JRNCF_SELDI,_GetInst()}}
oDCSELDI:FieldSpec := DATE_FIELD{}
oDCSELDI:HyperLabel := HyperLabel{#SELDI,"Seldi:",NULL_STRING,"RNC_SELDI"}

oDCSELHF := rightSle{self,ResourceID{JRNCF_SELHF,_GetInst()}}
oDCSELHF:FieldSpec := PADRAO_NUm_05_2{}
oDCSELHF:HyperLabel := HyperLabel{#SELHF,"Selhf:",NULL_STRING,"RNC_SELHF"}

oDCSELDF := DateSle{self,ResourceID{JRNCF_SELDF,_GetInst()}}
oDCSELDF:FieldSpec := DATE_FIELD{}
oDCSELDF:HyperLabel := HyperLabel{#SELDF,"Seldf:",NULL_STRING,"RNC_SELDF"}

oDCSELTH := rightSle{self,ResourceID{JRNCF_SELTH,_GetInst()}}
oDCSELTH:FieldSpec := PADRAO_NUM_12_2{}
oDCSELTH:HyperLabel := HyperLabel{#SELTH,"Selth:",NULL_STRING,"RNC_SELTH"}

oDCSELVL := rightSle{self,ResourceID{JRNCF_SELVL,_GetInst()}}
oDCSELVL:FieldSpec := PADRAO_NUM_12_2{}
oDCSELVL:HyperLabel := HyperLabel{#SELVL,"Selvl:",NULL_STRING,"RNC_SELVL"}

oDCRETHI := rightSle{self,ResourceID{JRNCF_RETHI,_GetInst()}}
oDCRETHI:FieldSpec := PADRAO_NUm_05_2{}
oDCRETHI:HyperLabel := HyperLabel{#RETHI,"Rethi:",NULL_STRING,"RNC_RETHI"}

oDCRETDI := DateSle{self,ResourceID{JRNCF_RETDI,_GetInst()}}
oDCRETDI:FieldSpec := DATE_FIELD{}
oDCRETDI:HyperLabel := HyperLabel{#RETDI,"Retdi:",NULL_STRING,"RNC_RETDI"}

oDCRETHF := rightSle{self,ResourceID{JRNCF_RETHF,_GetInst()}}
oDCRETHF:FieldSpec := PADRAO_NUm_05_2{}
oDCRETHF:HyperLabel := HyperLabel{#RETHF,"Rethf:",NULL_STRING,"RNC_RETHF"}

oDCRETDF := DateSle{self,ResourceID{JRNCF_RETDF,_GetInst()}}
oDCRETDF:FieldSpec := DATE_FIELD{}
oDCRETDF:HyperLabel := HyperLabel{#RETDF,"Retdf:",NULL_STRING,"RNC_RETDF"}

oDCRETTH := rightSle{self,ResourceID{JRNCF_RETTH,_GetInst()}}
oDCRETTH:FieldSpec := PADRAO_NUM_12_2{}
oDCRETTH:HyperLabel := HyperLabel{#RETTH,"Retth:",NULL_STRING,"RNC_RETTH"}

oDCRETVL := rightSle{self,ResourceID{JRNCF_RETVL,_GetInst()}}
oDCRETVL:FieldSpec := PADRAO_NUM_12_2{}
oDCRETVL:HyperLabel := HyperLabel{#RETVL,"Retvl:",NULL_STRING,"RNC_RETVL"}

oDCREIHI := rightSle{self,ResourceID{JRNCF_REIHI,_GetInst()}}
oDCREIHI:FieldSpec := PADRAO_NUm_05_2{}
oDCREIHI:HyperLabel := HyperLabel{#REIHI,"Reihi:",NULL_STRING,"RNC_REIHI"}

oDCREIDI := DateSle{self,ResourceID{JRNCF_REIDI,_GetInst()}}
oDCREIDI:FieldSpec := DATE_FIELD{}
oDCREIDI:HyperLabel := HyperLabel{#REIDI,"Reidi:",NULL_STRING,"RNC_REIDI"}

oDCREIHF := rightSle{self,ResourceID{JRNCF_REIHF,_GetInst()}}
oDCREIHF:FieldSpec := PADRAO_NUm_05_2{}
oDCREIHF:HyperLabel := HyperLabel{#REIHF,"Reihf:",NULL_STRING,"RNC_REIHF"}

oDCREIDF := DateSle{self,ResourceID{JRNCF_REIDF,_GetInst()}}
oDCREIDF:FieldSpec := DATE_FIELD{}
oDCREIDF:HyperLabel := HyperLabel{#REIDF,"Reidf:",NULL_STRING,"RNC_REIDF"}

oDCREITH := rightSle{self,ResourceID{JRNCF_REITH,_GetInst()}}
oDCREITH:FieldSpec := PADRAO_NUM_12_2{}
oDCREITH:HyperLabel := HyperLabel{#REITH,"Reith:",NULL_STRING,"RNC_REITH"}

oDCREIVL := rightSle{self,ResourceID{JRNCF_REIVL,_GetInst()}}
oDCREIVL:FieldSpec := PADRAO_NUM_12_2{}
oDCREIVL:HyperLabel := HyperLabel{#REIVL,"Reivl:",NULL_STRING,"RNC_REIVL"}

oDCREIQT := rightSle{self,ResourceID{JRNCF_REIQT,_GetInst()}}
oDCREIQT:FieldSpec := PADRAO_NUM_08{}
oDCREIQT:HyperLabel := HyperLabel{#REIQT,"Reiqt:",NULL_STRING,"RNC_REIQT"}

oDCMATCOD := SingleLineEdit{self,ResourceID{JRNCF_MATCOD,_GetInst()}}
oDCMATCOD:FieldSpec := PADRAO_CHAR_20{}
oDCMATCOD:HyperLabel := HyperLabel{#MATCOD,"Matcod:",NULL_STRING,"RNC_MATCOD"}

oDCMATNOM := SingleLineEdit{self,ResourceID{JRNCF_MATNOM,_GetInst()}}
oDCMATNOM:FieldSpec := PADRAO_CHAR_40{}
oDCMATNOM:HyperLabel := HyperLabel{#MATNOM,"Matnom:",NULL_STRING,"RNC_MATNOM"}

oDCRETOPR := rightSle{self,ResourceID{JRNCF_RETOPR,_GetInst()}}
oDCRETOPR:FieldSpec := PADRAO_NUM_08{}
oDCRETOPR:HyperLabel := HyperLabel{#RETOPR,"Retopr:",NULL_STRING,"RNC_RETOPR"}

oDCRETNOM := SingleLineEdit{self,ResourceID{JRNCF_RETNOM,_GetInst()}}
oDCRETNOM:FieldSpec := PADRAO_CHAR_40{}
oDCRETNOM:HyperLabel := HyperLabel{#RETNOM,"Retnom:",NULL_STRING,"RNC_RETNOM"}

oDCRETOP2 := rightSle{self,ResourceID{JRNCF_RETOP2,_GetInst()}}
oDCRETOP2:FieldSpec := PADRAO_NUM_08{}
oDCRETOP2:HyperLabel := HyperLabel{#RETOP2,"Retopr:",NULL_STRING,"RNC_RETOPR"}

oDCRETNO2 := SingleLineEdit{self,ResourceID{JRNCF_RETNO2,_GetInst()}}
oDCRETNO2:FieldSpec := PADRAO_CHAR_40{}
oDCRETNO2:HyperLabel := HyperLabel{#RETNO2,"Retnom:",NULL_STRING,"RNC_RETNOM"}

oDCRETOP3 := rightSle{self,ResourceID{JRNCF_RETOP3,_GetInst()}}
oDCRETOP3:FieldSpec := PADRAO_NUM_08{}
oDCRETOP3:HyperLabel := HyperLabel{#RETOP3,"Retopr:",NULL_STRING,"RNC_RETOPR"}

oDCRETNO3 := SingleLineEdit{self,ResourceID{JRNCF_RETNO3,_GetInst()}}
oDCRETNO3:FieldSpec := PADRAO_CHAR_40{}
oDCRETNO3:HyperLabel := HyperLabel{#RETNO3,"Retnom:",NULL_STRING,"RNC_RETNOM"}

oDCRETVAL := rightSle{self,ResourceID{JRNCF_RETVAL,_GetInst()}}
oDCRETVAL:FieldSpec := PADRAO_NUM_12_2{}
oDCRETVAL:HyperLabel := HyperLabel{#RETVAL,"Retval:",NULL_STRING,"RNC_RETVAL"}

oDCSC_REIQT := FixedText{self,ResourceID{JRNCF_SC_REIQT,_GetInst()}}
oDCSC_REIQT:HyperLabel := HyperLabel{#SC_REIQT,"Qtde",NULL_STRING,NULL_STRING}

oDCGroupBox1 := GroupBox{self,ResourceID{JRNCF_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Seleção",NULL_STRING,NULL_STRING}

oDCFixedText25 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT25,_GetInst()}}
oDCFixedText25:HyperLabel := HyperLabel{#FixedText25,"Valor",NULL_STRING,NULL_STRING}

oDCFixedText26 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT26,_GetInst()}}
oDCFixedText26:HyperLabel := HyperLabel{#FixedText26,"Total Horas",NULL_STRING,NULL_STRING}

oDCFixedText27 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT27,_GetInst()}}
oDCFixedText27:HyperLabel := HyperLabel{#FixedText27,"Valor",NULL_STRING,NULL_STRING}

oDCFixedText28 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT28,_GetInst()}}
oDCFixedText28:HyperLabel := HyperLabel{#FixedText28,"Total Horas",NULL_STRING,NULL_STRING}

oDCGroupBox2 := GroupBox{self,ResourceID{JRNCF_GROUPBOX2,_GetInst()}}
oDCGroupBox2:HyperLabel := HyperLabel{#GroupBox2,"Retrabalho Maquina",NULL_STRING,NULL_STRING}

oDCFixedText33 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT33,_GetInst()}}
oDCFixedText33:HyperLabel := HyperLabel{#FixedText33,"Valor",NULL_STRING,NULL_STRING}

oDCFixedText34 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT34,_GetInst()}}
oDCFixedText34:HyperLabel := HyperLabel{#FixedText34,"Total Horas",NULL_STRING,NULL_STRING}

oDCFixedText37 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT37,_GetInst()}}
oDCFixedText37:HyperLabel := HyperLabel{#FixedText37,"Final",NULL_STRING,NULL_STRING}

oDCFixedText38 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT38,_GetInst()}}
oDCFixedText38:HyperLabel := HyperLabel{#FixedText38,"Hora",NULL_STRING,NULL_STRING}

oDCGroupBox3 := GroupBox{self,ResourceID{JRNCF_GROUPBOX3,_GetInst()}}
oDCGroupBox3:HyperLabel := HyperLabel{#GroupBox3,"Reinspeção",NULL_STRING,NULL_STRING}

oCCESCREA1 := PushButton{self,ResourceID{JRNCF_ESCREA1,_GetInst()}}
oCCESCREA1:HyperLabel := HyperLabel{#ESCREA1,"...",NULL_STRING,NULL_STRING}

oCCESCREA2 := PushButton{self,ResourceID{JRNCF_ESCREA2,_GetInst()}}
oCCESCREA2:HyperLabel := HyperLabel{#ESCREA2,"...",NULL_STRING,NULL_STRING}

oCCESCREA3 := PushButton{self,ResourceID{JRNCF_ESCREA3,_GetInst()}}
oCCESCREA3:HyperLabel := HyperLabel{#ESCREA3,"...",NULL_STRING,NULL_STRING}

oDCFixedText39 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT39,_GetInst()}}
oDCFixedText39:HyperLabel := HyperLabel{#FixedText39,"Inicial",NULL_STRING,NULL_STRING}

oDCFixedText40 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT40,_GetInst()}}
oDCFixedText40:HyperLabel := HyperLabel{#FixedText40,"Data",NULL_STRING,NULL_STRING}

oDCFixedText41 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT41,_GetInst()}}
oDCFixedText41:HyperLabel := HyperLabel{#FixedText41,"Hora",NULL_STRING,NULL_STRING}

oDCFixedText42 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT42,_GetInst()}}
oDCFixedText42:HyperLabel := HyperLabel{#FixedText42,"Data",NULL_STRING,NULL_STRING}

oDCFixedText43 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT43,_GetInst()}}
oDCFixedText43:HyperLabel := HyperLabel{#FixedText43,"Final",NULL_STRING,NULL_STRING}

oDCFixedText44 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT44,_GetInst()}}
oDCFixedText44:HyperLabel := HyperLabel{#FixedText44,"Inicial",NULL_STRING,NULL_STRING}

oDCFixedText45 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT45,_GetInst()}}
oDCFixedText45:HyperLabel := HyperLabel{#FixedText45,"Final",NULL_STRING,NULL_STRING}

oDCFixedText46 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT46,_GetInst()}}
oDCFixedText46:HyperLabel := HyperLabel{#FixedText46,"Inicial",NULL_STRING,NULL_STRING}

oDCFixedText47 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT47,_GetInst()}}
oDCFixedText47:HyperLabel := HyperLabel{#FixedText47,"Data",NULL_STRING,NULL_STRING}

oDCFixedText48 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT48,_GetInst()}}
oDCFixedText48:HyperLabel := HyperLabel{#FixedText48,"Hora",NULL_STRING,NULL_STRING}

oDCGroupBox4 := GroupBox{self,ResourceID{JRNCF_GROUPBOX4,_GetInst()}}
oDCGroupBox4:HyperLabel := HyperLabel{#GroupBox4,"Material",NULL_STRING,NULL_STRING}

oDCGroupBox5 := GroupBox{self,ResourceID{JRNCF_GROUPBOX5,_GetInst()}}
oDCGroupBox5:HyperLabel := HyperLabel{#GroupBox5,"Retrabalho Operador",NULL_STRING,NULL_STRING}

oDCREHVL := rightSle{self,ResourceID{JRNCF_REHVL,_GetInst()}}
oDCREHVL:FieldSpec := PADRAO_NUM_12_2{}
oDCREHVL:HyperLabel := HyperLabel{#REHVL,"Retvl:",NULL_STRING,"RNC_RETVL"}

oDCREHTH := rightSle{self,ResourceID{JRNCF_REHTH,_GetInst()}}
oDCREHTH:FieldSpec := PADRAO_NUM_12_2{}
oDCREHTH:HyperLabel := HyperLabel{#REHTH,"Retth:",NULL_STRING,"RNC_RETTH"}

oDCFixedText29 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT29,_GetInst()}}
oDCFixedText29:HyperLabel := HyperLabel{#FixedText29,"Valor",NULL_STRING,NULL_STRING}

oDCFixedText30 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT30,_GetInst()}}
oDCFixedText30:HyperLabel := HyperLabel{#FixedText30,"Total Horas",NULL_STRING,NULL_STRING}

oDCREHDF := DateSle{self,ResourceID{JRNCF_REHDF,_GetInst()}}
oDCREHDF:FieldSpec := DATE_FIELD{}
oDCREHDF:HyperLabel := HyperLabel{#REHDF,"Retdf:",NULL_STRING,"RNC_RETDF"}

oDCREHDI := DateSle{self,ResourceID{JRNCF_REHDI,_GetInst()}}
oDCREHDI:FieldSpec := DATE_FIELD{}
oDCREHDI:HyperLabel := HyperLabel{#REHDI,"Retdi:",NULL_STRING,"RNC_RETDI"}

oDCREHHF := rightSle{self,ResourceID{JRNCF_REHHF,_GetInst()}}
oDCREHHF:FieldSpec := PADRAO_NUm_05_2{}
oDCREHHF:HyperLabel := HyperLabel{#REHHF,"Rethf:",NULL_STRING,"RNC_RETHF"}

oDCFixedText49 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT49,_GetInst()}}
oDCFixedText49:HyperLabel := HyperLabel{#FixedText49,"Data",NULL_STRING,NULL_STRING}

oDCREHHI := rightSle{self,ResourceID{JRNCF_REHHI,_GetInst()}}
oDCREHHI:FieldSpec := PADRAO_NUm_05_2{}
oDCREHHI:HyperLabel := HyperLabel{#REHHI,"Rethi:",NULL_STRING,"RNC_RETHI"}

oDCFixedText50 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT50,_GetInst()}}
oDCFixedText50:HyperLabel := HyperLabel{#FixedText50,"Hora",NULL_STRING,NULL_STRING}

oDCFixedText51 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT51,_GetInst()}}
oDCFixedText51:HyperLabel := HyperLabel{#FixedText51,"Inicial",NULL_STRING,NULL_STRING}

oDCFixedText52 := FixedText{self,ResourceID{JRNCF_FIXEDTEXT52,_GetInst()}}
oDCFixedText52:HyperLabel := HyperLabel{#FixedText52,"Final",NULL_STRING,NULL_STRING}

self:Caption := "Fechamento RNC"
self:HyperLabel := HyperLabel{#JRNCF,"Fechamento RNC",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFJRNCI := JRNCI{self,JRNCF_JRNCI}
oSFJRNCI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MATCOD() 
return self:FieldGet(#MATCOD)


assign MATCOD(uValue) 
self:FieldPut(#MATCOD, uValue)
return MATCOD := uValue


access MATNOM() 
return self:FieldGet(#MATNOM)


assign MATNOM(uValue) 
self:FieldPut(#MATNOM, uValue)
return MATNOM := uValue


access NAOCONF() 
return self:FieldGet(#NAOCONF)


assign NAOCONF(uValue) 
self:FieldPut(#NAOCONF, uValue)
return NAOCONF := uValue


access REHDF() 
return self:FieldGet(#REHDF)


assign REHDF(uValue) 
self:FieldPut(#REHDF, uValue)
return REHDF := uValue


access REHDI() 
return self:FieldGet(#REHDI)


assign REHDI(uValue) 
self:FieldPut(#REHDI, uValue)
return REHDI := uValue


access REHHF() 
return self:FieldGet(#REHHF)


assign REHHF(uValue) 
self:FieldPut(#REHHF, uValue)
return REHHF := uValue


access REHHI() 
return self:FieldGet(#REHHI)


assign REHHI(uValue) 
self:FieldPut(#REHHI, uValue)
return REHHI := uValue


access REHTH() 
return self:FieldGet(#REHTH)


assign REHTH(uValue) 
self:FieldPut(#REHTH, uValue)
return REHTH := uValue


access REHVL() 
return self:FieldGet(#REHVL)


assign REHVL(uValue) 
self:FieldPut(#REHVL, uValue)
return REHVL := uValue


access REIDF() 
return self:FieldGet(#REIDF)


assign REIDF(uValue) 
self:FieldPut(#REIDF, uValue)
return REIDF := uValue


access REIDI() 
return self:FieldGet(#REIDI)


assign REIDI(uValue) 
self:FieldPut(#REIDI, uValue)
return REIDI := uValue


access REIHF() 
return self:FieldGet(#REIHF)


assign REIHF(uValue) 
self:FieldPut(#REIHF, uValue)
return REIHF := uValue


access REIHI() 
return self:FieldGet(#REIHI)


assign REIHI(uValue) 
self:FieldPut(#REIHI, uValue)
return REIHI := uValue


access REIQT() 
return self:FieldGet(#REIQT)


assign REIQT(uValue) 
self:FieldPut(#REIQT, uValue)
return REIQT := uValue


access REITH() 
return self:FieldGet(#REITH)


assign REITH(uValue) 
self:FieldPut(#REITH, uValue)
return REITH := uValue


access REIVL() 
return self:FieldGet(#REIVL)


assign REIVL(uValue) 
self:FieldPut(#REIVL, uValue)
return REIVL := uValue


access RETDF() 
return self:FieldGet(#RETDF)


assign RETDF(uValue) 
self:FieldPut(#RETDF, uValue)
return RETDF := uValue


access RETDI() 
return self:FieldGet(#RETDI)


assign RETDI(uValue) 
self:FieldPut(#RETDI, uValue)
return RETDI := uValue


access RETHF() 
return self:FieldGet(#RETHF)


assign RETHF(uValue) 
self:FieldPut(#RETHF, uValue)
return RETHF := uValue


access RETHI() 
return self:FieldGet(#RETHI)


assign RETHI(uValue) 
self:FieldPut(#RETHI, uValue)
return RETHI := uValue


access RETNO2() 
return self:FieldGet(#RETNO2)


assign RETNO2(uValue) 
self:FieldPut(#RETNO2, uValue)
return RETNO2 := uValue


access RETNO3() 
return self:FieldGet(#RETNO3)


assign RETNO3(uValue) 
self:FieldPut(#RETNO3, uValue)
return RETNO3 := uValue


access RETNOM() 
return self:FieldGet(#RETNOM)


assign RETNOM(uValue) 
self:FieldPut(#RETNOM, uValue)
return RETNOM := uValue


access RETOP2() 
return self:FieldGet(#RETOP2)


assign RETOP2(uValue) 
self:FieldPut(#RETOP2, uValue)
return RETOP2 := uValue


access RETOP3() 
return self:FieldGet(#RETOP3)


assign RETOP3(uValue) 
self:FieldPut(#RETOP3, uValue)
return RETOP3 := uValue


access RETOPR() 
return self:FieldGet(#RETOPR)


assign RETOPR(uValue) 
self:FieldPut(#RETOPR, uValue)
return RETOPR := uValue


access RETTH() 
return self:FieldGet(#RETTH)


assign RETTH(uValue) 
self:FieldPut(#RETTH, uValue)
return RETTH := uValue


access RETVAL() 
return self:FieldGet(#RETVAL)


assign RETVAL(uValue) 
self:FieldPut(#RETVAL, uValue)
return RETVAL := uValue


access RETVL() 
return self:FieldGet(#RETVL)


assign RETVL(uValue) 
self:FieldPut(#RETVL, uValue)
return RETVL := uValue


access SELDF() 
return self:FieldGet(#SELDF)


assign SELDF(uValue) 
self:FieldPut(#SELDF, uValue)
return SELDF := uValue


access SELDI() 
return self:FieldGet(#SELDI)


assign SELDI(uValue) 
self:FieldPut(#SELDI, uValue)
return SELDI := uValue


access SELHF() 
return self:FieldGet(#SELHF)


assign SELHF(uValue) 
self:FieldPut(#SELHF, uValue)
return SELHF := uValue


access SELHI() 
return self:FieldGet(#SELHI)


assign SELHI(uValue) 
self:FieldPut(#SELHI, uValue)
return SELHI := uValue


access SELTH() 
return self:FieldGet(#SELTH)


assign SELTH(uValue) 
self:FieldPut(#SELTH, uValue)
return SELTH := uValue


access SELVL() 
return self:FieldGet(#SELVL)


assign SELVL(uValue) 
self:FieldPut(#SELVL, uValue)
return SELVL := uValue


END CLASS
