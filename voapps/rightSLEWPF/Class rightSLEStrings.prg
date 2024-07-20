// rightSLEStrings.prg

BEGIN NAMESPACE wmGUI.wpf

STATIC CLASS rightSLEStrings
    Static Export Today         AS String
    Static Export Cut           AS String
    Static Export Copy          As String
    Static Export Paste         As String
    Static Export Undo          As String
    Static Export Calendar      AS String
    Static Export Calculator    AS String
    Static CONSTRUCTOR()
        Today       := "Today"
        Cut         := "Cut"
        Copy        := "Copy"
        Paste       := "Paste"
        Undo        := "Undo"
        Calendar    := "Calendar"        
        Calculator  := "Calculator"
        RETURN
   END CLASS     
   
END NAMESPACE // wmGui.wpf
   