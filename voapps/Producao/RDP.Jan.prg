#region DEFINES
STATIC DEFINE JRDP_HP := 105 
STATIC DEFINE JRDP_NOME := 107 
STATIC DEFINE JRDP_NUMERO := 100 
STATIC DEFINE JRDP_SC_HP := 104 
STATIC DEFINE JRDP_SC_NOME := 106 
STATIC DEFINE JRDP_SC_NUMERO := 103 
STATIC DEFINE JRDP_SC_SEQ := 101 
STATIC DEFINE JRDP_SEQ := 102 
#endregion

class JRDP inherit DATAWINDOW 

	PROTECT oDBSEQ as DataColumn
	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBHP as DataColumn
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSEQ as SINGLELINEEDIT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_HP as FIXEDTEXT
	protect oDCHP as SINGLELINEEDIT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCNOME as SINGLELINEEDIT
// 	instance NUMERO 
// 	instance SEQ 
// 	instance HP 
// 	instance NOME 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access HP() 
return self:FieldGet(#HP)


assign HP(uValue) 
self:FieldPut(#HP, uValue)
return HP := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRDP",_GetInst()},iCtlID)

oDCNUMERO := SingleLineEdit{self,ResourceID{JRDP_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_char_03{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero",NULL_STRING,"RDP_HP"}

oDCSC_SEQ := FixedText{self,ResourceID{JRDP_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSEQ := SingleLineEdit{self,ResourceID{JRDP_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := padrao_num_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"RDP_SEQ"}

oDCSC_NUMERO := FixedText{self,ResourceID{JRDP_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_HP := FixedText{self,ResourceID{JRDP_SC_HP,_GetInst()}}
oDCSC_HP:HyperLabel := HyperLabel{#SC_HP,"Hp:",NULL_STRING,NULL_STRING}

oDCHP := SingleLineEdit{self,ResourceID{JRDP_HP,_GetInst()}}
oDCHP:FieldSpec := padrao_num_10_2{}
oDCHP:HyperLabel := HyperLabel{#HP,"Hp:",NULL_STRING,"RDP_HP"}

oDCSC_NOME := FixedText{self,ResourceID{JRDP_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{self,ResourceID{JRDP_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"RDP_NOME"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JRDP,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBSEQ := DataColumn{padrao_num_03{}}
oDBSEQ:Width := 9
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
self:Browser:AddColumn(oDBSEQ)

oDBNUMERO := DataColumn{padrao_char_03{}}
oDBNUMERO:Width := 17
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero"
self:Browser:AddColumn(oDBNUMERO)

oDBNOME := DataColumn{padrao_char_40{}}
oDBNOME:Width := 17
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBHP := DataColumn{padrao_num_10_2{}}
oDBHP:Width := 17
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
