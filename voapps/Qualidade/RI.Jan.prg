#region DEFINES
STATIC DEFINE JRI_ALTERAR := 140 
STATIC DEFINE JRI_ANTERIOR := 153 
STATIC DEFINE JRI_BTNPEGMA01 := 168 
STATIC DEFINE JRI_BTNPEGMS01 := 167 
STATIC DEFINE JRI_BUSCANUM := 163 
STATIC DEFINE JRI_CLIENTE := 111 
STATIC DEFINE JRI_CLINOME := 129 
STATIC DEFINE JRI_CMDESCMP2 := 180 
STATIC DEFINE JRI_CMDLAUDO := 159 
STATIC DEFINE JRI_CMDLAUDOITEM := 164 
STATIC DEFINE JRI_CMDLAUDOITEM1 := 173 
STATIC DEFINE JRI_CMDORIGEM := 172 
STATIC DEFINE JRI_DATA := 100 
STATIC DEFINE JRI_DATAD := 106 
STATIC DEFINE JRI_DATAR := 107 
STATIC DEFINE JRI_DESCRI := 102 
STATIC DEFINE JRI_DESENHO := 101 
STATIC DEFINE JRI_DUPLICAR := 132 
STATIC DEFINE JRI_ESCAVA := 146 
STATIC DEFINE JRI_ESCCOD := 120 
STATIC DEFINE JRI_ESCFOR := 119 
STATIC DEFINE JRI_EXCLUIR := 142 
STATIC DEFINE JRI_FIXEDTEXT16 := 118 
STATIC DEFINE JRI_FIXEDTEXT17 := 162 
STATIC DEFINE JRI_FIXEDTEXT18 := 174 
STATIC DEFINE JRI_FOTO := 166 
STATIC DEFINE JRI_INCLUIR := 141 
STATIC DEFINE JRI_INSNOM := 136 
STATIC DEFINE JRI_INSNUM := 114 
STATIC DEFINE JRI_ISOC := 178 
STATIC DEFINE JRI_ISOI := 175 
STATIC DEFINE JRI_ISOO := 177 
STATIC DEFINE JRI_ISOP := 176 
STATIC DEFINE JRI_ISOS := 179 
STATIC DEFINE JRI_JRII := 138 
STATIC DEFINE JRI_LAUDOF := 160 
STATIC DEFINE JRI_NPOS := 115 
STATIC DEFINE JRI_OBS01 := 144 
STATIC DEFINE JRI_OBS02 := 145 
STATIC DEFINE JRI_ORDEM := 110 
STATIC DEFINE JRI_ORIGEM := 170 
STATIC DEFINE JRI_PEDIDO := 109 
STATIC DEFINE JRI_PEGINS := 169 
STATIC DEFINE JRI_PROXIMO := 152 
STATIC DEFINE JRI_QTI := 113 
STATIC DEFINE JRI_QTL := 112 
STATIC DEFINE JRI_RADIOBUTTON1 := 148 
STATIC DEFINE JRI_RADIOBUTTON10 := 156 
STATIC DEFINE JRI_RADIOBUTTON11 := 157 
STATIC DEFINE JRI_RADIOBUTTON12 := 158 
STATIC DEFINE JRI_RADIOBUTTON2 := 149 
STATIC DEFINE JRI_RADIOBUTTON3 := 150 
STATIC DEFINE JRI_RADIOBUTTON4 := 151 
STATIC DEFINE JRI_RADIOBUTTON9 := 155 
STATIC DEFINE JRI_RASTRO := 105 
STATIC DEFINE JRI_REVD := 108 
STATIC DEFINE JRI_RI := 123 
STATIC DEFINE JRI_SC_CLIENTE := 128 
STATIC DEFINE JRI_SC_DATA := 122 
STATIC DEFINE JRI_SC_DATAD := 126 
STATIC DEFINE JRI_SC_DATAR := 127 
STATIC DEFINE JRI_SC_DESCRI := 125 
STATIC DEFINE JRI_SC_DESENHO := 124 
STATIC DEFINE JRI_SC_DESTINO2 := 165 
STATIC DEFINE JRI_SC_INSNOM := 138 
STATIC DEFINE JRI_SC_INSNUM := 137 
STATIC DEFINE JRI_SC_LAUDOF := 132 
STATIC DEFINE JRI_SC_OBS01 := 128 
STATIC DEFINE JRI_SC_OBS02 := 130 
STATIC DEFINE JRI_SC_ORDEM := 130 
STATIC DEFINE JRI_SC_PEDIDO := 131 
STATIC DEFINE JRI_SC_QTI := 134 
STATIC DEFINE JRI_SC_QTL := 133 
STATIC DEFINE JRI_SC_RASTRO := 135 
STATIC DEFINE JRI_SC_RI := 121 
STATIC DEFINE JRI_SC_RI1 := 161 
STATIC DEFINE JRI_SC_RI2X := 171 
STATIC DEFINE JRI_SC_SEQ := 116 
STATIC DEFINE JRI_SC_SSQ := 117 
STATIC DEFINE JRI_SEQ := 103 
STATIC DEFINE JRI_SSQ := 104 
STATIC DEFINE JRI_TABULAR := 139 
STATIC DEFINE JRI_THEGROUPBOX1 := 143 
STATIC DEFINE JRI_TIPO2 := 154 
STATIC DEFINE JRI_TIPOI := 147 
#endregion

