#region DEFINES
DEFINE IDA_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDA_STANDARDSHELLMENU := "STANDARDSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Contatos_ID := 15009
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Itens_ID := 15010
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Codigo_de_Despesas_ID := 15007
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Compra_Itens_ID := 15011
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID := 15015
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Contas_Correntes_ID := 15005
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Historico_ID := 15006
DEFINE IDM_EMPTYSHELLMENU_Arquivo_ID := 15001
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Importar_Contas_Pagas_Manager_ID := 15008
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID := 15014
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Lançamentos_ID := 28543
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Lançamentos_Mes_Fechado_ID := 28545
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Lançamentos_so_Compentencia_ID := 28544
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Sair_ID := 15016
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Trocar_Competencia_ID := 15013
DEFINE IDM_EMPTYSHELLMENU_f3_Atualizacoes_ID := 28576
DEFINE IDM_EMPTYSHELLMENU_f3_Conteúdo_ID := 28573
DEFINE IDM_EMPTYSHELLMENU_f3_ID := 28572
DEFINE IDM_EMPTYSHELLMENU_f3_Indice_ID := 28574
DEFINE IDM_EMPTYSHELLMENU_f3_Sobre_ID := 32031
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Bancosf2Contas_ID := 28560
DEFINE IDM_EMPTYSHELLMENU_Relatorios_CodDespesasf2Historico_ID := 28561
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Controle_Bancario_Banco_ID := 15018
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Controle_Bancario_Integrado_ID := 15022
DEFINE IDM_EMPTYSHELLMENU_Relatorios_ID := 15017
DEFINE IDM_EMPTYSHELLMENU_Relatorios_LST_Logix_ID := 15024
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID := 15021
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID := 15023
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID := 28571
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Configurar_ID := 15029
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID := 15027
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID := 15028
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_ID := 15026
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_ID := 15025
DEFINE IDM_STANDARDSHELLMENU := "STANDARDSHELLMENU"
DEFINE IDM_STANDARDSHELLMENU_Arquivo_Abrir_ID := 20947
DEFINE IDM_STANDARDSHELLMENU_Arquivo_Configurar_Impressora_ID := 20951
DEFINE IDM_STANDARDSHELLMENU_Arquivo_Fechar__Tudo_ID := 20949
DEFINE IDM_STANDARDSHELLMENU_Arquivo_Fechar_ID := 20948
DEFINE IDM_STANDARDSHELLMENU_Arquivo_ID := 20946
DEFINE IDM_STANDARDSHELLMENU_Arquivo_Sair_ID := 20953
DEFINE IDM_STANDARDSHELLMENU_Editar_Anterior_ID := 20962
DEFINE IDM_STANDARDSHELLMENU_Editar_Colar_ID := 20957
DEFINE IDM_STANDARDSHELLMENU_Editar_Copiar_ID := 20956
DEFINE IDM_STANDARDSHELLMENU_Editar_Deletar_Registro_ID := 20960
DEFINE IDM_STANDARDSHELLMENU_Editar_Encontrar_Registro_ID := 20966
DEFINE IDM_STANDARDSHELLMENU_Editar_ID := 20954
DEFINE IDM_STANDARDSHELLMENU_Editar_Inserir__Registro_ID := 20959
DEFINE IDM_STANDARDSHELLMENU_Editar_Posterior_ID := 20963
DEFINE IDM_STANDARDSHELLMENU_Editar_Primeiro_ID := 20965
DEFINE IDM_STANDARDSHELLMENU_Editar_Recortar_ID := 20955
DEFINE IDM_STANDARDSHELLMENU_Editar_Ultimo_ID := 20964
DEFINE IDM_STANDARDSHELLMENU_f3_Ajuda_de_Contexto_ID := 20976
DEFINE IDM_STANDARDSHELLMENU_f3_ID := 20974
DEFINE IDM_STANDARDSHELLMENU_f3_Indice_ID := 20975
DEFINE IDM_STANDARDSHELLMENU_f3_Sobre_ID := 20979
DEFINE IDM_STANDARDSHELLMENU_f3_Usando_a_Ajuda_ID := 20977
DEFINE IDM_STANDARDSHELLMENU_Janela_Cascata_ID := 20972
DEFINE IDM_STANDARDSHELLMENU_Janela_ID := 20971
DEFINE IDM_STANDARDSHELLMENU_Janela_Tilulos_ID := 20973
DEFINE IDM_STANDARDSHELLMENU_Visualizar_Exibir_por_ID := 20970
DEFINE IDM_STANDARDSHELLMENU_Visualizar_Formulário_ID := 20968
DEFINE IDM_STANDARDSHELLMENU_Visualizar_ID := 20967
DEFINE IDM_STANDARDSHELLMENU_Visualizar_Tabela_ID := 20969
#endregion

