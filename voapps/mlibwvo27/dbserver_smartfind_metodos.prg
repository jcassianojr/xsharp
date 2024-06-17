CLASS smartfind INHERIT _smartfind
	
  EXPORT oIndexInfo AS OBJECT // `All the indexinfo for the passed dbServer                                        
  
  PROTECT oDB AS dbserver      // dbServer object for the table of interest
  PROTECT aKeys AS ARRAY       // Index Keys for the table
  PROTECT aChoices AS ARRAY    // Prompts (representing Indexkey fields) for the Listbox - One for each indexkey E.g aChoices[1] := "Date In/Time In"
  PROTECT aCues AS ARRAY       // Prompts (that are disassembled ) for a selected key E.g. {"Date In" , "Time In" }
  PROTECT nKeySel AS INT       // Selected Key No. ( = Listbox current selection )
  PROTECT cSelKey AS STRING    // Selected Key  eg. dtos(date_in) +time_in )
  PROTECT nPieces AS INT       // No. of pieces in the Key
  PROTECT aKeyFields AS ARRAY  // Compound work array. Holds alias, position of fields in key
  PROTECT aSelControls AS ARRAY // Array of SLE objects to get user value(s)
  PROTECT aTxtControls AS ARRAY // Array of static text objects on form to hold key prompts
  PROTECT aSelPics AS ARRAY      // Array of Pictures for each SLE Get from fieldspec or derive intelligently
  PROTECT lVerbose AS LOGIC      // Feedback if problems occur?
  PROTECT lExact AS LOGIC        // Set exact option
  PROTECT oWinOwner AS OBJECT    // Parent window that called us
  PROTECT lSettingUp AS LOGIC    // Are we just now setting up?
  PROTECT aHeight AS ARRAY       //  Window height changes with No. of key pieces.

	
//	EXPORT oIndexInfo

METHOD boxSelect() 

   ** ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ** BoxSelect() is called everytime the user moves in the listbox to select
   ** another index to search with. We determine which index key was selected
   ** Appropriate Prompts and entryfields are hidden/displayed and reconstructed
   ** depending on how many pieces there are in the selected index key.
   ** ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        LOCAL i AS INT , j AS INT ,k AS INT // Loop couunters
        LOCAL  nHeight AS LONG ,  oControl AS OBJECT
        LOCAL  aPics AS ARRAY
        LOCAL  cCue AS STRING 
        LOCAL  cAlias AS STRING
    //    LOCAL  nKeyLen AS INT , nRIGHT AS INT
        LOCAL  cFieldName AS STRING
        LOCAL aValues AS ARRAY ,  aFieldSpecs := {} AS ARRAY
        LOCAL nPieces 
        LOCAL aCHAVES AS ARRAY               
        

   lSettingUp := TRUE             // So don't execute our editChange routine

   SELF:nKeySel :=   Max( oDcKeySelect:CurrentItemNo ,1 )


   aPics := ArrayNew( ALen(SELF:aKeys) )

   nPieces := 0
  // nRight  := 0

   IF ALen(aKEYS)=0
   	  alert ("Arquivo não Indexado")
   	  SELF:EndWindow(0)
   	  RETU ""
   ENDIF	
   SELF:cSelKey := Trim(aKeys[ SELF:nKeySel ] )    && The selected index key Eg DToS(date_in) + time_in
 //  nKeylen := Len( SELF:cSelKey )
   SELF:aKeyfields := {}
   cAlias := oDB:Alias 
   
		aCHAVES:=ListAsArray(SELF:cSelKey,"+")
		FOR k:=1 TO Len(aCHAVES)
			cFieldname :=SELF:FLDINKEY( aCHAVES[K],1  )  
		    AAdd( aKeyFields,  { cAlias, cFieldName, AT(SELF:cSelKey,cFieldName) } )
		    nPieces++
		NEXT k   
      
     
         

IF nPieces == 0
   MsgAlert( "A Problem WITH Index keys occured" )
     SELF:endwindow()
   RETURN ""
ENDIF

/* We now have nPieces parsed from the indexkey and the a aKeyFieds has nPieces sub-arrays
   aSub[1] is alias  // not really used here. Future version wil work with keys on related dbServers
   aSub[2] extrracted fieldname
   aSub[3] Where (nPos) of the indexKey do we find the fieldname */


