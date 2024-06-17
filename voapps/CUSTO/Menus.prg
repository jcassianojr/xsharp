#region DEFINES
DEFINE IDA_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Analise_de_Custos_Analise_de_Custo_ID := 21807
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Analise_de_Custos_ID := 21806
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Analise_de_Custos_Produtos_ID := 21808
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Apoio_Area_Industriais_ID := 21794
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Apoio_Clientes_ID := 21795
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Apoio_ID := 21792
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Apoio_Técnicos_ID := 21793
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Apoio_Zona_de_Vendas_ID := 21796
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID := 21810
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_Assinar_ID := 21787
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_Concluidas_ID := 21789
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_Em_Aberto_ID := 21786
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_ID := 21785
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_Nova_Revisao_ID := 21788
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_Produtos_ID := 21791
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_Revisoes_Antigas_ID := 21790
DEFINE IDM_EMPTYSHELLMENU_Arquivo_ID := 21779
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID := 21811
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Mão_De_Obra_ID := 21781
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Mão_De_Obra_Máquina_ID := 21782
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Mão_De_Obra_Operador_ID := 21783
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Mão_De_Obra_Terceiros_ID := 21784
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Componente_ID := 21804
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Cotações_ID := 21801
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Equipamentos_ID := 21803
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_ID := 21797
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Markup_ID := 21800
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Materia_Prima_ID := 21805
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Planilha_de_Orcamentos_Fechadas_ID := 21799
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Planilha_Orçamentos_ID := 21798
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Produtos_ID := 21802
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Sair_ID := 21813
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Viabilidade_ID := 32001
DEFINE IDM_EMPTYSHELLMENU_f3_Atualizações_ID := 21833
DEFINE IDM_EMPTYSHELLMENU_f3_ID := 21829
DEFINE IDM_EMPTYSHELLMENU_f3_Indice_ID := 21830
DEFINE IDM_EMPTYSHELLMENU_f3_Sobre_ID := 32031
DEFINE IDM_EMPTYSHELLMENU_f3_Usando_a_Ajuda_ID := 21831
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Analise_de_Custo_ID := 21819
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Custos_Todos_ID := 21815
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Estimativa_ID := 21817
DEFINE IDM_EMPTYSHELLMENU_Relatorios_ID := 21814
DEFINE IDM_EMPTYSHELLMENU_Relatorios_LST_View_ID := 21822
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Planilha_de_Orçamento_ID := 21818
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Viabilidade_ID := 21816
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID := 21820
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID := 21821
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID := 21828
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Configuracao_ID := 21827
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID := 21825
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID := 21826
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_ID := 21824
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_ID := 21823
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
			"Viabilidade",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Mão_De_Obra_ID,	;
		HyperLabel{#Arquivo_Mão_De_Obra,	;
			"Mão De Obra",	;
			"Mao de Obra",	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),1)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Mão_De_Obra_Máquina_ID,	;
		HyperLabel{#XJMM,	;
			"Máquina",	;
			"Mao de Obra Maquina",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Mão_De_Obra_Operador_ID,	;
		HyperLabel{#XJMO,	;
			"Operador",	;
			"Mao de Obra Operador",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Mão_De_Obra_Terceiros_ID,	;
		HyperLabel{#XJMT,	;
			"Terceiros",	;
			"Mao de Obra Terceiros",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_ID,	;
		HyperLabel{#Arquivo_Estimativa_Processo,	;
			"Estimativa Processo",	;
			,	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),2)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_Em_Aberto_ID,	;
		HyperLabel{#XJEP,	;
			"Em Aberto",	;
			"Estimativa em Aberto",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_Assinar_ID,	;
		HyperLabel{#XASSESP,	;
			"Assinar",	;
			"Assinar Estimativas Conclusao",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_Nova_Revisao_ID,	;
		HyperLabel{#XREVESP,	;
			"Nova Revisao",	;
			"Nova Revisao Estimativa",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_Concluidas_ID,	;
		HyperLabel{#XESF,	;
			"Concluidas",	;
			"Estimativas Concluidas",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_Revisoes_Antigas_ID,	;
		HyperLabel{#XESO,	;
			"Revisoes Antigas",	;
			"Estimativas Revisoes Antigas",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Estimativa_Processo_Produtos_ID,	;
		HyperLabel{#ZJPRO,	;
			"Produtos",	;
			"Visuzalizar Produtos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Apoio_ID,	;
		HyperLabel{#Arquivo_Cadastro_Apoio,	;
			"Cadastro Apoio",	;
			,	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),3)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Apoio_Técnicos_ID,	;
		HyperLabel{#XJTEC,	;
			"Técnicos",	;
			"Cadastro de Funcionarios",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Apoio_Area_Industriais_ID,	;
		HyperLabel{#XJMP05,	;
			"Area &Industriais",	;
			"Areas Industrial",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Apoio_Clientes_ID,	;
		HyperLabel{#XJANCLI,	;
			"C&lientes",	;
			"Clientes",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Apoio_Zona_de_Vendas_ID,	;
		HyperLabel{#XJZVE,	;
			"&Zona de Vendas",	;
			"Zonas de Vendas",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_ID,	;
		HyperLabel{#Arquivo_Planilhas_Orcamentos,	;
			"Planilhas Orcamentos",	;
			"Planilhas Orcamentos",	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),4)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Planilha_Orçamentos_ID,	;
		HyperLabel{#XJPO,	;
			"Planil&ha Orçamentos",	;
			"Planilhas Orcamentos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Planilha_de_Orcamentos_Fechadas_ID,	;
		HyperLabel{#XJPOF,	;
			"Planilha de Orcamentos Fechadas",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Markup_ID,	;
		HyperLabel{#XJMK,	;
			"Mar&kup",	;
			"Markup",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Cotações_ID,	;
		HyperLabel{#XJCOT,	;
			"Cotações",	;
			"Cotações",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Produtos_ID,	;
		HyperLabel{#ZJPRO,	;
			"Prod&utos",	;
			"Produtos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Equipamentos_ID,	;
		HyperLabel{#XJEQP,	;
			"&Equipamentos",	;
			"Equipamentos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Componente_ID,	;
		HyperLabel{#XJCOM,	;
			"&Componente",	;
			"Componente",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Planilhas_Orcamentos_Materia_Prima_ID,	;
		HyperLabel{#XJMP,	;
			"Materia &Prima",	;
			"Materia Prima",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Analise_de_Custos_ID,	;
		HyperLabel{#Arquivo_Analise_de_Custos,	;
			"Analise de Custos",	;
			"Analise de Custos",	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),5)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Analise_de_Custos_Analise_de_Custo_ID,	;
		HyperLabel{#XJESC,	;
			"Analise de Custo",	;
			"Analise de Custo",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Analise_de_Custos_Produtos_ID,	;
		HyperLabel{#ZJPRO,	;
			"Produtos",	;
			"Produtos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID,	;
		HyperLabel{#fileprintersetup,	;
			"C&onfigurar Impressora ..",	;
			"Configurar as Opções da Impressora",	;
			"File_Printer_Setup"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID,	;
		HyperLabel{#XINDEXAR,	;
			"&Indexar",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Sair_ID,	;
		HyperLabel{#FileExit,	;
			"&Sair	Alt+F4",	;
			"Encerrar a Aplicação",	;
			"File_Exit"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_ID,	;
		HyperLabel{#XJWRPTCU,	;
			"&Relatorios",	;
			,	;
			,},SELF:Handle( ),1)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Custos_Todos_ID,	;
		HyperLabel{#XJWRPTCU,	;
			"Custos (Todos)",	;
			"Custos (Todos)",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Viabilidade_ID,	;
		HyperLabel{#XJWRPTVIA,	;
			"Viabilidade",	;
			"Viabilidade",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Estimativa_ID,	;
		HyperLabel{#XJWRPTESP,	;
			"Estimativa",	;
			"Estimativa",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Planilha_de_Orçamento_ID,	;
		HyperLabel{#XJWRPTPO,	;
			"Planilha de Orçamento",	;
			"Planilha de Orçamento",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Analise_de_Custo_ID,	;
		HyperLabel{#XJWRPTAC,	;
			"Analise de Custo",	;
			"Analise de Custo",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID,	;
		HyperLabel{#XWRPT,	;
			"WRPT",	;
			"WRPT",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID,	;
		HyperLabel{#XWRPTI,	;
			"WRPT Integrado",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_LST_View_ID,	;
		HyperLabel{#lstview,	;
			"LST View",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_ID,	;
		HyperLabel{#_Utilitarios,	;
			"Utilitarios",	;
			,	;
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
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Configuracao_ID,	;
		HyperLabel{#XJMAILCFG,	;
			"Configuracao",	;
			"Configuracao",	;
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
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_f3_Usando_a_Ajuda_ID,	;
		HyperLabel{#helpcont,	;
			"&Usando a Ajuda",	;
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
