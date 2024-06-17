#region DEFINES
STATIC DEFINE JSACFEC_CANCELAR := 107 
STATIC DEFINE JSACFEC_CANCELARX := 106 
STATIC DEFINE JSACFEC_DATAF := 103 
STATIC DEFINE JSACFEC_OK := 105 
STATIC DEFINE JSACFEC_OKL := 104 
STATIC DEFINE JSACFEC_RADIOBUTTON2 := 101 
STATIC DEFINE JSACFEC_RADIOBUTTON3 := 102 
STATIC DEFINE JSACFEC_RESUL := 100 
#endregion

class jsacfec inherit DATADIALOG 

	protect oDCRESUL as RADIOBUTTONGROUP
	protect oCCRadioButton2 as RADIOBUTTON
	protect oCCRadioButton3 as RADIOBUTTON
	protect oDCDATAF as DATETIMEPICKER
	protect oDCokl as FIXEDTEXT
	protect oCCok as PUSHBUTTON
	protect oDCCancelarx as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
// 	instance RESUL 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Cancelar( ) 
	SELF:endwindow()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jsacfec",_GetInst()},iCtlID)

oCCRadioButton2 := RadioButton{self,ResourceID{JSACFEC_RADIOBUTTON2,_GetInst()}}
oCCRadioButton2:HyperLabel := HyperLabel{#RadioButton2,"Aprovado",NULL_STRING,NULL_STRING}

oCCRadioButton3 := RadioButton{self,ResourceID{JSACFEC_RADIOBUTTON3,_GetInst()}}
oCCRadioButton3:HyperLabel := HyperLabel{#RadioButton3,"Reprovado",NULL_STRING,NULL_STRING}

oDCDATAF := DateTimePicker{self,ResourceID{JSACFEC_DATAF,_GetInst()}}
oDCDATAF:FieldSpec := DATE_FIELD{}
oDCDATAF:HyperLabel := HyperLabel{#DATAF,NULL_STRING,NULL_STRING,NULL_STRING}

oDCokl := FixedText{self,ResourceID{JSACFEC_OKL,_GetInst()}}
oDCokl:HyperLabel := HyperLabel{#okl,"OK",NULL_STRING,NULL_STRING}

oCCok := PushButton{self,ResourceID{JSACFEC_OK,_GetInst()}}
oCCok:HyperLabel := HyperLabel{#ok,NULL_STRING,NULL_STRING,NULL_STRING}
oCCok:Image := ico_ok{}

oDCCancelarx := FixedText{self,ResourceID{JSACFEC_CANCELARX,_GetInst()}}
oDCCancelarx:HyperLabel := HyperLabel{#Cancelarx,"Cancelar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JSACFEC_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}

oDCRESUL := RadioButtonGroup{self,ResourceID{JSACFEC_RESUL,_GetInst()}}
oDCRESUL:FillUsing({ ;
						{oCCRadioButton2,"A"}, ;
						{oCCRadioButton3,"R"} ;
						})
oDCRESUL:HyperLabel := HyperLabel{#RESUL,"Resultado",NULL_STRING,NULL_STRING}
oDCRESUL:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "Fechamento da Sac"
self:HyperLabel := HyperLabel{#jsacfec,"Fechamento da Sac",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD ok( ) 
SELF:SERVER:FIELDPUT("FECNOME",ZNOMEFOLHA)
SELF:endwindow()

access RESUL() 
return self:FieldGet(#RESUL)


assign RESUL(uValue) 
self:FieldPut(#RESUL, uValue)
return RESUL := uValue


END CLASS
