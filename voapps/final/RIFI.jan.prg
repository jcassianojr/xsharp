#region DEFINES
STATIC DEFINE JRIFI_SC_RIF := 100
STATIC DEFINE JRIFI_SC_TOL := 101
STATIC DEFINE JRIFI_SC_MIN := 102
STATIC DEFINE JRIFI_SC_MAX := 103
STATIC DEFINE JRIFI_SC_OK := 104
STATIC DEFINE JRIFI_RIF := 105
STATIC DEFINE JRIFI_TOL := 106
STATIC DEFINE JRIFI_MIN := 107
STATIC DEFINE JRIFI_MAX := 108
STATIC DEFINE JRIFI_OK := 109
STATIC DEFINE JRIFI_OKINT := 110
STATIC DEFINE JRIFI_OKINT1 := 111
STATIC DEFINE JRIFI_INSTRUME := 112
STATIC DEFINE JRIFI_SC_TOL1 := 113
#endregion

PARTIAL CLASS JRIFI INHERIT DATAWINDOW
	PROTECT oDBRIF AS DataColumn
	PROTECT oDBTOL AS DataColumn
	PROTECT oDBINSTRUME AS DataColumn
	PROTECT oDBOK AS DataColumn
	PROTECT oDBMAX AS DataColumn
	PROTECT oDBMIN AS DataColumn
	PROTECT oDCSC_RIF AS FIXEDTEXT
	PROTECT oDCSC_TOL AS FIXEDTEXT
	PROTECT oDCSC_MIN AS FIXEDTEXT
	PROTECT oDCSC_MAX AS FIXEDTEXT
	PROTECT oDCSC_OK AS FIXEDTEXT
	PROTECT oDCRIF AS SINGLELINEEDIT
	PROTECT oDCTOL AS SINGLELINEEDIT
	PROTECT oDCMIN AS SINGLELINEEDIT
	PROTECT oDCMAX AS SINGLELINEEDIT
	PROTECT oDCOK AS SINGLELINEEDIT
	PROTECT oCCOKINT AS PUSHBUTTON
	PROTECT oCCOKINT1 AS PUSHBUTTON
	PROTECT oDCINSTRUME AS SINGLELINEEDIT
	PROTECT oDCSC_TOL1 AS FIXEDTEXT

	// {{%UC%}} User code starts here (DO NOT remove this line)  

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"JRIFI" , _GetInst()},iCtlID)

	SELF:oDCSC_RIF := FIXEDTEXT{SELF , ResourceID{ JRIFI_SC_RIF  , _GetInst() } }
	SELF:oDCSC_RIF:HyperLabel := HyperLabel{#SC_RIF , "Rif:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_TOL := FIXEDTEXT{SELF , ResourceID{ JRIFI_SC_TOL  , _GetInst() } }
	SELF:oDCSC_TOL:HyperLabel := HyperLabel{#SC_TOL , "Tolerancia/Especificado" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MIN := FIXEDTEXT{SELF , ResourceID{ JRIFI_SC_MIN  , _GetInst() } }
	SELF:oDCSC_MIN:HyperLabel := HyperLabel{#SC_MIN , "Min:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_MAX := FIXEDTEXT{SELF , ResourceID{ JRIFI_SC_MAX  , _GetInst() } }
	SELF:oDCSC_MAX:HyperLabel := HyperLabel{#SC_MAX , "Max:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_OK := FIXEDTEXT{SELF , ResourceID{ JRIFI_SC_OK  , _GetInst() } }
	SELF:oDCSC_OK:HyperLabel := HyperLabel{#SC_OK , "Ok:" , NULL_STRING , NULL_STRING}

	SELF:oDCRIF := SINGLELINEEDIT{SELF , ResourceID{ JRIFI_RIF  , _GetInst() } }
	SELF:oDCRIF:FieldSpec := PADRAO_NUM_08{}
	SELF:oDCRIF:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCRIF:Font( oFont )
	SELF:oDCRIF:HyperLabel := HyperLabel{#RIF , "Rif:" , NULL_STRING , "RIFI_RIF"}

	SELF:oDCTOL := SINGLELINEEDIT{SELF , ResourceID{ JRIFI_TOL  , _GetInst() } }
	SELF:oDCTOL:FieldSpec := PADRAO_CHAR_150{}
	SELF:oDCTOL:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCTOL:Font( oFont )
	SELF:oDCTOL:HyperLabel := HyperLabel{#TOL , "Tol:" , NULL_STRING , "RIFI_TOL"}

	SELF:oDCMIN := SINGLELINEEDIT{SELF , ResourceID{ JRIFI_MIN  , _GetInst() } }
	SELF:oDCMIN:FieldSpec := PADRAO_NUM_12_4{}
	SELF:oDCMIN:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCMIN:Font( oFont )
	SELF:oDCMIN:HyperLabel := HyperLabel{#MIN , "Min:" , NULL_STRING , "RIFI_MIN"}

	SELF:oDCMAX := SINGLELINEEDIT{SELF , ResourceID{ JRIFI_MAX  , _GetInst() } }
	SELF:oDCMAX:FieldSpec := PADRAO_NUM_12_4{}
	SELF:oDCMAX:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCMAX:Font( oFont )
	SELF:oDCMAX:HyperLabel := HyperLabel{#MAX , "Max:" , NULL_STRING , "RIFI_MAX"}

	SELF:oDCOK := SINGLELINEEDIT{SELF , ResourceID{ JRIFI_OK  , _GetInst() } }
	SELF:oDCOK:FieldSpec := PADRAO_CHAR_01{}
	SELF:oDCOK:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCOK:Font( oFont )
	SELF:oDCOK:HyperLabel := HyperLabel{#OK , "Ok:" , NULL_STRING , "RIFI_OK"}

	SELF:oCCOKINT := PUSHBUTTON{SELF , ResourceID{ JRIFI_OKINT  , _GetInst() } }
	SELF:oCCOKINT:TooltipText := "Marca Item como Ok"
	SELF:oCCOKINT:HyperLabel := HyperLabel{#OKINT , "OK" , NULL_STRING , NULL_STRING}

	SELF:oCCOKINT1 := PUSHBUTTON{SELF , ResourceID{ JRIFI_OKINT1  , _GetInst() } }
	SELF:oCCOKINT1:TooltipText := "Marca Item como Nao Ok"
	SELF:oCCOKINT1:HyperLabel := HyperLabel{#OKINT1 , "Não OK" , NULL_STRING , NULL_STRING}

	SELF:oDCINSTRUME := SINGLELINEEDIT{SELF , ResourceID{ JRIFI_INSTRUME  , _GetInst() } }
	SELF:oDCINSTRUME:FieldSpec := PADRAO_CHAR_150{}
	SELF:oDCINSTRUME:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 10 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCINSTRUME:Font( oFont )
	SELF:oDCINSTRUME:HyperLabel := HyperLabel{#INSTRUME , "Instrum" , NULL_STRING , "RIFI_TOL"}

	SELF:oDCSC_TOL1 := FIXEDTEXT{SELF , ResourceID{ JRIFI_SC_TOL1  , _GetInst() } }
	SELF:oDCSC_TOL1:HyperLabel := HyperLabel{#SC_TOL1 , "Instrumento" , NULL_STRING , NULL_STRING}

	SELF:Caption := "DataWindow Caption"
	SELF:ClipperKeys := True
	SELF:HyperLabel := HyperLabel{#JRIFI , "DataWindow Caption" , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF

	SELF:Browser := DataBrowser{SELF}

	SELF:oDBRIF := DataColumn{PADRAO_NUM_08{}}
	SELF:oDBRIF:Width := 7
	SELF:oDBRIF:HyperLabel := SELF:oDCRIF:HyperLabel
	SELF:oDBRIF:Caption := "Rif:"
	SELF:Browser:AddColumn(SELF:oDBRIF)

	SELF:oDBTOL := DataColumn{PADRAO_CHAR_150{}}
	SELF:oDBTOL:Width := 42
	SELF:oDBTOL:HyperLabel := SELF:oDCTOL:HyperLabel
	SELF:oDBTOL:Caption := "Tol:"
	SELF:Browser:AddColumn(SELF:oDBTOL)

	SELF:oDBINSTRUME := DataColumn{PADRAO_CHAR_150{}}
	SELF:oDBINSTRUME:Width := 24
	SELF:oDBINSTRUME:HyperLabel := SELF:oDCINSTRUME:HyperLabel
	SELF:oDBINSTRUME:Caption := "Instrum"
	SELF:Browser:AddColumn(SELF:oDBINSTRUME)

	SELF:oDBOK := DataColumn{PADRAO_CHAR_01{}}
	SELF:oDBOK:Width := 4
	SELF:oDBOK:HyperLabel := SELF:oDCOK:HyperLabel
	SELF:oDBOK:Caption := "Ok:"
	SELF:Browser:AddColumn(SELF:oDBOK)

	SELF:oDBMAX := DataColumn{PADRAO_NUM_12_4{}}
	SELF:oDBMAX:Width := 8
	SELF:oDBMAX:HyperLabel := SELF:oDCMAX:HyperLabel
	SELF:oDBMAX:Caption := "Max:"
	SELF:Browser:AddColumn(SELF:oDBMAX)

	SELF:oDBMIN := DataColumn{PADRAO_NUM_12_4{}}
	SELF:oDBMIN:Width := 8
	SELF:oDBMIN:HyperLabel := SELF:oDCMIN:HyperLabel
	SELF:oDBMIN:Caption := "Min:"
	SELF:Browser:AddColumn(SELF:oDBMIN)

	SELF:ViewAs(#BrowseView)


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS INSTRUME
RETURN SELF:FieldGet( #INSTRUME )

ASSIGN INSTRUME( uValue )
SELF:FieldPut( #INSTRUME , uValue )

ACCESS MAX
RETURN SELF:FieldGet( #MAX )

ASSIGN MAX( uValue )
SELF:FieldPut( #MAX , uValue )

ACCESS MIN
RETURN SELF:FieldGet( #MIN )

ASSIGN MIN( uValue )
SELF:FieldPut( #MIN , uValue )

ACCESS OK
RETURN SELF:FieldGet( #OK )

ASSIGN OK( uValue )
SELF:FieldPut( #OK , uValue )

ACCESS RIF
RETURN SELF:FieldGet( #RIF )

ASSIGN RIF( uValue )
SELF:FieldPut( #RIF , uValue )

ACCESS TOL
RETURN SELF:FieldGet( #TOL )

ASSIGN TOL( uValue )
SELF:FieldPut( #TOL , uValue )

END CLASS
