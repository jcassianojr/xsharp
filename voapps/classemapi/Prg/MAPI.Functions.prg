GLOBAL hLib AS PTR
GLOBAL sMAPI IS SimpleMAPIVtbl

DELEGATE _MAPIExit_delegate() AS VOID 
FUNCTION _MAPIExit() AS VOID PASCAL
	IF hLib != NULL_PTR
		MemSet( @sMAPI , 0 , _sizeof( SimpleMAPIVtbl ) )
		FreeLibrary( hLib )
	ENDIF

	return

FUNCTION _MAPIInit() AS LOGIC PASCAL
	LOCAL lResult := FALSE AS LOGIC

	IF IsMAPIAvailable()
		IF hLib == NULL_PTR
			hLib := LoadLibrary( String2Psz( "MAPI32.DLL" ) )
			IF hLib != NULL_PTR 
				#ifndef __XSHARP__
				_RegisterExit( @_MAPIExit() )
				#endif
				lResult := TRUE
				sMAPI.pFreeBuffer    := GetProcAddress( hLib , String2Psz( "MAPIFreeBuffer" ) )
				sMAPI.pLogoff        := GetProcAddress( hLib , String2Psz( "MAPILogoff" ) )
				sMAPI.pLogon         := GetProcAddress( hLib , String2Psz( "MAPILogon" ) )
				sMAPI.pDeleteMail    := GetProcAddress( hLib , String2Psz( "MAPIDeleteMail" ) )
				sMAPI.pFindNext      := GetProcAddress( hLib , String2Psz( "MAPIFindNext" ) )
				sMAPI.pSendMail      := GetProcAddress( hLib , String2Psz( "MAPISendMail" ) )
				sMAPI.pReadMail      := GetProcAddress( hLib , String2Psz( "MAPIReadMail" ) )
				sMAPI.pResolveName   := GetProcAddress( hLib , String2Psz( "MAPIResolveName" ) )
				sMAPI.pSendDocuments := GetProcAddress( hLib , String2Psz( "MAPISendDocuments" ) )
				sMAPI.pSaveMail      := GetProcAddress( hLib , String2Psz( "MAPISaveMail" ) )
				sMAPI.pAddress       := GetProcAddress( hLib , String2Psz( "MAPIAddress" ) )
				sMAPI.pDetails       := GetProcAddress( hLib , String2Psz( "MAPIDetails" ) )
			ENDIF
		ELSE
			lResult := TRUE
		ENDIF
	ENDIF
	RETURN lResult

function IsMAPIAvailable( lUseTrueWhenError )
	static lMAPIAvailable		as logic
	static lMAPIChecked			as logic                         
	local  nResult 				as long
	local  phkResult 			as ptr
	local  ptrData				as byte ptr
	local  lResult 				as logic
	local  cData 				as string
	local  nDataLen				as dword
                    
	if lMAPIChecked
		lResult				:= lMAPIAvailable
		DebOut( "MAPIavailable is " + AsString( lMAPIAvailable ) + ", checked from cache" ) 
	else                    
		DebOut( "checking MAPI availabilty" ) 
		lResult 			:= false
		nResult 			:= RegOpenKey( HKEY_LOCAL_MACHINE , String2psz( "SOFTWARE\Microsoft\Windows Messaging Subsystem" ), @phkResult )
		if nResult == ERROR_SUCCESS
			DebOut( "registry key opened" ) 
			nDataLen  			:= 256
			ptrData				:= StringAlloc( Space( nDataLen ) )
			nResult 			:= RegQueryValueEx( phkResult , String2psz( "MAPI" ), NULL_PTR, NULL_PTR , ptrData, @nDataLen )
			if nResult == ERROR_SUCCESS                               
				cData				:= Mem2String( ptrData, nDataLen )
				if SubStr3( cData, nDataLen, 1 ) == _chr( 0 )
					cData				:= Left( cData, nDataLen - 1 )
				endif
				DebOut( "registry value read with value " + cData + "." ) 
				DebOut( "registry value read with hex value " + AsHexString( cData ) ) 
				if AllTrim( cData ) == "1"  
					lResult 			:= true
				endif
			else
				DebOut( "registry value could not be read") 
				if IsLogic( lUseTrueWhenError )  .and. lUseTrueWhenError
					lResult				:= true
				endif 
			endif
			MemFree( ptrData )
		else
			DebOut( "registry key NOT opened" ) 
		endif
		RegCloseKey( HKEY_LOCAL_MACHINE )
		lMAPIAvailable		:= lResult
		lMAPIChecked		:= true 
	endif

	return lResult
