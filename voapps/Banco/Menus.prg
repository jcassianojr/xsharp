#region DEFINES
DEFINE IDA_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDA_STANDARDSHELLMENU := "STANDARDSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Contatos_ID := 28550
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Itens_ID := 28551
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Codigo_de_Despesas_ID := 28548
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Compra_Itens_ID := 28552
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID := 28556
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Contas_Correntes_ID := 28546
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Historico_ID := 28547
DEFINE IDM_EMPTYSHELLMENU_Arquivo_ID := 28542
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Importar_Contas_Pagas_Manager_ID := 28549
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID := 28555
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Lançamentos_ID := 28543
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Lançamentos_Mes_Fechado_ID := 28545
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Lançamentos_so_Compentencia_ID := 28544
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Sair_ID := 28557
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Trocar_Competencia_ID := 28554
DEFINE IDM_EMPTYSHELLMENU_f3_Atualizacoes_ID := 28576
DEFINE IDM_EMPTYSHELLMENU_f3_Conteúdo_ID := 28573
DEFINE IDM_EMPTYSHELLMENU_f3_ID := 28572
DEFINE IDM_EMPTYSHELLMENU_f3_Indice_ID := 28574
DEFINE IDM_EMPTYSHELLMENU_f3_Sobre_ID := 32031
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Bancosf2Contas_ID := 28560
DEFINE IDM_EMPTYSHELLMENU_Relatorios_CodDespesasf2Historico_ID := 28561
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Controle_Bancario_Banco_ID := 28559
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Controle_Bancario_Integrado_ID := 28563
DEFINE IDM_EMPTYSHELLMENU_Relatorios_ID := 28558
DEFINE IDM_EMPTYSHELLMENU_Relatorios_LST_Logix_ID := 28565
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID := 28562
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID := 28564
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID := 28571
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Configurar_ID := 28570
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID := 28568
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID := 28569
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_ID := 28567
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_ID := 28566
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
 
