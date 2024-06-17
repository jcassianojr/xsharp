FUNCTION GetFileNameFromPath(strFileName AS STRING) AS STRING STRICT
	LOCAL strFile AS STRING
	LOCAL dwPos		AS DWORD
	

	strFile := strFileName										// By default the FileName is the one passed to this function
	dwPos := RAt("\",strFileName)							// Find last pos of string in FileName
	IF dwPos > 0	 .AND. dwPos < SLen(strFileName)// If a "\" exists in the String
		strFile := SubStr2(strFileName,dwPos+1)	// Extract the String
	ENDIF	
RETURN strFile

FUNCTION GetPathFromFileName( cFileName AS STRING ) AS STRING PASCAL
//p gibt den Pfad zu einem Datei-Namen zurück
//s
	LOCAL cPath			AS STRING
	LOCAL nPos			AS DWORD

	IF ( nPos := RAt( "\", cFileName ) ) > 0
		cPath			:= Left( cFileName, nPos - 1 )
	ELSE
		cPath			:= ""
	ENDIF

	RETURN cPath
	

FUNCTION SHCopy( cFROM AS STRING, cTO AS STRING, wFlags := FOF_NOCONFIRMATION + FOF_FILESONLY AS WORD, cTitle := "Copiando..." AS STRING ) AS LOGIC PASCAL

        LOCAL struSHFileOpStruct IS _WINSHFILEOPSTRUCT
        LOCAL lSuccess AS LOGIC

        struSHFileOpStruct.pFrom  := StringAlloc( cFROM+_CHR(0) )
        struSHFileOpStruct.pTo    := StringAlloc( cTO+_CHR(0) )
        struSHFileOpStruct.wFUNC  := FO_COPY
        IF !Empty(cTitle)
                struSHFileOpStruct.lpszProgressTitle := StringAlloc(cTitle+_CHR(0))
                wFlags := wFlags + FOF_SIMPLEPROGRESS   // required for the title to be displayed
        ENDIF
        struSHFileOpStruct.fFlags := wFlags // + FOF_NOCONFIRMATION + FOF_FILESONLY + FOF_RENAMEONCOLLISION
        lSuccess := ( SHFileOperation( @struSHFileOpStruct ) = 0 )

        CloseHandle(struSHFileOpStruct.hwnd)
        MemFree(struSHFileOpStruct.pFrom)
        MemFree(struSHFileOpStruct.pTo)
        IF !Empty(cTitle)
                MemFree(struSHFileOpStruct.lpszProgressTitle)
        ENDIF

        RETURN lSuccess


