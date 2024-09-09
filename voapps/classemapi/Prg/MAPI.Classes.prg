class MAPISend
//p Klasse zur Kapselung einer Nachricht
//s
	protect _aRecipients			as array	// array of recipients, type: eMailRecipient
	protect _aCC					as array	// array of CC addresses, type: eMailRecipient
	protect _aBCC					as array	// array of BCC addresses, type: eMailRecipient
	protect _cMessage				as string	// message text
	protect _cSubject				as string	// subject string
	protect _aAttach				as array	// array of attachments, type: eMailAttachment
	protect _cSender				as string	// name and adress for the sender
	protect _cSenderName			as string	// name and adress for the sender
	protect _cResult				as string	// eventual error message  
	protect _aMemPointers			as array	// array of pointers to free
	protect _oWindow				as object	// aufrufendes Fenster

	

method Send( lWindow as logic ) as logic pascal 
//p Versenden über Simple MAPI
//s
	local nResult			as dword
	local strMessage 		is MAPIMessage 
	local ptrRecip			as MAPIRecipDesc  
	local ptrFiles			as MAPIFileDesc   
	local nI				as dword
	local nLen				as dword
	local aRecip			as array
	local nSession			as dword
	local oOriginator		as MAPIRecipient
	local oRecipient		as MAPIRecipient
	local oAttachment		as MAPIAttachment
	local nFlags			as dword
	local ptrBuffer			as ptr
	local nHandle			as dword

	// Warnings ausschalten	
	ptrRecip		:= null_ptr
	ptrFiles		:= null_ptr
	nSession		:= 0
	nResult			:= 0

	if ! IsLogic( lWindow )
		lWindow			:= false
	endif
	// alle Empfänger zusammen in ein Array schreiben
	nLen			:= ALen( _aRecipients )
	aRecip			:= ArrayNew( nLen )
	for nI := 1 upto nLen
		if ! Empty( _aRecipients[nI] )
			aRecip[nI]		:= _aRecipients[nI]
		endif
	next
	nLen			:= ALen( _aCC )
	for nI := 1 upto nLen
		_aCC[nI]:AddressClass	:= MAPI_CC
		AAdd( aRecip, _aCC[nI] )
	next
	nLen			:= ALen( _aBCC )
	for nI := 1 upto nLen
		_aBCC[nI]:AddressClass	:= MAPI_BCC
		AAdd( aRecip, _aBCC[nI] )
	next

	// Struktur vorbereiten
	MemSet( @strMessage, 0, _sizeof( MAPIMessage ) )
	if ALen( aRecip ) > 0
		ptrRecip		:= MemAlloc( _sizeof( MAPIRecipDesc ) * ALen( aRecip ) )  
		if ptrRecip == null_ptr
			MessageBox( null_ptr, psz( "Error allocating memory in _SendMAPI()!" ), psz( "Error" ), MB_ICONSTOP )
			break
		endif
	endif
	begin sequence
	if ALen( _aAttach ) > 0
		ptrFiles		:= MemAlloc( _sizeof( MAPIFileDesc ) * ALen( _aAttach ) ) 
		if ptrFiles == null_ptr
			MessageBox( null_ptr, psz( "Error allocating memory in _SendMAPI()!" ), psz( "Error" ), MB_ICONSTOP )
			break
		endif
	endif        
	
	if ! Empty( _cSender )
		oOriginator					:= MAPIRecipient{ _cSender, _cSenderName } 
		oOriginator:AddressClass	:= MAPI_ORIG
		strMessage.lpOriginator		:= oOriginator:GetMAPIRecip()
	endif

	if ! Empty( _cSubject )
		strMessage.lpszSubject		:= StringAlloc( _cSubject )
	endif
	if ! Empty( _cMessage )
		strMessage.lpszNoteText		:= StringAlloc( " " + _cMessage )
	endif
	strMessage.ulReserved			:= 0
	strMessage.lpszMessageType		:= StringAlloc( "IPM.NoteText" )
	//ptrMessage.lpszDateReceived		:= StringAlloc( "" )
	//ptrMessage.lpszConversationID	:= StringAlloc( "" )
	strMessage.flFlags				:= 0

	// Empfänger besetzen
	nLen				:= ALen( aRecip )
	if nLen > 0
		for nI := 1 upto nLen
			oRecipient		:= aRecip[nI]
			MemCopy( ptrRecip + ( nI - 1 ), oRecipient:GetMAPIRecip(), _sizeof( MAPIRecipDesc ) )
		next
		strMessage.lpRecips		:= ptrRecip
		strMessage.nRecipCount	:= nLen
	else
		strMessage.nRecipCount	:= 0
	endif

	// anzuhängende Dateien
	nLen				:= ALen( _aAttach )
	if nLen > 0
		for nI := 1 upto nLen
			oAttachment			:= _aAttach[nI] 
			MemCopy( ptrFiles + ( nI - 1 ), oAttachment:GetMAPIFileDesc(), _sizeof( MAPIFileDesc ) )
		next
		strMessage.lpFiles		:= ptrFiles
		debOut( AsHexString( Mem2String( ptrFiles, _sizeof( MAPIFileDesc ) ) ) ) 
 		ptrBuffer				:= ptrFiles.lpszPathName
 		debOut( AsHexString( Psz2String( ptrBuffer ) ) ) 
		strMessage.nFileCount	:= nLen
	else
		strMessage.nFileCount	:= 0
	endif

	if _oWindow == null_object
		nHandle			:= 0
	else
		nHandle			:= dword( _cast, _oWindow:Handle() )
	endif 
	nResult 		:= MAPILogon( nHandle, null_psz, null_psz, 0, 0, @nSession )
	if nResult != SUCCESS_SUCCESS
		MessageBox( null_ptr, String2psz( "Error logging on on MAPI" ), String2psz( "Error" ), MB_ICONSTOP )
		break
	endif

	if lWindow
		nFlags			:= MAPI_DIALOG
	else
		nFlags			:= MAPI_NEW_SESSION 
	endif
	if strMessage.nRecipCount == 0
		nFlags			:= _And( nFlags, MAPI_DIALOG )
	endif
	nResult 		:= MAPISendMail( nSession, nHandle, @strMessage, nFlags, 0 )
	if nResult != SUCCESS_SUCCESS
		self:DisplayError( nResult )
	endif 

	MAPILogoff( nSession, 0, 0, 0 )

	recover

	end sequence

	if false	
