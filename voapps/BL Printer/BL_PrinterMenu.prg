CLASS BL_PrinterMenu INHERIT Menu
	

// constructor inserted by xPorter, remove superfluous arguments
CONSTRUCTOR(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9) CLIPPER
SUPER(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
METHOD GetSubMenuPos(cCaption) 
	
	// ========================================================================
	//  Zerobased Position eines Submenüs ermitteln
	// ------------------------------------------------------------------------
	//	Rückgabe:	Menüposition (0 ... n), wenn gefunden
	//				-1	, sonst
	// ========================================================================
	
	
	LOCAL	nPos		AS INT		// Position des SubMenüs
	LOCAL	pszBuffer	AS PSZ
	LOCAL	nMaxLength 	AS INT
	LOCAL	nItems		AS INT		// Anzahl der Items
	LOCAL	i			AS INT
	
	// hMenu := GetMenu(SELF:Menu:Handle(), SELF:nFilterMenuePos)
	
	nMaxLength	:= 256
	pszBuffer  	:= MemAlloc(nMaxLength + 1)
	
	nPos   := 0
	nItems := GetMenuItemCount(SELF:Handle())
	FOR i := 0 TO (nItems - 1)
		IF 0 < GetMenuString(SELF:Handle(), i, pszBuffer, nMaxLength, MF_BYPOSITION)
			IF Upper(cCaption) == Upper(StrTran(pszBuffer, "&"))
				nPos := i
				EXIT
			ENDIF
		ENDIF
	NEXT i
	
    MemFree(pszBuffer)

	RETURN nPos

ACCESS Items 
	// Zugriff auf das Protect-Array aItem mit { { nID, oHyperLabel }, ... }
	RETURN SELF:aItem


METHOD PostInit() 
	
	IF SELF:ToolBar != NULL_OBJECT  .and. !SELF:ToolBar:__IsRebar
		// Trennlinie (Divider) entfernen
		// SELF:Toolbar:SetStyle(CCS_NODIVIDER)		// Die Höhe der Toolbar wird kleiner
		SELF:Toolbar:EnableBands(TRUE)
	ENDIF
	

METHOD UpdateItem(nItemID, xNewItem) 
	
  	LOCAL lRetVal 	AS LOGIC
  	LOCAL n			AS INT

  	IF IsNumeric(nItemID)
      	IF IsInstanceOfUsual(xNewItem, #HyperLabel)
        	lRetVal := ModifyMenu(hMenu, nItemID, MF_BYCOMMAND, nItemID, Cast2Psz(xNewItem:Caption))
        	n := AScan(aItem, {|x| x[1] == nItemID})
        	IF n > 0
	        	aItem[n,2] := xNewItem
	        ENDIF
      	ELSEIF IsString(xNewItem)
        	lRetVal := ModifyMenu(hMenu, nItemID, MF_BYCOMMAND, nItemID, Cast2Psz(xNewItem))
  		ELSEIF IsInstanceOfUsual(xNewItem, #Bitmap)
       		lRetVal := ModifyMenu(hMenu, nItemID, MF_BYCOMMAND, nItemID, xNewItem:Handle())
      	ENDIF
  	ENDIF

  	RETURN lRetVal


END CLASS
FUNCTION PrinterMenuGetID (oPrinterMenu AS BL_PrinterMenu, symEventName AS SYMBOL) AS DWORD

	// Ermittelt aus dem symbolischen EventName einer Option die numerische ID
	
	LOCAL nPos, nID AS DWORD
	LOCAL aItems AS ARRAY

	aItems := oPrinterMenu:Items
	nPos := AScan( aItems, {|a| a[2]:nameSym == symEventName} )
	
	IF nPos > 0
		nID := aItems[nPos, 1]
	ENDIF
	
	RETURN nID
	