PARTIAL class JRI inherit MYDataWindow 

	PROTECT oDBRI as DataColumn
	PROTECT oDBDESENHO as DataColumn
	PROTECT oDBSEQ as DataColumn
	PROTECT oDBSSQ as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBQTL as DataColumn
	PROTECT oDBRASTRO as DataColumn
	PROTECT oDBCLIENTE as DataColumn
	PROTECT oDBCLINOME as DataColumn
	protect oDCDATA as DATETIMEPICKER
	protect oDCDESENHO as SINGLELINEEDIT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCSEQ as RIGHTSLE
	protect oDCSSQ as RIGHTSLE
	protect oDCRASTRO as SINGLELINEEDIT
	protect oDCDATAD as DATESLE
	protect oDCDATAR as DATESLE
	protect oDCREVD as SINGLELINEEDIT
	protect oDCPEDIDO as SINGLELINEEDIT
	protect oDCORDEM as SINGLELINEEDIT
	protect oDCCLIENTE as RIGHTSLE
	protect oDCQTL as SINGLELINEEDIT
	protect oDCQTI as SINGLELINEEDIT
	protect oDCINSNUM as RIGHTSLE
	protect oDCnPOS as SINGLELINEEDIT
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSC_SSQ as FIXEDTEXT
	protect oDCFixedText16 as FIXEDTEXT
	protect oCCescfor as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oDCSC_RI as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCRI as SINGLELINEEDIT
	protect oDCSC_DESENHO as FIXEDTEXT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCSC_DATAD as FIXEDTEXT
	protect oDCSC_DATAR as FIXEDTEXT
	protect oDCSC_CLIENTE as FIXEDTEXT
	protect oDCCLINOME as SINGLELINEEDIT
	protect oDCSC_ORDEM as FIXEDTEXT
	protect oDCSC_PEDIDO as FIXEDTEXT
	protect oCCDuplicar as PUSHBUTTON
	protect oDCSC_QTL as FIXEDTEXT
	protect oDCSC_QTI as FIXEDTEXT
	protect oDCSC_RASTRO as FIXEDTEXT
	protect oDCINSNOM as SINGLELINEEDIT
	protect oDCSC_INSNUM as FIXEDTEXT
	protect oCCTABULAR as PUSHBUTTON
	protect oCCALTERAR as PUSHBUTTON
	protect oCCIncluir as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oDCtheGroupBox1 as GROUPBOX
	protect oDCOBS01 as SINGLELINEEDIT
	protect oDCOBS02 as SINGLELINEEDIT
	protect oCCescava as PUSHBUTTON
	protect oDCTIPOI as RADIOBUTTONGROUP
	protect oCCRadioButton1 as RADIOBUTTON
	protect oCCRadioButton2 as RADIOBUTTON
	protect oCCRadioButton3 as RADIOBUTTON
	protect oCCRadioButton4 as RADIOBUTTON
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oDCTIPO2 as RADIOBUTTONGROUP
	protect oCCRadioButton9 as RADIOBUTTON
	protect oCCRadioButton10 as RADIOBUTTON
	protect oCCRadioButton11 as RADIOBUTTON
	protect oCCRadioButton12 as RADIOBUTTON
	protect oCCcmdlaudo as PUSHBUTTON
	protect oDCLAUDOF as SINGLELINEEDIT
	protect oDCSC_RI1 as FIXEDTEXT
	protect oDCFixedText17 as FIXEDTEXT
	protect oCCbuscanum as PUSHBUTTON
	protect oCCcmdlaudoitem as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCbtnPEGMS01 as PUSHBUTTON
	protect oCCbtnPEGMA01 as PUSHBUTTON
	protect oCCPEGINS as PUSHBUTTON
	protect oDCORIGEM as SINGLELINEEDIT
	protect oDCSC_RI2x as FIXEDTEXT
	protect oCCcmdorigem as PUSHBUTTON
	protect oCCcmdlaudoitem1 as PUSHBUTTON
	protect oDCFixedText18 as FIXEDTEXT
	protect oDCisoi as FIXEDTEXT
	protect oDCisop as FIXEDTEXT
	protect oDCisoo as FIXEDTEXT
	protect oDCisoc as FIXEDTEXT
	protect oDCisos as FIXEDTEXT
	protect oCCcmdescmp2 as PUSHBUTTON
