#region DEFINES
STATIC DEFINE CINEW_CCODIGO := 103 
STATIC DEFINE CINEW_CMD01 := 106 
STATIC DEFINE CINEW_CMD02 := 105 
STATIC DEFINE CINEW_ESCCOD := 100 
STATIC DEFINE CINEW_FOTO := 102 
STATIC DEFINE CINEW_SC_DESTINO2 := 101 
STATIC DEFINE CINEW_TEXT1 := 104 
#endregion

class CINEW inherit DIALOGWINDOW 

	protect oCCesccod as PUSHBUTTON
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oDCcCODIGO as SINGLELINEEDIT
	protect oDCText1 as FIXEDTEXT
	protect oCCcmd02 as PUSHBUTTON
	protect oCCcmd01 as PUSHBUTTON

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)
	
	EXPORT lOK AS LOGIC
	EXPORT cCODIGO AS STRING

METHOD cmd01() 
lOK := .F.
IF IsNil(SELF:oDCcCODIGO:VALUE)
   cCODIGO:=""
ELSE
    cCODIGO:=SELF:oDCcCODIGO:VALUE
ENDIF
IF ! IsString(cCODIGO)
    cCODIGO:=""
ELSE
    cCODIGO:=AllTrim(cCODIGO)
ENDIF
IF Empty(cCODIGO)
   alert("Codigo da do Produto Não Preenchido")
    SELF:EndDialog()
ENDIF
lOK:=.T.
SELF:EndDialog()

METHOD cmd02() 
lOK:=.F.
cCODIGO:=""
self:enddialog()


METHOD esccod( ) 
LOCAL oESC AS XESCCOD	
oESC:=XESCCOD{SELF,"MS01.DBF"}
oESC:SHOW()	
IF oESC:LOK
   SELF:oDCcCODIGO:TEXTVALUE:=oESC:CODIGO
//    SELF:SERVER:FIELDPUT("DESCRI",oESC:NOME)
ENDIF		

METHOD foto( ) 
LOCAL oFOTOVIEW AS fotoview	
LOCAL cCODIGO AS STRING
cCODIGO:=TIRAOUT(StrTran(AllTrim(SELF:oDCCCODIGO:TextValue)," ",""))
IF Empty(cCODIGO)	
   alert("Codigo Produto Nao Preenchido")	
   RETU
ENDIF	
OFOTOVIEW:=fotoview{SELF,ZDIRFOTO+cCODIGO+".JPG"}
OFOTOVIEW:SHOW()

CONSTRUCTOR(oParent,uExtra)  

self:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"CINEW",_GetInst()},TRUE)

oCCesccod := PushButton{self,ResourceID{CINEW_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{CINEW_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{CINEW_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oDCcCODIGO := SingleLineEdit{self,ResourceID{CINEW_CCODIGO,_GetInst()}}
oDCcCODIGO:HyperLabel := HyperLabel{#cCODIGO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCText1 := FixedText{self,ResourceID{CINEW_TEXT1,_GetInst()}}
oDCText1:HyperLabel := HyperLabel{#Text1,"Digite o Codigo do Produto",NULL_STRING,NULL_STRING}

oCCcmd02 := PushButton{self,ResourceID{CINEW_CMD02,_GetInst()}}
oCCcmd02:HyperLabel := HyperLabel{#cmd02,"Cancelar",NULL_STRING,NULL_STRING}

oCCcmd01 := PushButton{self,ResourceID{CINEW_CMD01,_GetInst()}}
oCCcmd01:HyperLabel := HyperLabel{#cmd01,"Ok",NULL_STRING,NULL_STRING}

self:Caption := "Digite o Codigo do Produto:"
self:HyperLabel := HyperLabel{#CINEW,"Digite o Codigo do Produto:",NULL_STRING,NULL_STRING}

self:PostInit(oParent,uExtra)

return self


METHOD PostInit(oParent,uExtra) 
	//Put your PostInit additions here
	FabCenterWindow( SELF )
	RETURN NIL


END CLASS
