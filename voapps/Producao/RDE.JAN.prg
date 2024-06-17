#region DEFINES
STATIC DEFINE JRDE_HD := 108 
STATIC DEFINE JRDE_HT := 107 
STATIC DEFINE JRDE_MEDIA := 117 
STATIC DEFINE JRDE_NOME := 103 
STATIC DEFINE JRDE_NUMERO := 102 
STATIC DEFINE JRDE_PE := 114 
STATIC DEFINE JRDE_PP := 115 
STATIC DEFINE JRDE_PU := 113 
STATIC DEFINE JRDE_QP := 109 
STATIC DEFINE JRDE_SC_HD := 105 
STATIC DEFINE JRDE_SC_HT := 104 
STATIC DEFINE JRDE_SC_MEDIA := 116 
STATIC DEFINE JRDE_SC_NOME := 100 
STATIC DEFINE JRDE_SC_NUMERO := 101 
STATIC DEFINE JRDE_SC_PE := 111 
STATIC DEFINE JRDE_SC_PP := 112 
STATIC DEFINE JRDE_SC_PU := 110 
STATIC DEFINE JRDE_SC_QP := 106 
#endregion

class JRDE inherit DATAWINDOW 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBNOME as DataColumn
	PROTECT oDBHT as DataColumn
	PROTECT oDBHD as DataColumn
	PROTECT oDBQP as DataColumn
	PROTECT oDBPU as DataColumn
	PROTECT oDBPE as DataColumn
	PROTECT oDBPP as DataColumn
	PROTECT oDBMEDIA as DataColumn
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCSC_HT as FIXEDTEXT
	protect oDCSC_HD as FIXEDTEXT
	protect oDCSC_QP as FIXEDTEXT
	protect oDCHT as SINGLELINEEDIT
	protect oDCHD as SINGLELINEEDIT
	protect oDCQP as SINGLELINEEDIT
	protect oDCSC_PU as FIXEDTEXT
	protect oDCSC_PE as FIXEDTEXT
	protect oDCSC_PP as FIXEDTEXT
	protect oDCPU as SINGLELINEEDIT
	protect oDCPE as SINGLELINEEDIT
	protect oDCPP as SINGLELINEEDIT
	protect oDCSC_MEDIA as FIXEDTEXT
	protect oDCMEDIA as SINGLELINEEDIT
