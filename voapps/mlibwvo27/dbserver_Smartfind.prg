/*
TEXTBLOCK Documentacao CLASS smartfind{}
Raw and unpolished first pass.
Feedback and improvement suggestions highly desirable.
Eg. Despite trying all suggestions from NG archives, I still can't get THIS
form TO stay on Top OF the window that called it!!

Ian Henderson
ieh@opus.co.tt
*************************************************
** Typical Useage for class Smartfind{}  **
** Drop into any app with indexes
** The foll method is already in the finder module, remove or adapt as needed
** The more indexes and the more complex, the more useful this form will be.

** METHOD KeyFind()  CLASS DataWindow   // or mydatawin or whatever
**      LOCAL oWin AS SmartFind
**      oWin :=  SmartFind{ SELF:owner, , , SELF  }
**      oWin:show()

**                                                        **
** COMPLETE DESCRIPTION OF smartfind{} **
** -------------------------------------------------------------------------
-
** For use with any dbserver with an open index file
** Purpose:  To never (almost) have to write another Find dialog
** of any type or complexity.  When users need to find
** information _quickly_ they would need to : select the appropriate index,
** enter a value ( or values depending on the index key complexity) into
** appropriate entryfield(s) and a seek must then be done.
** If , for example, the application  had 10 tables with index files,  we
** might have to design 10 forms with the appropriate prompts, entryfields (SLEs)
** ( e.g. numeric types for numeric fields date pictures for date fields etc.)
** this is of course very tedious, even with inheritance. Also if we
** later added, modified or deleted index keys , we'd have to redo or add forms.
** Other generic search forms seem to work only with very simple keys and
** usually lack "intelligence".

** Smartseek() attempts to eliminmate all of this and will work with simple or
** complex indexes.  You could attach it to a Seek button on all your
** data forms.
** E.g.  We have a table Custinfo.dbf with 4 index keys:
** CUST_NO , UPPER(LAST_NAME+FIRST_NAME)
** DTOS(START_DATE)+ UPPER(LAST_NAME) , SALES_AMT
** SmartSeek() will present the user with a form containing a listbox,  prompts
** and entryfields which are automatically formatted to the appropriate
** length and type. The listbox automatically highlights the currently  selected
** index key prompt.  As the user selects different keys, the prompts and
** entryfields change appropriately.  Eg. if the current indexkey is the
** third one,  there would be two prompts: "Start Date" and "Last Name" ,
** with corresponding entryfields consisting of a blank date "  / /  " and
** "            "  corresponding to blank database fields.
** Prompts are intelligently constructed from the fieldspecinfo, if any, or from the
** data fields themselves.

** Similarly,  if the user highlights the second key , the prompts will change.
** The user can then enter complete or partial data to find the desired record
** e.g. they could select the second listbox entry,  enter Smy in the first
** entryfield shown and click OK.
**  Incremental search is a checkbox option.
**  The record containing "SMYTHE" will be found if one exists.
**  As much intelligence as possible is derived from the dbserver as possible.
** The index key selected remains the active one after the seek.  So that
** if , for instance , this procedure is attached to a pushbutton on a form
** containing a browse,  the correct record will be highlighted and the table
** will now appear in last name sequence.
**
** Apart from being easy to implement,  (no coding or form design needed)
** you'll probably find this form especially useful in that any compexity
** in your index keys is hidden from the end user.  E.g. if you indexed
** on   proper( LAST_NAME)
** the end user would be prompted with Last Name and could enter the
** desired Last_name in any case, to find it. Most other generic search forms would expect the
** end user to Proper case the name for the search to work.  Of course you could CODE all THIS yourself
** but hopfully with this class it won't ever be necessary again.



*/
#region DEFINES
STATIC DEFINE _SMARTFIND_CUE1 := 110 
STATIC DEFINE _SMARTFIND_CUE2 := 111 
STATIC DEFINE _SMARTFIND_CUE3 := 112 
STATIC DEFINE _SMARTFIND_CUE4 := 113 
STATIC DEFINE _SMARTFIND_CUE5 := 114 
STATIC DEFINE _SMARTFIND_CUE6 := 115 
STATIC DEFINE _SMARTFIND_CUE7 := 116 
STATIC DEFINE _SMARTFIND_EXITPB := 118 
STATIC DEFINE _SMARTFIND_FINDPB := 120 
STATIC DEFINE _SMARTFIND_GROUPBOX1 := 117 
STATIC DEFINE _SMARTFIND_INCREMENTCHECKBOX := 109 
STATIC DEFINE _SMARTFIND_INDEXPB := 122 
STATIC DEFINE _SMARTFIND_KEEPOPENCHECKBOX := 108 
STATIC DEFINE _SMARTFIND_KEY1 := 101 
STATIC DEFINE _SMARTFIND_KEY2 := 102 
STATIC DEFINE _SMARTFIND_KEY3 := 103 
STATIC DEFINE _SMARTFIND_KEY4 := 104 
STATIC DEFINE _SMARTFIND_KEY5 := 105 
STATIC DEFINE _SMARTFIND_KEY6 := 106 
STATIC DEFINE _SMARTFIND_KEY7 := 107 
STATIC DEFINE _SMARTFIND_KEYSELECT := 100 
STATIC DEFINE _SMARTFIND_THEFIXEDTEXT10 := 121 
STATIC DEFINE _SMARTFIND_THEFIXEDTEXT11 := 123 
STATIC DEFINE _SMARTFIND_THEFIXEDTEXT9 := 119 
STATIC DEFINE SmartFind_EXITPUSHBUTTON := 102
STATIC DEFINE SmartFind_FINDPUSHBUTTON := 101
STATIC DEFINE SMARTFIND_SETINDEXPB := 103
STATIC DEFINE SmartFind_SETINDEXPUSHBUTTON := 103
#endregion

