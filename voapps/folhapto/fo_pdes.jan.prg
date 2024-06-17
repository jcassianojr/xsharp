#region DEFINES
STATIC DEFINE JFO_PDES_BUSCANUM := 110 
STATIC DEFINE JFO_PDES_CMDMAIS := 113 
STATIC DEFINE JFO_PDES_CMDMENOS := 112 
STATIC DEFINE JFO_PDES_CMDORDENAR := 114 
STATIC DEFINE JFO_PDES_CONTA := 106 
STATIC DEFINE JFO_PDES_DATA := 109 
STATIC DEFINE JFO_PDES_ESCFUN := 111 
STATIC DEFINE JFO_PDES_HORAS := 107 
STATIC DEFINE JFO_PDES_NUMERO := 105 
STATIC DEFINE JFO_PDES_OBS := 108 
STATIC DEFINE JFO_PDES_SC_CONTA := 102 
STATIC DEFINE JFO_PDES_SC_DATA := 101 
STATIC DEFINE JFO_PDES_SC_HORAS := 103 
STATIC DEFINE JFO_PDES_SC_NUMERO := 100 
STATIC DEFINE JFO_PDES_SC_OBS := 104 
#endregion

PARTIAL class jfo_pdes inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBCONTA as DataColumn
	PROTECT oDBHORAS as DataColumn
	PROTECT oDBOBS as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_CONTA as FIXEDTEXT
	protect oDCSC_HORAS as FIXEDTEXT
	protect oDCSC_OBS as FIXEDTEXT
	protect oDCNUMERO as RIGHTSLE
	protect oDCCONTA as RIGHTSLE
	protect oDCHORAS as RIGHTSLE
	protect oDCOBS as SINGLELINEEDIT
	protect oDCDATA as DATETIMEPICKER
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCescFUN as PUSHBUTTON
	protect oCCcmdmenos as PUSHBUTTON
	protect oCCcmdmais as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
// 	instance NUMERO 
// 	instance CONTA 
// 	instance HORAS 
// 	instance OBS 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CONTA() 
return self:FieldGet(#CONTA)


assign CONTA(uValue) 
self:FieldPut(#CONTA, uValue)
return CONTA := uValue


access HORAS() 
return self:FieldGet(#HORAS)


assign HORAS(uValue) 
self:FieldPut(#HORAS, uValue)
return HORAS := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jfo_pdes",_GetInst()},iCtlID)

oDCSC_NUMERO := FixedText{self,ResourceID{JFO_PDES_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JFO_PDES_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_CONTA := FixedText{self,ResourceID{JFO_PDES_SC_CONTA,_GetInst()}}
oDCSC_CONTA:HyperLabel := HyperLabel{#SC_CONTA,"Conta:",NULL_STRING,NULL_STRING}

oDCSC_HORAS := FixedText{self,ResourceID{JFO_PDES_SC_HORAS,_GetInst()}}
oDCSC_HORAS:HyperLabel := HyperLabel{#SC_HORAS,"Horas:",NULL_STRING,NULL_STRING}

oDCSC_OBS := FixedText{self,ResourceID{JFO_PDES_SC_OBS,_GetInst()}}
oDCSC_OBS:HyperLabel := HyperLabel{#SC_OBS,"Obs:",NULL_STRING,NULL_STRING}

oDCNUMERO := rightSle{self,ResourceID{JFO_PDES_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"FO_PDES_NUMERO"}

oDCCONTA := rightSle{self,ResourceID{JFO_PDES_CONTA,_GetInst()}}
oDCCONTA:FieldSpec := PADRAO_NUM_04{}
oDCCONTA:HyperLabel := HyperLabel{#CONTA,"Conta:",NULL_STRING,"FO_PDES_CONTA"}

oDCHORAS := rightSle{self,ResourceID{JFO_PDES_HORAS,_GetInst()}}
oDCHORAS:FieldSpec := PADRAO_NUM_06_2{}
oDCHORAS:HyperLabel := HyperLabel{#HORAS,"Horas:",NULL_STRING,"FO_PDES_HORAS"}

oDCOBS := SingleLineEdit{self,ResourceID{JFO_PDES_OBS,_GetInst()}}
oDCOBS:FieldSpec := PADRAO_CHAR_40{}
oDCOBS:HyperLabel := HyperLabel{#OBS,"Obs:",NULL_STRING,"FO_PDES_OBS"}

oDCDATA := DateTimePicker{self,ResourceID{JFO_PDES_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JFO_PDES_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCescFUN := PushButton{self,ResourceID{JFO_PDES_ESCFUN,_GetInst()}}
oCCescFUN:HyperLabel := HyperLabel{#escFUN,"...",NULL_STRING,NULL_STRING}

oCCcmdmenos := PushButton{self,ResourceID{JFO_PDES_CMDMENOS,_GetInst()}}
oCCcmdmenos:HyperLabel := HyperLabel{#cmdmenos,"-",NULL_STRING,NULL_STRING}

oCCcmdmais := PushButton{self,ResourceID{JFO_PDES_CMDMAIS,_GetInst()}}
oCCcmdmais:HyperLabel := HyperLabel{#cmdmais,"+",NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JFO_PDES_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Credito/Debitos Contas"
self:HyperLabel := HyperLabel{#jfo_pdes,"Credito/Debitos Contas",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 10
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 11
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := ""
self:Browser:AddColumn(oDBDATA)

oDBCONTA := DataColumn{PADRAO_NUM_04{}}
oDBCONTA:Width := 7
oDBCONTA:HyperLabel := oDCCONTA:HyperLabel 
oDBCONTA:Caption := "Conta:"
self:Browser:AddColumn(oDBCONTA)

oDBHORAS := DataColumn{PADRAO_NUM_06_2{}}
oDBHORAS:Width := 7
oDBHORAS:HyperLabel := oDCHORAS:HyperLabel 
oDBHORAS:Caption := "Horas:"
self:Browser:AddColumn(oDBHORAS)

oDBOBS := DataColumn{PADRAO_CHAR_40{}}
oDBOBS:Width := 16
oDBOBS:HyperLabel := oDCOBS:HyperLabel 
oDBOBS:Caption := "Obs:"
self:Browser:AddColumn(oDBOBS)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access OBS() 
return self:FieldGet(#OBS)


assign OBS(uValue) 
self:FieldPut(#OBS, uValue)
return OBS := uValue


END CLASS
