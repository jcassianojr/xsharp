#region DEFINES
STATIC DEFINE DTAPREVIEW_VO_PREVIEW := 100 
#endregion

CLASS DtaPreview INHERIT DtaPreview_vo

	PROTECT oOwner		AS Window			// Owner-Window (nicht oParent !)
	PROTECT oPrinter 	AS BL_Printer
	PROTECT cTitle	 	AS STRING
	PROTECT nPage	 	AS INT
	PROTECT symPageChangedMethod AS SYMBOL	// Methode des Owners, um auf einen Seitenwechsel zu reagieren
	PROTECT	lInit		AS LOGIC
	

METHOD BtnClose( ) 

	SELF:EndWindow()

METHOD Close(oEvent) 
	SUPER:Close(oEvent)
	//Put your changes here
	SELF:oPrinter:PreviewActive := FALSE
	RETURN NIL


METHOD CreateContextZoomMenu(oOwner) 
	
	LOCAL oContextMenu	AS BL_PrinterMenu
	LOCAL hContextMenu	AS PTR      		// Handle des Menüs
	LOCAL hMainMenu		AS PTR
	LOCAL aItems 		AS ARRAY
	LOCAL i 			AS INT
	LOCAL nItems		AS INT
	LOCAL nID			AS INT
	LOCAL pszBuffer		AS PSZ
	LOCAL nMaxLength 	AS INT
	LOCAL oPrinterMenu	AS BL_PrinterMenu
	
	
	// Context-Menü erstellen
	oContextMenu := MenuPreviewContext{}
	hContextMenu := GetSubMenu(oContextMenu:Handle(), 0)
	
	// Array mit allen Menüeinträgen des Context-Menüs
	aItems := oContextMenu:Items
	
	// Die Registrierung aller Hyperlabel des alten Context-Menüs aufheben
	FOR i := ALen(aItems) DOWNTO 1
		oContextMenu:UnregisterItem(aItems[i,1])
	NEXT i
	
	// Alle Einträge Context-Menüs löschen
	nItems := GetMenuItemCount(hContextMenu)
	FOR i := 1 TO nItems
		DeleteMenu(hContextMenu, 0, MF_BYPOSITION)
	NEXT i

	// Array mit allen Menüeinträgen des Hauptmenüs
	// aItems := SELF:oMenu:Items
	oPrinterMenu := SELF:Menu		// Ist dieses Casting erlaubt ???
	aItems := oPrinterMenu:Items
	
	// Einträge des ZOOM-Menüs zum Context-Menü hinzufügen
	hMainMenu := GetSubMenu(oPrinterMenu:Handle(), oPrinterMenu:GetSubMenuPos("Zoom"))
	IF IsMenu(hMainMenu)
		nMaxLength	:= 256
		pszBuffer  	:= MemAlloc(nMaxLength + 1)
		nItems 		:= GetMenuItemCount(hMainMenu)
		FOR i := 0 TO nItems - 1
			nID := GetMenuItemID(hMainMenu, i)
			IF nID > 0
				GetMenuString(hMainMenu, i, pszBuffer, nMaxLength, MF_BYPOSITION)			
				AppendMenu(hContextMenu, 0, nID, pszBuffer)
			ELSE
				AppendMenu(hContextMenu, MF_SEPARATOR, 0, NULL_PSZ)
			ENDIF
		NEXT i
	    MemFree(pszBuffer)
	ENDIF
	
	// Die Hyperlabel des Context-Menüs registrieren, damit die Menu-ID's funktionieren
	FOR i := 1 TO ALen(aItems)
		IF Upper(Left(Symbol2String(aItems[i,2]:nameSym),4)) == "ZOOM"
			oContextMenu:RegisterItem(aItems[i,1], aItems[i,2])
		ENDIF
	NEXT i

	RETURN oContextMenu
	

METHOD FirstPage() 
	
	IF nPage > 1
		nPage := 1
		SELF:UpdatePage()
	ENDIF


