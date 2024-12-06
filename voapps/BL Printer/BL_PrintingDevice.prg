CLASS BL_PrintingDevice INHERIT PrintingDevice
	
	PROTECT nFlags		AS DWORD
	PROTECT nFromPage	AS WORD
	PROTECT nToPage		AS WORD
	PROTECT nMinPage	AS WORD
	PROTECT nMaxPage	AS WORD
	PROTECT nAppCopies	AS WORD
	PROTECT nAppCollate	AS WORD
	PROTECT nPageSelect	AS WORD
	PROTECT oPageRange	AS Range
	

ACCESS AppCopies 
	RETURN SELF:nAppCopies

ACCESS AppSort 
	LOCAL lSort AS LOGIC
	
	IF SELF:nAppCollate == DMCOLLATE_TRUE
		lSort := TRUE
	ELSE
		lSort := FALSE
	ENDIF
	
	RETURN lSort


ACCESS Collate 
// 	VTrace vMethod

	IF (pDevMode != NULL_PTR)
		RETURN pDevMode.dmCollate
	ELSE
		RETURN 0
	ENDIF


ASSIGN Collate(nCollate) 
// 	VTrace VMethod

	IF (pDevMode == NULL_PTR)
		RETURN 0
	ENDIF

	pDevMode.dmCollate := nCollate
	SELF:UpdateDevMode()

	RETURN nCollate


ACCESS Flags 
	RETURN SELF:nFlags

ASSIGN Flags(uValue) 
	SELF:nFlags := uValue
	RETURN SELF:nFlags

ACCESS FromPage 
	RETURN SELF:nFromPage

ASSIGN FromPage(uValue) 
	SELF:nFromPage := uValue
	RETURN SELF:nFromPage

CONSTRUCTOR(uName) 

	SUPER(uName)

	SELF:Copies	 	 := 1
	SELF:Collate 	 := DMCOLLATE_TRUE

	SELF:nFlags  	 := 0
	SELF:nFromPage   := 0
	SELF:nToPage  	 := 0
	SELF:nMinPage  	 := 1
	SELF:nMaxPage  	 := 65535
	SELF:nAppCopies  := 1
	SELF:nAppCollate := DMCOLLATE_FALSE
	SELF:nPageSelect := PD_ALLPAGES   		// oder PD_PAGENUMS
	SELF:oPageRange  := Range{0,0}

	RETURN SELF


ACCESS MaxPage 
	RETURN SELF:nMaxPage

ASSIGN MaxPage(uValue) 
	SELF:nMaxPage := uValue
	RETURN SELF:nMaxPage

ACCESS MinPage 
	RETURN SELF:nMinPage

ASSIGN MinPage(uValue) 
	SELF:nMinPage := uValue
	RETURN SELF:nMinPage

ACCESS PageRange 
	RETURN SELF:oPageRange


METHOD PrintDialog(nAktPage, nFlags) 
	
	// ========================================================================
	//	Diese Methode stammt im Wesentlichen aus dem SDK
	// ------------------------------------------------------------------------
	//	Änderung: Die Struktur DEVNAMES wird ebenfalls übergeben, damit der
	//	          aktuelle Drucker im PrintDialog richtig angezeigt wird.
	// ========================================================================
	
	LOCAL pd IS _WinPrintDlg
	LOCAL struDevN AS _windevNames
	LOCAL lRetVal AS LOGIC
	LOCAL ptrHandle AS PTR
	LOCAL ptrString AS PTR
	LOCAL hDevMode AS PTR
	LOCAL pTemp AS PTR
	LOCAL pDVTemp AS _winDEVMODE
	LOCAL hDevNames AS PTR
	LOCAL nLen AS INT
	LOCAL pPsz AS PSZ


