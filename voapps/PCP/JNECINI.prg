#region DEFINES
STATIC DEFINE JNECINI_CANCELAR := 104 
STATIC DEFINE JNECINI_DATA_INICIAL := 110 
STATIC DEFINE JNECINI_DINI := 100 
STATIC DEFINE JNECINI_IMPAVULSO := 112 
STATIC DEFINE JNECINI_IMPINTEGRADO := 113 
STATIC DEFINE JNECINI_IMPOPSAL := 111 
STATIC DEFINE JNECINI_IMPOS := 109 
STATIC DEFINE JNECINI_IMPSEM := 108 
STATIC DEFINE JNECINI_OK := 105 
STATIC DEFINE JNECINI_PRODUTO := 107 
STATIC DEFINE JNECINI_SEMANAS := 101 
STATIC DEFINE JNECINI_TEXTO := 106 
STATIC DEFINE JNECINI_THEFIXEDTEXT10 := 102 
STATIC DEFINE JNECINI_THEFIXEDTEXT9 := 103 
#endregion

class JNECINI inherit DATADIALOG 

	protect oDCdINI as DATETIMEPICKER
	protect oDCSemanas as RIGHTSLE
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oCCOK as PUSHBUTTON
	protect oDCtexto as FIXEDTEXT
	protect oDCproduto as FIXEDTEXT
	protect oDCimpsem as CHECKBOX
	protect oDCimpOS as CHECKBOX
	protect oDCData_Inicial as FIXEDTEXT
	protect oDCimpopsal as CHECKBOX
	protect oDCimpavulso as CHECKBOX
	protect oDCimpintegrado as CHECKBOX
// 	instance Semanas 
// 	instance impsem 
// 	instance impOS 
// 	instance impopsal 
// 	instance impavulso 
// 	instance impintegrado 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Cancelar( ) 
	SELF:endwindow()

