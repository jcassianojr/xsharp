#region DEFINES
STATIC DEFINE JORCA_ALTERAR := 123
STATIC DEFINE JORCA_ANTERIOR := 107
STATIC DEFINE JORCA_BUSCACOD := 114
STATIC DEFINE JORCA_BUSCAOV := 112
STATIC DEFINE JORCA_CLIENTE := 100
STATIC DEFINE JORCA_CLINOME := 101
STATIC DEFINE JORCA_DATA := 102
STATIC DEFINE JORCA_DUPLICAR := 110
STATIC DEFINE JORCA_ESCFOR := 108
STATIC DEFINE JORCA_EXCLUIR := 122
STATIC DEFINE JORCA_EXPORTAR := 109
STATIC DEFINE JORCA_IMPORTAR := 104
STATIC DEFINE JORCA_JORCAI := 121
STATIC DEFINE JORCA_NOVO := 120
STATIC DEFINE JORCA_ORCA := 119
STATIC DEFINE JORCA_PEGMA01 := 113 
STATIC DEFINE JORCA_POROV := 111
STATIC DEFINE JORCA_PROXIMO := 106
STATIC DEFINE JORCA_REVI := 116
STATIC DEFINE JORCA_SC_CFER := 120 
STATIC DEFINE JORCA_SC_CLIENTE := 118
STATIC DEFINE JORCA_SC_CLIENTE1 := 115
STATIC DEFINE JORCA_SC_OBS02 := 126 
STATIC DEFINE JORCA_SC_OBS03 := 128 
STATIC DEFINE JORCA_SC_OBS04 := 130 
STATIC DEFINE JORCA_SC_OBS05 := 132 
STATIC DEFINE JORCA_SC_OBS06 := 134 
STATIC DEFINE JORCA_SC_ORCA := 117
STATIC DEFINE JORCA_TABORCA := 105
STATIC DEFINE JORCA_TABULAR := 124
STATIC DEFINE JORCA_VIABILI := 103
STATIC DEFINE TABCONTROL1_PAGE1_AC := 100 
STATIC DEFINE TABCONTROL1_PAGE1_CAMBIO := 101 
STATIC DEFINE TABCONTROL1_PAGE1_DATA := 103 
STATIC DEFINE TABCONTROL1_PAGE1_NIVEL := 104 
STATIC DEFINE TABCONTROL1_PAGE1_ORC := 105 
STATIC DEFINE TABCONTROL1_PAGE1_ORC01 := 106 
STATIC DEFINE TABCONTROL1_PAGE1_ORC02 := 107 
STATIC DEFINE TABCONTROL1_PAGE1_REFER := 102 
STATIC DEFINE TABCONTROL1_PAGE1_SC_AC := 111 
STATIC DEFINE TABCONTROL1_PAGE1_SC_DATA := 109 
STATIC DEFINE TABCONTROL1_PAGE1_SC_DATA1 := 112 
STATIC DEFINE TABCONTROL1_PAGE1_SC_DATA2 := 113 
STATIC DEFINE TABCONTROL1_PAGE1_SC_ORC := 108 
STATIC DEFINE TABCONTROL1_PAGE1_SC_REFER := 110 
STATIC DEFINE TABORCA_PAGE2_CFER := 101 
STATIC DEFINE TABORCA_PAGE2_CPAG := 100 
STATIC DEFINE TABORCA_PAGE2_CVAL := 102 
STATIC DEFINE TABORCA_PAGE2_PRAZ2 := 104 
STATIC DEFINE TABORCA_PAGE2_PRAZ3 := 105 
STATIC DEFINE TABORCA_PAGE2_PRAZ4 := 106 
STATIC DEFINE TABORCA_PAGE2_PRAZO := 103 
STATIC DEFINE TABORCA_PAGE2_SC_CPAG := 109 
STATIC DEFINE TABORCA_PAGE2_SC_CVAL := 107 
STATIC DEFINE TABORCA_PAGE2_SC_PRAZO := 110 
STATIC DEFINE TABORCA_PAGE2_THEFIXEDTEXT15 := 108 
STATIC DEFINE TABORCA_PAGE3_OBS01 := 100 
STATIC DEFINE TABORCA_PAGE3_OBS02 := 101 
STATIC DEFINE TABORCA_PAGE3_OBS03 := 102 
STATIC DEFINE TABORCA_PAGE3_OBS04 := 103 
STATIC DEFINE TABORCA_PAGE3_OBS05 := 104 
STATIC DEFINE TABORCA_PAGE3_OBS06 := 105 
STATIC DEFINE TABORCA_PAGE3_OBS07 := 106 
STATIC DEFINE TABORCA_PAGE3_OBS08 := 107 
STATIC DEFINE TABORCA_PAGE3_SC_OBS01 := 108 
STATIC DEFINE TABORCA_PAGE4_CARGO := 101
STATIC DEFINE TABORCA_PAGE4_FT27 := 103
STATIC DEFINE TABORCA_PAGE4_FT28 := 102
STATIC DEFINE TABORCA_PAGE4_FT29 := 104
STATIC DEFINE TABORCA_PAGE4_RESPO := 100
STATIC DEFINE TABORCA_PAGE4_SETOR := 105
#endregion

