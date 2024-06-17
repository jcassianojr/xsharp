CLASS XJSOM INHERIT JSOM

METHOD Cancelar( ) 
	SELF:endwindow()

METHOD cmdmais( ) 
SELF:oDCMESINI:Value:=Str(INCDEC(SELF:oDCMESINI:Value,1,1,12),2)		


METHOD cmdmais1( ) 
SELF:oDCMESFIM:Value:=Str(INCDEC(SELF:oDCMESFIM:Value,1,1,12),2)			
	


METHOD cmdmais2( ) 
SELF:oDCANOINI:Value:=Str(INCDEC(SELF:oDCANOINI:Value,1,1900,2100),4)					


METHOD cmdmais3( ) 
SELF:oDCANOFIM:Value:=Str(INCDEC(SELF:oDCANOFIM:Value,1,1900,2100),4)						



METHOD cmdmenos( ) 
SELF:oDCMESINI:Value:=Str(INCDEC(SELF:oDCMESINI:Value,-1,1,12),2)			


METHOD cmdmenos1( ) 
SELF:oDCMESFIM:Value:=Str(INCDEC(SELF:oDCMESFIM:Value,-1,1,12),2)				


METHOD cmdmenos2( ) 
SELF:oDCANOINI:Value:=Str(INCDEC(SELF:oDCANOINI:Value,-1,1900,2100),4)						



METHOD cmdmenos3( ) 
SELF:oDCANOFIM:Value:=Str(INCDEC(SELF:oDCANOFIM:Value,-1,1900,2100),4)							


METHOD cmdmenos4( ) 
	SELF:MESFIM:=12

METHOD cmdmesmoano( ) 
	SELF:anofim:=SELF:anoini

METHOD mes01( ) 
	SELF:mesini:=1

METHOD OK() 
LOCAL cARQATU,cARQBAI AS STRING
LOCAL aPEr AS ARRAY
LOCAL nANOINI,nANOFIM,nMESINI,nMESFIM AS DWORD
cARQATU:=""
cARQBAI:=""
IF SELF:oDCAtual:Value	//pASSANDO Vazio Nao Acumula
   cARQATU:=SELF:oDCcarquso:Value
ENDIF	
IF SELF:oDCBaixado:Value //Passando Vazio Nao Acumula
   cARQBAI:=SELF:oDCcarqbai:value	
ENDIF	
nANOINI:=SELF:oDCanoini:Value
nANOFIM:=SELF:oDCanoFIM:Value
nMESINI:=SELF:oDCmesini:Value
nMESFIM:=SELF:oDCmesfim:Value

aPER:={nANOINI,nANOFIM,nMESINI,nMESFIM}


IF SELF:oDCINCPER:Value	//Nao Passando array nao acumula
   SELF:SOMAANO(SELF:oDCcarqacu:value,SELF:oDCcarqfec:Value,"PADRAO",,carqATU,SELF:oDCCAMDAT:Value,carqbai,SELF:oDCCAMDA2:Value,aPER ,)
ELSE
   SELF:SOMAANO(SELF:oDCcarqacu:value,SELF:oDCcarqfec:Value,"PADRAO",,carqATU,SELF:oDCCAMDAT:Value,carqbai,SELF:oDCCAMDA2:Value,,)	
ENDIF
SELF:EndWindow()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	   FabCenterWindow( SELF )
	RETURN NIL


METHOD SOMAANO( cARQSOM, cSTRREF, cVARSOM, bSOMA, cATU, eDAT, cBAI, eDA2, aPER ,bUSE) 
LOCAL lAC01,lAC02,lAC03 AS LOGIC
LOCAL aDAD AS ARRAY
LOCAL X,Y AS DWORD
SELF:POINTER:=POINTER{POINTERHOURGLASS}
Carqsom:=AllTrim(Carqsom)
lAC01 := .F.
lAC02 := .F.
lAC03 := .F.
//CRIARVARS( cARQSOM )
IF ValType( aPER ) = "A"
   //   aPER := PEDPER( .F. )
   //ENDIF
   //IF ( Empty( cATU ) .and. Empty( cBAI ) ) .or. MDG( "Reacumular o Periodo" )
   //  aPER  := PEDPER( .T., aPER )
   lAC01 := .T.
