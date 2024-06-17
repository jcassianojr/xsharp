#region DEFINES
Define IDA_STANDARDSHELLMENU := "STANDARDSHELLMENU"
Define IDM_STANDARDSHELLMENU := "STANDARDSHELLMENU"
Define IDM_STANDARDSHELLMENU_Arquivo_Configurar_Impressora__ID := 27145
Define IDM_STANDARDSHELLMENU_Arquivo_Fechar_ID := 27147
Define IDM_STANDARDSHELLMENU_Arquivo_ID := 27143
Define IDM_STANDARDSHELLMENU_Arquivo_Imprimir_ID := 27144
Define IDM_STANDARDSHELLMENU_Editar_Anterior_ID := 27153
Define IDM_STANDARDSHELLMENU_Editar_Apagar_Filtro_ID := 27161
Define IDM_STANDARDSHELLMENU_Editar_Busca_Avançada_ID := 27157
Define IDM_STANDARDSHELLMENU_Editar_Busca_Indexadaf2Ordenação_ID := 27158
Define IDM_STANDARDSHELLMENU_Editar_Deletar_Registro_ID := 27150
Define IDM_STANDARDSHELLMENU_Editar_Filtrar_Dados_ID := 27160
Define IDM_STANDARDSHELLMENU_Editar_ID := 27148
Define IDM_STANDARDSHELLMENU_Editar_Inserir__Registro_ID := 27149
Define IDM_STANDARDSHELLMENU_Editar_Primeiro_ID := 27152
Define IDM_STANDARDSHELLMENU_Editar_ProXimo_ID := 27154
Define IDM_STANDARDSHELLMENU_Editar_Ultimo_ID := 27155
Define IDM_STANDARDSHELLMENU_f3_Ajuda_de_Contexto_ID := 27167
Define IDM_STANDARDSHELLMENU_f3_ID := 27165
Define IDM_STANDARDSHELLMENU_f3_Indice_ID := 27166
Define IDM_STANDARDSHELLMENU_f3_Sobre_ID := 27170
Define IDM_STANDARDSHELLMENU_f3_Usando_a_Ajuda_ID := 27168
Define IDM_STANDARDSHELLMENU_Visualizar_Editar_ID := 27163
Define IDM_STANDARDSHELLMENU_Visualizar_Exiblir_ID := 27164
Define IDM_STANDARDSHELLMENU_Visualizar_ID := 27162
#endregion

CLASS STANDARDSHELLMENU INHERIT Menu
 
METHOD FilePrinterSetup() 

	LOCAL oPrinter AS PrintingDevice
	
	oPrinter := PrintingDevice{}
	oPrinter:Setup()


