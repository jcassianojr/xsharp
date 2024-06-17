#region DEFINES
STATIC DEFINE JCEI_CURSO := 104 
STATIC DEFINE JCEI_DESCUR := 100 
STATIC DEFINE JCEI_NUMERO := 102 
STATIC DEFINE JCEI_SC_CURSO := 103 
STATIC DEFINE JCEI_SC_NUMERO := 101 
#endregion

class JCEI inherit DATAWINDOW 

	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBCURSO as DataColumn
	PROTECT oDBDESCUR as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCSC_CURSO as FIXEDTEXT
	protect oDCCURSO as SINGLELINEEDIT
// 	instance DESCUR 
// 	instance NUMERO 
// 	instance CURSO 

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


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCEI",_GetInst()},iCtlID)

oDCSC_NUMERO := FixedText{self,ResourceID{JCEI_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JCEI_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := padrao_num_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"CUREMI_NUMERO"}

oDCSC_CURSO := FixedText{self,ResourceID{JCEI_SC_CURSO,_GetInst()}}
oDCSC_CURSO:HyperLabel := HyperLabel{#SC_CURSO,"Curso:",NULL_STRING,NULL_STRING}

oDCCURSO := SingleLineEdit{self,ResourceID{JCEI_CURSO,_GetInst()}}
oDCCURSO:FieldSpec := padrao_char_20{}
oDCCURSO:HyperLabel := HyperLabel{#CURSO,"Curso:",NULL_STRING,"CUREMI_CURSO"}

self:Caption := "Cursos Escolas"
self:HyperLabel := HyperLabel{#JCEI,"Cursos Escolas",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBNUMERO := DataColumn{padrao_num_08{}}
oDBNUMERO:Width := 12
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
self:Browser:AddColumn(oDBNUMERO)

oDBCURSO := DataColumn{padrao_char_20{}}
oDBCURSO:Width := 18
oDBCURSO:HyperLabel := oDCCURSO:HyperLabel 
oDBCURSO:Caption := "Curso:"
self:Browser:AddColumn(oDBCURSO)

oDBDESCUR := DataColumn{padrao_char_120{}}
oDBDESCUR:Width := 38
oDBDESCUR:HyperLabel := HyperLabel{#DESCUR,"Descrição",NULL_STRING,NULL_STRING} 
oDBDESCUR:Caption := "Descrição"
self:Browser:AddColumn(oDBDESCUR)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


END CLASS
