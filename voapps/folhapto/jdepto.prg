#region DEFINES
STATIC DEFINE JDEPTO_CCUSTO := 114 
STATIC DEFINE JDEPTO_CMDBCO := 117 
STATIC DEFINE JDEPTO_CMDBCO1 := 116 
STATIC DEFINE JDEPTO_DEPTO := 108 
STATIC DEFINE JDEPTO_ESCUNID := 119 
STATIC DEFINE JDEPTO_MODIRETA := 118 
STATIC DEFINE JDEPTO_NOME := 111 
STATIC DEFINE JDEPTO_NOMEC := 113 
STATIC DEFINE JDEPTO_NOMER := 112 
STATIC DEFINE JDEPTO_SC_CCUSTO := 106 
STATIC DEFINE JDEPTO_SC_DEPTO := 100 
STATIC DEFINE JDEPTO_SC_NOME := 103 
STATIC DEFINE JDEPTO_SC_NOMEC := 105 
STATIC DEFINE JDEPTO_SC_NOMER := 104 
STATIC DEFINE JDEPTO_SC_SECAO := 101 
STATIC DEFINE JDEPTO_SC_SETOR := 102 
STATIC DEFINE JDEPTO_SC_UNIFUN := 107 
STATIC DEFINE JDEPTO_SECAO := 109 
STATIC DEFINE JDEPTO_SETOR := 110 
STATIC DEFINE JDEPTO_UNIFUN := 115 
#endregion

class jdepto inherit MYDataWindow 

	PROTECT oDBDEPTO as DataColumn
	PROTECT oDBSECAO as DataColumn
	PROTECT oDBSETOR as DataColumn
	PROTECT oDBNOMER as DataColumn
	PROTECT oDBCCUSTO as DataColumn
	PROTECT oDBUNIFUN as DataColumn
	protect oDCSC_DEPTO as FIXEDTEXT
	protect oDCSC_SECAO as FIXEDTEXT
	protect oDCSC_SETOR as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_NOMER as FIXEDTEXT
	protect oDCSC_NOMEC as FIXEDTEXT
	protect oDCSC_CCUSTO as FIXEDTEXT
	protect oDCSC_UNIFUN as FIXEDTEXT
	protect oDCDEPTO as SINGLELINEEDIT
	protect oDCSECAO as SINGLELINEEDIT
	protect oDCSETOR as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCNOMER as SINGLELINEEDIT
	protect oDCNOMEC as SINGLELINEEDIT
	protect oDCCCUSTO as SINGLELINEEDIT
	protect oDCUNIFUN as SINGLELINEEDIT
	protect oCCcmdbco1 as PUSHBUTTON
	protect oCCcmdbco as PUSHBUTTON
	protect oDCMODIRETA as SINGLELINEEDIT
	protect oCCescunid as PUSHBUTTON
