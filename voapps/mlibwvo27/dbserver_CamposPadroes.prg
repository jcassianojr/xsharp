CLASS cep_field INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 
    LOCAL   cPict                   AS STRING

    SUPER( HyperLabel{#cep_field, "", "", "" },  "C", 9, 0 )
    cPict       := "99999-999"
    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF

    RETURN SELF



END CLASS
CLASS date_field INHERIT FIELDSPEC



CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #DATAINI

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "D", 8, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS ddd_field INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #ddd_field

    cPict       := "999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "C", 3, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS EMAIL_FIELD INHERIT FIELDSPEC



CONSTRUCTOR() 
    LOCAL   cPict                   AS STRING

    SUPER( HyperLabel{#EMAIL_FIELD, "60 Characters", "", "EMAIL_FIED" },  "C", 60, 0 )
    cPict       := ""
    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF

    RETURN SELF



END CLASS
CLASS LOGIC_FIELD INHERIT FIELDSPEC

CONSTRUCTOR() 

    LOCAL   oHlTemp                           AS OBJECT
    LOCAL   cPict         := ""       AS STRING
    LOCAL   nMinLen       := -1          AS INT
    LOCAL   lRequired     := .F.        AS LOGIC
    LOCAL   symHlName     := #DONE        AS SYMBOL
    LOCAL   cTypeDiag     := ""      AS STRING
    LOCAL   cTypeHelp     := ""      AS STRING
    LOCAL   cLenDiag      := ""       AS STRING
    LOCAL   cLenHelp      := ""       AS STRING
    LOCAL   cMinLenDiag   := ""    AS STRING
    LOCAL   cMinLenHelp   := ""    AS STRING
    LOCAL   cRangeDiag    := ""     AS STRING
    LOCAL   cRangeHelp    := ""     AS STRING
    LOCAL   cReqDiag      := ""       AS STRING
    LOCAL   cReqHelp      := ""       AS STRING
    LOCAL   cValidDiag    := ""     AS STRING
    LOCAL   cValidHelp    := ""     AS STRING
    LOCAL   nMinRange     := NIL        AS USUAL
    LOCAL   nMaxRange     := NIL        AS USUAL
    LOCAL   xValidation   := NIL      AS USUAL

    SUPER(HyperLabel{symHlName,"Logic Field","","LOGIC_FIELD"},"L",1,0)
    IF SLen(cPict) > 0
       SELF:Picture := cPict
    ENDIF
    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
       SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF
    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
       SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF
    IF nMinLen != -1
       IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
          oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }
          SELF:SetMinLength(nMinLen, oHlTemp)
       ELSE
          SELF:SetMinLength(nMinLen)
       ENDIF
    ENDIF
    IF !IsNil(nMinRange)  .OR. !IsNil(nMaxRange)
       IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
          oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
          SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
       ELSE
          SELF:SetRange(nMinRange, nMaxRange)
       ENDIF
    ENDIF
    IF !IsNil(xValidation)
       IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
          SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }
          SELF:SetValidation(xValidation, SELF:oHLValidation)
       ELSE
          SELF:SetValidation(xValidation)
       ENDIF
    ENDIF
    IF lRequired
       IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
          oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }
          SELF:SetRequired(lRequired, oHLTemp)
       ELSE
          SELF:SetRequired(lRequired)
       ENDIF
    ENDIF
RETURN SELF

END CLASS
CLASS MEMO_FIELD INHERIT FIELDSPEC

CONSTRUCTOR() 
    SUPER( HyperLabel{ #MEMO_FIELD, "Memo Field", "", "MEMO_FIELD" }, "M", 10, 0 )
    RETURN SELF


END CLASS
CLASS PADRAO_CHAR_01 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_01

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 01", "", "PADRAO_CHAR_01" },  "C", 1, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_02 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_02

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 02", "", "PADRAO_CHAR_02" },  "C", 2, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_03 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_03

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 03", "", "PADRAO_CHAR_03" },  "C", 3, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_04 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_04

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 04", "", "PADRAO_CHAR_04" },  "C", 4, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_05 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_05

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 05", "", "PADRAO_CHAR_05" },  "C", 5, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_06 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_06

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 06", "", "PADRAO_CHAR_06" },  "C", 6, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_07 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_07

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 07", "", "PADRAO_CHAR_07" },  "C", 7, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_08 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_08

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 08", "", "PADRAO_CHAR_08" },  "C", 8, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_09 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_09

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 09", "", "PADRAO_CHAR_09" },  "C", 9, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_10 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_10

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 10", "", "PADRAO_CHAR_10" },  "C", 10, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_100 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #PADRAO_CHAR_100

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "C", 100, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_CHAR_11 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_11

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 11", "", "PADRAO_CHAR_11" },  "C", 11, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_12 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_12

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 12", "", "PADRAO_CHAR_12" },  "C", 12, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_120 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #PADRAO_CHAR_120

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "C", 120, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_CHAR_13 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_13

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 13", "", "PADRAO_CHAR_13" },  "C", 13, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_14 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_14

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 14", "", "PADRAO_CHAR_14" },  "C", 14, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_15 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_15

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 15", "", "PADRAO_CHAR_15" },  "C", 15, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_150 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #PADRAO_CHAR_150

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "C", 150, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_CHAR_16 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_16

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 16", "", "PADRAO_CHAR_16" },  "C", 16, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_17 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_17

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 17", "", "PADRAO_CHAR_17" },  "C", 17, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_18 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_18

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 18", "", "PADRAO_CHAR_18" },  "C", 18, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_19 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_19

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 19", "", "PADRAO_CHAR_19" },  "C", 19, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_20 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_20

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 20", "", "PADRAO_CHAR_20" },  "C", 20, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_200 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_200

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 200", "", "PADRAO_CHAR_200" },  "C", 200, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_21 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_21

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 21", "", "PADRAO_CHAR_21" },  "C", 21, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_22 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_22

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 22", "", "PADRAO_CHAR_22" },  "C", 22, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_23 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_23

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 23", "", "PADRAO_CHAR_23" },  "C", 23, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_24 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_24

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 24", "", "PADRAO_CHAR_24" },  "C", 24, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_25 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_25

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 25", "", "PADRAO_CHAR_25" },  "C", 25, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_255 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_255

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 255", "", "PADRAO_CHAR_255" },  "C", 255, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_26 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_26

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 26", "", "PADRAO_CHAR_26" },  "C", 26, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_27 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_27

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 27", "", "PADRAO_CHAR_27" },  "C", 27, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_28 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_28

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 28", "", "PADRAO_CHAR_28" },  "C", 28, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_29 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_29

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 29", "", "PADRAO_CHAR_29" },  "C", 29, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_30 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_30

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 30", "", "PADRAO_CHAR_30" },  "C", 30, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_35 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_35

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 35", "", "PADRAO_CHAR_35" },  "C", 35, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_40 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_40

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 40", "", "PADRAO_CHAR_40" },  "C", 40, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_45 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_45

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 45", "", "PADRAO_CHAR_45" },  "C", 45, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_50 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_50

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 50", "", "PADRAO_CHAR_50" },  "C", 50, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_55 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_55

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 55", "", "PADRAO_CHAR_55" },  "C", 55, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_60 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_60

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 60", "", "PADRAO_CHAR_60" },  "C", 60, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_65 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_65

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 65", "", "PADRAO_CHAR_65" },  "C", 65, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_70 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_70

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 70", "", "PADRAO_CHAR_70" },  "C", 70, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_75 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_75

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 75", "", "PADRAO_CHAR_75" },  "C", 75, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_80 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #CHAR_80

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Char 80", "", "PADRAO_CHAR_80" },  "C", 80, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF
END CLASS
CLASS PADRAO_CHAR_90 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #PADRAO_CHAR_90

    cPict       := ""
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "C", 90, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_01 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_01

    cPict       := "9"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 01", "", "PADRAO_NUM_01" },  "N", 1, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_02 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_02

    cPict       := "99"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 02", "", "PADRAO_NUM_02" },  "N", 2, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_03 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_03

    cPict       := "999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 03", "", "PADRAO_NUM_03" },  "N", 3, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_04 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_04

    cPict       := "9999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 04", "", "PADRAO_NUM_04" },  "N", 4, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_04_2 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_04_2

    cPict       := "9.99"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 04 2", "", "PADRAO_NUM_04_2" },  "N", 4, 2 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_05 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_05

    cPict       := "99999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 05", "", "PADRAO_NUM_05" },  "N", 5, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_05_2 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_05_2

    cPict       := "99.99"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 05 2", "", "PADRAO_NUM_05_2" },  "N", 5, 2 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_05_3 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_05_3

    cPict       := "9.999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 05 3", "", "PADRAO_NUM_05_3" },  "N", 5, 3 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_06 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_06

    cPict       := "999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 06", "", "PADRAO_NUM_06" },  "N", 6, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_06_2 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_06_2

    cPict       := "999.99"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 06 2", "", "PADRAO_NUM_06_2" },  "N", 6, 2 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_06_3 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_06_3

    cPict       := "99.999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 06 3", "", "PADRAO_NUM_06_3" },  "N", 6, 3 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS padrao_num_06_4 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #padrao_num_06_4

    cPict       := "9.9999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 6, 4 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_07 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_07

    cPict       := "999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 07", "", "PADRAO_NUM_07" },  "N", 7, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_07_2 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_07_2

    cPict       := "9999.99"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 07 2", "", "PADRAO_NUM_07_2" },  "N", 7, 2 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_07_3 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #PADRAO_NUM_07_3

    cPict       := "999.999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 7, 3 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_07_4 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_07_4

    cPict       := "99.9999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 07 4", "", "PADRAO_NUM_07_4" },  "N", 7, 4 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS padrao_num_07_5 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #padrao_num_07_5

    cPict       := "9.99999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 7, 5 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_08 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_08

    cPict       := "99999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 08", "", "PADRAO_NUM_08" },  "N", 8, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_08_2 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_08_2

    cPict       := "99999.99"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 08 2", "", "PADRAO_NUM_08_2" },  "N", 8, 2 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_08_4 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_08_4

    cPict       := "999.9999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 08 4", "", "PADRAO_NUM_08_4" },  "N", 8, 4 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS padrao_num_08_5 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 
    LOCAL   cPict                   AS STRING

    SUPER( HyperLabel{#padrao_num_08_5, "", "", "" },  "N", 8, 5 )
    cPict       := "99.99999"
    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF

    RETURN SELF



END CLASS
CLASS PADRAO_NUM_09 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_09

    cPict       := "999999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 09", "", "PADRAO_NUM_09" },  "N", 9, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_09_2 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_09_2

    cPict       := "99999.99"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 09 2", "", "PADRAO_NUM_09_2" },  "N", 9, 2 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS padrao_num_09_3 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #padrao_num_09_3

    cPict       := "99999.999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 9, 3 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_09_4 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 
    LOCAL   cPict                   AS STRING

    SUPER( HyperLabel{#NUM_09_4, "Num 09 4", "", "PADRAO_NUM_09_4" },  "N", 9, 4 )
    cPict       := "9999.9999"
    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF

    RETURN SELF



END CLASS
CLASS PADRAO_NUM_09_5 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_09_5

    cPict       := "999.99999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 09 5", "", "PADRAO_NUM_09_5" },  "N", 9, 5 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_10 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_10

    cPict       := "9999999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 10", "", "PADRAO_NUM_10" },  "N", 10, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_10_2 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_10_2

    cPict       := "9999999.99"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 10 2", "", "PADRAO_NUM_10_2" },  "N", 10, 2 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_10_3 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #PADRAO_NUM_10_3

    cPict       := "999999.999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 10, 3 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_10_4 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #PADRAO_NUM_10_4

    cPict       := "99999.9999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 10, 4 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_10_5 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_10_5

    cPict       := "9999.99999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 10 5", "", "PADRAO_NUM_10_5" },  "N", 10, 5 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_10_7 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_10_7

    cPict       := "99.9999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 10 7", "", "PADRAO_NUM_10_7" },  "N", 10, 7 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_11 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_11

    cPict       := "99999999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 11", "", "PADRAO_NUM_11" },  "N", 11, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_11_2 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_11_2

    cPict       := "9999999.99"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 11 2", "", "PADRAO_NUM_11_2" },  "N", 11, 2 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS padrao_num_11_4 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #padrao_num_11_4

    cPict       := "999999.9999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 11, 4 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS padrao_num_11_5 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #padrao_num_11_5

    cPict       := "99999.99999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 11, 5 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_12 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_12

    cPict       := "999999999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 12", "", "PADRAO_NUM_12" },  "N", 12, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_12_2 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_12_2

    cPict       := "99999999.99"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 12 2", "", "PADRAO_NUM_12_2" },  "N", 12, 2 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_12_3 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #PADRAO_NUM_12_3

    cPict       := "99999999.999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 12, 3 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_12_4 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #PADRAO_NUM_12_4

    cPict       := "9999999.9999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 12, 4 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_12_6 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #PADRAO_NUM_12_6

    cPict       := "99999.999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 12, 6 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS padrao_num_12_8 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #padrao_num_12_8

    cPict       := "999.99999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 12, 8 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_13 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_13

    cPict       := "9999999999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 13", "", "PADRAO_NUM_13" },  "N", 13, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_14 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_14

    cPict       := "99999999999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 14", "", "PADRAO_NUM_14" },  "N", 14, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_15 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_15

    cPict       := "999999999999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 15", "", "PADRAO_NUM_15" },  "N", 15, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_15_6 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #PADRAO_NUM_15_6

    cPict       := "99999999.999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 15, 6 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_16 INHERIT FIELDSPEC
	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #NUM_16

    cPict       := "9999999999999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "Num 16", "", "PADRAO_NUM_16" },  "N", 16, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS PADRAO_NUM_16_6 INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #PADRAO_NUM_16_6

    cPict       := "999999999.999999"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "N", 16, 6 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS Time_Long INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #Time_Long

    cPict       := "99:99:99"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "C", 8, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS timespec INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #timespec

    cPict       := "99:99"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := ""
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := NIL
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "C", 4, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF





