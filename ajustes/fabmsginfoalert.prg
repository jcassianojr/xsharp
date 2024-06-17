// Messages.prg
USING System.Windows.Forms
FUNCTION FabMessageInfo( cText AS STRING, cTitle AS STRING ) AS VOID
    //
    IF Empty(cTEXT)
        cText := ""
    ENDIF
    IF Empty(cTITLE)
        cTitle := "Informacao"
    ENDIF
    //
    MessageBox.Show( cText, cTitle, MessageBoxButtons.OK, MessageBoxIcon.Information )
RETURN
FUNCTION FabMessageAlert( cText AS STRING, cTitle AS STRING ) AS VOID
    //
    IF Empty(cTEXT)
        cText := ""
    ENDIF
    IF Empty(cTITLE)
        cTitle := "Atencao"
    ENDIF
    //
    MessageBox.Show( cText, cTitle, MessageBoxButtons.OK, MessageBoxIcon.Exclamation )
RETURN 
FUNCTION FabMessageError( cText AS STRING, cTitle AS STRING ) AS VOID
    //
    IF Empty(cTEXT)
        cText := ""
    ENDIF
    IF Empty(cTITLE)
        cTitle := "Erro"
    ENDIF
    //
    MessageBox.Show( cText, cTitle, MessageBoxButtons.OK, MessageBoxIcon.Error )
RETURN  
        

FUNCTION FabMessageStop( cText AS STRING, cTitle AS STRING ) AS VOID
    //
    IF Empty(cTEXT)
        cText := ""
    ENDIF
    IF Empty(cTITLE)
        cTitle := "Parada"
    ENDIF
    //
    MessageBox.Show( cText, cTitle, MessageBoxButtons.OK, MessageBoxIcon.Stop )
RETURN  
                          
FUNCTION MsgAlert( cText, cTitle ) 
   IF Empty(cTEXT)
        cText := ""
    ENDIF
    IF Empty(cTITLE)
        cTitle := "Atencao"
    ENDIF
FabMessageAlert( cText, cTitle )
FUNCTION MsgErro ( cText, cTitle )  
   IF Empty(cTEXT)
        cText := ""
    ENDIF
    IF Empty(cTITLE)
        cTitle := "Erro"
    ENDIF
FabMessageError( cText, cTitle )	
FUNCTION MsgInfo( CText, cTitle )  
   IF Empty(cTEXT)
        cText := ""
    ENDIF
    IF Empty(cTITLE)
        cTitle := "Atencao"
    ENDIF
FabMessageInfo( cText, cTitle )       
FUNCTION MsgsStop( CText, cTitle )  
   IF Empty(cTEXT)
        cText := ""
    ENDIF
    IF Empty(cTITLE)
        cTitle := "Atencao"
    ENDIF
FabMessageStop( cText, cTitle )       

FUNCTION Alert(CText, cTitle)
   IF Empty(cTEXT)
        cText := ""
    ENDIF
    IF Empty(cTITLE)
        cTitle := "Atencao"
    ENDIF
FabMessageAlert( cText, cTitle )
RETURN .T.

FUNCTION AlertX(CText, cTitle)
   IF Empty(cTEXT)
        cText := ""
    ENDIF
    IF Empty(cTITLE)
        cTitle := "Atencao"
    ENDIF
FabMessageAlert( cText, cTitle )
RETURN .T.
                                                          

