
CLASS _dlgPECalendar INHERIT System.Windows.Forms.Form
    
    PROTECTED INSTANCE oCalendar AS wmGUI.Calendar
    PRIVATE INSTANCE components AS System.ComponentModel.IContainer
    
    CONSTRUCTOR()
      SUPER()
      SELF:InitializeComponent()
      RETURN
    
   /// <summary>
   /// Clean up any resources being used.
   /// </summary>
   /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    PROTECTED VIRTUAL METHOD Dispose( disposing AS LOGIC ) AS VOID
      IF disposing && components != NULL
         components:Dispose()
      ENDIF
      SUPER:Dispose( disposing )
      RETURN
    
   /// <summary>
   /// Required method for Designer support - do not modify
   /// the contents of this method with the code editor.
   /// </summary>
    PRIVATE METHOD InitializeComponent() AS VOID
        SELF:oCalendar := wmGUI.Calendar{}
        SELF:SuspendLayout()
        // 
        // oCalendar
        // 
        SELF:oCalendar:Location := System.Drawing.Point{0, 0}
        SELF:oCalendar:Name := "oCalendar"
        SELF:oCalendar:Size := System.Drawing.Size{227, 140}
        SELF:oCalendar:TabIndex := 0
        // 
        // _dlgPECalendar
        // 
        SELF:AutoScaleDimensions := System.Drawing.SizeF{((Single) 6), ((Single) 13)}
        SELF:AutoScaleMode := System.Windows.Forms.AutoScaleMode.Font
        SELF:ClientSize := System.Drawing.Size{223, 139}
        SELF:Controls:Add(SELF:oCalendar)
        SELF:FormBorderStyle := System.Windows.Forms.FormBorderStyle.Fixed3D
        SELF:MaximizeBox := FALSE
        SELF:MinimizeBox := FALSE
        SELF:Name := "_dlgPECalendar"
        SELF:Text := "Calendar"
        SELF:ResumeLayout(FALSE)

END CLASS
