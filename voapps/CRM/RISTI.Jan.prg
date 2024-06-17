#region DEFINES
STATIC DEFINE JRISTI_DATAENV := 104 
STATIC DEFINE JRISTI_DATALAU := 107 
STATIC DEFINE JRISTI_ENCO := 117 
STATIC DEFINE JRISTI_ESPE := 115 
STATIC DEFINE JRISTI_HORAENV := 106 
STATIC DEFINE JRISTI_ITEM := 113 
STATIC DEFINE JRISTI_LAUDO := 102 
STATIC DEFINE JRISTI_PULAAPU := 108 
STATIC DEFINE JRISTI_RIST := 112 
STATIC DEFINE JRISTI_SC_ENCO := 116 
STATIC DEFINE JRISTI_SC_ESPE := 114 
STATIC DEFINE JRISTI_SC_ITEM := 111 
STATIC DEFINE JRISTI_SC_ITEM1 := 100 
STATIC DEFINE JRISTI_SC_ITEM2 := 109 
STATIC DEFINE JRISTI_SC_RIRM1 := 103 
STATIC DEFINE JRISTI_SC_RIST := 110 
STATIC DEFINE JRISTI_SC_RIST1 := 105 
STATIC DEFINE JRISTI_TIPA := 101 
#endregion

class JRISTI inherit DATAWINDOW 

	PROTECT oDBRIST as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBTIPA as DataColumn
	PROTECT oDBESPE as DataColumn
	PROTECT oDBENCO as DataColumn
	PROTECT oDBLAUDO as DataColumn
	PROTECT oDBPULAAPU as DataColumn
	protect oDCSC_ITEM1 as FIXEDTEXT
	protect oDCTIPA as COMBOBOX
	protect oDCLAUDO as SINGLELINEEDIT
	protect oDCSC_RIRM1 as FIXEDTEXT
	protect oDCDATAENV as SINGLELINEEDIT
	protect oDCSC_RIST1 as FIXEDTEXT
	protect oDCHORAENV as SINGLELINEEDIT
	protect oDCDATALAU as SINGLELINEEDIT
	protect oDCPULAAPU as SINGLELINEEDIT
	protect oDCSC_ITEM2 as FIXEDTEXT
	protect oDCSC_RIST as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCRIST as SINGLELINEEDIT
	protect oDCITEM as RIGHTSLE
	protect oDCSC_ESPE as FIXEDTEXT
	protect oDCESPE as SINGLELINEEDIT
	protect oDCSC_ENCO as FIXEDTEXT
	protect oDCENCO as SINGLELINEEDIT
// 	instance TIPA 
// 	instance LAUDO 
// 	instance DATAENV 
// 	instance HORAENV 
// 	instance DATALAU 
// 	instance PULAAPU 
// 	instance RIST 
// 	instance ITEM 
// 	instance ESPE 
// 	instance ENCO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD append 
alert("Somente estão Disponiveis os Itens Cadastrados Ensaio")
//self:server:SUSPENDNOTIFICATION()
//SUPER:APPEND() //Chamando super evitar o loop to metodo
//self:server:RIST:=nRIST
//self:server:commit()
//self:server:resetnotification()
//self:server:notify(notifyappend) //Contas do Livro

