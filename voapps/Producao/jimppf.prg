#region DEFINES
STATIC DEFINE JIMPPF_ATUMS06 := 125 
STATIC DEFINE JIMPPF_CCODIGO := 106 
STATIC DEFINE JIMPPF_CHKSEQ := 114 
STATIC DEFINE JIMPPF_ENCERRAR := 113 
STATIC DEFINE JIMPPF_ESCCOD := 111 
STATIC DEFINE JIMPPF_ESCPF := 120 
STATIC DEFINE JIMPPF_FIXEDTEXT1 := 101 
STATIC DEFINE JIMPPF_FIXEDTEXT2 := 107 
STATIC DEFINE JIMPPF_FIXEDTEXT3 := 110 
STATIC DEFINE JIMPPF_FIXEDTEXT4 := 112 
STATIC DEFINE JIMPPF_FOTO := 123 
STATIC DEFINE JIMPPF_IMPCOM := 103 
STATIC DEFINE JIMPPF_IMPMAO := 104 
STATIC DEFINE JIMPPF_IMPMP := 102 
STATIC DEFINE JIMPPF_IMPSEQ := 105 
STATIC DEFINE JIMPPF_IMPTUDO := 124 
STATIC DEFINE JIMPPF_LIMPACO := 117 
STATIC DEFINE JIMPPF_LIMPAMO := 118 
STATIC DEFINE JIMPPF_LIMPAMP := 116 
STATIC DEFINE JIMPPF_LIMPASQ := 119 
STATIC DEFINE JIMPPF_NPF := 100 
STATIC DEFINE JIMPPF_PEGCOD := 115 
STATIC DEFINE JIMPPF_SC_DESTINO2 := 122 
STATIC DEFINE JIMPPF_SEQ := 108 
STATIC DEFINE JIMPPF_SSQ := 109 
STATIC DEFINE JIMPPF_TEXTO := 121 
#endregion

PARTIAL class jimppf inherit DATADIALOG 

	protect oDCnPF as RIGHTSLE
	protect oDCFixedText1 as FIXEDTEXT
	protect oCCImpMP as PUSHBUTTON
	protect oCCImpCom as PUSHBUTTON
	protect oCCImpMao as PUSHBUTTON
	protect oCCImpSEQ as PUSHBUTTON
	protect oDCcCODIGO as SINGLELINEEDIT
	protect oDCFixedText2 as FIXEDTEXT
	protect oDCSEQ as SINGLELINEEDIT
	protect oDCSSQ as SINGLELINEEDIT
	protect oDCFixedText3 as FIXEDTEXT
	protect oCCesccod as PUSHBUTTON
	protect oDCFixedText4 as FIXEDTEXT
	protect oCCencerrar as PUSHBUTTON
	protect oCCchkseq as PUSHBUTTON
	protect oCCpegcod as PUSHBUTTON
	protect oDClimpaMP as CHECKBOX
	protect oDClimpaCO as CHECKBOX
	protect oDClimpaMO as CHECKBOX
	protect oDClimpaSQ as CHECKBOX
	protect oCCescpf as PUSHBUTTON
	protect oDCtexto as FIXEDTEXT
	protect oDCSC_DESTINO2 as FIXEDTEXT
	protect oCCfoto as PUSHBUTTON
	protect oCCImpTudo as PUSHBUTTON
	protect oCCAtuMs06 as PUSHBUTTON
