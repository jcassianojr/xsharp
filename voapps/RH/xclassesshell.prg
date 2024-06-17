CLASS rhshell INHERIT StandardShellWindow

METHOD AJUSTAR(nTIPO) 
LOCAL cARQUIVO,cEMPRESA,cNOME,cCPF,cPIS AS STRING
LOCAL oSERVER AS myDBSERVER
LOCAL oMP02,oMP04,oFO_CHIS,oRHSEL AS USEREDE
LOCAL aRET,aCOM,aDAD AS ARRAY	
LOCAL oBUSCA AS XBUSCA	
LOCAL X,nEMPRESA AS DWORD
LOCAL oPROGWIN AS PROGWIN

oProgWin := ProgWin{SELF}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()

//1 codigos
//2 treinamentos
//3 Historio
//4 Folha selecao

FOR X:=1 TO 2
	cEMPRESA:=PEGINIVAL(ZCURINI,"SINC"+StrZero(ZEMPRESA,3),"EMPRESA"+StrZero(X,3))
    nEMPRESA:=Val(cEMPRESA)
	IF nEMPRESA>0
	   IF nTIPO<>4	
    	  oBUSCA:=XBUSCA{SELF,"Ajuste de dados","Confirme a Empresa",cEMPRESA}
  	      oBUSCA:SHOW()	
	      IF ! oBUSCA:lOK
	   	     oPROGWIN:EndDialog()
   	         RETU SELF
   	       ENDIF
   	   ENDIF
       nEMPRESA:=Val(cEMPRESA)
	   caRQUIVO:=PEGINIVAL(ZCURINI,"PATH","FOLHAEMZ")
	   cARQUIVO:=CAMINEX(cARQUIVO,ZMES,ZANO,nEMPRESA)
       cARQUIVO+="FO_PES.DBF"
       IF ! File(cARQUIVO)
		  alert("Arquivo Não Encontrado","Erro Abrindo o Arquivo")
		  RETU SELF
 	   ENDIF	
	   oSERVER:=myDBSERVER{cARQUIVO,.T.}
	   IF ! oSERVER:Used
		  alert("Outro Usuario Arquivo Aberto - Tente Depois","Erro Abrindo o Arquivo")
		   RETU SELF
       ENDIF	

       IF nTIPO=1
       	  oPROGWIN:NTOTAL:=Oserver:RecCount
       	  oPROGWIN:RESET()
	      oSERVER:GOTOP()
	      WHILE ! oSERVER:EOF
	      	 oPROGWIN:SKIP(1)
	      	 oPROGWIN:TITULO("",.T.)
	      	 cNOME:=Upper(oSERVER:FIELDGET("NOME"))
       	     cNOME:=StrTran(cNOME,"(H)","")
             cNOME:=StrTran(cNOME,"(M)","")
             cNOME:=StrTran(cNOME,"(FAB 2)","")
             cNOME:=StrTran(cNOME,"(FAB2)","")
		     oSERVER:FIELDPUT("CNUMERO",StrZero(oSERVER:FIELDGET("NUMERO"),8))
	         oSERVER:FIELDPUT("DEPSETSEC",oSERVER:FIELDGET("DEPTO") * 1000000 + oSERVER:FIELDGET("SETOR") * 1000 + oSERVER:FIELDGET("SECAO"))
		     oSERVER:FIELDPUT("NOME",cNOME)
		     IF Val(oSERVER:FIELDGET("CPF"))=0
                oSERVER:FIELDPUT("CPF","")	
             ELSE
 		        oSERVER:FIELDPUT("CPF",formatcpf(oSERVER:FIELDGET("CPF")))	
		     ENDIF	
             oSERVER:FIELDPUT("RG",FormataRG(oSERVER:FIELDGET("RG")))			
	   	     oSERVER:SKIP()
	      ENDDO
	   ENDIF
	
	   IF nTIPO=2
          aRET:={zCURINI,"MP04.DBF",zCURDIR}
          aCOM:={zMES,zANO,ZEMPRESA}
          oMP04:=USEREDE{aRET,,,,aCOM}
          IF oMP04:nERRO#0
	         alert("Outro Usuario Arquivo Aberto - Tente Depois","Erro Abrindo o Arquivo")
             oSERVER:Close()
             oPROGWIN:EndDialog()
             RETU SELF
          ENDIF	
          aRET:={zCURINI,"MP02.DBF",zCURDIR}
          aCOM:={zMES,zANO,ZEMPRESA}
          oMP02:=USEREDE{aRET,,,,aCOM}
          IF oMP02:nERRO#0
             alert("Outro Usuario Arquivo Aberto - Tente Depois","Erro Abrindo o Arquivo")
             oSERVER:Close()
             oMP04:CLOSE()
             RETU SELF
          ENDIF
          oMP02:SetOrder(3) //Cod Folha
          oPROGWIN:NTOTAL:=Oserver:RecCount
          oPROGWIN:RESET()
          oSERVER:GOTOP()
          WHILE ! oSERVER:EOF
          	oPROGWIN:SKIP(1)
        	oPROGWIN:TITULO("",.T.)
        	oMP04:GOTOP()
   	        IF ! oMP04:SEEK(oSERVER:FIELDGET("NUMERO"))
   		       oMP04:Append()
   		       oMP04:FIELDPUT("TECNICO",oSERVER:FIELDGET("NUMERO"))
   	        ENDIF	
		    oMP04:FIELDPUTE("CNUMERO",StrZero(oSERVER:FIELDGET("NUMERO"),8))	
            oMP04:FIELDPUTE("NOMTEC",oSERVER:FIELDGET("NOME"))
            oMP04:FIELDPUTE("ADMITIDO",oSERVER:FIELDGET("ADMITIDO"))
            oMP04:FIELDPUTE("DEMITIDO",oSERVER:FIELDGET("DEMITIDO"))
            oMP04:FIELDPUTE("ESCRAIS",oSERVER:FIELDGET("ESCRAIS"))
            oMP04:FIELDPUTZ("NUMREGANT",oSERVER:FIELDGET("NUMREGANT"))
            oMP04:FIELDPUTZ("NUMEMPANT",oSERVER:FIELDGET("NUMEMPANT"))
            oMP04:FIELDPUTZ("dattransf",oSERVER:FIELDGET("dattransf"))
            oMP04:FIELDPUTE("SETOR",oSERVER:FIELDGET("UNIFUN"))
            oMP04:FIELDPUTE("DATAHAB",oSERVER:FIELDGET("VALCNH"))

            IF Valcpf(oSERVER:FIELDGET("CPF"),.f.)
               oMP04:FIELDPUTE("CPF",oSERVER:FIELDGET("CPF"))
            ENDIF
            IF .not. Valcpf(oMP04:FIELDGET("CPF"),.f.)
               oMP04:FIELDPUT("CPF","")
            ENDIF	

