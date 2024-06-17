/*
TEXTBLOCK ReadThis
/-*
The function RunningInstances() counts how many instances of the current process is running

The function RunningInstancesDebug() returns an Array populated with all found processes.
This array can be used to populate a ListBox to view all found processes. It's mostly supplied
for debugging purposes for catching eventual problems with future Windows versions.

Windows API is used to walk through all loaded modules in memory and count how many instances
of the current Application is loaded into memory.
There is one significant difference between Windows 98 and 2000. Under Windows 98 the API call will
return the full path to the process while under '2000 it returns only the file name. Under '2000
the returned string seems also to be limited to 15 characters. So, if you are going to use this function
you should limit the name of the executable to 15 characters, including the file extension.

RunningInstances() should return at least 1 because it should find itself!
If zero is returned something went wrong in an API call and hopefully that should never happen.
	
The syntax for preventing more than one instance of the application from running is:

IF RunningInstances() > 1
	Self:Quit()
ELSE
	//Instanciate the ShellWindow and show it
END
	
--------------------------------------------------------
This MEF is put in public domain by:
Lars-Eric Gisslén
lars.gisslen@chello.se

*-/

*/
#region DEFINES
DEFINE TH32CS_INHERIT   :=   0x80000000
DEFINE TH32CS_SNAPALL      := (TH32CS_SNAPHEAPLIST + TH32CS_SNAPPROCESS + TH32CS_SNAPTHREAD + TH32CS_SNAPMODULE)
DEFINE TH32CS_SNAPHEAPLIST := 0x00000001
DEFINE TH32CS_SNAPMODULE   :=0x00000008
DEFINE TH32CS_SNAPPROCESS  := 0x00000002
DEFINE TH32CS_SNAPTHREAD   :=0x00000004
#endregion

_DLL FUNCTION CreateToolhelp32Snapshot(dwFlags AS DWORD, th32ProcessID AS DWORD);
		AS PTR PASCAL:kernel32.CreateToolhelp32Snapshot
		

_DLL FUNCTION Process32First(hSnapshot AS PTR, pPROCESSENTRY32 AS _winProcessentry32 PTR);
		AS LOGIC PASCAL:kernel32.Process32First
		

_DLL FUNCTION Process32Next(hSnapshot AS PTR, pPROCESSENTRY32 AS _winProcessentry32 PTR);
		AS LOGIC PASCAL:kernel32.Process32Next
		

