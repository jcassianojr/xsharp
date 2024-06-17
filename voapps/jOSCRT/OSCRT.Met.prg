PARTIAL CLASS JOSC
METHOD APPEND() 
LOCAL nOS,nCLIENTE AS DWORD
LOCAL oBUSCA AS xBUSCA
LOCAL cCODIGO AS STRING
LOCAL aGMFI AS ARRAY
oBUSCA:=xBUSCA{SELF,"Cliente","Digite Nº Cliente"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF ! oBUSCA:lOK
   RETU .F.
ENDIF	
nCLIENTE:=Val(oBUSCA:cBUSCA)
IF nCLIENTE=0
   alert("Cliente Nao Pode Ser em Branco")
   RETURN .F.
ENDIF	
oBUSCA:=xBUSCA{SELF,"Codigo","Digite o Codigo"}
oBUSCA:lMES:=.T.
oBUSCA:SHOW()
IF ! oBUSCA:lOK
   RETU .F.
ENDIF	
cCODIGO:=AllTrim(oBUSCA:cBUSCA)
IF Empty(cCODIGO)
   alert("Codigo Nao Pode Ser em Branco")
   RETURN .F.
ENDIF	
aGMFI:=PEGGMFI(oBUSCA:cBUSCA)
SELF:server:setorder(2)
SELF:server:gotop()
IF SELF:SERVER:seek(Str(ncliente,8)+cCodigo)
   SELF:server:setorder(1)
   alert("Codigo/Cliente Já Incluso OS: "+Str(SELF:SERVER:FIELDGET("OS")))
   RETURN .F.	
ENDIF
SELF:server:setorder(1)
SELF:server:gobottom()
nOS:=SELF:Server:OS
nOS++
SUPER:append()
SELF:SERVER:FIELDPUT("OS",nOS)
SELF:SERVER:FIELDPUT("CLIENTE",nCLIENTE)
SELF:SERVER:FIELDPUT("CODIGO",cCODIGO)
SELF:SERVER:FIELDPUT("DATA",Today())
SELF:SERVER:FIELDPUT("CENT","Conf Progr")
SELF:SERVER:FIELDPUT("OBS","Produção")
IF aGMFI[1]
   SELF:SERVER:FIELDPUT("NOME",aGMFI[2])	
ENDIF	
SELF:pegcli()
SELF:PEGPRO()
SELF:server:commit()
ENVIAos(nOS)
RETURN .T.


METHOD BUSCAos( ) 
	SELF:KeyFind()


METHOD chkclipro( ) 
LOCAL oPROGWIN AS PROGWIN
LOCAL cCODIGO AS STRING
LOCAL nCLIENTE AS DWORD
//LOCAL nLASTREC,nPOS AS DWORD
//LOCAL nPERC AS WORD
	
alert("Operacao Pode Demorar conf Qtde OS")	

oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()

oPROGWIN:ntotal:=SELF:SERVER:RecCount
oPROGWIN:reset()
oPROGWIN:TITULO("Checando...",.F.)

SELF:SERVER:GOTOP()
WHILE ! SELF:SERVER:EOF
  oPROGWIN:TITULO("Checando",.t.)
   IF Empty(SELF:SERVER:FIELDGET("CLINOME")) .OR. Empty(SELF:SERVER:FIELDGET("CODCLI"))	
      SELF:pegcli()
   ENDIF
   IF Empty(SELF:SERVER:FIELDGET("NOME")) .OR. Empty(SELF:SERVER:FIELDGET("CODIGOINT")) .OR. Empty(SELF:SERVER:FIELDGET("CODCLI")) .or. (SELF:SERVER:FIELDGET("NOME")=SELF:SERVER:FIELDGET("CODIGO"))  //nome cadastrado com o codigo codigo				
      SELF:PEGPRO()
   ENDIF
   SELF:SERVER:SKIP()
   oPROGWIN:SKIP(1)
ENDDO	
SELF:SERVER:GOTOP()
IF ! MDG("Apagar Duplicidades")
	oPROGWIN:EndDialog()
   RETURN .F.
ENDIF	
oPROGWIN:reset()
oPROGWIN:TITULO("Checando...",.F.)
SELF:SERVER:setorder(2)
SELF:SERVER:GOTOP()
WHILE ! SELF:SERVER:EOF
   cCODIGO:=SELF:SERVER:FIELDGET("CODIGO")
   nCLIENTE:=SELF:SERVER:FIELDGET("CLIENTE")
   oPROGWIN:TITULO("Checando",.t.)
   SELF:SERVER:SKIP()
   oPROGWIN:SKIP(1)
   IF ! SELF:SERVER:EOF
   	  IF cCODIGO=SELF:SERVER:FIELDGET("CODIGO") .AND. nCLIENTE=SELF:SERVER:FIELDGET("CLIENTE")
   	  	 SELF:SERVER:Delete()
   	  ENDIF
   ENDIF	
ENDDO	
SELF:SERVER:setorder(1)
SELF:SERVER:GOTOP()
OPROGWIN:EndDialog()
alert("Checagem Concluida")


METHOD cmddelfiltro() 
   SELF:xcmddelfiltro()	
  SELF:Browser:REFRESH()

METHOD CMDFILTRAR() 
	SELF:xCMDFILTRAR()
	SELF:Browser:REFRESH()

METHOD CMDimprimir( ) 
SELF:XWRPTGRP("MOC","OSCR")		

METHOD esccod() 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF ! IsNil(oESC:CODIGO)
    SELF:SERVER:FIELDPUT("CODIGO",oESC:CODIGO)
    SELF:SERVER:FIELDPUT("NOME",oESC:NOME)
ENDIF

METHOD escfor( ) 
LOCAL oESC AS XESCNUM	
oESC:=XESCNUM{SELF,"MA01.DBF"}
oESC:SHOW()	
IF ! IsNil(oESC:NUMERO)
    SELF:SERVER:FIELDPUT("CLIENTE",oESC:NUMERO)
    SELF:SERVER:FIELDPUT("CLINOME",oESC:NOME)
ENDIF

METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:SERVER:FIELDGET("CODIGO"))," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETURN .F.
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG",cCODIGO}
OFOTOVIEW:SHOW()
	

