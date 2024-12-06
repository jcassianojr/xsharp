FUNCTION BL_CreateFontHmm( cFace, nPointSize, lBold, lItalic, lUnderline, lStrikeThru ) AS PTR
	
	LOCAL	lf IS _WINLOGFONT
	
	Default(@lBold, FALSE)
	Default(@lItalic, FALSE)

	// lf.lfHeight 		:= -MulDiv(nPointSize, GetDeviceCaps(hDC, LOGPIXELSY), 72)
	lf.lfHeight 		:= -MulDiv(nPointSize, 2540, 72)
	lf.lfWidth 			:= 0
	lf.lfEscapement 	:= 0
	lf.lfOrientation 	:= 0
	lf.lfWeight 		:= IF( lBold, FW_BOLD, FW_NORMAL )
	lf.lfItalic 		:= BYTE(_CAST, lItalic)
	lf.lfUnderline 		:= BYTE(_CAST, lUnderline)
	lf.lfStrikeOut 		:= BYTE(_CAST, lStrikeThru)
	lf.lfCharSet 		:= DEFAULT_CHARSET
	lf.lfQuality 		:= DEFAULT_QUALITY
	lf.lfOutPrecision 	:= OUT_DEFAULT_PRECIS
	lf.lfClipPrecision 	:= CLIP_DEFAULT_PRECIS
	lf.lfPitchAndFamily := DEFAULT_PITCH
	
	MemCopyString(@lf.lfFaceName, cFace, SLen(cFace))
	lf.lfFaceName[SLen(cFace) + 1] := 0x00
	
	RETURN CreateFontIndirect(@lf)


FUNCTION GetShell(oWin AS Window)

	// ==========================================================================
	//	Es wird das übergeordnete Shell-Window zurückgegeben oder das App-Objekt
	// ==========================================================================

	LOCAL oShell AS OBJECT			// kann auch App-Objekt sein
	//LOCAL oPROP
	
	

	oShell := oWin
	WHILE ! IsInstanceOfUsual(oShell, #ShellWindow)
			IF oShell:Owner != NULL_OBJECT
				oShell := oShell:Owner
			ELSE
				oShell := GetAppObject()
				EXIT
			ENDIF
	ENDDO

	RETURN oShell

FUNCTION WinRepaint(oWin AS Window) AS VOID

	/* ================================================================
		Diese Funktion bewirkt ein komplettes Neuzeichnen des Fensters
	   ----------------------------------------------------------------
		Bemerkung:	Dadurch verschwinden Löcher, die durch
					Größenveränderungen anderer Shellfenster
					entstanden sind.
	   ================================================================ */
	
	LOCAL oD AS Dimension

	oD := oWin:Size
	LockWindowUpdate( oWin:Handle() )
	oWin:Size := Dimension{oD:Width + 1, oD:Height + 1}
	oWin:Size := oD
	LockWindowUpdate( NULL_PTR )
	RETURN