CLASS _smartfind INHERIT DATADIALOG

	PROTECT oDCKeyselect AS LISTBOX
	PROTECT oDCkey1 AS SINGLELINEEDIT
	PROTECT oDCkey2 AS SINGLELINEEDIT
	PROTECT oDCkey3 AS SINGLELINEEDIT
	PROTECT oDCkey4 AS SINGLELINEEDIT
	PROTECT oDCkey5 AS SINGLELINEEDIT
	PROTECT oDCkey6 AS SINGLELINEEDIT
	PROTECT oDCkey7 AS SINGLELINEEDIT
	PROTECT oDCKeepOpenCheckBox AS CHECKBOX
	PROTECT oDCIncrementCheckBox AS CHECKBOX
	PROTECT oDCCue1 AS FIXEDTEXT
	PROTECT oDCCue2 AS FIXEDTEXT
	PROTECT oDCCue3 AS FIXEDTEXT
	PROTECT oDCCue4 AS FIXEDTEXT
	PROTECT oDCCue5 AS FIXEDTEXT
	PROTECT oDCCue6 AS FIXEDTEXT
	PROTECT oDCCue7 AS FIXEDTEXT
	PROTECT oDCGroupBox1 AS GROUPBOX
	PROTECT oCCExitPB AS PUSHBUTTON
	PROTECT oDCtheFixedText9 AS FIXEDTEXT
	PROTECT oCCFindPB AS PUSHBUTTON
	PROTECT oDCtheFixedText10 AS FIXEDTEXT
	PROTECT oCCIndexPB AS PUSHBUTTON
	PROTECT oDCtheFixedText11 AS FIXEDTEXT
// 	INSTANCE Keyselect
// 	INSTANCE key1
// 	INSTANCE key2
// 	INSTANCE key3
// 	INSTANCE key4
// 	INSTANCE key5
// 	INSTANCE key6
// 	INSTANCE key7
// 	INSTANCE KeepOpenCheckBox
// 	INSTANCE IncrementCheckBox

  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)


 // EXPORT oIndexInfo AS OBJECT // `All the indexinfo for the passed dbServer
 // PROTECT oDB AS dbserver      // dbServer object for the table of interest
 // PROTECT aKeys AS ARRAY       // Index Keys for the table
 // PROTECT aChoices AS ARRAY    // Prompts (representing Indexkey fields) for the Listbox - One for each indexkey E.g aChoices[1] := "Date In/Time In"
 // PROTECT aCues AS ARRAY       // Prompts (that are disassembled ) for a selected key E.g. {"Date In" , "Time In" }
 // PROTECT nKeySel AS INT       // Selected Key No. ( = Listbox current selection )
 // PROTECT cSelKey AS STRING    // Selected Key  eg. dtos(date_in) +time_in )
 // PROTECT nPieces AS INT       // No. of pieces in the Key
 // PROTECT aKeyFields AS ARRAY  // Compound work array. Holds alias, position of fields in key
 // PROTECT aSelControls AS ARRAY // Array of SLE objects to get user value(s)
 // PROTECT aTxtControls AS ARRAY // Array of static text objects on form to hold key prompts
 // PROTECT aSelPics AS ARRAY      // Array of Pictures for each SLE Get from fieldspec or derive intelligently
 // PROTECT lVerbose AS LOGIC      // Feedback if problems occur?
 // PROTECT lExact AS LOGIC        // Set exact option
 // PROTECT oWinOwner AS OBJECT    // Parent window that called us
 // PROTECT lSettingUp AS LOGIC    // Are we just now setting up?
 // PROTECT aHeight AS ARRAY       //  Window height changes with No. of key pieces.

