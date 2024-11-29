USING FabPaintLib
CLASS XJRIFDIA INHERIT JRIFDIA
  EXPORT lRETU AS LOGIC
  EXPORT CODIGO AS STRING

METHOD Cancelar( ) 
	Lretu:=.f.
	SELF:EndWindow()

CONSTRUCTOR(oOWNER,cDIZ,nOS,nPF,cNOME,cDATA)  
 LOCAL cFILE AS STRING
 LOCAL oOBJ AS FabPaintLib
	
  SUPER(oOWNER)
  SELF:LRETU:=.F.
  SELF:oDCcodigo:Caption:=cDIZ
  IF ! Empty(nOS)
   	SELF:oDCnOS:Caption:=Str(nOS)
  ELSE	
  	SELF:oDCcOS:Caption:=""
  	SELF:oDCnOS:Caption:=""
  ENDIF
  IF ! Empty(nPF)
   	SELF:oDCnPF:Caption:=Str(nPF)
  ELSE	
  	SELF:oDCcPF:Caption:=""
  	SELF:oDCnPF:Caption:=""
  ENDIF
  IF ! Empty(cNOME)
   	SELF:oDCcNOME:Caption:=cNOME
  ELSE	
   	SELF:oDCcNOME:Caption:=""
  ENDIF
  IF ! Empty(cDATA)
   	SELF:oDCdDATA:Caption:=cDATA
  ELSE	
   	SELF:oDCddata:Caption:=""
  ENDIF

    cFILE:=AllTrim(TIRAOUT(cDIZ))
	cFILE:=ZDIRFOTO+cfILE+".JPG"
//    alert(cFILE)
	IF ! File(cFILE)
	   cFILE:=ZDIRFOTO+"SEMFOTO.JPG"	
	ENDIF
	IF File(cFILE)
  	   oOBJ:=FabPaintLib{cFILE,SELF}
       SELF:oDCfoto:ImageFit:=.T.
       SELF:odcfoto:Image:=oOBJ
   	ENDIF


  SELF:SHOW()


METHOD OK( ) 
	lretu:=.t.
	SELF:EndWindow()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	    FabCenterWindow( SELF )
	RETURN NIL



END CLASS