CONSTRUCTOR(oOwner) 
	local oTB as ToolBar

	SUPER(ResourceID{IDM_STANDARDSHELLMENU, _GetInst( )})

	self:RegisterItem(IDM_STANDARDSHELLMENU_Arquivo_ID,	;
		HyperLabel{#File,	;
			"&Arquivo",	;
			"Opções de Arquivo",	;
			"File"},self:Handle( ),0)
	self:RegisterItem(IDM_STANDARDSHELLMENU_Arquivo_Imprimir_ID,	;
		HyperLabel{#cmdimprimir,	;
			"Imprimir",	;
			,	;
			,})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Arquivo_Configurar_Impressora__ID,	;
		HyperLabel{#FILEPRINTSETUP,	;
			"C&onfigurar Impressora ..",	;
			,	;
			,})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Arquivo_Fechar_ID,	;
		HyperLabel{#DESTROY,	;
			"&Fechar",	;
			,	;
			,})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Editar_ID,	;
		HyperLabel{#Edit,	;
			"&Editar",	;
			"Editar  Informação",	;
			"Edit"},self:Handle( ),1)
	self:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Inserir__Registro_ID,	;
		HyperLabel{#Append,	;
			"&Inserir  Registro",	;
			"Inserir um novo registrado",	;
			"Append"})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Deletar_Registro_ID,	;
		HyperLabel{#Delete,	;
			"&Deletar Registro",	;
			"Deletar um registro",	;
			"Delete"})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Primeiro_ID,	;
		HyperLabel{#GOTOP,	;
			"&Primeiro	Ctrl+Home",	;
			"Ir Para o Primeiro Registo",	;
			"GOTOP"})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Anterior_ID,	;
		HyperLabel{#SkipPrevious,	;
			"&Anterior",	;
			"Voltar Registro Anterior",	;
			"SkipPrevious"})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Editar_ProXimo_ID,	;
		HyperLabel{#SkipNext,	;
			"Pro&Ximo",	;
			"Ir para o registro posterior",	;
			"SkipNext"})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Ultimo_ID,	;
		HyperLabel{#GoBottom,	;
			"&Ultimo	Ctrl+End",	;
			"Ir para o último registro",	;
			"GoBottom"})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Busca_Avançada_ID,	;
		HyperLabel{#buscaAvancada,	;
			"Busca Avançada",	;
			,	;
			,})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Busca_Indexadaf2Ordenação_ID,	;
		HyperLabel{#KEYFIND,	;
			"Busca Indexada/Ordenação",	;
			,	;
			,})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Filtrar_Dados_ID,	;
		HyperLabel{#cmdfiltrar,	;
			"Filtrar Dados",	;
			,	;
			,})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Apagar_Filtro_ID,	;
		HyperLabel{#cmddelfiltro,	;
			"Apagar Filtro",	;
			,	;
			,})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Visualizar_ID,	;
		HyperLabel{#View,	;
			"&Visualizar",	;
			"Opções de Visualizar",	;
			,},self:Handle( ),2)
	self:RegisterItem(IDM_STANDARDSHELLMENU_Visualizar_Editar_ID,	;
		HyperLabel{#ViewForm,	;
			"&Editar	Shift+F2",	;
			"Ver por tela de edição",	;
			"ViewForm"})
	self:RegisterItem(IDM_STANDARDSHELLMENU_Visualizar_Exiblir_ID,	;
		HyperLabel{#ViewTable,	;
			"&Exiblir	F2",	;
			"Visualizar em Forma de Tabela",	;
			"ViewTable"})
	self:RegisterItem(IDM_STANDARDSHELLMENU_f3_ID,	;
		HyperLabel{#Help,	;
			"&?",	;
			"Opções da Ajuda",	;
			,},self:Handle( ),3)
	self:RegisterItem(IDM_STANDARDSHELLMENU_f3_Indice_ID,	;
		HyperLabel{#HelpIndex,	;
			"&Indice	F1",	;
			"Índice da Ajuda",	;
			"Help_Index"})
	self:RegisterItem(IDM_STANDARDSHELLMENU_f3_Ajuda_de_Contexto_ID,	;
		HyperLabel{#HelpContext,	;
			"&Ajuda de Contexto	Ctrl+F1",	;
			"Ajuda de Contexto",	;
			"Help_ContextHelp"})
	self:RegisterItem(IDM_STANDARDSHELLMENU_f3_Usando_a_Ajuda_ID,	;
		HyperLabel{#HelpUsingHelp,	;
			"&Usando a Ajuda",	;
			"Como Usar a Ajuda",	;
			"Help_UsingHelp"})
	self:RegisterItem(IDM_STANDARDSHELLMENU_f3_Sobre_ID,	;
		HyperLabel{#HelpAboutDialog,	;
			"&Sobre...",	;
			"Sobre a Aplicação",	;
			,})

	oTB := ToolBar{ }

	oTB:ButtonStyle := TB_ICONONLY

	oTB:AppendItem(IDT_CLOSE,IDM_STANDARDSHELLMENU_Arquivo_Fechar_ID)
	oTB:AddTipText(IDT_CLOSE,IDM_STANDARDSHELLMENU_Arquivo_Fechar_ID,"Encerrar Edição")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_3DFRAME,IDM_STANDARDSHELLMENU_Editar_Inserir__Registro_ID)
	oTB:AddTipText(IDT_3DFRAME,IDM_STANDARDSHELLMENU_Editar_Inserir__Registro_ID,"Novo Registro")

	oTB:AppendItem(IDT_DELETE,IDM_STANDARDSHELLMENU_Editar_Deletar_Registro_ID)
	oTB:AddTipText(IDT_DELETE,IDM_STANDARDSHELLMENU_Editar_Deletar_Registro_ID,"Deletar Registro")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_STARTREC,IDM_STANDARDSHELLMENU_Editar_Primeiro_ID)
	oTB:AddTipText(IDT_STARTREC,IDM_STANDARDSHELLMENU_Editar_Primeiro_ID,"Primeiro Registro")

	oTB:AppendItem(IDT_PREVREC,IDM_STANDARDSHELLMENU_Editar_Anterior_ID)
	oTB:AddTipText(IDT_PREVREC,IDM_STANDARDSHELLMENU_Editar_Anterior_ID,"Registro Anterior")

	oTB:AppendItem(IDT_NEXTREC,IDM_STANDARDSHELLMENU_Editar_ProXimo_ID)
	oTB:AddTipText(IDT_NEXTREC,IDM_STANDARDSHELLMENU_Editar_ProXimo_ID,"Proximo Regisrto")

	oTB:AppendItem(IDT_ENDREC,IDM_STANDARDSHELLMENU_Editar_Ultimo_ID)
	oTB:AddTipText(IDT_ENDREC,IDM_STANDARDSHELLMENU_Editar_Ultimo_ID,"Ultimo Registro")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_VFORM,IDM_STANDARDSHELLMENU_Visualizar_Editar_ID)
	oTB:AddTipText(IDT_VFORM,IDM_STANDARDSHELLMENU_Visualizar_Editar_ID,"Modo de Edição")

	oTB:AppendItem(IDT_VGBROWSE,IDM_STANDARDSHELLMENU_Visualizar_Exiblir_ID)
	oTB:AddTipText(IDT_VGBROWSE,IDM_STANDARDSHELLMENU_Visualizar_Exiblir_ID,"Modo de Exibiçao ")

	oTB:AppendItem(IDT_FIND,IDM_STANDARDSHELLMENU_Editar_Busca_Avançada_ID)
	oTB:AddTipText(IDT_FIND,IDM_STANDARDSHELLMENU_Editar_Busca_Avançada_ID,"Busca Avançada")

	oTB:AppendItem(IDT_ARROW,IDM_STANDARDSHELLMENU_Editar_Busca_Indexadaf2Ordenação_ID)
	oTB:AddTipText(IDT_ARROW,IDM_STANDARDSHELLMENU_Editar_Busca_Indexadaf2Ordenação_ID,"Busca Indexada/Ordenação")

	oTB:AppendItem(IDT_FUNCTION,IDM_STANDARDSHELLMENU_Editar_Filtrar_Dados_ID)
	oTB:AddTipText(IDT_FUNCTION,IDM_STANDARDSHELLMENU_Editar_Filtrar_Dados_ID,"Filtrar Dados")

	oTB:AppendItem(IDT_PAGENORMAL,IDM_STANDARDSHELLMENU_Editar_Apagar_Filtro_ID)
	oTB:AddTipText(IDT_PAGENORMAL,IDM_STANDARDSHELLMENU_Editar_Apagar_Filtro_ID,"Apagar Filtro")

	oTB:AppendItem(IDT_PRINT,IDM_STANDARDSHELLMENU_Arquivo_Imprimir_ID)
	oTB:AddTipText(IDT_PRINT,IDM_STANDARDSHELLMENU_Arquivo_Imprimir_ID,"Imprimir")

	self:ToolBar := oTB

	self:Accelerator := STANDARDSHELLMENU_Accelerator{ }

	return self
END CLASS
CLASS STANDARDSHELLMENU_Accelerator INHERIT Accelerator
 
CONSTRUCTOR( ) 
	SUPER(ResourceID{IDA_STANDARDSHELLMENU, _GetInst( )})

	return self

END CLASS
