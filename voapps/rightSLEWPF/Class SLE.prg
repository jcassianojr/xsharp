// Class_SLE.prg
#using System
#using System.Collections.Generic
#using System.Text
#using System.Windows
#USING System.Windows.Input
#using System.Windows.Controls
#using System.Windows.Data
#using System.Windows.Documents
#Using System.ComponentModel
#DEFINE MAX_FMTSTRING_LEN 4096
Begin NameSpace wmGUI.wpf
CLASS SLE INHERIT System.Windows.Controls.TextBox
#Region "   ivars   "
    // **********************************************************
    // * Global Settings iVars. These are static so             *
    // * they can affect multible SLEs                          *
    // **********************************************************
    STATIC HIDDEN DefaultEnterHandling      := KeyHandling.Process AS KeyHandling
	STATIC HIDDEN DefaultArrowHandling      := KeyHandling.Process AS KeyHandling
	STATIC HIDDEN DefaultFocusBehavior      := focusBehavior.All AS focusBehavior
	STATIC HIDDEN DefaultOverWriteBehavior  := overwriteBehavior.Auto as overwriteBehavior
	STATIC HIDDEN DefaultScrlModeBehavior   := scrlModeBehavior.Full as scrlModeBehavior
	STATIC HIDDEN DefaultBitmapHandling     := ImageHandling.Auto AS ImageHandling
    // **********************************************************
    // * end global settings section                            *
    // **********************************************************
    HIDDEN _FieldSpec           AS STRING
    HIDDEN _Picture             AS STRING
	PROTECT EnterHandling        := KeyHandling.Auto AS KeyHandling
	PROTECT ArrowHandling        := KeyHandling.Auto AS KeyHandling
	PROTECT focusHandling        := focusBehavior.auto as FocusBehavior
	PROTECT overwriteHandling    := overwriteBehavior.Auto as overwriteBehavior
	PROTECT scrlModeHandling     := scrlModeBehavior.Full as scrlModeBehavior
    PROTECT bitmapHandling       := ImageHandling.Auto as ImageHandling
    
    PROTECT nSLEType            AS SLEtype
    PROTECT lAutoFocusChange    AS LOGIC
    PROTECT oEditString         AS EditMask
    PROTECT oFieldSpec          AS PictureSpec
    PROTECT nSelectionStart     AS long
    PROTECT nSelectionLength    AS long
    PROTECT lKeyHandled         AS Logic  // keeps the delete key form being handled more than once
    PROTECT lModified           AS Logic

#ENDREGION
#REGION "   Constructors   "    
/****************************************************************************/
CONSTRUCTOR()
    super()
    
    RETURN
#ENDREGION
#REGION "   GUI Class CallBacks "
/****************************************************************************/
Protected METHOD OnTextInput(e As System.Windows.Input.TextCompositionEventArgs) as void
    LOCAL nKeyCode  AS long
    LOCAL cChar	AS String
	cChar                   := e:Text
	nKeyCode                := (long)AscW(cChar)
	// ********************************************************
    // * Here is where we will hook in the processing for the *
    // * rightSLE key processing                              *
    // ********************************************************
    if !SELF:lKeyHandled == TRUE
        IF self:oEditString <> NULL_OBJECT
            // ********************************************************************
            // * we have an editString which means that they have a picture       *
            // * to apply. the first thing that we have to test is the selection. *
            // * If we are on selection[0], we have to test the mask to see if    *
            // * if the first masked position is an editable one. If it isnt,     *
            // * move the cursor to the first editable position, then apply the   *
            // * mask.                                                            *
            // ******************************************************************** 
            if !SELF:ReadOnly
                IF SELF:SelectionStart == 0
                    SELF:oEditString:TestFirstChar()
                ENDIF
                // we have a valid picture, apply the mask
                IF SELF:oEditString:ProcessKeyEvent(nKeyCode)
                    e:Handled := TRUE
                ENDIF
            ELSE
                e:Handled := TRUE
            ENDIF
        ENDIF          
    ELSE
        e:Handled        := TRUE
//        SELF:lKeyHandled := FALSE
    ENDIF        
    // always call the super if we dont handle the keypress
    SUPER:OnTextInput(e)            
    RETURN    
