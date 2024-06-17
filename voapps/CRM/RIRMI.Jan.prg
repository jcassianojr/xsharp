#region DEFINES
STATIC DEFINE JRIMI_ENCO := 104 
STATIC DEFINE JRIMI_ESPE := 103 
STATIC DEFINE JRIMI_FT5 := 110 
STATIC DEFINE JRIMI_FT6 := 112 
STATIC DEFINE JRIMI_ITEM := 100 
STATIC DEFINE JRIMI_LAUDO := 105 
STATIC DEFINE JRIMI_PULAAPU := 116 
STATIC DEFINE JRIMI_QTITEM := 101 
STATIC DEFINE JRIMI_RIRM := 111 
STATIC DEFINE JRIMI_SC_ENCO := 115 
STATIC DEFINE JRIMI_SC_ESPE := 114 
STATIC DEFINE JRIMI_SC_ITEM := 108 
STATIC DEFINE JRIMI_SC_ITEM1 := 117 
STATIC DEFINE JRIMI_SC_QTITEM := 109 
STATIC DEFINE JRIMI_SC_RIRM := 107 
STATIC DEFINE JRIMI_SC_RIRM1 := 106 
STATIC DEFINE JRIMI_TIPA := 113 
STATIC DEFINE JRIMI_UNIITEM := 102 
#endregion

class JRIMI inherit DATAWINDOW 

	PROTECT oDBRIRM as DataColumn
	PROTECT oDBITEM as DataColumn
	PROTECT oDBTIPA as DataColumn
	PROTECT oDBQTITEM as DataColumn
	PROTECT oDBUNIITEM as DataColumn
	PROTECT oDBESPE as DataColumn
	PROTECT oDBENCO as DataColumn
	PROTECT oDBLAUDO as DataColumn
	PROTECT oDBPULAAPU as DataColumn
	protect oDCITEM as RIGHTSLE
	protect oDCQTITEM as RIGHTSLE
	protect oDCUNIITEM as SINGLELINEEDIT
	protect oDCESPE as SINGLELINEEDIT
	protect oDCENCO as SINGLELINEEDIT
	protect oDCLAUDO as SINGLELINEEDIT
	protect oDCSC_RIRM1 as FIXEDTEXT
	protect oDCSC_RIRM as FIXEDTEXT
	protect oDCSC_ITEM as FIXEDTEXT
	protect oDCSC_QTITEM as FIXEDTEXT
	protect oDCFT5 as FIXEDTEXT
	protect oDCRIRM as SINGLELINEEDIT
	protect oDCFT6 as FIXEDTEXT
	protect oDCTIPA as COMBOBOX
	protect oDCSC_ESPE as FIXEDTEXT
	protect oDCSC_ENCO as FIXEDTEXT
	protect oDCPULAAPU as SINGLELINEEDIT
	protect oDCSC_ITEM1 as FIXEDTEXT
// 	instance ITEM 
// 	instance QTITEM 
// 	instance UNIITEM 
// 	instance ESPE 
// 	instance ENCO 
// 	instance LAUDO 
// 	instance RIRM 
// 	instance TIPA 
// 	instance PULAAPU 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD append 
alert("Somente estão Disponiveis os Itens Cadastrados Ensaio")
//self:server:SUSPENDNOTIFICATION()
//SUPER:APPEND() //Chamando super evitar o loop to metodo
//self:server:RIRM:=nRIRM
//self:server:commit()
//self:server:resetnotification()
//self:server:notify(notifyappend) //Contas do Livro

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


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRIMI",_GetInst()},iCtlID)

