#region DEFINES
STATIC DEFINE JRNCRF_CANCELAR := 123 
STATIC DEFINE JRNCRF_DATAR := 100 
STATIC DEFINE JRNCRF_FIXEDTEXT33 := 110 
STATIC DEFINE JRNCRF_FIXEDTEXT34 := 111 
STATIC DEFINE JRNCRF_FIXEDTEXT35 := 114 
STATIC DEFINE JRNCRF_FIXEDTEXT36 := 115 
STATIC DEFINE JRNCRF_FIXEDTEXT37 := 118 
STATIC DEFINE JRNCRF_FIXEDTEXT38 := 119 
STATIC DEFINE JRNCRF_FT20 := 103 
STATIC DEFINE JRNCRF_GROUPBOX3 := 120 
STATIC DEFINE JRNCRF_LAUDO := 121 
STATIC DEFINE JRNCRF_OK := 125 
STATIC DEFINE JRNCRF_RB12 := 105 
STATIC DEFINE JRNCRF_RB13 := 104 
STATIC DEFINE JRNCRF_REFDOC := 102 
STATIC DEFINE JRNCRF_REIDF := 112 
STATIC DEFINE JRNCRF_REIDI := 113 
STATIC DEFINE JRNCRF_REIHF := 116 
STATIC DEFINE JRNCRF_REIHI := 117 
STATIC DEFINE JRNCRF_REIQT := 106 
STATIC DEFINE JRNCRF_REITH := 109 
STATIC DEFINE JRNCRF_REIVL := 108 
STATIC DEFINE JRNCRF_SC_DATAR := 101 
STATIC DEFINE JRNCRF_SC_REIQT := 107 
STATIC DEFINE JRNCRF_THEFIXEDTEXT11 := 124 
STATIC DEFINE JRNCRF_THEFIXEDTEXT9 := 122 
#endregion

class JRNCRF inherit DATADIALOG 

	protect oDCDATAR as DATETIMEPICKER
	protect oDCSC_DATAR as FIXEDTEXT
	protect oDCREFDOC as SINGLELINEEDIT
	protect oDCFT20 as FIXEDTEXT
	protect oCCRB13 as RADIOBUTTON
	protect oCCRB12 as RADIOBUTTON
	protect oDCREIQT as RIGHTSLE
	protect oDCSC_REIQT as FIXEDTEXT
	protect oDCREIVL as RIGHTSLE
	protect oDCREITH as RIGHTSLE
	protect oDCFixedText33 as FIXEDTEXT
	protect oDCFixedText34 as FIXEDTEXT
	protect oDCREIDF as DATESLE
	protect oDCREIDI as DATESLE
	protect oDCFixedText35 as FIXEDTEXT
	protect oDCFixedText36 as FIXEDTEXT
	protect oDCREIHF as RIGHTSLE
	protect oDCREIHI as RIGHTSLE
	protect oDCFixedText37 as FIXEDTEXT
	protect oDCFixedText38 as FIXEDTEXT
	protect oDCGroupBox3 as GROUPBOX
	protect oDCLAUDO as RADIOBUTTONGROUP
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCcancelar as PUSHBUTTON
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
// 	instance REFDOC 
// 	instance REIQT 
// 	instance REIVL 
// 	instance REITH 
// 	instance REIDF 
// 	instance REIDI 
// 	instance REIHF 
// 	instance REIHI 
// 	instance LAUDO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD cancelar( ) 
	SELF:endwindow()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRNCRF",_GetInst()},iCtlID)