// 	VTrace VMethod
	
	Default(@nAktPage, 0)
	Default(@nFlags, _Or(PD_USEDEVMODECOPIES, PD_COLLATE, PD_NOSELECTION))

	SELF:Flags 	  := nFlags
	IF nAktPage > 0
		nFromPage := nAktPage
	ENDIF
	
	ptrHandle := GetActiveWindow()
	lRetVal := TRUE
	pd.lStructSize := _sizeof(_winPRINTDLG)

	IF (ptrHandle != NULL_PTR)
		pd.hwndOwner := ptrHandle
	ELSE
		pd.hwndOwner := NULL_PTR
	ENDIF

	hDevMode := GlobalAlloc(GHND, iSize)
	IF (hDevMode != NULL_PTR)  .and. (pDevMode != NULL_PTR)
		pTemp := GlobalLock(hDevMode)
		MemCopy(pTemp, pDevMode, iSize)
		GlobalUnlock(hDevMode)
	ENDIF

	// Struktur DEVNAMES erstellen
	nLen := _sizeof(_winDEVNAMES) + SLen(cDriver) + SLen(cDevice) + SLen(cPort) + 3
	hDevNames := GlobalAlloc(GHND, nLen)
	IF (hDevNames != NULL_PTR)  .and. (pDevMode != NULL_PTR)
		struDevN := GlobalLock(hDevNames)
		
		struDevN.wDriverOffset := _sizeof(_winDEVNAMES)
		struDevN.wDeviceOffset := struDevN.wDriverOffset + SLen(cDriver) + 1
		struDevN.wOutputOffset := struDevN.wDeviceOffset + SLen(cDevice) + 1
		struDevN.wDefault      := 0
		
		ptrString := PTR(_CAST,(DWORD(_CAST,struDevN) + struDevN.wDriverOffset ))
		pPSZ      := String2Psz(cDriver)
		MemCopy(ptrString, pPSZ, SLen(cDriver)+1)
		
		ptrString := PTR(_CAST,(DWORD(_CAST,struDevN) + struDevN.wDeviceOffset ))
		pPSZ      := String2Psz(cDevice)
		MemCopy(ptrString, pPSZ, SLen(cDevice)+1)

		ptrString := PTR(_CAST,(DWORD(_CAST,struDevN) + struDevN.wOutPutOffset ))
		pPSZ      := String2Psz(cPort)
		MemCopy(ptrString, pPSZ, SLen(cPort)+1)
		
		GlobalUnlock(hDevNames)
	ENDIF

	pd.hDevMode := hDevMode
	// pd.hDevNames := NULL_PTR
	pd.hDevNames := hDevNames
	pd.Flags     := nFlags
	pd.nFromPage := nFromPage
	pd.nToPage   := nToPage
	pd.nMinPage  := nMinPage
	pd.nMaxPage  := nMaxPage
	pd.nCopies   := 0
	pd.hInstance := _GetInst()
	pd.lpfnSetupHook := NULL_PTR
	pd.lpSetupTemplateName := NULL_PTR
	pd.lpfnPrintHook := Null_ptr
	pd.lpPrintTemplateName := NULL_PTR

	// IF !__LoadComDlgDLL() .or. !PCALL(gpfnPrintDlg, @pd)
	IF !__LoadComDlgDLL()  .or. !PrintDlg(@pd)
		//PP-030505 Bug:122
		lValid := FALSE
		lRetVal := FALSE
	ELSE
		//PP-030505 Bug:122
		lValid := TRUE
		//Liuho01 05-30-96
		//Get the Devive name, Driver name, and port name which user selected
		struDevN := GlobalLock(pd.hDevNames)
		ptrString := PTR(_CAST,(DWORD(_CAST,struDevN) + struDevN.wDriverOffset ))
		cDriver := Psz2String(ptrString)
		ptrString := PTR(_CAST,(DWORD(_CAST,struDevN) + struDevN.wDeviceOffset ))
		cDevice := Psz2String(ptrString)
		ptrString := PTR(_CAST,(DWORD(_CAST,struDevN) + struDevN.wOutPutOffset ))
		cPort := Psz2String(ptrString)
		GlobalUnlock(pd.hDevNames)
		GlobalFree(pd.hDevNames)
		//Liuho01 05-30-96
		//Get the information about the printer envirenment which user select.

		pDVTemp := GlobalLock(pd.hDevMode)
		iSize := pDVTemp.dmSize + pDVTemp.dmDriverExtra
		IF (pDevMode == NULL_PTR)
			pDevMode := MemAlloc(iSize)
		ELSE
			pDevMode := MemRealloc(pDevMode, iSize)
		ENDIF
		MemCopy(pDevMode, pDVTemp, iSize)
		GlobalUnlock(pd.hDevMode)
		GlobalFree(pd.hDevMode)
		
		// Prüfen, ob die Applikation sich um Kopien und Sotierung kümmern muss
		// funktioniert bisher nicht !!!
		SELF:nAppCopies := pd.nCopies
		SELF:nAppCollate := DMCOLLATE_FALSE
		IF (SELF:nAppCopies > 1)  .and. (_And(pd.Flags, PD_COLLATE) > 0)
			SELF:nAppCollate := DMCOLLATE_TRUE
		ENDIF
		
		// Prüfen, welche Seiten gedruckt werden sollen
		DO CASE
		CASE _And(pd.Flags, PD_PAGENUMS) > 0
			SELF:nPageSelect := PD_PAGENUMS
			SELF:nFromPage   := pd.nFromPage
			SELF:nToPage     := pd.nToPage
			SELF:oPageRange  := Range{SELF:nFromPage, SELF:nToPage}
		OTHERWISE
			SELF:nPageSelect := PD_ALLPAGES
			SELF:oPageRange  := Range{0,0}
		ENDCASE
		
	ENDIF

	RETURN lRetVal


METHOD SetUp() 
	
	// ========================================================================
	//	Diese Methode stammt im Wesentlichen aus dem SDK
	// ------------------------------------------------------------------------
	//	Änderung: Die Struktur DEVNAMES wird ebenfalls übergeben, damit der
	//	          aktuelle Drucker auch unter NT richtig angezeigt wird.
	// ========================================================================
	
	LOCAL pd IS _WinPrintDlg
	LOCAL struDevN AS _windevNames
	LOCAL lRetVal AS LOGIC
	LOCAL ptrHandle AS PTR
	LOCAL ptrString AS PTR
	LOCAL hDevMode AS PTR
	LOCAL pTemp AS PTR
	LOCAL pDVTemp AS _winDEVMODE
	LOCAL hDevNames AS PTR
	LOCAL nLen AS INT
	LOCAL pPsz AS PSZ


