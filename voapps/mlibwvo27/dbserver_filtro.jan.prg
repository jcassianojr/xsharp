#region DEFINES
STATIC DEFINE JFILTRO_ARQUIVO := 100 
STATIC DEFINE JFILTRO_CAMDEC := 112 
STATIC DEFINE JFILTRO_CAMPO := 109 
STATIC DEFINE JFILTRO_CAMSIZ := 111 
STATIC DEFINE JFILTRO_CAMTIP := 110 
STATIC DEFINE JFILTRO_CANCELAR := 118 
STATIC DEFINE JFILTRO_CMDCONTEM := 129 
STATIC DEFINE JFILTRO_CMDDIFERENTE := 128 
STATIC DEFINE JFILTRO_CMDEXATO := 125 
STATIC DEFINE JFILTRO_CMDIGUAL := 124 
STATIC DEFINE JFILTRO_CMDMAIOR := 127 
STATIC DEFINE JFILTRO_CMDMAIORIGUAL := 126 
STATIC DEFINE JFILTRO_CMDMANUAL := 120 
STATIC DEFINE JFILTRO_CMDMENOR := 122 
STATIC DEFINE JFILTRO_CMDMENORIGUAL := 123 
STATIC DEFINE JFILTRO_CMDTIPO := 114 
STATIC DEFINE JFILTRO_CMDZERAR := 121 
STATIC DEFINE JFILTRO_COPER := 119 
STATIC DEFINE JFILTRO_CTIPO := 113 
STATIC DEFINE JFILTRO_FILTRAR := 131 
STATIC DEFINE JFILTRO_FILTRO := 102 
STATIC DEFINE JFILTRO_FIXEDTEXT1 := 101 
STATIC DEFINE JFILTRO_FIXEDTEXT2 := 103 
STATIC DEFINE JFILTRO_FIXEDTEXT3 := 105 
STATIC DEFINE JFILTRO_FIXEDTEXT4 := 107 
STATIC DEFINE JFILTRO_GRID := 108 
STATIC DEFINE JFILTRO_OK := 116 
STATIC DEFINE JFILTRO_THEFIXEDTEXT10 := 115 
STATIC DEFINE JFILTRO_THEFIXEDTEXT9 := 117 
STATIC DEFINE JFILTRO_TXTFILTRAR := 130 
STATIC DEFINE JFILTRO_VALFIM := 106 
STATIC DEFINE JFILTRO_VALINI := 104 
#endregion

CLASS jfiltro INHERIT DATADIALOG 

	PROTECT oDCarquivo AS SINGLELINEEDIT
	PROTECT oDCFixedText1 AS FIXEDTEXT
	PROTECT oDCfiltro AS MULTILINEEDIT
	PROTECT oDCFixedText2 AS FIXEDTEXT
	PROTECT oDCVALINI AS SINGLELINEEDIT
	PROTECT oDCFixedText3 AS FIXEDTEXT
	PROTECT oDCVALFIM AS SINGLELINEEDIT
	PROTECT oDCFixedText4 AS FIXEDTEXT
	PROTECT oDCGRID AS LISTBOX
	PROTECT oDCCAMPO AS SINGLELINEEDIT
	PROTECT oDCCAMTIP AS SINGLELINEEDIT
	PROTECT oDCCAMSIZ AS SINGLELINEEDIT
	PROTECT oDCCAMDEC AS SINGLELINEEDIT
	PROTECT oDCCTIPO AS SINGLELINEEDIT
	PROTECT oCCCmdtipo AS PUSHBUTTON
	PROTECT oDCtheFixedText10 AS FIXEDTEXT
	PROTECT oCCOK AS PUSHBUTTON
	PROTECT oDCtheFixedText9 AS FIXEDTEXT
	PROTECT oCCCancelar AS PUSHBUTTON
	PROTECT oDCCOPER AS SINGLELINEEDIT
	PROTECT oCCcmdmanual AS PUSHBUTTON
	PROTECT oCCcmdzerar AS PUSHBUTTON
	PROTECT oCCcmdmenor AS PUSHBUTTON
	PROTECT oCCcmdmenorigual AS PUSHBUTTON
	PROTECT oCCcmdigual AS PUSHBUTTON
	PROTECT oCCcmdexato AS PUSHBUTTON
	PROTECT oCCcmdmaiorigual AS PUSHBUTTON
	PROTECT oCCcmdmaior AS PUSHBUTTON
	PROTECT oCCcmddiferente AS PUSHBUTTON
	PROTECT oCCcmdcontem AS PUSHBUTTON
	PROTECT oDCtxtfiltrar AS FIXEDTEXT
	PROTECT oCCfiltrar AS PUSHBUTTON
