#region DEFINES
STATIC DEFINE JTRI_AVALIA := 112 
STATIC DEFINE JTRI_COMPAR := 103 
STATIC DEFINE JTRI_NOMFUN := 111 
STATIC DEFINE JTRI_NUMFUN := 109 
STATIC DEFINE JTRI_RADIOBUTTON4 := 101 
STATIC DEFINE JTRI_RADIOBUTTON5 := 102 
STATIC DEFINE JTRI_RB1 := 106 
STATIC DEFINE JTRI_RB2 := 107 
STATIC DEFINE JTRI_RB3 := 113 
STATIC DEFINE JTRI_RB4 := 114 
STATIC DEFINE JTRI_SC_NOMFUN := 110 
STATIC DEFINE JTRI_SC_NUMFUN := 105 
STATIC DEFINE JTRI_SC_TREIN := 104 
STATIC DEFINE JTRI_TREIN := 108 
STATIC DEFINE JTRI_TRXCER := 100 
#endregion

class JTRI inherit DATAWINDOW 

	PROTECT oDBTREIN as DataColumn
	PROTECT oDBNUMFUN as DataColumn
	PROTECT oDBNOMFUN as DataColumn
	PROTECT oDBAVALIA as DataColumn
	PROTECT oDBTRXCER as DataColumn
	PROTECT oDBCOMPAR as DataColumn
	protect oDCTRXCER as RADIOBUTTONGROUP
	protect oCCRadioButton4 as RADIOBUTTON
	protect oCCRadioButton5 as RADIOBUTTON
	protect oDCCOMPAR as RADIOBUTTONGROUP
	protect oDCSC_TREIN as FIXEDTEXT
	protect oDCSC_NUMFUN as FIXEDTEXT
	protect oCCRB1 as RADIOBUTTON
	protect oCCRB2 as RADIOBUTTON
	protect oDCTREIN as SINGLELINEEDIT
	protect oDCNUMFUN as SINGLELINEEDIT
	protect oDCSC_NOMFUN as FIXEDTEXT
	protect oDCNOMFUN as SINGLELINEEDIT
	protect oDCAVALIA as RADIOBUTTONGROUP
	protect oCCRB3 as RADIOBUTTON
	protect oCCRB4 as RADIOBUTTON
