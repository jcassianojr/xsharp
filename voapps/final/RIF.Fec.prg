#region DEFINES
STATIC DEFINE JRIFFEC_LAUDO := 102 
STATIC DEFINE JRIFFEC_OKX := 104 
STATIC DEFINE JRIFFEC_RADIOBUTTON1 := 101 
STATIC DEFINE JRIFFEC_RADIOBUTTON2 := 100 
STATIC DEFINE JRIFFEC_THEFIXEDTEXT10 := 103 
#endregion

class JRIFFEC inherit DATADIALOG 

	protect oCCRadioButton2 as RADIOBUTTON
	protect oCCRadioButton1 as RADIOBUTTON
	protect oDCLaudo as RADIOBUTTONGROUP
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOKx as PUSHBUTTON
// 	instance Laudo 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRIFFEC",_GetInst()},iCtlID)

oCCRadioButton2 := RadioButton{self,ResourceID{JRIFFEC_RADIOBUTTON2,_GetInst()}}
oCCRadioButton2:HyperLabel := HyperLabel{#RadioButton2,"Reprovado",NULL_STRING,NULL_STRING}
oCCRadioButton2:TooltipText := "Marcar RIF Com Reprovado"

oCCRadioButton1 := RadioButton{self,ResourceID{JRIFFEC_RADIOBUTTON1,_GetInst()}}
oCCRadioButton1:HyperLabel := HyperLabel{#RadioButton1,"Aprovado",NULL_STRING,NULL_STRING}
oCCRadioButton1:TooltipText := "Marcar RIF Com Aprovado"

oDCtheFixedText10 := FixedText{self,ResourceID{JRIFFEC_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOKx := PushButton{self,ResourceID{JRIFFEC_OKX,_GetInst()}}
oCCOKx:HyperLabel := HyperLabel{#OKx,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOKx:Image := ico_ok{}
oCCOKx:TooltipText := "Clique Para Concluir"

oDCLaudo := RadioButtonGroup{self,ResourceID{JRIFFEC_LAUDO,_GetInst()}}
oDCLaudo:FillUsing({ ;
						{oCCRadioButton2,"R"}, ;
						{oCCRadioButton1,"A"} ;
						})
oDCLaudo:HyperLabel := HyperLabel{#Laudo,"Laudo",NULL_STRING,NULL_STRING}
oDCLaudo:FieldSpec := PADRAO_CHAR_01{}
oDCLaudo:TooltipText := "Resultado do Laudo"

self:Caption := "Fechamento RIF"
self:HyperLabel := HyperLabel{#JRIFFEC,"Fechamento RIF",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access Laudo() 
return self:FieldGet(#Laudo)


assign Laudo(uValue) 
self:FieldPut(#Laudo, uValue)
return Laudo := uValue


METHOD okx( ) 
LOCAL oSERVER AS USEREDE
LOCAL oOSCRT AS USEREDE
LOCAL aDAD AS ARRAY
LOCAL cCODIGO AS STRING
LOCAL aERRO AS ARRAY
cCODIGO:=SELF:SERVER:FIELDGET("CODIGO")
aDAD:={zCURINI,"RIFPR.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
   RETU SELF
ENDIF
aDAD:={zCURINI,"OSCRT.DBF",zCURDIR}
oOSCRT:=USEREDE{aDAD}
IF oOSCRT:nERRO#0
   oSERVER:CLOSE()
   RETU SELF
ENDIF	



oSERVER:GOTOP()
IF ! oSERVER:SEEK(cCODIGO)	
   oSERVER:APPEND()
   oSERVER:FIELDPUT("PRODUTO",cCODIGO)
ENDIF
oSERVER:FIELDPUT("RIFTOT",oSERVER:FIELDGET("RIFTOT")+SELF:SERVER:FIELDGET("QTDE"))	
IF oSERVER:FIELDGET("QTDE")<1200
   oSERVER:FIELDPUT("QTDE",oSERVER:FIELDGET("QTDE")+SELF:SERVER:FIELDGET("QTDE"))		
ENDIF	
IF Empty(oSERVER:FIELDGET("RIF1200")) .AND. oSERVER:FIELDGET("QTDE")>1200
   oSERVER:FIELDPUT("RIF1200",SELF:SERVER:FIELDGET("RIF"))	
   Aerro:={}
   AAdd(aERRO,"RIF No:"+StrTRIM(SELF:SERVER:RIF,8,0))
   AAdd(aERRO,"Produto:"+Ccodigo)
   EMAILINT("RIF00010",ZUSER,aERRO,ZCURINI,zCURDIR)
   oOSCRT:GOTOP()
   IF oOSCRT:SEEK(SELF:SERVER:FIELDGET("OS"))
      oOSCRT:FIELDPUT("EMUSO","P")
   ENDIF	
ENDIF	

IF ! Empty(oSERVER:FIELDGET("SEL100")) .AND. Empty(oSERVER:FIELDGET("RIFSEL"))
   IF Today()>oSERVER:FIELDGET("SEL100")
      oSERVER:FIELDPUT("RIFSEL",SELF:SERVER:FIELDGET("RIF"))	
      Aerro:={}
      AAdd(aERRO,"RIF No:"+StrTRIM(SELF:SERVER:RIF,8,0))
      AAdd(aERRO,"Produto:"+Ccodigo)
      EMAILINT("RIF00011",ZUSER,aERRO,ZCURINI,zCURDIR)
   ENDIF
ENDIF	
oSERVER:FIELDPUT("RIFULT",SELF:SERVER:FIELDGET("RIF"))	
oSERVER:Commit()	
oSERVER:CLOSE()	
oOSCRT:CLOSE()
SELF:SERVER:Commit()
SELF:ENDWINDOW()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	    FabCenterWindow( SELF )
	RETURN NIL


END CLASS
