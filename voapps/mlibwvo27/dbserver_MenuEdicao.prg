#region DEFINES
DEFINE IDA_STANDARDSHELLMENU := "STANDARDSHELLMENU"
DEFINE IDM_STANDARDSHELLMENU := "STANDARDSHELLMENU"
DEFINE IDM_STANDARDSHELLMENU_Arquivo_Configurar_Impressora__ID := 15005
DEFINE IDM_STANDARDSHELLMENU_Arquivo_Fechar_ID := 15001
DEFINE IDM_STANDARDSHELLMENU_Arquivo_ID := 15000
DEFINE IDM_STANDARDSHELLMENU_Arquivo_Imprimir_ID := 15003
DEFINE IDM_STANDARDSHELLMENU_Editar_Anterior_ID := 15011
DEFINE IDM_STANDARDSHELLMENU_Editar_Apagar_Filtro_ID := 15019
DEFINE IDM_STANDARDSHELLMENU_Editar_Busca_Avançada_ID := 15015
DEFINE IDM_STANDARDSHELLMENU_Editar_Busca_Indexadaf2Ordenação_ID := 15016
DEFINE IDM_STANDARDSHELLMENU_Editar_Deletar_Registro_ID := 15008
DEFINE IDM_STANDARDSHELLMENU_Editar_Filtrar_Dados_ID := 15018
DEFINE IDM_STANDARDSHELLMENU_Editar_ID := 15006
DEFINE IDM_STANDARDSHELLMENU_Editar_Inserir__Registro_ID := 15007
DEFINE IDM_STANDARDSHELLMENU_Editar_Primeiro_ID := 15010
DEFINE IDM_STANDARDSHELLMENU_Editar_ProXimo_ID := 15012
DEFINE IDM_STANDARDSHELLMENU_Editar_Ultimo_ID := 15013
DEFINE IDM_STANDARDSHELLMENU_f3_Ajuda_de_Contexto_ID := 27167
DEFINE IDM_STANDARDSHELLMENU_f3_ID := 27165
DEFINE IDM_STANDARDSHELLMENU_f3_Indice_ID := 27166
DEFINE IDM_STANDARDSHELLMENU_f3_Sobre_ID := 27170
DEFINE IDM_STANDARDSHELLMENU_f3_Usando_a_Ajuda_ID := 27168
DEFINE IDM_STANDARDSHELLMENU_Visualizar_Editar_ID := 15021
DEFINE IDM_STANDARDSHELLMENU_Visualizar_Exiblir_ID := 15022
DEFINE IDM_STANDARDSHELLMENU_Visualizar_ID := 15020
#endregion

CLASS STANDARDSHELLMENU INHERIT Menu

// User code starts here (DO NOT remove this line)  ##USER##
METHOD FilePrinterSetup() 

	LOCAL oPrinter AS PrintingDevice
	
	oPrinter := PrintingDevice{}
	oPrinter:Setup()


