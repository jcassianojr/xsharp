/*
TEXTBLOCK checagem:Email
   /-*
FUNCTION checkemailScript(cEMAIL)//  "jam@asder.com"    "jam@asder"
     LOCAL o AS OLEAutoObject
     LOCAL lRETU AS LOGIC

  // HB_REGEXLIKE( cRegEx, cEMail ) .or. Empty(cEMAIL)

     o := OleAutoObject{ "VBScript.RegExp"}

     IF o:fInit
     	  o:@@GLOBAL := TRUE
    	  o:ignorecase := TRUE

    	 o:Pattern := "^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$"

    	 IF o:test(cEMAIL)
    	 	lRETU:= .T.
    	 ENDIF
     ENDIF
     o := NULL_OBJECT
     *-/

*/
FUNCTION CheckEmail( cEmail ,LMES)
//criar nova funcao como abaixo para checar o email esta parte checa por caracteres validos e
 LOCAL lReturn := .f.
 LOCAL aCHAR  := {"@","/","?",".","-","=","+","<",">",";","'","[","]","\","|","`","~","!","#","$","%","^","&","*","(",")","_"}
LOCAL X
//CheckEmail( cEmail )
//CheckRegEx abaixo check extrutura

ZNERRO:=0
ZERRO:=""
cEMAIL:=AllTrim(cEMAIL)

IF Empty(cEMAIL)
   ZNERRO:=1
   ZERRO:="Email Nao Preenchido"
ENDIF

lRETURN:=.T.

IF At("@",cEMAIL)=0
   ZNERRO:=2
   ZERRO:="Email sem @"
   lReturn := .f.
ENDIF

IF Occurs("@",cEMAIL)>1
   ZNERRO:=3
   ZERRO:="Email com mais de 1 @"
   lReturn := .f.
ENDIF

FOR X:=1 TO Len(aCHAR)
   IF Left(cEMAIL,1)=aCHAR[X]
      ZNERRO:=4
      ZERRO:="Email sem Iniciando com "+Achar[x]
      lReturn := .f.
      EXIT
   ENDIF
   IF Right(cEMAIL,1)=aCHAR[X]
      ZNERRO:=5
      ZERRO:="Email sem encerrando com "+Achar[x]
      lReturn := .f.
      EXIT
   ENDIF
NEXT

IF At(".",Right(cEMAIL,4))=0  .and. At(".",Right(cEMAIL,3))=0   // .com .ti dominius com 3 ou 2 digitos
   ZNERRO:=6
   ZERRO:="tem que ter ponto . nos 3 ou 4 ultimos digitos"
   lReturn := .f.
ENDIF

IF CheckRegEx(cEmail,"^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$")
ELSE
   ZNERRO:=7
   ZERRO:="erro na nomenclatura geralmente teste@teste.com "
   lReturn := .f.	
ENDIF	


IF ZNERRO>0
   IF lMES
      alert(zerro)
   ENDIF
   RETURN .f.
ENDIF

RETURN  lReturn





