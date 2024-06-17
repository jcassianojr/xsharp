CLASS jrifrastro INHERIT _jrifrastro
		EXPORT lOK     AS LOGIC
		EXPORT cRETU   AS STRING
	
	

METHOD Cancelar( ) 
	SELF:LOK:= .F.
	SELF:EndWindow()

METHOD cmdALT( ) 
		SELF:cmdzera()	
		SELF:TIPCOD:="A"		


METHOD cmdar( ) 
	SELF:cmdzera()
    SELF:TIPCOD:="AR"

METHOD cmdb( ) 
		SELF:cmdzera()	
		SELF:TIPCOD:="B"		


METHOD cmdbusca() 
SELF:LOK:=.F.	
DO CASE
   CASE SELF:TIPCOD="A"	
	  SELF:CMDALT()
   CASE Empty(SELF:TIPCOD)	
  	  SELF:cmdCRM()
ENDCASE
	

METHOD cmdcrm( ) 
		SELF:cmdzera()	
		SELF:TIPCOD:=""


METHOD cmdgera( ) 	
SELF:cRASTRO:=CRIARASTRO(SELF:TIPCOD,SELF:RASTRONUM,SELF:RASTROANO,SELF:RASTROITEM)
IF ! Empty(SELF:crastro)
   SELF:OCCOK:Enable()	
ENDIF	

METHOD cmdmais2( ) 
SELF:oDCRASTROANO:TextValue:=Str(INCDEC(SELF:oDCRASTROANO:TextValue,1,1900,2100),4)						

METHOD cmdmenos2( ) 
SELF:oDCRASTROANO:TextValue:=Str(INCDEC(SELF:oDCRASTROANO:TextValue,-1,1900,2100),4)						

METHOD cmdmO( ) 
	SELF:cmdzera()
    SELF:TIPCOD:="MO"

METHOD cmdOP( ) 
	SELF:cmdzera()
    SELF:TIPCOD:="OP"

METHOD cmdso( ) 
	SELF:cmdzera()
		SELF:TIPCOD:="SO"


METHOD cmdzera( ) 
		SELF:TIPCOD:=""
		SELF:RASTRONUM:=0
		SELF:RASTROITEM:=0
		SELF:cRASTRO:=""

CONSTRUCTOR(oOWNER,cTIPO,cCODIGO) 
SUPER(oOWNER)	
SELF:TIPCOD:=cTIPO
SELF:RASTROANO:=Year(Today())
SELF:CRASTRO:=""
SELF:CRETU:=""
SELF:LOK:=.F.
//SELF:OCCOK:DISABLE()


METHOD OK( ) 
	IF ! Empty(SELF:crastro)
       SELF:LOK:=TRUE
    ENDIF
    SELF:CRETU:=SELF:CRASTRO
   	SELF:EndWindow()


		

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	    FabCenterWindow( SELF )
	RETURN NIL



END CLASS
