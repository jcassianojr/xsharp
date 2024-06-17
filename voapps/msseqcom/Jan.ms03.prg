#region DEFINES
STATIC DEFINE JMS03_CODCOMP := 106 
STATIC DEFINE JMS03_NOMECOM2 := 108 
STATIC DEFINE JMS03_NOMECOMP := 107 
STATIC DEFINE JMS03_QTDDE := 109 
STATIC DEFINE JMS03_SC_CODCOMP := 101 
STATIC DEFINE JMS03_SC_NOMECOM2 := 103 
STATIC DEFINE JMS03_SC_NOMECOMP := 102 
STATIC DEFINE JMS03_SC_QTDDE := 104 
STATIC DEFINE JMS03_SC_TIPOENT := 100 
STATIC DEFINE JMS03_TIPOENT := 105 
#endregion

class jms03 inherit MYDataWindow 

	PROTECT oDBTIPOENT as DataColumn
	PROTECT oDBCODCOMP as DataColumn
	PROTECT oDBQTDDE as DataColumn
	PROTECT oDBNOMECOMP as DataColumn
	PROTECT oDBNOMECOM2 as DataColumn
	protect oDCSC_TIPOENT as FIXEDTEXT
	protect oDCSC_CODCOMP as FIXEDTEXT
	protect oDCSC_NOMECOMP as FIXEDTEXT
	protect oDCSC_NOMECOM2 as FIXEDTEXT
	protect oDCSC_QTDDE as FIXEDTEXT
	protect oDCTIPOENT as SINGLELINEEDIT
	protect oDCCODCOMP as SINGLELINEEDIT
	protect oDCNOMECOMP as SINGLELINEEDIT
	protect oDCNOMECOM2 as SINGLELINEEDIT
	protect oDCQTDDE as SINGLELINEEDIT
