#region DEFINES
STATIC DEFINE IMPLXOP01_CANCELAR := 104 
STATIC DEFINE IMPLXOP01_D01 := 102 
STATIC DEFINE IMPLXOP01_D02 := 101 
STATIC DEFINE IMPLXOP01_D03 := 100 
STATIC DEFINE IMPLXOP01_OK := 106 
STATIC DEFINE IMPLXOP01_THEFIXEDTEXT10 := 105 
STATIC DEFINE IMPLXOP01_THEFIXEDTEXT9 := 103 
#endregion

class implxop01 inherit DATADIALOG 

	protect oDCD03 as DATESLE
	protect oDCD02 as DATESLE
	protect oDCD01 as DATESLE
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCok as PUSHBUTTON
// 	instance D03 
// 	instance D02 
// 	instance D01 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Cancelar( ) 
	SELF:EndWindow()

access D01() 
return self:FieldGet(#D01)


assign D01(uValue) 
self:FieldPut(#D01, uValue)
return D01 := uValue


access D02() 
return self:FieldGet(#D02)


assign D02(uValue) 
self:FieldPut(#D02, uValue)
return D02 := uValue


access D03() 
return self:FieldGet(#D03)


assign D03(uValue) 
self:FieldPut(#D03, uValue)
return D03 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"implxop01",_GetInst()},iCtlID)

oDCD03 := DateSle{self,ResourceID{IMPLXOP01_D03,_GetInst()}}
oDCD03:HyperLabel := HyperLabel{#D03,NULL_STRING,NULL_STRING,NULL_STRING}
oDCD03:FieldSpec := DATE_FIELD{}

oDCD02 := DateSle{self,ResourceID{IMPLXOP01_D02,_GetInst()}}
oDCD02:HyperLabel := HyperLabel{#D02,NULL_STRING,NULL_STRING,NULL_STRING}
oDCD02:FieldSpec := DATE_FIELD{}

oDCD01 := DateSle{self,ResourceID{IMPLXOP01_D01,_GetInst()}}
oDCD01:HyperLabel := HyperLabel{#D01,NULL_STRING,NULL_STRING,NULL_STRING}
oDCD01:FieldSpec := DATE_FIELD{}

oDCtheFixedText9 := FixedText{self,ResourceID{IMPLXOP01_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Cancelar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{IMPLXOP01_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}
oCCCancelar:TooltipText := "Clique para Cancelar"

oDCtheFixedText10 := FixedText{self,ResourceID{IMPLXOP01_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCok := PushButton{self,ResourceID{IMPLXOP01_OK,_GetInst()}}
oCCok:HyperLabel := HyperLabel{#ok,NULL_STRING,NULL_STRING,NULL_STRING}
oCCok:Image := ico_ok{}
oCCok:TooltipText := "Clique Para Inciar a Impotação"

self:Caption := "DataDialog Caption"
self:HyperLabel := HyperLabel{#implxop01,"DataDialog Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD ok( ) 
LOCAL oCONN AS SQLConnection
LOCAL oSTMT AS SQLStatement
LOCAL cSQL AS STRING
LOCAL dFIM AS DATE
//LOCAL cEMP AS STRING
	
ZERADBFREDE("OP01")	

oConn := SQLConnection{}

IF ! oConn:connect("ol_logix","","")
   alert("Erro na Conecção")
   RETU
ENDIF	

cSQL:= "set isolation to dirty read"
oStmt := SQLStatement{cSQL,oConn}
oSTMT:Execute()


dFIM:=CToD(SELF:ODCD03:TEXTValue)
dFIM:=dFIM+6          //ate o Domingo

//cEMP:=PEGEMPMIG()






METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		    FabCenterWindow( SELF )
	RETURN NIL


END CLASS
