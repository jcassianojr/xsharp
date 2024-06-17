#region DEFINES
DEFINE IDA_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU_Arquivo_ACD__Lançamentos_de_Dados_ID := 21786
DEFINE IDM_EMPTYSHELLMENU_Arquivo_ACP__Analise_Cap_Potencial_ID := 21783
DEFINE IDM_EMPTYSHELLMENU_Arquivo_AEP__Analise_Estabilidade_de_Processo_ID := 21784
DEFINE IDM_EMPTYSHELLMENU_Arquivo_CI__Certificado_de_Inspeção_Certificado_de_Inspeção_ID := 21796
DEFINE IDM_EMPTYSHELLMENU_Arquivo_CI__Certificado_de_Inspeção_ID := 21795
DEFINE IDM_EMPTYSHELLMENU_Arquivo_CI__Certificado_de_Inspeção_Importar_Cadastro_de_Produtos_ID := 21798
DEFINE IDM_EMPTYSHELLMENU_Arquivo_CI__Certificado_de_Inspeção_Pré_Lançamento_Certificado_ID := 21797
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID := 21807
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Escolher_Ano_de_Trabalho_ID := 21803
DEFINE IDM_EMPTYSHELLMENU_Arquivo_GC__Grafico_de_Controle_Carta_Temperatura_Umidade_ID := 21801
DEFINE IDM_EMPTYSHELLMENU_Arquivo_GC__Grafico_de_Controle_GC__Grafico_de_Controle_ID := 21800
DEFINE IDM_EMPTYSHELLMENU_Arquivo_GC__Grafico_de_Controle_ID := 21799
DEFINE IDM_EMPTYSHELLMENU_Arquivo_ID := 21779
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Indexar_Arquivos_ID := 21805
DEFINE IDM_EMPTYSHELLMENU_Arquivo_PAC__Plano_de_ação_para_o_CEP_ID := 21785
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Plano_de_Auditoria_de_Embarque_ID := 21788
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Plano_de_Auditoria_de_Embarque_OPAE__Ocorrencia_Embarque_ID := 21789
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Plano_de_Auditoria_de_Embarque_PAEE__Ocorrencias_Externas_ID := 21791
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Plano_de_Auditoria_de_Embarque_PAEI__Especificações_ID := 21790
DEFINE IDM_EMPTYSHELLMENU_Arquivo_RI__Relatório_de_Inspeçaof2Medição_ID := 21792
DEFINE IDM_EMPTYSHELLMENU_Arquivo_RI__Relatório_de_Inspeçaof2Medição_RI__Mes_Ano_Fechados_ID := 21794
DEFINE IDM_EMPTYSHELLMENU_Arquivo_RI__Relatório_de_Inspeçaof2Medição_RI__Relatório_de_Inspeçaof2Medição_ID := 21793
DEFINE IDM_EMPTYSHELLMENU_Arquivo_RRL__Repetibilidade_Longo_ID := 21781
DEFINE IDM_EMPTYSHELLMENU_Arquivo_RRM__Repetibilidade_Instrumentos_ID := 21782
DEFINE IDM_EMPTYSHELLMENU_Arquivo_RRS__Repetibilidade_Simples_ID := 32001
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Sair_ID := 21809
DEFINE IDM_EMPTYSHELLMENU_Arquivo_TEEP__Tabela_de_EstEstaProceso_ID := 21787
DEFINE IDM_EMPTYSHELLMENU_f3_Atualizações_ID := 21835
DEFINE IDM_EMPTYSHELLMENU_f3_Conteudo_ID := 21833
DEFINE IDM_EMPTYSHELLMENU_f3_ID := 21831
DEFINE IDM_EMPTYSHELLMENU_f3_Indice_ID := 21832
DEFINE IDM_EMPTYSHELLMENU_f3_Sobre_ID := 32031
DEFINE IDM_EMPTYSHELLMENU_Relatorios_ACP___Analise_de_Capacidade_Processo_ID := 21812
DEFINE IDM_EMPTYSHELLMENU_Relatorios_AEP_Analise_Estabilidade_de_Processo_ID := 21813
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Certificado_de_Inspeçao_ID := 21819
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Etiquetas_ID := 21823
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Etiquetas_PrePrototype_ID := 21824
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Grafico_de_Controle_ID := 21820
DEFINE IDM_EMPTYSHELLMENU_Relatorios_ID := 21810
DEFINE IDM_EMPTYSHELLMENU_Relatorios_lstview_logix_ID := 21822
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Plano_Ação_Para_o_CEP_ID := 21814
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Plano_de_Auditoria_de_Embarque_ID := 21816
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Produtosf2Produtcao_ID := 21817
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Relatório_de_Inspeçãof2Medição_ID := 21818
DEFINE IDM_EMPTYSHELLMENU_Relatorios_RR__Rebetibilidade_e_Reprodutibilidade_ID := 21811
DEFINE IDM_EMPTYSHELLMENU_Relatorios_TEEP_ID := 21815
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID := 21821
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID := 21830
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Configuração_ID := 21829
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID := 21827
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID := 21828
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_ID := 21826
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_ID := 21825
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
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_RRS__Repetibilidade_Simples_ID,	;
		HyperLabel{#XJRRS,	;
			"RRS - Repetibilidade Simples",	;
			"RRS - Repetibilidade Simples",	;
			"File_Open"})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_RRL__Repetibilidade_Longo_ID,	;
		HyperLabel{#XJRRL,	;
			"RRL - Repetibilidade Longo",	;
			"RRL - Repetibilidade Longo",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_RRM__Repetibilidade_Instrumentos_ID,	;
		HyperLabel{#XJRRM,	;
			"RRM - Repetibilidade Instrumentos",	;
			"RRM - Repetibilidade Instrumentos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_ACP__Analise_Cap_Potencial_ID,	;
		HyperLabel{#XJACP,	;
			"ACP - Analise Cap. Potencial",	;
			"ACP - Analise Cap. Potencial",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_AEP__Analise_Estabilidade_de_Processo_ID,	;
		HyperLabel{#XJAC2,	;
			"AEP - Analise Estabilidade de Processo",	;
			"AEP - Analise Estabilidade de Processo",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_PAC__Plano_de_ação_para_o_CEP_ID,	;
		HyperLabel{#XJPAC,	;
			"PAC - Plano de ação para o CEP",	;
			"PAC - Plano de ação para o CEP",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_ACD__Lançamentos_de_Dados_ID,	;
		HyperLabel{#XJACD,	;
			"ACD - Lançamentos de Dados",	;
			"ACD - Lançamentos de Dados",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_TEEP__Tabela_de_EstEstaProceso_ID,	;
		HyperLabel{#XJTEEP,	;
			"TEEP - Tabela de Est.Esta.Proceso",	;
			"TEEP - Tabela de Est.Esta.Proceso",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Plano_de_Auditoria_de_Embarque_ID,	;
		HyperLabel{#Arquivo_Plano_de_Auditoria_de_Embarque,	;
			"Plano de Auditoria de Embarque",	;
			"Plano de Auditoria de Embarque",	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),8)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Plano_de_Auditoria_de_Embarque_OPAE__Ocorrencia_Embarque_ID,	;
		HyperLabel{#XJOPAE,	;
			"OPAE - Ocorrencia Embarque",	;
			"OPAE - Ocorrencia Embarque",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Plano_de_Auditoria_de_Embarque_PAEI__Especificações_ID,	;
		HyperLabel{#XJPAI,	;
			"PAEI - Especificações",	;
			"PAEI - Especificações",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Plano_de_Auditoria_de_Embarque_PAEE__Ocorrencias_Externas_ID,	;
		HyperLabel{#XJPAEE,	;
			"PAEE - Ocorrencias Externas",	;
			"PAEE - Ocorrencias Externas",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_RI__Relatório_de_Inspeçaof2Medição_ID,	;
		HyperLabel{#Arquivo_RI__Relatório_de_Inspeçaof2Medição,	;
			"RI - Relatório de Inspeçao/Medição",	;
			,	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),9)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_RI__Relatório_de_Inspeçaof2Medição_RI__Relatório_de_Inspeçaof2Medição_ID,	;
		HyperLabel{#XJRI,	;
			"RI - Relatório de Inspeçao/Medição",	;
			"RI - Relatório de Inspeçao/Medição",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_RI__Relatório_de_Inspeçaof2Medição_RI__Mes_Ano_Fechados_ID,	;
		HyperLabel{#XJRIFEC,	;
			"RI - Mes Ano Fechados",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_CI__Certificado_de_Inspeção_ID,	;
		HyperLabel{#Arquivo_CI__Certificado_de_Inspeção,	;
			"CI - Certificado de Inspeção",	;
			"CI - Certificado de Inspeção",	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),10)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_CI__Certificado_de_Inspeção_Certificado_de_Inspeção_ID,	;
		HyperLabel{#XJCI,	;
			"Certificado de Inspeção",	;
			"Certificado de Inspeção",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_CI__Certificado_de_Inspeção_Pré_Lançamento_Certificado_ID,	;
		HyperLabel{#XJCIC,	;
			"Pré Lançamento Certificado",	;
			"Pré Lançamento Certificado",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_CI__Certificado_de_Inspeção_Importar_Cadastro_de_Produtos_ID,	;
		HyperLabel{#XJCICIMP,	;
			"Importar Cadastro de Produtos",	;
			"Importar Cadastro de Produtos",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_GC__Grafico_de_Controle_ID,	;
		HyperLabel{#Arquivo_GC__Grafico_de_Controle,	;
			"GC - Grafico de Controle",	;
			"GC - Grafico de Controle",	;
			,},SELF:GetSubMenu(SELF:Handle( ),0),11)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_GC__Grafico_de_Controle_GC__Grafico_de_Controle_ID,	;
		HyperLabel{#XJGC,	;
			"GC - Grafico de Controle",	;
			"GC - Grafico de Controle",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_GC__Grafico_de_Controle_Carta_Temperatura_Umidade_ID,	;
		HyperLabel{#XJCRTAUM,	;
			"Carta Temperatura Umidade",	;
			"Carta Temperatura Umidade",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Escolher_Ano_de_Trabalho_ID,	;
		HyperLabel{#XDIAANO,	;
			"Escolher Ano de Trabalho",	;
			"Escolher Ano de Trabalho",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Indexar_Arquivos_ID,	;
		HyperLabel{#XINDEXAR,	;
			"Indexar Arquivos",	;
			"Indexar Arquivos",	;
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
		HyperLabel{#_Relatorios,	;
			"&Relatorios",	;
			,	;
			,},SELF:Handle( ),1)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_RR__Rebetibilidade_e_Reprodutibilidade_ID,	;
		HyperLabel{#XWRPTRR,	;
			"RR - Rebetibilidade e Reprodutibilidade",	;
			"RR - Rebetibilidade e Reprodutibilidade",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_ACP___Analise_de_Capacidade_Processo_ID,	;
		HyperLabel{#XWRPTACP,	;
			"ACP -  Analise de Capacidade Processo",	;
			"ACP -  Analise de Capacidade Processo",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_AEP_Analise_Estabilidade_de_Processo_ID,	;
		HyperLabel{#XWRPTAEP,	;
			"AEP -Analise Estabilidade de Processo",	;
			"AEP -Analise Estabilidade de Processo",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Plano_Ação_Para_o_CEP_ID,	;
		HyperLabel{#XWRPTPLC,	;
			"Plano Ação Para o CEP",	;
			"Plano Ação Para o CEP",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_TEEP_ID,	;
		HyperLabel{#XWRPTTEEP,	;
			"TEEP",	;
			"TEEP",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Plano_de_Auditoria_de_Embarque_ID,	;
		HyperLabel{#XWRPTPAE,	;
			"Plano de Auditoria de Embarque",	;
			"Plano de Auditoria de Embarque",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Produtosf2Produtcao_ID,	;
		HyperLabel{#XWRPTOUT,	;
			"Produtos/Produtcao",	;
			"Produtos/Produtcao",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Relatório_de_Inspeçãof2Medição_ID,	;
		HyperLabel{#XWRPTRI,	;
			"Relatório de Inspeção/Medição",	;
			"Relatório de Inspeção/Medição",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Certificado_de_Inspeçao_ID,	;
		HyperLabel{#XWRPTCI,	;
			"Certificado de Inspeçao",	;
			"Certificado de Inspeçao",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Grafico_de_Controle_ID,	;
		HyperLabel{#XWRPTGC,	;
			"Grafico de Controle",	;
			"Grafico de Controle",	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID,	;
		HyperLabel{#XWRPTI,	;
			"WRPT Integrado",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_lstview_logix_ID,	;
		HyperLabel{#lstview,	;
			"lstview logix",	;
			,	;
			,})
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Etiquetas_ID,	;
		HyperLabel{#Relatorios_Etiquetas,	;
			"Etiquetas",	;
			"Etiquetas",	;
			,},SELF:GetSubMenu(SELF:Handle( ),1),12)
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Etiquetas_PrePrototype_ID,	;
		HyperLabel{#xJETQ01,	;
			"Pre-Prototype",	;
			"Pre-Prototype",	;
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
	SELF:RegisterItem(IDM_EMPTYSHELLMENU_f3_Conteudo_ID,	;
		HyperLabel{#HelpCont,	;
			"&Conteudo",	;
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
