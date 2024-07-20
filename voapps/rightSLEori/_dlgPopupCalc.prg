
CLASS _dlgPopupCalc INHERIT System.Windows.Forms.Form
    
    PROTECTED BMemRecall AS System.Windows.Forms.Button
    PROTECTED BMemPlus AS System.Windows.Forms.Button
    PROTECTED BMemMinus AS System.Windows.Forms.Button
    PROTECTED BMemTimes AS System.Windows.Forms.Button
    PROTECTED BMemClear AS System.Windows.Forms.Button
    PROTECTED BPower AS System.Windows.Forms.Button
    PROTECTED BPercent AS System.Windows.Forms.Button
    PROTECTED BPlusMinus AS System.Windows.Forms.Button
    PROTECTED BSquareRoot AS System.Windows.Forms.Button
    PROTECTED BInvert AS System.Windows.Forms.Button
    PROTECTED B7 AS System.Windows.Forms.Button
    PROTECTED B8 AS System.Windows.Forms.Button
    PROTECTED B9 AS System.Windows.Forms.Button
    PROTECTED Btimes AS System.Windows.Forms.Button
    PROTECTED BClearEntry AS System.Windows.Forms.Button
    PROTECTED B4 AS System.Windows.Forms.Button
    PROTECTED B5 AS System.Windows.Forms.Button
    PROTECTED B6 AS System.Windows.Forms.Button
    PROTECTED Bdivide AS System.Windows.Forms.Button
    PROTECTED BClear AS System.Windows.Forms.Button
    PROTECTED B1 AS System.Windows.Forms.Button
    PROTECTED B2 AS System.Windows.Forms.Button
    PROTECTED B3 AS System.Windows.Forms.Button
    PROTECTED BMinus AS System.Windows.Forms.Button
    PROTECTED B0 AS System.Windows.Forms.Button
    PROTECTED BEquals AS System.Windows.Forms.Button
    PROTECTED BDot AS System.Windows.Forms.Button
    PROTECTED BPlus AS System.Windows.Forms.Button
    PROTECTED QuitButton AS System.Windows.Forms.Button
    PROTECTED SaveExitButton AS System.Windows.Forms.Button
    PROTECTED txtCalcSLE AS System.Windows.Forms.TextBox
    PROTECTED ftMemory AS System.Windows.Forms.Label
    PRIVATE components AS System.ComponentModel.IContainer
    CONSTRUCTOR()
      SUPER()
      SELF:InitializeComponent()
      RETURN
    
   /// <summary>
   /// Clean up any resources being used.
   /// </summary>
   /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    PROTECTED VIRTUAL METHOD Dispose( disposing AS System.Boolean ) AS System.Void
      IF disposing && components != NULL
         components:Dispose()
      ENDIF
      SUPER:Dispose( disposing )
      RETURN
    
   /// <summary>
   /// Required method for Designer support - do not modify
   /// the contents of this method with the code editor.
   /// </summary>
    PRIVATE METHOD InitializeComponent() AS System.Void
        SELF:ftMemory := System.Windows.Forms.Label{}
        SELF:BMemRecall := System.Windows.Forms.Button{}
        SELF:BMemPlus := System.Windows.Forms.Button{}
        SELF:BMemMinus := System.Windows.Forms.Button{}
        SELF:BMemTimes := System.Windows.Forms.Button{}
        SELF:BMemClear := System.Windows.Forms.Button{}
        SELF:BPower := System.Windows.Forms.Button{}
        SELF:BPercent := System.Windows.Forms.Button{}
        SELF:BPlusMinus := System.Windows.Forms.Button{}
        SELF:BSquareRoot := System.Windows.Forms.Button{}
        SELF:BInvert := System.Windows.Forms.Button{}
        SELF:B7 := System.Windows.Forms.Button{}
        SELF:B8 := System.Windows.Forms.Button{}
        SELF:B9 := System.Windows.Forms.Button{}
        SELF:Btimes := System.Windows.Forms.Button{}
        SELF:BClearEntry := System.Windows.Forms.Button{}
        SELF:B4 := System.Windows.Forms.Button{}
        SELF:B5 := System.Windows.Forms.Button{}
        SELF:B6 := System.Windows.Forms.Button{}
        SELF:Bdivide := System.Windows.Forms.Button{}
        SELF:BClear := System.Windows.Forms.Button{}
        SELF:B1 := System.Windows.Forms.Button{}
        SELF:B2 := System.Windows.Forms.Button{}
        SELF:B3 := System.Windows.Forms.Button{}
        SELF:BMinus := System.Windows.Forms.Button{}
        SELF:B0 := System.Windows.Forms.Button{}
        SELF:BDot := System.Windows.Forms.Button{}
        SELF:BPlus := System.Windows.Forms.Button{}
        SELF:QuitButton := System.Windows.Forms.Button{}
        SELF:SaveExitButton := System.Windows.Forms.Button{}
        SELF:BEquals := System.Windows.Forms.Button{}
        SELF:txtCalcSLE := System.Windows.Forms.TextBox{}
        SELF:SuspendLayout()
        // 
        // ftMemory
        // 
        SELF:ftMemory:AutoSize := TRUE
        SELF:ftMemory:Location := System.Drawing.Point{103, 45}
        SELF:ftMemory:Name := "ftMemory"
        SELF:ftMemory:Size := System.Drawing.Size{84, 13}
        SELF:ftMemory:TabIndex := 1
        SELF:ftMemory:Text := "Memory Content"
        SELF:ftMemory:TextAlign := System.Drawing.ContentAlignment.TopRight
        // 
        // BMemRecall
        // 
        SELF:BMemRecall:Location := System.Drawing.Point{3, 73}
        SELF:BMemRecall:Name := "BMemRecall"
        SELF:BMemRecall:Size := System.Drawing.Size{32, 23}
        SELF:BMemRecall:TabIndex := 2
        SELF:BMemRecall:Text := "MR"
        SELF:BMemRecall:UseVisualStyleBackColor := TRUE
        // 
        // BMemPlus
        // 
        SELF:BMemPlus:Location := System.Drawing.Point{41, 73}
        SELF:BMemPlus:Name := "BMemPlus"
        SELF:BMemPlus:Size := System.Drawing.Size{33, 23}
        SELF:BMemPlus:TabIndex := 3
        SELF:BMemPlus:Text := "M+"
        SELF:BMemPlus:UseVisualStyleBackColor := TRUE
        // 
        // BMemMinus
        // 
        SELF:BMemMinus:Location := System.Drawing.Point{80, 73}
        SELF:BMemMinus:Name := "BMemMinus"
        SELF:BMemMinus:Size := System.Drawing.Size{33, 23}
        SELF:BMemMinus:TabIndex := 4
        SELF:BMemMinus:Text := "M-"
        SELF:BMemMinus:UseVisualStyleBackColor := TRUE
        // 
        // BMemTimes
        // 
        SELF:BMemTimes:Location := System.Drawing.Point{119, 73}
        SELF:BMemTimes:Name := "BMemTimes"
        SELF:BMemTimes:Size := System.Drawing.Size{33, 23}
        SELF:BMemTimes:TabIndex := 5
        SELF:BMemTimes:Text := "Mx"
        SELF:BMemTimes:UseVisualStyleBackColor := TRUE
        // 
        // BMemClear
        // 
        SELF:BMemClear:Location := System.Drawing.Point{158, 73}
        SELF:BMemClear:Name := "BMemClear"
        SELF:BMemClear:Size := System.Drawing.Size{33, 23}
        SELF:BMemClear:TabIndex := 6
        SELF:BMemClear:Text := "MC"
        SELF:BMemClear:UseVisualStyleBackColor := TRUE
        // 
        // BPower
        // 
        SELF:BPower:Location := System.Drawing.Point{3, 102}
        SELF:BPower:Name := "BPower"
        SELF:BPower:Size := System.Drawing.Size{33, 23}
        SELF:BPower:TabIndex := 7
        SELF:BPower:Text := "^"
        SELF:BPower:UseVisualStyleBackColor := TRUE
        // 
        // BPercent
        // 
        SELF:BPercent:Location := System.Drawing.Point{42, 102}
        SELF:BPercent:Name := "BPercent"
        SELF:BPercent:Size := System.Drawing.Size{33, 23}
        SELF:BPercent:TabIndex := 8
        SELF:BPercent:Text := "%"
        SELF:BPercent:UseVisualStyleBackColor := TRUE
        // 
        // BPlusMinus
        // 
        SELF:BPlusMinus:Location := System.Drawing.Point{80, 102}
        SELF:BPlusMinus:Name := "BPlusMinus"
        SELF:BPlusMinus:Size := System.Drawing.Size{33, 23}
        SELF:BPlusMinus:TabIndex := 9
        SELF:BPlusMinus:Text := "+/-"
        SELF:BPlusMinus:UseVisualStyleBackColor := TRUE
        // 
        // BSquareRoot
        // 
        SELF:BSquareRoot:Location := System.Drawing.Point{120, 102}
        SELF:BSquareRoot:Name := "BSquareRoot"
        SELF:BSquareRoot:Size := System.Drawing.Size{33, 23}
        SELF:BSquareRoot:TabIndex := 10
        SELF:BSquareRoot:Text := "Sq"
        SELF:BSquareRoot:UseVisualStyleBackColor := TRUE
        // 
        // BInvert
        // 
        SELF:BInvert:Location := System.Drawing.Point{159, 102}
        SELF:BInvert:Name := "BInvert"
        SELF:BInvert:Size := System.Drawing.Size{33, 23}
        SELF:BInvert:TabIndex := 11
        SELF:BInvert:Text := "1/x"
        SELF:BInvert:UseVisualStyleBackColor := TRUE
        // 
        // B7
        // 
        SELF:B7:Location := System.Drawing.Point{2, 129}
        SELF:B7:Name := "B7"
        SELF:B7:Size := System.Drawing.Size{33, 26}
        SELF:B7:TabIndex := 12
        SELF:B7:Text := "7"
        SELF:B7:UseVisualStyleBackColor := TRUE
        // 
        // B8
        // 
        SELF:B8:Location := System.Drawing.Point{41, 129}
        SELF:B8:Name := "B8"
        SELF:B8:Size := System.Drawing.Size{33, 26}
        SELF:B8:TabIndex := 13
        SELF:B8:Text := "8"
        SELF:B8:UseVisualStyleBackColor := TRUE
        // 
        // B9
        // 
        SELF:B9:Location := System.Drawing.Point{80, 129}
        SELF:B9:Name := "B9"
        SELF:B9:Size := System.Drawing.Size{33, 26}
        SELF:B9:TabIndex := 14
        SELF:B9:Text := "9"
        SELF:B9:UseVisualStyleBackColor := TRUE
        // 
        // Btimes
        // 
        SELF:Btimes:Location := System.Drawing.Point{119, 129}
        SELF:Btimes:Name := "Btimes"
        SELF:Btimes:Size := System.Drawing.Size{33, 26}
        SELF:Btimes:TabIndex := 15
        SELF:Btimes:Text := "x"
        SELF:Btimes:UseVisualStyleBackColor := TRUE
        // 
        // BClearEntry
        // 
        SELF:BClearEntry:Location := System.Drawing.Point{158, 129}
        SELF:BClearEntry:Name := "BClearEntry"
        SELF:BClearEntry:Size := System.Drawing.Size{33, 26}
        SELF:BClearEntry:TabIndex := 16
        SELF:BClearEntry:Text := "CE"
        SELF:BClearEntry:UseVisualStyleBackColor := TRUE
        // 
        // B4
        // 
        SELF:B4:Location := System.Drawing.Point{2, 158}
        SELF:B4:Name := "B4"
        SELF:B4:Size := System.Drawing.Size{33, 26}
        SELF:B4:TabIndex := 17
        SELF:B4:Text := "4"
        SELF:B4:UseVisualStyleBackColor := TRUE
        // 
        // B5
        // 
        SELF:B5:Location := System.Drawing.Point{41, 158}
        SELF:B5:Name := "B5"
        SELF:B5:Size := System.Drawing.Size{33, 26}
        SELF:B5:TabIndex := 18
        SELF:B5:Text := "5"
        SELF:B5:UseVisualStyleBackColor := TRUE
        // 
        // B6
        // 
        SELF:B6:Location := System.Drawing.Point{80, 158}
        SELF:B6:Name := "B6"
        SELF:B6:Size := System.Drawing.Size{33, 26}
        SELF:B6:TabIndex := 19
        SELF:B6:Text := "6"
        SELF:B6:UseVisualStyleBackColor := TRUE
        // 
        // Bdivide
        // 
        SELF:Bdivide:Location := System.Drawing.Point{118, 158}
        SELF:Bdivide:Name := "Bdivide"
        SELF:Bdivide:Size := System.Drawing.Size{33, 26}
        SELF:Bdivide:TabIndex := 20
        SELF:Bdivide:Text := "/"
        SELF:Bdivide:UseVisualStyleBackColor := TRUE
        // 
        // BClear
        // 
        SELF:BClear:Location := System.Drawing.Point{157, 158}
        SELF:BClear:Name := "BClear"
        SELF:BClear:Size := System.Drawing.Size{33, 26}
        SELF:BClear:TabIndex := 21
        SELF:BClear:Text := "C"
        SELF:BClear:UseVisualStyleBackColor := TRUE
        // 
        // B1
        // 
        SELF:B1:Location := System.Drawing.Point{2, 187}
        SELF:B1:Name := "B1"
        SELF:B1:Size := System.Drawing.Size{33, 26}
        SELF:B1:TabIndex := 22
        SELF:B1:Text := "1"
        SELF:B1:UseVisualStyleBackColor := TRUE
        // 
        // B2
        // 
        SELF:B2:Location := System.Drawing.Point{41, 187}
        SELF:B2:Name := "B2"
        SELF:B2:Size := System.Drawing.Size{33, 26}
        SELF:B2:TabIndex := 23
        SELF:B2:Text := "2"
        SELF:B2:UseVisualStyleBackColor := TRUE
        // 
        // B3
        // 
        SELF:B3:Location := System.Drawing.Point{80, 187}
        SELF:B3:Name := "B3"
        SELF:B3:Size := System.Drawing.Size{33, 26}
        SELF:B3:TabIndex := 24
        SELF:B3:Text := "3"
        SELF:B3:UseVisualStyleBackColor := TRUE
        // 
        // BMinus
        // 
        SELF:BMinus:Location := System.Drawing.Point{119, 187}
        SELF:BMinus:Name := "BMinus"
        SELF:BMinus:Size := System.Drawing.Size{33, 26}
        SELF:BMinus:TabIndex := 25
        SELF:BMinus:Text := "-"
        SELF:BMinus:UseVisualStyleBackColor := TRUE
        // 
        // B0
        // 
        SELF:B0:Location := System.Drawing.Point{2, 216}
        SELF:B0:Name := "B0"
        SELF:B0:Size := System.Drawing.Size{71, 26}
        SELF:B0:TabIndex := 26
        SELF:B0:Text := "0"
        SELF:B0:UseVisualStyleBackColor := TRUE
        // 
        // BDot
        // 
        SELF:BDot:Location := System.Drawing.Point{80, 216}
        SELF:BDot:Name := "BDot"
        SELF:BDot:Size := System.Drawing.Size{33, 26}
        SELF:BDot:TabIndex := 27
        SELF:BDot:Text := "."
        SELF:BDot:UseVisualStyleBackColor := TRUE
        // 
        // BPlus
        // 
        SELF:BPlus:Location := System.Drawing.Point{119, 216}
        SELF:BPlus:Name := "BPlus"
        SELF:BPlus:Size := System.Drawing.Size{33, 26}
        SELF:BPlus:TabIndex := 28
        SELF:BPlus:Text := "+"
        SELF:BPlus:UseVisualStyleBackColor := TRUE
        // 
        // QuitButton
        // 
        SELF:QuitButton:DialogResult := System.Windows.Forms.DialogResult.Cancel
        SELF:QuitButton:Location := System.Drawing.Point{1, 261}
        SELF:QuitButton:Name := "QuitButton"
        SELF:QuitButton:Size := System.Drawing.Size{72, 26}
        SELF:QuitButton:TabIndex := 29
        SELF:QuitButton:Text := "Quit"
        SELF:QuitButton:UseVisualStyleBackColor := TRUE
        // 
        // SaveExitButton
        // 
        SELF:SaveExitButton:Location := System.Drawing.Point{104, 261}
        SELF:SaveExitButton:Name := "SaveExitButton"
        SELF:SaveExitButton:Size := System.Drawing.Size{83, 26}
        SELF:SaveExitButton:TabIndex := 30
        SELF:SaveExitButton:Text := "Save / Exit"
        SELF:SaveExitButton:UseVisualStyleBackColor := TRUE
        // 
        // BEquals
        // 
        SELF:BEquals:Location := System.Drawing.Point{157, 187}
        SELF:BEquals:Name := "BEquals"
        SELF:BEquals:Size := System.Drawing.Size{33, 55}
        SELF:BEquals:TabIndex := 31
        SELF:BEquals:Text := "="
        SELF:BEquals:UseVisualStyleBackColor := TRUE
        // 
        // txtCalcSLE
        // 
        SELF:txtCalcSLE:Location := System.Drawing.Point{3, 12}
        SELF:txtCalcSLE:Name := "txtCalcSLE"
        SELF:txtCalcSLE:Size := System.Drawing.Size{187, 20}
        SELF:txtCalcSLE:TabIndex := 1
        SELF:txtCalcSLE:TextAlign := System.Windows.Forms.HorizontalAlignment.Right
        // 
        // _dlgPopupCalc
        // 
        SELF:AcceptButton := SELF:SaveExitButton
        SELF:AutoScaleDimensions := System.Drawing.SizeF{((Single) 6), ((Single) 13)}
        SELF:AutoScaleMode := System.Windows.Forms.AutoScaleMode.Font
        SELF:BackColor := System.Drawing.SystemColors.Control
        SELF:CancelButton := SELF:QuitButton
        SELF:ClientSize := System.Drawing.Size{198, 296}
        SELF:Controls:Add(SELF:txtCalcSLE)
        SELF:Controls:Add(SELF:BEquals)
        SELF:Controls:Add(SELF:SaveExitButton)
        SELF:Controls:Add(SELF:QuitButton)
        SELF:Controls:Add(SELF:BPlus)
        SELF:Controls:Add(SELF:BDot)
        SELF:Controls:Add(SELF:B0)
        SELF:Controls:Add(SELF:BMinus)
        SELF:Controls:Add(SELF:B3)
        SELF:Controls:Add(SELF:B2)
        SELF:Controls:Add(SELF:B1)
        SELF:Controls:Add(SELF:BClear)
        SELF:Controls:Add(SELF:Bdivide)
        SELF:Controls:Add(SELF:B6)
        SELF:Controls:Add(SELF:B5)
        SELF:Controls:Add(SELF:B4)
        SELF:Controls:Add(SELF:BClearEntry)
        SELF:Controls:Add(SELF:Btimes)
        SELF:Controls:Add(SELF:B9)
        SELF:Controls:Add(SELF:B8)
        SELF:Controls:Add(SELF:B7)
        SELF:Controls:Add(SELF:BInvert)
        SELF:Controls:Add(SELF:BSquareRoot)
        SELF:Controls:Add(SELF:BPlusMinus)
        SELF:Controls:Add(SELF:BPercent)
        SELF:Controls:Add(SELF:BPower)
        SELF:Controls:Add(SELF:BMemClear)
        SELF:Controls:Add(SELF:BMemTimes)
        SELF:Controls:Add(SELF:BMemMinus)
        SELF:Controls:Add(SELF:BMemPlus)
        SELF:Controls:Add(SELF:BMemRecall)
        SELF:Controls:Add(SELF:ftMemory)
        SELF:MaximizeBox := FALSE
        SELF:MinimizeBox := FALSE
        SELF:Name := "_dlgPopupCalc"
        SELF:Text := "Calculator"
        SELF:ResumeLayout(FALSE)
        SELF:PerformLayout()

END CLASS
