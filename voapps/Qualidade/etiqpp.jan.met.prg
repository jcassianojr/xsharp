CLASS xjetq01 INHER jetq01

METHOD cancelar( ) 
	SELF:endwindow()

METHOD CONFIMP( ) 
LOCAL oPrinter AS PrintingDevice

oPrinter := PrintingDevice{}
oPrinter:Setup()

METHOD esccod( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF oESC:LOK
    SELF:codigo:=oESC:CODIGO
    SELF:nome:=oesc:nome
ENDIF		

METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:oDCCODIGO:TextValue)," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETU
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG"}
OFOTOVIEW:SHOW()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra) 
SUPER(oWindow,iCtlID,oServer,uExtra)	

METHOD Ok( ) 
//LOCAL oRUN AS APP
LOCAL cVORETRUN,cPARAM AS STRING
LOCAL J,nINI,nFIM AS DWORD
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL nFout AS PTR
IF ! entramenu("QUA",19)
	RETU SELF
ENDIF	
aDAD:={zCURINI,"ETIPPP.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD,.F.,.F.}
IF oSERVER:nERRO#0
   RETU SELF
ENDIF
oSERVER:ZAP()
oSERVER:CLOSE()

oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU SELF
ENDIF
nINI:=SELF:POSINI
nFIM:=SELF:NUMERO+nINI
FOR J:=nINI TO nFIM
    oSERVER:APPEND()
    oSERVER:FIELDPUT("NUMERO",J)
    oSERVER:FIELDPUT("CODIGO",SELF:CODIGO)
    oSERVER:FIELDPUT("NOME",SELF:NOME)
    oSERVER:FIELDPUT("SUFIX",SELF:SUFIX)
    oSERVER:FIELDPUT("ENGENHA",SELF:ENGENHA)
NEXT J
oSERVER:CLOSE()
GRAVALOG("ETIQUETA","IMP","QUA_ETIPPP")	

	cVORETRUN:=PEGINIVAL(ZCURINI,"PATH","VORETRUN")+ "VORETRUN"
	cPARAM:=PEGINIVAL(ZCURINI,"RET_ETIPPP","CAMINHO")+"$NNNNNSSSN$#MANA5QUA#"
	nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz(cVORETRUN),String2Psz(cPARAM),String2Psz(""),1)
    ShellExecuteErro(nFout) 
//     hwnd,   lpOperation,  lpFile,   lpParameters,   lpDirectory,    SW_SHOWNORMAL = 1//fica no diretorio atual ondes estao os dbfs


RETU SELF

METHOD pegcod() 
	LOCAL aPRO AS ARRAY
    aPRO:=PEGMS01(SELF:CODIGO)
    IF aPRO[1]=.T. .AND. ! Empty(aPRO[2])
       SELF:NOME:=aPRO[2]
    ENDIF	


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	FabCenterWindow( SELF )
	RETURN NIL



END CLASS
