#region DEFINES
STATIC DEFINE JRNC4_CALC := 166 
STATIC DEFINE JRNC4_FIXEDTEXT25 := 123 
STATIC DEFINE JRNC4_FIXEDTEXT26 := 124 
STATIC DEFINE JRNC4_FIXEDTEXT27 := 125 
STATIC DEFINE JRNC4_FIXEDTEXT28 := 126 
STATIC DEFINE JRNC4_FIXEDTEXT29 := 149 
STATIC DEFINE JRNC4_FIXEDTEXT30 := 150 
STATIC DEFINE JRNC4_FIXEDTEXT31 := 160 
STATIC DEFINE JRNC4_FIXEDTEXT32 := 161 
STATIC DEFINE JRNC4_FIXEDTEXT33 := 128 
STATIC DEFINE JRNC4_FIXEDTEXT34 := 129 
STATIC DEFINE JRNC4_FIXEDTEXT35 := 162 
STATIC DEFINE JRNC4_FIXEDTEXT37 := 130 
STATIC DEFINE JRNC4_FIXEDTEXT38 := 131 
STATIC DEFINE JRNC4_FIXEDTEXT39 := 135 
STATIC DEFINE JRNC4_FIXEDTEXT40 := 136 
STATIC DEFINE JRNC4_FIXEDTEXT41 := 137 
STATIC DEFINE JRNC4_FIXEDTEXT42 := 138 
STATIC DEFINE JRNC4_FIXEDTEXT43 := 139 
STATIC DEFINE JRNC4_FIXEDTEXT44 := 140 
STATIC DEFINE JRNC4_FIXEDTEXT45 := 141 
STATIC DEFINE JRNC4_FIXEDTEXT46 := 142 
STATIC DEFINE JRNC4_FIXEDTEXT47 := 143 
STATIC DEFINE JRNC4_FIXEDTEXT48 := 144 
STATIC DEFINE JRNC4_FIXEDTEXT49 := 154 
STATIC DEFINE JRNC4_FIXEDTEXT50 := 156 
STATIC DEFINE JRNC4_FIXEDTEXT51 := 157 
STATIC DEFINE JRNC4_FIXEDTEXT52 := 158 
STATIC DEFINE JRNC4_GROUPBOX1 := 122 
STATIC DEFINE JRNC4_GROUPBOX2 := 127 
STATIC DEFINE JRNC4_GROUPBOX3 := 132 
STATIC DEFINE JRNC4_GROUPBOX4 := 145 
STATIC DEFINE JRNC4_GROUPBOX5 := 146 
STATIC DEFINE JRNC4_GROUPBOX6 := 159 
STATIC DEFINE JRNC4_MATCOD := 119 
STATIC DEFINE JRNC4_MATNOM := 120 
STATIC DEFINE JRNC4_OK := 134 
STATIC DEFINE JRNC4_PECSUC := 164 
STATIC DEFINE JRNC4_PEGPRECO := 167 
STATIC DEFINE JRNC4_QTDSUC := 163 
STATIC DEFINE JRNC4_REHDF := 151 
STATIC DEFINE JRNC4_REHDI := 152 
STATIC DEFINE JRNC4_REHHF := 153 
STATIC DEFINE JRNC4_REHHI := 155 
STATIC DEFINE JRNC4_REHTH := 148 
STATIC DEFINE JRNC4_REHVL := 147 
STATIC DEFINE JRNC4_REIDF := 115 
STATIC DEFINE JRNC4_REIDI := 113 
STATIC DEFINE JRNC4_REIHF := 114 
STATIC DEFINE JRNC4_REIHI := 112 
STATIC DEFINE JRNC4_REIQT := 118 
STATIC DEFINE JRNC4_REITH := 116 
STATIC DEFINE JRNC4_REIVL := 117 
STATIC DEFINE JRNC4_RETDF := 109 
STATIC DEFINE JRNC4_RETDI := 107 
STATIC DEFINE JRNC4_RETHF := 108 
STATIC DEFINE JRNC4_RETHI := 106 
STATIC DEFINE JRNC4_RETTH := 110 
STATIC DEFINE JRNC4_RETVL := 111 
STATIC DEFINE JRNC4_SC_REIQT := 121 
STATIC DEFINE JRNC4_SELDF := 103 
STATIC DEFINE JRNC4_SELDI := 101 
STATIC DEFINE JRNC4_SELHF := 102 
STATIC DEFINE JRNC4_SELHI := 100 
STATIC DEFINE JRNC4_SELTH := 104 
STATIC DEFINE JRNC4_SELVL := 105 
STATIC DEFINE JRNC4_THEFIXEDTEXT11 := 133 
STATIC DEFINE JRNC4_VALSUC := 165 
#endregion

