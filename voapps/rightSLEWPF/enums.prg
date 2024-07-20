// enums.prg
/****************************************************************************/
ENUM KeyHandling
	Auto
	Process
	Ignore
END ENUM	

/****************************************************************************/
ENUM SLEType
    Auto    
    Character
    Numeric  
    @@Date 
    @@Logic
END ENUM

/****************************************************************************/
ENUM focusBehavior
 Auto
 Home
 @@End
 All
 Trimmed  
 Numeric
 RememberLast    
END ENUM 

/****************************************************************************/
ENUM overwriteBehavior
    Auto
    Always
    Never
    Onkey
END ENUM    

/****************************************************************************/
ENUM scrlModeBehavior
    Auto
    Full
    Part
    No
END ENUM    

/****************************************************************************/
ENUM CalendarDoubleClickBehavior
    Auto
    Today
    Calendar
END ENUM   

/****************************************************************************/
ENUM TemplateInfo
    LeftJust    := 1
    DispCR      := 2
    SetDate     := 3
    BritDate    := 4
    InsNonTemp  := 5
    DispDB      := 6
    ZeroBlank   := 7
    NegInParen  := 8
    ConvUpper   := 9
    AlphaOnly   := 10
    DEFAULT_STRING_TEMPL_SIZE := 128
END ENUM

/****************************************************************************/
ENUM FileType
	Auto
	OpenDialog
	SaveDialog
END ENUM	
/****************************************************************************/
ENUM ImageHandling
    Auto
    InternalBitMap
    CustomBitmap
END ENUM