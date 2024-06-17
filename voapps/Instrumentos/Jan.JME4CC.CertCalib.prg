#region DEFINES
STATIC DEFINE JME4CC_ALTERAR := 131 
STATIC DEFINE JME4CC_ANTERIOR := 128 
STATIC DEFINE JME4CC_BUSCAOC := 149 
STATIC DEFINE JME4CC_CMDMAT := 150 
STATIC DEFINE JME4CC_CMDPLAB := 151 
STATIC DEFINE JME4CC_CODIGO := 111 
STATIC DEFINE JME4CC_CODME04 := 114 
STATIC DEFINE JME4CC_CODME04A := 113 
STATIC DEFINE JME4CC_DANIFIC := 121 
STATIC DEFINE JME4CC_DATA := 110 
STATIC DEFINE JME4CC_DATAREV := 112 
STATIC DEFINE JME4CC_DISPLIN := 152 
STATIC DEFINE JME4CC_DISPMAT := 153 
STATIC DEFINE JME4CC_DUPLICAR := 147 
STATIC DEFINE JME4CC_EDIINS := 139 
STATIC DEFINE JME4CC_EDITIP := 138 
STATIC DEFINE JME4CC_ESCINS := 137 
STATIC DEFINE JME4CC_ESCRES := 135 
STATIC DEFINE JME4CC_ESCTIP := 136 
STATIC DEFINE JME4CC_EXCLUIR := 129 
STATIC DEFINE JME4CC_INCLUIR := 130 
STATIC DEFINE JME4CC_INSTRU := 140 
STATIC DEFINE JME4CC_JME4CCI := 126 
STATIC DEFINE JME4CC_LAUDNAO := 145 
STATIC DEFINE JME4CC_LAUDOD := 123 
STATIC DEFINE JME4CC_LAUDOF := 122 
STATIC DEFINE JME4CC_LAUDONAO := 144 
STATIC DEFINE JME4CC_LAUDOSIM := 133 
STATIC DEFINE JME4CC_LAUDSIM := 146 
STATIC DEFINE JME4CC_NOMME04 := 115 
STATIC DEFINE JME4CC_NOMTEC := 125 
STATIC DEFINE JME4CC_NOVO := 118 
STATIC DEFINE JME4CC_NUMERO := 109 
STATIC DEFINE JME4CC_NUMTEC := 124 
STATIC DEFINE JME4CC_PEGRES := 134 
STATIC DEFINE JME4CC_POROC := 148 
STATIC DEFINE JME4CC_PROXIMO := 127 
STATIC DEFINE JME4CC_SC_CODIGO := 102 
STATIC DEFINE JME4CC_SC_CODME04 := 105 
STATIC DEFINE JME4CC_SC_CODME04A := 104 
STATIC DEFINE JME4CC_SC_DATA := 101 
STATIC DEFINE JME4CC_SC_DATAREV := 103 
STATIC DEFINE JME4CC_SC_DATAREV1 := 143 
STATIC DEFINE JME4CC_SC_LAUDOF := 108 
STATIC DEFINE JME4CC_SC_NUMERO := 100 
STATIC DEFINE JME4CC_SC_TEMPER := 106 
STATIC DEFINE JME4CC_SC_UMIDADE := 107 
STATIC DEFINE JME4CC_SC_UMIDADE1 := 141 
STATIC DEFINE JME4CC_SUJOEXT := 119 
STATIC DEFINE JME4CC_SUJOINT := 120 
STATIC DEFINE JME4CC_TABULAR := 132 
STATIC DEFINE JME4CC_TEMPER := 116 
STATIC DEFINE JME4CC_UMIDADE := 117 
STATIC DEFINE JME4CC_VALPAD := 142 
#endregion

