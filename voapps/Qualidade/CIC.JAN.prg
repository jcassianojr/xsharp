#region DEFINES
STATIC DEFINE JCIC_ALTERAR := 121 
STATIC DEFINE JCIC_ANTERIOR := 124 
STATIC DEFINE JCIC_BTNPEGMS01 := 109 
STATIC DEFINE JCIC_BUSCANUM := 111 
STATIC DEFINE JCIC_CLIENTE := 105 
STATIC DEFINE JCIC_DATAD := 102 
STATIC DEFINE JCIC_DATAR := 103 
STATIC DEFINE JCIC_DESCRI := 101 
STATIC DEFINE JCIC_DESENHO := 100 
STATIC DEFINE JCIC_ESCCOD := 106 
STATIC DEFINE JCIC_EXCLUIR := 120 
STATIC DEFINE JCIC_FIXEDTEXT3 := 114 
STATIC DEFINE JCIC_FOTO := 108 
STATIC DEFINE JCIC_FT4 := 115 
STATIC DEFINE JCIC_INCLUIR := 119 
STATIC DEFINE JCIC_JCICI := 118 
STATIC DEFINE JCIC_POROV := 110 
STATIC DEFINE JCIC_PROXIMO := 123 
STATIC DEFINE JCIC_PUSHBUTTON5 := 116 
STATIC DEFINE JCIC_REVD := 104 
STATIC DEFINE JCIC_SC_DATAD := 104 
STATIC DEFINE JCIC_SC_DESCRI := 113 
STATIC DEFINE JCIC_SC_DESENHO := 112 
STATIC DEFINE JCIC_SC_DESTINO2 := 107 
STATIC DEFINE JCIC_SC_REVD := 116 
STATIC DEFINE JCIC_TABULAR := 122 
STATIC DEFINE JCIC_THEFIXEDTEXT5 := 117 
#endregion

PARTIAL class JCIC inherit MYDataWindow 

	PROTECT oDBDESENHO as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBREVD as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	protect oDCDESENHO as SINGLELINEEDIT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCDATAD as DATETIMEPICKER
	protect oDCDATAR as DATETIMEPICKER
	protect oDCREVD as SINGLELINEEDIT
	protect oDCCLIENTE as RIGHTSLE
	protect oCCesccod as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCbtnpegms01 as PUSHBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
	protect oDCSC_DESENHO as FIXEDTEXT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCFixedText3 as FIXEDTEXT
	protect oDCFT4 as FIXEDTEXT
	protect oDCSC_REVD as FIXEDTEXT
	protect oDCtheFixedText5 as FIXEDTEXT
	protect oCCIncluir as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCAlterar as PUSHBUTTON
	protect oCCTabular as PUSHBUTTON
	protect oCCPROXIMO as PUSHBUTTON
	protect oCCANTERIOR as PUSHBUTTON
// 	instance DESENHO 
// 	instance DESCRI 
// 	instance REVD 
// 	instance CLIENTE 
	protect oSFJCICI as JCICI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CLIENTE() 
