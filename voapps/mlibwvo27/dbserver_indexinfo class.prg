/*
TEXTBLOCK xindexinfoClass
/-*
indexkey class

Description: General data driven Index-related functions for VO
Many are based on functionality contained in the excellent
( though now defunct ) ArtfulII library for clipper.
             *-/


*/
#region DEFINES
DEFINE   FLD_DESC     :=     2
DEFINE   FLD_NAME    :=      1
#endregion

CLASS xindexinfo
	PROTECT oDB AS dbserver
	PROTECT lIsIndexed AS LOGIC

METHOD FieldCue( cExpr )  
/*
   Field prompts from field names in expression
   Eg upper(last_name+first_name) returns  "Last Name/First Name"
*/
LOCAL cCue := ""  AS STRING , i AS INT , aFlds AS ARRAY , nLen AS DWORD
LOCAL cFldName AS STRING , nPos AS DWORD ,  aDescArray AS ARRAY

aFlds := SELF:KEYFIELDS( cExpr  )
nLen  := Len( aFlds )

aDescArray := SELF:FieldDescArray()

FOR i := 1 TO nLen
   cFldName := aFlds[ i ]

     // Get Descriptive field name if one exists
     IF ( nPos := AScan(aDescArray[FLD_NAME] , Trim(Upper(cFldName)) ) ) > 0;
           .and. !Empty( aDescArray[FLD_DESC][nPos])
       cFldName :=aDescArray[FLD_DESC][nPos]
     ENDIF


   cCue += Proper( StrTran( cFldName , "_", " " ))
   IF i < nLen
      cCue += "/"
    ENDIF
NEXT
RETURN cCue





METHOD FieldDescArray() 
/*
   For the dbServer object :  Return an array of 2  arrays.
   The first containing field names and the srcond containing the
   corresponding field descriptions ( pseudonyms).
   Eg  { { "job_no"    , "item_no"     , "desc"            , ... } ,;
         { "Job Number", "Item Number" , "job description" , ... };
       }
    */

LOCAL aResult := { {} , {} } AS ARRAY  , oFieldinfo AS OBJECT   , i AS INT
LOCAL  nLen AS SHORT

  nLen := SELF:oDb:FCount

  FOR i := 1 TO nLen
    oFieldInfo := SELF:oDb:fieldspec( i ):hyperlabel
    AAdd( aResult[FLD_NAME], Trim( Upper(oFieldInfo:name) )  )
    AAdd( aResult[FLD_DESC], IF( IsString(oFieldInfo:caption),oFieldInfo:caption ,oFieldInfo:name))
  NEXT
RETURN aResult



/* NameGetOrder()
  Get index order based on the index tag (name) passed
  Eg. NameGetOrder( oDb , "Cust_Tag" )  could return 1
  If cTag is not passed, return the index order for the current workarea
  or dBserver
  */

METHOD FLDINKEY( cPiece  , nStart  )  
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
RETURN cFieldName  //,nOffset}
METHOD GetFieldDesc ( cFldName  )     
/*
Function GetFieldDesc(oDb,cFldName )
Get a field Pseudonym for a dbserver object , based on the fieldname passed
*/
LOCAL aFields := SELF:FieldDescArray() AS ARRAY
LOCAL nPos AS DWORD , cDesc := cFldName AS STRING
IF  ( nPos := AScan( aFields[FLD_NAME] ,Trim(Upper(cFldName ))  )  ) >0
  cDesc :=  aFields[FLD_DESC][nPos]
ENDIF
RETURN cDesc



METHOD getorder(  xKey) 
RETURN   SELF:KeyGetOrder( xKey )


METHOD IndexCues()  
/* IndexCues( oDBServer  )
  Return an array of Prompts for the key fields of the dbServer object.
   Eg indexes are "id_no" and "upper(last_name+first_name)"
   aCues  returns { "Id No" , "Last Name/First Name"

   */
LOCAL  aCues := {}, aKeys AS ARRAY , nKeys AS INT  , i AS INT , cCue AS STRING
cCUE := ""
aKeys := SELF:IndexKeys()
nKeys := ALen( aKeys )
FOR i := 1 TO nKeys
   cCue:= SELF:FieldCue( aKeys[i] )
   AAdd( aCues, cCue )
NEXT
RETURN aCues


METHOD IndexKeys() 
/* IndexKeys( oDBServer  )
  Return an array of all the index keys available for a work area.
   */

LOCAL i AS INT  , aNtxKeys AS ARRAY, nIndexes AS INT
     LOCAL oDB1 AS OBJECT
     oDB1 := SELF:odb
    nIndexes  :=  oDb1:ORDERINFO( DBOI_ORDERCOUNT )
    aNtxKeys  := {}

    FOR i := 1 UPTO nIndexes
       AAdd( aNtxKeys ,  oDb1:ORDERINFO( DBOI_EXPRESSION , ,  i ) )
    NEXT


RETURN aNtxKeys



/* Some Compatability functions*/

METHOD IndexTags()  
/* IndexTags()
  Return an array of all the index tags available
   */

LOCAL i AS INT,  aNtxNames AS ARRAY , nIndexes AS INT

    nIndexes  :=  oDb:ORDERINFO( DBOI_ORDERCOUNT )
    aNtxNames  := {}
    FOR i := 1 UPTO nIndexes
        AAdd( aNtxNames ,  oDb:ORDERINFO( DBOI_NAME , ,  i ) )
    NEXT