// 	instance arquivo 
// 	instance filtro 
// 	instance VALINI 
// 	instance VALFIM 
// 	instance GRID 
// 	instance CAMPO 
// 	instance CAMTIP 
// 	instance CAMSIZ 
// 	instance CAMDEC 
// 	instance CTIPO 
// 	instance COPER 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

ACCESS arquivo() 
RETURN SELF:FieldGet(#arquivo)


ASSIGN arquivo(uValue) 
SELF:FieldPut(#arquivo, uValue)
RETURN arquivo := uValue


ACCESS CAMDEC() 
RETURN SELF:FieldGet(#CAMDEC)


ASSIGN CAMDEC(uValue) 
SELF:FieldPut(#CAMDEC, uValue)
RETURN CAMDEC := uValue


ACCESS CAMPO() 
RETURN SELF:FieldGet(#CAMPO)


ASSIGN CAMPO(uValue) 
SELF:FieldPut(#CAMPO, uValue)
RETURN CAMPO := uValue


ACCESS CAMSIZ() 
RETURN SELF:FieldGet(#CAMSIZ)


ASSIGN CAMSIZ(uValue) 
SELF:FieldPut(#CAMSIZ, uValue)
RETURN CAMSIZ := uValue


ACCESS CAMTIP() 
RETURN SELF:FieldGet(#CAMTIP)


ASSIGN CAMTIP(uValue) 
SELF:FieldPut(#CAMTIP, uValue)
RETURN CAMTIP := uValue


METHOD cmdcontem( ) 
		SELF:oDCCOPER:TextValue:="$"

METHOD cmddiferente( ) 
		SELF:oDCCOPER:TextValue:="#"

METHOD cmdexato( ) 
		SELF:oDCCOPER:TextValue:="=="

METHOD cmdigual( ) 
		SELF:oDCCOPER:TextValue:="="

METHOD cmdmaior( ) 
		SELF:oDCCOPER:TextValue:=">"

METHOD cmdmaiorigual( ) 
		SELF:oDCCOPER:TextValue:=">="

METHOD cmdmanual( ) 
	SELF:oDCfiltro:Enable()
	SELF:oDCCTIPO:TextValue:="E"
	SELF:oCCOK:Enable()
	SELF:oDCGRID:Disable()

METHOD cmdmenor( ) 
	SELF:oDCCOPER:TextValue:="<"

METHOD cmdmenorigual( ) 
		SELF:oDCCOPER:TextValue:="<="

METHOD Cmdtipo( ) 
LOCAL cVAR AS STRING
cVAR:=SELF:oDCCTIPO:TextValue	
SELF:oDCCTIPO:TextValue:=SIMNAO(CvAR,{"E","O","B"})


METHOD cmdzerar( ) 
	SELF:oDCfiltro:TextValue:=""

ACCESS COPER() 
RETURN SELF:FieldGet(#COPER)


ASSIGN COPER(uValue) 
SELF:FieldPut(#COPER, uValue)
RETURN COPER := uValue


ACCESS CTIPO() 
RETURN SELF:FieldGet(#CTIPO)


ASSIGN CTIPO(uValue) 
SELF:FieldPut(#CTIPO, uValue)
RETURN CTIPO := uValue


ACCESS filtro() 
RETURN SELF:FieldGet(#filtro)


ASSIGN filtro(uValue) 
SELF:FieldPut(#filtro, uValue)
RETURN filtro := uValue


ACCESS GRID() 
RETURN SELF:FieldGet(#GRID)


ASSIGN GRID(uValue) 
SELF:FieldPut(#GRID, uValue)
RETURN GRID := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

SELF:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jfiltro",_GetInst()},iCtlID)

oDCarquivo := SingleLineEdit{SELF,ResourceID{JFILTRO_ARQUIVO,_GetInst()}}
oDCarquivo:HyperLabel := HyperLabel{#arquivo,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText1 := FixedText{SELF,ResourceID{JFILTRO_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Arquivo",NULL_STRING,NULL_STRING}

oDCfiltro := MultiLineEdit{SELF,ResourceID{JFILTRO_FILTRO,_GetInst()}}
oDCfiltro:HyperLabel := HyperLabel{#filtro,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText2 := FixedText{SELF,ResourceID{JFILTRO_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Filtro",NULL_STRING,NULL_STRING}

oDCVALINI := SingleLineEdit{SELF,ResourceID{JFILTRO_VALINI,_GetInst()}}
oDCVALINI:HyperLabel := HyperLabel{#VALINI,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText3 := FixedText{SELF,ResourceID{JFILTRO_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"DO",NULL_STRING,NULL_STRING}

oDCVALFIM := SingleLineEdit{SELF,ResourceID{JFILTRO_VALFIM,_GetInst()}}
oDCVALFIM:HyperLabel := HyperLabel{#VALFIM,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText4 := FixedText{SELF,ResourceID{JFILTRO_FIXEDTEXT4,_GetInst()}}
oDCFixedText4:HyperLabel := HyperLabel{#FixedText4,"AO",NULL_STRING,NULL_STRING}

oDCGRID := ListBox{SELF,ResourceID{JFILTRO_GRID,_GetInst()}}
oDCGRID:HyperLabel := HyperLabel{#GRID,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCAMPO := SingleLineEdit{SELF,ResourceID{JFILTRO_CAMPO,_GetInst()}}
oDCCAMPO:HyperLabel := HyperLabel{#CAMPO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCAMTIP := SingleLineEdit{SELF,ResourceID{JFILTRO_CAMTIP,_GetInst()}}
oDCCAMTIP:HyperLabel := HyperLabel{#CAMTIP,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCAMSIZ := SingleLineEdit{SELF,ResourceID{JFILTRO_CAMSIZ,_GetInst()}}
oDCCAMSIZ:HyperLabel := HyperLabel{#CAMSIZ,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCAMDEC := SingleLineEdit{SELF,ResourceID{JFILTRO_CAMDEC,_GetInst()}}
oDCCAMDEC:HyperLabel := HyperLabel{#CAMDEC,NULL_STRING,NULL_STRING,NULL_STRING}

oDCCTIPO := SingleLineEdit{SELF,ResourceID{JFILTRO_CTIPO,_GetInst()}}
oDCCTIPO:HyperLabel := HyperLabel{#CTIPO,"E",NULL_STRING,NULL_STRING}

oCCCmdtipo := PushButton{SELF,ResourceID{JFILTRO_CMDTIPO,_GetInst()}}
oCCCmdtipo:HyperLabel := HyperLabel{#Cmdtipo,"(E) (O)u (B)ranco",NULL_STRING,NULL_STRING}

oDCtheFixedText10 := FixedText{SELF,ResourceID{JFILTRO_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"OK",NULL_STRING,NULL_STRING}

oCCOK := PushButton{SELF,ResourceID{JFILTRO_OK,_GetInst()}}
oCCOK:HyperLabel := HyperLabel{#OK,NULL_STRING,NULL_STRING,NULL_STRING}
oCCOK:Image := ico_ok{}
oCCOK:TooltipText := "Clique aqui Par Confirmar"

oDCtheFixedText9 := FixedText{SELF,ResourceID{JFILTRO_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Encerrar",NULL_STRING,NULL_STRING}

oCCCancelar := PushButton{SELF,ResourceID{JFILTRO_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCCancelar:Image := ico_sair{}
oCCCancelar:TooltipText := "Clique aqui Para Cancelar"

oDCCOPER := SingleLineEdit{SELF,ResourceID{JFILTRO_COPER,_GetInst()}}
oDCCOPER:HyperLabel := HyperLabel{#COPER,">=",NULL_STRING,NULL_STRING}

oCCcmdmanual := PushButton{SELF,ResourceID{JFILTRO_CMDMANUAL,_GetInst()}}
oCCcmdmanual:HyperLabel := HyperLabel{#cmdmanual,"Manual",NULL_STRING,NULL_STRING}

oCCcmdzerar := PushButton{SELF,ResourceID{JFILTRO_CMDZERAR,_GetInst()}}
oCCcmdzerar:HyperLabel := HyperLabel{#cmdzerar,"Zerar Filtro",NULL_STRING,NULL_STRING}

oCCcmdmenor := PushButton{SELF,ResourceID{JFILTRO_CMDMENOR,_GetInst()}}
oCCcmdmenor:HyperLabel := HyperLabel{#cmdmenor,"<",NULL_STRING,NULL_STRING}
oCCcmdmenor:TooltipText := "Menor"

oCCcmdmenorigual := PushButton{SELF,ResourceID{JFILTRO_CMDMENORIGUAL,_GetInst()}}
oCCcmdmenorigual:HyperLabel := HyperLabel{#cmdmenorigual,"<=",NULL_STRING,NULL_STRING}
oCCcmdmenorigual:TooltipText := "Menor Igual Que"

oCCcmdigual := PushButton{SELF,ResourceID{JFILTRO_CMDIGUAL,_GetInst()}}
oCCcmdigual:HyperLabel := HyperLabel{#cmdigual,"=",NULL_STRING,NULL_STRING}
oCCcmdigual:TooltipText := "Igual"

oCCcmdexato := PushButton{SELF,ResourceID{JFILTRO_CMDEXATO,_GetInst()}}
oCCcmdexato:HyperLabel := HyperLabel{#cmdexato,"==",NULL_STRING,NULL_STRING}
oCCcmdexato:TooltipText := "Exatamente Igual"

oCCcmdmaiorigual := PushButton{SELF,ResourceID{JFILTRO_CMDMAIORIGUAL,_GetInst()}}
oCCcmdmaiorigual:HyperLabel := HyperLabel{#cmdmaiorigual,"=>",NULL_STRING,NULL_STRING}
oCCcmdmaiorigual:TooltipText := "Maior Igual Que"

oCCcmdmaior := PushButton{SELF,ResourceID{JFILTRO_CMDMAIOR,_GetInst()}}
oCCcmdmaior:HyperLabel := HyperLabel{#cmdmaior,">",NULL_STRING,NULL_STRING}
oCCcmdmaior:TooltipText := "Maior que"

oCCcmddiferente := PushButton{SELF,ResourceID{JFILTRO_CMDDIFERENTE,_GetInst()}}
oCCcmddiferente:HyperLabel := HyperLabel{#cmddiferente,"#",NULL_STRING,NULL_STRING}
oCCcmddiferente:TooltipText := "Diferente"

oCCcmdcontem := PushButton{SELF,ResourceID{JFILTRO_CMDCONTEM,_GetInst()}}
oCCcmdcontem:HyperLabel := HyperLabel{#cmdcontem,"$",NULL_STRING,NULL_STRING}
oCCcmdcontem:TooltipText := "Contem o Dado"

oDCtxtfiltrar := FixedText{SELF,ResourceID{JFILTRO_TXTFILTRAR,_GetInst()}}
oDCtxtfiltrar:HyperLabel := HyperLabel{#txtfiltrar,"Filtrar",NULL_STRING,NULL_STRING}

oCCfiltrar := PushButton{SELF,ResourceID{JFILTRO_FILTRAR,_GetInst()}}
oCCfiltrar:HyperLabel := HyperLabel{#filtrar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfiltrar:Image := ico_filtro{}
oCCfiltrar:TooltipText := "Clique aqui Para Cancelar"

SELF:Caption := "DataDialog Caption"
SELF:HyperLabel := HyperLabel{#jfiltro,"DataDialog Caption",NULL_STRING,NULL_STRING}

IF !IsNil(oServer)
	SELF:Use(oServer)
ENDIF

SELF:PostInit(oWindow,iCtlID,oServer,uExtra)

RETURN SELF


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		    FabCenterWindow( SELF )
	RETURN NIL


ACCESS VALFIM() 
RETURN SELF:FieldGet(#VALFIM)


ASSIGN VALFIM(uValue) 
SELF:FieldPut(#VALFIM, uValue)
RETURN VALFIM := uValue


ACCESS VALINI() 
RETURN SELF:FieldGet(#VALINI)


ASSIGN VALINI(uValue) 
SELF:FieldPut(#VALINI, uValue)
RETURN VALINI := uValue


END CLASS
CLASS XJFILTRO INHERIT JFILTRO
	EXPORT cFILTRO AS STRING
	EXPORT lOK AS LOGIC
	EXPORT aFILTRO AS ARRAY

METHOD Cancelar() 
	cfiltro:=""
    lOK:=.F.
	SELF:endwindow()
	

METHOD FILTRAR( ) 
	cfiltro:=SELF:oDCfiltro:TextValue
	IF Len(cFILTRO)>0
	   lOK:=.T.
	ENDIF	
	SELF:endwindow()

CONSTRUCTOR(oOWNER,aESTRU) 
LOCAL aUSO AS ARRAY
LOCAL nLEN,X AS DWORD
//LOCAL oSERVER AS USEFOLHA
//cARQ:="FO_PES"
//oSERVER:=USEFOLHA{cARQ}
//IF oSERVER:nERRO#0
//    RETU SELF
//ENDIF
//aFILTRO:=oSERVER:DBSTRUCT
//oSERVER:CLOSE()	
nLEN:=Len(aESTRU)
aUSO:={}
FOR X := 1 TO  nLEN
	AAdd(aUSO,{PadR(aESTRU[X][1],15)+"-"+aESTRU[X][2]+"-"+Str(aESTRU[X][3],3)+"-"+Str(aESTRU[X][4],2),StrZero(X,3)})
NEXT X	
SUPER(oOWNER)	
aFILTRO:=aESTRU
SELF:oDCGRID:FillUsing(aUSO)
lOK:=FALSE
SELF:SHOW()

METHOD ListBoxSelect(oControlEvent) 
	//LOCAL oControl AS Control
	LOCAL nITEM AS DWORD
	 IIf(oControlEvent == NULL_OBJECT, NULL_OBJECT, oControlEvent:Control)    //oControl :=
	SUPER:ListBoxSelect(oControlEvent)
	//Put your changes here

	nITEM:=Val(SELF:oDCGRID:Value)	
	IF nITEM>0
       SELF:oDCVALFIM:Enable()	
       SELF:ODCVALINI:ENABLE()
       SELF:oCCCmdtipo:Enable()
	   SELF:oCCOK:Enable()
  	   SELF:oCCCmdmenor:enable()
  	   SELF:oCCCmdmenorigual:enable()
  	   SELF:oCCCmdigual:enable()
  	   SELF:oCCCmdexato:enable()
  	   SELF:oCCCmdmaiorigual:enable()
  	   SELF:oCCCmdmaior:enable()
  	   SELF:oCCCmddiferente:enable()
	   SELF:oDCCAMPO:TextValue:=SELF:aFILTRO[nITEM][1]
	   SELF:oDCCAMTIP:TextValue:=SELF:aFILTRO[nITEM][2]
  	   SELF:oDCCAMSIZ:TextValue:=Str(SELF:aFILTRO[nITEM][3],3)
	   SELF:oDCCAMDEC:TextValue:=Str(SELF:aFILTRO[nITEM][4],2)
       SELF:oDCGRID:Disable()	
       IF SELF:aFILTRO[nITEM][2]="C" .OR. SELF:aFILTRO[nITEM][2]="M"
   	      SELF:oCCCmdcontem:enable()
       ENDIF	
       IF SELF:aFILTRO[nITEM][2]="D"
    	  SELF:oDCVALFIM:TextValue:=DToC(Today())
    	  SELF:oDCVALINI:TextValue:=DToC(Today())
       ENDIF	
       IF SELF:aFILTRO[nITEM][2]="N"
    	  SELF:oDCVALFIM:TextValue:=StrZero(0,SELF:aFILTRO[nITEM][3],SELF:aFILTRO[nITEM][4])
    	  SELF:oDCVALINI:TextValue:=StrZero(0,SELF:aFILTRO[nITEM][3],SELF:aFILTRO[nITEM][4])
       ENDIF	
       SELF:oDCGRID:Disable()
       SELF:oCCcmdmanual:Disable()
    ENDIF
	RETURN NIL


METHOD OK( ) 
LOCAL DEFA AS DWORD
LOCAL XCTR1A,XCTR2A AS STRING
LOCAL xCTR1,xCTR2,XCTR3,XCTR4,XCTR5,XCTR6,FILTRO AS STRING

    SELF:oDCfiltro:DISABLE()
	SELF:ODCVALFIM:DISABLE()
	SELF:ODCVALINI:DISABLE()
	SELF:oCCCmdtipo:DISAble()
	SELF:oCCOK:DISAble()

	SELF:oCCCmdmenor:disable()
  	   SELF:oCCCmdmenorigual:disable()
  	   SELF:oCCCmdigual:disable()
  	   SELF:oCCCmdexato:disable()
  	   SELF:oCCCmdmaiorigual:disable()
  	   SELF:oCCCmdmaior:disable()
  	   SELF:oCCCmddiferente:disable()
  	   SELF:occcmdmenorigual:disable()
	
	SELF:oDCCAMPO:TextValue:=""
	SELF:oDCCAMTIP:TextValue:=""
	SELF:oDCCAMSIZ:TextValue:=""
	SELF:oDCCAMDEC:TextValue:=""
	SELF:oDCGRID:Enable()

  DEFA:=Val(SELF:oDCGRID:Value)	
  XCTR1:=SELF:ODCVALINI:TextValue
  XCTR2:=SELF:ODCVALFIM:TextValue
  XCTR3:=SELF:oDCCTIPO:TextValue
  XCTR5:=AllTrim(SELF:ODCCOPER:TextValue)
  IF XCTR5="="  .OR. XCTR5="<>"
  	 XCTR2:=""
  ENDIF	
  IF aFILTRO[ DEFA, 2 ] = "N"  .AND. Val(XCTR1)=0  .AND. XCTR3<>"B"
  	 XCTR1:=""
  ENDIF
  IF aFILTRO[ DEFA, 2 ] = "N"  .AND. Val(XCTR2)=0
  	 XCTR2:=""
  ENDIF
  FILTRO:=SELF:oDCFILTRO:TEXTVALUE

	
 DO CASE
   CASE aFILTRO[ DEFA, 2 ] = "C"
      XCTR1A := '"' + AllTrim( XCTR1 ) + '"'
      XCTR2A := '"' + AllTrim( XCTR2 ) + '"'
   CASE aFILTRO[ DEFA, 2 ] = "D"
      XCTR1A := 'CTOD(' + '"' +  XCTR1  + '"' + ')'
      XCTR2A := 'CTOD(' + '"' +  XCTR2  + '"' + ')'
   CASE aFILTRO[ DEFA, 2 ] = "N"
      XCTR1A := AllTrim( Str( Val(XCTR1), aFILTRO[ DEFA, 3 ], aFILTRO[ DEFA, 4 ] ) )
      XCTR2A := AllTrim( Str( Val(XCTR2), aFILTRO[ DEFA, 3 ], aFILTRO[ DEFA, 4 ] ) )
   ENDCASE
   IF !Empty( XCTR1 )  .or. !Empty( XCTR2 )  .or. XCTR3 = "B"
      XCTR4 := " .AND. "
      IF XCTR3 = "O"
         XCTR4 := " .OR. "
      ENDIF
      IF !Empty( XCTR2 )
         XCTR6 := "<="
         IF XCTR5 = "> "
            XCTR6 := "<"
         ENDIF
         FILTRO += IF( Empty( FILTRO ), "", XCTR4 ) + "(" + AllTrim( aFILTRO[ DEFA, 1 ] ) + XCTR5 + XCTR1A + ' .AND. ' + AllTrim( aFILTRO[ DEFA, 1 ] ) + XCTR6 + XCTR2A + ")"
      ELSE
         FILTRO += IF( Empty( FILTRO ), "", XCTR4 ) + "(" + AllTrim( aFILTRO[ DEFA, 1 ] ) + XCTR5 + XCTR1A + ")"
      ENDIF
   ENDIF	

    SELF:oDCVALFIM:TextValue:=""
  	SELF:oDCVALINI:TextValue:=""
	SELF:oDCfiltro:TextValue:=FILTRO
	SELF:oDCGRID:Enable()
	SELF:oCCcmdmanual:Enable()
	

METHOD PEGEST() 	
LOCAL aUSO AS ARRAY
LOCAL x AS DWORD
aUSO:={}
FOR X := 1 TO Len(aFILTRO)
	AAdd(aUSO,{aFILTRO[X][1],StrZero(X,3)})
NEXT X	
RETU aUSO


END CLASS
