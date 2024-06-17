#region DEFINES
STATIC DEFINE _BUSCAPALAVRA_BUSCA := 105
STATIC DEFINE _BUSCAPALAVRA_CANCELAR := 102
STATIC DEFINE _BUSCAPALAVRA_ESCOLHER := 104
STATIC DEFINE _BUSCAPALAVRA_LISTBOX1 := 100
STATIC DEFINE _BUSCAPALAVRA_THEFIXEDTEXT11 := 103
STATIC DEFINE _BUSCAPALAVRA_THEFIXEDTEXT9 := 101
#endregion

PARTIAL CLASS _BuscaPalavra INHERIT DIALOGWINDOW
PROTECT oDCListBox1 AS LISTBOX
PROTECT oDCtheFixedText9 AS FIXEDTEXT
PROTECT oCCCancelar AS PUSHBUTTON
PROTECT oDCtheFixedText11 AS FIXEDTEXT
PROTECT oCCEscolher AS PUSHBUTTON
PROTECT oDCBUSCA AS FIXEDTEXT

// User code starts here (DO NOT remove this line)  ##USER##



CONSTRUCTOR(oParent,uExtra)
	LOCAL oFont AS Font

	SELF:PreInit(oParent,uExtra)

	SUPER(oParent , ResourceID{"_BuscaPalavra" , _GetInst()} , TRUE)

	SELF:oDCListBox1 := LISTBOX{SELF , ResourceID{ _BUSCAPALAVRA_LISTBOX1  , _GetInst() } }
	SELF:oDCListBox1:HyperLabel := HyperLabel{#ListBox1 , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText9 := FIXEDTEXT{SELF , ResourceID{ _BUSCAPALAVRA_THEFIXEDTEXT9  , _GetInst() } }
	SELF:oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9 , "Retornar" , NULL_STRING , NULL_STRING}

	SELF:oCCCancelar := PUSHBUTTON{SELF , ResourceID{ _BUSCAPALAVRA_CANCELAR  , _GetInst() } }
	SELF:oCCCancelar:TooltipText := "Clique aqui Para Cancelar"
	SELF:oCCCancelar:Image := ICO_SAIR{}
	SELF:oCCCancelar:HyperLabel := HyperLabel{#Cancelar , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCtheFixedText11 := FIXEDTEXT{SELF , ResourceID{ _BUSCAPALAVRA_THEFIXEDTEXT11  , _GetInst() } }
	SELF:oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11 , "Escolher" , NULL_STRING , NULL_STRING}

	SELF:oCCEscolher := PUSHBUTTON{SELF , ResourceID{ _BUSCAPALAVRA_ESCOLHER  , _GetInst() } }
	SELF:oCCEscolher:Image := ICO_OK{}
	SELF:oCCEscolher:HyperLabel := HyperLabel{#Escolher , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:oDCBUSCA := FIXEDTEXT{SELF , ResourceID{ _BUSCAPALAVRA_BUSCA  , _GetInst() } }
	SELF:oDCBUSCA:Background := Brush{ Color{ 255 , 255 , 200 } }
	oFont := Font{  , 14 , "Times New Roman" }
	oFont:Bold := TRUE
	SELF:oDCBUSCA:Font( oFont )
	SELF:oDCBUSCA:HyperLabel := HyperLabel{#BUSCA , NULL_STRING , NULL_STRING , NULL_STRING}

	SELF:Caption := "Localizar Palavra"
	SELF:HyperLabel := HyperLabel{#_BuscaPalavra , "Localizar Palavra" , NULL_STRING , NULL_STRING}

	SELF:PostInit(oParent,uExtra)

RETURN


METHOD PostInit(oParent,uExtra) 
	//Put your PostInit additions here
		    FabCenterWindow( SELF )
	RETURN NIL


END CLASS
CLASS BUSCAPALAVRA INHERIT _BUSCAPALAVRA
  EXPORT lOK AS LOGIC
  EXPORT nRECNO AS DWORD


METHOD Cancelar( ) 
	SELF:LOK:=.F.
	SELF:nRECNO:=0
	SELF:EndDialog()

METHOD Escolher( ) 
	AltD()
	IF SELF:oDCListBox1:CURRENTITEMNO>0
       SELF:LOK:=.T.
       SELF:nRECNO:=SELF:oDCListBox1:Value
    ENDIF
    SELF:EndDialog()

	

CONSTRUCTOR(oOWNER,oSERVER,cPALAVRA) 
SUPER(oOWNER)
AltD()
SELF:lOK:=FALSE
SELF:nRECNO:=0
SELF:oDCBUSCA:Caption:=CPALAVRA
SELF:POINTER:=POINTER{POINTERHOURGLASS}
SELF:oDCListBox1:FillUsing(oSERVER:BuscaPalavra(CPALAVRA,.T.))
SELF:POINTER:=POINTER{POINTERARROW}
SELF:oDCListBox1:FillUsing(ZARR)



END CLASS