RETURN aNtxNames



CONSTRUCTOR( oDbServer )
	SELF:oDb := oDbServer
	lIsIndexed :=  FALSE  // not used  yet
	RETURN SELF

METHOD KEYFIELDS( cKey ) 
* º Function      º KEYFIELDS()                                                º
* º Purpose       º Return an array of fields used in a key expression         º
* º Syntax        º aArray := KEYFIELDS( cKey )                                º
* º Parameters    º                                                            º
* º     cKey      º string to search                                           º
* º Example       º aArray := KEYFIELDS( cKey )start )                         º
* º Assumes       º <cKey> is a string                                         º
* º Returns       º Field name if found, or nul string                         º
* º Calls         º FLDINKEY()                                                 º
	
LOCAL cFieldname := "" AS STRING
LOCAL aFldarray  := {} AS ARRAY         
LOCAL aCHAVES AS ARRAY  
LOCAL I AS DWORD
       
aCHAVES:=ListAsArray(cKEY,"+")
FOR I:=1 TO Len(aCHAVES)
	cFieldname :=SELF:FLDINKEY( aCHAVES[i], 1 ) 
   IF AScan( aFldArray, cFieldName ) == 0
      AAdd( aFldarray, cFieldname )
   ENDIF
NEXT i   

RETURN aFldArray




METHOD KeyGetOrder( cKey  ) 
LOCAL aKeys AS ARRAY , nResult := 0  AS INT  , cTemp AS STRING

 cTemp := SELF:oDb:INDEXKEY(0 )
default cKey TO cTemp
cKey := Upper( Trim( cKey ))

  aKeys := SELF:indexkeys()
  nResult := AScan( aKeys  , cKey )

RETURN nResult





METHOD KeySetOrder(  xkey ) 

/* KeySetOrder( xkey )     Order by KEY or NUMBER
   Set the index order for a dbserver based on the
   index key or a valid index order passed  as a parameter (xKey) .
   Returns index order set , or 0 if the key could not be found
   examples  nNewOrder  := setorder( "Job_no" )
  */

LOCAL  nOrder:=0 AS INT , cKey AS STRING

IF IsString( xKey )
	cKey := Upper( Trim( xKey ))
ELSE                             // if an index order was passed,
    cKey := oDB:INDEXKEY( xKey ) // translate it to a key.
ENDIF	

     // We're on the rigt Key ?
    IF cKey =oDb:INDEXKEY( 0 )
      nOrder := oDb:ORDERINFO( DBOI_NUMBER )
    ELSE
      nOrder := SELF:KeyGetorder( cKey )
    ENDIF

// and set it
IF norder == 0
    MsgAlert( "Unable to set " + Trim( SELF:oDb:Alias ) + " key to "  + cKey )
ELSE
   SELF:oDb:setorder( nOrder )
ENDIF

RETURN nOrder



METHOD NameGetOrder(cTag)  
LOCAL nResult := 0  AS INT
/* Get index order based on the index tag (name) passed
  Eg. NameGetOrder(  "Cust_Tag" )  could return 1
 IF cTag IS not passed, RETURN the index order FOR the current dBserver order
*/
default  cTag TO oDB:ORDERINFO( DBOI_NAME )
nResult :=  oDb:ORDERINFO( DBOI_NUMBER, , cTag )

RETURN nResult




/* NameSetOrder( xTag )     Order by Tag or NUMBER
   Set the index order for a dbserver  or in  a work area based on the
   index Tag or a valid index order passed  as a parameter (xTag) .
   Returns index order set , or 0 if the Tag could not be found
   examples  nNewOrder  := setorder( "Job_no" )
             nNewOrder1 := setorder( oDbJob , "Job_no" )
  */



METHOD NameSetOrder(  xTag )  
/* NameSetOrder( xTag )     Order by Tag or NUMBER
   Set the index order for a dbserver based on the
   index Tag or a valid index order passed  as a parameter (xTag) .
   Returns index order set , or 0 if the Tag could not be found
   examples  nNewOrder  := oxindexinfo:NameSetorder( "Job_no" )
  */

LOCAL  nOrder:=0 AS INT , cTag AS STRING


IF IsString( xTag )
	cTag := Upper( Trim( xTag ))
ELSE                                                 // if an index order was passed,
    cTag := oDB:OrderInfo(DBOI_NAME , , xTag )	 // translate it to a Tag.
ENDIF	


     // We're on the rigt Tag ?
    IF cTag=oDb:ORDERINFO( DBOI_NAME )
      nOrder := oDb:ORDERINFO( DBOI_NUMBER )
    ELSE
      nOrder := SELF:NameGetOrder( cTag )
    ENDIF


// and set it
IF norder == 0
    MsgAlert( "Unable to set " + Trim( SELF:oDb:Alias ) + " key to "  + cTag )
ELSE
   SELF:oDb:setorder( nOrder )
ENDIF

RETURN nOrder


/* KeyGetOrder()
  Get index order based on the index key passed
  Eg. KeyGetOrder( oDb , "customer_no" )  could return 1
  */


METHOD    setorder(  xKey ) 
RETURN    SELF:KeySetOrder( xKey )



END CLASS