/****************************************************************************/
Protected METHOD OnPreviewKeyDown(e As System.Windows.Input.KeyEventArgs) as void
    local nKeyCode  AS long
    nKeyCode                := e:Key
    SELF:nSelectionStart    := SELF:SelectionStart
    SELF:nSelectionLength   := SELF:SelectionLength	
    // ********************************************************
    // * Here is where we will hook in the processing for the *
    // * rightSLE key processing                              *
    // ********************************************************
    if !SELF:ReadOnly
        IF self:oEditString <> NULL_OBJECT
            IF SELF:SelectionStart == 0
                SELF:oEditString:TestFirstChar()
            ENDIF
            // we have a valid picture, apply the mask
            IF nKeycode == Key.Delete .or. nKeyCode == Key.OemPeriod .or. nKeyCode == Key.Decimal .or. nKeyCode == Key.Back
                IF SELF:oEditString:ProcessKeyEvent(nKeyCode)
//                    if nKeyCode == Key.Back .or. nKeyCode == Key.OemPeriod .or. nKeyCode == Key.Decimal
//                        SELF:lKeyHandled := TRUE
//                    endif
                    e:Handled := TRUE
//                ELSE
//                    SELF:lKeyHandled := FALSE
                ENDIF
            ENDIF
        ENDIF
    ELSE
        e:Handled := TRUE
    ENDIF
      
    // always call the super if we dont handle the keypress
    SUPER:onPreviewKeyDown(e)
    RETURN
    
#ENDREGION    
#REGION "   Methods   "

/****************************************************************************/
VIRTUAL METHOD CreateFormattedString(cPicture AS String, Type AS SLEType,DefaultTemplate as string) as void
	SELF:oEditString := EditMask{SELF, cPicture, Type, EffectiveOverwrite, DefaultTemplate,EffectiveScrlMode}
	RETURN

/****************************************************************************/
Method GetSetFieldSpec(oFS as PictureSpec) as PictureSpec
    IF oFS <> NULL
        SELF:oFieldSpec := oFS
        SELF:ProcessFS()	    
    ENDIF
    RETURN SELF:oFieldSpec

/****************************************************************************/
Method ProcessFS() as VOID
    local VT        AS SLEType
    LOCAL sPic      AS STRING
	LOCAL sDefTempl AS STRING    
	LOCAL pos       AS LONG
	
    
    VT  := SELF:oFieldSpec:Type
	DO CASE
	CASE vt == SLEType.Character
		sDefTempl := Replicate("X", Min(oFieldSpec:Length, MAX_FMTSTRING_LEN))
	CASE vt == SLEType.Logic
		sDefTempl := "L"
	CASE vt == SLEType.Numeric
		sDefTempl := Replicate("#", Min(oFieldSpec:Length, MAX_FMTSTRING_LEN))
		IF (oFieldSpec:Decimals > 0)
			pos := oFieldSpec:Length - oFieldSpec:Decimals
			sDefTempl := Left(sDefTempl, (dword)Pos - 1) + "." + Replicate("#", (dword)oFieldSpec:Decimals)
		ENDIF
	ENDCASE
	
	IF SELF:Picture <> null
		sPic := SELF:Picture
	ELSEIF	oFieldSpec:Picture <> null
		sPic := oFieldSpec:Picture
	ELSEIF (vt == SLEType.Date)
		sPic := "@D"
	ENDIF

	IF (NULL_STRING != sPic)
		SELF:CreateFormattedString(sPic, vT,NULL /*sDefTempl*/)
	ENDIF

	DO CASE
	    CASE (vt == SLEType.Character)
		    SELF:Value := ""
	    CASE (vt == SLEType.Logic)
		    SELF:Value := FALSE
	    CASE (vt == SLEType.Numeric)
		    IF (oFieldSpec:Decimals > 0)
			    SELF:Value := 0.0
		    ELSE
			    SELF:Value := 0
		    ENDIF
	ENDCASE
	SELF:modified := FALSE
    RETURN	

/****************************************************************************/
METHOD updateFieldspec(OFS AS PictureSpec) AS VOID
//	LOCAL sPicture	AS STRING
	LOCAL cTextVal	AS STRING
	
	// get the old value
	cTextval	:= SELF:Text
	
	// set the fieldspec with the new version
	SELF:oFieldSpec         := null             // reset the FieldSpect or the Picture will not work correctly
	SELF:Picture		    := null	        	// correctly clears the oEditString 
	SELF:oFieldSpec		    := oFS
	SELF:ProcessFS()                            // create the new editstring for this fieldspec
	
	// reset the value of the SLE
 	SELF:oEditString:Text 	:= cTextVal // Self:oFieldSpec:Val(cTextVal)	// restore the textval. Let Vulcan deal with the rest

	RETURN	
    
