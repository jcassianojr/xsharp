#region DEFINES
STATIC DEFINE JSACDIA_ALTERAR := 105 
STATIC DEFINE JSACDIA_ANTERIOR := 111 
STATIC DEFINE JSACDIA_DATA := 112 
STATIC DEFINE JSACDIA_DATAF := 115 
STATIC DEFINE JSACDIA_JSACI := 106 
STATIC DEFINE JSACDIA_OK := 117 
STATIC DEFINE JSACDIA_PROXIMO := 110 
STATIC DEFINE JSACDIA_RAT := 109 
STATIC DEFINE JSACDIA_RESUL := 114 
STATIC DEFINE JSACDIA_RNC := 108 
STATIC DEFINE JSACDIA_SAC := 107 
STATIC DEFINE JSACDIA_SC_DATA := 102 
STATIC DEFINE JSACDIA_SC_DATA1 := 118 
STATIC DEFINE JSACDIA_SC_SAC := 103 
STATIC DEFINE JSACDIA_SC_SAC2 := 100 
STATIC DEFINE JSACDIA_SC_SAC3 := 101 
STATIC DEFINE JSACDIA_TABSAC := 113 
STATIC DEFINE JSACDIA_TABULAR := 104 
STATIC DEFINE JSACDIA_THEFIXEDTEXT10 := 116 
#endregion

class JSacDia inherit DATADIALOG 

	protect oDCSC_SAC2 as FIXEDTEXT
	protect oDCSC_SAC3 as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_SAC as FIXEDTEXT
	protect oCCTabular as PUSHBUTTON
	protect oCCAlterar as PUSHBUTTON
	protect oDCSAC as SINGLELINEEDIT
	protect oDCRNC as SINGLELINEEDIT
	protect oDCRAT as SINGLELINEEDIT
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oDCDATA as SINGLELINEEDIT
	protect oDCtabsac as TABCONTROL
	protect oTPTABSAC_PAG1 as TABSAC_PAG1
	protect oTPTABSAC_PAGE2 as TABSAC_PAGE2
	protect oTPTABSAC_PAGE3 as TABSAC_PAGE3
	protect oTPTABSAC_PAGE4 as TABSAC_PAGE4
	protect oDCRESUL as SINGLELINEEDIT
	protect oDCDATAF as SINGLELINEEDIT
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
	protect oDCSC_DATA1 as FIXEDTEXT
// 	instance SAC 
// 	instance RNC 
// 	instance RAT 
// 	instance DATA 
// 	instance RESUL 
// 	instance DATAF 
	protect oSFJSACI as JSACI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access DATAF() 