class JRNC4 inherit DATADIALOG 

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
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
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
	protect oDCGroupBox6 as GROUPBOX
	protect oDCFixedText31 as FIXEDTEXT
	protect oDCFixedText32 as FIXEDTEXT
	protect oDCFixedText35 as FIXEDTEXT
	protect oDCQTDSUC as RIGHTSLE
	protect oDCPECSUC as RIGHTSLE
	protect oDCVALSUC as RIGHTSLE
	protect oCCCalc as PUSHBUTTON
	protect oCCPegPreco as PUSHBUTTON
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
// 	instance REHVL 
// 	instance REHTH 
// 	instance REHDF 
// 	instance REHDI 
// 	instance REHHF 
// 	instance REHHI 
// 	instance QTDSUC 
// 	instance PECSUC 
// 	instance VALSUC 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Calc( ) 
SELF:SERVER:FIELDPUT("VALSUC",SELF:SERVER:FIELDGET("QTDSUC")*SELF:SERVER:FIELDGET("PECSUC"))	

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRNC4",_GetInst()},iCtlID)

oDCSELHI := rightSle{self,ResourceID{JRNC4_SELHI,_GetInst()}}
oDCSELHI:FieldSpec := PADRAO_NUM_05_2{}
oDCSELHI:HyperLabel := HyperLabel{#SELHI,"Selhi:",NULL_STRING,"RNC_SELHI"}

oDCSELDI := DateSle{self,ResourceID{JRNC4_SELDI,_GetInst()}}
oDCSELDI:FieldSpec := DATE_FIELD{}
oDCSELDI:HyperLabel := HyperLabel{#SELDI,"Seldi:",NULL_STRING,"RNC_SELDI"}

oDCSELHF := rightSle{self,ResourceID{JRNC4_SELHF,_GetInst()}}
oDCSELHF:FieldSpec := PADRAO_NUM_05_2{}
oDCSELHF:HyperLabel := HyperLabel{#SELHF,"Selhf:",NULL_STRING,"RNC_SELHF"}

oDCSELDF := DateSle{self,ResourceID{JRNC4_SELDF,_GetInst()}}
oDCSELDF:FieldSpec := DATE_FIELD{}
oDCSELDF:HyperLabel := HyperLabel{#SELDF,"Seldf:",NULL_STRING,"RNC_SELDF"}

oDCSELTH := rightSle{self,ResourceID{JRNC4_SELTH,_GetInst()}}
oDCSELTH:FieldSpec := PADRAO_NUM_12_2{}
oDCSELTH:HyperLabel := HyperLabel{#SELTH,"Selth:",NULL_STRING,"RNC_SELTH"}

oDCSELVL := rightSle{self,ResourceID{JRNC4_SELVL,_GetInst()}}
oDCSELVL:FieldSpec := PADRAO_NUM_12_2{}
oDCSELVL:HyperLabel := HyperLabel{#SELVL,"Selvl:",NULL_STRING,"RNC_SELVL"}

oDCRETHI := rightSle{self,ResourceID{JRNC4_RETHI,_GetInst()}}
oDCRETHI:FieldSpec := PADRAO_NUM_05_2{}
oDCRETHI:HyperLabel := HyperLabel{#RETHI,"Rethi:",NULL_STRING,"RNC_RETHI"}

oDCRETDI := DateSle{self,ResourceID{JRNC4_RETDI,_GetInst()}}
oDCRETDI:FieldSpec := DATE_FIELD{}
oDCRETDI:HyperLabel := HyperLabel{#RETDI,"Retdi:",NULL_STRING,"RNC_RETDI"}

oDCRETHF := rightSle{self,ResourceID{JRNC4_RETHF,_GetInst()}}
oDCRETHF:FieldSpec := PADRAO_NUM_05_2{}
oDCRETHF:HyperLabel := HyperLabel{#RETHF,"Rethf:",NULL_STRING,"RNC_RETHF"}

oDCRETDF := DateSle{self,ResourceID{JRNC4_RETDF,_GetInst()}}
oDCRETDF:FieldSpec := DATE_FIELD{}
oDCRETDF:HyperLabel := HyperLabel{#RETDF,"Retdf:",NULL_STRING,"RNC_RETDF"}

oDCRETTH := rightSle{self,ResourceID{JRNC4_RETTH,_GetInst()}}
oDCRETTH:FieldSpec := PADRAO_NUM_12_2{}
oDCRETTH:HyperLabel := HyperLabel{#RETTH,"Retth:",NULL_STRING,"RNC_RETTH"}

oDCRETVL := rightSle{self,ResourceID{JRNC4_RETVL,_GetInst()}}
oDCRETVL:FieldSpec := PADRAO_NUM_12_2{}
oDCRETVL:HyperLabel := HyperLabel{#RETVL,"Retvl:",NULL_STRING,"RNC_RETVL"}

oDCREIHI := rightSle{self,ResourceID{JRNC4_REIHI,_GetInst()}}
oDCREIHI:FieldSpec := PADRAO_NUM_05_2{}
oDCREIHI:HyperLabel := HyperLabel{#REIHI,"Reihi:",NULL_STRING,"RNC_REIHI"}

oDCREIDI := DateSle{self,ResourceID{JRNC4_REIDI,_GetInst()}}
oDCREIDI:FieldSpec := DATE_FIELD{}
oDCREIDI:HyperLabel := HyperLabel{#REIDI,"Reidi:",NULL_STRING,"RNC_REIDI"}

oDCREIHF := rightSle{self,ResourceID{JRNC4_REIHF,_GetInst()}}
oDCREIHF:FieldSpec := PADRAO_NUM_05_2{}
oDCREIHF:HyperLabel := HyperLabel{#REIHF,"Reihf:",NULL_STRING,"RNC_REIHF"}

oDCREIDF := DateSle{self,ResourceID{JRNC4_REIDF,_GetInst()}}
oDCREIDF:FieldSpec := DATE_FIELD{}
oDCREIDF:HyperLabel := HyperLabel{#REIDF,"Reidf:",NULL_STRING,"RNC_REIDF"}

oDCREITH := rightSle{self,ResourceID{JRNC4_REITH,_GetInst()}}
oDCREITH:FieldSpec := PADRAO_NUM_12_2{}
oDCREITH:HyperLabel := HyperLabel{#REITH,"Reith:",NULL_STRING,"RNC_REITH"}

oDCREIVL := rightSle{self,ResourceID{JRNC4_REIVL,_GetInst()}}
oDCREIVL:FieldSpec := PADRAO_NUM_12_2{}
oDCREIVL:HyperLabel := HyperLabel{#REIVL,"Reivl:",NULL_STRING,"RNC_REIVL"}

oDCREIQT := rightSle{self,ResourceID{JRNC4_REIQT,_GetInst()}}
oDCREIQT:FieldSpec := PADRAO_NUM_08{}
oDCREIQT:HyperLabel := HyperLabel{#REIQT,"Reiqt:",NULL_STRING,"RNC_REIQT"}

oDCMATCOD := SingleLineEdit{self,ResourceID{JRNC4_MATCOD,_GetInst()}}
oDCMATCOD:FieldSpec := PADRAO_CHAR_20{}
oDCMATCOD:HyperLabel := HyperLabel{#MATCOD,"Matcod:",NULL_STRING,"RNC_MATCOD"}

oDCMATNOM := SingleLineEdit{self,ResourceID{JRNC4_MATNOM,_GetInst()}}
oDCMATNOM:FieldSpec := PADRAO_CHAR_40{}
oDCMATNOM:HyperLabel := HyperLabel{#MATNOM,"Matnom:",NULL_STRING,"RNC_MATNOM"}

oDCSC_REIQT := FixedText{self,ResourceID{JRNC4_SC_REIQT,_GetInst()}}
oDCSC_REIQT:HyperLabel := HyperLabel{#SC_REIQT,"QTdde",NULL_STRING,NULL_STRING}

oDCGroupBox1 := GroupBox{self,ResourceID{JRNC4_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Seleção",NULL_STRING,NULL_STRING}

oDCFixedText25 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT25,_GetInst()}}
oDCFixedText25:HyperLabel := HyperLabel{#FixedText25,"Valor",NULL_STRING,NULL_STRING}

oDCFixedText26 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT26,_GetInst()}}
oDCFixedText26:HyperLabel := HyperLabel{#FixedText26,"Total Horas",NULL_STRING,NULL_STRING}

oDCFixedText27 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT27,_GetInst()}}
oDCFixedText27:HyperLabel := HyperLabel{#FixedText27,"Valor",NULL_STRING,NULL_STRING}

oDCFixedText28 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT28,_GetInst()}}
oDCFixedText28:HyperLabel := HyperLabel{#FixedText28,"Total Horas",NULL_STRING,NULL_STRING}

oDCGroupBox2 := GroupBox{self,ResourceID{JRNC4_GROUPBOX2,_GetInst()}}
oDCGroupBox2:HyperLabel := HyperLabel{#GroupBox2,"Retrabalho Maquina",NULL_STRING,NULL_STRING}

oDCFixedText33 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT33,_GetInst()}}
oDCFixedText33:HyperLabel := HyperLabel{#FixedText33,"Valor",NULL_STRING,NULL_STRING}

oDCFixedText34 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT34,_GetInst()}}
oDCFixedText34:HyperLabel := HyperLabel{#FixedText34,"Total Horas",NULL_STRING,NULL_STRING}

oDCFixedText37 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT37,_GetInst()}}
oDCFixedText37:HyperLabel := HyperLabel{#FixedText37,"Final",NULL_STRING,NULL_STRING}

oDCFixedText38 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT38,_GetInst()}}
oDCFixedText38:HyperLabel := HyperLabel{#FixedText38,"Hora",NULL_STRING,NULL_STRING}

oDCGroupBox3 := GroupBox{self,ResourceID{JRNC4_GROUPBOX3,_GetInst()}}
oDCGroupBox3:HyperLabel := HyperLabel{#GroupBox3,"Reinspeção",NULL_STRING,NULL_STRING}

oDCtheFixedText11 := FixedText{self,ResourceID{JRNC4_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JRNC4_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}

oDCFixedText39 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT39,_GetInst()}}
oDCFixedText39:HyperLabel := HyperLabel{#FixedText39,"Inicial",NULL_STRING,NULL_STRING}

oDCFixedText40 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT40,_GetInst()}}
oDCFixedText40:HyperLabel := HyperLabel{#FixedText40,"Data",NULL_STRING,NULL_STRING}

oDCFixedText41 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT41,_GetInst()}}
oDCFixedText41:HyperLabel := HyperLabel{#FixedText41,"Hora",NULL_STRING,NULL_STRING}

oDCFixedText42 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT42,_GetInst()}}
oDCFixedText42:HyperLabel := HyperLabel{#FixedText42,"Data",NULL_STRING,NULL_STRING}

oDCFixedText43 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT43,_GetInst()}}
oDCFixedText43:HyperLabel := HyperLabel{#FixedText43,"Final",NULL_STRING,NULL_STRING}

oDCFixedText44 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT44,_GetInst()}}
oDCFixedText44:HyperLabel := HyperLabel{#FixedText44,"Inicial",NULL_STRING,NULL_STRING}

oDCFixedText45 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT45,_GetInst()}}
oDCFixedText45:HyperLabel := HyperLabel{#FixedText45,"Final",NULL_STRING,NULL_STRING}

oDCFixedText46 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT46,_GetInst()}}
oDCFixedText46:HyperLabel := HyperLabel{#FixedText46,"Inicial",NULL_STRING,NULL_STRING}

oDCFixedText47 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT47,_GetInst()}}
oDCFixedText47:HyperLabel := HyperLabel{#FixedText47,"Data",NULL_STRING,NULL_STRING}

oDCFixedText48 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT48,_GetInst()}}
oDCFixedText48:HyperLabel := HyperLabel{#FixedText48,"Hora",NULL_STRING,NULL_STRING}

oDCGroupBox4 := GroupBox{self,ResourceID{JRNC4_GROUPBOX4,_GetInst()}}
oDCGroupBox4:HyperLabel := HyperLabel{#GroupBox4,"Material",NULL_STRING,NULL_STRING}

oDCGroupBox5 := GroupBox{self,ResourceID{JRNC4_GROUPBOX5,_GetInst()}}
oDCGroupBox5:HyperLabel := HyperLabel{#GroupBox5,"Retrabalho Operador",NULL_STRING,NULL_STRING}

oDCREHVL := rightSle{self,ResourceID{JRNC4_REHVL,_GetInst()}}
oDCREHVL:FieldSpec := PADRAO_NUM_12_2{}
oDCREHVL:HyperLabel := HyperLabel{#REHVL,"Retvl:",NULL_STRING,"RNC_RETVL"}

oDCREHTH := rightSle{self,ResourceID{JRNC4_REHTH,_GetInst()}}
oDCREHTH:FieldSpec := PADRAO_NUM_12_2{}
oDCREHTH:HyperLabel := HyperLabel{#REHTH,"Retth:",NULL_STRING,"RNC_RETTH"}

oDCFixedText29 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT29,_GetInst()}}
oDCFixedText29:HyperLabel := HyperLabel{#FixedText29,"Valor",NULL_STRING,NULL_STRING}

oDCFixedText30 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT30,_GetInst()}}
oDCFixedText30:HyperLabel := HyperLabel{#FixedText30,"Total Horas",NULL_STRING,NULL_STRING}

oDCREHDF := DateSle{self,ResourceID{JRNC4_REHDF,_GetInst()}}
oDCREHDF:FieldSpec := DATE_FIELD{}
oDCREHDF:HyperLabel := HyperLabel{#REHDF,"Retdf:",NULL_STRING,"RNC_RETDF"}

oDCREHDI := DateSle{self,ResourceID{JRNC4_REHDI,_GetInst()}}
oDCREHDI:FieldSpec := DATE_FIELD{}
oDCREHDI:HyperLabel := HyperLabel{#REHDI,"Retdi:",NULL_STRING,"RNC_RETDI"}

oDCREHHF := rightSle{self,ResourceID{JRNC4_REHHF,_GetInst()}}
oDCREHHF:FieldSpec := PADRAO_NUM_05_2{}
oDCREHHF:HyperLabel := HyperLabel{#REHHF,"Rethf:",NULL_STRING,"RNC_RETHF"}

oDCFixedText49 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT49,_GetInst()}}
oDCFixedText49:HyperLabel := HyperLabel{#FixedText49,"Data",NULL_STRING,NULL_STRING}

oDCREHHI := rightSle{self,ResourceID{JRNC4_REHHI,_GetInst()}}
oDCREHHI:FieldSpec := PADRAO_NUM_05_2{}
oDCREHHI:HyperLabel := HyperLabel{#REHHI,"Rethi:",NULL_STRING,"RNC_RETHI"}

oDCFixedText50 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT50,_GetInst()}}
oDCFixedText50:HyperLabel := HyperLabel{#FixedText50,"Hora",NULL_STRING,NULL_STRING}

oDCFixedText51 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT51,_GetInst()}}
oDCFixedText51:HyperLabel := HyperLabel{#FixedText51,"Inicial",NULL_STRING,NULL_STRING}

oDCFixedText52 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT52,_GetInst()}}
oDCFixedText52:HyperLabel := HyperLabel{#FixedText52,"Final",NULL_STRING,NULL_STRING}

oDCGroupBox6 := GroupBox{self,ResourceID{JRNC4_GROUPBOX6,_GetInst()}}
oDCGroupBox6:HyperLabel := HyperLabel{#GroupBox6,"Sucata",NULL_STRING,NULL_STRING}

oDCFixedText31 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT31,_GetInst()}}
oDCFixedText31:HyperLabel := HyperLabel{#FixedText31,"Preço",NULL_STRING,NULL_STRING}

oDCFixedText32 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT32,_GetInst()}}
oDCFixedText32:HyperLabel := HyperLabel{#FixedText32,"Total",NULL_STRING,NULL_STRING}

oDCFixedText35 := FixedText{self,ResourceID{JRNC4_FIXEDTEXT35,_GetInst()}}
oDCFixedText35:HyperLabel := HyperLabel{#FixedText35,"Qtde",NULL_STRING,NULL_STRING}

oDCQTDSUC := rightSle{self,ResourceID{JRNC4_QTDSUC,_GetInst()}}
oDCQTDSUC:FieldSpec := PADRAO_NUM_08{}
oDCQTDSUC:HyperLabel := HyperLabel{#QTDSUC,"Retvl:",NULL_STRING,"RNC_RETVL"}

oDCPECSUC := rightSle{self,ResourceID{JRNC4_PECSUC,_GetInst()}}
oDCPECSUC:FieldSpec := PADRAO_NUM_10_4{}
oDCPECSUC:HyperLabel := HyperLabel{#PECSUC,"Retvl:",NULL_STRING,"RNC_RETVL"}

oDCVALSUC := rightSle{self,ResourceID{JRNC4_VALSUC,_GetInst()}}
oDCVALSUC:FieldSpec := PADRAO_NUM_12_2{}
oDCVALSUC:HyperLabel := HyperLabel{#VALSUC,"Retvl:",NULL_STRING,"RNC_RETVL"}

oCCCalc := PushButton{self,ResourceID{JRNC4_CALC,_GetInst()}}
oCCCalc:HyperLabel := HyperLabel{#Calc,"Calcular",NULL_STRING,NULL_STRING}

oCCPegPreco := PushButton{self,ResourceID{JRNC4_PEGPRECO,_GetInst()}}
oCCPegPreco:HyperLabel := HyperLabel{#PegPreco,"Preço",NULL_STRING,NULL_STRING}

self:Caption := "Custo RNC"
self:HyperLabel := HyperLabel{#JRNC4,"Custo RNC",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

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


METHOD OK( ) 
	SELF:EndWindow()

access PECSUC() 
return self:FieldGet(#PECSUC)


assign PECSUC(uValue) 
self:FieldPut(#PECSUC, uValue)
return PECSUC := uValue


METHOD PegPreco( ) 
LOCAL aPRC AS ARRAY
LOCAL oBUSCA AS XBUSCA
aPRC:=MS02PRC(SELF:SERVER:FIELDGET("CODIGO"),SELF:SERVER:FIELDGET("CLIFOR"),.T.,.T.,ZCURINI,ZCURDIR,aDIR)	
IF aPRC[1]>0
   SELF:SERVER:FIELDPUT("PECSUC",aPRC[1])
ELSE
   IF MDG("Digitar Nº Cliente")
   	 oBUSCA:=xBUSCA{SELF,"Informar Nº","Digite Nº "}
     oBUSCA:lMES:=.T.
     oBUSCA:SHOW()
     IF oBUSCA:lOK
		aPRC:=MS02PRC(SELF:SERVER:FIELDGET("CODIGO"),SELF:SERVER:FIELDGET("CLIFOR"),.T.,.T.,ZCURINI,ZCURDIR,aDIR)	
		IF aPRC[1]>0
		   SELF:SERVER:FIELDPUT("PECSUC",aPRC[1])
		ENDIF
     ENDIF
   ENDIF
ENDIF	

METHOD PostInit() 
   SELF:RegisterTimer(60,FALSE)
 RETURN SELF

access QTDSUC() 
return self:FieldGet(#QTDSUC)


assign QTDSUC(uValue) 
self:FieldPut(#QTDSUC, uValue)
return QTDSUC := uValue


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


access RETTH() 
return self:FieldGet(#RETTH)


assign RETTH(uValue) 
self:FieldPut(#RETTH, uValue)
return RETTH := uValue


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


METHOD Timer() 
   SELF:SERVER:COMMIT()


access VALSUC() 
return self:FieldGet(#VALSUC)


assign VALSUC(uValue) 
self:FieldPut(#VALSUC, uValue)
return VALSUC := uValue


END CLASS