CONSTRUCTOR(oWindow, oPrinter, nPage, oMenu, cCaption, lStyleWord, symZoom, oShell) 

	Default(@nPage, 1)
	Default(@cCaption, "Preview - Page ")
	Default(@lStyleWord, TRUE)
	//Default(@oShell, GetShell(oWindow))

	SELF:oOwner					:= oWindow
	SELF:oPrinter 				:= oPrinter
	SELF:nPage    				:= nPage
	SELF:symPageChangedMethod 	:= #BL_PrinterPageChanged
	SELF:lInit					:= TRUE

	SUPER(oShell)

	IF IsInstanceOfUsual(oShell, #ShellWindow)
		SetWindowLong(SELF:oFormFrame:Handle(), GWL_EXSTYLE, 0)		// keine Ränder
		WinRepaint(SELF)                                            // Resize erzwingen
	ENDIF

	IF IsNil(oMenu)
		IF oPrinter:German
			Default(@oMenu, MenuPreviewGe{})
		ELSE
			Default(@oMenu, MenuPreview{})
		ENDIF
	ENDIF
	
	SELF:Menu := oMenu
	SELF:oDCPreview:ContextMenu := SELF:CreateContextZoomMenu()
	SELF:oDCPreview:StyleWord   := lStyleWord
	
	SELF:cTitle := cCaption
	SELF:UpdatePage(FALSE)
	IF !IsNil(symZoom)
		SELF:oDCPreview:Zoom(symZoom, Point{0,0})
	ENDIF
	oPrinter:PreviewActive := TRUE
	
	RETURN SELF


METHOD LastPage() 
	
	IF nPage < ALen(oPrinter:Pages)
		nPage := ALen(oPrinter:Pages)
		SELF:UpdatePage()
	ENDIF
	

ACCESS Menu 
	RETURN SELF:oMenu


METHOD MenuCommand(oMenuCommandEvent) 
	
	LOCAL 	oE 		AS MenuCommandEvent
	LOCAL	nID		AS INT

	
	oE := oMenuCommandEvent
	SUPER:MenuCommand(oMenuCommandEvent)
	
	//Put your changes here
	IF Upper(Left(Symbol2String(oE:NameSym),4)) == "ZOOM"
		SELF:oDCPreview:Zoom(oE:NameSym)
	ENDIF

	// Toggle "Zoom in/out"
	IF oE:NameSym == #InOutZoom
		SELF:oDCPreview:StyleWord := !SELF:oDCPreview:StyleWord
		nID := PrinterMenuGetID(SELF:Menu, #InOutZoom)
		IF SELF:oDCPreview:StyleWord
			SELF:Menu:CheckItem(nID)
			SELF:Toolbar:ClickItem(nID)
		ELSE
			SELF:Menu:UncheckItem(nID)
			SELF:Toolbar:UnclickItem(nID)
		ENDIF
	ENDIF
	
	RETURN NIL


METHOD MenuInit(oMenuInitEvent) 
	
	LOCAL oE 			AS MenuInitEvent
	LOCAL i 			AS INT
	LOCAL aItems 		AS ARRAY
	LOCAL symZoomName 	AS SYMBOL
	LOCAL hMenu			AS PTR
	LOCAL oPrinterMenu	AS BL_PrinterMenu
	
	oE := oMenuInitEvent
	SUPER:MenuInit(oMenuInitEvent)
	
	IF oE:Menu == NULL_OBJECT  .or. !IsInstanceOf(oE:Menu, #BL_PrinterMenu)
		// MessageBox(0, AsPsz("Menü: " + AsString(ClassName(oE:Menu))), AsPsz("Info"), 0)
		RETURN NIL
	ENDIF
	oPrinterMenu := BL_PrinterMenu{}//oE:Menu

	DO CASE
	CASE oE:Message == WM_INITMENU 				// 0x0116 = 278
		// Message beim Aktivieren des Menüs

		// Check the actual Zoom in the Zoom-Menu and uncheck the other
		aItems := oPrinterMenu:Items
		symZoomName := SELF:oDCPreview:ZoomName	
		hMenu := GetSubMenu(oPrinterMenu:Handle(), oPrinterMenu:GetSubMenuPos("Zoom"))
		IF IsMenu(hMenu)
			FOR i := 1 TO ALen(aItems)
				IF Upper(Left(Symbol2String(aItems[i,2]:nameSym),4)) == "ZOOM"
					IF symZoomName == aItems[i,2]:nameSym
						// oMenu:CheckItem(aItems[i,1])
						CheckMenuItem(hMenu, aItems[i,1], MFS_CHECKED + MF_BYCOMMAND)
					ELSE
						// oMenu:UnCheckItem(aItems[i,1])
						CheckMenuItem(hMenu, aItems[i,1], MFS_UNCHECKED + MF_BYCOMMAND)
					ENDIF
				ENDIF
			NEXT i
		ELSE
			// MessageBox(0, AsPsz("Kein Zoom-Menü in: " + AsString(ClassName(oE:Menu))), AsPsz("Info"), 0)
		ENDIF
	
	CASE oE:Message == WM_INITMENUPOPUP       	// 0x0117 = 279
		// Message beim Aktivieren eines Sub-Menüs
		// keine Aktion erforderlich
	ENDCASE

	RETURN NIL


METHOD NextPage() 
	
	IF nPage < ALen(oPrinter:Pages)
		nPage := nPage + 1
		SELF:UpdatePage()
	ENDIF
	

ACCESS Page 
	RETURN SELF:nPage
	

METHOD PreviousPage() 
	
	IF nPage > 1
		nPage := nPage - 1
		SELF:UpdatePage()
	ENDIF


METHOD PrintAll() 
	
	oPrinter:Print()
	

ACCESS Printer 
	RETURN SELF:oPrinter
	

METHOD PrintPage() 
	
	oPrinter:PrintPage(SELF:nPage)
	

METHOD Resize(oResizeEvent) 
	
	LOCAL	oE AS ResizeEvent
	LOCAL	oObj AS OBJECT
	LOCAL	oForm AS OBJECT

	oE := oResizeEvent
	
	SUPER:Resize(oResizeEvent)
	//Put your changes here
	
	// LockWindowUpdate( SELF:Handle() )
	IF SELF:oDCPreview != NULL_OBJECT
		oObj := SELF:oDCPreview
		// oObj:Size := Dimension{oE:Width, oE:Height}
		oForm := SELF:oFormFrame		// Child-Toolbar wird berücksichtigt
		IF oForm != NULL_OBJECT
			// oObj:Size := oForm:Size
			IF IsInstanceOfUsual(SELF:oParent, #ShellWindow)
				oObj:Size := Dimension{oForm:Size:Width, oForm:Size:Height}
			ELSE
				oObj:Size := Dimension{oForm:Size:Width - 2, oForm:Size:Height - 2}
			ENDIF
			oObj:Origin := Point{0, 0}
		ENDIF
	ENDIF

	// LockWindowUpdate( NULL_PTR )
	RETURN NIL



METHOD SetPageChangedMethod(symMethod) 
	
	IF IsSymbol(symMethod)
		SELF:symPageChangedMethod := symMethod
	ENDIF
	
	RETURN SELF:symPageChangedMethod


METHOD Show(kShowState) 

	SUPER:Show(kShowState)

	IF lInit
		SELF:oFormFrame:ResetMinSize()								// Automatische Scrollbars deaktivieren
	
		IF SELF:oDCPreview:StyleWord
			SELF:Menu:CheckItem(PrinterMenuGetID(SELF:Menu, #InOutZoom))
			SELF:Toolbar:ClickItem(PrinterMenuGetID(SELF:Menu, #InOutZoom))
		ENDIF
	
	    SELF:UpdateMenu()       // Ergänzung für VO25
	ENDIF


METHOD UpdateMenu() 
	
	SELF:Menu:EnableItem(PrinterMenuGetID(SELF:Menu, #FirstPage))
	SELF:Menu:EnableItem(PrinterMenuGetID(SELF:Menu, #PreviousPage))
	SELF:Menu:EnableItem(PrinterMenuGetID(SELF:Menu, #NextPage))
	SELF:Menu:EnableItem(PrinterMenuGetID(SELF:Menu, #LastPage))
	
	IF nPage <= 1
		SELF:Menu:DisableItem(PrinterMenuGetID(SELF:Menu, #FirstPage))
		SELF:Menu:DisableItem(PrinterMenuGetID(SELF:Menu, #PreviousPage))
	ENDIF

	IF nPage >= ALen(oPrinter:Pages)
		SELF:Menu:DisableItem(PrinterMenuGetID(SELF:Menu, #NextPage))
		SELF:Menu:DisableItem(PrinterMenuGetID(SELF:Menu, #LastPage))
	ENDIF
	
	RETURN NIL

METHOD UpdatePage(lRedraw) 

	Default(@lRedraw, TRUE)
	SELF:UpdateMenu()
	oPrinter:CheckPage(nPage)
	
	IF lRedraw
		InvalidateRect(SELF:oDCPreview:Handle(), NULL, FALSE)
		
		// oPrinter:Owner benachrichtigen
		IF IsMethod(oPrinter:Owner, SELF:symPageChangedMethod)
			// BL_PrinterPageChangedEvent zum Owner schicken
			Send( oPrinter:Owner, SELF:symPageChangedMethod, ;
				  BL_PrinterPageEvent{oPrinter:Owner:Handle(), ;
									  0, 0L, 0L, SELF, nPage} )
		ENDIF
	ENDIF

	SELF:Caption := SELF:cTitle + NTrim(nPage) + "/" + NTrim(ALen(oPrinter:Pages))

	RETURN NIL
	

END CLASS
CLASS DtaPreview_vo INHERIT DATAWINDOW 

	PROTECT oDCPreview AS CCPREVIEW

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"DtaPreview_vo",_GetInst()},iCtlID)

oDCPreview := CcPreview{SELF,ResourceID{DTAPREVIEW_VO_PREVIEW,_GetInst()}}
oDCPreview:HyperLabel := HyperLabel{#Preview,NULL_STRING,NULL_STRING,NULL_STRING}

SELF:Caption := "DataWindow Caption"
SELF:HyperLabel := HyperLabel{#DtaPreview_vo,"DataWindow Caption",NULL_STRING,NULL_STRING}

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


END CLASS
