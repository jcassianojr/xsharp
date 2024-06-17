#region DEFINES
DEFINE IDA_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Areas_da_Empresa_ID := 25052
DEFINE IDM_EMPTYSHELLMENU_Arquivo_BreakDown_Tooling_Investiment_ID := 25054
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Clientes_ID := 25048
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Compradores_ID := 25049
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Condição_de_Desenvolvimento_Acumular_Medias_Mensais_ID := 25060
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Condição_de_Desenvolvimento_Alterar_Medias_ID := 25061
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Condição_de_Desenvolvimento_Checar_OSe3CD_ID := 25059
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Condição_de_Desenvolvimento_Condição_de_Desenvolvimento_ID := 25057
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Condição_de_Desenvolvimento_Controle_de_OS_ID := 25058
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Condição_de_Desenvolvimento_ID := 25056
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID := 25064
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Pedidos_ID := 25053
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Controle_OS_Ferramentas_ID := 25062
DEFINE IDM_EMPTYSHELLMENU_Arquivo_ID := 25046
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID := 25066
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Motivos_Declinio_ID := 25055
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Orçamentos_ID := 25051
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Sair_ID := 25068
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Vendedores_ID := 25050
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Viabilidade_ID := 25047
DEFINE IDM_EMPTYSHELLMENU_f3_Atualizações_ID := 25096
DEFINE IDM_EMPTYSHELLMENU_f3_Conteúdo_ID := 25094
DEFINE IDM_EMPTYSHELLMENU_f3_ID := 25092
DEFINE IDM_EMPTYSHELLMENU_f3_Indice_ID := 25093
DEFINE IDM_EMPTYSHELLMENU_f3_Sobre_ID := 25097
DEFINE IDM_EMPTYSHELLMENU_Relatorio_Areas_da_empresa_ID := 25082
DEFINE IDM_EMPTYSHELLMENU_Relatorio_Breakdown_Tooling_Investiment_ID := 25076
DEFINE IDM_EMPTYSHELLMENU_Relatorio_Clientes_ID := 25072
DEFINE IDM_EMPTYSHELLMENU_Relatorio_Compradores_ID := 25073
DEFINE IDM_EMPTYSHELLMENU_Relatorio_Condição_de_Desenvolvimento_ID := 25077
DEFINE IDM_EMPTYSHELLMENU_Relatorio_Controle_de_os_ID := 25081
DEFINE IDM_EMPTYSHELLMENU_Relatorio_Controle_de_Pedidos_ID := 25075
DEFINE IDM_EMPTYSHELLMENU_Relatorio_Custos_ID := 25079
DEFINE IDM_EMPTYSHELLMENU_Relatorio_ID := 25069
DEFINE IDM_EMPTYSHELLMENU_Relatorio_lstview_logix_ID := 25085
DEFINE IDM_EMPTYSHELLMENU_Relatorio_Orçamento_ID := 25074
DEFINE IDM_EMPTYSHELLMENU_Relatorio_OS_Ferramenta_ID := 25080
DEFINE IDM_EMPTYSHELLMENU_Relatorio_Produtos_ID := 25078
DEFINE IDM_EMPTYSHELLMENU_Relatorio_Viabilidade_ID := 25070
DEFINE IDM_EMPTYSHELLMENU_Relatorio_ViablidadeOrcamento_Logix_ID := 25071
DEFINE IDM_EMPTYSHELLMENU_Relatorio_WRPT_ID := 25083
DEFINE IDM_EMPTYSHELLMENU_Relatorio_WRPT_Integrado_ID := 25084
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID := 25091
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Configuração_ID := 25090
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID := 25088
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID := 25089
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_ID := 25087
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_ID := 25086
#endregion

CLASS EMPTYSHELLMENU INHERIT Menu 