// 		if pszSubject != null_psz
// 			MemFree( pszSubject )
// 		endif
// 		if pszMessage != null_psz
// 			MemFree( pszMessage )
// 		endif
// 		MemFree( pszType )
		if ptrRecip != null_ptr
			MemFree( ptrRecip )
		endif
		if ptrFiles != null_ptr
			MemFree( ptrFiles )
		endif
	endif
	aRecip			:= null_array

	return ( nResult == SUCCESS_SUCCESS )

method AddAttachment( cFileName as string ) as dword pascal 
//p Hinzufügen eines Anhanges
//s
	debOut( "File to send:" + cFileName + "!" ) 	
	if ! File( cFileName )
		MessageBox( _oWindow:Handle(), String2psz( "File is missing:" + cFileName + "!" ), String2psz( "Error" ), MB_OK )
	endif
	AAdd( _aAttach, MAPIAttachment{ cFileName } )

	return ALen( _aAttach )

method AddBCC( cName as string, cAddress as string ) as dword pascal 
//p Hinzufügen einer BCC-Addresse (Blind Carbon Copy)
//s
	AAdd( _aBCC, MAPIRecipient{ cName, cAddress } )

	return ALen( _aBCC )

method AddBCCObject( oRecipient as MAPIRecipient ) as dword pascal 
//p Hinzufügen einer BCC-Addresse (Blind Carbon Copy)
//s
	AAdd( _aBCC, oRecipient )

	return ALen( _aBCC )

method AddCC( cName as string, cAddress as string ) as dword pascal 
//p Hinzufügen einer CC-Adresse (Carbon Copy)
//s
	AAdd( _aCC, MAPIRecipient{ cName, cAddress } )

	return ALen( _aCC )

method AddCCObject( oRecipient as MAPIRecipient ) as dword pascal 
//p Hinzufügen einer CC-Adresse (Carbon Copy)
//s
	AAdd( _aCC, oRecipient )

	return ALen( _aCC )

method AddRecipient( cName as string, cAddress as string ) as dword pascal 
//p Hinzufügen eines Empfängers
//s
	AAdd( _aRecipients, MAPIRecipient{ cName, cAddress } )

	return ALen( _aRecipients )

method AddRecipientObject( oRecipient as MAPIRecipient ) as dword pascal 
//p Hinzufügen eines Empfängers
//s
	AAdd( _aRecipients, oRecipient )

	return ALen( _aRecipients )

