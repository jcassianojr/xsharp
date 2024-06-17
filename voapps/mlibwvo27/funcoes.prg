USING System.Net        
USING System.Text.RegularExpressions
USING System.Security.Cryptography

FUNCTION PEGINIVAL(cARQ,cSEC,cCAM)
LOCAL oINIFILE AS IniFileSpec
LOCAL cVAR AS STRING
oINIFILE:=INIFILESPEC{cARQ}
cVAR:=oINIFILE:GetString(cSEC,cCAM,"")
RETURN cVAR    
FUNCTION CheckPass(Ctexto,lMES)
LOCAL nI,lMAIS,lMINUS,lDIG,lSYMBOL
lMAIS   := .F.
lMINUS  := .F.
lDIG    := .F.
lSYMBOL := .F.
IF ValType(lMES)#"L"
    lMES:=.T.
ENDIF
IF Len(AllTrim(cTEXTO))<8
   IF lMES
      ALERTX("Minimo 8 Caracteres")
   ENDIF
   RETURN .F.
ENDIF

FOR nI := 1 TO Len(cTexto)
	IF SubStr ( cTEXTO, nI, 1 ) $ 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
       lMAIS :=.T.
    ENDIF
  	IF SubStr ( cTEXTO, nI, 1 ) $ 'abcdefghijklmnopqrstuvwxyz'
       lMINUS :=.T.
    ENDIF
    IF SubStr ( cTEXTO, nI, 1 ) $ '0123456789'
       lDIG :=.T.
    ENDIF
    IF SubStr ( cTEXTO, nI, 1 ) $ '-+_!@#$%^&*., ?'
       lSYMBOL :=.T.
    ENDIF  
NEXT
IF lMAIS .AND. lMINUS .AND. lDIG .AND. lSYMBOL
   RETURN .T.
ELSE
  IF ! lMAIS .AND. lMES
     alertx(" Sem uma maiuscula")
   ENDIF
   IF ! lMinus  .AND. lMES
     alertx(" Sem uma minuscula")
   ENDIF 
    IF ! lDIG  .AND. lMES
     alertx(" Sem um numero")
   ENDIF 
    IF ! lSYMBOL  .AND. lMES
     alertx(" Sem um simbulo -+_!@#$%^&*., ?")
   ENDIF
ENDIF
RETURN .F.

FUNCTION AsStringStrVal(xdado)
RETURN  Strval(xdado,,,FALSE)
FUNCTION CAMINEX(cARQ,nMES,nANO,nEMPRESA)
cARQ:=StrTran(cARQ,"[Z]",StrZero(nEMPRESA,1))
cARQ:=StrTran(cARQ,"[ZZ]",StrZero(nEMPRESA,2))
cARQ:=StrTran(cARQ,"[ZZZ]",StrZero(nEMPRESA,3))
RETU cARQ
FUNCTION convun(nQTDE,cUNID)
DO CASE
   CASE cUNID="CT" ; nQTDE:=nQTDE*100
   CASE cUNID="ML" ; nQTDE:=nQTDE*1000
   CASE cUNID="T"  ; nQTDE:=nQTDE*1000
ENDCASE
RETU nQTDE

FUNCTION DECODE(cVAR AS STRING, nCAR AS BYTE,lCONVOEM AS LOGIC) AS STRING      
LOCAL ADJVAL     AS BYTE
LOCAL counter    AS DWORD
LOCAL in_len     AS DWORD
LOCAL out_string AS STRING
LOCAL nASC       AS INT
ADJVAL:=30        //Chave de criptografacao
IF lCONVOEM
   cVAR:=Ansi2Oem(cVAR)
ENDIF	
cVAR := AllTrim(cVAR)
in_len := Len(cVAR)
IF Empty(cVAR) .OR. IN_LEN<1
   RETU PadR(cVAR,nCAR)
ENDIF
FOR counter:= IN_LEN DOWNTO 1
    //out_string:=out_string+CHR((Asc(SubStr(cVAR,counter,1))/2)-ADJVAL)
    nASC:=Asc(SubStr(cVAR,counter,1))
    IF nASC<85            //-255 gerava caracteres de controle minimo = 32 espaco 255-32=223 usando 220 z(122)=304 - 220 = 84
        nASC:= nASC +220  // z ultimo valor aceitaVel
    ENDIF
    nASC := INT(nASC /2)
    nASC := nASC - ADJVAL
    out_string := out_string + Chr(nASC)