END CLASS
CLASS uf_field INHERIT FIELDSPEC



	//USER CODE STARTS HERE (do NOT remove this line)

CONSTRUCTOR() 

    LOCAL   oHlTemp                 AS OBJECT
    LOCAL   cPict                   AS STRING
    LOCAL   nMinLen                 AS INT
    LOCAL   lRequired               AS LOGIC
    LOCAL   symHlName               AS SYMBOL
    LOCAL   cTypeDiag               AS STRING
    LOCAL   cTypeHelp               AS STRING
    LOCAL   cLenDiag                AS STRING
    LOCAL   cLenHelp                AS STRING
    LOCAL   cMinLenDiag             AS STRING
    LOCAL   cMinLenHelp             AS STRING
    LOCAL   cRangeDiag              AS STRING
    LOCAL   cRangeHelp              AS STRING
    LOCAL   cReqDiag                AS STRING
    LOCAL   cReqHelp                AS STRING
    LOCAL   cValidDiag              AS STRING
    LOCAL   cValidHelp              AS STRING
    LOCAL   nMinRange               AS USUAL
    LOCAL   nMaxRange               AS USUAL
    LOCAL   xValidation             AS USUAL

    symHlName   := #uf_field

    cPict       := "!!"
    cTypeDiag   := ""
    cTypeHelp   := ""
    cLenDiag    := ""
    cLenHelp    := ""
    cMinLenDiag := ""
    cMinLenHelp := ""
    cRangeDiag  := ""
    cRangeHelp  := ""
    cValidDiag  := "Estado Invalido"
    cValidHelp  := ""
    cReqDiag    := ""
    cReqHelp    := ""

    nMinLen     := -1
    nMinRange   := NIL
    nMaxRange   := NIL
    xValidation := { | x | ufCheck( x ) } 
    lRequired   := .F.


    SUPER( HyperLabel{symHlName, "", "", "" },  "C", 2, 0 )


    IF SLen(cPict) > 0
        SELF:Picture := cPict
    ENDIF


    IF SLen(cTypeDiag) > 0  .OR. SLen(cTypeHelp) > 0
        SELF:oHLType := HyperLabel{symHlName,, cTypeDiag, cTypeHelp }
    ENDIF


    IF SLen(cLenDiag) > 0  .OR. SLen(cLenHelp) > 0
        SELF:oHLLength := HyperLabel{symHlName,, cLenDiag, cLenHelp }
    ENDIF


    IF nMinLen != -1
        IF SLen(cMinLenDiag) > 0  .OR. SLen(cMinLenHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cMinLenDiag, cMinLenHelp }

            SELF:SetMinLength(nMinLen, oHlTemp)
        ELSE
            SELF:SetMinLength(nMinLen)
        ENDIF
    ENDIF


    IF !IsNIL(nMinRange)  .OR. !IsNIL(nMaxRange)
        IF SLen(cRangeDiag) > 0  .OR. SLen(cRangeHelp) > 0
            oHlTemp := HyperLabel{symHlName,, cRangeDiag, cRangeHelp }
            SELF:SetRange(nMinRange, nMaxRange, oHlTemp)
        ELSE
            SELF:SetRange(nMinRange, nMaxRange)
        ENDIF
    ENDIF


    IF !IsNIL(xValidation)
        IF SLen(cValidDiag) > 0  .OR. SLen(cValidHelp) > 0
            SELF:oHLValidation:= HyperLabel{symHlName,, cValidDiag, cValidHelp }

            SELF:SetValidation(xValidation, SELF:oHLValidation)
        ELSE
            SELF:SetValidation(xValidation)
        ENDIF
    ENDIF


    IF lRequired
        IF SLen(cReqDiag) > 0  .OR. SLen(cReqHelp) > 0
            oHLTemp := HyperLabel{symHlName,, cReqDiag, cReqHelp }

            SELF:SetRequired(lRequired, oHLTemp)
        ELSE
            SELF:SetRequired(lRequired)
        ENDIF
    ENDIF


    RETURN SELF






END CLASS
