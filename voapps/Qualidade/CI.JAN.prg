#region DEFINES
STATIC DEFINE JCI_ANTERIOR := 149 
STATIC DEFINE JCI_BUSCANUM := 156 
STATIC DEFINE JCI_CALCULAR := 147 
STATIC DEFINE JCI_CENCTMP := 108 
STATIC DEFINE JCI_CI := 121 
STATIC DEFINE JCI_CLAUDO := 115 
STATIC DEFINE JCI_CLIENTE := 138 
STATIC DEFINE JCI_CLINOME := 139 
STATIC DEFINE JCI_CMDCALC2 := 146 
STATIC DEFINE JCI_DATA := 100 
STATIC DEFINE JCI_DATAD := 131 
STATIC DEFINE JCI_DATAR := 132 
STATIC DEFINE JCI_DESCRI := 128 
STATIC DEFINE JCI_DESENHO := 126 
STATIC DEFINE JCI_ESCRES := 118 
STATIC DEFINE JCI_FOTO := 153 
STATIC DEFINE JCI_INSNOM := 144 
STATIC DEFINE JCI_INSNUM := 106 
STATIC DEFINE JCI_JCII := 148 
STATIC DEFINE JCI_LAUDOF := 112 
STATIC DEFINE JCI_OBS01 := 109 
STATIC DEFINE JCI_OBS02 := 110 
STATIC DEFINE JCI_ORDEM := 102 
STATIC DEFINE JCI_PEDIDO := 101 
STATIC DEFINE JCI_PEGINS := 154 
STATIC DEFINE JCI_POROV := 155 
STATIC DEFINE JCI_PROXIMO := 150 
STATIC DEFINE JCI_QTI := 113 
STATIC DEFINE JCI_QTL := 103 
STATIC DEFINE JCI_RASTRO := 114 
STATIC DEFINE JCI_RB1 := 122 
STATIC DEFINE JCI_RB2 := 124 
STATIC DEFINE JCI_RB3 := 123 
STATIC DEFINE JCI_RB4 := 134 
STATIC DEFINE JCI_RB5 := 135 
STATIC DEFINE JCI_RB6 := 136 
STATIC DEFINE JCI_REVD := 133 
STATIC DEFINE JCI_SC_CLIENTE := 137 
STATIC DEFINE JCI_SC_DATA := 120 
STATIC DEFINE JCI_SC_DATAD := 129 
STATIC DEFINE JCI_SC_DATAR := 130 
STATIC DEFINE JCI_SC_DESCRI := 127 
STATIC DEFINE JCI_SC_DESENHO := 125 
STATIC DEFINE JCI_SC_DESTINO2 := 152 
STATIC DEFINE JCI_SC_INSNUM := 143 
STATIC DEFINE JCI_SC_ORDEM := 141 
STATIC DEFINE JCI_SC_PEDIDO := 140 
STATIC DEFINE JCI_SC_QTI := 104 
STATIC DEFINE JCI_SC_QTL := 142 
STATIC DEFINE JCI_SC_RASTRO := 105 
STATIC DEFINE JCI_SC_RI := 119 
STATIC DEFINE JCI_THEFIXEDTEXT14 := 145 
STATIC DEFINE JCI_THEGROUPBOX1 := 151 
STATIC DEFINE JCI_THERADIOBUTTON6 := 116 
STATIC DEFINE JCI_THERADIOBUTTON7 := 117 
STATIC DEFINE JCI_TIPOI := 111 
STATIC DEFINE JCI_VALOR := 107 
#endregion

