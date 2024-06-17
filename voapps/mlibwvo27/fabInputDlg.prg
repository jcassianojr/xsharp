// InputDlg.prg
USING System.Windows.Forms


FUNCTION FabInputBox( 	cCaption AS STRING, ;
						cPrompt AS STRING, ;
						cDefault AS STRING, ;
						lCentered := TRUE AS LOGIC, ;
						cOk := "&Ok" AS STRING, ;
						cCancel := "&Cancel" AS STRING, ;
						oOwner := NIL AS USUAL ) AS STRING
/// <summary> 
/// Provide an Easy-to-use Input box.
/// The function will draw a dialogbox, using the desired string, and return the result of the input.
/// </summary>
/// <params>
/// <cCaption> is a string with the DialogBox Caption\line
/// <cPrompt> is a string with the DialogBox cPrompt \line
/// <cDefault> is a string with the default value \line
/// <lCentered> is a logic value indicating if the DialogBox must be centered\line
/// <cOk> is a string with the caption of the Ok button. ( &Ok per default )\line
/// <cCancel> is a string with the caption of the Cancel button. ( &Cancel per default )\line
/// </params>
/// <return>
/// The TextValue of the SingleLineEdit control if the Ok button has been pressed, the Default value unless.
/// </return>
	LOCAL oDlg	AS	FabTools.FabInputDlg
	LOCAL cRet	AS	STRING
	LOCAL Result AS DialogResult
	//
	oDlg := FabTools.FabInputDlg{ cPrompt, cCaption }
	//
	oDlg:txtInput:Text := cDefault
	oDlg:btnOk:Text := cOk
	oDlg:btnCancel:Text := cCancel
	IF lCentered
		FabCenterWindow( oDlg )
	ENDIF
	//
	Result := oDlg:ShowDialog()
	IF ( Result == DialogResult.OK )
		cRet := AllTrim( oDlg:txtInput:Text )
	ELSE
		cRet := cDefault
	ENDIF
RETURN cRet


BEGIN NAMESPACE FabTools

    CLASS FabInputDlg INHERIT System.Windows.Forms.Form
        // Fields
        EXPORT btnCancel AS System.Windows.Forms.Button
        EXPORT btnOK AS System.Windows.Forms.Button
        PRIVATE lblPrompt AS System.Windows.Forms.Label
        EXPORT txtInput AS System.Windows.Forms.TextBox

        // Methods
        CONSTRUCTOR(prompt AS STRING, title AS STRING)
            SUPER()
            //
            SELF:Initx(prompt, title, System.Int32.MinValue, System.Int32.MinValue)


        CONSTRUCTOR(prompt AS STRING, title AS STRING, xPos AS LONG, yPos AS LONG)
            SUPER()
            //
            SELF:Initx(prompt, title, xPos,  yPos)
            
        PRIVATE METHOD Initx(prompt AS STRING, title AS STRING, xPos AS LONG, yPos AS LONG) AS VOID
            LOCAL size AS System.Drawing.SizeF
            //
            IF ((xPos != System.Int32.MinValue) .and. (yPos != System.Int32.MinValue))
                //
                SUPER:StartPosition := System.Windows.Forms.FormStartPosition.Manual
                SUPER:Location := System.Drawing.Point{xPos, yPos}
            ENDIF
            // Build Dialog
            SELF:InitializeComponent()
            //
            SELF:lblPrompt:Text := prompt
            SELF:Text := title
            //
            size := SUPER:CreateGraphics():MeasureString(prompt, SELF:lblPrompt:Font, SELF:lblPrompt:Width)
            //
            IF (size:Height > SELF:lblPrompt:Height)
                //
                SUPER:Height := SUPER:Height + ((LONG)size:Height  - SELF:lblPrompt:Height)
            ENDIF
            SELF:txtInput:SelectionStart := 0
            SELF:txtInput:SelectionLength := SELF:txtInput:Text:Length
            SELF:txtInput:Focus()

        PRIVATE METHOD InitializeComponent() AS VOID
            //
            SELF:lblPrompt := System.Windows.Forms.Label{}
            SELF:txtInput := System.Windows.Forms.TextBox{}
            SELF:btnOK := System.Windows.Forms.Button{}
            SELF:btnCancel := System.Windows.Forms.Button{}
            SUPER:SuspendLayout()
            SELF:lblPrompt:Anchor := (System.Windows.Forms.AnchorStyles.Left | (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Top))
            SELF:lblPrompt:BackColor := System.Drawing.SystemColors.Control
            SELF:lblPrompt:Font := System.Drawing.Font{"Microsoft Sans Serif", 8.25, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, 0}
            SELF:lblPrompt:Location := System.Drawing.Point{12, 9}
            SELF:lblPrompt:Name := "lblPrompt"
            SELF:lblPrompt:Size := System.Drawing.Size{0x12e, 0x47}
            SELF:lblPrompt:TabIndex := 3
            SELF:txtInput:Anchor := (System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Bottom)
            SELF:txtInput:Location := System.Drawing.Point{8, 0x58}
            SELF:txtInput:Name := "txtInput"
            SELF:txtInput:Size := System.Drawing.Size{0x17d, 20}
            SELF:txtInput:TabIndex := 0
            SELF:txtInput:Text := ""
            SELF:btnOK:DialogResult := System.Windows.Forms.DialogResult.OK
            SELF:btnOK:Location := System.Drawing.Point{0x146, 8}
            SELF:btnOK:Name := "btnOK"
            SELF:btnOK:Size := System.Drawing.Size{0x40, 0x18}
            SELF:btnOK:TabIndex := 1
            SELF:btnOK:Text := "&OK"
            SELF:btnCancel:DialogResult := System.Windows.Forms.DialogResult.Cancel
            SELF:btnCancel:Location := System.Drawing.Point{0x146, 40}
            SELF:btnCancel:Name := "btnCancel"
            SELF:btnCancel:Size := System.Drawing.Size{0x40, 0x18}
            SELF:btnCancel:TabIndex := 2
            SELF:btnCancel:Text := "&Cancel"
            SUPER:AcceptButton := SELF:btnOK
            SELF:AutoScaleBaseSize := System.Drawing.Size{5, 13}
            SUPER:CancelButton := SELF:btnCancel
            SUPER:ClientSize := System.Drawing.Size{0x18e, 0x75}
            SUPER:Controls:Add(SELF:txtInput)
            SUPER:Controls:Add(SELF:btnCancel)
            SUPER:Controls:Add(SELF:btnOK)
            SUPER:Controls:Add(SELF:lblPrompt)
            SUPER:FormBorderStyle := System.Windows.Forms.FormBorderStyle.FixedDialog
            SUPER:MaximizeBox := FALSE
            SUPER:MinimizeBox := FALSE
            SUPER:Name := "FabInputDlg"
            SUPER:ResumeLayout(FALSE)


    END CLASS

END NAMESPACE // FabTools
