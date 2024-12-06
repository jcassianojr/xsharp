#region DEFINES
Define IDA_EMPTYSHELLMENU := "EMPTYSHELLMENU"
Define IDM_EMPTYSHELLMENU := "EMPTYSHELLMENU"
Define IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID := 21784
Define IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Normas_ID := 21780
Define IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Normas_Normas_ID := 21781
Define IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Normas_Tipos_ID := 21782
Define IDM_EMPTYSHELLMENU_Arquivo_ID := 21779
Define IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID := 21783
Define IDM_EMPTYSHELLMENU_Arquivo_Sair_ID := 21790
Define IDM_EMPTYSHELLMENU_Arquivo_teste_preview_bmp_ID := 21787
Define IDM_EMPTYSHELLMENU_Arquivo_teste_preview_dbf_ID := 21788
Define IDM_EMPTYSHELLMENU_Arquivo_teste_preview_RTF_ID := 21785
Define IDM_EMPTYSHELLMENU_Arquivo_teste_preview_txt_ID := 21786
Define IDM_EMPTYSHELLMENU_f3_Atualização_ID := 21806
Define IDM_EMPTYSHELLMENU_f3_ID := 21802
Define IDM_EMPTYSHELLMENU_f3_Indice_ID := 21803
Define IDM_EMPTYSHELLMENU_f3_Sobre_ID := 21807
Define IDM_EMPTYSHELLMENU_f3_Usando_a_Ajuda_ID := 21804
Define IDM_EMPTYSHELLMENU_Relatorios_ID := 21791
Define IDM_EMPTYSHELLMENU_Relatorios_lstview_logix_ID := 21795
Define IDM_EMPTYSHELLMENU_Relatorios_Relatorios_Engenharia_ID := 21792
Define IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID := 21793
Define IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID := 21794
Define IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID := 21801
Define IDM_EMPTYSHELLMENU_Utilitarios_Email_Configuracao_ID := 21800
Define IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID := 21798
Define IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID := 21799
Define IDM_EMPTYSHELLMENU_Utilitarios_Email_ID := 21797
Define IDM_EMPTYSHELLMENU_Utilitarios_ID := 21796
#endregion

CLASS EMPTYSHELLMENU INHERIT Menu 

CONSTRUCTOR(oOwner) 

	SELF:PreInit()
	SUPER(ResourceID{IDM_EMPTYSHELLMENU, _GetInst( )})

	self:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_ID,	;
		HyperLabel{#File,	;
			"&Arquivo",	;
			"Opções de Arquivo",	;
			"File"},self:Handle( ),0)
	self:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Normas_ID,	;
		HyperLabel{#JLC,	;
			"Controle de Normas",	;
			"Controle de Normas",	;
			,},GetSubMenu(self:Handle( ),0),0)
	self:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Normas_Normas_ID,	;
		HyperLabel{#XJLC,	;
			"Normas",	;
			"Normas",	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Normas_Tipos_ID,	;
		HyperLabel{#XJLCT,	;
			"Tipos",	;
			"Tipos",	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID,	;
		HyperLabel{#XINDEXAR,	;
			"Indexar",	;
			"Indexar",	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID,	;
		HyperLabel{#FilePrinterSetup,	;
			"C&onfigurar Impressora ..",	;
			"Configurar as Opções da Impressora",	;
			"File_Printer_Setup"})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_teste_preview_RTF_ID,	;
		HyperLabel{#PreviewRTF,	;
			"teste preview RTF",	;
			,	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_teste_preview_txt_ID,	;
		HyperLabel{#Previewtxt,	;
			"teste preview txt",	;
			,	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_teste_preview_bmp_ID,	;
		HyperLabel{#Previewbmp,	;
			"teste preview bmp",	;
			,	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_teste_preview_dbf_ID,	;
		HyperLabel{#Previewdbf,	;
			"teste preview dbf",	;
			,	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Sair_ID,	;
		HyperLabel{#FileExit,	;
			"&Sair	Alt+F4",	;
			"Encerrar a Aplicação",	;
			"File_Exit"})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_ID,	;
		HyperLabel{#XWRPTEN,	;
			"&Relatorios",	;
			"Relatorios",	;
			,},self:Handle( ),1)
	self:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Relatorios_Engenharia_ID,	;
		HyperLabel{#XWRPTEN,	;
			"Relatorios Engenharia",	;
			"Relatorios Engenharia",	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID,	;
		HyperLabel{#XWRPT,	;
			"WRPT",	;
			"Relatorios Geral",	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID,	;
		HyperLabel{#XWRPTI,	;
			"WRPT Integrado",	;
			,	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_lstview_logix_ID,	;
		HyperLabel{#lstview,	;
			"lstview logix",	;
			,	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_ID,	;
		HyperLabel{#_Utilitarios,	;
			"Utilitarios",	;
			"Utilitarios",	;
			,},self:Handle( ),2)
	self:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_ID,	;
		HyperLabel{#Utilitarios_Email,	;
			"Email",	;
			"Email",	;
			,},GetSubMenu(self:Handle( ),2),0)
	self:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID,	;
		HyperLabel{#XJMAIL,	;
			"Consulta",	;
			"Consulta Mensagens",	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID,	;
		HyperLabel{#XJMAILGER,	;
			"Geral",	;
			"Consulta Geral",	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Configuracao_ID,	;
		HyperLabel{#XJMAILCFG,	;
			"Configuracao",	;
			"Configuracao Mensagens",	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID,	;
		HyperLabel{#JCHECK,	;
			"Checar CGC/CPF/IE...",	;
			"Checar CGC/CPF/IE...",	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_f3_ID,	;
		HyperLabel{#Help,	;
			"&?",	;
			"Ajuda",	;
			,},self:Handle( ),3)
	self:RegisterItem(IDM_EMPTYSHELLMENU_f3_Indice_ID,	;
		HyperLabel{#HelpIndex,	;
			"&Indice	F1",	;
			"Índice da Ajuda",	;
			"Help_Index"})
	self:RegisterItem(IDM_EMPTYSHELLMENU_f3_Usando_a_Ajuda_ID,	;
		HyperLabel{#HelpUsingHelp,	;
			"&Usando a Ajuda",	;
			"Como usar a Ajuda",	;
			"Help_UsingHelp"})
	self:RegisterItem(IDM_EMPTYSHELLMENU_f3_Atualização_ID,	;
		HyperLabel{#XVERSAO,	;
			"Atualização",	;
			"Atualizacao",	;
			,})
	self:RegisterItem(IDM_EMPTYSHELLMENU_f3_Sobre_ID,	;
		HyperLabel{#HelpAboutDialog,	;
			"&Sobre...",	;
			"Sobre a Aplicação",	;
			,})

	self:Accelerator := EMPTYSHELLMENU_Accelerator{ }

	SELF:PostInit()
	return self
END CLASS
CLASS EMPTYSHELLMENU_Accelerator INHERIT Accelerator
 
CONSTRUCTOR( ) 
	SUPER(ResourceID{IDA_EMPTYSHELLMENU, _GetInst( )})
	return self
END CLASS
