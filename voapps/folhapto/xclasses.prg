CLASS IMPLOGIXAFA INHERIT XDIAPAD	

CONSTRUCTOR(oOWNER) 
SUPER(oOWNER,{"","","",""},{.F.,.F.,.F.,.F.})
SELF:SHOW()		


METHOD OK( ) 
LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cSQL,cPN AS STRING
  //  LOCAL aDAD AS ARRAY
    LOCAL oSERVER,oPN AS USEFOLHA
    LOCAL cARQ AS STRING
    LOCAL dataini AS DATE
    LOCAL datafim AS DATE
    LOCAL dUSOINI AS DATE
    LOCAL dUSOFIM AS DATE
    LOCAL mCHAVE AS STRING
    LOCAL cCOD AS STRING
    LOCAL aCOD01 AS ARRAY
    LOCAL aCOD02 AS ARRAY
    LOCAL aCODR1 AS ARRAY
    LOCAL aCODR2 AS ARRAY
    LOCAL nCODAFA AS DWORD
    LOCAL cMIG AS STRING
    LOCAL nPOS,nNUMERO AS DWORD
    LOCAL oStmt AS SQLStatement



    aCOD01:={}
    aCOD02:={}
    aCODR1:={}
    aCODR2:={}


   cMIG:=StrZero(zempRESA,2)
   oSERVER:=USEFOLHA{"FIRMA"}
   IF oSERVER:nERRO#0
       RETU SELF
   ENDIF
   oSERVER:GOTOP()
   IF oSERVER:SEEK(ZEMPRESA)
   	  IF ! Empty(oSERVER:FIELDGET("CODEMPMIG"))
         cMIG:=oSERVER:FIELDGET("CODEMPMIG")
      ENDIF
    ENDIF
    oSERVER:CLOSE()


   oSERVER:=USEFOLHA{"TABFALTA"}
   IF oSERVER:nERRO#0
       RETU SELF
   ENDIF
   oSERVER:GOTOP()
   WHILE ! oSERVER:EOF
   	  IF ! Empty(oSERVER:FIELDGET("CODIMP01"))
   	  	 AAdd(ACOD01,oSERVER:FIELDGET("CODIMP01"))
         AAdd(ACODR1,oSERVER:FIELDGET("CODIGO"))
      ENDIF
   	  IF ! Empty(oSERVER:FIELDGET("CODIMP02"))
   	  	 AAdd(ACOD02,oSERVER:FIELDGET("CODIMP02"))
   	  	 AAdd(ACODR2,oSERVER:FIELDGET("CODIGO"))
      ENDIF
      oSERVER:SKIP()
    ENDDO
    oSERVER:CLOSE()



    cARQ:="PO"+ZCOMP
    IF ! checkcri(caRQ,"FO_POCO","STR(NUMERO,8)+DTOS(OCOINI)")
       RETU SELF
    ENDIF
    oSERVER:=USEFOLHA{cARQ}
    IF oSERVER:nERRO#0
       RETU SELF
    ENDIF



    cPN:="PN"+ZCOMP
    IF ! checkcri(cPN,"FO_PON","STR(NUMERO,8)+DTOS(DATA)")
       RETU SELF
    ENDIF
    oPN:=USEFOLHA{cPN}
    IF oPN:nERRO#0
       RETU SELF
    ENDIF



   dataini:=SELF:DINI
   datafim:=SELF:DFIM

   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conec��o")
   	  RETURN .f.
   ENDIF	


cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()
cSQL:=" SELECT ficha_afasta.*,motivo_afasta_trab.den_afasta, "
cSQL+="         motivo_afasta_trab.texto_parametro[11,13] AS esocial "
cSQL+="  FROM ficha_afasta "
cSQL+=" LEFT JOIN motivo_afasta_trab ON ficha_afasta.cod_empresa=motivo_afasta_trab.cod_empresa "
cSQL+="            AND ficha_afasta.cod_afasta=motivo_afasta_trab.cod_afasta "
cSQL+="            AND motivo_afasta_trab.dat_validade_fim>=today "
cSQL+="  where ficha_afasta.COD_EMPRESA='" +CMIG+ "'"
cSQL+=" and dat_fim_afasta>='" +DToC(DATAini)+ "'"


   oreg:= SQLSelect{cSQL,oconn}

   WHILE ! OREG:EoF	
       dUSOINI:=oREG:FIELDGET("dat_ini_afasta")
       dUSOFIM:=oREG:FIELDGET("dat_fim_afasta")
       nCODAFA:=oREG:FIELDGET("cod_afasta")
       nNUMERO:=oREG:FIELDGET("num_matricula")
       IF Empty(dUSOFIM) .OR. (dUSOFIM>=DATAINI .AND. dUSOFIM<=DATAFIM)
         mCHAVE := Str(nNUMERO , 8 ) + DToS(dUSOINI)
         oSERVER:GOTOP()
         IF .not.oSERVER:SEEK( mCHAVE )
            oSERVER:APPEND()
            oSERVER:FIELDPUT("NUMERO",nNUMERO)
            oSERVER:FIELDPUT("OCOINI",DUSOINI)
            oSERVER:FIELDPUT("OCOFIM",DUSOFIM)
            cCOD:=""
            NPOS:=AScan(acod01,nCODAFA)
            IF nPOS>0
               cCOD:=aCODR1[NPOS]
            ELSE
               NPOS:=AScan(acod02,nCODAFA)
               IF nPOS>0
                  cCOD:=aCODR2[NPOS]
               ENDIF
            ENDIF
            oSERVER:FIELDPUT("OCOCOD",cCOD)
            IF cCOD="AF"
              oSERVER:FIELDPUT("CESTA","P")	
              oSERVER:FIELDPUT("ABONA","P")	
            ENDIF	
         ELSE
        	//ajusta as data caso o funcionario retorne do afastamento
            oSERVER:FIELDPUT("OCOFIM",DUSOFIM)
         ENDIF
         oSERVER:FIELDPUTE("OCOMOT","Logix->"+FIXSTR(oREG:FIELDGET("den_afasta")))
         oSERVER:FIELDPUTE("ESITU",StrZero(Val(FIXSTR(OREG:FIELDGET("esocial"))),2))

         //Zera codigos caso o funcionario retorne antes da data
         mCHAVE := Str(nNUMERO , 8 ) + DToS(DATAINI)
         oPN:GOTOP()
         oPN:SEEK(mCHAVE)
         WHILE nNUMERO=oPN:FIELDGET("NUMERO") .AND. ! oPN:EOF
         	 oPN:FIELDPUT("COD","")
          	 oPN:FIELDPUT("SOD","")
         	 oPN:Skip()
         ENDDO
       ENDIF
   	   Oreg:skip()
   ENDDO	
   Oreg:close()
   Oconn:Disconnect()
   Oserver:CLOSE()
   oPN:CLOSE()
   IF MDG("Iniciar o mes")
     INICIAMES()
ENDIF



METHOD POSTINIT() 
LOCAL aRETU AS ARRAY
aRETU:=pegcomp()
DINI:=ARETU[1]
DFIM:=ARETU[2]+365

END CLASS
CLASS IMPLOGIXFER INHERIT XDIAPAD

CONSTRUCTOR(oOWNER) 
SUPER(oOWNER,{"","","",""},{.F.,.F.,.F.,.F.})
SELF:CAPTION:="Importando Ferias Logix->Ponto"
SELF:SHOW()		