return self:FieldGet(#DATAF)


assign DATAF(uValue) 
self:FieldPut(#DATAF, uValue)
return DATAF := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JSacDia",_GetInst()},iCtlID)

oDCSC_SAC2 := FixedText{self,ResourceID{JSACDIA_SC_SAC2,_GetInst()}}
oDCSC_SAC2:HyperLabel := HyperLabel{#SC_SAC2,"RNC:",NULL_STRING,NULL_STRING}

oDCSC_SAC3 := FixedText{self,ResourceID{JSACDIA_SC_SAC3,_GetInst()}}
oDCSC_SAC3:HyperLabel := HyperLabel{#SC_SAC3,"RAT:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JSACDIA_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_SAC := FixedText{self,ResourceID{JSACDIA_SC_SAC,_GetInst()}}
oDCSC_SAC:HyperLabel := HyperLabel{#SC_SAC,"Sac:",NULL_STRING,NULL_STRING}

oCCTabular := PushButton{self,ResourceID{JSACDIA_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Ver Itens",NULL_STRING,NULL_STRING}

oCCAlterar := PushButton{self,ResourceID{JSACDIA_ALTERAR,_GetInst()}}
oCCAlterar:HyperLabel := HyperLabel{#Alterar,"Alterar Item",NULL_STRING,NULL_STRING}

oDCSAC := SingleLineEdit{self,ResourceID{JSACDIA_SAC,_GetInst()}}
oDCSAC:FieldSpec := PADRAO_NUM_08{}
oDCSAC:HyperLabel := HyperLabel{#SAC,"Sac:",NULL_STRING,"SAC_SAC"}

oDCRNC := SingleLineEdit{self,ResourceID{JSACDIA_RNC,_GetInst()}}
oDCRNC:FieldSpec := PADRAO_NUM_08{}
oDCRNC:HyperLabel := HyperLabel{#RNC,"Sac:",NULL_STRING,"SAC_SAC"}

oDCRAT := SingleLineEdit{self,ResourceID{JSACDIA_RAT,_GetInst()}}
oDCRAT:FieldSpec := PADRAO_NUM_08{}
oDCRAT:HyperLabel := HyperLabel{#RAT,"Sac:",NULL_STRING,"SAC_SAC"}

oCCProximo := PushButton{self,ResourceID{JSACDIA_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,"Próximo",NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_next{}

oCCAnterior := PushButton{self,ResourceID{JSACDIA_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,"Anterior",NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_previous{}

oDCDATA := SingleLineEdit{self,ResourceID{JSACDIA_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Sac:",NULL_STRING,"SAC_SAC"}

oDCtabsac := TabControl{self,ResourceID{JSACDIA_TABSAC,_GetInst()}}
oDCtabsac:HyperLabel := HyperLabel{#tabsac,NULL_STRING,NULL_STRING,NULL_STRING}

oDCRESUL := SingleLineEdit{self,ResourceID{JSACDIA_RESUL,_GetInst()}}
oDCRESUL:FieldSpec := PADRAO_CHAR_01{}
oDCRESUL:HyperLabel := HyperLabel{#RESUL,"Sac:",NULL_STRING,"SAC_SAC"}

oDCDATAF := SingleLineEdit{self,ResourceID{JSACDIA_DATAF,_GetInst()}}
oDCDATAF:FieldSpec := DATE_FIELD{}
oDCDATAF:HyperLabel := HyperLabel{#DATAF,"Sac:",NULL_STRING,"SAC_SAC"}

oDCtheFixedText10 := FixedText{self,ResourceID{JSACDIA_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JSACDIA_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}

oDCSC_DATA1 := FixedText{self,ResourceID{JSACDIA_SC_DATA1,_GetInst()}}
oDCSC_DATA1:HyperLabel := HyperLabel{#SC_DATA1,"Fechamento",NULL_STRING,NULL_STRING}

self:Caption := "SAC"
self:HyperLabel := HyperLabel{#JSacDia,"SAC",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

oSFJSACI := JSACI{self,JSACDIA_JSACI}
oSFJSACI:show()
oTPTABSAC_PAG1 := TABSAC_PAG1{self, 0}
oDCtabsac:AppendTab(#TABSAC_PAG1,"01",oTPTABSAC_PAG1,0)
oTPTABSAC_PAGE2 := TABSAC_PAGE2{self, 0}
oDCtabsac:AppendTab(#TABSAC_PAGE2,"02",oTPTABSAC_PAGE2,0)
oTPTABSAC_PAGE3 := TABSAC_PAGE3{self, 0}
oDCtabsac:AppendTab(#TABSAC_PAGE3,"03",oTPTABSAC_PAGE3,0)
oTPTABSAC_PAGE4 := TABSAC_PAGE4{self, 0}
oDCtabsac:AppendTab(#TABSAC_PAGE4,"04",oTPTABSAC_PAGE4,0)
oDCtabsac:SelectTab(#TABSAC_PAG1)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD OK( ) 
	SELF:EndWindow()

access RAT() 
return self:FieldGet(#RAT)


assign RAT(uValue) 
self:FieldPut(#RAT, uValue)
return RAT := uValue


access RESUL() 
return self:FieldGet(#RESUL)


assign RESUL(uValue) 
self:FieldPut(#RESUL, uValue)
return RESUL := uValue


access RNC() 
return self:FieldGet(#RNC)


assign RNC(uValue) 
self:FieldPut(#RNC, uValue)
return RNC := uValue


access SAC() 
return self:FieldGet(#SAC)


assign SAC(uValue) 
self:FieldPut(#SAC, uValue)
return SAC := uValue


END CLASS
CLASS XJSACDIA INHERIT JSACDIA

CONSTRUCTOR(oOWNER,oSER,oSE2,cCODIGO) 
SUPER(oOWNER,,oSER)
SELF:oSFJSACI:USE(oSE2)
SELF:SetSelectiveRelation(oSFJSACI,"SAC")
	
	
	


END CLASS