//            oMP04:FIELDPUTE("CPF",oSERVER:FIELDGET("CPF"))
            oMP04:FIELDPUTZ("EMAILEXT",oSERVER:FIELDGET("EMAIL"))


            IF ! Empty(oSERVER:FIELDGET("FUNCAO"))
               oMP02:GOTOP()
               IF oMP02:SEEK(oSERVER:FIELDGET("FUNCAO"))
                  oMP04:FIELDPUTE("TABTEC",oMP02:FIELDGET("CODIGO"))
               ENDIF
            ENDIF

           IF Empty(oSERVER:FIELDGET("NUMREGANT"))  .and. ! Empty(oMP04:FIELDGET("NUMREGANT"))
              oSERVER:FIELDPUTZ("NUMREGANT",oMP04:FIELDGET("NUMREGANT"))
              oSERVER:FIELDPUTZ("NUMEMPANT",oMP04:FIELDGET("NUMEMPANT"))
           ENDIF	

   	        oSERVER:SKIP()
          ENDDO
          oMP04:CLOSE()
          oMP02:CLOSE()
	   ENDIF
	
       IF nTIPO=3
          aRET:={zCURINI,"FO_CHIS.DBF",zCURDIR}
          aCOM:={zMES,zANO,ZEMPRESA}
          oFO_CHIS:=USEREDE{aRET,,,,aCOM}
          IF oFO_CHIS:nERRO#0
             oSERVER:Close()
             alert("Outro Usuario Arquivo Aberto - Tente Depois","Erro Abrindo o Arquivo")
             oPROGWIN:EndDialog()
             RETU SELF
          ENDIF	
          oPROGWIN:nTOTAL:=Oserver:RecCount
          oPROGWIN:RESET()
          oSERVER:GOTOP()
          WHILE ! oSERVER:EOF
       	     oPROGWIN:SKIP(1)
       	     oPROGWIN:TITULO("",.T.)
     	     oFO_CHIS:GOTOP()
   	         IF ! oFO_CHIS:SEEK(oSERVER:FIELDGET("NUMERO"))
   		        oFO_CHIS:Append()
   		        oFO_CHIS:FIELDPUT("NUMERO",oSERVER:FIELDGET("NUMERO"))
    	    ENDIF	
            oFO_CHIS:FIELDPUTE("NOME",oSERVER:FIELDGET("NOME"))
            oFO_CHIS:FIELDPUTE("ADMISSAO",oSERVER:FIELDGET("ADMITIDO"))
            oFO_CHIS:FIELDPUTE("DEMISSAO",oSERVER:FIELDGET("DEMITIDO"))
   	        oSERVER:SKIP()
          ENDDO
          oFO_CHIS:CLOSE()
       ENDIF	


       IF nTIPO=4
          aRET:={zCURINI,"RHSEL.DBF",zCURDIR}
          aCOM:={zMES,zANO,ZEMPRESA}
          oRHSEL:=USEREDE{aRET,,,,aCOM}
          IF oRHSEL:nERRO#0
             alert("Outro Usuario Arquivo Aberto - Tente Depois","Erro Abrindo o Arquivo")
             oSERVER:Close()
             oPROGWIN:EndDialog()
             RETU SELF
          ENDIF	
          aRET:={zCURINI,"MP02.DBF",zCURDIR}
          aCOM:={zMES,zANO,ZEMPRESA}
          oMP02:=USEREDE{aRET,,,,aCOM}
          IF oMP02:nERRO#0
             alert("Outro Usuario Arquivo Aberto - Tente Depois","Erro Abrindo o Arquivo")
             oSERVER:Close()
             oRHSEL:CLOSE()
             RETU SELF
          ENDIF
          oPROGWIN:NTOTAL:=Oserver:RecCount
          oPROGWIN:RESET()
          oSERVER:GOTOP()
          AltD()
          WHILE ! oSERVER:EOF
          	 oPROGWIN:SKIP(1)
        	 oPROGWIN:TITULO("",.T.)
        	 cNOME:=Upper(oSERVER:FIELDGET("NOME"))
	         cNOME:=StrTran(cNOME,"(H)","")
	         cNOME:=StrTran(cNOME,"(M)","")
	         cNOME:=StrTran(cNOME,"(FAB 2)","")
	         cNOME:=StrTran(cNOME,"(FAB2)","")
	         cPIS :=oSERVER:FIELDGET("PIS")
	         cCPF :=formatcpf(oSERVER:FIELDGET("CPF"))
	         IF Valcpf(cCPF,.F.)
	         	  oRHSEL:SETORDER(4)
              	  oRHSEL:GOTOP()
	              IF ! oRHSEL:SEEK(cCPF)
			         oRHSEL:Append()
			   		 oRHSEL:FIELDPUTZ("NUMERO",oSERVER:FIELDGET("NUMERO"))
			   		 oRHSEL:FIELDPUTZ("EMPRESA",ZEMPRESA)
			     	 oRHSEL:FIELDPUTZ("NOME",cNOME)	
			     	 IF valpis(cPIS,.F.)
 		                 oRHSEL:FIELDPUTZ("PIS",cPIS)	
 		             ENDIF
		             oRHSEL:FIELDPUTZ("CPF",oSERVER:FIELDGET("CPF"))
	              ENDIF	