NEXT
RETURN PadR(out_string,nCAR)	
FUNCTION DECODED(cVAR AS STRING,lCONVOEM AS LOGIC) AS DATE
LOCAL dDAT AS DATE
cVAR:=DECODE(cVAR,8,lCONVOEM)
dDAT:=SToD(String2Psz(cVAR))
RETURN dDAT

FUNCTION DIVIDIR(nDIVIDIR,nDIVISOR,nCAS,nDEC)
LOCAL nVA3 AS FLOAT
nVA3:=0
IF nDIVIDIR#0  .AND. nDIVISOR#0
   nVA3:=nDIVIDIR/nDIVISOR
   IF ValType(nCAS)="N"  .AND. ValType(nDEC)="N"
      nVA3:=FloatFormat(nVA3,nCAS,nDEC)
   ENDIF
ENDIF
RETU nVA3


FUNCTION ENCODE(cVAR AS STRING,nCAR AS BYTE,lCONVOEM AS LOGIC,lUPPER AS LOGIC) AS STRING
LOCAL ADJVAL     AS BYTE
LOCAL counter    AS DWORD
LOCAL in_len     AS DWORD
LOCAL next_char  AS STRING
LOCAL out_string AS STRING
LOCAL nASC       AS DWORD
IF ValType(lUPPER)<>"L"
   lUPPER:=.T.
ENDIF

ADJVAL:=30        //Chave de criptografacao
IF lCONVOEM
   cVAR:=Ansi2Oem(cVAR)
ENDIF	
cVAR   := AllTrim(cVAR)
IF lUPPER
   cVAR   := Upper(cVAR)
ENDIF

in_len := Len(cVAR)
IF Empty(cVAR).OR.IN_LEN<1
   RETURN PadR(cVAR,nCAR)
ENDIF
FOR  COUNTER:= IN_LEN DOWNTO  1
   next_char:= SubStr(cVAR, COUNTER, 1)
   IF  IsDigit(String2Psz(next_char)) .OR. IsAlpha(String2Psz(next_char))   .OR.  next_char $ '-+_!@#$%^&*., ?'
        //out_string:=out_string+CHR((Asc(next_char)+ADJVAL)*2)
        nASC:= (Asc(next_char) + ADJVAL) * 2
        IF nASC>255
            nASC:=nASC-220  //-255 gerava caracteres de controle minimo = 32 espaco 255-32=223 usando 220 z(122)=304 - 220 = 84
                                 // z ultimo valor aceitabel
         ENDIF
        out_string := out_string + Chr(nASC)  //CHR((ASC(next_char) + ADJVAL) * 2)
   ENDIF
NEXT
RETURN out_string
//RETURN PadR(out_string,nCAR)




FUNCTION ENCODED(dDAT AS DATE,lCONVOEM,lUPPER) AS STRING
LOCAL cVAR AS STRING
cVAR:=DToS(dDAT)
cVAR:=ENCODE(cVAR,8,LCONVOEM,lUPPER)
RETU cVAR

FUNCTION entramenu(cGRU,nPOS,cARQ)
LOCAL lRETU:=.F.
LOCAL aDAD AS ARRAY
LOCAL oARQ AS  USEREDE
LOCAL cBUSCA AS STRING 
LOCAL cBUSCA2 AS STRING
LOCAL Otb AS textbox
IF ValType(cARQ)#"C"
   cARQ:="MUSERW.DBF"	
ENDIF
IF zUSER="SUPERVISOR" .OR. zUSER="ADMIN" //.OR. zUSER="SOFTEC"
   RETURN .T.