ENDIF
IF !Empty( cBAI ) //.and. MDG( "Incluir Baixados" )
   lAC02 := .T.
ENDIF
IF !Empty( cATU ) //.and. MDG( "Incluir Ativos" )
   lAC03 := .T.
ENDIF
//Abrir e Apagar Conteudo
aDAD:={zCURINI,cARQSOM,zCURDIR,aDIR}
oARQACU:=USEMANA5{aDAD,.F.} //Nao Compatilhado
IF ! oARQACU:USED
   alert("Erro Abrir"+Carqsom)
   RETU	.F.
ENDIF	
oARQACU:ZAP()
oARQACU:CLOSE()

aDAD:={zCURINI,cARQSOM,zCURDIR,aDIR}
oARQACU:=USEMANA5{aDAD,.F.} //Nao Compatilhado
IF ! oARQACU:USED
   alert("Erro Abrir"+Carqsom)
   RETU	.F.
ENDIF	
IF lAC01
   DO CASE
   CASE aPER[ 1 ] = aPER[ 2 ]
      FOR X := aPER[ 3 ] TO aPER[ 4 ]
         SELF:SOMAARQ( X, aPER[ 1 ], cSTRREF, cARQSOM, cVARSOM, bSOMA,bUSE)
      NEXT X
   CASE aPER[ 1 ] + 1 = aPER[ 2 ]
      FOR X := aPER[ 3 ] TO 12
         SELF:SOMAARQ( X, aPER[ 1 ], cSTRREF, cARQSOM, cVARSOM, bSOMA,bUSE)
      NEXT X
      FOR X := 1 TO aPER[ 4 ]
         SELF:SOMAARQ( X, aPER[ 2 ], cSTRREF, cARQSOM, cVARSOM, bSOMA,bUSE)
      NEXT X
   OTHERWISE
      FOR X := aPER[ 3 ] TO 12
         SELF:SOMAARQ( X, aPER[ 1 ], cSTRREF, cARQSOM, cVARSOM, bSOMA,bUSE)
      NEXT X
      FOR Y := aPER[ 1 ] + 1 TO aPER[ 2 ] - 1
         FOR X := 1 TO 12
            SELF:SOMAARQ( X, Y, cSTRREF, cARQSOM, cVARSOM, bSOMA ,bUSE)
         NEXT X
      NEXT Y
      FOR X := 1 TO aPER[ 4 ]
         SELF:SOMAARQ( X, aPER[ 2 ], cSTRREF, cARQSOM, cVARSOM, bSOMA,bUSE)
      NEXT X
   ENDCASE
ENDIF
IF lAC02
   SELF:SOMAARQ(,, AllTrim( cBAI ), cARQSOM, eDA2 )
ENDIF
IF lAC03
   SELF:SOMAARQ(,, AllTrim( cATU ), cARQSOM, eDAT )
ENDIF
oARQACU:CLOSE()
SELF:POINTER:=POINTER{POINTERARROW}


METHOD SOMAARQ(nMES,nANO,cREF,cARQREF,cVARSOM,bBLOCO,bUSE) 
LOCAL cANO,cMES,cARQ
LOCAL aDAD AS ARRAY
LOCAL oARQUSO AS USEMANA5
LOCAL mMES,mANO,nFIELD,J AS DWORD
LOCAL dDATA AS DATE
LOCAL cCAMPO AS STRING
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT

IF ValType(cVARSOM)#"C" .OR. Empty(cVARSOM)
   cVARSOM:="DATA"	
ELSE
   cVARSOM:=AllTrim(cVARSOM)
ENDIF	
IF ValType(nANO)="N"  .AND. ValType(nMES)="N"
   cANO:=SubStr(StrZero(nANO,4),3,2)
   cMES:=StrZero(nMES,2)
   cARQ:=cREF+cANO+cMES
ELSE
   cARQ:=cREF