PARTIAL CLASS JORCA INHERIT MYDataWindow
PROTECT oDBORCA AS DataColumn
PROTECT oDBDATA AS DataColumn
PROTECT oDBCLIENTE AS DataColumn
PROTECT oDBCLINOME AS DataColumn
PROTECT oDCCLIENTE AS rightSle
PROTECT oDCCLINOME AS SINGLELINEEDIT
PROTECT oDCVIABILI AS rightSle
PROTECT oCCImportar AS PUSHBUTTON
PROTECT oDCTABORCA AS TABCONTROL
PROTECT oTPTABCONTROL1_PAGE1 AS TABCONTROL1_PAGE1
PROTECT oTPTABORCA_PAGE2 AS TABORCA_PAGE2
PROTECT oTPTABORCA_PAGE3 AS TABORCA_PAGE3
PROTECT oTPTABORCA_PAGE4 AS TABORCA_PAGE4
PROTECT oCCProximo AS PUSHBUTTON
PROTECT oCCAnterior AS PUSHBUTTON
PROTECT oCCescfor AS PUSHBUTTON
PROTECT oCCExportar AS PUSHBUTTON
PROTECT oCCDuplicar AS PUSHBUTTON
PROTECT oCCporov AS PUSHBUTTON
PROTECT oCCbuscaov AS PUSHBUTTON
PROTECT oCCbtnpegma01 AS PUSHBUTTON
PROTECT oCCbuscacod AS PUSHBUTTON
PROTECT oDCSC_CLIENTE1 AS FIXEDTEXT
PROTECT oDCREVI AS SINGLELINEEDIT
PROTECT oDCSC_ORCA AS FIXEDTEXT
PROTECT oDCSC_CLIENTE AS FIXEDTEXT
PROTECT oDCORCA AS SINGLELINEEDIT
PROTECT oCCNOVO AS PUSHBUTTON
PROTECT oSFJORCAI AS JORCAI
PROTECT oCCExcluir AS PUSHBUTTON
PROTECT oCCALTERAR AS PUSHBUTTON
PROTECT oCCTabular AS PUSHBUTTON

// User code starts here (DO NOT remove this line)  ##USER##