PARTIAL class JME4CC inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCODIGO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBCODME04A as DataColumn
	PROTECT oDBCODME04 as DataColumn
	PROTECT oDBNOMME04 as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_DATAREV as FIXEDTEXT
	protect oDCSC_CODME04A as FIXEDTEXT
	protect oDCSC_CODME04 as FIXEDTEXT
	protect oDCSC_TEMPER as FIXEDTEXT
	protect oDCSC_UMIDADE as FIXEDTEXT
	protect oDCSC_LAUDOF as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCDATA as DATESLE
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCDATAREV as DATESLE
	protect oDCCODME04A as SINGLELINEEDIT
	protect oDCCODME04 as SINGLELINEEDIT
	protect oDCNOMME04 as SINGLELINEEDIT
	protect oDCTEMPER as SINGLELINEEDIT
	protect oDCUMIDADE as SINGLELINEEDIT
	protect oDCNOVO as CHECKBOX
	protect oDCSUJOEXT as CHECKBOX
	protect oDCSUJOINT as CHECKBOX
	protect oDCDANIFIC as CHECKBOX
	protect oDCLAUDOF as SINGLELINEEDIT
	protect oDCLAUDOD as DATESLE
	protect oDCNUMTEC as RIGHTSLE
	protect oDCNOMTEC as SINGLELINEEDIT
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCIncluir as PUSHBUTTON
	protect oCCALTERAR as PUSHBUTTON
	protect oCCTABULAR as PUSHBUTTON
	protect oCCLaudoSim as PUSHBUTTON
	protect oCCpegres as PUSHBUTTON
	protect oCCescres as PUSHBUTTON
	protect oCCESCTIP as PUSHBUTTON
	protect oCCESCINS as PUSHBUTTON
	protect oCCediTIP as PUSHBUTTON
	protect oCCediINS as PUSHBUTTON
	protect oDCINSTRU as SINGLELINEEDIT
	protect oDCSC_UMIDADE1 as FIXEDTEXT
	protect oDCVALPAD as DATESLE
	protect oDCSC_DATAREV1 as FIXEDTEXT
	protect oCCLaudoNao as PUSHBUTTON
	protect oCCLaudNao as PUSHBUTTON
	protect oCCLaudSim as PUSHBUTTON
	protect oCCduplicar as PUSHBUTTON
	protect oCCporoc as PUSHBUTTON
	protect oCCbuscaoc as PUSHBUTTON
	protect oCCcmdMat as PUSHBUTTON
	protect oCCCMDPLAB as PUSHBUTTON
	protect oDCDISPLIN as CHECKBOX
	protect oDCDISPMAT as CHECKBOX
// 	instance NUMERO 
// 	instance DATA 
// 	instance CODIGO 
// 	instance DATAREV 
// 	instance CODME04A 
// 	instance CODME04 
// 	instance NOMME04 
// 	instance TEMPER 
// 	instance UMIDADE 
// 	instance NOVO 
// 	instance SUJOEXT 
// 	instance SUJOINT 
// 	instance DANIFIC 
// 	instance LAUDOF 
// 	instance LAUDOD 
// 	instance NUMTEC 
// 	instance NOMTEC 
// 	instance INSTRU 
// 	instance VALPAD 
// 	instance DISPLIN 
// 	instance DISPMAT 
	protect oSFJME4CCI as JME4CCI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD cmdMat( ) 
IF ! Empty(SELF:server:FIELDGET("LAUDOD"))
   alert("Já Fechada")
ENDIF	
SELF:INCLUIR()
SELF:oSFJME4CCI:server:FIELDPUT("DIMENSAO",Repl("-",80))		
SELF:INCLUIR()
SELF:oSFJME4CCI:server:FIELDPUT("DIMENSAO","MAX DESVIO SUP MATCHING:")		
SELF:INCLUIR()
SELF:oSFJME4CCI:server:FIELDPUT("DIMENSAO","MAX DESVIO SUP N MATCHING:")		
SELF:INCLUIR()
SELF:oSFJME4CCI:server:FIELDPUT("DIMENSAO","MAX DESVIO BORDA:")		
SELF:INCLUIR()
SELF:oSFJME4CCI:server:FIELDPUT("DIMENSAO","MAX DESVIO DATUM:")		
SELF:SERVER:FIELDPUT("DISPMAT",.T.)