method Cleanup() 
//p Aufräumen der Objekte
//s
    ASend( _aRecipients, #Cleanup )
    ASend( _aCC, #Cleanup )
    ASend( _aBCC, #Cleanup )
    ASend( _aAttach, #Cleanup )
	_aRecipients	:= null_array
	_aCC			:= null_array
	_aBCC			:= null_array
	_aAttach		:= null_array

	return nil

method DisplayError( nError as dword ) as logic pascal 

	local cMessage		as string
	local ptrHandle		as ptr
	
	do case
	case nError == MAPI_E_AMBIGUOUS_RECIPIENT
		cMessage		:= "MAPI_E_AMBIGUOUS_RECIPIENT" 	// A recipient matched more than one of the recipient descriptor structures and MAPI_DIALOG was not set. No message was sent.
	case nError == MAPI_E_ATTACHMENT_NOT_FOUND
		cMessage		:= "MAPI_E_ATTACHMENT_NOT_FOUND"	// The specified attachment was not found. No message was sent.
	case nError == MAPI_E_ATTACHMENT_OPEN_FAILURE
		cMessage		:= "MAPI_E_ATTACHMENT_OPEN_FAILURE"	// The specified attachment could not be opened. No message was sent.
	case nError == MAPI_E_BAD_RECIPTYPE
		cMessage		:= "MAPI_E_BAD_RECIPTYPE"			// The type of a recipient was not MAPI_TO, MAPI_CC, or MAPI_BCC. No message was sent.
	case nError == MAPI_E_FAILURE
		cMessage		:= "MAPI_E_FAILURE"					// One or more unspecified errors occurred. No message was sent.
	case nError == MAPI_E_INSUFFICIENT_MEMORY
		cMessage		:= "MAPI_E_INSUFFICIENT_MEMORY"		// There was insufficient memory to proceed. No message was sent.
	case nError == MAPI_E_INVALID_RECIPS
		cMessage		:= "MAPI_E_INVALID_RECIPS"			// One or more recipients were invalid or did not resolve to any address.
	case nError == MAPI_E_LOGIN_FAILURE
		cMessage		:= "MAPI_E_LOGIN_FAILURE"			// There was no default logon, and the user failed to log on successfully when the logon dialog box was displayed. No message was sent.
	case nError == MAPI_E_TEXT_TOO_LARGE
		cMessage		:= "MAPI_E_TEXT_TOO_LARGE"			// The text in the message was too large. No message was sent.
	case nError == MAPI_E_TOO_MANY_FILES
		cMessage		:= "MAPI_E_TOO_MANY_FILES"			// There were too many file attachments. No message was sent.
	case nError == MAPI_E_TOO_MANY_RECIPIENTS
		cMessage		:= "MAPI_E_TOO_MANY_RECIPIENTS"		// There were too many recipients. No message was sent.
	case nError == MAPI_E_UNKNOWN_RECIPIENT
		cMessage		:= "MAPI_E_UNKNOWN_RECIPIENT"		// A recipient did not appear in the address list. No message was sent.
	case nError == MAPI_E_USER_ABORT
		cMessage		:= "MAPI_E_USER_ABORT"				// The user canceled one of the dialog boxes. No message was sent.
	case nError == SUCCESS_SUCCESS
		cMessage		:= "SUCCESS_SUCCESS"
	otherwise
		cMessage		:= "unknown MAPI error " + NTrim( nError ) + "!"
	endcase

	if _oWindow == null_object
		ptrHandle		:= null_ptr
	else
		ptrHandle		:= _oWindow:Handle()
	endif
		
	MessageBox( ptrHandle, String2psz( cMessage ), String2psz( "MAPI error" ), MB_OK )
	
	return true	

CONSTRUCTOR( oWindow, cRecipient, cMessage ) 
//p Initialisierung, genügt für einfache Message
//s
	_aRecipients	:= {}
	_aCC			:= {}
	_aBCC			:= {}
	_aAttach		:= {}
	_aMemPointers	:= {}
	_oWindow		:= oWindow
	if ! Empty( cRecipient )
		self:AddRecipient( cRecipient, "" )
	endif
	if ! Empty( cMessage )
		self:SetText( cMessage )
	endif

	return self

assign Sender( cSender as string ) as string pascal 
//p Zuweisen des Absenders
//s
	_cSender		:= cSender

	return cSender

method SetText( cText as string ) as string pascal 
//p Setzen des Mail-Textes
//s
	if IsString( cText )
		_cMessage		:= cText
	endif

	return cText

assign Subject( cSubject as string ) as string pascal 

	if IsString( cSubject )
		_cSubject		:= cSubject
	endif

	return cSubject

END CLASS
class MAPIAttachment inherit VOBject
//p Klasse zur Kapselung eines Mail-Anhanges
//s
	protect cFileName		as string
	

method Cleanup() as logic pascal 
//p Aufräumen, muß beim Verwenden von MAPI unbedingt aufgerufen werden
//s
	return true

access FileName as string pascal 
//p Zugriff auf den Namen
//s
	return cFileName

assign FileName( cFileName as string ) as string pascal 
//p Zuweisung für den Namen
//s
	if IsString( cFileName )
		self:cFileName		:= cFileName
	endif

	return cFileName

method GetMAPIFileDesc() as MAPIFileDesc ptr pascal 
//p gibt einen Zeiger auf eine MAPIFileDesc-Struktur zurück, nach Verwendung muß Cleanup aufgerufen werden
//s                       
	local ptrFileDesc			as MAPIFileDesc 

	ptrFileDesc				:= MemAlloc( _sizeof( MAPIFileDesc ) )
	ptrFileDesc.ulReserved	:= 0
	ptrFileDesc.flFlags		:= 0			// normales File, nicht OLE
	ptrFileDesc.nPosition	:= 0xFFFFFFFF	// Position nicht definiert
	ptrFileDesc.lpszPathName := StringAlloc( cFileName )
	DebOut( cFileName + "->" + Psz2String( ptrFileDesc.lpszPathName ) ) 

	return ptrFileDesc

CONSTRUCTOR( cFileName ) 
//p Initialisierung
//s
	SUPER()

	if IsString( cFileName )
		self:cFileName		:= cFileName
	endif

	return self

END CLASS
class MAPIRecipient
//p Klasse zur Kapselung einer Mail-Adresse
//s
	protect cName			as string
	protect cAddress		as string
 	protect ptrName			as ptr
 	protect ptrAddress		as ptr
	protect nClass			as dword		// Typ Recipient
	

access Address as string pascal  
//p Zugriff auf die Addresse
//s
	return cAddress

assign Address( cAddress as string ) as string pascal 
//p Zuweisung der Addresse
//s
	if IsString( cAddress )
		self:cAddress	:= cAddress
	endif

	return cAddress

assign AddressClass( nClass as dword ) as dword pascal 
//p Zuweisung der Adress-Klasse
//s
	if IsNumeric( nClass )
		self:nClass		:= nClass
	endif

	return nClass

method Cleanup() as logic pascal 
//p Aufräumen, muß beim Verwenden von MAPI unbedingt aufgerufen werden
//s
	if false
 		if ptrName != null_ptr
 			MemFree( ptrName )
 			ptrName			:= null_ptr  
 		endif
 		if ptrAddress != null_ptr
 			MemFree( ptrAddress )
 			ptrAddress		:= null_ptr
 		endif
	endif

	return true

method GetMAPIRecip() as MAPIRecipDesc ptr pascal 
//p gibt einen Zeiger auf eine MAPIRcipDesc-Struktur zurück, nach Verwendung muß Cleanup aufgerufen werden
//s                 
	local ptrRecip 		as MAPIRecipDesc 

	ptrRecip			:= MemAlloc( _sizeOf( MAPIRecipDesc ) ) 
	if Empty( cName )  .and. ! Empty( cAddress )
		cName					:= cAddress
	endif
	if ! Empty( cName )  .and. Empty( cAddress )
		cAddress				:= cName
	endif
	ptrName					:= StringAlloc( cName ) 
	if InStr( ":", cAddress ) 
		ptrAddress				:= StringAlloc( cAddress )
	else
		ptrAddress				:= StringAlloc( "SMTP:" + cAddress )
	endif
	ptrRecip.ulRecipClass 	:= nClass
	ptrRecip.lpszName		:= ptrName
	ptrRecip.lpszAddress	:= ptrAddress
	ptrRecip.ulEIDSize		:= 0
	ptrRecip.lpEntryID		:= null_ptr

	return ptrRecip

CONSTRUCTOR( cName, cAddress ) 
//p Initialisierung
//s
	local nStart 	as dword
	local nEnd		as dword

	if IsString( cName )  .and. IsNil( cAddress )  .and. ( InStr( "<", cName )  .or. InStr( '"', cName ) )
		// aufsplitten in Adresse und Namen
		if InStr( '"', cName )  .and. Occurs( '"', cName ) == 2
			nStart			:= At( '"', cName )
			nEnd			:= At3( '"', cName, nStart + 1 )
			if nStart > 0  .and. nEnd > 0
				self:cName		:= AllTrim( SubStr3( cName, nStart + 1, nEnd - nStart + 1 ) )
				self:cAddress	:= AllTrim( SubStr2( cName, nEnd + 1 ) )
			endif
		else
			if InStr( "<", cName )  .and. InStr( ">", cName )
				nStart			:= At( '<', cName )
				nEnd			:= At3( '>', cName, nStart + 1 )
				if nStart > 0  .and. nEnd > 0
					self:cName		:= AllTrim( Left( cName, nStart - 1 ) )
					self:cAddress	:= AllTrim( SubStr3( cName, nStart + 1, nEnd - nStart - 1 ) )
				endif
			endif
		endif
	endif

	if IsString( cName )
		self:cName		:= cName
	endif
	if IsString( cAddress )
		self:cAddress	:= cAddress
	else
		if PCount() == 1
			self:cAddress		:= self:cName
		endif
	endif
	nClass			:= MAPI_TO		// normaler Empfänger

	return self

access Name as string pascal 
//p Zugriff auf den Namen
//s
	return cName

assign Name( cName as string ) as string pascal 
//p Zuweisung für den Namen
//s
	if IsString( cName )
		self:cName		:= cName
	endif

	return cName

END CLASS