access DATAENV() 
return self:FieldGet(#DATAENV)


assign DATAENV(uValue) 
self:FieldPut(#DATAENV, uValue)
return DATAENV := uValue


access DATALAU() 
return self:FieldGet(#DATALAU)


assign DATALAU(uValue) 
self:FieldPut(#DATALAU, uValue)
return DATALAU := uValue


access ENCO() 
return self:FieldGet(#ENCO)


assign ENCO(uValue) 
self:FieldPut(#ENCO, uValue)
return ENCO := uValue


access ESPE() 
return self:FieldGet(#ESPE)


assign ESPE(uValue) 
self:FieldPut(#ESPE, uValue)
return ESPE := uValue


access HORAENV() 
return self:FieldGet(#HORAENV)


assign HORAENV(uValue) 
self:FieldPut(#HORAENV, uValue)
return HORAENV := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRISTI",_GetInst()},iCtlID)

oDCSC_ITEM1 := FixedText{self,ResourceID{JRISTI_SC_ITEM1,_GetInst()}}
oDCSC_ITEM1:HyperLabel := HyperLabel{#SC_ITEM1,"Tipo",NULL_STRING,NULL_STRING}

oDCTIPA := combobox{self,ResourceID{JRISTI_TIPA,_GetInst()}}
oDCTIPA:FieldSpec := PADRAO_CHAR_03{}
oDCTIPA:HyperLabel := HyperLabel{#TIPA,"Tipo",NULL_STRING,NULL_STRING}

oDCLAUDO := SingleLineEdit{self,ResourceID{JRISTI_LAUDO,_GetInst()}}
oDCLAUDO:FieldSpec := PADRAO_CHAR_01{}
oDCLAUDO:HyperLabel := HyperLabel{#LAUDO,"Laudo",NULL_STRING,"RIRMI_RIRM"}

oDCSC_RIRM1 := FixedText{self,ResourceID{JRISTI_SC_RIRM1,_GetInst()}}
oDCSC_RIRM1:HyperLabel := HyperLabel{#SC_RIRM1,"Laudo:  (A)provado (C)ondicional (R)ejeitado (E)sperando Resultado",NULL_STRING,NULL_STRING}

oDCDATAENV := SingleLineEdit{self,ResourceID{JRISTI_DATAENV,_GetInst()}}
oDCDATAENV:FieldSpec := DATE_FIELD{}
oDCDATAENV:HyperLabel := HyperLabel{#DATAENV,"Rist:",NULL_STRING,"RISTI_RIST"}

oDCSC_RIST1 := FixedText{self,ResourceID{JRISTI_SC_RIST1,_GetInst()}}
oDCSC_RIST1:HyperLabel := HyperLabel{#SC_RIST1,"Envio",NULL_STRING,NULL_STRING}

oDCHORAENV := SingleLineEdit{self,ResourceID{JRISTI_HORAENV,_GetInst()}}
oDCHORAENV:FieldSpec := PADRAO_CHAR_05{}
oDCHORAENV:HyperLabel := HyperLabel{#HORAENV,"Rist:",NULL_STRING,"RISTI_RIST"}

oDCDATALAU := SingleLineEdit{self,ResourceID{JRISTI_DATALAU,_GetInst()}}
oDCDATALAU:FieldSpec := DATE_FIELD{}
oDCDATALAU:HyperLabel := HyperLabel{#DATALAU,"Rist:",NULL_STRING,"RISTI_RIST"}

oDCPULAAPU := SingleLineEdit{self,ResourceID{JRISTI_PULAAPU,_GetInst()}}
oDCPULAAPU:FieldSpec := PADRAO_CHAR_01{}
oDCPULAAPU:HyperLabel := HyperLabel{#PULAAPU,"Apu",NULL_STRING,"RIRMI_ITEM"}

oDCSC_ITEM2 := FixedText{self,ResourceID{JRISTI_SC_ITEM2,_GetInst()}}
oDCSC_ITEM2:HyperLabel := HyperLabel{#SC_ITEM2,"Apurar",NULL_STRING,NULL_STRING}

oDCSC_RIST := FixedText{self,ResourceID{JRISTI_SC_RIST,_GetInst()}}
oDCSC_RIST:HyperLabel := HyperLabel{#SC_RIST,"Rist:",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JRISTI_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCRIST := SingleLineEdit{self,ResourceID{JRISTI_RIST,_GetInst()}}
oDCRIST:FieldSpec := PADRAO_NUM_08{}
oDCRIST:HyperLabel := HyperLabel{#RIST,"Rist:",NULL_STRING,"RISTI_RIST"}

oDCITEM := rightSle{self,ResourceID{JRISTI_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_NUM_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"RISTI_ITEM"}

oDCSC_ESPE := FixedText{self,ResourceID{JRISTI_SC_ESPE,_GetInst()}}
oDCSC_ESPE:HyperLabel := HyperLabel{#SC_ESPE,"Espeficação:",NULL_STRING,NULL_STRING}

oDCESPE := SingleLineEdit{self,ResourceID{JRISTI_ESPE,_GetInst()}}
oDCESPE:FieldSpec := PADRAO_CHAR_60{}
oDCESPE:HyperLabel := HyperLabel{#ESPE,"Espeficado",NULL_STRING,"RISTI_ESPE"}

oDCSC_ENCO := FixedText{self,ResourceID{JRISTI_SC_ENCO,_GetInst()}}
oDCSC_ENCO:HyperLabel := HyperLabel{#SC_ENCO,"Encontrado:",NULL_STRING,NULL_STRING}

oDCENCO := SingleLineEdit{self,ResourceID{JRISTI_ENCO,_GetInst()}}
oDCENCO:FieldSpec := PADRAO_CHAR_45{}
oDCENCO:HyperLabel := HyperLabel{#ENCO,"Encontrado",NULL_STRING,"RISTI_ENCO"}

self:Caption := "Laudo:  (A)provado (C)ondicional (R)ejeitado (E)sperando Resultado"
self:HyperLabel := HyperLabel{#JRISTI,"Laudo:  (A)provado (C)ondicional (R)ejeitado (E)sperando Resultado",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRIST := DataColumn{PADRAO_NUM_08{}}
oDBRIST:Width := 6
oDBRIST:HyperLabel := oDCRIST:HyperLabel 
oDBRIST:Caption := "Rist:"
self:Browser:AddColumn(oDBRIST)

oDBITEM := DataColumn{PADRAO_NUM_03{}}
oDBITEM:Width := 6
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
self:Browser:AddColumn(oDBITEM)

oDBTIPA := DataColumn{PADRAO_CHAR_03{}}
oDBTIPA:Width := 10
oDBTIPA:HyperLabel := oDCTIPA:HyperLabel 
oDBTIPA:Caption := "Tipo"
self:Browser:AddColumn(oDBTIPA)

oDBESPE := DataColumn{PADRAO_CHAR_60{}}
oDBESPE:Width := 23
oDBESPE:HyperLabel := oDCESPE:HyperLabel 
oDBESPE:Caption := "Espeficado"
self:Browser:AddColumn(oDBESPE)

oDBENCO := DataColumn{PADRAO_CHAR_45{}}
oDBENCO:Width := 30
oDBENCO:HyperLabel := oDCENCO:HyperLabel 
oDBENCO:Caption := "Encontrado"
self:Browser:AddColumn(oDBENCO)

oDBLAUDO := DataColumn{PADRAO_CHAR_01{}}
oDBLAUDO:Width := 8
oDBLAUDO:HyperLabel := oDCLAUDO:HyperLabel 
oDBLAUDO:Caption := "Laudo"
self:Browser:AddColumn(oDBLAUDO)

oDBPULAAPU := DataColumn{PADRAO_CHAR_01{}}
oDBPULAAPU:Width := 6
oDBPULAAPU:HyperLabel := oDCPULAAPU:HyperLabel 
oDBPULAAPU:Caption := "Apu"
self:Browser:AddColumn(oDBPULAAPU)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


access LAUDO() 
return self:FieldGet(#LAUDO)


assign LAUDO(uValue) 
self:FieldPut(#LAUDO, uValue)
return LAUDO := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
//	 FabCenterWindow( SELF )

oDCTIPA:FillUsing(PEGCOMBO("CRMENS.DBF","NOME","CODIGO"))
	RETURN NIL


access PULAAPU() 
return self:FieldGet(#PULAAPU)


assign PULAAPU(uValue) 
self:FieldPut(#PULAAPU, uValue)
return PULAAPU := uValue


access RIST() 
return self:FieldGet(#RIST)


assign RIST(uValue) 
self:FieldPut(#RIST, uValue)
return RIST := uValue


access TIPA() 
return self:FieldGet(#TIPA)


assign TIPA(uValue) 
self:FieldPut(#TIPA, uValue)
return TIPA := uValue


END CLASS
