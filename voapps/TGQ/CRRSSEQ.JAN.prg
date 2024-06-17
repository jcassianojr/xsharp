#region DEFINES
STATIC DEFINE CRRSSEQTAB1_ANUAL := 117 
STATIC DEFINE CRRSSEQTAB1_CMDANUAL := 119 
STATIC DEFINE CRRSSEQTAB1_CMDSEMES := 120 
STATIC DEFINE CRRSSEQTAB1_DEV := 108 
STATIC DEFINE CRRSSEQTAB1_GROUPBOX1 := 115 
STATIC DEFINE CRRSSEQTAB1_GROUPBOX2 := 116 
STATIC DEFINE CRRSSEQTAB1_NUMFUN := 129 
STATIC DEFINE CRRSSEQTAB1_NUMREG := 127 
STATIC DEFINE CRRSSEQTAB1_NUMTEM := 128 
STATIC DEFINE CRRSSEQTAB1_PPMDEV := 103 
STATIC DEFINE CRRSSEQTAB1_PPMMES := 101 
STATIC DEFINE CRRSSEQTAB1_PPMRET := 104 
STATIC DEFINE CRRSSEQTAB1_PPMSUC := 102 
STATIC DEFINE CRRSSEQTAB1_PRODMES := 105 
STATIC DEFINE CRRSSEQTAB1_PRODMY := 121 
STATIC DEFINE CRRSSEQTAB1_PRODNF := 100 
STATIC DEFINE CRRSSEQTAB1_RET := 109 
STATIC DEFINE CRRSSEQTAB1_SC_DEV := 113 
STATIC DEFINE CRRSSEQTAB1_SC_DEV1 := 114 
STATIC DEFINE CRRSSEQTAB1_SC_DEV2 := 112 
STATIC DEFINE CRRSSEQTAB1_SC_DEV3 := 111 
STATIC DEFINE CRRSSEQTAB1_SC_PRODMES := 110 
STATIC DEFINE CRRSSEQTAB1_SC_PRODMES1 := 122 
STATIC DEFINE CRRSSEQTAB1_SC_PRODMES2 := 123 
STATIC DEFINE CRRSSEQTAB1_SC_PRODMES3 := 124 
STATIC DEFINE CRRSSEQTAB1_SC_PRODMES4 := 125 
STATIC DEFINE CRRSSEQTAB1_SC_PRODMES5 := 126 
STATIC DEFINE CRRSSEQTAB1_SEMES := 118 
STATIC DEFINE CRRSSEQTAB1_SOMAFUN := 130 
STATIC DEFINE CRRSSEQTAB1_SUC := 107 
STATIC DEFINE CRRSSEQTAB1_TOTMES := 106 
STATIC DEFINE CRRSSEQTAB2_PLANO01 := 100 
STATIC DEFINE CRRSSEQTAB2_PLANO02 := 101 
STATIC DEFINE CRRSSEQTAB2_PLANO03 := 102 
STATIC DEFINE CRRSSEQTAB2_PLANO04 := 103 
STATIC DEFINE CRRSSEQTAB2_PLANO05 := 104 
STATIC DEFINE CRRSSEQTAB2_PLANO06 := 105 
STATIC DEFINE CRRSSEQTAB2_PLANO07 := 106 
STATIC DEFINE CRRSSEQTAB3_ACAO01 := 100 
STATIC DEFINE CRRSSEQTAB3_ACAO02 := 101 
STATIC DEFINE CRRSSEQTAB3_ACAO03 := 102 
STATIC DEFINE CRRSSEQTAB3_ACAO04 := 103 
STATIC DEFINE CRRSSEQTAB3_ACAO05 := 104 
STATIC DEFINE CRRSSEQTAB3_ACAO06 := 106 
STATIC DEFINE CRRSSEQTAB3_ACAO07 := 105 
STATIC DEFINE JCRRSSEQ_ANO := 103 
STATIC DEFINE JCRRSSEQ_APUANU := 121 
STATIC DEFINE JCRRSSEQ_APURANDO := 123 
STATIC DEFINE JCRRSSEQ_APURARCLI := 117 
STATIC DEFINE JCRRSSEQ_APURARCLI1 := 127 
STATIC DEFINE JCRRSSEQ_APURARERR := 115 
STATIC DEFINE JCRRSSEQ_APURARMY := 133 
STATIC DEFINE JCRRSSEQ_APURARPRD := 116 
STATIC DEFINE JCRRSSEQ_APURARPRD1 := 128 
STATIC DEFINE JCRRSSEQ_APURARSINT54 := 130 
STATIC DEFINE JCRRSSEQ_APURARSINT55 := 131 
STATIC DEFINE JCRRSSEQ_APUSEM := 120 
STATIC DEFINE JCRRSSEQ_APUSEMACU := 118 
STATIC DEFINE JCRRSSEQ_BUSCANUM := 125 
STATIC DEFINE JCRRSSEQ_DESCR2 := 105 
STATIC DEFINE JCRRSSEQ_DESCRI := 104 
STATIC DEFINE JCRRSSEQ_DIAFIM := 101 
STATIC DEFINE JCRRSSEQ_DIAINI := 100 
STATIC DEFINE JCRRSSEQ_GROUPBOX1 := 119 
STATIC DEFINE JCRRSSEQ_GROUPBOX2 := 126 
STATIC DEFINE JCRRSSEQ_GROUPBOX3 := 129 
STATIC DEFINE JCRRSSEQ_GROUPBOX4 := 132 
STATIC DEFINE JCRRSSEQ_GROUPBOX5 := 134 
STATIC DEFINE JCRRSSEQ_LIMPAR := 114 
STATIC DEFINE JCRRSSEQ_MES := 102 
STATIC DEFINE JCRRSSEQ_PEGCOMP := 113 
STATIC DEFINE JCRRSSEQ_PORNUM := 124 
STATIC DEFINE JCRRSSEQ_PROGBAR := 135 
STATIC DEFINE JCRRSSEQ_SC_ANO := 110 
STATIC DEFINE JCRRSSEQ_SC_DESCRI := 109 
STATIC DEFINE JCRRSSEQ_SC_DIAFIM := 111 
STATIC DEFINE JCRRSSEQ_SC_DIAINI := 107 
STATIC DEFINE JCRRSSEQ_SC_MES := 108 
STATIC DEFINE JCRRSSEQ_SC_SEQ := 106 
STATIC DEFINE JCRRSSEQ_SEQ := 112 
STATIC DEFINE JCRRSSEQ_TABCONTROL1 := 122 
#endregion

