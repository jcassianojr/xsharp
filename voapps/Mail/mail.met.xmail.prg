CLASS XJMAIL INHERIT ZMAIL
	//usa zmail pois tem configuracao de arquivos na inicializacao

METHOD AJUDA 
SELF:HelpDisplay:Show( "Mail" )

METHOD Anterior( ) 
	SELF:SERVER:SKIP(-1)
	IF SELF:SERVER:BOF
		SELF:SERVER:GOTOP()
	ENDIF	

METHOD append 	

METHOD delete 	

METHOD encerrar 	
	SELF:EndWindow()

METHOD imprimir 
	LOCAL oJRTF AS JRTF
	LOCAL cTEXTO AS STRING
	cTEXTO:="De:"+SELF:FIELDGET("DE")
	cTEXTO+=" Em:"+DToC(SELF:FIELDGET("DATA"))+"-"+SELF:FIELDGET("HORA")+CHR(13)+CHR(10)
	cTEXTO+="Para:"+SELF:FIELDGET("DESTINO")+CHR(13)+CHR(10)	
	cTEXTO+="Assunto:"+SELF:FIELDGET("ASSUNTO")+CHR(13)+CHR(10)
	cTEXTO+=SELF:FIELDGET("TEXTO")+CHR(13)+CHR(10)	
	oJRTF:=JRTF{SELF,cTEXTO,"T",.F.,.T.,.T.,.T.}
	oJRTF:SHOW()
	
	

CONSTRUCTOR(oOWNER,lENCERRA) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL cVAR AS STRING
IF ValType(lENCERRA)#"L"
   lENCERRA:=.F.
ENDIF	

cVAR:="DESTINO='"+ZUSER+"'"
aDAD:={zCURINI,"MAIL.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
oSERVER:SetFilter(cVAR)
SUPER(oOWNER,oServer,zcurini,zcurdir,ZUSER,lENCERRA,CHELP)
SELF:SHOW()


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	    FabCenterWindow( SELF )
	    SELF:RegisterTimer(20,FALSE)
	RETURN NIL


METHOD Proximo( ) 
	SELF:SERVER:SKIP()
	IF SELF:SERVER:EOF
		SELF:SERVER:GOBOTTOM()
	ENDIF	
	

METHOD Timer() 
	SELF:Destroy()
	//usuario fica aberto por algum tempo fecha timer na posinit



END CLASS