/* Prompts associated with user SLEs - One for each field in the key expression  was obtained from
   aChoices :=  oIndexInfo:indexcues() in PostInit  Eg aChoices[1] = "Date In/Time In"
   cCue := aChoices[n] is Constructed Prompt FOR the selected index key  */
cCue         := Trim(aChoices[ SELF:nKeySel ] )
aCues        := ListAsArray( cCue , "/")                // "Date In/Time In" --> { Date In , Time In }

/* Default Pics, specs  and empty values for Entry SLEs  */
aValues     := ArrayNew( nPieces )
aPics       := ArrayNew( nPieces )
aFieldSpecs := ArrayNew( nPieces )


/* For each piece ( i ):
   1. construct a possible picture from field data type
   2. Grab fieldspec data
   3. Also make a blank value to initialise the SLE */
FOR i := 1 TO nPieces
	//AltD()
   aPics[ i ] := ( aKeyFields[ i, 1 ] )->( GEN_PIC( aKeyFields[ i, 2 ] ) )
   aFieldSpecs[i] := SELF:oDb:fieldspec( aKeyFields[ i, 2 ] )  //
   aValues[ i ] := ( aKeyFields[ i, 1 ] )->( Blank( Eval( FieldBlock( aKeyFields[ i, 2 ] ))))
NEXT


IF SELF:nKeySel > 0

      FOR j:=1 UPTO 7

        /* Visible SLEs  = No of Fields in the key */
        IF j  <= nPieces

           /* Paint the prompt  */
           aTxtControls[j]:textValue := aCues[ j ]	

          /* Get a reference TO the current control. */
          oControl := aSelControls[j]

           /* get the  picture from the fieldspec picture, IF it exists
             or the one figured out from the data type  */
           oControl:picture := IF( !Empty( afieldspecs[j]:picture) , afieldspecs[j]:picture , apics[j] )

           SELF:aSelPics[j] := oControl:picture   // Keep a reference to the selectedpic for later
           //oControl:size                  // change width of SLE with field width      //odim:=
           oControl:size := dimension{  10*afieldspecs[j]:length + 3 , oControl:size:height }
           oControl:value := aValues[j]           // initialie sle with blank value of correct datatype
           /* Show the needed fields and prompts  */
           oControl:enable()        ; oControl:show()
           aTxtControls[j]:enable() ; aTxtControls[j]:show()

        /* Hide Controls we don't need  */
        ELSE

        	aTxtControls[j]:hide() ; aTxtControls[j]:disable()
        	aSelControls[j]:hide() ; aSelControls[j]:disable()

       ENDIF

    NEXT
      /* Adjust window height */
       nHeight := aHeight[ nPieces ]
       SetWindowPos( SELF:handle() , NULL_PTR  , SELF:origin:x, SELF:origin:y , ;
                            SELF:size:width  ,  nHeight ,     _Or(SWP_NOMOVE, SWP_NOZORDER))

 ENDIF
  oDcKey1:SetFocus()
  lSettingUp := FALSE



METHOD ButtonClick(oControlEvent) 
        LOCAL oControl AS Control
        oControl := IIf(oControlEvent == NULL_OBJECT, NULL_OBJECT, oControlEvent:Control)
        SUPER:ButtonClick(oControlEvent)
        //Put your changes here

        IF oControl:namesym == #ExitPushButton
           // Quit
           SELF:EndWindow()

         ELSEIF  oControl:namesym == #INcrementCheckBox
           // Incremental search, so keep window open on Find.
           IF oDcIncrementCheckBox:checked  .and. !oDcKeepOpenCheckBox:checked
                oDcKeepopenCheckBox:checked :=  TRUE
                oDcKeepopenCheckBox:disable()
           ELSEIF !oDcIncrementCheckBox:checked
                oDcKeepopenCheckBox:enable()
           ENDIF

        ENDIF

       RETURN NIL


METHOD Dispatch(oE) 
// for escaping with Esc key
IF oE:message == WM_CHAR  .and. oE:wParam == VK_ESCAPE
	SELF:endWindow()
	RETURN 1L
ENDIF
RETURN SUPER:dispatch(oE)





