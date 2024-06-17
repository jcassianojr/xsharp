#region DEFINES
STATIC DEFINE DIAPAD_CAMPO01 := 104 
STATIC DEFINE DIAPAD_CAMPO02 := 105 
STATIC DEFINE DIAPAD_CAMPO03 := 113 
STATIC DEFINE DIAPAD_CAMPO04 := 106 
STATIC DEFINE DIAPAD_CANCELAR := 110 
STATIC DEFINE DIAPAD_DFIM := 115 
STATIC DEFINE DIAPAD_DINI := 114 
STATIC DEFINE DIAPAD_ESCCOD := 111 
STATIC DEFINE DIAPAD_OK := 108 
STATIC DEFINE DIAPAD_PER := 102 
STATIC DEFINE DIAPAD_TEXTO01 := 100 
STATIC DEFINE DIAPAD_TEXTO02 := 101 
STATIC DEFINE DIAPAD_TEXTO03 := 112 
STATIC DEFINE DIAPAD_TEXTO04 := 103 
STATIC DEFINE DIAPAD_THEFIXEDTEXT10 := 107 
STATIC DEFINE DIAPAD_THEFIXEDTEXT9 := 109 
#endregion

class DiaPad inherit DATADIALOG 

	protect oDCtexto01 as FIXEDTEXT
	protect oDCtexto02 as FIXEDTEXT
	protect oDCper as FIXEDTEXT
	protect oDCtexto04 as FIXEDTEXT
	protect oDCcampo01 as SINGLELINEEDIT
	protect oDCcampo02 as SINGLELINEEDIT
	protect oDCcampo04 as SINGLELINEEDIT
	protect oDCtheFixedText10 as FIXEDTEXT
	protect oCCOK as PUSHBUTTON
	protect oDCtheFixedText9 as FIXEDTEXT
	protect oCCCancelar as PUSHBUTTON
	protect oCCesccod as PUSHBUTTON
	protect oDCtexto03 as FIXEDTEXT
	protect oDCcampo03 as SINGLELINEEDIT
	protect oDCDINI as DATESLE
	protect oDCDFIM as DATESLE
