#region DEFINES
STATIC DEFINE JCNQDEP_ANO := 101 
STATIC DEFINE JCNQDEP_BUSCACOM := 105 
STATIC DEFINE JCNQDEP_CMDMAIS := 113 
STATIC DEFINE JCNQDEP_CMDMAIS2 := 111 
STATIC DEFINE JCNQDEP_CMDMENOS := 112 
STATIC DEFINE JCNQDEP_CMDMENOS2 := 110 
STATIC DEFINE JCNQDEP_FIXEDTEXT1 := 103 
STATIC DEFINE JCNQDEP_FIXEDTEXT2 := 104 
STATIC DEFINE JCNQDEP_GRAVAR := 107 
STATIC DEFINE JCNQDEP_MES := 100 
STATIC DEFINE JCNQDEP_PUSHBUTTON2 := 109 
STATIC DEFINE JCNQDEP_THEFIXEDTEXT10 := 106 
STATIC DEFINE JCNQDEP_THEFIXEDTEXT9 := 108 
STATIC DEFINE JCNQDEP_VALOR := 102 
#endregion

class JCNQDEP inherit DATADIALOG 

	protect oDCmes as RIGHTSLE
	protect oDCano as RIGHTSLE
	protect oDCvalor as RIGHTSLE
	protect oDCFixedText1 as FIXEDTEXT
	protect oDCFixedText2 as FIXEDTEXT
	protect oCCbuscaCOM as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCGravar as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCPushButton2 as PUSHBUTTON
	protect oCCcmdmenos2 as PUSHBUTTON
	protect oCCcmdmais2 as PUSHBUTTON
	protect oCCcmdmenos as PUSHBUTTON
	protect oCCcmdmais as PUSHBUTTON