FUNCTION MAPIAddress( lhSession AS DWORD , ;
		ulUIParam AS DWORD , ;
		lpszCaption AS PSZ , ;
		nEditFields AS DWORD , ;
		lpszLabels AS PSZ , ;
		nRecips AS DWORD , ;
		lpRecips AS PTR , ;
		flFlags AS DWORD , ;
		ulReserved AS DWORD , ;
		lpnNewRecips AS DWORD , ;
		lppNewRecips AS PTR ) AS DWORD PASCAL

 	LOCAL nResult := 0 AS DWORD

	IF _MAPIInit()
		#ifdef __XSHARP__
		nResult := PCallNative<dword>( sMAPI.pAddress , lhSession , ;
					ulUIParam , ;
					lpszCaption , ;
					nEditFields , ;
					lpszLabels, ;
					nRecips , ;
					lpRecips , ;
					flFlags , ;
					ulReserved , ;
					lpnNewRecips , ;
					lppNewRecips ) 
		#else
		nResult := DWORD( _CAST , PCALL( sMAPI.pAddress , lhSession , ;
					ulUIParam , ;
					lpszCaption , ;
					nEditFields , ;
					lpszLabels, ;
					nRecips , ;
					lpRecips , ;
					flFlags , ;
					ulReserved , ;
					lpnNewRecips , ;
					lppNewRecips ) )
		#endif
   	ENDIF

	RETURN nResult

FUNCTION MAPIDeleteMail( lhSession AS DWORD , ;
		ulUIParam AS DWORD , ;
		lpszMessageID AS PSZ , ;
		flFlags AS DWORD , ;
		ulReserved AS DWORD ) AS DWORD PASCAL

	LOCAL nResult := 0 AS DWORD

	IF _MAPIInit()
		#ifdef __XSHARP__
		nResult := PCallNative<dword>( sMAPI.pDeleteMail , lhSession , ;
					ulUIParam , ;
					lpszMessageID , ;
					flFlags , ;
					ulReserved ) 
		#else
		nResult := DWORD( _CAST , PCALL( sMAPI.pDeleteMail , lhSession , ;
					ulUIParam , ;
					lpszMessageID , ;
					flFlags , ;
					ulReserved ) )
		#endif
	ENDIF

	RETURN nResult

FUNCTION MAPIDetails( lhSession AS DWORD , ;
		ulUIParam AS DWORD , ;
		lpRecip AS PTR , ;
		flFlags AS DWORD , ;
		ulReserved AS DWORD ) AS DWORD PASCAL

 	LOCAL nResult := 0 AS DWORD

	IF _MAPIInit()
		#ifdef __XSHARP__
		nResult := PCallNative<dword>( sMAPI.pDetails , lhSession , ;
					ulUIParam , ;
					lpRecip , ;
					flFlags , ;
					ulReserved ) 
		#else
		nResult := DWORD( _CAST , PCALL( sMAPI.pDetails , lhSession , ;
					ulUIParam , ;
					lpRecip , ;
					flFlags , ;
					ulReserved ) )
		#endif
   	ENDIF

	RETURN nResult

