#region DEFINES
DEFINE IDI_STANDARDICON := 101
#endregion

CLASS StandardShellWindow INHERIT ShellWindow
	PROTECT aChildWindows AS ARRAY
	EXPORT lUseTaskBar AS LOGIC
	

METHOD FileExit() 
//	IF Warning("Deseja Encerrar")
		SELF:EndWindow()
//	ENDIF		
	

METHOD FilePrinterSetup() 

	LOCAL oPrinter AS PrintingDevice
	
	oPrinter := PrintingDevice{}
	oPrinter:Setup()
	

METHOD HelpAboutDialog() 
	LOCAL oOD AS HelpAbout

         oOD:=HelpAbout{SELF}
          oOD:TITULO:="Módulo "
          oOD:SHOW()

	

METHOD HelpCont 

	SELF:HelpDisplay:Show( "Topicos" )

	RETURN SELF

METHOD HelpIndex 

	SELF:HelpDisplay:Show( "helpindex" )

	RETURN SELF

METHOD HelpUsingHelp 

	SELF:HelpDisplay:Show( "HelpOnHelp" )
	

	RETURN SELF

METHOD lstview() 
LOCAL cARQ AS STRING
cARQ:=PEGINIVAL(ZCURINI,"PATH","LSTVIEW")
//abre o lstview ja disponivel no wrptx nao precisando de um exe separado
ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPTX"),String2Psz("lstview"),String2Psz(carq),SW_SHOWNORMAL)


METHOD xversao()
LOCAL cARQ,cARQHLP AS STRING
cARQHLP:=PEGINIVAL(ZCURINI,"HELP","ALTERADO")
cARQ:=PEGINIVAL(ZCURINI,"PATH","RPT")
//wrptx abre preview quando passao um txt
ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPTX"),String2Psz(carqHLP),String2Psz(carq),SW_SHOWNORMAL)
		
METHOD WindowCascade() 

	SELF:Arrange(ARRANGECASCADE)


METHOD WindowIcon() 

	SELF:Arrange(ARRANGEASICONS)


METHOD WindowTile() 

	SELF:Arrange(ARRANGETILE)


METHOD XWRPT() 
LOCAL cARQ,cNOME AS STRING  
LOCAL nFout AS PTR
cNOME:=Upper(AllTrim(ZUSER))
IF cNOME="SUPERVISOR" .OR. cNOME="SOFTEC"
   cNOME:="ADMIN"	
ENDIF
cARQ:=PEGINIVAL(ZCURINI,"WRPT","CAMINHO")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPTX"),String2Psz("$"+cNOME+"%#"),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 

METHOD XWRPTGRP(cGRP,cSUB) 
LOCAL cARQ,CNOME AS STRING 
LOCAL nFout AS PTR
cNOME:=Upper(AllTrim(ZUSER))
IF cNOME="SUPERVISOR" .OR. cNOME="SOFTEC"
   cNOME:="ADMIN"	
ENDIF
cARQ:=PEGINIVAL(ZCURINI,"WRPT","CAMINHO")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPTX"),String2Psz("$"+CNOME+"%"+cGRP+"#"+cSUB),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 


METHOD XWRPTF() 
//LOCAL oRUN AS APP
LOCAL cARQ,cNOME AS STRING 
LOCAL nFout AS PTR
cNOME:=Upper(AllTrim(ZUSER))
IF cNOME="SUPERVISOR" .OR. cNOME="SOFTEC"
   cNOME:="ADMIN"	
ENDIF
//oRUN:=APP{SELF}
cARQ:=PEGINIVAL(ZCURINI,"WRPT","CAMINHO")
//cARQ+="WRPTF.EXE $"+cNOME+"%#"
//oRUN:RUN(cARQ)	
nfout:=ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPTF"),String2Psz("$"+cNOME+"%#"),String2Psz(carq),SW_SHOWNORMAL) 
ShellExecuteErro(nFout)  
		

METHOD XWRPTFGRP(cGRP,cSUB) 
//LOCAL oRUN AS APP
LOCAL cARQ,CNOME AS STRING 
LOCAL nFout AS PTR
cNOME:=Upper(AllTrim(ZUSER))
IF cNOME="SUPERVISOR" .OR. cNOME="SOFTEC"
   cNOME:="ADMIN"	
ENDIF
//oRUN:=APP{SELF}
cARQ:=PEGINIVAL(ZCURINI,"WRPT","CAMINHO")
//cARQ+="WRPTF.EXE $"+CNOME+"%"+cGRP+"#"+cSUB
//oRUN:RUN(cARQ)		
Nfout:=ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPTF"),String2Psz("$"+CNOME+"%"+cGRP+"#"+cSUB),String2Psz(carq),SW_SHOWNORMAL) 
ShellExecuteErro(nFout)  


METHOD XWRPTI() 
LOCAL cARQ,CNOME AS STRING 
LOCAL nFout AS PTR
cNOME:=Upper(AllTrim(ZUSER))
IF cNOME="SUPERVISOR" .OR. cNOME="SOFTEC"
   cNOME:="ADMIN"	
ENDIF
cARQ:=PEGINIVAL(ZCURINI,"WRPT","CAMINHO")
nfout:=ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPTI"),String2Psz("$"+cNOME+"%#"),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 

METHOD XWRPTIGRP(cGRP,cSUB) 
LOCAL cARQ,CNOME AS STRING  
LOCAL nFout AS PTR
cNOME:=Upper(AllTrim(ZUSER))
IF cNOME="SUPERVISOR" .OR. cNOME="SOFTEC"
   cNOME:="ADMIN"	
ENDIF
cARQ:=PEGINIVAL(ZCURINI,"WRPT","CAMINHO")
Nfout:=ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("WRPTI"),String2Psz("$"+CNOME+"%"+cGRP+"#"+cSUB),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 
END CLASS
