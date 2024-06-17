#region DEFINES
STATIC DEFINE JCICIMP_CANCELAR := 101 
STATIC DEFINE JCICIMP_IMPORTAR := 102 
STATIC DEFINE JCICIMP_THEFIXEDTEXT1 := 100 
#endregion

class JCICIMP inherit DIALOGWINDOW 

	protect oDCtheFixedText1 as FIXEDTEXT
	protect oCCcancelar as PUSHBUTTON
	protect oCCImportar as PUSHBUTTON

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD cancelar() 
self:enddialog()

METHOD Importar() 
LOCAL oMS01,oCIC AS USEREDE
LOCAL aDAD AS ARRAY
aDAD:={ZCURINI,"MS01.DBF",ZCURDIR}
oMS01:=USEREDE{aDAD}
IF oMS01:nERRO#0
   alert("Erro ao Abrir Cadastro de Produtos")
   SELF:EndDialog()
ENDIF
aDAD:={zCURINI,"CIC.DBF",zCURDIR}
oCIC:=USEREDE{aDAD}
IF oCIC:nERRO#0
    oMS01:CLOSE()
    alert("Erro ao Abrir Cadastro de Produtos para CI")
    SELF:EndDialog()
ENDIF
SELF:POINTER:=POINTER{POINTERHOURGLASS}
oMS01:GOTOP()
WHILE ! oMS01:EOF
     oCIC:gotop()
     IF ! oCIC:SEEK(oMS01:FIELDGET("CODIGO"))
        oCIC:APPEND()
        oCIC:FIELDPUT("DESENHO",oMS01:FIELDGET("CODIGO"))
        oCIC:FIELDPUT("DESCRI",oMS01:FIELDGET("NOME"))
        oCIC:FIELDPUT("CLIENTE",oMS01:FIELDGET("FORNECEDO"))
    ENDIF
    oMS01:skip()
ENDDO
oCIC:close()
oMS01:close()
SELF:POINTER:=POINTER{POINTERARROW}
SELF:EndDialog()

CONSTRUCTOR(oParent,uExtra)  
local dim aFonts[1] AS OBJECT

self:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"JCICIMP",_GetInst()},TRUE)

aFonts[1] := Font{,14,"MS Sans Serif"}
aFonts[1]:Bold := TRUE

oDCtheFixedText1 := FixedText{self,ResourceID{JCICIMP_THEFIXEDTEXT1,_GetInst()}}
oDCtheFixedText1:HyperLabel := HyperLabel{#theFixedText1,"Importar Produtos Final",NULL_STRING,NULL_STRING}
oDCtheFixedText1:Font(aFonts[1], FALSE)

oCCcancelar := PushButton{self,ResourceID{JCICIMP_CANCELAR,_GetInst()}}
oCCcancelar:HyperLabel := HyperLabel{#cancelar,_chr(38)+"Cancelar",NULL_STRING,NULL_STRING}

oCCImportar := PushButton{self,ResourceID{JCICIMP_IMPORTAR,_GetInst()}}
oCCImportar:HyperLabel := HyperLabel{#Importar,_chr(38)+"Importar",NULL_STRING,NULL_STRING}

self:Caption := "Importaçao de Produto Final"
self:HyperLabel := HyperLabel{#JCICIMP,"Importaçao de Produto Final",NULL_STRING,NULL_STRING}

self:PostInit(oParent,uExtra)

return self


METHOD PostInit(oParent,uExtra) 
	//Put your PostInit additions here
	FabCenterWindow( SELF )
	RETURN NIL


END CLASS