oDCDATAR := DateTimePicker{self,ResourceID{JRNCRF_DATAR,_GetInst()}}
oDCDATAR:FieldSpec := DATE_FIELD{}
oDCDATAR:HyperLabel := HyperLabel{#DATAR,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_DATAR := FixedText{self,ResourceID{JRNCRF_SC_DATAR,_GetInst()}}
oDCSC_DATAR:HyperLabel := HyperLabel{#SC_DATAR,"Data:",NULL_STRING,NULL_STRING}

oDCREFDOC := SingleLineEdit{self,ResourceID{JRNCRF_REFDOC,_GetInst()}}
oDCREFDOC:FieldSpec := PADRAO_CHAR_15{}
oDCREFDOC:HyperLabel := HyperLabel{#REFDOC,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFT20 := FixedText{self,ResourceID{JRNCRF_FT20,_GetInst()}}
oDCFT20:HyperLabel := HyperLabel{#FT20,"Referente ao Documento",NULL_STRING,NULL_STRING}

oCCRB13 := RadioButton{self,ResourceID{JRNCRF_RB13,_GetInst()}}
oCCRB13:HyperLabel := HyperLabel{#RB13,"Insatisfatório",NULL_STRING,NULL_STRING}

oCCRB12 := RadioButton{self,ResourceID{JRNCRF_RB12,_GetInst()}}
oCCRB12:HyperLabel := HyperLabel{#RB12,"Satisfatório",NULL_STRING,NULL_STRING}

oDCREIQT := rightSle{self,ResourceID{JRNCRF_REIQT,_GetInst()}}
oDCREIQT:FieldSpec := PADRAO_NUM_08{}
oDCREIQT:HyperLabel := HyperLabel{#REIQT,"Reiqt:",NULL_STRING,"RNC_REIQT"}

oDCSC_REIQT := FixedText{self,ResourceID{JRNCRF_SC_REIQT,_GetInst()}}
oDCSC_REIQT:HyperLabel := HyperLabel{#SC_REIQT,"Quantidade",NULL_STRING,NULL_STRING}

oDCREIVL := rightSle{self,ResourceID{JRNCRF_REIVL,_GetInst()}}
oDCREIVL:FieldSpec := PADRAO_NUm_12_2{}
oDCREIVL:HyperLabel := HyperLabel{#REIVL,"Reivl:",NULL_STRING,"RNC_REIVL"}

oDCREITH := rightSle{self,ResourceID{JRNCRF_REITH,_GetInst()}}
oDCREITH:FieldSpec := PADRAO_NUm_12_2{}
oDCREITH:HyperLabel := HyperLabel{#REITH,"Reith:",NULL_STRING,"RNC_REITH"}

oDCFixedText33 := FixedText{self,ResourceID{JRNCRF_FIXEDTEXT33,_GetInst()}}
oDCFixedText33:HyperLabel := HyperLabel{#FixedText33,"Valor",NULL_STRING,NULL_STRING}

oDCFixedText34 := FixedText{self,ResourceID{JRNCRF_FIXEDTEXT34,_GetInst()}}
oDCFixedText34:HyperLabel := HyperLabel{#FixedText34,"Total Horas",NULL_STRING,NULL_STRING}

oDCREIDF := DateSle{self,ResourceID{JRNCRF_REIDF,_GetInst()}}
oDCREIDF:FieldSpec := DATE_FIELD{}
oDCREIDF:HyperLabel := HyperLabel{#REIDF,"Reidf:",NULL_STRING,"RNC_REIDF"}

oDCREIDI := DateSle{self,ResourceID{JRNCRF_REIDI,_GetInst()}}
oDCREIDI:FieldSpec := DATE_FIELD{}
oDCREIDI:HyperLabel := HyperLabel{#REIDI,"Reidi:",NULL_STRING,"RNC_REIDI"}

oDCFixedText35 := FixedText{self,ResourceID{JRNCRF_FIXEDTEXT35,_GetInst()}}
oDCFixedText35:HyperLabel := HyperLabel{#FixedText35,"Data Final",NULL_STRING,NULL_STRING}

oDCFixedText36 := FixedText{self,ResourceID{JRNCRF_FIXEDTEXT36,_GetInst()}}
oDCFixedText36:HyperLabel := HyperLabel{#FixedText36,"Data Inicial",NULL_STRING,NULL_STRING}

oDCREIHF := rightSle{self,ResourceID{JRNCRF_REIHF,_GetInst()}}
oDCREIHF:FieldSpec := PADRAO_NUM_05_2{}
oDCREIHF:HyperLabel := HyperLabel{#REIHF,"Reihf:",NULL_STRING,"RNC_REIHF"}

oDCREIHI := rightSle{self,ResourceID{JRNCRF_REIHI,_GetInst()}}
oDCREIHI:FieldSpec := PADRAO_NUM_05_2{}
oDCREIHI:HyperLabel := HyperLabel{#REIHI,"Reihi:",NULL_STRING,"RNC_REIHI"}

oDCFixedText37 := FixedText{self,ResourceID{JRNCRF_FIXEDTEXT37,_GetInst()}}
oDCFixedText37:HyperLabel := HyperLabel{#FixedText37,"Hora Final",NULL_STRING,NULL_STRING}

oDCFixedText38 := FixedText{self,ResourceID{JRNCRF_FIXEDTEXT38,_GetInst()}}
oDCFixedText38:HyperLabel := HyperLabel{#FixedText38,"Hora Inicial",NULL_STRING,NULL_STRING}

oDCGroupBox3 := GroupBox{self,ResourceID{JRNCRF_GROUPBOX3,_GetInst()}}
oDCGroupBox3:HyperLabel := HyperLabel{#GroupBox3,"Reinspeção",NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{JRNCRF_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Cancelar",NULL_STRING,NULL_STRING}

oCCcancelar := PushButton{self,ResourceID{JRNCRF_CANCELAR,_GetInst()}}
oCCcancelar:HyperLabel := HyperLabel{#cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCcancelar:Image := ico_sair{}

oDCtheFixedText11 := FixedText{self,ResourceID{JRNCRF_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JRNCRF_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}

oDCLAUDO := RadioButtonGroup{self,ResourceID{JRNCRF_LAUDO,_GetInst()}}
oDCLAUDO:FillUsing({ ;
						{oCCRB13,"I"}, ;
						{oCCRB12,"S"} ;
						})
oDCLAUDO:HyperLabel := HyperLabel{#LAUDO,"Laudo",NULL_STRING,NULL_STRING}
oDCLAUDO:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "Fechamento RNC Recebimento"
self:HyperLabel := HyperLabel{#JRNCRF,"Fechamento RNC Recebimento",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LAUDO() 
return self:FieldGet(#LAUDO)


assign LAUDO(uValue) 
self:FieldPut(#LAUDO, uValue)
return LAUDO := uValue


METHOD ok( ) 
SELF:SERVER:FIELDPUT("FECUSER",ZUSER)
SELF:SERVER:FIELDPUT("FECDATA",ZDATA)
SELF:SERVER:FIELDPUT("FECHADA",.T.)
SELF:endwindow()	

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   	   FabCenterWindow( SELF )
 RETURN SELF

access REFDOC() 
return self:FieldGet(#REFDOC)


assign REFDOC(uValue) 
self:FieldPut(#REFDOC, uValue)
return REFDOC := uValue


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


METHOD Timer() 
   SELF:SERVER:COMMIT()


END CLASS