ENDIF
SELF:oDCarquso:Caption:=Carq
IF ValType(nMES)#"N" .OR. nMES=0
   nMES:=Month(Today())	
ENDIF	
IF ValType(nANO)#"N" .OR. nANO=0
   nANO:=Year(Today())	
ENDIF	
IF ValType(bBLOCO)="B"
   Eval(bBLOCO,nMES,nANO,cARQ,cARQREF)
   RETU .F.
ENDIF
IF ValType(bUSE)="B"
   Eval(bUSE,cARQ)  
   RETURN .f.
ENDIF
   aDAD:={zCURINI,cARQ,zCURDIR,aDIR}
   oARQUSO:=USEMANA5{aDAD}
   IF ! oARQUSO:USED
      alert("Erro Abrir"+Carq)
      RETU	.F.
   ENDIF

nFIELD:=oARQUSO:FCOUNT
nLASTREC:=OARQUSO:RecCount
nPOS:=0
oARQUSO:GOTOP()
WHILE ! oARQUSO:EoF	
	
   nPerc := INT(100* nPOS/ nLASTREC)
   SELF:oDcProgBar:Position := nPerc
	
   nPOS++

   IF cVARSOM="PADRAO"
      mMES:=nMES
      mANO:=nANO
   ELSE
   	  Ddata:=oarquso:FIELDGET(cVARSOM)
      mMES:=Month(dDATA)
      mANO:=Year(dDATA)
   ENDIF
   oARQACU:APPEND()
   FOR J:=1 TO nFIELD
   	   cCAMPO:=AllTrim(oARQACU:FieldName(J))
       IF cCAMPO<>"MES"  .AND. cCAMPO<>"ANO"
       	  IF oARQUSO:FieldPos(cCAMPO)>0
             oARQACU:FIELDPUT(cCAMPO,oARQUSO:FIELDGET(cCAMPO))
          ENDIF
       ENDIF
   NEXT J
   oARQACU:FIELDPUT("MES",mMES)
   oARQACU:FIELDPUT("ANO",mANO)
   SELF:oDCregistro:Caption:=Str(Oarquso:RECNO)
   oARQUSO:SKIP()
ENDDO
oARQUSO:CLOSE()
RETU .T.


METHOD valoresini(cCODIGO)
	LOCAL aDAD AS ARRAY
	LOCAL oARQ AS  USEMANA5
	SELF:oDCmesini:Value:=1
	SELF:oDCmesfim:Value:=Month(ZDATA)
	SELF:oDCanoini:Value:=Year(ZDATA)
	SELF:oDCanoFIM:Value:=Year(ZDATA)
	SELF:oDCINCPER:Value:=.T.
	aDAD:={zCURINI,"MANFEC",zCURDIR,aDIR}
	oARQ:=USEMANA5{aDAD}
	IF ! oARQ:USED
		alert("Erro Ao Abrir Manfec- Tente Novamente") 
		RETURN .F.
	ENDIF		
	oARQ:GOTOP()
	IF .NOT. oARQ:sEEK(cCODIGO)
	   oARQ:CLOSE() 
	   	alert("Falta Configuraçao PARA "+cCODIGO)
	   RETURN .F.
	ENDIF   	
			  
			
			SELF:oDCcarquso:Value :=oARQ:FIELDGET("STRATU")
			SELF:oDCcarqbai:value:= oARQ:FIELDGET("STRBAI")
			SELF:oDCcarqfec:Value:= oARQ:FIELDGET("STRDES")
			SELF:oDCcarqacu:value:=oARQ:FIELDGET("STRANO")	
			SELF:oDCCAMDAT:Value:= "DATA"
			SELF:oDCCAMDA2:Value:= "DATA"
			IF ! Empty(oARQ:FIELDGET("CAMDAT"))
				SELF:oDCCAMDAT:Value:=oARQ:FIELDGET("CAMDAT")
			ENDIF
			IF ! Empty(oARQ:FIELDGET("CAMDA2"))
				SELF:oDCCAMDA2:Value:=oARQ:FIELDGET("CAMDA2")
			ENDIF
			oARQ:CLOSE()
		
RETURN .T.

END CLASS