CLASS EMPTYSHELLMENU INHERIT Menu

// User code starts here (DO NOT remove this line)  ##USER##
CONSTRUCTOR( oOwner )

	LOCAL oTB AS Toolbar

	SELF:PreInit()

	SUPER( ResourceID { "EMPTYSHELLMENU" , _GetInst( ) } )

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_ID, ;
		HyperLabel{ #File , "&Arquivo" , "Opções de Arquivo" , "File" } , SELF:Handle() , 0)

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Lancamentos_ID, ;
		HyperLabel{ #XJBA01 , "Lançamentos" , "Lançamentos" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Lancamentos_so_Compentencia_ID, ;
		HyperLabel{ #XJBA01ATU , "Lançamentos so Compentencia" , NULL_STRING , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Lancamentos_Mes_Fechado_ID, ;
		HyperLabel{ #XJBA01FEC , "Lançamentos Mes Fechado" , "Lançamentos Mes Fechado" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Contas_Correntes_ID, ;
		HyperLabel{ #XJMF02 , "Contas Correntes" , "Contas Correntes" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Historico_ID, ;
		HyperLabel{ #XJBC01 , "Historico" , "Historico" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Codigo_de_Despesas_ID, ;
		HyperLabel{ #XJMI04 , "Codigo de Despesas" , "Codigo de Despesas" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Importar_Contas_Pagas_Manager_ID, ;
		HyperLabel{ #XJIMP , "Importar Contas Pagas Manager" , "Importar Contas Pagas Manager" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Contatos_ID, ;
		HyperLabel{ #XJBD01 , "Cadastro Contatos" , "Cadastro Contatos" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Itens_ID, ;
		HyperLabel{ #XJBE01 , "Cadastro Itens" , NULL_STRING , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Compra_Itens_ID, ;
		HyperLabel{ #XJBF01 , "Compra Itens" , NULL_STRING , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Trocar_Competencia_ID, ;
		HyperLabel{ #SAYCOM , "Trocar Competencia" , NULL_STRING , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID, ;
		HyperLabel{ #XINDEXAR , "Indexar" , "Indexar" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID, ;
		HyperLabel{ #FilePrinterSetup , "C&onfigurar Impressora .." , "Configurar as Opções da Impressora" , "File_Printer_Setup" })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Sair_ID, ;
		HyperLabel{ #FileExit , "&Sair	Alt+F4" , "Encerrar a Aplicação" , "File_Exit" })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_ID, ;
		HyperLabel{ #XWRPTBCO , "&Relatorios" , "Relatorios" , NULL_STRING } , SELF:Handle() , 1)

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Controle_Bancario_Banco_ID, ;
		HyperLabel{ #XWRPTBCO , "Controle Bancario Banco" , "Banco" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Bancos_Contas_ID, ;
		HyperLabel{ #XWRPTMF , "Bancos/Contas" , NULL_STRING , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_CodDespesas_Historico_ID, ;
		HyperLabel{ #XWRPTMI , "Cod.Despesas/Historico" , NULL_STRING , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID, ;
		HyperLabel{ #XWRPT , "WRPT" , "Relatorios Gerais" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Controle_Bancario_Integrado_ID, ;
		HyperLabel{ #XWRPTBCOI , "Controle Bancario Integrado" , NULL_STRING , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID, ;
		HyperLabel{ #XWRPTI , "WRPT Integrado" , NULL_STRING , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_LST_Logix_ID, ;
		HyperLabel{ #LSTVIEW , "LST Logix" , NULL_STRING , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_ID, ;
		HyperLabel{ #EMPTYSHELLMENU_Utilitarios , "Utilitarios" , "Utilitarios" , NULL_STRING } , SELF:Handle() , 2)

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_ID, ;
		HyperLabel{ #EMPTYSHELLMENU_Utilitarios_Email , "Email" , "Email" , NULL_STRING } , SELF:GetSubMenu( SELF:Handle() , 2 ) , 0)

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID, ;
		HyperLabel{ #XJMAIL , "Consulta" , "Consulta email" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID, ;
		HyperLabel{ #XJMAILGER , "Geral" , "GEral" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Configurar_ID, ;
		HyperLabel{ #XJMAILCFG , "Configurar" , "Configurar Email" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGC_CPF_IE_ID, ;
		HyperLabel{ #JCHECK , "Checar CGC/CPF/IE.." , "Checar CGC/CPF/IE..." , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU___ID, ;
		HyperLabel{ #Help , "&?" , "Ajuda" , NULL_STRING } , SELF:Handle() , 3)

	SELF:RegisterItem(IDM_EMPTYSHELLMENU___Conteudo_ID, ;
		HyperLabel{ #HelpCont , "&Conteúdo" , "Conteudo" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU___Indice_ID, ;
		HyperLabel{ #HelpIndex , "&Indice	F1" , "Índice da Ajuda" , "Help_Index" })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU___Atualizacoes_ID, ;
		HyperLabel{ #XVERSAO , "Atualizacoes" , "Atualizacoes" , NULL_STRING })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU___Sobre_ID, ;
		HyperLabel{ #HelpAboutDialog , "&Sobre..." , "Sobre a Aplicação" , NULL_STRING })

	oTB := Toolbar{}

	oTB:ButtonStyle := TB_ICONONLY
	oTB:Flat := TRUE
	oTB:EnableBands(FALSE)

	oTB:AppendItem(IDT_PRINT , IDM_EMPTYSHELLMENU_Relatorios_ID)
	oTB:AddTipText(IDT_PRINT , IDM_EMPTYSHELLMENU_Relatorios_ID , "Print")


	SELF:ToolBar := oTB
	SELF:Accelerator := EMPTYSHELLMENU_Accelerator{ }

	SELF:PostInit()

RETURN

END CLASS
CLASS EMPTYSHELLMENU_Accelerator INHERIT Accelerator

// User code starts here (DO NOT remove this line)  ##USER##
CONSTRUCTOR()
	SUPER( ResourceID { "EMPTYSHELLMENU_Accelerator" , _GetInst( ) } )
RETURN


END CLASS
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Lancamentos_ID := 15002
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Lancamentos_so_Compentencia_ID := 15003
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Lancamentos_Mes_Fechado_ID := 15004
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Bancos_Contas_ID := 15019
DEFINE IDM_EMPTYSHELLMENU_Relatorios_CodDespesas_Historico_ID := 15020
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGC_CPF_IE_ID := 15030
DEFINE IDM_EMPTYSHELLMENU___ID := 15031
DEFINE IDM_EMPTYSHELLMENU___Conteudo_ID := 15032
DEFINE IDM_EMPTYSHELLMENU___Indice_ID := 15033
DEFINE IDM_EMPTYSHELLMENU___Atualizacoes_ID := 15035
DEFINE IDM_EMPTYSHELLMENU___Sobre_ID := 15036
