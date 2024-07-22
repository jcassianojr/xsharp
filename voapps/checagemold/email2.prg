// Application : checagem
// email2.prg , Created : 25/02/2023   17:00
// User : jcass_000

FUNCTION IsValidEmail(cEMAIL AS STRING) AS LOGIC   
LOCAL lRETURN AS LOGIC
//#s Check if email string is valid DvK 16-10-2014
//#l Translated from C# from http://msdn.microsoft.com/en-us/library/vstudio/01escwtf%28v=vs.100%29.aspx
cEMAIL:=AllTrim(cEMAIL)
lRETURN:=FALSE
IF (STRING.IsNullOrEmpty(cEMAIL))
	RETURN FALSE
ENDIF
System.Text.RegularExpressions.Regex.Replace(cEMAIL, "(@)(.+)$", System.Text.RegularExpressions.MatchEvaluator{ SELF, @DomainMapper() })
//IF .NOT. lReturn
//	RETURN FALSE
//ENDIF
RETURN System.Text.RegularExpressions.Regex.IsMatch(cEMAIL, "^(?("+Chr(34)+")("+Chr(34)+"[^"+Chr(34)+"]+?"+Chr(34)+"@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&"+Chr(39)+"\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9]{2,17}))$", System.Text.RegularExpressions.RegexOptions.IgnoreCase)


FUNCTION DomainMapper(match AS System.Text.RegularExpressions.Match) AS STRING
//#s Used by IsValidEmail DvK 16-10-2014

LOCAL idn AS System.Globalization.IdnMapping
LOCAL domainName AS STRING
	idn := System.Globalization.IdnMapping{}
	domainName := match:Groups:Item[2]:Value
	TRY
		domainName := idn:GetAscii(domainName)
	CATCH e AS System.ArgumentException
//		LOCAL cMessage:=e:Message AS STRING
		//SELF:lInvalid := TRUE
	END TRY
RETURN STRING.Concat(match:Groups:Item[1]:Value, domainName)