CONSTRUCTOR(oOwner) 
	LOCAL oTB AS ToolBar

	SUPER(ResourceID{IDM_EMPTYSHELLMENU, _GetInst( )})

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_ID,	;
		HyperLabel{#File,	;
			"&Arquivo",	;
			"Opções de Arquivo",	;
			"File"},SELF:Handle( ),0)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Lançamentos_ID,	;
		HyperLabel{#XJBA01,	;
			"Lançamentos",	;
			"Lançamentos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Lançamentos_so_Compentencia_ID,	;
		HyperLabel{#XJBA01ATU,	;
			"Lançamentos so Compentencia",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Lançamentos_Mes_Fechado_ID,	;
		HyperLabel{#XJBA01FEC,	;
			"Lançamentos Mes Fechado",	;
			"Lançamentos Mes Fechado",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Contas_Correntes_ID,	;
		HyperLabel{#XJMF02,	;
			"Contas Correntes",	;
			"Contas Correntes",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Historico_ID,	;
		HyperLabel{#XJBC01,	;
			"Historico",	;
			"Historico",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Codigo_de_Despesas_ID,	;
		HyperLabel{#XJMI04,	;
			"Codigo de Despesas",	;
			"Codigo de Despesas",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Importar_Contas_Pagas_Manager_ID,	;
		HyperLabel{#XJIMP,	;
			"Importar Contas Pagas Manager",	;
			"Importar Contas Pagas Manager",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Contatos_ID,	;
		HyperLabel{#XJBD01,	;
			"Cadastro Contatos",	;
			"Cadastro Contatos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Itens_ID,	;
		HyperLabel{#XJBE01,	;
			"Cadastro Itens",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Compra_Itens_ID,	;
		HyperLabel{#XJBF01,	;
			"Compra Itens",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Trocar_Competencia_ID,	;
		HyperLabel{#SAYCOM,	;
			"Trocar Competencia",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID,	;
		HyperLabel{#XINDEXAR,	;
			"Indexar",	;
			"Indexar",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID,	;
		HyperLabel{#FilePrinterSetup,	;
			"C&onfigurar Impressora ..",	;
			"Configurar as Opções da Impressora",	;
			"File_Printer_Setup"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Sair_ID,	;
		HyperLabel{#FileExit,	;
			"&Sair	Alt+F4",	;
			"Encerrar a Aplicação",	;
			"File_Exit"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_ID,	;
		HyperLabel{#XWRPTBCO,	;
			"&Relatorios",	;
			"Relatorios",	;
			,},SELF:Handle( ),1)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Controle_Bancario_Banco_ID,	;
		HyperLabel{#XWRPTBCO,	;
			"Controle Bancario Banco",	;
			"Banco",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Bancosf2Contas_ID,	;
		HyperLabel{#XWRPTMF,	;
			"Bancos/Contas",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_CodDespesasf2Historico_ID,	;
		HyperLabel{#XWRPTMI,	;
			"Cod.Despesas/Historico",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID,	;
		HyperLabel{#XWRPT,	;
			"WRPT",	;
			"Relatorios Gerais",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Controle_Bancario_Integrado_ID,	;
		HyperLabel{#XWRPTBCOI,	;
			"Controle Bancario Integrado",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID,	;
		HyperLabel{#XWRPTI,	;
			"WRPT Integrado",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_LST_Logix_ID,	;
		HyperLabel{#LSTVIEW,	;
			"LST Logix",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_ID,	;
		HyperLabel{#_Utilitarios,	;
			"Utilitarios",	;
			"Utilitarios",	;
			,},SELF:Handle( ),2)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_ID,	;
		HyperLabel{#Utilitarios_Email,	;
			"Email",	;
			"Email",	;
			,},SELF:GetSubMenu(SELF:Handle( ),2),0)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID,	;
		HyperLabel{#XJMAIL,	;
			"Consulta",	;
			"Consulta email",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID,	;
		HyperLabel{#XJMAILGER,	;
			"Geral",	;
			"GEral",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Configurar_ID,	;
		HyperLabel{#XJMAILCFG,	;
			"Configurar",	;
			"Configurar Email",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID,	;
		HyperLabel{#JCHECK,	;
			"Checar CGC/CPF/IE...",	;
			"Checar CGC/CPF/IE...",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_f3_ID,	;
		HyperLabel{#Help,	;
			"&?",	;
			"Ajuda",	;
			,},SELF:Handle( ),3)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_f3_Conteúdo_ID,	;
		HyperLabel{#HelpCont,	;
			"&Conteúdo",	;
			"Conteudo",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_f3_Indice_ID,	;
		HyperLabel{#HelpIndex,	;
			"&Indice	F1",	;
			"Índice da Ajuda",	;
			"Help_Index"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_f3_Atualizacoes_ID,	;
		HyperLabel{#XVERSAO,	;
			"Atualizacoes",	;
			"Atualizacoes",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_f3_Sobre_ID,	;
		HyperLabel{#HelpAboutDialog,	;
			"&Sobre...",	;
			"Sobre a Aplicação",	;
			,})

	oTB := ToolBar{ }

	oTB:ButtonStyle := TB_ICONONLY

	oTB:AppendItem(IDT_PRINT,IDM_EMPTYSHELLMENU_Relatorios_ID)
	oTB:AddTipText(IDT_PRINT,IDM_EMPTYSHELLMENU_Relatorios_ID,"Print")

	oTB:Flat := TRUE

	SELF:ToolBar := oTB

	SELF:Accelerator := EMPTYSHELLMENU_Accelerator{ }

	RETURN SELF
END CLASS
CLASS EMPTYSHELLMENU_Accelerator INHERIT Accelerator
 
CONSTRUCTOR( ) 
	SUPER(ResourceID{IDA_EMPTYSHELLMENU, _GetInst( )})

	RETURN SELF
END CLASS
