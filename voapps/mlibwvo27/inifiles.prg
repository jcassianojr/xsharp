#region DEFINES
DEFINE INI_STRING_LEN := 1024
DEFINE WIN_DIR_LEN := 128
#endregion

CLASS IniFileSpec INHERIT FileSpec

METHOD Create() 

	LOCAL siHandle
	
	IF Upper( SELF:Filename ) != "WIN"
		siHandle := FCreate2( SELF:FullPath, FC_NORMAL )
		FClose( siHandle )
	ENDIF

	RETURN SELF	

METHOD DeleteEntry( sSection, sEntry ) 

	self:WriteString( sSection, sEntry, "" )
	
	RETURN self	

METHOD DeleteSection( sSection ) 

	self:WriteString( sSection, "", "" )

	RETURN self

METHOD GetInt( sSection, sEntry ) 
	RETURN GetPrivateProfileInt( PSZ( sSection ), PSZ( sEntry), 0, PSZ( self:FullPath ) )

METHOD GetSection( sSection ) 

	LOCAL sValue, sEntry AS STRING
	LOCAL ptrBuffer AS PTR
	LOCAL wEnd AS WORD
	LOCAL siLen AS SHORTINT
	LOCAL aEntry AS ARRAY
	
	aEntry := {}
	ptrBuffer := MemAlloc( INI_STRING_LEN )
	
	siLen := GetPrivateProfileString( PSZ( sSection ), NULL_PSZ, 	PSZ( "" ), PSZ( _CAST, ptrBuffer ), INI_STRING_LEN, PSZ( SELF:FullPath ) )
		
	sValue := Left( STRING( _CAST, ptrBuffer ), WORD( siLen ) )
	MemFree( ptrBuffer )

	DO WHILE ( wEnd := At3( _CHR( 0 ), sValue, 2 ) ) > 0

		sEntry := Left( sValue, wEnd - 1 )
		AAdd( aEntry,;
			{ sEntry,;
				SELF:GetString( sSection, sEntry ) ;
			} )
		
		sValue := SubStr2( sValue, wEnd + 1 )
	
	ENDDO
	
	RETURN aEntry


METHOD GetString( sSection, sEntry ) 

	LOCAL sValue AS STRING
	LOCAL ptrBuffer AS PTR
	
	ptrBuffer := MEMALLOC( INI_STRING_LEN )
	
	GetPrivateProfileString( PSZ( sSection ), PSZ( sEntry ), ;
		PSZ( " " ), PSZ( _Cast, ptrBuffer ), INI_STRING_LEN, PSZ( self:FullPath ) )
		
	sValue := PSZ2STRING( PSZ( _CAST, ptrBuffer ) )
	
	MEMFREE( ptrBuffer )
	
	RETURN TRIM( sValue )

METHOD GetStringUpper( sSection, sEntry ) 

	RETURN UPPER( self:GetString( sSection, sEntry ) )

CONSTRUCTOR( cFullPath ) 

	SUPER( cFullPath )

	IF EMPTY( self:Drive )  .AND. EMPTY( self:Path )
		self:FullPath := DiskName() + ":\" + CurDir() + "\" + self:FullPath
	ENDIF

	RETURN self	

METHOD WriteInt( sSection, sEntry, nInt ) 

	WritePrivateProfileString( PSZ( sSection ), PSZ( sEntry ), ;
		PSZ( ALLTRIM( STR( nInt ) ) ), PSZ( self:FullPath ) )

	RETURN self

METHOD WriteString( sSection, sEntry, sString ) 

	WritePrivateProfileString( PSZ( sSection ), PSZ( sEntry ), ;
		PSZ( sString ), PSZ( self:FullPath ) )

	RETURN self

END CLASS
