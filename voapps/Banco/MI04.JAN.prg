#region DEFINES
STATIC DEFINE JMI04_BUSCANUM := 105 
STATIC DEFINE JMI04_CONTA := 102 
STATIC DEFINE JMI04_NOME := 103 
STATIC DEFINE JMI04_PORNUM := 104 
STATIC DEFINE JMI04_SC_CONTA := 100 
STATIC DEFINE JMI04_SC_NOME := 101 
#endregion

class JMI04 inherit MYDataWindow 

	PROTECT oDBCONTA as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCSC_CONTA as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCCONTA as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
// 	instance CONTA 
// 	instance NOME 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CONTA() 
return self:FieldGet(#CONTA)


assign CONTA(uValue) 
self:FieldPut(#CONTA, uValue)
return CONTA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMI04",_GetInst()},iCtlID)

oDCSC_CONTA := FixedText{self,ResourceID{JMI04_SC_CONTA,_GetInst()}}
oDCSC_CONTA:HyperLabel := HyperLabel{#SC_CONTA,"Conta:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JMI04_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCCONTA := SingleLineEdit{self,ResourceID{JMI04_CONTA,_GetInst()}}
oDCCONTA:FieldSpec := padrao_char_11{}
oDCCONTA:HyperLabel := HyperLabel{#CONTA,"Conta:",NULL_STRING,"MI04_CONTA"}

oDCNOME := SingleLineEdit{self,ResourceID{JMI04_NOME,_GetInst()}}
oDCNOME:FieldSpec := padrao_char_50{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"MI04_NOME"}

oCCpornum := PushButton{self,ResourceID{JMI04_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscanum := PushButton{self,ResourceID{JMI04_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Codigos de Despesas"
self:HyperLabel := HyperLabel{#JMI04,"Codigos de Despesas",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCONTA := DataColumn{padrao_char_11{}}
oDBCONTA:Width := 7
oDBCONTA:HyperLabel := oDCCONTA:HyperLabel 
oDBCONTA:Caption := "Conta:"
self:Browser:AddColumn(oDBCONTA)

oDBNOME := DataColumn{padrao_char_50{}}
oDBNOME:Width := 61
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


END CLASS
