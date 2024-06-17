#region DEFINES
STATIC DEFINE JRL_ALTERAR := 108 
STATIC DEFINE JRL_ANTERIOR := 106 
STATIC DEFINE JRL_BUSCA := 110 
STATIC DEFINE JRL_CHECAR := 109 
STATIC DEFINE JRL_DATA := 103 
STATIC DEFINE JRL_JRLI := 104 
STATIC DEFINE JRL_ORDEM := 111 
STATIC DEFINE JRL_PROXIMO := 105 
STATIC DEFINE JRL_RL := 102 
STATIC DEFINE JRL_SC_DATA := 101 
STATIC DEFINE JRL_SC_RL := 100 
STATIC DEFINE JRL_TABULAR := 107 
STATIC DEFINE JRLX_CODME01 := 108 
STATIC DEFINE JRLX_LUB01 := 109 
STATIC DEFINE JRLX_LUB02 := 110 
STATIC DEFINE JRLX_LUB03 := 111 
STATIC DEFINE JRLX_LUB04 := 112 
STATIC DEFINE JRLX_LUB05 := 113 
STATIC DEFINE JRLX_RL := 107 
STATIC DEFINE JRLX_SC_CODME01 := 101 
STATIC DEFINE JRLX_SC_LUB01 := 102 
STATIC DEFINE JRLX_SC_LUB02 := 103 
STATIC DEFINE JRLX_SC_LUB03 := 104 
STATIC DEFINE JRLX_SC_LUB04 := 105 
STATIC DEFINE JRLX_SC_LUB05 := 106 
STATIC DEFINE JRLX_SC_RL := 100 
#endregion

PARTIAL class JRL inherit MYDataWindow 

	PROTECT oDBRL as DataColumn
	PROTECT oDBDATA as DataColumn
	protect oDCSC_RL as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCRL as SINGLELINEEDIT
	protect oDCDATA as DATESLE
	protect oCCProximo as PUSHBUTTON
	protect oCCAnterior as PUSHBUTTON
	protect oCCTabular as PUSHBUTTON
	protect oCCAlterar as PUSHBUTTON
	protect oCCChecar as PUSHBUTTON
	protect oCCbusca as PUSHBUTTON
	protect oCCordem as PUSHBUTTON
// 	instance RL 
// 	instance DATA 
	protect oSFJRLI as JRLI

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DATA() 
return self:FieldGet(#DATA)


assign DATA(uValue) 
self:FieldPut(#DATA, uValue)
return DATA := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JRL",_GetInst()},iCtlID)

aFonts[1] := Font{,12,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_RL := FixedText{self,ResourceID{JRL_SC_RL,_GetInst()}}
oDCSC_RL:HyperLabel := HyperLabel{#SC_RL,"Rl:",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JRL_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCRL := SingleLineEdit{self,ResourceID{JRL_RL,_GetInst()}}
oDCRL:FieldSpec := PADRAO_NUM_08{}
oDCRL:HyperLabel := HyperLabel{#RL,"Rl:",NULL_STRING,"Rl_RL"}
oDCRL:BackGround := aBrushes[1]
oDCRL:Font(aFonts[1], FALSE)

oDCDATA := DateSle{self,ResourceID{JRL_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data:",NULL_STRING,"Rl_DATA"}

oCCProximo := PushButton{self,ResourceID{JRL_PROXIMO,_GetInst()}}
oCCProximo:HyperLabel := HyperLabel{#Proximo,NULL_STRING,NULL_STRING,NULL_STRING}
oCCProximo:Image := ico_next{}

oCCAnterior := PushButton{self,ResourceID{JRL_ANTERIOR,_GetInst()}}
oCCAnterior:HyperLabel := HyperLabel{#Anterior,NULL_STRING,NULL_STRING,NULL_STRING}
oCCAnterior:Image := ico_previous{}

oCCTabular := PushButton{self,ResourceID{JRL_TABULAR,_GetInst()}}
oCCTabular:HyperLabel := HyperLabel{#Tabular,"Tabular",NULL_STRING,NULL_STRING}

oCCAlterar := PushButton{self,ResourceID{JRL_ALTERAR,_GetInst()}}
oCCAlterar:HyperLabel := HyperLabel{#Alterar,"Alterar",NULL_STRING,NULL_STRING}

oCCChecar := PushButton{self,ResourceID{JRL_CHECAR,_GetInst()}}
oCCChecar:HyperLabel := HyperLabel{#Checar,"Checar",NULL_STRING,NULL_STRING}

oCCbusca := PushButton{self,ResourceID{JRL_BUSCA,_GetInst()}}
oCCbusca:Image := ico_find{}
oCCbusca:HyperLabel := HyperLabel{#busca,NULL_STRING,NULL_STRING,NULL_STRING}

oCCordem := PushButton{self,ResourceID{JRL_ORDEM,_GetInst()}}
oCCordem:Image := ico_az{}
oCCordem:HyperLabel := HyperLabel{#ordem,NULL_STRING,NULL_STRING,NULL_STRING}
oCCordem:TooltipText := "Ordenar Por Numero"

self:Caption := "Registro de Lubrificação"
self:HyperLabel := HyperLabel{#JRL,"Registro de Lubrificação",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBRL := DataColumn{PADRAO_NUM_08{}}
oDBRL:Width := 12
oDBRL:HyperLabel := oDCRL:HyperLabel 
oDBRL:Caption := "Rl:"
oDBRL:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBRL)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 33
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data:"
self:Browser:AddColumn(oDBDATA)


self:ViewAs(#FormView)

oSFJRLI := JRLI{self,JRL_JRLI}
oSFJRLI:show()

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


METHOD ordem( ) 
	SELF:keyfind()

access RL() 
return self:FieldGet(#RL)


assign RL(uValue) 
self:FieldPut(#RL, uValue)
return RL := uValue


END CLASS