FUNCTION MAPIFindNext( lhSession AS DWORD , ;
		ulUIParam AS DWORD , ;
		lpszMessageType AS PSZ , ;
		lpszSeedMessageID AS PSZ , ;
		flFlags AS DWORD , ;
		ulReserved AS DWORD , ;
		lpszMessageID AS PSZ ) AS DWORD PASCAL

	LOCAL nResult := 0 AS DWORD

	IF _MAPIInit()
		#ifdef __XSHARP__
		nResult := PCallNative<dword>( sMAPI.pFindNext , lhSession , ;
					ulUIParam , ;
					lpszMessageType , ;
					lpszSeedMessageID , ;
					flFlags , ;
					ulReserved , ;
					lpszMessageID ) 
		#else
		nResult := DWORD( _CAST , PCALL( sMAPI.pFindNext , lhSession , ;
					ulUIParam , ;
					lpszMessageType , ;
					lpszSeedMessageID , ;
					flFlags , ;
					ulReserved , ;
					lpszMessageID ) )
		#endif
	ENDIF

	RETURN nResult

FUNCTION MAPIFreeBuffer( lpMemory AS PTR ) AS DWORD PASCAL

	LOCAL nResult := 0 AS DWORD

	IF _MAPIInit()
		#ifdef __XSHARP__
		nResult := PCallNative<dword>( sMAPI.pFreeBuffer , lpMemory ) 
		#else
		nResult := DWORD( _CAST , PCALL( sMAPI.pFreeBuffer , lpMemory ) )
		#endif
	ENDIF

	RETURN nResult

FUNCTION MAPILogoff( lhSession AS DWORD , ;
		ulUIParam AS DWORD , ;
		flFlags AS DWORD , ;
		ulReserved AS DWORD ) AS DWORD PASCAL

	LOCAL nResult := 0 AS DWORD

	IF _MAPIInit()
		#ifdef __XSHARP__
		nResult := PCallNative<dword>( sMAPI.pLogoff , ;
					lhSession , ;
					ulUIParam , ;
					flFlags , ;
					ulReserved ) 
		#else
		nResult := DWORD( _CAST , PCALL( sMAPI.pLogoff , ;
					lhSession , ;
					ulUIParam , ;
					flFlags , ;
					ulReserved ) )
		#endif
	ENDIF

	RETURN nResult

FUNCTION MAPILogon( ulUIParam AS DWORD , ;
		lpszName AS PSZ , ;
		lpszPassword AS PSZ , ;
		flFlags AS DWORD , ;
		ulReserved AS DWORD , ;
		lphSession REF DWORD ) AS DWORD PASCAL

	LOCAL nResult := 0 AS DWORD

	IF _MAPIInit()
		#ifdef __XSHARP__
		nResult := PCallNative<dword>( sMAPI.pLogon , ;
					ulUIParam , ;
					lpszName , ;
					lpszPassword , ;
					flFlags , ;
					0 , ;
					@lphSession ) 
		#else
		nResult := DWORD( _CAST , PCALL( sMAPI.pLogon , ;
					ulUIParam , ;
					PSZ( _CAST , lpszName ) , ; // geht nicht: lpszName
					PSZ( _CAST , lpszPassword ) , ; // geht nicht: lpszPassword
					flFlags , ;
					0 , ;
					@lphSession ) )
		#endif
	ENDIF

	RETURN nResult

FUNCTION MAPIReadMail( lhSession AS DWORD , ;
		ulUIParam AS DWORD , ;
		lpszMessageID AS PSZ , ;
		flFlags AS DWORD , ;
		ulReserved AS DWORD , ;
		lppMessage AS PTR ) AS DWORD PASCAL

	LOCAL nResult := 0 AS DWORD

	IF _MAPIInit()
		#ifdef __XSHARP__
		nResult := PCallNative<dword>( sMAPI.pReadMail , lhSession , ;
					ulUIParam , ;
					lpszMessageID , ;
					flFlags , ;
					ulReserved , ;
					lppMessage ) 
		#else
		nResult := DWORD( _CAST , PCALL( sMAPI.pReadMail , lhSession , ;
					ulUIParam , ;
					lpszMessageID , ;
					flFlags , ;
					ulReserved , ;
					lppMessage ) )
		#endif
	ENDIF

	RETURN nResult

