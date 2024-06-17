#region DEFINES
STATIC DEFINE JTRJOB_ALTERAR := 130 
STATIC DEFINE JTRJOB_ANTERIOR := 128 
STATIC DEFINE JTRJOB_BUSCAFUN := 119 
STATIC DEFINE JTRJOB_BUSCAFUN1 := 134 
STATIC DEFINE JTRJOB_CCODIGO := 106 
STATIC DEFINE JTRJOB_CNOME := 121 
STATIC DEFINE JTRJOB_CODMAQ := 102 
STATIC DEFINE JTRJOB_DATA := 100 
STATIC DEFINE JTRJOB_DATF := 101 
STATIC DEFINE JTRJOB_ESCCODPRI := 124 
STATIC DEFINE JTRJOB_ESCINS := 116 
STATIC DEFINE JTRJOB_ESCINS1 := 117 
STATIC DEFINE JTRJOB_ESCMAQ := 114 
STATIC DEFINE JTRJOB_ESCOLHER := 118 
STATIC DEFINE JTRJOB_EXCLUIR := 131 
STATIC DEFINE JTRJOB_INCFUNC := 132 
STATIC DEFINE JTRJOB_JTREINF := 120 
STATIC DEFINE JTRJOB_JTRJOBI := 122 
STATIC DEFINE JTRJOB_NCARGA := 107 
STATIC DEFINE JTRJOB_NFUNC := 105 
STATIC DEFINE JTRJOB_NFUNC1 := 133 
STATIC DEFINE JTRJOB_NOMINS := 104 
STATIC DEFINE JTRJOB_NOVO := 108 
STATIC DEFINE JTRJOB_NUMERO := 113 
STATIC DEFINE JTRJOB_NUMINS := 103 
STATIC DEFINE JTRJOB_PEGINS := 115 
STATIC DEFINE JTRJOB_PROXIMO := 127 
STATIC DEFINE JTRJOB_SC_CARGA := 126 
STATIC DEFINE JTRJOB_SC_CODMAQ := 112 
STATIC DEFINE JTRJOB_SC_DATA := 110 
STATIC DEFINE JTRJOB_SC_NUMERO := 109 
STATIC DEFINE JTRJOB_SC_NUMERO1 := 123 
STATIC DEFINE JTRJOB_SC_NUMINS := 111 
STATIC DEFINE JTRJOB_SC_PECA := 125 
STATIC DEFINE JTRJOB_TABULAR := 129 
#endregion

PARTIAL class jtrjob inherit MYDataWindow 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBDATA as DataColumn
	PROTECT oDBNUMINS as DataColumn
	PROTECT oDBNOMINS as DataColumn
	PROTECT oDBCODMAQ as DataColumn
	protect oDCDATA as DATESLE
	protect oDCDATF as DATESLE
	protect oDCCODMAQ as SINGLELINEEDIT
	protect oDCNUMINS as SINGLELINEEDIT
	protect oDCNOMINS as SINGLELINEEDIT
	protect oDCnFUNC as SINGLELINEEDIT
	protect oDCcCODIGO as SINGLELINEEDIT
	protect oDCnCARGA as SINGLELINEEDIT
	protect oCCNOVO as PUSHBUTTON
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_NUMINS as FIXEDTEXT
	protect oDCSC_CODMAQ as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oCCEScmaq as PUSHBUTTON
	protect oCCpegins as PUSHBUTTON
	protect oCCESCins as PUSHBUTTON
	protect oCCEscins1 as PUSHBUTTON
	protect oCCEscolher as PUSHBUTTON
	protect oCCbuscafun as PUSHBUTTON
	protect oDCCNOME as SINGLELINEEDIT
	protect oDCSC_NUMERO1 as FIXEDTEXT
	protect oCCesccodpri as PUSHBUTTON
	protect oDCSC_PECA as FIXEDTEXT
	protect oDCSC_CARGA as FIXEDTEXT
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCTabular as PUSHBUTTON
	protect oCCALTERAR as PUSHBUTTON
	protect oCCExcluir as PUSHBUTTON
	protect oCCincfunc as PUSHBUTTON
	protect oDCnFUNC1 as SINGLELINEEDIT
	protect oCCbuscafun1 as PUSHBUTTON
