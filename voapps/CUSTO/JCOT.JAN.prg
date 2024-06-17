#region DEFINES
STATIC DEFINE JCOT_CLICOG := 100 
STATIC DEFINE JCOT_CLIFOR := 101 
STATIC DEFINE JCOT_DADO := 109 
STATIC DEFINE JCOT_GROUPBOX1 := 108 
STATIC DEFINE JCOT_PRECO := 107 
STATIC DEFINE JCOT_PRECODT := 106 
STATIC DEFINE JCOT_PRECOUN := 103 
STATIC DEFINE JCOT_SC_CLIFOR := 102 
STATIC DEFINE JCOT_SC_PRECODT := 105 
STATIC DEFINE JCOT_SC_PRECOUN := 104 
#endregion

class JCOT inherit DATAWINDOW 

	PROTECT oDBDADO as DataColumn
	PROTECT oDBPRECO as DataColumn
	PROTECT oDBPRECOUN as DataColumn
	PROTECT oDBPRECODT as DataColumn
	PROTECT oDBCLIFOR as DataColumn
	PROTECT oDBCLICOG as DataColumn
	protect oDCCLICOG as SINGLELINEEDIT
	protect oDCCLIFOR as SINGLELINEEDIT
	protect oDCSC_CLIFOR as FIXEDTEXT
	protect oDCPRECOUN as SINGLELINEEDIT
	protect oDCSC_PRECOUN as FIXEDTEXT
	protect oDCSC_PRECODT as FIXEDTEXT
	protect oDCPRECODT as SINGLELINEEDIT
	protect oDCPRECO as SINGLELINEEDIT
	protect oDCGroupBox1 as GROUPBOX
	protect oDCDADO as SINGLELINEEDIT
