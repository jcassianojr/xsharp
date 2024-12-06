[STAThread];
FUNCTION Start() AS INT
	LOCAL oXApp AS XAPP
	TRY
		oXApp := XAPP{}
		oXApp:Start()
	CATCH oException AS Exception
		ErrorDialog(oException)
	END TRY
RETURN 0

CLASS XAPP INHERIT App
METHOD Start() 
  LOCAL oMainWindow AS BasicShellWindow

  // oMainWindow := BasicShellWindow{}
  oMainWindow := DemoShellWindow{}		// Neu
  oMainWindow:Show(SHOWCENTERED)

  oMainWindow:FileNew()					// Neu

  SELF:Exec()



END CLASS