FUNCTION MAPIResolveName( lhSession AS DWORD , ;
		ulUIParam AS DWORD , ;
		lpszName AS PSZ , ;
		flFlags AS DWORD , ;
		ulReserved AS DWORD , ;
		lppRecip AS PTR ) AS DWORD PASCAL

	LOCAL nResult := 0 AS DWORD

	IF _MAPIInit()
		#ifdef __XSHARP__
		nResult := PCallNative<dword>( sMAPI.pResolveName , lhSession , ;
				ulUIParam , ;
				lpszName , ;
				flFlags , ;
				ulReserved , ;
				lppRecip ) 
		#else
		nResult := DWORD( _CAST , PCALL( sMAPI.pResolveName , lhSession , ;
				ulUIParam , ;
				lpszName , ;
				flFlags , ;
				ulReserved , ;
				lppRecip ) )
		#endif
   	ENDIF

	RETURN nResult

FUNCTION MAPISaveMail( lhSession AS DWORD , ;
		ulUIParam AS DWORD , ;
		lpMessage AS PTR , ;
		flFlags AS DWORD , ;
		ulReserved AS DWORD , ;
		lpszMessageID AS PSZ ) AS DWORD PASCAL

 	LOCAL nResult := 0 AS DWORD

	IF _MAPIInit()
		#ifdef __XSHARP__
		nResult := PCallNative<dword>( sMAPI.pSaveMail , lhSession , ;
					ulUIParam , ;
					lpMessage , ;
					flFlags , ;
					ulReserved , ;
					lpszMessageID )  
		#else
		nResult := DWORD( _CAST , PCALL( sMAPI.pSaveMail , lhSession , ;
					ulUIParam , ;
					lpMessage , ;
					flFlags , ;
					ulReserved , ;
					lpszMessageID ) ) 
		#endif
   	ENDIF

	RETURN nResult

FUNCTION MAPISendDocuments( ulUIParam AS DWORD , ;
		lpszDelimChar AS PSZ , ;
		lpszFilePaths AS PSZ , ;
		lpszFileNames AS PSZ , ;
		ulReserved AS DWORD ) AS DWORD PASCAL

 	LOCAL nResult := 0 AS DWORD

	IF _MAPIInit()
		#ifdef __XSHARP__   
		nResult := PCallNative<dword>( sMAPI.pSendDocuments , ulUIParam , ;
					lpszDelimChar , ;
					lpszFilePaths , ;
					lpszFileNames , ;
					ulReserved ) 
		#else
		nResult := DWORD( _CAST , PCALL( sMAPI.pSendDocuments , ulUIParam , ;
					lpszDelimChar , ;
					lpszFilePaths , ;
					lpszFileNames , ;
					ulReserved ) )
		#endif
   	ENDIF

	RETURN nResult

FUNCTION MAPISendMail( lhSession AS DWORD , ;
		ulUIParam AS DWORD , ;
		lpMessage AS PTR , ;
		flFlags AS DWORD , ;
		ulReserved AS DWORD ) AS DWORD PASCAL

	LOCAL nResult := 0 AS DWORD

	IF _MAPIInit()
		#ifdef __XSHARP__
		nResult := PCallNative<dword>( sMAPI.pSendMail , lhSession , ;
					ulUIParam , ;
					lpMessage , ;
					flFlags , ;
					ulReserved ) 
		#else
		nResult := DWORD( _CAST , PCALL( sMAPI.pSendMail , lhSession , ;
					ulUIParam , ;
					lpMessage , ;
					flFlags , ;
					ulReserved ) )
		#endif
	ENDIF

	RETURN nResult

VOSTRUCT SimpleMAPIVtbl
	MEMBER pFreeBuffer AS PTR
	MEMBER pLogoff AS PTR
	MEMBER pLogon AS PTR
	MEMBER pDeleteMail AS PTR
	MEMBER pFindNext AS PTR
	MEMBER pSendMail AS PTR
	MEMBER pReadMail AS PTR
	MEMBER pResolveName AS PTR
	MEMBER pSendDocuments AS PTR
	MEMBER pSaveMail AS PTR
	MEMBER pAddress AS PTR
	MEMBER pDetails AS PTR

