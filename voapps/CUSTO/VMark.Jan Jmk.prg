#region DEFINES
STATIC DEFINE JMK_BUSCACOD := 101 
STATIC DEFINE JMK_DESCRI := 106 
STATIC DEFINE JMK_PERCE := 107 
STATIC DEFINE JMK_PORCOD := 100 
STATIC DEFINE JMK_SC_DESCRI := 103 
STATIC DEFINE JMK_SC_PERCE := 104 
STATIC DEFINE JMK_SC_SEQ := 102 
STATIC DEFINE JMK_SEQ := 105 
#endregion

class JMK inherit MYDataWindow 

	PROTECT oDBSEQ as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBPERCE as DataColumn
	protect oCCporcod as PUSHBUTTON
	protect oCCbuscacod as PUSHBUTTON
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCSC_PERCE as FIXEDTEXT
	protect oDCSEQ as RIGHTSLE
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCPERCE as RIGHTSLE
// 	instance SEQ 
// 	instance DESCRI 
// 	instance PERCE 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMK",_GetInst()},iCtlID)

oCCporcod := PushButton{self,ResourceID{JMK_PORCOD,_GetInst()}}
oCCporcod:Image := ICO_AZ{}
oCCporcod:HyperLabel := HyperLabel{#porcod,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscacod := PushButton{self,ResourceID{JMK_BUSCACOD,_GetInst()}}
oCCbuscacod:Image := ICO_FIND{}
oCCbuscacod:HyperLabel := HyperLabel{#buscacod,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_SEQ := FixedText{self,ResourceID{JMK_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Sequencia:",NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{self,ResourceID{JMK_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCSC_PERCE := FixedText{self,ResourceID{JMK_SC_PERCE,_GetInst()}}
oDCSC_PERCE:HyperLabel := HyperLabel{#SC_PERCE,"Percentual:",NULL_STRING,NULL_STRING}

oDCSEQ := rightSle{self,ResourceID{JMK_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := padrao_num_02{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"VMARK_SEQ"}
oDCSEQ:FocusSelect := FSEL_HOME

oDCDESCRI := SingleLineEdit{self,ResourceID{JMK_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := padrao_char_12{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descrição:",NULL_STRING,"VMARK_DESCRI"}
oDCDESCRI:FocusSelect := FSEL_HOME

oDCPERCE := rightSle{self,ResourceID{JMK_PERCE,_GetInst()}}
oDCPERCE:FieldSpec := padrao_num_06_2{}
oDCPERCE:HyperLabel := HyperLabel{#PERCE,"Percentual:",NULL_STRING,"VMARK_PERCE"}
oDCPERCE:FocusSelect := FSEL_HOME

self:Caption := "Markup"
self:HyperLabel := HyperLabel{#JMK,"Markup",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBSEQ := DataColumn{padrao_num_02{}}
oDBSEQ:Width := 7
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
self:Browser:AddColumn(oDBSEQ)

oDBDESCRI := DataColumn{padrao_char_12{}}
oDBDESCRI:Width := 27
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descrição:"
self:Browser:AddColumn(oDBDESCRI)

oDBPERCE := DataColumn{padrao_num_06_2{}}
oDBPERCE:Width := 15
oDBPERCE:HyperLabel := oDCPERCE:HyperLabel 
oDBPERCE:Caption := "Percentual:"
self:Browser:AddColumn(oDBPERCE)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PERCE() 
return self:FieldGet(#PERCE)


assign PERCE(uValue) 
self:FieldPut(#PERCE, uValue)
return PERCE := uValue


access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


END CLASS