FUNCTION RunningInstances() AS DWORD
	LOCAL hSnapshot AS PTR
	LOCAL nCount AS DWORD
	LOCAL nPos AS DWORD
	LOCAL cApp AS STRING
	LOCAL cProc AS STRING
	LOCAL pModuleName AS PTR
	LOCAL pProcEntry AS _winProcessentry32
	
	Ncount:= 0
	
	
		// Get the full path to the current process
	pModuleName := StringAlloc(Space(MAX_PATH))
	GetModuleFileName(_GetInst(),pModuleName, MAX_PATH)
	cApp := Upper(Psz2String(pModuleName))
	
	MemFree(pModuleName)
	
	nPos := RAt("\", cApp)
	IF nPos > 0
		cApp := SubStr(cApp, nPos + 1, 15)
	ELSE
		cApp := Left(cApp, 15)
	END

	hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPALL,0)
	
	IF hSnapshot = INVALID_HANDLE_VALUE
		RETURN 0
	ENDIF

	pProcEntry := MemAlloc(_sizeof(_winProcessentry32))
	pProcEntry.dwSize := _sizeof(_winProcessentry32)
	
	IF Process32First(hSnapshot, pProcEntry)
			// The pProcEntry.szExeFile will include full path in Win '98 but not in '2000
		cProc := Psz2String(@pProcEntry.szExeFile)
		nPos := RAt("\", cProc)
		IF nPos > 0
			cProc := SubStr(cProc, nPos + 1, 15)
		ELSE
			cProc := Left(cProc, 15)
		END
		IF cProc == cApp
			nCount ++
		END	
		WHILE Process32Next(hSnapshot, pProcEntry)
			cProc := Psz2String(@pProcEntry.szExeFile)
			nPos := RAt("\", cProc)
			IF nPos > 0
				cProc := SubStr(cProc, nPos + 1, 15)
			ELSE
				cProc := Left(cProc, 15)
			END
			IF cProc == cApp
				nCount ++
			END	
		END
	ELSE
		// This should not happen
		// At least one instance of the module should be found!
		nCount := 0
	END

	CloseHandle(hSnapshot)
	MemFree(pProcEntry)
	
	RETURN nCount


FUNCTION RunningInstancesDebug() AS ARRAY
	LOCAL hSnapshot AS PTR
	LOCAL nCountAll AS DWORD
	LOCAL nPos AS DWORD
	LOCAL cApp AS STRING
	LOCAL cProc AS STRING
	LOCAL aRetVal AS ARRAY
	LOCAL pModuleName AS PTR
	LOCAL pProcEntry AS _winProcessentry32
	
	
	Ncountall := 0
	
	aRetVal := {}
		// Get the full path to the current process
	pModuleName := StringAlloc(Space(MAX_PATH))
	GetModuleFileName(_GetInst(),pModuleName, MAX_PATH)
	cApp := Upper(Psz2String(pModuleName))
	AAdd(aRetVal, "Current process: " + cApp)
	AAdd(aRetVal, "----------------------------")
	
	MemFree(pModuleName)
	
	nPos := RAt("\", cApp)
	IF nPos > 0
		cApp := SubStr(cApp, nPos + 1, 15)
	ELSE
		cApp := Left(cApp, 15)
	END

	hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPALL,0)
	
	IF hSnapshot = INVALID_HANDLE_VALUE
		AAdd(aRetVal, "")
		AAdd(aRetVal, "Error getting handle to Snapshot")
		RETURN aRetVal
	ENDIF

	pProcEntry := MemAlloc(_sizeof(_winProcessentry32))
	pProcEntry.dwSize := _sizeof(_winProcessentry32)
	
	IF Process32First(hSnapshot, pProcEntry)
			// The pProcEntry.szExeFile will include full path in Win '98 but not in '2000
		cProc := Psz2String(@pProcEntry.szExeFile)
		nPos := RAt("\", cProc)
		IF nPos > 0
			cProc := SubStr(cProc, nPos + 1, 15)
		ELSE
			cProc := Left(cProc, 15)
		END
		
		nCountAll ++
		
		AAdd(aRetVal, Psz2String(@pProcEntry.szExeFile))
		
		WHILE Process32Next(hSnapshot, pProcEntry)
			cProc := Psz2String(@pProcEntry.szExeFile)
			nPos := RAt("\", cProc)
			IF nPos > 0
				cProc := SubStr(cProc, nPos + 1, 15)
			ELSE
				cProc := Left(cProc, 15)
			END
			nCountAll ++
			AAdd(aRetVal, Psz2String(@pProcEntry.szExeFile))
		END
	ELSE
		// This should not happen
		// At least one instance of the module should be found!
		AAdd(aRetVal, "No processes found!!!!")
		nCountAll := 0
	END

	AAdd(aRetVal, "----------------------------")
	AAdd(aRetVal, "Number of Processes: " + NTrim(nCountAll))
	AAdd(aRetVal, "Instances of this process: " + NTrim(RunningInstances()))

	CloseHandle(hSnapshot)
	MemFree(pProcEntry)
	
	RETURN aRetVal
	

VOSTRUCT _winPROCESSENTRY32
  MEMBER dwSize AS DWORD
  MEMBER cntUsage AS DWORD
  MEMBER th32ProcessID AS DWORD
  MEMBER th32DefaultHeapID AS DWORD
  MEMBER th32ModuleID AS DWORD
  MEMBER cntThreads AS DWORD
  MEMBER th32ParentProcessID AS DWORD
  MEMBER  pcPriClassBase AS LONG
  MEMBER dwFlags AS DWORD
  MEMBER DIM szExeFile[MAX_PATH] AS BYTE


