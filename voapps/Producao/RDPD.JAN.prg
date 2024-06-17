#region DEFINES
STATIC DEFINE JRDPD_HP := 107 
STATIC DEFINE JRDPD_NOME := 106 
STATIC DEFINE JRDPD_NUMERO := 105 
STATIC DEFINE JRDPD_SC_HP := 103 
STATIC DEFINE JRDPD_SC_NOME := 102 
STATIC DEFINE JRDPD_SC_NUMERO := 101 
STATIC DEFINE JRDPD_SC_SEQ := 100 
STATIC DEFINE JRDPD_SEQ := 104 
#endregion

class JRDPD inherit DATAWINDOW 

	PROTECT oDBSEQ as DataColumn
	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBHP as DataColumn
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_HP as FIXEDTEXT
	protect oDCSEQ as SINGLELINEEDIT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCHP as SINGLELINEEDIT
// 	instance SEQ 
// 	instance NUMERO 
// 	instance NOME 
// 	instance HP 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access HP() 
return self:FieldGet(#HP)


assign HP(uValue) 
self:FieldPut(#HP, uValue)
return HP := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRDPD",_GetInst()},iCtlID)

oDCSC_SEQ := FixedText{self,ResourceID{JRDPD_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JRDPD_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JRDPD_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_HP := FixedText{self,ResourceID{JRDPD_SC_HP,_GetInst()}}
oDCSC_HP:HyperLabel := HyperLabel{#SC_HP,"Hp:",NULL_STRING,NULL_STRING}

oDCSEQ := SingleLineEdit{self,ResourceID{JRDPD_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := padrao_num_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"RDPD_SEQ"}

oDCNUMERO := SingleLineEdit{self,ResourceID{JRDPD_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_char_02{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"RDPD_NUMERO"}

oDCNOME := SingleLineEdit{self,ResourceID{JRDPD_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"RDPD_NOME"}

oDCHP := SingleLineEdit{self,ResourceID{JRDPD_HP,_GetInst()}}
oDCHP:FieldSpec := padrao_num_10_2{}
oDCHP:HyperLabel := HyperLabel{#HP,"Hp:",NULL_STRING,"RDPD_HP"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JRDPD,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBSEQ := DataColumn{padrao_num_03{}}
oDBSEQ:Width := 7
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
self:Browser:AddColumn(oDBSEQ)

oDBNUMERO := DataColumn{padrao_char_02{}}
oDBNUMERO:Width := 11
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBNOME := DataColumn{padrao_char_40{}}
oDBNOME:Width := 21
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBHP := DataColumn{padrao_num_10_2{}}
oDBHP:Width := 22
oDBHP:HyperLabel := oDCHP:HyperLabel 
oDBHP:Caption := "Hp:"
self:Browser:AddColumn(oDBHP)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


END CLASS
