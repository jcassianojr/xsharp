/*
textblock History

- Version 1.00 (03.09.2009)
	erste Version


*/
global hDLLInstance			as ptr
//p handle of the DLL
//s

global nLangHandle as ptr
//p handle for the language DLL where we take the texts
//s


function _VOCanUnload() as logic pascal
//p can the DLL be unloaded?
//s
	return true


function _VODLLMain( hInst as ptr, dwReason as dword, pReserved as ptr) as logic pascal
//p main function for the DLL
//s
	local lRetCode		as logic

	lRetCode			:= true
	do case
	case dwReason == DLL_PROCESS_ATTACH
		hDllInstance		:= hInst
	case dwReason == DLL_THREAD_ATTACH
	case dwReason == DLL_THREAD_DETACH
	case dwReason == DLL_PROCESS_DETACH
	otherwise
		lRetCode			:= false
	endcase

	return lRetCode


DELEGATE RegExExit_delegate() as void 
function RegExExit() as void pascal
//p exit function, but we prefer to not unload...
//s
//	while true
//		if ! InCollect()
//			CollectForced()
//			exit
//		endif

		//ApplicationExec( EXECWHILEEVENT )
//	end

	return


function RegExInit() as void pascal
//p Initialisierung der DLL (Laden der Klassen/Funktionen in das Programm)
//s
#warning Callback function modified to use a DELEGATE by xPorter. Please review.
// 	_RegisterWEP( @RegExExit(), hDLLInstance )
STATIC LOCAL oRegExExitDelegate := RegExExit AS RegExExit_Delegate
	_RegisterWEP( System.Runtime.InteropServices.Marshal.GetFunctionPointerForDelegate(oRegExExitDelegate), hDLLInstance )
	nLangHandle		:= _GetInst()

	return