// 	VTrace VMethod

	ptrHandle := GetActiveWindow()
	lRetVal := TRUE
	pd.lStructSize := _sizeof(_winPRINTDLG)

	IF (ptrHandle != NULL_PTR)
		pd.hwndOwner := ptrHandle
	ELSE
		pd.hwndOwner := NULL_PTR
	ENDIF

	hDevMode := GlobalAlloc(GHND, iSize)
	IF (hDevMode != NULL_PTR)  .and. (pDevMode != NULL_PTR)
		pTemp := GlobalLock(hDevMode)
		MemCopy(pTemp, pDevMode, iSize)
		GlobalUnlock(hDevMode)
	ENDIF

	// Struktur DEVNAMES erstellen
	nLen := _sizeof(_winDEVNAMES) + SLen(cDriver) + SLen(cDevice) + SLen(cPort) + 3
	hDevNames := GlobalAlloc(GHND, nLen)
	IF (hDevNames != NULL_PTR)  .and. (pDevMode != NULL_PTR)
		struDevN := GlobalLock(hDevNames)
		
		struDevN.wDriverOffset := _sizeof(_winDEVNAMES)
		struDevN.wDeviceOffset := struDevN.wDriverOffset + SLen(cDriver) + 1
		struDevN.wOutputOffset := struDevN.wDeviceOffset + SLen(cDevice) + 1
		struDevN.wDefault      := 0
		
		ptrString := PTR(_CAST,(DWORD(_CAST,struDevN) + struDevN.wDriverOffset ))
		pPSZ      := String2Psz(cDriver)
		MemCopy(ptrString, pPSZ, SLen(cDriver)+1)
		
		ptrString := PTR(_CAST,(DWORD(_CAST,struDevN) + struDevN.wDeviceOffset ))
		pPSZ      := String2Psz(cDevice)
		MemCopy(ptrString, pPSZ, SLen(cDevice)+1)

		ptrString := PTR(_CAST,(DWORD(_CAST,struDevN) + struDevN.wOutPutOffset ))
		pPSZ      := String2Psz(cPort)
		MemCopy(ptrString, pPSZ, SLen(cPort)+1)
		
		GlobalUnlock(hDevNames)
	ENDIF

	pd.hDevMode := hDevMode
	// pd.hDevNames := NULL_PTR
	pd.hDevNames := hDevNames
	pd.nFromPage := 0
	pd.nToPage := 0
	pd.nMinPage := 0
	pd.nMaxPage := 0
	pd.nCopies := 0
	pd.hInstance := _GetInst()
	pd.Flags := _Or(PD_USEDEVMODECOPIES, PD_COLLATE, PD_SELECTION, PD_PRINTSETUP)
	pd.lpfnSetupHook := NULL_PTR
	pd.lpSetupTemplateName := NULL_PTR
	pd.lpfnPrintHook := Null_ptr
	pd.lpPrintTemplateName := NULL_PTR

	// IF !__LoadComDlgDLL() .or. !PCALL(gpfnPrintDlg, @pd)
	IF !__LoadComDlgDLL()  .or. !PrintDlg(@pd)
		//PP-030505 Bug:122
		lValid := FALSE
		lRetVal := FALSE
	ELSE
		//PP-030505 Bug:122
		lValid := TRUE
		//Liuho01 05-30-96
		//Get the Devive name, Driver name, and port name which user selected
		struDevN := GlobalLock(pd.hDevNames)
		ptrString := PTR(_CAST,(DWORD(_CAST,struDevN) + struDevN.wDriverOffset ))
		cDriver := Psz2String(ptrString)
		ptrString := PTR(_CAST,(DWORD(_CAST,struDevN) + struDevN.wDeviceOffset ))
		cDevice := Psz2String(ptrString)
		ptrString := PTR(_CAST,(DWORD(_CAST,struDevN) + struDevN.wOutPutOffset ))
		cPort := Psz2String(ptrString)
		GlobalUnlock(pd.hDevNames)
		GlobalFree(pd.hDevNames)
		//Liuho01 05-30-96
		//Get the information about the printer envirenment which user select.

		pDVTemp := GlobalLock(pd.hDevMode)
		iSize := pDVTemp.dmSize + pDVTemp.dmDriverExtra
		IF (pDevMode == NULL_PTR)
			pDevMode := MemAlloc(iSize)
		ELSE
			pDevMode := MemRealloc(pDevMode, iSize)
		ENDIF
		MemCopy(pDevMode, pDVTemp, iSize)
		GlobalUnlock(pd.hDevMode)
		GlobalFree(pd.hDevMode)
	ENDIF

	RETURN lRetVal


ACCESS ToPage 
	RETURN SELF:nToPage

ASSIGN ToPage(uValue) 
	SELF:nToPage := uValue
	RETURN SELF:nToPage


END CLASS
