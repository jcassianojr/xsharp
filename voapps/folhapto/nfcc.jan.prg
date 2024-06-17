#region DEFINES
STATIC DEFINE JNFCC_ANO := 109 
STATIC DEFINE JNFCC_BUSCANUM := 107 
STATIC DEFINE JNFCC_CMDMAIS := 113 
STATIC DEFINE JNFCC_CMDMAIS2 := 111 
STATIC DEFINE JNFCC_CMDMENOS := 112 
STATIC DEFINE JNFCC_CMDMENOS2 := 110 
STATIC DEFINE JNFCC_CMDORDENAR := 106 
STATIC DEFINE JNFCC_ESCFUN := 116 
STATIC DEFINE JNFCC_FIXEDTEXT1 := 115 
STATIC DEFINE JNFCC_FIXEDTEXT2 := 108 
STATIC DEFINE JNFCC_HORAS := 121 
STATIC DEFINE JNFCC_MES := 114 
STATIC DEFINE JNFCC_NF := 103 
STATIC DEFINE JNFCC_NUMERO := 104 
STATIC DEFINE JNFCC_SC_NF := 100 
STATIC DEFINE JNFCC_SC_NUMERO := 101 
STATIC DEFINE JNFCC_SC_VALOR := 102 
STATIC DEFINE JNFCC_SC_VALOR1 := 118 
STATIC DEFINE JNFCC_SC_VALOR2 := 120 
STATIC DEFINE JNFCC_SC_VALOR3 := 122 
STATIC DEFINE JNFCC_VALOR := 105 
STATIC DEFINE JNFCC_VALORAM := 119 
STATIC DEFINE JNFCC_VALORVT := 117 
#endregion

CLASS jNFCC INHERIT MYDataWindow 

	PROTECT oDBNF AS DataColumn
	PROTECT oDBNUMERO AS DataColumn
	PROTECT oDBVALOR AS DataColumn
	PROTECT oDBMES AS DataColumn
	PROTECT oDBANO AS DataColumn
	PROTECT oDCSC_NF AS FIXEDTEXT
	PROTECT oDCSC_NUMERO AS FIXEDTEXT
	PROTECT oDCSC_VALOR AS FIXEDTEXT
	PROTECT oDCNF AS RIGHTSLE
	PROTECT oDCNUMERO AS RIGHTSLE
	PROTECT oDCVALOR AS RIGHTSLE
	PROTECT oCCcmdordenar AS PUSHBUTTON
	PROTECT oCCbuscaNUM AS PUSHBUTTON
	PROTECT oDCFixedText2 AS FIXEDTEXT
	PROTECT oDCano AS RIGHTSLE
	PROTECT oCCcmdmenos2 AS PUSHBUTTON
	PROTECT oCCcmdmais2 AS PUSHBUTTON
	PROTECT oCCcmdmenos AS PUSHBUTTON
	PROTECT oCCcmdmais AS PUSHBUTTON
	PROTECT oDCmes AS RIGHTSLE
	PROTECT oDCFixedText1 AS FIXEDTEXT
	PROTECT oCCescFUN AS PUSHBUTTON
	PROTECT oDCVALORVT AS RIGHTSLE
	PROTECT oDCSC_VALOR1 AS FIXEDTEXT
	PROTECT oDCVALORAM AS RIGHTSLE
	PROTECT oDCSC_VALOR2 AS FIXEDTEXT
	PROTECT oDCHORAS AS RIGHTSLE
	PROTECT oDCSC_VALOR3 AS FIXEDTEXT
// 	instance NF 
// 	instance NUMERO 
// 	instance VALOR 
// 	instance ano 
// 	instance mes 
// 	instance VALORVT 
// 	instance VALORAM 
// 	instance HORAS 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