METHOD OK( ) 
LOCAL oConn AS SQLConnection
    LOCAL oREG AS SQLSelect
    LOCAL cSQL AS STRING
    LOCAL oSERVER,oPN AS USEFOLHA
    LOCAL cARQ,cPN AS STRING
    LOCAL datafim AS DATE
    LOCAL DATAINI AS DATE
    LOCAL dUSOINI AS DATE
    LOCAL dUSOFIM AS DATE 
 //   LOCAL dDATAINI AS DATE
    LOCAL mCHAVE AS STRING
    LOCAL cMIG AS STRING
    LOCAL nNUMERO AS DWORD
    LOCAL oStmt AS SQLStatement


 


   cMIG:=StrZero(zempRESA,2)
   oSERVER:=USEFOLHA{"FIRMA"}
   IF oSERVER:nERRO#0
       RETU SELF
   ENDIF
   oSERVER:GOTOP()
   IF oSERVER:SEEK(ZEMPRESA)
   	  IF ! Empty(oSERVER:FIELDGET("CODEMPMIG"))
         cMIG:=oSERVER:FIELDGET("CODEMPMIG")
        // alert(CMIG)
      ENDIF
    ENDIF
    oSERVER:CLOSE()




    cARQ:="PO"+ZCOMP
    IF ! checkcri(caRQ,"FO_POCO","STR(NUMERO,8)+DTOS(OCOINI)")
       RETU SELF
    ENDIF
    oSERVER:=USEFOLHA{cARQ}
    IF oSERVER:nERRO#0
       RETU SELF
    ENDIF


    cPN:="PN"+ZCOMP
    IF ! checkcri(cPN,"FO_PON","STR(NUMERO,8)+DTOS(DATA)")
       RETU SELF
    ENDIF
    oPN:=USEFOLHA{cPN}
    IF oPN:nERRO#0
       RETU SELF
    ENDIF




   dataini:=(SELF:DINI)-31 //ferias iniciada competencia passada final nessa
   datafim:=SELF:DFIM

   oConn := SQLConnection{}
   IF ! oConn:connect("ol_logix","","")
  	  alert("Erro na Conec��o")
   	  RETURN .f.
   ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

   cSQL:="SELECT * FROM ficha_ferias where dat_ini_gozo>='" + DToC(DATAINI)+ "' AND COD_EMPRESA='" +CMIG+ "'"
   CSQL+=" AND ies_tipo_progr<>'I'"
   // ies_tipo_progr = I = Demissao


   oreg:= SQLSelect{cSQL,oconn}

   WHILE ! OREG:EoF	
       dUSOINI:=oREG:FIELDGET("dat_ini_gozo")
       dUSOFIM:=oREG:FIELDGET("dat_fim_gozo")
       nNUMERO:=oREG:FIELDGET("num_matricula")
       IF dUSOINI>=DATAINI .AND. dUSOINI<=DATAFIM
         mCHAVE := Str(nNUMERO , 8 ) + DToS(dUSOINI)
         oSERVER:GOTOP()
         IF ! oSERVER:SEEK( mCHAVE )
            oSERVER:APPEND()
            oSERVER:FIELDPUT("NUMERO",nNUMERO)
            oSERVER:FIELDPUT("OCOINI",dUSOINI)
            oSERVER:FIELDPUT("OCOFIM",DUSOFIM)
            oSERVER:FIELDPUT("OCOCOD","FN")
            oSERVER:FIELDPUT("OCOMOT","Ferias Logix")
            oSERVER:FIELDPUT("CESTA","P")	
            oSERVER:FIELDPUT("ABONA","P")	
            oSERVER:FIELDPUT("ESITU","15") //gozo de ferias
         ELSE
        	//ajusta as data caso o funcionario mude aquisitivo
            oSERVER:FIELDPUT("OCOFIM",DUSOFIM)
         ENDIF
         //Zera codigos caso o funcionario retorne antes da data
         mCHAVE := Str(nNUMERO , 8 ) + DToS(DUSOINI)
         oPN:GOTOP()
         oPN:SEEK(mCHAVE)
         WHILE nNUMERO=oPN:FIELDGET("NUMERO") .AND. ! oPN:EOF
//             dDATAINI:=oPN:FIELDGET("DATA")
//         	 IF dDATAINI>=dUSOINI.AND.dDATAINI<=dUSOFIM
           	    oPN:FIELDPUT("COD","") //Zera codigos caso o funcionario retorne antes da data
          	    oPN:FIELDPUT("SOD","")
//         	 ENDIF
       	     oPN:Skip()
         ENDDO
       ENDIF
   	   Oreg:skip()
   ENDDO	
   Oreg:close()
   Oconn:Disconnect()
   Oserver:CLOSE()
   oPN:CLOSE()
   IF MDG("Iniciar o mes")
     INICIAMES()
   ENDIF


METHOD POSTINIT() 
LOCAL aRETU AS ARRAY
aRETU:=pegcomp()
DINI:=ARETU[1]
DFIM:=ARETU[2]


END CLASS
CLASS XESCPAD INHERIT JFOPTO_REV

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"ESCALPAD"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()				
	

END CLASS
CLASS XJBCODEM INHERIT JBCOHRS				

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
cARQ:=IF(lSECBCO,"BCODEK","BCODEM")
oSERVER:=USEFOLHA{cARQ}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()				

END CLASS
CLASS XJBCOHRS INHERIT JBCOHRS


CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
cARQ:=IF(lSECBCO,"BCOBAK","BCOHRS")
oSERVER:=USEFOLHA{cARQ}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()	