CONSTRUCTOR( oOwner )

	LOCAL oTB AS Toolbar

	SELF:PreInit()

	SUPER( ResourceID { "STANDARDSHELLMENU" , _GetInst( ) } )

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Arquivo_ID, ;
		HyperLabel{ #File , "&Arquivo" , "Opções de Arquivo" , "File" } , SELF:Handle() , 0)

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Arquivo_Fechar_ID, ;
		HyperLabel{ #DESTROY , "&Fechar" ,  ,  })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Arquivo_Imprimir_ID, ;
		HyperLabel{ #cmdimprimir , "Imprimir" ,  ,  })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Arquivo_Preview_ID, ;
		HyperLabel{ #cmdpreview , "Preview" ,  ,  })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Arquivo_Configurar_Impressora__ID, ;
		HyperLabel{ #FILEPRINTSETUP , "C&onfigurar Impressora .." ,  ,  })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Editar_ID, ;
		HyperLabel{ #Edit , "&Editar" , "Editar  Informação" , "Edit" } , SELF:Handle() , 1)

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Inserir__Registro_ID, ;
		HyperLabel{ #Append , "&Inserir  Registro" , "Inserir um novo registrado" , "Append" })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Deletar_Registro_ID, ;
		HyperLabel{ #Delete , "&Deletar Registro" , "Deletar um registro" , "Delete" })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Primeiro_ID, ;
		HyperLabel{ #GOTOP , "&Primeiro	Ctrl+Home" , "Ir Para o Primeiro Registo" , "GOTOP" })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Anterior_ID, ;
		HyperLabel{ #SkipPrevious , "&Anterior" , "Voltar Registro Anterior" , "SkipPrevious" })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Editar_ProXimo_ID, ;
		HyperLabel{ #SkipNext , "Pro&Ximo" , "Ir para o registro posterior" , "SkipNext" })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Ultimo_ID, ;
		HyperLabel{ #GoBottom , "&Ultimo	Ctrl+End" , "Ir para o último registro" , "GoBottom" })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Busca_Avançada_ID, ;
		HyperLabel{ #buscaAvancada , "Busca Avançada" ,  ,  })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Busca_Indexadaf2Ordenação_ID, ;
		HyperLabel{ #KEYFIND , "Busca Indexada/Ordenação" ,  ,  })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Filtrar_Dados_ID, ;
		HyperLabel{ #cmdfiltrar , "Filtrar Dados" ,  ,  })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Editar_Apagar_Filtro_ID, ;
		HyperLabel{ #cmddelfiltro , "Apagar Filtro" ,  ,  })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Visualizar_ID, ;
		HyperLabel{ #View , "&Visualizar" , "Opções de Visualizar" ,  } , SELF:Handle() , 2)

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Visualizar_Editar_ID, ;
		HyperLabel{ #ViewForm , "&Editar	Shift+F2" , "Ver por tela de edição" , "ViewForm" })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU_Visualizar_Exiblir_ID, ;
		HyperLabel{ #ViewTable , "&Exiblir	F2" , "Visualizar em Forma de Tabela" , "ViewTable" })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU__f3_ID, ;
		HyperLabel{ #Help , "&?" , "Opções da Ajuda" ,  } , SELF:Handle() , 3)

	SELF:RegisterItem(IDM_STANDARDSHELLMENU__f3_Indice_ID, ;
		HyperLabel{ #HelpIndex , "&Indice	F1" , "Índice da Ajuda" , "Help_Index" })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU__f3_Ajuda_de_Contexto_ID, ;
		HyperLabel{ #HelpContext , "&Ajuda de Contexto	Ctrl+F1" , "Ajuda de Contexto" , "Help_ContextHelp" })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU__f3_Usando_a_Ajuda_ID, ;
		HyperLabel{ #HelpUsingHelp , "&Usando a Ajuda" , "Como Usar a Ajuda" , "Help_UsingHelp" })

	SELF:RegisterItem(IDM_STANDARDSHELLMENU__f3_Sobre_ID, ;
		HyperLabel{ #HelpAboutDialog , "&Sobre..." , "Sobre a Aplicação" ,  })

	oTB := Toolbar{}

	oTB:ButtonStyle := TB_ICONONLY
	oTB:Flat := TRUE
	oTB:EnableBands(FALSE)

	oTB:AppendItem(IDT_CLOSE , IDM_STANDARDSHELLMENU_Arquivo_Fechar_ID)
	oTB:AddTipText(IDT_CLOSE , IDM_STANDARDSHELLMENU_Arquivo_Fechar_ID , "Encerrar Edição")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_PRINT , IDM_STANDARDSHELLMENU_Arquivo_Imprimir_ID)
	oTB:AddTipText(IDT_PRINT , IDM_STANDARDSHELLMENU_Arquivo_Imprimir_ID , "Imprimir")

	oTB:AppendItem(IDT_PREVIEW , IDM_STANDARDSHELLMENU_Arquivo_Preview_ID)

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_3DFRAME , IDM_STANDARDSHELLMENU_Editar_Inserir__Registro_ID)
	oTB:AddTipText(IDT_3DFRAME , IDM_STANDARDSHELLMENU_Editar_Inserir__Registro_ID , "Novo Registro")

	oTB:AppendItem(IDT_DELETE , IDM_STANDARDSHELLMENU_Editar_Deletar_Registro_ID)
	oTB:AddTipText(IDT_DELETE , IDM_STANDARDSHELLMENU_Editar_Deletar_Registro_ID , "Deletar Registro")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_STARTREC , IDM_STANDARDSHELLMENU_Editar_Primeiro_ID)
	oTB:AddTipText(IDT_STARTREC , IDM_STANDARDSHELLMENU_Editar_Primeiro_ID , "Primeiro Registro")

	oTB:AppendItem(IDT_PREVREC , IDM_STANDARDSHELLMENU_Editar_Anterior_ID)
	oTB:AddTipText(IDT_PREVREC , IDM_STANDARDSHELLMENU_Editar_Anterior_ID , "Registro Anterior")

	oTB:AppendItem(IDT_NEXTREC , IDM_STANDARDSHELLMENU_Editar_ProXimo_ID)
	oTB:AddTipText(IDT_NEXTREC , IDM_STANDARDSHELLMENU_Editar_ProXimo_ID , "Proximo Regisrto")

	oTB:AppendItem(IDT_ENDREC , IDM_STANDARDSHELLMENU_Editar_Ultimo_ID)
	oTB:AddTipText(IDT_ENDREC , IDM_STANDARDSHELLMENU_Editar_Ultimo_ID , "Ultimo Registro")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_FIND , IDM_STANDARDSHELLMENU_Editar_Busca_Avançada_ID)
	oTB:AddTipText(IDT_FIND , IDM_STANDARDSHELLMENU_Editar_Busca_Avançada_ID , "Busca Avançada")

	oTB:AppendItem(IDT_ARROW , IDM_STANDARDSHELLMENU_Editar_Busca_Indexadaf2Ordenação_ID)
	oTB:AddTipText(IDT_ARROW , IDM_STANDARDSHELLMENU_Editar_Busca_Indexadaf2Ordenação_ID , "Busca Indexada/Ordenação")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_FUNCTION , IDM_STANDARDSHELLMENU_Editar_Filtrar_Dados_ID)
	oTB:AddTipText(IDT_FUNCTION , IDM_STANDARDSHELLMENU_Editar_Filtrar_Dados_ID , "Filtrar Dados")

	oTB:AppendItem(IDT_PAGENORMAL , IDM_STANDARDSHELLMENU_Editar_Apagar_Filtro_ID)
	oTB:AddTipText(IDT_PAGENORMAL , IDM_STANDARDSHELLMENU_Editar_Apagar_Filtro_ID , "Apagar Filtro")

	oTB:AppendItem(IDT_SEPARATOR)

	oTB:AppendItem(IDT_VFORM , IDM_STANDARDSHELLMENU_Visualizar_Editar_ID)
	oTB:AddTipText(IDT_VFORM , IDM_STANDARDSHELLMENU_Visualizar_Editar_ID , "Modo de Edição")

	oTB:AppendItem(IDT_VGBROWSE , IDM_STANDARDSHELLMENU_Visualizar_Exiblir_ID)
	oTB:AddTipText(IDT_VGBROWSE , IDM_STANDARDSHELLMENU_Visualizar_Exiblir_ID , "Modo de Exibiçao")


	SELF:ToolBar := oTB
	SELF:Accelerator := STANDARDSHELLMENU_Accelerator{ }

	SELF:PostInit()

RETURN

END CLASS
CLASS STANDARDSHELLMENU_Accelerator INHERIT Accelerator

// User code starts here (DO NOT remove this line)  ##USER##
CONSTRUCTOR()
	SUPER( ResourceID { "STANDARDSHELLMENU_Accelerator" , _GetInst( ) } )
RETURN


END CLASS
DEFINE IDM_STANDARDSHELLMENU_Arquivo_Preview_ID := 15004
DEFINE IDM_STANDARDSHELLMENU__f3_ID := 15023
DEFINE IDM_STANDARDSHELLMENU__f3_Indice_ID := 15024
DEFINE IDM_STANDARDSHELLMENU__f3_Ajuda_de_Contexto_ID := 15025
DEFINE IDM_STANDARDSHELLMENU__f3_Usando_a_Ajuda_ID := 15026
DEFINE IDM_STANDARDSHELLMENU__f3_Sobre_ID := 15028