// 	instance TIPOENT 
// 	instance CODCOMP 
// 	instance NOMECOMP 
// 	instance NOMECOM2 
// 	instance QTDDE 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODCOMP() 
return self:FieldGet(#CODCOMP)


assign CODCOMP(uValue) 
self:FieldPut(#CODCOMP, uValue)
return CODCOMP := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jms03",_GetInst()},iCtlID)

oDCSC_TIPOENT := FixedText{self,ResourceID{JMS03_SC_TIPOENT,_GetInst()}}
oDCSC_TIPOENT:HyperLabel := HyperLabel{#SC_TIPOENT,"Tipo",NULL_STRING,NULL_STRING}

oDCSC_CODCOMP := FixedText{self,ResourceID{JMS03_SC_CODCOMP,_GetInst()}}
oDCSC_CODCOMP:HyperLabel := HyperLabel{#SC_CODCOMP,"Codcomp:",NULL_STRING,NULL_STRING}

oDCSC_NOMECOMP := FixedText{self,ResourceID{JMS03_SC_NOMECOMP,_GetInst()}}
oDCSC_NOMECOMP:HyperLabel := HyperLabel{#SC_NOMECOMP,"Nomecom2:",NULL_STRING,NULL_STRING}

oDCSC_NOMECOM2 := FixedText{self,ResourceID{JMS03_SC_NOMECOM2,_GetInst()}}
oDCSC_NOMECOM2:HyperLabel := HyperLabel{#SC_NOMECOM2,"Nomecom2:",NULL_STRING,NULL_STRING}

oDCSC_QTDDE := FixedText{self,ResourceID{JMS03_SC_QTDDE,_GetInst()}}
oDCSC_QTDDE:HyperLabel := HyperLabel{#SC_QTDDE,"Qtdde:",NULL_STRING,NULL_STRING}

oDCTIPOENT := SingleLineEdit{self,ResourceID{JMS03_TIPOENT,_GetInst()}}
oDCTIPOENT:FieldSpec := padrao_char_01{}
oDCTIPOENT:HyperLabel := HyperLabel{#TIPOENT,"T",NULL_STRING,"MS03_GERARN"}

oDCCODCOMP := SingleLineEdit{self,ResourceID{JMS03_CODCOMP,_GetInst()}}
oDCCODCOMP:FieldSpec := padrao_char_24{}
oDCCODCOMP:HyperLabel := HyperLabel{#CODCOMP,"Codigo",NULL_STRING,"MS03_CODCOMP"}

oDCNOMECOMP := SingleLineEdit{self,ResourceID{JMS03_NOMECOMP,_GetInst()}}
oDCNOMECOMP:FieldSpec := padrao_char_50{}
oDCNOMECOMP:HyperLabel := HyperLabel{#NOMECOMP,"Nome",NULL_STRING,"MS03_NOMECOM2"}

oDCNOMECOM2 := SingleLineEdit{self,ResourceID{JMS03_NOMECOM2,_GetInst()}}
oDCNOMECOM2:FieldSpec := padrao_char_50{}
oDCNOMECOM2:HyperLabel := HyperLabel{#NOMECOM2,"Nome",NULL_STRING,"MS03_NOMECOM2"}

oDCQTDDE := SingleLineEdit{self,ResourceID{JMS03_QTDDE,_GetInst()}}
oDCQTDDE:FieldSpec := padrao_num_10_5{}
oDCQTDDE:HyperLabel := HyperLabel{#QTDDE,"Qtdde:",NULL_STRING,"MS03_QTDDE"}

self:Caption := "Composiçao"
self:HyperLabel := HyperLabel{#jms03,"Composiçao",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTIPOENT := DataColumn{padrao_char_01{}}
oDBTIPOENT:Width := 5
oDBTIPOENT:HyperLabel := oDCTIPOENT:HyperLabel 
oDBTIPOENT:Caption := "T"
self:Browser:AddColumn(oDBTIPOENT)

oDBCODCOMP := DataColumn{padrao_char_24{}}
oDBCODCOMP:Width := 17
oDBCODCOMP:HyperLabel := oDCCODCOMP:HyperLabel 
oDBCODCOMP:Caption := "Codigo"
self:Browser:AddColumn(oDBCODCOMP)

oDBQTDDE := DataColumn{padrao_num_10_5{}}
oDBQTDDE:Width := 9
oDBQTDDE:HyperLabel := oDCQTDDE:HyperLabel 
oDBQTDDE:Caption := "Qtdde:"
self:Browser:AddColumn(oDBQTDDE)

oDBNOMECOMP := DataColumn{padrao_char_50{}}
oDBNOMECOMP:Width := 42
oDBNOMECOMP:HyperLabel := oDCNOMECOMP:HyperLabel 
oDBNOMECOMP:Caption := "Nome"
self:Browser:AddColumn(oDBNOMECOMP)

oDBNOMECOM2 := DataColumn{padrao_char_50{}}
oDBNOMECOM2:Width := 27
oDBNOMECOM2:HyperLabel := oDCNOMECOM2:HyperLabel 
oDBNOMECOM2:Caption := "Nome"
self:Browser:AddColumn(oDBNOMECOM2)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOMECOM2() 
return self:FieldGet(#NOMECOM2)


assign NOMECOM2(uValue) 
self:FieldPut(#NOMECOM2, uValue)
return NOMECOM2 := uValue


access NOMECOMP() 
return self:FieldGet(#NOMECOMP)


assign NOMECOMP(uValue) 
self:FieldPut(#NOMECOMP, uValue)
return NOMECOMP := uValue


access QTDDE() 
return self:FieldGet(#QTDDE)


assign QTDDE(uValue) 
self:FieldPut(#QTDDE, uValue)
return QTDDE := uValue


access TIPOENT() 
return self:FieldGet(#TIPOENT)


assign TIPOENT(uValue) 
self:FieldPut(#TIPOENT, uValue)
return TIPOENT := uValue


END CLASS
