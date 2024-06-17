PARTIAL CLASS jlxpro
METHOD Cancelar( ) 
	SELF:ENDWINDOW()

METHOD PEGMC( ) 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL CSQL AS STRING    //CMIG


 //  cMIG:=PEGEMPMIG(zempRESA)

   oConn := SQLConnection{}
   IF ! oConn:connect("protheus","","")
  	  alert("Erro na Conecção")
   	  RETU
   ENDIF	


  CSQL:="SELECT *"
  csql+=" FROM zz2010"
  csql+=" where ZZ2_AR=" + Str(SELF:NCRM)+" AND ZZ2_SEQAR="+  Str(SELF:ARITEM)


   oreg:= SQLSelect{cSQL,oconn}
   IF ! OREG:EoF	

     SELF:CODIGO:=OREG:FIELDGET("ZZ2_PRODUT")
     SELF:RASTRO:=OREG:FIELDGET("ZZ2_LOTE")
     SELF:OBS:=OREG:FIELDGET("ZZ2_OBS")
     SELF:QTDELIB:=OREG:FIELDGET("ZZ2_QTDLIB")
     SELF:QTDEEXC:=OREG:FIELDGET("ZZ2_QTEXCE")
     SELF:QTDEREJ:=OREG:FIELDGET("ZZ2_QTREJ")
     SELF:QTDESAL:=OREG:FIELDGET("ZZ2_SALDO")
     SELF:EMPRESA:=OREG:FIELDGET("ZZ2_FILIAL")
     SELF:SITU:=OREG:FIELDGET("ZZ2_FLAG")

   ENDIF
   Oreg:close()
   Oconn:Disconnect()










METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL



END CLASS