// 	instance NUMERO 
// 	instance NOME 
// 	instance HT 
// 	instance HD 
// 	instance QP 
// 	instance PU 
// 	instance PE 
// 	instance PP 
// 	instance MEDIA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access HD() 
return self:FieldGet(#HD)


assign HD(uValue) 
self:FieldPut(#HD, uValue)
return HD := uValue


access HT() 
return self:FieldGet(#HT)


assign HT(uValue) 
self:FieldPut(#HT, uValue)
return HT := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRDE",_GetInst()},iCtlID)

oDCSC_NOME := FixedText{self,ResourceID{JRDE_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JRDE_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Número:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JRDE_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_char_04{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"RDE_NUMERO"}

oDCNOME := SingleLineEdit{self,ResourceID{JRDE_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"RDE_NOME"}

oDCSC_HT := FixedText{self,ResourceID{JRDE_SC_HT,_GetInst()}}
oDCSC_HT:HyperLabel := HyperLabel{#SC_HT,"Horas Trabalhadas:",NULL_STRING,NULL_STRING}

oDCSC_HD := FixedText{self,ResourceID{JRDE_SC_HD,_GetInst()}}
oDCSC_HD:HyperLabel := HyperLabel{#SC_HD,"Horas Disponiveis:",NULL_STRING,NULL_STRING}

oDCSC_QP := FixedText{self,ResourceID{JRDE_SC_QP,_GetInst()}}
oDCSC_QP:HyperLabel := HyperLabel{#SC_QP,"Quantidade Produzida:",NULL_STRING,NULL_STRING}

oDCHT := SingleLineEdit{self,ResourceID{JRDE_HT,_GetInst()}}
oDCHT:FieldSpec := padrao_num_10_2{}
oDCHT:HyperLabel := HyperLabel{#HT,"Ht:",NULL_STRING,"RDE_HT"}

oDCHD := SingleLineEdit{self,ResourceID{JRDE_HD,_GetInst()}}
oDCHD:FieldSpec := padrao_num_10_2{}
oDCHD:HyperLabel := HyperLabel{#HD,"Hd:",NULL_STRING,"RDE_HD"}

oDCQP := SingleLineEdit{self,ResourceID{JRDE_QP,_GetInst()}}
oDCQP:FieldSpec := padrao_num_10{}
oDCQP:HyperLabel := HyperLabel{#QP,"Qp:",NULL_STRING,"RDE_QP"}

oDCSC_PU := FixedText{self,ResourceID{JRDE_SC_PU,_GetInst()}}
oDCSC_PU:HyperLabel := HyperLabel{#SC_PU,"% Utilização:",NULL_STRING,NULL_STRING}

oDCSC_PE := FixedText{self,ResourceID{JRDE_SC_PE,_GetInst()}}
oDCSC_PE:HyperLabel := HyperLabel{#SC_PE,"% Eficiencia",NULL_STRING,NULL_STRING}

oDCSC_PP := FixedText{self,ResourceID{JRDE_SC_PP,_GetInst()}}
oDCSC_PP:HyperLabel := HyperLabel{#SC_PP,"% Produtividade",NULL_STRING,NULL_STRING}

oDCPU := SingleLineEdit{self,ResourceID{JRDE_PU,_GetInst()}}
oDCPU:FieldSpec := padrao_num_10_2{}
oDCPU:HyperLabel := HyperLabel{#PU,"Pu:",NULL_STRING,"RDE_PU"}

oDCPE := SingleLineEdit{self,ResourceID{JRDE_PE,_GetInst()}}
oDCPE:FieldSpec := padrao_num_10_2{}
oDCPE:HyperLabel := HyperLabel{#PE,"Pe:",NULL_STRING,"RDE_PE"}

oDCPP := SingleLineEdit{self,ResourceID{JRDE_PP,_GetInst()}}
oDCPP:FieldSpec := padrao_num_10_2{}
oDCPP:HyperLabel := HyperLabel{#PP,"Pp:",NULL_STRING,"RDE_PP"}

oDCSC_MEDIA := FixedText{self,ResourceID{JRDE_SC_MEDIA,_GetInst()}}
oDCSC_MEDIA:HyperLabel := HyperLabel{#SC_MEDIA,"Media:",NULL_STRING,NULL_STRING}

oDCMEDIA := SingleLineEdit{self,ResourceID{JRDE_MEDIA,_GetInst()}}
oDCMEDIA:FieldSpec := padrao_num_10{}
oDCMEDIA:HyperLabel := HyperLabel{#MEDIA,"Media:",NULL_STRING,"RDE_MEDIA"}

self:Caption := "Itens Equipamentos"
self:HyperLabel := HyperLabel{#JRDE,"Itens Equipamentos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_char_04{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBNOME := DataColumn{padrao_char_40{}}
oDBNOME:Width := 15
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)

oDBHT := DataColumn{padrao_num_10_2{}}
oDBHT:Width := 9
oDBHT:HyperLabel := oDCHT:HyperLabel 
oDBHT:Caption := "Ht:"
self:Browser:AddColumn(oDBHT)

oDBHD := DataColumn{padrao_num_10_2{}}
oDBHD:Width := 6
oDBHD:HyperLabel := oDCHD:HyperLabel 
oDBHD:Caption := "Hd:"
self:Browser:AddColumn(oDBHD)

oDBQP := DataColumn{padrao_num_10{}}
oDBQP:Width := 8
oDBQP:HyperLabel := oDCQP:HyperLabel 
oDBQP:Caption := "Qp:"
self:Browser:AddColumn(oDBQP)

oDBPU := DataColumn{padrao_num_10_2{}}
oDBPU:Width := 8
oDBPU:HyperLabel := oDCPU:HyperLabel 
oDBPU:Caption := "Pu:"
self:Browser:AddColumn(oDBPU)

oDBPE := DataColumn{padrao_num_10_2{}}
oDBPE:Width := 7
oDBPE:HyperLabel := oDCPE:HyperLabel 
oDBPE:Caption := "Pe:"
self:Browser:AddColumn(oDBPE)

oDBPP := DataColumn{padrao_num_10_2{}}
oDBPP:Width := 8
oDBPP:HyperLabel := oDCPP:HyperLabel 
oDBPP:Caption := "Pp:"
self:Browser:AddColumn(oDBPP)

oDBMEDIA := DataColumn{padrao_num_10{}}
oDBMEDIA:Width := 7
oDBMEDIA:HyperLabel := oDCMEDIA:HyperLabel 
oDBMEDIA:Caption := "Media:"
self:Browser:AddColumn(oDBMEDIA)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MEDIA() 
return self:FieldGet(#MEDIA)


assign MEDIA(uValue) 
self:FieldPut(#MEDIA, uValue)
return MEDIA := uValue


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


access PE() 
return self:FieldGet(#PE)


assign PE(uValue) 
self:FieldPut(#PE, uValue)
return PE := uValue


access PP() 
return self:FieldGet(#PP)


assign PP(uValue) 
self:FieldPut(#PP, uValue)
return PP := uValue


access PU() 
return self:FieldGet(#PU)


assign PU(uValue) 
self:FieldPut(#PU, uValue)
return PU := uValue


access QP() 
return self:FieldGet(#QP)


assign QP(uValue) 
self:FieldPut(#QP, uValue)
return QP := uValue


END CLASS