// 	instance nPF 
// 	instance cCODIGO 
// 	instance SEQ 
// 	instance SSQ 
// 	instance limpaMP 
// 	instance limpaCO 
// 	instance limpaMO 
// 	instance limpaSQ 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access cCODIGO() 
return self:FieldGet(#cCODIGO)


assign cCODIGO(uValue) 
self:FieldPut(#cCODIGO, uValue)
return cCODIGO := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jimppf",_GetInst()},iCtlID)

oDCnPF := rightSle{self,ResourceID{JIMPPF_NPF,_GetInst()}}
oDCnPF:HyperLabel := HyperLabel{#nPF,NULL_STRING,NULL_STRING,NULL_STRING}
oDCnPF:FieldSpec := PADRAO_NUM_08{}
oDCnPF:FocusSelect := FSEL_ALL

oDCFixedText1 := FixedText{self,ResourceID{JIMPPF_FIXEDTEXT1,_GetInst()}}
oDCFixedText1:HyperLabel := HyperLabel{#FixedText1,"Numero do Processo Fabricação:",NULL_STRING,NULL_STRING}

oCCImpMP := PushButton{self,ResourceID{JIMPPF_IMPMP,_GetInst()}}
oCCImpMP:HyperLabel := HyperLabel{#ImpMP,"Materia Prima",NULL_STRING,NULL_STRING}

oCCImpCom := PushButton{self,ResourceID{JIMPPF_IMPCOM,_GetInst()}}
oCCImpCom:HyperLabel := HyperLabel{#ImpCom,"Componentes",NULL_STRING,NULL_STRING}

oCCImpMao := PushButton{self,ResourceID{JIMPPF_IMPMAO,_GetInst()}}
oCCImpMao:HyperLabel := HyperLabel{#ImpMao,"Mão Obra",NULL_STRING,NULL_STRING}

oCCImpSEQ := PushButton{self,ResourceID{JIMPPF_IMPSEQ,_GetInst()}}
oCCImpSEQ:HyperLabel := HyperLabel{#ImpSEQ,"Sequencia",NULL_STRING,NULL_STRING}

oDCcCODIGO := SingleLineEdit{self,ResourceID{JIMPPF_CCODIGO,_GetInst()}}
oDCcCODIGO:HyperLabel := HyperLabel{#cCODIGO,NULL_STRING,NULL_STRING,NULL_STRING}
oDCcCODIGO:FieldSpec := PADRAO_CHAR_24{}
oDCcCODIGO:FocusSelect := FSEL_ALL

oDCFixedText2 := FixedText{self,ResourceID{JIMPPF_FIXEDTEXT2,_GetInst()}}
oDCFixedText2:HyperLabel := HyperLabel{#FixedText2,"Codigo Produto Manager",NULL_STRING,NULL_STRING}

oDCSEQ := SingleLineEdit{self,ResourceID{JIMPPF_SEQ,_GetInst()}}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,NULL_STRING,NULL_STRING,NULL_STRING}
oDCSEQ:FocusSelect := FSEL_ALL
oDCSEQ:FieldSpec := PADRAO_NUM_03{}

oDCSSQ := SingleLineEdit{self,ResourceID{JIMPPF_SSQ,_GetInst()}}
oDCSSQ:HyperLabel := HyperLabel{#SSQ,NULL_STRING,NULL_STRING,NULL_STRING}
oDCSSQ:FocusSelect := FSEL_ALL
oDCSSQ:FieldSpec := PADRAO_NUM_03{}

oDCFixedText3 := FixedText{self,ResourceID{JIMPPF_FIXEDTEXT3,_GetInst()}}
oDCFixedText3:HyperLabel := HyperLabel{#FixedText3,"Sequencia",NULL_STRING,NULL_STRING}

oCCesccod := PushButton{self,ResourceID{JIMPPF_ESCCOD,_GetInst()}}
oCCesccod:HyperLabel := HyperLabel{#esccod,"...",NULL_STRING,NULL_STRING}

oDCFixedText4 := FixedText{self,ResourceID{JIMPPF_FIXEDTEXT4,_GetInst()}}
oDCFixedText4:HyperLabel := HyperLabel{#FixedText4,"Retornar",NULL_STRING,NULL_STRING}

oCCencerrar := PushButton{self,ResourceID{JIMPPF_ENCERRAR,_GetInst()}}
oCCencerrar:HyperLabel := HyperLabel{#encerrar,NULL_STRING,NULL_STRING,NULL_STRING}
oCCencerrar:Image := ICO_SAIR{}

oCCchkseq := PushButton{self,ResourceID{JIMPPF_CHKSEQ,_GetInst()}}
oCCchkseq:HyperLabel := HyperLabel{#chkseq,"Checar Seq/Comp",NULL_STRING,NULL_STRING}

oCCpegcod := PushButton{self,ResourceID{JIMPPF_PEGCOD,_GetInst()}}
oCCpegcod:HyperLabel := HyperLabel{#pegcod,"-->",NULL_STRING,NULL_STRING}

oDClimpaMP := CheckBox{self,ResourceID{JIMPPF_LIMPAMP,_GetInst()}}
oDClimpaMP:HyperLabel := HyperLabel{#limpaMP,"Apagar Anteriores",NULL_STRING,NULL_STRING}

oDClimpaCO := CheckBox{self,ResourceID{JIMPPF_LIMPACO,_GetInst()}}
oDClimpaCO:HyperLabel := HyperLabel{#limpaCO,"Apagar Anteriores",NULL_STRING,NULL_STRING}

oDClimpaMO := CheckBox{self,ResourceID{JIMPPF_LIMPAMO,_GetInst()}}
oDClimpaMO:HyperLabel := HyperLabel{#limpaMO,"Apagar Anteriores",NULL_STRING,NULL_STRING}

oDClimpaSQ := CheckBox{self,ResourceID{JIMPPF_LIMPASQ,_GetInst()}}
oDClimpaSQ:HyperLabel := HyperLabel{#limpaSQ,"Apagar Anteriores",NULL_STRING,NULL_STRING}

oCCescpf := PushButton{self,ResourceID{JIMPPF_ESCPF,_GetInst()}}
oCCescpf:HyperLabel := HyperLabel{#escpf,"...",NULL_STRING,NULL_STRING}

oDCtexto := FixedText{self,ResourceID{JIMPPF_TEXTO,_GetInst()}}
oDCtexto:HyperLabel := HyperLabel{#texto,"Fixed Text",NULL_STRING,NULL_STRING}

oDCSC_DESTINO2 := FixedText{self,ResourceID{JIMPPF_SC_DESTINO2,_GetInst()}}
oDCSC_DESTINO2:HyperLabel := HyperLabel{#SC_DESTINO2,"Foto",NULL_STRING,NULL_STRING}

oCCfoto := PushButton{self,ResourceID{JIMPPF_FOTO,_GetInst()}}
oCCfoto:HyperLabel := HyperLabel{#foto,NULL_STRING,NULL_STRING,NULL_STRING}
oCCfoto:Image := ICO_CAMERA{}

oCCImpTudo := PushButton{self,ResourceID{JIMPPF_IMPTUDO,_GetInst()}}
oCCImpTudo:HyperLabel := HyperLabel{#ImpTudo,"Importar Tudo",NULL_STRING,NULL_STRING}

oCCAtuMs06 := PushButton{self,ResourceID{JIMPPF_ATUMS06,_GetInst()}}
oCCAtuMs06:HyperLabel := HyperLabel{#AtuMs06,"Atualizar MS06",NULL_STRING,NULL_STRING}

self:Caption := "DataDialog Caption"
self:HyperLabel := HyperLabel{#jimppf,"DataDialog Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access limpaCO() 
return self:FieldGet(#limpaCO)


assign limpaCO(uValue) 
self:FieldPut(#limpaCO, uValue)
return limpaCO := uValue


access limpaMO() 
return self:FieldGet(#limpaMO)


assign limpaMO(uValue) 
self:FieldPut(#limpaMO, uValue)
return limpaMO := uValue


access limpaMP() 
return self:FieldGet(#limpaMP)


assign limpaMP(uValue) 
self:FieldPut(#limpaMP, uValue)
return limpaMP := uValue


access limpaSQ() 
return self:FieldGet(#limpaSQ)


assign limpaSQ(uValue) 
self:FieldPut(#limpaSQ, uValue)
return limpaSQ := uValue


access nPF() 
return self:FieldGet(#nPF)


assign nPF(uValue) 
self:FieldPut(#nPF, uValue)
return nPF := uValue


METHOD PostInit(oWindow,iCtlID,oServer,uExtra) 
	//Put your PostInit additions here
		    FabCenterWindow( SELF )
	RETURN NIL


access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


access SSQ() 
return self:FieldGet(#SSQ)


assign SSQ(uValue) 
self:FieldPut(#SSQ, uValue)
return SSQ := uValue


END CLASS