PARTIAL class JCI inherit MYDataWindow 

	PROTECT oDBCI as DataColumn
	PROTECT oDBDESENHO as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCLINOME as DataColumn
	protect oDCDATA as DATETIMEPICKER
	protect oDCPEDIDO as SINGLELINEEDIT
	protect oDCORDEM as SINGLELINEEDIT
	protect oDCQTL as SINGLELINEEDIT
	protect oDCSC_QTI as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCINSNUM as RIGHTSLE
	protect oDCvalor as RIGHTSLE
	protect oDCCENCTMP as SINGLELINEEDIT
	protect oDCOBS01 as SINGLELINEEDIT
	protect oDCOBS02 as SINGLELINEEDIT
	protect oDCTIPOI as RADIOBUTTONGROUP
	protect oDCLAUDOF as RADIOBUTTONGROUP
	protect oDCQTI as SINGLELINEEDIT
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCcLAUDO as RADIOBUTTONGROUP
	protect oCCtheRadioButton6 as RADIOBUTTON
	protect oCCtheRadioButton7 as RADIOBUTTON
	protect oCCESCRES as PUSHBUTTON
	protect oDCSC_RI as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCCI as SINGLELINEEDIT
	protect oCCRB1 as RADIOBUTTON
	protect oCCRB3 as RADIOBUTTON
	protect oCCRB2 as RADIOBUTTON
	protect oDCSC_DESENHO as FIXEDTEXT
	protect oDCDESENHO as SINGLELINEEDIT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCSC_DATAD as FIXEDTEXT
	protect oDCSC_DATAR as FIXEDTEXT
	protect oDCDATAD as SINGLELINEEDIT
	protect oDCDATAR as SINGLELINEEDIT
	protect oDCREVD as SINGLELINEEDIT
	protect oCCRB4 as RADIOBUTTON
	protect oCCRB5 as RADIOBUTTON
	protect oCCRB6 as RADIOBUTTON
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCCLIENTE as SINGLELINEEDIT
	protect oDCCLINOME as SINGLELINEEDIT
	protect oDCSC_PEDIDO as FIXEDTEXT
	protect oDCSC_ORDEM as FIXEDTEXT
	protect oDCSC_QTL as FIXEDTEXT
	protect oDCSC_INSNUM as FIXEDTEXT
	protect oDCINSNOM as SINGLELINEEDIT
	protect oDCtheFixedText14 as FIXEDTEXT
	protect oCCcmdCalc2 as PUSHBUTTON
	protect oCCCalcular as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCProximo as PUSHBUTTON
	protect oDCtheGroupBox1 as GROUPBOX
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCpegins as PUSHBUTTON
	protect oCCporov as PUSHBUTTON
	protect oCCbuscanum as PUSHBUTTON
