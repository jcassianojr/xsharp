#region DEFINES
STATIC DEFINE JPROV_BUSCANUM := 108 
STATIC DEFINE JPROV_CMDORDENAR := 109 
STATIC DEFINE JPROV_DATA := 107 
STATIC DEFINE JPROV_DESTINO := 105 
STATIC DEFINE JPROV_ESCFUN := 110 
STATIC DEFINE JPROV_NOME := 106 
STATIC DEFINE JPROV_ORIGEM := 104 
STATIC DEFINE JPROV_SC_DATA := 102 
STATIC DEFINE JPROV_SC_DESTINO := 101 
STATIC DEFINE JPROV_SC_NOME := 103 
STATIC DEFINE JPROV_SC_ORIGEM := 100 
#endregion

PARTIAL class JPROV inherit MYDataWindow 

	PROTECT oDBORIGEM as DataColumn
	PROTECT oDBDESTINO as DataColumn
	PROTECT oDBDATA as DataColumn
	protect oDCSC_ORIGEM as FIXEDTEXT
	protect oDCSC_DESTINO as FIXEDTEXT
	protect oDCSC_DATA as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCORIGEM as RIGHTSLE
	protect oDCDESTINO as RIGHTSLE
	protect oDCNOME as SINGLELINEEDIT
	protect oDCDATA as DATETIMEPICKER
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
	protect oCCescFUN as PUSHBUTTON
// 	instance ORIGEM 
// 	instance DESTINO 
// 	instance NOME 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access DESTINO() 
return self:FieldGet(#DESTINO)


assign DESTINO(uValue) 
self:FieldPut(#DESTINO, uValue)
return DESTINO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JPROV",_GetInst()},iCtlID)

oDCSC_ORIGEM := FixedText{self,ResourceID{JPROV_SC_ORIGEM,_GetInst()}}
oDCSC_ORIGEM:HyperLabel := HyperLabel{#SC_ORIGEM,"Numero Provisorio",NULL_STRING,NULL_STRING}

oDCSC_DESTINO := FixedText{self,ResourceID{JPROV_SC_DESTINO,_GetInst()}}
oDCSC_DESTINO:HyperLabel := HyperLabel{#SC_DESTINO,"Numero Efetivo",NULL_STRING,NULL_STRING}

oDCSC_DATA := FixedText{self,ResourceID{JPROV_SC_DATA,_GetInst()}}
oDCSC_DATA:HyperLabel := HyperLabel{#SC_DATA,"Data:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JPROV_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Obs:",NULL_STRING,NULL_STRING}

oDCORIGEM := rightSle{self,ResourceID{JPROV_ORIGEM,_GetInst()}}
oDCORIGEM:FieldSpec := PADRAO_NUM_08{}
oDCORIGEM:HyperLabel := HyperLabel{#ORIGEM,"Origem:",NULL_STRING,"FOPTOPRO_ORIGEM"}

oDCDESTINO := rightSle{self,ResourceID{JPROV_DESTINO,_GetInst()}}
oDCDESTINO:FieldSpec := PADRAO_NUM_08{}
oDCDESTINO:HyperLabel := HyperLabel{#DESTINO,"Destino:",NULL_STRING,"FOPTOPRO_DESTINO"}

oDCNOME := SingleLineEdit{self,ResourceID{JPROV_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_30{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"FOPTOPRO_NOME"}

oDCDATA := DateTimePicker{self,ResourceID{JPROV_DATA,_GetInst()}}
oDCDATA:FieldSpec := DATE_FIELD{}
oDCDATA:HyperLabel := HyperLabel{#DATA,"Data",NULL_STRING,NULL_STRING}

oCCbuscaNUM := PushButton{self,ResourceID{JPROV_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}

oCCcmdordenar := PushButton{self,ResourceID{JPROV_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

oCCescFUN := PushButton{self,ResourceID{JPROV_ESCFUN,_GetInst()}}
oCCescFUN:HyperLabel := HyperLabel{#escFUN,"...",NULL_STRING,NULL_STRING}

self:Caption := "Cadastro de Provisorios"
self:HyperLabel := HyperLabel{#JPROV,"Cadastro de Provisorios",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBORIGEM := DataColumn{PADRAO_NUM_08{}}
oDBORIGEM:Width := 9
oDBORIGEM:HyperLabel := oDCORIGEM:HyperLabel 
oDBORIGEM:Caption := "Origem:"
self:Browser:AddColumn(oDBORIGEM)

oDBDESTINO := DataColumn{PADRAO_NUM_08{}}
oDBDESTINO:Width := 9
oDBDESTINO:HyperLabel := oDCDESTINO:HyperLabel 
oDBDESTINO:Caption := "Destino:"
self:Browser:AddColumn(oDBDESTINO)

oDBDATA := DataColumn{DATE_FIELD{}}
oDBDATA:Width := 13
oDBDATA:HyperLabel := oDCDATA:HyperLabel 
oDBDATA:Caption := "Data"
self:Browser:AddColumn(oDBDATA)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access ORIGEM() 
return self:FieldGet(#ORIGEM)


assign ORIGEM(uValue) 
self:FieldPut(#ORIGEM, uValue)
return ORIGEM := uValue


END CLASS
