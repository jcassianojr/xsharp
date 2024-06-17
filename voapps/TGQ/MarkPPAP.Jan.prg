#region DEFINES
STATIC DEFINE JMAR_CANCELAR := 109 
STATIC DEFINE JMAR_DATA := 103 
STATIC DEFINE JMAR_FIXEDTEXT1 := 104 
STATIC DEFINE JMAR_FIXEDTEXT2 := 105 
STATIC DEFINE JMAR_FIXEDTEXT3 := 106 
STATIC DEFINE JMAR_FIXEDTEXT4 := 107 
STATIC DEFINE JMAR_ITEM := 101 
STATIC DEFINE JMAR_OK := 111 
STATIC DEFINE JMAR_PEDIDO := 100 
STATIC DEFINE JMAR_PPAP := 102 
STATIC DEFINE JMAR_THEFIXEDTEXT10 := 110 
STATIC DEFINE JMAR_THEFIXEDTEXT9 := 108 
#endregion

class JMAR inherit DATADIALOG 

	protect oDCPEDIDO as RIGHTSLE
	protect oDCITEM as RIGHTSLE
	protect oDCPPAP as RIGHTSLE
	protect oDCDATA as DATETIMEPICKER
	protect oDCFixedText1 as FIXEDTEXT
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCFixedText3 as FIXEDTEXT
	protect oDCFixedText4 as FIXEDTEXT
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
// 	instance PEDIDO 
// 	instance ITEM 
// 	instance PPAP 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD CANCELAR( ) 
	SELF:ENDWINDOW()

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMAR",_GetInst()},iCtlID)

oDCPEDIDO := rightSle{self,ResourceID{JMAR_PEDIDO,_GetInst()}}
oDCPEDIDO:HyperLabel := HyperLabel{#PEDIDO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPEDIDO:FieldSpec := padrao_num_08{}

oDCITEM := rightSle{self,ResourceID{JMAR_ITEM,_GetInst()}}
oDCITEM:HyperLabel := HyperLabel{#ITEM,NULL_STRING,NULL_STRING,NULL_STRING}
oDCITEM:FieldSpec := padrao_num_03{}

oDCPPAP := rightSle{self,ResourceID{JMAR_PPAP,_GetInst()}}
oDCPPAP:HyperLabel := HyperLabel{#PPAP,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPPAP:FieldSpec := padrao_num_08{}

oDCDATA := DateTimePicker{self,ResourceID{JMAR_DATA,_GetInst()}}
oDCDATA:HyperLabel := HyperLabel{#DATA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText1 := FixedText{self,ResourceID{JMAR_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Pedido",NULL_STRING,NULL_STRING}

oDCFixedText2 := FixedText{self,ResourceID{JMAR_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Item",NULL_STRING,NULL_STRING}

oDCFixedText3 := FixedText{self,ResourceID{JMAR_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"PPAP",NULL_STRING,NULL_STRING}

oDCFixedText4 := FixedText{self,ResourceID{JMAR_FIXEDTEXT4,_GetInst()}}
oDCFixedText4:HyperLabel := HyperLabel{#FixedText4,"Data",NULL_STRING,NULL_STRING}

oDCtheFixedText9 := FixedText{self,ResourceID{JMAR_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{JMAR_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}

oDCtheFixedText10 := FixedText{self,ResourceID{JMAR_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JMAR_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}

self:Caption := "Marcar PPAP"
self:HyperLabel := HyperLabel{#JMAR,"Marcar PPAP",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access ITEM() 
return self:FieldGet(#ITEM)


assign ITEM(uValue) 
self:FieldPut(#ITEM, uValue)
return ITEM := uValue


METHOD OK( ) 
LOCAL nPEPED,nPEITE AS DWORD
LOCAL aDAD AS ARRAY
LOCAL oMW02 AS USEREDE	
	
nPEPED:=Val(SELF:ODCPEDIDO:TEXTVALUE)
nPEITE:=Val(SELF:ODCITEM:TEXTVALUE)
aDAD:={zCURINI,"MW02.DBF",zCURDIR}
oMW02:=USEREDE{aDAD}
IF oMW02:nERRO=0
     oMW02:GOTOP()
     oMW02:SEEK(Str(nPEPED,8)+Str(nPEITE,3))
     IF oMW02:FOUND
     	oMW02:RLOCK()
     	oMW02:FIELDPUT("PPAP",Val(SELF:ODCPPAP:TEXTVALUE))
     	oMW02:FIELDPUT("PPAPD",CToD(SELF:ODCDATA:TEXTVALUE))
     	oMW02:Unlock()
     ENDIF
ENDIF	
oMW02:Close()
alert("Pedido Marcado","Pedido Marcado")


access PEDIDO() 
return self:FieldGet(#PEDIDO)


assign PEDIDO(uValue) 
self:FieldPut(#PEDIDO, uValue)
return PEDIDO := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	   FabCenterWindow( SELF )
	RETURN NIL


access PPAP() 
return self:FieldGet(#PPAP)


assign PPAP(uValue) 
self:FieldPut(#PPAP, uValue)
return PPAP := uValue


END CLASS