//SetWindowPos(SELF:Handle(), HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE)// always on top


access IncrementCheckBox() 
return self:FieldGet(#IncrementCheckBox)


assign IncrementCheckBox(uValue) 
self:FieldPut(#IncrementCheckBox, uValue)
return IncrementCheckBox := uValue


CONSTRUCTOR(oWindow,iCtlID,oServer,uExtra)  

self:PreInit(oWindow,iCtlID,oServer,uExtra)

SUPER(oWindow,ResourceID{"_smartfind",_GetInst()},iCtlID)

oDCKeyselect := ListBox{self,ResourceID{_SMARTFIND_KEYSELECT,_GetInst()}}
oDCKeyselect:HyperLabel := HyperLabel{#Keyselect,NULL_STRING,NULL_STRING,NULL_STRING}

oDCkey1 := SingleLineEdit{self,ResourceID{_SMARTFIND_KEY1,_GetInst()}}
oDCkey1:HyperLabel := HyperLabel{#key1,NULL_STRING,NULL_STRING,NULL_STRING}
oDCkey1:FocusSelect := FSEL_ALL

oDCkey2 := SingleLineEdit{self,ResourceID{_SMARTFIND_KEY2,_GetInst()}}
oDCkey2:HyperLabel := HyperLabel{#key2,NULL_STRING,NULL_STRING,NULL_STRING}
oDCkey2:FocusSelect := FSEL_ALL

oDCkey3 := SingleLineEdit{self,ResourceID{_SMARTFIND_KEY3,_GetInst()}}
oDCkey3:HyperLabel := HyperLabel{#key3,NULL_STRING,NULL_STRING,NULL_STRING}
oDCkey3:FocusSelect := FSEL_ALL

oDCkey4 := SingleLineEdit{self,ResourceID{_SMARTFIND_KEY4,_GetInst()}}
oDCkey4:HyperLabel := HyperLabel{#key4,NULL_STRING,NULL_STRING,NULL_STRING}
oDCkey4:FocusSelect := FSEL_ALL

oDCkey5 := SingleLineEdit{self,ResourceID{_SMARTFIND_KEY5,_GetInst()}}
oDCkey5:HyperLabel := HyperLabel{#key5,NULL_STRING,NULL_STRING,NULL_STRING}
oDCkey5:FocusSelect := FSEL_ALL

oDCkey6 := SingleLineEdit{self,ResourceID{_SMARTFIND_KEY6,_GetInst()}}
oDCkey6:HyperLabel := HyperLabel{#key6,NULL_STRING,NULL_STRING,NULL_STRING}
oDCkey6:FocusSelect := FSEL_ALL

oDCkey7 := SingleLineEdit{self,ResourceID{_SMARTFIND_KEY7,_GetInst()}}
oDCkey7:HyperLabel := HyperLabel{#key7,NULL_STRING,NULL_STRING,NULL_STRING}
oDCkey7:FocusSelect := FSEL_ALL

oDCKeepOpenCheckBox := CheckBox{self,ResourceID{_SMARTFIND_KEEPOPENCHECKBOX,_GetInst()}}
oDCKeepOpenCheckBox:HyperLabel := HyperLabel{#KeepOpenCheckBox,_chr(38)+"Manter Janela Visivel",NULL_STRING,NULL_STRING}

oDCIncrementCheckBox := CheckBox{self,ResourceID{_SMARTFIND_INCREMENTCHECKBOX,_GetInst()}}
oDCIncrementCheckBox:HyperLabel := HyperLabel{#IncrementCheckBox,_chr(38)+"Busca Incremental",NULL_STRING,NULL_STRING}

oDCCue1 := FixedText{self,ResourceID{_SMARTFIND_CUE1,_GetInst()}}
oDCCue1:HyperLabel := HyperLabel{#Cue1,"Indexkey1",NULL_STRING,NULL_STRING}

oDCCue2 := FixedText{self,ResourceID{_SMARTFIND_CUE2,_GetInst()}}
oDCCue2:HyperLabel := HyperLabel{#Cue2,"Indexkey2",NULL_STRING,NULL_STRING}

oDCCue3 := FixedText{self,ResourceID{_SMARTFIND_CUE3,_GetInst()}}
oDCCue3:HyperLabel := HyperLabel{#Cue3,"Indexkey3",NULL_STRING,NULL_STRING}

oDCCue4 := FixedText{self,ResourceID{_SMARTFIND_CUE4,_GetInst()}}
oDCCue4:HyperLabel := HyperLabel{#Cue4,"Indexkey4",NULL_STRING,NULL_STRING}

oDCCue5 := FixedText{self,ResourceID{_SMARTFIND_CUE5,_GetInst()}}
oDCCue5:HyperLabel := HyperLabel{#Cue5,"Indexkey5",NULL_STRING,NULL_STRING}

oDCCue6 := FixedText{self,ResourceID{_SMARTFIND_CUE6,_GetInst()}}
oDCCue6:HyperLabel := HyperLabel{#Cue6,"Indexkey6",NULL_STRING,NULL_STRING}

oDCCue7 := FixedText{self,ResourceID{_SMARTFIND_CUE7,_GetInst()}}
oDCCue7:HyperLabel := HyperLabel{#Cue7,"Indexkey7",NULL_STRING,NULL_STRING}

oDCGroupBox1 := GroupBox{self,ResourceID{_SMARTFIND_GROUPBOX1,_GetInst()}}
oDCGroupBox1:HyperLabel := HyperLabel{#GroupBox1,"Localizar",NULL_STRING,NULL_STRING}

oCCExitPB := PushButton{self,ResourceID{_SMARTFIND_EXITPB,_GetInst()}}
oCCExitPB:HyperLabel := HyperLabel{#ExitPB,NULL_STRING,NULL_STRING,NULL_STRING}
oCCExitPB:Image := ico_sair{}
oCCExitPB:TooltipText := "Clique aqui Para Cancelar"

oDCtheFixedText9 := FixedText{self,ResourceID{_SMARTFIND_THEFIXEDTEXT9,_GetInst()}}
oDCtheFixedText9:HyperLabel := HyperLabel{#theFixedText9,"Encerrar",NULL_STRING,NULL_STRING}

oCCFindPB := PushButton{self,ResourceID{_SMARTFIND_FINDPB,_GetInst()}}
oCCFindPB:HyperLabel := HyperLabel{#FindPB,NULL_STRING,NULL_STRING,NULL_STRING}
oCCFindPB:TooltipText := "Localizar"
oCCFindPB:Image := ico_find{}

oDCtheFixedText10 := FixedText{self,ResourceID{_SMARTFIND_THEFIXEDTEXT10,_GetInst()}}
oDCtheFixedText10:HyperLabel := HyperLabel{#theFixedText10,"Localizar",NULL_STRING,NULL_STRING}

oCCIndexPB := PushButton{self,ResourceID{_SMARTFIND_INDEXPB,_GetInst()}}
oCCIndexPB:Image := ico_az{}
oCCIndexPB:HyperLabel := HyperLabel{#IndexPB,NULL_STRING,NULL_STRING,NULL_STRING}

oDCtheFixedText11 := FixedText{self,ResourceID{_SMARTFIND_THEFIXEDTEXT11,_GetInst()}}
oDCtheFixedText11:HyperLabel := HyperLabel{#theFixedText11,"Ordenar",NULL_STRING,NULL_STRING}

self:Caption := "DataDialog Caption"
self:HyperLabel := HyperLabel{#_smartfind,"DataDialog Caption",NULL_STRING,NULL_STRING}

if !IsNil(oServer)
	self:Use(oServer)
endif

self:PostInit(oWindow,iCtlID,oServer,uExtra)

return self


access KeepOpenCheckBox() 
return self:FieldGet(#KeepOpenCheckBox)


assign KeepOpenCheckBox(uValue) 
self:FieldPut(#KeepOpenCheckBox, uValue)
return KeepOpenCheckBox := uValue


access key1() 
return self:FieldGet(#key1)


assign key1(uValue) 
self:FieldPut(#key1, uValue)
return key1 := uValue


access key2() 
return self:FieldGet(#key2)


assign key2(uValue) 
self:FieldPut(#key2, uValue)
return key2 := uValue


access key3() 
return self:FieldGet(#key3)


assign key3(uValue) 
self:FieldPut(#key3, uValue)
return key3 := uValue


access key4() 
return self:FieldGet(#key4)


assign key4(uValue) 
self:FieldPut(#key4, uValue)
return key4 := uValue


access key5() 
return self:FieldGet(#key5)


assign key5(uValue) 
self:FieldPut(#key5, uValue)
return key5 := uValue


access key6() 
return self:FieldGet(#key6)


assign key6(uValue) 
self:FieldPut(#key6, uValue)
return key6 := uValue


access key7() 
return self:FieldGet(#key7)


assign key7(uValue) 
self:FieldPut(#key7, uValue)
return key7 := uValue


access Keyselect() 
return self:FieldGet(#Keyselect)


assign Keyselect(uValue) 
self:FieldPut(#Keyselect, uValue)
return Keyselect := uValue


END CLASS