METHOD CMDPLAB( ) 
	SELF:SERVER:FIELDPUT("INSTRU","P-LAB-001")

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CODME04() 
return self:FieldGet(#CODME04)


assign CODME04(uValue) 
self:FieldPut(#CODME04, uValue)
return CODME04 := uValue


access CODME04A() 
return self:FieldGet(#CODME04A)


assign CODME04A(uValue) 
self:FieldPut(#CODME04A, uValue)
return CODME04A := uValue


access DANIFIC() 
return self:FieldGet(#DANIFIC)


assign DANIFIC(uValue) 
self:FieldPut(#DANIFIC, uValue)
return DANIFIC := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access DATAREV() 
return self:FieldGet(#DATAREV)


assign DATAREV(uValue) 
self:FieldPut(#DATAREV, uValue)
return DATAREV := uValue


access DISPLIN() 
return self:FieldGet(#DISPLIN)


assign DISPLIN(uValue) 
self:FieldPut(#DISPLIN, uValue)
return DISPLIN := uValue


access DISPMAT() 
return self:FieldGet(#DISPMAT)


assign DISPMAT(uValue) 
self:FieldPut(#DISPMAT, uValue)
return DISPMAT := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JME4CC",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_NUMERO := FixedText{self,ResourceID{JME4CC_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JME4CC_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JME4CC_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo/Desenho",NULL_STRING,NULL_STRING}

oDCSC_DATAREV := FixedText{self,ResourceID{JME4CC_SC_DATAREV,_GetInst()}}
oDCSC_DATAREV:HyperLabel := HyperLabel{#SC_DATAREV,"Data Revisão",NULL_STRING,NULL_STRING}

oDCSC_CODME04A := FixedText{self,ResourceID{JME4CC_SC_CODME04A,_GetInst()}}
oDCSC_CODME04A:HyperLabel := HyperLabel{#SC_CODME04A,"Instrumento",NULL_STRING,NULL_STRING}

oDCSC_CODME04 := FixedText{self,ResourceID{JME4CC_SC_CODME04,_GetInst()}}
oDCSC_CODME04:HyperLabel := HyperLabel{#SC_CODME04,"Equipamento Usado Calibraçao",NULL_STRING,NULL_STRING}

oDCSC_TEMPER := FixedText{self,ResourceID{JME4CC_SC_TEMPER,_GetInst()}}
oDCSC_TEMPER:HyperLabel := HyperLabel{#SC_TEMPER,"Temperatura:",NULL_STRING,NULL_STRING}

oDCSC_UMIDADE := FixedText{self,ResourceID{JME4CC_SC_UMIDADE,_GetInst()}}
oDCSC_UMIDADE:HyperLabel := HyperLabel{#SC_UMIDADE,"Umidade:",NULL_STRING,NULL_STRING}

oDCSC_LAUDOF := FixedText{self,ResourceID{JME4CC_SC_LAUDOF,_GetInst()}}
oDCSC_LAUDOF:HyperLabel := HyperLabel{#SC_LAUDOF,"Laudo",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JME4CC_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"ME4CC_NUMERO"}
oDCNUMERO:BackGround := aBrushes[1]
oDCNUMERO:Font(aFonts[1], FALSE)

oDCDATA := DateSle{self,ResourceID{JME4CC_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"ME4CC_DATA"}

oDCCODIGO := SingleLineEdit{self,ResourceID{JME4CC_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_24{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"ME4CC_CODIGO"}

oDCDATAREV := DateSle{self,ResourceID{JME4CC_DATAREV,_GetInst()}}
oDCDATAREV:FieldSpec := date_field{}
oDCDATAREV:HyperLabel := HyperLabel{#DATAREV,"Datarev:",NULL_STRING,"ME4CC_DATAREV"}

oDCCODME04A := SingleLineEdit{self,ResourceID{JME4CC_CODME04A,_GetInst()}}
oDCCODME04A:FieldSpec := padrao_char_08{}
oDCCODME04A:HyperLabel := HyperLabel{#CODME04A,"Instrum.",NULL_STRING,"ME4CC_CODME04A"}

oDCCODME04 := SingleLineEdit{self,ResourceID{JME4CC_CODME04,_GetInst()}}
oDCCODME04:FieldSpec := padrao_char_08{}
oDCCODME04:HyperLabel := HyperLabel{#CODME04,"Equipto",NULL_STRING,"ME4CC_CODME04"}

oDCNOMME04 := SingleLineEdit{self,ResourceID{JME4CC_NOMME04,_GetInst()}}
oDCNOMME04:FieldSpec := padrao_char_30{}
oDCNOMME04:HyperLabel := HyperLabel{#NOMME04,"NomeEquipto",NULL_STRING,"ME4CC_NOMME04"}

oDCTEMPER := SingleLineEdit{self,ResourceID{JME4CC_TEMPER,_GetInst()}}
oDCTEMPER:FieldSpec := padrao_char_10{}
oDCTEMPER:HyperLabel := HyperLabel{#TEMPER,"Temper:",NULL_STRING,"ME4CC_TEMPER"}

oDCUMIDADE := SingleLineEdit{self,ResourceID{JME4CC_UMIDADE,_GetInst()}}
oDCUMIDADE:FieldSpec := padrao_char_05{}
oDCUMIDADE:HyperLabel := HyperLabel{#UMIDADE,"Umidade:",NULL_STRING,"ME4CC_UMIDADE"}

oDCNOVO := CheckBox{self,ResourceID{JME4CC_NOVO,_GetInst()}}
oDCNOVO:HyperLabel := HyperLabel{#NOVO,"Novo",NULL_STRING,"ME4CC_NOVO"}
oDCNOVO:FieldSpec := logic_field{}

oDCSUJOEXT := CheckBox{self,ResourceID{JME4CC_SUJOEXT,_GetInst()}}
oDCSUJOEXT:HyperLabel := HyperLabel{#SUJOEXT,"Sujo Externo",NULL_STRING,"ME4CC_SUJOEXT"}
oDCSUJOEXT:FieldSpec := logic_field{}

oDCSUJOINT := CheckBox{self,ResourceID{JME4CC_SUJOINT,_GetInst()}}
oDCSUJOINT:HyperLabel := HyperLabel{#SUJOINT,"Sujo Interno",NULL_STRING,"ME4CC_SUJOINT"}
oDCSUJOINT:FieldSpec := logic_field{}

oDCDANIFIC := CheckBox{self,ResourceID{JME4CC_DANIFIC,_GetInst()}}
oDCDANIFIC:HyperLabel := HyperLabel{#DANIFIC,"Danificado",NULL_STRING,"ME4CC_DANIFIC"}
oDCDANIFIC:FieldSpec := logic_field{}

oDCLAUDOF := SingleLineEdit{self,ResourceID{JME4CC_LAUDOF,_GetInst()}}
oDCLAUDOF:FieldSpec := padrao_char_01{}
oDCLAUDOF:HyperLabel := HyperLabel{#LAUDOF,"Laudof:",NULL_STRING,"ME4CC_LAUDOF"}
oDCLAUDOF:BackGround := aBrushes[1]
oDCLAUDOF:Font(aFonts[1], FALSE)

oDCLAUDOD := DateSle{self,ResourceID{JME4CC_LAUDOD,_GetInst()}}
oDCLAUDOD:FieldSpec := date_field{}
oDCLAUDOD:HyperLabel := HyperLabel{#LAUDOD,"Laudod:",NULL_STRING,"ME4CC_LAUDOD"}

oDCNUMTEC := rightSle{self,ResourceID{JME4CC_NUMTEC,_GetInst()}}
oDCNUMTEC:FieldSpec := padrao_num_08{}
oDCNUMTEC:HyperLabel := HyperLabel{#NUMTEC,"Numtec:",NULL_STRING,"ME4CC_NUMTEC"}

oDCNOMTEC := SingleLineEdit{self,ResourceID{JME4CC_NOMTEC,_GetInst()}}
oDCNOMTEC:FieldSpec := padrao_char_40{}
oDCNOMTEC:HyperLabel := HyperLabel{#NOMTEC,"DataWindow Caption",NULL_STRING,"ME4CC_NOMTEC"}

oCCProximo := PushButton{self,ResourceID{JME4CC_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ICO_NEXT{}

oCCAnterior := PushButton{self,ResourceID{JME4CC_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ICO_PREVIOUS{}

oCCExcluir := PushButton{self,ResourceID{JME4CC_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir",NULL_STRING,NULL_STRING}

oCCIncluir := PushButton{self,ResourceID{JME4CC_INCLUIR,_GetInst()}}
oCCIncluir:HyperLabel := HyperLabel{#Incluir,"Incluir",NULL_STRING,NULL_STRING}

oCCALTERAR := PushButton{self,ResourceID{JME4CC_ALTERAR,_GetInst()}}
oCCALTERAR:HyperLabel := HyperLabel{#ALTERAR,"Alterar Itens",NULL_STRING,NULL_STRING}

oCCTABULAR := PushButton{self,ResourceID{JME4CC_TABULAR,_GetInst()}}
oCCTABULAR:HyperLabel := HyperLabel{#TABULAR,"Ver Itens",NULL_STRING,NULL_STRING}

oCCLaudoSim := PushButton{self,ResourceID{JME4CC_LAUDOSIM,_GetInst()}}
oCCLaudoSim:HyperLabel := HyperLabel{#LaudoSim,"LaudoSim",NULL_STRING,NULL_STRING}

oCCpegres := PushButton{self,ResourceID{JME4CC_PEGRES,_GetInst()}}
oCCpegres:HyperLabel := HyperLabel{#pegres,"-->",NULL_STRING,NULL_STRING}

oCCescres := PushButton{self,ResourceID{JME4CC_ESCRES,_GetInst()}}
oCCescres:HyperLabel := HyperLabel{#escres,"...",NULL_STRING,NULL_STRING}

oCCESCTIP := PushButton{self,ResourceID{JME4CC_ESCTIP,_GetInst()}}
oCCESCTIP:HyperLabel := HyperLabel{#ESCTIP,NULL_STRING,NULL_STRING,NULL_STRING}
oCCESCTIP:Image := ICO_FIND{}

oCCESCINS := PushButton{self,ResourceID{JME4CC_ESCINS,_GetInst()}}
oCCESCINS:HyperLabel := HyperLabel{#ESCINS,NULL_STRING,NULL_STRING,NULL_STRING}
oCCESCINS:Image := ICO_FIND{}

oCCediTIP := PushButton{self,ResourceID{JME4CC_EDITIP,_GetInst()}}
oCCediTIP:HyperLabel := HyperLabel{#ediTIP,"E",NULL_STRING,NULL_STRING}

oCCediINS := PushButton{self,ResourceID{JME4CC_EDIINS,_GetInst()}}
oCCediINS:HyperLabel := HyperLabel{#ediINS,"E",NULL_STRING,NULL_STRING}

oDCINSTRU := SingleLineEdit{self,ResourceID{JME4CC_INSTRU,_GetInst()}}
oDCINSTRU:FieldSpec := padrao_char_20{}
oDCINSTRU:HyperLabel := HyperLabel{#INSTRU,"Umidade:",NULL_STRING,"ME4CC_UMIDADE"}

oDCSC_UMIDADE1 := FixedText{self,ResourceID{JME4CC_SC_UMIDADE1,_GetInst()}}
oDCSC_UMIDADE1:HyperLabel := HyperLabel{#SC_UMIDADE1,"Instrução",NULL_STRING,NULL_STRING}

oDCVALPAD := DateSle{self,ResourceID{JME4CC_VALPAD,_GetInst()}}
oDCVALPAD:FieldSpec := date_field{}
oDCVALPAD:HyperLabel := HyperLabel{#VALPAD,"Datarev:",NULL_STRING,"ME4CC_DATAREV"}

oDCSC_DATAREV1 := FixedText{self,ResourceID{JME4CC_SC_DATAREV1,_GetInst()}}
oDCSC_DATAREV1:HyperLabel := HyperLabel{#SC_DATAREV1,"Validade Padrão",NULL_STRING,NULL_STRING}

oCCLaudoNao := PushButton{self,ResourceID{JME4CC_LAUDONAO,_GetInst()}}
oCCLaudoNao:HyperLabel := HyperLabel{#LaudoNao,"LaudoNao",NULL_STRING,NULL_STRING}

oCCLaudNao := PushButton{self,ResourceID{JME4CC_LAUDNAO,_GetInst()}}
oCCLaudNao:HyperLabel := HyperLabel{#LaudNao,"LaudoNao",NULL_STRING,NULL_STRING}

oCCLaudSim := PushButton{self,ResourceID{JME4CC_LAUDSIM,_GetInst()}}
oCCLaudSim:HyperLabel := HyperLabel{#LaudSim,"LaudoSim",NULL_STRING,NULL_STRING}

oCCduplicar := PushButton{self,ResourceID{JME4CC_DUPLICAR,_GetInst()}}
oCCduplicar:HyperLabel := HyperLabel{#duplicar,"Duplicar",NULL_STRING,NULL_STRING}
oCCduplicar:TooltipText := "Cria uma Novo OCC com base nesta"

oCCporoc := PushButton{self,ResourceID{JME4CC_POROC,_GetInst()}}
oCCporoc:Image := ICO_AZ{}
oCCporoc:HyperLabel := HyperLabel{#poroc,NULL_STRING,NULL_STRING,NULL_STRING}
oCCporoc:TooltipText := "Ordenar Por Numero"

oCCbuscaoc := PushButton{self,ResourceID{JME4CC_BUSCAOC,_GetInst()}}
oCCbuscaoc:Image := ICO_FIND{}
oCCbuscaoc:HyperLabel := HyperLabel{#buscaoc,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaoc:TooltipText := "Localizar Um Nº OCC"

oCCcmdMat := PushButton{self,ResourceID{JME4CC_CMDMAT,_GetInst()}}
oCCcmdMat:HyperLabel := HyperLabel{#cmdMat,"Matematico",NULL_STRING,NULL_STRING}

oCCCMDPLAB := PushButton{self,ResourceID{JME4CC_CMDPLAB,_GetInst()}}
oCCCMDPLAB:HyperLabel := HyperLabel{#CMDPLAB,"PLAB",NULL_STRING,NULL_STRING}

oDCDISPLIN := CheckBox{self,ResourceID{JME4CC_DISPLIN,_GetInst()}}
oDCDISPLIN:HyperLabel := HyperLabel{#DISPLIN,"Disp.Linear",NULL_STRING,"ME4CC_DANIFIC"}
oDCDISPLIN:FieldSpec := logic_field{}

oDCDISPMAT := CheckBox{self,ResourceID{JME4CC_DISPMAT,_GetInst()}}
oDCDISPMAT:HyperLabel := HyperLabel{#DISPMAT,"Disp.Mate",NULL_STRING,"ME4CC_DANIFIC"}
oDCDISPMAT:FieldSpec := logic_field{}

self:Caption := "Certificado de Calibraçao"
self:HyperLabel := HyperLabel{#JME4CC,"Certificado de Calibraçao",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBCODIGO := DataColumn{padrao_char_24{}}
oDBCODIGO:Width := 18
oDBCODIGO:HyperLabel := oDCCODIGO:HyperLabel 
oDBCODIGO:Caption := "Codigo:"
self:Browser:AddColumn(oDBCODIGO)

oDBDATA := DataColumn{date_field{}}
oDBDATA:Width := 12
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)

oDBCODME04A := DataColumn{padrao_char_08{}}
oDBCODME04A:Width := 10
oDBCODME04A:HyperLabel := oDCCODME04A:HyperLabel 
oDBCODME04A:Caption := "Instrum."
self:Browser:AddColumn(oDBCODME04A)

oDBCODME04 := DataColumn{padrao_char_08{}}
oDBCODME04:Width := 9
oDBCODME04:HyperLabel := oDCCODME04:HyperLabel 
oDBCODME04:Caption := "Equipto"
self:Browser:AddColumn(oDBCODME04)

oDBNOMME04 := DataColumn{padrao_char_30{}}
oDBNOMME04:Width := 25
oDBNOMME04:HyperLabel := oDCNOMME04:HyperLabel 
oDBNOMME04:Caption := "NomeEquipto"
self:Browser:AddColumn(oDBNOMME04)


self:ViewAs(#FormView)

oSFJME4CCI := JME4CCI{self,JME4CC_JME4CCI}
oSFJME4CCI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access INSTRU() 
return self:FieldGet(#INSTRU)


assign INSTRU(uValue) 
self:FieldPut(#INSTRU, uValue)
return INSTRU := uValue


access LAUDOD() 
return self:FieldGet(#LAUDOD)


assign LAUDOD(uValue) 
self:FieldPut(#LAUDOD, uValue)
return LAUDOD := uValue


access LAUDOF() 
return self:FieldGet(#LAUDOF)


assign LAUDOF(uValue) 
self:FieldPut(#LAUDOF, uValue)
return LAUDOF := uValue


access NOMME04() 
return self:FieldGet(#NOMME04)


assign NOMME04(uValue) 
self:FieldPut(#NOMME04, uValue)
return NOMME04 := uValue


access NOMTEC() 
return self:FieldGet(#NOMTEC)


assign NOMTEC(uValue) 
self:FieldPut(#NOMTEC, uValue)
return NOMTEC := uValue


access NOVO() 
return self:FieldGet(#NOVO)


assign NOVO(uValue) 
self:FieldPut(#NOVO, uValue)
return NOVO := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access NUMTEC() 
return self:FieldGet(#NUMTEC)


assign NUMTEC(uValue) 
self:FieldPut(#NUMTEC, uValue)
return NUMTEC := uValue


METHOD poroc( ) 
	SELF:KeyFind()

access SUJOEXT() 
return self:FieldGet(#SUJOEXT)


assign SUJOEXT(uValue) 
self:FieldPut(#SUJOEXT, uValue)
return SUJOEXT := uValue


access SUJOINT() 
return self:FieldGet(#SUJOINT)


assign SUJOINT(uValue) 
self:FieldPut(#SUJOINT, uValue)
return SUJOINT := uValue


access TEMPER() 
return self:FieldGet(#TEMPER)


assign TEMPER(uValue) 
self:FieldPut(#TEMPER, uValue)
return TEMPER := uValue


access UMIDADE() 
return self:FieldGet(#UMIDADE)


assign UMIDADE(uValue) 
self:FieldPut(#UMIDADE, uValue)
return UMIDADE := uValue


access VALPAD() 
return self:FieldGet(#VALPAD)


assign VALPAD(uValue) 
self:FieldPut(#VALPAD, uValue)
return VALPAD := uValue


END CLASS