oDCITEM := rightSle{self,ResourceID{JRIMI_ITEM,_GetInst()}}
oDCITEM:FieldSpec := PADRAO_NUM_03{}
oDCITEM:HyperLabel := HyperLabel{#ITEM,"Item:",NULL_STRING,"RIRMI_ITEM"}

oDCQTITEM := rightSle{self,ResourceID{JRIMI_QTITEM,_GetInst()}}
oDCQTITEM:FieldSpec := PADRAO_NUM_12_2{}
oDCQTITEM:HyperLabel := HyperLabel{#QTITEM,"Qtdde",NULL_STRING,"RIRMI_QTITEM"}

oDCUNIITEM := SingleLineEdit{self,ResourceID{JRIMI_UNIITEM,_GetInst()}}
oDCUNIITEM:FieldSpec := PADRAO_CHAR_04{}
oDCUNIITEM:HyperLabel := HyperLabel{#UNIITEM,"Unid.",NULL_STRING,NULL_STRING}

oDCESPE := SingleLineEdit{self,ResourceID{JRIMI_ESPE,_GetInst()}}
oDCESPE:FieldSpec := PADRAO_CHAR_60{}
oDCESPE:HyperLabel := HyperLabel{#ESPE,"Especificado:",NULL_STRING,"RIRMI_ESPE"}

oDCENCO := SingleLineEdit{self,ResourceID{JRIMI_ENCO,_GetInst()}}
oDCENCO:FieldSpec := PADRAO_CHAR_40{}
oDCENCO:HyperLabel := HyperLabel{#ENCO,"Encontrado",NULL_STRING,"RIRMI_ENCO"}

oDCLAUDO := SingleLineEdit{self,ResourceID{JRIMI_LAUDO,_GetInst()}}
oDCLAUDO:FieldSpec := PADRAO_CHAR_01{}
oDCLAUDO:HyperLabel := HyperLabel{#LAUDO,"Laudo",NULL_STRING,"RIRMI_RIRM"}

oDCSC_RIRM1 := FixedText{self,ResourceID{JRIMI_SC_RIRM1,_GetInst()}}
oDCSC_RIRM1:HyperLabel := HyperLabel{#SC_RIRM1,"Laudo:  (A)provado (C)ondicional (R)ejeitado (E)sperando Resultado",NULL_STRING,NULL_STRING}

oDCSC_RIRM := FixedText{self,ResourceID{JRIMI_SC_RIRM,_GetInst()}}
oDCSC_RIRM:HyperLabel := HyperLabel{#SC_RIRM,"Rirm:",NULL_STRING,NULL_STRING}

oDCSC_ITEM := FixedText{self,ResourceID{JRIMI_SC_ITEM,_GetInst()}}
oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM,"Item:",NULL_STRING,NULL_STRING}

oDCSC_QTITEM := FixedText{self,ResourceID{JRIMI_SC_QTITEM,_GetInst()}}
oDCSC_QTITEM:HyperLabel := HyperLabel{#SC_QTITEM,"Quantidade",NULL_STRING,NULL_STRING}

oDCFT5 := FixedText{self,ResourceID{JRIMI_FT5,_GetInst()}}
oDCFT5:HyperLabel := HyperLabel{#FT5,"Unidade",NULL_STRING,NULL_STRING}

oDCRIRM := SingleLineEdit{self,ResourceID{JRIMI_RIRM,_GetInst()}}
oDCRIRM:FieldSpec := PADRAO_NUM_08{}
oDCRIRM:HyperLabel := HyperLabel{#RIRM,"Rirm:",NULL_STRING,"RIRMI_RIRM"}

oDCFT6 := FixedText{self,ResourceID{JRIMI_FT6,_GetInst()}}
oDCFT6:HyperLabel := HyperLabel{#FT6,"Descrição",NULL_STRING,NULL_STRING}

oDCTIPA := combobox{self,ResourceID{JRIMI_TIPA,_GetInst()}}
oDCTIPA:FieldSpec := PADRAO_CHAR_03{}
oDCTIPA:HyperLabel := HyperLabel{#TIPA,"Tipo",NULL_STRING,NULL_STRING}

oDCSC_ESPE := FixedText{self,ResourceID{JRIMI_SC_ESPE,_GetInst()}}
oDCSC_ESPE:HyperLabel := HyperLabel{#SC_ESPE,"Especificado:",NULL_STRING,NULL_STRING}

oDCSC_ENCO := FixedText{self,ResourceID{JRIMI_SC_ENCO,_GetInst()}}
oDCSC_ENCO:HyperLabel := HyperLabel{#SC_ENCO,"Encontrado:",NULL_STRING,NULL_STRING}

oDCPULAAPU := SingleLineEdit{self,ResourceID{JRIMI_PULAAPU,_GetInst()}}
oDCPULAAPU:FieldSpec := PADRAO_CHAR_01{}
oDCPULAAPU:HyperLabel := HyperLabel{#PULAAPU,"Apu",NULL_STRING,"RIRMI_ITEM"}

oDCSC_ITEM1 := FixedText{self,ResourceID{JRIMI_SC_ITEM1,_GetInst()}}
oDCSC_ITEM1:HyperLabel := HyperLabel{#SC_ITEM1,"Apurar",NULL_STRING,NULL_STRING}

self:Caption := "Itens Inspeção e Ensaio Recebimento de Material"
self:HyperLabel := HyperLabel{#JRIMI,"Itens Inspeção e Ensaio Recebimento de Material",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRIRM := DataColumn{PADRAO_NUM_08{}}
oDBRIRM:Width := 6
oDBRIRM:HyperLabel := oDCRIRM:HyperLabel 
oDBRIRM:Caption := "Rirm:"
self:Browser:AddColumn(oDBRIRM)

oDBITEM := DataColumn{PADRAO_NUM_03{}}
oDBITEM:Width := 6
oDBITEM:HyperLabel := oDCITEM:HyperLabel 
oDBITEM:Caption := "Item:"
self:Browser:AddColumn(oDBITEM)

oDBTIPA := DataColumn{PADRAO_CHAR_03{}}
oDBTIPA:Width := 8
oDBTIPA:HyperLabel := oDCTIPA:HyperLabel 
oDBTIPA:Caption := "Tipo"
self:Browser:AddColumn(oDBTIPA)

oDBQTITEM := DataColumn{PADRAO_NUM_12_2{}}
oDBQTITEM:Width := 8
oDBQTITEM:HyperLabel := oDCQTITEM:HyperLabel 
oDBQTITEM:Caption := "Qtdde"
self:Browser:AddColumn(oDBQTITEM)

oDBUNIITEM := DataColumn{PADRAO_CHAR_04{}}
oDBUNIITEM:Width := 7
oDBUNIITEM:HyperLabel := oDCUNIITEM:HyperLabel 
oDBUNIITEM:Caption := "Unid."
self:Browser:AddColumn(oDBUNIITEM)

oDBESPE := DataColumn{PADRAO_CHAR_60{}}
oDBESPE:Width := 13
oDBESPE:HyperLabel := oDCESPE:HyperLabel 
oDBESPE:Caption := "Especificado:"
self:Browser:AddColumn(oDBESPE)

oDBENCO := DataColumn{PADRAO_CHAR_40{}}
oDBENCO:Width := 17
oDBENCO:HyperLabel := oDCENCO:HyperLabel 
oDBENCO:Caption := "Encontrado"
self:Browser:AddColumn(oDBENCO)

oDBLAUDO := DataColumn{PADRAO_CHAR_01{}}
oDBLAUDO:Width := 9
oDBLAUDO:HyperLabel := oDCLAUDO:HyperLabel 
oDBLAUDO:Caption := "Laudo"
self:Browser:AddColumn(oDBLAUDO)

oDBPULAAPU := DataColumn{PADRAO_CHAR_01{}}
oDBPULAAPU:Width := 5
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


access QTITEM() 
return self:FieldGet(#QTITEM)


assign QTITEM(uValue) 
self:FieldPut(#QTITEM, uValue)
return QTITEM := uValue


access RIRM() 
return self:FieldGet(#RIRM)


assign RIRM(uValue) 
self:FieldPut(#RIRM, uValue)
return RIRM := uValue


access TIPA() 
return self:FieldGet(#TIPA)


assign TIPA(uValue) 
self:FieldPut(#TIPA, uValue)
return TIPA := uValue


access UNIITEM() 
return self:FieldGet(#UNIITEM)


assign UNIITEM(uValue) 
self:FieldPut(#UNIITEM, uValue)
return UNIITEM := uValue


END CLASS
