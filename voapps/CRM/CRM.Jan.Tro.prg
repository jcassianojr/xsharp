#region DEFINES
STATIC DEFINE JCRMTR_INCLUIR := 105 
STATIC DEFINE JCRMTR_NRNOTA := 102 
STATIC DEFINE JCRMTR_NRNOTB := 103 
STATIC DEFINE JCRMTR_SC_NRNOTA := 100 
STATIC DEFINE JCRMTR_SC_NRNOTB := 101 
STATIC DEFINE JCRMTR_THEFIXEDTEXT10 := 104 
#endregion

PARTIAL class jcrmtr inherit DATADIALOG 

	protect oDCSC_NRNOTA as FIXEDTEXT
	protect oDCSC_NRNOTB as FIXEDTEXT
	protect oDCNRNOTA as RIGHTSLE
	protect oDCNRNOTB as RIGHTSLE
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCINCLUIR as PUSHBUTTON
// 	instance NRNOTA 
// 	instance NRNOTB 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcrmtr",_GetInst()},iCtlID)

oDCSC_NRNOTA := FixedText{self,ResourceID{JCRMTR_SC_NRNOTA,_GetInst()}}
oDCSC_NRNOTA:HyperLabel := HyperLabel{#SC_NRNOTA,"Nr Nota A:",NULL_STRING,NULL_STRING}

oDCSC_NRNOTB := FixedText{self,ResourceID{JCRMTR_SC_NRNOTB,_GetInst()}}
oDCSC_NRNOTB:HyperLabel := HyperLabel{#SC_NRNOTB,"Nr Nota B:",NULL_STRING,NULL_STRING}

oDCNRNOTA := rightSle{self,ResourceID{JCRMTR_NRNOTA,_GetInst()}}
oDCNRNOTA:FieldSpec := PADRAO_NUM_08{}
oDCNRNOTA:HyperLabel := HyperLabel{#NRNOTA,"Nrnota:",NULL_STRING,"Crm_NRNOTA"}

oDCNRNOTB := rightSle{self,ResourceID{JCRMTR_NRNOTB,_GetInst()}}
oDCNRNOTB:FieldSpec := PADRAO_NUM_08{}
oDCNRNOTB:HyperLabel := HyperLabel{#NRNOTB,"Nrnotb:",NULL_STRING,"Crm_NRNOTB"}

oDCtheFixedText10 := FixedText{self,ResourceID{JCRMTR_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCINCLUIR := PushButton{self,ResourceID{JCRMTR_INCLUIR,_GetInst()}}
oCCINCLUIR:HyperLabel := HyperLabel{#INCLUIR,NULL_STRING,NULL_STRING,NULL_STRING}
oCCINCLUIR:Image := ICO_OK{}

self:Caption := "DataDialog Caption"
self:HyperLabel := HyperLabel{#jcrmtr,"DataDialog Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NRNOTA() 
return self:FieldGet(#NRNOTA)


assign NRNOTA(uValue) 
self:FieldPut(#NRNOTA, uValue)
return NRNOTA := uValue


access NRNOTB() 
return self:FieldGet(#NRNOTB)


assign NRNOTB(uValue) 
self:FieldPut(#NRNOTB, uValue)
return NRNOTB := uValue


END CLASS