access impavulso() 
return self:FieldGet(#impavulso)


assign impavulso(uValue) 
self:FieldPut(#impavulso, uValue)
return impavulso := uValue


access impintegrado() 
return self:FieldGet(#impintegrado)


assign impintegrado(uValue) 
self:FieldPut(#impintegrado, uValue)
return impintegrado := uValue


access impopsal() 
return self:FieldGet(#impopsal)


assign impopsal(uValue) 
self:FieldPut(#impopsal, uValue)
return impopsal := uValue


access impOS() 
return self:FieldGet(#impOS)


assign impOS(uValue) 
self:FieldPut(#impOS, uValue)
return impOS := uValue


access impsem() 
return self:FieldGet(#impsem)


assign impsem(uValue) 
self:FieldPut(#impsem, uValue)
return impsem := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JNECINI",_GetInst()},iCtlID)

oDCdINI := DateTimePicker{self,ResourceID{JNECINI_DINI,_GetInst()}}
oDCdINI:TooltipText := "Digite a Data da Primeira Semana"
oDCdINI:HyperLabel := HyperLabel{#dINI,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSemanas := rightSle{self,ResourceID{JNECINI_SEMANAS,_GetInst()}}
oDCSemanas:TooltipText := "Qtde Semanas"
oDCSemanas:HyperLabel := HyperLabel{#Semanas,"20",NULL_STRING,NULL_STRING}
oDCSemanas:FieldSpec := PADRAO_NUM_02{}

oDCtheFixedText10 := FixedText{self,ResourceID{JNECINI_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{JNECINI_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JNECINI_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}
oCCCancelar:TooltipText := "Clique aqui Para Cancelar Importação"

oCCOK := PushButton{self,ResourceID{JNECINI_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}
oCCOK:TooltipText := "Clique aqui Para Iniciar Programação"

oDCtexto := FixedText{self,ResourceID{JNECINI_TEXTO,_GetInst()}}
oDCtexto:HyperLabel := HyperLabel{#texto,NULL_STRING,NULL_STRING,NULL_STRING}

oDCproduto := FixedText{self,ResourceID{JNECINI_PRODUTO,_GetInst()}}
oDCproduto:HyperLabel := HyperLabel{#produto,NULL_STRING,NULL_STRING,NULL_STRING}

oDCimpsem := CheckBox{self,ResourceID{JNECINI_IMPSEM,_GetInst()}}
oDCimpsem:HyperLabel := HyperLabel{#impsem,"Importar Prg Semanal",NULL_STRING,NULL_STRING}
oDCimpsem:TooltipText := "Marque Para Importar Prg Semanal"

oDCimpOS := CheckBox{self,ResourceID{JNECINI_IMPOS,_GetInst()}}
oDCimpOS:HyperLabel := HyperLabel{#impOS,"Importar OS (Pedidos)",NULL_STRING,NULL_STRING}
oDCimpOS:TooltipText := "Marque Para Importar OS (Pedidos)"

oDCData_Inicial := FixedText{self,ResourceID{JNECINI_DATA_INICIAL,_GetInst()}}
oDCData_Inicial:HyperLabel := HyperLabel{#Data_Inicial,"Data Inicial",NULL_STRING,NULL_STRING}

oDCimpopsal := CheckBox{self,ResourceID{JNECINI_IMPOPSAL,_GetInst()}}
oDCimpopsal:HyperLabel := HyperLabel{#impopsal,"Importar Saldo Op",NULL_STRING,NULL_STRING}
oDCimpopsal:TooltipText := "Marque Para Importar Saldo OP"

oDCimpavulso := CheckBox{self,ResourceID{JNECINI_IMPAVULSO,_GetInst()}}
oDCimpavulso:HyperLabel := HyperLabel{#impavulso,"Importar Saldo Avulsos",NULL_STRING,NULL_STRING}
oDCimpavulso:TooltipText := "Marque Para Importar Saldo OP"

oDCimpintegrado := CheckBox{self,ResourceID{JNECINI_IMPINTEGRADO,_GetInst()}}
oDCimpintegrado:HyperLabel := HyperLabel{#impintegrado,"Importar Integrados",NULL_STRING,NULL_STRING}
oDCimpintegrado:TooltipText := "Marque Para Importar Saldo OP"

self:Caption := "Iniciar Programação Reserva Necessidade"
self:HyperLabel := HyperLabel{#JNECINI,"Iniciar Programação Reserva Necessidade",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD OK( ) 
LOCAL oPRNEC,oOSPRG,oPRNECI,Oprnect,oPRNECA AS USEREDE
LOCAL oMS01,oMO02,oOP01,oOP02,oMS03,oMS06,oMT01,oMU01 AS USEMANA5	
LOCAL aDAD,aQTDE,aDATA,aDATL AS ARRAY
LOCAL cCODIGO,cVAR,cTIPOENT,cCODCOMP,cUNID AS STRING
LOCAL X,nOP,nSEMANA,nTOTAL,mBSEQ,mBSSQ AS DWORD
LOCAL nQTDCOMP,nQTDEPRO,nQTDE AS FLOAT
LOCAL nQTDESAL,nQTDR AS INT
LOCAL dDATA AS DATE
LOCAL lSOMA AS LOGIC
LOCAL KZ AS WORD
LOCAL lFAZ AS LOGIC
LOCAL cARQFAZ AS STRING

	
IF ! MDG("Isto Irá Apagar Prg. Anterior Continuar","Confirme o Processo")
   RETU .F.	
ENDIF

nSEMANA:=SELF:Semanas
IF nSEMANA=0 .OR. nSEMANA>20
   nSEMANA:=20	
ENDIF	
SELF:POINTER:=POINTER{POINTERHOURGLASS}

aDATA:=ArrayNew(20)
aDATL:=ArrayNew(20)
dDATA:=CToD(SELF:oDCdINI:TextValue)
FOR X:=1 TO 20
	aDATA[X]:=dDATA	
	dDATA+=7
	aDATL[X]:=dDATA-1		
NEXT

IF ! entramenu("PCP",6)
	SELF:POINTER:=POINTER{}
	RETU SELF
ENDIF	
aDAD:={zCURINI,"PRNEC.DBF",zCURDIR}
oPRNEC:=USEREDE{aDAD,.F.}
IF oPRNEC:nERRO#0
    SELF:POINTER:=POINTER{}	
    RETU SELF
ENDIF
SELF:oDCtexto:Caption:="Zerando Prg Anterior"
oPRNEC:ZAP()
oPRNEC:CLOSE()


aDAD:={zCURINI,"PRNECI.DBF",zCURDIR}
oPRNECI:=USEREDE{aDAD,.F.}
IF oPRNECI:nERRO#0
    SELF:POINTER:=POINTER{}	
    RETU SELF
ENDIF
SELF:oDCtexto:Caption:="Zerando Itens Prg Anterior"
oPRNECI:ZAP()
oPRNECI:CLOSE()

aDAD:={zCURINI,"PRNECT.DBF",zCURDIR}
oPRNECt:=USEREDE{aDAD,.F.}
IF oPRNECt:nERRO#0
    SELF:POINTER:=POINTER{}	
    RETU SELF
ENDIF
SELF:oDCtexto:Caption:="Zerando Totais Prg Anterior"
oPRNECt:ZAP()
oPRNECt:CLOSE()

aDAD:={zCURINI,"PRNEC.DBF",zCURDIR}
oPRNEC:=USEREDE{aDAD}
IF oPRNEC:nERRO#0
	SELF:POINTER:=POINTER{}
    RETU SELF
ENDIF


aDAD:={zCURINI,"PRNECI.DBF",zCURDIR}
oPRNECI:=USEREDE{aDAD}
IF oPRNECI:nERRO#0
	oPRNEC:CLOSE()
	SELF:POINTER:=POINTER{}
    RETU SELF
ENDIF

aDAD:={zCURINI,"PRNECt.DBF",zCURDIR}
oPRNECt:=USEREDE{aDAD}
IF oPRNECI:nERRO#0
	oPRNEC:CLOSE()
	Oprneci:Close()
	SELF:POINTER:=POINTER{}
    RETU SELF
ENDIF



aDAD:={zCURINI,"MS01",zCURDIR,aDIR}
oMS01:=USEMANA5{aDAD}
IF oMS01:nERRO#0	
   oPRNEC:CLOSE()
   oPRNECI:CLOSE()
   oPRNECt:CLOSE()
   SELF:POINTER:=POINTER{}
   RETU SELF
ENDIF
oMS01:SetOrder(2) //Codigo Produto
oMS01:SuspendNotification()



//Importando Pedido Em Aberto
IF SELF:odcimpos:value
   aDAD:={zCURINI,"MO02",zCURDIR,aDIR}
   oMO02:=USEMANA5{aDAD}
   IF oMO02:nERRO#0
      alert("Erro Importando Os-Reimporte")	
      oMS01:CLOSE()
      oPRNEC:CLOSE()
      oPRNECI:CLOSE()
      oPRNECt:CLOSE()
      SELF:POINTER:=POINTER{}
      RETU SELF
   ENDIF	
   oMO02:SuspendNotification()

   SELF:oDCtexto:Caption:="Importando OS"
   oMO02:SETORDER(3) //CODIGO PRODUTO
   oMO02:GOTOP()
   WHILE ! oMO02:EOF
	  cCODIGO:=oMO02:FIELDGET("CODIGO")
	  SELF:oDCproduto:Caption:=cCODIGO	
	  aQTDE:=ArrayNew(20)
	  AFill(aQTDE,0)
   	  WHILE AllTrim(cCodigo)=AllTrim(oMO02:FIELDGET("CODIGO")) .AND. ! oMO02:EOF
		 cUNID:=oMO02:FIELDGET("UNID")
		 nQTDE:=INT(convun(oMO02:FIELDGET("QTDESAL"),cUNID))
		 IF nQTDE>0		
			dDATA:=oMO02:FIELDGET("ENTREGA")
    	    FOR X:=1 TO nSEMANA
        		IF dDATA>=aDATA[X] .ANd. dDATA<=aDATL[X]
        		   aQTDE[X]+=nQTDE
	            ENDIF		
    	    NEXT X
         ENDIF
		 oMO02:SKIP()
	  ENDDO	
	  IF ! Empty(cCODIGO)
         oPRNEC:APPEND()
         oPRNEC:FIELDPUT("CODIGO",cCODIGO)
         oPRNEC:FIELDPUT("TIPOPRG","P")          //Pedidos
         FOR X:=1 TO nSEMANA
    	     cVAR:="QTDE"+StrZero(X,2)
 	         oPRNEC:FIELDPUT(cVAR,aQTDE[X])
         NEXT X	
      ENDIF
   ENDDO	
   oMO02:CLOSE()
ENDIF


//Importando Programaçao Semanal
FOR KZ:=1 TO 2
	lFAZ:=.F.
	IF KZ=1
       lFAZ:=oDCimpINTEGRADO:VALUE
       cARQFAZ:="OSPRS.DBF"
	ENDIF
	IF KZ=2
       lFAZ:=oDCimpsem:Value		
       cARQFAZ:="OSPRG.DBF"
	ENDIF

    IF lFAZ
       SELF:oDCtexto:Caption:="Importando PRG-Semanal "+cARQFAZ
       aDAD:={zCURINI,cARQFAZ,zCURDIR}
       oOSPRG:=USEREDE{aDAD}
       IF oOSPRG:nERRO#0
          alert("Erro Importando Prg Semanal-Reimporte")
          oMS01:CLOSE()
          oPRNEC:CLOSE()	
          oPRNECI:CLOSE()
          oPRNECt:CLOSE()
          SELF:POINTER:=POINTER{}
          RETU SELF
      ENDIF
      oOSPRG:SuspendNotification()
      oOSPRG:SETORDER(2) //Produto
      oOSPRG:GOTOP()

      WHILE ! oOSPRG:EOF
	    cCODIGO:=oOSPRG:FIELDGET("PRODUTO")
   	    SELF:oDCproduto:Caption:=cCODIGO	
	    aQTDE:=ArrayNew(20)
	    AFill(aQTDE,0)
	    WHILE AllTrim(cCodigo)=AllTrim(oOSPRG:FIELDGET("PRODUTO")) .AND. ! oOSPRG:EOF
		   nQTDE:=oOSPRG:FIELDGET("QTDE")
		   IF nQTDE>0		
			  dDATA:=oOSPRG:FIELDGET("PROGRAMA")
    	      FOR X:=1 TO nSEMANA
    	      	 IF X=1
        		    IF dDATA<=aDATL[X] //1 semana e atrazos
        		       aQTDE[X]+=nQTDE
	                ENDIF		
    	      	 ELSE	
        		    IF dDATA>=aDATA[X] .ANd. dDATA<=aDATL[X] //outras semanas na faixa
        		       aQTDE[X]+=nQTDE
	                ENDIF		
	             ENDIF
    	      NEXT X
           ENDIF
		   oOSPRG:SKIP()
	    ENDDO	
        IF ! Empty(cCODIGO)
          oPRNEC:GOTOP()
          IF ! oPRNEC:SEEK(cCODIGO)
            oPRNEC:APPEND()
            oPRNEC:FIELDPUT("CODIGO",cCODIGO)
          ENDIF
          oPRNEC:FIELDPUT("TIPOPRG","S")          //Prg Semanal
          FOR X:=1 TO 20
             cVAR:="QTDE"+StrZero(X,2)
  	         oPRNEC:FIELDPUT(cVAR,0) //Zera para evitar erro imp pedidos
          NEXT X	
          FOR X:=1 TO nSEMANA
             cVAR:="QTDE"+StrZero(X,2)
  	         oPRNEC:FIELDPUT(cVAR,aQTDE[X])
          NEXT X	
       ENDIF
    ENDDO	
    oOSPRG:CLOSE()
  ENDIF
NEXT KZ

//Programacoes Avulsas
IF SELF:oDCimpsem:Value
   aDAD:={zCURINI,"PRNECA.DBF",zCURDIR}
   oPRNECA:=USEREDE{aDAD}
   IF oPRNECA:nERRO#0
      alert("Erro Checando PRNECA - Reimporte")	
      oPRNEC:CLOSE()	
      oPRNECi:CLOSE()	
      oPRNEct:CLOSE()	
      RETU
   ENDIF
   SELF:oDCtexto:Caption:="Checando Programacao Avulsa"
   oPRNECA:GOTOP()
   WHILE ! oPRNECA:EOF
  	   cCODIGO:=AllTrim(oPRNECA:FIELDGET("CODIGO"))
  	   SELF:oDCproduto:Caption:=cCODIGO	
       oPRNEC:GOTOP()
       IF oPRNEC:SEEK(cCODIGO)
          FOR X:=1 TO 20
             cVAR:="QTDE"+StrZero(X,2)
             nQTDE:=oPRNECA:FIELDGET(cVAR)
   		     IF nQTDE>0		
                oPRNEC:FIELDPUT(cVAR,nQTDE)
 	         ENDIF
           NEXT X	
       ENDIF	
       oPRNECA:SKIP()
   ENDDO
   oPRNECA:CLOSE()
ENDIF



//Ordem De Produçao e Saldos
IF ODCIMPOPSAL:Value
   aDAD:={zCURINI,"OP01",zCURDIR,aDIR}
   oOP01:=USEMANA5{aDAD}
   IF oOP01:nERRO#0
      alert("Erro Checando OS - Reimporte")	
      oPRNEC:CLOSE()	
      oPRNECi:CLOSE()	
      oPRNEct:CLOSE()	
      RETU
   ENDIF
   oOP01:SuspendNotification()
   SELF:oDCtexto:Caption:="Checando Ordem Produçao"
   oOP01:GOTOP()
   WHILE ! oOP01:EOF
	 cCODIGO:=AllTrim(oOP01:FIELDGET("CODIGO"))
	 nOP:=oOP01:FIELDGET("OP")
	 SELF:oDCproduto:Caption:=cCODIGO	
     oPRNEC:GOTOP()
     IF oPRNEC:SEEK(cCODIGO)
        oPRNEC:FIELDPUT("OP",nOP)
        IF ODCIMPOPSAL:Value
       	   IF oOP01:FIELDGET("QSAI")>0
     	  	  nQTDESAL:=INT(oOP01:FIELDGET("QSAI"))	
              oPRNEC:FIELDPUT("QTDSAL",nQTDESAL)
           ENDIF
	    ENDIF
        IF oPRNEC:FIELDGET("TIPOPRG")="P"
           oPRNEC:FIELDPUT("QTDE01",INT(oOP01:FIELDGET("QATR")))
           oPRNEC:FIELDPUT("OPQTDE1",INT(oOP01:FIELDGET("QATR")))
        ENDIF
     ENDIF	
     oOP01:SKIP()
   ENDDO
   oOP01:CLOSE()
ENDIF


//Trazendo Saldo e Nome dos Produtos
SELF:oDCtexto:Caption:="Checando Saldo Produto"
oPRNEC:GOTOP()
WHILE !oPRNEC:EoF	
   cCODIGO:=AllTrim(oPRNEC:FIELDGET("CODIGO"))	
  SELF:oDCproduto:Caption:=cCODIGO	
   nQTDESAL:=oPRNEC:FIELDGET("QTDSAL") //Pega Saldo OP ou Zerado
   oMS01:GOTOP()
   IF oMS01:SEEK(cCODIGO)
      IF oMS01:FIELDGET("ESTQSAL")>0
     	 IF ! ODCIMPOPSAL:VALUE //Somente Traz se nao for o da OP
  	         nQTDESAL:=INT(oMS01:FIELDGET("ESTQSAL"))	
	         oPRNEC:FIELDPUT("QTDSAL",nQTDESAL)
  	     ENDIF
      ENDIF	
      oPRNEC:FIELDPUT("NOME",oMS01:FIELDGET("NOME"))
   ENDIF
   oPRNEC:SKIP()
ENDDO
oMS01:CLOSE()

//Trazendo Estoque de Producao Criando Itens
SELF:oDCtexto:Caption:="Criando Itens"
aDAD:={zCURINI,"MS03",zCURDIR,aDIR}
oMS03:=USEMANA5{aDAD}
IF oMS03:nERRO#0
   oPRNEC:CLOSE()
   oPRNECI:CLOSE()
   oPRNECt:CLOSE()
   SELF:POINTER:=POINTER{}
   RETU SELF
ENDIF
oMS03:SuspendNotification()	

aDAD:={zCURINI,"MS06",zCURDIR,aDIR}
oMS06:=USEMANA5{aDAD}
IF oMS06:nERRO#0
   oMS03:CLOSE()
   oPRNEC:CLOSE()
   oPRNECI:CLOSE()
   oPRNECt:CLOSE()
   SELF:POINTER:=POINTER{}
   RETU SELF
ENDIF	
oMS06:SuspendNotification()

aDAD:={zCURINI,"OP02",zCURDIR,aDIR}
oOP02:=USEMANA5{aDAD}
IF oOP02:nERRO#0
   oMS06:CLOSE()
   oMS03:CLOSE()
   oPRNEC:CLOSE()
   oPRNECI:CLOSE()
   oPRNECt:CLOSE()
   SELF:POINTER:=POINTER{}
   RETU SELF
ENDIF	
oOP02:SuspendNotification()
oOP02:SETORDER(4) //Codigo+str(seq,3)+str(ssq,3)

oPRNEC:GOTOP()
WHILE ! oPRNEC:EoF
	cCODIGO:=AllTrim(oPRNEC:FIELDGET("CODIGO"))
	SELF:oDCproduto:Caption:=cCODIGO	
	oMS03:GOTOP()
	oMS03:SEEK(cCODIGO)
	WHILE AllTrim(oMS03:FIELDGET("CODIGO"))==cCODIGO .AND. ! oMS03:EoF
		cTIPOENT:=oMS03:FIELDGET("TIPOENT")
		cCODCOMP:=AllTrim(oMS03:FIELDGET("CODCOMP"))
		nQTDCOMP:=oMS03:FIELDGET("QTDDE")
		IF cTIPOENT="M" .OR. cTIPOENT="C" .AND. ! Empty(cCODCOMP)
		   oPRNECI:APPEND()
		   oPRNECI:FIELDPUT("CODIGO",cCODIGO)
		   oPRNECI:FIELDPUT("TIPOENT",cTIPOENT)
		   oPRNECI:FIELDPUT("CODCOMP",cCODCOMP)
		   oPRNECI:FIELDPUT("QTDECOMP",nQTDCOMP)		
   	       mBSEQ:=oMS03:FIELDGET("BSEQ")
           mBSSQ:=oMS03:FIELDGET("BSSQ")
           IF ODCIMPOPSAL:Value
        	  nQTDEPRO:=0
        	  Oop02:gotop()
        	  IF Oop02:SEEK(PadR(cCODIGO,24)+Str(mBSEQ,3)+Str(mBSSQ,3))
        	  	 //Nao e Necessario loop pois qpant ja possui os saldo
        	  	 //anteriores
        	  	 IF oOP02:FIELDGET("QPANT")>0	
                    nQTDEPRO:=INT(oOP02:FIELDGET("QPANT"))
                 ENDIF
                 IF nQTDEPRO>0
//                  Nao grava kg pois podem ser de pecas diferentes
                    nQTDEPRO:=INT(oPRNECI:FIELDGET("QTDECOMP")*nQTDEPRO)
             	    oPRNECI:FIELDPUT("ESTQPRO",nQTDEPRO)		
//                  nao pode ser produto pois cada item esta opercao diferente
//        	        oPRNEC:FIELDPUT("QTDPRO",nQTDEPRO)
                 ENDIF
        	  ENDIF	
           ENDIF	
           IF ! Empty(MBSEQ) .AND. ! Empty(MBSSQ) .and. ! ODCIMPOPSAL:Value
           	  lSOMA:=.T.
           	  nQTDEPRO:=0
              oMS06:GOTOP()
              oMS06:SEEK(PadR(cCODIGO,24)+Str(mBSEQ,3)+Str(mBSSQ,3))
              WHILE oMS06:FIELDGET("CODIGO")=cCODIGO .AND. ! oMS06:EOF
                    IF oMS06:FIELDGET("TIPFEC")="8" .OR. oMS06:FIELDGET("TIPFEC")="9"
                       lSOMA:=.T.
                    ENDIF
                    IF oMS06:FIELDGET("TIPFEC")="7" .OR. oMS06:FIELDGET("SSQ")=99
                       lSOMA:=.F.
                    ENDIF
                    IF lSOMA .AND. oMS06:FIELDGET("PULREQ")#"S"
                       IF oMS06:FIELDGET("ESTQSAL")>0	
                          nQTDEPRO:=nQTDEPRO+oMS06:FIELDGET("ESTQSAL")
                       ENDIF
                    ENDIF
                    oMS06:SKIP()
              ENDDO
              IF nQTDEPRO>0
//               Nao grava kg pois podem ser de pecas diferentes
                  nQTDEPRO:=INT(oPRNECI:FIELDGET("QTDECOMP")*nQTDEPRO)
            	  oPRNECI:FIELDPUT("ESTQPRO",nQTDEPRO)		
//                  nao pode ser produto pois cada item esta opercao diferente
//      	         oPRNEC:FIELDPUT("QTDPRO",nQTDEPRO)
              ENDIF

           ENDIF
//         Abaixo Junto Necessidades Semanais
//		   FOR X:=1 TO nSEMANA
//              cVAR:="QTDI"+StrZero(X,2)
//              nQTDE:=nQTDCOMP*oPRNEC:FIELDGET(cVAR)
//    	      oPRNECI:FIELDPUT(cVAR,nQTDE)
//    	   NEXT X	
	    ENDIF		
    	oMS03:SKIP()
	ENDDO
    oPRNEC:SKIP()
ENDDO	
oMS03:CLOSE()
oMS06:CLOSE()



//Somando Estoque e Estoque processo
//SELF:oDCtexto:Caption:="Somando Estoque Estoque Processo"
//oPRNEC:GOTOP()
//WHILE !oPRNEC:EoF	
//   SELF:oDCproduto:Caption:=cCODIGO	
//   oPRNEC:FIELDPUT("QTDEST",oPRNEC:FIELDGET("QTDSAL")+oPRNEC:FIELDGET("QTDPRO"))
//   oPRNEC:SKIP()
//ENDDO

//Calculando Necessidade Semanas
SELF:oDCtexto:Caption:="Calculando Necessidades da Semana"
oPRNEC:GOTOP()
WHILE !oPRNEC:EoF	
   cCODIGO:=AllTrim(oPRNEC:FIELDGET("CODIGO"))
   SELF:oDCproduto:Caption:=cCODIGO	
   aQTDE:=ArrayNew(20)
   AFill(aQTDE,0)
   nQTDESAL:=oPRNEC:FIELDGET("QTDSAL") //Pega Saldo Produto e Processo
   FOR X:=1 TO 20
       cVAR:="DATA"+StrZero(X,2)
 	   oPRNEC:FIELDPUT(cVAR,aDATA[X])
       cVAR:="QTDE"+StrZero(X,2)
 	   aQTDE[X]:=oPRNEC:FIELDGET(cVAR)
   NEXT X	
   FOR X:=1 TO nSEMANA
 	   nQTDR:=0
 	   IF nQTDESAL>0
 	      IF nQTDESAL>aQTDE[X]
 	    	 nQTDR:=aQTDE[X]
 	       	 nQTDESAL-=aQTDE[X]
 	      ELSE
 	     	 nQTDR:=nQTDESAL
             nQTDESAL:=0
          ENDIF	
 	   ENDIF
       cVAR:="QTDR"+StrZero(X,2)
 	   oPRNEC:FIELDPUT(cVAR,nQTDR)
       cVAR:="QTDI"+StrZero(X,2)
       nQTDE:=aQTDE[X]-nQTDR
	   oPRNEC:FIELDPUT(cVAR,nQTDE)
    NEXT X	
   oPRNECI:GOTOP()
   oPRNECI:Seek(cCODIGO)
   WHILE cCODIGO=AllTrim(oPRNECI:FIELDGET("CODIGO")) .AND. ! oPRNECI:EOF
      FOR X:=1 TO nSEMANA
          cVAR:="QTDI"+StrZero(X,2)
          nQTDE:=oPRNECI:FIELDGET("QTDECOMP")*oPRNEC:FIELDGET(cVAR)
    	  oPRNECI:FIELDPUT(cVAR,nQTDE)
  	   NEXT X	
   	   oPRNECI:SKIP()
   ENDDO
   oPRNEC:SKIP()
ENDDO





SELF:oDCtexto:Caption:="Somando Itens"
oPRNECI:GOTOP()
WHILE ! oPRNECI:EOF
	cCODIGO :=oPRNECI:FIELDGET("CODIGO")
	cCODCOMP:=oPRNECI:FIELDGET("CODCOMP")	
	cTIPOENT :=oPRNECI:FIELDGET("TIPOENT")	
	SELF:oDCproduto:Caption:=AllTrim(cCODIGO)+"-"+cTIPOENT+"-"+AllTrim(cCODCOMP)
    oPRNECT:GOTOP()
    IF ! oPRNECT:SEEK(cTIPOENT+cCODCOMP)	
    	oPRNECT:Append()
    	oPRNECT:FIELDPUT("TIPOENT",cTIPOENT)
    	oPRNECT:FIELDPUT("CODCOMP",cCODCOMP)
	    oPRNECT:FIELDPUT("DIASPR",17)
	    oPRNECT:FIELDPUT("SEMANAS",nSEMANA)	
    ENDIF
    nQTDEPRO:=oPRNECT:FIELDGET("QTDPRO")
    nQTDEPRO+=oPRNECI:FIELDGET("ESTQPRO")	
    oPRNECT:FIELDPUT("QTDPRO",nQTDEPRO)
    FOR X:=1 TO 20
       	cVAR:="DATA"+StrZero(X,2)
 	    oPRNECT:FIELDPUT(cVAR,aDATA[X])
       	cVAR:="DATR"+StrZero(X,2)
       	dDATA:=aDATA[X]-17
       	IF DoW(dDATA)=1 //Domingo
       	   dDATA--	
       	ENDIF	
       	IF DoW(dDATA)=7 //Sabado
       	   dDATA-=2
       	ENDIF	
 	    oPRNECT:FIELDPUT(cVAR,dDATA)
    NEXT X	

    FOR X:=1 TO nSEMANA
	    cVAR:="QTDI"+StrZero(X,2)
        nQTDESAL:=oPRNECI:FIELDGET(cVAR) //Item
        cVAR:="QTDT"+StrZero(X,2)
        nQTDESAL+=oPRNECT:FIELDGET(cVAR)
        oPRNECT:FIELDPUT(cVAR,nQTDESAL)

	    cVAR:="QTDI"+StrZero(X,2)
        oPRNECT:FIELDPUT(cVAR,CALCNEC(nQTDESAL))


    NEXT X
	oPRNECI:SKIP()
ENDDO	
oPRNECI:CLOSE()

aDAD:={zCURINI,"MT01",zCURDIR,aDIR}
oMT01:=USEMANA5{aDAD}
IF oMT01:nERRO#0
   oPRNECt:CLOSE()
   SELF:POINTER:=POINTER{}
   RETU SELF
ENDIF	
oMT01:SuspendNotification()

aDAD:={zCURINI,"MU01",zCURDIR,aDIR}
oMU01:=USEMANA5{aDAD}
IF oMU01:nERRO#0
   oPRNECt:CLOSE()
   SELF:POINTER:=POINTER{}
   RETU SELF
ENDIF	
oMU01:SuspendNotification()

SELF:oDCtexto:Caption:="Somando Totais"
oPRNECT:GOTOP()
WHILE ! Oprnect:EoF	
	cCODCOMP:=AllTrim(oPRNECt:FIELDGET("CODCOMP"))	
	cTIPOENT :=oPRNECt:FIELDGET("TIPOENT")	
	SELF:oDCproduto:Caption:=cTIPOENT+"-"+cCODCOMP
	IF cTIPOENT="M"
	   oMU01:GOTOP()
       IF oMU01:SEEK(cCODCOMP)
       	  IF oMU01:FIELDGET("ESTQSAL")>0
             oPRNECT:FIELDPUT("QTDEST",oMU01:FIELDGET("ESTQSAL"))
       	  ENDIF	
       	  oPRNECT:FIELDPUT("NOME",oMU01:FIELDGET("NOME")+oMU01:FIELDGET("NOM2"))
       ENDIF	
	ENDIF	
	IF cTIPOENT="C"
	   oMT01:GOTOP()
       IF oMT01:SEEK(cCODCOMP)
       	  IF oMT01:FIELDGET("ESTQSAL")>0
             oPRNECT:FIELDPUT("QTDEST",oMT01:FIELDGET("ESTQSAL"))
       	  ENDIF	
          oPRNECT:FIELDPUT("NOME",oMT01:FIELDGET("NOME")+oMT01:FIELDGET("NOM2"))
       ENDIF	
	ENDIF	
	nTOTAL:=0
	FOR x:=1 TO nSEMANA
        cVAR:="QTDT"+StrZero(X,2)
        nTOTAL+=oPRNECT:FIELDGET(cVAR)
    NEXT X
   oPRNECT:FIELDPUT("QTDTOT",nTOTAL)
   nQTDE:=oPRNECT:FIELDGET("QTDEST")
   nQTDE+=oPRNECT:FIELDGET("QTDPRO")
   IF nQTDE>0
      oPRNECT:FIELDPUT("QTDSAL",nQTDE)
   ENDIF
   IF nTOTAL-oPRNECT:FIELDGET("QTDSAL")>0
      nQTDESAL:=nTOTAL-oPRNECT:FIELDGET("QTDSAL")
      oPRNECT:FIELDPUT("QTDINI",nQTDESAL)
   ENDIF
   oPRNECT:SKIP()
ENDDO
oMU01:CLOSE()
oMT01:CLOSE()
oPRNECT:CLOSE()
SELF:POINTER:=POINTER{}
SELF:EndWindow()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		    FabCenterWindow( SELF )
	RETURN NIL


access Semanas() 
return self:FieldGet(#Semanas)


assign Semanas(uValue) 
self:FieldPut(#Semanas, uValue)
return Semanas := uValue


END CLASS