// 	instance CLICOG 
// 	instance CLIFOR 
// 	instance PRECOUN 
// 	instance PRECODT 
// 	instance PRECO 
// 	instance DADO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CLICOG() 
return self:FieldGet(#CLICOG)


assign CLICOG(uValue) 
self:FieldPut(#CLICOG, uValue)
return CLICOG := uValue


access CLIFOR() 
return self:FieldGet(#CLIFOR)


assign CLIFOR(uValue) 
self:FieldPut(#CLIFOR, uValue)
return CLIFOR := uValue


access DADO() 
return self:FieldGet(#DADO)


assign DADO(uValue) 
self:FieldPut(#DADO, uValue)
return DADO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCOT",_GetInst()},iCtlID)

oDCCLICOG := SingleLineEdit{self,ResourceID{JCOT_CLICOG,_GetInst()}}
oDCCLICOG:FieldSpec := padrao_char_12{}
oDCCLICOG:HyperLabel := HyperLabel{#CLICOG,"Cognome",NULL_STRING,"VIABIII_CLICOG"}

oDCCLIFOR := SingleLineEdit{self,ResourceID{JCOT_CLIFOR,_GetInst()}}
oDCCLIFOR:FieldSpec := padrao_num_08{}
oDCCLIFOR:HyperLabel := HyperLabel{#CLIFOR,"No.",NULL_STRING,"VIABIII_CLIFOR"}

oDCSC_CLIFOR := FixedText{self,ResourceID{JCOT_SC_CLIFOR,_GetInst()}}
oDCSC_CLIFOR:HyperLabel := HyperLabel{#SC_CLIFOR,"Fornecedor",NULL_STRING,NULL_STRING}

oDCPRECOUN := SingleLineEdit{self,ResourceID{JCOT_PRECOUN,_GetInst()}}
oDCPRECOUN:FieldSpec := padrao_char_02{}
oDCPRECOUN:HyperLabel := HyperLabel{#PRECOUN,"UN",NULL_STRING,"VIABIII_PRECOUN"}

oDCSC_PRECOUN := FixedText{self,ResourceID{JCOT_SC_PRECOUN,_GetInst()}}
oDCSC_PRECOUN:HyperLabel := HyperLabel{#SC_PRECOUN,"Unidade",NULL_STRING,NULL_STRING}

oDCSC_PRECODT := FixedText{self,ResourceID{JCOT_SC_PRECODT,_GetInst()}}
oDCSC_PRECODT:HyperLabel := HyperLabel{#SC_PRECODT,"Data",NULL_STRING,NULL_STRING}

oDCPRECODT := SingleLineEdit{self,ResourceID{JCOT_PRECODT,_GetInst()}}
oDCPRECODT:FieldSpec := date_field{}
oDCPRECODT:HyperLabel := HyperLabel{#PRECODT,"Em:",NULL_STRING,"VIABIII_PRECODT"}

oDCPRECO := SingleLineEdit{self,ResourceID{JCOT_PRECO,_GetInst()}}
oDCPRECO:FieldSpec := padrao_num_12_2{}
oDCPRECO:HyperLabel := HyperLabel{#PRECO,"Preco:",NULL_STRING,"VIABIII_PRECO"}

oDCGroupBox1 := GroupBox{self,ResourceID{JCOT_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Cotação",NULL_STRING,NULL_STRING}

oDCDADO := SingleLineEdit{self,ResourceID{JCOT_DADO,_GetInst()}}
oDCDADO:FieldSpec := padrao_char_255{}
oDCDADO:HyperLabel := HyperLabel{#DADO,"Dado:",NULL_STRING,"VIABIII_DADO"}
oDCDADO:FocusSelect := FSEL_HOME

self:Caption := "Cotações"
self:HyperLabel := HyperLabel{#JCOT,"Cotações",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDADO := DataColumn{padrao_char_255{}}
oDBDADO:Width := 40
oDBDADO:HyperLabel := oDCDADO:HyperLabel 
oDBDADO:Caption := "Dado:"
self:Browser:AddColumn(oDBDADO)

oDBPRECO := DataColumn{padrao_num_12_2{}}
oDBPRECO:Width := 7
oDBPRECO:HyperLabel := oDCPRECO:HyperLabel 
oDBPRECO:Caption := "Preco:"
self:Browser:AddColumn(oDBPRECO)

oDBPRECOUN := DataColumn{padrao_char_02{}}
oDBPRECOUN:Width := 6
oDBPRECOUN:HyperLabel := oDCPRECOUN:HyperLabel 
oDBPRECOUN:Caption := "UN"
self:Browser:AddColumn(oDBPRECOUN)

oDBPRECODT := DataColumn{date_field{}}
oDBPRECODT:Width := 9
oDBPRECODT:HyperLabel := oDCPRECODT:HyperLabel 
oDBPRECODT:Caption := "Em:"
self:Browser:AddColumn(oDBPRECODT)

oDBCLIFOR := DataColumn{padrao_num_08{}}
oDBCLIFOR:Width := 8
oDBCLIFOR:HyperLabel := oDCCLIFOR:HyperLabel 
oDBCLIFOR:Caption := "No."
self:Browser:AddColumn(oDBCLIFOR)

oDBCLICOG := DataColumn{padrao_char_12{}}
oDBCLICOG:Width := 17
oDBCLICOG:HyperLabel := oDCCLICOG:HyperLabel 
oDBCLICOG:Caption := "Cognome"
self:Browser:AddColumn(oDBCLICOG)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PRECO() 
return self:FieldGet(#PRECO)


assign PRECO(uValue) 
self:FieldPut(#PRECO, uValue)
return PRECO := uValue


access PRECODT() 
return self:FieldGet(#PRECODT)


assign PRECODT(uValue) 
self:FieldPut(#PRECODT, uValue)
return PRECODT := uValue


access PRECOUN() 
return self:FieldGet(#PRECOUN)


assign PRECOUN(uValue) 
self:FieldPut(#PRECOUN, uValue)
return PRECOUN := uValue


END CLASS