ACCESS AREA() 
RETURN SELF:FieldGet(#AREA)


ACCESS CLIENTE
RETURN SELF:FieldGet( #CLIENTE )

ASSIGN CLIENTE( uValue )
SELF:FieldPut( #CLIENTE , uValue )

ACCESS CLINOME
RETURN SELF:FieldGet( #CLINOME )

ASSIGN CLINOME( uValue )
SELF:FieldPut( #CLINOME , uValue )

ACCESS DATA
RETURN SELF:FieldGet( #DATA )

ASSIGN DATA( uValue )
SELF:FieldPut( #DATA , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"JORCA" , _GetInst()},iCtlID)

	SELF:oDCCLIENTE := rightSle{SELF , ResourceID{ JORCA_CLIENTE  , _GetInst() } }
	SELF:oDCCLIENTE:FieldSpec := padrao_num_08{}
	SELF:oDCCLIENTE:TooltipText := "Codigo do Cliente"
	SELF:oDCCLIENTE:HyperLabel := HyperLabel{#CLIENTE , "Cliente:" , NULL_STRING , "ORCA_CLIENTE"}

	SELF:oDCCLINOME := SINGLELINEEDIT{SELF , ResourceID{ JORCA_CLINOME  , _GetInst() } }
	SELF:oDCCLINOME:FieldSpec := padrao_char_50{}
	SELF:oDCCLINOME:HyperLabel := HyperLabel{#CLINOME , "Clinome:" , NULL_STRING , "ORCA_CLINOME"}

	SELF:oDCVIABILI := rightSle{SELF , ResourceID{ JORCA_VIABILI  , _GetInst() } }
	SELF:oDCVIABILI:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCVIABILI:TooltipText := "Preencha Numero da Viabilidade para Importar"
	SELF:oDCVIABILI:FocusSelect := FSEL_ALL
	SELF:oDCVIABILI:HyperLabel := HyperLabel{#VIABILI , "Cliente:" , NULL_STRING , "VIABILI_OV"}

	SELF:oCCImportar := PUSHBUTTON{SELF , ResourceID{ JORCA_IMPORTAR  , _GetInst() } }
	SELF:oCCImportar:TooltipText := "Preenche o Item com Dados da Viabilidade"
	SELF:oCCImportar:HyperLabel := HyperLabel{#Importar , "Viab. Importar" , NULL_STRING , NULL_STRING}

	SELF:oDCTABORCA := TABCONTROL{SELF , ResourceID{ JORCA_TABORCA  , _GetInst() } }
	SELF:oDCTABORCA:HyperLabel := HyperLabel{#TABORCA , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCProximo := PUSHBUTTON{SELF , ResourceID{ JORCA_PROXIMO  , _GetInst() } }
	SELF:oCCProximo:TooltipText := "Avanca Item Posterior"
	SELF:oCCProximo:Image := ico_next{}
	SELF:oCCProximo:HyperLabel := HyperLabel{#Proximo , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCAnterior := PUSHBUTTON{SELF , ResourceID{ JORCA_ANTERIOR  , _GetInst() } }
	SELF:oCCAnterior:TooltipText := "Retorna Item anterior"
	SELF:oCCAnterior:Image := ico_previous{}
	SELF:oCCAnterior:HyperLabel := HyperLabel{#Anterior , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCescfor := PUSHBUTTON{SELF , ResourceID{ JORCA_ESCFOR  , _GetInst() } }
	SELF:oCCescfor:TooltipText := "Clique Para Ver Lista de Cliente"
	SELF:oCCescfor:HyperLabel := HyperLabel{#escfor , "..." , NULL_STRING , NULL_STRING}

	SELF:oCCExportar := PUSHBUTTON{SELF , ResourceID{ JORCA_EXPORTAR  , _GetInst() } }
	SELF:oCCExportar:TooltipText := "Preenche Viabilidade com os Dados do Item"
	SELF:oCCExportar:HyperLabel := HyperLabel{#Exportar , "Viab. Exportar" , NULL_STRING , NULL_STRING}

	SELF:oCCDuplicar := PUSHBUTTON{SELF , ResourceID{ JORCA_DUPLICAR  , _GetInst() } }
	SELF:oCCDuplicar:TooltipText := "Clique para Duplicar Um Orçamento"
	SELF:oCCDuplicar:HyperLabel := HyperLabel{#Duplicar , "Duplicar" , NULL_STRING , NULL_STRING}

	SELF:oCCporov := PUSHBUTTON{SELF , ResourceID{ JORCA_POROV  , _GetInst() } }
	SELF:oCCporov:TooltipText := "Ordenar Por Numero"
	SELF:oCCporov:Image := ico_az{}
	SELF:oCCporov:HyperLabel := HyperLabel{#porov , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCbuscaov := PUSHBUTTON{SELF , ResourceID{ JORCA_BUSCAOV  , _GetInst() } }
	SELF:oCCbuscaov:TooltipText := "Localizar Um Nº Orçamento"
	SELF:oCCbuscaov:Image := ico_find{}
	SELF:oCCbuscaov:HyperLabel := HyperLabel{#buscaov , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCbtnpegma01 := PUSHBUTTON{SELF , ResourceID{ JORCA_BTNPEGMA01  , _GetInst() } }
	SELF:oCCbtnpegma01:TooltipText := "Clique Para Preencher Nome do Cliente"
	SELF:oCCbtnpegma01:HyperLabel := HyperLabel{#btnpegma01 , "-->" , NULL_STRING , NULL_STRING}

	SELF:oCCbuscacod := PUSHBUTTON{SELF , ResourceID{ JORCA_BUSCACOD  , _GetInst() } }
	SELF:oCCbuscacod:TooltipText := "Localizar Um Codigo"
	SELF:oCCbuscacod:Image := ico_find{}
	SELF:oCCbuscacod:HyperLabel := HyperLabel{#buscacod , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCSC_CLIENTE1 := FIXEDTEXT{SELF , ResourceID{ JORCA_SC_CLIENTE1  , _GetInst() } }
	SELF:oDCSC_CLIENTE1:HyperLabel := HyperLabel{#SC_CLIENTE1 , "Revisao" , NULL_STRING , NULL_STRING}

	SELF:oDCREVI := SINGLELINEEDIT{SELF , ResourceID{ JORCA_REVI  , _GetInst() } }
	SELF:oDCREVI:FieldSpec := padrao_char_01{}
	SELF:oDCREVI:TooltipText := "Codigo do Cliente"
	SELF:oDCREVI:HyperLabel := HyperLabel{#REVI , "Cliente:" , NULL_STRING , "ORCA_CLIENTE"}

	SELF:oDCSC_ORCA := FIXEDTEXT{SELF , ResourceID{ JORCA_SC_ORCA  , _GetInst() } }
	SELF:oDCSC_ORCA:HyperLabel := HyperLabel{#SC_ORCA , "Orca:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_CLIENTE := FIXEDTEXT{SELF , ResourceID{ JORCA_SC_CLIENTE  , _GetInst() } }
	SELF:oDCSC_CLIENTE:HyperLabel := HyperLabel{#SC_CLIENTE , "Cliente:" , NULL_STRING , NULL_STRING}

	SELF:oDCORCA := SINGLELINEEDIT{SELF , ResourceID{ JORCA_ORCA  , _GetInst() } }
	SELF:oDCORCA:FieldSpec := padrao_num_08{}
	SELF:oDCORCA:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 12 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCORCA:Font( oFont )
	SELF:oDCORCA:HyperLabel := HyperLabel{#ORCA , "Orcamento:" , NULL_STRING , "ORCA_ORCA"}

	SELF:oCCNOVO := PUSHBUTTON{SELF , ResourceID{ JORCA_NOVO  , _GetInst() } }
	SELF:oCCNOVO:TooltipText := "Inclui um Item no Orçamento"
	SELF:oCCNOVO:HyperLabel := HyperLabel{#NOVO , "Novo" , NULL_STRING , NULL_STRING}

	SELF:oCCExcluir := PUSHBUTTON{SELF , ResourceID{ JORCA_EXCLUIR  , _GetInst() } }
	SELF:oCCExcluir:TooltipText := "Exclui o Item em destaque"
	SELF:oCCExcluir:HyperLabel := HyperLabel{#Excluir , "Excluir" , NULL_STRING , NULL_STRING}

	SELF:oCCALTERAR := PUSHBUTTON{SELF , ResourceID{ JORCA_ALTERAR  , _GetInst() } }
	SELF:oCCALTERAR:TooltipText := "Editar O Item do Orçamento"
	SELF:oCCALTERAR:HyperLabel := HyperLabel{#ALTERAR , "Alterar" , NULL_STRING , NULL_STRING}

	SELF:oCCTabular := PUSHBUTTON{SELF , ResourceID{ JORCA_TABULAR  , _GetInst() } }
	SELF:oCCTabular:TooltipText := "Exibir Lista Itens"
	SELF:oCCTabular:HyperLabel := HyperLabel{#Tabular , "Ver Itens" , NULL_STRING , NULL_STRING}

	SELF:Caption := "Orçamentos"
	SELF:Menu := STANDARDSHELLMENU{}
	SELF:ClipperKeys := TRUE
	SELF:HyperLabel := HyperLabel{#JORCA , "Orçamentos" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF

	SELF:Browser := DataBrowser{SELF}

	SELF:oDBORCA := DataColumn{padrao_num_08{}}
	SELF:oDBORCA:Width := 11
	SELF:oDBORCA:HyperLabel := SELF:oDCORCA:HyperLabel
	SELF:oDBORCA:Caption := "Orcamento:"
	SELF:Browser:AddColumn(SELF:oDBORCA)

	SELF:oDBDATA := DataColumn{date_field{}}
	SELF:oDBDATA:Width := 14
	SELF:oDBDATA:HyperLabel := HyperLabel{#DATA,"Data:", NULL_STRING, "ORCA_DATA"}
	SELF:oDBDATA:Caption := "Data:"
	SELF:Browser:AddColumn(SELF:oDBDATA)

	SELF:oDBCLIENTE := DataColumn{padrao_num_08{}}
	SELF:oDBCLIENTE:Width := 9
	SELF:oDBCLIENTE:HyperLabel := SELF:oDCCLIENTE:HyperLabel
	SELF:oDBCLIENTE:Caption := "Cliente:"
	SELF:Browser:AddColumn(SELF:oDBCLIENTE)

	SELF:oDBCLINOME := DataColumn{padrao_char_50{}}
	SELF:oDBCLINOME:Width := 9
	SELF:oDBCLINOME:HyperLabel := SELF:oDCCLINOME:HyperLabel
	SELF:oDBCLINOME:Caption := "Clinome:"
	SELF:Browser:AddColumn(SELF:oDBCLINOME)

	SELF:ViewAs(#FormView)

	SELF:oSFJORCAI := JORCAI{SELF , JORCA_JORCAI }
	SELF:oSFJORCAI:Show()
	SELF:oTPTABCONTROL1_PAGE1 := TABCONTROL1_PAGE1{SELF , 0}
	SELF:oDCTABORCA:AppendTab(#TABCONTROL1_PAGE1 , "Basico" , SELF:oTPTABCONTROL1_PAGE1 , 0)
	SELF:oTPTABORCA_PAGE2 := TABORCA_PAGE2{SELF , 0}
	SELF:oDCTABORCA:AppendTab(#TABORCA_PAGE2 , "Prazos" , SELF:oTPTABORCA_PAGE2 , 0)
	SELF:oTPTABORCA_PAGE3 := TABORCA_PAGE3{SELF , 0}
	SELF:oDCTABORCA:AppendTab(#TABORCA_PAGE3 , "Observações" , SELF:oTPTABORCA_PAGE3 , 0)
	SELF:oTPTABORCA_PAGE4 := TABORCA_PAGE4{SELF , 0}
	SELF:oDCTABORCA:AppendTab(#TABORCA_PAGE4 , "Assinante" , SELF:oTPTABORCA_PAGE4 , 0)
	SELF:oDCTABORCA:SelectTab(#TABCONTROL1_PAGE1)

	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS ORCA
RETURN SELF:FieldGet( #ORCA )

ASSIGN ORCA( uValue )
SELF:FieldPut( #ORCA , uValue )

ACCESS REVI
RETURN SELF:FieldGet( #REVI )

ASSIGN REVI( uValue )
SELF:FieldPut( #REVI , uValue )

ACCESS VIABILI
RETURN SELF:FieldGet( #VIABILI )

ASSIGN VIABILI( uValue )
SELF:FieldPut( #VIABILI , uValue )

END CLASS
CLASS TabControl1_Page1 INHERIT DATAWINDOW 

	PROTECT oDCAC AS SINGLELINEEDIT
	PROTECT oDCcambio AS SINGLELINEEDIT
	PROTECT oDCREFER AS SINGLELINEEDIT
	PROTECT oDCDATA AS DATESLE
	PROTECT oDCNIVEL AS DATESLE
	PROTECT oDCORC AS SINGLELINEEDIT
	PROTECT oDCORC01 AS SINGLELINEEDIT
	PROTECT oDCORC02 AS SINGLELINEEDIT
	PROTECT oDCSC_ORC AS FIXEDTEXT
	PROTECT oDCSC_DATA AS FIXEDTEXT
	PROTECT oDCSC_REFER AS FIXEDTEXT
	PROTECT oDCSC_AC AS FIXEDTEXT
	PROTECT oDCSC_DATA1 AS FIXEDTEXT
	PROTECT oDCSC_DATA2 AS FIXEDTEXT
// 	instance AC 
// 	instance cambio 
// 	instance REFER 
// 	instance DATA 
// 	instance NIVEL 
// 	instance ORC 
// 	instance ORC01 
// 	instance ORC02 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

ACCESS AC() 
RETURN SELF:FieldGet(#AC)


ASSIGN AC(uValue) 
SELF:FieldPut(#AC, uValue)
RETURN AC := uValue


ACCESS cambio() 
RETURN SELF:FieldGet(#cambio)


ASSIGN cambio(uValue) 
SELF:FieldPut(#cambio, uValue)
RETURN cambio := uValue


ACCESS DATA() 
RETURN SELF:FieldGet(#DATA)


ASSIGN DATA(uValue) 
SELF:FieldPut(#DATA, uValue)
RETURN DATA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"TabControl1_Page1",_GetInst()},iCtlID)

oDCAC := SingleLineEdit{SELF,ResourceID{TABCONTROL1_PAGE1_AC,_GetInst()}}
oDCAC:FieldSpec := padrao_char_40{}
oDCAC:HyperLabel := HyperLabel{#AC,"Ac:",NULL_STRING,"ORCA_AC"}
oDCAC:TooltipText := "Aos Cuidados de"

oDCcambio := SingleLineEdit{SELF,ResourceID{TABCONTROL1_PAGE1_CAMBIO,_GetInst()}}
oDCcambio:FieldSpec := padrao_char_15{}
oDCcambio:HyperLabel := HyperLabel{#cambio,"Data:",NULL_STRING,"ORCA_DATA"}
oDCcambio:TooltipText := "Data do Nivel Economico"

oDCREFER := SingleLineEdit{SELF,ResourceID{TABCONTROL1_PAGE1_REFER,_GetInst()}}
oDCREFER:FieldSpec := padrao_char_20{}
oDCREFER:HyperLabel := HyperLabel{#REFER,"Refer:",NULL_STRING,"ORCA_REFER"}
oDCREFER:TooltipText := "Nome do Departamento"

oDCDATA := DateSle{SELF,ResourceID{TABCONTROL1_PAGE1_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"ORCA_DATA"}
oDCDATA:TooltipText := "Data Orçamento"

oDCNIVEL := DateSle{SELF,ResourceID{TABCONTROL1_PAGE1_NIVEL,_GetInst()}}
oDCNIVEL:FieldSpec := DATE_FIELD{}
oDCNIVEL:HyperLabel := HyperLabel{#NIVEL,"Data:",NULL_STRING,"ORCA_DATA"}
oDCNIVEL:TooltipText := "Data do Nivel Economico"

oDCORC := SingleLineEdit{SELF,ResourceID{TABCONTROL1_PAGE1_ORC,_GetInst()}}
oDCORC:FieldSpec := padrao_char_40{}
oDCORC:HyperLabel := HyperLabel{#ORC,"Orc:",NULL_STRING,"ORCA_ORC"}
oDCORC:TooltipText := "Linha Descritiva"

oDCORC01 := SingleLineEdit{SELF,ResourceID{TABCONTROL1_PAGE1_ORC01,_GetInst()}}
oDCORC01:FieldSpec := padrao_char_100{}
oDCORC01:HyperLabel := HyperLabel{#ORC01,"Orc01:",NULL_STRING,"ORCA_ORC01"}
oDCORC01:TooltipText := "Linha Descritiva"

oDCORC02 := SingleLineEdit{SELF,ResourceID{TABCONTROL1_PAGE1_ORC02,_GetInst()}}
oDCORC02:FieldSpec := padrao_char_100{}
oDCORC02:HyperLabel := HyperLabel{#ORC02,"Orc02:",NULL_STRING,"ORCA_ORC02"}
oDCORC02:TooltipText := "Linha Descritiva"

oDCSC_ORC := FixedText{SELF,ResourceID{TABCONTROL1_PAGE1_SC_ORC,_GetInst()}}
oDCSC_ORC:HyperLabel := HyperLabel{#SC_ORC,"Orcamento:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{SELF,ResourceID{TABCONTROL1_PAGE1_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_REFER := FixedText{SELF,ResourceID{TABCONTROL1_PAGE1_SC_REFER,_GetInst()}}
oDCSC_REFER:HyperLabel := HyperLabel{#SC_REFER,"Depto:",NULL_STRING,NULL_STRING}

oDCSC_AC := FixedText{SELF,ResourceID{TABCONTROL1_PAGE1_SC_AC,_GetInst()}}
oDCSC_AC:HyperLabel := HyperLabel{#SC_AC,"Ac:",NULL_STRING,NULL_STRING}

oDCSC_DATA1 := FixedText{SELF,ResourceID{TABCONTROL1_PAGE1_SC_DATA1,_GetInst()}}
oDCSC_DATA1:HyperLabel := HyperLabel{#SC_DATA1,"Nivel Economico:",NULL_STRING,NULL_STRING}

oDCSC_DATA2 := FixedText{SELF,ResourceID{TABCONTROL1_PAGE1_SC_DATA2,_GetInst()}}
oDCSC_DATA2:HyperLabel := HyperLabel{#SC_DATA2,"Cambio/Rate",NULL_STRING,NULL_STRING}

SELF:Caption := "DataWindow Caption"
SELF:HyperLabel := HyperLabel{#TabControl1_Page1,"DataWindow Caption",NULL_STRING,NULL_STRING}
SELF:ClipperKeys := TRUE

IF !IsNil(oServer)
	SELF:Use(oServer)
ELSE
	SELF:Use(SELF:Owner:Server)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


ACCESS NIVEL() 
RETURN SELF:FieldGet(#NIVEL)


ASSIGN NIVEL(uValue) 
SELF:FieldPut(#NIVEL, uValue)
RETURN NIVEL := uValue


ACCESS ORC() 
RETURN SELF:FieldGet(#ORC)


ASSIGN ORC(uValue) 
SELF:FieldPut(#ORC, uValue)
RETURN ORC := uValue


ACCESS ORC01() 
RETURN SELF:FieldGet(#ORC01)


ASSIGN ORC01(uValue) 
SELF:FieldPut(#ORC01, uValue)
RETURN ORC01 := uValue


ACCESS ORC02() 
RETURN SELF:FieldGet(#ORC02)


ASSIGN ORC02(uValue) 
SELF:FieldPut(#ORC02, uValue)
RETURN ORC02 := uValue


ACCESS REFER() 
RETURN SELF:FieldGet(#REFER)


ASSIGN REFER(uValue) 
SELF:FieldPut(#REFER, uValue)
RETURN REFER := uValue


END CLASS
CLASS TABORCA_Page2 INHERIT DATAWINDOW 

	PROTECT oDCCPAG AS SINGLELINEEDIT
	PROTECT oDCCFER AS SINGLELINEEDIT
	PROTECT oDCCVAL AS SINGLELINEEDIT
	PROTECT oDCPRAZO AS SINGLELINEEDIT
	PROTECT oDCPRAZ2 AS SINGLELINEEDIT
	PROTECT oDCPRAZ3 AS SINGLELINEEDIT
	PROTECT oDCPRAZ4 AS SINGLELINEEDIT
	PROTECT oDCSC_CVAL AS FIXEDTEXT
	PROTECT oDCtheFixedText15 AS FIXEDTEXT
	PROTECT oDCSC_CPAG AS FIXEDTEXT
	PROTECT oDCSC_PRAZO AS FIXEDTEXT
// 	instance CPAG 
// 	instance CFER 
// 	instance CVAL 
// 	instance PRAZO 
// 	instance PRAZ2 
// 	instance PRAZ3 
// 	instance PRAZ4 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

ACCESS CFER() 
RETURN SELF:FieldGet(#CFER)


ASSIGN CFER(uValue) 
SELF:FieldPut(#CFER, uValue)
RETURN CFER := uValue


ACCESS CPAG() 
RETURN SELF:FieldGet(#CPAG)


ASSIGN CPAG(uValue) 
SELF:FieldPut(#CPAG, uValue)
RETURN CPAG := uValue


ACCESS CVAL() 
RETURN SELF:FieldGet(#CVAL)


ASSIGN CVAL(uValue) 
SELF:FieldPut(#CVAL, uValue)
RETURN CVAL := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"TABORCA_Page2",_GetInst()},iCtlID)

oDCCPAG := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE2_CPAG,_GetInst()}}
oDCCPAG:FieldSpec := padrao_char_50{}
oDCCPAG:HyperLabel := HyperLabel{#CPAG,"Cpag:",NULL_STRING,"ORCA_CPAG"}
oDCCPAG:TooltipText := "Condiçao de Pagamento da Peça"

oDCCFER := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE2_CFER,_GetInst()}}
oDCCFER:FieldSpec := padrao_char_100{}
oDCCFER:HyperLabel := HyperLabel{#CFER,"Cfer:",NULL_STRING,"ORCA_CFER"}
oDCCFER:TooltipText := "Condiçao de Pagamento da Ferramenta"

oDCCVAL := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE2_CVAL,_GetInst()}}
oDCCVAL:FieldSpec := padrao_char_20{}
oDCCVAL:HyperLabel := HyperLabel{#CVAL,"Cval:",NULL_STRING,"ORCA_CVAL"}
oDCCVAL:TooltipText := "Validade do Orçamento"

oDCPRAZO := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE2_PRAZO,_GetInst()}}
oDCPRAZO:FieldSpec := padrao_char_150{}
oDCPRAZO:HyperLabel := HyperLabel{#PRAZO,"Prazo:",NULL_STRING,"ORCA_PRAZO"}
oDCPRAZO:TooltipText := "Descritivo do Prazo"

oDCPRAZ2 := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE2_PRAZ2,_GetInst()}}
oDCPRAZ2:FieldSpec := padrao_char_150{}
oDCPRAZ2:HyperLabel := HyperLabel{#PRAZ2,"Prazo:",NULL_STRING,"ORCA_PRAZO"}
oDCPRAZ2:TooltipText := "Descritivo do Prazo"

oDCPRAZ3 := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE2_PRAZ3,_GetInst()}}
oDCPRAZ3:FieldSpec := padrao_char_150{}
oDCPRAZ3:HyperLabel := HyperLabel{#PRAZ3,"Prazo:",NULL_STRING,"ORCA_PRAZO"}
oDCPRAZ3:TooltipText := "Descritivo do Prazo"

oDCPRAZ4 := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE2_PRAZ4,_GetInst()}}
oDCPRAZ4:FieldSpec := padrao_char_150{}
oDCPRAZ4:HyperLabel := HyperLabel{#PRAZ4,"Prazo:",NULL_STRING,"ORCA_PRAZO"}
oDCPRAZ4:TooltipText := "Descritivo do Prazo"

oDCSC_CVAL := FixedText{SELF,ResourceID{TABORCA_PAGE2_SC_CVAL,_GetInst()}}
oDCSC_CVAL:HyperLabel := HyperLabel{#SC_CVAL,"Validade",NULL_STRING,NULL_STRING}

oDCtheFixedText15 := FixedText{SELF,ResourceID{TABORCA_PAGE2_THEFIXEDTEXT15,_GetInst()}}
oDCtheFixedText15:HyperLabel := HyperLabel{#theFixedText15,"Cond. Pag. Ferramenta:",NULL_STRING,NULL_STRING}

oDCSC_CPAG := FixedText{SELF,ResourceID{TABORCA_PAGE2_SC_CPAG,_GetInst()}}
oDCSC_CPAG:HyperLabel := HyperLabel{#SC_CPAG,"Cond. Pag. Peça:",NULL_STRING,NULL_STRING}

oDCSC_PRAZO := FixedText{SELF,ResourceID{TABORCA_PAGE2_SC_PRAZO,_GetInst()}}
oDCSC_PRAZO:HyperLabel := HyperLabel{#SC_PRAZO,"Prazo:",NULL_STRING,NULL_STRING}

SELF:Caption := "DataWindow Caption"
SELF:HyperLabel := HyperLabel{#TABORCA_Page2,"DataWindow Caption",NULL_STRING,NULL_STRING}
SELF:ClipperKeys := TRUE

IF !IsNil(oServer)
	SELF:Use(oServer)
ELSE
	SELF:Use(SELF:Owner:Server)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


ACCESS PRAZ2() 
RETURN SELF:FieldGet(#PRAZ2)


ASSIGN PRAZ2(uValue) 
SELF:FieldPut(#PRAZ2, uValue)
RETURN PRAZ2 := uValue


ACCESS PRAZ3() 
RETURN SELF:FieldGet(#PRAZ3)


ASSIGN PRAZ3(uValue) 
SELF:FieldPut(#PRAZ3, uValue)
RETURN PRAZ3 := uValue


ACCESS PRAZ4() 
RETURN SELF:FieldGet(#PRAZ4)


ASSIGN PRAZ4(uValue) 
SELF:FieldPut(#PRAZ4, uValue)
RETURN PRAZ4 := uValue


ACCESS PRAZO() 
RETURN SELF:FieldGet(#PRAZO)


ASSIGN PRAZO(uValue) 
SELF:FieldPut(#PRAZO, uValue)
RETURN PRAZO := uValue


END CLASS
CLASS TABORCA_Page3 INHERIT DATAWINDOW 

	PROTECT oDCOBS01 AS SINGLELINEEDIT
	PROTECT oDCOBS02 AS SINGLELINEEDIT
	PROTECT oDCOBS03 AS SINGLELINEEDIT
	PROTECT oDCOBS04 AS SINGLELINEEDIT
	PROTECT oDCOBS05 AS SINGLELINEEDIT
	PROTECT oDCOBS06 AS SINGLELINEEDIT
	PROTECT oDCOBS07 AS SINGLELINEEDIT
	PROTECT oDCOBS08 AS SINGLELINEEDIT
	PROTECT oDCSC_OBS01 AS FIXEDTEXT
// 	instance OBS01 
// 	instance OBS02 
// 	instance OBS03 
// 	instance OBS04 
// 	instance OBS05 
// 	instance OBS06 
// 	instance OBS07 
// 	instance OBS08 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"TABORCA_Page3",_GetInst()},iCtlID)

oDCOBS01 := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE3_OBS01,_GetInst()}}
oDCOBS01:FieldSpec := PADRAO_CHAR_200{}
oDCOBS01:HyperLabel := HyperLabel{#OBS01,"Obs01:",NULL_STRING,"ORCA_OBS01"}
oDCOBS01:TooltipText := "Campo para Observações"

oDCOBS02 := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE3_OBS02,_GetInst()}}
oDCOBS02:FieldSpec := PADRAO_CHAR_200{}
oDCOBS02:HyperLabel := HyperLabel{#OBS02,"Obs02:",NULL_STRING,"ORCA_OBS02"}
oDCOBS02:TooltipText := "Campo para Observações"

oDCOBS03 := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE3_OBS03,_GetInst()}}
oDCOBS03:FieldSpec := PADRAO_CHAR_200{}
oDCOBS03:HyperLabel := HyperLabel{#OBS03,"Obs03:",NULL_STRING,"ORCA_OBS03"}
oDCOBS03:TooltipText := "Campo para Observações"

oDCOBS04 := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE3_OBS04,_GetInst()}}
oDCOBS04:FieldSpec := PADRAO_CHAR_200{}
oDCOBS04:HyperLabel := HyperLabel{#OBS04,"Obs04:",NULL_STRING,"ORCA_OBS04"}
oDCOBS04:TooltipText := "Campo para Observações"

oDCOBS05 := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE3_OBS05,_GetInst()}}
oDCOBS05:FieldSpec := PADRAO_CHAR_200{}
oDCOBS05:HyperLabel := HyperLabel{#OBS05,"Obs05:",NULL_STRING,"ORCA_OBS05"}
oDCOBS05:TooltipText := "Campo para Observações"

oDCOBS06 := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE3_OBS06,_GetInst()}}
oDCOBS06:FieldSpec := PADRAO_CHAR_200{}
oDCOBS06:HyperLabel := HyperLabel{#OBS06,"Obs06:",NULL_STRING,"ORCA_OBS06"}
oDCOBS06:TooltipText := "Campo para Observações"

oDCOBS07 := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE3_OBS07,_GetInst()}}
oDCOBS07:FieldSpec := PADRAO_CHAR_200{}
oDCOBS07:HyperLabel := HyperLabel{#OBS07,"Obs06:",NULL_STRING,"ORCA_OBS06"}
oDCOBS07:TooltipText := "Campo para Observações"

oDCOBS08 := SingleLineEdit{SELF,ResourceID{TABORCA_PAGE3_OBS08,_GetInst()}}
oDCOBS08:FieldSpec := PADRAO_CHAR_200{}
oDCOBS08:HyperLabel := HyperLabel{#OBS08,"Obs06:",NULL_STRING,"ORCA_OBS06"}
oDCOBS08:TooltipText := "Campo para Observações"

oDCSC_OBS01 := FixedText{SELF,ResourceID{TABORCA_PAGE3_SC_OBS01,_GetInst()}}
oDCSC_OBS01:HyperLabel := HyperLabel{#SC_OBS01,"Obs:",NULL_STRING,NULL_STRING}

SELF:Caption := "DataWindow Caption"
SELF:HyperLabel := HyperLabel{#TABORCA_Page3,"DataWindow Caption",NULL_STRING,NULL_STRING}
SELF:ClipperKeys := TRUE

IF !IsNil(oServer)
	SELF:Use(oServer)
ELSE
	SELF:Use(SELF:Owner:Server)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


ACCESS OBS01() 
RETURN SELF:FieldGet(#OBS01)


ASSIGN OBS01(uValue) 
SELF:FieldPut(#OBS01, uValue)
RETURN OBS01 := uValue


ACCESS OBS02() 
RETURN SELF:FieldGet(#OBS02)


ASSIGN OBS02(uValue) 
SELF:FieldPut(#OBS02, uValue)
RETURN OBS02 := uValue


ACCESS OBS03() 
RETURN SELF:FieldGet(#OBS03)


ASSIGN OBS03(uValue) 
SELF:FieldPut(#OBS03, uValue)
RETURN OBS03 := uValue


ACCESS OBS04() 
RETURN SELF:FieldGet(#OBS04)


ASSIGN OBS04(uValue) 
SELF:FieldPut(#OBS04, uValue)
RETURN OBS04 := uValue


ACCESS OBS05() 
RETURN SELF:FieldGet(#OBS05)


ASSIGN OBS05(uValue) 
SELF:FieldPut(#OBS05, uValue)
RETURN OBS05 := uValue


ACCESS OBS06() 
RETURN SELF:FieldGet(#OBS06)


ASSIGN OBS06(uValue) 
SELF:FieldPut(#OBS06, uValue)
RETURN OBS06 := uValue


ACCESS OBS07() 
RETURN SELF:FieldGet(#OBS07)


ASSIGN OBS07(uValue) 
SELF:FieldPut(#OBS07, uValue)
RETURN OBS07 := uValue


ACCESS OBS08() 
RETURN SELF:FieldGet(#OBS08)


ASSIGN OBS08(uValue) 
SELF:FieldPut(#OBS08, uValue)
RETURN OBS08 := uValue


END CLASS
PARTIAL CLASS TABORCA_Page4 INHERIT DATAWINDOW
PROTECT oDCRESPO AS SINGLELINEEDIT
PROTECT oDCCARGO AS SINGLELINEEDIT
PROTECT oDCFT28 AS FIXEDTEXT
PROTECT oDCFT27 AS FIXEDTEXT
PROTECT oDCFT29 AS FIXEDTEXT
PROTECT oDCSETOR AS COMBOBOX

// User code starts here (DO NOT remove this line)  ##USER##

ACCESS CARGO
RETURN SELF:FieldGet( #CARGO )

ASSIGN CARGO( uValue )
SELF:FieldPut( #CARGO , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"TABORCA_Page4" , _GetInst()},iCtlID)

	SELF:oDCRESPO := SINGLELINEEDIT{SELF , ResourceID{ TABORCA_PAGE4_RESPO  , _GetInst() } }
	SELF:oDCRESPO:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCRESPO:TooltipText := "Nome do Responsável pelo Orçamento"
	SELF:oDCRESPO:HyperLabel := HyperLabel{#RESPO , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCCARGO := SINGLELINEEDIT{SELF , ResourceID{ TABORCA_PAGE4_CARGO  , _GetInst() } }
	SELF:oDCCARGO:FieldSpec := PADRAO_CHAR_40{}
	SELF:oDCCARGO:TooltipText := "Cargo do Responsavel Pelo Orçamento"
	SELF:oDCCARGO:HyperLabel := HyperLabel{#CARGO , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCFT28 := FIXEDTEXT{SELF , ResourceID{ TABORCA_PAGE4_FT28  , _GetInst() } }
	SELF:oDCFT28:HyperLabel := HyperLabel{#FT28 , "Cargo" , NULL_STRING , NULL_STRING}

	SELF:oDCFT27 := FIXEDTEXT{SELF , ResourceID{ TABORCA_PAGE4_FT27  , _GetInst() } }
	SELF:oDCFT27:HyperLabel := HyperLabel{#FT27 , "Responsável" , NULL_STRING , NULL_STRING}

	SELF:oDCFT29 := FIXEDTEXT{SELF , ResourceID{ TABORCA_PAGE4_FT29  , _GetInst() } }
	SELF:oDCFT29:HyperLabel := HyperLabel{#FT29 , "Área" , NULL_STRING , NULL_STRING}

	SELF:oDCSETOR := COMBOBOX{SELF , ResourceID{ TABORCA_PAGE4_SETOR  , _GetInst() } }
	SELF:oDCSETOR:FillUsing( SELF:ComboPEGMP05() )
	SELF:oDCSETOR:FieldSpec := PADRAO_CHAR_02{}
	SELF:oDCSETOR:TooltipText := "Escolha a Area de quem Assina o Orçamento"
	SELF:oDCSETOR:HyperLabel := HyperLabel{#SETOR , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:Caption := "DataWindow Caption"
	SELF:ClipperKeys := TRUE
	SELF:HyperLabel := HyperLabel{#TABORCA_Page4 , "DataWindow Caption" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ELSE
		SELF:Use(SELF:Owner:Server)
	ENDIF


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS RESPO
RETURN SELF:FieldGet( #RESPO )

ASSIGN RESPO( uValue )
SELF:FieldPut( #RESPO , uValue )

ACCESS SETOR
RETURN SELF:FieldGet( #SETOR )

ASSIGN SETOR( uValue )
SELF:FieldPut( #SETOR , uValue )

END CLASS
STATIC DEFINE JORCA_BTNPEGMA01 := 113