ENDIF	
cBUSCA:=AllTrim(cGRU+StrZero(nPOS,3)+zUSER)
cBUSCA:=ENCODE(cBUSCA,20,.T.,.T.)
cBUSCA2:=PadR(cGRU,3)+StrZero(nPOS,3)+zUSERCHV
aDAD:={zCURINI,cARQ,zCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:USED 
   oARQ:SetOrder(1)
   oARQ:GOTOP()
   IF oARQ:sEEK(cBUSCA) 
      Lretu:=.T.
   ENDIF 
   OARQ:SetOrder(2)
   oARQ:GOTOP()
   IF oARQ:sEEK(cBUSCA2) 
      Lretu:=.T.
   ENDIF
   oARQ:CLOSE()
ENDIF
IF ! lRETU
   Otb:=TEXTBOX{,"Erro",cGRU+" "+StrZero(nPOS,3)+" VocÍ n„o tem acesso - Contate o Administrador"}
   Otb:show()	
ENDIF	
IF lRETU
	GRAVALOG(Str(nPOS),"MNU",cGRU)
ENDIF	
RETU lRETU	

FUNCTION FilePrint(oOWNER,cFileNm AS STRING,cMode AS STRING) AS LOGIC
        LOCAL lFuncResult := TRUE AS LOGIC
        LOCAL nFout AS PTR
        IF File(cFileNm)
//                nFout := ShellExecute(MyShellWindow():Handle(),PSZ("print"),PSZ(cFileNm),PSZ(""),PSZ(""),SW_SHOWNORMAL)
//ShellExecute ( NIL, "Open", cDANFEVIEW+"danfeview.exe", cARQIMP, cDANFEVIEW, SW_SHOWNORMAL )
//ShellExecute ( NIL, funcao, arquivo, parametros, diretorio, tipo de janela )
             //   nFout := ShellExecute(oOWNER:Handle(),String2Psz("print"),String2Psz(cFileNm),String2Psz(""),String2Psz(""),SW_SHOWNORMAL)   
               nFout := ShellExecute(NIL,String2Psz("print"),String2Psz(cFileNm),String2Psz(""),String2Psz(""),SW_SHOWNORMAL)   
                ShellExecuteErro(nFout) 
  //              IF INT(@nFout) <= 32
   //                  lFuncResult := FALSE
  //              ENDIF
   //     ELSE
   //             lFuncResult := FALSE
        ENDIF
RETURN lFuncResult

FUNCTION FIXDATA(cCAMPO)
IF IsNil(cCAMPO)
   RETU CToD(Space(8))
ELSE
   IF ValType(cCAMPO)="D"	
   	  RETURN cCAMPO
   ENDIF	
   cCAMPO:=Left(cCAMPO,10)
   cCAMPO:=StrTran(cCAMPO,"-","")
   cCAMPO:=SToD(cCAMPO)
ENDIF	
RETU cCAMPO

FUNCTION FIXHORA(cCampo)
cCAMPO:=FIXSTR(cCAMPO)
cCAMPO:=SubStr(cCAMPO,At(" ",cCAMPO)+1)
cCAMPO:=Left(cCAMPO,5)
cCAMPO:=StrTran(cCAMPO,":",".")
RETU cCAMPO

FUNCTION FIXLOGIC(cCAMPO)
IF IsNil(cCAMPO)
   RETU .f.
ENDIF	
RETU cCAMPO

FUNCTION FIXNUM(cCAMPO)
IF IsNil(cCAMPO)
   RETU 0
ENDIF	
RETU cCAMPO

FUNCTION FIXSTR(cCAMPO,lOEM)
IF IsNil(cCAMPO)
   RETU ""	
ENDIF	
IF ValType(lOEM)#"L"
   lOEM:=.F.
ENDIF
IF lOEM
   cCAMPO:=Ansi2Oem(cCAMPO)	
ENDIF
RETU cCAMPO

FUNCTION GRAVALOG(cERRO,cOPR,cARQ)
//	FUNCTION GRAVALOG(cERRO,cOPR,cARQ,cUSER,cCURINI,cCURDIR)
LOCAL oMANERR AS USEREDE	
LOCAL aRET AS ARRAY
IF ValType(cERRO)="U"
   cERRO:=""
ENDIF
IF ValType(cOPR)="U"
   cOPR:=""
ENDIF
IF ValType(cARQ)="U"
   cARQ:=Alias()
ENDIF
cERRO:=AllTrim(Strval(cERRO))
cERRO:=StrTran(cERRO," ","")
aRET:={zCURINI,"MANERR.DBF",zCURDIR}
oMANERR:=USEREDE{aRET}
IF oMANERR:nERRO#0
   RETURN .F.
ENDIF
oMANERR:Append()
oMANERR:FIELDPUT("USUARIO",zUSER)
oMANERR:FIELDPUT("DATA",Today())
oMANERR:FIELDPUT("HORA",Time())
oMANERR:FIELDPUT("ERRO",cERRO)
oMANERR:FIELDPUT("ARQUIVO",cARQ)
oMANERR:FIELDPUT("OPR",cOPR)
oMANERR:CLOSE()
RETURN .T.


FUNCTION GRVVAL( nVAL, nTAM, nDEC )
LOCAL cVAR := ""
cVAR := StrZero( nVAL, nTAM + 1, nDEC )                     //mAIS 1 por causa do ponto
cVAR := StrTran( cVAR, ".", "" )
RETU cVAR

FUNCTION HB_OSNEWLINE()
RETURN Chr(13)+Chr(10)

FUNCTION INCDEC(eVAR,nSUM,nINF,nSUP)
LOCAL nRETU
IF ValType(eVAR)#"N"
   eVAR:=Val(eVAR)
ENDIF
IF ValType(nSUM)#"N"
   nSUM:=1
ENDIF
nRETU:= eVAR+nSUM
IF ValType(nINF)="N"
   IF nRETU<nINF
        nRETU:=nINF
   ENDIF
ENDIF
IF ValType(nSUP)="N"
   IF nRETU>nSUP
      nRETU:=nSUP
   ENDIF
ENDIF
RETU nRETU

FUNCTION ListAsArray( cList AS STRING , cDelimiter  )  AS ARRAY
LOCAL nPos AS DWORD, aList := {} AS ARRAY
IF ValType(cDelimiter)#"C"
   cDelimiter:=","
ENDIF
WHILE ( nPos := At( cDelimiter, cList)) != 0
  AAdd( aList , SubStr( cList,1,nPos-1 ))
  cList := SubStr(cList, nPos+1)
ENDDO
AAdd(aList , cList)
RETURN aList

FUNCTION PEGCOMBO(cARQ AS STRING,cDIZ AS STRING,cRET AS STRING)
LOCAL aRETU:={}
LOCAL aDAD AS ARRAY
LOCAL oARQ AS  USEREDE
aDAD:={zCURINI,cARQ,zCURDIR}
oARQ:=USEREDE{aDAD}
IF oARQ:USED
    oARQ:GOTOP()
    WHILE ! OARQ:EOF
          AAdd(aRETU,{oARQ:FIELDGET(cDIZ),oARQ:FIELDGET(cRET)})
          oARQ:SKIP()
    ENDDO
    oARQ:CLOSE()
ENDIF
RETU aRETU

FUNCTION PEGEMPMIG(nEMPRESA)
LOCAL cMIG AS STRING
LOCAL aDAD AS ARRAY
LOCAL oMANA5 AS USEMANA5
cMIG:=StrZero(nempRESA,2)
aDAD:={zCURINI,"MANEMP",zCURDIR,aDIR}
oMANA5:=USEMANA5{aDAD}
IF oMANA5:nERRO=0
   oMANA5:GOTOP()
   IF oMANA5:SEEK(nEMPRESA)
   	  IF ! Empty(oMANA5:FIELDGET("CODEMPMIG"))
         cMIG:=oMANA5:FIELDGET("CODEMPMIG")
      ENDIF
   ENDIF
   oMANA5:CLOSE()
ENDIF
RETU cMIG

FUNCTION PERC(nBAS,nDIV,nDEC)
LOCAL nPER:=0
IF nBAS>0  .AND. nDIV>0
   IF nBAS=nDIV
      nPER := 100
   ELSE
      nPER := Round( nBAS / nDIV  * 100,nDEC )
   ENDIF
ENDIF
RETU nPER

FUNCTION SIMNAO(cVALOR,aVAL)
LOCAL nPOS AS DWORD
IF ValType(aVAL)#"A"
   aVAL:={"S","N"}
ENDIF
nPOS:=AScan(aVAL,cVALOR)
IF nPOS=0
   nPOS:=1
ELSE
   nPOS++
ENDIF
IF nPOS>Len(aVAL)
   nPOS:=1
ENDIF
RETU aVAL[nPOS]

FUNCTION sonumeros(cInString,lPONTO,lVIRGULA)
LOCAL nIter,cThisLetter
LOCAL nLenString := Len(cInString)
LOCAL cOutValue := ''
LOCAL cCompString:='0123456789'
IF ValType(cInString)<>"C"
   cInString:=Strval(cInString)
ENDIF
IF ValType(lPONTO)="L"
   IF lPONTO
      cCompString+="."
   ENDIF	
ENDIF
IF ValType(lVIRGULA)="L"
   IF lVIRGULA
      cCompString+=","
   ENDIF	
ENDIF
FOR nIter := 1 TO nLenString
  cThisLetter := SubStr(cInString,nIter,1)
  IF cThisLetter$cCOMPSTRING
    cOutValue += cThisLetter
  ENDIF
NEXT
RETURN cOutValue
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

/*   IF ValType(lANSI)<>"L"
//      lAnsi:=.F.
//   ENDIF
//   IF ValType(lTUDO)<>"L"
      lTudo:=.T.
   ENDIF

   IF lAnsi
      cStr := StrTran(cStr, "·", "&aacute;")
      cStr := StrTran(cStr, "¡", "&Aacute;")
      cStr := StrTran(cStr, "‡", "&agrave;")
      cStr := StrTran(cStr, "¿", "&Agrave;")
      cStr := StrTran(cStr, "È", "&eacute;")
      cStr := StrTran(cStr, "…", "&Eacute;")
      cStr := StrTran(cStr, "Ë", "&egrave;")
      cStr := StrTran(cStr, "»", "&egrave;")
      cStr := StrTran(cStr, "Ì", "&iacute;")
      cStr := StrTran(cStr, "Õ", "&Iacute;")
      cStr := StrTran(cStr, "Ï", "&igrave;")
      cStr := StrTran(cStr, "Ã", "&Igrave;")
      cStr := StrTran(cStr, "Û", "&oacute;")
      cStr := StrTran(cStr, "”", "&Oacute;")
      cStr := StrTran(cStr, "Ú", "&ograve;")
      cStr := StrTran(cStr, "“", "&Ograve;")
      cStr := StrTran(cStr, "˙", "&uacute;")
      cStr := StrTran(cStr, "⁄", "&Uacute;")
      cStr := StrTran(cStr, "˘", "&ugrave;")
      cStr := StrTran(cStr, "Ÿ", "&Ugrave;")
      cStr := StrTran(cStr, "‚", "&acirc;")
      cStr := StrTran(cStr, "¬", "&Acirc;")
      cStr := StrTran(cStr, "Í", "&ecirc;")
      cStr := StrTran(cStr, " ", "&Ecirc;")
      cStr := StrTran(cStr, "Ù", "&ocirc;")
      cStr := StrTran(cStr, "‘", "&Ocirc;")
      cStr := StrTran(cStr, "„", "&atilde;")
      cStr := StrTran(cStr, "√", "&Atilde;")
      cStr := StrTran(cStr, "ı", "&otilde;")
      cStr := StrTran(cStr, "’", "&Otilde;")
      cStr := StrTran(cStr, "Á", "&ccedil;")
      cStr := StrTran(cStr, "«", "&Ccedil;")
      cStr := StrTran(cStr, "ˇ", "&yuml;")
      cStr := StrTran(cStr, "ˆ", "&ouml;")
      cStr := StrTran(cStr, "÷", "&Ouml;")
      cStr := StrTran(cStr, "Ò", "&ntilde;")
      cStr := StrTran(cStr, "—", "&Ntilde;")
      cStr := StrTran(cStr, "¸", "&uuml;")
      cStr := StrTran(cStr, "‹", "&Uuml;")
      cStr := StrTran(cStr, "∫", "&deg;")
      cStr := StrTran(cStr, "∞", "&deg;")
      cStr := StrTran(cStr, "™", "&ordf;")
   ELSE
//      cStr := StrTran(cStr, "†", "&aacute;")
      cStr := StrTran(cStr, "µ", "&Aacute;")
      cStr := StrTran(cStr, "Ö", "&agrave;")
      cStr := StrTran(cStr, "∑", "&Agrave;")
      cStr := StrTran(cStr, "Ç", "&eacute;")
      cStr := StrTran(cStr, "ê", "&Eacute;")
      cStr := StrTran(cStr, "ä", "&egrave;")
      cStr := StrTran(cStr, "‘", "&Egrave;")
      cStr := StrTran(cStr, "°", "&iacute;")
      cStr := StrTran(cStr, "÷", "&Iacute;")
      cStr := StrTran(cStr, "ç", "&igrave;")
      cStr := StrTran(cStr, "ﬁ", "&Igrave;")
      cStr := StrTran(cStr, "¢", "&oacute;")
      cStr := StrTran(cStr, "‡", "&Oacute;")
      cStr := StrTran(cStr, "ï", "&ograve;")
      cStr := StrTran(cStr, "„", "&Ograve;")
      cStr := StrTran(cStr, "£", "&uacute;")
      cStr := StrTran(cStr, "È", "&Uacute;")
      cStr := StrTran(cStr, "ó", "&ugrave;")
      cStr := StrTran(cStr, "Î", "&Ugrave;")
      cStr := StrTran(cStr, "É", "&acirc;")
      cStr := StrTran(cStr, "∂", "&Acirc;")
      cStr := StrTran(cStr, "à", "&ecirc;")
      cStr := StrTran(cStr, "“", "&Ecirc;")
      cStr := StrTran(cStr, "ì", "&ocirc;")
      cStr := StrTran(cStr, "‚", "&Ocirc;")
      cStr := StrTran(cStr, "∆", "&atilde;")
      cStr := StrTran(cStr, "«", "&Atilde;")
      cStr := StrTran(cStr, "‰", "&otilde;")
      cStr := StrTran(cStr, "Â", "&Otilde;")
      cStr := StrTran(cStr, "á", "&ccedil;")
      cStr := StrTran(cStr, "Ä", "&Ccedil;")
      cStr := StrTran(cStr, "ò", "&yuml;")
      cStr := StrTran(cStr, "î", "&ouml;")
      cStr := StrTran(cStr, "ô", "&Ouml;")
      cStr := StrTran(cStr, "§", "&ntilde;")
      cStr := StrTran(cStr, "•", "&Ntilde;")
      cStr := StrTran(cStr, "Å", "&uuml;")
      cStr := StrTran(cStr, "ö", "&Uuml;")
      cStr := StrTran(cStr, "ß", "&deg;")
      cStr := StrTran(cStr, "¯", "&deg;")
      cStr := StrTran(cStr, "¶", "&ordf;")
   ENDIF
*/
RETURN cStr

FUNCTION StrTRIM(nVAL,nCAS,nDEC)
IF ValType(nDEC)#"N"
   nDEC:=0
ENDIF	
IF ValType(nVAL)#"N" .OR. ValType(nCAS)#"N"
   RETU ""
ENDIF	
RETU StrTran(AllTrim(Str(nVAL,nCAS,nDEC))," ","")

FUNCTION Strval(xdado,nLEN,nDEC,lBOLPTB)
LOCAL retval:=""
LOCAL cType := ValType( xDADO )
IF ValType(lBOLPTB)<>"L"
   lBOLPTB:=TRUE
ENDIF	
DO CASE
   CASE CType="C"  .or. ctype="M" ;  retval := xdado //caracter memo
   CASE CType="D" ;  retval := DToC(xdado)         //data
   CASE CType="N" .or. ctype="F"  //numerico float
        DO CASE
           CASE ValType(nLEN)="N" .AND. ValType(nDEC)="N"
               retval := Str(xdado,nLEN,nDEC)
           CASE ValType(nLEN)="N"
               retval := Str(xdado,nLEN)
           OTHERWISE
               retval := Str(xdado)
        ENDCASE
   CASE CType = "L" .or. ctype="B"
   	    IF lBOLPTB
           retval := IF(xdado,"Sim","Nao") //logico ou boleano
        ELSE
	       retval := IF(xdado,"T","F") //logico ou boleano
	    ENDIF

   OTHERWISE      ;  retval := ""
ENDCASE
RETURN(retval)


FUNCTION Text2Rtf(cTxt AS STRING) AS STRING
//(cTxt AS STRING,cFont AS STRING,nPnt AS INT)
LOCAL oRTF      AS Richedit

ortf := richedit{GetForegroundWindow(),1,Point{0,0},Dimension{0,0}}
//ortf:Font(Font{,nPnt,cFont},FALSE)
oRtf:paste(cTxt)

cTxt := ortf:Value
ortf:destroy()

RETURN cTxt

FUNCTION TIPOCONN(carq)
LOCAL aRETU AS ARRAY
LOCAL cTIPO,CSERVER,cPORTA,cTABELA,cUSUARIO,cSENHA,cSQL AS STRING
aRETU:={"DBF"}
cTIPO:=PEGINIVAL(ZCURINI,cARQ,"TIPOCONN")
IF cTIPO="MYSQLDIR"
	CSERVER:=PEGINIVAL(ZCURINI,"MYSQL","SERVER")
    cPORTA:=PEGINIVAL(ZCURINI,"MYSQL","PORTA")
    cTABELA:=PEGINIVAL(ZCURINI,"MYSQL","TABELA")
    cUSUARIO:=PEGINIVAL(ZCURINI,"MYSQL","USUARIO")
    cSENHA:=PEGINIVAL(ZCURINI,"MYSQL","SENHA")
    cSQL:=PEGINIVAL(ZCURINI,cARQ,"SQL")
   	ARETU:={"MYSQLDIR",CSERVER,cPORTA,cTABELA,cUSUARIO,cSENHA,cSQL}
ENDIF	
IF cTIPO="ODBC"
	CSERVER:=PEGINIVAL(ZCURINI,"ODBC","SERVER")
    cPORTA:=PEGINIVAL(ZCURINI,"ODBC","PORTA")
    cTABELA:=PEGINIVAL(ZCURINI,"ODBC","TABELA")
    cUSUARIO:=PEGINIVAL(ZCURINI,"ODBC","USUARIO")
    cSENHA:=PEGINIVAL(ZCURINI,"ODBC","SENHA")
    cSQL:=PEGINIVAL(ZCURINI,cARQ,"SQL")
   	ARETU:={"ODBC",CSERVER,cPORTA,cTABELA,cUSUARIO,cSENHA,cSQL}
ENDIF	
RETU aRETU

FUNCTION TIRAOUT(TEXTO)
texto := StrTran( texto, ".", "" )
texto := StrTran( texto, ":", "" )
texto := StrTran( texto, "-", "" )
texto := StrTran( texto, "/", "" )
texto := StrTran( texto, "*", "" )
RETU texto

FUNCTION Token (cString, nElement, cTrenn) AS STRING
	// Token ("Eins, Zwei, Drei", 3) -> "Drei"
   LOCAL i AS DWORD

   Default (@cTrenn, ",")

	// Token ("a,b,c", 5) -> ""
	IF SLen (cString) - SLen (StrTran (cString, cTrenn)) + 1 < nElement
		RETURN ""
	ENDIF

   FOR i:=1 UPTO nElement-1
      cString := SubStr2 (cString, At2 (cTrenn, cString) + 1)
   NEXT i
   i := At2 (cTrenn, cString)

	RETURN IIF (i==0, SubStr2 (cString, 1), SubStr3 (cString, 1, i-1))
	


FUNCTION TRUNCAR(Arg1,nCAS)
LOCAL Local1, Local2 , nMUL ,vdpos
IF ValType(nCAS)#"N"
   nCAS:=2
ENDIF	
LOCAL1:=0
LOCAL2:=0
nMUL:=10^nCAS
vdpos:= At(".", Str(Arg1 * nMUL)) - 1
IF (vdpos > 0)
    Local2:= Val(SubStr(Str(Arg1 * nMUL), 1, vdpos))
    Local1:= Local2 / nMUL
ELSE
    Local1:= Arg1
ENDIF
RETURN Local1


FUNCTION ufCheck( cUF AS STRING ) AS LOGIC

	LOCAL lValid := FALSE		AS LOGIC
	LOCAL aUF AS ARRAY
	
	
    aUF    := { "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO","EX", ;
               "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR","XX", ;
               "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO",""," ","  "}

   lValid := TRUE
   IF AScan(AUF,cUF)=0
      lValid := FALSE
   ENDIF	





    IF ! lVALID
       alert("Estado Invalido")
   	ENDIF
	//
	RETURN lValid

FUNCTION WriteData2Printer (cPrinter AS STRING, cData AS STRING) AS LOGIC PASCAL
        LOCAL lResult    AS LOGIC
        LOCAL hPrinter   AS PTR
        LOCAL pszPrinter AS PSZ
        LOCAL pBuffer    AS PTR
        LOCAL dwWritten  AS DWORD
     //   LOCAL uValue     AS USUAL
        LOCAL pDocInfo   IS _winDoc_Info_1
        LOCAL pPtrDflts  IS _WINPRINTER_DEFAULTS


        pPtrDflts.DesiredAccess := PRINTER_ACCESS_USE
        pPtrDflts.pDatatype     := NULL
        pPtrDflts.pDevMode      := NULL

        lResult    := FALSE
        pszPrinter := StringAlloc(cPrinter + _CHR(0))
        IF OpenPrinter(pszPrinter, @hPrinter, @pPtrDflts)

//                For ANSI-Printing:
//                cData := Oem2Ansi(cData)

                pBuffer := StringAlloc(cData + _CHR(0))
                pDocInfo.pDocName    := String2Psz("PrinterSpooler Document")
                pDocInfo.pOutPutFile := NULL_PSZ
                pDocInfo.pDatatype   := String2Psz("RAW")
                IF StartDocPrinter(hPrinter, 1, @pDocInfo) <> 0
                        IF WritePrinter(hPrinter, pBuffer, SLen(cData), @dwWritten)
                                IF dwWritten == SLen(cData)
                                        lResult := TRUE
                                ENDIF
                        ELSE
                                dwWritten := GetLastError()                                       
                        ENDIF
                        EndDocPrinter(hPrinter)
                ELSE
                        dwWritten := GetLastError()
                ENDIF
                ClosePrinter(hPrinter)
                MemFree(pBuffer)
        ELSE
                dwWritten := GetLastError()
        ENDIF
        MemFree(pszPrinter)

        RETURN lResult
 
 
 //FUNCTION CheckRegEx( cTEXTO AS STRING,cExpression AS STRING)         //a ser implantada
 //	RETURN TRUE    

//FUNCTION mysha256(cTEXTO AS STRING)  
//LOCAL oCHAVE //AS System.Security.Cryptography.SHA256   
//oCHAVE:= 
    
FUNCTION CheckRegEx( cTEXTO AS STRING,cExpression AS STRING)
	
//LOCAL oRegex AS clsHs_RegEx
LOCAL lMatch AS LOGIC
LOCAL oRegex AS System.Text.RegularExpressions.Regex

lMATCH := FALSE


IF SLen( cExpression ) == 0
 // ErrBox( SELF, "no expression" )
  RETURN  FALSE
ENDIF
IF SLen( cTEXTO ) == 0
 // ErrBox( SELF, "no test value" )
//  SELF:SetFocusDelayed( oTest )
  RETURN  FALSE
ENDIF
//debOut( "Compare " + cTest + " to " + cExpression ) 
//Regex validateEmailRegex = NEW Regex(cExpression);
//oRegex:=Regex{cExpression};        
//lMATCH:=oRegex:IsMatch(cEMAIL)
 //oRegex := clsHs_RegEx{ cExpression, 3 }
//lMatch := oRegex:Match( cTEXTO)
//oRegex:CleanUp()   

  //       lmatch := regex.Match(ctexto)
//lMatch:= TRUE     
oRegex:=Regex{cExpression}

IF  oregex:isMatch(ctexto)  
 // oResult:Value := "fits" 
   lMatch := TRUE
ELSE 
	NOP
//  oResult:Value := "does NOT fit"
ENDIF
RETURN lMatch  

FUNCTION ShellExecuteErro(ptrShEx)   
LOCAL  sShEx AS STRING
IF ptrShEx > 32    .or.  ptrShEx<0     
    RETURN TRUE
ENDIF
DO CASE
	CASE ptrShEx = 0
		sShEx := "The operating system is out of memory or resources."
	CASE ptrShEx = ERROR_FILE_NOT_FOUND    //2
		sShEx := "The specified file was not found."
	CASE ptrShEx = ERROR_PATH_NOT_FOUND   //3
		sShEx := "The specified path was not found."
	CASE ptrShEx = ERROR_BAD_FORMAT    //11
		sShEx := "The .EXE file is invalid (non-Win32 .EXE or error in .EXE image)."
	CASE ptrShEx = SE_ERR_ACCESSDENIED   //5
		sShEx := "The operating system denied access to the specified file."
	CASE ptrShEx = SE_ERR_ASSOCINCOMPLETE  //27
		sShEx := "The filename association is incomplete or invalid."
	CASE ptrShEx = SE_ERR_DDEBUSY   //30
		sShEx := "The DDE transaction could not be completed because other DDE transactions were being processed."
	CASE ptrShEx = SE_ERR_DDEFAIL  //29
		sShEx := "The DDE transaction failed."
	CASE ptrShEx = SE_ERR_DDETIMEOUT      //28
		sShEx := "The DDE transaction could not be completed because the request timed out."
	CASE ptrShEx = SE_ERR_DLLNOTFOUND
		sShEx := "The specified dynamic-link library was not found."
    CASE ptrShEx = SE_ERR_FNF
		sShEx := "The specified file was not found."
	CASE ptrShEx = SE_ERR_NOASSOC  //31
		sShEx := "There IS no application associated with the given filename extension."
	CASE ptrShEx =  SE_ERR_OOM
		sShEx := "There was not enough memory to complete the operation."
	CASE ptrShEx =  SE_ERR_PNF
		sShEx := "The specified path was not found."
	CASE ptrShEx =  SE_ERR_SHARE
		sShEx := "A sharing violation occurred."
ENDCASE
   ALERTX("ERRO shellexecute "+ sShEx)
RETURN .F.


