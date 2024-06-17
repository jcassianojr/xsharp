#region DEFINES
STATIC DEFINE JRNCF2_DATETIMEPICKER1 := 102 
STATIC DEFINE JRNCF2_FECDATA := 101 
STATIC DEFINE JRNCF2_OK := 103 
STATIC DEFINE JRNCF2_SC_FECDATA := 100 
STATIC DEFINE JRNCF2_THEFIXEDTEXT11 := 102 
#endregion

class JRNCF2 inherit DATADIALOG 

	protect oDCSC_FECDATA as FIXEDTEXT
	protect oDCFECDATA as DATESLE
	protect oDCtheFixedText11 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
// 	instance FECDATA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access FECDATA() 
return self:FieldGet(#FECDATA)


assign FECDATA(uValue) 
self:FieldPut(#FECDATA, uValue)
return FECDATA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRNCF2",_GetInst()},iCtlID)

oDCSC_FECDATA := FixedText{self,ResourceID{JRNCF2_SC_FECDATA,_GetInst()}}
oDCSC_FECDATA:HyperLabel := HyperLabel{#SC_FECDATA,"Data Fechamento",NULL_STRING,NULL_STRING}

oDCFECDATA := DateSle{self,ResourceID{JRNCF2_FECDATA,_GetInst()}}
oDCFECDATA:FieldSpec := DATE_FIELD{}
oDCFECDATA:HyperLabel := HyperLabel{#FECDATA,"Fecdata:",NULL_STRING,"RNC_FECDATA"}

oDCtheFixedText11 := FixedText{self,ResourceID{JRNCF2_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JRNCF2_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}

self:Caption := "Fechamento RNC"
self:HyperLabel := HyperLabel{#JRNCF2,"Fechamento RNC",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD OK( ) 
LOCAL oSERVER AS USEREDE
LOCAL aDAD AS ARRAY
aDAD:={zCURINI,"RNC.DBF",zCURDIR}
oSERVER:=USEREDE{aDAD}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
OSERVER:SETORDER(1)
OSERVER:GOTOP()
IF ! OSERVER:SEEK(nRNCTEMP)
   oSERVER:CLOSE()
   alert("RNC Não Encontrada","Erro")
   RETU SELF	
ENDIF	
oSERVER:FIELDPUT("FECDATA",SELF:FECDATA)
oSERVER:FIELDPUT("FECUSER",ZUSER)
OSERVER:FIELDPUT("FECHADA",.T.)
oserver:Close()
SELF:EndWindow()



METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		   FabCenterWindow( SELF )
	RETURN NIL


END CLASS
