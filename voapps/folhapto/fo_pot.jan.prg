#region DEFINES
STATIC DEFINE JFO_POT_ANO := 106 
STATIC DEFINE JFO_POT_BCOHRS := 109 
STATIC DEFINE JFO_POT_BUSCANUM := 174 
STATIC DEFINE JFO_POT_CMDORDENAR := 175 
STATIC DEFINE JFO_POT_CTA01 := 118 
STATIC DEFINE JFO_POT_CTA02 := 119 
STATIC DEFINE JFO_POT_CTA03 := 120 
STATIC DEFINE JFO_POT_CTA04 := 121 
STATIC DEFINE JFO_POT_CTA05 := 122 
STATIC DEFINE JFO_POT_CTA06 := 123 
STATIC DEFINE JFO_POT_CTA07 := 124 
STATIC DEFINE JFO_POT_CTA08 := 125 
STATIC DEFINE JFO_POT_CTA09 := 134 
STATIC DEFINE JFO_POT_CTA10 := 135 
STATIC DEFINE JFO_POT_CTA11 := 136 
STATIC DEFINE JFO_POT_CTA12 := 137 
STATIC DEFINE JFO_POT_CTA13 := 138 
STATIC DEFINE JFO_POT_CTA14 := 139 
STATIC DEFINE JFO_POT_CTA15 := 140 
STATIC DEFINE JFO_POT_CTA16 := 141 
STATIC DEFINE JFO_POT_MES := 107 
STATIC DEFINE JFO_POT_NOME := 108 
STATIC DEFINE JFO_POT_NUMERO := 105 
STATIC DEFINE JFO_POT_SC_ANO := 101 
STATIC DEFINE JFO_POT_SC_BCOHRS := 104 
STATIC DEFINE JFO_POT_SC_CTA01 := 110 
STATIC DEFINE JFO_POT_SC_CTA02 := 111 
STATIC DEFINE JFO_POT_SC_CTA03 := 112 
STATIC DEFINE JFO_POT_SC_CTA04 := 113 
STATIC DEFINE JFO_POT_SC_CTA05 := 114 
STATIC DEFINE JFO_POT_SC_CTA06 := 115 
STATIC DEFINE JFO_POT_SC_CTA07 := 116 
STATIC DEFINE JFO_POT_SC_CTA08 := 117 
STATIC DEFINE JFO_POT_SC_CTA09 := 126 
STATIC DEFINE JFO_POT_SC_CTA10 := 127 
STATIC DEFINE JFO_POT_SC_CTA11 := 128 
STATIC DEFINE JFO_POT_SC_CTA12 := 129 
STATIC DEFINE JFO_POT_SC_CTA13 := 130 
STATIC DEFINE JFO_POT_SC_CTA14 := 131 
STATIC DEFINE JFO_POT_SC_CTA15 := 132 
STATIC DEFINE JFO_POT_SC_CTA16 := 133 
STATIC DEFINE JFO_POT_SC_MES := 102 
STATIC DEFINE JFO_POT_SC_NOME := 103 
STATIC DEFINE JFO_POT_SC_NUMERO := 100 
STATIC DEFINE JFO_POT_SC_VAL01 := 142 
STATIC DEFINE JFO_POT_SC_VAL02 := 143 
STATIC DEFINE JFO_POT_SC_VAL03 := 144 
STATIC DEFINE JFO_POT_SC_VAL04 := 145 
STATIC DEFINE JFO_POT_SC_VAL05 := 146 
STATIC DEFINE JFO_POT_SC_VAL06 := 147 
STATIC DEFINE JFO_POT_SC_VAL07 := 148 
STATIC DEFINE JFO_POT_SC_VAL08 := 149 
STATIC DEFINE JFO_POT_SC_VAL09 := 158 
STATIC DEFINE JFO_POT_SC_VAL10 := 159 
STATIC DEFINE JFO_POT_SC_VAL11 := 160 
STATIC DEFINE JFO_POT_SC_VAL12 := 161 
STATIC DEFINE JFO_POT_SC_VAL13 := 162 
STATIC DEFINE JFO_POT_SC_VAL14 := 163 
STATIC DEFINE JFO_POT_SC_VAL15 := 164 
STATIC DEFINE JFO_POT_SC_VAL16 := 165 
STATIC DEFINE JFO_POT_VAL01 := 150 
STATIC DEFINE JFO_POT_VAL02 := 151 
STATIC DEFINE JFO_POT_VAL03 := 152 
STATIC DEFINE JFO_POT_VAL04 := 153 
STATIC DEFINE JFO_POT_VAL05 := 154 
STATIC DEFINE JFO_POT_VAL06 := 155 
STATIC DEFINE JFO_POT_VAL07 := 156 
STATIC DEFINE JFO_POT_VAL08 := 157 
STATIC DEFINE JFO_POT_VAL09 := 166 
STATIC DEFINE JFO_POT_VAL10 := 167 
STATIC DEFINE JFO_POT_VAL11 := 168 
STATIC DEFINE JFO_POT_VAL12 := 169 
STATIC DEFINE JFO_POT_VAL13 := 170 
STATIC DEFINE JFO_POT_VAL14 := 171 
STATIC DEFINE JFO_POT_VAL15 := 172 
STATIC DEFINE JFO_POT_VAL16 := 173 
#endregion

