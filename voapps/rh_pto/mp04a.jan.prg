#region DEFINES
STATIC DEFINE JMP04A_CURSO := 103 
STATIC DEFINE JMP04A_DESCUR := 104 
STATIC DEFINE JMP04A_NUMANT := 106 
STATIC DEFINE JMP04A_SC_CURSO := 101 
STATIC DEFINE JMP04A_SC_TECNICO := 100 
STATIC DEFINE JMP04A_SC_TECNICO1 := 105 
STATIC DEFINE JMP04A_SC_TECNICO2 := 108 
STATIC DEFINE JMP04A_TECNICO := 102 
STATIC DEFINE JMP04A_TREIN := 107 
#endregion

class jmp04a inherit DATAWINDOW 

	PROTECT oDBTECNICO as DataColumn
	PROTECT oDBNUMANT as DataColumn
	PROTECT oDBTREIN as DataColumn
	PROTECT oDBCURSO as DataColumn
	PROTECT oDBDESCUR as DataColumn
	protect oDCSC_TECNICO as FIXEDTEXT
	protect oDCSC_CURSO as FIXEDTEXT
	protect oDCTECNICO as SINGLELINEEDIT
	protect oDCCURSO as SINGLELINEEDIT
	protect oDCDESCUR as SINGLELINEEDIT
	protect oDCSC_TECNICO1 as FIXEDTEXT
	protect oDCnumant as SINGLELINEEDIT
	protect oDCtrein as SINGLELINEEDIT
	protect oDCSC_TECNICO2 as FIXEDTEXT
// 	instance TECNICO 
// 	instance CURSO 
// 	instance DESCUR 
// 	instance numant 
// 	instance trein 

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

SUPER(oWindow,ResourceID{"jmp04a",_GetInst()},iCtlID)

oDCSC_TECNICO := FixedText{self,ResourceID{JMP04A_SC_TECNICO,_GetInst()}}
oDCSC_TECNICO:HyperLabel := HyperLabel{#SC_TECNICO,"Tecnico:",NULL_STRING,NULL_STRING}

oDCSC_CURSO := FixedText{self,ResourceID{JMP04A_SC_CURSO,_GetInst()}}
oDCSC_CURSO:HyperLabel := HyperLabel{#SC_CURSO,"Curso:",NULL_STRING,NULL_STRING}

oDCTECNICO := SingleLineEdit{self,ResourceID{JMP04A_TECNICO,_GetInst()}}
oDCTECNICO:FieldSpec := PADRAO_NUM_08{}
oDCTECNICO:HyperLabel := HyperLabel{#TECNICO,"Nº Fun",NULL_STRING,"MP04C_TECNICO"}

oDCCURSO := SingleLineEdit{self,ResourceID{JMP04A_CURSO,_GetInst()}}
oDCCURSO:FieldSpec := PADRAO_CHAR_20{}
oDCCURSO:HyperLabel := HyperLabel{#CURSO,"Curso:",NULL_STRING,"MP04C_CURSO"}

oDCDESCUR := SingleLineEdit{self,ResourceID{JMP04A_DESCUR,_GetInst()}}
oDCDESCUR:FieldSpec := PADRAO_char_120{}
oDCDESCUR:HyperLabel := HyperLabel{#DESCUR,"Descrição",NULL_STRING,"MP04C_DESCUR"}

oDCSC_TECNICO1 := FixedText{self,ResourceID{JMP04A_SC_TECNICO1,_GetInst()}}
oDCSC_TECNICO1:HyperLabel := HyperLabel{#SC_TECNICO1,"Anterior",NULL_STRING,NULL_STRING}

oDCnumant := SingleLineEdit{self,ResourceID{JMP04A_NUMANT,_GetInst()}}
oDCnumant:FieldSpec := PADRAO_NUM_08{}
oDCnumant:HyperLabel := HyperLabel{#numant,"Nº ant",NULL_STRING,"MP04C_TECNICO"}

oDCtrein := SingleLineEdit{self,ResourceID{JMP04A_TREIN,_GetInst()}}
oDCtrein:FieldSpec := PADRAO_NUM_08{}
oDCtrein:HyperLabel := HyperLabel{#trein,"Nº Trein",NULL_STRING,"MP04C_TECNICO"}

oDCSC_TECNICO2 := FixedText{self,ResourceID{JMP04A_SC_TECNICO2,_GetInst()}}
oDCSC_TECNICO2:HyperLabel := HyperLabel{#SC_TECNICO2,"treinamento",NULL_STRING,NULL_STRING}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#jmp04a,"DataWindow Caption",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBTECNICO := DataColumn{PADRAO_NUM_08{}}
oDBTECNICO:Width := 9
oDBTECNICO:HyperLabel := oDCTECNICO:HyperLabel 
oDBTECNICO:Caption := "Nº Fun"
self:Browser:AddColumn(oDBTECNICO)

oDBNUMANT := DataColumn{PADRAO_NUM_08{}}
oDBNUMANT:Width := 11
oDBNUMANT:HyperLabel := oDCNUMANT:HyperLabel 
oDBNUMANT:Caption := "Nº ant"
self:Browser:AddColumn(oDBNUMANT)

oDBTREIN := DataColumn{PADRAO_NUM_08{}}
oDBTREIN:Width := 10
oDBTREIN:HyperLabel := oDCTREIN:HyperLabel 
oDBTREIN:Caption := "Nº Trein"
self:Browser:AddColumn(oDBTREIN)

oDBCURSO := DataColumn{PADRAO_CHAR_20{}}
oDBCURSO:Width := 12
oDBCURSO:HyperLabel := oDCCURSO:HyperLabel 
oDBCURSO:Caption := "Curso:"
self:Browser:AddColumn(oDBCURSO)

oDBDESCUR := DataColumn{PADRAO_char_120{}}
oDBDESCUR:Width := 40
oDBDESCUR:HyperLabel := oDCDESCUR:HyperLabel 
oDBDESCUR:Caption := "Descrição"
self:Browser:AddColumn(oDBDESCUR)


self:ViewAs(#BrowseView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access numant() 
return self:FieldGet(#numant)


assign numant(uValue) 
self:FieldPut(#numant, uValue)
return numant := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
//	 FabCenterWindow( SELF )
	RETURN NIL


access TECNICO() 
return self:FieldGet(#TECNICO)


assign TECNICO(uValue) 
self:FieldPut(#TECNICO, uValue)
return TECNICO := uValue


access trein() 
return self:FieldGet(#trein)


assign trein(uValue) 
self:FieldPut(#trein, uValue)
return trein := uValue


END CLASS
