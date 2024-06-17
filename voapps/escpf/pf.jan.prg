#region DEFINES
STATIC DEFINE JPF_CODFINAL := 106 
STATIC DEFINE JPF_CODIGO := 105 
STATIC DEFINE JPF_CODIGOINT := 108 
STATIC DEFINE JPF_DESCR := 107 
STATIC DEFINE JPF_PF := 104 
STATIC DEFINE JPF_SC_CODFINAL := 102 
STATIC DEFINE JPF_SC_CODIGO := 101 
STATIC DEFINE JPF_SC_CODIGO1 := 109 
STATIC DEFINE JPF_SC_DESCR := 103 
STATIC DEFINE JPF_SC_PF := 100 
#endregion

class jpf inherit DATAWINDOW 

	PROTECT oDBPF as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBCODFINAL as DataColumn
	PROTECT oDBCODIGOINT as DataColumn
	PROTECT oDBDESCR as DataColumn
	protect oDCSC_PF as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_CODFINAL as FIXEDTEXT
	protect oDCSC_DESCR as FIXEDTEXT
	protect oDCPF as SINGLELINEEDIT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCCODFINAL as SINGLELINEEDIT
	protect oDCDESCR as SINGLELINEEDIT
	protect oDCCODIGOINT as SINGLELINEEDIT
	protect oDCSC_CODIGO1 as FIXEDTEXT
// 	instance PF 
// 	instance CODIGO 
// 	instance CODFINAL 
// 	instance DESCR 
// 	instance CODIGOINT 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODFINAL() 
return self:FieldGet(#CODFINAL)


assign CODFINAL(uValue) 
self:FieldPut(#CODFINAL, uValue)
return CODFINAL := uValue


access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODIGOINT() 
return self:FieldGet(#CODIGOINT)


assign CODIGOINT(uValue) 
self:FieldPut(#CODIGOINT, uValue)
return CODIGOINT := uValue


access DESCR() 
return self:FieldGet(#DESCR)


assign DESCR(uValue) 
self:FieldPut(#DESCR, uValue)
return DESCR := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jpf",_GetInst()},iCtlID)

oDCSC_PF := FixedText{self,ResourceID{JPF_SC_PF,_GetInst()}}
oDCSC_PF:HyperLabel := HyperLabel{#SC_PF,"Pf:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JPF_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_CODFINAL := FixedText{self,ResourceID{JPF_SC_CODFINAL,_GetInst()}}
oDCSC_CODFINAL:HyperLabel := HyperLabel{#SC_CODFINAL,"Codfinal:",NULL_STRING,NULL_STRING}

oDCSC_DESCR := FixedText{self,ResourceID{JPF_SC_DESCR,_GetInst()}}
oDCSC_DESCR:HyperLabel := HyperLabel{#SC_DESCR,"Descr:",NULL_STRING,NULL_STRING}

oDCPF := SingleLineEdit{self,ResourceID{JPF_PF,_GetInst()}}
oDCPF:FieldSpec := pfsql_PF{}
oDCPF:HyperLabel := HyperLabel{#PF,"Pf:",NULL_STRING,"PF_PF"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JPF_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := pfsql_CODIGO{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"PF_CODIGO"}

oDCCODFINAL := SingleLineEdit{self,ResourceID{JPF_CODFINAL,_GetInst()}}
oDCCODFINAL:FieldSpec := pfsql_CODFINAL{}
oDCCODFINAL:HyperLabel := HyperLabel{#CODFINAL,"Codfinal:",NULL_STRING,"PF_CODFINAL"}

oDCDESCR := SingleLineEdit{self,ResourceID{JPF_DESCR,_GetInst()}}
oDCDESCR:FieldSpec := pfsql_DESCR{}
oDCDESCR:HyperLabel := HyperLabel{#DESCR,"Descriçao",NULL_STRING,"PF_DESCR"}

oDCCODIGOINT := SingleLineEdit{self,ResourceID{JPF_CODIGOINT,_GetInst()}}
oDCCODIGOINT:FieldSpec := pfsql_CODIGOINT{}
oDCCODIGOINT:HyperLabel := HyperLabel{#CODIGOINT,"Codigo:",NULL_STRING,"PF_CODIGO"}

oDCSC_CODIGO1 := FixedText{self,ResourceID{JPF_SC_CODIGO1,_GetInst()}}
oDCSC_CODIGO1:HyperLabel := HyperLabel{#SC_CODIGO1,"Codigo INT:",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jpf,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(pfsql{})
endif
self:Browser := DataBrowser{self}

oDBPF := DataColumn{pfsql_PF{}}
oDBPF:Width := 8
oDBPF:HyperLabel := oDCPF:HyperLabel 
oDBPF:Caption := "Pf:"
self:Browser:AddColumn(oDBPF)

oDBCODIGO := DataColumn{pfsql_CODIGO{}}
oDBCODIGO:Width := 17
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBCODFINAL := DataColumn{pfsql_CODFINAL{}}
oDBCODFINAL:Width := 18
oDBCODFINAL:HyperLabel := oDCCODFINAL:HyperLabel 
oDBCODFINAL:Caption := "Codfinal:"
self:Browser:AddColumn(oDBCODFINAL)

oDBCODIGOINT := DataColumn{pfsql_CODIGOINT{}}
oDBCODIGOINT:Width := 21
oDBCODIGOINT:HyperLabel := oDCCODIGOINT:HyperLabel 
oDBCODIGOINT:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGOINT)

oDBDESCR := DataColumn{pfsql_DESCR{}}
oDBDESCR:Width := 26
oDBDESCR:HyperLabel := oDCDESCR:HyperLabel 
oDBDESCR:Caption := "Descriçao"
self:Browser:AddColumn(oDBDESCR)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PF() 
return self:FieldGet(#PF)


assign PF(uValue) 
self:FieldPut(#PF, uValue)
return PF := uValue


END CLASS
