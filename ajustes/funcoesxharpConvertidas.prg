USING System.Net        
USING System.Text.RegularExpressions
USING System.Security.Cryptography


FUNCTION str2html( cStr, lAnsi, lOEM )   
IF lANSI  
	cSTR:=Oem2Ansi(cSTR)
ENDIF	
IF lOEM  
	cSTR:=Ansi2Oem(cSTR)
ENDIF	
cSTR:=WebUtility.HtmlEncode(cSTR)
RETURN cStr

FUNCTION html2STR( cStr, lAnsi, lOEM )  
cSTR:=WebUtility.HtmlDEcode(cSTR)	 
IF lANSI  
	cSTR:=Oem2Ansi(cSTR)
ENDIF	
IF lOEM  
	cSTR:=Ansi2Oem(cSTR)
ENDIF	
RETURN cSTR


FUNCTION str2html( cStr, lAnsi, lOEM )   
IF lANSI  
	cSTR:=Oem2Ansi(cSTR)
ENDIF	
IF lOEM  
	cSTR:=Ansi2Oem(cSTR)
ENDIF	
cSTR:=WebUtility.HtmlEncode(cSTR)
RETURN cStr

    
FUNCTION CheckRegEx( cTEXTO AS STRING,cExpression AS STRING)
LOCAL lMatch AS LOGIC
LOCAL oRegex AS System.Text.RegularExpressions.Regex

lMATCH := FALSE


IF SLen( cExpression ) == 0
  RETURN  FALSE
ENDIF
IF SLen( cTEXTO ) == 0
  RETURN  FALSE
ENDIF
oRegex:=Regex{cExpression}

IF  oregex:isMatch(ctexto)  
   lMatch := TRUE
ELSE 
	NOP
ENDIF
RETURN lMatch  