PARTIAL class crrsseqtab1 inherit DATAWINDOW 

	protect oDCPRODNF as RIGHTSLE
	protect oDCPPMMES as RIGHTSLE
	protect oDCPPMSUC as RIGHTSLE
	protect oDCPPMDEV as RIGHTSLE
	protect oDCPPMRET as RIGHTSLE
	protect oDCPRODMES as RIGHTSLE
	protect oDCTOTMES as RIGHTSLE
	protect oDCSUC as RIGHTSLE
	protect oDCDEV as RIGHTSLE
	protect oDCRET as RIGHTSLE
	protect oDCSC_PRODMES as FIXEDTEXT
	protect oDCSC_DEV3 as FIXEDTEXT
	protect oDCSC_DEV2 as FIXEDTEXT
	protect oDCSC_DEV as FIXEDTEXT
	protect oDCSC_DEV1 as FIXEDTEXT
	protect oDCGroupBox1 as GROUPBOX
	protect oDCGroupBox2 as GROUPBOX
	protect oDCANUAL as SINGLELINEEDIT
	protect oDCSEMES as SINGLELINEEDIT
	protect oCCcmdAnual as PUSHBUTTON
	protect oCCcmdSemes as PUSHBUTTON
	protect oDCPRODMY as RIGHTSLE
	protect oDCSC_PRODMES1 as FIXEDTEXT
	protect oDCSC_PRODMES2 as FIXEDTEXT
	protect oDCSC_PRODMES3 as FIXEDTEXT
	protect oDCSC_PRODMES4 as FIXEDTEXT
	protect oDCSC_PRODMES5 as FIXEDTEXT
	protect oDCNUMREG as SINGLELINEEDIT
	protect oDCNUMTEM as SINGLELINEEDIT
	protect oDCNUMFUN as SINGLELINEEDIT
	protect oCCSomafun as PUSHBUTTON