METHOD pegcli( ) 
LOCAL aDAD AS ARRAY	
           aDAD:=PEGMA01(SELF:SERVER:FIELDGET("CLIENTE"),ZCURINI,ZCURDIR)
           IF aDAD[1]=.T.
         	  IF ! Empty(ADAD[2])
                 SELF:SERVER:FIELDPUT("CLINOME",aDAD[2])
              ENDIF
              SELF:SERVER:FIELDPUTZ("CODCLI",aDAD[6])
           ENDIF
	

METHOD PEGPRO( ) 
LOCAL aDAD AS ARRAY
LOCAL cCODIGO AS STRING
SELF:SERVER:FIELDPUT("CODIGO",AllTrim(SELF:SERVER:FIELDGET("CODIGO")))
SELF:SERVER:FIELDPUT("PEDIDOCLI",AllTrim(SELF:SERVER:FIELDGET("PEDIDOCLI")))
cCODIGO:=AllTrim(SELF:SERVER:FIELDGET("CODIGO"))
aDAD:=PEGMSEXT(cCODIGO,.T.)
IF aDAD[1]
   IF ! Empty(ADAD[2]) .AND. (Empty(SELF:SERVER:FIELDGET("NOME")) .or. (SELF:SERVER:FIELDGET("NOME")=SELF:SERVER:FIELDGET("CODIGO")))  //nome cadastrado com o codigo codigo
      SELF:SERVER:FIELDPUT("NOME",aDAD[2])
   ENDIF
   SELF:SERVER:FIELDPUTZ("CODIGOINT",aDAD[7])
   SELF:SERVER:FIELDPUTZ("CODCLI",aDAD[10])
   SELF:SERVER:FIELDPUTZ("DELIVERY",aDAD[11])	
   SELF:SERVER:FIELDPUTZ("STOCK",aDAD[12])	
ENDIF


METHOD poros( ) 
	SELF:KeyFind()


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
       FabCenterWindow( SELF )
 RETURN SELF