#ENDREGION
#REGION "   Access / Assigns   "    
       
/****************************************************************************/
ACCESS AutoFocusChange as LOGIC
	RETURN lAutoFocusChange    

/****************************************************************************/
ASSIGN AutoFocusChange(lVar as LOGIC) as VOID
    SELF:lAutoFocusChange := lVar
    RETURN

/****************************************************************************/
ACCESS __CurPos as long
    return self:SelectionStart + 1  // zero based in Winforms

/****************************************************************************/
Assign __CurPos(iNewPos as long) as void
    LOCAL nTextLength   as LONG
    nTextLength     := SELF:text:length
    IF (iNewPos > 0)
		SELF:SelectionStart     := iNewPos-1
		SELF:SelectionLength    := 0   // iNewPos-1
	ELSE
        SELF:SelectionStart := 0
        SELF:SelectionLength := nTextLength
	ENDIF

/****************************************************************************/
ACCESS __CurLen as long
    RETURN SELF:SelectionLength 

/****************************************************************************/
STATIC ASSIGN DefaultProcessEnter(newValue AS KeyHandling) AS VOID
	// The default needs to be a definite action
	IF newValue == KeyHandling.Auto
		newvalue := KeyHandling.Process
	ENDIF
	DefaultEnterHandling := newValue
	RETURN

/****************************************************************************/
STATIC ACCESS DefaultProcessEnter() AS KeyHandling 
	RETURN DefaultEnterHandling

/****************************************************************************/
STATIC ASSIGN DefaultProcessArrow(newValue AS KeyHandling) AS VOID 
	// The default needs to be a definite action
	IF newValue == KeyHandling.Auto
		newvalue := KeyHandling.Process
	ENDIF
	DefaultArrowHandling := newValue
	RETURN

/****************************************************************************/
STATIC ACCESS DefaultProcessArrow() AS KeyHandling
	RETURN DefaultArrowHandling

/****************************************************************************/
STATIC ASSIGN DefaultOverwrite(newValue AS overwriteBehavior) AS VOID 
	// The default needs to be a definite action
	IF newValue == OverwriteBehavior.Auto
		newvalue := OverwriteBehavior.Never
	ENDIF
	DefaultOverwritebehavior := newValue
	RETURN

/****************************************************************************/
STATIC ACCESS DefaultOverwrite() AS overwriteBehavior
	RETURN DefaultOverwriteBehavior

/****************************************************************************/
STATIC ASSIGN DefaultScrlMode(newValue AS scrlModeBehavior) AS VOID 
	// The default needs to be a definite action
	IF newValue == scrlModeBehavior.Auto
		newvalue := scrlModeBehavior.Full
	ENDIF
	DefaultScrlModeBehavior := newValue
	RETURN

/****************************************************************************/
STATIC ACCESS DefaultScrlMode() as scrlModeBehavior
    RETURN DefaultScrlModeBehavior

/****************************************************************************/
STATIC ASSIGN DefaultSelectionOnFocus(newValue AS focusBehavior) AS VOID
	// The default needs to be a definite action
	IF newValue == focusBehavior.Auto
		newvalue := focusBehavior.Trimmed 
	ENDIF
	DefaultFocusBehavior := newValue
	RETURN

/****************************************************************************/
STATIC ACCESS DefaultSelectionOnFocus() AS focusBehavior
	RETURN DefaultFocusBehavior

/****************************************************************************/
STATIC ASSIGN DefaultUseInternalBitmaps(newValue AS ImageHandling) AS VOID
	// The default needs to be a definite action
	IF newValue == ImageHandling.Auto
		newvalue := ImageHandling.InternalBitmap
	ENDIF
	DefaultBitmapHandling := newValue
	RETURN


/****************************************************************************/
STATIC ACCESS DefaultUseInternalBitmaps() AS ImageHandling
	RETURN DefaultBitmapHandling

/****************************************************************************/
ACCESS EffectiveBitmapHandling AS ImageHandling
	LOCAL handling AS ImageHandling

	IF SELF:bitmapHandling == ImageHandling.Auto
		handling := DefaultBitmapHandling
	ELSE
		handling := bitmapHandling
	ENDIF

	RETURN handling

/****************************************************************************/
ACCESS EffectiveProcessEnter AS KeyHandling
	LOCAL handling AS KeyHandling

	IF SELF:EnterHandling == KeyHandling.Auto
		handling := DefaultEnterHandling
	ELSE
		handling := EnterHandling
	ENDIF

	RETURN handling

