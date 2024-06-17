#region DEFINES
STATIC DEFINE JLVMP_BUSCA := 107
STATIC DEFINE JLVMP_DESCRI := 104
STATIC DEFINE JLVMP_GRUPO := 105
STATIC DEFINE JLVMP_ITEM := 103
STATIC DEFINE JLVMP_ORDEM := 106
STATIC DEFINE JLVMP_SC_DESCRI := 101
STATIC DEFINE JLVMP_SC_GRUPO := 102
STATIC DEFINE JLVMP_SC_ITEM := 100
#endregion

PARTIAL CLASS JLVMP INHERIT MYDataWindow
PROTECT oDBITEM AS DataColumn
PROTECT oDBDESCRI AS DataColumn
PROTECT oDCSC_ITEM AS FIXEDTEXT
PROTECT oDCSC_DESCRI AS FIXEDTEXT
PROTECT oDCSC_GRUPO AS FIXEDTEXT
PROTECT oDCITEM AS SINGLELINEEDIT
PROTECT oDCDESCRI AS SINGLELINEEDIT
PROTECT oDCGRUPO AS COMBOBOXEX
PROTECT oCCordem AS PUSHBUTTON
PROTECT oCCbusca AS PUSHBUTTON

// User code starts here (DO NOT remove this line)  ##USER##





METHOD busca( ) 
	SELF:KEYFIND()

ACCESS DESCRI
RETURN SELF:FieldGet( #DESCRI )

ASSIGN DESCRI( uValue )
SELF:FieldPut( #DESCRI , uValue )

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)

	SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

	SUPER(oWindow , ResourceID{"JLVMP" , _GetInst()},iCtlID)

	SELF:oDCSC_ITEM := FIXEDTEXT{SELF , ResourceID{ JLVMP_SC_ITEM  , _GetInst() } }
	SELF:oDCSC_ITEM:HyperLabel := HyperLabel{#SC_ITEM , "Item:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_DESCRI := FIXEDTEXT{SELF , ResourceID{ JLVMP_SC_DESCRI  , _GetInst() } }
	SELF:oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI , "Descrição:" , NULL_STRING , NULL_STRING}

	SELF:oDCSC_GRUPO := FIXEDTEXT{SELF , ResourceID{ JLVMP_SC_GRUPO  , _GetInst() } }
	SELF:oDCSC_GRUPO:HyperLabel := HyperLabel{#SC_GRUPO , "Grupo:" , NULL_STRING , NULL_STRING}

	SELF:oDCITEM := SINGLELINEEDIT{SELF , ResourceID{ JLVMP_ITEM  , _GetInst() } }
	SELF:oDCITEM:FieldSpec := PADRAO_NUM_03{}
	SELF:oDCITEM:HyperLabel := HyperLabel{#ITEM , "Item:" , NULL_STRING , "Lvmp_ITEM"}

	SELF:oDCDESCRI := SINGLELINEEDIT{SELF , ResourceID{ JLVMP_DESCRI  , _GetInst() } }
	SELF:oDCDESCRI:FieldSpec := PADRAO_CHAR_200{}
	SELF:oDCDESCRI:HyperLabel := HyperLabel{#DESCRI , "Descrição:" , NULL_STRING , "Lvmp_DESCRI"}

	SELF:oDCGRUPO := COMBOBOXEX{SELF , ResourceID{ JLVMP_GRUPO  , _GetInst() } }
	SELF:oDCGRUPO:FieldSpec := PADRAO_CHAR_03{}
	SELF:oDCGRUPO:HyperLabel := HyperLabel{#GRUPO , "Grupo" , NULL_STRING , NULL_STRING}

	SELF:oCCordem := PUSHBUTTON{SELF , ResourceID{ JLVMP_ORDEM  , _GetInst() } }
	SELF:oCCordem:TooltipText := "Ordenar Por Numero"
	SELF:oCCordem:Image := ico_az{}
	SELF:oCCordem:HyperLabel := HyperLabel{#ordem , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oCCbusca := PUSHBUTTON{SELF , ResourceID{ JLVMP_BUSCA  , _GetInst() } }
	SELF:oCCbusca:Image := ICO_FIND{}
	SELF:oCCbusca:HyperLabel := HyperLabel{#busca , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:Caption := "Lista de Verificação Máquina "
	SELF:Menu := STANDARDSHELLMENU{}
	SELF:ClipperKeys := TRUE
	SELF:HyperLabel := HyperLabel{#JLVMP , "Lista de Verificação Máquina " , NULL_STRING , NULL_STRING}
	IF !IsNil(oServer)
		SELF:Use(oServer)
	ENDIF

	SELF:Browser := DataBrowser{SELF}

	SELF:oDBITEM := DataColumn{PADRAO_NUM_03{}}
	SELF:oDBITEM:Width := 6
	SELF:oDBITEM:HyperLabel := SELF:oDCITEM:HyperLabel
	SELF:oDBITEM:Caption := "Item:"
	SELF:Browser:AddColumn(SELF:oDBITEM)

	SELF:oDBDESCRI := DataColumn{PADRAO_CHAR_200{}}
	SELF:oDBDESCRI:Width := 24
	SELF:oDBDESCRI:HyperLabel := SELF:oDCDESCRI:HyperLabel
	SELF:oDBDESCRI:Caption := "Descrição:"
	SELF:Browser:AddColumn(SELF:oDBDESCRI)

	SELF:ViewAs(#BrowseView)


	SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN


ACCESS ITEM
RETURN SELF:FieldGet( #ITEM )

ASSIGN ITEM( uValue )
SELF:FieldPut( #ITEM , uValue )

METHOD ordem( ) 
	SELF:KeyFind()
METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
   SELF:oDCGRUPO:FillUsing(MTD02("GRUPOMAQ",3))

 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()


ACCESS GRUPO
RETURN SELF:FieldGet( #GRUPO )

ASSIGN GRUPO( uValue )
SELF:FieldPut( #GRUPO , uValue )

END CLASS