// 	instance DATA 
// 	instance DATF 
// 	instance CODMAQ 
// 	instance NUMINS 
// 	instance NOMINS 
// 	instance nFUNC 
// 	instance cCODIGO 
// 	instance nCARGA 
// 	instance NUMERO 
// 	instance CNOME 
// 	instance nFUNC1 
	protect oSFJTREINF as JTREINF
	protect oSFjtrjobi as jtrjobi

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD buscafun1( ) 
SELF:oSFJTREINF:server:SETORDER(1)
SELF:oSFJTREINF:SERVER:GOTOP()
SELF:oSFJTREINF:SERVER:SEEK(SELF:nFUNC1)
IF SELF:oSFJTREINF:SERVER:EOF
   SELF:oSFJTREINF:GOTOP()
ENDIF	
	

access cCODIGO() 
return self:FieldGet(#cCODIGO)


assign cCODIGO(uValue) 
self:FieldPut(#cCODIGO, uValue)
return cCODIGO := uValue


access CNOME() 
return self:FieldGet(#CNOME)


assign CNOME(uValue) 
self:FieldPut(#CNOME, uValue)
return CNOME := uValue


access CODMAQ() 
return self:FieldGet(#CODMAQ)


assign CODMAQ(uValue) 
self:FieldPut(#CODMAQ, uValue)
return CODMAQ := uValue


access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


access DATF() 
return self:FieldGet(#DATF)


assign DATF(uValue) 
self:FieldPut(#DATF, uValue)
return DATF := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jtrjob",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{253,254,220}}

oDCDATA := DateSle{self,ResourceID{JTRJOB_DATA,_GetInst()}}
oDCDATA:FieldSpec := date_field{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"TRJOB_DATA"}

oDCDATF := DateSle{self,ResourceID{JTRJOB_DATF,_GetInst()}}
oDCDATF:FieldSpec := date_field{}
oDCDATF:HyperLabel := HyperLabel{#DATF,"Data:",NULL_STRING,"TRJOB_DATF"}

oDCCODMAQ := SingleLineEdit{self,ResourceID{JTRJOB_CODMAQ,_GetInst()}}
oDCCODMAQ:FieldSpec := padrao_char_04{}
oDCCODMAQ:HyperLabel := HyperLabel{#CODMAQ,"Maq",NULL_STRING,"TRJOB_CODMAQ"}

oDCNUMINS := SingleLineEdit{self,ResourceID{JTRJOB_NUMINS,_GetInst()}}
oDCNUMINS:FieldSpec := padrao_num_08{}
oDCNUMINS:HyperLabel := HyperLabel{#NUMINS,"Inst.",NULL_STRING,"TRJOB_NUMINS"}

oDCNOMINS := SingleLineEdit{self,ResourceID{JTRJOB_NOMINS,_GetInst()}}
oDCNOMINS:FieldSpec := padrao_CHAR_40{}
oDCNOMINS:HyperLabel := HyperLabel{#NOMINS,"Nome:",NULL_STRING,"TRJOB_NOMINS"}

oDCnFUNC := SingleLineEdit{self,ResourceID{JTRJOB_NFUNC,_GetInst()}}
oDCnFUNC:FieldSpec := padrao_NUM_08{}
oDCnFUNC:HyperLabel := HyperLabel{#nFUNC,NULL_STRING,NULL_STRING,NULL_STRING}

oDCcCODIGO := SingleLineEdit{self,ResourceID{JTRJOB_CCODIGO,_GetInst()}}
oDCcCODIGO:FieldSpec := padrao_char_24{}
oDCcCODIGO:HyperLabel := HyperLabel{#cCODIGO,"Peça:",NULL_STRING,"TRJOBI_PECA"}

oDCnCARGA := SingleLineEdit{self,ResourceID{JTRJOB_NCARGA,_GetInst()}}
oDCnCARGA:FieldSpec := padrao_num_05_2{}
oDCnCARGA:HyperLabel := HyperLabel{#nCARGA,"Carga:",NULL_STRING,"TRJOBI_CARGA"}

oCCNOVO := PushButton{self,ResourceID{JTRJOB_NOVO,_GetInst()}}
oCCNOVO:HyperLabel := HyperLabel{#NOVO,_chr(38)+"+Novo Item",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{self,ResourceID{JTRJOB_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JTRJOB_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_NUMINS := FixedText{self,ResourceID{JTRJOB_SC_NUMINS,_GetInst()}}
oDCSC_NUMINS:HyperLabel := HyperLabel{#SC_NUMINS,"Instrutor",NULL_STRING,NULL_STRING}

oDCSC_CODMAQ := FixedText{self,ResourceID{JTRJOB_SC_CODMAQ,_GetInst()}}
oDCSC_CODMAQ:HyperLabel := HyperLabel{#SC_CODMAQ,"Maquina:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JTRJOB_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero",NULL_STRING,"TRJOB_NUMINS"}
oDCNUMERO:BackGround := aBrushes[1]

oCCEScmaq := PushButton{self,ResourceID{JTRJOB_ESCMAQ,_GetInst()}}
oCCEScmaq:HyperLabel := HyperLabel{#EScmaq,"...",NULL_STRING,NULL_STRING}
oCCEScmaq:TooltipText := "Exibe lista maquina  para escolha"

oCCpegins := PushButton{self,ResourceID{JTRJOB_PEGINS,_GetInst()}}
oCCpegins:HyperLabel := HyperLabel{#pegins,"-->",NULL_STRING,NULL_STRING}
oCCpegins:TooltipText := "Retorna o Nome do Nº Instrutor"

oCCESCins := PushButton{self,ResourceID{JTRJOB_ESCINS,_GetInst()}}
oCCESCins:HyperLabel := HyperLabel{#ESCins,"...",NULL_STRING,NULL_STRING}
oCCESCins:TooltipText := "Exibe lista funcionario  para escolha"

oCCEscins1 := PushButton{self,ResourceID{JTRJOB_ESCINS1,_GetInst()}}
oCCEscins1:HyperLabel := HyperLabel{#Escins1,"Escolher Instrutor",NULL_STRING,NULL_STRING}

oCCEscolher := PushButton{self,ResourceID{JTRJOB_ESCOLHER,_GetInst()}}
oCCEscolher:HyperLabel := HyperLabel{#Escolher,"Escolher Funcionario",NULL_STRING,NULL_STRING}

oCCbuscafun := PushButton{self,ResourceID{JTRJOB_BUSCAFUN,_GetInst()}}
oCCbuscafun:Image := ico_find{}
oCCbuscafun:HyperLabel := HyperLabel{#buscafun,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCNOME := SingleLineEdit{self,ResourceID{JTRJOB_CNOME,_GetInst()}}
oDCCNOME:FieldSpec := padrao_char_40{}
oDCCNOME:HyperLabel := HyperLabel{#CNOME,"Instru:",NULL_STRING,"TREIN_INSTRU"}
oDCCNOME:FocusSelect := FSEL_HOME

oDCSC_NUMERO1 := FixedText{self,ResourceID{JTRJOB_SC_NUMERO1,_GetInst()}}
oDCSC_NUMERO1:HyperLabel := HyperLabel{#SC_NUMERO1,"Nº Func",NULL_STRING,NULL_STRING}

oCCesccodpri := PushButton{self,ResourceID{JTRJOB_ESCCODPRI,_GetInst()}}
oCCesccodpri:HyperLabel := HyperLabel{#esccodpri,"...",NULL_STRING,NULL_STRING}
oCCesccodpri:TooltipText := "Escolher um funcionario"

oDCSC_PECA := FixedText{self,ResourceID{JTRJOB_SC_PECA,_GetInst()}}
oDCSC_PECA:HyperLabel := HyperLabel{#SC_PECA,"Peca:",NULL_STRING,NULL_STRING}

oDCSC_CARGA := FixedText{self,ResourceID{JTRJOB_SC_CARGA,_GetInst()}}
oDCSC_CARGA:HyperLabel := HyperLabel{#SC_CARGA,"Carga:",NULL_STRING,NULL_STRING}

oCCProximo := PushButton{self,ResourceID{JTRJOB_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_next{}

oCCAnterior := PushButton{self,ResourceID{JTRJOB_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_previous{}

oCCTabular := PushButton{self,ResourceID{JTRJOB_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Ver Itens",NULL_STRING,NULL_STRING}

oCCALTERAR := PushButton{self,ResourceID{JTRJOB_ALTERAR,_GetInst()}}
oCCALTERAR:HyperLabel := HyperLabel{#ALTERAR,"Alterar Item",NULL_STRING,NULL_STRING}

oCCExcluir := PushButton{self,ResourceID{JTRJOB_EXCLUIR,_GetInst()}}
oCCExcluir:HyperLabel := HyperLabel{#Excluir,"Excluir Item",NULL_STRING,NULL_STRING}

oCCincfunc := PushButton{self,ResourceID{JTRJOB_INCFUNC,_GetInst()}}
oCCincfunc:HyperLabel := HyperLabel{#incfunc,"Incluir Funcionario",NULL_STRING,NULL_STRING}

oDCnFUNC1 := SingleLineEdit{self,ResourceID{JTRJOB_NFUNC1,_GetInst()}}
oDCnFUNC1:FieldSpec := padrao_NUM_08{}
oDCnFUNC1:HyperLabel := HyperLabel{#nFUNC1,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscafun1 := PushButton{self,ResourceID{JTRJOB_BUSCAFUN1,_GetInst()}}
oCCbuscafun1:Image := ico_find{}
oCCbuscafun1:HyperLabel := HyperLabel{#buscafun1,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Treinamento on The Job"
self:HyperLabel := HyperLabel{#jtrjob,"Treinamento on The Job",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBDATA := DataColumn{date_field{}}
oDBDATA:Width := 12
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)

oDBNUMINS := DataColumn{padrao_num_08{}}
oDBNUMINS:Width := 10
oDBNUMINS:HyperLabel := oDCNUMINS:HyperLabel 
oDBNUMINS:Caption := "Inst."
self:Browser:AddColumn(oDBNUMINS)

oDBNOMINS := DataColumn{padrao_CHAR_40{}}
oDBNOMINS:Width := 16
oDBNOMINS:HyperLabel := oDCNOMINS:HyperLabel 
oDBNOMINS:Caption := "Nome:"
self:Browser:AddColumn(oDBNOMINS)

oDBCODMAQ := DataColumn{padrao_char_04{}}
oDBCODMAQ:Width := 8
oDBCODMAQ:HyperLabel := oDCCODMAQ:HyperLabel 
oDBCODMAQ:Caption := "Maq"
self:Browser:AddColumn(oDBCODMAQ)


self:ViewAs(#FormView)

oSFJTREINF := JTREINF{self,JTRJOB_JTREINF}
oSFJTREINF:show()

oSFjtrjobi := jtrjobi{self,JTRJOB_JTRJOBI}
oSFjtrjobi:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access nCARGA() 
return self:FieldGet(#nCARGA)


assign nCARGA(uValue) 
self:FieldPut(#nCARGA, uValue)
return nCARGA := uValue


access nFUNC() 
return self:FieldGet(#nFUNC)


assign nFUNC(uValue) 
self:FieldPut(#nFUNC, uValue)
return nFUNC := uValue


access nFUNC1() 
return self:FieldGet(#nFUNC1)


assign nFUNC1(uValue) 
self:FieldPut(#nFUNC1, uValue)
return nFUNC1 := uValue


access NOMINS() 
return self:FieldGet(#NOMINS)


assign NOMINS(uValue) 
self:FieldPut(#NOMINS, uValue)
return NOMINS := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access NUMINS() 
return self:FieldGet(#NUMINS)


assign NUMINS(uValue) 
self:FieldPut(#NUMINS, uValue)
return NUMINS := uValue


METHOD PreInit(oWindow,iCtlID,oServer,uExtra) 
	
	//Put your PreInit additions here
	FabCenterWindow( SELF )
	RETURN NIL


END CLASS