ACCESS ano() 
RETURN SELF:FieldGet(#ano)


ASSIGN ano(uValue) 
SELF:FieldPut(#ano, uValue)
RETURN ano := uValue


METHOD APPEND()
LOCAL nNOTA AS DWORD
SELF:SERVER:GOBOTTOM()
nNOTA:=SELF:SERVER:FIELDGET("NF")	
SUPER:APPEND()
SELF:SERVER:FIELDPUT("ANO",ZANO)
SELF:SERVER:FIELDPUT("MES",ZMES)
SELF:SERVER:FIELDPUT("NF",nNOTA)

METHOD buscaNUM( ) 
	SELF:KeyFind()

METHOD CMDimprimir( ) 
SELF:XWRPTFGRP("OUT","NF")	


METHOD cmdmais( ) 
SELF:server:FIELDPUT("MES",INCDEC(SELF:SERVER:FIELDGET("MES"),1,1,12))

METHOD cmdmais2( ) 
SELF:server:FIELDPUT("ANO",INCDEC(SELF:SERVER:FIELDGET("ANO"),1,1900,2100))		

METHOD cmdmenos( ) 
SELF:server:FIELDPUT("MES",INCDEC(SELF:SERVER:FIELDGET("MES"),-1,1,12))

METHOD cmdmenos2( ) 
SELF:server:FIELDPUT("ANO",INCDEC(SELF:SERVER:FIELDGET("ANO"),-1,1900,2100))			

METHOD cmdordenar( ) 
	SELF:KeyFind()

METHOD escFUN( ) 
LOCAL oESC AS XESCNUM	
//LOCAL aFORN AS ARRAY
LOCAL oSERVER AS USEFOLHA
oSERVER:=USEFOLHA{"FO_PES"}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
oESC:=XESCNUM{SELF,,1,oSERVER}
oESC:SHOW()	
IF Oesc:lok
    SELF:SERVER:FIELDPUT("NUMERO",oESC:NUMERO)
ENDIF	

ACCESS HORAS() 
RETURN SELF:FieldGet(#HORAS)


ASSIGN HORAS(uValue) 
SELF:FieldPut(#HORAS, uValue)
RETURN HORAS := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jNFCC",_GetInst()},iCtlID)

oDCSC_NF := FixedText{SELF,ResourceID{JNFCC_SC_NF,_GetInst()}}
oDCSC_NF:HyperLabel := HyperLabel{#SC_NF,"Nf:",NULL_STRING,NULL_STRING}

oDCSC_NUMERO := FixedText{SELF,ResourceID{JNFCC_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_VALOR := FixedText{SELF,ResourceID{JNFCC_SC_VALOR,_GetInst()}}
oDCSC_VALOR:HyperLabel := HyperLabel{#SC_VALOR,"Valor:",NULL_STRING,NULL_STRING}

oDCNF := rightSle{SELF,ResourceID{JNFCC_NF,_GetInst()}}
oDCNF:FieldSpec := padrao_num_08{}
oDCNF:HyperLabel := HyperLabel{#NF,"Nf:",NULL_STRING,"NFCC_NF"}

oDCNUMERO := rightSle{SELF,ResourceID{JNFCC_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"NFCC_NUMERO"}

oDCVALOR := rightSle{SELF,ResourceID{JNFCC_VALOR,_GetInst()}}
oDCVALOR:FieldSpec := padrao_num_09_2{}
oDCVALOR:HyperLabel := HyperLabel{#VALOR,"Valor",NULL_STRING,"NFCC_VALOR"}

oCCcmdordenar := PushButton{SELF,ResourceID{JNFCC_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{SELF,ResourceID{JNFCC_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oDCFixedText2 := FixedText{SELF,ResourceID{JNFCC_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Ano",NULL_STRING,NULL_STRING}

oDCano := rightSle{SELF,ResourceID{JNFCC_ANO,_GetInst()}}
oDCano:HyperLabel := HyperLabel{#ano,"ano",NULL_STRING,NULL_STRING}
oDCano:TooltipText := "Ano Inicial"
oDCano:FieldSpec := PADRAO_num_04{}

oCCcmdmenos2 := PushButton{SELF,ResourceID{JNFCC_CMDMENOS2,_GetInst()}}
oCCcmdmenos2:HyperLabel := HyperLabel{#cmdmenos2,"-",NULL_STRING,NULL_STRING}

oCCcmdmais2 := PushButton{SELF,ResourceID{JNFCC_CMDMAIS2,_GetInst()}}
oCCcmdmais2:HyperLabel := HyperLabel{#cmdmais2,"+",NULL_STRING,NULL_STRING}

oCCcmdmenos := PushButton{SELF,ResourceID{JNFCC_CMDMENOS,_GetInst()}}
oCCcmdmenos:HyperLabel := HyperLabel{#cmdmenos,"-",NULL_STRING,NULL_STRING}

oCCcmdmais := PushButton{SELF,ResourceID{JNFCC_CMDMAIS,_GetInst()}}
oCCcmdmais:HyperLabel := HyperLabel{#cmdmais,"+",NULL_STRING,NULL_STRING}

oDCmes := rightSle{SELF,ResourceID{JNFCC_MES,_GetInst()}}
oDCmes:HyperLabel := HyperLabel{#mes,"mes",NULL_STRING,NULL_STRING}
oDCmes:TooltipText := "Mes Inicial"
oDCmes:FieldSpec := PADRAO_num_02{}

oDCFixedText1 := FixedText{SELF,ResourceID{JNFCC_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Mes",NULL_STRING,NULL_STRING}

oCCescFUN := PushButton{SELF,ResourceID{JNFCC_ESCFUN,_GetInst()}}
oCCescFUN:HyperLabel := HyperLabel{#escFUN,"...",NULL_STRING,NULL_STRING}

oDCVALORVT := rightSle{SELF,ResourceID{JNFCC_VALORVT,_GetInst()}}
oDCVALORVT:FieldSpec := padrao_num_09_2{}
oDCVALORVT:HyperLabel := HyperLabel{#VALORVT,"Valor",NULL_STRING,"NFCC_VALOR"}

oDCSC_VALOR1 := FixedText{SELF,ResourceID{JNFCC_SC_VALOR1,_GetInst()}}
oDCSC_VALOR1:HyperLabel := HyperLabel{#SC_VALOR1,"Vale Transporte",NULL_STRING,NULL_STRING}

oDCVALORAM := rightSle{SELF,ResourceID{JNFCC_VALORAM,_GetInst()}}
oDCVALORAM:FieldSpec := padrao_num_09_2{}
oDCVALORAM:HyperLabel := HyperLabel{#VALORAM,"Valor",NULL_STRING,"NFCC_VALOR"}

oDCSC_VALOR2 := FixedText{SELF,ResourceID{JNFCC_SC_VALOR2,_GetInst()}}
oDCSC_VALOR2:HyperLabel := HyperLabel{#SC_VALOR2,"Assistencia Medica",NULL_STRING,NULL_STRING}

oDCHORAS := rightSle{SELF,ResourceID{JNFCC_HORAS,_GetInst()}}
oDCHORAS:FieldSpec := padrao_num_09_2{}
oDCHORAS:HyperLabel := HyperLabel{#HORAS,"Valor",NULL_STRING,"NFCC_VALOR"}

oDCSC_VALOR3 := FixedText{SELF,ResourceID{JNFCC_SC_VALOR3,_GetInst()}}
oDCSC_VALOR3:HyperLabel := HyperLabel{#SC_VALOR3,"Horas",NULL_STRING,NULL_STRING}

SELF:Caption := "Controle de Notas"
SELF:HyperLabel := HyperLabel{#jNFCC,"Controle de Notas",NULL_STRING,NULL_STRING}
SELF:Menu := STANDARDSHELLMENU{}

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF
SELF:Browser := DataBrowser{SELF}

oDBNF := DataColumn{padrao_num_08{}}
oDBNF:Width := 13
oDBNF:HyperLabel := oDCNF:HyperLabel 
oDBNF:Caption := "Nf:"
SELF:Browser:AddColumn(oDBNF)

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 13
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
SELF:Browser:AddColumn(oDBNUMERO)

oDBVALOR := DataColumn{padrao_num_09_2{}}
oDBVALOR:Width := 17
oDBVALOR:HyperLabel := oDCVALOR:HyperLabel 
oDBVALOR:Caption := "Valor"
SELF:Browser:AddColumn(oDBVALOR)

oDBMES := DataColumn{PADRAO_num_02{}}
oDBMES:Width := 9
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "mes"
SELF:Browser:AddColumn(oDBMES)

oDBANO := DataColumn{PADRAO_num_04{}}
oDBANO:Width := 9
oDBANO:HyperLabel := oDCANO:HyperLabel 
oDBANO:Caption := "ano"
SELF:Browser:AddColumn(oDBANO)


SELF:ViewAs(#FormView)

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


ACCESS mes() 
RETURN SELF:FieldGet(#mes)


ASSIGN mes(uValue) 
SELF:FieldPut(#mes, uValue)
RETURN mes := uValue


ACCESS NF() 
RETURN SELF:FieldGet(#NF)


ASSIGN NF(uValue) 
SELF:FieldPut(#NF, uValue)
RETURN NF := uValue


ACCESS NUMERO() 
RETURN SELF:FieldGet(#NUMERO)


ASSIGN NUMERO(uValue) 
SELF:FieldPut(#NUMERO, uValue)
RETURN NUMERO := uValue


METHOD PostInit() 
   SELF:RegisterTimer(300,FALSE)
    FabCenterWindow( SELF )
 RETURN SELF

METHOD Timer() 
   SELF:SERVER:COMMIT()


ACCESS VALOR() 
RETURN SELF:FieldGet(#VALOR)


ASSIGN VALOR(uValue) 
SELF:FieldPut(#VALOR, uValue)
RETURN VALOR := uValue


ACCESS VALORAM() 
RETURN SELF:FieldGet(#VALORAM)


ASSIGN VALORAM(uValue) 
SELF:FieldPut(#VALORAM, uValue)
RETURN VALORAM := uValue


ACCESS VALORVT() 
RETURN SELF:FieldGet(#VALORVT)


ASSIGN VALORVT(uValue) 
SELF:FieldPut(#VALORVT, uValue)
RETURN VALORVT := uValue


END CLASS