END CLASS
CLASS XJBCOREQ INHERIT JBCOREQ

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
cARQ:=IF(lSECBCO,"BK","BH")+ZCOMP
IF ! checkcri(caRQ,"BCOREQ","REQUISI")
   RETU SELF
ENDIF
oSERVER:=USEFOLHA{cARQ}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()	

END CLASS
CLASS XJCBO  INHERIT JESCC

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FO_CBO"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()


END CLASS
CLASS XJCBON  INHERIT JESCC	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FO_CBON"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()

	

END CLASS
CLASS XJCESTA INHERIT JCESTA

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"CESTA"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()


END CLASS
CLASS xJCONTAS INHERIT JCONTAS	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"CONTAS"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()

END CLASS
CLASS XJctrHOR INHERIT JCTRHOR

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"CTRHOR"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()

END CLASS
CLASS XJDEPTO INHERIT JDEPTO

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"DEPTO"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()

END CLASS
CLASS XJFIRMA INHERIT JFIRMA

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FIRMA"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()

END CLASS
CLASS XJFO_Pdes INHERIT JFO_Pdes

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
cARQ:="PX"+ZCOMP
IF ! checkcri(caRQ,"FO_PDES","STR(NUMERO,8)+DTOS(DATA)+STR(CONTA)")
   RETU SELF
ENDIF
oSERVER:=USEFOLHA{cARQ}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()		

END CLASS
CLASS XJFO_PES INHERIT JFO_PES	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FO_PES"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()



END CLASS
CLASS XJFO_PHOR INHERIT JFO_PHOR

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
cARQ:="PH"+ZCOMP
IF ! checkcri(caRQ,"FO_PHOR","STR(NUMERO,8)+DTOS(OCOINI)")
   RETU SELF
ENDIF
oSERVER:=USEFOLHA{cARQ}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()		

END CLASS
CLASS XJFO_PMAN INHERIT JFO_PMAN

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
cARQ:="PM"+ZCOMP
IF ! checkcri(caRQ,"FO_PMAN","STR(NUMERO,8)+DTOS(DATOCO)+TIPOCO")
   RETU SELF
ENDIF
oSERVER:=USEFOLHA{cARQ}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()			

END CLASS
CLASS XJFO_POCO INHERIT JFO_POCO	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
cARQ:="PO"+ZCOMP
IF ! checkcri(caRQ,"FO_POCO","STR(NUMERO,8)+DTOS(OCOINI)")
   RETU SELF
ENDIF
oSERVER:=USEFOLHA{cARQ}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()			

END CLASS
CLASS XJFO_PON INHERIT JFO_PON

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
cARQ:="PN"+ZCOMP
IF ! checkcri(caRQ,"FO_PON","STR(NUMERO,8)+DTOS(DATA)")
   RETU SELF
ENDIF
oSERVER:=USEFOLHA{cARQ}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()			

END CLASS
PARTIAL CLASS XJFO_POT INHERIT JFO_POT

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
cARQ:="PT"+ZCOMP
IF ! checkcri(caRQ,"FO_POT","NUMERO")
   RETU SELF
ENDIF
oSERVER:=USEFOLHA{cARQ}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()	

END CLASS
PARTIAL CLASS XJFO_PTT INHERIT JFO_POT	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FO_PTT"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()


END CLASS
CLASS XJFO_RELHR INHERIT jfo_relhr		

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FO_RELHR"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()

END CLASS
CLASS XJFO_TAB INHERIT JFO_TAB

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FO_TAB"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()

	





END CLASS
CLASS XJFOPTO_REV INHERIT JFOPTO_REV

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
cARQ:="PE"+ZCOMP
IF ! checkcri(caRQ,"FOPTOREV","GRUPO+DTOS(DATA)")
   RETU SELF
ENDIF
oSERVER:=USEFOLHA{cARQ}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()				