// somente com cpf validos	
//	             IF ! oRHSEL:SEEK(Str(ZEMPRESA,3)+Str(oSERVER:FIELDGET("NUMERO"),8))   //tenta empresa numero
//	        	    oRHSEL:SETORDER(4)
//	                oRHSEL:GOTOP()
//	                IF ! oRHSEL:SEEK(IF(Empty(cCPF),'999',cCPF)) //tenta cpf evitando vazio
//	                   oRHSEL:SETORDER(5)
//	                   oRHSEL:GOTOP()
//	                   IF ! oRHSEL:SEEK(IF(Empty(cPIS),'999',cPIS))	//tenta pis evitando vazio
//		                   oRHSEL:SETORDER(2)
//		                   oRHSEL:GOTOP()
//		                   IF ! oRHSEL:SEEK(cNOME)	//tenta nome
//			              	  oRHSEL:Append()
//			   		          oRHSEL:FIELDPUTZ("NUMERO",oSERVER:FIELDGET("NUMERO"))
//			   		          oRHSEL:FIELDPUTZ("EMPRESA",ZEMPRESA)
//			     		      oRHSEL:FIELDPUTZ("NOME",cNOME)	
//			     		      IF valpis(cPIS,.F.)
// 		                         oRHSEL:FIELDPUTZ("PIS",cPIS)	
// 		                      ENDIF
//		                      oRHSEL:FIELDPUTZ("CPF",oSERVER:FIELDGET("CPF"))
//		                  ENDIF
//	    		       ENDIF
//	                ENDIF	
//	        	 ENDIF
	             IF Empty(oRHSEL:FIELDGET("NUMERO"))  .AND. ( Empty(oRHSEL:FIELDGET("EMPRESA"))  .or. oRHSEL:FIELDGET("EMPRESA")=99 ) //Grava Somente se nao tiver empresa  numero
	   		        oRHSEL:FIELDPUT("NUMERO",oSERVER:FIELDGET("NUMERO"))                   //curriculo virou admissao ou temporario virou efetivo
	      		    oRHSEL:FIELDPUT("EMPRESA",ZEMPRESA)
	  		     ENDIF
	             oRHSEL:FIELDPUTE("ENDER",oSERVER:FIELDGET("ENDER"))
	             oRHSEL:FIELDPUTE("NASC",oSERVER:FIELDGET("NASC"))
	             oRHSEL:FIELDPUTE("BAIRRO",oSERVER:FIELDGET("BAIRRO"))
	             oRHSEL:FIELDPUTE("CIDADE",oSERVER:FIELDGET("CIDADE"))
	             oRHSEL:FIELDPUTE("ESTADO",oSERVER:FIELDGET("ESTADO"))
	             oRHSEL:FIELDPUTE("CEP",oSERVER:FIELDGET("CEP"))
	             oRHSEL:FIELDPUTE("SEXO",oSERVER:FIELDGET("SEXO"))
	             oRHSEL:FIELDPUTE("FUNCAO",oSERVER:FIELDGET("FUNCAO"))
				 
			     IF Empty(oRHSEL:FIELDGET("SEXO"))
					aDAD:=PEGNOMESEXO(oRHSEL:FIELDGET("NOME"),ZCURINI,ZCURDIR,acom)
					IF aDAD[1]=.T.
					   oRHSEL:FIELDPUTE("SEXO",aDAD[2])
					ENDIF
				 ENDIF
	
	             IF Empty(oRHSEL:FIELDGET("CODMP02"))
	             	oMP02:SETORDER(3)
	             	oMP02:GOTOP()
	             	IF oMP02:SEEK(oRHSEL:FIELDGET("FUNCAO"))
	                   oRHSEL:FIELDPUTE("CODMP02",oMP02:FIELDGET("CODIGO"))
	                ENDIF
	             ENDIF	
	             IF Empty(oRHSEL:FIELDGET("FUNCAO"))
	             	oMP02:SETORDER(1)
	             	oMP02:GOTOP()
	             	IF oMP02:SEEK(oRHSEL:FIELDGET("CODMP02"))
	                   oRHSEL:FIELDPUTE("FUNCAO",oMP02:FIELDGET("CODFOLHA"))
	                ENDIF
	             ENDIF	
	             oRHSEL:FIELDPUTE("ESCRAIS",oSERVER:FIELDGET("ESCRAIS"))
	
	             oRHSEL:FIELDPUTE("CPF",oSERVER:FIELDGET("CPF"))
	             oRHSEL:FIELDPUTE("PIS",oSERVER:FIELDGET("PIS"))
	             oRHSEL:FIELDPUTE("PROFIS",oSERVER:FIELDGET("PROFIS"))
	             oRHSEL:FIELDPUTE("SERIE",oSERVER:FIELDGET("SERIE"))
	             oRHSEL:FIELDPUTE("CTPSUF",oSERVER:FIELDGET("CTPSUF"))
	             oRHSEL:FIELDPUTE("CTPSDATA",oSERVER:FIELDGET("CTPSDATA"))
	             oRHSEL:FIELDPUTE("ESTCIVIL",oSERVER:FIELDGET("ESTCIVIL"))
	             oRHSEL:FIELDPUTE("FONE",SubStr(oSERVER:FIELDGET("FONE"),5))
	             oRHSEL:FIELDPUTE("NUMREGANT",oSERVER:FIELDGET("NUMREGANT"))
	             oRHSEL:FIELDPUTE("NUMEMPANT",oSERVER:FIELDGET("NUMEMPANT"))
	
	             oRHSEL:FIELDPUTE("NASCIBGE",oSERVER:FIELDGET("NASCIBGE"))
	             oRHSEL:FIELDPUTE("NASCPAIS",oSERVER:FIELDGET("NASCPAIS"))
	             oRHSEL:FIELDPUTE("ANONASCi",oSERVER:FIELDGET("ANONASCi"))
	
                 //checa origem antes de gravar
                 IF CheckRG(oSERVER:FIELDGET("RG"),.F.,oSERVER:FIELDGET("RGTIP"),oSERVER:FIELDGET("NASC"),oSERVER:FIELDGET("RGUF"))	
	  	             oRHSEL:FIELDPUTE("RG",oSERVER:FIELDGET("RG"))
		             oRHSEL:FIELDPUTE("RGUF",oSERVER:FIELDGET("RGUF"))
		             oRHSEL:FIELDPUTE("RGEMIS",oSERVER:FIELDGET("RGEMIS"))
		             oRHSEL:FIELDPUTE("RGTIP",oSERVER:FIELDGET("RGTIP"))
		             oRHSEL:FIELDPUTE("RGDATA",oSERVER:FIELDGET("RGDATA"))
		         ENDIF
	
	             //checa destino e corrige
	             IF ! CheckRG(oRHSEL:FIELDGET("RG"),.F.,oRHSEL:FIELDGET("RGTIP"),oRHSEL:FIELDGET("NASC"),oRHSEL:FIELDGET("RGUF"))
	                oRHSEL:FIELDPUT("RG","")
	                oRHSEL:FIELDPUT("RGUF","")
	                oRHSEL:FIELDPUT("RGEMIS","")
	                oRHSEL:FIELDPUT("RGTIP","")
	                oRHSEL:FIELDPUT("RGDATA",CToD(Space(10)))
	             ENDIF
	
	             oRHSEL:FIELDPUTE("ENDNUM",oSERVER:FIELDGET("ENDNUM"))
	             oRHSEL:FIELDPUTE("ENDCOMPL",oSERVER:FIELDGET("ENDCOMPL"))
	             oRHSEL:FIELDPUTE("ENDTIP",oSERVER:FIELDGET("ENDTIP"))
	             oRHSEL:FIELDPUTE("IBGE",oSERVER:FIELDGET("IBGE"))
	             oRHSEL:FIELDPUTE("EMAIL",oSERVER:FIELDGET("EMAIL"))
	             oRHSEL:FIELDPUTE("SITUACAO",oSERVER:FIELDGET("SITUACAO"))
	
	             //Checa origem
	             IF validacnh(oSERVER:FIELDGET("CNH"))
		             oRHSEL:FIELDPUT("CNH",oSERVER:FIELDGET("CNH"))
		             oRHSEL:FIELDPUT("CATCNH",oSERVER:FIELDGET("CATCNH"))
		             oRHSEL:FIELDPUT("VALCNH",oSERVER:FIELDGET("VALCNH"))
		             oRHSEL:FIELDPUT("EXPCNH",oSERVER:FIELDGET("EXPCNH"))
		         ENDIF
		
		         //checa destino
		         IF ! validacnh(oRHSEL:FIELDGET("CNH"))
		             oRHSEL:FIELDPUTE("CNH","")
		             oRHSEL:FIELDPUTE("CATCNH","")
		             oRHSEL:FIELDPUTE("VALCNH",CToD(Space(10)))
		             oRHSEL:FIELDPUTE("EXPCNH",CToD(Space(10)))
		         ENDIF
		
		
	
	             oRHSEL:FIELDPUTE("OC",oSERVER:FIELDGET("OC"))
	             oRHSEL:FIELDPUTE("OCVAL",oSERVER:FIELDGET("OCVAL"))
	             oRHSEL:FIELDPUTE("OCEXP",oSERVER:FIELDGET("OCEXP"))
	             oRHSEL:FIELDPUTE("OCEMI",oSERVER:FIELDGET("OCEMI"))
	
	             oRHSEL:FIELDPUTE("BANCO",oSERVER:FIELDGET("BANCO"))
	             oRHSEL:FIELDPUTE("AGENCIA",oSERVER:FIELDGET("AGENCIA"))
	             oRHSEL:FIELDPUTE("CONTA",oSERVER:FIELDGET("CONTA"))
	             oRHSEL:FIELDPUTE("CONTAFGTS",oSERVER:FIELDGET("CONTAFGTS"))
	
	
	             IF CheckTitulo(oSERVER:FIELDGET("TITULO"),.f.)
		            oRHSEL:FIELDPUTE("TITULO",oSERVER:FIELDGET("TITULO"))
		            oRHSEL:FIELDPUTE("TITUZONA",oSERVER:FIELDGET("TITUZONA"))
		            oRHSEL:FIELDPUTE("TITUSECA",oSERVER:FIELDGET("TITUSECA"))
		         ENDIF

                 IF ! CheckTitulo(orhsel:FIELDGET("TITULO"),.f.)
		            oRHSEL:FIELDPUTE("TITULO","")
		            oRHSEL:FIELDPUTE("TITUZONA","")
		            oRHSEL:FIELDPUTE("TITUSECA","")
                 ENDIF	

	             oRHSEL:FIELDPUTE("PAI",oSERVER:FIELDGET("PAI"))
	             oRHSEL:FIELDPUTE("MAE",oSERVER:FIELDGET("MAE"))
	             IF valcns(oSERVER:FIELDGET("CNS"),.F.)
  	                oRHSEL:FIELDPUTE("CNS",oSERVER:FIELDGET("CNS"))
  	             ENDIF
	             IF ! valcns(oRHSEL:FIELDGET("CNS"),.F.)
  	                oRHSEL:FIELDPUT("CNS","")
  	             ENDIF

	
	             oRHSEL:FIELDPUTE("DEFICI",oSERVER:FIELDGET("DEFICI"))
	             oRHSEL:FIELDPUTE("EVINC",oSERVER:FIELDGET("EVINC"))
	             oRHSEL:FIELDPUTE("RACS",oSERVER:FIELDGET("RACS"))
	             oRHSEL:FIELDPUTE("TIPO",oSERVER:FIELDGET("TIPO"))
	             oRHSEL:FIELDPUTE("CONTAFGTS",oSERVER:FIELDGET("CONTAFGTS"))
	             oRHSEL:FIELDPUTE("RESERV",oSERVER:FIELDGET("RESERV"))
	             oRHSEL:FIELDPUTE("RESECAT",oSERVER:FIELDGET("RESECAT"))
	
	             oRHSEL:FIELDPUTE("CCUSTO",oSERVER:FIELDGET("CCUSTO"))
	             oRHSEL:FIELDPUTE("UNIFUN",oSERVER:FIELDGET("UNIFUN"))
	
	             oRHSEL:FIELDPUTE("APOSEND",oSERVER:FIELDGET("APOSEND"))
	             oRHSEL:FIELDPUTE("APOSENT",oSERVER:FIELDGET("APOSENT"))
	
	             //nao gera rhsel se o cpf for invalido
			     //IF Val(oRHSEL:FIELDGET("CPF"))=0
	             //   oRHSEL:FIELDPUT("CPF","")
			     //ENDIF	
			 ENDIF
   	         oSERVER:SKIP()
          ENDDO
          oRHSEL:CLOSE()
          oMP02:CLOSE()	
       ENDIF
    ENDIF
    oSERVER:CLOSE()