METHOD EditChange( oCE ) 
LOCAL oControl AS USUAL  , nLen  AS INT        //  , xResult := .T. AS USUAL

        // Plunk values into key:
oControl := IIf(oCE == NULL_OBJECT, NULL_OBJECT, ;
          oCE:Control)


 IF oDcIncrementCheckBox:checked  .and. Left( oControl:name , 3 ) == "KEY"   ;
         .and. ! lSettingUp
        nLen :=  SLen( AllTrim(oControl:TextValue) )
   // oDb:SEEK( Trim(oControl:textvalue  ) )
     IF !(ValType(oControl:value) =="D" )   .or.  nLen=8  .or.  nLen=10
        SELF:seekdata()
     ENDIF
        oControl:SetFocus()

 ENDIF
 SUPER:EditChange(oCE)         //xResult :=
 RETURN SELF   /// (xResult)

METHOD ExitPB( ) 
        SELF:endwindow()

METHOD FindPB( ) 
        SELF:SeekData()

METHOD  FLDINKEY( cPiece  , nStart  )   
   // Return the field name from
   // a string in which it occurs
LOCAL c AS USUAL , s AS STRING , nStop AS INT , ;
      nLen       := Len( cPiece ) AS INT, ;
      nOffset    := nStart AS INT , ;
      cFieldName := "" AS STRING


WHILE nOffset < nLen

    // Find start of a candidate name
    FOR nStart := nOffset TO nLen
       IF IsAlpha( String2Psz(SubStr( cPiece, nStart, 1 ) ) )
          EXIT
       ENDIF
    NEXT

    // Find end of the candidate name
    FOR nStop := nStart + 1 TO nLen
       c := SubStr( cPiece, nStop, 1 )
       IF !( IsAlpha( c )  .OR. c $ '_0123456789' )
          // Ignore if a function call:
          IF c == "("
             nStart := nStop
          ENDIF
          EXIT
       ENDIF
    NEXT

    // We're here in <cPiece>
    nOffset := nStop

    s := SubStr( cPiece, nStart, nStop - nStart )
    IF oDb:FieldPos( s ) > 0
       cFieldName := s
       EXIT
    ENDIF

END
  
//RETURN {cFieldName,nOffset}
RETURN cFieldName


METHOD IndexPB( ) 
        SELF:oDb:setorder( SELF:nKeySel )
        SELF:EndWindow()



METHOD ListBoxSelect(oControlEvent) 
  //      LOCAL oControl AS Control
        IIf(oControlEvent == NULL_OBJECT, NULL_OBJECT, oControlEvent:Control)    //oControl :=
        SUPER:ListBoxSelect(oControlEvent)
        //Put your changes here

        SELF:BoxSelect()    // The real work ...


//ACCESS oIndexInfo 
  //      RETURN oIndexInfo


METHOD PostInit(oWindow,iCtlID,oServer,uExtra)    

/*  Initial values from passed dbServer */
SELF:oWinOwner    := uExtra                   // Parent window that called us
SELF:oDb          := uExtra:Server            // Get owner's dbserver
SELF:oIndexInfo   := xindexinfo{ SELF:oDb }    // `All the indexinfo for the passed dbServer
SELF:aKeys        := oIndexInfo:IndexKeys()   // Index Keys for the table
SELF:aChoices     := oIndexInfo:IndexCues()   // Prompts (representing Indexkey fields) for the Listbox - One for each indexkey E.g aChoices[1] := "Date In/Time In"
SELF:nKeySel      := Max( 1 , oDb:INDEXORD() ) // Selected Key No. ( = Listbox current selection )

/* Initialise other needed iVars  */
SELF:nPieces      := 1
SELF:aKeyfields   := ArrayNew( 7 )
SELF:aCues        := ArrayNew( 7 )
SELF:ASelPics     := ArrayNew( 7 )
SELF:aSelControls := { oDcKey1 , oDcKey2, oDcKey3 , oDcKey4, oDcKey5, oDcKey6, oDcKey7 }
SELF:aTxtControls := { oDcCue1 , oDcCue2, oDcCue3 , oDcCue4, oDcCue5, oDcCue6, oDcCue7 }
SELF:cSelKey      := ""
SELF:lVerbose     := FALSE
SELF:lExact       := FALSE
SELF:aHeight      := { 195 ,235 , 265 , 295 , 330 , 365 ,400 } // Window height changes with No. of key pieces.
//SELF:oFormFrame:AllowScroll := FALSE  // No scrollbar allowed
SELF:lSettingUp := TRUE