// 	instance TRXCER 
// 	instance COMPAR 
// 	instance TREIN 
// 	instance NUMFUN 
// 	instance NOMFUN 
// 	instance AVALIA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AVALIA() 
return self:FieldGet(#AVALIA)


assign AVALIA(uValue) 
self:FieldPut(#AVALIA, uValue)
return AVALIA := uValue


access COMPAR() 
return self:FieldGet(#COMPAR)


assign COMPAR(uValue) 
self:FieldPut(#COMPAR, uValue)
return COMPAR := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JTRI",_GetInst()},iCtlID)

oCCRadioButton4 := RadioButton{self,ResourceID{JTRI_RADIOBUTTON4,_GetInst()}}
oCCRadioButton4:HyperLabel := HyperLabel{#RadioButton4,"Sim",NULL_STRING,NULL_STRING}

oCCRadioButton5 := RadioButton{self,ResourceID{JTRI_RADIOBUTTON5,_GetInst()}}
oCCRadioButton5:HyperLabel := HyperLabel{#RadioButton5,"Não",NULL_STRING,NULL_STRING}

oDCSC_TREIN := FixedText{self,ResourceID{JTRI_SC_TREIN,_GetInst()}}
oDCSC_TREIN:HyperLabel := HyperLabel{#SC_TREIN,"Treinamento:",NULL_STRING,NULL_STRING}

oDCSC_NUMFUN := FixedText{self,ResourceID{JTRI_SC_NUMFUN,_GetInst()}}
oDCSC_NUMFUN:HyperLabel := HyperLabel{#SC_NUMFUN,"Número",NULL_STRING,NULL_STRING}

oCCRB1 := RadioButton{self,ResourceID{JTRI_RB1,_GetInst()}}
oCCRB1:HyperLabel := HyperLabel{#RB1,"Sim",NULL_STRING,NULL_STRING}

oCCRB2 := RadioButton{self,ResourceID{JTRI_RB2,_GetInst()}}
oCCRB2:HyperLabel := HyperLabel{#RB2,"Não",NULL_STRING,NULL_STRING}

oDCTREIN := SingleLineEdit{self,ResourceID{JTRI_TREIN,_GetInst()}}
oDCTREIN:FieldSpec := padrao_num_08{}
oDCTREIN:HyperLabel := HyperLabel{#TREIN,"Trein:",NULL_STRING,"TREII_TREIN"}

oDCNUMFUN := SingleLineEdit{self,ResourceID{JTRI_NUMFUN,_GetInst()}}
oDCNUMFUN:FieldSpec := padrao_num_08{}
oDCNUMFUN:HyperLabel := HyperLabel{#NUMFUN,"Número:",NULL_STRING,"TREII_NUMFUN"}

oDCSC_NOMFUN := FixedText{self,ResourceID{JTRI_SC_NOMFUN,_GetInst()}}
oDCSC_NOMFUN:HyperLabel := HyperLabel{#SC_NOMFUN,"Nome:",NULL_STRING,NULL_STRING}

oDCNOMFUN := SingleLineEdit{self,ResourceID{JTRI_NOMFUN,_GetInst()}}
oDCNOMFUN:FieldSpec := padrao_char_40{}
oDCNOMFUN:HyperLabel := HyperLabel{#NOMFUN,"Nome:",NULL_STRING,"TREII_NOMFUN"}

oCCRB3 := RadioButton{self,ResourceID{JTRI_RB3,_GetInst()}}
oCCRB3:HyperLabel := HyperLabel{#RB3,"Satisfatória",NULL_STRING,NULL_STRING}

oCCRB4 := RadioButton{self,ResourceID{JTRI_RB4,_GetInst()}}
oCCRB4:HyperLabel := HyperLabel{#RB4,"Insatisfatória",NULL_STRING,NULL_STRING}

oDCTRXCER := RadioButtonGroup{self,ResourceID{JTRI_TRXCER,_GetInst()}}
oDCTRXCER:FillUsing({ ;
						{oCCRadioButton4,"S"}, ;
						{oCCRadioButton5,"N"} ;
						})
oDCTRXCER:HyperLabel := HyperLabel{#TRXCER,"Cert",NULL_STRING,NULL_STRING}
oDCTRXCER:FieldSpec := padrao_char_01{}

oDCCOMPAR := RadioButtonGroup{self,ResourceID{JTRI_COMPAR,_GetInst()}}
oDCCOMPAR:FillUsing({ ;
						{oCCRB1,"S"}, ;
						{oCCRB2,"N"} ;
						})
oDCCOMPAR:HyperLabel := HyperLabel{#COMPAR,"Presenca",NULL_STRING,NULL_STRING}
oDCCOMPAR:FieldSpec := padrao_char_01{}

oDCAVALIA := RadioButtonGroup{self,ResourceID{JTRI_AVALIA,_GetInst()}}
oDCAVALIA:FillUsing({ ;
						{oCCRB3,"S"}, ;
						{oCCRB4,"I"} ;
						})
oDCAVALIA:HyperLabel := HyperLabel{#AVALIA,"Avalia",NULL_STRING,NULL_STRING}
oDCAVALIA:FieldSpec := padrao_char_01{}

self:Caption := "Itens Treinamento"
self:HyperLabel := HyperLabel{#JTRI,"Itens Treinamento",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTREIN := DataColumn{padrao_num_08{}}
oDBTREIN:Width := 7
oDBTREIN:HyperLabel := oDCTREIN:HyperLabel 
oDBTREIN:Caption := "Trein:"
self:Browser:AddColumn(oDBTREIN)

oDBNUMFUN := DataColumn{padrao_num_08{}}
oDBNUMFUN:Width := 11
oDBNUMFUN:HyperLabel := oDCNUMFUN:HyperLabel 
oDBNUMFUN:Caption := "Número:"
self:Browser:AddColumn(oDBNUMFUN)

oDBNOMFUN := DataColumn{padrao_char_40{}}
oDBNOMFUN:Width := 33
oDBNOMFUN:HyperLabel := oDCNOMFUN:HyperLabel 
oDBNOMFUN:Caption := "Nome:"
self:Browser:AddColumn(oDBNOMFUN)

oDBAVALIA := DataColumn{padrao_char_01{}}
oDBAVALIA:Width := 7
oDBAVALIA:HyperLabel := oDCAVALIA:HyperLabel 
oDBAVALIA:Caption := "Avalia"
self:Browser:AddColumn(oDBAVALIA)

oDBTRXCER := DataColumn{padrao_char_01{}}
oDBTRXCER:Width := 9
oDBTRXCER:HyperLabel := oDCTRXCER:HyperLabel 
oDBTRXCER:Caption := "Cert"
self:Browser:AddColumn(oDBTRXCER)

oDBCOMPAR := DataColumn{padrao_char_01{}}
oDBCOMPAR:Width := 9
oDBCOMPAR:HyperLabel := oDCCOMPAR:HyperLabel 
oDBCOMPAR:Caption := "Presenca"
self:Browser:AddColumn(oDBCOMPAR)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOMFUN() 
return self:FieldGet(#NOMFUN)


assign NOMFUN(uValue) 
self:FieldPut(#NOMFUN, uValue)
return NOMFUN := uValue


access NUMFUN() 
return self:FieldGet(#NUMFUN)


assign NUMFUN(uValue) 
self:FieldPut(#NUMFUN, uValue)
return NUMFUN := uValue


access TREIN() 
return self:FieldGet(#TREIN)


assign TREIN(uValue) 
self:FieldPut(#TREIN, uValue)
return TREIN := uValue


access TRXCER() 
return self:FieldGet(#TRXCER)


assign TRXCER(uValue) 
self:FieldPut(#TRXCER, uValue)
return TRXCER := uValue


END CLASS