PARTIAL class Jfo_pot inherit MYDataWindow 

	PROTECT oDBANO as DataColumn
	PROTECT oDBMES as DataColumn
	PROTECT oDBNUMERO as DataColumn
	PROTECT oDBNOME as DataColumn
	protect oDCSC_NUMERO as FIXEDTEXT
	protect oDCSC_ANO as FIXEDTEXT
	protect oDCSC_MES as FIXEDTEXT
	protect oDCSC_NOME as FIXEDTEXT
	protect oDCSC_BCOHRS as FIXEDTEXT
	protect oDCNUMERO as SINGLELINEEDIT
	protect oDCANO as SINGLELINEEDIT
	protect oDCMES as SINGLELINEEDIT
	protect oDCNOME as SINGLELINEEDIT
	protect oDCBCOHRS as SINGLELINEEDIT
	protect oDCSC_CTA01 as FIXEDTEXT
	protect oDCSC_CTA02 as FIXEDTEXT
	protect oDCSC_CTA03 as FIXEDTEXT
	protect oDCSC_CTA04 as FIXEDTEXT
	protect oDCSC_CTA05 as FIXEDTEXT
	protect oDCSC_CTA06 as FIXEDTEXT
	protect oDCSC_CTA07 as FIXEDTEXT
	protect oDCSC_CTA08 as FIXEDTEXT
	protect oDCCTA01 as RIGHTSLE
	protect oDCCTA02 as RIGHTSLE
	protect oDCCTA03 as RIGHTSLE
	protect oDCCTA04 as RIGHTSLE
	protect oDCCTA05 as RIGHTSLE
	protect oDCCTA06 as RIGHTSLE
	protect oDCCTA07 as RIGHTSLE
	protect oDCCTA08 as RIGHTSLE
	protect oDCSC_CTA09 as FIXEDTEXT
	protect oDCSC_CTA10 as FIXEDTEXT
	protect oDCSC_CTA11 as FIXEDTEXT
	protect oDCSC_CTA12 as FIXEDTEXT
	protect oDCSC_CTA13 as FIXEDTEXT
	protect oDCSC_CTA14 as FIXEDTEXT
	protect oDCSC_CTA15 as FIXEDTEXT
	protect oDCSC_CTA16 as FIXEDTEXT
	protect oDCCTA09 as RIGHTSLE
	protect oDCCTA10 as RIGHTSLE
	protect oDCCTA11 as RIGHTSLE
	protect oDCCTA12 as RIGHTSLE
	protect oDCCTA13 as RIGHTSLE
	protect oDCCTA14 as RIGHTSLE
	protect oDCCTA15 as RIGHTSLE
	protect oDCCTA16 as RIGHTSLE
	protect oDCSC_VAL01 as FIXEDTEXT
	protect oDCSC_VAL02 as FIXEDTEXT
	protect oDCSC_VAL03 as FIXEDTEXT
	protect oDCSC_VAL04 as FIXEDTEXT
	protect oDCSC_VAL05 as FIXEDTEXT
	protect oDCSC_VAL06 as FIXEDTEXT
	protect oDCSC_VAL07 as FIXEDTEXT
	protect oDCSC_VAL08 as FIXEDTEXT
	protect oDCVAL01 as RIGHTSLE
	protect oDCVAL02 as RIGHTSLE
	protect oDCVAL03 as RIGHTSLE
	protect oDCVAL04 as RIGHTSLE
	protect oDCVAL05 as RIGHTSLE
	protect oDCVAL06 as RIGHTSLE
	protect oDCVAL07 as RIGHTSLE
	protect oDCVAL08 as RIGHTSLE
	protect oDCSC_VAL09 as FIXEDTEXT
	protect oDCSC_VAL10 as FIXEDTEXT
	protect oDCSC_VAL11 as FIXEDTEXT
	protect oDCSC_VAL12 as FIXEDTEXT
	protect oDCSC_VAL13 as FIXEDTEXT
	protect oDCSC_VAL14 as FIXEDTEXT
	protect oDCSC_VAL15 as FIXEDTEXT
	protect oDCSC_VAL16 as FIXEDTEXT
	protect oDCVAL09 as RIGHTSLE
	protect oDCVAL10 as RIGHTSLE
	protect oDCVAL11 as RIGHTSLE
	protect oDCVAL12 as RIGHTSLE
	protect oDCVAL13 as RIGHTSLE
	protect oDCVAL14 as RIGHTSLE
	protect oDCVAL15 as RIGHTSLE
	protect oDCVAL16 as RIGHTSLE
	protect oCCbuscaNUM as PUSHBUTTON
	protect oCCcmdordenar as PUSHBUTTON