// 	instance PEDIDO 
// 	instance ORDEM 
// 	instance QTL 
// 	instance INSNUM 
// 	instance valor 
// 	instance CENCTMP 
// 	instance OBS01 
// 	instance OBS02 
// 	instance TIPOI 
// 	instance LAUDOF 
// 	instance QTI 
// 	instance RASTRO 
// 	instance cLAUDO 
// 	instance CI 
// 	instance DESENHO 
// 	instance DESCRI 
// 	instance DATAD 
// 	instance DATAR 
// 	instance REVD 
// 	instance CLIENTE 
// 	instance CLINOME 
// 	instance INSNOM 
	protect oSFJCII as JCII

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CENCTMP() 
return self:FieldGet(#CENCTMP)


assign CENCTMP(uValue) 
self:FieldPut(#CENCTMP, uValue)
return CENCTMP := uValue


access CI() 
return self:FieldGet(#CI)


assign CI(uValue) 
self:FieldPut(#CI, uValue)
return CI := uValue


access cLAUDO() 
return self:FieldGet(#cLAUDO)


assign cLAUDO(uValue) 
self:FieldPut(#cLAUDO, uValue)
return cLAUDO := uValue


access CLIENTE() 
return self:FieldGet(#CLIENTE)


assign CLIENTE(uValue) 
self:FieldPut(#CLIENTE, uValue)
return CLIENTE := uValue


access CLINOME() 
return self:FieldGet(#CLINOME)


assign CLINOME(uValue) 
self:FieldPut(#CLINOME, uValue)
return CLINOME := uValue


access DATAD() 
return self:FieldGet(#DATAD)


assign DATAD(uValue) 
self:FieldPut(#DATAD, uValue)
return DATAD := uValue


access DATAR() 
return self:FieldGet(#DATAR)


assign DATAR(uValue) 
self:FieldPut(#DATAR, uValue)
return DATAR := uValue


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
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCI",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDATA := DateTimePicker{self,ResourceID{JCI_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCPEDIDO := SingleLineEdit{self,ResourceID{JCI_PEDIDO,_GetInst()}}
oDCPEDIDO:FieldSpec := PADRAO_CHAR_20{}
oDCPEDIDO:HyperLabel := HyperLabel{#PEDIDO,"Pedido:",NULL_STRING,"RI_PEDIDO"}

oDCORDEM := SingleLineEdit{self,ResourceID{JCI_ORDEM,_GetInst()}}
oDCORDEM:FieldSpec := PADRAO_CHAR_20{}
oDCORDEM:HyperLabel := HyperLabel{#ORDEM,"Ordem:",NULL_STRING,"RI_ORDEM"}

oDCQTL := SingleLineEdit{self,ResourceID{JCI_QTL,_GetInst()}}
oDCQTL:FieldSpec := PADRAO_CHAR_20{}
oDCQTL:HyperLabel := HyperLabel{#QTL,"Qtl:",NULL_STRING,"RI_QTL"}

oDCSC_QTI := FixedText{self,ResourceID{JCI_SC_QTI,_GetInst()}}
oDCSC_QTI:HyperLabel := HyperLabel{#SC_QTI,"Quantidade Inspeção:",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{JCI_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCINSNUM := rightSle{self,ResourceID{JCI_INSNUM,_GetInst()}}
oDCINSNUM:FieldSpec := PADRAO_NUM_08{}
oDCINSNUM:HyperLabel := HyperLabel{#INSNUM,"Insnum:",NULL_STRING,"RI_INSNUM"}

oDCvalor := rightSle{self,ResourceID{JCI_VALOR,_GetInst()}}
oDCvalor:FieldSpec := PADRAO_NUM_09_2{}
oDCvalor:HyperLabel := HyperLabel{#valor,"Rastro:",NULL_STRING,"RI_RASTRO"}

oDCCENCTMP := SingleLineEdit{self,ResourceID{JCI_CENCTMP,_GetInst()}}
oDCCENCTMP:FieldSpec := PADRAO_CHAR_30{}
oDCCENCTMP:HyperLabel := HyperLabel{#CENCTMP,"Rastro:",NULL_STRING,"RI_RASTRO"}

oDCOBS01 := SingleLineEdit{self,ResourceID{JCI_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := PADRAO_CHAR_80{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Obs01:",NULL_STRING,"RI_OBS01"}

oDCOBS02 := SingleLineEdit{self,ResourceID{JCI_OBS02,_GetInst()}}
oDCOBS02:FieldSpec := PADRAO_CHAR_80{}
oDCOBS02:HyperLabel := HyperLabel{#OBS02,"Obs02:",NULL_STRING,"RI_OBS02"}

oDCQTI := SingleLineEdit{self,ResourceID{JCI_QTI,_GetInst()}}
oDCQTI:FieldSpec := PADRAO_CHAR_20{}
oDCQTI:HyperLabel := HyperLabel{#QTI,"Quantidade Inspeção:",NULL_STRING,"RI_QTI"}

oDCRASTRO := SingleLineEdit{self,ResourceID{JCI_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := PADRAO_CHAR_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"RI_RASTRO"}

oCCtheRadioButton6 := RadioButton{self,ResourceID{JCI_THERADIOBUTTON6,_GetInst()}}
oCCtheRadioButton6:HyperLabel := HyperLabel{#theRadioButton6,"Sim",NULL_STRING,NULL_STRING}

oCCtheRadioButton7 := RadioButton{self,ResourceID{JCI_THERADIOBUTTON7,_GetInst()}}
oCCtheRadioButton7:HyperLabel := HyperLabel{#theRadioButton7,"Nao",NULL_STRING,NULL_STRING}

oCCESCRES := PushButton{self,ResourceID{JCI_ESCRES,_GetInst()}}
oCCESCRES:HyperLabel := HyperLabel{#ESCRES,"...",NULL_STRING,NULL_STRING}

oDCSC_RI := FixedText{self,ResourceID{JCI_SC_RI,_GetInst()}}
oDCSC_RI:HyperLabel := HyperLabel{#SC_RI,"CI",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JCI_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCCI := SingleLineEdit{self,ResourceID{JCI_CI,_GetInst()}}
oDCCI:FieldSpec := PADRAO_NUM_08{}
oDCCI:HyperLabel := HyperLabel{#CI,"Ri:",NULL_STRING,"RI_RI"}
oDCCI:BackGround := aBrushes[1]
oDCCI:Font(aFonts[1], FALSE)

oCCRB1 := RadioButton{self,ResourceID{JCI_RB1,_GetInst()}}
oCCRB1:HyperLabel := HyperLabel{#RB1,"Amostra",NULL_STRING,NULL_STRING}

oCCRB3 := RadioButton{self,ResourceID{JCI_RB3,_GetInst()}}
oCCRB3:HyperLabel := HyperLabel{#RB3,"Produção",NULL_STRING,NULL_STRING}

oCCRB2 := RadioButton{self,ResourceID{JCI_RB2,_GetInst()}}
oCCRB2:HyperLabel := HyperLabel{#RB2,"Lote Piloto",NULL_STRING,NULL_STRING}

oDCSC_DESENHO := FixedText{self,ResourceID{JCI_SC_DESENHO,_GetInst()}}
oDCSC_DESENHO:HyperLabel := HyperLabel{#SC_DESENHO,"Produto",NULL_STRING,NULL_STRING}

oDCDESENHO := SingleLineEdit{self,ResourceID{JCI_DESENHO,_GetInst()}}
oDCDESENHO:FieldSpec := PADRAO_CHAR_24{}
oDCDESENHO:HyperLabel := HyperLabel{#DESENHO,"Desenho:",NULL_STRING,"RI_DESENHO"}
oDCDESENHO:BackGround := aBrushes[1]
oDCDESENHO:Font(aFonts[2], FALSE)

oDCSC_DESCRI := FixedText{self,ResourceID{JCI_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCDESCRI := SingleLineEdit{self,ResourceID{JCI_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_40{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descri:",NULL_STRING,"RI_DESCRI"}
oDCDESCRI:BackGround := aBrushes[1]
oDCDESCRI:Font(aFonts[2], FALSE)

oDCSC_DATAD := FixedText{self,ResourceID{JCI_SC_DATAD,_GetInst()}}
oDCSC_DATAD:HyperLabel := HyperLabel{#SC_DATAD,"Data Desenho",NULL_STRING,NULL_STRING}

oDCSC_DATAR := FixedText{self,ResourceID{JCI_SC_DATAR,_GetInst()}}
oDCSC_DATAR:HyperLabel := HyperLabel{#SC_DATAR,"Revisão:",NULL_STRING,NULL_STRING}

oDCDATAD := SingleLineEdit{self,ResourceID{JCI_DATAD,_GetInst()}}
oDCDATAD:FieldSpec := DATE_FIELD{}
oDCDATAD:HyperLabel := HyperLabel{#DATAD,"Datad:",NULL_STRING,"RI_DATAD"}
oDCDATAD:BackGround := aBrushes[1]
oDCDATAD:Font(aFonts[2], FALSE)

oDCDATAR := SingleLineEdit{self,ResourceID{JCI_DATAR,_GetInst()}}
oDCDATAR:FieldSpec := DATE_FIELD{}
oDCDATAR:HyperLabel := HyperLabel{#DATAR,"Data Revisão:",NULL_STRING,"RI_DATAR"}
oDCDATAR:BackGround := aBrushes[1]
oDCDATAR:Font(aFonts[2], FALSE)

oDCREVD := SingleLineEdit{self,ResourceID{JCI_REVD,_GetInst()}}
oDCREVD:FieldSpec := PADRAO_CHAR_05{}
oDCREVD:HyperLabel := HyperLabel{#REVD,NULL_STRING,NULL_STRING,NULL_STRING}
oDCREVD:BackGround := aBrushes[1]
oDCREVD:Font(aFonts[2], FALSE)

oCCRB4 := RadioButton{self,ResourceID{JCI_RB4,_GetInst()}}
oCCRB4:HyperLabel := HyperLabel{#RB4,"Aprovado",NULL_STRING,NULL_STRING}

oCCRB5 := RadioButton{self,ResourceID{JCI_RB5,_GetInst()}}
oCCRB5:HyperLabel := HyperLabel{#RB5,"Aprov.Condicional",NULL_STRING,NULL_STRING}

oCCRB6 := RadioButton{self,ResourceID{JCI_RB6,_GetInst()}}
oCCRB6:HyperLabel := HyperLabel{#RB6,"Reprovado",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{JCI_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCCLIENTE := SingleLineEdit{self,ResourceID{JCI_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"RI_CLIENTE"}
oDCCLIENTE:BackGround := aBrushes[1]
oDCCLIENTE:Font(aFonts[2], FALSE)

oDCCLINOME := SingleLineEdit{self,ResourceID{JCI_CLINOME,_GetInst()}}
oDCCLINOME:FieldSpec := PADRAO_CHAR_50{}
oDCCLINOME:HyperLabel := HyperLabel{#CLINOME,"Clinome:",NULL_STRING,"RI_CLINOME"}
oDCCLINOME:BackGround := aBrushes[1]
oDCCLINOME:Font(aFonts[2], FALSE)

oDCSC_PEDIDO := FixedText{self,ResourceID{JCI_SC_PEDIDO,_GetInst()}}
oDCSC_PEDIDO:HyperLabel := HyperLabel{#SC_PEDIDO,"Pedido Cliente:",NULL_STRING,NULL_STRING}

oDCSC_ORDEM := FixedText{self,ResourceID{JCI_SC_ORDEM,_GetInst()}}
oDCSC_ORDEM:HyperLabel := HyperLabel{#SC_ORDEM,"Ordem Serviço:",NULL_STRING,NULL_STRING}

oDCSC_QTL := FixedText{self,ResourceID{JCI_SC_QTL,_GetInst()}}
oDCSC_QTL:HyperLabel := HyperLabel{#SC_QTL,"Quantidade do Lote:",NULL_STRING,NULL_STRING}

oDCSC_INSNUM := FixedText{self,ResourceID{JCI_SC_INSNUM,_GetInst()}}
oDCSC_INSNUM:HyperLabel := HyperLabel{#SC_INSNUM,"Inspetor:",NULL_STRING,NULL_STRING}

oDCINSNOM := SingleLineEdit{self,ResourceID{JCI_INSNOM,_GetInst()}}
oDCINSNOM:FieldSpec := PADRAO_CHAR_40{}
oDCINSNOM:HyperLabel := HyperLabel{#INSNOM,"Insnom:",NULL_STRING,"RI_INSNOM"}
oDCINSNOM:BackGround := aBrushes[1]
oDCINSNOM:Font(aFonts[2], FALSE)

oDCtheFixedText14 := FixedText{self,ResourceID{JCI_THEFIXEDTEXT14,_GetInst()}}
oDCtheFixedText14:HyperLabel := HyperLabel{#theFixedText14,"Encontrado",NULL_STRING,NULL_STRING}

oCCcmdCalc2 := PushButton{self,ResourceID{JCI_CMDCALC2,_GetInst()}}
oCCcmdCalc2:HyperLabel := HyperLabel{#cmdCalc2,"Lançar",NULL_STRING,NULL_STRING}

oCCCalcular := PushButton{self,ResourceID{JCI_CALCULAR,_GetInst()}}
oCCCalcular:HyperLabel := HyperLabel{#Calcular,"Lançar",NULL_STRING,NULL_STRING}

oCCAnterior := PushButton{self,ResourceID{JCI_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,"Anterior",NULL_STRING,NULL_STRING}

oCCProximo := PushButton{self,ResourceID{JCI_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,"Proximo",NULL_STRING,NULL_STRING}

oDCtheGroupBox1 := GroupBox{self,ResourceID{JCI_THEGROUPBOX1,_GetInst()}}
oDCtheGroupBox1:HyperLabel := HyperLabel{#theGroupBox1,"Observações",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JCI_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JCI_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oCCpegins := PushButton{self,ResourceID{JCI_PEGINS,_GetInst()}}
oCCpegins:HyperLabel := HyperLabel{#pegins,"->",NULL_STRING,NULL_STRING}

oCCporov := PushButton{self,ResourceID{JCI_POROV,_GetInst()}}
oCCporov:Image := ICO_AZ{}
oCCporov:HyperLabel := HyperLabel{#porov,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporov:TooltipText := "Organizar por Numero GC"

oCCbuscanum := PushButton{self,ResourceID{JCI_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ICO_FIND{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Localizar um GC"

oDCTIPOI := RadioButtonGroup{self,ResourceID{JCI_TIPOI,_GetInst()}}
oDCTIPOI:FillUsing({ ;
						{oCCRB1,"A"}, ;
						{oCCRB3,"P"}, ;
						{oCCRB2,"L"} ;
						})
oDCTIPOI:HyperLabel := HyperLabel{#TIPOI,"Tipo",NULL_STRING,NULL_STRING}
oDCTIPOI:FieldSpec := PADRAO_CHAR_01{}

oDCLAUDOF := RadioButtonGroup{self,ResourceID{JCI_LAUDOF,_GetInst()}}
oDCLAUDOF:FillUsing({ ;
						{oCCRB4,"A"}, ;
						{oCCRB5,"C"}, ;
						{oCCRB6,"R"} ;
						})
oDCLAUDOF:HyperLabel := HyperLabel{#LAUDOF,"Laudo Final",NULL_STRING,NULL_STRING}
oDCLAUDOF:FieldSpec := PADRAO_CHAR_01{}

oDCcLAUDO := RadioButtonGroup{self,ResourceID{JCI_CLAUDO,_GetInst()}}
oDCcLAUDO:FillUsing({ ;
						{oCCtheRadioButton6,"A"}, ;
						{oCCtheRadioButton7,"R"} ;
						})
oDCcLAUDO:HyperLabel := HyperLabel{#cLAUDO,"Laudo",NULL_STRING,NULL_STRING}
oDCcLAUDO:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "Relatorio de Inspeção"
self:HyperLabel := HyperLabel{#JCI,"Relatorio de Inspeção",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCI := DataColumn{PADRAO_NUM_08{}}
oDBCI:Width := 9
oDBCI:HyperLabel := oDCCI:HyperLabel 
oDBCI:Caption := "Ri:"
oDBCI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCI)

oDBDESENHO := DataColumn{PADRAO_CHAR_24{}}
oDBDESENHO:Width := 9
oDBDESENHO:HyperLabel := oDCDESENHO:HyperLabel 
oDBDESENHO:Caption := "Desenho:"
oDBDESENHO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDESENHO)

oDBDESCRI := DataColumn{PADRAO_CHAR_40{}}
oDBDESCRI:Width := 8
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descri:"
oDBDESCRI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDESCRI)

oDBCLIENTE := DataColumn{PADRAO_NUM_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
oDBCLIENTE:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCLIENTE)

oDBCLINOME := DataColumn{PADRAO_CHAR_50{}}
oDBCLINOME:Width := 9
oDBCLINOME:HyperLabel := oDCCLINOME:HyperLabel 
oDBCLINOME:Caption := "Clinome:"
oDBCLINOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCLINOME)


self:ViewAs(#FormView)

oSFJCII := JCII{self,JCI_JCII}
oSFJCII:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access INSNOM() 
return self:FieldGet(#INSNOM)


assign INSNOM(uValue) 
self:FieldPut(#INSNOM, uValue)
return INSNOM := uValue


access INSNUM() 
return self:FieldGet(#INSNUM)


assign INSNUM(uValue) 
self:FieldPut(#INSNUM, uValue)
return INSNUM := uValue


access LAUDOF() 
return self:FieldGet(#LAUDOF)


assign LAUDOF(uValue) 
self:FieldPut(#LAUDOF, uValue)
return LAUDOF := uValue


access OBS01() 
return self:FieldGet(#OBS01)


assign OBS01(uValue) 
self:FieldPut(#OBS01, uValue)
return OBS01 := uValue


access OBS02() 
return self:FieldGet(#OBS02)


assign OBS02(uValue) 
self:FieldPut(#OBS02, uValue)
return OBS02 := uValue


access ORDEM() 
return self:FieldGet(#ORDEM)


assign ORDEM(uValue) 
self:FieldPut(#ORDEM, uValue)
return ORDEM := uValue


access PEDIDO() 
return self:FieldGet(#PEDIDO)


assign PEDIDO(uValue) 
self:FieldPut(#PEDIDO, uValue)
return PEDIDO := uValue


access QTI() 
return self:FieldGet(#QTI)


assign QTI(uValue) 
self:FieldPut(#QTI, uValue)
return QTI := uValue


access QTL() 
return self:FieldGet(#QTL)


assign QTL(uValue) 
self:FieldPut(#QTL, uValue)
return QTL := uValue


access RASTRO() 
return self:FieldGet(#RASTRO)


assign RASTRO(uValue) 
self:FieldPut(#RASTRO, uValue)
return RASTRO := uValue


access REVD() 
return self:FieldGet(#REVD)


assign REVD(uValue) 
self:FieldPut(#REVD, uValue)
return REVD := uValue


ACCESS RI() 
RETURN self:FieldGet(#RI)


access TIPOI() 
return self:FieldGet(#TIPOI)


assign TIPOI(uValue) 
self:FieldPut(#TIPOI, uValue)
return TIPOI := uValue


access valor() 
return self:FieldGet(#valor)


assign valor(uValue) 
self:FieldPut(#valor, uValue)
return valor := uValue


END CLASS
