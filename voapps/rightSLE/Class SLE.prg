#Using System.Windows.Forms
#Using System.ComponentModel
#USING rightSLE.Internal
#DEFINE MAX_FMTSTRING_LEN 4096
CLASS SLE INHERIT System.Windows.Forms.Textbox
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
	PROTECT _FieldSpec           AS STRING
	PROTECT _Picture             AS STRING
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
	PROTECT lKeyHandled         AS LOGIC  // keeps the delete key form being handled more than once
	PROTECT lFSAddedByClass     AS LOGIC  // This is set up so the VS IDE putting of NULL doesnt 
										  // doesnt affect a RSLE subclass that prefefines
										  // a fieldspec
	PROTECT uValue              AS OBJECT // this contains the unformatted string
	HIDDEN lFromText            AS LOGIC
#ENDREGION
#REGION "   Constructors   "    
/****************************************************************************/
CONSTRUCTOR()
	super()
	
	RETURN
#ENDREGION
#REGION "   GUI Class CallBacks "
/****************************************************************************/
Protected METHOD OnKeyPress(e As System.Windows.Forms.KeyPressEventArgs) as void
	LOCAL nKeyCode  AS long
	LOCAL cChar	AS char

	SUPER:onKeyPress(e) // this used to be at the end of this method


	cChar                   := e:KeyChar
	nKeyCode                := (long)AscW(cChar:ToString())
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
				IF SELF:oEditString:ProcessKeyEvent(nKeyCode,false)
					e:Handled := TRUE
				ENDIF
			ELSE
				e:Handled := TRUE
			ENDIF
		ENDIF
	 
	ELSE
		e:Handled        := TRUE
		SELF:lKeyHandled := FALSE
	ENDIF        
	RETURN    

/****************************************************************************/
Protected METHOD OnKeyDown(e As System.Windows.Forms.KeyEventArgs) as void
	local nKeyCode  AS long

	 // always call the super if we dont handle the keypress
	 SUPER:onKeyDown(e) // this was at the end of this method

	nKeyCode                := e:KeyCode  
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
			IF nKeycode == Keys.Delete .or. nKeyCode == Keys.OemPeriod .or. nKeyCode == Keys.Decimal .or. nKeyCode == Keys.Back
				IF SELF:oEditString:ProcessKeyEvent(nKeyCode, true)
					if nKeyCode == Keys.Back .or. nKeyCode == Keys.OemPeriod .or. nKeyCode == Keys.Decimal
						SELF:lKeyHandled := TRUE
					endif
					e:Handled := TRUE
				ELSE
					SELF:lKeyHandled := FALSE
				ENDIF
			ENDIF
		ENDIF
	ELSE
		e:Handled := TRUE
	ENDIF
	  
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
	SELF:oFieldSpec         := NULL             // reset the FieldSpect or the Picture will not work correctly
	SELF:Picture		    := NULL	        	// correctly clears the oEditString 
	SELF:oFieldSpec		    := OFS
	SELF:ProcessFS()                            // create the new editstring for this fieldspec
	
	// reset the value of the SLE
	SELF:oEditString:Text 	:= cTextVal // Self:oFieldSpec:Val(cTextVal)	// restore the textval. Let Vulcan deal with the rest

	RETURN	

/****************************************************************************/
METHOD SetText(cText AS STRING) AS VOID
	LOCAL cNumText  AS STRING
	LOCAL cNewText  AS STRING
	LOCAL cType     AS STRING

	SUPER:Text := cText
	IF SELF:Picture != NULL
		IF SELF:oFieldSpec != NULL
			IF (oFieldSpec:Type == SLEType.Numeric)
				IF oEditString != NULL
					cNumText := oEditString:RemoveFormatting(cText)
				ELSE
					cNumText := cText
				ENDIF
				cNumText    := StrTran(cNumText, " ", "")
				SELF:uValue := Val(cNumText)
			ELSE
				cType       := SELF:oFieldSpec:TypeAsString
				SELF:uValue := Unformat(cText, SELF:Picture, cType)
			ENDIF
		ELSE            
			SELF:uValue := Unformat(cText, SELF:Picture, "C")
		ENDIF
	ELSE
		SELF:uValue := SELF:Text
	ENDIF

	RETURN
	
#ENDREGION
#REGION "   Access / Assigns   "    
	   
/****************************************************************************/
PROPERTY AutoFocusChange AS LOGIC
	GET
		RETURN lAutoFocusChange    
	END GET
	SET
		SELF:lAutoFocusChange := value
	END SET
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY __CurPos AS LONG
	GET
		RETURN SELF:SelectionStart + 1  // zero based in Winforms
	END GET
	SET
		LOCAL iNewPos       AS LONG
		LOCAL nTextLength   AS LONG
		iNewPos         := value
		nTextLength     := SELF:text:length
		IF (iNewPos > 0)
			SELF:SelectionStart     := iNewPos-1
			SELF:SelectionLength    := 0   // iNewPos-1
		ELSE
			SELF:SelectionStart := 0
			SELF:SelectionLength := nTextLength
		ENDIF
	END SET
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY __CurLen AS LONG
	GET
		RETURN SELF:SelectionLength 
	END GET