// 	instance NUMERO 
// 	instance ANO 
// 	instance MES 
// 	instance NOME 
// 	instance BCOHRS 
// 	instance CTA01 
// 	instance CTA02 
// 	instance CTA03 
// 	instance CTA04 
// 	instance CTA05 
// 	instance CTA06 
// 	instance CTA07 
// 	instance CTA08 
// 	instance CTA09 
// 	instance CTA10 
// 	instance CTA11 
// 	instance CTA12 
// 	instance CTA13 
// 	instance CTA14 
// 	instance CTA15 
// 	instance CTA16 
// 	instance VAL01 
// 	instance VAL02 
// 	instance VAL03 
// 	instance VAL04 
// 	instance VAL05 
// 	instance VAL06 
// 	instance VAL07 
// 	instance VAL08 
// 	instance VAL09 
// 	instance VAL10 
// 	instance VAL11 
// 	instance VAL12 
// 	instance VAL13 
// 	instance VAL14 
// 	instance VAL15 
// 	instance VAL16 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

access ANO() 
return self:FieldGet(#ANO)


assign ANO(uValue) 
self:FieldPut(#ANO, uValue)
return ANO := uValue


access BCOHRS() 
return self:FieldGet(#BCOHRS)


assign BCOHRS(uValue) 
self:FieldPut(#BCOHRS, uValue)
return BCOHRS := uValue


access CTA01() 
return self:FieldGet(#CTA01)


assign CTA01(uValue) 
self:FieldPut(#CTA01, uValue)
return CTA01 := uValue


access CTA02() 
return self:FieldGet(#CTA02)


assign CTA02(uValue) 
self:FieldPut(#CTA02, uValue)
return CTA02 := uValue


access CTA03() 
return self:FieldGet(#CTA03)


assign CTA03(uValue) 
self:FieldPut(#CTA03, uValue)
return CTA03 := uValue


access CTA04() 
return self:FieldGet(#CTA04)


assign CTA04(uValue) 
self:FieldPut(#CTA04, uValue)
return CTA04 := uValue


access CTA05() 
return self:FieldGet(#CTA05)


assign CTA05(uValue) 
self:FieldPut(#CTA05, uValue)
return CTA05 := uValue


access CTA06() 
return self:FieldGet(#CTA06)


assign CTA06(uValue) 
self:FieldPut(#CTA06, uValue)
return CTA06 := uValue


access CTA07() 
return self:FieldGet(#CTA07)


assign CTA07(uValue) 
self:FieldPut(#CTA07, uValue)
return CTA07 := uValue


access CTA08() 
return self:FieldGet(#CTA08)


assign CTA08(uValue) 
self:FieldPut(#CTA08, uValue)
return CTA08 := uValue


access CTA09() 
return self:FieldGet(#CTA09)


assign CTA09(uValue) 
self:FieldPut(#CTA09, uValue)
return CTA09 := uValue


access CTA10() 
return self:FieldGet(#CTA10)


assign CTA10(uValue) 
self:FieldPut(#CTA10, uValue)
return CTA10 := uValue


access CTA11() 
return self:FieldGet(#CTA11)


assign CTA11(uValue) 
self:FieldPut(#CTA11, uValue)
return CTA11 := uValue


access CTA12() 
return self:FieldGet(#CTA12)


assign CTA12(uValue) 
self:FieldPut(#CTA12, uValue)
return CTA12 := uValue


access CTA13() 
return self:FieldGet(#CTA13)


assign CTA13(uValue) 
self:FieldPut(#CTA13, uValue)
return CTA13 := uValue


access CTA14() 
return self:FieldGet(#CTA14)


assign CTA14(uValue) 
self:FieldPut(#CTA14, uValue)
return CTA14 := uValue


access CTA15() 
return self:FieldGet(#CTA15)


assign CTA15(uValue) 
self:FieldPut(#CTA15, uValue)
return CTA15 := uValue


access CTA16() 
return self:FieldGet(#CTA16)


assign CTA16(uValue) 
self:FieldPut(#CTA16, uValue)
return CTA16 := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"Jfo_pot",_GetInst()},iCtlID)

aBrushes[1] := Brush{Color{255,255,200}}

oDCSC_NUMERO := FixedText{self,ResourceID{JFO_POT_SC_NUMERO,_GetInst()}}
oDCSC_NUMERO:HyperLabel := HyperLabel{#SC_NUMERO,"Numero:",NULL_STRING,NULL_STRING}

oDCSC_ANO := FixedText{self,ResourceID{JFO_POT_SC_ANO,_GetInst()}}
oDCSC_ANO:HyperLabel := HyperLabel{#SC_ANO,"Ano:",NULL_STRING,NULL_STRING}

oDCSC_MES := FixedText{self,ResourceID{JFO_POT_SC_MES,_GetInst()}}
oDCSC_MES:HyperLabel := HyperLabel{#SC_MES,"Mes:",NULL_STRING,NULL_STRING}

oDCSC_NOME := FixedText{self,ResourceID{JFO_POT_SC_NOME,_GetInst()}}
oDCSC_NOME:HyperLabel := HyperLabel{#SC_NOME,"Nome:",NULL_STRING,NULL_STRING}

oDCSC_BCOHRS := FixedText{self,ResourceID{JFO_POT_SC_BCOHRS,_GetInst()}}
oDCSC_BCOHRS:HyperLabel := HyperLabel{#SC_BCOHRS,"Bcohrs:",NULL_STRING,NULL_STRING}

oDCNUMERO := SingleLineEdit{self,ResourceID{JFO_POT_NUMERO,_GetInst()}}
oDCNUMERO:FieldSpec := PADRAO_NUM_08{}
oDCNUMERO:HyperLabel := HyperLabel{#NUMERO,"Numero:",NULL_STRING,"FO_POT_NUMERO"}
oDCNUMERO:TooltipText := "Numero Funcionario"
oDCNUMERO:BackGround := aBrushes[1]

oDCANO := SingleLineEdit{self,ResourceID{JFO_POT_ANO,_GetInst()}}
oDCANO:FieldSpec := PADRAO_NUM_04{}
oDCANO:HyperLabel := HyperLabel{#ANO,"Ano:",NULL_STRING,"FO_POT_ANO"}
oDCANO:TooltipText := "Ano"
oDCANO:BackGround := aBrushes[1]

oDCMES := SingleLineEdit{self,ResourceID{JFO_POT_MES,_GetInst()}}
oDCMES:FieldSpec := PADRAO_NUM_02{}
oDCMES:HyperLabel := HyperLabel{#MES,"Mes:",NULL_STRING,"FO_POT_MES"}
oDCMES:TooltipText := "Mes"
oDCMES:BackGround := aBrushes[1]

oDCNOME := SingleLineEdit{self,ResourceID{JFO_POT_NOME,_GetInst()}}
oDCNOME:FieldSpec := PADRAO_CHAR_30{}
oDCNOME:HyperLabel := HyperLabel{#NOME,"Nome:",NULL_STRING,"FO_POT_NOME"}
oDCNOME:BackGround := aBrushes[1]

oDCBCOHRS := SingleLineEdit{self,ResourceID{JFO_POT_BCOHRS,_GetInst()}}
oDCBCOHRS:FieldSpec := PADRAO_NUM_07_2{}
oDCBCOHRS:HyperLabel := HyperLabel{#BCOHRS,"Bcohrs:",NULL_STRING,"FO_POT_BCOHRS"}
oDCBCOHRS:TooltipText := "Horas Banco"
oDCBCOHRS:BackGround := aBrushes[1]

oDCSC_CTA01 := FixedText{self,ResourceID{JFO_POT_SC_CTA01,_GetInst()}}
oDCSC_CTA01:HyperLabel := HyperLabel{#SC_CTA01,"Cta01:",NULL_STRING,NULL_STRING}

oDCSC_CTA02 := FixedText{self,ResourceID{JFO_POT_SC_CTA02,_GetInst()}}
oDCSC_CTA02:HyperLabel := HyperLabel{#SC_CTA02,"Cta02:",NULL_STRING,NULL_STRING}

oDCSC_CTA03 := FixedText{self,ResourceID{JFO_POT_SC_CTA03,_GetInst()}}
oDCSC_CTA03:HyperLabel := HyperLabel{#SC_CTA03,"Cta03:",NULL_STRING,NULL_STRING}

oDCSC_CTA04 := FixedText{self,ResourceID{JFO_POT_SC_CTA04,_GetInst()}}
oDCSC_CTA04:HyperLabel := HyperLabel{#SC_CTA04,"Cta04:",NULL_STRING,NULL_STRING}

oDCSC_CTA05 := FixedText{self,ResourceID{JFO_POT_SC_CTA05,_GetInst()}}
oDCSC_CTA05:HyperLabel := HyperLabel{#SC_CTA05,"Cta05:",NULL_STRING,NULL_STRING}

oDCSC_CTA06 := FixedText{self,ResourceID{JFO_POT_SC_CTA06,_GetInst()}}
oDCSC_CTA06:HyperLabel := HyperLabel{#SC_CTA06,"Cta06:",NULL_STRING,NULL_STRING}

oDCSC_CTA07 := FixedText{self,ResourceID{JFO_POT_SC_CTA07,_GetInst()}}
oDCSC_CTA07:HyperLabel := HyperLabel{#SC_CTA07,"Cta07:",NULL_STRING,NULL_STRING}

oDCSC_CTA08 := FixedText{self,ResourceID{JFO_POT_SC_CTA08,_GetInst()}}
oDCSC_CTA08:HyperLabel := HyperLabel{#SC_CTA08,"Cta08:",NULL_STRING,NULL_STRING}

oDCCTA01 := rightSle{self,ResourceID{JFO_POT_CTA01,_GetInst()}}
oDCCTA01:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA01:HyperLabel := HyperLabel{#CTA01,"Cta01:",NULL_STRING,"FO_POT_CTA01"}
oDCCTA01:TooltipText := "Valor Conta"

oDCCTA02 := rightSle{self,ResourceID{JFO_POT_CTA02,_GetInst()}}
oDCCTA02:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA02:HyperLabel := HyperLabel{#CTA02,"Cta02:",NULL_STRING,"FO_POT_CTA02"}
oDCCTA02:TooltipText := "Valor Conta"

oDCCTA03 := rightSle{self,ResourceID{JFO_POT_CTA03,_GetInst()}}
oDCCTA03:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA03:HyperLabel := HyperLabel{#CTA03,"Cta03:",NULL_STRING,"FO_POT_CTA03"}
oDCCTA03:TooltipText := "Valor Conta"

oDCCTA04 := rightSle{self,ResourceID{JFO_POT_CTA04,_GetInst()}}
oDCCTA04:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA04:HyperLabel := HyperLabel{#CTA04,"Cta04:",NULL_STRING,"FO_POT_CTA04"}
oDCCTA04:TooltipText := "Valor Conta"

oDCCTA05 := rightSle{self,ResourceID{JFO_POT_CTA05,_GetInst()}}
oDCCTA05:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA05:HyperLabel := HyperLabel{#CTA05,"Cta05:",NULL_STRING,"FO_POT_CTA05"}
oDCCTA05:TooltipText := "Valor Conta"

oDCCTA06 := rightSle{self,ResourceID{JFO_POT_CTA06,_GetInst()}}
oDCCTA06:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA06:HyperLabel := HyperLabel{#CTA06,"Cta06:",NULL_STRING,"FO_POT_CTA06"}
oDCCTA06:TooltipText := "Valor Conta"

oDCCTA07 := rightSle{self,ResourceID{JFO_POT_CTA07,_GetInst()}}
oDCCTA07:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA07:HyperLabel := HyperLabel{#CTA07,"Cta07:",NULL_STRING,"FO_POT_CTA07"}
oDCCTA07:TooltipText := "Valor Conta"

oDCCTA08 := rightSle{self,ResourceID{JFO_POT_CTA08,_GetInst()}}
oDCCTA08:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA08:HyperLabel := HyperLabel{#CTA08,"Cta08:",NULL_STRING,"FO_POT_CTA08"}
oDCCTA08:TooltipText := "Valor Conta"

oDCSC_CTA09 := FixedText{self,ResourceID{JFO_POT_SC_CTA09,_GetInst()}}
oDCSC_CTA09:HyperLabel := HyperLabel{#SC_CTA09,"Cta09:",NULL_STRING,NULL_STRING}

oDCSC_CTA10 := FixedText{self,ResourceID{JFO_POT_SC_CTA10,_GetInst()}}
oDCSC_CTA10:HyperLabel := HyperLabel{#SC_CTA10,"Cta10:",NULL_STRING,NULL_STRING}

oDCSC_CTA11 := FixedText{self,ResourceID{JFO_POT_SC_CTA11,_GetInst()}}
oDCSC_CTA11:HyperLabel := HyperLabel{#SC_CTA11,"Cta11:",NULL_STRING,NULL_STRING}

oDCSC_CTA12 := FixedText{self,ResourceID{JFO_POT_SC_CTA12,_GetInst()}}
oDCSC_CTA12:HyperLabel := HyperLabel{#SC_CTA12,"Cta12:",NULL_STRING,NULL_STRING}

oDCSC_CTA13 := FixedText{self,ResourceID{JFO_POT_SC_CTA13,_GetInst()}}
oDCSC_CTA13:HyperLabel := HyperLabel{#SC_CTA13,"Cta13:",NULL_STRING,NULL_STRING}

oDCSC_CTA14 := FixedText{self,ResourceID{JFO_POT_SC_CTA14,_GetInst()}}
oDCSC_CTA14:HyperLabel := HyperLabel{#SC_CTA14,"Cta14:",NULL_STRING,NULL_STRING}

oDCSC_CTA15 := FixedText{self,ResourceID{JFO_POT_SC_CTA15,_GetInst()}}
oDCSC_CTA15:HyperLabel := HyperLabel{#SC_CTA15,"Cta15:",NULL_STRING,NULL_STRING}

oDCSC_CTA16 := FixedText{self,ResourceID{JFO_POT_SC_CTA16,_GetInst()}}
oDCSC_CTA16:HyperLabel := HyperLabel{#SC_CTA16,"Cta16:",NULL_STRING,NULL_STRING}

oDCCTA09 := rightSle{self,ResourceID{JFO_POT_CTA09,_GetInst()}}
oDCCTA09:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA09:HyperLabel := HyperLabel{#CTA09,"Cta09:",NULL_STRING,"FO_POT_CTA09"}
oDCCTA09:TooltipText := "Valor Conta"

oDCCTA10 := rightSle{self,ResourceID{JFO_POT_CTA10,_GetInst()}}
oDCCTA10:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA10:HyperLabel := HyperLabel{#CTA10,"Cta10:",NULL_STRING,"FO_POT_CTA10"}
oDCCTA10:TooltipText := "Valor Conta"

oDCCTA11 := rightSle{self,ResourceID{JFO_POT_CTA11,_GetInst()}}
oDCCTA11:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA11:HyperLabel := HyperLabel{#CTA11,"Cta11:",NULL_STRING,"FO_POT_CTA11"}
oDCCTA11:TooltipText := "Valor Conta"

oDCCTA12 := rightSle{self,ResourceID{JFO_POT_CTA12,_GetInst()}}
oDCCTA12:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA12:HyperLabel := HyperLabel{#CTA12,"Cta12:",NULL_STRING,"FO_POT_CTA12"}
oDCCTA12:TooltipText := "Valor Conta"

oDCCTA13 := rightSle{self,ResourceID{JFO_POT_CTA13,_GetInst()}}
oDCCTA13:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA13:HyperLabel := HyperLabel{#CTA13,"Cta13:",NULL_STRING,"FO_POT_CTA13"}
oDCCTA13:TooltipText := "Valor Conta"

oDCCTA14 := rightSle{self,ResourceID{JFO_POT_CTA14,_GetInst()}}
oDCCTA14:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA14:HyperLabel := HyperLabel{#CTA14,"Cta14:",NULL_STRING,"FO_POT_CTA14"}
oDCCTA14:TooltipText := "Valor Conta"

oDCCTA15 := rightSle{self,ResourceID{JFO_POT_CTA15,_GetInst()}}
oDCCTA15:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA15:HyperLabel := HyperLabel{#CTA15,"Cta15:",NULL_STRING,"FO_POT_CTA15"}
oDCCTA15:TooltipText := "Valor Conta"

oDCCTA16 := rightSle{self,ResourceID{JFO_POT_CTA16,_GetInst()}}
oDCCTA16:FieldSpec := PADRAO_NUM_07_2{}
oDCCTA16:HyperLabel := HyperLabel{#CTA16,"Cta16:",NULL_STRING,"FO_POT_CTA16"}
oDCCTA16:TooltipText := "Valor Conta"

oDCSC_VAL01 := FixedText{self,ResourceID{JFO_POT_SC_VAL01,_GetInst()}}
oDCSC_VAL01:HyperLabel := HyperLabel{#SC_VAL01,"Val01:",NULL_STRING,NULL_STRING}

oDCSC_VAL02 := FixedText{self,ResourceID{JFO_POT_SC_VAL02,_GetInst()}}
oDCSC_VAL02:HyperLabel := HyperLabel{#SC_VAL02,"Val02:",NULL_STRING,NULL_STRING}

oDCSC_VAL03 := FixedText{self,ResourceID{JFO_POT_SC_VAL03,_GetInst()}}
oDCSC_VAL03:HyperLabel := HyperLabel{#SC_VAL03,"Val03:",NULL_STRING,NULL_STRING}

oDCSC_VAL04 := FixedText{self,ResourceID{JFO_POT_SC_VAL04,_GetInst()}}
oDCSC_VAL04:HyperLabel := HyperLabel{#SC_VAL04,"Val04:",NULL_STRING,NULL_STRING}

oDCSC_VAL05 := FixedText{self,ResourceID{JFO_POT_SC_VAL05,_GetInst()}}
oDCSC_VAL05:HyperLabel := HyperLabel{#SC_VAL05,"Val05:",NULL_STRING,NULL_STRING}

oDCSC_VAL06 := FixedText{self,ResourceID{JFO_POT_SC_VAL06,_GetInst()}}
oDCSC_VAL06:HyperLabel := HyperLabel{#SC_VAL06,"Val06:",NULL_STRING,NULL_STRING}

oDCSC_VAL07 := FixedText{self,ResourceID{JFO_POT_SC_VAL07,_GetInst()}}
oDCSC_VAL07:HyperLabel := HyperLabel{#SC_VAL07,"Val07:",NULL_STRING,NULL_STRING}

oDCSC_VAL08 := FixedText{self,ResourceID{JFO_POT_SC_VAL08,_GetInst()}}
oDCSC_VAL08:HyperLabel := HyperLabel{#SC_VAL08,"Val08:",NULL_STRING,NULL_STRING}

oDCVAL01 := rightSle{self,ResourceID{JFO_POT_VAL01,_GetInst()}}
oDCVAL01:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL01:HyperLabel := HyperLabel{#VAL01,"Val01:",NULL_STRING,"FO_POT_VAL01"}
oDCVAL01:TooltipText := "Valor Conta"

oDCVAL02 := rightSle{self,ResourceID{JFO_POT_VAL02,_GetInst()}}
oDCVAL02:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL02:HyperLabel := HyperLabel{#VAL02,"Val02:",NULL_STRING,"FO_POT_VAL02"}
oDCVAL02:TooltipText := "Valor Conta"

oDCVAL03 := rightSle{self,ResourceID{JFO_POT_VAL03,_GetInst()}}
oDCVAL03:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL03:HyperLabel := HyperLabel{#VAL03,"Val03:",NULL_STRING,"FO_POT_VAL03"}
oDCVAL03:TooltipText := "Valor Conta"

oDCVAL04 := rightSle{self,ResourceID{JFO_POT_VAL04,_GetInst()}}
oDCVAL04:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL04:HyperLabel := HyperLabel{#VAL04,"Val04:",NULL_STRING,"FO_POT_VAL04"}
oDCVAL04:TooltipText := "Valor Conta"

oDCVAL05 := rightSle{self,ResourceID{JFO_POT_VAL05,_GetInst()}}
oDCVAL05:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL05:HyperLabel := HyperLabel{#VAL05,"Val05:",NULL_STRING,"FO_POT_VAL05"}
oDCVAL05:TooltipText := "Valor Conta"

oDCVAL06 := rightSle{self,ResourceID{JFO_POT_VAL06,_GetInst()}}
oDCVAL06:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL06:HyperLabel := HyperLabel{#VAL06,"Val06:",NULL_STRING,"FO_POT_VAL06"}
oDCVAL06:TooltipText := "Valor Conta"

oDCVAL07 := rightSle{self,ResourceID{JFO_POT_VAL07,_GetInst()}}
oDCVAL07:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL07:HyperLabel := HyperLabel{#VAL07,"Val07:",NULL_STRING,"FO_POT_VAL07"}
oDCVAL07:TooltipText := "Valor Conta"

oDCVAL08 := rightSle{self,ResourceID{JFO_POT_VAL08,_GetInst()}}
oDCVAL08:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL08:HyperLabel := HyperLabel{#VAL08,"Val08:",NULL_STRING,"FO_POT_VAL08"}
oDCVAL08:TooltipText := "Valor Conta"

oDCSC_VAL09 := FixedText{self,ResourceID{JFO_POT_SC_VAL09,_GetInst()}}
oDCSC_VAL09:HyperLabel := HyperLabel{#SC_VAL09,"Val09:",NULL_STRING,NULL_STRING}

oDCSC_VAL10 := FixedText{self,ResourceID{JFO_POT_SC_VAL10,_GetInst()}}
oDCSC_VAL10:HyperLabel := HyperLabel{#SC_VAL10,"Val10:",NULL_STRING,NULL_STRING}

oDCSC_VAL11 := FixedText{self,ResourceID{JFO_POT_SC_VAL11,_GetInst()}}
oDCSC_VAL11:HyperLabel := HyperLabel{#SC_VAL11,"Val11:",NULL_STRING,NULL_STRING}

oDCSC_VAL12 := FixedText{self,ResourceID{JFO_POT_SC_VAL12,_GetInst()}}
oDCSC_VAL12:HyperLabel := HyperLabel{#SC_VAL12,"Val12:",NULL_STRING,NULL_STRING}

oDCSC_VAL13 := FixedText{self,ResourceID{JFO_POT_SC_VAL13,_GetInst()}}
oDCSC_VAL13:HyperLabel := HyperLabel{#SC_VAL13,"Val13:",NULL_STRING,NULL_STRING}

oDCSC_VAL14 := FixedText{self,ResourceID{JFO_POT_SC_VAL14,_GetInst()}}
oDCSC_VAL14:HyperLabel := HyperLabel{#SC_VAL14,"Val14:",NULL_STRING,NULL_STRING}

oDCSC_VAL15 := FixedText{self,ResourceID{JFO_POT_SC_VAL15,_GetInst()}}
oDCSC_VAL15:HyperLabel := HyperLabel{#SC_VAL15,"Val15:",NULL_STRING,NULL_STRING}

oDCSC_VAL16 := FixedText{self,ResourceID{JFO_POT_SC_VAL16,_GetInst()}}
oDCSC_VAL16:HyperLabel := HyperLabel{#SC_VAL16,"Val16:",NULL_STRING,NULL_STRING}

oDCVAL09 := rightSle{self,ResourceID{JFO_POT_VAL09,_GetInst()}}
oDCVAL09:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL09:HyperLabel := HyperLabel{#VAL09,"Val09:",NULL_STRING,"FO_POT_VAL09"}
oDCVAL09:TooltipText := "Valor Conta"

oDCVAL10 := rightSle{self,ResourceID{JFO_POT_VAL10,_GetInst()}}
oDCVAL10:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL10:HyperLabel := HyperLabel{#VAL10,"Val10:",NULL_STRING,"FO_POT_VAL10"}
oDCVAL10:TooltipText := "Valor Conta"

oDCVAL11 := rightSle{self,ResourceID{JFO_POT_VAL11,_GetInst()}}
oDCVAL11:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL11:HyperLabel := HyperLabel{#VAL11,"Val11:",NULL_STRING,"FO_POT_VAL11"}
oDCVAL11:TooltipText := "Valor Conta"

oDCVAL12 := rightSle{self,ResourceID{JFO_POT_VAL12,_GetInst()}}
oDCVAL12:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL12:HyperLabel := HyperLabel{#VAL12,"Val12:",NULL_STRING,"FO_POT_VAL12"}
oDCVAL12:TooltipText := "Valor Conta"

oDCVAL13 := rightSle{self,ResourceID{JFO_POT_VAL13,_GetInst()}}
oDCVAL13:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL13:HyperLabel := HyperLabel{#VAL13,"Val13:",NULL_STRING,"FO_POT_VAL13"}
oDCVAL13:TooltipText := "Valor Conta"

oDCVAL14 := rightSle{self,ResourceID{JFO_POT_VAL14,_GetInst()}}
oDCVAL14:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL14:HyperLabel := HyperLabel{#VAL14,"Val14:",NULL_STRING,"FO_POT_VAL14"}
oDCVAL14:TooltipText := "Valor Conta"

oDCVAL15 := rightSle{self,ResourceID{JFO_POT_VAL15,_GetInst()}}
oDCVAL15:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL15:HyperLabel := HyperLabel{#VAL15,"Val15:",NULL_STRING,"FO_POT_VAL15"}
oDCVAL15:TooltipText := "Valor Conta"

oDCVAL16 := rightSle{self,ResourceID{JFO_POT_VAL16,_GetInst()}}
oDCVAL16:FieldSpec := PADRAO_NUM_12_2{}
oDCVAL16:HyperLabel := HyperLabel{#VAL16,"Val16:",NULL_STRING,"FO_POT_VAL16"}
oDCVAL16:TooltipText := "Valor Conta"

oCCbuscaNUM := PushButton{self,ResourceID{JFO_POT_BUSCANUM,_GetInst()}}
oCCbuscaNUM:Image := ico_find{}
oCCbuscaNUM:HyperLabel := HyperLabel{#buscaNUM,NULL_STRING,NULL_STRING,NULL_STRING}
oCCbuscaNUM:TooltipText := "Localizar"

oCCcmdordenar := PushButton{self,ResourceID{JFO_POT_CMDORDENAR,_GetInst()}}
oCCcmdordenar:Image := ico_az{}
oCCcmdordenar:HyperLabel := HyperLabel{#cmdordenar,NULL_STRING,NULL_STRING,NULL_STRING}

self:Caption := "Totais do Mes"
self:HyperLabel := HyperLabel{#Jfo_pot,"Totais do Mes",NULL_STRING,NULL_STRING}
self:ClipperKeys := True
self:Menu := STANDARDSHELLMENU{}

if !IsNil(oServer)
	self:Use(oServer)
endif
self:Browser := DataBrowser{self}

oDBANO := DataColumn{PADRAO_NUM_04{}}
oDBANO:Width := 8
oDBANO:HyperLabel := oDCANO:HyperLabel 
oDBANO:Caption := "Ano:"
oDBANO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBANO)

oDBMES := DataColumn{PADRAO_NUM_02{}}
oDBMES:Width := 9
oDBMES:HyperLabel := oDCMES:HyperLabel 
oDBMES:Caption := "Mes:"
oDBMES:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBMES)

oDBNUMERO := DataColumn{PADRAO_NUM_08{}}
oDBNUMERO:Width := 8
oDBNUMERO:HyperLabel := oDCNUMERO:HyperLabel 
oDBNUMERO:Caption := "Numero:"
oDBNUMERO:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNUMERO)

oDBNOME := DataColumn{PADRAO_CHAR_30{}}
oDBNOME:Width := 41
oDBNOME:HyperLabel := oDCNOME:HyperLabel 
oDBNOME:Caption := "Nome:"
oDBNOME:BackGround := aBrushes[1]
self:Browser:AddColumn(oDBNOME)


self:ViewAs(#FormView)

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access MES() 
return self:FieldGet(#MES)


assign MES(uValue) 
self:FieldPut(#MES, uValue)
return MES := uValue


access NOME() 
return self:FieldGet(#NOME)


assign NOME(uValue) 
self:FieldPut(#NOME, uValue)
return NOME := uValue


access NUMERO() 
return self:FieldGet(#NUMERO)


assign NUMERO(uValue) 
self:FieldPut(#NUMERO, uValue)
return NUMERO := uValue


access VAL01() 
return self:FieldGet(#VAL01)


assign VAL01(uValue) 
self:FieldPut(#VAL01, uValue)
return VAL01 := uValue


access VAL02() 
return self:FieldGet(#VAL02)


assign VAL02(uValue) 
self:FieldPut(#VAL02, uValue)
return VAL02 := uValue


access VAL03() 
return self:FieldGet(#VAL03)


assign VAL03(uValue) 
self:FieldPut(#VAL03, uValue)
return VAL03 := uValue


access VAL04() 
return self:FieldGet(#VAL04)


assign VAL04(uValue) 
self:FieldPut(#VAL04, uValue)
return VAL04 := uValue


access VAL05() 
return self:FieldGet(#VAL05)


assign VAL05(uValue) 
self:FieldPut(#VAL05, uValue)
return VAL05 := uValue


access VAL06() 
return self:FieldGet(#VAL06)


assign VAL06(uValue) 
self:FieldPut(#VAL06, uValue)
return VAL06 := uValue


access VAL07() 
return self:FieldGet(#VAL07)


assign VAL07(uValue) 
self:FieldPut(#VAL07, uValue)
return VAL07 := uValue


access VAL08() 
return self:FieldGet(#VAL08)


assign VAL08(uValue) 
self:FieldPut(#VAL08, uValue)
return VAL08 := uValue


access VAL09() 
return self:FieldGet(#VAL09)


assign VAL09(uValue) 
self:FieldPut(#VAL09, uValue)
return VAL09 := uValue


access VAL10() 
return self:FieldGet(#VAL10)


assign VAL10(uValue) 
self:FieldPut(#VAL10, uValue)
return VAL10 := uValue


access VAL11() 
return self:FieldGet(#VAL11)


assign VAL11(uValue) 
self:FieldPut(#VAL11, uValue)
return VAL11 := uValue


access VAL12() 
return self:FieldGet(#VAL12)


assign VAL12(uValue) 
self:FieldPut(#VAL12, uValue)
return VAL12 := uValue


access VAL13() 
return self:FieldGet(#VAL13)


assign VAL13(uValue) 
self:FieldPut(#VAL13, uValue)
return VAL13 := uValue


access VAL14() 
return self:FieldGet(#VAL14)


assign VAL14(uValue) 
self:FieldPut(#VAL14, uValue)
return VAL14 := uValue


access VAL15() 
return self:FieldGet(#VAL15)


assign VAL15(uValue) 
self:FieldPut(#VAL15, uValue)
return VAL15 := uValue


access VAL16() 
return self:FieldGet(#VAL16)


assign VAL16(uValue) 
self:FieldPut(#VAL16, uValue)
return VAL16 := uValue


END CLASS
