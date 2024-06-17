#region DEFINES
STATIC DEFINE CRMBUSCA_SC_OBS := 100 
STATIC DEFINE JQUALFUNC_CANCELAR := 101 
STATIC DEFINE JQUALFUNC_CHECKCPF := 111 
STATIC DEFINE JQUALFUNC_CHECKPIS := 109 
STATIC DEFINE JQUALFUNC_CPF := 112 
STATIC DEFINE JQUALFUNC_FIXEDTEXT3 := 104 
STATIC DEFINE JQUALFUNC_NASC := 105 
STATIC DEFINE JQUALFUNC_NOME := 107 
STATIC DEFINE JQUALFUNC_OK := 103 
STATIC DEFINE JQUALFUNC_PIS := 110 
STATIC DEFINE JQUALFUNC_SC_FONE1 := 106 
STATIC DEFINE JQUALFUNC_SC_NOME := 108 
STATIC DEFINE JQUALFUNC_THEFIXEDTEXT10 := 102 
STATIC DEFINE JQUALFUNC_THEFIXEDTEXT9 := 100 
#endregion

CLASS jqualfunc INHERIT DIALOGWINDOW 

	PROTECT oDCtheFixedText9 AS FIXEDTEXT
	PROTECT oCCCancelar AS PUSHBUTTON
	PROTECT oDCtheFixedText10 AS FIXEDTEXT
	PROTECT oCCOK AS PUSHBUTTON
	PROTECT oDCFixedText3 AS Hyperlink
	PROTECT oDCNASC AS SINGLELINEEDIT
	PROTECT oDCSC_FONE1 AS FIXEDTEXT
	PROTECT oDCNOME AS SINGLELINEEDIT
	PROTECT oDCSC_NOME AS FIXEDTEXT
	PROTECT oCCcheckPIS AS PUSHBUTTON
	PROTECT oDCPIS AS RIGHTSLE
	PROTECT oCCcheckcPF AS PUSHBUTTON
	PROTECT oDCcpf AS RIGHTSLE

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)


  EXPORT cNOME AS STRING
  EXPORT cCPF AS STRING
  EXPORT cPIS AS STRING
  EXPORT dNASC
  EXPORT lOK:=.F. AS LOGIC


METHOD Cancelar( ) 
	lok:=.f.
	SELF:EndDialog()

METHOD checkcPF( ) 
	Valcpf(SELF:ODCCPF:TextValue,.T.)

METHOD checkPIS( ) 
	valpis(SELF:ODCPIS:TextValue,.T.)

CONSTRUCTOR(oParent,uExtra)  

SELF:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"jqualfunc",_GetInst()},TRUE)

oDCtheFixedText9 := FixedText{SELF,ResourceID{JQUALFUNC_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Retornar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{SELF,ResourceID{JQUALFUNC_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ICO_SAIR{}
oCCCancelar:TooltipText := "Clique aqui Para Cancelar"

oDCtheFixedText10 := FixedText{SELF,ResourceID{JQUALFUNC_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{SELF,ResourceID{JQUALFUNC_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ICO_OK{}
oCCOK:TooltipText := "Clique aqui Par Confirmar"

oDCFixedText3 := Hyperlink{SELF,ResourceID{JQUALFUNC_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Qualificacao Cadastral (duplo click mouse)","http://esocial.dataprev.gov.br/Esocial/pages/index.xhtml",NULL_STRING}

oDCNASC := SingleLineEdit{SELF,ResourceID{JQUALFUNC_NASC,_GetInst()}}
oDCNASC:FieldSpec := DATE_FIELD{}
oDCNASC:HyperLabel := HyperLabel{#NASC,"Fone:",NULL_STRING,"RHSEL_FONE"}

oDCSC_FONE1 := FixedText{SELF,ResourceID{JQUALFUNC_SC_FONE1,_GetInst()}}
oDCSC_FONE1:HyperLabel := HyperLabel{#SC_FONE1,"Nascimento",NULL_STRING,NULL_STRING}

oDCNOME := SingleLineEdit{SELF,ResourceID{JQUALFUNC_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_40{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"RHSEL_NOME"}

oDCSC_NOME := FixedText{SELF,ResourceID{JQUALFUNC_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oCCcheckPIS := PushButton{SELF,ResourceID{JQUALFUNC_CHECKPIS,_GetInst()}}
oCCcheckPIS:HyperLabel := HyperLabel{#checkPIS,"Checar PIS",NULL_STRING,NULL_STRING}
oCCcheckPIS:TooltipText := "Checar PIS"

oDCPIS := rightSle{SELF,ResourceID{JQUALFUNC_PIS,_GetInst()}}
oDCPIS:HyperLabel := HyperLabel{#PIS,NULL_STRING,NULL_STRING,NULL_STRING}
oDCPIS:TooltipText := "Digite o Pis"
oDCPIS:FieldSpec := padrao_char_11{}

oCCcheckcPF := PushButton{SELF,ResourceID{JQUALFUNC_CHECKCPF,_GetInst()}}
oCCcheckcPF:HyperLabel := HyperLabel{#checkcPF,"Checar CPF",NULL_STRING,NULL_STRING}
oCCcheckcPF:TooltipText := "Checar CPF"

oDCcpf := rightSle{SELF,ResourceID{JQUALFUNC_CPF,_GetInst()}}
oDCcpf:HyperLabel := HyperLabel{#cpf,NULL_STRING,NULL_STRING,NULL_STRING}
oDCcpf:Picture := "999.999.999-99"
oDCcpf:TooltipText := "Digite o CPF"
oDCcpf:FieldSpec := padrao_char_14{}

SELF:Caption := "Localizar"
SELF:HyperLabel := HyperLabel{#jqualfunc,"Localizar",NULL_STRING,NULL_STRING}

SELF:PostInit(oParent,uExtra)

RETURN SELF


METHOD Ok(oOWNER ) 
//LOCAL oERRO AS ERRORBOX	
LOCAL dDATA AS DATE
cNOME:=SELF:oDCNOME:TextValue
cCPF:=SELF:oDCCPF:TextValue
cPIS:=SELF:oDCPIS:TextValue
dNASC:=SELF:oDCNASC:TextValue
cNOME:=Upper(cNOME)

lOK:=.F.
IF .not.  Valcpf(cCPF,.T.)
   RETURN .F.	
ENDIF
IF ! Empty(cPIS)
   IF .not. valpis(cPIS,.T.)
   	  RETURN .F.
   ENDIF
ELSE
   IF ! MDG("PIS em branco 1o. Emprego")	
   	  RETURN  .F.
   ENDIF
ENDIF
IF Empty(Cnome)
   alert("Nome nao Preenchido")
   RETURN .F.
ENDIF
dDATA:=CToD(dNASC)
IF Empty(dDATA)
   alert("Data nao prenchida" )
   RETURN .F.	
ENDIF	
lOK:=.T.
//IF ! IsNil(SELF:oDCNOME)	
//	cBUSCA:=AllTrim(oDCNOME)
//	lOK:=.T.
//ELSE
//   IF lMES
//   	oERRO:=ERRORBOX{oOWNER,"Não Preenchido"}
//   	oERRO:Show()
//   	lOK:=.F.
//   ENDIF	
//ENDIF	
SELF:EndDialog()	
	



METHOD PostInit(oParent,uExtra) 
	//Put your PostInit additions here
	 FabCenterWindow( SELF )
	RETURN NIL


END CLASS
