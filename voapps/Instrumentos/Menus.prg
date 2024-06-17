#region DEFINES
DEFINE IDA_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Auxiliares_Areas_da_Empresa_ID := 28403
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Auxiliares_Fornecedores_ID := 28406
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Auxiliares_ID := 28402
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Auxiliares_Mao_de_Obra_Operador_ID := 28404
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Auxiliares_Tecnicos_ID := 28405
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID := 28409
DEFINE IDM_EMPTYSHELLMENU_Arquivo_ID := 28388
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID := 28408
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Ação_Corretiva_ID := 28391
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Certificado_de_Calibração_ID := 28393
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Fotos_ID := 28396
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_ID := 28389
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Instrumentos_ID := 28390
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Ordem_de_Calibração_ID := 28392
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Requisições_ID := 28395
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_RRM__Repetibilidade_Instrumentos_ID := 28394
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Sincronizar_MC_ID := 28397
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Sair_ID := 28411
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Utilitarios_Fotos_ID := 28401
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Utilitarios_ID := 28398
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Utilitarios_Requisicoes_ID := 28399
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Utilitarios_Utilitarios_ID := 28400
DEFINE IDM_EMPTYSHELLMENU_f3_Atualizações_ID := 28427
DEFINE IDM_EMPTYSHELLMENU_f3_ID := 28423
DEFINE IDM_EMPTYSHELLMENU_f3_Indice_ID := 28424
DEFINE IDM_EMPTYSHELLMENU_f3_Sobre_ID := 28428
DEFINE IDM_EMPTYSHELLMENU_f3_Usando_a_Ajuda_ID := 28425
DEFINE IDM_EMPTYSHELLMENU_Relatórios_ID := 28412
DEFINE IDM_EMPTYSHELLMENU_Relatórios_lstview_logix_ID := 28416
DEFINE IDM_EMPTYSHELLMENU_Relatórios_Relatorios_Instrumentos_ID := 28413
DEFINE IDM_EMPTYSHELLMENU_Relatórios_WRPT_ID := 28414
DEFINE IDM_EMPTYSHELLMENU_Relatórios_WRPT_Integrados_ID := 28415
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID := 28422
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Configuracao_ID := 28421
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID := 28419
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID := 28420
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_ID := 28418
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_ID := 28417
#endregion

CLASS EMPTYSHELLMENU INHERIT Menu
 
CONSTRUCTOR(oOwner) 

	SUPER(ResourceID{IDM_EMPTYSHELLMENU, _GetInst( )})

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_ID,	;
		HyperLabel{#File,	;
			"&Arquivo",	;
			"Opções de Arquivo",	;
			"File"},SELF:Handle( ),0)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_ID,	;
		HyperLabel{#Arquivo_Instrumentos,	;
			"Instrumentos",	;
			"Instrumentos",	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),0)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Instrumentos_ID,	;
		HyperLabel{#xJINS,	;
			"Instrumentos",	;
			"Instrumentos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Ação_Corretiva_ID,	;
		HyperLabel{#xJACO,	;
			"Ação Corretiva",	;
			"Ação Corretiva",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Ordem_de_Calibração_ID,	;
		HyperLabel{#xJOCC,	;
			"Ordem de Calibração",	;
			"Ordem de Calibração",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Certificado_de_Calibração_ID,	;
		HyperLabel{#XJME4CC,	;
			"Certificado de Calibração",	;
			"Certificado de Calibração",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_RRM__Repetibilidade_Instrumentos_ID,	;
		HyperLabel{#XJRRM,	;
			"RRM - Repetibilidade Instrumentos",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Requisições_ID,	;
		HyperLabel{#xJREQ,	;
			"Requisições",	;
			"Requisições",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Fotos_ID,	;
		HyperLabel{#IMGME04,	;
			"Fotos",	;
			"Fotos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Instrumentos_Sincronizar_MC_ID,	;
		HyperLabel{#IMPProteusMe04,	;
			"Sincronizar MC",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Utilitarios_ID,	;
		HyperLabel{#Arquivo_Utilitarios,	;
			"Utilitarios",	;
			"Utilitarios",	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),1)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Utilitarios_Requisicoes_ID,	;
		HyperLabel{#xJREU,	;
			"Requisicoes",	;
			"Requisicoes",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Utilitarios_Utilitarios_ID,	;
		HyperLabel{#xJINU,	;
			"Utilitarios",	;
			"Utilitarios",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Utilitarios_Fotos_ID,	;
		HyperLabel{#IMGME06,	;
			"Fotos",	;
			"Fotos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Auxiliares_ID,	;
		HyperLabel{#Arquivo_Cadastro_Auxiliares,	;
			"Cadastro Auxiliares",	;
			"Cadastro Auxiliares",	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),2)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Auxiliares_Areas_da_Empresa_ID,	;
		HyperLabel{#xJMP05,	;
			"Areas da Empresa",	;
			"Areas da Empresa",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Auxiliares_Mao_de_Obra_Operador_ID,	;
		HyperLabel{#xJMPo,	;
			"Mao de Obra Operador",	;
			"Mao de Obra Operador",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Auxiliares_Tecnicos_ID,	;
		HyperLabel{#XJTEC,	;
			"Tecnicos",	;
			"Tecnicos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Cadastro_Auxiliares_Fornecedores_ID,	;
		HyperLabel{#xJFOR,	;
			"Fornecedores",	;
			"Fornecedores",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID,	;
		HyperLabel{#XINDEXAR,	;
			"Indexar",	;
			"Indexar",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID,	;
		HyperLabel{#fileprintersetup,	;
			"C&onfigurar Impressora ..",	;
			"Configurar as Opções da Impressora",	;
			"File_Printer_Setup"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Sair_ID,	;
		HyperLabel{#FileExit,	;
			"&Sair	Alt+F4",	;
			"Encerrar a Aplicação",	;
			"File_Exit"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatórios_ID,	;
		HyperLabel{#XWRPTM4,	;
			"&Relatórios",	;
			"Relatórios",	;
			,},SELF:Handle( ),1)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatórios_Relatorios_Instrumentos_ID,	;
		HyperLabel{#XWRPTM4,	;
			"Relatorios Instrumentos",	;
			"Relatorios Instrumentos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatórios_WRPT_ID,	;
		HyperLabel{#XWRPT,	;
			"WRPT",	;
			"Relatorios Geral",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatórios_WRPT_Integrados_ID,	;
		HyperLabel{#XWRPTI,	;
			"WRPT Integrados",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatórios_lstview_logix_ID,	;
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
		HyperLabel{#HelpUsingHelp,	;
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

	RETURN SELF
END CLASS
CLASS EMPTYSHELLMENU_Accelerator INHERIT Accelerator
 
CONSTRUCTOR( ) 
	SUPER(ResourceID{IDA_EMPTYSHELLMENU, _GetInst( )})

	RETURN SELF
END CLASS
