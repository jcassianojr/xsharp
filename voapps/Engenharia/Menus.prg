#region DEFINES
DEFINE IDA_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU := "EMPTYSHELLMENU"
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID := 28547
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Normas_ID := 28543
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Normas_Normas_ID := 28544
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Normas_Tipos_ID := 28545
DEFINE IDM_EMPTYSHELLMENU_Arquivo_ID := 28542
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID := 28546
DEFINE IDM_EMPTYSHELLMENU_Arquivo_Sair_ID := 28549
DEFINE IDM_EMPTYSHELLMENU_f3_Atualização_ID := 28565
DEFINE IDM_EMPTYSHELLMENU_f3_ID := 28561
DEFINE IDM_EMPTYSHELLMENU_f3_Indice_ID := 28562
DEFINE IDM_EMPTYSHELLMENU_f3_Sobre_ID := 32031
DEFINE IDM_EMPTYSHELLMENU_f3_Usando_a_Ajuda_ID := 28563
DEFINE IDM_EMPTYSHELLMENU_Relatorios_ID := 28550
DEFINE IDM_EMPTYSHELLMENU_Relatorios_lstview_logix_ID := 28554
DEFINE IDM_EMPTYSHELLMENU_Relatorios_Relatorios_Engenharia_ID := 28551
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID := 28552
DEFINE IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID := 28553
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID := 28560
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Configuracao_ID := 28559
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID := 28557
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID := 28558
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_Email_ID := 28556
DEFINE IDM_EMPTYSHELLMENU_Utilitarios_ID := 28555
#endregion

CLASS EMPTYSHELLMENU INHERIT Menu

// User code starts here (DO NOT remove this line)  ##USER##
CONSTRUCTOR( oOwner )

	SELF:PreInit()

	SUPER( ResourceID { "EMPTYSHELLMENU" , _GetInst( ) } )

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_ID, ;
		HyperLabel{ #File , "&Arquivo" , "Opções de Arquivo" , "File" } , SELF:Handle() , 0)

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Normas_ID, ;
		HyperLabel{ #JLC , "Controle de Normas" , "Controle de Normas" ,  } , GetSubMenu( SELF:Handle() , 0 ) , 0)

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Normas_Normas_ID, ;
		HyperLabel{ #XJLC , "Normas" , "Normas" ,  })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Controle_de_Normas_Tipos_ID, ;
		HyperLabel{ #XJLCT , "Tipos" , "Tipos" ,  })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Indexar_ID, ;
		HyperLabel{ #XINDEXAR , "Indexar" , "Indexar" ,  })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Configurar_Impressora__ID, ;
		HyperLabel{ #FilePrinterSetup , "C&onfigurar Impressora .." , "Configurar as Opções da Impressora" , "File_Printer_Setup" })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Arquivo_Sair_ID, ;
		HyperLabel{ #FileExit , "&Sair	Alt+F4" , "Encerrar a Aplicação" , "File_Exit" })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_ID, ;
		HyperLabel{ #XWRPTEN , "&Relatorios" , "Relatorios" ,  } , SELF:Handle() , 1)

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_Relatorios_Engenharia_ID, ;
		HyperLabel{ #XWRPTEN , "Relatorios Engenharia" , "Relatorios Engenharia" ,  })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_ID, ;
		HyperLabel{ #XWRPT , "WRPT" , "Relatorios Geral" ,  })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_WRPT_Integrado_ID, ;
		HyperLabel{ #XWRPTI , "WRPT Integrado" ,  ,  })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Relatorios_lstview_logix_ID, ;
		HyperLabel{ #lstview , "lstview logix" ,  ,  })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_ID, ;
		HyperLabel{ #Utilitarios , "Utilitarios" , "Utilitarios" ,  } , SELF:Handle() , 2)

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_ID, ;
		HyperLabel{ #Utilitarios_Email , "Email" , "Email" ,  } , GetSubMenu( SELF:Handle() , 2 ) , 0)

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Consulta_ID, ;
		HyperLabel{ #XJMAIL , "Consulta" , "Consulta Mensagens" ,  })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Geral_ID, ;
		HyperLabel{ #XJMAILGER , "Geral" , "Consulta Geral" ,  })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Email_Configuracao_ID, ;
		HyperLabel{ #XJMAILCFG , "Configuracao" , "Configuracao Mensagens" ,  })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU_Utilitarios_Checar_CGCf2CPFf2IE_ID, ;
		HyperLabel{ #JCHECK , "Checar CGC/CPF/IE..." , "Checar CGC/CPF/IE..." ,  })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU__f3_ID, ;
		HyperLabel{ #Help , "&?" , "Ajuda" ,  } , SELF:Handle() , 3)

	SELF:RegisterItem(IDM_EMPTYSHELLMENU__f3_Indice_ID, ;
		HyperLabel{ #HelpIndex , "&Indice	F1" , "Índice da Ajuda" , "Help_Index" })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU__f3_Usando_a_Ajuda_ID, ;
		HyperLabel{ #HelpUsingHelp , "&Usando a Ajuda" , "Como usar a Ajuda" , "Help_UsingHelp" })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU__f3_Atualização_ID, ;
		HyperLabel{ #XVERSAO , "Atualização" , "Atualizacao" ,  })

	SELF:RegisterItem(IDM_EMPTYSHELLMENU__f3_Sobre_ID, ;
		HyperLabel{ #HelpAboutDialog , "&Sobre..." , "Sobre a Aplicação" ,  })

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
DEFINE IDM_EMPTYSHELLMENU__f3_ID := 28561
DEFINE IDM_EMPTYSHELLMENU__f3_Indice_ID := 28562
DEFINE IDM_EMPTYSHELLMENU__f3_Usando_a_Ajuda_ID := 28563
DEFINE IDM_EMPTYSHELLMENU__f3_Atualização_ID := 28565
DEFINE IDM_EMPTYSHELLMENU__f3_Sobre_ID := 32031
