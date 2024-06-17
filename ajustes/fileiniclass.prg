
_DLL FUNC GetPrivateProfileSection_New(lpAppName AS PSZ, lpReturnedString AS BYTE[],;
nSize AS DWORD, lpFileName AS PSZ);
AS DWORD PASCAL:KERNEL32.GetPrivateProfileSectionA
_DLL FUNC GetPrivateProfileSectionNames_New(lpszReturnBuffer AS BYTE[], nSize AS DWORD,;
lpFileName AS PSZ) AS DWORD PASCAL:KERNEL32.GetPrivateProfileSectionNamesA




CLASS IniFileSpec INHERIT FileSpec
PROTECT _lFileExists AS LOGIC
PROTECT _liShowState AS INT




METHOD DeleteEntry( cSection, cEntry ) 

IF SELF:lFileExists
SELF:WriteString( cSection, cEntry, "" )
ENDIF

RETURN SELF

METHOD DeleteSection(cSection) 

IF SELF:lFileExists
SELF:WriteString(cSection, "", "" )
ENDIF

RETURN SELF

HIDDEN METHOD Get_Array(aSection AS ARRAY , cKey AS STRING) AS ARRAY 
LOCAL cBalance, cType, cValue AS STRING
LOCAL dwN AS DWORD
LOCAL aReturn AS ARRAY

aReturn := {}
FOR dwN := 1 UPTO ALen(aSection)
cBalance := Stuff(aSection[dwN,1], 1, SLen(cKey)+1, "")
IF At2(".", cBalance) = 0  .and. SLen(cBalance) > 0  .and. Left(aSection[dwN,1], SLen(cKey))== cKey
cType := Left(aSection[dwN,2], 1)
cValue := SubStr2(aSection[dwN,2], 3)
IF cType == "C"
AAdd(aReturn, cValue)
ELSEIF cType == "L"
AAdd(aReturn, cValue == ".T.")
ELSEIF cType == "D"
AAdd(aReturn, CToD(cValue))
ELSEIF cType == "N"
AAdd(aReturn, Val(cValue))
ELSEIF cType == "A"
AAdd(aReturn, SELF:Get_Array(aSection, aSection[dwN,1]))
ELSE
AAdd(aReturn, "Unknown of type "+cType)
ENDIF
ENDIF
NEXT
RETURN aReturn





METHOD GetArray(cArrayName AS STRING) AS ARRAY 
LOCAL aSection AS ARRAY

aSection := SELF:GetSection(cArrayName)

RETURN SELF:Get_Array(aSection, NULL_STRING)


METHOD GetInt( cSection AS STRING, cEntry AS STRING ) AS DWORD 
LOCAL dwRet AS DWORD  
  
dwRet:=0

IF SELF:lFileExists
    dwRet := GetPrivateProfileInt( String2Psz( cSection ), String2Psz( cEntry), 0, String2Psz( SELF:FullPath ) ) // Default is 0
ENDIF

  RETURN dwRet

METHOD GetSection(cSection AS STRING) AS ARRAY 
   LOCAL dwBytes, dwEnd, dwPos AS DWORD
   LOCAL cString, cEntry AS STRING
   LOCAL aEntry AS ARRAY

aEntry := {}
IF SELF:lFileExists
//cString := Space(2500)
LOCAL aBytes AS BYTE[]
aBytes := BYTE[]{2500}
dwBytes := GetPrivateProfileSection_New(String2Psz(cSection), aBytes, (DWORD)aBytes:Length, String2Psz(SELF:FullPath))  // Win API call
//cString := Left(cString, dwBytes)// A long string with all Section Entries in it separated by Chr(0)
cString := System.Text.Encoding.Default:GetString(aBytes, 0,(INT)dwBytes)

DO WHILE ( dwEnd := At3( _CHR( 0 ), cString, 2 ) ) > 0
cEntry := Left( cString, dwEnd - 1 )
AAdd( aEntry, cEntry )// Creates Array elements with '=' dividing key from value
cString := SubStr2( cString, dwEnd + 1 )
ENDDO
// Now divide elements in aEntry into subArrays splitting them at the '=' sign
AEvalA(aEntry, {| e | dwPos := At2("=", e), {SubStr3(e,1,dwPos-1), SubStr2(e, dwPos+1)} })
ENDIF

RETURN aEntry


METHOD GetSectionNames() AS ARRAY PASCAL 
LOCAL dwBytes, dwEnd AS DWORD
LOCAL cString, cEntry AS STRING
LOCAL aEntry AS ARRAY

aEntry := {}
IF SELF:lFileExists
//cString := Space(250)
LOCAL aBytes AS BYTE[]
aBytes := BYTE[]{2500}
//dwBytes := GetPrivateProfileSectionNames(PSZ(cString), SLen(cString), PSZ(SELF:FullPath))
//   cString := Left(cString, dwBytes)
dwBytes := GetPrivateProfileSectionNames_New(aBytes, (DWORD)aBytes:Length, String2Psz(SELF:FullPath))
cString := System.Text.Encoding.Default:GetString(aBytes, 0,(INT)dwBytes)

