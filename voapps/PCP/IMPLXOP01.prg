#region DEFINES
STATIC DEFINE IMPLXOP01_CANCELAR := 104 
STATIC DEFINE IMPLXOP01_D01 := 102 
STATIC DEFINE IMPLXOP01_D02 := 101 
STATIC DEFINE IMPLXOP01_D03 := 100 
STATIC DEFINE IMPLXOP01_OK := 106 
STATIC DEFINE IMPLXOP01_THEFIXEDTEXT10 := 105 
STATIC DEFINE IMPLXOP01_THEFIXEDTEXT9 := 103 
#endregion

CLASS implxop01 INHERIT DATADIALOG 

	PROTECT oDCD03 AS DATESLE
	PROTECT oDCD02 AS DATESLE
	PROTECT oDCD01 AS DATESLE
	PROTECT oDCtheFixedText9 AS FIXEDTEXT
	PROTECT oCCCancelar AS PUSHBUTTON
	PROTECT oDCtheFixedText10 AS FIXEDTEXT
	PROTECT oCCok AS PUSHBUTTON
// 	instance D03 
// 	instance D02 
// 	instance D01 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Cancelar( ) 
	SELF:EndWindow()

ACCESS D01() 
RETURN SELF:FieldGet(#D01)


ASSIGN D01(uValue) 
SELF:FieldPut(#D01, uValue)
RETURN D01 := uValue


ACCESS D02() 
RETURN SELF:FieldGet(#D02)


ASSIGN D02(uValue) 
SELF:FieldPut(#D02, uValue)
RETURN D02 := uValue


ACCESS D03() 
RETURN SELF:FieldGet(#D03)


ASSIGN D03(uValue) 
SELF:FieldPut(#D03, uValue)
RETURN D03 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"implxop01",_GetInst()},iCtlID)

oDCD03 := DateSle{SELF,ResourceID{IMPLXOP01_D03,_GetInst()}}
oDCD03:HyperLabel := HyperLabel{#D03,NULL_STRING,NULL_STRING,NULL_STRING}
oDCD03:FieldSpec := DATE_FIELD{}

oDCD02 := DateSle{SELF,ResourceID{IMPLXOP01_D02,_GetInst()}}
oDCD02:HyperLabel := HyperLabel{#D02,NULL_STRING,NULL_STRING,NULL_STRING}
oDCD02:FieldSpec := DATE_FIELD{}

oDCD01 := DateSle{SELF,ResourceID{IMPLXOP01_D01,_GetInst()}}
oDCD01:HyperLabel := HyperLabel{#D01,NULL_STRING,NULL_STRING,NULL_STRING}
oDCD01:FieldSpec := DATE_FIELD{}

oDCtheFixedText9 := FixedText{SELF,ResourceID{IMPLXOP01_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Cancelar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{SELF,ResourceID{IMPLXOP01_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}
oCCCancelar:TooltipText := "Clique para Cancelar"

oDCtheFixedText10 := FixedText{SELF,ResourceID{IMPLXOP01_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCok := PushButton{SELF,ResourceID{IMPLXOP01_OK,_GetInst()}}
oCCok:HyperLabel := HyperLabel{#ok,NULL_STRING,NULL_STRING,NULL_STRING}
oCCok:Image := ico_ok{}
oCCok:TooltipText := "Clique Para Inciar a Impotação"

SELF:Caption := "DataDialog Caption"
SELF:HyperLabel := HyperLabel{#implxop01,"DataDialog Caption",NULL_STRING,NULL_STRING}

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


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
   RETURN .f.
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
