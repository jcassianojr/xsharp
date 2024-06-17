#region DEFINES
STATIC DEFINE JCURB_CURSO := 102 
STATIC DEFINE JCURB_DESCUR := 103 
STATIC DEFINE JCURB_GRUPO := 105 
STATIC DEFINE JCURB_SC_CURSO := 100 
STATIC DEFINE JCURB_SC_DESCUR := 101 
STATIC DEFINE JCURB_SC_GRUPO := 104 
#endregion

class jcurb inherit DATAWINDOW 

	PROTECT oDBCURSO as DataColumn
	PROTECT oDBGRUPO as DataColumn
	PROTECT oDBDESCUR as DataColumn
	protect oDCSC_CURSO as FIXEDTEXT
	protect oDCSC_DESCUR as FIXEDTEXT
	protect oDCCURSO as SINGLELINEEDIT
	protect oDCDESCUR as SINGLELINEEDIT
	protect oDCSC_GRUPO as FIXEDTEXT
	protect oDCGRUPO as SINGLELINEEDIT
// 	instance CURSO 
// 	instance DESCUR 
// 	instance GRUPO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CURSO() 
return self:FieldGet(#CURSO)


assign CURSO(uValue) 
self:FieldPut(#CURSO, uValue)
return CURSO := uValue


access DESCUR() 
return self:FieldGet(#DESCUR)


assign DESCUR(uValue) 
self:FieldPut(#DESCUR, uValue)
return DESCUR := uValue


access GRUPO() 
return self:FieldGet(#GRUPO)


assign GRUPO(uValue) 
self:FieldPut(#GRUPO, uValue)
return GRUPO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jcurb",_GetInst()},iCtlID)

oDCSC_CURSO := FixedText{self,ResourceID{JCURB_SC_CURSO,_GetInst()}}
oDCSC_CURSO:HyperLabel := HyperLabel{#SC_CURSO,"Curso:",NULL_STRING,NULL_STRING}

oDCSC_DESCUR := FixedText{self,ResourceID{JCURB_SC_DESCUR,_GetInst()}}
oDCSC_DESCUR:HyperLabel := HyperLabel{#SC_DESCUR,"Descur:",NULL_STRING,NULL_STRING}

oDCCURSO := SingleLineEdit{self,ResourceID{JCURB_CURSO,_GetInst()}}
oDCCURSO:FieldSpec := padrao_char_20{}
oDCCURSO:HyperLabel := HyperLabel{#CURSO,"Curso:",NULL_STRING,"CURSO_CURSO"}

oDCDESCUR := SingleLineEdit{self,ResourceID{JCURB_DESCUR,_GetInst()}}
oDCDESCUR:FieldSpec := padrao_char_120{}
oDCDESCUR:HyperLabel := HyperLabel{#DESCUR,"Descrição",NULL_STRING,"CURSO_DESCUR"}

oDCSC_GRUPO := FixedText{self,ResourceID{JCURB_SC_GRUPO,_GetInst()}}
oDCSC_GRUPO:HyperLabel := HyperLabel{#SC_GRUPO,"Grupo:",NULL_STRING,NULL_STRING}

oDCGRUPO := SingleLineEdit{self,ResourceID{JCURB_GRUPO,_GetInst()}}
oDCGRUPO:FieldSpec := padrao_char_05{}
oDCGRUPO:HyperLabel := HyperLabel{#GRUPO,"Grupo:",NULL_STRING,"CURSO_GRUPO"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jcurb,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCURSO := DataColumn{padrao_char_20{}}
oDBCURSO:Width := 22
oDBCURSO:HyperLabel := oDCCURSO:HyperLabel 
oDBCURSO:Caption := "Curso:"
self:Browser:AddColumn(oDBCURSO)

oDBGRUPO := DataColumn{padrao_char_05{}}
oDBGRUPO:Width := 7
oDBGRUPO:HyperLabel := oDCGRUPO:HyperLabel 
oDBGRUPO:Caption := "Grupo:"
self:Browser:AddColumn(oDBGRUPO)

oDBDESCUR := DataColumn{padrao_char_120{}}
oDBDESCUR:Width := 52
oDBDESCUR:HyperLabel := oDCDESCUR:HyperLabel 
oDBDESCUR:Caption := "Descrição"
self:Browser:AddColumn(oDBDESCUR)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
//	 FabCenterWindow( SELF )
	RETURN NIL


END CLASS