// 	instance PRODNF 
// 	instance PPMMES 
// 	instance PPMSUC 
// 	instance PPMDEV 
// 	instance PPMRET 
// 	instance PRODMES 
// 	instance TOTMES 
// 	instance SUC 
// 	instance DEV 
// 	instance RET 
// 	instance ANUAL 
// 	instance SEMES 
// 	instance PRODMY 
// 	instance NUMREG 
// 	instance NUMTEM 
// 	instance NUMFUN 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANUAL() 
return self:FieldGet(#ANUAL)


assign ANUAL(uValue) 
self:FieldPut(#ANUAL, uValue)
return ANUAL := uValue


access DEV() 
return self:FieldGet(#DEV)


assign DEV(uValue) 
self:FieldPut(#DEV, uValue)
return DEV := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"crrsseqtab1",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCPRODNF := rightSle{self,ResourceID{CRRSSEQTAB1_PRODNF,_GetInst()}}
oDCPRODNF:FieldSpec := PADRAO_NUM_12{}
oDCPRODNF:HyperLabel := HyperLabel{#PRODNF,"Prodnf:",NULL_STRING,"CRRSSEQ_PRODNF"}
oDCPRODNF:BackGround := aBrushes[1]
oDCPRODNF:Font(aFonts[1], FALSE)

oDCPPMMES := rightSle{self,ResourceID{CRRSSEQTAB1_PPMMES,_GetInst()}}
oDCPPMMES:FieldSpec := PADRAO_NUM_12{}
oDCPPMMES:HyperLabel := HyperLabel{#PPMMES,"Ppmmes:",NULL_STRING,"CRRSSEQ_PPMMES"}
oDCPPMMES:BackGround := aBrushes[1]
oDCPPMMES:Font(aFonts[1], FALSE)

oDCPPMSUC := rightSle{self,ResourceID{CRRSSEQTAB1_PPMSUC,_GetInst()}}
oDCPPMSUC:FieldSpec := PADRAO_NUM_12{}
oDCPPMSUC:HyperLabel := HyperLabel{#PPMSUC,"Ppmsuc:",NULL_STRING,"CRRSSEQ_PPMSUC"}
oDCPPMSUC:BackGround := aBrushes[1]
oDCPPMSUC:Font(aFonts[1], FALSE)

oDCPPMDEV := rightSle{self,ResourceID{CRRSSEQTAB1_PPMDEV,_GetInst()}}
oDCPPMDEV:FieldSpec := PADRAO_NUM_12{}
oDCPPMDEV:HyperLabel := HyperLabel{#PPMDEV,"Ppmdev:",NULL_STRING,"CRRSSEQ_PPMDEV"}
oDCPPMDEV:BackGround := aBrushes[1]
oDCPPMDEV:Font(aFonts[1], FALSE)

oDCPPMRET := rightSle{self,ResourceID{CRRSSEQTAB1_PPMRET,_GetInst()}}
oDCPPMRET:FieldSpec := PADRAO_NUM_12{}
oDCPPMRET:HyperLabel := HyperLabel{#PPMRET,"Ppmret:",NULL_STRING,"CRRSSEQ_PPMRET"}
oDCPPMRET:BackGround := aBrushes[1]
oDCPPMRET:Font(aFonts[1], FALSE)

oDCPRODMES := rightSle{self,ResourceID{CRRSSEQTAB1_PRODMES,_GetInst()}}
oDCPRODMES:FieldSpec := PADRAO_NUM_12{}
oDCPRODMES:HyperLabel := HyperLabel{#PRODMES,"Prodmes:",NULL_STRING,"CRRSSEQ_PRODMES"}
oDCPRODMES:BackGround := aBrushes[1]
oDCPRODMES:Font(aFonts[1], FALSE)

oDCTOTMES := rightSle{self,ResourceID{CRRSSEQTAB1_TOTMES,_GetInst()}}
oDCTOTMES:FieldSpec := PADRAO_NUM_12{}
oDCTOTMES:HyperLabel := HyperLabel{#TOTMES,"Totmes:",NULL_STRING,"CRRSSEQ_TOTMES"}
oDCTOTMES:BackGround := aBrushes[1]
oDCTOTMES:Font(aFonts[1], FALSE)

oDCSUC := rightSle{self,ResourceID{CRRSSEQTAB1_SUC,_GetInst()}}
oDCSUC:FieldSpec := PADRAO_NUM_12{}
oDCSUC:HyperLabel := HyperLabel{#SUC,"Suc:",NULL_STRING,"CRRSSEQ_SUC"}
oDCSUC:BackGround := aBrushes[1]
oDCSUC:Font(aFonts[1], FALSE)

oDCDEV := rightSle{self,ResourceID{CRRSSEQTAB1_DEV,_GetInst()}}
oDCDEV:FieldSpec := PADRAO_NUM_12{}
oDCDEV:HyperLabel := HyperLabel{#DEV,"Dev:",NULL_STRING,"CRRSSEQ_DEV"}
oDCDEV:BackGround := aBrushes[1]
oDCDEV:Font(aFonts[1], FALSE)

oDCRET := rightSle{self,ResourceID{CRRSSEQTAB1_RET,_GetInst()}}
oDCRET:FieldSpec := PADRAO_NUM_12{}
oDCRET:HyperLabel := HyperLabel{#RET,"Ret:",NULL_STRING,"CRRSSEQ_RET"}
oDCRET:BackGround := aBrushes[1]
oDCRET:Font(aFonts[1], FALSE)

oDCSC_PRODMES := FixedText{self,ResourceID{CRRSSEQTAB1_SC_PRODMES,_GetInst()}}
oDCSC_PRODMES:HyperLabel := HyperLabel{#SC_PRODMES,"Qtde Prod",NULL_STRING,NULL_STRING}

oDCSC_DEV3 := FixedText{self,ResourceID{CRRSSEQTAB1_SC_DEV3,_GetInst()}}
oDCSC_DEV3:HyperLabel := HyperLabel{#SC_DEV3,"Total Mes",NULL_STRING,NULL_STRING}

oDCSC_DEV2 := FixedText{self,ResourceID{CRRSSEQTAB1_SC_DEV2,_GetInst()}}
oDCSC_DEV2:HyperLabel := HyperLabel{#SC_DEV2,"Sucata",NULL_STRING,NULL_STRING}

oDCSC_DEV := FixedText{self,ResourceID{CRRSSEQTAB1_SC_DEV,_GetInst()}}
oDCSC_DEV:HyperLabel := HyperLabel{#SC_DEV,"Devolução",NULL_STRING,NULL_STRING}

oDCSC_DEV1 := FixedText{self,ResourceID{CRRSSEQTAB1_SC_DEV1,_GetInst()}}
oDCSC_DEV1:HyperLabel := HyperLabel{#SC_DEV1,"Retrabalho",NULL_STRING,NULL_STRING}

oDCGroupBox1 := GroupBox{self,ResourceID{CRRSSEQTAB1_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Anual",NULL_STRING,NULL_STRING}

oDCGroupBox2 := GroupBox{self,ResourceID{CRRSSEQTAB1_GROUPBOX2,_GetInst()}}
oDCGroupBox2:HyperLabel := HyperLabel{#GroupBox2,"Semestral",NULL_STRING,NULL_STRING}

oDCANUAL := SingleLineEdit{self,ResourceID{CRRSSEQTAB1_ANUAL,_GetInst()}}
oDCANUAL:FieldSpec := PADRAO_CHAR_01{}
oDCANUAL:HyperLabel := HyperLabel{#ANUAL,NULL_STRING,NULL_STRING,NULL_STRING}
oDCANUAL:BackGround := aBrushes[1]
oDCANUAL:Font(aFonts[1], FALSE)

oDCSEMES := SingleLineEdit{self,ResourceID{CRRSSEQTAB1_SEMES,_GetInst()}}
oDCSEMES:FieldSpec := PADRAO_CHAR_01{}
oDCSEMES:HyperLabel := HyperLabel{#SEMES,NULL_STRING,NULL_STRING,NULL_STRING}
oDCSEMES:BackGround := aBrushes[1]
oDCSEMES:Font(aFonts[1], FALSE)

oCCcmdAnual := PushButton{self,ResourceID{CRRSSEQTAB1_CMDANUAL,_GetInst()}}
oCCcmdAnual:HyperLabel := HyperLabel{#cmdAnual,"Sim/Nao",NULL_STRING,NULL_STRING}

oCCcmdSemes := PushButton{self,ResourceID{CRRSSEQTAB1_CMDSEMES,_GetInst()}}
oCCcmdSemes:HyperLabel := HyperLabel{#cmdSemes,"Sim/Nao",NULL_STRING,NULL_STRING}

oDCPRODMY := rightSle{self,ResourceID{CRRSSEQTAB1_PRODMY,_GetInst()}}
oDCPRODMY:FieldSpec := PADRAO_NUM_12{}
oDCPRODMY:HyperLabel := HyperLabel{#PRODMY,"Prodmes:",NULL_STRING,"CRRSSEQ_PRODMES"}
oDCPRODMY:BackGround := aBrushes[1]
oDCPRODMY:Font(aFonts[1], FALSE)

oDCSC_PRODMES1 := FixedText{self,ResourceID{CRRSSEQTAB1_SC_PRODMES1,_GetInst()}}
oDCSC_PRODMES1:HyperLabel := HyperLabel{#SC_PRODMES1,"Ent.Estoque",NULL_STRING,NULL_STRING}

oDCSC_PRODMES2 := FixedText{self,ResourceID{CRRSSEQTAB1_SC_PRODMES2,_GetInst()}}
oDCSC_PRODMES2:HyperLabel := HyperLabel{#SC_PRODMES2,"Qtde Faturada",NULL_STRING,NULL_STRING}

oDCSC_PRODMES3 := FixedText{self,ResourceID{CRRSSEQTAB1_SC_PRODMES3,_GetInst()}}
oDCSC_PRODMES3:HyperLabel := HyperLabel{#SC_PRODMES3,"Ativos",NULL_STRING,NULL_STRING}

oDCSC_PRODMES4 := FixedText{self,ResourceID{CRRSSEQTAB1_SC_PRODMES4,_GetInst()}}
oDCSC_PRODMES4:HyperLabel := HyperLabel{#SC_PRODMES4,"Temp/Agencia",NULL_STRING,NULL_STRING}

oDCSC_PRODMES5 := FixedText{self,ResourceID{CRRSSEQTAB1_SC_PRODMES5,_GetInst()}}
oDCSC_PRODMES5:HyperLabel := HyperLabel{#SC_PRODMES5,"Total",NULL_STRING,NULL_STRING}

oDCNUMREG := SingleLineEdit{self,ResourceID{CRRSSEQTAB1_NUMREG,_GetInst()}}
oDCNUMREG:FieldSpec := PADRAO_NUM_04{}
oDCNUMREG:HyperLabel := HyperLabel{#NUMREG,NULL_STRING,NULL_STRING,NULL_STRING}

oDCNUMTEM := SingleLineEdit{self,ResourceID{CRRSSEQTAB1_NUMTEM,_GetInst()}}
oDCNUMTEM:FieldSpec := PADRAO_NUM_04{}
oDCNUMTEM:HyperLabel := HyperLabel{#NUMTEM,NULL_STRING,NULL_STRING,NULL_STRING}

oDCNUMFUN := SingleLineEdit{self,ResourceID{CRRSSEQTAB1_NUMFUN,_GetInst()}}
oDCNUMFUN:FieldSpec := PADRAO_NUM_04{}
oDCNUMFUN:HyperLabel := HyperLabel{#NUMFUN,NULL_STRING,NULL_STRING,NULL_STRING}

oCCSomafun := PushButton{self,ResourceID{CRRSSEQTAB1_SOMAFUN,_GetInst()}}
oCCSomafun:HyperLabel := HyperLabel{#Somafun,"+",NULL_STRING,NULL_STRING}

self:Caption := "Sequencia"
self:HyperLabel := HyperLabel{#crrsseqtab1,"Sequencia",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access NUMFUN() 
return self:FieldGet(#NUMFUN)


assign NUMFUN(uValue) 
self:FieldPut(#NUMFUN, uValue)
return NUMFUN := uValue


access NUMREG() 
return self:FieldGet(#NUMREG)


assign NUMREG(uValue) 
self:FieldPut(#NUMREG, uValue)
return NUMREG := uValue


access NUMTEM() 
return self:FieldGet(#NUMTEM)


assign NUMTEM(uValue) 
self:FieldPut(#NUMTEM, uValue)
return NUMTEM := uValue


access PPMDEV() 
return self:FieldGet(#PPMDEV)


assign PPMDEV(uValue) 
self:FieldPut(#PPMDEV, uValue)
return PPMDEV := uValue


access PPMMES() 
return self:FieldGet(#PPMMES)


assign PPMMES(uValue) 
self:FieldPut(#PPMMES, uValue)
return PPMMES := uValue


access PPMRET() 
return self:FieldGet(#PPMRET)


assign PPMRET(uValue) 
self:FieldPut(#PPMRET, uValue)
return PPMRET := uValue


access PPMSUC() 
return self:FieldGet(#PPMSUC)


assign PPMSUC(uValue) 
self:FieldPut(#PPMSUC, uValue)
return PPMSUC := uValue


access PRODMES() 
return self:FieldGet(#PRODMES)


assign PRODMES(uValue) 
self:FieldPut(#PRODMES, uValue)
return PRODMES := uValue


access PRODMY() 
return self:FieldGet(#PRODMY)


assign PRODMY(uValue) 
self:FieldPut(#PRODMY, uValue)
return PRODMY := uValue


access PRODNF() 
return self:FieldGet(#PRODNF)


assign PRODNF(uValue) 
self:FieldPut(#PRODNF, uValue)
return PRODNF := uValue


access RET() 
return self:FieldGet(#RET)


assign RET(uValue) 
self:FieldPut(#RET, uValue)
return RET := uValue


access SEMES() 
return self:FieldGet(#SEMES)


assign SEMES(uValue) 
self:FieldPut(#SEMES, uValue)
return SEMES := uValue


access SUC() 
return self:FieldGet(#SUC)


assign SUC(uValue) 
self:FieldPut(#SUC, uValue)
return SUC := uValue


access TOTMES() 
return self:FieldGet(#TOTMES)


assign TOTMES(uValue) 
self:FieldPut(#TOTMES, uValue)
return TOTMES := uValue


END CLASS
class crrsseqtab2 inherit DATAWINDOW 

	protect oDCPLANO01 as SINGLELINEEDIT
	protect oDCPLANO02 as SINGLELINEEDIT
	protect oDCPLANO03 as SINGLELINEEDIT
	protect oDCPLANO04 as SINGLELINEEDIT
	protect oDCPLANO05 as SINGLELINEEDIT
	protect oDCPLANO06 as SINGLELINEEDIT
	protect oDCPLANO07 as SINGLELINEEDIT
// 	instance PLANO01 
// 	instance PLANO02 
// 	instance PLANO03 
// 	instance PLANO04 
// 	instance PLANO05 
// 	instance PLANO06 
// 	instance PLANO07 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"crrsseqtab2",_GetInst()},iCtlID)

oDCPLANO01 := SingleLineEdit{self,ResourceID{CRRSSEQTAB2_PLANO01,_GetInst()}}
oDCPLANO01:FieldSpec := PADRAO_CHAR_120{}
oDCPLANO01:HyperLabel := HyperLabel{#PLANO01,"Plano01:",NULL_STRING,"CRRSSEQ_PLANO01"}

oDCPLANO02 := SingleLineEdit{self,ResourceID{CRRSSEQTAB2_PLANO02,_GetInst()}}
oDCPLANO02:FieldSpec := PADRAO_CHAR_120{}
oDCPLANO02:HyperLabel := HyperLabel{#PLANO02,"Plano02:",NULL_STRING,"CRRSSEQ_PLANO02"}

oDCPLANO03 := SingleLineEdit{self,ResourceID{CRRSSEQTAB2_PLANO03,_GetInst()}}
oDCPLANO03:FieldSpec := PADRAO_CHAR_120{}
oDCPLANO03:HyperLabel := HyperLabel{#PLANO03,"Plano03:",NULL_STRING,"CRRSSEQ_PLANO03"}

oDCPLANO04 := SingleLineEdit{self,ResourceID{CRRSSEQTAB2_PLANO04,_GetInst()}}
oDCPLANO04:FieldSpec := PADRAO_CHAR_120{}
oDCPLANO04:HyperLabel := HyperLabel{#PLANO04,"Plano04:",NULL_STRING,"CRRSSEQ_PLANO04"}

oDCPLANO05 := SingleLineEdit{self,ResourceID{CRRSSEQTAB2_PLANO05,_GetInst()}}
oDCPLANO05:FieldSpec := PADRAO_CHAR_120{}
oDCPLANO05:HyperLabel := HyperLabel{#PLANO05,"Plano05:",NULL_STRING,"CRRSSEQ_PLANO05"}

oDCPLANO06 := SingleLineEdit{self,ResourceID{CRRSSEQTAB2_PLANO06,_GetInst()}}
oDCPLANO06:FieldSpec := PADRAO_CHAR_120{}
oDCPLANO06:HyperLabel := HyperLabel{#PLANO06,"Plano06:",NULL_STRING,"CRRSSEQ_PLANO06"}

oDCPLANO07 := SingleLineEdit{self,ResourceID{CRRSSEQTAB2_PLANO07,_GetInst()}}
oDCPLANO07:FieldSpec := PADRAO_CHAR_120{}
oDCPLANO07:HyperLabel := HyperLabel{#PLANO07,"Plano07:",NULL_STRING,"CRRSSEQ_PLANO07"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#crrsseqtab2,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PLANO01() 
return self:FieldGet(#PLANO01)


assign PLANO01(uValue) 
self:FieldPut(#PLANO01, uValue)
return PLANO01 := uValue


access PLANO02() 
return self:FieldGet(#PLANO02)


assign PLANO02(uValue) 
self:FieldPut(#PLANO02, uValue)
return PLANO02 := uValue


access PLANO03() 
return self:FieldGet(#PLANO03)


assign PLANO03(uValue) 
self:FieldPut(#PLANO03, uValue)
return PLANO03 := uValue


access PLANO04() 
return self:FieldGet(#PLANO04)


assign PLANO04(uValue) 
self:FieldPut(#PLANO04, uValue)
return PLANO04 := uValue


access PLANO05() 
return self:FieldGet(#PLANO05)


assign PLANO05(uValue) 
self:FieldPut(#PLANO05, uValue)
return PLANO05 := uValue


access PLANO06() 
return self:FieldGet(#PLANO06)


assign PLANO06(uValue) 
self:FieldPut(#PLANO06, uValue)
return PLANO06 := uValue


access PLANO07() 
return self:FieldGet(#PLANO07)


assign PLANO07(uValue) 
self:FieldPut(#PLANO07, uValue)
return PLANO07 := uValue


END CLASS
class crrsseqtab3 inherit DATAWINDOW 

	protect oDCACAO01 as SINGLELINEEDIT
	protect oDCACAO02 as SINGLELINEEDIT
	protect oDCACAO03 as SINGLELINEEDIT
	protect oDCACAO04 as SINGLELINEEDIT
	protect oDCACAO05 as SINGLELINEEDIT
	protect oDCACAO07 as SINGLELINEEDIT
	protect oDCACAO06 as SINGLELINEEDIT
// 	instance ACAO01 
// 	instance ACAO02 
// 	instance ACAO03 
// 	instance ACAO04 
// 	instance ACAO05 
// 	instance ACAO07 
// 	instance ACAO06 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ACAO01() 
return self:FieldGet(#ACAO01)


assign ACAO01(uValue) 
self:FieldPut(#ACAO01, uValue)
return ACAO01 := uValue


access ACAO02() 
return self:FieldGet(#ACAO02)


assign ACAO02(uValue) 
self:FieldPut(#ACAO02, uValue)
return ACAO02 := uValue


access ACAO03() 
return self:FieldGet(#ACAO03)


assign ACAO03(uValue) 
self:FieldPut(#ACAO03, uValue)
return ACAO03 := uValue


access ACAO04() 
return self:FieldGet(#ACAO04)


assign ACAO04(uValue) 
self:FieldPut(#ACAO04, uValue)
return ACAO04 := uValue


access ACAO05() 
return self:FieldGet(#ACAO05)


assign ACAO05(uValue) 
self:FieldPut(#ACAO05, uValue)
return ACAO05 := uValue


access ACAO06() 
return self:FieldGet(#ACAO06)


assign ACAO06(uValue) 
self:FieldPut(#ACAO06, uValue)
return ACAO06 := uValue


access ACAO07() 
return self:FieldGet(#ACAO07)


assign ACAO07(uValue) 
self:FieldPut(#ACAO07, uValue)
return ACAO07 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"crrsseqtab3",_GetInst()},iCtlID)

oDCACAO01 := SingleLineEdit{self,ResourceID{CRRSSEQTAB3_ACAO01,_GetInst()}}
oDCACAO01:FieldSpec := PADRAO_CHAR_120{}
oDCACAO01:HyperLabel := HyperLabel{#ACAO01,"Acao01:",NULL_STRING,"CRRSSEQ_ACAO01"}

oDCACAO02 := SingleLineEdit{self,ResourceID{CRRSSEQTAB3_ACAO02,_GetInst()}}
oDCACAO02:FieldSpec := PADRAO_CHAR_120{}
oDCACAO02:HyperLabel := HyperLabel{#ACAO02,"Acao02:",NULL_STRING,"CRRSSEQ_ACAO02"}

oDCACAO03 := SingleLineEdit{self,ResourceID{CRRSSEQTAB3_ACAO03,_GetInst()}}
oDCACAO03:FieldSpec := PADRAO_CHAR_120{}
oDCACAO03:HyperLabel := HyperLabel{#ACAO03,"Acao03:",NULL_STRING,"CRRSSEQ_ACAO03"}

oDCACAO04 := SingleLineEdit{self,ResourceID{CRRSSEQTAB3_ACAO04,_GetInst()}}
oDCACAO04:FieldSpec := PADRAO_CHAR_120{}
oDCACAO04:HyperLabel := HyperLabel{#ACAO04,"Acao04:",NULL_STRING,"CRRSSEQ_ACAO04"}

oDCACAO05 := SingleLineEdit{self,ResourceID{CRRSSEQTAB3_ACAO05,_GetInst()}}
oDCACAO05:FieldSpec := PADRAO_CHAR_120{}
oDCACAO05:HyperLabel := HyperLabel{#ACAO05,"Acao05:",NULL_STRING,"CRRSSEQ_ACAO05"}

oDCACAO07 := SingleLineEdit{self,ResourceID{CRRSSEQTAB3_ACAO07,_GetInst()}}
oDCACAO07:FieldSpec := PADRAO_CHAR_120{}
oDCACAO07:HyperLabel := HyperLabel{#ACAO07,"Acao07:",NULL_STRING,"CRRSSEQ_ACAO07"}

oDCACAO06 := SingleLineEdit{self,ResourceID{CRRSSEQTAB3_ACAO06,_GetInst()}}
oDCACAO06:FieldSpec := PADRAO_CHAR_120{}
oDCACAO06:HyperLabel := HyperLabel{#ACAO06,"Acao05:",NULL_STRING,"CRRSSEQ_ACAO05"}

self:Caption := "DataWindow Caption"
self:HyperLabel := HyperLabel{#crrsseqtab3,"DataWindow Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


END CLASS
PARTIAL class JCRRSSEQ inherit MYDataWindow 

	PROTECT oDBSEQ as DataColumn
	PROTECT oDBMES as DataColumn
	PROTECT oDBANO as DataColumn
	PROTECT oDBDESCRI as DataColumn
	PROTECT oDBDIAINI as DataColumn
	PROTECT oDBDIAFIM as DataColumn
	protect oDCDIAINI as DATETIMEPICKER
	protect oDCDIAFIM as DATETIMEPICKER
	protect oDCMES as SINGLELINEEDIT
	protect oDCANO as SINGLELINEEDIT
	protect oDCDESCRI as SINGLELINEEDIT
	protect oDCDESCR2 as SINGLELINEEDIT
	protect oDCSC_SEQ as FIXEDTEXT
	protect oDCSC_DIAINI as FIXEDTEXT
	protect oDCSC_MES as FIXEDTEXT
	protect oDCSC_DESCRI as FIXEDTEXT
	protect oDCSC_ANO as FIXEDTEXT
	protect oDCSC_DIAFIM as FIXEDTEXT
	protect oDCSEQ as SINGLELINEEDIT
	protect oCCpegcomp as PUSHBUTTON
	protect oCCLimpar as PUSHBUTTON
	protect oCCApurarerr as PUSHBUTTON
	protect oCCApurarprd as PUSHBUTTON
	protect oCCApurarcli as PUSHBUTTON
	protect oCCapusemacu as PUSHBUTTON
	protect oDCGroupBox1 as GROUPBOX
	protect oCCapusem as PUSHBUTTON
	protect oCCapuanu as PUSHBUTTON
	protect oDCTabControl1 as TABCONTROL
	protect oTPCRRSSEQTAB1 as CRRSSEQTAB1
	protect oTPCRRSSEQTAB2 as CRRSSEQTAB2
	protect oTPCRRSSEQTAB3 as CRRSSEQTAB3
	protect oDCApurando as FIXEDTEXT
	protect oCCPORNUM as PUSHBUTTON
	protect oCCBuscanum as PUSHBUTTON
	protect oDCGroupBox2 as GROUPBOX
	protect oCCApurarcli1 as PUSHBUTTON
	protect oCCApurarprd1 as PUSHBUTTON
	protect oDCGroupBox3 as GROUPBOX
	protect oCCapurarsint54 as PUSHBUTTON
	protect oCCapurarsint55 as PUSHBUTTON
	protect oDCGroupBox4 as GROUPBOX
	protect oCCApurarmy as PUSHBUTTON
	protect oDCGroupBox5 as GROUPBOX
	protect oDCProgBar as PROGRESSBAR
// 	instance MES 
// 	instance ANO 
// 	instance DESCRI 
// 	instance DESCR2 
// 	instance SEQ 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANO() 
return self:FieldGet(#ANO)


assign ANO(uValue) 
self:FieldPut(#ANO, uValue)
return ANO := uValue


access DESCR2() 
return self:FieldGet(#DESCR2)


assign DESCR2(uValue) 
self:FieldPut(#DESCR2, uValue)
return DESCR2 := uValue


access DESCRI() 
return self:FieldGet(#DESCRI)


assign DESCRI(uValue) 
self:FieldPut(#DESCRI, uValue)
return DESCRI := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[2] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"JCRRSSEQ",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aFonts[2] := Font{,12,"Times New Roman"}
aFonts[2]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oDCDIAINI := DateTimePicker{self,ResourceID{JCRRSSEQ_DIAINI,_GetInst()}}
oDCDIAINI:FieldSpec := DATE_FIELD{}
oDCDIAINI:HyperLabel := HyperLabel{#DIAINI,"Inicio",NULL_STRING,NULL_STRING}

oDCDIAFIM := DateTimePicker{self,ResourceID{JCRRSSEQ_DIAFIM,_GetInst()}}
oDCDIAFIM:FieldSpec := DATE_FIELD{}
oDCDIAFIM:HyperLabel := HyperLabel{#DIAFIM,"Fim",NULL_STRING,NULL_STRING}

oDCMES := SingleLineEdit{self,ResourceID{JCRRSSEQ_MES,_GetInst()}}
oDCMES:FieldSpec := PADRAO_NUM_02{}
oDCMES:HyperLabel := HyperLabel{#MES,"Mes:",NULL_STRING,"CRTLP_MES"}
oDCMES:BackGround := aBrushes[1]
oDCMES:Font(aFonts[1], FALSE)

oDCANO := SingleLineEdit{self,ResourceID{JCRRSSEQ_ANO,_GetInst()}}
oDCANO:FieldSpec := PADRAO_NUM_04{}
oDCANO:HyperLabel := HyperLabel{#ANO,"Ano:",NULL_STRING,"CRTLP_ANO"}
oDCANO:BackGround := aBrushes[1]
oDCANO:Font(aFonts[1], FALSE)

oDCDESCRI := SingleLineEdit{self,ResourceID{JCRRSSEQ_DESCRI,_GetInst()}}
oDCDESCRI:FieldSpec := PADRAO_CHAR_30{}
oDCDESCRI:HyperLabel := HyperLabel{#DESCRI,"Competencia",NULL_STRING,"CRTLP_DESCRI"}
oDCDESCRI:BackGround := aBrushes[1]
oDCDESCRI:Font(aFonts[1], FALSE)

oDCDESCR2 := SingleLineEdit{self,ResourceID{JCRRSSEQ_DESCR2,_GetInst()}}
oDCDESCR2:FieldSpec := PADRAO_CHAR_10{}
oDCDESCR2:HyperLabel := HyperLabel{#DESCR2,"Descri:",NULL_STRING,"CRTLP_DESCRI"}
oDCDESCR2:BackGround := aBrushes[1]
oDCDESCR2:Font(aFonts[1], FALSE)

oDCSC_SEQ := FixedText{self,ResourceID{JCRRSSEQ_SC_SEQ,_GetInst()}}
oDCSC_SEQ:HyperLabel := HyperLabel{#SC_SEQ,"Seq:",NULL_STRING,NULL_STRING}

oDCSC_DIAINI := FixedText{self,ResourceID{JCRRSSEQ_SC_DIAINI,_GetInst()}}
oDCSC_DIAINI:HyperLabel := HyperLabel{#SC_DIAINI,"Início",NULL_STRING,NULL_STRING}

oDCSC_MES := FixedText{self,ResourceID{JCRRSSEQ_SC_MES,_GetInst()}}
oDCSC_MES:HyperLabel := HyperLabel{#SC_MES,"Mês:",NULL_STRING,NULL_STRING}

oDCSC_DESCRI := FixedText{self,ResourceID{JCRRSSEQ_SC_DESCRI,_GetInst()}}
oDCSC_DESCRI:HyperLabel := HyperLabel{#SC_DESCRI,"Descrição:",NULL_STRING,NULL_STRING}

oDCSC_ANO := FixedText{self,ResourceID{JCRRSSEQ_SC_ANO,_GetInst()}}
oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO,"Ano:",NULL_STRING,NULL_STRING}

oDCSC_DIAFIM := FixedText{self,ResourceID{JCRRSSEQ_SC_DIAFIM,_GetInst()}}
oDCSC_DIAFIM:HyperLabel := HyperLabel{#SC_DIAFIM,"Fim",NULL_STRING,NULL_STRING}

oDCSEQ := SingleLineEdit{self,ResourceID{JCRRSSEQ_SEQ,_GetInst()}}
oDCSEQ:FieldSpec := PADRAO_NUM_03{}
oDCSEQ:HyperLabel := HyperLabel{#SEQ,"Seq:",NULL_STRING,"CRTLP_SEQ"}
oDCSEQ:BackGround := aBrushes[1]
oDCSEQ:Font(aFonts[2], FALSE)

oCCpegcomp := PushButton{self,ResourceID{JCRRSSEQ_PEGCOMP,_GetInst()}}
oCCpegcomp:HyperLabel := HyperLabel{#pegcomp,"-->",NULL_STRING,NULL_STRING}

oCCLimpar := PushButton{self,ResourceID{JCRRSSEQ_LIMPAR,_GetInst()}}
oCCLimpar:HyperLabel := HyperLabel{#Limpar,"Limpar",NULL_STRING,NULL_STRING}

oCCApurarerr := PushButton{self,ResourceID{JCRRSSEQ_APURARERR,_GetInst()}}
oCCApurarerr:HyperLabel := HyperLabel{#Apurarerr,"RNC",NULL_STRING,NULL_STRING}

oCCApurarprd := PushButton{self,ResourceID{JCRRSSEQ_APURARPRD,_GetInst()}}
oCCApurarprd:HyperLabel := HyperLabel{#Apurarprd,"Produtos",NULL_STRING,NULL_STRING}

oCCApurarcli := PushButton{self,ResourceID{JCRRSSEQ_APURARCLI,_GetInst()}}
oCCApurarcli:HyperLabel := HyperLabel{#Apurarcli,"Cliente",NULL_STRING,NULL_STRING}

oCCapusemacu := PushButton{self,ResourceID{JCRRSSEQ_APUSEMACU,_GetInst()}}
oCCapusemacu:HyperLabel := HyperLabel{#apusemacu,"Semestral Acumulado",NULL_STRING,NULL_STRING}

oDCGroupBox1 := GroupBox{self,ResourceID{JCRRSSEQ_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Apurar",NULL_STRING,NULL_STRING}

oCCapusem := PushButton{self,ResourceID{JCRRSSEQ_APUSEM,_GetInst()}}
oCCapusem:HyperLabel := HyperLabel{#apusem,"Semestral",NULL_STRING,NULL_STRING}

oCCapuanu := PushButton{self,ResourceID{JCRRSSEQ_APUANU,_GetInst()}}
oCCapuanu:HyperLabel := HyperLabel{#apuanu,"Anual",NULL_STRING,NULL_STRING}

oDCTabControl1 := TabControl{self,ResourceID{JCRRSSEQ_TABCONTROL1,_GetInst()}}
oDCTabControl1:HyperLabel := HyperLabel{#TabControl1,NULL_STRING,NULL_STRING,NULL_STRING}

oDCApurando := FixedText{self,ResourceID{JCRRSSEQ_APURANDO,_GetInst()}}
oDCApurando:HyperLabel := HyperLabel{#Apurando,NULL_STRING,NULL_STRING,NULL_STRING}

oCCPORNUM := PushButton{self,ResourceID{JCRRSSEQ_PORNUM,_GetInst()}}
oCCPORNUM:Image := ico_az{}
oCCPORNUM:HyperLabel := HyperLabel{#PORNUM,NULL_STRING,NULL_STRING,NULL_STRING}

oCCBuscanum := PushButton{self,ResourceID{JCRRSSEQ_BUSCANUM,_GetInst()}}
oCCBuscanum:Image := ico_find{}
oCCBuscanum:HyperLabel := HyperLabel{#Buscanum,NULL_STRING,NULL_STRING,NULL_STRING}

oDCGroupBox2 := GroupBox{self,ResourceID{JCRRSSEQ_GROUPBOX2,_GetInst()}}
oDCGroupBox2:HyperLabel := HyperLabel{#GroupBox2,"Notas Fiscal Saidas",NULL_STRING,NULL_STRING}

oCCApurarcli1 := PushButton{self,ResourceID{JCRRSSEQ_APURARCLI1,_GetInst()}}
oCCApurarcli1:HyperLabel := HyperLabel{#Apurarcli1,"Cliente",NULL_STRING,NULL_STRING}

oCCApurarprd1 := PushButton{self,ResourceID{JCRRSSEQ_APURARPRD1,_GetInst()}}
oCCApurarprd1:HyperLabel := HyperLabel{#Apurarprd1,"Produtos",NULL_STRING,NULL_STRING}

oDCGroupBox3 := GroupBox{self,ResourceID{JCRRSSEQ_GROUPBOX3,_GetInst()}}
oDCGroupBox3:HyperLabel := HyperLabel{#GroupBox3,"IAC Importado",NULL_STRING,NULL_STRING}

oCCapurarsint54 := PushButton{self,ResourceID{JCRRSSEQ_APURARSINT54,_GetInst()}}
oCCapurarsint54:HyperLabel := HyperLabel{#apurarsint54,"Cliente",NULL_STRING,NULL_STRING}

oCCapurarsint55 := PushButton{self,ResourceID{JCRRSSEQ_APURARSINT55,_GetInst()}}
oCCapurarsint55:HyperLabel := HyperLabel{#apurarsint55,"Produtos",NULL_STRING,NULL_STRING}

oDCGroupBox4 := GroupBox{self,ResourceID{JCRRSSEQ_GROUPBOX4,_GetInst()}}
oDCGroupBox4:HyperLabel := HyperLabel{#GroupBox4,"Sintegra",NULL_STRING,NULL_STRING}

oCCApurarmy := PushButton{self,ResourceID{JCRRSSEQ_APURARMY,_GetInst()}}
oCCApurarmy:HyperLabel := HyperLabel{#Apurarmy,"Produtos",NULL_STRING,NULL_STRING}

oDCGroupBox5 := GroupBox{self,ResourceID{JCRRSSEQ_GROUPBOX5,_GetInst()}}
oDCGroupBox5:HyperLabel := HyperLabel{#GroupBox5,"Entrada Estoque",NULL_STRING,NULL_STRING}

oDCProgBar := ProgressBar{self,ResourceID{JCRRSSEQ_PROGBAR,_GetInst()}}
oDCProgBar:Range := Range{0,100}
oDCProgBar:HyperLabel := HyperLabel{#ProgBar,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "CRRS -  Sequencia"
self:HyperLabel := HyperLabel{#JCRRSSEQ,"CRRS -  Sequencia",NULL_STRING,NULL_STRING}
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBSEQ := DataColumn{PADRAO_NUM_03{}}
oDBSEQ:Width := 7
oDBSEQ:HyperLabel := oDCSEQ:HyperLabel 
oDBSEQ:Caption := "Seq:"
oDBSEQ:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBSEQ)

oDBMES := DataColumn{PADRAO_NUM_02{}}
oDBMES:Width := 7
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "Mes:"
oDBMES:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMES)

oDBANO := DataColumn{PADRAO_NUM_04{}}
oDBANO:Width := 10
oDBANO:HyperLabel := oDCANO:HyperLabel 
oDBANO:Caption := "Ano:"
oDBANO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBANO)

oDBDESCRI := DataColumn{PADRAO_CHAR_30{}}
oDBDESCRI:Width := 30
oDBDESCRI:HyperLabel := oDCDESCRI:HyperLabel 
oDBDESCRI:Caption := "Competencia"
oDBDESCRI:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBDESCRI)

oDBDIAINI := DataColumn{DATE_FIELD{}}
oDBDIAINI:Width := 12
oDBDIAINI:HyperLabel := oDCDIAINI:HyperLabel 
oDBDIAINI:Caption := "Inicio"
self:Browser:AddColumn(oDBDIAINI)

oDBDIAFIM := DataColumn{DATE_FIELD{}}
oDBDIAFIM:Width := 14
oDBDIAFIM:HyperLabel := oDCDIAFIM:HyperLabel 
oDBDIAFIM:Caption := "Fim"
self:Browser:AddColumn(oDBDIAFIM)


self:ViewAs(#FormView)
oTPCRRSSEQTAB1 := CRRSSEQTAB1{self, 0}
oDCTabControl1:AppendTab(#CRRSSEQTAB1,"Resumo",oTPCRRSSEQTAB1,0)
oTPCRRSSEQTAB2 := CRRSSEQTAB2{self, 0}
oDCTabControl1:AppendTab(#CRRSSEQTAB2,"Plano",oTPCRRSSEQTAB2,0)
oTPCRRSSEQTAB3 := CRRSSEQTAB3{self, 0}
oDCTabControl1:AppendTab(#CRRSSEQTAB3,"Açao",oTPCRRSSEQTAB3,0)
oDCTabControl1:SelectTab(#CRRSSEQTAB1)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MES() 
return self:FieldGet(#MES)


assign MES(uValue) 
self:FieldPut(#MES, uValue)
return MES := uValue


METHOD PORNUM( ) 
	SELF:KeyFind()

access SEQ() 
return self:FieldGet(#SEQ)


assign SEQ(uValue) 
self:FieldPut(#SEQ, uValue)
return SEQ := uValue


END CLASS