DO WHILE ( dwEnd := At3( _CHR( 0 ), cString, 2 ) ) > 0
cEntry := Left( cString, dwEnd - 1 )
AAdd( aEntry, cEntry )
cString := SubStr2( cString, dwEnd + 1 )
ENDDO
ENDIF

   RETURN aEntry

METHOD GetStringold( cSection AS STRING, cEntry AS STRING, cDefault AS STRING ) AS STRING 
   LOCAL dwBytes AS DWORD
   LOCAL cString AS STRING

IF SELF:_lFileExists
cString := Space(250)
dwBytes := GetPrivateProfileString(String2Psz(cSection), String2Psz(cEntry), String2Psz(cDefault), String2Psz(cString), SLen(cString), String2Psz(SELF:FullPath))      // default is " "
   cString := Left(cString, dwBytes)
ENDIF

RETURN cString        

METHOD GetString( cSection AS STRING, cEntry AS STRING, cDefault AS STRING ) AS STRING 
   LOCAL dwBytes AS DWORD
   LOCAL cString AS STRING

	IF SELF:_lFileExists
		LOCAL p := String2Psz(Space(250)) AS PSZ
		dwBytes := GetPrivateProfileString(String2Psz(cSection), String2Psz(cEntry), String2Psz(cDefault), p, 250, String2Psz(SELF:FullPath))
	   	cString := Left(Psz2String(p), dwBytes)
	ENDIF

RETURN cString

CONSTRUCTOR( cFullPath ) 

SUPER( cFullPath )

IF ! SELF:Extension == ".INI"
SELF:Extension := ".INI"
ELSE
IF Empty( SELF:Drive )  .AND. Empty( SELF:Path )
SELF:FullPath := DiskName() + ":\" + CurDir() + "\" + SELF:FullPath
ENDIF
IF File(SELF:FullPath)
SELF:_lFileExists := TRUE
ENDIF
ENDIF

//  default Ivars
SELF:_lishowstate := SHOWZOOMED

RETURN( SELF )

ACCESS lFileExists 
RETURN SELF:_lFileExists


ACCESS showState 
RETURN SELF:_liShowState


ASSIGN showState( liState ) 
RETURN( SELF:_liShowState := liState )

HIDDEN METHOD Write_Array( cArrayName AS STRING, cKeyRoot AS STRING, aArray AS ARRAY) AS LOGIC 
LOCAL dwCounter, dwLen AS DWORD
LOCAL cType, cValue, cKeyValue AS STRING
LOCAL lSuccess AS LOGIC
lSuccess:=.F.
dwLen := ALen(aArray)
FOR dwCounter := 1 UPTO dwLen
cType := ValType(aArray[dwCounter])
cValue := LTrim(AsString(aArray[dwCounter]))
cKeyValue := cType + "  "
IF Instr(cType, "CDLN")
cKeyValue += cValue
ELSEIF cType == "A"
cKeyValue += "Array"
ELSE
cKeyValue += "Unknown"
ENDIF
lSuccess := SELF:WriteString(cArrayName, cKeyRoot+"."+NTrim(dwCounter), cKeyValue)
SELF:_lFileExists := lSuccess
IF cType == "A"
lSuccess := SELF:Write_Array(cArrayName, cKeyRoot+"."+NTrim(dwCounter), aArray[dwCounter])
ENDIF
NEXT
RETURN lSuccess


METHOD WriteArray(cArrayName AS STRING, aArray AS ARRAY) AS LOGIC 
SELF:DeleteSection(cArrayName)
 RETURN SELF:Write_Array(cArrayName,  NULL_STRING, aArray)


METHOD WriteInt( cSection AS STRING, cEntry AS STRING, iINT AS INT ) AS LOGIC  

SELF:_lFileExists := WritePrivateProfileString( String2Psz( cSection ), String2Psz( cEntry ), String2Psz( AllTrim( Str( iINT ) ) ), String2Psz( SELF:FullPath ) )

RETURN SELF:_lFileExists

METHOD WriteSection(cSection AS STRING, aEntry AS ARRAY) AS LOGIC  // aEntry is built of elements each of Key and Value
LOCAL cString AS STRING
LOCAL dwN AS DWORD

cString := ""
FOR dwN := 1 UPTO ALen(aEntry)
cString += AllTrim(aEntry[dwN,1])+"="+AllTrim(aEntry[dwN,2])+_Chr(0)
NEXT

SELF:_lFileExists := WritePrivateProfileSection( String2Psz(cSection), String2Psz(cString), String2Psz( SELF:FullPath ) )

RETURN SELF:_lFileExists

METHOD WriteString( cSection AS STRING, cEntry AS STRING, cString AS STRING ) AS LOGIC  

SELF:_lFileExists := WritePrivateProfileString( String2Psz( cSection ), String2Psz( cEntry ), String2Psz( cString ), String2Psz( SELF:FullPath ) )

RETURN SELF:_lFileExists



END CLASS