// 	instance DESENHO 
// 	instance DESCRI 
// 	instance SEQ 
// 	instance SSQ 
// 	instance RASTRO 
// 	instance DATAD 
// 	instance DATAR 
// 	instance REVD 
// 	instance PEDIDO 
// 	instance ORDEM 
// 	instance CLIENTE 
// 	instance QTL 
// 	instance QTI 
// 	instance INSNUM 
// 	instance nPOS 
// 	instance RI 
// 	instance CLINOME 
// 	instance INSNOM 
// 	instance OBS01 
// 	instance OBS02 
// 	instance TIPOI 
// 	instance TIPO2 
// 	instance LAUDOF 
// 	instance ORIGEM 
	protect oSFJRII as JRII

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

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
local dim aFonts[3] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRI",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,10,"Times New Roman"}
aFonts[2]:Bold := TRUE
aFonts[3] := Font{,8,"isoqsymbol"}
aBrushes[1] := Brush{Color{255,255,200}}

oDCDATA := DateTimePicker{self,ResourceID{JRI_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDESENHO := SingleLineEdit{self,ResourceID{JRI_DESENHO,_GetInst()}}
oDCDESENHO:FieldSpec := PADRAO_CHAR_24{}
oDCDESENHO:HyperLabel := HyperLabel{#DESENHO,"Desenho:",NULL_STRING,"RI_DESENHO"}

oDCDESCRI := SingleLineEdit{self,ResourceID{JRI_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_40{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Descri:",NULL_STRING,"RI_DESCRI"}

oDCSEQ := rightSle{self,ResourceID{JRI_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := PADRAO_NUM_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"RI_SEQ"}

oDCSSQ := rightSle{self,ResourceID{JRI_SSQ,_GetInst()}}
oDCSSQ:FieldSpec := PADRAO_NUM_03{}
oDCSSQ:HyperLabel := HyperLabel{#SSQ,"Ssq:",NULL_STRING,"RI_SSQ"}

oDCRASTRO := SingleLineEdit{self,ResourceID{JRI_RASTRO,_GetInst()}}
oDCRASTRO:FieldSpec := padrao_char_12{}
oDCRASTRO:HyperLabel := HyperLabel{#RASTRO,"Rastro:",NULL_STRING,"RI_RASTRO"}

oDCDATAD := DateSle{self,ResourceID{JRI_DATAD,_GetInst()}}
oDCDATAD:FieldSpec := DATE_FIELD{}
oDCDATAD:HyperLabel := HyperLabel{#DATAD,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDATAR := DateSle{self,ResourceID{JRI_DATAR,_GetInst()}}
oDCDATAR:FieldSpec := DATE_FIELD{}
oDCDATAR:HyperLabel := HyperLabel{#DATAR,NULL_STRING,NULL_STRING,NULL_STRING}

oDCREVD := SingleLineEdit{self,ResourceID{JRI_REVD,_GetInst()}}
oDCREVD:FieldSpec := PADRAO_CHAR_05{}
oDCREVD:HyperLabel := HyperLabel{#REVD,NULL_STRING,NULL_STRING,NULL_STRING}

oDCPEDIDO := SingleLineEdit{self,ResourceID{JRI_PEDIDO,_GetInst()}}
oDCPEDIDO:FieldSpec := PADRAO_CHAR_20{}
oDCPEDIDO:HyperLabel := HyperLabel{#PEDIDO,"Pedido:",NULL_STRING,"RI_PEDIDO"}

oDCORDEM := SingleLineEdit{self,ResourceID{JRI_ORDEM,_GetInst()}}
oDCORDEM:FieldSpec := PADRAO_CHAR_20{}
oDCORDEM:HyperLabel := HyperLabel{#ORDEM,"Ordem:",NULL_STRING,"RI_ORDEM"}

oDCCLIENTE := rightSle{self,ResourceID{JRI_CLIENTE,_GetInst()}}
oDCCLIENTE:FieldSpec := PADRAO_NUM_08{}
oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE,"Cliente:",NULL_STRING,"RI_CLIENTE"}

oDCQTL := SingleLineEdit{self,ResourceID{JRI_QTL,_GetInst()}}
oDCQTL:FieldSpec := PADRAO_CHAR_20{}
oDCQTL:HyperLabel := HyperLabel{#QTL,"Qtl:",NULL_STRING,"RI_QTL"}

oDCQTI := SingleLineEdit{self,ResourceID{JRI_QTI,_GetInst()}}
oDCQTI:FieldSpec := PADRAO_CHAR_20{}
oDCQTI:HyperLabel := HyperLabel{#QTI,"Quantidade Inspeção:",NULL_STRING,"RI_QTI"}

oDCINSNUM := rightSle{self,ResourceID{JRI_INSNUM,_GetInst()}}
oDCINSNUM:FieldSpec := PADRAO_NUM_08{}
oDCINSNUM:HyperLabel := HyperLabel{#INSNUM,"Insnum:",NULL_STRING,"RI_INSNUM"}

oDCnPOS := SingleLineEdit{self,ResourceID{JRI_NPOS,_GetInst()}}
oDCnPOS:HyperLabel := HyperLabel{#nPOS,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_SEQ := FixedText{self,ResourceID{JRI_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSC_SSQ := FixedText{self,ResourceID{JRI_SC_SSQ,_GetInst()}}
oDCSC_SSQ:HyperLabel := HyperLabel{#SC_SSQ,"Ssq:",NULL_STRING,NULL_STRING}

oDCFixedText16 := FixedText{self,ResourceID{JRI_FIXEDTEXT16,_GetInst()}}
oDCFixedText16:HyperLabel := HyperLabel{#FixedText16,"Posição:",NULL_STRING,NULL_STRING}

oCCescfor := PushButton{self,ResourceID{JRI_ESCFOR,_GetInst()}}
oCCescfor:HyperLabel := HyperLabel{#escfor,"...",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JRI_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oDCSC_RI := FixedText{self,ResourceID{JRI_SC_RI,_GetInst()}}
oDCSC_RI:HyperLabel := HyperLabel{#SC_RI,"Ri:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JRI_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCRI := SingleLineEdit{self,ResourceID{JRI_RI,_GetInst()}}
oDCRI:FieldSpec := PADRAO_NUM_08{}
oDCRI:HyperLabel := HyperLabel{#RI,"Ri:",NULL_STRING,"RI_RI"}
oDCRI:BackGround := aBrushes[1]
oDCRI:Font(aFonts[1], FALSE)

oDCSC_DESENHO := FixedText{self,ResourceID{JRI_SC_DESENHO,_GetInst()}}
oDCSC_DESENHO:HyperLabel := HyperLabel{#SC_DESENHO,"Produto",NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{self,ResourceID{JRI_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCSC_DATAD := FixedText{self,ResourceID{JRI_SC_DATAD,_GetInst()}}
oDCSC_DATAD:HyperLabel := HyperLabel{#SC_DATAD,"Data Desenho",NULL_STRING,NULL_STRING}

oDCSC_DATAR := FixedText{self,ResourceID{JRI_SC_DATAR,_GetInst()}}
oDCSC_DATAR:HyperLabel := HyperLabel{#SC_DATAR,"Revisão:",NULL_STRING,NULL_STRING}

oDCSC_CLIENTE := FixedText{self,ResourceID{JRI_SC_CLIENTE,_GetInst()}}
oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE,"Cliente:",NULL_STRING,NULL_STRING}

oDCCLINOME := SingleLineEdit{self,ResourceID{JRI_CLINOME,_GetInst()}}
oDCCLINOME:FieldSpec := PADRAO_CHAR_50{}
oDCCLINOME:HyperLabel := HyperLabel{#CLINOME,"Clinome:",NULL_STRING,"RI_CLINOME"}
oDCCLINOME:BackGround := aBrushes[1]
oDCCLINOME:Font(aFonts[2], FALSE)

oDCSC_ORDEM := FixedText{self,ResourceID{JRI_SC_ORDEM,_GetInst()}}
oDCSC_ORDEM:HyperLabel := HyperLabel{#SC_ORDEM,"Ordem Serviço:",NULL_STRING,NULL_STRING}

oDCSC_PEDIDO := FixedText{self,ResourceID{JRI_SC_PEDIDO,_GetInst()}}
oDCSC_PEDIDO:HyperLabel := HyperLabel{#SC_PEDIDO,"Pedido Cliente:",NULL_STRING,NULL_STRING}

oCCDuplicar := PushButton{self,ResourceID{JRI_DUPLICAR,_GetInst()}}
oCCDuplicar:HyperLabel := HyperLabel{#Duplicar,"Duplicar",NULL_STRING,NULL_STRING}

oDCSC_QTL := FixedText{self,ResourceID{JRI_SC_QTL,_GetInst()}}
oDCSC_QTL:HyperLabel := HyperLabel{#SC_QTL,"Qtdde do Lote:",NULL_STRING,NULL_STRING}

oDCSC_QTI := FixedText{self,ResourceID{JRI_SC_QTI,_GetInst()}}
oDCSC_QTI:HyperLabel := HyperLabel{#SC_QTI,"Qtdde Inspeção:",NULL_STRING,NULL_STRING}

oDCSC_RASTRO := FixedText{self,ResourceID{JRI_SC_RASTRO,_GetInst()}}
oDCSC_RASTRO:HyperLabel := HyperLabel{#SC_RASTRO,"Rastro:",NULL_STRING,NULL_STRING}

oDCINSNOM := SingleLineEdit{self,ResourceID{JRI_INSNOM,_GetInst()}}
oDCINSNOM:FieldSpec := PADRAO_CHAR_40{}
oDCINSNOM:HyperLabel := HyperLabel{#INSNOM,"Insnom:",NULL_STRING,"RI_INSNOM"}
oDCINSNOM:BackGround := aBrushes[1]
oDCINSNOM:Font(aFonts[2], FALSE)

oDCSC_INSNUM := FixedText{self,ResourceID{JRI_SC_INSNUM,_GetInst()}}
oDCSC_INSNUM:HyperLabel := HyperLabel{#SC_INSNUM,"Inspetor:",NULL_STRING,NULL_STRING}

oCCTABULAR := PushButton{self,ResourceID{JRI_TABULAR,_GetInst()}}
oCCTABULAR:HyperLabel := HyperLabel{#TABULAR,"Tabular",NULL_STRING,NULL_STRING}

oCCALTERAR := PushButton{self,ResourceID{JRI_ALTERAR,_GetInst()}}
oCCALTERAR:HyperLabel := HyperLabel{#ALTERAR,"Alterar",NULL_STRING,NULL_STRING}

oCCIncluir := PushButton{self,ResourceID{JRI_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}

oCCExcluir := PushButton{self,ResourceID{JRI_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}

oDCtheGroupBox1 := GroupBox{self,ResourceID{JRI_THEGROUPBOX1,_GetInst()}}
oDCtheGroupBox1:HyperLabel := HyperLabel{#theGroupBox1,"Descricao:",NULL_STRING,NULL_STRING}

oDCOBS01 := SingleLineEdit{self,ResourceID{JRI_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := PADRAO_CHAR_80{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Obs01:",NULL_STRING,"RI_OBS01"}

oDCOBS02 := SingleLineEdit{self,ResourceID{JRI_OBS02,_GetInst()}}
oDCOBS02:FieldSpec := PADRAO_CHAR_80{}
oDCOBS02:HyperLabel := HyperLabel{#OBS02,"Obs02:",NULL_STRING,"RI_OBS02"}

oCCescava := PushButton{self,ResourceID{JRI_ESCAVA,_GetInst()}}
oCCescava:HyperLabel := HyperLabel{#escava,"...",NULL_STRING,NULL_STRING}

oCCRadioButton1 := RadioButton{self,ResourceID{JRI_RADIOBUTTON1,_GetInst()}}
oCCRadioButton1:HyperLabel := HyperLabel{#RadioButton1,"Amostra",NULL_STRING,NULL_STRING}

oCCRadioButton2 := RadioButton{self,ResourceID{JRI_RADIOBUTTON2,_GetInst()}}
oCCRadioButton2:HyperLabel := HyperLabel{#RadioButton2,"Lote Piloto",NULL_STRING,NULL_STRING}

oCCRadioButton3 := RadioButton{self,ResourceID{JRI_RADIOBUTTON3,_GetInst()}}
oCCRadioButton3:HyperLabel := HyperLabel{#RadioButton3,"Producao",NULL_STRING,NULL_STRING}

oCCRadioButton4 := RadioButton{self,ResourceID{JRI_RADIOBUTTON4,_GetInst()}}
oCCRadioButton4:HyperLabel := HyperLabel{#RadioButton4,"Try Out",NULL_STRING,NULL_STRING}

oCCProximo := PushButton{self,ResourceID{JRI_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ICO_NEXT{}

oCCAnterior := PushButton{self,ResourceID{JRI_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ICO_PREVIOUS{}

oCCRadioButton9 := RadioButton{self,ResourceID{JRI_RADIOBUTTON9,_GetInst()}}
oCCRadioButton9:HyperLabel := HyperLabel{#RadioButton9,"Dimensional",NULL_STRING,NULL_STRING}

oCCRadioButton10 := RadioButton{self,ResourceID{JRI_RADIOBUTTON10,_GetInst()}}
oCCRadioButton10:HyperLabel := HyperLabel{#RadioButton10,"Material",NULL_STRING,NULL_STRING}

oCCRadioButton11 := RadioButton{self,ResourceID{JRI_RADIOBUTTON11,_GetInst()}}
oCCRadioButton11:HyperLabel := HyperLabel{#RadioButton11,"Desempenho",NULL_STRING,NULL_STRING}

oCCRadioButton12 := RadioButton{self,ResourceID{JRI_RADIOBUTTON12,_GetInst()}}
oCCRadioButton12:HyperLabel := HyperLabel{#RadioButton12,"Outros",NULL_STRING,NULL_STRING}

oCCcmdlaudo := PushButton{self,ResourceID{JRI_CMDLAUDO,_GetInst()}}
oCCcmdlaudo:HyperLabel := HyperLabel{#cmdlaudo,"Laudo",NULL_STRING,NULL_STRING}

oDCLAUDOF := SingleLineEdit{self,ResourceID{JRI_LAUDOF,_GetInst()}}
oDCLAUDOF:FieldSpec := PADRAO_CHAR_01{}
oDCLAUDOF:HyperLabel := HyperLabel{#LAUDOF,"Ri:",NULL_STRING,"RI_RI"}
oDCLAUDOF:BackGround := aBrushes[1]
oDCLAUDOF:Font(aFonts[1], FALSE)

oDCSC_RI1 := FixedText{self,ResourceID{JRI_SC_RI1,_GetInst()}}
oDCSC_RI1:HyperLabel := HyperLabel{#SC_RI1,"Laudo",NULL_STRING,NULL_STRING}

oDCFixedText17 := FixedText{self,ResourceID{JRI_FIXEDTEXT17,_GetInst()}}
oDCFixedText17:HyperLabel := HyperLabel{#FixedText17,"(A)provado (R)eprovado Apr(C)ondicional a(G)uarda Resposta",NULL_STRING,NULL_STRING}

oCCbuscanum := PushButton{self,ResourceID{JRI_BUSCANUM,_GetInst()}}
oCCbuscanum:Image := ico_find{}
oCCbuscanum:HyperLabel := HyperLabel{#buscanum,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscanum:TooltipText := "Localizar um GC"

oCCcmdlaudoitem := PushButton{self,ResourceID{JRI_CMDLAUDOITEM,_GetInst()}}
oCCcmdlaudoitem:HyperLabel := HyperLabel{#cmdlaudoitem,"Laudo",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JRI_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JRI_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oCCbtnPEGMS01 := PushButton{self,ResourceID{JRI_BTNPEGMS01,_GetInst()}}
oCCbtnPEGMS01:HyperLabel := HyperLabel{#btnPEGMS01,"-->",NULL_STRING,NULL_STRING}

oCCbtnPEGMA01 := PushButton{self,ResourceID{JRI_BTNPEGMA01,_GetInst()}}
oCCbtnPEGMA01:HyperLabel := HyperLabel{#btnPEGMA01,"-->",NULL_STRING,NULL_STRING}

oCCPEGINS := PushButton{self,ResourceID{JRI_PEGINS,_GetInst()}}
oCCPEGINS:HyperLabel := HyperLabel{#PEGINS,"-->",NULL_STRING,NULL_STRING}

oDCORIGEM := SingleLineEdit{self,ResourceID{JRI_ORIGEM,_GetInst()}}
oDCORIGEM:FieldSpec := PADRAO_CHAR_05{}
oDCORIGEM:HyperLabel := HyperLabel{#ORIGEM,"Ri:",NULL_STRING,"RI_RI"}
oDCORIGEM:BackGround := aBrushes[1]
oDCORIGEM:Font(aFonts[1], FALSE)

oDCSC_RI2x := FixedText{self,ResourceID{JRI_SC_RI2X,_GetInst()}}
oDCSC_RI2x:HyperLabel := HyperLabel{#SC_RI2x,"Origem",NULL_STRING,NULL_STRING}

oCCcmdorigem := PushButton{self,ResourceID{JRI_CMDORIGEM,_GetInst()}}
oCCcmdorigem:HyperLabel := HyperLabel{#cmdorigem,"(A)vulsa(P)lano de Controle",NULL_STRING,NULL_STRING}

oCCcmdlaudoitem1 := PushButton{self,ResourceID{JRI_CMDLAUDOITEM1,_GetInst()}}
oCCcmdlaudoitem1:HyperLabel := HyperLabel{#cmdlaudoitem1,"TipIns",NULL_STRING,NULL_STRING}

oDCFixedText18 := FixedText{self,ResourceID{JRI_FIXEDTEXT18,_GetInst()}}
oDCFixedText18:HyperLabel := HyperLabel{#FixedText18,"Alto(I)mpacto Critica(P)roduto Seguranca(O)perador AltoImpacto(C)liente (S)eguranca",NULL_STRING,NULL_STRING}

oDCisoi := FixedText{self,ResourceID{JRI_ISOI,_GetInst()}}
oDCisoi:HyperLabel := HyperLabel{#isoi,">",NULL_STRING,NULL_STRING}
oDCisoi:Font(aFonts[3], FALSE)

oDCisop := FixedText{self,ResourceID{JRI_ISOP,_GetInst()}}
oDCisop:HyperLabel := HyperLabel{#isop,">",NULL_STRING,NULL_STRING}
oDCisop:Font(aFonts[3], FALSE)

oDCisoo := FixedText{self,ResourceID{JRI_ISOO,_GetInst()}}
oDCisoo:HyperLabel := HyperLabel{#isoo,">",NULL_STRING,NULL_STRING}
oDCisoo:Font(aFonts[3], FALSE)

oDCisoc := FixedText{self,ResourceID{JRI_ISOC,_GetInst()}}
oDCisoc:HyperLabel := HyperLabel{#isoc,">",NULL_STRING,NULL_STRING}
oDCisoc:Font(aFonts[3], FALSE)

oDCisos := FixedText{self,ResourceID{JRI_ISOS,_GetInst()}}
oDCisos:HyperLabel := HyperLabel{#isos,">",NULL_STRING,NULL_STRING}
oDCisos:Font(aFonts[3], FALSE)

oCCcmdescmp2 := PushButton{self,ResourceID{JRI_CMDESCMP2,_GetInst()}}
oCCcmdescmp2:HyperLabel := HyperLabel{#cmdescmp2,"FX",NULL_STRING,NULL_STRING}

oDCTIPOI := RadioButtonGroup{self,ResourceID{JRI_TIPOI,_GetInst()}}
oDCTIPOI:FillUsing({ ;
						{oCCRadioButton1,"A"}, ;
						{oCCRadioButton2,"L"}, ;
						{oCCRadioButton3,"P"}, ;
						{oCCRadioButton4,"T"} ;
						})
oDCTIPOI:HyperLabel := HyperLabel{#TIPOI,"Tipo",NULL_STRING,NULL_STRING}
oDCTIPOI:FieldSpec := PADRAO_CHAR_01{}

oDCTIPO2 := RadioButtonGroup{self,ResourceID{JRI_TIPO2,_GetInst()}}
oDCTIPO2:FillUsing({ ;
						{oCCRadioButton9,"D"}, ;
						{oCCRadioButton10,"M"}, ;
						{oCCRadioButton11,"E"}, ;
						{oCCRadioButton12,"RadioButton12"} ;
						})
oDCTIPO2:HyperLabel := HyperLabel{#TIPO2,"Sub-TIPO",NULL_STRING,NULL_STRING}
oDCTIPO2:FieldSpec := PADRAO_CHAR_01{}

self:Caption := ""
self:Menu := STANDARDSHELLMENU{}
self:HyperLabel := HyperLabel{#JRI,NULL_STRING,NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRI := DataColumn{PADRAO_NUM_08{}}
oDBRI:Width := 10
oDBRI:HyperLabel := oDCRI:HyperLabel 
oDBRI:Caption := "Ri:"
oDBRI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRI)

oDBDESENHO := DataColumn{PADRAO_CHAR_24{}}
oDBDESENHO:Width := 21
oDBDESENHO:HyperLabel := oDCDESENHO:HyperLabel 
oDBDESENHO:Caption := "Desenho:"
self:Browser:AddColumn(oDBDESENHO)

oDBSEQ := DataColumn{PADRAO_NUM_03{}}
oDBSEQ:Width := 5
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
self:Browser:AddColumn(oDBSEQ)

oDBSSQ := DataColumn{PADRAO_NUM_03{}}
oDBSSQ:Width := 5
oDBSSQ:HyperLabel := oDCSSQ:HyperLabel 
oDBSSQ:Caption := "Ssq:"
self:Browser:AddColumn(oDBSSQ)

oDBDESCRI := DataColumn{PADRAO_CHAR_40{}}
oDBDESCRI:Width := 11
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Descri:"
self:Browser:AddColumn(oDBDESCRI)

oDBQTL := DataColumn{PADRAO_CHAR_20{}}
oDBQTL:Width := 9
oDBQTL:HyperLabel := oDCQTL:HyperLabel 
oDBQTL:Caption := "Qtl:"
self:Browser:AddColumn(oDBQTL)

oDBRASTRO := DataColumn{padrao_char_12{}}
oDBRASTRO:Width := 8
oDBRASTRO:HyperLabel := oDCRASTRO:HyperLabel 
oDBRASTRO:Caption := "Rastro:"
self:Browser:AddColumn(oDBRASTRO)

oDBCLIENTE := DataColumn{PADRAO_NUM_08{}}
oDBCLIENTE:Width := 9
oDBCLIENTE:HyperLabel := oDCCLIENTE:HyperLabel 
oDBCLIENTE:Caption := "Cliente:"
self:Browser:AddColumn(oDBCLIENTE)

oDBCLINOME := DataColumn{PADRAO_CHAR_50{}}
oDBCLINOME:Width := 9
oDBCLINOME:HyperLabel := oDCCLINOME:HyperLabel 
oDBCLINOME:Caption := "Clinome:"
oDBCLINOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBCLINOME)


self:ViewAs(#FormView)

oSFJRII := JRII{self,JRI_JRII}
oSFJRII:show()

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


access nPOS() 
return self:FieldGet(#nPOS)


assign nPOS(uValue) 
self:FieldPut(#nPOS, uValue)
return nPOS := uValue


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


access ORIGEM() 
return self:FieldGet(#ORIGEM)


assign ORIGEM(uValue) 
self:FieldPut(#ORIGEM, uValue)
return ORIGEM := uValue


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


access RI() 
return self:FieldGet(#RI)


assign RI(uValue) 
self:FieldPut(#RI, uValue)
return RI := uValue


access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


access SSQ() 
return self:FieldGet(#SSQ)


assign SSQ(uValue) 
self:FieldPut(#SSQ, uValue)
return SSQ := uValue


access TIPO2() 
return self:FieldGet(#TIPO2)


assign TIPO2(uValue) 
self:FieldPut(#TIPO2, uValue)
return TIPO2 := uValue


access TIPOI() 
return self:FieldGet(#TIPOI)


assign TIPOI(uValue) 
self:FieldPut(#TIPOI, uValue)
return TIPOI := uValue


END CLASS