METHOD sinclx( ) 
LOCAL oConn AS SQLConnection	
LOCAL oREG AS SQLSelect
LOCAL cSQL,cPEDCLI,cCODCLI,cSISCO AS STRING
LOCAL oPROGWIN AS PROGWIN
//LOCAL nLASTREC,nPOS AS DWORD
//LOCAL nPERC AS WORD
LOCAL aDAD AS ARRAY
LOCAL oMA01 AS USEREDE
LOCAL oSTMT AS SQLStatement

alert("Operacao Pode Demorar conf Qtde OS")	

IF MDG("Importar codigos Produtos LOGIx")
   IMPCOD(1,1,.F.)
ENDIF	

oConn := SQLConnection{}	
IF ! oConn:connect("ol_logix")
   alert("Erro na Conecção")
   RETURN .F.
ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()

aDAD:={zCURINI,"MA01.DBF",zCURDIR}
oMA01:=USEREDE{aDAD}
IF oMA01:nERRO#0
   Oconn:Disconnect()
   RETU SELF
ENDIF


oProgWin := ProgWin{}
oProgWin:Caption:="Sincronizando dados"
oProgWin:SHOW()


oPROGWIN:NTOTAL:=SELF:SERVER:RecCount
oPROGWIN:RESET()
oPROGWIN:TITULO("Checando...",.f.)

SELF:SERVER:GOTOP()
WHILE ! SELF:SERVER:EOF
    oPROGWIN:TITULO("Checando...",.t.)
//   IF (Empty(SELF:SERVER:FIELDGET("CODCLI")).or.Empty(SELF:SERVER:FIELDGET("PEDIDOCLI"))).AND. ! Empty(SELF:SERVER:FIELDGET("CODIGOINT"))
//  atualizar se mudou
   	  csql:="SELECT "
      csql+=" pedidos.cod_cliente, pedidos.num_pedido_repres, pedidos.num_pedido_cli"
      csql+=" FROM "
      csql+=" pedidos INNER JOIN ped_itens ON pedidos.cod_empresa = ped_itens.cod_empresa AND pedidos.num_pedido = ped_itens.num_pedido"
      csql+=" where ped_itens.cod_item='" + SELF:SERVER:FIELDGET("CODIGOINT") + "'"
      csql+="       and ped_itens.qtd_pecas_solic-(ped_itens.qtd_pecas_atend+ped_itens.qtd_pecas_cancel+ped_itens.qtd_pecas_reserv)>0"
      oreg:= SQLSelect{cSQL,oconn}
      IF ! oREG:EOF
      	 cPEDCLI:=AllTrim(FIXSTR(oREG:FIELDGET("num_pedido_cli")))
         cCODCLI:=AllTrim(FIXSTR(oREG:FIELDGET("cod_cliente")))
         cSISCO:=AllTrim(FIXSTR(oREG:FIELDGET("num_pedido_repres")))
         SELF:SERVER:FIELDPUTE("PEDIDOCLI",cPEDCLI)
         IF Empty(SELF:SERVER:FIELDGET("CODCLI")) .And. Len(cCODCLI)<=12
            SELF:SERVER:FIELDPUTE("CODCLI",cCODCLI)
         ENDIF	
         IF Empty(SELF:SERVER:FIELDGET("CLIENTE")) .AND. ! Empty(cSISCO)
         	oMA01:SetOrder(6) //Sisco
         	oMA01:GOTOP()
      	    IF oMA01:SEEK(cSISCO)
               SELF:SERVER:FIELDPUT("CLIENTE",oMA01:FIELDGET("numero"))
            ENDIF	
         ENDIF
         IF Empty(SELF:SERVER:FIELDGET("CLIENTE")) .AND. ! Empty(cCODCLI)
         	Oma01:setorder(8) //codigo interno
            oMA01:GOTOP()
         	IF oMA01:SEEK(cCODCLI)
               SELF:SERVER:FIELDPUT("CLIENTE",oMA01:FIELDGET("numero"))
            ENDIF	
         ENDIF
      ENDIF
      Oreg:close()
//   ENDIF	
   SELF:SERVER:SKIP()
   Oprogwin:skip(1)
ENDDO	
SELF:SERVER:GOTOP()
Oconn:Disconnect()
oPROGWIN:EndDialog()
alert("Checagem Concluida")	

METHOD Timer() 
   SELF:SERVER:COMMIT()



END CLASS