END PROPERTY
/****************************************************************************/
STATIC PROPERTY DefaultProcessEnter AS KeyHandling 
	GET
		RETURN DefaultEnterHandling
	END GET
	SET
		IF VALUE == KeyHandling.Auto
			VALUE := KeyHandling.Process
		ENDIF
		DefaultEnterHandling := VALUE
		RETURN
	END SET
END PROPERTY
/****************************************************************************/
STATIC PROPERTY DefaultProcessArrow AS KeyHandling
	GET
		RETURN DefaultArrowHandling
	END get
	SET
		IF VALUE == KeyHandling.Auto
			VALUE := KeyHandling.Process
		ENDIF
		DefaultArrowHandling := VALUE
		RETURN
	END SET
END PROPERTY
/****************************************************************************/
STATIC PROPERTY DefaultOverwrite AS overwriteBehavior
	GET
		RETURN DefaultOverwriteBehavior
	END GET
	SET
		IF VALUE == OverwriteBehavior.Auto
			VALUE := OverwriteBehavior.Never
		ENDIF
		DefaultOverwritebehavior := VALUE
		RETURN
	END SET
END PROPERTY
/****************************************************************************/
STATIC PROPERTY DefaultScrlMode AS scrlModeBehavior
	GET
		RETURN DefaultScrlModeBehavior
	END GET
	SET
		IF VALUE == scrlModeBehavior.Auto
			VALUE := scrlModeBehavior.Full
		ENDIF
		DefaultScrlModeBehavior := VALUE
		RETURN
	END SET
END PROPERTY
/****************************************************************************/
STATIC PROPERTY DefaultSelectionOnFocus AS focusBehavior
	GET
		RETURN DefaultFocusBehavior
	END GET
	SET
		IF VALUE == focusBehavior.Auto
			VALUE := focusBehavior.Trimmed 
		ENDIF
		DefaultFocusBehavior := VALUE
		RETURN
	END SET
END PROPERTY
/****************************************************************************/
STATIC PROPERTY DefaultUseInternalBitmaps AS ImageHandling
	GET
		RETURN DefaultBitmapHandling
	END GET
	SET
		IF VALUE == ImageHandling.Auto
			VALUE := ImageHandling.InternalBitmap
		ENDIF
		DefaultBitmapHandling := VALUE
		RETURN
	END SET
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY EffectiveBitmapHandling AS ImageHandling
	GET
		LOCAL handling AS ImageHandling
		IF SELF:bitmapHandling == ImageHandling.Auto
			handling := DefaultBitmapHandling
		ELSE
			handling := bitmapHandling
		ENDIF
		RETURN handling
	END GET
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY EffectiveProcessEnter AS KeyHandling
	GET
		LOCAL handling AS KeyHandling
		IF SELF:EnterHandling == KeyHandling.Auto
			handling := DefaultEnterHandling
		ELSE
			handling := EnterHandling
		ENDIF
		RETURN handling
	END get
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY EffectiveProcessArrow AS KeyHandling
	GET
		LOCAL handling AS KeyHandling
		IF SELF:ArrowHandling == KeyHandling.Auto
			handling := DefaultArrowHandling
		ELSE
			handling := ArrowHandling
		ENDIF
		RETURN handling
	END GET
END PROPERTY

/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY EffectiveOverwrite AS overwriteBehavior
	GET
		LOCAL handling AS overwriteBehavior
		IF SELF:overwriteHandling == overwriteBehavior.Auto
			handling := DefaultOverwriteBehavior
		ELSE
			handling := overwriteHandling
		ENDIF
		RETURN handling
	END GET
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY EffectiveScrlMode AS scrlModeBehavior 
	GET
		LOCAL handling AS scrlModeBehavior
		IF SELF:scrlModeHandling == scrlModeBehavior.Auto
			handling := DefaultscrlModeBehavior
		ELSE
			handling := scrlModeHandling
		ENDIF
		RETURN handling
	END GET
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY EffectiveSelectionOnFocus AS FocusBehavior
	GET
		LOCAL handling AS FocusBehavior 
		IF SELF:focusHandling == focusBehavior.Auto
			handling := DefaultFocusBehavior
		ELSE
			handling := focusHandling
		ENDIF
		RETURN handling
	END GET
