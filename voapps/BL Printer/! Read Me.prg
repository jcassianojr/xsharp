/*
TEXTBLOCK _Readme
/-* ======================================================================================
	BL_Printer	: VO-Klasse zum Drucken mit integrierter Seitenvorschau
				  (VO-Version 2.7a)
   --------------------------------------------------------------------------------------
    erstellt von: Bernhard Lehmbrock  (Lehmbrock@t-online.de)
    erstellt am : 08.02.2002						(VO-Version 2.5b3)
    geändert am : 22.02.2002       Version Beta 1
    geändert am : 09.04.2002       Version Beta 2
    geändert am : 02.06.2002       Version Beta 3
    geändert am : 14.06.2002       Version 1
    geändert am : 31.08.2002       Version 1.01
    geändert am : 03.09.2002       Version 1.02
    geändert am : 01.11.2002       Version 1.02+	(Anpassung an VO 2.6)
    geändert am : 15.11.2002       Version 1.02+
    geändert am : 25.12.2002       Version 1.03
    geändert am : 11.04.2003       Version 1.04
    geändert am : 08.08.2003       Version 1.05
    geändert am : 21.08.2003       Version 1.06
    geändert am : 29.10.2003       Version 1.07
    geändert am : 13.05.2004       Version 1.08     (Anpassung an VO 2.7 + Erweiterungen)
    geändert am : 31.05.2004       Version 1.09     (Anpassung an VO 2.7a)
    geändert am : 08.09.2004       Version 1.10
    geändert am : 02.10.2004       Version 1.11
    geändert am : 12.10.2004       Version 1.12
    geändert am : 13.10.2004       Version 1.13     (Anpassung an VO 2.7b)
    geändert am : 18.10.2004       Version 1.14
   --------------------------------------------------------------------------------------
	In die Entwicklung dieser Printerklasse sind folgende Quellen eingeflossen:
	 - CLASS Printer aus dem SDK
	 - CLASS clsPrinter von Joachim Bussmann
	 - Anregungen und Tips von Zygmunt Stasiak
   --------------------------------------------------------------------------------------
	
	Beschreibung:
	-------------
	
	  - Module:
	    -------
	     - ! Read Me        : Programm-Informationen
	     - BL_Func		  	: benötigte Zusatz-Funktionen
	  	 - BL_PreviewCc   	: CustomControl für BL_PreviewDta
	  	 - BL_PreviewDta  	: DataWindow mit der Seitenvorschau
	  	 - BL_PreviewMenu 	: Menü für BL_PreviewDta
	  	 - BL_PreviewMenuGe	: Deutsches Menü für BL_PreviewDta
	  	 - BL_Printer     	: die eigentliche Printer-Klasse
	  	 - BL_Printer Events: Class BL_PrinterPageEvent
	     - BL_PrinterMenu	: Erweiterte Class Menu
	  	 - BL_PrintInfoDlg	: InfoDialog beim Drucken mit Abbruchmöglichkeit
	  	 - BL_Resourcen     : Cursor, die im Programm benutzt werden
	
	  - Module Demo:
	    ------------
	  	 - BasicMenu	  	: Module der Standard-Application "Basic MDI"
	  	 - BasicShell         mit Anpassungen für die Demo
	  	 - DlgInfo
	  	 - Menu German
	  	 - Start
	
	  - Die Druckseiten werden als Enhanced Metafiles erstellt. Diese Metafiles
		ermöglichen eine komfortable Seitenvorschau.
	
	  - Die Größen- und Positionsangaben erfolgen grundsätzlich in 100tel-Millimetern.
		Welche Genauigkeit bei der Ausgabe sichtbar wird, hängt jedoch in erster Linie
		von der verwendeten Druckerauflösung ab.
		
	  - Die Ränder werden bei den Positionsangaben nicht berücksichtigt. Sie werden erst
	  	bei der Seitenvorschau oder beim Drucken mit einbezogen.
	
	  - Seitenvorschau mit Zoomfunktion und Blättern durch mehrere Seiten. Beim Aufruf der
	    Seitenvorschau kann ein anderes Menü, ein anderer Titeltext und der Stil für das
		Mausverhalten übergeben werden. Der Stil für das Mausverhalten kann während der
		Anzeige des Previews jederzeit über das Menü (Toolbar) geändert werden.
	
	  - Drucken von einfachem Text über die Funktion Write() in Verbindung mit NewLine().
        Falls die Standardschrift ("Courier New", 12, fett) nicht verwendet werden soll,
		kann ein Handle auf eine andere Schrift übergeben werden.
		Zu beachten ist: Beim Erzeugen einer neuen Schrift ist die Größeneinheit des
						 Device-Context zu berücksichtigen (siehe: BL_CreateFontHmm()).
		
	  - Die Druckposition kann durch das Setzen des BL_Printer:ExtraPrintOffsets
        beeinflusst werden. Notwendig kann dies sein, wenn fehlerhafte oder unpassende
        Druckertreiber eingesetzt werden müssen.
		Die Seitenvorschau wird durch dieses Offset nicht beeinflusst.
	
	  - Durch Ändern des Flags BL_Printer:ClipPage auf "False" wird die Ausgabe des
        Metafiles auf der Druckseite oder in der Vorschau nicht mehr auf den Druckbereich
        begrenzt.
	
	  - BL_PrinterPageChanged(oBL_PrinterPageEvent) - (Callback-Methode)
        Bei Seitenwechseln im Preview wird ein Event zum Owner geschickt, das mit dieser
        Callback-Methode ausgewertet werden kann.
	
	  - BL_PrinterCreatePage(nPage) - (Callback-Methode)
        Existiert die anzuzeigende Seite nicht (NULL_PTR), wird der Owner mit dieser
        Callback-Methode aufgefordert, die Seite zu erstellen.
	
	  - Neue Seiten können per "AppendPage()" mit einem NULL_PTR initialisiert werden.
	    Für die Anzeige oder den Druck wird der Owner über die Callback-Methode
        BL_PrinterCreatePage(nPage) aufgefordert, diese Seite zu erstellen.
        Diese Funktion ist nützlich, um in großen Datenbeständen zu navigieren.
	
	  - Einschränkungen:
	    ----------------
	     - Die Ränder müssen vor dem Erstellen der Druckseiten festgelegt werden, da sie
	       für die Berechnung der Seitengröße benötigt werden.
	
		 - Die Ränder gelten grundsätzlich für alle Druckseiten.
		
   ======================================================================================
*-/



*/
/*
TEXTBLOCK Version
/-* ======================================================================================
    Fehlt noch:
    -----------
      - Im Zoom-Menü wird der Auswahlhaken manchmal nicht gesetzt, obwohl er im
        Contextmenü erscheint. Das Problem ist bisher nicht reproduzierbar, scheint
        aber mit dem aufrufenden Programm zusammenzuhängen, das dem Preview dieselbe
        Instanz eines Menüs bei verschiedenen Aufrufen übergibt.


    Version 1.14 vom 18.11.2004:
    ----------------------------
      - DtaPreview:Resize() geändert.
      - BL_Printer:Write(): zusätzlicher Parameter nBkMode


    Version 1.13 vom 13.11.2004:
    ----------------------------
      - Anpassung an VO 2.7b:
          - Zugriff auf oMenu in einigen Methoden nur noch über die zugehörigen
            Access- und Assign Mehoden.


    Version 1.12 vom 12.11.2004:
    ----------------------------
      - BL_Func: GetShell() geändert, um besser debuggen zu können.
      - BL_Printer:Preview(): zusätzlicher Parameter oShell
      - BL_PreviewDta:Init(): zusätzlicher Parameter oShell
      - BL_PreviewDta: neue Variable lInit
      - DtaPreview:Resize(): Bug beseitigt

      - BL_Printer:
          - Neues ASSIGN Orientation() erübrigt die Methode Update(), die beim direkten
            Zuweisen der Orientation an das PrintingDevice aufgerufen werden muß.
          - ASSIGN Font entfernt, da hier eventuell alte SchriftPointer gelöscht werden,
            die nicht von dieser Klasse erzeugt wurden.

      - BL_Printer:
          - Zusätzliche Fehlermeldungen in StartPage() und Preview().
          - Neue Methode PrinterInfo() zum Ausgeben von Device- und Seiten-Informationen.


    Version 1.11 vom 02.10.2004:
    ----------------------------
      - DtaPreview:Show(): Patch für VO2.5 aufgenommen.

      - CcPreview:Dispatch(): Bug beseitigt
        Beim gezoomten StyleWord wurde das Contextmenü für die rechte Maustaste nicht
        deaktiviert.

      - Neue Methode BL_Printer:PrintRTF()
        Ein RTF-Dokument kann Seitenweise auf einer Druckseite ausgegeben werden.

      - Geändertes Demoprogramm.


    Version 1.10 vom 08.09.2004:
    ----------------------------
      - Neue Methode Axit():
        Die Methode Destroy() wurde nie aufgerufen, da die Klasse BL_Printer nicht
        beim GarbageCollector registriert wurde.


    Version 1.09 vom 31.05.2004:
    ----------------------------
      - Anpassung an VO 2.7a (keine Änderungen).


    Version 1.08 vom 13.05.2004:
    ----------------------------
      - Anpassung an VO 2.7
          - Alle Ressourcen-Refrenzen von CAVO26 auf CAVO27 geändert!
          - CLASS CurHand wurde schon in "GUI Classes:Hyperlink" definiert. Daher wurden
            die Cursor-Klassen komplett entfernt, da nur die Ressourcen benutzt werden.
          - Um diese Library nach einem Reindex nicht ständig touchen zu müssen, wurde
            auf alle Erweiterungen der Menu-CLASS verzichtet und stattdessen die neue
            Class BL_PrinterMenu eingesetzt.
          - Generell gilt scheinbar:
            Erweiterungen von Standard-Klassen sollten - wenn überhaupt - nur in der
            Application oder Library definiert werden, in der sie auch benutzt werden.

       - Neue Class BL_PrinterMenu, um in der Library auf die Erweiterung der Standard-
         Menu Klasse zu verzichten.

       - Modul DtaPreview:
           - CreateContextZoomMenu() überarbeitet.
           - SetPageChangedMethod(): Neu
             Mit dieser Methode wird eine Methode des Owners festgelegt, die aufgerufen
             wird, wenn ein Seitenwechsel in der Vorschau stattgefunden hat.
             Der Standardname der Methode ist BL_PrinterPageChanged.
           - Resize(): überarbeitet
             Anpassungen für Toolbarlocation TB_CHILD.

       - Modul BL_Printer:
           - Methode Update():
             Vorhandene Druckseiten werden gelöscht, wenn sich das PrintingDevice
             geändert hat.
           - Methode Print():
               - Zusätzliche Parameter nCopies und lSort.
               - Ungültige Seiten werden nicht gedruckt.
           - Methode PrintDialog(): Neu
             Mit dieser Methode kann vor dem Drucken der Drucker, Seiten, Kopien, ...
             ausgewählt werden.
           - Methode PrintSelectedPages(): Neu
             Die über PrintDialog() ausgewählten Seiten werden gedruckt.
           - Methode SetCreatePageMethod(): Neu
             Mit dieser Methode wird eine Methode des Owners festgelegt, die aufgerufen
             wird, wenn eine Druckseite erstellt werden muss. Der Standardname der
             Methode ist BL_PrinterCreatePage.
           - Die Methode EndDoc CLASS Printer wurde gelöscht, um in dieser Library
             keine Erweiterungen von Standardklassen zu haben.
           - Methode CheckPage():
             Zusätzlicher Parameter hDC für CreatePageMethod.
           - Methode WriteTextblock(): Neu
             Ersatz für die Methode WriteLine(), die ab sofort nur noch eine Zeile
             ausgibt.
           - Methode GetTextSize(): Neu
           	 Im Gegensatz zur Methode SizeText(), die ein geöffnetes Metafile
             voraussetzt, benutzt diese Funktion ein temporäres Metafile zur Berechnung
             der Textgröße. Ebenso kann dieser Funktion eine beliebige Schriftart
             übergeben werden.
           - Methode Preview():
             Ein übergebenes Menü muss eine Instance von BL_PrinterMenu sein, sonst wird
             eine Fehlermeldung ausgegeben und der Aufruf des Preview abgebrochen.

       - Neue Class BL_PrintingDevice für Erweiterung des Setup- und Druck-Dialogs.
         Unter NT wird nun auch korrekt der zuletzt ausgewählte Drucker angezeigt.


    Version 1.07 vom 29.09.2003:
    ----------------------------
      - Modul BL_Ressources: Neue Toolbar für Preview-Menü.

      - Deutsches Menü "MenuPreviewGe" eingefügt. Standardmäßig wird bei der
        Initialisierung des Printers das Deutsche Menü aktiviert, wenn nicht
        explizit etwas Anderes gewählt wird.

      - Neue Methoden in BL_Printer:
          - AppendPage(): Neue Seite anhängen, kann auch ein NULL_PTR sein, der
                          bei Bedarf eine Aufforderung an das Owner-Window schickt,
                          damit die Seite erstellt wird.
          - CheckPage() : Prüft, ob das Erstellen der Seite angefordert werden muss
                          über die Callback-Methode BL_PrinterCreatePage(nPage).
          - GetDC()     : Gibt den DeviceContext des geöffneten Metafiles zurück,
                          der eventuell in der Callback-Methode BL_PrinterCreatePage()
                          benötigt wird.
        Durch diese Methoden kann das Preview zum Navigieren in größeren
        Datenbeständen benutzt werden, ohne dass sämtliche Druckseiten im
        Vorwege erstellt werden müssen.

      - CcPreview:
          - Mit ESC kann das Preview geschlossen werden.
          - InitScrollBars(): Bug beseitigt
            si.nPage dürfen keine negativen Werte zugewiesen werden.
          - CcPreview:CalculateSize(): Bug beseitigt
            "Unerklärliche" Ergebnisse von Berechnungen mit Float-Variablen bewirkten,
            dass das Metafile manchmal versetzt zur Papierseite ausgegeben wurde.

      - DtaPreview:
          - MenuItems zum Umblättern werden bei Bedarf deaktiviert.
          - Der Stil "Zoom in/out" (WordStyle) kann jederzeit umgeschaltet werden.
          - Als interner Owner (oParent) für das Preview wird immer ein ShellWindow
            gesucht.
            Der eigentliche Owner (oOwner) ist das aufrufende Fenster, dem
            etwaige Events geschickt werden, und entspricht in der Regel dem
            Owner von BL_Printer.
          - Beim Seitenwechsel wird dem Owner das Event BL_PrinterPageEvent geschickt,
            das dieser über die Callback-Methode BL_PrinterPageChanged(oEvent)
            auswerten kann.
          - Ein Preview mit Scrollbars lässt sich mit den Cursortasten verschieben.

      - BL_PrinterPageEvent zum Benachrichtigen des Owners bei Seitenwechseln
        im Preview. Dazu muss beim Owner die Methode "BL_PrinterPageChanged"
        existieren.


	Version 1.06 vom 21.08.2003:
	----------------------------
      - DtaPreview:UpdatePage(): Neben der aktuellen Seite wird in der Titelzeile auch
        die Gesamtzahl der Seiten angegeben (z.B.: "Seite 2/4".


	Version 1.05 vom 08.08.2003:
	----------------------------
      - BL_Printer:EndPage(): Test, ob Seite geöffnet.
	
	
	Version 1.04 vom 11.04.2003:
	----------------------------
      - BL_Printer:
          - Preview(): Liefert das Preview-Window als Rückgabewert.
          - Der Aufruf SELF:oFormFrame:ResetMinSize() wurde von der Init()-Methode in die
            Show()-Methode verlegt, damit das Fenster eine normale Größe hat, wenn es
            nicht gezoomt ist.

	
	Version 1.03 vom 25.12.2002:
	-----------------------------
      - CcPreview:Resize(): Bug beseitigt, indem InvalidateRect() eingefügt wurde.

	
	Version 1.02+ vom 15.11.2002:
	-----------------------------
      - BL_Printer:DrawText(): Zusätzlicher Parameter für Hintergrundmodus
      - BL_Printer:NewPage(): Der Device-Context wird wie bei StartPage() zurückgegeben.

	
	Version 1.02+ vom 01.11.2002:
	-----------------------------
	  - Anpassung an VO 2.6
	
	
	Version 1.02 vom 03.09.2002:
	----------------------------
	  - CcPreview:PaintPage(): Die Ausgabe des Metafiles wird auf die Papiergröße
	   	beschränkt, wenn lClipPage auf false gesetzt ist.
	
	
	Version 1.01 vom 31.08.2002:
	----------------------------
	  - DtaPreview:PrintAll(): Neue Methode
	
	
	Version 1 vom 14.06.2002:
	-------------------------
	  - Einige Kommentare hinzugefügt.
	
	
    Änderung vom 10.06.2002:
    ------------------------
      - BL_Printer:DrawText(): Breite und Höhe wird bei Bedarf berechnet.
      - BL_Printer:SizeTextblock(): Neue Methode
	
	
    Änderung vom 09.06.2002:
    ------------------------
      - BL_Printer:DrawText() + BL_Printer:WriteText(): Rückgabewert geändert
      - BL_Printer:DrawBitMap(): Neue Methode
      - BL_Printer:WriteLine(): Neue Methode
	
	
    Änderung vom 02.06.2002:
    ------------------------
      - BL_Printer:SizeText(): Neue Methode
	
	
    Änderung vom 26.05.2002:
    ------------------------
      - CcPreview:PointInPage():
		  - zusätzlicher Parameter für Screen coordinates
		  - True nur, wenn Cursor auch im Clientbereich
      - CcPreview:PointInPage(): WM_MOUSEWHEEL wird unterstützt
	
	
    Änderung vom 25.05.2002:
    ------------------------
      - BL_Printer:SetPosition(): Die Übergabe der Parameter ist optional.
      - BL_Printer:DrawBox(): Parameter geändert
      - BL_Printer:DrawText(): Neue Methode
	
	
    Änderung vom 03.05.2002:
    ------------------------
      - Beim Hereinzoomen im Wordstil bleibt die Mausposition erhalten.
	
	
    Änderung vom 01.05.2002:
    ------------------------
      - In der Methode DtaPreview:MenuInit() wird geprüft, ob ein Menü übergeben wird,
        denn aus unerfindlichen Gründen ist dies nicht immer der Fall.
        Falls nicht, wird das Menu nicht initialisiert.
      - In der Methode DtaPreview:Init() wird das Standard-Menü erst nach SUPER:Init()
        erzeugt. Seitdem gibt es auch keine Probleme mehr mit MenuInit().
	
	
    Änderung vom 11.04.2002:
    ------------------------
	  -	In der Methode PaintPage() wurde das Clipping-Rechteck abhängig von der Zoomstufe
	    vergrößert, um Rundungsfehler auszugleichen.
	
	
    Änderung vom 09.04.2002:  (Beta 2)
    ------------------------
	  -	Die Methode SetUp() reicht den Rückgabewert der	gleichnamigen Methode der
		Klasse PrintingDevice durch.
	  - Der Methode PreView() kann ein String für die Caption des Vorschau-Fensters
	    übergeben werden.
	  - Für das Vorschau-Fenster kann zwischen zwei Stilen für das Mausverhalten gewählt
	  	werden: Word-Stil oder Acrobat-Stil.
	  - Es können verschiedene Zoom-Stufen vorgewählt werden.
	  - Ein externes Menü ist nicht auf die Standard-Zoomstufen begrenzt, sondern es
	    können weitere oder andere Stufen angegeben werden. Entscheidend ist, dass das
	    Event mit "Zoom" beginnt und die Prozentzahl unmittelbar folgt (z.B. Zoom65).
	  - Das Contextmenü wird aus dem SubMenü "Zoom" des Hauptmenüs erstellt.
	  - Bei vorhandenen Scrollbars kann abhängig vom Maus-Stil mit der linken oder
		rechten Maustaste der angezeigte Ausschnitt verschoben werden.
	
   ======================================================================================
*-/



*/