return self:FieldGet(#CLIENTE)


assign CLIENTE(uValue) 
self:FieldPut(#CLIENTE, uValue)
return CLIENTE := uValue


access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


access DESENHO() 
return self:FieldGet(#DESENHO)


assign DESENHO(uValue) 
self:FieldPut(#DESENHO, uValue)
return DESENHO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCIC",_GetInst()},iCtlID)

oDCDESENHO := SingleLineEdit{self,ResourceID{JCIC_DESENHO,_GetInst()}}
oDCDESENHO:FieldSpec := PADRAO_CHAR_24{}
oDCDESENHO:HyperLabel := HyperLabel{#DESENHO,"Desenho:",NULL_STRING,"CIC_DESENHO"}

oDCDESCRI := SingleLineEdit{self,ResourceID{JCIC_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_40{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descri:",NULL_STRING,"CIC_DESCRI"}

oDCDATAD := DateTimePicker{self,ResourceID{JCIC_DATAD,_GetInst()}}
oDCDATAD:FieldSpec := DATE_FIELD{}
oDCDATAD:HyperLabel := HyperLabel{#DATAD,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDATAR := DateTimePicker{self,ResourceID{JCIC_DATAR,_GetInst()}}
oDCDATAR:FieldSpec := DATE_FIELD{}
oDCDATAR:HyperLabel := HyperLabel{#DATAR,NULL_STRING,NULL_STRING,NULL_STRING}

oDCREVD := SingleLineEdit{self,ResourceID{JCIC_REVD,_GetInst()}}
oDCREVD:FieldSpec := PADRAO_CHAR_05{}
oDCREVD:HyperLabel := HyperLabel{#REVD,"Revd:",NULL_STRING,"CIC_REVD"}

oDCCLIENTE := rightSle{self,ResourceID{JCIC_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Revd:",NULL_STRING,"CIC_REVD"}

oCCesccod := PushButton{self,ResourceID{JCIC_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JCIC_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JCIC_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oCCbtnpegms01 := PushButton{self,ResourceID{JCIC_BTNPEGMS01,_GetInst()}}
oCCbtnpegms01:HyperLabel := HyperLabel{#btnpegms01,"-->",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JCIC_POROV,_GetInst()}}
oCCporov:Image := ICO_AZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Organizar por Numero GC"

oCCbuscanum := PushButton{self,ResourceID{JCIC_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Localizar um GC"

oDCSC_DESENHO := FixedText{self,ResourceID{JCIC_SC_DESENHO,_GetInst()}}
oDCSC_DESENHO:HyperLabel := HyperLabel{#SC_DESENHO,"Desenho:",NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{self,ResourceID{JCIC_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCFixedText3 := FixedText{self,ResourceID{JCIC_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Desenho:",NULL_STRING,NULL_STRING}

oDCFT4 := FixedText{self,ResourceID{JCIC_FT4,_GetInst()}}
oDCFT4:HyperLabel := HyperLabel{#FT4,"Revisão",NULL_STRING,NULL_STRING}

oDCSC_REVD := FixedText{self,ResourceID{JCIC_SC_REVD,_GetInst()}}
oDCSC_REVD:HyperLabel := HyperLabel{#SC_REVD,"Revisão:",NULL_STRING,NULL_STRING}

oDCtheFixedText5 := FixedText{self,ResourceID{JCIC_THEFIXEDTEXT5,_GetInst()}}
oDCtheFixedText5:HyperLabel := HyperLabel{#theFixedText5,"Cliente",NULL_STRING,NULL_STRING}

oCCIncluir := PushButton{self,ResourceID{JCIC_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}

oCCExcluir := PushButton{self,ResourceID{JCIC_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}

oCCAlterar := PushButton{self,ResourceID{JCIC_ALTERAR,_GetInst()}}
oCCAlterar:HyperLabel := HyperLabel{#Alterar,"Alterar",NULL_STRING,NULL_STRING}

oCCTabular := PushButton{self,ResourceID{JCIC_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Tabular",NULL_STRING,NULL_STRING}

oCCPROXIMO := PushButton{self,ResourceID{JCIC_PROXIMO,_GetInst()}}
oCCPROXIMO:HyperLabel := HyperLabel{#PROXIMO,"Proximo",NULL_STRING,NULL_STRING}

oCCANTERIOR := PushButton{self,ResourceID{JCIC_ANTERIOR,_GetInst()}}
oCCANTERIOR:HyperLabel := HyperLabel{#ANTERIOR,"Anterior",NULL_STRING,NULL_STRING}

self:Caption := "Pre Produtos"
self:HyperLabel := HyperLabel{#JCIC,"Pre Produtos",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBDESENHO := DataColumn{PADRAO_CHAR_24{}}
oDBDESENHO:Width := 9
oDBDESENHO:HyperLabel := oDCDESENHO:HyperLabel 
oDBDESENHO:Caption := "Desenho:"
self:Browser:AddColumn(oDBDESENHO)

oDBDESCRI := DataColumn{PADRAO_CHAR_40{}}
oDBDESCRI:Width := 8
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descri:"
self:Browser:AddColumn(oDBDESCRI)

oDBREVD := DataColumn{PADRAO_CHAR_05{}}
oDBREVD:Width := 6
oDBREVD:HyperLabel := oDCREVD:HyperLabel 
oDBREVD:Caption := "Revd:"
self:Browser:AddColumn(oDBREVD)

oDBCLIENTE := DataColumn{PADRAO_NUM_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Revd:"
self:Browser:AddColumn(oDBCLIENTE)


self:ViewAs(#FormView)

oSFJCICI := JCICI{self,JCIC_JCICI}
oSFJCICI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access REVD() 
return self:FieldGet(#REVD)


assign REVD(uValue) 
self:FieldPut(#REVD, uValue)
return REVD := uValue


END CLASS
