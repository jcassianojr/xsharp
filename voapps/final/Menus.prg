#region DEFINES
DEFINE IDA_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID := 28551
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Desmarcar_Produto_Seleção_10052_ID := 28546
DEFINE IDM_EMPTYSHELLMENU_Arquivo_ID := 28542
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID := 28549
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Marcar_Produto_Seleção_10052_ID := 28545
DEFINE IDM_EMPTYSHELLMENU_Arquivo_OSCRT__Controle_de_Os_ID := 28544
DEFINE IDM_EMPTYSHELLMENU_Arquivo_RIF__Registro_de_Inspecao_Final_ID := 28543
DEFINE IDM_EMPTYSHELLMENU_Arquivo_RIFf2Produto_1200f2Sel_10052_ID := 28547
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Sair_ID := 28553
DEFINE IDM_EMPTYSHELLMENU_f3_Atualizações_ID := 28569
DEFINE IDM_EMPTYSHELLMENU_f3_ID := 28565
DEFINE IDM_EMPTYSHELLMENU_f3_Indice_ID := 28566
DEFINE IDM_EMPTYSHELLMENU_f3_Sobre_ID := 32031
DEFINE IDM_EMPTYSHELLMENU_f3_Usando_a_Ajuda_ID := 28567
DEFINE IDM_EMPTYSHELLMENU_Relatorios_ID := 28554
DEFINE IDM_EMPTYSHELLMENU_Relatorios_lst_view_logix_ID := 28558
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Relatorios_Final_ID := 28555
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID := 28556
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID := 28557
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID := 28564
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Configuração_ID := 28563
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID := 28561
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID := 28562
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_ID := 28560
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_ID := 28559
#endregion

CLASS EMPTYSHELLMENU INHERIT Menu
 
CONSTRUCTOR(oOwner) 

	SUPER(ResourceID{IDM_EMPTYSHELLMENU, _GetInst( )})

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_ID,	;
		HyperLabel{#File,	;
			"&Arquivo",	;
			"Opções de Arquivo",	;
			"File"},SELF:Handle( ),0)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_RIF__Registro_de_Inspecao_Final_ID,	;
		HyperLabel{#XJRIF,	;
			"RIF - Registro de Inspecao Final",	;
			"RIF - Registro de Inspecao Final",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_OSCRT__Controle_de_Os_ID,	;
		HyperLabel{#XJOSC,	;
			"OSCRT - Controle de Os",	;
			"OSCRT - Controle de Os",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Marcar_Produto_Seleção_10052_ID,	;
		HyperLabel{#XMARCAR,	;
			"Marcar Produto Seleção 100%",	;
			"Marcar Produto Seleção 100%",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Desmarcar_Produto_Seleção_10052_ID,	;
		HyperLabel{#XDESMARCAR,	;
			"Desmarcar Produto Seleção 100%",	;
			"Desmarcar Produto Seleção 100%",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_RIFf2Produto_1200f2Sel_10052_ID,	;
		HyperLabel{#XJRIFPR,	;
			"RIF/Produto 1200/Sel 100%",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID,	;
		HyperLabel{#Xindexar,	;
			"Indexar",	;
			"Indexar",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID,	;
		HyperLabel{#FILEPRINTERSETUP,	;
			"C&onfigurar Impressora ..",	;
			"Configurar as Opções da Impressora",	;
			"File_Printer_Setup"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Sair_ID,	;
		HyperLabel{#FileExit,	;
			"&Sair	Alt+F4",	;
			"Encerrar a Aplicação",	;
			"File_Exit"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_ID,	;
		HyperLabel{#XWRPTRIF,	;
			"&Relatorios",	;
			,	;
			,},SELF:Handle( ),1)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Relatorios_Final_ID,	;
		HyperLabel{#XWRPTRIF,	;
			"Relatorios Final",	;
			"Relatorios Final",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID,	;
		HyperLabel{#XWRPT,	;
			"WRPT",	;
			"Relatorios Geral",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID,	;
		HyperLabel{#XWRPTI,	;
			"WRPT Integrado",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_lst_view_logix_ID,	;
		HyperLabel{#lstview,	;
			"lst view logix",	;
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