END PROPERTY
/****************************************************************************/
[Description("The fieldspec contains the name of a PictureSpec class that will be invoked to handle the picture and type of the textbox")];
PROPERTY FieldSpec AS STRING
	GET
		LOCAL cResult AS STRING
		IF SELF:DesignMode
			cResult := SELF:_FieldSpec
		ELSE
			IF SELF:oFieldSpec == NULL
				IF SELF:lFSAddedByClass
					cResult := SELF:_FieldSpec
				ELSE
					cResult := NULL
				ENDIF
			ELSE
				cResult := SELF:oFieldSpec:Name
			ENDIF
		ENDIF
		RETURN cResult
	END GET
	SET
		LOCAL oPictureSpec AS OBJECT
		LOCAL cVar         AS STRING
		cVar := VALUE
		IF SELF:DesignMode
			SELF:_FieldSpec := cVar
		ELSE
			IF STRING.IsNullOrEmpty(cVar) .and. !SELF:lFSAddedByClass
				SELF:oEditString := NULL
			ELSE
				// **********************************************
				// the subclass sets this ivar to true. when    *
				// the form is finalized, the access zSetButton *
				// is called and it resets it. Otherwise if you *
				// donet set the ivar, the designer will set it *
				// to null and your picture is ignored          *
				// **********************************************
				IF SELF:lFSAddedByClass    
					SELF:lFSAddedByClass := FALSE
					IF SELF:DesignMode
						SELF:_FieldSpec         := cVar
					ELSE
						IF STRING.IsNullOrEmpty(cVar)
							cVar := SELF:_FieldSpec
						ENDIF
						SELF:_FieldSpec         := cVar
						oPictureSpec            := CreateClass(cVar)
						SELF:oFieldSpec         := (PictureSpec)oPictureSpec
						SELF:oFieldSpec:Name    := cVar
						SELF:ProcessFS()
					ENDIF
				ELSE
					IF STRING.IsNullOrEmpty(cVar)
						cVar := SELF:_FieldSpec
					ENDIF
					SELF:_FieldSpec         := cVar
					oPictureSpec            := CreateClass(cVar)
					SELF:oFieldSpec         := (PictureSpec)oPictureSpec
					SELF:oFieldSpec:Name    := cVar
					SELF:ProcessFS()
				ENDIF
			ENDIF
		ENDIF
	END Set
END PROPERTY
/****************************************************************************/
PROPERTY Picture AS STRING
	GET
		LOCAL cPicture  AS STRING
		IF SELF:DesignMode
			cPicture := SELF:_Picture
		ELSE
			IF oEditString == NULL
				cPicture := NULL
			ELSE
				cPicture := SELF:oEditString:Picture 
			ENDIF
		ENDIF
		RETURN cPicture
	END GET
	SET
		LOCAL cOldValue AS STRING
		LOCAL newPicture AS STRING
		newPicture := VALUE
		IF SELF:DesignMode
			SELF:_Picture   := newPicture
		ELSE
			IF Empty(newPicture)
				newPicture := NULL
			ENDIF
			IF (SELF:oEditString == NULL) .and. (newPicture <> NULL)
				SELF:CreateFormattedString(NewPicture,SELF:nSLEType,NULL)
			ELSE
				IF NewPicture == NULL .and. SELF:oFieldSpec == NULL
					SELF:oEditString := NULL
				ELSEIF NewPicture <> NULL
					cOldValue               := SELF:Text
					oEditString:Picture     := NewPicture
					oEditString:Text        := cOldValue
				ENDIF
			ENDIF
		ENDIF	    	
		RETURN
	END SET
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY __SavedCurPos AS LONG
	GET
		RETURN SELF:nSelectionStart + 1  // zero based in Winforms
	END GET
END PROPERTY
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY __SavedCurLen AS LONG
	GET
		RETURN SELF:nSelectionLength 
	END GET
END PROPERTY	
/****************************************************************************/
[BrowsableAttribute(FALSE)];
PROPERTY @@Value AS OBJECT
	GET
		RETURN SELF:uValue
	END GET
	SET
		LOCAL uTmp AS OBJECT
		uTmp := VALUE
		IF uTmp <> NULL
			IF SELF:oEditString != NULL
				oEditString:Text := uTmp:ToString()   // this sets the owner's text based on the picture
				SELF:Modified    := FALSE
			ELSE
				IF !SELF:lFromText
					SELF:Text        := uTmp:ToString()				
				ENDIF
				SELF:uValue := uTmp:ToString()
			ENDIF
		ENDIF
		RETURN
	END SET
END PROPERTY
/****************************************************************************/
VIRTUAL PROPERTY Text AS STRING
	GET
		RETURN SUPER:Text
	END GET
	SET
		IF SELF:DesignMode
			SUPER:Text   := Value
		ELSE
			SELF:lFromText := TRUE
			IF !STRING.IsNullOrEmpty(VALUE)
				IF VALUE:Length > 0
					IF SELF:oEditString != NULL
						oEditString:Text := VALUE:ToString()   // this sets the owner's text based on the picture
						SELF:Modified    := FALSE
					ELSE
						SUPER:Text       := VALUE:ToString()
						SELF:Value       := VALUE:ToString()
					ENDIF
				ELSE
					IF SELF:oEditString != NULL
						oEditString:Text := STRING.Empty
						SELF:Modified    := FALSE
					ELSE
						SUPER:Text       := STRING.Empty
						SELF:Value       := STRING.Empty
					ENDIF
				ENDIF
			ELSE
				SUPER:Text       := STRING.Empty
				SELF:Value       := STRING.Empty
			ENDIF
			SELF:lFromText := FALSE
		ENDIF
		RETURN
	END SET
END PROPERTY
/****************************************************************************/
#ENDREGION    
END CLASS