// 	instance campo01 
// 	instance campo02 
// 	instance campo04 
// 	instance campo03 
// 	instance DINI 
// 	instance DFIM 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access campo01() 
return self:FieldGet(#campo01)


assign campo01(uValue) 
self:FieldPut(#campo01, uValue)
return campo01 := uValue


access campo02() 
return self:FieldGet(#campo02)


assign campo02(uValue) 
self:FieldPut(#campo02, uValue)
return campo02 := uValue


access campo03() 
return self:FieldGet(#campo03)


assign campo03(uValue) 
self:FieldPut(#campo03, uValue)
return campo03 := uValue


access campo04() 
return self:FieldGet(#campo04)


assign campo04(uValue) 
self:FieldPut(#campo04, uValue)
return campo04 := uValue


access DFIM() 
return self:FieldGet(#DFIM)


assign DFIM(uValue) 
self:FieldPut(#DFIM, uValue)
return DFIM := uValue


access DINI() 
return self:FieldGet(#DINI)


assign DINI(uValue) 
self:FieldPut(#DINI, uValue)
return DINI := uValue


METHOD esccod( )  

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"DiaPad",_GetInst()},iCtlID)

oDCtexto01 := FixedText{self,ResourceID{DIAPAD_TEXTO01,_GetInst()}}
oDCtexto01:HyperLabel := HyperLabel{#texto01,"campo01",NULL_STRING,NULL_STRING}

oDCtexto02 := FixedText{self,ResourceID{DIAPAD_TEXTO02,_GetInst()}}
oDCtexto02:HyperLabel := HyperLabel{#texto02,"campo02",NULL_STRING,NULL_STRING}

oDCper := FixedText{self,ResourceID{DIAPAD_PER,_GetInst()}}
oDCper:HyperLabel := HyperLabel{#per,"Periodo",NULL_STRING,NULL_STRING}

oDCtexto04 := FixedText{self,ResourceID{DIAPAD_TEXTO04,_GetInst()}}
oDCtexto04:HyperLabel := HyperLabel{#texto04,"campo04",NULL_STRING,NULL_STRING}

oDCcampo01 := SingleLineEdit{self,ResourceID{DIAPAD_CAMPO01,_GetInst()}}
oDCcampo01:HyperLabel := HyperLabel{#campo01,NULL_STRING,NULL_STRING,NULL_STRING}

oDCcampo02 := SingleLineEdit{self,ResourceID{DIAPAD_CAMPO02,_GetInst()}}
oDCcampo02:HyperLabel := HyperLabel{#campo02,NULL_STRING,NULL_STRING,NULL_STRING}

oDCcampo04 := SingleLineEdit{self,ResourceID{DIAPAD_CAMPO04,_GetInst()}}
oDCcampo04:HyperLabel := HyperLabel{#campo04,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{self,ResourceID{DIAPAD_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{self,ResourceID{DIAPAD_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}
oCCOK:TooltipText := "Clique aqui Par Confirmar"

oDCtheFixedText9 := FixedText{self,ResourceID{DIAPAD_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{self,ResourceID{DIAPAD_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}
oCCCancelar:TooltipText := "Clique aqui Para Cancelar"

oCCesccod := PushButton{self,ResourceID{DIAPAD_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oDCtexto03 := FixedText{self,ResourceID{DIAPAD_TEXTO03,_GetInst()}}
oDCtexto03:HyperLabel := HyperLabel{#texto03,"campo03",NULL_STRING,NULL_STRING}

oDCcampo03 := SingleLineEdit{self,ResourceID{DIAPAD_CAMPO03,_GetInst()}}
oDCcampo03:HyperLabel := HyperLabel{#campo03,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDINI := DateSle{self,ResourceID{DIAPAD_DINI,_GetInst()}}
oDCDINI:FieldSpec := DATE_FIELD{}
oDCDINI:HyperLabel := HyperLabel{#DINI,NULL_STRING,NULL_STRING,NULL_STRING}

oDCDFIM := DateSle{self,ResourceID{DIAPAD_DFIM,_GetInst()}}
oDCDFIM:FieldSpec := DATE_FIELD{}
oDCDFIM:HyperLabel := HyperLabel{#DFIM,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Informaçoes"
self:HyperLabel := HyperLabel{#DiaPad,"Informaçoes",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD OK( )  

METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
 FabCenterWindow( SELF )	
	RETURN NIL


END CLASS
CLASS XDIAPAD INHERIT DIAPAD
EXPORT lOK AS LOGIC	
EXPORT VAL01,VAL02,VAL03,VAL04

METHOD Cancelar( ) 
	LOK:=.F.
	SELF:EndWindow()
	
	

CONSTRUCTOR(oOWNER,aTIT,aDIS) 
SUPER(oOWNER)
oDCtexto01:Caption:=aTIT[1]
oDCtexto02:Caption:=aTIT[2]
oDCtexto03:Caption:=aTIT[3]
odctexto04:Caption:=aTIT[4]
IF ValType(aDIS)="A"
   IF ! aDIS[1]
      SELF:oDCcampo01:DISABLE()	
   ENDIF
   IF ! aDIS[2]
      SELF:oDCcampo02:DISABLE()	
   ENDIF
   IF ! aDIS[3]
      SELF:oDCcampo03:DISABLE()	
      SELF:oCCesccod:DISABLE()
   ENDIF
   IF ! aDIS[4]
      SELF:oDCcampo04:DISABLE()	
   ENDIF
ENDIF	
lOK:=.F.

METHOD OK( ) 
	LOCAL aRETU AS ARRAY
	lOK:=.T.
	aRETU:=pegcomp()
 	dINI:=ARETU[1]
    dFIM:=ARETU[2]
    VAL01:=ODCCAMPO01:TEXTVALUE
    VAL02:=ODCCAMPO02:TEXTVALUE
    VAL03:=ODCCAMPO03:TEXTVALUE
    VAL04:=ODCCAMPO04:TEXTVALUE
	SELF:EndWindow()

END CLASS
CLASS YJFILTRO INHERIT XJFILTRO

CONSTRUCTOR(oOWNER,cARQ) 
LOCAL oSERVER AS USEFOLHA
LOCAL aFILTRO AS ARRAY
oSERVER:=USEFOLHA{cARQ}
IF oSERVER:nERRO#0
    RETU SELF
ENDIF
aFILTRO:=oSERVER:DBSTRUCT
oSERVER:CLOSE()	
SUPER(oOWNER,aFILTRO)	
SELF:SHOW()



END CLASS
