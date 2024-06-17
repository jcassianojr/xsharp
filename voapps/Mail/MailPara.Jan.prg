#region DEFINES
STATIC DEFINE JMAILPARA_DESTINO := 103 
STATIC DEFINE JMAILPARA_ERRO := 102 
STATIC DEFINE JMAILPARA_SC_DESTINO := 101 
STATIC DEFINE JMAILPARA_SC_ERRO := 100 
#endregion

class JMailPara inherit DATAWINDOW 

	PROTECT oDBERRO as DataColumn
	PROTECT oDBDESTINO as DataColumn
	protect oDCSC_ERRO as FIXEDTEXT
	protect oDCSC_DESTINO as FIXEDTEXT
	protect oDCERRO as SINGLELINEEDIT
	protect oDCDESTINO as SINGLELINEEDIT
// 	instance ERRO 
// 	instance DESTINO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DESTINO() 
return self:FieldGet(#DESTINO)


assign DESTINO(uValue) 
self:FieldPut(#DESTINO, uValue)
return DESTINO := uValue


access ERRO() 
return self:FieldGet(#ERRO)


assign ERRO(uValue) 
self:FieldPut(#ERRO, uValue)
return ERRO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMailPara",_GetInst()},iCtlID)

oDCSC_ERRO := FixedText{self,ResourceID{JMAILPARA_SC_ERRO,_GetInst()}}
oDCSC_ERRO:HyperLabel := HyperLabel{#SC_ERRO,"Erro:",NULL_STRING,NULL_STRING}

oDCSC_DESTINO := FixedText{self,ResourceID{JMAILPARA_SC_DESTINO,_GetInst()}}
oDCSC_DESTINO:HyperLabel := HyperLabel{#SC_DESTINO,"Destino:",NULL_STRING,NULL_STRING}

oDCERRO := SingleLineEdit{self,ResourceID{JMAILPARA_ERRO,_GetInst()}}
oDCERRO:FieldSpec := PADRAO_CHAR_08{}
oDCERRO:HyperLabel := HyperLabel{#ERRO,"Erro:",NULL_STRING,"MAILPARA_ERRO"}

oDCDESTINO := SingleLineEdit{self,ResourceID{JMAILPARA_DESTINO,_GetInst()}}
oDCDESTINO:FieldSpec := PADRAO_CHAR_12{}
oDCDESTINO:HyperLabel := HyperLabel{#DESTINO,"Destino:",NULL_STRING,"MAILPARA_DESTINO"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#JMailPara,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBERRO := DataColumn{PADRAO_CHAR_08{}}
oDBERRO:Width := 19
oDBERRO:HyperLabel := oDCERRO:HyperLabel 
oDBERRO:Caption := "Erro:"
self:Browser:AddColumn(oDBERRO)

oDBDESTINO := DataColumn{PADRAO_CHAR_12{}}
oDBDESTINO:Width := 19
oDBDESTINO:HyperLabel := oDCDESTINO:HyperLabel 
oDBDESTINO:Caption := "Destino:"
self:Browser:AddColumn(oDBDESTINO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
