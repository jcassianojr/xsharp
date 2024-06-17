#region DEFINES
DEFINE IDA_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID := 25070
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Desempenho_Apurar_Anual_ID := 25049
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Desempenho_Desempenho_ID := 25048
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Desempenho_ID := 25047
DEFINE IDM_EMPTYSHELLMENU_Arquivo_IAC__Indice_de_Atendimentos_Cliente_Apuracao_Importacao_ID := 25065
DEFINE IDM_EMPTYSHELLMENU_Arquivo_IAC__Indice_de_Atendimentos_Cliente_Cliente_Grupof2Lx_ID := 25067
DEFINE IDM_EMPTYSHELLMENU_Arquivo_IAC__Indice_de_Atendimentos_Cliente_Consulta_Competencia_ID := 25066
DEFINE IDM_EMPTYSHELLMENU_Arquivo_IAC__Indice_de_Atendimentos_Cliente_ID := 25064
DEFINE IDM_EMPTYSHELLMENU_Arquivo_ID := 25046
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Importar_Processo_ID := 25063
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID := 25069
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Sair_ID := 25071
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Atual_ID := 25051
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixados_ID := 25052
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixar_ID := 25053
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixar_Produtos_Não_Ativos_ID := 25057
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixar_Seq_Obsoletas_ID := 25058
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixar_Um_Produto_ID := 25054
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixar_Uma_Competencia_ID := 25056
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixar_Uma_Operação_ID := 25055
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_ID := 25050
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Retornar_ID := 25059
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Retornar_Um_Produto_ID := 25060
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Retornar_Uma_Competência_ID := 25062
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Retornar_Uma_Operação_ID := 25061
DEFINE IDM_EMPTYSHELLMENU_f3_Atualizações_ID := 25093
DEFINE IDM_EMPTYSHELLMENU_f3_ID := 25089
DEFINE IDM_EMPTYSHELLMENU_f3_Indice_ID := 25090
DEFINE IDM_EMPTYSHELLMENU_f3_Sobre_ID := 32031
DEFINE IDM_EMPTYSHELLMENU_f3_Usando_a_Ajuda_ID := 25091
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Comparativosf2Outros_ID := 25077
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Equipamentos_ID := 25074
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Funcionários_ID := 25073
DEFINE IDM_EMPTYSHELLMENU_Relatorios_ID := 25072
DEFINE IDM_EMPTYSHELLMENU_Relatorios_lstview_logix_ID := 25082
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Paradas_ID := 25075
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Produtos_ID := 25076
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_IAC_ID := 25079
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID := 25080
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrados_ID := 25081
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_Producao_ID := 25078
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID := 25088
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Configuracao_ID := 25087
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID := 25085
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID := 25086
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_ID := 25084
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_ID := 25083
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
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Desempenho_ID,	;
		HyperLabel{#XJRD,	;
			"Desempenho",	;
			"Desempenho",	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),0)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Desempenho_Desempenho_ID,	;
		HyperLabel{#XJRD,	;
			"Desempenho",	;
			"Desempenho",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Desempenho_Apurar_Anual_ID,	;
		HyperLabel{#XANUAL,	;
			"Apurar Anual",	;
			"Apurar Anual",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_ID,	;
		HyperLabel{#Arquivo_Tempo_Produtos_Apurados,	;
			"Tempo Produtos Apurados",	;
			"Tempo Produtos Apurados",	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),1)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Atual_ID,	;
		HyperLabel{#XJRDT,	;
			"Atual",	;
			"Atual",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixados_ID,	;
		HyperLabel{#XJRDTBX,	;
			"Baixados",	;
			"Baixados",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixar_ID,	;
		HyperLabel{#Arquivo_Tempo_Produtos_Apurados_Baixar,	;
			"Baixar",	;
			"Baixar",	;
			,},SELF:GetSubMenu(SELF:GetSubMenu(SELF:Handle( ),0),1),2)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixar_Um_Produto_ID,	;
		HyperLabel{#XRDTCOD,	;
			"Um Produto",	;
			"Um Produto",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixar_Uma_Operação_ID,	;
		HyperLabel{#XJBXSEQ,	;
			"Uma Operação",	;
			"Uma Operação",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixar_Uma_Competencia_ID,	;
		HyperLabel{#XJBXCOM,	;
			"Uma Competencia",	;
			"Uma Competencia",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixar_Produtos_Não_Ativos_ID,	;
		HyperLabel{#XJBXNAO,	;
			"Produtos Não Ativos",	;
			"Produtos Não Ativos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Baixar_Seq_Obsoletas_ID,	;
		HyperLabel{#XJBXOBS,	;
			"Seq Obsoletas",	;
			"Seq Obsoletas",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Retornar_ID,	;
		HyperLabel{#Arquivo_Tempo_Produtos_Apurados_Retornar,	;
			"Retornar",	;
			"Retornar",	;
			,},SELF:GetSubMenu(SELF:GetSubMenu(SELF:Handle( ),0),1),3)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Retornar_Um_Produto_ID,	;
		HyperLabel{#XJRTCOD,	;
			"Um Produto",	;
			"Um Produto",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Retornar_Uma_Operação_ID,	;
		HyperLabel{#XJRTSEQ,	;
			"Uma Operação",	;
			"Uma Operação",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Tempo_Produtos_Apurados_Retornar_Uma_Competência_ID,	;
		HyperLabel{#XJRTCOM,	;
			"Uma Competência",	;
			"Uma Competência",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Importar_Processo_ID,	;
		HyperLabel{#XIMPPF,	;
			"Importar Processo",	;
			"Importar Processo",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_IAC__Indice_de_Atendimentos_Cliente_ID,	;
		HyperLabel{#Arquivo_IAC__Indice_de_Atendimentos_Cliente,	;
			"IAC - Indice de Atendimentos Cliente",	;
			,	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),3)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_IAC__Indice_de_Atendimentos_Cliente_Apuracao_Importacao_ID,	;
		HyperLabel{#XJIACSEQ,	;
			"Apuracao Importacao",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_IAC__Indice_de_Atendimentos_Cliente_Consulta_Competencia_ID,	;
		HyperLabel{#XJIACMES,	;
			"Consulta Competencia",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_IAC__Indice_de_Atendimentos_Cliente_Cliente_Grupof2Lx_ID,	;
		HyperLabel{#XJANCLI,	;
			"Cliente Grupo/Lx",	;
			,	;
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
			"&Sair	ALT+F4",	;
			"Encerrar a Aplicação",	;
			"File_Exit"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_ID,	;
		HyperLabel{#_Relatorios,	;
			"&Relatorios",	;
			"Relatorios",	;
			,},SELF:Handle( ),1)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Funcionários_ID,	;
		HyperLabel{#XSUBOP,	;
			"Funcionários",	;
			"Funcionários",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Equipamentos_ID,	;
		HyperLabel{#XSUBEQ,	;
			"Equipamentos",	;
			"Equipamentos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Paradas_ID,	;
		HyperLabel{#XSUBPA,	;
			"Paradas",	;
			"Paradas",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Produtos_ID,	;
		HyperLabel{#XSUBPR,	;
			"Produtos",	;
			"Produtos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Comparativosf2Outros_ID,	;
		HyperLabel{#XSUBOU,	;
			"Comparativos/Outros",	;
			"Comparativos/Outros",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_Producao_ID,	;
		HyperLabel{#XIMPPR,	;
			"WRPT Producao",	;
			"WRPT Producao",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_IAC_ID,	;
		HyperLabel{#XIMPIAC,	;
			"WRPT IAC",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID,	;
		HyperLabel{#XWRPT,	;
			"WRPT",	;
			"WRPT",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrados_ID,	;
		HyperLabel{#XWRPTI,	;
			"WRPT Integrados",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_lstview_logix_ID,	;
		HyperLabel{#lstview,	;
			"lstview logix",	;
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

	SELF:PostInit()
	RETURN SELF
END CLASS
CLASS EMPTYSHELLMENU_Accelerator INHERIT Accelerator
 
CONSTRUCTOR( ) 
	SUPER(ResourceID{IDA_EMPTYSHELLMENU, _GetInst( )})
	RETURN SELF
END CLASS
