#region DEFINES
STATIC DEFINE JCAL_APAGAR := 111 
STATIC DEFINE JCAL_CALIBRAR := 104 
STATIC DEFINE JCAL_CALPRO := 100 
STATIC DEFINE JCAL_CALULT := 102 
STATIC DEFINE JCAL_DATAEXT := 108 
STATIC DEFINE JCAL_OK := 107 
STATIC DEFINE JCAL_SC_CALIBRAR1 := 105 
STATIC DEFINE JCAL_SC_CALIBRAR2 := 109 
STATIC DEFINE JCAL_SC_CALPRO := 101 
STATIC DEFINE JCAL_SC_CALULT := 103 
STATIC DEFINE JCAL_THEFIXEDTEXT10 := 106 
STATIC DEFINE JCAL_ULTANO := 110 
#endregion

class JCAL inherit DATADIALOG 

	protect oDCCALPRO as SINGLELINEEDIT
	protect oDCSC_CALPRO as FIXEDTEXT
	protect oDCCALULT as DATETIMEPICKER
	protect oDCSC_CALULT as FIXEDTEXT
	protect oDCCALIBRAR as SINGLELINEEDIT
	protect oDCSC_CALIBRAR1 as FIXEDTEXT
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
	protect oDCDATAEXT as DATESLE
	protect oDCSC_CALIBRAR2 as FIXEDTEXT
	protect oCCultano as PUSHBUTTON
	protect oCCApagar as PUSHBUTTON
// 	instance CALPRO 
// 	instance CALIBRAR 
// 	instance DATAEXT 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Apagar( ) 
	SELF:server:FIELDPUT("dataext",CToD(Space(8)))

access CALIBRAR() 
return self:FieldGet(#CALIBRAR)


assign CALIBRAR(uValue) 
self:FieldPut(#CALIBRAR, uValue)
return CALIBRAR := uValue


access CALPRO() 
return self:FieldGet(#CALPRO)


assign CALPRO(uValue) 
self:FieldPut(#CALPRO, uValue)
return CALPRO := uValue


access DATAEXT() 
return self:FieldGet(#DATAEXT)


assign DATAEXT(uValue) 
self:FieldPut(#DATAEXT, uValue)
return DATAEXT := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCAL",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCCALPRO := SingleLineEdit{self,ResourceID{JCAL_CALPRO,_GetInst()}}
oDCCALPRO:FieldSpec := DATE_FIELD{}
oDCCALPRO:HyperLabel := HyperLabel{#CALPRO,"Calpro:",NULL_STRING,"ME04_CALPRO"}
oDCCALPRO:BackGround := aBrushes[1]
oDCCALPRO:Font(aFonts[1], FALSE)

oDCSC_CALPRO := FixedText{self,ResourceID{JCAL_SC_CALPRO,_GetInst()}}
oDCSC_CALPRO:HyperLabel := HyperLabel{#SC_CALPRO,"Próxima",NULL_STRING,NULL_STRING}

oDCCALULT := DateTimePicker{self,ResourceID{JCAL_CALULT,_GetInst()}}
oDCCALULT:FieldSpec := DATE_FIELD{}
oDCCALULT:HyperLabel := HyperLabel{#CALULT,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSC_CALULT := FixedText{self,ResourceID{JCAL_SC_CALULT,_GetInst()}}
oDCSC_CALULT:HyperLabel := HyperLabel{#SC_CALULT,"Ultima","Data da Ultima Calibração",NULL_STRING}

oDCCALIBRAR := SingleLineEdit{self,ResourceID{JCAL_CALIBRAR,_GetInst()}}
oDCCALIBRAR:FieldSpec := PADRAO_NUM_03{}
oDCCALIBRAR:HyperLabel := HyperLabel{#CALIBRAR,"Calibrar:",NULL_STRING,"ME04_CALIBRAR"}

oDCSC_CALIBRAR1 := FixedText{self,ResourceID{JCAL_SC_CALIBRAR1,_GetInst()}}
oDCSC_CALIBRAR1:HyperLabel := HyperLabel{#SC_CALIBRAR1,"Meses",NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{self,ResourceID{JCAL_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{JCAL_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}

oDCDATAEXT := DateSle{self,ResourceID{JCAL_DATAEXT,_GetInst()}}
oDCDATAEXT:FieldSpec := DATE_FIELD{}
oDCDATAEXT:HyperLabel := HyperLabel{#DATAEXT,"Calibrar:",NULL_STRING,"ME04_CALIBRAR"}

oDCSC_CALIBRAR2 := FixedText{self,ResourceID{JCAL_SC_CALIBRAR2,_GetInst()}}
oDCSC_CALIBRAR2:HyperLabel := HyperLabel{#SC_CALIBRAR2,"Data Extensão",NULL_STRING,NULL_STRING}

oCCultano := PushButton{self,ResourceID{JCAL_ULTANO,_GetInst()}}
oCCultano:HyperLabel := HyperLabel{#ultano,"Ultimo Dia Ano",NULL_STRING,NULL_STRING}

oCCApagar := PushButton{self,ResourceID{JCAL_APAGAR,_GetInst()}}
oCCApagar:HyperLabel := HyperLabel{#Apagar,"Apagar",NULL_STRING,NULL_STRING}

self:Caption := "Calibração"
self:HyperLabel := HyperLabel{#JCAL,"Calibração",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD OK( ) 
	SELF:SERVER:CALPRO:=ADDMES(SELF:SERVER:CALULT,SELF:SERVER:CALIBRAR)
	SELF:ENDWINDOW()

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
	    FabCenterWindow( SELF )
	RETURN NIL


METHOD ultano( ) 
	SELF:server:FIELDPUT("DATAEXT",CToD("31/12/"+StrZero(Year(Today()),4)))

END CLASS
