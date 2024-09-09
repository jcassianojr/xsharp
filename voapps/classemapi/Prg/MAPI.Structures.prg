VOSTRUCT MapiFileDesc align 4

	member ulReserved as dword
	member flFlags as dword
	member nPosition as dword
	member lpszPathName as psz
	member lpszFileName as psz
	member lpFileType as ptr

VOSTRUCT MapiMessage ALIGN 4

	MEMBER ulReserved AS DWORD
	MEMBER lpszSubject AS PSZ
	MEMBER lpszNoteText AS PSZ
	MEMBER lpszMessageType AS PSZ
	MEMBER lpszDateReceived AS PSZ
	MEMBER lpszConversationID AS PSZ
	MEMBER flFlags AS DWORD
	MEMBER lpOriginator AS MapiRecipDesc PTR
	MEMBER nRecipCount AS DWORD
	MEMBER lpRecips AS MapiRecipDesc PTR
	MEMBER nFileCount AS DWORD
	MEMBER lpFiles AS MapiFileDesc PTR

VOSTRUCT MapiRecipDesc align 4

	member ulReserved as dword
	member ulRecipClass as dword
	member lpszName as psz
	member lpszAddress as psz
	member ulEIDSize as dword
	member lpEntryID as ptr

