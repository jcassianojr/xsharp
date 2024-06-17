#region DEFINES
STATIC DEFINE JREG75_BUSCANUM := 125 
STATIC DEFINE JREG75_CLASSIPI := 116 
STATIC DEFINE JREG75_CMDCHECMOD := 127 
STATIC DEFINE JREG75_CMDESCMOD := 128 
STATIC DEFINE JREG75_CODIGORED := 115 
STATIC DEFINE JREG75_DATAFIM := 114 
STATIC DEFINE JREG75_DATAINI := 113 
STATIC DEFINE JREG75_DESCRICAO := 117 
STATIC DEFINE JREG75_ICM := 122 
STATIC DEFINE JREG75_IPI := 121 
STATIC DEFINE JREG75_PORNUM := 126 
STATIC DEFINE JREG75_REDICM := 123 
STATIC DEFINE JREG75_SC_CLASSIPI := 103 
STATIC DEFINE JREG75_SC_CODIGORED := 102 
STATIC DEFINE JREG75_SC_DATAINI := 101 
STATIC DEFINE JREG75_SC_DESCRICAO := 104 
STATIC DEFINE JREG75_SC_ICM := 109 
STATIC DEFINE JREG75_SC_IPI := 108 
STATIC DEFINE JREG75_SC_REDICM := 110 
STATIC DEFINE JREG75_SC_SITUACAO := 106 
STATIC DEFINE JREG75_SC_SUBICM := 111 
STATIC DEFINE JREG75_SC_TIPO := 100 
STATIC DEFINE JREG75_SC_TIPOENT := 107 
STATIC DEFINE JREG75_SC_UNID := 105 
STATIC DEFINE JREG75_SITUACAO := 119 
STATIC DEFINE JREG75_SUBICM := 124 
STATIC DEFINE JREG75_TIPO := 112 
STATIC DEFINE JREG75_TIPOENT := 120 
STATIC DEFINE JREG75_UNID := 118 
#endregion

class jreg75 inherit MYDataWindow 

	PROTECT oDBTIPO as DataColumn
	PROTECT oDBDATAINI as DataColumn
	PROTECT oDBDATAFIM as DataColumn
	PROTECT oDBCODIGORED as DataColumn
	PROTECT oDBCLASSIPI as DataColumn
	PROTECT oDBDESCRICAO as DataColumn
	PROTECT oDBUNID as DataColumn
	PROTECT oDBSITUACAO as DataColumn
	PROTECT oDBTIPOENT as DataColumn
	PROTECT oDBIPI as DataColumn
	PROTECT oDBICM as DataColumn
	PROTECT oDBREDICM as DataColumn
	PROTECT oDBSUBICM as DataColumn
	protect oDCSC_TIPO as FIXEDTEXT
	protect oDCSC_DATAINI as FIXEDTEXT
	protect oDCSC_CODIGORED as FIXEDTEXT
	protect oDCSC_CLASSIPI as FIXEDTEXT
	protect oDCSC_DESCRICAO as FIXEDTEXT
	protect oDCSC_UNID as FIXEDTEXT
	protect oDCSC_SITUACAO as FIXEDTEXT
	protect oDCSC_TIPOENT as FIXEDTEXT
	protect oDCSC_IPI as FIXEDTEXT
	protect oDCSC_ICM as FIXEDTEXT
	protect oDCSC_REDICM as FIXEDTEXT
	protect oDCSC_SUBICM as FIXEDTEXT
	protect oDCTIPO as SINGLELINEEDIT
	protect oDCDATAINI as DATESLE
	protect oDCDATAFIM as DATESLE
	protect oDCCODIGORED as SINGLELINEEDIT
	protect oDCCLASSIPI as SINGLELINEEDIT
	protect oDCDESCRICAO as SINGLELINEEDIT
	protect oDCUNID as SINGLELINEEDIT
	protect oDCSITUACAO as RIGHTSLE
	protect oDCTIPOENT as SINGLELINEEDIT
	protect oDCIPI as RIGHTSLE
	protect oDCICM as RIGHTSLE
	protect oDCREDICM as RIGHTSLE
	protect oDCSUBICM as RIGHTSLE
	protect oCCbuscanum as PUSHBUTTON
	protect oCCpornum as PUSHBUTTON
	protect oCCcmdchecmod as PUSHBUTTON
	protect oCCcmdescmod as PUSHBUTTON
