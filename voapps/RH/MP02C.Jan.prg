#region DEFINES
STATIC DEFINE JMP2_CODIGO := 104 
STATIC DEFINE JMP2_CURSO := 105 
STATIC DEFINE JMP2_SC_CODIGO := 102 
STATIC DEFINE JMP2_SC_CODIGO1 := 101 
STATIC DEFINE JMP2_SC_CURSO := 103 
STATIC DEFINE JMP2_TIPO := 100 
#endregion

class JMP2 inherit DATAWINDOW 

	PROTECT oDBCURSO as DataColumn
	PROTECT oDBTIPO as DataColumn
	protect oDCTIPO as SINGLELINEEDIT
	protect oDCSC_CODIGO1 as FIXEDTEXT
	protect oDCSC_CODIGO as FIXEDTEXT
	protect oDCSC_CURSO as FIXEDTEXT
	protect oDCCODIGO as SINGLELINEEDIT
	protect oDCCURSO as SINGLELINEEDIT
// 	instance TIPO 
// 	instance CODIGO 
// 	instance CURSO 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access CODIGO() 
return self:FieldGet(#CODIGO)


assign CODIGO(uValue) 
self:FieldPut(#CODIGO, uValue)
return CODIGO := uValue


access CURSO() 
return self:FieldGet(#CURSO)


assign CURSO(uValue) 
self:FieldPut(#CURSO, uValue)
return CURSO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JMP2",_GetInst()},iCtlID)

oDCTIPO := SingleLineEdit{self,ResourceID{JMP2_TIPO,_GetInst()}}
oDCTIPO:FieldSpec := padrao_char_01{}
oDCTIPO:HyperLabel := HyperLabel{#TIPO,"Tipo",NULL_STRING,"MP02C_CURSO"}

oDCSC_CODIGO1 := FixedText{self,ResourceID{JMP2_SC_CODIGO1,_GetInst()}}
oDCSC_CODIGO1:HyperLabel := HyperLabel{#SC_CODIGO1,"Tipo",NULL_STRING,NULL_STRING}

oDCSC_CODIGO := FixedText{self,ResourceID{JMP2_SC_CODIGO,_GetInst()}}
oDCSC_CODIGO:HyperLabel := HyperLabel{#SC_CODIGO,"Codigo:",NULL_STRING,NULL_STRING}

oDCSC_CURSO := FixedText{self,ResourceID{JMP2_SC_CURSO,_GetInst()}}
oDCSC_CURSO:HyperLabel := HyperLabel{#SC_CURSO,"Curso:",NULL_STRING,NULL_STRING}

oDCCODIGO := SingleLineEdit{self,ResourceID{JMP2_CODIGO,_GetInst()}}
oDCCODIGO:FieldSpec := padrao_char_12{}
oDCCODIGO:HyperLabel := HyperLabel{#CODIGO,"Codigo:",NULL_STRING,"MP02C_CODIGO"}

oDCCURSO := SingleLineEdit{self,ResourceID{JMP2_CURSO,_GetInst()}}
oDCCURSO:FieldSpec := padrao_char_20{}
oDCCURSO:HyperLabel := HyperLabel{#CURSO,"Curso:",NULL_STRING,"MP02C_CURSO"}

self:Caption := "Cursos"
self:HyperLabel := HyperLabel{#JMP2,"Cursos",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBCURSO := DataColumn{padrao_char_20{}}
oDBCURSO:Width := 26
oDBCURSO:HyperLabel := oDCCURSO:HyperLabel 
oDBCURSO:Caption := "Curso:"
self:Browser:AddColumn(oDBCURSO)

oDBTIPO := DataColumn{padrao_char_01{}}
oDBTIPO:Width := 6
oDBTIPO:HyperLabel := oDCTIPO:HyperLabel 
oDBTIPO:Caption := "Tipo"
self:Browser:AddColumn(oDBTIPO)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access TIPO() 
return self:FieldGet(#TIPO)


assign TIPO(uValue) 
self:FieldPut(#TIPO, uValue)
return TIPO := uValue


END CLASS
