#region DEFINES
STATIC DEFINE JSACFEM_CHECAR := 100 
STATIC DEFINE JSACFEM_ENCERRAR := 101 
STATIC DEFINE JSACFEM_FEMEAREV := 106 
STATIC DEFINE JSACFEM_FEMEAREVD := 107 
STATIC DEFINE JSACFEM_PF := 105 
STATIC DEFINE JSACFEM_SC_FEMEAREV := 103 
STATIC DEFINE JSACFEM_SC_FEMEAREVD := 104 
STATIC DEFINE JSACFEM_SC_PF := 102 
#endregion

class jsacfem inherit DATADIALOG 

	protect oCCChecar as PUSHBUTTON
	protect oCCEncerrar as PUSHBUTTON
	protect oDCSC_PF as FIXEDTEXT
	protect oDCSC_FEMEAREV as FIXEDTEXT
	protect oDCSC_FEMEAREVD as FIXEDTEXT
	protect oDCPF as SINGLELINEEDIT
	protect oDCFEMEAREV as SINGLELINEEDIT
	protect oDCFEMEAREVD as SINGLELINEEDIT
// 	instance PF 
// 	instance FEMEAREV 
// 	instance FEMEAREVD 

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)

METHOD Checar( ) 
LOCAL oConn AS SQLConnection
LOCAL oREG AS SQLSelect
LOCAL cPF AS STRING
LOCAL nREV AS DWORD
LOCAL dDATA
LOCAL lERRO AS LOGIC
LOCAL aMAIL AS ARRAY

lERRO:=.F.
IF Empty(SELF:SERVER:FIELDGET("PF"))
   alert("PF Em Branco","PF Em Branco")	
   SELF:oDCPF:Disable()	
ENDIF	
IF ! Empty(SELF:SERVER:FIELDGET("PF"))
   SELF:oDCPF:Disable()	
ENDIF	

oConn := SQLConnection{}
oConn:connect("pf","","")
cPF:=AllTrim(Str(SELF:SERVER:FIELDGET("PF")))
cPF:="SELECT FEMEAREV,FEMEAREVD FROM PF WHERE PF="+cPF
oreg:= SQLSelect{cPF,oconn}
IF oREG:RecCount>0
	dDATA:=FIXDATA(oREG:FIELDGET("FEMEAREVD"))
    SELF:SERVER:FIELDPUT("FEMEAREVD",dDATA)
    nREV:=FIXNUM(oREG:FIELDGET("FEMEAREV"))
    SELF:SERVER:FIELDPUT("FEMEAREV",nREV)
ELSE
   lERRO:=.T.
ENDIF
oREG:Close()
oConn:Disconnect()

IF lERRO
   aMAIL:={}	
   AAdd(aMAIL,"SAC No:"+StrTRIM(SELF:SERVER:FIELDGET("SAC"),8,0))
   AAdd(aMAIL,"PF No:"+StrTRIM(SELF:SERVER:FIELDGET("PF"),8,0))
   EMAILINT("SAC00002",ZUSER,aMAIL,ZCURINI,zCURDIR)	
ENDIF	





		

METHOD Encerrar( ) 
	SELF:ENDWINDOW()

access FEMEAREV() 
return self:FieldGet(#FEMEAREV)


assign FEMEAREV(uValue) 
self:FieldPut(#FEMEAREV, uValue)
return FEMEAREV := uValue


access FEMEAREVD() 
return self:FieldGet(#FEMEAREVD)


assign FEMEAREVD(uValue) 
self:FieldPut(#FEMEAREVD, uValue)
return FEMEAREVD := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  
local dim aFonts[1] AS OBJECT
local dim aBrushes[1] AS OBJECT

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"jsacfem",_GetInst()},iCtlID)

aFonts[1] := Font{,10,"Times New Roman"}
aFonts[1]:Bold := TRUE
aBrushes[1] := Brush{Color{255,255,200}}

oCCChecar := PushButton{self,ResourceID{JSACFEM_CHECAR,_GetInst()}}
oCCChecar:HyperLabel := HyperLabel{#Checar,"Checar",NULL_STRING,NULL_STRING}

oCCEncerrar := PushButton{self,ResourceID{JSACFEM_ENCERRAR,_GetInst()}}
oCCEncerrar:HyperLabel := HyperLabel{#Encerrar,"Encerrar",NULL_STRING,NULL_STRING}

oDCSC_PF := FixedText{self,ResourceID{JSACFEM_SC_PF,_GetInst()}}
oDCSC_PF:HyperLabel := HyperLabel{#SC_PF,"Pf:",NULL_STRING,NULL_STRING}

oDCSC_FEMEAREV := FixedText{self,ResourceID{JSACFEM_SC_FEMEAREV,_GetInst()}}
oDCSC_FEMEAREV:HyperLabel := HyperLabel{#SC_FEMEAREV,"Femea Rev:",NULL_STRING,NULL_STRING}

oDCSC_FEMEAREVD := FixedText{self,ResourceID{JSACFEM_SC_FEMEAREVD,_GetInst()}}
oDCSC_FEMEAREVD:HyperLabel := HyperLabel{#SC_FEMEAREVD,"Rev Data",NULL_STRING,NULL_STRING}

oDCPF := SingleLineEdit{self,ResourceID{JSACFEM_PF,_GetInst()}}
oDCPF:FieldSpec := PADRAO_NUM_08{}
oDCPF:HyperLabel := HyperLabel{#PF,"Pf:",NULL_STRING,"SAC_PF"}

oDCFEMEAREV := SingleLineEdit{self,ResourceID{JSACFEM_FEMEAREV,_GetInst()}}
oDCFEMEAREV:FieldSpec := PADRAO_NUM_08{}
oDCFEMEAREV:HyperLabel := HyperLabel{#FEMEAREV,"Femearev:",NULL_STRING,"SAC_FEMEAREV"}
oDCFEMEAREV:BackGround := aBrushes[1]
oDCFEMEAREV:Font(aFonts[1], FALSE)

oDCFEMEAREVD := SingleLineEdit{self,ResourceID{JSACFEM_FEMEAREVD,_GetInst()}}
oDCFEMEAREVD:FieldSpec := DATE_FIELD{}
oDCFEMEAREVD:HyperLabel := HyperLabel{#FEMEAREVD,"Femearevd:",NULL_STRING,"SAC_FEMEAREVD"}
oDCFEMEAREVD:BackGround := aBrushes[1]
oDCFEMEAREVD:Font(aFonts[1], FALSE)

self:Caption := "Revisao Femea"
self:HyperLabel := HyperLabel{#jsacfem,"Revisao Femea",NULL_STRING,NULL_STRING}
self:ClipperKeys := True

if !IsNil(oServer)
	self:Use(oServer)
else
	self:Use(self:Owner:Server)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access PF() 
return self:FieldGet(#PF)


assign PF(uValue) 
self:FieldPut(#PF, uValue)
return PF := uValue


END CLASS
