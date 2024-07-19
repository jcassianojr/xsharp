class clsHS_RegEx
	protect _ptrRegEx		as _RegExStruct
	protect _ptrPattern		as ptr
	protect _cPattern		as string
	protect _nError			as int
	protect _cError			as string
	protect _nFlags			as int

	

method CleanUp() as void pascal 

	hs_regfree( _ptrRegEx )
	MemFree( _ptrPattern )
	MemFree( _ptrRegEx )
	
	return	
	

access ErrorNum as int pascal 

	return _nError
	

access ErrorString as string pascal 

	return _cError
	

method FillError( nError as int ) as void pascal 
	local ptrError		as ptr
	local nLen			as dword	

	_nError			:= nError
	if _nError == 0
		_cError			:= ""
	else
		ptrError		:= MemAlloc( 1024 )
		if ptrError == null_ptr
			break
		endif              
		nLen			:= dword( hs_regerror( nError, _ptrRegEx, ptrError, 1024 ) )
		_cError			:= Mem2String( ptrError, nLen ) 
		MemFree( ptrError )
	endif
	
	return
	

CONSTRUCTOR( cPattern, nFlags ) 
    local nReturn		as int
	
	_ptrRegEx		:= MemAlloc( _sizeof( _RegExStruct ) )
	if _ptrRegEx == null_ptr
		break
	endif
	if ! IsNumeric( nFlags )
		_nFlags			:= REG_BASIC + REG_ICASE
	else
		_nFlags			:= nFlags
	endif
	_cPattern		:= cPattern
	_ptrPattern		:= StringAlloc( _cPattern )
	if _ptrPattern == null_ptr
		break
	endif
	
	nReturn			:= hs_regcomp( _ptrRegEx, _ptrPattern, _nFlags )
	self:FillError( nReturn )
	
	return self
	

access IsError as logic pascal 

	return ( _nError != 0 )	


method Match( cString as string, nEFlags := 0 as int ) as logic pascal 
	local lReturn		as logic
	local nReturn		as int
	local ptrString		as ptr
	local nMatch		as int
	local ptrMatch		as ptr

	_nError			:= 0
	_cError			:= ""
// 	if ! IsNumeric( nEFlags )
// 		nEFlags				:=0
// 	endif	
	ptrString			:= StringAlloc( cString )
	nMatch				:= 10
	ptrMatch			:= MemAlloc( _sizeof( _RegMatchStruct ) * 10 )
	nReturn				:= hs_regexec( _ptrRegex, ptrString, nMatch, ptrMatch, nEFlags )
	do case
	case nReturn == 0
		lReturn				:= true
		self:FillError( 0 )
	case nReturn == REG_NOMATCH
		lReturn				:= false
		self:FillError( 0 )
	otherwise
		self:FillError( nReturn )
	endcase
	MemFree( ptrMatch )
	MemFree( ptrString )
		
	return lReturn			
	


END CLASS