/****************************************************************************/
ACCESS EffectiveProcessArrow AS KeyHandling
	LOCAL handling AS KeyHandling

	IF SELF:ArrowHandling == KeyHandling.Auto
		handling := DefaultArrowHandling
	ELSE
		handling := ArrowHandling
	ENDIF

	RETURN handling

/****************************************************************************/
ACCESS EffectiveOverwrite AS overwriteBehavior
	LOCAL handling AS overwriteBehavior

	IF SELF:overwriteHandling == overwriteBehavior.Auto
		handling := DefaultOverwriteBehavior
	ELSE
		handling := overwriteHandling
	ENDIF

	RETURN handling

/****************************************************************************/
ACCESS EffectiveScrlMode AS scrlModeBehavior 
	LOCAL handling AS scrlModeBehavior

	IF SELF:scrlModeHandling == scrlModeBehavior.Auto
		handling := DefaultscrlModeBehavior
	ELSE
		handling := scrlModeHandling
	ENDIF

	RETURN handling

/****************************************************************************/
ACCESS EffectiveSelectionOnFocus AS FocusBehavior 
	LOCAL handling AS FocusBehavior

	IF SELF:focusHandling == focusBehavior.Auto
		handling := DefaultFocusBehavior
	ELSE
		handling := focusHandling
	ENDIF

	RETURN handling

/****************************************************************************/
ACCESS FieldSpec as String
    LOCAL cResult AS String
//    IF SELF:DesignMode
//        cResult := SELF:_FieldSpec
//    ELSE
        IF SELF:oFieldSpec == null
            cResult := null
        ELSE
            cResult := SELF:oFieldSpec:Name
        ENDIF
//    ENDIF
    RETURN cResult
    
/****************************************************************************/
ASSIGN FieldSpec(cVar as String) as void
    local oPictureSpec as object
//    IF SELF:DesignMode
//        SELF:_FieldSpec := cVar
//    ELSE
        if cVar == NULL
            SELF:oEditString := NULL
        ELSE
            oPictureSpec            := CreateClass(cVar)
            SELF:oFieldSpec         := (PictureSpec)oPictureSpec
            SELF:oFieldSpec:Name    := cVar
            SELF:ProcessFS()
        endif
//    ENDIF
    return


/****************************************************************************/
ACCESS Picture as string
    local cPicture  as string
//    IF SELF:DesignMode
//        cPicture := SELF:_Picture
//    ELSE
	    IF oEditString == NULL
		    cPicture := NULL
	    else
	        cPicture := SELF:oEditString:Picture 
	    ENDIF
//	ENDIF
    RETURN cPicture

/****************************************************************************/
ASSIGN Picture(newPicture as string) as void
    LOCAL cOldValue as STRING
//    IF SELF:DesignMode
//        SELF:_Picture   := newPicture
//    ELSE
        if Empty(newPicture)
            newPicture := null
        endif
	    IF (SELF:oEditString == NULL) .and. (newPicture <> null)
		    SELF:CreateFormattedString(NewPicture,SELF:nSLEType,NULL)
	    ELSE
		    IF NewPicture == null .and. SELF:oFieldSpec == null
			    SELF:oEditString := NULL
		    ELSEif NewPicture <> null
			    cOldValue               := SELF:Text
			    oEditString:Picture     := NewPicture
			    oEditString:Text        := cOldValue
		    ENDIF
	    ENDIF
//    ENDIF	    
	
    RETURN



/****************************************************************************/
ACCESS __SavedCurPos as long
    return self:nSelectionStart + 1  // zero based in Winforms

/****************************************************************************/
ACCESS __SavedCurLen as long
    RETURN SELF:nSelectionLength 
    
/****************************************************************************/
ASSIGN Value(uValue AS Object) as Void
	IF SELF:oEditString != NULL
		oEditString:Text := uValue:ToString()   // this sets the owner's text based on the picture
		SELF:Modified    := FALSE
	ELSE
		SELF:Text        := uValue:ToString()
	ENDIF
	RETURN
	
/****************************************************************************/
Access ReadOnly AS Logic
    RETURN SELF:IsReadOnly
    
/****************************************************************************/
Assign Readonly(lValue as Logic) as Void
    SELF:IsReadOnly := lValue
    RETURN

/****************************************************************************/
Access Modified  AS Logic
    RETURN SELF:lModified
    
/****************************************************************************/
Assign Modified(lValue as Logic) as Void
    SELF:lModified := lValue
    RETURN

#ENDREGION    
end class
END NameSpace