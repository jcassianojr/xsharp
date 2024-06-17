#region DEFINES
STATIC DEFINE JCMMACU_ANO := 102 
STATIC DEFINE JCMMACU_APURAR := 101 
STATIC DEFINE JCMMACU_CANCELAR := 100 
STATIC DEFINE JCMMACU_CMDMAIS := 109 
STATIC DEFINE JCMMACU_CMDMAIS2 := 107 
STATIC DEFINE JCMMACU_CMDMENOS := 108 
STATIC DEFINE JCMMACU_CMDMENOS2 := 106 
STATIC DEFINE JCMMACU_DATAFINAL := 113 
STATIC DEFINE JCMMACU_DATAINICIAL := 112 
STATIC DEFINE JCMMACU_DATAUSO := 110 
STATIC DEFINE JCMMACU_FIXEDTEXT1 := 105 
STATIC DEFINE JCMMACU_FIXEDTEXT2 := 103 
STATIC DEFINE JCMMACU_MES := 104 
STATIC DEFINE JCMMACU_RADIOBUTTON1 := 111 
#endregion

class jcmmacu inherit DIALOGWINDOW 

	protect oCCCancelar as PUSHBUTTON
	protect oCCApurar as PUSHBUTTON
	protect oDCANO as RIGHTSLE
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCMES as RIGHTSLE
	protect oDCFixedText1 as FIXEDTEXT
	protect oCCcmdmenos2 as PUSHBUTTON
	protect oCCcmdmais2 as PUSHBUTTON
	protect oCCcmdmenos as PUSHBUTTON
	protect oCCcmdmais as PUSHBUTTON
	protect oDCDatauso as RADIOBUTTONGROUP
	protect oCCRadioButton1 as RADIOBUTTON
	protect oCCDataInicial as RADIOBUTTON
	protect oCCDataFinal as RADIOBUTTON

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Apurar( ) 
	LOCAL aDAD AS ARRAY
	LOCAL oRO,oROI,oFERRAM,oFE02 AS USEREDE
	LOCAL nMES,nANO AS WORD
	LOCAL nRO AS DWORD
	LOCAL yCODIGO AS STRING
	LOCAL cCAMDATA AS STRING
	cCAMDATA:="DATA"
	IF SELF:oDCDatauso:value="I"
   	   cCAMDATA:="DATAINI"
	ENDIF	
	IF SELF:oDCDatauso:value="F"
   	   cCAMDATA:="DATAFIM"
	ENDIF	
	nMES:=Val(SELF:oDCMES:TextValue)
	nANO:=Val(SELF:oDCANO:TextValue)	
    aDAD:={zCURINI,"RO.DBF",zCURDIR}
    oRO:=USEREDE{aDAD}
    IF oRO:nERRO#0
       alert("Erro ao RO.DBF")
       RETUrn .f.
    ENDIF
    aDAD:={zCURINI,"ROI.DBF",zCURDIR}
    oROI:=USEREDE{aDAD}
    IF oROI:nERRO#0
       oRO:Close()
       alert("Erro ao ROI.DBF")
       RETUrn .f.
    ENDIF
    aDAD:={zCURINI,"FERRAM.DBF",zCURDIR}
    oFERRAM:=USEREDE{aDAD}
    IF oFERRAM:nERRO#0
       oRO:CLOSE()
       oROI:Close()
       alert("Erro ao FERRAM.DBF")
       RETUrn .f.
    ENDIF
    aDAD:={zCURINI,"FE02.DBF",zCURDIR}
    oFE02:=USEREDE{aDAD}
    IF oFE02:nERRO#0
       oRO:CLOSE()
       oROI:Close()
       oFERRAM:Close()
       alert("Erro ao FE02.DBF")
       RETUrn .f.
    ENDIF
    oFE02:GOTOP()
    WHILE ! OFE02:EoF
    	IF oFE02:FIELDGET("MES")=nMES .AND. oFE02:FIELDGET("ANO")=nANO
           OFE02:Delete()
        ENDIF		
    	oFE02:Skip()
    ENDDO
    oFE02:Pack()
    oRO:GOTOP()
    WHILE ! oRO:EoF
    	IF Month(oRO:FIELDGET(cCAMDATA))=nMES .AND. Year(oRO:FIELDGET(CCAMDATA))=nANO .AND. oRO:FIELDGET("TIPO")="F"
    	   nRO:=oRO:FIELDGET("RO")
    	   yCODIGO:=AllTrim(oRO:FIELDGET("FERRAM"))
		   oFERRAM:GOTOP()
           IF oFERRAM:SEEK(yCODIGO)
  			  IF ! Empty(oFERRAM:FIELDGET("GRUPO"))
            	 yCODIGO:=AllTrim(oFERRAM:FIELDGET("GRUPO"))
              ENDIF	
           ENDIF
    	   oROI:GOTOP()
    	   IF oROI:SEEK(nRO)
    	   	  WHILE oROI:EOF  .AND. oROI:FIELDGET("RO")=nRO
    	   	  	oFE02:GOTOP()
    	   	  	IF ! oFE02:SEEK(PadR(yCODIGO,24)+oROI:FIELDGET("CODIGO")+Str(nANO,4)+Str(nMES,2))
    	   	  		oFE02:APPEND()
    	   	  		oFE02:FIELDPUT("TIPO",yCODIGO)
    	   	  		oFE02:FIELDPUT("CODIGO",oROI:FIELDGET("CODIGO"))
    	   	  		oFE02:FIELDPUT("ANO",nANO)
    	   	  		oFE02:FIELDPUT("MES",nMES)
    	   	  	ENDIF
	            oFE02:FIELDPUT("USO",oROI:FIELDGET("QTDE")+oFE02:FIELDGET("USO"))
    	   	  	oROI:Skip()
     	   	  ENDDO
    	   ENDIF	
        ENDIF		
    	oRO:SKIP()
    ENDDO
    oRO:CLOSE()
    oROI:Close()
    oFE02:CLOSE()
    oFERRAM:Close()
	SELF:EndDialog()

