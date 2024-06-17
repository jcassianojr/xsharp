#region DEFINES
STATIC DEFINE JMF02_AGENCIA := 102 
STATIC DEFINE JMF02_BUSCANUM := 111 
STATIC DEFINE JMF02_COGNAG := 101 
STATIC DEFINE JMF02_CONTA := 103 
STATIC DEFINE JMF02_NRCONTA := 109 
STATIC DEFINE JMF02_NUMERO := 100 
STATIC DEFINE JMF02_PORNUM := 110 
STATIC DEFINE JMF02_SC_AGENCIA := 107 
STATIC DEFINE JMF02_SC_BANCO := 105 
STATIC DEFINE JMF02_SC_COGNOME := 106 
STATIC DEFINE JMF02_SC_CONTA := 108 
STATIC DEFINE JMF02_SC_NRCONTA := 104 
#endregion

class JMF02 inherit MYDataWindow 

	PROTECT oDBNRCONTA as DataColumn
	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCOGNAG as DataColumn
	PROTECT oDBAGENCIA as DataColumn
	PROTECT oDBCONTA as DataColumn
	protect oDCNUMERO as RIGHTSLE
	protect oDCCOGNAG as SINGLELINEEDIT
	protect oDCAGENCIA as SINGLELINEEDIT
	protect oDCCONTA as SINGLELINEEDIT
	protect oDCSC_NRCONTA as FIXEDTEXT
	protect oDCSC_BANCO as FIXEDTEXT
	protect oDCSC_COGNOME as FIXEDTEXT
	protect oDCSC_AGENCIA as FIXEDTEXT
	protect oDCSC_CONTA as FIXEDTEXT
	protect oDCNRCONTA as SINGLELINEEDIT
	protect oCCpornum as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
// 	instance NUMERO 
// 	instance COGNAG 
// 	instance AGENCIA 
// 	instance CONTA 
// 	instance NRCONTA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AGENCIA() 
return self:FieldGet(#AGENCIA)


assign AGENCIA(uValue) 
self:FieldPut(#AGENCIA, uValue)
return AGENCIA := uValue


access COGNAG() 
return self:FieldGet(#COGNAG)


assign COGNAG(uValue) 
self:FieldPut(#COGNAG, uValue)
return COGNAG := uValue


access CONTA() 
return self:FieldGet(#CONTA)


assign CONTA(uValue) 
self:FieldPut(#CONTA, uValue)
return CONTA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMF02",_GetInst()},iCtlID)

oDCNUMERO := rightSle{self,ResourceID{JMF02_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_05{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Banco:",NULL_STRING,"BB01_BANCO"}

oDCCOGNAG := SingleLineEdit{self,ResourceID{JMF02_COGNAG,_GetInst()}}
oDCCOGNAG:FieldSpec := padrao_char_12{}
oDCCOGNAG:HyperLabel := HyperLabel{#COGNAG,"Cognome:",NULL_STRING,"BB01_COGNOME"}

oDCAGENCIA := SingleLineEdit{self,ResourceID{JMF02_AGENCIA,_GetInst()}}
oDCAGENCIA:FieldSpec := padrao_char_12{}
oDCAGENCIA:HyperLabel := HyperLabel{#AGENCIA,"Agencia:",NULL_STRING,"BB01_AGENCIA"}

oDCCONTA := SingleLineEdit{self,ResourceID{JMF02_CONTA,_GetInst()}}
oDCCONTA:FieldSpec := padrao_char_12{}
oDCCONTA:HyperLabel := HyperLabel{#CONTA,"Conta:",NULL_STRING,"BB01_CONTA"}

oDCSC_NRCONTA := FixedText{self,ResourceID{JMF02_SC_NRCONTA,_GetInst()}}
oDCSC_NRCONTA:HyperLabel := HyperLabel{#SC_NRCONTA,"Nrconta:",NULL_STRING,NULL_STRING}

oDCSC_BANCO := FixedText{self,ResourceID{JMF02_SC_BANCO,_GetInst()}}
oDCSC_BANCO:HyperLabel := HyperLabel{#SC_BANCO,"Banco/Fenaban",NULL_STRING,NULL_STRING}

oDCSC_COGNOME := FixedText{self,ResourceID{JMF02_SC_COGNOME,_GetInst()}}
oDCSC_COGNOME:HyperLabel := HyperLabel{#SC_COGNOME,"Cognome:",NULL_STRING,NULL_STRING}

oDCSC_AGENCIA := FixedText{self,ResourceID{JMF02_SC_AGENCIA,_GetInst()}}
oDCSC_AGENCIA:HyperLabel := HyperLabel{#SC_AGENCIA,"Agencia:",NULL_STRING,NULL_STRING}

oDCSC_CONTA := FixedText{self,ResourceID{JMF02_SC_CONTA,_GetInst()}}
oDCSC_CONTA:HyperLabel := HyperLabel{#SC_CONTA,"Conta:",NULL_STRING,NULL_STRING}

oDCNRCONTA := SingleLineEdit{self,ResourceID{JMF02_NRCONTA,_GetInst()}}
oDCNRCONTA:FieldSpec := padrao_num_05{}
oDCNRCONTA:HyperLabel := HyperLabel{#NRCONTA,"Nrconta:",NULL_STRING,"BB01_NRCONTA"}

oCCpornum := PushButton{self,ResourceID{JMF02_PORNUM,_GetInst()}}
oCCpornum:Image := ICO_AZ{}
oCCpornum:HyperLabel := HyperLabel{#pornum,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscanum := PushButton{self,ResourceID{JMF02_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Cadastro de Contas"
self:HyperLabel := HyperLabel{#JMF02,"Cadastro de Contas",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNRCONTA := DataColumn{padrao_num_05{}}
oDBNRCONTA:Width := 9
oDBNRCONTA:HyperLabel := oDCNRCONTA:HyperLabel 
oDBNRCONTA:Caption := "Nrconta:"
self:Browser:AddColumn(oDBNRCONTA)

oDBNUMERO := DataColumn{padrao_num_05{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Banco:"
self:Browser:AddColumn(oDBNUMERO)

oDBCOGNAG := DataColumn{padrao_char_12{}}
oDBCOGNAG:Width := 8
oDBCOGNAG:HyperLabel := oDCCOGNAG:HyperLabel 
oDBCOGNAG:Caption := "Cognome:"
self:Browser:AddColumn(oDBCOGNAG)

oDBAGENCIA := DataColumn{padrao_char_12{}}
oDBAGENCIA:Width := 9
oDBAGENCIA:HyperLabel := oDCAGENCIA:HyperLabel 
oDBAGENCIA:Caption := "Agencia:"
self:Browser:AddColumn(oDBAGENCIA)

oDBCONTA := DataColumn{padrao_char_12{}}
oDBCONTA:Width := 7
oDBCONTA:HyperLabel := oDCCONTA:HyperLabel 
oDBCONTA:Caption := "Conta:"
self:Browser:AddColumn(oDBCONTA)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NRCONTA() 
return self:FieldGet(#NRCONTA)


assign NRCONTA(uValue) 
self:FieldPut(#NRCONTA, uValue)
return NRCONTA := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


END CLASS
