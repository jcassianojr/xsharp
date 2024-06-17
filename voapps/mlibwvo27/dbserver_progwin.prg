#region DEFINES
STATIC DEFINE PROGWIN_MESSAGE := 100
STATIC DEFINE PROGWIN_PROGBAR := 101
STATIC DEFINE PROGWIN_PROGSUBBAR := 102
STATIC DEFINE PROGWIN_SUBMESSAGE := 103
#endregion

CLASS ProgWin INHERIT DIALOGWINDOW

	EXPORT oDCMessage AS FIXEDTEXT
	EXPORT oDCProgBar AS PROGRESSBAR
	EXPORT oDCProgSubBar AS PROGRESSBAR
	EXPORT oDCSubMessage AS FIXEDTEXT

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)


    EXPORT lOK AS LOGIC
    EXPORT nTOTAL
    EXPORT nSUBTOT
    EXPORT nPOSICAO
    EXPORT nSUBPOS

CONSTRUCTOR(oParent,uExtra)  

SELF:PreInit(oParent,uExtra)

SUPER(oParent,ResourceID{"ProgWin",_GetInst()},FALSE)

oDCMessage := FixedText{SELF,ResourceID{PROGWIN_MESSAGE,_GetInst()}}
oDCMessage:HyperLabel := HyperLabel{#Message,NULL_STRING,NULL_STRING,NULL_STRING}

oDCProgBar := ProgressBar{SELF,ResourceID{PROGWIN_PROGBAR,_GetInst()}}
oDCProgBar:Range := Range{0,100}
oDCProgBar:HyperLabel := HyperLabel{#ProgBar,NULL_STRING,NULL_STRING,NULL_STRING}

oDCProgSubBar := ProgressBar{SELF,ResourceID{PROGWIN_PROGSUBBAR,_GetInst()}}
oDCProgSubBar:Range := Range{0,100}
oDCProgSubBar:HyperLabel := HyperLabel{#ProgSubBar,NULL_STRING,NULL_STRING,NULL_STRING}

oDCSubMessage := FixedText{SELF,ResourceID{PROGWIN_SUBMESSAGE,_GetInst()}}
oDCSubMessage:HyperLabel := HyperLabel{#SubMessage,NULL_STRING,NULL_STRING,NULL_STRING}

SELF:Caption := ""
SELF:HyperLabel := HyperLabel{#ProgWin,NULL_STRING,NULL_STRING,NULL_STRING}

SELF:PostInit(oParent,uExtra)

RETURN


METHOD posiciona(nPOS,nLASTREC) 
LOCAL nPERC
nPerc := INT(100* nPOS/ nLASTREC)
SELF:oDcProgBar:Position := nPerc


METHOD possub(nPOS,nLASTREC) 
LOCAL nPERC
nPerc := INT(100* nPOS/ nLASTREC)
SELF:oDCProgSubBar:Position:=nPERC


METHOD PostInit(oParent,uExtra) 
	//Put your PostInit additions here
	SELF:LOK:=.T.
	SELF:nPOSICAO:=0
	SELF:nSUBPOS:=0
	SELF:nTOTAL:=100
	SELF:nSUBTOT:=100
	    FabCenterWindow( SELF )	
	RETURN NIL


METHOD reset() 
   SELF:nPOSICAO:=0
   SELF:oDcProgBar:Position := 0	

METHOD resetsub() 
   SELF:nsubPOS:=0
   SELF:oDcProgsubBar:Position := 0	

METHOD SKIP(nPOS) 	
IF nPOS>0
   SELF:nPOSICAO:=SELF:nPOSICAO+nPOS	
   SELF:posiciona(SELF:nPOSICAO,SELF:nTOTAL)
ENDIF	


METHOD SKIPsub(nPOS) 	
IF nPOS>0	
  SELF:nsubPOS:=SELF:nsubPOS+nPOS	
  SELF:possub(SELF:nsubPOS,SELF:nsubTOT)
ENDIF

METHOD SUBTITULO(cString,lPOS) 
  IF lPOS	
	 cSTRING:=cSTRING+" "+StrZero(SELF:nSUBPOS,8)+"/"+StrZero(SELF:nSUBTOT,8)
  ENDIF	
	
	SELF:oDCSubMessage:TextValue:=cSTRING

METHOD TITULO(cString,lPOS) 
  IF lPOS	
	 cSTRING:=cSTRING+" "+StrZero(SELF:nPOSICAO,8)+"/"+StrZero(SELF:nTOTAL,8)
  ENDIF	
  SELF:oDCMessage:TextValue:=cString

END CLASS
FUNCTION Progress(oServer AS DbServer, oProgWin AS ProgWin)
LOCAL nPerc := 100* oServer:Recno/ oServer:LastRec AS WORD
oProgWin:oDcProgBar:Position := nPerc
RETURN TRUE