// 	instance DEPTO 
// 	instance SECAO 
// 	instance SETOR 
// 	instance NOME 
// 	instance NOMER 
// 	instance NOMEC 
// 	instance CCUSTO 
// 	instance UNIFUN 
// 	instance MODIRETA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CCUSTO() 
return self:FieldGet(#CCUSTO)


assign CCUSTO(uValue) 
self:FieldPut(#CCUSTO, uValue)
return CCUSTO := uValue


METHOD cmdbco( ) 
		SELF:server:FIELDPUT("MODIRETA",SIMNAO(SELF:SERVER:FIELDGET("MODIRETA"),{"S","N"," "}))	

METHOD cmdbco1( ) 
	SELF:server:FIELDPUT("MODIRETA",SIMNAO(SELF:SERVER:FIELDGET("MODIRETA"),{"D","I","A","C"," "}))	

access DEPTO() 
return self:FieldGet(#DEPTO)


assign DEPTO(uValue) 
self:FieldPut(#DEPTO, uValue)
return DEPTO := uValue


METHOD escunid( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"UNID.DBF"}
oESC:SHOW()	
IF Oesc:lok
   SELF:SERVER:FIELDPUT("UNIFUN",oESC:CODIGO)
ENDIF				

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jdepto",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_DEPTO := FixedText{self,ResourceID{JDEPTO_SC_DEPTO,_GetInst()}}
oDCSC_DEPTO:HyperLabel := HyperLabel{#SC_DEPTO,"Depto:",NULL_STRING,NULL_STRING}

oDCSC_SECAO := FixedText{self,ResourceID{JDEPTO_SC_SECAO,_GetInst()}}
oDCSC_SECAO:HyperLabel := HyperLabel{#SC_SECAO,"Secao:",NULL_STRING,NULL_STRING}

oDCSC_SETOR := FixedText{self,ResourceID{JDEPTO_SC_SETOR,_GetInst()}}
oDCSC_SETOR:HyperLabel := HyperLabel{#SC_SETOR,"Setor:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JDEPTO_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_NOMER := FixedText{self,ResourceID{JDEPTO_SC_NOMER,_GetInst()}}
oDCSC_NOMER:HyperLabel := HyperLabel{#SC_NOMER,"Reduzido",NULL_STRING,NULL_STRING}

oDCSC_NOMEC := FixedText{self,ResourceID{JDEPTO_SC_NOMEC,_GetInst()}}
oDCSC_NOMEC:HyperLabel := HyperLabel{#SC_NOMEC,"Cognome",NULL_STRING,NULL_STRING}

oDCSC_CCUSTO := FixedText{self,ResourceID{JDEPTO_SC_CCUSTO,_GetInst()}}
oDCSC_CCUSTO:HyperLabel := HyperLabel{#SC_CCUSTO,"Ccusto:",NULL_STRING,NULL_STRING}

oDCSC_UNIFUN := FixedText{self,ResourceID{JDEPTO_SC_UNIFUN,_GetInst()}}
oDCSC_UNIFUN:HyperLabel := HyperLabel{#SC_UNIFUN,"Unifun:",NULL_STRING,NULL_STRING}

oDCDEPTO := SingleLineEdit{self,ResourceID{JDEPTO_DEPTO,_GetInst()}}
oDCDEPTO:FieldSpec := PADRAO_NUM_04{}
oDCDEPTO:HyperLabel := HyperLabel{#DEPTO,"Depto:",NULL_STRING,"depto_DEPTO"}
oDCDEPTO:BackGround := aBrushes[1]

oDCSECAO := SingleLineEdit{self,ResourceID{JDEPTO_SECAO,_GetInst()}}
oDCSECAO:FieldSpec := PADRAO_NUM_03{}
oDCSECAO:HyperLabel := HyperLabel{#SECAO,"Secao:",NULL_STRING,"depto_SECAO"}
oDCSECAO:BackGround := aBrushes[1]

oDCSETOR := SingleLineEdit{self,ResourceID{JDEPTO_SETOR,_GetInst()}}
oDCSETOR:FieldSpec := PADRAO_NUM_03{}
oDCSETOR:HyperLabel := HyperLabel{#SETOR,"Setor:",NULL_STRING,"depto_SETOR"}
oDCSETOR:BackGround := aBrushes[1]

oDCNOME := SingleLineEdit{self,ResourceID{JDEPTO_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_char_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"depto_NOME"}

oDCNOMER := SingleLineEdit{self,ResourceID{JDEPTO_NOMER,_GetInst()}}
oDCNOMER:FieldSpec := PADRAO_char_25{}
oDCNOMER:HyperLabel := HyperLabel{#NOMER,"Nomer:",NULL_STRING,"depto_NOMER"}

oDCNOMEC := SingleLineEdit{self,ResourceID{JDEPTO_NOMEC,_GetInst()}}
oDCNOMEC:FieldSpec := PADRAO_char_15{}
oDCNOMEC:HyperLabel := HyperLabel{#NOMEC,"Nomec:",NULL_STRING,"depto_NOMEC"}

oDCCCUSTO := SingleLineEdit{self,ResourceID{JDEPTO_CCUSTO,_GetInst()}}
oDCCCUSTO:FieldSpec := PADRAO_NUM_06{}
oDCCCUSTO:HyperLabel := HyperLabel{#CCUSTO,"Ccusto:",NULL_STRING,"depto_CCUSTO"}

oDCUNIFUN := SingleLineEdit{self,ResourceID{JDEPTO_UNIFUN,_GetInst()}}
oDCUNIFUN:FieldSpec := PADRAO_char_10{}
oDCUNIFUN:HyperLabel := HyperLabel{#UNIFUN,"Unifun:",NULL_STRING,"depto_UNIFUN"}

oCCcmdbco1 := PushButton{self,ResourceID{JDEPTO_CMDBCO1,_GetInst()}}
oCCcmdbco1:HyperLabel := HyperLabel{#cmdbco1,"(D)ireta (I)ndireta (A)dministracao (C)omercial",NULL_STRING,NULL_STRING}

oCCcmdbco := PushButton{self,ResourceID{JDEPTO_CMDBCO,_GetInst()}}
oCCcmdbco:HyperLabel := HyperLabel{#cmdbco,"(S)im (N)ao ",NULL_STRING,NULL_STRING}

oDCMODIRETA := SingleLineEdit{self,ResourceID{JDEPTO_MODIRETA,_GetInst()}}
oDCMODIRETA:FieldSpec := PADRAO_CHAR_01{}
oDCMODIRETA:HyperLabel := HyperLabel{#MODIRETA,"Chapa:",NULL_STRING,"FO_PES_CHAPA"}
oDCMODIRETA:BackGround := aBrushes[1]
oDCMODIRETA:Font(aFonts[1], FALSE)

oCCescunid := PushButton{self,ResourceID{JDEPTO_ESCUNID,_GetInst()}}
oCCescunid:HyperLabel := HyperLabel{#escunid,NULL_STRING,NULL_STRING,NULL_STRING}
oCCescunid:Image := ICO_FIND{}

self:Caption := "Departamentos"
self:HyperLabel := HyperLabel{#jdepto,"Departamentos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDEPTO := DataColumn{PADRAO_NUM_04{}}
oDBDEPTO:Width := 7
oDBDEPTO:HyperLabel := oDCDEPTO:HyperLabel 
oDBDEPTO:Caption := "Depto:"
oDBDEPTO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDEPTO)

oDBSECAO := DataColumn{PADRAO_NUM_03{}}
oDBSECAO:Width := 7
oDBSECAO:HyperLabel := oDCSECAO:HyperLabel 
oDBSECAO:Caption := "Secao:"
oDBSECAO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSECAO)

oDBSETOR := DataColumn{PADRAO_NUM_03{}}
oDBSETOR:Width := 7
oDBSETOR:HyperLabel := oDCSETOR:HyperLabel 
oDBSETOR:Caption := "Setor:"
oDBSETOR:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSETOR)

oDBNOMER := DataColumn{PADRAO_char_25{}}
oDBNOMER:Width := 13
oDBNOMER:HyperLabel := oDCNOMER:HyperLabel 
oDBNOMER:Caption := "Nomer:"
self:Browser:AddColumn(oDBNOMER)

oDBCCUSTO := DataColumn{PADRAO_NUM_06{}}
oDBCCUSTO:Width := 8
oDBCCUSTO:HyperLabel := oDCCCUSTO:HyperLabel 
oDBCCUSTO:Caption := "Ccusto:"
self:Browser:AddColumn(oDBCCUSTO)

oDBUNIFUN := DataColumn{PADRAO_char_10{}}
oDBUNIFUN:Width := 16
oDBUNIFUN:HyperLabel := oDCUNIFUN:HyperLabel 
oDBUNIFUN:Caption := "Unifun:"
self:Browser:AddColumn(oDBUNIFUN)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MODIRETA() 
return self:FieldGet(#MODIRETA)


assign MODIRETA(uValue) 
self:FieldPut(#MODIRETA, uValue)
return MODIRETA := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access NOMEC() 
return self:FieldGet(#NOMEC)


assign NOMEC(uValue) 
self:FieldPut(#NOMEC, uValue)
return NOMEC := uValue


access NOMER() 
return self:FieldGet(#NOMER)


assign NOMER(uValue) 
self:FieldPut(#NOMER, uValue)
return NOMER := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


access SECAO() 
return self:FieldGet(#SECAO)


assign SECAO(uValue) 
self:FieldPut(#SECAO, uValue)
return SECAO := uValue


access SETOR() 
return self:FieldGet(#SETOR)


assign SETOR(uValue) 
self:FieldPut(#SETOR, uValue)
return SETOR := uValue


access UNIFUN() 
return self:FieldGet(#UNIFUN)


assign UNIFUN(uValue) 
self:FieldPut(#UNIFUN, uValue)
return UNIFUN := uValue


END CLASS