NEXT X
oPROGWIN:EndDialog()



METHOD APUOCOR() 
LOCAL aDAD,ACOM AS ARRAY
LOCAL oRHAB,oRHABTB,oMP04,oTABFALTA AS USEREDE
LOCAL nMES,nANO AS DWORD
LOCAL nNUMERO AS DWORD
LOCAL dDEMITIDO AS DATE
LOCAL nTOTALJU,nTOTALNJ
LOCAL cCHAVE,cCAMPO,cNOME,cJUSTIFICA,cCODIGX  AS STRING
LOCAL oPROGWIN AS PROGWIN

	
LOCAL oJCOM AS _JCOM
oJCOM:=_jCOM{SELF}
OjCOM:show()	

nMES:=oJCOM:NMES
nANO:=oJCOM:NANO	


aDAD:={zCURINI,"RHAB.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oRHAB:=USEREDE{aDAD,,,,aCOM}
IF oRHAB:nERRO#0
   RETU SELF
ENDIF

aDAD:={zCURINI,"RHABTB.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oRHABTB:=USEREDE{aDAD,,,,aCOM}
IF oRHABTB:nERRO#0
   oRHAB:CLOSE()	
   RETU SELF
ENDIF

aDAD:={zCURINI,"MP04.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oMP04:=USEREDE{aDAD,,,,aCOM}
IF oMP04:nERRO#0
   oRHABTB:CLOSE()
   oRHAB:CLOSE()	
   RETU SELF
ENDIF

aDAD:={zCURINI,"TABFALTA.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oTABFALTA:=USEREDE{aDAD,,,,aCOM}
IF oTABFALTA:nERRO#0
    RETU SELF
ENDIF


oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()


Oprogwin:nTOTAL:=omp04:RecCount
oMP04:GOTOP()
WHILE ! OMP04:EOF	
    Oprogwin:skip(1)
	dDEMITIDO:=oMP04:FIELDGET("DEMITIDO")
	IF ((Empty(dDEMITIDO)) .OR. (Month(dDEMITIDO)>=nMES .AND. Year(dDEMITIDO)>=nANO))
		nNUMERO:=OMP04:FIELDGET("TECNICO")
		cCHAVE:=Str(NANO,4)+Str(nMES,2)+Str(NNUMERO,8)
	    cNOME:=oMP04:FIELDGET("NOMTEC")	
  		oProgWin:oDCMessage:textValue:=Str(NnUMERO,8)+" "+cNOME
		oRHABTB:GOTOP()
		IF ! oRHABTB:SEEK(cCHAVE)
		   oRHABTB:APPEND()
		   oRHABTB:FIELDPUT("ANO",nANO)
	  	   oRHABTB:FIELDPUT("MES",nMES)
		   oRHABTB:FIELDPUT("NUMERO",nNUMERO)
	       oRHABTB:FIELDPUT("NOME",cNOME)	
	    ENDIF	
     ENDIF
	oMP04:SKIP()
ENDDO	
	
	
//AltD()	
Oprogwin:reset()
Oprogwin:nTOTAL:=oRHAB:RecCount
cCHAVE:=Str(NANO,4)+Str(nMES,2)
oRHAB:SETORDER(2)
oRHAB:GOTOP()
oRHAB:SEEK(cCHAVE)
WHILE ORHAB:FIELDGET("ANO")=nANO  .AND.  ORHAB:FIELDGET("MES")=nMES  .AND. ! oRHAB:EoF
	nNUMERO:=ORHAB:FIELDGET("NUMERO")
	cCHAVE:=Str(NANO,4)+Str(nMES,2)+Str(NNUMERO,8)
	nTOTALJU:=0
    nTOTALNJ:=0	
    cNOME:=""
    oMP04:GOTOP()
    IF oMP04:SEEK(nNUMERO)
       cNOME:=oMP04:FIELDGET("NOMTEC")	
    ENDIF
	oProgWin:oDCMessage:textValue:=Str(NnUMERO,8)+" "+cNOME
	oRHABTB:GOTOP()
	IF ! oRHABTB:SEEK(cCHAVE)
	   oRHABTB:APPEND()
	   oRHABTB:FIELDPUT("ANO",nANO)
  	   oRHABTB:FIELDPUT("MES",nMES)
	   oRHABTB:FIELDPUT("NUMERO",nNUMERO)
       oRHABTB:FIELDPUT("NOME",cNOME)	
    ENDIF	
	WHILE ORHAB:FIELDGET("ANO")=nANO  .AND.  ORHAB:FIELDGET("MES")=nMES  .AND.  ORHAB:FIELDGET("NUMERO")=nNUMERO  .AND. ! oRHAB:EoF			
         Oprogwin:skip(1)
         cJUSTIFICA:=oRHAB:FIELDGET("JUSTIFICA")
         cCODIGx   :=oRHAB:FIELDGET("CODIGO")
         IF Empty(cJUSTIFICA)
         	OTABFALTA:GOTOP()
         	IF OTABFALTA:SEEK(cCODIGx)
               cJUSTIFICA:=OTABFALTA:FIELDGET("RHABJUST")
               oRHAB:FieldPutz("JUSTIFICA",cJUSTIFICA)	
         	ENDIF
         ENDIF
         IF cJUSTIFICA='S'
            nTOTALJU+=oRHAB:FIELDGET("HORAS")
         ELSE
            nTOTALNJ+=oRHAB:FIELDGET("HORAS")
         ENDIF
         cCAMPO:="COD"+StrZero(Day(oRHAB:FIELDGET("DATA")),2)
         IF ! Empty(oRHAB:FIELDGET("CODIGO2"))
            oRHABTB:FIELDPUT(cCAMPO,oRHAB:FIELDGET("CODIGO2"))
         ELSE
            oRHABTB:FIELDPUT(cCAMPO,oRHAB:FIELDGET("CODIGO"))
         ENDIF
         ORHAB:Skip()
    ENDDO
    oRHABTB:FIELDPUT("TOTJU",nTOTALJU)
    oRHABTB:FIELDPUT("TOTNJ",nTOTALNJ)
ENDDO	

ORHAB:CLOSE()
oRHABTB:Close()
OPROGWIN:EndDialog()	
	
METHOD IMGDTM() 
LOCAL cARQ AS STRING
LOCAL nFout AS PTR
cARQ:=PEGINIVAL(ZCURINI,"PATH","IMGJPG")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("IMGJPG"),String2Psz("{IMGDTM}"),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 

METHOD IMGLOGIX() 
LOCAL cARQ AS STRING
LOCAL nFout AS PTR
cARQ:=PEGINIVAL(ZCURINI,"PATH","IMGJPG")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("IMGJPG"),String2Psz("{IMGLX}"),String2Psz(carq),SW_SHOWNORMAL) 
ShellExecuteErro(nFout)  

METHOD IMGMP04(oOWNER) 
LOCAL cARQ AS STRING
LOCAL nFout AS PTR
cARQ:=PEGINIVAL(ZCURINI,"PATH","IMGJPG")
nFout := ShellExecute(SELF:owner:handle(),String2Psz("open"),String2Psz("IMGJPG"),String2Psz("{IMGME04CPF}"),String2Psz(carq),SW_SHOWNORMAL)  
ShellExecuteErro(nFout) 


METHOD  IMPLOGIXFUn 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL cSQL AS STRING
LOCAL aDAD AS ARRAY
LOCAL oSERVER,oMP02 AS USEREDE
LOCAL cMIG AS STRING
LOCAL nNUMERO
LOCAL cNOME AS STRING
LOCAL aCOM AS ARRAY
LOCAL oPROGWIN AS PROGWIN
LOCAL nGRAU,nFUNCAO AS DWORD
LOCAL cESCOLA AS STRING
LOCAL oSTMT AS SQLStatement
LOCAL cCPF AS STRING

 cMIG:=PEGEMPMIG(ZEMPRESA)

 oConn := SQLConnection{}
 IF ! oConn:connect("ol_logix","","")
     alert("Erro na Conecção")
   	 RETURN .f.
 ENDIF	


cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()


CSQL:="SELECT funcionario.*,fun_infor.* "
CSQL+=" FROM funcionario left JOIN fun_infor ON fun_infor.cod_empresa = funcionario.cod_empresa AND fun_infor.num_matricula = funcionario.num_matricula"
CSQL+=" WHERE funcionario.COD_EMPRESA='" +CMIG+ "'"
CSQL+=" and funcionario.cod_vinculo<>99"
cSQL+=" ORDER BY funcionario.num_matricula"

   oreg:= SQLSelect{cSQL,oconn}


   IF oREG:RecCount=0
   	  alert("Arquivo logix em uso aguarde tente novamente")
	  Oconn:Disconnect()
   	  Oreg:close()
   ENDIF	

   aDAD:={zCURINI,"MP04.DBF",zCURDIR}
   aCOM:={zMES,zANO,ZEMPRESA}
   oSERVER:=USEREDE{aDAD,.F.,,,aCOM}
   IF oSERVER:nERRO#0
      RETU SELF
   ENDIF

   aDAD:={zCURINI,"MP02.DBF",zCURDIR}
   aCOM:={zMES,zANO,ZEMPRESA}
   oMP02:=USEREDE{aDAD,,,,aCOM}
   IF oMP02:nERRO#0
        oSERVER:Close()
        RETU SELF
   ENDIF
   oMP02:SetOrder(3) //Cod Folha



//MemoWrit("implogixmp04.sql",Csql)


   oProgWin := ProgWin{}
   oProgWin:Caption:="Sincronizando dados"
   oProgWin:SHOW()

   Oprogwin:nTOTAL:=100


   WHILE ! OREG:EoF	
   	     Oprogwin:skip(1)
         IF Oprogwin:nPOSICAO>100
         	Oprogwin:reset()
         ENDIF
         nNUMERO := oREG:FIELDGET("num_matricula")
         cNOME   := FIXSTR(oREG:FIELDGET("nom_completo"))
         Oprogwin:TITULO(StrZero(nNUMERO,8),.t.)
      	 oSERVER:SETORDER(1)
      	 oSERVER:GOTOP()
         IF ! oSERVER:SEEK(nNUMERO)
         	 oSERVER:Append()
             oSERVER:FIELDPUT("TECNICO",nNUMERO)
         ENDIF		


  		 oSERVER:FIELDPUTE("NOMTEC",cNOME)
         IF Empty(oSERVER:FIELDGET("admitido"))
         	oSERVER:FIELDPUT("admitido",oREG:FIELDGET("dat_admis"))
         ENDIF
         IF Empty(oSERVER:FIELDGET("DEMITIDO")) .AND. ! IsNil(OREG:FIELDGET("dat_demis"))
         	oSERVER:FIELDPUT("DEMITIDO",oREG:FIELDGET("dat_demis"))
         ENDIF	


        nGRAU:=FIXNUM(oREG:FIELDGET("cod_grau_instr"))
        cESCOLA:=escolalogix(nGRAU)
        oserver:FIELDPUTE("ESCRAIS",cESCOLA)


       	oSERVER:FIELDPUTE("SETOR",oREG:FIELDGET("cod_uni_funcio"))

        oSERVER:FIELDPUTZ("NUMREGANT",FIXNUM(oREG:FIELDGET("num_matricula_ant")))
        oSERVER:FIELDPUTZ("NUMEMPANT",Val(FIXSTR(oREG:FIELDGET("cod_empresa_ant"))))
        oSERVER:FIELDPUTZ("dattransf",oREG:FIELDGET("dat_transfer"))



        IF oSERVER:FIELDGET("TECNICO")=oSERVER:FIELDGET("NUMREGANT")
           oSERVER:FIELDPUT("NUMREGANT",0)
        ENDIF


         IF Empty(oSERVER:FIELDGET("TABTEC"))
         	nFUNCAO:=FIXNUM(oREG:FIELDGET("cod_cargo"))
         	IF ! Empty(nFUNCAO)
               oMP02:GOTOP()
               IF oMP02:SEEK(nFUNCAO)
                  oSERVER:FIELDPUT("TABTEC",oMP02:FIELDGET("CODIGO"))
               ENDIF
         	ENDIF
         ENDIF


        IF Val(TIRAOUT(oSERVER:FIELDGET("CPF")))=0 .or. !  Valcpf(oserver:FIELDGET("CPF"),FALSE) //em branco ou invalido
         	cCPF:=FIXSTR(oREG:FIELDGET("NUM_CPF"))
         	cCPF:=formatcpf(cCPF)
            oSERVER:FIELDPUTE("CPF",cCPF)
         ENDIF	



   	   Oreg:skip()
   ENDDO	
   Oreg:close()
   Oconn:Disconnect()
   Oserver:CLOSE()
   oMP02:CLOSE()
   OPROGWIN:EndDialog()


    IF MDG("Ajustar Fotos")
        SELF:sinfot()
   ENDIF	

   IF MDG("Sincronizar Historico")
   	  SELF:ajustar(3)
   ENDIF	

   IF MDG("Sincronizar Selecao")
   	  SELF:aJUSTAR(4)
   	  SELF:IMPLXANT()
   ENDIF	

   alert("Concluido")


METHOD  IMPLXANT 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL cSQL AS STRING
LOCAL aDAD AS ARRAY
LOCAL oSERVER AS USEREDE
LOCAL cMIG,cEMP,cCAM AS STRING
LOCAL nNUMERO //,nEMP
LOCAL aCOM AS ARRAY
LOCAL oPROGWIN AS PROGWIN
LOCAL oSTMT AS SQLStatement
LOCAL nPOSGRV AS WORD


   cMIG:=PEGEMPMIG(ZEMPRESA)

   aDAD:={zCURINI,"RHSEL.DBF",zCURDIR}
   aCOM:={zMES,zANO,ZEMPRESA}
   oSERVER:=USEREDE{aDAD,.F.,,,aCOM}
   IF oSERVER:nERRO#0
      RETU SELF
   ENDIF

   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conecção")
   	  RETURN .f.
   ENDIF	


cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()


CSQL:="SELECT fun_empregos.*,empresa_outras.den_empresa"
CSQL+=" FROM empresa_outras,fun_empregos"
CSQL+=" where empresa_outras.cod_empresa=fun_empregos.cod_empresa_ant"
CSQL+="       and fun_empregos.cod_empresa='" +CMIG+ "'"
cSQL+=" order by cod_empresa,num_matricula,dat_demissao desc"


oProgWin := ProgWin{SELF}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()

Oprogwin:nTOTAL:=100

AltD()
   oreg:= SQLSelect{cSQL,oconn}
   WHILE ! OREG:EoF	
     	 nNUMERO := oREG:FIELDGET("num_matricula")
         cEMP:=oREG:FIELDGET("cod_empresa")
         //nEMP:=Val(cEMP)
         nPOSGRV:=1
         WHILE nNUMERO = oREG:FIELDGET("num_matricula") .AND. cEMP=oREG:FIELDGET("cod_empresa") .AND. ! OREG:EoF	
   	        Oprogwin:skip(1)
            IF Oprogwin:nPOSICAO>100
               Oprogwin:reset()
            ENDIF
            Oprogwin:TITULO(StrZero(nNUMERO,8),.t.)
            IF nPOSGRV<4
               cCAM:="EX"+StrZero(nPOSGRV,2)	
               oSERVER:GOTOP()
               IF oSERVER:SEEK(Str(ZEMPRESA,3)+Str(nNUMERO,8))
                  oSERVER:FIELDPUT(cCAM+"EMP",oREG:FIELDGET("den_empresa"))
                  oSERVER:FIELDPUT(cCAM+"ADM",oREG:FIELDGET("dat_admissao"))
                  oSERVER:FIELDPUT(cCAM+"DEM",oREG:FIELDGET("dat_demissao"))
               ENDIF
            ENDIF
	        nPOSGRV:=nPOSGRV+1
	        Oreg:skip()
         ENDDO
   ENDDO	
   Oreg:close()
   Oconn:Disconnect()
   Oserver:CLOSE()
   OPROGWIN:EndDialog()
   alert("Concluido")


METHOD IMPOCOR() 
LOCAL cARQUIVO AS STRING
LOCAL oPO AS DBSERVER
LOCAL aDAD,Acom AS ARRAY
LOCAL oRHAB,oFOPTOCOM AS USEREDE
LOCAL nMES,nANO AS DWORD
LOCAL nNUMERO AS DWORD
LOCAL dINI,dFIM,dINIMES,dFIMMES AS DATE
LOCAL nHORAS
LOCAL X
LOCAL cCHAVE,CCODIGO,cOCOSUB
LOCAL lGRAVA AS LOGIC


LOCAL oPROGWIN AS PROGWIN

	
LOCAL oJCOM AS _JCOM
oJCOM:=_jCOM{SELF}
OjCOM:show()	

nMES:=oJCOM:NMES
nANO:=oJCOM:NANO	

aDAD:={zCURINI,"FOPTOCOM.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oFOPTOCOM:=USEREDE{aDAD,,,,aCOM}
IF oFOPTOCOM:nERRO#0
   RETU SELF
ENDIF
AltD()
oFOPTOCOM:GOTOP()
IF oFOPTOCOM:SEEK(Str(NANO,4)+Str(nMES,2)+Str(ZEMPRESA,8))
	dINIMES:=oFOPTOCOM:FIELDGET("DATAINI")
	dFIMMES:=oFOPTOCOM:FIELDGET("DATAFIM")
ELSE
	dINIMES:=CToD('01/'+StrZero(NMES,2)+'/'+StrZero(NANO,4))
	dFIMMES:=LastDayofMonth(dINIMES)
ENDIF
oFOPTOCOM:CLOSE()	


caRQUIVO:=PEGINIVAL(ZCURINI,"PATH","FOLHAEMZ")
cARQUIVO:=CAMINEX(cARQUIVO,NMES,NANO,ZEMPRESA)
cARQUIVO+='PO'+Right(StrZero(NANO,4),2)+StrZero(NMES,2)+'.DBF'


IF ! File(cARQUIVO)
    alert("Arquivo Não Encontrado","Erro Abrindo o Arquivo: "+cARQUIVO)
	RETU SELF
ENDIF	


oPO:=DBSERVER{cARQUIVO,.T.}
IF ! oPO:Used
   alert("Outro Usuario Arquivo Aberto - Tente Depois","Erro Abrindo o Arquivo")
  RETU SELF
ENDIF	

oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()

Oprogwin:nTOTAL:=oPO:RecCount


aDAD:={zCURINI,"RHAB.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oRHAB:=USEREDE{aDAD,,,,aCOM}
IF oRHAB:nERRO#0
   oPO:Close()
   RETU SELF
ENDIF
oPO:GOTOP()
WHILE ! opO:EoF
    Oprogwin:skip(1)
	   dINI:=OPO:FIELDGET("OCOINI")	
	   IF Empty(OPO:FIELDGET("OCOFIM"))	
          dFIM:=OPO:FIELDGET("OCOINI")
       ELSE
     	  dFIM:=OPO:FIELDGET("OCOFIM")	
       ENDIF	
       IF dFIM<dINIMES //data inferior ao dia dia 01 exemplo 31 mes/anterior        
       	  NOP
       ELSE	
		   IF dFIM>DFIMMES
		   	  dFIM:=DFIMMES
		   ENDIF
		   IF dINI<dINIMES
		   	  dINI:=DINIMES
		   ENDIF
		   IF dFIM-dINI+1>0     //Preenchimento errado data inicial e final
  		      nHORAS:=OPO:FIELDGET("HRREL")/(dFIM-dINI+1)	
  		   ELSE
  		   	  nHORAS:=0
           ENDIF
		   nNUMERO:=OPO:FIELDGET("NUMERO")
		   cCODIGO:=oPO:FIELDGET("OCOCOD")
		   cOCOSUB:=oPO:FIELDGET("OCOSUB")
	   	   oProgWin:oDCMessage:textValue:=Str(NnUMERO,8)
		   FOR X:=dINI TO dFIM
		   	   oProgWin:oDCMessage:textValue:=Str(NnUMERO,8)+' - '+DToC(X) + ' - ' +cCODIGO
	  	   	   cCHAVE:=Str(NNUMERO,8)+DToS(X)
	  	   	   lGRAVA:=.T.
	  	   	   IF  Left(cOCOSUB,1)<>"_"
	  	   	   	   lGRAVA:=.F.
	  	   	   ENDIF
	  	   	   IF  cOCOSUB='SA'  .AND. nHORAS=0
	  	   	   	   lGRAVA:=.F.
	  	   	   ENDIF
	
      	  	   IF Empty(OPO:FIELDGET("ococod"))  .and. Empty(OPO:FIELDGET("ocosub"))  .and. OPO:FIELDGET("abona")='P'  .and. Empty(OPO:FIELDGET("motivo"))
                   lGRAVA:=.F.      	  	   	//ocorrencia de almoco para hora extras desconsiderar)
               ENDIF
		   	   IF  lGRAVA //       Month(X)=NMES .AND. Year(X)=NANO .AND.
			   	   oRHAB:GOTOP()
			   	   IF ! oRHAB:SEEK(cCHAVE)
			   	   	  oRHAB:Append()
			   	   	  oRHAB:FIELDPUT("NUMERO",nNUMERO)
		   	   	      oRHAB:FIELDPUT("CODIGO",cCODIGO)
			   	   	  oRHAB:FIELDPUT("DATA",X)
		   	   	      oRHAB:FIELDPUT("HORAS",nHORAS)
			   	   	  oRHAB:FIELDPUT("MES",Month(X))
			   	   	  oRHAB:FIELDPUT("ANO",Year(X))
			   	   ELSE
                      oRHAB:FieldPutz("CODIGO",cCODIGO)	
			   	   ENDIF
			   ENDIF
		   NEXT X	
	   ENDIF	

	Opo:Skip()
ENDDO	

ORHAB:CLOSE()
oPO:Close()

OPROGWIN:EndDialog()

CONSTRUCTOR( oOwnerApp ) 
//	LOCAL oSB AS StatusBar
	LOCAL oSBIUSER AS StatusBarItem
        LOCAL oSBIDATE AS StatusBarItem	
        LOCAL cDATE AS STRING
	
	SUPER: INIT( oOwnerApp )
	
	aChildWindows := {}

        oSBIDate := StatusBarItem{}
	oSBIDate:Style := SBITEMSUNKEN
	cDate := Ddia(Today()) //+ //FullDate(Today())
	oSBIDate:Width := 8* Len(cDate)
	oSBIDate:NameSym := #SBDateItem
	
	oSBIUser := StatusBarItem{}
	oSBIUser:Style := SBITEMRAISED
	oSBIUser:Width := 8*(25) //8 N + "-" + Cognome(15) Len("ADMIN")
	oSBIUser:NameSym := #SBUser
	

	//oSB := SELF:EnableStatusBar()
	SELF:StatusBar:DisplayKeyboard() //
	SELF:StatusBar:DisplayTime()         //
        SELF:StatusBar:Additem (oSBIDATE)
        SELF:StatusBar:Additem (oSBIUser)
	SELF:statusBar:SetText (cDate, #SBDateItem)
	
//	SELF:statusBar:SetText (Str(ZFOLHA,8)+"-"+ZUSER, #SBUser)
// mudado startup para refresh var




	SELF:Menu := EmptyShellMenu{ SELF }

	SELF:Icon := Icon{ResourceID{IDI_STANDARDICON}}
	
	RETURN SELF



METHOD sayCOM() 
//  LOCAL oJCOM AS JCOM
//  oJCOM:=jCOM{SELF}
//  OjCOM:show()		
//  SELF:Caption:="Módulo RH/Treinamento - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		

// LOCAL oJDIA AS JDIA	
//  oJDIA:=jdia{SELF}
//  Ojdia:show()		
//  SELF:Caption:="Módulo RH/Treinamento - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		
//  zDIR:=PEGINIVAL(ZCURINI,"PATH","FOLHA")
//  ZDIRE:=PEGINIVAL(ZCURINI,"PATH","FOPTOEMP")
//  ZDIRE:=StrTran(zDIRE,"[AA]",Right(StrZero(zANO,4),2))
//  ZDIRE:=StrTran(zDIRE,"[AAAA]",StrZero(zANO,4))
//  ZDIRE:=StrTran(zDIRE,"[ZZZ]",StrZero(zEMPRESA,3))	
//  ZDIRE:=StrTran(zDIRE,"[ZZ]",StrZero(zEMPRESA,2))
//  ZDIRE:=StrTran(zDIRE,"[Z]",StrZero(zEMPRESA,1))
//  zDIRN:=ZDIR+"E"+StrZero(zANO,4)+"\"


  LOCAL oJCOM AS JCOM
  oJCOM:=jCOM{SELF}
  OjCOM:show()		
  SELF:Caption:="Módulo RH/Treinamento - Empresa:"+StrZero(ZEMPRESA,3)+" Competencia:"+StrZero(ZMES,2)+"/"+StrZero(ZANO,4)		
  zDIR:=PEGINIVAL(ZCURINI,"PATH","FOLHA")
  ZDIRE:=PEGINIVAL(ZCURINI,"PATH","FOPTOEMP")
  ZDIRE:=StrTran(zDIRE,"[AA]",Right(StrZero(zANO,4),2))
  ZDIRE:=StrTran(zDIRE,"[AAAA]",StrZero(zANO,4))
  ZDIRE:=StrTran(zDIRE,"[ZZZ]",StrZero(zEMPRESA,3))	
  ZDIRE:=StrTran(zDIRE,"[ZZ]",StrZero(zEMPRESA,2))
  ZDIRE:=StrTran(zDIRE,"[Z]",StrZero(zEMPRESA,1))
  zDIRN:=ZDIR+"E"+StrZero(zANO,4)+"\"


METHOD sinfot() 
//LOCAL oEMP AS USEMANA5
LOCAL oSERVER AS USEREDE
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
//LOCAL oTABLE AS SQLTABLE
LOCAL cSQL,cARQIMG,cCPF AS STRING
LOCAL nNUMERO
LOCAL oStmt AS SQLStatement
LOCAL aDAD,aCOM AS ARRAY
LOCAL oPROGWIN AS PROGWIN
LOCAL nLASTREC AS DWORD
LOCAL nPOS AS DWORD
LOCAL nPERC AS INT
LOCAL aUSO AS ARRAY


IF ! entramenu("RH",17)
	RETU SELF
ENDIF	

nPOS:=0

/*
cARQIMG:=""
aDAD:={zCURINI,"MANEMP",zCURDIR,aDIR}
oEMP:=USEMANA5{aDAD}
IF oEMP:nERRO#0
   RETU SELF
ENDIF	
oEMP:GOTOP()
IF oEMP:SEEK(ZEMPRESA)
   cARQIMG:=oEMP:FIELDGET("IMGCON")
ENDIF
oEMP:CLOSE()
IF Empty(cARQIMG)
   cARQIMG:="IMG"+StrZero(ZEMPRESA,3)
ENDIF
*/

aDAD:={zCURINI,"MP04.DBF",zCURDIR}
aCOM:={zMES,zANO,ZEMPRESA}
oSERVER:=USEREDE{aDAD,,,,aCOM}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SELF:POINTER:=POINTER{POINTERHOURGLASS}


oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()


/*
cARQIMG:=AllTrim(cARQIMG)
oConn := SQLConnection{cARQIMG}
IF ! OCONN:Connected
   oSERVER:CLOSE()	
   SELF:POINTER:=POINTER{}
   alert("Erro na Conecção Arquivo Foto " + cARQIMG)
   RETU
ENDIF	

oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()
nLASTREC:=100
aUSO:={}
cSQL:="SELECT NUMERO FROM IMAGENS"
oreg:= SQLSelect{cSQL,oconn}
WHILE ! oREG:EOF	
   nNUMERO:=FIXNUM(oREG:FIELDGET("NUMERO"))
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   IF nPOS=100
   	  nPOS:=1
   ENDIF
   oProgWin:oDcProgBar:Position := nPerc
   IF nNUMERO>0
	   oPROGWIN:Caption := Str(nNUMERO)
	   AAdd(AUSO,nNUMERO)
   ENDIF	
   oREG:SKIP()
ENDDO
oREG:CLOSE()
nLASTREC:=Oserver:RecCount
nPOS:=1
oSERVER:GOTOP()
WHILE ! oSERVER:EoF
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   oProgWin:oDcProgBar:Position := nPerc
   oProgWin:oDCMessage:textValue:=StrZero(npos,8)+"/"+StrZero(nLASTREC,8)
   oSERVER:FIELDPUT("CNUMERO",StrZero(oSERVER:FIELDGET("TECNICO"),8))		
   nNUMERO:=oSERVER:FIELDGET("TECNICO")
   IF AScan(aUSO,nNUMERO)=0
 	  cSQL:= "Insert into imagens (CODIGO,NUMERO) values ('"+StrZero(nNUMERO,8)+"',"+StrTran(Str(nNUMERO,8)," ","")+")"
   	  oStmt := SQLStatement{cSQL,oConn}
      oSTMT:Execute()
   ENDIF	
   oSERVER:SKIP()
ENDDO	
oCONN:Disconnect()
*/


cARQIMG:="FMP04cpf"
oConn := SQLConnection{}
IF ! oConn:connect(cARQIMG,"","")
   oSERVER:CLOSE()	
   SELF:POINTER:=POINTER{}
   alert("Erro na Conecção Arquivo Foto " + cARQIMG)
   oPROGWIN:EndDialog()
   RETURN .f.
ENDIF	
aUSO:={}
nLASTREC:=100
cSQL:="SELECT NUMERO FROM IMAGENS"
oreg:= SQLSelect{cSQL,oconn}
WHILE ! oREG:EOF	
   nNUMERO:=FIXNUM(oREG:FIELDGET("NUMERO"))
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   IF nPOS=100
   	  nPOS:=1
   ENDIF
   oProgWin:oDcProgBar:Position := nPerc
   IF nNUMERO>0
	   oPROGWIN:Caption := Str(NNUMero)
	   AAdd(AUSO,nNUMERO)
   ENDIF	
   oREG:SKIP()
ENDDO
oREG:CLOSE()

nLASTREC:=Oserver:RecCount
oSERVER:GOTOP()
WHILE ! oSERVER:EoF
   cCPF:=oSERVER:FIELDGET("CPF")
   nNUMERO:=Val(TIRAOUT(cCPF))
   nPerc := INT(100* nPOS/ nLASTREC)
   nPOS++
   oProgWin:oDcProgBar:Position := nPerc
   oPROGWIN:Caption := Str(nNUMERO)
   oProgWin:oDCMessage:textValue:=StrZero(npos,8)+"/"+StrZero(nLASTREC,8)
   IF Valcpf(CCPF,.F.)
	   IF AScan(aUSO,nNUMERO)=0
	 	  cSQL:= "Insert into imagens (CODIGO,NUMERO) values ('"+cCPF+"',"+StrTran(Str(nnumero,11)," ","")+")"
	   	  oStmt := SQLStatement{cSQL,oConn}
	      oSTMT:Execute()
	   ENDIF	
   ENDIF
   oSERVER:SKIP()
ENDDO	
oCONN:Disconnect()

oSERVER:cLOSE()
SELF:POINTER:=POINTER{POINTERARROW}
oPROGWIN:EndDialog()


METHOD XIMPFOL(oOWNER) 
IF ! entramenu("RH",8)
	RETU SELF
ENDIF	
SELF:AJUSTAR(2)	

METHOD XIMPFOL2(oOWNER) 
IF ! entramenu("RH",9)
	RETU SELF
ENDIF	
SELF:AJUSTAR(3)	


METHOD XIMPFOL4(oOWNER) 
//IF ! entramenu("RH",9)
//	RETU SELF
//ENDIF	
SELF:AJUSTAR(4)	

METHOD xWRPTabs() 
SELF:XWRPTGRP("RH","ABS")	

METHOD xWRPTare() 
SELF:XWRPTGRP("RH","ARE")

METHOD xWRPTcad() 
SELF:XWRPTGRP("RH","CAD")	

METHOD xWRPTcur() 
SELF:XWRPTGRP("RH","CUR")	

METHOD xWRPTesc() 
SELF:XWRPTGRP("RH","ESC")	

METHOD xWRPTfot() 
SELF:XWRPTGRP("RH","FOT")	

METHOD xWRPTfun() 
SELF:XWRPTGRP("RH","FUN")	

METHOD xWRPThis() 
SELF:XWRPTGRP("RH","HIS")	

METHOD xWRPThor() 
SELF:XWRPTGRP("RH","HOR")		

METHOD xWRPTprg() 
SELF:XWRPTGRP("RH","PRG")			

METHOD xWRPTpro() 
SELF:XWRPTGRP("RH","PRO")				

METHOD xWRPTrh() 
SELF:XWRPTGRP("RH","")					

METHOD xWRPTset() 
SELF:XWRPTGRP("RH","SET")					

METHOD xWRPTtre() 
SELF:XWRPTGRP("RH","TRE")						


END CLASS