END CLASS
CLASS XJFUN INHERIT JFUN

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
//LOCAL aDAD AS ARRAY
oSERVER:=USEFOLHA{"FUNCAO"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER,,oSERVER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:SHOW()	



END CLASS
CLASS XJNFCC INHERIT JNFCC

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"NFCC"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
//SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()

END CLASS
CLASS XJPROD INHERIT JPROV

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FOPTOPRD"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()

END CLASS
PARTIAL CLASS XJPROV INHERIT JPROV	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FOPTOPRO"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()

END CLASS
CLASS XJPTOALM INHERIT JPTOALM	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FOPTOALM"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
OsERVER:GOTOP()
IF ! OSERVER:sEEK(Str(ZANO,4)+Str(ZMES,2))
   Oserver:APPEND()
   oSERVER:FIELDPUT("ANO",ZANO)
   oSERVER:FIELDPUT("MES",ZMES)	
   oSERVER:FIELDPUT("MESEXT",MESSTR(ZMES,ZANO,1,1))	
ENDIF	
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()	



END CLASS
CLASS XJPTOARR INHERIT JPTOALM	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"TABARRE"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
OsERVER:GOTOP()
IF ! OSERVER:sEEK(Str(ZANO,4)+Str(ZMES,2))
   Oserver:APPEND()
   oSERVER:FIELDPUT("ANO",ZANO)
   oSERVER:FIELDPUT("MES",ZMES)	
   oSERVER:FIELDPUT("MESEXT",MESSTR(ZMES,ZANO,1,1))	
ENDIF	
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()	

END CLASS
CLASS XJPTOASM INHERIT JPTOALM	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"ASSMED"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
OsERVER:GOTOP()
IF ! OSERVER:sEEK(Str(ZANO,4)+Str(ZMES,2))
   Oserver:APPEND()
   oSERVER:FIELDPUT("ANO",ZANO)
   oSERVER:FIELDPUT("MES",ZMES)	
   oSERVER:FIELDPUT("MESEXT",MESSTR(ZMES,ZANO,1,1))	
ENDIF	
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()	

END CLASS
CLASS XJPTOASO INHERIT JPTOALM

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"ASSODO"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
OsERVER:GOTOP()
IF ! OSERVER:sEEK(Str(ZANO,4)+Str(ZMES,2))
   Oserver:APPEND()
   oSERVER:FIELDPUT("ANO",ZANO)
   oSERVER:FIELDPUT("MES",ZMES)	
   oSERVER:FIELDPUT("MESEXT",MESSTR(ZMES,ZANO,1,1))	
ENDIF	
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()	

END CLASS
CLASS XJPTOCOM INHERIT JPTOCOM		

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FOPTOCOM"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
OsERVER:GOTOP()
IF ! OSERVER:sEEK(Str(ZANO,4)+Str(ZMES,2)+Str(ZEMPRESA,8))
   Oserver:APPEND()
   oSERVER:FIELDPUT("ANO",ZANO)
   oSERVER:FIELDPUT("MES",ZMES)	
   oSERVER:FIELDPUT("EMPRESA",ZEMPRESA)	
   oSERVER:FIELDPUT("MESEXT",MESSTR(ZMES,ZANO,1,1))	
ELSE
   IF Empty(oSERVER:FIELDGET("MESEXT"))
      oSERVER:FIELDPUT("MESEXT",MESSTR(ZMES,ZANO,1,1))	
   ENDIF	
ENDIF	
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()	

END CLASS
CLASS XJPTOEVE INHERIT JPTOEVE	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FOPTOEVE"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()	

END CLASS
CLASS XJPTOHOR INHERIT JPTOHOR

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FOPTOHOR"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()	

END CLASS
CLASS XJPTOHRE INHERIT JPTOHRE

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FOPTOHRE"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()	

END CLASS
CLASS XJPTOTRO INHERIT JPTOALM	

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"TABTROCO"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
OsERVER:GOTOP()
IF ! OSERVER:sEEK(Str(ZANO,4)+Str(ZMES,2))
   Oserver:APPEND()
   oSERVER:FIELDPUT("ANO",ZANO)
   oSERVER:FIELDPUT("MES",ZMES)	
   oSERVER:FIELDPUT("MESEXT",MESSTR(ZMES,ZANO,1,1))	
ENDIF	
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()	



END CLASS
CLASS XJTURNO INHERIT JTURNO

CONSTRUCTOR(oOWNER) 
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"TABTURNO"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()


END CLASS
CLASS XMIGPTO INHERIT JFO_DIO

CONSTRUCTOR(oOWNER) 	
LOCAL oJAN AS JESCREL
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
oJAN:=JESCREL{oOWNER}
oJAN:SHOW()	

cARQ:=TARQREL(ZREL,.T.,"DIO")
oSERVER:=USEFOLHA{cARQ}

oSERVER:=USEFOLHA{cARQ}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()



END CLASS
CLASS XMIGREL INHERIT JFO_DIO


CONSTRUCTOR(oOWNER) 	
LOCAL oJAN AS JESCREL
LOCAL oSERVER AS USEFOLHA
LOCAL cARQ AS STRING
oJAN:=JESCREL{oOWNER}
oJAN:SHOW()	

cARQ:=TARQREL(ZREL,.F.,"REL")
oSERVER:=USEFOLHA{cARQ, ,,, ,.F.}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:oCCbuscaNUM:disable()
SELF:SHOW()


END CLASS
CLASS XTXTFOL INHERIT JRTF

CONSTRUCTOR(oOWNER) 
SUPER(oOwner,pegarqcon( 901,"TXT"),"A",.F.,.T.,.F.,.F.)
SELF:SHOW()

END CLASS
CLASS XTXTREF INHERIT JRTF	

CONSTRUCTOR(oOWNER) 
SUPER(oOwner,pegarqcon( 902,"TXT"),"A",.F.,.T.,.F.,.F.)
SELF:SHOW()

END CLASS
CLASS XTXTREL INHERIT JRTF

CONSTRUCTOR(oOWNER) 
LOCAL oJAN AS JESCREL
oJAN:=JESCREL{oOWNER}
oJAN:SHOW()
SUPER(oOwner,pegarqcon( ZREL,"TXT")	,"A",.F.,.T.,.F.,.F.)
SELF:SHOW()

END CLASS
CLASS XWEBREL INHERIT JFO_DIO	
CONSTRUCTOR(oOWNER) 
LOCAL cSQL,cREL AS STRING
LOCAL oSERVER AS SQLSelect
LOCAL oCONN AS SQLConnection
LOCAL oJANX AS jWREL
oJANX:=JWREL{SELF}
OjanX:show()
IF ! oJANX:lOK
   RETU SELF
ENDIF	
IF oJANX:NREL01+oJANX:NREL02+oJANX:NREL03+oJANX:NREL04=0
   cREL:=""
ELSE
   cREL:="("
   IF oJANX:NREL01=0
   	  alert("Relogio 01 nao selecionado")
   	  RETU SELF
   ENDIF
   cREL+=" EQPI_NUMERO="+Str(oJANX:NREL01)
   IF oJANX:NREL02>0
      cREL+=" OR EQPI_NUMERO="+Str(oJANX:NREL02)
   ENDIF	
   IF oJANX:NREL03>0
      cREL+=" OR EQPI_NUMERO="+Str(oJANX:NREL03)
   ENDIF	
   IF oJANX:NREL04>0
      cREL+=" OR EQPI_NUMERO="+Str(oJANX:NREL04)
   ENDIF	
   cREL+=")"
ENDIF

Csql:="SELECT convert(VARCHAR(8),PES_NUMERO) AS NUMERO,"
csql+="       convert(varchar,MOV_DATAHORA,103) AS DATA,"
csql+="       convert(varchar,mov_datahora,108) AS hora,"
csql+="       convert(VARCHAR(4),EQPI_NUMERO) AS RELOGIO"
csql+=" FROM Log_Credencial"
csql+=" WHERE MOV_DataHora>=convert(datetime, '"+DToC(oJANX:DINICIO)+"', 103)"
csql+="   AND MOV_DataHora<=convert(datetime, '"+DToC(oJANX:DFINAL+1)+"', 103)"
//csql+=" MOV_DataHora>='"+DToC(oJANX:DINICIO)+"'"
//csql+=" AND MOV_DataHora<'"+DToC(oJANX:DFINAL+1)+"'"
csql+=" AND PES_NUMERO>="+Str(oJANX:nFUNINI)
csql+=" AND PES_NUMERO<="+Str(oJANX:NFUNFIM)
IF Len(CREL)>0
   Csql+=" and "+Crel
ENDIF	

oConn := SQLConnection{}
 IF ! oConn:connect("wrel","","")
	  alert("Erro na Conec��o")
 	  RETU SELF
ENDIF

oServer := SQLSelect{cSQL, oConn }
IF ! oServer:Execute()
   MemoWrit("d:\TEMP\cSQL.TXT",cSQL)
   alert("Erro na Consulta")
   RETU SELF
ENDIF	


SUPER(oOWNER)
SELF:Browser:SetStandardStyle(gBsreadonly)
SELF:USE(oSERVER)
SELF:SHOW()


END CLASS