// 	instance TIPO 
// 	instance DATAINI 
// 	instance DATAFIM 
// 	instance CODIGORED 
// 	instance CLASSIPI 
// 	instance DESCRICAO 
// 	instance UNID 
// 	instance SITUACAO 
// 	instance TIPOENT 
// 	instance IPI 
// 	instance ICM 
// 	instance REDICM 
// 	instance SUBICM 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD buscanum( ) 
	SELF:keyfind()

access CLASSIPI() 
return self:FieldGet(#CLASSIPI)


assign CLASSIPI(uValue) 
self:FieldPut(#CLASSIPI, uValue)
return CLASSIPI := uValue


METHOD cmdchecmod( ) 
LOCAL nPOS AS DWORD
nPOS:=CHECKCODI(SELF:SErver:FIELDGET("SITUACAO"))
IF nPOS=0
   alert("Codigo ICM Invalido")	
ELSE
	alert(ACODin[Npos])
ENDIF	
	

METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD cmdescmod( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"CST_ICMS.DBF",StrZero(SELF:SERVER:FIELDGET("situacao"),3)}
oESC:SHOW()	
IF OesC:lok
    SELF:SERVER:FIELDPUT("situacao",Val(oESC:CODIGO))
ENDIF					

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()	

access CODIGORED() 
return self:FieldGet(#CODIGORED)


assign CODIGORED(uValue) 
self:FieldPut(#CODIGORED, uValue)
return CODIGORED := uValue


access DATAFIM() 
return self:FieldGet(#DATAFIM)


assign DATAFIM(uValue) 
self:FieldPut(#DATAFIM, uValue)
return DATAFIM := uValue


access DATAINI() 
return self:FieldGet(#DATAINI)


assign DATAINI(uValue) 
self:FieldPut(#DATAINI, uValue)
return DATAINI := uValue


access DESCRICAO() 
return self:FieldGet(#DESCRICAO)


assign DESCRICAO(uValue) 
self:FieldPut(#DESCRICAO, uValue)
return DESCRICAO := uValue


access ICM() 
return self:FieldGet(#ICM)


assign ICM(uValue) 
self:FieldPut(#ICM, uValue)
return ICM := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jreg75",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200,10}}

oDCSC_TIPO := FixedText{self,ResourceID{JREG75_SC_TIPO,_GetInst()}}
oDCSC_TIPO:HyperLabel := HyperLabel{#SC_TIPO,"Tipo:",NULL_STRING,NULL_STRING}

oDCSC_DATAINI := FixedText{self,ResourceID{JREG75_SC_DATAINI,_GetInst()}}
oDCSC_DATAINI:HyperLabel := HyperLabel{#SC_DATAINI,"Periodo",NULL_STRING,NULL_STRING}

oDCSC_CODIGORED := FixedText{self,ResourceID{JREG75_SC_CODIGORED,_GetInst()}}
oDCSC_CODIGORED:HyperLabel := HyperLabel{#SC_CODIGORED,"Codigo",NULL_STRING,NULL_STRING}

oDCSC_CLASSIPI := FixedText{self,ResourceID{JREG75_SC_CLASSIPI,_GetInst()}}
oDCSC_CLASSIPI:HyperLabel := HyperLabel{#SC_CLASSIPI,"Classificacao/NBM",NULL_STRING,NULL_STRING}

oDCSC_DESCRICAO := FixedText{self,ResourceID{JREG75_SC_DESCRICAO,_GetInst()}}
oDCSC_DESCRICAO:HyperLabel := HyperLabel{#SC_DESCRICAO,"Descricao:",NULL_STRING,NULL_STRING}

oDCSC_UNID := FixedText{self,ResourceID{JREG75_SC_UNID,_GetInst()}}
oDCSC_UNID:HyperLabel := HyperLabel{#SC_UNID,"Unid:",NULL_STRING,NULL_STRING}

oDCSC_SITUACAO := FixedText{self,ResourceID{JREG75_SC_SITUACAO,_GetInst()}}
oDCSC_SITUACAO:HyperLabel := HyperLabel{#SC_SITUACAO,"CodIcm",NULL_STRING,NULL_STRING}

oDCSC_TIPOENT := FixedText{self,ResourceID{JREG75_SC_TIPOENT,_GetInst()}}
oDCSC_TIPOENT:HyperLabel := HyperLabel{#SC_TIPOENT,"Tipo",NULL_STRING,NULL_STRING}

oDCSC_IPI := FixedText{self,ResourceID{JREG75_SC_IPI,_GetInst()}}
oDCSC_IPI:HyperLabel := HyperLabel{#SC_IPI,"Ipi:",NULL_STRING,NULL_STRING}

oDCSC_ICM := FixedText{self,ResourceID{JREG75_SC_ICM,_GetInst()}}
oDCSC_ICM:HyperLabel := HyperLabel{#SC_ICM,"Icm:",NULL_STRING,NULL_STRING}

oDCSC_REDICM := FixedText{self,ResourceID{JREG75_SC_REDICM,_GetInst()}}
oDCSC_REDICM:HyperLabel := HyperLabel{#SC_REDICM,"Redicm:",NULL_STRING,NULL_STRING}

oDCSC_SUBICM := FixedText{self,ResourceID{JREG75_SC_SUBICM,_GetInst()}}
oDCSC_SUBICM:HyperLabel := HyperLabel{#SC_SUBICM,"Subicm:",NULL_STRING,NULL_STRING}

oDCTIPO := SingleLineEdit{self,ResourceID{JREG75_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := padrao_char_02{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo:",NULL_STRING,"sint75_TIPO"}
oDCTIPO:BackGround := aBrushes[1]
oDCTIPO:Font(aFonts[1], FALSE)

oDCDATAINI := DateSle{self,ResourceID{JREG75_DATAINI,_GetInst()}}
oDCDATAINI:FieldSpec := date_field{}
oDCDATAINI:HyperLabel := HyperLabel{#DATAINI,"Dataini:",NULL_STRING,"sint75_DATAINI"}

oDCDATAFIM := DateSle{self,ResourceID{JREG75_DATAFIM,_GetInst()}}
oDCDATAFIM:FieldSpec := date_field{}
oDCDATAFIM:HyperLabel := HyperLabel{#DATAFIM,"Datafim:",NULL_STRING,"sint75_DATAFIM"}

oDCCODIGORED := SingleLineEdit{self,ResourceID{JREG75_CODIGORED,_GetInst()}}
oDCCODIGORED:FieldSpec := padrao_char_14{}
oDCCODIGORED:HyperLabel := HyperLabel{#CODIGORED,"Codigored:",NULL_STRING,"sint75_CODIGORED"}

oDCCLASSIPI := SingleLineEdit{self,ResourceID{JREG75_CLASSIPI,_GetInst()}}
oDCCLASSIPI:FieldSpec := padrao_char_14{}
oDCCLASSIPI:HyperLabel := HyperLabel{#CLASSIPI,"Classipi:",NULL_STRING,"sint75_CLASSIPI"}

oDCDESCRICAO := SingleLineEdit{self,ResourceID{JREG75_DESCRICAO,_GetInst()}}
oDCDESCRICAO:FieldSpec := padrao_char_55{}
oDCDESCRICAO:HyperLabel := HyperLabel{#DESCRICAO,"Descricao:",NULL_STRING,"sint75_DESCRICAO"}

oDCUNID := SingleLineEdit{self,ResourceID{JREG75_UNID,_GetInst()}}
oDCUNID:FieldSpec := padrao_char_02{}
oDCUNID:HyperLabel := HyperLabel{#UNID,"Unid:",NULL_STRING,"sint75_UNID"}

oDCSITUACAO := rightSle{self,ResourceID{JREG75_SITUACAO,_GetInst()}}
oDCSITUACAO:FieldSpec := padrao_num_03{}
oDCSITUACAO:HyperLabel := HyperLabel{#SITUACAO,"Situacao:",NULL_STRING,"sint75_SITUACAO"}

oDCTIPOENT := SingleLineEdit{self,ResourceID{JREG75_TIPOENT,_GetInst()}}
oDCTIPOENT:FieldSpec := padrao_char_01{}
oDCTIPOENT:HyperLabel := HyperLabel{#TIPOENT,"Tipoent:",NULL_STRING,"sint75_TIPOENT"}

oDCIPI := rightSle{self,ResourceID{JREG75_IPI,_GetInst()}}
oDCIPI:FieldSpec := padrao_num_05_2{}
oDCIPI:HyperLabel := HyperLabel{#IPI,"Ipi:",NULL_STRING,"sint75_IPI"}

oDCICM := rightSle{self,ResourceID{JREG75_ICM,_GetInst()}}
oDCICM:FieldSpec := padrao_num_05_2{}
oDCICM:HyperLabel := HyperLabel{#ICM,"Icm:",NULL_STRING,"sint75_ICM"}

oDCREDICM := rightSle{self,ResourceID{JREG75_REDICM,_GetInst()}}
oDCREDICM:FieldSpec := padrao_num_05_2{}
oDCREDICM:HyperLabel := HyperLabel{#REDICM,"Redicm:",NULL_STRING,"sint75_REDICM"}

oDCSUBICM := rightSle{self,ResourceID{JREG75_SUBICM,_GetInst()}}
oDCSUBICM:FieldSpec := padrao_num_12_2{}
oDCSUBICM:HyperLabel := HyperLabel{#SUBICM,"Subicm:",NULL_STRING,"sint75_SUBICM"}

oCCbuscanum := PushButton{self,ResourceID{JREG75_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Clique Para Localizar Por Numero"

oCCpornum := PushButton{self,ResourceID{JREG75_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCpornum:TooltipText := "Clique para ordenar por Numero"

oCCcmdchecmod := PushButton{self,ResourceID{JREG75_CMDCHECMOD,_GetInst()}}
oCCcmdchecmod:HyperLabel := HyperLabel{#cmdchecmod,"Checar",NULL_STRING,NULL_STRING}

oCCcmdescmod := PushButton{self,ResourceID{JREG75_CMDESCMOD,_GetInst()}}
oCCcmdescmod:HyperLabel := HyperLabel{#cmdescmod,"..",NULL_STRING,NULL_STRING}

self:Caption := "Registro 75 Produtos"
self:HyperLabel := HyperLabel{#jreg75,"Registro 75 Produtos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTIPO := DataColumn{padrao_char_02{}}
oDBTIPO:Width := 6
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "Tipo:"
oDBTIPO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBTIPO)

oDBDATAINI := DataColumn{date_field{}}
oDBDATAINI:Width := 9
oDBDATAINI:HyperLabel := oDCDATAINI:HyperLabel 
oDBDATAINI:Caption := "Dataini:"
self:Browser:AddColumn(oDBDATAINI)

oDBDATAFIM := DataColumn{date_field{}}
oDBDATAFIM:Width := 9
oDBDATAFIM:HyperLabel := oDCDATAFIM:HyperLabel 
oDBDATAFIM:Caption := "Datafim:"
self:Browser:AddColumn(oDBDATAFIM)

oDBCODIGORED := DataColumn{padrao_char_14{}}
oDBCODIGORED:Width := 11
oDBCODIGORED:HyperLabel := oDCCODIGORED:HyperLabel 
oDBCODIGORED:Caption := "Codigored:"
self:Browser:AddColumn(oDBCODIGORED)

oDBCLASSIPI := DataColumn{padrao_char_14{}}
oDBCLASSIPI:Width := 10
oDBCLASSIPI:HyperLabel := oDCCLASSIPI:HyperLabel 
oDBCLASSIPI:Caption := "Classipi:"
self:Browser:AddColumn(oDBCLASSIPI)

oDBDESCRICAO := DataColumn{padrao_char_55{}}
oDBDESCRICAO:Width := 11
oDBDESCRICAO:HyperLabel := oDCDESCRICAO:HyperLabel 
oDBDESCRICAO:Caption := "Descricao:"
self:Browser:AddColumn(oDBDESCRICAO)

oDBUNID := DataColumn{padrao_char_02{}}
oDBUNID:Width := 6
oDBUNID:HyperLabel := oDCUNID:HyperLabel 
oDBUNID:Caption := "Unid:"
self:Browser:AddColumn(oDBUNID)

oDBSITUACAO := DataColumn{padrao_num_03{}}
oDBSITUACAO:Width := 10
oDBSITUACAO:HyperLabel := oDCSITUACAO:HyperLabel 
oDBSITUACAO:Caption := "Situacao:"
self:Browser:AddColumn(oDBSITUACAO)

oDBTIPOENT := DataColumn{padrao_char_01{}}
oDBTIPOENT:Width := 9
oDBTIPOENT:HyperLabel := oDCTIPOENT:HyperLabel 
oDBTIPOENT:Caption := "Tipoent:"
self:Browser:AddColumn(oDBTIPOENT)

oDBIPI := DataColumn{padrao_num_05_2{}}
oDBIPI:Width := 5
oDBIPI:HyperLabel := oDCIPI:HyperLabel 
oDBIPI:Caption := "Ipi:"
self:Browser:AddColumn(oDBIPI)

oDBICM := DataColumn{padrao_num_05_2{}}
oDBICM:Width := 5
oDBICM:HyperLabel := oDCICM:HyperLabel 
oDBICM:Caption := "Icm:"
self:Browser:AddColumn(oDBICM)

oDBREDICM := DataColumn{padrao_num_05_2{}}
oDBREDICM:Width := 8
oDBREDICM:HyperLabel := oDCREDICM:HyperLabel 
oDBREDICM:Caption := "Redicm:"
self:Browser:AddColumn(oDBREDICM)

oDBSUBICM := DataColumn{padrao_num_12_2{}}
oDBSUBICM:Width := 8
oDBSUBICM:HyperLabel := oDCSUBICM:HyperLabel 
oDBSUBICM:Caption := "Subicm:"
self:Browser:AddColumn(oDBSUBICM)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access IPI() 
return self:FieldGet(#IPI)


assign IPI(uValue) 
self:FieldPut(#IPI, uValue)
return IPI := uValue


METHOD pornum( ) 
	SELF:keyfind()

METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   FabCenterWindow( SELF )
 RETURN SELF

access REDICM() 
return self:FieldGet(#REDICM)


assign REDICM(uValue) 
self:FieldPut(#REDICM, uValue)
return REDICM := uValue


access SITUACAO() 
return self:FieldGet(#SITUACAO)


assign SITUACAO(uValue) 
self:FieldPut(#SITUACAO, uValue)
return SITUACAO := uValue


access SUBICM() 
return self:FieldGet(#SUBICM)


assign SUBICM(uValue) 
self:FieldPut(#SUBICM, uValue)
return SUBICM := uValue


METHOD Timer() 
   SELF:SERVER:COMMIT()	
	

access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


access TIPOENT() 
return self:FieldGet(#TIPOENT)


assign TIPOENT(uValue) 
self:FieldPut(#TIPOENT, uValue)
return TIPOENT := uValue


access UNID() 
return self:FieldGet(#UNID)


assign UNID(uValue) 
self:FieldPut(#UNID, uValue)
return UNID := uValue


END CLASS