METHOD Cancelar( ) 
	SELF:EndDialog()

METHOD cmdmais( ) 
SELF:oDCMES:TextValue:=Str(INCDEC(SELF:oDCMES:TextValue,1,1,12),2)		


METHOD cmdmais2( ) 
SELF:oDCANO:TextValue:=Str(INCDEC(SELF:oDCANO:TextValue,1,1900,2100),4)					


METHOD cmdmenos( ) 
SELF:oDCMES:TextValue:=Str(INCDEC(SELF:oDCMES:TextValue,-1,1,12),2)	

METHOD cmdmenos2( ) 
SELF:oDCANO:TextValue:=Str(INCDEC(SELF:oDCANO:TextValue,-1,1900,2100),4)						


CONSTRUCTOR(oParent,uExtra)  

self:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"jcmmacu",_GetInst()},TRUE)

oCCCancelar := PushButton{self,ResourceID{JCMMACU_CANCELAR,_GetInst()}}
oCCCancelar:HyperLabel := HyperLabel{#Cancelar,"Cancelar",NULL_STRING,NULL_STRING}

oCCApurar := PushButton{self,ResourceID{JCMMACU_APURAR,_GetInst()}}
oCCApurar:HyperLabel := HyperLabel{#Apurar,"Apurar",NULL_STRING,NULL_STRING}

oDCANO := rightSle{self,ResourceID{JCMMACU_ANO,_GetInst()}}
oDCANO:HyperLabel := HyperLabel{#ANO,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText2 := FixedText{self,ResourceID{JCMMACU_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Ano:",NULL_STRING,NULL_STRING}

oDCMES := rightSle{self,ResourceID{JCMMACU_MES,_GetInst()}}
oDCMES:HyperLabel := HyperLabel{#MES,NULL_STRING,NULL_STRING,NULL_STRING}

oDCFixedText1 := FixedText{self,ResourceID{JCMMACU_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Mes:",NULL_STRING,NULL_STRING}

oCCcmdmenos2 := PushButton{self,ResourceID{JCMMACU_CMDMENOS2,_GetInst()}}
oCCcmdmenos2:HyperLabel := HyperLabel{#cmdmenos2,"-",NULL_STRING,NULL_STRING}

oCCcmdmais2 := PushButton{self,ResourceID{JCMMACU_CMDMAIS2,_GetInst()}}
oCCcmdmais2:HyperLabel := HyperLabel{#cmdmais2,"+",NULL_STRING,NULL_STRING}

oCCcmdmenos := PushButton{self,ResourceID{JCMMACU_CMDMENOS,_GetInst()}}
oCCcmdmenos:HyperLabel := HyperLabel{#cmdmenos,"-",NULL_STRING,NULL_STRING}

oCCcmdmais := PushButton{self,ResourceID{JCMMACU_CMDMAIS,_GetInst()}}
oCCcmdmais:HyperLabel := HyperLabel{#cmdmais,"+",NULL_STRING,NULL_STRING}

oCCRadioButton1 := RadioButton{self,ResourceID{JCMMACU_RADIOBUTTON1,_GetInst()}}
oCCRadioButton1:HyperLabel := HyperLabel{#RadioButton1,"Data",NULL_STRING,NULL_STRING}

oCCDataInicial := RadioButton{self,ResourceID{JCMMACU_DATAINICIAL,_GetInst()}}
oCCDataInicial:HyperLabel := HyperLabel{#DataInicial,"DataInicial",NULL_STRING,NULL_STRING}

oCCDataFinal := RadioButton{self,ResourceID{JCMMACU_DATAFINAL,_GetInst()}}
oCCDataFinal:HyperLabel := HyperLabel{#DataFinal,"DataFinal",NULL_STRING,NULL_STRING}

oDCDatauso := RadioButtonGroup{self,ResourceID{JCMMACU_DATAUSO,_GetInst()}}
oDCDatauso:FillUsing({ ;
						{oCCRadioButton1,"D"}, ;
						{oCCDataInicial,"I"}, ;
						{oCCDataFinal,"F"} ;
						})
oDCDatauso:HyperLabel := HyperLabel{#Datauso,"Usar",NULL_STRING,NULL_STRING}

self:Caption := "Acumular Consumo Médio Mensal"
self:HyperLabel := HyperLabel{#jcmmacu,"Acumular Consumo Médio Mensal",NULL_STRING,NULL_STRING}

self:PostInit(oParent,uExtra)

return self


METHOD PostInit(oParent,uExtra) 
	//Put your PostInit additions here
	SELF:oDCDatauso:value:="D"
	 FabCenterWindow( SELF )
	RETURN NIL


END CLASS