CONSTRUCTOR(oOwner) 

	SELF:PreInit()
	SUPER(ResourceID{IDM_EMPTYSHELLMENU, _GetInst( )})

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_ID,	;
		HyperLabel{#File,	;
			"&Arquivo",	;
			"Opções de Arquivo",	;
			"File"},SELF:Handle( ),0)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Viabilidade_ID,	;
		HyperLabel{#XJANVIA,	;
			"&Viabilidade...",	;
			"Viablilidade",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Clientes_ID,	;
		HyperLabel{#XJANCLI,	;
			"C&lientes",	;
			"Clientes",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Compradores_ID,	;
		HyperLabel{#XJCPP,	;
			"Compra&dores",	;
			"Compradores",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Vendedores_ID,	;
		HyperLabel{#XJCPV,	;
			"&Vendedores",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Orçamentos_ID,	;
		HyperLabel{#XJORCA,	;
			"Orçamentos",	;
			"Orcamentos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Areas_da_Empresa_ID,	;
		HyperLabel{#XJMP05,	;
			"Areas da Empresa",	;
			"Areas da Empresa",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Pedidos_ID,	;
		HyperLabel{#XJNP,	;
			"Controle de Pedidos",	;
			"Controle de Pedidos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_BreakDown_Tooling_Investiment_ID,	;
		HyperLabel{#XJBTI,	;
			"BreakDown Tooling Investiment",	;
			"BreakDown Tooling Investiment",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Motivos_Declinio_ID,	;
		HyperLabel{#XJDELMOT,	;
			"Motivos Declinio",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Condição_de_Desenvolvimento_ID,	;
		HyperLabel{#Arquivo_Condição_de_Desenvolvimento,	;
			"Condição de Desenvolvimento",	;
			"Condição de Desenvolvimento",	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),9)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Condição_de_Desenvolvimento_Condição_de_Desenvolvimento_ID,	;
		HyperLabel{#XJCD,	;
			"Condição de Desenvolvimento",	;
			"Condição de Desenvolvimento",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Condição_de_Desenvolvimento_Controle_de_OS_ID,	;
		HyperLabel{#XJOSC,	;
			"Controle de OS",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Condição_de_Desenvolvimento_Checar_OSe3CD_ID,	;
		HyperLabel{#XOSCD,	;
			"Checar OS-->CD",	;
			"Checar OS-->CD",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Condição_de_Desenvolvimento_Acumular_Medias_Mensais_ID,	;
		HyperLabel{#acumulabs5,	;
			"Acumular Medias Mensais",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Condição_de_Desenvolvimento_Alterar_Medias_ID,	;
		HyperLabel{#XJAPUPRD,	;
			"Alterar Medias",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Controle_OS_Ferramentas_ID,	;
		HyperLabel{#xjferos,	;
			"Controle OS Ferramentas",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID,	;
		HyperLabel{#fileprintersetup,	;
			"C&onfigurar Impressora ..",	;
			"Configurar as Opções da Impressora",	;
			"File_Printer_Setup"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID,	;
		HyperLabel{#XINDEXAR,	;
			"&Indexar",	;
			"Indexar",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Sair_ID,	;
		HyperLabel{#FileExit,	;
			"&Sair	ALT+F4",	;
			"Encerrar a Aplicação",	;
			"File_Exit"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_ID,	;
		HyperLabel{#_Relatorio,	;
			"&Relatorio",	;
			"Relatorios",	;
			,},SELF:Handle( ),1)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_Viabilidade_ID,	;
		HyperLabel{#xwrPtvia,	;
			"Viabilidade",	;
			"Viabilidade",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_ViablidadeOrcamento_Logix_ID,	;
		HyperLabel{#xwrpriLXOC,	;
			"Viablidade(Orcamento Logix)",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_Clientes_ID,	;
		HyperLabel{#xwrptma,	;
			"C&lientes",	;
			"Clientes",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_Compradores_ID,	;
		HyperLabel{#xwrptmc,	;
			"Compra&dores",	;
			"Compradores",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_Orçamento_ID,	;
		HyperLabel{#xwrptorca,	;
			"Orçamento",	;
			"Orcamento",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_Controle_de_Pedidos_ID,	;
		HyperLabel{#xwrptped,	;
			"Controle de Pedidos",	;
			"Controel de Pedidos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_Breakdown_Tooling_Investiment_ID,	;
		HyperLabel{#xwrptbrea,	;
			"Breakdown Tooling Investiment",	;
			"Breakdown Tooling Investiment",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_Condição_de_Desenvolvimento_ID,	;
		HyperLabel{#xwrptcond,	;
			"Condição de Desenvolvimento",	;
			"Condição de Desenvolvimento",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_Produtos_ID,	;
		HyperLabel{#xwrptpro,	;
			"Produtos",	;
			"Produtos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_Custos_ID,	;
		HyperLabel{#xwrptcus,	;
			"Custos",	;
			"Custos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_OS_Ferramenta_ID,	;
		HyperLabel{#xwrptosfe,	;
			"OS Ferramenta",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_Controle_de_os_ID,	;
		HyperLabel{#xwrptmocos,	;
			"Controle de os",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_Areas_da_empresa_ID,	;
		HyperLabel{#xwrptmpar,	;
			"Areas da empresa",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_WRPT_ID,	;
		HyperLabel{#XWRPT,	;
			"WRPT",	;
			"Relatorios Geral",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_WRPT_Integrado_ID,	;
		HyperLabel{#XWRPTI,	;
			"WRPT Integrado",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorio_lstview_logix_ID,	;
		HyperLabel{#lstview,	;
			"lstview logix",	;
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
			"Consulta",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID,	;
		HyperLabel{#XJMAILGER,	;
			"Geral",	;
			"Geral",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Configuração_ID,	;
		HyperLabel{#XJMAILCFG,	;
			"Configuração",	;
			"Configuração",	;
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
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_f3_Indice_ID,	;
		HyperLabel{#HelpIndex,	;
			"&Indice	F1",	;
			"Índice da Ajuda",	;
			"Help_Index"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_f3_Conteúdo_ID,	;
		HyperLabel{#HelpCont,	;
			"&Conteúdo",	;
			"Como usar a Ajuda",	;
			"Help_UsingHelp"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_f3_Atualizações_ID,	;
		HyperLabel{#XVERSAO,	;
			"Atualizações",	;
			"Atualizações",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_f3_Sobre_ID,	;
		HyperLabel{#HelpAboutDialog,	;
			"&Sobre...",	;
			"Sobre a Aplicação",	;
			,})

	SELF:Accelerator := EMPTYSHELLMENU_Accelerator{ }

	SELF:PostInit()
	RETURN SELF
END CLASS
CLASS EMPTYSHELLMENU_Accelerator INHERIT Accelerator
 
CONSTRUCTOR( ) 
	SUPER(ResourceID{IDA_EMPTYSHELLMENU, _GetInst( )})
	RETURN SELF
END CLASS
