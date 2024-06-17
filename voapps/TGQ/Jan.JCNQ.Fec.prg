#region DEFINES
STATIC DEFINE JCNQFEC_ABERTURA := 107 
STATIC DEFINE JCNQFEC_BRANCO := 108 
STATIC DEFINE JCNQFEC_CANCELAR := 105 
STATIC DEFINE JCNQFEC_DATAFEC := 101 
STATIC DEFINE JCNQFEC_HOJE := 106 
STATIC DEFINE JCNQFEC_OK := 103 
STATIC DEFINE JCNQFEC_SC_DATAFEC := 100 
STATIC DEFINE JCNQFEC_THEFIXEDTEXT10 := 102 
STATIC DEFINE JCNQFEC_THEFIXEDTEXT9 := 104 
#endregion

class JCNQFEC inherit DATADIALOG 

	protect oDCSC_DATAFEC as FIXEDTEXT
	protect oDCDATAFEC as DATESLE
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOk as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oCCHoje as PUSHBUTTON
	protect oCCAbertura as PUSHBUTTON
	protect oCCBranco as PUSHBUTTON
// 	instance DATAFEC 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Abertura( ) 
	SELF:server:FIELDPUT("DATAFEC",SELF:SERVER:FIELDGET("DATA"))	

METHOD Branco( ) 
  SELF:server:FIELDPUT("DATAFEC",CToD(Space(8)))

METHOD Cancelar( ) 
	SELF:server:FIELDPUT("DATAFEC",CToD(Space(8)))
	SELF:endwindow()

access DATAFEC() 
return self:FieldGet(#DATAFEC)


assign DATAFEC(uValue) 
self:FieldPut(#DATAFEC, uValue)
return DATAFEC := uValue


METHOD Hoje( ) 
	SELF:server:FIELDPUT("DATAFEC",Today())

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCNQFEC",_GetInst()},iCtlID)

oDCSC_DATAFEC := FixedText{self,ResourceID{JCNQFEC_SC_DATAFEC,_GetInst()}}
oDCSC_DATAFEC:HyperLabel := HyperLabel{#SC_DATAFEC,"Fechamento",NULL_STRING,NULL_STRING}

oDCDATAFEC := DateSle{self,ResourceID{JCNQFEC_DATAFEC,_GetInst()}}
oDCDATAFEC:FieldSpec := date_field{}
oDCDATAFEC:HyperLabel := HyperLabel{#DATAFEC,"Datafec:",NULL_STRING,"ACPNC_DATAFEC"}

oDCtheFixedText10 := FixedText{self,ResourceID{JCNQFEC_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOk := PushButton{self,ResourceID{JCNQFEC_OK,_GetInst()}}
oCCOk:HyperLabel := HyperLabel{#Ok,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOk:Image := ICO_OK{}

oDCtheFixedText9 := FixedText{self,ResourceID{JCNQFEC_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JCNQFEC_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}

oCCHoje := PushButton{self,ResourceID{JCNQFEC_HOJE,_GetInst()}}
oCCHoje:HyperLabel := HyperLabel{#Hoje,"Hoje",NULL_STRING,NULL_STRING}

oCCAbertura := PushButton{self,ResourceID{JCNQFEC_ABERTURA,_GetInst()}}
oCCAbertura:HyperLabel := HyperLabel{#Abertura,"Abertura",NULL_STRING,NULL_STRING}

oCCBranco := PushButton{self,ResourceID{JCNQFEC_BRANCO,_GetInst()}}
oCCBranco:HyperLabel := HyperLabel{#Branco,"Branco",NULL_STRING,NULL_STRING}

self:Caption := "DataDialog Caption"
self:HyperLabel := HyperLabel{#JCNQFEC,"DataDialog Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD Ok( ) 
	SELF:ENDWINDOW()

END CLASS
