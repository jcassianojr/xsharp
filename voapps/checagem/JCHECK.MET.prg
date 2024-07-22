#region DEFINES
STATIC DEFINE JCHECK_AGENCIA := 117 
STATIC DEFINE JCHECK_BANCO := 116 
STATIC DEFINE JCHECK_CARTAO := 126 
STATIC DEFINE JCHECK_CEI := 111 
STATIC DEFINE JCHECK_CGC := 100 
STATIC DEFINE JCHECK_CHECKCARTAO := 127 
STATIC DEFINE JCHECK_CHECKCC := 122 
STATIC DEFINE JCHECK_CHECKCEI := 110 
STATIC DEFINE JCHECK_CHECKCGC := 102 
STATIC DEFINE JCHECK_CHECKCPF := 103 
STATIC DEFINE JCHECK_CHECKFGTS := 112 
STATIC DEFINE JCHECK_CHECKIE := 108 
STATIC DEFINE JCHECK_CHECKIE1 := 128 
STATIC DEFINE JCHECK_CHECKPIS := 104 
STATIC DEFINE JCHECK_CONTA := 118 
STATIC DEFINE JCHECK_CPF := 101 
STATIC DEFINE JCHECK_FGTS := 113 
STATIC DEFINE JCHECK_FIXEDTEXT1 := 109 
STATIC DEFINE JCHECK_FIXEDTEXT2 := 114 
STATIC DEFINE JCHECK_FIXEDTEXT3 := 115 
STATIC DEFINE JCHECK_FIXEDTEXT4 := 119 
STATIC DEFINE JCHECK_FIXEDTEXT5 := 120 
STATIC DEFINE JCHECK_FIXEDTEXT6 := 121 
STATIC DEFINE JCHECK_FIXEDTEXT7 := 123 
STATIC DEFINE JCHECK_IE := 106 
STATIC DEFINE JCHECK_PIS := 105 
STATIC DEFINE JCHECK_SAIR := 125 
STATIC DEFINE JCHECK_THEFIXEDTEXT9 := 124 
STATIC DEFINE JCHECK_UF := 107 
#endregion

CLASS JCheck INHERIT _JCHECK

METHOD btnCheckEmail 
CheckEmail(SELF:txtemail,.t.)

METHOD checkcartao( ) 
	CARDCHEK(SELF:cartao)

METHOD checkcartao1( ) 
ValidaRenavam(SELF:renavam)

METHOD checkcc( ) 
IF	CHECKCTA(SELF:banco,SELF:agencia,SELF:conta)
	alert("OK")
ENDIF	

METHOD checkCEI( ) 
IF	VALCEI(SELF:cei)
	alert("OK")
ENDIF		

METHOD checkcgc( ) 
IF	VALCGC(SELF:cgc)
		alert("OK")
ENDIF	

METHOD checkcns( ) 
IF	valcns(SELF:cns)
	alert("OK")
ENDIF		

METHOD checkcPF( ) 
SELF:CPF:=formatcpf(SELF:CPF)	
IF	Valcpf(SELF:CPF)
	alert("OK")
ENDIF		

METHOD checkFGTS( ) 
IF	CTAFUN(SELF:fgts,SELF:cgc)
	alert("OK")
ENDIF		

METHOD checkIE( ) 
IF	ValIE(FIXSTR(SELF:UF),FIXSTR(SELF:IE))
	alert("OK")
ENDIF		

METHOD checkIE1( ) 
LOCAL cUF,cIE AS STRING
cUF:=AllTrim(FIXSTR(SELF:UF))
cIE:=AllTrim(FIXSTR(SELF:IE))
//utiliza versao codigo pois a versao dll nao tinha regras alteradas de alguns estados
ValIE(cuf,cie)
//AltD()

//IF Empty(cUF).OR.Empty(cIE)
//   alert("Preencha o Estado e o Nº INscriçào")
//   RETU	
//ENDIF	

//IF cUF = "EX" .Or. cUF = "XX"
//   IF cIE = "ISENTO"
//      alert("Inscricao OK-ISENTO-EXPORTACAO", "Checagem IE")
//   ELSE
//      alert("Inscricao Invalida Use ISENTO para exportacao", "Checagem IE")
//   ENDIF
//   RETU
//ENDIF

//IF	ConsisteInscricaoEstadual(String2Psz(cIE),String2Psz(cUF))=0
//	alert("OK")
//ELSE
//    alert("Inscriçäo Invalida")	
//ENDIF			

METHOD checkPIS( ) 
IF	valpis(SELF:PIS)
	alert("OK")
ENDIF		

METHOD CheckRGClick( ) 
	AltD()
	SELF:RG:=FormataRG(SELF:RG)	
	IF CheckRG(SELF:rg,TRUE)
	   alert("OK")
	ENDIF	

METHOD checkTIT( ) 
	AltD()
	IF CheckTitulo(SELF:titulo,TRUE)
	   alert("OK")
	ENDIF	

METHOD cmd033( ) 
	SELF:oDCbanco:TextValue:="033"

METHOD cmd237( ) 
		SELF:oDCbanco:TextValue:="237"

METHOD CMD341( ) 
		SELF:oDCbanco:TextValue:="341"


CONSTRUCTOR(oOWNER) 
SUPER(oOWNER)
SELF:SHOW()		

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


METHOD SAIR( ) 
	SELF:EndWindow()

END CLASS