// 	instance mes 
// 	instance ano 
// 	instance valor 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ano() 
return self:FieldGet(#ano)


assign ano(uValue) 
self:FieldPut(#ano, uValue)
return ano := uValue


METHOD buscaCOM( ) 
	SELF:FAZ01(1)

METHOD cmdmais( ) 
SELF:oDCMES:Value:=Str(INCDEC(SELF:oDCMES:Value,1,1,12),2)		


METHOD cmdmenos( ) 
SELF:oDCMES:Value:=Str(INCDEC(SELF:oDCMES:Value,-1,1,12),2)			


METHOD faz01(nTIPO) 
LOCAL cDATA AS STRING
LOCAL cCOMPE AS STRING
LOCAL dDATA AS DATE
LOCAL aGRAVA AS ARRAY
LOCAL aRETU AS ARRAY
aGRAVA:={}
cDATA:="01/"
cDATA+=StrZero(Val(SELF:MES),2)+"/"	
cDATA+=StrZero(Val(SELF:ANO),4)
cCOMPE:=StrZero(Val(SELF:ANO),4)+StrZero(Val(SELF:MES),2)
dDATA:=CToD(cDATA)
aRETU:=checkcnq(6,cCOMPE)
IF ! aRETU[1]
	//Cliente,Clinome,Codigo,Descriçao,RAT,RNC,DATA ,SAC,cOM(Dep)
    //      1.      2      3         4   5    6   7 ,8    9
    AAdd(aGRAVA,0)
    AAdd(aGRAVA,"")
    AAdd(aGRAVA,"DEPFIX")
    AAdd(aGRAVA,"Despesas Fixas")
    AAdd(aGRAVA,0)
    AAdd(aGRAVA,0)
    AAdd(aGRAVA,dDATA)
    AAdd(aGRAVA,0)
    AAdd(aGRAVA,cCOMPE)
    NOVOCNQ(aGRAVA)		
ELSE
   IF nTIPO=1	
      SELF:valor:=aRETU[2]
      SELF:oCCbuscaCOM:Disable()
      SELF:oDCano:Disable()
      SELF:oDCmes:Disable()
      SELF:oCCGravar:ENABLE()
      SELF:oDCvalor:Enable()
   ELSE
      aRETU:=checkcnq(6,cCOMPE,SELF:VALOR)
      SELF:oCCbuscaCOM:ENable()
      SELF:oDCano:ENable()
      SELF:oDCmes:ENable()
      SELF:oCCGravar:DISABLE()
      SELF:oDCvalor:DISable()
   ENDIF
ENDIF		

METHOD Gravar( ) 
	SELF:faz01(2)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCNQDEP",_GetInst()},iCtlID)

oDCmes := rightsle{self,ResourceID{JCNQDEP_MES,_GetInst()}}
oDCmes:HyperLabel := HyperLabel{#mes,NULL_STRING,NULL_STRING,NULL_STRING}
oDCmes:FieldSpec := padrao_num_02{}

oDCano := rightSle{self,ResourceID{JCNQDEP_ANO,_GetInst()}}
oDCano:HyperLabel := HyperLabel{#ano,NULL_STRING,NULL_STRING,NULL_STRING}
oDCano:FieldSpec := padrao_num_04{}

oDCvalor := rightSle{self,ResourceID{JCNQDEP_VALOR,_GetInst()}}
oDCvalor:FieldSpec := padrao_num_12_2{}
oDCvalor:HyperLabel := HyperLabel{#valor,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText1 := FixedText{self,ResourceID{JCNQDEP_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Mes ",NULL_STRING,NULL_STRING}

oDCFixedText2 := FixedText{self,ResourceID{JCNQDEP_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Ano",NULL_STRING,NULL_STRING}

oCCbuscaCOM := PushButton{self,ResourceID{JCNQDEP_BUSCACOM,_GetInst()}}
oCCbuscaCOM:Image := ico_find{}
oCCbuscaCOM:HyperLabel := HyperLabel{#buscaCOM,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{self,ResourceID{JCNQDEP_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK-Gravar",NULL_STRING,NULL_STRING}

oCCGravar := PushButton{self,ResourceID{JCNQDEP_GRAVAR,_GetInst()}}
oCCGravar:HyperLabel := HyperLabel{#Gravar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCGravar:Image := ico_ok{}

oDCtheFixedText9 := FixedText{self,ResourceID{JCNQDEP_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCPushButton2 := PushButton{self,ResourceID{JCNQDEP_PUSHBUTTON2,_GetInst()}}
oCCPushButton2:HyperLabel := HyperLabel{#PushButton2,NULL_STRING,NULL_STRING,NULL_STRING}
oCCPushButton2:Image := ico_sair{}

oCCcmdmenos2 := PushButton{self,ResourceID{JCNQDEP_CMDMENOS2,_GetInst()}}
oCCcmdmenos2:HyperLabel := HyperLabel{#cmdmenos2,"-",NULL_STRING,NULL_STRING}

oCCcmdmais2 := PushButton{self,ResourceID{JCNQDEP_CMDMAIS2,_GetInst()}}
oCCcmdmais2:HyperLabel := HyperLabel{#cmdmais2,"+",NULL_STRING,NULL_STRING}

oCCcmdmenos := PushButton{self,ResourceID{JCNQDEP_CMDMENOS,_GetInst()}}
oCCcmdmenos:HyperLabel := HyperLabel{#cmdmenos,"-",NULL_STRING,NULL_STRING}

oCCcmdmais := PushButton{self,ResourceID{JCNQDEP_CMDMAIS,_GetInst()}}
oCCcmdmais:HyperLabel := HyperLabel{#cmdmais,"+",NULL_STRING,NULL_STRING}

self:Caption := "Despesas Fixas Custo Não Qualidade"
self:HyperLabel := HyperLabel{#JCNQDEP,"Despesas Fixas Custo Não Qualidade",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access mes() 
return self:FieldGet(#mes)


assign mes(uValue) 
self:FieldPut(#mes, uValue)
return mes := uValue


METHOD PushButton1( )  

METHOD PushButton2( ) 
	SELF:EndWindow()

access valor() 
return self:FieldGet(#valor)


assign valor(uValue) 
self:FieldPut(#valor, uValue)
return valor := uValue


END CLASS