//SELF:oFormFrame:AllowScroll := FALSE
SELF:oDCKeyselect:FillUsing( aChoices )             // Fill the listbox with indexkey prompts
SELF:oDcKeySelect:CurrentItemNo :=  SELF:nKeySel // Selected Key No. ( = Listbox current selection )
//SELF:boxselect()                                 // Initial "Onchange for Listbox"
SELF:oDckey1:SetFocus()


FabCenterWindow( SELF )
// SELF:EnableTopMost()
//SetWindowPos(SELF:Handle(), HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE)// always on top

RETURN SELF



METHOD seekData 	
	// Plunk values into key:
LOCAL aValues AS ARRAY, cType := "C" AS STRING   , i AS INT , cKey:= SELF:cSelKey AS STRING
LOCAL s AS USUAL 
LOCAL lFound := .f. AS USUAL   , lSoft AS LOGIC
LOCAL xKeyVal := ""  AS USUAL   ,  lIsSubBrowse AS LOGIC , nRec AS DWORD 
LOCAL K AS INT
LOCAL aCHAVES AS ARRAY   
LOCAL aCAMPOS AS ARRAY
LOCAL cFieldName AS STRING   
LOCAL nCAMPOS AS INT  
aCAMPOS:={}         
nCAMPOS:=0

//aValues := ARRAY( nPieces)
aValues := ArrayNew(7)

lIsSubBrowse :=  IsAccess( oWinOwner , #oSFMySubForm )

IF ( lIsSubBrowse   .and. IsAccess ( oWinOwner:oSFMySubForm , #Browser )  )
  oWinOwner:oSFMySubForm:Browser:SuspendUpdate()  // don't be slowed with subbrowse
ENDIF	


		aCHAVES:=ListAsArray(SELF:cSelKey,"+")
		FOR k:=1 TO Len(aCHAVES)
			cFieldname :=SELF:FLDINKEY( aCHAVES[K],1  )   
			//alert("box select campos"+ cFieldname)
		    AAdd( aCAMPOS, Upper(cFieldName) )
		    nCAMPOS++
		NEXT k  

avalues[1] := SELF:oDCkey1:Value 
avalues[2] := SELF:oDCkey2:Value
avalues[3] := SELF:oDCkey3:Value
avalues[4] := SELF:oDCkey4:Value
avalues[5] := SELF:oDCkey5:Value
avalues[6] := SELF:oDCkey6:Value
avalues[7] := SELF:oDCkey7:Value

 
FOR i := 1 TO nCAMPOS
   cType := ValType( aValues[ i ] ) 
   DO CASE
      CASE cType == "C" ; aValues[ i ] := '"' + aValues[ i ] + '"'
      CASE cType == "D" ; aValues[ i ] := 'CToD("' + DToC( aValues[ i ] ) + '")'
      OTHERWISE         ; aValues[ i ] := Transform( aValues[ i ], SELF:aselPics[ i ] )
   ENDCASE
   cKEY:=StrTran(cKEY,aCAMPOS[I], aValues[ i ])  
NEXT


  s := &( CkEY )


   xKeyVal := IF( IsString( s ) .And. !lExact, Trim( s ), s )
   lSoft := SetSoftSeek()
   SetSoftSeek( ValType(xKeyVal) ="N" )

 //  Do the search!!
  SELF:oDb:setorder( SELF:nKeySel )
  SetSoftSeek( lSoft )
  nREc := oDb:recno
  lFound :=  oDb:SEEK( xKeyVal )  // oDb:seek( xKeyVal )

  IF ! lFound
  	oDb:GoTo(nREc)
    IF lVerbose
       MsgAlert( "Could not find " + Trim(xKeyVal) )
    ENDIF
  ENDIF

 // Update the browser here if necessary with a :Refresh()
IF lIsSubBrowse
  oWinOwner:oSubForm:Browser:RestoreUpdate()
  oWinOwner:oSubForm:Browser:Refresh()
 ENDIF
IF !oDcKeepOpenCheckBox:checked
	SELF:endwindow()
ENDIF	

RETURN lFound


END CLASS
