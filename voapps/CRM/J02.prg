#region DEFINES
STATIC DEFINE J02_AREA := 110 
STATIC DEFINE J02_CARGO := 106 
STATIC DEFINE J02_DATAL := 100 
STATIC DEFINE J02_LAUDOF := 105 
STATIC DEFINE J02_OK := 112 
STATIC DEFINE J02_RB1 := 104 
STATIC DEFINE J02_RB2 := 103 
STATIC DEFINE J02_RB3 := 102 
STATIC DEFINE J02_RESPO := 109 
STATIC DEFINE J02_SC_DATAL := 101 
STATIC DEFINE J02_THEFIXEDTEXT10 := 111 
STATIC DEFINE J02_THEFIXEDTEXT13 := 108 
STATIC DEFINE J02_THEFIXEDTEXT14 := 107 
#endregion

class J02 inherit DATADIALOG 

	protect oDCDATAL as DATETIMEPICKER
	protect oDCSC_DATAL as FIXEDTEXT
	protect oCCRB3 as RADIOBUTTON
	protect oCCRB2 as RADIOBUTTON
	protect oCCRB1 as RADIOBUTTON
	protect oDCLAUDOF as RADIOBUTTONGROUP
	protect oDCCARGO as SINGLELINEEDIT
	protect oDCtheFixedText14 as FIXEDTEXT
	protect oDCtheFixedText13 as FIXEDTEXT
	protect oDCRESPO as SINGLELINEEDIT
	protect oDCAREA as COMBOBOX
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
// 	instance LAUDOF 
// 	instance CARGO 
// 	instance RESPO 
// 	instance AREA 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access AREA() 
return self:FieldGet(#AREA)


assign AREA(uValue) 
self:FieldPut(#AREA, uValue)
return AREA := uValue


access CARGO() 
return self:FieldGet(#CARGO)


assign CARGO(uValue) 
self:FieldPut(#CARGO, uValue)
return CARGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"J02",_GetInst()},iCtlID)

oDCDATAL := DateTimePicker{self,ResourceID{J02_DATAL,_GetInst()}}
oDCDATAL:FieldSpec := DATE_FIELD{}
oDCDATAL:HyperLabel := HyperLabel{#DATAL,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_DATAL := FixedText{self,ResourceID{J02_SC_DATAL,_GetInst()}}
oDCSC_DATAL:HyperLabel := HyperLabel{#SC_DATAL,"Data Laudo:",NULL_STRING,NULL_STRING}

oCCRB3 := RadioButton{self,ResourceID{J02_RB3,_GetInst()}}
oCCRB3:HyperLabel := HyperLabel{#RB3,"Rejeitado",NULL_STRING,NULL_STRING}

oCCRB2 := RadioButton{self,ResourceID{J02_RB2,_GetInst()}}
oCCRB2:HyperLabel := HyperLabel{#RB2,"Aprovado Condicional",NULL_STRING,NULL_STRING}

oCCRB1 := RadioButton{self,ResourceID{J02_RB1,_GetInst()}}
oCCRB1:HyperLabel := HyperLabel{#RB1,"Aprovado",NULL_STRING,NULL_STRING}

oDCCARGO := SingleLineEdit{self,ResourceID{J02_CARGO,_GetInst()}}
oDCCARGO:FieldSpec := PADRAO_CHAR_40{}
oDCCARGO:HyperLabel := HyperLabel{#CARGO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText14 := FixedText{self,ResourceID{J02_THEFIXEDTEXT14,_GetInst()}}
oDCtheFixedText14:HyperLabel := HyperLabel{#theFixedText14,"Cargo:",NULL_STRING,NULL_STRING}

oDCtheFixedText13 := FixedText{self,ResourceID{J02_THEFIXEDTEXT13,_GetInst()}}
oDCtheFixedText13:HyperLabel := HyperLabel{#theFixedText13,"Responsável:",NULL_STRING,NULL_STRING}

oDCRESPO := SingleLineEdit{self,ResourceID{J02_RESPO,_GetInst()}}
oDCRESPO:FieldSpec := PADRAO_CHAR_40{}
oDCRESPO:HyperLabel := HyperLabel{#RESPO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCAREA := combobox{self,ResourceID{J02_AREA,_GetInst()}}
oDCAREA:FieldSpec := PADRAO_CHAR_02{}
oDCAREA:HyperLabel := HyperLabel{#AREA,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{self,ResourceID{J02_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{J02_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}

oDCLAUDOF := RadioButtonGroup{self,ResourceID{J02_LAUDOF,_GetInst()}}
oDCLAUDOF:FillUsing({ ;
						{oCCRB3,"R"}, ;
						{oCCRB2,"C"}, ;
						{oCCRB1,"A"} ;
						})
oDCLAUDOF:HyperLabel := HyperLabel{#LAUDOF,"Laudo Final",NULL_STRING,NULL_STRING}
oDCLAUDOF:FieldSpec := PADRAO_CHAR_01{}

self:Caption := "Laudo"
self:HyperLabel := HyperLabel{#J02,"Laudo",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access LAUDOF() 
return self:FieldGet(#LAUDOF)


assign LAUDOF(uValue) 
self:FieldPut(#LAUDOF, uValue)
return LAUDOF := uValue


METHOD ListBoxSelect(oControlEvent) 
	LOCAL oControl AS Control
	//LOCAL uValue AS USUAL
	LOCAL aRESP AS ARRAY
	oControl := IIf(oControlEvent == NULL_OBJECT, NULL_OBJECT, oControlEvent:Control)
	SUPER:ListBoxSelect(oControlEvent)
	//Put your changes here
    DO CASE
       CASE oCONTROL:NAMESYM==#AREA
            aRESP:=PEGMP05(SELF:SERVER:AREA,ZCURINI,ZCURDIR)
            IF aRESP[1]=.T.
              SELF:SERVER:RESPO:=aRESP[2]
              SELF:SERVER:CARGO:=aRESP[3]
           ENDIF
	ENDCASE
	RETURN NIL




METHOD OK( ) 
	SELF:EndWINDOW()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	 SELF:oDCAREA:FillUsing(ZMP05)
	RETURN NIL


access RESPO() 
return self:FieldGet(#RESPO)


assign RESPO(uValue) 
self:FieldPut(#RESPO, uValue)
return RESPO := uValue


END CLASS
