CLASS IMPRet INHERIT ReportQueue
	EXPORT cFILENAME AS STRING
	

CONSTRUCTOR(oOwner,cDB,cARQ,cSQL,aPAR,cOPER,cARQEXP) 
	IF ValType(cOPER)#"C"
	   cOPER:="V" //Preview
	ENDIF	
	
	SUPER(oOwner, "Report Editor")

// The following statement connects to a data source.
	IF .NOT. SELF:ConnectToDB(cDB) // remove data source name for data source prompt.
	   alert("Erro Conectar Base de Dados:"+cDB)		
	   RETU SELF
	ENDIF
//    alert(Carq)
    IF .NOT. File(cARQ)
	   alert("Arquivo de Relatorio Não Encontrado"+cARQ)		
	   RETU SELF
    ENDIF
	SELF:Open(cARQ)
	IF .NOT. Empty(cSQL)
  	    SELF:SETSQLTEXT(cSQL)
  	ENDIF
// The following statement allows the user to preview the report.
//    IF cOPER="E"
//       IF CUSER="SOFTEC".OR.CUSER="ADMIN".OR.CUSER="SUPERVISOR"
//       ELSE	
//          alert("Usuario Não Possui Direitos:"+cUSER)	
//          RETU SELF
//       ENDIF
//   ENDIF
   DO CASE
      CASE cOPER="E"
        SELF:EDIT()

      CASE cOPER="V"
		IF ValType(aPAR)="A"
    		SELF:Preview(aPAR)
	    ELSE
    		SELF:Preview()
	    ENDIF	

	
     CASE cOPER="P"
		IF ValType(aPAR)="A"
    		SELF:PrINT(aPAR)
	    ELSE
    		SELF:Print()
	    ENDIF	

     CASE cOPER="T"
    	 IF ValType(aPAR)="A"
    		 SELF:SaveToFile(cARQEXP,"TEXT",aPAR)
	       ELSE
       		 SELF:SaveToFile(cARQEXP,"TEXT")
   	       ENDIF	


     CASE cOPER="R"

  		   IF ValType(aPAR)="A"
    		 SELF:SaveToFile(cARQEXP,"RTF",aPAR)
	       ELSE
       		 SELF:SaveToFile(cARQEXP,"RTF")
   	       ENDIF	


	
    ENDCASE



END CLASS
